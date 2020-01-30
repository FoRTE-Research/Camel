#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/ADT/ilist.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/SymbolTableListTraits.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/BasicAliasAnalysis.h"
#include "llvm/Analysis/LoopInfo.h" 
#include"llvm/IR/Dominators.h"
#include <map>
#include <set>
#include <algorithm>

using namespace llvm;
using namespace std;

// global variables

extern map <StringRef, GlobalVariable*> globals;

// global functions

StringRef getParentTask(GEPOperator *gep);
void getGlobals(Module *M);
bool isTask(Function *F);
bool isMain(Function *F);
void printList(map < StringRef, vector<vector<Instruction*>> >list);
