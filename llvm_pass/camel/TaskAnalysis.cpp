#include "TaskAnalysis.h"

void TaskAnalysis::AnalyzeModule(Module &M){

    errs() << "\nSTARTING ANALYSIS\n"; 

    for (auto &F: M) {

        if (isTask(&F)) {

            errs() << "Analyzing task: " + F.getName() + "\n";

            //initialize read, write, readfirst and writefirst lists for a given task
            initializeTaskLists(F);
            //get all reads and writes in a task
            AnalyzeTask(F);

        } else if (isMain(&F)){

            getTaskCalls(F);
            
        }
    }

    printList(reads);
}

void TaskAnalysis::AnalyzeTask(Function &F){

    for (auto &B: F) {

        for (auto &I: B) {

            //check for load or store
            if (LoadInst *load = dyn_cast<LoadInst>(&I)) {

                traverseLoadFast(load);

            } else if (StoreInst *store = dyn_cast<StoreInst>(&I)) {

                traverseStore(store);

            }
        }
    }

    generateTaskIdem(F);
    checkLoad.clear();
    checkStore.clear();
    checkLoadIndex.clear();
    checkStoreIndex.clear();
}

void TaskAnalysis::traverseLoad(LoadInst *load){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            inst.push_back(dyn_cast<Instruction>(gep));
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(gep->getOperand(2));
                Instruction *index1 = dyn_cast<Instruction>(myLoad->getOperand(0));
                Instruction *index = dyn_cast<Instruction>(gep->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

                if (AllocaInst *a = dyn_cast<AllocaInst>(index1))
                    isPartOfLoop(myLoad, a);

            }

            //change getOperand(2) to getOperand(3) for optimization levels higher than O0

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
                        readFirst[getParentTask(comp)].push_back(inst);
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
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            inst.push_back(dyn_cast<Instruction>(gep));
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(inst[0]->getOperand(2));
                Instruction *index1 = dyn_cast<Instruction>(myLoad->getOperand(0));
                Instruction *index = dyn_cast<Instruction>(inst[0]->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

                if (AllocaInst *a = dyn_cast<AllocaInst>(index1))
                    isPartOfLoop(myLoad, a);

            }

            //change getOperand(2) to getOperand(3) for optimization levels higher than O0

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
            else if (inst.size() == 2){ 

                inst[0]->dump();
                inst[1]->dump();
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

                if (auto a = dyn_cast<AllocaInst>(inst[1]))
                    checkStoreIndex[var].insert(inst[1]);
                else 
                    checkStoreIndex[var].insert(inst[1]->getOperand(2));

            }

            checkStore.insert(comp->getOperand(2));
        }
    }
}

void TaskAnalysis::traverseLoadFast(LoadInst *load){

    if (GEPOperator *gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        vector <Instruction*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {
            inst.push_back(dyn_cast<Instruction>(gep));

            GEPOperator *comp;
            comp = gep;

            int numOperands = comp->getNumOperands();
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

bool TaskAnalysis::isGlobalStructAccess(GEPOperator *gep, StringRef name){

    GEPOperator *prev;
    GEPOperator *iter = gep;
    while (iter) {

        prev = iter;
        iter = dyn_cast<GEPOperator>(iter->getOperand(0));

    }

    LoadInst *temp = dyn_cast<LoadInst>(prev->getOperand(0));
    return temp->getOperand(0)->getName().contains(name);
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

                    AllocaInst *a = dyn_cast<AllocaInst>(writes[task][i][1]);
                    AllocaInst *b = dyn_cast<AllocaInst>(readFirst[task][j][1]); 
                    if (a && b) {

                        if (writes[task][i][1] == readFirst[task][j][1]){
                            idem[task].push_back(writes[task][i]);
                            break;
                        }
                    }
                    else if (!(a || b)) {

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


void TaskAnalysis::getTaskCalls(Function &F){

    for (BasicBlock &B : F) {

        for (Instruction &I : B) {

            if (CallInst *call = dyn_cast<CallInst>(&I)) {

                Function *func = call->getCalledFunction();

                if (func && isTask(func)){

                    taskCallList.push_back(&I);
                    
                }
            }
        }
    }
}
