; ModuleID = 'camel_cuckoo_mod.bc'
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
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #12, !dbg !122
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !124, !tbaa !113
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !124
  %2 = load i16, i16* %arrayidx, align 2, !dbg !124, !tbaa !126
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #12, !dbg !124, !srcloc !127
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !128, !srcloc !129
  call void @llvm.dbg.value(metadata i16 %3, metadata !98, metadata !DIExpression()), !dbg !130
  %add = add i16 %3, 2, !dbg !131
  %4 = inttoptr i16 %add to i8*, !dbg !132
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !133, !srcloc !134
  call void @llvm.dbg.value(metadata i16 %5, metadata !100, metadata !DIExpression()), !dbg !135
  %sub = sub i16 9214, %5, !dbg !136
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #12, !dbg !137
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !138, !tbaa !126
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !139, !tbaa !113
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 300, i16 zeroext %call) #12, !dbg !140
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
  tail call void @camel_init(), !dbg !151
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !152, !tbaa !113
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i16 0, i32 0, i16 0, !dbg !152
  tail call void @__restore_registers(i16* %arraydecay) #12, !dbg !153
  br label %if.end13, !dbg !154

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #12, !dbg !155
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !157
}

declare dso_local void @__crt0_start(...) local_unnamed_addr #2

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_init() local_unnamed_addr #4 !dbg !158 {
entry:
  call void @llvm.dbg.value(metadata i16 0, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !161, !tbaa !113
  br label %for.body, !dbg !162

for.body:                                         ; preds = %for.body, %entry
  %i.010 = phi i16 [ 0, %entry ], [ %inc, %for.body ]
  call void @llvm.dbg.value(metadata i16 %i.010, metadata !160, metadata !DIExpression()), !dbg !161
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %i.010, !dbg !164
  store i16 %i.010, i16* %arrayidx, align 2, !dbg !167, !tbaa !126
  %inc = add nuw nsw i16 %i.010, 1, !dbg !168
  call void @llvm.dbg.value(metadata i16 %inc, metadata !160, metadata !DIExpression()), !dbg !161
  %exitcond = icmp eq i16 %inc, 128, !dbg !169
  br i1 %exitcond, label %for.end, label %for.body, !dbg !162, !llvm.loop !170

for.end:                                          ; preds = %for.body
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !172
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !173
  %1 = bitcast i16* %insert_count to i64*, !dbg !174
  store i64 0, i64* %1, align 2, !dbg !174
  store i16 1, i16* %key, align 2, !dbg !175, !tbaa !176
  ret void, !dbg !177
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_generate_key() local_unnamed_addr #4 !dbg !178 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !179, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !179
  %1 = load i16, i16* %key, align 2, !dbg !179, !tbaa !176
  %2 = mul i16 %1, 17, !dbg !180
  %mul = add i16 %2, 17, !dbg !180
  store i16 %mul, i16* %key, align 2, !dbg !181, !tbaa !176
  ret void, !dbg !182
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes() local_unnamed_addr #4 !dbg !183 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !184, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !184
  %1 = load i16, i16* %key, align 2, !dbg !184, !tbaa !176
  %call = tail call fastcc zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !185
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !186
  store i16 %call, i16* %fingerprint, align 2, !dbg !187, !tbaa !188
  ret void, !dbg !189
}

; Function Attrs: norecurse nounwind readonly
define internal fastcc zeroext i16 @hash_to_fingerprint(i16 zeroext %key) unnamed_addr #5 !dbg !190 {
entry:
  %key.addr = alloca i16, align 2
  call void @llvm.dbg.value(metadata i16 %key, metadata !194, metadata !DIExpression()), !dbg !195
  store i16 %key, i16* %key.addr, align 2, !tbaa !126
  %0 = bitcast i16* %key.addr to i8*, !dbg !196
  %call = call fastcc zeroext i16 @djb_hash(i8* nonnull %0), !dbg !197
  ret i16 %call, !dbg !198
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_1() local_unnamed_addr #4 !dbg !199 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200, !tbaa !113
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !200
  %1 = load i16, i16* %key, align 2, !dbg !200, !tbaa !176
  %call = tail call fastcc zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !201
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !202
  store i16 %call, i16* %index1, align 2, !dbg !203, !tbaa !204
  ret void, !dbg !205
}

; Function Attrs: norecurse nounwind readonly
define internal fastcc zeroext i16 @hash_to_index(i16 zeroext %fp) unnamed_addr #5 !dbg !206 {
entry:
  %fp.addr = alloca i16, align 2
  call void @llvm.dbg.value(metadata i16 %fp, metadata !211, metadata !DIExpression()), !dbg !214
  store i16 %fp, i16* %fp.addr, align 2, !tbaa !126
  %0 = bitcast i16* %fp.addr to i8*, !dbg !215
  %call = call fastcc zeroext i16 @djb_hash(i8* nonnull %0), !dbg !216
  call void @llvm.dbg.value(metadata i16 %call, metadata !212, metadata !DIExpression()), !dbg !214
  %and = and i16 %call, 127, !dbg !217
  ret i16 %and, !dbg !218
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_calc_indexes_index_2() local_unnamed_addr #4 !dbg !219 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !222, !tbaa !113
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !222
  %1 = load i16, i16* %fingerprint, align 2, !dbg !222, !tbaa !188
  %call = tail call fastcc zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !223
  call void @llvm.dbg.value(metadata i16 %call, metadata !221, metadata !DIExpression()), !dbg !224
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !225
  %2 = load i16, i16* %index1, align 2, !dbg !225, !tbaa !204
  %xor = xor i16 %2, %call, !dbg !226
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !227
  store i16 %xor, i16* %index2, align 2, !dbg !228, !tbaa !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind
define dso_local void @task_add() local_unnamed_addr #6 !dbg !231 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !239, !tbaa !113
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !240
  %1 = load i16, i16* %index1, align 2, !dbg !240, !tbaa !204
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !239
  %2 = load i16, i16* %arrayidx, align 2, !dbg !239, !tbaa !126
  %tobool = icmp eq i16 %2, 0, !dbg !239
  br i1 %tobool, label %if.then, label %if.else, !dbg !241

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !242
  store i8 1, i8* %success, align 2, !dbg !244, !tbaa !245
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !246
  %3 = load i16, i16* %fingerprint, align 2, !dbg !246, !tbaa !188
  store i16 %3, i16* %arrayidx, align 2, !dbg !247, !tbaa !126
  br label %if.end53, !dbg !248

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !249
  %4 = load i16, i16* %index2, align 2, !dbg !249, !tbaa !229
  %arrayidx12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !250
  %5 = load i16, i16* %arrayidx12, align 2, !dbg !250, !tbaa !126
  %tobool13 = icmp eq i16 %5, 0, !dbg !250
  br i1 %tobool13, label %if.then14, label %if.else24, !dbg !251

if.then14:                                        ; preds = %if.else
  %success16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !252
  store i8 1, i8* %success16, align 2, !dbg !254, !tbaa !245
  %fingerprint18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !255
  %6 = load i16, i16* %fingerprint18, align 2, !dbg !255, !tbaa !188
  store i16 %6, i16* %arrayidx12, align 2, !dbg !256, !tbaa !126
  br label %if.end53, !dbg !257

if.else24:                                        ; preds = %if.else
  %call = tail call i16 @rand() #12, !dbg !258
  %7 = and i16 %call, 1, !dbg !260
  %tobool25 = icmp eq i16 %7, 0, !dbg !260
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !261, !tbaa !113
  %index128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 3, !dbg !262
  %index236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 4, !dbg !262
  %.pn.in = select i1 %tobool25, i16* %index236, i16* %index128, !dbg !262
  %.pn = load i16, i16* %.pn.in, align 2, !dbg !261, !tbaa !126
  %fp_victim.0.in = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 0, i16 %.pn, !dbg !261
  %fp_victim.0 = load i16, i16* %fp_victim.0.in, align 2, !dbg !261, !tbaa !126
  call void @llvm.dbg.value(metadata i16 %.pn, metadata !238, metadata !DIExpression()), !dbg !263
  call void @llvm.dbg.value(metadata i16 %fp_victim.0, metadata !233, metadata !DIExpression()), !dbg !263
  %fingerprint43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 2, !dbg !264
  %9 = load i16, i16* %fingerprint43, align 2, !dbg !264, !tbaa !188
  store i16 %9, i16* %fp_victim.0.in, align 2, !dbg !265, !tbaa !126
  %index148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 3, !dbg !266
  store i16 %.pn, i16* %index148, align 2, !dbg !267, !tbaa !204
  store i16 %fp_victim.0, i16* %fingerprint43, align 2, !dbg !268, !tbaa !188
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 5, !dbg !269
  store i16 0, i16* %relocation_count, align 2, !dbg !270, !tbaa !271
  br label %if.end53

if.end53:                                         ; preds = %if.then14, %if.else24, %if.then
  ret void, !dbg !272
}

declare dso_local i16 @rand() local_unnamed_addr #2

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_relocate() local_unnamed_addr #4 !dbg !273 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278, !tbaa !113
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !278
  %1 = load i16, i16* %fingerprint, align 2, !dbg !278, !tbaa !188
  call void @llvm.dbg.value(metadata i16 %1, metadata !275, metadata !DIExpression()), !dbg !279
  %call = tail call fastcc zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !280
  call void @llvm.dbg.value(metadata i16 %call, metadata !276, metadata !DIExpression()), !dbg !279
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !281
  %2 = load i16, i16* %index1, align 2, !dbg !281, !tbaa !204
  %xor = xor i16 %2, %call, !dbg !282
  call void @llvm.dbg.value(metadata i16 %xor, metadata !277, metadata !DIExpression()), !dbg !279
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %xor, !dbg !283
  %3 = load i16, i16* %arrayidx, align 2, !dbg !283, !tbaa !126
  %tobool = icmp eq i16 %3, 0, !dbg !283
  br i1 %tobool, label %if.then, label %if.end, !dbg !285

if.then:                                          ; preds = %entry
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !286
  store i8 1, i8* %success, align 2, !dbg !288, !tbaa !245
  store i16 %1, i16* %arrayidx, align 2, !dbg !289, !tbaa !126
  br label %cleanup, !dbg !290

if.end:                                           ; preds = %entry
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 5, !dbg !291
  %4 = load i16, i16* %relocation_count, align 2, !dbg !291, !tbaa !271
  %cmp = icmp ugt i16 %4, 7, !dbg !293
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !294

if.then8:                                         ; preds = %if.end
  %success10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !295
  store i8 0, i8* %success10, align 2, !dbg !297, !tbaa !245
  br label %cleanup, !dbg !298

if.end11:                                         ; preds = %if.end
  %inc = add nuw nsw i16 %4, 1, !dbg !299
  store i16 %inc, i16* %relocation_count, align 2, !dbg !299, !tbaa !271
  store i16 %xor, i16* %index1, align 2, !dbg !300, !tbaa !204
  %5 = load i16, i16* %arrayidx, align 2, !dbg !301, !tbaa !126
  store i16 %5, i16* %fingerprint, align 2, !dbg !302, !tbaa !188
  store i16 %1, i16* %arrayidx, align 2, !dbg !303, !tbaa !126
  br label %cleanup, !dbg !304

