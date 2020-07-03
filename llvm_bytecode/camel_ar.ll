; ModuleID = 'camel_ar.bc'
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !32
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !86
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !23
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !30
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !18
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !88
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local void @camel_init() #0 !dbg !100 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !102, !tbaa !103
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !107, !tbaa !108
  %conv = zext i8 %0 to i16, !dbg !107
  %or = or i16 %conv, 1, !dbg !107
  %conv1 = trunc i16 %or to i8, !dbg !107
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !107, !tbaa !108
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !109, !tbaa !108
  %conv2 = zext i8 %1 to i16, !dbg !109
  %and = and i16 %conv2, -2, !dbg !109
  %conv3 = trunc i16 %and to i8, !dbg !109
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !109, !tbaa !108
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !110, !tbaa !103
  %and4 = and i16 %2, -2, !dbg !110
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
define dso_local void @camel_recover() #0 !dbg !118 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !124, !tbaa !126
  %cmp = icmp eq i16 %0, 1, !dbg !132
  br i1 %cmp, label %if.then, label %if.else, !dbg !133

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !134, !tbaa !136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !138, !tbaa !136
  br label %if.end4, !dbg !139

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !140, !tbaa !126
  %cmp1 = icmp eq i16 %1, 2, !dbg !142
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !143

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !144, !tbaa !136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !146, !tbaa !136
  br label %if.end, !dbg !147

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !148
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !150, !tbaa !136
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !150
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !150
  %3 = load i16, i16* %arrayidx, align 2, !dbg !150, !tbaa !152
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #6, !dbg !150, !srcloc !153
  %4 = bitcast i16* %__x to i8*, !dbg !154
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #6, !dbg !154
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !120, metadata !DIExpression()), !dbg !154
  %5 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !154, !srcloc !155
  store i16 %5, i16* %__x, align 2, !dbg !154, !tbaa !103
  %6 = load i16, i16* %__x, align 2, !dbg !154, !tbaa !103
  store i16 %6, i16* %tmp, align 2, !dbg !154, !tbaa !103
  %7 = bitcast i16* %__x to i8*, !dbg !156
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #6, !dbg !156
  %8 = load i16, i16* %tmp, align 2, !dbg !154, !tbaa !103
  %add = add i16 %8, 2, !dbg !157
  %9 = inttoptr i16 %add to i8*, !dbg !156
  %10 = bitcast i16* %__x5 to i8*, !dbg !158
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #6, !dbg !158
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !122, metadata !DIExpression()), !dbg !158
  %11 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !158, !srcloc !159
  store i16 %11, i16* %__x5, align 2, !dbg !158, !tbaa !103
  %12 = load i16, i16* %__x5, align 2, !dbg !158, !tbaa !103
  store i16 %12, i16* %tmp6, align 2, !dbg !158, !tbaa !103
  %13 = bitcast i16* %__x5 to i8*, !dbg !160
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %13) #6, !dbg !160
  %14 = load i16, i16* %tmp6, align 2, !dbg !158, !tbaa !103
  %add7 = add i16 %14, 2, !dbg !161
  %sub = sub i16 9216, %add7, !dbg !162
  %call = call zeroext i16 @__fast_hw_crc(i8* %9, i16 zeroext %sub, i16 zeroext -1), !dbg !163
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !164, !tbaa !152
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !165, !tbaa !136
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !165
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !166, !tbaa !152
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 186, i16 zeroext %17), !dbg !167
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !168, !tbaa !152
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !169, !tbaa !152
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !171, !tbaa !136
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !172
  %20 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !172, !tbaa !173
  %cmp9 = icmp eq i16 %18, %20, !dbg !174
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !175

if.then10:                                        ; preds = %if.end4
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !176, !tbaa !136
  %22 = bitcast %struct.camel_buffer_t* %21 to i8*, !dbg !178
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !179, !tbaa !136
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !178
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %22, i8* align 2 %24, i16 188, i1 false), !dbg !178
  call void @camel_init(), !dbg !180
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !181, !tbaa !136
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !182
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !181
  call void @__restore_registers(i16* %arraydecay), !dbg !183
  br label %if.end13, !dbg !184

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !185
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !187
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

; Function Attrs: nounwind
define dso_local void @commit() #0 !dbg !188 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !202

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !203, !tbaa !126
  %cmp = icmp eq i16 %0, 1, !dbg !204
  br i1 %cmp, label %if.then, label %if.else, !dbg !205

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !206, !tbaa !136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !207, !tbaa !136
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !208, !tbaa !136
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !209
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !208
  call void @__dump_registers(i16* %arraydecay), !dbg !210
  %2 = bitcast i16* %__x to i8*, !dbg !211
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #6, !dbg !211
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !190, metadata !DIExpression()), !dbg !211
  %3 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !211, !srcloc !212
  store i16 %3, i16* %__x, align 2, !dbg !211, !tbaa !103
  %4 = load i16, i16* %__x, align 2, !dbg !211, !tbaa !103
  store i16 %4, i16* %tmp, align 2, !dbg !211, !tbaa !103
  %5 = bitcast i16* %__x to i8*, !dbg !213
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #6, !dbg !213
  %6 = load i16, i16* %tmp, align 2, !dbg !211, !tbaa !103
  %add = add i16 %6, 2, !dbg !214
  %7 = inttoptr i16 %add to i8*, !dbg !213
  %8 = bitcast i16* %__x1 to i8*, !dbg !215
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #6, !dbg !215
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !195, metadata !DIExpression()), !dbg !215
  %9 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !215, !srcloc !216
  store i16 %9, i16* %__x1, align 2, !dbg !215, !tbaa !103
  %10 = load i16, i16* %__x1, align 2, !dbg !215, !tbaa !103
  store i16 %10, i16* %tmp2, align 2, !dbg !215, !tbaa !103
  %11 = bitcast i16* %__x1 to i8*, !dbg !217
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #6, !dbg !217
  %12 = load i16, i16* %tmp2, align 2, !dbg !215, !tbaa !103
  %add3 = add i16 %12, 2, !dbg !218
  %sub = sub i16 9216, %add3, !dbg !219
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !220
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !221, !tbaa !152
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !222, !tbaa !136
  %14 = bitcast %struct.camel_buffer_t* %13 to i8*, !dbg !222
  %15 = load i16, i16* @tmp_stack_crc, align 2, !dbg !223, !tbaa !152
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %14, i16 zeroext 186, i16 zeroext %15), !dbg !224
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !225, !tbaa !152
  %16 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !226, !tbaa !152
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !227, !tbaa !136
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 2, !dbg !228
  store i16 %16, i16* %stack_and_buf_crc, align 2, !dbg !229, !tbaa !173
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !230, !tbaa !126
  br label %if.end, !dbg !231

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !232, !tbaa !136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !233, !tbaa !136
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !234, !tbaa !136
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !235
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !234
  call void @__dump_registers(i16* %arraydecay6), !dbg !236
  %19 = bitcast i16* %__x7 to i8*, !dbg !237
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %19) #6, !dbg !237
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !197, metadata !DIExpression()), !dbg !237
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !237, !srcloc !238
  store i16 %20, i16* %__x7, align 2, !dbg !237, !tbaa !103
  %21 = load i16, i16* %__x7, align 2, !dbg !237, !tbaa !103
  store i16 %21, i16* %tmp8, align 2, !dbg !237, !tbaa !103
  %22 = bitcast i16* %__x7 to i8*, !dbg !239
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #6, !dbg !239
  %23 = load i16, i16* %tmp8, align 2, !dbg !237, !tbaa !103
  %add9 = add i16 %23, 2, !dbg !240
  %24 = inttoptr i16 %add9 to i8*, !dbg !239
  %25 = bitcast i16* %__x10 to i8*, !dbg !241
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %25) #6, !dbg !241
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !200, metadata !DIExpression()), !dbg !241
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !241, !srcloc !242
  store i16 %26, i16* %__x10, align 2, !dbg !241, !tbaa !103
  %27 = load i16, i16* %__x10, align 2, !dbg !241, !tbaa !103
  store i16 %27, i16* %tmp11, align 2, !dbg !241, !tbaa !103
  %28 = bitcast i16* %__x10 to i8*, !dbg !243
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #6, !dbg !243
  %29 = load i16, i16* %tmp11, align 2, !dbg !241, !tbaa !103
  %add12 = add i16 %29, 2, !dbg !244
  %sub13 = sub i16 9216, %add12, !dbg !245
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub13, i16 zeroext -1), !dbg !246
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !247, !tbaa !152
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !248, !tbaa !136
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !248
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !249, !tbaa !152
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 186, i16 zeroext %32), !dbg !250
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !251, !tbaa !152
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !252, !tbaa !152
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !253, !tbaa !136
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !254
  store i16 %33, i16* %stack_and_buf_crc16, align 2, !dbg !255, !tbaa !173
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !256, !tbaa !126
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !257

do.end:                                           ; preds = %if.end
  ret void, !dbg !258
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: nounwind
define dso_local i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %result, i16 %seed) #0 !dbg !259 {
entry:
  %result.addr = alloca %struct.threeAxis_t_8*, align 2
  %seed.addr = alloca i16, align 2
  store %struct.threeAxis_t_8* %result, %struct.threeAxis_t_8** %result.addr, align 2, !tbaa !136
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %result.addr, metadata !264, metadata !DIExpression()), !dbg !266
  store i16 %seed, i16* %seed.addr, align 2, !tbaa !103
  call void @llvm.dbg.declare(metadata i16* %seed.addr, metadata !265, metadata !DIExpression()), !dbg !267
  %0 = load i16, i16* %seed.addr, align 2, !dbg !268, !tbaa !103
  %mul = mul i16 %0, 17, !dbg !269
  %rem = urem i16 %mul, 85, !dbg !270
  %conv = trunc i16 %rem to i8, !dbg !271
  %1 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !272, !tbaa !136
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %1, i32 0, i32 0, !dbg !273
  store i8 %conv, i8* %x, align 1, !dbg !274, !tbaa !275
  %2 = load i16, i16* %seed.addr, align 2, !dbg !277, !tbaa !103
  %mul1 = mul i16 %2, 17, !dbg !278
  %mul2 = mul i16 %mul1, 17, !dbg !279
  %rem3 = urem i16 %mul2, 85, !dbg !280
  %conv4 = trunc i16 %rem3 to i8, !dbg !281
  %3 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !282, !tbaa !136
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %3, i32 0, i32 1, !dbg !283
  store i8 %conv4, i8* %y, align 1, !dbg !284, !tbaa !285
  %4 = load i16, i16* %seed.addr, align 2, !dbg !286, !tbaa !103
  %mul5 = mul i16 %4, 17, !dbg !287
  %mul6 = mul i16 %mul5, 17, !dbg !288
  %mul7 = mul i16 %mul6, 17, !dbg !289
  %rem8 = urem i16 %mul7, 85, !dbg !290
  %conv9 = trunc i16 %rem8 to i8, !dbg !291
  %5 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !292, !tbaa !136
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %5, i32 0, i32 2, !dbg !293
  store i8 %conv9, i8* %z, align 1, !dbg !294, !tbaa !295
  %6 = load i16, i16* %seed.addr, align 2, !dbg !296, !tbaa !103
  %inc = add i16 %6, 1, !dbg !296
  store i16 %inc, i16* %seed.addr, align 2, !dbg !296, !tbaa !103
  %7 = load i16, i16* %seed.addr, align 2, !dbg !297, !tbaa !103
  ret i16 %7, !dbg !298
}

; Function Attrs: nounwind
define dso_local void @task_init() #0 !dbg !299 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !300
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !300
  store i16 3, i16* %pinState, align 2, !dbg !301, !tbaa !302
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !303
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !303
  store i16 0, i16* %count, align 2, !dbg !304, !tbaa !305
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !306
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !306
  store i16 1, i16* %seed, align 2, !dbg !307, !tbaa !308
  ret void, !dbg !309
}

; Function Attrs: nounwind
define dso_local void @task_selectMode() #0 !dbg !310 {
entry:
  %pin_state = alloca i16, align 2
  %mode = alloca i16, align 2
  %class = alloca i16, align 2
  %0 = bitcast i16* %pin_state to i8*, !dbg !315
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !315
  call void @llvm.dbg.declare(metadata i16* %pin_state, metadata !312, metadata !DIExpression()), !dbg !316
  store i16 1, i16* %pin_state, align 2, !dbg !316, !tbaa !152
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !317, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !317
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !317
  %2 = load i16, i16* %count, align 2, !dbg !318, !tbaa !305
  %inc = add i16 %2, 1, !dbg !318
  store i16 %inc, i16* %count, align 2, !dbg !318, !tbaa !305
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !319
  %count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !319
  %4 = load i16, i16* %count2, align 2, !dbg !319, !tbaa !305
  %cmp = icmp uge i16 %4, 3, !dbg !321
  br i1 %cmp, label %if.then, label %if.end, !dbg !322

if.then:                                          ; preds = %entry
  store i16 2, i16* %pin_state, align 2, !dbg !323, !tbaa !152
  br label %if.end, !dbg !324

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !325, !tbaa !136
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !325
  %count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !325
  %6 = load i16, i16* %count4, align 2, !dbg !325, !tbaa !305
  %cmp5 = icmp uge i16 %6, 5, !dbg !327
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !328

if.then6:                                         ; preds = %if.end
  store i16 0, i16* %pin_state, align 2, !dbg !329, !tbaa !152
  br label %if.end7, !dbg !330

if.end7:                                          ; preds = %if.then6, %if.end
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331, !tbaa !136
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !331
  %count9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 14, !dbg !331
  %8 = load i16, i16* %count9, align 2, !dbg !331, !tbaa !305
  %cmp10 = icmp uge i16 %8, 7, !dbg !333
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !334

if.then11:                                        ; preds = %if.end7
  call void @task_done(), !dbg !335
  br label %if.end12, !dbg !337

if.end12:                                         ; preds = %if.then11, %if.end7
  %9 = bitcast i16* %mode to i8*, !dbg !338
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %9) #6, !dbg !338
  call void @llvm.dbg.declare(metadata i16* %mode, metadata !313, metadata !DIExpression()), !dbg !339
  %10 = bitcast i16* %class to i8*, !dbg !340
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #6, !dbg !340
  call void @llvm.dbg.declare(metadata i16* %class, metadata !314, metadata !DIExpression()), !dbg !341
  %11 = load i16, i16* %pin_state, align 2, !dbg !342, !tbaa !152
  %cmp13 = icmp eq i16 %11, 2, !dbg !344
  br i1 %cmp13, label %land.lhs.true, label %lor.lhs.false, !dbg !345

lor.lhs.false:                                    ; preds = %if.end12
  %12 = load i16, i16* %pin_state, align 2, !dbg !346, !tbaa !152
  %cmp14 = icmp eq i16 %12, 1, !dbg !347
  br i1 %cmp14, label %land.lhs.true, label %if.else, !dbg !348

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end12
  %13 = load i16, i16* %pin_state, align 2, !dbg !349, !tbaa !152
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350, !tbaa !136
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !350
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !350
  %15 = load i16, i16* %pinState, align 2, !dbg !350, !tbaa !302
  %cmp16 = icmp eq i16 %13, %15, !dbg !351
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !352

if.then17:                                        ; preds = %land.lhs.true
  store i16 3, i16* %pin_state, align 2, !dbg !353, !tbaa !152
  br label %if.end20, !dbg !355

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %16 = load i16, i16* %pin_state, align 2, !dbg !356, !tbaa !152
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358, !tbaa !136
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !358
  %pinState19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 0, !dbg !358
  store i16 %16, i16* %pinState19, align 2, !dbg !359, !tbaa !302
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  %18 = load i16, i16* %pin_state, align 2, !dbg !360, !tbaa !152
  switch i16 %18, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb27
    i16 0, label %sw.bb36
  ], !dbg !361

sw.bb:                                            ; preds = %if.end20
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !362, !tbaa !136
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !362
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 1, !dbg !362
  store i16 0, i16* %discardedSamplesCount, align 2, !dbg !364, !tbaa !365
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366, !tbaa !136
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !366
  %mode23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 12, !dbg !366
  store i16 2, i16* %mode23, align 2, !dbg !367, !tbaa !368
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369, !tbaa !136
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !369
  %class25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 2, !dbg !369
  store i16 0, i16* %class25, align 2, !dbg !370, !tbaa !371
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372, !tbaa !136
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !372
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 11, !dbg !372
  store i16 0, i16* %samplesInWindow, align 2, !dbg !373, !tbaa !374
  br label %sw.epilog, !dbg !375

sw.bb27:                                          ; preds = %if.end20
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !376, !tbaa !136
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !376
  %discardedSamplesCount29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 1, !dbg !376
  store i16 0, i16* %discardedSamplesCount29, align 2, !dbg !377, !tbaa !365
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378, !tbaa !136
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !378
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !378
  store i16 1, i16* %mode31, align 2, !dbg !379, !tbaa !368
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380, !tbaa !136
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !380
  %class33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 2, !dbg !380
  store i16 1, i16* %class33, align 2, !dbg !381, !tbaa !371
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !382, !tbaa !136
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !382
  %samplesInWindow35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 11, !dbg !382
  store i16 0, i16* %samplesInWindow35, align 2, !dbg !383, !tbaa !374
  br label %sw.epilog, !dbg !384

sw.bb36:                                          ; preds = %if.end20
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385, !tbaa !136
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !385
  %mode38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 12, !dbg !385
  store i16 0, i16* %mode38, align 2, !dbg !386, !tbaa !368
  br label %sw.epilog, !dbg !387

sw.default:                                       ; preds = %if.end20
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388, !tbaa !136
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !388
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !388
  store i16 3, i16* %mode40, align 2, !dbg !389, !tbaa !368
  br label %sw.epilog, !dbg !390

