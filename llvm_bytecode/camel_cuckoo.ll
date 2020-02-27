; ModuleID = 'camel_cuckoo.bc'
source_filename = "../example/camel_cuckoo.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [128 x i16], i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i16 }

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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !30
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !65
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !26
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !28
@init_key = dso_local local_unnamed_addr constant i16 1, align 2, !dbg !14
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !21
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !67
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !79 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !80, !tbaa !81
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !85, !tbaa !86
  %1 = or i8 %0, 1, !dbg !85
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !85, !tbaa !86
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !87, !tbaa !86
  %3 = and i8 %2, -2, !dbg !87
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !87, !tbaa !86
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !88, !tbaa !81
  %and4 = and i16 %4, -2, !dbg !88
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !88, !tbaa !81
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !89, !tbaa !86
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !90, !tbaa !81
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !91, !tbaa !81
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !92, !tbaa !81
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !93, !tbaa !86
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !94, !tbaa !81
  ret void, !dbg !95
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !96 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !102, !tbaa !104
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !110

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !111, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !115, !tbaa !113
  br label %if.end4, !dbg !116

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !117, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !120, !tbaa !113
  br label %if.end4, !dbg !121

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #10, !dbg !122
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !124, !tbaa !113
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !124
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !124
  %2 = load i16, i16* %arrayidx, align 2, !dbg !124, !tbaa !126
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #10, !dbg !124, !srcloc !127
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !128, !srcloc !129
  call void @llvm.dbg.value(metadata i16 %3, metadata !98, metadata !DIExpression()), !dbg !130
  %add = add i16 %3, 2, !dbg !131
  %4 = inttoptr i16 %add to i8*, !dbg !132
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !133, !srcloc !134
  call void @llvm.dbg.value(metadata i16 %5, metadata !100, metadata !DIExpression()), !dbg !135
  %sub = sub i16 9214, %5, !dbg !136
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #10, !dbg !137
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !138, !tbaa !126
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !139, !tbaa !113
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 300, i16 zeroext %call) #10, !dbg !140
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !141, !tbaa !126
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !142, !tbaa !113
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !144
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !144, !tbaa !145
  %cmp9 = icmp eq i16 %call8, %8, !dbg !146
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !147

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !148, !tbaa !113
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !150
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(302) %9, i8* nonnull align 2 dereferenceable(302) %10, i16 302, i1 false), !dbg !150
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !151, !tbaa !81
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !153, !tbaa !86
  %12 = or i8 %11, 1, !dbg !153
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !153, !tbaa !86
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !154, !tbaa !86
  %14 = and i8 %13, -2, !dbg !154
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !154, !tbaa !86
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !155, !tbaa !81
  %and4.i = and i16 %15, -2, !dbg !155
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !155, !tbaa !81
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !156, !tbaa !86
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !157, !tbaa !81
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !158, !tbaa !81
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !159, !tbaa !81
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !160, !tbaa !86
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !161, !tbaa !81
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162, !tbaa !113
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !162
  tail call void @__restore_registers(i16* %arraydecay) #10, !dbg !163
  br label %if.end13, !dbg !164

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #10, !dbg !165
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !167
}

declare dso_local void @__crt0_start(...) local_unnamed_addr #2

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_init() local_unnamed_addr #4 !dbg !168 {
entry:
  call void @llvm.dbg.value(metadata i16 0, metadata !170, metadata !DIExpression()), !dbg !171
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !171, !tbaa !113
  br label %for.body, !dbg !172

for.body:                                         ; preds = %for.body, %entry
  %i.010 = phi i16 [ 0, %entry ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata i16 %i.010, metadata !170, metadata !DIExpression()), !dbg !171
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %i.010, !dbg !174
  store i16 %i.010, i16* %arrayidx, align 2, !dbg !177, !tbaa !126
  %inc = add nuw nsw i16 %i.010, 1, !dbg !178
  call void @llvm.dbg.value(metadata i16 %inc, metadata !170, metadata !DIExpression()), !dbg !171
  %exitcond = icmp eq i16 %inc, 128, !dbg !179
  br i1 %exitcond, label %for.end, label %for.body, !dbg !172, !llvm.loop !180

for.end:                                          ; preds = %for.body
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !182
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !183
  %1 = bitcast i16* %insert_count to i64*, !dbg !184
  store i64 0, i64* %1, align 2, !dbg !184
  store i16 1, i16* %key, align 2, !dbg !185, !tbaa !186
  ret void, !dbg !187
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_generate_key() local_unnamed_addr #4 !dbg !188 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !189, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !189
  %1 = load i16, i16* %key, align 2, !dbg !189, !tbaa !186
  %2 = mul i16 %1, 17, !dbg !190
  %mul = add i16 %2, 17, !dbg !190
  store i16 %mul, i16* %key, align 2, !dbg !191, !tbaa !186
  ret void, !dbg !192
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes() local_unnamed_addr #4 !dbg !193 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !194, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !194
  %1 = load i16, i16* %key, align 2, !dbg !194, !tbaa !186
  call void @llvm.dbg.value(metadata i16 %1, metadata !195, metadata !DIExpression()), !dbg !200
  %key.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !211
  %conv.i.i = and i16 %1, 255, !dbg !213
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !211
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !211
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !211
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !216
  %add.1.i.i = add nuw nsw i16 %key.addr.sroa.2.0.extract.shift.i, 27205, !dbg !216
  %add1.1.i.i = add nuw i16 %add.1.i.i, %2, !dbg !217
  call void @llvm.dbg.value(metadata i16 2, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !209, metadata !DIExpression()), !dbg !211
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !218
  store i16 %add1.1.i.i, i16* %fingerprint, align 2, !dbg !219, !tbaa !220
  ret void, !dbg !221
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_1() local_unnamed_addr #4 !dbg !222 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !223, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !223
  %1 = load i16, i16* %key, align 2, !dbg !223, !tbaa !186
  call void @llvm.dbg.value(metadata i16 %1, metadata !224, metadata !DIExpression()), !dbg !231
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !233
  %conv.i.i = and i16 %1, 255, !dbg !235
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !233
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !233
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !233
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !236
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !236
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !237
  call void @llvm.dbg.value(metadata i16 2, metadata !210, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !209, metadata !DIExpression()), !dbg !233
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !230, metadata !DIExpression()), !dbg !231
  %and.i = and i16 %add1.1.i.i, 127, !dbg !238
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !239
  store i16 %and.i, i16* %index1, align 2, !dbg !240, !tbaa !241
  ret void, !dbg !242
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_2() local_unnamed_addr #4 !dbg !243 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !246, !tbaa !113
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !246
  %1 = load i16, i16* %fingerprint, align 2, !dbg !246, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %1, metadata !224, metadata !DIExpression()), !dbg !247
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !249
  %conv.i.i = and i16 %1, 255, !dbg !251
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !249
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !249
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !249
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !252
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !252
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !253
  call void @llvm.dbg.value(metadata i16 2, metadata !210, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !209, metadata !DIExpression()), !dbg !249
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !230, metadata !DIExpression()), !dbg !247
  %and.i = and i16 %add1.1.i.i, 127, !dbg !254
  call void @llvm.dbg.value(metadata i16 %and.i, metadata !245, metadata !DIExpression()), !dbg !255
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !256
  %3 = load i16, i16* %index1, align 2, !dbg !256, !tbaa !241
  %xor = xor i16 %and.i, %3, !dbg !257
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !258
  store i16 %xor, i16* %index2, align 2, !dbg !259, !tbaa !260
  ret void, !dbg !261
}

