; ModuleID = 'camel_rsa.bc'
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !25
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !67
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !18
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !23
@pubkey = internal constant %struct.pubkey_t { [8 x i8] c"\15p\F6B\0E\82q\A6", i16 3 }, align 2, !dbg !72
@PLAINTEXT = internal constant [12 x i8] c".RRRSSSAAA.\00", align 1, !dbg !84
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !13
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !69
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local void @camel_init() #0 !dbg !99 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !100, !tbaa !101
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !105, !tbaa !106
  %conv = zext i8 %0 to i16, !dbg !105
  %or = or i16 %conv, 1, !dbg !105
  %conv1 = trunc i16 %or to i8, !dbg !105
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !105, !tbaa !106
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !107, !tbaa !106
  %conv2 = zext i8 %1 to i16, !dbg !107
  %and = and i16 %conv2, -2, !dbg !107
  %conv3 = trunc i16 %and to i8, !dbg !107
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !107, !tbaa !106
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !108, !tbaa !101
  %and4 = and i16 %2, -2, !dbg !108
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
define dso_local void @camel_recover() #0 !dbg !116 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !122, !tbaa !124
  %cmp = icmp eq i16 %0, 1, !dbg !129
  br i1 %cmp, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !131, !tbaa !133
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !135, !tbaa !133
  br label %if.end4, !dbg !136

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !137, !tbaa !124
  %cmp1 = icmp eq i16 %1, 2, !dbg !139
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !140

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !141, !tbaa !133
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !143, !tbaa !133
  br label %if.end, !dbg !144

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !145
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !147, !tbaa !133
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !147
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !147
  %3 = load i16, i16* %arrayidx, align 2, !dbg !147, !tbaa !149
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !147, !srcloc !150
  %4 = bitcast i16* %__x to i8*, !dbg !151
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !151
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !118, metadata !DIExpression()), !dbg !151
  %5 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !151, !srcloc !152
  store i16 %5, i16* %__x, align 2, !dbg !151, !tbaa !101
  %6 = load i16, i16* %__x, align 2, !dbg !151, !tbaa !101
  store i16 %6, i16* %tmp, align 2, !dbg !151, !tbaa !101
  %7 = bitcast i16* %__x to i8*, !dbg !153
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #5, !dbg !153
  %8 = load i16, i16* %tmp, align 2, !dbg !151, !tbaa !101
  %add = add i16 %8, 2, !dbg !154
  %9 = inttoptr i16 %add to i8*, !dbg !153
  %10 = bitcast i16* %__x5 to i8*, !dbg !155
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #5, !dbg !155
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !120, metadata !DIExpression()), !dbg !155
  %11 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !155, !srcloc !156
  store i16 %11, i16* %__x5, align 2, !dbg !155, !tbaa !101
  %12 = load i16, i16* %__x5, align 2, !dbg !155, !tbaa !101
  store i16 %12, i16* %tmp6, align 2, !dbg !155, !tbaa !101
  %13 = bitcast i16* %__x5 to i8*, !dbg !157
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %13) #5, !dbg !157
  %14 = load i16, i16* %tmp6, align 2, !dbg !155, !tbaa !101
  %add7 = add i16 %14, 2, !dbg !158
  %sub = sub i16 9216, %add7, !dbg !159
  %call = call zeroext i16 @__fast_hw_crc(i8* %9, i16 zeroext %sub, i16 zeroext -1), !dbg !160
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !161, !tbaa !149
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162, !tbaa !133
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !162
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !163, !tbaa !149
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 224, i16 zeroext %17), !dbg !164
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !165, !tbaa !149
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !166, !tbaa !149
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !168, !tbaa !133
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !169
  %20 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !169, !tbaa !170
  %cmp9 = icmp eq i16 %18, %20, !dbg !171
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !172

if.then10:                                        ; preds = %if.end4
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173, !tbaa !133
  %22 = bitcast %struct.camel_buffer_t* %21 to i8*, !dbg !175
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !176, !tbaa !133
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !175
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %22, i8* align 2 %24, i16 226, i1 false), !dbg !175
  call void @camel_init(), !dbg !177
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !178, !tbaa !133
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !179
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !178
  call void @__restore_registers(i16* %arraydecay), !dbg !180
  br label %if.end13, !dbg !181

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !182
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !184
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
define dso_local void @commit() #0 !dbg !185 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !199

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !200, !tbaa !124
  %cmp = icmp eq i16 %0, 1, !dbg !201
  br i1 %cmp, label %if.then, label %if.else, !dbg !202

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !203, !tbaa !133
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !204, !tbaa !133
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !205, !tbaa !133
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !206
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !205
  call void @__dump_registers(i16* %arraydecay), !dbg !207
  %2 = bitcast i16* %__x to i8*, !dbg !208
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !208
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !187, metadata !DIExpression()), !dbg !208
  %3 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !208, !srcloc !209
  store i16 %3, i16* %__x, align 2, !dbg !208, !tbaa !101
  %4 = load i16, i16* %__x, align 2, !dbg !208, !tbaa !101
  store i16 %4, i16* %tmp, align 2, !dbg !208, !tbaa !101
  %5 = bitcast i16* %__x to i8*, !dbg !210
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #5, !dbg !210
  %6 = load i16, i16* %tmp, align 2, !dbg !208, !tbaa !101
  %add = add i16 %6, 2, !dbg !211
  %7 = inttoptr i16 %add to i8*, !dbg !210
  %8 = bitcast i16* %__x1 to i8*, !dbg !212
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #5, !dbg !212
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !192, metadata !DIExpression()), !dbg !212
  %9 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !212, !srcloc !213
  store i16 %9, i16* %__x1, align 2, !dbg !212, !tbaa !101
  %10 = load i16, i16* %__x1, align 2, !dbg !212, !tbaa !101
  store i16 %10, i16* %tmp2, align 2, !dbg !212, !tbaa !101
  %11 = bitcast i16* %__x1 to i8*, !dbg !214
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #5, !dbg !214
  %12 = load i16, i16* %tmp2, align 2, !dbg !212, !tbaa !101
  %add3 = add i16 %12, 2, !dbg !215
  %sub = sub i16 9216, %add3, !dbg !216
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !217
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !218, !tbaa !149
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !219, !tbaa !133
  %14 = bitcast %struct.camel_buffer_t* %13 to i8*, !dbg !219
  %15 = load i16, i16* @tmp_stack_crc, align 2, !dbg !220, !tbaa !149
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %14, i16 zeroext 224, i16 zeroext %15), !dbg !221
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !222, !tbaa !149
  %16 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !223, !tbaa !149
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !224, !tbaa !133
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 2, !dbg !225
  store i16 %16, i16* %stack_and_buf_crc, align 2, !dbg !226, !tbaa !170
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !227, !tbaa !124
  br label %if.end, !dbg !228

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !229, !tbaa !133
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !230, !tbaa !133
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !231, !tbaa !133
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !232
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !231
  call void @__dump_registers(i16* %arraydecay6), !dbg !233
  %19 = bitcast i16* %__x7 to i8*, !dbg !234
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %19) #5, !dbg !234
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !194, metadata !DIExpression()), !dbg !234
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !234, !srcloc !235
  store i16 %20, i16* %__x7, align 2, !dbg !234, !tbaa !101
  %21 = load i16, i16* %__x7, align 2, !dbg !234, !tbaa !101
  store i16 %21, i16* %tmp8, align 2, !dbg !234, !tbaa !101
  %22 = bitcast i16* %__x7 to i8*, !dbg !236
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #5, !dbg !236
  %23 = load i16, i16* %tmp8, align 2, !dbg !234, !tbaa !101
  %add9 = add i16 %23, 2, !dbg !237
  %24 = inttoptr i16 %add9 to i8*, !dbg !236
  %25 = bitcast i16* %__x10 to i8*, !dbg !238
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %25) #5, !dbg !238
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !197, metadata !DIExpression()), !dbg !238
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !238, !srcloc !239
  store i16 %26, i16* %__x10, align 2, !dbg !238, !tbaa !101
  %27 = load i16, i16* %__x10, align 2, !dbg !238, !tbaa !101
  store i16 %27, i16* %tmp11, align 2, !dbg !238, !tbaa !101
  %28 = bitcast i16* %__x10 to i8*, !dbg !240
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #5, !dbg !240
  %29 = load i16, i16* %tmp11, align 2, !dbg !238, !tbaa !101
  %add12 = add i16 %29, 2, !dbg !241
  %sub13 = sub i16 9216, %add12, !dbg !242
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub13, i16 zeroext -1), !dbg !243
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !244, !tbaa !149
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !245, !tbaa !133
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !245
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !246, !tbaa !149
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 224, i16 zeroext %32), !dbg !247
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !248, !tbaa !149
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !249, !tbaa !149
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !250, !tbaa !133
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !251
  store i16 %33, i16* %stack_and_buf_crc16, align 2, !dbg !252, !tbaa !170
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !253, !tbaa !124
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !254

do.end:                                           ; preds = %if.end
  ret void, !dbg !255
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: nounwind
define dso_local void @task_done() #0 !dbg !256 {
entry:
  call void @exit(i16 0) #6, !dbg !257
  unreachable, !dbg !257
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: nounwind
define dso_local void @task_init() #0 !dbg !258 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !263
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !263
  call void @llvm.dbg.declare(metadata i16* %i, metadata !260, metadata !DIExpression()), !dbg !264
  %1 = bitcast i16* %message_length to i8*, !dbg !265
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !265
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !262, metadata !DIExpression()), !dbg !266
  store i16 11, i16* %message_length, align 2, !dbg !266, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !267, !tbaa !101
  br label %for.cond, !dbg !269

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !270, !tbaa !101
  %cmp = icmp slt i16 %2, 8, !dbg !272
  br i1 %cmp, label %for.body, label %for.end, !dbg !273

for.body:                                         ; preds = %for.cond
  %3 = load i16, i16* %i, align 2, !dbg !274, !tbaa !101
  %arrayidx = getelementptr inbounds [8 x i8], [8 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %3, !dbg !276
  %4 = load i8, i8* %arrayidx, align 1, !dbg !276, !tbaa !106
  %conv = zext i8 %4 to i16, !dbg !276
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !277
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !277
  %6 = load i16, i16* %i, align 2, !dbg !278, !tbaa !101
  %arrayidx1 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %6, !dbg !277
  store i16 %conv, i16* %arrayidx1, align 2, !dbg !279, !tbaa !149
  br label %for.inc, !dbg !280

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !281, !tbaa !101
  %inc = add nsw i16 %7, 1, !dbg !281
  store i16 %inc, i16* %i, align 2, !dbg !281, !tbaa !101
  br label %for.cond, !dbg !282, !llvm.loop !283

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %message_length, align 2, !dbg !285, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !286, !tbaa !133
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !286
  %message_length3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !286
  store i16 %8, i16* %message_length3, align 2, !dbg !287, !tbaa !288
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !289
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !289
  store i16 0, i16* %block_offset, align 2, !dbg !290, !tbaa !291
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !292, !tbaa !133
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !292
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 5, !dbg !292
  store i16 0, i16* %cyphertext_len, align 2, !dbg !293, !tbaa !294
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295, !tbaa !133
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !295
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !295
  store i16 0, i16* %check, align 2, !dbg !296, !tbaa !297
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !298
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !298
  store i16 0, i16* %check_final, align 2, !dbg !299, !tbaa !300
  %14 = bitcast i16* %message_length to i8*, !dbg !301
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #5, !dbg !301
  %15 = bitcast i16* %i to i8*, !dbg !301
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %15) #5, !dbg !301
  ret void, !dbg !301
}

; Function Attrs: nounwind
define dso_local void @task_pad() #0 !dbg !302 {
entry:
  %i = alloca i16, align 2
  %zero = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !306
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !306
  call void @llvm.dbg.declare(metadata i16* %i, metadata !304, metadata !DIExpression()), !dbg !307
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !308
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !308
  %2 = load i16, i16* %block_offset, align 2, !dbg !308, !tbaa !291
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !310
  %message_length = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !310
  %4 = load i16, i16* %message_length, align 2, !dbg !310, !tbaa !288
  %cmp = icmp uge i16 %2, %4, !dbg !311
  br i1 %cmp, label %if.then, label %if.end, !dbg !312

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !313
  br label %if.end, !dbg !315

if.end:                                           ; preds = %if.then, %entry
  %5 = bitcast i16* %zero to i8*, !dbg !316
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #5, !dbg !316
  call void @llvm.dbg.declare(metadata i16* %zero, metadata !305, metadata !DIExpression()), !dbg !317
  store i16 0, i16* %zero, align 2, !dbg !317, !tbaa !149
  store i16 0, i16* %i, align 2, !dbg !318, !tbaa !101
  br label %for.cond, !dbg !320

for.cond:                                         ; preds = %for.inc, %if.end
  %6 = load i16, i16* %i, align 2, !dbg !321, !tbaa !101
  %cmp2 = icmp ult i16 %6, 7, !dbg !323
  br i1 %cmp2, label %for.body, label %for.end, !dbg !324

for.body:                                         ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !325, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !325
  %block_offset4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !325
  %8 = load i16, i16* %block_offset4, align 2, !dbg !325, !tbaa !291
  %9 = load i16, i16* %i, align 2, !dbg !327, !tbaa !101
  %add = add i16 %8, %9, !dbg !328
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329, !tbaa !133
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !329
  %message_length6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !329
  %11 = load i16, i16* %message_length6, align 2, !dbg !329, !tbaa !288
  %cmp7 = icmp ult i16 %add, %11, !dbg !330
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !331

cond.true:                                        ; preds = %for.body
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332, !tbaa !133
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !332
  %block_offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 3, !dbg !332
  %13 = load i16, i16* %block_offset9, align 2, !dbg !332, !tbaa !291
  %14 = load i16, i16* %i, align 2, !dbg !333, !tbaa !101
  %add10 = add i16 %13, %14, !dbg !334
  %arrayidx = getelementptr inbounds [12 x i8], [12 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !335
  %15 = load i8, i8* %arrayidx, align 1, !dbg !335, !tbaa !106
  %conv = zext i8 %15 to i16, !dbg !335
  br label %cond.end, !dbg !331

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !331

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv, %cond.true ], [ 255, %cond.false ], !dbg !331
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336, !tbaa !133
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !336
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !336
  %17 = load i16, i16* %i, align 2, !dbg !337, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %17, !dbg !336
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !338, !tbaa !149
  br label %for.inc, !dbg !339

for.inc:                                          ; preds = %cond.end
  %18 = load i16, i16* %i, align 2, !dbg !340, !tbaa !101
  %inc = add nsw i16 %18, 1, !dbg !340
  store i16 %inc, i16* %i, align 2, !dbg !340, !tbaa !101
  br label %for.cond, !dbg !341, !llvm.loop !342

for.end:                                          ; preds = %for.cond
  store i16 7, i16* %i, align 2, !dbg !344, !tbaa !101
  br label %for.cond13, !dbg !346

for.cond13:                                       ; preds = %for.inc20, %for.end
  %19 = load i16, i16* %i, align 2, !dbg !347, !tbaa !101
  %cmp14 = icmp slt i16 %19, 8, !dbg !349
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !350

for.body16:                                       ; preds = %for.cond13
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !351, !tbaa !133
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !351
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !351
  %21 = load i16, i16* %i, align 2, !dbg !353, !tbaa !101
  %arrayidx19 = getelementptr inbounds [16 x i16], [16 x i16]* %base18, i16 0, i16 %21, !dbg !351
  store i16 1, i16* %arrayidx19, align 2, !dbg !354, !tbaa !149
  br label %for.inc20, !dbg !355

for.inc20:                                        ; preds = %for.body16
  %22 = load i16, i16* %i, align 2, !dbg !356, !tbaa !101
  %inc21 = add nsw i16 %22, 1, !dbg !356
  store i16 %inc21, i16* %i, align 2, !dbg !356, !tbaa !101
  br label %for.cond13, !dbg !357, !llvm.loop !358

for.end22:                                        ; preds = %for.cond13
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360, !tbaa !133
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !360
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 15, !dbg !360
  %24 = load i16, i16* %zero, align 2, !dbg !361, !tbaa !149
  %arrayidx24 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %24, !dbg !360
  store i16 1, i16* %arrayidx24, align 2, !dbg !362, !tbaa !149
  store i16 1, i16* %i, align 2, !dbg !363, !tbaa !101
  br label %for.cond25, !dbg !365

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %25 = load i16, i16* %i, align 2, !dbg !366, !tbaa !101
  %cmp26 = icmp slt i16 %25, 8, !dbg !368
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !369

for.body28:                                       ; preds = %for.cond25
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370, !tbaa !133
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !370
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !370
  %27 = load i16, i16* %i, align 2, !dbg !371, !tbaa !101
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %block30, i16 0, i16 %27, !dbg !370
  store i16 0, i16* %arrayidx31, align 2, !dbg !372, !tbaa !149
  br label %for.inc32, !dbg !370

for.inc32:                                        ; preds = %for.body28
  %28 = load i16, i16* %i, align 2, !dbg !373, !tbaa !101
  %inc33 = add nsw i16 %28, 1, !dbg !373
  store i16 %inc33, i16* %i, align 2, !dbg !373, !tbaa !101
  br label %for.cond25, !dbg !374, !llvm.loop !375

for.end34:                                        ; preds = %for.cond25
  %29 = load i16, i16* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 1), align 2, !dbg !377, !tbaa !378
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380, !tbaa !133
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !380
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !380
  store i16 %29, i16* %exponent, align 2, !dbg !381, !tbaa !382
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !383, !tbaa !133
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !383
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !383
  %32 = load i16, i16* %block_offset37, align 2, !dbg !384, !tbaa !291
  %add38 = add i16 %32, 7, !dbg !384
  store i16 %add38, i16* %block_offset37, align 2, !dbg !384, !tbaa !291
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385, !tbaa !133
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !385
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 17, !dbg !385
  store i16 2, i16* %check, align 2, !dbg !386, !tbaa !297
  %34 = bitcast i16* %zero to i8*, !dbg !387
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #5, !dbg !387
  %35 = bitcast i16* %i to i8*, !dbg !387
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #5, !dbg !387
  ret void, !dbg !387
}

; Function Attrs: nounwind
define dso_local void @task_exp() #0 !dbg !388 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !389
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !389
  %1 = load i16, i16* %exponent, align 2, !dbg !389, !tbaa !382
  %and = and i16 %1, 1, !dbg !391
  %tobool = icmp ne i16 %and, 0, !dbg !391
  br i1 %tobool, label %if.then, label %if.else, !dbg !392

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !393
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !393
  %3 = load i16, i16* %exponent2, align 2, !dbg !395, !tbaa !382
  %shr = lshr i16 %3, 1, !dbg !395
  store i16 %shr, i16* %exponent2, align 2, !dbg !395, !tbaa !382
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !396
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !396
  store i16 0, i16* %check, align 2, !dbg !397, !tbaa !297
  br label %if.end, !dbg !398

if.else:                                          ; preds = %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !399
  %exponent5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !399
  %6 = load i16, i16* %exponent5, align 2, !dbg !401, !tbaa !382
  %shr6 = lshr i16 %6, 1, !dbg !401
  store i16 %shr6, i16* %exponent5, align 2, !dbg !401, !tbaa !382
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !402, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !402
  %check8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 17, !dbg !402
  store i16 1, i16* %check8, align 2, !dbg !403, !tbaa !297
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !404
}

; Function Attrs: nounwind
define dso_local void @task_mult_block() #0 !dbg !405 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !406, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !406
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !406
  store i16 0, i16* %check_final, align 2, !dbg !407, !tbaa !300
  ret void, !dbg !408
}

; Function Attrs: nounwind
define dso_local void @task_mult_block_get_result() #0 !dbg !409 {
entry:
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !420
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !420
  call void @llvm.dbg.declare(metadata i16* %i, metadata !411, metadata !DIExpression()), !dbg !421
  store i16 7, i16* %i, align 2, !dbg !422, !tbaa !101
  br label %for.cond, !dbg !424

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !425, !tbaa !101
  %cmp = icmp sge i16 %1, 0, !dbg !427
  br i1 %cmp, label %for.body, label %for.end, !dbg !428

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !429
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !429
  %3 = load i16, i16* %i, align 2, !dbg !431, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !429
  %4 = load i16, i16* %arrayidx, align 2, !dbg !429, !tbaa !149
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !432, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !432
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !432
  %6 = load i16, i16* %i, align 2, !dbg !433, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %6, !dbg !432
  store i16 %4, i16* %arrayidx2, align 2, !dbg !434, !tbaa !149
  br label %for.inc, !dbg !435

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !436, !tbaa !101
  %dec = add nsw i16 %7, -1, !dbg !436
  store i16 %dec, i16* %i, align 2, !dbg !436, !tbaa !101
  br label %for.cond, !dbg !437, !llvm.loop !438

for.end:                                          ; preds = %for.cond
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !440
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !440
  %9 = load i16, i16* %exponent, align 2, !dbg !440, !tbaa !382
  %cmp4 = icmp ugt i16 %9, 0, !dbg !441
  br i1 %cmp4, label %if.then, label %if.else, !dbg !442