sw.epilog:                                        ; preds = %sw.default, %sw.bb36, %sw.bb27, %sw.bb
  %29 = bitcast i16* %class to i8*, !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #6, !dbg !391
  %30 = bitcast i16* %mode to i8*, !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #6, !dbg !391
  %31 = bitcast i16* %pin_state to i8*, !dbg !391
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #6, !dbg !391
  ret void, !dbg !391
}

; Function Attrs: nounwind
define dso_local void @task_resetStats() #0 !dbg !392 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !393
  %movingCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !393
  store i16 0, i16* %movingCount, align 2, !dbg !394, !tbaa !395
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !396
  %stationaryCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !396
  store i16 0, i16* %stationaryCount, align 2, !dbg !397, !tbaa !398
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !399
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !399
  store i16 0, i16* %totalCount, align 2, !dbg !400, !tbaa !401
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !402, !tbaa !136
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !402
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !402
  store i16 0, i16* %samplesInWindow, align 2, !dbg !403, !tbaa !374
  ret void, !dbg !404
}

; Function Attrs: nounwind
define dso_local void @task_sample() #0 !dbg !405 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  %0 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !408
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #6, !dbg !408
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !407, metadata !DIExpression()), !dbg !409
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !410, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !410
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !410
  %2 = load i16, i16* %seed, align 2, !dbg !410, !tbaa !308
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %2), !dbg !411
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !412
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !412
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !413
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 11, !dbg !413
  %5 = load i16, i16* %samplesInWindow, align 2, !dbg !413, !tbaa !374
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %5, !dbg !412
  %6 = bitcast %struct.threeAxis_t_8* %arrayidx to i8*, !dbg !414
  %7 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !414
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 1 %6, i8* align 1 %7, i16 3, i1 false), !dbg !414, !tbaa.struct !415
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !416, !tbaa !136
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !416
  %samplesInWindow4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !416
  %9 = load i16, i16* %samplesInWindow4, align 2, !dbg !417, !tbaa !374
  %inc = add i16 %9, 1, !dbg !417
  store i16 %inc, i16* %samplesInWindow4, align 2, !dbg !417, !tbaa !374
  %10 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !418
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %10) #6, !dbg !418
  ret void, !dbg !418
}

; Function Attrs: nounwind
define dso_local void @task_transform() #0 !dbg !419 {
entry:
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !426
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !426
  store i16 0, i16* %samplesInWindow, align 2, !dbg !427, !tbaa !374
  %1 = bitcast %struct.threeAxis_t_8** %sample to i8*, !dbg !428
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #6, !dbg !428
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !421, metadata !DIExpression()), !dbg !429
  %2 = bitcast %struct.threeAxis_t_8* %transformedSample to i8*, !dbg !430
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %2) #6, !dbg !430
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !423, metadata !DIExpression()), !dbg !431
  %3 = bitcast i16* %i to i8*, !dbg !432
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #6, !dbg !432
  call void @llvm.dbg.declare(metadata i16* %i, metadata !424, metadata !DIExpression()), !dbg !433
  store i16 0, i16* %i, align 2, !dbg !433, !tbaa !103
  br label %for.cond, !dbg !432

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !434, !tbaa !103
  %cmp = icmp ult i16 %4, 3, !dbg !436
  br i1 %cmp, label %for.body, label %for.cond.cleanup, !dbg !437

for.cond.cleanup:                                 ; preds = %for.cond
  %5 = bitcast i16* %i to i8*, !dbg !438
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #6, !dbg !438
  br label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !439, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !439
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !439
  %7 = load i16, i16* %i, align 2, !dbg !442, !tbaa !103
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %7, !dbg !439
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !443
  %8 = load i8, i8* %x, align 1, !dbg !443, !tbaa !275
  %conv = sext i8 %8 to i16, !dbg !439
  %cmp2 = icmp slt i16 %conv, 10, !dbg !444
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !445

lor.lhs.false:                                    ; preds = %for.body
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446, !tbaa !136
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !446
  %window5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !446
  %10 = load i16, i16* %i, align 2, !dbg !447, !tbaa !103
  %arrayidx6 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window5, i16 0, i16 %10, !dbg !446
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx6, i32 0, i32 1, !dbg !448
  %11 = load i8, i8* %y, align 1, !dbg !448, !tbaa !285
  %conv7 = sext i8 %11 to i16, !dbg !446
  %cmp8 = icmp slt i16 %conv7, 10, !dbg !449
  br i1 %cmp8, label %if.then, label %lor.lhs.false10, !dbg !450

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !451, !tbaa !136
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !451
  %window12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !451
  %13 = load i16, i16* %i, align 2, !dbg !452, !tbaa !103
  %arrayidx13 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window12, i16 0, i16 %13, !dbg !451
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx13, i32 0, i32 2, !dbg !453
  %14 = load i8, i8* %z, align 1, !dbg !453, !tbaa !295
  %conv14 = sext i8 %14 to i16, !dbg !451
  %cmp15 = icmp slt i16 %conv14, 10, !dbg !454
  br i1 %cmp15, label %if.then, label %if.end, !dbg !455

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %for.body
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !456, !tbaa !136
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !456
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !456
  %16 = load i16, i16* %i, align 2, !dbg !458, !tbaa !103
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %16, !dbg !456
  %x20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 0, !dbg !459
  %17 = load i8, i8* %x20, align 1, !dbg !459, !tbaa !275
  %conv21 = sext i8 %17 to i16, !dbg !456
  %cmp22 = icmp sgt i16 %conv21, 10, !dbg !460
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !461

cond.true:                                        ; preds = %if.then
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !462, !tbaa !136
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !462
  %window25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 6, !dbg !462
  %19 = load i16, i16* %i, align 2, !dbg !463, !tbaa !103
  %arrayidx26 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window25, i16 0, i16 %19, !dbg !462
  %x27 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx26, i32 0, i32 0, !dbg !464
  %20 = load i8, i8* %x27, align 1, !dbg !464, !tbaa !275
  %conv28 = sext i8 %20 to i16, !dbg !462
  br label %cond.end, !dbg !461

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !461

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv28, %cond.true ], [ 0, %cond.false ], !dbg !461
  %conv29 = trunc i16 %cond to i8, !dbg !461
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !465, !tbaa !136
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !465
  %window31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 6, !dbg !465
  %22 = load i16, i16* %i, align 2, !dbg !466, !tbaa !103
  %arrayidx32 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window31, i16 0, i16 %22, !dbg !465
  %x33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx32, i32 0, i32 0, !dbg !467
  store i8 %conv29, i8* %x33, align 1, !dbg !468, !tbaa !275
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !469, !tbaa !136
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !469
  %window35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 6, !dbg !469
  %24 = load i16, i16* %i, align 2, !dbg !470, !tbaa !103
  %arrayidx36 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window35, i16 0, i16 %24, !dbg !469
  %y37 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx36, i32 0, i32 1, !dbg !471
  %25 = load i8, i8* %y37, align 1, !dbg !471, !tbaa !285
  %conv38 = sext i8 %25 to i16, !dbg !469
  %cmp39 = icmp sgt i16 %conv38, 10, !dbg !472
  br i1 %cmp39, label %cond.true41, label %cond.false47, !dbg !473

cond.true41:                                      ; preds = %cond.end
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474, !tbaa !136
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !474
  %window43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 6, !dbg !474
  %27 = load i16, i16* %i, align 2, !dbg !475, !tbaa !103
  %arrayidx44 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window43, i16 0, i16 %27, !dbg !474
  %y45 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx44, i32 0, i32 1, !dbg !476
  %28 = load i8, i8* %y45, align 1, !dbg !476, !tbaa !285
  %conv46 = sext i8 %28 to i16, !dbg !474
  br label %cond.end48, !dbg !473

cond.false47:                                     ; preds = %cond.end
  br label %cond.end48, !dbg !473

cond.end48:                                       ; preds = %cond.false47, %cond.true41
  %cond49 = phi i16 [ %conv46, %cond.true41 ], [ 0, %cond.false47 ], !dbg !473
  %conv50 = trunc i16 %cond49 to i8, !dbg !473
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477, !tbaa !136
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !477
  %window52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 6, !dbg !477
  %30 = load i16, i16* %i, align 2, !dbg !478, !tbaa !103
  %arrayidx53 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window52, i16 0, i16 %30, !dbg !477
  %y54 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx53, i32 0, i32 1, !dbg !479
  store i8 %conv50, i8* %y54, align 1, !dbg !480, !tbaa !285
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481, !tbaa !136
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !481
  %window56 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 6, !dbg !481
  %32 = load i16, i16* %i, align 2, !dbg !482, !tbaa !103
  %arrayidx57 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window56, i16 0, i16 %32, !dbg !481
  %z58 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx57, i32 0, i32 2, !dbg !483
  %33 = load i8, i8* %z58, align 1, !dbg !483, !tbaa !295
  %conv59 = sext i8 %33 to i16, !dbg !481
  %cmp60 = icmp sgt i16 %conv59, 10, !dbg !484
  br i1 %cmp60, label %cond.true62, label %cond.false68, !dbg !485

cond.true62:                                      ; preds = %cond.end48
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !486, !tbaa !136
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !486
  %window64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 6, !dbg !486
  %35 = load i16, i16* %i, align 2, !dbg !487, !tbaa !103
  %arrayidx65 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window64, i16 0, i16 %35, !dbg !486
  %z66 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx65, i32 0, i32 2, !dbg !488
  %36 = load i8, i8* %z66, align 1, !dbg !488, !tbaa !295
  %conv67 = sext i8 %36 to i16, !dbg !486
  br label %cond.end69, !dbg !485

cond.false68:                                     ; preds = %cond.end48
  br label %cond.end69, !dbg !485

cond.end69:                                       ; preds = %cond.false68, %cond.true62
  %cond70 = phi i16 [ %conv67, %cond.true62 ], [ 0, %cond.false68 ], !dbg !485
  %conv71 = trunc i16 %cond70 to i8, !dbg !485
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !489, !tbaa !136
  %globals72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !489
  %window73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals72, i32 0, i32 6, !dbg !489
  %38 = load i16, i16* %i, align 2, !dbg !490, !tbaa !103
  %arrayidx74 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window73, i16 0, i16 %38, !dbg !489
  %z75 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx74, i32 0, i32 2, !dbg !491
  store i8 %conv71, i8* %z75, align 1, !dbg !492, !tbaa !295
  br label %if.end, !dbg !493

if.end:                                           ; preds = %cond.end69, %lor.lhs.false10
  br label %for.inc, !dbg !494

for.inc:                                          ; preds = %if.end
  %39 = load i16, i16* %i, align 2, !dbg !495, !tbaa !103
  %inc = add i16 %39, 1, !dbg !495
  store i16 %inc, i16* %i, align 2, !dbg !495, !tbaa !103
  br label %for.cond, !dbg !438, !llvm.loop !496

for.end:                                          ; preds = %for.cond.cleanup
  %40 = bitcast %struct.threeAxis_t_8* %transformedSample to i8*, !dbg !498
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %40) #6, !dbg !498
  %41 = bitcast %struct.threeAxis_t_8** %sample to i8*, !dbg !498
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %41) #6, !dbg !498
  ret void, !dbg !498
}

; Function Attrs: nounwind
define dso_local void @task_featurize() #0 !dbg !499 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  %0 = bitcast %struct.threeAxis_t_8* %mean to i8*, !dbg !508
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #6, !dbg !508
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !501, metadata !DIExpression()), !dbg !509
  %1 = bitcast %struct.threeAxis_t_8* %stddev to i8*, !dbg !508
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %1) #6, !dbg !508
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !502, metadata !DIExpression()), !dbg !510
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !511
  store i8 0, i8* %z, align 1, !dbg !512, !tbaa !295
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !513
  store i8 0, i8* %y, align 1, !dbg !514, !tbaa !285
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !515
  store i8 0, i8* %x, align 1, !dbg !516, !tbaa !275
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !517
  store i8 0, i8* %z1, align 1, !dbg !518, !tbaa !295
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !519
  store i8 0, i8* %y2, align 1, !dbg !520, !tbaa !285
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !521
  store i8 0, i8* %x3, align 1, !dbg !522, !tbaa !275
  %2 = bitcast %struct.features_t* %features to i8*, !dbg !523
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !dbg !523
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !503, metadata !DIExpression()), !dbg !524
  %3 = bitcast i16* %i to i8*, !dbg !525
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #6, !dbg !525
  call void @llvm.dbg.declare(metadata i16* %i, metadata !504, metadata !DIExpression()), !dbg !526
  store i16 0, i16* %i, align 2, !dbg !527, !tbaa !103
  br label %for.cond, !dbg !529

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !530, !tbaa !103
  %cmp = icmp slt i16 %4, 3, !dbg !532
  br i1 %cmp, label %for.body, label %for.end, !dbg !533

for.body:                                         ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !534, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !534
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !534
  %6 = load i16, i16* %i, align 2, !dbg !536, !tbaa !103
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %6, !dbg !534
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !537
  %7 = load i8, i8* %x4, align 1, !dbg !537, !tbaa !275
  %conv = sext i8 %7 to i16, !dbg !534
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !538
  %8 = load i8, i8* %x5, align 1, !dbg !539, !tbaa !275
  %conv6 = sext i8 %8 to i16, !dbg !539
  %add = add nsw i16 %conv6, %conv, !dbg !539
  %conv7 = trunc i16 %add to i8, !dbg !539
  store i8 %conv7, i8* %x5, align 1, !dbg !539, !tbaa !275
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !540, !tbaa !136
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !540
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !540
  %10 = load i16, i16* %i, align 2, !dbg !541, !tbaa !103
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %10, !dbg !540
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !542
  %11 = load i8, i8* %y11, align 1, !dbg !542, !tbaa !285
  %conv12 = sext i8 %11 to i16, !dbg !540
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !543
  %12 = load i8, i8* %y13, align 1, !dbg !544, !tbaa !285
  %conv14 = sext i8 %12 to i16, !dbg !544
  %add15 = add nsw i16 %conv14, %conv12, !dbg !544
  %conv16 = trunc i16 %add15 to i8, !dbg !544
  store i8 %conv16, i8* %y13, align 1, !dbg !544, !tbaa !285
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !545, !tbaa !136
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !545
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !545
  %14 = load i16, i16* %i, align 2, !dbg !546, !tbaa !103
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %14, !dbg !545
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !547
  %15 = load i8, i8* %z20, align 1, !dbg !547, !tbaa !295
  %conv21 = sext i8 %15 to i16, !dbg !545
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !548
  %16 = load i8, i8* %z22, align 1, !dbg !549, !tbaa !295
  %conv23 = sext i8 %16 to i16, !dbg !549
  %add24 = add nsw i16 %conv23, %conv21, !dbg !549
  %conv25 = trunc i16 %add24 to i8, !dbg !549
  store i8 %conv25, i8* %z22, align 1, !dbg !549, !tbaa !295
  br label %for.inc, !dbg !550

for.inc:                                          ; preds = %for.body
  %17 = load i16, i16* %i, align 2, !dbg !551, !tbaa !103
  %inc = add nsw i16 %17, 1, !dbg !551
  store i16 %inc, i16* %i, align 2, !dbg !551, !tbaa !103
  br label %for.cond, !dbg !552, !llvm.loop !553

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !555
  %18 = load i8, i8* %x26, align 1, !dbg !556, !tbaa !275
  %conv27 = sext i8 %18 to i16, !dbg !556
  %shr = ashr i16 %conv27, 2, !dbg !556
  %conv28 = trunc i16 %shr to i8, !dbg !556
  store i8 %conv28, i8* %x26, align 1, !dbg !556, !tbaa !275
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !557
  %19 = load i8, i8* %y29, align 1, !dbg !558, !tbaa !285
  %conv30 = sext i8 %19 to i16, !dbg !558
  %shr31 = ashr i16 %conv30, 2, !dbg !558
  %conv32 = trunc i16 %shr31 to i8, !dbg !558
  store i8 %conv32, i8* %y29, align 1, !dbg !558, !tbaa !285
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !559
  %20 = load i8, i8* %z33, align 1, !dbg !560, !tbaa !295
  %conv34 = sext i8 %20 to i16, !dbg !560
  %shr35 = ashr i16 %conv34, 2, !dbg !560
  %conv36 = trunc i16 %shr35 to i8, !dbg !560
  store i8 %conv36, i8* %z33, align 1, !dbg !560, !tbaa !295
  store i16 0, i16* %i, align 2, !dbg !561, !tbaa !103
  br label %for.cond37, !dbg !563

for.cond37:                                       ; preds = %for.inc135, %for.end
  %21 = load i16, i16* %i, align 2, !dbg !564, !tbaa !103
  %cmp38 = icmp slt i16 %21, 3, !dbg !566
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !567

for.body40:                                       ; preds = %for.cond37
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !568, !tbaa !136
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !568
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !568
  %23 = load i16, i16* %i, align 2, !dbg !570, !tbaa !103
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %23, !dbg !568
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !571
  %24 = load i8, i8* %x44, align 1, !dbg !571, !tbaa !275
  %conv45 = sext i8 %24 to i16, !dbg !568
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !572
  %25 = load i8, i8* %x46, align 1, !dbg !572, !tbaa !275
  %conv47 = sext i8 %25 to i16, !dbg !573
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !574
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !568

