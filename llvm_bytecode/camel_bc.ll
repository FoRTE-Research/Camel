; ModuleID = 'camel_bc.bc'
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !28
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !54
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !21
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !26
@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1, !dbg !59
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !16
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !56
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local void @camel_init() #0 !dbg !74 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !75, !tbaa !76
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !80, !tbaa !81
  %conv = zext i8 %0 to i16, !dbg !80
  %or = or i16 %conv, 1, !dbg !80
  %conv1 = trunc i16 %or to i8, !dbg !80
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !80, !tbaa !81
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !82, !tbaa !81
  %conv2 = zext i8 %1 to i16, !dbg !82
  %and = and i16 %conv2, -2, !dbg !82
  %conv3 = trunc i16 %and to i8, !dbg !82
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !82, !tbaa !81
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !83, !tbaa !76
  %and4 = and i16 %2, -2, !dbg !83
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
define dso_local void @camel_recover() #0 !dbg !91 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !97, !tbaa !99
  %cmp = icmp eq i16 %0, 1, !dbg !105
  br i1 %cmp, label %if.then, label %if.else, !dbg !106

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !107, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !111, !tbaa !109
  br label %if.end4, !dbg !112

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !113, !tbaa !99
  %cmp1 = icmp eq i16 %1, 2, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !116

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !117, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !119, !tbaa !109
  br label %if.end, !dbg !120

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !121
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !123, !tbaa !109
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !123
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !123
  %3 = load i16, i16* %arrayidx, align 2, !dbg !123, !tbaa !125
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #6, !dbg !123, !srcloc !126
  %4 = bitcast i16* %__x to i8*, !dbg !127
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %4) #6, !dbg !127
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !93, metadata !DIExpression()), !dbg !127
  %5 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !127, !srcloc !128
  store i16 %5, i16* %__x, align 2, !dbg !127, !tbaa !76
  %6 = load i16, i16* %__x, align 2, !dbg !127, !tbaa !76
  store i16 %6, i16* %tmp, align 2, !dbg !127, !tbaa !76
  %7 = bitcast i16* %__x to i8*, !dbg !129
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #6, !dbg !129
  %8 = load i16, i16* %tmp, align 2, !dbg !127, !tbaa !76
  %add = add i16 %8, 2, !dbg !130
  %9 = inttoptr i16 %add to i8*, !dbg !129
  %10 = bitcast i16* %__x5 to i8*, !dbg !131
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %10) #6, !dbg !131
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !95, metadata !DIExpression()), !dbg !131
  %11 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !131, !srcloc !132
  store i16 %11, i16* %__x5, align 2, !dbg !131, !tbaa !76
  %12 = load i16, i16* %__x5, align 2, !dbg !131, !tbaa !76
  store i16 %12, i16* %tmp6, align 2, !dbg !131, !tbaa !76
  %13 = bitcast i16* %__x5 to i8*, !dbg !133
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %13) #6, !dbg !133
  %14 = load i16, i16* %tmp6, align 2, !dbg !131, !tbaa !76
  %add7 = add i16 %14, 2, !dbg !134
  %sub = sub i16 9216, %add7, !dbg !135
  %call = call zeroext i16 @__fast_hw_crc(i8* %9, i16 zeroext %sub, i16 zeroext -1), !dbg !136
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !137, !tbaa !125
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !138, !tbaa !109
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !138
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !139, !tbaa !125
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 44, i16 zeroext %17), !dbg !140
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !141, !tbaa !125
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !142, !tbaa !125
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !144, !tbaa !109
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !145
  %20 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !145, !tbaa !146
  %cmp9 = icmp eq i16 %18, %20, !dbg !147
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !148

if.then10:                                        ; preds = %if.end4
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !149, !tbaa !109
  %22 = bitcast %struct.camel_buffer_t* %21 to i8*, !dbg !151
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !152, !tbaa !109
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !151
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %22, i8* align 2 %24, i16 46, i1 false), !dbg !151
  call void @camel_init(), !dbg !153
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !154, !tbaa !109
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !155
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !154
  call void @__restore_registers(i16* %arraydecay), !dbg !156
  br label %if.end13, !dbg !157

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !158
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !160
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
define dso_local void @commit() #0 !dbg !161 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !175

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !176, !tbaa !99
  %cmp = icmp eq i16 %0, 1, !dbg !177
  br i1 %cmp, label %if.then, label %if.else, !dbg !178

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !179, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !180, !tbaa !109
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !181, !tbaa !109
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !182
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !181
  call void @__dump_registers(i16* %arraydecay), !dbg !183
  %2 = bitcast i16* %__x to i8*, !dbg !184
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %2) #6, !dbg !184
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !163, metadata !DIExpression()), !dbg !184
  %3 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !184, !srcloc !185
  store i16 %3, i16* %__x, align 2, !dbg !184, !tbaa !76
  %4 = load i16, i16* %__x, align 2, !dbg !184, !tbaa !76
  store i16 %4, i16* %tmp, align 2, !dbg !184, !tbaa !76
  %5 = bitcast i16* %__x to i8*, !dbg !186
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %5) #6, !dbg !186
  %6 = load i16, i16* %tmp, align 2, !dbg !184, !tbaa !76
  %add = add i16 %6, 2, !dbg !187
  %7 = inttoptr i16 %add to i8*, !dbg !186
  %8 = bitcast i16* %__x1 to i8*, !dbg !188
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %8) #6, !dbg !188
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !168, metadata !DIExpression()), !dbg !188
  %9 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !188, !srcloc !189
  store i16 %9, i16* %__x1, align 2, !dbg !188, !tbaa !76
  %10 = load i16, i16* %__x1, align 2, !dbg !188, !tbaa !76
  store i16 %10, i16* %tmp2, align 2, !dbg !188, !tbaa !76
  %11 = bitcast i16* %__x1 to i8*, !dbg !190
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %11) #6, !dbg !190
  %12 = load i16, i16* %tmp2, align 2, !dbg !188, !tbaa !76
  %add3 = add i16 %12, 2, !dbg !191
  %sub = sub i16 9216, %add3, !dbg !192
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !193
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !194, !tbaa !125
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !195, !tbaa !109
  %14 = bitcast %struct.camel_buffer_t* %13 to i8*, !dbg !195
  %15 = load i16, i16* @tmp_stack_crc, align 2, !dbg !196, !tbaa !125
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %14, i16 zeroext 44, i16 zeroext %15), !dbg !197
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !198, !tbaa !125
  %16 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !199, !tbaa !125
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !200, !tbaa !109
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 2, !dbg !201
  store i16 %16, i16* %stack_and_buf_crc, align 2, !dbg !202, !tbaa !146
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !203, !tbaa !99
  br label %if.end, !dbg !204

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !205, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !206, !tbaa !109
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !207, !tbaa !109
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !208
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !207
  call void @__dump_registers(i16* %arraydecay6), !dbg !209
  %19 = bitcast i16* %__x7 to i8*, !dbg !210
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %19) #6, !dbg !210
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !170, metadata !DIExpression()), !dbg !210
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !210, !srcloc !211
  store i16 %20, i16* %__x7, align 2, !dbg !210, !tbaa !76
  %21 = load i16, i16* %__x7, align 2, !dbg !210, !tbaa !76
  store i16 %21, i16* %tmp8, align 2, !dbg !210, !tbaa !76
  %22 = bitcast i16* %__x7 to i8*, !dbg !212
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #6, !dbg !212
  %23 = load i16, i16* %tmp8, align 2, !dbg !210, !tbaa !76
  %add9 = add i16 %23, 2, !dbg !213
  %24 = inttoptr i16 %add9 to i8*, !dbg !212
  %25 = bitcast i16* %__x10 to i8*, !dbg !214
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %25) #6, !dbg !214
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !173, metadata !DIExpression()), !dbg !214
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !214, !srcloc !215
  store i16 %26, i16* %__x10, align 2, !dbg !214, !tbaa !76
  %27 = load i16, i16* %__x10, align 2, !dbg !214, !tbaa !76
  store i16 %27, i16* %tmp11, align 2, !dbg !214, !tbaa !76
  %28 = bitcast i16* %__x10 to i8*, !dbg !216
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #6, !dbg !216
  %29 = load i16, i16* %tmp11, align 2, !dbg !214, !tbaa !76
  %add12 = add i16 %29, 2, !dbg !217
  %sub13 = sub i16 9216, %add12, !dbg !218
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub13, i16 zeroext -1), !dbg !219
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !220, !tbaa !125
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !221, !tbaa !109
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !221
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !222, !tbaa !125
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 44, i16 zeroext %32), !dbg !223
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !224, !tbaa !125
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !225, !tbaa !125
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !226, !tbaa !109
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !227
  store i16 %33, i16* %stack_and_buf_crc16, align 2, !dbg !228, !tbaa !146
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !229, !tbaa !99
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !230

do.end:                                           ; preds = %if.end
  ret void, !dbg !231
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: naked noinline nounwind
define dso_local void @naked() #4 !dbg !232 {
entry:
  call void asm sideeffect "ret", ""() #6, !dbg !233, !srcloc !234
  unreachable, !dbg !235
}

; Function Attrs: nounwind
define dso_local void @task_init() #0 !dbg !236 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !237, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !237
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !237
  store i16 0, i16* %func, align 2, !dbg !238, !tbaa !239
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !240, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !240
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !240
  store i16 0, i16* %n_0, align 2, !dbg !241, !tbaa !242
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243, !tbaa !109
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !243
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 1, !dbg !243
  store i16 0, i16* %n_1, align 2, !dbg !244, !tbaa !245
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !246, !tbaa !109
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !246
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !246
  store i16 0, i16* %n_2, align 2, !dbg !247, !tbaa !248
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249, !tbaa !109
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !249
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !249
  store i16 0, i16* %n_3, align 2, !dbg !250, !tbaa !251
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !252, !tbaa !109
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !252
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !252
  store i16 0, i16* %n_4, align 2, !dbg !253, !tbaa !254
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255, !tbaa !109
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !255
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !255
  store i16 0, i16* %n_5, align 2, !dbg !256, !tbaa !257
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258, !tbaa !109
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !258
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !258
  store i16 0, i16* %n_6, align 2, !dbg !259, !tbaa !260
  ret void, !dbg !261
}

; Function Attrs: nounwind
define dso_local void @task_select_func() #0 !dbg !262 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !263, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !263
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !263
  store i32 4, i32* %seed, align 2, !dbg !264, !tbaa !265
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !266, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !266
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !266
  store i16 0, i16* %iter, align 2, !dbg !267, !tbaa !268
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !269, !tbaa !109
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !269
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !269
  %3 = load i16, i16* %func, align 2, !dbg !270, !tbaa !239
  %inc = add i16 %3, 1, !dbg !270
  store i16 %inc, i16* %func, align 2, !dbg !270, !tbaa !239
  ret void, !dbg !271
}

