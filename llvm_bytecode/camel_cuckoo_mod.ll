; ModuleID = 'camel_cuckoo_mod.bc'
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !33
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !66
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !29
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !31
@init_key = dso_local constant i16 1, align 2, !dbg !14
@writeOpt = dso_local global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !24
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !68
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"
@index_victim = common dso_local global i16 0, align 2
@index2_victim = common dso_local global i16 0, align 2

; Function Attrs: nounwind
define dso_local void @camel_init() #0 !dbg !80 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !81, !tbaa !82
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !86, !tbaa !87
  %conv = zext i8 %0 to i16, !dbg !86
  %or = or i16 %conv, 1, !dbg !86
  %conv1 = trunc i16 %or to i8, !dbg !86
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !86, !tbaa !87
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !88, !tbaa !87
  %conv2 = zext i8 %1 to i16, !dbg !88
  %and = and i16 %conv2, -2, !dbg !88
  %conv3 = trunc i16 %and to i8, !dbg !88
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !88, !tbaa !87
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !89, !tbaa !82
  %and4 = and i16 %2, -2, !dbg !89
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
define dso_local void @camel_recover() #0 !dbg !97 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !103, !tbaa !105
  %cmp = icmp eq i16 %0, 1, !dbg !111
  br i1 %cmp, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !113, !tbaa !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !117, !tbaa !115
  br label %if.end4, !dbg !118

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !119, !tbaa !105
  %cmp1 = icmp eq i16 %1, 2, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !122

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !123, !tbaa !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !125, !tbaa !115
  br label %if.end, !dbg !126

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !129, !tbaa !115
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !129
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !129
  %3 = load i16, i16* %arrayidx, align 2, !dbg !129, !tbaa !131
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #7, !dbg !129, !srcloc !132
  %4 = bitcast i16* %__x to i8*, !dbg !133
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #7, !dbg !133
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !99, metadata !DIExpression()), !dbg !133
  %5 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !133, !srcloc !134
  store i16 %5, i16* %__x, align 2, !dbg !133, !tbaa !82
  %6 = load i16, i16* %__x, align 2, !dbg !133, !tbaa !82
  store i16 %6, i16* %tmp, align 2, !dbg !133, !tbaa !82
  %7 = bitcast i16* %__x to i8*, !dbg !135
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #7, !dbg !135
  %8 = load i16, i16* %tmp, align 2, !dbg !133, !tbaa !82
  %add = add i16 %8, 2, !dbg !136
  %9 = inttoptr i16 %add to i8*, !dbg !135
  %10 = bitcast i16* %__x5 to i8*, !dbg !137
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #7, !dbg !137
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !101, metadata !DIExpression()), !dbg !137
  %11 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !137, !srcloc !138
  store i16 %11, i16* %__x5, align 2, !dbg !137, !tbaa !82
  %12 = load i16, i16* %__x5, align 2, !dbg !137, !tbaa !82
  store i16 %12, i16* %tmp6, align 2, !dbg !137, !tbaa !82
  %13 = bitcast i16* %__x5 to i8*, !dbg !139
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %13) #7, !dbg !139
  %14 = load i16, i16* %tmp6, align 2, !dbg !137, !tbaa !82
  %add7 = add i16 %14, 2, !dbg !140
  %sub = sub i16 9216, %add7, !dbg !141
  %call = call zeroext i16 @__fast_hw_crc(i8* %9, i16 zeroext %sub, i16 zeroext -1), !dbg !142
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !143, !tbaa !131
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !144, !tbaa !115
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !144
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !145, !tbaa !131
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 298, i16 zeroext %17), !dbg !146
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !147, !tbaa !131
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !148, !tbaa !131
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !150, !tbaa !115
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !151
  %20 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !151, !tbaa !152
  %cmp9 = icmp eq i16 %18, %20, !dbg !153
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !154

if.then10:                                        ; preds = %if.end4
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !155, !tbaa !115
  %22 = bitcast %struct.camel_buffer_t* %21 to i8*, !dbg !157
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !158, !tbaa !115
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %22, i8* align 2 %24, i16 300, i1 false), !dbg !157
  call void @camel_init(), !dbg !159
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !160, !tbaa !115
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !161
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !160
  call void @__restore_registers(i16* %arraydecay), !dbg !162
  br label %if.end13, !dbg !163

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !164
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !166
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
define dso_local void @commit() #4 !dbg !167 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !181

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !182, !tbaa !105
  %cmp = icmp eq i16 %0, 1, !dbg !183
  br i1 %cmp, label %if.then, label %if.else, !dbg !184

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !185, !tbaa !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !186, !tbaa !115
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !187, !tbaa !115
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !188
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !187
  call void @__dump_registers(i16* %arraydecay), !dbg !189
  %2 = bitcast i16* %__x to i8*, !dbg !190
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #7, !dbg !190
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !169, metadata !DIExpression()), !dbg !190
  %3 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !190, !srcloc !191
  store i16 %3, i16* %__x, align 2, !dbg !190, !tbaa !82
  %4 = load i16, i16* %__x, align 2, !dbg !190, !tbaa !82
  store i16 %4, i16* %tmp, align 2, !dbg !190, !tbaa !82
  %5 = bitcast i16* %__x to i8*, !dbg !192
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #7, !dbg !192
  %6 = load i16, i16* %tmp, align 2, !dbg !190, !tbaa !82
  %add = add i16 %6, 2, !dbg !193
  %7 = inttoptr i16 %add to i8*, !dbg !192
  %8 = bitcast i16* %__x1 to i8*, !dbg !194
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #7, !dbg !194
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !174, metadata !DIExpression()), !dbg !194
  %9 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !194, !srcloc !195
  store i16 %9, i16* %__x1, align 2, !dbg !194, !tbaa !82
  %10 = load i16, i16* %__x1, align 2, !dbg !194, !tbaa !82
  store i16 %10, i16* %tmp2, align 2, !dbg !194, !tbaa !82
  %11 = bitcast i16* %__x1 to i8*, !dbg !196
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #7, !dbg !196
  %12 = load i16, i16* %tmp2, align 2, !dbg !194, !tbaa !82
  %add3 = add i16 %12, 2, !dbg !197
  %sub = sub i16 9216, %add3, !dbg !198
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !199
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !200, !tbaa !131
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !201, !tbaa !115
  %14 = bitcast %struct.camel_buffer_t* %13 to i8*, !dbg !201
  %15 = load i16, i16* @tmp_stack_crc, align 2, !dbg !202, !tbaa !131
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %14, i16 zeroext 298, i16 zeroext %15), !dbg !203
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !204, !tbaa !131
  %16 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !205, !tbaa !131
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !206, !tbaa !115
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 2, !dbg !207
  store i16 %16, i16* %stack_and_buf_crc, align 2, !dbg !208, !tbaa !152
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !209, !tbaa !105
  br label %if.end, !dbg !210

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !211, !tbaa !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !212, !tbaa !115
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !213, !tbaa !115
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !214
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !213
  call void @__dump_registers(i16* %arraydecay6), !dbg !215
  %19 = bitcast i16* %__x7 to i8*, !dbg !216
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %19) #7, !dbg !216
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !176, metadata !DIExpression()), !dbg !216
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !216, !srcloc !217
  store i16 %20, i16* %__x7, align 2, !dbg !216, !tbaa !82
  %21 = load i16, i16* %__x7, align 2, !dbg !216, !tbaa !82
  store i16 %21, i16* %tmp8, align 2, !dbg !216, !tbaa !82
  %22 = bitcast i16* %__x7 to i8*, !dbg !218
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #7, !dbg !218
  %23 = load i16, i16* %tmp8, align 2, !dbg !216, !tbaa !82
  %add9 = add i16 %23, 2, !dbg !219
  %24 = inttoptr i16 %add9 to i8*, !dbg !218
  %25 = bitcast i16* %__x10 to i8*, !dbg !220
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %25) #7, !dbg !220
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !179, metadata !DIExpression()), !dbg !220
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #7, !dbg !220, !srcloc !221
  store i16 %26, i16* %__x10, align 2, !dbg !220, !tbaa !82
  %27 = load i16, i16* %__x10, align 2, !dbg !220, !tbaa !82
  store i16 %27, i16* %tmp11, align 2, !dbg !220, !tbaa !82
  %28 = bitcast i16* %__x10 to i8*, !dbg !222
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #7, !dbg !222
  %29 = load i16, i16* %tmp11, align 2, !dbg !220, !tbaa !82
  %add12 = add i16 %29, 2, !dbg !223
  %sub13 = sub i16 9216, %add12, !dbg !224
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub13, i16 zeroext -1), !dbg !225
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !226, !tbaa !131
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !227, !tbaa !115
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !227
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !228, !tbaa !131
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 298, i16 zeroext %32), !dbg !229
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !230, !tbaa !131
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !231, !tbaa !131
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !232, !tbaa !115
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !233
  store i16 %33, i16* %stack_and_buf_crc16, align 2, !dbg !234, !tbaa !152
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !235, !tbaa !105
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !236

do.end:                                           ; preds = %if.end
  ret void, !dbg !237
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #5 !dbg !238 {
entry:
  %i = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !241
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !241
  call void @llvm.dbg.declare(metadata i16* %i, metadata !240, metadata !DIExpression()), !dbg !242
  store i16 0, i16* %i, align 2, !dbg !243, !tbaa !82
  br label %for.cond, !dbg !245

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !246, !tbaa !82
  %cmp = icmp ult i16 %1, 128, !dbg !248
  br i1 %cmp, label %for.body, label %for.end, !dbg !249

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !250
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !250
  %3 = load i16, i16* %i, align 2, !dbg !252, !tbaa !82
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %3, !dbg !250
  store i16 0, i16* %arrayidx, align 2, !dbg !253, !tbaa !131
  br label %for.inc, !dbg !254

