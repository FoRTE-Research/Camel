#include "Modify.h"

void Modify::copyVariables(StringRef task, Instruction* before, map < StringRef, vector<vector<Instruction*>> > list) {

    // CallInst *taskCall = dyn_cast<CallInst>(before);
    // StringRef taskName = taskCall->getCalledFunction()->getName();
    StringRef taskName = task;
    vector<vector<Instruction*>> varList = list[taskName];

    // errs () << taskName + "\n";

    for (int i=0; i<varList.size(); i++){
        
        if (varList[i].size() == 1) {

            if (varList[i][0]->getType()->getContainedType(0)->isStructTy())
                cps_s(before, varList[i]);
            else
                cps(before, varList[i]);
        }
        else if (varList[i].size() == 2){
            
            auto ty = dyn_cast<CompositeType>(varList[i][0]->getType()->getContainedType(0));
            if (ty->getTypeAtIndex(1)->isStructTy()){
                cpas_s(before, varList[i]);
            }
            else{
                cpas(before, varList[i]);
            }
        }
    }
}

Function* Modify::getIntrinsicMemcpy() {

    vector<Type*> arg_type; //a vector for the type of arguements memcpy has

    //push all types of arguements in our vector
    arg_type.push_back(Type::getInt8PtrTy(myModule->getContext()));
    arg_type.push_back(Type::getInt8PtrTy(myModule->getContext()));
    arg_type.push_back(Type::getInt64Ty(myModule->getContext()));

    //getDeclaration gets the function memcpy
    Function *fun = Intrinsic::getDeclaration(myModule, Intrinsic::memcpy, arg_type);
    
    return fun;
    
}

void Modify::copyBuffers(Instruction *before, string to, string from) {
    // TO DO: Shorten this function by using accessStruct and accessStructVar functions

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
    LoadInst *loadUnsafe = new LoadInst(Ty, unsafePtr, "unsafe", before);
    loadUnsafe->setAlignment(MaybeAlign(2));
    auto GEP1 = GetElementPtrInst::CreateInBounds(Ty->getContainedType(0), loadUnsafe, index, "globals", before);

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(GEP1->getType()->getContainedType(0));
    bytes += size_temp;

    auto bCast1 = new BitCastInst(GEP1, pi8, "BCast", before);

    // loading the SAFE pointer
    LoadInst *loadSafe = new LoadInst(Ty, safePtr, "safe", before);
    loadSafe->setAlignment(MaybeAlign(2));
    auto GEP2 = GetElementPtrInst::CreateInBounds(Ty->getContainedType(0), loadSafe, index, "globals", before);
    auto bCast2 = new BitCastInst(GEP2, pi8, "BCast", before);
 
    // set memcpy arguments
    auto dl = myModule->getDataLayout();
    auto size_of_struct = dl.getTypeAllocSize(GEP1->getType()->getContainedType(0));
    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *arg3 = ConstantInt::get(i16_type, size_of_struct);
    Constant *arg4 = ConstantInt::getFalse(myModule->getContext());

    // Function *fun = getIntrinsicMemcpy();
    // vector<Value*> memcpyArgs;

    // memcpyArgs.push_back(bCast1);
    // memcpyArgs.push_back(bCast2);
    // memcpyArgs.push_back(arg3);
    // memcpyArgs.push_back(arg4);

    //CallInst *call = CallInst::Create(fun, memcpyArgs, "", before);

    // insert memcpy
    IRBuilder<> builder(before);
    CallInst *call = builder.CreateMemCpy(bCast1, 2, bCast2, 2, arg3);

    // printing for debugging
    // loadUnsafe->dump();
    // GEP1->dump();
    // bCast1->dump();
    // loadSafe->dump();
    // GEP2->dump();
    // bCast2->dump();
    // call->dump();
    
}

void Modify::varToGlob(GlobalVariable* g, AllocaInst *a){

    Function *ParentTask = a->getParent()->getParent();
    Instruction *end = ParentTask->back().getTerminator();
    LoadInst *localVar = new LoadInst(a->getType()->getContainedType(0), a, "load", end);

    StoreInst *globVar = new StoreInst(localVar, g, end);
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
    GetElementPtrInst *GEP = GetElementPtrInst::CreateInBounds(Ty->getContainedType(0), loadStruct, index, "global", before);

    //  debugging
    // loadStruct->dump();
    // GEP->dump();

    return GEP;
}

