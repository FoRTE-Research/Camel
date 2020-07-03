; ModuleID = 'camel_rsa_opt.bc'
source_filename = "../benchmarks/camel_rsa.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [16 x i16], i16, i16, i16, i16, i16, [16 x i16], [8 x i16], i16, i16, i16, [16 x i16], i16, i16, [16 x i16], [16 x i16], i16, i16, i16 }
%struct.pubkey_t = type { [8 x i8], i16 }

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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !25
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !67
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !18
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !23
@pubkey = internal unnamed_addr constant %struct.pubkey_t { [8 x i8] c"\15p\F6B\0E\82q\A6", i16 3 }, align 2, !dbg !72
@PLAINTEXT = internal unnamed_addr constant [12 x i8] c".RRRSSSAAA.\00", align 1, !dbg !84
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !13
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !69
@zero = common dso_local local_unnamed_addr global i16 0, align 2
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !99 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !100, !tbaa !101
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !105, !tbaa !106
  %1 = or i8 %0, 1, !dbg !105
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !105, !tbaa !106
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !107, !tbaa !106
  %3 = and i8 %2, -2, !dbg !107
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !107, !tbaa !106
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !108, !tbaa !101
  %and4 = and i16 %4, -2, !dbg !108
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !108, !tbaa !101
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !109, !tbaa !106
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !110, !tbaa !101
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !111, !tbaa !101
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !112, !tbaa !101
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !113, !tbaa !106
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !114, !tbaa !101
  ret void, !dbg !115
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !116 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !122, !tbaa !124
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !129

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !130, !tbaa !132
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !134, !tbaa !132
  br label %if.end4, !dbg !135

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !136, !tbaa !132
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !139, !tbaa !132
  br label %if.end4, !dbg !140

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !141
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !143, !tbaa !132
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !143
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !143
  %2 = load i16, i16* %arrayidx, align 2, !dbg !143, !tbaa !145
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #11, !dbg !143, !srcloc !146
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !147, !srcloc !148
  call void @llvm.dbg.value(metadata i16 %3, metadata !118, metadata !DIExpression()), !dbg !149
  %add = add i16 %3, 2, !dbg !150
  %4 = inttoptr i16 %add to i8*, !dbg !151
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !152, !srcloc !153
  call void @llvm.dbg.value(metadata i16 %5, metadata !120, metadata !DIExpression()), !dbg !154
  %sub = sub i16 9214, %5, !dbg !155
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !156
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !157, !tbaa !145
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !158, !tbaa !132
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 224, i16 zeroext %call) #11, !dbg !159
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !160, !tbaa !145
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !161, !tbaa !132
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !163
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !163, !tbaa !164
  %cmp9 = icmp eq i16 %call8, %8, !dbg !165
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !166

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !167, !tbaa !132
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !169
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(226) %9, i8* nonnull align 2 dereferenceable(226) %10, i16 226, i1 false), !dbg !169
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !170, !tbaa !101
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !172, !tbaa !106
  %12 = or i8 %11, 1, !dbg !172
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !172, !tbaa !106
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !173, !tbaa !106
  %14 = and i8 %13, -2, !dbg !173
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !173, !tbaa !106
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !174, !tbaa !101
  %and4.i = and i16 %15, -2, !dbg !174
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !174, !tbaa !101
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !175, !tbaa !106
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !176, !tbaa !101
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !177, !tbaa !101
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !178, !tbaa !101
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !179, !tbaa !106
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !180, !tbaa !101
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !181, !tbaa !132
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !181
  tail call void @__restore_registers(i16* %arraydecay) #11, !dbg !182
  br label %if.end13, !dbg !183

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #11, !dbg !184
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !186
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
define dso_local void @commit() local_unnamed_addr #5 !dbg !187 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !201, !tbaa !124
  %cmp = icmp eq i16 %0, 1, !dbg !202
  br i1 %cmp, label %if.then, label %if.else, !dbg !203

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !204, !tbaa !132
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !205, !tbaa !132
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #11, !dbg !206
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !207, !srcloc !208
  call void @llvm.dbg.value(metadata i16 %1, metadata !189, metadata !DIExpression()), !dbg !209
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !210, !srcloc !211
  call void @llvm.dbg.value(metadata i16 %2, metadata !194, metadata !DIExpression()), !dbg !212
  br label %do.end, !dbg !213

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !214, !tbaa !132
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !215, !tbaa !132
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #11, !dbg !216
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !217, !srcloc !218
  call void @llvm.dbg.value(metadata i16 %3, metadata !196, metadata !DIExpression()), !dbg !219
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #11, !dbg !220, !srcloc !221
  call void @llvm.dbg.value(metadata i16 %4, metadata !199, metadata !DIExpression()), !dbg !222
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink7 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !223
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !223
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !223
  %sub = sub i16 9214, %.sink7, !dbg !223
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #11, !dbg !223
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !223, !tbaa !145
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !223, !tbaa !132
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 224, i16 zeroext %call) #11, !dbg !223
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !223, !tbaa !145
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !223, !tbaa !132
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !223
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !223, !tbaa !164
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !223, !tbaa !124
  ret void, !dbg !224
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @task_done() local_unnamed_addr #6 !dbg !225 {
entry:
  call void @exit(i16 0) #12, !dbg !226
  unreachable, !dbg !226
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #7

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() local_unnamed_addr #8 !dbg !227 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !232
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !232
  call void @llvm.dbg.declare(metadata i16* %i, metadata !229, metadata !DIExpression()), !dbg !233
  %1 = bitcast i16* %message_length to i8*, !dbg !234
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !234
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !231, metadata !DIExpression()), !dbg !235
  store i16 11, i16* %message_length, align 2, !dbg !235, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !236, !tbaa !101
  br label %for.cond, !dbg !238

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !239, !tbaa !101
  %cmp = icmp slt i16 %2, 8, !dbg !241
  br i1 %cmp, label %for.body, label %for.end, !dbg !242

for.body:                                         ; preds = %for.cond
  %3 = load i16, i16* %i, align 2, !dbg !243, !tbaa !101
  %arrayidx = getelementptr inbounds [8 x i8], [8 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %3, !dbg !245
  %4 = load i8, i8* %arrayidx, align 1, !dbg !245, !tbaa !106
  %conv = zext i8 %4 to i16, !dbg !245
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !246, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !246
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !246
  %6 = load i16, i16* %i, align 2, !dbg !247, !tbaa !101
  %arrayidx1 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %6, !dbg !246
  store i16 %conv, i16* %arrayidx1, align 2, !dbg !248, !tbaa !145
  br label %for.inc, !dbg !249

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !250, !tbaa !101
  %inc = add nsw i16 %7, 1, !dbg !250
  store i16 %inc, i16* %i, align 2, !dbg !250, !tbaa !101
  br label %for.cond, !dbg !251, !llvm.loop !252

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %message_length, align 2, !dbg !254, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255, !tbaa !132
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !255
  %message_length3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !255
  store i16 %8, i16* %message_length3, align 2, !dbg !256, !tbaa !257
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !258
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !258
  store i16 0, i16* %block_offset, align 2, !dbg !259, !tbaa !260
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !261, !tbaa !132
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !261
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 5, !dbg !261
  store i16 0, i16* %cyphertext_len, align 2, !dbg !262, !tbaa !263
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264, !tbaa !132
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !264
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !264
  store i16 0, i16* %check, align 2, !dbg !265, !tbaa !266
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !267, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !267
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !267
  store i16 0, i16* %check_final, align 2, !dbg !268, !tbaa !269
  %14 = bitcast i16* %message_length to i8*, !dbg !270
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #11, !dbg !270
  %15 = bitcast i16* %i to i8*, !dbg !270
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %15) #11, !dbg !270
  ret void, !dbg !270
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_pad() local_unnamed_addr #8 !dbg !271 {
entry:
  %i = alloca i16, align 2
  %zero = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !275
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !275
  call void @llvm.dbg.declare(metadata i16* %i, metadata !273, metadata !DIExpression()), !dbg !276
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !277
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !277
  %2 = load i16, i16* %block_offset, align 2, !dbg !277, !tbaa !260
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !279
  %message_length = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !279
  %4 = load i16, i16* %message_length, align 2, !dbg !279, !tbaa !257
  %cmp = icmp uge i16 %2, %4, !dbg !280
  br i1 %cmp, label %if.then, label %if.end, !dbg !281

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !282
  unreachable

if.end:                                           ; preds = %entry
  %5 = bitcast i16* %zero to i8*, !dbg !284
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !284
  call void @llvm.dbg.declare(metadata i16* %zero, metadata !274, metadata !DIExpression()), !dbg !285
  store i16 0, i16* %zero, align 2, !dbg !285, !tbaa !145
  store i16 0, i16* %i, align 2, !dbg !286, !tbaa !101
  br label %for.cond, !dbg !288

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i16, i16* %i, align 2, !dbg !289, !tbaa !101
  %cmp2 = icmp ult i16 %6, 7, !dbg !291
  br i1 %cmp2, label %for.body, label %for.end, !dbg !292

for.body:                                         ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !293, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !293
  %block_offset4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !293
  %8 = load i16, i16* %block_offset4, align 2, !dbg !293, !tbaa !260
  %9 = load i16, i16* %i, align 2, !dbg !295, !tbaa !101
  %add = add i16 %8, %9, !dbg !296
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !297, !tbaa !132
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !297
  %message_length6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !297
  %11 = load i16, i16* %message_length6, align 2, !dbg !297, !tbaa !257
  %cmp7 = icmp ult i16 %add, %11, !dbg !298
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !299

cond.true:                                        ; preds = %for.body
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300, !tbaa !132
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !300
  %block_offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 3, !dbg !300
  %13 = load i16, i16* %block_offset9, align 2, !dbg !300, !tbaa !260
  %14 = load i16, i16* %i, align 2, !dbg !301, !tbaa !101
  %add10 = add i16 %13, %14, !dbg !302
  %arrayidx = getelementptr inbounds [12 x i8], [12 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !303
  %15 = load i8, i8* %arrayidx, align 1, !dbg !303, !tbaa !106
  %conv = zext i8 %15 to i16, !dbg !303
  br label %cond.end, !dbg !299

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !299

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv, %cond.true ], [ 255, %cond.false ], !dbg !299
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304, !tbaa !132
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !304
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !304
  %17 = load i16, i16* %i, align 2, !dbg !305, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %17, !dbg !304
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !306, !tbaa !145
  br label %for.inc, !dbg !307

for.inc:                                          ; preds = %cond.end
  %18 = load i16, i16* %i, align 2, !dbg !308, !tbaa !101
  %inc = add nsw i16 %18, 1, !dbg !308
  store i16 %inc, i16* %i, align 2, !dbg !308, !tbaa !101
  br label %for.cond, !dbg !309, !llvm.loop !310

for.end:                                          ; preds = %for.cond
  store i16 7, i16* %i, align 2, !dbg !312, !tbaa !101
  br label %for.cond13, !dbg !314

for.cond13:                                       ; preds = %for.inc20, %for.end
  %19 = load i16, i16* %i, align 2, !dbg !315, !tbaa !101
  %cmp14 = icmp slt i16 %19, 8, !dbg !317
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !318

for.body16:                                       ; preds = %for.cond13
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319, !tbaa !132
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !319
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !319
  %21 = load i16, i16* %i, align 2, !dbg !321, !tbaa !101
  %arrayidx19 = getelementptr inbounds [16 x i16], [16 x i16]* %base18, i16 0, i16 %21, !dbg !319
  store i16 1, i16* %arrayidx19, align 2, !dbg !322, !tbaa !145
  br label %for.inc20, !dbg !323

for.inc20:                                        ; preds = %for.body16
  %22 = load i16, i16* %i, align 2, !dbg !324, !tbaa !101
  %inc21 = add nsw i16 %22, 1, !dbg !324
  store i16 %inc21, i16* %i, align 2, !dbg !324, !tbaa !101
  br label %for.cond13, !dbg !325, !llvm.loop !326

for.end22:                                        ; preds = %for.cond13
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328, !tbaa !132
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !328
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 15, !dbg !328
  %24 = load i16, i16* %zero, align 2, !dbg !329, !tbaa !145
  %arrayidx24 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %24, !dbg !328
  store i16 1, i16* %arrayidx24, align 2, !dbg !330, !tbaa !145
  store i16 1, i16* %i, align 2, !dbg !331, !tbaa !101
  br label %for.cond25, !dbg !333

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %25 = load i16, i16* %i, align 2, !dbg !334, !tbaa !101
  %cmp26 = icmp slt i16 %25, 8, !dbg !336
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !337

for.body28:                                       ; preds = %for.cond25
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338, !tbaa !132
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !338
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !338
  %27 = load i16, i16* %i, align 2, !dbg !339, !tbaa !101
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %block30, i16 0, i16 %27, !dbg !338
  store i16 0, i16* %arrayidx31, align 2, !dbg !340, !tbaa !145
  br label %for.inc32, !dbg !338

for.inc32:                                        ; preds = %for.body28
  %28 = load i16, i16* %i, align 2, !dbg !341, !tbaa !101
  %inc33 = add nsw i16 %28, 1, !dbg !341
  store i16 %inc33, i16* %i, align 2, !dbg !341, !tbaa !101
  br label %for.cond25, !dbg !342, !llvm.loop !343

for.end34:                                        ; preds = %for.cond25
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345, !tbaa !132
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !345
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !345
  store i16 3, i16* %exponent, align 2, !dbg !346, !tbaa !347
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !348, !tbaa !132
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !348
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !348
  %31 = load i16, i16* %block_offset37, align 2, !dbg !349, !tbaa !260
  %add38 = add i16 %31, 7, !dbg !349
  store i16 %add38, i16* %block_offset37, align 2, !dbg !349, !tbaa !260
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350, !tbaa !132
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !350
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 17, !dbg !350
  store i16 2, i16* %check, align 2, !dbg !351, !tbaa !266
  %33 = bitcast i16* %zero to i8*, !dbg !352
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #11, !dbg !352
  %34 = bitcast i16* %i to i8*, !dbg !352
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #11, !dbg !352
  %load = load i16, i16* %zero
  store i16 %load, i16* @zero
  ret void, !dbg !352
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_exp() local_unnamed_addr #8 !dbg !353 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !354
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !354
  %1 = load i16, i16* %exponent, align 2, !dbg !354, !tbaa !347
  %and = and i16 %1, 1, !dbg !356
  %tobool = icmp ne i16 %and, 0, !dbg !356
  br i1 %tobool, label %if.then, label %if.else, !dbg !357

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !358
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !358
  %3 = load i16, i16* %exponent2, align 2, !dbg !360, !tbaa !347
  %shr = lshr i16 %3, 1, !dbg !360
  store i16 %shr, i16* %exponent2, align 2, !dbg !360, !tbaa !347
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !361, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !361
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !361
  store i16 0, i16* %check, align 2, !dbg !362, !tbaa !266
  br label %if.end, !dbg !363

if.else:                                          ; preds = %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !364
  %exponent5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !364
  %6 = load i16, i16* %exponent5, align 2, !dbg !366, !tbaa !347
  %shr6 = lshr i16 %6, 1, !dbg !366
  store i16 %shr6, i16* %exponent5, align 2, !dbg !366, !tbaa !347
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !367
  %check8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 17, !dbg !367
  store i16 1, i16* %check8, align 2, !dbg !368, !tbaa !266
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !369
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block() local_unnamed_addr #8 !dbg !370 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !371
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !371
  store i16 0, i16* %check_final, align 2, !dbg !372, !tbaa !269
  ret void, !dbg !373
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block_get_result() local_unnamed_addr #8 !dbg !374 {
entry:
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !385
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !385
  call void @llvm.dbg.declare(metadata i16* %i, metadata !376, metadata !DIExpression()), !dbg !386
  store i16 7, i16* %i, align 2, !dbg !387, !tbaa !101
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !390, !tbaa !101
  %cmp = icmp sge i16 %1, 0, !dbg !392
  br i1 %cmp, label %for.body, label %for.end, !dbg !393

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !394, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !394
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !394
  %3 = load i16, i16* %i, align 2, !dbg !396, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !394
  %4 = load i16, i16* %arrayidx, align 2, !dbg !394, !tbaa !145
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !397, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !397
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !397
  %6 = load i16, i16* %i, align 2, !dbg !398, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %6, !dbg !397
  store i16 %4, i16* %arrayidx2, align 2, !dbg !399, !tbaa !145
  br label %for.inc, !dbg !400

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !401, !tbaa !101
  %dec = add nsw i16 %7, -1, !dbg !401
  store i16 %dec, i16* %i, align 2, !dbg !401, !tbaa !101
  br label %for.cond, !dbg !402, !llvm.loop !403

for.end:                                          ; preds = %for.cond
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !405
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !405
  %9 = load i16, i16* %exponent, align 2, !dbg !405, !tbaa !347
  %cmp4 = icmp ugt i16 %9, 0, !dbg !406
  br i1 %cmp4, label %if.then, label %if.else, !dbg !407

if.then:                                          ; preds = %for.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408, !tbaa !132
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !408
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 17, !dbg !408
  store i16 1, i16* %check, align 2, !dbg !410, !tbaa !266
  br label %if.end26, !dbg !411

if.else:                                          ; preds = %for.end
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412, !tbaa !132
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !412
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !412
  %12 = load i16, i16* %cyphertext_len, align 2, !dbg !412, !tbaa !263
  %add = add i16 %12, 8, !dbg !413
  %cmp7 = icmp ule i16 %add, 16, !dbg !414
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !415

if.then8:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !416, !tbaa !101
  br label %for.cond9, !dbg !417

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %13 = load i16, i16* %i, align 2, !dbg !418, !tbaa !101
  %cmp10 = icmp slt i16 %13, 8, !dbg !419
  br i1 %cmp10, label %for.body11, label %for.end23, !dbg !420

for.body11:                                       ; preds = %for.cond9
  %14 = bitcast i16* %op to i8*, !dbg !421
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %14) #11, !dbg !421
  call void @llvm.dbg.declare(metadata i16* %op, metadata !377, metadata !DIExpression()), !dbg !422
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !423, !tbaa !132
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !423
  %cyphertext_len13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !423
  %16 = load i16, i16* %cyphertext_len13, align 2, !dbg !423, !tbaa !263
  store i16 %16, i16* %op, align 2, !dbg !422, !tbaa !101
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424, !tbaa !132
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !424
  %product15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !424
  %18 = load i16, i16* %i, align 2, !dbg !425, !tbaa !101
  %arrayidx16 = getelementptr inbounds [16 x i16], [16 x i16]* %product15, i16 0, i16 %18, !dbg !424
  %19 = load i16, i16* %arrayidx16, align 2, !dbg !424, !tbaa !145
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426, !tbaa !132
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !426
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 11, !dbg !426
  %21 = load i16, i16* %op, align 2, !dbg !427, !tbaa !101
  %arrayidx18 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %21, !dbg !426
  store i16 %19, i16* %arrayidx18, align 2, !dbg !428, !tbaa !145
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429, !tbaa !132
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !429
  %cyphertext_len20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !429
  %23 = load i16, i16* %cyphertext_len20, align 2, !dbg !430, !tbaa !263
  %inc = add i16 %23, 1, !dbg !430
  store i16 %inc, i16* %cyphertext_len20, align 2, !dbg !430, !tbaa !263
  %24 = bitcast i16* %op to i8*, !dbg !431
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %24) #11, !dbg !431
  br label %for.inc21, !dbg !432

for.inc21:                                        ; preds = %for.body11
  %25 = load i16, i16* %i, align 2, !dbg !433, !tbaa !101
  %inc22 = add nsw i16 %25, 1, !dbg !433
  store i16 %inc22, i16* %i, align 2, !dbg !433, !tbaa !101
  br label %for.cond9, !dbg !434, !llvm.loop !435

for.end23:                                        ; preds = %for.cond9
  br label %if.end, !dbg !437

if.end:                                           ; preds = %for.end23, %if.else
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438, !tbaa !132
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !438
  %check25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !438
  store i16 0, i16* %check25, align 2, !dbg !439, !tbaa !266
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then
  %27 = bitcast i16* %i to i8*, !dbg !440
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #11, !dbg !440
  ret void, !dbg !440
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base() local_unnamed_addr #8 !dbg !441 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !442
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !442
  store i16 1, i16* %check_final, align 2, !dbg !443, !tbaa !269
  ret void, !dbg !444
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base_get_result() local_unnamed_addr #8 !dbg !445 {
entry:
  %i = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !448
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !448
  call void @llvm.dbg.declare(metadata i16* %i, metadata !447, metadata !DIExpression()), !dbg !449
  store i16 0, i16* %i, align 2, !dbg !450, !tbaa !101
  br label %for.cond, !dbg !452

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !453, !tbaa !101
  %cmp = icmp slt i16 %1, 8, !dbg !455
  br i1 %cmp, label %for.body, label %for.end, !dbg !456

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !457, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !457
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !457
  %3 = load i16, i16* %i, align 2, !dbg !459, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !457
  %4 = load i16, i16* %arrayidx, align 2, !dbg !457, !tbaa !145
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !460, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !460
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !460
  %6 = load i16, i16* %i, align 2, !dbg !461, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %6, !dbg !460
  store i16 %4, i16* %arrayidx2, align 2, !dbg !462, !tbaa !145
  br label %for.inc, !dbg !463

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !464, !tbaa !101
  %inc = add nsw i16 %7, 1, !dbg !464
  store i16 %inc, i16* %i, align 2, !dbg !464, !tbaa !101
  br label %for.cond, !dbg !465, !llvm.loop !466

