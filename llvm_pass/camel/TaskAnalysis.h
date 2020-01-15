#include "global.h"

using namespace llvm;

class TaskAnalysis {

    public:

        // methods

        // for testing purposes
        // static char ID;
        // TaskAnalysis() : ModulePass(ID) {}
        // bool runOnModule(Module &M); 

        void AnalyzeModule(Module &M);
        void AnalyzeTask(Function &F);
        void traverseLoad(LoadInst *load);
        void traverseStore(StoreInst *store);
        bool isGlobalStructAccess(GEPOperator *gep, StringRef name);
        void initializeTaskLists(Function &F);
        bool isPartOfList(vector<GEPOperator*> vec, map < StringRef, vector<vector<GEPOperator*>> > list, StringRef task);
        void getTaskCalls(Function &F);
        void trackWrittenIndexes(Function &F);
        void trackReadIndexes(Function &F);

        // add function to determite idempotent list of variables for a given task
        // remove redundancy from lists

        // variables
        vector <Instruction*> taskCallList;
        map < StringRef, vector<vector<GEPOperator*>> > writes;
        map < StringRef, vector<vector<GEPOperator*>> > reads;
        map < StringRef, vector<vector<GEPOperator*>> > writeFirst;
        map < StringRef, vector<vector<GEPOperator*>> > readFirst;

        //add idempotent list
                
};

