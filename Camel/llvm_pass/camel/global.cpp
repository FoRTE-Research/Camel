#include "global.h"

void getGlobals(Module *M){

   for (auto &G : M->getGlobalList()) {

        pair<StringRef, GlobalVariable*> p(G.getName(),dyn_cast<GlobalVariable>(&G));
        globals.insert(p);

    }
}

bool isTask(Function *F){

    return F->getName().contains("task_");
    
}

