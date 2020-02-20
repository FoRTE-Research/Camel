; ModuleID = 'camel_cuckoo.bc'
source_filename = "../example/camel_cuckoo.c"
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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !30
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !63
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !26
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !28
@init_key = dso_local local_unnamed_addr constant i16 1, align 2, !dbg !14
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !21
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !65
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !77 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !78, !tbaa !79
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !83, !tbaa !84
  %1 = or i8 %0, 1, !dbg !83
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !83, !tbaa !84
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !85, !tbaa !84
  %3 = and i8 %2, -2, !dbg !85
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !85, !tbaa !84
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !86, !tbaa !79
  %and4 = and i16 %4, -2, !dbg !86
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !86, !tbaa !79
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !87, !tbaa !84
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !88, !tbaa !79
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !89, !tbaa !79
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !90, !tbaa !79
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !91, !tbaa !84
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !92, !tbaa !79
  ret void, !dbg !93
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !94 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !100, !tbaa !102
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !108

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !109, !tbaa !111
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !113, !tbaa !111
  br label %if.end4, !dbg !114

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !115, !tbaa !111
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !118, !tbaa !111
  br label %if.end4, !dbg !119

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #10, !dbg !120
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !122, !tbaa !111
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !122
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !122
  %2 = load i16, i16* %arrayidx, align 2, !dbg !122, !tbaa !124
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #10, !dbg !122, !srcloc !125
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !126, !srcloc !127
  call void @llvm.dbg.value(metadata i16 %3, metadata !96, metadata !DIExpression()), !dbg !128
  %add = add i16 %3, 2, !dbg !129
  %4 = inttoptr i16 %add to i8*, !dbg !130
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !131, !srcloc !132
  call void @llvm.dbg.value(metadata i16 %5, metadata !98, metadata !DIExpression()), !dbg !133
  %sub = sub i16 9214, %5, !dbg !134
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #10, !dbg !135
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !136, !tbaa !124
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !137, !tbaa !111
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 298, i16 zeroext %call) #10, !dbg !138
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !139, !tbaa !124
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !140, !tbaa !111
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !142
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !142, !tbaa !143
  %cmp9 = icmp eq i16 %call8, %8, !dbg !144
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !145

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !146, !tbaa !111
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !148
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(300) %9, i8* nonnull align 2 dereferenceable(300) %10, i16 300, i1 false), !dbg !148
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !149, !tbaa !79
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !151, !tbaa !84
  %12 = or i8 %11, 1, !dbg !151
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !151, !tbaa !84
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !152, !tbaa !84
  %14 = and i8 %13, -2, !dbg !152
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !152, !tbaa !84
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !153, !tbaa !79
  %and4.i = and i16 %15, -2, !dbg !153
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !153, !tbaa !79
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !154, !tbaa !84
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !155, !tbaa !79
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !156, !tbaa !79
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !157, !tbaa !79
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !158, !tbaa !84
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !159, !tbaa !79
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !160, !tbaa !111
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !160
  tail call void @__restore_registers(i16* %arraydecay) #10, !dbg !161
  br label %if.end13, !dbg !162

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #10, !dbg !163
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !165
}

declare dso_local void @__crt0_start(...) local_unnamed_addr #2

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_init() local_unnamed_addr #4 !dbg !166 {
entry:
  call void @llvm.dbg.value(metadata i16 0, metadata !168, metadata !DIExpression()), !dbg !169
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !169, !tbaa !111
  br label %for.body, !dbg !170

for.body:                                         ; preds = %for.body, %entry
  %i.010 = phi i16 [ 0, %entry ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata i16 %i.010, metadata !168, metadata !DIExpression()), !dbg !169
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %i.010, !dbg !172
  store i16 %i.010, i16* %arrayidx, align 2, !dbg !175, !tbaa !124
  %inc = add nuw nsw i16 %i.010, 1, !dbg !176
  call void @llvm.dbg.value(metadata i16 %inc, metadata !168, metadata !DIExpression()), !dbg !169
  %exitcond = icmp eq i16 %inc, 128, !dbg !177
  br i1 %exitcond, label %for.end, label %for.body, !dbg !170, !llvm.loop !178

for.end:                                          ; preds = %for.body
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !180
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !181
  %1 = bitcast i16* %insert_count to i64*, !dbg !182
  store i64 0, i64* %1, align 2, !dbg !182
  store i16 1, i16* %key, align 2, !dbg !183, !tbaa !184
  ret void, !dbg !185
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_generate_key() local_unnamed_addr #4 !dbg !186 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !187, !tbaa !111
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !187
  %1 = load i16, i16* %key, align 2, !dbg !187, !tbaa !184
  %2 = mul i16 %1, 17, !dbg !188
  %mul = add i16 %2, 17, !dbg !188
  store i16 %mul, i16* %key, align 2, !dbg !189, !tbaa !184
  ret void, !dbg !190
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes() local_unnamed_addr #4 !dbg !191 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !192, !tbaa !111
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !192
  %1 = load i16, i16* %key, align 2, !dbg !192, !tbaa !184
  call void @llvm.dbg.value(metadata i16 %1, metadata !193, metadata !DIExpression()), !dbg !198
  %key.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 2, metadata !206, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !209
  %conv.i.i = and i16 %1, 255, !dbg !211
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !209
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !209
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !209
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !214
  %add.1.i.i = add nuw nsw i16 %key.addr.sroa.2.0.extract.shift.i, 27205, !dbg !214
  %add1.1.i.i = add nuw i16 %add.1.i.i, %2, !dbg !215
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !207, metadata !DIExpression()), !dbg !209
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !216
  store i16 %add1.1.i.i, i16* %fingerprint, align 2, !dbg !217, !tbaa !218
  ret void, !dbg !219
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_1() local_unnamed_addr #4 !dbg !220 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !221, !tbaa !111
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !221
  %1 = load i16, i16* %key, align 2, !dbg !221, !tbaa !184
  call void @llvm.dbg.value(metadata i16 %1, metadata !222, metadata !DIExpression()), !dbg !229
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 2, metadata !206, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !231
  %conv.i.i = and i16 %1, 255, !dbg !233
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !231
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !231
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !231
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !234
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !234
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !235
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !207, metadata !DIExpression()), !dbg !231
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !228, metadata !DIExpression()), !dbg !229
  %and.i = and i16 %add1.1.i.i, 127, !dbg !236
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !237
  store i16 %and.i, i16* %index1, align 2, !dbg !238, !tbaa !239
  ret void, !dbg !240
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_2() local_unnamed_addr #4 !dbg !241 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !244, !tbaa !111
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !244
  %1 = load i16, i16* %fingerprint, align 2, !dbg !244, !tbaa !218
  call void @llvm.dbg.value(metadata i16 %1, metadata !222, metadata !DIExpression()), !dbg !245
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 2, metadata !206, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !247
  %conv.i.i = and i16 %1, 255, !dbg !249
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !247
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !247
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !247
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !250
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !250
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !251
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !207, metadata !DIExpression()), !dbg !247
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !228, metadata !DIExpression()), !dbg !245
  %and.i = and i16 %add1.1.i.i, 127, !dbg !252
  call void @llvm.dbg.value(metadata i16 %and.i, metadata !243, metadata !DIExpression()), !dbg !253
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !254
  %3 = load i16, i16* %index1, align 2, !dbg !254, !tbaa !239
  %xor = xor i16 %and.i, %3, !dbg !255
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !256
  store i16 %xor, i16* %index2, align 2, !dbg !257, !tbaa !258
  ret void, !dbg !259
}

