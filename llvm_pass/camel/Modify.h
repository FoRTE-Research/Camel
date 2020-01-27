#include "global.h"

using namespace llvm;

class Modify {

    public:
    
        // methods
        Function* getIntrinsicMemcpy();
        void copyBuffers(Instruction *before, string to, string from);
        void copyVariables(StringRef task, Instruction* before, map < StringRef, vector<vector<Instruction*>> > list);
        GetElementPtrInst* accessStruct(Instruction *before, StringRef name);
        GetElementPtrInst* accessStructVar(Instruction *before, GetElementPtrInst* Struct, Value* index1, Value* index2);
        GetElementPtrInst* accessIndex(Instruction *before, GetElementPtrInst* index, Instruction* ar); 

        void cps(Instruction* before, vector<Instruction*> varList);
        void cpas(Instruction *before, vector<Instruction*> varList);
        void cpa(Instruction* before, vector<Instruction*> varList);
        void cpaso(Instruction* before, vector<Instruction*> varList);

        // variables
        Module *myModule;
};