for.inc:                                          ; preds = %for.body
  %4 = load i16, i16* %i, align 2, !dbg !255, !tbaa !82
  %inc = add i16 %4, 1, !dbg !255
  store i16 %inc, i16* %i, align 2, !dbg !255, !tbaa !82
  br label %for.cond, !dbg !256, !llvm.loop !257

for.end:                                          ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !259, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !259
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !259
  store i16 0, i16* %insert_count, align 2, !dbg !260, !tbaa !261
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !262
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !262
  store i16 0, i16* %lookup_count, align 2, !dbg !263, !tbaa !264
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !265, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !265
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !265
  store i16 0, i16* %inserted_count, align 2, !dbg !266, !tbaa !267
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !268, !tbaa !115
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !268
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !268
  store i16 0, i16* %member_count, align 2, !dbg !269, !tbaa !270
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271, !tbaa !115
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !271
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !271
  store i16 1, i16* %key, align 2, !dbg !272, !tbaa !273
  %10 = bitcast i16* %i to i8*, !dbg !274
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #7, !dbg !274
  ret void, !dbg !274
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_generate_key() #5 !dbg !275 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !276, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !276
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !276
  %1 = load i16, i16* %key, align 2, !dbg !276, !tbaa !273
  %add = add i16 %1, 1, !dbg !277
  %mul = mul i16 %add, 17, !dbg !278
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !279
  %key2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !279
  store i16 %mul, i16* %key2, align 2, !dbg !280, !tbaa !273
  ret void, !dbg !281
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes() #5 !dbg !282 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !283
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !283
  %1 = load i16, i16* %key, align 2, !dbg !283, !tbaa !273
  %call = call zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !284
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !285, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !285
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !285
  store i16 %call, i16* %fingerprint, align 2, !dbg !286, !tbaa !287
  ret void, !dbg !288
}

; Function Attrs: nounwind
define internal zeroext i16 @hash_to_fingerprint(i16 zeroext %key) #0 !dbg !289 {
entry:
  %key.addr = alloca i16, align 2
  store i16 %key, i16* %key.addr, align 2, !tbaa !131
  call void @llvm.dbg.declare(metadata i16* %key.addr, metadata !293, metadata !DIExpression()), !dbg !294
  %0 = bitcast i16* %key.addr to i8*, !dbg !295
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !296
  ret i16 %call, !dbg !297
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_1() #5 !dbg !298 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !299, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !299
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !299
  %1 = load i16, i16* %key, align 2, !dbg !299, !tbaa !273
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !300
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !301
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !301
  store i16 %call, i16* %index1, align 2, !dbg !302, !tbaa !303
  ret void, !dbg !304
}

; Function Attrs: nounwind
define internal zeroext i16 @hash_to_index(i16 zeroext %fp) #0 !dbg !305 {
entry:
  %fp.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  store i16 %fp, i16* %fp.addr, align 2, !tbaa !131
  call void @llvm.dbg.declare(metadata i16* %fp.addr, metadata !310, metadata !DIExpression()), !dbg !313
  %0 = bitcast i16* %hash to i8*, !dbg !314
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !314
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !311, metadata !DIExpression()), !dbg !315
  %1 = bitcast i16* %fp.addr to i8*, !dbg !316
  %call = call zeroext i16 @djb_hash(i8* %1, i16 2), !dbg !317
  store i16 %call, i16* %hash, align 2, !dbg !315, !tbaa !131
  %2 = load i16, i16* %hash, align 2, !dbg !318, !tbaa !131
  %and = and i16 %2, 127, !dbg !319
  %3 = bitcast i16* %hash to i8*, !dbg !320
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %3) #7, !dbg !320
  ret i16 %and, !dbg !321
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() #5 !dbg !322 {
entry:
  %fp_hash = alloca i16, align 2
  %0 = bitcast i16* %fp_hash to i8*, !dbg !325
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !325
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !324, metadata !DIExpression()), !dbg !326
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !327, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !327
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !327
  %2 = load i16, i16* %fingerprint, align 2, !dbg !327, !tbaa !287
  %call = call zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !328
  store i16 %call, i16* %fp_hash, align 2, !dbg !326, !tbaa !131
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !329
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !329
  %4 = load i16, i16* %index1, align 2, !dbg !329, !tbaa !303
  %5 = load i16, i16* %fp_hash, align 2, !dbg !330, !tbaa !131
  %xor = xor i16 %4, %5, !dbg !331
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !332
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !332
  store i16 %xor, i16* %index2, align 2, !dbg !333, !tbaa !334
  %7 = bitcast i16* %fp_hash to i8*, !dbg !335
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #7, !dbg !335
  ret void, !dbg !335
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() #5 !dbg !336 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !344
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !344
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !345
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !345
  %2 = load i16, i16* %index1, align 2, !dbg !345, !tbaa !303
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !344
  %3 = load i16, i16* %arrayidx, align 2, !dbg !344, !tbaa !131
  %tobool = icmp ne i16 %3, 0, !dbg !344
  br i1 %tobool, label %if.else, label %if.then, !dbg !346

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !347, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !347
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !347
  store i8 1, i8* %success, align 2, !dbg !349, !tbaa !350
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !351, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !351
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !351
  %6 = load i16, i16* %fingerprint, align 2, !dbg !351, !tbaa !287
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !352, !tbaa !115
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !352
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !352
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353, !tbaa !115
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !353
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !353
  %9 = load i16, i16* %index17, align 2, !dbg !353, !tbaa !303
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !352
  store i16 %6, i16* %arrayidx8, align 2, !dbg !354, !tbaa !131
  br label %if.end53, !dbg !355

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356, !tbaa !115
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !356
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !356
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357, !tbaa !115
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !357
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !357
  %12 = load i16, i16* %index2, align 2, !dbg !357, !tbaa !334
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !356
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !356, !tbaa !131
  %tobool13 = icmp ne i16 %13, 0, !dbg !356
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !358

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359, !tbaa !115
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !359
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !359
  store i8 1, i8* %success16, align 2, !dbg !361, !tbaa !350
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !362, !tbaa !115
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !362
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !362
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !362, !tbaa !287
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363, !tbaa !115
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !363
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !363
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364, !tbaa !115
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !364
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !364
  %19 = load i16, i16* %index222, align 2, !dbg !364, !tbaa !334
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !363
  store i16 %16, i16* %arrayidx23, align 2, !dbg !365, !tbaa !131
  br label %if.end52, !dbg !366

if.else24:                                        ; preds = %if.else
  %20 = bitcast i16* %fp_victim to i8*, !dbg !367
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %20) #7, !dbg !367
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !338, metadata !DIExpression()), !dbg !368
  %21 = bitcast i16* %index_victim to i8*, !dbg !369
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %21) #7, !dbg !369
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !343, metadata !DIExpression()), !dbg !370
  %call = call i16 @rand(), !dbg !371
  %rem = srem i16 %call, 2, !dbg !373
  %tobool25 = icmp ne i16 %rem, 0, !dbg !373
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !374

if.then26:                                        ; preds = %if.else24
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !375, !tbaa !115
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !375
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !375
  %23 = load i16, i16* %index128, align 2, !dbg !375, !tbaa !303
  store i16 %23, i16* %index_victim, align 2, !dbg !377, !tbaa !131
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378, !tbaa !115
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !378
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !378
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !379, !tbaa !115
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !379
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !379
  %26 = load i16, i16* %index132, align 2, !dbg !379, !tbaa !303
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %26, !dbg !378
  %27 = load i16, i16* %arrayidx33, align 2, !dbg !378, !tbaa !131
  store i16 %27, i16* %fp_victim, align 2, !dbg !380, !tbaa !131
  br label %if.end, !dbg !381

if.else34:                                        ; preds = %if.else24
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !382, !tbaa !115
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !382
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !382
  %29 = load i16, i16* %index236, align 2, !dbg !382, !tbaa !334
  store i16 %29, i16* %index_victim, align 2, !dbg !384, !tbaa !131
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385, !tbaa !115
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !385
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !385
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !386, !tbaa !115
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !386
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !386
  %32 = load i16, i16* %index240, align 2, !dbg !386, !tbaa !334
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %32, !dbg !385
  %33 = load i16, i16* %arrayidx41, align 2, !dbg !385, !tbaa !131
  store i16 %33, i16* %fp_victim, align 2, !dbg !387, !tbaa !131
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388, !tbaa !115
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !388
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !388
  %35 = load i16, i16* %fingerprint43, align 2, !dbg !388, !tbaa !287
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389, !tbaa !115
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !389
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !389
  %37 = load i16, i16* %index_victim, align 2, !dbg !390, !tbaa !131
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %37, !dbg !389
  store i16 %35, i16* %arrayidx46, align 2, !dbg !391, !tbaa !131
  %38 = load i16, i16* %index_victim, align 2, !dbg !392, !tbaa !131
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393, !tbaa !115
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !393
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !393
  store i16 %38, i16* %index148, align 2, !dbg !394, !tbaa !303
  %40 = load i16, i16* %fp_victim, align 2, !dbg !395, !tbaa !131
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396, !tbaa !115
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !396
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !396
  store i16 %40, i16* %fingerprint50, align 2, !dbg !397, !tbaa !287
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !398, !tbaa !115
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !398
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !398
  store i16 0, i16* %relocation_count, align 2, !dbg !399, !tbaa !400
  %43 = bitcast i16* %index_victim to i8*, !dbg !401
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %43) #7, !dbg !401
  %44 = bitcast i16* %fp_victim to i8*, !dbg !401
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %44) #7, !dbg !401
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  %load = load i16, i16* %index_victim
  store i16 %load, i16* @index_victim
  ret void, !dbg !402
}