cond.true:                                        ; preds = %for.body40
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !575, !tbaa !136
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !575
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !575
  %27 = load i16, i16* %i, align 2, !dbg !576, !tbaa !103
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %27, !dbg !575
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !577
  %28 = load i8, i8* %x53, align 1, !dbg !577, !tbaa !275
  %conv54 = sext i8 %28 to i16, !dbg !575
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !578
  %29 = load i8, i8* %x55, align 1, !dbg !578, !tbaa !275
  %conv56 = sext i8 %29 to i16, !dbg !579
  %sub = sub nsw i16 %conv54, %conv56, !dbg !580
  br label %cond.end, !dbg !568

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !581
  %30 = load i8, i8* %x57, align 1, !dbg !581, !tbaa !275
  %conv58 = sext i8 %30 to i16, !dbg !582
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !583, !tbaa !136
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !583
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !583
  %32 = load i16, i16* %i, align 2, !dbg !584, !tbaa !103
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %32, !dbg !583
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !585
  %33 = load i8, i8* %x62, align 1, !dbg !585, !tbaa !275
  %conv63 = sext i8 %33 to i16, !dbg !583
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !586
  br label %cond.end, !dbg !568

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !568
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !587
  %34 = load i8, i8* %x65, align 1, !dbg !588, !tbaa !275
  %conv66 = sext i8 %34 to i16, !dbg !588
  %add67 = add nsw i16 %conv66, %cond, !dbg !588
  %conv68 = trunc i16 %add67 to i8, !dbg !588
  store i8 %conv68, i8* %x65, align 1, !dbg !588, !tbaa !275
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !589, !tbaa !136
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !589
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !589
  %36 = load i16, i16* %i, align 2, !dbg !590, !tbaa !103
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %36, !dbg !589
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !591
  %37 = load i8, i8* %y72, align 1, !dbg !591, !tbaa !285
  %conv73 = sext i8 %37 to i16, !dbg !589
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !592
  %38 = load i8, i8* %y74, align 1, !dbg !592, !tbaa !285
  %conv75 = sext i8 %38 to i16, !dbg !593
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !594
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !589

cond.true78:                                      ; preds = %cond.end
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !595, !tbaa !136
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !595
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !595
  %40 = load i16, i16* %i, align 2, !dbg !596, !tbaa !103
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %40, !dbg !595
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !597
  %41 = load i8, i8* %y82, align 1, !dbg !597, !tbaa !285
  %conv83 = sext i8 %41 to i16, !dbg !595
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !598
  %42 = load i8, i8* %y84, align 1, !dbg !598, !tbaa !285
  %conv85 = sext i8 %42 to i16, !dbg !599
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !600
  br label %cond.end96, !dbg !589

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !601
  %43 = load i8, i8* %y88, align 1, !dbg !601, !tbaa !285
  %conv89 = sext i8 %43 to i16, !dbg !602
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !603, !tbaa !136
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !603
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !603
  %45 = load i16, i16* %i, align 2, !dbg !604, !tbaa !103
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %45, !dbg !603
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !605
  %46 = load i8, i8* %y93, align 1, !dbg !605, !tbaa !285
  %conv94 = sext i8 %46 to i16, !dbg !603
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !606
  br label %cond.end96, !dbg !589

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !589
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !607
  %47 = load i8, i8* %y98, align 1, !dbg !608, !tbaa !285
  %conv99 = sext i8 %47 to i16, !dbg !608
  %add100 = add nsw i16 %conv99, %cond97, !dbg !608
  %conv101 = trunc i16 %add100 to i8, !dbg !608
  store i8 %conv101, i8* %y98, align 1, !dbg !608, !tbaa !285
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !609, !tbaa !136
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !609
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !609
  %49 = load i16, i16* %i, align 2, !dbg !610, !tbaa !103
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %49, !dbg !609
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !611
  %50 = load i8, i8* %z105, align 1, !dbg !611, !tbaa !295
  %conv106 = sext i8 %50 to i16, !dbg !609
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !612
  %51 = load i8, i8* %z107, align 1, !dbg !612, !tbaa !295
  %conv108 = sext i8 %51 to i16, !dbg !613
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !614
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !609

cond.true111:                                     ; preds = %cond.end96
  %52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !615, !tbaa !136
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %52, i32 0, i32 1, !dbg !615
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !615
  %53 = load i16, i16* %i, align 2, !dbg !616, !tbaa !103
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %53, !dbg !615
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !617
  %54 = load i8, i8* %z115, align 1, !dbg !617, !tbaa !295
  %conv116 = sext i8 %54 to i16, !dbg !615
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !618
  %55 = load i8, i8* %z117, align 1, !dbg !618, !tbaa !295
  %conv118 = sext i8 %55 to i16, !dbg !619
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !620
  br label %cond.end129, !dbg !609

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !621
  %56 = load i8, i8* %z121, align 1, !dbg !621, !tbaa !295
  %conv122 = sext i8 %56 to i16, !dbg !622
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !623, !tbaa !136
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 1, !dbg !623
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !623
  %58 = load i16, i16* %i, align 2, !dbg !624, !tbaa !103
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %58, !dbg !623
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !625
  %59 = load i8, i8* %z126, align 1, !dbg !625, !tbaa !295
  %conv127 = sext i8 %59 to i16, !dbg !623
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !626
  br label %cond.end129, !dbg !609

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !609
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !627
  %60 = load i8, i8* %z131, align 1, !dbg !628, !tbaa !295
  %conv132 = sext i8 %60 to i16, !dbg !628
  %add133 = add nsw i16 %conv132, %cond130, !dbg !628
  %conv134 = trunc i16 %add133 to i8, !dbg !628
  store i8 %conv134, i8* %z131, align 1, !dbg !628, !tbaa !295
  br label %for.inc135, !dbg !629

for.inc135:                                       ; preds = %cond.end129
  %61 = load i16, i16* %i, align 2, !dbg !630, !tbaa !103
  %inc136 = add nsw i16 %61, 1, !dbg !630
  store i16 %inc136, i16* %i, align 2, !dbg !630, !tbaa !103
  br label %for.cond37, !dbg !631, !llvm.loop !632

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !634
  %62 = load i8, i8* %x138, align 1, !dbg !635, !tbaa !275
  %conv139 = sext i8 %62 to i16, !dbg !635
  %shr140 = ashr i16 %conv139, 2, !dbg !635
  %conv141 = trunc i16 %shr140 to i8, !dbg !635
  store i8 %conv141, i8* %x138, align 1, !dbg !635, !tbaa !275
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !636
  %63 = load i8, i8* %y142, align 1, !dbg !637, !tbaa !285
  %conv143 = sext i8 %63 to i16, !dbg !637
  %shr144 = ashr i16 %conv143, 2, !dbg !637
  %conv145 = trunc i16 %shr144 to i8, !dbg !637
  store i8 %conv145, i8* %y142, align 1, !dbg !637, !tbaa !285
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !638
  %64 = load i8, i8* %z146, align 1, !dbg !639, !tbaa !295
  %conv147 = sext i8 %64 to i16, !dbg !639
  %shr148 = ashr i16 %conv147, 2, !dbg !639
  %conv149 = trunc i16 %shr148 to i8, !dbg !639
  store i8 %conv149, i8* %z146, align 1, !dbg !639, !tbaa !295
  %65 = bitcast i16* %meanmag to i8*, !dbg !640
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %65) #6, !dbg !640
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !506, metadata !DIExpression()), !dbg !641
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !642
  %66 = load i8, i8* %x150, align 1, !dbg !642, !tbaa !275
  %conv151 = sext i8 %66 to i16, !dbg !643
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !644
  %67 = load i8, i8* %x152, align 1, !dbg !644, !tbaa !275
  %conv153 = sext i8 %67 to i16, !dbg !645
  %mul = mul nsw i16 %conv151, %conv153, !dbg !646
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !647
  %68 = load i8, i8* %y154, align 1, !dbg !647, !tbaa !285
  %conv155 = sext i8 %68 to i16, !dbg !648
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !649
  %69 = load i8, i8* %y156, align 1, !dbg !649, !tbaa !285
  %conv157 = sext i8 %69 to i16, !dbg !650
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !651
  %add159 = add nsw i16 %mul, %mul158, !dbg !652
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !653
  %70 = load i8, i8* %z160, align 1, !dbg !653, !tbaa !295
  %conv161 = sext i8 %70 to i16, !dbg !654
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !655
  %71 = load i8, i8* %z162, align 1, !dbg !655, !tbaa !295
  %conv163 = sext i8 %71 to i16, !dbg !656
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !657
  %add165 = add nsw i16 %add159, %mul164, !dbg !658
  store i16 %add165, i16* %meanmag, align 2, !dbg !641, !tbaa !103
  %72 = bitcast i16* %stddevmag to i8*, !dbg !659
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %72) #6, !dbg !659
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !507, metadata !DIExpression()), !dbg !660
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !661
  %73 = load i8, i8* %x166, align 1, !dbg !661, !tbaa !275
  %conv167 = sext i8 %73 to i16, !dbg !662
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !663
  %74 = load i8, i8* %x168, align 1, !dbg !663, !tbaa !275
  %conv169 = sext i8 %74 to i16, !dbg !664
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !665
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !666
  %75 = load i8, i8* %y171, align 1, !dbg !666, !tbaa !285
  %conv172 = sext i8 %75 to i16, !dbg !667
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !668
  %76 = load i8, i8* %y173, align 1, !dbg !668, !tbaa !285
  %conv174 = sext i8 %76 to i16, !dbg !669
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !670
  %add176 = add nsw i16 %mul170, %mul175, !dbg !671
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !672
  %77 = load i8, i8* %z177, align 1, !dbg !672, !tbaa !295
  %conv178 = sext i8 %77 to i16, !dbg !673
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !674
  %78 = load i8, i8* %z179, align 1, !dbg !674, !tbaa !295
  %conv180 = sext i8 %78 to i16, !dbg !675
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !676
  %add182 = add nsw i16 %add176, %mul181, !dbg !677
  store i16 %add182, i16* %stddevmag, align 2, !dbg !660, !tbaa !103
  %79 = load i16, i16* %meanmag, align 2, !dbg !678, !tbaa !103
  %conv183 = uitofp i16 %79 to double, !dbg !678
  %call = call double @sqrt(double %conv183) #6, !dbg !679
  %conv184 = fptoui double %call to i16, !dbg !679
  %meanmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !680
  store i16 %conv184, i16* %meanmag185, align 2, !dbg !681, !tbaa !682
  %80 = load i16, i16* %stddevmag, align 2, !dbg !683, !tbaa !103
  %conv186 = uitofp i16 %80 to double, !dbg !683
  %call187 = call double @sqrt(double %conv186) #6, !dbg !684
  %conv188 = fptoui double %call187 to i16, !dbg !684
  %stddevmag189 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !685
  store i16 %conv188, i16* %stddevmag189, align 2, !dbg !686, !tbaa !687
  %81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !688, !tbaa !136
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %81, i32 0, i32 1, !dbg !688
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals190, i32 0, i32 12, !dbg !688
  %82 = load i16, i16* %mode, align 2, !dbg !688, !tbaa !368
  switch i16 %82, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb193
  ], !dbg !689

sw.bb:                                            ; preds = %for.end137, %for.end137
  %83 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !690, !tbaa !136
  %globals191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %83, i32 0, i32 1, !dbg !690
  %features192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals191, i32 0, i32 7, !dbg !690
  %84 = bitcast %struct.features_t* %features192 to i8*, !dbg !692
  %85 = bitcast %struct.features_t* %features to i8*, !dbg !692
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %84, i8* align 2 %85, i16 4, i1 false), !dbg !692, !tbaa.struct !693
  br label %sw.epilog, !dbg !694

sw.bb193:                                         ; preds = %for.end137
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !695, !tbaa !136
  %globals194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 1, !dbg !695
  %features195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals194, i32 0, i32 7, !dbg !695
  %87 = bitcast %struct.features_t* %features195 to i8*, !dbg !696
  %88 = bitcast %struct.features_t* %features to i8*, !dbg !696
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %87, i8* align 2 %88, i16 4, i1 false), !dbg !696, !tbaa.struct !693
  br label %sw.epilog, !dbg !697

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !698

sw.epilog:                                        ; preds = %sw.default, %sw.bb193, %sw.bb
  %89 = bitcast i16* %stddevmag to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %89) #6, !dbg !699
  %90 = bitcast i16* %meanmag to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %90) #6, !dbg !699
  %91 = bitcast i16* %i to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %91) #6, !dbg !699
  %92 = bitcast %struct.features_t* %features to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %92) #6, !dbg !699
  %93 = bitcast %struct.threeAxis_t_8* %stddev to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %93) #6, !dbg !699
  %94 = bitcast %struct.threeAxis_t_8* %mean to i8*, !dbg !699
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %94) #6, !dbg !699
  ret void, !dbg !699
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

; Function Attrs: nounwind
define dso_local void @task_classify() #0 !dbg !700 {
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
  %0 = bitcast i16* %move_less_error to i8*, !dbg !716
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !716
  call void @llvm.dbg.declare(metadata i16* %move_less_error, metadata !702, metadata !DIExpression()), !dbg !717
  store i16 0, i16* %move_less_error, align 2, !dbg !717, !tbaa !103
  %1 = bitcast i16* %stat_less_error to i8*, !dbg !718
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #6, !dbg !718
  call void @llvm.dbg.declare(metadata i16* %stat_less_error, metadata !703, metadata !DIExpression()), !dbg !719
  store i16 0, i16* %stat_less_error, align 2, !dbg !719, !tbaa !103
  %2 = bitcast i16* %i to i8*, !dbg !720
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #6, !dbg !720
  call void @llvm.dbg.declare(metadata i16* %i, metadata !704, metadata !DIExpression()), !dbg !721
  %3 = bitcast i16* %class to i8*, !dbg !722
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #6, !dbg !722
  call void @llvm.dbg.declare(metadata i16* %class, metadata !705, metadata !DIExpression()), !dbg !723
  %4 = bitcast i32* %meanmag to i8*, !dbg !724
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #6, !dbg !724
  call void @llvm.dbg.declare(metadata i32* %meanmag, metadata !706, metadata !DIExpression()), !dbg !725
  %5 = bitcast i32* %stddevmag to i8*, !dbg !726
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #6, !dbg !726
  call void @llvm.dbg.declare(metadata i32* %stddevmag, metadata !708, metadata !DIExpression()), !dbg !727
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !728
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !728
  %meanmag1 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !729
  %7 = load i16, i16* %meanmag1, align 2, !dbg !729, !tbaa !730
  %conv = zext i16 %7 to i32, !dbg !728
  store i32 %conv, i32* %meanmag, align 2, !dbg !731, !tbaa !732
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !734, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !734
  %features3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !734
  %stddevmag4 = getelementptr inbounds %struct.features_t, %struct.features_t* %features3, i32 0, i32 1, !dbg !735
  %9 = load i16, i16* %stddevmag4, align 2, !dbg !735, !tbaa !736
  %conv5 = zext i16 %9 to i32, !dbg !734
  store i32 %conv5, i32* %stddevmag, align 2, !dbg !737, !tbaa !732
  store i16 0, i16* %i, align 2, !dbg !738, !tbaa !103
  br label %for.cond, !dbg !739

for.cond:                                         ; preds = %for.inc, %entry
  %10 = load i16, i16* %i, align 2, !dbg !740, !tbaa !103
  %cmp = icmp slt i16 %10, 16, !dbg !741
  br i1 %cmp, label %for.body, label %for.end, !dbg !742

for.body:                                         ; preds = %for.cond
  %11 = bitcast i32* %stat_mean_err to i8*, !dbg !743
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #6, !dbg !743
  call void @llvm.dbg.declare(metadata i32* %stat_mean_err, metadata !709, metadata !DIExpression()), !dbg !744
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !745, !tbaa !136
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !745
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !745
  %13 = load i16, i16* %i, align 2, !dbg !746, !tbaa !103
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %13, !dbg !745
  %meanmag8 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx, i32 0, i32 0, !dbg !747
  %14 = load i16, i16* %meanmag8, align 2, !dbg !747, !tbaa !682
  %conv9 = zext i16 %14 to i32, !dbg !745
  %15 = load i32, i32* %meanmag, align 2, !dbg !748, !tbaa !732
  %cmp10 = icmp sgt i32 %conv9, %15, !dbg !749
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !750

cond.true:                                        ; preds = %for.body
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !751, !tbaa !136
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !751
  %model_stationary13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 8, !dbg !751
  %17 = load i16, i16* %i, align 2, !dbg !752, !tbaa !103
  %arrayidx14 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary13, i16 0, i16 %17, !dbg !751
  %meanmag15 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx14, i32 0, i32 0, !dbg !753
  %18 = load i16, i16* %meanmag15, align 2, !dbg !753, !tbaa !682
  %conv16 = zext i16 %18 to i32, !dbg !751
  %19 = load i32, i32* %meanmag, align 2, !dbg !754, !tbaa !732
  %sub = sub nsw i32 %conv16, %19, !dbg !755
  br label %cond.end, !dbg !750

cond.false:                                       ; preds = %for.body
  %20 = load i32, i32* %meanmag, align 2, !dbg !756, !tbaa !732
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !757, !tbaa !136
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !757
  %model_stationary18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 8, !dbg !757
  %22 = load i16, i16* %i, align 2, !dbg !758, !tbaa !103
  %arrayidx19 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary18, i16 0, i16 %22, !dbg !757
  %meanmag20 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx19, i32 0, i32 0, !dbg !759
  %23 = load i16, i16* %meanmag20, align 2, !dbg !759, !tbaa !682
  %conv21 = zext i16 %23 to i32, !dbg !757
  %sub22 = sub nsw i32 %20, %conv21, !dbg !760
  br label %cond.end, !dbg !750

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub22, %cond.false ], !dbg !750
  store i32 %cond, i32* %stat_mean_err, align 2, !dbg !744, !tbaa !732
  %24 = bitcast i32* %stat_sd_err to i8*, !dbg !761
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #6, !dbg !761
  call void @llvm.dbg.declare(metadata i32* %stat_sd_err, metadata !713, metadata !DIExpression()), !dbg !762
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !763, !tbaa !136
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !763
  %model_stationary24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 8, !dbg !763
  %26 = load i16, i16* %i, align 2, !dbg !764, !tbaa !103
  %arrayidx25 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary24, i16 0, i16 %26, !dbg !763
  %stddevmag26 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx25, i32 0, i32 1, !dbg !765
  %27 = load i16, i16* %stddevmag26, align 2, !dbg !765, !tbaa !687
  %conv27 = zext i16 %27 to i32, !dbg !763
  %28 = load i32, i32* %stddevmag, align 2, !dbg !766, !tbaa !732
  %cmp28 = icmp sgt i32 %conv27, %28, !dbg !767
  br i1 %cmp28, label %cond.true30, label %cond.false37, !dbg !768

