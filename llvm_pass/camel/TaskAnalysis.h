#include "global.h"

using namespace llvm;

class TaskAnalysis {

    public:

        void AnalyzeModule(Module &M);
        void AnalyzeTask(Function &F);
        void traverseLoad(LoadInst *load);
        void traverseStore(StoreInst *store);
        bool isGlobalStructAccess(GEPOperator *gep, StringRef name);
        void initializeTaskLists(Function &F);
        void getTaskCalls(Function &F);

        void generateTaskIdem(Function &taskFunc);
        LoopInfoBase<BasicBlock, Loop>* getTaskLoops(Function &F);
        bool isPartOfLoop(Instruction *I, AllocaInst *a);

        vector <Instruction*> taskCallList;
        map < StringRef, vector<vector<Instruction*>> > writes;
        map < StringRef, vector<vector<Instruction*>> > reads;
        map < StringRef, vector<vector<Instruction*>> > idem;

    private: 

        set <Value*> checkLoad;
        set <Value*> checkStore;
        map < StringRef, vector<vector<Instruction*>> > writeFirst;
        map < StringRef, vector<vector<Instruction*>> > readFirst;
                
};