if.then:                                          ; preds = %for.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443, !tbaa !133
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !443
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 17, !dbg !443
  store i16 1, i16* %check, align 2, !dbg !445, !tbaa !297
  br label %if.end26, !dbg !446

if.else:                                          ; preds = %for.end
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !447, !tbaa !133
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !447
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !447
  %12 = load i16, i16* %cyphertext_len, align 2, !dbg !447, !tbaa !294
  %add = add i16 %12, 8, !dbg !448
  %cmp7 = icmp ule i16 %add, 16, !dbg !449
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !450

if.then8:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !451, !tbaa !101
  br label %for.cond9, !dbg !452

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %13 = load i16, i16* %i, align 2, !dbg !453, !tbaa !101
  %cmp10 = icmp slt i16 %13, 8, !dbg !454
  br i1 %cmp10, label %for.body11, label %for.end23, !dbg !455

for.body11:                                       ; preds = %for.cond9
  %14 = bitcast i16* %op to i8*, !dbg !456
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %14) #5, !dbg !456
  call void @llvm.dbg.declare(metadata i16* %op, metadata !412, metadata !DIExpression()), !dbg !457
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !458, !tbaa !133
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !458
  %cyphertext_len13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !458
  %16 = load i16, i16* %cyphertext_len13, align 2, !dbg !458, !tbaa !294
  store i16 %16, i16* %op, align 2, !dbg !457, !tbaa !101
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !459, !tbaa !133
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !459
  %product15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !459
  %18 = load i16, i16* %i, align 2, !dbg !460, !tbaa !101
  %arrayidx16 = getelementptr inbounds [16 x i16], [16 x i16]* %product15, i16 0, i16 %18, !dbg !459
  %19 = load i16, i16* %arrayidx16, align 2, !dbg !459, !tbaa !149
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !461, !tbaa !133
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !461
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 11, !dbg !461
  %21 = load i16, i16* %op, align 2, !dbg !462, !tbaa !101
  %arrayidx18 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %21, !dbg !461
  store i16 %19, i16* %arrayidx18, align 2, !dbg !463, !tbaa !149
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !464, !tbaa !133
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !464
  %cyphertext_len20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !464
  %23 = load i16, i16* %cyphertext_len20, align 2, !dbg !465, !tbaa !294
  %inc = add i16 %23, 1, !dbg !465
  store i16 %inc, i16* %cyphertext_len20, align 2, !dbg !465, !tbaa !294
  %24 = bitcast i16* %op to i8*, !dbg !466
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %24) #5, !dbg !466
  br label %for.inc21, !dbg !467

for.inc21:                                        ; preds = %for.body11
  %25 = load i16, i16* %i, align 2, !dbg !468, !tbaa !101
  %inc22 = add nsw i16 %25, 1, !dbg !468
  store i16 %inc22, i16* %i, align 2, !dbg !468, !tbaa !101
  br label %for.cond9, !dbg !469, !llvm.loop !470

for.end23:                                        ; preds = %for.cond9
  br label %if.end, !dbg !472

if.end:                                           ; preds = %for.end23, %if.else
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473, !tbaa !133
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !473
  %check25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !473
  store i16 0, i16* %check25, align 2, !dbg !474, !tbaa !297
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then
  %27 = bitcast i16* %i to i8*, !dbg !475
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #5, !dbg !475
  ret void, !dbg !475
}

; Function Attrs: nounwind
define dso_local void @task_square_base() #0 !dbg !476 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !477
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !477
  store i16 1, i16* %check_final, align 2, !dbg !478, !tbaa !300
  ret void, !dbg !479
}

; Function Attrs: nounwind
define dso_local void @task_square_base_get_result() #0 !dbg !480 {
entry:
  %i = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !483
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !483
  call void @llvm.dbg.declare(metadata i16* %i, metadata !482, metadata !DIExpression()), !dbg !484
  store i16 0, i16* %i, align 2, !dbg !485, !tbaa !101
  br label %for.cond, !dbg !487

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !488, !tbaa !101
  %cmp = icmp slt i16 %1, 8, !dbg !490
  br i1 %cmp, label %for.body, label %for.end, !dbg !491

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !492, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !492
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !492
  %3 = load i16, i16* %i, align 2, !dbg !494, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !492
  %4 = load i16, i16* %arrayidx, align 2, !dbg !492, !tbaa !149
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !495, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !495
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !495
  %6 = load i16, i16* %i, align 2, !dbg !496, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %6, !dbg !495
  store i16 %4, i16* %arrayidx2, align 2, !dbg !497, !tbaa !149
  br label %for.inc, !dbg !498

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !499, !tbaa !101
  %inc = add nsw i16 %7, 1, !dbg !499
  store i16 %inc, i16* %i, align 2, !dbg !499, !tbaa !101
  br label %for.cond, !dbg !500, !llvm.loop !501

for.end:                                          ; preds = %for.cond
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !503, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !503
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !503
  store i16 2, i16* %check, align 2, !dbg !504, !tbaa !297
  %9 = bitcast i16* %i to i8*, !dbg !505
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %9) #5, !dbg !505
  ret void, !dbg !505
}

; Function Attrs: nounwind
define dso_local void @task_mult_mod() #0 !dbg !506 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !507, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !507
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !507
  store i16 0, i16* %digit, align 2, !dbg !508, !tbaa !509
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !510, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !510
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !510
  store i16 0, i16* %carry, align 2, !dbg !511, !tbaa !512
  ret void, !dbg !513
}

; Function Attrs: nounwind
define dso_local void @task_mult() #0 !dbg !514 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !528
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !528
  call void @llvm.dbg.declare(metadata i16* %i, metadata !516, metadata !DIExpression()), !dbg !529
  %1 = bitcast i16* %a to i8*, !dbg !530
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !530
  call void @llvm.dbg.declare(metadata i16* %a, metadata !517, metadata !DIExpression()), !dbg !531
  %2 = bitcast i16* %b to i8*, !dbg !530
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !530
  call void @llvm.dbg.declare(metadata i16* %b, metadata !518, metadata !DIExpression()), !dbg !532
  %3 = bitcast i16* %c to i8*, !dbg !530
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !530
  call void @llvm.dbg.declare(metadata i16* %c, metadata !519, metadata !DIExpression()), !dbg !533
  %4 = bitcast i16* %dp to i8*, !dbg !534
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !534
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !520, metadata !DIExpression()), !dbg !535
  %5 = bitcast i16* %p to i8*, !dbg !534
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #5, !dbg !534
  call void @llvm.dbg.declare(metadata i16* %p, metadata !521, metadata !DIExpression()), !dbg !536
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !537, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !537
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !537
  %7 = load i16, i16* %carry, align 2, !dbg !537, !tbaa !512
  store i16 %7, i16* %p, align 2, !dbg !538, !tbaa !149
  store i16 0, i16* %c, align 2, !dbg !539, !tbaa !149
  store i16 0, i16* %i, align 2, !dbg !540, !tbaa !101
  br label %for.cond, !dbg !541

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i16, i16* %i, align 2, !dbg !542, !tbaa !101
  %cmp = icmp slt i16 %8, 8, !dbg !543
  br i1 %cmp, label %for.body, label %for.end, !dbg !544

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !545, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !545
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !545
  %10 = load i16, i16* %digit, align 2, !dbg !545, !tbaa !509
  %11 = load i16, i16* %i, align 2, !dbg !546, !tbaa !101
  %sub = sub i16 %10, %11, !dbg !547
  %cmp2 = icmp uge i16 %sub, 0, !dbg !548
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !549

land.lhs.true:                                    ; preds = %for.body
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !550, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !550
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !550
  %13 = load i16, i16* %digit4, align 2, !dbg !550, !tbaa !509
  %14 = load i16, i16* %i, align 2, !dbg !551, !tbaa !101
  %sub5 = sub i16 %13, %14, !dbg !552
  %cmp6 = icmp ult i16 %sub5, 8, !dbg !553
  br i1 %cmp6, label %if.then, label %if.end, !dbg !554

if.then:                                          ; preds = %land.lhs.true
  %15 = bitcast i16* %op to i8*, !dbg !555
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %15) #5, !dbg !555
  call void @llvm.dbg.declare(metadata i16* %op, metadata !522, metadata !DIExpression()), !dbg !556
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !557, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !557
  %digit8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !557
  %17 = load i16, i16* %digit8, align 2, !dbg !557, !tbaa !509
  %18 = load i16, i16* %i, align 2, !dbg !558, !tbaa !101
  %sub9 = sub i16 %17, %18, !dbg !559
  store i16 %sub9, i16* %op, align 2, !dbg !556, !tbaa !101
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !560, !tbaa !133
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !560
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !560
  %20 = load i16, i16* %op, align 2, !dbg !561, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %20, !dbg !560
  %21 = load i16, i16* %arrayidx, align 2, !dbg !560, !tbaa !149
  store i16 %21, i16* %a, align 2, !dbg !562, !tbaa !149
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563, !tbaa !133
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !563
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !563
  %23 = load i16, i16* %i, align 2, !dbg !564, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %23, !dbg !563
  %24 = load i16, i16* %arrayidx12, align 2, !dbg !563, !tbaa !149
  store i16 %24, i16* %b, align 2, !dbg !565, !tbaa !149
  %25 = load i16, i16* %a, align 2, !dbg !566, !tbaa !149
  %26 = load i16, i16* %b, align 2, !dbg !567, !tbaa !149
  %mul = mul i16 %25, %26, !dbg !568
  store i16 %mul, i16* %dp, align 2, !dbg !569, !tbaa !149
  %27 = load i16, i16* %dp, align 2, !dbg !570, !tbaa !149
  %shr = lshr i16 %27, 8, !dbg !571
  %28 = load i16, i16* %c, align 2, !dbg !572, !tbaa !149
  %add = add i16 %28, %shr, !dbg !572
  store i16 %add, i16* %c, align 2, !dbg !572, !tbaa !149
  %29 = load i16, i16* %dp, align 2, !dbg !573, !tbaa !149
  %and = and i16 %29, 255, !dbg !574
  %30 = load i16, i16* %p, align 2, !dbg !575, !tbaa !149
  %add13 = add i16 %30, %and, !dbg !575
  store i16 %add13, i16* %p, align 2, !dbg !575, !tbaa !149
  %31 = bitcast i16* %op to i8*, !dbg !576
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #5, !dbg !576
  br label %if.end, !dbg !577

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !578

for.inc:                                          ; preds = %if.end
  %32 = load i16, i16* %i, align 2, !dbg !579, !tbaa !101
  %inc = add nsw i16 %32, 1, !dbg !579
  store i16 %inc, i16* %i, align 2, !dbg !579, !tbaa !101
  br label %for.cond, !dbg !580, !llvm.loop !581

for.end:                                          ; preds = %for.cond
  %33 = load i16, i16* %p, align 2, !dbg !583, !tbaa !149
  %shr14 = lshr i16 %33, 8, !dbg !584
  %34 = load i16, i16* %c, align 2, !dbg !585, !tbaa !149
  %add15 = add i16 %34, %shr14, !dbg !585
  store i16 %add15, i16* %c, align 2, !dbg !585, !tbaa !149
  %35 = load i16, i16* %p, align 2, !dbg !586, !tbaa !149
  %and16 = and i16 %35, 255, !dbg !586
  store i16 %and16, i16* %p, align 2, !dbg !586, !tbaa !149
  %36 = load i16, i16* %p, align 2, !dbg !587, !tbaa !149
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !588, !tbaa !133
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !588
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !588
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !589, !tbaa !133
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !589
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !589
  %39 = load i16, i16* %digit19, align 2, !dbg !589, !tbaa !509
  %arrayidx20 = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %39, !dbg !588
  store i16 %36, i16* %arrayidx20, align 2, !dbg !590, !tbaa !149
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !591, !tbaa !133
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !591
  %digit22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !591
  %41 = load i16, i16* %digit22, align 2, !dbg !592, !tbaa !509
  %inc23 = add i16 %41, 1, !dbg !592
  store i16 %inc23, i16* %digit22, align 2, !dbg !592, !tbaa !509
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !593, !tbaa !133
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !593
  %digit25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !593
  %43 = load i16, i16* %digit25, align 2, !dbg !593, !tbaa !509
  %cmp26 = icmp ult i16 %43, 16, !dbg !595
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !596

if.then27:                                        ; preds = %for.end
  %44 = load i16, i16* %c, align 2, !dbg !597, !tbaa !149
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !599, !tbaa !133
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 1, !dbg !599
  %carry29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 9, !dbg !599
  store i16 %44, i16* %carry29, align 2, !dbg !600, !tbaa !512
  br label %if.end30, !dbg !601

if.end30:                                         ; preds = %if.then27, %for.end
  %46 = bitcast i16* %p to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %46) #5, !dbg !602
  %47 = bitcast i16* %dp to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %47) #5, !dbg !602
  %48 = bitcast i16* %c to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %48) #5, !dbg !602
  %49 = bitcast i16* %b to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %49) #5, !dbg !602
  %50 = bitcast i16* %a to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %50) #5, !dbg !602
  %51 = bitcast i16* %i to i8*, !dbg !602
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %51) #5, !dbg !602
  ret void, !dbg !602
}

; Function Attrs: nounwind
define dso_local void @task_reduce_digits() #0 !dbg !603 {
entry:
  %d = alloca i16, align 2
  %0 = bitcast i16* %d to i8*, !dbg !606
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !606
  call void @llvm.dbg.declare(metadata i16* %d, metadata !605, metadata !DIExpression()), !dbg !607
  store i16 16, i16* %d, align 2, !dbg !608, !tbaa !101
  br label %do.body, !dbg !609

do.body:                                          ; preds = %land.end, %entry
  %1 = load i16, i16* %d, align 2, !dbg !610, !tbaa !101
  %dec = add nsw i16 %1, -1, !dbg !610
  store i16 %dec, i16* %d, align 2, !dbg !610, !tbaa !101
  br label %do.cond, !dbg !612

do.cond:                                          ; preds = %do.body
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !613, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !613
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !613
  %3 = load i16, i16* %d, align 2, !dbg !614, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !613
  %4 = load i16, i16* %arrayidx, align 2, !dbg !613, !tbaa !149
  %cmp = icmp eq i16 %4, 0, !dbg !615
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !616

land.rhs:                                         ; preds = %do.cond
  %5 = load i16, i16* %d, align 2, !dbg !617, !tbaa !101
  %cmp1 = icmp sgt i16 %5, 0, !dbg !618
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %6 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ], !dbg !619
  br i1 %6, label %do.body, label %do.end, !dbg !612, !llvm.loop !620

do.end:                                           ; preds = %land.end
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !622, !tbaa !133
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !622
  %product3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !622
  %8 = load i16, i16* %d, align 2, !dbg !624, !tbaa !101
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product3, i16 0, i16 %8, !dbg !622
  %9 = load i16, i16* %arrayidx4, align 2, !dbg !622, !tbaa !149
  %cmp5 = icmp eq i16 %9, 0, !dbg !625
  br i1 %cmp5, label %if.then, label %if.end, !dbg !626

if.then:                                          ; preds = %do.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !627, !tbaa !133
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !627
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !627
  store i16 0, i16* %check, align 2, !dbg !629, !tbaa !297
  br label %if.end, !dbg !630

if.end:                                           ; preds = %if.then, %do.end
  %11 = load i16, i16* %d, align 2, !dbg !631, !tbaa !101
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !632, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !632
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !632
  store i16 %11, i16* %reduce, align 2, !dbg !633, !tbaa !634
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !635, !tbaa !133
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !635
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !635
  store i16 1, i16* %check9, align 2, !dbg !636, !tbaa !297
  %14 = bitcast i16* %d to i8*, !dbg !637
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %14) #5, !dbg !637
  ret void, !dbg !637
}

; Function Attrs: nounwind
define dso_local void @task_reduce_normalizable() #0 !dbg !638 {
entry:
  %i = alloca i16, align 2
  %normalizable = alloca i8, align 1
  %op = alloca i16, align 2
  %cleanup.dest.slot = alloca i32, align 2
  %0 = bitcast i16* %i to i8*, !dbg !647
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !647
  call void @llvm.dbg.declare(metadata i16* %i, metadata !640, metadata !DIExpression()), !dbg !648
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %normalizable) #5, !dbg !649
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !641, metadata !DIExpression()), !dbg !650
  store i8 1, i8* %normalizable, align 1, !dbg !650, !tbaa !651
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !653, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !653
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !653
  %2 = load i16, i16* %reduce, align 2, !dbg !653, !tbaa !634
  %add = add i16 %2, 1, !dbg !654
  %sub = sub i16 %add, 8, !dbg !655
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !656, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !656
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !656
  store i16 %sub, i16* %offset, align 2, !dbg !657, !tbaa !658
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !659, !tbaa !133
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !659
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !659
  %5 = load i16, i16* %reduce3, align 2, !dbg !659, !tbaa !634
  store i16 %5, i16* %i, align 2, !dbg !660, !tbaa !101
  br label %for.cond, !dbg !661

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i16, i16* %i, align 2, !dbg !662, !tbaa !101
  %cmp = icmp sge i16 %6, 0, !dbg !663
  br i1 %cmp, label %for.body, label %for.end, !dbg !664

for.body:                                         ; preds = %for.cond
  %7 = bitcast i16* %op to i8*, !dbg !665
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #5, !dbg !665
  call void @llvm.dbg.declare(metadata i16* %op, metadata !643, metadata !DIExpression()), !dbg !666
  %8 = load i16, i16* %i, align 2, !dbg !667, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !668
  %offset5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 12, !dbg !668
  %10 = load i16, i16* %offset5, align 2, !dbg !668, !tbaa !658
  %sub6 = sub i16 %8, %10, !dbg !669
  store i16 %sub6, i16* %op, align 2, !dbg !666, !tbaa !101
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !670, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !670
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !670
  %12 = load i16, i16* %i, align 2, !dbg !672, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %12, !dbg !670
  %13 = load i16, i16* %arrayidx, align 2, !dbg !670, !tbaa !149
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !673, !tbaa !133
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !673
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !673
  %15 = load i16, i16* %op, align 2, !dbg !674, !tbaa !101
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !673
  %16 = load i16, i16* %arrayidx9, align 2, !dbg !673, !tbaa !149
  %cmp10 = icmp ugt i16 %13, %16, !dbg !675
  br i1 %cmp10, label %if.then, label %if.else, !dbg !676

if.then:                                          ; preds = %for.body
  store i32 2, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !677

if.else:                                          ; preds = %for.body
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !679, !tbaa !133
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !679
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !679
  %18 = load i16, i16* %i, align 2, !dbg !681, !tbaa !101
  %arrayidx13 = getelementptr inbounds [16 x i16], [16 x i16]* %product12, i16 0, i16 %18, !dbg !679
  %19 = load i16, i16* %arrayidx13, align 2, !dbg !679, !tbaa !149
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !682, !tbaa !133
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !682
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !682
  %21 = load i16, i16* %op, align 2, !dbg !683, !tbaa !101
  %arrayidx16 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus15, i16 0, i16 %21, !dbg !682
  %22 = load i16, i16* %arrayidx16, align 2, !dbg !682, !tbaa !149
  %cmp17 = icmp ult i16 %19, %22, !dbg !684
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !685

if.then18:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !686, !tbaa !651
  store i32 2, i32* %cleanup.dest.slot, align 2
  br label %cleanup, !dbg !688

if.end:                                           ; preds = %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end
  store i32 0, i32* %cleanup.dest.slot, align 2, !dbg !689
  br label %cleanup, !dbg !689

cleanup:                                          ; preds = %if.end19, %if.then18, %if.then
  %23 = bitcast i16* %op to i8*, !dbg !689
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %23) #5, !dbg !689
  %cleanup.dest = load i32, i32* %cleanup.dest.slot, align 2
  switch i32 %cleanup.dest, label %unreachable [
    i32 0, label %cleanup.cont
    i32 2, label %for.end
  ]

cleanup.cont:                                     ; preds = %cleanup
  br label %for.inc, !dbg !690

for.inc:                                          ; preds = %cleanup.cont
  %24 = load i16, i16* %i, align 2, !dbg !691, !tbaa !101
  %dec = add nsw i16 %24, -1, !dbg !691
  store i16 %dec, i16* %i, align 2, !dbg !691, !tbaa !101
  br label %for.cond, !dbg !692, !llvm.loop !693

for.end:                                          ; preds = %cleanup, %for.cond
  %25 = load i8, i8* %normalizable, align 1, !dbg !695, !tbaa !651, !range !697
  %tobool = trunc i8 %25 to i1, !dbg !695
  br i1 %tobool, label %if.end25, label %land.lhs.true, !dbg !698

land.lhs.true:                                    ; preds = %for.end
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !699, !tbaa !133
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !699
  %reduce21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 10, !dbg !699
  %27 = load i16, i16* %reduce21, align 2, !dbg !699, !tbaa !634
  %cmp22 = icmp eq i16 %27, 7, !dbg !700
  br i1 %cmp22, label %if.then23, label %if.end25, !dbg !701

