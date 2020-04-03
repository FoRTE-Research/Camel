; ModuleID = 'camel_rsa.bc'
source_filename = "../benchmarks/camel_rsa.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [32 x i16], i16, i16, i16, i16, i16, [32 x i16], [4 x i16], i16, i16, i16, [16 x i16], i16, i16, [32 x i16], [32 x i16], i16, i8, i16, i16 }
%struct.pubkey_t = type { [4 x i8], i16 }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !20
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !67
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !13
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !18
@pubkey = internal constant %struct.pubkey_t { [4 x i8] c"EjI\AA", i16 3 }, align 2, !dbg !72
@PLAINTEXT = internal constant [9 x i8] c".RRSSAA.\00", align 1, !dbg !84
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !69

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !99 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !102
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !103
  %conv = zext i8 %0 to i16, !dbg !103
  %or = or i16 %conv, 1, !dbg !103
  %conv1 = trunc i16 %or to i8, !dbg !103
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !103
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !104
  %conv2 = zext i8 %1 to i16, !dbg !104
  %and = and i16 %conv2, -2, !dbg !104
  %conv3 = trunc i16 %and to i8, !dbg !104
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !104
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !105
  %and4 = and i16 %2, -2, !dbg !105
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !105
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !106
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !107
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !108
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !109
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !110
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !113 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !114
  %cmp = icmp eq i16 %0, 1, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !120
  br label %if.end4, !dbg !121

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !122
  %cmp1 = icmp eq i16 %1, 2, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !125

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !126
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !128
  br label %if.end, !dbg !129

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !132
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !132
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !132
  %3 = load i16, i16* %arrayidx, align 2, !dbg !132
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !132, !srcloc !134
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !137, !srcloc !138
  store i16 %4, i16* %__x, align 2, !dbg !137
  %5 = load i16, i16* %__x, align 2, !dbg !137
  store i16 %5, i16* %tmp, align 2, !dbg !137
  %6 = load i16, i16* %tmp, align 2, !dbg !137
  %add = add i16 %6, 2, !dbg !139
  %7 = inttoptr i16 %add to i8*, !dbg !140
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !141, metadata !DIExpression()), !dbg !143
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !143, !srcloc !144
  store i16 %8, i16* %__x5, align 2, !dbg !143
  %9 = load i16, i16* %__x5, align 2, !dbg !143
  store i16 %9, i16* %tmp6, align 2, !dbg !143
  %10 = load i16, i16* %tmp6, align 2, !dbg !143
  %add7 = add i16 %10, 2, !dbg !145
  %sub = sub i16 9216, %add7, !dbg !146
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !147
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !148
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !149
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !149
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !150
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 346, i16 zeroext %13), !dbg !151
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !152
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !153
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !155
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !156
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !156
  %cmp9 = icmp eq i16 %14, %16, !dbg !157
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !158

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !161
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 348, i1 false), !dbg !161
  call void @camel_init(), !dbg !163
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !164
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !165
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

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !171 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !172, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !175, metadata !DIExpression()), !dbg !176
  store i16 8, i16* %message_length, align 2, !dbg !176
  store i16 0, i16* %i, align 2, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !180
  %cmp = icmp slt i16 %0, 4, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %1 = load i16, i16* %i, align 2, !dbg !184
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %1, !dbg !186
  %2 = load i8, i8* %arrayidx, align 1, !dbg !186
  %conv = zext i8 %2 to i16, !dbg !186
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !187
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !187
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !187
  %4 = load i16, i16* %i, align 2, !dbg !188
  %arrayidx1 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %4, !dbg !187
  store i16 %conv, i16* %arrayidx1, align 2, !dbg !189
  br label %for.inc, !dbg !190

for.inc:                                          ; preds = %for.body
  %5 = load i16, i16* %i, align 2, !dbg !191
  %inc = add nsw i16 %5, 1, !dbg !191
  store i16 %inc, i16* %i, align 2, !dbg !191
  br label %for.cond, !dbg !192, !llvm.loop !193

for.end:                                          ; preds = %for.cond
  %6 = load i16, i16* %message_length, align 2, !dbg !195
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !196
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !196
  %message_length3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !196
  store i16 %6, i16* %message_length3, align 2, !dbg !197
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !198
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !198
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !198
  store i16 0, i16* %block_offset, align 2, !dbg !199
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !200
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 5, !dbg !200
  store i16 0, i16* %cyphertext_len, align 2, !dbg !201
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !202
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !202
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 19, !dbg !202
  store i16 0, i16* %check_final, align 2, !dbg !203
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !204
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !204
  store i16 0, i16* %check, align 2, !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_pad() #0 !dbg !207 {
entry:
  %i = alloca i16, align 2
  %zero = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !208, metadata !DIExpression()), !dbg !209
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !210
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !210
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !210
  %1 = load i16, i16* %block_offset, align 2, !dbg !210
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !212
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !212
  %message_length = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !212
  %3 = load i16, i16* %message_length, align 2, !dbg !212
  %cmp = icmp uge i16 %1, %3, !dbg !213
  br i1 %cmp, label %if.then, label %if.end, !dbg !214

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !215
  br label %if.end, !dbg !217

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i16* %zero, metadata !218, metadata !DIExpression()), !dbg !219
  store i16 0, i16* %zero, align 2, !dbg !219
  store i16 0, i16* %i, align 2, !dbg !220
  br label %for.cond, !dbg !222

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i16, i16* %i, align 2, !dbg !223
  %cmp2 = icmp ult i16 %4, 3, !dbg !225
  br i1 %cmp2, label %for.body, label %for.end, !dbg !226

for.body:                                         ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !227
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !227
  %block_offset4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !227
  %6 = load i16, i16* %block_offset4, align 2, !dbg !227
  %7 = load i16, i16* %i, align 2, !dbg !229
  %add = add i16 %6, %7, !dbg !230
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !231
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !231
  %message_length6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !231
  %9 = load i16, i16* %message_length6, align 2, !dbg !231
  %cmp7 = icmp ult i16 %add, %9, !dbg !232
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !233

cond.true:                                        ; preds = %for.body
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !234
  %block_offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 3, !dbg !234
  %11 = load i16, i16* %block_offset9, align 2, !dbg !234
  %12 = load i16, i16* %i, align 2, !dbg !235
  %add10 = add i16 %11, %12, !dbg !236
  %arrayidx = getelementptr inbounds [9 x i8], [9 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !237
  %13 = load i8, i8* %arrayidx, align 1, !dbg !237
  %conv = zext i8 %13 to i16, !dbg !237
  br label %cond.end, !dbg !233

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !233

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv, %cond.true ], [ 255, %cond.false ], !dbg !233
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !238
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !238
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !238
  %15 = load i16, i16* %i, align 2, !dbg !239
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %15, !dbg !238
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %cond.end
  %16 = load i16, i16* %i, align 2, !dbg !242
  %inc = add nsw i16 %16, 1, !dbg !242
  store i16 %inc, i16* %i, align 2, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  store i16 3, i16* %i, align 2, !dbg !246
  br label %for.cond13, !dbg !248

for.cond13:                                       ; preds = %for.inc20, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !249
  %cmp14 = icmp slt i16 %17, 4, !dbg !251
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !252

for.body16:                                       ; preds = %for.cond13
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !253
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !253
  %19 = load i16, i16* %i, align 2, !dbg !255
  %arrayidx19 = getelementptr inbounds [32 x i16], [32 x i16]* %base18, i16 0, i16 %19, !dbg !253
  store i16 1, i16* %arrayidx19, align 2, !dbg !256
  br label %for.inc20, !dbg !257

for.inc20:                                        ; preds = %for.body16
  %20 = load i16, i16* %i, align 2, !dbg !258
  %inc21 = add nsw i16 %20, 1, !dbg !258
  store i16 %inc21, i16* %i, align 2, !dbg !258
  br label %for.cond13, !dbg !259, !llvm.loop !260

for.end22:                                        ; preds = %for.cond13
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !262
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 15, !dbg !262
  %arrayidx24 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 0, !dbg !262
  store i16 1, i16* %arrayidx24, align 2, !dbg !263
  store i16 1, i16* %i, align 2, !dbg !264
  br label %for.cond25, !dbg !266

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %22 = load i16, i16* %i, align 2, !dbg !267
  %cmp26 = icmp slt i16 %22, 4, !dbg !269
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !270

for.body28:                                       ; preds = %for.cond25
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !271
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !271
  %24 = load i16, i16* %i, align 2, !dbg !272
  %arrayidx31 = getelementptr inbounds [32 x i16], [32 x i16]* %block30, i16 0, i16 %24, !dbg !271
  store i16 0, i16* %arrayidx31, align 2, !dbg !273
  br label %for.inc32, !dbg !271

for.inc32:                                        ; preds = %for.body28
  %25 = load i16, i16* %i, align 2, !dbg !274
  %inc33 = add nsw i16 %25, 1, !dbg !274
  store i16 %inc33, i16* %i, align 2, !dbg !274
  br label %for.cond25, !dbg !275, !llvm.loop !276

for.end34:                                        ; preds = %for.cond25
  %26 = load i16, i16* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 1), align 2, !dbg !278
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !279
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !279
  store i16 %26, i16* %exponent, align 2, !dbg !280
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !281
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !281
  %29 = load i16, i16* %block_offset37, align 2, !dbg !282
  %add38 = add i16 %29, 3, !dbg !282
  store i16 %add38, i16* %block_offset37, align 2, !dbg !282
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !283
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 18, !dbg !283
  store i16 0, i16* %check, align 2, !dbg !284
  ret void, !dbg !285
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_exp() #0 !dbg !286 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !287
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !287
  %1 = load i16, i16* %exponent, align 2, !dbg !287
  %and = and i16 %1, 1, !dbg !289
  %tobool = icmp ne i16 %and, 0, !dbg !289
  br i1 %tobool, label %if.then, label %if.else, !dbg !290

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !291
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !291
  %3 = load i16, i16* %exponent2, align 2, !dbg !293
  %shr = lshr i16 %3, 1, !dbg !293
  store i16 %shr, i16* %exponent2, align 2, !dbg !293
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !294
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !294
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 18, !dbg !294
  store i16 0, i16* %check, align 2, !dbg !295
  br label %if.end, !dbg !296

if.else:                                          ; preds = %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !297
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !297
  %exponent5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !297
  %6 = load i16, i16* %exponent5, align 2, !dbg !299
  %shr6 = lshr i16 %6, 1, !dbg !299
  store i16 %shr6, i16* %exponent5, align 2, !dbg !299
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !300
  %check8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !300
  store i16 1, i16* %check8, align 2, !dbg !301
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !302
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block() #0 !dbg !303 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !304
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 19, !dbg !304
  store i16 0, i16* %check_final, align 2, !dbg !305
  ret void, !dbg !306
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block_get_result() #0 !dbg !307 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !308, metadata !DIExpression()), !dbg !309
  store i16 3, i16* %i, align 2, !dbg !310
  br label %for.cond, !dbg !312

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !313
  %cmp = icmp sge i16 %0, 0, !dbg !315
  br i1 %cmp, label %for.body, label %for.end, !dbg !316

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !317
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !317
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !317
  %2 = load i16, i16* %i, align 2, !dbg !319
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !317
  %3 = load i16, i16* %arrayidx, align 2, !dbg !317
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !320
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !320
  %5 = load i16, i16* %i, align 2, !dbg !321
  %arrayidx2 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 %5, !dbg !320
  store i16 %3, i16* %arrayidx2, align 2, !dbg !322
  br label %for.inc, !dbg !323

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !324
  %dec = add nsw i16 %6, -1, !dbg !324
  store i16 %dec, i16* %i, align 2, !dbg !324
  br label %for.cond, !dbg !325, !llvm.loop !326

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !328
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !328
  %8 = load i16, i16* %exponent, align 2, !dbg !328
  %cmp4 = icmp ugt i16 %8, 0, !dbg !330
  br i1 %cmp4, label %if.then, label %if.else, !dbg !331

if.then:                                          ; preds = %for.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !332
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 18, !dbg !332
  store i16 100, i16* %check, align 2, !dbg !334
  br label %if.end24, !dbg !335

if.else:                                          ; preds = %for.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !336
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !336
  %11 = load i16, i16* %cyphertext_len, align 2, !dbg !336
  %add = add i16 %11, 4, !dbg !339
  %cmp7 = icmp ule i16 %add, 16, !dbg !340
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !341

if.then8:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !342
  br label %for.cond9, !dbg !345

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %12 = load i16, i16* %i, align 2, !dbg !346
  %cmp10 = icmp slt i16 %12, 4, !dbg !348
  br i1 %cmp10, label %for.body11, label %for.end23, !dbg !349

for.body11:                                       ; preds = %for.cond9
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !350
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !350
  %14 = load i16, i16* %i, align 2, !dbg !352
  %arrayidx14 = getelementptr inbounds [32 x i16], [32 x i16]* %product13, i16 0, i16 %14, !dbg !350
  %15 = load i16, i16* %arrayidx14, align 2, !dbg !350
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !353
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !353
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !354
  %cyphertext_len17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 5, !dbg !354
  %18 = load i16, i16* %cyphertext_len17, align 2, !dbg !354
  %arrayidx18 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %18, !dbg !353
  store i16 %15, i16* %arrayidx18, align 2, !dbg !355
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !356
  %cyphertext_len20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !356
  %20 = load i16, i16* %cyphertext_len20, align 2, !dbg !357
  %inc = add i16 %20, 1, !dbg !357
  store i16 %inc, i16* %cyphertext_len20, align 2, !dbg !357
  br label %for.inc21, !dbg !358

for.inc21:                                        ; preds = %for.body11
  %21 = load i16, i16* %i, align 2, !dbg !359
  %inc22 = add nsw i16 %21, 1, !dbg !359
  store i16 %inc22, i16* %i, align 2, !dbg !359
  br label %for.cond9, !dbg !360, !llvm.loop !361

for.end23:                                        ; preds = %for.cond9
  br label %if.end, !dbg !363

if.end:                                           ; preds = %for.end23, %if.else
  br label %if.end24

if.end24:                                         ; preds = %if.end, %if.then
  ret void, !dbg !364
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base() #0 !dbg !365 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !366
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 19, !dbg !366
  store i16 1, i16* %check_final, align 2, !dbg !367
  ret void, !dbg !368
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base_get_result() #0 !dbg !369 {
entry:
  %i = alloca i16, align 2
  %b = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !370, metadata !DIExpression()), !dbg !371
  call void @llvm.dbg.declare(metadata i16* %b, metadata !372, metadata !DIExpression()), !dbg !373
  store i16 0, i16* %i, align 2, !dbg !374
  br label %for.cond, !dbg !376

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !377
  %cmp = icmp slt i16 %0, 4, !dbg !379
  br i1 %cmp, label %for.body, label %for.end, !dbg !380

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !381
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !381
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !381
  %2 = load i16, i16* %i, align 2, !dbg !383
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !381
  %3 = load i16, i16* %arrayidx, align 2, !dbg !381
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !384
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !384
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !384
  %5 = load i16, i16* %i, align 2, !dbg !385
  %arrayidx2 = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %5, !dbg !384
  store i16 %3, i16* %arrayidx2, align 2, !dbg !386
  br label %for.inc, !dbg !387

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !388
  %inc = add nsw i16 %6, 1, !dbg !388
  store i16 %inc, i16* %i, align 2, !dbg !388
  br label %for.cond, !dbg !389, !llvm.loop !390

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !392
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !392
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 18, !dbg !392
  store i16 0, i16* %check, align 2, !dbg !393
  ret void, !dbg !394
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_mod() #0 !dbg !395 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !396
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !396
  store i16 0, i16* %digit, align 2, !dbg !397
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !398
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !398
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !398
  store i16 0, i16* %carry, align 2, !dbg !399
  ret void, !dbg !400
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult() #0 !dbg !401 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !402, metadata !DIExpression()), !dbg !403
  call void @llvm.dbg.declare(metadata i16* %a, metadata !404, metadata !DIExpression()), !dbg !405
  call void @llvm.dbg.declare(metadata i16* %b, metadata !406, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata i16* %c, metadata !408, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i16* %p, metadata !412, metadata !DIExpression()), !dbg !413
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !414
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !414
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !414
  %1 = load i16, i16* %carry, align 2, !dbg !414
  store i16 %1, i16* %p, align 2, !dbg !415
  store i16 0, i16* %c, align 2, !dbg !416
  store i16 0, i16* %i, align 2, !dbg !417
  br label %for.cond, !dbg !419

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !420
  %cmp = icmp slt i16 %2, 4, !dbg !422
  br i1 %cmp, label %for.body, label %for.end, !dbg !423

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !424
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !424
  %4 = load i16, i16* %digit, align 2, !dbg !424
  %5 = load i16, i16* %i, align 2, !dbg !427
  %sub = sub i16 %4, %5, !dbg !428
  %cmp2 = icmp uge i16 %sub, 0, !dbg !429
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !430

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !431
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !431
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !431
  %7 = load i16, i16* %digit4, align 2, !dbg !431
  %8 = load i16, i16* %i, align 2, !dbg !432
  %sub5 = sub i16 %7, %8, !dbg !433
  %cmp6 = icmp ult i16 %sub5, 4, !dbg !434
  br i1 %cmp6, label %if.then, label %if.end, !dbg !435

if.then:                                          ; preds = %land.lhs.true
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !436
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !436
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !438
  %digit9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !438
  %11 = load i16, i16* %digit9, align 2, !dbg !438
  %12 = load i16, i16* %i, align 2, !dbg !439
  %sub10 = sub i16 %11, %12, !dbg !440
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %sub10, !dbg !436
  %13 = load i16, i16* %arrayidx, align 2, !dbg !436
  store i16 %13, i16* %a, align 2, !dbg !441
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !442
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !442
  %15 = load i16, i16* %i, align 2, !dbg !443
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 %15, !dbg !442
  %16 = load i16, i16* %arrayidx12, align 2, !dbg !442
  store i16 %16, i16* %b, align 2, !dbg !444
  %17 = load i16, i16* %a, align 2, !dbg !445
  %18 = load i16, i16* %b, align 2, !dbg !446
  %mul = mul i16 %17, %18, !dbg !447
  store i16 %mul, i16* %dp, align 2, !dbg !448
  %19 = load i16, i16* %dp, align 2, !dbg !449
  %shr = lshr i16 %19, 8, !dbg !450
  %20 = load i16, i16* %c, align 2, !dbg !451
  %add = add i16 %20, %shr, !dbg !451
  store i16 %add, i16* %c, align 2, !dbg !451
  %21 = load i16, i16* %dp, align 2, !dbg !452
  %and = and i16 %21, 255, !dbg !453
  %22 = load i16, i16* %p, align 2, !dbg !454
  %add13 = add i16 %22, %and, !dbg !454
  store i16 %add13, i16* %p, align 2, !dbg !454
  br label %if.end, !dbg !455

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !456

for.inc:                                          ; preds = %if.end
  %23 = load i16, i16* %i, align 2, !dbg !457
  %inc = add nsw i16 %23, 1, !dbg !457
  store i16 %inc, i16* %i, align 2, !dbg !457
  br label %for.cond, !dbg !458, !llvm.loop !459

for.end:                                          ; preds = %for.cond
  %24 = load i16, i16* %p, align 2, !dbg !461
  %shr14 = lshr i16 %24, 8, !dbg !462
  %25 = load i16, i16* %c, align 2, !dbg !463
  %add15 = add i16 %25, %shr14, !dbg !463
  store i16 %add15, i16* %c, align 2, !dbg !463
  %26 = load i16, i16* %p, align 2, !dbg !464
  %and16 = and i16 %26, 255, !dbg !464
  store i16 %and16, i16* %p, align 2, !dbg !464
  %27 = load i16, i16* %p, align 2, !dbg !465
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !466
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !466
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !466
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !467
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !467
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !467
  %30 = load i16, i16* %digit19, align 2, !dbg !467
  %arrayidx20 = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %30, !dbg !466
  store i16 %27, i16* %arrayidx20, align 2, !dbg !468
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !469
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !469
  %print_which = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 17, !dbg !469
  store i8 0, i8* %print_which, align 2, !dbg !470
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !471
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !471
  %digit23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 8, !dbg !471
  %33 = load i16, i16* %digit23, align 2, !dbg !472
  %inc24 = add i16 %33, 1, !dbg !472
  store i16 %inc24, i16* %digit23, align 2, !dbg !472
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !473
  %digit26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 8, !dbg !473
  %35 = load i16, i16* %digit26, align 2, !dbg !473
  %cmp27 = icmp ult i16 %35, 8, !dbg !475
  br i1 %cmp27, label %if.then28, label %if.else, !dbg !476

if.then28:                                        ; preds = %for.end
  %36 = load i16, i16* %c, align 2, !dbg !477
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !479
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !479
  %carry30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 9, !dbg !479
  store i16 %36, i16* %carry30, align 2, !dbg !480
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !481
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 18, !dbg !481
  store i16 0, i16* %check, align 2, !dbg !482
  br label %if.end34, !dbg !483

if.else:                                          ; preds = %for.end
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !484
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 18, !dbg !484
  store i16 1, i16* %check33, align 2, !dbg !486
  br label %if.end34

if.end34:                                         ; preds = %if.else, %if.then28
  ret void, !dbg !487
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_digits() #0 !dbg !488 {
entry:
  %d = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %d, metadata !489, metadata !DIExpression()), !dbg !490
  store i16 8, i16* %d, align 2, !dbg !491
  br label %do.body, !dbg !492

do.body:                                          ; preds = %land.end, %entry
  %0 = load i16, i16* %d, align 2, !dbg !493
  %dec = add nsw i16 %0, -1, !dbg !493
  store i16 %dec, i16* %d, align 2, !dbg !493
  br label %do.cond, !dbg !495

do.cond:                                          ; preds = %do.body
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !496
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !496
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !496
  %2 = load i16, i16* %d, align 2, !dbg !497
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !496
  %3 = load i16, i16* %arrayidx, align 2, !dbg !496
  %cmp = icmp eq i16 %3, 0, !dbg !498
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !499

land.rhs:                                         ; preds = %do.cond
  %4 = load i16, i16* %d, align 2, !dbg !500
  %cmp1 = icmp sgt i16 %4, 0, !dbg !501
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %5 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ], !dbg !502
  br i1 %5, label %do.body, label %do.end, !dbg !495, !llvm.loop !503

do.end:                                           ; preds = %land.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !505
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !505
  %product3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !505
  %7 = load i16, i16* %d, align 2, !dbg !507
  %arrayidx4 = getelementptr inbounds [32 x i16], [32 x i16]* %product3, i16 0, i16 %7, !dbg !505
  %8 = load i16, i16* %arrayidx4, align 2, !dbg !505
  %cmp5 = icmp eq i16 %8, 0, !dbg !508
  br i1 %cmp5, label %if.then, label %if.end, !dbg !509

if.then:                                          ; preds = %do.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !510
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !510
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 18, !dbg !510
  store i16 0, i16* %check, align 2, !dbg !512
  br label %if.end, !dbg !513

if.end:                                           ; preds = %if.then, %do.end
  %10 = load i16, i16* %d, align 2, !dbg !514
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !515
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !515
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !515
  store i16 %10, i16* %reduce, align 2, !dbg !516
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !517
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !517
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 18, !dbg !517
  store i16 1, i16* %check9, align 2, !dbg !518
  ret void, !dbg !519
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalizable() #0 !dbg !520 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %normalizable = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !521, metadata !DIExpression()), !dbg !522
  call void @llvm.dbg.declare(metadata i16* %m, metadata !523, metadata !DIExpression()), !dbg !524
  call void @llvm.dbg.declare(metadata i16* %n, metadata !525, metadata !DIExpression()), !dbg !526
  call void @llvm.dbg.declare(metadata i16* %d, metadata !527, metadata !DIExpression()), !dbg !528
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !529, metadata !DIExpression()), !dbg !530
  store i8 1, i8* %normalizable, align 1, !dbg !530
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !531
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !531
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !531
  %1 = load i16, i16* %reduce, align 2, !dbg !531
  %add = add i16 %1, 1, !dbg !532
  %sub = sub i16 %add, 4, !dbg !533
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !534
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !534
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !534
  store i16 %sub, i16* %offset, align 2, !dbg !535
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !536
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !536
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !536
  %4 = load i16, i16* %reduce3, align 2, !dbg !536
  store i16 %4, i16* %i, align 2, !dbg !538
  br label %for.cond, !dbg !539

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i16, i16* %i, align 2, !dbg !540
  %cmp = icmp sge i16 %5, 0, !dbg !542
  br i1 %cmp, label %for.body, label %for.end, !dbg !543

for.body:                                         ; preds = %for.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !544
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !544
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !544
  %7 = load i16, i16* %i, align 2, !dbg !547
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %7, !dbg !544
  %8 = load i16, i16* %arrayidx, align 2, !dbg !544
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !548
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !548
  %10 = load i16, i16* %i, align 2, !dbg !549
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !550
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !550
  %offset7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !550
  %12 = load i16, i16* %offset7, align 2, !dbg !550
  %sub8 = sub i16 %10, %12, !dbg !551
  %arrayidx9 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %sub8, !dbg !548
  %13 = load i16, i16* %arrayidx9, align 2, !dbg !548
  %cmp10 = icmp ugt i16 %8, %13, !dbg !552
  br i1 %cmp10, label %if.then, label %if.else, !dbg !553

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !554

if.else:                                          ; preds = %for.body
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !556
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !556
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !556
  %15 = load i16, i16* %i, align 2, !dbg !558
  %arrayidx13 = getelementptr inbounds [32 x i16], [32 x i16]* %product12, i16 0, i16 %15, !dbg !556
  %16 = load i16, i16* %arrayidx13, align 2, !dbg !556
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !559
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !559
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !559
  %18 = load i16, i16* %i, align 2, !dbg !560
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !561
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !561
  %offset17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 12, !dbg !561
  %20 = load i16, i16* %offset17, align 2, !dbg !561
  %sub18 = sub i16 %18, %20, !dbg !562
  %arrayidx19 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus15, i16 0, i16 %sub18, !dbg !559
  %21 = load i16, i16* %arrayidx19, align 2, !dbg !559
  %cmp20 = icmp ult i16 %16, %21, !dbg !563
  br i1 %cmp20, label %if.then21, label %if.end, !dbg !564

if.then21:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !565
  br label %for.end, !dbg !567

if.end:                                           ; preds = %if.else
  br label %if.end22

if.end22:                                         ; preds = %if.end
  br label %for.inc, !dbg !568

for.inc:                                          ; preds = %if.end22
  %22 = load i16, i16* %i, align 2, !dbg !569
  %dec = add nsw i16 %22, -1, !dbg !569
  store i16 %dec, i16* %i, align 2, !dbg !569
  br label %for.cond, !dbg !570, !llvm.loop !571

for.end:                                          ; preds = %if.then21, %if.then, %for.cond
  %23 = load i8, i8* %normalizable, align 1, !dbg !573
  %tobool = trunc i8 %23 to i1, !dbg !573
  br i1 %tobool, label %if.end28, label %land.lhs.true, !dbg !575

land.lhs.true:                                    ; preds = %for.end
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !576
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !576
  %reduce24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 10, !dbg !576
  %25 = load i16, i16* %reduce24, align 2, !dbg !576
  %cmp25 = icmp eq i16 %25, 3, !dbg !577
  br i1 %cmp25, label %if.then26, label %if.end28, !dbg !578

if.then26:                                        ; preds = %land.lhs.true
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !579
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !579
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 18, !dbg !579
  store i16 2, i16* %check, align 2, !dbg !581
  br label %if.end28, !dbg !582

if.end28:                                         ; preds = %if.then26, %land.lhs.true, %for.end
  %27 = load i8, i8* %normalizable, align 1, !dbg !583
  %tobool29 = trunc i8 %27 to i1, !dbg !583
  br i1 %tobool29, label %if.then30, label %if.else33, !dbg !585

if.then30:                                        ; preds = %if.end28
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !586
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 18, !dbg !586
  store i16 0, i16* %check32, align 2, !dbg !588
  br label %if.end36, !dbg !589

if.else33:                                        ; preds = %if.end28
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !590
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !590
  %check35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 18, !dbg !590
  store i16 1, i16* %check35, align 2, !dbg !592
  br label %if.end36

if.end36:                                         ; preds = %if.else33, %if.then30
  ret void, !dbg !593
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalize() #0 !dbg !594 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %m, metadata !595, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.declare(metadata i16* %n, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i16* %d, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i16* %s, metadata !601, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i16* %i, metadata !605, metadata !DIExpression()), !dbg !606
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !607
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !607
  %print_which = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 17, !dbg !607
  store i8 0, i8* %print_which, align 2, !dbg !608
  store i16 0, i16* %borrow, align 2, !dbg !609
  store i16 0, i16* %i, align 2, !dbg !610
  br label %for.cond, !dbg !612

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !613
  %cmp = icmp slt i16 %1, 4, !dbg !615
  br i1 %cmp, label %for.body, label %for.end, !dbg !616

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !617
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !617
  %3 = load i16, i16* %i, align 2, !dbg !619
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !620
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !620
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 12, !dbg !620
  %5 = load i16, i16* %offset, align 2, !dbg !620
  %add = add i16 %3, %5, !dbg !621
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %add, !dbg !617
  %6 = load i16, i16* %arrayidx, align 2, !dbg !617
  store i16 %6, i16* %m, align 2, !dbg !622
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !623
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !623
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !623
  %8 = load i16, i16* %i, align 2, !dbg !624
  %arrayidx4 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %8, !dbg !623
  %9 = load i16, i16* %arrayidx4, align 2, !dbg !623
  store i16 %9, i16* %n, align 2, !dbg !625
  %10 = load i16, i16* %n, align 2, !dbg !626
  %11 = load i16, i16* %borrow, align 2, !dbg !627
  %add5 = add i16 %10, %11, !dbg !628
  store i16 %add5, i16* %s, align 2, !dbg !629
  %12 = load i16, i16* %m, align 2, !dbg !630
  %13 = load i16, i16* %s, align 2, !dbg !632
  %cmp6 = icmp ult i16 %12, %13, !dbg !633
  br i1 %cmp6, label %if.then, label %if.else, !dbg !634

if.then:                                          ; preds = %for.body
  %14 = load i16, i16* %m, align 2, !dbg !635
  %add7 = add i16 %14, 256, !dbg !635
  store i16 %add7, i16* %m, align 2, !dbg !635
  store i16 1, i16* %borrow, align 2, !dbg !637
  br label %if.end, !dbg !638

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !639
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load i16, i16* %m, align 2, !dbg !641
  %16 = load i16, i16* %s, align 2, !dbg !642
  %sub = sub i16 %15, %16, !dbg !643
  store i16 %sub, i16* %d, align 2, !dbg !644
  %17 = load i16, i16* %d, align 2, !dbg !645
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !646
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !646
  %product9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 0, !dbg !646
  %19 = load i16, i16* %i, align 2, !dbg !647
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !648
  %offset11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !648
  %21 = load i16, i16* %offset11, align 2, !dbg !648
  %add12 = add i16 %19, %21, !dbg !649
  %arrayidx13 = getelementptr inbounds [32 x i16], [32 x i16]* %product9, i16 0, i16 %add12, !dbg !646
  store i16 %17, i16* %arrayidx13, align 2, !dbg !650
  br label %for.inc, !dbg !651

for.inc:                                          ; preds = %if.end
  %22 = load i16, i16* %i, align 2, !dbg !652
  %inc = add nsw i16 %22, 1, !dbg !652
  store i16 %inc, i16* %i, align 2, !dbg !652
  br label %for.cond, !dbg !653, !llvm.loop !654

for.end:                                          ; preds = %for.cond
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !656
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !656
  %offset15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 12, !dbg !656
  %24 = load i16, i16* %offset15, align 2, !dbg !656
  %cmp16 = icmp ugt i16 %24, 0, !dbg !658
  br i1 %cmp16, label %if.then17, label %if.else18, !dbg !659

if.then17:                                        ; preds = %for.end
  br label %if.end20, !dbg !660

if.else18:                                        ; preds = %for.end
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !662
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !662
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 18, !dbg !662
  store i16 2, i16* %check, align 2, !dbg !664
  br label %if.end20

