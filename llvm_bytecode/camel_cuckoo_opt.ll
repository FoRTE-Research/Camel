; ModuleID = 'camel_cuckoo_opt.bc'
source_filename = "../benchmarks/camel_cuckoo.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [128 x i16], i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8 }

@WDTCTL = external dso_local global i16, align 2
@PADIR_L = external dso_local global i8, align 1
@PAOUT_L = external dso_local global i8, align 1
@PM5CTL0 = external dso_local global i16, align 2
@CSCTL0_H = external dso_local global i8, align 1
@CSCTL1 = external dso_local global i16, align 2
@CSCTL2 = external dso_local global i16, align 2
@CSCTL3 = external dso_local global i16, align 2
@FRCTL0 = external dso_local global i16, align 2
@camel = common dso_local global %struct.Camel zeroinitializer, align 2, !dbg !0
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !33
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !66
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !29
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !31
@init_key = dso_local local_unnamed_addr constant i16 1, align 2, !dbg !14
@writeOpt = dso_local local_unnamed_addr global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !24
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !68
@index_victim = common dso_local local_unnamed_addr global i16 0, align 2
@index2_victim = common dso_local local_unnamed_addr global i16 0, align 2
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !80 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !81, !tbaa !82
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !86, !tbaa !87
  %1 = or i8 %0, 1, !dbg !86
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !86, !tbaa !87
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !88, !tbaa !87
  %3 = and i8 %2, -2, !dbg !88
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !88, !tbaa !87
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !89, !tbaa !82
  %and4 = and i16 %4, -2, !dbg !89
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !89, !tbaa !82
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !90, !tbaa !87
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !91, !tbaa !82
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !92, !tbaa !82
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !93, !tbaa !82
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !94, !tbaa !87
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !95, !tbaa !82
  ret void, !dbg !96
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !97 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !103, !tbaa !105
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !111

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !112, !tbaa !114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !116, !tbaa !114
  br label %if.end4, !dbg !117

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !118, !tbaa !114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !121, !tbaa !114
  br label %if.end4, !dbg !122

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !123
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !125, !tbaa !114
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !125
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !125
  %2 = load i16, i16* %arrayidx, align 2, !dbg !125, !tbaa !127
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #11, !dbg !125, !srcloc !128
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !129, !srcloc !130
  call void @llvm.dbg.value(metadata i16 %3, metadata !99, metadata !DIExpression()), !dbg !131
  %add = add i16 %3, 2, !dbg !132
  %4 = inttoptr i16 %add to i8*, !dbg !133
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !134, !srcloc !135
  call void @llvm.dbg.value(metadata i16 %5, metadata !101, metadata !DIExpression()), !dbg !136
  %sub = sub i16 9214, %5, !dbg !137
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !138
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !139, !tbaa !127
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !140, !tbaa !114
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 298, i16 zeroext %call) #11, !dbg !141
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !142, !tbaa !127
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !143, !tbaa !114
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !145
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !145, !tbaa !146
  %cmp9 = icmp eq i16 %call8, %8, !dbg !147
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !148

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !149, !tbaa !114
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !151
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(300) %9, i8* nonnull align 2 dereferenceable(300) %10, i16 300, i1 false), !dbg !151
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !152, !tbaa !82
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !154, !tbaa !87
  %12 = or i8 %11, 1, !dbg !154
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !154, !tbaa !87
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !155, !tbaa !87
  %14 = and i8 %13, -2, !dbg !155
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !155, !tbaa !87
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !156, !tbaa !82
  %and4.i = and i16 %15, -2, !dbg !156
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !156, !tbaa !82
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !157, !tbaa !87
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !158, !tbaa !82
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !159, !tbaa !82
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !160, !tbaa !82
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !161, !tbaa !87
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !162, !tbaa !82
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !163, !tbaa !114
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !163
  tail call void @__restore_registers(i16* %arraydecay) #11, !dbg !164
  br label %if.end13, !dbg !165

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !166
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !168
}

declare dso_local void @__crt0_start(...) local_unnamed_addr #2

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) local_unnamed_addr #2

; Function Attrs: noinline nounwind
define dso_local void @commit() local_unnamed_addr #5 !dbg !169 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !183, !tbaa !105
  %cmp = icmp eq i16 %0, 1, !dbg !184
  br i1 %cmp, label %if.then, label %if.else, !dbg !185

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !186, !tbaa !114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !187, !tbaa !114
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #11, !dbg !188
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !189, !srcloc !190
  call void @llvm.dbg.value(metadata i16 %1, metadata !171, metadata !DIExpression()), !dbg !191
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !192, !srcloc !193
  call void @llvm.dbg.value(metadata i16 %2, metadata !176, metadata !DIExpression()), !dbg !194
  br label %do.end, !dbg !195

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !196, !tbaa !114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !197, !tbaa !114
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #11, !dbg !198
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !199, !srcloc !200
  call void @llvm.dbg.value(metadata i16 %3, metadata !178, metadata !DIExpression()), !dbg !201
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !202, !srcloc !203
  call void @llvm.dbg.value(metadata i16 %4, metadata !181, metadata !DIExpression()), !dbg !204
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink7 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !205
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !205
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !205
  %sub = sub i16 9214, %.sink7, !dbg !205
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !205
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !205, !tbaa !127
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !205, !tbaa !114
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 298, i16 zeroext %call) #11, !dbg !205
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !205, !tbaa !127
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !205, !tbaa !114
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !205
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !205, !tbaa !146
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !205, !tbaa !105
  ret void, !dbg !206
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() local_unnamed_addr #6 !dbg !207 {
entry:
  %i = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !210
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !210
  call void @llvm.dbg.declare(metadata i16* %i, metadata !209, metadata !DIExpression()), !dbg !211
  store i16 0, i16* %i, align 2, !dbg !212, !tbaa !82
  br label %for.cond, !dbg !214

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !215, !tbaa !82
  %cmp = icmp ult i16 %1, 128, !dbg !217
  br i1 %cmp, label %for.body, label %for.end, !dbg !218

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !219, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !219
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !219
  %3 = load i16, i16* %i, align 2, !dbg !221, !tbaa !82
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %3, !dbg !219
  store i16 0, i16* %arrayidx, align 2, !dbg !222, !tbaa !127
  br label %for.inc, !dbg !223

for.inc:                                          ; preds = %for.body
  %4 = load i16, i16* %i, align 2, !dbg !224, !tbaa !82
  %inc = add i16 %4, 1, !dbg !224
  store i16 %inc, i16* %i, align 2, !dbg !224, !tbaa !82
  br label %for.cond, !dbg !225, !llvm.loop !226

for.end:                                          ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !228, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !228
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !228
  store i16 0, i16* %insert_count, align 2, !dbg !229, !tbaa !230
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !231, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !231
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !231
  store i16 0, i16* %lookup_count, align 2, !dbg !232, !tbaa !233
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234, !tbaa !114
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !234
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !234
  store i16 0, i16* %inserted_count, align 2, !dbg !235, !tbaa !236
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !237, !tbaa !114
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !237
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !237
  store i16 0, i16* %member_count, align 2, !dbg !238, !tbaa !239
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !240, !tbaa !114
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !240
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !240
  store i16 1, i16* %key, align 2, !dbg !241, !tbaa !242
  %10 = bitcast i16* %i to i8*, !dbg !243
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #11, !dbg !243
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_generate_key() local_unnamed_addr #6 !dbg !244 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !245, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !245
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !245
  %1 = load i16, i16* %key, align 2, !dbg !245, !tbaa !242
  %add = add i16 %1, 1, !dbg !246
  %mul = mul i16 %add, 17, !dbg !247
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !248, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !248
  %key2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !248
  store i16 %mul, i16* %key2, align 2, !dbg !249, !tbaa !242
  ret void, !dbg !250
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes() local_unnamed_addr #6 !dbg !251 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !252, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !252
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !252
  %1 = load i16, i16* %key, align 2, !dbg !252, !tbaa !242
  %call = call fastcc zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !253
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !254
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !254
  store i16 %call, i16* %fingerprint, align 2, !dbg !255, !tbaa !256
  ret void, !dbg !257
}

