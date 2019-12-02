#include "global.h"

using namespace llvm;

class TaskAnalysis : public ModulePass {

    public:
            static char ID;
            TaskAnalysis() : ModulePass(ID) {}

    private: 

            Module* myModule;

};