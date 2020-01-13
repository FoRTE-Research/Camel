#include "CamelPass.h"

bool CamelPass::runOnModule(Module &M){

    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    analysisInfo.AnalyzeModule(M);

    // MODE ALL
    // for (int i=0; i<analysisInfo.taskCallList.size(); i++)
    //     modifyTasks.copyBuffers(analysisInfo.taskCallList[i], "unsafe", "safe");

    // MODE "LIST"
    // for( int i=0; i<analysisInfo.taskCallList.size(); i++)
    //     modifyTasks.copyVariables(analysisInfo.taskCallList[i], analysisInfo.writes);

    modifyTasks.copyVariables(analysisInfo.taskCallList[1], analysisInfo.writes);
    return true;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");