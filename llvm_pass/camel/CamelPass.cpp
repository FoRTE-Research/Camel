#include "CamelPass.h"
#include "llvm/Support/CommandLine.h"

// Optimization modes
enum OptLevel {
  NONE, 
  ALL, 
  IDEM
};

// Commandline arguments for optimization level
cl::opt<OptLevel> OptimizationLevel(cl::desc("Choose optimization level:"),
cl::values(
    clEnumVal(NONE , "No optimizations"),
    clEnumVal(ALL, "Copy All"),
    clEnumVal(IDEM, "Copy IDEM")));

// basic instrumentation or optimized instrumentation
enum Instrumentation {
    TASKS,
    MAIN
};

// commandline arguments for instrumentation level
cl::opt<Instrumentation> InstrumentationLevel(cl::desc("Choose instrumentation level:"),
cl::values(
    clEnumVal(TASKS , "Apply opt level on everything"),
    clEnumVal(MAIN, "Apply opt level only on main")));

bool CamelPass::runOnModule(Module &M){

    // init
    myModule = &M;
    getGlobals(&M);
    modifyTasks.myModule = myModule;
    modifyTasks.bytes = 0;
    
    //  Only runs for ALL and IDEM
    if (OptimizationLevel != NONE){

        // analyze all tasks

        analysisInfo.AnalyzeModule(M, InstrumentationLevel);

        errs() << "\nVERSIONING \n";

        //copy everything after task_init
        CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[0]);
        StringRef taskName = taskCall->getCalledFunction()->getName();
        errs () << taskName + "\n";
        modifyTasks.copyBuffers(analysisInfo.taskCallList[1], "unsafe", "safe");

    }
    
    if (OptimizationLevel == ALL) {

        //MODE ALL
        for (int i=2; i<analysisInfo.taskCallList.size(); i = i+2){

            CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[i]);
            StringRef taskName = taskCall->getCalledFunction()->getName();
            errs () << taskName + "\n";
            modifyTasks.copyBuffers(analysisInfo.taskCallList[i], "unsafe", "safe");

        }

    } else if (OptimizationLevel == IDEM) { 

        //MODE IDEM
        for( int i=2; i<analysisInfo.taskCallList.size(); i = i+2){

            CallInst *taskCall = dyn_cast<CallInst>(analysisInfo.taskCallList[i]);
            StringRef taskName = taskCall->getCalledFunction()->getName();
            errs () << taskName + "\n";

            //errs () << "Before Task\n";
            // modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i], analysisInfo.idem);

            //errs () << "After Task\n";
            modifyTasks.copyVariables(taskName, analysisInfo.taskCallList[i+1], analysisInfo.writes);
            
        }

    }

    //errs () << "Bytes updated: " << modifyTasks.bytes << "\n";
    return true;
}

char CamelPass::ID = 0;
static RegisterPass<CamelPass> X("CamelPass", "camel pass");