for.end:                                          ; preds = %for.cond
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !468, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !468
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !468
  store i16 2, i16* %check, align 2, !dbg !469, !tbaa !266
  %9 = bitcast i16* %i to i8*, !dbg !470
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %9) #11, !dbg !470
  ret void, !dbg !470
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_mod() local_unnamed_addr #8 !dbg !471 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !472, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !472
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !472
  store i16 0, i16* %digit, align 2, !dbg !473, !tbaa !474
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !475, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !475
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !475
  store i16 0, i16* %carry, align 2, !dbg !476, !tbaa !477
  ret void, !dbg !478
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult() local_unnamed_addr #8 !dbg !479 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !493
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !493
  call void @llvm.dbg.declare(metadata i16* %i, metadata !481, metadata !DIExpression()), !dbg !494
  %1 = bitcast i16* %a to i8*, !dbg !495
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !495
  call void @llvm.dbg.declare(metadata i16* %a, metadata !482, metadata !DIExpression()), !dbg !496
  %2 = bitcast i16* %b to i8*, !dbg !495
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !495
  call void @llvm.dbg.declare(metadata i16* %b, metadata !483, metadata !DIExpression()), !dbg !497
  %3 = bitcast i16* %c to i8*, !dbg !495
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !495
  call void @llvm.dbg.declare(metadata i16* %c, metadata !484, metadata !DIExpression()), !dbg !498
  %4 = bitcast i16* %dp to i8*, !dbg !499
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #11, !dbg !499
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !485, metadata !DIExpression()), !dbg !500
  %5 = bitcast i16* %p to i8*, !dbg !499
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !499
  call void @llvm.dbg.declare(metadata i16* %p, metadata !486, metadata !DIExpression()), !dbg !501
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !502, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !502
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !502
  %7 = load i16, i16* %carry, align 2, !dbg !502, !tbaa !477
  store i16 %7, i16* %p, align 2, !dbg !503, !tbaa !145
  store i16 0, i16* %c, align 2, !dbg !504, !tbaa !145
  store i16 0, i16* %i, align 2, !dbg !505, !tbaa !101
  br label %for.cond, !dbg !506

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i16, i16* %i, align 2, !dbg !507, !tbaa !101
  %cmp = icmp slt i16 %8, 8, !dbg !508
  br i1 %cmp, label %for.body, label %for.end, !dbg !509

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !510, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !510
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !510
  %10 = load i16, i16* %digit, align 2, !dbg !510, !tbaa !474
  %11 = load i16, i16* %i, align 2, !dbg !511, !tbaa !101
  %sub = sub i16 %10, %11, !dbg !512
  %cmp2 = icmp uge i16 %sub, 0, !dbg !513
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !514

land.lhs.true:                                    ; preds = %for.body
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !515, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !515
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !515
  %13 = load i16, i16* %digit4, align 2, !dbg !515, !tbaa !474
  %14 = load i16, i16* %i, align 2, !dbg !516, !tbaa !101
  %sub5 = sub i16 %13, %14, !dbg !517
  %cmp6 = icmp ult i16 %sub5, 8, !dbg !518
  br i1 %cmp6, label %if.then, label %if.end, !dbg !519

if.then:                                          ; preds = %land.lhs.true
  %15 = bitcast i16* %op to i8*, !dbg !520
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %15) #11, !dbg !520
  call void @llvm.dbg.declare(metadata i16* %op, metadata !487, metadata !DIExpression()), !dbg !521
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !522, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !522
  %digit8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !522
  %17 = load i16, i16* %digit8, align 2, !dbg !522, !tbaa !474
  %18 = load i16, i16* %i, align 2, !dbg !523, !tbaa !101
  %sub9 = sub i16 %17, %18, !dbg !524
  store i16 %sub9, i16* %op, align 2, !dbg !521, !tbaa !101
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !525, !tbaa !132
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !525
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !525
  %20 = load i16, i16* %op, align 2, !dbg !526, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %20, !dbg !525
  %21 = load i16, i16* %arrayidx, align 2, !dbg !525, !tbaa !145
  store i16 %21, i16* %a, align 2, !dbg !527, !tbaa !145
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !528, !tbaa !132
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !528
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !528
  %23 = load i16, i16* %i, align 2, !dbg !529, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %23, !dbg !528
  %24 = load i16, i16* %arrayidx12, align 2, !dbg !528, !tbaa !145
  store i16 %24, i16* %b, align 2, !dbg !530, !tbaa !145
  %25 = load i16, i16* %a, align 2, !dbg !531, !tbaa !145
  %26 = load i16, i16* %b, align 2, !dbg !532, !tbaa !145
  %mul = mul i16 %25, %26, !dbg !533
  store i16 %mul, i16* %dp, align 2, !dbg !534, !tbaa !145
  %27 = load i16, i16* %dp, align 2, !dbg !535, !tbaa !145
  %shr = lshr i16 %27, 8, !dbg !536
  %28 = load i16, i16* %c, align 2, !dbg !537, !tbaa !145
  %add = add i16 %28, %shr, !dbg !537
  store i16 %add, i16* %c, align 2, !dbg !537, !tbaa !145
  %29 = load i16, i16* %dp, align 2, !dbg !538, !tbaa !145
  %and = and i16 %29, 255, !dbg !539
  %30 = load i16, i16* %p, align 2, !dbg !540, !tbaa !145
  %add13 = add i16 %30, %and, !dbg !540
  store i16 %add13, i16* %p, align 2, !dbg !540, !tbaa !145
  %31 = bitcast i16* %op to i8*, !dbg !541
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #11, !dbg !541
  br label %if.end, !dbg !542

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !543

for.inc:                                          ; preds = %if.end
  %32 = load i16, i16* %i, align 2, !dbg !544, !tbaa !101
  %inc = add nsw i16 %32, 1, !dbg !544
  store i16 %inc, i16* %i, align 2, !dbg !544, !tbaa !101
  br label %for.cond, !dbg !545, !llvm.loop !546

for.end:                                          ; preds = %for.cond
  %33 = load i16, i16* %p, align 2, !dbg !548, !tbaa !145
  %shr14 = lshr i16 %33, 8, !dbg !549
  %34 = load i16, i16* %c, align 2, !dbg !550, !tbaa !145
  %add15 = add i16 %34, %shr14, !dbg !550
  store i16 %add15, i16* %c, align 2, !dbg !550, !tbaa !145
  %35 = load i16, i16* %p, align 2, !dbg !551, !tbaa !145
  %and16 = and i16 %35, 255, !dbg !551
  store i16 %and16, i16* %p, align 2, !dbg !551, !tbaa !145
  %36 = load i16, i16* %p, align 2, !dbg !552, !tbaa !145
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !553, !tbaa !132
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !553
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !553
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !554, !tbaa !132
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !554
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !554
  %39 = load i16, i16* %digit19, align 2, !dbg !554, !tbaa !474
  %arrayidx20 = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %39, !dbg !553
  store i16 %36, i16* %arrayidx20, align 2, !dbg !555, !tbaa !145
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !556, !tbaa !132
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !556
  %digit22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !556
  %41 = load i16, i16* %digit22, align 2, !dbg !557, !tbaa !474
  %inc23 = add i16 %41, 1, !dbg !557
  store i16 %inc23, i16* %digit22, align 2, !dbg !557, !tbaa !474
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !558, !tbaa !132
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !558
  %digit25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !558
  %43 = load i16, i16* %digit25, align 2, !dbg !558, !tbaa !474
  %cmp26 = icmp ult i16 %43, 16, !dbg !560
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !561

if.then27:                                        ; preds = %for.end
  %44 = load i16, i16* %c, align 2, !dbg !562, !tbaa !145
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !564, !tbaa !132
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 1, !dbg !564
  %carry29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 9, !dbg !564
  store i16 %44, i16* %carry29, align 2, !dbg !565, !tbaa !477
  br label %if.end30, !dbg !566

if.end30:                                         ; preds = %if.then27, %for.end
  %46 = bitcast i16* %p to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %46) #11, !dbg !567
  %47 = bitcast i16* %dp to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %47) #11, !dbg !567
  %48 = bitcast i16* %c to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %48) #11, !dbg !567
  %49 = bitcast i16* %b to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %49) #11, !dbg !567
  %50 = bitcast i16* %a to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %50) #11, !dbg !567
  %51 = bitcast i16* %i to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %51) #11, !dbg !567
  ret void, !dbg !567
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_digits() local_unnamed_addr #8 !dbg !568 {
entry:
  %d = alloca i16, align 2
  %0 = bitcast i16* %d to i8*, !dbg !571
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !571
  call void @llvm.dbg.declare(metadata i16* %d, metadata !570, metadata !DIExpression()), !dbg !572
  store i16 16, i16* %d, align 2, !dbg !573, !tbaa !101
  br label %do.body, !dbg !574

do.body:                                          ; preds = %land.end, %entry
  %1 = load i16, i16* %d, align 2, !dbg !575, !tbaa !101
  %dec = add nsw i16 %1, -1, !dbg !575
  store i16 %dec, i16* %d, align 2, !dbg !575, !tbaa !101
  br label %do.cond, !dbg !577

do.cond:                                          ; preds = %do.body
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !578, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !578
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !578
  %3 = load i16, i16* %d, align 2, !dbg !579, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !578
  %4 = load i16, i16* %arrayidx, align 2, !dbg !578, !tbaa !145
  %cmp = icmp eq i16 %4, 0, !dbg !580
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !581

land.rhs:                                         ; preds = %do.cond
  %5 = load i16, i16* %d, align 2, !dbg !582, !tbaa !101
  %cmp1 = icmp sgt i16 %5, 0, !dbg !583
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %6 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ], !dbg !584
  br i1 %6, label %do.body, label %do.end, !dbg !577, !llvm.loop !585

do.end:                                           ; preds = %land.end
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !587, !tbaa !132
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !587
  %product3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !587
  %8 = load i16, i16* %d, align 2, !dbg !589, !tbaa !101
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product3, i16 0, i16 %8, !dbg !587
  %9 = load i16, i16* %arrayidx4, align 2, !dbg !587, !tbaa !145
  %cmp5 = icmp eq i16 %9, 0, !dbg !590
  br i1 %cmp5, label %if.then, label %if.end, !dbg !591

if.then:                                          ; preds = %do.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !592, !tbaa !132
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !592
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !592
  store i16 0, i16* %check, align 2, !dbg !594, !tbaa !266
  br label %if.end, !dbg !595

if.end:                                           ; preds = %if.then, %do.end
  %11 = load i16, i16* %d, align 2, !dbg !596, !tbaa !101
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !597, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !597
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !597
  store i16 %11, i16* %reduce, align 2, !dbg !598, !tbaa !599
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !600, !tbaa !132
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !600
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !600
  store i16 1, i16* %check9, align 2, !dbg !601, !tbaa !266
  %14 = bitcast i16* %d to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #11, !dbg !602
  ret void, !dbg !602
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalizable() local_unnamed_addr #8 !dbg !603 {
entry:
  %i = alloca i16, align 2
  %normalizable = alloca i8, align 1
  %op = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %0 = bitcast i16* %i to i8*, !dbg !612
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !612
  call void @llvm.dbg.declare(metadata i16* %i, metadata !605, metadata !DIExpression()), !dbg !613
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %normalizable) #11, !dbg !614
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !606, metadata !DIExpression()), !dbg !615
  store i8 1, i8* %normalizable, align 1, !dbg !615, !tbaa !616
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !618, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !618
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !618
  %2 = load i16, i16* %reduce, align 2, !dbg !618, !tbaa !599
  %add = add i16 %2, 1, !dbg !619
  %sub = sub i16 %add, 8, !dbg !620
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !621, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !621
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !621
  store i16 %sub, i16* %offset, align 2, !dbg !622, !tbaa !623
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !624, !tbaa !132
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !624
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !624
  %5 = load i16, i16* %reduce3, align 2, !dbg !624, !tbaa !599
  store i16 %5, i16* %i, align 2, !dbg !625, !tbaa !101
  br label %for.cond, !dbg !626

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i16, i16* %i, align 2, !dbg !627, !tbaa !101
  %cmp = icmp sge i16 %6, 0, !dbg !628
  br i1 %cmp, label %for.body, label %for.end, !dbg !629

for.body:                                         ; preds = %for.cond
  %7 = bitcast i16* %op to i8*, !dbg !630
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #11, !dbg !630
  call void @llvm.dbg.declare(metadata i16* %op, metadata !608, metadata !DIExpression()), !dbg !631
  %8 = load i16, i16* %i, align 2, !dbg !632, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !633, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !633
  %offset5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 12, !dbg !633
  %10 = load i16, i16* %offset5, align 2, !dbg !633, !tbaa !623
  %sub6 = sub i16 %8, %10, !dbg !634
  store i16 %sub6, i16* %op, align 2, !dbg !631, !tbaa !101
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !635, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !635
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !635
  %12 = load i16, i16* %i, align 2, !dbg !637, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %12, !dbg !635
  %13 = load i16, i16* %arrayidx, align 2, !dbg !635, !tbaa !145
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !638, !tbaa !132
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !638
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !638
  %15 = load i16, i16* %op, align 2, !dbg !639, !tbaa !101
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !638
  %16 = load i16, i16* %arrayidx9, align 2, !dbg !638, !tbaa !145
  %cmp10 = icmp ugt i16 %13, %16, !dbg !640
  br i1 %cmp10, label %if.then, label %if.else, !dbg !641

if.then:                                          ; preds = %for.body
  store i32 2, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !642

if.else:                                          ; preds = %for.body
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !644, !tbaa !132
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !644
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !644
  %18 = load i16, i16* %i, align 2, !dbg !646, !tbaa !101
  %arrayidx13 = getelementptr inbounds [16 x i16], [16 x i16]* %product12, i16 0, i16 %18, !dbg !644
  %19 = load i16, i16* %arrayidx13, align 2, !dbg !644, !tbaa !145
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !647, !tbaa !132
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !647
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !647
  %21 = load i16, i16* %op, align 2, !dbg !648, !tbaa !101
  %arrayidx16 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus15, i16 0, i16 %21, !dbg !647
  %22 = load i16, i16* %arrayidx16, align 2, !dbg !647, !tbaa !145
  %cmp17 = icmp ult i16 %19, %22, !dbg !649
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !650

if.then18:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !651, !tbaa !616
  store i32 2, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !653

if.end:                                           ; preds = %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !654
  br label %cleanup, !dbg !654

cleanup:                                          ; preds = %if.end19, %if.then18, %if.then
  %23 = bitcast i16* %op to i8*, !dbg !654
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %23) #11, !dbg !654
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 2, label %for.end
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %for.inc, !dbg !655

for.inc:                                          ; preds = %cleanup.cont
  %24 = load i16, i16* %i, align 2, !dbg !656, !tbaa !101
  %dec = add nsw i16 %24, -1, !dbg !656
  store i16 %dec, i16* %i, align 2, !dbg !656, !tbaa !101
  br label %for.cond, !dbg !657, !llvm.loop !658

for.end:                                          ; preds = %cleanup, %for.cond
  %25 = load i8, i8* %normalizable, align 1, !dbg !660, !tbaa !616, !range !662
  %tobool = trunc i8 %25 to i1, !dbg !660
  br i1 %tobool, label %if.end25, label %land.lhs.true, !dbg !663

land.lhs.true:                                    ; preds = %for.end
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !664, !tbaa !132
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !664
  %reduce21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 10, !dbg !664
  %27 = load i16, i16* %reduce21, align 2, !dbg !664, !tbaa !599
  %cmp22 = icmp eq i16 %27, 7, !dbg !665
  br i1 %cmp22, label %if.then23, label %if.end25, !dbg !666

if.then23:                                        ; preds = %land.lhs.true
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !667, !tbaa !132
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !667
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !667
  store i16 0, i16* %check, align 2, !dbg !669, !tbaa !266
  br label %if.end25, !dbg !670

if.end25:                                         ; preds = %if.then23, %land.lhs.true, %for.end
  %29 = load i8, i8* %normalizable, align 1, !dbg !671, !tbaa !616, !range !662
  %tobool26 = trunc i8 %29 to i1, !dbg !671
  br i1 %tobool26, label %if.then27, label %if.else30, !dbg !673

if.then27:                                        ; preds = %if.end25
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !674, !tbaa !132
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !674
  %check29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 17, !dbg !674
  store i16 1, i16* %check29, align 2, !dbg !676, !tbaa !266
  br label %if.end33, !dbg !677

if.else30:                                        ; preds = %if.end25
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !678, !tbaa !132
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !678
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !678
  store i16 2, i16* %check32, align 2, !dbg !680, !tbaa !266
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then27
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %normalizable) #11, !dbg !681
  %32 = bitcast i16* %i to i8*, !dbg !681
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #11, !dbg !681
  ret void, !dbg !681

unreachable:                                      ; preds = %cleanup
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalize() local_unnamed_addr #8 !dbg !682 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %m to i8*, !dbg !694
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !694
  call void @llvm.dbg.declare(metadata i16* %m, metadata !684, metadata !DIExpression()), !dbg !695
  %1 = bitcast i16* %n to i8*, !dbg !694
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !694
  call void @llvm.dbg.declare(metadata i16* %n, metadata !685, metadata !DIExpression()), !dbg !696
  %2 = bitcast i16* %d to i8*, !dbg !694
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !694
  call void @llvm.dbg.declare(metadata i16* %d, metadata !686, metadata !DIExpression()), !dbg !697
  %3 = bitcast i16* %s to i8*, !dbg !694
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !694
  call void @llvm.dbg.declare(metadata i16* %s, metadata !687, metadata !DIExpression()), !dbg !698
  %4 = bitcast i16* %borrow to i8*, !dbg !699
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #11, !dbg !699
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !688, metadata !DIExpression()), !dbg !700
  %5 = bitcast i16* %i to i8*, !dbg !701
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !701
  call void @llvm.dbg.declare(metadata i16* %i, metadata !689, metadata !DIExpression()), !dbg !702
  store i16 0, i16* %borrow, align 2, !dbg !703, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !704, !tbaa !101
  br label %for.cond, !dbg !705

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i16, i16* %i, align 2, !dbg !706, !tbaa !101
  %cmp = icmp slt i16 %6, 8, !dbg !707
  br i1 %cmp, label %for.body, label %for.end, !dbg !708

for.body:                                         ; preds = %for.cond
  %7 = bitcast i16* %op to i8*, !dbg !709
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #11, !dbg !709
  call void @llvm.dbg.declare(metadata i16* %op, metadata !690, metadata !DIExpression()), !dbg !710
  %8 = load i16, i16* %i, align 2, !dbg !711, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !712, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !712
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !712
  %10 = load i16, i16* %offset, align 2, !dbg !712, !tbaa !623
  %add = add i16 %8, %10, !dbg !713
  store i16 %add, i16* %op, align 2, !dbg !710, !tbaa !101
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !714, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !714
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !714
  %12 = load i16, i16* %op, align 2, !dbg !715, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %12, !dbg !714
  %13 = load i16, i16* %arrayidx, align 2, !dbg !714, !tbaa !145
  store i16 %13, i16* %m, align 2, !dbg !716, !tbaa !145
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !717, !tbaa !132
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !717
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !717
  %15 = load i16, i16* %i, align 2, !dbg !718, !tbaa !101
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !717
  %16 = load i16, i16* %arrayidx3, align 2, !dbg !717, !tbaa !145
  store i16 %16, i16* %n, align 2, !dbg !719, !tbaa !145
  %17 = load i16, i16* %n, align 2, !dbg !720, !tbaa !145
  %18 = load i16, i16* %borrow, align 2, !dbg !721, !tbaa !101
  %add4 = add i16 %17, %18, !dbg !722
  store i16 %add4, i16* %s, align 2, !dbg !723, !tbaa !145
  %19 = load i16, i16* %m, align 2, !dbg !724, !tbaa !145
  %20 = load i16, i16* %s, align 2, !dbg !726, !tbaa !145
  %cmp5 = icmp ult i16 %19, %20, !dbg !727
  br i1 %cmp5, label %if.then, label %if.else, !dbg !728

if.then:                                          ; preds = %for.body
  %21 = load i16, i16* %m, align 2, !dbg !729, !tbaa !145
  %add6 = add i16 %21, 256, !dbg !729
  store i16 %add6, i16* %m, align 2, !dbg !729, !tbaa !145
  store i16 1, i16* %borrow, align 2, !dbg !731, !tbaa !101
  br label %if.end, !dbg !732

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !733, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load i16, i16* %m, align 2, !dbg !735, !tbaa !145
  %23 = load i16, i16* %s, align 2, !dbg !736, !tbaa !145
  %sub = sub i16 %22, %23, !dbg !737
  store i16 %sub, i16* %d, align 2, !dbg !738, !tbaa !145
  %24 = load i16, i16* %d, align 2, !dbg !739, !tbaa !145
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !740, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !740
  %product8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !740
  %26 = load i16, i16* %op, align 2, !dbg !741, !tbaa !101
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product8, i16 0, i16 %26, !dbg !740
  store i16 %24, i16* %arrayidx9, align 2, !dbg !742, !tbaa !145
  %27 = bitcast i16* %op to i8*, !dbg !743
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #11, !dbg !743
  br label %for.inc, !dbg !744

for.inc:                                          ; preds = %if.end
  %28 = load i16, i16* %i, align 2, !dbg !745, !tbaa !101
  %inc = add nsw i16 %28, 1, !dbg !745
  store i16 %inc, i16* %i, align 2, !dbg !745, !tbaa !101
  br label %for.cond, !dbg !746, !llvm.loop !747

for.end:                                          ; preds = %for.cond
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !749, !tbaa !132
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !749
  %offset11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !749
  %30 = load i16, i16* %offset11, align 2, !dbg !749, !tbaa !623
  %cmp12 = icmp ugt i16 %30, 0, !dbg !751
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !752

if.then13:                                        ; preds = %for.end
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !753, !tbaa !132
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !753
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 17, !dbg !753
  store i16 2, i16* %check, align 2, !dbg !755, !tbaa !266
  br label %if.end18, !dbg !756

if.else15:                                        ; preds = %for.end
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !757, !tbaa !132
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !757
  %check17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !757
  store i16 0, i16* %check17, align 2, !dbg !759, !tbaa !266
  br label %if.end18

