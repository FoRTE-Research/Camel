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
}

void TaskAnalysis::AnalyzeTask(Function &F){

    for (auto &B: F) {

        for (auto &I: B) {

            //check for load or store
            if (LoadInst *load = dyn_cast<LoadInst>(&I)) {

                traverseLoad(load);

            } else if (StoreInst *store = dyn_cast<StoreInst>(&I)) {

                traverseStore(store);

            }
        }
    }

    checkLoad.clear();
    checkStore.clear();
    generateTaskIdem(F);

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

            if (checkLoad.find(gep->getOperand(2)) == checkLoad.end()){

                reads[getParentTask(gep)].push_back(inst);
                checkLoad.insert(gep->getOperand(2));

            }
            
            if (checkStore.find(gep->getOperand(2)) == checkStore.end()){

                readFirst[getParentTask(gep)].push_back(inst);

            }
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

            if (checkStore.find(gep->getOperand(2)) == checkStore.end()){

                writes[getParentTask(gep)].push_back(inst);
                checkStore.insert(gep->getOperand(2));

            }

            if (checkLoad.find(gep->getOperand(2)) == checkLoad.end()){

                writeFirst[getParentTask(gep)].push_back(inst);

            }
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

                idem[task].push_back(writes[task][i]);
                break;

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
