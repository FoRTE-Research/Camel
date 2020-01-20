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