GetElementPtrInst* Modify::accessStructVar(Instruction *before, GetElementPtrInst* Struct, Value* index1, Value* index2) {

    vector<Value*> index;
    index.push_back(index1);
    index.push_back(index2);

    GetElementPtrInst *GEP = GetElementPtrInst::CreateInBounds(Struct->getType()->getContainedType(0), Struct, index, "global", before);

   // errs() << "size: " << size << "\n";
    // debugging
    //GEP->dump();

    return GEP;
}

GetElementPtrInst* Modify::accessIndex(Instruction *before, Instruction* index, Instruction* ar) {

    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *start = ConstantInt::get(i16_type, 0);

    LoadInst *load = new LoadInst(index->getType()->getContainedType(0), index, "load", before);
    load->setAlignment(MaybeAlign(2));

    vector<Value*> indices;
    indices.push_back(start);
    indices.push_back(load);

    GetElementPtrInst *GEP = GetElementPtrInst::CreateInBounds(ar->getType()->getContainedType(0), ar, indices, "access", before);


    // debugging
    // load->dump();
    // GEP->dump();

    return GEP;
}

GlobalVariable* Modify::createGlob(StringRef name, AllocaInst* var) {

    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    auto v = ConstantInt::get(i16_type, 0);
    GlobalVariable *gVar = new GlobalVariable(*myModule, var->getType()->getContainedType(0), 0, GlobalValue::CommonLinkage, v, name);
    gVar->setDSOLocal(true);
    gVar->setAlignment(var->getAlignment());

    pair<StringRef, GlobalVariable*> p(gVar->getName(),gVar);
    globals.insert(p);

    //gVar->dump();
    return gVar;
}

