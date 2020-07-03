; ModuleID = 'camel_cem_mod.bc'
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !23
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !70
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !14
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !9
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !72
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local void @camel_init() #0 !dbg !84 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !85, !tbaa !86
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !90, !tbaa !91
  %conv = zext i8 %0 to i16, !dbg !90
  %or = or i16 %conv, 1, !dbg !90
  %conv1 = trunc i16 %or to i8, !dbg !90
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !90, !tbaa !91
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !92, !tbaa !91
  %conv2 = zext i8 %1 to i16, !dbg !92
  %and = and i16 %conv2, -2, !dbg !92
  %conv3 = trunc i16 %and to i8, !dbg !92
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !92, !tbaa !91
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !93, !tbaa !86
  %and4 = and i16 %2, -2, !dbg !93
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
define dso_local void @camel_recover() #0 !dbg !101 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !107, !tbaa !109
  %cmp = icmp eq i16 %0, 1, !dbg !115
  br i1 %cmp, label %if.then, label %if.else, !dbg !116

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !117, !tbaa !119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !121, !tbaa !119
  br label %if.end4, !dbg !122

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !123, !tbaa !109
  %cmp1 = icmp eq i16 %1, 2, !dbg !125
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !126

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !127, !tbaa !119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !129, !tbaa !119
  br label %if.end, !dbg !130

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !131
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !133, !tbaa !119
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !133
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !133
  %3 = load i16, i16* %arrayidx, align 2, !dbg !133, !tbaa !135
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #7, !dbg !133, !srcloc !136
  %4 = bitcast i16* %__x to i8*, !dbg !137
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #7, !dbg !137
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !103, metadata !DIExpression()), !dbg !137
  %5 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !137, !srcloc !138
  store i16 %5, i16* %__x, align 2, !dbg !137, !tbaa !86
  %6 = load i16, i16* %__x, align 2, !dbg !137, !tbaa !86
  store i16 %6, i16* %tmp, align 2, !dbg !137, !tbaa !86
  %7 = bitcast i16* %__x to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #7, !dbg !139
  %8 = load i16, i16* %tmp, align 2, !dbg !137, !tbaa !86
  %add = add i16 %8, 2, !dbg !140
  %9 = inttoptr i16 %add to i8*, !dbg !139
  %10 = bitcast i16* %__x5 to i8*, !dbg !141
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #7, !dbg !141
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !105, metadata !DIExpression()), !dbg !141
  %11 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !141, !srcloc !142
  store i16 %11, i16* %__x5, align 2, !dbg !141, !tbaa !86
  %12 = load i16, i16* %__x5, align 2, !dbg !141, !tbaa !86
  store i16 %12, i16* %tmp6, align 2, !dbg !141, !tbaa !86
  %13 = bitcast i16* %__x5 to i8*, !dbg !143
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %13) #7, !dbg !143
  %14 = load i16, i16* %tmp6, align 2, !dbg !141, !tbaa !86
  %add7 = add i16 %14, 2, !dbg !144
  %sub = sub i16 9216, %add7, !dbg !145
  %call = call zeroext i16 @__fast_hw_crc(i8* %9, i16 zeroext %sub, i16 zeroext -1), !dbg !146
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !147, !tbaa !135
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !148, !tbaa !119
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !148
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !149, !tbaa !135
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 924, i16 zeroext %17), !dbg !150
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !151, !tbaa !135
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !152, !tbaa !135
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !154, !tbaa !119
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !155
  %20 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !155, !tbaa !156
  %cmp9 = icmp eq i16 %18, %20, !dbg !157
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !158

if.then10:                                        ; preds = %if.end4
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159, !tbaa !119
  %22 = bitcast %struct.camel_buffer_t* %21 to i8*, !dbg !161
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162, !tbaa !119
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %22, i8* align 2 %24, i16 926, i1 false), !dbg !161
  call void @camel_init(), !dbg !163
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !164, !tbaa !119
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !165
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !164
  call void @__restore_registers(i16* %arraydecay), !dbg !166
  br label %if.end13, !dbg !167

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !168
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !170
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #2

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind
define dso_local void @commit() #4 !dbg !171 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !185

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !186, !tbaa !109
  %cmp = icmp eq i16 %0, 1, !dbg !187
  br i1 %cmp, label %if.then, label %if.else, !dbg !188

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !189, !tbaa !119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !190, !tbaa !119
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !191, !tbaa !119
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !192
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !191
  call void @__dump_registers(i16* %arraydecay), !dbg !193
  %2 = bitcast i16* %__x to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #7, !dbg !194
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !173, metadata !DIExpression()), !dbg !194
  %3 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !194, !srcloc !195
  store i16 %3, i16* %__x, align 2, !dbg !194, !tbaa !86
  %4 = load i16, i16* %__x, align 2, !dbg !194, !tbaa !86
  store i16 %4, i16* %tmp, align 2, !dbg !194, !tbaa !86
  %5 = bitcast i16* %__x to i8*, !dbg !196
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #7, !dbg !196
  %6 = load i16, i16* %tmp, align 2, !dbg !194, !tbaa !86
  %add = add i16 %6, 2, !dbg !197
  %7 = inttoptr i16 %add to i8*, !dbg !196
  %8 = bitcast i16* %__x1 to i8*, !dbg !198
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #7, !dbg !198
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !178, metadata !DIExpression()), !dbg !198
  %9 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !198, !srcloc !199
  store i16 %9, i16* %__x1, align 2, !dbg !198, !tbaa !86
  %10 = load i16, i16* %__x1, align 2, !dbg !198, !tbaa !86
  store i16 %10, i16* %tmp2, align 2, !dbg !198, !tbaa !86
  %11 = bitcast i16* %__x1 to i8*, !dbg !200
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #7, !dbg !200
  %12 = load i16, i16* %tmp2, align 2, !dbg !198, !tbaa !86
  %add3 = add i16 %12, 2, !dbg !201
  %sub = sub i16 9216, %add3, !dbg !202
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !203
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !204, !tbaa !135
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !205, !tbaa !119
  %14 = bitcast %struct.camel_buffer_t* %13 to i8*, !dbg !205
  %15 = load i16, i16* @tmp_stack_crc, align 2, !dbg !206, !tbaa !135
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %14, i16 zeroext 924, i16 zeroext %15), !dbg !207
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !208, !tbaa !135
  %16 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !209, !tbaa !135
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !210, !tbaa !119
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 2, !dbg !211
  store i16 %16, i16* %stack_and_buf_crc, align 2, !dbg !212, !tbaa !156
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !213, !tbaa !109
  br label %if.end, !dbg !214

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !215, !tbaa !119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !216, !tbaa !119
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !217, !tbaa !119
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !218
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !217
  call void @__dump_registers(i16* %arraydecay6), !dbg !219
  %19 = bitcast i16* %__x7 to i8*, !dbg !220
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %19) #7, !dbg !220
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !180, metadata !DIExpression()), !dbg !220
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !220, !srcloc !221
  store i16 %20, i16* %__x7, align 2, !dbg !220, !tbaa !86
  %21 = load i16, i16* %__x7, align 2, !dbg !220, !tbaa !86
  store i16 %21, i16* %tmp8, align 2, !dbg !220, !tbaa !86
  %22 = bitcast i16* %__x7 to i8*, !dbg !222
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #7, !dbg !222
  %23 = load i16, i16* %tmp8, align 2, !dbg !220, !tbaa !86
  %add9 = add i16 %23, 2, !dbg !223
  %24 = inttoptr i16 %add9 to i8*, !dbg !222
  %25 = bitcast i16* %__x10 to i8*, !dbg !224
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %25) #7, !dbg !224
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !183, metadata !DIExpression()), !dbg !224
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !224, !srcloc !225
  store i16 %26, i16* %__x10, align 2, !dbg !224, !tbaa !86
  %27 = load i16, i16* %__x10, align 2, !dbg !224, !tbaa !86
  store i16 %27, i16* %tmp11, align 2, !dbg !224, !tbaa !86
  %28 = bitcast i16* %__x10 to i8*, !dbg !226
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #7, !dbg !226
  %29 = load i16, i16* %tmp11, align 2, !dbg !224, !tbaa !86
  %add12 = add i16 %29, 2, !dbg !227
  %sub13 = sub i16 9216, %add12, !dbg !228
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub13, i16 zeroext -1), !dbg !229
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !230, !tbaa !135
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !231, !tbaa !119
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !231
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !232, !tbaa !135
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 924, i16 zeroext %32), !dbg !233
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !234, !tbaa !135
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !235, !tbaa !135
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !236, !tbaa !119
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !237
  store i16 %33, i16* %stack_and_buf_crc16, align 2, !dbg !238, !tbaa !156
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !239, !tbaa !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !240

do.end:                                           ; preds = %if.end
  ret void, !dbg !241
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #5 !dbg !242 {
entry:
  %node = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !248, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !248
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !248
  store i16 0, i16* %parent_next, align 2, !dbg !249, !tbaa !250
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !251
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !251
  store i16 0, i16* %out_len, align 2, !dbg !252, !tbaa !253
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254, !tbaa !119
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !254
  %letter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !254
  store i16 0, i16* %letter, align 2, !dbg !255, !tbaa !256
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !257, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !257
  %prev_sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !257
  store i16 0, i16* %prev_sample, align 2, !dbg !258, !tbaa !259
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !260, !tbaa !119
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !260
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !260
  store i16 0, i16* %letter_idx, align 2, !dbg !261, !tbaa !262
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !263, !tbaa !119
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !263
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !263
  store i16 1, i16* %sample_count, align 2, !dbg !264, !tbaa !265
  br label %while.cond, !dbg !266

while.cond:                                       ; preds = %while.body, %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !267, !tbaa !119
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !267
  %letter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 0, !dbg !267
  %7 = load i16, i16* %letter7, align 2, !dbg !267, !tbaa !256
  %cmp = icmp ult i16 %7, 64, !dbg !268
  br i1 %cmp, label %while.body, label %while.end, !dbg !266

while.body:                                       ; preds = %while.cond
  %8 = bitcast %struct._node_t* %node to i8*, !dbg !269
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %8) #7, !dbg !269
  call void @llvm.dbg.declare(metadata %struct._node_t* %node, metadata !244, metadata !DIExpression()), !dbg !270
  %letter8 = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 0, !dbg !271
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272, !tbaa !119
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !272
  %letter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !272
  %10 = load i16, i16* %letter10, align 2, !dbg !272, !tbaa !256
  store i16 %10, i16* %letter8, align 2, !dbg !271, !tbaa !273
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 1, !dbg !271
  store i16 0, i16* %sibling, align 2, !dbg !271, !tbaa !274
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 2, !dbg !271
  store i16 0, i16* %child, align 2, !dbg !271, !tbaa !275
  %11 = bitcast i16* %i to i8*, !dbg !276
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %11) #7, !dbg !276
  call void @llvm.dbg.declare(metadata i16* %i, metadata !246, metadata !DIExpression()), !dbg !277
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278, !tbaa !119
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !278
  %letter12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !278
  %13 = load i16, i16* %letter12, align 2, !dbg !278, !tbaa !256
  store i16 %13, i16* %i, align 2, !dbg !277, !tbaa !86
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279, !tbaa !119
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !279
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !279
  %15 = load i16, i16* %i, align 2, !dbg !280, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %15, !dbg !279
  %16 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !281
  %17 = bitcast %struct._node_t* %node to i8*, !dbg !281
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %16, i8* align 2 %17, i16 6, i1 false), !dbg !281, !tbaa.struct !282
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283, !tbaa !119
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !283
  %letter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !283
  %19 = load i16, i16* %letter15, align 2, !dbg !284, !tbaa !256
  %inc = add i16 %19, 1, !dbg !284
  store i16 %inc, i16* %letter15, align 2, !dbg !284, !tbaa !256
  %20 = bitcast i16* %i to i8*, !dbg !285
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %20) #7, !dbg !285
  %21 = bitcast %struct._node_t* %node to i8*, !dbg !285
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %21) #7, !dbg !285
  br label %while.cond, !dbg !266, !llvm.loop !286

