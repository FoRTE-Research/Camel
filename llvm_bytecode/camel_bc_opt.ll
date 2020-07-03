; ModuleID = 'camel_bc_opt.bc'
source_filename = "../benchmarks/camel_bc.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, i16, i16, i16, i32, i16 }
%union.anon = type { i32 }

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
@safe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !28
@unsafe = common dso_local local_unnamed_addr global %struct.camel_buffer_t* null, align 2, !dbg !54
@tmp_stack_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !21
@tmp_stack_buf_crc = common dso_local local_unnamed_addr global i16 0, align 2, !dbg !26
@bits = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1, !dbg !59
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !16
@buf = common dso_local local_unnamed_addr global [11 x i16] zeroinitializer, align 2, !dbg !56
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nofree norecurse nounwind
define dso_local void @camel_init() local_unnamed_addr #0 !dbg !74 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !75, !tbaa !76
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !80, !tbaa !81
  %1 = or i8 %0, 1, !dbg !80
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !80, !tbaa !81
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !82, !tbaa !81
  %3 = and i8 %2, -2, !dbg !82
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !82, !tbaa !81
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !83, !tbaa !76
  %and4 = and i16 %4, -2, !dbg !83
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !83, !tbaa !76
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !84, !tbaa !81
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !85, !tbaa !76
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !86, !tbaa !76
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !87, !tbaa !76
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !88, !tbaa !81
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !89, !tbaa !76
  ret void, !dbg !90
}

; Function Attrs: nounwind
define dso_local void @camel_recover() #1 !dbg !91 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !97, !tbaa !99
  switch i16 %0, label %if.else3 [
    i16 1, label %if.then
    i16 2, label %if.then2
  ], !dbg !105

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !106, !tbaa !108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !110, !tbaa !108
  br label %if.end4, !dbg !111

if.then2:                                         ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !112, !tbaa !108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !115, !tbaa !108
  br label %if.end4, !dbg !116

if.else3:                                         ; preds = %entry
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #13, !dbg !117
  %.pre = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !119, !tbaa !108
  br label %if.end4

if.end4:                                          ; preds = %if.then2, %if.else3, %if.then
  %1 = phi %struct.camel_buffer_t* [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %if.then2 ], [ %.pre, %if.else3 ], [ getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %if.then ], !dbg !119
  %arrayidx = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i16 0, i32 0, i16 9, !dbg !119
  %2 = load i16, i16* %arrayidx, align 2, !dbg !119, !tbaa !121
  tail call void asm sideeffect "mov $0, SP", "ri"(i16 %2) #13, !dbg !119, !srcloc !122
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !123, !srcloc !124
  call void @llvm.dbg.value(metadata i16 %3, metadata !93, metadata !DIExpression()), !dbg !125
  %add = add i16 %3, 2, !dbg !126
  %4 = inttoptr i16 %add to i8*, !dbg !127
  %5 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !128, !srcloc !129
  call void @llvm.dbg.value(metadata i16 %5, metadata !95, metadata !DIExpression()), !dbg !130
  %sub = sub i16 9214, %5, !dbg !131
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %4, i16 zeroext %sub, i16 zeroext -1) #13, !dbg !132
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !133, !tbaa !121
  %6 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !134, !tbaa !108
  %call8 = tail call zeroext i16 @__fast_hw_crc(i8* %6, i16 zeroext 44, i16 zeroext %call) #13, !dbg !135
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !136, !tbaa !121
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !137, !tbaa !108
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i16 0, i32 2, !dbg !139
  %8 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !139, !tbaa !140
  %cmp9 = icmp eq i16 %call8, %8, !dbg !141
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !142

if.then10:                                        ; preds = %if.end4
  %9 = load i8*, i8** bitcast (%struct.camel_buffer_t** @unsafe to i8**), align 2, !dbg !143, !tbaa !108
  %10 = bitcast %struct.camel_buffer_t* %7 to i8*, !dbg !145
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(46) %9, i8* nonnull align 2 dereferenceable(46) %10, i16 46, i1 false), !dbg !145
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !146, !tbaa !76
  %11 = load volatile i8, i8* @PADIR_L, align 1, !dbg !148, !tbaa !81
  %12 = or i8 %11, 1, !dbg !148
  store volatile i8 %12, i8* @PADIR_L, align 1, !dbg !148, !tbaa !81
  %13 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !149, !tbaa !81
  %14 = and i8 %13, -2, !dbg !149
  store volatile i8 %14, i8* @PAOUT_L, align 1, !dbg !149, !tbaa !81
  %15 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !150, !tbaa !76
  %and4.i = and i16 %15, -2, !dbg !150
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !150, !tbaa !76
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !151, !tbaa !81
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !152, !tbaa !76
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !153, !tbaa !76
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !154, !tbaa !76
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !155, !tbaa !81
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !156, !tbaa !76
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !157, !tbaa !108
  %arraydecay = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i16 0, i32 0, i16 0, !dbg !157
  tail call void @__restore_registers(i16* %arraydecay) #13, !dbg !158
  br label %if.end13, !dbg !159

if.else12:                                        ; preds = %if.end4
  tail call void bitcast (void (...)* @__crt0_start to void ()*)() #13, !dbg !160
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !162
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
define dso_local void @commit() local_unnamed_addr #5 !dbg !163 {
entry:
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !177, !tbaa !99
  %cmp = icmp eq i16 %0, 1, !dbg !178
  br i1 %cmp, label %if.then, label %if.else, !dbg !179

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !180, !tbaa !108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !181, !tbaa !108
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2, i32 0, i16 0)) #13, !dbg !182
  %1 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !183, !srcloc !184
  call void @llvm.dbg.value(metadata i16 %1, metadata !165, metadata !DIExpression()), !dbg !185
  %2 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !186, !srcloc !187
  call void @llvm.dbg.value(metadata i16 %2, metadata !170, metadata !DIExpression()), !dbg !188
  br label %do.end, !dbg !189

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !190, !tbaa !108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !191, !tbaa !108
  tail call void @__dump_registers(i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1, i32 0, i16 0)) #13, !dbg !192
  %3 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !193, !srcloc !194
  call void @llvm.dbg.value(metadata i16 %3, metadata !172, metadata !DIExpression()), !dbg !195
  %4 = tail call i16 asm sideeffect "mov SP, $0", "=r"() #13, !dbg !196, !srcloc !197
  call void @llvm.dbg.value(metadata i16 %4, metadata !175, metadata !DIExpression()), !dbg !198
  br label %do.end

do.end:                                           ; preds = %if.then, %if.else
  %.sink7 = phi i16 [ %2, %if.then ], [ %4, %if.else ]
  %.sink.in.in = phi i16 [ %1, %if.then ], [ %3, %if.else ]
  %storemerge = phi i16 [ 2, %if.then ], [ 1, %if.else ], !dbg !199
  %.sink.in = add i16 %.sink.in.in, 2, !dbg !199
  %.sink = inttoptr i16 %.sink.in to i8*, !dbg !199
  %sub = sub i16 9214, %.sink7, !dbg !199
  %call = tail call zeroext i16 @__fast_hw_crc(i8* %.sink, i16 zeroext %sub, i16 zeroext -1) #13, !dbg !199
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !199, !tbaa !121
  %5 = load i8*, i8** bitcast (%struct.camel_buffer_t** @safe to i8**), align 2, !dbg !199, !tbaa !108
  %call4 = tail call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext 44, i16 zeroext %call) #13, !dbg !199
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !199, !tbaa !121
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !199, !tbaa !108
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i16 0, i32 2, !dbg !199
  store i16 %call4, i16* %stack_and_buf_crc, align 2, !dbg !199, !tbaa !140
  store i16 %storemerge, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !199, !tbaa !99
  ret void, !dbg !200
}

declare dso_local void @__dump_registers(i16*) local_unnamed_addr #2

; Function Attrs: naked noinline nounwind
define dso_local void @naked() #6 !dbg !201 {
entry:
  tail call void asm sideeffect "ret", ""() #13, !dbg !202, !srcloc !203
  unreachable, !dbg !204
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() local_unnamed_addr #7 !dbg !205 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !206, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !206
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !206
  store i16 0, i16* %func, align 2, !dbg !207, !tbaa !208
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !209, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !209
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !209
  store i16 0, i16* %n_0, align 2, !dbg !210, !tbaa !211
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !212, !tbaa !108
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !212
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 1, !dbg !212
  store i16 0, i16* %n_1, align 2, !dbg !213, !tbaa !214
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !215, !tbaa !108
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !215
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !215
  store i16 0, i16* %n_2, align 2, !dbg !216, !tbaa !217
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !218, !tbaa !108
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !218
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !218
  store i16 0, i16* %n_3, align 2, !dbg !219, !tbaa !220
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !221, !tbaa !108
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !221
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !221
  store i16 0, i16* %n_4, align 2, !dbg !222, !tbaa !223
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !224, !tbaa !108
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !224
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !224
  store i16 0, i16* %n_5, align 2, !dbg !225, !tbaa !226
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !227, !tbaa !108
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !227
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !227
  store i16 0, i16* %n_6, align 2, !dbg !228, !tbaa !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_select_func() local_unnamed_addr #7 !dbg !231 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !232
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !232
  store i32 4, i32* %seed, align 2, !dbg !233, !tbaa !234
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !235, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !235
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !235
  store i16 0, i16* %iter, align 2, !dbg !236, !tbaa !237
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !238, !tbaa !108
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !238
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !238
  %3 = load i16, i16* %func, align 2, !dbg !239, !tbaa !208
  %inc = add i16 %3, 1, !dbg !239
  store i16 %inc, i16* %func, align 2, !dbg !239, !tbaa !208
  ret void, !dbg !240
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_count() local_unnamed_addr #7 !dbg !241 {
entry:
  %tmp_seed = alloca i32, align 2
  %temp = alloca i16, align 2
  %0 = bitcast i32* %tmp_seed to i8*, !dbg !245
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13, !dbg !245
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !243, metadata !DIExpression()), !dbg !246
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !247
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !247
  %2 = load i32, i32* %seed, align 2, !dbg !247, !tbaa !234
  store i32 %2, i32* %tmp_seed, align 2, !dbg !246, !tbaa !248
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !249
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !249
  %4 = load i32, i32* %seed2, align 2, !dbg !249, !tbaa !234
  %add = add i32 %4, 13, !dbg !250
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251, !tbaa !108
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !251
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !251
  store i32 %add, i32* %seed4, align 2, !dbg !252, !tbaa !234
  %6 = bitcast i16* %temp to i8*, !dbg !253
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %6) #13, !dbg !253
  call void @llvm.dbg.declare(metadata i16* %temp, metadata !244, metadata !DIExpression()), !dbg !254
  store i16 0, i16* %temp, align 2, !dbg !254, !tbaa !76
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !255, !tbaa !248
  %tobool = icmp ne i32 %7, 0, !dbg !255
  br i1 %tobool, label %if.then, label %if.end, !dbg !257

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !258

do.body:                                          ; preds = %do.cond, %if.then
  %8 = load i16, i16* %temp, align 2, !dbg !259, !tbaa !76
  %inc = add i16 %8, 1, !dbg !259
  store i16 %inc, i16* %temp, align 2, !dbg !259, !tbaa !76
  br label %do.cond, !dbg !260