if.end18:                                         ; preds = %if.else15, %if.then13
  %33 = bitcast i16* %i to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #11, !dbg !760
  %34 = bitcast i16* %borrow to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #11, !dbg !760
  %35 = bitcast i16* %s to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #11, !dbg !760
  %36 = bitcast i16* %d to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #11, !dbg !760
  %37 = bitcast i16* %n to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #11, !dbg !760
  %38 = bitcast i16* %m to i8*, !dbg !760
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %38) #11, !dbg !760
  ret void, !dbg !760
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_n_divisor() local_unnamed_addr #8 !dbg !761 {
entry:
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %0 = bitcast i16* %op1 to i8*, !dbg !765
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !765
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !763, metadata !DIExpression()), !dbg !766
  store i16 7, i16* %op1, align 2, !dbg !766, !tbaa !101
  %1 = bitcast i16* %op2 to i8*, !dbg !767
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !767
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !764, metadata !DIExpression()), !dbg !768
  store i16 6, i16* %op2, align 2, !dbg !768, !tbaa !101
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !769, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !769
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !769
  %3 = load i16, i16* %op1, align 2, !dbg !770, !tbaa !101
  %arrayidx = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %3, !dbg !769
  %4 = load i16, i16* %arrayidx, align 2, !dbg !769, !tbaa !145
  %shl = shl i16 %4, 8, !dbg !771
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !772, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !772
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !772
  %6 = load i16, i16* %op2, align 2, !dbg !773, !tbaa !101
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus2, i16 0, i16 %6, !dbg !772
  %7 = load i16, i16* %arrayidx3, align 2, !dbg !772, !tbaa !145
  %add = add i16 %shl, %7, !dbg !774
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !775, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !775
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !775
  store i16 %add, i16* %n_div, align 2, !dbg !776, !tbaa !777
  %9 = bitcast i16* %op2 to i8*, !dbg !778
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %9) #11, !dbg !778
  %10 = bitcast i16* %op1 to i8*, !dbg !778
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #11, !dbg !778
  ret void, !dbg !778
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_quotient() local_unnamed_addr #8 !dbg !779 {
entry:
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %op3 = alloca i16, align 2
  %0 = bitcast i32* %qn to i8*, !dbg !786
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #11, !dbg !786
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !781, metadata !DIExpression()), !dbg !787
  %1 = bitcast i32* %n_q to i8*, !dbg !786
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #11, !dbg !786
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !782, metadata !DIExpression()), !dbg !788
  %2 = bitcast i16* %op1 to i8*, !dbg !789
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !789
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !783, metadata !DIExpression()), !dbg !790
  store i16 7, i16* %op1, align 2, !dbg !790, !tbaa !101
  %3 = bitcast i16* %op2 to i8*, !dbg !791
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !791
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !784, metadata !DIExpression()), !dbg !792
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !793, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !793
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !793
  %5 = load i16, i16* %reduce, align 2, !dbg !793, !tbaa !599
  %sub = sub i16 %5, 1, !dbg !794
  store i16 %sub, i16* %op2, align 2, !dbg !792, !tbaa !101
  %6 = bitcast i16* %op3 to i8*, !dbg !795
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %6) #11, !dbg !795
  call void @llvm.dbg.declare(metadata i16* %op3, metadata !785, metadata !DIExpression()), !dbg !796
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !797, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !797
  %reduce2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !797
  %8 = load i16, i16* %reduce2, align 2, !dbg !797, !tbaa !599
  %sub3 = sub i16 %8, 2, !dbg !798
  store i16 %sub3, i16* %op3, align 2, !dbg !796, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !799, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !799
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !799
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !801, !tbaa !132
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !801
  %reduce6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !801
  %11 = load i16, i16* %reduce6, align 2, !dbg !801, !tbaa !599
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %11, !dbg !799
  %12 = load i16, i16* %arrayidx, align 2, !dbg !799, !tbaa !145
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !802, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !802
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !802
  %14 = load i16, i16* %op1, align 2, !dbg !803, !tbaa !101
  %arrayidx8 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %14, !dbg !802
  %15 = load i16, i16* %arrayidx8, align 2, !dbg !802, !tbaa !145
  %cmp = icmp eq i16 %12, %15, !dbg !804
  br i1 %cmp, label %if.then, label %if.else, !dbg !805

if.then:                                          ; preds = %entry
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !806, !tbaa !132
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !806
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !806
  store i16 255, i16* %quotient, align 2, !dbg !808, !tbaa !809
  br label %if.end, !dbg !810

if.else:                                          ; preds = %entry
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !811, !tbaa !132
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !811
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !811
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !813, !tbaa !132
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !813
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !813
  %19 = load i16, i16* %reduce13, align 2, !dbg !813, !tbaa !599
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %19, !dbg !811
  %20 = load i16, i16* %arrayidx14, align 2, !dbg !811, !tbaa !145
  %shl = shl i16 %20, 8, !dbg !814
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !815, !tbaa !132
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !815
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !815
  %22 = load i16, i16* %op2, align 2, !dbg !816, !tbaa !101
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %22, !dbg !815
  %23 = load i16, i16* %arrayidx17, align 2, !dbg !815, !tbaa !145
  %add = add i16 %shl, %23, !dbg !817
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !818, !tbaa !132
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !818
  %modulus19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 7, !dbg !818
  %25 = load i16, i16* %op1, align 2, !dbg !819, !tbaa !101
  %arrayidx20 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus19, i16 0, i16 %25, !dbg !818
  %26 = load i16, i16* %arrayidx20, align 2, !dbg !818, !tbaa !145
  %div = udiv i16 %add, %26, !dbg !820
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !821, !tbaa !132
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !821
  %quotient22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 16, !dbg !821
  store i16 %div, i16* %quotient22, align 2, !dbg !822, !tbaa !809
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !823, !tbaa !132
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !823
  %product24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 0, !dbg !823
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !824, !tbaa !132
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !824
  %reduce26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 10, !dbg !824
  %30 = load i16, i16* %reduce26, align 2, !dbg !824, !tbaa !599
  %arrayidx27 = getelementptr inbounds [16 x i16], [16 x i16]* %product24, i16 0, i16 %30, !dbg !823
  %31 = load i16, i16* %arrayidx27, align 2, !dbg !823, !tbaa !145
  %conv = zext i16 %31 to i32, !dbg !825
  %shl28 = shl i32 %conv, 16, !dbg !826
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !827, !tbaa !132
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !827
  %product30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !827
  %33 = load i16, i16* %op2, align 2, !dbg !828, !tbaa !101
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %product30, i16 0, i16 %33, !dbg !827
  %34 = load i16, i16* %arrayidx31, align 2, !dbg !827, !tbaa !145
  %shl32 = shl i16 %34, 8, !dbg !829
  %conv33 = zext i16 %shl32 to i32, !dbg !830
  %add34 = add i32 %shl28, %conv33, !dbg !831
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !832, !tbaa !132
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !832
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !832
  %36 = load i16, i16* %op3, align 2, !dbg !833, !tbaa !101
  %arrayidx37 = getelementptr inbounds [16 x i16], [16 x i16]* %product36, i16 0, i16 %36, !dbg !832
  %37 = load i16, i16* %arrayidx37, align 2, !dbg !832, !tbaa !145
  %conv38 = zext i16 %37 to i32, !dbg !832
  %add39 = add i32 %add34, %conv38, !dbg !834
  store i32 %add39, i32* %n_q, align 2, !dbg !835, !tbaa !836
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !838, !tbaa !132
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !838
  %quotient41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 16, !dbg !838
  %39 = load i16, i16* %quotient41, align 2, !dbg !839, !tbaa !809
  %inc = add i16 %39, 1, !dbg !839
  store i16 %inc, i16* %quotient41, align 2, !dbg !839, !tbaa !809
  br label %do.body, !dbg !840

do.body:                                          ; preds = %do.cond, %if.end
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !841, !tbaa !132
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !841
  %quotient43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 16, !dbg !841
  %41 = load i16, i16* %quotient43, align 2, !dbg !843, !tbaa !809
  %dec = add i16 %41, -1, !dbg !843
  store i16 %dec, i16* %quotient43, align 2, !dbg !843, !tbaa !809
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !844, !tbaa !132
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !844
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 13, !dbg !844
  %43 = load i16, i16* %n_div, align 2, !dbg !844, !tbaa !777
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !845, !tbaa !132
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !845
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !845
  %45 = load i16, i16* %quotient46, align 2, !dbg !845, !tbaa !809
  %mul = mul i16 %43, %45, !dbg !846
  %conv47 = zext i16 %mul to i32, !dbg !844
  store i32 %conv47, i32* %qn, align 2, !dbg !847, !tbaa !836
  br label %do.cond, !dbg !848

do.cond:                                          ; preds = %do.body
  %46 = load i32, i32* %qn, align 2, !dbg !849, !tbaa !836
  %47 = load i32, i32* %n_q, align 2, !dbg !850, !tbaa !836
  %cmp48 = icmp ugt i32 %46, %47, !dbg !851
  br i1 %cmp48, label %do.body, label %do.end, !dbg !848, !llvm.loop !852

do.end:                                           ; preds = %do.cond
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !854, !tbaa !132
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !854
  %reduce51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 10, !dbg !854
  %49 = load i16, i16* %reduce51, align 2, !dbg !855, !tbaa !599
  %dec52 = add i16 %49, -1, !dbg !855
  store i16 %dec52, i16* %reduce51, align 2, !dbg !855, !tbaa !599
  %50 = bitcast i16* %op3 to i8*, !dbg !856
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %50) #11, !dbg !856
  %51 = bitcast i16* %op2 to i8*, !dbg !856
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %51) #11, !dbg !856
  %52 = bitcast i16* %op1 to i8*, !dbg !856
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %52) #11, !dbg !856
  %53 = bitcast i32* %n_q to i8*, !dbg !856
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #11, !dbg !856
  %54 = bitcast i32* %qn to i8*, !dbg !856
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #11, !dbg !856
  ret void, !dbg !856
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_multiply() local_unnamed_addr #8 !dbg !857 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !870
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !870
  call void @llvm.dbg.declare(metadata i16* %i, metadata !859, metadata !DIExpression()), !dbg !871
  %1 = bitcast i16* %m to i8*, !dbg !872
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !872
  call void @llvm.dbg.declare(metadata i16* %m, metadata !860, metadata !DIExpression()), !dbg !873
  %2 = bitcast i16* %n to i8*, !dbg !872
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !872
  call void @llvm.dbg.declare(metadata i16* %n, metadata !861, metadata !DIExpression()), !dbg !874
  %3 = bitcast i16* %c to i8*, !dbg !875
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !875
  call void @llvm.dbg.declare(metadata i16* %c, metadata !862, metadata !DIExpression()), !dbg !876
  %4 = bitcast i16* %offset to i8*, !dbg !875
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #11, !dbg !875
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !863, metadata !DIExpression()), !dbg !877
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !878, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !878
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !878
  %6 = load i16, i16* %reduce, align 2, !dbg !878, !tbaa !599
  %add = add i16 %6, 1, !dbg !879
  %sub = sub i16 %add, 8, !dbg !880
  store i16 %sub, i16* %offset, align 2, !dbg !881, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !882, !tbaa !101
  br label %for.cond, !dbg !884

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i16, i16* %i, align 2, !dbg !885, !tbaa !101
  %8 = load i16, i16* %offset, align 2, !dbg !887, !tbaa !101
  %cmp = icmp ult i16 %7, %8, !dbg !888
  br i1 %cmp, label %for.body, label %for.end, !dbg !889

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !890, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !890
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !890
  %10 = load i16, i16* %i, align 2, !dbg !892, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %10, !dbg !890
  store i16 0, i16* %arrayidx, align 2, !dbg !893, !tbaa !145
  br label %for.inc, !dbg !894

for.inc:                                          ; preds = %for.body
  %11 = load i16, i16* %i, align 2, !dbg !895, !tbaa !101
  %inc = add nsw i16 %11, 1, !dbg !895
  store i16 %inc, i16* %i, align 2, !dbg !895, !tbaa !101
  br label %for.cond, !dbg !896, !llvm.loop !897

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !899, !tbaa !101
  %12 = load i16, i16* %offset, align 2, !dbg !900, !tbaa !101
  store i16 %12, i16* %i, align 2, !dbg !901, !tbaa !101
  br label %for.cond2, !dbg !902

for.cond2:                                        ; preds = %for.inc15, %for.end
  %13 = load i16, i16* %i, align 2, !dbg !903, !tbaa !101
  %cmp3 = icmp slt i16 %13, 16, !dbg !904
  br i1 %cmp3, label %for.body4, label %for.end17, !dbg !905

for.body4:                                        ; preds = %for.cond2
  %14 = load i16, i16* %c, align 2, !dbg !906, !tbaa !101
  store i16 %14, i16* %m, align 2, !dbg !907, !tbaa !145
  %15 = load i16, i16* %i, align 2, !dbg !908, !tbaa !101
  %16 = load i16, i16* %offset, align 2, !dbg !909, !tbaa !101
  %add5 = add i16 %16, 8, !dbg !910
  %cmp6 = icmp ult i16 %15, %add5, !dbg !911
  br i1 %cmp6, label %if.then, label %if.else, !dbg !912

if.then:                                          ; preds = %for.body4
  %17 = bitcast i16* %op to i8*, !dbg !913
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %17) #11, !dbg !913
  call void @llvm.dbg.declare(metadata i16* %op, metadata !864, metadata !DIExpression()), !dbg !914
  %18 = load i16, i16* %i, align 2, !dbg !915, !tbaa !101
  %19 = load i16, i16* %offset, align 2, !dbg !916, !tbaa !101
  %sub7 = sub i16 %18, %19, !dbg !917
  store i16 %sub7, i16* %op, align 2, !dbg !914, !tbaa !101
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !918, !tbaa !132
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !918
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !918
  %21 = load i16, i16* %op, align 2, !dbg !919, !tbaa !101
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %21, !dbg !918
  %22 = load i16, i16* %arrayidx9, align 2, !dbg !918, !tbaa !145
  store i16 %22, i16* %n, align 2, !dbg !920, !tbaa !145
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !921, !tbaa !132
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !921
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !921
  %24 = load i16, i16* %quotient, align 2, !dbg !921, !tbaa !809
  %25 = load i16, i16* %n, align 2, !dbg !922, !tbaa !145
  %mul = mul i16 %24, %25, !dbg !923
  %26 = load i16, i16* %m, align 2, !dbg !924, !tbaa !145
  %add11 = add i16 %26, %mul, !dbg !924
  store i16 %add11, i16* %m, align 2, !dbg !924, !tbaa !145
  %27 = bitcast i16* %op to i8*, !dbg !925
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #11, !dbg !925
  br label %if.end, !dbg !926

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !927, !tbaa !145
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %28 = load i16, i16* %m, align 2, !dbg !929, !tbaa !145
  %shr = lshr i16 %28, 8, !dbg !930
  store i16 %shr, i16* %c, align 2, !dbg !931, !tbaa !101
  %29 = load i16, i16* %m, align 2, !dbg !932, !tbaa !145
  %and = and i16 %29, 255, !dbg !932
  store i16 %and, i16* %m, align 2, !dbg !932, !tbaa !145
  %30 = load i16, i16* %m, align 2, !dbg !933, !tbaa !145
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !934, !tbaa !132
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !934
  %product213 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 14, !dbg !934
  %32 = load i16, i16* %i, align 2, !dbg !935, !tbaa !101
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product213, i16 0, i16 %32, !dbg !934
  store i16 %30, i16* %arrayidx14, align 2, !dbg !936, !tbaa !145
  br label %for.inc15, !dbg !937

for.inc15:                                        ; preds = %if.end
  %33 = load i16, i16* %i, align 2, !dbg !938, !tbaa !101
  %inc16 = add nsw i16 %33, 1, !dbg !938
  store i16 %inc16, i16* %i, align 2, !dbg !938, !tbaa !101
  br label %for.cond2, !dbg !939, !llvm.loop !940

for.end17:                                        ; preds = %for.cond2
  %34 = bitcast i16* %offset to i8*, !dbg !942
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #11, !dbg !942
  %35 = bitcast i16* %c to i8*, !dbg !942
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #11, !dbg !942
  %36 = bitcast i16* %n to i8*, !dbg !942
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #11, !dbg !942
  %37 = bitcast i16* %m to i8*, !dbg !942
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #11, !dbg !942
  %38 = bitcast i16* %i to i8*, !dbg !942
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %38) #11, !dbg !942
  ret void, !dbg !942
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_compare() local_unnamed_addr #8 !dbg !943 {
entry:
  %i = alloca i16, align 2
  %relation = alloca i8, align 1
  %0 = bitcast i16* %i to i8*, !dbg !948
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !948
  call void @llvm.dbg.declare(metadata i16* %i, metadata !945, metadata !DIExpression()), !dbg !949
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %relation) #11, !dbg !950
  call void @llvm.dbg.declare(metadata i8* %relation, metadata !946, metadata !DIExpression()), !dbg !951
  store i8 61, i8* %relation, align 1, !dbg !951, !tbaa !106
  store i16 15, i16* %i, align 2, !dbg !952, !tbaa !101
  br label %for.cond, !dbg !954

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !955, !tbaa !101
  %cmp = icmp sge i16 %1, 0, !dbg !957
  br i1 %cmp, label %for.body, label %for.end.loopexit, !dbg !958

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !959, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !959
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !959
  %3 = load i16, i16* %i, align 2, !dbg !962, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !959
  %4 = load i16, i16* %arrayidx, align 2, !dbg !959, !tbaa !145
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !963, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !963
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !963
  %6 = load i16, i16* %i, align 2, !dbg !964, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %6, !dbg !963
  %7 = load i16, i16* %arrayidx2, align 2, !dbg !963, !tbaa !145
  %cmp3 = icmp ugt i16 %4, %7, !dbg !965
  br i1 %cmp3, label %if.then, label %if.else, !dbg !966

if.then:                                          ; preds = %for.body
  store i8 62, i8* %relation, align 1, !dbg !967, !tbaa !106
  br label %for.end, !dbg !969

if.else:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !970, !tbaa !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !970
  %product5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !970
  %9 = load i16, i16* %i, align 2, !dbg !972, !tbaa !101
  %arrayidx6 = getelementptr inbounds [16 x i16], [16 x i16]* %product5, i16 0, i16 %9, !dbg !970
  %10 = load i16, i16* %arrayidx6, align 2, !dbg !970, !tbaa !145
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !973, !tbaa !132
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !973
  %product28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !973
  %12 = load i16, i16* %i, align 2, !dbg !974, !tbaa !101
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product28, i16 0, i16 %12, !dbg !973
  %13 = load i16, i16* %arrayidx9, align 2, !dbg !973, !tbaa !145
  %cmp10 = icmp ult i16 %10, %13, !dbg !975
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !976

if.then11:                                        ; preds = %if.else
  store i8 60, i8* %relation, align 1, !dbg !977, !tbaa !106
  br label %for.end, !dbg !979

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc, !dbg !980

for.inc:                                          ; preds = %if.end12
  %14 = load i16, i16* %i, align 2, !dbg !981, !tbaa !101
  %dec = add nsw i16 %14, -1, !dbg !981
  store i16 %dec, i16* %i, align 2, !dbg !981, !tbaa !101
  br label %for.cond, !dbg !982, !llvm.loop !983

for.end.loopexit:                                 ; preds = %for.cond
  br label %for.end, !dbg !985

for.end:                                          ; preds = %for.end.loopexit, %if.then11, %if.then
  %15 = load i8, i8* %relation, align 1, !dbg !985, !tbaa !106
  %conv = sext i8 %15 to i16, !dbg !985
  %cmp13 = icmp eq i16 %conv, 60, !dbg !987
  br i1 %cmp13, label %if.then15, label %if.end17, !dbg !988

if.then15:                                        ; preds = %for.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !989, !tbaa !132
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !989
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !989
  store i16 0, i16* %check, align 2, !dbg !991, !tbaa !266
  br label %if.end17, !dbg !992

if.end17:                                         ; preds = %if.then15, %for.end
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %relation) #11, !dbg !993
  %17 = bitcast i16* %i to i8*, !dbg !993
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %17) #11, !dbg !993
  ret void, !dbg !993
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_add() local_unnamed_addr #8 !dbg !994 {
entry:
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !1002
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !1002
  call void @llvm.dbg.declare(metadata i16* %i, metadata !996, metadata !DIExpression()), !dbg !1003
  %1 = bitcast i16* %j to i8*, !dbg !1002
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !1002
  call void @llvm.dbg.declare(metadata i16* %j, metadata !997, metadata !DIExpression()), !dbg !1004
  %2 = bitcast i16* %m to i8*, !dbg !1005
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !1005
  call void @llvm.dbg.declare(metadata i16* %m, metadata !998, metadata !DIExpression()), !dbg !1006
  %3 = bitcast i16* %n to i8*, !dbg !1005
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !1005
  call void @llvm.dbg.declare(metadata i16* %n, metadata !999, metadata !DIExpression()), !dbg !1007
  %4 = bitcast i16* %c to i8*, !dbg !1005
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #11, !dbg !1005
  call void @llvm.dbg.declare(metadata i16* %c, metadata !1000, metadata !DIExpression()), !dbg !1008
  %5 = bitcast i16* %offset to i8*, !dbg !1009
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !1009
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !1001, metadata !DIExpression()), !dbg !1010
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1011, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1011
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !1011
  %7 = load i16, i16* %reduce, align 2, !dbg !1011, !tbaa !599
  %add = add i16 %7, 1, !dbg !1012
  %sub = sub i16 %add, 8, !dbg !1013
  store i16 %sub, i16* %offset, align 2, !dbg !1014, !tbaa !101
  store i16 0, i16* %c, align 2, !dbg !1015, !tbaa !145
  %8 = load i16, i16* %offset, align 2, !dbg !1016, !tbaa !101
  store i16 %8, i16* %i, align 2, !dbg !1018, !tbaa !101
  br label %for.cond, !dbg !1019

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i16, i16* %i, align 2, !dbg !1020, !tbaa !101
  %cmp = icmp slt i16 %9, 16, !dbg !1022
  br i1 %cmp, label %for.body, label %for.end, !dbg !1023

