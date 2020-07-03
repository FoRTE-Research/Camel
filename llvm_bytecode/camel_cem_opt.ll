; ModuleID = 'camel_cem_opt.bc'
source_filename = "../benchmarks/camel_cem.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, [128 x %struct._node_t], i16, i16, i16, i16, i16, i16, %struct._node_t, [16 x %struct._node_t], %struct._node_t, i16, i16 }
%struct._node_t = type { i16, i16, i16 }

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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !23
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !70
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !14
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !9
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !72
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !84 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !85, !tbaa !86
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !90, !tbaa !91
  %1 = or i8 %0, 1, !dbg !90
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !90, !tbaa !91
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !92, !tbaa !91
  %3 = and i8 %2, -2, !dbg !92
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !92, !tbaa !91
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !93, !tbaa !86
  %and4 = and i16 %4, -2, !dbg !93
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !93, !tbaa !86
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !94, !tbaa !91
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !95, !tbaa !86
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !96, !tbaa !86
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !97, !tbaa !86
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !98, !tbaa !91
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !99, !tbaa !86
  ret void, !dbg !100
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !101 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !107, !tbaa !109
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !115

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !116, !tbaa !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !120, !tbaa !118
  br label %if.end4, !dbg !121

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !122, !tbaa !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !125, !tbaa !118
  br label %if.end4, !dbg !126

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !127
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !129, !tbaa !118
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !129
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !129
  %2 = load i16, i16* %arrayidx, align 2, !dbg !129, !tbaa !131
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #11, !dbg !129, !srcloc !132
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !133, !srcloc !134
  call void @llvm.dbg.value(metadata i16 %3, metadata !103, metadata !DIExpression()), !dbg !135
  %add = add i16 %3, 2, !dbg !136
  %4 = inttoptr i16 %add to i8*, !dbg !137
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !138, !srcloc !139
  call void @llvm.dbg.value(metadata i16 %5, metadata !105, metadata !DIExpression()), !dbg !140
  %sub = sub i16 9214, %5, !dbg !141
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !142
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !143, !tbaa !131
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !144, !tbaa !118
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 924, i16 zeroext %call) #11, !dbg !145
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !146, !tbaa !131
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !147, !tbaa !118
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !149
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !149, !tbaa !150
  %cmp9 = icmp eq i16 %call8, %8, !dbg !151
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !152

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !153, !tbaa !118
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !155
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(926) %9, i8* nonnull align 2 dereferenceable(926) %10, i16 926, i1 false), !dbg !155
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !156, !tbaa !86
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !158, !tbaa !91
  %12 = or i8 %11, 1, !dbg !158
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !158, !tbaa !91
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !159, !tbaa !91
  %14 = and i8 %13, -2, !dbg !159
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !159, !tbaa !91
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !160, !tbaa !86
  %and4.i = and i16 %15, -2, !dbg !160
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !160, !tbaa !86
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !161, !tbaa !91
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !162, !tbaa !86
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !163, !tbaa !86
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !164, !tbaa !86
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !165, !tbaa !91
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !166, !tbaa !86
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !167, !tbaa !118
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !167
  tail call void @__restore_registers(i16* %arraydecay) #11, !dbg !168
  br label %if.end13, !dbg !169

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !170
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !172
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
define dso_local void @commit() local_unnamed_addr #5 !dbg !173 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !187, !tbaa !109
  %cmp = icmp eq i16 %0, 1, !dbg !188
  br i1 %cmp, label %if.then, label %if.else, !dbg !189

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !190, !tbaa !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !191, !tbaa !118
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #11, !dbg !192
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !193, !srcloc !194
  call void @llvm.dbg.value(metadata i16 %1, metadata !175, metadata !DIExpression()), !dbg !195
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !196, !srcloc !197
  call void @llvm.dbg.value(metadata i16 %2, metadata !180, metadata !DIExpression()), !dbg !198
  br label %do.end, !dbg !199

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !200, !tbaa !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !201, !tbaa !118
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #11, !dbg !202
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !203, !srcloc !204
  call void @llvm.dbg.value(metadata i16 %3, metadata !182, metadata !DIExpression()), !dbg !205
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !206, !srcloc !207
  call void @llvm.dbg.value(metadata i16 %4, metadata !185, metadata !DIExpression()), !dbg !208
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink7 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !209
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !209
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !209
  %sub = sub i16 9214, %.sink7, !dbg !209
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !209
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !209, !tbaa !131
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !209, !tbaa !118
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 924, i16 zeroext %call) #11, !dbg !209
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !209, !tbaa !131
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !209, !tbaa !118
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !209
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !209, !tbaa !150
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !209, !tbaa !109
  ret void, !dbg !210
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() local_unnamed_addr #6 !dbg !211 {
entry:
  %node = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !217, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !217
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !217
  store i16 0, i16* %parent_next, align 2, !dbg !218, !tbaa !219
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !220, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !220
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !220
  store i16 0, i16* %out_len, align 2, !dbg !221, !tbaa !222
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !223, !tbaa !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !223
  %letter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !223
  store i16 0, i16* %letter, align 2, !dbg !224, !tbaa !225
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !226, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !226
  %prev_sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !226
  store i16 0, i16* %prev_sample, align 2, !dbg !227, !tbaa !228
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !229, !tbaa !118
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !229
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !229
  store i16 0, i16* %letter_idx, align 2, !dbg !230, !tbaa !231
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232, !tbaa !118
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !232
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !232
  store i16 1, i16* %sample_count, align 2, !dbg !233, !tbaa !234
  br label %while.cond, !dbg !235

while.cond:                                       ; preds = %while.body, %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236, !tbaa !118
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !236
  %letter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 0, !dbg !236
  %7 = load i16, i16* %letter7, align 2, !dbg !236, !tbaa !225
  %cmp = icmp ult i16 %7, 64, !dbg !237
  br i1 %cmp, label %while.body, label %while.end, !dbg !235

while.body:                                       ; preds = %while.cond
  %8 = bitcast %struct._node_t* %node to i8*, !dbg !238
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %8) #11, !dbg !238
  call void @llvm.dbg.declare(metadata %struct._node_t* %node, metadata !213, metadata !DIExpression()), !dbg !239
  %letter8 = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 0, !dbg !240
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241, !tbaa !118
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !241
  %letter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !241
  %10 = load i16, i16* %letter10, align 2, !dbg !241, !tbaa !225
  store i16 %10, i16* %letter8, align 2, !dbg !240, !tbaa !242
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 1, !dbg !240
  store i16 0, i16* %sibling, align 2, !dbg !240, !tbaa !243
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 2, !dbg !240
  store i16 0, i16* %child, align 2, !dbg !240, !tbaa !244
  %11 = bitcast i16* %i to i8*, !dbg !245
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %11) #11, !dbg !245
  call void @llvm.dbg.declare(metadata i16* %i, metadata !215, metadata !DIExpression()), !dbg !246
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247, !tbaa !118
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !247
  %letter12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !247
  %13 = load i16, i16* %letter12, align 2, !dbg !247, !tbaa !225
  store i16 %13, i16* %i, align 2, !dbg !246, !tbaa !86
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !248, !tbaa !118
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !248
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !248
  %15 = load i16, i16* %i, align 2, !dbg !249, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %15, !dbg !248
  %16 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !250
  %17 = bitcast %struct._node_t* %node to i8*, !dbg !250
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %16, i8* align 2 %17, i16 6, i1 false), !dbg !250, !tbaa.struct !251
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !252, !tbaa !118
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !252
  %letter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !252
  %19 = load i16, i16* %letter15, align 2, !dbg !253, !tbaa !225
  %inc = add i16 %19, 1, !dbg !253
  store i16 %inc, i16* %letter15, align 2, !dbg !253, !tbaa !225
  %20 = bitcast i16* %i to i8*, !dbg !254
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %20) #11, !dbg !254
  %21 = bitcast %struct._node_t* %node to i8*, !dbg !254
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %21) #11, !dbg !254
  br label %while.cond, !dbg !235, !llvm.loop !255

while.end:                                        ; preds = %while.cond
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !256, !tbaa !118
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !256
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 4, !dbg !256
  store i16 64, i16* %node_count, align 2, !dbg !257, !tbaa !258
  ret void, !dbg !259
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() local_unnamed_addr #6 !dbg !260 {
entry:
  %next_letter_idx = alloca i16, align 2
  %0 = bitcast i16* %next_letter_idx to i8*, !dbg !263
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !263
  call void @llvm.dbg.declare(metadata i16* %next_letter_idx, metadata !262, metadata !DIExpression()), !dbg !264
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !265, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !265
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !265
  %2 = load i16, i16* %letter_idx, align 2, !dbg !265, !tbaa !231
  %add = add i16 %2, 1, !dbg !266
  store i16 %add, i16* %next_letter_idx, align 2, !dbg !264, !tbaa !86
  %3 = load i16, i16* %next_letter_idx, align 2, !dbg !267, !tbaa !86
  %cmp = icmp eq i16 %3, 2, !dbg !269
  br i1 %cmp, label %if.then, label %if.end, !dbg !270

if.then:                                          ; preds = %entry
  store i16 0, i16* %next_letter_idx, align 2, !dbg !271, !tbaa !86
  br label %if.end, !dbg !272

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !273, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !273
  %letter_idx2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !273
  %5 = load i16, i16* %letter_idx2, align 2, !dbg !273, !tbaa !231
  %cmp3 = icmp eq i16 %5, 0, !dbg !275
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !276

if.then4:                                         ; preds = %if.end
  %6 = load i16, i16* %next_letter_idx, align 2, !dbg !277, !tbaa !86
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279, !tbaa !118
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !279
  %letter_idx6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !279
  store i16 %6, i16* %letter_idx6, align 2, !dbg !280, !tbaa !231
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281, !tbaa !118
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !281
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 16, !dbg !281
  store i16 0, i16* %check, align 2, !dbg !282, !tbaa !283
  br label %if.end12, !dbg !284