cleanup:                                          ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !304
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_insert_done() local_unnamed_addr #4 !dbg !305 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306, !tbaa !113
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 6, !dbg !306
  %1 = load i16, i16* %insert_count, align 2, !dbg !307, !tbaa !308
  %inc = add i16 %1, 1, !dbg !307
  store i16 %inc, i16* %insert_count, align 2, !dbg !307, !tbaa !308
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 10, !dbg !309
  %2 = load i8, i8* %success, align 2, !dbg !309, !tbaa !245, !range !310
  %3 = zext i8 %2 to i16, !dbg !309
  %inserted_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 7, !dbg !311
  %4 = load i16, i16* %inserted_count, align 2, !dbg !312, !tbaa !313
  %add = add i16 %4, %3, !dbg !312
  store i16 %add, i16* %inserted_count, align 2, !dbg !312, !tbaa !313
  %cmp = icmp ult i16 %inc, 32, !dbg !314
  br i1 %cmp, label %if.end, label %if.else, !dbg !316

if.else:                                          ; preds = %entry
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 1, !dbg !317
  store i16 1, i16* %key, align 2, !dbg !319, !tbaa !176
  br label %if.end

if.end:                                           ; preds = %entry, %if.else
  ret void, !dbg !320
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_search() local_unnamed_addr #4 !dbg !321 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !322, !tbaa !113
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 3, !dbg !324
  %1 = load i16, i16* %index1, align 2, !dbg !324, !tbaa !204
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %1, !dbg !322
  %2 = load i16, i16* %arrayidx, align 2, !dbg !322, !tbaa !126
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 2, !dbg !325
  %3 = load i16, i16* %fingerprint, align 2, !dbg !325, !tbaa !188
  %cmp = icmp eq i16 %2, %3, !dbg !326
  br i1 %cmp, label %if.then, label %if.else, !dbg !327

if.then:                                          ; preds = %entry
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !328
  store i8 1, i8* %member, align 1, !dbg !330, !tbaa !331
  br label %if.end17, !dbg !332

if.else:                                          ; preds = %entry
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 4, !dbg !333
  %4 = load i16, i16* %index2, align 2, !dbg !333, !tbaa !229
  %arrayidx7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 0, i16 %4, !dbg !336
  %5 = load i16, i16* %arrayidx7, align 2, !dbg !336, !tbaa !126
  %cmp10 = icmp eq i16 %5, %3, !dbg !337
  %member13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !338
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !339

if.then11:                                        ; preds = %if.else
  store i8 1, i8* %member13, align 1, !dbg !340, !tbaa !331
  br label %if.end17, !dbg !342

if.else14:                                        ; preds = %if.else
  store i8 0, i8* %member13, align 1, !dbg !343, !tbaa !331
  br label %if.end17

if.end17:                                         ; preds = %if.then11, %if.else14, %if.then
  ret void, !dbg !345
}

; Function Attrs: nofree noinline norecurse nounwind
define dso_local void @task_lookup_done() local_unnamed_addr #4 !dbg !346 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !347, !tbaa !113
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 8, !dbg !347
  %1 = load i16, i16* %lookup_count, align 2, !dbg !348, !tbaa !349
  %inc = add i16 %1, 1, !dbg !348
  store i16 %inc, i16* %lookup_count, align 2, !dbg !348, !tbaa !349
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 11, !dbg !350
  %2 = load i8, i8* %member, align 1, !dbg !350, !tbaa !331, !range !310
  %3 = zext i8 %2 to i16, !dbg !350
  %member_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, i32 9, !dbg !351
  %4 = load i16, i16* %member_count, align 2, !dbg !352, !tbaa !353
  %add = add i16 %4, %3, !dbg !352
  store i16 %add, i16* %member_count, align 2, !dbg !352, !tbaa !353
  ret void, !dbg !354
}

; Function Attrs: noinline noreturn nounwind
define dso_local void @task_done() local_unnamed_addr #7 !dbg !355 {
entry:
  %0 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !356, !tbaa !113
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %0, i16 zeroext 300, i16 zeroext -1) #12, !dbg !357
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358, !tbaa !113
  %crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 1, i32 12, !dbg !358
  store volatile i16 %call, i16* %crc, align 2, !dbg !359, !tbaa !360
  tail call void @exit(i16 0) #13, !dbg !361
  unreachable, !dbg !361
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #8

; Function Attrs: noinline norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #9 !dbg !362 {
entry:
  ret void, !dbg !363
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #10 !dbg !364 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !484, !tbaa !104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !485, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486, !tbaa !113
  tail call void @camel_init(), !dbg !487
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !488, !tbaa !113
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i16 0, i32 1, !dbg !488
  %1 = bitcast %struct.camel_global_t* %globals to i8*, !dbg !488
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !488, !tbaa !113
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i16 0, i32 1, !dbg !488
  %3 = bitcast %struct.camel_global_t* %globals1 to i8*, !dbg !488
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %1, i8* nonnull align 2 dereferenceable(278) %3, i16 278, i1 false), !dbg !488
  tail call void @task_init(), !dbg !489
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !490, !tbaa !113
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i16 0, i32 1, !dbg !491
  %5 = bitcast %struct.camel_global_t* %globals2 to i8*, !dbg !492
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !493, !tbaa !113
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 1, !dbg !494
  %7 = bitcast %struct.camel_global_t* %globals3 to i8*, !dbg !492
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %5, i8* nonnull align 2 dereferenceable(278) %7, i16 278, i1 false), !dbg !492
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !495, !tbaa !113
  %lookup_count414 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i16 0, i32 1, i32 8, !dbg !495
  %9 = load i16, i16* %lookup_count414, align 2, !dbg !495, !tbaa !349
  %cmp415 = icmp ult i16 %9, 32, !dbg !496
  br i1 %cmp415, label %while.body, label %while.end365, !dbg !497

while.body:                                       ; preds = %entry, %if.end364
  %10 = phi %struct.camel_buffer_t* [ %128, %if.end364 ], [ %8, %entry ]
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i16 0, i32 1, !dbg !495
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !498, !tbaa !113
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i16 0, i32 1, !dbg !498
  %12 = bitcast %struct.camel_global_t* %globals5 to i8*, !dbg !498
  %13 = bitcast %struct.camel_global_t* %globals4 to i8*, !dbg !498
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %12, i8* nonnull align 2 dereferenceable(278) %13, i16 278, i1 false), !dbg !498
  tail call void @task_generate_key(), !dbg !499
  %14 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !500, !tbaa !104
  %cmp7 = icmp eq i16 %14, 1, !dbg !500
  br i1 %cmp7, label %if.then, label %if.else, !dbg !501

if.then:                                          ; preds = %while.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !502, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !502, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !502
  %15 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !503, !srcloc !504
  call void @llvm.dbg.value(metadata i16 %15, metadata !369, metadata !DIExpression()), !dbg !505
  %16 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !506, !srcloc !507
  call void @llvm.dbg.value(metadata i16 %16, metadata !375, metadata !DIExpression()), !dbg !508
  br label %do.end, !dbg !502

if.else:                                          ; preds = %while.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !509, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !509, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !509
  %17 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !510, !srcloc !511
  call void @llvm.dbg.value(metadata i16 %17, metadata !377, metadata !DIExpression()), !dbg !512
  %18 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !513, !srcloc !514
  call void @llvm.dbg.value(metadata i16 %18, metadata !380, metadata !DIExpression()), !dbg !515
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink434 = phi i16 [ %16, %if.then ], [ %18, %if.else ]
  %.sink.in.in = phi i16 [ %15, %if.then ], [ %17, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !516
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !516
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !516
  %sub = sub i16 9214, %.sink434, !dbg !516
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #12, !dbg !516
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !516, !tbaa !126
  %19 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !516, !tbaa !113
  %call11 = tail call zeroext i16 @__fast_hw_crc(i8* %19, i16 zeroext 300, i16 zeroext %call) #12, !dbg !516
  store i16 %call11, i16* @tmp_stack_buf_crc, align 2, !dbg !516, !tbaa !126
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !516, !tbaa !113
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i16 0, i32 2, !dbg !516
  store i16 %call11, i16* %stack_and_buf_crc, align 2, !dbg !516, !tbaa !145
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !516, !tbaa !104
  %key = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i16 0, i32 1, i32 1, !dbg !517
  %21 = load i16, i16* %key, align 2, !dbg !517, !tbaa !176
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !517, !tbaa !113
  %key26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i16 0, i32 1, i32 1, !dbg !517
  store i16 %21, i16* %key26, align 2, !dbg !517, !tbaa !176
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i16 0, i32 1, !dbg !518
  %23 = bitcast %struct.camel_global_t* %globals27 to i8*, !dbg !518
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i16 0, i32 1, !dbg !518
  %24 = bitcast %struct.camel_global_t* %globals28 to i8*, !dbg !518
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %23, i8* nonnull align 2 dereferenceable(278) %24, i16 278, i1 false), !dbg !518
  tail call void @task_calc_indexes(), !dbg !519
  %25 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !520, !tbaa !104
  %cmp30 = icmp eq i16 %25, 1, !dbg !520
  br i1 %cmp30, label %if.then31, label %if.else44, !dbg !521

if.then31:                                        ; preds = %do.end
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !522, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !522, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !522
  %26 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !523, !srcloc !524
  call void @llvm.dbg.value(metadata i16 %26, metadata !382, metadata !DIExpression()), !dbg !525
  %27 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !526, !srcloc !527
  call void @llvm.dbg.value(metadata i16 %27, metadata !387, metadata !DIExpression()), !dbg !528
  br label %do.end58, !dbg !522

if.else44:                                        ; preds = %do.end
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !529, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !529, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !529
  %28 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !530, !srcloc !531
  call void @llvm.dbg.value(metadata i16 %28, metadata !389, metadata !DIExpression()), !dbg !532
  %29 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !533, !srcloc !534
  call void @llvm.dbg.value(metadata i16 %29, metadata !392, metadata !DIExpression()), !dbg !535
  br label %do.end58

do.end58:                                         ; preds = %if.then31, %if.else44
  %.sink436 = phi i16 [ %27, %if.then31 ], [ %29, %if.else44 ]
  %.sink435.in.in = phi i16 [ %26, %if.then31 ], [ %28, %if.else44 ]
  %storemerge402 = phi i16 [ 2, %if.then31 ], [ 1, %if.else44 ], !dbg !536
  %.sink435.in = add i16 %.sink435.in.in, 2, !dbg !536
  %.sink435 = inttoptr i16 %.sink435.in to i8*, !dbg !536
  %sub40 = sub i16 9214, %.sink436, !dbg !536
  %call41 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink435, i16 zeroext %sub40, i16 zeroext -1) #12, !dbg !536
  store i16 %call41, i16* @tmp_stack_crc, align 2, !dbg !536, !tbaa !126
  %30 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !536, !tbaa !113
  %call42 = tail call zeroext i16 @__fast_hw_crc(i8* %30, i16 zeroext 300, i16 zeroext %call41) #12, !dbg !536
  store i16 %call42, i16* @tmp_stack_buf_crc, align 2, !dbg !536, !tbaa !126
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !536, !tbaa !113
  %stack_and_buf_crc43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i16 0, i32 2, !dbg !536
  store i16 %call42, i16* %stack_and_buf_crc43, align 2, !dbg !536, !tbaa !145
  store i16 %storemerge402, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !536, !tbaa !104
  %fingerprint = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i16 0, i32 1, i32 2, !dbg !537
  %32 = load i16, i16* %fingerprint, align 2, !dbg !537, !tbaa !188
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !537, !tbaa !113
  %fingerprint61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i16 0, i32 1, i32 2, !dbg !537
  store i16 %32, i16* %fingerprint61, align 2, !dbg !537, !tbaa !188
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i16 0, i32 1, !dbg !538
  %34 = bitcast %struct.camel_global_t* %globals62 to i8*, !dbg !538
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i16 0, i32 1, !dbg !538
  %35 = bitcast %struct.camel_global_t* %globals63 to i8*, !dbg !538
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %34, i8* nonnull align 2 dereferenceable(278) %35, i16 278, i1 false), !dbg !538
  tail call void @task_calc_indexes_index_1(), !dbg !539
  %36 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !540, !tbaa !104
  %cmp65 = icmp eq i16 %36, 1, !dbg !540
  br i1 %cmp65, label %if.then66, label %if.else79, !dbg !541