; Function Attrs: noinline nounwind
define dso_local void @task_add() local_unnamed_addr #5 !dbg !262 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270, !tbaa !113
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !271
  %1 = load i16, i16* %index1, align 2, !dbg !271, !tbaa !241
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !270
  %2 = load i16, i16* %arrayidx, align 2, !dbg !270, !tbaa !126
  %tobool = icmp eq i16 %2, 0, !dbg !270
  br i1 %tobool, label %if.then, label %if.else, !dbg !272

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !273
  store i8 1, i8* %success, align 2, !dbg !275, !tbaa !276
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !277
  %3 = load i16, i16* %fingerprint, align 2, !dbg !277, !tbaa !220
  store i16 %3, i16* %arrayidx, align 2, !dbg !278, !tbaa !126
  br label %if.end53, !dbg !279

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !280
  %4 = load i16, i16* %index2, align 2, !dbg !280, !tbaa !260
  %arrayidx12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !281
  %5 = load i16, i16* %arrayidx12, align 2, !dbg !281, !tbaa !126
  %tobool13 = icmp eq i16 %5, 0, !dbg !281
  br i1 %tobool13, label %if.then14, label %if.else24, !dbg !282

if.then14:                                        ; preds = %if.else
  %success16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !283
  store i8 1, i8* %success16, align 2, !dbg !285, !tbaa !276
  %fingerprint18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !286
  %6 = load i16, i16* %fingerprint18, align 2, !dbg !286, !tbaa !220
  store i16 %6, i16* %arrayidx12, align 2, !dbg !287, !tbaa !126
  br label %if.end53, !dbg !288

if.else24:                                        ; preds = %if.else
  %call = tail call i16 @rand() #10, !dbg !289
  %7 = and i16 %call, 1, !dbg !291
  %tobool25 = icmp eq i16 %7, 0, !dbg !291
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !292, !tbaa !113
  %index128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 3, !dbg !293
  %index236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 4, !dbg !293
  %.pn.in = select i1 %tobool25, i16* %index236, i16* %index128, !dbg !293
  %.pn = load i16, i16* %.pn.in, align 2, !dbg !292, !tbaa !126
  %fp_victim.0.in = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 0, i16 %.pn, !dbg !292
  %fp_victim.0 = load i16, i16* %fp_victim.0.in, align 2, !dbg !292, !tbaa !126
  call void @llvm.dbg.value(metadata i16 %.pn, metadata !269, metadata !DIExpression()), !dbg !294
  call void @llvm.dbg.value(metadata i16 %fp_victim.0, metadata !264, metadata !DIExpression()), !dbg !294
  %fingerprint43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 2, !dbg !295
  %9 = load i16, i16* %fingerprint43, align 2, !dbg !295, !tbaa !220
  store i16 %9, i16* %fp_victim.0.in, align 2, !dbg !296, !tbaa !126
  store i16 %.pn, i16* %index128, align 2, !dbg !297, !tbaa !241
  store i16 %fp_victim.0, i16* %fingerprint43, align 2, !dbg !298, !tbaa !220
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 5, !dbg !299
  store i16 0, i16* %relocation_count, align 2, !dbg !300, !tbaa !301
  br label %if.end53

if.end53:                                         ; preds = %if.then14, %if.else24, %if.then
  ret void, !dbg !302
}

declare dso_local i16 @rand() local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_relocate() local_unnamed_addr #4 !dbg !303 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308, !tbaa !113
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !308
  %1 = load i16, i16* %fingerprint, align 2, !dbg !308, !tbaa !220
  call void @llvm.dbg.value(metadata i16 %1, metadata !305, metadata !DIExpression()), !dbg !309
  call void @llvm.dbg.value(metadata i16 %1, metadata !224, metadata !DIExpression()), !dbg !310
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 0, metadata !210, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 5381, metadata !209, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !312
  %conv.i.i = and i16 %1, 255, !dbg !314
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !312
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 1, metadata !210, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !209, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !312
  call void @llvm.dbg.value(metadata i8* undef, metadata !202, metadata !DIExpression()), !dbg !312
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !315
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !315
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !316
  call void @llvm.dbg.value(metadata i16 2, metadata !210, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !209, metadata !DIExpression()), !dbg !312
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !230, metadata !DIExpression()), !dbg !310
  %and.i = and i16 %add1.1.i.i, 127, !dbg !317
  call void @llvm.dbg.value(metadata i16 %and.i, metadata !306, metadata !DIExpression()), !dbg !309
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !318
  %3 = load i16, i16* %index1, align 2, !dbg !318, !tbaa !241
  %xor = xor i16 %and.i, %3, !dbg !319
  call void @llvm.dbg.value(metadata i16 %xor, metadata !307, metadata !DIExpression()), !dbg !309
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %xor, !dbg !320
  %4 = load i16, i16* %arrayidx, align 2, !dbg !320, !tbaa !126
  %tobool = icmp eq i16 %4, 0, !dbg !320
  br i1 %tobool, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !323
  store i8 1, i8* %success, align 2, !dbg !325, !tbaa !276
  store i16 %1, i16* %arrayidx, align 2, !dbg !326, !tbaa !126
  br label %cleanup, !dbg !327

if.end:                                           ; preds = %entry
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 5, !dbg !328
  %5 = load i16, i16* %relocation_count, align 2, !dbg !328, !tbaa !301
  %cmp = icmp ugt i16 %5, 7, !dbg !330
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !331

if.then8:                                         ; preds = %if.end
  %success10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !332
  store i8 0, i8* %success10, align 2, !dbg !334, !tbaa !276
  br label %cleanup, !dbg !335

if.end11:                                         ; preds = %if.end
  %inc = add nuw nsw i16 %5, 1, !dbg !336
  store i16 %inc, i16* %relocation_count, align 2, !dbg !336, !tbaa !301
  store i16 %xor, i16* %index1, align 2, !dbg !337, !tbaa !241
  %6 = load i16, i16* %arrayidx, align 2, !dbg !338, !tbaa !126
  store i16 %6, i16* %fingerprint, align 2, !dbg !339, !tbaa !220
  store i16 %1, i16* %arrayidx, align 2, !dbg !340, !tbaa !126
  br label %cleanup, !dbg !341

