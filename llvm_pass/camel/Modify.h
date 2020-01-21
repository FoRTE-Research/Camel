#include "global.h"

using namespace llvm;

class Modify {

    public:
    
        // methods
        Function* getIntrinsicMemcpy();
        void copyBuffers(Instruction *before, string to, string from);
        void copyVariables(Instruction* before, map < StringRef, vector<vector<GEPOperator*>> > list);
        GetElementPtrInst* accessStruct(Instruction *before, StringRef name);
        GetElementPtrInst* accessStructVar(Instruction *before, GetElementPtrInst* Struct, Value* index1, Value* index2);
        GetElementPtrInst* accessIndex(Instruction *before, GetElementPtrInst* index, Instruction* ar); 

        void cps(Instruction* before, vector<GEPOperator*> varList);
        void cpas(Instruction *before, vector<GEPOperator*> varList);
        void cpa(Instruction* before, vector<GEPOperator*> varList);
        void cpaso(Instruction* before, vector<GEPOperator*> varList);

        // variables
        Module *myModule;
};
