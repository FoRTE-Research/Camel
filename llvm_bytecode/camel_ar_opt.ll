; ModuleID = 'camel_ar_opt.bc'
source_filename = "../benchmarks/camel_ar.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, i16, [3 x %struct.threeAxis_t_8], %struct.features_t, [16 x %struct.features_t], [16 x %struct.features_t], i16, i16, i16, i16, i16 }
%struct.threeAxis_t_8 = type { i8, i8, i8 }
%struct.features_t = type { i16, i16 }

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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !32
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !86
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !23
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !30
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !18
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !88
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !100 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !102, !tbaa !103
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !107, !tbaa !108
  %1 = or i8 %0, 1, !dbg !107
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !107, !tbaa !108
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !109, !tbaa !108
  %3 = and i8 %2, -2, !dbg !109
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !109, !tbaa !108
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !110, !tbaa !103
  %and4 = and i16 %4, -2, !dbg !110
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !110, !tbaa !103
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !111, !tbaa !108
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !112, !tbaa !103
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !113, !tbaa !103
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !114, !tbaa !103
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !115, !tbaa !108
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !116, !tbaa !103
  ret void, !dbg !117
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !118 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !124, !tbaa !126
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !132

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !133, !tbaa !135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !137, !tbaa !135
  br label %if.end4, !dbg !138

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !139, !tbaa !135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !142, !tbaa !135
  br label %if.end4, !dbg !143

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #13, !dbg !144
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !146, !tbaa !135
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !146
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !146
  %2 = load i16, i16* %arrayidx, align 2, !dbg !146, !tbaa !148
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #13, !dbg !146, !srcloc !149
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !150, !srcloc !151
  call void @llvm.dbg.value(metadata i16 %3, metadata !120, metadata !DIExpression()), !dbg !152
  %add = add i16 %3, 2, !dbg !153
  %4 = inttoptr i16 %add to i8*, !dbg !154
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !155, !srcloc !156
  call void @llvm.dbg.value(metadata i16 %5, metadata !122, metadata !DIExpression()), !dbg !157
  %sub = sub i16 9214, %5, !dbg !158
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #13, !dbg !159
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !160, !tbaa !148
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !161, !tbaa !135
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 186, i16 zeroext %call) #13, !dbg !162
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !163, !tbaa !148
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !164, !tbaa !135
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !166
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !166, !tbaa !167
  %cmp9 = icmp eq i16 %call8, %8, !dbg !168
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !169

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !170, !tbaa !135
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !172
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(188) %9, i8* nonnull align 2 dereferenceable(188) %10, i16 188, i1 false), !dbg !172
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !173, !tbaa !103
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !175, !tbaa !108
  %12 = or i8 %11, 1, !dbg !175
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !175, !tbaa !108
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !176, !tbaa !108
  %14 = and i8 %13, -2, !dbg !176
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !176, !tbaa !108
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !177, !tbaa !103
  %and4.i = and i16 %15, -2, !dbg !177
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !177, !tbaa !103
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !178, !tbaa !108
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !179, !tbaa !103
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !180, !tbaa !103
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !181, !tbaa !103
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !182, !tbaa !108
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !183, !tbaa !103
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !184, !tbaa !135
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !184
  tail call void @__restore_registers(i16* %arraydecay) #13, !dbg !185
  br label %if.end13, !dbg !186

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #13, !dbg !187
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !189
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
define dso_local void @commit() local_unnamed_addr #5 !dbg !190 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !204, !tbaa !126
  %cmp = icmp eq i16 %0, 1, !dbg !205
  br i1 %cmp, label %if.then, label %if.else, !dbg !206

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !207, !tbaa !135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !208, !tbaa !135
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #13, !dbg !209
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !210, !srcloc !211
  call void @llvm.dbg.value(metadata i16 %1, metadata !192, metadata !DIExpression()), !dbg !212
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !213, !srcloc !214
  call void @llvm.dbg.value(metadata i16 %2, metadata !197, metadata !DIExpression()), !dbg !215
  br label %do.end, !dbg !216

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !217, !tbaa !135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !218, !tbaa !135
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #13, !dbg !219
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !220, !srcloc !221
  call void @llvm.dbg.value(metadata i16 %3, metadata !199, metadata !DIExpression()), !dbg !222
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !223, !srcloc !224
  call void @llvm.dbg.value(metadata i16 %4, metadata !202, metadata !DIExpression()), !dbg !225
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink7 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !226
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !226
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !226
  %sub = sub i16 9214, %.sink7, !dbg !226
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #13, !dbg !226
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !226, !tbaa !148
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !226, !tbaa !135
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 186, i16 zeroext %call) #13, !dbg !226
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !226, !tbaa !148
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !226, !tbaa !135
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !226
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !226, !tbaa !167
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !226, !tbaa !126
  ret void, !dbg !227
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind writeonly
define dso_local i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* nocapture %result, i16 %seed) local_unnamed_addr #6 !dbg !228 {
entry:
  call void @llvm.dbg.value(metadata %struct.threeAxis_t_8* %result, metadata !233, metadata !DIExpression()), !dbg !235
  call void @llvm.dbg.value(metadata i16 %seed, metadata !234, metadata !DIExpression()), !dbg !235
  %mul = mul i16 %seed, 17, !dbg !236
  %rem = urem i16 %mul, 85, !dbg !237
  %conv = trunc i16 %rem to i8, !dbg !238
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %result, i16 0, i32 0, !dbg !239
  store i8 %conv, i8* %x, align 1, !dbg !240, !tbaa !241
  %mul2 = mul i16 %seed, 289, !dbg !243
  %rem3 = urem i16 %mul2, 85, !dbg !244
  %conv4 = trunc i16 %rem3 to i8, !dbg !245
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %result, i16 0, i32 1, !dbg !246
  store i8 %conv4, i8* %y, align 1, !dbg !247, !tbaa !248
  %mul7 = mul i16 %seed, 4913, !dbg !249
  %rem8 = urem i16 %mul7, 85, !dbg !250
  %conv9 = trunc i16 %rem8 to i8, !dbg !251
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %result, i16 0, i32 2, !dbg !252
  store i8 %conv9, i8* %z, align 1, !dbg !253, !tbaa !254
  %inc = add i16 %seed, 1, !dbg !255
  call void @llvm.dbg.value(metadata i16 %inc, metadata !234, metadata !DIExpression()), !dbg !235
  ret i16 %inc, !dbg !256
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() local_unnamed_addr #7 !dbg !257 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !258
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !258
  store i16 3, i16* %pinState, align 2, !dbg !259, !tbaa !260
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !261, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !261
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !261
  store i16 0, i16* %count, align 2, !dbg !262, !tbaa !263
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !264
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !264
  store i16 1, i16* %seed, align 2, !dbg !265, !tbaa !266
  ret void, !dbg !267
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_selectMode() local_unnamed_addr #7 !dbg !268 {
entry:
  %pin_state = alloca i16, align 2
  %mode = alloca i16, align 2
  %class = alloca i16, align 2
  %0 = bitcast i16* %pin_state to i8*, !dbg !273
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !273
  call void @llvm.dbg.declare(metadata i16* %pin_state, metadata !270, metadata !DIExpression()), !dbg !274
  store i16 1, i16* %pin_state, align 2, !dbg !274, !tbaa !148
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !275
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !275
  %2 = load i16, i16* %count, align 2, !dbg !276, !tbaa !263
  %inc = add i16 %2, 1, !dbg !276
  store i16 %inc, i16* %count, align 2, !dbg !276, !tbaa !263
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !277
  %count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !277
  %4 = load i16, i16* %count2, align 2, !dbg !277, !tbaa !263
  %cmp = icmp uge i16 %4, 3, !dbg !279
  br i1 %cmp, label %if.then, label %if.end, !dbg !280

if.then:                                          ; preds = %entry
  store i16 2, i16* %pin_state, align 2, !dbg !281, !tbaa !148
  br label %if.end, !dbg !282

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283, !tbaa !135
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !283
  %count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !283
  %6 = load i16, i16* %count4, align 2, !dbg !283, !tbaa !263
  %cmp5 = icmp uge i16 %6, 5, !dbg !285
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !286

if.then6:                                         ; preds = %if.end
  store i16 0, i16* %pin_state, align 2, !dbg !287, !tbaa !148
  br label %if.end7, !dbg !288

if.end7:                                          ; preds = %if.then6, %if.end
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289, !tbaa !135
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !289
  %count9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 14, !dbg !289
  %8 = load i16, i16* %count9, align 2, !dbg !289, !tbaa !263
  %cmp10 = icmp uge i16 %8, 7, !dbg !291
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !292

if.then11:                                        ; preds = %if.end7
  call void @task_done(), !dbg !293
  unreachable

if.end12:                                         ; preds = %if.end7
  %9 = bitcast i16* %mode to i8*, !dbg !295
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %9) #13, !dbg !295
  call void @llvm.dbg.declare(metadata i16* %mode, metadata !271, metadata !DIExpression()), !dbg !296
  %10 = bitcast i16* %class to i8*, !dbg !297
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #13, !dbg !297
  call void @llvm.dbg.declare(metadata i16* %class, metadata !272, metadata !DIExpression()), !dbg !298
  %11 = load i16, i16* %pin_state, align 2, !dbg !299, !tbaa !148
  %cmp13 = icmp eq i16 %11, 2, !dbg !301
  br i1 %cmp13, label %land.lhs.true, label %lor.lhs.false, !dbg !302

lor.lhs.false:                                    ; preds = %if.end12
  %12 = load i16, i16* %pin_state, align 2, !dbg !303, !tbaa !148
  %cmp14 = icmp eq i16 %12, 1, !dbg !304
  br i1 %cmp14, label %land.lhs.true, label %if.else, !dbg !305

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end12
  %13 = load i16, i16* %pin_state, align 2, !dbg !306, !tbaa !148
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307, !tbaa !135
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !307
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !307
  %15 = load i16, i16* %pinState, align 2, !dbg !307, !tbaa !260
  %cmp16 = icmp eq i16 %13, %15, !dbg !308
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !309

if.then17:                                        ; preds = %land.lhs.true
  store i16 3, i16* %pin_state, align 2, !dbg !310, !tbaa !148
  br label %if.end20, !dbg !312

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %16 = load i16, i16* %pin_state, align 2, !dbg !313, !tbaa !148
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315, !tbaa !135
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !315
  %pinState19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 0, !dbg !315
  store i16 %16, i16* %pinState19, align 2, !dbg !316, !tbaa !260
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  %18 = load i16, i16* %pin_state, align 2, !dbg !317, !tbaa !148
  switch i16 %18, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb27
    i16 0, label %sw.bb36
  ], !dbg !318

sw.bb:                                            ; preds = %if.end20
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319, !tbaa !135
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !319
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 1, !dbg !319
  store i16 0, i16* %discardedSamplesCount, align 2, !dbg !321, !tbaa !322
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323, !tbaa !135
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !323
  %mode23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 12, !dbg !323
  store i16 2, i16* %mode23, align 2, !dbg !324, !tbaa !325
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !326, !tbaa !135
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !326
  %class25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 2, !dbg !326
  store i16 0, i16* %class25, align 2, !dbg !327, !tbaa !328
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329, !tbaa !135
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !329
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 11, !dbg !329
  store i16 0, i16* %samplesInWindow, align 2, !dbg !330, !tbaa !331
  br label %sw.epilog, !dbg !332

sw.bb27:                                          ; preds = %if.end20
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333, !tbaa !135
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !333
  %discardedSamplesCount29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 1, !dbg !333
  store i16 0, i16* %discardedSamplesCount29, align 2, !dbg !334, !tbaa !322
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335, !tbaa !135
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !335
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !335
  store i16 1, i16* %mode31, align 2, !dbg !336, !tbaa !325
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337, !tbaa !135
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !337
  %class33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 2, !dbg !337
  store i16 1, i16* %class33, align 2, !dbg !338, !tbaa !328
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !339, !tbaa !135
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !339
  %samplesInWindow35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 11, !dbg !339
  store i16 0, i16* %samplesInWindow35, align 2, !dbg !340, !tbaa !331
  br label %sw.epilog, !dbg !341

sw.bb36:                                          ; preds = %if.end20
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !342, !tbaa !135
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !342
  %mode38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 12, !dbg !342
  store i16 0, i16* %mode38, align 2, !dbg !343, !tbaa !325
  br label %sw.epilog, !dbg !344

sw.default:                                       ; preds = %if.end20
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345, !tbaa !135
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !345
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !345
  store i16 3, i16* %mode40, align 2, !dbg !346, !tbaa !325
  br label %sw.epilog, !dbg !347

sw.epilog:                                        ; preds = %sw.default, %sw.bb36, %sw.bb27, %sw.bb
  %29 = bitcast i16* %class to i8*, !dbg !348
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #13, !dbg !348
  %30 = bitcast i16* %mode to i8*, !dbg !348
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #13, !dbg !348
  %31 = bitcast i16* %pin_state to i8*, !dbg !348
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #13, !dbg !348
  ret void, !dbg !348
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_resetStats() local_unnamed_addr #7 !dbg !349 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !350
  %movingCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !350
  store i16 0, i16* %movingCount, align 2, !dbg !351, !tbaa !352
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !353
  %stationaryCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !353
  store i16 0, i16* %stationaryCount, align 2, !dbg !354, !tbaa !355
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !356
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !356
  store i16 0, i16* %totalCount, align 2, !dbg !357, !tbaa !358
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359, !tbaa !135
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !359
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !359
  store i16 0, i16* %samplesInWindow, align 2, !dbg !360, !tbaa !331
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() local_unnamed_addr #7 !dbg !362 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  %0 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !365
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #13, !dbg !365
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !364, metadata !DIExpression()), !dbg !366
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !367
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !367
  %2 = load i16, i16* %seed, align 2, !dbg !367, !tbaa !266
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %2), !dbg !368
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !369
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !369
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !370
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 11, !dbg !370
  %5 = load i16, i16* %samplesInWindow, align 2, !dbg !370, !tbaa !331
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %5, !dbg !369
  %6 = bitcast %struct.threeAxis_t_8* %arrayidx to i8*, !dbg !371
  %7 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !371
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 1 %6, i8* align 1 %7, i16 3, i1 false), !dbg !371, !tbaa.struct !372
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !373, !tbaa !135
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !373
  %samplesInWindow4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !373
  %9 = load i16, i16* %samplesInWindow4, align 2, !dbg !374, !tbaa !331
  %inc = add i16 %9, 1, !dbg !374
  store i16 %inc, i16* %samplesInWindow4, align 2, !dbg !374, !tbaa !331
  %10 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !375
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %10) #13, !dbg !375
  ret void, !dbg !375
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_transform() local_unnamed_addr #7 !dbg !376 {
entry:
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !383, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !383
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !383
  store i16 0, i16* %samplesInWindow, align 2, !dbg !384, !tbaa !331
  %1 = bitcast %struct.threeAxis_t_8** %sample to i8*, !dbg !385
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #13, !dbg !385
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !378, metadata !DIExpression()), !dbg !386
  %2 = bitcast %struct.threeAxis_t_8* %transformedSample to i8*, !dbg !387
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %2) #13, !dbg !387
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !380, metadata !DIExpression()), !dbg !388
  %3 = bitcast i16* %i to i8*, !dbg !389
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #13, !dbg !389
  call void @llvm.dbg.declare(metadata i16* %i, metadata !381, metadata !DIExpression()), !dbg !390
  store i16 0, i16* %i, align 2, !dbg !390, !tbaa !103
  br label %for.cond, !dbg !389

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !391, !tbaa !103
  %cmp = icmp ult i16 %4, 3, !dbg !393
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !394

for.cond.cleanup:                                 ; preds = %for.cond
  %5 = bitcast i16* %i to i8*, !dbg !395
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #13, !dbg !395
  br label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !396
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !396
  %7 = load i16, i16* %i, align 2, !dbg !399, !tbaa !103
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %7, !dbg !396
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !400
  %8 = load i8, i8* %x, align 1, !dbg !400, !tbaa !241
  %conv = sext i8 %8 to i16, !dbg !396
  %cmp2 = icmp slt i16 %conv, 10, !dbg !401
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !402

lor.lhs.false:                                    ; preds = %for.body
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403, !tbaa !135
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !403
  %window5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !403
  %10 = load i16, i16* %i, align 2, !dbg !404, !tbaa !103
  %arrayidx6 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window5, i16 0, i16 %10, !dbg !403
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx6, i32 0, i32 1, !dbg !405
  %11 = load i8, i8* %y, align 1, !dbg !405, !tbaa !248
  %conv7 = sext i8 %11 to i16, !dbg !403
  %cmp8 = icmp slt i16 %conv7, 10, !dbg !406
  br i1 %cmp8, label %if.then, label %lor.lhs.false10, !dbg !407

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408, !tbaa !135
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !408
  %window12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !408
  %13 = load i16, i16* %i, align 2, !dbg !409, !tbaa !103
  %arrayidx13 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window12, i16 0, i16 %13, !dbg !408
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx13, i32 0, i32 2, !dbg !410
  %14 = load i8, i8* %z, align 1, !dbg !410, !tbaa !254
  %conv14 = sext i8 %14 to i16, !dbg !408
  %cmp15 = icmp slt i16 %conv14, 10, !dbg !411
  br i1 %cmp15, label %if.then, label %if.end, !dbg !412

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %for.body
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413, !tbaa !135
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !413
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !413
  %16 = load i16, i16* %i, align 2, !dbg !415, !tbaa !103
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %16, !dbg !413
  %x20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 0, !dbg !416
  %17 = load i8, i8* %x20, align 1, !dbg !416, !tbaa !241
  %conv21 = sext i8 %17 to i16, !dbg !413
  %cmp22 = icmp sgt i16 %conv21, 10, !dbg !417
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !418