if.end20:                                         ; preds = %if.else18, %if.then17
  ret void, !dbg !665
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_n_divisor() #0 !dbg !666 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !667
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !667
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !667
  %arrayidx = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 3, !dbg !667
  %1 = load i16, i16* %arrayidx, align 2, !dbg !667
  %shl = shl i16 %1, 8, !dbg !668
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !669
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !669
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !669
  %arrayidx3 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus2, i16 0, i16 2, !dbg !669
  %3 = load i16, i16* %arrayidx3, align 2, !dbg !669
  %add = add i16 %shl, %3, !dbg !670
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !671
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !671
  store i16 %add, i16* %n_div, align 2, !dbg !672
  ret void, !dbg !673
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_quotient() #0 !dbg !674 {
entry:
  %m_n = alloca i16, align 2
  %q = alloca i16, align 2
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i16* %m_n, metadata !675, metadata !DIExpression()), !dbg !676
  call void @llvm.dbg.declare(metadata i16* %q, metadata !677, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !679, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !681, metadata !DIExpression()), !dbg !682
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !683
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !683
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !683
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !685
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !685
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !685
  %2 = load i16, i16* %reduce, align 2, !dbg !685
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !683
  %3 = load i16, i16* %arrayidx, align 2, !dbg !683
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !686
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !686
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !686
  %arrayidx3 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 3, !dbg !686
  %5 = load i16, i16* %arrayidx3, align 2, !dbg !686
  %cmp = icmp eq i16 %3, %5, !dbg !687
  br i1 %cmp, label %if.then, label %if.else, !dbg !688

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !689
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !689
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 16, !dbg !689
  store i16 255, i16* %quotient, align 2, !dbg !691
  br label %if.end, !dbg !692

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !693
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !693
  %product6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !693
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !695
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !695
  %reduce8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !695
  %9 = load i16, i16* %reduce8, align 2, !dbg !695
  %arrayidx9 = getelementptr inbounds [32 x i16], [32 x i16]* %product6, i16 0, i16 %9, !dbg !693
  %10 = load i16, i16* %arrayidx9, align 2, !dbg !693
  %shl = shl i16 %10, 8, !dbg !696
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !697
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !697
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !697
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !698
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !698
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !698
  %13 = load i16, i16* %reduce13, align 2, !dbg !698
  %sub = sub i16 %13, 1, !dbg !699
  %arrayidx14 = getelementptr inbounds [32 x i16], [32 x i16]* %product11, i16 0, i16 %sub, !dbg !697
  %14 = load i16, i16* %arrayidx14, align 2, !dbg !697
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !700
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !700
  %modulus16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 7, !dbg !700
  %arrayidx17 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus16, i16 0, i16 3, !dbg !700
  %16 = load i16, i16* %arrayidx17, align 2, !dbg !700
  %div = udiv i16 %14, %16, !dbg !701
  %add = add i16 %shl, %div, !dbg !702
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !703
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !703
  %quotient19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !703
  store i16 %add, i16* %quotient19, align 2, !dbg !704
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !705
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !705
  %product21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 0, !dbg !705
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !706
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !706
  %reduce23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 10, !dbg !706
  %20 = load i16, i16* %reduce23, align 2, !dbg !706
  %arrayidx24 = getelementptr inbounds [32 x i16], [32 x i16]* %product21, i16 0, i16 %20, !dbg !705
  %21 = load i16, i16* %arrayidx24, align 2, !dbg !705
  %conv = zext i16 %21 to i32, !dbg !707
  %shl25 = shl i32 %conv, 16, !dbg !708
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !709
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !709
  %product27 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 0, !dbg !709
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !710
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !710
  %reduce29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !710
  %24 = load i16, i16* %reduce29, align 2, !dbg !710
  %sub30 = sub i16 %24, 1, !dbg !711
  %arrayidx31 = getelementptr inbounds [32 x i16], [32 x i16]* %product27, i16 0, i16 %sub30, !dbg !709
  %25 = load i16, i16* %arrayidx31, align 2, !dbg !709
  %shl32 = shl i16 %25, 8, !dbg !712
  %conv33 = zext i16 %shl32 to i32, !dbg !713
  %add34 = add i32 %shl25, %conv33, !dbg !714
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !715
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !715
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !715
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !716
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !716
  %reduce38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 10, !dbg !716
  %28 = load i16, i16* %reduce38, align 2, !dbg !716
  %sub39 = sub i16 %28, 2, !dbg !717
  %arrayidx40 = getelementptr inbounds [32 x i16], [32 x i16]* %product36, i16 0, i16 %sub39, !dbg !715
  %29 = load i16, i16* %arrayidx40, align 2, !dbg !715
  %conv41 = zext i16 %29 to i32, !dbg !715
  %add42 = add i32 %add34, %conv41, !dbg !718
  store i32 %add42, i32* %n_q, align 2, !dbg !719
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !720
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !720
  %quotient44 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 16, !dbg !720
  %31 = load i16, i16* %quotient44, align 2, !dbg !721
  %inc = add i16 %31, 1, !dbg !721
  store i16 %inc, i16* %quotient44, align 2, !dbg !721
  br label %do.body, !dbg !722

do.body:                                          ; preds = %do.cond, %if.end
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !723
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !723
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !723
  %33 = load i16, i16* %quotient46, align 2, !dbg !725
  %dec = add i16 %33, -1, !dbg !725
  store i16 %dec, i16* %quotient46, align 2, !dbg !725
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !726
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !726
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 13, !dbg !726
  %35 = load i16, i16* %n_div, align 2, !dbg !726
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !727
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !727
  %quotient49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 16, !dbg !727
  %37 = load i16, i16* %quotient49, align 2, !dbg !727
  %call = call i16 bitcast (i16 (...)* @mult16 to i16 (i16, i16)*)(i16 %35, i16 %37), !dbg !728
  %conv50 = sext i16 %call to i32, !dbg !728
  store i32 %conv50, i32* %qn, align 2, !dbg !729
  br label %do.cond, !dbg !730

do.cond:                                          ; preds = %do.body
  %38 = load i32, i32* %qn, align 2, !dbg !731
  %39 = load i32, i32* %n_q, align 2, !dbg !732
  %cmp51 = icmp ugt i32 %38, %39, !dbg !733
  br i1 %cmp51, label %do.body, label %do.end, !dbg !730, !llvm.loop !734

do.end:                                           ; preds = %do.cond
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !736
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !736
  %reduce54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 10, !dbg !736
  %41 = load i16, i16* %reduce54, align 2, !dbg !737
  %dec55 = add i16 %41, -1, !dbg !737
  store i16 %dec55, i16* %reduce54, align 2, !dbg !737
  ret void, !dbg !738
}

declare dso_local i16 @mult16(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_multiply() #0 !dbg !739 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !740, metadata !DIExpression()), !dbg !741
  call void @llvm.dbg.declare(metadata i16* %m, metadata !742, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.declare(metadata i16* %n, metadata !744, metadata !DIExpression()), !dbg !745
  call void @llvm.dbg.declare(metadata i16* %c, metadata !746, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !748, metadata !DIExpression()), !dbg !749
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !750
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !750
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !750
  %1 = load i16, i16* %reduce, align 2, !dbg !750
  %add = add i16 %1, 1, !dbg !751
  %sub = sub i16 %add, 4, !dbg !752
  store i16 %sub, i16* %offset, align 2, !dbg !753
  store i16 0, i16* %i, align 2, !dbg !754
  br label %for.cond, !dbg !756

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !757
  %3 = load i16, i16* %offset, align 2, !dbg !759
  %cmp = icmp ult i16 %2, %3, !dbg !760
  br i1 %cmp, label %for.body, label %for.end, !dbg !761

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !762
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !762
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !762
  %5 = load i16, i16* %i, align 2, !dbg !764
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product2, i16 0, i16 %5, !dbg !762
  store i16 0, i16* %arrayidx, align 2, !dbg !765
  br label %for.inc, !dbg !766

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !767
  %inc = add nsw i16 %6, 1, !dbg !767
  store i16 %inc, i16* %i, align 2, !dbg !767
  br label %for.cond, !dbg !768, !llvm.loop !769

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !771
  %7 = load i16, i16* %offset, align 2, !dbg !772
  store i16 %7, i16* %i, align 2, !dbg !774
  br label %for.cond2, !dbg !775

for.cond2:                                        ; preds = %for.inc17, %for.end
  %8 = load i16, i16* %i, align 2, !dbg !776
  %cmp3 = icmp slt i16 %8, 8, !dbg !778
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !779

for.body4:                                        ; preds = %for.cond2
  %9 = load i16, i16* %c, align 2, !dbg !780
  store i16 %9, i16* %m, align 2, !dbg !782
  %10 = load i16, i16* %i, align 2, !dbg !783
  %11 = load i16, i16* %offset, align 2, !dbg !785
  %add5 = add i16 %11, 4, !dbg !786
  %cmp6 = icmp ult i16 %10, %add5, !dbg !787
  br i1 %cmp6, label %if.then, label %if.else, !dbg !788

if.then:                                          ; preds = %for.body4
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !789
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !789
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !789
  %13 = load i16, i16* %i, align 2, !dbg !791
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !792
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !792
  %offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 12, !dbg !792
  %15 = load i16, i16* %offset9, align 2, !dbg !792
  %sub10 = sub i16 %13, %15, !dbg !793
  %arrayidx11 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %sub10, !dbg !789
  %16 = load i16, i16* %arrayidx11, align 2, !dbg !789
  store i16 %16, i16* %n, align 2, !dbg !794
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !795
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !795
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 16, !dbg !795
  %18 = load i16, i16* %quotient, align 2, !dbg !795
  %19 = load i16, i16* %n, align 2, !dbg !796
  %mul = mul i16 %18, %19, !dbg !797
  %20 = load i16, i16* %m, align 2, !dbg !798
  %add13 = add i16 %20, %mul, !dbg !798
  store i16 %add13, i16* %m, align 2, !dbg !798
  br label %if.end, !dbg !799

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !800
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %21 = load i16, i16* %m, align 2, !dbg !802
  %shr = lshr i16 %21, 8, !dbg !803
  store i16 %shr, i16* %c, align 2, !dbg !804
  %22 = load i16, i16* %m, align 2, !dbg !805
  %and = and i16 %22, 255, !dbg !805
  store i16 %and, i16* %m, align 2, !dbg !805
  %23 = load i16, i16* %m, align 2, !dbg !806
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !807
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !807
  %product215 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 14, !dbg !807
  %25 = load i16, i16* %i, align 2, !dbg !808
  %arrayidx16 = getelementptr inbounds [32 x i16], [32 x i16]* %product215, i16 0, i16 %25, !dbg !807
  store i16 %23, i16* %arrayidx16, align 2, !dbg !809
  br label %for.inc17, !dbg !810

for.inc17:                                        ; preds = %if.end
  %26 = load i16, i16* %i, align 2, !dbg !811
  %inc18 = add nsw i16 %26, 1, !dbg !811
  store i16 %inc18, i16* %i, align 2, !dbg !811
  br label %for.cond2, !dbg !812, !llvm.loop !813

for.end19:                                        ; preds = %for.cond2
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !815
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !815
  %print_which = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 17, !dbg !815
  store i8 1, i8* %print_which, align 2, !dbg !816
  ret void, !dbg !817
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_compare() #0 !dbg !818 {
entry:
  %i = alloca i16, align 2
  %relation = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !819, metadata !DIExpression()), !dbg !820
  call void @llvm.dbg.declare(metadata i8* %relation, metadata !821, metadata !DIExpression()), !dbg !823
  store i8 61, i8* %relation, align 1, !dbg !823
  store i16 7, i16* %i, align 2, !dbg !824
  br label %for.cond, !dbg !826

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !827
  %cmp = icmp sge i16 %0, 0, !dbg !829
  br i1 %cmp, label %for.body, label %for.end, !dbg !830

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !831
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !831
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !831
  %2 = load i16, i16* %i, align 2, !dbg !834
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !831
  %3 = load i16, i16* %arrayidx, align 2, !dbg !831
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !835
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !835
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !835
  %5 = load i16, i16* %i, align 2, !dbg !836
  %arrayidx2 = getelementptr inbounds [32 x i16], [32 x i16]* %product2, i16 0, i16 %5, !dbg !835
  %6 = load i16, i16* %arrayidx2, align 2, !dbg !835
  %cmp3 = icmp ugt i16 %3, %6, !dbg !837
  br i1 %cmp3, label %if.then, label %if.else, !dbg !838

if.then:                                          ; preds = %for.body
  store i8 62, i8* %relation, align 1, !dbg !839
  br label %for.end, !dbg !841

if.else:                                          ; preds = %for.body
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !842
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !842
  %product5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !842
  %8 = load i16, i16* %i, align 2, !dbg !844
  %arrayidx6 = getelementptr inbounds [32 x i16], [32 x i16]* %product5, i16 0, i16 %8, !dbg !842
  %9 = load i16, i16* %arrayidx6, align 2, !dbg !842
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !845
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !845
  %product28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !845
  %11 = load i16, i16* %i, align 2, !dbg !846
  %arrayidx9 = getelementptr inbounds [32 x i16], [32 x i16]* %product28, i16 0, i16 %11, !dbg !845
  %12 = load i16, i16* %arrayidx9, align 2, !dbg !845
  %cmp10 = icmp ult i16 %9, %12, !dbg !847
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !848

if.then11:                                        ; preds = %if.else
  store i8 60, i8* %relation, align 1, !dbg !849
  br label %for.end, !dbg !851

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc, !dbg !852

for.inc:                                          ; preds = %if.end12
  %13 = load i16, i16* %i, align 2, !dbg !853
  %dec = add nsw i16 %13, -1, !dbg !853
  store i16 %dec, i16* %i, align 2, !dbg !853
  br label %for.cond, !dbg !854, !llvm.loop !855

for.end:                                          ; preds = %if.then11, %if.then, %for.cond
  %14 = load i8, i8* %relation, align 1, !dbg !857
  %conv = sext i8 %14 to i16, !dbg !857
  %cmp13 = icmp eq i16 %conv, 60, !dbg !859
  br i1 %cmp13, label %if.then15, label %if.else17, !dbg !860

if.then15:                                        ; preds = %for.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !861
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !861
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 18, !dbg !861
  store i16 0, i16* %check, align 2, !dbg !863
  br label %if.end20, !dbg !864

if.else17:                                        ; preds = %for.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !865
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !865
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 18, !dbg !865
  store i16 1, i16* %check19, align 2, !dbg !867
  br label %if.end20

if.end20:                                         ; preds = %if.else17, %if.then15
  ret void, !dbg !868
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_add() #0 !dbg !869 {
entry:
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !870, metadata !DIExpression()), !dbg !871
  call void @llvm.dbg.declare(metadata i16* %j, metadata !872, metadata !DIExpression()), !dbg !873
  call void @llvm.dbg.declare(metadata i16* %m, metadata !874, metadata !DIExpression()), !dbg !875
  call void @llvm.dbg.declare(metadata i16* %n, metadata !876, metadata !DIExpression()), !dbg !877
  call void @llvm.dbg.declare(metadata i16* %c, metadata !878, metadata !DIExpression()), !dbg !879
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !880, metadata !DIExpression()), !dbg !881
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !882
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !882
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !882
  %1 = load i16, i16* %reduce, align 2, !dbg !882
  %add = add i16 %1, 1, !dbg !883
  %sub = sub i16 %add, 4, !dbg !884
  store i16 %sub, i16* %offset, align 2, !dbg !885
  store i16 0, i16* %c, align 2, !dbg !886
  %2 = load i16, i16* %offset, align 2, !dbg !887
  store i16 %2, i16* %i, align 2, !dbg !889
  br label %for.cond, !dbg !890

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i16, i16* %i, align 2, !dbg !891
  %cmp = icmp slt i16 %3, 8, !dbg !893
  br i1 %cmp, label %for.body, label %for.end, !dbg !894

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !895
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !895
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !895
  %5 = load i16, i16* %i, align 2, !dbg !897
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %5, !dbg !895
  %6 = load i16, i16* %arrayidx, align 2, !dbg !895
  store i16 %6, i16* %m, align 2, !dbg !898
  %7 = load i16, i16* %i, align 2, !dbg !899
  %8 = load i16, i16* %offset, align 2, !dbg !900
  %sub2 = sub i16 %7, %8, !dbg !901
  store i16 %sub2, i16* %j, align 2, !dbg !902
  %9 = load i16, i16* %i, align 2, !dbg !903
  %10 = load i16, i16* %offset, align 2, !dbg !905
  %add3 = add i16 %10, 4, !dbg !906
  %cmp4 = icmp ult i16 %9, %add3, !dbg !907
  br i1 %cmp4, label %if.then, label %if.else, !dbg !908

if.then:                                          ; preds = %for.body
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !909
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !909
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !909
  %12 = load i16, i16* %j, align 2, !dbg !911
  %arrayidx6 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %12, !dbg !909
  %13 = load i16, i16* %arrayidx6, align 2, !dbg !909
  store i16 %13, i16* %n, align 2, !dbg !912
  br label %if.end, !dbg !913

if.else:                                          ; preds = %for.body
  store i16 0, i16* %n, align 2, !dbg !914
  store i16 0, i16* %j, align 2, !dbg !916
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i16, i16* %c, align 2, !dbg !917
  %15 = load i16, i16* %m, align 2, !dbg !918
  %add7 = add i16 %14, %15, !dbg !919
  %16 = load i16, i16* %n, align 2, !dbg !920
  %add8 = add i16 %add7, %16, !dbg !921
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !922
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !922
  %product10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !922
  %18 = load i16, i16* %i, align 2, !dbg !923
  %arrayidx11 = getelementptr inbounds [32 x i16], [32 x i16]* %product10, i16 0, i16 %18, !dbg !922
  store i16 %add8, i16* %arrayidx11, align 2, !dbg !924
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !925
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !925
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !925
  %20 = load i16, i16* %i, align 2, !dbg !926
  %arrayidx14 = getelementptr inbounds [32 x i16], [32 x i16]* %product13, i16 0, i16 %20, !dbg !925
  %21 = load i16, i16* %arrayidx14, align 2, !dbg !925
  %shr = lshr i16 %21, 8, !dbg !927
  store i16 %shr, i16* %c, align 2, !dbg !928
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !929
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !929
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !929
  %23 = load i16, i16* %i, align 2, !dbg !930
  %arrayidx17 = getelementptr inbounds [32 x i16], [32 x i16]* %product16, i16 0, i16 %23, !dbg !929
  %24 = load i16, i16* %arrayidx17, align 2, !dbg !931
  %and = and i16 %24, 255, !dbg !931
  store i16 %and, i16* %arrayidx17, align 2, !dbg !931
  br label %for.inc, !dbg !932

for.inc:                                          ; preds = %if.end
  %25 = load i16, i16* %i, align 2, !dbg !933
  %inc = add nsw i16 %25, 1, !dbg !933
  store i16 %inc, i16* %i, align 2, !dbg !933
  br label %for.cond, !dbg !934, !llvm.loop !935

for.end:                                          ; preds = %for.cond
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !937
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !937
  %print_which = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 17, !dbg !937
  store i8 0, i8* %print_which, align 2, !dbg !938
  ret void, !dbg !939
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_subtract() #0 !dbg !940 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !941, metadata !DIExpression()), !dbg !942
  call void @llvm.dbg.declare(metadata i16* %m, metadata !943, metadata !DIExpression()), !dbg !944
  call void @llvm.dbg.declare(metadata i16* %s, metadata !945, metadata !DIExpression()), !dbg !946
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !947, metadata !DIExpression()), !dbg !948
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !951, metadata !DIExpression()), !dbg !952
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !953
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !953
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !953
  %1 = load i16, i16* %reduce, align 2, !dbg !953
  %add = add i16 %1, 1, !dbg !954
  %sub = sub i16 %add, 4, !dbg !955
  store i16 %sub, i16* %offset, align 2, !dbg !956
  store i16 0, i16* %borrow, align 2, !dbg !957
  store i16 0, i16* %i, align 2, !dbg !958
  br label %for.cond, !dbg !960

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !961
  %cmp = icmp slt i16 %2, 8, !dbg !963
  br i1 %cmp, label %for.body, label %for.end, !dbg !964

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !965
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !965
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !965
  %4 = load i16, i16* %i, align 2, !dbg !967
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %4, !dbg !965
  %5 = load i16, i16* %arrayidx, align 2, !dbg !965
  store i16 %5, i16* %m, align 2, !dbg !968
  %6 = load i16, i16* %i, align 2, !dbg !969
  %7 = load i16, i16* %offset, align 2, !dbg !971
  %cmp2 = icmp uge i16 %6, %7, !dbg !972
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !973

if.then:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !974
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !974
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !974
  %9 = load i16, i16* %i, align 2, !dbg !976
  %arrayidx4 = getelementptr inbounds [32 x i16], [32 x i16]* %product2, i16 0, i16 %9, !dbg !974
  %10 = load i16, i16* %arrayidx4, align 2, !dbg !974
  store i16 %10, i16* %qn, align 2, !dbg !977
  %11 = load i16, i16* %qn, align 2, !dbg !978
  %12 = load i16, i16* %borrow, align 2, !dbg !979
  %add5 = add i16 %11, %12, !dbg !980
  store i16 %add5, i16* %s, align 2, !dbg !981
  %13 = load i16, i16* %m, align 2, !dbg !982
  %14 = load i16, i16* %s, align 2, !dbg !984
  %cmp6 = icmp ult i16 %13, %14, !dbg !985
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !986

if.then7:                                         ; preds = %if.then
  %15 = load i16, i16* %m, align 2, !dbg !987
  %add8 = add i16 %15, 256, !dbg !987
  store i16 %add8, i16* %m, align 2, !dbg !987
  store i16 1, i16* %borrow, align 2, !dbg !989
  br label %if.end, !dbg !990

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !991
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %16 = load i16, i16* %m, align 2, !dbg !993
  %17 = load i16, i16* %s, align 2, !dbg !994
  %sub9 = sub i16 %16, %17, !dbg !995
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !996
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !996
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !996
  %19 = load i16, i16* %i, align 2, !dbg !997
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %product11, i16 0, i16 %19, !dbg !996
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !998
  br label %if.end13, !dbg !999

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !1000

for.inc:                                          ; preds = %if.end13
  %20 = load i16, i16* %i, align 2, !dbg !1001
  %inc = add nsw i16 %20, 1, !dbg !1001
  store i16 %inc, i16* %i, align 2, !dbg !1001
  br label %for.cond, !dbg !1002, !llvm.loop !1003

for.end:                                          ; preds = %for.cond
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1005
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !1005
  %print_which = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 17, !dbg !1005
  store i8 0, i8* %print_which, align 2, !dbg !1006
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1007
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !1007
  %reduce16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !1007
  %23 = load i16, i16* %reduce16, align 2, !dbg !1007
  %add17 = add i16 %23, 1, !dbg !1009
  %cmp18 = icmp ugt i16 %add17, 4, !dbg !1010
  br i1 %cmp18, label %if.then19, label %if.else20, !dbg !1011

if.then19:                                        ; preds = %for.end
  br label %if.end21, !dbg !1012

if.else20:                                        ; preds = %for.end
  br label %if.end21

if.end21:                                         ; preds = %if.else20, %if.then19
  ret void, !dbg !1014
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !1015 {
entry:
  ret void, !dbg !1016
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !1017 {
entry:
  call void @exit(i16 0) #6, !dbg !1018
  unreachable, !dbg !1018
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !1019 {
entry:
  %retval = alloca i16, align 2
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  %__x28 = alloca i16, align 2
  %tmp29 = alloca i16, align 2
  %__x31 = alloca i16, align 2
  %tmp32 = alloca i16, align 2
  %__x41 = alloca i16, align 2
  %tmp42 = alloca i16, align 2
  %__x44 = alloca i16, align 2
  %tmp45 = alloca i16, align 2
  %__x63 = alloca i16, align 2
  %tmp64 = alloca i16, align 2
  %__x66 = alloca i16, align 2
  %tmp67 = alloca i16, align 2
  %__x76 = alloca i16, align 2
  %tmp77 = alloca i16, align 2
  %__x79 = alloca i16, align 2
  %tmp80 = alloca i16, align 2
  %__x98 = alloca i16, align 2
  %tmp99 = alloca i16, align 2
  %__x101 = alloca i16, align 2
  %tmp102 = alloca i16, align 2
  %__x111 = alloca i16, align 2
  %tmp112 = alloca i16, align 2
  %__x114 = alloca i16, align 2
  %tmp115 = alloca i16, align 2
  %__x129 = alloca i16, align 2
  %tmp130 = alloca i16, align 2
  %__x132 = alloca i16, align 2
  %tmp133 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x145 = alloca i16, align 2
  %tmp146 = alloca i16, align 2
  %__x160 = alloca i16, align 2
  %tmp161 = alloca i16, align 2
  %__x163 = alloca i16, align 2
  %tmp164 = alloca i16, align 2
  %__x173 = alloca i16, align 2
  %tmp174 = alloca i16, align 2
  %__x176 = alloca i16, align 2
  %tmp177 = alloca i16, align 2
  %__x191 = alloca i16, align 2
  %tmp192 = alloca i16, align 2
  %__x194 = alloca i16, align 2
  %tmp195 = alloca i16, align 2
  %__x204 = alloca i16, align 2
  %tmp205 = alloca i16, align 2
  %__x207 = alloca i16, align 2
  %tmp208 = alloca i16, align 2
  %__x225 = alloca i16, align 2
  %tmp226 = alloca i16, align 2
  %__x228 = alloca i16, align 2
  %tmp229 = alloca i16, align 2
  %__x238 = alloca i16, align 2
  %tmp239 = alloca i16, align 2
  %__x241 = alloca i16, align 2
  %tmp242 = alloca i16, align 2
  %__x261 = alloca i16, align 2
  %tmp262 = alloca i16, align 2
  %__x264 = alloca i16, align 2
  %tmp265 = alloca i16, align 2
  %__x274 = alloca i16, align 2
  %tmp275 = alloca i16, align 2
  %__x277 = alloca i16, align 2
  %tmp278 = alloca i16, align 2
  %__x296 = alloca i16, align 2
  %tmp297 = alloca i16, align 2
  %__x299 = alloca i16, align 2
  %tmp300 = alloca i16, align 2
  %__x309 = alloca i16, align 2
  %tmp310 = alloca i16, align 2
  %__x312 = alloca i16, align 2
  %tmp313 = alloca i16, align 2
  %__x330 = alloca i16, align 2
  %tmp331 = alloca i16, align 2
  %__x333 = alloca i16, align 2
  %tmp334 = alloca i16, align 2
  %__x343 = alloca i16, align 2
  %tmp344 = alloca i16, align 2
  %__x346 = alloca i16, align 2
  %tmp347 = alloca i16, align 2
  %__x367 = alloca i16, align 2
  %tmp368 = alloca i16, align 2
  %__x370 = alloca i16, align 2
  %tmp371 = alloca i16, align 2
  %__x380 = alloca i16, align 2
  %tmp381 = alloca i16, align 2
  %__x383 = alloca i16, align 2
  %tmp384 = alloca i16, align 2
  %__x405 = alloca i16, align 2
  %tmp406 = alloca i16, align 2
  %__x408 = alloca i16, align 2
  %tmp409 = alloca i16, align 2
  %__x418 = alloca i16, align 2
  %tmp419 = alloca i16, align 2
  %__x421 = alloca i16, align 2
  %tmp422 = alloca i16, align 2
  %__x436 = alloca i16, align 2
  %tmp437 = alloca i16, align 2
  %__x439 = alloca i16, align 2
  %tmp440 = alloca i16, align 2
  %__x449 = alloca i16, align 2
  %tmp450 = alloca i16, align 2
  %__x452 = alloca i16, align 2
  %tmp453 = alloca i16, align 2
  %__x467 = alloca i16, align 2
  %tmp468 = alloca i16, align 2
  %__x470 = alloca i16, align 2
  %tmp471 = alloca i16, align 2
  %__x480 = alloca i16, align 2
  %tmp481 = alloca i16, align 2
  %__x483 = alloca i16, align 2
  %tmp484 = alloca i16, align 2
  %__x502 = alloca i16, align 2
  %tmp503 = alloca i16, align 2
  %__x505 = alloca i16, align 2
  %tmp506 = alloca i16, align 2
  %__x515 = alloca i16, align 2
  %tmp516 = alloca i16, align 2
  %__x518 = alloca i16, align 2
  %tmp519 = alloca i16, align 2
  %__x534 = alloca i16, align 2
  %tmp535 = alloca i16, align 2
  %__x537 = alloca i16, align 2
  %tmp538 = alloca i16, align 2
  %__x547 = alloca i16, align 2
  %tmp548 = alloca i16, align 2
  %__x550 = alloca i16, align 2
  %tmp551 = alloca i16, align 2
  %__x575 = alloca i16, align 2
  %tmp576 = alloca i16, align 2
  %__x578 = alloca i16, align 2
  %tmp579 = alloca i16, align 2
  %__x588 = alloca i16, align 2
  %tmp589 = alloca i16, align 2
  %__x591 = alloca i16, align 2
  %tmp592 = alloca i16, align 2
  %__x611 = alloca i16, align 2
  %tmp612 = alloca i16, align 2
  %__x614 = alloca i16, align 2
  %tmp615 = alloca i16, align 2
  %__x624 = alloca i16, align 2
  %tmp625 = alloca i16, align 2
  %__x627 = alloca i16, align 2
  %tmp628 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1022
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1023
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1024
  call void @camel_init(), !dbg !1025
  br label %while.body, !dbg !1026

while.body:                                       ; preds = %entry, %while.end
  call void @task_init(), !dbg !1027
  br label %do.body, !dbg !1029

do.body:                                          ; preds = %while.body
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1030
  %cmp = icmp eq i16 %0, 1, !dbg !1030
  br i1 %cmp, label %if.then, label %if.else, !dbg !1033

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1034
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1034
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1034
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !1034
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !1034
  call void @__dump_registers(i16* %arraydecay), !dbg !1034
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !1036, metadata !DIExpression()), !dbg !1038
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1038, !srcloc !1039
  store i16 %2, i16* %__x, align 2, !dbg !1038
  %3 = load i16, i16* %__x, align 2, !dbg !1038
  store i16 %3, i16* %tmp, align 2, !dbg !1038
  %4 = load i16, i16* %tmp, align 2, !dbg !1038
  %add = add i16 %4, 2, !dbg !1034
  %5 = inttoptr i16 %add to i8*, !dbg !1034
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !1040, metadata !DIExpression()), !dbg !1042
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1042, !srcloc !1043
  store i16 %6, i16* %__x1, align 2, !dbg !1042
  %7 = load i16, i16* %__x1, align 2, !dbg !1042
  store i16 %7, i16* %tmp2, align 2, !dbg !1042
  %8 = load i16, i16* %tmp2, align 2, !dbg !1042
  %add3 = add i16 %8, 2, !dbg !1034
  %sub = sub i16 9216, %add3, !dbg !1034
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !1034
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !1034
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1034
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !1034
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1034
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 346, i16 zeroext %11), !dbg !1034
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !1034
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1034
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1034
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !1034
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !1034
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1034
  br label %if.end, !dbg !1034

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1044
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1044
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1044
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !1044
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !1044
  call void @__dump_registers(i16* %arraydecay6), !dbg !1044
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !1046, metadata !DIExpression()), !dbg !1048
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1048, !srcloc !1049
  store i16 %15, i16* %__x7, align 2, !dbg !1048
  %16 = load i16, i16* %__x7, align 2, !dbg !1048
  store i16 %16, i16* %tmp8, align 2, !dbg !1048
  %17 = load i16, i16* %tmp8, align 2, !dbg !1048
  %add9 = add i16 %17, 2, !dbg !1044
  %18 = inttoptr i16 %add9 to i8*, !dbg !1044
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !1050, metadata !DIExpression()), !dbg !1052
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1052, !srcloc !1053
  store i16 %19, i16* %__x10, align 2, !dbg !1052
  %20 = load i16, i16* %__x10, align 2, !dbg !1052
  store i16 %20, i16* %tmp11, align 2, !dbg !1052
  %21 = load i16, i16* %tmp11, align 2, !dbg !1052
  %add12 = add i16 %21, 2, !dbg !1044
  %sub13 = sub i16 9216, %add12, !dbg !1044
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !1044
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !1044
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1044
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !1044
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1044
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 346, i16 zeroext %24), !dbg !1044
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !1044
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1044
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1044
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !1044
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !1044
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1044
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !1033

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !1054
  br label %while.body18, !dbg !1055

while.body18:                                     ; preds = %do.end, %if.end638
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1056
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !1056
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 19, !dbg !1056
  %28 = load i16, i16* %check_final, align 2, !dbg !1056
  %cmp19 = icmp eq i16 %28, 0, !dbg !1059
  br i1 %cmp19, label %land.lhs.true, label %if.end53, !dbg !1060

land.lhs.true:                                    ; preds = %while.body18
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1061
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !1061
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 18, !dbg !1061
  %30 = load i16, i16* %check, align 2, !dbg !1061
  %cmp21 = icmp ne i16 %30, 100, !dbg !1062
  br i1 %cmp21, label %if.then22, label %if.end53, !dbg !1063

if.then22:                                        ; preds = %land.lhs.true
  call void @task_pad(), !dbg !1064
  br label %do.body23, !dbg !1066

do.body23:                                        ; preds = %if.then22
  %31 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1067
  %cmp24 = icmp eq i16 %31, 1, !dbg !1067
  br i1 %cmp24, label %if.then25, label %if.else38, !dbg !1070

if.then25:                                        ; preds = %do.body23
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1071
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1071
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1071
  %reg_file26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !1071
  %arraydecay27 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file26, i16 0, i16 0, !dbg !1071
  call void @__dump_registers(i16* %arraydecay27), !dbg !1071
  call void @llvm.dbg.declare(metadata i16* %__x28, metadata !1073, metadata !DIExpression()), !dbg !1075
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1075, !srcloc !1076
  store i16 %33, i16* %__x28, align 2, !dbg !1075
  %34 = load i16, i16* %__x28, align 2, !dbg !1075
  store i16 %34, i16* %tmp29, align 2, !dbg !1075
  %35 = load i16, i16* %tmp29, align 2, !dbg !1075
  %add30 = add i16 %35, 2, !dbg !1071
  %36 = inttoptr i16 %add30 to i8*, !dbg !1071
  call void @llvm.dbg.declare(metadata i16* %__x31, metadata !1077, metadata !DIExpression()), !dbg !1079
  %37 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1079, !srcloc !1080
  store i16 %37, i16* %__x31, align 2, !dbg !1079
  %38 = load i16, i16* %__x31, align 2, !dbg !1079
  store i16 %38, i16* %tmp32, align 2, !dbg !1079
  %39 = load i16, i16* %tmp32, align 2, !dbg !1079
  %add33 = add i16 %39, 2, !dbg !1071
  %sub34 = sub i16 9216, %add33, !dbg !1071
  %call35 = call zeroext i16 @__fast_hw_crc(i8* %36, i16 zeroext %sub34, i16 zeroext -1), !dbg !1071
  store i16 %call35, i16* @tmp_stack_crc, align 2, !dbg !1071
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1071
  %41 = bitcast %struct.camel_buffer_t* %40 to i8*, !dbg !1071
  %42 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1071
  %call36 = call zeroext i16 @__fast_hw_crc(i8* %41, i16 zeroext 346, i16 zeroext %42), !dbg !1071
  store i16 %call36, i16* @tmp_stack_buf_crc, align 2, !dbg !1071
  %43 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1071
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1071
  %stack_and_buf_crc37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 2, !dbg !1071
  store i16 %43, i16* %stack_and_buf_crc37, align 2, !dbg !1071
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1071
  br label %if.end51, !dbg !1071