for.body:                                         ; preds = %for.cond
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1024, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !1024
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !1024
  %11 = load i16, i16* %i, align 2, !dbg !1026, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %11, !dbg !1024
  %12 = load i16, i16* %arrayidx, align 2, !dbg !1024, !tbaa !145
  store i16 %12, i16* %m, align 2, !dbg !1027, !tbaa !145
  %13 = load i16, i16* %i, align 2, !dbg !1028, !tbaa !101
  %14 = load i16, i16* %offset, align 2, !dbg !1029, !tbaa !101
  %sub2 = sub i16 %13, %14, !dbg !1030
  store i16 %sub2, i16* %j, align 2, !dbg !1031, !tbaa !101
  %15 = load i16, i16* %i, align 2, !dbg !1032, !tbaa !101
  %16 = load i16, i16* %offset, align 2, !dbg !1034, !tbaa !101
  %add3 = add i16 %16, 8, !dbg !1035
  %cmp4 = icmp ult i16 %15, %add3, !dbg !1036
  br i1 %cmp4, label %if.then, label %if.else, !dbg !1037

if.then:                                          ; preds = %for.body
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1038, !tbaa !132
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !1038
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !1038
  %18 = load i16, i16* %j, align 2, !dbg !1040, !tbaa !101
  %arrayidx6 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %18, !dbg !1038
  %19 = load i16, i16* %arrayidx6, align 2, !dbg !1038, !tbaa !145
  store i16 %19, i16* %n, align 2, !dbg !1041, !tbaa !145
  br label %if.end, !dbg !1042

if.else:                                          ; preds = %for.body
  store i16 0, i16* %n, align 2, !dbg !1043, !tbaa !145
  store i16 0, i16* %j, align 2, !dbg !1045, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %20 = load i16, i16* %c, align 2, !dbg !1046, !tbaa !145
  %21 = load i16, i16* %m, align 2, !dbg !1047, !tbaa !145
  %add7 = add i16 %20, %21, !dbg !1048
  %22 = load i16, i16* %n, align 2, !dbg !1049, !tbaa !145
  %add8 = add i16 %add7, %22, !dbg !1050
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1051, !tbaa !132
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !1051
  %product10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !1051
  %24 = load i16, i16* %i, align 2, !dbg !1052, !tbaa !101
  %arrayidx11 = getelementptr inbounds [16 x i16], [16 x i16]* %product10, i16 0, i16 %24, !dbg !1051
  store i16 %add8, i16* %arrayidx11, align 2, !dbg !1053, !tbaa !145
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1054, !tbaa !132
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !1054
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !1054
  %26 = load i16, i16* %i, align 2, !dbg !1055, !tbaa !101
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product13, i16 0, i16 %26, !dbg !1054
  %27 = load i16, i16* %arrayidx14, align 2, !dbg !1054, !tbaa !145
  %shr = lshr i16 %27, 8, !dbg !1056
  store i16 %shr, i16* %c, align 2, !dbg !1057, !tbaa !145
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1058, !tbaa !132
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !1058
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !1058
  %29 = load i16, i16* %i, align 2, !dbg !1059, !tbaa !101
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %29, !dbg !1058
  %30 = load i16, i16* %arrayidx17, align 2, !dbg !1060, !tbaa !145
  %and = and i16 %30, 255, !dbg !1060
  store i16 %and, i16* %arrayidx17, align 2, !dbg !1060, !tbaa !145
  br label %for.inc, !dbg !1061

for.inc:                                          ; preds = %if.end
  %31 = load i16, i16* %i, align 2, !dbg !1062, !tbaa !101
  %inc = add nsw i16 %31, 1, !dbg !1062
  store i16 %inc, i16* %i, align 2, !dbg !1062, !tbaa !101
  br label %for.cond, !dbg !1063, !llvm.loop !1064

for.end:                                          ; preds = %for.cond
  %32 = bitcast i16* %offset to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #11, !dbg !1066
  %33 = bitcast i16* %c to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #11, !dbg !1066
  %34 = bitcast i16* %n to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #11, !dbg !1066
  %35 = bitcast i16* %m to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #11, !dbg !1066
  %36 = bitcast i16* %j to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #11, !dbg !1066
  %37 = bitcast i16* %i to i8*, !dbg !1066
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #11, !dbg !1066
  ret void, !dbg !1066
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_subtract() local_unnamed_addr #8 !dbg !1067 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !1075
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #11, !dbg !1075
  call void @llvm.dbg.declare(metadata i16* %i, metadata !1069, metadata !DIExpression()), !dbg !1076
  %1 = bitcast i16* %m to i8*, !dbg !1077
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #11, !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %m, metadata !1070, metadata !DIExpression()), !dbg !1078
  %2 = bitcast i16* %s to i8*, !dbg !1077
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #11, !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %s, metadata !1071, metadata !DIExpression()), !dbg !1079
  %3 = bitcast i16* %qn to i8*, !dbg !1077
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #11, !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !1072, metadata !DIExpression()), !dbg !1080
  %4 = bitcast i16* %borrow to i8*, !dbg !1081
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #11, !dbg !1081
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !1073, metadata !DIExpression()), !dbg !1082
  %5 = bitcast i16* %offset to i8*, !dbg !1081
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #11, !dbg !1081
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !1074, metadata !DIExpression()), !dbg !1083
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1084, !tbaa !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1084
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !1084
  %7 = load i16, i16* %reduce, align 2, !dbg !1084, !tbaa !599
  %add = add i16 %7, 1, !dbg !1085
  %sub = sub i16 %add, 8, !dbg !1086
  store i16 %sub, i16* %offset, align 2, !dbg !1087, !tbaa !101
  store i16 0, i16* %borrow, align 2, !dbg !1088, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !1089, !tbaa !101
  br label %for.cond, !dbg !1091

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i16, i16* %i, align 2, !dbg !1092, !tbaa !101
  %cmp = icmp slt i16 %8, 16, !dbg !1094
  br i1 %cmp, label %for.body, label %for.end, !dbg !1095

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1096, !tbaa !132
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !1096
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !1096
  %10 = load i16, i16* %i, align 2, !dbg !1098, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %10, !dbg !1096
  %11 = load i16, i16* %arrayidx, align 2, !dbg !1096, !tbaa !145
  store i16 %11, i16* %m, align 2, !dbg !1099, !tbaa !145
  %12 = load i16, i16* %i, align 2, !dbg !1100, !tbaa !101
  %13 = load i16, i16* %offset, align 2, !dbg !1102, !tbaa !101
  %cmp2 = icmp uge i16 %12, %13, !dbg !1103
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !1104

if.then:                                          ; preds = %for.body
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1105, !tbaa !132
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !1105
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !1105
  %15 = load i16, i16* %i, align 2, !dbg !1107, !tbaa !101
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %15, !dbg !1105
  %16 = load i16, i16* %arrayidx4, align 2, !dbg !1105, !tbaa !145
  store i16 %16, i16* %qn, align 2, !dbg !1108, !tbaa !145
  %17 = load i16, i16* %qn, align 2, !dbg !1109, !tbaa !145
  %18 = load i16, i16* %borrow, align 2, !dbg !1110, !tbaa !101
  %add5 = add i16 %17, %18, !dbg !1111
  store i16 %add5, i16* %s, align 2, !dbg !1112, !tbaa !145
  %19 = load i16, i16* %m, align 2, !dbg !1113, !tbaa !145
  %20 = load i16, i16* %s, align 2, !dbg !1115, !tbaa !145
  %cmp6 = icmp ult i16 %19, %20, !dbg !1116
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !1117

if.then7:                                         ; preds = %if.then
  %21 = load i16, i16* %m, align 2, !dbg !1118, !tbaa !145
  %add8 = add i16 %21, 256, !dbg !1118
  store i16 %add8, i16* %m, align 2, !dbg !1118, !tbaa !145
  store i16 1, i16* %borrow, align 2, !dbg !1120, !tbaa !101
  br label %if.end, !dbg !1121

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !1122, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %22 = load i16, i16* %m, align 2, !dbg !1124, !tbaa !145
  %23 = load i16, i16* %s, align 2, !dbg !1125, !tbaa !145
  %sub9 = sub i16 %22, %23, !dbg !1126
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1127, !tbaa !132
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !1127
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !1127
  %25 = load i16, i16* %i, align 2, !dbg !1128, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %25, !dbg !1127
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !1129, !tbaa !145
  br label %if.end13, !dbg !1130

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !1131

for.inc:                                          ; preds = %if.end13
  %26 = load i16, i16* %i, align 2, !dbg !1132, !tbaa !101
  %inc = add nsw i16 %26, 1, !dbg !1132
  store i16 %inc, i16* %i, align 2, !dbg !1132, !tbaa !101
  br label %for.cond, !dbg !1133, !llvm.loop !1134

for.end:                                          ; preds = %for.cond
  %27 = bitcast i16* %offset to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #11, !dbg !1136
  %28 = bitcast i16* %borrow to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #11, !dbg !1136
  %29 = bitcast i16* %qn to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #11, !dbg !1136
  %30 = bitcast i16* %s to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #11, !dbg !1136
  %31 = bitcast i16* %m to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #11, !dbg !1136
  %32 = bitcast i16* %i to i8*, !dbg !1136
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #11, !dbg !1136
  ret void, !dbg !1136
}

; Function Attrs: norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #9 !dbg !1137 {
entry:
  ret void, !dbg !1138
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #10 !dbg !1139 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !1142, !tbaa !124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1143, !tbaa !132
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1144, !tbaa !132
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !1145, !tbaa !101
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !1147, !tbaa !106
  %1 = or i8 %0, 1, !dbg !1147
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !1147, !tbaa !106
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !1148, !tbaa !106
  %3 = and i8 %2, -2, !dbg !1148
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !1148, !tbaa !106
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !1149, !tbaa !101
  %and4.i = and i16 %4, -2, !dbg !1149
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !1149, !tbaa !101
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !1150, !tbaa !106
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !1151, !tbaa !101
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !1152, !tbaa !101
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !1153, !tbaa !101
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !1154, !tbaa !106
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !1155, !tbaa !101
  br label %while.body, !dbg !1156

while.body:                                       ; preds = %do.end, %entry
  tail call void @task_init(), !dbg !1157
  tail call void @commit(), !dbg !1157
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i16 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals1 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1
  %BCast3 = bitcast %struct.camel_global_t* %globals2 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(202) %BCast, i8* nonnull align 2 dereferenceable(202) %BCast3, i16 202, i1 false), !dbg !1157
  br label %while.body2, !dbg !1159

while.body2:                                      ; preds = %while.body2.backedge, %while.body
  %5 = phi %struct.camel_buffer_t* [ %safe, %while.body ], [ %.be, %while.body2.backedge ], !dbg !1160
  %check = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i16 0, i32 1, i32 17, !dbg !1160
  %6 = load i16, i16* %check, align 2, !dbg !1160, !tbaa !266
  %cmp = icmp eq i16 %6, 0, !dbg !1163
  br i1 %cmp, label %if.then, label %if.end, !dbg !1164

if.then:                                          ; preds = %while.body2
  tail call void @task_pad(), !dbg !1165
  tail call void @commit(), !dbg !1165
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 6, i16 0
  %cast = bitcast i16* %array to i8*
  %tmp5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp5, i16 0, i32 1, i32 6, i16 0
  %cast9 = bitcast i16* %array8 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast, i8* nonnull align 2 dereferenceable(32) %cast9, i16 32, i1 false), !dbg !1165
  %tmp13 = load i16, i16* @zero, align 2
  %access = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp5, i16 0, i32 1, i32 15, i16 %tmp13
  %tmp14 = load i16, i16* %access, align 2
  %access19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 15, i16 %tmp13
  store i16 %tmp14, i16* %access19, align 2
  %tmp20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i16 0, i32 1, i32 15, i16 0
  %cast24 = bitcast i16* %array23 to i8*
  %tmp25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp25, i16 0, i32 1, i32 15, i16 0
  %cast29 = bitcast i16* %array28 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast24, i8* nonnull align 2 dereferenceable(32) %cast29, i16 32, i1 false), !dbg !1165
  %global32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp25, i16 0, i32 1, i32 1
  %tmp33 = load i16, i16* %global32, align 2
  %global36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i16 0, i32 1, i32 1
  store i16 %tmp33, i16* %global36, align 2
  %global39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp25, i16 0, i32 1, i32 3
  %tmp40 = load i16, i16* %global39, align 2
  %global43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i16 0, i32 1, i32 3
  store i16 %tmp40, i16* %global43, align 2
  %global46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp25, i16 0, i32 1, i32 17
  %tmp47 = load i16, i16* %global46, align 2
  %global50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i16 0, i32 1, i32 17
  store i16 %tmp47, i16* %global50, align 2
  %.pre = load i16, i16* %global46, align 2, !dbg !1167, !tbaa !266
  br label %if.end, !dbg !1169

if.end:                                           ; preds = %if.then, %while.body2
  %7 = phi i16 [ %.pre, %if.then ], [ %6, %while.body2 ], !dbg !1167
  %cmp5 = icmp eq i16 %7, 2, !dbg !1170
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !1171

if.then6:                                         ; preds = %if.end
  tail call void @task_exp(), !dbg !1172
  tail call void @commit(), !dbg !1172
  %tmp51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i16 0, i32 1, i32 1
  %tmp54 = load i16, i16* %global53, align 2
  %tmp55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp55, i16 0, i32 1, i32 1
  store i16 %tmp54, i16* %global57, align 2
  %global60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i16 0, i32 1, i32 17
  %tmp61 = load i16, i16* %global60, align 2
  %global64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp55, i16 0, i32 1, i32 17
  store i16 %tmp61, i16* %global64, align 2
  %.pre2 = load i16, i16* %global60, align 2, !dbg !1174, !tbaa !266
  br label %if.end7, !dbg !1176

if.end7:                                          ; preds = %if.then6, %if.end
  %8 = phi i16 [ %.pre2, %if.then6 ], [ %7, %if.end ], !dbg !1174
  switch i16 %8, label %if.end17 [
    i16 0, label %if.then11
    i16 1, label %if.then15
  ], !dbg !1177

if.then11:                                        ; preds = %if.end7
  tail call void @task_mult_block(), !dbg !1178
  br label %if.end17.sink.split, !dbg !1180

if.then15:                                        ; preds = %if.end7
  tail call void @task_square_base(), !dbg !1181
  br label %if.end17.sink.split, !dbg !1184

if.end17.sink.split:                              ; preds = %if.then11, %if.then15
  tail call void @commit(), !dbg !1185
  %tmp72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp72, i16 0, i32 1, i32 18
  %tmp75 = load i16, i16* %global74, align 2
  %tmp76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp76, i16 0, i32 1, i32 18
  store i16 %tmp75, i16* %global78, align 2
  br label %if.end17, !dbg !1186

if.end17:                                         ; preds = %if.end17.sink.split, %if.end7
  tail call void @task_mult_mod(), !dbg !1186
  tail call void @commit(), !dbg !1186
  %tmp79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp79, i16 0, i32 1, i32 8
  %tmp82 = load i16, i16* %global81, align 2
  %tmp83 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp83, i16 0, i32 1, i32 8
  store i16 %tmp82, i16* %global85, align 2
  %global88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp79, i16 0, i32 1, i32 9
  %tmp89 = load i16, i16* %global88, align 2
  %global92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp83, i16 0, i32 1, i32 9
  store i16 %tmp89, i16* %global92, align 2
  br label %do.body, !dbg !1187

do.body:                                          ; preds = %do.body, %if.end17
  tail call void @task_mult(), !dbg !1188
  tail call void @commit(), !dbg !1188
  %tmp93 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %tmp96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp96, i16 0, i32 1, i32 8
  %load = load i16, i16* %global98, align 2
  %access99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp93, i16 0, i32 1, i32 0, i16 %load
  %tmp100 = load i16, i16* %access99, align 2
  %access108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp96, i16 0, i32 1, i32 0, i16 %load
  store i16 %tmp100, i16* %access108, align 2
  %tmp109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i16 0, i32 1, i32 8
  %tmp112 = load i16, i16* %global111, align 2
  %tmp113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp113, i16 0, i32 1, i32 8
  store i16 %tmp112, i16* %global115, align 2
  %global118 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i16 0, i32 1, i32 9
  %tmp119 = load i16, i16* %global118, align 2
  %global122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp113, i16 0, i32 1, i32 9
  store i16 %tmp119, i16* %global122, align 2
  %9 = load i16, i16* %global111, align 2, !dbg !1190, !tbaa !474
  %cmp19 = icmp ult i16 %9, 16, !dbg !1191
  br i1 %cmp19, label %do.body, label %do.end, !dbg !1192, !llvm.loop !1193

do.end:                                           ; preds = %do.body
  tail call void @task_reduce_digits(), !dbg !1195
  tail call void @commit(), !dbg !1195
  %tmp123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global125 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 17
  %tmp126 = load i16, i16* %global125, align 2
  %tmp127 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i16 0, i32 1, i32 17
  store i16 %tmp126, i16* %global129, align 2
  %global132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i16 0, i32 1, i32 10
  %tmp133 = load i16, i16* %global132, align 2
  %global136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i16 0, i32 1, i32 10
  store i16 %tmp133, i16* %global136, align 2
  %10 = load i16, i16* %global125, align 2, !dbg !1196, !tbaa !266
  %cmp22 = icmp eq i16 %10, 0, !dbg !1198
  br i1 %cmp22, label %while.body, label %if.end24, !dbg !1199, !llvm.loop !1200

if.end24:                                         ; preds = %do.end
  tail call void @task_reduce_normalizable(), !dbg !1202
  tail call void @commit(), !dbg !1202
  %tmp137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp137, i16 0, i32 1, i32 12
  %tmp140 = load i16, i16* %global139, align 2
  %tmp141 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global143 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp141, i16 0, i32 1, i32 12
  store i16 %tmp140, i16* %global143, align 2
  %global146 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp137, i16 0, i32 1, i32 17
  %tmp147 = load i16, i16* %global146, align 2
  %global150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp141, i16 0, i32 1, i32 17
  store i16 %tmp147, i16* %global150, align 2
  %11 = load i16, i16* %global146, align 2, !dbg !1203, !tbaa !266
  %cmp27 = icmp eq i16 %11, 1, !dbg !1205
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !1206

if.then28:                                        ; preds = %if.end24
  tail call void @task_reduce_normalize(), !dbg !1207
  tail call void @commit(), !dbg !1207
  %tmp151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array154 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp151, i16 0, i32 1, i32 0, i16 0
  %cast155 = bitcast i16* %array154 to i8*
  %tmp156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp156, i16 0, i32 1, i32 0, i16 0
  %cast160 = bitcast i16* %array159 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast155, i8* nonnull align 2 dereferenceable(32) %cast160, i16 32, i1 false), !dbg !1207
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp156, i16 0, i32 1, i32 17
  %tmp164 = load i16, i16* %global163, align 2
  %global167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp151, i16 0, i32 1, i32 17
  store i16 %tmp164, i16* %global167, align 2
  %.pre3 = load i16, i16* %global163, align 2, !dbg !1209, !tbaa !266
  br label %if.end29, !dbg !1211

if.end29:                                         ; preds = %if.then28, %if.end24
  %12 = phi i16 [ %.pre3, %if.then28 ], [ %11, %if.end24 ], !dbg !1209
  %13 = phi %struct.camel_buffer_t* [ %tmp156, %if.then28 ], [ %tmp137, %if.end24 ], !dbg !1209
  %cmp32 = icmp eq i16 %12, 2, !dbg !1212
  br i1 %cmp32, label %if.then33, label %if.end44, !dbg !1213

if.then33:                                        ; preds = %if.end29
  tail call void @task_reduce_n_divisor(), !dbg !1214
  tail call void @commit(), !dbg !1214
  %tmp168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp168, i16 0, i32 1, i32 13
  %tmp171 = load i16, i16* %global170, align 2
  %tmp172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i16 0, i32 1, i32 13
  store i16 %tmp171, i16* %global174, align 2
  br label %do.body34, !dbg !1216

do.body34:                                        ; preds = %if.end39, %if.then33
  tail call void @task_reduce_quotient(), !dbg !1217
  tail call void @commit(), !dbg !1217
  %tmp175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp175, i16 0, i32 1, i32 16
  %tmp178 = load i16, i16* %global177, align 2
  %tmp179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp179, i16 0, i32 1, i32 16
  store i16 %tmp178, i16* %global181, align 2
  %global184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp175, i16 0, i32 1, i32 10
  %tmp185 = load i16, i16* %global184, align 2
  %global188 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp179, i16 0, i32 1, i32 10
  store i16 %tmp185, i16* %global188, align 2
  tail call void @task_reduce_multiply(), !dbg !1219
  tail call void @commit(), !dbg !1219
  %tmp189 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array192 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp189, i16 0, i32 1, i32 14, i16 0
  %cast193 = bitcast i16* %array192 to i8*
  %tmp194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array197 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp194, i16 0, i32 1, i32 14, i16 0
  %cast198 = bitcast i16* %array197 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast193, i8* nonnull align 2 dereferenceable(32) %cast198, i16 32, i1 false), !dbg !1219
  tail call void @task_reduce_compare(), !dbg !1220
  tail call void @commit(), !dbg !1220
  %tmp199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global201 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp199, i16 0, i32 1, i32 17
  %tmp202 = load i16, i16* %global201, align 2
  %tmp203 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp203, i16 0, i32 1, i32 17
  store i16 %tmp202, i16* %global205, align 2
  %14 = load i16, i16* %global201, align 2, !dbg !1221, !tbaa !266
  %cmp37 = icmp eq i16 %14, 0, !dbg !1223
  br i1 %cmp37, label %if.then38, label %if.end39, !dbg !1224

