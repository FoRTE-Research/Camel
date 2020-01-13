#include "global.h"

using namespace llvm;

class Modify {

    public:
    
        // methods
        Function* getIntrinsicMemcpy();
        void copyBuffers(Instruction *before, string to, string from);
        void copyVariable(Instruction* before, map < StringRef, vector<vector<GEPOperator*>> > list);

        //variables
        Module *myModule;
};