; Function Attrs: norecurse nounwind readnone
define internal fastcc zeroext i16 @hash_to_fingerprint(i16 zeroext %key) unnamed_addr #7 !dbg !258 {
entry:
  call void @llvm.dbg.value(metadata i16 %key, metadata !262, metadata !DIExpression()), !dbg !263
  %key.addr.sroa.2.0.extract.shift = lshr i16 %key, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 2, metadata !270, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 5381, metadata !271, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 0, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 0, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 5381, metadata !271, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !273
  %conv.i = and i16 %key, 255, !dbg !275
  call void @llvm.dbg.value(metadata i16 1, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 %conv.i, metadata !271, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !273
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 1, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 %conv.i, metadata !271, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !273
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !273
  %0 = mul nuw nsw i16 %conv.i, 33, !dbg !278
  %add.1.i = add nuw nsw i16 %key.addr.sroa.2.0.extract.shift, 27205, !dbg !278
  %add1.1.i = add nuw i16 %add.1.i, %0, !dbg !279
  call void @llvm.dbg.value(metadata i16 2, metadata !272, metadata !DIExpression()), !dbg !273
  call void @llvm.dbg.value(metadata i16 %add1.1.i, metadata !271, metadata !DIExpression()), !dbg !273
  ret i16 %add1.1.i, !dbg !280
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_1() local_unnamed_addr #6 !dbg !281 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !282, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !282
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !282
  %1 = load i16, i16* %key, align 2, !dbg !282, !tbaa !242
  %call = call fastcc zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !283
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !284
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !284
  store i16 %call, i16* %index1, align 2, !dbg !285, !tbaa !286
  ret void, !dbg !287
}

; Function Attrs: norecurse nounwind readnone
define internal fastcc zeroext i16 @hash_to_index(i16 zeroext %fp) unnamed_addr #7 !dbg !288 {
entry:
  call void @llvm.dbg.value(metadata i16 %fp, metadata !293, metadata !DIExpression()), !dbg !295
  %fp.addr.sroa.2.0.extract.shift = lshr i16 %fp, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 2, metadata !270, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 5381, metadata !271, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 0, metadata !272, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 0, metadata !272, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 5381, metadata !271, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !296
  %conv.i = and i16 %fp, 255, !dbg !298
  call void @llvm.dbg.value(metadata i16 1, metadata !272, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 %conv.i, metadata !271, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !296
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 1, metadata !272, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 %conv.i, metadata !271, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !296
  call void @llvm.dbg.value(metadata i8* undef, metadata !264, metadata !DIExpression()), !dbg !296
  %0 = mul nuw nsw i16 %conv.i, 33, !dbg !299
  %add.1.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift, 69, !dbg !299
  %add1.1.i = add nuw nsw i16 %add.1.i, %0, !dbg !300
  call void @llvm.dbg.value(metadata i16 2, metadata !272, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 %add1.1.i, metadata !271, metadata !DIExpression()), !dbg !296
  call void @llvm.dbg.value(metadata i16 %add1.1.i, metadata !294, metadata !DIExpression()), !dbg !295
  %and = and i16 %add1.1.i, 127, !dbg !301
  ret i16 %and, !dbg !302
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() local_unnamed_addr #6 !dbg !303 {
entry:
  %fp_hash = alloca i16, align 2
  %0 = bitcast i16* %fp_hash to i8*, !dbg !306
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !306
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !305, metadata !DIExpression()), !dbg !307
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !308
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !308
  %2 = load i16, i16* %fingerprint, align 2, !dbg !308, !tbaa !256
  %call = call fastcc zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !309
  store i16 %call, i16* %fp_hash, align 2, !dbg !307, !tbaa !127
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !310
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !310
  %4 = load i16, i16* %index1, align 2, !dbg !310, !tbaa !286
  %5 = load i16, i16* %fp_hash, align 2, !dbg !311, !tbaa !127
  %xor = xor i16 %4, %5, !dbg !312
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !313, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !313
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !313
  store i16 %xor, i16* %index2, align 2, !dbg !314, !tbaa !315
  %7 = bitcast i16* %fp_hash to i8*, !dbg !316
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #11, !dbg !316
  ret void, !dbg !316
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() local_unnamed_addr #6 !dbg !317 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !325, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !325
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !325
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !326, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !326
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !326
  %2 = load i16, i16* %index1, align 2, !dbg !326, !tbaa !286
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !325
  %3 = load i16, i16* %arrayidx, align 2, !dbg !325, !tbaa !127
  %tobool = icmp ne i16 %3, 0, !dbg !325
  br i1 %tobool, label %if.else, label %if.then, !dbg !327

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !328
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !328
  store i8 1, i8* %success, align 2, !dbg !330, !tbaa !331
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332, !tbaa !114
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !332
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !332
  %6 = load i16, i16* %fingerprint, align 2, !dbg !332, !tbaa !256
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333, !tbaa !114
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !333
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !333
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !334, !tbaa !114
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !334
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !334
  %9 = load i16, i16* %index17, align 2, !dbg !334, !tbaa !286
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !333
  store i16 %6, i16* %arrayidx8, align 2, !dbg !335, !tbaa !127
  br label %if.end53, !dbg !336

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337, !tbaa !114
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !337
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !337
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338, !tbaa !114
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !338
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !338
  %12 = load i16, i16* %index2, align 2, !dbg !338, !tbaa !315
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !337
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !337, !tbaa !127
  %tobool13 = icmp ne i16 %13, 0, !dbg !337
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !339

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !340, !tbaa !114
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !340
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !340
  store i8 1, i8* %success16, align 2, !dbg !342, !tbaa !331
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343, !tbaa !114
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !343
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !343
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !343, !tbaa !256
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344, !tbaa !114
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !344
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !344
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345, !tbaa !114
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !345
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !345
  %19 = load i16, i16* %index222, align 2, !dbg !345, !tbaa !315
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !344
  store i16 %16, i16* %arrayidx23, align 2, !dbg !346, !tbaa !127
  br label %if.end52, !dbg !347

if.else24:                                        ; preds = %if.else
  %20 = bitcast i16* %fp_victim to i8*, !dbg !348
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %20) #11, !dbg !348
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !319, metadata !DIExpression()), !dbg !349
  %21 = bitcast i16* %index_victim to i8*, !dbg !350
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %21) #11, !dbg !350
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !324, metadata !DIExpression()), !dbg !351
  %call = call i16 @rand(), !dbg !352
  %rem = srem i16 %call, 2, !dbg !354
  %tobool25 = icmp ne i16 %rem, 0, !dbg !354
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !355

if.then26:                                        ; preds = %if.else24
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356, !tbaa !114
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !356
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !356
  %23 = load i16, i16* %index128, align 2, !dbg !356, !tbaa !286
  store i16 %23, i16* %index_victim, align 2, !dbg !358, !tbaa !127
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359, !tbaa !114
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !359
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !359
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360, !tbaa !114
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !360
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !360
  %26 = load i16, i16* %index132, align 2, !dbg !360, !tbaa !286
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %26, !dbg !359
  %27 = load i16, i16* %arrayidx33, align 2, !dbg !359, !tbaa !127
  store i16 %27, i16* %fp_victim, align 2, !dbg !361, !tbaa !127
  br label %if.end, !dbg !362

if.else34:                                        ; preds = %if.else24
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363, !tbaa !114
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !363
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !363
  %29 = load i16, i16* %index236, align 2, !dbg !363, !tbaa !315
  store i16 %29, i16* %index_victim, align 2, !dbg !365, !tbaa !127
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366, !tbaa !114
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !366
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !366
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367, !tbaa !114
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !367
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !367
  %32 = load i16, i16* %index240, align 2, !dbg !367, !tbaa !315
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %32, !dbg !366
  %33 = load i16, i16* %arrayidx41, align 2, !dbg !366, !tbaa !127
  store i16 %33, i16* %fp_victim, align 2, !dbg !368, !tbaa !127
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369, !tbaa !114
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !369
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !369
  %35 = load i16, i16* %fingerprint43, align 2, !dbg !369, !tbaa !256
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370, !tbaa !114
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !370
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !370
  %37 = load i16, i16* %index_victim, align 2, !dbg !371, !tbaa !127
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %37, !dbg !370
  store i16 %35, i16* %arrayidx46, align 2, !dbg !372, !tbaa !127
  %38 = load i16, i16* %index_victim, align 2, !dbg !373, !tbaa !127
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !374, !tbaa !114
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !374
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !374
  store i16 %38, i16* %index148, align 2, !dbg !375, !tbaa !286
  %40 = load i16, i16* %fp_victim, align 2, !dbg !376, !tbaa !127
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !377, !tbaa !114
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !377
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !377
  store i16 %40, i16* %fingerprint50, align 2, !dbg !378, !tbaa !256
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !379, !tbaa !114
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !379
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !379
  store i16 0, i16* %relocation_count, align 2, !dbg !380, !tbaa !381
  %43 = bitcast i16* %index_victim to i8*, !dbg !382
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %43) #11, !dbg !382
  %44 = bitcast i16* %fp_victim to i8*, !dbg !382
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %44) #11, !dbg !382
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  %load = load i16, i16* %index_victim
  store i16 %load, i16* @index_victim
  ret void, !dbg !383
}