while.end:                                        ; preds = %while.cond
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287, !tbaa !119
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !287
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 4, !dbg !287
  store i16 64, i16* %node_count, align 2, !dbg !288, !tbaa !289
  ret void, !dbg !290
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #5 !dbg !291 {
entry:
  %next_letter_idx = alloca i16, align 2
  %0 = bitcast i16* %next_letter_idx to i8*, !dbg !294
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !294
  call void @llvm.dbg.declare(metadata i16* %next_letter_idx, metadata !293, metadata !DIExpression()), !dbg !295
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !296, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !296
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !296
  %2 = load i16, i16* %letter_idx, align 2, !dbg !296, !tbaa !262
  %add = add i16 %2, 1, !dbg !297
  store i16 %add, i16* %next_letter_idx, align 2, !dbg !295, !tbaa !86
  %3 = load i16, i16* %next_letter_idx, align 2, !dbg !298, !tbaa !86
  %cmp = icmp eq i16 %3, 2, !dbg !300
  br i1 %cmp, label %if.then, label %if.end, !dbg !301

if.then:                                          ; preds = %entry
  store i16 0, i16* %next_letter_idx, align 2, !dbg !302, !tbaa !86
  br label %if.end, !dbg !303

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !304
  %letter_idx2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !304
  %5 = load i16, i16* %letter_idx2, align 2, !dbg !304, !tbaa !262
  %cmp3 = icmp eq i16 %5, 0, !dbg !306
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !307

if.then4:                                         ; preds = %if.end
  %6 = load i16, i16* %next_letter_idx, align 2, !dbg !308, !tbaa !86
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310, !tbaa !119
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !310
  %letter_idx6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !310
  store i16 %6, i16* %letter_idx6, align 2, !dbg !311, !tbaa !262
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !312, !tbaa !119
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !312
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 16, !dbg !312
  store i16 0, i16* %check, align 2, !dbg !313, !tbaa !314
  br label %if.end12, !dbg !315

if.else:                                          ; preds = %if.end
  %9 = load i16, i16* %next_letter_idx, align 2, !dbg !316, !tbaa !86
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !318, !tbaa !119
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !318
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !318
  store i16 %9, i16* %letter_idx9, align 2, !dbg !319, !tbaa !262
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320, !tbaa !119
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !320
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !320
  store i16 1, i16* %check11, align 2, !dbg !321, !tbaa !314
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then4
  %12 = bitcast i16* %next_letter_idx to i8*, !dbg !322
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %12) #7, !dbg !322
  ret void, !dbg !322
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_measure_temp() #5 !dbg !323 {
entry:
  %prev_sample = alloca i16, align 2
  %sample = alloca i16, align 2
  %0 = bitcast i16* %prev_sample to i8*, !dbg !327
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !327
  call void @llvm.dbg.declare(metadata i16* %prev_sample, metadata !325, metadata !DIExpression()), !dbg !328
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !329
  %prev_sample1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !329
  %2 = load i16, i16* %prev_sample1, align 2, !dbg !329, !tbaa !259
  store i16 %2, i16* %prev_sample, align 2, !dbg !330, !tbaa !86
  %3 = bitcast i16* %sample to i8*, !dbg !331
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #7, !dbg !331
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !326, metadata !DIExpression()), !dbg !332
  %4 = load i16, i16* %prev_sample, align 2, !dbg !333, !tbaa !86
  %call = call i16 @acquire_sample(i16 %4), !dbg !334
  store i16 %call, i16* %sample, align 2, !dbg !332, !tbaa !86
  %5 = load i16, i16* %sample, align 2, !dbg !335, !tbaa !86
  store i16 %5, i16* %prev_sample, align 2, !dbg !336, !tbaa !86
  %6 = load i16, i16* %prev_sample, align 2, !dbg !337, !tbaa !86
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338, !tbaa !119
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !338
  %prev_sample3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !338
  store i16 %6, i16* %prev_sample3, align 2, !dbg !339, !tbaa !259
  %8 = load i16, i16* %sample, align 2, !dbg !340, !tbaa !86
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341, !tbaa !119
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !341
  %sample5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !341
  store i16 %8, i16* %sample5, align 2, !dbg !342, !tbaa !343
  %10 = bitcast i16* %sample to i8*, !dbg !344
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #7, !dbg !344
  %11 = bitcast i16* %prev_sample to i8*, !dbg !344
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #7, !dbg !344
  ret void, !dbg !344
}

; Function Attrs: nounwind
define internal i16 @acquire_sample(i16 %prev_sample) #0 !dbg !345 {
entry:
  %prev_sample.addr = alloca i16, align 2
  %sample = alloca i16, align 2
  store i16 %prev_sample, i16* %prev_sample.addr, align 2, !tbaa !86
  call void @llvm.dbg.declare(metadata i16* %prev_sample.addr, metadata !349, metadata !DIExpression()), !dbg !351
  %0 = bitcast i16* %sample to i8*, !dbg !352
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !352
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !350, metadata !DIExpression()), !dbg !353
  %1 = load i16, i16* %prev_sample.addr, align 2, !dbg !354, !tbaa !86
  %add = add i16 %1, 1, !dbg !355
  %and = and i16 %add, 3, !dbg !356
  store i16 %and, i16* %sample, align 2, !dbg !353, !tbaa !86
  %2 = load i16, i16* %sample, align 2, !dbg !357, !tbaa !86
  %3 = bitcast i16* %sample to i8*, !dbg !358
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %3) #7, !dbg !358
  ret i16 %2, !dbg !359
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_letterize() #5 !dbg !360 {
entry:
  %letter_idx = alloca i16, align 2
  %letter_shift = alloca i16, align 2
  %letter = alloca i16, align 2
  %0 = bitcast i16* %letter_idx to i8*, !dbg !365
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !365
  call void @llvm.dbg.declare(metadata i16* %letter_idx, metadata !362, metadata !DIExpression()), !dbg !366
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !367
  %letter_idx1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !367
  %2 = load i16, i16* %letter_idx1, align 2, !dbg !367, !tbaa !262
  store i16 %2, i16* %letter_idx, align 2, !dbg !366, !tbaa !86
  %3 = load i16, i16* %letter_idx, align 2, !dbg !368, !tbaa !86
  %cmp = icmp eq i16 %3, 0, !dbg !370
  br i1 %cmp, label %if.then, label %if.else, !dbg !371

if.then:                                          ; preds = %entry
  store i16 2, i16* %letter_idx, align 2, !dbg !372, !tbaa !86
  br label %if.end, !dbg !373

if.else:                                          ; preds = %entry
  %4 = load i16, i16* %letter_idx, align 2, !dbg !374, !tbaa !86
  %dec = add i16 %4, -1, !dbg !374
  store i16 %dec, i16* %letter_idx, align 2, !dbg !374, !tbaa !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = bitcast i16* %letter_shift to i8*, !dbg !375
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #7, !dbg !375
  call void @llvm.dbg.declare(metadata i16* %letter_shift, metadata !363, metadata !DIExpression()), !dbg !376
  %6 = load i16, i16* %letter_idx, align 2, !dbg !377, !tbaa !86
  %mul = mul i16 8, %6, !dbg !378
  store i16 %mul, i16* %letter_shift, align 2, !dbg !376, !tbaa !86
  %7 = bitcast i16* %letter to i8*, !dbg !379
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #7, !dbg !379
  call void @llvm.dbg.declare(metadata i16* %letter, metadata !364, metadata !DIExpression()), !dbg !380
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !381, !tbaa !119
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !381
  %sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 6, !dbg !381
  %9 = load i16, i16* %sample, align 2, !dbg !381, !tbaa !343
  %10 = load i16, i16* %letter_shift, align 2, !dbg !382, !tbaa !86
  %shl = shl i16 63, %10, !dbg !383
  %and = and i16 %9, %shl, !dbg !384
  %11 = load i16, i16* %letter_shift, align 2, !dbg !385, !tbaa !86
  %shr = lshr i16 %and, %11, !dbg !386
  store i16 %shr, i16* %letter, align 2, !dbg !380, !tbaa !86
  %12 = load i16, i16* %letter, align 2, !dbg !387, !tbaa !86
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !388
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !388
  store i16 %12, i16* %letter4, align 2, !dbg !389, !tbaa !256
  %14 = bitcast i16* %letter to i8*, !dbg !390
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #7, !dbg !390
  %15 = bitcast i16* %letter_shift to i8*, !dbg !390
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %15) #7, !dbg !390
  %16 = bitcast i16* %letter_idx to i8*, !dbg !390
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %16) #7, !dbg !390
  ret void, !dbg !390
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_compress() #5 !dbg !391 {
entry:
  %parent_node = alloca %struct._node_t, align 2
  %parent = alloca i16, align 2
  %0 = bitcast %struct._node_t* %parent_node to i8*, !dbg !395
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %0) #7, !dbg !395
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node, metadata !393, metadata !DIExpression()), !dbg !396
  %1 = bitcast i16* %parent to i8*, !dbg !397
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #7, !dbg !397
  call void @llvm.dbg.declare(metadata i16* %parent, metadata !394, metadata !DIExpression()), !dbg !398
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !399
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !399
  %3 = load i16, i16* %parent_next, align 2, !dbg !399, !tbaa !250
  store i16 %3, i16* %parent, align 2, !dbg !398, !tbaa !86
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !400, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !400
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !400
  %5 = load i16, i16* %parent, align 2, !dbg !401, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !400
  %6 = bitcast %struct._node_t* %parent_node to i8*, !dbg !400
  %7 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !400
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 6, i1 false), !dbg !400, !tbaa.struct !282
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !402
  %8 = load i16, i16* %child, align 2, !dbg !402, !tbaa !275
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403, !tbaa !119
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !403
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !403
  store i16 %8, i16* %sibling, align 2, !dbg !404, !tbaa !405
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !406, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !406
  %parent_node4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !406
  %11 = bitcast %struct._node_t* %parent_node4 to i8*, !dbg !407
  %12 = bitcast %struct._node_t* %parent_node to i8*, !dbg !407
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %12, i16 6, i1 false), !dbg !407, !tbaa.struct !282
  %13 = load i16, i16* %parent, align 2, !dbg !408, !tbaa !86
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !409, !tbaa !119
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !409
  %parent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !409
  store i16 %13, i16* %parent6, align 2, !dbg !410, !tbaa !411
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !412
  %15 = load i16, i16* %child7, align 2, !dbg !412, !tbaa !275
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413, !tbaa !119
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !413
  %child9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !413
  store i16 %15, i16* %child9, align 2, !dbg !414, !tbaa !415
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !416, !tbaa !119
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !416
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 7, !dbg !416
  %18 = load i16, i16* %sample_count, align 2, !dbg !417, !tbaa !265
  %inc = add i16 %18, 1, !dbg !417
  store i16 %inc, i16* %sample_count, align 2, !dbg !417, !tbaa !265
  %19 = bitcast i16* %parent to i8*, !dbg !418
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %19) #7, !dbg !418
  %20 = bitcast %struct._node_t* %parent_node to i8*, !dbg !418
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %20) #7, !dbg !418
  ret void, !dbg !418
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_find_sibling() #5 !dbg !419 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %starting_node_idx = alloca i16, align 2
  %0 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !427
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !427
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !421, metadata !DIExpression()), !dbg !428
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !429
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !429
  %2 = load i16, i16* %sibling, align 2, !dbg !429, !tbaa !405
  %cmp = icmp ne i16 %2, 0, !dbg !430
  br i1 %cmp, label %if.then, label %if.end21, !dbg !431