declare dso_local i16 @rand() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() #5 !dbg !403 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %0 = bitcast i16* %fp_victim to i8*, !dbg !408
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !408
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !405, metadata !DIExpression()), !dbg !409
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !410, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !410
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !410
  %2 = load i16, i16* %fingerprint, align 2, !dbg !410, !tbaa !287
  store i16 %2, i16* %fp_victim, align 2, !dbg !409, !tbaa !131
  %3 = bitcast i16* %fp_hash_victim to i8*, !dbg !411
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #7, !dbg !411
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !406, metadata !DIExpression()), !dbg !412
  %4 = load i16, i16* %fp_victim, align 2, !dbg !413, !tbaa !131
  %call = call zeroext i16 @hash_to_index(i16 zeroext %4), !dbg !414
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !412, !tbaa !131
  %5 = bitcast i16* %index2_victim to i8*, !dbg !415
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #7, !dbg !415
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !407, metadata !DIExpression()), !dbg !416
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !417
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !417
  %7 = load i16, i16* %index1, align 2, !dbg !417, !tbaa !303
  %8 = load i16, i16* %fp_hash_victim, align 2, !dbg !418, !tbaa !131
  %xor = xor i16 %7, %8, !dbg !419
  store i16 %xor, i16* %index2_victim, align 2, !dbg !416, !tbaa !131
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !420, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !420
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !420
  %10 = load i16, i16* %index2_victim, align 2, !dbg !422, !tbaa !131
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %10, !dbg !420
  %11 = load i16, i16* %arrayidx, align 2, !dbg !420, !tbaa !131
  %tobool = icmp ne i16 %11, 0, !dbg !420
  br i1 %tobool, label %if.end, label %if.then, !dbg !423

if.then:                                          ; preds = %entry
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !424
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !424
  store i8 1, i8* %success, align 2, !dbg !426, !tbaa !350
  %13 = load i16, i16* %fp_victim, align 2, !dbg !427, !tbaa !131
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !428, !tbaa !115
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !428
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !428
  %15 = load i16, i16* %index2_victim, align 2, !dbg !429, !tbaa !131
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %15, !dbg !428
  store i16 %13, i16* %arrayidx6, align 2, !dbg !430, !tbaa !131
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !431

if.end:                                           ; preds = %entry
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !432, !tbaa !115
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !432
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !432
  %17 = load i16, i16* %relocation_count, align 2, !dbg !432, !tbaa !400
  %cmp = icmp uge i16 %17, 8, !dbg !434
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !435

if.then8:                                         ; preds = %if.end
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436, !tbaa !115
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !436
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !436
  store i8 0, i8* %success10, align 2, !dbg !438, !tbaa !350
  store i32 1, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !439

if.end11:                                         ; preds = %if.end
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440, !tbaa !115
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !440
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !440
  %20 = load i16, i16* %relocation_count13, align 2, !dbg !441, !tbaa !400
  %inc = add i16 %20, 1, !dbg !441
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !441, !tbaa !400
  %21 = load i16, i16* %index2_victim, align 2, !dbg !442, !tbaa !131
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443, !tbaa !115
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !443
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !443
  store i16 %21, i16* %index115, align 2, !dbg !444, !tbaa !303
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !445, !tbaa !115
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !445
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !445
  %24 = load i16, i16* %index2_victim, align 2, !dbg !446, !tbaa !131
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %24, !dbg !445
  %25 = load i16, i16* %arrayidx18, align 2, !dbg !445, !tbaa !131
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !447, !tbaa !115
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !447
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !447
  store i16 %25, i16* %fingerprint20, align 2, !dbg !448, !tbaa !287
  %27 = load i16, i16* %fp_victim, align 2, !dbg !449, !tbaa !131
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !450, !tbaa !115
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !450
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !450
  %29 = load i16, i16* %index2_victim, align 2, !dbg !451, !tbaa !131
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %29, !dbg !450
  store i16 %27, i16* %arrayidx23, align 2, !dbg !452, !tbaa !131
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !453
  br label %cleanup, !dbg !453

cleanup:                                          ; preds = %if.end11, %if.then8, %if.then
  %30 = bitcast i16* %index2_victim to i8*, !dbg !453
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #7, !dbg !453
  %31 = bitcast i16* %fp_hash_victim to i8*, !dbg !453
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #7, !dbg !453
  %32 = bitcast i16* %fp_victim to i8*, !dbg !453
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #7, !dbg !453
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 1, label %cleanup.cont
  ]

cleanup.cont:                                     ; preds = %cleanup, %cleanup
  ret void, !dbg !453

unreachable:                                      ; preds = %cleanup
  %load = load i16, i16* %index2_victim
  store i16 %load, i16* @index2_victim
  unreachable
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() #5 !dbg !454 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !455, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !455
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !455
  %1 = load i16, i16* %insert_count, align 2, !dbg !456, !tbaa !261
  %inc = add i16 %1, 1, !dbg !456
  store i16 %inc, i16* %insert_count, align 2, !dbg !456, !tbaa !261
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !457, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !457
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !457
  %3 = load i8, i8* %success, align 2, !dbg !457, !tbaa !350, !range !458
  %tobool = trunc i8 %3 to i1, !dbg !457
  %conv = zext i1 %tobool to i16, !dbg !457
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !459, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !459
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !459
  %5 = load i16, i16* %inserted_count, align 2, !dbg !460, !tbaa !267
  %add = add i16 %5, %conv, !dbg !460
  store i16 %add, i16* %inserted_count, align 2, !dbg !460, !tbaa !267
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !461, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !461
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !461
  %7 = load i16, i16* %insert_count4, align 2, !dbg !461, !tbaa !261
  %cmp = icmp uge i16 %7, 32, !dbg !463
  br i1 %cmp, label %if.then, label %if.end, !dbg !464

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !465, !tbaa !115
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !465
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !465
  store i16 1, i16* %key, align 2, !dbg !467, !tbaa !273
  br label %if.end, !dbg !468

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !469
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #5 !dbg !470 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !471, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !471
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !471
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !473
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !473
  %2 = load i16, i16* %index1, align 2, !dbg !473, !tbaa !303
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !471
  %3 = load i16, i16* %arrayidx, align 2, !dbg !471, !tbaa !131
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !474
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !474
  %5 = load i16, i16* %fingerprint, align 2, !dbg !474, !tbaa !287
  %cmp = icmp eq i16 %3, %5, !dbg !475
  br i1 %cmp, label %if.then, label %if.else, !dbg !476

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !477
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !477
  store i8 1, i8* %member, align 1, !dbg !479, !tbaa !480
  br label %if.end17, !dbg !481

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !482, !tbaa !115
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !482
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !482
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !485, !tbaa !115
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !485
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !485
  %9 = load i16, i16* %index2, align 2, !dbg !485, !tbaa !334
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !482
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !482, !tbaa !131
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !486, !tbaa !115
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !486
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !486
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !486, !tbaa !287
  %cmp10 = icmp eq i16 %10, %12, !dbg !487
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !488

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !489, !tbaa !115
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !489
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !489
  store i8 1, i8* %member13, align 1, !dbg !491, !tbaa !480
  br label %if.end, !dbg !492

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !493, !tbaa !115
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !493
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !493
  store i8 0, i8* %member16, align 1, !dbg !495, !tbaa !480
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  ret void, !dbg !496
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #5 !dbg !497 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !498, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !498
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !498
  %1 = load i16, i16* %lookup_count, align 2, !dbg !499, !tbaa !264
  %inc = add i16 %1, 1, !dbg !499
  store i16 %inc, i16* %lookup_count, align 2, !dbg !499, !tbaa !264
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !500, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !500
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !500
  %3 = load i8, i8* %member, align 1, !dbg !500, !tbaa !480, !range !458
  %tobool = trunc i8 %3 to i1, !dbg !500
  %conv = zext i1 %tobool to i16, !dbg !500
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !501, !tbaa !115
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !501
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !501
  %5 = load i16, i16* %member_count, align 2, !dbg !502, !tbaa !270
  %add = add i16 %5, %conv, !dbg !502
  store i16 %add, i16* %member_count, align 2, !dbg !502, !tbaa !270
  ret void, !dbg !503
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #5 !dbg !504 {
entry:
  call void @exit(i16 0) #8, !dbg !505
  unreachable, !dbg !505
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #6

; Function Attrs: nounwind
define dso_local void @task_commit() #0 !dbg !506 {
entry:
  ret void, !dbg !507
}

; Function Attrs: nounwind
define dso_local i16 @main() #0 !dbg !508 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !511, !tbaa !105
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !512, !tbaa !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !513, !tbaa !115
  call void @camel_init(), !dbg !514
  call void @task_init(), !dbg !515
  call void @commit(), !dbg !515
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i32 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals2 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i32 0, i32 1
  %BCast7 = bitcast %struct.camel_global_t* %globals6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast, i8* align 2 %BCast7, i16 276, i1 false), !dbg !515
  call void @task_commit(), !dbg !515
  br label %while.cond, !dbg !516

