#include "Modify.h"

// bool Modify::runOnModule(Module &M){

//     TaskAnalysis analysisInfo;
//     analysisInfo.AnalyzeModule(M);
//     return false;

// }

char Modify::ID = 0;
static RegisterPass<Modify> X("Modify", "camel pass");