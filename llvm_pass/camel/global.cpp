#include "global.h"

// header file globals
map <StringRef, GlobalVariable*> globals;


// functions
void getGlobals(Module *M){

    errs() << "Populating Global List\n";

   for (auto &G : M->getGlobalList()) {

        pair<StringRef, GlobalVariable*> p(G.getName(),dyn_cast<GlobalVariable>(&G));
        globals.insert(p);

    }
}

bool isTask(Function *F){

    return F->getName().contains("task_");
    
}

bool isMain(Function *F){

    return F->getName().contains("main");

}

StringRef getParentTask(GEPOperator *gep){

    Instruction *temp = dyn_cast<Instruction>(gep);
    return temp->getParent()->getParent()->getName();

}

void printList(map < StringRef, vector<vector<Instruction*>> >list) {

    for (auto it=list.begin(); it!=list.end(); ++it){

        errs () << it->first + "\n";

        for (int i=0; i<it->second.size(); i++){

            it->second[i][0]->dump();

            if (it->second[i].size() == 2)
                it->second[i][1]->dump();

            errs () << "\n";
        }
    }
}