if.else:                                          ; preds = %if.end
  %9 = load i16, i16* %next_letter_idx, align 2, !dbg !285, !tbaa !86
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287, !tbaa !118
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !287
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !287
  store i16 %9, i16* %letter_idx9, align 2, !dbg !288, !tbaa !231
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289, !tbaa !118
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !289
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !289
  store i16 1, i16* %check11, align 2, !dbg !290, !tbaa !283
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then4
  %12 = bitcast i16* %next_letter_idx to i8*, !dbg !291
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %12) #11, !dbg !291
  ret void, !dbg !291
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_measure_temp() local_unnamed_addr #6 !dbg !292 {
entry:
  %prev_sample = alloca i16, align 2
  %sample = alloca i16, align 2
  %0 = bitcast i16* %prev_sample to i8*, !dbg !296
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !296
  call void @llvm.dbg.declare(metadata i16* %prev_sample, metadata !294, metadata !DIExpression()), !dbg !297
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !298
  %prev_sample1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !298
  %2 = load i16, i16* %prev_sample1, align 2, !dbg !298, !tbaa !228
  store i16 %2, i16* %prev_sample, align 2, !dbg !299, !tbaa !86
  %3 = bitcast i16* %sample to i8*, !dbg !300
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !300
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !295, metadata !DIExpression()), !dbg !301
  %4 = load i16, i16* %prev_sample, align 2, !dbg !302, !tbaa !86
  %call = call fastcc i16 @acquire_sample(i16 %4), !dbg !303
  store i16 %call, i16* %sample, align 2, !dbg !301, !tbaa !86
  %5 = load i16, i16* %sample, align 2, !dbg !304, !tbaa !86
  store i16 %5, i16* %prev_sample, align 2, !dbg !305, !tbaa !86
  %6 = load i16, i16* %prev_sample, align 2, !dbg !306, !tbaa !86
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307, !tbaa !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !307
  %prev_sample3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !307
  store i16 %6, i16* %prev_sample3, align 2, !dbg !308, !tbaa !228
  %8 = load i16, i16* %sample, align 2, !dbg !309, !tbaa !86
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310, !tbaa !118
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !310
  %sample5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !310
  store i16 %8, i16* %sample5, align 2, !dbg !311, !tbaa !312
  %10 = bitcast i16* %sample to i8*, !dbg !313
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #11, !dbg !313
  %11 = bitcast i16* %prev_sample to i8*, !dbg !313
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #11, !dbg !313
  ret void, !dbg !313
}

; Function Attrs: norecurse nounwind readnone
define internal fastcc i16 @acquire_sample(i16 %prev_sample) unnamed_addr #7 !dbg !314 {
entry:
  call void @llvm.dbg.value(metadata i16 %prev_sample, metadata !318, metadata !DIExpression()), !dbg !320
  %add = add i16 %prev_sample, 1, !dbg !321
  %and = and i16 %add, 3, !dbg !322
  call void @llvm.dbg.value(metadata i16 %and, metadata !319, metadata !DIExpression()), !dbg !320
  ret i16 %and, !dbg !323
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_letterize() local_unnamed_addr #6 !dbg !324 {
entry:
  %letter_idx = alloca i16, align 2
  %letter_shift = alloca i16, align 2
  %letter = alloca i16, align 2
  %0 = bitcast i16* %letter_idx to i8*, !dbg !329
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !329
  call void @llvm.dbg.declare(metadata i16* %letter_idx, metadata !326, metadata !DIExpression()), !dbg !330
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !331
  %letter_idx1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !331
  %2 = load i16, i16* %letter_idx1, align 2, !dbg !331, !tbaa !231
  store i16 %2, i16* %letter_idx, align 2, !dbg !330, !tbaa !86
  %3 = load i16, i16* %letter_idx, align 2, !dbg !332, !tbaa !86
  %cmp = icmp eq i16 %3, 0, !dbg !334
  br i1 %cmp, label %if.then, label %if.else, !dbg !335

if.then:                                          ; preds = %entry
  store i16 2, i16* %letter_idx, align 2, !dbg !336, !tbaa !86
  br label %if.end, !dbg !337

if.else:                                          ; preds = %entry
  %4 = load i16, i16* %letter_idx, align 2, !dbg !338, !tbaa !86
  %dec = add i16 %4, -1, !dbg !338
  store i16 %dec, i16* %letter_idx, align 2, !dbg !338, !tbaa !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = bitcast i16* %letter_shift to i8*, !dbg !339
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !339
  call void @llvm.dbg.declare(metadata i16* %letter_shift, metadata !327, metadata !DIExpression()), !dbg !340
  %6 = load i16, i16* %letter_idx, align 2, !dbg !341, !tbaa !86
  %mul = mul i16 8, %6, !dbg !342
  store i16 %mul, i16* %letter_shift, align 2, !dbg !340, !tbaa !86
  %7 = bitcast i16* %letter to i8*, !dbg !343
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #11, !dbg !343
  call void @llvm.dbg.declare(metadata i16* %letter, metadata !328, metadata !DIExpression()), !dbg !344
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345, !tbaa !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !345
  %sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 6, !dbg !345
  %9 = load i16, i16* %sample, align 2, !dbg !345, !tbaa !312
  %10 = load i16, i16* %letter_shift, align 2, !dbg !346, !tbaa !86
  %shl = shl i16 63, %10, !dbg !347
  %and = and i16 %9, %shl, !dbg !348
  %11 = load i16, i16* %letter_shift, align 2, !dbg !349, !tbaa !86
  %shr = lshr i16 %and, %11, !dbg !350
  store i16 %shr, i16* %letter, align 2, !dbg !344, !tbaa !86
  %12 = load i16, i16* %letter, align 2, !dbg !351, !tbaa !86
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !352, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !352
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !352
  store i16 %12, i16* %letter4, align 2, !dbg !353, !tbaa !225
  %14 = bitcast i16* %letter to i8*, !dbg !354
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #11, !dbg !354
  %15 = bitcast i16* %letter_shift to i8*, !dbg !354
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %15) #11, !dbg !354
  %16 = bitcast i16* %letter_idx to i8*, !dbg !354
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %16) #11, !dbg !354
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_compress() local_unnamed_addr #6 !dbg !355 {
entry:
  %parent_node = alloca %struct._node_t, align 2
  %parent = alloca i16, align 2
  %0 = bitcast %struct._node_t* %parent_node to i8*, !dbg !359
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %0) #11, !dbg !359
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node, metadata !357, metadata !DIExpression()), !dbg !360
  %1 = bitcast i16* %parent to i8*, !dbg !361
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !361
  call void @llvm.dbg.declare(metadata i16* %parent, metadata !358, metadata !DIExpression()), !dbg !362
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !363
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !363
  %3 = load i16, i16* %parent_next, align 2, !dbg !363, !tbaa !219
  store i16 %3, i16* %parent, align 2, !dbg !362, !tbaa !86
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !364
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !364
  %5 = load i16, i16* %parent, align 2, !dbg !365, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !364
  %6 = bitcast %struct._node_t* %parent_node to i8*, !dbg !364
  %7 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !364
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 6, i1 false), !dbg !364, !tbaa.struct !251
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !366
  %8 = load i16, i16* %child, align 2, !dbg !366, !tbaa !244
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367, !tbaa !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !367
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !367
  store i16 %8, i16* %sibling, align 2, !dbg !368, !tbaa !369
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !370
  %parent_node4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !370
  %11 = bitcast %struct._node_t* %parent_node4 to i8*, !dbg !371
  %12 = bitcast %struct._node_t* %parent_node to i8*, !dbg !371
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %12, i16 6, i1 false), !dbg !371, !tbaa.struct !251
  %13 = load i16, i16* %parent, align 2, !dbg !372, !tbaa !86
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !373, !tbaa !118
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !373
  %parent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !373
  store i16 %13, i16* %parent6, align 2, !dbg !374, !tbaa !375
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !376
  %15 = load i16, i16* %child7, align 2, !dbg !376, !tbaa !244
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !377, !tbaa !118
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !377
  %child9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !377
  store i16 %15, i16* %child9, align 2, !dbg !378, !tbaa !379
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380, !tbaa !118
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !380
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 7, !dbg !380
  %18 = load i16, i16* %sample_count, align 2, !dbg !381, !tbaa !234
  %inc = add i16 %18, 1, !dbg !381
  store i16 %inc, i16* %sample_count, align 2, !dbg !381, !tbaa !234
  %19 = bitcast i16* %parent to i8*, !dbg !382
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %19) #11, !dbg !382
  %20 = bitcast %struct._node_t* %parent_node to i8*, !dbg !382
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %20) #11, !dbg !382
  ret void, !dbg !382
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_find_sibling() local_unnamed_addr #6 !dbg !383 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %starting_node_idx = alloca i16, align 2
  %0 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !391
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !391
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !385, metadata !DIExpression()), !dbg !392
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !393
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !393
  %2 = load i16, i16* %sibling, align 2, !dbg !393, !tbaa !369
  %cmp = icmp ne i16 %2, 0, !dbg !394
  br i1 %cmp, label %if.then, label %if.end21, !dbg !395

if.then:                                          ; preds = %entry
  %3 = bitcast i16* %i to i8*, !dbg !396
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !396
  call void @llvm.dbg.declare(metadata i16* %i, metadata !387, metadata !DIExpression()), !dbg !397
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !398, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !398
  %sibling2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !398
  %5 = load i16, i16* %sibling2, align 2, !dbg !398, !tbaa !369
  store i16 %5, i16* %i, align 2, !dbg !397, !tbaa !86
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !399
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 5, !dbg !399
  %7 = load i16, i16* %i, align 2, !dbg !400, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %7, !dbg !399
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !401, !tbaa !118
  %8 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !402, !tbaa !118
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %8, i32 0, i32 0, !dbg !404
  %9 = load i16, i16* %letter, align 2, !dbg !404, !tbaa !242
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405, !tbaa !118
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !405
  %letter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !405
  %11 = load i16, i16* %letter5, align 2, !dbg !405, !tbaa !225
  %cmp6 = icmp eq i16 %9, %11, !dbg !406
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !407

if.then7:                                         ; preds = %if.then
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408, !tbaa !118
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !408
  %sibling9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !408
  %13 = load i16, i16* %sibling9, align 2, !dbg !408, !tbaa !369
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !410, !tbaa !118
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !410
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 11, !dbg !410
  store i16 %13, i16* %parent_next, align 2, !dbg !411, !tbaa !219
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412, !tbaa !118
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !412
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 16, !dbg !412
  store i16 0, i16* %check, align 2, !dbg !413, !tbaa !283
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !414

if.else:                                          ; preds = %if.then
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !415, !tbaa !118
  %sibling12 = getelementptr inbounds %struct._node_t, %struct._node_t* %16, i32 0, i32 1, !dbg !418
  %17 = load i16, i16* %sibling12, align 2, !dbg !418, !tbaa !243
  %cmp13 = icmp ne i16 %17, 0, !dbg !419
  br i1 %cmp13, label %if.then14, label %if.end, !dbg !420