cond.true30:                                      ; preds = %cond.end
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !769, !tbaa !136
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !769
  %model_stationary32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8, !dbg !769
  %30 = load i16, i16* %i, align 2, !dbg !770, !tbaa !103
  %arrayidx33 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary32, i16 0, i16 %30, !dbg !769
  %stddevmag34 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx33, i32 0, i32 1, !dbg !771
  %31 = load i16, i16* %stddevmag34, align 2, !dbg !771, !tbaa !687
  %conv35 = zext i16 %31 to i32, !dbg !769
  %32 = load i32, i32* %stddevmag, align 2, !dbg !772, !tbaa !732
  %sub36 = sub nsw i32 %conv35, %32, !dbg !773
  br label %cond.end44, !dbg !768

cond.false37:                                     ; preds = %cond.end
  %33 = load i32, i32* %stddevmag, align 2, !dbg !774, !tbaa !732
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !775, !tbaa !136
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !775
  %model_stationary39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8, !dbg !775
  %35 = load i16, i16* %i, align 2, !dbg !776, !tbaa !103
  %arrayidx40 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary39, i16 0, i16 %35, !dbg !775
  %stddevmag41 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx40, i32 0, i32 1, !dbg !777
  %36 = load i16, i16* %stddevmag41, align 2, !dbg !777, !tbaa !687
  %conv42 = zext i16 %36 to i32, !dbg !775
  %sub43 = sub nsw i32 %33, %conv42, !dbg !778
  br label %cond.end44, !dbg !768

cond.end44:                                       ; preds = %cond.false37, %cond.true30
  %cond45 = phi i32 [ %sub36, %cond.true30 ], [ %sub43, %cond.false37 ], !dbg !768
  store i32 %cond45, i32* %stat_sd_err, align 2, !dbg !762, !tbaa !732
  %37 = bitcast i32* %move_mean_err to i8*, !dbg !779
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %37) #6, !dbg !779
  call void @llvm.dbg.declare(metadata i32* %move_mean_err, metadata !714, metadata !DIExpression()), !dbg !780
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !781, !tbaa !136
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !781
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 9, !dbg !781
  %39 = load i16, i16* %i, align 2, !dbg !782, !tbaa !103
  %arrayidx47 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %39, !dbg !781
  %meanmag48 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx47, i32 0, i32 0, !dbg !783
  %40 = load i16, i16* %meanmag48, align 2, !dbg !783, !tbaa !682
  %conv49 = zext i16 %40 to i32, !dbg !781
  %41 = load i32, i32* %meanmag, align 2, !dbg !784, !tbaa !732
  %cmp50 = icmp sgt i32 %conv49, %41, !dbg !785
  br i1 %cmp50, label %cond.true52, label %cond.false59, !dbg !786

cond.true52:                                      ; preds = %cond.end44
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !787, !tbaa !136
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !787
  %model_moving54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 9, !dbg !787
  %43 = load i16, i16* %i, align 2, !dbg !788, !tbaa !103
  %arrayidx55 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving54, i16 0, i16 %43, !dbg !787
  %meanmag56 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx55, i32 0, i32 0, !dbg !789
  %44 = load i16, i16* %meanmag56, align 2, !dbg !789, !tbaa !682
  %conv57 = zext i16 %44 to i32, !dbg !787
  %45 = load i32, i32* %meanmag, align 2, !dbg !790, !tbaa !732
  %sub58 = sub nsw i32 %conv57, %45, !dbg !791
  br label %cond.end66, !dbg !786

cond.false59:                                     ; preds = %cond.end44
  %46 = load i32, i32* %meanmag, align 2, !dbg !792, !tbaa !732
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !793, !tbaa !136
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 1, !dbg !793
  %model_moving61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 9, !dbg !793
  %48 = load i16, i16* %i, align 2, !dbg !794, !tbaa !103
  %arrayidx62 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving61, i16 0, i16 %48, !dbg !793
  %meanmag63 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx62, i32 0, i32 0, !dbg !795
  %49 = load i16, i16* %meanmag63, align 2, !dbg !795, !tbaa !682
  %conv64 = zext i16 %49 to i32, !dbg !793
  %sub65 = sub nsw i32 %46, %conv64, !dbg !796
  br label %cond.end66, !dbg !786

cond.end66:                                       ; preds = %cond.false59, %cond.true52
  %cond67 = phi i32 [ %sub58, %cond.true52 ], [ %sub65, %cond.false59 ], !dbg !786
  store i32 %cond67, i32* %move_mean_err, align 2, !dbg !780, !tbaa !732
  %50 = bitcast i32* %move_sd_err to i8*, !dbg !797
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %50) #6, !dbg !797
  call void @llvm.dbg.declare(metadata i32* %move_sd_err, metadata !715, metadata !DIExpression()), !dbg !798
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !799, !tbaa !136
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 1, !dbg !799
  %model_moving69 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 9, !dbg !799
  %52 = load i16, i16* %i, align 2, !dbg !800, !tbaa !103
  %arrayidx70 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving69, i16 0, i16 %52, !dbg !799
  %stddevmag71 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx70, i32 0, i32 1, !dbg !801
  %53 = load i16, i16* %stddevmag71, align 2, !dbg !801, !tbaa !687
  %conv72 = zext i16 %53 to i32, !dbg !799
  %54 = load i32, i32* %stddevmag, align 2, !dbg !802, !tbaa !732
  %cmp73 = icmp sgt i32 %conv72, %54, !dbg !803
  br i1 %cmp73, label %cond.true75, label %cond.false82, !dbg !804

cond.true75:                                      ; preds = %cond.end66
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !805, !tbaa !136
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 1, !dbg !805
  %model_moving77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 9, !dbg !805
  %56 = load i16, i16* %i, align 2, !dbg !806, !tbaa !103
  %arrayidx78 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving77, i16 0, i16 %56, !dbg !805
  %stddevmag79 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx78, i32 0, i32 1, !dbg !807
  %57 = load i16, i16* %stddevmag79, align 2, !dbg !807, !tbaa !687
  %conv80 = zext i16 %57 to i32, !dbg !805
  %58 = load i32, i32* %stddevmag, align 2, !dbg !808, !tbaa !732
  %sub81 = sub nsw i32 %conv80, %58, !dbg !809
  br label %cond.end89, !dbg !804

cond.false82:                                     ; preds = %cond.end66
  %59 = load i32, i32* %stddevmag, align 2, !dbg !810, !tbaa !732
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !811, !tbaa !136
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i32 0, i32 1, !dbg !811
  %model_moving84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals83, i32 0, i32 9, !dbg !811
  %61 = load i16, i16* %i, align 2, !dbg !812, !tbaa !103
  %arrayidx85 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving84, i16 0, i16 %61, !dbg !811
  %stddevmag86 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx85, i32 0, i32 1, !dbg !813
  %62 = load i16, i16* %stddevmag86, align 2, !dbg !813, !tbaa !687
  %conv87 = zext i16 %62 to i32, !dbg !811
  %sub88 = sub nsw i32 %59, %conv87, !dbg !814
  br label %cond.end89, !dbg !804

cond.end89:                                       ; preds = %cond.false82, %cond.true75
  %cond90 = phi i32 [ %sub81, %cond.true75 ], [ %sub88, %cond.false82 ], !dbg !804
  store i32 %cond90, i32* %move_sd_err, align 2, !dbg !798, !tbaa !732
  %63 = load i32, i32* %move_mean_err, align 2, !dbg !815, !tbaa !732
  %64 = load i32, i32* %stat_mean_err, align 2, !dbg !817, !tbaa !732
  %cmp91 = icmp slt i32 %63, %64, !dbg !818
  br i1 %cmp91, label %if.then, label %if.else, !dbg !819

if.then:                                          ; preds = %cond.end89
  %65 = load i16, i16* %move_less_error, align 2, !dbg !820, !tbaa !103
  %inc = add nsw i16 %65, 1, !dbg !820
  store i16 %inc, i16* %move_less_error, align 2, !dbg !820, !tbaa !103
  br label %if.end, !dbg !822

if.else:                                          ; preds = %cond.end89
  %66 = load i16, i16* %stat_less_error, align 2, !dbg !823, !tbaa !103
  %inc93 = add nsw i16 %66, 1, !dbg !823
  store i16 %inc93, i16* %stat_less_error, align 2, !dbg !823, !tbaa !103
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %67 = load i32, i32* %move_sd_err, align 2, !dbg !825, !tbaa !732
  %68 = load i32, i32* %stat_sd_err, align 2, !dbg !827, !tbaa !732
  %cmp94 = icmp slt i32 %67, %68, !dbg !828
  br i1 %cmp94, label %if.then96, label %if.else98, !dbg !829

if.then96:                                        ; preds = %if.end
  %69 = load i16, i16* %move_less_error, align 2, !dbg !830, !tbaa !103
  %inc97 = add nsw i16 %69, 1, !dbg !830
  store i16 %inc97, i16* %move_less_error, align 2, !dbg !830, !tbaa !103
  br label %if.end100, !dbg !832

if.else98:                                        ; preds = %if.end
  %70 = load i16, i16* %stat_less_error, align 2, !dbg !833, !tbaa !103
  %inc99 = add nsw i16 %70, 1, !dbg !833
  store i16 %inc99, i16* %stat_less_error, align 2, !dbg !833, !tbaa !103
  br label %if.end100

if.end100:                                        ; preds = %if.else98, %if.then96
  %71 = bitcast i32* %move_sd_err to i8*, !dbg !835
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %71) #6, !dbg !835
  %72 = bitcast i32* %move_mean_err to i8*, !dbg !835
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %72) #6, !dbg !835
  %73 = bitcast i32* %stat_sd_err to i8*, !dbg !835
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %73) #6, !dbg !835
  %74 = bitcast i32* %stat_mean_err to i8*, !dbg !835
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %74) #6, !dbg !835
  br label %for.inc, !dbg !836

for.inc:                                          ; preds = %if.end100
  %75 = load i16, i16* %i, align 2, !dbg !837, !tbaa !103
  %inc101 = add nsw i16 %75, 1, !dbg !837
  store i16 %inc101, i16* %i, align 2, !dbg !837, !tbaa !103
  br label %for.cond, !dbg !838, !llvm.loop !839

for.end:                                          ; preds = %for.cond
  %76 = load i16, i16* %move_less_error, align 2, !dbg !841, !tbaa !103
  %77 = load i16, i16* %stat_less_error, align 2, !dbg !842, !tbaa !103
  %cmp102 = icmp sgt i16 %76, %77, !dbg !843
  %78 = zext i1 %cmp102 to i64, !dbg !844
  %cond104 = select i1 %cmp102, i16 1, i16 0, !dbg !844
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !845, !tbaa !136
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 1, !dbg !845
  %class106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals105, i32 0, i32 2, !dbg !845
  store i16 %cond104, i16* %class106, align 2, !dbg !846, !tbaa !371
  %80 = bitcast i32* %stddevmag to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %80) #6, !dbg !847
  %81 = bitcast i32* %meanmag to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %81) #6, !dbg !847
  %82 = bitcast i16* %class to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %82) #6, !dbg !847
  %83 = bitcast i16* %i to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %83) #6, !dbg !847
  %84 = bitcast i16* %stat_less_error to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %84) #6, !dbg !847
  %85 = bitcast i16* %move_less_error to i8*, !dbg !847
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %85) #6, !dbg !847
  ret void, !dbg !847
}

; Function Attrs: nounwind
define dso_local void @task_stats() #0 !dbg !848 {
entry:
  %movingCount = alloca i16, align 2
  %stationaryCount = alloca i16, align 2
  %resultStationaryPct = alloca i16, align 2
  %resultMovingPct = alloca i16, align 2
  %sum = alloca i16, align 2
  %0 = bitcast i16* %movingCount to i8*, !dbg !857
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !857
  call void @llvm.dbg.declare(metadata i16* %movingCount, metadata !850, metadata !DIExpression()), !dbg !858
  store i16 0, i16* %movingCount, align 2, !dbg !858, !tbaa !103
  %1 = bitcast i16* %stationaryCount to i8*, !dbg !857
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #6, !dbg !857
  call void @llvm.dbg.declare(metadata i16* %stationaryCount, metadata !851, metadata !DIExpression()), !dbg !859
  store i16 0, i16* %stationaryCount, align 2, !dbg !859, !tbaa !103
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !860, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !860
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !860
  %3 = load i16, i16* %totalCount, align 2, !dbg !861, !tbaa !401
  %inc = add i16 %3, 1, !dbg !861
  store i16 %inc, i16* %totalCount, align 2, !dbg !861, !tbaa !401
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !862, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !862
  %class = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !862
  %5 = load i16, i16* %class, align 2, !dbg !862, !tbaa !371
  switch i16 %5, label %sw.epilog [
    i16 1, label %sw.bb
    i16 0, label %sw.bb5
  ], !dbg !863

sw.bb:                                            ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !864, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !864
  %movingCount3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !864
  %7 = load i16, i16* %movingCount3, align 2, !dbg !866, !tbaa !395
  %inc4 = add i16 %7, 1, !dbg !866
  store i16 %inc4, i16* %movingCount3, align 2, !dbg !866, !tbaa !395
  br label %sw.epilog, !dbg !867

sw.bb5:                                           ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !868, !tbaa !136
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !868
  %stationaryCount7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !868
  %9 = load i16, i16* %stationaryCount7, align 2, !dbg !869, !tbaa !398
  %inc8 = add i16 %9, 1, !dbg !869
  store i16 %inc8, i16* %stationaryCount7, align 2, !dbg !869, !tbaa !398
  br label %sw.epilog, !dbg !870

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !871, !tbaa !136
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !871
  %totalCount10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !871
  %11 = load i16, i16* %totalCount10, align 2, !dbg !871, !tbaa !401
  %cmp = icmp eq i16 %11, 128, !dbg !872
  br i1 %cmp, label %if.then, label %if.end, !dbg !873

if.then:                                          ; preds = %sw.epilog
  %12 = bitcast i16* %resultStationaryPct to i8*, !dbg !874
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %12) #6, !dbg !874
  call void @llvm.dbg.declare(metadata i16* %resultStationaryPct, metadata !852, metadata !DIExpression()), !dbg !875
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !876, !tbaa !136
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !876
  %stationaryCount12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 5, !dbg !876
  %14 = load i16, i16* %stationaryCount12, align 2, !dbg !876, !tbaa !398
  %mul = mul i16 %14, 100, !dbg !877
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !878, !tbaa !136
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !878
  %totalCount14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !878
  %16 = load i16, i16* %totalCount14, align 2, !dbg !878, !tbaa !401
  %div = udiv i16 %mul, %16, !dbg !879
  store i16 %div, i16* %resultStationaryPct, align 2, !dbg !875, !tbaa !103
  %17 = bitcast i16* %resultMovingPct to i8*, !dbg !880
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %17) #6, !dbg !880
  call void @llvm.dbg.declare(metadata i16* %resultMovingPct, metadata !855, metadata !DIExpression()), !dbg !881
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !882, !tbaa !136
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !882
  %movingCount16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 4, !dbg !882
  %19 = load i16, i16* %movingCount16, align 2, !dbg !882, !tbaa !395
  %mul17 = mul i16 %19, 100, !dbg !883
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !884, !tbaa !136
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !884
  %totalCount19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !884
  %21 = load i16, i16* %totalCount19, align 2, !dbg !884, !tbaa !401
  %div20 = udiv i16 %mul17, %21, !dbg !885
  store i16 %div20, i16* %resultMovingPct, align 2, !dbg !881, !tbaa !103
  %22 = bitcast i16* %sum to i8*, !dbg !886
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %22) #6, !dbg !886
  call void @llvm.dbg.declare(metadata i16* %sum, metadata !856, metadata !DIExpression()), !dbg !887
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !888, !tbaa !136
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !888
  %stationaryCount22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 5, !dbg !888
  %24 = load i16, i16* %stationaryCount22, align 2, !dbg !888, !tbaa !398
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !889, !tbaa !136
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !889
  %movingCount24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 4, !dbg !889
  %26 = load i16, i16* %movingCount24, align 2, !dbg !889, !tbaa !395
  %add = add i16 %24, %26, !dbg !890
  store i16 %add, i16* %sum, align 2, !dbg !887, !tbaa !103
  %27 = bitcast i16* %sum to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #6, !dbg !891
  %28 = bitcast i16* %resultMovingPct to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #6, !dbg !891
  %29 = bitcast i16* %resultStationaryPct to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #6, !dbg !891
  br label %if.end, !dbg !892

if.end:                                           ; preds = %if.then, %sw.epilog
  %30 = bitcast i16* %stationaryCount to i8*, !dbg !893
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #6, !dbg !893
  %31 = bitcast i16* %movingCount to i8*, !dbg !893
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #6, !dbg !893
  ret void, !dbg !893
}

; Function Attrs: nounwind
define dso_local void @task_warmup() #0 !dbg !894 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  %0 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !897
  call void @llvm.lifetime.start.p0i8(i64 3, i8* %0) #6, !dbg !897
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !896, metadata !DIExpression()), !dbg !898
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !899, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !899
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !899
  %2 = load i16, i16* %seed, align 2, !dbg !899, !tbaa !308
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %2), !dbg !900
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !901, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !901
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !901
  store i16 %call, i16* %seed2, align 2, !dbg !902, !tbaa !308
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !903, !tbaa !136
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !903
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !903
  %5 = load i16, i16* %discardedSamplesCount, align 2, !dbg !904, !tbaa !365
  %inc = add i16 %5, 1, !dbg !904
  store i16 %inc, i16* %discardedSamplesCount, align 2, !dbg !904, !tbaa !365
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !905, !tbaa !136
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !905
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !905
  %7 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !905, !tbaa !365
  %cmp = icmp eq i16 %7, 3, !dbg !907
  br i1 %cmp, label %if.then, label %if.end, !dbg !908

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !909, !tbaa !136
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !909
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !909
  store i16 0, i16* %trainingSetSize, align 2, !dbg !911, !tbaa !912
  br label %if.end, !dbg !913