if.else38:                                        ; preds = %do.body23
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1081
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1081
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1081
  %reg_file39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 0, !dbg !1081
  %arraydecay40 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file39, i16 0, i16 0, !dbg !1081
  call void @__dump_registers(i16* %arraydecay40), !dbg !1081
  call void @llvm.dbg.declare(metadata i16* %__x41, metadata !1083, metadata !DIExpression()), !dbg !1085
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1085, !srcloc !1086
  store i16 %46, i16* %__x41, align 2, !dbg !1085
  %47 = load i16, i16* %__x41, align 2, !dbg !1085
  store i16 %47, i16* %tmp42, align 2, !dbg !1085
  %48 = load i16, i16* %tmp42, align 2, !dbg !1085
  %add43 = add i16 %48, 2, !dbg !1081
  %49 = inttoptr i16 %add43 to i8*, !dbg !1081
  call void @llvm.dbg.declare(metadata i16* %__x44, metadata !1087, metadata !DIExpression()), !dbg !1089
  %50 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1089, !srcloc !1090
  store i16 %50, i16* %__x44, align 2, !dbg !1089
  %51 = load i16, i16* %__x44, align 2, !dbg !1089
  store i16 %51, i16* %tmp45, align 2, !dbg !1089
  %52 = load i16, i16* %tmp45, align 2, !dbg !1089
  %add46 = add i16 %52, 2, !dbg !1081
  %sub47 = sub i16 9216, %add46, !dbg !1081
  %call48 = call zeroext i16 @__fast_hw_crc(i8* %49, i16 zeroext %sub47, i16 zeroext -1), !dbg !1081
  store i16 %call48, i16* @tmp_stack_crc, align 2, !dbg !1081
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1081
  %54 = bitcast %struct.camel_buffer_t* %53 to i8*, !dbg !1081
  %55 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1081
  %call49 = call zeroext i16 @__fast_hw_crc(i8* %54, i16 zeroext 346, i16 zeroext %55), !dbg !1081
  store i16 %call49, i16* @tmp_stack_buf_crc, align 2, !dbg !1081
  %56 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1081
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1081
  %stack_and_buf_crc50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 2, !dbg !1081
  store i16 %56, i16* %stack_and_buf_crc50, align 2, !dbg !1081
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1081
  br label %if.end51

if.end51:                                         ; preds = %if.else38, %if.then25
  br label %do.end52, !dbg !1070

do.end52:                                         ; preds = %if.end51
  call void @task_commit(), !dbg !1091
  br label %if.end53, !dbg !1092

if.end53:                                         ; preds = %do.end52, %land.lhs.true, %while.body18
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1093
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i32 0, i32 1, !dbg !1093
  %check55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 18, !dbg !1093
  %59 = load i16, i16* %check55, align 2, !dbg !1093
  %cmp56 = icmp ne i16 %59, 100, !dbg !1095
  br i1 %cmp56, label %if.then57, label %if.end88, !dbg !1096

if.then57:                                        ; preds = %if.end53
  call void @task_exp(), !dbg !1097
  br label %do.body58, !dbg !1099

do.body58:                                        ; preds = %if.then57
  %60 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1100
  %cmp59 = icmp eq i16 %60, 1, !dbg !1100
  br i1 %cmp59, label %if.then60, label %if.else73, !dbg !1103

if.then60:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1104
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %reg_file61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 0, !dbg !1104
  %arraydecay62 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file61, i16 0, i16 0, !dbg !1104
  call void @__dump_registers(i16* %arraydecay62), !dbg !1104
  call void @llvm.dbg.declare(metadata i16* %__x63, metadata !1106, metadata !DIExpression()), !dbg !1108
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1108, !srcloc !1109
  store i16 %62, i16* %__x63, align 2, !dbg !1108
  %63 = load i16, i16* %__x63, align 2, !dbg !1108
  store i16 %63, i16* %tmp64, align 2, !dbg !1108
  %64 = load i16, i16* %tmp64, align 2, !dbg !1108
  %add65 = add i16 %64, 2, !dbg !1104
  %65 = inttoptr i16 %add65 to i8*, !dbg !1104
  call void @llvm.dbg.declare(metadata i16* %__x66, metadata !1110, metadata !DIExpression()), !dbg !1112
  %66 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1112, !srcloc !1113
  store i16 %66, i16* %__x66, align 2, !dbg !1112
  %67 = load i16, i16* %__x66, align 2, !dbg !1112
  store i16 %67, i16* %tmp67, align 2, !dbg !1112
  %68 = load i16, i16* %tmp67, align 2, !dbg !1112
  %add68 = add i16 %68, 2, !dbg !1104
  %sub69 = sub i16 9216, %add68, !dbg !1104
  %call70 = call zeroext i16 @__fast_hw_crc(i8* %65, i16 zeroext %sub69, i16 zeroext -1), !dbg !1104
  store i16 %call70, i16* @tmp_stack_crc, align 2, !dbg !1104
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %70 = bitcast %struct.camel_buffer_t* %69 to i8*, !dbg !1104
  %71 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1104
  %call71 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext 346, i16 zeroext %71), !dbg !1104
  store i16 %call71, i16* @tmp_stack_buf_crc, align 2, !dbg !1104
  %72 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1104
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %stack_and_buf_crc72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 2, !dbg !1104
  store i16 %72, i16* %stack_and_buf_crc72, align 2, !dbg !1104
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1104
  br label %if.end86, !dbg !1104

if.else73:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1114
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1114
  %reg_file74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i32 0, i32 0, !dbg !1114
  %arraydecay75 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file74, i16 0, i16 0, !dbg !1114
  call void @__dump_registers(i16* %arraydecay75), !dbg !1114
  call void @llvm.dbg.declare(metadata i16* %__x76, metadata !1116, metadata !DIExpression()), !dbg !1118
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1118, !srcloc !1119
  store i16 %75, i16* %__x76, align 2, !dbg !1118
  %76 = load i16, i16* %__x76, align 2, !dbg !1118
  store i16 %76, i16* %tmp77, align 2, !dbg !1118
  %77 = load i16, i16* %tmp77, align 2, !dbg !1118
  %add78 = add i16 %77, 2, !dbg !1114
  %78 = inttoptr i16 %add78 to i8*, !dbg !1114
  call void @llvm.dbg.declare(metadata i16* %__x79, metadata !1120, metadata !DIExpression()), !dbg !1122
  %79 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1122, !srcloc !1123
  store i16 %79, i16* %__x79, align 2, !dbg !1122
  %80 = load i16, i16* %__x79, align 2, !dbg !1122
  store i16 %80, i16* %tmp80, align 2, !dbg !1122
  %81 = load i16, i16* %tmp80, align 2, !dbg !1122
  %add81 = add i16 %81, 2, !dbg !1114
  %sub82 = sub i16 9216, %add81, !dbg !1114
  %call83 = call zeroext i16 @__fast_hw_crc(i8* %78, i16 zeroext %sub82, i16 zeroext -1), !dbg !1114
  store i16 %call83, i16* @tmp_stack_crc, align 2, !dbg !1114
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1114
  %83 = bitcast %struct.camel_buffer_t* %82 to i8*, !dbg !1114
  %84 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1114
  %call84 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext 346, i16 zeroext %84), !dbg !1114
  store i16 %call84, i16* @tmp_stack_buf_crc, align 2, !dbg !1114
  %85 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1114
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1114
  %stack_and_buf_crc85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 2, !dbg !1114
  store i16 %85, i16* %stack_and_buf_crc85, align 2, !dbg !1114
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1114
  br label %if.end86

if.end86:                                         ; preds = %if.else73, %if.then60
  br label %do.end87, !dbg !1103

do.end87:                                         ; preds = %if.end86
  call void @task_commit(), !dbg !1124
  br label %if.end88, !dbg !1125

if.end88:                                         ; preds = %do.end87, %if.end53
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1126
  %globals89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %87, i32 0, i32 1, !dbg !1126
  %check90 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals89, i32 0, i32 18, !dbg !1126
  %88 = load i16, i16* %check90, align 2, !dbg !1126
  %cmp91 = icmp eq i16 %88, 0, !dbg !1128
  br i1 %cmp91, label %if.then92, label %if.else123, !dbg !1129

if.then92:                                        ; preds = %if.end88
  call void @task_mult_block(), !dbg !1130
  br label %do.body93, !dbg !1132

do.body93:                                        ; preds = %if.then92
  %89 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1133
  %cmp94 = icmp eq i16 %89, 1, !dbg !1133
  br i1 %cmp94, label %if.then95, label %if.else108, !dbg !1136

if.then95:                                        ; preds = %do.body93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1137
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1137
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1137
  %reg_file96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i32 0, i32 0, !dbg !1137
  %arraydecay97 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file96, i16 0, i16 0, !dbg !1137
  call void @__dump_registers(i16* %arraydecay97), !dbg !1137
  call void @llvm.dbg.declare(metadata i16* %__x98, metadata !1139, metadata !DIExpression()), !dbg !1141
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1141, !srcloc !1142
  store i16 %91, i16* %__x98, align 2, !dbg !1141
  %92 = load i16, i16* %__x98, align 2, !dbg !1141
  store i16 %92, i16* %tmp99, align 2, !dbg !1141
  %93 = load i16, i16* %tmp99, align 2, !dbg !1141
  %add100 = add i16 %93, 2, !dbg !1137
  %94 = inttoptr i16 %add100 to i8*, !dbg !1137
  call void @llvm.dbg.declare(metadata i16* %__x101, metadata !1143, metadata !DIExpression()), !dbg !1145
  %95 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1145, !srcloc !1146
  store i16 %95, i16* %__x101, align 2, !dbg !1145
  %96 = load i16, i16* %__x101, align 2, !dbg !1145
  store i16 %96, i16* %tmp102, align 2, !dbg !1145
  %97 = load i16, i16* %tmp102, align 2, !dbg !1145
  %add103 = add i16 %97, 2, !dbg !1137
  %sub104 = sub i16 9216, %add103, !dbg !1137
  %call105 = call zeroext i16 @__fast_hw_crc(i8* %94, i16 zeroext %sub104, i16 zeroext -1), !dbg !1137
  store i16 %call105, i16* @tmp_stack_crc, align 2, !dbg !1137
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1137
  %99 = bitcast %struct.camel_buffer_t* %98 to i8*, !dbg !1137
  %100 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1137
  %call106 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext 346, i16 zeroext %100), !dbg !1137
  store i16 %call106, i16* @tmp_stack_buf_crc, align 2, !dbg !1137
  %101 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1137
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1137
  %stack_and_buf_crc107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i32 0, i32 2, !dbg !1137
  store i16 %101, i16* %stack_and_buf_crc107, align 2, !dbg !1137
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1137
  br label %if.end121, !dbg !1137

if.else108:                                       ; preds = %do.body93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1147
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  %reg_file109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %103, i32 0, i32 0, !dbg !1147
  %arraydecay110 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file109, i16 0, i16 0, !dbg !1147
  call void @__dump_registers(i16* %arraydecay110), !dbg !1147
  call void @llvm.dbg.declare(metadata i16* %__x111, metadata !1149, metadata !DIExpression()), !dbg !1151
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1151, !srcloc !1152
  store i16 %104, i16* %__x111, align 2, !dbg !1151
  %105 = load i16, i16* %__x111, align 2, !dbg !1151
  store i16 %105, i16* %tmp112, align 2, !dbg !1151
  %106 = load i16, i16* %tmp112, align 2, !dbg !1151
  %add113 = add i16 %106, 2, !dbg !1147
  %107 = inttoptr i16 %add113 to i8*, !dbg !1147
  call void @llvm.dbg.declare(metadata i16* %__x114, metadata !1153, metadata !DIExpression()), !dbg !1155
  %108 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1155, !srcloc !1156
  store i16 %108, i16* %__x114, align 2, !dbg !1155
  %109 = load i16, i16* %__x114, align 2, !dbg !1155
  store i16 %109, i16* %tmp115, align 2, !dbg !1155
  %110 = load i16, i16* %tmp115, align 2, !dbg !1155
  %add116 = add i16 %110, 2, !dbg !1147
  %sub117 = sub i16 9216, %add116, !dbg !1147
  %call118 = call zeroext i16 @__fast_hw_crc(i8* %107, i16 zeroext %sub117, i16 zeroext -1), !dbg !1147
  store i16 %call118, i16* @tmp_stack_crc, align 2, !dbg !1147
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  %112 = bitcast %struct.camel_buffer_t* %111 to i8*, !dbg !1147
  %113 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1147
  %call119 = call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext 346, i16 zeroext %113), !dbg !1147
  store i16 %call119, i16* @tmp_stack_buf_crc, align 2, !dbg !1147
  %114 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1147
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  %stack_and_buf_crc120 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i32 0, i32 2, !dbg !1147
  store i16 %114, i16* %stack_and_buf_crc120, align 2, !dbg !1147
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1147
  br label %if.end121

if.end121:                                        ; preds = %if.else108, %if.then95
  br label %do.end122, !dbg !1136

do.end122:                                        ; preds = %if.end121
  call void @task_commit(), !dbg !1157
  br label %if.end154, !dbg !1158

if.else123:                                       ; preds = %if.end88
  call void @task_square_base(), !dbg !1159
  br label %do.body124, !dbg !1161

do.body124:                                       ; preds = %if.else123
  %116 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1162
  %cmp125 = icmp eq i16 %116, 1, !dbg !1162
  br i1 %cmp125, label %if.then126, label %if.else139, !dbg !1165

if.then126:                                       ; preds = %do.body124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1166
  %117 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1166
  %reg_file127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %117, i32 0, i32 0, !dbg !1166
  %arraydecay128 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file127, i16 0, i16 0, !dbg !1166
  call void @__dump_registers(i16* %arraydecay128), !dbg !1166
  call void @llvm.dbg.declare(metadata i16* %__x129, metadata !1168, metadata !DIExpression()), !dbg !1170
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1170, !srcloc !1171
  store i16 %118, i16* %__x129, align 2, !dbg !1170
  %119 = load i16, i16* %__x129, align 2, !dbg !1170
  store i16 %119, i16* %tmp130, align 2, !dbg !1170
  %120 = load i16, i16* %tmp130, align 2, !dbg !1170
  %add131 = add i16 %120, 2, !dbg !1166
  %121 = inttoptr i16 %add131 to i8*, !dbg !1166
  call void @llvm.dbg.declare(metadata i16* %__x132, metadata !1172, metadata !DIExpression()), !dbg !1174
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1174, !srcloc !1175
  store i16 %122, i16* %__x132, align 2, !dbg !1174
  %123 = load i16, i16* %__x132, align 2, !dbg !1174
  store i16 %123, i16* %tmp133, align 2, !dbg !1174
  %124 = load i16, i16* %tmp133, align 2, !dbg !1174
  %add134 = add i16 %124, 2, !dbg !1166
  %sub135 = sub i16 9216, %add134, !dbg !1166
  %call136 = call zeroext i16 @__fast_hw_crc(i8* %121, i16 zeroext %sub135, i16 zeroext -1), !dbg !1166
  store i16 %call136, i16* @tmp_stack_crc, align 2, !dbg !1166
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1166
  %126 = bitcast %struct.camel_buffer_t* %125 to i8*, !dbg !1166
  %127 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1166
  %call137 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext 346, i16 zeroext %127), !dbg !1166
  store i16 %call137, i16* @tmp_stack_buf_crc, align 2, !dbg !1166
  %128 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1166
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1166
  %stack_and_buf_crc138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %129, i32 0, i32 2, !dbg !1166
  store i16 %128, i16* %stack_and_buf_crc138, align 2, !dbg !1166
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1166
  br label %if.end152, !dbg !1166

if.else139:                                       ; preds = %do.body124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1176
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1176
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1176
  %reg_file140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %130, i32 0, i32 0, !dbg !1176
  %arraydecay141 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file140, i16 0, i16 0, !dbg !1176
  call void @__dump_registers(i16* %arraydecay141), !dbg !1176
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !1178, metadata !DIExpression()), !dbg !1180
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1180, !srcloc !1181
  store i16 %131, i16* %__x142, align 2, !dbg !1180
  %132 = load i16, i16* %__x142, align 2, !dbg !1180
  store i16 %132, i16* %tmp143, align 2, !dbg !1180
  %133 = load i16, i16* %tmp143, align 2, !dbg !1180
  %add144 = add i16 %133, 2, !dbg !1176
  %134 = inttoptr i16 %add144 to i8*, !dbg !1176
  call void @llvm.dbg.declare(metadata i16* %__x145, metadata !1182, metadata !DIExpression()), !dbg !1184
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1184, !srcloc !1185
  store i16 %135, i16* %__x145, align 2, !dbg !1184
  %136 = load i16, i16* %__x145, align 2, !dbg !1184
  store i16 %136, i16* %tmp146, align 2, !dbg !1184
  %137 = load i16, i16* %tmp146, align 2, !dbg !1184
  %add147 = add i16 %137, 2, !dbg !1176
  %sub148 = sub i16 9216, %add147, !dbg !1176
  %call149 = call zeroext i16 @__fast_hw_crc(i8* %134, i16 zeroext %sub148, i16 zeroext -1), !dbg !1176
  store i16 %call149, i16* @tmp_stack_crc, align 2, !dbg !1176
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1176
  %139 = bitcast %struct.camel_buffer_t* %138 to i8*, !dbg !1176
  %140 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1176
  %call150 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext 346, i16 zeroext %140), !dbg !1176
  store i16 %call150, i16* @tmp_stack_buf_crc, align 2, !dbg !1176
  %141 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1176
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1176
  %stack_and_buf_crc151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %142, i32 0, i32 2, !dbg !1176
  store i16 %141, i16* %stack_and_buf_crc151, align 2, !dbg !1176
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1176
  br label %if.end152

if.end152:                                        ; preds = %if.else139, %if.then126
  br label %do.end153, !dbg !1165

do.end153:                                        ; preds = %if.end152
  call void @task_commit(), !dbg !1186
  br label %if.end154

if.end154:                                        ; preds = %do.end153, %do.end122
  call void @task_mult_mod(), !dbg !1187
  br label %do.body155, !dbg !1188

do.body155:                                       ; preds = %if.end154
  %143 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1189
  %cmp156 = icmp eq i16 %143, 1, !dbg !1189
  br i1 %cmp156, label %if.then157, label %if.else170, !dbg !1192

if.then157:                                       ; preds = %do.body155
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1193
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1193
  %144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1193
  %reg_file158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %144, i32 0, i32 0, !dbg !1193
  %arraydecay159 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file158, i16 0, i16 0, !dbg !1193
  call void @__dump_registers(i16* %arraydecay159), !dbg !1193
  call void @llvm.dbg.declare(metadata i16* %__x160, metadata !1195, metadata !DIExpression()), !dbg !1197
  %145 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1197, !srcloc !1198
  store i16 %145, i16* %__x160, align 2, !dbg !1197
  %146 = load i16, i16* %__x160, align 2, !dbg !1197
  store i16 %146, i16* %tmp161, align 2, !dbg !1197
  %147 = load i16, i16* %tmp161, align 2, !dbg !1197
  %add162 = add i16 %147, 2, !dbg !1193
  %148 = inttoptr i16 %add162 to i8*, !dbg !1193
  call void @llvm.dbg.declare(metadata i16* %__x163, metadata !1199, metadata !DIExpression()), !dbg !1201
  %149 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1201, !srcloc !1202
  store i16 %149, i16* %__x163, align 2, !dbg !1201
  %150 = load i16, i16* %__x163, align 2, !dbg !1201
  store i16 %150, i16* %tmp164, align 2, !dbg !1201
  %151 = load i16, i16* %tmp164, align 2, !dbg !1201
  %add165 = add i16 %151, 2, !dbg !1193
  %sub166 = sub i16 9216, %add165, !dbg !1193
  %call167 = call zeroext i16 @__fast_hw_crc(i8* %148, i16 zeroext %sub166, i16 zeroext -1), !dbg !1193
  store i16 %call167, i16* @tmp_stack_crc, align 2, !dbg !1193
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1193
  %153 = bitcast %struct.camel_buffer_t* %152 to i8*, !dbg !1193
  %154 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1193
  %call168 = call zeroext i16 @__fast_hw_crc(i8* %153, i16 zeroext 346, i16 zeroext %154), !dbg !1193
  store i16 %call168, i16* @tmp_stack_buf_crc, align 2, !dbg !1193
  %155 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1193
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1193
  %stack_and_buf_crc169 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 2, !dbg !1193
  store i16 %155, i16* %stack_and_buf_crc169, align 2, !dbg !1193
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1193
  br label %if.end183, !dbg !1193

if.else170:                                       ; preds = %do.body155
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1203
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1203
  %157 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1203
  %reg_file171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %157, i32 0, i32 0, !dbg !1203
  %arraydecay172 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file171, i16 0, i16 0, !dbg !1203
  call void @__dump_registers(i16* %arraydecay172), !dbg !1203
  call void @llvm.dbg.declare(metadata i16* %__x173, metadata !1205, metadata !DIExpression()), !dbg !1207
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1207, !srcloc !1208
  store i16 %158, i16* %__x173, align 2, !dbg !1207
  %159 = load i16, i16* %__x173, align 2, !dbg !1207
  store i16 %159, i16* %tmp174, align 2, !dbg !1207
  %160 = load i16, i16* %tmp174, align 2, !dbg !1207
  %add175 = add i16 %160, 2, !dbg !1203
  %161 = inttoptr i16 %add175 to i8*, !dbg !1203
  call void @llvm.dbg.declare(metadata i16* %__x176, metadata !1209, metadata !DIExpression()), !dbg !1211
  %162 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1211, !srcloc !1212
  store i16 %162, i16* %__x176, align 2, !dbg !1211
  %163 = load i16, i16* %__x176, align 2, !dbg !1211
  store i16 %163, i16* %tmp177, align 2, !dbg !1211
  %164 = load i16, i16* %tmp177, align 2, !dbg !1211
  %add178 = add i16 %164, 2, !dbg !1203
  %sub179 = sub i16 9216, %add178, !dbg !1203
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %161, i16 zeroext %sub179, i16 zeroext -1), !dbg !1203
  store i16 %call180, i16* @tmp_stack_crc, align 2, !dbg !1203
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1203
  %166 = bitcast %struct.camel_buffer_t* %165 to i8*, !dbg !1203
  %167 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1203
  %call181 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext 346, i16 zeroext %167), !dbg !1203
  store i16 %call181, i16* @tmp_stack_buf_crc, align 2, !dbg !1203
  %168 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1203
  %169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1203
  %stack_and_buf_crc182 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %169, i32 0, i32 2, !dbg !1203
  store i16 %168, i16* %stack_and_buf_crc182, align 2, !dbg !1203
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1203
  br label %if.end183

if.end183:                                        ; preds = %if.else170, %if.then157
  br label %do.end184, !dbg !1192

do.end184:                                        ; preds = %if.end183
  call void @task_commit(), !dbg !1213
  br label %do.body185, !dbg !1214

do.body185:                                       ; preds = %do.cond, %do.end184
  call void @task_mult(), !dbg !1215
  br label %do.body186, !dbg !1217

do.body186:                                       ; preds = %do.body185
  %170 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1218
  %cmp187 = icmp eq i16 %170, 1, !dbg !1218
  br i1 %cmp187, label %if.then188, label %if.else201, !dbg !1221

if.then188:                                       ; preds = %do.body186
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1222
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %reg_file189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %171, i32 0, i32 0, !dbg !1222
  %arraydecay190 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file189, i16 0, i16 0, !dbg !1222
  call void @__dump_registers(i16* %arraydecay190), !dbg !1222
  call void @llvm.dbg.declare(metadata i16* %__x191, metadata !1224, metadata !DIExpression()), !dbg !1226
  %172 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1226, !srcloc !1227
  store i16 %172, i16* %__x191, align 2, !dbg !1226
  %173 = load i16, i16* %__x191, align 2, !dbg !1226
  store i16 %173, i16* %tmp192, align 2, !dbg !1226
  %174 = load i16, i16* %tmp192, align 2, !dbg !1226
  %add193 = add i16 %174, 2, !dbg !1222
  %175 = inttoptr i16 %add193 to i8*, !dbg !1222
  call void @llvm.dbg.declare(metadata i16* %__x194, metadata !1228, metadata !DIExpression()), !dbg !1230
  %176 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1230, !srcloc !1231
  store i16 %176, i16* %__x194, align 2, !dbg !1230
  %177 = load i16, i16* %__x194, align 2, !dbg !1230
  store i16 %177, i16* %tmp195, align 2, !dbg !1230
  %178 = load i16, i16* %tmp195, align 2, !dbg !1230
  %add196 = add i16 %178, 2, !dbg !1222
  %sub197 = sub i16 9216, %add196, !dbg !1222
  %call198 = call zeroext i16 @__fast_hw_crc(i8* %175, i16 zeroext %sub197, i16 zeroext -1), !dbg !1222
  store i16 %call198, i16* @tmp_stack_crc, align 2, !dbg !1222
  %179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %180 = bitcast %struct.camel_buffer_t* %179 to i8*, !dbg !1222
  %181 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1222
  %call199 = call zeroext i16 @__fast_hw_crc(i8* %180, i16 zeroext 346, i16 zeroext %181), !dbg !1222
  store i16 %call199, i16* @tmp_stack_buf_crc, align 2, !dbg !1222
  %182 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1222
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %stack_and_buf_crc200 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %183, i32 0, i32 2, !dbg !1222
  store i16 %182, i16* %stack_and_buf_crc200, align 2, !dbg !1222
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1222
  br label %if.end214, !dbg !1222

if.else201:                                       ; preds = %do.body186
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1232
  %184 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %reg_file202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %184, i32 0, i32 0, !dbg !1232
  %arraydecay203 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file202, i16 0, i16 0, !dbg !1232
  call void @__dump_registers(i16* %arraydecay203), !dbg !1232
  call void @llvm.dbg.declare(metadata i16* %__x204, metadata !1234, metadata !DIExpression()), !dbg !1236
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1236, !srcloc !1237
  store i16 %185, i16* %__x204, align 2, !dbg !1236
  %186 = load i16, i16* %__x204, align 2, !dbg !1236
  store i16 %186, i16* %tmp205, align 2, !dbg !1236
  %187 = load i16, i16* %tmp205, align 2, !dbg !1236
  %add206 = add i16 %187, 2, !dbg !1232
  %188 = inttoptr i16 %add206 to i8*, !dbg !1232
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !1238, metadata !DIExpression()), !dbg !1240
  %189 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1240, !srcloc !1241
  store i16 %189, i16* %__x207, align 2, !dbg !1240
  %190 = load i16, i16* %__x207, align 2, !dbg !1240
  store i16 %190, i16* %tmp208, align 2, !dbg !1240
  %191 = load i16, i16* %tmp208, align 2, !dbg !1240
  %add209 = add i16 %191, 2, !dbg !1232
  %sub210 = sub i16 9216, %add209, !dbg !1232
  %call211 = call zeroext i16 @__fast_hw_crc(i8* %188, i16 zeroext %sub210, i16 zeroext -1), !dbg !1232
  store i16 %call211, i16* @tmp_stack_crc, align 2, !dbg !1232
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %193 = bitcast %struct.camel_buffer_t* %192 to i8*, !dbg !1232
  %194 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1232
  %call212 = call zeroext i16 @__fast_hw_crc(i8* %193, i16 zeroext 346, i16 zeroext %194), !dbg !1232
  store i16 %call212, i16* @tmp_stack_buf_crc, align 2, !dbg !1232
  %195 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1232
  %196 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %stack_and_buf_crc213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %196, i32 0, i32 2, !dbg !1232
  store i16 %195, i16* %stack_and_buf_crc213, align 2, !dbg !1232
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1232
  br label %if.end214

if.end214:                                        ; preds = %if.else201, %if.then188
  br label %do.end215, !dbg !1221

do.end215:                                        ; preds = %if.end214
  call void @task_commit(), !dbg !1242
  br label %do.cond, !dbg !1243

do.cond:                                          ; preds = %do.end215
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1244
  %globals216 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %197, i32 0, i32 1, !dbg !1244
  %check217 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals216, i32 0, i32 18, !dbg !1244
  %198 = load i16, i16* %check217, align 2, !dbg !1244
  %cmp218 = icmp eq i16 %198, 0, !dbg !1245
  br i1 %cmp218, label %do.body185, label %do.end219, !dbg !1243, !llvm.loop !1246

do.end219:                                        ; preds = %do.cond
  call void @task_reduce_digits(), !dbg !1248
  br label %do.body220, !dbg !1249

do.body220:                                       ; preds = %do.end219
  %199 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1250
  %cmp221 = icmp eq i16 %199, 1, !dbg !1250
  br i1 %cmp221, label %if.then222, label %if.else235, !dbg !1253

if.then222:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1254
  %200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %reg_file223 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %200, i32 0, i32 0, !dbg !1254
  %arraydecay224 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file223, i16 0, i16 0, !dbg !1254
  call void @__dump_registers(i16* %arraydecay224), !dbg !1254
  call void @llvm.dbg.declare(metadata i16* %__x225, metadata !1256, metadata !DIExpression()), !dbg !1258
  %201 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1258, !srcloc !1259
  store i16 %201, i16* %__x225, align 2, !dbg !1258
  %202 = load i16, i16* %__x225, align 2, !dbg !1258
  store i16 %202, i16* %tmp226, align 2, !dbg !1258
  %203 = load i16, i16* %tmp226, align 2, !dbg !1258
  %add227 = add i16 %203, 2, !dbg !1254
  %204 = inttoptr i16 %add227 to i8*, !dbg !1254
  call void @llvm.dbg.declare(metadata i16* %__x228, metadata !1260, metadata !DIExpression()), !dbg !1262
  %205 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1262, !srcloc !1263
  store i16 %205, i16* %__x228, align 2, !dbg !1262
  %206 = load i16, i16* %__x228, align 2, !dbg !1262
  store i16 %206, i16* %tmp229, align 2, !dbg !1262
  %207 = load i16, i16* %tmp229, align 2, !dbg !1262
  %add230 = add i16 %207, 2, !dbg !1254
  %sub231 = sub i16 9216, %add230, !dbg !1254
  %call232 = call zeroext i16 @__fast_hw_crc(i8* %204, i16 zeroext %sub231, i16 zeroext -1), !dbg !1254
  store i16 %call232, i16* @tmp_stack_crc, align 2, !dbg !1254
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %209 = bitcast %struct.camel_buffer_t* %208 to i8*, !dbg !1254
  %210 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1254
  %call233 = call zeroext i16 @__fast_hw_crc(i8* %209, i16 zeroext 346, i16 zeroext %210), !dbg !1254
  store i16 %call233, i16* @tmp_stack_buf_crc, align 2, !dbg !1254
  %211 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1254
  %212 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %stack_and_buf_crc234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %212, i32 0, i32 2, !dbg !1254
  store i16 %211, i16* %stack_and_buf_crc234, align 2, !dbg !1254
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1254
  br label %if.end248, !dbg !1254

if.else235:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1264
  %213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %reg_file236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %213, i32 0, i32 0, !dbg !1264
  %arraydecay237 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file236, i16 0, i16 0, !dbg !1264
  call void @__dump_registers(i16* %arraydecay237), !dbg !1264
  call void @llvm.dbg.declare(metadata i16* %__x238, metadata !1266, metadata !DIExpression()), !dbg !1268
  %214 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1268, !srcloc !1269
  store i16 %214, i16* %__x238, align 2, !dbg !1268
  %215 = load i16, i16* %__x238, align 2, !dbg !1268
  store i16 %215, i16* %tmp239, align 2, !dbg !1268
  %216 = load i16, i16* %tmp239, align 2, !dbg !1268
  %add240 = add i16 %216, 2, !dbg !1264
  %217 = inttoptr i16 %add240 to i8*, !dbg !1264
  call void @llvm.dbg.declare(metadata i16* %__x241, metadata !1270, metadata !DIExpression()), !dbg !1272
  %218 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1272, !srcloc !1273
  store i16 %218, i16* %__x241, align 2, !dbg !1272
  %219 = load i16, i16* %__x241, align 2, !dbg !1272
  store i16 %219, i16* %tmp242, align 2, !dbg !1272
  %220 = load i16, i16* %tmp242, align 2, !dbg !1272
  %add243 = add i16 %220, 2, !dbg !1264
  %sub244 = sub i16 9216, %add243, !dbg !1264
  %call245 = call zeroext i16 @__fast_hw_crc(i8* %217, i16 zeroext %sub244, i16 zeroext -1), !dbg !1264
  store i16 %call245, i16* @tmp_stack_crc, align 2, !dbg !1264
  %221 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %222 = bitcast %struct.camel_buffer_t* %221 to i8*, !dbg !1264
  %223 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1264
  %call246 = call zeroext i16 @__fast_hw_crc(i8* %222, i16 zeroext 346, i16 zeroext %223), !dbg !1264
  store i16 %call246, i16* @tmp_stack_buf_crc, align 2, !dbg !1264
  %224 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1264
  %225 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %stack_and_buf_crc247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %225, i32 0, i32 2, !dbg !1264
  store i16 %224, i16* %stack_and_buf_crc247, align 2, !dbg !1264
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1264
  br label %if.end248

if.end248:                                        ; preds = %if.else235, %if.then222
  br label %do.end250, !dbg !1253

do.end250:                                        ; preds = %if.end248
  call void @task_commit(), !dbg !1274
  %226 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1275
  %globals251 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %226, i32 0, i32 1, !dbg !1275
  %check252 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals251, i32 0, i32 18, !dbg !1275
  %227 = load i16, i16* %check252, align 2, !dbg !1275
  %cmp253 = icmp eq i16 %227, 0, !dbg !1277
  br i1 %cmp253, label %if.then254, label %if.end255, !dbg !1278

if.then254:                                       ; preds = %do.end250
  br label %while.end, !dbg !1279

if.end255:                                        ; preds = %do.end250
  call void @task_reduce_normalizable(), !dbg !1281
  br label %do.body256, !dbg !1282

do.body256:                                       ; preds = %if.end255
  %228 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1283
  %cmp257 = icmp eq i16 %228, 1, !dbg !1283
  br i1 %cmp257, label %if.then258, label %if.else271, !dbg !1286