if.then14:                                        ; preds = %if.else
  %18 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !421, !tbaa !118
  %sibling15 = getelementptr inbounds %struct._node_t, %struct._node_t* %18, i32 0, i32 1, !dbg !423
  %19 = load i16, i16* %sibling15, align 2, !dbg !423, !tbaa !243
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424, !tbaa !118
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !424
  %sibling17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !424
  store i16 %19, i16* %sibling17, align 2, !dbg !425, !tbaa !369
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426, !tbaa !118
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !426
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !426
  store i16 1, i16* %check19, align 2, !dbg !427, !tbaa !283
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !428

if.end:                                           ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !429
  br label %cleanup, !dbg !429

cleanup:                                          ; preds = %if.end20, %if.then14, %if.then7
  %22 = bitcast i16* %i to i8*, !dbg !429
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #11, !dbg !429
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  %cond = icmp eq i32 %cleanup.dest, 0
  br i1 %cond, label %cleanup.cont, label %cleanup35

cleanup.cont:                                     ; preds = %cleanup
  br label %if.end21, !dbg !430

if.end21:                                         ; preds = %cleanup.cont, %entry
  %23 = bitcast i16* %starting_node_idx to i8*, !dbg !431
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %23) #11, !dbg !431
  call void @llvm.dbg.declare(metadata i16* %starting_node_idx, metadata !390, metadata !DIExpression()), !dbg !432
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !433, !tbaa !118
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !433
  %letter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !433
  %25 = load i16, i16* %letter23, align 2, !dbg !433, !tbaa !225
  store i16 %25, i16* %starting_node_idx, align 2, !dbg !432, !tbaa !86
  %26 = load i16, i16* %starting_node_idx, align 2, !dbg !434, !tbaa !86
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !435, !tbaa !118
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !435
  %parent_next25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 11, !dbg !435
  store i16 %26, i16* %parent_next25, align 2, !dbg !436, !tbaa !219
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !437, !tbaa !118
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !437
  %child = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !437
  %29 = load i16, i16* %child, align 2, !dbg !437, !tbaa !379
  %cmp27 = icmp eq i16 %29, 0, !dbg !439
  br i1 %cmp27, label %if.then28, label %if.else31, !dbg !440

if.then28:                                        ; preds = %if.end21
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441, !tbaa !118
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !441
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 16, !dbg !441
  store i16 2, i16* %check30, align 2, !dbg !443, !tbaa !283
  br label %if.end34, !dbg !444

if.else31:                                        ; preds = %if.end21
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !445, !tbaa !118
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !445
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 16, !dbg !445
  store i16 3, i16* %check33, align 2, !dbg !447, !tbaa !283
  br label %if.end34

if.end34:                                         ; preds = %if.else31, %if.then28
  %32 = bitcast i16* %starting_node_idx to i8*, !dbg !448
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #11, !dbg !448
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !448
  br label %cleanup35, !dbg !448

cleanup35:                                        ; preds = %cleanup, %if.end34
  %33 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !448
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #11, !dbg !448
  br label %cleanup.cont37

cleanup.cont37:                                   ; preds = %cleanup35
  ret void, !dbg !448
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_node() local_unnamed_addr #6 !dbg !449 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %next_sibling = alloca i16, align 2
  %sibling_node_obj = alloca %struct._node_t, align 2
  %0 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !458
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !458
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !451, metadata !DIExpression()), !dbg !459
  %1 = bitcast i16* %i to i8*, !dbg !460
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !460
  call void @llvm.dbg.declare(metadata i16* %i, metadata !452, metadata !DIExpression()), !dbg !461
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !462, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !462
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !462
  %3 = load i16, i16* %sibling, align 2, !dbg !462, !tbaa !369
  store i16 %3, i16* %i, align 2, !dbg !461, !tbaa !86
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !463, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !463
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !463
  %5 = load i16, i16* %i, align 2, !dbg !464, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !463
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !465, !tbaa !118
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !466, !tbaa !118
  %sibling2 = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 1, !dbg !467
  %7 = load i16, i16* %sibling2, align 2, !dbg !467, !tbaa !243
  %cmp = icmp ne i16 %7, 0, !dbg !468
  br i1 %cmp, label %if.then, label %if.else, !dbg !469

if.then:                                          ; preds = %entry
  %8 = bitcast i16* %next_sibling to i8*, !dbg !470
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #11, !dbg !470
  call void @llvm.dbg.declare(metadata i16* %next_sibling, metadata !453, metadata !DIExpression()), !dbg !471
  %9 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !472, !tbaa !118
  %sibling3 = getelementptr inbounds %struct._node_t, %struct._node_t* %9, i32 0, i32 1, !dbg !473
  %10 = load i16, i16* %sibling3, align 2, !dbg !473, !tbaa !243
  store i16 %10, i16* %next_sibling, align 2, !dbg !471, !tbaa !86
  %11 = load i16, i16* %next_sibling, align 2, !dbg !474, !tbaa !86
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !475, !tbaa !118
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !475
  %sibling5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !475
  store i16 %11, i16* %sibling5, align 2, !dbg !476, !tbaa !369
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477, !tbaa !118
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !477
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 16, !dbg !477
  store i16 0, i16* %check, align 2, !dbg !478, !tbaa !283
  %14 = bitcast i16* %next_sibling to i8*, !dbg !479
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #11, !dbg !479
  br label %if.end, !dbg !480

if.else:                                          ; preds = %entry
  %15 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !481
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %15) #11, !dbg !481
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !456, metadata !DIExpression()), !dbg !482
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !483, !tbaa !118
  %17 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !484
  %18 = bitcast %struct._node_t* %16 to i8*, !dbg !484
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %17, i8* align 2 %18, i16 6, i1 false), !dbg !484, !tbaa.struct !251
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !485, !tbaa !118
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !485
  %sibling_node8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !485
  %20 = bitcast %struct._node_t* %sibling_node8 to i8*, !dbg !486
  %21 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !486
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %20, i8* align 2 %21, i16 6, i1 false), !dbg !486, !tbaa.struct !251
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !487, !tbaa !118
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !487
  %check10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !487
  store i16 1, i16* %check10, align 2, !dbg !488, !tbaa !283
  %23 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !489
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %23) #11, !dbg !489
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %24 = bitcast i16* %i to i8*, !dbg !490
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %24) #11, !dbg !490
  %25 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !490
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %25) #11, !dbg !490
  ret void, !dbg !490
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() local_unnamed_addr #6 !dbg !491 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %cond = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !501, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !501
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !501
  %1 = load i16, i16* %node_count, align 2, !dbg !501, !tbaa !258
  %cmp = icmp eq i16 %1, 128, !dbg !503
  br i1 %cmp, label %if.then, label %if.end, !dbg !504

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !505
  unreachable

if.end:                                           ; preds = %entry
  %2 = bitcast i16* %child to i8*, !dbg !507
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !507
  call void @llvm.dbg.declare(metadata i16* %child, metadata !493, metadata !DIExpression()), !dbg !508
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !509, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !509
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !509
  %4 = load i16, i16* %node_count2, align 2, !dbg !509, !tbaa !258
  store i16 %4, i16* %child, align 2, !dbg !508, !tbaa !86
  %5 = bitcast %struct._node_t* %child_node to i8*, !dbg !510
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %5) #11, !dbg !510
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !494, metadata !DIExpression()), !dbg !511
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !512
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !513, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !513
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !513
  %7 = load i16, i16* %letter4, align 2, !dbg !513, !tbaa !225
  store i16 %7, i16* %letter, align 2, !dbg !512, !tbaa !242
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !512
  store i16 0, i16* %sibling, align 2, !dbg !512, !tbaa !243
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !512
  store i16 0, i16* %child5, align 2, !dbg !512, !tbaa !244
  %8 = bitcast %struct._node_t* %cond to i8*, !dbg !514
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %8) #11, !dbg !514
  call void @llvm.dbg.declare(metadata %struct._node_t* %cond, metadata !495, metadata !DIExpression()), !dbg !515
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !516, !tbaa !118
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !516
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !516
  %10 = bitcast %struct._node_t* %cond to i8*, !dbg !516
  %11 = bitcast %struct._node_t* %parent_node to i8*, !dbg !516
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %10, i8* align 2 %11, i16 6, i1 false), !dbg !516, !tbaa.struct !251
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %cond, i32 0, i32 2, !dbg !517
  %12 = load i16, i16* %child7, align 2, !dbg !517, !tbaa !244
  %cmp8 = icmp eq i16 %12, 0, !dbg !518
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !519

if.then9:                                         ; preds = %if.end
  %13 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !520
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %13) #11, !dbg !520
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !496, metadata !DIExpression()), !dbg !521
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !522, !tbaa !118
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !522
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !522
  %15 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !522
  %16 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !522
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !522, !tbaa.struct !251
  %17 = load i16, i16* %child, align 2, !dbg !523, !tbaa !86
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !524
  store i16 %17, i16* %child12, align 2, !dbg !525, !tbaa !244
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !526, !tbaa !118
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !526
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !526
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !527, !tbaa !118
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !527
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 10, !dbg !527
  %20 = load i16, i16* %parent, align 2, !dbg !527, !tbaa !375
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %20, !dbg !526
  %21 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !528
  %22 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !528
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %21, i8* align 2 %22, i16 6, i1 false), !dbg !528, !tbaa.struct !251
  %23 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !529
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %23) #11, !dbg !529
  br label %if.end22, !dbg !530