if.end:                                           ; preds = %if.then, %entry
  %9 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !914
  call void @llvm.lifetime.end.p0i8(i64 3, i8* %9) #6, !dbg !914
  ret void, !dbg !914
}

; Function Attrs: nounwind
define dso_local void @task_train() #0 !dbg !915 {
entry:
  %trainingSetSize = alloca i16, align 2
  %class = alloca i16, align 2
  %0 = bitcast i16* %trainingSetSize to i8*, !dbg !919
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !919
  call void @llvm.dbg.declare(metadata i16* %trainingSetSize, metadata !917, metadata !DIExpression()), !dbg !920
  %1 = bitcast i16* %class to i8*, !dbg !921
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #6, !dbg !921
  call void @llvm.dbg.declare(metadata i16* %class, metadata !918, metadata !DIExpression()), !dbg !922
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !923, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !923
  %class1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !923
  %3 = load i16, i16* %class1, align 2, !dbg !923, !tbaa !371
  switch i16 %3, label %sw.epilog [
    i16 0, label %sw.bb
    i16 1, label %sw.bb6
  ], !dbg !924

sw.bb:                                            ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !925, !tbaa !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !925
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !925
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !927, !tbaa !136
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !927
  %trainingSetSize4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !927
  %6 = load i16, i16* %trainingSetSize4, align 2, !dbg !927, !tbaa !912
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %6, !dbg !925
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !928, !tbaa !136
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !928
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !928
  %8 = bitcast %struct.features_t* %arrayidx to i8*, !dbg !928
  %9 = bitcast %struct.features_t* %features to i8*, !dbg !928
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %8, i8* align 2 %9, i16 4, i1 false), !dbg !928, !tbaa.struct !693
  br label %sw.epilog, !dbg !929

sw.bb6:                                           ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !930, !tbaa !136
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !930
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !930
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !931, !tbaa !136
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !931
  %trainingSetSize9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 10, !dbg !931
  %12 = load i16, i16* %trainingSetSize9, align 2, !dbg !931, !tbaa !912
  %arrayidx10 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %12, !dbg !930
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !932, !tbaa !136
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !932
  %features12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7, !dbg !932
  %14 = bitcast %struct.features_t* %arrayidx10 to i8*, !dbg !932
  %15 = bitcast %struct.features_t* %features12 to i8*, !dbg !932
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 4, i1 false), !dbg !932, !tbaa.struct !693
  br label %sw.epilog, !dbg !933

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !934, !tbaa !136
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !934
  %trainingSetSize14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !934
  %17 = load i16, i16* %trainingSetSize14, align 2, !dbg !935, !tbaa !912
  %inc = add i16 %17, 1, !dbg !935
  store i16 %inc, i16* %trainingSetSize14, align 2, !dbg !935, !tbaa !912
  %18 = bitcast i16* %class to i8*, !dbg !936
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %18) #6, !dbg !936
  %19 = bitcast i16* %trainingSetSize to i8*, !dbg !936
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %19) #6, !dbg !936
  ret void, !dbg !936
}

; Function Attrs: nounwind
define dso_local void @task_done() #0 !dbg !937 {
entry:
  call void @exit(i16 0) #7, !dbg !938
  unreachable, !dbg !938
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #5

; Function Attrs: nounwind
define dso_local void @task_commit() #0 !dbg !939 {
entry:
  ret void, !dbg !940
}

; Function Attrs: nounwind
define dso_local i16 @main() #0 !dbg !941 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !944, !tbaa !126
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !945, !tbaa !136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !946, !tbaa !136
  call void @camel_init(), !dbg !947
  call void @task_init(), !dbg !948
  call void @commit(), !dbg !948
  call void @task_commit(), !dbg !948
  br label %while.body, !dbg !949

while.body:                                       ; preds = %entry, %if.then16, %while.end49
  call void @task_selectMode(), !dbg !950
  call void @commit(), !dbg !950
  call void @task_commit(), !dbg !950
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !952, !tbaa !136
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !952
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !952
  %1 = load i16, i16* %mode, align 2, !dbg !952, !tbaa !368
  %cmp = icmp eq i16 %1, 2, !dbg !954
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !955

lor.lhs.false:                                    ; preds = %while.body
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !956, !tbaa !136
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !956
  %mode2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !956
  %3 = load i16, i16* %mode2, align 2, !dbg !956, !tbaa !368
  %cmp3 = icmp eq i16 %3, 1, !dbg !957
  br i1 %cmp3, label %if.then, label %if.else, !dbg !958

if.then:                                          ; preds = %lor.lhs.false, %while.body
  br label %while.cond4, !dbg !959

while.cond4:                                      ; preds = %while.body7, %if.then
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !961, !tbaa !136
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !961
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !961
  %5 = load i16, i16* %discardedSamplesCount, align 2, !dbg !961, !tbaa !365
  %cmp6 = icmp ult i16 %5, 3, !dbg !962
  br i1 %cmp6, label %while.body7, label %while.end, !dbg !959

while.body7:                                      ; preds = %while.cond4
  call void @task_warmup(), !dbg !963
  call void @commit(), !dbg !963
  call void @task_commit(), !dbg !963
  br label %while.cond4, !dbg !959, !llvm.loop !965

while.end:                                        ; preds = %while.cond4
  br label %if.end18, !dbg !967

if.else:                                          ; preds = %lor.lhs.false
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !968, !tbaa !136
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !968
  %mode9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 12, !dbg !968
  %7 = load i16, i16* %mode9, align 2, !dbg !968, !tbaa !368
  %cmp10 = icmp eq i16 %7, 0, !dbg !970
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !971

if.then11:                                        ; preds = %if.else
  call void @task_resetStats(), !dbg !972
  call void @commit(), !dbg !972
  call void @task_commit(), !dbg !972
  br label %if.end17, !dbg !974

if.else12:                                        ; preds = %if.else
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !975, !tbaa !136
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !975
  %mode14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 12, !dbg !975
  %9 = load i16, i16* %mode14, align 2, !dbg !975, !tbaa !368
  %cmp15 = icmp eq i16 %9, 3, !dbg !977
  br i1 %cmp15, label %if.then16, label %if.end, !dbg !978

if.then16:                                        ; preds = %if.else12
  br label %while.body, !dbg !979, !llvm.loop !981

if.end:                                           ; preds = %if.else12
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then11
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %while.end
  br label %while.body20, !dbg !983

while.body20:                                     ; preds = %if.end18, %if.end48
  br label %while.cond21, !dbg !984

while.cond21:                                     ; preds = %while.body24, %while.body20
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !986, !tbaa !136
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !986
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 11, !dbg !986
  %11 = load i16, i16* %samplesInWindow, align 2, !dbg !986, !tbaa !374
  %cmp23 = icmp ult i16 %11, 3, !dbg !987
  br i1 %cmp23, label %while.body24, label %while.end25, !dbg !984

while.body24:                                     ; preds = %while.cond21
  call void @task_sample(), !dbg !988
  call void @commit(), !dbg !988
  call void @task_commit(), !dbg !988
  br label %while.cond21, !dbg !984, !llvm.loop !990

while.end25:                                      ; preds = %while.cond21
  call void @task_transform(), !dbg !992
  call void @commit(), !dbg !992
  call void @task_commit(), !dbg !992
  call void @task_featurize(), !dbg !993
  call void @commit(), !dbg !993
  call void @task_commit(), !dbg !993
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !994, !tbaa !136
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !994
  %mode27 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 12, !dbg !994
  %13 = load i16, i16* %mode27, align 2, !dbg !994, !tbaa !368
  %cmp28 = icmp eq i16 %13, 2, !dbg !996
  br i1 %cmp28, label %if.then33, label %lor.lhs.false29, !dbg !997

lor.lhs.false29:                                  ; preds = %while.end25
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !998, !tbaa !136
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !998
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !998
  %15 = load i16, i16* %mode31, align 2, !dbg !998, !tbaa !368
  %cmp32 = icmp eq i16 %15, 1, !dbg !999
  br i1 %cmp32, label %if.then33, label %if.else38, !dbg !1000

if.then33:                                        ; preds = %lor.lhs.false29, %while.end25
  call void @task_train(), !dbg !1001
  call void @commit(), !dbg !1001
  call void @task_commit(), !dbg !1001
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1003, !tbaa !136
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !1003
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 10, !dbg !1003
  %17 = load i16, i16* %trainingSetSize, align 2, !dbg !1003, !tbaa !912
  %cmp35 = icmp uge i16 %17, 16, !dbg !1005
  br i1 %cmp35, label %if.then36, label %if.end37, !dbg !1006

if.then36:                                        ; preds = %if.then33
  br label %while.end49, !dbg !1007

if.end37:                                         ; preds = %if.then33
  br label %if.end48, !dbg !1008

if.else38:                                        ; preds = %lor.lhs.false29
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1009, !tbaa !136
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !1009
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !1009
  %19 = load i16, i16* %mode40, align 2, !dbg !1009, !tbaa !368
  %cmp41 = icmp eq i16 %19, 0, !dbg !1011
  br i1 %cmp41, label %if.then42, label %if.end47, !dbg !1012

if.then42:                                        ; preds = %if.else38
  call void @task_classify(), !dbg !1013
  call void @commit(), !dbg !1013
  call void @task_commit(), !dbg !1013
  call void @task_stats(), !dbg !1015
  call void @commit(), !dbg !1015
  call void @task_commit(), !dbg !1015
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1016, !tbaa !136
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !1016
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 3, !dbg !1016
  %21 = load i16, i16* %totalCount, align 2, !dbg !1016, !tbaa !401
  %cmp44 = icmp eq i16 %21, 128, !dbg !1018
  br i1 %cmp44, label %if.then45, label %if.end46, !dbg !1019

if.then45:                                        ; preds = %if.then42
  br label %while.end49, !dbg !1020

if.end46:                                         ; preds = %if.then42
  br label %if.end47, !dbg !1021

if.end47:                                         ; preds = %if.end46, %if.else38
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end37
  br label %while.body20, !dbg !983, !llvm.loop !1022