declare dso_local i16 @rand() local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() local_unnamed_addr #6 !dbg !384 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %0 = bitcast i16* %fp_victim to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !389
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !386, metadata !DIExpression()), !dbg !390
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !391, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !391
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !391
  %2 = load i16, i16* %fingerprint, align 2, !dbg !391, !tbaa !256
  store i16 %2, i16* %fp_victim, align 2, !dbg !390, !tbaa !127
  %3 = bitcast i16* %fp_hash_victim to i8*, !dbg !392
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !392
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !387, metadata !DIExpression()), !dbg !393
  %4 = load i16, i16* %fp_victim, align 2, !dbg !394, !tbaa !127
  %call = call fastcc zeroext i16 @hash_to_index(i16 zeroext %4), !dbg !395
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !393, !tbaa !127
  %5 = bitcast i16* %index2_victim to i8*, !dbg !396
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !396
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !388, metadata !DIExpression()), !dbg !397
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !398, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !398
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !398
  %7 = load i16, i16* %index1, align 2, !dbg !398, !tbaa !286
  %8 = load i16, i16* %fp_hash_victim, align 2, !dbg !399, !tbaa !127
  %xor = xor i16 %7, %8, !dbg !400
  store i16 %xor, i16* %index2_victim, align 2, !dbg !397, !tbaa !127
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !401, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !401
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !401
  %10 = load i16, i16* %index2_victim, align 2, !dbg !403, !tbaa !127
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %10, !dbg !401
  %11 = load i16, i16* %arrayidx, align 2, !dbg !401, !tbaa !127
  %tobool = icmp ne i16 %11, 0, !dbg !401
  br i1 %tobool, label %if.end, label %if.then, !dbg !404

if.then:                                          ; preds = %entry
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405, !tbaa !114
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !405
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !405
  store i8 1, i8* %success, align 2, !dbg !407, !tbaa !331
  %13 = load i16, i16* %fp_victim, align 2, !dbg !408, !tbaa !127
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !409, !tbaa !114
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !409
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !409
  %15 = load i16, i16* %index2_victim, align 2, !dbg !410, !tbaa !127
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %15, !dbg !409
  store i16 %13, i16* %arrayidx6, align 2, !dbg !411, !tbaa !127
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !412

if.end:                                           ; preds = %entry
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413, !tbaa !114
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !413
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !413
  %17 = load i16, i16* %relocation_count, align 2, !dbg !413, !tbaa !381
  %cmp = icmp uge i16 %17, 8, !dbg !415
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !416

if.then8:                                         ; preds = %if.end
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417, !tbaa !114
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !417
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !417
  store i8 0, i8* %success10, align 2, !dbg !419, !tbaa !331
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !420

if.end11:                                         ; preds = %if.end
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !421, !tbaa !114
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !421
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !421
  %20 = load i16, i16* %relocation_count13, align 2, !dbg !422, !tbaa !381
  %inc = add i16 %20, 1, !dbg !422
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !422, !tbaa !381
  %21 = load i16, i16* %index2_victim, align 2, !dbg !423, !tbaa !127
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424, !tbaa !114
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !424
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !424
  store i16 %21, i16* %index115, align 2, !dbg !425, !tbaa !286
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426, !tbaa !114
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !426
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !426
  %24 = load i16, i16* %index2_victim, align 2, !dbg !427, !tbaa !127
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %24, !dbg !426
  %25 = load i16, i16* %arrayidx18, align 2, !dbg !426, !tbaa !127
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !428, !tbaa !114
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !428
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !428
  store i16 %25, i16* %fingerprint20, align 2, !dbg !429, !tbaa !256
  %27 = load i16, i16* %fp_victim, align 2, !dbg !430, !tbaa !127
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !431, !tbaa !114
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !431
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !431
  %29 = load i16, i16* %index2_victim, align 2, !dbg !432, !tbaa !127
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %29, !dbg !431
  store i16 %27, i16* %arrayidx23, align 2, !dbg !433, !tbaa !127
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !434
  br label %cleanup, !dbg !434

cleanup:                                          ; preds = %if.end11, %if.then8, %if.then
  %30 = bitcast i16* %index2_victim to i8*, !dbg !434
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #11, !dbg !434
  %31 = bitcast i16* %fp_hash_victim to i8*, !dbg !434
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #11, !dbg !434
  %32 = bitcast i16* %fp_victim to i8*, !dbg !434
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #11, !dbg !434
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %cleanup, %cleanup
  ret void, !dbg !434

unreachable:                                      ; preds = %cleanup
  %load = load i16, i16* %index2_victim
  store i16 %load, i16* @index2_victim
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() local_unnamed_addr #6 !dbg !435 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !436
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !436
  %1 = load i16, i16* %insert_count, align 2, !dbg !437, !tbaa !230
  %inc = add i16 %1, 1, !dbg !437
  store i16 %inc, i16* %insert_count, align 2, !dbg !437, !tbaa !230
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !438
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !438
  %3 = load i8, i8* %success, align 2, !dbg !438, !tbaa !331, !range !439
  %tobool = trunc i8 %3 to i1, !dbg !438
  %conv = zext i1 %tobool to i16, !dbg !438
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !440
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !440
  %5 = load i16, i16* %inserted_count, align 2, !dbg !441, !tbaa !236
  %add = add i16 %5, %conv, !dbg !441
  store i16 %add, i16* %inserted_count, align 2, !dbg !441, !tbaa !236
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442, !tbaa !114
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !442
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !442
  %7 = load i16, i16* %insert_count4, align 2, !dbg !442, !tbaa !230
  %cmp = icmp uge i16 %7, 32, !dbg !444
  br i1 %cmp, label %if.then, label %if.end, !dbg !445

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446, !tbaa !114
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !446
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !446
  store i16 1, i16* %key, align 2, !dbg !448, !tbaa !242
  br label %if.end, !dbg !449

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !450
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() local_unnamed_addr #6 !dbg !451 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !452, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !452
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !452
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !454, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !454
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !454
  %2 = load i16, i16* %index1, align 2, !dbg !454, !tbaa !286
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !452
  %3 = load i16, i16* %arrayidx, align 2, !dbg !452, !tbaa !127
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !455, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !455
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !455
  %5 = load i16, i16* %fingerprint, align 2, !dbg !455, !tbaa !256
  %cmp = icmp eq i16 %3, %5, !dbg !456
  br i1 %cmp, label %if.then, label %if.else, !dbg !457

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !458, !tbaa !114
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !458
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !458
  store i8 1, i8* %member, align 1, !dbg !460, !tbaa !461
  br label %if.end17, !dbg !462

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !463, !tbaa !114
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !463
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !463
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !466, !tbaa !114
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !466
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !466
  %9 = load i16, i16* %index2, align 2, !dbg !466, !tbaa !315
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !463
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !463, !tbaa !127
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !467, !tbaa !114
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !467
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !467
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !467, !tbaa !256
  %cmp10 = icmp eq i16 %10, %12, !dbg !468
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !469

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !470, !tbaa !114
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !470
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !470
  store i8 1, i8* %member13, align 1, !dbg !472, !tbaa !461
  br label %if.end, !dbg !473

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474, !tbaa !114
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !474
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !474
  store i8 0, i8* %member16, align 1, !dbg !476, !tbaa !461
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  ret void, !dbg !477
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() local_unnamed_addr #6 !dbg !478 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !479, !tbaa !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !479
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !479
  %1 = load i16, i16* %lookup_count, align 2, !dbg !480, !tbaa !233
  %inc = add i16 %1, 1, !dbg !480
  store i16 %inc, i16* %lookup_count, align 2, !dbg !480, !tbaa !233
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481, !tbaa !114
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !481
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !481
  %3 = load i8, i8* %member, align 1, !dbg !481, !tbaa !461, !range !439
  %tobool = trunc i8 %3 to i1, !dbg !481
  %conv = zext i1 %tobool to i16, !dbg !481
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !482, !tbaa !114
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !482
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !482
  %5 = load i16, i16* %member_count, align 2, !dbg !483, !tbaa !239
  %add = add i16 %5, %conv, !dbg !483
  store i16 %add, i16* %member_count, align 2, !dbg !483, !tbaa !239
  ret void, !dbg !484
}

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @task_done() local_unnamed_addr #8 !dbg !485 {
entry:
  call void @exit(i16 0) #12, !dbg !486
  unreachable, !dbg !486
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #9

; Function Attrs: norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #7 !dbg !487 {
entry:
  ret void, !dbg !488
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #10 !dbg !489 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !492, !tbaa !105
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !493, !tbaa !114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !494, !tbaa !114
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !495, !tbaa !82
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !497, !tbaa !87
  %1 = or i8 %0, 1, !dbg !497
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !497, !tbaa !87
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !498, !tbaa !87
  %3 = and i8 %2, -2, !dbg !498
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !498, !tbaa !87
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !499, !tbaa !82
  %and4.i = and i16 %4, -2, !dbg !499
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !499, !tbaa !82
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !500, !tbaa !87
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !501, !tbaa !82
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !502, !tbaa !82
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !503, !tbaa !82
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !504, !tbaa !87
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !505, !tbaa !82
  tail call void @task_init(), !dbg !506
  tail call void @commit(), !dbg !506
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i16 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals2 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1
  %BCast7 = bitcast %struct.camel_global_t* %globals6 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(276) %BCast, i8* nonnull align 2 dereferenceable(276) %BCast7, i16 276, i1 false), !dbg !506
  %lookup_count3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1, i32 8, !dbg !507
  %5 = load i16, i16* %lookup_count3, align 2, !dbg !507, !tbaa !233
  %cmp4 = icmp ult i16 %5, 32, !dbg !508
  br i1 %cmp4, label %while.body, label %while.end21, !dbg !509