if.then38:                                        ; preds = %do.body34
  tail call void @task_reduce_compare(), !dbg !1225
  tail call void @commit(), !dbg !1225
  %tmp206 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global208 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp206, i16 0, i32 1, i32 17
  %tmp209 = load i16, i16* %global208, align 2
  %tmp210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global212 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp210, i16 0, i32 1, i32 17
  store i16 %tmp209, i16* %global212, align 2
  br label %if.end39, !dbg !1227

if.end39:                                         ; preds = %if.then38, %do.body34
  tail call void @task_reduce_subtract(), !dbg !1228
  tail call void @commit(), !dbg !1228
  %tmp213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array216 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp213, i16 0, i32 1, i32 0, i16 0
  %cast217 = bitcast i16* %array216 to i8*
  %tmp218 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array221 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp218, i16 0, i32 1, i32 0, i16 0
  %cast222 = bitcast i16* %array221 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast217, i8* nonnull align 2 dereferenceable(32) %cast222, i16 32, i1 false), !dbg !1228
  %reduce = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp218, i16 0, i32 1, i32 10, !dbg !1229
  %15 = load i16, i16* %reduce, align 2, !dbg !1229, !tbaa !599
  %add = add i16 %15, 1, !dbg !1230
  %cmp42 = icmp ugt i16 %add, 8, !dbg !1231
  br i1 %cmp42, label %do.body34, label %if.end44, !dbg !1232, !llvm.loop !1233

if.end44:                                         ; preds = %if.end39, %if.end29
  %16 = phi %struct.camel_buffer_t* [ %13, %if.end29 ], [ %tmp218, %if.end39 ], !dbg !1235
  %check_final = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 1, i32 18, !dbg !1235
  %17 = load i16, i16* %check_final, align 2, !dbg !1235, !tbaa !269
  switch i16 %17, label %while.body2.backedge [
    i16 0, label %if.then47
    i16 1, label %if.then52
  ], !dbg !1237

while.body2.backedge:                             ; preds = %if.end44, %if.then52, %if.then47
  %.be = phi %struct.camel_buffer_t* [ %16, %if.end44 ], [ %tmp262, %if.then52 ], [ %tmp228, %if.then47 ]
  br label %while.body2, !dbg !1160, !llvm.loop !1238

if.then47:                                        ; preds = %if.end44
  tail call void @task_mult_block_get_result(), !dbg !1240
  tail call void @commit(), !dbg !1240
  %tmp223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i16 0, i32 1, i32 15, i16 0
  %cast227 = bitcast i16* %array226 to i8*
  %tmp228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array231 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i16 0, i32 1, i32 15, i16 0
  %cast232 = bitcast i16* %array231 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast227, i8* nonnull align 2 dereferenceable(32) %cast232, i16 32, i1 false), !dbg !1240
  %global235 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i16 0, i32 1, i32 17
  %tmp236 = load i16, i16* %global235, align 2
  %global239 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i16 0, i32 1, i32 17
  store i16 %tmp236, i16* %global239, align 2
  %array243 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i16 0, i32 1, i32 11, i16 0
  %cast244 = bitcast i16* %array243 to i8*
  %array248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i16 0, i32 1, i32 11, i16 0
  %cast249 = bitcast i16* %array248 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast244, i8* nonnull align 2 dereferenceable(32) %cast249, i16 32, i1 false), !dbg !1240
  %global252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i16 0, i32 1, i32 5
  %tmp253 = load i16, i16* %global252, align 2
  %global256 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i16 0, i32 1, i32 5
  store i16 %tmp253, i16* %global256, align 2
  br label %while.body2.backedge, !dbg !1242