; Function Attrs: noinline nounwind
define dso_local void @task_add() local_unnamed_addr #5 !dbg !260 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !268, !tbaa !111
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !269
  %1 = load i16, i16* %index1, align 2, !dbg !269, !tbaa !239
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !268
  %2 = load i16, i16* %arrayidx, align 2, !dbg !268, !tbaa !124
  %tobool = icmp eq i16 %2, 0, !dbg !268
  br i1 %tobool, label %if.then, label %if.else, !dbg !270

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !271
  store i8 1, i8* %success, align 2, !dbg !273, !tbaa !274
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !275
  %3 = load i16, i16* %fingerprint, align 2, !dbg !275, !tbaa !218
  store i16 %3, i16* %arrayidx, align 2, !dbg !276, !tbaa !124
  br label %if.end53, !dbg !277

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !278
  %4 = load i16, i16* %index2, align 2, !dbg !278, !tbaa !258
  %arrayidx12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !279
  %5 = load i16, i16* %arrayidx12, align 2, !dbg !279, !tbaa !124
  %tobool13 = icmp eq i16 %5, 0, !dbg !279
  br i1 %tobool13, label %if.then14, label %if.else24, !dbg !280

if.then14:                                        ; preds = %if.else
  %success16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !281
  store i8 1, i8* %success16, align 2, !dbg !283, !tbaa !274
  %fingerprint18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !284
  %6 = load i16, i16* %fingerprint18, align 2, !dbg !284, !tbaa !218
  store i16 %6, i16* %arrayidx12, align 2, !dbg !285, !tbaa !124
  br label %if.end53, !dbg !286

if.else24:                                        ; preds = %if.else
  %call = tail call i16 @rand() #10, !dbg !287
  %7 = and i16 %call, 1, !dbg !289
  %tobool25 = icmp eq i16 %7, 0, !dbg !289
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !290, !tbaa !111
  %index128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 3, !dbg !291
  %index236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 4, !dbg !291
  %.pn.in = select i1 %tobool25, i16* %index236, i16* %index128, !dbg !291
  %.pn = load i16, i16* %.pn.in, align 2, !dbg !290, !tbaa !124
  %fp_victim.0.in = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 0, i16 %.pn, !dbg !290
  %fp_victim.0 = load i16, i16* %fp_victim.0.in, align 2, !dbg !290, !tbaa !124
  call void @llvm.dbg.value(metadata i16 %.pn, metadata !267, metadata !DIExpression()), !dbg !292
  call void @llvm.dbg.value(metadata i16 %fp_victim.0, metadata !262, metadata !DIExpression()), !dbg !292
  %fingerprint43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 2, !dbg !293
  %9 = load i16, i16* %fingerprint43, align 2, !dbg !293, !tbaa !218
  store i16 %9, i16* %fp_victim.0.in, align 2, !dbg !294, !tbaa !124
  store i16 %.pn, i16* %index128, align 2, !dbg !295, !tbaa !239
  store i16 %fp_victim.0, i16* %fingerprint43, align 2, !dbg !296, !tbaa !218
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 5, !dbg !297
  store i16 0, i16* %relocation_count, align 2, !dbg !298, !tbaa !299
  br label %if.end53

if.end53:                                         ; preds = %if.then14, %if.else24, %if.then
  ret void, !dbg !300
}

declare dso_local i16 @rand() local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_relocate() local_unnamed_addr #4 !dbg !301 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306, !tbaa !111
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !306
  %1 = load i16, i16* %fingerprint, align 2, !dbg !306, !tbaa !218
  call void @llvm.dbg.value(metadata i16 %1, metadata !303, metadata !DIExpression()), !dbg !307
  call void @llvm.dbg.value(metadata i16 %1, metadata !222, metadata !DIExpression()), !dbg !308
  %fp.addr.sroa.2.0.extract.shift.i = lshr i16 %1, 8
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 2, metadata !206, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 0, metadata !208, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 5381, metadata !207, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !310
  %conv.i.i = and i16 %1, 255, !dbg !312
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !310
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 1, metadata !208, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 %conv.i.i, metadata !207, metadata !DIExpression(DW_OP_constu, 19035, DW_OP_minus, DW_OP_stack_value)), !dbg !310
  call void @llvm.dbg.value(metadata i8* undef, metadata !200, metadata !DIExpression()), !dbg !310
  %2 = mul nuw nsw i16 %conv.i.i, 33, !dbg !313
  %add.1.i.i = add nuw nsw i16 %fp.addr.sroa.2.0.extract.shift.i, 69, !dbg !313
  %add1.1.i.i = add nuw nsw i16 %add.1.i.i, %2, !dbg !314
  call void @llvm.dbg.value(metadata i16 2, metadata !208, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !207, metadata !DIExpression()), !dbg !310
  call void @llvm.dbg.value(metadata i16 %add1.1.i.i, metadata !228, metadata !DIExpression()), !dbg !308
  %and.i = and i16 %add1.1.i.i, 127, !dbg !315
  call void @llvm.dbg.value(metadata i16 %and.i, metadata !304, metadata !DIExpression()), !dbg !307
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !316
  %3 = load i16, i16* %index1, align 2, !dbg !316, !tbaa !239
  %xor = xor i16 %and.i, %3, !dbg !317
  call void @llvm.dbg.value(metadata i16 %xor, metadata !305, metadata !DIExpression()), !dbg !307
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %xor, !dbg !318
  %4 = load i16, i16* %arrayidx, align 2, !dbg !318, !tbaa !124
  %tobool = icmp eq i16 %4, 0, !dbg !318
  br i1 %tobool, label %if.then, label %if.end, !dbg !320

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !321
  store i8 1, i8* %success, align 2, !dbg !323, !tbaa !274
  store i16 %1, i16* %arrayidx, align 2, !dbg !324, !tbaa !124
  br label %cleanup, !dbg !325

if.end:                                           ; preds = %entry
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 5, !dbg !326
  %5 = load i16, i16* %relocation_count, align 2, !dbg !326, !tbaa !299
  %cmp = icmp ugt i16 %5, 7, !dbg !328
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !329

if.then8:                                         ; preds = %if.end
  %success10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !330
  store i8 0, i8* %success10, align 2, !dbg !332, !tbaa !274
  br label %cleanup, !dbg !333