cond.true:                                        ; preds = %if.then
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419, !tbaa !135
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !419
  %window25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 6, !dbg !419
  %19 = load i16, i16* %i, align 2, !dbg !420, !tbaa !103
  %arrayidx26 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window25, i16 0, i16 %19, !dbg !419
  %x27 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx26, i32 0, i32 0, !dbg !421
  %20 = load i8, i8* %x27, align 1, !dbg !421, !tbaa !241
  %conv28 = sext i8 %20 to i16, !dbg !419
  br label %cond.end, !dbg !418

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !418

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv28, %cond.true ], [ 0, %cond.false ], !dbg !418
  %conv29 = trunc i16 %cond to i8, !dbg !418
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !422, !tbaa !135
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !422
  %window31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 6, !dbg !422
  %22 = load i16, i16* %i, align 2, !dbg !423, !tbaa !103
  %arrayidx32 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window31, i16 0, i16 %22, !dbg !422
  %x33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx32, i32 0, i32 0, !dbg !424
  store i8 %conv29, i8* %x33, align 1, !dbg !425, !tbaa !241
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426, !tbaa !135
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !426
  %window35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 6, !dbg !426
  %24 = load i16, i16* %i, align 2, !dbg !427, !tbaa !103
  %arrayidx36 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window35, i16 0, i16 %24, !dbg !426
  %y37 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx36, i32 0, i32 1, !dbg !428
  %25 = load i8, i8* %y37, align 1, !dbg !428, !tbaa !248
  %conv38 = sext i8 %25 to i16, !dbg !426
  %cmp39 = icmp sgt i16 %conv38, 10, !dbg !429
  br i1 %cmp39, label %cond.true41, label %cond.false47, !dbg !430

cond.true41:                                      ; preds = %cond.end
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !431, !tbaa !135
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !431
  %window43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 6, !dbg !431
  %27 = load i16, i16* %i, align 2, !dbg !432, !tbaa !103
  %arrayidx44 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window43, i16 0, i16 %27, !dbg !431
  %y45 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx44, i32 0, i32 1, !dbg !433
  %28 = load i8, i8* %y45, align 1, !dbg !433, !tbaa !248
  %conv46 = sext i8 %28 to i16, !dbg !431
  br label %cond.end48, !dbg !430

cond.false47:                                     ; preds = %cond.end
  br label %cond.end48, !dbg !430

cond.end48:                                       ; preds = %cond.false47, %cond.true41
  %cond49 = phi i16 [ %conv46, %cond.true41 ], [ 0, %cond.false47 ], !dbg !430
  %conv50 = trunc i16 %cond49 to i8, !dbg !430
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !434, !tbaa !135
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !434
  %window52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 6, !dbg !434
  %30 = load i16, i16* %i, align 2, !dbg !435, !tbaa !103
  %arrayidx53 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window52, i16 0, i16 %30, !dbg !434
  %y54 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx53, i32 0, i32 1, !dbg !436
  store i8 %conv50, i8* %y54, align 1, !dbg !437, !tbaa !248
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438, !tbaa !135
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !438
  %window56 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 6, !dbg !438
  %32 = load i16, i16* %i, align 2, !dbg !439, !tbaa !103
  %arrayidx57 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window56, i16 0, i16 %32, !dbg !438
  %z58 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx57, i32 0, i32 2, !dbg !440
  %33 = load i8, i8* %z58, align 1, !dbg !440, !tbaa !254
  %conv59 = sext i8 %33 to i16, !dbg !438
  %cmp60 = icmp sgt i16 %conv59, 10, !dbg !441
  br i1 %cmp60, label %cond.true62, label %cond.false68, !dbg !442

cond.true62:                                      ; preds = %cond.end48
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443, !tbaa !135
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !443
  %window64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 6, !dbg !443
  %35 = load i16, i16* %i, align 2, !dbg !444, !tbaa !103
  %arrayidx65 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window64, i16 0, i16 %35, !dbg !443
  %z66 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx65, i32 0, i32 2, !dbg !445
  %36 = load i8, i8* %z66, align 1, !dbg !445, !tbaa !254
  %conv67 = sext i8 %36 to i16, !dbg !443
  br label %cond.end69, !dbg !442

cond.false68:                                     ; preds = %cond.end48
  br label %cond.end69, !dbg !442

cond.end69:                                       ; preds = %cond.false68, %cond.true62
  %cond70 = phi i16 [ %conv67, %cond.true62 ], [ 0, %cond.false68 ], !dbg !442
  %conv71 = trunc i16 %cond70 to i8, !dbg !442
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446, !tbaa !135
  %globals72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !446
  %window73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals72, i32 0, i32 6, !dbg !446
  %38 = load i16, i16* %i, align 2, !dbg !447, !tbaa !103
  %arrayidx74 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window73, i16 0, i16 %38, !dbg !446
  %z75 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx74, i32 0, i32 2, !dbg !448
  store i8 %conv71, i8* %z75, align 1, !dbg !449, !tbaa !254
  br label %if.end, !dbg !450

if.end:                                           ; preds = %cond.end69, %lor.lhs.false10
  br label %for.inc, !dbg !451

for.inc:                                          ; preds = %if.end
  %39 = load i16, i16* %i, align 2, !dbg !452, !tbaa !103
  %inc = add i16 %39, 1, !dbg !452
  store i16 %inc, i16* %i, align 2, !dbg !452, !tbaa !103
  br label %for.cond, !dbg !395, !llvm.loop !453

for.end:                                          ; preds = %for.cond.cleanup
  %40 = bitcast %struct.threeAxis_t_8* %transformedSample to i8*, !dbg !455
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %40) #13, !dbg !455
  %41 = bitcast %struct.threeAxis_t_8** %sample to i8*, !dbg !455
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %41) #13, !dbg !455
  ret void, !dbg !455
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_featurize() local_unnamed_addr #7 !dbg !456 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  %0 = bitcast %struct.threeAxis_t_8* %mean to i8*, !dbg !465
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #13, !dbg !465
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !458, metadata !DIExpression()), !dbg !466
  %1 = bitcast %struct.threeAxis_t_8* %stddev to i8*, !dbg !465
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %1) #13, !dbg !465
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !459, metadata !DIExpression()), !dbg !467
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !468
  store i8 0, i8* %z, align 1, !dbg !469, !tbaa !254
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !470
  store i8 0, i8* %y, align 1, !dbg !471, !tbaa !248
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !472
  store i8 0, i8* %x, align 1, !dbg !473, !tbaa !241
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !474
  store i8 0, i8* %z1, align 1, !dbg !475, !tbaa !254
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !476
  store i8 0, i8* %y2, align 1, !dbg !477, !tbaa !248
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !478
  store i8 0, i8* %x3, align 1, !dbg !479, !tbaa !241
  %2 = bitcast %struct.features_t* %features to i8*, !dbg !480
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13, !dbg !480
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !460, metadata !DIExpression()), !dbg !481
  %3 = bitcast i16* %i to i8*, !dbg !482
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #13, !dbg !482
  call void @llvm.dbg.declare(metadata i16* %i, metadata !461, metadata !DIExpression()), !dbg !483
  store i16 0, i16* %i, align 2, !dbg !484, !tbaa !103
  br label %for.cond, !dbg !486

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !487, !tbaa !103
  %cmp = icmp slt i16 %4, 3, !dbg !489
  br i1 %cmp, label %for.body, label %for.end, !dbg !490

for.body:                                         ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !491, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !491
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !491
  %6 = load i16, i16* %i, align 2, !dbg !493, !tbaa !103
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %6, !dbg !491
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !494
  %7 = load i8, i8* %x4, align 1, !dbg !494, !tbaa !241
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !495
  %8 = load i8, i8* %x5, align 1, !dbg !496, !tbaa !241
  %add = add i8 %8, %7, !dbg !496
  store i8 %add, i8* %x5, align 1, !dbg !496, !tbaa !241
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !497, !tbaa !135
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !497
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !497
  %10 = load i16, i16* %i, align 2, !dbg !498, !tbaa !103
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %10, !dbg !497
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !499
  %11 = load i8, i8* %y11, align 1, !dbg !499, !tbaa !248
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !500
  %12 = load i8, i8* %y13, align 1, !dbg !501, !tbaa !248
  %add15 = add i8 %12, %11, !dbg !501
  store i8 %add15, i8* %y13, align 1, !dbg !501, !tbaa !248
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !502, !tbaa !135
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !502
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !502
  %14 = load i16, i16* %i, align 2, !dbg !503, !tbaa !103
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %14, !dbg !502
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !504
  %15 = load i8, i8* %z20, align 1, !dbg !504, !tbaa !254
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !505
  %16 = load i8, i8* %z22, align 1, !dbg !506, !tbaa !254
  %add24 = add i8 %16, %15, !dbg !506
  store i8 %add24, i8* %z22, align 1, !dbg !506, !tbaa !254
  br label %for.inc, !dbg !507

for.inc:                                          ; preds = %for.body
  %17 = load i16, i16* %i, align 2, !dbg !508, !tbaa !103
  %inc = add nsw i16 %17, 1, !dbg !508
  store i16 %inc, i16* %i, align 2, !dbg !508, !tbaa !103
  br label %for.cond, !dbg !509, !llvm.loop !510

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !512
  %18 = load i8, i8* %x26, align 1, !dbg !513, !tbaa !241
  %conv27 = sext i8 %18 to i16, !dbg !513
  %shr = ashr i16 %conv27, 2, !dbg !513
  %conv28 = trunc i16 %shr to i8, !dbg !513
  store i8 %conv28, i8* %x26, align 1, !dbg !513, !tbaa !241
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !514
  %19 = load i8, i8* %y29, align 1, !dbg !515, !tbaa !248
  %conv30 = sext i8 %19 to i16, !dbg !515
  %shr31 = ashr i16 %conv30, 2, !dbg !515
  %conv32 = trunc i16 %shr31 to i8, !dbg !515
  store i8 %conv32, i8* %y29, align 1, !dbg !515, !tbaa !248
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !516
  %20 = load i8, i8* %z33, align 1, !dbg !517, !tbaa !254
  %conv34 = sext i8 %20 to i16, !dbg !517
  %shr35 = ashr i16 %conv34, 2, !dbg !517
  %conv36 = trunc i16 %shr35 to i8, !dbg !517
  store i8 %conv36, i8* %z33, align 1, !dbg !517, !tbaa !254
  store i16 0, i16* %i, align 2, !dbg !518, !tbaa !103
  br label %for.cond37, !dbg !520

for.cond37:                                       ; preds = %for.inc135, %for.end
  %21 = load i16, i16* %i, align 2, !dbg !521, !tbaa !103
  %cmp38 = icmp slt i16 %21, 3, !dbg !523
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !524

for.body40:                                       ; preds = %for.cond37
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !525, !tbaa !135
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !525
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !525
  %23 = load i16, i16* %i, align 2, !dbg !527, !tbaa !103
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %23, !dbg !525
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !528
  %24 = load i8, i8* %x44, align 1, !dbg !528, !tbaa !241
  %conv45 = sext i8 %24 to i16, !dbg !525
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !529
  %25 = load i8, i8* %x46, align 1, !dbg !529, !tbaa !241
  %conv47 = sext i8 %25 to i16, !dbg !530
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !531
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !525

cond.true:                                        ; preds = %for.body40
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !532, !tbaa !135
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !532
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !532
  %27 = load i16, i16* %i, align 2, !dbg !533, !tbaa !103
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %27, !dbg !532
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !534
  %28 = load i8, i8* %x53, align 1, !dbg !534, !tbaa !241
  %conv54 = sext i8 %28 to i16, !dbg !532
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !535
  %29 = load i8, i8* %x55, align 1, !dbg !535, !tbaa !241
  %conv56 = sext i8 %29 to i16, !dbg !536
  %sub = sub nsw i16 %conv54, %conv56, !dbg !537
  br label %cond.end, !dbg !525

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !538
  %30 = load i8, i8* %x57, align 1, !dbg !538, !tbaa !241
  %conv58 = sext i8 %30 to i16, !dbg !539
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !540, !tbaa !135
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !540
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !540
  %32 = load i16, i16* %i, align 2, !dbg !541, !tbaa !103
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %32, !dbg !540
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !542
  %33 = load i8, i8* %x62, align 1, !dbg !542, !tbaa !241
  %conv63 = sext i8 %33 to i16, !dbg !540
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !543
  br label %cond.end, !dbg !525

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !525
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !544
  %34 = load i8, i8* %x65, align 1, !dbg !545, !tbaa !241
  %conv66 = sext i8 %34 to i16, !dbg !545
  %add67 = add nsw i16 %conv66, %cond, !dbg !545
  %conv68 = trunc i16 %add67 to i8, !dbg !545
  store i8 %conv68, i8* %x65, align 1, !dbg !545, !tbaa !241
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !546, !tbaa !135
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !546
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !546
  %36 = load i16, i16* %i, align 2, !dbg !547, !tbaa !103
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %36, !dbg !546
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !548
  %37 = load i8, i8* %y72, align 1, !dbg !548, !tbaa !248
  %conv73 = sext i8 %37 to i16, !dbg !546
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !549
  %38 = load i8, i8* %y74, align 1, !dbg !549, !tbaa !248
  %conv75 = sext i8 %38 to i16, !dbg !550
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !551
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !546

cond.true78:                                      ; preds = %cond.end
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !552, !tbaa !135
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !552
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !552
  %40 = load i16, i16* %i, align 2, !dbg !553, !tbaa !103
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %40, !dbg !552
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !554
  %41 = load i8, i8* %y82, align 1, !dbg !554, !tbaa !248
  %conv83 = sext i8 %41 to i16, !dbg !552
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !555
  %42 = load i8, i8* %y84, align 1, !dbg !555, !tbaa !248
  %conv85 = sext i8 %42 to i16, !dbg !556
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !557
  br label %cond.end96, !dbg !546

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !558
  %43 = load i8, i8* %y88, align 1, !dbg !558, !tbaa !248
  %conv89 = sext i8 %43 to i16, !dbg !559
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !560, !tbaa !135
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !560
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !560
  %45 = load i16, i16* %i, align 2, !dbg !561, !tbaa !103
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %45, !dbg !560
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !562
  %46 = load i8, i8* %y93, align 1, !dbg !562, !tbaa !248
  %conv94 = sext i8 %46 to i16, !dbg !560
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !563
  br label %cond.end96, !dbg !546

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !546
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !564
  %47 = load i8, i8* %y98, align 1, !dbg !565, !tbaa !248
  %conv99 = sext i8 %47 to i16, !dbg !565
  %add100 = add nsw i16 %conv99, %cond97, !dbg !565
  %conv101 = trunc i16 %add100 to i8, !dbg !565
  store i8 %conv101, i8* %y98, align 1, !dbg !565, !tbaa !248
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !566, !tbaa !135
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !566
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !566
  %49 = load i16, i16* %i, align 2, !dbg !567, !tbaa !103
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %49, !dbg !566
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !568
  %50 = load i8, i8* %z105, align 1, !dbg !568, !tbaa !254
  %conv106 = sext i8 %50 to i16, !dbg !566
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !569
  %51 = load i8, i8* %z107, align 1, !dbg !569, !tbaa !254
  %conv108 = sext i8 %51 to i16, !dbg !570
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !571
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !566

cond.true111:                                     ; preds = %cond.end96
  %52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !572, !tbaa !135
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %52, i32 0, i32 1, !dbg !572
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !572
  %53 = load i16, i16* %i, align 2, !dbg !573, !tbaa !103
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %53, !dbg !572
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !574
  %54 = load i8, i8* %z115, align 1, !dbg !574, !tbaa !254
  %conv116 = sext i8 %54 to i16, !dbg !572
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !575
  %55 = load i8, i8* %z117, align 1, !dbg !575, !tbaa !254
  %conv118 = sext i8 %55 to i16, !dbg !576
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !577
  br label %cond.end129, !dbg !566

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !578
  %56 = load i8, i8* %z121, align 1, !dbg !578, !tbaa !254
  %conv122 = sext i8 %56 to i16, !dbg !579
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !580, !tbaa !135
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 1, !dbg !580
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !580
  %58 = load i16, i16* %i, align 2, !dbg !581, !tbaa !103
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %58, !dbg !580
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !582
  %59 = load i8, i8* %z126, align 1, !dbg !582, !tbaa !254
  %conv127 = sext i8 %59 to i16, !dbg !580
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !583
  br label %cond.end129, !dbg !566

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !566
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !584
  %60 = load i8, i8* %z131, align 1, !dbg !585, !tbaa !254
  %conv132 = sext i8 %60 to i16, !dbg !585
  %add133 = add nsw i16 %conv132, %cond130, !dbg !585
  %conv134 = trunc i16 %add133 to i8, !dbg !585
  store i8 %conv134, i8* %z131, align 1, !dbg !585, !tbaa !254
  br label %for.inc135, !dbg !586

