#include "Modify.h"

bool Modify::runOnModule(Module &M){

    myModule = &M;

    getGlobals(&M);
    analysisInfo.AnalyzeModule(M);

    // globals["unsafe"]->dump();
    copyBuffers();

    return false;

}

Function* Modify::getIntrinsicMemcpy() {

    vector<Type*> arg_type; //a vector for the type of arguements memcpy has

    //push all types of arguements in our vector
    arg_type.push_back(Type::getInt8PtrTy(myModule->getContext()));
    arg_type.push_back(Type::getInt8PtrTy(myModule->getContext()));
    arg_type.push_back(Type::getInt64Ty(myModule->getContext()));
    // arg_type.push_back(Type::getInt1Ty(myModule->getContext()));

    //getDeclaration gets the function memcpy
    Function *fun = Intrinsic::getDeclaration(myModule, Intrinsic::memcpy, arg_type);
    
    return fun;
    
}


void Modify::copyBuffers() {

    Value *unsafePtr = globals["unsafe"];
    Value *safePtr = globals["unsafe"];

    Type *Ty = unsafePtr->getType()->getContainedType(0); 

    LoadInst *load = new LoadInst(Ty, unsafePtr, "tmp", analysisInfo.taskCallList[0]);
    load->setAlignment(MaybeAlign(2));
    load->dump();

    Type *i32_type = IntegerType::getInt32Ty(myModule->getContext());
    Constant *arg1 = ConstantInt::get(i32_type, 0);
    Constant *arg2 = ConstantInt::get(i32_type, 1);

    vector<Value *> index; 
    index.push_back(arg1);
    index.push_back(arg2);

    auto inst = GetElementPtrInst::Create(Ty->getContainedType(0), load, index, "global", analysisInfo.taskCallList[0]);
    inst->dump();

    Type *pi8 = Type::getInt8PtrTy(myModule->getContext());

    auto bcast = new BitCastInst(inst, pi8, "cast", analysisInfo.taskCallList[0]);
    bcast->dump();

    //do this for for both unsafe and safe and use intrinsic memcpy to copy

}


char Modify::ID = 0;
static RegisterPass<Modify> X("Modify", "camel pass");