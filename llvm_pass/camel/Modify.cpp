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
    //add functionality for cpa to this function

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
    // loadUnsafe->dump();
    // GEP1->dump();
    // bCast1->dump();
    // loadSafe->dump();
    // GEP2->dump();
    // bCast2->dump();
    // call->dump();
    
}

void Modify::copyVariables(Instruction* before, map < StringRef, vector<vector<GEPOperator*>> > list) {

    CallInst *call = dyn_cast<CallInst>(before);
    StringRef task = call->getCalledFunction()->getName();
    vector<vector<GEPOperator*>> writesList = list[task];

    // cps
    // GetElementPtrInst *Struct = accessStruct(before, "safe");
    // GetElementPtrInst *structVar = accessStructVar(before, Struct,  writesList[0][0]->getOperand(1),  writesList[0][0]->getOperand(2));
    // LoadInst *loadVar = new LoadInst(structVar->getType()->getContainedType(0), structVar, "tmp", before);
    // loadVar->setAlignment(MaybeAlign(2));

    // GetElementPtrInst *Struct2 = accessStruct(before, "unsafe");
    // GetElementPtrInst *structVar2 = accessStructVar(before, Struct2,  writesList[0][0]->getOperand(1),  writesList[0][0]->getOperand(2));
    // StoreInst *storeVar = new StoreInst(loadVar, structVar2, before);
    // storeVar->setAlignment(MaybeAlign(2));

    // cpas
    // GetElementPtrInst *Struct = accessStruct(before, "safe"); // access struct
    // GetElementPtrInst *structVar = accessStructVar(before, Struct,  writesList[0][0]->getOperand(1),  writesList[0][0]->getOperand(2)); //access array

    // cpa
    // Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    // Constant *arg1 = ConstantInt::get(i16_type, 0);
    // Type *pi8 = Type::getInt8PtrTy(myModule->getContext());

    // vector<Value *> index; 
    // index.push_back(arg1);
    // index.push_back(arg1);

    // GetElementPtrInst *Struct = accessStruct(before, "unsafe");
    // GetElementPtrInst *structVar = accessStructVar(before, Struct,  writesList[0][0]->getOperand(1),  writesList[0][0]->getOperand(2));
    // GetElementPtrInst *arraydecay = GetElementPtrInst::Create(structVar->getType()->getContainedType(0), StructVar, index, "array", before);
    // auto bCast1 = new BitCastInst(arraydecay, pi8, "cast", before);

    // GetElementPtrInst *Struct1 = accessStruct(before, "safe");
    // GetElementPtrInst *structVar1 = accessStructVar(before, Struct1,  writesList[0][0]->getOperand(1),  writesList[0][0]->getOperand(2));
    // GetElementPtrInst *arraydecay1 = GetElementPtrInst::Create(structVar1->getType()->getContainedType(0), StructVar1, index, "array", before);
    // auto bCast2 = new BitCastInst(arraydecay1, pi8, "cast", before);

    //get intrinsic memcpy here to copy the two arrays

    // Function *fun = getIntrinsicMemcpy();
    // vector<Value*> memcpyArgs;
    // memcpyArgs.push_back(bCast1);
    // memcpyArgs.push_back(bCast2);
    // memcpyArgs.push_back(arg3);
    // memcpyArgs.push_back(arg4);

    // insert memcpy
    CallInst *call = CallInst::Create(fun, memcpyArgs, "", before);


    // debugging
    // loadVar->dump();
    // storeVar->dump();

    // errs () << task + "\n";
    // errs () << writesList.size() << "\n";
    
}

GetElementPtrInst* Modify::accessStruct(Instruction *before, StringRef name) {

    Type *i32_type = IntegerType::getInt32Ty(myModule->getContext());
    Constant *arg1 = ConstantInt::get(i32_type, 0);
    Constant *arg2 = ConstantInt::get(i32_type, 1);
    vector<Value *> index; 
    index.push_back(arg1);
    index.push_back(arg2);

    Value *ptr = globals[name];
    Type *Ty = ptr->getType()->getContainedType(0); 
    LoadInst *loadStruct = new LoadInst(Ty, ptr, "tmp", before);
    loadStruct->setAlignment(MaybeAlign(2));
    GetElementPtrInst *GEP = GetElementPtrInst::Create(Ty->getContainedType(0), loadStruct, index, "global", before);

    // Instruction* access[2];
    // access[0] = loadStruct;
    // access[1] = GEP;

    //  debugging
    // loadStruct->dump();
    // GEP->dump();

    return GEP;
}

GetElementPtrInst* Modify::accessStructVar(Instruction *before, GetElementPtrInst* Struct, Value* index1, Value* index2) {

    vector<Value*> index;
    index.push_back(index1);
    index.push_back(index2);

    GetElementPtrInst *GEP = GetElementPtrInst::Create(Struct->getType()->getContainedType(0), Struct, index, "global", before);

    // debugging
    // GEP->dump();

    return GEP;
}

GetElementPtrInst* Modify::accessIndex(Instruction *before, GetElementPtrInst* index, GetElementPtrInst* ar) {

    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *start = ConstantInt::get(i16_type, 0);

    vector<Value*> indices;
    indices.push_back(start);
    indices.push_back(index);

    LoadInst *load = new LoadInst(index->getType()->getContainedType(0), index, "load", before);
    GetElementPtrInst *GEP = GetElementPtrInst::Create(ar->getType()->getContainedType(0), ar, indices, "access", before);

    // debugging
    load->dump();
    GEP->dump();

    return GEP;

}