do.cond:                                          ; preds = %do.body
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !261, !tbaa !248
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !262, !tbaa !248
  %sub = sub i32 %10, 1, !dbg !263
  %and = and i32 %9, %sub, !dbg !264
  store i32 %and, i32* %tmp_seed, align 2, !dbg !265, !tbaa !248
  %cmp = icmp ne i32 0, %and, !dbg !266
  br i1 %cmp, label %do.body, label %do.end, !dbg !260, !llvm.loop !267

do.end:                                           ; preds = %do.cond
  br label %if.end, !dbg !260

if.end:                                           ; preds = %do.end, %entry
  %11 = load i16, i16* %temp, align 2, !dbg !269, !tbaa !76
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270, !tbaa !108
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !270
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !270
  %13 = load i16, i16* %n_0, align 2, !dbg !271, !tbaa !211
  %add6 = add i16 %13, %11, !dbg !271
  store i16 %add6, i16* %n_0, align 2, !dbg !271, !tbaa !211
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272, !tbaa !108
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !272
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !272
  %15 = load i16, i16* %iter, align 2, !dbg !273, !tbaa !237
  %inc8 = add i16 %15, 1, !dbg !273
  store i16 %inc8, i16* %iter, align 2, !dbg !273, !tbaa !237
  %16 = bitcast i16* %temp to i8*, !dbg !274
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %16) #13, !dbg !274
  %17 = bitcast i32* %tmp_seed to i8*, !dbg !274
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #13, !dbg !274
  ret void, !dbg !274
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bitcount() local_unnamed_addr #7 !dbg !275 {
entry:
  %tmp_seed = alloca i32, align 2
  %0 = bitcast i32* %tmp_seed to i8*, !dbg !278
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13, !dbg !278
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !277, metadata !DIExpression()), !dbg !279
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !280
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !280
  %2 = load i32, i32* %seed, align 2, !dbg !280, !tbaa !234
  store i32 %2, i32* %tmp_seed, align 2, !dbg !279, !tbaa !248
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !281
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !281
  %4 = load i32, i32* %seed2, align 2, !dbg !281, !tbaa !234
  %add = add i32 %4, 13, !dbg !282
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283, !tbaa !108
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !283
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !283
  store i32 %add, i32* %seed4, align 2, !dbg !284, !tbaa !234
  %6 = load i32, i32* %tmp_seed, align 2, !dbg !285, !tbaa !248
  %and = and i32 %6, -1431655766, !dbg !286
  %shr = lshr i32 %and, 1, !dbg !287
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !288, !tbaa !248
  %and5 = and i32 %7, 1431655765, !dbg !289
  %add6 = add i32 %shr, %and5, !dbg !290
  store i32 %add6, i32* %tmp_seed, align 2, !dbg !291, !tbaa !248
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !292, !tbaa !248
  %and7 = and i32 %8, -858993460, !dbg !293
  %shr8 = lshr i32 %and7, 2, !dbg !294
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !295, !tbaa !248
  %and9 = and i32 %9, 858993459, !dbg !296
  %add10 = add i32 %shr8, %and9, !dbg !297
  store i32 %add10, i32* %tmp_seed, align 2, !dbg !298, !tbaa !248
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !299, !tbaa !248
  %and11 = and i32 %10, -252645136, !dbg !300
  %shr12 = lshr i32 %and11, 4, !dbg !301
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !302, !tbaa !248
  %and13 = and i32 %11, 252645135, !dbg !303
  %add14 = add i32 %shr12, %and13, !dbg !304
  store i32 %add14, i32* %tmp_seed, align 2, !dbg !305, !tbaa !248
  %12 = load i32, i32* %tmp_seed, align 2, !dbg !306, !tbaa !248
  %and15 = and i32 %12, -16711936, !dbg !307
  %shr16 = lshr i32 %and15, 8, !dbg !308
  %13 = load i32, i32* %tmp_seed, align 2, !dbg !309, !tbaa !248
  %and17 = and i32 %13, 16711935, !dbg !310
  %add18 = add i32 %shr16, %and17, !dbg !311
  store i32 %add18, i32* %tmp_seed, align 2, !dbg !312, !tbaa !248
  %14 = load i32, i32* %tmp_seed, align 2, !dbg !313, !tbaa !248
  %and19 = and i32 %14, -65536, !dbg !314
  %shr20 = lshr i32 %and19, 16, !dbg !315
  %15 = load i32, i32* %tmp_seed, align 2, !dbg !316, !tbaa !248
  %and21 = and i32 %15, 65535, !dbg !317
  %add22 = add i32 %shr20, %and21, !dbg !318
  store i32 %add22, i32* %tmp_seed, align 2, !dbg !319, !tbaa !248
  %16 = load i32, i32* %tmp_seed, align 2, !dbg !320, !tbaa !248
  %conv = trunc i32 %16 to i16, !dbg !321
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !322, !tbaa !108
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !322
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 1, !dbg !322
  %18 = load i16, i16* %n_1, align 2, !dbg !323, !tbaa !214
  %add24 = add i16 %18, %conv, !dbg !323
  store i16 %add24, i16* %n_1, align 2, !dbg !323, !tbaa !214
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !324, !tbaa !108
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !324
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !324
  %20 = load i16, i16* %iter, align 2, !dbg !325, !tbaa !237
  %inc = add i16 %20, 1, !dbg !325
  store i16 %inc, i16* %iter, align 2, !dbg !325, !tbaa !237
  %21 = bitcast i32* %tmp_seed to i8*, !dbg !326
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #13, !dbg !326
  ret void, !dbg !326
}

; Function Attrs: nounwind readnone
define dso_local i16 @recursive_cnt(i32 %x) local_unnamed_addr #8 !dbg !327 {
entry:
  call void @llvm.dbg.value(metadata i32 %x, metadata !331, metadata !DIExpression()), !dbg !333
  %0 = trunc i32 %x to i16, !dbg !334
  %conv = and i16 %0, 15, !dbg !334
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !335
  %1 = load i8, i8* %arrayidx, align 1, !dbg !335, !tbaa !81
  %conv1 = sext i8 %1 to i16, !dbg !335
  call void @llvm.dbg.value(metadata i16 %conv1, metadata !332, metadata !DIExpression()), !dbg !333
  %shr = lshr i32 %x, 4, !dbg !336
  call void @llvm.dbg.value(metadata i32 %shr, metadata !331, metadata !DIExpression()), !dbg !333
  %cmp = icmp eq i32 %shr, 0, !dbg !338
  br i1 %cmp, label %if.end, label %if.then, !dbg !339

if.then:                                          ; preds = %entry
  %call = tail call i16 @recursive_cnt(i32 %shr), !dbg !340
  %add = add nsw i16 %call, %conv1, !dbg !341
  call void @llvm.dbg.value(metadata i16 %add, metadata !332, metadata !DIExpression()), !dbg !333
  ret i16 %add, !dbg !342

