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
            generateIdem(F);
            //functions to track array reads and writes in a task
            trackWrittenIndexes(F);
            trackReadIndexes(F);

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
}

void TaskAnalysis::traverseLoad(LoadInst *load){

    GEPOperator *index;
    GEPOperator *gep;

    if (gep = dyn_cast<GEPOperator>(load->getOperand(0))){

        vector <GEPOperator*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            inst.push_back(gep);
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(inst[0]->getOperand(2));
                GEPOperator *index1 = dyn_cast<GEPOperator>(myLoad->getOperand(0));
                GEPOperator *index = dyn_cast<GEPOperator>(inst[0]->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);

                if (index1 == NULL){
                    return;
                }
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
    
    GEPOperator *index;
    GEPOperator *gep;

    if (gep = dyn_cast<GEPOperator>(store->getOperand(1))){

        vector <GEPOperator*> inst;
        if (isGlobalStructAccess(gep, "unsafe")) {

            inst.push_back(gep);
            if (gep->getSourceElementType()->isArrayTy()) {

                LoadInst *myLoad = dyn_cast<LoadInst>(inst[0]->getOperand(2));
                GEPOperator *index1 = dyn_cast<GEPOperator>(myLoad->getOperand(0));
                GEPOperator *index = dyn_cast<GEPOperator>(inst[0]->getOperand(0));
                inst[0] = index;
                inst.push_back(index1);
                
                if (index1 == NULL){
                    return;
                }
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
    idem.insert(p);
    
}

void TaskAnalysis::generateIdem(Function &taskFunc) {

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