if.then:                                          ; preds = %entry
  %3 = bitcast i16* %i to i8*, !dbg !432
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #7, !dbg !432
  call void @llvm.dbg.declare(metadata i16* %i, metadata !423, metadata !DIExpression()), !dbg !433
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !434, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !434
  %sibling2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !434
  %5 = load i16, i16* %sibling2, align 2, !dbg !434, !tbaa !405
  store i16 %5, i16* %i, align 2, !dbg !433, !tbaa !86
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !435, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !435
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 5, !dbg !435
  %7 = load i16, i16* %i, align 2, !dbg !436, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %7, !dbg !435
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !437, !tbaa !119
  %8 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !438, !tbaa !119
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %8, i32 0, i32 0, !dbg !440
  %9 = load i16, i16* %letter, align 2, !dbg !440, !tbaa !273
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441, !tbaa !119
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !441
  %letter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !441
  %11 = load i16, i16* %letter5, align 2, !dbg !441, !tbaa !256
  %cmp6 = icmp eq i16 %9, %11, !dbg !442
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !443

if.then7:                                         ; preds = %if.then
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !444, !tbaa !119
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !444
  %sibling9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !444
  %13 = load i16, i16* %sibling9, align 2, !dbg !444, !tbaa !405
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446, !tbaa !119
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !446
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 11, !dbg !446
  store i16 %13, i16* %parent_next, align 2, !dbg !447, !tbaa !250
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !448, !tbaa !119
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !448
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 16, !dbg !448
  store i16 0, i16* %check, align 2, !dbg !449, !tbaa !314
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !450

if.else:                                          ; preds = %if.then
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !451, !tbaa !119
  %sibling12 = getelementptr inbounds %struct._node_t, %struct._node_t* %16, i32 0, i32 1, !dbg !454
  %17 = load i16, i16* %sibling12, align 2, !dbg !454, !tbaa !274
  %cmp13 = icmp ne i16 %17, 0, !dbg !455
  br i1 %cmp13, label %if.then14, label %if.end, !dbg !456

if.then14:                                        ; preds = %if.else
  %18 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !457, !tbaa !119
  %sibling15 = getelementptr inbounds %struct._node_t, %struct._node_t* %18, i32 0, i32 1, !dbg !459
  %19 = load i16, i16* %sibling15, align 2, !dbg !459, !tbaa !274
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !460, !tbaa !119
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !460
  %sibling17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !460
  store i16 %19, i16* %sibling17, align 2, !dbg !461, !tbaa !405
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !462, !tbaa !119
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !462
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !462
  store i16 1, i16* %check19, align 2, !dbg !463, !tbaa !314
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !464

if.end:                                           ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !465
  br label %cleanup, !dbg !465

cleanup:                                          ; preds = %if.end20, %if.then14, %if.then7
  %22 = bitcast i16* %i to i8*, !dbg !465
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #7, !dbg !465
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest, label %cleanup35 [
    i32 0, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %if.end21, !dbg !466

if.end21:                                         ; preds = %cleanup.cont, %entry
  %23 = bitcast i16* %starting_node_idx to i8*, !dbg !467
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %23) #7, !dbg !467
  call void @llvm.dbg.declare(metadata i16* %starting_node_idx, metadata !426, metadata !DIExpression()), !dbg !468
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !469, !tbaa !119
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !469
  %letter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !469
  %25 = load i16, i16* %letter23, align 2, !dbg !469, !tbaa !256
  store i16 %25, i16* %starting_node_idx, align 2, !dbg !468, !tbaa !86
  %26 = load i16, i16* %starting_node_idx, align 2, !dbg !470, !tbaa !86
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !471, !tbaa !119
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !471
  %parent_next25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 11, !dbg !471
  store i16 %26, i16* %parent_next25, align 2, !dbg !472, !tbaa !250
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473, !tbaa !119
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !473
  %child = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !473
  %29 = load i16, i16* %child, align 2, !dbg !473, !tbaa !415
  %cmp27 = icmp eq i16 %29, 0, !dbg !475
  br i1 %cmp27, label %if.then28, label %if.else31, !dbg !476

if.then28:                                        ; preds = %if.end21
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477, !tbaa !119
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !477
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 16, !dbg !477
  store i16 2, i16* %check30, align 2, !dbg !479, !tbaa !314
  br label %if.end34, !dbg !480

if.else31:                                        ; preds = %if.end21
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481, !tbaa !119
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !481
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 16, !dbg !481
  store i16 3, i16* %check33, align 2, !dbg !483, !tbaa !314
  br label %if.end34

if.end34:                                         ; preds = %if.else31, %if.then28
  %32 = bitcast i16* %starting_node_idx to i8*, !dbg !484
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #7, !dbg !484
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !484
  br label %cleanup35, !dbg !484

cleanup35:                                        ; preds = %if.end34, %cleanup
  %33 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !484
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #7, !dbg !484
  %cleanup.dest36 = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest36, label %unreachable [
    i32 0, label %cleanup.cont37
    i32 1, label %cleanup.cont37
  ]

cleanup.cont37:                                   ; preds = %cleanup35, %cleanup35
  ret void, !dbg !484

unreachable:                                      ; preds = %cleanup35
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_node() #5 !dbg !485 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %next_sibling = alloca i16, align 2
  %sibling_node_obj = alloca %struct._node_t, align 2
  %0 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !494
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !494
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !487, metadata !DIExpression()), !dbg !495
  %1 = bitcast i16* %i to i8*, !dbg !496
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #7, !dbg !496
  call void @llvm.dbg.declare(metadata i16* %i, metadata !488, metadata !DIExpression()), !dbg !497
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !498, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !498
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !498
  %3 = load i16, i16* %sibling, align 2, !dbg !498, !tbaa !405
  store i16 %3, i16* %i, align 2, !dbg !497, !tbaa !86
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !499, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !499
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !499
  %5 = load i16, i16* %i, align 2, !dbg !500, !tbaa !86
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !499
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !501, !tbaa !119
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !502, !tbaa !119
  %sibling2 = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 1, !dbg !503
  %7 = load i16, i16* %sibling2, align 2, !dbg !503, !tbaa !274
  %cmp = icmp ne i16 %7, 0, !dbg !504
  br i1 %cmp, label %if.then, label %if.else, !dbg !505

if.then:                                          ; preds = %entry
  %8 = bitcast i16* %next_sibling to i8*, !dbg !506
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #7, !dbg !506
  call void @llvm.dbg.declare(metadata i16* %next_sibling, metadata !489, metadata !DIExpression()), !dbg !507
  %9 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !508, !tbaa !119
  %sibling3 = getelementptr inbounds %struct._node_t, %struct._node_t* %9, i32 0, i32 1, !dbg !509
  %10 = load i16, i16* %sibling3, align 2, !dbg !509, !tbaa !274
  store i16 %10, i16* %next_sibling, align 2, !dbg !507, !tbaa !86
  %11 = load i16, i16* %next_sibling, align 2, !dbg !510, !tbaa !86
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !511, !tbaa !119
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !511
  %sibling5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !511
  store i16 %11, i16* %sibling5, align 2, !dbg !512, !tbaa !405
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !513, !tbaa !119
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !513
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 16, !dbg !513
  store i16 0, i16* %check, align 2, !dbg !514, !tbaa !314
  %14 = bitcast i16* %next_sibling to i8*, !dbg !515
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #7, !dbg !515
  br label %if.end, !dbg !516

if.else:                                          ; preds = %entry
  %15 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !517
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %15) #7, !dbg !517
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !492, metadata !DIExpression()), !dbg !518
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !519, !tbaa !119
  %17 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !520
  %18 = bitcast %struct._node_t* %16 to i8*, !dbg !520
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %17, i8* align 2 %18, i16 6, i1 false), !dbg !520, !tbaa.struct !282
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !521, !tbaa !119
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !521
  %sibling_node8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !521
  %20 = bitcast %struct._node_t* %sibling_node8 to i8*, !dbg !522
  %21 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !522
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %20, i8* align 2 %21, i16 6, i1 false), !dbg !522, !tbaa.struct !282
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !523, !tbaa !119
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !523
  %check10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !523
  store i16 1, i16* %check10, align 2, !dbg !524, !tbaa !314
  %23 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !525
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %23) #7, !dbg !525
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %24 = bitcast i16* %i to i8*, !dbg !526
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %24) #7, !dbg !526
  %25 = bitcast %struct._node_t** %sibling_node to i8*, !dbg !526
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %25) #7, !dbg !526
  ret void, !dbg !526
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() #5 !dbg !527 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %cond = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !537, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !537
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !537
  %1 = load i16, i16* %node_count, align 2, !dbg !537, !tbaa !289
  %cmp = icmp eq i16 %1, 128, !dbg !539
  br i1 %cmp, label %if.then, label %if.end, !dbg !540

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !541
  br label %while.body, !dbg !543

while.body:                                       ; preds = %if.then, %while.body
  br label %while.body, !dbg !543, !llvm.loop !544

if.end:                                           ; preds = %entry
  %2 = bitcast i16* %child to i8*, !dbg !546
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #7, !dbg !546
  call void @llvm.dbg.declare(metadata i16* %child, metadata !529, metadata !DIExpression()), !dbg !547
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !548
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !548
  %4 = load i16, i16* %node_count2, align 2, !dbg !548, !tbaa !289
  store i16 %4, i16* %child, align 2, !dbg !547, !tbaa !86
  %5 = bitcast %struct._node_t* %child_node to i8*, !dbg !549
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %5) #7, !dbg !549
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !530, metadata !DIExpression()), !dbg !550
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !551
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !552, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !552
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !552
  %7 = load i16, i16* %letter4, align 2, !dbg !552, !tbaa !256
  store i16 %7, i16* %letter, align 2, !dbg !551, !tbaa !273
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !551
  store i16 0, i16* %sibling, align 2, !dbg !551, !tbaa !274
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !551
  store i16 0, i16* %child5, align 2, !dbg !551, !tbaa !275
  %8 = bitcast %struct._node_t* %cond to i8*, !dbg !553
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %8) #7, !dbg !553
  call void @llvm.dbg.declare(metadata %struct._node_t* %cond, metadata !531, metadata !DIExpression()), !dbg !554
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !555, !tbaa !119
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !555
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !555
  %10 = bitcast %struct._node_t* %cond to i8*, !dbg !555
  %11 = bitcast %struct._node_t* %parent_node to i8*, !dbg !555
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %10, i8* align 2 %11, i16 6, i1 false), !dbg !555, !tbaa.struct !282
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %cond, i32 0, i32 2, !dbg !556
  %12 = load i16, i16* %child7, align 2, !dbg !556, !tbaa !275
  %cmp8 = icmp eq i16 %12, 0, !dbg !557
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !558

