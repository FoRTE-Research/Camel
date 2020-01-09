#include "TaskAnalysis.h"

using namespace llvm;

class Modify : public ModulePass {

    public:
    
        // methods
        static char ID;
        Modify() : ModulePass(ID) {}
        bool runOnModule(Module &M);
        Function* getIntrinsicMemcpy();
        void copyBuffers();

        //variables
        TaskAnalysis analysisInfo;
        Module *myModule;
     
};