while.cond:                                       ; preds = %if.end20, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517, !tbaa !115
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !517
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !517
  %1 = load i16, i16* %lookup_count, align 2, !dbg !517, !tbaa !264
  %cmp = icmp ult i16 %1, 32, !dbg !518
  br i1 %cmp, label %while.body, label %while.end21, !dbg !516

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !519
  call void @commit(), !dbg !519
  %tmp = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp, i32 0, i32 1
  %global8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp9 = load i16, i16* %global8, align 2
  %tmp10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp10, i32 0, i32 1
  %global12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global11, i32 0, i32 1
  store i16 %tmp9, i16* %global12, align 2
  call void @task_commit(), !dbg !519
  call void @task_calc_indexes(), !dbg !521
  call void @commit(), !dbg !521
  %tmp13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp13, i32 0, i32 1
  %global15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global14, i32 0, i32 2
  %tmp16 = load i16, i16* %global15, align 2
  %tmp17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i32 0, i32 1
  %global19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global18, i32 0, i32 2
  store i16 %tmp16, i16* %global19, align 2
  call void @task_commit(), !dbg !521
  call void @task_calc_indexes_index_1(), !dbg !522
  call void @commit(), !dbg !522
  %tmp20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp20, i32 0, i32 1
  %global22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global21, i32 0, i32 3
  %tmp23 = load i16, i16* %global22, align 2
  %tmp24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp24, i32 0, i32 1
  %global26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global25, i32 0, i32 3
  store i16 %tmp23, i16* %global26, align 2
  call void @task_commit(), !dbg !522
  call void @task_calc_indexes_index_2(), !dbg !523
  call void @commit(), !dbg !523
  %tmp27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp27, i32 0, i32 1
  %global29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global28, i32 0, i32 4
  %tmp30 = load i16, i16* %global29, align 2
  %tmp31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp31, i32 0, i32 1
  %global33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global32, i32 0, i32 4
  store i16 %tmp30, i16* %global33, align 2
  call void @task_commit(), !dbg !523
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !524, !tbaa !115
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !524
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !524
  %3 = load i16, i16* %insert_count, align 2, !dbg !524, !tbaa !261
  %cmp2 = icmp ult i16 %3, 32, !dbg !526
  br i1 %cmp2, label %if.then, label %if.else, !dbg !527

if.then:                                          ; preds = %while.body
  call void @task_add(), !dbg !528
  call void @commit(), !dbg !528
  %tmp34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp34, i32 0, i32 1
  %global36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global35, i32 0, i32 10
  %tmp37 = load i8, i8* %global36, align 2
  %tmp38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp38, i32 0, i32 1
  %global40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global39, i32 0, i32 10
  store i8 %tmp37, i8* %global40, align 2
  %tmp41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp41, i32 0, i32 1
  %global43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global42, i32 0, i32 0
  %tmp44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp44, i32 0, i32 1
  %global46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global45, i32 0, i32 3
  %load = load i16, i16* %global46, align 2
  %access = getelementptr inbounds [128 x i16], [128 x i16]* %global43, i16 0, i16 %load
  %tmp47 = load i16, i16* %access, align 2
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 0
  %tmp51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i32 0, i32 1
  %global53 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global52, i32 0, i32 3
  %load54 = load i16, i16* %global53, align 2
  %access55 = getelementptr inbounds [128 x i16], [128 x i16]* %global50, i16 0, i16 %load54
  store i16 %tmp47, i16* %access55, align 2
  %tmp56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp56, i32 0, i32 1
  %global58 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global57, i32 0, i32 0
  %tmp59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i32 0, i32 1
  %global61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global60, i32 0, i32 4
  %load62 = load i16, i16* %global61, align 2
  %access63 = getelementptr inbounds [128 x i16], [128 x i16]* %global58, i16 0, i16 %load62
  %tmp64 = load i16, i16* %access63, align 2
  %tmp65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp65, i32 0, i32 1
  %global67 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global66, i32 0, i32 0
  %tmp68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp68, i32 0, i32 1
  %global70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global69, i32 0, i32 4
  %load71 = load i16, i16* %global70, align 2
  %access72 = getelementptr inbounds [128 x i16], [128 x i16]* %global67, i16 0, i16 %load71
  store i16 %tmp64, i16* %access72, align 2
  %tmp73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp73, i32 0, i32 1
  %global75 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global74, i32 0, i32 0
  %tmp76 = load i16, i16* @index_victim, align 2
  %access77 = getelementptr inbounds [128 x i16], [128 x i16]* %global75, i16 0, i16 %tmp76
  %tmp78 = load i16, i16* %access77, align 2
  %tmp79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global80 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp79, i32 0, i32 1
  %global81 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global80, i32 0, i32 0
  %tmp82 = load i16, i16* @index_victim, align 2
  %access83 = getelementptr inbounds [128 x i16], [128 x i16]* %global81, i16 0, i16 %tmp82
  store i16 %tmp78, i16* %access83, align 2
  %tmp84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i32 0, i32 1
  %global86 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global85, i32 0, i32 3
  %tmp87 = load i16, i16* %global86, align 2
  %tmp88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i32 0, i32 1
  %global90 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global89, i32 0, i32 3
  store i16 %tmp87, i16* %global90, align 2
  %tmp91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i32 0, i32 1
  %global93 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global92, i32 0, i32 2
  %tmp94 = load i16, i16* %global93, align 2
  %tmp95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp95, i32 0, i32 1
  %global97 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global96, i32 0, i32 2
  store i16 %tmp94, i16* %global97, align 2
  %tmp98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i32 0, i32 1
  %global100 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global99, i32 0, i32 5
  %tmp101 = load i16, i16* %global100, align 2
  %tmp102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp102, i32 0, i32 1
  %global104 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global103, i32 0, i32 5
  store i16 %tmp101, i16* %global104, align 2
  call void @task_commit(), !dbg !528
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530, !tbaa !115
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !530
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !530
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532, !tbaa !115
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !532
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !532
  %6 = load i16, i16* %index1, align 2, !dbg !532, !tbaa !303
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %6, !dbg !530
  %7 = load i16, i16* %arrayidx, align 2, !dbg !530, !tbaa !131
  %tobool = icmp ne i16 %7, 0, !dbg !530
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !533

land.lhs.true:                                    ; preds = %if.then
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !534, !tbaa !115
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !534
  %filter6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !534
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !535, !tbaa !115
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !535
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 4, !dbg !535
  %10 = load i16, i16* %index2, align 2, !dbg !535, !tbaa !334
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter6, i16 0, i16 %10, !dbg !534
  %11 = load i16, i16* %arrayidx8, align 2, !dbg !534, !tbaa !131
  %tobool9 = icmp ne i16 %11, 0, !dbg !534
  br i1 %tobool9, label %if.then10, label %if.end, !dbg !536

if.then10:                                        ; preds = %land.lhs.true
  br label %while.cond11, !dbg !537

while.cond11:                                     ; preds = %while.body19, %if.then10
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539, !tbaa !115
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !539
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !539
  %13 = load i8, i8* %success, align 2, !dbg !539, !tbaa !350, !range !458
  %tobool13 = trunc i8 %13 to i1, !dbg !539
  %conv = zext i1 %tobool13 to i16, !dbg !539
  %cmp14 = icmp eq i16 %conv, 0, !dbg !540
  br i1 %cmp14, label %land.rhs, label %land.end, !dbg !541

land.rhs:                                         ; preds = %while.cond11
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !542, !tbaa !115
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !542
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 5, !dbg !542
  %15 = load i16, i16* %relocation_count, align 2, !dbg !542, !tbaa !400
  %cmp17 = icmp ult i16 %15, 8, !dbg !543
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond11
  %16 = phi i1 [ false, %while.cond11 ], [ %cmp17, %land.rhs ], !dbg !544
  br i1 %16, label %while.body19, label %while.end, !dbg !537

while.body19:                                     ; preds = %land.end
  call void @task_relocate(), !dbg !545
  call void @commit(), !dbg !545
  %tmp105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp105, i32 0, i32 1
  %global107 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global106, i32 0, i32 10
  %tmp108 = load i8, i8* %global107, align 2
  %tmp109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp109, i32 0, i32 1
  %global111 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global110, i32 0, i32 10
  store i8 %tmp108, i8* %global111, align 2
  %tmp112 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp112, i32 0, i32 1
  %global114 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global113, i32 0, i32 0
  %tmp115 = load i16, i16* @index2_victim, align 2
  %access116 = getelementptr inbounds [128 x i16], [128 x i16]* %global114, i16 0, i16 %tmp115
  %tmp117 = load i16, i16* %access116, align 2
  %tmp118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global119 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp118, i32 0, i32 1
  %global120 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global119, i32 0, i32 0
  %tmp121 = load i16, i16* @index2_victim, align 2
  %access122 = getelementptr inbounds [128 x i16], [128 x i16]* %global120, i16 0, i16 %tmp121
  store i16 %tmp117, i16* %access122, align 2
  %tmp123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i32 0, i32 1
  %global125 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global124, i32 0, i32 5
  %tmp126 = load i16, i16* %global125, align 2
  %tmp127 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp127, i32 0, i32 1
  %global129 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global128, i32 0, i32 5
  store i16 %tmp126, i16* %global129, align 2
  %tmp130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp130, i32 0, i32 1
  %global132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global131, i32 0, i32 3
  %tmp133 = load i16, i16* %global132, align 2
  %tmp134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp134, i32 0, i32 1
  %global136 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global135, i32 0, i32 3
  store i16 %tmp133, i16* %global136, align 2
  %tmp137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp137, i32 0, i32 1
  %global139 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global138, i32 0, i32 2
  %tmp140 = load i16, i16* %global139, align 2
  %tmp141 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global142 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp141, i32 0, i32 1
  %global143 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global142, i32 0, i32 2
  store i16 %tmp140, i16* %global143, align 2
  call void @task_commit(), !dbg !545
  br label %while.cond11, !dbg !537, !llvm.loop !547