cleanup:                                          ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !341
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_insert_done() local_unnamed_addr #4 !dbg !342 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343, !tbaa !113
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !343
  %1 = load i16, i16* %insert_count, align 2, !dbg !344, !tbaa !345
  %inc = add i16 %1, 1, !dbg !344
  store i16 %inc, i16* %insert_count, align 2, !dbg !344, !tbaa !345
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !346
  %2 = load i8, i8* %success, align 2, !dbg !346, !tbaa !276, !range !347
  %3 = zext i8 %2 to i16, !dbg !346
  %inserted_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 7, !dbg !348
  %4 = load i16, i16* %inserted_count, align 2, !dbg !349, !tbaa !350
  %add = add i16 %4, %3, !dbg !349
  store i16 %add, i16* %inserted_count, align 2, !dbg !349, !tbaa !350
  %cmp = icmp ult i16 %inc, 32, !dbg !351
  br i1 %cmp, label %if.end, label %if.else, !dbg !353

if.else:                                          ; preds = %entry
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !354
  store i16 1, i16* %key, align 2, !dbg !356, !tbaa !186
  br label %if.end

if.end:                                           ; preds = %entry, %if.else
  ret void, !dbg !357
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_search() local_unnamed_addr #4 !dbg !358 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359, !tbaa !113
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !361
  %1 = load i16, i16* %index1, align 2, !dbg !361, !tbaa !241
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !359
  %2 = load i16, i16* %arrayidx, align 2, !dbg !359, !tbaa !126
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !362
  %3 = load i16, i16* %fingerprint, align 2, !dbg !362, !tbaa !220
  %cmp = icmp eq i16 %2, %3, !dbg !363
  br i1 %cmp, label %if.then, label %if.else, !dbg !364

if.then:                                          ; preds = %entry
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !365
  store i8 1, i8* %member, align 1, !dbg !367, !tbaa !368
  br label %if.end17, !dbg !369

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !370
  %4 = load i16, i16* %index2, align 2, !dbg !370, !tbaa !260
  %arrayidx7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !373
  %5 = load i16, i16* %arrayidx7, align 2, !dbg !373, !tbaa !126
  %cmp10 = icmp eq i16 %5, %3, !dbg !374
  %member13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !375
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !376

if.then11:                                        ; preds = %if.else
  store i8 1, i8* %member13, align 1, !dbg !377, !tbaa !368
  br label %if.end17, !dbg !379

if.else14:                                        ; preds = %if.else
  store i8 0, i8* %member13, align 1, !dbg !380, !tbaa !368
  br label %if.end17

if.end17:                                         ; preds = %if.then11, %if.else14, %if.then
  ret void, !dbg !382
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_done() local_unnamed_addr #4 !dbg !383 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !384, !tbaa !113
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 8, !dbg !384
  %1 = load i16, i16* %lookup_count, align 2, !dbg !385, !tbaa !386
  %inc = add i16 %1, 1, !dbg !385
  store i16 %inc, i16* %lookup_count, align 2, !dbg !385, !tbaa !386
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !387
  %2 = load i8, i8* %member, align 1, !dbg !387, !tbaa !368, !range !347
  %3 = zext i8 %2 to i16, !dbg !387
  %member_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 9, !dbg !388
  %4 = load i16, i16* %member_count, align 2, !dbg !389, !tbaa !390
  %add = add i16 %4, %3, !dbg !389
  store i16 %add, i16* %member_count, align 2, !dbg !389, !tbaa !390
  ret void, !dbg !391
}

; Function Attrs: noinline noreturn nounwind
define dso_local void @task_done() local_unnamed_addr #6 !dbg !392 {
entry:
  %0 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !393, !tbaa !113
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %0, i16 zeroext 300, i16 zeroext -1) #10, !dbg !394
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !395, !tbaa !113
  %crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 1, i32 12, !dbg !395
  store volatile i16 %call, i16* %crc, align 2, !dbg !396, !tbaa !397
  tail call void @exit(i16 0) #11, !dbg !398
  unreachable, !dbg !398
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #7

; Function Attrs: noinline nounwind
define dso_local void @task_commit() local_unnamed_addr #5 !dbg !399 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !413, !tbaa !104
  %cmp = icmp eq i16 %0, 1, !dbg !414
  br i1 %cmp, label %if.then, label %if.else, !dbg !415

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !416, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !417, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #10, !dbg !418
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !419, !srcloc !420
  call void @llvm.dbg.value(metadata i16 %1, metadata !401, metadata !DIExpression()), !dbg !421
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !422, !srcloc !423
  call void @llvm.dbg.value(metadata i16 %2, metadata !406, metadata !DIExpression()), !dbg !424
  br label %do.end, !dbg !425

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !426, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !427, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #10, !dbg !428
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !429, !srcloc !430
  call void @llvm.dbg.value(metadata i16 %3, metadata !408, metadata !DIExpression()), !dbg !431
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !432, !srcloc !433
  call void @llvm.dbg.value(metadata i16 %4, metadata !411, metadata !DIExpression()), !dbg !434
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink23 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !435
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !435
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !435
  %sub = sub i16 9214, %.sink23, !dbg !435
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #10, !dbg !435
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !435, !tbaa !126
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !435, !tbaa !113
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 300, i16 zeroext %call) #10, !dbg !435
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !435, !tbaa !126
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !435, !tbaa !113
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !435
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !435, !tbaa !145
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !435, !tbaa !104
  ret void, !dbg !436
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #8 !dbg !437 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !441, !tbaa !104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !442, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !443, !tbaa !113
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !444, !tbaa !81
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !446, !tbaa !86
  %1 = or i8 %0, 1, !dbg !446
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !446, !tbaa !86
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !447, !tbaa !86
  %3 = and i8 %2, -2, !dbg !447
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !447, !tbaa !86
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !448, !tbaa !81
  %and4.i = and i16 %4, -2, !dbg !448
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !448, !tbaa !81
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !449, !tbaa !86
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !450, !tbaa !81
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !451, !tbaa !81
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !452, !tbaa !81
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !453, !tbaa !86
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !454, !tbaa !81
  tail call void @task_init(), !dbg !455
  tail call void @task_commit(), !dbg !456
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !457, !tbaa !113
  %lookup_count24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i16 0, i32 1, i32 8, !dbg !457
  %6 = load i16, i16* %lookup_count24, align 2, !dbg !457, !tbaa !386
  %cmp25 = icmp ult i16 %6, 32, !dbg !458
  br i1 %cmp25, label %while.body, label %while.end21, !dbg !459

while.body:                                       ; preds = %entry, %if.end20
  tail call void @task_generate_key(), !dbg !460
  tail call void @task_commit(), !dbg !462
  tail call void @task_calc_indexes(), !dbg !463
  tail call void @task_commit(), !dbg !464
  tail call void @task_calc_indexes_index_1(), !dbg !465
  tail call void @task_commit(), !dbg !466
  tail call void @task_calc_indexes_index_2(), !dbg !467
  tail call void @task_commit(), !dbg !468
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !469, !tbaa !113
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 1, i32 6, !dbg !469
  %8 = load i16, i16* %insert_count, align 2, !dbg !469, !tbaa !345
  %cmp2 = icmp ult i16 %8, 32, !dbg !471
  br i1 %cmp2, label %if.then, label %if.else, !dbg !472

if.then:                                          ; preds = %while.body
  tail call void @task_add(), !dbg !473
  tail call void @task_commit(), !dbg !475
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476, !tbaa !113
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 3, !dbg !478
  %10 = load i16, i16* %index1, align 2, !dbg !478, !tbaa !241
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 0, i16 %10, !dbg !476
  %11 = load i16, i16* %arrayidx, align 2, !dbg !476, !tbaa !126
  %tobool = icmp eq i16 %11, 0, !dbg !476
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !479