for.inc135:                                       ; preds = %cond.end129
  %61 = load i16, i16* %i, align 2, !dbg !587, !tbaa !103
  %inc136 = add nsw i16 %61, 1, !dbg !587
  store i16 %inc136, i16* %i, align 2, !dbg !587, !tbaa !103
  br label %for.cond37, !dbg !588, !llvm.loop !589

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !591
  %62 = load i8, i8* %x138, align 1, !dbg !592, !tbaa !241
  %conv139 = sext i8 %62 to i16, !dbg !592
  %shr140 = ashr i16 %conv139, 2, !dbg !592
  %conv141 = trunc i16 %shr140 to i8, !dbg !592
  store i8 %conv141, i8* %x138, align 1, !dbg !592, !tbaa !241
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !593
  %63 = load i8, i8* %y142, align 1, !dbg !594, !tbaa !248
  %conv143 = sext i8 %63 to i16, !dbg !594
  %shr144 = ashr i16 %conv143, 2, !dbg !594
  %conv145 = trunc i16 %shr144 to i8, !dbg !594
  store i8 %conv145, i8* %y142, align 1, !dbg !594, !tbaa !248
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !595
  %64 = load i8, i8* %z146, align 1, !dbg !596, !tbaa !254
  %conv147 = sext i8 %64 to i16, !dbg !596
  %shr148 = ashr i16 %conv147, 2, !dbg !596
  %conv149 = trunc i16 %shr148 to i8, !dbg !596
  store i8 %conv149, i8* %z146, align 1, !dbg !596, !tbaa !254
  %65 = bitcast i16* %meanmag to i8*, !dbg !597
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %65) #13, !dbg !597
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !463, metadata !DIExpression()), !dbg !598
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !599
  %66 = load i8, i8* %x150, align 1, !dbg !599, !tbaa !241
  %conv151 = sext i8 %66 to i16, !dbg !600
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !601
  %67 = load i8, i8* %x152, align 1, !dbg !601, !tbaa !241
  %conv153 = sext i8 %67 to i16, !dbg !602
  %mul = mul nsw i16 %conv151, %conv153, !dbg !603
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !604
  %68 = load i8, i8* %y154, align 1, !dbg !604, !tbaa !248
  %conv155 = sext i8 %68 to i16, !dbg !605
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !606
  %69 = load i8, i8* %y156, align 1, !dbg !606, !tbaa !248
  %conv157 = sext i8 %69 to i16, !dbg !607
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !608
  %add159 = add nsw i16 %mul, %mul158, !dbg !609
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !610
  %70 = load i8, i8* %z160, align 1, !dbg !610, !tbaa !254
  %conv161 = sext i8 %70 to i16, !dbg !611
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !612
  %71 = load i8, i8* %z162, align 1, !dbg !612, !tbaa !254
  %conv163 = sext i8 %71 to i16, !dbg !613
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !614
  %add165 = add nsw i16 %add159, %mul164, !dbg !615
  store i16 %add165, i16* %meanmag, align 2, !dbg !598, !tbaa !103
  %72 = bitcast i16* %stddevmag to i8*, !dbg !616
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %72) #13, !dbg !616
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !464, metadata !DIExpression()), !dbg !617
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !618
  %73 = load i8, i8* %x166, align 1, !dbg !618, !tbaa !241
  %conv167 = sext i8 %73 to i16, !dbg !619
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !620
  %74 = load i8, i8* %x168, align 1, !dbg !620, !tbaa !241
  %conv169 = sext i8 %74 to i16, !dbg !621
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !622
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !623
  %75 = load i8, i8* %y171, align 1, !dbg !623, !tbaa !248
  %conv172 = sext i8 %75 to i16, !dbg !624
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !625
  %76 = load i8, i8* %y173, align 1, !dbg !625, !tbaa !248
  %conv174 = sext i8 %76 to i16, !dbg !626
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !627
  %add176 = add nsw i16 %mul170, %mul175, !dbg !628
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !629
  %77 = load i8, i8* %z177, align 1, !dbg !629, !tbaa !254
  %conv178 = sext i8 %77 to i16, !dbg !630
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !631
  %78 = load i8, i8* %z179, align 1, !dbg !631, !tbaa !254
  %conv180 = sext i8 %78 to i16, !dbg !632
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !633
  %add182 = add nsw i16 %add176, %mul181, !dbg !634
  store i16 %add182, i16* %stddevmag, align 2, !dbg !617, !tbaa !103
  %79 = load i16, i16* %meanmag, align 2, !dbg !635, !tbaa !103
  %conv183 = uitofp i16 %79 to double, !dbg !635
  %call = call double @sqrt(double %conv183) #13, !dbg !636
  %conv184 = fptoui double %call to i16, !dbg !636
  %meanmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !637
  store i16 %conv184, i16* %meanmag185, align 2, !dbg !638, !tbaa !639
  %80 = load i16, i16* %stddevmag, align 2, !dbg !640, !tbaa !103
  %conv186 = uitofp i16 %80 to double, !dbg !640
  %call187 = call double @sqrt(double %conv186) #13, !dbg !641
  %conv188 = fptoui double %call187 to i16, !dbg !641
  %stddevmag189 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !642
  store i16 %conv188, i16* %stddevmag189, align 2, !dbg !643, !tbaa !644
  %81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !645, !tbaa !135
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %81, i32 0, i32 1, !dbg !645
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals190, i32 0, i32 12, !dbg !645
  %82 = load i16, i16* %mode, align 2, !dbg !645, !tbaa !325
  switch i16 %82, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb193
  ], !dbg !646

sw.bb:                                            ; preds = %for.end137, %for.end137
  %83 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !647, !tbaa !135
  %globals191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %83, i32 0, i32 1, !dbg !647
  %features192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals191, i32 0, i32 7, !dbg !647
  %84 = bitcast %struct.features_t* %features192 to i8*, !dbg !649
  %85 = bitcast %struct.features_t* %features to i8*, !dbg !649
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %84, i8* align 2 %85, i16 4, i1 false), !dbg !649, !tbaa.struct !650
  br label %sw.epilog, !dbg !651

sw.bb193:                                         ; preds = %for.end137
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !652, !tbaa !135
  %globals194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 1, !dbg !652
  %features195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals194, i32 0, i32 7, !dbg !652
  %87 = bitcast %struct.features_t* %features195 to i8*, !dbg !653
  %88 = bitcast %struct.features_t* %features to i8*, !dbg !653
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %87, i8* align 2 %88, i16 4, i1 false), !dbg !653, !tbaa.struct !650
  br label %sw.epilog, !dbg !654

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !655

sw.epilog:                                        ; preds = %sw.default, %sw.bb193, %sw.bb
  %89 = bitcast i16* %stddevmag to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %89) #13, !dbg !656
  %90 = bitcast i16* %meanmag to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %90) #13, !dbg !656
  %91 = bitcast i16* %i to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %91) #13, !dbg !656
  %92 = bitcast %struct.features_t* %features to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %92) #13, !dbg !656
  %93 = bitcast %struct.threeAxis_t_8* %stddev to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %93) #13, !dbg !656
  %94 = bitcast %struct.threeAxis_t_8* %mean to i8*, !dbg !656
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %94) #13, !dbg !656
  ret void, !dbg !656
}

; Function Attrs: nofree nounwind
declare dso_local double @sqrt(double) local_unnamed_addr #8

; Function Attrs: noinline nounwind optnone
define dso_local void @task_classify() local_unnamed_addr #7 !dbg !657 {
entry:
  %move_less_error = alloca i16, align 2
  %stat_less_error = alloca i16, align 2
  %i = alloca i16, align 2
  %class = alloca i16, align 2
  %meanmag = alloca i32, align 2
  %stddevmag = alloca i32, align 2
  %stat_mean_err = alloca i32, align 2
  %stat_sd_err = alloca i32, align 2
  %move_mean_err = alloca i32, align 2
  %move_sd_err = alloca i32, align 2
  %0 = bitcast i16* %move_less_error to i8*, !dbg !673
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !673
  call void @llvm.dbg.declare(metadata i16* %move_less_error, metadata !659, metadata !DIExpression()), !dbg !674
  store i16 0, i16* %move_less_error, align 2, !dbg !674, !tbaa !103
  %1 = bitcast i16* %stat_less_error to i8*, !dbg !675
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #13, !dbg !675
  call void @llvm.dbg.declare(metadata i16* %stat_less_error, metadata !660, metadata !DIExpression()), !dbg !676
  store i16 0, i16* %stat_less_error, align 2, !dbg !676, !tbaa !103
  %2 = bitcast i16* %i to i8*, !dbg !677
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #13, !dbg !677
  call void @llvm.dbg.declare(metadata i16* %i, metadata !661, metadata !DIExpression()), !dbg !678
  %3 = bitcast i16* %class to i8*, !dbg !679
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #13, !dbg !679
  call void @llvm.dbg.declare(metadata i16* %class, metadata !662, metadata !DIExpression()), !dbg !680
  %4 = bitcast i32* %meanmag to i8*, !dbg !681
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #13, !dbg !681
  call void @llvm.dbg.declare(metadata i32* %meanmag, metadata !663, metadata !DIExpression()), !dbg !682
  %5 = bitcast i32* %stddevmag to i8*, !dbg !683
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #13, !dbg !683
  call void @llvm.dbg.declare(metadata i32* %stddevmag, metadata !665, metadata !DIExpression()), !dbg !684
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !685, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !685
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !685
  %meanmag1 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !686
  %7 = load i16, i16* %meanmag1, align 2, !dbg !686, !tbaa !687
  %conv = zext i16 %7 to i32, !dbg !685
  store i32 %conv, i32* %meanmag, align 2, !dbg !688, !tbaa !689
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !691, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !691
  %features3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !691
  %stddevmag4 = getelementptr inbounds %struct.features_t, %struct.features_t* %features3, i32 0, i32 1, !dbg !692
  %9 = load i16, i16* %stddevmag4, align 2, !dbg !692, !tbaa !693
  %conv5 = zext i16 %9 to i32, !dbg !691
  store i32 %conv5, i32* %stddevmag, align 2, !dbg !694, !tbaa !689
  store i16 0, i16* %i, align 2, !dbg !695, !tbaa !103
  br label %for.cond, !dbg !696

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i16, i16* %i, align 2, !dbg !697, !tbaa !103
  %cmp = icmp slt i16 %10, 16, !dbg !698
  br i1 %cmp, label %for.body, label %for.end, !dbg !699

for.body:                                         ; preds = %for.cond
  %11 = bitcast i32* %stat_mean_err to i8*, !dbg !700
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #13, !dbg !700
  call void @llvm.dbg.declare(metadata i32* %stat_mean_err, metadata !666, metadata !DIExpression()), !dbg !701
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !702, !tbaa !135
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !702
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !702
  %13 = load i16, i16* %i, align 2, !dbg !703, !tbaa !103
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %13, !dbg !702
  %meanmag8 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx, i32 0, i32 0, !dbg !704
  %14 = load i16, i16* %meanmag8, align 2, !dbg !704, !tbaa !639
  %conv9 = zext i16 %14 to i32, !dbg !702
  %15 = load i32, i32* %meanmag, align 2, !dbg !705, !tbaa !689
  %cmp10 = icmp sgt i32 %conv9, %15, !dbg !706
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !707

cond.true:                                        ; preds = %for.body
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !708, !tbaa !135
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !708
  %model_stationary13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 8, !dbg !708
  %17 = load i16, i16* %i, align 2, !dbg !709, !tbaa !103
  %arrayidx14 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary13, i16 0, i16 %17, !dbg !708
  %meanmag15 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx14, i32 0, i32 0, !dbg !710
  %18 = load i16, i16* %meanmag15, align 2, !dbg !710, !tbaa !639
  %conv16 = zext i16 %18 to i32, !dbg !708
  %19 = load i32, i32* %meanmag, align 2, !dbg !711, !tbaa !689
  %sub = sub nsw i32 %conv16, %19, !dbg !712
  br label %cond.end, !dbg !707

cond.false:                                       ; preds = %for.body
  %20 = load i32, i32* %meanmag, align 2, !dbg !713, !tbaa !689
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !714, !tbaa !135
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !714
  %model_stationary18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 8, !dbg !714
  %22 = load i16, i16* %i, align 2, !dbg !715, !tbaa !103
  %arrayidx19 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary18, i16 0, i16 %22, !dbg !714
  %meanmag20 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx19, i32 0, i32 0, !dbg !716
  %23 = load i16, i16* %meanmag20, align 2, !dbg !716, !tbaa !639
  %conv21 = zext i16 %23 to i32, !dbg !714
  %sub22 = sub nsw i32 %20, %conv21, !dbg !717
  br label %cond.end, !dbg !707

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub22, %cond.false ], !dbg !707
  store i32 %cond, i32* %stat_mean_err, align 2, !dbg !701, !tbaa !689
  %24 = bitcast i32* %stat_sd_err to i8*, !dbg !718
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #13, !dbg !718
  call void @llvm.dbg.declare(metadata i32* %stat_sd_err, metadata !670, metadata !DIExpression()), !dbg !719
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !720, !tbaa !135
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !720
  %model_stationary24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 8, !dbg !720
  %26 = load i16, i16* %i, align 2, !dbg !721, !tbaa !103
  %arrayidx25 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary24, i16 0, i16 %26, !dbg !720
  %stddevmag26 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx25, i32 0, i32 1, !dbg !722
  %27 = load i16, i16* %stddevmag26, align 2, !dbg !722, !tbaa !644
  %conv27 = zext i16 %27 to i32, !dbg !720
  %28 = load i32, i32* %stddevmag, align 2, !dbg !723, !tbaa !689
  %cmp28 = icmp sgt i32 %conv27, %28, !dbg !724
  br i1 %cmp28, label %cond.true30, label %cond.false37, !dbg !725

cond.true30:                                      ; preds = %cond.end
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !726, !tbaa !135
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !726
  %model_stationary32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8, !dbg !726
  %30 = load i16, i16* %i, align 2, !dbg !727, !tbaa !103
  %arrayidx33 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary32, i16 0, i16 %30, !dbg !726
  %stddevmag34 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx33, i32 0, i32 1, !dbg !728
  %31 = load i16, i16* %stddevmag34, align 2, !dbg !728, !tbaa !644
  %conv35 = zext i16 %31 to i32, !dbg !726
  %32 = load i32, i32* %stddevmag, align 2, !dbg !729, !tbaa !689
  %sub36 = sub nsw i32 %conv35, %32, !dbg !730
  br label %cond.end44, !dbg !725

cond.false37:                                     ; preds = %cond.end
  %33 = load i32, i32* %stddevmag, align 2, !dbg !731, !tbaa !689
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !732, !tbaa !135
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !732
  %model_stationary39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8, !dbg !732
  %35 = load i16, i16* %i, align 2, !dbg !733, !tbaa !103
  %arrayidx40 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary39, i16 0, i16 %35, !dbg !732
  %stddevmag41 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx40, i32 0, i32 1, !dbg !734
  %36 = load i16, i16* %stddevmag41, align 2, !dbg !734, !tbaa !644
  %conv42 = zext i16 %36 to i32, !dbg !732
  %sub43 = sub nsw i32 %33, %conv42, !dbg !735
  br label %cond.end44, !dbg !725

cond.end44:                                       ; preds = %cond.false37, %cond.true30
  %cond45 = phi i32 [ %sub36, %cond.true30 ], [ %sub43, %cond.false37 ], !dbg !725
  store i32 %cond45, i32* %stat_sd_err, align 2, !dbg !719, !tbaa !689
  %37 = bitcast i32* %move_mean_err to i8*, !dbg !736
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %37) #13, !dbg !736
  call void @llvm.dbg.declare(metadata i32* %move_mean_err, metadata !671, metadata !DIExpression()), !dbg !737
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !738, !tbaa !135
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !738
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 9, !dbg !738
  %39 = load i16, i16* %i, align 2, !dbg !739, !tbaa !103
  %arrayidx47 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %39, !dbg !738
  %meanmag48 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx47, i32 0, i32 0, !dbg !740
  %40 = load i16, i16* %meanmag48, align 2, !dbg !740, !tbaa !639
  %conv49 = zext i16 %40 to i32, !dbg !738
  %41 = load i32, i32* %meanmag, align 2, !dbg !741, !tbaa !689
  %cmp50 = icmp sgt i32 %conv49, %41, !dbg !742
  br i1 %cmp50, label %cond.true52, label %cond.false59, !dbg !743

cond.true52:                                      ; preds = %cond.end44
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !744, !tbaa !135
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !744
  %model_moving54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 9, !dbg !744
  %43 = load i16, i16* %i, align 2, !dbg !745, !tbaa !103
  %arrayidx55 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving54, i16 0, i16 %43, !dbg !744
  %meanmag56 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx55, i32 0, i32 0, !dbg !746
  %44 = load i16, i16* %meanmag56, align 2, !dbg !746, !tbaa !639
  %conv57 = zext i16 %44 to i32, !dbg !744
  %45 = load i32, i32* %meanmag, align 2, !dbg !747, !tbaa !689
  %sub58 = sub nsw i32 %conv57, %45, !dbg !748
  br label %cond.end66, !dbg !743

cond.false59:                                     ; preds = %cond.end44
  %46 = load i32, i32* %meanmag, align 2, !dbg !749, !tbaa !689
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !750, !tbaa !135
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 1, !dbg !750
  %model_moving61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 9, !dbg !750
  %48 = load i16, i16* %i, align 2, !dbg !751, !tbaa !103
  %arrayidx62 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving61, i16 0, i16 %48, !dbg !750
  %meanmag63 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx62, i32 0, i32 0, !dbg !752
  %49 = load i16, i16* %meanmag63, align 2, !dbg !752, !tbaa !639
  %conv64 = zext i16 %49 to i32, !dbg !750
  %sub65 = sub nsw i32 %46, %conv64, !dbg !753
  br label %cond.end66, !dbg !743

cond.end66:                                       ; preds = %cond.false59, %cond.true52
  %cond67 = phi i32 [ %sub58, %cond.true52 ], [ %sub65, %cond.false59 ], !dbg !743
  store i32 %cond67, i32* %move_mean_err, align 2, !dbg !737, !tbaa !689
  %50 = bitcast i32* %move_sd_err to i8*, !dbg !754
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %50) #13, !dbg !754
  call void @llvm.dbg.declare(metadata i32* %move_sd_err, metadata !672, metadata !DIExpression()), !dbg !755
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !756, !tbaa !135
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 1, !dbg !756
  %model_moving69 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 9, !dbg !756
  %52 = load i16, i16* %i, align 2, !dbg !757, !tbaa !103
  %arrayidx70 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving69, i16 0, i16 %52, !dbg !756
  %stddevmag71 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx70, i32 0, i32 1, !dbg !758
  %53 = load i16, i16* %stddevmag71, align 2, !dbg !758, !tbaa !644
  %conv72 = zext i16 %53 to i32, !dbg !756
  %54 = load i32, i32* %stddevmag, align 2, !dbg !759, !tbaa !689
  %cmp73 = icmp sgt i32 %conv72, %54, !dbg !760
  br i1 %cmp73, label %cond.true75, label %cond.false82, !dbg !761

cond.true75:                                      ; preds = %cond.end66
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !762, !tbaa !135
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 1, !dbg !762
  %model_moving77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 9, !dbg !762
  %56 = load i16, i16* %i, align 2, !dbg !763, !tbaa !103
  %arrayidx78 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving77, i16 0, i16 %56, !dbg !762
  %stddevmag79 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx78, i32 0, i32 1, !dbg !764
  %57 = load i16, i16* %stddevmag79, align 2, !dbg !764, !tbaa !644
  %conv80 = zext i16 %57 to i32, !dbg !762
  %58 = load i32, i32* %stddevmag, align 2, !dbg !765, !tbaa !689
  %sub81 = sub nsw i32 %conv80, %58, !dbg !766
  br label %cond.end89, !dbg !761