while.body:                                       ; preds = %entry, %if.end20
  tail call void @task_generate_key(), !dbg !510
  tail call void @commit(), !dbg !510
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 1
  %tmp9 = load i16, i16* %global8, align 2
  %tmp10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp10, i16 0, i32 1, i32 1
  store i16 %tmp9, i16* %global12, align 2
  tail call void @task_calc_indexes(), !dbg !512
  tail call void @commit(), !dbg !512
  %tmp13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp13, i16 0, i32 1, i32 2
  %tmp16 = load i16, i16* %global15, align 2
  %tmp17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i16 0, i32 1, i32 2
  store i16 %tmp16, i16* %global19, align 2
  tail call void @task_calc_indexes_index_1(), !dbg !513
  tail call void @commit(), !dbg !513
  %tmp20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i16 0, i32 1, i32 3
  %tmp23 = load i16, i16* %global22, align 2
  %tmp24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i16 0, i32 1, i32 3
  store i16 %tmp23, i16* %global26, align 2
  tail call void @task_calc_indexes_index_2(), !dbg !514
  tail call void @commit(), !dbg !514
  %tmp27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp27, i16 0, i32 1, i32 4
  %tmp30 = load i16, i16* %global29, align 2
  %tmp31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp31, i16 0, i32 1, i32 4
  store i16 %tmp30, i16* %global33, align 2
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp31, i16 0, i32 1, i32 6, !dbg !515
  %6 = load i16, i16* %insert_count, align 2, !dbg !515, !tbaa !230
  %cmp2 = icmp ult i16 %6, 32, !dbg !517
  br i1 %cmp2, label %if.then, label %if.else, !dbg !518

if.then:                                          ; preds = %while.body
  tail call void @task_add(), !dbg !519
  tail call void @commit(), !dbg !519
  %tmp34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp34, i16 0, i32 1, i32 10
  %tmp37 = load i8, i8* %global36, align 2
  %tmp38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 10
  store i8 %tmp37, i8* %global40, align 2
  %global46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 3
  %load = load i16, i16* %global46, align 2
  %access = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp34, i16 0, i32 1, i32 0, i16 %load
  %tmp47 = load i16, i16* %access, align 2
  %access55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 0, i16 %load
  store i16 %tmp47, i16* %access55, align 2
  %tmp56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %tmp59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i16 0, i32 1, i32 4
  %load62 = load i16, i16* %global61, align 2
  %access63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp56, i16 0, i32 1, i32 0, i16 %load62
  %tmp64 = load i16, i16* %access63, align 2
  %access72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i16 0, i32 1, i32 0, i16 %load62
  store i16 %tmp64, i16* %access72, align 2
  %tmp73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %tmp76 = load i16, i16* @index_victim, align 2
  %access77 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i16 0, i32 1, i32 0, i16 %tmp76
  %tmp78 = load i16, i16* %access77, align 2
  %tmp79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %access83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp79, i16 0, i32 1, i32 0, i16 %tmp76
  store i16 %tmp78, i16* %access83, align 2
  %tmp84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 3
  %tmp87 = load i16, i16* %global86, align 2
  %tmp88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i16 0, i32 1, i32 3
  store i16 %tmp87, i16* %global90, align 2
  %global93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 2
  %tmp94 = load i16, i16* %global93, align 2
  %global97 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i16 0, i32 1, i32 2
  store i16 %tmp94, i16* %global97, align 2
  %global100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 5
  %tmp101 = load i16, i16* %global100, align 2
  %global104 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i16 0, i32 1, i32 5
  store i16 %tmp101, i16* %global104, align 2
  %7 = load i16, i16* %global86, align 2, !dbg !521, !tbaa !286
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 0, i16 %7, !dbg !523
  %8 = load i16, i16* %arrayidx, align 2, !dbg !523, !tbaa !127
  %tobool = icmp eq i16 %8, 0, !dbg !523
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !524

land.lhs.true:                                    ; preds = %if.then
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 4, !dbg !525
  %9 = load i16, i16* %index2, align 2, !dbg !525, !tbaa !315
  %arrayidx8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 0, i16 %9, !dbg !526
  %10 = load i16, i16* %arrayidx8, align 2, !dbg !526, !tbaa !127
  %tobool9 = icmp eq i16 %10, 0, !dbg !526
  br i1 %tobool9, label %if.end, label %while.cond11.preheader, !dbg !527

while.cond11.preheader:                           ; preds = %land.lhs.true
  %success1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i16 0, i32 1, i32 10, !dbg !528
  %11 = load i8, i8* %success1, align 2, !dbg !528, !tbaa !331, !range !439
  %cmp142 = icmp eq i8 %11, 0, !dbg !530
  br i1 %cmp142, label %land.rhs, label %if.end, !dbg !531

land.rhs:                                         ; preds = %while.cond11.preheader, %while.body19
  %12 = phi %struct.camel_buffer_t* [ %tmp123, %while.body19 ], [ %tmp84, %while.cond11.preheader ]
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i16 0, i32 1, i32 5, !dbg !532
  %13 = load i16, i16* %relocation_count, align 2, !dbg !532, !tbaa !381
  %cmp17 = icmp ult i16 %13, 8, !dbg !533
  br i1 %cmp17, label %while.body19, label %if.end, !dbg !534

while.body19:                                     ; preds = %land.rhs
  tail call void @task_relocate(), !dbg !535
  tail call void @commit(), !dbg !535
  %tmp105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp105, i16 0, i32 1, i32 10
  %tmp108 = load i8, i8* %global107, align 2
  %tmp109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i16 0, i32 1, i32 10
  store i8 %tmp108, i8* %global111, align 2
  %tmp115 = load i16, i16* @index2_victim, align 2
  %access116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp105, i16 0, i32 1, i32 0, i16 %tmp115
  %tmp117 = load i16, i16* %access116, align 2
  %access122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i16 0, i32 1, i32 0, i16 %tmp115
  store i16 %tmp117, i16* %access122, align 2
  %tmp123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global125 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 5
  %tmp126 = load i16, i16* %global125, align 2
  %tmp127 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i16 0, i32 1, i32 5
  store i16 %tmp126, i16* %global129, align 2
  %global132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 3
  %tmp133 = load i16, i16* %global132, align 2
  %global136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i16 0, i32 1, i32 3
  store i16 %tmp133, i16* %global136, align 2
  %global139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 2
  %tmp140 = load i16, i16* %global139, align 2
  %global143 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i16 0, i32 1, i32 2
  store i16 %tmp140, i16* %global143, align 2
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 10, !dbg !528
  %14 = load i8, i8* %success, align 2, !dbg !528, !tbaa !331, !range !439
  %cmp14 = icmp eq i8 %14, 0, !dbg !530
  br i1 %cmp14, label %land.rhs, label %if.end, !dbg !531, !llvm.loop !537

if.end:                                           ; preds = %while.body19, %land.rhs, %while.cond11.preheader, %land.lhs.true, %if.then
  tail call void @task_insert_done(), !dbg !539
  tail call void @commit(), !dbg !539
  %tmp144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global146 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i16 0, i32 1, i32 6
  %tmp147 = load i16, i16* %global146, align 2
  %tmp148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i16 0, i32 1, i32 6
  store i16 %tmp147, i16* %global150, align 2
  %global153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i16 0, i32 1, i32 7
  %tmp154 = load i16, i16* %global153, align 2
  %global157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i16 0, i32 1, i32 7
  store i16 %tmp154, i16* %global157, align 2
  %global160 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i16 0, i32 1, i32 1
  %tmp161 = load i16, i16* %global160, align 2
  %global164 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i16 0, i32 1, i32 1
  store i16 %tmp161, i16* %global164, align 2
  br label %if.end20, !dbg !540

