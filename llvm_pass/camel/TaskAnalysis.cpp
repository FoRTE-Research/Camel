#include "TaskAnalysis.h"

void TaskAnalysis::AnalyzeModule(Module &M){

    for (auto &F: M) {

        if (isTask(&F)) {

            //do something with the task
            initializeTaskLists(F);
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

        // errs() << "READ\n";
        vector <GEPOperator*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            if (gep->getSourceElementType()->isArrayTy()) {

                index = gep;
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));

                // index->dump();
                inst.push_back(index);
                
            }

            // gep->dump();
            // errs () << "\n";
            inst.push_back(gep);

            reads[getParentTask(gep)].push_back(inst);

            if (!isPartOfList(inst, writeFirst, getParentTask(gep))){
                readFirst[getParentTask(gep)].push_back(inst);
            }
        }
    }
}

void TaskAnalysis::traverseStore(StoreInst *store){
    
    GEPOperator *index;
    GEPOperator *gep;

    if (gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        if (isGlobalStructAccess(gep, "unsafe")) {

            // errs() << "WRITE\n";

            vector <GEPOperator*> inst;
            if (gep->getSourceElementType()->isArrayTy()) {

                index = gep;
                gep = dyn_cast<GEPOperator>(gep->getOperand(0));

                // index->dump();
                inst.push_back(index);
            }

            // gep->dump();
            // errs () << "\n";
            inst.push_back(gep);

            writes[getParentTask(gep)].push_back(inst);

            if (!isPartOfList(inst, readFirst, getParentTask(gep))){
                writeFirst[getParentTask(gep)].push_back(inst);
            }
        }
    }
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

void TaskAnalysis::initializeTaskLists(Function &F){

    StringRef taskName = F.getName();
    vector< vector<GEPOperator*> > inst;
    pair < StringRef, vector<vector<GEPOperator*>> > p(taskName, inst);
    writes.insert(p);
    reads.insert(p);
    writeFirst.insert(p);
    readFirst.insert(p);
    
}

bool TaskAnalysis::isPartOfList(vector<GEPOperator*> vec, map < StringRef, vector<vector<GEPOperator*>> > list, StringRef task){

    vector < vector<GEPOperator*> > taskList = list[task];

    for (vector<GEPOperator*> iter : taskList){
        
        if (iter == vec)
            return true;
    }

    return false;
}

bool TaskAnalysis::runOnModule(Module &M){

    AnalyzeModule(M);
    return false;

}

char TaskAnalysis::ID = 0;
static RegisterPass<TaskAnalysis> X("TaskAnalysis", "camel pass");