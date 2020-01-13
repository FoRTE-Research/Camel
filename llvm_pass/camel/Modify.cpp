#include "Modify.h"

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

void Modify::copyBuffers(Instruction *before, string to, string from) {

    // pointer to copy
    Value *unsafePtr = globals[to];
    Value *safePtr = globals[from];
    Type *Ty = unsafePtr->getType()->getContainedType(0); 

    // constant arguments for inserted instructions 
    Type *i32_type = IntegerType::getInt32Ty(myModule->getContext());
    Constant *arg1 = ConstantInt::get(i32_type, 0);
    Constant *arg2 = ConstantInt::get(i32_type, 1);
    Type *pi8 = Type::getInt8PtrTy(myModule->getContext());

    vector<Value *> index; 
    index.push_back(arg1);
    index.push_back(arg2);

    // loading the UNSAFE pointer
    LoadInst *loadUnsafe = new LoadInst(Ty, unsafePtr, "tmp", before);
    loadUnsafe->setAlignment(MaybeAlign(2));
    auto GEP1 = GetElementPtrInst::Create(Ty->getContainedType(0), loadUnsafe, index, "global", before);
    auto bCast1 = new BitCastInst(GEP1, pi8, "cast", before);

    // loading the SAFE pointer
    LoadInst *loadSafe = new LoadInst(Ty, safePtr, "tmp", before);
    loadSafe->setAlignment(MaybeAlign(2));
    auto GEP2 = GetElementPtrInst::Create(Ty->getContainedType(0), loadSafe, index, "global", before);
    auto bCast2 = new BitCastInst(GEP2, pi8, "cast", before);
 
    // set memcpy arguments
    auto dl = myModule->getDataLayout();
    auto size_of_struct = dl.getTypeAllocSize(GEP1->getType()->getContainedType(0));
    Type *i64_type = IntegerType::getInt64Ty(myModule->getContext());
    Constant *arg3 = ConstantInt::get(i64_type, size_of_struct);
    Constant *arg4 = ConstantInt::getFalse(myModule->getContext());

    Function *fun = getIntrinsicMemcpy();
    vector<Value*> memcpyArgs;
    memcpyArgs.push_back(bCast1);
    memcpyArgs.push_back(bCast2);
    memcpyArgs.push_back(arg3);
    memcpyArgs.push_back(arg4);

    // insert memcpy
    CallInst *call = CallInst::Create(fun, memcpyArgs, "", before);

    // printing for debugging
    loadUnsafe->dump();
    GEP1->dump();
    bCast1->dump();
    loadSafe->dump();
    GEP2->dump();
    bCast2->dump();
    call->dump();
    
}

void Modify::copyVariables(Instruction* before, string to, string from) {

}