if.then23:                                        ; preds = %land.lhs.true
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !702, !tbaa !133
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !702
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !702
  store i16 0, i16* %check, align 2, !dbg !704, !tbaa !297
  br label %if.end25, !dbg !705

if.end25:                                         ; preds = %if.then23, %land.lhs.true, %for.end
  %29 = load i8, i8* %normalizable, align 1, !dbg !706, !tbaa !651, !range !697
  %tobool26 = trunc i8 %29 to i1, !dbg !706
  br i1 %tobool26, label %if.then27, label %if.else30, !dbg !708

if.then27:                                        ; preds = %if.end25
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !709, !tbaa !133
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !709
  %check29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 17, !dbg !709
  store i16 1, i16* %check29, align 2, !dbg !711, !tbaa !297
  br label %if.end33, !dbg !712

if.else30:                                        ; preds = %if.end25
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !713, !tbaa !133
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !713
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !713
  store i16 2, i16* %check32, align 2, !dbg !715, !tbaa !297
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then27
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %normalizable) #5, !dbg !716
  %32 = bitcast i16* %i to i8*, !dbg !716
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #5, !dbg !716
  ret void, !dbg !716

unreachable:                                      ; preds = %cleanup
  unreachable
}

; Function Attrs: nounwind
define dso_local void @task_reduce_normalize() #0 !dbg !717 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %m to i8*, !dbg !729
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !729
  call void @llvm.dbg.declare(metadata i16* %m, metadata !719, metadata !DIExpression()), !dbg !730
  %1 = bitcast i16* %n to i8*, !dbg !729
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !729
  call void @llvm.dbg.declare(metadata i16* %n, metadata !720, metadata !DIExpression()), !dbg !731
  %2 = bitcast i16* %d to i8*, !dbg !729
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !729
  call void @llvm.dbg.declare(metadata i16* %d, metadata !721, metadata !DIExpression()), !dbg !732
  %3 = bitcast i16* %s to i8*, !dbg !729
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !729
  call void @llvm.dbg.declare(metadata i16* %s, metadata !722, metadata !DIExpression()), !dbg !733
  %4 = bitcast i16* %borrow to i8*, !dbg !734
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !734
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !723, metadata !DIExpression()), !dbg !735
  %5 = bitcast i16* %i to i8*, !dbg !736
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #5, !dbg !736
  call void @llvm.dbg.declare(metadata i16* %i, metadata !724, metadata !DIExpression()), !dbg !737
  store i16 0, i16* %borrow, align 2, !dbg !738, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !739, !tbaa !101
  br label %for.cond, !dbg !740

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i16, i16* %i, align 2, !dbg !741, !tbaa !101
  %cmp = icmp slt i16 %6, 8, !dbg !742
  br i1 %cmp, label %for.body, label %for.end, !dbg !743

for.body:                                         ; preds = %for.cond
  %7 = bitcast i16* %op to i8*, !dbg !744
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %7) #5, !dbg !744
  call void @llvm.dbg.declare(metadata i16* %op, metadata !725, metadata !DIExpression()), !dbg !745
  %8 = load i16, i16* %i, align 2, !dbg !746, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !747, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !747
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !747
  %10 = load i16, i16* %offset, align 2, !dbg !747, !tbaa !658
  %add = add i16 %8, %10, !dbg !748
  store i16 %add, i16* %op, align 2, !dbg !745, !tbaa !101
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !749, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !749
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !749
  %12 = load i16, i16* %op, align 2, !dbg !750, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %12, !dbg !749
  %13 = load i16, i16* %arrayidx, align 2, !dbg !749, !tbaa !149
  store i16 %13, i16* %m, align 2, !dbg !751, !tbaa !149
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !752, !tbaa !133
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !752
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !752
  %15 = load i16, i16* %i, align 2, !dbg !753, !tbaa !101
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !752
  %16 = load i16, i16* %arrayidx3, align 2, !dbg !752, !tbaa !149
  store i16 %16, i16* %n, align 2, !dbg !754, !tbaa !149
  %17 = load i16, i16* %n, align 2, !dbg !755, !tbaa !149
  %18 = load i16, i16* %borrow, align 2, !dbg !756, !tbaa !101
  %add4 = add i16 %17, %18, !dbg !757
  store i16 %add4, i16* %s, align 2, !dbg !758, !tbaa !149
  %19 = load i16, i16* %m, align 2, !dbg !759, !tbaa !149
  %20 = load i16, i16* %s, align 2, !dbg !761, !tbaa !149
  %cmp5 = icmp ult i16 %19, %20, !dbg !762
  br i1 %cmp5, label %if.then, label %if.else, !dbg !763

if.then:                                          ; preds = %for.body
  %21 = load i16, i16* %m, align 2, !dbg !764, !tbaa !149
  %add6 = add i16 %21, 256, !dbg !764
  store i16 %add6, i16* %m, align 2, !dbg !764, !tbaa !149
  store i16 1, i16* %borrow, align 2, !dbg !766, !tbaa !101
  br label %if.end, !dbg !767

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !768, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %22 = load i16, i16* %m, align 2, !dbg !770, !tbaa !149
  %23 = load i16, i16* %s, align 2, !dbg !771, !tbaa !149
  %sub = sub i16 %22, %23, !dbg !772
  store i16 %sub, i16* %d, align 2, !dbg !773, !tbaa !149
  %24 = load i16, i16* %d, align 2, !dbg !774, !tbaa !149
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !775, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !775
  %product8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !775
  %26 = load i16, i16* %op, align 2, !dbg !776, !tbaa !101
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product8, i16 0, i16 %26, !dbg !775
  store i16 %24, i16* %arrayidx9, align 2, !dbg !777, !tbaa !149
  %27 = bitcast i16* %op to i8*, !dbg !778
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #5, !dbg !778
  br label %for.inc, !dbg !779

for.inc:                                          ; preds = %if.end
  %28 = load i16, i16* %i, align 2, !dbg !780, !tbaa !101
  %inc = add nsw i16 %28, 1, !dbg !780
  store i16 %inc, i16* %i, align 2, !dbg !780, !tbaa !101
  br label %for.cond, !dbg !781, !llvm.loop !782

for.end:                                          ; preds = %for.cond
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !784, !tbaa !133
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !784
  %offset11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !784
  %30 = load i16, i16* %offset11, align 2, !dbg !784, !tbaa !658
  %cmp12 = icmp ugt i16 %30, 0, !dbg !786
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !787

if.then13:                                        ; preds = %for.end
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !788, !tbaa !133
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !788
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 17, !dbg !788
  store i16 2, i16* %check, align 2, !dbg !790, !tbaa !297
  br label %if.end18, !dbg !791

if.else15:                                        ; preds = %for.end
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !792, !tbaa !133
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !792
  %check17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !792
  store i16 0, i16* %check17, align 2, !dbg !794, !tbaa !297
  br label %if.end18

if.end18:                                         ; preds = %if.else15, %if.then13
  %33 = bitcast i16* %i to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #5, !dbg !795
  %34 = bitcast i16* %borrow to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #5, !dbg !795
  %35 = bitcast i16* %s to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #5, !dbg !795
  %36 = bitcast i16* %d to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #5, !dbg !795
  %37 = bitcast i16* %n to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #5, !dbg !795
  %38 = bitcast i16* %m to i8*, !dbg !795
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %38) #5, !dbg !795
  ret void, !dbg !795
}

; Function Attrs: nounwind
define dso_local void @task_reduce_n_divisor() #0 !dbg !796 {
entry:
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %0 = bitcast i16* %op1 to i8*, !dbg !800
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !800
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !798, metadata !DIExpression()), !dbg !801
  store i16 7, i16* %op1, align 2, !dbg !801, !tbaa !101
  %1 = bitcast i16* %op2 to i8*, !dbg !802
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !802
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !799, metadata !DIExpression()), !dbg !803
  store i16 6, i16* %op2, align 2, !dbg !803, !tbaa !101
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !804, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !804
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !804
  %3 = load i16, i16* %op1, align 2, !dbg !805, !tbaa !101
  %arrayidx = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %3, !dbg !804
  %4 = load i16, i16* %arrayidx, align 2, !dbg !804, !tbaa !149
  %shl = shl i16 %4, 8, !dbg !806
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !807, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !807
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !807
  %6 = load i16, i16* %op2, align 2, !dbg !808, !tbaa !101
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus2, i16 0, i16 %6, !dbg !807
  %7 = load i16, i16* %arrayidx3, align 2, !dbg !807, !tbaa !149
  %add = add i16 %shl, %7, !dbg !809
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !810, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !810
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !810
  store i16 %add, i16* %n_div, align 2, !dbg !811, !tbaa !812
  %9 = bitcast i16* %op2 to i8*, !dbg !813
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %9) #5, !dbg !813
  %10 = bitcast i16* %op1 to i8*, !dbg !813
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %10) #5, !dbg !813
  ret void, !dbg !813
}

; Function Attrs: nounwind
define dso_local void @task_reduce_quotient() #0 !dbg !814 {
entry:
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %op3 = alloca i16, align 2
  %0 = bitcast i32* %qn to i8*, !dbg !821
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5, !dbg !821
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !816, metadata !DIExpression()), !dbg !822
  %1 = bitcast i32* %n_q to i8*, !dbg !821
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5, !dbg !821
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !817, metadata !DIExpression()), !dbg !823
  %2 = bitcast i16* %op1 to i8*, !dbg !824
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !824
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !818, metadata !DIExpression()), !dbg !825
  store i16 7, i16* %op1, align 2, !dbg !825, !tbaa !101
  %3 = bitcast i16* %op2 to i8*, !dbg !826
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !826
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !819, metadata !DIExpression()), !dbg !827
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !828, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !828
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !828
  %5 = load i16, i16* %reduce, align 2, !dbg !828, !tbaa !634
  %sub = sub i16 %5, 1, !dbg !829
  store i16 %sub, i16* %op2, align 2, !dbg !827, !tbaa !101
  %6 = bitcast i16* %op3 to i8*, !dbg !830
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %6) #5, !dbg !830
  call void @llvm.dbg.declare(metadata i16* %op3, metadata !820, metadata !DIExpression()), !dbg !831
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !832, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !832
  %reduce2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !832
  %8 = load i16, i16* %reduce2, align 2, !dbg !832, !tbaa !634
  %sub3 = sub i16 %8, 2, !dbg !833
  store i16 %sub3, i16* %op3, align 2, !dbg !831, !tbaa !101
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !834, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !834
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !834
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !836, !tbaa !133
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !836
  %reduce6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !836
  %11 = load i16, i16* %reduce6, align 2, !dbg !836, !tbaa !634
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %11, !dbg !834
  %12 = load i16, i16* %arrayidx, align 2, !dbg !834, !tbaa !149
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !837, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !837
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !837
  %14 = load i16, i16* %op1, align 2, !dbg !838, !tbaa !101
  %arrayidx8 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %14, !dbg !837
  %15 = load i16, i16* %arrayidx8, align 2, !dbg !837, !tbaa !149
  %cmp = icmp eq i16 %12, %15, !dbg !839
  br i1 %cmp, label %if.then, label %if.else, !dbg !840

if.then:                                          ; preds = %entry
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !841, !tbaa !133
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !841
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !841
  store i16 255, i16* %quotient, align 2, !dbg !843, !tbaa !844
  br label %if.end, !dbg !845

if.else:                                          ; preds = %entry
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !846, !tbaa !133
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !846
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !846
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !848, !tbaa !133
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !848
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !848
  %19 = load i16, i16* %reduce13, align 2, !dbg !848, !tbaa !634
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %19, !dbg !846
  %20 = load i16, i16* %arrayidx14, align 2, !dbg !846, !tbaa !149
  %shl = shl i16 %20, 8, !dbg !849
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !850, !tbaa !133
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !850
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !850
  %22 = load i16, i16* %op2, align 2, !dbg !851, !tbaa !101
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %22, !dbg !850
  %23 = load i16, i16* %arrayidx17, align 2, !dbg !850, !tbaa !149
  %add = add i16 %shl, %23, !dbg !852
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !853, !tbaa !133
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !853
  %modulus19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 7, !dbg !853
  %25 = load i16, i16* %op1, align 2, !dbg !854, !tbaa !101
  %arrayidx20 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus19, i16 0, i16 %25, !dbg !853
  %26 = load i16, i16* %arrayidx20, align 2, !dbg !853, !tbaa !149
  %div = udiv i16 %add, %26, !dbg !855
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !856, !tbaa !133
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !856
  %quotient22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 16, !dbg !856
  store i16 %div, i16* %quotient22, align 2, !dbg !857, !tbaa !844
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !858, !tbaa !133
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !858
  %product24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 0, !dbg !858
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !859, !tbaa !133
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !859
  %reduce26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 10, !dbg !859
  %30 = load i16, i16* %reduce26, align 2, !dbg !859, !tbaa !634
  %arrayidx27 = getelementptr inbounds [16 x i16], [16 x i16]* %product24, i16 0, i16 %30, !dbg !858
  %31 = load i16, i16* %arrayidx27, align 2, !dbg !858, !tbaa !149
  %conv = zext i16 %31 to i32, !dbg !860
  %shl28 = shl i32 %conv, 16, !dbg !861
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !862, !tbaa !133
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !862
  %product30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !862
  %33 = load i16, i16* %op2, align 2, !dbg !863, !tbaa !101
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %product30, i16 0, i16 %33, !dbg !862
  %34 = load i16, i16* %arrayidx31, align 2, !dbg !862, !tbaa !149
  %shl32 = shl i16 %34, 8, !dbg !864
  %conv33 = zext i16 %shl32 to i32, !dbg !865
  %add34 = add i32 %shl28, %conv33, !dbg !866
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !867, !tbaa !133
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !867
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !867
  %36 = load i16, i16* %op3, align 2, !dbg !868, !tbaa !101
  %arrayidx37 = getelementptr inbounds [16 x i16], [16 x i16]* %product36, i16 0, i16 %36, !dbg !867
  %37 = load i16, i16* %arrayidx37, align 2, !dbg !867, !tbaa !149
  %conv38 = zext i16 %37 to i32, !dbg !867
  %add39 = add i32 %add34, %conv38, !dbg !869
  store i32 %add39, i32* %n_q, align 2, !dbg !870, !tbaa !871
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !873, !tbaa !133
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !873
  %quotient41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 16, !dbg !873
  %39 = load i16, i16* %quotient41, align 2, !dbg !874, !tbaa !844
  %inc = add i16 %39, 1, !dbg !874
  store i16 %inc, i16* %quotient41, align 2, !dbg !874, !tbaa !844
  br label %do.body, !dbg !875

do.body:                                          ; preds = %do.cond, %if.end
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !876, !tbaa !133
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !876
  %quotient43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 16, !dbg !876
  %41 = load i16, i16* %quotient43, align 2, !dbg !878, !tbaa !844
  %dec = add i16 %41, -1, !dbg !878
  store i16 %dec, i16* %quotient43, align 2, !dbg !878, !tbaa !844
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !879, !tbaa !133
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !879
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 13, !dbg !879
  %43 = load i16, i16* %n_div, align 2, !dbg !879, !tbaa !812
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !880, !tbaa !133
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !880
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !880
  %45 = load i16, i16* %quotient46, align 2, !dbg !880, !tbaa !844
  %mul = mul i16 %43, %45, !dbg !881
  %conv47 = zext i16 %mul to i32, !dbg !879
  store i32 %conv47, i32* %qn, align 2, !dbg !882, !tbaa !871
  br label %do.cond, !dbg !883

do.cond:                                          ; preds = %do.body
  %46 = load i32, i32* %qn, align 2, !dbg !884, !tbaa !871
  %47 = load i32, i32* %n_q, align 2, !dbg !885, !tbaa !871
  %cmp48 = icmp ugt i32 %46, %47, !dbg !886
  br i1 %cmp48, label %do.body, label %do.end, !dbg !883, !llvm.loop !887

do.end:                                           ; preds = %do.cond
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !889, !tbaa !133
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !889
  %reduce51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 10, !dbg !889
  %49 = load i16, i16* %reduce51, align 2, !dbg !890, !tbaa !634
  %dec52 = add i16 %49, -1, !dbg !890
  store i16 %dec52, i16* %reduce51, align 2, !dbg !890, !tbaa !634
  %50 = bitcast i16* %op3 to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %50) #5, !dbg !891
  %51 = bitcast i16* %op2 to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %51) #5, !dbg !891
  %52 = bitcast i16* %op1 to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %52) #5, !dbg !891
  %53 = bitcast i32* %n_q to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %53) #5, !dbg !891
  %54 = bitcast i32* %qn to i8*, !dbg !891
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %54) #5, !dbg !891
  ret void, !dbg !891
}

; Function Attrs: nounwind
define dso_local void @task_reduce_multiply() #0 !dbg !892 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %op = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !905
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !905
  call void @llvm.dbg.declare(metadata i16* %i, metadata !894, metadata !DIExpression()), !dbg !906
  %1 = bitcast i16* %m to i8*, !dbg !907
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !907
  call void @llvm.dbg.declare(metadata i16* %m, metadata !895, metadata !DIExpression()), !dbg !908
  %2 = bitcast i16* %n to i8*, !dbg !907
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !907
  call void @llvm.dbg.declare(metadata i16* %n, metadata !896, metadata !DIExpression()), !dbg !909
  %3 = bitcast i16* %c to i8*, !dbg !910
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !910
  call void @llvm.dbg.declare(metadata i16* %c, metadata !897, metadata !DIExpression()), !dbg !911
  %4 = bitcast i16* %offset to i8*, !dbg !910
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !910
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !898, metadata !DIExpression()), !dbg !912
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !913, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !913
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !913
  %6 = load i16, i16* %reduce, align 2, !dbg !913, !tbaa !634
  %add = add i16 %6, 1, !dbg !914
  %sub = sub i16 %add, 8, !dbg !915
  store i16 %sub, i16* %offset, align 2, !dbg !916, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !917, !tbaa !101
  br label %for.cond, !dbg !919

for.cond:                                         ; preds = %for.inc, %entry
  %7 = load i16, i16* %i, align 2, !dbg !920, !tbaa !101
  %8 = load i16, i16* %offset, align 2, !dbg !922, !tbaa !101
  %cmp = icmp ult i16 %7, %8, !dbg !923
  br i1 %cmp, label %for.body, label %for.end, !dbg !924

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !925, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !925
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !925
  %10 = load i16, i16* %i, align 2, !dbg !927, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %10, !dbg !925
  store i16 0, i16* %arrayidx, align 2, !dbg !928, !tbaa !149
  br label %for.inc, !dbg !929

for.inc:                                          ; preds = %for.body
  %11 = load i16, i16* %i, align 2, !dbg !930, !tbaa !101
  %inc = add nsw i16 %11, 1, !dbg !930
  store i16 %inc, i16* %i, align 2, !dbg !930, !tbaa !101
  br label %for.cond, !dbg !931, !llvm.loop !932

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !934, !tbaa !101
  %12 = load i16, i16* %offset, align 2, !dbg !935, !tbaa !101
  store i16 %12, i16* %i, align 2, !dbg !936, !tbaa !101
  br label %for.cond2, !dbg !937

for.cond2:                                        ; preds = %for.inc15, %for.end
  %13 = load i16, i16* %i, align 2, !dbg !938, !tbaa !101
  %cmp3 = icmp slt i16 %13, 16, !dbg !939
  br i1 %cmp3, label %for.body4, label %for.end17, !dbg !940

for.body4:                                        ; preds = %for.cond2
  %14 = load i16, i16* %c, align 2, !dbg !941, !tbaa !101
  store i16 %14, i16* %m, align 2, !dbg !942, !tbaa !149
  %15 = load i16, i16* %i, align 2, !dbg !943, !tbaa !101
  %16 = load i16, i16* %offset, align 2, !dbg !944, !tbaa !101
  %add5 = add i16 %16, 8, !dbg !945
  %cmp6 = icmp ult i16 %15, %add5, !dbg !946
  br i1 %cmp6, label %if.then, label %if.else, !dbg !947

