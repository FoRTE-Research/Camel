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
        void trackWrittenIndexes(Function &F);
        void trackReadIndexes(Function &F);
        void generateIdem(Function &taskFunc);

        vector <Instruction*> taskCallList;
        map < StringRef, vector<vector<GEPOperator*>> > writes;
        map < StringRef, vector<vector<GEPOperator*>> > reads;
        map < StringRef, vector<vector<GEPOperator*>> > idem;

    private: 

        set <Value*> checkLoad;
        set <Value*> checkStore;
        map < StringRef, vector<vector<GEPOperator*>> > writeFirst;
        map < StringRef, vector<vector<GEPOperator*>> > readFirst;
                
};