if.else:                                          ; preds = %while.body
  tail call void @task_lookup_search(), !dbg !541
  tail call void @commit(), !dbg !541
  %tmp165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp165, i16 0, i32 1, i32 11
  %tmp168 = load i8, i8* %global167, align 2
  %tmp169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp169, i16 0, i32 1, i32 11
  store i8 %tmp168, i8* %global171, align 2
  tail call void @task_lookup_done(), !dbg !543
  tail call void @commit(), !dbg !543
  %tmp172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i16 0, i32 1, i32 8
  %tmp175 = load i16, i16* %global174, align 2
  %tmp176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i16 0, i32 1, i32 8
  store i16 %tmp175, i16* %global178, align 2
  %global181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i16 0, i32 1, i32 9
  %tmp182 = load i16, i16* %global181, align 2
  %global185 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i16 0, i32 1, i32 9
  store i16 %tmp182, i16* %global185, align 2
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  %15 = phi %struct.camel_buffer_t* [ %tmp172, %if.else ], [ %tmp144, %if.end ], !dbg !507
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i16 0, i32 1, i32 8, !dbg !507
  %16 = load i16, i16* %lookup_count, align 2, !dbg !507, !tbaa !233
  %cmp = icmp ult i16 %16, 32, !dbg !508
  br i1 %cmp, label %while.body, label %while.end21, !dbg !509, !llvm.loop !544