if.then9:                                         ; preds = %if.end
  %13 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !559
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %13) #7, !dbg !559
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !532, metadata !DIExpression()), !dbg !560
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !561, !tbaa !119
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !561
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !561
  %15 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !561
  %16 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !561
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !561, !tbaa.struct !282
  %17 = load i16, i16* %child, align 2, !dbg !562, !tbaa !86
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !563
  store i16 %17, i16* %child12, align 2, !dbg !564, !tbaa !275
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !565, !tbaa !119
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !565
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !565
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !566, !tbaa !119
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !566
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 10, !dbg !566
  %20 = load i16, i16* %parent, align 2, !dbg !566, !tbaa !411
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %20, !dbg !565
  %21 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !567
  %22 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !567
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %21, i8* align 2 %22, i16 6, i1 false), !dbg !567, !tbaa.struct !282
  %23 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !568
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %23) #7, !dbg !568
  br label %if.end22, !dbg !569

if.else:                                          ; preds = %if.end
  %24 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !570
  call void @llvm.lifetime.start.p0i8(i64 6, i8* %24) #7, !dbg !570
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !535, metadata !DIExpression()), !dbg !571
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !572, !tbaa !119
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !572
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 14, !dbg !572
  %26 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !572
  %27 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !572
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %26, i8* align 2 %27, i16 6, i1 false), !dbg !572, !tbaa.struct !282
  %28 = load i16, i16* %child, align 2, !dbg !573, !tbaa !86
  %sibling16 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !574
  store i16 %28, i16* %sibling16, align 2, !dbg !575, !tbaa !274
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !576, !tbaa !119
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !576
  %dict18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 5, !dbg !576
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !577, !tbaa !119
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !577
  %sibling20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !577
  %31 = load i16, i16* %sibling20, align 2, !dbg !577, !tbaa !405
  %arrayidx21 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict18, i16 0, i16 %31, !dbg !576
  %32 = bitcast %struct._node_t* %arrayidx21 to i8*, !dbg !578
  %33 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !578
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %32, i8* align 2 %33, i16 6, i1 false), !dbg !578, !tbaa.struct !282
  %34 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !579
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %34) #7, !dbg !579
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then9
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !580, !tbaa !119
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !580
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !580
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !581, !tbaa !119
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !581
  %child26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !581
  %37 = load i16, i16* %child26, align 2, !dbg !581, !tbaa !415
  %arrayidx27 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict24, i16 0, i16 %37, !dbg !580
  %38 = bitcast %struct._node_t* %arrayidx27 to i8*, !dbg !582
  %39 = bitcast %struct._node_t* %child_node to i8*, !dbg !582
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %38, i8* align 2 %39, i16 6, i1 false), !dbg !582, !tbaa.struct !282
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !583, !tbaa !119
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !583
  %parent29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !583
  %41 = load i16, i16* %parent29, align 2, !dbg !583, !tbaa !411
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !584, !tbaa !119
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !584
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 15, !dbg !584
  store i16 %41, i16* %symbol, align 2, !dbg !585, !tbaa !586
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !587, !tbaa !119
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !587
  %node_count32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 4, !dbg !587
  %44 = load i16, i16* %node_count32, align 2, !dbg !588, !tbaa !289
  %inc = add i16 %44, 1, !dbg !588
  store i16 %inc, i16* %node_count32, align 2, !dbg !588, !tbaa !289
  %45 = bitcast %struct._node_t* %cond to i8*, !dbg !589
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %45) #7, !dbg !589
  %46 = bitcast %struct._node_t* %child_node to i8*, !dbg !589
  call void @llvm.lifetime.end.p0i8(i64 6, i8* %46) #7, !dbg !589
  %47 = bitcast i16* %child to i8*, !dbg !589
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %47) #7, !dbg !589
  ret void, !dbg !589
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() #5 !dbg !590 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !591, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !591
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 15, !dbg !591
  %1 = load i16, i16* %symbol, align 2, !dbg !591, !tbaa !586
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !592, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !592
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !592
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !593, !tbaa !119
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !593
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !593
  %4 = load i16, i16* %out_len, align 2, !dbg !593, !tbaa !253
  %arrayidx = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %compressed_data, i16 0, i16 %4, !dbg !592
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 0, !dbg !594
  store i16 %1, i16* %letter, align 2, !dbg !595, !tbaa !273
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !596, !tbaa !119
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !596
  %out_len4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !596
  %6 = load i16, i16* %out_len4, align 2, !dbg !597, !tbaa !253
  %inc = add i16 %6, 1, !dbg !597
  store i16 %inc, i16* %out_len4, align 2, !dbg !597, !tbaa !253
  ret void, !dbg !598
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #5 !dbg !599 {
entry:
  call void @exit(i16 0) #8, !dbg !600
  unreachable, !dbg !600
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #6

; Function Attrs: nounwind
define dso_local void @task_commit() #0 !dbg !601 {
entry:
  ret void, !dbg !602
}

; Function Attrs: nounwind
define dso_local i16 @main() #0 !dbg !603 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !606, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !607, !tbaa !119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !608, !tbaa !119
  call void @camel_init(), !dbg !609
  call void @task_init(), !dbg !610
  call void @commit(), !dbg !610
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i32 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals2 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i32 0, i32 1
  %BCast4 = bitcast %struct.camel_global_t* %globals3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast, i8* align 2 %BCast4, i16 902, i1 false), !dbg !610
  call void @task_commit(), !dbg !610
  br label %while.cond, !dbg !611

while.cond:                                       ; preds = %if.end23, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !612, !tbaa !119
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !612
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !612
  %1 = load i16, i16* %out_len, align 2, !dbg !612, !tbaa !253
  %cmp = icmp ult i16 %1, 16, !dbg !613
  br i1 %cmp, label %while.body, label %while.end24, !dbg !611

while.body:                                       ; preds = %while.cond
  call void @task_sample(), !dbg !614
  call void @commit(), !dbg !614
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i32 0, i32 1
  %global5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp6 = load i16, i16* %global5, align 2
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i32 0, i32 1
  %global9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global8, i32 0, i32 1
  store i16 %tmp6, i16* %global9, align 2
  %tmp10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp10, i32 0, i32 1
  %global12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global11, i32 0, i32 16
  %tmp13 = load i16, i16* %global12, align 2
  %tmp14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp14, i32 0, i32 1
  %global16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global15, i32 0, i32 16
  store i16 %tmp13, i16* %global16, align 2
  call void @task_commit(), !dbg !614
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616, !tbaa !119
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !616
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 16, !dbg !616
  %3 = load i16, i16* %check, align 2, !dbg !616, !tbaa !314
  %cmp2 = icmp eq i16 %3, 0, !dbg !618
  br i1 %cmp2, label %if.then, label %if.end, !dbg !619

if.then:                                          ; preds = %while.body
  call void @task_measure_temp(), !dbg !620
  call void @commit(), !dbg !620
  %tmp17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i32 0, i32 1
  %global19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global18, i32 0, i32 2
  %tmp20 = load i16, i16* %global19, align 2
  %tmp21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp21, i32 0, i32 1
  %global23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global22, i32 0, i32 2
  store i16 %tmp20, i16* %global23, align 2
  %tmp24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i32 0, i32 1
  %global26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global25, i32 0, i32 6
  %tmp27 = load i16, i16* %global26, align 2
  %tmp28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp28, i32 0, i32 1
  %global30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global29, i32 0, i32 6
  store i16 %tmp27, i16* %global30, align 2
  call void @task_commit(), !dbg !620
  br label %if.end, !dbg !622

if.end:                                           ; preds = %if.then, %while.body
  br label %while.body4, !dbg !623

while.body4:                                      ; preds = %if.end, %if.end12
  call void @task_letterize(), !dbg !624
  call void @commit(), !dbg !624
  %tmp31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp31, i32 0, i32 1
  %global33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global32, i32 0, i32 0
  %tmp34 = load i16, i16* %global33, align 2
  %tmp35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp35, i32 0, i32 1
  %global37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global36, i32 0, i32 0
  store i16 %tmp34, i16* %global37, align 2
  call void @task_commit(), !dbg !624
  call void @task_compress(), !dbg !626
  call void @commit(), !dbg !626
  %tmp38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i32 0, i32 1
  %global40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global39, i32 0, i32 8
  %tmp41 = load i16, i16* %global40, align 2
  %tmp42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp42, i32 0, i32 1
  %global44 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global43, i32 0, i32 8
  store i16 %tmp41, i16* %global44, align 2
  %tmp45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i32 0, i32 1
  %global47 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global46, i32 0, i32 12
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 12
  %cast = bitcast %struct._node_t* %global47 to i8*
  %cast51 = bitcast %struct._node_t* %global50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast, i8* align 2 %cast51, i16 6, i1 false), !dbg !626
  %tmp52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp52, i32 0, i32 1
  %global54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global53, i32 0, i32 10
  %tmp55 = load i16, i16* %global54, align 2
  %tmp56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp56, i32 0, i32 1
  %global58 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global57, i32 0, i32 10
  store i16 %tmp55, i16* %global58, align 2
  %tmp59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i32 0, i32 1
  %global61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global60, i32 0, i32 9
  %tmp62 = load i16, i16* %global61, align 2
  %tmp63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp63, i32 0, i32 1
  %global65 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global64, i32 0, i32 9
  store i16 %tmp62, i16* %global65, align 2
  %tmp66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i32 0, i32 1
  %global68 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global67, i32 0, i32 7
  %tmp69 = load i16, i16* %global68, align 2
  %tmp70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp70, i32 0, i32 1
  %global72 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global71, i32 0, i32 7
  store i16 %tmp69, i16* %global72, align 2
  call void @task_commit(), !dbg !626
  br label %do.body, !dbg !627

do.body:                                          ; preds = %do.cond, %while.body4
  call void @task_find_sibling(), !dbg !628
  call void @commit(), !dbg !628
  %tmp73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i32 0, i32 1
  %global75 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global74, i32 0, i32 11
  %tmp76 = load i16, i16* %global75, align 2
  %tmp77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i32 0, i32 1
  %global79 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global78, i32 0, i32 11
  store i16 %tmp76, i16* %global79, align 2
  %tmp80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp80, i32 0, i32 1
  %global82 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global81, i32 0, i32 16
  %tmp83 = load i16, i16* %global82, align 2
  %tmp84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i32 0, i32 1
  %global86 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global85, i32 0, i32 16
  store i16 %tmp83, i16* %global86, align 2
  %tmp87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp87, i32 0, i32 1
  %global89 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global88, i32 0, i32 8
  %tmp90 = load i16, i16* %global89, align 2
  %tmp91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i32 0, i32 1
  %global93 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global92, i32 0, i32 8
  store i16 %tmp90, i16* %global93, align 2
  call void @task_commit(), !dbg !628
  br label %do.cond, !dbg !630