void Modify::cps(Instruction* before, vector<Instruction*> varList) {

    //errs() << "CPS\n";
    //change getOperand(2) to getOperand(3)

    GEPOperator *first = dyn_cast<GEPOperator>(varList[0]);

    GetElementPtrInst *Struct = accessStruct(before, "safe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(structVar->getType()->getContainedType(0));
    bytes += size_temp;

    LoadInst *loadVar = new LoadInst(structVar->getType()->getContainedType(0), structVar, "tmp", before);
    loadVar->setAlignment(MaybeAlign(2));

    //debugging
    //loadVar->dump();

    GetElementPtrInst *Struct2 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar2 = accessStructVar(before, Struct2,  first->getOperand(1),  first->getOperand(2));
    StoreInst *storeVar = new StoreInst(loadVar, structVar2, before);
    storeVar->setAlignment(MaybeAlign(2));

    //debugging
    //storeVar->dump();

}

void Modify::cpas(Instruction *before, vector<Instruction*> varList) {

    if (!varList[1]){
        cpa(before, varList);
        return;
    }

    GEPOperator *first = dyn_cast<GEPOperator>(varList[0]);
    GEPOperator *second = dyn_cast<GEPOperator>(varList[1]);

    if (first == NULL || second == NULL ){

        AllocaInst *a = dyn_cast<AllocaInst>(varList[1]);
        // a->dump();

        GlobalVariable *g; 
        if (!globals.count(a->getName())) {
            g = createGlob(a->getName(), a);
        }
        else {
            g = globals[a->getName()];
        }

        varToGlob(g, a);
        vector<Instruction*> varList2;
        varList2.push_back(varList[0]);
        varList2.push_back(dyn_cast<Instruction>(g));
        cpaso(before, varList[0], g);
        return;
    }

    //errs() << "CPAS\n";

    GetElementPtrInst *Struct = accessStruct(before, "safe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));
    GetElementPtrInst *Struct1 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar1 = accessStructVar(before, Struct1,  second->getOperand(1),  second->getOperand(2));
    GetElementPtrInst* arrayidx = accessIndex(before, structVar1, structVar);

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(arrayidx->getType()->getContainedType(0));
    bytes += size_temp;

    LoadInst *load = new LoadInst(arrayidx->getType()->getContainedType(0), arrayidx, "tmp", before);
    load->setAlignment(MaybeAlign(2));

    //debugging
    //load->dump();

    GetElementPtrInst *Struct2 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar2 = accessStructVar(before, Struct2,  first->getOperand(1),  first->getOperand(2));
    GetElementPtrInst *Struct3 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar3 = accessStructVar(before, Struct3,  second->getOperand(1),  second->getOperand(2));
    GetElementPtrInst* arrayidx2 = accessIndex(before, structVar3, structVar2);
    StoreInst *store = new StoreInst(load, arrayidx2, before);
    store->setAlignment(MaybeAlign(2));

    //debugging
    //store->dump();

}

void Modify::cpa(Instruction* before, vector<Instruction*> varList) {

    //errs() << "CPA\n";
    //change getOperand(2) to getOperand(3)


    GEPOperator *first = dyn_cast<GEPOperator>(varList[0]);

    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *arg1 = ConstantInt::get(i16_type, 0);
    Type *pi8 = Type::getInt8PtrTy(myModule->getContext());

    vector<Value *> index; 
    index.push_back(arg1);
    index.push_back(arg1);

    GetElementPtrInst *Struct = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(structVar->getType()->getContainedType(0));
    bytes += size_temp;

    GetElementPtrInst *arraydecay = GetElementPtrInst::CreateInBounds(structVar->getType()->getContainedType(0), structVar, index, "array", before);
    auto bCast1 = new BitCastInst(arraydecay, pi8, "cast", before);

    // debugging
    //bCast1->dump();

    GetElementPtrInst *Struct1 = accessStruct(before, "safe");
    GetElementPtrInst *structVar1 = accessStructVar(before, Struct1,  first->getOperand(1),  first->getOperand(2));
    GetElementPtrInst *arraydecay1 = GetElementPtrInst::CreateInBounds(structVar1->getType()->getContainedType(0), structVar1, index, "array", before);
    auto bCast2 = new BitCastInst(arraydecay1, pi8, "cast", before);

    // debugging
    //bCast2->dump();

    // set memcpy arguments
    auto dl = myModule->getDataLayout();
    auto size_of_struct = dl.getTypeAllocSize(structVar1->getType()->getContainedType(0));

    Type *i64_type = IntegerType::getInt64Ty(myModule->getContext());
    Constant *arg3 = ConstantInt::get(i16_type, size_of_struct);
    Constant *arg4 = ConstantInt::getFalse(myModule->getContext());

    //get intrinsic memcpy here to copy the two arrays
    // Function *fun = getIntrinsicMemcpy();
    // vector<Value*> memcpyArgs;
    // memcpyArgs.push_back(bCast1);
    // memcpyArgs.push_back(bCast2);
    // memcpyArgs.push_back(arg3);
    // memcpyArgs.push_back(arg4);

    // CallInst *call = CallInst::Create(fun, memcpyArgs, "", before);

    //insert memcpy
    IRBuilder<> builder(before);
    CallInst *call = builder.CreateMemCpy(bCast1, 2, bCast2, 2, arg3);

    // debugging
    //call->dump();
}

void Modify::cpaso(Instruction* before, Instruction* ar, GlobalVariable *g){

    //errs() << "CPASO\n";

    GEPOperator *first = dyn_cast<GEPOperator>(ar);
    GlobalVariable *second = dyn_cast<GlobalVariable>(g);


    if (first == NULL || second == NULL)
        return;

    GetElementPtrInst *Struct = accessStruct(before, "safe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));
    LoadInst *load = new LoadInst(second->getType()->getContainedType(0), second, "tmp", before);
    load->setAlignment(MaybeAlign(2));

    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *start = ConstantInt::get(i16_type, 0);

    vector<Value*> indices;
    indices.push_back(start);
    indices.push_back(load);

    GetElementPtrInst *GEP = GetElementPtrInst::CreateInBounds(structVar->getType()->getContainedType(0), structVar, indices, "access", before);

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(GEP->getType()->getContainedType(0));
    bytes += size_temp;

    LoadInst *loadArray = new LoadInst(GEP->getType()->getContainedType(0), GEP, "tmp", before);
    loadArray->setAlignment(MaybeAlign(2));

    GetElementPtrInst *Struct1 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar1 = accessStructVar(before, Struct1,  first->getOperand(1),  first->getOperand(2));
    LoadInst *load1 = new LoadInst(second->getType()->getContainedType(0), second, "tmp", before);
    load1->setAlignment(MaybeAlign(2));

    vector<Value*> indices1;
    indices1.push_back(start);
    indices1.push_back(load1);
    GetElementPtrInst *GEP1 = GetElementPtrInst::CreateInBounds(structVar1->getType()->getContainedType(0), structVar1, indices1, "access", before);
    // LoadInst *loadArray1 = new LoadInst(GEP1->getType()->getContainedType(0), GEP1, "tmp", before);
    // loadArray1->setAlignment(MaybeAlign(2));

    StoreInst *store = new StoreInst(loadArray, GEP1, before);
    store->setAlignment(MaybeAlign(2));

}

void Modify::cps_s(Instruction *before, vector<Instruction*> varList){

    //errs() << "CPS_S\n";
    Type *pi8 = Type::getInt8PtrTy(myModule->getContext());

    GEPOperator *first = dyn_cast<GEPOperator>(varList[0]);
    //GEPOperator *second = dyn_cast<GEPOperator>(varList[1]);

    GetElementPtrInst *Struct = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(structVar->getType()->getContainedType(0));
    bytes += size_temp;

    GetElementPtrInst *Struct2 = accessStruct(before, "safe");
    GetElementPtrInst *structVar2 = accessStructVar(before, Struct2,  first->getOperand(1),  first->getOperand(2));

    BitCastInst *bCast1 = new BitCastInst(structVar, pi8, "cast", before);
    BitCastInst *bCast2 = new BitCastInst(structVar2, pi8, "cast", before);

    auto dl = myModule->getDataLayout();
    auto size_of_struct = dl.getTypeAllocSize(structVar2->getType()->getContainedType(0));
    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *arg3 = ConstantInt::get(i16_type, size_of_struct);

    IRBuilder<> builder(before);
    CallInst *call = builder.CreateMemCpy(bCast1, 2, bCast2, 2, arg3);

}

void Modify::cpas_s(Instruction *before, vector<Instruction*> varList) {

    if (!varList[1]){
        cpa(before, varList);
        return;
    }

    //errs() << "CPAS_S\n";

    GEPOperator *first = dyn_cast<GEPOperator>(varList[0]);
    GEPOperator *second = dyn_cast<GEPOperator>(varList[1]);

    GetElementPtrInst *Struct = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar = accessStructVar(before, Struct,  first->getOperand(1),  first->getOperand(2));
    GetElementPtrInst *Struct1 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar1 = accessStructVar(before, Struct1,  second->getOperand(1),  second->getOperand(2));
    // LoadInst *load = new LoadInst(structVar1->getType()->getContainedType(0), structVar1, "tmp", before);
    // load->setAlignment(MaybeAlign(2));

    GetElementPtrInst* arrayidx = accessIndex(before, structVar1, structVar);

    auto dl_temp = myModule->getDataLayout();
    auto size_temp = dl_temp.getTypeAllocSize(arrayidx->getType()->getContainedType(0));
    bytes += size_temp;

    GetElementPtrInst *Struct2 = accessStruct(before, "safe");
    GetElementPtrInst *structVar2 = accessStructVar(before, Struct2,  first->getOperand(1),  first->getOperand(2));
    GetElementPtrInst *Struct3 = accessStruct(before, "unsafe");
    GetElementPtrInst *structVar3 = accessStructVar(before, Struct3,  second->getOperand(1),  second->getOperand(2));
    // LoadInst *load1 = new LoadInst(structVar3->getType()->getContainedType(0), structVar3, "tmp", before);
    // load1->setAlignment(MaybeAlign(2));

    GetElementPtrInst* arrayidx2 = accessIndex(before, structVar3, structVar2);

    Type *pi8 = Type::getInt8PtrTy(myModule->getContext());
    BitCastInst *bCast1 = new BitCastInst(arrayidx, pi8, "cast", before);
    BitCastInst *bCast2 = new BitCastInst(arrayidx2, pi8, "cast", before);   

    auto dl = myModule->getDataLayout();

    auto tyy = dyn_cast<CompositeType>(structVar2->getType()->getContainedType(0));

    auto size_of_struct = dl.getTypeAllocSize(tyy->getTypeAtIndex(1));
    Type *i16_type = IntegerType::getInt16Ty(myModule->getContext());
    Constant *arg3 = ConstantInt::get(i16_type, size_of_struct);

    IRBuilder<> builder(before);
    CallInst *call = builder.CreateMemCpy(bCast1, 2, bCast2, 2, arg3);   
}