cond.false82:                                     ; preds = %cond.end66
  %59 = load i32, i32* %stddevmag, align 2, !dbg !767, !tbaa !689
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !768, !tbaa !135
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i32 0, i32 1, !dbg !768
  %model_moving84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals83, i32 0, i32 9, !dbg !768
  %61 = load i16, i16* %i, align 2, !dbg !769, !tbaa !103
  %arrayidx85 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving84, i16 0, i16 %61, !dbg !768
  %stddevmag86 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx85, i32 0, i32 1, !dbg !770
  %62 = load i16, i16* %stddevmag86, align 2, !dbg !770, !tbaa !644
  %conv87 = zext i16 %62 to i32, !dbg !768
  %sub88 = sub nsw i32 %59, %conv87, !dbg !771
  br label %cond.end89, !dbg !761

cond.end89:                                       ; preds = %cond.false82, %cond.true75
  %cond90 = phi i32 [ %sub81, %cond.true75 ], [ %sub88, %cond.false82 ], !dbg !761
  store i32 %cond90, i32* %move_sd_err, align 2, !dbg !755, !tbaa !689
  %63 = load i32, i32* %move_mean_err, align 2, !dbg !772, !tbaa !689
  %64 = load i32, i32* %stat_mean_err, align 2, !dbg !774, !tbaa !689
  %cmp91 = icmp slt i32 %63, %64, !dbg !775
  br i1 %cmp91, label %if.then, label %if.else, !dbg !776

if.then:                                          ; preds = %cond.end89
  %65 = load i16, i16* %move_less_error, align 2, !dbg !777, !tbaa !103
  %inc = add nsw i16 %65, 1, !dbg !777
  store i16 %inc, i16* %move_less_error, align 2, !dbg !777, !tbaa !103
  br label %if.end, !dbg !779

if.else:                                          ; preds = %cond.end89
  %66 = load i16, i16* %stat_less_error, align 2, !dbg !780, !tbaa !103
  %inc93 = add nsw i16 %66, 1, !dbg !780
  store i16 %inc93, i16* %stat_less_error, align 2, !dbg !780, !tbaa !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %67 = load i32, i32* %move_sd_err, align 2, !dbg !782, !tbaa !689
  %68 = load i32, i32* %stat_sd_err, align 2, !dbg !784, !tbaa !689
  %cmp94 = icmp slt i32 %67, %68, !dbg !785
  br i1 %cmp94, label %if.then96, label %if.else98, !dbg !786

if.then96:                                        ; preds = %if.end
  %69 = load i16, i16* %move_less_error, align 2, !dbg !787, !tbaa !103
  %inc97 = add nsw i16 %69, 1, !dbg !787
  store i16 %inc97, i16* %move_less_error, align 2, !dbg !787, !tbaa !103
  br label %if.end100, !dbg !789

if.else98:                                        ; preds = %if.end
  %70 = load i16, i16* %stat_less_error, align 2, !dbg !790, !tbaa !103
  %inc99 = add nsw i16 %70, 1, !dbg !790
  store i16 %inc99, i16* %stat_less_error, align 2, !dbg !790, !tbaa !103
  br label %if.end100

if.end100:                                        ; preds = %if.else98, %if.then96
  %71 = bitcast i32* %move_sd_err to i8*, !dbg !792
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %71) #13, !dbg !792
  %72 = bitcast i32* %move_mean_err to i8*, !dbg !792
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #13, !dbg !792
  %73 = bitcast i32* %stat_sd_err to i8*, !dbg !792
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #13, !dbg !792
  %74 = bitcast i32* %stat_mean_err to i8*, !dbg !792
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #13, !dbg !792
  br label %for.inc, !dbg !793

for.inc:                                          ; preds = %if.end100
  %75 = load i16, i16* %i, align 2, !dbg !794, !tbaa !103
  %inc101 = add nsw i16 %75, 1, !dbg !794
  store i16 %inc101, i16* %i, align 2, !dbg !794, !tbaa !103
  br label %for.cond, !dbg !795, !llvm.loop !796

for.end:                                          ; preds = %for.cond
  %76 = load i16, i16* %move_less_error, align 2, !dbg !798, !tbaa !103
  %77 = load i16, i16* %stat_less_error, align 2, !dbg !799, !tbaa !103
  %cmp102 = icmp sgt i16 %76, %77, !dbg !800
  %78 = zext i1 %cmp102 to i64, !dbg !801
  %cond104 = select i1 %cmp102, i16 1, i16 0, !dbg !801
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !802, !tbaa !135
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 1, !dbg !802
  %class106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals105, i32 0, i32 2, !dbg !802
  store i16 %cond104, i16* %class106, align 2, !dbg !803, !tbaa !328
  %80 = bitcast i32* %stddevmag to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %80) #13, !dbg !804
  %81 = bitcast i32* %meanmag to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %81) #13, !dbg !804
  %82 = bitcast i16* %class to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %82) #13, !dbg !804
  %83 = bitcast i16* %i to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %83) #13, !dbg !804
  %84 = bitcast i16* %stat_less_error to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %84) #13, !dbg !804
  %85 = bitcast i16* %move_less_error to i8*, !dbg !804
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %85) #13, !dbg !804
  ret void, !dbg !804
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_stats() local_unnamed_addr #7 !dbg !805 {
entry:
  %movingCount = alloca i16, align 2
  %stationaryCount = alloca i16, align 2
  %resultStationaryPct = alloca i16, align 2
  %resultMovingPct = alloca i16, align 2
  %sum = alloca i16, align 2
  %0 = bitcast i16* %movingCount to i8*, !dbg !814
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !814
  call void @llvm.dbg.declare(metadata i16* %movingCount, metadata !807, metadata !DIExpression()), !dbg !815
  store i16 0, i16* %movingCount, align 2, !dbg !815, !tbaa !103
  %1 = bitcast i16* %stationaryCount to i8*, !dbg !814
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #13, !dbg !814
  call void @llvm.dbg.declare(metadata i16* %stationaryCount, metadata !808, metadata !DIExpression()), !dbg !816
  store i16 0, i16* %stationaryCount, align 2, !dbg !816, !tbaa !103
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !817, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !817
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !817
  %3 = load i16, i16* %totalCount, align 2, !dbg !818, !tbaa !358
  %inc = add i16 %3, 1, !dbg !818
  store i16 %inc, i16* %totalCount, align 2, !dbg !818, !tbaa !358
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !819, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !819
  %class = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !819
  %5 = load i16, i16* %class, align 2, !dbg !819, !tbaa !328
  switch i16 %5, label %sw.epilog [
    i16 1, label %sw.bb
    i16 0, label %sw.bb5
  ], !dbg !820

sw.bb:                                            ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !821, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !821
  %movingCount3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !821
  %7 = load i16, i16* %movingCount3, align 2, !dbg !823, !tbaa !352
  %inc4 = add i16 %7, 1, !dbg !823
  store i16 %inc4, i16* %movingCount3, align 2, !dbg !823, !tbaa !352
  br label %sw.epilog, !dbg !824

sw.bb5:                                           ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !825, !tbaa !135
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !825
  %stationaryCount7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !825
  %9 = load i16, i16* %stationaryCount7, align 2, !dbg !826, !tbaa !355
  %inc8 = add i16 %9, 1, !dbg !826
  store i16 %inc8, i16* %stationaryCount7, align 2, !dbg !826, !tbaa !355
  br label %sw.epilog, !dbg !827

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !828, !tbaa !135
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !828
  %totalCount10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !828
  %11 = load i16, i16* %totalCount10, align 2, !dbg !828, !tbaa !358
  %cmp = icmp eq i16 %11, 128, !dbg !829
  br i1 %cmp, label %if.then, label %if.end, !dbg !830

if.then:                                          ; preds = %sw.epilog
  %12 = bitcast i16* %resultStationaryPct to i8*, !dbg !831
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %12) #13, !dbg !831
  call void @llvm.dbg.declare(metadata i16* %resultStationaryPct, metadata !809, metadata !DIExpression()), !dbg !832
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !833, !tbaa !135
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !833
  %stationaryCount12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 5, !dbg !833
  %14 = load i16, i16* %stationaryCount12, align 2, !dbg !833, !tbaa !355
  %mul = mul i16 %14, 100, !dbg !834
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !835, !tbaa !135
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !835
  %totalCount14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !835
  %16 = load i16, i16* %totalCount14, align 2, !dbg !835, !tbaa !358
  %div = udiv i16 %mul, %16, !dbg !836
  store i16 %div, i16* %resultStationaryPct, align 2, !dbg !832, !tbaa !103
  %17 = bitcast i16* %resultMovingPct to i8*, !dbg !837
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %17) #13, !dbg !837
  call void @llvm.dbg.declare(metadata i16* %resultMovingPct, metadata !812, metadata !DIExpression()), !dbg !838
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !839, !tbaa !135
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !839
  %movingCount16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 4, !dbg !839
  %19 = load i16, i16* %movingCount16, align 2, !dbg !839, !tbaa !352
  %mul17 = mul i16 %19, 100, !dbg !840
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !841, !tbaa !135
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !841
  %totalCount19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !841
  %21 = load i16, i16* %totalCount19, align 2, !dbg !841, !tbaa !358
  %div20 = udiv i16 %mul17, %21, !dbg !842
  store i16 %div20, i16* %resultMovingPct, align 2, !dbg !838, !tbaa !103
  %22 = bitcast i16* %sum to i8*, !dbg !843
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %22) #13, !dbg !843
  call void @llvm.dbg.declare(metadata i16* %sum, metadata !813, metadata !DIExpression()), !dbg !844
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !845, !tbaa !135
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !845
  %stationaryCount22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 5, !dbg !845
  %24 = load i16, i16* %stationaryCount22, align 2, !dbg !845, !tbaa !355
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !846, !tbaa !135
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !846
  %movingCount24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 4, !dbg !846
  %26 = load i16, i16* %movingCount24, align 2, !dbg !846, !tbaa !352
  %add = add i16 %24, %26, !dbg !847
  store i16 %add, i16* %sum, align 2, !dbg !844, !tbaa !103
  %27 = bitcast i16* %sum to i8*, !dbg !848
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #13, !dbg !848
  %28 = bitcast i16* %resultMovingPct to i8*, !dbg !848
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #13, !dbg !848
  %29 = bitcast i16* %resultStationaryPct to i8*, !dbg !848
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #13, !dbg !848
  br label %if.end, !dbg !849

if.end:                                           ; preds = %if.then, %sw.epilog
  %30 = bitcast i16* %stationaryCount to i8*, !dbg !850
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #13, !dbg !850
  %31 = bitcast i16* %movingCount to i8*, !dbg !850
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #13, !dbg !850
  ret void, !dbg !850
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_warmup() local_unnamed_addr #7 !dbg !851 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  %0 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !854
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #13, !dbg !854
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !853, metadata !DIExpression()), !dbg !855
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !856, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !856
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !856
  %2 = load i16, i16* %seed, align 2, !dbg !856, !tbaa !266
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %2), !dbg !857
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !858, !tbaa !135
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !858
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !858
  store i16 %call, i16* %seed2, align 2, !dbg !859, !tbaa !266
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !860, !tbaa !135
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !860
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !860
  %5 = load i16, i16* %discardedSamplesCount, align 2, !dbg !861, !tbaa !322
  %inc = add i16 %5, 1, !dbg !861
  store i16 %inc, i16* %discardedSamplesCount, align 2, !dbg !861, !tbaa !322
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !862, !tbaa !135
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !862
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !862
  %7 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !862, !tbaa !322
  %cmp = icmp eq i16 %7, 3, !dbg !864
  br i1 %cmp, label %if.then, label %if.end, !dbg !865

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !866, !tbaa !135
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !866
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !866
  store i16 0, i16* %trainingSetSize, align 2, !dbg !868, !tbaa !869
  br label %if.end, !dbg !870

if.end:                                           ; preds = %if.then, %entry
  %9 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !871
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %9) #13, !dbg !871
  ret void, !dbg !871
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_train() local_unnamed_addr #7 !dbg !872 {
entry:
  %trainingSetSize = alloca i16, align 2
  %class = alloca i16, align 2
  %0 = bitcast i16* %trainingSetSize to i8*, !dbg !876
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !876
  call void @llvm.dbg.declare(metadata i16* %trainingSetSize, metadata !874, metadata !DIExpression()), !dbg !877
  %1 = bitcast i16* %class to i8*, !dbg !878
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #13, !dbg !878
  call void @llvm.dbg.declare(metadata i16* %class, metadata !875, metadata !DIExpression()), !dbg !879
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !880, !tbaa !135
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !880
  %class1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !880
  %3 = load i16, i16* %class1, align 2, !dbg !880, !tbaa !328
  switch i16 %3, label %sw.epilog [
    i16 0, label %sw.bb
    i16 1, label %sw.bb6
  ], !dbg !881

sw.bb:                                            ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !882, !tbaa !135
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !882
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !882
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !884, !tbaa !135
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !884
  %trainingSetSize4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !884
  %6 = load i16, i16* %trainingSetSize4, align 2, !dbg !884, !tbaa !869
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %6, !dbg !882
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !885, !tbaa !135
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !885
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !885
  %8 = bitcast %struct.features_t* %arrayidx to i8*, !dbg !885
  %9 = bitcast %struct.features_t* %features to i8*, !dbg !885
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %8, i8* align 2 %9, i16 4, i1 false), !dbg !885, !tbaa.struct !650
  br label %sw.epilog, !dbg !886

sw.bb6:                                           ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !887, !tbaa !135
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !887
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !887
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !888, !tbaa !135
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !888
  %trainingSetSize9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 10, !dbg !888
  %12 = load i16, i16* %trainingSetSize9, align 2, !dbg !888, !tbaa !869
  %arrayidx10 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %12, !dbg !887
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !889, !tbaa !135
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !889
  %features12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7, !dbg !889
  %14 = bitcast %struct.features_t* %arrayidx10 to i8*, !dbg !889
  %15 = bitcast %struct.features_t* %features12 to i8*, !dbg !889
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 4, i1 false), !dbg !889, !tbaa.struct !650
  br label %sw.epilog, !dbg !890

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !891, !tbaa !135
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !891
  %trainingSetSize14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !891
  %17 = load i16, i16* %trainingSetSize14, align 2, !dbg !892, !tbaa !869
  %inc = add i16 %17, 1, !dbg !892
  store i16 %inc, i16* %trainingSetSize14, align 2, !dbg !892, !tbaa !869
  %18 = bitcast i16* %class to i8*, !dbg !893
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %18) #13, !dbg !893
  %19 = bitcast i16* %trainingSetSize to i8*, !dbg !893
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %19) #13, !dbg !893
  ret void, !dbg !893
}

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @task_done() local_unnamed_addr #9 !dbg !894 {
entry:
  call void @exit(i16 0) #14, !dbg !895
  unreachable, !dbg !895
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #10

; Function Attrs: norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #11 !dbg !896 {
entry:
  ret void, !dbg !897
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #12 !dbg !898 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !901, !tbaa !126
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !902, !tbaa !135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !903, !tbaa !135
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !904, !tbaa !103
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !906, !tbaa !108
  %1 = or i8 %0, 1, !dbg !906
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !906, !tbaa !108
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !907, !tbaa !108
  %3 = and i8 %2, -2, !dbg !907
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !907, !tbaa !108
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !908, !tbaa !103
  %and4.i = and i16 %4, -2, !dbg !908
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !908, !tbaa !103
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !909, !tbaa !108
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !910, !tbaa !103
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !911, !tbaa !103
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !912, !tbaa !103
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !913, !tbaa !108
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !914, !tbaa !103
  tail call void @task_init(), !dbg !915
  tail call void @commit(), !dbg !915
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i16 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals2 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1
  %BCast4 = bitcast %struct.camel_global_t* %globals3 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(164) %BCast, i8* nonnull align 2 dereferenceable(164) %BCast4, i16 164, i1 false), !dbg !915
  br label %while.body, !dbg !916

while.body:                                       ; preds = %while.body.backedge, %entry
  tail call void @task_selectMode(), !dbg !917
  tail call void @commit(), !dbg !917
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 14
  %tmp6 = load i16, i16* %global5, align 2
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 14
  store i16 %tmp6, i16* %global9, align 2
  %global12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 0
  %tmp13 = load i16, i16* %global12, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 0
  store i16 %tmp13, i16* %global16, align 2
  %global19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 1
  %tmp20 = load i16, i16* %global19, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 1
  store i16 %tmp20, i16* %global23, align 2
  %global26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 12
  %tmp27 = load i16, i16* %global26, align 2
  %global30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 12
  store i16 %tmp27, i16* %global30, align 2
  %global33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 2
  %tmp34 = load i16, i16* %global33, align 2
  %global37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 2
  store i16 %tmp34, i16* %global37, align 2
  %global40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 11
  %tmp41 = load i16, i16* %global40, align 2
  %global44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 11
  store i16 %tmp41, i16* %global44, align 2
  %5 = load i16, i16* %global26, align 2, !dbg !919, !tbaa !325
  switch i16 %5, label %while.body20.preheader [
    i16 2, label %if.then
    i16 1, label %if.then
    i16 0, label %if.then11
    i16 3, label %while.body.backedge
  ], !dbg !921

while.body.backedge:                              ; preds = %if.then42, %if.then33, %while.body
  br label %while.body, !dbg !917, !llvm.loop !922

if.then:                                          ; preds = %while.body, %while.body
  %6 = load i16, i16* %global19, align 2, !dbg !924, !tbaa !322
  %cmp63 = icmp ult i16 %6, 3, !dbg !926
  br i1 %cmp63, label %while.body7, label %while.body20.preheader, !dbg !927