if.then258:                                       ; preds = %do.body256
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1287
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1287
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1287
  %reg_file259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %229, i32 0, i32 0, !dbg !1287
  %arraydecay260 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file259, i16 0, i16 0, !dbg !1287
  call void @__dump_registers(i16* %arraydecay260), !dbg !1287
  call void @llvm.dbg.declare(metadata i16* %__x261, metadata !1289, metadata !DIExpression()), !dbg !1291
  %230 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1291, !srcloc !1292
  store i16 %230, i16* %__x261, align 2, !dbg !1291
  %231 = load i16, i16* %__x261, align 2, !dbg !1291
  store i16 %231, i16* %tmp262, align 2, !dbg !1291
  %232 = load i16, i16* %tmp262, align 2, !dbg !1291
  %add263 = add i16 %232, 2, !dbg !1287
  %233 = inttoptr i16 %add263 to i8*, !dbg !1287
  call void @llvm.dbg.declare(metadata i16* %__x264, metadata !1293, metadata !DIExpression()), !dbg !1295
  %234 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1295, !srcloc !1296
  store i16 %234, i16* %__x264, align 2, !dbg !1295
  %235 = load i16, i16* %__x264, align 2, !dbg !1295
  store i16 %235, i16* %tmp265, align 2, !dbg !1295
  %236 = load i16, i16* %tmp265, align 2, !dbg !1295
  %add266 = add i16 %236, 2, !dbg !1287
  %sub267 = sub i16 9216, %add266, !dbg !1287
  %call268 = call zeroext i16 @__fast_hw_crc(i8* %233, i16 zeroext %sub267, i16 zeroext -1), !dbg !1287
  store i16 %call268, i16* @tmp_stack_crc, align 2, !dbg !1287
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1287
  %238 = bitcast %struct.camel_buffer_t* %237 to i8*, !dbg !1287
  %239 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1287
  %call269 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext 346, i16 zeroext %239), !dbg !1287
  store i16 %call269, i16* @tmp_stack_buf_crc, align 2, !dbg !1287
  %240 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1287
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1287
  %stack_and_buf_crc270 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %241, i32 0, i32 2, !dbg !1287
  store i16 %240, i16* %stack_and_buf_crc270, align 2, !dbg !1287
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1287
  br label %if.end284, !dbg !1287

if.else271:                                       ; preds = %do.body256
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1297
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1297
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1297
  %reg_file272 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %242, i32 0, i32 0, !dbg !1297
  %arraydecay273 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file272, i16 0, i16 0, !dbg !1297
  call void @__dump_registers(i16* %arraydecay273), !dbg !1297
  call void @llvm.dbg.declare(metadata i16* %__x274, metadata !1299, metadata !DIExpression()), !dbg !1301
  %243 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1301, !srcloc !1302
  store i16 %243, i16* %__x274, align 2, !dbg !1301
  %244 = load i16, i16* %__x274, align 2, !dbg !1301
  store i16 %244, i16* %tmp275, align 2, !dbg !1301
  %245 = load i16, i16* %tmp275, align 2, !dbg !1301
  %add276 = add i16 %245, 2, !dbg !1297
  %246 = inttoptr i16 %add276 to i8*, !dbg !1297
  call void @llvm.dbg.declare(metadata i16* %__x277, metadata !1303, metadata !DIExpression()), !dbg !1305
  %247 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1305, !srcloc !1306
  store i16 %247, i16* %__x277, align 2, !dbg !1305
  %248 = load i16, i16* %__x277, align 2, !dbg !1305
  store i16 %248, i16* %tmp278, align 2, !dbg !1305
  %249 = load i16, i16* %tmp278, align 2, !dbg !1305
  %add279 = add i16 %249, 2, !dbg !1297
  %sub280 = sub i16 9216, %add279, !dbg !1297
  %call281 = call zeroext i16 @__fast_hw_crc(i8* %246, i16 zeroext %sub280, i16 zeroext -1), !dbg !1297
  store i16 %call281, i16* @tmp_stack_crc, align 2, !dbg !1297
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1297
  %251 = bitcast %struct.camel_buffer_t* %250 to i8*, !dbg !1297
  %252 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1297
  %call282 = call zeroext i16 @__fast_hw_crc(i8* %251, i16 zeroext 346, i16 zeroext %252), !dbg !1297
  store i16 %call282, i16* @tmp_stack_buf_crc, align 2, !dbg !1297
  %253 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1297
  %254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1297
  %stack_and_buf_crc283 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %254, i32 0, i32 2, !dbg !1297
  store i16 %253, i16* %stack_and_buf_crc283, align 2, !dbg !1297
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1297
  br label %if.end284

if.end284:                                        ; preds = %if.else271, %if.then258
  br label %do.end286, !dbg !1286

do.end286:                                        ; preds = %if.end284
  call void @task_commit(), !dbg !1307
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1308
  %globals287 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %255, i32 0, i32 1, !dbg !1308
  %check288 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals287, i32 0, i32 18, !dbg !1308
  %256 = load i16, i16* %check288, align 2, !dbg !1308
  %cmp289 = icmp eq i16 %256, 0, !dbg !1310
  br i1 %cmp289, label %if.then290, label %if.else357, !dbg !1311

if.then290:                                       ; preds = %do.end286
  call void @task_reduce_normalize(), !dbg !1312
  br label %do.body291, !dbg !1314

do.body291:                                       ; preds = %if.then290
  %257 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1315
  %cmp292 = icmp eq i16 %257, 1, !dbg !1315
  br i1 %cmp292, label %if.then293, label %if.else306, !dbg !1318

if.then293:                                       ; preds = %do.body291
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1319
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1319
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1319
  %reg_file294 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %258, i32 0, i32 0, !dbg !1319
  %arraydecay295 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file294, i16 0, i16 0, !dbg !1319
  call void @__dump_registers(i16* %arraydecay295), !dbg !1319
  call void @llvm.dbg.declare(metadata i16* %__x296, metadata !1321, metadata !DIExpression()), !dbg !1323
  %259 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1323, !srcloc !1324
  store i16 %259, i16* %__x296, align 2, !dbg !1323
  %260 = load i16, i16* %__x296, align 2, !dbg !1323
  store i16 %260, i16* %tmp297, align 2, !dbg !1323
  %261 = load i16, i16* %tmp297, align 2, !dbg !1323
  %add298 = add i16 %261, 2, !dbg !1319
  %262 = inttoptr i16 %add298 to i8*, !dbg !1319
  call void @llvm.dbg.declare(metadata i16* %__x299, metadata !1325, metadata !DIExpression()), !dbg !1327
  %263 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1327, !srcloc !1328
  store i16 %263, i16* %__x299, align 2, !dbg !1327
  %264 = load i16, i16* %__x299, align 2, !dbg !1327
  store i16 %264, i16* %tmp300, align 2, !dbg !1327
  %265 = load i16, i16* %tmp300, align 2, !dbg !1327
  %add301 = add i16 %265, 2, !dbg !1319
  %sub302 = sub i16 9216, %add301, !dbg !1319
  %call303 = call zeroext i16 @__fast_hw_crc(i8* %262, i16 zeroext %sub302, i16 zeroext -1), !dbg !1319
  store i16 %call303, i16* @tmp_stack_crc, align 2, !dbg !1319
  %266 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1319
  %267 = bitcast %struct.camel_buffer_t* %266 to i8*, !dbg !1319
  %268 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1319
  %call304 = call zeroext i16 @__fast_hw_crc(i8* %267, i16 zeroext 346, i16 zeroext %268), !dbg !1319
  store i16 %call304, i16* @tmp_stack_buf_crc, align 2, !dbg !1319
  %269 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1319
  %270 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1319
  %stack_and_buf_crc305 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %270, i32 0, i32 2, !dbg !1319
  store i16 %269, i16* %stack_and_buf_crc305, align 2, !dbg !1319
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1319
  br label %if.end319, !dbg !1319

if.else306:                                       ; preds = %do.body291
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1329
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1329
  %271 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1329
  %reg_file307 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %271, i32 0, i32 0, !dbg !1329
  %arraydecay308 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file307, i16 0, i16 0, !dbg !1329
  call void @__dump_registers(i16* %arraydecay308), !dbg !1329
  call void @llvm.dbg.declare(metadata i16* %__x309, metadata !1331, metadata !DIExpression()), !dbg !1333
  %272 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1333, !srcloc !1334
  store i16 %272, i16* %__x309, align 2, !dbg !1333
  %273 = load i16, i16* %__x309, align 2, !dbg !1333
  store i16 %273, i16* %tmp310, align 2, !dbg !1333
  %274 = load i16, i16* %tmp310, align 2, !dbg !1333
  %add311 = add i16 %274, 2, !dbg !1329
  %275 = inttoptr i16 %add311 to i8*, !dbg !1329
  call void @llvm.dbg.declare(metadata i16* %__x312, metadata !1335, metadata !DIExpression()), !dbg !1337
  %276 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1337, !srcloc !1338
  store i16 %276, i16* %__x312, align 2, !dbg !1337
  %277 = load i16, i16* %__x312, align 2, !dbg !1337
  store i16 %277, i16* %tmp313, align 2, !dbg !1337
  %278 = load i16, i16* %tmp313, align 2, !dbg !1337
  %add314 = add i16 %278, 2, !dbg !1329
  %sub315 = sub i16 9216, %add314, !dbg !1329
  %call316 = call zeroext i16 @__fast_hw_crc(i8* %275, i16 zeroext %sub315, i16 zeroext -1), !dbg !1329
  store i16 %call316, i16* @tmp_stack_crc, align 2, !dbg !1329
  %279 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1329
  %280 = bitcast %struct.camel_buffer_t* %279 to i8*, !dbg !1329
  %281 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1329
  %call317 = call zeroext i16 @__fast_hw_crc(i8* %280, i16 zeroext 346, i16 zeroext %281), !dbg !1329
  store i16 %call317, i16* @tmp_stack_buf_crc, align 2, !dbg !1329
  %282 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1329
  %283 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1329
  %stack_and_buf_crc318 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %283, i32 0, i32 2, !dbg !1329
  store i16 %282, i16* %stack_and_buf_crc318, align 2, !dbg !1329
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1329
  br label %if.end319

if.end319:                                        ; preds = %if.else306, %if.then293
  br label %do.end321, !dbg !1318

do.end321:                                        ; preds = %if.end319
  call void @task_commit(), !dbg !1339
  %284 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1340
  %globals322 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %284, i32 0, i32 1, !dbg !1340
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals322, i32 0, i32 12, !dbg !1340
  %285 = load i16, i16* %offset, align 2, !dbg !1340
  %cmp323 = icmp ugt i16 %285, 0, !dbg !1342
  br i1 %cmp323, label %if.then324, label %if.end356, !dbg !1343

if.then324:                                       ; preds = %do.end321
  call void @task_reduce_n_divisor(), !dbg !1344
  br label %do.body325, !dbg !1346

do.body325:                                       ; preds = %if.then324
  %286 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1347
  %cmp326 = icmp eq i16 %286, 1, !dbg !1347
  br i1 %cmp326, label %if.then327, label %if.else340, !dbg !1350

if.then327:                                       ; preds = %do.body325
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1351
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1351
  %287 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1351
  %reg_file328 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %287, i32 0, i32 0, !dbg !1351
  %arraydecay329 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file328, i16 0, i16 0, !dbg !1351
  call void @__dump_registers(i16* %arraydecay329), !dbg !1351
  call void @llvm.dbg.declare(metadata i16* %__x330, metadata !1353, metadata !DIExpression()), !dbg !1355
  %288 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1355, !srcloc !1356
  store i16 %288, i16* %__x330, align 2, !dbg !1355
  %289 = load i16, i16* %__x330, align 2, !dbg !1355
  store i16 %289, i16* %tmp331, align 2, !dbg !1355
  %290 = load i16, i16* %tmp331, align 2, !dbg !1355
  %add332 = add i16 %290, 2, !dbg !1351
  %291 = inttoptr i16 %add332 to i8*, !dbg !1351
  call void @llvm.dbg.declare(metadata i16* %__x333, metadata !1357, metadata !DIExpression()), !dbg !1359
  %292 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1359, !srcloc !1360
  store i16 %292, i16* %__x333, align 2, !dbg !1359
  %293 = load i16, i16* %__x333, align 2, !dbg !1359
  store i16 %293, i16* %tmp334, align 2, !dbg !1359
  %294 = load i16, i16* %tmp334, align 2, !dbg !1359
  %add335 = add i16 %294, 2, !dbg !1351
  %sub336 = sub i16 9216, %add335, !dbg !1351
  %call337 = call zeroext i16 @__fast_hw_crc(i8* %291, i16 zeroext %sub336, i16 zeroext -1), !dbg !1351
  store i16 %call337, i16* @tmp_stack_crc, align 2, !dbg !1351
  %295 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1351
  %296 = bitcast %struct.camel_buffer_t* %295 to i8*, !dbg !1351
  %297 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1351
  %call338 = call zeroext i16 @__fast_hw_crc(i8* %296, i16 zeroext 346, i16 zeroext %297), !dbg !1351
  store i16 %call338, i16* @tmp_stack_buf_crc, align 2, !dbg !1351
  %298 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1351
  %299 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1351
  %stack_and_buf_crc339 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %299, i32 0, i32 2, !dbg !1351
  store i16 %298, i16* %stack_and_buf_crc339, align 2, !dbg !1351
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1351
  br label %if.end353, !dbg !1351

if.else340:                                       ; preds = %do.body325
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1361
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1361
  %300 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1361
  %reg_file341 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %300, i32 0, i32 0, !dbg !1361
  %arraydecay342 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file341, i16 0, i16 0, !dbg !1361
  call void @__dump_registers(i16* %arraydecay342), !dbg !1361
  call void @llvm.dbg.declare(metadata i16* %__x343, metadata !1363, metadata !DIExpression()), !dbg !1365
  %301 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1365, !srcloc !1366
  store i16 %301, i16* %__x343, align 2, !dbg !1365
  %302 = load i16, i16* %__x343, align 2, !dbg !1365
  store i16 %302, i16* %tmp344, align 2, !dbg !1365
  %303 = load i16, i16* %tmp344, align 2, !dbg !1365
  %add345 = add i16 %303, 2, !dbg !1361
  %304 = inttoptr i16 %add345 to i8*, !dbg !1361
  call void @llvm.dbg.declare(metadata i16* %__x346, metadata !1367, metadata !DIExpression()), !dbg !1369
  %305 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1369, !srcloc !1370
  store i16 %305, i16* %__x346, align 2, !dbg !1369
  %306 = load i16, i16* %__x346, align 2, !dbg !1369
  store i16 %306, i16* %tmp347, align 2, !dbg !1369
  %307 = load i16, i16* %tmp347, align 2, !dbg !1369
  %add348 = add i16 %307, 2, !dbg !1361
  %sub349 = sub i16 9216, %add348, !dbg !1361
  %call350 = call zeroext i16 @__fast_hw_crc(i8* %304, i16 zeroext %sub349, i16 zeroext -1), !dbg !1361
  store i16 %call350, i16* @tmp_stack_crc, align 2, !dbg !1361
  %308 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1361
  %309 = bitcast %struct.camel_buffer_t* %308 to i8*, !dbg !1361
  %310 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1361
  %call351 = call zeroext i16 @__fast_hw_crc(i8* %309, i16 zeroext 346, i16 zeroext %310), !dbg !1361
  store i16 %call351, i16* @tmp_stack_buf_crc, align 2, !dbg !1361
  %311 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1361
  %312 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1361
  %stack_and_buf_crc352 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %312, i32 0, i32 2, !dbg !1361
  store i16 %311, i16* %stack_and_buf_crc352, align 2, !dbg !1361
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1361
  br label %if.end353

if.end353:                                        ; preds = %if.else340, %if.then327
  br label %do.end355, !dbg !1350

do.end355:                                        ; preds = %if.end353
  call void @task_commit(), !dbg !1371
  br label %if.end356, !dbg !1372

if.end356:                                        ; preds = %do.end355, %do.end321
  br label %if.end394, !dbg !1373

if.else357:                                       ; preds = %do.end286
  %313 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1374
  %globals358 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %313, i32 0, i32 1, !dbg !1374
  %check359 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals358, i32 0, i32 18, !dbg !1374
  %314 = load i16, i16* %check359, align 2, !dbg !1374
  %cmp360 = icmp eq i16 %314, 1, !dbg !1376
  br i1 %cmp360, label %if.then361, label %if.end393, !dbg !1377

if.then361:                                       ; preds = %if.else357
  call void @task_reduce_n_divisor(), !dbg !1378
  br label %do.body362, !dbg !1380

do.body362:                                       ; preds = %if.then361
  %315 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1381
  %cmp363 = icmp eq i16 %315, 1, !dbg !1381
  br i1 %cmp363, label %if.then364, label %if.else377, !dbg !1384

if.then364:                                       ; preds = %do.body362
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1385
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1385
  %316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1385
  %reg_file365 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %316, i32 0, i32 0, !dbg !1385
  %arraydecay366 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file365, i16 0, i16 0, !dbg !1385
  call void @__dump_registers(i16* %arraydecay366), !dbg !1385
  call void @llvm.dbg.declare(metadata i16* %__x367, metadata !1387, metadata !DIExpression()), !dbg !1389
  %317 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1389, !srcloc !1390
  store i16 %317, i16* %__x367, align 2, !dbg !1389
  %318 = load i16, i16* %__x367, align 2, !dbg !1389
  store i16 %318, i16* %tmp368, align 2, !dbg !1389
  %319 = load i16, i16* %tmp368, align 2, !dbg !1389
  %add369 = add i16 %319, 2, !dbg !1385
  %320 = inttoptr i16 %add369 to i8*, !dbg !1385
  call void @llvm.dbg.declare(metadata i16* %__x370, metadata !1391, metadata !DIExpression()), !dbg !1393
  %321 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1393, !srcloc !1394
  store i16 %321, i16* %__x370, align 2, !dbg !1393
  %322 = load i16, i16* %__x370, align 2, !dbg !1393
  store i16 %322, i16* %tmp371, align 2, !dbg !1393
  %323 = load i16, i16* %tmp371, align 2, !dbg !1393
  %add372 = add i16 %323, 2, !dbg !1385
  %sub373 = sub i16 9216, %add372, !dbg !1385
  %call374 = call zeroext i16 @__fast_hw_crc(i8* %320, i16 zeroext %sub373, i16 zeroext -1), !dbg !1385
  store i16 %call374, i16* @tmp_stack_crc, align 2, !dbg !1385
  %324 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1385
  %325 = bitcast %struct.camel_buffer_t* %324 to i8*, !dbg !1385
  %326 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1385
  %call375 = call zeroext i16 @__fast_hw_crc(i8* %325, i16 zeroext 346, i16 zeroext %326), !dbg !1385
  store i16 %call375, i16* @tmp_stack_buf_crc, align 2, !dbg !1385
  %327 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1385
  %328 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1385
  %stack_and_buf_crc376 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %328, i32 0, i32 2, !dbg !1385
  store i16 %327, i16* %stack_and_buf_crc376, align 2, !dbg !1385
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1385
  br label %if.end390, !dbg !1385

if.else377:                                       ; preds = %do.body362
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1395
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1395
  %329 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1395
  %reg_file378 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %329, i32 0, i32 0, !dbg !1395
  %arraydecay379 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file378, i16 0, i16 0, !dbg !1395
  call void @__dump_registers(i16* %arraydecay379), !dbg !1395
  call void @llvm.dbg.declare(metadata i16* %__x380, metadata !1397, metadata !DIExpression()), !dbg !1399
  %330 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1399, !srcloc !1400
  store i16 %330, i16* %__x380, align 2, !dbg !1399
  %331 = load i16, i16* %__x380, align 2, !dbg !1399
  store i16 %331, i16* %tmp381, align 2, !dbg !1399
  %332 = load i16, i16* %tmp381, align 2, !dbg !1399
  %add382 = add i16 %332, 2, !dbg !1395
  %333 = inttoptr i16 %add382 to i8*, !dbg !1395
  call void @llvm.dbg.declare(metadata i16* %__x383, metadata !1401, metadata !DIExpression()), !dbg !1403
  %334 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1403, !srcloc !1404
  store i16 %334, i16* %__x383, align 2, !dbg !1403
  %335 = load i16, i16* %__x383, align 2, !dbg !1403
  store i16 %335, i16* %tmp384, align 2, !dbg !1403
  %336 = load i16, i16* %tmp384, align 2, !dbg !1403
  %add385 = add i16 %336, 2, !dbg !1395
  %sub386 = sub i16 9216, %add385, !dbg !1395
  %call387 = call zeroext i16 @__fast_hw_crc(i8* %333, i16 zeroext %sub386, i16 zeroext -1), !dbg !1395
  store i16 %call387, i16* @tmp_stack_crc, align 2, !dbg !1395
  %337 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1395
  %338 = bitcast %struct.camel_buffer_t* %337 to i8*, !dbg !1395
  %339 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1395
  %call388 = call zeroext i16 @__fast_hw_crc(i8* %338, i16 zeroext 346, i16 zeroext %339), !dbg !1395
  store i16 %call388, i16* @tmp_stack_buf_crc, align 2, !dbg !1395
  %340 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1395
  %341 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1395
  %stack_and_buf_crc389 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %341, i32 0, i32 2, !dbg !1395
  store i16 %340, i16* %stack_and_buf_crc389, align 2, !dbg !1395
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1395
  br label %if.end390

if.end390:                                        ; preds = %if.else377, %if.then364
  br label %do.end392, !dbg !1384

do.end392:                                        ; preds = %if.end390
  call void @task_commit(), !dbg !1405
  br label %if.end393, !dbg !1406

if.end393:                                        ; preds = %do.end392, %if.else357
  br label %if.end394

if.end394:                                        ; preds = %if.end393, %if.end356
  %342 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1407
  %globals395 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %342, i32 0, i32 1, !dbg !1407
  %check396 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals395, i32 0, i32 18, !dbg !1407
  %343 = load i16, i16* %check396, align 2, !dbg !1407
  %cmp397 = icmp ne i16 %343, 2, !dbg !1409
  br i1 %cmp397, label %if.then398, label %if.end565, !dbg !1410

if.then398:                                       ; preds = %if.end394
  br label %do.body399, !dbg !1411

do.body399:                                       ; preds = %do.cond560, %if.then398
  call void @task_reduce_quotient(), !dbg !1413
  br label %do.body400, !dbg !1415

do.body400:                                       ; preds = %do.body399
  %344 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1416
  %cmp401 = icmp eq i16 %344, 1, !dbg !1416
  br i1 %cmp401, label %if.then402, label %if.else415, !dbg !1419

if.then402:                                       ; preds = %do.body400
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1420
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1420
  %345 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1420
  %reg_file403 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %345, i32 0, i32 0, !dbg !1420
  %arraydecay404 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file403, i16 0, i16 0, !dbg !1420
  call void @__dump_registers(i16* %arraydecay404), !dbg !1420
  call void @llvm.dbg.declare(metadata i16* %__x405, metadata !1422, metadata !DIExpression()), !dbg !1424
  %346 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1424, !srcloc !1425
  store i16 %346, i16* %__x405, align 2, !dbg !1424
  %347 = load i16, i16* %__x405, align 2, !dbg !1424
  store i16 %347, i16* %tmp406, align 2, !dbg !1424
  %348 = load i16, i16* %tmp406, align 2, !dbg !1424
  %add407 = add i16 %348, 2, !dbg !1420
  %349 = inttoptr i16 %add407 to i8*, !dbg !1420
  call void @llvm.dbg.declare(metadata i16* %__x408, metadata !1426, metadata !DIExpression()), !dbg !1428
  %350 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1428, !srcloc !1429
  store i16 %350, i16* %__x408, align 2, !dbg !1428
  %351 = load i16, i16* %__x408, align 2, !dbg !1428
  store i16 %351, i16* %tmp409, align 2, !dbg !1428
  %352 = load i16, i16* %tmp409, align 2, !dbg !1428
  %add410 = add i16 %352, 2, !dbg !1420
  %sub411 = sub i16 9216, %add410, !dbg !1420
  %call412 = call zeroext i16 @__fast_hw_crc(i8* %349, i16 zeroext %sub411, i16 zeroext -1), !dbg !1420
  store i16 %call412, i16* @tmp_stack_crc, align 2, !dbg !1420
  %353 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1420
  %354 = bitcast %struct.camel_buffer_t* %353 to i8*, !dbg !1420
  %355 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1420
  %call413 = call zeroext i16 @__fast_hw_crc(i8* %354, i16 zeroext 346, i16 zeroext %355), !dbg !1420
  store i16 %call413, i16* @tmp_stack_buf_crc, align 2, !dbg !1420
  %356 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1420
  %357 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1420
  %stack_and_buf_crc414 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %357, i32 0, i32 2, !dbg !1420
  store i16 %356, i16* %stack_and_buf_crc414, align 2, !dbg !1420
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1420
  br label %if.end428, !dbg !1420

if.else415:                                       ; preds = %do.body400
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1430
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1430
  %358 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1430
  %reg_file416 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %358, i32 0, i32 0, !dbg !1430
  %arraydecay417 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file416, i16 0, i16 0, !dbg !1430
  call void @__dump_registers(i16* %arraydecay417), !dbg !1430
  call void @llvm.dbg.declare(metadata i16* %__x418, metadata !1432, metadata !DIExpression()), !dbg !1434
  %359 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1434, !srcloc !1435
  store i16 %359, i16* %__x418, align 2, !dbg !1434
  %360 = load i16, i16* %__x418, align 2, !dbg !1434
  store i16 %360, i16* %tmp419, align 2, !dbg !1434
  %361 = load i16, i16* %tmp419, align 2, !dbg !1434
  %add420 = add i16 %361, 2, !dbg !1430
  %362 = inttoptr i16 %add420 to i8*, !dbg !1430
  call void @llvm.dbg.declare(metadata i16* %__x421, metadata !1436, metadata !DIExpression()), !dbg !1438
  %363 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1438, !srcloc !1439
  store i16 %363, i16* %__x421, align 2, !dbg !1438
  %364 = load i16, i16* %__x421, align 2, !dbg !1438
  store i16 %364, i16* %tmp422, align 2, !dbg !1438
  %365 = load i16, i16* %tmp422, align 2, !dbg !1438
  %add423 = add i16 %365, 2, !dbg !1430
  %sub424 = sub i16 9216, %add423, !dbg !1430
  %call425 = call zeroext i16 @__fast_hw_crc(i8* %362, i16 zeroext %sub424, i16 zeroext -1), !dbg !1430
  store i16 %call425, i16* @tmp_stack_crc, align 2, !dbg !1430
  %366 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1430
  %367 = bitcast %struct.camel_buffer_t* %366 to i8*, !dbg !1430
  %368 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1430
  %call426 = call zeroext i16 @__fast_hw_crc(i8* %367, i16 zeroext 346, i16 zeroext %368), !dbg !1430
  store i16 %call426, i16* @tmp_stack_buf_crc, align 2, !dbg !1430
  %369 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1430
  %370 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1430
  %stack_and_buf_crc427 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %370, i32 0, i32 2, !dbg !1430
  store i16 %369, i16* %stack_and_buf_crc427, align 2, !dbg !1430
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1430
  br label %if.end428

if.end428:                                        ; preds = %if.else415, %if.then402
  br label %do.end430, !dbg !1419

do.end430:                                        ; preds = %if.end428
  call void @task_commit(), !dbg !1440
  call void @task_reduce_multiply(), !dbg !1441
  br label %do.body431, !dbg !1442

do.body431:                                       ; preds = %do.end430
  %371 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1443
  %cmp432 = icmp eq i16 %371, 1, !dbg !1443
  br i1 %cmp432, label %if.then433, label %if.else446, !dbg !1446

if.then433:                                       ; preds = %do.body431
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1447
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1447
  %372 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1447
  %reg_file434 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %372, i32 0, i32 0, !dbg !1447
  %arraydecay435 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file434, i16 0, i16 0, !dbg !1447
  call void @__dump_registers(i16* %arraydecay435), !dbg !1447
  call void @llvm.dbg.declare(metadata i16* %__x436, metadata !1449, metadata !DIExpression()), !dbg !1451
  %373 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1451, !srcloc !1452
  store i16 %373, i16* %__x436, align 2, !dbg !1451
  %374 = load i16, i16* %__x436, align 2, !dbg !1451
  store i16 %374, i16* %tmp437, align 2, !dbg !1451
  %375 = load i16, i16* %tmp437, align 2, !dbg !1451
  %add438 = add i16 %375, 2, !dbg !1447
  %376 = inttoptr i16 %add438 to i8*, !dbg !1447
  call void @llvm.dbg.declare(metadata i16* %__x439, metadata !1453, metadata !DIExpression()), !dbg !1455
  %377 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1455, !srcloc !1456
  store i16 %377, i16* %__x439, align 2, !dbg !1455
  %378 = load i16, i16* %__x439, align 2, !dbg !1455
  store i16 %378, i16* %tmp440, align 2, !dbg !1455
  %379 = load i16, i16* %tmp440, align 2, !dbg !1455
  %add441 = add i16 %379, 2, !dbg !1447
  %sub442 = sub i16 9216, %add441, !dbg !1447
  %call443 = call zeroext i16 @__fast_hw_crc(i8* %376, i16 zeroext %sub442, i16 zeroext -1), !dbg !1447
  store i16 %call443, i16* @tmp_stack_crc, align 2, !dbg !1447
  %380 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1447
  %381 = bitcast %struct.camel_buffer_t* %380 to i8*, !dbg !1447
  %382 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1447
  %call444 = call zeroext i16 @__fast_hw_crc(i8* %381, i16 zeroext 346, i16 zeroext %382), !dbg !1447
  store i16 %call444, i16* @tmp_stack_buf_crc, align 2, !dbg !1447
  %383 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1447
  %384 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1447
  %stack_and_buf_crc445 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %384, i32 0, i32 2, !dbg !1447
  store i16 %383, i16* %stack_and_buf_crc445, align 2, !dbg !1447
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1447
  br label %if.end459, !dbg !1447

if.else446:                                       ; preds = %do.body431
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1457
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1457
  %385 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1457
  %reg_file447 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %385, i32 0, i32 0, !dbg !1457
  %arraydecay448 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file447, i16 0, i16 0, !dbg !1457
  call void @__dump_registers(i16* %arraydecay448), !dbg !1457
  call void @llvm.dbg.declare(metadata i16* %__x449, metadata !1459, metadata !DIExpression()), !dbg !1461
  %386 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1461, !srcloc !1462
  store i16 %386, i16* %__x449, align 2, !dbg !1461
  %387 = load i16, i16* %__x449, align 2, !dbg !1461
  store i16 %387, i16* %tmp450, align 2, !dbg !1461
  %388 = load i16, i16* %tmp450, align 2, !dbg !1461
  %add451 = add i16 %388, 2, !dbg !1457
  %389 = inttoptr i16 %add451 to i8*, !dbg !1457
  call void @llvm.dbg.declare(metadata i16* %__x452, metadata !1463, metadata !DIExpression()), !dbg !1465
  %390 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1465, !srcloc !1466
  store i16 %390, i16* %__x452, align 2, !dbg !1465
  %391 = load i16, i16* %__x452, align 2, !dbg !1465
  store i16 %391, i16* %tmp453, align 2, !dbg !1465
  %392 = load i16, i16* %tmp453, align 2, !dbg !1465
  %add454 = add i16 %392, 2, !dbg !1457
  %sub455 = sub i16 9216, %add454, !dbg !1457
  %call456 = call zeroext i16 @__fast_hw_crc(i8* %389, i16 zeroext %sub455, i16 zeroext -1), !dbg !1457
  store i16 %call456, i16* @tmp_stack_crc, align 2, !dbg !1457
  %393 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1457
  %394 = bitcast %struct.camel_buffer_t* %393 to i8*, !dbg !1457
  %395 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1457
  %call457 = call zeroext i16 @__fast_hw_crc(i8* %394, i16 zeroext 346, i16 zeroext %395), !dbg !1457
  store i16 %call457, i16* @tmp_stack_buf_crc, align 2, !dbg !1457
  %396 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1457
  %397 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1457
  %stack_and_buf_crc458 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %397, i32 0, i32 2, !dbg !1457
  store i16 %396, i16* %stack_and_buf_crc458, align 2, !dbg !1457
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1457
  br label %if.end459

if.end459:                                        ; preds = %if.else446, %if.then433
  br label %do.end461, !dbg !1446

do.end461:                                        ; preds = %if.end459
  call void @task_commit(), !dbg !1467
  call void @task_reduce_compare(), !dbg !1468
  br label %do.body462, !dbg !1469

do.body462:                                       ; preds = %do.end461
  %398 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1470
  %cmp463 = icmp eq i16 %398, 1, !dbg !1470
  br i1 %cmp463, label %if.then464, label %if.else477, !dbg !1473

if.then464:                                       ; preds = %do.body462
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1474
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1474
  %399 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1474
  %reg_file465 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %399, i32 0, i32 0, !dbg !1474
  %arraydecay466 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file465, i16 0, i16 0, !dbg !1474
  call void @__dump_registers(i16* %arraydecay466), !dbg !1474
  call void @llvm.dbg.declare(metadata i16* %__x467, metadata !1476, metadata !DIExpression()), !dbg !1478
  %400 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1478, !srcloc !1479
  store i16 %400, i16* %__x467, align 2, !dbg !1478
  %401 = load i16, i16* %__x467, align 2, !dbg !1478
  store i16 %401, i16* %tmp468, align 2, !dbg !1478
  %402 = load i16, i16* %tmp468, align 2, !dbg !1478
  %add469 = add i16 %402, 2, !dbg !1474
  %403 = inttoptr i16 %add469 to i8*, !dbg !1474
  call void @llvm.dbg.declare(metadata i16* %__x470, metadata !1480, metadata !DIExpression()), !dbg !1482
  %404 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1482, !srcloc !1483
  store i16 %404, i16* %__x470, align 2, !dbg !1482
  %405 = load i16, i16* %__x470, align 2, !dbg !1482
  store i16 %405, i16* %tmp471, align 2, !dbg !1482
  %406 = load i16, i16* %tmp471, align 2, !dbg !1482
  %add472 = add i16 %406, 2, !dbg !1474
  %sub473 = sub i16 9216, %add472, !dbg !1474
  %call474 = call zeroext i16 @__fast_hw_crc(i8* %403, i16 zeroext %sub473, i16 zeroext -1), !dbg !1474
  store i16 %call474, i16* @tmp_stack_crc, align 2, !dbg !1474
  %407 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1474
  %408 = bitcast %struct.camel_buffer_t* %407 to i8*, !dbg !1474
  %409 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1474
  %call475 = call zeroext i16 @__fast_hw_crc(i8* %408, i16 zeroext 346, i16 zeroext %409), !dbg !1474
  store i16 %call475, i16* @tmp_stack_buf_crc, align 2, !dbg !1474
  %410 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1474
  %411 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1474
  %stack_and_buf_crc476 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %411, i32 0, i32 2, !dbg !1474
  store i16 %410, i16* %stack_and_buf_crc476, align 2, !dbg !1474
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1474
  br label %if.end490, !dbg !1474

