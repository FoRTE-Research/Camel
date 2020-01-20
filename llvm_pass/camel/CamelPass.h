#include "TaskAnalysis.h"
#include "Modify.h"

using namespace llvm;

class CamelPass : public ModulePass {
    
    public:
    
        // methods
        static char ID;
        CamelPass() : ModulePass(ID) {}
        bool runOnModule(Module &M);

        //variables
        TaskAnalysis analysisInfo;
        Modify modifyTasks;
        Module *myModule;
};