while.body7:                                      ; preds = %if.then, %while.body7
  tail call void @task_warmup(), !dbg !928
  tail call void @commit(), !dbg !928
  %tmp45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 13
  %tmp48 = load i16, i16* %global47, align 2
  %tmp49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 13
  store i16 %tmp48, i16* %global51, align 2
  %global54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 1
  %tmp55 = load i16, i16* %global54, align 2
  %global58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 1
  store i16 %tmp55, i16* %global58, align 2
  %global61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 10
  %tmp62 = load i16, i16* %global61, align 2
  %global65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 10
  store i16 %tmp62, i16* %global65, align 2
  %7 = load i16, i16* %global54, align 2, !dbg !924, !tbaa !322
  %cmp6 = icmp ult i16 %7, 3, !dbg !926
  br i1 %cmp6, label %while.body7, label %while.body20.preheader, !dbg !927, !llvm.loop !930

if.then11:                                        ; preds = %while.body
  tail call void @task_resetStats(), !dbg !932
  tail call void @commit(), !dbg !932
  %tmp66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 4
  %tmp69 = load i16, i16* %global68, align 2
  %tmp70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 4
  store i16 %tmp69, i16* %global72, align 2
  %global75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 5
  %tmp76 = load i16, i16* %global75, align 2
  %global79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 5
  store i16 %tmp76, i16* %global79, align 2
  %global82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 3
  %tmp83 = load i16, i16* %global82, align 2
  %global86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 3
  store i16 %tmp83, i16* %global86, align 2
  %global89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 11
  %tmp90 = load i16, i16* %global89, align 2
  %global93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 11
  store i16 %tmp90, i16* %global93, align 2
  br label %while.body20.preheader, !dbg !935

while.body20.preheader:                           ; preds = %while.body7, %if.then, %while.body, %if.then11
  %.ph = phi %struct.camel_buffer_t* [ %tmp66, %if.then11 ], [ %tmp, %while.body ], [ %tmp, %if.then ], [ %tmp45, %while.body7 ]
  br label %while.body20, !dbg !936

while.body20:                                     ; preds = %while.body20.backedge, %while.body20.preheader
  %8 = phi %struct.camel_buffer_t* [ %.ph, %while.body20.preheader ], [ %.be, %while.body20.backedge ], !dbg !938
  %samplesInWindow4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 11, !dbg !938
  %9 = load i16, i16* %samplesInWindow4, align 2, !dbg !938, !tbaa !331
  %cmp235 = icmp ult i16 %9, 3, !dbg !939
  br i1 %cmp235, label %while.body24, label %while.end25, !dbg !936

while.body24:                                     ; preds = %while.body20, %while.body24
  tail call void @task_sample(), !dbg !940
  tail call void @commit(), !dbg !940
  %tmp94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i16 0, i32 1, i32 11
  %load = load i16, i16* %global99, align 2
  %tmp100 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %cast = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i16 0, i32 1, i32 6, i16 %load, i32 0
  %cast108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp100, i16 0, i32 1, i32 6, i16 %load, i32 0
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(3) %cast, i8* nonnull align 2 dereferenceable(3) %cast108, i16 3, i1 false), !dbg !940
  %tmp109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i16 0, i32 1, i32 11
  %tmp112 = load i16, i16* %global111, align 2
  %tmp113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp113, i16 0, i32 1, i32 11
  store i16 %tmp112, i16* %global115, align 2
  %10 = load i16, i16* %global111, align 2, !dbg !938, !tbaa !331
  %cmp23 = icmp ult i16 %10, 3, !dbg !939
  br i1 %cmp23, label %while.body24, label %while.end25, !dbg !936, !llvm.loop !942

while.end25:                                      ; preds = %while.body24, %while.body20
  tail call void @task_transform(), !dbg !944
  tail call void @commit(), !dbg !944
  %tmp116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global118 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp116, i16 0, i32 1, i32 11
  %tmp119 = load i16, i16* %global118, align 2
  %tmp120 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp120, i16 0, i32 1, i32 11
  store i16 %tmp119, i16* %global122, align 2
  %cast126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp120, i16 0, i32 1, i32 6, i16 0, i32 0
  %cast131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp116, i16 0, i32 1, i32 6, i16 0, i32 0
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(9) %cast126, i8* nonnull align 2 dereferenceable(9) %cast131, i16 9, i1 false), !dbg !944
  tail call void @task_featurize(), !dbg !945
  tail call void @commit(), !dbg !945
  %tmp132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i16 0, i32 1, i32 7
  %tmp135 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp135, i16 0, i32 1, i32 7
  %11 = bitcast %struct.features_t* %global137 to i32*, !dbg !945
  %12 = bitcast %struct.features_t* %global134 to i32*, !dbg !945
  %13 = load i32, i32* %11, align 2, !dbg !945
  store i32 %13, i32* %12, align 2, !dbg !945
  %mode27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp135, i16 0, i32 1, i32 12, !dbg !946
  %14 = load i16, i16* %mode27, align 2, !dbg !946, !tbaa !325
  switch i16 %14, label %while.body20.backedge [
    i16 2, label %if.then33
    i16 1, label %if.then33
    i16 0, label %if.then42
  ], !dbg !948

while.body20.backedge:                            ; preds = %while.end25, %if.then42, %if.then33
  %.be = phi %struct.camel_buffer_t* [ %tmp135, %while.end25 ], [ %tmp190, %if.then42 ], [ %tmp176, %if.then33 ]
  br label %while.body20, !dbg !938, !llvm.loop !922

if.then33:                                        ; preds = %while.end25, %while.end25
  tail call void @task_train(), !dbg !949
  tail call void @commit(), !dbg !949
  %tmp140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp140, i16 0, i32 1, i32 10
  %load146 = load i16, i16* %global145, align 2
  %access147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp140, i16 0, i32 1, i32 8, i16 %load146
  %tmp148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i16 0, i32 1, i32 8, i16 %load146
  %15 = bitcast %struct.features_t* %access155 to i32*, !dbg !949
  %16 = bitcast %struct.features_t* %access147 to i32*, !dbg !949
  %17 = load i32, i32* %15, align 2, !dbg !949
  store i32 %17, i32* %16, align 2, !dbg !949
  %tmp158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i16 0, i32 1, i32 10
  %load164 = load i16, i16* %global163, align 2
  %access165 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i16 0, i32 1, i32 9, i16 %load164
  %tmp166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %access173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp166, i16 0, i32 1, i32 9, i16 %load164
  %18 = bitcast %struct.features_t* %access173 to i32*, !dbg !949
  %19 = bitcast %struct.features_t* %access165 to i32*, !dbg !949
  %20 = load i32, i32* %18, align 2, !dbg !949
  store i32 %20, i32* %19, align 2, !dbg !949
  %tmp176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i16 0, i32 1, i32 10
  %tmp179 = load i16, i16* %global178, align 2
  %tmp180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global182 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp180, i16 0, i32 1, i32 10
  store i16 %tmp179, i16* %global182, align 2
  %21 = load i16, i16* %global178, align 2, !dbg !951, !tbaa !869
  %cmp35 = icmp ugt i16 %21, 15, !dbg !953
  br i1 %cmp35, label %while.body.backedge, label %while.body20.backedge, !dbg !954