if.then66:                                        ; preds = %do.end58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !542, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !542, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !542
  %37 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !543, !srcloc !544
  call void @llvm.dbg.value(metadata i16 %37, metadata !394, metadata !DIExpression()), !dbg !545
  %38 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !546, !srcloc !547
  call void @llvm.dbg.value(metadata i16 %38, metadata !399, metadata !DIExpression()), !dbg !548
  br label %do.end93, !dbg !542

if.else79:                                        ; preds = %do.end58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !549, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !549, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !549
  %39 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !550, !srcloc !551
  call void @llvm.dbg.value(metadata i16 %39, metadata !401, metadata !DIExpression()), !dbg !552
  %40 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !553, !srcloc !554
  call void @llvm.dbg.value(metadata i16 %40, metadata !404, metadata !DIExpression()), !dbg !555
  br label %do.end93

do.end93:                                         ; preds = %if.then66, %if.else79
  %.sink438 = phi i16 [ %38, %if.then66 ], [ %40, %if.else79 ]
  %.sink437.in.in = phi i16 [ %37, %if.then66 ], [ %39, %if.else79 ]
  %storemerge403 = phi i16 [ 2, %if.then66 ], [ 1, %if.else79 ], !dbg !556
  %.sink437.in = add i16 %.sink437.in.in, 2, !dbg !556
  %.sink437 = inttoptr i16 %.sink437.in to i8*, !dbg !556
  %sub75 = sub i16 9214, %.sink438, !dbg !556
  %call76 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink437, i16 zeroext %sub75, i16 zeroext -1) #12, !dbg !556
  store i16 %call76, i16* @tmp_stack_crc, align 2, !dbg !556, !tbaa !126
  %41 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !556, !tbaa !113
  %call77 = tail call zeroext i16 @__fast_hw_crc(i8* %41, i16 zeroext 300, i16 zeroext %call76) #12, !dbg !556
  store i16 %call77, i16* @tmp_stack_buf_crc, align 2, !dbg !556, !tbaa !126
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !556, !tbaa !113
  %stack_and_buf_crc78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i16 0, i32 2, !dbg !556
  store i16 %call77, i16* %stack_and_buf_crc78, align 2, !dbg !556, !tbaa !145
  store i16 %storemerge403, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !556, !tbaa !104
  %index1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i16 0, i32 1, i32 3, !dbg !557
  %43 = load i16, i16* %index1, align 2, !dbg !557, !tbaa !204
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !557, !tbaa !113
  %index196 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i16 0, i32 1, i32 3, !dbg !557
  store i16 %43, i16* %index196, align 2, !dbg !557, !tbaa !204
  %globals97 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i16 0, i32 1, !dbg !558
  %45 = bitcast %struct.camel_global_t* %globals97 to i8*, !dbg !558
  %globals98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i16 0, i32 1, !dbg !558
  %46 = bitcast %struct.camel_global_t* %globals98 to i8*, !dbg !558
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %45, i8* nonnull align 2 dereferenceable(278) %46, i16 278, i1 false), !dbg !558
  tail call void @task_calc_indexes_index_2(), !dbg !559
  %47 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !560, !tbaa !104
  %cmp100 = icmp eq i16 %47, 1, !dbg !560
  br i1 %cmp100, label %if.then101, label %if.else114, !dbg !561

if.then101:                                       ; preds = %do.end93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !562, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !562, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !562
  %48 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !563, !srcloc !564
  call void @llvm.dbg.value(metadata i16 %48, metadata !406, metadata !DIExpression()), !dbg !565
  %49 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !566, !srcloc !567
  call void @llvm.dbg.value(metadata i16 %49, metadata !411, metadata !DIExpression()), !dbg !568
  br label %do.end128, !dbg !562

if.else114:                                       ; preds = %do.end93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !569, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !569, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !569
  %50 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !570, !srcloc !571
  call void @llvm.dbg.value(metadata i16 %50, metadata !413, metadata !DIExpression()), !dbg !572
  %51 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !573, !srcloc !574
  call void @llvm.dbg.value(metadata i16 %51, metadata !416, metadata !DIExpression()), !dbg !575
  br label %do.end128

do.end128:                                        ; preds = %if.then101, %if.else114
  %.sink440 = phi i16 [ %49, %if.then101 ], [ %51, %if.else114 ]
  %.sink439.in.in = phi i16 [ %48, %if.then101 ], [ %50, %if.else114 ]
  %storemerge404 = phi i16 [ 2, %if.then101 ], [ 1, %if.else114 ], !dbg !576
  %.sink439.in = add i16 %.sink439.in.in, 2, !dbg !576
  %.sink439 = inttoptr i16 %.sink439.in to i8*, !dbg !576
  %sub110 = sub i16 9214, %.sink440, !dbg !576
  %call111 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink439, i16 zeroext %sub110, i16 zeroext -1) #12, !dbg !576
  store i16 %call111, i16* @tmp_stack_crc, align 2, !dbg !576, !tbaa !126
  %52 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !576, !tbaa !113
  %call112 = tail call zeroext i16 @__fast_hw_crc(i8* %52, i16 zeroext 300, i16 zeroext %call111) #12, !dbg !576
  store i16 %call112, i16* @tmp_stack_buf_crc, align 2, !dbg !576, !tbaa !126
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576, !tbaa !113
  %stack_and_buf_crc113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i16 0, i32 2, !dbg !576
  store i16 %call112, i16* %stack_and_buf_crc113, align 2, !dbg !576, !tbaa !145
  store i16 %storemerge404, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !576, !tbaa !104
  %index2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i16 0, i32 1, i32 4, !dbg !577
  %54 = load i16, i16* %index2, align 2, !dbg !577, !tbaa !229
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !577, !tbaa !113
  %index2131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i16 0, i32 1, i32 4, !dbg !577
  store i16 %54, i16* %index2131, align 2, !dbg !577, !tbaa !229
  %globals132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i16 0, i32 1, !dbg !578
  %insert_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i16 0, i32 1, i32 6, !dbg !578
  %56 = load i16, i16* %insert_count, align 2, !dbg !578, !tbaa !308
  %cmp133 = icmp ult i16 %56, 32, !dbg !579
  %globals135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i16 0, i32 1, !dbg !580
  %57 = bitcast %struct.camel_global_t* %globals135 to i8*, !dbg !580
  %58 = bitcast %struct.camel_global_t* %globals132 to i8*, !dbg !580
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %57, i8* nonnull align 2 dereferenceable(278) %58, i16 278, i1 false), !dbg !580
  br i1 %cmp133, label %if.then134, label %if.else285, !dbg !581

if.then134:                                       ; preds = %do.end128
  tail call void @task_add(), !dbg !582
  %59 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !583, !tbaa !104
  %cmp138 = icmp eq i16 %59, 1, !dbg !583
  br i1 %cmp138, label %if.then139, label %if.else152, !dbg !584

if.then139:                                       ; preds = %if.then134
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !585, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !585, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !585
  %60 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !586, !srcloc !587
  call void @llvm.dbg.value(metadata i16 %60, metadata !418, metadata !DIExpression()), !dbg !588
  %61 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !589, !srcloc !590
  call void @llvm.dbg.value(metadata i16 %61, metadata !425, metadata !DIExpression()), !dbg !591
  br label %do.end166, !dbg !585

if.else152:                                       ; preds = %if.then134
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !592, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !592, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !592
  %62 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !593, !srcloc !594
  call void @llvm.dbg.value(metadata i16 %62, metadata !427, metadata !DIExpression()), !dbg !595
  %63 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !596, !srcloc !597
  call void @llvm.dbg.value(metadata i16 %63, metadata !430, metadata !DIExpression()), !dbg !598
  br label %do.end166

do.end166:                                        ; preds = %if.then139, %if.else152
  %.sink442 = phi i16 [ %61, %if.then139 ], [ %63, %if.else152 ]
  %.sink441.in.in = phi i16 [ %60, %if.then139 ], [ %62, %if.else152 ]
  %storemerge407 = phi i16 [ 2, %if.then139 ], [ 1, %if.else152 ], !dbg !599
  %.sink441.in = add i16 %.sink441.in.in, 2, !dbg !599
  %.sink441 = inttoptr i16 %.sink441.in to i8*, !dbg !599
  %sub148 = sub i16 9214, %.sink442, !dbg !599
  %call149 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink441, i16 zeroext %sub148, i16 zeroext -1) #12, !dbg !599
  store i16 %call149, i16* @tmp_stack_crc, align 2, !dbg !599, !tbaa !126
  %64 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !599, !tbaa !113
  %call150 = tail call zeroext i16 @__fast_hw_crc(i8* %64, i16 zeroext 300, i16 zeroext %call149) #12, !dbg !599
  store i16 %call150, i16* @tmp_stack_buf_crc, align 2, !dbg !599, !tbaa !126
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !599, !tbaa !113
  %stack_and_buf_crc151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 2, !dbg !599
  store i16 %call150, i16* %stack_and_buf_crc151, align 2, !dbg !599, !tbaa !145
  store i16 %storemerge407, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !599, !tbaa !104
  %fingerprint168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 1, i32 2, !dbg !600
  %66 = load i16, i16* %fingerprint168, align 2, !dbg !600, !tbaa !188
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !600, !tbaa !113
  %fingerprint170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i16 0, i32 1, i32 2, !dbg !600
  store i16 %66, i16* %fingerprint170, align 2, !dbg !600, !tbaa !188
  %index1173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 1, i32 3, !dbg !601
  %68 = load i16, i16* %index1173, align 2, !dbg !601, !tbaa !204
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 1, i32 0, i16 %68, !dbg !602
  %69 = load i16, i16* %arrayidx, align 2, !dbg !602, !tbaa !126
  %tobool = icmp eq i16 %69, 0, !dbg !602
  br i1 %tobool, label %if.end240, label %land.lhs.true, !dbg !603

land.lhs.true:                                    ; preds = %do.end166
  %index2177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 1, i32 4, !dbg !604
  %70 = load i16, i16* %index2177, align 2, !dbg !604, !tbaa !229
  %arrayidx178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i16 0, i32 1, i32 0, i16 %70, !dbg !605
  %71 = load i16, i16* %arrayidx178, align 2, !dbg !605, !tbaa !126
  %tobool179 = icmp eq i16 %71, 0, !dbg !605
  br i1 %tobool179, label %if.end240, label %while.cond181.preheader, !dbg !606

while.cond181.preheader:                          ; preds = %land.lhs.true
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !607, !tbaa !113
  %success411 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i16 0, i32 1, i32 10, !dbg !607
  %73 = load i8, i8* %success411, align 2, !dbg !607, !tbaa !245, !range !310
  %cmp184412 = icmp eq i8 %73, 0, !dbg !608
  br i1 %cmp184412, label %land.rhs, label %if.end240, !dbg !609

land.rhs:                                         ; preds = %while.cond181.preheader, %do.end222
  %.pn = phi %struct.camel_buffer_t* [ %90, %do.end222 ], [ %72, %while.cond181.preheader ]
  %relocation_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.pn, i16 0, i32 1, i32 5, !dbg !610
  %74 = load i16, i16* %relocation_count, align 2, !dbg !610, !tbaa !271
  %cmp187 = icmp ult i16 %74, 8, !dbg !611
  br i1 %cmp187, label %while.body189, label %if.end240, !dbg !612

