#include "TaskAnalysis.h"

//key:
//added for AR
//added for CEM

void TaskAnalysis::AnalyzeModule(Module &M){

    errs() << "\nSTARTING ANALYSIS\n"; 

    for (auto &F: M) {

        // do not analyze the task_commit call. task_commit call marks the end of a commit
        if (F.getName().contains("task_commit")){
            continue;
        }

        if (isTask(&F)) {

            errs() << "Analyzing task: " + F.getName() + "\n";

            //initialize read, write, readfirst and writefirst lists for a given task
            initializeTaskLists(F);
            //get all reads and writes in a task
            AnalyzeTask(F);

        } else if (isMain(&F)){

            //get all calls to tasks in main
            getTaskCalls(F);
            
        }
    }

    // used to print lists after sucessfully populating them
    //printList(idem);
}

void TaskAnalysis::AnalyzeTask(Function &F){

    // traverse all instructions inside a function
    for (auto &B: F) {

        for (auto &I: B) {

            // we only care about loads, stores and memcpys

            if (LoadInst *load = dyn_cast<LoadInst>(&I)) {

                // if instruction is a loadinst
                traverseLoad(load);

            } else if (StoreInst *store = dyn_cast<StoreInst>(&I)) {

                // if instruction is a storeinst
                traverseStore(store);

            } else if (CallInst *call = dyn_cast<CallInst>(&I)){

                // if instruction is a memcpy
                traverseMemcpy(call);
            }
        }
    }

    // generate the idempotent list from readfirst and writes lists
    generateTaskIdem(F);

    // clear check lists to perform analysis on the next task
    checkLoad.clear();
    checkStore.clear();
    checkLoadIndex.clear();
    checkStoreIndex.clear();
}

void TaskAnalysis::traverseMemcpy(CallInst *call){

    //identify if the callinst is making a call to memcpy

    Function *func = call->getCalledFunction();
    StringRef name;

    if (func)
        name = func->getName();
    else
        return;

    if (name.contains("llvm.memcpy")) {

        //get the first two operands of memcpy
        Value *to = call->getOperand(0);
        Value *from = call->getOperand(1);

        to = dyn_cast<Instruction>(to)->getOperand(0);
        from = dyn_cast<Instruction>(from)->getOperand(0);

        //check to see if the memcpy is making a write to a global shared variable
        if (GEPOperator *gep = dyn_cast<GEPOperator>(to)){
            vector <Instruction*> inst;
            if (gep->getSourceElementType()->isArrayTy()){

                Instruction *myLoad = dyn_cast<Instruction>(gep->getOperand(2));
                Instruction *index = dyn_cast<Instruction>(myLoad->getOperand(0));

                gep = dyn_cast<GEPOperator>(gep->getOperand(0));

                inst.push_back(dyn_cast<Instruction>(gep));
                inst.push_back(index);

                if (AllocaInst *a = dyn_cast<AllocaInst>(index)){

                    // added for AR
                    if (isPartOfLoop(myLoad, a)){
                        
                        inst[1] = NULL;
                    }

                }                

            } else {
                inst.push_back(dyn_cast<Instruction>(gep));
            }

            //added for cem
            insertStore(inst, gep);

        }
        
        // check to see if the memcpy is reading a variable from the global shared buffer
        if (GEPOperator *gep = dyn_cast<GEPOperator>(from)) {

            vector <Instruction*> inst;
            if (gep->getSourceElementType()->isArrayTy()){
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));
                inst.push_back(dyn_cast<Instruction>(gep));
                inst.push_back(NULL);
            } else {
                inst.push_back(dyn_cast<Instruction>(gep));
            }

            //added for cem
            insertLoad(inst, gep);
                
        }

    }   
}

void TaskAnalysis::traverseLoad(LoadInst *load){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        //gep->dump();
        vector <Instruction*> inst
        //check to see if the element being read is in the global shared buffer
        if (isGlobalStructAccess(gep, "unsafe")) {


            //added for AR
            //for struct type elements
            if (gep->getSourceElementType()->isStructTy()){

                StringRef name = dyn_cast<StructType>(gep->getSourceElementType())->getName();
                if (!(name == "struct.camel_global_t"))
                    gep = dyn_cast<GEPOperator>(gep->getOperand(0));
            }

            inst.push_back(dyn_cast<Instruction>(gep));
            // check if the element is an array type
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(gep->getOperand(2));

                //gep->getOperand(2)->dump();

                Instruction *index1 = dyn_cast<Instruction>(myLoad->getOperand(0));
                Instruction *index = dyn_cast<Instruction>(gep->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

            }

            //insert element into the specific list
            insertLoad(inst, gep);
        }
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(store->getOperand(1))){
        
        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            //added for AR
            //check to see if the written element is a part of the global shared buffer
            if (gep->getSourceElementType()->isStructTy()){

                StringRef name = dyn_cast<StructType>(gep->getSourceElementType())->getName();
                if (!(name == "struct.camel_global_t"))
                    gep = dyn_cast<GEPOperator>(gep->getOperand(0));
            }

            inst.push_back(dyn_cast<Instruction>(gep));
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(inst[0]->getOperand(2));
                Instruction *index1 = dyn_cast<Instruction>(myLoad->getOperand(0));
                Instruction *index = dyn_cast<Instruction>(inst[0]->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

                if (AllocaInst *a = dyn_cast<AllocaInst>(index1)){

                    // added for AR
                    if (isPartOfLoop(myLoad, a)){
                        
                        inst[1] = NULL;
                    }

                }
            }

            insertStore(inst, gep);
        }
    }
}