while.end:                                        ; preds = %land.end
  br label %if.end, !dbg !549

if.end:                                           ; preds = %while.end, %land.lhs.true, %if.then
  call void @task_insert_done(), !dbg !550
  call void @commit(), !dbg !550
  %tmp144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i32 0, i32 1
  %global146 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global145, i32 0, i32 6
  %tmp147 = load i16, i16* %global146, align 2
  %tmp148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i32 0, i32 1
  %global150 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global149, i32 0, i32 6
  store i16 %tmp147, i16* %global150, align 2
  %tmp151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp151, i32 0, i32 1
  %global153 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global152, i32 0, i32 7
  %tmp154 = load i16, i16* %global153, align 2
  %tmp155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp155, i32 0, i32 1
  %global157 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global156, i32 0, i32 7
  store i16 %tmp154, i16* %global157, align 2
  %tmp158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i32 0, i32 1
  %global160 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global159, i32 0, i32 1
  %tmp161 = load i16, i16* %global160, align 2
  %tmp162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp162, i32 0, i32 1
  %global164 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global163, i32 0, i32 1
  store i16 %tmp161, i16* %global164, align 2
  call void @task_commit(), !dbg !550
  br label %if.end20, !dbg !551

if.else:                                          ; preds = %while.body
  call void @task_lookup_search(), !dbg !552
  call void @commit(), !dbg !552
  %tmp165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global166 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp165, i32 0, i32 1
  %global167 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global166, i32 0, i32 11
  %tmp168 = load i8, i8* %global167, align 2
  %tmp169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp169, i32 0, i32 1
  %global171 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global170, i32 0, i32 11
  store i8 %tmp168, i8* %global171, align 2
  call void @task_commit(), !dbg !552
  call void @task_lookup_done(), !dbg !554
  call void @commit(), !dbg !554
  %tmp172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp172, i32 0, i32 1
  %global174 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global173, i32 0, i32 8
  %tmp175 = load i16, i16* %global174, align 2
  %tmp176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i32 0, i32 1
  %global178 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global177, i32 0, i32 8
  store i16 %tmp175, i16* %global178, align 2
  %tmp179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp179, i32 0, i32 1
  %global181 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global180, i32 0, i32 9
  %tmp182 = load i16, i16* %global181, align 2
  %tmp183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp183, i32 0, i32 1
  %global185 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global184, i32 0, i32 9
  store i16 %tmp182, i16* %global185, align 2
  call void @task_commit(), !dbg !554
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  br label %while.cond, !dbg !516, !llvm.loop !555

while.end21:                                      ; preds = %while.cond
  call void @task_done(), !dbg !557
  %17 = load i16, i16* %retval, align 2, !dbg !558
  ret i16 %17, !dbg !558
}

; Function Attrs: nounwind
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !559 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2, !tbaa !115
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !563, metadata !DIExpression()), !dbg !567
  store i16 %len, i16* %len.addr, align 2, !tbaa !82
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !564, metadata !DIExpression()), !dbg !568
  %0 = bitcast i16* %hash to i8*, !dbg !569
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #7, !dbg !569
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !565, metadata !DIExpression()), !dbg !570
  store i16 5381, i16* %hash, align 2, !dbg !570, !tbaa !131
  %1 = bitcast i16* %i to i8*, !dbg !571
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #7, !dbg !571
  call void @llvm.dbg.declare(metadata i16* %i, metadata !566, metadata !DIExpression()), !dbg !572
  store i16 0, i16* %i, align 2, !dbg !573, !tbaa !82
  br label %for.cond, !dbg !575

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !576, !tbaa !82
  %3 = load i16, i16* %len.addr, align 2, !dbg !578, !tbaa !82
  %cmp = icmp ult i16 %2, %3, !dbg !579
  br i1 %cmp, label %for.body, label %for.end, !dbg !580

for.body:                                         ; preds = %for.cond
  %4 = load i16, i16* %hash, align 2, !dbg !581, !tbaa !131
  %shl = shl i16 %4, 5, !dbg !582
  %5 = load i16, i16* %hash, align 2, !dbg !583, !tbaa !131
  %add = add i16 %shl, %5, !dbg !584
  %6 = load i8*, i8** %data.addr, align 2, !dbg !585, !tbaa !115
  %7 = load i8, i8* %6, align 1, !dbg !586, !tbaa !87
  %conv = zext i8 %7 to i16, !dbg !587
  %add1 = add i16 %add, %conv, !dbg !588
  store i16 %add1, i16* %hash, align 2, !dbg !589, !tbaa !131
  br label %for.inc, !dbg !590

for.inc:                                          ; preds = %for.body
  %8 = load i8*, i8** %data.addr, align 2, !dbg !591, !tbaa !115
  %incdec.ptr = getelementptr inbounds i8, i8* %8, i32 1, !dbg !591
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !591, !tbaa !115
  %9 = load i16, i16* %i, align 2, !dbg !592, !tbaa !82
  %inc = add i16 %9, 1, !dbg !592
  store i16 %inc, i16* %i, align 2, !dbg !592, !tbaa !82
  br label %for.cond, !dbg !593, !llvm.loop !594