if.else477:                                       ; preds = %do.body462
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1484
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1484
  %412 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1484
  %reg_file478 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %412, i32 0, i32 0, !dbg !1484
  %arraydecay479 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file478, i16 0, i16 0, !dbg !1484
  call void @__dump_registers(i16* %arraydecay479), !dbg !1484
  call void @llvm.dbg.declare(metadata i16* %__x480, metadata !1486, metadata !DIExpression()), !dbg !1488
  %413 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1488, !srcloc !1489
  store i16 %413, i16* %__x480, align 2, !dbg !1488
  %414 = load i16, i16* %__x480, align 2, !dbg !1488
  store i16 %414, i16* %tmp481, align 2, !dbg !1488
  %415 = load i16, i16* %tmp481, align 2, !dbg !1488
  %add482 = add i16 %415, 2, !dbg !1484
  %416 = inttoptr i16 %add482 to i8*, !dbg !1484
  call void @llvm.dbg.declare(metadata i16* %__x483, metadata !1490, metadata !DIExpression()), !dbg !1492
  %417 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1492, !srcloc !1493
  store i16 %417, i16* %__x483, align 2, !dbg !1492
  %418 = load i16, i16* %__x483, align 2, !dbg !1492
  store i16 %418, i16* %tmp484, align 2, !dbg !1492
  %419 = load i16, i16* %tmp484, align 2, !dbg !1492
  %add485 = add i16 %419, 2, !dbg !1484
  %sub486 = sub i16 9216, %add485, !dbg !1484
  %call487 = call zeroext i16 @__fast_hw_crc(i8* %416, i16 zeroext %sub486, i16 zeroext -1), !dbg !1484
  store i16 %call487, i16* @tmp_stack_crc, align 2, !dbg !1484
  %420 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1484
  %421 = bitcast %struct.camel_buffer_t* %420 to i8*, !dbg !1484
  %422 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1484
  %call488 = call zeroext i16 @__fast_hw_crc(i8* %421, i16 zeroext 346, i16 zeroext %422), !dbg !1484
  store i16 %call488, i16* @tmp_stack_buf_crc, align 2, !dbg !1484
  %423 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1484
  %424 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1484
  %stack_and_buf_crc489 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %424, i32 0, i32 2, !dbg !1484
  store i16 %423, i16* %stack_and_buf_crc489, align 2, !dbg !1484
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1484
  br label %if.end490

if.end490:                                        ; preds = %if.else477, %if.then464
  br label %do.end492, !dbg !1473

do.end492:                                        ; preds = %if.end490
  call void @task_commit(), !dbg !1494
  %425 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1495
  %globals493 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %425, i32 0, i32 1, !dbg !1495
  %check494 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals493, i32 0, i32 18, !dbg !1495
  %426 = load i16, i16* %check494, align 2, !dbg !1495
  %cmp495 = icmp eq i16 %426, 0, !dbg !1497
  br i1 %cmp495, label %if.then496, label %if.end528, !dbg !1498

if.then496:                                       ; preds = %do.end492
  call void @task_reduce_add(), !dbg !1499
  br label %do.body497, !dbg !1501

do.body497:                                       ; preds = %if.then496
  %427 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1502
  %cmp498 = icmp eq i16 %427, 1, !dbg !1502
  br i1 %cmp498, label %if.then499, label %if.else512, !dbg !1505

if.then499:                                       ; preds = %do.body497
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1506
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1506
  %428 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1506
  %reg_file500 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %428, i32 0, i32 0, !dbg !1506
  %arraydecay501 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file500, i16 0, i16 0, !dbg !1506
  call void @__dump_registers(i16* %arraydecay501), !dbg !1506
  call void @llvm.dbg.declare(metadata i16* %__x502, metadata !1508, metadata !DIExpression()), !dbg !1510
  %429 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1510, !srcloc !1511
  store i16 %429, i16* %__x502, align 2, !dbg !1510
  %430 = load i16, i16* %__x502, align 2, !dbg !1510
  store i16 %430, i16* %tmp503, align 2, !dbg !1510
  %431 = load i16, i16* %tmp503, align 2, !dbg !1510
  %add504 = add i16 %431, 2, !dbg !1506
  %432 = inttoptr i16 %add504 to i8*, !dbg !1506
  call void @llvm.dbg.declare(metadata i16* %__x505, metadata !1512, metadata !DIExpression()), !dbg !1514
  %433 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1514, !srcloc !1515
  store i16 %433, i16* %__x505, align 2, !dbg !1514
  %434 = load i16, i16* %__x505, align 2, !dbg !1514
  store i16 %434, i16* %tmp506, align 2, !dbg !1514
  %435 = load i16, i16* %tmp506, align 2, !dbg !1514
  %add507 = add i16 %435, 2, !dbg !1506
  %sub508 = sub i16 9216, %add507, !dbg !1506
  %call509 = call zeroext i16 @__fast_hw_crc(i8* %432, i16 zeroext %sub508, i16 zeroext -1), !dbg !1506
  store i16 %call509, i16* @tmp_stack_crc, align 2, !dbg !1506
  %436 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1506
  %437 = bitcast %struct.camel_buffer_t* %436 to i8*, !dbg !1506
  %438 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1506
  %call510 = call zeroext i16 @__fast_hw_crc(i8* %437, i16 zeroext 346, i16 zeroext %438), !dbg !1506
  store i16 %call510, i16* @tmp_stack_buf_crc, align 2, !dbg !1506
  %439 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1506
  %440 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1506
  %stack_and_buf_crc511 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %440, i32 0, i32 2, !dbg !1506
  store i16 %439, i16* %stack_and_buf_crc511, align 2, !dbg !1506
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1506
  br label %if.end525, !dbg !1506

if.else512:                                       ; preds = %do.body497
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1516
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1516
  %441 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1516
  %reg_file513 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %441, i32 0, i32 0, !dbg !1516
  %arraydecay514 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file513, i16 0, i16 0, !dbg !1516
  call void @__dump_registers(i16* %arraydecay514), !dbg !1516
  call void @llvm.dbg.declare(metadata i16* %__x515, metadata !1518, metadata !DIExpression()), !dbg !1520
  %442 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1520, !srcloc !1521
  store i16 %442, i16* %__x515, align 2, !dbg !1520
  %443 = load i16, i16* %__x515, align 2, !dbg !1520
  store i16 %443, i16* %tmp516, align 2, !dbg !1520
  %444 = load i16, i16* %tmp516, align 2, !dbg !1520
  %add517 = add i16 %444, 2, !dbg !1516
  %445 = inttoptr i16 %add517 to i8*, !dbg !1516
  call void @llvm.dbg.declare(metadata i16* %__x518, metadata !1522, metadata !DIExpression()), !dbg !1524
  %446 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1524, !srcloc !1525
  store i16 %446, i16* %__x518, align 2, !dbg !1524
  %447 = load i16, i16* %__x518, align 2, !dbg !1524
  store i16 %447, i16* %tmp519, align 2, !dbg !1524
  %448 = load i16, i16* %tmp519, align 2, !dbg !1524
  %add520 = add i16 %448, 2, !dbg !1516
  %sub521 = sub i16 9216, %add520, !dbg !1516
  %call522 = call zeroext i16 @__fast_hw_crc(i8* %445, i16 zeroext %sub521, i16 zeroext -1), !dbg !1516
  store i16 %call522, i16* @tmp_stack_crc, align 2, !dbg !1516
  %449 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1516
  %450 = bitcast %struct.camel_buffer_t* %449 to i8*, !dbg !1516
  %451 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1516
  %call523 = call zeroext i16 @__fast_hw_crc(i8* %450, i16 zeroext 346, i16 zeroext %451), !dbg !1516
  store i16 %call523, i16* @tmp_stack_buf_crc, align 2, !dbg !1516
  %452 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1516
  %453 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1516
  %stack_and_buf_crc524 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %453, i32 0, i32 2, !dbg !1516
  store i16 %452, i16* %stack_and_buf_crc524, align 2, !dbg !1516
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1516
  br label %if.end525

if.end525:                                        ; preds = %if.else512, %if.then499
  br label %do.end527, !dbg !1505

do.end527:                                        ; preds = %if.end525
  call void @task_commit(), !dbg !1526
  br label %if.end528, !dbg !1527

if.end528:                                        ; preds = %do.end527, %do.end492
  call void @task_reduce_subtract(), !dbg !1528
  br label %do.body529, !dbg !1529

do.body529:                                       ; preds = %if.end528
  %454 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1530
  %cmp530 = icmp eq i16 %454, 1, !dbg !1530
  br i1 %cmp530, label %if.then531, label %if.else544, !dbg !1533

if.then531:                                       ; preds = %do.body529
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1534
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1534
  %455 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1534
  %reg_file532 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %455, i32 0, i32 0, !dbg !1534
  %arraydecay533 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file532, i16 0, i16 0, !dbg !1534
  call void @__dump_registers(i16* %arraydecay533), !dbg !1534
  call void @llvm.dbg.declare(metadata i16* %__x534, metadata !1536, metadata !DIExpression()), !dbg !1538
  %456 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1538, !srcloc !1539
  store i16 %456, i16* %__x534, align 2, !dbg !1538
  %457 = load i16, i16* %__x534, align 2, !dbg !1538
  store i16 %457, i16* %tmp535, align 2, !dbg !1538
  %458 = load i16, i16* %tmp535, align 2, !dbg !1538
  %add536 = add i16 %458, 2, !dbg !1534
  %459 = inttoptr i16 %add536 to i8*, !dbg !1534
  call void @llvm.dbg.declare(metadata i16* %__x537, metadata !1540, metadata !DIExpression()), !dbg !1542
  %460 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1542, !srcloc !1543
  store i16 %460, i16* %__x537, align 2, !dbg !1542
  %461 = load i16, i16* %__x537, align 2, !dbg !1542
  store i16 %461, i16* %tmp538, align 2, !dbg !1542
  %462 = load i16, i16* %tmp538, align 2, !dbg !1542
  %add539 = add i16 %462, 2, !dbg !1534
  %sub540 = sub i16 9216, %add539, !dbg !1534
  %call541 = call zeroext i16 @__fast_hw_crc(i8* %459, i16 zeroext %sub540, i16 zeroext -1), !dbg !1534
  store i16 %call541, i16* @tmp_stack_crc, align 2, !dbg !1534
  %463 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1534
  %464 = bitcast %struct.camel_buffer_t* %463 to i8*, !dbg !1534
  %465 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1534
  %call542 = call zeroext i16 @__fast_hw_crc(i8* %464, i16 zeroext 346, i16 zeroext %465), !dbg !1534
  store i16 %call542, i16* @tmp_stack_buf_crc, align 2, !dbg !1534
  %466 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1534
  %467 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1534
  %stack_and_buf_crc543 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %467, i32 0, i32 2, !dbg !1534
  store i16 %466, i16* %stack_and_buf_crc543, align 2, !dbg !1534
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1534
  br label %if.end557, !dbg !1534

if.else544:                                       ; preds = %do.body529
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1544
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1544
  %468 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1544
  %reg_file545 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %468, i32 0, i32 0, !dbg !1544
  %arraydecay546 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file545, i16 0, i16 0, !dbg !1544
  call void @__dump_registers(i16* %arraydecay546), !dbg !1544
  call void @llvm.dbg.declare(metadata i16* %__x547, metadata !1546, metadata !DIExpression()), !dbg !1548
  %469 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1548, !srcloc !1549
  store i16 %469, i16* %__x547, align 2, !dbg !1548
  %470 = load i16, i16* %__x547, align 2, !dbg !1548
  store i16 %470, i16* %tmp548, align 2, !dbg !1548
  %471 = load i16, i16* %tmp548, align 2, !dbg !1548
  %add549 = add i16 %471, 2, !dbg !1544
  %472 = inttoptr i16 %add549 to i8*, !dbg !1544
  call void @llvm.dbg.declare(metadata i16* %__x550, metadata !1550, metadata !DIExpression()), !dbg !1552
  %473 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1552, !srcloc !1553
  store i16 %473, i16* %__x550, align 2, !dbg !1552
  %474 = load i16, i16* %__x550, align 2, !dbg !1552
  store i16 %474, i16* %tmp551, align 2, !dbg !1552
  %475 = load i16, i16* %tmp551, align 2, !dbg !1552
  %add552 = add i16 %475, 2, !dbg !1544
  %sub553 = sub i16 9216, %add552, !dbg !1544
  %call554 = call zeroext i16 @__fast_hw_crc(i8* %472, i16 zeroext %sub553, i16 zeroext -1), !dbg !1544
  store i16 %call554, i16* @tmp_stack_crc, align 2, !dbg !1544
  %476 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1544
  %477 = bitcast %struct.camel_buffer_t* %476 to i8*, !dbg !1544
  %478 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1544
  %call555 = call zeroext i16 @__fast_hw_crc(i8* %477, i16 zeroext 346, i16 zeroext %478), !dbg !1544
  store i16 %call555, i16* @tmp_stack_buf_crc, align 2, !dbg !1544
  %479 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1544
  %480 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1544
  %stack_and_buf_crc556 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %480, i32 0, i32 2, !dbg !1544
  store i16 %479, i16* %stack_and_buf_crc556, align 2, !dbg !1544
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1544
  br label %if.end557

if.end557:                                        ; preds = %if.else544, %if.then531
  br label %do.end559, !dbg !1533

do.end559:                                        ; preds = %if.end557
  call void @task_commit(), !dbg !1554
  br label %do.cond560, !dbg !1555

do.cond560:                                       ; preds = %do.end559
  %481 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1556
  %globals561 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %481, i32 0, i32 1, !dbg !1556
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals561, i32 0, i32 10, !dbg !1556
  %482 = load i16, i16* %reduce, align 2, !dbg !1556
  %add562 = add i16 %482, 1, !dbg !1557
  %cmp563 = icmp ugt i16 %add562, 4, !dbg !1558
  br i1 %cmp563, label %do.body399, label %do.end564, !dbg !1555, !llvm.loop !1559

do.end564:                                        ; preds = %do.cond560
  br label %if.end565, !dbg !1561

if.end565:                                        ; preds = %do.end564, %if.end394
  %483 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1562
  %globals566 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %483, i32 0, i32 1, !dbg !1562
  %check_final567 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals566, i32 0, i32 19, !dbg !1562
  %484 = load i16, i16* %check_final567, align 2, !dbg !1562
  %cmp568 = icmp eq i16 %484, 0, !dbg !1564
  br i1 %cmp568, label %if.then569, label %if.else601, !dbg !1565

if.then569:                                       ; preds = %if.end565
  call void @task_mult_block_get_result(), !dbg !1566
  br label %do.body570, !dbg !1568

do.body570:                                       ; preds = %if.then569
  %485 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1569
  %cmp571 = icmp eq i16 %485, 1, !dbg !1569
  br i1 %cmp571, label %if.then572, label %if.else585, !dbg !1572

if.then572:                                       ; preds = %do.body570
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1573
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1573
  %486 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1573
  %reg_file573 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %486, i32 0, i32 0, !dbg !1573
  %arraydecay574 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file573, i16 0, i16 0, !dbg !1573
  call void @__dump_registers(i16* %arraydecay574), !dbg !1573
  call void @llvm.dbg.declare(metadata i16* %__x575, metadata !1575, metadata !DIExpression()), !dbg !1577
  %487 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1577, !srcloc !1578
  store i16 %487, i16* %__x575, align 2, !dbg !1577
  %488 = load i16, i16* %__x575, align 2, !dbg !1577
  store i16 %488, i16* %tmp576, align 2, !dbg !1577
  %489 = load i16, i16* %tmp576, align 2, !dbg !1577
  %add577 = add i16 %489, 2, !dbg !1573
  %490 = inttoptr i16 %add577 to i8*, !dbg !1573
  call void @llvm.dbg.declare(metadata i16* %__x578, metadata !1579, metadata !DIExpression()), !dbg !1581
  %491 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1581, !srcloc !1582
  store i16 %491, i16* %__x578, align 2, !dbg !1581
  %492 = load i16, i16* %__x578, align 2, !dbg !1581
  store i16 %492, i16* %tmp579, align 2, !dbg !1581
  %493 = load i16, i16* %tmp579, align 2, !dbg !1581
  %add580 = add i16 %493, 2, !dbg !1573
  %sub581 = sub i16 9216, %add580, !dbg !1573
  %call582 = call zeroext i16 @__fast_hw_crc(i8* %490, i16 zeroext %sub581, i16 zeroext -1), !dbg !1573
  store i16 %call582, i16* @tmp_stack_crc, align 2, !dbg !1573
  %494 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1573
  %495 = bitcast %struct.camel_buffer_t* %494 to i8*, !dbg !1573
  %496 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1573
  %call583 = call zeroext i16 @__fast_hw_crc(i8* %495, i16 zeroext 346, i16 zeroext %496), !dbg !1573
  store i16 %call583, i16* @tmp_stack_buf_crc, align 2, !dbg !1573
  %497 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1573
  %498 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1573
  %stack_and_buf_crc584 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %498, i32 0, i32 2, !dbg !1573
  store i16 %497, i16* %stack_and_buf_crc584, align 2, !dbg !1573
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1573
  br label %if.end598, !dbg !1573

if.else585:                                       ; preds = %do.body570
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1583
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1583
  %499 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1583
  %reg_file586 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %499, i32 0, i32 0, !dbg !1583
  %arraydecay587 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file586, i16 0, i16 0, !dbg !1583
  call void @__dump_registers(i16* %arraydecay587), !dbg !1583
  call void @llvm.dbg.declare(metadata i16* %__x588, metadata !1585, metadata !DIExpression()), !dbg !1587
  %500 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1587, !srcloc !1588
  store i16 %500, i16* %__x588, align 2, !dbg !1587
  %501 = load i16, i16* %__x588, align 2, !dbg !1587
  store i16 %501, i16* %tmp589, align 2, !dbg !1587
  %502 = load i16, i16* %tmp589, align 2, !dbg !1587
  %add590 = add i16 %502, 2, !dbg !1583
  %503 = inttoptr i16 %add590 to i8*, !dbg !1583
  call void @llvm.dbg.declare(metadata i16* %__x591, metadata !1589, metadata !DIExpression()), !dbg !1591
  %504 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1591, !srcloc !1592
  store i16 %504, i16* %__x591, align 2, !dbg !1591
  %505 = load i16, i16* %__x591, align 2, !dbg !1591
  store i16 %505, i16* %tmp592, align 2, !dbg !1591
  %506 = load i16, i16* %tmp592, align 2, !dbg !1591
  %add593 = add i16 %506, 2, !dbg !1583
  %sub594 = sub i16 9216, %add593, !dbg !1583
  %call595 = call zeroext i16 @__fast_hw_crc(i8* %503, i16 zeroext %sub594, i16 zeroext -1), !dbg !1583
  store i16 %call595, i16* @tmp_stack_crc, align 2, !dbg !1583
  %507 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1583
  %508 = bitcast %struct.camel_buffer_t* %507 to i8*, !dbg !1583
  %509 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1583
  %call596 = call zeroext i16 @__fast_hw_crc(i8* %508, i16 zeroext 346, i16 zeroext %509), !dbg !1583
  store i16 %call596, i16* @tmp_stack_buf_crc, align 2, !dbg !1583
  %510 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1583
  %511 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1583
  %stack_and_buf_crc597 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %511, i32 0, i32 2, !dbg !1583
  store i16 %510, i16* %stack_and_buf_crc597, align 2, !dbg !1583
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1583
  br label %if.end598

if.end598:                                        ; preds = %if.else585, %if.then572
  br label %do.end600, !dbg !1572

do.end600:                                        ; preds = %if.end598
  call void @task_commit(), !dbg !1593
  br label %if.end638, !dbg !1594

if.else601:                                       ; preds = %if.end565
  %512 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1595
  %globals602 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %512, i32 0, i32 1, !dbg !1595
  %check_final603 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals602, i32 0, i32 19, !dbg !1595
  %513 = load i16, i16* %check_final603, align 2, !dbg !1595
  %cmp604 = icmp eq i16 %513, 1, !dbg !1597
  br i1 %cmp604, label %if.then605, label %if.end637, !dbg !1598

if.then605:                                       ; preds = %if.else601
  call void @task_square_base_get_result(), !dbg !1599
  br label %do.body606, !dbg !1601

do.body606:                                       ; preds = %if.then605
  %514 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1602
  %cmp607 = icmp eq i16 %514, 1, !dbg !1602
  br i1 %cmp607, label %if.then608, label %if.else621, !dbg !1605

if.then608:                                       ; preds = %do.body606
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1606
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1606
  %515 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1606
  %reg_file609 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %515, i32 0, i32 0, !dbg !1606
  %arraydecay610 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file609, i16 0, i16 0, !dbg !1606
  call void @__dump_registers(i16* %arraydecay610), !dbg !1606
  call void @llvm.dbg.declare(metadata i16* %__x611, metadata !1608, metadata !DIExpression()), !dbg !1610
  %516 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1610, !srcloc !1611
  store i16 %516, i16* %__x611, align 2, !dbg !1610
  %517 = load i16, i16* %__x611, align 2, !dbg !1610
  store i16 %517, i16* %tmp612, align 2, !dbg !1610
  %518 = load i16, i16* %tmp612, align 2, !dbg !1610
  %add613 = add i16 %518, 2, !dbg !1606
  %519 = inttoptr i16 %add613 to i8*, !dbg !1606
  call void @llvm.dbg.declare(metadata i16* %__x614, metadata !1612, metadata !DIExpression()), !dbg !1614
  %520 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1614, !srcloc !1615
  store i16 %520, i16* %__x614, align 2, !dbg !1614
  %521 = load i16, i16* %__x614, align 2, !dbg !1614
  store i16 %521, i16* %tmp615, align 2, !dbg !1614
  %522 = load i16, i16* %tmp615, align 2, !dbg !1614
  %add616 = add i16 %522, 2, !dbg !1606
  %sub617 = sub i16 9216, %add616, !dbg !1606
  %call618 = call zeroext i16 @__fast_hw_crc(i8* %519, i16 zeroext %sub617, i16 zeroext -1), !dbg !1606
  store i16 %call618, i16* @tmp_stack_crc, align 2, !dbg !1606
  %523 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1606
  %524 = bitcast %struct.camel_buffer_t* %523 to i8*, !dbg !1606
  %525 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1606
  %call619 = call zeroext i16 @__fast_hw_crc(i8* %524, i16 zeroext 346, i16 zeroext %525), !dbg !1606
  store i16 %call619, i16* @tmp_stack_buf_crc, align 2, !dbg !1606
  %526 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1606
  %527 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1606
  %stack_and_buf_crc620 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %527, i32 0, i32 2, !dbg !1606
  store i16 %526, i16* %stack_and_buf_crc620, align 2, !dbg !1606
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1606
  br label %if.end634, !dbg !1606

if.else621:                                       ; preds = %do.body606
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1616
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1616
  %528 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1616
  %reg_file622 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %528, i32 0, i32 0, !dbg !1616
  %arraydecay623 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file622, i16 0, i16 0, !dbg !1616
  call void @__dump_registers(i16* %arraydecay623), !dbg !1616
  call void @llvm.dbg.declare(metadata i16* %__x624, metadata !1618, metadata !DIExpression()), !dbg !1620
  %529 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1620, !srcloc !1621
  store i16 %529, i16* %__x624, align 2, !dbg !1620
  %530 = load i16, i16* %__x624, align 2, !dbg !1620
  store i16 %530, i16* %tmp625, align 2, !dbg !1620
  %531 = load i16, i16* %tmp625, align 2, !dbg !1620
  %add626 = add i16 %531, 2, !dbg !1616
  %532 = inttoptr i16 %add626 to i8*, !dbg !1616
  call void @llvm.dbg.declare(metadata i16* %__x627, metadata !1622, metadata !DIExpression()), !dbg !1624
  %533 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1624, !srcloc !1625
  store i16 %533, i16* %__x627, align 2, !dbg !1624
  %534 = load i16, i16* %__x627, align 2, !dbg !1624
  store i16 %534, i16* %tmp628, align 2, !dbg !1624
  %535 = load i16, i16* %tmp628, align 2, !dbg !1624
  %add629 = add i16 %535, 2, !dbg !1616
  %sub630 = sub i16 9216, %add629, !dbg !1616
  %call631 = call zeroext i16 @__fast_hw_crc(i8* %532, i16 zeroext %sub630, i16 zeroext -1), !dbg !1616
  store i16 %call631, i16* @tmp_stack_crc, align 2, !dbg !1616
  %536 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1616
  %537 = bitcast %struct.camel_buffer_t* %536 to i8*, !dbg !1616
  %538 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1616
  %call632 = call zeroext i16 @__fast_hw_crc(i8* %537, i16 zeroext 346, i16 zeroext %538), !dbg !1616
  store i16 %call632, i16* @tmp_stack_buf_crc, align 2, !dbg !1616
  %539 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1616
  %540 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1616
  %stack_and_buf_crc633 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %540, i32 0, i32 2, !dbg !1616
  store i16 %539, i16* %stack_and_buf_crc633, align 2, !dbg !1616
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1616
  br label %if.end634

if.end634:                                        ; preds = %if.else621, %if.then608
  br label %do.end636, !dbg !1605

do.end636:                                        ; preds = %if.end634
  call void @task_commit(), !dbg !1626
  br label %if.end637, !dbg !1627

if.end637:                                        ; preds = %do.end636, %if.else601
  br label %if.end638

if.end638:                                        ; preds = %if.end637, %do.end600
  br label %while.body18, !dbg !1055, !llvm.loop !1628

while.end:                                        ; preds = %if.then254
  br label %while.body, !dbg !1026, !llvm.loop !1630
}

