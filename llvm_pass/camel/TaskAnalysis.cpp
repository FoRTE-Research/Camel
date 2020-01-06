#include "TaskAnalysis.h"

void TaskAnalysis::AnalyzeModule(Module &M){

    for (auto &F: M) {

        if (isTask(&F)) {

            //initialize read, write, readfirst and writefirst lists for a given task
            initializeTaskLists(F);
            //get all reads and writes in a task
            AnalyzeTask(F);
            //functions to track array reads and writes in a task
            trackWrittenIndexes(F);
            trackReadIndexes(F);

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
                // index->getOperand(2)->dump();
                // dyn_cast<Instruction>(index->getOperand(2))->getOperand(0)->dump();
                inst.push_back(index);
                
            }

            //gep->dump();
            inst.push_back(gep);

            // errs() << "Read index of struct ";
            // gep->getOperand(2)->dump();
            // errs() << "\n";

            reads[getParentTask(gep)].push_back(inst);

            if (!isPartOfList(inst, writeFirst, getParentTask(gep))){
              //  errs() << "READFIRST\n" ;
                readFirst[getParentTask(gep)].push_back(inst);
            }

            //errs () << "\n";
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
                // index->getOperand(2)->dump();
                // dyn_cast<Instruction>(index->getOperand(2))->getOperand(0)->dump();
                inst.push_back(index);
            }

            //gep->dump();

            // errs() << "wrote index of struct ";
            // gep->getOperand(2)->dump();
            // errs() << "\n";
        
            inst.push_back(gep);

            writes[getParentTask(gep)].push_back(inst);

            if (!isPartOfList(inst, readFirst, getParentTask(gep))){
                //errs() << "WRITEFIRST\n" ;
                writeFirst[getParentTask(gep)].push_back(inst);
            }

            //errs () << "\n";
        }
    }
}

void TaskAnalysis::trackWrittenIndexes(Function &F){

    StringRef taskName = F.getName();
    vector < vector<GEPOperator*> > taskList = writes[taskName];

    for (vector<GEPOperator*> iter : taskList){
        
        if (iter.size() == 2){

            // process array index to find out all written indexes
        }

    }
}

void TaskAnalysis::trackReadIndexes(Function &F){

    StringRef taskName = F.getName();
    vector < vector<GEPOperator*> > taskList = writes[taskName];
    
    for (vector<GEPOperator*> iter : taskList){
        
        if (iter.size() == 2){ 

            // process array index to find out all read indexes

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
        
        if (iter == vec){
            //errs() << "PART OF LIST\n";
            return true;
        }
    }

    return false;
}

// bool TaskAnalysis::runOnModule(Module &M){

//     AnalyzeModule(M);
//     return false;

// }

// char TaskAnalysis::ID = 0;
// static RegisterPass<TaskAnalysis> X("TaskAnalysis", "camel pass");