; Function Attrs: nounwind
define dso_local void @task_bit_count() #0 !dbg !272 {
entry:
  %tmp_seed = alloca i32, align 2
  %temp = alloca i16, align 2
  %0 = bitcast i32* %tmp_seed to i8*, !dbg !276
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !276
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !274, metadata !DIExpression()), !dbg !277
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !278
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !278
  %2 = load i32, i32* %seed, align 2, !dbg !278, !tbaa !265
  store i32 %2, i32* %tmp_seed, align 2, !dbg !277, !tbaa !279
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !280
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !280
  %4 = load i32, i32* %seed2, align 2, !dbg !280, !tbaa !265
  %add = add i32 %4, 13, !dbg !281
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !282, !tbaa !109
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !282
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !282
  store i32 %add, i32* %seed4, align 2, !dbg !283, !tbaa !265
  %6 = bitcast i16* %temp to i8*, !dbg !284
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %6) #6, !dbg !284
  call void @llvm.dbg.declare(metadata i16* %temp, metadata !275, metadata !DIExpression()), !dbg !285
  store i16 0, i16* %temp, align 2, !dbg !285, !tbaa !76
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !286, !tbaa !279
  %tobool = icmp ne i32 %7, 0, !dbg !286
  br i1 %tobool, label %if.then, label %if.end, !dbg !288

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !289

do.body:                                          ; preds = %do.cond, %if.then
  %8 = load i16, i16* %temp, align 2, !dbg !290, !tbaa !76
  %inc = add i16 %8, 1, !dbg !290
  store i16 %inc, i16* %temp, align 2, !dbg !290, !tbaa !76
  br label %do.cond, !dbg !291

do.cond:                                          ; preds = %do.body
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !292, !tbaa !279
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !293, !tbaa !279
  %sub = sub i32 %10, 1, !dbg !294
  %and = and i32 %9, %sub, !dbg !295
  store i32 %and, i32* %tmp_seed, align 2, !dbg !296, !tbaa !279
  %cmp = icmp ne i32 0, %and, !dbg !297
  br i1 %cmp, label %do.body, label %do.end, !dbg !291, !llvm.loop !298

do.end:                                           ; preds = %do.cond
  br label %if.end, !dbg !291

if.end:                                           ; preds = %do.end, %entry
  %11 = load i16, i16* %temp, align 2, !dbg !300, !tbaa !76
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301, !tbaa !109
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !301
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !301
  %13 = load i16, i16* %n_0, align 2, !dbg !302, !tbaa !242
  %add6 = add i16 %13, %11, !dbg !302
  store i16 %add6, i16* %n_0, align 2, !dbg !302, !tbaa !242
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303, !tbaa !109
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !303
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !303
  %15 = load i16, i16* %iter, align 2, !dbg !304, !tbaa !268
  %inc8 = add i16 %15, 1, !dbg !304
  store i16 %inc8, i16* %iter, align 2, !dbg !304, !tbaa !268
  %16 = bitcast i16* %temp to i8*, !dbg !305
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %16) #6, !dbg !305
  %17 = bitcast i32* %tmp_seed to i8*, !dbg !305
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #6, !dbg !305
  ret void, !dbg !305
}

; Function Attrs: nounwind
define dso_local void @task_bitcount() #0 !dbg !306 {
entry:
  %tmp_seed = alloca i32, align 2
  %0 = bitcast i32* %tmp_seed to i8*, !dbg !309
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !309
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !308, metadata !DIExpression()), !dbg !310
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !311
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !311
  %2 = load i32, i32* %seed, align 2, !dbg !311, !tbaa !265
  store i32 %2, i32* %tmp_seed, align 2, !dbg !310, !tbaa !279
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !312, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !312
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !312
  %4 = load i32, i32* %seed2, align 2, !dbg !312, !tbaa !265
  %add = add i32 %4, 13, !dbg !313
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !314, !tbaa !109
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !314
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !314
  store i32 %add, i32* %seed4, align 2, !dbg !315, !tbaa !265
  %6 = load i32, i32* %tmp_seed, align 2, !dbg !316, !tbaa !279
  %and = and i32 %6, -1431655766, !dbg !317
  %shr = lshr i32 %and, 1, !dbg !318
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !319, !tbaa !279
  %and5 = and i32 %7, 1431655765, !dbg !320
  %add6 = add i32 %shr, %and5, !dbg !321
  store i32 %add6, i32* %tmp_seed, align 2, !dbg !322, !tbaa !279
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !323, !tbaa !279
  %and7 = and i32 %8, -858993460, !dbg !324
  %shr8 = lshr i32 %and7, 2, !dbg !325
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !326, !tbaa !279
  %and9 = and i32 %9, 858993459, !dbg !327
  %add10 = add i32 %shr8, %and9, !dbg !328
  store i32 %add10, i32* %tmp_seed, align 2, !dbg !329, !tbaa !279
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !330, !tbaa !279
  %and11 = and i32 %10, -252645136, !dbg !331
  %shr12 = lshr i32 %and11, 4, !dbg !332
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !333, !tbaa !279
  %and13 = and i32 %11, 252645135, !dbg !334
  %add14 = add i32 %shr12, %and13, !dbg !335
  store i32 %add14, i32* %tmp_seed, align 2, !dbg !336, !tbaa !279
  %12 = load i32, i32* %tmp_seed, align 2, !dbg !337, !tbaa !279
  %and15 = and i32 %12, -16711936, !dbg !338
  %shr16 = lshr i32 %and15, 8, !dbg !339
  %13 = load i32, i32* %tmp_seed, align 2, !dbg !340, !tbaa !279
  %and17 = and i32 %13, 16711935, !dbg !341
  %add18 = add i32 %shr16, %and17, !dbg !342
  store i32 %add18, i32* %tmp_seed, align 2, !dbg !343, !tbaa !279
  %14 = load i32, i32* %tmp_seed, align 2, !dbg !344, !tbaa !279
  %and19 = and i32 %14, -65536, !dbg !345
  %shr20 = lshr i32 %and19, 16, !dbg !346
  %15 = load i32, i32* %tmp_seed, align 2, !dbg !347, !tbaa !279
  %and21 = and i32 %15, 65535, !dbg !348
  %add22 = add i32 %shr20, %and21, !dbg !349
  store i32 %add22, i32* %tmp_seed, align 2, !dbg !350, !tbaa !279
  %16 = load i32, i32* %tmp_seed, align 2, !dbg !351, !tbaa !279
  %conv = trunc i32 %16 to i16, !dbg !352
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353, !tbaa !109
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !353
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 1, !dbg !353
  %18 = load i16, i16* %n_1, align 2, !dbg !354, !tbaa !245
  %add24 = add i16 %18, %conv, !dbg !354
  store i16 %add24, i16* %n_1, align 2, !dbg !354, !tbaa !245
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !355, !tbaa !109
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !355
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !355
  %20 = load i16, i16* %iter, align 2, !dbg !356, !tbaa !268
  %inc = add i16 %20, 1, !dbg !356
  store i16 %inc, i16* %iter, align 2, !dbg !356, !tbaa !268
  %21 = bitcast i32* %tmp_seed to i8*, !dbg !357
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #6, !dbg !357
  ret void, !dbg !357
}

; Function Attrs: nounwind
define dso_local i16 @recursive_cnt(i32 %x) #0 !dbg !358 {
entry:
  %x.addr = alloca i32, align 2
  %cnt = alloca i16, align 2
  store i32 %x, i32* %x.addr, align 2, !tbaa !279
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !362, metadata !DIExpression()), !dbg !364
  %0 = bitcast i16* %cnt to i8*, !dbg !365
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !365
  call void @llvm.dbg.declare(metadata i16* %cnt, metadata !363, metadata !DIExpression()), !dbg !366
  %1 = load i32, i32* %x.addr, align 2, !dbg !367, !tbaa !279
  %and = and i32 %1, 15, !dbg !368
  %conv = trunc i32 %and to i16, !dbg !369
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !370
  %2 = load i8, i8* %arrayidx, align 1, !dbg !370, !tbaa !81
  %conv1 = sext i8 %2 to i16, !dbg !370
  store i16 %conv1, i16* %cnt, align 2, !dbg !366, !tbaa !76
  %3 = load i32, i32* %x.addr, align 2, !dbg !371, !tbaa !279
  %shr = lshr i32 %3, 4, !dbg !371
  store i32 %shr, i32* %x.addr, align 2, !dbg !371, !tbaa !279
  %cmp = icmp ne i32 0, %shr, !dbg !373
  br i1 %cmp, label %if.then, label %if.end, !dbg !374

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %x.addr, align 2, !dbg !375, !tbaa !279
  %call = call i16 @recursive_cnt(i32 %4), !dbg !376
  %5 = load i16, i16* %cnt, align 2, !dbg !377, !tbaa !76
  %add = add nsw i16 %5, %call, !dbg !377
  store i16 %add, i16* %cnt, align 2, !dbg !377, !tbaa !76
  br label %if.end, !dbg !378

if.end:                                           ; preds = %if.then, %entry
  %6 = load i16, i16* %cnt, align 2, !dbg !379, !tbaa !76
  %7 = bitcast i16* %cnt to i8*, !dbg !380
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %7) #6, !dbg !380
  ret i16 %6, !dbg !381
}

; Function Attrs: nounwind
define dso_local void @task_ntbl_bitcnt() #0 !dbg !382 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !383, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !383
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !383
  %1 = load i32, i32* %seed, align 2, !dbg !383, !tbaa !265
  %call = call i16 @recursive_cnt(i32 %1), !dbg !384
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !385
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !385
  %3 = load i16, i16* %n_2, align 2, !dbg !386, !tbaa !248
  %add = add i16 %3, %call, !dbg !386
  store i16 %add, i16* %n_2, align 2, !dbg !386, !tbaa !248
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !387, !tbaa !109
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !387
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !387
  %5 = load i32, i32* %seed3, align 2, !dbg !387, !tbaa !265
  %add4 = add i32 %5, 13, !dbg !388
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389, !tbaa !109
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !389
  %seed6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 8, !dbg !389
  store i32 %add4, i32* %seed6, align 2, !dbg !390, !tbaa !265
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !391, !tbaa !109
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !391
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !391
  %8 = load i16, i16* %iter, align 2, !dbg !392, !tbaa !268
  %inc = add i16 %8, 1, !dbg !392
  store i16 %inc, i16* %iter, align 2, !dbg !392, !tbaa !268
  ret void, !dbg !393
}