if.then42:                                        ; preds = %while.end25
  tail call void @task_classify(), !dbg !955
  tail call void @commit(), !dbg !955
  %tmp183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global185 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp183, i16 0, i32 1, i32 2
  %tmp186 = load i16, i16* %global185, align 2
  %tmp187 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp187, i16 0, i32 1, i32 2
  store i16 %tmp186, i16* %global189, align 2
  tail call void @task_stats(), !dbg !958
  tail call void @commit(), !dbg !958
  %tmp190 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global192 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i16 0, i32 1, i32 3
  %tmp193 = load i16, i16* %global192, align 2
  %tmp194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global196 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp194, i16 0, i32 1, i32 3
  store i16 %tmp193, i16* %global196, align 2
  %global199 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i16 0, i32 1, i32 4
  %tmp200 = load i16, i16* %global199, align 2
  %global203 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp194, i16 0, i32 1, i32 4
  store i16 %tmp200, i16* %global203, align 2
  %global206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i16 0, i32 1, i32 5
  %tmp207 = load i16, i16* %global206, align 2
  %global210 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp194, i16 0, i32 1, i32 5
  store i16 %tmp207, i16* %global210, align 2
  %22 = load i16, i16* %global192, align 2, !dbg !959, !tbaa !358
  %cmp44 = icmp eq i16 %22, 128, !dbg !961
  br i1 %cmp44, label %while.body.backedge, label %while.body20.backedge, !dbg !962
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree norecurse nounwind writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind }
attributes #14 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!96, !97, !98}
!llvm.ident = !{!99}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 104, type: !91, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !16, globals: !17, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_ar.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{!5, !12}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 40, baseType: !6, size: 16, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11}
!8 = !DIEnumerator(name: "MODE_IDLE", value: 3, isUnsigned: true)
!9 = !DIEnumerator(name: "MODE_TRAIN_STATIONARY", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "MODE_TRAIN_MOVING", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "MODE_RECOGNIZE", value: 0, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 35, baseType: !6, size: 16, elements: !13)
!13 = !{!14, !15}
!14 = !DIEnumerator(name: "CLASS_STATIONARY", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "CLASS_MOVING", value: 1, isUnsigned: true)
!16 = !{!6}
!17 = !{!18, !23, !30, !0, !32, !86, !88}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 619, type: !20, isLocal: true, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 16)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 68, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !26, line: 26, baseType: !27)
!26 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !28, line: 43, baseType: !29)
!28 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!29 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 69, type: !25, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 111, type: !34, isLocal: false, isDefinition: true)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 16)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 97, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 92, size: 1504, elements: !37)
!37 = !{!38, !43, !85}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !36, file: !3, line: 94, baseType: !39, size: 176)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 176, elements: !41)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 65, baseType: !25)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !36, file: !3, line: 95, baseType: !44, size: 1312, offset: 176)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 89, baseType: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 72, size: 1312, elements: !46)
!46 = !{!47, !48, !49, !51, !52, !53, !54, !68, !74, !78, !79, !80, !81, !83, !84}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "pinState", scope: !45, file: !3, line: 74, baseType: !25, size: 16)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "discardedSamplesCount", scope: !45, file: !3, line: 75, baseType: !6, size: 16, offset: 16)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "class", scope: !45, file: !3, line: 76, baseType: !50, size: 16, offset: 32)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "class_t", file: !3, line: 38, baseType: !12)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "totalCount", scope: !45, file: !3, line: 77, baseType: !6, size: 16, offset: 48)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "movingCount", scope: !45, file: !3, line: 78, baseType: !6, size: 16, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "stationaryCount", scope: !45, file: !3, line: 79, baseType: !6, size: 16, offset: 80)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !45, file: !3, line: 80, baseType: !55, size: 72, offset: 96)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 72, elements: !66)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "accelReading", file: !3, line: 27, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "threeAxis_t_8", file: !3, line: 25, baseType: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 21, size: 24, elements: !59)
!59 = !{!60, !64, !65}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !58, file: !3, line: 22, baseType: !61, size: 8)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !26, line: 19, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !28, line: 27, baseType: !63)
!63 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !58, file: !3, line: 23, baseType: !61, size: 8, offset: 8)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !58, file: !3, line: 24, baseType: !61, size: 8, offset: 16)
!66 = !{!67}
!67 = !DISubrange(count: 3)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "features", scope: !45, file: !3, line: 81, baseType: !69, size: 32, offset: 176)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "features_t", file: !3, line: 33, baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 32, elements: !71)
!71 = !{!72, !73}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "meanmag", scope: !70, file: !3, line: 31, baseType: !6, size: 16)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "stddevmag", scope: !70, file: !3, line: 32, baseType: !6, size: 16, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "model_stationary", scope: !45, file: !3, line: 82, baseType: !75, size: 512, offset: 208)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 512, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 16)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "model_moving", scope: !45, file: !3, line: 83, baseType: !75, size: 512, offset: 720)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "trainingSetSize", scope: !45, file: !3, line: 84, baseType: !6, size: 16, offset: 1232)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "samplesInWindow", scope: !45, file: !3, line: 85, baseType: !6, size: 16, offset: 1248)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !45, file: !3, line: 86, baseType: !82, size: 16, offset: 1264)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "run_mode_t", file: !3, line: 48, baseType: !5)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !45, file: !3, line: 87, baseType: !6, size: 16, offset: 1280)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !45, file: !3, line: 88, baseType: !6, size: 16, offset: 1296)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !36, file: !3, line: 96, baseType: !25, size: 16, offset: 1488)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 111, type: !34, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 140, type: !90, isLocal: false, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 176, elements: !41)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 99, size: 3024, elements: !92)
!92 = !{!93, !94, !95}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !91, file: !3, line: 101, baseType: !25, size: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !91, file: !3, line: 102, baseType: !35, size: 1504, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !91, file: !3, line: 103, baseType: !35, size: 1504, offset: 1520)
!96 = !{i32 2, !"Dwarf Version", i32 4}
!97 = !{i32 2, !"Debug Info Version", i32 3}
!98 = !{i32 1, !"wchar_size", i32 2}
!99 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!100 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 113, type: !21, scopeLine: 113, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!101 = !{}
!102 = !DILocation(line: 114, column: 10, scope: !100)
!103 = !{!104, !104, i64 0}
!104 = !{!"int", !105, i64 0}
!105 = !{!"omnipotent char", !106, i64 0}
!106 = !{!"Simple C/C++ TBAA"}
!107 = !DILocation(line: 116, column: 9, scope: !100)
!108 = !{!105, !105, i64 0}
!109 = !DILocation(line: 118, column: 9, scope: !100)
!110 = !DILocation(line: 123, column: 11, scope: !100)
!111 = !DILocation(line: 128, column: 12, scope: !100)
!112 = !DILocation(line: 129, column: 10, scope: !100)
!113 = !DILocation(line: 130, column: 10, scope: !100)
!114 = !DILocation(line: 132, column: 10, scope: !100)
!115 = !DILocation(line: 133, column: 12, scope: !100)
!116 = !DILocation(line: 136, column: 10, scope: !100)
!117 = !DILocation(line: 138, column: 1, scope: !100)
!118 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 142, type: !21, scopeLine: 142, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !119)
!119 = !{!120, !122}
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 169, type: !6)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 169, column: 33)
!122 = !DILocalVariable(name: "__x", scope: !123, file: !3, line: 169, type: !6)
!123 = distinct !DILexicalBlock(scope: !118, file: !3, line: 169, column: 65)
!124 = !DILocation(line: 143, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !3, line: 143, column: 8)
!126 = !{!127, !128, i64 0}
!127 = !{!"Camel", !128, i64 0, !129, i64 2, !129, i64 190}
!128 = !{!"short", !105, i64 0}
!129 = !{!"camel_buffer_t", !105, i64 0, !130, i64 22, !128, i64 186}
!130 = !{!"camel_global_t", !128, i64 0, !104, i64 2, !105, i64 4, !104, i64 6, !104, i64 8, !104, i64 10, !105, i64 12, !131, i64 22, !105, i64 26, !105, i64 90, !104, i64 154, !104, i64 156, !105, i64 158, !104, i64 160, !104, i64 162}
!131 = !{!"", !104, i64 0, !104, i64 2}
!132 = !DILocation(line: 143, column: 8, scope: !118)
!133 = !DILocation(line: 144, column: 14, scope: !134)
!134 = distinct !DILexicalBlock(scope: !125, file: !3, line: 143, column: 34)
!135 = !{!136, !136, i64 0}
!136 = !{!"any pointer", !105, i64 0}
!137 = !DILocation(line: 145, column: 16, scope: !134)
!138 = !DILocation(line: 146, column: 5, scope: !134)
!139 = !DILocation(line: 147, column: 14, scope: !140)
!140 = distinct !DILexicalBlock(scope: !141, file: !3, line: 146, column: 41)
!141 = distinct !DILexicalBlock(scope: !125, file: !3, line: 146, column: 15)
!142 = !DILocation(line: 148, column: 16, scope: !140)
!143 = !DILocation(line: 149, column: 5, scope: !140)
!144 = !DILocation(line: 150, column: 9, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !3, line: 149, column: 12)
!146 = !DILocation(line: 167, column: 3, scope: !147)
!147 = distinct !DILexicalBlock(scope: !118, file: !3, line: 167, column: 3)
!148 = !{!128, !128, i64 0}
!149 = !{i32 -2146649282}
!150 = !DILocation(line: 169, column: 33, scope: !121)
!151 = !{i32 -2146649046}
!152 = !DILocation(line: 0, scope: !121)
!153 = !DILocation(line: 169, column: 51, scope: !118)
!154 = !DILocation(line: 169, column: 33, scope: !118)
!155 = !DILocation(line: 169, column: 65, scope: !123)
!156 = !{i32 -2146648921}
!157 = !DILocation(line: 0, scope: !123)
!158 = !DILocation(line: 169, column: 63, scope: !118)
!159 = !DILocation(line: 169, column: 19, scope: !118)
!160 = !DILocation(line: 169, column: 17, scope: !118)
!161 = !DILocation(line: 170, column: 37, scope: !118)
!162 = !DILocation(line: 170, column: 23, scope: !118)
!163 = !DILocation(line: 170, column: 21, scope: !118)
!164 = !DILocation(line: 173, column: 27, scope: !165)
!165 = distinct !DILexicalBlock(scope: !118, file: !3, line: 173, column: 6)
!166 = !DILocation(line: 173, column: 33, scope: !165)
!167 = !{!129, !128, i64 186}
!168 = !DILocation(line: 173, column: 24, scope: !165)
!169 = !DILocation(line: 173, column: 6, scope: !118)
!170 = !DILocation(line: 174, column: 11, scope: !171)
!171 = distinct !DILexicalBlock(scope: !165, file: !3, line: 173, column: 51)
!172 = !DILocation(line: 174, column: 4, scope: !171)
!173 = !DILocation(line: 114, column: 10, scope: !100, inlinedAt: !174)
!174 = distinct !DILocation(line: 175, column: 4, scope: !171)
!175 = !DILocation(line: 116, column: 9, scope: !100, inlinedAt: !174)
!176 = !DILocation(line: 118, column: 9, scope: !100, inlinedAt: !174)
!177 = !DILocation(line: 123, column: 11, scope: !100, inlinedAt: !174)
!178 = !DILocation(line: 128, column: 12, scope: !100, inlinedAt: !174)
!179 = !DILocation(line: 129, column: 10, scope: !100, inlinedAt: !174)
!180 = !DILocation(line: 130, column: 10, scope: !100, inlinedAt: !174)
!181 = !DILocation(line: 132, column: 10, scope: !100, inlinedAt: !174)
!182 = !DILocation(line: 133, column: 12, scope: !100, inlinedAt: !174)
!183 = !DILocation(line: 136, column: 10, scope: !100, inlinedAt: !174)
!184 = !DILocation(line: 176, column: 24, scope: !171)
!185 = !DILocation(line: 176, column: 4, scope: !171)
!186 = !DILocation(line: 177, column: 3, scope: !171)
!187 = !DILocation(line: 178, column: 4, scope: !188)
!188 = distinct !DILexicalBlock(scope: !165, file: !3, line: 177, column: 9)
!189 = !DILocation(line: 181, column: 1, scope: !118)
!190 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 232, type: !21, scopeLine: 232, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !191)
!191 = !{!192, !197, !199, !202}
!192 = !DILocalVariable(name: "__x", scope: !193, file: !3, line: 239, type: !6)
!193 = distinct !DILexicalBlock(scope: !194, file: !3, line: 239, column: 45)
!194 = distinct !DILexicalBlock(scope: !195, file: !3, line: 235, column: 39)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 235, column: 14)
!196 = distinct !DILexicalBlock(scope: !190, file: !3, line: 233, column: 8)
!197 = !DILocalVariable(name: "__x", scope: !198, file: !3, line: 239, type: !6)
!198 = distinct !DILexicalBlock(scope: !194, file: !3, line: 239, column: 77)
!199 = !DILocalVariable(name: "__x", scope: !200, file: !3, line: 247, type: !6)
!200 = distinct !DILexicalBlock(scope: !201, file: !3, line: 247, column: 45)
!201 = distinct !DILexicalBlock(scope: !195, file: !3, line: 243, column: 17)
!202 = !DILocalVariable(name: "__x", scope: !203, file: !3, line: 247, type: !6)
!203 = distinct !DILexicalBlock(scope: !201, file: !3, line: 247, column: 77)
!204 = !DILocation(line: 235, column: 20, scope: !195)
!205 = !DILocation(line: 235, column: 25, scope: !195)
!206 = !DILocation(line: 235, column: 14, scope: !196)
!207 = !DILocation(line: 236, column: 17, scope: !194)
!208 = !DILocation(line: 237, column: 19, scope: !194)
!209 = !DILocation(line: 238, column: 12, scope: !194)
!210 = !DILocation(line: 239, column: 45, scope: !193)
!211 = !{i32 -2146648607}
!212 = !DILocation(line: 0, scope: !193)
!213 = !DILocation(line: 239, column: 77, scope: !198)
!214 = !{i32 -2146648482}
!215 = !DILocation(line: 0, scope: !198)
!216 = !DILocation(line: 243, column: 11, scope: !194)
!217 = !DILocation(line: 244, column: 17, scope: !201)
!218 = !DILocation(line: 245, column: 19, scope: !201)
!219 = !DILocation(line: 246, column: 12, scope: !201)
!220 = !DILocation(line: 247, column: 45, scope: !200)
!221 = !{i32 -2146648350}
!222 = !DILocation(line: 0, scope: !200)
!223 = !DILocation(line: 247, column: 77, scope: !203)
!224 = !{i32 -2146648225}
!225 = !DILocation(line: 0, scope: !203)
!226 = !DILocation(line: 0, scope: !195)
!227 = !DILocation(line: 255, column: 1, scope: !190)
!228 = distinct !DISubprogram(name: "ACCEL_singleSample_", scope: !3, file: !3, line: 280, type: !229, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !232)
!229 = !DISubroutineType(types: !230)
!230 = !{!6, !231, !6}
!231 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 16)
!232 = !{!233, !234}
!233 = !DILocalVariable(name: "result", arg: 1, scope: !228, file: !3, line: 280, type: !231)
!234 = !DILocalVariable(name: "seed", arg: 2, scope: !228, file: !3, line: 280, type: !6)
!235 = !DILocation(line: 0, scope: !228)
!236 = !DILocation(line: 281, column: 19, scope: !228)
!237 = !DILocation(line: 281, column: 23, scope: !228)
!238 = !DILocation(line: 281, column: 14, scope: !228)
!239 = !DILocation(line: 281, column: 10, scope: !228)
!240 = !DILocation(line: 281, column: 12, scope: !228)
!241 = !{!242, !105, i64 0}
!242 = !{!"", !105, i64 0, !105, i64 1, !105, i64 2}
!243 = !DILocation(line: 282, column: 22, scope: !228)
!244 = !DILocation(line: 282, column: 26, scope: !228)
!245 = !DILocation(line: 282, column: 14, scope: !228)
!246 = !DILocation(line: 282, column: 10, scope: !228)
!247 = !DILocation(line: 282, column: 12, scope: !228)
!248 = !{!242, !105, i64 1}
!249 = !DILocation(line: 283, column: 25, scope: !228)
!250 = !DILocation(line: 283, column: 29, scope: !228)
!251 = !DILocation(line: 283, column: 14, scope: !228)
!252 = !DILocation(line: 283, column: 10, scope: !228)
!253 = !DILocation(line: 283, column: 12, scope: !228)
!254 = !{!242, !105, i64 2}
!255 = !DILocation(line: 284, column: 2, scope: !228)
!256 = !DILocation(line: 286, column: 2, scope: !228)
!257 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 289, type: !21, scopeLine: 290, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!258 = !DILocation(line: 291, column: 2, scope: !257)
!259 = !DILocation(line: 291, column: 15, scope: !257)
!260 = !{!129, !128, i64 22}
!261 = !DILocation(line: 292, column: 2, scope: !257)
!262 = !DILocation(line: 292, column: 12, scope: !257)
!263 = !{!129, !104, i64 184}
!264 = !DILocation(line: 293, column: 2, scope: !257)
!265 = !DILocation(line: 293, column: 11, scope: !257)
!266 = !{!129, !104, i64 182}
!267 = !DILocation(line: 294, column: 1, scope: !257)
!268 = distinct !DISubprogram(name: "task_selectMode", scope: !3, file: !3, line: 296, type: !21, scopeLine: 297, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !269)
!269 = !{!270, !271, !272}
!270 = !DILocalVariable(name: "pin_state", scope: !268, file: !3, line: 298, type: !25)
!271 = !DILocalVariable(name: "mode", scope: !268, file: !3, line: 307, type: !82)
!272 = !DILocalVariable(name: "class", scope: !268, file: !3, line: 308, type: !50)
!273 = !DILocation(line: 298, column: 2, scope: !268)
!274 = !DILocation(line: 298, column: 11, scope: !268)
!275 = !DILocation(line: 299, column: 4, scope: !268)
!276 = !DILocation(line: 299, column: 2, scope: !268)
!277 = !DILocation(line: 301, column: 5, scope: !278)
!278 = distinct !DILexicalBlock(scope: !268, file: !3, line: 301, column: 5)
!279 = !DILocation(line: 301, column: 15, scope: !278)
!280 = !DILocation(line: 301, column: 5, scope: !268)
!281 = !DILocation(line: 301, column: 30, scope: !278)
!282 = !DILocation(line: 301, column: 21, scope: !278)
!283 = !DILocation(line: 302, column: 5, scope: !284)
!284 = distinct !DILexicalBlock(scope: !268, file: !3, line: 302, column: 5)
!285 = !DILocation(line: 302, column: 14, scope: !284)
!286 = !DILocation(line: 302, column: 5, scope: !268)
!287 = !DILocation(line: 302, column: 28, scope: !284)
!288 = !DILocation(line: 302, column: 19, scope: !284)
!289 = !DILocation(line: 303, column: 6, scope: !290)
!290 = distinct !DILexicalBlock(scope: !268, file: !3, line: 303, column: 6)
!291 = !DILocation(line: 303, column: 16, scope: !290)
!292 = !DILocation(line: 303, column: 6, scope: !268)
!293 = !DILocation(line: 305, column: 3, scope: !294)
!294 = distinct !DILexicalBlock(scope: !290, file: !3, line: 303, column: 22)
!295 = !DILocation(line: 307, column: 2, scope: !268)
!296 = !DILocation(line: 307, column: 13, scope: !268)
!297 = !DILocation(line: 308, column: 2, scope: !268)
!298 = !DILocation(line: 308, column: 10, scope: !268)
!299 = !DILocation(line: 310, column: 7, scope: !300)
!300 = distinct !DILexicalBlock(scope: !268, file: !3, line: 310, column: 6)
!301 = !DILocation(line: 310, column: 17, scope: !300)
!302 = !DILocation(line: 310, column: 42, scope: !300)
!303 = !DILocation(line: 311, column: 5, scope: !300)
!304 = !DILocation(line: 311, column: 15, scope: !300)
!305 = !DILocation(line: 311, column: 37, scope: !300)
!306 = !DILocation(line: 312, column: 4, scope: !300)
!307 = !DILocation(line: 312, column: 17, scope: !300)
!308 = !DILocation(line: 312, column: 14, scope: !300)
!309 = !DILocation(line: 310, column: 6, scope: !268)
!310 = !DILocation(line: 313, column: 13, scope: !311)
!311 = distinct !DILexicalBlock(scope: !300, file: !3, line: 312, column: 31)
!312 = !DILocation(line: 314, column: 2, scope: !311)
!313 = !DILocation(line: 315, column: 18, scope: !314)
!314 = distinct !DILexicalBlock(scope: !300, file: !3, line: 314, column: 9)
!315 = !DILocation(line: 315, column: 3, scope: !314)
!316 = !DILocation(line: 315, column: 16, scope: !314)
!317 = !DILocation(line: 318, column: 9, scope: !268)
!318 = !DILocation(line: 318, column: 2, scope: !268)
!319 = !DILocation(line: 320, column: 4, scope: !320)
!320 = distinct !DILexicalBlock(scope: !268, file: !3, line: 318, column: 20)
!321 = !DILocation(line: 320, column: 30, scope: !320)
!322 = !{!129, !104, i64 24}
!323 = !DILocation(line: 321, column: 4, scope: !320)
!324 = !DILocation(line: 321, column: 13, scope: !320)
!325 = !{!129, !105, i64 180}
!326 = !DILocation(line: 322, column: 4, scope: !320)
!327 = !DILocation(line: 322, column: 14, scope: !320)
!328 = !{!129, !105, i64 26}
!329 = !DILocation(line: 323, column: 4, scope: !320)
!330 = !DILocation(line: 323, column: 24, scope: !320)
!331 = !{!129, !104, i64 178}
!332 = !DILocation(line: 325, column: 4, scope: !320)
!333 = !DILocation(line: 328, column: 4, scope: !320)
!334 = !DILocation(line: 328, column: 30, scope: !320)
!335 = !DILocation(line: 329, column: 4, scope: !320)
!336 = !DILocation(line: 329, column: 13, scope: !320)
!337 = !DILocation(line: 330, column: 4, scope: !320)
!338 = !DILocation(line: 330, column: 14, scope: !320)
!339 = !DILocation(line: 331, column: 4, scope: !320)
!340 = !DILocation(line: 331, column: 24, scope: !320)
!341 = !DILocation(line: 333, column: 4, scope: !320)
!342 = !DILocation(line: 336, column: 4, scope: !320)
!343 = !DILocation(line: 336, column: 13, scope: !320)
!344 = !DILocation(line: 338, column: 4, scope: !320)
!345 = !DILocation(line: 341, column: 4, scope: !320)
!346 = !DILocation(line: 341, column: 13, scope: !320)
!347 = !DILocation(line: 342, column: 4, scope: !320)
!348 = !DILocation(line: 344, column: 1, scope: !268)
!349 = distinct !DISubprogram(name: "task_resetStats", scope: !3, file: !3, line: 346, type: !21, scopeLine: 347, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!350 = !DILocation(line: 349, column: 2, scope: !349)
!351 = !DILocation(line: 349, column: 18, scope: !349)
!352 = !{!129, !104, i64 30}
!353 = !DILocation(line: 350, column: 2, scope: !349)
!354 = !DILocation(line: 350, column: 22, scope: !349)
!355 = !{!129, !104, i64 32}
!356 = !DILocation(line: 351, column: 2, scope: !349)
!357 = !DILocation(line: 351, column: 17, scope: !349)
!358 = !{!129, !104, i64 28}
!359 = !DILocation(line: 353, column: 2, scope: !349)
!360 = !DILocation(line: 353, column: 22, scope: !349)
!361 = !DILocation(line: 355, column: 1, scope: !349)
!362 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 357, type: !21, scopeLine: 358, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !363)
!363 = !{!364}
!364 = !DILocalVariable(name: "sample", scope: !362, file: !3, line: 360, type: !56)
!365 = !DILocation(line: 360, column: 2, scope: !362)
!366 = !DILocation(line: 360, column: 15, scope: !362)
!367 = !DILocation(line: 361, column: 31, scope: !362)
!368 = !DILocation(line: 361, column: 2, scope: !362)
!369 = !DILocation(line: 362, column: 2, scope: !362)
!370 = !DILocation(line: 362, column: 13, scope: !362)
!371 = !DILocation(line: 362, column: 36, scope: !362)
!372 = !{i64 0, i64 1, !108, i64 1, i64 1, !108, i64 2, i64 1, !108}
!373 = !DILocation(line: 363, column: 4, scope: !362)
!374 = !DILocation(line: 363, column: 2, scope: !362)
!375 = !DILocation(line: 365, column: 1, scope: !362)
!376 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 367, type: !21, scopeLine: 368, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !377)
!377 = !{!378, !380, !381}
!378 = !DILocalVariable(name: "sample", scope: !376, file: !3, line: 371, type: !379)
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 16)
!380 = !DILocalVariable(name: "transformedSample", scope: !376, file: !3, line: 372, type: !56)
!381 = !DILocalVariable(name: "i", scope: !382, file: !3, line: 374, type: !6)
!382 = distinct !DILexicalBlock(scope: !376, file: !3, line: 374, column: 2)
!383 = !DILocation(line: 369, column: 5, scope: !376)
!384 = !DILocation(line: 369, column: 25, scope: !376)
!385 = !DILocation(line: 371, column: 2, scope: !376)
!386 = !DILocation(line: 371, column: 16, scope: !376)
!387 = !DILocation(line: 372, column: 2, scope: !376)
!388 = !DILocation(line: 372, column: 15, scope: !376)
!389 = !DILocation(line: 374, column: 7, scope: !382)
!390 = !DILocation(line: 374, column: 16, scope: !382)
!391 = !DILocation(line: 374, column: 23, scope: !392)
!392 = distinct !DILexicalBlock(scope: !382, file: !3, line: 374, column: 2)
!393 = !DILocation(line: 374, column: 25, scope: !392)
!394 = !DILocation(line: 374, column: 2, scope: !382)
!395 = !DILocation(line: 374, column: 2, scope: !392)
!396 = !DILocation(line: 375, column: 7, scope: !397)
!397 = distinct !DILexicalBlock(scope: !398, file: !3, line: 375, column: 7)
!398 = distinct !DILexicalBlock(scope: !392, file: !3, line: 374, column: 51)
!399 = !DILocation(line: 375, column: 18, scope: !397)
!400 = !DILocation(line: 375, column: 21, scope: !397)
!401 = !DILocation(line: 375, column: 23, scope: !397)
!402 = !DILocation(line: 375, column: 44, scope: !397)
!403 = !DILocation(line: 376, column: 5, scope: !397)
!404 = !DILocation(line: 376, column: 16, scope: !397)
!405 = !DILocation(line: 376, column: 19, scope: !397)
!406 = !DILocation(line: 376, column: 21, scope: !397)
!407 = !DILocation(line: 376, column: 42, scope: !397)
!408 = !DILocation(line: 377, column: 5, scope: !397)
!409 = !DILocation(line: 377, column: 16, scope: !397)
!410 = !DILocation(line: 377, column: 19, scope: !397)
!411 = !DILocation(line: 377, column: 21, scope: !397)
!412 = !DILocation(line: 375, column: 7, scope: !398)
!413 = !DILocation(line: 379, column: 23, scope: !414)
!414 = distinct !DILexicalBlock(scope: !397, file: !3, line: 377, column: 43)
!415 = !DILocation(line: 379, column: 34, scope: !414)
!416 = !DILocation(line: 379, column: 37, scope: !414)
!417 = !DILocation(line: 379, column: 39, scope: !414)
!418 = !DILocation(line: 379, column: 22, scope: !414)
!419 = !DILocation(line: 380, column: 7, scope: !414)
!420 = !DILocation(line: 380, column: 18, scope: !414)
!421 = !DILocation(line: 380, column: 21, scope: !414)
!422 = !DILocation(line: 379, column: 4, scope: !414)
!423 = !DILocation(line: 379, column: 15, scope: !414)
!424 = !DILocation(line: 379, column: 18, scope: !414)
!425 = !DILocation(line: 379, column: 20, scope: !414)
!426 = !DILocation(line: 381, column: 23, scope: !414)
!427 = !DILocation(line: 381, column: 34, scope: !414)
!428 = !DILocation(line: 381, column: 37, scope: !414)
!429 = !DILocation(line: 381, column: 39, scope: !414)
!430 = !DILocation(line: 381, column: 22, scope: !414)
!431 = !DILocation(line: 382, column: 7, scope: !414)
!432 = !DILocation(line: 382, column: 18, scope: !414)
!433 = !DILocation(line: 382, column: 21, scope: !414)
!434 = !DILocation(line: 381, column: 4, scope: !414)
!435 = !DILocation(line: 381, column: 15, scope: !414)
!436 = !DILocation(line: 381, column: 18, scope: !414)
!437 = !DILocation(line: 381, column: 20, scope: !414)
!438 = !DILocation(line: 383, column: 23, scope: !414)
!439 = !DILocation(line: 383, column: 34, scope: !414)
!440 = !DILocation(line: 383, column: 37, scope: !414)
!441 = !DILocation(line: 383, column: 39, scope: !414)
!442 = !DILocation(line: 383, column: 22, scope: !414)
!443 = !DILocation(line: 384, column: 7, scope: !414)
!444 = !DILocation(line: 384, column: 18, scope: !414)
!445 = !DILocation(line: 384, column: 21, scope: !414)
!446 = !DILocation(line: 383, column: 4, scope: !414)
!447 = !DILocation(line: 383, column: 15, scope: !414)
!448 = !DILocation(line: 383, column: 18, scope: !414)
!449 = !DILocation(line: 383, column: 20, scope: !414)
!450 = !DILocation(line: 385, column: 3, scope: !414)
!451 = !DILocation(line: 386, column: 2, scope: !398)
!452 = !DILocation(line: 374, column: 47, scope: !392)
!453 = distinct !{!453, !394, !454}
!454 = !DILocation(line: 386, column: 2, scope: !382)
!455 = !DILocation(line: 387, column: 1, scope: !376)
!456 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 389, type: !21, scopeLine: 390, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !457)
!457 = !{!458, !459, !460, !461, !463, !464}
!458 = !DILocalVariable(name: "mean", scope: !456, file: !3, line: 391, type: !56)
!459 = !DILocalVariable(name: "stddev", scope: !456, file: !3, line: 391, type: !56)
!460 = !DILocalVariable(name: "features", scope: !456, file: !3, line: 394, type: !69)
!461 = !DILocalVariable(name: "i", scope: !456, file: !3, line: 396, type: !462)
!462 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!463 = !DILocalVariable(name: "meanmag", scope: !456, file: !3, line: 419, type: !6)
!464 = !DILocalVariable(name: "stddevmag", scope: !456, file: !3, line: 420, type: !6)
!465 = !DILocation(line: 391, column: 2, scope: !456)
!466 = !DILocation(line: 391, column: 15, scope: !456)
!467 = !DILocation(line: 391, column: 21, scope: !456)
!468 = !DILocation(line: 392, column: 25, scope: !456)
!469 = !DILocation(line: 392, column: 27, scope: !456)
!470 = !DILocation(line: 392, column: 16, scope: !456)
!471 = !DILocation(line: 392, column: 18, scope: !456)
!472 = !DILocation(line: 392, column: 7, scope: !456)
!473 = !DILocation(line: 392, column: 9, scope: !456)
!474 = !DILocation(line: 393, column: 31, scope: !456)
!475 = !DILocation(line: 393, column: 33, scope: !456)
!476 = !DILocation(line: 393, column: 20, scope: !456)
!477 = !DILocation(line: 393, column: 22, scope: !456)
!478 = !DILocation(line: 393, column: 9, scope: !456)
!479 = !DILocation(line: 393, column: 11, scope: !456)
!480 = !DILocation(line: 394, column: 2, scope: !456)
!481 = !DILocation(line: 394, column: 13, scope: !456)
!482 = !DILocation(line: 396, column: 2, scope: !456)
!483 = !DILocation(line: 396, column: 6, scope: !456)
!484 = !DILocation(line: 397, column: 9, scope: !485)
!485 = distinct !DILexicalBlock(scope: !456, file: !3, line: 397, column: 2)
!486 = !DILocation(line: 397, column: 7, scope: !485)
!487 = !DILocation(line: 397, column: 14, scope: !488)
!488 = distinct !DILexicalBlock(scope: !485, file: !3, line: 397, column: 2)
!489 = !DILocation(line: 397, column: 16, scope: !488)
!490 = !DILocation(line: 397, column: 2, scope: !485)
!491 = !DILocation(line: 399, column: 13, scope: !492)
!492 = distinct !DILexicalBlock(scope: !488, file: !3, line: 397, column: 42)
!493 = !DILocation(line: 399, column: 24, scope: !492)
!494 = !DILocation(line: 399, column: 27, scope: !492)
!495 = !DILocation(line: 399, column: 8, scope: !492)
!496 = !DILocation(line: 399, column: 10, scope: !492)
!497 = !DILocation(line: 400, column: 13, scope: !492)
!498 = !DILocation(line: 400, column: 24, scope: !492)
!499 = !DILocation(line: 400, column: 27, scope: !492)
!500 = !DILocation(line: 400, column: 8, scope: !492)
!501 = !DILocation(line: 400, column: 10, scope: !492)
!502 = !DILocation(line: 401, column: 13, scope: !492)
!503 = !DILocation(line: 401, column: 24, scope: !492)
!504 = !DILocation(line: 401, column: 27, scope: !492)
!505 = !DILocation(line: 401, column: 8, scope: !492)
!506 = !DILocation(line: 401, column: 10, scope: !492)
!507 = !DILocation(line: 402, column: 2, scope: !492)
!508 = !DILocation(line: 397, column: 38, scope: !488)
!509 = !DILocation(line: 397, column: 2, scope: !488)
!510 = distinct !{!510, !490, !511}
!511 = !DILocation(line: 402, column: 2, scope: !485)
!512 = !DILocation(line: 403, column: 7, scope: !456)
!513 = !DILocation(line: 403, column: 9, scope: !456)
!514 = !DILocation(line: 404, column: 7, scope: !456)
!515 = !DILocation(line: 404, column: 9, scope: !456)
!516 = !DILocation(line: 405, column: 7, scope: !456)
!517 = !DILocation(line: 405, column: 9, scope: !456)
!518 = !DILocation(line: 407, column: 9, scope: !519)
!519 = distinct !DILexicalBlock(scope: !456, file: !3, line: 407, column: 2)
!520 = !DILocation(line: 407, column: 7, scope: !519)
!521 = !DILocation(line: 407, column: 14, scope: !522)
!522 = distinct !DILexicalBlock(scope: !519, file: !3, line: 407, column: 2)
!523 = !DILocation(line: 407, column: 16, scope: !522)
!524 = !DILocation(line: 407, column: 2, scope: !519)
!525 = !DILocation(line: 408, column: 15, scope: !526)
!526 = distinct !DILexicalBlock(scope: !522, file: !3, line: 407, column: 42)
!527 = !DILocation(line: 408, column: 26, scope: !526)
!528 = !DILocation(line: 408, column: 29, scope: !526)
!529 = !DILocation(line: 408, column: 38, scope: !526)
!530 = !DILocation(line: 408, column: 33, scope: !526)
!531 = !DILocation(line: 408, column: 31, scope: !526)
!532 = !DILocation(line: 408, column: 42, scope: !526)
!533 = !DILocation(line: 408, column: 53, scope: !526)
!534 = !DILocation(line: 408, column: 56, scope: !526)
!535 = !DILocation(line: 408, column: 65, scope: !526)
!536 = !DILocation(line: 408, column: 60, scope: !526)
!537 = !DILocation(line: 408, column: 58, scope: !526)
!538 = !DILocation(line: 409, column: 11, scope: !526)
!539 = !DILocation(line: 409, column: 6, scope: !526)
!540 = !DILocation(line: 409, column: 15, scope: !526)
!541 = !DILocation(line: 409, column: 26, scope: !526)
!542 = !DILocation(line: 409, column: 29, scope: !526)
!543 = !DILocation(line: 409, column: 13, scope: !526)
!544 = !DILocation(line: 408, column: 10, scope: !526)
!545 = !DILocation(line: 408, column: 12, scope: !526)
!546 = !DILocation(line: 410, column: 15, scope: !526)
!547 = !DILocation(line: 410, column: 26, scope: !526)
!548 = !DILocation(line: 410, column: 29, scope: !526)
!549 = !DILocation(line: 410, column: 38, scope: !526)
!550 = !DILocation(line: 410, column: 33, scope: !526)
!551 = !DILocation(line: 410, column: 31, scope: !526)
!552 = !DILocation(line: 410, column: 42, scope: !526)
!553 = !DILocation(line: 410, column: 53, scope: !526)
!554 = !DILocation(line: 410, column: 56, scope: !526)
!555 = !DILocation(line: 410, column: 65, scope: !526)
!556 = !DILocation(line: 410, column: 60, scope: !526)
!557 = !DILocation(line: 410, column: 58, scope: !526)
!558 = !DILocation(line: 411, column: 11, scope: !526)
!559 = !DILocation(line: 411, column: 6, scope: !526)
!560 = !DILocation(line: 411, column: 15, scope: !526)
!561 = !DILocation(line: 411, column: 26, scope: !526)
!562 = !DILocation(line: 411, column: 29, scope: !526)
!563 = !DILocation(line: 411, column: 13, scope: !526)
!564 = !DILocation(line: 410, column: 10, scope: !526)
!565 = !DILocation(line: 410, column: 12, scope: !526)
!566 = !DILocation(line: 412, column: 15, scope: !526)
!567 = !DILocation(line: 412, column: 26, scope: !526)
!568 = !DILocation(line: 412, column: 29, scope: !526)
!569 = !DILocation(line: 412, column: 38, scope: !526)
!570 = !DILocation(line: 412, column: 33, scope: !526)
!571 = !DILocation(line: 412, column: 31, scope: !526)
!572 = !DILocation(line: 412, column: 42, scope: !526)
!573 = !DILocation(line: 412, column: 53, scope: !526)
!574 = !DILocation(line: 412, column: 56, scope: !526)
!575 = !DILocation(line: 412, column: 65, scope: !526)
!576 = !DILocation(line: 412, column: 60, scope: !526)
!577 = !DILocation(line: 412, column: 58, scope: !526)
!578 = !DILocation(line: 413, column: 11, scope: !526)
!579 = !DILocation(line: 413, column: 6, scope: !526)
!580 = !DILocation(line: 413, column: 15, scope: !526)
!581 = !DILocation(line: 413, column: 26, scope: !526)
!582 = !DILocation(line: 413, column: 29, scope: !526)
!583 = !DILocation(line: 413, column: 13, scope: !526)
!584 = !DILocation(line: 412, column: 10, scope: !526)
!585 = !DILocation(line: 412, column: 12, scope: !526)
!586 = !DILocation(line: 414, column: 2, scope: !526)
!587 = !DILocation(line: 407, column: 38, scope: !522)
!588 = !DILocation(line: 407, column: 2, scope: !522)
!589 = distinct !{!589, !524, !590}
!590 = !DILocation(line: 414, column: 2, scope: !519)
!591 = !DILocation(line: 415, column: 9, scope: !456)
!592 = !DILocation(line: 415, column: 11, scope: !456)
!593 = !DILocation(line: 416, column: 9, scope: !456)
!594 = !DILocation(line: 416, column: 11, scope: !456)
!595 = !DILocation(line: 417, column: 9, scope: !456)
!596 = !DILocation(line: 417, column: 11, scope: !456)
!597 = !DILocation(line: 419, column: 2, scope: !456)
!598 = !DILocation(line: 419, column: 11, scope: !456)
!599 = !DILocation(line: 419, column: 26, scope: !456)
!600 = !DILocation(line: 419, column: 21, scope: !456)
!601 = !DILocation(line: 419, column: 33, scope: !456)
!602 = !DILocation(line: 419, column: 28, scope: !456)
!603 = !DILocation(line: 419, column: 27, scope: !456)
!604 = !DILocation(line: 419, column: 42, scope: !456)
!605 = !DILocation(line: 419, column: 37, scope: !456)
!606 = !DILocation(line: 419, column: 49, scope: !456)
!607 = !DILocation(line: 419, column: 44, scope: !456)
!608 = !DILocation(line: 419, column: 43, scope: !456)
!609 = !DILocation(line: 419, column: 35, scope: !456)
!610 = !DILocation(line: 419, column: 58, scope: !456)
!611 = !DILocation(line: 419, column: 53, scope: !456)
!612 = !DILocation(line: 419, column: 65, scope: !456)
!613 = !DILocation(line: 419, column: 60, scope: !456)
!614 = !DILocation(line: 419, column: 59, scope: !456)
!615 = !DILocation(line: 419, column: 51, scope: !456)
!616 = !DILocation(line: 420, column: 2, scope: !456)
!617 = !DILocation(line: 420, column: 11, scope: !456)
!618 = !DILocation(line: 420, column: 30, scope: !456)
!619 = !DILocation(line: 420, column: 23, scope: !456)
!620 = !DILocation(line: 420, column: 39, scope: !456)
!621 = !DILocation(line: 420, column: 32, scope: !456)
!622 = !DILocation(line: 420, column: 31, scope: !456)
!623 = !DILocation(line: 420, column: 50, scope: !456)
!624 = !DILocation(line: 420, column: 43, scope: !456)
!625 = !DILocation(line: 420, column: 59, scope: !456)
!626 = !DILocation(line: 420, column: 52, scope: !456)
!627 = !DILocation(line: 420, column: 51, scope: !456)
!628 = !DILocation(line: 420, column: 41, scope: !456)
!629 = !DILocation(line: 420, column: 70, scope: !456)
!630 = !DILocation(line: 420, column: 63, scope: !456)
!631 = !DILocation(line: 420, column: 79, scope: !456)
!632 = !DILocation(line: 420, column: 72, scope: !456)
!633 = !DILocation(line: 420, column: 71, scope: !456)
!634 = !DILocation(line: 420, column: 61, scope: !456)
!635 = !DILocation(line: 421, column: 28, scope: !456)
!636 = !DILocation(line: 421, column: 23, scope: !456)
!637 = !DILocation(line: 421, column: 11, scope: !456)
!638 = !DILocation(line: 421, column: 21, scope: !456)
!639 = !{!131, !104, i64 0}
!640 = !DILocation(line: 422, column: 28, scope: !456)
!641 = !DILocation(line: 422, column: 23, scope: !456)
!642 = !DILocation(line: 422, column: 11, scope: !456)
!643 = !DILocation(line: 422, column: 21, scope: !456)
!644 = !{!131, !104, i64 2}
!645 = !DILocation(line: 424, column: 10, scope: !456)
!646 = !DILocation(line: 424, column: 2, scope: !456)
!647 = !DILocation(line: 427, column: 4, scope: !648)
!648 = distinct !DILexicalBlock(scope: !456, file: !3, line: 424, column: 20)
!649 = !DILocation(line: 427, column: 19, scope: !648)
!650 = !{i64 0, i64 2, !103, i64 2, i64 2, !103}
!651 = !DILocation(line: 428, column: 4, scope: !648)
!652 = !DILocation(line: 430, column: 4, scope: !648)
!653 = !DILocation(line: 430, column: 19, scope: !648)
!654 = !DILocation(line: 431, column: 4, scope: !648)
!655 = !DILocation(line: 433, column: 4, scope: !648)
!656 = !DILocation(line: 435, column: 1, scope: !456)
!657 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 437, type: !21, scopeLine: 437, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !658)
!658 = !{!659, !660, !661, !662, !663, !665, !666, !670, !671, !672}
!659 = !DILocalVariable(name: "move_less_error", scope: !657, file: !3, line: 438, type: !462)
!660 = !DILocalVariable(name: "stat_less_error", scope: !657, file: !3, line: 439, type: !462)
!661 = !DILocalVariable(name: "i", scope: !657, file: !3, line: 440, type: !462)
!662 = !DILocalVariable(name: "class", scope: !657, file: !3, line: 441, type: !50)
!663 = !DILocalVariable(name: "meanmag", scope: !657, file: !3, line: 442, type: !664)
!664 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!665 = !DILocalVariable(name: "stddevmag", scope: !657, file: !3, line: 443, type: !664)
!666 = !DILocalVariable(name: "stat_mean_err", scope: !667, file: !3, line: 449, type: !664)
!667 = distinct !DILexicalBlock(scope: !668, file: !3, line: 448, column: 35)
!668 = distinct !DILexicalBlock(scope: !669, file: !3, line: 448, column: 2)
!669 = distinct !DILexicalBlock(scope: !657, file: !3, line: 448, column: 2)
!670 = !DILocalVariable(name: "stat_sd_err", scope: !667, file: !3, line: 453, type: !664)
!671 = !DILocalVariable(name: "move_mean_err", scope: !667, file: !3, line: 457, type: !664)
!672 = !DILocalVariable(name: "move_sd_err", scope: !667, file: !3, line: 461, type: !664)
!673 = !DILocation(line: 438, column: 2, scope: !657)
!674 = !DILocation(line: 438, column: 6, scope: !657)
!675 = !DILocation(line: 439, column: 2, scope: !657)
!676 = !DILocation(line: 439, column: 6, scope: !657)
!677 = !DILocation(line: 440, column: 2, scope: !657)
!678 = !DILocation(line: 440, column: 6, scope: !657)
!679 = !DILocation(line: 441, column: 2, scope: !657)
!680 = !DILocation(line: 441, column: 10, scope: !657)
!681 = !DILocation(line: 442, column: 2, scope: !657)
!682 = !DILocation(line: 442, column: 11, scope: !657)
!683 = !DILocation(line: 443, column: 2, scope: !657)
!684 = !DILocation(line: 443, column: 11, scope: !657)
!685 = !DILocation(line: 445, column: 12, scope: !657)
!686 = !DILocation(line: 445, column: 25, scope: !657)
!687 = !{!129, !104, i64 44}
!688 = !DILocation(line: 445, column: 10, scope: !657)
!689 = !{!690, !690, i64 0}
!690 = !{!"long", !105, i64 0}
!691 = !DILocation(line: 446, column: 14, scope: !657)
!692 = !DILocation(line: 446, column: 27, scope: !657)
!693 = !{!129, !104, i64 46}
!694 = !DILocation(line: 446, column: 12, scope: !657)
!695 = !DILocation(line: 448, column: 9, scope: !669)
!696 = !DILocation(line: 448, column: 7, scope: !669)
!697 = !DILocation(line: 448, column: 14, scope: !668)
!698 = !DILocation(line: 448, column: 16, scope: !668)
!699 = !DILocation(line: 448, column: 2, scope: !669)
!700 = !DILocation(line: 449, column: 3, scope: !667)
!701 = !DILocation(line: 449, column: 12, scope: !667)
!702 = !DILocation(line: 449, column: 29, scope: !667)
!703 = !DILocation(line: 449, column: 50, scope: !667)
!704 = !DILocation(line: 449, column: 53, scope: !667)
!705 = !DILocation(line: 449, column: 63, scope: !667)
!706 = !DILocation(line: 449, column: 61, scope: !667)
!707 = !DILocation(line: 449, column: 28, scope: !667)
!708 = !DILocation(line: 450, column: 7, scope: !667)
!709 = !DILocation(line: 450, column: 28, scope: !667)
!710 = !DILocation(line: 450, column: 31, scope: !667)
!711 = !DILocation(line: 450, column: 41, scope: !667)
!712 = !DILocation(line: 450, column: 39, scope: !667)
!713 = !DILocation(line: 451, column: 7, scope: !667)
!714 = !DILocation(line: 451, column: 17, scope: !667)
!715 = !DILocation(line: 451, column: 38, scope: !667)
!716 = !DILocation(line: 451, column: 41, scope: !667)
!717 = !DILocation(line: 451, column: 15, scope: !667)
!718 = !DILocation(line: 453, column: 3, scope: !667)
!719 = !DILocation(line: 453, column: 12, scope: !667)
!720 = !DILocation(line: 453, column: 27, scope: !667)
!721 = !DILocation(line: 453, column: 48, scope: !667)
!722 = !DILocation(line: 453, column: 51, scope: !667)
!723 = !DILocation(line: 453, column: 63, scope: !667)
!724 = !DILocation(line: 453, column: 61, scope: !667)
!725 = !DILocation(line: 453, column: 26, scope: !667)
!726 = !DILocation(line: 454, column: 7, scope: !667)
!727 = !DILocation(line: 454, column: 28, scope: !667)
!728 = !DILocation(line: 454, column: 31, scope: !667)
!729 = !DILocation(line: 454, column: 43, scope: !667)
!730 = !DILocation(line: 454, column: 41, scope: !667)
!731 = !DILocation(line: 455, column: 7, scope: !667)
!732 = !DILocation(line: 455, column: 19, scope: !667)
!733 = !DILocation(line: 455, column: 40, scope: !667)
!734 = !DILocation(line: 455, column: 43, scope: !667)
!735 = !DILocation(line: 455, column: 17, scope: !667)
!736 = !DILocation(line: 457, column: 3, scope: !667)
!737 = !DILocation(line: 457, column: 12, scope: !667)
!738 = !DILocation(line: 457, column: 29, scope: !667)
!739 = !DILocation(line: 457, column: 46, scope: !667)
!740 = !DILocation(line: 457, column: 49, scope: !667)
!741 = !DILocation(line: 457, column: 59, scope: !667)
!742 = !DILocation(line: 457, column: 57, scope: !667)
!743 = !DILocation(line: 457, column: 28, scope: !667)
!744 = !DILocation(line: 458, column: 7, scope: !667)
!745 = !DILocation(line: 458, column: 24, scope: !667)
!746 = !DILocation(line: 458, column: 27, scope: !667)
!747 = !DILocation(line: 458, column: 37, scope: !667)
!748 = !DILocation(line: 458, column: 35, scope: !667)
!749 = !DILocation(line: 459, column: 7, scope: !667)
!750 = !DILocation(line: 459, column: 17, scope: !667)
!751 = !DILocation(line: 459, column: 34, scope: !667)
!752 = !DILocation(line: 459, column: 37, scope: !667)
!753 = !DILocation(line: 459, column: 15, scope: !667)
!754 = !DILocation(line: 461, column: 3, scope: !667)
!755 = !DILocation(line: 461, column: 12, scope: !667)
!756 = !DILocation(line: 461, column: 27, scope: !667)
!757 = !DILocation(line: 461, column: 44, scope: !667)
!758 = !DILocation(line: 461, column: 47, scope: !667)
!759 = !DILocation(line: 461, column: 59, scope: !667)
!760 = !DILocation(line: 461, column: 57, scope: !667)
!761 = !DILocation(line: 461, column: 26, scope: !667)
!762 = !DILocation(line: 462, column: 7, scope: !667)
!763 = !DILocation(line: 462, column: 24, scope: !667)
!764 = !DILocation(line: 462, column: 27, scope: !667)
!765 = !DILocation(line: 462, column: 39, scope: !667)
!766 = !DILocation(line: 462, column: 37, scope: !667)
!767 = !DILocation(line: 463, column: 7, scope: !667)
!768 = !DILocation(line: 463, column: 19, scope: !667)
!769 = !DILocation(line: 463, column: 36, scope: !667)
!770 = !DILocation(line: 463, column: 39, scope: !667)
!771 = !DILocation(line: 463, column: 17, scope: !667)
!772 = !DILocation(line: 465, column: 7, scope: !773)
!773 = distinct !DILexicalBlock(scope: !667, file: !3, line: 465, column: 7)
!774 = !DILocation(line: 465, column: 23, scope: !773)
!775 = !DILocation(line: 465, column: 21, scope: !773)
!776 = !DILocation(line: 465, column: 7, scope: !667)
!777 = !DILocation(line: 466, column: 19, scope: !778)
!778 = distinct !DILexicalBlock(scope: !773, file: !3, line: 465, column: 38)
!779 = !DILocation(line: 467, column: 3, scope: !778)
!780 = !DILocation(line: 468, column: 19, scope: !781)
!781 = distinct !DILexicalBlock(scope: !773, file: !3, line: 467, column: 10)
!782 = !DILocation(line: 471, column: 7, scope: !783)
!783 = distinct !DILexicalBlock(scope: !667, file: !3, line: 471, column: 7)
!784 = !DILocation(line: 471, column: 21, scope: !783)
!785 = !DILocation(line: 471, column: 19, scope: !783)
!786 = !DILocation(line: 471, column: 7, scope: !667)
!787 = !DILocation(line: 472, column: 19, scope: !788)
!788 = distinct !DILexicalBlock(scope: !783, file: !3, line: 471, column: 34)
!789 = !DILocation(line: 473, column: 3, scope: !788)
!790 = !DILocation(line: 474, column: 19, scope: !791)
!791 = distinct !DILexicalBlock(scope: !783, file: !3, line: 473, column: 10)
!792 = !DILocation(line: 476, column: 2, scope: !668)
!793 = !DILocation(line: 476, column: 2, scope: !667)
!794 = !DILocation(line: 448, column: 30, scope: !668)
!795 = !DILocation(line: 448, column: 2, scope: !668)
!796 = distinct !{!796, !699, !797}
!797 = !DILocation(line: 476, column: 2, scope: !669)
!798 = !DILocation(line: 478, column: 15, scope: !657)
!799 = !DILocation(line: 478, column: 33, scope: !657)
!800 = !DILocation(line: 478, column: 31, scope: !657)
!801 = !DILocation(line: 478, column: 14, scope: !657)
!802 = !DILocation(line: 478, column: 2, scope: !657)
!803 = !DILocation(line: 478, column: 12, scope: !657)
!804 = !DILocation(line: 480, column: 1, scope: !657)
!805 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 482, type: !21, scopeLine: 483, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !806)
!806 = !{!807, !808, !809, !812, !813}
!807 = !DILocalVariable(name: "movingCount", scope: !805, file: !3, line: 484, type: !6)
!808 = !DILocalVariable(name: "stationaryCount", scope: !805, file: !3, line: 484, type: !6)
!809 = !DILocalVariable(name: "resultStationaryPct", scope: !810, file: !3, line: 501, type: !6)
!810 = distinct !DILexicalBlock(scope: !811, file: !3, line: 499, column: 44)
!811 = distinct !DILexicalBlock(scope: !805, file: !3, line: 499, column: 6)
!812 = !DILocalVariable(name: "resultMovingPct", scope: !810, file: !3, line: 502, type: !6)
!813 = !DILocalVariable(name: "sum", scope: !810, file: !3, line: 504, type: !6)
!814 = !DILocation(line: 484, column: 2, scope: !805)
!815 = !DILocation(line: 484, column: 11, scope: !805)
!816 = !DILocation(line: 484, column: 28, scope: !805)
!817 = !DILocation(line: 486, column: 4, scope: !805)
!818 = !DILocation(line: 486, column: 2, scope: !805)
!819 = !DILocation(line: 488, column: 10, scope: !805)
!820 = !DILocation(line: 488, column: 2, scope: !805)
!821 = !DILocation(line: 491, column: 6, scope: !822)
!822 = distinct !DILexicalBlock(scope: !805, file: !3, line: 488, column: 21)
!823 = !DILocation(line: 491, column: 4, scope: !822)
!824 = !DILocation(line: 492, column: 4, scope: !822)
!825 = !DILocation(line: 495, column: 6, scope: !822)
!826 = !DILocation(line: 495, column: 4, scope: !822)
!827 = !DILocation(line: 496, column: 4, scope: !822)
!828 = !DILocation(line: 499, column: 6, scope: !811)
!829 = !DILocation(line: 499, column: 21, scope: !811)
!830 = !DILocation(line: 499, column: 6, scope: !805)
!831 = !DILocation(line: 501, column: 3, scope: !810)
!832 = !DILocation(line: 501, column: 12, scope: !810)
!833 = !DILocation(line: 501, column: 34, scope: !810)
!834 = !DILocation(line: 501, column: 54, scope: !810)
!835 = !DILocation(line: 501, column: 62, scope: !810)
!836 = !DILocation(line: 501, column: 60, scope: !810)
!837 = !DILocation(line: 502, column: 3, scope: !810)
!838 = !DILocation(line: 502, column: 12, scope: !810)
!839 = !DILocation(line: 502, column: 30, scope: !810)
!840 = !DILocation(line: 502, column: 46, scope: !810)
!841 = !DILocation(line: 502, column: 54, scope: !810)
!842 = !DILocation(line: 502, column: 52, scope: !810)
!843 = !DILocation(line: 504, column: 3, scope: !810)
!844 = !DILocation(line: 504, column: 12, scope: !810)
!845 = !DILocation(line: 504, column: 18, scope: !810)
!846 = !DILocation(line: 504, column: 40, scope: !810)
!847 = !DILocation(line: 504, column: 38, scope: !810)
!848 = !DILocation(line: 506, column: 2, scope: !811)
!849 = !DILocation(line: 506, column: 2, scope: !810)
!850 = !DILocation(line: 507, column: 1, scope: !805)
!851 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 509, type: !21, scopeLine: 510, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !852)
!852 = !{!853}
!853 = !DILocalVariable(name: "sample", scope: !851, file: !3, line: 512, type: !57)
!854 = !DILocation(line: 512, column: 5, scope: !851)
!855 = !DILocation(line: 512, column: 19, scope: !851)
!856 = !DILocation(line: 514, column: 45, scope: !851)
!857 = !DILocation(line: 514, column: 16, scope: !851)
!858 = !DILocation(line: 514, column: 5, scope: !851)
!859 = !DILocation(line: 514, column: 14, scope: !851)
!860 = !DILocation(line: 515, column: 7, scope: !851)
!861 = !DILocation(line: 515, column: 5, scope: !851)
!862 = !DILocation(line: 517, column: 9, scope: !863)
!863 = distinct !DILexicalBlock(scope: !851, file: !3, line: 517, column: 9)
!864 = !DILocation(line: 517, column: 35, scope: !863)
!865 = !DILocation(line: 517, column: 9, scope: !851)
!866 = !DILocation(line: 518, column: 9, scope: !867)
!867 = distinct !DILexicalBlock(scope: !863, file: !3, line: 517, column: 57)
!868 = !DILocation(line: 518, column: 29, scope: !867)
!869 = !{!129, !104, i64 176}
!870 = !DILocation(line: 519, column: 5, scope: !867)
!871 = !DILocation(line: 520, column: 1, scope: !851)
!872 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 522, type: !21, scopeLine: 523, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !873)
!873 = !{!874, !875}
!874 = !DILocalVariable(name: "trainingSetSize", scope: !872, file: !3, line: 524, type: !6)
!875 = !DILocalVariable(name: "class", scope: !872, file: !3, line: 525, type: !6)
!876 = !DILocation(line: 524, column: 2, scope: !872)
!877 = !DILocation(line: 524, column: 11, scope: !872)
!878 = !DILocation(line: 525, column: 2, scope: !872)
!879 = !DILocation(line: 525, column: 11, scope: !872)
!880 = !DILocation(line: 527, column: 10, scope: !872)
!881 = !DILocation(line: 527, column: 2, scope: !872)
!882 = !DILocation(line: 529, column: 4, scope: !883)
!883 = distinct !DILexicalBlock(scope: !872, file: !3, line: 527, column: 21)
!884 = !DILocation(line: 529, column: 25, scope: !883)
!885 = !DILocation(line: 529, column: 48, scope: !883)
!886 = !DILocation(line: 530, column: 4, scope: !883)
!887 = !DILocation(line: 532, column: 4, scope: !883)
!888 = !DILocation(line: 532, column: 21, scope: !883)
!889 = !DILocation(line: 532, column: 44, scope: !883)
!890 = !DILocation(line: 533, column: 4, scope: !883)
!891 = !DILocation(line: 536, column: 4, scope: !872)
!892 = !DILocation(line: 536, column: 2, scope: !872)
!893 = !DILocation(line: 538, column: 1, scope: !872)
!894 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 540, type: !21, scopeLine: 540, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!895 = !DILocation(line: 542, column: 2, scope: !894)
!896 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 545, type: !21, scopeLine: 545, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!897 = !DILocation(line: 547, column: 1, scope: !896)
!898 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 550, type: !899, scopeLine: 550, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!899 = !DISubroutineType(types: !900)
!900 = !{!462}
!901 = !DILocation(line: 552, column: 16, scope: !898)
!902 = !DILocation(line: 553, column: 10, scope: !898)
!903 = !DILocation(line: 554, column: 12, scope: !898)
!904 = !DILocation(line: 114, column: 10, scope: !100, inlinedAt: !905)
!905 = distinct !DILocation(line: 555, column: 2, scope: !898)
!906 = !DILocation(line: 116, column: 9, scope: !100, inlinedAt: !905)
!907 = !DILocation(line: 118, column: 9, scope: !100, inlinedAt: !905)
!908 = !DILocation(line: 123, column: 11, scope: !100, inlinedAt: !905)
!909 = !DILocation(line: 128, column: 12, scope: !100, inlinedAt: !905)
!910 = !DILocation(line: 129, column: 10, scope: !100, inlinedAt: !905)
!911 = !DILocation(line: 130, column: 10, scope: !100, inlinedAt: !905)
!912 = !DILocation(line: 132, column: 10, scope: !100, inlinedAt: !905)
!913 = !DILocation(line: 133, column: 12, scope: !100, inlinedAt: !905)
!914 = !DILocation(line: 136, column: 10, scope: !100, inlinedAt: !905)
!915 = !DILocation(line: 557, column: 2, scope: !898)
!916 = !DILocation(line: 559, column: 2, scope: !898)
!917 = !DILocation(line: 561, column: 3, scope: !918)
!918 = distinct !DILexicalBlock(scope: !898, file: !3, line: 559, column: 12)
!919 = !DILocation(line: 563, column: 7, scope: !920)
!920 = distinct !DILexicalBlock(scope: !918, file: !3, line: 563, column: 7)
!921 = !DILocation(line: 563, column: 42, scope: !920)
!922 = distinct !{!922, !916, !923}
!923 = !DILocation(line: 614, column: 2, scope: !898)
!924 = !DILocation(line: 566, column: 20, scope: !925)
!925 = distinct !DILexicalBlock(scope: !920, file: !3, line: 563, column: 76)
!926 = !DILocation(line: 566, column: 47, scope: !925)
!927 = !DILocation(line: 566, column: 13, scope: !925)
!928 = !DILocation(line: 568, column: 5, scope: !929)
!929 = distinct !DILexicalBlock(scope: !925, file: !3, line: 566, column: 69)
!930 = distinct !{!930, !927, !931}
!931 = !DILocation(line: 570, column: 13, scope: !925)
!932 = !DILocation(line: 574, column: 4, scope: !933)
!933 = distinct !DILexicalBlock(scope: !934, file: !3, line: 572, column: 44)
!934 = distinct !DILexicalBlock(scope: !920, file: !3, line: 572, column: 14)
!935 = !DILocation(line: 576, column: 3, scope: !933)
!936 = !DILocation(line: 584, column: 13, scope: !937)
!937 = distinct !DILexicalBlock(scope: !918, file: !3, line: 581, column: 13)
!938 = !DILocation(line: 584, column: 20, scope: !937)
!939 = !DILocation(line: 584, column: 41, scope: !937)
!940 = !DILocation(line: 586, column: 5, scope: !941)
!941 = distinct !DILexicalBlock(scope: !937, file: !3, line: 584, column: 61)
!942 = distinct !{!942, !936, !943}
!943 = !DILocation(line: 588, column: 13, scope: !937)
!944 = !DILocation(line: 590, column: 4, scope: !937)
!945 = !DILocation(line: 592, column: 4, scope: !937)
!946 = !DILocation(line: 594, column: 8, scope: !947)
!947 = distinct !DILexicalBlock(scope: !937, file: !3, line: 594, column: 8)
!948 = !DILocation(line: 594, column: 43, scope: !947)
!949 = !DILocation(line: 596, column: 5, scope: !950)
!950 = distinct !DILexicalBlock(scope: !947, file: !3, line: 594, column: 77)
!951 = !DILocation(line: 598, column: 9, scope: !952)
!952 = distinct !DILexicalBlock(scope: !950, file: !3, line: 598, column: 9)
!953 = !DILocation(line: 598, column: 30, scope: !952)
!954 = !DILocation(line: 598, column: 9, scope: !950)
!955 = !DILocation(line: 603, column: 5, scope: !956)
!956 = distinct !DILexicalBlock(scope: !957, file: !3, line: 601, column: 45)
!957 = distinct !DILexicalBlock(scope: !947, file: !3, line: 601, column: 15)
!958 = !DILocation(line: 605, column: 5, scope: !956)
!959 = !DILocation(line: 607, column: 9, scope: !960)
!960 = distinct !DILexicalBlock(scope: !956, file: !3, line: 607, column: 9)
!961 = !DILocation(line: 607, column: 25, scope: !960)
!962 = !DILocation(line: 607, column: 9, scope: !956)