do.cond:                                          ; preds = %do.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !631, !tbaa !119
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !631
  %check6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 16, !dbg !631
  %5 = load i16, i16* %check6, align 2, !dbg !631, !tbaa !314
  %cmp7 = icmp eq i16 %5, 1, !dbg !632
  br i1 %cmp7, label %do.body, label %do.end, !dbg !630, !llvm.loop !633

do.end:                                           ; preds = %do.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635, !tbaa !119
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !635
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 16, !dbg !635
  %7 = load i16, i16* %check9, align 2, !dbg !635, !tbaa !314
  %cmp10 = icmp ne i16 %7, 0, !dbg !637
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !638

if.then11:                                        ; preds = %do.end
  br label %while.end, !dbg !639

if.end12:                                         ; preds = %do.end
  br label %while.body4, !dbg !623, !llvm.loop !640

while.end:                                        ; preds = %if.then11
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642, !tbaa !119
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !642
  %check14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 16, !dbg !642
  %9 = load i16, i16* %check14, align 2, !dbg !642, !tbaa !314
  %cmp15 = icmp eq i16 %9, 3, !dbg !644
  br i1 %cmp15, label %if.then16, label %if.end23, !dbg !645

if.then16:                                        ; preds = %while.end
  br label %do.body17, !dbg !646

do.body17:                                        ; preds = %do.cond18, %if.then16
  call void @task_add_node(), !dbg !648
  call void @commit(), !dbg !648
  %tmp94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global95 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp94, i32 0, i32 1
  %global96 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global95, i32 0, i32 8
  %tmp97 = load i16, i16* %global96, align 2
  %tmp98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i32 0, i32 1
  %global100 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global99, i32 0, i32 8
  store i16 %tmp97, i16* %global100, align 2
  %tmp101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp101, i32 0, i32 1
  %global103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global102, i32 0, i32 16
  %tmp104 = load i16, i16* %global103, align 2
  %tmp105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp105, i32 0, i32 1
  %global107 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global106, i32 0, i32 16
  store i16 %tmp104, i16* %global107, align 2
  %tmp108 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp108, i32 0, i32 1
  %global110 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global109, i32 0, i32 14
  %tmp111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp111, i32 0, i32 1
  %global113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global112, i32 0, i32 14
  %cast114 = bitcast %struct._node_t* %global110 to i8*
  %cast115 = bitcast %struct._node_t* %global113 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast114, i8* align 2 %cast115, i16 6, i1 false), !dbg !648
  call void @task_commit(), !dbg !648
  br label %do.cond18, !dbg !650

do.cond18:                                        ; preds = %do.body17
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !651, !tbaa !119
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !651
  %check20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 16, !dbg !651
  %11 = load i16, i16* %check20, align 2, !dbg !651, !tbaa !314
  %cmp21 = icmp eq i16 %11, 0, !dbg !652
  br i1 %cmp21, label %do.body17, label %do.end22, !dbg !650, !llvm.loop !653

do.end22:                                         ; preds = %do.cond18
  br label %if.end23, !dbg !655

if.end23:                                         ; preds = %do.end22, %while.end
  call void @task_add_insert(), !dbg !656
  call void @commit(), !dbg !656
  %tmp116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global117 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp116, i32 0, i32 1
  %global118 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global117, i32 0, i32 5
  %tmp119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global120 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp119, i32 0, i32 1
  %global121 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global120, i32 0, i32 10
  %load = load i16, i16* %global121, align 2
  %access = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global118, i16 0, i16 %load
  %tmp122 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp122, i32 0, i32 1
  %global124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global123, i32 0, i32 5
  %tmp125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp125, i32 0, i32 1
  %global127 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global126, i32 0, i32 10
  %load128 = load i16, i16* %global127, align 2
  %access129 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global124, i16 0, i16 %load128
  %cast130 = bitcast %struct._node_t* %access to i8*
  %cast131 = bitcast %struct._node_t* %access129 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast130, i8* align 2 %cast131, i16 6, i1 false), !dbg !656
  %tmp132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i32 0, i32 1
  %global134 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global133, i32 0, i32 5
  %tmp135 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp135, i32 0, i32 1
  %global137 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global136, i32 0, i32 8
  %load138 = load i16, i16* %global137, align 2
  %access139 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global134, i16 0, i16 %load138
  %tmp140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global141 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp140, i32 0, i32 1
  %global142 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global141, i32 0, i32 5
  %tmp143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp143, i32 0, i32 1
  %global145 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global144, i32 0, i32 8
  %load146 = load i16, i16* %global145, align 2
  %access147 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global142, i16 0, i16 %load146
  %cast148 = bitcast %struct._node_t* %access139 to i8*
  %cast149 = bitcast %struct._node_t* %access147 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast148, i8* align 2 %cast149, i16 6, i1 false), !dbg !656
  %tmp150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp150, i32 0, i32 1
  %global152 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global151, i32 0, i32 5
  %tmp153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global154 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp153, i32 0, i32 1
  %global155 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global154, i32 0, i32 9
  %load156 = load i16, i16* %global155, align 2
  %access157 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global152, i16 0, i16 %load156
  %tmp158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i32 0, i32 1
  %global160 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global159, i32 0, i32 5
  %tmp161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global162 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp161, i32 0, i32 1
  %global163 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global162, i32 0, i32 9
  %load164 = load i16, i16* %global163, align 2
  %access165 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %global160, i16 0, i16 %load164
  %cast166 = bitcast %struct._node_t* %access157 to i8*
  %cast167 = bitcast %struct._node_t* %access165 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast166, i8* align 2 %cast167, i16 6, i1 false), !dbg !656
  %tmp168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global169 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp168, i32 0, i32 1
  %global170 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global169, i32 0, i32 15
  %tmp171 = load i16, i16* %global170, align 2
  %tmp172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i32 0, i32 1
  %global174 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global173, i32 0, i32 15
  store i16 %tmp171, i16* %global174, align 2
  %tmp175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global176 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp175, i32 0, i32 1
  %global177 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global176, i32 0, i32 4
  %tmp178 = load i16, i16* %global177, align 2
  %tmp179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp179, i32 0, i32 1
  %global181 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global180, i32 0, i32 4
  store i16 %tmp178, i16* %global181, align 2
  call void @task_commit(), !dbg !656
  call void @task_append_compressed(), !dbg !657
  call void @commit(), !dbg !657
  %tmp182 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global183 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp182, i32 0, i32 1
  %global184 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global183, i32 0, i32 13
  %tmp185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp185, i32 0, i32 1
  %global187 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global186, i32 0, i32 3
  %load188 = load i16, i16* %global187, align 2
  %access189 = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %global184, i16 0, i16 %load188
  %tmp190 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i32 0, i32 1
  %global192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global191, i32 0, i32 13
  %tmp193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp193, i32 0, i32 1
  %global195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global194, i32 0, i32 3
  %load196 = load i16, i16* %global195, align 2
  %access197 = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %global192, i16 0, i16 %load196
  %cast198 = bitcast %struct._node_t* %access189 to i8*
  %cast199 = bitcast %struct._node_t* %access197 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %cast198, i8* align 2 %cast199, i16 6, i1 false), !dbg !657
  %tmp200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global201 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp200, i32 0, i32 1
  %global202 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global201, i32 0, i32 3
  %tmp203 = load i16, i16* %global202, align 2
  %tmp204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp204, i32 0, i32 1
  %global206 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global205, i32 0, i32 3
  store i16 %tmp203, i16* %global206, align 2
  call void @task_commit(), !dbg !657
  br label %while.cond, !dbg !611, !llvm.loop !658