; Function Attrs: nounwind
define dso_local void @task_ntbl_bitcount() #0 !dbg !394 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !395, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !395
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !395
  %1 = load i32, i32* %seed, align 2, !dbg !395, !tbaa !265
  %and = and i32 %1, 15, !dbg !396
  %conv = trunc i32 %and to i16, !dbg !397
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !398
  %2 = load i8, i8* %arrayidx, align 1, !dbg !398, !tbaa !81
  %conv1 = sext i8 %2 to i16, !dbg !398
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399, !tbaa !109
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !399
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !399
  %4 = load i32, i32* %seed3, align 2, !dbg !399, !tbaa !265
  %and4 = and i32 %4, 240, !dbg !400
  %shr = lshr i32 %and4, 4, !dbg !401
  %conv5 = trunc i32 %shr to i16, !dbg !402
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv5, !dbg !403
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !403, !tbaa !81
  %conv7 = sext i8 %5 to i16, !dbg !403
  %add = add nsw i16 %conv1, %conv7, !dbg !404
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405, !tbaa !109
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !405
  %seed9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !405
  %7 = load i32, i32* %seed9, align 2, !dbg !405, !tbaa !265
  %and10 = and i32 %7, 3840, !dbg !406
  %shr11 = lshr i32 %and10, 8, !dbg !407
  %conv12 = trunc i32 %shr11 to i16, !dbg !408
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv12, !dbg !409
  %8 = load i8, i8* %arrayidx13, align 1, !dbg !409, !tbaa !81
  %conv14 = sext i8 %8 to i16, !dbg !409
  %add15 = add nsw i16 %add, %conv14, !dbg !410
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !411, !tbaa !109
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !411
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !411
  %10 = load i32, i32* %seed17, align 2, !dbg !411, !tbaa !265
  %and18 = and i32 %10, 61440, !dbg !412
  %shr19 = lshr i32 %and18, 12, !dbg !413
  %conv20 = trunc i32 %shr19 to i16, !dbg !414
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv20, !dbg !415
  %11 = load i8, i8* %arrayidx21, align 1, !dbg !415, !tbaa !81
  %conv22 = sext i8 %11 to i16, !dbg !415
  %add23 = add nsw i16 %add15, %conv22, !dbg !416
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417, !tbaa !109
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !417
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !417
  %13 = load i32, i32* %seed25, align 2, !dbg !417, !tbaa !265
  %and26 = and i32 %13, 983040, !dbg !418
  %shr27 = lshr i32 %and26, 16, !dbg !419
  %conv28 = trunc i32 %shr27 to i16, !dbg !420
  %arrayidx29 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv28, !dbg !421
  %14 = load i8, i8* %arrayidx29, align 1, !dbg !421, !tbaa !81
  %conv30 = sext i8 %14 to i16, !dbg !421
  %add31 = add nsw i16 %add23, %conv30, !dbg !422
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !423, !tbaa !109
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !423
  %seed33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 8, !dbg !423
  %16 = load i32, i32* %seed33, align 2, !dbg !423, !tbaa !265
  %and34 = and i32 %16, 15728640, !dbg !424
  %shr35 = lshr i32 %and34, 20, !dbg !425
  %conv36 = trunc i32 %shr35 to i16, !dbg !426
  %arrayidx37 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv36, !dbg !427
  %17 = load i8, i8* %arrayidx37, align 1, !dbg !427, !tbaa !81
  %conv38 = sext i8 %17 to i16, !dbg !427
  %add39 = add nsw i16 %add31, %conv38, !dbg !428
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429, !tbaa !109
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !429
  %seed41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 8, !dbg !429
  %19 = load i32, i32* %seed41, align 2, !dbg !429, !tbaa !265
  %and42 = and i32 %19, 251658240, !dbg !430
  %shr43 = lshr i32 %and42, 24, !dbg !431
  %conv44 = trunc i32 %shr43 to i16, !dbg !432
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv44, !dbg !433
  %20 = load i8, i8* %arrayidx45, align 1, !dbg !433, !tbaa !81
  %conv46 = sext i8 %20 to i16, !dbg !433
  %add47 = add nsw i16 %add39, %conv46, !dbg !434
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !435, !tbaa !109
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !435
  %seed49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 8, !dbg !435
  %22 = load i32, i32* %seed49, align 2, !dbg !435, !tbaa !265
  %and50 = and i32 %22, -268435456, !dbg !436
  %shr51 = lshr i32 %and50, 28, !dbg !437
  %conv52 = trunc i32 %shr51 to i16, !dbg !438
  %arrayidx53 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv52, !dbg !439
  %23 = load i8, i8* %arrayidx53, align 1, !dbg !439, !tbaa !81
  %conv54 = sext i8 %23 to i16, !dbg !439
  %add55 = add nsw i16 %add47, %conv54, !dbg !440
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441, !tbaa !109
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !441
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 3, !dbg !441
  %25 = load i16, i16* %n_3, align 2, !dbg !442, !tbaa !251
  %add57 = add i16 %25, %add55, !dbg !442
  store i16 %add57, i16* %n_3, align 2, !dbg !442, !tbaa !251
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443, !tbaa !109
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !443
  %seed59 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 8, !dbg !443
  %27 = load i32, i32* %seed59, align 2, !dbg !443, !tbaa !265
  %add60 = add i32 %27, 13, !dbg !444
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !445, !tbaa !109
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !445
  %seed62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 8, !dbg !445
  store i32 %add60, i32* %seed62, align 2, !dbg !446, !tbaa !265
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !447, !tbaa !109
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !447
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 9, !dbg !447
  %30 = load i16, i16* %iter, align 2, !dbg !448, !tbaa !268
  %inc = add i16 %30, 1, !dbg !448
  store i16 %inc, i16* %iter, align 2, !dbg !448, !tbaa !268
  ret void, !dbg !449
}

; Function Attrs: nounwind
define dso_local void @task_BW_btbl_bitcount() #0 !dbg !450 {
entry:
  %U = alloca %union.anon, align 2
  %0 = bitcast %union.anon* %U to i8*, !dbg !461
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #6, !dbg !461
  call void @llvm.dbg.declare(metadata %union.anon* %U, metadata !452, metadata !DIExpression()), !dbg !462
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !463, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !463
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !463
  %2 = load i32, i32* %seed, align 2, !dbg !463, !tbaa !265
  %y = bitcast %union.anon* %U to i32*, !dbg !464
  store i32 %2, i32* %y, align 2, !dbg !465, !tbaa !81
  %ch = bitcast %union.anon* %U to [4 x i8]*, !dbg !466
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ch, i16 0, i16 0, !dbg !467
  %3 = load i8, i8* %arrayidx, align 2, !dbg !467, !tbaa !81
  %idxprom = zext i8 %3 to i16, !dbg !468
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !468
  %4 = load i8, i8* %arrayidx1, align 1, !dbg !468, !tbaa !81
  %conv = sext i8 %4 to i16, !dbg !468
  %ch2 = bitcast %union.anon* %U to [4 x i8]*, !dbg !469
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %ch2, i16 0, i16 1, !dbg !470
  %5 = load i8, i8* %arrayidx3, align 1, !dbg !470, !tbaa !81
  %idxprom4 = zext i8 %5 to i16, !dbg !471
  %arrayidx5 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom4, !dbg !471
  %6 = load i8, i8* %arrayidx5, align 1, !dbg !471, !tbaa !81
  %conv6 = sext i8 %6 to i16, !dbg !471
  %add = add nsw i16 %conv, %conv6, !dbg !472
  %ch7 = bitcast %union.anon* %U to [4 x i8]*, !dbg !473
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %ch7, i16 0, i16 3, !dbg !474
  %7 = load i8, i8* %arrayidx8, align 1, !dbg !474, !tbaa !81
  %idxprom9 = zext i8 %7 to i16, !dbg !475
  %arrayidx10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom9, !dbg !475
  %8 = load i8, i8* %arrayidx10, align 1, !dbg !475, !tbaa !81
  %conv11 = sext i8 %8 to i16, !dbg !475
  %add12 = add nsw i16 %add, %conv11, !dbg !476
  %ch13 = bitcast %union.anon* %U to [4 x i8]*, !dbg !477
  %arrayidx14 = getelementptr inbounds [4 x i8], [4 x i8]* %ch13, i16 0, i16 2, !dbg !478
  %9 = load i8, i8* %arrayidx14, align 2, !dbg !478, !tbaa !81
  %idxprom15 = zext i8 %9 to i16, !dbg !479
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom15, !dbg !479
  %10 = load i8, i8* %arrayidx16, align 1, !dbg !479, !tbaa !81
  %conv17 = sext i8 %10 to i16, !dbg !479
  %add18 = add nsw i16 %add12, %conv17, !dbg !480
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481, !tbaa !109
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !481
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 4, !dbg !481
  %12 = load i16, i16* %n_4, align 2, !dbg !482, !tbaa !254
  %add20 = add i16 %12, %add18, !dbg !482
  store i16 %add20, i16* %n_4, align 2, !dbg !482, !tbaa !254
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !483, !tbaa !109
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !483
  %seed22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !483
  %14 = load i32, i32* %seed22, align 2, !dbg !483, !tbaa !265
  %add23 = add i32 %14, 13, !dbg !484
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !485, !tbaa !109
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !485
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !485
  store i32 %add23, i32* %seed25, align 2, !dbg !486, !tbaa !265
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !487, !tbaa !109
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !487
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !487
  %17 = load i16, i16* %iter, align 2, !dbg !488, !tbaa !268
  %inc = add i16 %17, 1, !dbg !488
  store i16 %inc, i16* %iter, align 2, !dbg !488, !tbaa !268
  %18 = bitcast %union.anon* %U to i8*, !dbg !489
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #6, !dbg !489
  ret void, !dbg !489
}

