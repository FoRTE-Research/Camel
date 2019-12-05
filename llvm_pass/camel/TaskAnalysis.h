#include "global.h"

using namespace llvm;

class TaskAnalysis : public ModulePass {

    public:

        // methods
        static char ID;
        TaskAnalysis() : ModulePass(ID) {}
        void AnalyzeModule(Module &M);
        void AnalyzeTask(Function &F);
        void traverseLoad(LoadInst *load);
        void traverseStore(StoreInst *store);
        bool isGlobalStructAccess(GEPOperator *gep, StringRef name);
        bool runOnModule(Module &M); // for testing purposes


        // variables
        Module* myModule;
        // need a map of writes for a task
        // need a map of reads for a task
        // need a map of writes first ?
        // need a map of reads first ?         
};