if.else:                                          ; preds = %if.end
  %24 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !531
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %24) #11, !dbg !531
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !499, metadata !DIExpression()), !dbg !532
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !533, !tbaa !118
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !533
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 14, !dbg !533
  %26 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !533
  %27 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !533
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %26, i8* align 2 %27, i16 6, i1 false), !dbg !533, !tbaa.struct !251
  %28 = load i16, i16* %child, align 2, !dbg !534, !tbaa !86
  %sibling16 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !535
  store i16 %28, i16* %sibling16, align 2, !dbg !536, !tbaa !243
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !537, !tbaa !118
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !537
  %dict18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 5, !dbg !537
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !538, !tbaa !118
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !538
  %sibling20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !538
  %31 = load i16, i16* %sibling20, align 2, !dbg !538, !tbaa !369
  %arrayidx21 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict18, i16 0, i16 %31, !dbg !537
  %32 = bitcast %struct._node_t* %arrayidx21 to i8*, !dbg !539
  %33 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !539
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %32, i8* align 2 %33, i16 6, i1 false), !dbg !539, !tbaa.struct !251
  %34 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !540
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %34) #11, !dbg !540
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then9
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !541, !tbaa !118
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !541
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !541
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !542, !tbaa !118
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !542
  %child26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !542
  %37 = load i16, i16* %child26, align 2, !dbg !542, !tbaa !379
  %arrayidx27 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict24, i16 0, i16 %37, !dbg !541
  %38 = bitcast %struct._node_t* %arrayidx27 to i8*, !dbg !543
  %39 = bitcast %struct._node_t* %child_node to i8*, !dbg !543
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %38, i8* align 2 %39, i16 6, i1 false), !dbg !543, !tbaa.struct !251
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !544, !tbaa !118
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !544
  %parent29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !544
  %41 = load i16, i16* %parent29, align 2, !dbg !544, !tbaa !375
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !545, !tbaa !118
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !545
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 15, !dbg !545
  store i16 %41, i16* %symbol, align 2, !dbg !546, !tbaa !547
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548, !tbaa !118
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !548
  %node_count32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 4, !dbg !548
  %44 = load i16, i16* %node_count32, align 2, !dbg !549, !tbaa !258
  %inc = add i16 %44, 1, !dbg !549
  store i16 %inc, i16* %node_count32, align 2, !dbg !549, !tbaa !258
  %45 = bitcast %struct._node_t* %cond to i8*, !dbg !550
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %45) #11, !dbg !550
  %46 = bitcast %struct._node_t* %child_node to i8*, !dbg !550
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %46) #11, !dbg !550
  %47 = bitcast i16* %child to i8*, !dbg !550
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %47) #11, !dbg !550
  ret void, !dbg !550
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() local_unnamed_addr #6 !dbg !551 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !552, !tbaa !118
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !552
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 15, !dbg !552
  %1 = load i16, i16* %symbol, align 2, !dbg !552, !tbaa !547
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !553, !tbaa !118
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !553
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !553
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !554, !tbaa !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !554
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !554
  %4 = load i16, i16* %out_len, align 2, !dbg !554, !tbaa !222
  %arrayidx = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %compressed_data, i16 0, i16 %4, !dbg !553
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 0, !dbg !555
  store i16 %1, i16* %letter, align 2, !dbg !556, !tbaa !242
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !557, !tbaa !118
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !557
  %out_len4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !557
  %6 = load i16, i16* %out_len4, align 2, !dbg !558, !tbaa !222
  %inc = add i16 %6, 1, !dbg !558
  store i16 %inc, i16* %out_len4, align 2, !dbg !558, !tbaa !222
  ret void, !dbg !559
}

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @task_done() local_unnamed_addr #8 !dbg !560 {
entry:
  call void @exit(i16 0) #12, !dbg !561
  unreachable, !dbg !561
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #9

; Function Attrs: norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #7 !dbg !562 {
entry:
  ret void, !dbg !563
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #10 !dbg !564 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !567, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !568, !tbaa !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !569, !tbaa !118
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !570, !tbaa !86
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !572, !tbaa !91
  %1 = or i8 %0, 1, !dbg !572
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !572, !tbaa !91
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !573, !tbaa !91
  %3 = and i8 %2, -2, !dbg !573
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !573, !tbaa !91
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !574, !tbaa !86
  %and4.i = and i16 %4, -2, !dbg !574
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !574, !tbaa !86
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !575, !tbaa !91
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !576, !tbaa !86
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !577, !tbaa !86
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !578, !tbaa !86
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !579, !tbaa !91
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !580, !tbaa !86
  tail call void @task_init(), !dbg !581
  tail call void @commit(), !dbg !581
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i16 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals2 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1
  %BCast4 = bitcast %struct.camel_global_t* %globals3 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(902) %BCast, i8* nonnull align 2 dereferenceable(902) %BCast4, i16 902, i1 false), !dbg !581
  %out_len2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1, i32 3, !dbg !582
  %5 = load i16, i16* %out_len2, align 2, !dbg !582, !tbaa !222
  %cmp3 = icmp ult i16 %5, 16, !dbg !583
  br i1 %cmp3, label %while.body, label %while.end24, !dbg !584

while.body:                                       ; preds = %entry, %if.end23
  tail call void @task_sample(), !dbg !585
  tail call void @commit(), !dbg !585
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 1
  %tmp6 = load i16, i16* %global5, align 2
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 1
  store i16 %tmp6, i16* %global9, align 2
  %global12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 16
  %tmp13 = load i16, i16* %global12, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 16
  store i16 %tmp13, i16* %global16, align 2
  %6 = load i16, i16* %global12, align 2, !dbg !587, !tbaa !283
  %cmp2 = icmp eq i16 %6, 0, !dbg !589
  br i1 %cmp2, label %if.then, label %while.body4.preheader, !dbg !590

if.then:                                          ; preds = %while.body
  tail call void @task_measure_temp(), !dbg !591
  tail call void @commit(), !dbg !591
  %tmp17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i16 0, i32 1, i32 2
  %tmp20 = load i16, i16* %global19, align 2
  %tmp21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp21, i16 0, i32 1, i32 2
  store i16 %tmp20, i16* %global23, align 2
  %global26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i16 0, i32 1, i32 6
  %tmp27 = load i16, i16* %global26, align 2
  %global30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp21, i16 0, i32 1, i32 6
  store i16 %tmp27, i16* %global30, align 2
  br label %while.body4.preheader, !dbg !593

while.body4.preheader:                            ; preds = %if.then, %while.body
  br label %while.body4, !dbg !594

while.body4:                                      ; preds = %do.body, %while.body4.preheader
  tail call void @task_letterize(), !dbg !596
  tail call void @commit(), !dbg !596
  %tmp31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp31, i16 0, i32 1, i32 0
  %tmp34 = load i16, i16* %global33, align 2
  %tmp35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp35, i16 0, i32 1, i32 0
  store i16 %tmp34, i16* %global37, align 2
  tail call void @task_compress(), !dbg !597
  tail call void @commit(), !dbg !597
  %tmp38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 8
  %tmp41 = load i16, i16* %global40, align 2
  %tmp42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i16 0, i32 1, i32 8
  store i16 %tmp41, i16* %global44, align 2
  %global47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i16 0, i32 1, i32 12
  %global50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 12
  %cast = bitcast %struct._node_t* %global47 to i8*
  %cast51 = bitcast %struct._node_t* %global50 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast, i8* nonnull align 2 dereferenceable(6) %cast51, i16 6, i1 false), !dbg !597
  %global54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 10
  %tmp55 = load i16, i16* %global54, align 2
  %global58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i16 0, i32 1, i32 10
  store i16 %tmp55, i16* %global58, align 2
  %global61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 9
  %tmp62 = load i16, i16* %global61, align 2
  %global65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i16 0, i32 1, i32 9
  store i16 %tmp62, i16* %global65, align 2
  %global68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i16 0, i32 1, i32 7
  %tmp69 = load i16, i16* %global68, align 2
  %global72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i16 0, i32 1, i32 7
  store i16 %tmp69, i16* %global72, align 2
  br label %do.body, !dbg !594

do.body:                                          ; preds = %do.body, %while.body4
  tail call void @task_find_sibling(), !dbg !598
  tail call void @commit(), !dbg !598
  %tmp73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i16 0, i32 1, i32 11
  %tmp76 = load i16, i16* %global75, align 2
  %tmp77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i16 0, i32 1, i32 11
  store i16 %tmp76, i16* %global79, align 2
  %global82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i16 0, i32 1, i32 16
  %tmp83 = load i16, i16* %global82, align 2
  %global86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i16 0, i32 1, i32 16
  store i16 %tmp83, i16* %global86, align 2
  %global89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i16 0, i32 1, i32 8
  %tmp90 = load i16, i16* %global89, align 2
  %global93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i16 0, i32 1, i32 8
  store i16 %tmp90, i16* %global93, align 2
  %7 = load i16, i16* %global82, align 2, !dbg !600, !tbaa !283
  switch i16 %7, label %if.end23 [
    i16 1, label %do.body
    i16 0, label %while.body4
    i16 3, label %do.body17
  ], !dbg !601

do.body17:                                        ; preds = %do.body, %do.body17
  tail call void @task_add_node(), !dbg !602
  tail call void @commit(), !dbg !602
  %tmp94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i16 0, i32 1, i32 8
  %tmp97 = load i16, i16* %global96, align 2
  %tmp98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i16 0, i32 1, i32 8
  store i16 %tmp97, i16* %global100, align 2
  %global103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i16 0, i32 1, i32 16
  %tmp104 = load i16, i16* %global103, align 2
  %global107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i16 0, i32 1, i32 16
  store i16 %tmp104, i16* %global107, align 2
  %global110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i16 0, i32 1, i32 14
  %global113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i16 0, i32 1, i32 14
  %cast114 = bitcast %struct._node_t* %global110 to i8*
  %cast115 = bitcast %struct._node_t* %global113 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast114, i8* nonnull align 2 dereferenceable(6) %cast115, i16 6, i1 false), !dbg !602
  %8 = load i16, i16* %global103, align 2, !dbg !606, !tbaa !283
  %cmp21 = icmp eq i16 %8, 0, !dbg !607
  br i1 %cmp21, label %do.body17, label %if.end23, !dbg !608, !llvm.loop !609

if.end23:                                         ; preds = %do.body17, %do.body
  tail call void @task_add_insert(), !dbg !612
  tail call void @commit(), !dbg !612
  %tmp116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global121 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp116, i16 0, i32 1, i32 10
  %load = load i16, i16* %global121, align 2
  %access = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp116, i16 0, i32 1, i32 5, i16 %load
  %tmp122 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp122, i16 0, i32 1, i32 5, i16 %load
  %cast130 = bitcast %struct._node_t* %access to i8*
  %cast131 = bitcast %struct._node_t* %access129 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast130, i8* nonnull align 2 dereferenceable(6) %cast131, i16 6, i1 false), !dbg !612
  %tmp132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i16 0, i32 1, i32 8
  %load138 = load i16, i16* %global137, align 2
  %access139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i16 0, i32 1, i32 5, i16 %load138
  %tmp140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp140, i16 0, i32 1, i32 5, i16 %load138
  %cast148 = bitcast %struct._node_t* %access139 to i8*
  %cast149 = bitcast %struct._node_t* %access147 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast148, i8* nonnull align 2 dereferenceable(6) %cast149, i16 6, i1 false), !dbg !612
  %tmp150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i16 0, i32 1, i32 9
  %load156 = load i16, i16* %global155, align 2
  %access157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i16 0, i32 1, i32 5, i16 %load156
  %tmp158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access165 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i16 0, i32 1, i32 5, i16 %load156
  %cast166 = bitcast %struct._node_t* %access157 to i8*
  %cast167 = bitcast %struct._node_t* %access165 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast166, i8* nonnull align 2 dereferenceable(6) %cast167, i16 6, i1 false), !dbg !612
  %tmp168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp168, i16 0, i32 1, i32 15
  %tmp171 = load i16, i16* %global170, align 2
  %tmp172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i16 0, i32 1, i32 15
  store i16 %tmp171, i16* %global174, align 2
  %global177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp168, i16 0, i32 1, i32 4
  %tmp178 = load i16, i16* %global177, align 2
  %global181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i16 0, i32 1, i32 4
  store i16 %tmp178, i16* %global181, align 2
  tail call void @task_append_compressed(), !dbg !613
  tail call void @commit(), !dbg !613
  %tmp182 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global187 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp182, i16 0, i32 1, i32 3
  %load188 = load i16, i16* %global187, align 2
  %access189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp182, i16 0, i32 1, i32 13, i16 %load188
  %tmp190 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access197 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i16 0, i32 1, i32 13, i16 %load188
  %cast198 = bitcast %struct._node_t* %access189 to i8*
  %cast199 = bitcast %struct._node_t* %access197 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(6) %cast198, i8* nonnull align 2 dereferenceable(6) %cast199, i16 6, i1 false), !dbg !613
  %tmp200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp200, i16 0, i32 1, i32 3
  %tmp203 = load i16, i16* %global202, align 2
  %tmp204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp204, i16 0, i32 1, i32 3
  store i16 %tmp203, i16* %global206, align 2
  %9 = load i16, i16* %global202, align 2, !dbg !582, !tbaa !222
  %cmp = icmp ult i16 %9, 16, !dbg !583
  br i1 %cmp, label %while.body, label %while.end24, !dbg !584, !llvm.loop !614