; Function Attrs: nounwind
define dso_local void @task_AR_btbl_bitcount() #0 !dbg !490 {
entry:
  %Ptr = alloca i8*, align 2
  %Accu = alloca i16, align 2
  %0 = bitcast i8** %Ptr to i8*, !dbg !494
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !494
  call void @llvm.dbg.declare(metadata i8** %Ptr, metadata !492, metadata !DIExpression()), !dbg !495
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !496, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !496
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !496
  %2 = bitcast i32* %seed to i8*, !dbg !497
  store i8* %2, i8** %Ptr, align 2, !dbg !495, !tbaa !109
  %3 = bitcast i16* %Accu to i8*, !dbg !498
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %3) #6, !dbg !498
  call void @llvm.dbg.declare(metadata i16* %Accu, metadata !493, metadata !DIExpression()), !dbg !499
  %4 = load i8*, i8** %Ptr, align 2, !dbg !500, !tbaa !109
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1, !dbg !500
  store i8* %incdec.ptr, i8** %Ptr, align 2, !dbg !500, !tbaa !109
  %5 = load i8, i8* %4, align 1, !dbg !501, !tbaa !81
  %idxprom = zext i8 %5 to i16, !dbg !502
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !502
  %6 = load i8, i8* %arrayidx, align 1, !dbg !502, !tbaa !81
  %conv = sext i8 %6 to i16, !dbg !502
  store i16 %conv, i16* %Accu, align 2, !dbg !503, !tbaa !76
  %7 = load i8*, i8** %Ptr, align 2, !dbg !504, !tbaa !109
  %incdec.ptr1 = getelementptr inbounds i8, i8* %7, i32 1, !dbg !504
  store i8* %incdec.ptr1, i8** %Ptr, align 2, !dbg !504, !tbaa !109
  %8 = load i8, i8* %7, align 1, !dbg !505, !tbaa !81
  %idxprom2 = zext i8 %8 to i16, !dbg !506
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom2, !dbg !506
  %9 = load i8, i8* %arrayidx3, align 1, !dbg !506, !tbaa !81
  %conv4 = sext i8 %9 to i16, !dbg !506
  %10 = load i16, i16* %Accu, align 2, !dbg !507, !tbaa !76
  %add = add nsw i16 %10, %conv4, !dbg !507
  store i16 %add, i16* %Accu, align 2, !dbg !507, !tbaa !76
  %11 = load i8*, i8** %Ptr, align 2, !dbg !508, !tbaa !109
  %incdec.ptr5 = getelementptr inbounds i8, i8* %11, i32 1, !dbg !508
  store i8* %incdec.ptr5, i8** %Ptr, align 2, !dbg !508, !tbaa !109
  %12 = load i8, i8* %11, align 1, !dbg !509, !tbaa !81
  %idxprom6 = zext i8 %12 to i16, !dbg !510
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom6, !dbg !510
  %13 = load i8, i8* %arrayidx7, align 1, !dbg !510, !tbaa !81
  %conv8 = sext i8 %13 to i16, !dbg !510
  %14 = load i16, i16* %Accu, align 2, !dbg !511, !tbaa !76
  %add9 = add nsw i16 %14, %conv8, !dbg !511
  store i16 %add9, i16* %Accu, align 2, !dbg !511, !tbaa !76
  %15 = load i8*, i8** %Ptr, align 2, !dbg !512, !tbaa !109
  %16 = load i8, i8* %15, align 1, !dbg !513, !tbaa !81
  %idxprom10 = zext i8 %16 to i16, !dbg !514
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom10, !dbg !514
  %17 = load i8, i8* %arrayidx11, align 1, !dbg !514, !tbaa !81
  %conv12 = sext i8 %17 to i16, !dbg !514
  %18 = load i16, i16* %Accu, align 2, !dbg !515, !tbaa !76
  %add13 = add nsw i16 %18, %conv12, !dbg !515
  store i16 %add13, i16* %Accu, align 2, !dbg !515, !tbaa !76
  %19 = load i16, i16* %Accu, align 2, !dbg !516, !tbaa !76
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !517, !tbaa !109
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !517
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !517
  %21 = load i16, i16* %n_5, align 2, !dbg !518, !tbaa !257
  %add15 = add i16 %21, %19, !dbg !518
  store i16 %add15, i16* %n_5, align 2, !dbg !518, !tbaa !257
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !519, !tbaa !109
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !519
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !519
  %23 = load i32, i32* %seed17, align 2, !dbg !519, !tbaa !265
  %add18 = add i32 %23, 13, !dbg !520
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !521, !tbaa !109
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !521
  %seed20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !521
  store i32 %add18, i32* %seed20, align 2, !dbg !522, !tbaa !265
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !523, !tbaa !109
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !523
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !523
  %26 = load i16, i16* %iter, align 2, !dbg !524, !tbaa !268
  %inc = add i16 %26, 1, !dbg !524
  store i16 %inc, i16* %iter, align 2, !dbg !524, !tbaa !268
  %27 = bitcast i16* %Accu to i8*, !dbg !525
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %27) #6, !dbg !525
  %28 = bitcast i8** %Ptr to i8*, !dbg !525
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %28) #6, !dbg !525
  ret void, !dbg !525
}

; Function Attrs: nounwind
define dso_local void @task_bit_shifter() #0 !dbg !526 {
entry:
  %i = alloca i16, align 2
  %nn = alloca i16, align 2
  %tmp_seed = alloca i32, align 2
  %0 = bitcast i16* %i to i8*, !dbg !531
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %0) #6, !dbg !531
  call void @llvm.dbg.declare(metadata i16* %i, metadata !528, metadata !DIExpression()), !dbg !532
  %1 = bitcast i16* %nn to i8*, !dbg !531
  call void @llvm.lifetime.start.p0i8(i64 2, i8* %1) #6, !dbg !531
  call void @llvm.dbg.declare(metadata i16* %nn, metadata !529, metadata !DIExpression()), !dbg !533
  %2 = bitcast i32* %tmp_seed to i8*, !dbg !534
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #6, !dbg !534
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !530, metadata !DIExpression()), !dbg !535
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !536, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !536
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !536
  %4 = load i32, i32* %seed, align 2, !dbg !536, !tbaa !265
  store i32 %4, i32* %tmp_seed, align 2, !dbg !535, !tbaa !279
  store i16 0, i16* %nn, align 2, !dbg !537, !tbaa !76
  store i16 0, i16* %i, align 2, !dbg !539, !tbaa !76
  br label %for.cond, !dbg !540

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !541, !tbaa !279
  %tobool = icmp ne i32 %5, 0, !dbg !541
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !543

land.rhs:                                         ; preds = %for.cond
  %6 = load i16, i16* %i, align 2, !dbg !544, !tbaa !76
  %cmp = icmp ult i16 %6, 32, !dbg !545
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !546
  br i1 %7, label %for.body, label %for.end, !dbg !547

for.body:                                         ; preds = %land.end
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !548, !tbaa !279
  %and = and i32 %8, 1, !dbg !549
  %conv = trunc i32 %and to i16, !dbg !550
  %9 = load i16, i16* %nn, align 2, !dbg !551, !tbaa !76
  %add = add nsw i16 %9, %conv, !dbg !551
  store i16 %add, i16* %nn, align 2, !dbg !551, !tbaa !76
  br label %for.inc, !dbg !552

for.inc:                                          ; preds = %for.body
  %10 = load i16, i16* %i, align 2, !dbg !553, !tbaa !76
  %inc = add nsw i16 %10, 1, !dbg !553
  store i16 %inc, i16* %i, align 2, !dbg !553, !tbaa !76
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !554, !tbaa !279
  %shr = lshr i32 %11, 1, !dbg !554
  store i32 %shr, i32* %tmp_seed, align 2, !dbg !554, !tbaa !279
  br label %for.cond, !dbg !555, !llvm.loop !556

for.end:                                          ; preds = %land.end
  %12 = load i16, i16* %nn, align 2, !dbg !558, !tbaa !76
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !559, !tbaa !109
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !559
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !559
  %14 = load i16, i16* %n_6, align 2, !dbg !560, !tbaa !260
  %add2 = add i16 %14, %12, !dbg !560
  store i16 %add2, i16* %n_6, align 2, !dbg !560, !tbaa !260
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !561, !tbaa !109
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !561
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !561
  %16 = load i32, i32* %seed4, align 2, !dbg !561, !tbaa !265
  %add5 = add i32 %16, 13, !dbg !562
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563, !tbaa !109
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !563
  %seed7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !563
  store i32 %add5, i32* %seed7, align 2, !dbg !564, !tbaa !265
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !565, !tbaa !109
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !565
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !565
  %19 = load i16, i16* %iter, align 2, !dbg !566, !tbaa !268
  %inc9 = add i16 %19, 1, !dbg !566
  store i16 %inc9, i16* %iter, align 2, !dbg !566, !tbaa !268
  %20 = bitcast i32* %tmp_seed to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #6, !dbg !567
  %21 = bitcast i16* %nn to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %21) #6, !dbg !567
  %22 = bitcast i16* %i to i8*, !dbg !567
  call void @llvm.lifetime.end.p0i8(i64 2, i8* %22) #6, !dbg !567
  ret void, !dbg !567
}

; Function Attrs: nounwind
define dso_local void @task_done() #0 !dbg !568 {
entry:
  call void @exit(i16 0) #7, !dbg !569
  unreachable, !dbg !569
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #5

; Function Attrs: nounwind
define dso_local void @task_commit() #0 !dbg !570 {
entry:
  ret void, !dbg !571
}

; Function Attrs: nounwind
define dso_local i16 @main() #0 !dbg !572 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !575, !tbaa !99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !576, !tbaa !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !577, !tbaa !109
  call void @camel_init(), !dbg !578
  call void @task_init(), !dbg !579
  call void @commit(), !dbg !579
  call void @task_commit(), !dbg !579
  br label %while.body, !dbg !580

while.body:                                       ; preds = %entry, %if.end81
  call void @task_select_func(), !dbg !581
  call void @commit(), !dbg !581
  call void @task_commit(), !dbg !581
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !583, !tbaa !109
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !583
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !583
  %1 = load i16, i16* %func, align 2, !dbg !583, !tbaa !239
  %cmp = icmp eq i16 %1, 1, !dbg !585
  br i1 %cmp, label %if.then, label %if.else, !dbg !586

if.then:                                          ; preds = %while.body
  br label %while.cond1, !dbg !587

while.cond1:                                      ; preds = %while.body4, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !589, !tbaa !109
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !589
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !589
  %3 = load i16, i16* %iter, align 2, !dbg !589, !tbaa !268
  %cmp3 = icmp ult i16 %3, 100, !dbg !590
  br i1 %cmp3, label %while.body4, label %while.end, !dbg !587

while.body4:                                      ; preds = %while.cond1
  call void @task_bit_count(), !dbg !591
  call void @commit(), !dbg !591
  call void @task_commit(), !dbg !591
  br label %while.cond1, !dbg !587, !llvm.loop !593

while.end:                                        ; preds = %while.cond1
  br label %if.end81, !dbg !595

if.else:                                          ; preds = %while.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596, !tbaa !109
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !596
  %func6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !596
  %5 = load i16, i16* %func6, align 2, !dbg !596, !tbaa !239
  %cmp7 = icmp eq i16 %5, 2, !dbg !598
  br i1 %cmp7, label %if.then8, label %if.else15, !dbg !599

if.then8:                                         ; preds = %if.else
  br label %while.cond9, !dbg !600

while.cond9:                                      ; preds = %while.body13, %if.then8
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !602, !tbaa !109
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !602
  %iter11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 9, !dbg !602
  %7 = load i16, i16* %iter11, align 2, !dbg !602, !tbaa !268
  %cmp12 = icmp ult i16 %7, 100, !dbg !603
  br i1 %cmp12, label %while.body13, label %while.end14, !dbg !600

while.body13:                                     ; preds = %while.cond9
  call void @task_bitcount(), !dbg !604
  call void @commit(), !dbg !604
  call void @task_commit(), !dbg !604
  br label %while.cond9, !dbg !600, !llvm.loop !606

while.end14:                                      ; preds = %while.cond9
  br label %if.end80, !dbg !608

if.else15:                                        ; preds = %if.else
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609, !tbaa !109
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !609
  %func17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 7, !dbg !609
  %9 = load i16, i16* %func17, align 2, !dbg !609, !tbaa !239
  %cmp18 = icmp eq i16 %9, 3, !dbg !611
  br i1 %cmp18, label %if.then19, label %if.else26, !dbg !612

if.then19:                                        ; preds = %if.else15
  br label %while.cond20, !dbg !613

while.cond20:                                     ; preds = %while.body24, %if.then19
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615, !tbaa !109
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !615
  %iter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !615
  %11 = load i16, i16* %iter22, align 2, !dbg !615, !tbaa !268
  %cmp23 = icmp ult i16 %11, 100, !dbg !616
  br i1 %cmp23, label %while.body24, label %while.end25, !dbg !613

while.body24:                                     ; preds = %while.cond20
  call void @task_ntbl_bitcnt(), !dbg !617
  call void @commit(), !dbg !617
  call void @task_commit(), !dbg !617
  br label %while.cond20, !dbg !613, !llvm.loop !619

while.end25:                                      ; preds = %while.cond20
  br label %if.end79, !dbg !621

if.else26:                                        ; preds = %if.else15
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !622, !tbaa !109
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !622
  %func28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 7, !dbg !622
  %13 = load i16, i16* %func28, align 2, !dbg !622, !tbaa !239
  %cmp29 = icmp eq i16 %13, 4, !dbg !624
  br i1 %cmp29, label %if.then30, label %if.else37, !dbg !625