while.end49:                                      ; preds = %if.then45, %if.then36
  br label %while.body, !dbg !949, !llvm.loop !981
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }

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
!132 = !DILocation(line: 143, column: 19, scope: !125)
!133 = !DILocation(line: 143, column: 8, scope: !118)
!134 = !DILocation(line: 144, column: 14, scope: !135)
!135 = distinct !DILexicalBlock(scope: !125, file: !3, line: 143, column: 34)
!136 = !{!137, !137, i64 0}
!137 = !{!"any pointer", !105, i64 0}
!138 = !DILocation(line: 145, column: 16, scope: !135)
!139 = !DILocation(line: 146, column: 5, scope: !135)
!140 = !DILocation(line: 146, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !125, file: !3, line: 146, column: 15)
!142 = !DILocation(line: 146, column: 26, scope: !141)
!143 = !DILocation(line: 146, column: 15, scope: !125)
!144 = !DILocation(line: 147, column: 14, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !3, line: 146, column: 41)
!146 = !DILocation(line: 148, column: 16, scope: !145)
!147 = !DILocation(line: 149, column: 5, scope: !145)
!148 = !DILocation(line: 150, column: 9, scope: !149)
!149 = distinct !DILexicalBlock(scope: !141, file: !3, line: 149, column: 12)
!150 = !DILocation(line: 167, column: 3, scope: !151)
!151 = distinct !DILexicalBlock(scope: !118, file: !3, line: 167, column: 3)
!152 = !{!128, !128, i64 0}
!153 = !{i32 -2146649282}
!154 = !DILocation(line: 169, column: 33, scope: !121)
!155 = !{i32 -2146649046}
!156 = !DILocation(line: 169, column: 33, scope: !118)
!157 = !DILocation(line: 169, column: 51, scope: !118)
!158 = !DILocation(line: 169, column: 65, scope: !123)
!159 = !{i32 -2146648921}
!160 = !DILocation(line: 169, column: 65, scope: !118)
!161 = !DILocation(line: 169, column: 83, scope: !118)
!162 = !DILocation(line: 169, column: 63, scope: !118)
!163 = !DILocation(line: 169, column: 19, scope: !118)
!164 = !DILocation(line: 169, column: 17, scope: !118)
!165 = !DILocation(line: 170, column: 37, scope: !118)
!166 = !DILocation(line: 170, column: 71, scope: !118)
!167 = !DILocation(line: 170, column: 23, scope: !118)
!168 = !DILocation(line: 170, column: 21, scope: !118)
!169 = !DILocation(line: 173, column: 6, scope: !170)
!170 = distinct !DILexicalBlock(scope: !118, file: !3, line: 173, column: 6)
!171 = !DILocation(line: 173, column: 27, scope: !170)
!172 = !DILocation(line: 173, column: 33, scope: !170)
!173 = !{!129, !128, i64 186}
!174 = !DILocation(line: 173, column: 24, scope: !170)
!175 = !DILocation(line: 173, column: 6, scope: !118)
!176 = !DILocation(line: 174, column: 11, scope: !177)
!177 = distinct !DILexicalBlock(scope: !170, file: !3, line: 173, column: 51)
!178 = !DILocation(line: 174, column: 4, scope: !177)
!179 = !DILocation(line: 174, column: 19, scope: !177)
!180 = !DILocation(line: 175, column: 4, scope: !177)
!181 = !DILocation(line: 176, column: 24, scope: !177)
!182 = !DILocation(line: 176, column: 30, scope: !177)
!183 = !DILocation(line: 176, column: 4, scope: !177)
!184 = !DILocation(line: 177, column: 3, scope: !177)
!185 = !DILocation(line: 178, column: 4, scope: !186)
!186 = distinct !DILexicalBlock(scope: !170, file: !3, line: 177, column: 9)
!187 = !DILocation(line: 181, column: 1, scope: !118)
!188 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 232, type: !21, scopeLine: 232, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !189)
!189 = !{!190, !195, !197, !200}
!190 = !DILocalVariable(name: "__x", scope: !191, file: !3, line: 239, type: !6)
!191 = distinct !DILexicalBlock(scope: !192, file: !3, line: 239, column: 45)
!192 = distinct !DILexicalBlock(scope: !193, file: !3, line: 235, column: 39)
!193 = distinct !DILexicalBlock(scope: !194, file: !3, line: 235, column: 14)
!194 = distinct !DILexicalBlock(scope: !188, file: !3, line: 233, column: 8)
!195 = !DILocalVariable(name: "__x", scope: !196, file: !3, line: 239, type: !6)
!196 = distinct !DILexicalBlock(scope: !192, file: !3, line: 239, column: 77)
!197 = !DILocalVariable(name: "__x", scope: !198, file: !3, line: 247, type: !6)
!198 = distinct !DILexicalBlock(scope: !199, file: !3, line: 247, column: 45)
!199 = distinct !DILexicalBlock(scope: !193, file: !3, line: 243, column: 17)
!200 = !DILocalVariable(name: "__x", scope: !201, file: !3, line: 247, type: !6)
!201 = distinct !DILexicalBlock(scope: !199, file: !3, line: 247, column: 77)
!202 = !DILocation(line: 233, column: 5, scope: !188)
!203 = !DILocation(line: 235, column: 20, scope: !193)
!204 = !DILocation(line: 235, column: 25, scope: !193)
!205 = !DILocation(line: 235, column: 14, scope: !194)
!206 = !DILocation(line: 236, column: 17, scope: !192)
!207 = !DILocation(line: 237, column: 19, scope: !192)
!208 = !DILocation(line: 238, column: 29, scope: !192)
!209 = !DILocation(line: 238, column: 35, scope: !192)
!210 = !DILocation(line: 238, column: 12, scope: !192)
!211 = !DILocation(line: 239, column: 45, scope: !191)
!212 = !{i32 -2146648607}
!213 = !DILocation(line: 239, column: 45, scope: !192)
!214 = !DILocation(line: 239, column: 63, scope: !192)
!215 = !DILocation(line: 239, column: 77, scope: !196)
!216 = !{i32 -2146648482}
!217 = !DILocation(line: 239, column: 77, scope: !192)
!218 = !DILocation(line: 239, column: 95, scope: !192)
!219 = !DILocation(line: 239, column: 75, scope: !192)
!220 = !DILocation(line: 239, column: 31, scope: !192)
!221 = !DILocation(line: 239, column: 29, scope: !192)
!222 = !DILocation(line: 240, column: 47, scope: !192)
!223 = !DILocation(line: 240, column: 81, scope: !192)
!224 = !DILocation(line: 240, column: 33, scope: !192)
!225 = !DILocation(line: 240, column: 31, scope: !192)
!226 = !DILocation(line: 241, column: 39, scope: !192)
!227 = !DILocation(line: 241, column: 13, scope: !192)
!228 = !DILocation(line: 241, column: 19, scope: !192)
!229 = !DILocation(line: 241, column: 37, scope: !192)
!230 = !DILocation(line: 242, column: 23, scope: !192)
!231 = !DILocation(line: 243, column: 11, scope: !192)
!232 = !DILocation(line: 244, column: 17, scope: !199)
!233 = !DILocation(line: 245, column: 19, scope: !199)
!234 = !DILocation(line: 246, column: 29, scope: !199)
!235 = !DILocation(line: 246, column: 35, scope: !199)
!236 = !DILocation(line: 246, column: 12, scope: !199)
!237 = !DILocation(line: 247, column: 45, scope: !198)
!238 = !{i32 -2146648350}
!239 = !DILocation(line: 247, column: 45, scope: !199)
!240 = !DILocation(line: 247, column: 63, scope: !199)
!241 = !DILocation(line: 247, column: 77, scope: !201)
!242 = !{i32 -2146648225}
!243 = !DILocation(line: 247, column: 77, scope: !199)
!244 = !DILocation(line: 247, column: 95, scope: !199)
!245 = !DILocation(line: 247, column: 75, scope: !199)
!246 = !DILocation(line: 247, column: 31, scope: !199)
!247 = !DILocation(line: 247, column: 29, scope: !199)
!248 = !DILocation(line: 248, column: 47, scope: !199)
!249 = !DILocation(line: 248, column: 81, scope: !199)
!250 = !DILocation(line: 248, column: 33, scope: !199)
!251 = !DILocation(line: 248, column: 31, scope: !199)
!252 = !DILocation(line: 249, column: 39, scope: !199)
!253 = !DILocation(line: 249, column: 13, scope: !199)
!254 = !DILocation(line: 249, column: 19, scope: !199)
!255 = !DILocation(line: 249, column: 37, scope: !199)
!256 = !DILocation(line: 250, column: 23, scope: !199)
!257 = !DILocation(line: 253, column: 19, scope: !194)
!258 = !DILocation(line: 255, column: 1, scope: !188)
!259 = distinct !DISubprogram(name: "ACCEL_singleSample_", scope: !3, file: !3, line: 280, type: !260, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !263)
!260 = !DISubroutineType(types: !261)
!261 = !{!6, !262, !6}
!262 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 16)
!263 = !{!264, !265}
!264 = !DILocalVariable(name: "result", arg: 1, scope: !259, file: !3, line: 280, type: !262)
!265 = !DILocalVariable(name: "seed", arg: 2, scope: !259, file: !3, line: 280, type: !6)
!266 = !DILocation(line: 280, column: 45, scope: !259)
!267 = !DILocation(line: 280, column: 62, scope: !259)
!268 = !DILocation(line: 281, column: 15, scope: !259)
!269 = !DILocation(line: 281, column: 19, scope: !259)
!270 = !DILocation(line: 281, column: 23, scope: !259)
!271 = !DILocation(line: 281, column: 14, scope: !259)
!272 = !DILocation(line: 281, column: 2, scope: !259)
!273 = !DILocation(line: 281, column: 10, scope: !259)
!274 = !DILocation(line: 281, column: 12, scope: !259)
!275 = !{!276, !105, i64 0}
!276 = !{!"", !105, i64 0, !105, i64 1, !105, i64 2}
!277 = !DILocation(line: 282, column: 15, scope: !259)
!278 = !DILocation(line: 282, column: 19, scope: !259)
!279 = !DILocation(line: 282, column: 22, scope: !259)
!280 = !DILocation(line: 282, column: 26, scope: !259)
!281 = !DILocation(line: 282, column: 14, scope: !259)
!282 = !DILocation(line: 282, column: 2, scope: !259)
!283 = !DILocation(line: 282, column: 10, scope: !259)
!284 = !DILocation(line: 282, column: 12, scope: !259)
!285 = !{!276, !105, i64 1}
!286 = !DILocation(line: 283, column: 15, scope: !259)
!287 = !DILocation(line: 283, column: 19, scope: !259)
!288 = !DILocation(line: 283, column: 22, scope: !259)
!289 = !DILocation(line: 283, column: 25, scope: !259)
!290 = !DILocation(line: 283, column: 29, scope: !259)
!291 = !DILocation(line: 283, column: 14, scope: !259)
!292 = !DILocation(line: 283, column: 2, scope: !259)
!293 = !DILocation(line: 283, column: 10, scope: !259)
!294 = !DILocation(line: 283, column: 12, scope: !259)
!295 = !{!276, !105, i64 2}
!296 = !DILocation(line: 284, column: 2, scope: !259)
!297 = !DILocation(line: 286, column: 9, scope: !259)
!298 = !DILocation(line: 286, column: 2, scope: !259)
!299 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 289, type: !21, scopeLine: 290, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!300 = !DILocation(line: 291, column: 2, scope: !299)
!301 = !DILocation(line: 291, column: 15, scope: !299)
!302 = !{!129, !128, i64 22}
!303 = !DILocation(line: 292, column: 2, scope: !299)
!304 = !DILocation(line: 292, column: 12, scope: !299)
!305 = !{!129, !104, i64 184}
!306 = !DILocation(line: 293, column: 2, scope: !299)
!307 = !DILocation(line: 293, column: 11, scope: !299)
!308 = !{!129, !104, i64 182}
!309 = !DILocation(line: 294, column: 1, scope: !299)
!310 = distinct !DISubprogram(name: "task_selectMode", scope: !3, file: !3, line: 296, type: !21, scopeLine: 297, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !311)
!311 = !{!312, !313, !314}
!312 = !DILocalVariable(name: "pin_state", scope: !310, file: !3, line: 298, type: !25)
!313 = !DILocalVariable(name: "mode", scope: !310, file: !3, line: 307, type: !82)
!314 = !DILocalVariable(name: "class", scope: !310, file: !3, line: 308, type: !50)
!315 = !DILocation(line: 298, column: 2, scope: !310)
!316 = !DILocation(line: 298, column: 11, scope: !310)
!317 = !DILocation(line: 299, column: 4, scope: !310)
!318 = !DILocation(line: 299, column: 2, scope: !310)
!319 = !DILocation(line: 301, column: 5, scope: !320)
!320 = distinct !DILexicalBlock(scope: !310, file: !3, line: 301, column: 5)
!321 = !DILocation(line: 301, column: 15, scope: !320)
!322 = !DILocation(line: 301, column: 5, scope: !310)
!323 = !DILocation(line: 301, column: 30, scope: !320)
!324 = !DILocation(line: 301, column: 21, scope: !320)
!325 = !DILocation(line: 302, column: 5, scope: !326)
!326 = distinct !DILexicalBlock(scope: !310, file: !3, line: 302, column: 5)
!327 = !DILocation(line: 302, column: 14, scope: !326)
!328 = !DILocation(line: 302, column: 5, scope: !310)
!329 = !DILocation(line: 302, column: 28, scope: !326)
!330 = !DILocation(line: 302, column: 19, scope: !326)
!331 = !DILocation(line: 303, column: 6, scope: !332)
!332 = distinct !DILexicalBlock(scope: !310, file: !3, line: 303, column: 6)
!333 = !DILocation(line: 303, column: 16, scope: !332)
!334 = !DILocation(line: 303, column: 6, scope: !310)
!335 = !DILocation(line: 305, column: 3, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !3, line: 303, column: 22)
!337 = !DILocation(line: 306, column: 2, scope: !336)
!338 = !DILocation(line: 307, column: 2, scope: !310)
!339 = !DILocation(line: 307, column: 13, scope: !310)
!340 = !DILocation(line: 308, column: 2, scope: !310)
!341 = !DILocation(line: 308, column: 10, scope: !310)
!342 = !DILocation(line: 310, column: 7, scope: !343)
!343 = distinct !DILexicalBlock(scope: !310, file: !3, line: 310, column: 6)
!344 = !DILocation(line: 310, column: 17, scope: !343)
!345 = !DILocation(line: 310, column: 42, scope: !343)
!346 = !DILocation(line: 311, column: 5, scope: !343)
!347 = !DILocation(line: 311, column: 15, scope: !343)
!348 = !DILocation(line: 311, column: 37, scope: !343)
!349 = !DILocation(line: 312, column: 4, scope: !343)
!350 = !DILocation(line: 312, column: 17, scope: !343)
!351 = !DILocation(line: 312, column: 14, scope: !343)
!352 = !DILocation(line: 310, column: 6, scope: !310)
!353 = !DILocation(line: 313, column: 13, scope: !354)
!354 = distinct !DILexicalBlock(scope: !343, file: !3, line: 312, column: 31)
!355 = !DILocation(line: 314, column: 2, scope: !354)
!356 = !DILocation(line: 315, column: 18, scope: !357)
!357 = distinct !DILexicalBlock(scope: !343, file: !3, line: 314, column: 9)
!358 = !DILocation(line: 315, column: 3, scope: !357)
!359 = !DILocation(line: 315, column: 16, scope: !357)
!360 = !DILocation(line: 318, column: 9, scope: !310)
!361 = !DILocation(line: 318, column: 2, scope: !310)
!362 = !DILocation(line: 320, column: 4, scope: !363)
!363 = distinct !DILexicalBlock(scope: !310, file: !3, line: 318, column: 20)
!364 = !DILocation(line: 320, column: 30, scope: !363)
!365 = !{!129, !104, i64 24}
!366 = !DILocation(line: 321, column: 4, scope: !363)
!367 = !DILocation(line: 321, column: 13, scope: !363)
!368 = !{!129, !105, i64 180}
!369 = !DILocation(line: 322, column: 4, scope: !363)
!370 = !DILocation(line: 322, column: 14, scope: !363)
!371 = !{!129, !105, i64 26}
!372 = !DILocation(line: 323, column: 4, scope: !363)
!373 = !DILocation(line: 323, column: 24, scope: !363)
!374 = !{!129, !104, i64 178}
!375 = !DILocation(line: 325, column: 4, scope: !363)
!376 = !DILocation(line: 328, column: 4, scope: !363)
!377 = !DILocation(line: 328, column: 30, scope: !363)
!378 = !DILocation(line: 329, column: 4, scope: !363)
!379 = !DILocation(line: 329, column: 13, scope: !363)
!380 = !DILocation(line: 330, column: 4, scope: !363)
!381 = !DILocation(line: 330, column: 14, scope: !363)
!382 = !DILocation(line: 331, column: 4, scope: !363)
!383 = !DILocation(line: 331, column: 24, scope: !363)
!384 = !DILocation(line: 333, column: 4, scope: !363)
!385 = !DILocation(line: 336, column: 4, scope: !363)
!386 = !DILocation(line: 336, column: 13, scope: !363)
!387 = !DILocation(line: 338, column: 4, scope: !363)
!388 = !DILocation(line: 341, column: 4, scope: !363)
!389 = !DILocation(line: 341, column: 13, scope: !363)
!390 = !DILocation(line: 342, column: 4, scope: !363)
!391 = !DILocation(line: 344, column: 1, scope: !310)
!392 = distinct !DISubprogram(name: "task_resetStats", scope: !3, file: !3, line: 346, type: !21, scopeLine: 347, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!393 = !DILocation(line: 349, column: 2, scope: !392)
!394 = !DILocation(line: 349, column: 18, scope: !392)
!395 = !{!129, !104, i64 30}
!396 = !DILocation(line: 350, column: 2, scope: !392)
!397 = !DILocation(line: 350, column: 22, scope: !392)
!398 = !{!129, !104, i64 32}
!399 = !DILocation(line: 351, column: 2, scope: !392)
!400 = !DILocation(line: 351, column: 17, scope: !392)
!401 = !{!129, !104, i64 28}
!402 = !DILocation(line: 353, column: 2, scope: !392)
!403 = !DILocation(line: 353, column: 22, scope: !392)
!404 = !DILocation(line: 355, column: 1, scope: !392)
!405 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 357, type: !21, scopeLine: 358, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !406)
!406 = !{!407}
!407 = !DILocalVariable(name: "sample", scope: !405, file: !3, line: 360, type: !56)
!408 = !DILocation(line: 360, column: 2, scope: !405)
!409 = !DILocation(line: 360, column: 15, scope: !405)
!410 = !DILocation(line: 361, column: 31, scope: !405)
!411 = !DILocation(line: 361, column: 2, scope: !405)
!412 = !DILocation(line: 362, column: 2, scope: !405)
!413 = !DILocation(line: 362, column: 13, scope: !405)
!414 = !DILocation(line: 362, column: 36, scope: !405)
!415 = !{i64 0, i64 1, !108, i64 1, i64 1, !108, i64 2, i64 1, !108}
!416 = !DILocation(line: 363, column: 4, scope: !405)
!417 = !DILocation(line: 363, column: 2, scope: !405)
!418 = !DILocation(line: 365, column: 1, scope: !405)
!419 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 367, type: !21, scopeLine: 368, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !420)
!420 = !{!421, !423, !424}
!421 = !DILocalVariable(name: "sample", scope: !419, file: !3, line: 371, type: !422)
!422 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 16)
!423 = !DILocalVariable(name: "transformedSample", scope: !419, file: !3, line: 372, type: !56)
!424 = !DILocalVariable(name: "i", scope: !425, file: !3, line: 374, type: !6)
!425 = distinct !DILexicalBlock(scope: !419, file: !3, line: 374, column: 2)
!426 = !DILocation(line: 369, column: 5, scope: !419)
!427 = !DILocation(line: 369, column: 25, scope: !419)
!428 = !DILocation(line: 371, column: 2, scope: !419)
!429 = !DILocation(line: 371, column: 16, scope: !419)
!430 = !DILocation(line: 372, column: 2, scope: !419)
!431 = !DILocation(line: 372, column: 15, scope: !419)
!432 = !DILocation(line: 374, column: 7, scope: !425)
!433 = !DILocation(line: 374, column: 16, scope: !425)
!434 = !DILocation(line: 374, column: 23, scope: !435)
!435 = distinct !DILexicalBlock(scope: !425, file: !3, line: 374, column: 2)
!436 = !DILocation(line: 374, column: 25, scope: !435)
!437 = !DILocation(line: 374, column: 2, scope: !425)
!438 = !DILocation(line: 374, column: 2, scope: !435)
!439 = !DILocation(line: 375, column: 7, scope: !440)
!440 = distinct !DILexicalBlock(scope: !441, file: !3, line: 375, column: 7)
!441 = distinct !DILexicalBlock(scope: !435, file: !3, line: 374, column: 51)
!442 = !DILocation(line: 375, column: 18, scope: !440)
!443 = !DILocation(line: 375, column: 21, scope: !440)
!444 = !DILocation(line: 375, column: 23, scope: !440)
!445 = !DILocation(line: 375, column: 44, scope: !440)
!446 = !DILocation(line: 376, column: 5, scope: !440)
!447 = !DILocation(line: 376, column: 16, scope: !440)
!448 = !DILocation(line: 376, column: 19, scope: !440)
!449 = !DILocation(line: 376, column: 21, scope: !440)
!450 = !DILocation(line: 376, column: 42, scope: !440)
!451 = !DILocation(line: 377, column: 5, scope: !440)
!452 = !DILocation(line: 377, column: 16, scope: !440)
!453 = !DILocation(line: 377, column: 19, scope: !440)
!454 = !DILocation(line: 377, column: 21, scope: !440)
!455 = !DILocation(line: 375, column: 7, scope: !441)
!456 = !DILocation(line: 379, column: 23, scope: !457)
!457 = distinct !DILexicalBlock(scope: !440, file: !3, line: 377, column: 43)
!458 = !DILocation(line: 379, column: 34, scope: !457)
!459 = !DILocation(line: 379, column: 37, scope: !457)
!460 = !DILocation(line: 379, column: 39, scope: !457)
!461 = !DILocation(line: 379, column: 22, scope: !457)
!462 = !DILocation(line: 380, column: 7, scope: !457)
!463 = !DILocation(line: 380, column: 18, scope: !457)
!464 = !DILocation(line: 380, column: 21, scope: !457)
!465 = !DILocation(line: 379, column: 4, scope: !457)
!466 = !DILocation(line: 379, column: 15, scope: !457)
!467 = !DILocation(line: 379, column: 18, scope: !457)
!468 = !DILocation(line: 379, column: 20, scope: !457)
!469 = !DILocation(line: 381, column: 23, scope: !457)
!470 = !DILocation(line: 381, column: 34, scope: !457)
!471 = !DILocation(line: 381, column: 37, scope: !457)
!472 = !DILocation(line: 381, column: 39, scope: !457)
!473 = !DILocation(line: 381, column: 22, scope: !457)
!474 = !DILocation(line: 382, column: 7, scope: !457)
!475 = !DILocation(line: 382, column: 18, scope: !457)
!476 = !DILocation(line: 382, column: 21, scope: !457)
!477 = !DILocation(line: 381, column: 4, scope: !457)
!478 = !DILocation(line: 381, column: 15, scope: !457)
!479 = !DILocation(line: 381, column: 18, scope: !457)
!480 = !DILocation(line: 381, column: 20, scope: !457)
!481 = !DILocation(line: 383, column: 23, scope: !457)
!482 = !DILocation(line: 383, column: 34, scope: !457)
!483 = !DILocation(line: 383, column: 37, scope: !457)
!484 = !DILocation(line: 383, column: 39, scope: !457)
!485 = !DILocation(line: 383, column: 22, scope: !457)
!486 = !DILocation(line: 384, column: 7, scope: !457)
!487 = !DILocation(line: 384, column: 18, scope: !457)
!488 = !DILocation(line: 384, column: 21, scope: !457)
!489 = !DILocation(line: 383, column: 4, scope: !457)
!490 = !DILocation(line: 383, column: 15, scope: !457)
!491 = !DILocation(line: 383, column: 18, scope: !457)
!492 = !DILocation(line: 383, column: 20, scope: !457)
!493 = !DILocation(line: 385, column: 3, scope: !457)
!494 = !DILocation(line: 386, column: 2, scope: !441)
!495 = !DILocation(line: 374, column: 47, scope: !435)
!496 = distinct !{!496, !437, !497}
!497 = !DILocation(line: 386, column: 2, scope: !425)
!498 = !DILocation(line: 387, column: 1, scope: !419)
!499 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 389, type: !21, scopeLine: 390, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !500)
!500 = !{!501, !502, !503, !504, !506, !507}
!501 = !DILocalVariable(name: "mean", scope: !499, file: !3, line: 391, type: !56)
!502 = !DILocalVariable(name: "stddev", scope: !499, file: !3, line: 391, type: !56)
!503 = !DILocalVariable(name: "features", scope: !499, file: !3, line: 394, type: !69)
!504 = !DILocalVariable(name: "i", scope: !499, file: !3, line: 396, type: !505)
!505 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!506 = !DILocalVariable(name: "meanmag", scope: !499, file: !3, line: 419, type: !6)
!507 = !DILocalVariable(name: "stddevmag", scope: !499, file: !3, line: 420, type: !6)
!508 = !DILocation(line: 391, column: 2, scope: !499)
!509 = !DILocation(line: 391, column: 15, scope: !499)
!510 = !DILocation(line: 391, column: 21, scope: !499)
!511 = !DILocation(line: 392, column: 25, scope: !499)
!512 = !DILocation(line: 392, column: 27, scope: !499)
!513 = !DILocation(line: 392, column: 16, scope: !499)
!514 = !DILocation(line: 392, column: 18, scope: !499)
!515 = !DILocation(line: 392, column: 7, scope: !499)
!516 = !DILocation(line: 392, column: 9, scope: !499)
!517 = !DILocation(line: 393, column: 31, scope: !499)
!518 = !DILocation(line: 393, column: 33, scope: !499)
!519 = !DILocation(line: 393, column: 20, scope: !499)
!520 = !DILocation(line: 393, column: 22, scope: !499)
!521 = !DILocation(line: 393, column: 9, scope: !499)
!522 = !DILocation(line: 393, column: 11, scope: !499)
!523 = !DILocation(line: 394, column: 2, scope: !499)
!524 = !DILocation(line: 394, column: 13, scope: !499)
!525 = !DILocation(line: 396, column: 2, scope: !499)
!526 = !DILocation(line: 396, column: 6, scope: !499)
!527 = !DILocation(line: 397, column: 9, scope: !528)
!528 = distinct !DILexicalBlock(scope: !499, file: !3, line: 397, column: 2)
!529 = !DILocation(line: 397, column: 7, scope: !528)
!530 = !DILocation(line: 397, column: 14, scope: !531)
!531 = distinct !DILexicalBlock(scope: !528, file: !3, line: 397, column: 2)
!532 = !DILocation(line: 397, column: 16, scope: !531)
!533 = !DILocation(line: 397, column: 2, scope: !528)
!534 = !DILocation(line: 399, column: 13, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !3, line: 397, column: 42)
!536 = !DILocation(line: 399, column: 24, scope: !535)
!537 = !DILocation(line: 399, column: 27, scope: !535)
!538 = !DILocation(line: 399, column: 8, scope: !535)
!539 = !DILocation(line: 399, column: 10, scope: !535)
!540 = !DILocation(line: 400, column: 13, scope: !535)
!541 = !DILocation(line: 400, column: 24, scope: !535)
!542 = !DILocation(line: 400, column: 27, scope: !535)
!543 = !DILocation(line: 400, column: 8, scope: !535)
!544 = !DILocation(line: 400, column: 10, scope: !535)
!545 = !DILocation(line: 401, column: 13, scope: !535)
!546 = !DILocation(line: 401, column: 24, scope: !535)
!547 = !DILocation(line: 401, column: 27, scope: !535)
!548 = !DILocation(line: 401, column: 8, scope: !535)
!549 = !DILocation(line: 401, column: 10, scope: !535)
!550 = !DILocation(line: 402, column: 2, scope: !535)
!551 = !DILocation(line: 397, column: 38, scope: !531)
!552 = !DILocation(line: 397, column: 2, scope: !531)
!553 = distinct !{!553, !533, !554}
!554 = !DILocation(line: 402, column: 2, scope: !528)
!555 = !DILocation(line: 403, column: 7, scope: !499)
!556 = !DILocation(line: 403, column: 9, scope: !499)
!557 = !DILocation(line: 404, column: 7, scope: !499)
!558 = !DILocation(line: 404, column: 9, scope: !499)
!559 = !DILocation(line: 405, column: 7, scope: !499)
!560 = !DILocation(line: 405, column: 9, scope: !499)
!561 = !DILocation(line: 407, column: 9, scope: !562)
!562 = distinct !DILexicalBlock(scope: !499, file: !3, line: 407, column: 2)
!563 = !DILocation(line: 407, column: 7, scope: !562)
!564 = !DILocation(line: 407, column: 14, scope: !565)
!565 = distinct !DILexicalBlock(scope: !562, file: !3, line: 407, column: 2)
!566 = !DILocation(line: 407, column: 16, scope: !565)
!567 = !DILocation(line: 407, column: 2, scope: !562)
!568 = !DILocation(line: 408, column: 15, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !3, line: 407, column: 42)
!570 = !DILocation(line: 408, column: 26, scope: !569)
!571 = !DILocation(line: 408, column: 29, scope: !569)
!572 = !DILocation(line: 408, column: 38, scope: !569)
!573 = !DILocation(line: 408, column: 33, scope: !569)
!574 = !DILocation(line: 408, column: 31, scope: !569)
!575 = !DILocation(line: 408, column: 42, scope: !569)
!576 = !DILocation(line: 408, column: 53, scope: !569)
!577 = !DILocation(line: 408, column: 56, scope: !569)
!578 = !DILocation(line: 408, column: 65, scope: !569)
!579 = !DILocation(line: 408, column: 60, scope: !569)
!580 = !DILocation(line: 408, column: 58, scope: !569)
!581 = !DILocation(line: 409, column: 11, scope: !569)
!582 = !DILocation(line: 409, column: 6, scope: !569)
!583 = !DILocation(line: 409, column: 15, scope: !569)
!584 = !DILocation(line: 409, column: 26, scope: !569)
!585 = !DILocation(line: 409, column: 29, scope: !569)
!586 = !DILocation(line: 409, column: 13, scope: !569)
!587 = !DILocation(line: 408, column: 10, scope: !569)
!588 = !DILocation(line: 408, column: 12, scope: !569)
!589 = !DILocation(line: 410, column: 15, scope: !569)
!590 = !DILocation(line: 410, column: 26, scope: !569)
!591 = !DILocation(line: 410, column: 29, scope: !569)
!592 = !DILocation(line: 410, column: 38, scope: !569)
!593 = !DILocation(line: 410, column: 33, scope: !569)
!594 = !DILocation(line: 410, column: 31, scope: !569)
!595 = !DILocation(line: 410, column: 42, scope: !569)
!596 = !DILocation(line: 410, column: 53, scope: !569)
!597 = !DILocation(line: 410, column: 56, scope: !569)
!598 = !DILocation(line: 410, column: 65, scope: !569)
!599 = !DILocation(line: 410, column: 60, scope: !569)
!600 = !DILocation(line: 410, column: 58, scope: !569)
!601 = !DILocation(line: 411, column: 11, scope: !569)
!602 = !DILocation(line: 411, column: 6, scope: !569)
!603 = !DILocation(line: 411, column: 15, scope: !569)
!604 = !DILocation(line: 411, column: 26, scope: !569)
!605 = !DILocation(line: 411, column: 29, scope: !569)
!606 = !DILocation(line: 411, column: 13, scope: !569)
!607 = !DILocation(line: 410, column: 10, scope: !569)
!608 = !DILocation(line: 410, column: 12, scope: !569)
!609 = !DILocation(line: 412, column: 15, scope: !569)
!610 = !DILocation(line: 412, column: 26, scope: !569)
!611 = !DILocation(line: 412, column: 29, scope: !569)
!612 = !DILocation(line: 412, column: 38, scope: !569)
!613 = !DILocation(line: 412, column: 33, scope: !569)
!614 = !DILocation(line: 412, column: 31, scope: !569)
!615 = !DILocation(line: 412, column: 42, scope: !569)
!616 = !DILocation(line: 412, column: 53, scope: !569)
!617 = !DILocation(line: 412, column: 56, scope: !569)
!618 = !DILocation(line: 412, column: 65, scope: !569)
!619 = !DILocation(line: 412, column: 60, scope: !569)
!620 = !DILocation(line: 412, column: 58, scope: !569)
!621 = !DILocation(line: 413, column: 11, scope: !569)
!622 = !DILocation(line: 413, column: 6, scope: !569)
!623 = !DILocation(line: 413, column: 15, scope: !569)
!624 = !DILocation(line: 413, column: 26, scope: !569)
!625 = !DILocation(line: 413, column: 29, scope: !569)
!626 = !DILocation(line: 413, column: 13, scope: !569)
!627 = !DILocation(line: 412, column: 10, scope: !569)
!628 = !DILocation(line: 412, column: 12, scope: !569)
!629 = !DILocation(line: 414, column: 2, scope: !569)
!630 = !DILocation(line: 407, column: 38, scope: !565)
!631 = !DILocation(line: 407, column: 2, scope: !565)
!632 = distinct !{!632, !567, !633}
!633 = !DILocation(line: 414, column: 2, scope: !562)
!634 = !DILocation(line: 415, column: 9, scope: !499)
!635 = !DILocation(line: 415, column: 11, scope: !499)
!636 = !DILocation(line: 416, column: 9, scope: !499)
!637 = !DILocation(line: 416, column: 11, scope: !499)
!638 = !DILocation(line: 417, column: 9, scope: !499)
!639 = !DILocation(line: 417, column: 11, scope: !499)
!640 = !DILocation(line: 419, column: 2, scope: !499)
!641 = !DILocation(line: 419, column: 11, scope: !499)
!642 = !DILocation(line: 419, column: 26, scope: !499)
!643 = !DILocation(line: 419, column: 21, scope: !499)
!644 = !DILocation(line: 419, column: 33, scope: !499)
!645 = !DILocation(line: 419, column: 28, scope: !499)
!646 = !DILocation(line: 419, column: 27, scope: !499)
!647 = !DILocation(line: 419, column: 42, scope: !499)
!648 = !DILocation(line: 419, column: 37, scope: !499)
!649 = !DILocation(line: 419, column: 49, scope: !499)
!650 = !DILocation(line: 419, column: 44, scope: !499)
!651 = !DILocation(line: 419, column: 43, scope: !499)
!652 = !DILocation(line: 419, column: 35, scope: !499)
!653 = !DILocation(line: 419, column: 58, scope: !499)
!654 = !DILocation(line: 419, column: 53, scope: !499)
!655 = !DILocation(line: 419, column: 65, scope: !499)
!656 = !DILocation(line: 419, column: 60, scope: !499)
!657 = !DILocation(line: 419, column: 59, scope: !499)
!658 = !DILocation(line: 419, column: 51, scope: !499)
!659 = !DILocation(line: 420, column: 2, scope: !499)
!660 = !DILocation(line: 420, column: 11, scope: !499)
!661 = !DILocation(line: 420, column: 30, scope: !499)
!662 = !DILocation(line: 420, column: 23, scope: !499)
!663 = !DILocation(line: 420, column: 39, scope: !499)
!664 = !DILocation(line: 420, column: 32, scope: !499)
!665 = !DILocation(line: 420, column: 31, scope: !499)
!666 = !DILocation(line: 420, column: 50, scope: !499)
!667 = !DILocation(line: 420, column: 43, scope: !499)
!668 = !DILocation(line: 420, column: 59, scope: !499)
!669 = !DILocation(line: 420, column: 52, scope: !499)
!670 = !DILocation(line: 420, column: 51, scope: !499)
!671 = !DILocation(line: 420, column: 41, scope: !499)
!672 = !DILocation(line: 420, column: 70, scope: !499)
!673 = !DILocation(line: 420, column: 63, scope: !499)
!674 = !DILocation(line: 420, column: 79, scope: !499)
!675 = !DILocation(line: 420, column: 72, scope: !499)
!676 = !DILocation(line: 420, column: 71, scope: !499)
!677 = !DILocation(line: 420, column: 61, scope: !499)
!678 = !DILocation(line: 421, column: 28, scope: !499)
!679 = !DILocation(line: 421, column: 23, scope: !499)
!680 = !DILocation(line: 421, column: 11, scope: !499)
!681 = !DILocation(line: 421, column: 21, scope: !499)
!682 = !{!131, !104, i64 0}
!683 = !DILocation(line: 422, column: 28, scope: !499)
!684 = !DILocation(line: 422, column: 23, scope: !499)
!685 = !DILocation(line: 422, column: 11, scope: !499)
!686 = !DILocation(line: 422, column: 21, scope: !499)
!687 = !{!131, !104, i64 2}
!688 = !DILocation(line: 424, column: 10, scope: !499)
!689 = !DILocation(line: 424, column: 2, scope: !499)
!690 = !DILocation(line: 427, column: 4, scope: !691)
!691 = distinct !DILexicalBlock(scope: !499, file: !3, line: 424, column: 20)
!692 = !DILocation(line: 427, column: 19, scope: !691)
!693 = !{i64 0, i64 2, !103, i64 2, i64 2, !103}
!694 = !DILocation(line: 428, column: 4, scope: !691)
!695 = !DILocation(line: 430, column: 4, scope: !691)
!696 = !DILocation(line: 430, column: 19, scope: !691)
!697 = !DILocation(line: 431, column: 4, scope: !691)
!698 = !DILocation(line: 433, column: 4, scope: !691)
!699 = !DILocation(line: 435, column: 1, scope: !499)
!700 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 437, type: !21, scopeLine: 437, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !701)
!701 = !{!702, !703, !704, !705, !706, !708, !709, !713, !714, !715}
!702 = !DILocalVariable(name: "move_less_error", scope: !700, file: !3, line: 438, type: !505)
!703 = !DILocalVariable(name: "stat_less_error", scope: !700, file: !3, line: 439, type: !505)
!704 = !DILocalVariable(name: "i", scope: !700, file: !3, line: 440, type: !505)
!705 = !DILocalVariable(name: "class", scope: !700, file: !3, line: 441, type: !50)
!706 = !DILocalVariable(name: "meanmag", scope: !700, file: !3, line: 442, type: !707)
!707 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!708 = !DILocalVariable(name: "stddevmag", scope: !700, file: !3, line: 443, type: !707)
!709 = !DILocalVariable(name: "stat_mean_err", scope: !710, file: !3, line: 449, type: !707)
!710 = distinct !DILexicalBlock(scope: !711, file: !3, line: 448, column: 35)
!711 = distinct !DILexicalBlock(scope: !712, file: !3, line: 448, column: 2)
!712 = distinct !DILexicalBlock(scope: !700, file: !3, line: 448, column: 2)
!713 = !DILocalVariable(name: "stat_sd_err", scope: !710, file: !3, line: 453, type: !707)
!714 = !DILocalVariable(name: "move_mean_err", scope: !710, file: !3, line: 457, type: !707)
!715 = !DILocalVariable(name: "move_sd_err", scope: !710, file: !3, line: 461, type: !707)
!716 = !DILocation(line: 438, column: 2, scope: !700)
!717 = !DILocation(line: 438, column: 6, scope: !700)
!718 = !DILocation(line: 439, column: 2, scope: !700)
!719 = !DILocation(line: 439, column: 6, scope: !700)
!720 = !DILocation(line: 440, column: 2, scope: !700)
!721 = !DILocation(line: 440, column: 6, scope: !700)
!722 = !DILocation(line: 441, column: 2, scope: !700)
!723 = !DILocation(line: 441, column: 10, scope: !700)
!724 = !DILocation(line: 442, column: 2, scope: !700)
!725 = !DILocation(line: 442, column: 11, scope: !700)
!726 = !DILocation(line: 443, column: 2, scope: !700)
!727 = !DILocation(line: 443, column: 11, scope: !700)
!728 = !DILocation(line: 445, column: 12, scope: !700)
!729 = !DILocation(line: 445, column: 25, scope: !700)
!730 = !{!129, !104, i64 44}
!731 = !DILocation(line: 445, column: 10, scope: !700)
!732 = !{!733, !733, i64 0}
!733 = !{!"long", !105, i64 0}
!734 = !DILocation(line: 446, column: 14, scope: !700)
!735 = !DILocation(line: 446, column: 27, scope: !700)
!736 = !{!129, !104, i64 46}
!737 = !DILocation(line: 446, column: 12, scope: !700)
!738 = !DILocation(line: 448, column: 9, scope: !712)
!739 = !DILocation(line: 448, column: 7, scope: !712)
!740 = !DILocation(line: 448, column: 14, scope: !711)
!741 = !DILocation(line: 448, column: 16, scope: !711)
!742 = !DILocation(line: 448, column: 2, scope: !712)
!743 = !DILocation(line: 449, column: 3, scope: !710)
!744 = !DILocation(line: 449, column: 12, scope: !710)
!745 = !DILocation(line: 449, column: 29, scope: !710)
!746 = !DILocation(line: 449, column: 50, scope: !710)
!747 = !DILocation(line: 449, column: 53, scope: !710)
!748 = !DILocation(line: 449, column: 63, scope: !710)
!749 = !DILocation(line: 449, column: 61, scope: !710)
!750 = !DILocation(line: 449, column: 28, scope: !710)
!751 = !DILocation(line: 450, column: 7, scope: !710)
!752 = !DILocation(line: 450, column: 28, scope: !710)
!753 = !DILocation(line: 450, column: 31, scope: !710)
!754 = !DILocation(line: 450, column: 41, scope: !710)
!755 = !DILocation(line: 450, column: 39, scope: !710)
!756 = !DILocation(line: 451, column: 7, scope: !710)
!757 = !DILocation(line: 451, column: 17, scope: !710)
!758 = !DILocation(line: 451, column: 38, scope: !710)
!759 = !DILocation(line: 451, column: 41, scope: !710)
!760 = !DILocation(line: 451, column: 15, scope: !710)
!761 = !DILocation(line: 453, column: 3, scope: !710)
!762 = !DILocation(line: 453, column: 12, scope: !710)
!763 = !DILocation(line: 453, column: 27, scope: !710)
!764 = !DILocation(line: 453, column: 48, scope: !710)
!765 = !DILocation(line: 453, column: 51, scope: !710)
!766 = !DILocation(line: 453, column: 63, scope: !710)
!767 = !DILocation(line: 453, column: 61, scope: !710)
!768 = !DILocation(line: 453, column: 26, scope: !710)
!769 = !DILocation(line: 454, column: 7, scope: !710)
!770 = !DILocation(line: 454, column: 28, scope: !710)
!771 = !DILocation(line: 454, column: 31, scope: !710)
!772 = !DILocation(line: 454, column: 43, scope: !710)
!773 = !DILocation(line: 454, column: 41, scope: !710)
!774 = !DILocation(line: 455, column: 7, scope: !710)
!775 = !DILocation(line: 455, column: 19, scope: !710)
!776 = !DILocation(line: 455, column: 40, scope: !710)
!777 = !DILocation(line: 455, column: 43, scope: !710)
!778 = !DILocation(line: 455, column: 17, scope: !710)
!779 = !DILocation(line: 457, column: 3, scope: !710)
!780 = !DILocation(line: 457, column: 12, scope: !710)
!781 = !DILocation(line: 457, column: 29, scope: !710)
!782 = !DILocation(line: 457, column: 46, scope: !710)
!783 = !DILocation(line: 457, column: 49, scope: !710)
!784 = !DILocation(line: 457, column: 59, scope: !710)
!785 = !DILocation(line: 457, column: 57, scope: !710)
!786 = !DILocation(line: 457, column: 28, scope: !710)
!787 = !DILocation(line: 458, column: 7, scope: !710)
!788 = !DILocation(line: 458, column: 24, scope: !710)
!789 = !DILocation(line: 458, column: 27, scope: !710)
!790 = !DILocation(line: 458, column: 37, scope: !710)
!791 = !DILocation(line: 458, column: 35, scope: !710)
!792 = !DILocation(line: 459, column: 7, scope: !710)
!793 = !DILocation(line: 459, column: 17, scope: !710)
!794 = !DILocation(line: 459, column: 34, scope: !710)
!795 = !DILocation(line: 459, column: 37, scope: !710)
!796 = !DILocation(line: 459, column: 15, scope: !710)
!797 = !DILocation(line: 461, column: 3, scope: !710)
!798 = !DILocation(line: 461, column: 12, scope: !710)
!799 = !DILocation(line: 461, column: 27, scope: !710)
!800 = !DILocation(line: 461, column: 44, scope: !710)
!801 = !DILocation(line: 461, column: 47, scope: !710)
!802 = !DILocation(line: 461, column: 59, scope: !710)
!803 = !DILocation(line: 461, column: 57, scope: !710)
!804 = !DILocation(line: 461, column: 26, scope: !710)
!805 = !DILocation(line: 462, column: 7, scope: !710)
!806 = !DILocation(line: 462, column: 24, scope: !710)
!807 = !DILocation(line: 462, column: 27, scope: !710)
!808 = !DILocation(line: 462, column: 39, scope: !710)
!809 = !DILocation(line: 462, column: 37, scope: !710)
!810 = !DILocation(line: 463, column: 7, scope: !710)
!811 = !DILocation(line: 463, column: 19, scope: !710)
!812 = !DILocation(line: 463, column: 36, scope: !710)
!813 = !DILocation(line: 463, column: 39, scope: !710)
!814 = !DILocation(line: 463, column: 17, scope: !710)
!815 = !DILocation(line: 465, column: 7, scope: !816)
!816 = distinct !DILexicalBlock(scope: !710, file: !3, line: 465, column: 7)
!817 = !DILocation(line: 465, column: 23, scope: !816)
!818 = !DILocation(line: 465, column: 21, scope: !816)
!819 = !DILocation(line: 465, column: 7, scope: !710)
!820 = !DILocation(line: 466, column: 19, scope: !821)
!821 = distinct !DILexicalBlock(scope: !816, file: !3, line: 465, column: 38)
!822 = !DILocation(line: 467, column: 3, scope: !821)
!823 = !DILocation(line: 468, column: 19, scope: !824)
!824 = distinct !DILexicalBlock(scope: !816, file: !3, line: 467, column: 10)
!825 = !DILocation(line: 471, column: 7, scope: !826)
!826 = distinct !DILexicalBlock(scope: !710, file: !3, line: 471, column: 7)
!827 = !DILocation(line: 471, column: 21, scope: !826)
!828 = !DILocation(line: 471, column: 19, scope: !826)
!829 = !DILocation(line: 471, column: 7, scope: !710)
!830 = !DILocation(line: 472, column: 19, scope: !831)
!831 = distinct !DILexicalBlock(scope: !826, file: !3, line: 471, column: 34)
!832 = !DILocation(line: 473, column: 3, scope: !831)
!833 = !DILocation(line: 474, column: 19, scope: !834)
!834 = distinct !DILexicalBlock(scope: !826, file: !3, line: 473, column: 10)
!835 = !DILocation(line: 476, column: 2, scope: !711)
!836 = !DILocation(line: 476, column: 2, scope: !710)
!837 = !DILocation(line: 448, column: 30, scope: !711)
!838 = !DILocation(line: 448, column: 2, scope: !711)
!839 = distinct !{!839, !742, !840}
!840 = !DILocation(line: 476, column: 2, scope: !712)
!841 = !DILocation(line: 478, column: 15, scope: !700)
!842 = !DILocation(line: 478, column: 33, scope: !700)
!843 = !DILocation(line: 478, column: 31, scope: !700)
!844 = !DILocation(line: 478, column: 14, scope: !700)
!845 = !DILocation(line: 478, column: 2, scope: !700)
!846 = !DILocation(line: 478, column: 12, scope: !700)
!847 = !DILocation(line: 480, column: 1, scope: !700)
!848 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 482, type: !21, scopeLine: 483, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !849)
!849 = !{!850, !851, !852, !855, !856}
!850 = !DILocalVariable(name: "movingCount", scope: !848, file: !3, line: 484, type: !6)
!851 = !DILocalVariable(name: "stationaryCount", scope: !848, file: !3, line: 484, type: !6)
!852 = !DILocalVariable(name: "resultStationaryPct", scope: !853, file: !3, line: 501, type: !6)
!853 = distinct !DILexicalBlock(scope: !854, file: !3, line: 499, column: 44)
!854 = distinct !DILexicalBlock(scope: !848, file: !3, line: 499, column: 6)
!855 = !DILocalVariable(name: "resultMovingPct", scope: !853, file: !3, line: 502, type: !6)
!856 = !DILocalVariable(name: "sum", scope: !853, file: !3, line: 504, type: !6)
!857 = !DILocation(line: 484, column: 2, scope: !848)
!858 = !DILocation(line: 484, column: 11, scope: !848)
!859 = !DILocation(line: 484, column: 28, scope: !848)
!860 = !DILocation(line: 486, column: 4, scope: !848)
!861 = !DILocation(line: 486, column: 2, scope: !848)
!862 = !DILocation(line: 488, column: 10, scope: !848)
!863 = !DILocation(line: 488, column: 2, scope: !848)
!864 = !DILocation(line: 491, column: 6, scope: !865)
!865 = distinct !DILexicalBlock(scope: !848, file: !3, line: 488, column: 21)
!866 = !DILocation(line: 491, column: 4, scope: !865)
!867 = !DILocation(line: 492, column: 4, scope: !865)
!868 = !DILocation(line: 495, column: 6, scope: !865)
!869 = !DILocation(line: 495, column: 4, scope: !865)
!870 = !DILocation(line: 496, column: 4, scope: !865)
!871 = !DILocation(line: 499, column: 6, scope: !854)
!872 = !DILocation(line: 499, column: 21, scope: !854)
!873 = !DILocation(line: 499, column: 6, scope: !848)
!874 = !DILocation(line: 501, column: 3, scope: !853)
!875 = !DILocation(line: 501, column: 12, scope: !853)
!876 = !DILocation(line: 501, column: 34, scope: !853)
!877 = !DILocation(line: 501, column: 54, scope: !853)
!878 = !DILocation(line: 501, column: 62, scope: !853)
!879 = !DILocation(line: 501, column: 60, scope: !853)
!880 = !DILocation(line: 502, column: 3, scope: !853)
!881 = !DILocation(line: 502, column: 12, scope: !853)
!882 = !DILocation(line: 502, column: 30, scope: !853)
!883 = !DILocation(line: 502, column: 46, scope: !853)
!884 = !DILocation(line: 502, column: 54, scope: !853)
!885 = !DILocation(line: 502, column: 52, scope: !853)
!886 = !DILocation(line: 504, column: 3, scope: !853)
!887 = !DILocation(line: 504, column: 12, scope: !853)
!888 = !DILocation(line: 504, column: 18, scope: !853)
!889 = !DILocation(line: 504, column: 40, scope: !853)
!890 = !DILocation(line: 504, column: 38, scope: !853)
!891 = !DILocation(line: 506, column: 2, scope: !854)
!892 = !DILocation(line: 506, column: 2, scope: !853)
!893 = !DILocation(line: 507, column: 1, scope: !848)
!894 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 509, type: !21, scopeLine: 510, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !895)
!895 = !{!896}
!896 = !DILocalVariable(name: "sample", scope: !894, file: !3, line: 512, type: !57)
!897 = !DILocation(line: 512, column: 5, scope: !894)
!898 = !DILocation(line: 512, column: 19, scope: !894)
!899 = !DILocation(line: 514, column: 45, scope: !894)
!900 = !DILocation(line: 514, column: 16, scope: !894)
!901 = !DILocation(line: 514, column: 5, scope: !894)
!902 = !DILocation(line: 514, column: 14, scope: !894)
!903 = !DILocation(line: 515, column: 7, scope: !894)
!904 = !DILocation(line: 515, column: 5, scope: !894)
!905 = !DILocation(line: 517, column: 9, scope: !906)
!906 = distinct !DILexicalBlock(scope: !894, file: !3, line: 517, column: 9)
!907 = !DILocation(line: 517, column: 35, scope: !906)
!908 = !DILocation(line: 517, column: 9, scope: !894)
!909 = !DILocation(line: 518, column: 9, scope: !910)
!910 = distinct !DILexicalBlock(scope: !906, file: !3, line: 517, column: 57)
!911 = !DILocation(line: 518, column: 29, scope: !910)
!912 = !{!129, !104, i64 176}
!913 = !DILocation(line: 519, column: 5, scope: !910)
!914 = !DILocation(line: 520, column: 1, scope: !894)
!915 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 522, type: !21, scopeLine: 523, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !916)
!916 = !{!917, !918}
!917 = !DILocalVariable(name: "trainingSetSize", scope: !915, file: !3, line: 524, type: !6)
!918 = !DILocalVariable(name: "class", scope: !915, file: !3, line: 525, type: !6)
!919 = !DILocation(line: 524, column: 2, scope: !915)
!920 = !DILocation(line: 524, column: 11, scope: !915)
!921 = !DILocation(line: 525, column: 2, scope: !915)
!922 = !DILocation(line: 525, column: 11, scope: !915)
!923 = !DILocation(line: 527, column: 10, scope: !915)
!924 = !DILocation(line: 527, column: 2, scope: !915)
!925 = !DILocation(line: 529, column: 4, scope: !926)
!926 = distinct !DILexicalBlock(scope: !915, file: !3, line: 527, column: 21)
!927 = !DILocation(line: 529, column: 25, scope: !926)
!928 = !DILocation(line: 529, column: 48, scope: !926)
!929 = !DILocation(line: 530, column: 4, scope: !926)
!930 = !DILocation(line: 532, column: 4, scope: !926)
!931 = !DILocation(line: 532, column: 21, scope: !926)
!932 = !DILocation(line: 532, column: 44, scope: !926)
!933 = !DILocation(line: 533, column: 4, scope: !926)
!934 = !DILocation(line: 536, column: 4, scope: !915)
!935 = !DILocation(line: 536, column: 2, scope: !915)
!936 = !DILocation(line: 538, column: 1, scope: !915)
!937 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 540, type: !21, scopeLine: 540, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!938 = !DILocation(line: 542, column: 2, scope: !937)
!939 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 545, type: !21, scopeLine: 545, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!940 = !DILocation(line: 547, column: 1, scope: !939)
!941 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 550, type: !942, scopeLine: 550, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !101)
!942 = !DISubroutineType(types: !943)
!943 = !{!505}
!944 = !DILocation(line: 552, column: 16, scope: !941)
!945 = !DILocation(line: 553, column: 10, scope: !941)
!946 = !DILocation(line: 554, column: 12, scope: !941)
!947 = !DILocation(line: 555, column: 2, scope: !941)
!948 = !DILocation(line: 557, column: 2, scope: !941)
!949 = !DILocation(line: 559, column: 2, scope: !941)
!950 = !DILocation(line: 561, column: 3, scope: !951)
!951 = distinct !DILexicalBlock(scope: !941, file: !3, line: 559, column: 12)
!952 = !DILocation(line: 563, column: 7, scope: !953)
!953 = distinct !DILexicalBlock(scope: !951, file: !3, line: 563, column: 7)
!954 = !DILocation(line: 563, column: 17, scope: !953)
!955 = !DILocation(line: 563, column: 42, scope: !953)
!956 = !DILocation(line: 563, column: 45, scope: !953)
!957 = !DILocation(line: 563, column: 55, scope: !953)
!958 = !DILocation(line: 563, column: 7, scope: !951)
!959 = !DILocation(line: 566, column: 13, scope: !960)
!960 = distinct !DILexicalBlock(scope: !953, file: !3, line: 563, column: 76)
!961 = !DILocation(line: 566, column: 20, scope: !960)
!962 = !DILocation(line: 566, column: 47, scope: !960)
!963 = !DILocation(line: 568, column: 5, scope: !964)
!964 = distinct !DILexicalBlock(scope: !960, file: !3, line: 566, column: 69)
!965 = distinct !{!965, !959, !966}
!966 = !DILocation(line: 570, column: 13, scope: !960)
!967 = !DILocation(line: 572, column: 3, scope: !960)
!968 = !DILocation(line: 572, column: 14, scope: !969)
!969 = distinct !DILexicalBlock(scope: !953, file: !3, line: 572, column: 14)
!970 = !DILocation(line: 572, column: 24, scope: !969)
!971 = !DILocation(line: 572, column: 14, scope: !953)
!972 = !DILocation(line: 574, column: 4, scope: !973)
!973 = distinct !DILexicalBlock(scope: !969, file: !3, line: 572, column: 44)
!974 = !DILocation(line: 576, column: 3, scope: !973)
!975 = !DILocation(line: 576, column: 14, scope: !976)
!976 = distinct !DILexicalBlock(scope: !969, file: !3, line: 576, column: 14)
!977 = !DILocation(line: 576, column: 24, scope: !976)
!978 = !DILocation(line: 576, column: 14, scope: !969)
!979 = !DILocation(line: 578, column: 4, scope: !980)
!980 = distinct !DILexicalBlock(scope: !976, file: !3, line: 576, column: 38)
!981 = distinct !{!981, !949, !982}
!982 = !DILocation(line: 614, column: 2, scope: !941)
!983 = !DILocation(line: 581, column: 3, scope: !951)
!984 = !DILocation(line: 584, column: 13, scope: !985)
!985 = distinct !DILexicalBlock(scope: !951, file: !3, line: 581, column: 13)
!986 = !DILocation(line: 584, column: 20, scope: !985)
!987 = !DILocation(line: 584, column: 41, scope: !985)
!988 = !DILocation(line: 586, column: 5, scope: !989)
!989 = distinct !DILexicalBlock(scope: !985, file: !3, line: 584, column: 61)
!990 = distinct !{!990, !984, !991}
!991 = !DILocation(line: 588, column: 13, scope: !985)
!992 = !DILocation(line: 590, column: 4, scope: !985)
!993 = !DILocation(line: 592, column: 4, scope: !985)
!994 = !DILocation(line: 594, column: 8, scope: !995)
!995 = distinct !DILexicalBlock(scope: !985, file: !3, line: 594, column: 8)
!996 = !DILocation(line: 594, column: 18, scope: !995)
!997 = !DILocation(line: 594, column: 43, scope: !995)
!998 = !DILocation(line: 594, column: 46, scope: !995)
!999 = !DILocation(line: 594, column: 56, scope: !995)
!1000 = !DILocation(line: 594, column: 8, scope: !985)
!1001 = !DILocation(line: 596, column: 5, scope: !1002)
!1002 = distinct !DILexicalBlock(scope: !995, file: !3, line: 594, column: 77)
!1003 = !DILocation(line: 598, column: 9, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 598, column: 9)
!1005 = !DILocation(line: 598, column: 30, scope: !1004)
!1006 = !DILocation(line: 598, column: 9, scope: !1002)
!1007 = !DILocation(line: 599, column: 6, scope: !1004)
!1008 = !DILocation(line: 601, column: 4, scope: !1002)
!1009 = !DILocation(line: 601, column: 15, scope: !1010)
!1010 = distinct !DILexicalBlock(scope: !995, file: !3, line: 601, column: 15)
!1011 = !DILocation(line: 601, column: 25, scope: !1010)
!1012 = !DILocation(line: 601, column: 15, scope: !995)
!1013 = !DILocation(line: 603, column: 5, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1010, file: !3, line: 601, column: 45)
!1015 = !DILocation(line: 605, column: 5, scope: !1014)
!1016 = !DILocation(line: 607, column: 9, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 607, column: 9)
!1018 = !DILocation(line: 607, column: 25, scope: !1017)
!1019 = !DILocation(line: 607, column: 9, scope: !1014)
!1020 = !DILocation(line: 608, column: 6, scope: !1017)
!1021 = !DILocation(line: 610, column: 4, scope: !1014)
!1022 = distinct !{!1022, !983, !1023}
!1023 = !DILocation(line: 611, column: 3, scope: !951)