for.end:                                          ; preds = %for.cond
  %10 = load i16, i16* %hash, align 2, !dbg !596, !tbaa !131
  %11 = bitcast i16* %i to i8*, !dbg !597
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #7, !dbg !597
  %12 = bitcast i16* %hash to i8*, !dbg !597
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %12) #7, !dbg !597
  ret i16 %10, !dbg !598
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
!111 = !DILocation(line: 126, column: 19, scope: !104)
!112 = !DILocation(line: 126, column: 8, scope: !97)
!113 = !DILocation(line: 127, column: 14, scope: !114)
!114 = distinct !DILexicalBlock(scope: !104, file: !3, line: 126, column: 34)
!115 = !{!116, !116, i64 0}
!116 = !{!"any pointer", !84, i64 0}
!117 = !DILocation(line: 128, column: 16, scope: !114)
!118 = !DILocation(line: 129, column: 5, scope: !114)
!119 = !DILocation(line: 129, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !104, file: !3, line: 129, column: 15)
!121 = !DILocation(line: 129, column: 26, scope: !120)
!122 = !DILocation(line: 129, column: 15, scope: !104)
!123 = !DILocation(line: 130, column: 14, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 129, column: 41)
!125 = !DILocation(line: 131, column: 16, scope: !124)
!126 = !DILocation(line: 132, column: 5, scope: !124)
!127 = !DILocation(line: 133, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !3, line: 132, column: 12)
!129 = !DILocation(line: 150, column: 3, scope: !130)
!130 = distinct !DILexicalBlock(scope: !97, file: !3, line: 150, column: 3)
!131 = !{!107, !107, i64 0}
!132 = !{i32 -2146593314}
!133 = !DILocation(line: 152, column: 33, scope: !100)
!134 = !{i32 -2146593078}
!135 = !DILocation(line: 152, column: 33, scope: !97)
!136 = !DILocation(line: 152, column: 51, scope: !97)
!137 = !DILocation(line: 152, column: 65, scope: !102)
!138 = !{i32 -2146592953}
!139 = !DILocation(line: 152, column: 65, scope: !97)
!140 = !DILocation(line: 152, column: 83, scope: !97)
!141 = !DILocation(line: 152, column: 63, scope: !97)
!142 = !DILocation(line: 152, column: 19, scope: !97)
!143 = !DILocation(line: 152, column: 17, scope: !97)
!144 = !DILocation(line: 153, column: 37, scope: !97)
!145 = !DILocation(line: 153, column: 71, scope: !97)
!146 = !DILocation(line: 153, column: 23, scope: !97)
!147 = !DILocation(line: 153, column: 21, scope: !97)
!148 = !DILocation(line: 156, column: 6, scope: !149)
!149 = distinct !DILexicalBlock(scope: !97, file: !3, line: 156, column: 6)
!150 = !DILocation(line: 156, column: 27, scope: !149)
!151 = !DILocation(line: 156, column: 33, scope: !149)
!152 = !{!108, !107, i64 298}
!153 = !DILocation(line: 156, column: 24, scope: !149)
!154 = !DILocation(line: 156, column: 6, scope: !97)
!155 = !DILocation(line: 157, column: 11, scope: !156)
!156 = distinct !DILexicalBlock(scope: !149, file: !3, line: 156, column: 51)
!157 = !DILocation(line: 157, column: 4, scope: !156)
!158 = !DILocation(line: 157, column: 19, scope: !156)
!159 = !DILocation(line: 158, column: 4, scope: !156)
!160 = !DILocation(line: 159, column: 24, scope: !156)
!161 = !DILocation(line: 159, column: 30, scope: !156)
!162 = !DILocation(line: 159, column: 4, scope: !156)
!163 = !DILocation(line: 160, column: 3, scope: !156)
!164 = !DILocation(line: 161, column: 4, scope: !165)
!165 = distinct !DILexicalBlock(scope: !149, file: !3, line: 160, column: 9)
!166 = !DILocation(line: 164, column: 1, scope: !97)
!167 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 215, type: !27, scopeLine: 215, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !168)
!168 = !{!169, !174, !176, !179}
!169 = !DILocalVariable(name: "__x", scope: !170, file: !3, line: 222, type: !6)
!170 = distinct !DILexicalBlock(scope: !171, file: !3, line: 222, column: 45)
!171 = distinct !DILexicalBlock(scope: !172, file: !3, line: 218, column: 39)
!172 = distinct !DILexicalBlock(scope: !173, file: !3, line: 218, column: 14)
!173 = distinct !DILexicalBlock(scope: !167, file: !3, line: 216, column: 8)
!174 = !DILocalVariable(name: "__x", scope: !175, file: !3, line: 222, type: !6)
!175 = distinct !DILexicalBlock(scope: !171, file: !3, line: 222, column: 77)
!176 = !DILocalVariable(name: "__x", scope: !177, file: !3, line: 230, type: !6)
!177 = distinct !DILexicalBlock(scope: !178, file: !3, line: 230, column: 45)
!178 = distinct !DILexicalBlock(scope: !172, file: !3, line: 226, column: 17)
!179 = !DILocalVariable(name: "__x", scope: !180, file: !3, line: 230, type: !6)
!180 = distinct !DILexicalBlock(scope: !178, file: !3, line: 230, column: 77)
!181 = !DILocation(line: 216, column: 5, scope: !167)
!182 = !DILocation(line: 218, column: 20, scope: !172)
!183 = !DILocation(line: 218, column: 25, scope: !172)
!184 = !DILocation(line: 218, column: 14, scope: !173)
!185 = !DILocation(line: 219, column: 17, scope: !171)
!186 = !DILocation(line: 220, column: 19, scope: !171)
!187 = !DILocation(line: 221, column: 29, scope: !171)
!188 = !DILocation(line: 221, column: 35, scope: !171)
!189 = !DILocation(line: 221, column: 12, scope: !171)
!190 = !DILocation(line: 222, column: 45, scope: !170)
!191 = !{i32 -2146592639}
!192 = !DILocation(line: 222, column: 45, scope: !171)
!193 = !DILocation(line: 222, column: 63, scope: !171)
!194 = !DILocation(line: 222, column: 77, scope: !175)
!195 = !{i32 -2146592514}
!196 = !DILocation(line: 222, column: 77, scope: !171)
!197 = !DILocation(line: 222, column: 95, scope: !171)
!198 = !DILocation(line: 222, column: 75, scope: !171)
!199 = !DILocation(line: 222, column: 31, scope: !171)
!200 = !DILocation(line: 222, column: 29, scope: !171)
!201 = !DILocation(line: 223, column: 47, scope: !171)
!202 = !DILocation(line: 223, column: 81, scope: !171)
!203 = !DILocation(line: 223, column: 33, scope: !171)
!204 = !DILocation(line: 223, column: 31, scope: !171)
!205 = !DILocation(line: 224, column: 39, scope: !171)
!206 = !DILocation(line: 224, column: 13, scope: !171)
!207 = !DILocation(line: 224, column: 19, scope: !171)
!208 = !DILocation(line: 224, column: 37, scope: !171)
!209 = !DILocation(line: 225, column: 23, scope: !171)
!210 = !DILocation(line: 226, column: 11, scope: !171)
!211 = !DILocation(line: 227, column: 17, scope: !178)
!212 = !DILocation(line: 228, column: 19, scope: !178)
!213 = !DILocation(line: 229, column: 29, scope: !178)
!214 = !DILocation(line: 229, column: 35, scope: !178)
!215 = !DILocation(line: 229, column: 12, scope: !178)
!216 = !DILocation(line: 230, column: 45, scope: !177)
!217 = !{i32 -2146592382}
!218 = !DILocation(line: 230, column: 45, scope: !178)
!219 = !DILocation(line: 230, column: 63, scope: !178)
!220 = !DILocation(line: 230, column: 77, scope: !180)
!221 = !{i32 -2146592257}
!222 = !DILocation(line: 230, column: 77, scope: !178)
!223 = !DILocation(line: 230, column: 95, scope: !178)
!224 = !DILocation(line: 230, column: 75, scope: !178)
!225 = !DILocation(line: 230, column: 31, scope: !178)
!226 = !DILocation(line: 230, column: 29, scope: !178)
!227 = !DILocation(line: 231, column: 47, scope: !178)
!228 = !DILocation(line: 231, column: 81, scope: !178)
!229 = !DILocation(line: 231, column: 33, scope: !178)
!230 = !DILocation(line: 231, column: 31, scope: !178)
!231 = !DILocation(line: 232, column: 39, scope: !178)
!232 = !DILocation(line: 232, column: 13, scope: !178)
!233 = !DILocation(line: 232, column: 19, scope: !178)
!234 = !DILocation(line: 232, column: 37, scope: !178)
!235 = !DILocation(line: 233, column: 23, scope: !178)
!236 = !DILocation(line: 236, column: 19, scope: !173)
!237 = !DILocation(line: 238, column: 1, scope: !167)
!238 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 290, type: !27, scopeLine: 291, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !239)
!239 = !{!240}
!240 = !DILocalVariable(name: "i", scope: !238, file: !3, line: 292, type: !6)
!241 = !DILocation(line: 292, column: 5, scope: !238)
!242 = !DILocation(line: 292, column: 14, scope: !238)
!243 = !DILocation(line: 293, column: 12, scope: !244)
!244 = distinct !DILexicalBlock(scope: !238, file: !3, line: 293, column: 5)
!245 = !DILocation(line: 293, column: 10, scope: !244)
!246 = !DILocation(line: 293, column: 17, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !3, line: 293, column: 5)
!248 = !DILocation(line: 293, column: 19, scope: !247)
!249 = !DILocation(line: 293, column: 5, scope: !244)
!250 = !DILocation(line: 294, column: 9, scope: !251)
!251 = distinct !DILexicalBlock(scope: !247, file: !3, line: 293, column: 40)
!252 = !DILocation(line: 294, column: 20, scope: !251)
!253 = !DILocation(line: 294, column: 23, scope: !251)
!254 = !DILocation(line: 295, column: 5, scope: !251)
!255 = !DILocation(line: 293, column: 35, scope: !247)
!256 = !DILocation(line: 293, column: 5, scope: !247)
!257 = distinct !{!257, !249, !258}
!258 = !DILocation(line: 295, column: 5, scope: !244)
!259 = !DILocation(line: 296, column: 5, scope: !238)
!260 = !DILocation(line: 296, column: 22, scope: !238)
!261 = !{!108, !107, i64 288}
!262 = !DILocation(line: 297, column: 5, scope: !238)
!263 = !DILocation(line: 297, column: 22, scope: !238)
!264 = !{!108, !107, i64 292}
!265 = !DILocation(line: 298, column: 5, scope: !238)
!266 = !DILocation(line: 298, column: 24, scope: !238)
!267 = !{!108, !107, i64 290}
!268 = !DILocation(line: 299, column: 5, scope: !238)
!269 = !DILocation(line: 299, column: 22, scope: !238)
!270 = !{!108, !107, i64 294}
!271 = !DILocation(line: 300, column: 5, scope: !238)
!272 = !DILocation(line: 300, column: 13, scope: !238)
!273 = !{!108, !107, i64 278}
!274 = !DILocation(line: 301, column: 1, scope: !238)
!275 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 303, type: !27, scopeLine: 304, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!276 = !DILocation(line: 306, column: 16, scope: !275)
!277 = !DILocation(line: 306, column: 24, scope: !275)
!278 = !DILocation(line: 306, column: 29, scope: !275)
!279 = !DILocation(line: 306, column: 5, scope: !275)
!280 = !DILocation(line: 306, column: 13, scope: !275)
!281 = !DILocation(line: 307, column: 1, scope: !275)
!282 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 309, type: !27, scopeLine: 310, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!283 = !DILocation(line: 311, column: 43, scope: !282)
!284 = !DILocation(line: 311, column: 23, scope: !282)
!285 = !DILocation(line: 311, column: 5, scope: !282)
!286 = !DILocation(line: 311, column: 21, scope: !282)
!287 = !{!108, !107, i64 280}
!288 = !DILocation(line: 312, column: 1, scope: !282)
!289 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 285, type: !290, scopeLine: 286, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !292)
!290 = !DISubroutineType(types: !291)
!291 = !{!50, !17}
!292 = !{!293}
!293 = !DILocalVariable(name: "key", arg: 1, scope: !289, file: !3, line: 285, type: !17)
!294 = !DILocation(line: 285, column: 50, scope: !289)
!295 = !DILocation(line: 287, column: 21, scope: !289)
!296 = !DILocation(line: 287, column: 12, scope: !289)
!297 = !DILocation(line: 287, column: 5, scope: !289)
!298 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 314, type: !27, scopeLine: 315, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!299 = !DILocation(line: 316, column: 32, scope: !298)
!300 = !DILocation(line: 316, column: 18, scope: !298)
!301 = !DILocation(line: 316, column: 5, scope: !298)
!302 = !DILocation(line: 316, column: 16, scope: !298)
!303 = !{!108, !107, i64 282}
!304 = !DILocation(line: 317, column: 1, scope: !298)
!305 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 279, type: !306, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !309)
!306 = !DISubroutineType(types: !307)
!307 = !{!308, !50}
!308 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 21, baseType: !18)
!309 = !{!310, !311}
!310 = !DILocalVariable(name: "fp", arg: 1, scope: !305, file: !3, line: 279, type: !50)
!311 = !DILocalVariable(name: "hash", scope: !305, file: !3, line: 281, type: !312)
!312 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 19, baseType: !18)
!313 = !DILocation(line: 279, column: 44, scope: !305)
!314 = !DILocation(line: 281, column: 5, scope: !305)
!315 = !DILocation(line: 281, column: 12, scope: !305)
!316 = !DILocation(line: 281, column: 28, scope: !305)
!317 = !DILocation(line: 281, column: 19, scope: !305)
!318 = !DILocation(line: 282, column: 12, scope: !305)
!319 = !DILocation(line: 282, column: 17, scope: !305)
!320 = !DILocation(line: 283, column: 1, scope: !305)
!321 = !DILocation(line: 282, column: 5, scope: !305)
!322 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 319, type: !27, scopeLine: 320, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !323)
!323 = !{!324}
!324 = !DILocalVariable(name: "fp_hash", scope: !322, file: !3, line: 321, type: !308)
!325 = !DILocation(line: 321, column: 5, scope: !322)
!326 = !DILocation(line: 321, column: 13, scope: !322)
!327 = !DILocation(line: 321, column: 37, scope: !322)
!328 = !DILocation(line: 321, column: 23, scope: !322)
!329 = !DILocation(line: 322, column: 18, scope: !322)
!330 = !DILocation(line: 322, column: 31, scope: !322)
!331 = !DILocation(line: 322, column: 29, scope: !322)
!332 = !DILocation(line: 322, column: 5, scope: !322)
!333 = !DILocation(line: 322, column: 16, scope: !322)
!334 = !{!108, !107, i64 284}
!335 = !DILocation(line: 323, column: 1, scope: !322)
!336 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 325, type: !27, scopeLine: 326, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !337)
!337 = !{!338, !343}
!338 = !DILocalVariable(name: "fp_victim", scope: !339, file: !3, line: 335, type: !50)
!339 = distinct !DILexicalBlock(scope: !340, file: !3, line: 334, column: 16)
!340 = distinct !DILexicalBlock(scope: !341, file: !3, line: 331, column: 13)
!341 = distinct !DILexicalBlock(scope: !342, file: !3, line: 330, column: 12)
!342 = distinct !DILexicalBlock(scope: !336, file: !3, line: 327, column: 9)
!343 = !DILocalVariable(name: "index_victim", scope: !339, file: !3, line: 336, type: !308)
!344 = !DILocation(line: 327, column: 10, scope: !342)
!345 = !DILocation(line: 327, column: 21, scope: !342)
!346 = !DILocation(line: 327, column: 9, scope: !336)
!347 = !DILocation(line: 328, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !342, file: !3, line: 327, column: 34)
!349 = !DILocation(line: 328, column: 21, scope: !348)
!350 = !{!108, !110, i64 296}
!351 = !DILocation(line: 329, column: 34, scope: !348)
!352 = !DILocation(line: 329, column: 9, scope: !348)
!353 = !DILocation(line: 329, column: 20, scope: !348)
!354 = !DILocation(line: 329, column: 32, scope: !348)
!355 = !DILocation(line: 330, column: 5, scope: !348)
!356 = !DILocation(line: 331, column: 14, scope: !340)
!357 = !DILocation(line: 331, column: 25, scope: !340)
!358 = !DILocation(line: 331, column: 13, scope: !341)
!359 = !DILocation(line: 332, column: 13, scope: !360)
!360 = distinct !DILexicalBlock(scope: !340, file: !3, line: 331, column: 38)
!361 = !DILocation(line: 332, column: 25, scope: !360)
!362 = !DILocation(line: 333, column: 38, scope: !360)
!363 = !DILocation(line: 333, column: 13, scope: !360)
!364 = !DILocation(line: 333, column: 24, scope: !360)
!365 = !DILocation(line: 333, column: 36, scope: !360)
!366 = !DILocation(line: 334, column: 9, scope: !360)
!367 = !DILocation(line: 335, column: 13, scope: !339)
!368 = !DILocation(line: 335, column: 27, scope: !339)
!369 = !DILocation(line: 336, column: 13, scope: !339)
!370 = !DILocation(line: 336, column: 21, scope: !339)
!371 = !DILocation(line: 337, column: 17, scope: !372)
!372 = distinct !DILexicalBlock(scope: !339, file: !3, line: 337, column: 17)
!373 = !DILocation(line: 337, column: 24, scope: !372)
!374 = !DILocation(line: 337, column: 17, scope: !339)
!375 = !DILocation(line: 338, column: 32, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !3, line: 337, column: 29)
!377 = !DILocation(line: 338, column: 30, scope: !376)
!378 = !DILocation(line: 339, column: 29, scope: !376)
!379 = !DILocation(line: 339, column: 40, scope: !376)
!380 = !DILocation(line: 339, column: 27, scope: !376)
!381 = !DILocation(line: 340, column: 13, scope: !376)
!382 = !DILocation(line: 341, column: 32, scope: !383)
!383 = distinct !DILexicalBlock(scope: !372, file: !3, line: 340, column: 20)
!384 = !DILocation(line: 341, column: 30, scope: !383)
!385 = !DILocation(line: 342, column: 29, scope: !383)
!386 = !DILocation(line: 342, column: 40, scope: !383)
!387 = !DILocation(line: 342, column: 27, scope: !383)
!388 = !DILocation(line: 346, column: 40, scope: !339)
!389 = !DILocation(line: 346, column: 13, scope: !339)
!390 = !DILocation(line: 346, column: 24, scope: !339)
!391 = !DILocation(line: 346, column: 38, scope: !339)
!392 = !DILocation(line: 347, column: 26, scope: !339)
!393 = !DILocation(line: 347, column: 13, scope: !339)
!394 = !DILocation(line: 347, column: 24, scope: !339)
!395 = !DILocation(line: 348, column: 31, scope: !339)
!396 = !DILocation(line: 348, column: 13, scope: !339)
!397 = !DILocation(line: 348, column: 29, scope: !339)
!398 = !DILocation(line: 349, column: 13, scope: !339)
!399 = !DILocation(line: 349, column: 34, scope: !339)
!400 = !{!108, !107, i64 286}
!401 = !DILocation(line: 350, column: 9, scope: !340)
!402 = !DILocation(line: 352, column: 1, scope: !336)
!403 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 354, type: !27, scopeLine: 355, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !404)
!404 = !{!405, !406, !407}
!405 = !DILocalVariable(name: "fp_victim", scope: !403, file: !3, line: 356, type: !50)
!406 = !DILocalVariable(name: "fp_hash_victim", scope: !403, file: !3, line: 357, type: !308)
!407 = !DILocalVariable(name: "index2_victim", scope: !403, file: !3, line: 358, type: !308)
!408 = !DILocation(line: 356, column: 5, scope: !403)
!409 = !DILocation(line: 356, column: 19, scope: !403)
!410 = !DILocation(line: 356, column: 31, scope: !403)
!411 = !DILocation(line: 357, column: 5, scope: !403)
!412 = !DILocation(line: 357, column: 13, scope: !403)
!413 = !DILocation(line: 357, column: 44, scope: !403)
!414 = !DILocation(line: 357, column: 30, scope: !403)
!415 = !DILocation(line: 358, column: 5, scope: !403)
!416 = !DILocation(line: 358, column: 13, scope: !403)
!417 = !DILocation(line: 358, column: 29, scope: !403)
!418 = !DILocation(line: 358, column: 42, scope: !403)
!419 = !DILocation(line: 358, column: 40, scope: !403)
!420 = !DILocation(line: 362, column: 14, scope: !421)
!421 = distinct !DILexicalBlock(scope: !403, file: !3, line: 362, column: 13)
!422 = !DILocation(line: 362, column: 25, scope: !421)
!423 = !DILocation(line: 362, column: 13, scope: !403)
!424 = !DILocation(line: 363, column: 13, scope: !425)
!425 = distinct !DILexicalBlock(scope: !421, file: !3, line: 362, column: 41)
!426 = !DILocation(line: 363, column: 25, scope: !425)
!427 = !DILocation(line: 364, column: 41, scope: !425)
!428 = !DILocation(line: 364, column: 13, scope: !425)
!429 = !DILocation(line: 364, column: 24, scope: !425)
!430 = !DILocation(line: 364, column: 39, scope: !425)
!431 = !DILocation(line: 365, column: 13, scope: !425)
!432 = !DILocation(line: 369, column: 13, scope: !433)
!433 = distinct !DILexicalBlock(scope: !403, file: !3, line: 369, column: 13)
!434 = !DILocation(line: 369, column: 34, scope: !433)
!435 = !DILocation(line: 369, column: 13, scope: !403)
!436 = !DILocation(line: 370, column: 13, scope: !437)
!437 = distinct !DILexicalBlock(scope: !433, file: !3, line: 369, column: 54)
!438 = !DILocation(line: 370, column: 25, scope: !437)
!439 = !DILocation(line: 371, column: 13, scope: !437)
!440 = !DILocation(line: 374, column: 11, scope: !403)
!441 = !DILocation(line: 374, column: 9, scope: !403)
!442 = !DILocation(line: 375, column: 22, scope: !403)
!443 = !DILocation(line: 375, column: 9, scope: !403)
!444 = !DILocation(line: 375, column: 20, scope: !403)
!445 = !DILocation(line: 376, column: 27, scope: !403)
!446 = !DILocation(line: 376, column: 38, scope: !403)
!447 = !DILocation(line: 376, column: 9, scope: !403)
!448 = !DILocation(line: 376, column: 25, scope: !403)
!449 = !DILocation(line: 377, column: 37, scope: !403)
!450 = !DILocation(line: 377, column: 9, scope: !403)
!451 = !DILocation(line: 377, column: 20, scope: !403)
!452 = !DILocation(line: 377, column: 35, scope: !403)
!453 = !DILocation(line: 378, column: 1, scope: !403)
!454 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 380, type: !27, scopeLine: 381, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!455 = !DILocation(line: 382, column: 7, scope: !454)
!456 = !DILocation(line: 382, column: 5, scope: !454)
!457 = !DILocation(line: 383, column: 27, scope: !454)
!458 = !{i8 0, i8 2}
!459 = !DILocation(line: 383, column: 5, scope: !454)
!460 = !DILocation(line: 383, column: 24, scope: !454)
!461 = !DILocation(line: 385, column: 9, scope: !462)
!462 = distinct !DILexicalBlock(scope: !454, file: !3, line: 385, column: 9)
!463 = !DILocation(line: 385, column: 26, scope: !462)
!464 = !DILocation(line: 385, column: 9, scope: !454)
!465 = !DILocation(line: 387, column: 9, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !3, line: 385, column: 42)
!467 = !DILocation(line: 387, column: 17, scope: !466)
!468 = !DILocation(line: 389, column: 5, scope: !466)
!469 = !DILocation(line: 390, column: 1, scope: !454)
!470 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 392, type: !27, scopeLine: 393, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!471 = !DILocation(line: 394, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !470, file: !3, line: 394, column: 9)
!473 = !DILocation(line: 394, column: 20, scope: !472)
!474 = !DILocation(line: 394, column: 35, scope: !472)
!475 = !DILocation(line: 394, column: 32, scope: !472)
!476 = !DILocation(line: 394, column: 9, scope: !470)
!477 = !DILocation(line: 395, column: 9, scope: !478)
!478 = distinct !DILexicalBlock(scope: !472, file: !3, line: 394, column: 52)
!479 = !DILocation(line: 395, column: 20, scope: !478)
!480 = !{!108, !110, i64 297}
!481 = !DILocation(line: 396, column: 5, scope: !478)
!482 = !DILocation(line: 397, column: 13, scope: !483)
!483 = distinct !DILexicalBlock(scope: !484, file: !3, line: 397, column: 13)
!484 = distinct !DILexicalBlock(scope: !472, file: !3, line: 396, column: 12)
!485 = !DILocation(line: 397, column: 24, scope: !483)
!486 = !DILocation(line: 397, column: 39, scope: !483)
!487 = !DILocation(line: 397, column: 36, scope: !483)
!488 = !DILocation(line: 397, column: 13, scope: !484)
!489 = !DILocation(line: 398, column: 13, scope: !490)
!490 = distinct !DILexicalBlock(scope: !483, file: !3, line: 397, column: 56)
!491 = !DILocation(line: 398, column: 24, scope: !490)
!492 = !DILocation(line: 399, column: 9, scope: !490)
!493 = !DILocation(line: 401, column: 13, scope: !494)
!494 = distinct !DILexicalBlock(scope: !483, file: !3, line: 400, column: 14)
!495 = !DILocation(line: 401, column: 24, scope: !494)
!496 = !DILocation(line: 404, column: 1, scope: !470)
!497 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 406, type: !27, scopeLine: 407, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!498 = !DILocation(line: 408, column: 7, scope: !497)
!499 = !DILocation(line: 408, column: 5, scope: !497)
!500 = !DILocation(line: 410, column: 25, scope: !497)
!501 = !DILocation(line: 410, column: 5, scope: !497)
!502 = !DILocation(line: 410, column: 22, scope: !497)
!503 = !DILocation(line: 412, column: 1, scope: !497)
!504 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 414, type: !27, scopeLine: 415, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!505 = !DILocation(line: 416, column: 5, scope: !504)
!506 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 419, type: !27, scopeLine: 419, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!507 = !DILocation(line: 422, column: 1, scope: !506)
!508 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 426, type: !509, scopeLine: 426, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!509 = !DISubroutineType(types: !510)
!510 = !{!23}
!511 = !DILocation(line: 428, column: 16, scope: !508)
!512 = !DILocation(line: 429, column: 10, scope: !508)
!513 = !DILocation(line: 430, column: 12, scope: !508)
!514 = !DILocation(line: 431, column: 5, scope: !508)
!515 = !DILocation(line: 433, column: 5, scope: !508)
!516 = !DILocation(line: 435, column: 5, scope: !508)
!517 = !DILocation(line: 435, column: 11, scope: !508)
!518 = !DILocation(line: 435, column: 29, scope: !508)
!519 = !DILocation(line: 437, column: 9, scope: !520)
!520 = distinct !DILexicalBlock(scope: !508, file: !3, line: 435, column: 44)
!521 = !DILocation(line: 439, column: 9, scope: !520)
!522 = !DILocation(line: 441, column: 9, scope: !520)
!523 = !DILocation(line: 443, column: 9, scope: !520)
!524 = !DILocation(line: 445, column: 12, scope: !525)
!525 = distinct !DILexicalBlock(scope: !520, file: !3, line: 445, column: 12)
!526 = !DILocation(line: 445, column: 29, scope: !525)
!527 = !DILocation(line: 445, column: 12, scope: !520)
!528 = !DILocation(line: 447, column: 13, scope: !529)
!529 = distinct !DILexicalBlock(scope: !525, file: !3, line: 445, column: 44)
!530 = !DILocation(line: 449, column: 16, scope: !531)
!531 = distinct !DILexicalBlock(scope: !529, file: !3, line: 449, column: 16)
!532 = !DILocation(line: 449, column: 28, scope: !531)
!533 = !DILocation(line: 449, column: 41, scope: !531)
!534 = !DILocation(line: 449, column: 44, scope: !531)
!535 = !DILocation(line: 449, column: 56, scope: !531)
!536 = !DILocation(line: 449, column: 16, scope: !529)
!537 = !DILocation(line: 450, column: 17, scope: !538)
!538 = distinct !DILexicalBlock(scope: !531, file: !3, line: 449, column: 70)
!539 = !DILocation(line: 450, column: 23, scope: !538)
!540 = !DILocation(line: 450, column: 36, scope: !538)
!541 = !DILocation(line: 450, column: 45, scope: !538)
!542 = !DILocation(line: 450, column: 49, scope: !538)
!543 = !DILocation(line: 450, column: 71, scope: !538)
!544 = !DILocation(line: 0, scope: !538)
!545 = !DILocation(line: 452, column: 21, scope: !546)
!546 = distinct !DILexicalBlock(scope: !538, file: !3, line: 450, column: 91)
!547 = distinct !{!547, !537, !548}
!548 = !DILocation(line: 454, column: 17, scope: !538)
!549 = !DILocation(line: 455, column: 13, scope: !538)
!550 = !DILocation(line: 457, column: 9, scope: !529)
!551 = !DILocation(line: 459, column: 9, scope: !529)
!552 = !DILocation(line: 461, column: 13, scope: !553)
!553 = distinct !DILexicalBlock(scope: !525, file: !3, line: 459, column: 16)
!554 = !DILocation(line: 463, column: 13, scope: !553)
!555 = distinct !{!555, !516, !556}
!556 = !DILocation(line: 465, column: 5, scope: !508)
!557 = !DILocation(line: 467, column: 5, scope: !508)
!558 = !DILocation(line: 468, column: 1, scope: !508)
!559 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 267, type: !560, scopeLine: 268, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !562)
!560 = !DISubroutineType(types: !561)
!561 = !{!312, !7, !6}
!562 = !{!563, !564, !565, !566}
!563 = !DILocalVariable(name: "data", arg: 1, scope: !559, file: !3, line: 267, type: !7)
!564 = !DILocalVariable(name: "len", arg: 2, scope: !559, file: !3, line: 267, type: !6)
!565 = !DILocalVariable(name: "hash", scope: !559, file: !3, line: 269, type: !18)
!566 = !DILocalVariable(name: "i", scope: !559, file: !3, line: 270, type: !6)
!567 = !DILocation(line: 267, column: 33, scope: !559)
!568 = !DILocation(line: 267, column: 48, scope: !559)
!569 = !DILocation(line: 269, column: 5, scope: !559)
!570 = !DILocation(line: 269, column: 14, scope: !559)
!571 = !DILocation(line: 270, column: 5, scope: !559)
!572 = !DILocation(line: 270, column: 18, scope: !559)
!573 = !DILocation(line: 272, column: 11, scope: !574)
!574 = distinct !DILexicalBlock(scope: !559, file: !3, line: 272, column: 5)
!575 = !DILocation(line: 272, column: 9, scope: !574)
!576 = !DILocation(line: 272, column: 16, scope: !577)
!577 = distinct !DILexicalBlock(scope: !574, file: !3, line: 272, column: 5)
!578 = !DILocation(line: 272, column: 20, scope: !577)
!579 = !DILocation(line: 272, column: 18, scope: !577)
!580 = !DILocation(line: 272, column: 5, scope: !574)
!581 = !DILocation(line: 273, column: 18, scope: !577)
!582 = !DILocation(line: 273, column: 23, scope: !577)
!583 = !DILocation(line: 273, column: 31, scope: !577)
!584 = !DILocation(line: 273, column: 29, scope: !577)
!585 = !DILocation(line: 273, column: 41, scope: !577)
!586 = !DILocation(line: 273, column: 40, scope: !577)
!587 = !DILocation(line: 273, column: 39, scope: !577)
!588 = !DILocation(line: 273, column: 37, scope: !577)
!589 = !DILocation(line: 273, column: 14, scope: !577)
!590 = !DILocation(line: 273, column: 9, scope: !577)
!591 = !DILocation(line: 272, column: 29, scope: !577)
!592 = !DILocation(line: 272, column: 34, scope: !577)
!593 = !DILocation(line: 272, column: 5, scope: !577)
!594 = distinct !{!594, !580, !595}
!595 = !DILocation(line: 273, column: 45, scope: !574)
!596 = !DILocation(line: 276, column: 12, scope: !559)
!597 = !DILocation(line: 277, column: 1, scope: !559)
!598 = !DILocation(line: 276, column: 5, scope: !559)
