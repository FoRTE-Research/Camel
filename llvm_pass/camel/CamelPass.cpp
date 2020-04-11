#include "CamelPass.h"

bool CamelPass::runOnModule(Module &M){

    // init
    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    
    // analyze all tasks
    analysisInfo.AnalyzeModule(M);

    errs() << "\nVERSIONING \n";

    //copy everything after task_init
    //modifyTasks.copyBuffers(analysisInfo.taskCallList[1], "unsafe", "safe");

    //MODE ALL
    //The Mode "ALL" adds code to copy the safe buffer to the unsafe before every task call
    //i++ for levels greater than o0 otherwise i=i+2
    // for (int i=2; i<analysisInfo.taskCallList.size(); i = i+2){
    //     analysisInfo.taskCallList[i]->dump();
    //     modifyTasks.copyBuffers(analysisInfo.taskCallList[i], "unsafe", "safe");
    // }

    //MODE "LIST"
    // LIST can equal reads 1, writes 2, idem 3
    // for( int i=2; i<analysisInfo.taskCallList.size(); i = i+2){

    //     CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[i]);
    //     StringRef taskName = taskCall->getCalledFunction()->getName();
    //     errs () << taskName + "\n";

    //     errs () << "Before Task\n";
    //     modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i], analysisInfo.idem);

    //     errs () << "After Task\n";
    //     modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i+1], analysisInfo.writes);
        
    // }

    // testing
    // for(int i=0; i<analysisInfo.taskCallList.size(); i++){

    //     CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[i]);
    //     StringRef taskName = taskCall->getCalledFunction()->getName();
    //     errs () << taskName + "\n";

    //     modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i], analysisInfo.reads);

    // }

    // for(int i=0; i<analysisInfo.taskCallList.size(); i++){

    //     analysisInfo.taskCallList[i]->dump();
    // }

    return true;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");