while.body189:                                    ; preds = %land.rhs
  %globals182413 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.pn, i16 0, i32 1, !dbg !607
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !613, !tbaa !113
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i16 0, i32 1, !dbg !613
  %76 = bitcast %struct.camel_global_t* %globals190 to i8*, !dbg !613
  %77 = bitcast %struct.camel_global_t* %globals182413 to i8*, !dbg !613
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %76, i8* nonnull align 2 dereferenceable(278) %77, i16 278, i1 false), !dbg !613
  tail call void @task_relocate(), !dbg !614
  %78 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !615, !tbaa !104
  %cmp193 = icmp eq i16 %78, 1, !dbg !615
  br i1 %cmp193, label %if.then195, label %if.else208, !dbg !616

if.then195:                                       ; preds = %while.body189
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !617, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !617, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !617
  %79 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !618, !srcloc !619
  call void @llvm.dbg.value(metadata i16 %79, metadata !432, metadata !DIExpression()), !dbg !620
  %80 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !621, !srcloc !622
  call void @llvm.dbg.value(metadata i16 %80, metadata !440, metadata !DIExpression()), !dbg !623
  br label %do.end222, !dbg !617

if.else208:                                       ; preds = %while.body189
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !624, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !624, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !624
  %81 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !625, !srcloc !626
  call void @llvm.dbg.value(metadata i16 %81, metadata !442, metadata !DIExpression()), !dbg !627
  %82 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !628, !srcloc !629
  call void @llvm.dbg.value(metadata i16 %82, metadata !445, metadata !DIExpression()), !dbg !630
  br label %do.end222

do.end222:                                        ; preds = %if.then195, %if.else208
  %.sink444 = phi i16 [ %80, %if.then195 ], [ %82, %if.else208 ]
  %.sink443.in.in = phi i16 [ %79, %if.then195 ], [ %81, %if.else208 ]
  %storemerge409 = phi i16 [ 2, %if.then195 ], [ 1, %if.else208 ], !dbg !631
  %.sink443.in = add i16 %.sink443.in.in, 2, !dbg !631
  %.sink443 = inttoptr i16 %.sink443.in to i8*, !dbg !631
  %sub204 = sub i16 9214, %.sink444, !dbg !631
  %call205 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink443, i16 zeroext %sub204, i16 zeroext -1) #12, !dbg !631
  store i16 %call205, i16* @tmp_stack_crc, align 2, !dbg !631, !tbaa !126
  %83 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !631, !tbaa !113
  %call206 = tail call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext 300, i16 zeroext %call205) #12, !dbg !631
  store i16 %call206, i16* @tmp_stack_buf_crc, align 2, !dbg !631, !tbaa !126
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !631, !tbaa !113
  %stack_and_buf_crc207 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i16 0, i32 2, !dbg !631
  store i16 %call206, i16* %stack_and_buf_crc207, align 2, !dbg !631, !tbaa !145
  store i16 %storemerge409, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !631, !tbaa !104
  %success224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i16 0, i32 1, i32 10, !dbg !632
  %85 = load i8, i8* %success224, align 2, !dbg !632, !tbaa !245, !range !310
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !632, !tbaa !113
  %success227 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i16 0, i32 1, i32 10, !dbg !632
  store i8 %85, i8* %success227, align 2, !dbg !632, !tbaa !245
  %relocation_count229 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i16 0, i32 1, i32 5, !dbg !632
  %87 = load i16, i16* %relocation_count229, align 2, !dbg !632, !tbaa !271
  %relocation_count231 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i16 0, i32 1, i32 5, !dbg !632
  store i16 %87, i16* %relocation_count231, align 2, !dbg !632, !tbaa !271
  %index1233 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i16 0, i32 1, i32 3, !dbg !632
  %88 = load i16, i16* %index1233, align 2, !dbg !632, !tbaa !204
  %index1235 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i16 0, i32 1, i32 3, !dbg !632
  store i16 %88, i16* %index1235, align 2, !dbg !632, !tbaa !204
  %fingerprint237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i16 0, i32 1, i32 2, !dbg !632
  %89 = load i16, i16* %fingerprint237, align 2, !dbg !632, !tbaa !188
  %fingerprint239 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i16 0, i32 1, i32 2, !dbg !632
  store i16 %89, i16* %fingerprint239, align 2, !dbg !632, !tbaa !188
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !607, !tbaa !113
  %success = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i16 0, i32 1, i32 10, !dbg !607
  %91 = load i8, i8* %success, align 2, !dbg !607, !tbaa !245, !range !310
  %cmp184 = icmp eq i8 %91, 0, !dbg !608
  br i1 %cmp184, label %land.rhs, label %if.end240, !dbg !609, !llvm.loop !633

if.end240:                                        ; preds = %do.end222, %land.rhs, %while.cond181.preheader, %land.lhs.true, %do.end166
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !635, !tbaa !113
  %globals241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %92, i16 0, i32 1, !dbg !635
  %93 = bitcast %struct.camel_global_t* %globals241 to i8*, !dbg !635
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635, !tbaa !113
  %globals242 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %94, i16 0, i32 1, !dbg !635
  %95 = bitcast %struct.camel_global_t* %globals242 to i8*, !dbg !635
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %93, i8* nonnull align 2 dereferenceable(278) %95, i16 278, i1 false), !dbg !635
  tail call void @task_insert_done(), !dbg !636
  %96 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !637, !tbaa !104
  %cmp244 = icmp eq i16 %96, 1, !dbg !637
  br i1 %cmp244, label %if.then246, label %if.else259, !dbg !638

if.then246:                                       ; preds = %if.end240
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !639, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !639, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !639
  %97 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !640, !srcloc !641
  call void @llvm.dbg.value(metadata i16 %97, metadata !447, metadata !DIExpression()), !dbg !642
  %98 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !643, !srcloc !644
  call void @llvm.dbg.value(metadata i16 %98, metadata !452, metadata !DIExpression()), !dbg !645
  br label %do.end273, !dbg !639

if.else259:                                       ; preds = %if.end240
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !646, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !646, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !646
  %99 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !647, !srcloc !648
  call void @llvm.dbg.value(metadata i16 %99, metadata !454, metadata !DIExpression()), !dbg !649
  %100 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !650, !srcloc !651
  call void @llvm.dbg.value(metadata i16 %100, metadata !457, metadata !DIExpression()), !dbg !652
  br label %do.end273

do.end273:                                        ; preds = %if.then246, %if.else259
  %.sink446 = phi i16 [ %98, %if.then246 ], [ %100, %if.else259 ]
  %.sink445.in.in = phi i16 [ %97, %if.then246 ], [ %99, %if.else259 ]
  %storemerge408 = phi i16 [ 2, %if.then246 ], [ 1, %if.else259 ], !dbg !653
  %.sink445.in = add i16 %.sink445.in.in, 2, !dbg !653
  %.sink445 = inttoptr i16 %.sink445.in to i8*, !dbg !653
  %sub255 = sub i16 9214, %.sink446, !dbg !653
  %call256 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink445, i16 zeroext %sub255, i16 zeroext -1) #12, !dbg !653
  store i16 %call256, i16* @tmp_stack_crc, align 2, !dbg !653, !tbaa !126
  %101 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !653, !tbaa !113
  %call257 = tail call zeroext i16 @__fast_hw_crc(i8* %101, i16 zeroext 300, i16 zeroext %call256) #12, !dbg !653
  store i16 %call257, i16* @tmp_stack_buf_crc, align 2, !dbg !653, !tbaa !126
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !653, !tbaa !113
  %stack_and_buf_crc258 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i16 0, i32 2, !dbg !653
  store i16 %call257, i16* %stack_and_buf_crc258, align 2, !dbg !653, !tbaa !145
  store i16 %storemerge408, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !653, !tbaa !104
  %insert_count275 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i16 0, i32 1, i32 6, !dbg !654
  %103 = load i16, i16* %insert_count275, align 2, !dbg !654, !tbaa !308
  %104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !654, !tbaa !113
  %insert_count277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %104, i16 0, i32 1, i32 6, !dbg !654
  store i16 %103, i16* %insert_count277, align 2, !dbg !654, !tbaa !308
  %inserted_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i16 0, i32 1, i32 7, !dbg !654
  %105 = load i16, i16* %inserted_count, align 2, !dbg !654, !tbaa !313
  %inserted_count280 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %104, i16 0, i32 1, i32 7, !dbg !654
  store i16 %105, i16* %inserted_count280, align 2, !dbg !654, !tbaa !313
  %key282 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i16 0, i32 1, i32 1, !dbg !654
  %106 = load i16, i16* %key282, align 2, !dbg !654, !tbaa !176
  %key284 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %104, i16 0, i32 1, i32 1, !dbg !654
  store i16 %106, i16* %key284, align 2, !dbg !654, !tbaa !176
  br label %if.end364, !dbg !655

if.else285:                                       ; preds = %do.end128
  tail call void @task_lookup_search(), !dbg !656
  %107 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !657, !tbaa !104
  %cmp289 = icmp eq i16 %107, 1, !dbg !657
  br i1 %cmp289, label %if.then291, label %if.else304, !dbg !658

if.then291:                                       ; preds = %if.else285
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !659, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !659, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !659
  %108 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !660, !srcloc !661
  call void @llvm.dbg.value(metadata i16 %108, metadata !459, metadata !DIExpression()), !dbg !662
  %109 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !663, !srcloc !664
  call void @llvm.dbg.value(metadata i16 %109, metadata !465, metadata !DIExpression()), !dbg !665
  br label %do.end318, !dbg !659

if.else304:                                       ; preds = %if.else285
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !666, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !666, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !666
  %110 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !667, !srcloc !668
  call void @llvm.dbg.value(metadata i16 %110, metadata !467, metadata !DIExpression()), !dbg !669
  %111 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !670, !srcloc !671
  call void @llvm.dbg.value(metadata i16 %111, metadata !470, metadata !DIExpression()), !dbg !672
  br label %do.end318

do.end318:                                        ; preds = %if.then291, %if.else304
  %.sink448 = phi i16 [ %109, %if.then291 ], [ %111, %if.else304 ]
  %.sink447.in.in = phi i16 [ %108, %if.then291 ], [ %110, %if.else304 ]
  %storemerge405 = phi i16 [ 2, %if.then291 ], [ 1, %if.else304 ], !dbg !673
  %.sink447.in = add i16 %.sink447.in.in, 2, !dbg !673
  %.sink447 = inttoptr i16 %.sink447.in to i8*, !dbg !673
  %sub300 = sub i16 9214, %.sink448, !dbg !673
  %call301 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink447, i16 zeroext %sub300, i16 zeroext -1) #12, !dbg !673
  store i16 %call301, i16* @tmp_stack_crc, align 2, !dbg !673, !tbaa !126
  %112 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !673, !tbaa !113
  %call302 = tail call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext 300, i16 zeroext %call301) #12, !dbg !673
  store i16 %call302, i16* @tmp_stack_buf_crc, align 2, !dbg !673, !tbaa !126
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673, !tbaa !113
  %stack_and_buf_crc303 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i16 0, i32 2, !dbg !673
  store i16 %call302, i16* %stack_and_buf_crc303, align 2, !dbg !673, !tbaa !145
  store i16 %storemerge405, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !673, !tbaa !104
  %member = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i16 0, i32 1, i32 11, !dbg !674
  %114 = load i8, i8* %member, align 1, !dbg !674, !tbaa !331, !range !310
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !674, !tbaa !113
  %member322 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i16 0, i32 1, i32 11, !dbg !674
  store i8 %114, i8* %member322, align 1, !dbg !674, !tbaa !331
  %globals324 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i16 0, i32 1, !dbg !675
  %116 = bitcast %struct.camel_global_t* %globals324 to i8*, !dbg !675
  %globals325 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i16 0, i32 1, !dbg !675
  %117 = bitcast %struct.camel_global_t* %globals325 to i8*, !dbg !675
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(278) %116, i8* nonnull align 2 dereferenceable(278) %117, i16 278, i1 false), !dbg !675
  tail call void @task_lookup_done(), !dbg !676
  %118 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !677, !tbaa !104
  %cmp327 = icmp eq i16 %118, 1, !dbg !677
  br i1 %cmp327, label %if.then329, label %if.else342, !dbg !678