if.end:                                           ; preds = %entry
  call void @llvm.dbg.value(metadata i16 %conv1, metadata !332, metadata !DIExpression()), !dbg !333
  ret i16 %conv1, !dbg !342
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcnt() local_unnamed_addr #7 !dbg !343 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !344
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !344
  %1 = load i32, i32* %seed, align 2, !dbg !344, !tbaa !234
  %call = call i16 @recursive_cnt(i32 %1), !dbg !345
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !346
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !346
  %3 = load i16, i16* %n_2, align 2, !dbg !347, !tbaa !217
  %add = add i16 %3, %call, !dbg !347
  store i16 %add, i16* %n_2, align 2, !dbg !347, !tbaa !217
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !348, !tbaa !108
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !348
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !348
  %5 = load i32, i32* %seed3, align 2, !dbg !348, !tbaa !234
  %add4 = add i32 %5, 13, !dbg !349
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350, !tbaa !108
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !350
  %seed6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 8, !dbg !350
  store i32 %add4, i32* %seed6, align 2, !dbg !351, !tbaa !234
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !352, !tbaa !108
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !352
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !352
  %8 = load i16, i16* %iter, align 2, !dbg !353, !tbaa !237
  %inc = add i16 %8, 1, !dbg !353
  store i16 %inc, i16* %iter, align 2, !dbg !353, !tbaa !237
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcount() local_unnamed_addr #7 !dbg !355 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !356
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !356
  %1 = load i32, i32* %seed, align 2, !dbg !356, !tbaa !234
  %and = and i32 %1, 15, !dbg !357
  %conv = trunc i32 %and to i16, !dbg !358
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !359
  %2 = load i8, i8* %arrayidx, align 1, !dbg !359, !tbaa !81
  %conv1 = sext i8 %2 to i16, !dbg !359
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360, !tbaa !108
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !360
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !360
  %4 = load i32, i32* %seed3, align 2, !dbg !360, !tbaa !234
  %and4 = and i32 %4, 240, !dbg !361
  %shr = lshr i32 %and4, 4, !dbg !362
  %conv5 = trunc i32 %shr to i16, !dbg !363
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv5, !dbg !364
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !364, !tbaa !81
  %conv7 = sext i8 %5 to i16, !dbg !364
  %add = add nsw i16 %conv1, %conv7, !dbg !365
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366, !tbaa !108
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !366
  %seed9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !366
  %7 = load i32, i32* %seed9, align 2, !dbg !366, !tbaa !234
  %and10 = and i32 %7, 3840, !dbg !367
  %shr11 = lshr i32 %and10, 8, !dbg !368
  %conv12 = trunc i32 %shr11 to i16, !dbg !369
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv12, !dbg !370
  %8 = load i8, i8* %arrayidx13, align 1, !dbg !370, !tbaa !81
  %conv14 = sext i8 %8 to i16, !dbg !370
  %add15 = add nsw i16 %add, %conv14, !dbg !371
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372, !tbaa !108
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !372
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !372
  %10 = load i32, i32* %seed17, align 2, !dbg !372, !tbaa !234
  %and18 = and i32 %10, 61440, !dbg !373
  %shr19 = lshr i32 %and18, 12, !dbg !374
  %conv20 = trunc i32 %shr19 to i16, !dbg !375
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv20, !dbg !376
  %11 = load i8, i8* %arrayidx21, align 1, !dbg !376, !tbaa !81
  %conv22 = sext i8 %11 to i16, !dbg !376
  %add23 = add nsw i16 %add15, %conv22, !dbg !377
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378, !tbaa !108
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !378
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !378
  %13 = load i32, i32* %seed25, align 2, !dbg !378, !tbaa !234
  %and26 = and i32 %13, 983040, !dbg !379
  %shr27 = lshr i32 %and26, 16, !dbg !380
  %conv28 = trunc i32 %shr27 to i16, !dbg !381
  %arrayidx29 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv28, !dbg !382
  %14 = load i8, i8* %arrayidx29, align 1, !dbg !382, !tbaa !81
  %conv30 = sext i8 %14 to i16, !dbg !382
  %add31 = add nsw i16 %add23, %conv30, !dbg !383
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !384, !tbaa !108
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !384
  %seed33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 8, !dbg !384
  %16 = load i32, i32* %seed33, align 2, !dbg !384, !tbaa !234
  %and34 = and i32 %16, 15728640, !dbg !385
  %shr35 = lshr i32 %and34, 20, !dbg !386
  %conv36 = trunc i32 %shr35 to i16, !dbg !387
  %arrayidx37 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv36, !dbg !388
  %17 = load i8, i8* %arrayidx37, align 1, !dbg !388, !tbaa !81
  %conv38 = sext i8 %17 to i16, !dbg !388
  %add39 = add nsw i16 %add31, %conv38, !dbg !389
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !390, !tbaa !108
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !390
  %seed41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 8, !dbg !390
  %19 = load i32, i32* %seed41, align 2, !dbg !390, !tbaa !234
  %and42 = and i32 %19, 251658240, !dbg !391
  %shr43 = lshr i32 %and42, 24, !dbg !392
  %conv44 = trunc i32 %shr43 to i16, !dbg !393
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv44, !dbg !394
  %20 = load i8, i8* %arrayidx45, align 1, !dbg !394, !tbaa !81
  %conv46 = sext i8 %20 to i16, !dbg !394
  %add47 = add nsw i16 %add39, %conv46, !dbg !395
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396, !tbaa !108
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !396
  %seed49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 8, !dbg !396
  %22 = load i32, i32* %seed49, align 2, !dbg !396, !tbaa !234
  %and50 = and i32 %22, -268435456, !dbg !397
  %shr51 = lshr i32 %and50, 28, !dbg !398
  %conv52 = trunc i32 %shr51 to i16, !dbg !399
  %arrayidx53 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv52, !dbg !400
  %23 = load i8, i8* %arrayidx53, align 1, !dbg !400, !tbaa !81
  %conv54 = sext i8 %23 to i16, !dbg !400
  %add55 = add nsw i16 %add47, %conv54, !dbg !401
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !402, !tbaa !108
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !402
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 3, !dbg !402
  %25 = load i16, i16* %n_3, align 2, !dbg !403, !tbaa !220
  %add57 = add i16 %25, %add55, !dbg !403
  store i16 %add57, i16* %n_3, align 2, !dbg !403, !tbaa !220
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !404, !tbaa !108
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !404
  %seed59 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 8, !dbg !404
  %27 = load i32, i32* %seed59, align 2, !dbg !404, !tbaa !234
  %add60 = add i32 %27, 13, !dbg !405
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !406, !tbaa !108
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !406
  %seed62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 8, !dbg !406
  store i32 %add60, i32* %seed62, align 2, !dbg !407, !tbaa !234
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408, !tbaa !108
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !408
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 9, !dbg !408
  %30 = load i16, i16* %iter, align 2, !dbg !409, !tbaa !237
  %inc = add i16 %30, 1, !dbg !409
  store i16 %inc, i16* %iter, align 2, !dbg !409, !tbaa !237
  ret void, !dbg !410
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_BW_btbl_bitcount() local_unnamed_addr #7 !dbg !411 {
entry:
  %U = alloca %union.anon, align 2
  %0 = bitcast %union.anon* %U to i8*, !dbg !422
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #13, !dbg !422
  call void @llvm.dbg.declare(metadata %union.anon* %U, metadata !413, metadata !DIExpression()), !dbg !423
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !424
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !424
  %2 = load i32, i32* %seed, align 2, !dbg !424, !tbaa !234
  %y = bitcast %union.anon* %U to i32*, !dbg !425
  store i32 %2, i32* %y, align 2, !dbg !426, !tbaa !81
  %ch = bitcast %union.anon* %U to [4 x i8]*, !dbg !427
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ch, i16 0, i16 0, !dbg !428
  %3 = load i8, i8* %arrayidx, align 2, !dbg !428, !tbaa !81
  %idxprom = zext i8 %3 to i16, !dbg !429
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !429
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !429, !tbaa !81
  %conv = sext i8 %4 to i16, !dbg !429
  %ch2 = bitcast %union.anon* %U to [4 x i8]*, !dbg !430
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %ch2, i16 0, i16 1, !dbg !431
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !431, !tbaa !81
  %idxprom4 = zext i8 %5 to i16, !dbg !432
  %arrayidx5 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom4, !dbg !432
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !432, !tbaa !81
  %conv6 = sext i8 %6 to i16, !dbg !432
  %add = add nsw i16 %conv, %conv6, !dbg !433
  %ch7 = bitcast %union.anon* %U to [4 x i8]*, !dbg !434
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %ch7, i16 0, i16 3, !dbg !435
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !435, !tbaa !81
  %idxprom9 = zext i8 %7 to i16, !dbg !436
  %arrayidx10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom9, !dbg !436
  %8 = load i8, i8* %arrayidx10, align 1, !dbg !436, !tbaa !81
  %conv11 = sext i8 %8 to i16, !dbg !436
  %add12 = add nsw i16 %add, %conv11, !dbg !437
  %ch13 = bitcast %union.anon* %U to [4 x i8]*, !dbg !438
  %arrayidx14 = getelementptr inbounds [4 x i8], [4 x i8]* %ch13, i16 0, i16 2, !dbg !439
  %9 = load i8, i8* %arrayidx14, align 2, !dbg !439, !tbaa !81
  %idxprom15 = zext i8 %9 to i16, !dbg !440
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom15, !dbg !440
  %10 = load i8, i8* %arrayidx16, align 1, !dbg !440, !tbaa !81
  %conv17 = sext i8 %10 to i16, !dbg !440
  %add18 = add nsw i16 %add12, %conv17, !dbg !441
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442, !tbaa !108
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !442
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 4, !dbg !442
  %12 = load i16, i16* %n_4, align 2, !dbg !443, !tbaa !223
  %add20 = add i16 %12, %add18, !dbg !443
  store i16 %add20, i16* %n_4, align 2, !dbg !443, !tbaa !223
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !444, !tbaa !108
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !444
  %seed22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !444
  %14 = load i32, i32* %seed22, align 2, !dbg !444, !tbaa !234
  %add23 = add i32 %14, 13, !dbg !445
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446, !tbaa !108
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !446
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !446
  store i32 %add23, i32* %seed25, align 2, !dbg !447, !tbaa !234
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !448, !tbaa !108
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !448
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !448
  %17 = load i16, i16* %iter, align 2, !dbg !449, !tbaa !237
  %inc = add i16 %17, 1, !dbg !449
  store i16 %inc, i16* %iter, align 2, !dbg !449, !tbaa !237
  %18 = bitcast %union.anon* %U to i8*, !dbg !450
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #13, !dbg !450
  ret void, !dbg !450
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_AR_btbl_bitcount() local_unnamed_addr #7 !dbg !451 {
entry:
  %Ptr = alloca i8*, align 2
  %Accu = alloca i16, align 2
  %0 = bitcast i8** %Ptr to i8*, !dbg !455
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !455
  call void @llvm.dbg.declare(metadata i8** %Ptr, metadata !453, metadata !DIExpression()), !dbg !456
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !457, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !457
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !457
  %2 = bitcast i32* %seed to i8*, !dbg !458
  store i8* %2, i8** %Ptr, align 2, !dbg !456, !tbaa !108
  %3 = bitcast i16* %Accu to i8*, !dbg !459
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #13, !dbg !459
  call void @llvm.dbg.declare(metadata i16* %Accu, metadata !454, metadata !DIExpression()), !dbg !460
  %4 = load i8*, i8** %Ptr, align 2, !dbg !461, !tbaa !108
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !461
  store i8* %incdec.ptr, i8** %Ptr, align 2, !dbg !461, !tbaa !108
  %5 = load i8, i8* %4, align 1, !dbg !462, !tbaa !81
  %idxprom = zext i8 %5 to i16, !dbg !463
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !463
  %6 = load i8, i8* %arrayidx, align 1, !dbg !463, !tbaa !81
  %conv = sext i8 %6 to i16, !dbg !463
  store i16 %conv, i16* %Accu, align 2, !dbg !464, !tbaa !76
  %7 = load i8*, i8** %Ptr, align 2, !dbg !465, !tbaa !108
  %incdec.ptr1 = getelementptr inbounds i8, i8* %7, i32 1, !dbg !465
  store i8* %incdec.ptr1, i8** %Ptr, align 2, !dbg !465, !tbaa !108
  %8 = load i8, i8* %7, align 1, !dbg !466, !tbaa !81
  %idxprom2 = zext i8 %8 to i16, !dbg !467
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom2, !dbg !467
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !467, !tbaa !81
  %conv4 = sext i8 %9 to i16, !dbg !467
  %10 = load i16, i16* %Accu, align 2, !dbg !468, !tbaa !76
  %add = add nsw i16 %10, %conv4, !dbg !468
  store i16 %add, i16* %Accu, align 2, !dbg !468, !tbaa !76
  %11 = load i8*, i8** %Ptr, align 2, !dbg !469, !tbaa !108
  %incdec.ptr5 = getelementptr inbounds i8, i8* %11, i32 1, !dbg !469
  store i8* %incdec.ptr5, i8** %Ptr, align 2, !dbg !469, !tbaa !108
  %12 = load i8, i8* %11, align 1, !dbg !470, !tbaa !81
  %idxprom6 = zext i8 %12 to i16, !dbg !471
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom6, !dbg !471
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !471, !tbaa !81
  %conv8 = sext i8 %13 to i16, !dbg !471
  %14 = load i16, i16* %Accu, align 2, !dbg !472, !tbaa !76
  %add9 = add nsw i16 %14, %conv8, !dbg !472
  store i16 %add9, i16* %Accu, align 2, !dbg !472, !tbaa !76
  %15 = load i8*, i8** %Ptr, align 2, !dbg !473, !tbaa !108
  %16 = load i8, i8* %15, align 1, !dbg !474, !tbaa !81
  %idxprom10 = zext i8 %16 to i16, !dbg !475
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom10, !dbg !475
  %17 = load i8, i8* %arrayidx11, align 1, !dbg !475, !tbaa !81
  %conv12 = sext i8 %17 to i16, !dbg !475
  %18 = load i16, i16* %Accu, align 2, !dbg !476, !tbaa !76
  %add13 = add nsw i16 %18, %conv12, !dbg !476
  store i16 %add13, i16* %Accu, align 2, !dbg !476, !tbaa !76
  %19 = load i16, i16* %Accu, align 2, !dbg !477, !tbaa !76
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !478, !tbaa !108
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !478
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !478
  %21 = load i16, i16* %n_5, align 2, !dbg !479, !tbaa !226
  %add15 = add i16 %21, %19, !dbg !479
  store i16 %add15, i16* %n_5, align 2, !dbg !479, !tbaa !226
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !480, !tbaa !108
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !480
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !480
  %23 = load i32, i32* %seed17, align 2, !dbg !480, !tbaa !234
  %add18 = add i32 %23, 13, !dbg !481
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !482, !tbaa !108
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !482
  %seed20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !482
  store i32 %add18, i32* %seed20, align 2, !dbg !483, !tbaa !234
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484, !tbaa !108
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !484
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !484
  %26 = load i16, i16* %iter, align 2, !dbg !485, !tbaa !237
  %inc = add i16 %26, 1, !dbg !485
  store i16 %inc, i16* %iter, align 2, !dbg !485, !tbaa !237
  %27 = bitcast i16* %Accu to i8*, !dbg !486
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #13, !dbg !486
  %28 = bitcast i8** %Ptr to i8*, !dbg !486
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #13, !dbg !486
  ret void, !dbg !486
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_shifter() local_unnamed_addr #7 !dbg !487 {
entry:
  %i = alloca i16, align 2
  %nn = alloca i16, align 2
  %tmp_seed = alloca i32, align 2
  %0 = bitcast i16* %i to i8*, !dbg !492
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #13, !dbg !492
  call void @llvm.dbg.declare(metadata i16* %i, metadata !489, metadata !DIExpression()), !dbg !493
  %1 = bitcast i16* %nn to i8*, !dbg !492
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #13, !dbg !492
  call void @llvm.dbg.declare(metadata i16* %nn, metadata !490, metadata !DIExpression()), !dbg !494
  %2 = bitcast i32* %tmp_seed to i8*, !dbg !495
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #13, !dbg !495
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !491, metadata !DIExpression()), !dbg !496
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !497, !tbaa !108
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !497
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !497
  %4 = load i32, i32* %seed, align 2, !dbg !497, !tbaa !234
  store i32 %4, i32* %tmp_seed, align 2, !dbg !496, !tbaa !248
  store i16 0, i16* %nn, align 2, !dbg !498, !tbaa !76
  store i16 0, i16* %i, align 2, !dbg !500, !tbaa !76
  br label %for.cond, !dbg !501

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !502, !tbaa !248
  %tobool = icmp ne i32 %5, 0, !dbg !502
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !504