void TaskAnalysis::insertLoad(vector<Instruction*> inst, GEPOperator *gep) {

    GEPOperator *comp;
    if (inst.size() == 1) {
        comp = gep;
        if (checkLoad.find(comp->getOperand(2)) == checkLoad.end()){
            reads[getParentTask(comp)].push_back(inst);
            if (checkStore.find(comp->getOperand(2)) == checkStore.end()){
                readFirst[getParentTask(comp)].push_back(inst);
            }
        }
    }
    else if (inst.size() == 2){
        comp = dyn_cast<GEPOperator>(gep->getOperand(0));
        Constant *var = dyn_cast<Constant>(comp->getOperand(2));
        set<Value*> myIndices;

        if (!checkLoadIndex.count(var)){
            pair<Constant*, set<Value*>> p(var, myIndices);
            checkLoadIndex.insert(p);
        }

        if (checkLoad.find(comp->getOperand(2)) == checkLoad.end()){

            vector <Instruction*> inst2;
            inst2.push_back(inst[0]);
            inst2.push_back(NULL);
            reads[getParentTask(comp)].push_back(inst2);

            if (checkStore.find(comp->getOperand(2)) == checkStore.end()){
                readFirst[getParentTask(comp)].push_back(inst2);
            }
        } else if(checkLoadIndex[var].find(inst[1]) == checkLoadIndex[var].end()) {

            readFirst[getParentTask(comp)].push_back(inst);

        }

        if (inst[1]) {
            if (auto a = dyn_cast<AllocaInst>(inst[1]))
                checkStoreIndex[var].insert(inst[1]);
            else 
                checkStoreIndex[var].insert(inst[1]->getOperand(2));
        }
    }

    checkLoad.insert(comp->getOperand(2));

}

void TaskAnalysis::insertStore(vector<Instruction*> inst, GEPOperator *gep) {

    GEPOperator *comp;
    if (inst.size() == 1){
        comp = gep;
        if (checkStore.find(comp->getOperand(2)) == checkStore.end()){

            writes[getParentTask(comp)].push_back(inst);
            if (checkLoad.find(comp->getOperand(2)) == checkLoad.end()){
                writeFirst[getParentTask(comp)].push_back(inst);
            }
        }
    }
    else if (inst.size() == 2 || inst.size() == 3){ 

        comp = dyn_cast<GEPOperator>(gep->getOperand(0));
        Constant *var = dyn_cast<Constant>(comp->getOperand(2));
        set<Value*> myIndices;

        if (!checkLoadIndex.count(var)){
            pair<Constant*, set<Value*>> p(var, myIndices);
            checkLoadIndex.insert(p);
        }

        if (checkStore.find(comp->getOperand(2)) == checkStore.end()){
            writes[getParentTask(comp)].push_back(inst);
            if (checkLoad.find(comp->getOperand(2)) == checkLoad.end()){
                writeFirst[getParentTask(comp)].push_back(inst);
            }
        } else if (checkStoreIndex[var].find(inst[1]) == checkStoreIndex[var].end()) {

            writes[getParentTask(comp)].push_back(inst);
            writeFirst[getParentTask(comp)].push_back(inst);

        }

        //added for AR
        if (inst[1]) {
            if (auto a = dyn_cast<AllocaInst>(inst[1]))
                checkStoreIndex[var].insert(inst[1]);
            else 
                checkStoreIndex[var].insert(inst[1]->getOperand(2));
        } else {
            checkStoreIndex[var].insert(NULL);
        }
    }

    checkStore.insert(comp->getOperand(2));

}

//for optimization level greater than -O0
void TaskAnalysis::traverseLoadFast(LoadInst *load){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {
            inst.push_back(dyn_cast<Instruction>(gep));

            GEPOperator *comp;
            comp = gep;

            if (comp->getNumOperands() > 4)
                inst.push_back(NULL);

            if (checkLoad.find(comp->getOperand(3)) == checkLoad.end()){
                reads[getParentTask(comp)].push_back(inst);
                if (checkStore.find(comp->getOperand(3)) == checkStore.end()){
                    readFirst[getParentTask(comp)].push_back(inst);
                }
            }

            checkLoad.insert(comp->getOperand(3));
        }
    }
}