if.end11:                                         ; preds = %if.end
  %inc = add nuw nsw i16 %5, 1, !dbg !334
  store i16 %inc, i16* %relocation_count, align 2, !dbg !334, !tbaa !299
  store i16 %xor, i16* %index1, align 2, !dbg !335, !tbaa !239
  %6 = load i16, i16* %arrayidx, align 2, !dbg !336, !tbaa !124
  store i16 %6, i16* %fingerprint, align 2, !dbg !337, !tbaa !218
  store i16 %1, i16* %arrayidx, align 2, !dbg !338, !tbaa !124
  br label %cleanup, !dbg !339

cleanup:                                          ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !339
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_insert_done() local_unnamed_addr #4 !dbg !340 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341, !tbaa !111
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !341
  %1 = load i16, i16* %insert_count, align 2, !dbg !342, !tbaa !343
  %inc = add i16 %1, 1, !dbg !342
  store i16 %inc, i16* %insert_count, align 2, !dbg !342, !tbaa !343
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !344
  %2 = load i8, i8* %success, align 2, !dbg !344, !tbaa !274, !range !345
  %3 = zext i8 %2 to i16, !dbg !344
  %inserted_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 7, !dbg !346
  %4 = load i16, i16* %inserted_count, align 2, !dbg !347, !tbaa !348
  %add = add i16 %4, %3, !dbg !347
  store i16 %add, i16* %inserted_count, align 2, !dbg !347, !tbaa !348
  %cmp = icmp ult i16 %inc, 32, !dbg !349
  br i1 %cmp, label %if.end, label %if.else, !dbg !351

if.else:                                          ; preds = %entry
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !352
  store i16 1, i16* %key, align 2, !dbg !354, !tbaa !184
  br label %if.end

if.end:                                           ; preds = %entry, %if.else
  ret void, !dbg !355
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_search() local_unnamed_addr #4 !dbg !356 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357, !tbaa !111
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !359
  %1 = load i16, i16* %index1, align 2, !dbg !359, !tbaa !239
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !357
  %2 = load i16, i16* %arrayidx, align 2, !dbg !357, !tbaa !124
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !360
  %3 = load i16, i16* %fingerprint, align 2, !dbg !360, !tbaa !218
  %cmp = icmp eq i16 %2, %3, !dbg !361
  br i1 %cmp, label %if.then, label %if.else, !dbg !362

if.then:                                          ; preds = %entry
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !363
  store i8 1, i8* %member, align 1, !dbg !365, !tbaa !366
  br label %if.end17, !dbg !367

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !368
  %4 = load i16, i16* %index2, align 2, !dbg !368, !tbaa !258
  %arrayidx7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !371
  %5 = load i16, i16* %arrayidx7, align 2, !dbg !371, !tbaa !124
  %cmp10 = icmp eq i16 %5, %3, !dbg !372
  %member13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !373
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !374

if.then11:                                        ; preds = %if.else
  store i8 1, i8* %member13, align 1, !dbg !375, !tbaa !366
  br label %if.end17, !dbg !377

if.else14:                                        ; preds = %if.else
  store i8 0, i8* %member13, align 1, !dbg !378, !tbaa !366
  br label %if.end17

if.end17:                                         ; preds = %if.then11, %if.else14, %if.then
  ret void, !dbg !380
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_done() local_unnamed_addr #4 !dbg !381 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !382, !tbaa !111
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 8, !dbg !382
  %1 = load i16, i16* %lookup_count, align 2, !dbg !383, !tbaa !384
  %inc = add i16 %1, 1, !dbg !383
  store i16 %inc, i16* %lookup_count, align 2, !dbg !383, !tbaa !384
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !385
  %2 = load i8, i8* %member, align 1, !dbg !385, !tbaa !366, !range !345
  %3 = zext i8 %2 to i16, !dbg !385
  %member_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 9, !dbg !386
  %4 = load i16, i16* %member_count, align 2, !dbg !387, !tbaa !388
  %add = add i16 %4, %3, !dbg !387
  store i16 %add, i16* %member_count, align 2, !dbg !387, !tbaa !388
  ret void, !dbg !389
}

; Function Attrs: noinline noreturn nounwind
define dso_local void @task_done() local_unnamed_addr #6 !dbg !390 {
entry:
  tail call void @exit(i16 0) #11, !dbg !391
  unreachable, !dbg !391
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #7

; Function Attrs: noinline nounwind
define dso_local void @task_commit() local_unnamed_addr #5 !dbg !392 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !406, !tbaa !102
  %cmp = icmp eq i16 %0, 1, !dbg !407
  br i1 %cmp, label %if.then, label %if.else, !dbg !408

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !409, !tbaa !111
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !410, !tbaa !111
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #10, !dbg !411
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !412, !srcloc !413
  call void @llvm.dbg.value(metadata i16 %1, metadata !394, metadata !DIExpression()), !dbg !414
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !415, !srcloc !416
  call void @llvm.dbg.value(metadata i16 %2, metadata !399, metadata !DIExpression()), !dbg !417
  br label %do.end, !dbg !418

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !419, !tbaa !111
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !420, !tbaa !111
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #10, !dbg !421
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !422, !srcloc !423
  call void @llvm.dbg.value(metadata i16 %3, metadata !401, metadata !DIExpression()), !dbg !424
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #10, !dbg !425, !srcloc !426
  call void @llvm.dbg.value(metadata i16 %4, metadata !404, metadata !DIExpression()), !dbg !427
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink23 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !428
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !428
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !428
  %sub = sub i16 9214, %.sink23, !dbg !428
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #10, !dbg !428
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !428, !tbaa !124
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !428, !tbaa !111
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 298, i16 zeroext %call) #10, !dbg !428
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !428, !tbaa !124
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !428, !tbaa !111
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !428
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !428, !tbaa !143
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !428, !tbaa !102
  ret void, !dbg !429
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #8 !dbg !430 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !434, !tbaa !102
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !435, !tbaa !111
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !436, !tbaa !111
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !437, !tbaa !79
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !439, !tbaa !84
  %1 = or i8 %0, 1, !dbg !439
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !439, !tbaa !84
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !440, !tbaa !84
  %3 = and i8 %2, -2, !dbg !440
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !440, !tbaa !84
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !441, !tbaa !79
  %and4.i = and i16 %4, -2, !dbg !441
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !441, !tbaa !79
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !442, !tbaa !84
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !443, !tbaa !79
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !444, !tbaa !79
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !445, !tbaa !79
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !446, !tbaa !84
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !447, !tbaa !79
  tail call void @task_init(), !dbg !448
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449, !tbaa !111
  %lookup_count24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i16 0, i32 1, i32 8, !dbg !449
  %6 = load i16, i16* %lookup_count24, align 2, !dbg !449, !tbaa !384
  %cmp25 = icmp ult i16 %6, 32, !dbg !450
  br i1 %cmp25, label %while.body, label %while.end21, !dbg !451