land.rhs:                                         ; preds = %for.cond
  %6 = load i16, i16* %i, align 2, !dbg !505, !tbaa !76
  %cmp = icmp ult i16 %6, 32, !dbg !506
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !507
  br i1 %7, label %for.body, label %for.end, !dbg !508

for.body:                                         ; preds = %land.end
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !509, !tbaa !248
  %and = and i32 %8, 1, !dbg !510
  %conv = trunc i32 %and to i16, !dbg !511
  %9 = load i16, i16* %nn, align 2, !dbg !512, !tbaa !76
  %add = add nsw i16 %9, %conv, !dbg !512
  store i16 %add, i16* %nn, align 2, !dbg !512, !tbaa !76
  br label %for.inc, !dbg !513

for.inc:                                          ; preds = %for.body
  %10 = load i16, i16* %i, align 2, !dbg !514, !tbaa !76
  %inc = add nsw i16 %10, 1, !dbg !514
  store i16 %inc, i16* %i, align 2, !dbg !514, !tbaa !76
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !515, !tbaa !248
  %shr = lshr i32 %11, 1, !dbg !515
  store i32 %shr, i32* %tmp_seed, align 2, !dbg !515, !tbaa !248
  br label %for.cond, !dbg !516, !llvm.loop !517

for.end:                                          ; preds = %land.end
  %12 = load i16, i16* %nn, align 2, !dbg !519, !tbaa !76
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !520, !tbaa !108
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !520
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !520
  %14 = load i16, i16* %n_6, align 2, !dbg !521, !tbaa !229
  %add2 = add i16 %14, %12, !dbg !521
  store i16 %add2, i16* %n_6, align 2, !dbg !521, !tbaa !229
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !522, !tbaa !108
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !522
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !522
  %16 = load i32, i32* %seed4, align 2, !dbg !522, !tbaa !234
  %add5 = add i32 %16, 13, !dbg !523
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !524, !tbaa !108
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !524
  %seed7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !524
  store i32 %add5, i32* %seed7, align 2, !dbg !525, !tbaa !234
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !526, !tbaa !108
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !526
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !526
  %19 = load i16, i16* %iter, align 2, !dbg !527, !tbaa !237
  %inc9 = add i16 %19, 1, !dbg !527
  store i16 %inc9, i16* %iter, align 2, !dbg !527, !tbaa !237
  %20 = bitcast i32* %tmp_seed to i8*, !dbg !528
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #13, !dbg !528
  %21 = bitcast i16* %nn to i8*, !dbg !528
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %21) #13, !dbg !528
  %22 = bitcast i16* %i to i8*, !dbg !528
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #13, !dbg !528
  ret void, !dbg !528
}

; Function Attrs: noinline noreturn nounwind optnone
define dso_local void @task_done() local_unnamed_addr #9 !dbg !529 {
entry:
  call void @exit(i16 0) #14, !dbg !530
  unreachable, !dbg !530
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) local_unnamed_addr #10

; Function Attrs: norecurse nounwind readnone
define dso_local void @task_commit() local_unnamed_addr #11 !dbg !531 {
entry:
  ret void, !dbg !532
}

; Function Attrs: noreturn nounwind
define dso_local i16 @main() local_unnamed_addr #12 !dbg !533 {
entry:
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 0), align 2, !dbg !536, !tbaa !99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !537, !tbaa !108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i16 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !538, !tbaa !108
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !539, !tbaa !76
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !541, !tbaa !81
  %1 = or i8 %0, 1, !dbg !541
  store volatile i8 %1, i8* @PADIR_L, align 1, !dbg !541, !tbaa !81
  %2 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !542, !tbaa !81
  %3 = and i8 %2, -2, !dbg !542
  store volatile i8 %3, i8* @PAOUT_L, align 1, !dbg !542, !tbaa !81
  %4 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !543, !tbaa !76
  %and4.i = and i16 %4, -2, !dbg !543
  store volatile i16 %and4.i, i16* @PM5CTL0, align 2, !dbg !543, !tbaa !76
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !544, !tbaa !81
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !545, !tbaa !76
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !546, !tbaa !76
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !547, !tbaa !76
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !548, !tbaa !81
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !549, !tbaa !76
  tail call void @task_init(), !dbg !550
  tail call void @commit(), !dbg !550
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i16 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals1 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i16 0, i32 1
  %BCast4 = bitcast %struct.camel_global_t* %globals3 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i16(i8* nonnull align 2 dereferenceable(22) %BCast, i8* nonnull align 2 dereferenceable(22) %BCast4, i16 22, i1 false), !dbg !550
  br label %while.body, !dbg !551

while.body:                                       ; preds = %while.body.backedge, %entry
  tail call void @task_select_func(), !dbg !552
  tail call void @commit(), !dbg !552
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 8
  %tmp6 = load i32, i32* %global5, align 2
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 8
  store i32 %tmp6, i32* %global9, align 2
  %global12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 9
  %tmp13 = load i16, i16* %global12, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 9
  store i16 %tmp13, i16* %global16, align 2
  %global19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i16 0, i32 1, i32 7
  %tmp20 = load i16, i16* %global19, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i16 0, i32 1, i32 7
  store i16 %tmp20, i16* %global23, align 2
  %5 = load i16, i16* %global19, align 2, !dbg !554, !tbaa !208
  switch i16 %5, label %while.body.backedge [
    i16 1, label %while.cond1.preheader
    i16 2, label %while.cond9.preheader
    i16 3, label %while.cond20.preheader
    i16 4, label %while.cond31.preheader
    i16 5, label %while.cond42.preheader
    i16 6, label %while.cond53.preheader
    i16 7, label %while.cond64.preheader
    i16 8, label %if.then74
  ], !dbg !556

while.cond64.preheader:                           ; preds = %while.body
  %6 = load i16, i16* %global12, align 2, !dbg !557, !tbaa !237
  %cmp678 = icmp ult i16 %6, 100, !dbg !565
  br i1 %cmp678, label %while.body68, label %while.body.backedge, !dbg !566

while.body.backedge:                              ; preds = %while.body68, %while.body57, %while.body46, %while.body35, %while.body24, %while.body13, %while.body4, %while.cond64.preheader, %while.cond53.preheader, %while.cond42.preheader, %while.cond31.preheader, %while.cond20.preheader, %while.cond9.preheader, %while.cond1.preheader, %while.body
  br label %while.body, !dbg !552, !llvm.loop !567

while.cond53.preheader:                           ; preds = %while.body
  %7 = load i16, i16* %global12, align 2, !dbg !569, !tbaa !237
  %cmp5610 = icmp ult i16 %7, 100, !dbg !571
  br i1 %cmp5610, label %while.body57, label %while.body.backedge, !dbg !572

while.cond42.preheader:                           ; preds = %while.body
  %8 = load i16, i16* %global12, align 2, !dbg !573, !tbaa !237
  %cmp4512 = icmp ult i16 %8, 100, !dbg !575
  br i1 %cmp4512, label %while.body46, label %while.body.backedge, !dbg !576

while.cond31.preheader:                           ; preds = %while.body
  %9 = load i16, i16* %global12, align 2, !dbg !577, !tbaa !237
  %cmp3414 = icmp ult i16 %9, 100, !dbg !579
  br i1 %cmp3414, label %while.body35, label %while.body.backedge, !dbg !580

while.cond20.preheader:                           ; preds = %while.body
  %10 = load i16, i16* %global12, align 2, !dbg !581, !tbaa !237
  %cmp2316 = icmp ult i16 %10, 100, !dbg !583
  br i1 %cmp2316, label %while.body24, label %while.body.backedge, !dbg !584

while.cond9.preheader:                            ; preds = %while.body
  %11 = load i16, i16* %global12, align 2, !dbg !585, !tbaa !237
  %cmp1218 = icmp ult i16 %11, 100, !dbg !587
  br i1 %cmp1218, label %while.body13, label %while.body.backedge, !dbg !588

while.cond1.preheader:                            ; preds = %while.body
  %12 = load i16, i16* %global12, align 2, !dbg !589, !tbaa !237
  %cmp320 = icmp ult i16 %12, 100, !dbg !591
  br i1 %cmp320, label %while.body4, label %while.body.backedge, !dbg !592

while.body4:                                      ; preds = %while.cond1.preheader, %while.body4
  tail call void @task_bit_count(), !dbg !593
  tail call void @commit(), !dbg !593
  %tmp24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i16 0, i32 1, i32 8
  %tmp27 = load i32, i32* %global26, align 2
  %tmp28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp28, i16 0, i32 1, i32 8
  store i32 %tmp27, i32* %global30, align 2
  %global33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i16 0, i32 1, i32 0
  %tmp34 = load i16, i16* %global33, align 2
  %global37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp28, i16 0, i32 1, i32 0
  store i16 %tmp34, i16* %global37, align 2
  %global40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i16 0, i32 1, i32 9
  %tmp41 = load i16, i16* %global40, align 2
  %global44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp28, i16 0, i32 1, i32 9
  store i16 %tmp41, i16* %global44, align 2
  %13 = load i16, i16* %global40, align 2, !dbg !589, !tbaa !237
  %cmp3 = icmp ult i16 %13, 100, !dbg !591
  br i1 %cmp3, label %while.body4, label %while.body.backedge, !dbg !592, !llvm.loop !567

while.body13:                                     ; preds = %while.cond9.preheader, %while.body13
  tail call void @task_bitcount(), !dbg !595
  tail call void @commit(), !dbg !595
  %tmp45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 8
  %tmp48 = load i32, i32* %global47, align 2
  %tmp49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 8
  store i32 %tmp48, i32* %global51, align 2
  %global54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 1
  %tmp55 = load i16, i16* %global54, align 2
  %global58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 1
  store i16 %tmp55, i16* %global58, align 2
  %global61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i16 0, i32 1, i32 9
  %tmp62 = load i16, i16* %global61, align 2
  %global65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp49, i16 0, i32 1, i32 9
  store i16 %tmp62, i16* %global65, align 2
  %14 = load i16, i16* %global61, align 2, !dbg !585, !tbaa !237
  %cmp12 = icmp ult i16 %14, 100, !dbg !587
  br i1 %cmp12, label %while.body13, label %while.body.backedge, !dbg !588, !llvm.loop !567