while.end24:                                      ; preds = %if.end23, %entry
  tail call void @task_done(), !dbg !616
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
!llvm.module.flags = !{!80, !81, !82}
!llvm.ident = !{!83}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 118, type: !75, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_cem.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 51, baseType: !6)
!8 = !{!9, !14, !21, !0, !23, !70, !72}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 549, type: !11, isLocal: true, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 16)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 78, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 26, baseType: !18)
!17 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !19, line: 43, baseType: !20)
!19 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 79, type: !16, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 125, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 16)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 111, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 106, size: 7408, elements: !28)
!28 = !{!29, !34, !69}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !27, file: !3, line: 108, baseType: !30, size: 176)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 176, elements: !32)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 75, baseType: !16)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !27, file: !3, line: 109, baseType: !35, size: 7216, offset: 176)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 103, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 82, size: 7216, elements: !37)
!37 = !{!38, !40, !41, !43, !44, !45, !55, !56, !57, !58, !59, !60, !61, !62, !66, !67, !68}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !36, file: !3, line: 84, baseType: !39, size: 16)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_t", file: !3, line: 52, baseType: !6)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "letter_idx", scope: !36, file: !3, line: 85, baseType: !6, size: 16, offset: 16)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "prev_sample", scope: !36, file: !3, line: 86, baseType: !42, size: 16, offset: 32)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "sample_t", file: !3, line: 53, baseType: !6)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "out_len", scope: !36, file: !3, line: 87, baseType: !7, size: 16, offset: 48)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "node_count", scope: !36, file: !3, line: 88, baseType: !7, size: 16, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "dict", scope: !36, file: !3, line: 89, baseType: !46, size: 6144, offset: 80)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 6144, elements: !53)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !3, line: 59, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_node_t", file: !3, line: 55, size: 48, elements: !49)
!49 = !{!50, !51, !52}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !48, file: !3, line: 56, baseType: !39, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !48, file: !3, line: 57, baseType: !7, size: 16, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !48, file: !3, line: 58, baseType: !7, size: 16, offset: 32)
!53 = !{!54}
!54 = !DISubrange(count: 128)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !36, file: !3, line: 90, baseType: !42, size: 16, offset: 6224)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sample_count", scope: !36, file: !3, line: 91, baseType: !7, size: 16, offset: 6240)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !36, file: !3, line: 92, baseType: !7, size: 16, offset: 6256)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !36, file: !3, line: 93, baseType: !7, size: 16, offset: 6272)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !36, file: !3, line: 94, baseType: !7, size: 16, offset: 6288)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "parent_next", scope: !36, file: !3, line: 95, baseType: !7, size: 16, offset: 6304)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "parent_node", scope: !36, file: !3, line: 96, baseType: !47, size: 48, offset: 6320)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "compressed_data", scope: !36, file: !3, line: 97, baseType: !63, size: 768, offset: 6368)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 768, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 16)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_node", scope: !36, file: !3, line: 98, baseType: !47, size: 48, offset: 7136)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "symbol", scope: !36, file: !3, line: 99, baseType: !7, size: 16, offset: 7184)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !36, file: !3, line: 102, baseType: !6, size: 16, offset: 7200)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !27, file: !3, line: 110, baseType: !16, size: 16, offset: 7392)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 125, type: !25, isLocal: false, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 154, type: !74, isLocal: false, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 176, elements: !32)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 113, size: 14832, elements: !76)
!76 = !{!77, !78, !79}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !75, file: !3, line: 115, baseType: !16, size: 16)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !75, file: !3, line: 116, baseType: !26, size: 7408, offset: 16)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !75, file: !3, line: 117, baseType: !26, size: 7408, offset: 7424)
!80 = !{i32 2, !"Dwarf Version", i32 4}
!81 = !{i32 2, !"Debug Info Version", i32 3}
!82 = !{i32 1, !"wchar_size", i32 2}
!83 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!84 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 127, type: !12, scopeLine: 127, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 128, column: 10, scope: !84)
!86 = !{!87, !87, i64 0}
!87 = !{!"int", !88, i64 0}
!88 = !{!"omnipotent char", !89, i64 0}
!89 = !{!"Simple C/C++ TBAA"}
!90 = !DILocation(line: 130, column: 9, scope: !84)
!91 = !{!88, !88, i64 0}
!92 = !DILocation(line: 132, column: 9, scope: !84)
!93 = !DILocation(line: 137, column: 11, scope: !84)
!94 = !DILocation(line: 142, column: 12, scope: !84)
!95 = !DILocation(line: 143, column: 10, scope: !84)
!96 = !DILocation(line: 144, column: 10, scope: !84)
!97 = !DILocation(line: 146, column: 10, scope: !84)
!98 = !DILocation(line: 147, column: 12, scope: !84)
!99 = !DILocation(line: 150, column: 10, scope: !84)
!100 = !DILocation(line: 152, column: 1, scope: !84)
!101 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 156, type: !12, scopeLine: 156, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !102)
!102 = !{!103, !105}
!103 = !DILocalVariable(name: "__x", scope: !104, file: !3, line: 183, type: !6)
!104 = distinct !DILexicalBlock(scope: !101, file: !3, line: 183, column: 33)
!105 = !DILocalVariable(name: "__x", scope: !106, file: !3, line: 183, type: !6)
!106 = distinct !DILexicalBlock(scope: !101, file: !3, line: 183, column: 65)
!107 = !DILocation(line: 157, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !101, file: !3, line: 157, column: 8)
!109 = !{!110, !111, i64 0}
!110 = !{!"Camel", !111, i64 0, !112, i64 2, !112, i64 928}
!111 = !{!"short", !88, i64 0}
!112 = !{!"camel_buffer_t", !88, i64 0, !113, i64 22, !111, i64 924}
!113 = !{!"camel_global_t", !87, i64 0, !87, i64 2, !87, i64 4, !87, i64 6, !87, i64 8, !88, i64 10, !87, i64 778, !87, i64 780, !87, i64 782, !87, i64 784, !87, i64 786, !87, i64 788, !114, i64 790, !88, i64 796, !114, i64 892, !87, i64 898, !87, i64 900}
!114 = !{!"_node_t", !87, i64 0, !87, i64 2, !87, i64 4}
!115 = !DILocation(line: 157, column: 8, scope: !101)
!116 = !DILocation(line: 158, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !108, file: !3, line: 157, column: 34)
!118 = !{!119, !119, i64 0}
!119 = !{!"any pointer", !88, i64 0}
!120 = !DILocation(line: 159, column: 16, scope: !117)
!121 = !DILocation(line: 160, column: 5, scope: !117)
!122 = !DILocation(line: 161, column: 14, scope: !123)
!123 = distinct !DILexicalBlock(scope: !124, file: !3, line: 160, column: 41)
!124 = distinct !DILexicalBlock(scope: !108, file: !3, line: 160, column: 15)
!125 = !DILocation(line: 162, column: 16, scope: !123)
!126 = !DILocation(line: 163, column: 5, scope: !123)
!127 = !DILocation(line: 164, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 163, column: 12)
!129 = !DILocation(line: 181, column: 3, scope: !130)
!130 = distinct !DILexicalBlock(scope: !101, file: !3, line: 181, column: 3)
!131 = !{!111, !111, i64 0}
!132 = !{i32 -2146592595}
!133 = !DILocation(line: 183, column: 33, scope: !104)
!134 = !{i32 -2146592359}
!135 = !DILocation(line: 0, scope: !104)
!136 = !DILocation(line: 183, column: 51, scope: !101)
!137 = !DILocation(line: 183, column: 33, scope: !101)
!138 = !DILocation(line: 183, column: 65, scope: !106)
!139 = !{i32 -2146592234}
!140 = !DILocation(line: 0, scope: !106)
!141 = !DILocation(line: 183, column: 63, scope: !101)
!142 = !DILocation(line: 183, column: 19, scope: !101)
!143 = !DILocation(line: 183, column: 17, scope: !101)
!144 = !DILocation(line: 184, column: 37, scope: !101)
!145 = !DILocation(line: 184, column: 23, scope: !101)
!146 = !DILocation(line: 184, column: 21, scope: !101)
!147 = !DILocation(line: 187, column: 27, scope: !148)
!148 = distinct !DILexicalBlock(scope: !101, file: !3, line: 187, column: 6)
!149 = !DILocation(line: 187, column: 33, scope: !148)
!150 = !{!112, !111, i64 924}
!151 = !DILocation(line: 187, column: 24, scope: !148)
!152 = !DILocation(line: 187, column: 6, scope: !101)
!153 = !DILocation(line: 188, column: 11, scope: !154)
!154 = distinct !DILexicalBlock(scope: !148, file: !3, line: 187, column: 51)
!155 = !DILocation(line: 188, column: 4, scope: !154)
!156 = !DILocation(line: 128, column: 10, scope: !84, inlinedAt: !157)
!157 = distinct !DILocation(line: 189, column: 4, scope: !154)
!158 = !DILocation(line: 130, column: 9, scope: !84, inlinedAt: !157)
!159 = !DILocation(line: 132, column: 9, scope: !84, inlinedAt: !157)
!160 = !DILocation(line: 137, column: 11, scope: !84, inlinedAt: !157)
!161 = !DILocation(line: 142, column: 12, scope: !84, inlinedAt: !157)
!162 = !DILocation(line: 143, column: 10, scope: !84, inlinedAt: !157)
!163 = !DILocation(line: 144, column: 10, scope: !84, inlinedAt: !157)
!164 = !DILocation(line: 146, column: 10, scope: !84, inlinedAt: !157)
!165 = !DILocation(line: 147, column: 12, scope: !84, inlinedAt: !157)
!166 = !DILocation(line: 150, column: 10, scope: !84, inlinedAt: !157)
!167 = !DILocation(line: 190, column: 24, scope: !154)
!168 = !DILocation(line: 190, column: 4, scope: !154)
!169 = !DILocation(line: 191, column: 3, scope: !154)
!170 = !DILocation(line: 192, column: 4, scope: !171)
!171 = distinct !DILexicalBlock(scope: !148, file: !3, line: 191, column: 9)
!172 = !DILocation(line: 195, column: 1, scope: !101)
!173 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 246, type: !12, scopeLine: 246, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !174)
!174 = !{!175, !180, !182, !185}
!175 = !DILocalVariable(name: "__x", scope: !176, file: !3, line: 253, type: !6)
!176 = distinct !DILexicalBlock(scope: !177, file: !3, line: 253, column: 45)
!177 = distinct !DILexicalBlock(scope: !178, file: !3, line: 249, column: 39)
!178 = distinct !DILexicalBlock(scope: !179, file: !3, line: 249, column: 14)
!179 = distinct !DILexicalBlock(scope: !173, file: !3, line: 247, column: 8)
!180 = !DILocalVariable(name: "__x", scope: !181, file: !3, line: 253, type: !6)
!181 = distinct !DILexicalBlock(scope: !177, file: !3, line: 253, column: 77)
!182 = !DILocalVariable(name: "__x", scope: !183, file: !3, line: 261, type: !6)
!183 = distinct !DILexicalBlock(scope: !184, file: !3, line: 261, column: 45)
!184 = distinct !DILexicalBlock(scope: !178, file: !3, line: 257, column: 17)
!185 = !DILocalVariable(name: "__x", scope: !186, file: !3, line: 261, type: !6)
!186 = distinct !DILexicalBlock(scope: !184, file: !3, line: 261, column: 77)
!187 = !DILocation(line: 249, column: 20, scope: !178)
!188 = !DILocation(line: 249, column: 25, scope: !178)
!189 = !DILocation(line: 249, column: 14, scope: !179)
!190 = !DILocation(line: 250, column: 17, scope: !177)
!191 = !DILocation(line: 251, column: 19, scope: !177)
!192 = !DILocation(line: 252, column: 12, scope: !177)
!193 = !DILocation(line: 253, column: 45, scope: !176)
!194 = !{i32 -2146591920}
!195 = !DILocation(line: 0, scope: !176)
!196 = !DILocation(line: 253, column: 77, scope: !181)
!197 = !{i32 -2146591795}
!198 = !DILocation(line: 0, scope: !181)
!199 = !DILocation(line: 257, column: 11, scope: !177)
!200 = !DILocation(line: 258, column: 17, scope: !184)
!201 = !DILocation(line: 259, column: 19, scope: !184)
!202 = !DILocation(line: 260, column: 12, scope: !184)
!203 = !DILocation(line: 261, column: 45, scope: !183)
!204 = !{i32 -2146591663}
!205 = !DILocation(line: 0, scope: !183)
!206 = !DILocation(line: 261, column: 77, scope: !186)
!207 = !{i32 -2146591538}
!208 = !DILocation(line: 0, scope: !186)
!209 = !DILocation(line: 0, scope: !178)
!210 = !DILocation(line: 269, column: 1, scope: !173)
!211 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 302, type: !12, scopeLine: 303, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !212)
!212 = !{!213, !215}
!213 = !DILocalVariable(name: "node", scope: !214, file: !3, line: 313, type: !47)
!214 = distinct !DILexicalBlock(scope: !211, file: !3, line: 311, column: 35)
!215 = !DILocalVariable(name: "i", scope: !214, file: !3, line: 318, type: !216)
!216 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!217 = !DILocation(line: 304, column: 2, scope: !211)
!218 = !DILocation(line: 304, column: 18, scope: !211)
!219 = !{!112, !87, i64 810}
!220 = !DILocation(line: 305, column: 2, scope: !211)
!221 = !DILocation(line: 305, column: 14, scope: !211)
!222 = !{!112, !87, i64 28}
!223 = !DILocation(line: 306, column: 2, scope: !211)
!224 = !DILocation(line: 306, column: 13, scope: !211)
!225 = !{!112, !87, i64 22}
!226 = !DILocation(line: 307, column: 2, scope: !211)
!227 = !DILocation(line: 307, column: 18, scope: !211)
!228 = !{!112, !87, i64 26}
!229 = !DILocation(line: 308, column: 2, scope: !211)
!230 = !DILocation(line: 308, column: 17, scope: !211)
!231 = !{!112, !87, i64 24}
!232 = !DILocation(line: 309, column: 2, scope: !211)
!233 = !DILocation(line: 309, column: 19, scope: !211)
!234 = !{!112, !87, i64 802}
!235 = !DILocation(line: 311, column: 2, scope: !211)
!236 = !DILocation(line: 311, column: 9, scope: !211)
!237 = !DILocation(line: 311, column: 20, scope: !211)
!238 = !DILocation(line: 313, column: 3, scope: !214)
!239 = !DILocation(line: 313, column: 10, scope: !214)
!240 = !DILocation(line: 313, column: 17, scope: !214)
!241 = !DILocation(line: 314, column: 14, scope: !214)
!242 = !{!114, !87, i64 0}
!243 = !{!114, !87, i64 2}
!244 = !{!114, !87, i64 4}
!245 = !DILocation(line: 318, column: 3, scope: !214)
!246 = !DILocation(line: 318, column: 7, scope: !214)
!247 = !DILocation(line: 318, column: 11, scope: !214)
!248 = !DILocation(line: 319, column: 3, scope: !214)
!249 = !DILocation(line: 319, column: 12, scope: !214)
!250 = !DILocation(line: 319, column: 17, scope: !214)
!251 = !{i64 0, i64 2, !86, i64 2, i64 2, !86, i64 4, i64 2, !86}
!252 = !DILocation(line: 320, column: 3, scope: !214)
!253 = !DILocation(line: 320, column: 13, scope: !214)
!254 = !DILocation(line: 321, column: 2, scope: !211)
!255 = distinct !{!255, !235, !254}
!256 = !DILocation(line: 323, column: 2, scope: !211)
!257 = !DILocation(line: 323, column: 17, scope: !211)
!258 = !{!112, !87, i64 30}
!259 = !DILocation(line: 324, column: 1, scope: !211)
!260 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 326, type: !12, scopeLine: 327, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !261)
!261 = !{!262}
!262 = !DILocalVariable(name: "next_letter_idx", scope: !260, file: !3, line: 328, type: !6)
!263 = !DILocation(line: 328, column: 2, scope: !260)
!264 = !DILocation(line: 328, column: 11, scope: !260)
!265 = !DILocation(line: 328, column: 29, scope: !260)
!266 = !DILocation(line: 328, column: 44, scope: !260)
!267 = !DILocation(line: 329, column: 6, scope: !268)
!268 = distinct !DILexicalBlock(scope: !260, file: !3, line: 329, column: 6)
!269 = !DILocation(line: 329, column: 22, scope: !268)
!270 = !DILocation(line: 329, column: 6, scope: !260)
!271 = !DILocation(line: 330, column: 19, scope: !268)
!272 = !DILocation(line: 330, column: 3, scope: !268)
!273 = !DILocation(line: 332, column: 6, scope: !274)
!274 = distinct !DILexicalBlock(scope: !260, file: !3, line: 332, column: 6)
!275 = !DILocation(line: 332, column: 21, scope: !274)
!276 = !DILocation(line: 332, column: 6, scope: !260)
!277 = !DILocation(line: 333, column: 20, scope: !278)
!278 = distinct !DILexicalBlock(scope: !274, file: !3, line: 332, column: 27)
!279 = !DILocation(line: 333, column: 3, scope: !278)
!280 = !DILocation(line: 333, column: 18, scope: !278)
!281 = !DILocation(line: 334, column: 3, scope: !278)
!282 = !DILocation(line: 334, column: 13, scope: !278)
!283 = !{!112, !87, i64 922}
!284 = !DILocation(line: 336, column: 2, scope: !278)
!285 = !DILocation(line: 337, column: 20, scope: !286)
!286 = distinct !DILexicalBlock(scope: !274, file: !3, line: 336, column: 9)
!287 = !DILocation(line: 337, column: 3, scope: !286)
!288 = !DILocation(line: 337, column: 18, scope: !286)
!289 = !DILocation(line: 338, column: 3, scope: !286)
!290 = !DILocation(line: 338, column: 13, scope: !286)
!291 = !DILocation(line: 341, column: 1, scope: !260)
!292 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 343, type: !12, scopeLine: 344, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !293)
!293 = !{!294, !295}
!294 = !DILocalVariable(name: "prev_sample", scope: !292, file: !3, line: 345, type: !42)
!295 = !DILocalVariable(name: "sample", scope: !292, file: !3, line: 348, type: !42)
!296 = !DILocation(line: 345, column: 2, scope: !292)
!297 = !DILocation(line: 345, column: 11, scope: !292)
!298 = !DILocation(line: 346, column: 16, scope: !292)
!299 = !DILocation(line: 346, column: 14, scope: !292)
!300 = !DILocation(line: 348, column: 2, scope: !292)
!301 = !DILocation(line: 348, column: 11, scope: !292)
!302 = !DILocation(line: 348, column: 35, scope: !292)
!303 = !DILocation(line: 348, column: 20, scope: !292)
!304 = !DILocation(line: 349, column: 16, scope: !292)
!305 = !DILocation(line: 349, column: 14, scope: !292)
!306 = !DILocation(line: 350, column: 20, scope: !292)
!307 = !DILocation(line: 350, column: 2, scope: !292)
!308 = !DILocation(line: 350, column: 18, scope: !292)
!309 = !DILocation(line: 351, column: 15, scope: !292)
!310 = !DILocation(line: 351, column: 2, scope: !292)
!311 = !DILocation(line: 351, column: 13, scope: !292)
!312 = !{!112, !87, i64 800}
!313 = !DILocation(line: 353, column: 1, scope: !292)
!314 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 296, type: !315, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !317)
!315 = !DISubroutineType(types: !316)
!316 = !{!42, !39}
!317 = !{!318, !319}
!318 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !314, file: !3, line: 296, type: !39)
!319 = !DILocalVariable(name: "sample", scope: !314, file: !3, line: 298, type: !39)
!320 = !DILocation(line: 0, scope: !314)
!321 = !DILocation(line: 298, column: 33, scope: !314)
!322 = !DILocation(line: 298, column: 38, scope: !314)
!323 = !DILocation(line: 299, column: 2, scope: !314)
!324 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 355, type: !12, scopeLine: 356, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !325)
!325 = !{!326, !327, !328}
!326 = !DILocalVariable(name: "letter_idx", scope: !324, file: !3, line: 357, type: !6)
!327 = !DILocalVariable(name: "letter_shift", scope: !324, file: !3, line: 362, type: !6)
!328 = !DILocalVariable(name: "letter", scope: !324, file: !3, line: 363, type: !39)
!329 = !DILocation(line: 357, column: 2, scope: !324)
!330 = !DILocation(line: 357, column: 11, scope: !324)
!331 = !DILocation(line: 357, column: 24, scope: !324)
!332 = !DILocation(line: 358, column: 6, scope: !333)
!333 = distinct !DILexicalBlock(scope: !324, file: !3, line: 358, column: 6)
!334 = !DILocation(line: 358, column: 17, scope: !333)
!335 = !DILocation(line: 358, column: 6, scope: !324)
!336 = !DILocation(line: 359, column: 14, scope: !333)
!337 = !DILocation(line: 359, column: 3, scope: !333)
!338 = !DILocation(line: 361, column: 13, scope: !333)
!339 = !DILocation(line: 362, column: 2, scope: !324)
!340 = !DILocation(line: 362, column: 11, scope: !324)
!341 = !DILocation(line: 362, column: 45, scope: !324)
!342 = !DILocation(line: 362, column: 43, scope: !324)
!343 = !DILocation(line: 363, column: 2, scope: !324)
!344 = !DILocation(line: 363, column: 11, scope: !324)
!345 = !DILocation(line: 363, column: 21, scope: !324)
!346 = !DILocation(line: 363, column: 50, scope: !324)
!347 = !DILocation(line: 363, column: 47, scope: !324)
!348 = !DILocation(line: 363, column: 32, scope: !324)
!349 = !DILocation(line: 363, column: 68, scope: !324)
!350 = !DILocation(line: 363, column: 65, scope: !324)
!351 = !DILocation(line: 365, column: 15, scope: !324)
!352 = !DILocation(line: 365, column: 2, scope: !324)
!353 = !DILocation(line: 365, column: 13, scope: !324)
!354 = !DILocation(line: 367, column: 1, scope: !324)
!355 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 369, type: !12, scopeLine: 370, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !356)
!356 = !{!357, !358}
!357 = !DILocalVariable(name: "parent_node", scope: !355, file: !3, line: 371, type: !47)
!358 = !DILocalVariable(name: "parent", scope: !355, file: !3, line: 372, type: !7)
!359 = !DILocation(line: 371, column: 2, scope: !355)
!360 = !DILocation(line: 371, column: 9, scope: !355)
!361 = !DILocation(line: 372, column: 2, scope: !355)
!362 = !DILocation(line: 372, column: 10, scope: !355)
!363 = !DILocation(line: 372, column: 19, scope: !355)
!364 = !DILocation(line: 373, column: 16, scope: !355)
!365 = !DILocation(line: 373, column: 25, scope: !355)
!366 = !DILocation(line: 375, column: 28, scope: !355)
!367 = !DILocation(line: 375, column: 2, scope: !355)
!368 = !DILocation(line: 375, column: 14, scope: !355)
!369 = !{!112, !87, i64 804}
!370 = !DILocation(line: 376, column: 2, scope: !355)
!371 = !DILocation(line: 376, column: 20, scope: !355)
!372 = !DILocation(line: 377, column: 15, scope: !355)
!373 = !DILocation(line: 377, column: 2, scope: !355)
!374 = !DILocation(line: 377, column: 13, scope: !355)
!375 = !{!112, !87, i64 808}
!376 = !DILocation(line: 378, column: 26, scope: !355)
!377 = !DILocation(line: 378, column: 2, scope: !355)
!378 = !DILocation(line: 378, column: 12, scope: !355)
!379 = !{!112, !87, i64 806}
!380 = !DILocation(line: 379, column: 2, scope: !355)
!381 = !DILocation(line: 379, column: 18, scope: !355)
!382 = !DILocation(line: 381, column: 1, scope: !355)
!383 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 383, type: !12, scopeLine: 384, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !384)
!384 = !{!385, !387, !390}
!385 = !DILocalVariable(name: "sibling_node", scope: !383, file: !3, line: 385, type: !386)
!386 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 16)
!387 = !DILocalVariable(name: "i", scope: !388, file: !3, line: 388, type: !216)
!388 = distinct !DILexicalBlock(scope: !389, file: !3, line: 387, column: 26)
!389 = distinct !DILexicalBlock(scope: !383, file: !3, line: 387, column: 6)
!390 = !DILocalVariable(name: "starting_node_idx", scope: !383, file: !3, line: 407, type: !7)
!391 = !DILocation(line: 385, column: 2, scope: !383)
!392 = !DILocation(line: 385, column: 10, scope: !383)
!393 = !DILocation(line: 387, column: 6, scope: !389)
!394 = !DILocation(line: 387, column: 18, scope: !389)
!395 = !DILocation(line: 387, column: 6, scope: !383)
!396 = !DILocation(line: 388, column: 3, scope: !388)
!397 = !DILocation(line: 388, column: 7, scope: !388)
!398 = !DILocation(line: 388, column: 11, scope: !388)
!399 = !DILocation(line: 389, column: 19, scope: !388)
!400 = !DILocation(line: 389, column: 28, scope: !388)
!401 = !DILocation(line: 389, column: 16, scope: !388)
!402 = !DILocation(line: 391, column: 7, scope: !403)
!403 = distinct !DILexicalBlock(scope: !388, file: !3, line: 391, column: 7)
!404 = !DILocation(line: 391, column: 21, scope: !403)
!405 = !DILocation(line: 391, column: 31, scope: !403)
!406 = !DILocation(line: 391, column: 28, scope: !403)
!407 = !DILocation(line: 391, column: 7, scope: !388)
!408 = !DILocation(line: 393, column: 22, scope: !409)
!409 = distinct !DILexicalBlock(scope: !403, file: !3, line: 391, column: 43)
!410 = !DILocation(line: 393, column: 4, scope: !409)
!411 = !DILocation(line: 393, column: 20, scope: !409)
!412 = !DILocation(line: 395, column: 4, scope: !409)
!413 = !DILocation(line: 395, column: 14, scope: !409)
!414 = !DILocation(line: 396, column: 4, scope: !409)
!415 = !DILocation(line: 398, column: 7, scope: !416)
!416 = distinct !DILexicalBlock(scope: !417, file: !3, line: 398, column: 7)
!417 = distinct !DILexicalBlock(scope: !403, file: !3, line: 397, column: 10)
!418 = !DILocation(line: 398, column: 21, scope: !416)
!419 = !DILocation(line: 398, column: 29, scope: !416)
!420 = !DILocation(line: 398, column: 7, scope: !417)
!421 = !DILocation(line: 399, column: 19, scope: !422)
!422 = distinct !DILexicalBlock(scope: !416, file: !3, line: 398, column: 34)
!423 = !DILocation(line: 399, column: 33, scope: !422)
!424 = !DILocation(line: 399, column: 5, scope: !422)
!425 = !DILocation(line: 399, column: 17, scope: !422)
!426 = !DILocation(line: 400, column: 5, scope: !422)
!427 = !DILocation(line: 400, column: 15, scope: !422)
!428 = !DILocation(line: 401, column: 5, scope: !422)
!429 = !DILocation(line: 405, column: 2, scope: !389)
!430 = !DILocation(line: 405, column: 2, scope: !388)
!431 = !DILocation(line: 407, column: 2, scope: !383)
!432 = !DILocation(line: 407, column: 10, scope: !383)
!433 = !DILocation(line: 407, column: 39, scope: !383)
!434 = !DILocation(line: 408, column: 20, scope: !383)
!435 = !DILocation(line: 408, column: 2, scope: !383)
!436 = !DILocation(line: 408, column: 18, scope: !383)
!437 = !DILocation(line: 410, column: 6, scope: !438)
!438 = distinct !DILexicalBlock(scope: !383, file: !3, line: 410, column: 6)
!439 = !DILocation(line: 410, column: 16, scope: !438)
!440 = !DILocation(line: 410, column: 6, scope: !383)
!441 = !DILocation(line: 411, column: 3, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !3, line: 410, column: 24)
!443 = !DILocation(line: 411, column: 13, scope: !442)
!444 = !DILocation(line: 412, column: 2, scope: !442)
!445 = !DILocation(line: 413, column: 3, scope: !446)
!446 = distinct !DILexicalBlock(scope: !438, file: !3, line: 412, column: 9)
!447 = !DILocation(line: 413, column: 13, scope: !446)
!448 = !DILocation(line: 415, column: 1, scope: !383)
!449 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 418, type: !12, scopeLine: 419, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !450)
!450 = !{!451, !452, !453, !456}
!451 = !DILocalVariable(name: "sibling_node", scope: !449, file: !3, line: 420, type: !386)
!452 = !DILocalVariable(name: "i", scope: !449, file: !3, line: 422, type: !216)
!453 = !DILocalVariable(name: "next_sibling", scope: !454, file: !3, line: 426, type: !7)
!454 = distinct !DILexicalBlock(scope: !455, file: !3, line: 425, column: 36)
!455 = distinct !DILexicalBlock(scope: !449, file: !3, line: 425, column: 6)
!456 = !DILocalVariable(name: "sibling_node_obj", scope: !457, file: !3, line: 433, type: !47)
!457 = distinct !DILexicalBlock(scope: !455, file: !3, line: 431, column: 9)
!458 = !DILocation(line: 420, column: 2, scope: !449)
!459 = !DILocation(line: 420, column: 10, scope: !449)
!460 = !DILocation(line: 422, column: 2, scope: !449)
!461 = !DILocation(line: 422, column: 6, scope: !449)
!462 = !DILocation(line: 422, column: 10, scope: !449)
!463 = !DILocation(line: 423, column: 18, scope: !449)
!464 = !DILocation(line: 423, column: 27, scope: !449)
!465 = !DILocation(line: 423, column: 15, scope: !449)
!466 = !DILocation(line: 425, column: 6, scope: !455)
!467 = !DILocation(line: 425, column: 20, scope: !455)
!468 = !DILocation(line: 425, column: 28, scope: !455)
!469 = !DILocation(line: 425, column: 6, scope: !449)
!470 = !DILocation(line: 426, column: 3, scope: !454)
!471 = !DILocation(line: 426, column: 11, scope: !454)
!472 = !DILocation(line: 426, column: 26, scope: !454)
!473 = !DILocation(line: 426, column: 40, scope: !454)
!474 = !DILocation(line: 427, column: 17, scope: !454)
!475 = !DILocation(line: 427, column: 3, scope: !454)
!476 = !DILocation(line: 427, column: 15, scope: !454)
!477 = !DILocation(line: 429, column: 3, scope: !454)
!478 = !DILocation(line: 429, column: 13, scope: !454)
!479 = !DILocation(line: 431, column: 2, scope: !455)
!480 = !DILocation(line: 431, column: 2, scope: !454)
!481 = !DILocation(line: 433, column: 3, scope: !457)
!482 = !DILocation(line: 433, column: 10, scope: !457)
!483 = !DILocation(line: 433, column: 30, scope: !457)
!484 = !DILocation(line: 433, column: 29, scope: !457)
!485 = !DILocation(line: 434, column: 3, scope: !457)
!486 = !DILocation(line: 434, column: 22, scope: !457)
!487 = !DILocation(line: 436, column: 3, scope: !457)
!488 = !DILocation(line: 436, column: 13, scope: !457)
!489 = !DILocation(line: 437, column: 2, scope: !455)
!490 = !DILocation(line: 438, column: 1, scope: !449)
!491 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 440, type: !12, scopeLine: 441, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !492)
!492 = !{!493, !494, !495, !496, !499}
!493 = !DILocalVariable(name: "child", scope: !491, file: !3, line: 448, type: !7)
!494 = !DILocalVariable(name: "child_node", scope: !491, file: !3, line: 449, type: !47)
!495 = !DILocalVariable(name: "cond", scope: !491, file: !3, line: 456, type: !47)
!496 = !DILocalVariable(name: "parent_node_obj", scope: !497, file: !3, line: 460, type: !47)
!497 = distinct !DILexicalBlock(scope: !498, file: !3, line: 458, column: 25)
!498 = distinct !DILexicalBlock(scope: !491, file: !3, line: 458, column: 6)
!499 = !DILocalVariable(name: "last_sibling_node", scope: !500, file: !3, line: 467, type: !47)
!500 = distinct !DILexicalBlock(scope: !498, file: !3, line: 465, column: 9)
!501 = !DILocation(line: 443, column: 6, scope: !502)
!502 = distinct !DILexicalBlock(scope: !491, file: !3, line: 443, column: 6)
!503 = !DILocation(line: 443, column: 21, scope: !502)
!504 = !DILocation(line: 443, column: 6, scope: !491)
!505 = !DILocation(line: 444, column: 3, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !3, line: 443, column: 35)
!507 = !DILocation(line: 448, column: 2, scope: !491)
!508 = !DILocation(line: 448, column: 10, scope: !491)
!509 = !DILocation(line: 448, column: 18, scope: !491)
!510 = !DILocation(line: 449, column: 2, scope: !491)
!511 = !DILocation(line: 449, column: 9, scope: !491)
!512 = !DILocation(line: 449, column: 22, scope: !491)
!513 = !DILocation(line: 450, column: 13, scope: !491)
!514 = !DILocation(line: 456, column: 2, scope: !491)
!515 = !DILocation(line: 456, column: 9, scope: !491)
!516 = !DILocation(line: 456, column: 16, scope: !491)
!517 = !DILocation(line: 458, column: 11, scope: !498)
!518 = !DILocation(line: 458, column: 17, scope: !498)
!519 = !DILocation(line: 458, column: 6, scope: !491)
!520 = !DILocation(line: 460, column: 3, scope: !497)
!521 = !DILocation(line: 460, column: 10, scope: !497)
!522 = !DILocation(line: 460, column: 28, scope: !497)
!523 = !DILocation(line: 461, column: 27, scope: !497)
!524 = !DILocation(line: 461, column: 19, scope: !497)
!525 = !DILocation(line: 461, column: 25, scope: !497)
!526 = !DILocation(line: 463, column: 3, scope: !497)
!527 = !DILocation(line: 463, column: 12, scope: !497)
!528 = !DILocation(line: 463, column: 26, scope: !497)
!529 = !DILocation(line: 465, column: 2, scope: !498)
!530 = !DILocation(line: 465, column: 2, scope: !497)
!531 = !DILocation(line: 467, column: 3, scope: !500)
!532 = !DILocation(line: 467, column: 10, scope: !500)
!533 = !DILocation(line: 467, column: 30, scope: !500)
!534 = !DILocation(line: 469, column: 31, scope: !500)
!535 = !DILocation(line: 469, column: 21, scope: !500)
!536 = !DILocation(line: 469, column: 29, scope: !500)
!537 = !DILocation(line: 470, column: 3, scope: !500)
!538 = !DILocation(line: 470, column: 12, scope: !500)
!539 = !DILocation(line: 470, column: 27, scope: !500)
!540 = !DILocation(line: 471, column: 2, scope: !498)
!541 = !DILocation(line: 472, column: 2, scope: !491)
!542 = !DILocation(line: 472, column: 11, scope: !491)
!543 = !DILocation(line: 472, column: 24, scope: !491)
!544 = !DILocation(line: 473, column: 15, scope: !491)
!545 = !DILocation(line: 473, column: 2, scope: !491)
!546 = !DILocation(line: 473, column: 13, scope: !491)
!547 = !{!112, !87, i64 920}
!548 = !DILocation(line: 474, column: 2, scope: !491)
!549 = !DILocation(line: 474, column: 16, scope: !491)
!550 = !DILocation(line: 476, column: 1, scope: !491)
!551 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 478, type: !12, scopeLine: 479, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!552 = !DILocation(line: 480, column: 44, scope: !551)
!553 = !DILocation(line: 480, column: 2, scope: !551)
!554 = !DILocation(line: 480, column: 22, scope: !551)
!555 = !DILocation(line: 480, column: 35, scope: !551)
!556 = !DILocation(line: 480, column: 42, scope: !551)
!557 = !DILocation(line: 482, column: 4, scope: !551)
!558 = !DILocation(line: 482, column: 2, scope: !551)
!559 = !DILocation(line: 483, column: 1, scope: !551)
!560 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 485, type: !12, scopeLine: 486, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!561 = !DILocation(line: 487, column: 2, scope: !560)
!562 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 490, type: !12, scopeLine: 490, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!563 = !DILocation(line: 492, column: 1, scope: !562)
!564 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 494, type: !565, scopeLine: 494, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!565 = !DISubroutineType(types: !566)
!566 = !{!216}
!567 = !DILocation(line: 496, column: 16, scope: !564)
!568 = !DILocation(line: 497, column: 10, scope: !564)
!569 = !DILocation(line: 498, column: 12, scope: !564)
!570 = !DILocation(line: 128, column: 10, scope: !84, inlinedAt: !571)
!571 = distinct !DILocation(line: 499, column: 5, scope: !564)
!572 = !DILocation(line: 130, column: 9, scope: !84, inlinedAt: !571)
!573 = !DILocation(line: 132, column: 9, scope: !84, inlinedAt: !571)
!574 = !DILocation(line: 137, column: 11, scope: !84, inlinedAt: !571)
!575 = !DILocation(line: 142, column: 12, scope: !84, inlinedAt: !571)
!576 = !DILocation(line: 143, column: 10, scope: !84, inlinedAt: !571)
!577 = !DILocation(line: 144, column: 10, scope: !84, inlinedAt: !571)
!578 = !DILocation(line: 146, column: 10, scope: !84, inlinedAt: !571)
!579 = !DILocation(line: 147, column: 12, scope: !84, inlinedAt: !571)
!580 = !DILocation(line: 150, column: 10, scope: !84, inlinedAt: !571)
!581 = !DILocation(line: 501, column: 2, scope: !564)
!582 = !DILocation(line: 503, column: 8, scope: !564)
!583 = !DILocation(line: 503, column: 21, scope: !564)
!584 = !DILocation(line: 503, column: 2, scope: !564)
!585 = !DILocation(line: 505, column: 3, scope: !586)
!586 = distinct !DILexicalBlock(scope: !564, file: !3, line: 503, column: 35)
!587 = !DILocation(line: 507, column: 7, scope: !588)
!588 = distinct !DILexicalBlock(scope: !586, file: !3, line: 507, column: 7)
!589 = !DILocation(line: 507, column: 18, scope: !588)
!590 = !DILocation(line: 507, column: 7, scope: !586)
!591 = !DILocation(line: 509, column: 4, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !3, line: 507, column: 23)
!593 = !DILocation(line: 511, column: 3, scope: !592)
!594 = !DILocation(line: 519, column: 4, scope: !595)
!595 = distinct !DILexicalBlock(scope: !586, file: !3, line: 513, column: 13)
!596 = !DILocation(line: 515, column: 4, scope: !595)
!597 = !DILocation(line: 517, column: 4, scope: !595)
!598 = !DILocation(line: 521, column: 5, scope: !599)
!599 = distinct !DILexicalBlock(scope: !595, file: !3, line: 519, column: 7)
!600 = !DILocation(line: 523, column: 13, scope: !595)
!601 = !DILocation(line: 523, column: 4, scope: !599)
!602 = !DILocation(line: 532, column: 5, scope: !603)
!603 = distinct !DILexicalBlock(scope: !604, file: !3, line: 530, column: 6)
!604 = distinct !DILexicalBlock(scope: !605, file: !3, line: 529, column: 24)
!605 = distinct !DILexicalBlock(scope: !586, file: !3, line: 529, column: 7)
!606 = !DILocation(line: 535, column: 13, scope: !604)
!607 = !DILocation(line: 535, column: 24, scope: !604)
!608 = !DILocation(line: 535, column: 4, scope: !603)
!609 = distinct !{!609, !610, !611}
!610 = !DILocation(line: 530, column: 4, scope: !604)
!611 = !DILocation(line: 535, column: 28, scope: !604)
!612 = !DILocation(line: 538, column: 3, scope: !586)
!613 = !DILocation(line: 540, column: 3, scope: !586)
!614 = distinct !{!614, !584, !615}
!615 = !DILocation(line: 542, column: 2, scope: !564)
!616 = !DILocation(line: 544, column: 2, scope: !564)
