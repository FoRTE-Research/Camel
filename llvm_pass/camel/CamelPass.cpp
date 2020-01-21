#include "CamelPass.h"

bool CamelPass::runOnModule(Module &M){

    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    analysisInfo.AnalyzeModule(M);

    // MODE ALL
    // The Mode "ALL" adds code to copy the safe buffer to the unsafe before every task call
    // for (int i=0; i<analysisInfo.taskCallList.size(); i++)
    //     modifyTasks.copyBuffers(analysisInfo.taskCallList[i], "unsafe", "safe");

    // MODE "LIST"
    // LIST can equal Reads, Writes. TO DO: Add idempotent list
    for( int i=0; i<analysisInfo.taskCallList.size(); i++)
        modifyTasks.copyVariables(analysisInfo.taskCallList[i], analysisInfo.idem);

    //modifyTasks.copyVariables(analysisInfo.taskCallList[1], analysisInfo.writes); //test

    return true;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");