land.lhs.true:                                    ; preds = %if.then
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 4, !dbg !480
  %12 = load i16, i16* %index2, align 2, !dbg !480, !tbaa !260
  %arrayidx8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 0, i16 %12, !dbg !481
  %13 = load i16, i16* %arrayidx8, align 2, !dbg !481, !tbaa !126
  %tobool9 = icmp eq i16 %13, 0, !dbg !481
  br i1 %tobool9, label %if.end, label %while.cond11.preheader, !dbg !482

while.cond11.preheader:                           ; preds = %land.lhs.true
  %success22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 10, !dbg !483
  %14 = load i8, i8* %success22, align 2, !dbg !483, !tbaa !276, !range !347
  %cmp1423 = icmp eq i8 %14, 0, !dbg !485
  br i1 %cmp1423, label %land.rhs, label %if.end, !dbg !486

land.rhs:                                         ; preds = %while.cond11.preheader, %while.body19
  %15 = phi %struct.camel_buffer_t* [ %17, %while.body19 ], [ %9, %while.cond11.preheader ]
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i16 0, i32 1, i32 5, !dbg !487
  %16 = load i16, i16* %relocation_count, align 2, !dbg !487, !tbaa !301
  %cmp17 = icmp ult i16 %16, 8, !dbg !488
  br i1 %cmp17, label %while.body19, label %if.end, !dbg !489

while.body19:                                     ; preds = %land.rhs
  tail call void @task_relocate(), !dbg !490
  tail call void @task_commit(), !dbg !492
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !483, !tbaa !113
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i16 0, i32 1, i32 10, !dbg !483
  %18 = load i8, i8* %success, align 2, !dbg !483, !tbaa !276, !range !347
  %cmp14 = icmp eq i8 %18, 0, !dbg !485
  br i1 %cmp14, label %land.rhs, label %if.end, !dbg !486, !llvm.loop !493

if.end:                                           ; preds = %while.body19, %land.rhs, %while.cond11.preheader, %land.lhs.true, %if.then
  tail call void @task_insert_done(), !dbg !495
  br label %if.end20, !dbg !496

if.else:                                          ; preds = %while.body
  tail call void @task_lookup_search(), !dbg !497
  tail call void @task_commit(), !dbg !499
  tail call void @task_lookup_done(), !dbg !500
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  tail call void @task_commit(), !dbg !501
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !457, !tbaa !113
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i16 0, i32 1, i32 8, !dbg !457
  %20 = load i16, i16* %lookup_count, align 2, !dbg !457, !tbaa !386
  %cmp = icmp ult i16 %20, 32, !dbg !458
  br i1 %cmp, label %while.body, label %while.end21, !dbg !459, !llvm.loop !502

