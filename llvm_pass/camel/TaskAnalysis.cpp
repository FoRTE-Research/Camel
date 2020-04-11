#include "TaskAnalysis.h"

void TaskAnalysis::AnalyzeModule(Module &M){

    errs() << "\nSTARTING ANALYSIS\n"; 

    for (auto &F: M) {

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

    //printList(idem);
}

void TaskAnalysis::AnalyzeTask(Function &F){

    for (auto &B: F) {

        for (auto &I: B) {

            //check for load or store
            //I.dump();
            if (LoadInst *load = dyn_cast<LoadInst>(&I)) {

                traverseLoad(load);

            } else if (StoreInst *store = dyn_cast<StoreInst>(&I)) {

                traverseStore(store);

            } else if (CallInst *call = dyn_cast<CallInst>(&I)){

                traverseMemcpy(call);
            }
        }
    }

    generateTaskIdem(F);
    checkLoad.clear();
    checkStore.clear();
    checkLoadIndex.clear();
    checkStoreIndex.clear();
}

void TaskAnalysis::traverseMemcpy(CallInst *call){

    Function *func = call->getCalledFunction();
    StringRef name;

    if (func)
        name = func->getName();
    else
        return;

    if (name.contains("llvm.memcpy")) {

       // errs() << "memcpy\n";

        Value *to = call->getOperand(0);
        Value *from = call->getOperand(1);

        to = dyn_cast<Instruction>(to)->getOperand(0);
        from = dyn_cast<Instruction>(from)->getOperand(0);

        // to = dyn_cast<Instruction>(to)->getOperand(0);
        // from = dyn_cast<Instruction>(from)->getOperand(0);

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
                        
                        //errs () <<"loop\n";
                        inst[1] = NULL;
                    }

                }                

            } else {
                inst.push_back(dyn_cast<Instruction>(gep));
            }

            if (checkStore.find(gep->getOperand(2)) == checkStore.end()){
                writes[getParentTask(gep)].push_back(inst);
                checkStore.insert(gep->getOperand(2));
                if (checkLoad.find(gep->getOperand(2)) == checkLoad.end()){
                    writeFirst[getParentTask(gep)].push_back(inst);
                }
            }
        }
        
        if (GEPOperator *gep = dyn_cast<GEPOperator>(from)) {

            vector <Instruction*> inst;
            if (gep->getSourceElementType()->isArrayTy()){
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));
                inst.push_back(dyn_cast<Instruction>(gep));
                inst.push_back(NULL);
            } else {
                inst.push_back(dyn_cast<Instruction>(gep));
            }
                
            if (checkLoad.find(gep->getOperand(2)) == checkLoad.end()){
                reads[getParentTask(gep)].push_back(inst);
                checkLoad.insert(gep->getOperand(2));
                if (checkStore.find(gep->getOperand(2)) == checkStore.end()){
                    readFirst[getParentTask(gep)].push_back(inst);
                }
            }
        }

    }   
}

void TaskAnalysis::traverseLoad(LoadInst *load){

    //errs () << "LOAD \n";
    //load->dump();

    if (GEPOperator *gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        //gep->dump();
        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            //added for AR
            if (gep->getSourceElementType()->isStructTy()){

                StringRef name = dyn_cast<StructType>(gep->getSourceElementType())->getName();
                if (!(name == "struct.camel_global_t"))
                    gep = dyn_cast<GEPOperator>(gep->getOperand(0));
            }

            inst.push_back(dyn_cast<Instruction>(gep));
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(gep->getOperand(2));

                //gep->getOperand(2)->dump();

                Instruction *index1 = dyn_cast<Instruction>(myLoad->getOperand(0));
                Instruction *index = dyn_cast<Instruction>(gep->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

                // if (AllocaInst *a = dyn_cast<AllocaInst>(index1))
                //     isPartOfLoop(myLoad, a);

            //errs() << "here\n";
            //inst[0]->dump();
            //inst[1]->dump();

            }

            insertLoad(inst, gep);
        }
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){

    //errs () << "STORE\n";

    if (GEPOperator *gep = dyn_cast<GEPOperator>(store->getOperand(1))){
        
        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            //added for AR
            if (gep->getSourceElementType()->isStructTy()){

                StringRef name = dyn_cast<StructType>(gep->getSourceElementType())->getName();
                if (!(name == "struct.camel_global_t"))
                    gep = dyn_cast<GEPOperator>(gep->getOperand(0));
            }

            inst.push_back(dyn_cast<Instruction>(gep));
            if (gep->getSourceElementType()->isArrayTy()) {

                //errs() << "array\n";

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
            //change getOperand(2) to getOperand(3) for optimization levels higher than O0

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
            //reads[getParentTask(comp)].push_back(inst);

            vector <Instruction*> inst2;
            inst2.push_back(inst[0]);
            inst2.push_back(NULL);
            reads[getParentTask(comp)].push_back(inst2);

            if (checkStore.find(comp->getOperand(2)) == checkStore.end()){
                readFirst[getParentTask(comp)].push_back(inst2);
            }
        } else if(checkLoadIndex[var].find(inst[1]) == checkLoadIndex[var].end()) {

            //reads[getParentTask(comp)].push_back(inst);
            readFirst[getParentTask(comp)].push_back(inst);

        }

        if (auto a = dyn_cast<AllocaInst>(inst[1]))
            checkStoreIndex[var].insert(inst[1]);
        else 
            checkStoreIndex[var].insert(inst[1]->getOperand(2));
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

void TaskAnalysis::traverseStoreFast(StoreInst *store){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {
            inst.push_back(dyn_cast<Instruction>(gep));

            GEPOperator *comp;
            comp = gep;

            if (comp->getNumOperands() > 4){
                
                //array or struct detection
                //comp->getOperand(4)->dump();
                //comp->dump();
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
                }
            }
        }
    }

    return false;
}

bool TaskAnalysis::isGlobalStructAccess(GEPOperator *gep, StringRef name) {

    GEPOperator *prev;
    GEPOperator *iter = gep;
    while (iter) {

        prev = iter;
        iter = dyn_cast<GEPOperator>(iter->getOperand(0));

    }

    // gep->dump();
    // prev->dump();
    // prev->getOperand(0)->dump();
    // errs () << "\n";

    if (LoadInst *temp = dyn_cast<LoadInst>(prev->getOperand(0))){
        return temp->getOperand(0)->getName().contains(name);
    }
    else{
        return false;
    }
        
}

LoopInfoBase<BasicBlock, Loop>* TaskAnalysis::getTaskLoops(Function &F) {

    DominatorTree DT = DominatorTree();
    DT.recalculate(F);
    LoopInfoBase<BasicBlock, Loop>* LoopInfo = new LoopInfoBase<BasicBlock, Loop>();
    LoopInfo->releaseMemory();
    LoopInfo->analyze(DT);

    return LoopInfo;
}

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

                    if (writes[task][i][1] == NULL && readFirst[task][i][1] == NULL){
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


void TaskAnalysis::getTaskCalls(Function &F){

    for (BasicBlock &B : F) {

        for (Instruction &I : B) {

            if (CallInst *call = dyn_cast<CallInst>(&I)) {

                Function *func = call->getCalledFunction();

                if (func && isTask(func)){

                    // if (func->getName().contains("task_commit")){
                    //     Instruction* next = I.getNextNode();
                    //     taskCallList.push_back(next);
                    // } else {
                    //     taskCallList.push_back(&I);
                    // }

                    taskCallList.push_back(&I);
                }
            }
        }
    }
}