if.then329:                                       ; preds = %do.end318
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !679, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !679, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #12, !dbg !679
  %119 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !680, !srcloc !681
  call void @llvm.dbg.value(metadata i16 %119, metadata !472, metadata !DIExpression()), !dbg !682
  %120 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !683, !srcloc !684
  call void @llvm.dbg.value(metadata i16 %120, metadata !477, metadata !DIExpression()), !dbg !685
  br label %do.end356, !dbg !679

if.else342:                                       ; preds = %do.end318
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !686, !tbaa !113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !686, !tbaa !113
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #12, !dbg !686
  %121 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !687, !srcloc !688
  call void @llvm.dbg.value(metadata i16 %121, metadata !479, metadata !DIExpression()), !dbg !689
  %122 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #12, !dbg !690, !srcloc !691
  call void @llvm.dbg.value(metadata i16 %122, metadata !482, metadata !DIExpression()), !dbg !692
  br label %do.end356

do.end356:                                        ; preds = %if.then329, %if.else342
  %.sink450 = phi i16 [ %120, %if.then329 ], [ %122, %if.else342 ]
  %.sink449.in.in = phi i16 [ %119, %if.then329 ], [ %121, %if.else342 ]
  %storemerge406 = phi i16 [ 2, %if.then329 ], [ 1, %if.else342 ], !dbg !693
  %.sink449.in = add i16 %.sink449.in.in, 2, !dbg !693
  %.sink449 = inttoptr i16 %.sink449.in to i8*, !dbg !693
  %sub338 = sub i16 9214, %.sink450, !dbg !693
  %call339 = tail call zeroext i16 @__fast_hw_crc(i8* %.sink449, i16 zeroext %sub338, i16 zeroext -1) #12, !dbg !693
  store i16 %call339, i16* @tmp_stack_crc, align 2, !dbg !693, !tbaa !126
  %123 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !693, !tbaa !113
  %call340 = tail call zeroext i16 @__fast_hw_crc(i8* %123, i16 zeroext 300, i16 zeroext %call339) #12, !dbg !693
  store i16 %call340, i16* @tmp_stack_buf_crc, align 2, !dbg !693, !tbaa !126
  %124 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !693, !tbaa !113
  %stack_and_buf_crc341 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i16 0, i32 2, !dbg !693
  store i16 %call340, i16* %stack_and_buf_crc341, align 2, !dbg !693, !tbaa !145
  store i16 %storemerge406, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !693, !tbaa !104
  %lookup_count358 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i16 0, i32 1, i32 8, !dbg !694
  %125 = load i16, i16* %lookup_count358, align 2, !dbg !694, !tbaa !349
  %126 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !694, !tbaa !113
  %lookup_count360 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %126, i16 0, i32 1, i32 8, !dbg !694
  store i16 %125, i16* %lookup_count360, align 2, !dbg !694, !tbaa !349
  %member_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i16 0, i32 1, i32 9, !dbg !694
  %127 = load i16, i16* %member_count, align 2, !dbg !694, !tbaa !353
  %member_count363 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %126, i16 0, i32 1, i32 9, !dbg !694
  store i16 %127, i16* %member_count363, align 2, !dbg !694, !tbaa !353
  br label %if.end364

if.end364:                                        ; preds = %do.end356, %do.end273
  %128 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !495, !tbaa !113
  %lookup_count = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %128, i16 0, i32 1, i32 8, !dbg !495
  %129 = load i16, i16* %lookup_count, align 2, !dbg !495, !tbaa !349
  %cmp = icmp ult i16 %129, 32, !dbg !496
  br i1 %cmp, label %while.body, label %while.end365, !dbg !497, !llvm.loop !695

while.end365:                                     ; preds = %if.end364, %entry
  tail call void @task_done(), !dbg !697
  unreachable
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readonly
define internal fastcc zeroext i16 @djb_hash(i8* nocapture readonly %data) unnamed_addr #5 !dbg !698 {
entry:
  call void @llvm.dbg.value(metadata i8* %data, metadata !702, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i16 2, metadata !703, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i16 5381, metadata !704, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i16 0, metadata !705, metadata !DIExpression()), !dbg !706
  br label %for.body, !dbg !707

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i16 [ 0, %entry ], [ %inc, %for.body ]
  %hash.02 = phi i16 [ 5381, %entry ], [ %add1, %for.body ]
  %data.addr.01 = phi i8* [ %data, %entry ], [ %incdec.ptr, %for.body ]
  call void @llvm.dbg.value(metadata i16 %i.03, metadata !705, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i16 %hash.02, metadata !704, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i8* %data.addr.01, metadata !702, metadata !DIExpression()), !dbg !706
  %add = mul i16 %hash.02, 33, !dbg !709
  %0 = load i8, i8* %data.addr.01, align 1, !dbg !711, !tbaa !86
  %conv = zext i8 %0 to i16, !dbg !712
  %add1 = add i16 %add, %conv, !dbg !713
  %incdec.ptr = getelementptr inbounds i8, i8* %data.addr.01, i16 1, !dbg !714
  %inc = add nuw nsw i16 %i.03, 1, !dbg !715
  call void @llvm.dbg.value(metadata i16 %inc, metadata !705, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i16 %add1, metadata !704, metadata !DIExpression()), !dbg !706
  call void @llvm.dbg.value(metadata i8* %incdec.ptr, metadata !702, metadata !DIExpression()), !dbg !706
  %exitcond = icmp eq i16 %inc, 2, !dbg !716
  br i1 %exitcond, label %for.end, label %for.body, !dbg !707, !llvm.loop !717

for.end:                                          ; preds = %for.body
  call void @llvm.dbg.value(metadata i16 %add1, metadata !704, metadata !DIExpression()), !dbg !706
  ret i16 %add1, !dbg !719
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #11

