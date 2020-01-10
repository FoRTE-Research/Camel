#include "global.h"

using namespace llvm;

class Modify {

    public:
    
        // methods
        Function* getIntrinsicMemcpy();
        void copyBuffers(Instruction *before, string to, string from);
        void copyVariables(Instruction *before, string to , string from);

        //variables
        Module *myModule;
};