if.then52:                                        ; preds = %if.end44
  tail call void @task_square_base_get_result(), !dbg !1243
  tail call void @commit(), !dbg !1243
  %tmp257 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %array260 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp257, i16 0, i32 1, i32 6, i16 0
  %cast261 = bitcast i16* %array260 to i8*
  %tmp262 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %array265 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp262, i16 0, i32 1, i32 6, i16 0
  %cast266 = bitcast i16* %array265 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(32) %cast261, i8* nonnull align 2 dereferenceable(32) %cast266, i16 32, i1 false), !dbg !1243
  %global269 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp262, i16 0, i32 1, i32 17
  %tmp270 = load i16, i16* %global269, align 2
  %global273 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp257, i16 0, i32 1, i32 17
  store i16 %tmp270, i16* %global273, align 2
  br label %while.body2.backedge, !dbg !1246
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind }
attributes #12 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!95, !96, !97}
!llvm.ident = !{!98}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 100, type: !90, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_rsa.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 32, baseType: !9)
!8 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 65, baseType: !11)
!10 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!11 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!13, !18, !23, !0, !25, !67, !69, !72, !84}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 770, type: !15, isLocal: true, isDefinition: true)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 16)
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 56, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !22)
!22 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 57, type: !20, isLocal: false, isDefinition: true)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 107, type: !27, isLocal: false, isDefinition: true)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 16)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 93, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 88, size: 1808, elements: !30)
!30 = !{!31, !36, !66}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !29, file: !3, line: 90, baseType: !32, size: 176)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 176, elements: !34)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 53, baseType: !20)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !29, file: !3, line: 91, baseType: !37, size: 1616, offset: 176)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 85, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 60, size: 1616, elements: !39)
!39 = !{!40, !45, !46, !47, !48, !49, !50, !51, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "product", scope: !38, file: !3, line: 63, baseType: !41, size: 256)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 256, elements: !43)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "digit_t", file: !3, line: 17, baseType: !20)
!43 = !{!44}
!44 = !DISubrange(count: 16)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "exponent", scope: !38, file: !3, line: 64, baseType: !42, size: 16, offset: 256)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "exponent_next", scope: !38, file: !3, line: 65, baseType: !42, size: 16, offset: 272)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "block_offset", scope: !38, file: !3, line: 66, baseType: !6, size: 16, offset: 288)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "message_length", scope: !38, file: !3, line: 67, baseType: !6, size: 16, offset: 304)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext_len", scope: !38, file: !3, line: 68, baseType: !6, size: 16, offset: 320)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "base", scope: !38, file: !3, line: 69, baseType: !41, size: 256, offset: 336)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "modulus", scope: !38, file: !3, line: 70, baseType: !52, size: 128, offset: 592)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 128, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 8)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "digit", scope: !38, file: !3, line: 71, baseType: !42, size: 16, offset: 720)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "carry", scope: !38, file: !3, line: 72, baseType: !42, size: 16, offset: 736)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "reduce", scope: !38, file: !3, line: 73, baseType: !6, size: 16, offset: 752)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext", scope: !38, file: !3, line: 74, baseType: !41, size: 256, offset: 768)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !38, file: !3, line: 75, baseType: !6, size: 16, offset: 1024)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "n_div", scope: !38, file: !3, line: 76, baseType: !42, size: 16, offset: 1040)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "product2", scope: !38, file: !3, line: 77, baseType: !41, size: 256, offset: 1056)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "block", scope: !38, file: !3, line: 78, baseType: !41, size: 256, offset: 1312)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "quotient", scope: !38, file: !3, line: 79, baseType: !6, size: 16, offset: 1568)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !38, file: !3, line: 82, baseType: !6, size: 16, offset: 1584)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "check_final", scope: !38, file: !3, line: 83, baseType: !6, size: 16, offset: 1600)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !29, file: !3, line: 92, baseType: !20, size: 16, offset: 1792)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 107, type: !27, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 136, type: !71, isLocal: false, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 176, elements: !34)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "pubkey", scope: !2, file: !3, line: 39, type: !74, isLocal: true, isDefinition: true)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "pubkey_t", file: !3, line: 23, baseType: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 20, size: 80, elements: !77)
!77 = !{!78, !83}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !76, file: !3, line: 21, baseType: !79, size: 64)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 64, elements: !53)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 20, baseType: !81)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 29, baseType: !82)
!82 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !76, file: !3, line: 22, baseType: !42, size: 16, offset: 64)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "PLAINTEXT", scope: !2, file: !3, line: 43, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 96, elements: !88)
!87 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!88 = !{!89}
!89 = !DISubrange(count: 12)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 95, size: 3632, elements: !91)
!91 = !{!92, !93, !94}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !90, file: !3, line: 97, baseType: !20, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !90, file: !3, line: 98, baseType: !28, size: 1808, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !90, file: !3, line: 99, baseType: !28, size: 1808, offset: 1824)
!95 = !{i32 2, !"Dwarf Version", i32 4}
!96 = !{i32 2, !"Debug Info Version", i32 3}
!97 = !{i32 1, !"wchar_size", i32 2}
!98 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!99 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 109, type: !16, scopeLine: 109, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 110, column: 10, scope: !99)
!101 = !{!102, !102, i64 0}
!102 = !{!"int", !103, i64 0}
!103 = !{!"omnipotent char", !104, i64 0}
!104 = !{!"Simple C/C++ TBAA"}
!105 = !DILocation(line: 112, column: 9, scope: !99)
!106 = !{!103, !103, i64 0}
!107 = !DILocation(line: 114, column: 9, scope: !99)
!108 = !DILocation(line: 119, column: 11, scope: !99)
!109 = !DILocation(line: 124, column: 12, scope: !99)
!110 = !DILocation(line: 125, column: 10, scope: !99)
!111 = !DILocation(line: 126, column: 10, scope: !99)
!112 = !DILocation(line: 128, column: 10, scope: !99)
!113 = !DILocation(line: 129, column: 12, scope: !99)
!114 = !DILocation(line: 132, column: 10, scope: !99)
!115 = !DILocation(line: 134, column: 1, scope: !99)
!116 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 138, type: !16, scopeLine: 138, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !117)
!117 = !{!118, !120}
!118 = !DILocalVariable(name: "__x", scope: !119, file: !3, line: 165, type: !6)
!119 = distinct !DILexicalBlock(scope: !116, file: !3, line: 165, column: 33)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 165, type: !6)
!121 = distinct !DILexicalBlock(scope: !116, file: !3, line: 165, column: 65)
!122 = !DILocation(line: 139, column: 14, scope: !123)
!123 = distinct !DILexicalBlock(scope: !116, file: !3, line: 139, column: 8)
!124 = !{!125, !126, i64 0}
!125 = !{!"Camel", !126, i64 0, !127, i64 2, !127, i64 228}
!126 = !{!"short", !103, i64 0}
!127 = !{!"camel_buffer_t", !103, i64 0, !128, i64 22, !126, i64 224}
!128 = !{!"camel_global_t", !103, i64 0, !126, i64 32, !126, i64 34, !102, i64 36, !102, i64 38, !102, i64 40, !103, i64 42, !103, i64 74, !126, i64 90, !126, i64 92, !102, i64 94, !103, i64 96, !102, i64 128, !126, i64 130, !103, i64 132, !103, i64 164, !102, i64 196, !102, i64 198, !102, i64 200}
!129 = !DILocation(line: 139, column: 8, scope: !116)
!130 = !DILocation(line: 140, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !3, line: 139, column: 34)
!132 = !{!133, !133, i64 0}
!133 = !{!"any pointer", !103, i64 0}
!134 = !DILocation(line: 141, column: 16, scope: !131)
!135 = !DILocation(line: 142, column: 5, scope: !131)
!136 = !DILocation(line: 143, column: 14, scope: !137)
!137 = distinct !DILexicalBlock(scope: !138, file: !3, line: 142, column: 41)
!138 = distinct !DILexicalBlock(scope: !123, file: !3, line: 142, column: 15)
!139 = !DILocation(line: 144, column: 16, scope: !137)
!140 = !DILocation(line: 145, column: 5, scope: !137)
!141 = !DILocation(line: 146, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !3, line: 145, column: 12)
!143 = !DILocation(line: 163, column: 3, scope: !144)
!144 = distinct !DILexicalBlock(scope: !116, file: !3, line: 163, column: 3)
!145 = !{!126, !126, i64 0}
!146 = !{i32 -2146647928}
!147 = !DILocation(line: 165, column: 33, scope: !119)
!148 = !{i32 -2146647692}
!149 = !DILocation(line: 0, scope: !119)
!150 = !DILocation(line: 165, column: 51, scope: !116)
!151 = !DILocation(line: 165, column: 33, scope: !116)
!152 = !DILocation(line: 165, column: 65, scope: !121)
!153 = !{i32 -2146647567}
!154 = !DILocation(line: 0, scope: !121)
!155 = !DILocation(line: 165, column: 63, scope: !116)
!156 = !DILocation(line: 165, column: 19, scope: !116)
!157 = !DILocation(line: 165, column: 17, scope: !116)
!158 = !DILocation(line: 166, column: 37, scope: !116)
!159 = !DILocation(line: 166, column: 23, scope: !116)
!160 = !DILocation(line: 166, column: 21, scope: !116)
!161 = !DILocation(line: 169, column: 27, scope: !162)
!162 = distinct !DILexicalBlock(scope: !116, file: !3, line: 169, column: 6)
!163 = !DILocation(line: 169, column: 33, scope: !162)
!164 = !{!127, !126, i64 224}
!165 = !DILocation(line: 169, column: 24, scope: !162)
!166 = !DILocation(line: 169, column: 6, scope: !116)
!167 = !DILocation(line: 170, column: 11, scope: !168)
!168 = distinct !DILexicalBlock(scope: !162, file: !3, line: 169, column: 51)
!169 = !DILocation(line: 170, column: 4, scope: !168)
!170 = !DILocation(line: 110, column: 10, scope: !99, inlinedAt: !171)
!171 = distinct !DILocation(line: 171, column: 4, scope: !168)
!172 = !DILocation(line: 112, column: 9, scope: !99, inlinedAt: !171)
!173 = !DILocation(line: 114, column: 9, scope: !99, inlinedAt: !171)
!174 = !DILocation(line: 119, column: 11, scope: !99, inlinedAt: !171)
!175 = !DILocation(line: 124, column: 12, scope: !99, inlinedAt: !171)
!176 = !DILocation(line: 125, column: 10, scope: !99, inlinedAt: !171)
!177 = !DILocation(line: 126, column: 10, scope: !99, inlinedAt: !171)
!178 = !DILocation(line: 128, column: 10, scope: !99, inlinedAt: !171)
!179 = !DILocation(line: 129, column: 12, scope: !99, inlinedAt: !171)
!180 = !DILocation(line: 132, column: 10, scope: !99, inlinedAt: !171)
!181 = !DILocation(line: 172, column: 24, scope: !168)
!182 = !DILocation(line: 172, column: 4, scope: !168)
!183 = !DILocation(line: 173, column: 3, scope: !168)
!184 = !DILocation(line: 174, column: 4, scope: !185)
!185 = distinct !DILexicalBlock(scope: !162, file: !3, line: 173, column: 9)
!186 = !DILocation(line: 177, column: 1, scope: !116)
!187 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 228, type: !16, scopeLine: 228, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !188)
!188 = !{!189, !194, !196, !199}
!189 = !DILocalVariable(name: "__x", scope: !190, file: !3, line: 235, type: !6)
!190 = distinct !DILexicalBlock(scope: !191, file: !3, line: 235, column: 45)
!191 = distinct !DILexicalBlock(scope: !192, file: !3, line: 231, column: 39)
!192 = distinct !DILexicalBlock(scope: !193, file: !3, line: 231, column: 14)
!193 = distinct !DILexicalBlock(scope: !187, file: !3, line: 229, column: 8)
!194 = !DILocalVariable(name: "__x", scope: !195, file: !3, line: 235, type: !6)
!195 = distinct !DILexicalBlock(scope: !191, file: !3, line: 235, column: 77)
!196 = !DILocalVariable(name: "__x", scope: !197, file: !3, line: 243, type: !6)
!197 = distinct !DILexicalBlock(scope: !198, file: !3, line: 243, column: 45)
!198 = distinct !DILexicalBlock(scope: !192, file: !3, line: 239, column: 17)
!199 = !DILocalVariable(name: "__x", scope: !200, file: !3, line: 243, type: !6)
!200 = distinct !DILexicalBlock(scope: !198, file: !3, line: 243, column: 77)
!201 = !DILocation(line: 231, column: 20, scope: !192)
!202 = !DILocation(line: 231, column: 25, scope: !192)
!203 = !DILocation(line: 231, column: 14, scope: !193)
!204 = !DILocation(line: 232, column: 17, scope: !191)
!205 = !DILocation(line: 233, column: 19, scope: !191)
!206 = !DILocation(line: 234, column: 12, scope: !191)
!207 = !DILocation(line: 235, column: 45, scope: !190)
!208 = !{i32 -2146647253}
!209 = !DILocation(line: 0, scope: !190)
!210 = !DILocation(line: 235, column: 77, scope: !195)
!211 = !{i32 -2146647128}
!212 = !DILocation(line: 0, scope: !195)
!213 = !DILocation(line: 239, column: 11, scope: !191)
!214 = !DILocation(line: 240, column: 17, scope: !198)
!215 = !DILocation(line: 241, column: 19, scope: !198)
!216 = !DILocation(line: 242, column: 12, scope: !198)
!217 = !DILocation(line: 243, column: 45, scope: !197)
!218 = !{i32 -2146646996}
!219 = !DILocation(line: 0, scope: !197)
!220 = !DILocation(line: 243, column: 77, scope: !200)
!221 = !{i32 -2146646871}
!222 = !DILocation(line: 0, scope: !200)
!223 = !DILocation(line: 0, scope: !192)
!224 = !DILocation(line: 251, column: 1, scope: !187)
!225 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 278, type: !16, scopeLine: 278, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!226 = !DILocation(line: 280, column: 2, scope: !225)
!227 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 284, type: !16, scopeLine: 285, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !228)
!228 = !{!229, !231}
!229 = !DILocalVariable(name: "i", scope: !227, file: !3, line: 286, type: !230)
!230 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!231 = !DILocalVariable(name: "message_length", scope: !227, file: !3, line: 287, type: !6)
!232 = !DILocation(line: 286, column: 2, scope: !227)
!233 = !DILocation(line: 286, column: 6, scope: !227)
!234 = !DILocation(line: 287, column: 2, scope: !227)
!235 = !DILocation(line: 287, column: 11, scope: !227)
!236 = !DILocation(line: 290, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !227, file: !3, line: 290, column: 2)
!238 = !DILocation(line: 290, column: 7, scope: !237)
!239 = !DILocation(line: 290, column: 14, scope: !240)
!240 = distinct !DILexicalBlock(scope: !237, file: !3, line: 290, column: 2)
!241 = !DILocation(line: 290, column: 16, scope: !240)
!242 = !DILocation(line: 290, column: 2, scope: !237)
!243 = !DILocation(line: 291, column: 29, scope: !244)
!244 = distinct !DILexicalBlock(scope: !240, file: !3, line: 290, column: 35)
!245 = !DILocation(line: 291, column: 20, scope: !244)
!246 = !DILocation(line: 291, column: 3, scope: !244)
!247 = !DILocation(line: 291, column: 15, scope: !244)
!248 = !DILocation(line: 291, column: 18, scope: !244)
!249 = !DILocation(line: 292, column: 2, scope: !244)
!250 = !DILocation(line: 290, column: 30, scope: !240)
!251 = !DILocation(line: 290, column: 2, scope: !240)
!252 = distinct !{!252, !242, !253}
!253 = !DILocation(line: 292, column: 2, scope: !237)
!254 = !DILocation(line: 295, column: 23, scope: !227)
!255 = !DILocation(line: 295, column: 2, scope: !227)
!256 = !DILocation(line: 295, column: 21, scope: !227)
!257 = !{!127, !102, i64 60}
!258 = !DILocation(line: 296, column: 2, scope: !227)
!259 = !DILocation(line: 296, column: 19, scope: !227)
!260 = !{!127, !102, i64 58}
!261 = !DILocation(line: 297, column: 2, scope: !227)
!262 = !DILocation(line: 297, column: 21, scope: !227)
!263 = !{!127, !102, i64 62}
!264 = !DILocation(line: 300, column: 2, scope: !227)
!265 = !DILocation(line: 300, column: 12, scope: !227)
!266 = !{!127, !102, i64 220}
!267 = !DILocation(line: 301, column: 2, scope: !227)
!268 = !DILocation(line: 301, column: 18, scope: !227)
!269 = !{!127, !102, i64 222}
!270 = !DILocation(line: 302, column: 1, scope: !227)
!271 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 304, type: !16, scopeLine: 305, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !272)
!272 = !{!273, !274}
!273 = !DILocalVariable(name: "i", scope: !271, file: !3, line: 306, type: !230)
!274 = !DILocalVariable(name: "zero", scope: !271, file: !3, line: 312, type: !42)
!275 = !DILocation(line: 306, column: 2, scope: !271)
!276 = !DILocation(line: 306, column: 6, scope: !271)
!277 = !DILocation(line: 308, column: 6, scope: !278)
!278 = distinct !DILexicalBlock(scope: !271, file: !3, line: 308, column: 6)
!279 = !DILocation(line: 308, column: 26, scope: !278)
!280 = !DILocation(line: 308, column: 23, scope: !278)
!281 = !DILocation(line: 308, column: 6, scope: !271)
!282 = !DILocation(line: 309, column: 3, scope: !283)
!283 = distinct !DILexicalBlock(scope: !278, file: !3, line: 308, column: 46)
!284 = !DILocation(line: 312, column: 2, scope: !271)
!285 = !DILocation(line: 312, column: 10, scope: !271)
!286 = !DILocation(line: 313, column: 9, scope: !287)
!287 = distinct !DILexicalBlock(scope: !271, file: !3, line: 313, column: 2)
!288 = !DILocation(line: 313, column: 7, scope: !287)
!289 = !DILocation(line: 313, column: 14, scope: !290)
!290 = distinct !DILexicalBlock(scope: !287, file: !3, line: 313, column: 2)
!291 = !DILocation(line: 313, column: 16, scope: !290)
!292 = !DILocation(line: 313, column: 2, scope: !287)
!293 = !DILocation(line: 314, column: 18, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !3, line: 313, column: 52)
!295 = !DILocation(line: 314, column: 37, scope: !294)
!296 = !DILocation(line: 314, column: 35, scope: !294)
!297 = !DILocation(line: 314, column: 41, scope: !294)
!298 = !DILocation(line: 314, column: 39, scope: !294)
!299 = !DILocation(line: 314, column: 17, scope: !294)
!300 = !DILocation(line: 314, column: 73, scope: !294)
!301 = !DILocation(line: 314, column: 92, scope: !294)
!302 = !DILocation(line: 314, column: 90, scope: !294)
!303 = !DILocation(line: 314, column: 63, scope: !294)
!304 = !DILocation(line: 314, column: 3, scope: !294)
!305 = !DILocation(line: 314, column: 12, scope: !294)
!306 = !DILocation(line: 314, column: 15, scope: !294)
!307 = !DILocation(line: 315, column: 2, scope: !294)
!308 = !DILocation(line: 313, column: 47, scope: !290)
!309 = !DILocation(line: 313, column: 2, scope: !290)
!310 = distinct !{!310, !292, !311}
!311 = !DILocation(line: 315, column: 2, scope: !287)
!312 = !DILocation(line: 316, column: 9, scope: !313)
!313 = distinct !DILexicalBlock(scope: !271, file: !3, line: 316, column: 2)
!314 = !DILocation(line: 316, column: 7, scope: !313)
!315 = !DILocation(line: 316, column: 40, scope: !316)
!316 = distinct !DILexicalBlock(scope: !313, file: !3, line: 316, column: 2)
!317 = !DILocation(line: 316, column: 42, scope: !316)
!318 = !DILocation(line: 316, column: 2, scope: !313)
!319 = !DILocation(line: 317, column: 3, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !3, line: 316, column: 61)
!321 = !DILocation(line: 317, column: 12, scope: !320)
!322 = !DILocation(line: 317, column: 15, scope: !320)
!323 = !DILocation(line: 318, column: 2, scope: !320)
!324 = !DILocation(line: 316, column: 56, scope: !316)
!325 = !DILocation(line: 316, column: 2, scope: !316)
!326 = distinct !{!326, !318, !327}
!327 = !DILocation(line: 318, column: 2, scope: !313)
!328 = !DILocation(line: 319, column: 2, scope: !271)
!329 = !DILocation(line: 319, column: 12, scope: !271)
!330 = !DILocation(line: 319, column: 18, scope: !271)
!331 = !DILocation(line: 320, column: 9, scope: !332)
!332 = distinct !DILexicalBlock(scope: !271, file: !3, line: 320, column: 2)
!333 = !DILocation(line: 320, column: 7, scope: !332)
!334 = !DILocation(line: 320, column: 14, scope: !335)
!335 = distinct !DILexicalBlock(scope: !332, file: !3, line: 320, column: 2)
!336 = !DILocation(line: 320, column: 16, scope: !335)
!337 = !DILocation(line: 320, column: 2, scope: !332)
!338 = !DILocation(line: 321, column: 3, scope: !335)
!339 = !DILocation(line: 321, column: 13, scope: !335)
!340 = !DILocation(line: 321, column: 16, scope: !335)
!341 = !DILocation(line: 320, column: 30, scope: !335)
!342 = !DILocation(line: 320, column: 2, scope: !335)
!343 = distinct !{!343, !337, !344}
!344 = !DILocation(line: 321, column: 18, scope: !332)
!345 = !DILocation(line: 323, column: 2, scope: !271)
!346 = !DILocation(line: 323, column: 15, scope: !271)
!347 = !{!127, !126, i64 54}
!348 = !DILocation(line: 325, column: 2, scope: !271)
!349 = !DILocation(line: 325, column: 19, scope: !271)
!350 = !DILocation(line: 327, column: 2, scope: !271)
!351 = !DILocation(line: 327, column: 12, scope: !271)
!352 = !DILocation(line: 328, column: 1, scope: !271)
!353 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 330, type: !16, scopeLine: 331, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!354 = !DILocation(line: 333, column: 6, scope: !355)
!355 = distinct !DILexicalBlock(scope: !353, file: !3, line: 333, column: 6)
!356 = !DILocation(line: 333, column: 19, scope: !355)
!357 = !DILocation(line: 333, column: 6, scope: !353)
!358 = !DILocation(line: 334, column: 3, scope: !359)
!359 = distinct !DILexicalBlock(scope: !355, file: !3, line: 333, column: 26)
!360 = !DILocation(line: 334, column: 16, scope: !359)
!361 = !DILocation(line: 335, column: 9, scope: !359)
!362 = !DILocation(line: 335, column: 19, scope: !359)
!363 = !DILocation(line: 336, column: 2, scope: !359)
!364 = !DILocation(line: 337, column: 3, scope: !365)
!365 = distinct !DILexicalBlock(scope: !355, file: !3, line: 336, column: 9)
!366 = !DILocation(line: 337, column: 16, scope: !365)
!367 = !DILocation(line: 338, column: 9, scope: !365)
!368 = !DILocation(line: 338, column: 19, scope: !365)
!369 = !DILocation(line: 340, column: 1, scope: !353)
!370 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 342, type: !16, scopeLine: 343, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!371 = !DILocation(line: 345, column: 5, scope: !370)
!372 = !DILocation(line: 345, column: 21, scope: !370)
!373 = !DILocation(line: 347, column: 1, scope: !370)
!374 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 349, type: !16, scopeLine: 350, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !375)
!375 = !{!376, !377}
!376 = !DILocalVariable(name: "i", scope: !374, file: !3, line: 351, type: !230)
!377 = !DILocalVariable(name: "op", scope: !378, file: !3, line: 367, type: !6)
!378 = distinct !DILexicalBlock(scope: !379, file: !3, line: 365, column: 37)
!379 = distinct !DILexicalBlock(scope: !380, file: !3, line: 365, column: 4)
!380 = distinct !DILexicalBlock(scope: !381, file: !3, line: 365, column: 4)
!381 = distinct !DILexicalBlock(scope: !382, file: !3, line: 363, column: 59)
!382 = distinct !DILexicalBlock(scope: !383, file: !3, line: 363, column: 7)
!383 = distinct !DILexicalBlock(scope: !384, file: !3, line: 361, column: 9)
!384 = distinct !DILexicalBlock(scope: !374, file: !3, line: 357, column: 6)
!385 = !DILocation(line: 351, column: 2, scope: !374)
!386 = !DILocation(line: 351, column: 6, scope: !374)
!387 = !DILocation(line: 353, column: 9, scope: !388)
!388 = distinct !DILexicalBlock(scope: !374, file: !3, line: 353, column: 2)
!389 = !DILocation(line: 353, column: 7, scope: !388)
!390 = !DILocation(line: 353, column: 27, scope: !391)
!391 = distinct !DILexicalBlock(scope: !388, file: !3, line: 353, column: 2)
!392 = !DILocation(line: 353, column: 29, scope: !391)
!393 = !DILocation(line: 353, column: 2, scope: !388)
!394 = !DILocation(line: 354, column: 18, scope: !395)
!395 = distinct !DILexicalBlock(scope: !391, file: !3, line: 353, column: 40)
!396 = !DILocation(line: 354, column: 30, scope: !395)
!397 = !DILocation(line: 354, column: 3, scope: !395)
!398 = !DILocation(line: 354, column: 13, scope: !395)
!399 = !DILocation(line: 354, column: 16, scope: !395)
!400 = !DILocation(line: 355, column: 2, scope: !395)
!401 = !DILocation(line: 353, column: 35, scope: !391)
!402 = !DILocation(line: 353, column: 2, scope: !391)
!403 = distinct !{!403, !393, !404}
!404 = !DILocation(line: 355, column: 2, scope: !388)
!405 = !DILocation(line: 357, column: 6, scope: !384)
!406 = !DILocation(line: 357, column: 19, scope: !384)
!407 = !DILocation(line: 357, column: 6, scope: !374)
!408 = !DILocation(line: 359, column: 3, scope: !409)
!409 = distinct !DILexicalBlock(scope: !384, file: !3, line: 357, column: 24)
!410 = !DILocation(line: 359, column: 13, scope: !409)
!411 = !DILocation(line: 361, column: 2, scope: !409)
!412 = !DILocation(line: 363, column: 7, scope: !382)
!413 = !DILocation(line: 363, column: 26, scope: !382)
!414 = !DILocation(line: 363, column: 39, scope: !382)
!415 = !DILocation(line: 363, column: 7, scope: !383)
!416 = !DILocation(line: 365, column: 11, scope: !380)
!417 = !DILocation(line: 365, column: 9, scope: !380)
!418 = !DILocation(line: 365, column: 16, scope: !379)
!419 = !DILocation(line: 365, column: 18, scope: !379)
!420 = !DILocation(line: 365, column: 4, scope: !380)
!421 = !DILocation(line: 367, column: 5, scope: !378)
!422 = !DILocation(line: 367, column: 14, scope: !378)
!423 = !DILocation(line: 367, column: 19, scope: !378)
!424 = !DILocation(line: 368, column: 26, scope: !378)
!425 = !DILocation(line: 368, column: 38, scope: !378)
!426 = !DILocation(line: 368, column: 5, scope: !378)
!427 = !DILocation(line: 368, column: 20, scope: !378)
!428 = !DILocation(line: 368, column: 24, scope: !378)
!429 = !DILocation(line: 369, column: 7, scope: !378)
!430 = !DILocation(line: 369, column: 5, scope: !378)
!431 = !DILocation(line: 370, column: 4, scope: !379)
!432 = !DILocation(line: 370, column: 4, scope: !378)
!433 = !DILocation(line: 365, column: 32, scope: !379)
!434 = !DILocation(line: 365, column: 4, scope: !379)
!435 = distinct !{!435, !420, !436}
!436 = !DILocation(line: 370, column: 4, scope: !380)
!437 = !DILocation(line: 372, column: 3, scope: !381)
!438 = !DILocation(line: 374, column: 3, scope: !383)
!439 = !DILocation(line: 374, column: 13, scope: !383)
!440 = !DILocation(line: 377, column: 1, scope: !374)
!441 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 379, type: !16, scopeLine: 380, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!442 = !DILocation(line: 381, column: 2, scope: !441)
!443 = !DILocation(line: 381, column: 18, scope: !441)
!444 = !DILocation(line: 383, column: 1, scope: !441)
!445 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 385, type: !16, scopeLine: 386, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !446)
!446 = !{!447}
!447 = !DILocalVariable(name: "i", scope: !445, file: !3, line: 387, type: !230)
!448 = !DILocation(line: 387, column: 2, scope: !445)
!449 = !DILocation(line: 387, column: 6, scope: !445)
!450 = !DILocation(line: 389, column: 9, scope: !451)
!451 = distinct !DILexicalBlock(scope: !445, file: !3, line: 389, column: 2)
!452 = !DILocation(line: 389, column: 7, scope: !451)
!453 = !DILocation(line: 389, column: 14, scope: !454)
!454 = distinct !DILexicalBlock(scope: !451, file: !3, line: 389, column: 2)
!455 = !DILocation(line: 389, column: 16, scope: !454)
!456 = !DILocation(line: 389, column: 2, scope: !451)
!457 = !DILocation(line: 390, column: 17, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !3, line: 389, column: 35)
!459 = !DILocation(line: 390, column: 29, scope: !458)
!460 = !DILocation(line: 390, column: 3, scope: !458)
!461 = !DILocation(line: 390, column: 12, scope: !458)
!462 = !DILocation(line: 390, column: 15, scope: !458)
!463 = !DILocation(line: 391, column: 2, scope: !458)
!464 = !DILocation(line: 389, column: 30, scope: !454)
!465 = !DILocation(line: 389, column: 2, scope: !454)
!466 = distinct !{!466, !456, !467}
!467 = !DILocation(line: 391, column: 2, scope: !451)
!468 = !DILocation(line: 393, column: 2, scope: !445)
!469 = !DILocation(line: 393, column: 12, scope: !445)
!470 = !DILocation(line: 394, column: 1, scope: !445)
!471 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 396, type: !16, scopeLine: 397, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!472 = !DILocation(line: 398, column: 2, scope: !471)
!473 = !DILocation(line: 398, column: 12, scope: !471)
!474 = !{!127, !126, i64 112}
!475 = !DILocation(line: 399, column: 2, scope: !471)
!476 = !DILocation(line: 399, column: 12, scope: !471)
!477 = !{!127, !126, i64 114}
!478 = !DILocation(line: 401, column: 1, scope: !471)
!479 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 403, type: !16, scopeLine: 404, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !480)
!480 = !{!481, !482, !483, !484, !485, !486, !487}
!481 = !DILocalVariable(name: "i", scope: !479, file: !3, line: 405, type: !230)
!482 = !DILocalVariable(name: "a", scope: !479, file: !3, line: 406, type: !42)
!483 = !DILocalVariable(name: "b", scope: !479, file: !3, line: 406, type: !42)
!484 = !DILocalVariable(name: "c", scope: !479, file: !3, line: 406, type: !42)
!485 = !DILocalVariable(name: "dp", scope: !479, file: !3, line: 407, type: !42)
!486 = !DILocalVariable(name: "p", scope: !479, file: !3, line: 407, type: !42)
!487 = !DILocalVariable(name: "op", scope: !488, file: !3, line: 414, type: !6)
!488 = distinct !DILexicalBlock(scope: !489, file: !3, line: 412, column: 57)
!489 = distinct !DILexicalBlock(scope: !490, file: !3, line: 412, column: 7)
!490 = distinct !DILexicalBlock(scope: !491, file: !3, line: 411, column: 35)
!491 = distinct !DILexicalBlock(scope: !492, file: !3, line: 411, column: 2)
!492 = distinct !DILexicalBlock(scope: !479, file: !3, line: 411, column: 2)
!493 = !DILocation(line: 405, column: 2, scope: !479)
!494 = !DILocation(line: 405, column: 6, scope: !479)
!495 = !DILocation(line: 406, column: 2, scope: !479)
!496 = !DILocation(line: 406, column: 10, scope: !479)
!497 = !DILocation(line: 406, column: 13, scope: !479)
!498 = !DILocation(line: 406, column: 16, scope: !479)
!499 = !DILocation(line: 407, column: 2, scope: !479)
!500 = !DILocation(line: 407, column: 10, scope: !479)
!501 = !DILocation(line: 407, column: 14, scope: !479)
!502 = !DILocation(line: 409, column: 6, scope: !479)
!503 = !DILocation(line: 409, column: 4, scope: !479)
!504 = !DILocation(line: 410, column: 4, scope: !479)
!505 = !DILocation(line: 411, column: 9, scope: !492)
!506 = !DILocation(line: 411, column: 7, scope: !492)
!507 = !DILocation(line: 411, column: 14, scope: !491)
!508 = !DILocation(line: 411, column: 16, scope: !491)
!509 = !DILocation(line: 411, column: 2, scope: !492)
!510 = !DILocation(line: 412, column: 7, scope: !489)
!511 = !DILocation(line: 412, column: 19, scope: !489)
!512 = !DILocation(line: 412, column: 17, scope: !489)
!513 = !DILocation(line: 412, column: 21, scope: !489)
!514 = !DILocation(line: 412, column: 26, scope: !489)
!515 = !DILocation(line: 412, column: 29, scope: !489)
!516 = !DILocation(line: 412, column: 41, scope: !489)
!517 = !DILocation(line: 412, column: 39, scope: !489)
!518 = !DILocation(line: 412, column: 43, scope: !489)
!519 = !DILocation(line: 412, column: 7, scope: !490)
!520 = !DILocation(line: 414, column: 4, scope: !488)
!521 = !DILocation(line: 414, column: 13, scope: !488)
!522 = !DILocation(line: 414, column: 18, scope: !488)
!523 = !DILocation(line: 414, column: 30, scope: !488)
!524 = !DILocation(line: 414, column: 28, scope: !488)
!525 = !DILocation(line: 416, column: 8, scope: !488)
!526 = !DILocation(line: 416, column: 17, scope: !488)
!527 = !DILocation(line: 416, column: 6, scope: !488)
!528 = !DILocation(line: 417, column: 8, scope: !488)
!529 = !DILocation(line: 417, column: 18, scope: !488)
!530 = !DILocation(line: 417, column: 6, scope: !488)
!531 = !DILocation(line: 418, column: 9, scope: !488)
!532 = !DILocation(line: 418, column: 13, scope: !488)
!533 = !DILocation(line: 418, column: 11, scope: !488)
!534 = !DILocation(line: 418, column: 7, scope: !488)
!535 = !DILocation(line: 420, column: 9, scope: !488)
!536 = !DILocation(line: 420, column: 12, scope: !488)
!537 = !DILocation(line: 420, column: 6, scope: !488)
!538 = !DILocation(line: 421, column: 9, scope: !488)
!539 = !DILocation(line: 421, column: 12, scope: !488)
!540 = !DILocation(line: 421, column: 6, scope: !488)
!541 = !DILocation(line: 423, column: 3, scope: !489)
!542 = !DILocation(line: 423, column: 3, scope: !488)
!543 = !DILocation(line: 424, column: 2, scope: !490)
!544 = !DILocation(line: 411, column: 30, scope: !491)
!545 = !DILocation(line: 411, column: 2, scope: !491)
!546 = distinct !{!546, !509, !547}
!547 = !DILocation(line: 424, column: 2, scope: !492)
!548 = !DILocation(line: 426, column: 7, scope: !479)
!549 = !DILocation(line: 426, column: 9, scope: !479)
!550 = !DILocation(line: 426, column: 4, scope: !479)
!551 = !DILocation(line: 427, column: 4, scope: !479)
!552 = !DILocation(line: 429, column: 27, scope: !479)
!553 = !DILocation(line: 429, column: 2, scope: !479)
!554 = !DILocation(line: 429, column: 14, scope: !479)
!555 = !DILocation(line: 429, column: 25, scope: !479)
!556 = !DILocation(line: 430, column: 2, scope: !479)
!557 = !DILocation(line: 430, column: 11, scope: !479)
!558 = !DILocation(line: 432, column: 6, scope: !559)
!559 = distinct !DILexicalBlock(scope: !479, file: !3, line: 432, column: 6)
!560 = !DILocation(line: 432, column: 16, scope: !559)
!561 = !DILocation(line: 432, column: 6, scope: !479)
!562 = !DILocation(line: 433, column: 15, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !3, line: 432, column: 34)
!564 = !DILocation(line: 433, column: 3, scope: !563)
!565 = !DILocation(line: 433, column: 13, scope: !563)
!566 = !DILocation(line: 434, column: 2, scope: !563)
!567 = !DILocation(line: 435, column: 1, scope: !479)
!568 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 437, type: !16, scopeLine: 438, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !569)
!569 = !{!570}
!570 = !DILocalVariable(name: "d", scope: !568, file: !3, line: 439, type: !230)
!571 = !DILocation(line: 439, column: 2, scope: !568)
!572 = !DILocation(line: 439, column: 6, scope: !568)
!573 = !DILocation(line: 441, column: 4, scope: !568)
!574 = !DILocation(line: 442, column: 2, scope: !568)
!575 = !DILocation(line: 443, column: 4, scope: !576)
!576 = distinct !DILexicalBlock(scope: !568, file: !3, line: 442, column: 5)
!577 = !DILocation(line: 444, column: 2, scope: !576)
!578 = !DILocation(line: 444, column: 11, scope: !568)
!579 = !DILocation(line: 444, column: 23, scope: !568)
!580 = !DILocation(line: 444, column: 26, scope: !568)
!581 = !DILocation(line: 444, column: 31, scope: !568)
!582 = !DILocation(line: 444, column: 34, scope: !568)
!583 = !DILocation(line: 444, column: 36, scope: !568)
!584 = !DILocation(line: 0, scope: !568)
!585 = distinct !{!585, !574, !586}
!586 = !DILocation(line: 444, column: 39, scope: !568)
!587 = !DILocation(line: 446, column: 6, scope: !588)
!588 = distinct !DILexicalBlock(scope: !568, file: !3, line: 446, column: 6)
!589 = !DILocation(line: 446, column: 18, scope: !588)
!590 = !DILocation(line: 446, column: 21, scope: !588)
!591 = !DILocation(line: 446, column: 6, scope: !568)
!592 = !DILocation(line: 447, column: 3, scope: !593)
!593 = distinct !DILexicalBlock(scope: !588, file: !3, line: 446, column: 27)
!594 = !DILocation(line: 447, column: 13, scope: !593)
!595 = !DILocation(line: 448, column: 2, scope: !593)
!596 = !DILocation(line: 450, column: 15, scope: !568)
!597 = !DILocation(line: 450, column: 2, scope: !568)
!598 = !DILocation(line: 450, column: 13, scope: !568)
!599 = !{!127, !102, i64 116}
!600 = !DILocation(line: 452, column: 2, scope: !568)
!601 = !DILocation(line: 452, column: 12, scope: !568)
!602 = !DILocation(line: 453, column: 1, scope: !568)
!603 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 455, type: !16, scopeLine: 456, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !604)
!604 = !{!605, !606, !608}
!605 = !DILocalVariable(name: "i", scope: !603, file: !3, line: 457, type: !230)
!606 = !DILocalVariable(name: "normalizable", scope: !603, file: !3, line: 458, type: !607)
!607 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!608 = !DILocalVariable(name: "op", scope: !609, file: !3, line: 464, type: !6)
!609 = distinct !DILexicalBlock(scope: !610, file: !3, line: 462, column: 36)
!610 = distinct !DILexicalBlock(scope: !611, file: !3, line: 462, column: 2)
!611 = distinct !DILexicalBlock(scope: !603, file: !3, line: 462, column: 2)
!612 = !DILocation(line: 457, column: 2, scope: !603)
!613 = !DILocation(line: 457, column: 6, scope: !603)
!614 = !DILocation(line: 458, column: 2, scope: !603)
!615 = !DILocation(line: 458, column: 7, scope: !603)
!616 = !{!617, !617, i64 0}
!617 = !{!"_Bool", !103, i64 0}
!618 = !DILocation(line: 460, column: 15, scope: !603)
!619 = !DILocation(line: 460, column: 26, scope: !603)
!620 = !DILocation(line: 460, column: 30, scope: !603)
!621 = !DILocation(line: 460, column: 2, scope: !603)
!622 = !DILocation(line: 460, column: 13, scope: !603)
!623 = !{!127, !102, i64 150}
!624 = !DILocation(line: 462, column: 11, scope: !611)
!625 = !DILocation(line: 462, column: 9, scope: !611)
!626 = !DILocation(line: 462, column: 7, scope: !611)
!627 = !DILocation(line: 462, column: 23, scope: !610)
!628 = !DILocation(line: 462, column: 25, scope: !610)
!629 = !DILocation(line: 462, column: 2, scope: !611)
!630 = !DILocation(line: 464, column: 3, scope: !609)
!631 = !DILocation(line: 464, column: 12, scope: !609)
!632 = !DILocation(line: 464, column: 17, scope: !609)
!633 = !DILocation(line: 464, column: 19, scope: !609)
!634 = !DILocation(line: 464, column: 18, scope: !609)
!635 = !DILocation(line: 466, column: 7, scope: !636)
!636 = distinct !DILexicalBlock(scope: !609, file: !3, line: 466, column: 7)
!637 = !DILocation(line: 466, column: 19, scope: !636)
!638 = !DILocation(line: 466, column: 24, scope: !636)
!639 = !DILocation(line: 466, column: 36, scope: !636)
!640 = !DILocation(line: 466, column: 22, scope: !636)
!641 = !DILocation(line: 466, column: 7, scope: !609)
!642 = !DILocation(line: 467, column: 4, scope: !643)
!643 = distinct !DILexicalBlock(scope: !636, file: !3, line: 466, column: 41)
!644 = !DILocation(line: 468, column: 14, scope: !645)
!645 = distinct !DILexicalBlock(scope: !636, file: !3, line: 468, column: 14)
!646 = !DILocation(line: 468, column: 26, scope: !645)
!647 = !DILocation(line: 468, column: 31, scope: !645)
!648 = !DILocation(line: 468, column: 43, scope: !645)
!649 = !DILocation(line: 468, column: 29, scope: !645)
!650 = !DILocation(line: 468, column: 14, scope: !636)
!651 = !DILocation(line: 469, column: 17, scope: !652)
!652 = distinct !DILexicalBlock(scope: !645, file: !3, line: 468, column: 48)
!653 = !DILocation(line: 470, column: 4, scope: !652)
!654 = !DILocation(line: 472, column: 2, scope: !610)
!655 = !DILocation(line: 472, column: 2, scope: !609)
!656 = !DILocation(line: 462, column: 31, scope: !610)
!657 = !DILocation(line: 462, column: 2, scope: !610)
!658 = distinct !{!658, !629, !659}
!659 = !DILocation(line: 472, column: 2, scope: !611)
!660 = !DILocation(line: 474, column: 7, scope: !661)
!661 = distinct !DILexicalBlock(scope: !603, file: !3, line: 474, column: 6)
!662 = !{i8 0, i8 2}
!663 = !DILocation(line: 474, column: 20, scope: !661)
!664 = !DILocation(line: 474, column: 23, scope: !661)
!665 = !DILocation(line: 474, column: 34, scope: !661)
!666 = !DILocation(line: 474, column: 6, scope: !603)
!667 = !DILocation(line: 476, column: 3, scope: !668)
!668 = distinct !DILexicalBlock(scope: !661, file: !3, line: 474, column: 53)
!669 = !DILocation(line: 476, column: 13, scope: !668)
!670 = !DILocation(line: 477, column: 2, scope: !668)
!671 = !DILocation(line: 479, column: 6, scope: !672)
!672 = distinct !DILexicalBlock(scope: !603, file: !3, line: 479, column: 6)
!673 = !DILocation(line: 479, column: 6, scope: !603)
!674 = !DILocation(line: 481, column: 3, scope: !675)
!675 = distinct !DILexicalBlock(scope: !672, file: !3, line: 479, column: 20)
!676 = !DILocation(line: 481, column: 13, scope: !675)
!677 = !DILocation(line: 482, column: 2, scope: !675)
!678 = !DILocation(line: 484, column: 3, scope: !679)
!679 = distinct !DILexicalBlock(scope: !672, file: !3, line: 482, column: 9)
!680 = !DILocation(line: 484, column: 13, scope: !679)
!681 = !DILocation(line: 486, column: 1, scope: !603)
!682 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 487, type: !16, scopeLine: 488, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !683)
!683 = !{!684, !685, !686, !687, !688, !689, !690}
!684 = !DILocalVariable(name: "m", scope: !682, file: !3, line: 489, type: !42)
!685 = !DILocalVariable(name: "n", scope: !682, file: !3, line: 489, type: !42)
!686 = !DILocalVariable(name: "d", scope: !682, file: !3, line: 489, type: !42)
!687 = !DILocalVariable(name: "s", scope: !682, file: !3, line: 489, type: !42)
!688 = !DILocalVariable(name: "borrow", scope: !682, file: !3, line: 490, type: !6)
!689 = !DILocalVariable(name: "i", scope: !682, file: !3, line: 492, type: !230)
!690 = !DILocalVariable(name: "op", scope: !691, file: !3, line: 497, type: !6)
!691 = distinct !DILexicalBlock(scope: !692, file: !3, line: 495, column: 35)
!692 = distinct !DILexicalBlock(scope: !693, file: !3, line: 495, column: 2)
!693 = distinct !DILexicalBlock(scope: !682, file: !3, line: 495, column: 2)
!694 = !DILocation(line: 489, column: 2, scope: !682)
!695 = !DILocation(line: 489, column: 10, scope: !682)
!696 = !DILocation(line: 489, column: 13, scope: !682)
!697 = !DILocation(line: 489, column: 16, scope: !682)
!698 = !DILocation(line: 489, column: 19, scope: !682)
!699 = !DILocation(line: 490, column: 2, scope: !682)
!700 = !DILocation(line: 490, column: 11, scope: !682)
!701 = !DILocation(line: 492, column: 2, scope: !682)
!702 = !DILocation(line: 492, column: 6, scope: !682)
!703 = !DILocation(line: 494, column: 9, scope: !682)
!704 = !DILocation(line: 495, column: 9, scope: !693)
!705 = !DILocation(line: 495, column: 7, scope: !693)
!706 = !DILocation(line: 495, column: 14, scope: !692)
!707 = !DILocation(line: 495, column: 16, scope: !692)
!708 = !DILocation(line: 495, column: 2, scope: !693)
!709 = !DILocation(line: 497, column: 3, scope: !691)
!710 = !DILocation(line: 497, column: 12, scope: !691)
!711 = !DILocation(line: 497, column: 17, scope: !691)
!712 = !DILocation(line: 497, column: 21, scope: !691)
!713 = !DILocation(line: 497, column: 19, scope: !691)
!714 = !DILocation(line: 499, column: 7, scope: !691)
!715 = !DILocation(line: 499, column: 19, scope: !691)
!716 = !DILocation(line: 499, column: 5, scope: !691)
!717 = !DILocation(line: 500, column: 7, scope: !691)
!718 = !DILocation(line: 500, column: 19, scope: !691)
!719 = !DILocation(line: 500, column: 5, scope: !691)
!720 = !DILocation(line: 502, column: 7, scope: !691)
!721 = !DILocation(line: 502, column: 11, scope: !691)
!722 = !DILocation(line: 502, column: 9, scope: !691)
!723 = !DILocation(line: 502, column: 5, scope: !691)
!724 = !DILocation(line: 503, column: 7, scope: !725)
!725 = distinct !DILexicalBlock(scope: !691, file: !3, line: 503, column: 7)
!726 = !DILocation(line: 503, column: 11, scope: !725)
!727 = !DILocation(line: 503, column: 9, scope: !725)
!728 = !DILocation(line: 503, column: 7, scope: !691)
!729 = !DILocation(line: 504, column: 6, scope: !730)
!730 = distinct !DILexicalBlock(scope: !725, file: !3, line: 503, column: 14)
!731 = !DILocation(line: 505, column: 11, scope: !730)
!732 = !DILocation(line: 506, column: 3, scope: !730)
!733 = !DILocation(line: 507, column: 11, scope: !734)
!734 = distinct !DILexicalBlock(scope: !725, file: !3, line: 506, column: 10)
!735 = !DILocation(line: 509, column: 7, scope: !691)
!736 = !DILocation(line: 509, column: 11, scope: !691)
!737 = !DILocation(line: 509, column: 9, scope: !691)
!738 = !DILocation(line: 509, column: 5, scope: !691)
!739 = !DILocation(line: 511, column: 21, scope: !691)
!740 = !DILocation(line: 511, column: 3, scope: !691)
!741 = !DILocation(line: 511, column: 15, scope: !691)
!742 = !DILocation(line: 511, column: 19, scope: !691)
!743 = !DILocation(line: 513, column: 2, scope: !692)
!744 = !DILocation(line: 513, column: 2, scope: !691)
!745 = !DILocation(line: 495, column: 30, scope: !692)
!746 = !DILocation(line: 495, column: 2, scope: !692)
!747 = distinct !{!747, !708, !748}
!748 = !DILocation(line: 513, column: 2, scope: !693)
!749 = !DILocation(line: 515, column: 6, scope: !750)
!750 = distinct !DILexicalBlock(scope: !682, file: !3, line: 515, column: 6)
!751 = !DILocation(line: 515, column: 17, scope: !750)
!752 = !DILocation(line: 515, column: 6, scope: !682)
!753 = !DILocation(line: 516, column: 3, scope: !754)
!754 = distinct !DILexicalBlock(scope: !750, file: !3, line: 515, column: 22)
!755 = !DILocation(line: 516, column: 13, scope: !754)
!756 = !DILocation(line: 517, column: 2, scope: !754)
!757 = !DILocation(line: 518, column: 3, scope: !758)
!758 = distinct !DILexicalBlock(scope: !750, file: !3, line: 517, column: 9)
!759 = !DILocation(line: 518, column: 13, scope: !758)
!760 = !DILocation(line: 520, column: 1, scope: !682)
!761 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 522, type: !16, scopeLine: 523, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !762)
!762 = !{!763, !764}
!763 = !DILocalVariable(name: "op1", scope: !761, file: !3, line: 524, type: !6)
!764 = !DILocalVariable(name: "op2", scope: !761, file: !3, line: 525, type: !6)
!765 = !DILocation(line: 524, column: 2, scope: !761)
!766 = !DILocation(line: 524, column: 11, scope: !761)
!767 = !DILocation(line: 525, column: 2, scope: !761)
!768 = !DILocation(line: 525, column: 11, scope: !761)
!769 = !DILocation(line: 527, column: 16, scope: !761)
!770 = !DILocation(line: 527, column: 28, scope: !761)
!771 = !DILocation(line: 527, column: 32, scope: !761)
!772 = !DILocation(line: 527, column: 49, scope: !761)
!773 = !DILocation(line: 527, column: 61, scope: !761)
!774 = !DILocation(line: 527, column: 47, scope: !761)
!775 = !DILocation(line: 527, column: 2, scope: !761)
!776 = !DILocation(line: 527, column: 12, scope: !761)
!777 = !{!127, !126, i64 152}
!778 = !DILocation(line: 529, column: 1, scope: !761)
!779 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 531, type: !16, scopeLine: 532, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !780)
!780 = !{!781, !782, !783, !784, !785}
!781 = !DILocalVariable(name: "qn", scope: !779, file: !3, line: 533, type: !7)
!782 = !DILocalVariable(name: "n_q", scope: !779, file: !3, line: 533, type: !7)
!783 = !DILocalVariable(name: "op1", scope: !779, file: !3, line: 535, type: !6)
!784 = !DILocalVariable(name: "op2", scope: !779, file: !3, line: 536, type: !6)
!785 = !DILocalVariable(name: "op3", scope: !779, file: !3, line: 537, type: !6)
!786 = !DILocation(line: 533, column: 2, scope: !779)
!787 = !DILocation(line: 533, column: 11, scope: !779)
!788 = !DILocation(line: 533, column: 15, scope: !779)
!789 = !DILocation(line: 535, column: 2, scope: !779)
!790 = !DILocation(line: 535, column: 11, scope: !779)
!791 = !DILocation(line: 536, column: 2, scope: !779)
!792 = !DILocation(line: 536, column: 11, scope: !779)
!793 = !DILocation(line: 536, column: 17, scope: !779)
!794 = !DILocation(line: 536, column: 28, scope: !779)
!795 = !DILocation(line: 537, column: 2, scope: !779)
!796 = !DILocation(line: 537, column: 11, scope: !779)
!797 = !DILocation(line: 537, column: 17, scope: !779)
!798 = !DILocation(line: 537, column: 28, scope: !779)
!799 = !DILocation(line: 539, column: 6, scope: !800)
!800 = distinct !DILexicalBlock(scope: !779, file: !3, line: 539, column: 6)
!801 = !DILocation(line: 539, column: 18, scope: !800)
!802 = !DILocation(line: 539, column: 33, scope: !800)
!803 = !DILocation(line: 539, column: 45, scope: !800)
!804 = !DILocation(line: 539, column: 30, scope: !800)
!805 = !DILocation(line: 539, column: 6, scope: !779)
!806 = !DILocation(line: 540, column: 3, scope: !807)
!807 = distinct !DILexicalBlock(scope: !800, file: !3, line: 539, column: 51)
!808 = !DILocation(line: 540, column: 16, scope: !807)
!809 = !{!127, !102, i64 218}
!810 = !DILocation(line: 541, column: 2, scope: !807)
!811 = !DILocation(line: 542, column: 20, scope: !812)
!812 = distinct !DILexicalBlock(scope: !800, file: !3, line: 541, column: 9)
!813 = !DILocation(line: 542, column: 32, scope: !812)
!814 = !DILocation(line: 542, column: 44, scope: !812)
!815 = !DILocation(line: 542, column: 61, scope: !812)
!816 = !DILocation(line: 542, column: 73, scope: !812)
!817 = !DILocation(line: 542, column: 59, scope: !812)
!818 = !DILocation(line: 542, column: 81, scope: !812)
!819 = !DILocation(line: 542, column: 93, scope: !812)
!820 = !DILocation(line: 542, column: 79, scope: !812)
!821 = !DILocation(line: 542, column: 3, scope: !812)
!822 = !DILocation(line: 542, column: 16, scope: !812)
!823 = !DILocation(line: 545, column: 19, scope: !779)
!824 = !DILocation(line: 545, column: 31, scope: !779)
!825 = !DILocation(line: 545, column: 9, scope: !779)
!826 = !DILocation(line: 545, column: 43, scope: !779)
!827 = !DILocation(line: 545, column: 67, scope: !779)
!828 = !DILocation(line: 545, column: 79, scope: !779)
!829 = !DILocation(line: 545, column: 84, scope: !779)
!830 = !DILocation(line: 545, column: 66, scope: !779)
!831 = !DILocation(line: 545, column: 64, scope: !779)
!832 = !DILocation(line: 545, column: 101, scope: !779)
!833 = !DILocation(line: 545, column: 113, scope: !779)
!834 = !DILocation(line: 545, column: 99, scope: !779)
!835 = !DILocation(line: 545, column: 6, scope: !779)
!836 = !{!837, !837, i64 0}
!837 = !{!"long", !103, i64 0}
!838 = !DILocation(line: 547, column: 2, scope: !779)
!839 = !DILocation(line: 547, column: 14, scope: !779)
!840 = !DILocation(line: 548, column: 2, scope: !779)
!841 = !DILocation(line: 549, column: 3, scope: !842)
!842 = distinct !DILexicalBlock(scope: !779, file: !3, line: 548, column: 5)
!843 = !DILocation(line: 549, column: 15, scope: !842)
!844 = !DILocation(line: 550, column: 8, scope: !842)
!845 = !DILocation(line: 550, column: 21, scope: !842)
!846 = !DILocation(line: 550, column: 18, scope: !842)
!847 = !DILocation(line: 550, column: 6, scope: !842)
!848 = !DILocation(line: 551, column: 2, scope: !842)
!849 = !DILocation(line: 551, column: 11, scope: !779)
!850 = !DILocation(line: 551, column: 16, scope: !779)
!851 = !DILocation(line: 551, column: 14, scope: !779)
!852 = distinct !{!852, !840, !853}
!853 = !DILocation(line: 551, column: 19, scope: !779)
!854 = !DILocation(line: 553, column: 2, scope: !779)
!855 = !DILocation(line: 553, column: 12, scope: !779)
!856 = !DILocation(line: 555, column: 1, scope: !779)
!857 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 557, type: !16, scopeLine: 558, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !858)
!858 = !{!859, !860, !861, !862, !863, !864}
!859 = !DILocalVariable(name: "i", scope: !857, file: !3, line: 559, type: !230)
!860 = !DILocalVariable(name: "m", scope: !857, file: !3, line: 560, type: !42)
!861 = !DILocalVariable(name: "n", scope: !857, file: !3, line: 560, type: !42)
!862 = !DILocalVariable(name: "c", scope: !857, file: !3, line: 561, type: !6)
!863 = !DILocalVariable(name: "offset", scope: !857, file: !3, line: 561, type: !6)
!864 = !DILocalVariable(name: "op", scope: !865, file: !3, line: 575, type: !6)
!865 = distinct !DILexicalBlock(scope: !866, file: !3, line: 573, column: 32)
!866 = distinct !DILexicalBlock(scope: !867, file: !3, line: 573, column: 7)
!867 = distinct !DILexicalBlock(scope: !868, file: !3, line: 570, column: 44)
!868 = distinct !DILexicalBlock(scope: !869, file: !3, line: 570, column: 2)
!869 = distinct !DILexicalBlock(scope: !857, file: !3, line: 570, column: 2)
!870 = !DILocation(line: 559, column: 2, scope: !857)
!871 = !DILocation(line: 559, column: 6, scope: !857)
!872 = !DILocation(line: 560, column: 2, scope: !857)
!873 = !DILocation(line: 560, column: 10, scope: !857)
!874 = !DILocation(line: 560, column: 13, scope: !857)
!875 = !DILocation(line: 561, column: 2, scope: !857)
!876 = !DILocation(line: 561, column: 11, scope: !857)
!877 = !DILocation(line: 561, column: 14, scope: !857)
!878 = !DILocation(line: 563, column: 11, scope: !857)
!879 = !DILocation(line: 563, column: 22, scope: !857)
!880 = !DILocation(line: 563, column: 26, scope: !857)
!881 = !DILocation(line: 563, column: 9, scope: !857)
!882 = !DILocation(line: 565, column: 9, scope: !883)
!883 = distinct !DILexicalBlock(scope: !857, file: !3, line: 565, column: 2)
!884 = !DILocation(line: 565, column: 7, scope: !883)
!885 = !DILocation(line: 565, column: 14, scope: !886)
!886 = distinct !DILexicalBlock(scope: !883, file: !3, line: 565, column: 2)
!887 = !DILocation(line: 565, column: 18, scope: !886)
!888 = !DILocation(line: 565, column: 16, scope: !886)
!889 = !DILocation(line: 565, column: 2, scope: !883)
!890 = !DILocation(line: 566, column: 3, scope: !891)
!891 = distinct !DILexicalBlock(scope: !886, file: !3, line: 565, column: 31)
!892 = !DILocation(line: 566, column: 16, scope: !891)
!893 = !DILocation(line: 566, column: 19, scope: !891)
!894 = !DILocation(line: 567, column: 2, scope: !891)
!895 = !DILocation(line: 565, column: 26, scope: !886)
!896 = !DILocation(line: 565, column: 2, scope: !886)
!897 = distinct !{!897, !889, !898}
!898 = !DILocation(line: 567, column: 2, scope: !883)
!899 = !DILocation(line: 569, column: 4, scope: !857)
!900 = !DILocation(line: 570, column: 11, scope: !869)
!901 = !DILocation(line: 570, column: 9, scope: !869)
!902 = !DILocation(line: 570, column: 7, scope: !869)
!903 = !DILocation(line: 570, column: 19, scope: !868)
!904 = !DILocation(line: 570, column: 21, scope: !868)
!905 = !DILocation(line: 570, column: 2, scope: !869)
!906 = !DILocation(line: 572, column: 7, scope: !867)
!907 = !DILocation(line: 572, column: 5, scope: !867)
!908 = !DILocation(line: 573, column: 7, scope: !866)
!909 = !DILocation(line: 573, column: 11, scope: !866)
!910 = !DILocation(line: 573, column: 18, scope: !866)
!911 = !DILocation(line: 573, column: 9, scope: !866)
!912 = !DILocation(line: 573, column: 7, scope: !867)
!913 = !DILocation(line: 575, column: 4, scope: !865)
!914 = !DILocation(line: 575, column: 13, scope: !865)
!915 = !DILocation(line: 575, column: 18, scope: !865)
!916 = !DILocation(line: 575, column: 22, scope: !865)
!917 = !DILocation(line: 575, column: 20, scope: !865)
!918 = !DILocation(line: 577, column: 8, scope: !865)
!919 = !DILocation(line: 577, column: 20, scope: !865)
!920 = !DILocation(line: 577, column: 6, scope: !865)
!921 = !DILocation(line: 578, column: 9, scope: !865)
!922 = !DILocation(line: 578, column: 24, scope: !865)
!923 = !DILocation(line: 578, column: 22, scope: !865)
!924 = !DILocation(line: 578, column: 6, scope: !865)
!925 = !DILocation(line: 579, column: 3, scope: !866)
!926 = !DILocation(line: 579, column: 3, scope: !865)
!927 = !DILocation(line: 580, column: 6, scope: !928)
!928 = distinct !DILexicalBlock(scope: !866, file: !3, line: 579, column: 10)
!929 = !DILocation(line: 583, column: 7, scope: !867)
!930 = !DILocation(line: 583, column: 9, scope: !867)
!931 = !DILocation(line: 583, column: 5, scope: !867)
!932 = !DILocation(line: 584, column: 5, scope: !867)
!933 = !DILocation(line: 586, column: 21, scope: !867)
!934 = !DILocation(line: 586, column: 3, scope: !867)
!935 = !DILocation(line: 586, column: 16, scope: !867)
!936 = !DILocation(line: 586, column: 19, scope: !867)
!937 = !DILocation(line: 588, column: 2, scope: !867)
!938 = !DILocation(line: 570, column: 39, scope: !868)
!939 = !DILocation(line: 570, column: 2, scope: !868)
!940 = distinct !{!940, !905, !941}
!941 = !DILocation(line: 588, column: 2, scope: !869)
!942 = !DILocation(line: 590, column: 1, scope: !857)
!943 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 592, type: !16, scopeLine: 593, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !944)
!944 = !{!945, !946}
!945 = !DILocalVariable(name: "i", scope: !943, file: !3, line: 594, type: !230)
!946 = !DILocalVariable(name: "relation", scope: !943, file: !3, line: 595, type: !947)
!947 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!948 = !DILocation(line: 594, column: 2, scope: !943)
!949 = !DILocation(line: 594, column: 6, scope: !943)
!950 = !DILocation(line: 595, column: 2, scope: !943)
!951 = !DILocation(line: 595, column: 7, scope: !943)
!952 = !DILocation(line: 597, column: 9, scope: !953)
!953 = distinct !DILexicalBlock(scope: !943, file: !3, line: 597, column: 2)
!954 = !DILocation(line: 597, column: 7, scope: !953)
!955 = !DILocation(line: 597, column: 31, scope: !956)
!956 = distinct !DILexicalBlock(scope: !953, file: !3, line: 597, column: 2)
!957 = !DILocation(line: 597, column: 33, scope: !956)
!958 = !DILocation(line: 597, column: 2, scope: !953)
!959 = !DILocation(line: 599, column: 7, scope: !960)
!960 = distinct !DILexicalBlock(scope: !961, file: !3, line: 599, column: 7)
!961 = distinct !DILexicalBlock(scope: !956, file: !3, line: 597, column: 44)
!962 = !DILocation(line: 599, column: 19, scope: !960)
!963 = !DILocation(line: 599, column: 24, scope: !960)
!964 = !DILocation(line: 599, column: 37, scope: !960)
!965 = !DILocation(line: 599, column: 22, scope: !960)
!966 = !DILocation(line: 599, column: 7, scope: !961)
!967 = !DILocation(line: 600, column: 13, scope: !968)
!968 = distinct !DILexicalBlock(scope: !960, file: !3, line: 599, column: 41)
!969 = !DILocation(line: 601, column: 4, scope: !968)
!970 = !DILocation(line: 602, column: 14, scope: !971)
!971 = distinct !DILexicalBlock(scope: !960, file: !3, line: 602, column: 14)
!972 = !DILocation(line: 602, column: 26, scope: !971)
!973 = !DILocation(line: 602, column: 31, scope: !971)
!974 = !DILocation(line: 602, column: 44, scope: !971)
!975 = !DILocation(line: 602, column: 29, scope: !971)
!976 = !DILocation(line: 602, column: 14, scope: !960)
!977 = !DILocation(line: 603, column: 13, scope: !978)
!978 = distinct !DILexicalBlock(scope: !971, file: !3, line: 602, column: 48)
!979 = !DILocation(line: 604, column: 4, scope: !978)
!980 = !DILocation(line: 606, column: 2, scope: !961)
!981 = !DILocation(line: 597, column: 39, scope: !956)
!982 = !DILocation(line: 597, column: 2, scope: !956)
!983 = distinct !{!983, !958, !984}
!984 = !DILocation(line: 606, column: 2, scope: !953)
!985 = !DILocation(line: 608, column: 6, scope: !986)
!986 = distinct !DILexicalBlock(scope: !943, file: !3, line: 608, column: 6)
!987 = !DILocation(line: 608, column: 15, scope: !986)
!988 = !DILocation(line: 608, column: 6, scope: !943)
!989 = !DILocation(line: 609, column: 3, scope: !990)
!990 = distinct !DILexicalBlock(scope: !986, file: !3, line: 608, column: 23)
!991 = !DILocation(line: 609, column: 13, scope: !990)
!992 = !DILocation(line: 610, column: 2, scope: !990)
!993 = !DILocation(line: 611, column: 1, scope: !943)
!994 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 613, type: !16, scopeLine: 614, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !995)
!995 = !{!996, !997, !998, !999, !1000, !1001}
!996 = !DILocalVariable(name: "i", scope: !994, file: !3, line: 615, type: !230)
!997 = !DILocalVariable(name: "j", scope: !994, file: !3, line: 615, type: !230)
!998 = !DILocalVariable(name: "m", scope: !994, file: !3, line: 616, type: !42)
!999 = !DILocalVariable(name: "n", scope: !994, file: !3, line: 616, type: !42)
!1000 = !DILocalVariable(name: "c", scope: !994, file: !3, line: 616, type: !42)
!1001 = !DILocalVariable(name: "offset", scope: !994, file: !3, line: 617, type: !6)
!1002 = !DILocation(line: 615, column: 2, scope: !994)
!1003 = !DILocation(line: 615, column: 6, scope: !994)
!1004 = !DILocation(line: 615, column: 9, scope: !994)
!1005 = !DILocation(line: 616, column: 2, scope: !994)
!1006 = !DILocation(line: 616, column: 10, scope: !994)
!1007 = !DILocation(line: 616, column: 13, scope: !994)
!1008 = !DILocation(line: 616, column: 16, scope: !994)
!1009 = !DILocation(line: 617, column: 2, scope: !994)
!1010 = !DILocation(line: 617, column: 11, scope: !994)
!1011 = !DILocation(line: 619, column: 11, scope: !994)
!1012 = !DILocation(line: 619, column: 22, scope: !994)
!1013 = !DILocation(line: 619, column: 26, scope: !994)
!1014 = !DILocation(line: 619, column: 9, scope: !994)
!1015 = !DILocation(line: 621, column: 4, scope: !994)
!1016 = !DILocation(line: 622, column: 11, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !994, file: !3, line: 622, column: 2)
!1018 = !DILocation(line: 622, column: 9, scope: !1017)
!1019 = !DILocation(line: 622, column: 7, scope: !1017)
!1020 = !DILocation(line: 622, column: 19, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1017, file: !3, line: 622, column: 2)
!1022 = !DILocation(line: 622, column: 21, scope: !1021)
!1023 = !DILocation(line: 622, column: 2, scope: !1017)
!1024 = !DILocation(line: 623, column: 7, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 622, column: 44)
!1026 = !DILocation(line: 623, column: 19, scope: !1025)
!1027 = !DILocation(line: 623, column: 5, scope: !1025)
!1028 = !DILocation(line: 625, column: 7, scope: !1025)
!1029 = !DILocation(line: 625, column: 11, scope: !1025)
!1030 = !DILocation(line: 625, column: 9, scope: !1025)
!1031 = !DILocation(line: 625, column: 5, scope: !1025)
!1032 = !DILocation(line: 627, column: 7, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 627, column: 7)
!1034 = !DILocation(line: 627, column: 11, scope: !1033)
!1035 = !DILocation(line: 627, column: 18, scope: !1033)
!1036 = !DILocation(line: 627, column: 9, scope: !1033)
!1037 = !DILocation(line: 627, column: 7, scope: !1025)
!1038 = !DILocation(line: 628, column: 8, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1033, file: !3, line: 627, column: 32)
!1040 = !DILocation(line: 628, column: 20, scope: !1039)
!1041 = !DILocation(line: 628, column: 6, scope: !1039)
!1042 = !DILocation(line: 629, column: 3, scope: !1039)
!1043 = !DILocation(line: 630, column: 6, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1033, file: !3, line: 629, column: 10)
!1045 = !DILocation(line: 631, column: 6, scope: !1044)
!1046 = !DILocation(line: 634, column: 20, scope: !1025)
!1047 = !DILocation(line: 634, column: 24, scope: !1025)
!1048 = !DILocation(line: 634, column: 22, scope: !1025)
!1049 = !DILocation(line: 634, column: 28, scope: !1025)
!1050 = !DILocation(line: 634, column: 26, scope: !1025)
!1051 = !DILocation(line: 634, column: 3, scope: !1025)
!1052 = !DILocation(line: 634, column: 15, scope: !1025)
!1053 = !DILocation(line: 634, column: 18, scope: !1025)
!1054 = !DILocation(line: 636, column: 7, scope: !1025)
!1055 = !DILocation(line: 636, column: 19, scope: !1025)
!1056 = !DILocation(line: 636, column: 22, scope: !1025)
!1057 = !DILocation(line: 636, column: 5, scope: !1025)
!1058 = !DILocation(line: 637, column: 3, scope: !1025)
!1059 = !DILocation(line: 637, column: 15, scope: !1025)
!1060 = !DILocation(line: 637, column: 18, scope: !1025)
!1061 = !DILocation(line: 638, column: 2, scope: !1025)
!1062 = !DILocation(line: 622, column: 39, scope: !1021)
!1063 = !DILocation(line: 622, column: 2, scope: !1021)
!1064 = distinct !{!1064, !1023, !1065}
!1065 = !DILocation(line: 638, column: 2, scope: !1017)
!1066 = !DILocation(line: 640, column: 1, scope: !994)
!1067 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 642, type: !16, scopeLine: 643, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1068)
!1068 = !{!1069, !1070, !1071, !1072, !1073, !1074}
!1069 = !DILocalVariable(name: "i", scope: !1067, file: !3, line: 644, type: !230)
!1070 = !DILocalVariable(name: "m", scope: !1067, file: !3, line: 645, type: !42)
!1071 = !DILocalVariable(name: "s", scope: !1067, file: !3, line: 645, type: !42)
!1072 = !DILocalVariable(name: "qn", scope: !1067, file: !3, line: 645, type: !42)
!1073 = !DILocalVariable(name: "borrow", scope: !1067, file: !3, line: 646, type: !6)
!1074 = !DILocalVariable(name: "offset", scope: !1067, file: !3, line: 646, type: !6)
!1075 = !DILocation(line: 644, column: 2, scope: !1067)
!1076 = !DILocation(line: 644, column: 6, scope: !1067)
!1077 = !DILocation(line: 645, column: 2, scope: !1067)
!1078 = !DILocation(line: 645, column: 10, scope: !1067)
!1079 = !DILocation(line: 645, column: 13, scope: !1067)
!1080 = !DILocation(line: 645, column: 16, scope: !1067)
!1081 = !DILocation(line: 646, column: 2, scope: !1067)
!1082 = !DILocation(line: 646, column: 11, scope: !1067)
!1083 = !DILocation(line: 646, column: 19, scope: !1067)
!1084 = !DILocation(line: 648, column: 11, scope: !1067)
!1085 = !DILocation(line: 648, column: 22, scope: !1067)
!1086 = !DILocation(line: 648, column: 26, scope: !1067)
!1087 = !DILocation(line: 648, column: 9, scope: !1067)
!1088 = !DILocation(line: 650, column: 9, scope: !1067)
!1089 = !DILocation(line: 651, column: 9, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1067, file: !3, line: 651, column: 2)
!1091 = !DILocation(line: 651, column: 7, scope: !1090)
!1092 = !DILocation(line: 651, column: 14, scope: !1093)
!1093 = distinct !DILexicalBlock(scope: !1090, file: !3, line: 651, column: 2)
!1094 = !DILocation(line: 651, column: 16, scope: !1093)
!1095 = !DILocation(line: 651, column: 2, scope: !1090)
!1096 = !DILocation(line: 652, column: 7, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1093, file: !3, line: 651, column: 39)
!1098 = !DILocation(line: 652, column: 19, scope: !1097)
!1099 = !DILocation(line: 652, column: 5, scope: !1097)
!1100 = !DILocation(line: 654, column: 7, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1097, file: !3, line: 654, column: 7)
!1102 = !DILocation(line: 654, column: 12, scope: !1101)
!1103 = !DILocation(line: 654, column: 9, scope: !1101)
!1104 = !DILocation(line: 654, column: 7, scope: !1097)
!1105 = !DILocation(line: 655, column: 9, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 654, column: 20)
!1107 = !DILocation(line: 655, column: 22, scope: !1106)
!1108 = !DILocation(line: 655, column: 7, scope: !1106)
!1109 = !DILocation(line: 657, column: 8, scope: !1106)
!1110 = !DILocation(line: 657, column: 13, scope: !1106)
!1111 = !DILocation(line: 657, column: 11, scope: !1106)
!1112 = !DILocation(line: 657, column: 6, scope: !1106)
!1113 = !DILocation(line: 658, column: 8, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1106, file: !3, line: 658, column: 8)
!1115 = !DILocation(line: 658, column: 12, scope: !1114)
!1116 = !DILocation(line: 658, column: 10, scope: !1114)
!1117 = !DILocation(line: 658, column: 8, scope: !1106)
!1118 = !DILocation(line: 659, column: 7, scope: !1119)
!1119 = distinct !DILexicalBlock(scope: !1114, file: !3, line: 658, column: 15)
!1120 = !DILocation(line: 660, column: 12, scope: !1119)
!1121 = !DILocation(line: 661, column: 4, scope: !1119)
!1122 = !DILocation(line: 662, column: 12, scope: !1123)
!1123 = distinct !DILexicalBlock(scope: !1114, file: !3, line: 661, column: 11)
!1124 = !DILocation(line: 664, column: 21, scope: !1106)
!1125 = !DILocation(line: 664, column: 25, scope: !1106)
!1126 = !DILocation(line: 664, column: 23, scope: !1106)
!1127 = !DILocation(line: 664, column: 4, scope: !1106)
!1128 = !DILocation(line: 664, column: 16, scope: !1106)
!1129 = !DILocation(line: 664, column: 19, scope: !1106)
!1130 = !DILocation(line: 666, column: 3, scope: !1106)
!1131 = !DILocation(line: 667, column: 2, scope: !1097)
!1132 = !DILocation(line: 651, column: 34, scope: !1093)
!1133 = !DILocation(line: 651, column: 2, scope: !1093)
!1134 = distinct !{!1134, !1095, !1135}
!1135 = !DILocation(line: 667, column: 2, scope: !1090)
!1136 = !DILocation(line: 668, column: 1, scope: !1067)
!1137 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 670, type: !16, scopeLine: 670, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!1138 = !DILocation(line: 672, column: 1, scope: !1137)
!1139 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 675, type: !1140, scopeLine: 675, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{!230}
!1142 = !DILocation(line: 677, column: 16, scope: !1139)
!1143 = !DILocation(line: 678, column: 10, scope: !1139)
!1144 = !DILocation(line: 679, column: 12, scope: !1139)
!1145 = !DILocation(line: 110, column: 10, scope: !99, inlinedAt: !1146)
!1146 = distinct !DILocation(line: 680, column: 5, scope: !1139)
!1147 = !DILocation(line: 112, column: 9, scope: !99, inlinedAt: !1146)
!1148 = !DILocation(line: 114, column: 9, scope: !99, inlinedAt: !1146)
!1149 = !DILocation(line: 119, column: 11, scope: !99, inlinedAt: !1146)
!1150 = !DILocation(line: 124, column: 12, scope: !99, inlinedAt: !1146)
!1151 = !DILocation(line: 125, column: 10, scope: !99, inlinedAt: !1146)
!1152 = !DILocation(line: 126, column: 10, scope: !99, inlinedAt: !1146)
!1153 = !DILocation(line: 128, column: 10, scope: !99, inlinedAt: !1146)
!1154 = !DILocation(line: 129, column: 12, scope: !99, inlinedAt: !1146)
!1155 = !DILocation(line: 132, column: 10, scope: !99, inlinedAt: !1146)
!1156 = !DILocation(line: 682, column: 2, scope: !1139)
!1157 = !DILocation(line: 684, column: 3, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1139, file: !3, line: 682, column: 12)
!1159 = !DILocation(line: 686, column: 3, scope: !1158)
!1160 = !DILocation(line: 688, column: 8, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 688, column: 8)
!1162 = distinct !DILexicalBlock(scope: !1158, file: !3, line: 686, column: 13)
!1163 = !DILocation(line: 688, column: 19, scope: !1161)
!1164 = !DILocation(line: 688, column: 8, scope: !1162)
!1165 = !DILocation(line: 690, column: 5, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1161, file: !3, line: 688, column: 25)
!1167 = !DILocation(line: 694, column: 8, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 694, column: 8)
!1169 = !DILocation(line: 692, column: 4, scope: !1166)
!1170 = !DILocation(line: 694, column: 19, scope: !1168)
!1171 = !DILocation(line: 694, column: 8, scope: !1162)
!1172 = !DILocation(line: 696, column: 5, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1168, file: !3, line: 694, column: 25)
!1174 = !DILocation(line: 700, column: 8, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 700, column: 8)
!1176 = !DILocation(line: 698, column: 4, scope: !1173)
!1177 = !DILocation(line: 700, column: 8, scope: !1162)
!1178 = !DILocation(line: 702, column: 5, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1175, file: !3, line: 700, column: 25)
!1180 = !DILocation(line: 704, column: 4, scope: !1179)
!1181 = !DILocation(line: 706, column: 5, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1183, file: !3, line: 704, column: 32)
!1183 = distinct !DILexicalBlock(scope: !1175, file: !3, line: 704, column: 15)
!1184 = !DILocation(line: 708, column: 4, scope: !1182)
!1185 = !DILocation(line: 0, scope: !1175)
!1186 = !DILocation(line: 710, column: 4, scope: !1162)
!1187 = !DILocation(line: 712, column: 4, scope: !1162)
!1188 = !DILocation(line: 714, column: 5, scope: !1189)
!1189 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 712, column: 7)
!1190 = !DILocation(line: 716, column: 13, scope: !1162)
!1191 = !DILocation(line: 716, column: 24, scope: !1162)
!1192 = !DILocation(line: 716, column: 4, scope: !1189)
!1193 = distinct !{!1193, !1187, !1194}
!1194 = !DILocation(line: 716, column: 40, scope: !1162)
!1195 = !DILocation(line: 718, column: 4, scope: !1162)
!1196 = !DILocation(line: 720, column: 8, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 720, column: 8)
!1198 = !DILocation(line: 720, column: 19, scope: !1197)
!1199 = !DILocation(line: 720, column: 8, scope: !1162)
!1200 = distinct !{!1200, !1156, !1201}
!1201 = !DILocation(line: 764, column: 2, scope: !1139)
!1202 = !DILocation(line: 723, column: 4, scope: !1162)
!1203 = !DILocation(line: 725, column: 8, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 725, column: 8)
!1205 = !DILocation(line: 725, column: 19, scope: !1204)
!1206 = !DILocation(line: 725, column: 8, scope: !1162)
!1207 = !DILocation(line: 727, column: 5, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 725, column: 25)
!1209 = !DILocation(line: 731, column: 8, scope: !1210)
!1210 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 731, column: 8)
!1211 = !DILocation(line: 729, column: 4, scope: !1208)
!1212 = !DILocation(line: 731, column: 19, scope: !1210)
!1213 = !DILocation(line: 731, column: 8, scope: !1162)
!1214 = !DILocation(line: 733, column: 5, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !3, line: 731, column: 25)
!1216 = !DILocation(line: 735, column: 5, scope: !1215)
!1217 = !DILocation(line: 737, column: 6, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1215, file: !3, line: 735, column: 8)
!1219 = !DILocation(line: 739, column: 6, scope: !1218)
!1220 = !DILocation(line: 741, column: 6, scope: !1218)
!1221 = !DILocation(line: 743, column: 10, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1218, file: !3, line: 743, column: 10)
!1223 = !DILocation(line: 743, column: 21, scope: !1222)
!1224 = !DILocation(line: 743, column: 10, scope: !1218)
!1225 = !DILocation(line: 745, column: 7, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1222, file: !3, line: 743, column: 27)
!1227 = !DILocation(line: 747, column: 6, scope: !1226)
!1228 = !DILocation(line: 749, column: 6, scope: !1218)
!1229 = !DILocation(line: 751, column: 13, scope: !1215)
!1230 = !DILocation(line: 751, column: 25, scope: !1215)
!1231 = !DILocation(line: 751, column: 29, scope: !1215)
!1232 = !DILocation(line: 751, column: 5, scope: !1218)
!1233 = distinct !{!1233, !1216, !1234}
!1234 = !DILocation(line: 751, column: 41, scope: !1215)
!1235 = !DILocation(line: 754, column: 8, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1162, file: !3, line: 754, column: 8)
!1237 = !DILocation(line: 754, column: 8, scope: !1162)
!1238 = distinct !{!1238, !1159, !1239}
!1239 = !DILocation(line: 763, column: 3, scope: !1158)
!1240 = !DILocation(line: 756, column: 5, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1236, file: !3, line: 754, column: 31)
!1242 = !DILocation(line: 758, column: 4, scope: !1241)
!1243 = !DILocation(line: 760, column: 5, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1245, file: !3, line: 758, column: 38)
!1245 = distinct !DILexicalBlock(scope: !1236, file: !3, line: 758, column: 15)
!1246 = !DILocation(line: 762, column: 4, scope: !1244)
