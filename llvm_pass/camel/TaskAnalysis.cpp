#include "TaskAnalysis.h"

void TaskAnalysis::AnalyzeModule(Module &M){

    for (auto &F: M) {

        if (isTask(&F)) {

            //do something with the task
            AnalyzeTask(F);

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
}

void TaskAnalysis::traverseLoad(LoadInst *load){

    GEPOperator *index;
    GEPOperator *gep;

    if (gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        if (isGlobalStructAccess(gep, "unsafe")) {

            if (gep->getSourceElementType()->isArrayTy()) {

                index = gep;
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));

            }
        }
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){
    
    GEPOperator *index;
    GEPOperator *gep;

    if (gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        if (isGlobalStructAccess(gep, "unsafe")) {

            if (gep->getSourceElementType()->isArrayTy()) {

                index = gep;
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));

            }

            gep->dump();
        }
    }
}

bool TaskAnalysis::runOnModule(Module &M){

    AnalyzeModule(M);
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

char TaskAnalysis::ID = 0;
static RegisterPass<TaskAnalysis> X("TaskAnalysis", "camel pass");