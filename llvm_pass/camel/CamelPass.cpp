#include "CamelPass.h"

bool CamelPass::runOnModule(Module &M){

    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    analysisInfo.AnalyzeModule(M);

    errs() << "\nVERSIONING \n";
    
    // MODE ALL
    // The Mode "ALL" adds code to copy the safe buffer to the unsafe before every task call
    // for (int i=0; i<analysisInfo.taskCallList.size(); i=i+2)
    //     modifyTasks.copyBuffers(analysisInfo.taskCallList[i], "unsafe", "safe");

    // MODE "LIST"
    // LIST can equal reads, writes and idem
    for( int i=0; i<analysisInfo.taskCallList.size(); i = i+2){

        CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[i]);
        StringRef taskName = taskCall->getCalledFunction()->getName();
        errs () << taskName + "\n";

        errs () << "Before Task\n";
        modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i], analysisInfo.idem);
        errs () << "After Task\n";
        modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i+1], analysisInfo.writes);
        
    }

    return true;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");