while.end21:                                      ; preds = %if.end20, %entry
  tail call void @task_done(), !dbg !504
  unreachable
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #9

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind readnone speculatable willreturn }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 142, type: !70, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, nameTableKind: None)
!3 = !DIFile(filename: "../example/camel_cuckoo.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 16)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !9, line: 20, baseType: !10)
!9 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 29, baseType: !12)
!11 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{!14, !21, !26, !28, !0, !30, !65, !67}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 224, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 661, type: !23, isLocal: true, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 16)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 149, type: !32, isLocal: false, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 16)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 135, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 130, size: 2416, elements: !35)
!35 = !{!36, !41, !64}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !34, file: !3, line: 132, baseType: !37, size: 176)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 176, elements: !39)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 49, baseType: !18)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !34, file: !3, line: 133, baseType: !42, size: 2224, offset: 176)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 127, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 112, size: 2224, elements: !44)
!44 = !{!45, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !61, !62}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !43, file: !3, line: 114, baseType: !46, size: 2048)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 2048, elements: !48)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 19, baseType: !18)
!48 = !{!49}
!49 = !DISubrange(count: 128)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !43, file: !3, line: 115, baseType: !17, size: 16, offset: 2048)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !43, file: !3, line: 116, baseType: !47, size: 16, offset: 2064)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !43, file: !3, line: 117, baseType: !17, size: 16, offset: 2080)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !43, file: !3, line: 118, baseType: !17, size: 16, offset: 2096)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !43, file: !3, line: 119, baseType: !17, size: 16, offset: 2112)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !43, file: !3, line: 120, baseType: !17, size: 16, offset: 2128)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !43, file: !3, line: 121, baseType: !17, size: 16, offset: 2144)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !43, file: !3, line: 122, baseType: !17, size: 16, offset: 2160)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !43, file: !3, line: 123, baseType: !17, size: 16, offset: 2176)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !43, file: !3, line: 124, baseType: !60, size: 8, offset: 2192)
!60 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !43, file: !3, line: 125, baseType: !60, size: 8, offset: 2200)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !43, file: !3, line: 126, baseType: !63, size: 16, offset: 2208)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !34, file: !3, line: 134, baseType: !18, size: 16, offset: 2400)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 149, type: !32, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 178, type: !69, isLocal: false, isDefinition: true)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !39)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 137, size: 4848, elements: !71)
!71 = !{!72, !73, !74}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !70, file: !3, line: 139, baseType: !18, size: 16)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !70, file: !3, line: 140, baseType: !33, size: 2416, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !70, file: !3, line: 141, baseType: !33, size: 2416, offset: 2432)
!75 = !{i32 2, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 2}
!78 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!79 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 151, type: !24, scopeLine: 151, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 152, column: 10, scope: !79)
!81 = !{!82, !82, i64 0}
!82 = !{!"int", !83, i64 0}
!83 = !{!"omnipotent char", !84, i64 0}
!84 = !{!"Simple C/C++ TBAA"}
!85 = !DILocation(line: 154, column: 9, scope: !79)
!86 = !{!83, !83, i64 0}
!87 = !DILocation(line: 156, column: 9, scope: !79)
!88 = !DILocation(line: 161, column: 11, scope: !79)
!89 = !DILocation(line: 166, column: 12, scope: !79)
!90 = !DILocation(line: 167, column: 10, scope: !79)
!91 = !DILocation(line: 168, column: 10, scope: !79)
!92 = !DILocation(line: 170, column: 10, scope: !79)
!93 = !DILocation(line: 171, column: 12, scope: !79)
!94 = !DILocation(line: 174, column: 10, scope: !79)
!95 = !DILocation(line: 176, column: 1, scope: !79)
!96 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 180, type: !24, scopeLine: 180, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !97)
!97 = !{!98, !100}
!98 = !DILocalVariable(name: "__x", scope: !99, file: !3, line: 207, type: !6)
!99 = distinct !DILexicalBlock(scope: !96, file: !3, line: 207, column: 33)
!100 = !DILocalVariable(name: "__x", scope: !101, file: !3, line: 207, type: !6)
!101 = distinct !DILexicalBlock(scope: !96, file: !3, line: 207, column: 65)
!102 = !DILocation(line: 181, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !3, line: 181, column: 8)
!104 = !{!105, !106, i64 0}
!105 = !{!"Camel", !106, i64 0, !107, i64 2, !107, i64 304}
!106 = !{!"short", !83, i64 0}
!107 = !{!"camel_buffer_t", !83, i64 0, !108, i64 22, !106, i64 300}
!108 = !{!"camel_global_t", !83, i64 0, !106, i64 256, !106, i64 258, !106, i64 260, !106, i64 262, !106, i64 264, !106, i64 266, !106, i64 268, !106, i64 270, !106, i64 272, !109, i64 274, !109, i64 275, !106, i64 276}
!109 = !{!"_Bool", !83, i64 0}
!110 = !DILocation(line: 181, column: 8, scope: !96)
!111 = !DILocation(line: 182, column: 14, scope: !112)
!112 = distinct !DILexicalBlock(scope: !103, file: !3, line: 181, column: 34)
!113 = !{!114, !114, i64 0}
!114 = !{!"any pointer", !83, i64 0}
!115 = !DILocation(line: 183, column: 16, scope: !112)
!116 = !DILocation(line: 184, column: 5, scope: !112)
!117 = !DILocation(line: 185, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !119, file: !3, line: 184, column: 41)
!119 = distinct !DILexicalBlock(scope: !103, file: !3, line: 184, column: 15)
!120 = !DILocation(line: 186, column: 16, scope: !118)
!121 = !DILocation(line: 187, column: 5, scope: !118)
!122 = !DILocation(line: 188, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !3, line: 187, column: 12)
!124 = !DILocation(line: 205, column: 3, scope: !125)
!125 = distinct !DILexicalBlock(scope: !96, file: !3, line: 205, column: 3)
!126 = !{!106, !106, i64 0}
!127 = !{i32 -2146584598}
!128 = !DILocation(line: 207, column: 33, scope: !99)
!129 = !{i32 -2146584362}
!130 = !DILocation(line: 0, scope: !99)
!131 = !DILocation(line: 207, column: 51, scope: !96)
!132 = !DILocation(line: 207, column: 33, scope: !96)
!133 = !DILocation(line: 207, column: 65, scope: !101)
!134 = !{i32 -2146584237}
!135 = !DILocation(line: 0, scope: !101)
!136 = !DILocation(line: 207, column: 63, scope: !96)
!137 = !DILocation(line: 207, column: 19, scope: !96)
!138 = !DILocation(line: 207, column: 17, scope: !96)
!139 = !DILocation(line: 208, column: 37, scope: !96)
!140 = !DILocation(line: 208, column: 23, scope: !96)
!141 = !DILocation(line: 208, column: 21, scope: !96)
!142 = !DILocation(line: 211, column: 27, scope: !143)
!143 = distinct !DILexicalBlock(scope: !96, file: !3, line: 211, column: 6)
!144 = !DILocation(line: 211, column: 33, scope: !143)
!145 = !{!107, !106, i64 300}
!146 = !DILocation(line: 211, column: 24, scope: !143)
!147 = !DILocation(line: 211, column: 6, scope: !96)
!148 = !DILocation(line: 212, column: 11, scope: !149)
!149 = distinct !DILexicalBlock(scope: !143, file: !3, line: 211, column: 51)
!150 = !DILocation(line: 212, column: 4, scope: !149)
!151 = !DILocation(line: 152, column: 10, scope: !79, inlinedAt: !152)
!152 = distinct !DILocation(line: 213, column: 4, scope: !149)
!153 = !DILocation(line: 154, column: 9, scope: !79, inlinedAt: !152)
!154 = !DILocation(line: 156, column: 9, scope: !79, inlinedAt: !152)
!155 = !DILocation(line: 161, column: 11, scope: !79, inlinedAt: !152)
!156 = !DILocation(line: 166, column: 12, scope: !79, inlinedAt: !152)
!157 = !DILocation(line: 167, column: 10, scope: !79, inlinedAt: !152)
!158 = !DILocation(line: 168, column: 10, scope: !79, inlinedAt: !152)
!159 = !DILocation(line: 170, column: 10, scope: !79, inlinedAt: !152)
!160 = !DILocation(line: 171, column: 12, scope: !79, inlinedAt: !152)
!161 = !DILocation(line: 174, column: 10, scope: !79, inlinedAt: !152)
!162 = !DILocation(line: 214, column: 24, scope: !149)
!163 = !DILocation(line: 214, column: 4, scope: !149)
!164 = !DILocation(line: 215, column: 3, scope: !149)
!165 = !DILocation(line: 216, column: 4, scope: !166)
!166 = distinct !DILexicalBlock(scope: !143, file: !3, line: 215, column: 9)
!167 = !DILocation(line: 219, column: 1, scope: !96)
!168 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 265, type: !24, scopeLine: 266, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !169)
!169 = !{!170}
!170 = !DILocalVariable(name: "i", scope: !168, file: !3, line: 267, type: !6)
!171 = !DILocation(line: 0, scope: !168)
!172 = !DILocation(line: 268, column: 5, scope: !173)
!173 = distinct !DILexicalBlock(scope: !168, file: !3, line: 268, column: 5)
!174 = !DILocation(line: 269, column: 9, scope: !175)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 268, column: 40)
!176 = distinct !DILexicalBlock(scope: !173, file: !3, line: 268, column: 5)
!177 = !DILocation(line: 269, column: 23, scope: !175)
!178 = !DILocation(line: 268, column: 35, scope: !176)
!179 = !DILocation(line: 268, column: 19, scope: !176)
!180 = distinct !{!180, !172, !181}
!181 = !DILocation(line: 271, column: 5, scope: !173)
!182 = !DILocation(line: 272, column: 5, scope: !168)
!183 = !DILocation(line: 276, column: 5, scope: !168)
!184 = !DILocation(line: 273, column: 22, scope: !168)
!185 = !DILocation(line: 276, column: 13, scope: !168)
!186 = !{!107, !106, i64 278}
!187 = !DILocation(line: 277, column: 1, scope: !168)
!188 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 295, type: !24, scopeLine: 296, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!189 = !DILocation(line: 298, column: 16, scope: !188)
!190 = !DILocation(line: 298, column: 29, scope: !188)
!191 = !DILocation(line: 298, column: 13, scope: !188)
!192 = !DILocation(line: 299, column: 1, scope: !188)
!193 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 317, type: !24, scopeLine: 318, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!194 = !DILocation(line: 319, column: 43, scope: !193)
!195 = !DILocalVariable(name: "key", arg: 1, scope: !196, file: !3, line: 244, type: !17)
!196 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 244, type: !197, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !199)
!197 = !DISubroutineType(types: !198)
!198 = !{!47, !17}
!199 = !{!195}
!200 = !DILocation(line: 0, scope: !196, inlinedAt: !201)
!201 = distinct !DILocation(line: 319, column: 23, scope: !193)
!202 = !DILocalVariable(name: "data", arg: 1, scope: !203, file: !3, line: 226, type: !7)
!203 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 226, type: !204, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !207)
!204 = !DISubroutineType(types: !205)
!205 = !{!206, !7, !6}
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!207 = !{!202, !208, !209, !210}
!208 = !DILocalVariable(name: "len", arg: 2, scope: !203, file: !3, line: 226, type: !6)
!209 = !DILocalVariable(name: "hash", scope: !203, file: !3, line: 228, type: !18)
!210 = !DILocalVariable(name: "i", scope: !203, file: !3, line: 229, type: !6)
!211 = !DILocation(line: 0, scope: !203, inlinedAt: !212)
!212 = distinct !DILocation(line: 246, column: 12, scope: !196, inlinedAt: !201)
!213 = !DILocation(line: 232, column: 39, scope: !214, inlinedAt: !212)
!214 = distinct !DILexicalBlock(scope: !215, file: !3, line: 231, column: 5)
!215 = distinct !DILexicalBlock(scope: !203, file: !3, line: 231, column: 5)
!216 = !DILocation(line: 232, column: 29, scope: !214, inlinedAt: !212)
!217 = !DILocation(line: 232, column: 37, scope: !214, inlinedAt: !212)
!218 = !DILocation(line: 319, column: 5, scope: !193)
!219 = !DILocation(line: 319, column: 21, scope: !193)
!220 = !{!107, !106, i64 280}
!221 = !DILocation(line: 320, column: 1, scope: !193)
!222 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 338, type: !24, scopeLine: 339, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!223 = !DILocation(line: 340, column: 32, scope: !222)
!224 = !DILocalVariable(name: "fp", arg: 1, scope: !225, file: !3, line: 238, type: !47)
!225 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 238, type: !226, scopeLine: 239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !229)
!226 = !DISubroutineType(types: !227)
!227 = !{!228, !47}
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!229 = !{!224, !230}
!230 = !DILocalVariable(name: "hash", scope: !225, file: !3, line: 240, type: !206)
!231 = !DILocation(line: 0, scope: !225, inlinedAt: !232)
!232 = distinct !DILocation(line: 340, column: 18, scope: !222)
!233 = !DILocation(line: 0, scope: !203, inlinedAt: !234)
!234 = distinct !DILocation(line: 240, column: 19, scope: !225, inlinedAt: !232)
!235 = !DILocation(line: 232, column: 39, scope: !214, inlinedAt: !234)
!236 = !DILocation(line: 232, column: 29, scope: !214, inlinedAt: !234)
!237 = !DILocation(line: 232, column: 37, scope: !214, inlinedAt: !234)
!238 = !DILocation(line: 241, column: 17, scope: !225, inlinedAt: !232)
!239 = !DILocation(line: 340, column: 5, scope: !222)
!240 = !DILocation(line: 340, column: 16, scope: !222)
!241 = !{!107, !106, i64 282}
!242 = !DILocation(line: 341, column: 1, scope: !222)
!243 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 359, type: !24, scopeLine: 360, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !244)
!244 = !{!245}
!245 = !DILocalVariable(name: "fp_hash", scope: !243, file: !3, line: 361, type: !228)
!246 = !DILocation(line: 361, column: 37, scope: !243)
!247 = !DILocation(line: 0, scope: !225, inlinedAt: !248)
!248 = distinct !DILocation(line: 361, column: 23, scope: !243)
!249 = !DILocation(line: 0, scope: !203, inlinedAt: !250)
!250 = distinct !DILocation(line: 240, column: 19, scope: !225, inlinedAt: !248)
!251 = !DILocation(line: 232, column: 39, scope: !214, inlinedAt: !250)
!252 = !DILocation(line: 232, column: 29, scope: !214, inlinedAt: !250)
!253 = !DILocation(line: 232, column: 37, scope: !214, inlinedAt: !250)
!254 = !DILocation(line: 241, column: 17, scope: !225, inlinedAt: !248)
!255 = !DILocation(line: 0, scope: !243)
!256 = !DILocation(line: 362, column: 18, scope: !243)
!257 = !DILocation(line: 362, column: 29, scope: !243)
!258 = !DILocation(line: 362, column: 5, scope: !243)
!259 = !DILocation(line: 362, column: 16, scope: !243)
!260 = !{!107, !106, i64 284}
!261 = !DILocation(line: 363, column: 1, scope: !243)
!262 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 381, type: !24, scopeLine: 382, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !263)
!263 = !{!264, !269}
!264 = !DILocalVariable(name: "fp_victim", scope: !265, file: !3, line: 391, type: !47)
!265 = distinct !DILexicalBlock(scope: !266, file: !3, line: 390, column: 16)
!266 = distinct !DILexicalBlock(scope: !267, file: !3, line: 387, column: 13)
!267 = distinct !DILexicalBlock(scope: !268, file: !3, line: 386, column: 12)
!268 = distinct !DILexicalBlock(scope: !262, file: !3, line: 383, column: 9)
!269 = !DILocalVariable(name: "index_victim", scope: !265, file: !3, line: 392, type: !228)
!270 = !DILocation(line: 383, column: 10, scope: !268)
!271 = !DILocation(line: 383, column: 21, scope: !268)
!272 = !DILocation(line: 383, column: 9, scope: !262)
!273 = !DILocation(line: 384, column: 9, scope: !274)
!274 = distinct !DILexicalBlock(scope: !268, file: !3, line: 383, column: 34)
!275 = !DILocation(line: 384, column: 21, scope: !274)
!276 = !{!107, !109, i64 296}
!277 = !DILocation(line: 385, column: 34, scope: !274)
!278 = !DILocation(line: 385, column: 32, scope: !274)
!279 = !DILocation(line: 386, column: 5, scope: !274)
!280 = !DILocation(line: 387, column: 25, scope: !266)
!281 = !DILocation(line: 387, column: 14, scope: !266)
!282 = !DILocation(line: 387, column: 13, scope: !267)
!283 = !DILocation(line: 388, column: 13, scope: !284)
!284 = distinct !DILexicalBlock(scope: !266, file: !3, line: 387, column: 38)
!285 = !DILocation(line: 388, column: 25, scope: !284)
!286 = !DILocation(line: 389, column: 38, scope: !284)
!287 = !DILocation(line: 389, column: 36, scope: !284)
!288 = !DILocation(line: 390, column: 9, scope: !284)
!289 = !DILocation(line: 393, column: 17, scope: !290)
!290 = distinct !DILexicalBlock(scope: !265, file: !3, line: 393, column: 17)
!291 = !DILocation(line: 393, column: 24, scope: !290)
!292 = !DILocation(line: 0, scope: !290)
!293 = !DILocation(line: 393, column: 17, scope: !265)
!294 = !DILocation(line: 0, scope: !265)
!295 = !DILocation(line: 402, column: 40, scope: !265)
!296 = !DILocation(line: 402, column: 38, scope: !265)
!297 = !DILocation(line: 403, column: 24, scope: !265)
!298 = !DILocation(line: 404, column: 29, scope: !265)
!299 = !DILocation(line: 405, column: 13, scope: !265)
!300 = !DILocation(line: 405, column: 34, scope: !265)
!301 = !{!107, !106, i64 286}
!302 = !DILocation(line: 408, column: 1, scope: !262)
!303 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 426, type: !24, scopeLine: 427, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !304)
!304 = !{!305, !306, !307}
!305 = !DILocalVariable(name: "fp_victim", scope: !303, file: !3, line: 428, type: !47)
!306 = !DILocalVariable(name: "fp_hash_victim", scope: !303, file: !3, line: 429, type: !228)
!307 = !DILocalVariable(name: "index2_victim", scope: !303, file: !3, line: 430, type: !228)
!308 = !DILocation(line: 428, column: 31, scope: !303)
!309 = !DILocation(line: 0, scope: !303)
!310 = !DILocation(line: 0, scope: !225, inlinedAt: !311)
!311 = distinct !DILocation(line: 429, column: 30, scope: !303)
!312 = !DILocation(line: 0, scope: !203, inlinedAt: !313)
!313 = distinct !DILocation(line: 240, column: 19, scope: !225, inlinedAt: !311)
!314 = !DILocation(line: 232, column: 39, scope: !214, inlinedAt: !313)
!315 = !DILocation(line: 232, column: 29, scope: !214, inlinedAt: !313)
!316 = !DILocation(line: 232, column: 37, scope: !214, inlinedAt: !313)
!317 = !DILocation(line: 241, column: 17, scope: !225, inlinedAt: !311)
!318 = !DILocation(line: 430, column: 29, scope: !303)
!319 = !DILocation(line: 430, column: 40, scope: !303)
!320 = !DILocation(line: 434, column: 14, scope: !321)
!321 = distinct !DILexicalBlock(scope: !303, file: !3, line: 434, column: 13)
!322 = !DILocation(line: 434, column: 13, scope: !303)
!323 = !DILocation(line: 435, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !321, file: !3, line: 434, column: 41)
!325 = !DILocation(line: 435, column: 25, scope: !324)
!326 = !DILocation(line: 436, column: 39, scope: !324)
!327 = !DILocation(line: 437, column: 13, scope: !324)
!328 = !DILocation(line: 441, column: 13, scope: !329)
!329 = distinct !DILexicalBlock(scope: !303, file: !3, line: 441, column: 13)
!330 = !DILocation(line: 441, column: 34, scope: !329)
!331 = !DILocation(line: 441, column: 13, scope: !303)
!332 = !DILocation(line: 442, column: 13, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !3, line: 441, column: 54)
!334 = !DILocation(line: 442, column: 25, scope: !333)
!335 = !DILocation(line: 443, column: 13, scope: !333)
!336 = !DILocation(line: 446, column: 9, scope: !303)
!337 = !DILocation(line: 447, column: 20, scope: !303)
!338 = !DILocation(line: 448, column: 27, scope: !303)
!339 = !DILocation(line: 448, column: 25, scope: !303)
!340 = !DILocation(line: 449, column: 35, scope: !303)
!341 = !DILocation(line: 450, column: 1, scope: !303)
!342 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 468, type: !24, scopeLine: 469, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!343 = !DILocation(line: 470, column: 7, scope: !342)
!344 = !DILocation(line: 470, column: 5, scope: !342)
!345 = !{!107, !106, i64 288}
!346 = !DILocation(line: 471, column: 27, scope: !342)
!347 = !{i8 0, i8 2}
!348 = !DILocation(line: 471, column: 5, scope: !342)
!349 = !DILocation(line: 471, column: 24, scope: !342)
!350 = !{!107, !106, i64 290}
!351 = !DILocation(line: 473, column: 26, scope: !352)
!352 = distinct !DILexicalBlock(scope: !342, file: !3, line: 473, column: 9)
!353 = !DILocation(line: 473, column: 9, scope: !342)
!354 = !DILocation(line: 475, column: 9, scope: !355)
!355 = distinct !DILexicalBlock(scope: !352, file: !3, line: 474, column: 12)
!356 = !DILocation(line: 475, column: 17, scope: !355)
!357 = !DILocation(line: 477, column: 1, scope: !342)
!358 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 495, type: !24, scopeLine: 496, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!359 = !DILocation(line: 497, column: 9, scope: !360)
!360 = distinct !DILexicalBlock(scope: !358, file: !3, line: 497, column: 9)
!361 = !DILocation(line: 497, column: 20, scope: !360)
!362 = !DILocation(line: 497, column: 35, scope: !360)
!363 = !DILocation(line: 497, column: 32, scope: !360)
!364 = !DILocation(line: 497, column: 9, scope: !358)
!365 = !DILocation(line: 498, column: 9, scope: !366)
!366 = distinct !DILexicalBlock(scope: !360, file: !3, line: 497, column: 52)
!367 = !DILocation(line: 498, column: 20, scope: !366)
!368 = !{!107, !109, i64 297}
!369 = !DILocation(line: 499, column: 5, scope: !366)
!370 = !DILocation(line: 500, column: 24, scope: !371)
!371 = distinct !DILexicalBlock(scope: !372, file: !3, line: 500, column: 13)
!372 = distinct !DILexicalBlock(scope: !360, file: !3, line: 499, column: 12)
!373 = !DILocation(line: 500, column: 13, scope: !371)
!374 = !DILocation(line: 500, column: 36, scope: !371)
!375 = !DILocation(line: 0, scope: !371)
!376 = !DILocation(line: 500, column: 13, scope: !372)
!377 = !DILocation(line: 501, column: 24, scope: !378)
!378 = distinct !DILexicalBlock(scope: !371, file: !3, line: 500, column: 56)
!379 = !DILocation(line: 502, column: 9, scope: !378)
!380 = !DILocation(line: 504, column: 24, scope: !381)
!381 = distinct !DILexicalBlock(scope: !371, file: !3, line: 503, column: 14)
!382 = !DILocation(line: 510, column: 1, scope: !358)
!383 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 528, type: !24, scopeLine: 529, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!384 = !DILocation(line: 530, column: 7, scope: !383)
!385 = !DILocation(line: 530, column: 5, scope: !383)
!386 = !{!107, !106, i64 292}
!387 = !DILocation(line: 532, column: 25, scope: !383)
!388 = !DILocation(line: 532, column: 5, scope: !383)
!389 = !DILocation(line: 532, column: 22, scope: !383)
!390 = !{!107, !106, i64 294}
!391 = !DILocation(line: 537, column: 1, scope: !383)
!392 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 539, type: !24, scopeLine: 540, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!393 = !DILocation(line: 542, column: 26, scope: !392)
!394 = !DILocation(line: 542, column: 12, scope: !392)
!395 = !DILocation(line: 542, column: 2, scope: !392)
!396 = !DILocation(line: 542, column: 10, scope: !392)
!397 = !{!107, !106, i64 298}
!398 = !DILocation(line: 543, column: 5, scope: !392)
!399 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 546, type: !24, scopeLine: 546, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !400)
!400 = !{!401, !406, !408, !411}
!401 = !DILocalVariable(name: "__x", scope: !402, file: !3, line: 554, type: !6)
!402 = distinct !DILexicalBlock(scope: !403, file: !3, line: 554, column: 65)
!403 = distinct !DILexicalBlock(scope: !404, file: !3, line: 550, column: 57)
!404 = distinct !DILexicalBlock(scope: !405, file: !3, line: 550, column: 32)
!405 = distinct !DILexicalBlock(scope: !399, file: !3, line: 548, column: 7)
!406 = !DILocalVariable(name: "__x", scope: !407, file: !3, line: 554, type: !6)
!407 = distinct !DILexicalBlock(scope: !403, file: !3, line: 554, column: 97)
!408 = !DILocalVariable(name: "__x", scope: !409, file: !3, line: 562, type: !6)
!409 = distinct !DILexicalBlock(scope: !410, file: !3, line: 562, column: 65)
!410 = distinct !DILexicalBlock(scope: !404, file: !3, line: 558, column: 35)
!411 = !DILocalVariable(name: "__x", scope: !412, file: !3, line: 562, type: !6)
!412 = distinct !DILexicalBlock(scope: !410, file: !3, line: 562, column: 97)
!413 = !DILocation(line: 550, column: 38, scope: !404)
!414 = !DILocation(line: 550, column: 43, scope: !404)
!415 = !DILocation(line: 550, column: 32, scope: !405)
!416 = !DILocation(line: 551, column: 38, scope: !403)
!417 = !DILocation(line: 552, column: 40, scope: !403)
!418 = !DILocation(line: 553, column: 33, scope: !403)
!419 = !DILocation(line: 554, column: 65, scope: !402)
!420 = !{i32 -2146581944}
!421 = !DILocation(line: 0, scope: !402)
!422 = !DILocation(line: 554, column: 97, scope: !407)
!423 = !{i32 -2146581819}
!424 = !DILocation(line: 0, scope: !407)
!425 = !DILocation(line: 558, column: 29, scope: !403)
!426 = !DILocation(line: 559, column: 38, scope: !410)
!427 = !DILocation(line: 560, column: 40, scope: !410)
!428 = !DILocation(line: 561, column: 33, scope: !410)
!429 = !DILocation(line: 562, column: 65, scope: !409)
!430 = !{i32 -2146581687}
!431 = !DILocation(line: 0, scope: !409)
!432 = !DILocation(line: 562, column: 97, scope: !412)
!433 = !{i32 -2146581562}
!434 = !DILocation(line: 0, scope: !412)
!435 = !DILocation(line: 0, scope: !404)
!436 = !DILocation(line: 569, column: 1, scope: !399)
!437 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 571, type: !438, scopeLine: 571, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!438 = !DISubroutineType(types: !439)
!439 = !{!440}
!440 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!441 = !DILocation(line: 573, column: 16, scope: !437)
!442 = !DILocation(line: 574, column: 10, scope: !437)
!443 = !DILocation(line: 575, column: 12, scope: !437)
!444 = !DILocation(line: 152, column: 10, scope: !79, inlinedAt: !445)
!445 = distinct !DILocation(line: 576, column: 5, scope: !437)
!446 = !DILocation(line: 154, column: 9, scope: !79, inlinedAt: !445)
!447 = !DILocation(line: 156, column: 9, scope: !79, inlinedAt: !445)
!448 = !DILocation(line: 161, column: 11, scope: !79, inlinedAt: !445)
!449 = !DILocation(line: 166, column: 12, scope: !79, inlinedAt: !445)
!450 = !DILocation(line: 167, column: 10, scope: !79, inlinedAt: !445)
!451 = !DILocation(line: 168, column: 10, scope: !79, inlinedAt: !445)
!452 = !DILocation(line: 170, column: 10, scope: !79, inlinedAt: !445)
!453 = !DILocation(line: 171, column: 12, scope: !79, inlinedAt: !445)
!454 = !DILocation(line: 174, column: 10, scope: !79, inlinedAt: !445)
!455 = !DILocation(line: 586, column: 5, scope: !437)
!456 = !DILocation(line: 587, column: 5, scope: !437)
!457 = !DILocation(line: 591, column: 9, scope: !437)
!458 = !DILocation(line: 591, column: 27, scope: !437)
!459 = !DILocation(line: 591, column: 3, scope: !437)
!460 = !DILocation(line: 593, column: 9, scope: !461)
!461 = distinct !DILexicalBlock(scope: !437, file: !3, line: 591, column: 42)
!462 = !DILocation(line: 595, column: 9, scope: !461)
!463 = !DILocation(line: 599, column: 9, scope: !461)
!464 = !DILocation(line: 601, column: 9, scope: !461)
!465 = !DILocation(line: 605, column: 9, scope: !461)
!466 = !DILocation(line: 607, column: 9, scope: !461)
!467 = !DILocation(line: 611, column: 9, scope: !461)
!468 = !DILocation(line: 613, column: 9, scope: !461)
!469 = !DILocation(line: 616, column: 12, scope: !470)
!470 = distinct !DILexicalBlock(scope: !461, file: !3, line: 616, column: 12)
!471 = !DILocation(line: 616, column: 30, scope: !470)
!472 = !DILocation(line: 616, column: 12, scope: !461)
!473 = !DILocation(line: 618, column: 13, scope: !474)
!474 = distinct !DILexicalBlock(scope: !470, file: !3, line: 616, column: 45)
!475 = !DILocation(line: 620, column: 13, scope: !474)
!476 = !DILocation(line: 623, column: 16, scope: !477)
!477 = distinct !DILexicalBlock(scope: !474, file: !3, line: 623, column: 16)
!478 = !DILocation(line: 623, column: 28, scope: !477)
!479 = !DILocation(line: 623, column: 41, scope: !477)
!480 = !DILocation(line: 623, column: 56, scope: !477)
!481 = !DILocation(line: 623, column: 44, scope: !477)
!482 = !DILocation(line: 623, column: 16, scope: !474)
!483 = !DILocation(line: 624, column: 23, scope: !484)
!484 = distinct !DILexicalBlock(scope: !477, file: !3, line: 623, column: 70)
!485 = !DILocation(line: 624, column: 36, scope: !484)
!486 = !DILocation(line: 624, column: 45, scope: !484)
!487 = !DILocation(line: 624, column: 49, scope: !484)
!488 = !DILocation(line: 624, column: 71, scope: !484)
!489 = !DILocation(line: 624, column: 17, scope: !484)
!490 = !DILocation(line: 626, column: 21, scope: !491)
!491 = distinct !DILexicalBlock(scope: !484, file: !3, line: 624, column: 91)
!492 = !DILocation(line: 628, column: 21, scope: !491)
!493 = distinct !{!493, !489, !494}
!494 = !DILocation(line: 630, column: 17, scope: !484)
!495 = !DILocation(line: 634, column: 13, scope: !474)
!496 = !DILocation(line: 638, column: 9, scope: !474)
!497 = !DILocation(line: 640, column: 13, scope: !498)
!498 = distinct !DILexicalBlock(scope: !470, file: !3, line: 638, column: 16)
!499 = !DILocation(line: 642, column: 13, scope: !498)
!500 = !DILocation(line: 646, column: 13, scope: !498)
!501 = !DILocation(line: 0, scope: !470)
!502 = distinct !{!502, !459, !503}
!503 = !DILocation(line: 651, column: 5, scope: !437)
!504 = !DILocation(line: 653, column: 5, scope: !437)
