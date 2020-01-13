#include "CamelPass.h"

bool CamelPass::runOnModule(Module &M){

    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    analysisInfo.AnalyzeModule(M);
    
    return false;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");