while.body24:                                     ; preds = %while.cond20.preheader, %while.body24
  tail call void @task_ntbl_bitcnt(), !dbg !597
  tail call void @commit(), !dbg !597
  %tmp66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 2
  %tmp69 = load i16, i16* %global68, align 2
  %tmp70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 2
  store i16 %tmp69, i16* %global72, align 2
  %global75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 8
  %tmp76 = load i32, i32* %global75, align 2
  %global79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 8
  store i32 %tmp76, i32* %global79, align 2
  %global82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i16 0, i32 1, i32 9
  %tmp83 = load i16, i16* %global82, align 2
  %global86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i16 0, i32 1, i32 9
  store i16 %tmp83, i16* %global86, align 2
  %15 = load i16, i16* %global82, align 2, !dbg !581, !tbaa !237
  %cmp23 = icmp ult i16 %15, 100, !dbg !583
  br i1 %cmp23, label %while.body24, label %while.body.backedge, !dbg !584, !llvm.loop !567

while.body35:                                     ; preds = %while.cond31.preheader, %while.body35
  tail call void @task_ntbl_bitcount(), !dbg !599
  tail call void @commit(), !dbg !599
  %tmp87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp87, i16 0, i32 1, i32 3
  %tmp90 = load i16, i16* %global89, align 2
  %tmp91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i16 0, i32 1, i32 3
  store i16 %tmp90, i16* %global93, align 2
  %global96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp87, i16 0, i32 1, i32 8
  %tmp97 = load i32, i32* %global96, align 2
  %global100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i16 0, i32 1, i32 8
  store i32 %tmp97, i32* %global100, align 2
  %global103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp87, i16 0, i32 1, i32 9
  %tmp104 = load i16, i16* %global103, align 2
  %global107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i16 0, i32 1, i32 9
  store i16 %tmp104, i16* %global107, align 2
  %16 = load i16, i16* %global103, align 2, !dbg !577, !tbaa !237
  %cmp34 = icmp ult i16 %16, 100, !dbg !579
  br i1 %cmp34, label %while.body35, label %while.body.backedge, !dbg !580, !llvm.loop !567

while.body46:                                     ; preds = %while.cond42.preheader, %while.body46
  tail call void @task_BW_btbl_bitcount(), !dbg !601
  tail call void @commit(), !dbg !601
  %tmp108 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp108, i16 0, i32 1, i32 4
  %tmp111 = load i16, i16* %global110, align 2
  %tmp112 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp112, i16 0, i32 1, i32 4
  store i16 %tmp111, i16* %global114, align 2
  %global117 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp108, i16 0, i32 1, i32 8
  %tmp118 = load i32, i32* %global117, align 2
  %global121 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp112, i16 0, i32 1, i32 8
  store i32 %tmp118, i32* %global121, align 2
  %global124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp108, i16 0, i32 1, i32 9
  %tmp125 = load i16, i16* %global124, align 2
  %global128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp112, i16 0, i32 1, i32 9
  store i16 %tmp125, i16* %global128, align 2
  %17 = load i16, i16* %global124, align 2, !dbg !573, !tbaa !237
  %cmp45 = icmp ult i16 %17, 100, !dbg !575
  br i1 %cmp45, label %while.body46, label %while.body.backedge, !dbg !576, !llvm.loop !567

while.body57:                                     ; preds = %while.cond53.preheader, %while.body57
  tail call void @task_AR_btbl_bitcount(), !dbg !603
  tail call void @commit(), !dbg !603
  %tmp129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp129, i16 0, i32 1, i32 5
  %tmp132 = load i16, i16* %global131, align 2
  %tmp133 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp133, i16 0, i32 1, i32 5
  store i16 %tmp132, i16* %global135, align 2
  %global138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp129, i16 0, i32 1, i32 8
  %tmp139 = load i32, i32* %global138, align 2
  %global142 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp133, i16 0, i32 1, i32 8
  store i32 %tmp139, i32* %global142, align 2
  %global145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp129, i16 0, i32 1, i32 9
  %tmp146 = load i16, i16* %global145, align 2
  %global149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp133, i16 0, i32 1, i32 9
  store i16 %tmp146, i16* %global149, align 2
  %18 = load i16, i16* %global145, align 2, !dbg !569, !tbaa !237
  %cmp56 = icmp ult i16 %18, 100, !dbg !571
  br i1 %cmp56, label %while.body57, label %while.body.backedge, !dbg !572, !llvm.loop !567

while.body68:                                     ; preds = %while.cond64.preheader, %while.body68
  tail call void @task_bit_shifter(), !dbg !605
  tail call void @commit(), !dbg !605
  %tmp150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i16 0, i32 1, i32 6
  %tmp153 = load i16, i16* %global152, align 2
  %tmp154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp154, i16 0, i32 1, i32 6
  store i16 %tmp153, i16* %global156, align 2
  %global159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i16 0, i32 1, i32 8
  %tmp160 = load i32, i32* %global159, align 2
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp154, i16 0, i32 1, i32 8
  store i32 %tmp160, i32* %global163, align 2
  %global166 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i16 0, i32 1, i32 9
  %tmp167 = load i16, i16* %global166, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp154, i16 0, i32 1, i32 9
  store i16 %tmp167, i16* %global170, align 2
  %19 = load i16, i16* %global166, align 2, !dbg !557, !tbaa !237
  %cmp67 = icmp ult i16 %19, 100, !dbg !565
  br i1 %cmp67, label %while.body68, label %while.body.backedge, !dbg !566, !llvm.loop !567