if.then30:                                        ; preds = %if.else26
  br label %while.cond31, !dbg !626

while.cond31:                                     ; preds = %while.body35, %if.then30
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !628, !tbaa !109
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !628
  %iter33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 9, !dbg !628
  %15 = load i16, i16* %iter33, align 2, !dbg !628, !tbaa !268
  %cmp34 = icmp ult i16 %15, 100, !dbg !629
  br i1 %cmp34, label %while.body35, label %while.end36, !dbg !626

while.body35:                                     ; preds = %while.cond31
  call void @task_ntbl_bitcount(), !dbg !630
  call void @commit(), !dbg !630
  call void @task_commit(), !dbg !630
  br label %while.cond31, !dbg !626, !llvm.loop !632

while.end36:                                      ; preds = %while.cond31
  br label %if.end78, !dbg !634

if.else37:                                        ; preds = %if.else26
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635, !tbaa !109
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !635
  %func39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 7, !dbg !635
  %17 = load i16, i16* %func39, align 2, !dbg !635, !tbaa !239
  %cmp40 = icmp eq i16 %17, 5, !dbg !637
  br i1 %cmp40, label %if.then41, label %if.else48, !dbg !638

if.then41:                                        ; preds = %if.else37
  br label %while.cond42, !dbg !639

while.cond42:                                     ; preds = %while.body46, %if.then41
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !641, !tbaa !109
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !641
  %iter44 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 9, !dbg !641
  %19 = load i16, i16* %iter44, align 2, !dbg !641, !tbaa !268
  %cmp45 = icmp ult i16 %19, 100, !dbg !642
  br i1 %cmp45, label %while.body46, label %while.end47, !dbg !639

while.body46:                                     ; preds = %while.cond42
  call void @task_BW_btbl_bitcount(), !dbg !643
  call void @commit(), !dbg !643
  call void @task_commit(), !dbg !643
  br label %while.cond42, !dbg !639, !llvm.loop !645

while.end47:                                      ; preds = %while.cond42
  br label %if.end77, !dbg !647

if.else48:                                        ; preds = %if.else37
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648, !tbaa !109
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !648
  %func50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 7, !dbg !648
  %21 = load i16, i16* %func50, align 2, !dbg !648, !tbaa !239
  %cmp51 = icmp eq i16 %21, 6, !dbg !650
  br i1 %cmp51, label %if.then52, label %if.else59, !dbg !651

if.then52:                                        ; preds = %if.else48
  br label %while.cond53, !dbg !652

while.cond53:                                     ; preds = %while.body57, %if.then52
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !654, !tbaa !109
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !654
  %iter55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 9, !dbg !654
  %23 = load i16, i16* %iter55, align 2, !dbg !654, !tbaa !268
  %cmp56 = icmp ult i16 %23, 100, !dbg !655
  br i1 %cmp56, label %while.body57, label %while.end58, !dbg !652

while.body57:                                     ; preds = %while.cond53
  call void @task_AR_btbl_bitcount(), !dbg !656
  call void @commit(), !dbg !656
  call void @task_commit(), !dbg !656
  br label %while.cond53, !dbg !652, !llvm.loop !658

while.end58:                                      ; preds = %while.cond53
  br label %if.end76, !dbg !660

if.else59:                                        ; preds = %if.else48
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !661, !tbaa !109
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !661
  %func61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 7, !dbg !661
  %25 = load i16, i16* %func61, align 2, !dbg !661, !tbaa !239
  %cmp62 = icmp eq i16 %25, 7, !dbg !663
  br i1 %cmp62, label %if.then63, label %if.else70, !dbg !664

if.then63:                                        ; preds = %if.else59
  br label %while.cond64, !dbg !665

while.cond64:                                     ; preds = %while.body68, %if.then63
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !667, !tbaa !109
  %globals65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !667
  %iter66 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals65, i32 0, i32 9, !dbg !667
  %27 = load i16, i16* %iter66, align 2, !dbg !667, !tbaa !268
  %cmp67 = icmp ult i16 %27, 100, !dbg !668
  br i1 %cmp67, label %while.body68, label %while.end69, !dbg !665

while.body68:                                     ; preds = %while.cond64
  call void @task_bit_shifter(), !dbg !669
  call void @commit(), !dbg !669
  call void @task_commit(), !dbg !669
  br label %while.cond64, !dbg !665, !llvm.loop !671

while.end69:                                      ; preds = %while.cond64
  br label %if.end75, !dbg !673

if.else70:                                        ; preds = %if.else59
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674, !tbaa !109
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !674
  %func72 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals71, i32 0, i32 7, !dbg !674
  %29 = load i16, i16* %func72, align 2, !dbg !674, !tbaa !239
  %cmp73 = icmp eq i16 %29, 8, !dbg !676
  br i1 %cmp73, label %if.then74, label %if.end, !dbg !677

if.then74:                                        ; preds = %if.else70
  call void @task_done(), !dbg !678
  br label %if.end, !dbg !680

if.end:                                           ; preds = %if.then74, %if.else70
  br label %if.end75