//for optimization level greater than -O0
void TaskAnalysis::traverseStoreFast(StoreInst *store){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {
            inst.push_back(dyn_cast<Instruction>(gep));

            GEPOperator *comp;
            comp = gep;

            if (comp->getNumOperands() > 4){
                
                inst.push_back(NULL);

            }

            if (checkStore.find(comp->getOperand(3)) == checkStore.end()){
                writes[getParentTask(comp)].push_back(inst);
                if (checkLoad.find(comp->getOperand(3)) == checkLoad.end()){
                    writeFirst[getParentTask(comp)].push_back(inst);
                }
            }

            checkStore.insert(comp->getOperand(3));
        }
    }
}

//check to see if an instruction is part of a loop
bool TaskAnalysis::isPartOfLoop(Instruction *I, Instruction *a) {

    BasicBlock *B = I->getParent();
    Function *F = B->getParent();
    LoopInfoBase<BasicBlock, Loop>* loopInfo = getTaskLoops(*F);
    Loop* loop = loopInfo->getLoopFor(B);

    if (loop){

        BasicBlock *bb = loop->getHeader();

        if (BranchInst *bi = dyn_cast<BranchInst>(bb->getTerminator())) {
            Value *loopCond = bi->getCondition();

            if (Instruction *i = dyn_cast<Instruction>(loopCond)){

                Instruction *loopVar = dyn_cast<Instruction>(i->getOperand(0));
                Value *loopBound = i->getOperand(1);

                if (loopVar->getOperand(0) == a){

                    return true;
                } else if (a->getName().contains("op")){

                    return true;
                }
            }
        }
    }

    return false;
}

//check to see if a variable being read or written is part of the global shared buffer
bool TaskAnalysis::isGlobalStructAccess(GEPOperator *gep, StringRef name) {

    GEPOperator *prev;
    GEPOperator *iter = gep;
    while (iter) {

        prev = iter;
        iter = dyn_cast<GEPOperator>(iter->getOperand(0));

    }

    if (LoadInst *temp = dyn_cast<LoadInst>(prev->getOperand(0))){
        return temp->getOperand(0)->getName().contains(name);
    }
    else{
        return false;
    }
        
}

// helper for loopInfo
LoopInfoBase<BasicBlock, Loop>* TaskAnalysis::getTaskLoops(Function &F) {

    DominatorTree DT = DominatorTree();
    DT.recalculate(F);
    LoopInfoBase<BasicBlock, Loop>* LoopInfo = new LoopInfoBase<BasicBlock, Loop>();
    LoopInfo->releaseMemory();
    LoopInfo->analyze(DT);

    return LoopInfo;
}

// Initializes lists for one task
void TaskAnalysis::initializeTaskLists(Function &F){

    StringRef taskName = F.getName();
    vector< vector<Instruction*> > inst;
    pair < StringRef, vector<vector<Instruction*>> > p(taskName, inst);
    writes.insert(p);
    reads.insert(p);
    writeFirst.insert(p);
    readFirst.insert(p);
    idem.insert(p);
    
}

// used the readFirst and writes lists to generate a list of IDEM variables
void TaskAnalysis::generateTaskIdem(Function &taskFunc) {

    StringRef task = taskFunc.getName();
    for (int i=0; i<writes[task].size(); i++){

        for (int j=0; j<readFirst[task].size(); j++){

            if (writes[task][i][0]->getOperand(2) == readFirst[task][j][0]->getOperand(2)){

                if (writes[task][i].size() == 1 && readFirst[task][j].size() == 1) {
                    
                    idem[task].push_back(writes[task][i]);
                    break;
                }
                else if (writes[task][i].size() == 2 && readFirst[task][j].size() == 2) {

                    if (writes[task][i][1] == NULL && readFirst[task][j][1] == NULL){
                        idem[task].push_back(writes[task][i]);
                        break;
                    }

                    AllocaInst *a = NULL;
                    AllocaInst *b = NULL;

                    if (writes[task][i][1])
                        a = dyn_cast<AllocaInst>(writes[task][i][1]);
                    
                    if (readFirst[task][j][1])
                        b = dyn_cast<AllocaInst>(readFirst[task][j][1]); 

                    if (a && b) {

                        if (writes[task][i][1] == readFirst[task][j][1]){
                            idem[task].push_back(writes[task][i]);
                            break;
                        }
                    }
                    else if (!(a || b)) {

                        if (writes[task][i][1] && readFirst[task][j][1]){
                            if (writes[task][i][1]->getOperand(2) == readFirst[task][j][1]->getOperand(2)){
                                idem[task].push_back(writes[task][i]);
                                break;
                            }
                        }
                    }
                }
            }
        }
    }
}

//traverse the main function to populate a list of all calls to tasks in main to insert logging code
void TaskAnalysis::getTaskCalls(Function &F){

    for (BasicBlock &B : F) {

        for (Instruction &I : B) {

            if (CallInst *call = dyn_cast<CallInst>(&I)) {

                Function *func = call->getCalledFunction();

                if (func && isTask(func)){

                    // for naked function calls

                    // if (func->getName().contains("task_commit")){
                    //     Instruction* next = I.getNextNode();
                    //     taskCallList.push_back(next);
                    // } else {
                    //     taskCallList.push_back(&I);
                    // }

                    // for inline functions
                    taskCallList.push_back(&I);
                }
            }
        }
    }
}