if.then74:                                        ; preds = %while.body
  tail call void @task_done(), !dbg !607
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
attributes #6 = { naked noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline noreturn nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { norecurse nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nounwind }
attributes #14 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 67, type: !65, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_bc.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7, !12, !13}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 32, baseType: !9)
!8 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 65, baseType: !11)
!10 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!11 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 16)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !{!16, !21, !26, !0, !28, !54, !56, !59}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 473, type: !18, isLocal: true, isDefinition: true)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 16)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 23, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 24, type: !23, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 74, type: !30, isLocal: false, isDefinition: true)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 16)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 60, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 55, size: 368, elements: !33)
!33 = !{!34, !39, !53}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !32, file: !3, line: 57, baseType: !35, size: 176)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 176, elements: !37)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 20, baseType: !23)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !32, file: !3, line: 58, baseType: !40, size: 176, offset: 176)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 52, baseType: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 38, size: 176, elements: !42)
!42 = !{!43, !44, !45, !46, !47, !48, !49, !50, !51, !52}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "n_0", scope: !41, file: !3, line: 41, baseType: !6, size: 16)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "n_1", scope: !41, file: !3, line: 42, baseType: !6, size: 16, offset: 16)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "n_2", scope: !41, file: !3, line: 43, baseType: !6, size: 16, offset: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "n_3", scope: !41, file: !3, line: 44, baseType: !6, size: 16, offset: 48)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "n_4", scope: !41, file: !3, line: 45, baseType: !6, size: 16, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "n_5", scope: !41, file: !3, line: 46, baseType: !6, size: 16, offset: 80)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "n_6", scope: !41, file: !3, line: 47, baseType: !6, size: 16, offset: 96)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "func", scope: !41, file: !3, line: 48, baseType: !6, size: 16, offset: 112)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !41, file: !3, line: 49, baseType: !7, size: 32, offset: 128)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "iter", scope: !41, file: !3, line: 50, baseType: !6, size: 16, offset: 160)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !32, file: !3, line: 59, baseType: !23, size: 16, offset: 352)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 74, type: !30, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 103, type: !58, isLocal: false, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 176, elements: !37)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "bits", scope: !2, file: !3, line: 249, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 2048, elements: !63)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !{!64}
!64 = !DISubrange(count: 256)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 62, size: 752, elements: !66)
!66 = !{!67, !68, !69}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !65, file: !3, line: 64, baseType: !23, size: 16)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !65, file: !3, line: 65, baseType: !31, size: 368, offset: 16)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !65, file: !3, line: 66, baseType: !31, size: 368, offset: 384)
!70 = !{i32 2, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 2}
!73 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!74 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 76, type: !19, scopeLine: 76, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 77, column: 10, scope: !74)
!76 = !{!77, !77, i64 0}
!77 = !{!"int", !78, i64 0}
!78 = !{!"omnipotent char", !79, i64 0}
!79 = !{!"Simple C/C++ TBAA"}
!80 = !DILocation(line: 79, column: 9, scope: !74)
!81 = !{!78, !78, i64 0}
!82 = !DILocation(line: 81, column: 9, scope: !74)
!83 = !DILocation(line: 86, column: 11, scope: !74)
!84 = !DILocation(line: 91, column: 12, scope: !74)
!85 = !DILocation(line: 92, column: 10, scope: !74)
!86 = !DILocation(line: 93, column: 10, scope: !74)
!87 = !DILocation(line: 95, column: 10, scope: !74)
!88 = !DILocation(line: 96, column: 12, scope: !74)
!89 = !DILocation(line: 99, column: 10, scope: !74)
!90 = !DILocation(line: 101, column: 1, scope: !74)
!91 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 105, type: !19, scopeLine: 105, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !92)
!92 = !{!93, !95}
!93 = !DILocalVariable(name: "__x", scope: !94, file: !3, line: 132, type: !6)
!94 = distinct !DILexicalBlock(scope: !91, file: !3, line: 132, column: 33)
!95 = !DILocalVariable(name: "__x", scope: !96, file: !3, line: 132, type: !6)
!96 = distinct !DILexicalBlock(scope: !91, file: !3, line: 132, column: 65)
!97 = !DILocation(line: 106, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !91, file: !3, line: 106, column: 8)
!99 = !{!100, !101, i64 0}
!100 = !{!"Camel", !101, i64 0, !102, i64 2, !102, i64 48}
!101 = !{!"short", !78, i64 0}
!102 = !{!"camel_buffer_t", !78, i64 0, !103, i64 22, !101, i64 44}
!103 = !{!"camel_global_t", !77, i64 0, !77, i64 2, !77, i64 4, !77, i64 6, !77, i64 8, !77, i64 10, !77, i64 12, !77, i64 14, !104, i64 16, !77, i64 20}
!104 = !{!"long", !78, i64 0}
!105 = !DILocation(line: 106, column: 8, scope: !91)
!106 = !DILocation(line: 107, column: 14, scope: !107)
!107 = distinct !DILexicalBlock(scope: !98, file: !3, line: 106, column: 34)
!108 = !{!109, !109, i64 0}
!109 = !{!"any pointer", !78, i64 0}
!110 = !DILocation(line: 108, column: 16, scope: !107)
!111 = !DILocation(line: 109, column: 5, scope: !107)
!112 = !DILocation(line: 110, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !114, file: !3, line: 109, column: 41)
!114 = distinct !DILexicalBlock(scope: !98, file: !3, line: 109, column: 15)
!115 = !DILocation(line: 111, column: 16, scope: !113)
!116 = !DILocation(line: 112, column: 5, scope: !113)
!117 = !DILocation(line: 113, column: 9, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 112, column: 12)
!119 = !DILocation(line: 130, column: 3, scope: !120)
!120 = distinct !DILexicalBlock(scope: !91, file: !3, line: 130, column: 3)
!121 = !{!101, !101, i64 0}
!122 = !{i32 -2146652195}
!123 = !DILocation(line: 132, column: 33, scope: !94)
!124 = !{i32 -2146651959}
!125 = !DILocation(line: 0, scope: !94)
!126 = !DILocation(line: 132, column: 51, scope: !91)
!127 = !DILocation(line: 132, column: 33, scope: !91)
!128 = !DILocation(line: 132, column: 65, scope: !96)
!129 = !{i32 -2146651834}
!130 = !DILocation(line: 0, scope: !96)
!131 = !DILocation(line: 132, column: 63, scope: !91)
!132 = !DILocation(line: 132, column: 19, scope: !91)
!133 = !DILocation(line: 132, column: 17, scope: !91)
!134 = !DILocation(line: 133, column: 37, scope: !91)
!135 = !DILocation(line: 133, column: 23, scope: !91)
!136 = !DILocation(line: 133, column: 21, scope: !91)
!137 = !DILocation(line: 136, column: 27, scope: !138)
!138 = distinct !DILexicalBlock(scope: !91, file: !3, line: 136, column: 6)
!139 = !DILocation(line: 136, column: 33, scope: !138)
!140 = !{!102, !101, i64 44}
!141 = !DILocation(line: 136, column: 24, scope: !138)
!142 = !DILocation(line: 136, column: 6, scope: !91)
!143 = !DILocation(line: 137, column: 11, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !3, line: 136, column: 51)
!145 = !DILocation(line: 137, column: 4, scope: !144)
!146 = !DILocation(line: 77, column: 10, scope: !74, inlinedAt: !147)
!147 = distinct !DILocation(line: 138, column: 4, scope: !144)
!148 = !DILocation(line: 79, column: 9, scope: !74, inlinedAt: !147)
!149 = !DILocation(line: 81, column: 9, scope: !74, inlinedAt: !147)
!150 = !DILocation(line: 86, column: 11, scope: !74, inlinedAt: !147)
!151 = !DILocation(line: 91, column: 12, scope: !74, inlinedAt: !147)
!152 = !DILocation(line: 92, column: 10, scope: !74, inlinedAt: !147)
!153 = !DILocation(line: 93, column: 10, scope: !74, inlinedAt: !147)
!154 = !DILocation(line: 95, column: 10, scope: !74, inlinedAt: !147)
!155 = !DILocation(line: 96, column: 12, scope: !74, inlinedAt: !147)
!156 = !DILocation(line: 99, column: 10, scope: !74, inlinedAt: !147)
!157 = !DILocation(line: 139, column: 24, scope: !144)
!158 = !DILocation(line: 139, column: 4, scope: !144)
!159 = !DILocation(line: 140, column: 3, scope: !144)
!160 = !DILocation(line: 141, column: 4, scope: !161)
!161 = distinct !DILexicalBlock(scope: !138, file: !3, line: 140, column: 9)
!162 = !DILocation(line: 144, column: 1, scope: !91)
!163 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 195, type: !19, scopeLine: 195, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !164)
!164 = !{!165, !170, !172, !175}
!165 = !DILocalVariable(name: "__x", scope: !166, file: !3, line: 202, type: !6)
!166 = distinct !DILexicalBlock(scope: !167, file: !3, line: 202, column: 45)
!167 = distinct !DILexicalBlock(scope: !168, file: !3, line: 198, column: 39)
!168 = distinct !DILexicalBlock(scope: !169, file: !3, line: 198, column: 14)
!169 = distinct !DILexicalBlock(scope: !163, file: !3, line: 196, column: 8)
!170 = !DILocalVariable(name: "__x", scope: !171, file: !3, line: 202, type: !6)
!171 = distinct !DILexicalBlock(scope: !167, file: !3, line: 202, column: 77)
!172 = !DILocalVariable(name: "__x", scope: !173, file: !3, line: 210, type: !6)
!173 = distinct !DILexicalBlock(scope: !174, file: !3, line: 210, column: 45)
!174 = distinct !DILexicalBlock(scope: !168, file: !3, line: 206, column: 17)
!175 = !DILocalVariable(name: "__x", scope: !176, file: !3, line: 210, type: !6)
!176 = distinct !DILexicalBlock(scope: !174, file: !3, line: 210, column: 77)
!177 = !DILocation(line: 198, column: 20, scope: !168)
!178 = !DILocation(line: 198, column: 25, scope: !168)
!179 = !DILocation(line: 198, column: 14, scope: !169)
!180 = !DILocation(line: 199, column: 17, scope: !167)
!181 = !DILocation(line: 200, column: 19, scope: !167)
!182 = !DILocation(line: 201, column: 12, scope: !167)
!183 = !DILocation(line: 202, column: 45, scope: !166)
!184 = !{i32 -2146651520}
!185 = !DILocation(line: 0, scope: !166)
!186 = !DILocation(line: 202, column: 77, scope: !171)
!187 = !{i32 -2146651395}
!188 = !DILocation(line: 0, scope: !171)
!189 = !DILocation(line: 206, column: 11, scope: !167)
!190 = !DILocation(line: 207, column: 17, scope: !174)
!191 = !DILocation(line: 208, column: 19, scope: !174)
!192 = !DILocation(line: 209, column: 12, scope: !174)
!193 = !DILocation(line: 210, column: 45, scope: !173)
!194 = !{i32 -2146651263}
!195 = !DILocation(line: 0, scope: !173)
!196 = !DILocation(line: 210, column: 77, scope: !176)
!197 = !{i32 -2146651138}
!198 = !DILocation(line: 0, scope: !176)
!199 = !DILocation(line: 0, scope: !168)
!200 = !DILocation(line: 218, column: 1, scope: !163)
!201 = distinct !DISubprogram(name: "naked", scope: !3, file: !3, line: 243, type: !19, scopeLine: 243, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 244, column: 2, scope: !201)
!203 = !{i32 10112}
!204 = !DILocation(line: 245, column: 1, scope: !201)
!205 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 269, type: !19, scopeLine: 269, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!206 = !DILocation(line: 271, column: 2, scope: !205)
!207 = !DILocation(line: 271, column: 11, scope: !205)
!208 = !{!102, !77, i64 36}
!209 = !DILocation(line: 272, column: 2, scope: !205)
!210 = !DILocation(line: 272, column: 10, scope: !205)
!211 = !{!102, !77, i64 22}
!212 = !DILocation(line: 273, column: 2, scope: !205)
!213 = !DILocation(line: 273, column: 10, scope: !205)
!214 = !{!102, !77, i64 24}
!215 = !DILocation(line: 274, column: 2, scope: !205)
!216 = !DILocation(line: 274, column: 10, scope: !205)
!217 = !{!102, !77, i64 26}
!218 = !DILocation(line: 275, column: 2, scope: !205)
!219 = !DILocation(line: 275, column: 10, scope: !205)
!220 = !{!102, !77, i64 28}
!221 = !DILocation(line: 276, column: 2, scope: !205)
!222 = !DILocation(line: 276, column: 10, scope: !205)
!223 = !{!102, !77, i64 30}
!224 = !DILocation(line: 277, column: 2, scope: !205)
!225 = !DILocation(line: 277, column: 10, scope: !205)
!226 = !{!102, !77, i64 32}
!227 = !DILocation(line: 278, column: 2, scope: !205)
!228 = !DILocation(line: 278, column: 10, scope: !205)
!229 = !{!102, !77, i64 34}
!230 = !DILocation(line: 280, column: 1, scope: !205)
!231 = distinct !DISubprogram(name: "task_select_func", scope: !3, file: !3, line: 282, type: !19, scopeLine: 282, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!232 = !DILocation(line: 284, column: 2, scope: !231)
!233 = !DILocation(line: 284, column: 11, scope: !231)
!234 = !{!102, !104, i64 38}
!235 = !DILocation(line: 285, column: 2, scope: !231)
!236 = !DILocation(line: 285, column: 11, scope: !231)
!237 = !{!102, !77, i64 42}
!238 = !DILocation(line: 286, column: 2, scope: !231)
!239 = !DILocation(line: 286, column: 10, scope: !231)
!240 = !DILocation(line: 287, column: 1, scope: !231)
!241 = distinct !DISubprogram(name: "task_bit_count", scope: !3, file: !3, line: 288, type: !19, scopeLine: 288, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !242)
!242 = !{!243, !244}
!243 = !DILocalVariable(name: "tmp_seed", scope: !241, file: !3, line: 290, type: !7)
!244 = !DILocalVariable(name: "temp", scope: !241, file: !3, line: 292, type: !6)
!245 = !DILocation(line: 290, column: 2, scope: !241)
!246 = !DILocation(line: 290, column: 11, scope: !241)
!247 = !DILocation(line: 290, column: 22, scope: !241)
!248 = !{!104, !104, i64 0}
!249 = !DILocation(line: 291, column: 13, scope: !241)
!250 = !DILocation(line: 291, column: 22, scope: !241)
!251 = !DILocation(line: 291, column: 2, scope: !241)
!252 = !DILocation(line: 291, column: 11, scope: !241)
!253 = !DILocation(line: 292, column: 2, scope: !241)
!254 = !DILocation(line: 292, column: 11, scope: !241)
!255 = !DILocation(line: 293, column: 5, scope: !256)
!256 = distinct !DILexicalBlock(scope: !241, file: !3, line: 293, column: 5)
!257 = !DILocation(line: 293, column: 5, scope: !241)
!258 = !DILocation(line: 293, column: 15, scope: !256)
!259 = !DILocation(line: 294, column: 7, scope: !256)
!260 = !DILocation(line: 294, column: 3, scope: !256)
!261 = !DILocation(line: 295, column: 26, scope: !256)
!262 = !DILocation(line: 295, column: 36, scope: !256)
!263 = !DILocation(line: 295, column: 44, scope: !256)
!264 = !DILocation(line: 295, column: 34, scope: !256)
!265 = !DILocation(line: 295, column: 24, scope: !256)
!266 = !DILocation(line: 295, column: 11, scope: !256)
!267 = distinct !{!267, !258, !268}
!268 = !DILocation(line: 295, column: 48, scope: !256)
!269 = !DILocation(line: 296, column: 13, scope: !241)
!270 = !DILocation(line: 296, column: 2, scope: !241)
!271 = !DILocation(line: 296, column: 10, scope: !241)
!272 = !DILocation(line: 297, column: 2, scope: !241)
!273 = !DILocation(line: 297, column: 10, scope: !241)
!274 = !DILocation(line: 299, column: 1, scope: !241)
!275 = distinct !DISubprogram(name: "task_bitcount", scope: !3, file: !3, line: 300, type: !19, scopeLine: 300, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !276)
!276 = !{!277}
!277 = !DILocalVariable(name: "tmp_seed", scope: !275, file: !3, line: 302, type: !7)
!278 = !DILocation(line: 302, column: 2, scope: !275)
!279 = !DILocation(line: 302, column: 11, scope: !275)
!280 = !DILocation(line: 302, column: 22, scope: !275)
!281 = !DILocation(line: 303, column: 13, scope: !275)
!282 = !DILocation(line: 303, column: 22, scope: !275)
!283 = !DILocation(line: 303, column: 2, scope: !275)
!284 = !DILocation(line: 303, column: 11, scope: !275)
!285 = !DILocation(line: 304, column: 15, scope: !275)
!286 = !DILocation(line: 304, column: 24, scope: !275)
!287 = !DILocation(line: 304, column: 39, scope: !275)
!288 = !DILocation(line: 304, column: 49, scope: !275)
!289 = !DILocation(line: 304, column: 58, scope: !275)
!290 = !DILocation(line: 304, column: 46, scope: !275)
!291 = !DILocation(line: 304, column: 11, scope: !275)
!292 = !DILocation(line: 305, column: 15, scope: !275)
!293 = !DILocation(line: 305, column: 24, scope: !275)
!294 = !DILocation(line: 305, column: 39, scope: !275)
!295 = !DILocation(line: 305, column: 49, scope: !275)
!296 = !DILocation(line: 305, column: 58, scope: !275)
!297 = !DILocation(line: 305, column: 46, scope: !275)
!298 = !DILocation(line: 305, column: 11, scope: !275)
!299 = !DILocation(line: 306, column: 15, scope: !275)
!300 = !DILocation(line: 306, column: 24, scope: !275)
!301 = !DILocation(line: 306, column: 39, scope: !275)
!302 = !DILocation(line: 306, column: 49, scope: !275)
!303 = !DILocation(line: 306, column: 58, scope: !275)
!304 = !DILocation(line: 306, column: 46, scope: !275)
!305 = !DILocation(line: 306, column: 11, scope: !275)
!306 = !DILocation(line: 307, column: 15, scope: !275)
!307 = !DILocation(line: 307, column: 24, scope: !275)
!308 = !DILocation(line: 307, column: 39, scope: !275)
!309 = !DILocation(line: 307, column: 49, scope: !275)
!310 = !DILocation(line: 307, column: 58, scope: !275)
!311 = !DILocation(line: 307, column: 46, scope: !275)
!312 = !DILocation(line: 307, column: 11, scope: !275)
!313 = !DILocation(line: 308, column: 15, scope: !275)
!314 = !DILocation(line: 308, column: 24, scope: !275)
!315 = !DILocation(line: 308, column: 39, scope: !275)
!316 = !DILocation(line: 308, column: 49, scope: !275)
!317 = !DILocation(line: 308, column: 58, scope: !275)
!318 = !DILocation(line: 308, column: 46, scope: !275)
!319 = !DILocation(line: 308, column: 11, scope: !275)
!320 = !DILocation(line: 309, column: 18, scope: !275)
!321 = !DILocation(line: 309, column: 13, scope: !275)
!322 = !DILocation(line: 309, column: 2, scope: !275)
!323 = !DILocation(line: 309, column: 10, scope: !275)
!324 = !DILocation(line: 310, column: 2, scope: !275)
!325 = !DILocation(line: 310, column: 10, scope: !275)
!326 = !DILocation(line: 312, column: 1, scope: !275)
!327 = distinct !DISubprogram(name: "recursive_cnt", scope: !3, file: !3, line: 313, type: !328, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !330)
!328 = !DISubroutineType(types: !329)
!329 = !{!12, !7}
!330 = !{!331, !332}
!331 = !DILocalVariable(name: "x", arg: 1, scope: !327, file: !3, line: 313, type: !7)
!332 = !DILocalVariable(name: "cnt", scope: !327, file: !3, line: 314, type: !12)
!333 = !DILocation(line: 0, scope: !327)
!334 = !DILocation(line: 314, column: 17, scope: !327)
!335 = !DILocation(line: 314, column: 12, scope: !327)
!336 = !DILocation(line: 316, column: 15, scope: !337)
!337 = distinct !DILexicalBlock(scope: !327, file: !3, line: 316, column: 6)
!338 = !DILocation(line: 316, column: 9, scope: !337)
!339 = !DILocation(line: 316, column: 6, scope: !327)
!340 = !DILocation(line: 317, column: 10, scope: !337)
!341 = !DILocation(line: 317, column: 7, scope: !337)
!342 = !DILocation(line: 319, column: 2, scope: !327)
!343 = distinct !DISubprogram(name: "task_ntbl_bitcnt", scope: !3, file: !3, line: 321, type: !19, scopeLine: 321, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!344 = !DILocation(line: 323, column: 27, scope: !343)
!345 = !DILocation(line: 323, column: 13, scope: !343)
!346 = !DILocation(line: 323, column: 2, scope: !343)
!347 = !DILocation(line: 323, column: 10, scope: !343)
!348 = !DILocation(line: 324, column: 13, scope: !343)
!349 = !DILocation(line: 324, column: 22, scope: !343)
!350 = !DILocation(line: 324, column: 2, scope: !343)
!351 = !DILocation(line: 324, column: 11, scope: !343)
!352 = !DILocation(line: 325, column: 2, scope: !343)
!353 = !DILocation(line: 325, column: 10, scope: !343)
!354 = !DILocation(line: 327, column: 1, scope: !343)
!355 = distinct !DISubprogram(name: "task_ntbl_bitcount", scope: !3, file: !3, line: 328, type: !19, scopeLine: 328, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!356 = !DILocation(line: 330, column: 26, scope: !355)
!357 = !DILocation(line: 330, column: 35, scope: !355)
!358 = !DILocation(line: 330, column: 19, scope: !355)
!359 = !DILocation(line: 330, column: 13, scope: !355)
!360 = !DILocation(line: 331, column: 16, scope: !355)
!361 = !DILocation(line: 331, column: 25, scope: !355)
!362 = !DILocation(line: 331, column: 41, scope: !355)
!363 = !DILocation(line: 331, column: 9, scope: !355)
!364 = !DILocation(line: 331, column: 3, scope: !355)
!365 = !DILocation(line: 330, column: 59, scope: !355)
!366 = !DILocation(line: 332, column: 16, scope: !355)
!367 = !DILocation(line: 332, column: 25, scope: !355)
!368 = !DILocation(line: 332, column: 41, scope: !355)
!369 = !DILocation(line: 332, column: 9, scope: !355)
!370 = !DILocation(line: 332, column: 3, scope: !355)
!371 = !DILocation(line: 331, column: 49, scope: !355)
!372 = !DILocation(line: 333, column: 16, scope: !355)
!373 = !DILocation(line: 333, column: 25, scope: !355)
!374 = !DILocation(line: 333, column: 41, scope: !355)
!375 = !DILocation(line: 333, column: 9, scope: !355)
!376 = !DILocation(line: 333, column: 3, scope: !355)
!377 = !DILocation(line: 332, column: 49, scope: !355)
!378 = !DILocation(line: 334, column: 16, scope: !355)
!379 = !DILocation(line: 334, column: 25, scope: !355)
!380 = !DILocation(line: 334, column: 41, scope: !355)
!381 = !DILocation(line: 334, column: 9, scope: !355)
!382 = !DILocation(line: 334, column: 3, scope: !355)
!383 = !DILocation(line: 333, column: 49, scope: !355)
!384 = !DILocation(line: 335, column: 16, scope: !355)
!385 = !DILocation(line: 335, column: 25, scope: !355)
!386 = !DILocation(line: 335, column: 41, scope: !355)
!387 = !DILocation(line: 335, column: 9, scope: !355)
!388 = !DILocation(line: 335, column: 3, scope: !355)
!389 = !DILocation(line: 334, column: 49, scope: !355)
!390 = !DILocation(line: 336, column: 16, scope: !355)
!391 = !DILocation(line: 336, column: 25, scope: !355)
!392 = !DILocation(line: 336, column: 41, scope: !355)
!393 = !DILocation(line: 336, column: 9, scope: !355)
!394 = !DILocation(line: 336, column: 3, scope: !355)
!395 = !DILocation(line: 335, column: 49, scope: !355)
!396 = !DILocation(line: 337, column: 16, scope: !355)
!397 = !DILocation(line: 337, column: 25, scope: !355)
!398 = !DILocation(line: 337, column: 41, scope: !355)
!399 = !DILocation(line: 337, column: 9, scope: !355)
!400 = !DILocation(line: 337, column: 3, scope: !355)
!401 = !DILocation(line: 336, column: 49, scope: !355)
!402 = !DILocation(line: 330, column: 2, scope: !355)
!403 = !DILocation(line: 330, column: 10, scope: !355)
!404 = !DILocation(line: 338, column: 13, scope: !355)
!405 = !DILocation(line: 338, column: 22, scope: !355)
!406 = !DILocation(line: 338, column: 2, scope: !355)
!407 = !DILocation(line: 338, column: 11, scope: !355)
!408 = !DILocation(line: 339, column: 2, scope: !355)
!409 = !DILocation(line: 339, column: 10, scope: !355)
!410 = !DILocation(line: 341, column: 1, scope: !355)
!411 = distinct !DISubprogram(name: "task_BW_btbl_bitcount", scope: !3, file: !3, line: 342, type: !19, scopeLine: 342, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !412)
!412 = !{!413}
!413 = !DILocalVariable(name: "U", scope: !411, file: !3, line: 348, type: !414)
!414 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !411, file: !3, line: 344, size: 32, elements: !415)
!415 = !{!416, !420}
!416 = !DIDerivedType(tag: DW_TAG_member, name: "ch", scope: !414, file: !3, line: 346, baseType: !417, size: 32)
!417 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32, elements: !418)
!418 = !{!419}
!419 = !DISubrange(count: 4)
!420 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !414, file: !3, line: 347, baseType: !421, size: 32)
!421 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!422 = !DILocation(line: 344, column: 2, scope: !411)
!423 = !DILocation(line: 348, column: 4, scope: !411)
!424 = !DILocation(line: 350, column: 8, scope: !411)
!425 = !DILocation(line: 350, column: 4, scope: !411)
!426 = !DILocation(line: 350, column: 6, scope: !411)
!427 = !DILocation(line: 352, column: 21, scope: !411)
!428 = !DILocation(line: 352, column: 19, scope: !411)
!429 = !DILocation(line: 352, column: 13, scope: !411)
!430 = !DILocation(line: 352, column: 39, scope: !411)
!431 = !DILocation(line: 352, column: 37, scope: !411)
!432 = !DILocation(line: 352, column: 31, scope: !411)
!433 = !DILocation(line: 352, column: 29, scope: !411)
!434 = !DILocation(line: 353, column: 11, scope: !411)
!435 = !DILocation(line: 353, column: 9, scope: !411)
!436 = !DILocation(line: 353, column: 3, scope: !411)
!437 = !DILocation(line: 352, column: 47, scope: !411)
!438 = !DILocation(line: 353, column: 29, scope: !411)
!439 = !DILocation(line: 353, column: 27, scope: !411)
!440 = !DILocation(line: 353, column: 21, scope: !411)
!441 = !DILocation(line: 353, column: 19, scope: !411)
!442 = !DILocation(line: 352, column: 2, scope: !411)
!443 = !DILocation(line: 352, column: 10, scope: !411)
!444 = !DILocation(line: 354, column: 13, scope: !411)
!445 = !DILocation(line: 354, column: 22, scope: !411)
!446 = !DILocation(line: 354, column: 2, scope: !411)
!447 = !DILocation(line: 354, column: 11, scope: !411)
!448 = !DILocation(line: 355, column: 2, scope: !411)
!449 = !DILocation(line: 355, column: 10, scope: !411)
!450 = !DILocation(line: 357, column: 1, scope: !411)
!451 = distinct !DISubprogram(name: "task_AR_btbl_bitcount", scope: !3, file: !3, line: 358, type: !19, scopeLine: 358, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !452)
!452 = !{!453, !454}
!453 = !DILocalVariable(name: "Ptr", scope: !451, file: !3, line: 360, type: !13)
!454 = !DILocalVariable(name: "Accu", scope: !451, file: !3, line: 361, type: !12)
!455 = !DILocation(line: 360, column: 2, scope: !451)
!456 = !DILocation(line: 360, column: 18, scope: !451)
!457 = !DILocation(line: 360, column: 43, scope: !451)
!458 = !DILocation(line: 360, column: 24, scope: !451)
!459 = !DILocation(line: 361, column: 2, scope: !451)
!460 = !DILocation(line: 361, column: 6, scope: !451)
!461 = !DILocation(line: 363, column: 20, scope: !451)
!462 = !DILocation(line: 363, column: 16, scope: !451)
!463 = !DILocation(line: 363, column: 10, scope: !451)
!464 = !DILocation(line: 363, column: 8, scope: !451)
!465 = !DILocation(line: 364, column: 20, scope: !451)
!466 = !DILocation(line: 364, column: 16, scope: !451)
!467 = !DILocation(line: 364, column: 10, scope: !451)
!468 = !DILocation(line: 364, column: 7, scope: !451)
!469 = !DILocation(line: 365, column: 20, scope: !451)
!470 = !DILocation(line: 365, column: 16, scope: !451)
!471 = !DILocation(line: 365, column: 10, scope: !451)
!472 = !DILocation(line: 365, column: 7, scope: !451)
!473 = !DILocation(line: 366, column: 17, scope: !451)
!474 = !DILocation(line: 366, column: 16, scope: !451)
!475 = !DILocation(line: 366, column: 10, scope: !451)
!476 = !DILocation(line: 366, column: 7, scope: !451)
!477 = !DILocation(line: 367, column: 12, scope: !451)
!478 = !DILocation(line: 367, column: 2, scope: !451)
!479 = !DILocation(line: 367, column: 9, scope: !451)
!480 = !DILocation(line: 368, column: 13, scope: !451)
!481 = !DILocation(line: 368, column: 22, scope: !451)
!482 = !DILocation(line: 368, column: 2, scope: !451)
!483 = !DILocation(line: 368, column: 11, scope: !451)
!484 = !DILocation(line: 369, column: 2, scope: !451)
!485 = !DILocation(line: 369, column: 10, scope: !451)
!486 = !DILocation(line: 371, column: 1, scope: !451)
!487 = distinct !DISubprogram(name: "task_bit_shifter", scope: !3, file: !3, line: 372, type: !19, scopeLine: 372, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !488)
!488 = !{!489, !490, !491}
!489 = !DILocalVariable(name: "i", scope: !487, file: !3, line: 374, type: !12)
!490 = !DILocalVariable(name: "nn", scope: !487, file: !3, line: 374, type: !12)
!491 = !DILocalVariable(name: "tmp_seed", scope: !487, file: !3, line: 375, type: !7)
!492 = !DILocation(line: 374, column: 2, scope: !487)
!493 = !DILocation(line: 374, column: 6, scope: !487)
!494 = !DILocation(line: 374, column: 9, scope: !487)
!495 = !DILocation(line: 375, column: 2, scope: !487)
!496 = !DILocation(line: 375, column: 11, scope: !487)
!497 = !DILocation(line: 375, column: 22, scope: !487)
!498 = !DILocation(line: 376, column: 14, scope: !499)
!499 = distinct !DILexicalBlock(scope: !487, file: !3, line: 376, column: 2)
!500 = !DILocation(line: 376, column: 9, scope: !499)
!501 = !DILocation(line: 376, column: 7, scope: !499)
!502 = !DILocation(line: 376, column: 19, scope: !503)
!503 = distinct !DILexicalBlock(scope: !499, file: !3, line: 376, column: 2)
!504 = !DILocation(line: 376, column: 28, scope: !503)
!505 = !DILocation(line: 376, column: 32, scope: !503)
!506 = !DILocation(line: 376, column: 34, scope: !503)
!507 = !DILocation(line: 0, scope: !503)
!508 = !DILocation(line: 376, column: 2, scope: !499)
!509 = !DILocation(line: 377, column: 15, scope: !503)
!510 = !DILocation(line: 377, column: 24, scope: !503)
!511 = !DILocation(line: 377, column: 9, scope: !503)
!512 = !DILocation(line: 377, column: 6, scope: !503)
!513 = !DILocation(line: 377, column: 3, scope: !503)
!514 = !DILocation(line: 376, column: 64, scope: !503)
!515 = !DILocation(line: 376, column: 78, scope: !503)
!516 = !DILocation(line: 376, column: 2, scope: !503)
!517 = distinct !{!517, !508, !518}
!518 = !DILocation(line: 377, column: 28, scope: !499)
!519 = !DILocation(line: 378, column: 13, scope: !487)
!520 = !DILocation(line: 378, column: 2, scope: !487)
!521 = !DILocation(line: 378, column: 10, scope: !487)
!522 = !DILocation(line: 379, column: 13, scope: !487)
!523 = !DILocation(line: 379, column: 22, scope: !487)
!524 = !DILocation(line: 379, column: 2, scope: !487)
!525 = !DILocation(line: 379, column: 11, scope: !487)
!526 = !DILocation(line: 381, column: 2, scope: !487)
!527 = !DILocation(line: 381, column: 10, scope: !487)
!528 = !DILocation(line: 383, column: 1, scope: !487)
!529 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 385, type: !19, scopeLine: 385, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!530 = !DILocation(line: 387, column: 2, scope: !529)
!531 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 390, type: !19, scopeLine: 390, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!532 = !DILocation(line: 392, column: 1, scope: !531)
!533 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 394, type: !534, scopeLine: 394, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!534 = !DISubroutineType(types: !535)
!535 = !{!12}
!536 = !DILocation(line: 396, column: 16, scope: !533)
!537 = !DILocation(line: 397, column: 10, scope: !533)
!538 = !DILocation(line: 398, column: 12, scope: !533)
!539 = !DILocation(line: 77, column: 10, scope: !74, inlinedAt: !540)
!540 = distinct !DILocation(line: 399, column: 5, scope: !533)
!541 = !DILocation(line: 79, column: 9, scope: !74, inlinedAt: !540)
!542 = !DILocation(line: 81, column: 9, scope: !74, inlinedAt: !540)
!543 = !DILocation(line: 86, column: 11, scope: !74, inlinedAt: !540)
!544 = !DILocation(line: 91, column: 12, scope: !74, inlinedAt: !540)
!545 = !DILocation(line: 92, column: 10, scope: !74, inlinedAt: !540)
!546 = !DILocation(line: 93, column: 10, scope: !74, inlinedAt: !540)
!547 = !DILocation(line: 95, column: 10, scope: !74, inlinedAt: !540)
!548 = !DILocation(line: 96, column: 12, scope: !74, inlinedAt: !540)
!549 = !DILocation(line: 99, column: 10, scope: !74, inlinedAt: !540)
!550 = !DILocation(line: 401, column: 2, scope: !533)
!551 = !DILocation(line: 403, column: 2, scope: !533)
!552 = !DILocation(line: 405, column: 3, scope: !553)
!553 = distinct !DILexicalBlock(scope: !533, file: !3, line: 403, column: 11)
!554 = !DILocation(line: 407, column: 7, scope: !555)
!555 = distinct !DILexicalBlock(scope: !553, file: !3, line: 407, column: 7)
!556 = !DILocation(line: 407, column: 7, scope: !553)
!557 = !DILocation(line: 457, column: 11, scope: !558)
!558 = distinct !DILexicalBlock(scope: !559, file: !3, line: 455, column: 30)
!559 = distinct !DILexicalBlock(scope: !560, file: !3, line: 455, column: 14)
!560 = distinct !DILexicalBlock(scope: !561, file: !3, line: 447, column: 14)
!561 = distinct !DILexicalBlock(scope: !562, file: !3, line: 439, column: 14)
!562 = distinct !DILexicalBlock(scope: !563, file: !3, line: 431, column: 14)
!563 = distinct !DILexicalBlock(scope: !564, file: !3, line: 423, column: 14)
!564 = distinct !DILexicalBlock(scope: !555, file: !3, line: 415, column: 14)
!565 = !DILocation(line: 457, column: 21, scope: !558)
!566 = !DILocation(line: 457, column: 4, scope: !558)
!567 = distinct !{!567, !551, !568}
!568 = !DILocation(line: 468, column: 2, scope: !533)
!569 = !DILocation(line: 449, column: 11, scope: !570)
!570 = distinct !DILexicalBlock(scope: !560, file: !3, line: 447, column: 30)
!571 = !DILocation(line: 449, column: 21, scope: !570)
!572 = !DILocation(line: 449, column: 4, scope: !570)
!573 = !DILocation(line: 441, column: 11, scope: !574)
!574 = distinct !DILexicalBlock(scope: !561, file: !3, line: 439, column: 30)
!575 = !DILocation(line: 441, column: 21, scope: !574)
!576 = !DILocation(line: 441, column: 4, scope: !574)
!577 = !DILocation(line: 433, column: 11, scope: !578)
!578 = distinct !DILexicalBlock(scope: !562, file: !3, line: 431, column: 30)
!579 = !DILocation(line: 433, column: 21, scope: !578)
!580 = !DILocation(line: 433, column: 4, scope: !578)
!581 = !DILocation(line: 425, column: 11, scope: !582)
!582 = distinct !DILexicalBlock(scope: !563, file: !3, line: 423, column: 30)
!583 = !DILocation(line: 425, column: 21, scope: !582)
!584 = !DILocation(line: 425, column: 4, scope: !582)
!585 = !DILocation(line: 417, column: 11, scope: !586)
!586 = distinct !DILexicalBlock(scope: !564, file: !3, line: 415, column: 30)
!587 = !DILocation(line: 417, column: 21, scope: !586)
!588 = !DILocation(line: 417, column: 4, scope: !586)
!589 = !DILocation(line: 409, column: 11, scope: !590)
!590 = distinct !DILexicalBlock(scope: !555, file: !3, line: 407, column: 22)
!591 = !DILocation(line: 409, column: 21, scope: !590)
!592 = !DILocation(line: 409, column: 4, scope: !590)
!593 = !DILocation(line: 411, column: 5, scope: !594)
!594 = distinct !DILexicalBlock(scope: !590, file: !3, line: 409, column: 29)
!595 = !DILocation(line: 419, column: 5, scope: !596)
!596 = distinct !DILexicalBlock(scope: !586, file: !3, line: 417, column: 29)
!597 = !DILocation(line: 427, column: 5, scope: !598)
!598 = distinct !DILexicalBlock(scope: !582, file: !3, line: 425, column: 29)
!599 = !DILocation(line: 435, column: 5, scope: !600)
!600 = distinct !DILexicalBlock(scope: !578, file: !3, line: 433, column: 29)
!601 = !DILocation(line: 443, column: 5, scope: !602)
!602 = distinct !DILexicalBlock(scope: !574, file: !3, line: 441, column: 29)
!603 = !DILocation(line: 451, column: 5, scope: !604)
!604 = distinct !DILexicalBlock(scope: !570, file: !3, line: 449, column: 29)
!605 = !DILocation(line: 459, column: 5, scope: !606)
!606 = distinct !DILexicalBlock(scope: !558, file: !3, line: 457, column: 29)
!607 = !DILocation(line: 465, column: 4, scope: !608)
!608 = distinct !DILexicalBlock(scope: !609, file: !3, line: 463, column: 30)
!609 = distinct !DILexicalBlock(scope: !559, file: !3, line: 463, column: 14)