if.then:                                          ; preds = %for.body4
  %17 = bitcast i16* %op to i8*, !dbg !948
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %17) #5, !dbg !948
  call void @llvm.dbg.declare(metadata i16* %op, metadata !899, metadata !DIExpression()), !dbg !949
  %18 = load i16, i16* %i, align 2, !dbg !950, !tbaa !101
  %19 = load i16, i16* %offset, align 2, !dbg !951, !tbaa !101
  %sub7 = sub i16 %18, %19, !dbg !952
  store i16 %sub7, i16* %op, align 2, !dbg !949, !tbaa !101
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !953, !tbaa !133
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !953
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !953
  %21 = load i16, i16* %op, align 2, !dbg !954, !tbaa !101
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %21, !dbg !953
  %22 = load i16, i16* %arrayidx9, align 2, !dbg !953, !tbaa !149
  store i16 %22, i16* %n, align 2, !dbg !955, !tbaa !149
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !956, !tbaa !133
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !956
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !956
  %24 = load i16, i16* %quotient, align 2, !dbg !956, !tbaa !844
  %25 = load i16, i16* %n, align 2, !dbg !957, !tbaa !149
  %mul = mul i16 %24, %25, !dbg !958
  %26 = load i16, i16* %m, align 2, !dbg !959, !tbaa !149
  %add11 = add i16 %26, %mul, !dbg !959
  store i16 %add11, i16* %m, align 2, !dbg !959, !tbaa !149
  %27 = bitcast i16* %op to i8*, !dbg !960
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #5, !dbg !960
  br label %if.end, !dbg !961

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !962, !tbaa !149
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %28 = load i16, i16* %m, align 2, !dbg !964, !tbaa !149
  %shr = lshr i16 %28, 8, !dbg !965
  store i16 %shr, i16* %c, align 2, !dbg !966, !tbaa !101
  %29 = load i16, i16* %m, align 2, !dbg !967, !tbaa !149
  %and = and i16 %29, 255, !dbg !967
  store i16 %and, i16* %m, align 2, !dbg !967, !tbaa !149
  %30 = load i16, i16* %m, align 2, !dbg !968, !tbaa !149
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !969, !tbaa !133
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !969
  %product213 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 14, !dbg !969
  %32 = load i16, i16* %i, align 2, !dbg !970, !tbaa !101
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product213, i16 0, i16 %32, !dbg !969
  store i16 %30, i16* %arrayidx14, align 2, !dbg !971, !tbaa !149
  br label %for.inc15, !dbg !972

for.inc15:                                        ; preds = %if.end
  %33 = load i16, i16* %i, align 2, !dbg !973, !tbaa !101
  %inc16 = add nsw i16 %33, 1, !dbg !973
  store i16 %inc16, i16* %i, align 2, !dbg !973, !tbaa !101
  br label %for.cond2, !dbg !974, !llvm.loop !975

for.end17:                                        ; preds = %for.cond2
  %34 = bitcast i16* %offset to i8*, !dbg !977
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #5, !dbg !977
  %35 = bitcast i16* %c to i8*, !dbg !977
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #5, !dbg !977
  %36 = bitcast i16* %n to i8*, !dbg !977
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #5, !dbg !977
  %37 = bitcast i16* %m to i8*, !dbg !977
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #5, !dbg !977
  %38 = bitcast i16* %i to i8*, !dbg !977
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %38) #5, !dbg !977
  ret void, !dbg !977
}

; Function Attrs: nounwind
define dso_local void @task_reduce_compare() #0 !dbg !978 {
entry:
  %i = alloca i16, align 2
  %relation = alloca i8, align 1
  %0 = bitcast i16* %i to i8*, !dbg !983
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !983
  call void @llvm.dbg.declare(metadata i16* %i, metadata !980, metadata !DIExpression()), !dbg !984
  call void @llvm.lifetime.start.p0i8(i64 1, i8* %relation) #5, !dbg !985
  call void @llvm.dbg.declare(metadata i8* %relation, metadata !981, metadata !DIExpression()), !dbg !986
  store i8 61, i8* %relation, align 1, !dbg !986, !tbaa !106
  store i16 15, i16* %i, align 2, !dbg !987, !tbaa !101
  br label %for.cond, !dbg !989

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !990, !tbaa !101
  %cmp = icmp sge i16 %1, 0, !dbg !992
  br i1 %cmp, label %for.body, label %for.end, !dbg !993

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !994, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !994
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !994
  %3 = load i16, i16* %i, align 2, !dbg !997, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %3, !dbg !994
  %4 = load i16, i16* %arrayidx, align 2, !dbg !994, !tbaa !149
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !998, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !998
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !998
  %6 = load i16, i16* %i, align 2, !dbg !999, !tbaa !101
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %6, !dbg !998
  %7 = load i16, i16* %arrayidx2, align 2, !dbg !998, !tbaa !149
  %cmp3 = icmp ugt i16 %4, %7, !dbg !1000
  br i1 %cmp3, label %if.then, label %if.else, !dbg !1001

if.then:                                          ; preds = %for.body
  store i8 62, i8* %relation, align 1, !dbg !1002, !tbaa !106
  br label %for.end, !dbg !1004

if.else:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1005, !tbaa !133
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !1005
  %product5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !1005
  %9 = load i16, i16* %i, align 2, !dbg !1007, !tbaa !101
  %arrayidx6 = getelementptr inbounds [16 x i16], [16 x i16]* %product5, i16 0, i16 %9, !dbg !1005
  %10 = load i16, i16* %arrayidx6, align 2, !dbg !1005, !tbaa !149
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1008, !tbaa !133
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !1008
  %product28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !1008
  %12 = load i16, i16* %i, align 2, !dbg !1009, !tbaa !101
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product28, i16 0, i16 %12, !dbg !1008
  %13 = load i16, i16* %arrayidx9, align 2, !dbg !1008, !tbaa !149
  %cmp10 = icmp ult i16 %10, %13, !dbg !1010
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !1011

if.then11:                                        ; preds = %if.else
  store i8 60, i8* %relation, align 1, !dbg !1012, !tbaa !106
  br label %for.end, !dbg !1014

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc, !dbg !1015

for.inc:                                          ; preds = %if.end12
  %14 = load i16, i16* %i, align 2, !dbg !1016, !tbaa !101
  %dec = add nsw i16 %14, -1, !dbg !1016
  store i16 %dec, i16* %i, align 2, !dbg !1016, !tbaa !101
  br label %for.cond, !dbg !1017, !llvm.loop !1018

for.end:                                          ; preds = %if.then11, %if.then, %for.cond
  %15 = load i8, i8* %relation, align 1, !dbg !1020, !tbaa !106
  %conv = sext i8 %15 to i16, !dbg !1020
  %cmp13 = icmp eq i16 %conv, 60, !dbg !1022
  br i1 %cmp13, label %if.then15, label %if.end17, !dbg !1023

if.then15:                                        ; preds = %for.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1024, !tbaa !133
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !1024
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !1024
  store i16 0, i16* %check, align 2, !dbg !1026, !tbaa !297
  br label %if.end17, !dbg !1027

if.end17:                                         ; preds = %if.then15, %for.end
  call void @llvm.lifetime.end.p0i8(i64 1, i8* %relation) #5, !dbg !1028
  %17 = bitcast i16* %i to i8*, !dbg !1028
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %17) #5, !dbg !1028
  ret void, !dbg !1028
}

; Function Attrs: nounwind
define dso_local void @task_reduce_add() #0 !dbg !1029 {
entry:
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !1037
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !1037
  call void @llvm.dbg.declare(metadata i16* %i, metadata !1031, metadata !DIExpression()), !dbg !1038
  %1 = bitcast i16* %j to i8*, !dbg !1037
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !1037
  call void @llvm.dbg.declare(metadata i16* %j, metadata !1032, metadata !DIExpression()), !dbg !1039
  %2 = bitcast i16* %m to i8*, !dbg !1040
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !1040
  call void @llvm.dbg.declare(metadata i16* %m, metadata !1033, metadata !DIExpression()), !dbg !1041
  %3 = bitcast i16* %n to i8*, !dbg !1040
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !1040
  call void @llvm.dbg.declare(metadata i16* %n, metadata !1034, metadata !DIExpression()), !dbg !1042
  %4 = bitcast i16* %c to i8*, !dbg !1040
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !1040
  call void @llvm.dbg.declare(metadata i16* %c, metadata !1035, metadata !DIExpression()), !dbg !1043
  %5 = bitcast i16* %offset to i8*, !dbg !1044
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #5, !dbg !1044
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !1036, metadata !DIExpression()), !dbg !1045
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1046, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1046
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !1046
  %7 = load i16, i16* %reduce, align 2, !dbg !1046, !tbaa !634
  %add = add i16 %7, 1, !dbg !1047
  %sub = sub i16 %add, 8, !dbg !1048
  store i16 %sub, i16* %offset, align 2, !dbg !1049, !tbaa !101
  store i16 0, i16* %c, align 2, !dbg !1050, !tbaa !149
  %8 = load i16, i16* %offset, align 2, !dbg !1051, !tbaa !101
  store i16 %8, i16* %i, align 2, !dbg !1053, !tbaa !101
  br label %for.cond, !dbg !1054

for.cond:                                         ; preds = %for.inc, %entry
  %9 = load i16, i16* %i, align 2, !dbg !1055, !tbaa !101
  %cmp = icmp slt i16 %9, 16, !dbg !1057
  br i1 %cmp, label %for.body, label %for.end, !dbg !1058

for.body:                                         ; preds = %for.cond
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1059, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !1059
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !1059
  %11 = load i16, i16* %i, align 2, !dbg !1061, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %11, !dbg !1059
  %12 = load i16, i16* %arrayidx, align 2, !dbg !1059, !tbaa !149
  store i16 %12, i16* %m, align 2, !dbg !1062, !tbaa !149
  %13 = load i16, i16* %i, align 2, !dbg !1063, !tbaa !101
  %14 = load i16, i16* %offset, align 2, !dbg !1064, !tbaa !101
  %sub2 = sub i16 %13, %14, !dbg !1065
  store i16 %sub2, i16* %j, align 2, !dbg !1066, !tbaa !101
  %15 = load i16, i16* %i, align 2, !dbg !1067, !tbaa !101
  %16 = load i16, i16* %offset, align 2, !dbg !1069, !tbaa !101
  %add3 = add i16 %16, 8, !dbg !1070
  %cmp4 = icmp ult i16 %15, %add3, !dbg !1071
  br i1 %cmp4, label %if.then, label %if.else, !dbg !1072

if.then:                                          ; preds = %for.body
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1073, !tbaa !133
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !1073
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !1073
  %18 = load i16, i16* %j, align 2, !dbg !1075, !tbaa !101
  %arrayidx6 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %18, !dbg !1073
  %19 = load i16, i16* %arrayidx6, align 2, !dbg !1073, !tbaa !149
  store i16 %19, i16* %n, align 2, !dbg !1076, !tbaa !149
  br label %if.end, !dbg !1077

if.else:                                          ; preds = %for.body
  store i16 0, i16* %n, align 2, !dbg !1078, !tbaa !149
  store i16 0, i16* %j, align 2, !dbg !1080, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %20 = load i16, i16* %c, align 2, !dbg !1081, !tbaa !149
  %21 = load i16, i16* %m, align 2, !dbg !1082, !tbaa !149
  %add7 = add i16 %20, %21, !dbg !1083
  %22 = load i16, i16* %n, align 2, !dbg !1084, !tbaa !149
  %add8 = add i16 %add7, %22, !dbg !1085
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1086, !tbaa !133
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !1086
  %product10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !1086
  %24 = load i16, i16* %i, align 2, !dbg !1087, !tbaa !101
  %arrayidx11 = getelementptr inbounds [16 x i16], [16 x i16]* %product10, i16 0, i16 %24, !dbg !1086
  store i16 %add8, i16* %arrayidx11, align 2, !dbg !1088, !tbaa !149
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1089, !tbaa !133
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !1089
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !1089
  %26 = load i16, i16* %i, align 2, !dbg !1090, !tbaa !101
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product13, i16 0, i16 %26, !dbg !1089
  %27 = load i16, i16* %arrayidx14, align 2, !dbg !1089, !tbaa !149
  %shr = lshr i16 %27, 8, !dbg !1091
  store i16 %shr, i16* %c, align 2, !dbg !1092, !tbaa !149
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1093, !tbaa !133
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !1093
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !1093
  %29 = load i16, i16* %i, align 2, !dbg !1094, !tbaa !101
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %29, !dbg !1093
  %30 = load i16, i16* %arrayidx17, align 2, !dbg !1095, !tbaa !149
  %and = and i16 %30, 255, !dbg !1095
  store i16 %and, i16* %arrayidx17, align 2, !dbg !1095, !tbaa !149
  br label %for.inc, !dbg !1096

for.inc:                                          ; preds = %if.end
  %31 = load i16, i16* %i, align 2, !dbg !1097, !tbaa !101
  %inc = add nsw i16 %31, 1, !dbg !1097
  store i16 %inc, i16* %i, align 2, !dbg !1097, !tbaa !101
  br label %for.cond, !dbg !1098, !llvm.loop !1099

for.end:                                          ; preds = %for.cond
  %32 = bitcast i16* %offset to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #5, !dbg !1101
  %33 = bitcast i16* %c to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %33) #5, !dbg !1101
  %34 = bitcast i16* %n to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %34) #5, !dbg !1101
  %35 = bitcast i16* %m to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %35) #5, !dbg !1101
  %36 = bitcast i16* %j to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %36) #5, !dbg !1101
  %37 = bitcast i16* %i to i8*, !dbg !1101
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %37) #5, !dbg !1101
  ret void, !dbg !1101
}

; Function Attrs: nounwind
define dso_local void @task_reduce_subtract() #0 !dbg !1102 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  %0 = bitcast i16* %i to i8*, !dbg !1110
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #5, !dbg !1110
  call void @llvm.dbg.declare(metadata i16* %i, metadata !1104, metadata !DIExpression()), !dbg !1111
  %1 = bitcast i16* %m to i8*, !dbg !1112
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #5, !dbg !1112
  call void @llvm.dbg.declare(metadata i16* %m, metadata !1105, metadata !DIExpression()), !dbg !1113
  %2 = bitcast i16* %s to i8*, !dbg !1112
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #5, !dbg !1112
  call void @llvm.dbg.declare(metadata i16* %s, metadata !1106, metadata !DIExpression()), !dbg !1114
  %3 = bitcast i16* %qn to i8*, !dbg !1112
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #5, !dbg !1112
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !1107, metadata !DIExpression()), !dbg !1115
  %4 = bitcast i16* %borrow to i8*, !dbg !1116
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #5, !dbg !1116
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !1108, metadata !DIExpression()), !dbg !1117
  %5 = bitcast i16* %offset to i8*, !dbg !1116
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %5) #5, !dbg !1116
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !1109, metadata !DIExpression()), !dbg !1118
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1119, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1119
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !1119
  %7 = load i16, i16* %reduce, align 2, !dbg !1119, !tbaa !634
  %add = add i16 %7, 1, !dbg !1120
  %sub = sub i16 %add, 8, !dbg !1121
  store i16 %sub, i16* %offset, align 2, !dbg !1122, !tbaa !101
  store i16 0, i16* %borrow, align 2, !dbg !1123, !tbaa !101
  store i16 0, i16* %i, align 2, !dbg !1124, !tbaa !101
  br label %for.cond, !dbg !1126

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i16, i16* %i, align 2, !dbg !1127, !tbaa !101
  %cmp = icmp slt i16 %8, 16, !dbg !1129
  br i1 %cmp, label %for.body, label %for.end, !dbg !1130

for.body:                                         ; preds = %for.cond
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1131, !tbaa !133
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !1131
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !1131
  %10 = load i16, i16* %i, align 2, !dbg !1133, !tbaa !101
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %10, !dbg !1131
  %11 = load i16, i16* %arrayidx, align 2, !dbg !1131, !tbaa !149
  store i16 %11, i16* %m, align 2, !dbg !1134, !tbaa !149
  %12 = load i16, i16* %i, align 2, !dbg !1135, !tbaa !101
  %13 = load i16, i16* %offset, align 2, !dbg !1137, !tbaa !101
  %cmp2 = icmp uge i16 %12, %13, !dbg !1138
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !1139

if.then:                                          ; preds = %for.body
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1140, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !1140
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !1140
  %15 = load i16, i16* %i, align 2, !dbg !1142, !tbaa !101
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %15, !dbg !1140
  %16 = load i16, i16* %arrayidx4, align 2, !dbg !1140, !tbaa !149
  store i16 %16, i16* %qn, align 2, !dbg !1143, !tbaa !149
  %17 = load i16, i16* %qn, align 2, !dbg !1144, !tbaa !149
  %18 = load i16, i16* %borrow, align 2, !dbg !1145, !tbaa !101
  %add5 = add i16 %17, %18, !dbg !1146
  store i16 %add5, i16* %s, align 2, !dbg !1147, !tbaa !149
  %19 = load i16, i16* %m, align 2, !dbg !1148, !tbaa !149
  %20 = load i16, i16* %s, align 2, !dbg !1150, !tbaa !149
  %cmp6 = icmp ult i16 %19, %20, !dbg !1151
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !1152

if.then7:                                         ; preds = %if.then
  %21 = load i16, i16* %m, align 2, !dbg !1153, !tbaa !149
  %add8 = add i16 %21, 256, !dbg !1153
  store i16 %add8, i16* %m, align 2, !dbg !1153, !tbaa !149
  store i16 1, i16* %borrow, align 2, !dbg !1155, !tbaa !101
  br label %if.end, !dbg !1156

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !1157, !tbaa !101
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %22 = load i16, i16* %m, align 2, !dbg !1159, !tbaa !149
  %23 = load i16, i16* %s, align 2, !dbg !1160, !tbaa !149
  %sub9 = sub i16 %22, %23, !dbg !1161
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1162, !tbaa !133
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !1162
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !1162
  %25 = load i16, i16* %i, align 2, !dbg !1163, !tbaa !101
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %25, !dbg !1162
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !1164, !tbaa !149
  br label %if.end13, !dbg !1165

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !1166

for.inc:                                          ; preds = %if.end13
  %26 = load i16, i16* %i, align 2, !dbg !1167, !tbaa !101
  %inc = add nsw i16 %26, 1, !dbg !1167
  store i16 %inc, i16* %i, align 2, !dbg !1167, !tbaa !101
  br label %for.cond, !dbg !1168, !llvm.loop !1169

for.end:                                          ; preds = %for.cond
  %27 = bitcast i16* %offset to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #5, !dbg !1171
  %28 = bitcast i16* %borrow to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #5, !dbg !1171
  %29 = bitcast i16* %qn to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %29) #5, !dbg !1171
  %30 = bitcast i16* %s to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %30) #5, !dbg !1171
  %31 = bitcast i16* %m to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %31) #5, !dbg !1171
  %32 = bitcast i16* %i to i8*, !dbg !1171
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %32) #5, !dbg !1171
  ret void, !dbg !1171
}

; Function Attrs: nounwind
define dso_local void @task_commit() #0 !dbg !1172 {
entry:
  ret void, !dbg !1173
}

; Function Attrs: nounwind
define dso_local i16 @main() #0 !dbg !1174 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1177, !tbaa !124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1178, !tbaa !133
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1179, !tbaa !133
  call void @camel_init(), !dbg !1180
  br label %while.body, !dbg !1181

while.body:                                       ; preds = %entry, %while.end
  call void @task_init(), !dbg !1182
  call void @commit(), !dbg !1182
  call void @task_commit(), !dbg !1182
  br label %while.body2, !dbg !1184

while.body2:                                      ; preds = %while.body, %if.end54
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1185, !tbaa !133
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !1185
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 17, !dbg !1185
  %1 = load i16, i16* %check, align 2, !dbg !1185, !tbaa !297
  %cmp = icmp eq i16 %1, 0, !dbg !1188
  br i1 %cmp, label %if.then, label %if.end, !dbg !1189

if.then:                                          ; preds = %while.body2
  call void @task_pad(), !dbg !1190
  call void @commit(), !dbg !1190
  call void @task_commit(), !dbg !1190
  br label %if.end, !dbg !1192

if.end:                                           ; preds = %if.then, %while.body2
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1193, !tbaa !133
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !1193
  %check4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !1193
  %3 = load i16, i16* %check4, align 2, !dbg !1193, !tbaa !297
  %cmp5 = icmp eq i16 %3, 2, !dbg !1195
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !1196

if.then6:                                         ; preds = %if.end
  call void @task_exp(), !dbg !1197
  call void @commit(), !dbg !1197
  call void @task_commit(), !dbg !1197
  br label %if.end7, !dbg !1199

if.end7:                                          ; preds = %if.then6, %if.end
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1200, !tbaa !133
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !1200
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !1200
  %5 = load i16, i16* %check9, align 2, !dbg !1200, !tbaa !297
  %cmp10 = icmp eq i16 %5, 0, !dbg !1202
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !1203

if.then11:                                        ; preds = %if.end7
  call void @task_mult_block(), !dbg !1204
  call void @commit(), !dbg !1204
  call void @task_commit(), !dbg !1204
  br label %if.end17, !dbg !1206

if.else:                                          ; preds = %if.end7
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1207, !tbaa !133
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1207
  %check13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 17, !dbg !1207
  %7 = load i16, i16* %check13, align 2, !dbg !1207, !tbaa !297
  %cmp14 = icmp eq i16 %7, 1, !dbg !1209
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !1210

if.then15:                                        ; preds = %if.else
  call void @task_square_base(), !dbg !1211
  call void @commit(), !dbg !1211
  call void @task_commit(), !dbg !1211
  br label %if.end16, !dbg !1213

if.end16:                                         ; preds = %if.then15, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then11
  call void @task_mult_mod(), !dbg !1214
  call void @commit(), !dbg !1214
  call void @task_commit(), !dbg !1214
  br label %do.body, !dbg !1215