while.body:                                       ; preds = %entry, %if.end20
  tail call void @task_generate_key(), !dbg !452
  tail call void @task_commit(), !dbg !454
  tail call void @task_calc_indexes(), !dbg !455
  tail call void @task_commit(), !dbg !456
  tail call void @task_calc_indexes_index_1(), !dbg !457
  tail call void @task_commit(), !dbg !458
  tail call void @task_calc_indexes_index_2(), !dbg !459
  tail call void @task_commit(), !dbg !460
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !461, !tbaa !111
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 1, i32 6, !dbg !461
  %8 = load i16, i16* %insert_count, align 2, !dbg !461, !tbaa !343
  %cmp2 = icmp ult i16 %8, 32, !dbg !463
  br i1 %cmp2, label %if.then, label %if.else, !dbg !464

if.then:                                          ; preds = %while.body
  tail call void @task_add(), !dbg !465
  tail call void @task_commit(), !dbg !467
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468, !tbaa !111
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 3, !dbg !470
  %10 = load i16, i16* %index1, align 2, !dbg !470, !tbaa !239
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 0, i16 %10, !dbg !468
  %11 = load i16, i16* %arrayidx, align 2, !dbg !468, !tbaa !124
  %tobool = icmp eq i16 %11, 0, !dbg !468
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !471

land.lhs.true:                                    ; preds = %if.then
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 4, !dbg !472
  %12 = load i16, i16* %index2, align 2, !dbg !472, !tbaa !258
  %arrayidx8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 0, i16 %12, !dbg !473
  %13 = load i16, i16* %arrayidx8, align 2, !dbg !473, !tbaa !124
  %tobool9 = icmp eq i16 %13, 0, !dbg !473
  br i1 %tobool9, label %if.end, label %while.cond11.preheader, !dbg !474

while.cond11.preheader:                           ; preds = %land.lhs.true
  %success22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i16 0, i32 1, i32 10, !dbg !475
  %14 = load i8, i8* %success22, align 2, !dbg !475, !tbaa !274, !range !345
  %cmp1423 = icmp eq i8 %14, 0, !dbg !477
  br i1 %cmp1423, label %land.rhs, label %if.end, !dbg !478

land.rhs:                                         ; preds = %while.cond11.preheader, %while.body19
  %15 = phi %struct.camel_buffer_t* [ %17, %while.body19 ], [ %9, %while.cond11.preheader ]
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i16 0, i32 1, i32 5, !dbg !479
  %16 = load i16, i16* %relocation_count, align 2, !dbg !479, !tbaa !299
  %cmp17 = icmp ult i16 %16, 8, !dbg !480
  br i1 %cmp17, label %while.body19, label %if.end, !dbg !481

while.body19:                                     ; preds = %land.rhs
  tail call void @task_relocate(), !dbg !482
  tail call void @task_commit(), !dbg !484
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !475, !tbaa !111
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i16 0, i32 1, i32 10, !dbg !475
  %18 = load i8, i8* %success, align 2, !dbg !475, !tbaa !274, !range !345
  %cmp14 = icmp eq i8 %18, 0, !dbg !477
  br i1 %cmp14, label %land.rhs, label %if.end, !dbg !478, !llvm.loop !485

if.end:                                           ; preds = %while.body19, %land.rhs, %while.cond11.preheader, %land.lhs.true, %if.then
  tail call void @task_insert_done(), !dbg !487
  br label %if.end20, !dbg !488

if.else:                                          ; preds = %while.body
  tail call void @task_lookup_search(), !dbg !489
  tail call void @task_commit(), !dbg !491
  tail call void @task_lookup_done(), !dbg !492
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  tail call void @task_commit(), !dbg !493
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449, !tbaa !111
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i16 0, i32 1, i32 8, !dbg !449
  %20 = load i16, i16* %lookup_count, align 2, !dbg !449, !tbaa !384
  %cmp = icmp ult i16 %20, 32, !dbg !450
  br i1 %cmp, label %while.body, label %while.end21, !dbg !451, !llvm.loop !494

