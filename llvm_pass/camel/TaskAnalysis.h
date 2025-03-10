#include "global.h"

using namespace llvm;

class TaskAnalysis {

    public:

        //traversal functions
        void AnalyzeModule(Module &M, bool optimize);
        void AnalyzeTask(Function &F);
        void traverseLoad(LoadInst *load);
        void traverseStore(StoreInst *store);
        void traverseMemcpy(CallInst *call);

        //helpers for traversal functions
        void insertStore(vector<Instruction*> inst, GEPOperator *gep);
        void insertLoad(vector<Instruction*> inst, GEPOperator *gep);

        //general helpers and checkers
        bool isGlobalStructAccess(GEPOperator *gep, StringRef name);
        void initializeTaskLists(Function &F);
        void getTaskCalls(Function &F);
        void generateTaskIdem(Function &taskFunc);
        LoopInfoBase<BasicBlock, Loop>* getTaskLoops(Function &F);
        bool isPartOfLoop(Instruction *I, Instruction *a);

        //functions for opt level greater than O0
        void traverseLoadFast(LoadInst *load);
        void traverseStoreFast(StoreInst *store);

        //lists for task analysis and different modes
        vector <Instruction*> taskCallList;
        map < StringRef, vector<vector<Instruction*>> > writes;
        map < StringRef, vector<vector<Instruction*>> > reads;
        map < StringRef, vector<vector<Instruction*>> > idem;

    private:

        // helper lists
        set <Value*> checkLoad;
        set <Value*> checkStore;
        map <Constant*, set<Value*> > checkStoreIndex;
        map <Constant*, set<Value*> > checkLoadIndex;
        map < StringRef, vector<vector<Instruction*>> > writeFirst;
        map < StringRef, vector<vector<Instruction*>> > readFirst;
                
};