while.end24:                                      ; preds = %while.cond
  call void @task_done(), !dbg !660
  %12 = load i16, i16* %retval, align 2, !dbg !661
  ret i16 %12, !dbg !661
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn }

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
!115 = !DILocation(line: 157, column: 19, scope: !108)
!116 = !DILocation(line: 157, column: 8, scope: !101)
!117 = !DILocation(line: 158, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !108, file: !3, line: 157, column: 34)
!119 = !{!120, !120, i64 0}
!120 = !{!"any pointer", !88, i64 0}
!121 = !DILocation(line: 159, column: 16, scope: !118)
!122 = !DILocation(line: 160, column: 5, scope: !118)
!123 = !DILocation(line: 160, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !108, file: !3, line: 160, column: 15)
!125 = !DILocation(line: 160, column: 26, scope: !124)
!126 = !DILocation(line: 160, column: 15, scope: !108)
!127 = !DILocation(line: 161, column: 14, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !3, line: 160, column: 41)
!129 = !DILocation(line: 162, column: 16, scope: !128)
!130 = !DILocation(line: 163, column: 5, scope: !128)
!131 = !DILocation(line: 164, column: 9, scope: !132)
!132 = distinct !DILexicalBlock(scope: !124, file: !3, line: 163, column: 12)
!133 = !DILocation(line: 181, column: 3, scope: !134)
!134 = distinct !DILexicalBlock(scope: !101, file: !3, line: 181, column: 3)
!135 = !{!111, !111, i64 0}
!136 = !{i32 -2146592595}
!137 = !DILocation(line: 183, column: 33, scope: !104)
!138 = !{i32 -2146592359}
!139 = !DILocation(line: 183, column: 33, scope: !101)
!140 = !DILocation(line: 183, column: 51, scope: !101)
!141 = !DILocation(line: 183, column: 65, scope: !106)
!142 = !{i32 -2146592234}
!143 = !DILocation(line: 183, column: 65, scope: !101)
!144 = !DILocation(line: 183, column: 83, scope: !101)
!145 = !DILocation(line: 183, column: 63, scope: !101)
!146 = !DILocation(line: 183, column: 19, scope: !101)
!147 = !DILocation(line: 183, column: 17, scope: !101)
!148 = !DILocation(line: 184, column: 37, scope: !101)
!149 = !DILocation(line: 184, column: 71, scope: !101)
!150 = !DILocation(line: 184, column: 23, scope: !101)
!151 = !DILocation(line: 184, column: 21, scope: !101)
!152 = !DILocation(line: 187, column: 6, scope: !153)
!153 = distinct !DILexicalBlock(scope: !101, file: !3, line: 187, column: 6)
!154 = !DILocation(line: 187, column: 27, scope: !153)
!155 = !DILocation(line: 187, column: 33, scope: !153)
!156 = !{!112, !111, i64 924}
!157 = !DILocation(line: 187, column: 24, scope: !153)
!158 = !DILocation(line: 187, column: 6, scope: !101)
!159 = !DILocation(line: 188, column: 11, scope: !160)
!160 = distinct !DILexicalBlock(scope: !153, file: !3, line: 187, column: 51)
!161 = !DILocation(line: 188, column: 4, scope: !160)
!162 = !DILocation(line: 188, column: 19, scope: !160)
!163 = !DILocation(line: 189, column: 4, scope: !160)
!164 = !DILocation(line: 190, column: 24, scope: !160)
!165 = !DILocation(line: 190, column: 30, scope: !160)
!166 = !DILocation(line: 190, column: 4, scope: !160)
!167 = !DILocation(line: 191, column: 3, scope: !160)
!168 = !DILocation(line: 192, column: 4, scope: !169)
!169 = distinct !DILexicalBlock(scope: !153, file: !3, line: 191, column: 9)
!170 = !DILocation(line: 195, column: 1, scope: !101)
!171 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 246, type: !12, scopeLine: 246, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !172)
!172 = !{!173, !178, !180, !183}
!173 = !DILocalVariable(name: "__x", scope: !174, file: !3, line: 253, type: !6)
!174 = distinct !DILexicalBlock(scope: !175, file: !3, line: 253, column: 45)
!175 = distinct !DILexicalBlock(scope: !176, file: !3, line: 249, column: 39)
!176 = distinct !DILexicalBlock(scope: !177, file: !3, line: 249, column: 14)
!177 = distinct !DILexicalBlock(scope: !171, file: !3, line: 247, column: 8)
!178 = !DILocalVariable(name: "__x", scope: !179, file: !3, line: 253, type: !6)
!179 = distinct !DILexicalBlock(scope: !175, file: !3, line: 253, column: 77)
!180 = !DILocalVariable(name: "__x", scope: !181, file: !3, line: 261, type: !6)
!181 = distinct !DILexicalBlock(scope: !182, file: !3, line: 261, column: 45)
!182 = distinct !DILexicalBlock(scope: !176, file: !3, line: 257, column: 17)
!183 = !DILocalVariable(name: "__x", scope: !184, file: !3, line: 261, type: !6)
!184 = distinct !DILexicalBlock(scope: !182, file: !3, line: 261, column: 77)
!185 = !DILocation(line: 247, column: 5, scope: !171)
!186 = !DILocation(line: 249, column: 20, scope: !176)
!187 = !DILocation(line: 249, column: 25, scope: !176)
!188 = !DILocation(line: 249, column: 14, scope: !177)
!189 = !DILocation(line: 250, column: 17, scope: !175)
!190 = !DILocation(line: 251, column: 19, scope: !175)
!191 = !DILocation(line: 252, column: 29, scope: !175)
!192 = !DILocation(line: 252, column: 35, scope: !175)
!193 = !DILocation(line: 252, column: 12, scope: !175)
!194 = !DILocation(line: 253, column: 45, scope: !174)
!195 = !{i32 -2146591920}
!196 = !DILocation(line: 253, column: 45, scope: !175)
!197 = !DILocation(line: 253, column: 63, scope: !175)
!198 = !DILocation(line: 253, column: 77, scope: !179)
!199 = !{i32 -2146591795}
!200 = !DILocation(line: 253, column: 77, scope: !175)
!201 = !DILocation(line: 253, column: 95, scope: !175)
!202 = !DILocation(line: 253, column: 75, scope: !175)
!203 = !DILocation(line: 253, column: 31, scope: !175)
!204 = !DILocation(line: 253, column: 29, scope: !175)
!205 = !DILocation(line: 254, column: 47, scope: !175)
!206 = !DILocation(line: 254, column: 81, scope: !175)
!207 = !DILocation(line: 254, column: 33, scope: !175)
!208 = !DILocation(line: 254, column: 31, scope: !175)
!209 = !DILocation(line: 255, column: 39, scope: !175)
!210 = !DILocation(line: 255, column: 13, scope: !175)
!211 = !DILocation(line: 255, column: 19, scope: !175)
!212 = !DILocation(line: 255, column: 37, scope: !175)
!213 = !DILocation(line: 256, column: 23, scope: !175)
!214 = !DILocation(line: 257, column: 11, scope: !175)
!215 = !DILocation(line: 258, column: 17, scope: !182)
!216 = !DILocation(line: 259, column: 19, scope: !182)
!217 = !DILocation(line: 260, column: 29, scope: !182)
!218 = !DILocation(line: 260, column: 35, scope: !182)
!219 = !DILocation(line: 260, column: 12, scope: !182)
!220 = !DILocation(line: 261, column: 45, scope: !181)
!221 = !{i32 -2146591663}
!222 = !DILocation(line: 261, column: 45, scope: !182)
!223 = !DILocation(line: 261, column: 63, scope: !182)
!224 = !DILocation(line: 261, column: 77, scope: !184)
!225 = !{i32 -2146591538}
!226 = !DILocation(line: 261, column: 77, scope: !182)
!227 = !DILocation(line: 261, column: 95, scope: !182)
!228 = !DILocation(line: 261, column: 75, scope: !182)
!229 = !DILocation(line: 261, column: 31, scope: !182)
!230 = !DILocation(line: 261, column: 29, scope: !182)
!231 = !DILocation(line: 262, column: 47, scope: !182)
!232 = !DILocation(line: 262, column: 81, scope: !182)
!233 = !DILocation(line: 262, column: 33, scope: !182)
!234 = !DILocation(line: 262, column: 31, scope: !182)
!235 = !DILocation(line: 263, column: 39, scope: !182)
!236 = !DILocation(line: 263, column: 13, scope: !182)
!237 = !DILocation(line: 263, column: 19, scope: !182)
!238 = !DILocation(line: 263, column: 37, scope: !182)
!239 = !DILocation(line: 264, column: 23, scope: !182)
!240 = !DILocation(line: 267, column: 19, scope: !177)
!241 = !DILocation(line: 269, column: 1, scope: !171)
!242 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 302, type: !12, scopeLine: 303, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !243)
!243 = !{!244, !246}
!244 = !DILocalVariable(name: "node", scope: !245, file: !3, line: 313, type: !47)
!245 = distinct !DILexicalBlock(scope: !242, file: !3, line: 311, column: 35)
!246 = !DILocalVariable(name: "i", scope: !245, file: !3, line: 318, type: !247)
!247 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!248 = !DILocation(line: 304, column: 2, scope: !242)
!249 = !DILocation(line: 304, column: 18, scope: !242)
!250 = !{!112, !87, i64 810}
!251 = !DILocation(line: 305, column: 2, scope: !242)
!252 = !DILocation(line: 305, column: 14, scope: !242)
!253 = !{!112, !87, i64 28}
!254 = !DILocation(line: 306, column: 2, scope: !242)
!255 = !DILocation(line: 306, column: 13, scope: !242)
!256 = !{!112, !87, i64 22}
!257 = !DILocation(line: 307, column: 2, scope: !242)
!258 = !DILocation(line: 307, column: 18, scope: !242)
!259 = !{!112, !87, i64 26}
!260 = !DILocation(line: 308, column: 2, scope: !242)
!261 = !DILocation(line: 308, column: 17, scope: !242)
!262 = !{!112, !87, i64 24}
!263 = !DILocation(line: 309, column: 2, scope: !242)
!264 = !DILocation(line: 309, column: 19, scope: !242)
!265 = !{!112, !87, i64 802}
!266 = !DILocation(line: 311, column: 2, scope: !242)
!267 = !DILocation(line: 311, column: 9, scope: !242)
!268 = !DILocation(line: 311, column: 20, scope: !242)
!269 = !DILocation(line: 313, column: 3, scope: !245)
!270 = !DILocation(line: 313, column: 10, scope: !245)
!271 = !DILocation(line: 313, column: 17, scope: !245)
!272 = !DILocation(line: 314, column: 14, scope: !245)
!273 = !{!114, !87, i64 0}
!274 = !{!114, !87, i64 2}
!275 = !{!114, !87, i64 4}
!276 = !DILocation(line: 318, column: 3, scope: !245)
!277 = !DILocation(line: 318, column: 7, scope: !245)
!278 = !DILocation(line: 318, column: 11, scope: !245)
!279 = !DILocation(line: 319, column: 3, scope: !245)
!280 = !DILocation(line: 319, column: 12, scope: !245)
!281 = !DILocation(line: 319, column: 17, scope: !245)
!282 = !{i64 0, i64 2, !86, i64 2, i64 2, !86, i64 4, i64 2, !86}
!283 = !DILocation(line: 320, column: 3, scope: !245)
!284 = !DILocation(line: 320, column: 13, scope: !245)
!285 = !DILocation(line: 321, column: 2, scope: !242)
!286 = distinct !{!286, !266, !285}
!287 = !DILocation(line: 323, column: 2, scope: !242)
!288 = !DILocation(line: 323, column: 17, scope: !242)
!289 = !{!112, !87, i64 30}
!290 = !DILocation(line: 324, column: 1, scope: !242)
!291 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 326, type: !12, scopeLine: 327, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !292)
!292 = !{!293}
!293 = !DILocalVariable(name: "next_letter_idx", scope: !291, file: !3, line: 328, type: !6)
!294 = !DILocation(line: 328, column: 2, scope: !291)
!295 = !DILocation(line: 328, column: 11, scope: !291)
!296 = !DILocation(line: 328, column: 29, scope: !291)
!297 = !DILocation(line: 328, column: 44, scope: !291)
!298 = !DILocation(line: 329, column: 6, scope: !299)
!299 = distinct !DILexicalBlock(scope: !291, file: !3, line: 329, column: 6)
!300 = !DILocation(line: 329, column: 22, scope: !299)
!301 = !DILocation(line: 329, column: 6, scope: !291)
!302 = !DILocation(line: 330, column: 19, scope: !299)
!303 = !DILocation(line: 330, column: 3, scope: !299)
!304 = !DILocation(line: 332, column: 6, scope: !305)
!305 = distinct !DILexicalBlock(scope: !291, file: !3, line: 332, column: 6)
!306 = !DILocation(line: 332, column: 21, scope: !305)
!307 = !DILocation(line: 332, column: 6, scope: !291)
!308 = !DILocation(line: 333, column: 20, scope: !309)
!309 = distinct !DILexicalBlock(scope: !305, file: !3, line: 332, column: 27)
!310 = !DILocation(line: 333, column: 3, scope: !309)
!311 = !DILocation(line: 333, column: 18, scope: !309)
!312 = !DILocation(line: 334, column: 3, scope: !309)
!313 = !DILocation(line: 334, column: 13, scope: !309)
!314 = !{!112, !87, i64 922}
!315 = !DILocation(line: 336, column: 2, scope: !309)
!316 = !DILocation(line: 337, column: 20, scope: !317)
!317 = distinct !DILexicalBlock(scope: !305, file: !3, line: 336, column: 9)
!318 = !DILocation(line: 337, column: 3, scope: !317)
!319 = !DILocation(line: 337, column: 18, scope: !317)
!320 = !DILocation(line: 338, column: 3, scope: !317)
!321 = !DILocation(line: 338, column: 13, scope: !317)
!322 = !DILocation(line: 341, column: 1, scope: !291)
!323 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 343, type: !12, scopeLine: 344, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !324)
!324 = !{!325, !326}
!325 = !DILocalVariable(name: "prev_sample", scope: !323, file: !3, line: 345, type: !42)
!326 = !DILocalVariable(name: "sample", scope: !323, file: !3, line: 348, type: !42)
!327 = !DILocation(line: 345, column: 2, scope: !323)
!328 = !DILocation(line: 345, column: 11, scope: !323)
!329 = !DILocation(line: 346, column: 16, scope: !323)
!330 = !DILocation(line: 346, column: 14, scope: !323)
!331 = !DILocation(line: 348, column: 2, scope: !323)
!332 = !DILocation(line: 348, column: 11, scope: !323)
!333 = !DILocation(line: 348, column: 35, scope: !323)
!334 = !DILocation(line: 348, column: 20, scope: !323)
!335 = !DILocation(line: 349, column: 16, scope: !323)
!336 = !DILocation(line: 349, column: 14, scope: !323)
!337 = !DILocation(line: 350, column: 20, scope: !323)
!338 = !DILocation(line: 350, column: 2, scope: !323)
!339 = !DILocation(line: 350, column: 18, scope: !323)
!340 = !DILocation(line: 351, column: 15, scope: !323)
!341 = !DILocation(line: 351, column: 2, scope: !323)
!342 = !DILocation(line: 351, column: 13, scope: !323)
!343 = !{!112, !87, i64 800}
!344 = !DILocation(line: 353, column: 1, scope: !323)
!345 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 296, type: !346, scopeLine: 297, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !348)
!346 = !DISubroutineType(types: !347)
!347 = !{!42, !39}
!348 = !{!349, !350}
!349 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !345, file: !3, line: 296, type: !39)
!350 = !DILocalVariable(name: "sample", scope: !345, file: !3, line: 298, type: !39)
!351 = !DILocation(line: 296, column: 41, scope: !345)
!352 = !DILocation(line: 298, column: 2, scope: !345)
!353 = !DILocation(line: 298, column: 11, scope: !345)
!354 = !DILocation(line: 298, column: 21, scope: !345)
!355 = !DILocation(line: 298, column: 33, scope: !345)
!356 = !DILocation(line: 298, column: 38, scope: !345)
!357 = !DILocation(line: 299, column: 9, scope: !345)
!358 = !DILocation(line: 300, column: 1, scope: !345)
!359 = !DILocation(line: 299, column: 2, scope: !345)
!360 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 355, type: !12, scopeLine: 356, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !361)
!361 = !{!362, !363, !364}
!362 = !DILocalVariable(name: "letter_idx", scope: !360, file: !3, line: 357, type: !6)
!363 = !DILocalVariable(name: "letter_shift", scope: !360, file: !3, line: 362, type: !6)
!364 = !DILocalVariable(name: "letter", scope: !360, file: !3, line: 363, type: !39)
!365 = !DILocation(line: 357, column: 2, scope: !360)
!366 = !DILocation(line: 357, column: 11, scope: !360)
!367 = !DILocation(line: 357, column: 24, scope: !360)
!368 = !DILocation(line: 358, column: 6, scope: !369)
!369 = distinct !DILexicalBlock(scope: !360, file: !3, line: 358, column: 6)
!370 = !DILocation(line: 358, column: 17, scope: !369)
!371 = !DILocation(line: 358, column: 6, scope: !360)
!372 = !DILocation(line: 359, column: 14, scope: !369)
!373 = !DILocation(line: 359, column: 3, scope: !369)
!374 = !DILocation(line: 361, column: 13, scope: !369)
!375 = !DILocation(line: 362, column: 2, scope: !360)
!376 = !DILocation(line: 362, column: 11, scope: !360)
!377 = !DILocation(line: 362, column: 45, scope: !360)
!378 = !DILocation(line: 362, column: 43, scope: !360)
!379 = !DILocation(line: 363, column: 2, scope: !360)
!380 = !DILocation(line: 363, column: 11, scope: !360)
!381 = !DILocation(line: 363, column: 21, scope: !360)
!382 = !DILocation(line: 363, column: 50, scope: !360)
!383 = !DILocation(line: 363, column: 47, scope: !360)
!384 = !DILocation(line: 363, column: 32, scope: !360)
!385 = !DILocation(line: 363, column: 68, scope: !360)
!386 = !DILocation(line: 363, column: 65, scope: !360)
!387 = !DILocation(line: 365, column: 15, scope: !360)
!388 = !DILocation(line: 365, column: 2, scope: !360)
!389 = !DILocation(line: 365, column: 13, scope: !360)
!390 = !DILocation(line: 367, column: 1, scope: !360)
!391 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 369, type: !12, scopeLine: 370, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !392)
!392 = !{!393, !394}
!393 = !DILocalVariable(name: "parent_node", scope: !391, file: !3, line: 371, type: !47)
!394 = !DILocalVariable(name: "parent", scope: !391, file: !3, line: 372, type: !7)
!395 = !DILocation(line: 371, column: 2, scope: !391)
!396 = !DILocation(line: 371, column: 9, scope: !391)
!397 = !DILocation(line: 372, column: 2, scope: !391)
!398 = !DILocation(line: 372, column: 10, scope: !391)
!399 = !DILocation(line: 372, column: 19, scope: !391)
!400 = !DILocation(line: 373, column: 16, scope: !391)
!401 = !DILocation(line: 373, column: 25, scope: !391)
!402 = !DILocation(line: 375, column: 28, scope: !391)
!403 = !DILocation(line: 375, column: 2, scope: !391)
!404 = !DILocation(line: 375, column: 14, scope: !391)
!405 = !{!112, !87, i64 804}
!406 = !DILocation(line: 376, column: 2, scope: !391)
!407 = !DILocation(line: 376, column: 20, scope: !391)
!408 = !DILocation(line: 377, column: 15, scope: !391)
!409 = !DILocation(line: 377, column: 2, scope: !391)
!410 = !DILocation(line: 377, column: 13, scope: !391)
!411 = !{!112, !87, i64 808}
!412 = !DILocation(line: 378, column: 26, scope: !391)
!413 = !DILocation(line: 378, column: 2, scope: !391)
!414 = !DILocation(line: 378, column: 12, scope: !391)
!415 = !{!112, !87, i64 806}
!416 = !DILocation(line: 379, column: 2, scope: !391)
!417 = !DILocation(line: 379, column: 18, scope: !391)
!418 = !DILocation(line: 381, column: 1, scope: !391)
!419 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 383, type: !12, scopeLine: 384, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !420)
!420 = !{!421, !423, !426}
!421 = !DILocalVariable(name: "sibling_node", scope: !419, file: !3, line: 385, type: !422)
!422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 16)
!423 = !DILocalVariable(name: "i", scope: !424, file: !3, line: 388, type: !247)
!424 = distinct !DILexicalBlock(scope: !425, file: !3, line: 387, column: 26)
!425 = distinct !DILexicalBlock(scope: !419, file: !3, line: 387, column: 6)
!426 = !DILocalVariable(name: "starting_node_idx", scope: !419, file: !3, line: 407, type: !7)
!427 = !DILocation(line: 385, column: 2, scope: !419)
!428 = !DILocation(line: 385, column: 10, scope: !419)
!429 = !DILocation(line: 387, column: 6, scope: !425)
!430 = !DILocation(line: 387, column: 18, scope: !425)
!431 = !DILocation(line: 387, column: 6, scope: !419)
!432 = !DILocation(line: 388, column: 3, scope: !424)
!433 = !DILocation(line: 388, column: 7, scope: !424)
!434 = !DILocation(line: 388, column: 11, scope: !424)
!435 = !DILocation(line: 389, column: 19, scope: !424)
!436 = !DILocation(line: 389, column: 28, scope: !424)
!437 = !DILocation(line: 389, column: 16, scope: !424)
!438 = !DILocation(line: 391, column: 7, scope: !439)
!439 = distinct !DILexicalBlock(scope: !424, file: !3, line: 391, column: 7)
!440 = !DILocation(line: 391, column: 21, scope: !439)
!441 = !DILocation(line: 391, column: 31, scope: !439)
!442 = !DILocation(line: 391, column: 28, scope: !439)
!443 = !DILocation(line: 391, column: 7, scope: !424)
!444 = !DILocation(line: 393, column: 22, scope: !445)
!445 = distinct !DILexicalBlock(scope: !439, file: !3, line: 391, column: 43)
!446 = !DILocation(line: 393, column: 4, scope: !445)
!447 = !DILocation(line: 393, column: 20, scope: !445)
!448 = !DILocation(line: 395, column: 4, scope: !445)
!449 = !DILocation(line: 395, column: 14, scope: !445)
!450 = !DILocation(line: 396, column: 4, scope: !445)
!451 = !DILocation(line: 398, column: 7, scope: !452)
!452 = distinct !DILexicalBlock(scope: !453, file: !3, line: 398, column: 7)
!453 = distinct !DILexicalBlock(scope: !439, file: !3, line: 397, column: 10)
!454 = !DILocation(line: 398, column: 21, scope: !452)
!455 = !DILocation(line: 398, column: 29, scope: !452)
!456 = !DILocation(line: 398, column: 7, scope: !453)
!457 = !DILocation(line: 399, column: 19, scope: !458)
!458 = distinct !DILexicalBlock(scope: !452, file: !3, line: 398, column: 34)
!459 = !DILocation(line: 399, column: 33, scope: !458)
!460 = !DILocation(line: 399, column: 5, scope: !458)
!461 = !DILocation(line: 399, column: 17, scope: !458)
!462 = !DILocation(line: 400, column: 5, scope: !458)
!463 = !DILocation(line: 400, column: 15, scope: !458)
!464 = !DILocation(line: 401, column: 5, scope: !458)
!465 = !DILocation(line: 405, column: 2, scope: !425)
!466 = !DILocation(line: 405, column: 2, scope: !424)
!467 = !DILocation(line: 407, column: 2, scope: !419)
!468 = !DILocation(line: 407, column: 10, scope: !419)
!469 = !DILocation(line: 407, column: 39, scope: !419)
!470 = !DILocation(line: 408, column: 20, scope: !419)
!471 = !DILocation(line: 408, column: 2, scope: !419)
!472 = !DILocation(line: 408, column: 18, scope: !419)
!473 = !DILocation(line: 410, column: 6, scope: !474)
!474 = distinct !DILexicalBlock(scope: !419, file: !3, line: 410, column: 6)
!475 = !DILocation(line: 410, column: 16, scope: !474)
!476 = !DILocation(line: 410, column: 6, scope: !419)
!477 = !DILocation(line: 411, column: 3, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 410, column: 24)
!479 = !DILocation(line: 411, column: 13, scope: !478)
!480 = !DILocation(line: 412, column: 2, scope: !478)
!481 = !DILocation(line: 413, column: 3, scope: !482)
!482 = distinct !DILexicalBlock(scope: !474, file: !3, line: 412, column: 9)
!483 = !DILocation(line: 413, column: 13, scope: !482)
!484 = !DILocation(line: 415, column: 1, scope: !419)
!485 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 418, type: !12, scopeLine: 419, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !486)
!486 = !{!487, !488, !489, !492}
!487 = !DILocalVariable(name: "sibling_node", scope: !485, file: !3, line: 420, type: !422)
!488 = !DILocalVariable(name: "i", scope: !485, file: !3, line: 422, type: !247)
!489 = !DILocalVariable(name: "next_sibling", scope: !490, file: !3, line: 426, type: !7)
!490 = distinct !DILexicalBlock(scope: !491, file: !3, line: 425, column: 36)
!491 = distinct !DILexicalBlock(scope: !485, file: !3, line: 425, column: 6)
!492 = !DILocalVariable(name: "sibling_node_obj", scope: !493, file: !3, line: 433, type: !47)
!493 = distinct !DILexicalBlock(scope: !491, file: !3, line: 431, column: 9)
!494 = !DILocation(line: 420, column: 2, scope: !485)
!495 = !DILocation(line: 420, column: 10, scope: !485)
!496 = !DILocation(line: 422, column: 2, scope: !485)
!497 = !DILocation(line: 422, column: 6, scope: !485)
!498 = !DILocation(line: 422, column: 10, scope: !485)
!499 = !DILocation(line: 423, column: 18, scope: !485)
!500 = !DILocation(line: 423, column: 27, scope: !485)
!501 = !DILocation(line: 423, column: 15, scope: !485)
!502 = !DILocation(line: 425, column: 6, scope: !491)
!503 = !DILocation(line: 425, column: 20, scope: !491)
!504 = !DILocation(line: 425, column: 28, scope: !491)
!505 = !DILocation(line: 425, column: 6, scope: !485)
!506 = !DILocation(line: 426, column: 3, scope: !490)
!507 = !DILocation(line: 426, column: 11, scope: !490)
!508 = !DILocation(line: 426, column: 26, scope: !490)
!509 = !DILocation(line: 426, column: 40, scope: !490)
!510 = !DILocation(line: 427, column: 17, scope: !490)
!511 = !DILocation(line: 427, column: 3, scope: !490)
!512 = !DILocation(line: 427, column: 15, scope: !490)
!513 = !DILocation(line: 429, column: 3, scope: !490)
!514 = !DILocation(line: 429, column: 13, scope: !490)
!515 = !DILocation(line: 431, column: 2, scope: !491)
!516 = !DILocation(line: 431, column: 2, scope: !490)
!517 = !DILocation(line: 433, column: 3, scope: !493)
!518 = !DILocation(line: 433, column: 10, scope: !493)
!519 = !DILocation(line: 433, column: 30, scope: !493)
!520 = !DILocation(line: 433, column: 29, scope: !493)
!521 = !DILocation(line: 434, column: 3, scope: !493)
!522 = !DILocation(line: 434, column: 22, scope: !493)
!523 = !DILocation(line: 436, column: 3, scope: !493)
!524 = !DILocation(line: 436, column: 13, scope: !493)
!525 = !DILocation(line: 437, column: 2, scope: !491)
!526 = !DILocation(line: 438, column: 1, scope: !485)
!527 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 440, type: !12, scopeLine: 441, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !528)
!528 = !{!529, !530, !531, !532, !535}
!529 = !DILocalVariable(name: "child", scope: !527, file: !3, line: 448, type: !7)
!530 = !DILocalVariable(name: "child_node", scope: !527, file: !3, line: 449, type: !47)
!531 = !DILocalVariable(name: "cond", scope: !527, file: !3, line: 456, type: !47)
!532 = !DILocalVariable(name: "parent_node_obj", scope: !533, file: !3, line: 460, type: !47)
!533 = distinct !DILexicalBlock(scope: !534, file: !3, line: 458, column: 25)
!534 = distinct !DILexicalBlock(scope: !527, file: !3, line: 458, column: 6)
!535 = !DILocalVariable(name: "last_sibling_node", scope: !536, file: !3, line: 467, type: !47)
!536 = distinct !DILexicalBlock(scope: !534, file: !3, line: 465, column: 9)
!537 = !DILocation(line: 443, column: 6, scope: !538)
!538 = distinct !DILexicalBlock(scope: !527, file: !3, line: 443, column: 6)
!539 = !DILocation(line: 443, column: 21, scope: !538)
!540 = !DILocation(line: 443, column: 6, scope: !527)
!541 = !DILocation(line: 444, column: 3, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !3, line: 443, column: 35)
!543 = !DILocation(line: 445, column: 3, scope: !542)
!544 = distinct !{!544, !543, !545}
!545 = !DILocation(line: 445, column: 12, scope: !542)
!546 = !DILocation(line: 448, column: 2, scope: !527)
!547 = !DILocation(line: 448, column: 10, scope: !527)
!548 = !DILocation(line: 448, column: 18, scope: !527)
!549 = !DILocation(line: 449, column: 2, scope: !527)
!550 = !DILocation(line: 449, column: 9, scope: !527)
!551 = !DILocation(line: 449, column: 22, scope: !527)
!552 = !DILocation(line: 450, column: 13, scope: !527)
!553 = !DILocation(line: 456, column: 2, scope: !527)
!554 = !DILocation(line: 456, column: 9, scope: !527)
!555 = !DILocation(line: 456, column: 16, scope: !527)
!556 = !DILocation(line: 458, column: 11, scope: !534)
!557 = !DILocation(line: 458, column: 17, scope: !534)
!558 = !DILocation(line: 458, column: 6, scope: !527)
!559 = !DILocation(line: 460, column: 3, scope: !533)
!560 = !DILocation(line: 460, column: 10, scope: !533)
!561 = !DILocation(line: 460, column: 28, scope: !533)
!562 = !DILocation(line: 461, column: 27, scope: !533)
!563 = !DILocation(line: 461, column: 19, scope: !533)
!564 = !DILocation(line: 461, column: 25, scope: !533)
!565 = !DILocation(line: 463, column: 3, scope: !533)
!566 = !DILocation(line: 463, column: 12, scope: !533)
!567 = !DILocation(line: 463, column: 26, scope: !533)
!568 = !DILocation(line: 465, column: 2, scope: !534)
!569 = !DILocation(line: 465, column: 2, scope: !533)
!570 = !DILocation(line: 467, column: 3, scope: !536)
!571 = !DILocation(line: 467, column: 10, scope: !536)
!572 = !DILocation(line: 467, column: 30, scope: !536)
!573 = !DILocation(line: 469, column: 31, scope: !536)
!574 = !DILocation(line: 469, column: 21, scope: !536)
!575 = !DILocation(line: 469, column: 29, scope: !536)
!576 = !DILocation(line: 470, column: 3, scope: !536)
!577 = !DILocation(line: 470, column: 12, scope: !536)
!578 = !DILocation(line: 470, column: 27, scope: !536)
!579 = !DILocation(line: 471, column: 2, scope: !534)
!580 = !DILocation(line: 472, column: 2, scope: !527)
!581 = !DILocation(line: 472, column: 11, scope: !527)
!582 = !DILocation(line: 472, column: 24, scope: !527)
!583 = !DILocation(line: 473, column: 15, scope: !527)
!584 = !DILocation(line: 473, column: 2, scope: !527)
!585 = !DILocation(line: 473, column: 13, scope: !527)
!586 = !{!112, !87, i64 920}
!587 = !DILocation(line: 474, column: 2, scope: !527)
!588 = !DILocation(line: 474, column: 16, scope: !527)
!589 = !DILocation(line: 476, column: 1, scope: !527)
!590 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 478, type: !12, scopeLine: 479, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!591 = !DILocation(line: 480, column: 44, scope: !590)
!592 = !DILocation(line: 480, column: 2, scope: !590)
!593 = !DILocation(line: 480, column: 22, scope: !590)
!594 = !DILocation(line: 480, column: 35, scope: !590)
!595 = !DILocation(line: 480, column: 42, scope: !590)
!596 = !DILocation(line: 482, column: 4, scope: !590)
!597 = !DILocation(line: 482, column: 2, scope: !590)
!598 = !DILocation(line: 483, column: 1, scope: !590)
!599 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 485, type: !12, scopeLine: 486, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!600 = !DILocation(line: 487, column: 2, scope: !599)
!601 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 490, type: !12, scopeLine: 490, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!602 = !DILocation(line: 492, column: 1, scope: !601)
!603 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 494, type: !604, scopeLine: 494, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!604 = !DISubroutineType(types: !605)
!605 = !{!247}
!606 = !DILocation(line: 496, column: 16, scope: !603)
!607 = !DILocation(line: 497, column: 10, scope: !603)
!608 = !DILocation(line: 498, column: 12, scope: !603)
!609 = !DILocation(line: 499, column: 5, scope: !603)
!610 = !DILocation(line: 501, column: 2, scope: !603)
!611 = !DILocation(line: 503, column: 2, scope: !603)
!612 = !DILocation(line: 503, column: 8, scope: !603)
!613 = !DILocation(line: 503, column: 21, scope: !603)
!614 = !DILocation(line: 505, column: 3, scope: !615)
!615 = distinct !DILexicalBlock(scope: !603, file: !3, line: 503, column: 35)
!616 = !DILocation(line: 507, column: 7, scope: !617)
!617 = distinct !DILexicalBlock(scope: !615, file: !3, line: 507, column: 7)
!618 = !DILocation(line: 507, column: 18, scope: !617)
!619 = !DILocation(line: 507, column: 7, scope: !615)
!620 = !DILocation(line: 509, column: 4, scope: !621)
!621 = distinct !DILexicalBlock(scope: !617, file: !3, line: 507, column: 23)
!622 = !DILocation(line: 511, column: 3, scope: !621)
!623 = !DILocation(line: 513, column: 3, scope: !615)
!624 = !DILocation(line: 515, column: 4, scope: !625)
!625 = distinct !DILexicalBlock(scope: !615, file: !3, line: 513, column: 13)
!626 = !DILocation(line: 517, column: 4, scope: !625)
!627 = !DILocation(line: 519, column: 4, scope: !625)
!628 = !DILocation(line: 521, column: 5, scope: !629)
!629 = distinct !DILexicalBlock(scope: !625, file: !3, line: 519, column: 7)
!630 = !DILocation(line: 523, column: 4, scope: !629)
!631 = !DILocation(line: 523, column: 13, scope: !625)
!632 = !DILocation(line: 523, column: 24, scope: !625)
!633 = distinct !{!633, !627, !634}
!634 = !DILocation(line: 523, column: 28, scope: !625)
!635 = !DILocation(line: 525, column: 8, scope: !636)
!636 = distinct !DILexicalBlock(scope: !625, file: !3, line: 525, column: 8)
!637 = !DILocation(line: 525, column: 19, scope: !636)
!638 = !DILocation(line: 525, column: 8, scope: !625)
!639 = !DILocation(line: 526, column: 5, scope: !636)
!640 = distinct !{!640, !623, !641}
!641 = !DILocation(line: 527, column: 3, scope: !615)
!642 = !DILocation(line: 529, column: 7, scope: !643)
!643 = distinct !DILexicalBlock(scope: !615, file: !3, line: 529, column: 7)
!644 = !DILocation(line: 529, column: 18, scope: !643)
!645 = !DILocation(line: 529, column: 7, scope: !615)
!646 = !DILocation(line: 530, column: 4, scope: !647)
!647 = distinct !DILexicalBlock(scope: !643, file: !3, line: 529, column: 24)
!648 = !DILocation(line: 532, column: 5, scope: !649)
!649 = distinct !DILexicalBlock(scope: !647, file: !3, line: 530, column: 6)
!650 = !DILocation(line: 535, column: 4, scope: !649)
!651 = !DILocation(line: 535, column: 13, scope: !647)
!652 = !DILocation(line: 535, column: 24, scope: !647)
!653 = distinct !{!653, !646, !654}
!654 = !DILocation(line: 535, column: 28, scope: !647)
!655 = !DILocation(line: 536, column: 3, scope: !647)
!656 = !DILocation(line: 538, column: 3, scope: !615)
!657 = !DILocation(line: 540, column: 3, scope: !615)
!658 = distinct !{!658, !611, !659}
!659 = !DILocation(line: 542, column: 2, scope: !603)
!660 = !DILocation(line: 544, column: 2, scope: !603)
!661 = !DILocation(line: 545, column: 1, scope: !603)