while.end21:                                      ; preds = %if.end20, %entry
  tail call void @task_done(), !dbg !496
  unreachable
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #9

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #5 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="true" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #8 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="true" "no-jump-tables"="false" "no-nans-fp-math"="true" "no-signed-zeros-fp-math"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "unsafe-fp-math"="true" "use-soft-float"="false" }
attributes #9 = { nounwind readnone speculatable willreturn }
attributes #10 = { nounwind }
attributes #11 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 141, type: !68, isLocal: false, isDefinition: true)
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
!13 = !{!14, !21, !26, !28, !0, !30, !63, !65}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 223, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 649, type: !23, isLocal: true, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 16)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 148, type: !32, isLocal: false, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 16)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 134, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 129, size: 2400, elements: !35)
!35 = !{!36, !41, !62}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !34, file: !3, line: 131, baseType: !37, size: 176)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 176, elements: !39)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 49, baseType: !18)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !34, file: !3, line: 132, baseType: !42, size: 2208, offset: 176)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 126, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 112, size: 2208, elements: !44)
!44 = !{!45, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !61}
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
!62 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !34, file: !3, line: 133, baseType: !18, size: 16, offset: 2384)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 148, type: !32, isLocal: false, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 177, type: !67, isLocal: false, isDefinition: true)
!67 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !39)
!68 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 136, size: 4816, elements: !69)
!69 = !{!70, !71, !72}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !68, file: !3, line: 138, baseType: !18, size: 16)
!71 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !68, file: !3, line: 139, baseType: !33, size: 2400, offset: 16)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !68, file: !3, line: 140, baseType: !33, size: 2400, offset: 2416)
!73 = !{i32 2, !"Dwarf Version", i32 4}
!74 = !{i32 2, !"Debug Info Version", i32 3}
!75 = !{i32 1, !"wchar_size", i32 2}
!76 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!77 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 150, type: !24, scopeLine: 150, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!78 = !DILocation(line: 151, column: 10, scope: !77)
!79 = !{!80, !80, i64 0}
!80 = !{!"int", !81, i64 0}
!81 = !{!"omnipotent char", !82, i64 0}
!82 = !{!"Simple C/C++ TBAA"}
!83 = !DILocation(line: 153, column: 9, scope: !77)
!84 = !{!81, !81, i64 0}
!85 = !DILocation(line: 155, column: 9, scope: !77)
!86 = !DILocation(line: 160, column: 11, scope: !77)
!87 = !DILocation(line: 165, column: 12, scope: !77)
!88 = !DILocation(line: 166, column: 10, scope: !77)
!89 = !DILocation(line: 167, column: 10, scope: !77)
!90 = !DILocation(line: 169, column: 10, scope: !77)
!91 = !DILocation(line: 170, column: 12, scope: !77)
!92 = !DILocation(line: 173, column: 10, scope: !77)
!93 = !DILocation(line: 175, column: 1, scope: !77)
!94 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 179, type: !24, scopeLine: 179, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !95)
!95 = !{!96, !98}
!96 = !DILocalVariable(name: "__x", scope: !97, file: !3, line: 206, type: !6)
!97 = distinct !DILexicalBlock(scope: !94, file: !3, line: 206, column: 33)
!98 = !DILocalVariable(name: "__x", scope: !99, file: !3, line: 206, type: !6)
!99 = distinct !DILexicalBlock(scope: !94, file: !3, line: 206, column: 65)
!100 = !DILocation(line: 180, column: 14, scope: !101)
!101 = distinct !DILexicalBlock(scope: !94, file: !3, line: 180, column: 8)
!102 = !{!103, !104, i64 0}
!103 = !{!"Camel", !104, i64 0, !105, i64 2, !105, i64 302}
!104 = !{!"short", !81, i64 0}
!105 = !{!"camel_buffer_t", !81, i64 0, !106, i64 22, !104, i64 298}
!106 = !{!"camel_global_t", !81, i64 0, !104, i64 256, !104, i64 258, !104, i64 260, !104, i64 262, !104, i64 264, !104, i64 266, !104, i64 268, !104, i64 270, !104, i64 272, !107, i64 274, !107, i64 275}
!107 = !{!"_Bool", !81, i64 0}
!108 = !DILocation(line: 180, column: 8, scope: !94)
!109 = !DILocation(line: 181, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !101, file: !3, line: 180, column: 34)
!111 = !{!112, !112, i64 0}
!112 = !{!"any pointer", !81, i64 0}
!113 = !DILocation(line: 182, column: 16, scope: !110)
!114 = !DILocation(line: 183, column: 5, scope: !110)
!115 = !DILocation(line: 184, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !117, file: !3, line: 183, column: 41)
!117 = distinct !DILexicalBlock(scope: !101, file: !3, line: 183, column: 15)
!118 = !DILocation(line: 185, column: 16, scope: !116)
!119 = !DILocation(line: 186, column: 5, scope: !116)
!120 = !DILocation(line: 187, column: 9, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !3, line: 186, column: 12)
!122 = !DILocation(line: 204, column: 3, scope: !123)
!123 = distinct !DILexicalBlock(scope: !94, file: !3, line: 204, column: 3)
!124 = !{!104, !104, i64 0}
!125 = !{i32 -2146584784}
!126 = !DILocation(line: 206, column: 33, scope: !97)
!127 = !{i32 -2146584548}
!128 = !DILocation(line: 0, scope: !97)
!129 = !DILocation(line: 206, column: 51, scope: !94)
!130 = !DILocation(line: 206, column: 33, scope: !94)
!131 = !DILocation(line: 206, column: 65, scope: !99)
!132 = !{i32 -2146584423}
!133 = !DILocation(line: 0, scope: !99)
!134 = !DILocation(line: 206, column: 63, scope: !94)
!135 = !DILocation(line: 206, column: 19, scope: !94)
!136 = !DILocation(line: 206, column: 17, scope: !94)
!137 = !DILocation(line: 207, column: 37, scope: !94)
!138 = !DILocation(line: 207, column: 23, scope: !94)
!139 = !DILocation(line: 207, column: 21, scope: !94)
!140 = !DILocation(line: 210, column: 27, scope: !141)
!141 = distinct !DILexicalBlock(scope: !94, file: !3, line: 210, column: 6)
!142 = !DILocation(line: 210, column: 33, scope: !141)
!143 = !{!105, !104, i64 298}
!144 = !DILocation(line: 210, column: 24, scope: !141)
!145 = !DILocation(line: 210, column: 6, scope: !94)
!146 = !DILocation(line: 211, column: 11, scope: !147)
!147 = distinct !DILexicalBlock(scope: !141, file: !3, line: 210, column: 51)
!148 = !DILocation(line: 211, column: 4, scope: !147)
!149 = !DILocation(line: 151, column: 10, scope: !77, inlinedAt: !150)
!150 = distinct !DILocation(line: 212, column: 4, scope: !147)
!151 = !DILocation(line: 153, column: 9, scope: !77, inlinedAt: !150)
!152 = !DILocation(line: 155, column: 9, scope: !77, inlinedAt: !150)
!153 = !DILocation(line: 160, column: 11, scope: !77, inlinedAt: !150)
!154 = !DILocation(line: 165, column: 12, scope: !77, inlinedAt: !150)
!155 = !DILocation(line: 166, column: 10, scope: !77, inlinedAt: !150)
!156 = !DILocation(line: 167, column: 10, scope: !77, inlinedAt: !150)
!157 = !DILocation(line: 169, column: 10, scope: !77, inlinedAt: !150)
!158 = !DILocation(line: 170, column: 12, scope: !77, inlinedAt: !150)
!159 = !DILocation(line: 173, column: 10, scope: !77, inlinedAt: !150)
!160 = !DILocation(line: 213, column: 24, scope: !147)
!161 = !DILocation(line: 213, column: 4, scope: !147)
!162 = !DILocation(line: 214, column: 3, scope: !147)
!163 = !DILocation(line: 215, column: 4, scope: !164)
!164 = distinct !DILexicalBlock(scope: !141, file: !3, line: 214, column: 9)
!165 = !DILocation(line: 218, column: 1, scope: !94)
!166 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 264, type: !24, scopeLine: 265, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !167)
!167 = !{!168}
!168 = !DILocalVariable(name: "i", scope: !166, file: !3, line: 266, type: !6)
!169 = !DILocation(line: 0, scope: !166)
!170 = !DILocation(line: 267, column: 5, scope: !171)
!171 = distinct !DILexicalBlock(scope: !166, file: !3, line: 267, column: 5)
!172 = !DILocation(line: 268, column: 9, scope: !173)
!173 = distinct !DILexicalBlock(scope: !174, file: !3, line: 267, column: 40)
!174 = distinct !DILexicalBlock(scope: !171, file: !3, line: 267, column: 5)
!175 = !DILocation(line: 268, column: 23, scope: !173)
!176 = !DILocation(line: 267, column: 35, scope: !174)
!177 = !DILocation(line: 267, column: 19, scope: !174)
!178 = distinct !{!178, !170, !179}
!179 = !DILocation(line: 270, column: 5, scope: !171)
!180 = !DILocation(line: 271, column: 5, scope: !166)
!181 = !DILocation(line: 275, column: 5, scope: !166)
!182 = !DILocation(line: 272, column: 22, scope: !166)
!183 = !DILocation(line: 275, column: 13, scope: !166)
!184 = !{!105, !104, i64 278}
!185 = !DILocation(line: 276, column: 1, scope: !166)
!186 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 294, type: !24, scopeLine: 295, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!187 = !DILocation(line: 297, column: 16, scope: !186)
!188 = !DILocation(line: 297, column: 29, scope: !186)
!189 = !DILocation(line: 297, column: 13, scope: !186)
!190 = !DILocation(line: 298, column: 1, scope: !186)
!191 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 316, type: !24, scopeLine: 317, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!192 = !DILocation(line: 318, column: 43, scope: !191)
!193 = !DILocalVariable(name: "key", arg: 1, scope: !194, file: !3, line: 243, type: !17)
!194 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 243, type: !195, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !197)
!195 = !DISubroutineType(types: !196)
!196 = !{!47, !17}
!197 = !{!193}
!198 = !DILocation(line: 0, scope: !194, inlinedAt: !199)
!199 = distinct !DILocation(line: 318, column: 23, scope: !191)
!200 = !DILocalVariable(name: "data", arg: 1, scope: !201, file: !3, line: 225, type: !7)
!201 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 225, type: !202, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !205)
!202 = !DISubroutineType(types: !203)
!203 = !{!204, !7, !6}
!204 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!205 = !{!200, !206, !207, !208}
!206 = !DILocalVariable(name: "len", arg: 2, scope: !201, file: !3, line: 225, type: !6)
!207 = !DILocalVariable(name: "hash", scope: !201, file: !3, line: 227, type: !18)
!208 = !DILocalVariable(name: "i", scope: !201, file: !3, line: 228, type: !6)
!209 = !DILocation(line: 0, scope: !201, inlinedAt: !210)
!210 = distinct !DILocation(line: 245, column: 12, scope: !194, inlinedAt: !199)
!211 = !DILocation(line: 231, column: 39, scope: !212, inlinedAt: !210)
!212 = distinct !DILexicalBlock(scope: !213, file: !3, line: 230, column: 5)
!213 = distinct !DILexicalBlock(scope: !201, file: !3, line: 230, column: 5)
!214 = !DILocation(line: 231, column: 29, scope: !212, inlinedAt: !210)
!215 = !DILocation(line: 231, column: 37, scope: !212, inlinedAt: !210)
!216 = !DILocation(line: 318, column: 5, scope: !191)
!217 = !DILocation(line: 318, column: 21, scope: !191)
!218 = !{!105, !104, i64 280}
!219 = !DILocation(line: 319, column: 1, scope: !191)
!220 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 337, type: !24, scopeLine: 338, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!221 = !DILocation(line: 339, column: 32, scope: !220)
!222 = !DILocalVariable(name: "fp", arg: 1, scope: !223, file: !3, line: 237, type: !47)
!223 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 237, type: !224, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !227)
!224 = !DISubroutineType(types: !225)
!225 = !{!226, !47}
!226 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!227 = !{!222, !228}
!228 = !DILocalVariable(name: "hash", scope: !223, file: !3, line: 239, type: !204)
!229 = !DILocation(line: 0, scope: !223, inlinedAt: !230)
!230 = distinct !DILocation(line: 339, column: 18, scope: !220)
!231 = !DILocation(line: 0, scope: !201, inlinedAt: !232)
!232 = distinct !DILocation(line: 239, column: 19, scope: !223, inlinedAt: !230)
!233 = !DILocation(line: 231, column: 39, scope: !212, inlinedAt: !232)
!234 = !DILocation(line: 231, column: 29, scope: !212, inlinedAt: !232)
!235 = !DILocation(line: 231, column: 37, scope: !212, inlinedAt: !232)
!236 = !DILocation(line: 240, column: 17, scope: !223, inlinedAt: !230)
!237 = !DILocation(line: 339, column: 5, scope: !220)
!238 = !DILocation(line: 339, column: 16, scope: !220)
!239 = !{!105, !104, i64 282}
!240 = !DILocation(line: 340, column: 1, scope: !220)
!241 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 358, type: !24, scopeLine: 359, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!242 = !{!243}
!243 = !DILocalVariable(name: "fp_hash", scope: !241, file: !3, line: 360, type: !226)
!244 = !DILocation(line: 360, column: 37, scope: !241)
!245 = !DILocation(line: 0, scope: !223, inlinedAt: !246)
!246 = distinct !DILocation(line: 360, column: 23, scope: !241)
!247 = !DILocation(line: 0, scope: !201, inlinedAt: !248)
!248 = distinct !DILocation(line: 239, column: 19, scope: !223, inlinedAt: !246)
!249 = !DILocation(line: 231, column: 39, scope: !212, inlinedAt: !248)
!250 = !DILocation(line: 231, column: 29, scope: !212, inlinedAt: !248)
!251 = !DILocation(line: 231, column: 37, scope: !212, inlinedAt: !248)
!252 = !DILocation(line: 240, column: 17, scope: !223, inlinedAt: !246)
!253 = !DILocation(line: 0, scope: !241)
!254 = !DILocation(line: 361, column: 18, scope: !241)
!255 = !DILocation(line: 361, column: 29, scope: !241)
!256 = !DILocation(line: 361, column: 5, scope: !241)
!257 = !DILocation(line: 361, column: 16, scope: !241)
!258 = !{!105, !104, i64 284}
!259 = !DILocation(line: 362, column: 1, scope: !241)
!260 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 380, type: !24, scopeLine: 381, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !261)
!261 = !{!262, !267}
!262 = !DILocalVariable(name: "fp_victim", scope: !263, file: !3, line: 390, type: !47)
!263 = distinct !DILexicalBlock(scope: !264, file: !3, line: 389, column: 16)
!264 = distinct !DILexicalBlock(scope: !265, file: !3, line: 386, column: 13)
!265 = distinct !DILexicalBlock(scope: !266, file: !3, line: 385, column: 12)
!266 = distinct !DILexicalBlock(scope: !260, file: !3, line: 382, column: 9)
!267 = !DILocalVariable(name: "index_victim", scope: !263, file: !3, line: 391, type: !226)
!268 = !DILocation(line: 382, column: 10, scope: !266)
!269 = !DILocation(line: 382, column: 21, scope: !266)
!270 = !DILocation(line: 382, column: 9, scope: !260)
!271 = !DILocation(line: 383, column: 9, scope: !272)
!272 = distinct !DILexicalBlock(scope: !266, file: !3, line: 382, column: 34)
!273 = !DILocation(line: 383, column: 21, scope: !272)
!274 = !{!105, !107, i64 296}
!275 = !DILocation(line: 384, column: 34, scope: !272)
!276 = !DILocation(line: 384, column: 32, scope: !272)
!277 = !DILocation(line: 385, column: 5, scope: !272)
!278 = !DILocation(line: 386, column: 25, scope: !264)
!279 = !DILocation(line: 386, column: 14, scope: !264)
!280 = !DILocation(line: 386, column: 13, scope: !265)
!281 = !DILocation(line: 387, column: 13, scope: !282)
!282 = distinct !DILexicalBlock(scope: !264, file: !3, line: 386, column: 38)
!283 = !DILocation(line: 387, column: 25, scope: !282)
!284 = !DILocation(line: 388, column: 38, scope: !282)
!285 = !DILocation(line: 388, column: 36, scope: !282)
!286 = !DILocation(line: 389, column: 9, scope: !282)
!287 = !DILocation(line: 392, column: 17, scope: !288)
!288 = distinct !DILexicalBlock(scope: !263, file: !3, line: 392, column: 17)
!289 = !DILocation(line: 392, column: 24, scope: !288)
!290 = !DILocation(line: 0, scope: !288)
!291 = !DILocation(line: 392, column: 17, scope: !263)
!292 = !DILocation(line: 0, scope: !263)
!293 = !DILocation(line: 401, column: 40, scope: !263)
!294 = !DILocation(line: 401, column: 38, scope: !263)
!295 = !DILocation(line: 402, column: 24, scope: !263)
!296 = !DILocation(line: 403, column: 29, scope: !263)
!297 = !DILocation(line: 404, column: 13, scope: !263)
!298 = !DILocation(line: 404, column: 34, scope: !263)
!299 = !{!105, !104, i64 286}
!300 = !DILocation(line: 407, column: 1, scope: !260)
!301 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 425, type: !24, scopeLine: 426, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !302)
!302 = !{!303, !304, !305}
!303 = !DILocalVariable(name: "fp_victim", scope: !301, file: !3, line: 427, type: !47)
!304 = !DILocalVariable(name: "fp_hash_victim", scope: !301, file: !3, line: 428, type: !226)
!305 = !DILocalVariable(name: "index2_victim", scope: !301, file: !3, line: 429, type: !226)
!306 = !DILocation(line: 427, column: 31, scope: !301)
!307 = !DILocation(line: 0, scope: !301)
!308 = !DILocation(line: 0, scope: !223, inlinedAt: !309)
!309 = distinct !DILocation(line: 428, column: 30, scope: !301)
!310 = !DILocation(line: 0, scope: !201, inlinedAt: !311)
!311 = distinct !DILocation(line: 239, column: 19, scope: !223, inlinedAt: !309)
!312 = !DILocation(line: 231, column: 39, scope: !212, inlinedAt: !311)
!313 = !DILocation(line: 231, column: 29, scope: !212, inlinedAt: !311)
!314 = !DILocation(line: 231, column: 37, scope: !212, inlinedAt: !311)
!315 = !DILocation(line: 240, column: 17, scope: !223, inlinedAt: !309)
!316 = !DILocation(line: 429, column: 29, scope: !301)
!317 = !DILocation(line: 429, column: 40, scope: !301)
!318 = !DILocation(line: 433, column: 14, scope: !319)
!319 = distinct !DILexicalBlock(scope: !301, file: !3, line: 433, column: 13)
!320 = !DILocation(line: 433, column: 13, scope: !301)
!321 = !DILocation(line: 434, column: 13, scope: !322)
!322 = distinct !DILexicalBlock(scope: !319, file: !3, line: 433, column: 41)
!323 = !DILocation(line: 434, column: 25, scope: !322)
!324 = !DILocation(line: 435, column: 39, scope: !322)
!325 = !DILocation(line: 436, column: 13, scope: !322)
!326 = !DILocation(line: 440, column: 13, scope: !327)
!327 = distinct !DILexicalBlock(scope: !301, file: !3, line: 440, column: 13)
!328 = !DILocation(line: 440, column: 34, scope: !327)
!329 = !DILocation(line: 440, column: 13, scope: !301)
!330 = !DILocation(line: 441, column: 13, scope: !331)
!331 = distinct !DILexicalBlock(scope: !327, file: !3, line: 440, column: 54)
!332 = !DILocation(line: 441, column: 25, scope: !331)
!333 = !DILocation(line: 442, column: 13, scope: !331)
!334 = !DILocation(line: 445, column: 9, scope: !301)
!335 = !DILocation(line: 446, column: 20, scope: !301)
!336 = !DILocation(line: 447, column: 27, scope: !301)
!337 = !DILocation(line: 447, column: 25, scope: !301)
!338 = !DILocation(line: 448, column: 35, scope: !301)
!339 = !DILocation(line: 449, column: 1, scope: !301)
!340 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 467, type: !24, scopeLine: 468, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!341 = !DILocation(line: 469, column: 7, scope: !340)
!342 = !DILocation(line: 469, column: 5, scope: !340)
!343 = !{!105, !104, i64 288}
!344 = !DILocation(line: 470, column: 27, scope: !340)
!345 = !{i8 0, i8 2}
!346 = !DILocation(line: 470, column: 5, scope: !340)
!347 = !DILocation(line: 470, column: 24, scope: !340)
!348 = !{!105, !104, i64 290}
!349 = !DILocation(line: 472, column: 26, scope: !350)
!350 = distinct !DILexicalBlock(scope: !340, file: !3, line: 472, column: 9)
!351 = !DILocation(line: 472, column: 9, scope: !340)
!352 = !DILocation(line: 474, column: 9, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !3, line: 473, column: 12)
!354 = !DILocation(line: 474, column: 17, scope: !353)
!355 = !DILocation(line: 476, column: 1, scope: !340)
!356 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 494, type: !24, scopeLine: 495, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!357 = !DILocation(line: 496, column: 9, scope: !358)
!358 = distinct !DILexicalBlock(scope: !356, file: !3, line: 496, column: 9)
!359 = !DILocation(line: 496, column: 20, scope: !358)
!360 = !DILocation(line: 496, column: 35, scope: !358)
!361 = !DILocation(line: 496, column: 32, scope: !358)
!362 = !DILocation(line: 496, column: 9, scope: !356)
!363 = !DILocation(line: 497, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !358, file: !3, line: 496, column: 52)
!365 = !DILocation(line: 497, column: 20, scope: !364)
!366 = !{!105, !107, i64 297}
!367 = !DILocation(line: 498, column: 5, scope: !364)
!368 = !DILocation(line: 499, column: 24, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !3, line: 499, column: 13)
!370 = distinct !DILexicalBlock(scope: !358, file: !3, line: 498, column: 12)
!371 = !DILocation(line: 499, column: 13, scope: !369)
!372 = !DILocation(line: 499, column: 36, scope: !369)
!373 = !DILocation(line: 0, scope: !369)
!374 = !DILocation(line: 499, column: 13, scope: !370)
!375 = !DILocation(line: 500, column: 24, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !3, line: 499, column: 56)
!377 = !DILocation(line: 501, column: 9, scope: !376)
!378 = !DILocation(line: 503, column: 24, scope: !379)
!379 = distinct !DILexicalBlock(scope: !369, file: !3, line: 502, column: 14)
!380 = !DILocation(line: 509, column: 1, scope: !356)
!381 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 527, type: !24, scopeLine: 528, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!382 = !DILocation(line: 529, column: 7, scope: !381)
!383 = !DILocation(line: 529, column: 5, scope: !381)
!384 = !{!105, !104, i64 292}
!385 = !DILocation(line: 531, column: 25, scope: !381)
!386 = !DILocation(line: 531, column: 5, scope: !381)
!387 = !DILocation(line: 531, column: 22, scope: !381)
!388 = !{!105, !104, i64 294}
!389 = !DILocation(line: 536, column: 1, scope: !381)
!390 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 538, type: !24, scopeLine: 539, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!391 = !DILocation(line: 542, column: 5, scope: !390)
!392 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 545, type: !24, scopeLine: 545, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !393)
!393 = !{!394, !399, !401, !404}
!394 = !DILocalVariable(name: "__x", scope: !395, file: !3, line: 553, type: !6)
!395 = distinct !DILexicalBlock(scope: !396, file: !3, line: 553, column: 65)
!396 = distinct !DILexicalBlock(scope: !397, file: !3, line: 549, column: 57)
!397 = distinct !DILexicalBlock(scope: !398, file: !3, line: 549, column: 32)
!398 = distinct !DILexicalBlock(scope: !392, file: !3, line: 547, column: 7)
!399 = !DILocalVariable(name: "__x", scope: !400, file: !3, line: 553, type: !6)
!400 = distinct !DILexicalBlock(scope: !396, file: !3, line: 553, column: 97)
!401 = !DILocalVariable(name: "__x", scope: !402, file: !3, line: 561, type: !6)
!402 = distinct !DILexicalBlock(scope: !403, file: !3, line: 561, column: 65)
!403 = distinct !DILexicalBlock(scope: !397, file: !3, line: 557, column: 35)
!404 = !DILocalVariable(name: "__x", scope: !405, file: !3, line: 561, type: !6)
!405 = distinct !DILexicalBlock(scope: !403, file: !3, line: 561, column: 97)
!406 = !DILocation(line: 549, column: 38, scope: !397)
!407 = !DILocation(line: 549, column: 43, scope: !397)
!408 = !DILocation(line: 549, column: 32, scope: !398)
!409 = !DILocation(line: 550, column: 38, scope: !396)
!410 = !DILocation(line: 551, column: 40, scope: !396)
!411 = !DILocation(line: 552, column: 33, scope: !396)
!412 = !DILocation(line: 553, column: 65, scope: !395)
!413 = !{i32 -2146582159}
!414 = !DILocation(line: 0, scope: !395)
!415 = !DILocation(line: 553, column: 97, scope: !400)
!416 = !{i32 -2146582034}
!417 = !DILocation(line: 0, scope: !400)
!418 = !DILocation(line: 557, column: 29, scope: !396)
!419 = !DILocation(line: 558, column: 38, scope: !403)
!420 = !DILocation(line: 559, column: 40, scope: !403)
!421 = !DILocation(line: 560, column: 33, scope: !403)
!422 = !DILocation(line: 561, column: 65, scope: !402)
!423 = !{i32 -2146581902}
!424 = !DILocation(line: 0, scope: !402)
!425 = !DILocation(line: 561, column: 97, scope: !405)
!426 = !{i32 -2146581777}
!427 = !DILocation(line: 0, scope: !405)
!428 = !DILocation(line: 0, scope: !397)
!429 = !DILocation(line: 568, column: 1, scope: !392)
!430 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 570, type: !431, scopeLine: 570, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!431 = !DISubroutineType(types: !432)
!432 = !{!433}
!433 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!434 = !DILocation(line: 572, column: 16, scope: !430)
!435 = !DILocation(line: 573, column: 10, scope: !430)
!436 = !DILocation(line: 574, column: 12, scope: !430)
!437 = !DILocation(line: 151, column: 10, scope: !77, inlinedAt: !438)
!438 = distinct !DILocation(line: 575, column: 5, scope: !430)
!439 = !DILocation(line: 153, column: 9, scope: !77, inlinedAt: !438)
!440 = !DILocation(line: 155, column: 9, scope: !77, inlinedAt: !438)
!441 = !DILocation(line: 160, column: 11, scope: !77, inlinedAt: !438)
!442 = !DILocation(line: 165, column: 12, scope: !77, inlinedAt: !438)
!443 = !DILocation(line: 166, column: 10, scope: !77, inlinedAt: !438)
!444 = !DILocation(line: 167, column: 10, scope: !77, inlinedAt: !438)
!445 = !DILocation(line: 169, column: 10, scope: !77, inlinedAt: !438)
!446 = !DILocation(line: 170, column: 12, scope: !77, inlinedAt: !438)
!447 = !DILocation(line: 173, column: 10, scope: !77, inlinedAt: !438)
!448 = !DILocation(line: 585, column: 5, scope: !430)
!449 = !DILocation(line: 589, column: 9, scope: !430)
!450 = !DILocation(line: 589, column: 27, scope: !430)
!451 = !DILocation(line: 589, column: 3, scope: !430)
!452 = !DILocation(line: 591, column: 9, scope: !453)
!453 = distinct !DILexicalBlock(scope: !430, file: !3, line: 589, column: 42)
!454 = !DILocation(line: 592, column: 9, scope: !453)
!455 = !DILocation(line: 596, column: 9, scope: !453)
!456 = !DILocation(line: 597, column: 9, scope: !453)
!457 = !DILocation(line: 601, column: 9, scope: !453)
!458 = !DILocation(line: 602, column: 9, scope: !453)
!459 = !DILocation(line: 606, column: 9, scope: !453)
!460 = !DILocation(line: 607, column: 9, scope: !453)
!461 = !DILocation(line: 610, column: 12, scope: !462)
!462 = distinct !DILexicalBlock(scope: !453, file: !3, line: 610, column: 12)
!463 = !DILocation(line: 610, column: 30, scope: !462)
!464 = !DILocation(line: 610, column: 12, scope: !453)
!465 = !DILocation(line: 612, column: 13, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !3, line: 610, column: 45)
!467 = !DILocation(line: 613, column: 13, scope: !466)
!468 = !DILocation(line: 616, column: 16, scope: !469)
!469 = distinct !DILexicalBlock(scope: !466, file: !3, line: 616, column: 16)
!470 = !DILocation(line: 616, column: 28, scope: !469)
!471 = !DILocation(line: 616, column: 41, scope: !469)
!472 = !DILocation(line: 616, column: 56, scope: !469)
!473 = !DILocation(line: 616, column: 44, scope: !469)
!474 = !DILocation(line: 616, column: 16, scope: !466)
!475 = !DILocation(line: 617, column: 23, scope: !476)
!476 = distinct !DILexicalBlock(scope: !469, file: !3, line: 616, column: 70)
!477 = !DILocation(line: 617, column: 36, scope: !476)
!478 = !DILocation(line: 617, column: 45, scope: !476)
!479 = !DILocation(line: 617, column: 49, scope: !476)
!480 = !DILocation(line: 617, column: 71, scope: !476)
!481 = !DILocation(line: 617, column: 17, scope: !476)
!482 = !DILocation(line: 619, column: 21, scope: !483)
!483 = distinct !DILexicalBlock(scope: !476, file: !3, line: 617, column: 91)
!484 = !DILocation(line: 620, column: 21, scope: !483)
!485 = distinct !{!485, !481, !486}
!486 = !DILocation(line: 622, column: 17, scope: !476)
!487 = !DILocation(line: 626, column: 13, scope: !466)
!488 = !DILocation(line: 629, column: 9, scope: !466)
!489 = !DILocation(line: 631, column: 13, scope: !490)
!490 = distinct !DILexicalBlock(scope: !462, file: !3, line: 629, column: 16)
!491 = !DILocation(line: 632, column: 13, scope: !490)
!492 = !DILocation(line: 636, column: 13, scope: !490)
!493 = !DILocation(line: 0, scope: !462)
!494 = distinct !{!494, !451, !495}
!495 = !DILocation(line: 640, column: 5, scope: !430)
!496 = !DILocation(line: 642, column: 5, scope: !430)