attributes #0 = { nofree norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nofree noinline norecurse nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { norecurse nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind readnone speculatable willreturn }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }

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
!127 = !{i32 -2146584593}
!128 = !DILocation(line: 207, column: 33, scope: !99)
!129 = !{i32 -2146584357}
!130 = !DILocation(line: 0, scope: !99)
!131 = !DILocation(line: 207, column: 51, scope: !96)
!132 = !DILocation(line: 207, column: 33, scope: !96)
!133 = !DILocation(line: 207, column: 65, scope: !101)
!134 = !{i32 -2146584232}
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
!151 = !DILocation(line: 213, column: 4, scope: !149)
!152 = !DILocation(line: 214, column: 24, scope: !149)
!153 = !DILocation(line: 214, column: 4, scope: !149)
!154 = !DILocation(line: 215, column: 3, scope: !149)
!155 = !DILocation(line: 216, column: 4, scope: !156)
!156 = distinct !DILexicalBlock(scope: !143, file: !3, line: 215, column: 9)
!157 = !DILocation(line: 219, column: 1, scope: !96)
!158 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 265, type: !24, scopeLine: 266, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !159)
!159 = !{!160}
!160 = !DILocalVariable(name: "i", scope: !158, file: !3, line: 267, type: !6)
!161 = !DILocation(line: 0, scope: !158)
!162 = !DILocation(line: 268, column: 5, scope: !163)
!163 = distinct !DILexicalBlock(scope: !158, file: !3, line: 268, column: 5)
!164 = !DILocation(line: 269, column: 9, scope: !165)
!165 = distinct !DILexicalBlock(scope: !166, file: !3, line: 268, column: 40)
!166 = distinct !DILexicalBlock(scope: !163, file: !3, line: 268, column: 5)
!167 = !DILocation(line: 269, column: 23, scope: !165)
!168 = !DILocation(line: 268, column: 35, scope: !166)
!169 = !DILocation(line: 268, column: 19, scope: !166)
!170 = distinct !{!170, !162, !171}
!171 = !DILocation(line: 271, column: 5, scope: !163)
!172 = !DILocation(line: 272, column: 5, scope: !158)
!173 = !DILocation(line: 276, column: 5, scope: !158)
!174 = !DILocation(line: 273, column: 22, scope: !158)
!175 = !DILocation(line: 276, column: 13, scope: !158)
!176 = !{!107, !106, i64 278}
!177 = !DILocation(line: 277, column: 1, scope: !158)
!178 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 295, type: !24, scopeLine: 296, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!179 = !DILocation(line: 298, column: 16, scope: !178)
!180 = !DILocation(line: 298, column: 29, scope: !178)
!181 = !DILocation(line: 298, column: 13, scope: !178)
!182 = !DILocation(line: 299, column: 1, scope: !178)
!183 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 317, type: !24, scopeLine: 318, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!184 = !DILocation(line: 319, column: 43, scope: !183)
!185 = !DILocation(line: 319, column: 23, scope: !183)
!186 = !DILocation(line: 319, column: 5, scope: !183)
!187 = !DILocation(line: 319, column: 21, scope: !183)
!188 = !{!107, !106, i64 280}
!189 = !DILocation(line: 320, column: 1, scope: !183)
!190 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 244, type: !191, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !193)
!191 = !DISubroutineType(types: !192)
!192 = !{!47, !17}
!193 = !{!194}
!194 = !DILocalVariable(name: "key", arg: 1, scope: !190, file: !3, line: 244, type: !17)
!195 = !DILocation(line: 0, scope: !190)
!196 = !DILocation(line: 246, column: 21, scope: !190)
!197 = !DILocation(line: 246, column: 12, scope: !190)
!198 = !DILocation(line: 246, column: 5, scope: !190)
!199 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 338, type: !24, scopeLine: 339, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!200 = !DILocation(line: 340, column: 32, scope: !199)
!201 = !DILocation(line: 340, column: 18, scope: !199)
!202 = !DILocation(line: 340, column: 5, scope: !199)
!203 = !DILocation(line: 340, column: 16, scope: !199)
!204 = !{!107, !106, i64 282}
!205 = !DILocation(line: 341, column: 1, scope: !199)
!206 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 238, type: !207, scopeLine: 239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !210)
!207 = !DISubroutineType(types: !208)
!208 = !{!209, !47}
!209 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!210 = !{!211, !212}
!211 = !DILocalVariable(name: "fp", arg: 1, scope: !206, file: !3, line: 238, type: !47)
!212 = !DILocalVariable(name: "hash", scope: !206, file: !3, line: 240, type: !213)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!214 = !DILocation(line: 0, scope: !206)
!215 = !DILocation(line: 240, column: 28, scope: !206)
!216 = !DILocation(line: 240, column: 19, scope: !206)
!217 = !DILocation(line: 241, column: 17, scope: !206)
!218 = !DILocation(line: 241, column: 5, scope: !206)
!219 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 359, type: !24, scopeLine: 360, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !220)
!220 = !{!221}
!221 = !DILocalVariable(name: "fp_hash", scope: !219, file: !3, line: 361, type: !209)
!222 = !DILocation(line: 361, column: 37, scope: !219)
!223 = !DILocation(line: 361, column: 23, scope: !219)
!224 = !DILocation(line: 0, scope: !219)
!225 = !DILocation(line: 362, column: 18, scope: !219)
!226 = !DILocation(line: 362, column: 29, scope: !219)
!227 = !DILocation(line: 362, column: 5, scope: !219)
!228 = !DILocation(line: 362, column: 16, scope: !219)
!229 = !{!107, !106, i64 284}
!230 = !DILocation(line: 363, column: 1, scope: !219)
!231 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 381, type: !24, scopeLine: 382, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !232)
!232 = !{!233, !238}
!233 = !DILocalVariable(name: "fp_victim", scope: !234, file: !3, line: 391, type: !47)
!234 = distinct !DILexicalBlock(scope: !235, file: !3, line: 390, column: 16)
!235 = distinct !DILexicalBlock(scope: !236, file: !3, line: 387, column: 13)
!236 = distinct !DILexicalBlock(scope: !237, file: !3, line: 386, column: 12)
!237 = distinct !DILexicalBlock(scope: !231, file: !3, line: 383, column: 9)
!238 = !DILocalVariable(name: "index_victim", scope: !234, file: !3, line: 392, type: !209)
!239 = !DILocation(line: 383, column: 10, scope: !237)
!240 = !DILocation(line: 383, column: 21, scope: !237)
!241 = !DILocation(line: 383, column: 9, scope: !231)
!242 = !DILocation(line: 384, column: 9, scope: !243)
!243 = distinct !DILexicalBlock(scope: !237, file: !3, line: 383, column: 34)
!244 = !DILocation(line: 384, column: 21, scope: !243)
!245 = !{!107, !109, i64 296}
!246 = !DILocation(line: 385, column: 34, scope: !243)
!247 = !DILocation(line: 385, column: 32, scope: !243)
!248 = !DILocation(line: 386, column: 5, scope: !243)
!249 = !DILocation(line: 387, column: 25, scope: !235)
!250 = !DILocation(line: 387, column: 14, scope: !235)
!251 = !DILocation(line: 387, column: 13, scope: !236)
!252 = !DILocation(line: 388, column: 13, scope: !253)
!253 = distinct !DILexicalBlock(scope: !235, file: !3, line: 387, column: 38)
!254 = !DILocation(line: 388, column: 25, scope: !253)
!255 = !DILocation(line: 389, column: 38, scope: !253)
!256 = !DILocation(line: 389, column: 36, scope: !253)
!257 = !DILocation(line: 390, column: 9, scope: !253)
!258 = !DILocation(line: 393, column: 17, scope: !259)
!259 = distinct !DILexicalBlock(scope: !234, file: !3, line: 393, column: 17)
!260 = !DILocation(line: 393, column: 24, scope: !259)
!261 = !DILocation(line: 0, scope: !259)
!262 = !DILocation(line: 393, column: 17, scope: !234)
!263 = !DILocation(line: 0, scope: !234)
!264 = !DILocation(line: 402, column: 40, scope: !234)
!265 = !DILocation(line: 402, column: 38, scope: !234)
!266 = !DILocation(line: 403, column: 13, scope: !234)
!267 = !DILocation(line: 403, column: 24, scope: !234)
!268 = !DILocation(line: 404, column: 29, scope: !234)
!269 = !DILocation(line: 405, column: 13, scope: !234)
!270 = !DILocation(line: 405, column: 34, scope: !234)
!271 = !{!107, !106, i64 286}
!272 = !DILocation(line: 408, column: 1, scope: !231)
!273 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 426, type: !24, scopeLine: 427, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !274)
!274 = !{!275, !276, !277}
!275 = !DILocalVariable(name: "fp_victim", scope: !273, file: !3, line: 428, type: !47)
!276 = !DILocalVariable(name: "fp_hash_victim", scope: !273, file: !3, line: 429, type: !209)
!277 = !DILocalVariable(name: "index2_victim", scope: !273, file: !3, line: 430, type: !209)
!278 = !DILocation(line: 428, column: 31, scope: !273)
!279 = !DILocation(line: 0, scope: !273)
!280 = !DILocation(line: 429, column: 30, scope: !273)
!281 = !DILocation(line: 430, column: 29, scope: !273)
!282 = !DILocation(line: 430, column: 40, scope: !273)
!283 = !DILocation(line: 434, column: 14, scope: !284)
!284 = distinct !DILexicalBlock(scope: !273, file: !3, line: 434, column: 13)
!285 = !DILocation(line: 434, column: 13, scope: !273)
!286 = !DILocation(line: 435, column: 13, scope: !287)
!287 = distinct !DILexicalBlock(scope: !284, file: !3, line: 434, column: 41)
!288 = !DILocation(line: 435, column: 25, scope: !287)
!289 = !DILocation(line: 436, column: 39, scope: !287)
!290 = !DILocation(line: 437, column: 13, scope: !287)
!291 = !DILocation(line: 441, column: 13, scope: !292)
!292 = distinct !DILexicalBlock(scope: !273, file: !3, line: 441, column: 13)
!293 = !DILocation(line: 441, column: 34, scope: !292)
!294 = !DILocation(line: 441, column: 13, scope: !273)
!295 = !DILocation(line: 442, column: 13, scope: !296)
!296 = distinct !DILexicalBlock(scope: !292, file: !3, line: 441, column: 54)
!297 = !DILocation(line: 442, column: 25, scope: !296)
!298 = !DILocation(line: 443, column: 13, scope: !296)
!299 = !DILocation(line: 446, column: 9, scope: !273)
!300 = !DILocation(line: 447, column: 20, scope: !273)
!301 = !DILocation(line: 448, column: 27, scope: !273)
!302 = !DILocation(line: 448, column: 25, scope: !273)
!303 = !DILocation(line: 449, column: 35, scope: !273)
!304 = !DILocation(line: 450, column: 1, scope: !273)
!305 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 468, type: !24, scopeLine: 469, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!306 = !DILocation(line: 470, column: 7, scope: !305)
!307 = !DILocation(line: 470, column: 5, scope: !305)
!308 = !{!107, !106, i64 288}
!309 = !DILocation(line: 471, column: 27, scope: !305)
!310 = !{i8 0, i8 2}
!311 = !DILocation(line: 471, column: 5, scope: !305)
!312 = !DILocation(line: 471, column: 24, scope: !305)
!313 = !{!107, !106, i64 290}
!314 = !DILocation(line: 473, column: 26, scope: !315)
!315 = distinct !DILexicalBlock(scope: !305, file: !3, line: 473, column: 9)
!316 = !DILocation(line: 473, column: 9, scope: !305)
!317 = !DILocation(line: 475, column: 9, scope: !318)
!318 = distinct !DILexicalBlock(scope: !315, file: !3, line: 474, column: 12)
!319 = !DILocation(line: 475, column: 17, scope: !318)
!320 = !DILocation(line: 477, column: 1, scope: !305)
!321 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 495, type: !24, scopeLine: 496, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!322 = !DILocation(line: 497, column: 9, scope: !323)
!323 = distinct !DILexicalBlock(scope: !321, file: !3, line: 497, column: 9)
!324 = !DILocation(line: 497, column: 20, scope: !323)
!325 = !DILocation(line: 497, column: 35, scope: !323)
!326 = !DILocation(line: 497, column: 32, scope: !323)
!327 = !DILocation(line: 497, column: 9, scope: !321)
!328 = !DILocation(line: 498, column: 9, scope: !329)
!329 = distinct !DILexicalBlock(scope: !323, file: !3, line: 497, column: 52)
!330 = !DILocation(line: 498, column: 20, scope: !329)
!331 = !{!107, !109, i64 297}
!332 = !DILocation(line: 499, column: 5, scope: !329)
!333 = !DILocation(line: 500, column: 24, scope: !334)
!334 = distinct !DILexicalBlock(scope: !335, file: !3, line: 500, column: 13)
!335 = distinct !DILexicalBlock(scope: !323, file: !3, line: 499, column: 12)
!336 = !DILocation(line: 500, column: 13, scope: !334)
!337 = !DILocation(line: 500, column: 36, scope: !334)
!338 = !DILocation(line: 0, scope: !334)
!339 = !DILocation(line: 500, column: 13, scope: !335)
!340 = !DILocation(line: 501, column: 24, scope: !341)
!341 = distinct !DILexicalBlock(scope: !334, file: !3, line: 500, column: 56)
!342 = !DILocation(line: 502, column: 9, scope: !341)
!343 = !DILocation(line: 504, column: 24, scope: !344)
!344 = distinct !DILexicalBlock(scope: !334, file: !3, line: 503, column: 14)
!345 = !DILocation(line: 510, column: 1, scope: !321)
!346 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 528, type: !24, scopeLine: 529, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!347 = !DILocation(line: 530, column: 7, scope: !346)
!348 = !DILocation(line: 530, column: 5, scope: !346)
!349 = !{!107, !106, i64 292}
!350 = !DILocation(line: 532, column: 25, scope: !346)
!351 = !DILocation(line: 532, column: 5, scope: !346)
!352 = !DILocation(line: 532, column: 22, scope: !346)
!353 = !{!107, !106, i64 294}
!354 = !DILocation(line: 537, column: 1, scope: !346)
!355 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 539, type: !24, scopeLine: 540, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!356 = !DILocation(line: 542, column: 26, scope: !355)
!357 = !DILocation(line: 542, column: 12, scope: !355)
!358 = !DILocation(line: 542, column: 2, scope: !355)
!359 = !DILocation(line: 542, column: 10, scope: !355)
!360 = !{!107, !106, i64 298}
!361 = !DILocation(line: 543, column: 5, scope: !355)
!362 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 546, type: !24, scopeLine: 546, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!363 = !DILocation(line: 569, column: 1, scope: !362)
!364 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 571, type: !365, scopeLine: 571, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !368)
!365 = !DISubroutineType(types: !366)
!366 = !{!367}
!367 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!368 = !{!369, !375, !377, !380, !382, !387, !389, !392, !394, !399, !401, !404, !406, !411, !413, !416, !418, !425, !427, !430, !432, !440, !442, !445, !447, !452, !454, !457, !459, !465, !467, !470, !472, !477, !479, !482}
!369 = !DILocalVariable(name: "__x", scope: !370, file: !3, line: 594, type: !6)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 594, column: 9)
!371 = distinct !DILexicalBlock(scope: !372, file: !3, line: 594, column: 9)
!372 = distinct !DILexicalBlock(scope: !373, file: !3, line: 594, column: 9)
!373 = distinct !DILexicalBlock(scope: !374, file: !3, line: 594, column: 9)
!374 = distinct !DILexicalBlock(scope: !364, file: !3, line: 591, column: 42)
!375 = !DILocalVariable(name: "__x", scope: !376, file: !3, line: 594, type: !6)
!376 = distinct !DILexicalBlock(scope: !371, file: !3, line: 594, column: 9)
!377 = !DILocalVariable(name: "__x", scope: !378, file: !3, line: 594, type: !6)
!378 = distinct !DILexicalBlock(scope: !379, file: !3, line: 594, column: 9)
!379 = distinct !DILexicalBlock(scope: !372, file: !3, line: 594, column: 9)
!380 = !DILocalVariable(name: "__x", scope: !381, file: !3, line: 594, type: !6)
!381 = distinct !DILexicalBlock(scope: !379, file: !3, line: 594, column: 9)
!382 = !DILocalVariable(name: "__x", scope: !383, file: !3, line: 600, type: !6)
!383 = distinct !DILexicalBlock(scope: !384, file: !3, line: 600, column: 9)
!384 = distinct !DILexicalBlock(scope: !385, file: !3, line: 600, column: 9)
!385 = distinct !DILexicalBlock(scope: !386, file: !3, line: 600, column: 9)
!386 = distinct !DILexicalBlock(scope: !374, file: !3, line: 600, column: 9)
!387 = !DILocalVariable(name: "__x", scope: !388, file: !3, line: 600, type: !6)
!388 = distinct !DILexicalBlock(scope: !384, file: !3, line: 600, column: 9)
!389 = !DILocalVariable(name: "__x", scope: !390, file: !3, line: 600, type: !6)
!390 = distinct !DILexicalBlock(scope: !391, file: !3, line: 600, column: 9)
!391 = distinct !DILexicalBlock(scope: !385, file: !3, line: 600, column: 9)
!392 = !DILocalVariable(name: "__x", scope: !393, file: !3, line: 600, type: !6)
!393 = distinct !DILexicalBlock(scope: !391, file: !3, line: 600, column: 9)
!394 = !DILocalVariable(name: "__x", scope: !395, file: !3, line: 606, type: !6)
!395 = distinct !DILexicalBlock(scope: !396, file: !3, line: 606, column: 9)
!396 = distinct !DILexicalBlock(scope: !397, file: !3, line: 606, column: 9)
!397 = distinct !DILexicalBlock(scope: !398, file: !3, line: 606, column: 9)
!398 = distinct !DILexicalBlock(scope: !374, file: !3, line: 606, column: 9)
!399 = !DILocalVariable(name: "__x", scope: !400, file: !3, line: 606, type: !6)
!400 = distinct !DILexicalBlock(scope: !396, file: !3, line: 606, column: 9)
!401 = !DILocalVariable(name: "__x", scope: !402, file: !3, line: 606, type: !6)
!402 = distinct !DILexicalBlock(scope: !403, file: !3, line: 606, column: 9)
!403 = distinct !DILexicalBlock(scope: !397, file: !3, line: 606, column: 9)
!404 = !DILocalVariable(name: "__x", scope: !405, file: !3, line: 606, type: !6)
!405 = distinct !DILexicalBlock(scope: !403, file: !3, line: 606, column: 9)
!406 = !DILocalVariable(name: "__x", scope: !407, file: !3, line: 612, type: !6)
!407 = distinct !DILexicalBlock(scope: !408, file: !3, line: 612, column: 9)
!408 = distinct !DILexicalBlock(scope: !409, file: !3, line: 612, column: 9)
!409 = distinct !DILexicalBlock(scope: !410, file: !3, line: 612, column: 9)
!410 = distinct !DILexicalBlock(scope: !374, file: !3, line: 612, column: 9)
!411 = !DILocalVariable(name: "__x", scope: !412, file: !3, line: 612, type: !6)
!412 = distinct !DILexicalBlock(scope: !408, file: !3, line: 612, column: 9)
!413 = !DILocalVariable(name: "__x", scope: !414, file: !3, line: 612, type: !6)
!414 = distinct !DILexicalBlock(scope: !415, file: !3, line: 612, column: 9)
!415 = distinct !DILexicalBlock(scope: !409, file: !3, line: 612, column: 9)
!416 = !DILocalVariable(name: "__x", scope: !417, file: !3, line: 612, type: !6)
!417 = distinct !DILexicalBlock(scope: !415, file: !3, line: 612, column: 9)
!418 = !DILocalVariable(name: "__x", scope: !419, file: !3, line: 619, type: !6)
!419 = distinct !DILexicalBlock(scope: !420, file: !3, line: 619, column: 13)
!420 = distinct !DILexicalBlock(scope: !421, file: !3, line: 619, column: 13)
!421 = distinct !DILexicalBlock(scope: !422, file: !3, line: 619, column: 13)
!422 = distinct !DILexicalBlock(scope: !423, file: !3, line: 619, column: 13)
!423 = distinct !DILexicalBlock(scope: !424, file: !3, line: 616, column: 45)
!424 = distinct !DILexicalBlock(scope: !374, file: !3, line: 616, column: 12)
!425 = !DILocalVariable(name: "__x", scope: !426, file: !3, line: 619, type: !6)
!426 = distinct !DILexicalBlock(scope: !420, file: !3, line: 619, column: 13)
!427 = !DILocalVariable(name: "__x", scope: !428, file: !3, line: 619, type: !6)
!428 = distinct !DILexicalBlock(scope: !429, file: !3, line: 619, column: 13)
!429 = distinct !DILexicalBlock(scope: !421, file: !3, line: 619, column: 13)
!430 = !DILocalVariable(name: "__x", scope: !431, file: !3, line: 619, type: !6)
!431 = distinct !DILexicalBlock(scope: !429, file: !3, line: 619, column: 13)
!432 = !DILocalVariable(name: "__x", scope: !433, file: !3, line: 627, type: !6)
!433 = distinct !DILexicalBlock(scope: !434, file: !3, line: 627, column: 21)
!434 = distinct !DILexicalBlock(scope: !435, file: !3, line: 627, column: 21)
!435 = distinct !DILexicalBlock(scope: !436, file: !3, line: 627, column: 21)
!436 = distinct !DILexicalBlock(scope: !437, file: !3, line: 627, column: 21)
!437 = distinct !DILexicalBlock(scope: !438, file: !3, line: 624, column: 91)
!438 = distinct !DILexicalBlock(scope: !439, file: !3, line: 623, column: 70)
!439 = distinct !DILexicalBlock(scope: !423, file: !3, line: 623, column: 16)
!440 = !DILocalVariable(name: "__x", scope: !441, file: !3, line: 627, type: !6)
!441 = distinct !DILexicalBlock(scope: !434, file: !3, line: 627, column: 21)
!442 = !DILocalVariable(name: "__x", scope: !443, file: !3, line: 627, type: !6)
!443 = distinct !DILexicalBlock(scope: !444, file: !3, line: 627, column: 21)
!444 = distinct !DILexicalBlock(scope: !435, file: !3, line: 627, column: 21)
!445 = !DILocalVariable(name: "__x", scope: !446, file: !3, line: 627, type: !6)
!446 = distinct !DILexicalBlock(scope: !444, file: !3, line: 627, column: 21)
!447 = !DILocalVariable(name: "__x", scope: !448, file: !3, line: 635, type: !6)
!448 = distinct !DILexicalBlock(scope: !449, file: !3, line: 635, column: 13)
!449 = distinct !DILexicalBlock(scope: !450, file: !3, line: 635, column: 13)
!450 = distinct !DILexicalBlock(scope: !451, file: !3, line: 635, column: 13)
!451 = distinct !DILexicalBlock(scope: !423, file: !3, line: 635, column: 13)
!452 = !DILocalVariable(name: "__x", scope: !453, file: !3, line: 635, type: !6)
!453 = distinct !DILexicalBlock(scope: !449, file: !3, line: 635, column: 13)
!454 = !DILocalVariable(name: "__x", scope: !455, file: !3, line: 635, type: !6)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 635, column: 13)
!456 = distinct !DILexicalBlock(scope: !450, file: !3, line: 635, column: 13)
!457 = !DILocalVariable(name: "__x", scope: !458, file: !3, line: 635, type: !6)
!458 = distinct !DILexicalBlock(scope: !456, file: !3, line: 635, column: 13)
!459 = !DILocalVariable(name: "__x", scope: !460, file: !3, line: 641, type: !6)
!460 = distinct !DILexicalBlock(scope: !461, file: !3, line: 641, column: 13)
!461 = distinct !DILexicalBlock(scope: !462, file: !3, line: 641, column: 13)
!462 = distinct !DILexicalBlock(scope: !463, file: !3, line: 641, column: 13)
!463 = distinct !DILexicalBlock(scope: !464, file: !3, line: 641, column: 13)
!464 = distinct !DILexicalBlock(scope: !424, file: !3, line: 638, column: 16)
!465 = !DILocalVariable(name: "__x", scope: !466, file: !3, line: 641, type: !6)
!466 = distinct !DILexicalBlock(scope: !461, file: !3, line: 641, column: 13)
!467 = !DILocalVariable(name: "__x", scope: !468, file: !3, line: 641, type: !6)
!468 = distinct !DILexicalBlock(scope: !469, file: !3, line: 641, column: 13)
!469 = distinct !DILexicalBlock(scope: !462, file: !3, line: 641, column: 13)
!470 = !DILocalVariable(name: "__x", scope: !471, file: !3, line: 641, type: !6)
!471 = distinct !DILexicalBlock(scope: !469, file: !3, line: 641, column: 13)
!472 = !DILocalVariable(name: "__x", scope: !473, file: !3, line: 647, type: !6)
!473 = distinct !DILexicalBlock(scope: !474, file: !3, line: 647, column: 13)
!474 = distinct !DILexicalBlock(scope: !475, file: !3, line: 647, column: 13)
!475 = distinct !DILexicalBlock(scope: !476, file: !3, line: 647, column: 13)
!476 = distinct !DILexicalBlock(scope: !464, file: !3, line: 647, column: 13)
!477 = !DILocalVariable(name: "__x", scope: !478, file: !3, line: 647, type: !6)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 647, column: 13)
!479 = !DILocalVariable(name: "__x", scope: !480, file: !3, line: 647, type: !6)
!480 = distinct !DILexicalBlock(scope: !481, file: !3, line: 647, column: 13)
!481 = distinct !DILexicalBlock(scope: !475, file: !3, line: 647, column: 13)
!482 = !DILocalVariable(name: "__x", scope: !483, file: !3, line: 647, type: !6)
!483 = distinct !DILexicalBlock(scope: !481, file: !3, line: 647, column: 13)
!484 = !DILocation(line: 573, column: 16, scope: !364)
!485 = !DILocation(line: 574, column: 10, scope: !364)
!486 = !DILocation(line: 575, column: 12, scope: !364)
!487 = !DILocation(line: 576, column: 5, scope: !364)
!488 = !DILocation(line: 585, column: 5, scope: !364)
!489 = !DILocation(line: 586, column: 5, scope: !364)
!490 = !DILocation(line: 588, column: 14, scope: !364)
!491 = !DILocation(line: 588, column: 20, scope: !364)
!492 = !DILocation(line: 588, column: 5, scope: !364)
!493 = !DILocation(line: 588, column: 32, scope: !364)
!494 = !DILocation(line: 588, column: 40, scope: !364)
!495 = !DILocation(line: 591, column: 9, scope: !364)
!496 = !DILocation(line: 591, column: 27, scope: !364)
!497 = !DILocation(line: 591, column: 3, scope: !364)
!498 = !DILocation(line: 592, column: 9, scope: !374)
!499 = !DILocation(line: 593, column: 9, scope: !374)
!500 = !DILocation(line: 594, column: 9, scope: !372)
!501 = !DILocation(line: 594, column: 9, scope: !373)
!502 = !DILocation(line: 594, column: 9, scope: !371)
!503 = !DILocation(line: 594, column: 9, scope: !370)
!504 = !{i32 -2146579921}
!505 = !DILocation(line: 0, scope: !370)
!506 = !DILocation(line: 594, column: 9, scope: !376)
!507 = !{i32 -2146579796}
!508 = !DILocation(line: 0, scope: !376)
!509 = !DILocation(line: 594, column: 9, scope: !379)
!510 = !DILocation(line: 594, column: 9, scope: !378)
!511 = !{i32 -2146579664}
!512 = !DILocation(line: 0, scope: !378)
!513 = !DILocation(line: 594, column: 9, scope: !381)
!514 = !{i32 -2146579539}
!515 = !DILocation(line: 0, scope: !381)
!516 = !DILocation(line: 0, scope: !372)
!517 = !DILocation(line: 596, column: 9, scope: !374)
!518 = !DILocation(line: 598, column: 9, scope: !374)
!519 = !DILocation(line: 599, column: 9, scope: !374)
!520 = !DILocation(line: 600, column: 9, scope: !385)
!521 = !DILocation(line: 600, column: 9, scope: !386)
!522 = !DILocation(line: 600, column: 9, scope: !384)
!523 = !DILocation(line: 600, column: 9, scope: !383)
!524 = !{i32 -2146577293}
!525 = !DILocation(line: 0, scope: !383)
!526 = !DILocation(line: 600, column: 9, scope: !388)
!527 = !{i32 -2146577168}
!528 = !DILocation(line: 0, scope: !388)
!529 = !DILocation(line: 600, column: 9, scope: !391)
!530 = !DILocation(line: 600, column: 9, scope: !390)
!531 = !{i32 -2146577036}
!532 = !DILocation(line: 0, scope: !390)
!533 = !DILocation(line: 600, column: 9, scope: !393)
!534 = !{i32 -2146576911}
!535 = !DILocation(line: 0, scope: !393)
!536 = !DILocation(line: 0, scope: !385)
!537 = !DILocation(line: 602, column: 9, scope: !374)
!538 = !DILocation(line: 604, column: 9, scope: !374)
!539 = !DILocation(line: 605, column: 9, scope: !374)
!540 = !DILocation(line: 606, column: 9, scope: !397)
!541 = !DILocation(line: 606, column: 9, scope: !398)
!542 = !DILocation(line: 606, column: 9, scope: !396)
!543 = !DILocation(line: 606, column: 9, scope: !395)
!544 = !{i32 -2146574641}
!545 = !DILocation(line: 0, scope: !395)
!546 = !DILocation(line: 606, column: 9, scope: !400)
!547 = !{i32 -2146574516}
!548 = !DILocation(line: 0, scope: !400)
!549 = !DILocation(line: 606, column: 9, scope: !403)
!550 = !DILocation(line: 606, column: 9, scope: !402)
!551 = !{i32 -2146574384}
!552 = !DILocation(line: 0, scope: !402)
!553 = !DILocation(line: 606, column: 9, scope: !405)
!554 = !{i32 -2146574259}
!555 = !DILocation(line: 0, scope: !405)
!556 = !DILocation(line: 0, scope: !397)
!557 = !DILocation(line: 608, column: 9, scope: !374)
!558 = !DILocation(line: 610, column: 9, scope: !374)
!559 = !DILocation(line: 611, column: 9, scope: !374)
!560 = !DILocation(line: 612, column: 9, scope: !409)
!561 = !DILocation(line: 612, column: 9, scope: !410)
!562 = !DILocation(line: 612, column: 9, scope: !408)
!563 = !DILocation(line: 612, column: 9, scope: !407)
!564 = !{i32 -2146572004}
!565 = !DILocation(line: 0, scope: !407)
!566 = !DILocation(line: 612, column: 9, scope: !412)
!567 = !{i32 -2146571879}
!568 = !DILocation(line: 0, scope: !412)
!569 = !DILocation(line: 612, column: 9, scope: !415)
!570 = !DILocation(line: 612, column: 9, scope: !414)
!571 = !{i32 -2146571747}
!572 = !DILocation(line: 0, scope: !414)
!573 = !DILocation(line: 612, column: 9, scope: !417)
!574 = !{i32 -2146571622}
!575 = !DILocation(line: 0, scope: !417)
!576 = !DILocation(line: 0, scope: !409)
!577 = !DILocation(line: 614, column: 9, scope: !374)
!578 = !DILocation(line: 616, column: 12, scope: !424)
!579 = !DILocation(line: 616, column: 30, scope: !424)
!580 = !DILocation(line: 0, scope: !424)
!581 = !DILocation(line: 616, column: 12, scope: !374)
!582 = !DILocation(line: 618, column: 13, scope: !423)
!583 = !DILocation(line: 619, column: 13, scope: !421)
!584 = !DILocation(line: 619, column: 13, scope: !422)
!585 = !DILocation(line: 619, column: 13, scope: !420)
!586 = !DILocation(line: 619, column: 13, scope: !419)
!587 = !{i32 -2146569316}
!588 = !DILocation(line: 0, scope: !419)
!589 = !DILocation(line: 619, column: 13, scope: !426)
!590 = !{i32 -2146569191}
!591 = !DILocation(line: 0, scope: !426)
!592 = !DILocation(line: 619, column: 13, scope: !429)
!593 = !DILocation(line: 619, column: 13, scope: !428)
!594 = !{i32 -2146569059}
!595 = !DILocation(line: 0, scope: !428)
!596 = !DILocation(line: 619, column: 13, scope: !431)
!597 = !{i32 -2146568934}
!598 = !DILocation(line: 0, scope: !431)
!599 = !DILocation(line: 0, scope: !421)
!600 = !DILocation(line: 621, column: 13, scope: !423)
!601 = !DILocation(line: 623, column: 28, scope: !439)
!602 = !DILocation(line: 623, column: 16, scope: !439)
!603 = !DILocation(line: 623, column: 41, scope: !439)
!604 = !DILocation(line: 623, column: 56, scope: !439)
!605 = !DILocation(line: 623, column: 44, scope: !439)
!606 = !DILocation(line: 623, column: 16, scope: !423)
!607 = !DILocation(line: 624, column: 23, scope: !438)
!608 = !DILocation(line: 624, column: 36, scope: !438)
!609 = !DILocation(line: 624, column: 45, scope: !438)
!610 = !DILocation(line: 624, column: 49, scope: !438)
!611 = !DILocation(line: 624, column: 71, scope: !438)
!612 = !DILocation(line: 624, column: 17, scope: !438)
!613 = !DILocation(line: 625, column: 21, scope: !437)
!614 = !DILocation(line: 626, column: 21, scope: !437)
!615 = !DILocation(line: 627, column: 21, scope: !435)
!616 = !DILocation(line: 627, column: 21, scope: !436)
!617 = !DILocation(line: 627, column: 21, scope: !434)
!618 = !DILocation(line: 627, column: 21, scope: !433)
!619 = !{i32 -2146566511}
!620 = !DILocation(line: 0, scope: !433)
!621 = !DILocation(line: 627, column: 21, scope: !441)
!622 = !{i32 -2146566386}
!623 = !DILocation(line: 0, scope: !441)
!624 = !DILocation(line: 627, column: 21, scope: !444)
!625 = !DILocation(line: 627, column: 21, scope: !443)
!626 = !{i32 -2146566254}
!627 = !DILocation(line: 0, scope: !443)
!628 = !DILocation(line: 627, column: 21, scope: !446)
!629 = !{i32 -2146566129}
!630 = !DILocation(line: 0, scope: !446)
!631 = !DILocation(line: 0, scope: !435)
!632 = !DILocation(line: 629, column: 21, scope: !437)
!633 = distinct !{!633, !612, !634}
!634 = !DILocation(line: 630, column: 17, scope: !438)
!635 = !DILocation(line: 633, column: 13, scope: !423)
!636 = !DILocation(line: 634, column: 13, scope: !423)
!637 = !DILocation(line: 635, column: 13, scope: !450)
!638 = !DILocation(line: 635, column: 13, scope: !451)
!639 = !DILocation(line: 635, column: 13, scope: !449)
!640 = !DILocation(line: 635, column: 13, scope: !448)
!641 = !{i32 -2146563636}
!642 = !DILocation(line: 0, scope: !448)
!643 = !DILocation(line: 635, column: 13, scope: !453)
!644 = !{i32 -2146563511}
!645 = !DILocation(line: 0, scope: !453)
!646 = !DILocation(line: 635, column: 13, scope: !456)
!647 = !DILocation(line: 635, column: 13, scope: !455)
!648 = !{i32 -2146563379}
!649 = !DILocation(line: 0, scope: !455)
!650 = !DILocation(line: 635, column: 13, scope: !458)
!651 = !{i32 -2146563254}
!652 = !DILocation(line: 0, scope: !458)
!653 = !DILocation(line: 0, scope: !450)
!654 = !DILocation(line: 637, column: 13, scope: !423)
!655 = !DILocation(line: 638, column: 9, scope: !423)
!656 = !DILocation(line: 640, column: 13, scope: !464)
!657 = !DILocation(line: 641, column: 13, scope: !462)
!658 = !DILocation(line: 641, column: 13, scope: !463)
!659 = !DILocation(line: 641, column: 13, scope: !461)
!660 = !DILocation(line: 641, column: 13, scope: !460)
!661 = !{i32 -2146560840}
!662 = !DILocation(line: 0, scope: !460)
!663 = !DILocation(line: 641, column: 13, scope: !466)
!664 = !{i32 -2146560715}
!665 = !DILocation(line: 0, scope: !466)
!666 = !DILocation(line: 641, column: 13, scope: !469)
!667 = !DILocation(line: 641, column: 13, scope: !468)
!668 = !{i32 -2146560583}
!669 = !DILocation(line: 0, scope: !468)
!670 = !DILocation(line: 641, column: 13, scope: !471)
!671 = !{i32 -2146560458}
!672 = !DILocation(line: 0, scope: !471)
!673 = !DILocation(line: 0, scope: !462)
!674 = !DILocation(line: 643, column: 13, scope: !464)
!675 = !DILocation(line: 645, column: 13, scope: !464)
!676 = !DILocation(line: 646, column: 13, scope: !464)
!677 = !DILocation(line: 647, column: 13, scope: !475)
!678 = !DILocation(line: 647, column: 13, scope: !476)
!679 = !DILocation(line: 647, column: 13, scope: !474)
!680 = !DILocation(line: 647, column: 13, scope: !473)
!681 = !{i32 -2146558203}
!682 = !DILocation(line: 0, scope: !473)
!683 = !DILocation(line: 647, column: 13, scope: !478)
!684 = !{i32 -2146558078}
!685 = !DILocation(line: 0, scope: !478)
!686 = !DILocation(line: 647, column: 13, scope: !481)
!687 = !DILocation(line: 647, column: 13, scope: !480)
!688 = !{i32 -2146557946}
!689 = !DILocation(line: 0, scope: !480)
!690 = !DILocation(line: 647, column: 13, scope: !483)
!691 = !{i32 -2146557821}
!692 = !DILocation(line: 0, scope: !483)
!693 = !DILocation(line: 0, scope: !475)
!694 = !DILocation(line: 649, column: 13, scope: !464)
!695 = distinct !{!695, !497, !696}
!696 = !DILocation(line: 651, column: 5, scope: !364)
!697 = !DILocation(line: 653, column: 5, scope: !364)
!698 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 226, type: !699, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !701)
!699 = !DISubroutineType(types: !700)
!700 = !{!213, !7, !6}
!701 = !{!702, !703, !704, !705}
!702 = !DILocalVariable(name: "data", arg: 1, scope: !698, file: !3, line: 226, type: !7)
!703 = !DILocalVariable(name: "len", arg: 2, scope: !698, file: !3, line: 226, type: !6)
!704 = !DILocalVariable(name: "hash", scope: !698, file: !3, line: 228, type: !18)
!705 = !DILocalVariable(name: "i", scope: !698, file: !3, line: 229, type: !6)
!706 = !DILocation(line: 0, scope: !698)
!707 = !DILocation(line: 231, column: 5, scope: !708)
!708 = distinct !DILexicalBlock(scope: !698, file: !3, line: 231, column: 5)
!709 = !DILocation(line: 232, column: 29, scope: !710)
!710 = distinct !DILexicalBlock(scope: !708, file: !3, line: 231, column: 5)
!711 = !DILocation(line: 232, column: 40, scope: !710)
!712 = !DILocation(line: 232, column: 39, scope: !710)
!713 = !DILocation(line: 232, column: 37, scope: !710)
!714 = !DILocation(line: 231, column: 29, scope: !710)
!715 = !DILocation(line: 231, column: 34, scope: !710)
!716 = !DILocation(line: 231, column: 18, scope: !710)
!717 = distinct !{!717, !707, !718}
!718 = !DILocation(line: 232, column: 45, scope: !708)
!719 = !DILocation(line: 235, column: 5, scope: !698)