declare dso_local void @__dump_registers(i16*) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!95, !96, !97}
!llvm.ident = !{!98}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 179, type: !90, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !12, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_rsa.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 32, baseType: !9)
!8 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 65, baseType: !11)
!10 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!11 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!13, !18, !0, !20, !67, !69, !72, !84}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 75, type: !15, isLocal: false, isDefinition: true)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !17)
!17 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 76, type: !15, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 186, type: !22, isLocal: false, isDefinition: true)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 16)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 172, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 167, size: 2784, elements: !25)
!25 = !{!26, !31, !66}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !24, file: !3, line: 169, baseType: !27, size: 176)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 176, elements: !29)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 72, baseType: !15)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !24, file: !3, line: 170, baseType: !32, size: 2592, offset: 176)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 164, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 135, size: 2592, elements: !34)
!34 = !{!35, !40, !41, !42, !43, !44, !45, !46, !50, !51, !52, !53, !57, !58, !59, !60, !61, !62, !64, !65}
!35 = !DIDerivedType(tag: DW_TAG_member, name: "product", scope: !33, file: !3, line: 137, baseType: !36, size: 512)
!36 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 512, elements: !38)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "digit_t", file: !3, line: 14, baseType: !15)
!38 = !{!39}
!39 = !DISubrange(count: 32)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "exponent", scope: !33, file: !3, line: 138, baseType: !37, size: 16, offset: 512)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "exponent_next", scope: !33, file: !3, line: 139, baseType: !37, size: 16, offset: 528)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "block_offset", scope: !33, file: !3, line: 140, baseType: !6, size: 16, offset: 544)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "message_length", scope: !33, file: !3, line: 141, baseType: !6, size: 16, offset: 560)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext_len", scope: !33, file: !3, line: 142, baseType: !6, size: 16, offset: 576)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "base", scope: !33, file: !3, line: 143, baseType: !36, size: 512, offset: 592)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "modulus", scope: !33, file: !3, line: 144, baseType: !47, size: 64, offset: 1104)
!47 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 64, elements: !48)
!48 = !{!49}
!49 = !DISubrange(count: 4)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "digit", scope: !33, file: !3, line: 145, baseType: !37, size: 16, offset: 1168)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "carry", scope: !33, file: !3, line: 146, baseType: !37, size: 16, offset: 1184)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "reduce", scope: !33, file: !3, line: 147, baseType: !6, size: 16, offset: 1200)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext", scope: !33, file: !3, line: 148, baseType: !54, size: 256, offset: 1216)
!54 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 256, elements: !55)
!55 = !{!56}
!56 = !DISubrange(count: 16)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !33, file: !3, line: 149, baseType: !6, size: 16, offset: 1472)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "n_div", scope: !33, file: !3, line: 150, baseType: !37, size: 16, offset: 1488)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "product2", scope: !33, file: !3, line: 151, baseType: !36, size: 512, offset: 1504)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "block", scope: !33, file: !3, line: 152, baseType: !36, size: 512, offset: 2016)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "quotient", scope: !33, file: !3, line: 153, baseType: !6, size: 16, offset: 2528)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "print_which", scope: !33, file: !3, line: 154, baseType: !63, size: 8, offset: 2544)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !33, file: !3, line: 161, baseType: !6, size: 16, offset: 2560)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "check_final", scope: !33, file: !3, line: 162, baseType: !6, size: 16, offset: 2576)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !24, file: !3, line: 171, baseType: !15, size: 16, offset: 2768)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 186, type: !22, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 215, type: !71, isLocal: false, isDefinition: true)
!71 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 176, elements: !29)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "pubkey", scope: !2, file: !3, line: 38, type: !74, isLocal: true, isDefinition: true)
!74 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !75)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "pubkey_t", file: !3, line: 20, baseType: !76)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 17, size: 48, elements: !77)
!77 = !{!78, !83}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !76, file: !3, line: 18, baseType: !79, size: 32)
!79 = !DICompositeType(tag: DW_TAG_array_type, baseType: !80, size: 32, elements: !48)
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 20, baseType: !81)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 29, baseType: !82)
!82 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !76, file: !3, line: 19, baseType: !37, size: 16, offset: 32)
!84 = !DIGlobalVariableExpression(var: !85, expr: !DIExpression())
!85 = distinct !DIGlobalVariable(name: "PLAINTEXT", scope: !2, file: !3, line: 42, type: !86, isLocal: true, isDefinition: true)
!86 = !DICompositeType(tag: DW_TAG_array_type, baseType: !87, size: 72, elements: !88)
!87 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!88 = !{!89}
!89 = !DISubrange(count: 9)
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 174, size: 5584, elements: !91)
!91 = !{!92, !93, !94}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !90, file: !3, line: 176, baseType: !15, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !90, file: !3, line: 177, baseType: !23, size: 2784, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !90, file: !3, line: 178, baseType: !23, size: 2784, offset: 2800)
!95 = !{i32 2, !"Dwarf Version", i32 4}
!96 = !{i32 2, !"Debug Info Version", i32 3}
!97 = !{i32 1, !"wchar_size", i32 2}
!98 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!99 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 188, type: !100, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DISubroutineType(types: !101)
!101 = !{null}
!102 = !DILocation(line: 189, column: 10, scope: !99)
!103 = !DILocation(line: 191, column: 9, scope: !99)
!104 = !DILocation(line: 193, column: 9, scope: !99)
!105 = !DILocation(line: 198, column: 11, scope: !99)
!106 = !DILocation(line: 203, column: 12, scope: !99)
!107 = !DILocation(line: 204, column: 10, scope: !99)
!108 = !DILocation(line: 205, column: 10, scope: !99)
!109 = !DILocation(line: 207, column: 10, scope: !99)
!110 = !DILocation(line: 208, column: 12, scope: !99)
!111 = !DILocation(line: 211, column: 10, scope: !99)
!112 = !DILocation(line: 213, column: 1, scope: !99)
!113 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 217, type: !100, scopeLine: 217, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 218, column: 14, scope: !115)
!115 = distinct !DILexicalBlock(scope: !113, file: !3, line: 218, column: 8)
!116 = !DILocation(line: 218, column: 19, scope: !115)
!117 = !DILocation(line: 218, column: 8, scope: !113)
!118 = !DILocation(line: 219, column: 14, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !3, line: 218, column: 34)
!120 = !DILocation(line: 220, column: 16, scope: !119)
!121 = !DILocation(line: 221, column: 5, scope: !119)
!122 = !DILocation(line: 221, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !3, line: 221, column: 15)
!124 = !DILocation(line: 221, column: 26, scope: !123)
!125 = !DILocation(line: 221, column: 15, scope: !115)
!126 = !DILocation(line: 222, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !3, line: 221, column: 41)
!128 = !DILocation(line: 223, column: 16, scope: !127)
!129 = !DILocation(line: 224, column: 5, scope: !127)
!130 = !DILocation(line: 225, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !3, line: 224, column: 12)
!132 = !DILocation(line: 242, column: 3, scope: !133)
!133 = distinct !DILexicalBlock(scope: !113, file: !3, line: 242, column: 3)
!134 = !{i32 -2146704283}
!135 = !DILocalVariable(name: "__x", scope: !136, file: !3, line: 244, type: !6)
!136 = distinct !DILexicalBlock(scope: !113, file: !3, line: 244, column: 33)
!137 = !DILocation(line: 244, column: 33, scope: !136)
!138 = !{i32 -2146704047}
!139 = !DILocation(line: 244, column: 51, scope: !113)
!140 = !DILocation(line: 244, column: 33, scope: !113)
!141 = !DILocalVariable(name: "__x", scope: !142, file: !3, line: 244, type: !6)
!142 = distinct !DILexicalBlock(scope: !113, file: !3, line: 244, column: 65)
!143 = !DILocation(line: 244, column: 65, scope: !142)
!144 = !{i32 -2146703922}
!145 = !DILocation(line: 244, column: 83, scope: !113)
!146 = !DILocation(line: 244, column: 63, scope: !113)
!147 = !DILocation(line: 244, column: 19, scope: !113)
!148 = !DILocation(line: 244, column: 17, scope: !113)
!149 = !DILocation(line: 245, column: 37, scope: !113)
!150 = !DILocation(line: 245, column: 71, scope: !113)
!151 = !DILocation(line: 245, column: 23, scope: !113)
!152 = !DILocation(line: 245, column: 21, scope: !113)
!153 = !DILocation(line: 248, column: 6, scope: !154)
!154 = distinct !DILexicalBlock(scope: !113, file: !3, line: 248, column: 6)
!155 = !DILocation(line: 248, column: 27, scope: !154)
!156 = !DILocation(line: 248, column: 33, scope: !154)
!157 = !DILocation(line: 248, column: 24, scope: !154)
!158 = !DILocation(line: 248, column: 6, scope: !113)
!159 = !DILocation(line: 249, column: 11, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !3, line: 248, column: 51)
!161 = !DILocation(line: 249, column: 4, scope: !160)
!162 = !DILocation(line: 249, column: 19, scope: !160)
!163 = !DILocation(line: 250, column: 4, scope: !160)
!164 = !DILocation(line: 251, column: 24, scope: !160)
!165 = !DILocation(line: 251, column: 30, scope: !160)
!166 = !DILocation(line: 251, column: 4, scope: !160)
!167 = !DILocation(line: 252, column: 3, scope: !160)
!168 = !DILocation(line: 253, column: 4, scope: !169)
!169 = distinct !DILexicalBlock(scope: !154, file: !3, line: 252, column: 9)
!170 = !DILocation(line: 256, column: 1, scope: !113)
!171 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 260, type: !100, scopeLine: 261, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!172 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 262, type: !173)
!173 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!174 = !DILocation(line: 262, column: 6, scope: !171)
!175 = !DILocalVariable(name: "message_length", scope: !171, file: !3, line: 263, type: !6)
!176 = !DILocation(line: 263, column: 11, scope: !171)
!177 = !DILocation(line: 265, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !3, line: 265, column: 2)
!179 = !DILocation(line: 265, column: 7, scope: !178)
!180 = !DILocation(line: 265, column: 14, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !3, line: 265, column: 2)
!182 = !DILocation(line: 265, column: 16, scope: !181)
!183 = !DILocation(line: 265, column: 2, scope: !178)
!184 = !DILocation(line: 266, column: 29, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !3, line: 265, column: 35)
!186 = !DILocation(line: 266, column: 20, scope: !185)
!187 = !DILocation(line: 266, column: 3, scope: !185)
!188 = !DILocation(line: 266, column: 15, scope: !185)
!189 = !DILocation(line: 266, column: 18, scope: !185)
!190 = !DILocation(line: 267, column: 2, scope: !185)
!191 = !DILocation(line: 265, column: 30, scope: !181)
!192 = !DILocation(line: 265, column: 2, scope: !181)
!193 = distinct !{!193, !183, !194}
!194 = !DILocation(line: 267, column: 2, scope: !178)
!195 = !DILocation(line: 269, column: 23, scope: !171)
!196 = !DILocation(line: 269, column: 2, scope: !171)
!197 = !DILocation(line: 269, column: 21, scope: !171)
!198 = !DILocation(line: 270, column: 2, scope: !171)
!199 = !DILocation(line: 270, column: 19, scope: !171)
!200 = !DILocation(line: 271, column: 2, scope: !171)
!201 = !DILocation(line: 271, column: 21, scope: !171)
!202 = !DILocation(line: 274, column: 2, scope: !171)
!203 = !DILocation(line: 274, column: 18, scope: !171)
!204 = !DILocation(line: 275, column: 2, scope: !171)
!205 = !DILocation(line: 275, column: 12, scope: !171)
!206 = !DILocation(line: 278, column: 1, scope: !171)
!207 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 280, type: !100, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DILocalVariable(name: "i", scope: !207, file: !3, line: 282, type: !173)
!209 = !DILocation(line: 282, column: 6, scope: !207)
!210 = !DILocation(line: 284, column: 6, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !3, line: 284, column: 6)
!212 = !DILocation(line: 284, column: 26, scope: !211)
!213 = !DILocation(line: 284, column: 23, scope: !211)
!214 = !DILocation(line: 284, column: 6, scope: !207)
!215 = !DILocation(line: 285, column: 3, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !3, line: 284, column: 46)
!217 = !DILocation(line: 287, column: 2, scope: !216)
!218 = !DILocalVariable(name: "zero", scope: !207, file: !3, line: 289, type: !37)
!219 = !DILocation(line: 289, column: 10, scope: !207)
!220 = !DILocation(line: 290, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !3, line: 290, column: 2)
!222 = !DILocation(line: 290, column: 7, scope: !221)
!223 = !DILocation(line: 290, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !3, line: 290, column: 2)
!225 = !DILocation(line: 290, column: 16, scope: !224)
!226 = !DILocation(line: 290, column: 2, scope: !221)
!227 = !DILocation(line: 291, column: 18, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 290, column: 52)
!229 = !DILocation(line: 291, column: 37, scope: !228)
!230 = !DILocation(line: 291, column: 35, scope: !228)
!231 = !DILocation(line: 291, column: 41, scope: !228)
!232 = !DILocation(line: 291, column: 39, scope: !228)
!233 = !DILocation(line: 291, column: 17, scope: !228)
!234 = !DILocation(line: 291, column: 73, scope: !228)
!235 = !DILocation(line: 291, column: 92, scope: !228)
!236 = !DILocation(line: 291, column: 90, scope: !228)
!237 = !DILocation(line: 291, column: 63, scope: !228)
!238 = !DILocation(line: 291, column: 3, scope: !228)
!239 = !DILocation(line: 291, column: 12, scope: !228)
!240 = !DILocation(line: 291, column: 15, scope: !228)
!241 = !DILocation(line: 292, column: 2, scope: !228)
!242 = !DILocation(line: 290, column: 47, scope: !224)
!243 = !DILocation(line: 290, column: 2, scope: !224)
!244 = distinct !{!244, !226, !245}
!245 = !DILocation(line: 292, column: 2, scope: !221)
!246 = !DILocation(line: 293, column: 9, scope: !247)
!247 = distinct !DILexicalBlock(scope: !207, file: !3, line: 293, column: 2)
!248 = !DILocation(line: 293, column: 7, scope: !247)
!249 = !DILocation(line: 293, column: 40, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !3, line: 293, column: 2)
!251 = !DILocation(line: 293, column: 42, scope: !250)
!252 = !DILocation(line: 293, column: 2, scope: !247)
!253 = !DILocation(line: 294, column: 3, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !3, line: 293, column: 61)
!255 = !DILocation(line: 294, column: 12, scope: !254)
!256 = !DILocation(line: 294, column: 15, scope: !254)
!257 = !DILocation(line: 295, column: 2, scope: !254)
!258 = !DILocation(line: 293, column: 56, scope: !250)
!259 = !DILocation(line: 293, column: 2, scope: !250)
!260 = distinct !{!260, !252, !261}
!261 = !DILocation(line: 295, column: 2, scope: !247)
!262 = !DILocation(line: 296, column: 2, scope: !207)
!263 = !DILocation(line: 296, column: 15, scope: !207)
!264 = !DILocation(line: 297, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !207, file: !3, line: 297, column: 2)
!266 = !DILocation(line: 297, column: 7, scope: !265)
!267 = !DILocation(line: 297, column: 14, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !3, line: 297, column: 2)
!269 = !DILocation(line: 297, column: 16, scope: !268)
!270 = !DILocation(line: 297, column: 2, scope: !265)
!271 = !DILocation(line: 298, column: 3, scope: !268)
!272 = !DILocation(line: 298, column: 13, scope: !268)
!273 = !DILocation(line: 298, column: 16, scope: !268)
!274 = !DILocation(line: 297, column: 30, scope: !268)
!275 = !DILocation(line: 297, column: 2, scope: !268)
!276 = distinct !{!276, !270, !277}
!277 = !DILocation(line: 298, column: 18, scope: !265)
!278 = !DILocation(line: 300, column: 24, scope: !207)
!279 = !DILocation(line: 300, column: 2, scope: !207)
!280 = !DILocation(line: 300, column: 15, scope: !207)
!281 = !DILocation(line: 302, column: 2, scope: !207)
!282 = !DILocation(line: 302, column: 19, scope: !207)
!283 = !DILocation(line: 304, column: 2, scope: !207)
!284 = !DILocation(line: 304, column: 12, scope: !207)
!285 = !DILocation(line: 306, column: 1, scope: !207)
!286 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 308, type: !100, scopeLine: 309, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!287 = !DILocation(line: 311, column: 6, scope: !288)
!288 = distinct !DILexicalBlock(scope: !286, file: !3, line: 311, column: 6)
!289 = !DILocation(line: 311, column: 19, scope: !288)
!290 = !DILocation(line: 311, column: 6, scope: !286)
!291 = !DILocation(line: 312, column: 3, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !3, line: 311, column: 26)
!293 = !DILocation(line: 312, column: 16, scope: !292)
!294 = !DILocation(line: 313, column: 3, scope: !292)
!295 = !DILocation(line: 313, column: 13, scope: !292)
!296 = !DILocation(line: 315, column: 2, scope: !292)
!297 = !DILocation(line: 316, column: 3, scope: !298)
!298 = distinct !DILexicalBlock(scope: !288, file: !3, line: 315, column: 9)
!299 = !DILocation(line: 316, column: 16, scope: !298)
!300 = !DILocation(line: 317, column: 3, scope: !298)
!301 = !DILocation(line: 317, column: 13, scope: !298)
!302 = !DILocation(line: 320, column: 1, scope: !286)
!303 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 322, type: !100, scopeLine: 323, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!304 = !DILocation(line: 325, column: 2, scope: !303)
!305 = !DILocation(line: 325, column: 18, scope: !303)
!306 = !DILocation(line: 327, column: 1, scope: !303)
!307 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 329, type: !100, scopeLine: 330, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!308 = !DILocalVariable(name: "i", scope: !307, file: !3, line: 331, type: !173)
!309 = !DILocation(line: 331, column: 6, scope: !307)
!310 = !DILocation(line: 333, column: 9, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !3, line: 333, column: 2)
!312 = !DILocation(line: 333, column: 7, scope: !311)
!313 = !DILocation(line: 333, column: 27, scope: !314)
!314 = distinct !DILexicalBlock(scope: !311, file: !3, line: 333, column: 2)
!315 = !DILocation(line: 333, column: 29, scope: !314)
!316 = !DILocation(line: 333, column: 2, scope: !311)
!317 = !DILocation(line: 334, column: 18, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !3, line: 333, column: 40)
!319 = !DILocation(line: 334, column: 30, scope: !318)
!320 = !DILocation(line: 334, column: 3, scope: !318)
!321 = !DILocation(line: 334, column: 13, scope: !318)
!322 = !DILocation(line: 334, column: 16, scope: !318)
!323 = !DILocation(line: 335, column: 2, scope: !318)
!324 = !DILocation(line: 333, column: 35, scope: !314)
!325 = !DILocation(line: 333, column: 2, scope: !314)
!326 = distinct !{!326, !316, !327}
!327 = !DILocation(line: 335, column: 2, scope: !311)
!328 = !DILocation(line: 338, column: 6, scope: !329)
!329 = distinct !DILexicalBlock(scope: !307, file: !3, line: 338, column: 6)
!330 = !DILocation(line: 338, column: 19, scope: !329)
!331 = !DILocation(line: 338, column: 6, scope: !307)
!332 = !DILocation(line: 340, column: 3, scope: !333)
!333 = distinct !DILexicalBlock(scope: !329, file: !3, line: 338, column: 24)
!334 = !DILocation(line: 340, column: 13, scope: !333)
!335 = !DILocation(line: 343, column: 2, scope: !333)
!336 = !DILocation(line: 345, column: 7, scope: !337)
!337 = distinct !DILexicalBlock(scope: !338, file: !3, line: 345, column: 7)
!338 = distinct !DILexicalBlock(scope: !329, file: !3, line: 343, column: 9)
!339 = !DILocation(line: 345, column: 26, scope: !337)
!340 = !DILocation(line: 345, column: 39, scope: !337)
!341 = !DILocation(line: 345, column: 7, scope: !338)
!342 = !DILocation(line: 347, column: 11, scope: !343)
!343 = distinct !DILexicalBlock(scope: !344, file: !3, line: 347, column: 4)
!344 = distinct !DILexicalBlock(scope: !337, file: !3, line: 345, column: 59)
!345 = !DILocation(line: 347, column: 9, scope: !343)
!346 = !DILocation(line: 347, column: 16, scope: !347)
!347 = distinct !DILexicalBlock(scope: !343, file: !3, line: 347, column: 4)
!348 = !DILocation(line: 347, column: 18, scope: !347)
!349 = !DILocation(line: 347, column: 4, scope: !343)
!350 = !DILocation(line: 349, column: 42, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !3, line: 347, column: 37)
!352 = !DILocation(line: 349, column: 54, scope: !351)
!353 = !DILocation(line: 349, column: 5, scope: !351)
!354 = !DILocation(line: 349, column: 20, scope: !351)
!355 = !DILocation(line: 349, column: 40, scope: !351)
!356 = !DILocation(line: 350, column: 7, scope: !351)
!357 = !DILocation(line: 350, column: 5, scope: !351)
!358 = !DILocation(line: 351, column: 4, scope: !351)
!359 = !DILocation(line: 347, column: 32, scope: !347)
!360 = !DILocation(line: 347, column: 4, scope: !347)
!361 = distinct !{!361, !349, !362}
!362 = !DILocation(line: 351, column: 4, scope: !343)
!363 = !DILocation(line: 353, column: 3, scope: !344)
!364 = !DILocation(line: 358, column: 1, scope: !307)
!365 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 360, type: !100, scopeLine: 361, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!366 = !DILocation(line: 363, column: 2, scope: !365)
!367 = !DILocation(line: 363, column: 18, scope: !365)
!368 = !DILocation(line: 365, column: 1, scope: !365)
!369 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 367, type: !100, scopeLine: 368, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!370 = !DILocalVariable(name: "i", scope: !369, file: !3, line: 369, type: !173)
!371 = !DILocation(line: 369, column: 6, scope: !369)
!372 = !DILocalVariable(name: "b", scope: !369, file: !3, line: 370, type: !37)
!373 = !DILocation(line: 370, column: 10, scope: !369)
!374 = !DILocation(line: 372, column: 9, scope: !375)
!375 = distinct !DILexicalBlock(scope: !369, file: !3, line: 372, column: 2)
!376 = !DILocation(line: 372, column: 7, scope: !375)
!377 = !DILocation(line: 372, column: 14, scope: !378)
!378 = distinct !DILexicalBlock(scope: !375, file: !3, line: 372, column: 2)
!379 = !DILocation(line: 372, column: 16, scope: !378)
!380 = !DILocation(line: 372, column: 2, scope: !375)
!381 = !DILocation(line: 373, column: 17, scope: !382)
!382 = distinct !DILexicalBlock(scope: !378, file: !3, line: 372, column: 35)
!383 = !DILocation(line: 373, column: 29, scope: !382)
!384 = !DILocation(line: 373, column: 3, scope: !382)
!385 = !DILocation(line: 373, column: 12, scope: !382)
!386 = !DILocation(line: 373, column: 15, scope: !382)
!387 = !DILocation(line: 374, column: 2, scope: !382)
!388 = !DILocation(line: 372, column: 30, scope: !378)
!389 = !DILocation(line: 372, column: 2, scope: !378)
!390 = distinct !{!390, !380, !391}
!391 = !DILocation(line: 374, column: 2, scope: !375)
!392 = !DILocation(line: 376, column: 2, scope: !369)
!393 = !DILocation(line: 376, column: 12, scope: !369)
!394 = !DILocation(line: 378, column: 1, scope: !369)
!395 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 380, type: !100, scopeLine: 381, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!396 = !DILocation(line: 383, column: 2, scope: !395)
!397 = !DILocation(line: 383, column: 12, scope: !395)
!398 = !DILocation(line: 384, column: 2, scope: !395)
!399 = !DILocation(line: 384, column: 12, scope: !395)
!400 = !DILocation(line: 387, column: 1, scope: !395)
!401 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 389, type: !100, scopeLine: 390, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!402 = !DILocalVariable(name: "i", scope: !401, file: !3, line: 391, type: !173)
!403 = !DILocation(line: 391, column: 6, scope: !401)
!404 = !DILocalVariable(name: "a", scope: !401, file: !3, line: 392, type: !37)
!405 = !DILocation(line: 392, column: 10, scope: !401)
!406 = !DILocalVariable(name: "b", scope: !401, file: !3, line: 392, type: !37)
!407 = !DILocation(line: 392, column: 13, scope: !401)
!408 = !DILocalVariable(name: "c", scope: !401, file: !3, line: 392, type: !37)
!409 = !DILocation(line: 392, column: 16, scope: !401)
!410 = !DILocalVariable(name: "dp", scope: !401, file: !3, line: 393, type: !37)
!411 = !DILocation(line: 393, column: 10, scope: !401)
!412 = !DILocalVariable(name: "p", scope: !401, file: !3, line: 393, type: !37)
!413 = !DILocation(line: 393, column: 14, scope: !401)
!414 = !DILocation(line: 395, column: 6, scope: !401)
!415 = !DILocation(line: 395, column: 4, scope: !401)
!416 = !DILocation(line: 396, column: 4, scope: !401)
!417 = !DILocation(line: 397, column: 9, scope: !418)
!418 = distinct !DILexicalBlock(scope: !401, file: !3, line: 397, column: 2)
!419 = !DILocation(line: 397, column: 7, scope: !418)
!420 = !DILocation(line: 397, column: 14, scope: !421)
!421 = distinct !DILexicalBlock(scope: !418, file: !3, line: 397, column: 2)
!422 = !DILocation(line: 397, column: 16, scope: !421)
!423 = !DILocation(line: 397, column: 2, scope: !418)
!424 = !DILocation(line: 398, column: 7, scope: !425)
!425 = distinct !DILexicalBlock(scope: !426, file: !3, line: 398, column: 7)
!426 = distinct !DILexicalBlock(scope: !421, file: !3, line: 397, column: 35)
!427 = !DILocation(line: 398, column: 19, scope: !425)
!428 = !DILocation(line: 398, column: 17, scope: !425)
!429 = !DILocation(line: 398, column: 21, scope: !425)
!430 = !DILocation(line: 398, column: 26, scope: !425)
!431 = !DILocation(line: 398, column: 29, scope: !425)
!432 = !DILocation(line: 398, column: 41, scope: !425)
!433 = !DILocation(line: 398, column: 39, scope: !425)
!434 = !DILocation(line: 398, column: 43, scope: !425)
!435 = !DILocation(line: 398, column: 7, scope: !426)
!436 = !DILocation(line: 399, column: 8, scope: !437)
!437 = distinct !DILexicalBlock(scope: !425, file: !3, line: 398, column: 57)
!438 = !DILocation(line: 399, column: 17, scope: !437)
!439 = !DILocation(line: 399, column: 27, scope: !437)
!440 = !DILocation(line: 399, column: 26, scope: !437)
!441 = !DILocation(line: 399, column: 6, scope: !437)
!442 = !DILocation(line: 400, column: 8, scope: !437)
!443 = !DILocation(line: 400, column: 18, scope: !437)
!444 = !DILocation(line: 400, column: 6, scope: !437)
!445 = !DILocation(line: 401, column: 9, scope: !437)
!446 = !DILocation(line: 401, column: 13, scope: !437)
!447 = !DILocation(line: 401, column: 11, scope: !437)
!448 = !DILocation(line: 401, column: 7, scope: !437)
!449 = !DILocation(line: 403, column: 9, scope: !437)
!450 = !DILocation(line: 403, column: 12, scope: !437)
!451 = !DILocation(line: 403, column: 6, scope: !437)
!452 = !DILocation(line: 404, column: 9, scope: !437)
!453 = !DILocation(line: 404, column: 12, scope: !437)
!454 = !DILocation(line: 404, column: 6, scope: !437)
!455 = !DILocation(line: 406, column: 3, scope: !437)
!456 = !DILocation(line: 407, column: 2, scope: !426)
!457 = !DILocation(line: 397, column: 30, scope: !421)
!458 = !DILocation(line: 397, column: 2, scope: !421)
!459 = distinct !{!459, !423, !460}
!460 = !DILocation(line: 407, column: 2, scope: !418)
!461 = !DILocation(line: 409, column: 7, scope: !401)
!462 = !DILocation(line: 409, column: 9, scope: !401)
!463 = !DILocation(line: 409, column: 4, scope: !401)
!464 = !DILocation(line: 410, column: 4, scope: !401)
!465 = !DILocation(line: 412, column: 27, scope: !401)
!466 = !DILocation(line: 412, column: 2, scope: !401)
!467 = !DILocation(line: 412, column: 14, scope: !401)
!468 = !DILocation(line: 412, column: 25, scope: !401)
!469 = !DILocation(line: 413, column: 2, scope: !401)
!470 = !DILocation(line: 413, column: 18, scope: !401)
!471 = !DILocation(line: 414, column: 2, scope: !401)
!472 = !DILocation(line: 414, column: 11, scope: !401)
!473 = !DILocation(line: 416, column: 6, scope: !474)
!474 = distinct !DILexicalBlock(scope: !401, file: !3, line: 416, column: 6)
!475 = !DILocation(line: 416, column: 16, scope: !474)
!476 = !DILocation(line: 416, column: 6, scope: !401)
!477 = !DILocation(line: 417, column: 15, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 416, column: 34)
!479 = !DILocation(line: 417, column: 3, scope: !478)
!480 = !DILocation(line: 417, column: 13, scope: !478)
!481 = !DILocation(line: 418, column: 3, scope: !478)
!482 = !DILocation(line: 418, column: 13, scope: !478)
!483 = !DILocation(line: 420, column: 2, scope: !478)
!484 = !DILocation(line: 422, column: 3, scope: !485)
!485 = distinct !DILexicalBlock(scope: !474, file: !3, line: 420, column: 9)
!486 = !DILocation(line: 422, column: 13, scope: !485)
!487 = !DILocation(line: 425, column: 1, scope: !401)
!488 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 427, type: !100, scopeLine: 428, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!489 = !DILocalVariable(name: "d", scope: !488, file: !3, line: 429, type: !173)
!490 = !DILocation(line: 429, column: 6, scope: !488)
!491 = !DILocation(line: 431, column: 4, scope: !488)
!492 = !DILocation(line: 432, column: 2, scope: !488)
!493 = !DILocation(line: 433, column: 4, scope: !494)
!494 = distinct !DILexicalBlock(scope: !488, file: !3, line: 432, column: 5)
!495 = !DILocation(line: 434, column: 2, scope: !494)
!496 = !DILocation(line: 434, column: 11, scope: !488)
!497 = !DILocation(line: 434, column: 23, scope: !488)
!498 = !DILocation(line: 434, column: 26, scope: !488)
!499 = !DILocation(line: 434, column: 31, scope: !488)
!500 = !DILocation(line: 434, column: 34, scope: !488)
!501 = !DILocation(line: 434, column: 36, scope: !488)
!502 = !DILocation(line: 0, scope: !488)
!503 = distinct !{!503, !492, !504}
!504 = !DILocation(line: 434, column: 39, scope: !488)
!505 = !DILocation(line: 436, column: 6, scope: !506)
!506 = distinct !DILexicalBlock(scope: !488, file: !3, line: 436, column: 6)
!507 = !DILocation(line: 436, column: 18, scope: !506)
!508 = !DILocation(line: 436, column: 21, scope: !506)
!509 = !DILocation(line: 436, column: 6, scope: !488)
!510 = !DILocation(line: 437, column: 3, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !3, line: 436, column: 27)
!512 = !DILocation(line: 437, column: 13, scope: !511)
!513 = !DILocation(line: 439, column: 2, scope: !511)
!514 = !DILocation(line: 441, column: 15, scope: !488)
!515 = !DILocation(line: 441, column: 2, scope: !488)
!516 = !DILocation(line: 441, column: 13, scope: !488)
!517 = !DILocation(line: 443, column: 2, scope: !488)
!518 = !DILocation(line: 443, column: 12, scope: !488)
!519 = !DILocation(line: 445, column: 1, scope: !488)
!520 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 447, type: !100, scopeLine: 448, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!521 = !DILocalVariable(name: "i", scope: !520, file: !3, line: 449, type: !173)
!522 = !DILocation(line: 449, column: 6, scope: !520)
!523 = !DILocalVariable(name: "m", scope: !520, file: !3, line: 450, type: !6)
!524 = !DILocation(line: 450, column: 11, scope: !520)
!525 = !DILocalVariable(name: "n", scope: !520, file: !3, line: 450, type: !6)
!526 = !DILocation(line: 450, column: 14, scope: !520)
!527 = !DILocalVariable(name: "d", scope: !520, file: !3, line: 450, type: !6)
!528 = !DILocation(line: 450, column: 17, scope: !520)
!529 = !DILocalVariable(name: "normalizable", scope: !520, file: !3, line: 451, type: !63)
!530 = !DILocation(line: 451, column: 7, scope: !520)
!531 = !DILocation(line: 453, column: 15, scope: !520)
!532 = !DILocation(line: 453, column: 26, scope: !520)
!533 = !DILocation(line: 453, column: 30, scope: !520)
!534 = !DILocation(line: 453, column: 2, scope: !520)
!535 = !DILocation(line: 453, column: 13, scope: !520)
!536 = !DILocation(line: 455, column: 11, scope: !537)
!537 = distinct !DILexicalBlock(scope: !520, file: !3, line: 455, column: 2)
!538 = !DILocation(line: 455, column: 9, scope: !537)
!539 = !DILocation(line: 455, column: 7, scope: !537)
!540 = !DILocation(line: 455, column: 23, scope: !541)
!541 = distinct !DILexicalBlock(scope: !537, file: !3, line: 455, column: 2)
!542 = !DILocation(line: 455, column: 25, scope: !541)
!543 = !DILocation(line: 455, column: 2, scope: !537)
!544 = !DILocation(line: 457, column: 7, scope: !545)
!545 = distinct !DILexicalBlock(scope: !546, file: !3, line: 457, column: 7)
!546 = distinct !DILexicalBlock(scope: !541, file: !3, line: 455, column: 36)
!547 = !DILocation(line: 457, column: 19, scope: !545)
!548 = !DILocation(line: 457, column: 24, scope: !545)
!549 = !DILocation(line: 457, column: 36, scope: !545)
!550 = !DILocation(line: 457, column: 38, scope: !545)
!551 = !DILocation(line: 457, column: 37, scope: !545)
!552 = !DILocation(line: 457, column: 22, scope: !545)
!553 = !DILocation(line: 457, column: 7, scope: !546)
!554 = !DILocation(line: 458, column: 4, scope: !555)
!555 = distinct !DILexicalBlock(scope: !545, file: !3, line: 457, column: 51)
!556 = !DILocation(line: 459, column: 14, scope: !557)
!557 = distinct !DILexicalBlock(scope: !545, file: !3, line: 459, column: 14)
!558 = !DILocation(line: 459, column: 26, scope: !557)
!559 = !DILocation(line: 459, column: 31, scope: !557)
!560 = !DILocation(line: 459, column: 43, scope: !557)
!561 = !DILocation(line: 459, column: 45, scope: !557)
!562 = !DILocation(line: 459, column: 44, scope: !557)
!563 = !DILocation(line: 459, column: 29, scope: !557)
!564 = !DILocation(line: 459, column: 14, scope: !545)
!565 = !DILocation(line: 460, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !557, file: !3, line: 459, column: 58)
!567 = !DILocation(line: 461, column: 4, scope: !566)
!568 = !DILocation(line: 463, column: 2, scope: !546)
!569 = !DILocation(line: 455, column: 31, scope: !541)
!570 = !DILocation(line: 455, column: 2, scope: !541)
!571 = distinct !{!571, !543, !572}
!572 = !DILocation(line: 463, column: 2, scope: !537)
!573 = !DILocation(line: 465, column: 7, scope: !574)
!574 = distinct !DILexicalBlock(scope: !520, file: !3, line: 465, column: 6)
!575 = !DILocation(line: 465, column: 20, scope: !574)
!576 = !DILocation(line: 465, column: 23, scope: !574)
!577 = !DILocation(line: 465, column: 34, scope: !574)
!578 = !DILocation(line: 465, column: 6, scope: !520)
!579 = !DILocation(line: 467, column: 3, scope: !580)
!580 = distinct !DILexicalBlock(scope: !574, file: !3, line: 465, column: 53)
!581 = !DILocation(line: 467, column: 13, scope: !580)
!582 = !DILocation(line: 469, column: 2, scope: !580)
!583 = !DILocation(line: 471, column: 6, scope: !584)
!584 = distinct !DILexicalBlock(scope: !520, file: !3, line: 471, column: 6)
!585 = !DILocation(line: 471, column: 6, scope: !520)
!586 = !DILocation(line: 472, column: 3, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !3, line: 471, column: 20)
!588 = !DILocation(line: 472, column: 13, scope: !587)
!589 = !DILocation(line: 474, column: 2, scope: !587)
!590 = !DILocation(line: 475, column: 3, scope: !591)
!591 = distinct !DILexicalBlock(scope: !584, file: !3, line: 474, column: 9)
!592 = !DILocation(line: 475, column: 13, scope: !591)
!593 = !DILocation(line: 478, column: 1, scope: !520)
!594 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 480, type: !100, scopeLine: 481, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!595 = !DILocalVariable(name: "m", scope: !594, file: !3, line: 482, type: !37)
!596 = !DILocation(line: 482, column: 10, scope: !594)
!597 = !DILocalVariable(name: "n", scope: !594, file: !3, line: 482, type: !37)
!598 = !DILocation(line: 482, column: 13, scope: !594)
!599 = !DILocalVariable(name: "d", scope: !594, file: !3, line: 482, type: !37)
!600 = !DILocation(line: 482, column: 16, scope: !594)
!601 = !DILocalVariable(name: "s", scope: !594, file: !3, line: 482, type: !37)
!602 = !DILocation(line: 482, column: 19, scope: !594)
!603 = !DILocalVariable(name: "borrow", scope: !594, file: !3, line: 483, type: !6)
!604 = !DILocation(line: 483, column: 11, scope: !594)
!605 = !DILocalVariable(name: "i", scope: !594, file: !3, line: 485, type: !173)
!606 = !DILocation(line: 485, column: 6, scope: !594)
!607 = !DILocation(line: 487, column: 2, scope: !594)
!608 = !DILocation(line: 487, column: 18, scope: !594)
!609 = !DILocation(line: 489, column: 9, scope: !594)
!610 = !DILocation(line: 490, column: 9, scope: !611)
!611 = distinct !DILexicalBlock(scope: !594, file: !3, line: 490, column: 2)
!612 = !DILocation(line: 490, column: 7, scope: !611)
!613 = !DILocation(line: 490, column: 14, scope: !614)
!614 = distinct !DILexicalBlock(scope: !611, file: !3, line: 490, column: 2)
!615 = !DILocation(line: 490, column: 16, scope: !614)
!616 = !DILocation(line: 490, column: 2, scope: !611)
!617 = !DILocation(line: 491, column: 7, scope: !618)
!618 = distinct !DILexicalBlock(scope: !614, file: !3, line: 490, column: 35)
!619 = !DILocation(line: 491, column: 19, scope: !618)
!620 = !DILocation(line: 491, column: 23, scope: !618)
!621 = !DILocation(line: 491, column: 21, scope: !618)
!622 = !DILocation(line: 491, column: 5, scope: !618)
!623 = !DILocation(line: 492, column: 7, scope: !618)
!624 = !DILocation(line: 492, column: 19, scope: !618)
!625 = !DILocation(line: 492, column: 5, scope: !618)
!626 = !DILocation(line: 494, column: 7, scope: !618)
!627 = !DILocation(line: 494, column: 11, scope: !618)
!628 = !DILocation(line: 494, column: 9, scope: !618)
!629 = !DILocation(line: 494, column: 5, scope: !618)
!630 = !DILocation(line: 495, column: 7, scope: !631)
!631 = distinct !DILexicalBlock(scope: !618, file: !3, line: 495, column: 7)
!632 = !DILocation(line: 495, column: 11, scope: !631)
!633 = !DILocation(line: 495, column: 9, scope: !631)
!634 = !DILocation(line: 495, column: 7, scope: !618)
!635 = !DILocation(line: 496, column: 6, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !3, line: 495, column: 14)
!637 = !DILocation(line: 497, column: 11, scope: !636)
!638 = !DILocation(line: 498, column: 3, scope: !636)
!639 = !DILocation(line: 499, column: 11, scope: !640)
!640 = distinct !DILexicalBlock(scope: !631, file: !3, line: 498, column: 10)
!641 = !DILocation(line: 501, column: 7, scope: !618)
!642 = !DILocation(line: 501, column: 11, scope: !618)
!643 = !DILocation(line: 501, column: 9, scope: !618)
!644 = !DILocation(line: 501, column: 5, scope: !618)
!645 = !DILocation(line: 503, column: 34, scope: !618)
!646 = !DILocation(line: 503, column: 3, scope: !618)
!647 = !DILocation(line: 503, column: 16, scope: !618)
!648 = !DILocation(line: 503, column: 20, scope: !618)
!649 = !DILocation(line: 503, column: 18, scope: !618)
!650 = !DILocation(line: 503, column: 32, scope: !618)
!651 = !DILocation(line: 504, column: 2, scope: !618)
!652 = !DILocation(line: 490, column: 30, scope: !614)
!653 = !DILocation(line: 490, column: 2, scope: !614)
!654 = distinct !{!654, !616, !655}
!655 = !DILocation(line: 504, column: 2, scope: !611)
!656 = !DILocation(line: 506, column: 6, scope: !657)
!657 = distinct !DILexicalBlock(scope: !594, file: !3, line: 506, column: 6)
!658 = !DILocation(line: 506, column: 17, scope: !657)
!659 = !DILocation(line: 506, column: 6, scope: !594)
!660 = !DILocation(line: 508, column: 2, scope: !661)
!661 = distinct !DILexicalBlock(scope: !657, file: !3, line: 506, column: 22)
!662 = !DILocation(line: 510, column: 3, scope: !663)
!663 = distinct !DILexicalBlock(scope: !657, file: !3, line: 508, column: 9)
!664 = !DILocation(line: 510, column: 13, scope: !663)
!665 = !DILocation(line: 514, column: 1, scope: !594)
!666 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 516, type: !100, scopeLine: 517, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!667 = !DILocation(line: 519, column: 16, scope: !666)
!668 = !DILocation(line: 519, column: 44, scope: !666)
!669 = !DILocation(line: 519, column: 61, scope: !666)
!670 = !DILocation(line: 519, column: 59, scope: !666)
!671 = !DILocation(line: 519, column: 2, scope: !666)
!672 = !DILocation(line: 519, column: 12, scope: !666)
!673 = !DILocation(line: 522, column: 1, scope: !666)
!674 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 524, type: !100, scopeLine: 525, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!675 = !DILocalVariable(name: "m_n", scope: !674, file: !3, line: 526, type: !37)
!676 = !DILocation(line: 526, column: 10, scope: !674)
!677 = !DILocalVariable(name: "q", scope: !674, file: !3, line: 526, type: !37)
!678 = !DILocation(line: 526, column: 15, scope: !674)
!679 = !DILocalVariable(name: "qn", scope: !674, file: !3, line: 527, type: !7)
!680 = !DILocation(line: 527, column: 11, scope: !674)
!681 = !DILocalVariable(name: "n_q", scope: !674, file: !3, line: 527, type: !7)
!682 = !DILocation(line: 527, column: 15, scope: !674)
!683 = !DILocation(line: 529, column: 6, scope: !684)
!684 = distinct !DILexicalBlock(scope: !674, file: !3, line: 529, column: 6)
!685 = !DILocation(line: 529, column: 18, scope: !684)
!686 = !DILocation(line: 529, column: 33, scope: !684)
!687 = !DILocation(line: 529, column: 30, scope: !684)
!688 = !DILocation(line: 529, column: 6, scope: !674)
!689 = !DILocation(line: 530, column: 3, scope: !690)
!690 = distinct !DILexicalBlock(scope: !684, file: !3, line: 529, column: 62)
!691 = !DILocation(line: 530, column: 16, scope: !690)
!692 = !DILocation(line: 531, column: 2, scope: !690)
!693 = !DILocation(line: 532, column: 20, scope: !694)
!694 = distinct !DILexicalBlock(scope: !684, file: !3, line: 531, column: 9)
!695 = !DILocation(line: 532, column: 32, scope: !694)
!696 = !DILocation(line: 532, column: 44, scope: !694)
!697 = !DILocation(line: 532, column: 61, scope: !694)
!698 = !DILocation(line: 532, column: 73, scope: !694)
!699 = !DILocation(line: 532, column: 83, scope: !694)
!700 = !DILocation(line: 532, column: 89, scope: !694)
!701 = !DILocation(line: 532, column: 87, scope: !694)
!702 = !DILocation(line: 532, column: 59, scope: !694)
!703 = !DILocation(line: 532, column: 3, scope: !694)
!704 = !DILocation(line: 532, column: 16, scope: !694)
!705 = !DILocation(line: 535, column: 19, scope: !674)
!706 = !DILocation(line: 535, column: 31, scope: !674)
!707 = !DILocation(line: 535, column: 9, scope: !674)
!708 = !DILocation(line: 535, column: 43, scope: !674)
!709 = !DILocation(line: 535, column: 67, scope: !674)
!710 = !DILocation(line: 535, column: 79, scope: !674)
!711 = !DILocation(line: 535, column: 90, scope: !674)
!712 = !DILocation(line: 535, column: 95, scope: !674)
!713 = !DILocation(line: 535, column: 66, scope: !674)
!714 = !DILocation(line: 535, column: 64, scope: !674)
!715 = !DILocation(line: 535, column: 112, scope: !674)
!716 = !DILocation(line: 535, column: 124, scope: !674)
!717 = !DILocation(line: 535, column: 135, scope: !674)
!718 = !DILocation(line: 535, column: 110, scope: !674)
!719 = !DILocation(line: 535, column: 6, scope: !674)
!720 = !DILocation(line: 537, column: 2, scope: !674)
!721 = !DILocation(line: 537, column: 14, scope: !674)
!722 = !DILocation(line: 538, column: 2, scope: !674)
!723 = !DILocation(line: 539, column: 3, scope: !724)
!724 = distinct !DILexicalBlock(scope: !674, file: !3, line: 538, column: 5)
!725 = !DILocation(line: 539, column: 15, scope: !724)
!726 = !DILocation(line: 540, column: 15, scope: !724)
!727 = !DILocation(line: 540, column: 26, scope: !724)
!728 = !DILocation(line: 540, column: 8, scope: !724)
!729 = !DILocation(line: 540, column: 6, scope: !724)
!730 = !DILocation(line: 542, column: 2, scope: !724)
!731 = !DILocation(line: 542, column: 11, scope: !674)
!732 = !DILocation(line: 542, column: 16, scope: !674)
!733 = !DILocation(line: 542, column: 14, scope: !674)
!734 = distinct !{!734, !722, !735}
!735 = !DILocation(line: 542, column: 19, scope: !674)
!736 = !DILocation(line: 545, column: 2, scope: !674)
!737 = !DILocation(line: 545, column: 12, scope: !674)
!738 = !DILocation(line: 548, column: 1, scope: !674)
!739 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 550, type: !100, scopeLine: 551, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!740 = !DILocalVariable(name: "i", scope: !739, file: !3, line: 552, type: !173)
!741 = !DILocation(line: 552, column: 6, scope: !739)
!742 = !DILocalVariable(name: "m", scope: !739, file: !3, line: 553, type: !37)
!743 = !DILocation(line: 553, column: 10, scope: !739)
!744 = !DILocalVariable(name: "n", scope: !739, file: !3, line: 553, type: !37)
!745 = !DILocation(line: 553, column: 13, scope: !739)
!746 = !DILocalVariable(name: "c", scope: !739, file: !3, line: 554, type: !6)
!747 = !DILocation(line: 554, column: 11, scope: !739)
!748 = !DILocalVariable(name: "offset", scope: !739, file: !3, line: 554, type: !6)
!749 = !DILocation(line: 554, column: 14, scope: !739)
!750 = !DILocation(line: 556, column: 11, scope: !739)
!751 = !DILocation(line: 556, column: 22, scope: !739)
!752 = !DILocation(line: 556, column: 26, scope: !739)
!753 = !DILocation(line: 556, column: 9, scope: !739)
!754 = !DILocation(line: 558, column: 9, scope: !755)
!755 = distinct !DILexicalBlock(scope: !739, file: !3, line: 558, column: 2)
!756 = !DILocation(line: 558, column: 7, scope: !755)
!757 = !DILocation(line: 558, column: 14, scope: !758)
!758 = distinct !DILexicalBlock(scope: !755, file: !3, line: 558, column: 2)
!759 = !DILocation(line: 558, column: 18, scope: !758)
!760 = !DILocation(line: 558, column: 16, scope: !758)
!761 = !DILocation(line: 558, column: 2, scope: !755)
!762 = !DILocation(line: 559, column: 3, scope: !763)
!763 = distinct !DILexicalBlock(scope: !758, file: !3, line: 558, column: 31)
!764 = !DILocation(line: 559, column: 16, scope: !763)
!765 = !DILocation(line: 559, column: 19, scope: !763)
!766 = !DILocation(line: 560, column: 2, scope: !763)
!767 = !DILocation(line: 558, column: 26, scope: !758)
!768 = !DILocation(line: 558, column: 2, scope: !758)
!769 = distinct !{!769, !761, !770}
!770 = !DILocation(line: 560, column: 2, scope: !755)
!771 = !DILocation(line: 561, column: 4, scope: !739)
!772 = !DILocation(line: 562, column: 11, scope: !773)
!773 = distinct !DILexicalBlock(scope: !739, file: !3, line: 562, column: 2)
!774 = !DILocation(line: 562, column: 9, scope: !773)
!775 = !DILocation(line: 562, column: 7, scope: !773)
!776 = !DILocation(line: 562, column: 19, scope: !777)
!777 = distinct !DILexicalBlock(scope: !773, file: !3, line: 562, column: 2)
!778 = !DILocation(line: 562, column: 21, scope: !777)
!779 = !DILocation(line: 562, column: 2, scope: !773)
!780 = !DILocation(line: 564, column: 7, scope: !781)
!781 = distinct !DILexicalBlock(scope: !777, file: !3, line: 562, column: 44)
!782 = !DILocation(line: 564, column: 5, scope: !781)
!783 = !DILocation(line: 565, column: 7, scope: !784)
!784 = distinct !DILexicalBlock(scope: !781, file: !3, line: 565, column: 7)
!785 = !DILocation(line: 565, column: 11, scope: !784)
!786 = !DILocation(line: 565, column: 18, scope: !784)
!787 = !DILocation(line: 565, column: 9, scope: !784)
!788 = !DILocation(line: 565, column: 7, scope: !781)
!789 = !DILocation(line: 566, column: 8, scope: !790)
!790 = distinct !DILexicalBlock(scope: !784, file: !3, line: 565, column: 32)
!791 = !DILocation(line: 566, column: 20, scope: !790)
!792 = !DILocation(line: 566, column: 24, scope: !790)
!793 = !DILocation(line: 566, column: 22, scope: !790)
!794 = !DILocation(line: 566, column: 6, scope: !790)
!795 = !DILocation(line: 568, column: 9, scope: !790)
!796 = !DILocation(line: 568, column: 24, scope: !790)
!797 = !DILocation(line: 568, column: 22, scope: !790)
!798 = !DILocation(line: 568, column: 6, scope: !790)
!799 = !DILocation(line: 569, column: 3, scope: !790)
!800 = !DILocation(line: 570, column: 6, scope: !801)
!801 = distinct !DILexicalBlock(scope: !784, file: !3, line: 569, column: 10)
!802 = !DILocation(line: 575, column: 7, scope: !781)
!803 = !DILocation(line: 575, column: 9, scope: !781)
!804 = !DILocation(line: 575, column: 5, scope: !781)
!805 = !DILocation(line: 576, column: 5, scope: !781)
!806 = !DILocation(line: 578, column: 21, scope: !781)
!807 = !DILocation(line: 578, column: 3, scope: !781)
!808 = !DILocation(line: 578, column: 16, scope: !781)
!809 = !DILocation(line: 578, column: 19, scope: !781)
!810 = !DILocation(line: 580, column: 2, scope: !781)
!811 = !DILocation(line: 562, column: 39, scope: !777)
!812 = !DILocation(line: 562, column: 2, scope: !777)
!813 = distinct !{!813, !779, !814}
!814 = !DILocation(line: 580, column: 2, scope: !773)
!815 = !DILocation(line: 581, column: 2, scope: !739)
!816 = !DILocation(line: 581, column: 18, scope: !739)
!817 = !DILocation(line: 584, column: 1, scope: !739)
!818 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 586, type: !100, scopeLine: 587, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!819 = !DILocalVariable(name: "i", scope: !818, file: !3, line: 588, type: !173)
!820 = !DILocation(line: 588, column: 6, scope: !818)
!821 = !DILocalVariable(name: "relation", scope: !818, file: !3, line: 589, type: !822)
!822 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!823 = !DILocation(line: 589, column: 7, scope: !818)
!824 = !DILocation(line: 591, column: 9, scope: !825)
!825 = distinct !DILexicalBlock(scope: !818, file: !3, line: 591, column: 2)
!826 = !DILocation(line: 591, column: 7, scope: !825)
!827 = !DILocation(line: 591, column: 31, scope: !828)
!828 = distinct !DILexicalBlock(scope: !825, file: !3, line: 591, column: 2)
!829 = !DILocation(line: 591, column: 33, scope: !828)
!830 = !DILocation(line: 591, column: 2, scope: !825)
!831 = !DILocation(line: 593, column: 7, scope: !832)
!832 = distinct !DILexicalBlock(scope: !833, file: !3, line: 593, column: 7)
!833 = distinct !DILexicalBlock(scope: !828, file: !3, line: 591, column: 44)
!834 = !DILocation(line: 593, column: 19, scope: !832)
!835 = !DILocation(line: 593, column: 24, scope: !832)
!836 = !DILocation(line: 593, column: 37, scope: !832)
!837 = !DILocation(line: 593, column: 22, scope: !832)
!838 = !DILocation(line: 593, column: 7, scope: !833)
!839 = !DILocation(line: 594, column: 13, scope: !840)
!840 = distinct !DILexicalBlock(scope: !832, file: !3, line: 593, column: 41)
!841 = !DILocation(line: 595, column: 4, scope: !840)
!842 = !DILocation(line: 596, column: 14, scope: !843)
!843 = distinct !DILexicalBlock(scope: !832, file: !3, line: 596, column: 14)
!844 = !DILocation(line: 596, column: 26, scope: !843)
!845 = !DILocation(line: 596, column: 31, scope: !843)
!846 = !DILocation(line: 596, column: 44, scope: !843)
!847 = !DILocation(line: 596, column: 29, scope: !843)
!848 = !DILocation(line: 596, column: 14, scope: !832)
!849 = !DILocation(line: 597, column: 13, scope: !850)
!850 = distinct !DILexicalBlock(scope: !843, file: !3, line: 596, column: 48)
!851 = !DILocation(line: 598, column: 4, scope: !850)
!852 = !DILocation(line: 600, column: 2, scope: !833)
!853 = !DILocation(line: 591, column: 39, scope: !828)
!854 = !DILocation(line: 591, column: 2, scope: !828)
!855 = distinct !{!855, !830, !856}
!856 = !DILocation(line: 600, column: 2, scope: !825)
!857 = !DILocation(line: 602, column: 6, scope: !858)
!858 = distinct !DILexicalBlock(scope: !818, file: !3, line: 602, column: 6)
!859 = !DILocation(line: 602, column: 15, scope: !858)
!860 = !DILocation(line: 602, column: 6, scope: !818)
!861 = !DILocation(line: 603, column: 3, scope: !862)
!862 = distinct !DILexicalBlock(scope: !858, file: !3, line: 602, column: 23)
!863 = !DILocation(line: 603, column: 13, scope: !862)
!864 = !DILocation(line: 605, column: 2, scope: !862)
!865 = !DILocation(line: 606, column: 3, scope: !866)
!866 = distinct !DILexicalBlock(scope: !858, file: !3, line: 605, column: 9)
!867 = !DILocation(line: 606, column: 13, scope: !866)
!868 = !DILocation(line: 609, column: 1, scope: !818)
!869 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 611, type: !100, scopeLine: 612, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!870 = !DILocalVariable(name: "i", scope: !869, file: !3, line: 613, type: !173)
!871 = !DILocation(line: 613, column: 6, scope: !869)
!872 = !DILocalVariable(name: "j", scope: !869, file: !3, line: 613, type: !173)
!873 = !DILocation(line: 613, column: 9, scope: !869)
!874 = !DILocalVariable(name: "m", scope: !869, file: !3, line: 614, type: !37)
!875 = !DILocation(line: 614, column: 10, scope: !869)
!876 = !DILocalVariable(name: "n", scope: !869, file: !3, line: 614, type: !37)
!877 = !DILocation(line: 614, column: 13, scope: !869)
!878 = !DILocalVariable(name: "c", scope: !869, file: !3, line: 614, type: !37)
!879 = !DILocation(line: 614, column: 16, scope: !869)
!880 = !DILocalVariable(name: "offset", scope: !869, file: !3, line: 615, type: !6)
!881 = !DILocation(line: 615, column: 11, scope: !869)
!882 = !DILocation(line: 616, column: 11, scope: !869)
!883 = !DILocation(line: 616, column: 22, scope: !869)
!884 = !DILocation(line: 616, column: 26, scope: !869)
!885 = !DILocation(line: 616, column: 9, scope: !869)
!886 = !DILocation(line: 617, column: 4, scope: !869)
!887 = !DILocation(line: 618, column: 11, scope: !888)
!888 = distinct !DILexicalBlock(scope: !869, file: !3, line: 618, column: 2)
!889 = !DILocation(line: 618, column: 9, scope: !888)
!890 = !DILocation(line: 618, column: 7, scope: !888)
!891 = !DILocation(line: 618, column: 19, scope: !892)
!892 = distinct !DILexicalBlock(scope: !888, file: !3, line: 618, column: 2)
!893 = !DILocation(line: 618, column: 21, scope: !892)
!894 = !DILocation(line: 618, column: 2, scope: !888)
!895 = !DILocation(line: 619, column: 7, scope: !896)
!896 = distinct !DILexicalBlock(scope: !892, file: !3, line: 618, column: 44)
!897 = !DILocation(line: 619, column: 19, scope: !896)
!898 = !DILocation(line: 619, column: 5, scope: !896)
!899 = !DILocation(line: 621, column: 7, scope: !896)
!900 = !DILocation(line: 621, column: 11, scope: !896)
!901 = !DILocation(line: 621, column: 9, scope: !896)
!902 = !DILocation(line: 621, column: 5, scope: !896)
!903 = !DILocation(line: 623, column: 7, scope: !904)
!904 = distinct !DILexicalBlock(scope: !896, file: !3, line: 623, column: 7)
!905 = !DILocation(line: 623, column: 11, scope: !904)
!906 = !DILocation(line: 623, column: 18, scope: !904)
!907 = !DILocation(line: 623, column: 9, scope: !904)
!908 = !DILocation(line: 623, column: 7, scope: !896)
!909 = !DILocation(line: 624, column: 8, scope: !910)
!910 = distinct !DILexicalBlock(scope: !904, file: !3, line: 623, column: 32)
!911 = !DILocation(line: 624, column: 20, scope: !910)
!912 = !DILocation(line: 624, column: 6, scope: !910)
!913 = !DILocation(line: 625, column: 3, scope: !910)
!914 = !DILocation(line: 626, column: 6, scope: !915)
!915 = distinct !DILexicalBlock(scope: !904, file: !3, line: 625, column: 10)
!916 = !DILocation(line: 627, column: 6, scope: !915)
!917 = !DILocation(line: 630, column: 20, scope: !896)
!918 = !DILocation(line: 630, column: 24, scope: !896)
!919 = !DILocation(line: 630, column: 22, scope: !896)
!920 = !DILocation(line: 630, column: 28, scope: !896)
!921 = !DILocation(line: 630, column: 26, scope: !896)
!922 = !DILocation(line: 630, column: 3, scope: !896)
!923 = !DILocation(line: 630, column: 15, scope: !896)
!924 = !DILocation(line: 630, column: 18, scope: !896)
!925 = !DILocation(line: 632, column: 7, scope: !896)
!926 = !DILocation(line: 632, column: 19, scope: !896)
!927 = !DILocation(line: 632, column: 22, scope: !896)
!928 = !DILocation(line: 632, column: 5, scope: !896)
!929 = !DILocation(line: 633, column: 3, scope: !896)
!930 = !DILocation(line: 633, column: 15, scope: !896)
!931 = !DILocation(line: 633, column: 18, scope: !896)
!932 = !DILocation(line: 634, column: 2, scope: !896)
!933 = !DILocation(line: 618, column: 39, scope: !892)
!934 = !DILocation(line: 618, column: 2, scope: !892)
!935 = distinct !{!935, !894, !936}
!936 = !DILocation(line: 634, column: 2, scope: !888)
!937 = !DILocation(line: 635, column: 2, scope: !869)
!938 = !DILocation(line: 635, column: 18, scope: !869)
!939 = !DILocation(line: 638, column: 1, scope: !869)
!940 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 640, type: !100, scopeLine: 641, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!941 = !DILocalVariable(name: "i", scope: !940, file: !3, line: 642, type: !173)
!942 = !DILocation(line: 642, column: 6, scope: !940)
!943 = !DILocalVariable(name: "m", scope: !940, file: !3, line: 643, type: !37)
!944 = !DILocation(line: 643, column: 10, scope: !940)
!945 = !DILocalVariable(name: "s", scope: !940, file: !3, line: 643, type: !37)
!946 = !DILocation(line: 643, column: 13, scope: !940)
!947 = !DILocalVariable(name: "qn", scope: !940, file: !3, line: 643, type: !37)
!948 = !DILocation(line: 643, column: 16, scope: !940)
!949 = !DILocalVariable(name: "borrow", scope: !940, file: !3, line: 644, type: !6)
!950 = !DILocation(line: 644, column: 11, scope: !940)
!951 = !DILocalVariable(name: "offset", scope: !940, file: !3, line: 644, type: !6)
!952 = !DILocation(line: 644, column: 19, scope: !940)
!953 = !DILocation(line: 646, column: 11, scope: !940)
!954 = !DILocation(line: 646, column: 22, scope: !940)
!955 = !DILocation(line: 646, column: 26, scope: !940)
!956 = !DILocation(line: 646, column: 9, scope: !940)
!957 = !DILocation(line: 648, column: 9, scope: !940)
!958 = !DILocation(line: 649, column: 9, scope: !959)
!959 = distinct !DILexicalBlock(scope: !940, file: !3, line: 649, column: 2)
!960 = !DILocation(line: 649, column: 7, scope: !959)
!961 = !DILocation(line: 649, column: 14, scope: !962)
!962 = distinct !DILexicalBlock(scope: !959, file: !3, line: 649, column: 2)
!963 = !DILocation(line: 649, column: 16, scope: !962)
!964 = !DILocation(line: 649, column: 2, scope: !959)
!965 = !DILocation(line: 650, column: 7, scope: !966)
!966 = distinct !DILexicalBlock(scope: !962, file: !3, line: 649, column: 39)
!967 = !DILocation(line: 650, column: 19, scope: !966)
!968 = !DILocation(line: 650, column: 5, scope: !966)
!969 = !DILocation(line: 652, column: 7, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !3, line: 652, column: 7)
!971 = !DILocation(line: 652, column: 12, scope: !970)
!972 = !DILocation(line: 652, column: 9, scope: !970)
!973 = !DILocation(line: 652, column: 7, scope: !966)
!974 = !DILocation(line: 653, column: 9, scope: !975)
!975 = distinct !DILexicalBlock(scope: !970, file: !3, line: 652, column: 20)
!976 = !DILocation(line: 653, column: 22, scope: !975)
!977 = !DILocation(line: 653, column: 7, scope: !975)
!978 = !DILocation(line: 655, column: 8, scope: !975)
!979 = !DILocation(line: 655, column: 13, scope: !975)
!980 = !DILocation(line: 655, column: 11, scope: !975)
!981 = !DILocation(line: 655, column: 6, scope: !975)
!982 = !DILocation(line: 656, column: 8, scope: !983)
!983 = distinct !DILexicalBlock(scope: !975, file: !3, line: 656, column: 8)
!984 = !DILocation(line: 656, column: 12, scope: !983)
!985 = !DILocation(line: 656, column: 10, scope: !983)
!986 = !DILocation(line: 656, column: 8, scope: !975)
!987 = !DILocation(line: 657, column: 7, scope: !988)
!988 = distinct !DILexicalBlock(scope: !983, file: !3, line: 656, column: 15)
!989 = !DILocation(line: 658, column: 12, scope: !988)
!990 = !DILocation(line: 659, column: 4, scope: !988)
!991 = !DILocation(line: 660, column: 12, scope: !992)
!992 = distinct !DILexicalBlock(scope: !983, file: !3, line: 659, column: 11)
!993 = !DILocation(line: 662, column: 21, scope: !975)
!994 = !DILocation(line: 662, column: 25, scope: !975)
!995 = !DILocation(line: 662, column: 23, scope: !975)
!996 = !DILocation(line: 662, column: 4, scope: !975)
!997 = !DILocation(line: 662, column: 16, scope: !975)
!998 = !DILocation(line: 662, column: 19, scope: !975)
!999 = !DILocation(line: 663, column: 3, scope: !975)
!1000 = !DILocation(line: 664, column: 2, scope: !966)
!1001 = !DILocation(line: 649, column: 34, scope: !962)
!1002 = !DILocation(line: 649, column: 2, scope: !962)
!1003 = distinct !{!1003, !964, !1004}
!1004 = !DILocation(line: 664, column: 2, scope: !959)
!1005 = !DILocation(line: 665, column: 2, scope: !940)
!1006 = !DILocation(line: 665, column: 18, scope: !940)
!1007 = !DILocation(line: 667, column: 6, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !940, file: !3, line: 667, column: 6)
!1009 = !DILocation(line: 667, column: 17, scope: !1008)
!1010 = !DILocation(line: 667, column: 21, scope: !1008)
!1011 = !DILocation(line: 667, column: 6, scope: !940)
!1012 = !DILocation(line: 669, column: 2, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 667, column: 35)
!1014 = !DILocation(line: 673, column: 1, scope: !940)
!1015 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 675, type: !100, scopeLine: 675, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DILocation(line: 677, column: 1, scope: !1015)
!1017 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 679, type: !100, scopeLine: 679, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1018 = !DILocation(line: 681, column: 2, scope: !1017)
!1019 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 685, type: !1020, scopeLine: 685, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1020 = !DISubroutineType(types: !1021)
!1021 = !{!173}
!1022 = !DILocation(line: 687, column: 16, scope: !1019)
!1023 = !DILocation(line: 688, column: 10, scope: !1019)
!1024 = !DILocation(line: 689, column: 12, scope: !1019)
!1025 = !DILocation(line: 690, column: 5, scope: !1019)
!1026 = !DILocation(line: 692, column: 5, scope: !1019)
!1027 = !DILocation(line: 694, column: 6, scope: !1028)
!1028 = distinct !DILexicalBlock(scope: !1019, file: !3, line: 692, column: 15)
!1029 = !DILocation(line: 695, column: 6, scope: !1028)
!1030 = !DILocation(line: 695, column: 6, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 695, column: 6)
!1032 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 695, column: 6)
!1033 = !DILocation(line: 695, column: 6, scope: !1032)
!1034 = !DILocation(line: 695, column: 6, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1031, file: !3, line: 695, column: 6)
!1036 = !DILocalVariable(name: "__x", scope: !1037, file: !3, line: 695, type: !6)
!1037 = distinct !DILexicalBlock(scope: !1035, file: !3, line: 695, column: 6)
!1038 = !DILocation(line: 695, column: 6, scope: !1037)
!1039 = !{i32 -2146696963}
!1040 = !DILocalVariable(name: "__x", scope: !1041, file: !3, line: 695, type: !6)
!1041 = distinct !DILexicalBlock(scope: !1035, file: !3, line: 695, column: 6)
!1042 = !DILocation(line: 695, column: 6, scope: !1041)
!1043 = !{i32 -2146696838}
!1044 = !DILocation(line: 695, column: 6, scope: !1045)
!1045 = distinct !DILexicalBlock(scope: !1031, file: !3, line: 695, column: 6)
!1046 = !DILocalVariable(name: "__x", scope: !1047, file: !3, line: 695, type: !6)
!1047 = distinct !DILexicalBlock(scope: !1045, file: !3, line: 695, column: 6)
!1048 = !DILocation(line: 695, column: 6, scope: !1047)
!1049 = !{i32 -2146696706}
!1050 = !DILocalVariable(name: "__x", scope: !1051, file: !3, line: 695, type: !6)
!1051 = distinct !DILexicalBlock(scope: !1045, file: !3, line: 695, column: 6)
!1052 = !DILocation(line: 695, column: 6, scope: !1051)
!1053 = !{i32 -2146696581}
!1054 = !DILocation(line: 697, column: 6, scope: !1028)
!1055 = !DILocation(line: 699, column: 6, scope: !1028)
!1056 = !DILocation(line: 701, column: 11, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 701, column: 11)
!1058 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 699, column: 15)
!1059 = !DILocation(line: 701, column: 28, scope: !1057)
!1060 = !DILocation(line: 701, column: 33, scope: !1057)
!1061 = !DILocation(line: 701, column: 36, scope: !1057)
!1062 = !DILocation(line: 701, column: 46, scope: !1057)
!1063 = !DILocation(line: 701, column: 11, scope: !1058)
!1064 = !DILocation(line: 703, column: 8, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1057, file: !3, line: 701, column: 54)
!1066 = !DILocation(line: 704, column: 8, scope: !1065)
!1067 = !DILocation(line: 704, column: 8, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1069, file: !3, line: 704, column: 8)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 704, column: 8)
!1070 = !DILocation(line: 704, column: 8, scope: !1069)
!1071 = !DILocation(line: 704, column: 8, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 704, column: 8)
!1073 = !DILocalVariable(name: "__x", scope: !1074, file: !3, line: 704, type: !6)
!1074 = distinct !DILexicalBlock(scope: !1072, file: !3, line: 704, column: 8)
!1075 = !DILocation(line: 704, column: 8, scope: !1074)
!1076 = !{i32 -2146694405}
!1077 = !DILocalVariable(name: "__x", scope: !1078, file: !3, line: 704, type: !6)
!1078 = distinct !DILexicalBlock(scope: !1072, file: !3, line: 704, column: 8)
!1079 = !DILocation(line: 704, column: 8, scope: !1078)
!1080 = !{i32 -2146694280}
!1081 = !DILocation(line: 704, column: 8, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 704, column: 8)
!1083 = !DILocalVariable(name: "__x", scope: !1084, file: !3, line: 704, type: !6)
!1084 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 704, column: 8)
!1085 = !DILocation(line: 704, column: 8, scope: !1084)
!1086 = !{i32 -2146694148}
!1087 = !DILocalVariable(name: "__x", scope: !1088, file: !3, line: 704, type: !6)
!1088 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 704, column: 8)
!1089 = !DILocation(line: 704, column: 8, scope: !1088)
!1090 = !{i32 -2146694023}
!1091 = !DILocation(line: 706, column: 8, scope: !1065)
!1092 = !DILocation(line: 707, column: 4, scope: !1065)
!1093 = !DILocation(line: 709, column: 8, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 709, column: 8)
!1095 = !DILocation(line: 709, column: 18, scope: !1094)
!1096 = !DILocation(line: 709, column: 8, scope: !1058)
!1097 = !DILocation(line: 712, column: 5, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1094, file: !3, line: 709, column: 26)
!1099 = !DILocation(line: 713, column: 5, scope: !1098)
!1100 = !DILocation(line: 713, column: 5, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 713, column: 5)
!1102 = distinct !DILexicalBlock(scope: !1098, file: !3, line: 713, column: 5)
!1103 = !DILocation(line: 713, column: 5, scope: !1102)
!1104 = !DILocation(line: 713, column: 5, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 713, column: 5)
!1106 = !DILocalVariable(name: "__x", scope: !1107, file: !3, line: 713, type: !6)
!1107 = distinct !DILexicalBlock(scope: !1105, file: !3, line: 713, column: 5)
!1108 = !DILocation(line: 713, column: 5, scope: !1107)
!1109 = !{i32 -2146691875}
!1110 = !DILocalVariable(name: "__x", scope: !1111, file: !3, line: 713, type: !6)
!1111 = distinct !DILexicalBlock(scope: !1105, file: !3, line: 713, column: 5)
!1112 = !DILocation(line: 713, column: 5, scope: !1111)
!1113 = !{i32 -2146691750}
!1114 = !DILocation(line: 713, column: 5, scope: !1115)
!1115 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 713, column: 5)
!1116 = !DILocalVariable(name: "__x", scope: !1117, file: !3, line: 713, type: !6)
!1117 = distinct !DILexicalBlock(scope: !1115, file: !3, line: 713, column: 5)
!1118 = !DILocation(line: 713, column: 5, scope: !1117)
!1119 = !{i32 -2146691618}
!1120 = !DILocalVariable(name: "__x", scope: !1121, file: !3, line: 713, type: !6)
!1121 = distinct !DILexicalBlock(scope: !1115, file: !3, line: 713, column: 5)
!1122 = !DILocation(line: 713, column: 5, scope: !1121)
!1123 = !{i32 -2146691493}
!1124 = !DILocation(line: 715, column: 5, scope: !1098)
!1125 = !DILocation(line: 717, column: 4, scope: !1098)
!1126 = !DILocation(line: 719, column: 11, scope: !1127)
!1127 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 719, column: 11)
!1128 = !DILocation(line: 719, column: 22, scope: !1127)
!1129 = !DILocation(line: 719, column: 11, scope: !1058)
!1130 = !DILocation(line: 722, column: 8, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1127, file: !3, line: 719, column: 27)
!1132 = !DILocation(line: 723, column: 8, scope: !1131)
!1133 = !DILocation(line: 723, column: 8, scope: !1134)
!1134 = distinct !DILexicalBlock(scope: !1135, file: !3, line: 723, column: 8)
!1135 = distinct !DILexicalBlock(scope: !1131, file: !3, line: 723, column: 8)
!1136 = !DILocation(line: 723, column: 8, scope: !1135)
!1137 = !DILocation(line: 723, column: 8, scope: !1138)
!1138 = distinct !DILexicalBlock(scope: !1134, file: !3, line: 723, column: 8)
!1139 = !DILocalVariable(name: "__x", scope: !1140, file: !3, line: 723, type: !6)
!1140 = distinct !DILexicalBlock(scope: !1138, file: !3, line: 723, column: 8)
!1141 = !DILocation(line: 723, column: 8, scope: !1140)
!1142 = !{i32 -2146689347}
!1143 = !DILocalVariable(name: "__x", scope: !1144, file: !3, line: 723, type: !6)
!1144 = distinct !DILexicalBlock(scope: !1138, file: !3, line: 723, column: 8)
!1145 = !DILocation(line: 723, column: 8, scope: !1144)
!1146 = !{i32 -2146689222}
!1147 = !DILocation(line: 723, column: 8, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1134, file: !3, line: 723, column: 8)
!1149 = !DILocalVariable(name: "__x", scope: !1150, file: !3, line: 723, type: !6)
!1150 = distinct !DILexicalBlock(scope: !1148, file: !3, line: 723, column: 8)
!1151 = !DILocation(line: 723, column: 8, scope: !1150)
!1152 = !{i32 -2146689090}
!1153 = !DILocalVariable(name: "__x", scope: !1154, file: !3, line: 723, type: !6)
!1154 = distinct !DILexicalBlock(scope: !1148, file: !3, line: 723, column: 8)
!1155 = !DILocation(line: 723, column: 8, scope: !1154)
!1156 = !{i32 -2146688965}
!1157 = !DILocation(line: 725, column: 8, scope: !1131)
!1158 = !DILocation(line: 727, column: 7, scope: !1131)
!1159 = !DILocation(line: 730, column: 8, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1127, file: !3, line: 727, column: 14)
!1161 = !DILocation(line: 731, column: 8, scope: !1160)
!1162 = !DILocation(line: 731, column: 8, scope: !1163)
!1163 = distinct !DILexicalBlock(scope: !1164, file: !3, line: 731, column: 8)
!1164 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 731, column: 8)
!1165 = !DILocation(line: 731, column: 8, scope: !1164)
!1166 = !DILocation(line: 731, column: 8, scope: !1167)
!1167 = distinct !DILexicalBlock(scope: !1163, file: !3, line: 731, column: 8)
!1168 = !DILocalVariable(name: "__x", scope: !1169, file: !3, line: 731, type: !6)
!1169 = distinct !DILexicalBlock(scope: !1167, file: !3, line: 731, column: 8)
!1170 = !DILocation(line: 731, column: 8, scope: !1169)
!1171 = !{i32 -2146686841}
!1172 = !DILocalVariable(name: "__x", scope: !1173, file: !3, line: 731, type: !6)
!1173 = distinct !DILexicalBlock(scope: !1167, file: !3, line: 731, column: 8)
!1174 = !DILocation(line: 731, column: 8, scope: !1173)
!1175 = !{i32 -2146686716}
!1176 = !DILocation(line: 731, column: 8, scope: !1177)
!1177 = distinct !DILexicalBlock(scope: !1163, file: !3, line: 731, column: 8)
!1178 = !DILocalVariable(name: "__x", scope: !1179, file: !3, line: 731, type: !6)
!1179 = distinct !DILexicalBlock(scope: !1177, file: !3, line: 731, column: 8)
!1180 = !DILocation(line: 731, column: 8, scope: !1179)
!1181 = !{i32 -2146686584}
!1182 = !DILocalVariable(name: "__x", scope: !1183, file: !3, line: 731, type: !6)
!1183 = distinct !DILexicalBlock(scope: !1177, file: !3, line: 731, column: 8)
!1184 = !DILocation(line: 731, column: 8, scope: !1183)
!1185 = !{i32 -2146686459}
!1186 = !DILocation(line: 733, column: 8, scope: !1160)
!1187 = !DILocation(line: 738, column: 7, scope: !1058)
!1188 = !DILocation(line: 739, column: 7, scope: !1058)
!1189 = !DILocation(line: 739, column: 7, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1191, file: !3, line: 739, column: 7)
!1191 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 739, column: 7)
!1192 = !DILocation(line: 739, column: 7, scope: !1191)
!1193 = !DILocation(line: 739, column: 7, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1190, file: !3, line: 739, column: 7)
!1195 = !DILocalVariable(name: "__x", scope: !1196, file: !3, line: 739, type: !6)
!1196 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 739, column: 7)
!1197 = !DILocation(line: 739, column: 7, scope: !1196)
!1198 = !{i32 -2146684335}
!1199 = !DILocalVariable(name: "__x", scope: !1200, file: !3, line: 739, type: !6)
!1200 = distinct !DILexicalBlock(scope: !1194, file: !3, line: 739, column: 7)
!1201 = !DILocation(line: 739, column: 7, scope: !1200)
!1202 = !{i32 -2146684210}
!1203 = !DILocation(line: 739, column: 7, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1190, file: !3, line: 739, column: 7)
!1205 = !DILocalVariable(name: "__x", scope: !1206, file: !3, line: 739, type: !6)
!1206 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 739, column: 7)
!1207 = !DILocation(line: 739, column: 7, scope: !1206)
!1208 = !{i32 -2146684078}
!1209 = !DILocalVariable(name: "__x", scope: !1210, file: !3, line: 739, type: !6)
!1210 = distinct !DILexicalBlock(scope: !1204, file: !3, line: 739, column: 7)
!1211 = !DILocation(line: 739, column: 7, scope: !1210)
!1212 = !{i32 -2146683953}
!1213 = !DILocation(line: 741, column: 7, scope: !1058)
!1214 = !DILocation(line: 743, column: 4, scope: !1058)
!1215 = !DILocation(line: 746, column: 5, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 743, column: 7)
!1217 = !DILocation(line: 747, column: 5, scope: !1216)
!1218 = !DILocation(line: 747, column: 5, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !3, line: 747, column: 5)
!1220 = distinct !DILexicalBlock(scope: !1216, file: !3, line: 747, column: 5)
!1221 = !DILocation(line: 747, column: 5, scope: !1220)
!1222 = !DILocation(line: 747, column: 5, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1219, file: !3, line: 747, column: 5)
!1224 = !DILocalVariable(name: "__x", scope: !1225, file: !3, line: 747, type: !6)
!1225 = distinct !DILexicalBlock(scope: !1223, file: !3, line: 747, column: 5)
!1226 = !DILocation(line: 747, column: 5, scope: !1225)
!1227 = !{i32 -2146681829}
!1228 = !DILocalVariable(name: "__x", scope: !1229, file: !3, line: 747, type: !6)
!1229 = distinct !DILexicalBlock(scope: !1223, file: !3, line: 747, column: 5)
!1230 = !DILocation(line: 747, column: 5, scope: !1229)
!1231 = !{i32 -2146681704}
!1232 = !DILocation(line: 747, column: 5, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1219, file: !3, line: 747, column: 5)
!1234 = !DILocalVariable(name: "__x", scope: !1235, file: !3, line: 747, type: !6)
!1235 = distinct !DILexicalBlock(scope: !1233, file: !3, line: 747, column: 5)
!1236 = !DILocation(line: 747, column: 5, scope: !1235)
!1237 = !{i32 -2146681572}
!1238 = !DILocalVariable(name: "__x", scope: !1239, file: !3, line: 747, type: !6)
!1239 = distinct !DILexicalBlock(scope: !1233, file: !3, line: 747, column: 5)
!1240 = !DILocation(line: 747, column: 5, scope: !1239)
!1241 = !{i32 -2146681447}
!1242 = !DILocation(line: 749, column: 5, scope: !1216)
!1243 = !DILocation(line: 751, column: 4, scope: !1216)
!1244 = !DILocation(line: 751, column: 13, scope: !1058)
!1245 = !DILocation(line: 751, column: 24, scope: !1058)
!1246 = distinct !{!1246, !1214, !1247}
!1247 = !DILocation(line: 751, column: 28, scope: !1058)
!1248 = !DILocation(line: 754, column: 4, scope: !1058)
!1249 = !DILocation(line: 755, column: 4, scope: !1058)
!1250 = !DILocation(line: 755, column: 4, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !3, line: 755, column: 4)
!1252 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 755, column: 4)
!1253 = !DILocation(line: 755, column: 4, scope: !1252)
!1254 = !DILocation(line: 755, column: 4, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 755, column: 4)
!1256 = !DILocalVariable(name: "__x", scope: !1257, file: !3, line: 755, type: !6)
!1257 = distinct !DILexicalBlock(scope: !1255, file: !3, line: 755, column: 4)
!1258 = !DILocation(line: 755, column: 4, scope: !1257)
!1259 = !{i32 -2146679301}
!1260 = !DILocalVariable(name: "__x", scope: !1261, file: !3, line: 755, type: !6)
!1261 = distinct !DILexicalBlock(scope: !1255, file: !3, line: 755, column: 4)
!1262 = !DILocation(line: 755, column: 4, scope: !1261)
!1263 = !{i32 -2146679176}
!1264 = !DILocation(line: 755, column: 4, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 755, column: 4)
!1266 = !DILocalVariable(name: "__x", scope: !1267, file: !3, line: 755, type: !6)
!1267 = distinct !DILexicalBlock(scope: !1265, file: !3, line: 755, column: 4)
!1268 = !DILocation(line: 755, column: 4, scope: !1267)
!1269 = !{i32 -2146679044}
!1270 = !DILocalVariable(name: "__x", scope: !1271, file: !3, line: 755, type: !6)
!1271 = distinct !DILexicalBlock(scope: !1265, file: !3, line: 755, column: 4)
!1272 = !DILocation(line: 755, column: 4, scope: !1271)
!1273 = !{i32 -2146678919}
!1274 = !DILocation(line: 757, column: 4, scope: !1058)
!1275 = !DILocation(line: 759, column: 8, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 759, column: 8)
!1277 = !DILocation(line: 759, column: 19, scope: !1276)
!1278 = !DILocation(line: 759, column: 8, scope: !1058)
!1279 = !DILocation(line: 761, column: 5, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1276, file: !3, line: 759, column: 24)
!1281 = !DILocation(line: 765, column: 4, scope: !1058)
!1282 = !DILocation(line: 766, column: 4, scope: !1058)
!1283 = !DILocation(line: 766, column: 4, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1285, file: !3, line: 766, column: 4)
!1285 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 766, column: 4)
!1286 = !DILocation(line: 766, column: 4, scope: !1285)
!1287 = !DILocation(line: 766, column: 4, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 766, column: 4)
!1289 = !DILocalVariable(name: "__x", scope: !1290, file: !3, line: 766, type: !6)
!1290 = distinct !DILexicalBlock(scope: !1288, file: !3, line: 766, column: 4)
!1291 = !DILocation(line: 766, column: 4, scope: !1290)
!1292 = !{i32 -2146676773}
!1293 = !DILocalVariable(name: "__x", scope: !1294, file: !3, line: 766, type: !6)
!1294 = distinct !DILexicalBlock(scope: !1288, file: !3, line: 766, column: 4)
!1295 = !DILocation(line: 766, column: 4, scope: !1294)
!1296 = !{i32 -2146676648}
!1297 = !DILocation(line: 766, column: 4, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 766, column: 4)
!1299 = !DILocalVariable(name: "__x", scope: !1300, file: !3, line: 766, type: !6)
!1300 = distinct !DILexicalBlock(scope: !1298, file: !3, line: 766, column: 4)
!1301 = !DILocation(line: 766, column: 4, scope: !1300)
!1302 = !{i32 -2146676516}
!1303 = !DILocalVariable(name: "__x", scope: !1304, file: !3, line: 766, type: !6)
!1304 = distinct !DILexicalBlock(scope: !1298, file: !3, line: 766, column: 4)
!1305 = !DILocation(line: 766, column: 4, scope: !1304)
!1306 = !{i32 -2146676391}
!1307 = !DILocation(line: 768, column: 4, scope: !1058)
!1308 = !DILocation(line: 770, column: 8, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 770, column: 8)
!1310 = !DILocation(line: 770, column: 19, scope: !1309)
!1311 = !DILocation(line: 770, column: 8, scope: !1058)
!1312 = !DILocation(line: 773, column: 5, scope: !1313)
!1313 = distinct !DILexicalBlock(scope: !1309, file: !3, line: 770, column: 25)
!1314 = !DILocation(line: 774, column: 5, scope: !1313)
!1315 = !DILocation(line: 774, column: 5, scope: !1316)
!1316 = distinct !DILexicalBlock(scope: !1317, file: !3, line: 774, column: 5)
!1317 = distinct !DILexicalBlock(scope: !1313, file: !3, line: 774, column: 5)
!1318 = !DILocation(line: 774, column: 5, scope: !1317)
!1319 = !DILocation(line: 774, column: 5, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1316, file: !3, line: 774, column: 5)
!1321 = !DILocalVariable(name: "__x", scope: !1322, file: !3, line: 774, type: !6)
!1322 = distinct !DILexicalBlock(scope: !1320, file: !3, line: 774, column: 5)
!1323 = !DILocation(line: 774, column: 5, scope: !1322)
!1324 = !{i32 -2146674245}
!1325 = !DILocalVariable(name: "__x", scope: !1326, file: !3, line: 774, type: !6)
!1326 = distinct !DILexicalBlock(scope: !1320, file: !3, line: 774, column: 5)
!1327 = !DILocation(line: 774, column: 5, scope: !1326)
!1328 = !{i32 -2146674120}
!1329 = !DILocation(line: 774, column: 5, scope: !1330)
!1330 = distinct !DILexicalBlock(scope: !1316, file: !3, line: 774, column: 5)
!1331 = !DILocalVariable(name: "__x", scope: !1332, file: !3, line: 774, type: !6)
!1332 = distinct !DILexicalBlock(scope: !1330, file: !3, line: 774, column: 5)
!1333 = !DILocation(line: 774, column: 5, scope: !1332)
!1334 = !{i32 -2146673988}
!1335 = !DILocalVariable(name: "__x", scope: !1336, file: !3, line: 774, type: !6)
!1336 = distinct !DILexicalBlock(scope: !1330, file: !3, line: 774, column: 5)
!1337 = !DILocation(line: 774, column: 5, scope: !1336)
!1338 = !{i32 -2146673863}
!1339 = !DILocation(line: 776, column: 5, scope: !1313)
!1340 = !DILocation(line: 778, column: 9, scope: !1341)
!1341 = distinct !DILexicalBlock(scope: !1313, file: !3, line: 778, column: 9)
!1342 = !DILocation(line: 778, column: 20, scope: !1341)
!1343 = !DILocation(line: 778, column: 9, scope: !1313)
!1344 = !DILocation(line: 781, column: 6, scope: !1345)
!1345 = distinct !DILexicalBlock(scope: !1341, file: !3, line: 778, column: 25)
!1346 = !DILocation(line: 782, column: 6, scope: !1345)
!1347 = !DILocation(line: 782, column: 6, scope: !1348)
!1348 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 782, column: 6)
!1349 = distinct !DILexicalBlock(scope: !1345, file: !3, line: 782, column: 6)
!1350 = !DILocation(line: 782, column: 6, scope: !1349)
!1351 = !DILocation(line: 782, column: 6, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1348, file: !3, line: 782, column: 6)
!1353 = !DILocalVariable(name: "__x", scope: !1354, file: !3, line: 782, type: !6)
!1354 = distinct !DILexicalBlock(scope: !1352, file: !3, line: 782, column: 6)
!1355 = !DILocation(line: 782, column: 6, scope: !1354)
!1356 = !{i32 -2146671714}
!1357 = !DILocalVariable(name: "__x", scope: !1358, file: !3, line: 782, type: !6)
!1358 = distinct !DILexicalBlock(scope: !1352, file: !3, line: 782, column: 6)
!1359 = !DILocation(line: 782, column: 6, scope: !1358)
!1360 = !{i32 -2146671589}
!1361 = !DILocation(line: 782, column: 6, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1348, file: !3, line: 782, column: 6)
!1363 = !DILocalVariable(name: "__x", scope: !1364, file: !3, line: 782, type: !6)
!1364 = distinct !DILexicalBlock(scope: !1362, file: !3, line: 782, column: 6)
!1365 = !DILocation(line: 782, column: 6, scope: !1364)
!1366 = !{i32 -2146671457}
!1367 = !DILocalVariable(name: "__x", scope: !1368, file: !3, line: 782, type: !6)
!1368 = distinct !DILexicalBlock(scope: !1362, file: !3, line: 782, column: 6)
!1369 = !DILocation(line: 782, column: 6, scope: !1368)
!1370 = !{i32 -2146671332}
!1371 = !DILocation(line: 784, column: 6, scope: !1345)
!1372 = !DILocation(line: 785, column: 5, scope: !1345)
!1373 = !DILocation(line: 787, column: 4, scope: !1313)
!1374 = !DILocation(line: 787, column: 15, scope: !1375)
!1375 = distinct !DILexicalBlock(scope: !1309, file: !3, line: 787, column: 15)
!1376 = !DILocation(line: 787, column: 26, scope: !1375)
!1377 = !DILocation(line: 787, column: 15, scope: !1309)
!1378 = !DILocation(line: 790, column: 5, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1375, file: !3, line: 787, column: 32)
!1380 = !DILocation(line: 791, column: 5, scope: !1379)
!1381 = !DILocation(line: 791, column: 5, scope: !1382)
!1382 = distinct !DILexicalBlock(scope: !1383, file: !3, line: 791, column: 5)
!1383 = distinct !DILexicalBlock(scope: !1379, file: !3, line: 791, column: 5)
!1384 = !DILocation(line: 791, column: 5, scope: !1383)
!1385 = !DILocation(line: 791, column: 5, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1382, file: !3, line: 791, column: 5)
!1387 = !DILocalVariable(name: "__x", scope: !1388, file: !3, line: 791, type: !6)
!1388 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 791, column: 5)
!1389 = !DILocation(line: 791, column: 5, scope: !1388)
!1390 = !{i32 -2146669186}
!1391 = !DILocalVariable(name: "__x", scope: !1392, file: !3, line: 791, type: !6)
!1392 = distinct !DILexicalBlock(scope: !1386, file: !3, line: 791, column: 5)
!1393 = !DILocation(line: 791, column: 5, scope: !1392)
!1394 = !{i32 -2146669061}
!1395 = !DILocation(line: 791, column: 5, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1382, file: !3, line: 791, column: 5)
!1397 = !DILocalVariable(name: "__x", scope: !1398, file: !3, line: 791, type: !6)
!1398 = distinct !DILexicalBlock(scope: !1396, file: !3, line: 791, column: 5)
!1399 = !DILocation(line: 791, column: 5, scope: !1398)
!1400 = !{i32 -2146668929}
!1401 = !DILocalVariable(name: "__x", scope: !1402, file: !3, line: 791, type: !6)
!1402 = distinct !DILexicalBlock(scope: !1396, file: !3, line: 791, column: 5)
!1403 = !DILocation(line: 791, column: 5, scope: !1402)
!1404 = !{i32 -2146668804}
!1405 = !DILocation(line: 793, column: 5, scope: !1379)
!1406 = !DILocation(line: 794, column: 4, scope: !1379)
!1407 = !DILocation(line: 796, column: 8, scope: !1408)
!1408 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 796, column: 8)
!1409 = !DILocation(line: 796, column: 18, scope: !1408)
!1410 = !DILocation(line: 796, column: 8, scope: !1058)
!1411 = !DILocation(line: 797, column: 5, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1408, file: !3, line: 796, column: 24)
!1413 = !DILocation(line: 799, column: 6, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1412, file: !3, line: 797, column: 8)
!1415 = !DILocation(line: 800, column: 6, scope: !1414)
!1416 = !DILocation(line: 800, column: 6, scope: !1417)
!1417 = distinct !DILexicalBlock(scope: !1418, file: !3, line: 800, column: 6)
!1418 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 800, column: 6)
!1419 = !DILocation(line: 800, column: 6, scope: !1418)
!1420 = !DILocation(line: 800, column: 6, scope: !1421)
!1421 = distinct !DILexicalBlock(scope: !1417, file: !3, line: 800, column: 6)
!1422 = !DILocalVariable(name: "__x", scope: !1423, file: !3, line: 800, type: !6)
!1423 = distinct !DILexicalBlock(scope: !1421, file: !3, line: 800, column: 6)
!1424 = !DILocation(line: 800, column: 6, scope: !1423)
!1425 = !{i32 -2146666656}
!1426 = !DILocalVariable(name: "__x", scope: !1427, file: !3, line: 800, type: !6)
!1427 = distinct !DILexicalBlock(scope: !1421, file: !3, line: 800, column: 6)
!1428 = !DILocation(line: 800, column: 6, scope: !1427)
!1429 = !{i32 -2146666531}
!1430 = !DILocation(line: 800, column: 6, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1417, file: !3, line: 800, column: 6)
!1432 = !DILocalVariable(name: "__x", scope: !1433, file: !3, line: 800, type: !6)
!1433 = distinct !DILexicalBlock(scope: !1431, file: !3, line: 800, column: 6)
!1434 = !DILocation(line: 800, column: 6, scope: !1433)
!1435 = !{i32 -2146666399}
!1436 = !DILocalVariable(name: "__x", scope: !1437, file: !3, line: 800, type: !6)
!1437 = distinct !DILexicalBlock(scope: !1431, file: !3, line: 800, column: 6)
!1438 = !DILocation(line: 800, column: 6, scope: !1437)
!1439 = !{i32 -2146666274}
!1440 = !DILocation(line: 802, column: 6, scope: !1414)
!1441 = !DILocation(line: 805, column: 6, scope: !1414)
!1442 = !DILocation(line: 806, column: 6, scope: !1414)
!1443 = !DILocation(line: 806, column: 6, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1445, file: !3, line: 806, column: 6)
!1445 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 806, column: 6)
!1446 = !DILocation(line: 806, column: 6, scope: !1445)
!1447 = !DILocation(line: 806, column: 6, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1444, file: !3, line: 806, column: 6)
!1449 = !DILocalVariable(name: "__x", scope: !1450, file: !3, line: 806, type: !6)
!1450 = distinct !DILexicalBlock(scope: !1448, file: !3, line: 806, column: 6)
!1451 = !DILocation(line: 806, column: 6, scope: !1450)
!1452 = !{i32 -2146664150}
!1453 = !DILocalVariable(name: "__x", scope: !1454, file: !3, line: 806, type: !6)
!1454 = distinct !DILexicalBlock(scope: !1448, file: !3, line: 806, column: 6)
!1455 = !DILocation(line: 806, column: 6, scope: !1454)
!1456 = !{i32 -2146664025}
!1457 = !DILocation(line: 806, column: 6, scope: !1458)
!1458 = distinct !DILexicalBlock(scope: !1444, file: !3, line: 806, column: 6)
!1459 = !DILocalVariable(name: "__x", scope: !1460, file: !3, line: 806, type: !6)
!1460 = distinct !DILexicalBlock(scope: !1458, file: !3, line: 806, column: 6)
!1461 = !DILocation(line: 806, column: 6, scope: !1460)
!1462 = !{i32 -2146663893}
!1463 = !DILocalVariable(name: "__x", scope: !1464, file: !3, line: 806, type: !6)
!1464 = distinct !DILexicalBlock(scope: !1458, file: !3, line: 806, column: 6)
!1465 = !DILocation(line: 806, column: 6, scope: !1464)
!1466 = !{i32 -2146663768}
!1467 = !DILocation(line: 808, column: 6, scope: !1414)
!1468 = !DILocation(line: 811, column: 6, scope: !1414)
!1469 = !DILocation(line: 812, column: 6, scope: !1414)
!1470 = !DILocation(line: 812, column: 6, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1472, file: !3, line: 812, column: 6)
!1472 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 812, column: 6)
!1473 = !DILocation(line: 812, column: 6, scope: !1472)
!1474 = !DILocation(line: 812, column: 6, scope: !1475)
!1475 = distinct !DILexicalBlock(scope: !1471, file: !3, line: 812, column: 6)
!1476 = !DILocalVariable(name: "__x", scope: !1477, file: !3, line: 812, type: !6)
!1477 = distinct !DILexicalBlock(scope: !1475, file: !3, line: 812, column: 6)
!1478 = !DILocation(line: 812, column: 6, scope: !1477)
!1479 = !{i32 -2146661644}
!1480 = !DILocalVariable(name: "__x", scope: !1481, file: !3, line: 812, type: !6)
!1481 = distinct !DILexicalBlock(scope: !1475, file: !3, line: 812, column: 6)
!1482 = !DILocation(line: 812, column: 6, scope: !1481)
!1483 = !{i32 -2146661519}
!1484 = !DILocation(line: 812, column: 6, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1471, file: !3, line: 812, column: 6)
!1486 = !DILocalVariable(name: "__x", scope: !1487, file: !3, line: 812, type: !6)
!1487 = distinct !DILexicalBlock(scope: !1485, file: !3, line: 812, column: 6)
!1488 = !DILocation(line: 812, column: 6, scope: !1487)
!1489 = !{i32 -2146661387}
!1490 = !DILocalVariable(name: "__x", scope: !1491, file: !3, line: 812, type: !6)
!1491 = distinct !DILexicalBlock(scope: !1485, file: !3, line: 812, column: 6)
!1492 = !DILocation(line: 812, column: 6, scope: !1491)
!1493 = !{i32 -2146661262}
!1494 = !DILocation(line: 814, column: 6, scope: !1414)
!1495 = !DILocation(line: 816, column: 10, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 816, column: 10)
!1497 = !DILocation(line: 816, column: 21, scope: !1496)
!1498 = !DILocation(line: 816, column: 10, scope: !1414)
!1499 = !DILocation(line: 819, column: 7, scope: !1500)
!1500 = distinct !DILexicalBlock(scope: !1496, file: !3, line: 816, column: 27)
!1501 = !DILocation(line: 820, column: 7, scope: !1500)
!1502 = !DILocation(line: 820, column: 7, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1504, file: !3, line: 820, column: 7)
!1504 = distinct !DILexicalBlock(scope: !1500, file: !3, line: 820, column: 7)
!1505 = !DILocation(line: 820, column: 7, scope: !1504)
!1506 = !DILocation(line: 820, column: 7, scope: !1507)
!1507 = distinct !DILexicalBlock(scope: !1503, file: !3, line: 820, column: 7)
!1508 = !DILocalVariable(name: "__x", scope: !1509, file: !3, line: 820, type: !6)
!1509 = distinct !DILexicalBlock(scope: !1507, file: !3, line: 820, column: 7)
!1510 = !DILocation(line: 820, column: 7, scope: !1509)
!1511 = !{i32 -2146659116}
!1512 = !DILocalVariable(name: "__x", scope: !1513, file: !3, line: 820, type: !6)
!1513 = distinct !DILexicalBlock(scope: !1507, file: !3, line: 820, column: 7)
!1514 = !DILocation(line: 820, column: 7, scope: !1513)
!1515 = !{i32 -2146658991}
!1516 = !DILocation(line: 820, column: 7, scope: !1517)
!1517 = distinct !DILexicalBlock(scope: !1503, file: !3, line: 820, column: 7)
!1518 = !DILocalVariable(name: "__x", scope: !1519, file: !3, line: 820, type: !6)
!1519 = distinct !DILexicalBlock(scope: !1517, file: !3, line: 820, column: 7)
!1520 = !DILocation(line: 820, column: 7, scope: !1519)
!1521 = !{i32 -2146658859}
!1522 = !DILocalVariable(name: "__x", scope: !1523, file: !3, line: 820, type: !6)
!1523 = distinct !DILexicalBlock(scope: !1517, file: !3, line: 820, column: 7)
!1524 = !DILocation(line: 820, column: 7, scope: !1523)
!1525 = !{i32 -2146658734}
!1526 = !DILocation(line: 822, column: 7, scope: !1500)
!1527 = !DILocation(line: 824, column: 6, scope: !1500)
!1528 = !DILocation(line: 827, column: 6, scope: !1414)
!1529 = !DILocation(line: 828, column: 6, scope: !1414)
!1530 = !DILocation(line: 828, column: 6, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1532, file: !3, line: 828, column: 6)
!1532 = distinct !DILexicalBlock(scope: !1414, file: !3, line: 828, column: 6)
!1533 = !DILocation(line: 828, column: 6, scope: !1532)
!1534 = !DILocation(line: 828, column: 6, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1531, file: !3, line: 828, column: 6)
!1536 = !DILocalVariable(name: "__x", scope: !1537, file: !3, line: 828, type: !6)
!1537 = distinct !DILexicalBlock(scope: !1535, file: !3, line: 828, column: 6)
!1538 = !DILocation(line: 828, column: 6, scope: !1537)
!1539 = !{i32 -2146656610}
!1540 = !DILocalVariable(name: "__x", scope: !1541, file: !3, line: 828, type: !6)
!1541 = distinct !DILexicalBlock(scope: !1535, file: !3, line: 828, column: 6)
!1542 = !DILocation(line: 828, column: 6, scope: !1541)
!1543 = !{i32 -2146656485}
!1544 = !DILocation(line: 828, column: 6, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1531, file: !3, line: 828, column: 6)
!1546 = !DILocalVariable(name: "__x", scope: !1547, file: !3, line: 828, type: !6)
!1547 = distinct !DILexicalBlock(scope: !1545, file: !3, line: 828, column: 6)
!1548 = !DILocation(line: 828, column: 6, scope: !1547)
!1549 = !{i32 -2146656353}
!1550 = !DILocalVariable(name: "__x", scope: !1551, file: !3, line: 828, type: !6)
!1551 = distinct !DILexicalBlock(scope: !1545, file: !3, line: 828, column: 6)
!1552 = !DILocation(line: 828, column: 6, scope: !1551)
!1553 = !{i32 -2146656228}
!1554 = !DILocation(line: 830, column: 6, scope: !1414)
!1555 = !DILocation(line: 832, column: 6, scope: !1414)
!1556 = !DILocation(line: 832, column: 15, scope: !1412)
!1557 = !DILocation(line: 832, column: 27, scope: !1412)
!1558 = !DILocation(line: 832, column: 31, scope: !1412)
!1559 = distinct !{!1559, !1411, !1560}
!1560 = !DILocation(line: 832, column: 43, scope: !1412)
!1561 = !DILocation(line: 834, column: 5, scope: !1412)
!1562 = !DILocation(line: 836, column: 9, scope: !1563)
!1563 = distinct !DILexicalBlock(scope: !1058, file: !3, line: 836, column: 9)
!1564 = !DILocation(line: 836, column: 26, scope: !1563)
!1565 = !DILocation(line: 836, column: 9, scope: !1058)
!1566 = !DILocation(line: 839, column: 5, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1563, file: !3, line: 836, column: 32)
!1568 = !DILocation(line: 840, column: 5, scope: !1567)
!1569 = !DILocation(line: 840, column: 5, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1571, file: !3, line: 840, column: 5)
!1571 = distinct !DILexicalBlock(scope: !1567, file: !3, line: 840, column: 5)
!1572 = !DILocation(line: 840, column: 5, scope: !1571)
!1573 = !DILocation(line: 840, column: 5, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1570, file: !3, line: 840, column: 5)
!1575 = !DILocalVariable(name: "__x", scope: !1576, file: !3, line: 840, type: !6)
!1576 = distinct !DILexicalBlock(scope: !1574, file: !3, line: 840, column: 5)
!1577 = !DILocation(line: 840, column: 5, scope: !1576)
!1578 = !{i32 -2146654019}
!1579 = !DILocalVariable(name: "__x", scope: !1580, file: !3, line: 840, type: !6)
!1580 = distinct !DILexicalBlock(scope: !1574, file: !3, line: 840, column: 5)
!1581 = !DILocation(line: 840, column: 5, scope: !1580)
!1582 = !{i32 -2146653894}
!1583 = !DILocation(line: 840, column: 5, scope: !1584)
!1584 = distinct !DILexicalBlock(scope: !1570, file: !3, line: 840, column: 5)
!1585 = !DILocalVariable(name: "__x", scope: !1586, file: !3, line: 840, type: !6)
!1586 = distinct !DILexicalBlock(scope: !1584, file: !3, line: 840, column: 5)
!1587 = !DILocation(line: 840, column: 5, scope: !1586)
!1588 = !{i32 -2146653762}
!1589 = !DILocalVariable(name: "__x", scope: !1590, file: !3, line: 840, type: !6)
!1590 = distinct !DILexicalBlock(scope: !1584, file: !3, line: 840, column: 5)
!1591 = !DILocation(line: 840, column: 5, scope: !1590)
!1592 = !{i32 -2146653637}
!1593 = !DILocation(line: 842, column: 5, scope: !1567)
!1594 = !DILocation(line: 844, column: 4, scope: !1567)
!1595 = !DILocation(line: 844, column: 15, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1563, file: !3, line: 844, column: 15)
!1597 = !DILocation(line: 844, column: 32, scope: !1596)
!1598 = !DILocation(line: 844, column: 15, scope: !1563)
!1599 = !DILocation(line: 847, column: 5, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1596, file: !3, line: 844, column: 38)
!1601 = !DILocation(line: 848, column: 5, scope: !1600)
!1602 = !DILocation(line: 848, column: 5, scope: !1603)
!1603 = distinct !DILexicalBlock(scope: !1604, file: !3, line: 848, column: 5)
!1604 = distinct !DILexicalBlock(scope: !1600, file: !3, line: 848, column: 5)
!1605 = !DILocation(line: 848, column: 5, scope: !1604)
!1606 = !DILocation(line: 848, column: 5, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1603, file: !3, line: 848, column: 5)
!1608 = !DILocalVariable(name: "__x", scope: !1609, file: !3, line: 848, type: !6)
!1609 = distinct !DILexicalBlock(scope: !1607, file: !3, line: 848, column: 5)
!1610 = !DILocation(line: 848, column: 5, scope: !1609)
!1611 = !{i32 -2146651485}
!1612 = !DILocalVariable(name: "__x", scope: !1613, file: !3, line: 848, type: !6)
!1613 = distinct !DILexicalBlock(scope: !1607, file: !3, line: 848, column: 5)
!1614 = !DILocation(line: 848, column: 5, scope: !1613)
!1615 = !{i32 -2146651360}
!1616 = !DILocation(line: 848, column: 5, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1603, file: !3, line: 848, column: 5)
!1618 = !DILocalVariable(name: "__x", scope: !1619, file: !3, line: 848, type: !6)
!1619 = distinct !DILexicalBlock(scope: !1617, file: !3, line: 848, column: 5)
!1620 = !DILocation(line: 848, column: 5, scope: !1619)
!1621 = !{i32 -2146651228}
!1622 = !DILocalVariable(name: "__x", scope: !1623, file: !3, line: 848, type: !6)
!1623 = distinct !DILexicalBlock(scope: !1617, file: !3, line: 848, column: 5)
!1624 = !DILocation(line: 848, column: 5, scope: !1623)
!1625 = !{i32 -2146651103}
!1626 = !DILocation(line: 850, column: 5, scope: !1600)
!1627 = !DILocation(line: 851, column: 4, scope: !1600)
!1628 = distinct !{!1628, !1055, !1629}
!1629 = !DILocation(line: 852, column: 3, scope: !1028)
!1630 = distinct !{!1630, !1026, !1631}
!1631 = !DILocation(line: 853, column: 2, scope: !1019)