if.end75:                                         ; preds = %if.end, %while.end69
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %while.end58
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %while.end47
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %while.end36
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %while.end25
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %while.end14
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %while.end
  br label %while.body, !dbg !580, !llvm.loop !681
}

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { naked noinline nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }

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
!105 = !DILocation(line: 106, column: 19, scope: !98)
!106 = !DILocation(line: 106, column: 8, scope: !91)
!107 = !DILocation(line: 107, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !3, line: 106, column: 34)
!109 = !{!110, !110, i64 0}
!110 = !{!"any pointer", !78, i64 0}
!111 = !DILocation(line: 108, column: 16, scope: !108)
!112 = !DILocation(line: 109, column: 5, scope: !108)
!113 = !DILocation(line: 109, column: 21, scope: !114)
!114 = distinct !DILexicalBlock(scope: !98, file: !3, line: 109, column: 15)
!115 = !DILocation(line: 109, column: 26, scope: !114)
!116 = !DILocation(line: 109, column: 15, scope: !98)
!117 = !DILocation(line: 110, column: 14, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !3, line: 109, column: 41)
!119 = !DILocation(line: 111, column: 16, scope: !118)
!120 = !DILocation(line: 112, column: 5, scope: !118)
!121 = !DILocation(line: 113, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !114, file: !3, line: 112, column: 12)
!123 = !DILocation(line: 130, column: 3, scope: !124)
!124 = distinct !DILexicalBlock(scope: !91, file: !3, line: 130, column: 3)
!125 = !{!101, !101, i64 0}
!126 = !{i32 -2146652195}
!127 = !DILocation(line: 132, column: 33, scope: !94)
!128 = !{i32 -2146651959}
!129 = !DILocation(line: 132, column: 33, scope: !91)
!130 = !DILocation(line: 132, column: 51, scope: !91)
!131 = !DILocation(line: 132, column: 65, scope: !96)
!132 = !{i32 -2146651834}
!133 = !DILocation(line: 132, column: 65, scope: !91)
!134 = !DILocation(line: 132, column: 83, scope: !91)
!135 = !DILocation(line: 132, column: 63, scope: !91)
!136 = !DILocation(line: 132, column: 19, scope: !91)
!137 = !DILocation(line: 132, column: 17, scope: !91)
!138 = !DILocation(line: 133, column: 37, scope: !91)
!139 = !DILocation(line: 133, column: 71, scope: !91)
!140 = !DILocation(line: 133, column: 23, scope: !91)
!141 = !DILocation(line: 133, column: 21, scope: !91)
!142 = !DILocation(line: 136, column: 6, scope: !143)
!143 = distinct !DILexicalBlock(scope: !91, file: !3, line: 136, column: 6)
!144 = !DILocation(line: 136, column: 27, scope: !143)
!145 = !DILocation(line: 136, column: 33, scope: !143)
!146 = !{!102, !101, i64 44}
!147 = !DILocation(line: 136, column: 24, scope: !143)
!148 = !DILocation(line: 136, column: 6, scope: !91)
!149 = !DILocation(line: 137, column: 11, scope: !150)
!150 = distinct !DILexicalBlock(scope: !143, file: !3, line: 136, column: 51)
!151 = !DILocation(line: 137, column: 4, scope: !150)
!152 = !DILocation(line: 137, column: 19, scope: !150)
!153 = !DILocation(line: 138, column: 4, scope: !150)
!154 = !DILocation(line: 139, column: 24, scope: !150)
!155 = !DILocation(line: 139, column: 30, scope: !150)
!156 = !DILocation(line: 139, column: 4, scope: !150)
!157 = !DILocation(line: 140, column: 3, scope: !150)
!158 = !DILocation(line: 141, column: 4, scope: !159)
!159 = distinct !DILexicalBlock(scope: !143, file: !3, line: 140, column: 9)
!160 = !DILocation(line: 144, column: 1, scope: !91)
!161 = distinct !DISubprogram(name: "commit", scope: !3, file: !3, line: 195, type: !19, scopeLine: 195, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !162)
!162 = !{!163, !168, !170, !173}
!163 = !DILocalVariable(name: "__x", scope: !164, file: !3, line: 202, type: !6)
!164 = distinct !DILexicalBlock(scope: !165, file: !3, line: 202, column: 45)
!165 = distinct !DILexicalBlock(scope: !166, file: !3, line: 198, column: 39)
!166 = distinct !DILexicalBlock(scope: !167, file: !3, line: 198, column: 14)
!167 = distinct !DILexicalBlock(scope: !161, file: !3, line: 196, column: 8)
!168 = !DILocalVariable(name: "__x", scope: !169, file: !3, line: 202, type: !6)
!169 = distinct !DILexicalBlock(scope: !165, file: !3, line: 202, column: 77)
!170 = !DILocalVariable(name: "__x", scope: !171, file: !3, line: 210, type: !6)
!171 = distinct !DILexicalBlock(scope: !172, file: !3, line: 210, column: 45)
!172 = distinct !DILexicalBlock(scope: !166, file: !3, line: 206, column: 17)
!173 = !DILocalVariable(name: "__x", scope: !174, file: !3, line: 210, type: !6)
!174 = distinct !DILexicalBlock(scope: !172, file: !3, line: 210, column: 77)
!175 = !DILocation(line: 196, column: 5, scope: !161)
!176 = !DILocation(line: 198, column: 20, scope: !166)
!177 = !DILocation(line: 198, column: 25, scope: !166)
!178 = !DILocation(line: 198, column: 14, scope: !167)
!179 = !DILocation(line: 199, column: 17, scope: !165)
!180 = !DILocation(line: 200, column: 19, scope: !165)
!181 = !DILocation(line: 201, column: 29, scope: !165)
!182 = !DILocation(line: 201, column: 35, scope: !165)
!183 = !DILocation(line: 201, column: 12, scope: !165)
!184 = !DILocation(line: 202, column: 45, scope: !164)
!185 = !{i32 -2146651520}
!186 = !DILocation(line: 202, column: 45, scope: !165)
!187 = !DILocation(line: 202, column: 63, scope: !165)
!188 = !DILocation(line: 202, column: 77, scope: !169)
!189 = !{i32 -2146651395}
!190 = !DILocation(line: 202, column: 77, scope: !165)
!191 = !DILocation(line: 202, column: 95, scope: !165)
!192 = !DILocation(line: 202, column: 75, scope: !165)
!193 = !DILocation(line: 202, column: 31, scope: !165)
!194 = !DILocation(line: 202, column: 29, scope: !165)
!195 = !DILocation(line: 203, column: 47, scope: !165)
!196 = !DILocation(line: 203, column: 81, scope: !165)
!197 = !DILocation(line: 203, column: 33, scope: !165)
!198 = !DILocation(line: 203, column: 31, scope: !165)
!199 = !DILocation(line: 204, column: 39, scope: !165)
!200 = !DILocation(line: 204, column: 13, scope: !165)
!201 = !DILocation(line: 204, column: 19, scope: !165)
!202 = !DILocation(line: 204, column: 37, scope: !165)
!203 = !DILocation(line: 205, column: 23, scope: !165)
!204 = !DILocation(line: 206, column: 11, scope: !165)
!205 = !DILocation(line: 207, column: 17, scope: !172)
!206 = !DILocation(line: 208, column: 19, scope: !172)
!207 = !DILocation(line: 209, column: 29, scope: !172)
!208 = !DILocation(line: 209, column: 35, scope: !172)
!209 = !DILocation(line: 209, column: 12, scope: !172)
!210 = !DILocation(line: 210, column: 45, scope: !171)
!211 = !{i32 -2146651263}
!212 = !DILocation(line: 210, column: 45, scope: !172)
!213 = !DILocation(line: 210, column: 63, scope: !172)
!214 = !DILocation(line: 210, column: 77, scope: !174)
!215 = !{i32 -2146651138}
!216 = !DILocation(line: 210, column: 77, scope: !172)
!217 = !DILocation(line: 210, column: 95, scope: !172)
!218 = !DILocation(line: 210, column: 75, scope: !172)
!219 = !DILocation(line: 210, column: 31, scope: !172)
!220 = !DILocation(line: 210, column: 29, scope: !172)
!221 = !DILocation(line: 211, column: 47, scope: !172)
!222 = !DILocation(line: 211, column: 81, scope: !172)
!223 = !DILocation(line: 211, column: 33, scope: !172)
!224 = !DILocation(line: 211, column: 31, scope: !172)
!225 = !DILocation(line: 212, column: 39, scope: !172)
!226 = !DILocation(line: 212, column: 13, scope: !172)
!227 = !DILocation(line: 212, column: 19, scope: !172)
!228 = !DILocation(line: 212, column: 37, scope: !172)
!229 = !DILocation(line: 213, column: 23, scope: !172)
!230 = !DILocation(line: 216, column: 19, scope: !167)
!231 = !DILocation(line: 218, column: 1, scope: !161)
!232 = distinct !DISubprogram(name: "naked", scope: !3, file: !3, line: 243, type: !19, scopeLine: 243, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!233 = !DILocation(line: 244, column: 2, scope: !232)
!234 = !{i32 10112}
!235 = !DILocation(line: 245, column: 1, scope: !232)
!236 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 269, type: !19, scopeLine: 269, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!237 = !DILocation(line: 271, column: 2, scope: !236)
!238 = !DILocation(line: 271, column: 11, scope: !236)
!239 = !{!102, !77, i64 36}
!240 = !DILocation(line: 272, column: 2, scope: !236)
!241 = !DILocation(line: 272, column: 10, scope: !236)
!242 = !{!102, !77, i64 22}
!243 = !DILocation(line: 273, column: 2, scope: !236)
!244 = !DILocation(line: 273, column: 10, scope: !236)
!245 = !{!102, !77, i64 24}
!246 = !DILocation(line: 274, column: 2, scope: !236)
!247 = !DILocation(line: 274, column: 10, scope: !236)
!248 = !{!102, !77, i64 26}
!249 = !DILocation(line: 275, column: 2, scope: !236)
!250 = !DILocation(line: 275, column: 10, scope: !236)
!251 = !{!102, !77, i64 28}
!252 = !DILocation(line: 276, column: 2, scope: !236)
!253 = !DILocation(line: 276, column: 10, scope: !236)
!254 = !{!102, !77, i64 30}
!255 = !DILocation(line: 277, column: 2, scope: !236)
!256 = !DILocation(line: 277, column: 10, scope: !236)
!257 = !{!102, !77, i64 32}
!258 = !DILocation(line: 278, column: 2, scope: !236)
!259 = !DILocation(line: 278, column: 10, scope: !236)
!260 = !{!102, !77, i64 34}
!261 = !DILocation(line: 280, column: 1, scope: !236)
!262 = distinct !DISubprogram(name: "task_select_func", scope: !3, file: !3, line: 282, type: !19, scopeLine: 282, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!263 = !DILocation(line: 284, column: 2, scope: !262)
!264 = !DILocation(line: 284, column: 11, scope: !262)
!265 = !{!102, !104, i64 38}
!266 = !DILocation(line: 285, column: 2, scope: !262)
!267 = !DILocation(line: 285, column: 11, scope: !262)
!268 = !{!102, !77, i64 42}
!269 = !DILocation(line: 286, column: 2, scope: !262)
!270 = !DILocation(line: 286, column: 10, scope: !262)
!271 = !DILocation(line: 287, column: 1, scope: !262)
!272 = distinct !DISubprogram(name: "task_bit_count", scope: !3, file: !3, line: 288, type: !19, scopeLine: 288, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !273)
!273 = !{!274, !275}
!274 = !DILocalVariable(name: "tmp_seed", scope: !272, file: !3, line: 290, type: !7)
!275 = !DILocalVariable(name: "temp", scope: !272, file: !3, line: 292, type: !6)
!276 = !DILocation(line: 290, column: 2, scope: !272)
!277 = !DILocation(line: 290, column: 11, scope: !272)
!278 = !DILocation(line: 290, column: 22, scope: !272)
!279 = !{!104, !104, i64 0}
!280 = !DILocation(line: 291, column: 13, scope: !272)
!281 = !DILocation(line: 291, column: 22, scope: !272)
!282 = !DILocation(line: 291, column: 2, scope: !272)
!283 = !DILocation(line: 291, column: 11, scope: !272)
!284 = !DILocation(line: 292, column: 2, scope: !272)
!285 = !DILocation(line: 292, column: 11, scope: !272)
!286 = !DILocation(line: 293, column: 5, scope: !287)
!287 = distinct !DILexicalBlock(scope: !272, file: !3, line: 293, column: 5)
!288 = !DILocation(line: 293, column: 5, scope: !272)
!289 = !DILocation(line: 293, column: 15, scope: !287)
!290 = !DILocation(line: 294, column: 7, scope: !287)
!291 = !DILocation(line: 294, column: 3, scope: !287)
!292 = !DILocation(line: 295, column: 26, scope: !287)
!293 = !DILocation(line: 295, column: 36, scope: !287)
!294 = !DILocation(line: 295, column: 44, scope: !287)
!295 = !DILocation(line: 295, column: 34, scope: !287)
!296 = !DILocation(line: 295, column: 24, scope: !287)
!297 = !DILocation(line: 295, column: 11, scope: !287)
!298 = distinct !{!298, !289, !299}
!299 = !DILocation(line: 295, column: 48, scope: !287)
!300 = !DILocation(line: 296, column: 13, scope: !272)
!301 = !DILocation(line: 296, column: 2, scope: !272)
!302 = !DILocation(line: 296, column: 10, scope: !272)
!303 = !DILocation(line: 297, column: 2, scope: !272)
!304 = !DILocation(line: 297, column: 10, scope: !272)
!305 = !DILocation(line: 299, column: 1, scope: !272)
!306 = distinct !DISubprogram(name: "task_bitcount", scope: !3, file: !3, line: 300, type: !19, scopeLine: 300, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !307)
!307 = !{!308}
!308 = !DILocalVariable(name: "tmp_seed", scope: !306, file: !3, line: 302, type: !7)
!309 = !DILocation(line: 302, column: 2, scope: !306)
!310 = !DILocation(line: 302, column: 11, scope: !306)
!311 = !DILocation(line: 302, column: 22, scope: !306)
!312 = !DILocation(line: 303, column: 13, scope: !306)
!313 = !DILocation(line: 303, column: 22, scope: !306)
!314 = !DILocation(line: 303, column: 2, scope: !306)
!315 = !DILocation(line: 303, column: 11, scope: !306)
!316 = !DILocation(line: 304, column: 15, scope: !306)
!317 = !DILocation(line: 304, column: 24, scope: !306)
!318 = !DILocation(line: 304, column: 39, scope: !306)
!319 = !DILocation(line: 304, column: 49, scope: !306)
!320 = !DILocation(line: 304, column: 58, scope: !306)
!321 = !DILocation(line: 304, column: 46, scope: !306)
!322 = !DILocation(line: 304, column: 11, scope: !306)
!323 = !DILocation(line: 305, column: 15, scope: !306)
!324 = !DILocation(line: 305, column: 24, scope: !306)
!325 = !DILocation(line: 305, column: 39, scope: !306)
!326 = !DILocation(line: 305, column: 49, scope: !306)
!327 = !DILocation(line: 305, column: 58, scope: !306)
!328 = !DILocation(line: 305, column: 46, scope: !306)
!329 = !DILocation(line: 305, column: 11, scope: !306)
!330 = !DILocation(line: 306, column: 15, scope: !306)
!331 = !DILocation(line: 306, column: 24, scope: !306)
!332 = !DILocation(line: 306, column: 39, scope: !306)
!333 = !DILocation(line: 306, column: 49, scope: !306)
!334 = !DILocation(line: 306, column: 58, scope: !306)
!335 = !DILocation(line: 306, column: 46, scope: !306)
!336 = !DILocation(line: 306, column: 11, scope: !306)
!337 = !DILocation(line: 307, column: 15, scope: !306)
!338 = !DILocation(line: 307, column: 24, scope: !306)
!339 = !DILocation(line: 307, column: 39, scope: !306)
!340 = !DILocation(line: 307, column: 49, scope: !306)
!341 = !DILocation(line: 307, column: 58, scope: !306)
!342 = !DILocation(line: 307, column: 46, scope: !306)
!343 = !DILocation(line: 307, column: 11, scope: !306)
!344 = !DILocation(line: 308, column: 15, scope: !306)
!345 = !DILocation(line: 308, column: 24, scope: !306)
!346 = !DILocation(line: 308, column: 39, scope: !306)
!347 = !DILocation(line: 308, column: 49, scope: !306)
!348 = !DILocation(line: 308, column: 58, scope: !306)
!349 = !DILocation(line: 308, column: 46, scope: !306)
!350 = !DILocation(line: 308, column: 11, scope: !306)
!351 = !DILocation(line: 309, column: 18, scope: !306)
!352 = !DILocation(line: 309, column: 13, scope: !306)
!353 = !DILocation(line: 309, column: 2, scope: !306)
!354 = !DILocation(line: 309, column: 10, scope: !306)
!355 = !DILocation(line: 310, column: 2, scope: !306)
!356 = !DILocation(line: 310, column: 10, scope: !306)
!357 = !DILocation(line: 312, column: 1, scope: !306)
!358 = distinct !DISubprogram(name: "recursive_cnt", scope: !3, file: !3, line: 313, type: !359, scopeLine: 313, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !361)
!359 = !DISubroutineType(types: !360)
!360 = !{!12, !7}
!361 = !{!362, !363}
!362 = !DILocalVariable(name: "x", arg: 1, scope: !358, file: !3, line: 313, type: !7)
!363 = !DILocalVariable(name: "cnt", scope: !358, file: !3, line: 314, type: !12)
!364 = !DILocation(line: 313, column: 28, scope: !358)
!365 = !DILocation(line: 314, column: 2, scope: !358)
!366 = !DILocation(line: 314, column: 6, scope: !358)
!367 = !DILocation(line: 314, column: 23, scope: !358)
!368 = !DILocation(line: 314, column: 25, scope: !358)
!369 = !DILocation(line: 314, column: 17, scope: !358)
!370 = !DILocation(line: 314, column: 12, scope: !358)
!371 = !DILocation(line: 316, column: 15, scope: !372)
!372 = distinct !DILexicalBlock(scope: !358, file: !3, line: 316, column: 6)
!373 = !DILocation(line: 316, column: 9, scope: !372)
!374 = !DILocation(line: 316, column: 6, scope: !358)
!375 = !DILocation(line: 317, column: 24, scope: !372)
!376 = !DILocation(line: 317, column: 10, scope: !372)
!377 = !DILocation(line: 317, column: 7, scope: !372)
!378 = !DILocation(line: 317, column: 3, scope: !372)
!379 = !DILocation(line: 319, column: 9, scope: !358)
!380 = !DILocation(line: 320, column: 1, scope: !358)
!381 = !DILocation(line: 319, column: 2, scope: !358)
!382 = distinct !DISubprogram(name: "task_ntbl_bitcnt", scope: !3, file: !3, line: 321, type: !19, scopeLine: 321, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!383 = !DILocation(line: 323, column: 27, scope: !382)
!384 = !DILocation(line: 323, column: 13, scope: !382)
!385 = !DILocation(line: 323, column: 2, scope: !382)
!386 = !DILocation(line: 323, column: 10, scope: !382)
!387 = !DILocation(line: 324, column: 13, scope: !382)
!388 = !DILocation(line: 324, column: 22, scope: !382)
!389 = !DILocation(line: 324, column: 2, scope: !382)
!390 = !DILocation(line: 324, column: 11, scope: !382)
!391 = !DILocation(line: 325, column: 2, scope: !382)
!392 = !DILocation(line: 325, column: 10, scope: !382)
!393 = !DILocation(line: 327, column: 1, scope: !382)
!394 = distinct !DISubprogram(name: "task_ntbl_bitcount", scope: !3, file: !3, line: 328, type: !19, scopeLine: 328, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!395 = !DILocation(line: 330, column: 26, scope: !394)
!396 = !DILocation(line: 330, column: 35, scope: !394)
!397 = !DILocation(line: 330, column: 19, scope: !394)
!398 = !DILocation(line: 330, column: 13, scope: !394)
!399 = !DILocation(line: 331, column: 16, scope: !394)
!400 = !DILocation(line: 331, column: 25, scope: !394)
!401 = !DILocation(line: 331, column: 41, scope: !394)
!402 = !DILocation(line: 331, column: 9, scope: !394)
!403 = !DILocation(line: 331, column: 3, scope: !394)
!404 = !DILocation(line: 330, column: 59, scope: !394)
!405 = !DILocation(line: 332, column: 16, scope: !394)
!406 = !DILocation(line: 332, column: 25, scope: !394)
!407 = !DILocation(line: 332, column: 41, scope: !394)
!408 = !DILocation(line: 332, column: 9, scope: !394)
!409 = !DILocation(line: 332, column: 3, scope: !394)
!410 = !DILocation(line: 331, column: 49, scope: !394)
!411 = !DILocation(line: 333, column: 16, scope: !394)
!412 = !DILocation(line: 333, column: 25, scope: !394)
!413 = !DILocation(line: 333, column: 41, scope: !394)
!414 = !DILocation(line: 333, column: 9, scope: !394)
!415 = !DILocation(line: 333, column: 3, scope: !394)
!416 = !DILocation(line: 332, column: 49, scope: !394)
!417 = !DILocation(line: 334, column: 16, scope: !394)
!418 = !DILocation(line: 334, column: 25, scope: !394)
!419 = !DILocation(line: 334, column: 41, scope: !394)
!420 = !DILocation(line: 334, column: 9, scope: !394)
!421 = !DILocation(line: 334, column: 3, scope: !394)
!422 = !DILocation(line: 333, column: 49, scope: !394)
!423 = !DILocation(line: 335, column: 16, scope: !394)
!424 = !DILocation(line: 335, column: 25, scope: !394)
!425 = !DILocation(line: 335, column: 41, scope: !394)
!426 = !DILocation(line: 335, column: 9, scope: !394)
!427 = !DILocation(line: 335, column: 3, scope: !394)
!428 = !DILocation(line: 334, column: 49, scope: !394)
!429 = !DILocation(line: 336, column: 16, scope: !394)
!430 = !DILocation(line: 336, column: 25, scope: !394)
!431 = !DILocation(line: 336, column: 41, scope: !394)
!432 = !DILocation(line: 336, column: 9, scope: !394)
!433 = !DILocation(line: 336, column: 3, scope: !394)
!434 = !DILocation(line: 335, column: 49, scope: !394)
!435 = !DILocation(line: 337, column: 16, scope: !394)
!436 = !DILocation(line: 337, column: 25, scope: !394)
!437 = !DILocation(line: 337, column: 41, scope: !394)
!438 = !DILocation(line: 337, column: 9, scope: !394)
!439 = !DILocation(line: 337, column: 3, scope: !394)
!440 = !DILocation(line: 336, column: 49, scope: !394)
!441 = !DILocation(line: 330, column: 2, scope: !394)
!442 = !DILocation(line: 330, column: 10, scope: !394)
!443 = !DILocation(line: 338, column: 13, scope: !394)
!444 = !DILocation(line: 338, column: 22, scope: !394)
!445 = !DILocation(line: 338, column: 2, scope: !394)
!446 = !DILocation(line: 338, column: 11, scope: !394)
!447 = !DILocation(line: 339, column: 2, scope: !394)
!448 = !DILocation(line: 339, column: 10, scope: !394)
!449 = !DILocation(line: 341, column: 1, scope: !394)
!450 = distinct !DISubprogram(name: "task_BW_btbl_bitcount", scope: !3, file: !3, line: 342, type: !19, scopeLine: 342, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !451)
!451 = !{!452}
!452 = !DILocalVariable(name: "U", scope: !450, file: !3, line: 348, type: !453)
!453 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !450, file: !3, line: 344, size: 32, elements: !454)
!454 = !{!455, !459}
!455 = !DIDerivedType(tag: DW_TAG_member, name: "ch", scope: !453, file: !3, line: 346, baseType: !456, size: 32)
!456 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32, elements: !457)
!457 = !{!458}
!458 = !DISubrange(count: 4)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !453, file: !3, line: 347, baseType: !460, size: 32)
!460 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!461 = !DILocation(line: 344, column: 2, scope: !450)
!462 = !DILocation(line: 348, column: 4, scope: !450)
!463 = !DILocation(line: 350, column: 8, scope: !450)
!464 = !DILocation(line: 350, column: 4, scope: !450)
!465 = !DILocation(line: 350, column: 6, scope: !450)
!466 = !DILocation(line: 352, column: 21, scope: !450)
!467 = !DILocation(line: 352, column: 19, scope: !450)
!468 = !DILocation(line: 352, column: 13, scope: !450)
!469 = !DILocation(line: 352, column: 39, scope: !450)
!470 = !DILocation(line: 352, column: 37, scope: !450)
!471 = !DILocation(line: 352, column: 31, scope: !450)
!472 = !DILocation(line: 352, column: 29, scope: !450)
!473 = !DILocation(line: 353, column: 11, scope: !450)
!474 = !DILocation(line: 353, column: 9, scope: !450)
!475 = !DILocation(line: 353, column: 3, scope: !450)
!476 = !DILocation(line: 352, column: 47, scope: !450)
!477 = !DILocation(line: 353, column: 29, scope: !450)
!478 = !DILocation(line: 353, column: 27, scope: !450)
!479 = !DILocation(line: 353, column: 21, scope: !450)
!480 = !DILocation(line: 353, column: 19, scope: !450)
!481 = !DILocation(line: 352, column: 2, scope: !450)
!482 = !DILocation(line: 352, column: 10, scope: !450)
!483 = !DILocation(line: 354, column: 13, scope: !450)
!484 = !DILocation(line: 354, column: 22, scope: !450)
!485 = !DILocation(line: 354, column: 2, scope: !450)
!486 = !DILocation(line: 354, column: 11, scope: !450)
!487 = !DILocation(line: 355, column: 2, scope: !450)
!488 = !DILocation(line: 355, column: 10, scope: !450)
!489 = !DILocation(line: 357, column: 1, scope: !450)
!490 = distinct !DISubprogram(name: "task_AR_btbl_bitcount", scope: !3, file: !3, line: 358, type: !19, scopeLine: 358, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !491)
!491 = !{!492, !493}
!492 = !DILocalVariable(name: "Ptr", scope: !490, file: !3, line: 360, type: !13)
!493 = !DILocalVariable(name: "Accu", scope: !490, file: !3, line: 361, type: !12)
!494 = !DILocation(line: 360, column: 2, scope: !490)
!495 = !DILocation(line: 360, column: 18, scope: !490)
!496 = !DILocation(line: 360, column: 43, scope: !490)
!497 = !DILocation(line: 360, column: 24, scope: !490)
!498 = !DILocation(line: 361, column: 2, scope: !490)
!499 = !DILocation(line: 361, column: 6, scope: !490)
!500 = !DILocation(line: 363, column: 20, scope: !490)
!501 = !DILocation(line: 363, column: 16, scope: !490)
!502 = !DILocation(line: 363, column: 10, scope: !490)
!503 = !DILocation(line: 363, column: 8, scope: !490)
!504 = !DILocation(line: 364, column: 20, scope: !490)
!505 = !DILocation(line: 364, column: 16, scope: !490)
!506 = !DILocation(line: 364, column: 10, scope: !490)
!507 = !DILocation(line: 364, column: 7, scope: !490)
!508 = !DILocation(line: 365, column: 20, scope: !490)
!509 = !DILocation(line: 365, column: 16, scope: !490)
!510 = !DILocation(line: 365, column: 10, scope: !490)
!511 = !DILocation(line: 365, column: 7, scope: !490)
!512 = !DILocation(line: 366, column: 17, scope: !490)
!513 = !DILocation(line: 366, column: 16, scope: !490)
!514 = !DILocation(line: 366, column: 10, scope: !490)
!515 = !DILocation(line: 366, column: 7, scope: !490)
!516 = !DILocation(line: 367, column: 12, scope: !490)
!517 = !DILocation(line: 367, column: 2, scope: !490)
!518 = !DILocation(line: 367, column: 9, scope: !490)
!519 = !DILocation(line: 368, column: 13, scope: !490)
!520 = !DILocation(line: 368, column: 22, scope: !490)
!521 = !DILocation(line: 368, column: 2, scope: !490)
!522 = !DILocation(line: 368, column: 11, scope: !490)
!523 = !DILocation(line: 369, column: 2, scope: !490)
!524 = !DILocation(line: 369, column: 10, scope: !490)
!525 = !DILocation(line: 371, column: 1, scope: !490)
!526 = distinct !DISubprogram(name: "task_bit_shifter", scope: !3, file: !3, line: 372, type: !19, scopeLine: 372, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !527)
!527 = !{!528, !529, !530}
!528 = !DILocalVariable(name: "i", scope: !526, file: !3, line: 374, type: !12)
!529 = !DILocalVariable(name: "nn", scope: !526, file: !3, line: 374, type: !12)
!530 = !DILocalVariable(name: "tmp_seed", scope: !526, file: !3, line: 375, type: !7)
!531 = !DILocation(line: 374, column: 2, scope: !526)
!532 = !DILocation(line: 374, column: 6, scope: !526)
!533 = !DILocation(line: 374, column: 9, scope: !526)
!534 = !DILocation(line: 375, column: 2, scope: !526)
!535 = !DILocation(line: 375, column: 11, scope: !526)
!536 = !DILocation(line: 375, column: 22, scope: !526)
!537 = !DILocation(line: 376, column: 14, scope: !538)
!538 = distinct !DILexicalBlock(scope: !526, file: !3, line: 376, column: 2)
!539 = !DILocation(line: 376, column: 9, scope: !538)
!540 = !DILocation(line: 376, column: 7, scope: !538)
!541 = !DILocation(line: 376, column: 19, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !3, line: 376, column: 2)
!543 = !DILocation(line: 376, column: 28, scope: !542)
!544 = !DILocation(line: 376, column: 32, scope: !542)
!545 = !DILocation(line: 376, column: 34, scope: !542)
!546 = !DILocation(line: 0, scope: !542)
!547 = !DILocation(line: 376, column: 2, scope: !538)
!548 = !DILocation(line: 377, column: 15, scope: !542)
!549 = !DILocation(line: 377, column: 24, scope: !542)
!550 = !DILocation(line: 377, column: 9, scope: !542)
!551 = !DILocation(line: 377, column: 6, scope: !542)
!552 = !DILocation(line: 377, column: 3, scope: !542)
!553 = !DILocation(line: 376, column: 64, scope: !542)
!554 = !DILocation(line: 376, column: 78, scope: !542)
!555 = !DILocation(line: 376, column: 2, scope: !542)
!556 = distinct !{!556, !547, !557}
!557 = !DILocation(line: 377, column: 28, scope: !538)
!558 = !DILocation(line: 378, column: 13, scope: !526)
!559 = !DILocation(line: 378, column: 2, scope: !526)
!560 = !DILocation(line: 378, column: 10, scope: !526)
!561 = !DILocation(line: 379, column: 13, scope: !526)
!562 = !DILocation(line: 379, column: 22, scope: !526)
!563 = !DILocation(line: 379, column: 2, scope: !526)
!564 = !DILocation(line: 379, column: 11, scope: !526)
!565 = !DILocation(line: 381, column: 2, scope: !526)
!566 = !DILocation(line: 381, column: 10, scope: !526)
!567 = !DILocation(line: 383, column: 1, scope: !526)
!568 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 385, type: !19, scopeLine: 385, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!569 = !DILocation(line: 387, column: 2, scope: !568)
!570 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 390, type: !19, scopeLine: 390, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!571 = !DILocation(line: 392, column: 1, scope: !570)
!572 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 394, type: !573, scopeLine: 394, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !4)
!573 = !DISubroutineType(types: !574)
!574 = !{!12}
!575 = !DILocation(line: 396, column: 16, scope: !572)
!576 = !DILocation(line: 397, column: 10, scope: !572)
!577 = !DILocation(line: 398, column: 12, scope: !572)
!578 = !DILocation(line: 399, column: 5, scope: !572)
!579 = !DILocation(line: 401, column: 2, scope: !572)
!580 = !DILocation(line: 403, column: 2, scope: !572)
!581 = !DILocation(line: 405, column: 3, scope: !582)
!582 = distinct !DILexicalBlock(scope: !572, file: !3, line: 403, column: 11)
!583 = !DILocation(line: 407, column: 7, scope: !584)
!584 = distinct !DILexicalBlock(scope: !582, file: !3, line: 407, column: 7)
!585 = !DILocation(line: 407, column: 17, scope: !584)
!586 = !DILocation(line: 407, column: 7, scope: !582)
!587 = !DILocation(line: 409, column: 4, scope: !588)
!588 = distinct !DILexicalBlock(scope: !584, file: !3, line: 407, column: 22)
!589 = !DILocation(line: 409, column: 11, scope: !588)
!590 = !DILocation(line: 409, column: 21, scope: !588)
!591 = !DILocation(line: 411, column: 5, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !3, line: 409, column: 29)
!593 = distinct !{!593, !587, !594}
!594 = !DILocation(line: 413, column: 4, scope: !588)
!595 = !DILocation(line: 415, column: 3, scope: !588)
!596 = !DILocation(line: 415, column: 14, scope: !597)
!597 = distinct !DILexicalBlock(scope: !584, file: !3, line: 415, column: 14)
!598 = !DILocation(line: 415, column: 24, scope: !597)
!599 = !DILocation(line: 415, column: 14, scope: !584)
!600 = !DILocation(line: 417, column: 4, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !3, line: 415, column: 30)
!602 = !DILocation(line: 417, column: 11, scope: !601)
!603 = !DILocation(line: 417, column: 21, scope: !601)
!604 = !DILocation(line: 419, column: 5, scope: !605)
!605 = distinct !DILexicalBlock(scope: !601, file: !3, line: 417, column: 29)
!606 = distinct !{!606, !600, !607}
!607 = !DILocation(line: 421, column: 4, scope: !601)
!608 = !DILocation(line: 423, column: 3, scope: !601)
!609 = !DILocation(line: 423, column: 14, scope: !610)
!610 = distinct !DILexicalBlock(scope: !597, file: !3, line: 423, column: 14)
!611 = !DILocation(line: 423, column: 24, scope: !610)
!612 = !DILocation(line: 423, column: 14, scope: !597)
!613 = !DILocation(line: 425, column: 4, scope: !614)
!614 = distinct !DILexicalBlock(scope: !610, file: !3, line: 423, column: 30)
!615 = !DILocation(line: 425, column: 11, scope: !614)
!616 = !DILocation(line: 425, column: 21, scope: !614)
!617 = !DILocation(line: 427, column: 5, scope: !618)
!618 = distinct !DILexicalBlock(scope: !614, file: !3, line: 425, column: 29)
!619 = distinct !{!619, !613, !620}
!620 = !DILocation(line: 429, column: 4, scope: !614)
!621 = !DILocation(line: 431, column: 3, scope: !614)
!622 = !DILocation(line: 431, column: 14, scope: !623)
!623 = distinct !DILexicalBlock(scope: !610, file: !3, line: 431, column: 14)
!624 = !DILocation(line: 431, column: 24, scope: !623)
!625 = !DILocation(line: 431, column: 14, scope: !610)
!626 = !DILocation(line: 433, column: 4, scope: !627)
!627 = distinct !DILexicalBlock(scope: !623, file: !3, line: 431, column: 30)
!628 = !DILocation(line: 433, column: 11, scope: !627)
!629 = !DILocation(line: 433, column: 21, scope: !627)
!630 = !DILocation(line: 435, column: 5, scope: !631)
!631 = distinct !DILexicalBlock(scope: !627, file: !3, line: 433, column: 29)
!632 = distinct !{!632, !626, !633}
!633 = !DILocation(line: 437, column: 4, scope: !627)
!634 = !DILocation(line: 439, column: 3, scope: !627)
!635 = !DILocation(line: 439, column: 14, scope: !636)
!636 = distinct !DILexicalBlock(scope: !623, file: !3, line: 439, column: 14)
!637 = !DILocation(line: 439, column: 24, scope: !636)
!638 = !DILocation(line: 439, column: 14, scope: !623)
!639 = !DILocation(line: 441, column: 4, scope: !640)
!640 = distinct !DILexicalBlock(scope: !636, file: !3, line: 439, column: 30)
!641 = !DILocation(line: 441, column: 11, scope: !640)
!642 = !DILocation(line: 441, column: 21, scope: !640)
!643 = !DILocation(line: 443, column: 5, scope: !644)
!644 = distinct !DILexicalBlock(scope: !640, file: !3, line: 441, column: 29)
!645 = distinct !{!645, !639, !646}
!646 = !DILocation(line: 445, column: 4, scope: !640)
!647 = !DILocation(line: 447, column: 3, scope: !640)
!648 = !DILocation(line: 447, column: 14, scope: !649)
!649 = distinct !DILexicalBlock(scope: !636, file: !3, line: 447, column: 14)
!650 = !DILocation(line: 447, column: 24, scope: !649)
!651 = !DILocation(line: 447, column: 14, scope: !636)
!652 = !DILocation(line: 449, column: 4, scope: !653)
!653 = distinct !DILexicalBlock(scope: !649, file: !3, line: 447, column: 30)
!654 = !DILocation(line: 449, column: 11, scope: !653)
!655 = !DILocation(line: 449, column: 21, scope: !653)
!656 = !DILocation(line: 451, column: 5, scope: !657)
!657 = distinct !DILexicalBlock(scope: !653, file: !3, line: 449, column: 29)
!658 = distinct !{!658, !652, !659}
!659 = !DILocation(line: 453, column: 4, scope: !653)
!660 = !DILocation(line: 455, column: 3, scope: !653)
!661 = !DILocation(line: 455, column: 14, scope: !662)
!662 = distinct !DILexicalBlock(scope: !649, file: !3, line: 455, column: 14)
!663 = !DILocation(line: 455, column: 24, scope: !662)
!664 = !DILocation(line: 455, column: 14, scope: !649)
!665 = !DILocation(line: 457, column: 4, scope: !666)
!666 = distinct !DILexicalBlock(scope: !662, file: !3, line: 455, column: 30)
!667 = !DILocation(line: 457, column: 11, scope: !666)
!668 = !DILocation(line: 457, column: 21, scope: !666)
!669 = !DILocation(line: 459, column: 5, scope: !670)
!670 = distinct !DILexicalBlock(scope: !666, file: !3, line: 457, column: 29)
!671 = distinct !{!671, !665, !672}
!672 = !DILocation(line: 461, column: 4, scope: !666)
!673 = !DILocation(line: 463, column: 3, scope: !666)
!674 = !DILocation(line: 463, column: 14, scope: !675)
!675 = distinct !DILexicalBlock(scope: !662, file: !3, line: 463, column: 14)
!676 = !DILocation(line: 463, column: 24, scope: !675)
!677 = !DILocation(line: 463, column: 14, scope: !662)
!678 = !DILocation(line: 465, column: 4, scope: !679)
!679 = distinct !DILexicalBlock(scope: !675, file: !3, line: 463, column: 30)
!680 = !DILocation(line: 467, column: 3, scope: !679)
!681 = distinct !{!681, !580, !682}
!682 = !DILocation(line: 468, column: 2, scope: !572)