do.body:                                          ; preds = %do.cond, %if.end17
  call void @task_mult(), !dbg !1216
  call void @commit(), !dbg !1216
  call void @task_commit(), !dbg !1216
  br label %do.cond, !dbg !1218

do.cond:                                          ; preds = %do.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1219, !tbaa !133
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !1219
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !1219
  %9 = load i16, i16* %digit, align 2, !dbg !1219, !tbaa !509
  %cmp19 = icmp ult i16 %9, 16, !dbg !1220
  br i1 %cmp19, label %do.body, label %do.end, !dbg !1218, !llvm.loop !1221

do.end:                                           ; preds = %do.cond
  call void @task_reduce_digits(), !dbg !1223
  call void @commit(), !dbg !1223
  call void @task_commit(), !dbg !1223
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1224, !tbaa !133
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !1224
  %check21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 17, !dbg !1224
  %11 = load i16, i16* %check21, align 2, !dbg !1224, !tbaa !297
  %cmp22 = icmp eq i16 %11, 0, !dbg !1226
  br i1 %cmp22, label %if.then23, label %if.end24, !dbg !1227

if.then23:                                        ; preds = %do.end
  br label %while.end, !dbg !1228

if.end24:                                         ; preds = %do.end
  call void @task_reduce_normalizable(), !dbg !1229
  call void @commit(), !dbg !1229
  call void @task_commit(), !dbg !1229
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1230, !tbaa !133
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !1230
  %check26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 17, !dbg !1230
  %13 = load i16, i16* %check26, align 2, !dbg !1230, !tbaa !297
  %cmp27 = icmp eq i16 %13, 1, !dbg !1232
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !1233

if.then28:                                        ; preds = %if.end24
  call void @task_reduce_normalize(), !dbg !1234
  call void @commit(), !dbg !1234
  call void @task_commit(), !dbg !1234
  br label %if.end29, !dbg !1236

if.end29:                                         ; preds = %if.then28, %if.end24
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1237, !tbaa !133
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !1237
  %check31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 17, !dbg !1237
  %15 = load i16, i16* %check31, align 2, !dbg !1237, !tbaa !297
  %cmp32 = icmp eq i16 %15, 2, !dbg !1239
  br i1 %cmp32, label %if.then33, label %if.end44, !dbg !1240

if.then33:                                        ; preds = %if.end29
  call void @task_reduce_n_divisor(), !dbg !1241
  call void @commit(), !dbg !1241
  call void @task_commit(), !dbg !1241
  br label %do.body34, !dbg !1243

do.body34:                                        ; preds = %do.cond40, %if.then33
  call void @task_reduce_quotient(), !dbg !1244
  call void @commit(), !dbg !1244
  call void @task_commit(), !dbg !1244
  call void @task_reduce_multiply(), !dbg !1246
  call void @commit(), !dbg !1246
  call void @task_commit(), !dbg !1246
  call void @task_reduce_compare(), !dbg !1247
  call void @commit(), !dbg !1247
  call void @task_commit(), !dbg !1247
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1248, !tbaa !133
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !1248
  %check36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 17, !dbg !1248
  %17 = load i16, i16* %check36, align 2, !dbg !1248, !tbaa !297
  %cmp37 = icmp eq i16 %17, 0, !dbg !1250
  br i1 %cmp37, label %if.then38, label %if.end39, !dbg !1251

if.then38:                                        ; preds = %do.body34
  call void @task_reduce_compare(), !dbg !1252
  call void @commit(), !dbg !1252
  call void @task_commit(), !dbg !1252
  br label %if.end39, !dbg !1254

if.end39:                                         ; preds = %if.then38, %do.body34
  call void @task_reduce_subtract(), !dbg !1255
  call void @commit(), !dbg !1255
  call void @task_commit(), !dbg !1255
  br label %do.cond40, !dbg !1256

do.cond40:                                        ; preds = %if.end39
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1257, !tbaa !133
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !1257
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 10, !dbg !1257
  %19 = load i16, i16* %reduce, align 2, !dbg !1257, !tbaa !634
  %add = add i16 %19, 1, !dbg !1258
  %cmp42 = icmp ugt i16 %add, 8, !dbg !1259
  br i1 %cmp42, label %do.body34, label %do.end43, !dbg !1256, !llvm.loop !1260

do.end43:                                         ; preds = %do.cond40
  br label %if.end44, !dbg !1262

if.end44:                                         ; preds = %do.end43, %if.end29
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1263, !tbaa !133
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !1263
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 18, !dbg !1263
  %21 = load i16, i16* %check_final, align 2, !dbg !1263, !tbaa !300
  %cmp46 = icmp eq i16 %21, 0, !dbg !1265
  br i1 %cmp46, label %if.then47, label %if.else48, !dbg !1266

if.then47:                                        ; preds = %if.end44
  call void @task_mult_block_get_result(), !dbg !1267
  call void @commit(), !dbg !1267
  call void @task_commit(), !dbg !1267
  br label %if.end54, !dbg !1269

if.else48:                                        ; preds = %if.end44
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1270, !tbaa !133
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !1270
  %check_final50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 18, !dbg !1270
  %23 = load i16, i16* %check_final50, align 2, !dbg !1270, !tbaa !300
  %cmp51 = icmp eq i16 %23, 1, !dbg !1272
  br i1 %cmp51, label %if.then52, label %if.end53, !dbg !1273

if.then52:                                        ; preds = %if.else48
  call void @task_square_base_get_result(), !dbg !1274
  call void @commit(), !dbg !1274
  call void @task_commit(), !dbg !1274
  br label %if.end53, !dbg !1276

if.end53:                                         ; preds = %if.then52, %if.else48
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then47
  br label %while.body2, !dbg !1184, !llvm.loop !1277