while.end21:                                      ; preds = %if.end20, %entry
  tail call void @task_done(), !dbg !546
  unreachable
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind }
attributes #12 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!76, !77, !78}
!llvm.ident = !{!79}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 87, type: !71, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_cuckoo.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 16)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !9, line: 20, baseType: !10)
!9 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 29, baseType: !12)
!11 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{!14, !21, !24, !29, !31, !0, !33, !66, !68}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 265, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 18, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 424, type: !23, isLocal: false, isDefinition: true)
!23 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 473, type: !26, isLocal: true, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 54, type: !18, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 94, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 16)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 80, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 75, size: 2400, elements: !38)
!38 = !{!39, !44, !65}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !37, file: !3, line: 77, baseType: !40, size: 176)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 176, elements: !42)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 50, baseType: !18)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !37, file: !3, line: 78, baseType: !45, size: 2208, offset: 176)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 72, baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 57, size: 2208, elements: !47)
!47 = !{!48, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !46, file: !3, line: 59, baseType: !49, size: 2048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2048, elements: !51)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 20, baseType: !18)
!51 = !{!52}
!52 = !DISubrange(count: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !46, file: !3, line: 60, baseType: !17, size: 16, offset: 2048)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !46, file: !3, line: 61, baseType: !50, size: 16, offset: 2064)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !46, file: !3, line: 62, baseType: !17, size: 16, offset: 2080)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !46, file: !3, line: 63, baseType: !17, size: 16, offset: 2096)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !46, file: !3, line: 64, baseType: !17, size: 16, offset: 2112)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !46, file: !3, line: 65, baseType: !17, size: 16, offset: 2128)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !46, file: !3, line: 66, baseType: !17, size: 16, offset: 2144)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !46, file: !3, line: 67, baseType: !17, size: 16, offset: 2160)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !46, file: !3, line: 68, baseType: !17, size: 16, offset: 2176)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !46, file: !3, line: 69, baseType: !63, size: 8, offset: 2192)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !46, file: !3, line: 70, baseType: !63, size: 8, offset: 2200)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !37, file: !3, line: 79, baseType: !18, size: 16, offset: 2384)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 94, type: !35, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 123, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !42)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 82, size: 4816, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 84, baseType: !18, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 85, baseType: !36, size: 2400, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 86, baseType: !36, size: 2400, offset: 2416)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 96, type: !27, scopeLine: 96, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 97, column: 10, scope: !80)
!82 = !{!83, !83, i64 0}
!83 = !{!"int", !84, i64 0}
!84 = !{!"omnipotent char", !85, i64 0}
!85 = !{!"Simple C/C++ TBAA"}
!86 = !DILocation(line: 99, column: 9, scope: !80)
!87 = !{!84, !84, i64 0}
!88 = !DILocation(line: 101, column: 9, scope: !80)
!89 = !DILocation(line: 106, column: 11, scope: !80)
!90 = !DILocation(line: 111, column: 12, scope: !80)
!91 = !DILocation(line: 112, column: 10, scope: !80)
!92 = !DILocation(line: 113, column: 10, scope: !80)
!93 = !DILocation(line: 115, column: 10, scope: !80)
!94 = !DILocation(line: 116, column: 12, scope: !80)
!95 = !DILocation(line: 119, column: 10, scope: !80)
!96 = !DILocation(line: 121, column: 1, scope: !80)
!97 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 125, type: !27, scopeLine: 125, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !98)
!98 = !{!99, !101}
!99 = !DILocalVariable(name: "__x", scope: !100, file: !3, line: 152, type: !6)
!100 = distinct !DILexicalBlock(scope: !97, file: !3, line: 152, column: 33)
!101 = !DILocalVariable(name: "__x", scope: !102, file: !3, line: 152, type: !6)
!102 = distinct !DILexicalBlock(scope: !97, file: !3, line: 152, column: 65)
!103 = !DILocation(line: 126, column: 14, scope: !104)
!104 = distinct !DILexicalBlock(scope: !97, file: !3, line: 126, column: 8)
!105 = !{!106, !107, i64 0}
!106 = !{!"Camel", !107, i64 0, !108, i64 2, !108, i64 302}
!107 = !{!"short", !84, i64 0}
!108 = !{!"camel_buffer_t", !84, i64 0, !109, i64 22, !107, i64 298}
!109 = !{!"camel_global_t", !84, i64 0, !107, i64 256, !107, i64 258, !107, i64 260, !107, i64 262, !107, i64 264, !107, i64 266, !107, i64 268, !107, i64 270, !107, i64 272, !110, i64 274, !110, i64 275}
!110 = !{!"_Bool", !84, i64 0}
!111 = !DILocation(line: 126, column: 8, scope: !97)
!112 = !DILocation(line: 127, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !104, file: !3, line: 126, column: 34)
!114 = !{!115, !115, i64 0}
!115 = !{!"any pointer", !84, i64 0}
!116 = !DILocation(line: 128, column: 16, scope: !113)
!117 = !DILocation(line: 129, column: 5, scope: !113)
!118 = !DILocation(line: 130, column: 14, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !3, line: 129, column: 41)
!120 = distinct !DILexicalBlock(scope: !104, file: !3, line: 129, column: 15)
!121 = !DILocation(line: 131, column: 16, scope: !119)
!122 = !DILocation(line: 132, column: 5, scope: !119)
!123 = !DILocation(line: 133, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 132, column: 12)
!125 = !DILocation(line: 150, column: 3, scope: !126)
!126 = distinct !DILexicalBlock(scope: !97, file: !3, line: 150, column: 3)
!127 = !{!107, !107, i64 0}
!128 = !{i32 -2146593314}
!129 = !DILocation(line: 152, column: 33, scope: !100)
!130 = !{i32 -2146593078}
!131 = !DILocation(line: 0, scope: !100)
!132 = !DILocation(line: 152, column: 51, scope: !97)
!133 = !DILocation(line: 152, column: 33, scope: !97)
!134 = !DILocation(line: 152, column: 65, scope: !102)
!135 = !{i32 -2146592953}
!136 = !DILocation(line: 0, scope: !102)
!137 = !DILocation(line: 152, column: 63, scope: !97)
!138 = !DILocation(line: 152, column: 19, scope: !97)
!139 = !DILocation(line: 152, column: 17, scope: !97)
!140 = !DILocation(line: 153, column: 37, scope: !97)
!141 = !DILocation(line: 153, column: 23, scope: !97)
!142 = !DILocation(line: 153, column: 21, scope: !97)
!143 = !DILocation(line: 156, column: 27, scope: !144)
!144 = distinct !DILexicalBlock(scope: !97, file: !3, line: 156, column: 6)
!145 = !DILocation(line: 156, column: 33, scope: !144)
!146 = !{!108, !107, i64 298}
!147 = !DILocation(line: 156, column: 24, scope: !144)
!148 = !DILocation(line: 156, column: 6, scope: !97)
!149 = !DILocation(line: 157, column: 11, scope: !150)
!150 = distinct !DILexicalBlock(scope: !144, file: !3, line: 156, column: 51)
!151 = !DILocation(line: 157, column: 4, scope: !150)
!152 = !DILocation(line: 97, column: 10, scope: !80, inlinedAt: !153)
!153 = distinct !DILocation(line: 158, column: 4, scope: !150)
!154 = !DILocation(line: 99, column: 9, scope: !80, inlinedAt: !153)
!155 = !DILocation(line: 101, column: 9, scope: !80, inlinedAt: !153)
!156 = !DILocation(line: 106, column: 11, scope: !80, inlinedAt: !153)
!157 = !DILocation(line: 111, column: 12, scope: !80, inlinedAt: !153)
!158 = !DILocation(line: 112, column: 10, scope: !80, inlinedAt: !153)
!159 = !DILocation(line: 113, column: 10, scope: !80, inlinedAt: !153)
!160 = !DILocation(line: 115, column: 10, scope: !80, inlinedAt: !153)
!161 = !DILocation(line: 116, column: 12, scope: !80, inlinedAt: !153)
!162 = !DILocation(line: 119, column: 10, scope: !80, inlinedAt: !153)
!163 = !DILocation(line: 159, column: 24, scope: !150)
!164 = !DILocation(line: 159, column: 4, scope: !150)
!165 = !DILocation(line: 160, column: 3, scope: !150)
!166 = !DILocation(line: 161, column: 4, scope: !167)
!167 = distinct !DILexicalBlock(scope: !144, file: !3, line: 160, column: 9)
!168 = !DILocation(line: 164, column: 1, scope: !97)
!169 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 215, type: !27, scopeLine: 215, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !170)
!170 = !{!171, !176, !178, !181}
!171 = !DILocalVariable(name: "__x", scope: !172, file: !3, line: 222, type: !6)
!172 = distinct !DILexicalBlock(scope: !173, file: !3, line: 222, column: 45)
!173 = distinct !DILexicalBlock(scope: !174, file: !3, line: 218, column: 39)
!174 = distinct !DILexicalBlock(scope: !175, file: !3, line: 218, column: 14)
!175 = distinct !DILexicalBlock(scope: !169, file: !3, line: 216, column: 8)
!176 = !DILocalVariable(name: "__x", scope: !177, file: !3, line: 222, type: !6)
!177 = distinct !DILexicalBlock(scope: !173, file: !3, line: 222, column: 77)
!178 = !DILocalVariable(name: "__x", scope: !179, file: !3, line: 230, type: !6)
!179 = distinct !DILexicalBlock(scope: !180, file: !3, line: 230, column: 45)
!180 = distinct !DILexicalBlock(scope: !174, file: !3, line: 226, column: 17)
!181 = !DILocalVariable(name: "__x", scope: !182, file: !3, line: 230, type: !6)
!182 = distinct !DILexicalBlock(scope: !180, file: !3, line: 230, column: 77)
!183 = !DILocation(line: 218, column: 20, scope: !174)
!184 = !DILocation(line: 218, column: 25, scope: !174)
!185 = !DILocation(line: 218, column: 14, scope: !175)
!186 = !DILocation(line: 219, column: 17, scope: !173)
!187 = !DILocation(line: 220, column: 19, scope: !173)
!188 = !DILocation(line: 221, column: 12, scope: !173)
!189 = !DILocation(line: 222, column: 45, scope: !172)
!190 = !{i32 -2146592639}
!191 = !DILocation(line: 0, scope: !172)
!192 = !DILocation(line: 222, column: 77, scope: !177)
!193 = !{i32 -2146592514}
!194 = !DILocation(line: 0, scope: !177)
!195 = !DILocation(line: 226, column: 11, scope: !173)
!196 = !DILocation(line: 227, column: 17, scope: !180)
!197 = !DILocation(line: 228, column: 19, scope: !180)
!198 = !DILocation(line: 229, column: 12, scope: !180)
!199 = !DILocation(line: 230, column: 45, scope: !179)
!200 = !{i32 -2146592382}
!201 = !DILocation(line: 0, scope: !179)
!202 = !DILocation(line: 230, column: 77, scope: !182)
!203 = !{i32 -2146592257}
!204 = !DILocation(line: 0, scope: !182)
!205 = !DILocation(line: 0, scope: !174)
!206 = !DILocation(line: 238, column: 1, scope: !169)
!207 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 290, type: !27, scopeLine: 291, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !208)
!208 = !{!209}
!209 = !DILocalVariable(name: "i", scope: !207, file: !3, line: 292, type: !6)
!210 = !DILocation(line: 292, column: 5, scope: !207)
!211 = !DILocation(line: 292, column: 14, scope: !207)
!212 = !DILocation(line: 293, column: 12, scope: !213)
!213 = distinct !DILexicalBlock(scope: !207, file: !3, line: 293, column: 5)
!214 = !DILocation(line: 293, column: 10, scope: !213)
!215 = !DILocation(line: 293, column: 17, scope: !216)
!216 = distinct !DILexicalBlock(scope: !213, file: !3, line: 293, column: 5)
!217 = !DILocation(line: 293, column: 19, scope: !216)
!218 = !DILocation(line: 293, column: 5, scope: !213)
!219 = !DILocation(line: 294, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !216, file: !3, line: 293, column: 40)
!221 = !DILocation(line: 294, column: 20, scope: !220)
!222 = !DILocation(line: 294, column: 23, scope: !220)
!223 = !DILocation(line: 295, column: 5, scope: !220)
!224 = !DILocation(line: 293, column: 35, scope: !216)
!225 = !DILocation(line: 293, column: 5, scope: !216)
!226 = distinct !{!226, !218, !227}
!227 = !DILocation(line: 295, column: 5, scope: !213)
!228 = !DILocation(line: 296, column: 5, scope: !207)
!229 = !DILocation(line: 296, column: 22, scope: !207)
!230 = !{!108, !107, i64 288}
!231 = !DILocation(line: 297, column: 5, scope: !207)
!232 = !DILocation(line: 297, column: 22, scope: !207)
!233 = !{!108, !107, i64 292}
!234 = !DILocation(line: 298, column: 5, scope: !207)
!235 = !DILocation(line: 298, column: 24, scope: !207)
!236 = !{!108, !107, i64 290}
!237 = !DILocation(line: 299, column: 5, scope: !207)
!238 = !DILocation(line: 299, column: 22, scope: !207)
!239 = !{!108, !107, i64 294}
!240 = !DILocation(line: 300, column: 5, scope: !207)
!241 = !DILocation(line: 300, column: 13, scope: !207)
!242 = !{!108, !107, i64 278}
!243 = !DILocation(line: 301, column: 1, scope: !207)
!244 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 303, type: !27, scopeLine: 304, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!245 = !DILocation(line: 306, column: 16, scope: !244)
!246 = !DILocation(line: 306, column: 24, scope: !244)
!247 = !DILocation(line: 306, column: 29, scope: !244)
!248 = !DILocation(line: 306, column: 5, scope: !244)
!249 = !DILocation(line: 306, column: 13, scope: !244)
!250 = !DILocation(line: 307, column: 1, scope: !244)
!251 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 309, type: !27, scopeLine: 310, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!252 = !DILocation(line: 311, column: 43, scope: !251)
!253 = !DILocation(line: 311, column: 23, scope: !251)
!254 = !DILocation(line: 311, column: 5, scope: !251)
!255 = !DILocation(line: 311, column: 21, scope: !251)
!256 = !{!108, !107, i64 280}
!257 = !DILocation(line: 312, column: 1, scope: !251)
!258 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 285, type: !259, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !261)
!259 = !DISubroutineType(types: !260)
!260 = !{!50, !17}
!261 = !{!262}
!262 = !DILocalVariable(name: "key", arg: 1, scope: !258, file: !3, line: 285, type: !17)
!263 = !DILocation(line: 0, scope: !258)
!264 = !DILocalVariable(name: "data", arg: 1, scope: !265, file: !3, line: 267, type: !7)
!265 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 267, type: !266, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !269)
!266 = !DISubroutineType(types: !267)
!267 = !{!268, !7, !6}
!268 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 19, baseType: !18)
!269 = !{!264, !270, !271, !272}
!270 = !DILocalVariable(name: "len", arg: 2, scope: !265, file: !3, line: 267, type: !6)
!271 = !DILocalVariable(name: "hash", scope: !265, file: !3, line: 269, type: !18)
!272 = !DILocalVariable(name: "i", scope: !265, file: !3, line: 270, type: !6)
!273 = !DILocation(line: 0, scope: !265, inlinedAt: !274)
!274 = distinct !DILocation(line: 287, column: 12, scope: !258)
!275 = !DILocation(line: 273, column: 39, scope: !276, inlinedAt: !274)
!276 = distinct !DILexicalBlock(scope: !277, file: !3, line: 272, column: 5)
!277 = distinct !DILexicalBlock(scope: !265, file: !3, line: 272, column: 5)
!278 = !DILocation(line: 273, column: 29, scope: !276, inlinedAt: !274)
!279 = !DILocation(line: 273, column: 37, scope: !276, inlinedAt: !274)
!280 = !DILocation(line: 287, column: 5, scope: !258)
!281 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 314, type: !27, scopeLine: 315, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!282 = !DILocation(line: 316, column: 32, scope: !281)
!283 = !DILocation(line: 316, column: 18, scope: !281)
!284 = !DILocation(line: 316, column: 5, scope: !281)
!285 = !DILocation(line: 316, column: 16, scope: !281)
!286 = !{!108, !107, i64 282}
!287 = !DILocation(line: 317, column: 1, scope: !281)
!288 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 279, type: !289, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !292)
!289 = !DISubroutineType(types: !290)
!290 = !{!291, !50}
!291 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 21, baseType: !18)
!292 = !{!293, !294}
!293 = !DILocalVariable(name: "fp", arg: 1, scope: !288, file: !3, line: 279, type: !50)
!294 = !DILocalVariable(name: "hash", scope: !288, file: !3, line: 281, type: !268)
!295 = !DILocation(line: 0, scope: !288)
!296 = !DILocation(line: 0, scope: !265, inlinedAt: !297)
!297 = distinct !DILocation(line: 281, column: 19, scope: !288)
!298 = !DILocation(line: 273, column: 39, scope: !276, inlinedAt: !297)
!299 = !DILocation(line: 273, column: 29, scope: !276, inlinedAt: !297)
!300 = !DILocation(line: 273, column: 37, scope: !276, inlinedAt: !297)
!301 = !DILocation(line: 282, column: 17, scope: !288)
!302 = !DILocation(line: 282, column: 5, scope: !288)
!303 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 319, type: !27, scopeLine: 320, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !304)
!304 = !{!305}
!305 = !DILocalVariable(name: "fp_hash", scope: !303, file: !3, line: 321, type: !291)
!306 = !DILocation(line: 321, column: 5, scope: !303)
!307 = !DILocation(line: 321, column: 13, scope: !303)
!308 = !DILocation(line: 321, column: 37, scope: !303)
!309 = !DILocation(line: 321, column: 23, scope: !303)
!310 = !DILocation(line: 322, column: 18, scope: !303)
!311 = !DILocation(line: 322, column: 31, scope: !303)
!312 = !DILocation(line: 322, column: 29, scope: !303)
!313 = !DILocation(line: 322, column: 5, scope: !303)
!314 = !DILocation(line: 322, column: 16, scope: !303)
!315 = !{!108, !107, i64 284}
!316 = !DILocation(line: 323, column: 1, scope: !303)
!317 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 325, type: !27, scopeLine: 326, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !318)
!318 = !{!319, !324}
!319 = !DILocalVariable(name: "fp_victim", scope: !320, file: !3, line: 335, type: !50)
!320 = distinct !DILexicalBlock(scope: !321, file: !3, line: 334, column: 16)
!321 = distinct !DILexicalBlock(scope: !322, file: !3, line: 331, column: 13)
!322 = distinct !DILexicalBlock(scope: !323, file: !3, line: 330, column: 12)
!323 = distinct !DILexicalBlock(scope: !317, file: !3, line: 327, column: 9)
!324 = !DILocalVariable(name: "index_victim", scope: !320, file: !3, line: 336, type: !291)
!325 = !DILocation(line: 327, column: 10, scope: !323)
!326 = !DILocation(line: 327, column: 21, scope: !323)
!327 = !DILocation(line: 327, column: 9, scope: !317)
!328 = !DILocation(line: 328, column: 9, scope: !329)
!329 = distinct !DILexicalBlock(scope: !323, file: !3, line: 327, column: 34)
!330 = !DILocation(line: 328, column: 21, scope: !329)
!331 = !{!108, !110, i64 296}
!332 = !DILocation(line: 329, column: 34, scope: !329)
!333 = !DILocation(line: 329, column: 9, scope: !329)
!334 = !DILocation(line: 329, column: 20, scope: !329)
!335 = !DILocation(line: 329, column: 32, scope: !329)
!336 = !DILocation(line: 330, column: 5, scope: !329)
!337 = !DILocation(line: 331, column: 14, scope: !321)
!338 = !DILocation(line: 331, column: 25, scope: !321)
!339 = !DILocation(line: 331, column: 13, scope: !322)
!340 = !DILocation(line: 332, column: 13, scope: !341)
!341 = distinct !DILexicalBlock(scope: !321, file: !3, line: 331, column: 38)
!342 = !DILocation(line: 332, column: 25, scope: !341)
!343 = !DILocation(line: 333, column: 38, scope: !341)
!344 = !DILocation(line: 333, column: 13, scope: !341)
!345 = !DILocation(line: 333, column: 24, scope: !341)
!346 = !DILocation(line: 333, column: 36, scope: !341)
!347 = !DILocation(line: 334, column: 9, scope: !341)
!348 = !DILocation(line: 335, column: 13, scope: !320)
!349 = !DILocation(line: 335, column: 27, scope: !320)
!350 = !DILocation(line: 336, column: 13, scope: !320)
!351 = !DILocation(line: 336, column: 21, scope: !320)
!352 = !DILocation(line: 337, column: 17, scope: !353)
!353 = distinct !DILexicalBlock(scope: !320, file: !3, line: 337, column: 17)
!354 = !DILocation(line: 337, column: 24, scope: !353)
!355 = !DILocation(line: 337, column: 17, scope: !320)
!356 = !DILocation(line: 338, column: 32, scope: !357)
!357 = distinct !DILexicalBlock(scope: !353, file: !3, line: 337, column: 29)
!358 = !DILocation(line: 338, column: 30, scope: !357)
!359 = !DILocation(line: 339, column: 29, scope: !357)
!360 = !DILocation(line: 339, column: 40, scope: !357)
!361 = !DILocation(line: 339, column: 27, scope: !357)
!362 = !DILocation(line: 340, column: 13, scope: !357)
!363 = !DILocation(line: 341, column: 32, scope: !364)
!364 = distinct !DILexicalBlock(scope: !353, file: !3, line: 340, column: 20)
!365 = !DILocation(line: 341, column: 30, scope: !364)
!366 = !DILocation(line: 342, column: 29, scope: !364)
!367 = !DILocation(line: 342, column: 40, scope: !364)
!368 = !DILocation(line: 342, column: 27, scope: !364)
!369 = !DILocation(line: 346, column: 40, scope: !320)
!370 = !DILocation(line: 346, column: 13, scope: !320)
!371 = !DILocation(line: 346, column: 24, scope: !320)
!372 = !DILocation(line: 346, column: 38, scope: !320)
!373 = !DILocation(line: 347, column: 26, scope: !320)
!374 = !DILocation(line: 347, column: 13, scope: !320)
!375 = !DILocation(line: 347, column: 24, scope: !320)
!376 = !DILocation(line: 348, column: 31, scope: !320)
!377 = !DILocation(line: 348, column: 13, scope: !320)
!378 = !DILocation(line: 348, column: 29, scope: !320)
!379 = !DILocation(line: 349, column: 13, scope: !320)
!380 = !DILocation(line: 349, column: 34, scope: !320)
!381 = !{!108, !107, i64 286}
!382 = !DILocation(line: 350, column: 9, scope: !321)
!383 = !DILocation(line: 352, column: 1, scope: !317)
!384 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 354, type: !27, scopeLine: 355, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !385)
!385 = !{!386, !387, !388}
!386 = !DILocalVariable(name: "fp_victim", scope: !384, file: !3, line: 356, type: !50)
!387 = !DILocalVariable(name: "fp_hash_victim", scope: !384, file: !3, line: 357, type: !291)
!388 = !DILocalVariable(name: "index2_victim", scope: !384, file: !3, line: 358, type: !291)
!389 = !DILocation(line: 356, column: 5, scope: !384)
!390 = !DILocation(line: 356, column: 19, scope: !384)
!391 = !DILocation(line: 356, column: 31, scope: !384)
!392 = !DILocation(line: 357, column: 5, scope: !384)
!393 = !DILocation(line: 357, column: 13, scope: !384)
!394 = !DILocation(line: 357, column: 44, scope: !384)
!395 = !DILocation(line: 357, column: 30, scope: !384)
!396 = !DILocation(line: 358, column: 5, scope: !384)
!397 = !DILocation(line: 358, column: 13, scope: !384)
!398 = !DILocation(line: 358, column: 29, scope: !384)
!399 = !DILocation(line: 358, column: 42, scope: !384)
!400 = !DILocation(line: 358, column: 40, scope: !384)
!401 = !DILocation(line: 362, column: 14, scope: !402)
!402 = distinct !DILexicalBlock(scope: !384, file: !3, line: 362, column: 13)
!403 = !DILocation(line: 362, column: 25, scope: !402)
!404 = !DILocation(line: 362, column: 13, scope: !384)
!405 = !DILocation(line: 363, column: 13, scope: !406)
!406 = distinct !DILexicalBlock(scope: !402, file: !3, line: 362, column: 41)
!407 = !DILocation(line: 363, column: 25, scope: !406)
!408 = !DILocation(line: 364, column: 41, scope: !406)
!409 = !DILocation(line: 364, column: 13, scope: !406)
!410 = !DILocation(line: 364, column: 24, scope: !406)
!411 = !DILocation(line: 364, column: 39, scope: !406)
!412 = !DILocation(line: 365, column: 13, scope: !406)
!413 = !DILocation(line: 369, column: 13, scope: !414)
!414 = distinct !DILexicalBlock(scope: !384, file: !3, line: 369, column: 13)
!415 = !DILocation(line: 369, column: 34, scope: !414)
!416 = !DILocation(line: 369, column: 13, scope: !384)
!417 = !DILocation(line: 370, column: 13, scope: !418)
!418 = distinct !DILexicalBlock(scope: !414, file: !3, line: 369, column: 54)
!419 = !DILocation(line: 370, column: 25, scope: !418)
!420 = !DILocation(line: 371, column: 13, scope: !418)
!421 = !DILocation(line: 374, column: 11, scope: !384)
!422 = !DILocation(line: 374, column: 9, scope: !384)
!423 = !DILocation(line: 375, column: 22, scope: !384)
!424 = !DILocation(line: 375, column: 9, scope: !384)
!425 = !DILocation(line: 375, column: 20, scope: !384)
!426 = !DILocation(line: 376, column: 27, scope: !384)
!427 = !DILocation(line: 376, column: 38, scope: !384)
!428 = !DILocation(line: 376, column: 9, scope: !384)
!429 = !DILocation(line: 376, column: 25, scope: !384)
!430 = !DILocation(line: 377, column: 37, scope: !384)
!431 = !DILocation(line: 377, column: 9, scope: !384)
!432 = !DILocation(line: 377, column: 20, scope: !384)
!433 = !DILocation(line: 377, column: 35, scope: !384)
!434 = !DILocation(line: 378, column: 1, scope: !384)
!435 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 380, type: !27, scopeLine: 381, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!436 = !DILocation(line: 382, column: 7, scope: !435)
!437 = !DILocation(line: 382, column: 5, scope: !435)
!438 = !DILocation(line: 383, column: 27, scope: !435)
!439 = !{i8 0, i8 2}
!440 = !DILocation(line: 383, column: 5, scope: !435)
!441 = !DILocation(line: 383, column: 24, scope: !435)
!442 = !DILocation(line: 385, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !435, file: !3, line: 385, column: 9)
!444 = !DILocation(line: 385, column: 26, scope: !443)
!445 = !DILocation(line: 385, column: 9, scope: !435)
!446 = !DILocation(line: 387, column: 9, scope: !447)
!447 = distinct !DILexicalBlock(scope: !443, file: !3, line: 385, column: 42)
!448 = !DILocation(line: 387, column: 17, scope: !447)
!449 = !DILocation(line: 389, column: 5, scope: !447)
!450 = !DILocation(line: 390, column: 1, scope: !435)
!451 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 392, type: !27, scopeLine: 393, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!452 = !DILocation(line: 394, column: 9, scope: !453)
!453 = distinct !DILexicalBlock(scope: !451, file: !3, line: 394, column: 9)
!454 = !DILocation(line: 394, column: 20, scope: !453)
!455 = !DILocation(line: 394, column: 35, scope: !453)
!456 = !DILocation(line: 394, column: 32, scope: !453)
!457 = !DILocation(line: 394, column: 9, scope: !451)
!458 = !DILocation(line: 395, column: 9, scope: !459)
!459 = distinct !DILexicalBlock(scope: !453, file: !3, line: 394, column: 52)
!460 = !DILocation(line: 395, column: 20, scope: !459)
!461 = !{!108, !110, i64 297}
!462 = !DILocation(line: 396, column: 5, scope: !459)
!463 = !DILocation(line: 397, column: 13, scope: !464)
!464 = distinct !DILexicalBlock(scope: !465, file: !3, line: 397, column: 13)
!465 = distinct !DILexicalBlock(scope: !453, file: !3, line: 396, column: 12)
!466 = !DILocation(line: 397, column: 24, scope: !464)
!467 = !DILocation(line: 397, column: 39, scope: !464)
!468 = !DILocation(line: 397, column: 36, scope: !464)
!469 = !DILocation(line: 397, column: 13, scope: !465)
!470 = !DILocation(line: 398, column: 13, scope: !471)
!471 = distinct !DILexicalBlock(scope: !464, file: !3, line: 397, column: 56)
!472 = !DILocation(line: 398, column: 24, scope: !471)
!473 = !DILocation(line: 399, column: 9, scope: !471)
!474 = !DILocation(line: 401, column: 13, scope: !475)
!475 = distinct !DILexicalBlock(scope: !464, file: !3, line: 400, column: 14)
!476 = !DILocation(line: 401, column: 24, scope: !475)
!477 = !DILocation(line: 404, column: 1, scope: !451)
!478 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 406, type: !27, scopeLine: 407, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!479 = !DILocation(line: 408, column: 7, scope: !478)
!480 = !DILocation(line: 408, column: 5, scope: !478)
!481 = !DILocation(line: 410, column: 25, scope: !478)
!482 = !DILocation(line: 410, column: 5, scope: !478)
!483 = !DILocation(line: 410, column: 22, scope: !478)
!484 = !DILocation(line: 412, column: 1, scope: !478)
!485 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 414, type: !27, scopeLine: 415, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!486 = !DILocation(line: 416, column: 5, scope: !485)
!487 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 419, type: !27, scopeLine: 419, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!488 = !DILocation(line: 422, column: 1, scope: !487)
!489 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 426, type: !490, scopeLine: 426, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!490 = !DISubroutineType(types: !491)
!491 = !{!23}
!492 = !DILocation(line: 428, column: 16, scope: !489)
!493 = !DILocation(line: 429, column: 10, scope: !489)
!494 = !DILocation(line: 430, column: 12, scope: !489)
!495 = !DILocation(line: 97, column: 10, scope: !80, inlinedAt: !496)
!496 = distinct !DILocation(line: 431, column: 5, scope: !489)
!497 = !DILocation(line: 99, column: 9, scope: !80, inlinedAt: !496)
!498 = !DILocation(line: 101, column: 9, scope: !80, inlinedAt: !496)
!499 = !DILocation(line: 106, column: 11, scope: !80, inlinedAt: !496)
!500 = !DILocation(line: 111, column: 12, scope: !80, inlinedAt: !496)
!501 = !DILocation(line: 112, column: 10, scope: !80, inlinedAt: !496)
!502 = !DILocation(line: 113, column: 10, scope: !80, inlinedAt: !496)
!503 = !DILocation(line: 115, column: 10, scope: !80, inlinedAt: !496)
!504 = !DILocation(line: 116, column: 12, scope: !80, inlinedAt: !496)
!505 = !DILocation(line: 119, column: 10, scope: !80, inlinedAt: !496)
!506 = !DILocation(line: 433, column: 5, scope: !489)
!507 = !DILocation(line: 435, column: 11, scope: !489)
!508 = !DILocation(line: 435, column: 29, scope: !489)
!509 = !DILocation(line: 435, column: 5, scope: !489)
!510 = !DILocation(line: 437, column: 9, scope: !511)
!511 = distinct !DILexicalBlock(scope: !489, file: !3, line: 435, column: 44)
!512 = !DILocation(line: 439, column: 9, scope: !511)
!513 = !DILocation(line: 441, column: 9, scope: !511)
!514 = !DILocation(line: 443, column: 9, scope: !511)
!515 = !DILocation(line: 445, column: 12, scope: !516)
!516 = distinct !DILexicalBlock(scope: !511, file: !3, line: 445, column: 12)
!517 = !DILocation(line: 445, column: 29, scope: !516)
!518 = !DILocation(line: 445, column: 12, scope: !511)
!519 = !DILocation(line: 447, column: 13, scope: !520)
!520 = distinct !DILexicalBlock(scope: !516, file: !3, line: 445, column: 44)
!521 = !DILocation(line: 449, column: 28, scope: !522)
!522 = distinct !DILexicalBlock(scope: !520, file: !3, line: 449, column: 16)
!523 = !DILocation(line: 449, column: 16, scope: !522)
!524 = !DILocation(line: 449, column: 41, scope: !522)
!525 = !DILocation(line: 449, column: 56, scope: !522)
!526 = !DILocation(line: 449, column: 44, scope: !522)
!527 = !DILocation(line: 449, column: 16, scope: !520)
!528 = !DILocation(line: 450, column: 23, scope: !529)
!529 = distinct !DILexicalBlock(scope: !522, file: !3, line: 449, column: 70)
!530 = !DILocation(line: 450, column: 36, scope: !529)
!531 = !DILocation(line: 450, column: 45, scope: !529)
!532 = !DILocation(line: 450, column: 49, scope: !529)
!533 = !DILocation(line: 450, column: 71, scope: !529)
!534 = !DILocation(line: 450, column: 17, scope: !529)
!535 = !DILocation(line: 452, column: 21, scope: !536)
!536 = distinct !DILexicalBlock(scope: !529, file: !3, line: 450, column: 91)
!537 = distinct !{!537, !534, !538}
!538 = !DILocation(line: 454, column: 17, scope: !529)
!539 = !DILocation(line: 457, column: 9, scope: !520)
!540 = !DILocation(line: 459, column: 9, scope: !520)
!541 = !DILocation(line: 461, column: 13, scope: !542)
!542 = distinct !DILexicalBlock(scope: !516, file: !3, line: 459, column: 16)
!543 = !DILocation(line: 463, column: 13, scope: !542)
!544 = distinct !{!544, !509, !545}
!545 = !DILocation(line: 465, column: 5, scope: !489)
!546 = !DILocation(line: 467, column: 5, scope: !489)
