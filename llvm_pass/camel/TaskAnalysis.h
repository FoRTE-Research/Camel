#include "global.h"

using namespace llvm;

class TaskAnalysis : public ModulePass {

    public:

        static char ID;
        TaskAnalysis() : ModulePass(ID) {}
        void AnalyzeModule(Module &M);
        void AnalyzeTask(Function &F);
        void traverseLoad(LoadInst *load);
        void traverseStore(StoreInst *store);

    private: 

        Module* myModule;
        
};