while.end:                                        ; preds = %if.then23
  br label %while.body, !dbg !1181, !llvm.loop !1279
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

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
!129 = !DILocation(line: 139, column: 19, scope: !123)
!130 = !DILocation(line: 139, column: 8, scope: !116)
!131 = !DILocation(line: 140, column: 14, scope: !132)
!132 = distinct !DILexicalBlock(scope: !123, file: !3, line: 139, column: 34)
!133 = !{!134, !134, i64 0}
!134 = !{!"any pointer", !103, i64 0}
!135 = !DILocation(line: 141, column: 16, scope: !132)
!136 = !DILocation(line: 142, column: 5, scope: !132)
!137 = !DILocation(line: 142, column: 21, scope: !138)
!138 = distinct !DILexicalBlock(scope: !123, file: !3, line: 142, column: 15)
!139 = !DILocation(line: 142, column: 26, scope: !138)
!140 = !DILocation(line: 142, column: 15, scope: !123)
!141 = !DILocation(line: 143, column: 14, scope: !142)
!142 = distinct !DILexicalBlock(scope: !138, file: !3, line: 142, column: 41)
!143 = !DILocation(line: 144, column: 16, scope: !142)
!144 = !DILocation(line: 145, column: 5, scope: !142)
!145 = !DILocation(line: 146, column: 9, scope: !146)
!146 = distinct !DILexicalBlock(scope: !138, file: !3, line: 145, column: 12)
!147 = !DILocation(line: 163, column: 3, scope: !148)
!148 = distinct !DILexicalBlock(scope: !116, file: !3, line: 163, column: 3)
!149 = !{!126, !126, i64 0}
!150 = !{i32 -2146647928}
!151 = !DILocation(line: 165, column: 33, scope: !119)
!152 = !{i32 -2146647692}
!153 = !DILocation(line: 165, column: 33, scope: !116)
!154 = !DILocation(line: 165, column: 51, scope: !116)
!155 = !DILocation(line: 165, column: 65, scope: !121)
!156 = !{i32 -2146647567}
!157 = !DILocation(line: 165, column: 65, scope: !116)
!158 = !DILocation(line: 165, column: 83, scope: !116)
!159 = !DILocation(line: 165, column: 63, scope: !116)
!160 = !DILocation(line: 165, column: 19, scope: !116)
!161 = !DILocation(line: 165, column: 17, scope: !116)
!162 = !DILocation(line: 166, column: 37, scope: !116)
!163 = !DILocation(line: 166, column: 71, scope: !116)
!164 = !DILocation(line: 166, column: 23, scope: !116)
!165 = !DILocation(line: 166, column: 21, scope: !116)
!166 = !DILocation(line: 169, column: 6, scope: !167)
!167 = distinct !DILexicalBlock(scope: !116, file: !3, line: 169, column: 6)
!168 = !DILocation(line: 169, column: 27, scope: !167)
!169 = !DILocation(line: 169, column: 33, scope: !167)
!170 = !{!127, !126, i64 224}
!171 = !DILocation(line: 169, column: 24, scope: !167)
!172 = !DILocation(line: 169, column: 6, scope: !116)
!173 = !DILocation(line: 170, column: 11, scope: !174)
!174 = distinct !DILexicalBlock(scope: !167, file: !3, line: 169, column: 51)
!175 = !DILocation(line: 170, column: 4, scope: !174)
!176 = !DILocation(line: 170, column: 19, scope: !174)
!177 = !DILocation(line: 171, column: 4, scope: !174)
!178 = !DILocation(line: 172, column: 24, scope: !174)
!179 = !DILocation(line: 172, column: 30, scope: !174)
!180 = !DILocation(line: 172, column: 4, scope: !174)
!181 = !DILocation(line: 173, column: 3, scope: !174)
!182 = !DILocation(line: 174, column: 4, scope: !183)
!183 = distinct !DILexicalBlock(scope: !167, file: !3, line: 173, column: 9)
!184 = !DILocation(line: 177, column: 1, scope: !116)
!185 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 228, type: !16, scopeLine: 228, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !186)
!186 = !{!187, !192, !194, !197}
!187 = !DILocalVariable(name: "__x", scope: !188, file: !3, line: 235, type: !6)
!188 = distinct !DILexicalBlock(scope: !189, file: !3, line: 235, column: 45)
!189 = distinct !DILexicalBlock(scope: !190, file: !3, line: 231, column: 39)
!190 = distinct !DILexicalBlock(scope: !191, file: !3, line: 231, column: 14)
!191 = distinct !DILexicalBlock(scope: !185, file: !3, line: 229, column: 8)
!192 = !DILocalVariable(name: "__x", scope: !193, file: !3, line: 235, type: !6)
!193 = distinct !DILexicalBlock(scope: !189, file: !3, line: 235, column: 77)
!194 = !DILocalVariable(name: "__x", scope: !195, file: !3, line: 243, type: !6)
!195 = distinct !DILexicalBlock(scope: !196, file: !3, line: 243, column: 45)
!196 = distinct !DILexicalBlock(scope: !190, file: !3, line: 239, column: 17)
!197 = !DILocalVariable(name: "__x", scope: !198, file: !3, line: 243, type: !6)
!198 = distinct !DILexicalBlock(scope: !196, file: !3, line: 243, column: 77)
!199 = !DILocation(line: 229, column: 5, scope: !185)
!200 = !DILocation(line: 231, column: 20, scope: !190)
!201 = !DILocation(line: 231, column: 25, scope: !190)
!202 = !DILocation(line: 231, column: 14, scope: !191)
!203 = !DILocation(line: 232, column: 17, scope: !189)
!204 = !DILocation(line: 233, column: 19, scope: !189)
!205 = !DILocation(line: 234, column: 29, scope: !189)
!206 = !DILocation(line: 234, column: 35, scope: !189)
!207 = !DILocation(line: 234, column: 12, scope: !189)
!208 = !DILocation(line: 235, column: 45, scope: !188)
!209 = !{i32 -2146647253}
!210 = !DILocation(line: 235, column: 45, scope: !189)
!211 = !DILocation(line: 235, column: 63, scope: !189)
!212 = !DILocation(line: 235, column: 77, scope: !193)
!213 = !{i32 -2146647128}
!214 = !DILocation(line: 235, column: 77, scope: !189)
!215 = !DILocation(line: 235, column: 95, scope: !189)
!216 = !DILocation(line: 235, column: 75, scope: !189)
!217 = !DILocation(line: 235, column: 31, scope: !189)
!218 = !DILocation(line: 235, column: 29, scope: !189)
!219 = !DILocation(line: 236, column: 47, scope: !189)
!220 = !DILocation(line: 236, column: 81, scope: !189)
!221 = !DILocation(line: 236, column: 33, scope: !189)
!222 = !DILocation(line: 236, column: 31, scope: !189)
!223 = !DILocation(line: 237, column: 39, scope: !189)
!224 = !DILocation(line: 237, column: 13, scope: !189)
!225 = !DILocation(line: 237, column: 19, scope: !189)
!226 = !DILocation(line: 237, column: 37, scope: !189)
!227 = !DILocation(line: 238, column: 23, scope: !189)
!228 = !DILocation(line: 239, column: 11, scope: !189)
!229 = !DILocation(line: 240, column: 17, scope: !196)
!230 = !DILocation(line: 241, column: 19, scope: !196)
!231 = !DILocation(line: 242, column: 29, scope: !196)
!232 = !DILocation(line: 242, column: 35, scope: !196)
!233 = !DILocation(line: 242, column: 12, scope: !196)
!234 = !DILocation(line: 243, column: 45, scope: !195)
!235 = !{i32 -2146646996}
!236 = !DILocation(line: 243, column: 45, scope: !196)
!237 = !DILocation(line: 243, column: 63, scope: !196)
!238 = !DILocation(line: 243, column: 77, scope: !198)
!239 = !{i32 -2146646871}
!240 = !DILocation(line: 243, column: 77, scope: !196)
!241 = !DILocation(line: 243, column: 95, scope: !196)
!242 = !DILocation(line: 243, column: 75, scope: !196)
!243 = !DILocation(line: 243, column: 31, scope: !196)
!244 = !DILocation(line: 243, column: 29, scope: !196)
!245 = !DILocation(line: 244, column: 47, scope: !196)
!246 = !DILocation(line: 244, column: 81, scope: !196)
!247 = !DILocation(line: 244, column: 33, scope: !196)
!248 = !DILocation(line: 244, column: 31, scope: !196)
!249 = !DILocation(line: 245, column: 39, scope: !196)
!250 = !DILocation(line: 245, column: 13, scope: !196)
!251 = !DILocation(line: 245, column: 19, scope: !196)
!252 = !DILocation(line: 245, column: 37, scope: !196)
!253 = !DILocation(line: 246, column: 23, scope: !196)
!254 = !DILocation(line: 249, column: 19, scope: !191)
!255 = !DILocation(line: 251, column: 1, scope: !185)
!256 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 278, type: !16, scopeLine: 278, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!257 = !DILocation(line: 280, column: 2, scope: !256)
!258 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 284, type: !16, scopeLine: 285, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !259)
!259 = !{!260, !262}
!260 = !DILocalVariable(name: "i", scope: !258, file: !3, line: 286, type: !261)
!261 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!262 = !DILocalVariable(name: "message_length", scope: !258, file: !3, line: 287, type: !6)
!263 = !DILocation(line: 286, column: 2, scope: !258)
!264 = !DILocation(line: 286, column: 6, scope: !258)
!265 = !DILocation(line: 287, column: 2, scope: !258)
!266 = !DILocation(line: 287, column: 11, scope: !258)
!267 = !DILocation(line: 290, column: 9, scope: !268)
!268 = distinct !DILexicalBlock(scope: !258, file: !3, line: 290, column: 2)
!269 = !DILocation(line: 290, column: 7, scope: !268)
!270 = !DILocation(line: 290, column: 14, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !3, line: 290, column: 2)
!272 = !DILocation(line: 290, column: 16, scope: !271)
!273 = !DILocation(line: 290, column: 2, scope: !268)
!274 = !DILocation(line: 291, column: 29, scope: !275)
!275 = distinct !DILexicalBlock(scope: !271, file: !3, line: 290, column: 35)
!276 = !DILocation(line: 291, column: 20, scope: !275)
!277 = !DILocation(line: 291, column: 3, scope: !275)
!278 = !DILocation(line: 291, column: 15, scope: !275)
!279 = !DILocation(line: 291, column: 18, scope: !275)
!280 = !DILocation(line: 292, column: 2, scope: !275)
!281 = !DILocation(line: 290, column: 30, scope: !271)
!282 = !DILocation(line: 290, column: 2, scope: !271)
!283 = distinct !{!283, !273, !284}
!284 = !DILocation(line: 292, column: 2, scope: !268)
!285 = !DILocation(line: 295, column: 23, scope: !258)
!286 = !DILocation(line: 295, column: 2, scope: !258)
!287 = !DILocation(line: 295, column: 21, scope: !258)
!288 = !{!127, !102, i64 60}
!289 = !DILocation(line: 296, column: 2, scope: !258)
!290 = !DILocation(line: 296, column: 19, scope: !258)
!291 = !{!127, !102, i64 58}
!292 = !DILocation(line: 297, column: 2, scope: !258)
!293 = !DILocation(line: 297, column: 21, scope: !258)
!294 = !{!127, !102, i64 62}
!295 = !DILocation(line: 300, column: 2, scope: !258)
!296 = !DILocation(line: 300, column: 12, scope: !258)
!297 = !{!127, !102, i64 220}
!298 = !DILocation(line: 301, column: 2, scope: !258)
!299 = !DILocation(line: 301, column: 18, scope: !258)
!300 = !{!127, !102, i64 222}
!301 = !DILocation(line: 302, column: 1, scope: !258)
!302 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 304, type: !16, scopeLine: 305, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !303)
!303 = !{!304, !305}
!304 = !DILocalVariable(name: "i", scope: !302, file: !3, line: 306, type: !261)
!305 = !DILocalVariable(name: "zero", scope: !302, file: !3, line: 312, type: !42)
!306 = !DILocation(line: 306, column: 2, scope: !302)
!307 = !DILocation(line: 306, column: 6, scope: !302)
!308 = !DILocation(line: 308, column: 6, scope: !309)
!309 = distinct !DILexicalBlock(scope: !302, file: !3, line: 308, column: 6)
!310 = !DILocation(line: 308, column: 26, scope: !309)
!311 = !DILocation(line: 308, column: 23, scope: !309)
!312 = !DILocation(line: 308, column: 6, scope: !302)
!313 = !DILocation(line: 309, column: 3, scope: !314)
!314 = distinct !DILexicalBlock(scope: !309, file: !3, line: 308, column: 46)
!315 = !DILocation(line: 310, column: 2, scope: !314)
!316 = !DILocation(line: 312, column: 2, scope: !302)
!317 = !DILocation(line: 312, column: 10, scope: !302)
!318 = !DILocation(line: 313, column: 9, scope: !319)
!319 = distinct !DILexicalBlock(scope: !302, file: !3, line: 313, column: 2)
!320 = !DILocation(line: 313, column: 7, scope: !319)
!321 = !DILocation(line: 313, column: 14, scope: !322)
!322 = distinct !DILexicalBlock(scope: !319, file: !3, line: 313, column: 2)
!323 = !DILocation(line: 313, column: 16, scope: !322)
!324 = !DILocation(line: 313, column: 2, scope: !319)
!325 = !DILocation(line: 314, column: 18, scope: !326)
!326 = distinct !DILexicalBlock(scope: !322, file: !3, line: 313, column: 52)
!327 = !DILocation(line: 314, column: 37, scope: !326)
!328 = !DILocation(line: 314, column: 35, scope: !326)
!329 = !DILocation(line: 314, column: 41, scope: !326)
!330 = !DILocation(line: 314, column: 39, scope: !326)
!331 = !DILocation(line: 314, column: 17, scope: !326)
!332 = !DILocation(line: 314, column: 73, scope: !326)
!333 = !DILocation(line: 314, column: 92, scope: !326)
!334 = !DILocation(line: 314, column: 90, scope: !326)
!335 = !DILocation(line: 314, column: 63, scope: !326)
!336 = !DILocation(line: 314, column: 3, scope: !326)
!337 = !DILocation(line: 314, column: 12, scope: !326)
!338 = !DILocation(line: 314, column: 15, scope: !326)
!339 = !DILocation(line: 315, column: 2, scope: !326)
!340 = !DILocation(line: 313, column: 47, scope: !322)
!341 = !DILocation(line: 313, column: 2, scope: !322)
!342 = distinct !{!342, !324, !343}
!343 = !DILocation(line: 315, column: 2, scope: !319)
!344 = !DILocation(line: 316, column: 9, scope: !345)
!345 = distinct !DILexicalBlock(scope: !302, file: !3, line: 316, column: 2)
!346 = !DILocation(line: 316, column: 7, scope: !345)
!347 = !DILocation(line: 316, column: 40, scope: !348)
!348 = distinct !DILexicalBlock(scope: !345, file: !3, line: 316, column: 2)
!349 = !DILocation(line: 316, column: 42, scope: !348)
!350 = !DILocation(line: 316, column: 2, scope: !345)
!351 = !DILocation(line: 317, column: 3, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 316, column: 61)
!353 = !DILocation(line: 317, column: 12, scope: !352)
!354 = !DILocation(line: 317, column: 15, scope: !352)
!355 = !DILocation(line: 318, column: 2, scope: !352)
!356 = !DILocation(line: 316, column: 56, scope: !348)
!357 = !DILocation(line: 316, column: 2, scope: !348)
!358 = distinct !{!358, !350, !359}
!359 = !DILocation(line: 318, column: 2, scope: !345)
!360 = !DILocation(line: 319, column: 2, scope: !302)
!361 = !DILocation(line: 319, column: 12, scope: !302)
!362 = !DILocation(line: 319, column: 18, scope: !302)
!363 = !DILocation(line: 320, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !302, file: !3, line: 320, column: 2)
!365 = !DILocation(line: 320, column: 7, scope: !364)
!366 = !DILocation(line: 320, column: 14, scope: !367)
!367 = distinct !DILexicalBlock(scope: !364, file: !3, line: 320, column: 2)
!368 = !DILocation(line: 320, column: 16, scope: !367)
!369 = !DILocation(line: 320, column: 2, scope: !364)
!370 = !DILocation(line: 321, column: 3, scope: !367)
!371 = !DILocation(line: 321, column: 13, scope: !367)
!372 = !DILocation(line: 321, column: 16, scope: !367)
!373 = !DILocation(line: 320, column: 30, scope: !367)
!374 = !DILocation(line: 320, column: 2, scope: !367)
!375 = distinct !{!375, !369, !376}
!376 = !DILocation(line: 321, column: 18, scope: !364)
!377 = !DILocation(line: 323, column: 24, scope: !302)
!378 = !{!379, !126, i64 8}
!379 = !{!"", !103, i64 0, !126, i64 8}
!380 = !DILocation(line: 323, column: 2, scope: !302)
!381 = !DILocation(line: 323, column: 15, scope: !302)
!382 = !{!127, !126, i64 54}
!383 = !DILocation(line: 325, column: 2, scope: !302)
!384 = !DILocation(line: 325, column: 19, scope: !302)
!385 = !DILocation(line: 327, column: 2, scope: !302)
!386 = !DILocation(line: 327, column: 12, scope: !302)
!387 = !DILocation(line: 328, column: 1, scope: !302)
!388 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 330, type: !16, scopeLine: 331, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 333, column: 6, scope: !390)
!390 = distinct !DILexicalBlock(scope: !388, file: !3, line: 333, column: 6)
!391 = !DILocation(line: 333, column: 19, scope: !390)
!392 = !DILocation(line: 333, column: 6, scope: !388)
!393 = !DILocation(line: 334, column: 3, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !3, line: 333, column: 26)
!395 = !DILocation(line: 334, column: 16, scope: !394)
!396 = !DILocation(line: 335, column: 9, scope: !394)
!397 = !DILocation(line: 335, column: 19, scope: !394)
!398 = !DILocation(line: 336, column: 2, scope: !394)
!399 = !DILocation(line: 337, column: 3, scope: !400)
!400 = distinct !DILexicalBlock(scope: !390, file: !3, line: 336, column: 9)
!401 = !DILocation(line: 337, column: 16, scope: !400)
!402 = !DILocation(line: 338, column: 9, scope: !400)
!403 = !DILocation(line: 338, column: 19, scope: !400)
!404 = !DILocation(line: 340, column: 1, scope: !388)
!405 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 342, type: !16, scopeLine: 343, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!406 = !DILocation(line: 345, column: 5, scope: !405)
!407 = !DILocation(line: 345, column: 21, scope: !405)
!408 = !DILocation(line: 347, column: 1, scope: !405)
!409 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 349, type: !16, scopeLine: 350, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !410)
!410 = !{!411, !412}
!411 = !DILocalVariable(name: "i", scope: !409, file: !3, line: 351, type: !261)
!412 = !DILocalVariable(name: "op", scope: !413, file: !3, line: 367, type: !6)
!413 = distinct !DILexicalBlock(scope: !414, file: !3, line: 365, column: 37)
!414 = distinct !DILexicalBlock(scope: !415, file: !3, line: 365, column: 4)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 365, column: 4)
!416 = distinct !DILexicalBlock(scope: !417, file: !3, line: 363, column: 59)
!417 = distinct !DILexicalBlock(scope: !418, file: !3, line: 363, column: 7)
!418 = distinct !DILexicalBlock(scope: !419, file: !3, line: 361, column: 9)
!419 = distinct !DILexicalBlock(scope: !409, file: !3, line: 357, column: 6)
!420 = !DILocation(line: 351, column: 2, scope: !409)
!421 = !DILocation(line: 351, column: 6, scope: !409)
!422 = !DILocation(line: 353, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !409, file: !3, line: 353, column: 2)
!424 = !DILocation(line: 353, column: 7, scope: !423)
!425 = !DILocation(line: 353, column: 27, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !3, line: 353, column: 2)
!427 = !DILocation(line: 353, column: 29, scope: !426)
!428 = !DILocation(line: 353, column: 2, scope: !423)
!429 = !DILocation(line: 354, column: 18, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !3, line: 353, column: 40)
!431 = !DILocation(line: 354, column: 30, scope: !430)
!432 = !DILocation(line: 354, column: 3, scope: !430)
!433 = !DILocation(line: 354, column: 13, scope: !430)
!434 = !DILocation(line: 354, column: 16, scope: !430)
!435 = !DILocation(line: 355, column: 2, scope: !430)
!436 = !DILocation(line: 353, column: 35, scope: !426)
!437 = !DILocation(line: 353, column: 2, scope: !426)
!438 = distinct !{!438, !428, !439}
!439 = !DILocation(line: 355, column: 2, scope: !423)
!440 = !DILocation(line: 357, column: 6, scope: !419)
!441 = !DILocation(line: 357, column: 19, scope: !419)
!442 = !DILocation(line: 357, column: 6, scope: !409)
!443 = !DILocation(line: 359, column: 3, scope: !444)
!444 = distinct !DILexicalBlock(scope: !419, file: !3, line: 357, column: 24)
!445 = !DILocation(line: 359, column: 13, scope: !444)
!446 = !DILocation(line: 361, column: 2, scope: !444)
!447 = !DILocation(line: 363, column: 7, scope: !417)
!448 = !DILocation(line: 363, column: 26, scope: !417)
!449 = !DILocation(line: 363, column: 39, scope: !417)
!450 = !DILocation(line: 363, column: 7, scope: !418)
!451 = !DILocation(line: 365, column: 11, scope: !415)
!452 = !DILocation(line: 365, column: 9, scope: !415)
!453 = !DILocation(line: 365, column: 16, scope: !414)
!454 = !DILocation(line: 365, column: 18, scope: !414)
!455 = !DILocation(line: 365, column: 4, scope: !415)
!456 = !DILocation(line: 367, column: 5, scope: !413)
!457 = !DILocation(line: 367, column: 14, scope: !413)
!458 = !DILocation(line: 367, column: 19, scope: !413)
!459 = !DILocation(line: 368, column: 26, scope: !413)
!460 = !DILocation(line: 368, column: 38, scope: !413)
!461 = !DILocation(line: 368, column: 5, scope: !413)
!462 = !DILocation(line: 368, column: 20, scope: !413)
!463 = !DILocation(line: 368, column: 24, scope: !413)
!464 = !DILocation(line: 369, column: 7, scope: !413)
!465 = !DILocation(line: 369, column: 5, scope: !413)
!466 = !DILocation(line: 370, column: 4, scope: !414)
!467 = !DILocation(line: 370, column: 4, scope: !413)
!468 = !DILocation(line: 365, column: 32, scope: !414)
!469 = !DILocation(line: 365, column: 4, scope: !414)
!470 = distinct !{!470, !455, !471}
!471 = !DILocation(line: 370, column: 4, scope: !415)
!472 = !DILocation(line: 372, column: 3, scope: !416)
!473 = !DILocation(line: 374, column: 3, scope: !418)
!474 = !DILocation(line: 374, column: 13, scope: !418)
!475 = !DILocation(line: 377, column: 1, scope: !409)
!476 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 379, type: !16, scopeLine: 380, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!477 = !DILocation(line: 381, column: 2, scope: !476)
!478 = !DILocation(line: 381, column: 18, scope: !476)
!479 = !DILocation(line: 383, column: 1, scope: !476)
!480 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 385, type: !16, scopeLine: 386, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !481)
!481 = !{!482}
!482 = !DILocalVariable(name: "i", scope: !480, file: !3, line: 387, type: !261)
!483 = !DILocation(line: 387, column: 2, scope: !480)
!484 = !DILocation(line: 387, column: 6, scope: !480)
!485 = !DILocation(line: 389, column: 9, scope: !486)
!486 = distinct !DILexicalBlock(scope: !480, file: !3, line: 389, column: 2)
!487 = !DILocation(line: 389, column: 7, scope: !486)
!488 = !DILocation(line: 389, column: 14, scope: !489)
!489 = distinct !DILexicalBlock(scope: !486, file: !3, line: 389, column: 2)
!490 = !DILocation(line: 389, column: 16, scope: !489)
!491 = !DILocation(line: 389, column: 2, scope: !486)
!492 = !DILocation(line: 390, column: 17, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !3, line: 389, column: 35)
!494 = !DILocation(line: 390, column: 29, scope: !493)
!495 = !DILocation(line: 390, column: 3, scope: !493)
!496 = !DILocation(line: 390, column: 12, scope: !493)
!497 = !DILocation(line: 390, column: 15, scope: !493)
!498 = !DILocation(line: 391, column: 2, scope: !493)
!499 = !DILocation(line: 389, column: 30, scope: !489)
!500 = !DILocation(line: 389, column: 2, scope: !489)
!501 = distinct !{!501, !491, !502}
!502 = !DILocation(line: 391, column: 2, scope: !486)
!503 = !DILocation(line: 393, column: 2, scope: !480)
!504 = !DILocation(line: 393, column: 12, scope: !480)
!505 = !DILocation(line: 394, column: 1, scope: !480)
!506 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 396, type: !16, scopeLine: 397, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!507 = !DILocation(line: 398, column: 2, scope: !506)
!508 = !DILocation(line: 398, column: 12, scope: !506)
!509 = !{!127, !126, i64 112}
!510 = !DILocation(line: 399, column: 2, scope: !506)
!511 = !DILocation(line: 399, column: 12, scope: !506)
!512 = !{!127, !126, i64 114}
!513 = !DILocation(line: 401, column: 1, scope: !506)
!514 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 403, type: !16, scopeLine: 404, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !515)
!515 = !{!516, !517, !518, !519, !520, !521, !522}
!516 = !DILocalVariable(name: "i", scope: !514, file: !3, line: 405, type: !261)
!517 = !DILocalVariable(name: "a", scope: !514, file: !3, line: 406, type: !42)
!518 = !DILocalVariable(name: "b", scope: !514, file: !3, line: 406, type: !42)
!519 = !DILocalVariable(name: "c", scope: !514, file: !3, line: 406, type: !42)
!520 = !DILocalVariable(name: "dp", scope: !514, file: !3, line: 407, type: !42)
!521 = !DILocalVariable(name: "p", scope: !514, file: !3, line: 407, type: !42)
!522 = !DILocalVariable(name: "op", scope: !523, file: !3, line: 414, type: !6)
!523 = distinct !DILexicalBlock(scope: !524, file: !3, line: 412, column: 57)
!524 = distinct !DILexicalBlock(scope: !525, file: !3, line: 412, column: 7)
!525 = distinct !DILexicalBlock(scope: !526, file: !3, line: 411, column: 35)
!526 = distinct !DILexicalBlock(scope: !527, file: !3, line: 411, column: 2)
!527 = distinct !DILexicalBlock(scope: !514, file: !3, line: 411, column: 2)
!528 = !DILocation(line: 405, column: 2, scope: !514)
!529 = !DILocation(line: 405, column: 6, scope: !514)
!530 = !DILocation(line: 406, column: 2, scope: !514)
!531 = !DILocation(line: 406, column: 10, scope: !514)
!532 = !DILocation(line: 406, column: 13, scope: !514)
!533 = !DILocation(line: 406, column: 16, scope: !514)
!534 = !DILocation(line: 407, column: 2, scope: !514)
!535 = !DILocation(line: 407, column: 10, scope: !514)
!536 = !DILocation(line: 407, column: 14, scope: !514)
!537 = !DILocation(line: 409, column: 6, scope: !514)
!538 = !DILocation(line: 409, column: 4, scope: !514)
!539 = !DILocation(line: 410, column: 4, scope: !514)
!540 = !DILocation(line: 411, column: 9, scope: !527)
!541 = !DILocation(line: 411, column: 7, scope: !527)
!542 = !DILocation(line: 411, column: 14, scope: !526)
!543 = !DILocation(line: 411, column: 16, scope: !526)
!544 = !DILocation(line: 411, column: 2, scope: !527)
!545 = !DILocation(line: 412, column: 7, scope: !524)
!546 = !DILocation(line: 412, column: 19, scope: !524)
!547 = !DILocation(line: 412, column: 17, scope: !524)
!548 = !DILocation(line: 412, column: 21, scope: !524)
!549 = !DILocation(line: 412, column: 26, scope: !524)
!550 = !DILocation(line: 412, column: 29, scope: !524)
!551 = !DILocation(line: 412, column: 41, scope: !524)
!552 = !DILocation(line: 412, column: 39, scope: !524)
!553 = !DILocation(line: 412, column: 43, scope: !524)
!554 = !DILocation(line: 412, column: 7, scope: !525)
!555 = !DILocation(line: 414, column: 4, scope: !523)
!556 = !DILocation(line: 414, column: 13, scope: !523)
!557 = !DILocation(line: 414, column: 18, scope: !523)
!558 = !DILocation(line: 414, column: 30, scope: !523)
!559 = !DILocation(line: 414, column: 28, scope: !523)
!560 = !DILocation(line: 416, column: 8, scope: !523)
!561 = !DILocation(line: 416, column: 17, scope: !523)
!562 = !DILocation(line: 416, column: 6, scope: !523)
!563 = !DILocation(line: 417, column: 8, scope: !523)
!564 = !DILocation(line: 417, column: 18, scope: !523)
!565 = !DILocation(line: 417, column: 6, scope: !523)
!566 = !DILocation(line: 418, column: 9, scope: !523)
!567 = !DILocation(line: 418, column: 13, scope: !523)
!568 = !DILocation(line: 418, column: 11, scope: !523)
!569 = !DILocation(line: 418, column: 7, scope: !523)
!570 = !DILocation(line: 420, column: 9, scope: !523)
!571 = !DILocation(line: 420, column: 12, scope: !523)
!572 = !DILocation(line: 420, column: 6, scope: !523)
!573 = !DILocation(line: 421, column: 9, scope: !523)
!574 = !DILocation(line: 421, column: 12, scope: !523)
!575 = !DILocation(line: 421, column: 6, scope: !523)
!576 = !DILocation(line: 423, column: 3, scope: !524)
!577 = !DILocation(line: 423, column: 3, scope: !523)
!578 = !DILocation(line: 424, column: 2, scope: !525)
!579 = !DILocation(line: 411, column: 30, scope: !526)
!580 = !DILocation(line: 411, column: 2, scope: !526)
!581 = distinct !{!581, !544, !582}
!582 = !DILocation(line: 424, column: 2, scope: !527)
!583 = !DILocation(line: 426, column: 7, scope: !514)
!584 = !DILocation(line: 426, column: 9, scope: !514)
!585 = !DILocation(line: 426, column: 4, scope: !514)
!586 = !DILocation(line: 427, column: 4, scope: !514)
!587 = !DILocation(line: 429, column: 27, scope: !514)
!588 = !DILocation(line: 429, column: 2, scope: !514)
!589 = !DILocation(line: 429, column: 14, scope: !514)
!590 = !DILocation(line: 429, column: 25, scope: !514)
!591 = !DILocation(line: 430, column: 2, scope: !514)
!592 = !DILocation(line: 430, column: 11, scope: !514)
!593 = !DILocation(line: 432, column: 6, scope: !594)
!594 = distinct !DILexicalBlock(scope: !514, file: !3, line: 432, column: 6)
!595 = !DILocation(line: 432, column: 16, scope: !594)
!596 = !DILocation(line: 432, column: 6, scope: !514)
!597 = !DILocation(line: 433, column: 15, scope: !598)
!598 = distinct !DILexicalBlock(scope: !594, file: !3, line: 432, column: 34)
!599 = !DILocation(line: 433, column: 3, scope: !598)
!600 = !DILocation(line: 433, column: 13, scope: !598)
!601 = !DILocation(line: 434, column: 2, scope: !598)
!602 = !DILocation(line: 435, column: 1, scope: !514)
!603 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 437, type: !16, scopeLine: 438, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !604)
!604 = !{!605}
!605 = !DILocalVariable(name: "d", scope: !603, file: !3, line: 439, type: !261)
!606 = !DILocation(line: 439, column: 2, scope: !603)
!607 = !DILocation(line: 439, column: 6, scope: !603)
!608 = !DILocation(line: 441, column: 4, scope: !603)
!609 = !DILocation(line: 442, column: 2, scope: !603)
!610 = !DILocation(line: 443, column: 4, scope: !611)
!611 = distinct !DILexicalBlock(scope: !603, file: !3, line: 442, column: 5)
!612 = !DILocation(line: 444, column: 2, scope: !611)
!613 = !DILocation(line: 444, column: 11, scope: !603)
!614 = !DILocation(line: 444, column: 23, scope: !603)
!615 = !DILocation(line: 444, column: 26, scope: !603)
!616 = !DILocation(line: 444, column: 31, scope: !603)
!617 = !DILocation(line: 444, column: 34, scope: !603)
!618 = !DILocation(line: 444, column: 36, scope: !603)
!619 = !DILocation(line: 0, scope: !603)
!620 = distinct !{!620, !609, !621}
!621 = !DILocation(line: 444, column: 39, scope: !603)
!622 = !DILocation(line: 446, column: 6, scope: !623)
!623 = distinct !DILexicalBlock(scope: !603, file: !3, line: 446, column: 6)
!624 = !DILocation(line: 446, column: 18, scope: !623)
!625 = !DILocation(line: 446, column: 21, scope: !623)
!626 = !DILocation(line: 446, column: 6, scope: !603)
!627 = !DILocation(line: 447, column: 3, scope: !628)
!628 = distinct !DILexicalBlock(scope: !623, file: !3, line: 446, column: 27)
!629 = !DILocation(line: 447, column: 13, scope: !628)
!630 = !DILocation(line: 448, column: 2, scope: !628)
!631 = !DILocation(line: 450, column: 15, scope: !603)
!632 = !DILocation(line: 450, column: 2, scope: !603)
!633 = !DILocation(line: 450, column: 13, scope: !603)
!634 = !{!127, !102, i64 116}
!635 = !DILocation(line: 452, column: 2, scope: !603)
!636 = !DILocation(line: 452, column: 12, scope: !603)
!637 = !DILocation(line: 453, column: 1, scope: !603)
!638 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 455, type: !16, scopeLine: 456, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !639)
!639 = !{!640, !641, !643}
!640 = !DILocalVariable(name: "i", scope: !638, file: !3, line: 457, type: !261)
!641 = !DILocalVariable(name: "normalizable", scope: !638, file: !3, line: 458, type: !642)
!642 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!643 = !DILocalVariable(name: "op", scope: !644, file: !3, line: 464, type: !6)
!644 = distinct !DILexicalBlock(scope: !645, file: !3, line: 462, column: 36)
!645 = distinct !DILexicalBlock(scope: !646, file: !3, line: 462, column: 2)
!646 = distinct !DILexicalBlock(scope: !638, file: !3, line: 462, column: 2)
!647 = !DILocation(line: 457, column: 2, scope: !638)
!648 = !DILocation(line: 457, column: 6, scope: !638)
!649 = !DILocation(line: 458, column: 2, scope: !638)
!650 = !DILocation(line: 458, column: 7, scope: !638)
!651 = !{!652, !652, i64 0}
!652 = !{!"_Bool", !103, i64 0}
!653 = !DILocation(line: 460, column: 15, scope: !638)
!654 = !DILocation(line: 460, column: 26, scope: !638)
!655 = !DILocation(line: 460, column: 30, scope: !638)
!656 = !DILocation(line: 460, column: 2, scope: !638)
!657 = !DILocation(line: 460, column: 13, scope: !638)
!658 = !{!127, !102, i64 150}
!659 = !DILocation(line: 462, column: 11, scope: !646)
!660 = !DILocation(line: 462, column: 9, scope: !646)
!661 = !DILocation(line: 462, column: 7, scope: !646)
!662 = !DILocation(line: 462, column: 23, scope: !645)
!663 = !DILocation(line: 462, column: 25, scope: !645)
!664 = !DILocation(line: 462, column: 2, scope: !646)
!665 = !DILocation(line: 464, column: 3, scope: !644)
!666 = !DILocation(line: 464, column: 12, scope: !644)
!667 = !DILocation(line: 464, column: 17, scope: !644)
!668 = !DILocation(line: 464, column: 19, scope: !644)
!669 = !DILocation(line: 464, column: 18, scope: !644)
!670 = !DILocation(line: 466, column: 7, scope: !671)
!671 = distinct !DILexicalBlock(scope: !644, file: !3, line: 466, column: 7)
!672 = !DILocation(line: 466, column: 19, scope: !671)
!673 = !DILocation(line: 466, column: 24, scope: !671)
!674 = !DILocation(line: 466, column: 36, scope: !671)
!675 = !DILocation(line: 466, column: 22, scope: !671)
!676 = !DILocation(line: 466, column: 7, scope: !644)
!677 = !DILocation(line: 467, column: 4, scope: !678)
!678 = distinct !DILexicalBlock(scope: !671, file: !3, line: 466, column: 41)
!679 = !DILocation(line: 468, column: 14, scope: !680)
!680 = distinct !DILexicalBlock(scope: !671, file: !3, line: 468, column: 14)
!681 = !DILocation(line: 468, column: 26, scope: !680)
!682 = !DILocation(line: 468, column: 31, scope: !680)
!683 = !DILocation(line: 468, column: 43, scope: !680)
!684 = !DILocation(line: 468, column: 29, scope: !680)
!685 = !DILocation(line: 468, column: 14, scope: !671)
!686 = !DILocation(line: 469, column: 17, scope: !687)
!687 = distinct !DILexicalBlock(scope: !680, file: !3, line: 468, column: 48)
!688 = !DILocation(line: 470, column: 4, scope: !687)
!689 = !DILocation(line: 472, column: 2, scope: !645)
!690 = !DILocation(line: 472, column: 2, scope: !644)
!691 = !DILocation(line: 462, column: 31, scope: !645)
!692 = !DILocation(line: 462, column: 2, scope: !645)
!693 = distinct !{!693, !664, !694}
!694 = !DILocation(line: 472, column: 2, scope: !646)
!695 = !DILocation(line: 474, column: 7, scope: !696)
!696 = distinct !DILexicalBlock(scope: !638, file: !3, line: 474, column: 6)
!697 = !{i8 0, i8 2}
!698 = !DILocation(line: 474, column: 20, scope: !696)
!699 = !DILocation(line: 474, column: 23, scope: !696)
!700 = !DILocation(line: 474, column: 34, scope: !696)
!701 = !DILocation(line: 474, column: 6, scope: !638)
!702 = !DILocation(line: 476, column: 3, scope: !703)
!703 = distinct !DILexicalBlock(scope: !696, file: !3, line: 474, column: 53)
!704 = !DILocation(line: 476, column: 13, scope: !703)
!705 = !DILocation(line: 477, column: 2, scope: !703)
!706 = !DILocation(line: 479, column: 6, scope: !707)
!707 = distinct !DILexicalBlock(scope: !638, file: !3, line: 479, column: 6)
!708 = !DILocation(line: 479, column: 6, scope: !638)
!709 = !DILocation(line: 481, column: 3, scope: !710)
!710 = distinct !DILexicalBlock(scope: !707, file: !3, line: 479, column: 20)
!711 = !DILocation(line: 481, column: 13, scope: !710)
!712 = !DILocation(line: 482, column: 2, scope: !710)
!713 = !DILocation(line: 484, column: 3, scope: !714)
!714 = distinct !DILexicalBlock(scope: !707, file: !3, line: 482, column: 9)
!715 = !DILocation(line: 484, column: 13, scope: !714)
!716 = !DILocation(line: 486, column: 1, scope: !638)
!717 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 487, type: !16, scopeLine: 488, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !718)
!718 = !{!719, !720, !721, !722, !723, !724, !725}
!719 = !DILocalVariable(name: "m", scope: !717, file: !3, line: 489, type: !42)
!720 = !DILocalVariable(name: "n", scope: !717, file: !3, line: 489, type: !42)
!721 = !DILocalVariable(name: "d", scope: !717, file: !3, line: 489, type: !42)
!722 = !DILocalVariable(name: "s", scope: !717, file: !3, line: 489, type: !42)
!723 = !DILocalVariable(name: "borrow", scope: !717, file: !3, line: 490, type: !6)
!724 = !DILocalVariable(name: "i", scope: !717, file: !3, line: 492, type: !261)
!725 = !DILocalVariable(name: "op", scope: !726, file: !3, line: 497, type: !6)
!726 = distinct !DILexicalBlock(scope: !727, file: !3, line: 495, column: 35)
!727 = distinct !DILexicalBlock(scope: !728, file: !3, line: 495, column: 2)
!728 = distinct !DILexicalBlock(scope: !717, file: !3, line: 495, column: 2)
!729 = !DILocation(line: 489, column: 2, scope: !717)
!730 = !DILocation(line: 489, column: 10, scope: !717)
!731 = !DILocation(line: 489, column: 13, scope: !717)
!732 = !DILocation(line: 489, column: 16, scope: !717)
!733 = !DILocation(line: 489, column: 19, scope: !717)
!734 = !DILocation(line: 490, column: 2, scope: !717)
!735 = !DILocation(line: 490, column: 11, scope: !717)
!736 = !DILocation(line: 492, column: 2, scope: !717)
!737 = !DILocation(line: 492, column: 6, scope: !717)
!738 = !DILocation(line: 494, column: 9, scope: !717)
!739 = !DILocation(line: 495, column: 9, scope: !728)
!740 = !DILocation(line: 495, column: 7, scope: !728)
!741 = !DILocation(line: 495, column: 14, scope: !727)
!742 = !DILocation(line: 495, column: 16, scope: !727)
!743 = !DILocation(line: 495, column: 2, scope: !728)
!744 = !DILocation(line: 497, column: 3, scope: !726)
!745 = !DILocation(line: 497, column: 12, scope: !726)
!746 = !DILocation(line: 497, column: 17, scope: !726)
!747 = !DILocation(line: 497, column: 21, scope: !726)
!748 = !DILocation(line: 497, column: 19, scope: !726)
!749 = !DILocation(line: 499, column: 7, scope: !726)
!750 = !DILocation(line: 499, column: 19, scope: !726)
!751 = !DILocation(line: 499, column: 5, scope: !726)
!752 = !DILocation(line: 500, column: 7, scope: !726)
!753 = !DILocation(line: 500, column: 19, scope: !726)
!754 = !DILocation(line: 500, column: 5, scope: !726)
!755 = !DILocation(line: 502, column: 7, scope: !726)
!756 = !DILocation(line: 502, column: 11, scope: !726)
!757 = !DILocation(line: 502, column: 9, scope: !726)
!758 = !DILocation(line: 502, column: 5, scope: !726)
!759 = !DILocation(line: 503, column: 7, scope: !760)
!760 = distinct !DILexicalBlock(scope: !726, file: !3, line: 503, column: 7)
!761 = !DILocation(line: 503, column: 11, scope: !760)
!762 = !DILocation(line: 503, column: 9, scope: !760)
!763 = !DILocation(line: 503, column: 7, scope: !726)
!764 = !DILocation(line: 504, column: 6, scope: !765)
!765 = distinct !DILexicalBlock(scope: !760, file: !3, line: 503, column: 14)
!766 = !DILocation(line: 505, column: 11, scope: !765)
!767 = !DILocation(line: 506, column: 3, scope: !765)
!768 = !DILocation(line: 507, column: 11, scope: !769)
!769 = distinct !DILexicalBlock(scope: !760, file: !3, line: 506, column: 10)
!770 = !DILocation(line: 509, column: 7, scope: !726)
!771 = !DILocation(line: 509, column: 11, scope: !726)
!772 = !DILocation(line: 509, column: 9, scope: !726)
!773 = !DILocation(line: 509, column: 5, scope: !726)
!774 = !DILocation(line: 511, column: 21, scope: !726)
!775 = !DILocation(line: 511, column: 3, scope: !726)
!776 = !DILocation(line: 511, column: 15, scope: !726)
!777 = !DILocation(line: 511, column: 19, scope: !726)
!778 = !DILocation(line: 513, column: 2, scope: !727)
!779 = !DILocation(line: 513, column: 2, scope: !726)
!780 = !DILocation(line: 495, column: 30, scope: !727)
!781 = !DILocation(line: 495, column: 2, scope: !727)
!782 = distinct !{!782, !743, !783}
!783 = !DILocation(line: 513, column: 2, scope: !728)
!784 = !DILocation(line: 515, column: 6, scope: !785)
!785 = distinct !DILexicalBlock(scope: !717, file: !3, line: 515, column: 6)
!786 = !DILocation(line: 515, column: 17, scope: !785)
!787 = !DILocation(line: 515, column: 6, scope: !717)
!788 = !DILocation(line: 516, column: 3, scope: !789)
!789 = distinct !DILexicalBlock(scope: !785, file: !3, line: 515, column: 22)
!790 = !DILocation(line: 516, column: 13, scope: !789)
!791 = !DILocation(line: 517, column: 2, scope: !789)
!792 = !DILocation(line: 518, column: 3, scope: !793)
!793 = distinct !DILexicalBlock(scope: !785, file: !3, line: 517, column: 9)
!794 = !DILocation(line: 518, column: 13, scope: !793)
!795 = !DILocation(line: 520, column: 1, scope: !717)
!796 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 522, type: !16, scopeLine: 523, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !797)
!797 = !{!798, !799}
!798 = !DILocalVariable(name: "op1", scope: !796, file: !3, line: 524, type: !6)
!799 = !DILocalVariable(name: "op2", scope: !796, file: !3, line: 525, type: !6)
!800 = !DILocation(line: 524, column: 2, scope: !796)
!801 = !DILocation(line: 524, column: 11, scope: !796)
!802 = !DILocation(line: 525, column: 2, scope: !796)
!803 = !DILocation(line: 525, column: 11, scope: !796)
!804 = !DILocation(line: 527, column: 16, scope: !796)
!805 = !DILocation(line: 527, column: 28, scope: !796)
!806 = !DILocation(line: 527, column: 32, scope: !796)
!807 = !DILocation(line: 527, column: 49, scope: !796)
!808 = !DILocation(line: 527, column: 61, scope: !796)
!809 = !DILocation(line: 527, column: 47, scope: !796)
!810 = !DILocation(line: 527, column: 2, scope: !796)
!811 = !DILocation(line: 527, column: 12, scope: !796)
!812 = !{!127, !126, i64 152}
!813 = !DILocation(line: 529, column: 1, scope: !796)
!814 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 531, type: !16, scopeLine: 532, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !815)
!815 = !{!816, !817, !818, !819, !820}
!816 = !DILocalVariable(name: "qn", scope: !814, file: !3, line: 533, type: !7)
!817 = !DILocalVariable(name: "n_q", scope: !814, file: !3, line: 533, type: !7)
!818 = !DILocalVariable(name: "op1", scope: !814, file: !3, line: 535, type: !6)
!819 = !DILocalVariable(name: "op2", scope: !814, file: !3, line: 536, type: !6)
!820 = !DILocalVariable(name: "op3", scope: !814, file: !3, line: 537, type: !6)
!821 = !DILocation(line: 533, column: 2, scope: !814)
!822 = !DILocation(line: 533, column: 11, scope: !814)
!823 = !DILocation(line: 533, column: 15, scope: !814)
!824 = !DILocation(line: 535, column: 2, scope: !814)
!825 = !DILocation(line: 535, column: 11, scope: !814)
!826 = !DILocation(line: 536, column: 2, scope: !814)
!827 = !DILocation(line: 536, column: 11, scope: !814)
!828 = !DILocation(line: 536, column: 17, scope: !814)
!829 = !DILocation(line: 536, column: 28, scope: !814)
!830 = !DILocation(line: 537, column: 2, scope: !814)
!831 = !DILocation(line: 537, column: 11, scope: !814)
!832 = !DILocation(line: 537, column: 17, scope: !814)
!833 = !DILocation(line: 537, column: 28, scope: !814)
!834 = !DILocation(line: 539, column: 6, scope: !835)
!835 = distinct !DILexicalBlock(scope: !814, file: !3, line: 539, column: 6)
!836 = !DILocation(line: 539, column: 18, scope: !835)
!837 = !DILocation(line: 539, column: 33, scope: !835)
!838 = !DILocation(line: 539, column: 45, scope: !835)
!839 = !DILocation(line: 539, column: 30, scope: !835)
!840 = !DILocation(line: 539, column: 6, scope: !814)
!841 = !DILocation(line: 540, column: 3, scope: !842)
!842 = distinct !DILexicalBlock(scope: !835, file: !3, line: 539, column: 51)
!843 = !DILocation(line: 540, column: 16, scope: !842)
!844 = !{!127, !102, i64 218}
!845 = !DILocation(line: 541, column: 2, scope: !842)
!846 = !DILocation(line: 542, column: 20, scope: !847)
!847 = distinct !DILexicalBlock(scope: !835, file: !3, line: 541, column: 9)
!848 = !DILocation(line: 542, column: 32, scope: !847)
!849 = !DILocation(line: 542, column: 44, scope: !847)
!850 = !DILocation(line: 542, column: 61, scope: !847)
!851 = !DILocation(line: 542, column: 73, scope: !847)
!852 = !DILocation(line: 542, column: 59, scope: !847)
!853 = !DILocation(line: 542, column: 81, scope: !847)
!854 = !DILocation(line: 542, column: 93, scope: !847)
!855 = !DILocation(line: 542, column: 79, scope: !847)
!856 = !DILocation(line: 542, column: 3, scope: !847)
!857 = !DILocation(line: 542, column: 16, scope: !847)
!858 = !DILocation(line: 545, column: 19, scope: !814)
!859 = !DILocation(line: 545, column: 31, scope: !814)
!860 = !DILocation(line: 545, column: 9, scope: !814)
!861 = !DILocation(line: 545, column: 43, scope: !814)
!862 = !DILocation(line: 545, column: 67, scope: !814)
!863 = !DILocation(line: 545, column: 79, scope: !814)
!864 = !DILocation(line: 545, column: 84, scope: !814)
!865 = !DILocation(line: 545, column: 66, scope: !814)
!866 = !DILocation(line: 545, column: 64, scope: !814)
!867 = !DILocation(line: 545, column: 101, scope: !814)
!868 = !DILocation(line: 545, column: 113, scope: !814)
!869 = !DILocation(line: 545, column: 99, scope: !814)
!870 = !DILocation(line: 545, column: 6, scope: !814)
!871 = !{!872, !872, i64 0}
!872 = !{!"long", !103, i64 0}
!873 = !DILocation(line: 547, column: 2, scope: !814)
!874 = !DILocation(line: 547, column: 14, scope: !814)
!875 = !DILocation(line: 548, column: 2, scope: !814)
!876 = !DILocation(line: 549, column: 3, scope: !877)
!877 = distinct !DILexicalBlock(scope: !814, file: !3, line: 548, column: 5)
!878 = !DILocation(line: 549, column: 15, scope: !877)
!879 = !DILocation(line: 550, column: 8, scope: !877)
!880 = !DILocation(line: 550, column: 21, scope: !877)
!881 = !DILocation(line: 550, column: 18, scope: !877)
!882 = !DILocation(line: 550, column: 6, scope: !877)
!883 = !DILocation(line: 551, column: 2, scope: !877)
!884 = !DILocation(line: 551, column: 11, scope: !814)
!885 = !DILocation(line: 551, column: 16, scope: !814)
!886 = !DILocation(line: 551, column: 14, scope: !814)
!887 = distinct !{!887, !875, !888}
!888 = !DILocation(line: 551, column: 19, scope: !814)
!889 = !DILocation(line: 553, column: 2, scope: !814)
!890 = !DILocation(line: 553, column: 12, scope: !814)
!891 = !DILocation(line: 555, column: 1, scope: !814)
!892 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 557, type: !16, scopeLine: 558, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !893)
!893 = !{!894, !895, !896, !897, !898, !899}
!894 = !DILocalVariable(name: "i", scope: !892, file: !3, line: 559, type: !261)
!895 = !DILocalVariable(name: "m", scope: !892, file: !3, line: 560, type: !42)
!896 = !DILocalVariable(name: "n", scope: !892, file: !3, line: 560, type: !42)
!897 = !DILocalVariable(name: "c", scope: !892, file: !3, line: 561, type: !6)
!898 = !DILocalVariable(name: "offset", scope: !892, file: !3, line: 561, type: !6)
!899 = !DILocalVariable(name: "op", scope: !900, file: !3, line: 575, type: !6)
!900 = distinct !DILexicalBlock(scope: !901, file: !3, line: 573, column: 32)
!901 = distinct !DILexicalBlock(scope: !902, file: !3, line: 573, column: 7)
!902 = distinct !DILexicalBlock(scope: !903, file: !3, line: 570, column: 44)
!903 = distinct !DILexicalBlock(scope: !904, file: !3, line: 570, column: 2)
!904 = distinct !DILexicalBlock(scope: !892, file: !3, line: 570, column: 2)
!905 = !DILocation(line: 559, column: 2, scope: !892)
!906 = !DILocation(line: 559, column: 6, scope: !892)
!907 = !DILocation(line: 560, column: 2, scope: !892)
!908 = !DILocation(line: 560, column: 10, scope: !892)
!909 = !DILocation(line: 560, column: 13, scope: !892)
!910 = !DILocation(line: 561, column: 2, scope: !892)
!911 = !DILocation(line: 561, column: 11, scope: !892)
!912 = !DILocation(line: 561, column: 14, scope: !892)
!913 = !DILocation(line: 563, column: 11, scope: !892)
!914 = !DILocation(line: 563, column: 22, scope: !892)
!915 = !DILocation(line: 563, column: 26, scope: !892)
!916 = !DILocation(line: 563, column: 9, scope: !892)
!917 = !DILocation(line: 565, column: 9, scope: !918)
!918 = distinct !DILexicalBlock(scope: !892, file: !3, line: 565, column: 2)
!919 = !DILocation(line: 565, column: 7, scope: !918)
!920 = !DILocation(line: 565, column: 14, scope: !921)
!921 = distinct !DILexicalBlock(scope: !918, file: !3, line: 565, column: 2)
!922 = !DILocation(line: 565, column: 18, scope: !921)
!923 = !DILocation(line: 565, column: 16, scope: !921)
!924 = !DILocation(line: 565, column: 2, scope: !918)
!925 = !DILocation(line: 566, column: 3, scope: !926)
!926 = distinct !DILexicalBlock(scope: !921, file: !3, line: 565, column: 31)
!927 = !DILocation(line: 566, column: 16, scope: !926)
!928 = !DILocation(line: 566, column: 19, scope: !926)
!929 = !DILocation(line: 567, column: 2, scope: !926)
!930 = !DILocation(line: 565, column: 26, scope: !921)
!931 = !DILocation(line: 565, column: 2, scope: !921)
!932 = distinct !{!932, !924, !933}
!933 = !DILocation(line: 567, column: 2, scope: !918)
!934 = !DILocation(line: 569, column: 4, scope: !892)
!935 = !DILocation(line: 570, column: 11, scope: !904)
!936 = !DILocation(line: 570, column: 9, scope: !904)
!937 = !DILocation(line: 570, column: 7, scope: !904)
!938 = !DILocation(line: 570, column: 19, scope: !903)
!939 = !DILocation(line: 570, column: 21, scope: !903)
!940 = !DILocation(line: 570, column: 2, scope: !904)
!941 = !DILocation(line: 572, column: 7, scope: !902)
!942 = !DILocation(line: 572, column: 5, scope: !902)
!943 = !DILocation(line: 573, column: 7, scope: !901)
!944 = !DILocation(line: 573, column: 11, scope: !901)
!945 = !DILocation(line: 573, column: 18, scope: !901)
!946 = !DILocation(line: 573, column: 9, scope: !901)
!947 = !DILocation(line: 573, column: 7, scope: !902)
!948 = !DILocation(line: 575, column: 4, scope: !900)
!949 = !DILocation(line: 575, column: 13, scope: !900)
!950 = !DILocation(line: 575, column: 18, scope: !900)
!951 = !DILocation(line: 575, column: 22, scope: !900)
!952 = !DILocation(line: 575, column: 20, scope: !900)
!953 = !DILocation(line: 577, column: 8, scope: !900)
!954 = !DILocation(line: 577, column: 20, scope: !900)
!955 = !DILocation(line: 577, column: 6, scope: !900)
!956 = !DILocation(line: 578, column: 9, scope: !900)
!957 = !DILocation(line: 578, column: 24, scope: !900)
!958 = !DILocation(line: 578, column: 22, scope: !900)
!959 = !DILocation(line: 578, column: 6, scope: !900)
!960 = !DILocation(line: 579, column: 3, scope: !901)
!961 = !DILocation(line: 579, column: 3, scope: !900)
!962 = !DILocation(line: 580, column: 6, scope: !963)
!963 = distinct !DILexicalBlock(scope: !901, file: !3, line: 579, column: 10)
!964 = !DILocation(line: 583, column: 7, scope: !902)
!965 = !DILocation(line: 583, column: 9, scope: !902)
!966 = !DILocation(line: 583, column: 5, scope: !902)
!967 = !DILocation(line: 584, column: 5, scope: !902)
!968 = !DILocation(line: 586, column: 21, scope: !902)
!969 = !DILocation(line: 586, column: 3, scope: !902)
!970 = !DILocation(line: 586, column: 16, scope: !902)
!971 = !DILocation(line: 586, column: 19, scope: !902)
!972 = !DILocation(line: 588, column: 2, scope: !902)
!973 = !DILocation(line: 570, column: 39, scope: !903)
!974 = !DILocation(line: 570, column: 2, scope: !903)
!975 = distinct !{!975, !940, !976}
!976 = !DILocation(line: 588, column: 2, scope: !904)
!977 = !DILocation(line: 590, column: 1, scope: !892)
!978 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 592, type: !16, scopeLine: 593, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !979)
!979 = !{!980, !981}
!980 = !DILocalVariable(name: "i", scope: !978, file: !3, line: 594, type: !261)
!981 = !DILocalVariable(name: "relation", scope: !978, file: !3, line: 595, type: !982)
!982 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!983 = !DILocation(line: 594, column: 2, scope: !978)
!984 = !DILocation(line: 594, column: 6, scope: !978)
!985 = !DILocation(line: 595, column: 2, scope: !978)
!986 = !DILocation(line: 595, column: 7, scope: !978)
!987 = !DILocation(line: 597, column: 9, scope: !988)
!988 = distinct !DILexicalBlock(scope: !978, file: !3, line: 597, column: 2)
!989 = !DILocation(line: 597, column: 7, scope: !988)
!990 = !DILocation(line: 597, column: 31, scope: !991)
!991 = distinct !DILexicalBlock(scope: !988, file: !3, line: 597, column: 2)
!992 = !DILocation(line: 597, column: 33, scope: !991)
!993 = !DILocation(line: 597, column: 2, scope: !988)
!994 = !DILocation(line: 599, column: 7, scope: !995)
!995 = distinct !DILexicalBlock(scope: !996, file: !3, line: 599, column: 7)
!996 = distinct !DILexicalBlock(scope: !991, file: !3, line: 597, column: 44)
!997 = !DILocation(line: 599, column: 19, scope: !995)
!998 = !DILocation(line: 599, column: 24, scope: !995)
!999 = !DILocation(line: 599, column: 37, scope: !995)
!1000 = !DILocation(line: 599, column: 22, scope: !995)
!1001 = !DILocation(line: 599, column: 7, scope: !996)
!1002 = !DILocation(line: 600, column: 13, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !995, file: !3, line: 599, column: 41)
!1004 = !DILocation(line: 601, column: 4, scope: !1003)
!1005 = !DILocation(line: 602, column: 14, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !995, file: !3, line: 602, column: 14)
!1007 = !DILocation(line: 602, column: 26, scope: !1006)
!1008 = !DILocation(line: 602, column: 31, scope: !1006)
!1009 = !DILocation(line: 602, column: 44, scope: !1006)
!1010 = !DILocation(line: 602, column: 29, scope: !1006)
!1011 = !DILocation(line: 602, column: 14, scope: !995)
!1012 = !DILocation(line: 603, column: 13, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 602, column: 48)
!1014 = !DILocation(line: 604, column: 4, scope: !1013)
!1015 = !DILocation(line: 606, column: 2, scope: !996)
!1016 = !DILocation(line: 597, column: 39, scope: !991)
!1017 = !DILocation(line: 597, column: 2, scope: !991)
!1018 = distinct !{!1018, !993, !1019}
!1019 = !DILocation(line: 606, column: 2, scope: !988)
!1020 = !DILocation(line: 608, column: 6, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !978, file: !3, line: 608, column: 6)
!1022 = !DILocation(line: 608, column: 15, scope: !1021)
!1023 = !DILocation(line: 608, column: 6, scope: !978)
!1024 = !DILocation(line: 609, column: 3, scope: !1025)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 608, column: 23)
!1026 = !DILocation(line: 609, column: 13, scope: !1025)
!1027 = !DILocation(line: 610, column: 2, scope: !1025)
!1028 = !DILocation(line: 611, column: 1, scope: !978)
!1029 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 613, type: !16, scopeLine: 614, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1030)
!1030 = !{!1031, !1032, !1033, !1034, !1035, !1036}
!1031 = !DILocalVariable(name: "i", scope: !1029, file: !3, line: 615, type: !261)
!1032 = !DILocalVariable(name: "j", scope: !1029, file: !3, line: 615, type: !261)
!1033 = !DILocalVariable(name: "m", scope: !1029, file: !3, line: 616, type: !42)
!1034 = !DILocalVariable(name: "n", scope: !1029, file: !3, line: 616, type: !42)
!1035 = !DILocalVariable(name: "c", scope: !1029, file: !3, line: 616, type: !42)
!1036 = !DILocalVariable(name: "offset", scope: !1029, file: !3, line: 617, type: !6)
!1037 = !DILocation(line: 615, column: 2, scope: !1029)
!1038 = !DILocation(line: 615, column: 6, scope: !1029)
!1039 = !DILocation(line: 615, column: 9, scope: !1029)
!1040 = !DILocation(line: 616, column: 2, scope: !1029)
!1041 = !DILocation(line: 616, column: 10, scope: !1029)
!1042 = !DILocation(line: 616, column: 13, scope: !1029)
!1043 = !DILocation(line: 616, column: 16, scope: !1029)
!1044 = !DILocation(line: 617, column: 2, scope: !1029)
!1045 = !DILocation(line: 617, column: 11, scope: !1029)
!1046 = !DILocation(line: 619, column: 11, scope: !1029)
!1047 = !DILocation(line: 619, column: 22, scope: !1029)
!1048 = !DILocation(line: 619, column: 26, scope: !1029)
!1049 = !DILocation(line: 619, column: 9, scope: !1029)
!1050 = !DILocation(line: 621, column: 4, scope: !1029)
!1051 = !DILocation(line: 622, column: 11, scope: !1052)
!1052 = distinct !DILexicalBlock(scope: !1029, file: !3, line: 622, column: 2)
!1053 = !DILocation(line: 622, column: 9, scope: !1052)
!1054 = !DILocation(line: 622, column: 7, scope: !1052)
!1055 = !DILocation(line: 622, column: 19, scope: !1056)
!1056 = distinct !DILexicalBlock(scope: !1052, file: !3, line: 622, column: 2)
!1057 = !DILocation(line: 622, column: 21, scope: !1056)
!1058 = !DILocation(line: 622, column: 2, scope: !1052)
!1059 = !DILocation(line: 623, column: 7, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1056, file: !3, line: 622, column: 44)
!1061 = !DILocation(line: 623, column: 19, scope: !1060)
!1062 = !DILocation(line: 623, column: 5, scope: !1060)
!1063 = !DILocation(line: 625, column: 7, scope: !1060)
!1064 = !DILocation(line: 625, column: 11, scope: !1060)
!1065 = !DILocation(line: 625, column: 9, scope: !1060)
!1066 = !DILocation(line: 625, column: 5, scope: !1060)
!1067 = !DILocation(line: 627, column: 7, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1060, file: !3, line: 627, column: 7)
!1069 = !DILocation(line: 627, column: 11, scope: !1068)
!1070 = !DILocation(line: 627, column: 18, scope: !1068)
!1071 = !DILocation(line: 627, column: 9, scope: !1068)
!1072 = !DILocation(line: 627, column: 7, scope: !1060)
!1073 = !DILocation(line: 628, column: 8, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 627, column: 32)
!1075 = !DILocation(line: 628, column: 20, scope: !1074)
!1076 = !DILocation(line: 628, column: 6, scope: !1074)
!1077 = !DILocation(line: 629, column: 3, scope: !1074)
!1078 = !DILocation(line: 630, column: 6, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 629, column: 10)
!1080 = !DILocation(line: 631, column: 6, scope: !1079)
!1081 = !DILocation(line: 634, column: 20, scope: !1060)
!1082 = !DILocation(line: 634, column: 24, scope: !1060)
!1083 = !DILocation(line: 634, column: 22, scope: !1060)
!1084 = !DILocation(line: 634, column: 28, scope: !1060)
!1085 = !DILocation(line: 634, column: 26, scope: !1060)
!1086 = !DILocation(line: 634, column: 3, scope: !1060)
!1087 = !DILocation(line: 634, column: 15, scope: !1060)
!1088 = !DILocation(line: 634, column: 18, scope: !1060)
!1089 = !DILocation(line: 636, column: 7, scope: !1060)
!1090 = !DILocation(line: 636, column: 19, scope: !1060)
!1091 = !DILocation(line: 636, column: 22, scope: !1060)
!1092 = !DILocation(line: 636, column: 5, scope: !1060)
!1093 = !DILocation(line: 637, column: 3, scope: !1060)
!1094 = !DILocation(line: 637, column: 15, scope: !1060)
!1095 = !DILocation(line: 637, column: 18, scope: !1060)
!1096 = !DILocation(line: 638, column: 2, scope: !1060)
!1097 = !DILocation(line: 622, column: 39, scope: !1056)
!1098 = !DILocation(line: 622, column: 2, scope: !1056)
!1099 = distinct !{!1099, !1058, !1100}
!1100 = !DILocation(line: 638, column: 2, scope: !1052)
!1101 = !DILocation(line: 640, column: 1, scope: !1029)
!1102 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 642, type: !16, scopeLine: 643, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1103)
!1103 = !{!1104, !1105, !1106, !1107, !1108, !1109}
!1104 = !DILocalVariable(name: "i", scope: !1102, file: !3, line: 644, type: !261)
!1105 = !DILocalVariable(name: "m", scope: !1102, file: !3, line: 645, type: !42)
!1106 = !DILocalVariable(name: "s", scope: !1102, file: !3, line: 645, type: !42)
!1107 = !DILocalVariable(name: "qn", scope: !1102, file: !3, line: 645, type: !42)
!1108 = !DILocalVariable(name: "borrow", scope: !1102, file: !3, line: 646, type: !6)
!1109 = !DILocalVariable(name: "offset", scope: !1102, file: !3, line: 646, type: !6)
!1110 = !DILocation(line: 644, column: 2, scope: !1102)
!1111 = !DILocation(line: 644, column: 6, scope: !1102)
!1112 = !DILocation(line: 645, column: 2, scope: !1102)
!1113 = !DILocation(line: 645, column: 10, scope: !1102)
!1114 = !DILocation(line: 645, column: 13, scope: !1102)
!1115 = !DILocation(line: 645, column: 16, scope: !1102)
!1116 = !DILocation(line: 646, column: 2, scope: !1102)
!1117 = !DILocation(line: 646, column: 11, scope: !1102)
!1118 = !DILocation(line: 646, column: 19, scope: !1102)
!1119 = !DILocation(line: 648, column: 11, scope: !1102)
!1120 = !DILocation(line: 648, column: 22, scope: !1102)
!1121 = !DILocation(line: 648, column: 26, scope: !1102)
!1122 = !DILocation(line: 648, column: 9, scope: !1102)
!1123 = !DILocation(line: 650, column: 9, scope: !1102)
!1124 = !DILocation(line: 651, column: 9, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 651, column: 2)
!1126 = !DILocation(line: 651, column: 7, scope: !1125)
!1127 = !DILocation(line: 651, column: 14, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1125, file: !3, line: 651, column: 2)
!1129 = !DILocation(line: 651, column: 16, scope: !1128)
!1130 = !DILocation(line: 651, column: 2, scope: !1125)
!1131 = !DILocation(line: 652, column: 7, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1128, file: !3, line: 651, column: 39)
!1133 = !DILocation(line: 652, column: 19, scope: !1132)
!1134 = !DILocation(line: 652, column: 5, scope: !1132)
!1135 = !DILocation(line: 654, column: 7, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1132, file: !3, line: 654, column: 7)
!1137 = !DILocation(line: 654, column: 12, scope: !1136)
!1138 = !DILocation(line: 654, column: 9, scope: !1136)
!1139 = !DILocation(line: 654, column: 7, scope: !1132)
!1140 = !DILocation(line: 655, column: 9, scope: !1141)
!1141 = distinct !DILexicalBlock(scope: !1136, file: !3, line: 654, column: 20)
!1142 = !DILocation(line: 655, column: 22, scope: !1141)
!1143 = !DILocation(line: 655, column: 7, scope: !1141)
!1144 = !DILocation(line: 657, column: 8, scope: !1141)
!1145 = !DILocation(line: 657, column: 13, scope: !1141)
!1146 = !DILocation(line: 657, column: 11, scope: !1141)
!1147 = !DILocation(line: 657, column: 6, scope: !1141)
!1148 = !DILocation(line: 658, column: 8, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1141, file: !3, line: 658, column: 8)
!1150 = !DILocation(line: 658, column: 12, scope: !1149)
!1151 = !DILocation(line: 658, column: 10, scope: !1149)
!1152 = !DILocation(line: 658, column: 8, scope: !1141)
!1153 = !DILocation(line: 659, column: 7, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1149, file: !3, line: 658, column: 15)
!1155 = !DILocation(line: 660, column: 12, scope: !1154)
!1156 = !DILocation(line: 661, column: 4, scope: !1154)
!1157 = !DILocation(line: 662, column: 12, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1149, file: !3, line: 661, column: 11)
!1159 = !DILocation(line: 664, column: 21, scope: !1141)
!1160 = !DILocation(line: 664, column: 25, scope: !1141)
!1161 = !DILocation(line: 664, column: 23, scope: !1141)
!1162 = !DILocation(line: 664, column: 4, scope: !1141)
!1163 = !DILocation(line: 664, column: 16, scope: !1141)
!1164 = !DILocation(line: 664, column: 19, scope: !1141)
!1165 = !DILocation(line: 666, column: 3, scope: !1141)
!1166 = !DILocation(line: 667, column: 2, scope: !1132)
!1167 = !DILocation(line: 651, column: 34, scope: !1128)
!1168 = !DILocation(line: 651, column: 2, scope: !1128)
!1169 = distinct !{!1169, !1130, !1170}
!1170 = !DILocation(line: 667, column: 2, scope: !1125)
!1171 = !DILocation(line: 668, column: 1, scope: !1102)
!1172 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 670, type: !16, scopeLine: 670, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!1173 = !DILocation(line: 672, column: 1, scope: !1172)
!1174 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 675, type: !1175, scopeLine: 675, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!1175 = !DISubroutineType(types: !1176)
!1176 = !{!261}
!1177 = !DILocation(line: 677, column: 16, scope: !1174)
!1178 = !DILocation(line: 678, column: 10, scope: !1174)
!1179 = !DILocation(line: 679, column: 12, scope: !1174)
!1180 = !DILocation(line: 680, column: 5, scope: !1174)
!1181 = !DILocation(line: 682, column: 2, scope: !1174)
!1182 = !DILocation(line: 684, column: 3, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1174, file: !3, line: 682, column: 12)
!1184 = !DILocation(line: 686, column: 3, scope: !1183)
!1185 = !DILocation(line: 688, column: 8, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 688, column: 8)
!1187 = distinct !DILexicalBlock(scope: !1183, file: !3, line: 686, column: 13)
!1188 = !DILocation(line: 688, column: 19, scope: !1186)
!1189 = !DILocation(line: 688, column: 8, scope: !1187)
!1190 = !DILocation(line: 690, column: 5, scope: !1191)
!1191 = distinct !DILexicalBlock(scope: !1186, file: !3, line: 688, column: 25)
!1192 = !DILocation(line: 692, column: 4, scope: !1191)
!1193 = !DILocation(line: 694, column: 8, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 694, column: 8)
!1195 = !DILocation(line: 694, column: 19, scope: !1194)
!1196 = !DILocation(line: 694, column: 8, scope: !1187)
!1197 = !DILocation(line: 696, column: 5, scope: !1198)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 694, column: 25)
!1199 = !DILocation(line: 698, column: 4, scope: !1198)
!1200 = !DILocation(line: 700, column: 8, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 700, column: 8)
!1202 = !DILocation(line: 700, column: 19, scope: !1201)
!1203 = !DILocation(line: 700, column: 8, scope: !1187)
!1204 = !DILocation(line: 702, column: 5, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1201, file: !3, line: 700, column: 25)
!1206 = !DILocation(line: 704, column: 4, scope: !1205)
!1207 = !DILocation(line: 704, column: 15, scope: !1208)
!1208 = distinct !DILexicalBlock(scope: !1201, file: !3, line: 704, column: 15)
!1209 = !DILocation(line: 704, column: 26, scope: !1208)
!1210 = !DILocation(line: 704, column: 15, scope: !1201)
!1211 = !DILocation(line: 706, column: 5, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1208, file: !3, line: 704, column: 32)
!1213 = !DILocation(line: 708, column: 4, scope: !1212)
!1214 = !DILocation(line: 710, column: 4, scope: !1187)
!1215 = !DILocation(line: 712, column: 4, scope: !1187)
!1216 = !DILocation(line: 714, column: 5, scope: !1217)
!1217 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 712, column: 7)
!1218 = !DILocation(line: 716, column: 4, scope: !1217)
!1219 = !DILocation(line: 716, column: 13, scope: !1187)
!1220 = !DILocation(line: 716, column: 24, scope: !1187)
!1221 = distinct !{!1221, !1215, !1222}
!1222 = !DILocation(line: 716, column: 40, scope: !1187)
!1223 = !DILocation(line: 718, column: 4, scope: !1187)
!1224 = !DILocation(line: 720, column: 8, scope: !1225)
!1225 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 720, column: 8)
!1226 = !DILocation(line: 720, column: 19, scope: !1225)
!1227 = !DILocation(line: 720, column: 8, scope: !1187)
!1228 = !DILocation(line: 721, column: 5, scope: !1225)
!1229 = !DILocation(line: 723, column: 4, scope: !1187)
!1230 = !DILocation(line: 725, column: 8, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 725, column: 8)
!1232 = !DILocation(line: 725, column: 19, scope: !1231)
!1233 = !DILocation(line: 725, column: 8, scope: !1187)
!1234 = !DILocation(line: 727, column: 5, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1231, file: !3, line: 725, column: 25)
!1236 = !DILocation(line: 729, column: 4, scope: !1235)
!1237 = !DILocation(line: 731, column: 8, scope: !1238)
!1238 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 731, column: 8)
!1239 = !DILocation(line: 731, column: 19, scope: !1238)
!1240 = !DILocation(line: 731, column: 8, scope: !1187)
!1241 = !DILocation(line: 733, column: 5, scope: !1242)
!1242 = distinct !DILexicalBlock(scope: !1238, file: !3, line: 731, column: 25)
!1243 = !DILocation(line: 735, column: 5, scope: !1242)
!1244 = !DILocation(line: 737, column: 6, scope: !1245)
!1245 = distinct !DILexicalBlock(scope: !1242, file: !3, line: 735, column: 8)
!1246 = !DILocation(line: 739, column: 6, scope: !1245)
!1247 = !DILocation(line: 741, column: 6, scope: !1245)
!1248 = !DILocation(line: 743, column: 10, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1245, file: !3, line: 743, column: 10)
!1250 = !DILocation(line: 743, column: 21, scope: !1249)
!1251 = !DILocation(line: 743, column: 10, scope: !1245)
!1252 = !DILocation(line: 745, column: 7, scope: !1253)
!1253 = distinct !DILexicalBlock(scope: !1249, file: !3, line: 743, column: 27)
!1254 = !DILocation(line: 747, column: 6, scope: !1253)
!1255 = !DILocation(line: 749, column: 6, scope: !1245)
!1256 = !DILocation(line: 751, column: 5, scope: !1245)
!1257 = !DILocation(line: 751, column: 13, scope: !1242)
!1258 = !DILocation(line: 751, column: 25, scope: !1242)
!1259 = !DILocation(line: 751, column: 29, scope: !1242)
!1260 = distinct !{!1260, !1243, !1261}
!1261 = !DILocation(line: 751, column: 41, scope: !1242)
!1262 = !DILocation(line: 752, column: 4, scope: !1242)
!1263 = !DILocation(line: 754, column: 8, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 754, column: 8)
!1265 = !DILocation(line: 754, column: 25, scope: !1264)
!1266 = !DILocation(line: 754, column: 8, scope: !1187)
!1267 = !DILocation(line: 756, column: 5, scope: !1268)
!1268 = distinct !DILexicalBlock(scope: !1264, file: !3, line: 754, column: 31)
!1269 = !DILocation(line: 758, column: 4, scope: !1268)
!1270 = !DILocation(line: 758, column: 15, scope: !1271)
!1271 = distinct !DILexicalBlock(scope: !1264, file: !3, line: 758, column: 15)
!1272 = !DILocation(line: 758, column: 32, scope: !1271)
!1273 = !DILocation(line: 758, column: 15, scope: !1264)
!1274 = !DILocation(line: 760, column: 5, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1271, file: !3, line: 758, column: 38)
!1276 = !DILocation(line: 762, column: 4, scope: !1275)
!1277 = distinct !{!1277, !1184, !1278}
!1278 = !DILocation(line: 763, column: 3, scope: !1183)
!1279 = distinct !{!1279, !1181, !1280}
!1280 = !DILocation(line: 764, column: 2, scope: !1174)
