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

    GEPOperator *gep;
    if (gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        while (gep) {

            gep = dyn_cast<GEPOperator>(gep->getOperand(0));

        }
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){
    
    GEPOperator *gep;
    if (gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        while (gep) {

            gep = dyn_cast<GEPOperator>(gep->getOperand(0));

        }
    }
}