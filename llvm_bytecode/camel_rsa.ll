; ModuleID = 'camel_rsa.bc'
source_filename = "../benchmarks/camel_rsa.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [32 x i16], i16, i16, i16, i16, i16, [32 x i16], [4 x i16], i16, i16, i16, [16 x i16], i16, i16, [32 x i16], [32 x i16], i16, i16, i16 }
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
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !65
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !13
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !18
@pubkey = internal constant %struct.pubkey_t { [4 x i8] c"EjI\AA", i16 3 }, align 2, !dbg !70
@PLAINTEXT = internal constant [9 x i8] c".RRSSAA.\00", align 1, !dbg !82
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !67

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !97 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !100
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !101
  %conv = zext i8 %0 to i16, !dbg !101
  %or = or i16 %conv, 1, !dbg !101
  %conv1 = trunc i16 %or to i8, !dbg !101
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !101
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !102
  %conv2 = zext i8 %1 to i16, !dbg !102
  %and = and i16 %conv2, -2, !dbg !102
  %conv3 = trunc i16 %and to i8, !dbg !102
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !102
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !103
  %and4 = and i16 %2, -2, !dbg !103
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !103
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !104
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !105
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !106
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !107
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !108
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !111 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !112
  %cmp = icmp eq i16 %0, 1, !dbg !114
  br i1 %cmp, label %if.then, label %if.else, !dbg !115

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !116
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !118
  br label %if.end4, !dbg !119

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !120
  %cmp1 = icmp eq i16 %1, 2, !dbg !122
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !123

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !126
  br label %if.end, !dbg !127

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !128
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !130
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !130
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !130
  %3 = load i16, i16* %arrayidx, align 2, !dbg !130
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !130, !srcloc !132
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !133, metadata !DIExpression()), !dbg !135
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !135, !srcloc !136
  store i16 %4, i16* %__x, align 2, !dbg !135
  %5 = load i16, i16* %__x, align 2, !dbg !135
  store i16 %5, i16* %tmp, align 2, !dbg !135
  %6 = load i16, i16* %tmp, align 2, !dbg !135
  %add = add i16 %6, 2, !dbg !137
  %7 = inttoptr i16 %add to i8*, !dbg !138
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !139, metadata !DIExpression()), !dbg !141
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !141, !srcloc !142
  store i16 %8, i16* %__x5, align 2, !dbg !141
  %9 = load i16, i16* %__x5, align 2, !dbg !141
  store i16 %9, i16* %tmp6, align 2, !dbg !141
  %10 = load i16, i16* %tmp6, align 2, !dbg !141
  %add7 = add i16 %10, 2, !dbg !143
  %sub = sub i16 9216, %add7, !dbg !144
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !145
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !146
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !147
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !147
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !148
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 344, i16 zeroext %13), !dbg !149
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !150
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !151
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !153
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !154
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !154
  %cmp9 = icmp eq i16 %14, %16, !dbg !155
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !156

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !157
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !159
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !160
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !159
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 346, i1 false), !dbg !159
  call void @camel_init(), !dbg !161
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !163
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !162
  call void @__restore_registers(i16* %arraydecay), !dbg !164
  br label %if.end13, !dbg !165

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !166
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !168
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !169 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !170, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !173, metadata !DIExpression()), !dbg !174
  store i16 8, i16* %message_length, align 2, !dbg !174
  store i16 0, i16* %i, align 2, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !178
  %cmp = icmp slt i16 %0, 4, !dbg !180
  br i1 %cmp, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %1 = load i16, i16* %i, align 2, !dbg !182
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %1, !dbg !184
  %2 = load i8, i8* %arrayidx, align 1, !dbg !184
  %conv = zext i8 %2 to i16, !dbg !184
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !185
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !185
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !185
  %4 = load i16, i16* %i, align 2, !dbg !186
  %arrayidx1 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %4, !dbg !185
  store i16 %conv, i16* %arrayidx1, align 2, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %5 = load i16, i16* %i, align 2, !dbg !189
  %inc = add nsw i16 %5, 1, !dbg !189
  store i16 %inc, i16* %i, align 2, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %6 = load i16, i16* %message_length, align 2, !dbg !193
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !194
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !194
  %message_length3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !194
  store i16 %6, i16* %message_length3, align 2, !dbg !195
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !196
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !196
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !196
  store i16 0, i16* %block_offset, align 2, !dbg !197
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !198
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !198
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 5, !dbg !198
  store i16 0, i16* %cyphertext_len, align 2, !dbg !199
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !200
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 18, !dbg !200
  store i16 0, i16* %check_final, align 2, !dbg !201
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !202
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !202
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 17, !dbg !202
  store i16 0, i16* %check, align 2, !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_pad() #0 !dbg !205 {
entry:
  %i = alloca i16, align 2
  %zero = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !206, metadata !DIExpression()), !dbg !207
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !208
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !208
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !208
  %1 = load i16, i16* %block_offset, align 2, !dbg !208
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !210
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !210
  %message_length = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !210
  %3 = load i16, i16* %message_length, align 2, !dbg !210
  %cmp = icmp uge i16 %1, %3, !dbg !211
  br i1 %cmp, label %if.then, label %if.end, !dbg !212

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !213
  br label %if.end, !dbg !215

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i16* %zero, metadata !216, metadata !DIExpression()), !dbg !217
  store i16 0, i16* %zero, align 2, !dbg !217
  store i16 0, i16* %i, align 2, !dbg !218
  br label %for.cond, !dbg !220

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i16, i16* %i, align 2, !dbg !221
  %cmp2 = icmp ult i16 %4, 3, !dbg !223
  br i1 %cmp2, label %for.body, label %for.end, !dbg !224

for.body:                                         ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !225
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !225
  %block_offset4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !225
  %6 = load i16, i16* %block_offset4, align 2, !dbg !225
  %7 = load i16, i16* %i, align 2, !dbg !227
  %add = add i16 %6, %7, !dbg !228
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !229
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !229
  %message_length6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !229
  %9 = load i16, i16* %message_length6, align 2, !dbg !229
  %cmp7 = icmp ult i16 %add, %9, !dbg !230
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !231

cond.true:                                        ; preds = %for.body
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !232
  %block_offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 3, !dbg !232
  %11 = load i16, i16* %block_offset9, align 2, !dbg !232
  %12 = load i16, i16* %i, align 2, !dbg !233
  %add10 = add i16 %11, %12, !dbg !234
  %arrayidx = getelementptr inbounds [9 x i8], [9 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !235
  %13 = load i8, i8* %arrayidx, align 1, !dbg !235
  %conv = zext i8 %13 to i16, !dbg !235
  br label %cond.end, !dbg !231

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !231

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv, %cond.true ], [ 255, %cond.false ], !dbg !231
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !236
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !236
  %15 = load i16, i16* %i, align 2, !dbg !237
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %15, !dbg !236
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !238
  br label %for.inc, !dbg !239

for.inc:                                          ; preds = %cond.end
  %16 = load i16, i16* %i, align 2, !dbg !240
  %inc = add nsw i16 %16, 1, !dbg !240
  store i16 %inc, i16* %i, align 2, !dbg !240
  br label %for.cond, !dbg !241, !llvm.loop !242

for.end:                                          ; preds = %for.cond
  store i16 3, i16* %i, align 2, !dbg !244
  br label %for.cond13, !dbg !246

for.cond13:                                       ; preds = %for.inc20, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !247
  %cmp14 = icmp slt i16 %17, 4, !dbg !249
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !250

for.body16:                                       ; preds = %for.cond13
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !251
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !251
  %19 = load i16, i16* %i, align 2, !dbg !253
  %arrayidx19 = getelementptr inbounds [32 x i16], [32 x i16]* %base18, i16 0, i16 %19, !dbg !251
  store i16 1, i16* %arrayidx19, align 2, !dbg !254
  br label %for.inc20, !dbg !255

for.inc20:                                        ; preds = %for.body16
  %20 = load i16, i16* %i, align 2, !dbg !256
  %inc21 = add nsw i16 %20, 1, !dbg !256
  store i16 %inc21, i16* %i, align 2, !dbg !256
  br label %for.cond13, !dbg !257, !llvm.loop !258

for.end22:                                        ; preds = %for.cond13
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !260
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !260
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 15, !dbg !260
  %22 = load i16, i16* %zero, align 2, !dbg !261
  %arrayidx24 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 %22, !dbg !260
  store i16 1, i16* %arrayidx24, align 2, !dbg !262
  store i16 1, i16* %i, align 2, !dbg !263
  br label %for.cond25, !dbg !265

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %23 = load i16, i16* %i, align 2, !dbg !266
  %cmp26 = icmp slt i16 %23, 4, !dbg !268
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !269

for.body28:                                       ; preds = %for.cond25
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !270
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !270
  %25 = load i16, i16* %i, align 2, !dbg !271
  %arrayidx31 = getelementptr inbounds [32 x i16], [32 x i16]* %block30, i16 0, i16 %25, !dbg !270
  store i16 0, i16* %arrayidx31, align 2, !dbg !272
  br label %for.inc32, !dbg !270

for.inc32:                                        ; preds = %for.body28
  %26 = load i16, i16* %i, align 2, !dbg !273
  %inc33 = add nsw i16 %26, 1, !dbg !273
  store i16 %inc33, i16* %i, align 2, !dbg !273
  br label %for.cond25, !dbg !274, !llvm.loop !275

for.end34:                                        ; preds = %for.cond25
  %27 = load i16, i16* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 1), align 2, !dbg !277
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !278
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !278
  store i16 %27, i16* %exponent, align 2, !dbg !279
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !280
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !280
  %30 = load i16, i16* %block_offset37, align 2, !dbg !281
  %add38 = add i16 %30, 3, !dbg !281
  store i16 %add38, i16* %block_offset37, align 2, !dbg !281
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !282
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !282
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 17, !dbg !282
  store i16 0, i16* %check, align 2, !dbg !283
  ret void, !dbg !284
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_exp() #0 !dbg !285 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !286
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !286
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !286
  %1 = load i16, i16* %exponent, align 2, !dbg !286
  %and = and i16 %1, 1, !dbg !288
  %tobool = icmp ne i16 %and, 0, !dbg !288
  br i1 %tobool, label %if.then, label %if.else, !dbg !289

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !290
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !290
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !290
  %3 = load i16, i16* %exponent2, align 2, !dbg !292
  %shr = lshr i16 %3, 1, !dbg !292
  store i16 %shr, i16* %exponent2, align 2, !dbg !292
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !293
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !293
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 18, !dbg !293
  store i16 0, i16* %check_final, align 2, !dbg !294
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !295
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 17, !dbg !295
  store i16 0, i16* %check, align 2, !dbg !296
  br label %if.end, !dbg !297

if.else:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !298
  %exponent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !298
  %7 = load i16, i16* %exponent6, align 2, !dbg !300
  %shr7 = lshr i16 %7, 1, !dbg !300
  store i16 %shr7, i16* %exponent6, align 2, !dbg !300
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !301
  %check_final9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 18, !dbg !301
  store i16 1, i16* %check_final9, align 2, !dbg !302
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !303
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 17, !dbg !303
  store i16 1, i16* %check11, align 2, !dbg !304
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !305
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block() #0 !dbg !306 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !307
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !307
  store i16 0, i16* %check_final, align 2, !dbg !308
  ret void, !dbg !309
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block_get_result() #0 !dbg !310 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !311, metadata !DIExpression()), !dbg !312
  store i16 3, i16* %i, align 2, !dbg !313
  br label %for.cond, !dbg !315

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !316
  %cmp = icmp sge i16 %0, 0, !dbg !318
  br i1 %cmp, label %for.body, label %for.end, !dbg !319

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !320
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !320
  %2 = load i16, i16* %i, align 2, !dbg !322
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !320
  %3 = load i16, i16* %arrayidx, align 2, !dbg !320
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !323
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !323
  %5 = load i16, i16* %i, align 2, !dbg !324
  %arrayidx2 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 %5, !dbg !323
  store i16 %3, i16* %arrayidx2, align 2, !dbg !325
  br label %for.inc, !dbg !326

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !327
  %dec = add nsw i16 %6, -1, !dbg !327
  store i16 %dec, i16* %i, align 2, !dbg !327
  br label %for.cond, !dbg !328, !llvm.loop !329

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !331
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !331
  %8 = load i16, i16* %exponent, align 2, !dbg !331
  %cmp4 = icmp ugt i16 %8, 0, !dbg !333
  br i1 %cmp4, label %if.then, label %if.else, !dbg !334

if.then:                                          ; preds = %for.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !335
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 17, !dbg !335
  store i16 100, i16* %check, align 2, !dbg !337
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !338
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 18, !dbg !338
  store i16 1, i16* %check_final, align 2, !dbg !339
  br label %if.end25, !dbg !340

if.else:                                          ; preds = %for.end
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !341
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !341
  %12 = load i16, i16* %cyphertext_len, align 2, !dbg !341
  %add = add i16 %12, 4, !dbg !344
  %cmp8 = icmp ule i16 %add, 16, !dbg !345
  br i1 %cmp8, label %if.then9, label %if.end, !dbg !346

if.then9:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !347
  br label %for.cond10, !dbg !350

for.cond10:                                       ; preds = %for.inc22, %if.then9
  %13 = load i16, i16* %i, align 2, !dbg !351
  %cmp11 = icmp slt i16 %13, 4, !dbg !353
  br i1 %cmp11, label %for.body12, label %for.end24, !dbg !354

for.body12:                                       ; preds = %for.cond10
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !355
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !355
  %product14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 0, !dbg !355
  %15 = load i16, i16* %i, align 2, !dbg !357
  %arrayidx15 = getelementptr inbounds [32 x i16], [32 x i16]* %product14, i16 0, i16 %15, !dbg !355
  %16 = load i16, i16* %arrayidx15, align 2, !dbg !355
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !358
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 11, !dbg !358
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !359
  %cyphertext_len18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 5, !dbg !359
  %19 = load i16, i16* %cyphertext_len18, align 2, !dbg !359
  %arrayidx19 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %19, !dbg !358
  store i16 %16, i16* %arrayidx19, align 2, !dbg !360
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !361
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !361
  %cyphertext_len21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 5, !dbg !361
  %21 = load i16, i16* %cyphertext_len21, align 2, !dbg !362
  %inc = add i16 %21, 1, !dbg !362
  store i16 %inc, i16* %cyphertext_len21, align 2, !dbg !362
  br label %for.inc22, !dbg !363

for.inc22:                                        ; preds = %for.body12
  %22 = load i16, i16* %i, align 2, !dbg !364
  %inc23 = add nsw i16 %22, 1, !dbg !364
  store i16 %inc23, i16* %i, align 2, !dbg !364
  br label %for.cond10, !dbg !365, !llvm.loop !366

for.end24:                                        ; preds = %for.cond10
  br label %if.end, !dbg !368

if.end:                                           ; preds = %for.end24, %if.else
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then
  ret void, !dbg !369
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base() #0 !dbg !370 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !371
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !371
  store i16 1, i16* %check_final, align 2, !dbg !372
  ret void, !dbg !373
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base_get_result() #0 !dbg !374 {
entry:
  %i = alloca i16, align 2
  %b = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !375, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i16* %b, metadata !377, metadata !DIExpression()), !dbg !378
  store i16 0, i16* %i, align 2, !dbg !379
  br label %for.cond, !dbg !381

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !382
  %cmp = icmp slt i16 %0, 4, !dbg !384
  br i1 %cmp, label %for.body, label %for.end, !dbg !385

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !386
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !386
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !386
  %2 = load i16, i16* %i, align 2, !dbg !388
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !386
  %3 = load i16, i16* %arrayidx, align 2, !dbg !386
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !389
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !389
  %5 = load i16, i16* %i, align 2, !dbg !390
  %arrayidx2 = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %5, !dbg !389
  store i16 %3, i16* %arrayidx2, align 2, !dbg !391
  br label %for.inc, !dbg !392

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !393
  %inc = add nsw i16 %6, 1, !dbg !393
  store i16 %inc, i16* %i, align 2, !dbg !393
  br label %for.cond, !dbg !394, !llvm.loop !395

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !397
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !397
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !397
  store i16 0, i16* %check, align 2, !dbg !398
  ret void, !dbg !399
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_mod() #0 !dbg !400 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !401
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !401
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !401
  store i16 0, i16* %digit, align 2, !dbg !402
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !403
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !403
  store i16 0, i16* %carry, align 2, !dbg !404
  ret void, !dbg !405
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult() #0 !dbg !406 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i16* %a, metadata !409, metadata !DIExpression()), !dbg !410
  call void @llvm.dbg.declare(metadata i16* %b, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i16* %c, metadata !413, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !415, metadata !DIExpression()), !dbg !416
  call void @llvm.dbg.declare(metadata i16* %p, metadata !417, metadata !DIExpression()), !dbg !418
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !419
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !419
  %1 = load i16, i16* %carry, align 2, !dbg !419
  store i16 %1, i16* %p, align 2, !dbg !420
  store i16 0, i16* %c, align 2, !dbg !421
  store i16 0, i16* %i, align 2, !dbg !422
  br label %for.cond, !dbg !424

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !425
  %cmp = icmp slt i16 %2, 4, !dbg !427
  br i1 %cmp, label %for.body, label %for.end, !dbg !428

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !429
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !429
  %4 = load i16, i16* %digit, align 2, !dbg !429
  %5 = load i16, i16* %i, align 2, !dbg !432
  %sub = sub i16 %4, %5, !dbg !433
  %cmp2 = icmp uge i16 %sub, 0, !dbg !434
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !435

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !436
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !436
  %7 = load i16, i16* %digit4, align 2, !dbg !436
  %8 = load i16, i16* %i, align 2, !dbg !437
  %sub5 = sub i16 %7, %8, !dbg !438
  %cmp6 = icmp ult i16 %sub5, 4, !dbg !439
  br i1 %cmp6, label %if.then, label %if.end, !dbg !440

if.then:                                          ; preds = %land.lhs.true
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !441
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !441
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !443
  %digit9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !443
  %11 = load i16, i16* %digit9, align 2, !dbg !443
  %12 = load i16, i16* %i, align 2, !dbg !444
  %sub10 = sub i16 %11, %12, !dbg !445
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %base, i16 0, i16 %sub10, !dbg !441
  %13 = load i16, i16* %arrayidx, align 2, !dbg !441
  store i16 %13, i16* %a, align 2, !dbg !446
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !447
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !447
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !447
  %15 = load i16, i16* %i, align 2, !dbg !448
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %block, i16 0, i16 %15, !dbg !447
  %16 = load i16, i16* %arrayidx12, align 2, !dbg !447
  store i16 %16, i16* %b, align 2, !dbg !449
  %17 = load i16, i16* %a, align 2, !dbg !450
  %18 = load i16, i16* %b, align 2, !dbg !451
  %mul = mul i16 %17, %18, !dbg !452
  store i16 %mul, i16* %dp, align 2, !dbg !453
  %19 = load i16, i16* %dp, align 2, !dbg !454
  %shr = lshr i16 %19, 8, !dbg !455
  %20 = load i16, i16* %c, align 2, !dbg !456
  %add = add i16 %20, %shr, !dbg !456
  store i16 %add, i16* %c, align 2, !dbg !456
  %21 = load i16, i16* %dp, align 2, !dbg !457
  %and = and i16 %21, 255, !dbg !458
  %22 = load i16, i16* %p, align 2, !dbg !459
  %add13 = add i16 %22, %and, !dbg !459
  store i16 %add13, i16* %p, align 2, !dbg !459
  br label %if.end, !dbg !460

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !461

for.inc:                                          ; preds = %if.end
  %23 = load i16, i16* %i, align 2, !dbg !462
  %inc = add nsw i16 %23, 1, !dbg !462
  store i16 %inc, i16* %i, align 2, !dbg !462
  br label %for.cond, !dbg !463, !llvm.loop !464

for.end:                                          ; preds = %for.cond
  %24 = load i16, i16* %p, align 2, !dbg !466
  %shr14 = lshr i16 %24, 8, !dbg !467
  %25 = load i16, i16* %c, align 2, !dbg !468
  %add15 = add i16 %25, %shr14, !dbg !468
  store i16 %add15, i16* %c, align 2, !dbg !468
  %26 = load i16, i16* %p, align 2, !dbg !469
  %and16 = and i16 %26, 255, !dbg !469
  store i16 %and16, i16* %p, align 2, !dbg !469
  %27 = load i16, i16* %p, align 2, !dbg !470
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !471
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !471
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !471
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !472
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !472
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !472
  %30 = load i16, i16* %digit19, align 2, !dbg !472
  %arrayidx20 = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %30, !dbg !471
  store i16 %27, i16* %arrayidx20, align 2, !dbg !473
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !474
  %digit22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !474
  %32 = load i16, i16* %digit22, align 2, !dbg !475
  %inc23 = add i16 %32, 1, !dbg !475
  store i16 %inc23, i16* %digit22, align 2, !dbg !475
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !476
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !476
  %digit25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !476
  %34 = load i16, i16* %digit25, align 2, !dbg !476
  %cmp26 = icmp ult i16 %34, 8, !dbg !478
  br i1 %cmp26, label %if.then27, label %if.else, !dbg !479

if.then27:                                        ; preds = %for.end
  %35 = load i16, i16* %c, align 2, !dbg !480
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !482
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !482
  %carry29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 9, !dbg !482
  store i16 %35, i16* %carry29, align 2, !dbg !483
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !484
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 17, !dbg !484
  store i16 0, i16* %check, align 2, !dbg !485
  br label %if.end33, !dbg !486

if.else:                                          ; preds = %for.end
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !487
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !487
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !487
  store i16 1, i16* %check32, align 2, !dbg !489
  br label %if.end33

if.end33:                                         ; preds = %if.else, %if.then27
  ret void, !dbg !490
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_digits() #0 !dbg !491 {
entry:
  %d = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %d, metadata !492, metadata !DIExpression()), !dbg !493
  store i16 8, i16* %d, align 2, !dbg !494
  br label %do.body, !dbg !495

do.body:                                          ; preds = %land.end, %entry
  %0 = load i16, i16* %d, align 2, !dbg !496
  %dec = add nsw i16 %0, -1, !dbg !496
  store i16 %dec, i16* %d, align 2, !dbg !496
  br label %do.cond, !dbg !498

do.cond:                                          ; preds = %do.body
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !499
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !499
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !499
  %2 = load i16, i16* %d, align 2, !dbg !500
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !499
  %3 = load i16, i16* %arrayidx, align 2, !dbg !499
  %cmp = icmp eq i16 %3, 0, !dbg !501
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !502

land.rhs:                                         ; preds = %do.cond
  %4 = load i16, i16* %d, align 2, !dbg !503
  %cmp1 = icmp sgt i16 %4, 0, !dbg !504
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %5 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ], !dbg !505
  br i1 %5, label %do.body, label %do.end, !dbg !498, !llvm.loop !506

do.end:                                           ; preds = %land.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !508
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !508
  %product3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !508
  %7 = load i16, i16* %d, align 2, !dbg !510
  %arrayidx4 = getelementptr inbounds [32 x i16], [32 x i16]* %product3, i16 0, i16 %7, !dbg !508
  %8 = load i16, i16* %arrayidx4, align 2, !dbg !508
  %cmp5 = icmp eq i16 %8, 0, !dbg !511
  br i1 %cmp5, label %if.then, label %if.end, !dbg !512

if.then:                                          ; preds = %do.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !513
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !513
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !513
  store i16 0, i16* %check, align 2, !dbg !515
  br label %return, !dbg !516

if.end:                                           ; preds = %do.end
  %10 = load i16, i16* %d, align 2, !dbg !517
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !518
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !518
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !518
  store i16 %10, i16* %reduce, align 2, !dbg !519
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !520
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !520
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !520
  store i16 1, i16* %check9, align 2, !dbg !521
  br label %return, !dbg !522

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !522
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalizable() #0 !dbg !523 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %normalizable = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !524, metadata !DIExpression()), !dbg !525
  call void @llvm.dbg.declare(metadata i16* %m, metadata !526, metadata !DIExpression()), !dbg !527
  call void @llvm.dbg.declare(metadata i16* %n, metadata !528, metadata !DIExpression()), !dbg !529
  call void @llvm.dbg.declare(metadata i16* %d, metadata !530, metadata !DIExpression()), !dbg !531
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !532, metadata !DIExpression()), !dbg !534
  store i8 1, i8* %normalizable, align 1, !dbg !534
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !535
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !535
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !535
  %1 = load i16, i16* %reduce, align 2, !dbg !535
  %add = add i16 %1, 1, !dbg !536
  %sub = sub i16 %add, 4, !dbg !537
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !538
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !538
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !538
  store i16 %sub, i16* %offset, align 2, !dbg !539
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !540
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !540
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !540
  %4 = load i16, i16* %reduce3, align 2, !dbg !540
  store i16 %4, i16* %i, align 2, !dbg !542
  br label %for.cond, !dbg !543

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i16, i16* %i, align 2, !dbg !544
  %cmp = icmp sge i16 %5, 0, !dbg !546
  br i1 %cmp, label %for.body, label %for.end, !dbg !547

for.body:                                         ; preds = %for.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !548
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !548
  %7 = load i16, i16* %i, align 2, !dbg !551
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %7, !dbg !548
  %8 = load i16, i16* %arrayidx, align 2, !dbg !548
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !552
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !552
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !552
  %10 = load i16, i16* %i, align 2, !dbg !553
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !554
  %offset7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !554
  %12 = load i16, i16* %offset7, align 2, !dbg !554
  %sub8 = sub i16 %10, %12, !dbg !555
  %arrayidx9 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %sub8, !dbg !552
  %13 = load i16, i16* %arrayidx9, align 2, !dbg !552
  %cmp10 = icmp ugt i16 %8, %13, !dbg !556
  br i1 %cmp10, label %if.then, label %if.else, !dbg !557

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !558

if.else:                                          ; preds = %for.body
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !560
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !560
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !560
  %15 = load i16, i16* %i, align 2, !dbg !562
  %arrayidx13 = getelementptr inbounds [32 x i16], [32 x i16]* %product12, i16 0, i16 %15, !dbg !560
  %16 = load i16, i16* %arrayidx13, align 2, !dbg !560
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !563
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !563
  %18 = load i16, i16* %i, align 2, !dbg !564
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !565
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !565
  %offset17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 12, !dbg !565
  %20 = load i16, i16* %offset17, align 2, !dbg !565
  %sub18 = sub i16 %18, %20, !dbg !566
  %arrayidx19 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus15, i16 0, i16 %sub18, !dbg !563
  %21 = load i16, i16* %arrayidx19, align 2, !dbg !563
  %cmp20 = icmp ult i16 %16, %21, !dbg !567
  br i1 %cmp20, label %if.then21, label %if.end, !dbg !568

if.then21:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !569
  br label %for.end, !dbg !571

if.end:                                           ; preds = %if.else
  br label %if.end22

if.end22:                                         ; preds = %if.end
  br label %for.inc, !dbg !572

for.inc:                                          ; preds = %if.end22
  %22 = load i16, i16* %i, align 2, !dbg !573
  %dec = add nsw i16 %22, -1, !dbg !573
  store i16 %dec, i16* %i, align 2, !dbg !573
  br label %for.cond, !dbg !574, !llvm.loop !575

for.end:                                          ; preds = %if.then21, %if.then, %for.cond
  %23 = load i8, i8* %normalizable, align 1, !dbg !577
  %tobool = trunc i8 %23 to i1, !dbg !577
  br i1 %tobool, label %if.end28, label %land.lhs.true, !dbg !579

land.lhs.true:                                    ; preds = %for.end
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !580
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !580
  %reduce24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 10, !dbg !580
  %25 = load i16, i16* %reduce24, align 2, !dbg !580
  %cmp25 = icmp eq i16 %25, 3, !dbg !581
  br i1 %cmp25, label %if.then26, label %if.end28, !dbg !582

if.then26:                                        ; preds = %land.lhs.true
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !583
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !583
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 17, !dbg !583
  store i16 2, i16* %check, align 2, !dbg !585
  br label %if.end28, !dbg !586

if.end28:                                         ; preds = %if.then26, %land.lhs.true, %for.end
  %27 = load i8, i8* %normalizable, align 1, !dbg !587
  %tobool29 = trunc i8 %27 to i1, !dbg !587
  br i1 %tobool29, label %if.then30, label %if.else33, !dbg !589

if.then30:                                        ; preds = %if.end28
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !590
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !590
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !590
  store i16 0, i16* %check32, align 2, !dbg !592
  br label %if.end36, !dbg !593

if.else33:                                        ; preds = %if.end28
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !594
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !594
  %check35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 17, !dbg !594
  store i16 1, i16* %check35, align 2, !dbg !596
  br label %if.end36

if.end36:                                         ; preds = %if.else33, %if.then30
  ret void, !dbg !597
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalize() #0 !dbg !598 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %m, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i16* %n, metadata !601, metadata !DIExpression()), !dbg !602
  call void @llvm.dbg.declare(metadata i16* %d, metadata !603, metadata !DIExpression()), !dbg !604
  call void @llvm.dbg.declare(metadata i16* %s, metadata !605, metadata !DIExpression()), !dbg !606
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !607, metadata !DIExpression()), !dbg !608
  call void @llvm.dbg.declare(metadata i16* %i, metadata !609, metadata !DIExpression()), !dbg !610
  store i16 0, i16* %borrow, align 2, !dbg !611
  store i16 0, i16* %i, align 2, !dbg !612
  br label %for.cond, !dbg !614

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !615
  %cmp = icmp slt i16 %0, 4, !dbg !617
  br i1 %cmp, label %for.body, label %for.end, !dbg !618

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !619
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !619
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !619
  %2 = load i16, i16* %i, align 2, !dbg !621
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !622
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !622
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !622
  %4 = load i16, i16* %offset, align 2, !dbg !622
  %add = add i16 %2, %4, !dbg !623
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %add, !dbg !619
  %5 = load i16, i16* %arrayidx, align 2, !dbg !619
  store i16 %5, i16* %m, align 2, !dbg !624
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !625
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !625
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !625
  %7 = load i16, i16* %i, align 2, !dbg !626
  %arrayidx3 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %7, !dbg !625
  %8 = load i16, i16* %arrayidx3, align 2, !dbg !625
  store i16 %8, i16* %n, align 2, !dbg !627
  %9 = load i16, i16* %n, align 2, !dbg !628
  %10 = load i16, i16* %borrow, align 2, !dbg !629
  %add4 = add i16 %9, %10, !dbg !630
  store i16 %add4, i16* %s, align 2, !dbg !631
  %11 = load i16, i16* %m, align 2, !dbg !632
  %12 = load i16, i16* %s, align 2, !dbg !634
  %cmp5 = icmp ult i16 %11, %12, !dbg !635
  br i1 %cmp5, label %if.then, label %if.else, !dbg !636

if.then:                                          ; preds = %for.body
  %13 = load i16, i16* %m, align 2, !dbg !637
  %add6 = add i16 %13, 256, !dbg !637
  store i16 %add6, i16* %m, align 2, !dbg !637
  store i16 1, i16* %borrow, align 2, !dbg !639
  br label %if.end, !dbg !640

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !641
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i16, i16* %m, align 2, !dbg !643
  %15 = load i16, i16* %s, align 2, !dbg !644
  %sub = sub i16 %14, %15, !dbg !645
  store i16 %sub, i16* %d, align 2, !dbg !646
  %16 = load i16, i16* %d, align 2, !dbg !647
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !648
  %product8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !648
  %18 = load i16, i16* %i, align 2, !dbg !649
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !650
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !650
  %offset10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 12, !dbg !650
  %20 = load i16, i16* %offset10, align 2, !dbg !650
  %add11 = add i16 %18, %20, !dbg !651
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %product8, i16 0, i16 %add11, !dbg !648
  store i16 %16, i16* %arrayidx12, align 2, !dbg !652
  br label %for.inc, !dbg !653

for.inc:                                          ; preds = %if.end
  %21 = load i16, i16* %i, align 2, !dbg !654
  %inc = add nsw i16 %21, 1, !dbg !654
  store i16 %inc, i16* %i, align 2, !dbg !654
  br label %for.cond, !dbg !655, !llvm.loop !656

for.end:                                          ; preds = %for.cond
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !658
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !658
  %offset14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 12, !dbg !658
  %23 = load i16, i16* %offset14, align 2, !dbg !658
  %cmp15 = icmp ugt i16 %23, 0, !dbg !660
  br i1 %cmp15, label %if.then16, label %if.else17, !dbg !661

if.then16:                                        ; preds = %for.end
  br label %if.end19, !dbg !662

if.else17:                                        ; preds = %for.end
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !664
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 17, !dbg !664
  store i16 2, i16* %check, align 2, !dbg !666
  br label %if.end19

if.end19:                                         ; preds = %if.else17, %if.then16
  ret void, !dbg !667
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_n_divisor() #0 !dbg !668 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !669
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !669
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !669
  %arrayidx = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 3, !dbg !669
  %1 = load i16, i16* %arrayidx, align 2, !dbg !669
  %shl = shl i16 %1, 8, !dbg !670
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !671
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !671
  %arrayidx3 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus2, i16 0, i16 2, !dbg !671
  %3 = load i16, i16* %arrayidx3, align 2, !dbg !671
  %add = add i16 %shl, %3, !dbg !672
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !673
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !673
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !673
  store i16 %add, i16* %n_div, align 2, !dbg !674
  ret void, !dbg !675
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_quotient() #0 !dbg !676 {
entry:
  %m_n = alloca i16, align 2
  %q = alloca i16, align 2
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i16* %m_n, metadata !677, metadata !DIExpression()), !dbg !678
  call void @llvm.dbg.declare(metadata i16* %q, metadata !679, metadata !DIExpression()), !dbg !680
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !681, metadata !DIExpression()), !dbg !682
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !683, metadata !DIExpression()), !dbg !684
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !685
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !685
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !685
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !687
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !687
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !687
  %2 = load i16, i16* %reduce, align 2, !dbg !687
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %2, !dbg !685
  %3 = load i16, i16* %arrayidx, align 2, !dbg !685
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !688
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !688
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !688
  %arrayidx3 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 3, !dbg !688
  %5 = load i16, i16* %arrayidx3, align 2, !dbg !688
  %cmp = icmp eq i16 %3, %5, !dbg !689
  br i1 %cmp, label %if.then, label %if.else, !dbg !690

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !691
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !691
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 16, !dbg !691
  store i16 255, i16* %quotient, align 2, !dbg !693
  br label %if.end, !dbg !694

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !695
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !695
  %product6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !695
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !697
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !697
  %reduce8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !697
  %9 = load i16, i16* %reduce8, align 2, !dbg !697
  %arrayidx9 = getelementptr inbounds [32 x i16], [32 x i16]* %product6, i16 0, i16 %9, !dbg !695
  %10 = load i16, i16* %arrayidx9, align 2, !dbg !695
  %shl = shl i16 %10, 8, !dbg !698
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !699
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !699
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !699
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !700
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !700
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !700
  %13 = load i16, i16* %reduce13, align 2, !dbg !700
  %sub = sub i16 %13, 1, !dbg !701
  %arrayidx14 = getelementptr inbounds [32 x i16], [32 x i16]* %product11, i16 0, i16 %sub, !dbg !699
  %14 = load i16, i16* %arrayidx14, align 2, !dbg !699
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !702
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !702
  %modulus16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 7, !dbg !702
  %arrayidx17 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus16, i16 0, i16 3, !dbg !702
  %16 = load i16, i16* %arrayidx17, align 2, !dbg !702
  %div = udiv i16 %14, %16, !dbg !703
  %add = add i16 %shl, %div, !dbg !704
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !705
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !705
  %quotient19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !705
  store i16 %add, i16* %quotient19, align 2, !dbg !706
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !707
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !707
  %product21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 0, !dbg !707
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !708
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !708
  %reduce23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 10, !dbg !708
  %20 = load i16, i16* %reduce23, align 2, !dbg !708
  %arrayidx24 = getelementptr inbounds [32 x i16], [32 x i16]* %product21, i16 0, i16 %20, !dbg !707
  %21 = load i16, i16* %arrayidx24, align 2, !dbg !707
  %conv = zext i16 %21 to i32, !dbg !709
  %shl25 = shl i32 %conv, 16, !dbg !710
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !711
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !711
  %product27 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 0, !dbg !711
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !712
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !712
  %reduce29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !712
  %24 = load i16, i16* %reduce29, align 2, !dbg !712
  %sub30 = sub i16 %24, 1, !dbg !713
  %arrayidx31 = getelementptr inbounds [32 x i16], [32 x i16]* %product27, i16 0, i16 %sub30, !dbg !711
  %25 = load i16, i16* %arrayidx31, align 2, !dbg !711
  %shl32 = shl i16 %25, 8, !dbg !714
  %conv33 = zext i16 %shl32 to i32, !dbg !715
  %add34 = add i32 %shl25, %conv33, !dbg !716
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !717
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !717
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !717
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !718
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !718
  %reduce38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 10, !dbg !718
  %28 = load i16, i16* %reduce38, align 2, !dbg !718
  %sub39 = sub i16 %28, 2, !dbg !719
  %arrayidx40 = getelementptr inbounds [32 x i16], [32 x i16]* %product36, i16 0, i16 %sub39, !dbg !717
  %29 = load i16, i16* %arrayidx40, align 2, !dbg !717
  %conv41 = zext i16 %29 to i32, !dbg !717
  %add42 = add i32 %add34, %conv41, !dbg !720
  store i32 %add42, i32* %n_q, align 2, !dbg !721
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !722
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !722
  %quotient44 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 16, !dbg !722
  %31 = load i16, i16* %quotient44, align 2, !dbg !723
  %inc = add i16 %31, 1, !dbg !723
  store i16 %inc, i16* %quotient44, align 2, !dbg !723
  br label %do.body, !dbg !724

do.body:                                          ; preds = %do.cond, %if.end
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !725
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !725
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !725
  %33 = load i16, i16* %quotient46, align 2, !dbg !727
  %dec = add i16 %33, -1, !dbg !727
  store i16 %dec, i16* %quotient46, align 2, !dbg !727
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !728
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 13, !dbg !728
  %35 = load i16, i16* %n_div, align 2, !dbg !728
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !729
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !729
  %quotient49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 16, !dbg !729
  %37 = load i16, i16* %quotient49, align 2, !dbg !729
  %call = call i16 bitcast (i16 (...)* @mult16 to i16 (i16, i16)*)(i16 %35, i16 %37), !dbg !730
  %conv50 = sext i16 %call to i32, !dbg !730
  store i32 %conv50, i32* %qn, align 2, !dbg !731
  br label %do.cond, !dbg !732

do.cond:                                          ; preds = %do.body
  %38 = load i32, i32* %qn, align 2, !dbg !733
  %39 = load i32, i32* %n_q, align 2, !dbg !734
  %cmp51 = icmp ugt i32 %38, %39, !dbg !735
  br i1 %cmp51, label %do.body, label %do.end, !dbg !732, !llvm.loop !736

do.end:                                           ; preds = %do.cond
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !738
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !738
  %reduce54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 10, !dbg !738
  %41 = load i16, i16* %reduce54, align 2, !dbg !739
  %dec55 = add i16 %41, -1, !dbg !739
  store i16 %dec55, i16* %reduce54, align 2, !dbg !739
  ret void, !dbg !740
}

declare dso_local i16 @mult16(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_multiply() #0 !dbg !741 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !742, metadata !DIExpression()), !dbg !743
  call void @llvm.dbg.declare(metadata i16* %m, metadata !744, metadata !DIExpression()), !dbg !745
  call void @llvm.dbg.declare(metadata i16* %n, metadata !746, metadata !DIExpression()), !dbg !747
  call void @llvm.dbg.declare(metadata i16* %c, metadata !748, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !750, metadata !DIExpression()), !dbg !751
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !752
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !752
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !752
  %1 = load i16, i16* %reduce, align 2, !dbg !752
  %add = add i16 %1, 1, !dbg !753
  %sub = sub i16 %add, 4, !dbg !754
  store i16 %sub, i16* %offset, align 2, !dbg !755
  store i16 0, i16* %i, align 2, !dbg !756
  br label %for.cond, !dbg !758

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !759
  %3 = load i16, i16* %offset, align 2, !dbg !761
  %cmp = icmp ult i16 %2, %3, !dbg !762
  br i1 %cmp, label %for.body, label %for.end, !dbg !763

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !764
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !764
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !764
  %5 = load i16, i16* %i, align 2, !dbg !766
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product2, i16 0, i16 %5, !dbg !764
  store i16 0, i16* %arrayidx, align 2, !dbg !767
  br label %for.inc, !dbg !768

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !769
  %inc = add nsw i16 %6, 1, !dbg !769
  store i16 %inc, i16* %i, align 2, !dbg !769
  br label %for.cond, !dbg !770, !llvm.loop !771

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !773
  %7 = load i16, i16* %offset, align 2, !dbg !774
  store i16 %7, i16* %i, align 2, !dbg !776
  br label %for.cond2, !dbg !777

for.cond2:                                        ; preds = %for.inc17, %for.end
  %8 = load i16, i16* %i, align 2, !dbg !778
  %cmp3 = icmp slt i16 %8, 8, !dbg !780
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !781

for.body4:                                        ; preds = %for.cond2
  %9 = load i16, i16* %c, align 2, !dbg !782
  store i16 %9, i16* %m, align 2, !dbg !784
  %10 = load i16, i16* %i, align 2, !dbg !785
  %11 = load i16, i16* %offset, align 2, !dbg !787
  %add5 = add i16 %11, 4, !dbg !788
  %cmp6 = icmp ult i16 %10, %add5, !dbg !789
  br i1 %cmp6, label %if.then, label %if.else, !dbg !790

if.then:                                          ; preds = %for.body4
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !791
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !791
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !791
  %13 = load i16, i16* %i, align 2, !dbg !793
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !794
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !794
  %offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 12, !dbg !794
  %15 = load i16, i16* %offset9, align 2, !dbg !794
  %sub10 = sub i16 %13, %15, !dbg !795
  %arrayidx11 = getelementptr inbounds [4 x i16], [4 x i16]* %modulus, i16 0, i16 %sub10, !dbg !791
  %16 = load i16, i16* %arrayidx11, align 2, !dbg !791
  store i16 %16, i16* %n, align 2, !dbg !796
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !797
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !797
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 16, !dbg !797
  %18 = load i16, i16* %quotient, align 2, !dbg !797
  %19 = load i16, i16* %n, align 2, !dbg !798
  %mul = mul i16 %18, %19, !dbg !799
  %20 = load i16, i16* %m, align 2, !dbg !800
  %add13 = add i16 %20, %mul, !dbg !800
  store i16 %add13, i16* %m, align 2, !dbg !800
  br label %if.end, !dbg !801

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !802
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %21 = load i16, i16* %m, align 2, !dbg !804
  %shr = lshr i16 %21, 8, !dbg !805
  store i16 %shr, i16* %c, align 2, !dbg !806
  %22 = load i16, i16* %m, align 2, !dbg !807
  %and = and i16 %22, 255, !dbg !807
  store i16 %and, i16* %m, align 2, !dbg !807
  %23 = load i16, i16* %m, align 2, !dbg !808
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !809
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !809
  %product215 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 14, !dbg !809
  %25 = load i16, i16* %i, align 2, !dbg !810
  %arrayidx16 = getelementptr inbounds [32 x i16], [32 x i16]* %product215, i16 0, i16 %25, !dbg !809
  store i16 %23, i16* %arrayidx16, align 2, !dbg !811
  br label %for.inc17, !dbg !812

for.inc17:                                        ; preds = %if.end
  %26 = load i16, i16* %i, align 2, !dbg !813
  %inc18 = add nsw i16 %26, 1, !dbg !813
  store i16 %inc18, i16* %i, align 2, !dbg !813
  br label %for.cond2, !dbg !814, !llvm.loop !815

for.end19:                                        ; preds = %for.cond2
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
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !861
  store i16 0, i16* %check, align 2, !dbg !863
  br label %if.end20, !dbg !864

if.else17:                                        ; preds = %for.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !865
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !865
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 17, !dbg !865
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
  ret void, !dbg !937
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_subtract() #0 !dbg !938 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !939, metadata !DIExpression()), !dbg !940
  call void @llvm.dbg.declare(metadata i16* %m, metadata !941, metadata !DIExpression()), !dbg !942
  call void @llvm.dbg.declare(metadata i16* %s, metadata !943, metadata !DIExpression()), !dbg !944
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !945, metadata !DIExpression()), !dbg !946
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !947, metadata !DIExpression()), !dbg !948
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !949, metadata !DIExpression()), !dbg !950
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !951
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !951
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !951
  %1 = load i16, i16* %reduce, align 2, !dbg !951
  %add = add i16 %1, 1, !dbg !952
  %sub = sub i16 %add, 4, !dbg !953
  store i16 %sub, i16* %offset, align 2, !dbg !954
  store i16 0, i16* %borrow, align 2, !dbg !955
  store i16 0, i16* %i, align 2, !dbg !956
  br label %for.cond, !dbg !958

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !959
  %cmp = icmp slt i16 %2, 8, !dbg !961
  br i1 %cmp, label %for.body, label %for.end, !dbg !962

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !963
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !963
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !963
  %4 = load i16, i16* %i, align 2, !dbg !965
  %arrayidx = getelementptr inbounds [32 x i16], [32 x i16]* %product, i16 0, i16 %4, !dbg !963
  %5 = load i16, i16* %arrayidx, align 2, !dbg !963
  store i16 %5, i16* %m, align 2, !dbg !966
  %6 = load i16, i16* %i, align 2, !dbg !967
  %7 = load i16, i16* %offset, align 2, !dbg !969
  %cmp2 = icmp uge i16 %6, %7, !dbg !970
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !971

if.then:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !972
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !972
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !972
  %9 = load i16, i16* %i, align 2, !dbg !974
  %arrayidx4 = getelementptr inbounds [32 x i16], [32 x i16]* %product2, i16 0, i16 %9, !dbg !972
  %10 = load i16, i16* %arrayidx4, align 2, !dbg !972
  store i16 %10, i16* %qn, align 2, !dbg !975
  %11 = load i16, i16* %qn, align 2, !dbg !976
  %12 = load i16, i16* %borrow, align 2, !dbg !977
  %add5 = add i16 %11, %12, !dbg !978
  store i16 %add5, i16* %s, align 2, !dbg !979
  %13 = load i16, i16* %m, align 2, !dbg !980
  %14 = load i16, i16* %s, align 2, !dbg !982
  %cmp6 = icmp ult i16 %13, %14, !dbg !983
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !984

if.then7:                                         ; preds = %if.then
  %15 = load i16, i16* %m, align 2, !dbg !985
  %add8 = add i16 %15, 256, !dbg !985
  store i16 %add8, i16* %m, align 2, !dbg !985
  store i16 1, i16* %borrow, align 2, !dbg !987
  br label %if.end, !dbg !988

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !989
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %16 = load i16, i16* %m, align 2, !dbg !991
  %17 = load i16, i16* %s, align 2, !dbg !992
  %sub9 = sub i16 %16, %17, !dbg !993
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !994
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !994
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !994
  %19 = load i16, i16* %i, align 2, !dbg !995
  %arrayidx12 = getelementptr inbounds [32 x i16], [32 x i16]* %product11, i16 0, i16 %19, !dbg !994
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !996
  br label %if.end13, !dbg !997

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !998

for.inc:                                          ; preds = %if.end13
  %20 = load i16, i16* %i, align 2, !dbg !999
  %inc = add nsw i16 %20, 1, !dbg !999
  store i16 %inc, i16* %i, align 2, !dbg !999
  br label %for.cond, !dbg !1000, !llvm.loop !1001

for.end:                                          ; preds = %for.cond
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1003
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !1003
  %reduce15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 10, !dbg !1003
  %22 = load i16, i16* %reduce15, align 2, !dbg !1003
  %add16 = add i16 %22, 1, !dbg !1005
  %cmp17 = icmp ugt i16 %add16, 4, !dbg !1006
  br i1 %cmp17, label %if.then18, label %if.else19, !dbg !1007

if.then18:                                        ; preds = %for.end
  br label %if.end20, !dbg !1008

if.else19:                                        ; preds = %for.end
  br label %if.end20

if.end20:                                         ; preds = %if.else19, %if.then18
  ret void, !dbg !1010
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !1011 {
entry:
  ret void, !dbg !1012
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !1013 {
entry:
  call void @exit(i16 0) #6, !dbg !1014
  unreachable, !dbg !1014
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !1015 {
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
  %__x94 = alloca i16, align 2
  %tmp95 = alloca i16, align 2
  %__x97 = alloca i16, align 2
  %tmp98 = alloca i16, align 2
  %__x107 = alloca i16, align 2
  %tmp108 = alloca i16, align 2
  %__x110 = alloca i16, align 2
  %tmp111 = alloca i16, align 2
  %__x125 = alloca i16, align 2
  %tmp126 = alloca i16, align 2
  %__x128 = alloca i16, align 2
  %tmp129 = alloca i16, align 2
  %__x138 = alloca i16, align 2
  %tmp139 = alloca i16, align 2
  %__x141 = alloca i16, align 2
  %tmp142 = alloca i16, align 2
  %__x159 = alloca i16, align 2
  %tmp160 = alloca i16, align 2
  %__x162 = alloca i16, align 2
  %tmp163 = alloca i16, align 2
  %__x172 = alloca i16, align 2
  %tmp173 = alloca i16, align 2
  %__x175 = alloca i16, align 2
  %tmp176 = alloca i16, align 2
  %__x195 = alloca i16, align 2
  %tmp196 = alloca i16, align 2
  %__x198 = alloca i16, align 2
  %tmp199 = alloca i16, align 2
  %__x208 = alloca i16, align 2
  %tmp209 = alloca i16, align 2
  %__x211 = alloca i16, align 2
  %tmp212 = alloca i16, align 2
  %__x230 = alloca i16, align 2
  %tmp231 = alloca i16, align 2
  %__x233 = alloca i16, align 2
  %tmp234 = alloca i16, align 2
  %__x243 = alloca i16, align 2
  %tmp244 = alloca i16, align 2
  %__x246 = alloca i16, align 2
  %tmp247 = alloca i16, align 2
  %__x264 = alloca i16, align 2
  %tmp265 = alloca i16, align 2
  %__x267 = alloca i16, align 2
  %tmp268 = alloca i16, align 2
  %__x277 = alloca i16, align 2
  %tmp278 = alloca i16, align 2
  %__x280 = alloca i16, align 2
  %tmp281 = alloca i16, align 2
  %__x301 = alloca i16, align 2
  %tmp302 = alloca i16, align 2
  %__x304 = alloca i16, align 2
  %tmp305 = alloca i16, align 2
  %__x314 = alloca i16, align 2
  %tmp315 = alloca i16, align 2
  %__x317 = alloca i16, align 2
  %tmp318 = alloca i16, align 2
  %__x339 = alloca i16, align 2
  %tmp340 = alloca i16, align 2
  %__x342 = alloca i16, align 2
  %tmp343 = alloca i16, align 2
  %__x352 = alloca i16, align 2
  %tmp353 = alloca i16, align 2
  %__x355 = alloca i16, align 2
  %tmp356 = alloca i16, align 2
  %__x370 = alloca i16, align 2
  %tmp371 = alloca i16, align 2
  %__x373 = alloca i16, align 2
  %tmp374 = alloca i16, align 2
  %__x383 = alloca i16, align 2
  %tmp384 = alloca i16, align 2
  %__x386 = alloca i16, align 2
  %tmp387 = alloca i16, align 2
  %__x401 = alloca i16, align 2
  %tmp402 = alloca i16, align 2
  %__x404 = alloca i16, align 2
  %tmp405 = alloca i16, align 2
  %__x414 = alloca i16, align 2
  %tmp415 = alloca i16, align 2
  %__x417 = alloca i16, align 2
  %tmp418 = alloca i16, align 2
  %__x436 = alloca i16, align 2
  %tmp437 = alloca i16, align 2
  %__x439 = alloca i16, align 2
  %tmp440 = alloca i16, align 2
  %__x449 = alloca i16, align 2
  %tmp450 = alloca i16, align 2
  %__x452 = alloca i16, align 2
  %tmp453 = alloca i16, align 2
  %__x468 = alloca i16, align 2
  %tmp469 = alloca i16, align 2
  %__x471 = alloca i16, align 2
  %tmp472 = alloca i16, align 2
  %__x481 = alloca i16, align 2
  %tmp482 = alloca i16, align 2
  %__x484 = alloca i16, align 2
  %tmp485 = alloca i16, align 2
  %__x509 = alloca i16, align 2
  %tmp510 = alloca i16, align 2
  %__x512 = alloca i16, align 2
  %tmp513 = alloca i16, align 2
  %__x522 = alloca i16, align 2
  %tmp523 = alloca i16, align 2
  %__x525 = alloca i16, align 2
  %tmp526 = alloca i16, align 2
  %__x545 = alloca i16, align 2
  %tmp546 = alloca i16, align 2
  %__x548 = alloca i16, align 2
  %tmp549 = alloca i16, align 2
  %__x558 = alloca i16, align 2
  %tmp559 = alloca i16, align 2
  %__x561 = alloca i16, align 2
  %tmp562 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1018
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1019
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1020
  call void @camel_init(), !dbg !1021
  br label %while.body, !dbg !1022

while.body:                                       ; preds = %entry, %while.end
  call void @task_init(), !dbg !1023
  br label %do.body, !dbg !1025

do.body:                                          ; preds = %while.body
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1026
  %cmp = icmp eq i16 %0, 1, !dbg !1026
  br i1 %cmp, label %if.then, label %if.else, !dbg !1029

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1030
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1030
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1030
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !1030
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !1030
  call void @__dump_registers(i16* %arraydecay), !dbg !1030
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !1032, metadata !DIExpression()), !dbg !1034
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1034, !srcloc !1035
  store i16 %2, i16* %__x, align 2, !dbg !1034
  %3 = load i16, i16* %__x, align 2, !dbg !1034
  store i16 %3, i16* %tmp, align 2, !dbg !1034
  %4 = load i16, i16* %tmp, align 2, !dbg !1034
  %add = add i16 %4, 2, !dbg !1030
  %5 = inttoptr i16 %add to i8*, !dbg !1030
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !1036, metadata !DIExpression()), !dbg !1038
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1038, !srcloc !1039
  store i16 %6, i16* %__x1, align 2, !dbg !1038
  %7 = load i16, i16* %__x1, align 2, !dbg !1038
  store i16 %7, i16* %tmp2, align 2, !dbg !1038
  %8 = load i16, i16* %tmp2, align 2, !dbg !1038
  %add3 = add i16 %8, 2, !dbg !1030
  %sub = sub i16 9216, %add3, !dbg !1030
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !1030
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !1030
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1030
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !1030
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1030
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 344, i16 zeroext %11), !dbg !1030
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !1030
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1030
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1030
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !1030
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !1030
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1030
  br label %if.end, !dbg !1030

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1040
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1040
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1040
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !1040
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !1040
  call void @__dump_registers(i16* %arraydecay6), !dbg !1040
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !1042, metadata !DIExpression()), !dbg !1044
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1044, !srcloc !1045
  store i16 %15, i16* %__x7, align 2, !dbg !1044
  %16 = load i16, i16* %__x7, align 2, !dbg !1044
  store i16 %16, i16* %tmp8, align 2, !dbg !1044
  %17 = load i16, i16* %tmp8, align 2, !dbg !1044
  %add9 = add i16 %17, 2, !dbg !1040
  %18 = inttoptr i16 %add9 to i8*, !dbg !1040
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !1046, metadata !DIExpression()), !dbg !1048
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1048, !srcloc !1049
  store i16 %19, i16* %__x10, align 2, !dbg !1048
  %20 = load i16, i16* %__x10, align 2, !dbg !1048
  store i16 %20, i16* %tmp11, align 2, !dbg !1048
  %21 = load i16, i16* %tmp11, align 2, !dbg !1048
  %add12 = add i16 %21, 2, !dbg !1040
  %sub13 = sub i16 9216, %add12, !dbg !1040
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !1040
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !1040
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1040
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !1040
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1040
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 344, i16 zeroext %24), !dbg !1040
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !1040
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1040
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1040
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !1040
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !1040
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1040
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !1029

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !1050
  br label %while.body18, !dbg !1051

while.body18:                                     ; preds = %do.end, %if.end572
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1052
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !1052
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !1052
  %28 = load i16, i16* %check_final, align 2, !dbg !1052
  %cmp19 = icmp eq i16 %28, 0, !dbg !1055
  br i1 %cmp19, label %land.lhs.true, label %if.end53, !dbg !1056

land.lhs.true:                                    ; preds = %while.body18
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1057
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !1057
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 17, !dbg !1057
  %30 = load i16, i16* %check, align 2, !dbg !1057
  %cmp21 = icmp ne i16 %30, 100, !dbg !1058
  br i1 %cmp21, label %if.then22, label %if.end53, !dbg !1059

if.then22:                                        ; preds = %land.lhs.true
  call void @task_pad(), !dbg !1060
  br label %do.body23, !dbg !1062

do.body23:                                        ; preds = %if.then22
  %31 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1063
  %cmp24 = icmp eq i16 %31, 1, !dbg !1063
  br i1 %cmp24, label %if.then25, label %if.else38, !dbg !1066

if.then25:                                        ; preds = %do.body23
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1067
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %reg_file26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !1067
  %arraydecay27 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file26, i16 0, i16 0, !dbg !1067
  call void @__dump_registers(i16* %arraydecay27), !dbg !1067
  call void @llvm.dbg.declare(metadata i16* %__x28, metadata !1069, metadata !DIExpression()), !dbg !1071
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1071, !srcloc !1072
  store i16 %33, i16* %__x28, align 2, !dbg !1071
  %34 = load i16, i16* %__x28, align 2, !dbg !1071
  store i16 %34, i16* %tmp29, align 2, !dbg !1071
  %35 = load i16, i16* %tmp29, align 2, !dbg !1071
  %add30 = add i16 %35, 2, !dbg !1067
  %36 = inttoptr i16 %add30 to i8*, !dbg !1067
  call void @llvm.dbg.declare(metadata i16* %__x31, metadata !1073, metadata !DIExpression()), !dbg !1075
  %37 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1075, !srcloc !1076
  store i16 %37, i16* %__x31, align 2, !dbg !1075
  %38 = load i16, i16* %__x31, align 2, !dbg !1075
  store i16 %38, i16* %tmp32, align 2, !dbg !1075
  %39 = load i16, i16* %tmp32, align 2, !dbg !1075
  %add33 = add i16 %39, 2, !dbg !1067
  %sub34 = sub i16 9216, %add33, !dbg !1067
  %call35 = call zeroext i16 @__fast_hw_crc(i8* %36, i16 zeroext %sub34, i16 zeroext -1), !dbg !1067
  store i16 %call35, i16* @tmp_stack_crc, align 2, !dbg !1067
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %41 = bitcast %struct.camel_buffer_t* %40 to i8*, !dbg !1067
  %42 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1067
  %call36 = call zeroext i16 @__fast_hw_crc(i8* %41, i16 zeroext 344, i16 zeroext %42), !dbg !1067
  store i16 %call36, i16* @tmp_stack_buf_crc, align 2, !dbg !1067
  %43 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1067
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %stack_and_buf_crc37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 2, !dbg !1067
  store i16 %43, i16* %stack_and_buf_crc37, align 2, !dbg !1067
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1067
  br label %if.end51, !dbg !1067

if.else38:                                        ; preds = %do.body23
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1077
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %reg_file39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 0, !dbg !1077
  %arraydecay40 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file39, i16 0, i16 0, !dbg !1077
  call void @__dump_registers(i16* %arraydecay40), !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %__x41, metadata !1079, metadata !DIExpression()), !dbg !1081
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1081, !srcloc !1082
  store i16 %46, i16* %__x41, align 2, !dbg !1081
  %47 = load i16, i16* %__x41, align 2, !dbg !1081
  store i16 %47, i16* %tmp42, align 2, !dbg !1081
  %48 = load i16, i16* %tmp42, align 2, !dbg !1081
  %add43 = add i16 %48, 2, !dbg !1077
  %49 = inttoptr i16 %add43 to i8*, !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %__x44, metadata !1083, metadata !DIExpression()), !dbg !1085
  %50 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1085, !srcloc !1086
  store i16 %50, i16* %__x44, align 2, !dbg !1085
  %51 = load i16, i16* %__x44, align 2, !dbg !1085
  store i16 %51, i16* %tmp45, align 2, !dbg !1085
  %52 = load i16, i16* %tmp45, align 2, !dbg !1085
  %add46 = add i16 %52, 2, !dbg !1077
  %sub47 = sub i16 9216, %add46, !dbg !1077
  %call48 = call zeroext i16 @__fast_hw_crc(i8* %49, i16 zeroext %sub47, i16 zeroext -1), !dbg !1077
  store i16 %call48, i16* @tmp_stack_crc, align 2, !dbg !1077
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %54 = bitcast %struct.camel_buffer_t* %53 to i8*, !dbg !1077
  %55 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1077
  %call49 = call zeroext i16 @__fast_hw_crc(i8* %54, i16 zeroext 344, i16 zeroext %55), !dbg !1077
  store i16 %call49, i16* @tmp_stack_buf_crc, align 2, !dbg !1077
  %56 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1077
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %stack_and_buf_crc50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 2, !dbg !1077
  store i16 %56, i16* %stack_and_buf_crc50, align 2, !dbg !1077
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1077
  br label %if.end51

if.end51:                                         ; preds = %if.else38, %if.then25
  br label %do.end52, !dbg !1066

do.end52:                                         ; preds = %if.end51
  call void @task_commit(), !dbg !1087
  br label %if.end53, !dbg !1088

if.end53:                                         ; preds = %do.end52, %land.lhs.true, %while.body18
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1089
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i32 0, i32 1, !dbg !1089
  %check55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 17, !dbg !1089
  %59 = load i16, i16* %check55, align 2, !dbg !1089
  %cmp56 = icmp ne i16 %59, 100, !dbg !1091
  br i1 %cmp56, label %if.then57, label %if.end88, !dbg !1092

if.then57:                                        ; preds = %if.end53
  call void @task_exp(), !dbg !1093
  br label %do.body58, !dbg !1095

do.body58:                                        ; preds = %if.then57
  %60 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1096
  %cmp59 = icmp eq i16 %60, 1, !dbg !1096
  br i1 %cmp59, label %if.then60, label %if.else73, !dbg !1099

if.then60:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1100
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1100
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1100
  %reg_file61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 0, !dbg !1100
  %arraydecay62 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file61, i16 0, i16 0, !dbg !1100
  call void @__dump_registers(i16* %arraydecay62), !dbg !1100
  call void @llvm.dbg.declare(metadata i16* %__x63, metadata !1102, metadata !DIExpression()), !dbg !1104
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1104, !srcloc !1105
  store i16 %62, i16* %__x63, align 2, !dbg !1104
  %63 = load i16, i16* %__x63, align 2, !dbg !1104
  store i16 %63, i16* %tmp64, align 2, !dbg !1104
  %64 = load i16, i16* %tmp64, align 2, !dbg !1104
  %add65 = add i16 %64, 2, !dbg !1100
  %65 = inttoptr i16 %add65 to i8*, !dbg !1100
  call void @llvm.dbg.declare(metadata i16* %__x66, metadata !1106, metadata !DIExpression()), !dbg !1108
  %66 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1108, !srcloc !1109
  store i16 %66, i16* %__x66, align 2, !dbg !1108
  %67 = load i16, i16* %__x66, align 2, !dbg !1108
  store i16 %67, i16* %tmp67, align 2, !dbg !1108
  %68 = load i16, i16* %tmp67, align 2, !dbg !1108
  %add68 = add i16 %68, 2, !dbg !1100
  %sub69 = sub i16 9216, %add68, !dbg !1100
  %call70 = call zeroext i16 @__fast_hw_crc(i8* %65, i16 zeroext %sub69, i16 zeroext -1), !dbg !1100
  store i16 %call70, i16* @tmp_stack_crc, align 2, !dbg !1100
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1100
  %70 = bitcast %struct.camel_buffer_t* %69 to i8*, !dbg !1100
  %71 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1100
  %call71 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext 344, i16 zeroext %71), !dbg !1100
  store i16 %call71, i16* @tmp_stack_buf_crc, align 2, !dbg !1100
  %72 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1100
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1100
  %stack_and_buf_crc72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 2, !dbg !1100
  store i16 %72, i16* %stack_and_buf_crc72, align 2, !dbg !1100
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1100
  br label %if.end86, !dbg !1100

if.else73:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1110
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1110
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1110
  %reg_file74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i32 0, i32 0, !dbg !1110
  %arraydecay75 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file74, i16 0, i16 0, !dbg !1110
  call void @__dump_registers(i16* %arraydecay75), !dbg !1110
  call void @llvm.dbg.declare(metadata i16* %__x76, metadata !1112, metadata !DIExpression()), !dbg !1114
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1114, !srcloc !1115
  store i16 %75, i16* %__x76, align 2, !dbg !1114
  %76 = load i16, i16* %__x76, align 2, !dbg !1114
  store i16 %76, i16* %tmp77, align 2, !dbg !1114
  %77 = load i16, i16* %tmp77, align 2, !dbg !1114
  %add78 = add i16 %77, 2, !dbg !1110
  %78 = inttoptr i16 %add78 to i8*, !dbg !1110
  call void @llvm.dbg.declare(metadata i16* %__x79, metadata !1116, metadata !DIExpression()), !dbg !1118
  %79 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1118, !srcloc !1119
  store i16 %79, i16* %__x79, align 2, !dbg !1118
  %80 = load i16, i16* %__x79, align 2, !dbg !1118
  store i16 %80, i16* %tmp80, align 2, !dbg !1118
  %81 = load i16, i16* %tmp80, align 2, !dbg !1118
  %add81 = add i16 %81, 2, !dbg !1110
  %sub82 = sub i16 9216, %add81, !dbg !1110
  %call83 = call zeroext i16 @__fast_hw_crc(i8* %78, i16 zeroext %sub82, i16 zeroext -1), !dbg !1110
  store i16 %call83, i16* @tmp_stack_crc, align 2, !dbg !1110
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1110
  %83 = bitcast %struct.camel_buffer_t* %82 to i8*, !dbg !1110
  %84 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1110
  %call84 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext 344, i16 zeroext %84), !dbg !1110
  store i16 %call84, i16* @tmp_stack_buf_crc, align 2, !dbg !1110
  %85 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1110
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1110
  %stack_and_buf_crc85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 2, !dbg !1110
  store i16 %85, i16* %stack_and_buf_crc85, align 2, !dbg !1110
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1110
  br label %if.end86

if.end86:                                         ; preds = %if.else73, %if.then60
  br label %do.end87, !dbg !1099

do.end87:                                         ; preds = %if.end86
  call void @task_commit(), !dbg !1120
  br label %if.end88, !dbg !1121

if.end88:                                         ; preds = %do.end87, %if.end53
  call void @task_mult_mod(), !dbg !1122
  br label %do.body89, !dbg !1123

do.body89:                                        ; preds = %if.end88
  %87 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1124
  %cmp90 = icmp eq i16 %87, 1, !dbg !1124
  br i1 %cmp90, label %if.then91, label %if.else104, !dbg !1127

if.then91:                                        ; preds = %do.body89
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1128
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1128
  %88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1128
  %reg_file92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %88, i32 0, i32 0, !dbg !1128
  %arraydecay93 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file92, i16 0, i16 0, !dbg !1128
  call void @__dump_registers(i16* %arraydecay93), !dbg !1128
  call void @llvm.dbg.declare(metadata i16* %__x94, metadata !1130, metadata !DIExpression()), !dbg !1132
  %89 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1132, !srcloc !1133
  store i16 %89, i16* %__x94, align 2, !dbg !1132
  %90 = load i16, i16* %__x94, align 2, !dbg !1132
  store i16 %90, i16* %tmp95, align 2, !dbg !1132
  %91 = load i16, i16* %tmp95, align 2, !dbg !1132
  %add96 = add i16 %91, 2, !dbg !1128
  %92 = inttoptr i16 %add96 to i8*, !dbg !1128
  call void @llvm.dbg.declare(metadata i16* %__x97, metadata !1134, metadata !DIExpression()), !dbg !1136
  %93 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1136, !srcloc !1137
  store i16 %93, i16* %__x97, align 2, !dbg !1136
  %94 = load i16, i16* %__x97, align 2, !dbg !1136
  store i16 %94, i16* %tmp98, align 2, !dbg !1136
  %95 = load i16, i16* %tmp98, align 2, !dbg !1136
  %add99 = add i16 %95, 2, !dbg !1128
  %sub100 = sub i16 9216, %add99, !dbg !1128
  %call101 = call zeroext i16 @__fast_hw_crc(i8* %92, i16 zeroext %sub100, i16 zeroext -1), !dbg !1128
  store i16 %call101, i16* @tmp_stack_crc, align 2, !dbg !1128
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1128
  %97 = bitcast %struct.camel_buffer_t* %96 to i8*, !dbg !1128
  %98 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1128
  %call102 = call zeroext i16 @__fast_hw_crc(i8* %97, i16 zeroext 344, i16 zeroext %98), !dbg !1128
  store i16 %call102, i16* @tmp_stack_buf_crc, align 2, !dbg !1128
  %99 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1128
  %100 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1128
  %stack_and_buf_crc103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %100, i32 0, i32 2, !dbg !1128
  store i16 %99, i16* %stack_and_buf_crc103, align 2, !dbg !1128
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1128
  br label %if.end117, !dbg !1128

if.else104:                                       ; preds = %do.body89
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1138
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1138
  %101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1138
  %reg_file105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %101, i32 0, i32 0, !dbg !1138
  %arraydecay106 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file105, i16 0, i16 0, !dbg !1138
  call void @__dump_registers(i16* %arraydecay106), !dbg !1138
  call void @llvm.dbg.declare(metadata i16* %__x107, metadata !1140, metadata !DIExpression()), !dbg !1142
  %102 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1142, !srcloc !1143
  store i16 %102, i16* %__x107, align 2, !dbg !1142
  %103 = load i16, i16* %__x107, align 2, !dbg !1142
  store i16 %103, i16* %tmp108, align 2, !dbg !1142
  %104 = load i16, i16* %tmp108, align 2, !dbg !1142
  %add109 = add i16 %104, 2, !dbg !1138
  %105 = inttoptr i16 %add109 to i8*, !dbg !1138
  call void @llvm.dbg.declare(metadata i16* %__x110, metadata !1144, metadata !DIExpression()), !dbg !1146
  %106 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1146, !srcloc !1147
  store i16 %106, i16* %__x110, align 2, !dbg !1146
  %107 = load i16, i16* %__x110, align 2, !dbg !1146
  store i16 %107, i16* %tmp111, align 2, !dbg !1146
  %108 = load i16, i16* %tmp111, align 2, !dbg !1146
  %add112 = add i16 %108, 2, !dbg !1138
  %sub113 = sub i16 9216, %add112, !dbg !1138
  %call114 = call zeroext i16 @__fast_hw_crc(i8* %105, i16 zeroext %sub113, i16 zeroext -1), !dbg !1138
  store i16 %call114, i16* @tmp_stack_crc, align 2, !dbg !1138
  %109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1138
  %110 = bitcast %struct.camel_buffer_t* %109 to i8*, !dbg !1138
  %111 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1138
  %call115 = call zeroext i16 @__fast_hw_crc(i8* %110, i16 zeroext 344, i16 zeroext %111), !dbg !1138
  store i16 %call115, i16* @tmp_stack_buf_crc, align 2, !dbg !1138
  %112 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1138
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1138
  %stack_and_buf_crc116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i32 0, i32 2, !dbg !1138
  store i16 %112, i16* %stack_and_buf_crc116, align 2, !dbg !1138
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1138
  br label %if.end117

if.end117:                                        ; preds = %if.else104, %if.then91
  br label %do.end118, !dbg !1127

do.end118:                                        ; preds = %if.end117
  call void @task_commit(), !dbg !1148
  br label %do.body119, !dbg !1149

do.body119:                                       ; preds = %do.cond, %do.end118
  call void @task_mult(), !dbg !1150
  br label %do.body120, !dbg !1152

do.body120:                                       ; preds = %do.body119
  %114 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1153
  %cmp121 = icmp eq i16 %114, 1, !dbg !1153
  br i1 %cmp121, label %if.then122, label %if.else135, !dbg !1156

if.then122:                                       ; preds = %do.body120
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1157
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1157
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1157
  %reg_file123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i32 0, i32 0, !dbg !1157
  %arraydecay124 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file123, i16 0, i16 0, !dbg !1157
  call void @__dump_registers(i16* %arraydecay124), !dbg !1157
  call void @llvm.dbg.declare(metadata i16* %__x125, metadata !1159, metadata !DIExpression()), !dbg !1161
  %116 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1161, !srcloc !1162
  store i16 %116, i16* %__x125, align 2, !dbg !1161
  %117 = load i16, i16* %__x125, align 2, !dbg !1161
  store i16 %117, i16* %tmp126, align 2, !dbg !1161
  %118 = load i16, i16* %tmp126, align 2, !dbg !1161
  %add127 = add i16 %118, 2, !dbg !1157
  %119 = inttoptr i16 %add127 to i8*, !dbg !1157
  call void @llvm.dbg.declare(metadata i16* %__x128, metadata !1163, metadata !DIExpression()), !dbg !1165
  %120 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1165, !srcloc !1166
  store i16 %120, i16* %__x128, align 2, !dbg !1165
  %121 = load i16, i16* %__x128, align 2, !dbg !1165
  store i16 %121, i16* %tmp129, align 2, !dbg !1165
  %122 = load i16, i16* %tmp129, align 2, !dbg !1165
  %add130 = add i16 %122, 2, !dbg !1157
  %sub131 = sub i16 9216, %add130, !dbg !1157
  %call132 = call zeroext i16 @__fast_hw_crc(i8* %119, i16 zeroext %sub131, i16 zeroext -1), !dbg !1157
  store i16 %call132, i16* @tmp_stack_crc, align 2, !dbg !1157
  %123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1157
  %124 = bitcast %struct.camel_buffer_t* %123 to i8*, !dbg !1157
  %125 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1157
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %124, i16 zeroext 344, i16 zeroext %125), !dbg !1157
  store i16 %call133, i16* @tmp_stack_buf_crc, align 2, !dbg !1157
  %126 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1157
  %127 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1157
  %stack_and_buf_crc134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %127, i32 0, i32 2, !dbg !1157
  store i16 %126, i16* %stack_and_buf_crc134, align 2, !dbg !1157
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1157
  br label %if.end148, !dbg !1157

if.else135:                                       ; preds = %do.body120
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1167
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1167
  %128 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1167
  %reg_file136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %128, i32 0, i32 0, !dbg !1167
  %arraydecay137 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file136, i16 0, i16 0, !dbg !1167
  call void @__dump_registers(i16* %arraydecay137), !dbg !1167
  call void @llvm.dbg.declare(metadata i16* %__x138, metadata !1169, metadata !DIExpression()), !dbg !1171
  %129 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1171, !srcloc !1172
  store i16 %129, i16* %__x138, align 2, !dbg !1171
  %130 = load i16, i16* %__x138, align 2, !dbg !1171
  store i16 %130, i16* %tmp139, align 2, !dbg !1171
  %131 = load i16, i16* %tmp139, align 2, !dbg !1171
  %add140 = add i16 %131, 2, !dbg !1167
  %132 = inttoptr i16 %add140 to i8*, !dbg !1167
  call void @llvm.dbg.declare(metadata i16* %__x141, metadata !1173, metadata !DIExpression()), !dbg !1175
  %133 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1175, !srcloc !1176
  store i16 %133, i16* %__x141, align 2, !dbg !1175
  %134 = load i16, i16* %__x141, align 2, !dbg !1175
  store i16 %134, i16* %tmp142, align 2, !dbg !1175
  %135 = load i16, i16* %tmp142, align 2, !dbg !1175
  %add143 = add i16 %135, 2, !dbg !1167
  %sub144 = sub i16 9216, %add143, !dbg !1167
  %call145 = call zeroext i16 @__fast_hw_crc(i8* %132, i16 zeroext %sub144, i16 zeroext -1), !dbg !1167
  store i16 %call145, i16* @tmp_stack_crc, align 2, !dbg !1167
  %136 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1167
  %137 = bitcast %struct.camel_buffer_t* %136 to i8*, !dbg !1167
  %138 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1167
  %call146 = call zeroext i16 @__fast_hw_crc(i8* %137, i16 zeroext 344, i16 zeroext %138), !dbg !1167
  store i16 %call146, i16* @tmp_stack_buf_crc, align 2, !dbg !1167
  %139 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1167
  %140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1167
  %stack_and_buf_crc147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %140, i32 0, i32 2, !dbg !1167
  store i16 %139, i16* %stack_and_buf_crc147, align 2, !dbg !1167
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1167
  br label %if.end148

if.end148:                                        ; preds = %if.else135, %if.then122
  br label %do.end149, !dbg !1156

do.end149:                                        ; preds = %if.end148
  call void @task_commit(), !dbg !1177
  br label %do.cond, !dbg !1178

do.cond:                                          ; preds = %do.end149
  %141 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1179
  %globals150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %141, i32 0, i32 1, !dbg !1179
  %check151 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals150, i32 0, i32 17, !dbg !1179
  %142 = load i16, i16* %check151, align 2, !dbg !1179
  %cmp152 = icmp eq i16 %142, 0, !dbg !1180
  br i1 %cmp152, label %do.body119, label %do.end153, !dbg !1178, !llvm.loop !1181

do.end153:                                        ; preds = %do.cond
  call void @task_reduce_digits(), !dbg !1183
  br label %do.body154, !dbg !1184

do.body154:                                       ; preds = %do.end153
  %143 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1185
  %cmp155 = icmp eq i16 %143, 1, !dbg !1185
  br i1 %cmp155, label %if.then156, label %if.else169, !dbg !1188

if.then156:                                       ; preds = %do.body154
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1189
  %144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  %reg_file157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %144, i32 0, i32 0, !dbg !1189
  %arraydecay158 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file157, i16 0, i16 0, !dbg !1189
  call void @__dump_registers(i16* %arraydecay158), !dbg !1189
  call void @llvm.dbg.declare(metadata i16* %__x159, metadata !1191, metadata !DIExpression()), !dbg !1193
  %145 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1193, !srcloc !1194
  store i16 %145, i16* %__x159, align 2, !dbg !1193
  %146 = load i16, i16* %__x159, align 2, !dbg !1193
  store i16 %146, i16* %tmp160, align 2, !dbg !1193
  %147 = load i16, i16* %tmp160, align 2, !dbg !1193
  %add161 = add i16 %147, 2, !dbg !1189
  %148 = inttoptr i16 %add161 to i8*, !dbg !1189
  call void @llvm.dbg.declare(metadata i16* %__x162, metadata !1195, metadata !DIExpression()), !dbg !1197
  %149 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1197, !srcloc !1198
  store i16 %149, i16* %__x162, align 2, !dbg !1197
  %150 = load i16, i16* %__x162, align 2, !dbg !1197
  store i16 %150, i16* %tmp163, align 2, !dbg !1197
  %151 = load i16, i16* %tmp163, align 2, !dbg !1197
  %add164 = add i16 %151, 2, !dbg !1189
  %sub165 = sub i16 9216, %add164, !dbg !1189
  %call166 = call zeroext i16 @__fast_hw_crc(i8* %148, i16 zeroext %sub165, i16 zeroext -1), !dbg !1189
  store i16 %call166, i16* @tmp_stack_crc, align 2, !dbg !1189
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  %153 = bitcast %struct.camel_buffer_t* %152 to i8*, !dbg !1189
  %154 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1189
  %call167 = call zeroext i16 @__fast_hw_crc(i8* %153, i16 zeroext 344, i16 zeroext %154), !dbg !1189
  store i16 %call167, i16* @tmp_stack_buf_crc, align 2, !dbg !1189
  %155 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1189
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  %stack_and_buf_crc168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 2, !dbg !1189
  store i16 %155, i16* %stack_and_buf_crc168, align 2, !dbg !1189
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1189
  br label %if.end182, !dbg !1189

if.else169:                                       ; preds = %do.body154
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1199
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1199
  %157 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1199
  %reg_file170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %157, i32 0, i32 0, !dbg !1199
  %arraydecay171 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file170, i16 0, i16 0, !dbg !1199
  call void @__dump_registers(i16* %arraydecay171), !dbg !1199
  call void @llvm.dbg.declare(metadata i16* %__x172, metadata !1201, metadata !DIExpression()), !dbg !1203
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1203, !srcloc !1204
  store i16 %158, i16* %__x172, align 2, !dbg !1203
  %159 = load i16, i16* %__x172, align 2, !dbg !1203
  store i16 %159, i16* %tmp173, align 2, !dbg !1203
  %160 = load i16, i16* %tmp173, align 2, !dbg !1203
  %add174 = add i16 %160, 2, !dbg !1199
  %161 = inttoptr i16 %add174 to i8*, !dbg !1199
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !1205, metadata !DIExpression()), !dbg !1207
  %162 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1207, !srcloc !1208
  store i16 %162, i16* %__x175, align 2, !dbg !1207
  %163 = load i16, i16* %__x175, align 2, !dbg !1207
  store i16 %163, i16* %tmp176, align 2, !dbg !1207
  %164 = load i16, i16* %tmp176, align 2, !dbg !1207
  %add177 = add i16 %164, 2, !dbg !1199
  %sub178 = sub i16 9216, %add177, !dbg !1199
  %call179 = call zeroext i16 @__fast_hw_crc(i8* %161, i16 zeroext %sub178, i16 zeroext -1), !dbg !1199
  store i16 %call179, i16* @tmp_stack_crc, align 2, !dbg !1199
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1199
  %166 = bitcast %struct.camel_buffer_t* %165 to i8*, !dbg !1199
  %167 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1199
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext 344, i16 zeroext %167), !dbg !1199
  store i16 %call180, i16* @tmp_stack_buf_crc, align 2, !dbg !1199
  %168 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1199
  %169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1199
  %stack_and_buf_crc181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %169, i32 0, i32 2, !dbg !1199
  store i16 %168, i16* %stack_and_buf_crc181, align 2, !dbg !1199
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1199
  br label %if.end182

if.end182:                                        ; preds = %if.else169, %if.then156
  br label %do.end184, !dbg !1188

do.end184:                                        ; preds = %if.end182
  call void @task_commit(), !dbg !1209
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1210
  %globals185 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !1210
  %check186 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals185, i32 0, i32 17, !dbg !1210
  %171 = load i16, i16* %check186, align 2, !dbg !1210
  %cmp187 = icmp eq i16 %171, 0, !dbg !1212
  br i1 %cmp187, label %if.then188, label %if.end189, !dbg !1213

if.then188:                                       ; preds = %do.end184
  br label %while.end, !dbg !1214

if.end189:                                        ; preds = %do.end184
  call void @task_reduce_normalizable(), !dbg !1216
  br label %do.body190, !dbg !1217

do.body190:                                       ; preds = %if.end189
  %172 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1218
  %cmp191 = icmp eq i16 %172, 1, !dbg !1218
  br i1 %cmp191, label %if.then192, label %if.else205, !dbg !1221

if.then192:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1222
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %reg_file193 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 0, !dbg !1222
  %arraydecay194 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file193, i16 0, i16 0, !dbg !1222
  call void @__dump_registers(i16* %arraydecay194), !dbg !1222
  call void @llvm.dbg.declare(metadata i16* %__x195, metadata !1224, metadata !DIExpression()), !dbg !1226
  %174 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1226, !srcloc !1227
  store i16 %174, i16* %__x195, align 2, !dbg !1226
  %175 = load i16, i16* %__x195, align 2, !dbg !1226
  store i16 %175, i16* %tmp196, align 2, !dbg !1226
  %176 = load i16, i16* %tmp196, align 2, !dbg !1226
  %add197 = add i16 %176, 2, !dbg !1222
  %177 = inttoptr i16 %add197 to i8*, !dbg !1222
  call void @llvm.dbg.declare(metadata i16* %__x198, metadata !1228, metadata !DIExpression()), !dbg !1230
  %178 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1230, !srcloc !1231
  store i16 %178, i16* %__x198, align 2, !dbg !1230
  %179 = load i16, i16* %__x198, align 2, !dbg !1230
  store i16 %179, i16* %tmp199, align 2, !dbg !1230
  %180 = load i16, i16* %tmp199, align 2, !dbg !1230
  %add200 = add i16 %180, 2, !dbg !1222
  %sub201 = sub i16 9216, %add200, !dbg !1222
  %call202 = call zeroext i16 @__fast_hw_crc(i8* %177, i16 zeroext %sub201, i16 zeroext -1), !dbg !1222
  store i16 %call202, i16* @tmp_stack_crc, align 2, !dbg !1222
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %182 = bitcast %struct.camel_buffer_t* %181 to i8*, !dbg !1222
  %183 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1222
  %call203 = call zeroext i16 @__fast_hw_crc(i8* %182, i16 zeroext 344, i16 zeroext %183), !dbg !1222
  store i16 %call203, i16* @tmp_stack_buf_crc, align 2, !dbg !1222
  %184 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1222
  %185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1222
  %stack_and_buf_crc204 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %185, i32 0, i32 2, !dbg !1222
  store i16 %184, i16* %stack_and_buf_crc204, align 2, !dbg !1222
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1222
  br label %if.end218, !dbg !1222

if.else205:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1232
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %reg_file206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 0, !dbg !1232
  %arraydecay207 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file206, i16 0, i16 0, !dbg !1232
  call void @__dump_registers(i16* %arraydecay207), !dbg !1232
  call void @llvm.dbg.declare(metadata i16* %__x208, metadata !1234, metadata !DIExpression()), !dbg !1236
  %187 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1236, !srcloc !1237
  store i16 %187, i16* %__x208, align 2, !dbg !1236
  %188 = load i16, i16* %__x208, align 2, !dbg !1236
  store i16 %188, i16* %tmp209, align 2, !dbg !1236
  %189 = load i16, i16* %tmp209, align 2, !dbg !1236
  %add210 = add i16 %189, 2, !dbg !1232
  %190 = inttoptr i16 %add210 to i8*, !dbg !1232
  call void @llvm.dbg.declare(metadata i16* %__x211, metadata !1238, metadata !DIExpression()), !dbg !1240
  %191 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1240, !srcloc !1241
  store i16 %191, i16* %__x211, align 2, !dbg !1240
  %192 = load i16, i16* %__x211, align 2, !dbg !1240
  store i16 %192, i16* %tmp212, align 2, !dbg !1240
  %193 = load i16, i16* %tmp212, align 2, !dbg !1240
  %add213 = add i16 %193, 2, !dbg !1232
  %sub214 = sub i16 9216, %add213, !dbg !1232
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %190, i16 zeroext %sub214, i16 zeroext -1), !dbg !1232
  store i16 %call215, i16* @tmp_stack_crc, align 2, !dbg !1232
  %194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %195 = bitcast %struct.camel_buffer_t* %194 to i8*, !dbg !1232
  %196 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1232
  %call216 = call zeroext i16 @__fast_hw_crc(i8* %195, i16 zeroext 344, i16 zeroext %196), !dbg !1232
  store i16 %call216, i16* @tmp_stack_buf_crc, align 2, !dbg !1232
  %197 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1232
  %198 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1232
  %stack_and_buf_crc217 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %198, i32 0, i32 2, !dbg !1232
  store i16 %197, i16* %stack_and_buf_crc217, align 2, !dbg !1232
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1232
  br label %if.end218

if.end218:                                        ; preds = %if.else205, %if.then192
  br label %do.end220, !dbg !1221

do.end220:                                        ; preds = %if.end218
  call void @task_commit(), !dbg !1242
  %199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1243
  %globals221 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %199, i32 0, i32 1, !dbg !1243
  %check222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals221, i32 0, i32 17, !dbg !1243
  %200 = load i16, i16* %check222, align 2, !dbg !1243
  %cmp223 = icmp eq i16 %200, 0, !dbg !1245
  br i1 %cmp223, label %if.then224, label %if.else291, !dbg !1246

if.then224:                                       ; preds = %do.end220
  call void @task_reduce_normalize(), !dbg !1247
  br label %do.body225, !dbg !1249

do.body225:                                       ; preds = %if.then224
  %201 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1250
  %cmp226 = icmp eq i16 %201, 1, !dbg !1250
  br i1 %cmp226, label %if.then227, label %if.else240, !dbg !1253

if.then227:                                       ; preds = %do.body225
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1254
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %reg_file228 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 0, !dbg !1254
  %arraydecay229 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file228, i16 0, i16 0, !dbg !1254
  call void @__dump_registers(i16* %arraydecay229), !dbg !1254
  call void @llvm.dbg.declare(metadata i16* %__x230, metadata !1256, metadata !DIExpression()), !dbg !1258
  %203 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1258, !srcloc !1259
  store i16 %203, i16* %__x230, align 2, !dbg !1258
  %204 = load i16, i16* %__x230, align 2, !dbg !1258
  store i16 %204, i16* %tmp231, align 2, !dbg !1258
  %205 = load i16, i16* %tmp231, align 2, !dbg !1258
  %add232 = add i16 %205, 2, !dbg !1254
  %206 = inttoptr i16 %add232 to i8*, !dbg !1254
  call void @llvm.dbg.declare(metadata i16* %__x233, metadata !1260, metadata !DIExpression()), !dbg !1262
  %207 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1262, !srcloc !1263
  store i16 %207, i16* %__x233, align 2, !dbg !1262
  %208 = load i16, i16* %__x233, align 2, !dbg !1262
  store i16 %208, i16* %tmp234, align 2, !dbg !1262
  %209 = load i16, i16* %tmp234, align 2, !dbg !1262
  %add235 = add i16 %209, 2, !dbg !1254
  %sub236 = sub i16 9216, %add235, !dbg !1254
  %call237 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext %sub236, i16 zeroext -1), !dbg !1254
  store i16 %call237, i16* @tmp_stack_crc, align 2, !dbg !1254
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %211 = bitcast %struct.camel_buffer_t* %210 to i8*, !dbg !1254
  %212 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1254
  %call238 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext 344, i16 zeroext %212), !dbg !1254
  store i16 %call238, i16* @tmp_stack_buf_crc, align 2, !dbg !1254
  %213 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1254
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1254
  %stack_and_buf_crc239 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 2, !dbg !1254
  store i16 %213, i16* %stack_and_buf_crc239, align 2, !dbg !1254
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1254
  br label %if.end253, !dbg !1254

if.else240:                                       ; preds = %do.body225
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1264
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %reg_file241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %215, i32 0, i32 0, !dbg !1264
  %arraydecay242 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file241, i16 0, i16 0, !dbg !1264
  call void @__dump_registers(i16* %arraydecay242), !dbg !1264
  call void @llvm.dbg.declare(metadata i16* %__x243, metadata !1266, metadata !DIExpression()), !dbg !1268
  %216 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1268, !srcloc !1269
  store i16 %216, i16* %__x243, align 2, !dbg !1268
  %217 = load i16, i16* %__x243, align 2, !dbg !1268
  store i16 %217, i16* %tmp244, align 2, !dbg !1268
  %218 = load i16, i16* %tmp244, align 2, !dbg !1268
  %add245 = add i16 %218, 2, !dbg !1264
  %219 = inttoptr i16 %add245 to i8*, !dbg !1264
  call void @llvm.dbg.declare(metadata i16* %__x246, metadata !1270, metadata !DIExpression()), !dbg !1272
  %220 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1272, !srcloc !1273
  store i16 %220, i16* %__x246, align 2, !dbg !1272
  %221 = load i16, i16* %__x246, align 2, !dbg !1272
  store i16 %221, i16* %tmp247, align 2, !dbg !1272
  %222 = load i16, i16* %tmp247, align 2, !dbg !1272
  %add248 = add i16 %222, 2, !dbg !1264
  %sub249 = sub i16 9216, %add248, !dbg !1264
  %call250 = call zeroext i16 @__fast_hw_crc(i8* %219, i16 zeroext %sub249, i16 zeroext -1), !dbg !1264
  store i16 %call250, i16* @tmp_stack_crc, align 2, !dbg !1264
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %224 = bitcast %struct.camel_buffer_t* %223 to i8*, !dbg !1264
  %225 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1264
  %call251 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext 344, i16 zeroext %225), !dbg !1264
  store i16 %call251, i16* @tmp_stack_buf_crc, align 2, !dbg !1264
  %226 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1264
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1264
  %stack_and_buf_crc252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 2, !dbg !1264
  store i16 %226, i16* %stack_and_buf_crc252, align 2, !dbg !1264
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1264
  br label %if.end253

if.end253:                                        ; preds = %if.else240, %if.then227
  br label %do.end255, !dbg !1253

do.end255:                                        ; preds = %if.end253
  call void @task_commit(), !dbg !1274
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1275
  %globals256 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 1, !dbg !1275
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals256, i32 0, i32 12, !dbg !1275
  %229 = load i16, i16* %offset, align 2, !dbg !1275
  %cmp257 = icmp ugt i16 %229, 0, !dbg !1277
  br i1 %cmp257, label %if.then258, label %if.end290, !dbg !1278

if.then258:                                       ; preds = %do.end255
  call void @task_reduce_n_divisor(), !dbg !1279
  br label %do.body259, !dbg !1281

do.body259:                                       ; preds = %if.then258
  %230 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1282
  %cmp260 = icmp eq i16 %230, 1, !dbg !1282
  br i1 %cmp260, label %if.then261, label %if.else274, !dbg !1285

if.then261:                                       ; preds = %do.body259
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1286
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1286
  %231 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1286
  %reg_file262 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %231, i32 0, i32 0, !dbg !1286
  %arraydecay263 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file262, i16 0, i16 0, !dbg !1286
  call void @__dump_registers(i16* %arraydecay263), !dbg !1286
  call void @llvm.dbg.declare(metadata i16* %__x264, metadata !1288, metadata !DIExpression()), !dbg !1290
  %232 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1290, !srcloc !1291
  store i16 %232, i16* %__x264, align 2, !dbg !1290
  %233 = load i16, i16* %__x264, align 2, !dbg !1290
  store i16 %233, i16* %tmp265, align 2, !dbg !1290
  %234 = load i16, i16* %tmp265, align 2, !dbg !1290
  %add266 = add i16 %234, 2, !dbg !1286
  %235 = inttoptr i16 %add266 to i8*, !dbg !1286
  call void @llvm.dbg.declare(metadata i16* %__x267, metadata !1292, metadata !DIExpression()), !dbg !1294
  %236 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1294, !srcloc !1295
  store i16 %236, i16* %__x267, align 2, !dbg !1294
  %237 = load i16, i16* %__x267, align 2, !dbg !1294
  store i16 %237, i16* %tmp268, align 2, !dbg !1294
  %238 = load i16, i16* %tmp268, align 2, !dbg !1294
  %add269 = add i16 %238, 2, !dbg !1286
  %sub270 = sub i16 9216, %add269, !dbg !1286
  %call271 = call zeroext i16 @__fast_hw_crc(i8* %235, i16 zeroext %sub270, i16 zeroext -1), !dbg !1286
  store i16 %call271, i16* @tmp_stack_crc, align 2, !dbg !1286
  %239 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1286
  %240 = bitcast %struct.camel_buffer_t* %239 to i8*, !dbg !1286
  %241 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1286
  %call272 = call zeroext i16 @__fast_hw_crc(i8* %240, i16 zeroext 344, i16 zeroext %241), !dbg !1286
  store i16 %call272, i16* @tmp_stack_buf_crc, align 2, !dbg !1286
  %242 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1286
  %243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1286
  %stack_and_buf_crc273 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %243, i32 0, i32 2, !dbg !1286
  store i16 %242, i16* %stack_and_buf_crc273, align 2, !dbg !1286
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1286
  br label %if.end287, !dbg !1286

if.else274:                                       ; preds = %do.body259
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1296
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1296
  %244 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1296
  %reg_file275 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %244, i32 0, i32 0, !dbg !1296
  %arraydecay276 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file275, i16 0, i16 0, !dbg !1296
  call void @__dump_registers(i16* %arraydecay276), !dbg !1296
  call void @llvm.dbg.declare(metadata i16* %__x277, metadata !1298, metadata !DIExpression()), !dbg !1300
  %245 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1300, !srcloc !1301
  store i16 %245, i16* %__x277, align 2, !dbg !1300
  %246 = load i16, i16* %__x277, align 2, !dbg !1300
  store i16 %246, i16* %tmp278, align 2, !dbg !1300
  %247 = load i16, i16* %tmp278, align 2, !dbg !1300
  %add279 = add i16 %247, 2, !dbg !1296
  %248 = inttoptr i16 %add279 to i8*, !dbg !1296
  call void @llvm.dbg.declare(metadata i16* %__x280, metadata !1302, metadata !DIExpression()), !dbg !1304
  %249 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1304, !srcloc !1305
  store i16 %249, i16* %__x280, align 2, !dbg !1304
  %250 = load i16, i16* %__x280, align 2, !dbg !1304
  store i16 %250, i16* %tmp281, align 2, !dbg !1304
  %251 = load i16, i16* %tmp281, align 2, !dbg !1304
  %add282 = add i16 %251, 2, !dbg !1296
  %sub283 = sub i16 9216, %add282, !dbg !1296
  %call284 = call zeroext i16 @__fast_hw_crc(i8* %248, i16 zeroext %sub283, i16 zeroext -1), !dbg !1296
  store i16 %call284, i16* @tmp_stack_crc, align 2, !dbg !1296
  %252 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1296
  %253 = bitcast %struct.camel_buffer_t* %252 to i8*, !dbg !1296
  %254 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1296
  %call285 = call zeroext i16 @__fast_hw_crc(i8* %253, i16 zeroext 344, i16 zeroext %254), !dbg !1296
  store i16 %call285, i16* @tmp_stack_buf_crc, align 2, !dbg !1296
  %255 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1296
  %256 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1296
  %stack_and_buf_crc286 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %256, i32 0, i32 2, !dbg !1296
  store i16 %255, i16* %stack_and_buf_crc286, align 2, !dbg !1296
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1296
  br label %if.end287

if.end287:                                        ; preds = %if.else274, %if.then261
  br label %do.end289, !dbg !1285

do.end289:                                        ; preds = %if.end287
  call void @task_commit(), !dbg !1306
  br label %if.end290, !dbg !1307

if.end290:                                        ; preds = %do.end289, %do.end255
  br label %if.end328, !dbg !1308

if.else291:                                       ; preds = %do.end220
  %257 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1309
  %globals292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %257, i32 0, i32 1, !dbg !1309
  %check293 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals292, i32 0, i32 17, !dbg !1309
  %258 = load i16, i16* %check293, align 2, !dbg !1309
  %cmp294 = icmp eq i16 %258, 1, !dbg !1311
  br i1 %cmp294, label %if.then295, label %if.end327, !dbg !1312

if.then295:                                       ; preds = %if.else291
  call void @task_reduce_n_divisor(), !dbg !1313
  br label %do.body296, !dbg !1315

do.body296:                                       ; preds = %if.then295
  %259 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1316
  %cmp297 = icmp eq i16 %259, 1, !dbg !1316
  br i1 %cmp297, label %if.then298, label %if.else311, !dbg !1319

if.then298:                                       ; preds = %do.body296
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1320
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1320
  %260 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1320
  %reg_file299 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %260, i32 0, i32 0, !dbg !1320
  %arraydecay300 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file299, i16 0, i16 0, !dbg !1320
  call void @__dump_registers(i16* %arraydecay300), !dbg !1320
  call void @llvm.dbg.declare(metadata i16* %__x301, metadata !1322, metadata !DIExpression()), !dbg !1324
  %261 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1324, !srcloc !1325
  store i16 %261, i16* %__x301, align 2, !dbg !1324
  %262 = load i16, i16* %__x301, align 2, !dbg !1324
  store i16 %262, i16* %tmp302, align 2, !dbg !1324
  %263 = load i16, i16* %tmp302, align 2, !dbg !1324
  %add303 = add i16 %263, 2, !dbg !1320
  %264 = inttoptr i16 %add303 to i8*, !dbg !1320
  call void @llvm.dbg.declare(metadata i16* %__x304, metadata !1326, metadata !DIExpression()), !dbg !1328
  %265 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1328, !srcloc !1329
  store i16 %265, i16* %__x304, align 2, !dbg !1328
  %266 = load i16, i16* %__x304, align 2, !dbg !1328
  store i16 %266, i16* %tmp305, align 2, !dbg !1328
  %267 = load i16, i16* %tmp305, align 2, !dbg !1328
  %add306 = add i16 %267, 2, !dbg !1320
  %sub307 = sub i16 9216, %add306, !dbg !1320
  %call308 = call zeroext i16 @__fast_hw_crc(i8* %264, i16 zeroext %sub307, i16 zeroext -1), !dbg !1320
  store i16 %call308, i16* @tmp_stack_crc, align 2, !dbg !1320
  %268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1320
  %269 = bitcast %struct.camel_buffer_t* %268 to i8*, !dbg !1320
  %270 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1320
  %call309 = call zeroext i16 @__fast_hw_crc(i8* %269, i16 zeroext 344, i16 zeroext %270), !dbg !1320
  store i16 %call309, i16* @tmp_stack_buf_crc, align 2, !dbg !1320
  %271 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1320
  %272 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1320
  %stack_and_buf_crc310 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %272, i32 0, i32 2, !dbg !1320
  store i16 %271, i16* %stack_and_buf_crc310, align 2, !dbg !1320
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1320
  br label %if.end324, !dbg !1320

if.else311:                                       ; preds = %do.body296
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1330
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1330
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1330
  %reg_file312 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 0, !dbg !1330
  %arraydecay313 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file312, i16 0, i16 0, !dbg !1330
  call void @__dump_registers(i16* %arraydecay313), !dbg !1330
  call void @llvm.dbg.declare(metadata i16* %__x314, metadata !1332, metadata !DIExpression()), !dbg !1334
  %274 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1334, !srcloc !1335
  store i16 %274, i16* %__x314, align 2, !dbg !1334
  %275 = load i16, i16* %__x314, align 2, !dbg !1334
  store i16 %275, i16* %tmp315, align 2, !dbg !1334
  %276 = load i16, i16* %tmp315, align 2, !dbg !1334
  %add316 = add i16 %276, 2, !dbg !1330
  %277 = inttoptr i16 %add316 to i8*, !dbg !1330
  call void @llvm.dbg.declare(metadata i16* %__x317, metadata !1336, metadata !DIExpression()), !dbg !1338
  %278 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1338, !srcloc !1339
  store i16 %278, i16* %__x317, align 2, !dbg !1338
  %279 = load i16, i16* %__x317, align 2, !dbg !1338
  store i16 %279, i16* %tmp318, align 2, !dbg !1338
  %280 = load i16, i16* %tmp318, align 2, !dbg !1338
  %add319 = add i16 %280, 2, !dbg !1330
  %sub320 = sub i16 9216, %add319, !dbg !1330
  %call321 = call zeroext i16 @__fast_hw_crc(i8* %277, i16 zeroext %sub320, i16 zeroext -1), !dbg !1330
  store i16 %call321, i16* @tmp_stack_crc, align 2, !dbg !1330
  %281 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1330
  %282 = bitcast %struct.camel_buffer_t* %281 to i8*, !dbg !1330
  %283 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1330
  %call322 = call zeroext i16 @__fast_hw_crc(i8* %282, i16 zeroext 344, i16 zeroext %283), !dbg !1330
  store i16 %call322, i16* @tmp_stack_buf_crc, align 2, !dbg !1330
  %284 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1330
  %285 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1330
  %stack_and_buf_crc323 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %285, i32 0, i32 2, !dbg !1330
  store i16 %284, i16* %stack_and_buf_crc323, align 2, !dbg !1330
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1330
  br label %if.end324

if.end324:                                        ; preds = %if.else311, %if.then298
  br label %do.end326, !dbg !1319

do.end326:                                        ; preds = %if.end324
  call void @task_commit(), !dbg !1340
  br label %if.end327, !dbg !1341

if.end327:                                        ; preds = %do.end326, %if.else291
  br label %if.end328

if.end328:                                        ; preds = %if.end327, %if.end290
  %286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1342
  %globals329 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %286, i32 0, i32 1, !dbg !1342
  %check330 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals329, i32 0, i32 17, !dbg !1342
  %287 = load i16, i16* %check330, align 2, !dbg !1342
  %cmp331 = icmp ne i16 %287, 2, !dbg !1344
  br i1 %cmp331, label %if.then332, label %if.end499, !dbg !1345

if.then332:                                       ; preds = %if.end328
  br label %do.body333, !dbg !1346

do.body333:                                       ; preds = %do.cond494, %if.then332
  call void @task_reduce_quotient(), !dbg !1348
  br label %do.body334, !dbg !1350

do.body334:                                       ; preds = %do.body333
  %288 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1351
  %cmp335 = icmp eq i16 %288, 1, !dbg !1351
  br i1 %cmp335, label %if.then336, label %if.else349, !dbg !1354

if.then336:                                       ; preds = %do.body334
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1355
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1355
  %289 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1355
  %reg_file337 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %289, i32 0, i32 0, !dbg !1355
  %arraydecay338 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file337, i16 0, i16 0, !dbg !1355
  call void @__dump_registers(i16* %arraydecay338), !dbg !1355
  call void @llvm.dbg.declare(metadata i16* %__x339, metadata !1357, metadata !DIExpression()), !dbg !1359
  %290 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1359, !srcloc !1360
  store i16 %290, i16* %__x339, align 2, !dbg !1359
  %291 = load i16, i16* %__x339, align 2, !dbg !1359
  store i16 %291, i16* %tmp340, align 2, !dbg !1359
  %292 = load i16, i16* %tmp340, align 2, !dbg !1359
  %add341 = add i16 %292, 2, !dbg !1355
  %293 = inttoptr i16 %add341 to i8*, !dbg !1355
  call void @llvm.dbg.declare(metadata i16* %__x342, metadata !1361, metadata !DIExpression()), !dbg !1363
  %294 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1363, !srcloc !1364
  store i16 %294, i16* %__x342, align 2, !dbg !1363
  %295 = load i16, i16* %__x342, align 2, !dbg !1363
  store i16 %295, i16* %tmp343, align 2, !dbg !1363
  %296 = load i16, i16* %tmp343, align 2, !dbg !1363
  %add344 = add i16 %296, 2, !dbg !1355
  %sub345 = sub i16 9216, %add344, !dbg !1355
  %call346 = call zeroext i16 @__fast_hw_crc(i8* %293, i16 zeroext %sub345, i16 zeroext -1), !dbg !1355
  store i16 %call346, i16* @tmp_stack_crc, align 2, !dbg !1355
  %297 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1355
  %298 = bitcast %struct.camel_buffer_t* %297 to i8*, !dbg !1355
  %299 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1355
  %call347 = call zeroext i16 @__fast_hw_crc(i8* %298, i16 zeroext 344, i16 zeroext %299), !dbg !1355
  store i16 %call347, i16* @tmp_stack_buf_crc, align 2, !dbg !1355
  %300 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1355
  %301 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1355
  %stack_and_buf_crc348 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %301, i32 0, i32 2, !dbg !1355
  store i16 %300, i16* %stack_and_buf_crc348, align 2, !dbg !1355
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1355
  br label %if.end362, !dbg !1355

if.else349:                                       ; preds = %do.body334
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1365
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1365
  %302 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1365
  %reg_file350 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %302, i32 0, i32 0, !dbg !1365
  %arraydecay351 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file350, i16 0, i16 0, !dbg !1365
  call void @__dump_registers(i16* %arraydecay351), !dbg !1365
  call void @llvm.dbg.declare(metadata i16* %__x352, metadata !1367, metadata !DIExpression()), !dbg !1369
  %303 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1369, !srcloc !1370
  store i16 %303, i16* %__x352, align 2, !dbg !1369
  %304 = load i16, i16* %__x352, align 2, !dbg !1369
  store i16 %304, i16* %tmp353, align 2, !dbg !1369
  %305 = load i16, i16* %tmp353, align 2, !dbg !1369
  %add354 = add i16 %305, 2, !dbg !1365
  %306 = inttoptr i16 %add354 to i8*, !dbg !1365
  call void @llvm.dbg.declare(metadata i16* %__x355, metadata !1371, metadata !DIExpression()), !dbg !1373
  %307 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1373, !srcloc !1374
  store i16 %307, i16* %__x355, align 2, !dbg !1373
  %308 = load i16, i16* %__x355, align 2, !dbg !1373
  store i16 %308, i16* %tmp356, align 2, !dbg !1373
  %309 = load i16, i16* %tmp356, align 2, !dbg !1373
  %add357 = add i16 %309, 2, !dbg !1365
  %sub358 = sub i16 9216, %add357, !dbg !1365
  %call359 = call zeroext i16 @__fast_hw_crc(i8* %306, i16 zeroext %sub358, i16 zeroext -1), !dbg !1365
  store i16 %call359, i16* @tmp_stack_crc, align 2, !dbg !1365
  %310 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1365
  %311 = bitcast %struct.camel_buffer_t* %310 to i8*, !dbg !1365
  %312 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1365
  %call360 = call zeroext i16 @__fast_hw_crc(i8* %311, i16 zeroext 344, i16 zeroext %312), !dbg !1365
  store i16 %call360, i16* @tmp_stack_buf_crc, align 2, !dbg !1365
  %313 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1365
  %314 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1365
  %stack_and_buf_crc361 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %314, i32 0, i32 2, !dbg !1365
  store i16 %313, i16* %stack_and_buf_crc361, align 2, !dbg !1365
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1365
  br label %if.end362

if.end362:                                        ; preds = %if.else349, %if.then336
  br label %do.end364, !dbg !1354

do.end364:                                        ; preds = %if.end362
  call void @task_commit(), !dbg !1375
  call void @task_reduce_multiply(), !dbg !1376
  br label %do.body365, !dbg !1377

do.body365:                                       ; preds = %do.end364
  %315 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1378
  %cmp366 = icmp eq i16 %315, 1, !dbg !1378
  br i1 %cmp366, label %if.then367, label %if.else380, !dbg !1381

if.then367:                                       ; preds = %do.body365
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1382
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1382
  %316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1382
  %reg_file368 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %316, i32 0, i32 0, !dbg !1382
  %arraydecay369 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file368, i16 0, i16 0, !dbg !1382
  call void @__dump_registers(i16* %arraydecay369), !dbg !1382
  call void @llvm.dbg.declare(metadata i16* %__x370, metadata !1384, metadata !DIExpression()), !dbg !1386
  %317 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1386, !srcloc !1387
  store i16 %317, i16* %__x370, align 2, !dbg !1386
  %318 = load i16, i16* %__x370, align 2, !dbg !1386
  store i16 %318, i16* %tmp371, align 2, !dbg !1386
  %319 = load i16, i16* %tmp371, align 2, !dbg !1386
  %add372 = add i16 %319, 2, !dbg !1382
  %320 = inttoptr i16 %add372 to i8*, !dbg !1382
  call void @llvm.dbg.declare(metadata i16* %__x373, metadata !1388, metadata !DIExpression()), !dbg !1390
  %321 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1390, !srcloc !1391
  store i16 %321, i16* %__x373, align 2, !dbg !1390
  %322 = load i16, i16* %__x373, align 2, !dbg !1390
  store i16 %322, i16* %tmp374, align 2, !dbg !1390
  %323 = load i16, i16* %tmp374, align 2, !dbg !1390
  %add375 = add i16 %323, 2, !dbg !1382
  %sub376 = sub i16 9216, %add375, !dbg !1382
  %call377 = call zeroext i16 @__fast_hw_crc(i8* %320, i16 zeroext %sub376, i16 zeroext -1), !dbg !1382
  store i16 %call377, i16* @tmp_stack_crc, align 2, !dbg !1382
  %324 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1382
  %325 = bitcast %struct.camel_buffer_t* %324 to i8*, !dbg !1382
  %326 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1382
  %call378 = call zeroext i16 @__fast_hw_crc(i8* %325, i16 zeroext 344, i16 zeroext %326), !dbg !1382
  store i16 %call378, i16* @tmp_stack_buf_crc, align 2, !dbg !1382
  %327 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1382
  %328 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1382
  %stack_and_buf_crc379 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %328, i32 0, i32 2, !dbg !1382
  store i16 %327, i16* %stack_and_buf_crc379, align 2, !dbg !1382
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1382
  br label %if.end393, !dbg !1382

if.else380:                                       ; preds = %do.body365
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1392
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1392
  %329 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1392
  %reg_file381 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %329, i32 0, i32 0, !dbg !1392
  %arraydecay382 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file381, i16 0, i16 0, !dbg !1392
  call void @__dump_registers(i16* %arraydecay382), !dbg !1392
  call void @llvm.dbg.declare(metadata i16* %__x383, metadata !1394, metadata !DIExpression()), !dbg !1396
  %330 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1396, !srcloc !1397
  store i16 %330, i16* %__x383, align 2, !dbg !1396
  %331 = load i16, i16* %__x383, align 2, !dbg !1396
  store i16 %331, i16* %tmp384, align 2, !dbg !1396
  %332 = load i16, i16* %tmp384, align 2, !dbg !1396
  %add385 = add i16 %332, 2, !dbg !1392
  %333 = inttoptr i16 %add385 to i8*, !dbg !1392
  call void @llvm.dbg.declare(metadata i16* %__x386, metadata !1398, metadata !DIExpression()), !dbg !1400
  %334 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1400, !srcloc !1401
  store i16 %334, i16* %__x386, align 2, !dbg !1400
  %335 = load i16, i16* %__x386, align 2, !dbg !1400
  store i16 %335, i16* %tmp387, align 2, !dbg !1400
  %336 = load i16, i16* %tmp387, align 2, !dbg !1400
  %add388 = add i16 %336, 2, !dbg !1392
  %sub389 = sub i16 9216, %add388, !dbg !1392
  %call390 = call zeroext i16 @__fast_hw_crc(i8* %333, i16 zeroext %sub389, i16 zeroext -1), !dbg !1392
  store i16 %call390, i16* @tmp_stack_crc, align 2, !dbg !1392
  %337 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1392
  %338 = bitcast %struct.camel_buffer_t* %337 to i8*, !dbg !1392
  %339 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1392
  %call391 = call zeroext i16 @__fast_hw_crc(i8* %338, i16 zeroext 344, i16 zeroext %339), !dbg !1392
  store i16 %call391, i16* @tmp_stack_buf_crc, align 2, !dbg !1392
  %340 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1392
  %341 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1392
  %stack_and_buf_crc392 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %341, i32 0, i32 2, !dbg !1392
  store i16 %340, i16* %stack_and_buf_crc392, align 2, !dbg !1392
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1392
  br label %if.end393

if.end393:                                        ; preds = %if.else380, %if.then367
  br label %do.end395, !dbg !1381

do.end395:                                        ; preds = %if.end393
  call void @task_commit(), !dbg !1402
  call void @task_reduce_compare(), !dbg !1403
  br label %do.body396, !dbg !1404

do.body396:                                       ; preds = %do.end395
  %342 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1405
  %cmp397 = icmp eq i16 %342, 1, !dbg !1405
  br i1 %cmp397, label %if.then398, label %if.else411, !dbg !1408

if.then398:                                       ; preds = %do.body396
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1409
  %343 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1409
  %reg_file399 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %343, i32 0, i32 0, !dbg !1409
  %arraydecay400 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file399, i16 0, i16 0, !dbg !1409
  call void @__dump_registers(i16* %arraydecay400), !dbg !1409
  call void @llvm.dbg.declare(metadata i16* %__x401, metadata !1411, metadata !DIExpression()), !dbg !1413
  %344 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1413, !srcloc !1414
  store i16 %344, i16* %__x401, align 2, !dbg !1413
  %345 = load i16, i16* %__x401, align 2, !dbg !1413
  store i16 %345, i16* %tmp402, align 2, !dbg !1413
  %346 = load i16, i16* %tmp402, align 2, !dbg !1413
  %add403 = add i16 %346, 2, !dbg !1409
  %347 = inttoptr i16 %add403 to i8*, !dbg !1409
  call void @llvm.dbg.declare(metadata i16* %__x404, metadata !1415, metadata !DIExpression()), !dbg !1417
  %348 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1417, !srcloc !1418
  store i16 %348, i16* %__x404, align 2, !dbg !1417
  %349 = load i16, i16* %__x404, align 2, !dbg !1417
  store i16 %349, i16* %tmp405, align 2, !dbg !1417
  %350 = load i16, i16* %tmp405, align 2, !dbg !1417
  %add406 = add i16 %350, 2, !dbg !1409
  %sub407 = sub i16 9216, %add406, !dbg !1409
  %call408 = call zeroext i16 @__fast_hw_crc(i8* %347, i16 zeroext %sub407, i16 zeroext -1), !dbg !1409
  store i16 %call408, i16* @tmp_stack_crc, align 2, !dbg !1409
  %351 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1409
  %352 = bitcast %struct.camel_buffer_t* %351 to i8*, !dbg !1409
  %353 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1409
  %call409 = call zeroext i16 @__fast_hw_crc(i8* %352, i16 zeroext 344, i16 zeroext %353), !dbg !1409
  store i16 %call409, i16* @tmp_stack_buf_crc, align 2, !dbg !1409
  %354 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1409
  %355 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1409
  %stack_and_buf_crc410 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %355, i32 0, i32 2, !dbg !1409
  store i16 %354, i16* %stack_and_buf_crc410, align 2, !dbg !1409
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1409
  br label %if.end424, !dbg !1409

if.else411:                                       ; preds = %do.body396
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1419
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1419
  %356 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1419
  %reg_file412 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %356, i32 0, i32 0, !dbg !1419
  %arraydecay413 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file412, i16 0, i16 0, !dbg !1419
  call void @__dump_registers(i16* %arraydecay413), !dbg !1419
  call void @llvm.dbg.declare(metadata i16* %__x414, metadata !1421, metadata !DIExpression()), !dbg !1423
  %357 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1423, !srcloc !1424
  store i16 %357, i16* %__x414, align 2, !dbg !1423
  %358 = load i16, i16* %__x414, align 2, !dbg !1423
  store i16 %358, i16* %tmp415, align 2, !dbg !1423
  %359 = load i16, i16* %tmp415, align 2, !dbg !1423
  %add416 = add i16 %359, 2, !dbg !1419
  %360 = inttoptr i16 %add416 to i8*, !dbg !1419
  call void @llvm.dbg.declare(metadata i16* %__x417, metadata !1425, metadata !DIExpression()), !dbg !1427
  %361 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1427, !srcloc !1428
  store i16 %361, i16* %__x417, align 2, !dbg !1427
  %362 = load i16, i16* %__x417, align 2, !dbg !1427
  store i16 %362, i16* %tmp418, align 2, !dbg !1427
  %363 = load i16, i16* %tmp418, align 2, !dbg !1427
  %add419 = add i16 %363, 2, !dbg !1419
  %sub420 = sub i16 9216, %add419, !dbg !1419
  %call421 = call zeroext i16 @__fast_hw_crc(i8* %360, i16 zeroext %sub420, i16 zeroext -1), !dbg !1419
  store i16 %call421, i16* @tmp_stack_crc, align 2, !dbg !1419
  %364 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1419
  %365 = bitcast %struct.camel_buffer_t* %364 to i8*, !dbg !1419
  %366 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1419
  %call422 = call zeroext i16 @__fast_hw_crc(i8* %365, i16 zeroext 344, i16 zeroext %366), !dbg !1419
  store i16 %call422, i16* @tmp_stack_buf_crc, align 2, !dbg !1419
  %367 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1419
  %368 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1419
  %stack_and_buf_crc423 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %368, i32 0, i32 2, !dbg !1419
  store i16 %367, i16* %stack_and_buf_crc423, align 2, !dbg !1419
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1419
  br label %if.end424

if.end424:                                        ; preds = %if.else411, %if.then398
  br label %do.end426, !dbg !1408

do.end426:                                        ; preds = %if.end424
  call void @task_commit(), !dbg !1429
  %369 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1430
  %globals427 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %369, i32 0, i32 1, !dbg !1430
  %check428 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals427, i32 0, i32 17, !dbg !1430
  %370 = load i16, i16* %check428, align 2, !dbg !1430
  %cmp429 = icmp eq i16 %370, 0, !dbg !1432
  br i1 %cmp429, label %if.then430, label %if.end462, !dbg !1433

if.then430:                                       ; preds = %do.end426
  call void @task_reduce_add(), !dbg !1434
  br label %do.body431, !dbg !1436

do.body431:                                       ; preds = %if.then430
  %371 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1437
  %cmp432 = icmp eq i16 %371, 1, !dbg !1437
  br i1 %cmp432, label %if.then433, label %if.else446, !dbg !1440

if.then433:                                       ; preds = %do.body431
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1441
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1441
  %372 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1441
  %reg_file434 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %372, i32 0, i32 0, !dbg !1441
  %arraydecay435 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file434, i16 0, i16 0, !dbg !1441
  call void @__dump_registers(i16* %arraydecay435), !dbg !1441
  call void @llvm.dbg.declare(metadata i16* %__x436, metadata !1443, metadata !DIExpression()), !dbg !1445
  %373 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1445, !srcloc !1446
  store i16 %373, i16* %__x436, align 2, !dbg !1445
  %374 = load i16, i16* %__x436, align 2, !dbg !1445
  store i16 %374, i16* %tmp437, align 2, !dbg !1445
  %375 = load i16, i16* %tmp437, align 2, !dbg !1445
  %add438 = add i16 %375, 2, !dbg !1441
  %376 = inttoptr i16 %add438 to i8*, !dbg !1441
  call void @llvm.dbg.declare(metadata i16* %__x439, metadata !1447, metadata !DIExpression()), !dbg !1449
  %377 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1449, !srcloc !1450
  store i16 %377, i16* %__x439, align 2, !dbg !1449
  %378 = load i16, i16* %__x439, align 2, !dbg !1449
  store i16 %378, i16* %tmp440, align 2, !dbg !1449
  %379 = load i16, i16* %tmp440, align 2, !dbg !1449
  %add441 = add i16 %379, 2, !dbg !1441
  %sub442 = sub i16 9216, %add441, !dbg !1441
  %call443 = call zeroext i16 @__fast_hw_crc(i8* %376, i16 zeroext %sub442, i16 zeroext -1), !dbg !1441
  store i16 %call443, i16* @tmp_stack_crc, align 2, !dbg !1441
  %380 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1441
  %381 = bitcast %struct.camel_buffer_t* %380 to i8*, !dbg !1441
  %382 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1441
  %call444 = call zeroext i16 @__fast_hw_crc(i8* %381, i16 zeroext 344, i16 zeroext %382), !dbg !1441
  store i16 %call444, i16* @tmp_stack_buf_crc, align 2, !dbg !1441
  %383 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1441
  %384 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1441
  %stack_and_buf_crc445 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %384, i32 0, i32 2, !dbg !1441
  store i16 %383, i16* %stack_and_buf_crc445, align 2, !dbg !1441
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1441
  br label %if.end459, !dbg !1441

if.else446:                                       ; preds = %do.body431
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1451
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1451
  %385 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1451
  %reg_file447 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %385, i32 0, i32 0, !dbg !1451
  %arraydecay448 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file447, i16 0, i16 0, !dbg !1451
  call void @__dump_registers(i16* %arraydecay448), !dbg !1451
  call void @llvm.dbg.declare(metadata i16* %__x449, metadata !1453, metadata !DIExpression()), !dbg !1455
  %386 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1455, !srcloc !1456
  store i16 %386, i16* %__x449, align 2, !dbg !1455
  %387 = load i16, i16* %__x449, align 2, !dbg !1455
  store i16 %387, i16* %tmp450, align 2, !dbg !1455
  %388 = load i16, i16* %tmp450, align 2, !dbg !1455
  %add451 = add i16 %388, 2, !dbg !1451
  %389 = inttoptr i16 %add451 to i8*, !dbg !1451
  call void @llvm.dbg.declare(metadata i16* %__x452, metadata !1457, metadata !DIExpression()), !dbg !1459
  %390 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1459, !srcloc !1460
  store i16 %390, i16* %__x452, align 2, !dbg !1459
  %391 = load i16, i16* %__x452, align 2, !dbg !1459
  store i16 %391, i16* %tmp453, align 2, !dbg !1459
  %392 = load i16, i16* %tmp453, align 2, !dbg !1459
  %add454 = add i16 %392, 2, !dbg !1451
  %sub455 = sub i16 9216, %add454, !dbg !1451
  %call456 = call zeroext i16 @__fast_hw_crc(i8* %389, i16 zeroext %sub455, i16 zeroext -1), !dbg !1451
  store i16 %call456, i16* @tmp_stack_crc, align 2, !dbg !1451
  %393 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1451
  %394 = bitcast %struct.camel_buffer_t* %393 to i8*, !dbg !1451
  %395 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1451
  %call457 = call zeroext i16 @__fast_hw_crc(i8* %394, i16 zeroext 344, i16 zeroext %395), !dbg !1451
  store i16 %call457, i16* @tmp_stack_buf_crc, align 2, !dbg !1451
  %396 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1451
  %397 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1451
  %stack_and_buf_crc458 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %397, i32 0, i32 2, !dbg !1451
  store i16 %396, i16* %stack_and_buf_crc458, align 2, !dbg !1451
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1451
  br label %if.end459

if.end459:                                        ; preds = %if.else446, %if.then433
  br label %do.end461, !dbg !1440

do.end461:                                        ; preds = %if.end459
  call void @task_commit(), !dbg !1461
  br label %if.end462, !dbg !1462

if.end462:                                        ; preds = %do.end461, %do.end426
  call void @task_reduce_subtract(), !dbg !1463
  br label %do.body463, !dbg !1464

do.body463:                                       ; preds = %if.end462
  %398 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1465
  %cmp464 = icmp eq i16 %398, 1, !dbg !1465
  br i1 %cmp464, label %if.then465, label %if.else478, !dbg !1468

if.then465:                                       ; preds = %do.body463
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1469
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1469
  %399 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1469
  %reg_file466 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %399, i32 0, i32 0, !dbg !1469
  %arraydecay467 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file466, i16 0, i16 0, !dbg !1469
  call void @__dump_registers(i16* %arraydecay467), !dbg !1469
  call void @llvm.dbg.declare(metadata i16* %__x468, metadata !1471, metadata !DIExpression()), !dbg !1473
  %400 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1473, !srcloc !1474
  store i16 %400, i16* %__x468, align 2, !dbg !1473
  %401 = load i16, i16* %__x468, align 2, !dbg !1473
  store i16 %401, i16* %tmp469, align 2, !dbg !1473
  %402 = load i16, i16* %tmp469, align 2, !dbg !1473
  %add470 = add i16 %402, 2, !dbg !1469
  %403 = inttoptr i16 %add470 to i8*, !dbg !1469
  call void @llvm.dbg.declare(metadata i16* %__x471, metadata !1475, metadata !DIExpression()), !dbg !1477
  %404 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1477, !srcloc !1478
  store i16 %404, i16* %__x471, align 2, !dbg !1477
  %405 = load i16, i16* %__x471, align 2, !dbg !1477
  store i16 %405, i16* %tmp472, align 2, !dbg !1477
  %406 = load i16, i16* %tmp472, align 2, !dbg !1477
  %add473 = add i16 %406, 2, !dbg !1469
  %sub474 = sub i16 9216, %add473, !dbg !1469
  %call475 = call zeroext i16 @__fast_hw_crc(i8* %403, i16 zeroext %sub474, i16 zeroext -1), !dbg !1469
  store i16 %call475, i16* @tmp_stack_crc, align 2, !dbg !1469
  %407 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1469
  %408 = bitcast %struct.camel_buffer_t* %407 to i8*, !dbg !1469
  %409 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1469
  %call476 = call zeroext i16 @__fast_hw_crc(i8* %408, i16 zeroext 344, i16 zeroext %409), !dbg !1469
  store i16 %call476, i16* @tmp_stack_buf_crc, align 2, !dbg !1469
  %410 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1469
  %411 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1469
  %stack_and_buf_crc477 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %411, i32 0, i32 2, !dbg !1469
  store i16 %410, i16* %stack_and_buf_crc477, align 2, !dbg !1469
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1469
  br label %if.end491, !dbg !1469

if.else478:                                       ; preds = %do.body463
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1479
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1479
  %412 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1479
  %reg_file479 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %412, i32 0, i32 0, !dbg !1479
  %arraydecay480 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file479, i16 0, i16 0, !dbg !1479
  call void @__dump_registers(i16* %arraydecay480), !dbg !1479
  call void @llvm.dbg.declare(metadata i16* %__x481, metadata !1481, metadata !DIExpression()), !dbg !1483
  %413 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1483, !srcloc !1484
  store i16 %413, i16* %__x481, align 2, !dbg !1483
  %414 = load i16, i16* %__x481, align 2, !dbg !1483
  store i16 %414, i16* %tmp482, align 2, !dbg !1483
  %415 = load i16, i16* %tmp482, align 2, !dbg !1483
  %add483 = add i16 %415, 2, !dbg !1479
  %416 = inttoptr i16 %add483 to i8*, !dbg !1479
  call void @llvm.dbg.declare(metadata i16* %__x484, metadata !1485, metadata !DIExpression()), !dbg !1487
  %417 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1487, !srcloc !1488
  store i16 %417, i16* %__x484, align 2, !dbg !1487
  %418 = load i16, i16* %__x484, align 2, !dbg !1487
  store i16 %418, i16* %tmp485, align 2, !dbg !1487
  %419 = load i16, i16* %tmp485, align 2, !dbg !1487
  %add486 = add i16 %419, 2, !dbg !1479
  %sub487 = sub i16 9216, %add486, !dbg !1479
  %call488 = call zeroext i16 @__fast_hw_crc(i8* %416, i16 zeroext %sub487, i16 zeroext -1), !dbg !1479
  store i16 %call488, i16* @tmp_stack_crc, align 2, !dbg !1479
  %420 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1479
  %421 = bitcast %struct.camel_buffer_t* %420 to i8*, !dbg !1479
  %422 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1479
  %call489 = call zeroext i16 @__fast_hw_crc(i8* %421, i16 zeroext 344, i16 zeroext %422), !dbg !1479
  store i16 %call489, i16* @tmp_stack_buf_crc, align 2, !dbg !1479
  %423 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1479
  %424 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1479
  %stack_and_buf_crc490 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %424, i32 0, i32 2, !dbg !1479
  store i16 %423, i16* %stack_and_buf_crc490, align 2, !dbg !1479
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1479
  br label %if.end491

if.end491:                                        ; preds = %if.else478, %if.then465
  br label %do.end493, !dbg !1468

do.end493:                                        ; preds = %if.end491
  call void @task_commit(), !dbg !1489
  br label %do.cond494, !dbg !1490

do.cond494:                                       ; preds = %do.end493
  %425 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1491
  %globals495 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %425, i32 0, i32 1, !dbg !1491
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals495, i32 0, i32 10, !dbg !1491
  %426 = load i16, i16* %reduce, align 2, !dbg !1491
  %add496 = add i16 %426, 1, !dbg !1492
  %cmp497 = icmp ugt i16 %add496, 4, !dbg !1493
  br i1 %cmp497, label %do.body333, label %do.end498, !dbg !1490, !llvm.loop !1494

do.end498:                                        ; preds = %do.cond494
  br label %if.end499, !dbg !1496

if.end499:                                        ; preds = %do.end498, %if.end328
  %427 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1497
  %globals500 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %427, i32 0, i32 1, !dbg !1497
  %check_final501 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals500, i32 0, i32 18, !dbg !1497
  %428 = load i16, i16* %check_final501, align 2, !dbg !1497
  %cmp502 = icmp eq i16 %428, 0, !dbg !1499
  br i1 %cmp502, label %if.then503, label %if.else535, !dbg !1500

if.then503:                                       ; preds = %if.end499
  call void @task_mult_block_get_result(), !dbg !1501
  br label %do.body504, !dbg !1503

do.body504:                                       ; preds = %if.then503
  %429 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1504
  %cmp505 = icmp eq i16 %429, 1, !dbg !1504
  br i1 %cmp505, label %if.then506, label %if.else519, !dbg !1507

if.then506:                                       ; preds = %do.body504
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1508
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1508
  %430 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1508
  %reg_file507 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %430, i32 0, i32 0, !dbg !1508
  %arraydecay508 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file507, i16 0, i16 0, !dbg !1508
  call void @__dump_registers(i16* %arraydecay508), !dbg !1508
  call void @llvm.dbg.declare(metadata i16* %__x509, metadata !1510, metadata !DIExpression()), !dbg !1512
  %431 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1512, !srcloc !1513
  store i16 %431, i16* %__x509, align 2, !dbg !1512
  %432 = load i16, i16* %__x509, align 2, !dbg !1512
  store i16 %432, i16* %tmp510, align 2, !dbg !1512
  %433 = load i16, i16* %tmp510, align 2, !dbg !1512
  %add511 = add i16 %433, 2, !dbg !1508
  %434 = inttoptr i16 %add511 to i8*, !dbg !1508
  call void @llvm.dbg.declare(metadata i16* %__x512, metadata !1514, metadata !DIExpression()), !dbg !1516
  %435 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1516, !srcloc !1517
  store i16 %435, i16* %__x512, align 2, !dbg !1516
  %436 = load i16, i16* %__x512, align 2, !dbg !1516
  store i16 %436, i16* %tmp513, align 2, !dbg !1516
  %437 = load i16, i16* %tmp513, align 2, !dbg !1516
  %add514 = add i16 %437, 2, !dbg !1508
  %sub515 = sub i16 9216, %add514, !dbg !1508
  %call516 = call zeroext i16 @__fast_hw_crc(i8* %434, i16 zeroext %sub515, i16 zeroext -1), !dbg !1508
  store i16 %call516, i16* @tmp_stack_crc, align 2, !dbg !1508
  %438 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1508
  %439 = bitcast %struct.camel_buffer_t* %438 to i8*, !dbg !1508
  %440 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1508
  %call517 = call zeroext i16 @__fast_hw_crc(i8* %439, i16 zeroext 344, i16 zeroext %440), !dbg !1508
  store i16 %call517, i16* @tmp_stack_buf_crc, align 2, !dbg !1508
  %441 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1508
  %442 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1508
  %stack_and_buf_crc518 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %442, i32 0, i32 2, !dbg !1508
  store i16 %441, i16* %stack_and_buf_crc518, align 2, !dbg !1508
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1508
  br label %if.end532, !dbg !1508

if.else519:                                       ; preds = %do.body504
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1518
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1518
  %443 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1518
  %reg_file520 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %443, i32 0, i32 0, !dbg !1518
  %arraydecay521 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file520, i16 0, i16 0, !dbg !1518
  call void @__dump_registers(i16* %arraydecay521), !dbg !1518
  call void @llvm.dbg.declare(metadata i16* %__x522, metadata !1520, metadata !DIExpression()), !dbg !1522
  %444 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1522, !srcloc !1523
  store i16 %444, i16* %__x522, align 2, !dbg !1522
  %445 = load i16, i16* %__x522, align 2, !dbg !1522
  store i16 %445, i16* %tmp523, align 2, !dbg !1522
  %446 = load i16, i16* %tmp523, align 2, !dbg !1522
  %add524 = add i16 %446, 2, !dbg !1518
  %447 = inttoptr i16 %add524 to i8*, !dbg !1518
  call void @llvm.dbg.declare(metadata i16* %__x525, metadata !1524, metadata !DIExpression()), !dbg !1526
  %448 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1526, !srcloc !1527
  store i16 %448, i16* %__x525, align 2, !dbg !1526
  %449 = load i16, i16* %__x525, align 2, !dbg !1526
  store i16 %449, i16* %tmp526, align 2, !dbg !1526
  %450 = load i16, i16* %tmp526, align 2, !dbg !1526
  %add527 = add i16 %450, 2, !dbg !1518
  %sub528 = sub i16 9216, %add527, !dbg !1518
  %call529 = call zeroext i16 @__fast_hw_crc(i8* %447, i16 zeroext %sub528, i16 zeroext -1), !dbg !1518
  store i16 %call529, i16* @tmp_stack_crc, align 2, !dbg !1518
  %451 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1518
  %452 = bitcast %struct.camel_buffer_t* %451 to i8*, !dbg !1518
  %453 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1518
  %call530 = call zeroext i16 @__fast_hw_crc(i8* %452, i16 zeroext 344, i16 zeroext %453), !dbg !1518
  store i16 %call530, i16* @tmp_stack_buf_crc, align 2, !dbg !1518
  %454 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1518
  %455 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1518
  %stack_and_buf_crc531 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %455, i32 0, i32 2, !dbg !1518
  store i16 %454, i16* %stack_and_buf_crc531, align 2, !dbg !1518
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1518
  br label %if.end532

if.end532:                                        ; preds = %if.else519, %if.then506
  br label %do.end534, !dbg !1507

do.end534:                                        ; preds = %if.end532
  call void @task_commit(), !dbg !1528
  br label %if.end572, !dbg !1529

if.else535:                                       ; preds = %if.end499
  %456 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1530
  %globals536 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %456, i32 0, i32 1, !dbg !1530
  %check_final537 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals536, i32 0, i32 18, !dbg !1530
  %457 = load i16, i16* %check_final537, align 2, !dbg !1530
  %cmp538 = icmp eq i16 %457, 1, !dbg !1532
  br i1 %cmp538, label %if.then539, label %if.end571, !dbg !1533

if.then539:                                       ; preds = %if.else535
  call void @task_square_base_get_result(), !dbg !1534
  br label %do.body540, !dbg !1536

do.body540:                                       ; preds = %if.then539
  %458 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1537
  %cmp541 = icmp eq i16 %458, 1, !dbg !1537
  br i1 %cmp541, label %if.then542, label %if.else555, !dbg !1540

if.then542:                                       ; preds = %do.body540
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1541
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1541
  %459 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1541
  %reg_file543 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %459, i32 0, i32 0, !dbg !1541
  %arraydecay544 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file543, i16 0, i16 0, !dbg !1541
  call void @__dump_registers(i16* %arraydecay544), !dbg !1541
  call void @llvm.dbg.declare(metadata i16* %__x545, metadata !1543, metadata !DIExpression()), !dbg !1545
  %460 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1545, !srcloc !1546
  store i16 %460, i16* %__x545, align 2, !dbg !1545
  %461 = load i16, i16* %__x545, align 2, !dbg !1545
  store i16 %461, i16* %tmp546, align 2, !dbg !1545
  %462 = load i16, i16* %tmp546, align 2, !dbg !1545
  %add547 = add i16 %462, 2, !dbg !1541
  %463 = inttoptr i16 %add547 to i8*, !dbg !1541
  call void @llvm.dbg.declare(metadata i16* %__x548, metadata !1547, metadata !DIExpression()), !dbg !1549
  %464 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1549, !srcloc !1550
  store i16 %464, i16* %__x548, align 2, !dbg !1549
  %465 = load i16, i16* %__x548, align 2, !dbg !1549
  store i16 %465, i16* %tmp549, align 2, !dbg !1549
  %466 = load i16, i16* %tmp549, align 2, !dbg !1549
  %add550 = add i16 %466, 2, !dbg !1541
  %sub551 = sub i16 9216, %add550, !dbg !1541
  %call552 = call zeroext i16 @__fast_hw_crc(i8* %463, i16 zeroext %sub551, i16 zeroext -1), !dbg !1541
  store i16 %call552, i16* @tmp_stack_crc, align 2, !dbg !1541
  %467 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1541
  %468 = bitcast %struct.camel_buffer_t* %467 to i8*, !dbg !1541
  %469 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1541
  %call553 = call zeroext i16 @__fast_hw_crc(i8* %468, i16 zeroext 344, i16 zeroext %469), !dbg !1541
  store i16 %call553, i16* @tmp_stack_buf_crc, align 2, !dbg !1541
  %470 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1541
  %471 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1541
  %stack_and_buf_crc554 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %471, i32 0, i32 2, !dbg !1541
  store i16 %470, i16* %stack_and_buf_crc554, align 2, !dbg !1541
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1541
  br label %if.end568, !dbg !1541

if.else555:                                       ; preds = %do.body540
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1551
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1551
  %472 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1551
  %reg_file556 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %472, i32 0, i32 0, !dbg !1551
  %arraydecay557 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file556, i16 0, i16 0, !dbg !1551
  call void @__dump_registers(i16* %arraydecay557), !dbg !1551
  call void @llvm.dbg.declare(metadata i16* %__x558, metadata !1553, metadata !DIExpression()), !dbg !1555
  %473 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1555, !srcloc !1556
  store i16 %473, i16* %__x558, align 2, !dbg !1555
  %474 = load i16, i16* %__x558, align 2, !dbg !1555
  store i16 %474, i16* %tmp559, align 2, !dbg !1555
  %475 = load i16, i16* %tmp559, align 2, !dbg !1555
  %add560 = add i16 %475, 2, !dbg !1551
  %476 = inttoptr i16 %add560 to i8*, !dbg !1551
  call void @llvm.dbg.declare(metadata i16* %__x561, metadata !1557, metadata !DIExpression()), !dbg !1559
  %477 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1559, !srcloc !1560
  store i16 %477, i16* %__x561, align 2, !dbg !1559
  %478 = load i16, i16* %__x561, align 2, !dbg !1559
  store i16 %478, i16* %tmp562, align 2, !dbg !1559
  %479 = load i16, i16* %tmp562, align 2, !dbg !1559
  %add563 = add i16 %479, 2, !dbg !1551
  %sub564 = sub i16 9216, %add563, !dbg !1551
  %call565 = call zeroext i16 @__fast_hw_crc(i8* %476, i16 zeroext %sub564, i16 zeroext -1), !dbg !1551
  store i16 %call565, i16* @tmp_stack_crc, align 2, !dbg !1551
  %480 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1551
  %481 = bitcast %struct.camel_buffer_t* %480 to i8*, !dbg !1551
  %482 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1551
  %call566 = call zeroext i16 @__fast_hw_crc(i8* %481, i16 zeroext 344, i16 zeroext %482), !dbg !1551
  store i16 %call566, i16* @tmp_stack_buf_crc, align 2, !dbg !1551
  %483 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1551
  %484 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1551
  %stack_and_buf_crc567 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %484, i32 0, i32 2, !dbg !1551
  store i16 %483, i16* %stack_and_buf_crc567, align 2, !dbg !1551
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1551
  br label %if.end568

if.end568:                                        ; preds = %if.else555, %if.then542
  br label %do.end570, !dbg !1540

do.end570:                                        ; preds = %if.end568
  call void @task_commit(), !dbg !1561
  br label %if.end571, !dbg !1562

if.end571:                                        ; preds = %do.end570, %if.else535
  br label %if.end572

if.end572:                                        ; preds = %if.end571, %do.end534
  br label %while.body18, !dbg !1051, !llvm.loop !1563

while.end:                                        ; preds = %if.then188
  br label %while.body, !dbg !1022, !llvm.loop !1565
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
!llvm.module.flags = !{!93, !94, !95}
!llvm.ident = !{!96}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 174, type: !88, isLocal: false, isDefinition: true)
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
!12 = !{!13, !18, !0, !20, !65, !67, !70, !82}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 75, type: !15, isLocal: false, isDefinition: true)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !16)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !17)
!17 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 76, type: !15, isLocal: false, isDefinition: true)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 181, type: !22, isLocal: false, isDefinition: true)
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 16)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 167, baseType: !24)
!24 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 162, size: 2768, elements: !25)
!25 = !{!26, !31, !64}
!26 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !24, file: !3, line: 164, baseType: !27, size: 176)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 176, elements: !29)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 72, baseType: !15)
!29 = !{!30}
!30 = !DISubrange(count: 11)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !24, file: !3, line: 165, baseType: !32, size: 2576, offset: 176)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 159, baseType: !33)
!33 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 135, size: 2576, elements: !34)
!34 = !{!35, !40, !41, !42, !43, !44, !45, !46, !50, !51, !52, !53, !57, !58, !59, !60, !61, !62, !63}
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
!62 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !33, file: !3, line: 156, baseType: !6, size: 16, offset: 2544)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "check_final", scope: !33, file: !3, line: 157, baseType: !6, size: 16, offset: 2560)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !24, file: !3, line: 166, baseType: !15, size: 16, offset: 2752)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 181, type: !22, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 210, type: !69, isLocal: false, isDefinition: true)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 176, elements: !29)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "pubkey", scope: !2, file: !3, line: 38, type: !72, isLocal: true, isDefinition: true)
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !73)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "pubkey_t", file: !3, line: 20, baseType: !74)
!74 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 17, size: 48, elements: !75)
!75 = !{!76, !81}
!76 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !74, file: !3, line: 18, baseType: !77, size: 32)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !78, size: 32, elements: !48)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 20, baseType: !79)
!79 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 29, baseType: !80)
!80 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "e", scope: !74, file: !3, line: 19, baseType: !37, size: 16, offset: 32)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "PLAINTEXT", scope: !2, file: !3, line: 42, type: !84, isLocal: true, isDefinition: true)
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !85, size: 72, elements: !86)
!85 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !80)
!86 = !{!87}
!87 = !DISubrange(count: 9)
!88 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 169, size: 5552, elements: !89)
!89 = !{!90, !91, !92}
!90 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !88, file: !3, line: 171, baseType: !15, size: 16)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !88, file: !3, line: 172, baseType: !23, size: 2768, offset: 16)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !88, file: !3, line: 173, baseType: !23, size: 2768, offset: 2784)
!93 = !{i32 2, !"Dwarf Version", i32 4}
!94 = !{i32 2, !"Debug Info Version", i32 3}
!95 = !{i32 1, !"wchar_size", i32 2}
!96 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!97 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 183, type: !98, scopeLine: 183, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DISubroutineType(types: !99)
!99 = !{null}
!100 = !DILocation(line: 184, column: 10, scope: !97)
!101 = !DILocation(line: 186, column: 9, scope: !97)
!102 = !DILocation(line: 188, column: 9, scope: !97)
!103 = !DILocation(line: 193, column: 11, scope: !97)
!104 = !DILocation(line: 198, column: 12, scope: !97)
!105 = !DILocation(line: 199, column: 10, scope: !97)
!106 = !DILocation(line: 200, column: 10, scope: !97)
!107 = !DILocation(line: 202, column: 10, scope: !97)
!108 = !DILocation(line: 203, column: 12, scope: !97)
!109 = !DILocation(line: 206, column: 10, scope: !97)
!110 = !DILocation(line: 208, column: 1, scope: !97)
!111 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 212, type: !98, scopeLine: 212, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 213, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !111, file: !3, line: 213, column: 8)
!114 = !DILocation(line: 213, column: 19, scope: !113)
!115 = !DILocation(line: 213, column: 8, scope: !111)
!116 = !DILocation(line: 214, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !3, line: 213, column: 34)
!118 = !DILocation(line: 215, column: 16, scope: !117)
!119 = !DILocation(line: 216, column: 5, scope: !117)
!120 = !DILocation(line: 216, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !3, line: 216, column: 15)
!122 = !DILocation(line: 216, column: 26, scope: !121)
!123 = !DILocation(line: 216, column: 15, scope: !113)
!124 = !DILocation(line: 217, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !3, line: 216, column: 41)
!126 = !DILocation(line: 218, column: 16, scope: !125)
!127 = !DILocation(line: 219, column: 5, scope: !125)
!128 = !DILocation(line: 220, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !3, line: 219, column: 12)
!130 = !DILocation(line: 237, column: 3, scope: !131)
!131 = distinct !DILexicalBlock(scope: !111, file: !3, line: 237, column: 3)
!132 = !{i32 -2146695705}
!133 = !DILocalVariable(name: "__x", scope: !134, file: !3, line: 239, type: !6)
!134 = distinct !DILexicalBlock(scope: !111, file: !3, line: 239, column: 33)
!135 = !DILocation(line: 239, column: 33, scope: !134)
!136 = !{i32 -2146695469}
!137 = !DILocation(line: 239, column: 51, scope: !111)
!138 = !DILocation(line: 239, column: 33, scope: !111)
!139 = !DILocalVariable(name: "__x", scope: !140, file: !3, line: 239, type: !6)
!140 = distinct !DILexicalBlock(scope: !111, file: !3, line: 239, column: 65)
!141 = !DILocation(line: 239, column: 65, scope: !140)
!142 = !{i32 -2146695344}
!143 = !DILocation(line: 239, column: 83, scope: !111)
!144 = !DILocation(line: 239, column: 63, scope: !111)
!145 = !DILocation(line: 239, column: 19, scope: !111)
!146 = !DILocation(line: 239, column: 17, scope: !111)
!147 = !DILocation(line: 240, column: 37, scope: !111)
!148 = !DILocation(line: 240, column: 71, scope: !111)
!149 = !DILocation(line: 240, column: 23, scope: !111)
!150 = !DILocation(line: 240, column: 21, scope: !111)
!151 = !DILocation(line: 243, column: 6, scope: !152)
!152 = distinct !DILexicalBlock(scope: !111, file: !3, line: 243, column: 6)
!153 = !DILocation(line: 243, column: 27, scope: !152)
!154 = !DILocation(line: 243, column: 33, scope: !152)
!155 = !DILocation(line: 243, column: 24, scope: !152)
!156 = !DILocation(line: 243, column: 6, scope: !111)
!157 = !DILocation(line: 244, column: 11, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !3, line: 243, column: 51)
!159 = !DILocation(line: 244, column: 4, scope: !158)
!160 = !DILocation(line: 244, column: 19, scope: !158)
!161 = !DILocation(line: 245, column: 4, scope: !158)
!162 = !DILocation(line: 246, column: 24, scope: !158)
!163 = !DILocation(line: 246, column: 30, scope: !158)
!164 = !DILocation(line: 246, column: 4, scope: !158)
!165 = !DILocation(line: 247, column: 3, scope: !158)
!166 = !DILocation(line: 248, column: 4, scope: !167)
!167 = distinct !DILexicalBlock(scope: !152, file: !3, line: 247, column: 9)
!168 = !DILocation(line: 251, column: 1, scope: !111)
!169 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 255, type: !98, scopeLine: 256, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocalVariable(name: "i", scope: !169, file: !3, line: 257, type: !171)
!171 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!172 = !DILocation(line: 257, column: 6, scope: !169)
!173 = !DILocalVariable(name: "message_length", scope: !169, file: !3, line: 258, type: !6)
!174 = !DILocation(line: 258, column: 11, scope: !169)
!175 = !DILocation(line: 260, column: 9, scope: !176)
!176 = distinct !DILexicalBlock(scope: !169, file: !3, line: 260, column: 2)
!177 = !DILocation(line: 260, column: 7, scope: !176)
!178 = !DILocation(line: 260, column: 14, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 260, column: 2)
!180 = !DILocation(line: 260, column: 16, scope: !179)
!181 = !DILocation(line: 260, column: 2, scope: !176)
!182 = !DILocation(line: 261, column: 29, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !3, line: 260, column: 35)
!184 = !DILocation(line: 261, column: 20, scope: !183)
!185 = !DILocation(line: 261, column: 3, scope: !183)
!186 = !DILocation(line: 261, column: 15, scope: !183)
!187 = !DILocation(line: 261, column: 18, scope: !183)
!188 = !DILocation(line: 262, column: 2, scope: !183)
!189 = !DILocation(line: 260, column: 30, scope: !179)
!190 = !DILocation(line: 260, column: 2, scope: !179)
!191 = distinct !{!191, !181, !192}
!192 = !DILocation(line: 262, column: 2, scope: !176)
!193 = !DILocation(line: 264, column: 23, scope: !169)
!194 = !DILocation(line: 264, column: 2, scope: !169)
!195 = !DILocation(line: 264, column: 21, scope: !169)
!196 = !DILocation(line: 265, column: 2, scope: !169)
!197 = !DILocation(line: 265, column: 19, scope: !169)
!198 = !DILocation(line: 266, column: 2, scope: !169)
!199 = !DILocation(line: 266, column: 21, scope: !169)
!200 = !DILocation(line: 269, column: 2, scope: !169)
!201 = !DILocation(line: 269, column: 18, scope: !169)
!202 = !DILocation(line: 270, column: 2, scope: !169)
!203 = !DILocation(line: 270, column: 12, scope: !169)
!204 = !DILocation(line: 273, column: 1, scope: !169)
!205 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 289, type: !98, scopeLine: 290, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DILocalVariable(name: "i", scope: !205, file: !3, line: 291, type: !171)
!207 = !DILocation(line: 291, column: 6, scope: !205)
!208 = !DILocation(line: 293, column: 6, scope: !209)
!209 = distinct !DILexicalBlock(scope: !205, file: !3, line: 293, column: 6)
!210 = !DILocation(line: 293, column: 26, scope: !209)
!211 = !DILocation(line: 293, column: 23, scope: !209)
!212 = !DILocation(line: 293, column: 6, scope: !205)
!213 = !DILocation(line: 294, column: 3, scope: !214)
!214 = distinct !DILexicalBlock(scope: !209, file: !3, line: 293, column: 46)
!215 = !DILocation(line: 296, column: 2, scope: !214)
!216 = !DILocalVariable(name: "zero", scope: !205, file: !3, line: 298, type: !37)
!217 = !DILocation(line: 298, column: 10, scope: !205)
!218 = !DILocation(line: 299, column: 9, scope: !219)
!219 = distinct !DILexicalBlock(scope: !205, file: !3, line: 299, column: 2)
!220 = !DILocation(line: 299, column: 7, scope: !219)
!221 = !DILocation(line: 299, column: 14, scope: !222)
!222 = distinct !DILexicalBlock(scope: !219, file: !3, line: 299, column: 2)
!223 = !DILocation(line: 299, column: 16, scope: !222)
!224 = !DILocation(line: 299, column: 2, scope: !219)
!225 = !DILocation(line: 300, column: 18, scope: !226)
!226 = distinct !DILexicalBlock(scope: !222, file: !3, line: 299, column: 52)
!227 = !DILocation(line: 300, column: 37, scope: !226)
!228 = !DILocation(line: 300, column: 35, scope: !226)
!229 = !DILocation(line: 300, column: 41, scope: !226)
!230 = !DILocation(line: 300, column: 39, scope: !226)
!231 = !DILocation(line: 300, column: 17, scope: !226)
!232 = !DILocation(line: 300, column: 73, scope: !226)
!233 = !DILocation(line: 300, column: 92, scope: !226)
!234 = !DILocation(line: 300, column: 90, scope: !226)
!235 = !DILocation(line: 300, column: 63, scope: !226)
!236 = !DILocation(line: 300, column: 3, scope: !226)
!237 = !DILocation(line: 300, column: 12, scope: !226)
!238 = !DILocation(line: 300, column: 15, scope: !226)
!239 = !DILocation(line: 301, column: 2, scope: !226)
!240 = !DILocation(line: 299, column: 47, scope: !222)
!241 = !DILocation(line: 299, column: 2, scope: !222)
!242 = distinct !{!242, !224, !243}
!243 = !DILocation(line: 301, column: 2, scope: !219)
!244 = !DILocation(line: 302, column: 9, scope: !245)
!245 = distinct !DILexicalBlock(scope: !205, file: !3, line: 302, column: 2)
!246 = !DILocation(line: 302, column: 7, scope: !245)
!247 = !DILocation(line: 302, column: 40, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !3, line: 302, column: 2)
!249 = !DILocation(line: 302, column: 42, scope: !248)
!250 = !DILocation(line: 302, column: 2, scope: !245)
!251 = !DILocation(line: 303, column: 3, scope: !252)
!252 = distinct !DILexicalBlock(scope: !248, file: !3, line: 302, column: 61)
!253 = !DILocation(line: 303, column: 12, scope: !252)
!254 = !DILocation(line: 303, column: 15, scope: !252)
!255 = !DILocation(line: 304, column: 2, scope: !252)
!256 = !DILocation(line: 302, column: 56, scope: !248)
!257 = !DILocation(line: 302, column: 2, scope: !248)
!258 = distinct !{!258, !250, !259}
!259 = !DILocation(line: 304, column: 2, scope: !245)
!260 = !DILocation(line: 306, column: 2, scope: !205)
!261 = !DILocation(line: 306, column: 12, scope: !205)
!262 = !DILocation(line: 306, column: 18, scope: !205)
!263 = !DILocation(line: 307, column: 9, scope: !264)
!264 = distinct !DILexicalBlock(scope: !205, file: !3, line: 307, column: 2)
!265 = !DILocation(line: 307, column: 7, scope: !264)
!266 = !DILocation(line: 307, column: 14, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !3, line: 307, column: 2)
!268 = !DILocation(line: 307, column: 16, scope: !267)
!269 = !DILocation(line: 307, column: 2, scope: !264)
!270 = !DILocation(line: 308, column: 3, scope: !267)
!271 = !DILocation(line: 308, column: 13, scope: !267)
!272 = !DILocation(line: 308, column: 16, scope: !267)
!273 = !DILocation(line: 307, column: 30, scope: !267)
!274 = !DILocation(line: 307, column: 2, scope: !267)
!275 = distinct !{!275, !269, !276}
!276 = !DILocation(line: 308, column: 18, scope: !264)
!277 = !DILocation(line: 310, column: 24, scope: !205)
!278 = !DILocation(line: 310, column: 2, scope: !205)
!279 = !DILocation(line: 310, column: 15, scope: !205)
!280 = !DILocation(line: 312, column: 2, scope: !205)
!281 = !DILocation(line: 312, column: 19, scope: !205)
!282 = !DILocation(line: 314, column: 2, scope: !205)
!283 = !DILocation(line: 314, column: 12, scope: !205)
!284 = !DILocation(line: 316, column: 1, scope: !205)
!285 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 332, type: !98, scopeLine: 333, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!286 = !DILocation(line: 335, column: 6, scope: !287)
!287 = distinct !DILexicalBlock(scope: !285, file: !3, line: 335, column: 6)
!288 = !DILocation(line: 335, column: 19, scope: !287)
!289 = !DILocation(line: 335, column: 6, scope: !285)
!290 = !DILocation(line: 336, column: 3, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !3, line: 335, column: 26)
!292 = !DILocation(line: 336, column: 16, scope: !291)
!293 = !DILocation(line: 337, column: 3, scope: !291)
!294 = !DILocation(line: 337, column: 19, scope: !291)
!295 = !DILocation(line: 338, column: 3, scope: !291)
!296 = !DILocation(line: 338, column: 13, scope: !291)
!297 = !DILocation(line: 340, column: 2, scope: !291)
!298 = !DILocation(line: 341, column: 3, scope: !299)
!299 = distinct !DILexicalBlock(scope: !287, file: !3, line: 340, column: 9)
!300 = !DILocation(line: 341, column: 16, scope: !299)
!301 = !DILocation(line: 342, column: 3, scope: !299)
!302 = !DILocation(line: 342, column: 19, scope: !299)
!303 = !DILocation(line: 343, column: 3, scope: !299)
!304 = !DILocation(line: 343, column: 13, scope: !299)
!305 = !DILocation(line: 346, column: 1, scope: !285)
!306 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 349, type: !98, scopeLine: 350, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!307 = !DILocation(line: 352, column: 2, scope: !306)
!308 = !DILocation(line: 352, column: 18, scope: !306)
!309 = !DILocation(line: 354, column: 1, scope: !306)
!310 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 371, type: !98, scopeLine: 372, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!311 = !DILocalVariable(name: "i", scope: !310, file: !3, line: 373, type: !171)
!312 = !DILocation(line: 373, column: 6, scope: !310)
!313 = !DILocation(line: 375, column: 9, scope: !314)
!314 = distinct !DILexicalBlock(scope: !310, file: !3, line: 375, column: 2)
!315 = !DILocation(line: 375, column: 7, scope: !314)
!316 = !DILocation(line: 375, column: 27, scope: !317)
!317 = distinct !DILexicalBlock(scope: !314, file: !3, line: 375, column: 2)
!318 = !DILocation(line: 375, column: 29, scope: !317)
!319 = !DILocation(line: 375, column: 2, scope: !314)
!320 = !DILocation(line: 376, column: 18, scope: !321)
!321 = distinct !DILexicalBlock(scope: !317, file: !3, line: 375, column: 40)
!322 = !DILocation(line: 376, column: 30, scope: !321)
!323 = !DILocation(line: 376, column: 3, scope: !321)
!324 = !DILocation(line: 376, column: 13, scope: !321)
!325 = !DILocation(line: 376, column: 16, scope: !321)
!326 = !DILocation(line: 377, column: 2, scope: !321)
!327 = !DILocation(line: 375, column: 35, scope: !317)
!328 = !DILocation(line: 375, column: 2, scope: !317)
!329 = distinct !{!329, !319, !330}
!330 = !DILocation(line: 377, column: 2, scope: !314)
!331 = !DILocation(line: 380, column: 6, scope: !332)
!332 = distinct !DILexicalBlock(scope: !310, file: !3, line: 380, column: 6)
!333 = !DILocation(line: 380, column: 19, scope: !332)
!334 = !DILocation(line: 380, column: 6, scope: !310)
!335 = !DILocation(line: 382, column: 3, scope: !336)
!336 = distinct !DILexicalBlock(scope: !332, file: !3, line: 380, column: 24)
!337 = !DILocation(line: 382, column: 13, scope: !336)
!338 = !DILocation(line: 383, column: 3, scope: !336)
!339 = !DILocation(line: 383, column: 19, scope: !336)
!340 = !DILocation(line: 386, column: 2, scope: !336)
!341 = !DILocation(line: 388, column: 7, scope: !342)
!342 = distinct !DILexicalBlock(scope: !343, file: !3, line: 388, column: 7)
!343 = distinct !DILexicalBlock(scope: !332, file: !3, line: 386, column: 9)
!344 = !DILocation(line: 388, column: 26, scope: !342)
!345 = !DILocation(line: 388, column: 39, scope: !342)
!346 = !DILocation(line: 388, column: 7, scope: !343)
!347 = !DILocation(line: 390, column: 11, scope: !348)
!348 = distinct !DILexicalBlock(scope: !349, file: !3, line: 390, column: 4)
!349 = distinct !DILexicalBlock(scope: !342, file: !3, line: 388, column: 59)
!350 = !DILocation(line: 390, column: 9, scope: !348)
!351 = !DILocation(line: 390, column: 16, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 390, column: 4)
!353 = !DILocation(line: 390, column: 18, scope: !352)
!354 = !DILocation(line: 390, column: 4, scope: !348)
!355 = !DILocation(line: 392, column: 42, scope: !356)
!356 = distinct !DILexicalBlock(scope: !352, file: !3, line: 390, column: 37)
!357 = !DILocation(line: 392, column: 54, scope: !356)
!358 = !DILocation(line: 392, column: 5, scope: !356)
!359 = !DILocation(line: 392, column: 20, scope: !356)
!360 = !DILocation(line: 392, column: 40, scope: !356)
!361 = !DILocation(line: 393, column: 7, scope: !356)
!362 = !DILocation(line: 393, column: 5, scope: !356)
!363 = !DILocation(line: 394, column: 4, scope: !356)
!364 = !DILocation(line: 390, column: 32, scope: !352)
!365 = !DILocation(line: 390, column: 4, scope: !352)
!366 = distinct !{!366, !354, !367}
!367 = !DILocation(line: 394, column: 4, scope: !348)
!368 = !DILocation(line: 396, column: 3, scope: !349)
!369 = !DILocation(line: 401, column: 1, scope: !310)
!370 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 404, type: !98, scopeLine: 405, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!371 = !DILocation(line: 407, column: 2, scope: !370)
!372 = !DILocation(line: 407, column: 18, scope: !370)
!373 = !DILocation(line: 409, column: 1, scope: !370)
!374 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 426, type: !98, scopeLine: 427, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!375 = !DILocalVariable(name: "i", scope: !374, file: !3, line: 428, type: !171)
!376 = !DILocation(line: 428, column: 6, scope: !374)
!377 = !DILocalVariable(name: "b", scope: !374, file: !3, line: 429, type: !37)
!378 = !DILocation(line: 429, column: 10, scope: !374)
!379 = !DILocation(line: 431, column: 9, scope: !380)
!380 = distinct !DILexicalBlock(scope: !374, file: !3, line: 431, column: 2)
!381 = !DILocation(line: 431, column: 7, scope: !380)
!382 = !DILocation(line: 431, column: 14, scope: !383)
!383 = distinct !DILexicalBlock(scope: !380, file: !3, line: 431, column: 2)
!384 = !DILocation(line: 431, column: 16, scope: !383)
!385 = !DILocation(line: 431, column: 2, scope: !380)
!386 = !DILocation(line: 432, column: 17, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !3, line: 431, column: 35)
!388 = !DILocation(line: 432, column: 29, scope: !387)
!389 = !DILocation(line: 432, column: 3, scope: !387)
!390 = !DILocation(line: 432, column: 12, scope: !387)
!391 = !DILocation(line: 432, column: 15, scope: !387)
!392 = !DILocation(line: 433, column: 2, scope: !387)
!393 = !DILocation(line: 431, column: 30, scope: !383)
!394 = !DILocation(line: 431, column: 2, scope: !383)
!395 = distinct !{!395, !385, !396}
!396 = !DILocation(line: 433, column: 2, scope: !380)
!397 = !DILocation(line: 435, column: 2, scope: !374)
!398 = !DILocation(line: 435, column: 12, scope: !374)
!399 = !DILocation(line: 437, column: 1, scope: !374)
!400 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 453, type: !98, scopeLine: 454, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!401 = !DILocation(line: 456, column: 2, scope: !400)
!402 = !DILocation(line: 456, column: 12, scope: !400)
!403 = !DILocation(line: 457, column: 2, scope: !400)
!404 = !DILocation(line: 457, column: 12, scope: !400)
!405 = !DILocation(line: 460, column: 1, scope: !400)
!406 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 476, type: !98, scopeLine: 477, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!407 = !DILocalVariable(name: "i", scope: !406, file: !3, line: 478, type: !171)
!408 = !DILocation(line: 478, column: 6, scope: !406)
!409 = !DILocalVariable(name: "a", scope: !406, file: !3, line: 479, type: !37)
!410 = !DILocation(line: 479, column: 10, scope: !406)
!411 = !DILocalVariable(name: "b", scope: !406, file: !3, line: 479, type: !37)
!412 = !DILocation(line: 479, column: 13, scope: !406)
!413 = !DILocalVariable(name: "c", scope: !406, file: !3, line: 479, type: !37)
!414 = !DILocation(line: 479, column: 16, scope: !406)
!415 = !DILocalVariable(name: "dp", scope: !406, file: !3, line: 480, type: !37)
!416 = !DILocation(line: 480, column: 10, scope: !406)
!417 = !DILocalVariable(name: "p", scope: !406, file: !3, line: 480, type: !37)
!418 = !DILocation(line: 480, column: 14, scope: !406)
!419 = !DILocation(line: 482, column: 6, scope: !406)
!420 = !DILocation(line: 482, column: 4, scope: !406)
!421 = !DILocation(line: 483, column: 4, scope: !406)
!422 = !DILocation(line: 484, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !406, file: !3, line: 484, column: 2)
!424 = !DILocation(line: 484, column: 7, scope: !423)
!425 = !DILocation(line: 484, column: 14, scope: !426)
!426 = distinct !DILexicalBlock(scope: !423, file: !3, line: 484, column: 2)
!427 = !DILocation(line: 484, column: 16, scope: !426)
!428 = !DILocation(line: 484, column: 2, scope: !423)
!429 = !DILocation(line: 485, column: 7, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !3, line: 485, column: 7)
!431 = distinct !DILexicalBlock(scope: !426, file: !3, line: 484, column: 35)
!432 = !DILocation(line: 485, column: 19, scope: !430)
!433 = !DILocation(line: 485, column: 17, scope: !430)
!434 = !DILocation(line: 485, column: 21, scope: !430)
!435 = !DILocation(line: 485, column: 26, scope: !430)
!436 = !DILocation(line: 485, column: 29, scope: !430)
!437 = !DILocation(line: 485, column: 41, scope: !430)
!438 = !DILocation(line: 485, column: 39, scope: !430)
!439 = !DILocation(line: 485, column: 43, scope: !430)
!440 = !DILocation(line: 485, column: 7, scope: !431)
!441 = !DILocation(line: 486, column: 8, scope: !442)
!442 = distinct !DILexicalBlock(scope: !430, file: !3, line: 485, column: 57)
!443 = !DILocation(line: 486, column: 17, scope: !442)
!444 = !DILocation(line: 486, column: 27, scope: !442)
!445 = !DILocation(line: 486, column: 26, scope: !442)
!446 = !DILocation(line: 486, column: 6, scope: !442)
!447 = !DILocation(line: 487, column: 8, scope: !442)
!448 = !DILocation(line: 487, column: 18, scope: !442)
!449 = !DILocation(line: 487, column: 6, scope: !442)
!450 = !DILocation(line: 488, column: 9, scope: !442)
!451 = !DILocation(line: 488, column: 13, scope: !442)
!452 = !DILocation(line: 488, column: 11, scope: !442)
!453 = !DILocation(line: 488, column: 7, scope: !442)
!454 = !DILocation(line: 490, column: 9, scope: !442)
!455 = !DILocation(line: 490, column: 12, scope: !442)
!456 = !DILocation(line: 490, column: 6, scope: !442)
!457 = !DILocation(line: 491, column: 9, scope: !442)
!458 = !DILocation(line: 491, column: 12, scope: !442)
!459 = !DILocation(line: 491, column: 6, scope: !442)
!460 = !DILocation(line: 493, column: 3, scope: !442)
!461 = !DILocation(line: 494, column: 2, scope: !431)
!462 = !DILocation(line: 484, column: 30, scope: !426)
!463 = !DILocation(line: 484, column: 2, scope: !426)
!464 = distinct !{!464, !428, !465}
!465 = !DILocation(line: 494, column: 2, scope: !423)
!466 = !DILocation(line: 496, column: 7, scope: !406)
!467 = !DILocation(line: 496, column: 9, scope: !406)
!468 = !DILocation(line: 496, column: 4, scope: !406)
!469 = !DILocation(line: 497, column: 4, scope: !406)
!470 = !DILocation(line: 499, column: 27, scope: !406)
!471 = !DILocation(line: 499, column: 2, scope: !406)
!472 = !DILocation(line: 499, column: 14, scope: !406)
!473 = !DILocation(line: 499, column: 25, scope: !406)
!474 = !DILocation(line: 500, column: 2, scope: !406)
!475 = !DILocation(line: 500, column: 11, scope: !406)
!476 = !DILocation(line: 502, column: 6, scope: !477)
!477 = distinct !DILexicalBlock(scope: !406, file: !3, line: 502, column: 6)
!478 = !DILocation(line: 502, column: 16, scope: !477)
!479 = !DILocation(line: 502, column: 6, scope: !406)
!480 = !DILocation(line: 503, column: 15, scope: !481)
!481 = distinct !DILexicalBlock(scope: !477, file: !3, line: 502, column: 34)
!482 = !DILocation(line: 503, column: 3, scope: !481)
!483 = !DILocation(line: 503, column: 13, scope: !481)
!484 = !DILocation(line: 504, column: 3, scope: !481)
!485 = !DILocation(line: 504, column: 13, scope: !481)
!486 = !DILocation(line: 506, column: 2, scope: !481)
!487 = !DILocation(line: 508, column: 3, scope: !488)
!488 = distinct !DILexicalBlock(scope: !477, file: !3, line: 506, column: 9)
!489 = !DILocation(line: 508, column: 13, scope: !488)
!490 = !DILocation(line: 511, column: 1, scope: !406)
!491 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 527, type: !98, scopeLine: 528, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!492 = !DILocalVariable(name: "d", scope: !491, file: !3, line: 529, type: !171)
!493 = !DILocation(line: 529, column: 6, scope: !491)
!494 = !DILocation(line: 531, column: 4, scope: !491)
!495 = !DILocation(line: 532, column: 2, scope: !491)
!496 = !DILocation(line: 533, column: 4, scope: !497)
!497 = distinct !DILexicalBlock(scope: !491, file: !3, line: 532, column: 5)
!498 = !DILocation(line: 534, column: 2, scope: !497)
!499 = !DILocation(line: 534, column: 11, scope: !491)
!500 = !DILocation(line: 534, column: 23, scope: !491)
!501 = !DILocation(line: 534, column: 26, scope: !491)
!502 = !DILocation(line: 534, column: 31, scope: !491)
!503 = !DILocation(line: 534, column: 34, scope: !491)
!504 = !DILocation(line: 534, column: 36, scope: !491)
!505 = !DILocation(line: 0, scope: !491)
!506 = distinct !{!506, !495, !507}
!507 = !DILocation(line: 534, column: 39, scope: !491)
!508 = !DILocation(line: 536, column: 6, scope: !509)
!509 = distinct !DILexicalBlock(scope: !491, file: !3, line: 536, column: 6)
!510 = !DILocation(line: 536, column: 18, scope: !509)
!511 = !DILocation(line: 536, column: 21, scope: !509)
!512 = !DILocation(line: 536, column: 6, scope: !491)
!513 = !DILocation(line: 537, column: 3, scope: !514)
!514 = distinct !DILexicalBlock(scope: !509, file: !3, line: 536, column: 27)
!515 = !DILocation(line: 537, column: 13, scope: !514)
!516 = !DILocation(line: 538, column: 3, scope: !514)
!517 = !DILocation(line: 542, column: 15, scope: !491)
!518 = !DILocation(line: 542, column: 2, scope: !491)
!519 = !DILocation(line: 542, column: 13, scope: !491)
!520 = !DILocation(line: 544, column: 2, scope: !491)
!521 = !DILocation(line: 544, column: 12, scope: !491)
!522 = !DILocation(line: 546, column: 1, scope: !491)
!523 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 562, type: !98, scopeLine: 563, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!524 = !DILocalVariable(name: "i", scope: !523, file: !3, line: 564, type: !171)
!525 = !DILocation(line: 564, column: 6, scope: !523)
!526 = !DILocalVariable(name: "m", scope: !523, file: !3, line: 565, type: !6)
!527 = !DILocation(line: 565, column: 11, scope: !523)
!528 = !DILocalVariable(name: "n", scope: !523, file: !3, line: 565, type: !6)
!529 = !DILocation(line: 565, column: 14, scope: !523)
!530 = !DILocalVariable(name: "d", scope: !523, file: !3, line: 565, type: !6)
!531 = !DILocation(line: 565, column: 17, scope: !523)
!532 = !DILocalVariable(name: "normalizable", scope: !523, file: !3, line: 566, type: !533)
!533 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!534 = !DILocation(line: 566, column: 7, scope: !523)
!535 = !DILocation(line: 568, column: 15, scope: !523)
!536 = !DILocation(line: 568, column: 26, scope: !523)
!537 = !DILocation(line: 568, column: 30, scope: !523)
!538 = !DILocation(line: 568, column: 2, scope: !523)
!539 = !DILocation(line: 568, column: 13, scope: !523)
!540 = !DILocation(line: 570, column: 11, scope: !541)
!541 = distinct !DILexicalBlock(scope: !523, file: !3, line: 570, column: 2)
!542 = !DILocation(line: 570, column: 9, scope: !541)
!543 = !DILocation(line: 570, column: 7, scope: !541)
!544 = !DILocation(line: 570, column: 23, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !3, line: 570, column: 2)
!546 = !DILocation(line: 570, column: 25, scope: !545)
!547 = !DILocation(line: 570, column: 2, scope: !541)
!548 = !DILocation(line: 572, column: 7, scope: !549)
!549 = distinct !DILexicalBlock(scope: !550, file: !3, line: 572, column: 7)
!550 = distinct !DILexicalBlock(scope: !545, file: !3, line: 570, column: 36)
!551 = !DILocation(line: 572, column: 19, scope: !549)
!552 = !DILocation(line: 572, column: 24, scope: !549)
!553 = !DILocation(line: 572, column: 36, scope: !549)
!554 = !DILocation(line: 572, column: 38, scope: !549)
!555 = !DILocation(line: 572, column: 37, scope: !549)
!556 = !DILocation(line: 572, column: 22, scope: !549)
!557 = !DILocation(line: 572, column: 7, scope: !550)
!558 = !DILocation(line: 573, column: 4, scope: !559)
!559 = distinct !DILexicalBlock(scope: !549, file: !3, line: 572, column: 51)
!560 = !DILocation(line: 574, column: 14, scope: !561)
!561 = distinct !DILexicalBlock(scope: !549, file: !3, line: 574, column: 14)
!562 = !DILocation(line: 574, column: 26, scope: !561)
!563 = !DILocation(line: 574, column: 31, scope: !561)
!564 = !DILocation(line: 574, column: 43, scope: !561)
!565 = !DILocation(line: 574, column: 45, scope: !561)
!566 = !DILocation(line: 574, column: 44, scope: !561)
!567 = !DILocation(line: 574, column: 29, scope: !561)
!568 = !DILocation(line: 574, column: 14, scope: !549)
!569 = !DILocation(line: 575, column: 17, scope: !570)
!570 = distinct !DILexicalBlock(scope: !561, file: !3, line: 574, column: 58)
!571 = !DILocation(line: 576, column: 4, scope: !570)
!572 = !DILocation(line: 578, column: 2, scope: !550)
!573 = !DILocation(line: 570, column: 31, scope: !545)
!574 = !DILocation(line: 570, column: 2, scope: !545)
!575 = distinct !{!575, !547, !576}
!576 = !DILocation(line: 578, column: 2, scope: !541)
!577 = !DILocation(line: 580, column: 7, scope: !578)
!578 = distinct !DILexicalBlock(scope: !523, file: !3, line: 580, column: 6)
!579 = !DILocation(line: 580, column: 20, scope: !578)
!580 = !DILocation(line: 580, column: 23, scope: !578)
!581 = !DILocation(line: 580, column: 34, scope: !578)
!582 = !DILocation(line: 580, column: 6, scope: !523)
!583 = !DILocation(line: 582, column: 3, scope: !584)
!584 = distinct !DILexicalBlock(scope: !578, file: !3, line: 580, column: 53)
!585 = !DILocation(line: 582, column: 13, scope: !584)
!586 = !DILocation(line: 584, column: 2, scope: !584)
!587 = !DILocation(line: 586, column: 6, scope: !588)
!588 = distinct !DILexicalBlock(scope: !523, file: !3, line: 586, column: 6)
!589 = !DILocation(line: 586, column: 6, scope: !523)
!590 = !DILocation(line: 587, column: 3, scope: !591)
!591 = distinct !DILexicalBlock(scope: !588, file: !3, line: 586, column: 20)
!592 = !DILocation(line: 587, column: 13, scope: !591)
!593 = !DILocation(line: 589, column: 2, scope: !591)
!594 = !DILocation(line: 590, column: 3, scope: !595)
!595 = distinct !DILexicalBlock(scope: !588, file: !3, line: 589, column: 9)
!596 = !DILocation(line: 590, column: 13, scope: !595)
!597 = !DILocation(line: 593, column: 1, scope: !523)
!598 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 609, type: !98, scopeLine: 610, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!599 = !DILocalVariable(name: "m", scope: !598, file: !3, line: 611, type: !37)
!600 = !DILocation(line: 611, column: 10, scope: !598)
!601 = !DILocalVariable(name: "n", scope: !598, file: !3, line: 611, type: !37)
!602 = !DILocation(line: 611, column: 13, scope: !598)
!603 = !DILocalVariable(name: "d", scope: !598, file: !3, line: 611, type: !37)
!604 = !DILocation(line: 611, column: 16, scope: !598)
!605 = !DILocalVariable(name: "s", scope: !598, file: !3, line: 611, type: !37)
!606 = !DILocation(line: 611, column: 19, scope: !598)
!607 = !DILocalVariable(name: "borrow", scope: !598, file: !3, line: 612, type: !6)
!608 = !DILocation(line: 612, column: 11, scope: !598)
!609 = !DILocalVariable(name: "i", scope: !598, file: !3, line: 614, type: !171)
!610 = !DILocation(line: 614, column: 6, scope: !598)
!611 = !DILocation(line: 616, column: 9, scope: !598)
!612 = !DILocation(line: 617, column: 9, scope: !613)
!613 = distinct !DILexicalBlock(scope: !598, file: !3, line: 617, column: 2)
!614 = !DILocation(line: 617, column: 7, scope: !613)
!615 = !DILocation(line: 617, column: 14, scope: !616)
!616 = distinct !DILexicalBlock(scope: !613, file: !3, line: 617, column: 2)
!617 = !DILocation(line: 617, column: 16, scope: !616)
!618 = !DILocation(line: 617, column: 2, scope: !613)
!619 = !DILocation(line: 618, column: 7, scope: !620)
!620 = distinct !DILexicalBlock(scope: !616, file: !3, line: 617, column: 35)
!621 = !DILocation(line: 618, column: 19, scope: !620)
!622 = !DILocation(line: 618, column: 23, scope: !620)
!623 = !DILocation(line: 618, column: 21, scope: !620)
!624 = !DILocation(line: 618, column: 5, scope: !620)
!625 = !DILocation(line: 619, column: 7, scope: !620)
!626 = !DILocation(line: 619, column: 19, scope: !620)
!627 = !DILocation(line: 619, column: 5, scope: !620)
!628 = !DILocation(line: 621, column: 7, scope: !620)
!629 = !DILocation(line: 621, column: 11, scope: !620)
!630 = !DILocation(line: 621, column: 9, scope: !620)
!631 = !DILocation(line: 621, column: 5, scope: !620)
!632 = !DILocation(line: 622, column: 7, scope: !633)
!633 = distinct !DILexicalBlock(scope: !620, file: !3, line: 622, column: 7)
!634 = !DILocation(line: 622, column: 11, scope: !633)
!635 = !DILocation(line: 622, column: 9, scope: !633)
!636 = !DILocation(line: 622, column: 7, scope: !620)
!637 = !DILocation(line: 623, column: 6, scope: !638)
!638 = distinct !DILexicalBlock(scope: !633, file: !3, line: 622, column: 14)
!639 = !DILocation(line: 624, column: 11, scope: !638)
!640 = !DILocation(line: 625, column: 3, scope: !638)
!641 = !DILocation(line: 626, column: 11, scope: !642)
!642 = distinct !DILexicalBlock(scope: !633, file: !3, line: 625, column: 10)
!643 = !DILocation(line: 628, column: 7, scope: !620)
!644 = !DILocation(line: 628, column: 11, scope: !620)
!645 = !DILocation(line: 628, column: 9, scope: !620)
!646 = !DILocation(line: 628, column: 5, scope: !620)
!647 = !DILocation(line: 630, column: 34, scope: !620)
!648 = !DILocation(line: 630, column: 3, scope: !620)
!649 = !DILocation(line: 630, column: 16, scope: !620)
!650 = !DILocation(line: 630, column: 20, scope: !620)
!651 = !DILocation(line: 630, column: 18, scope: !620)
!652 = !DILocation(line: 630, column: 32, scope: !620)
!653 = !DILocation(line: 631, column: 2, scope: !620)
!654 = !DILocation(line: 617, column: 30, scope: !616)
!655 = !DILocation(line: 617, column: 2, scope: !616)
!656 = distinct !{!656, !618, !657}
!657 = !DILocation(line: 631, column: 2, scope: !613)
!658 = !DILocation(line: 633, column: 6, scope: !659)
!659 = distinct !DILexicalBlock(scope: !598, file: !3, line: 633, column: 6)
!660 = !DILocation(line: 633, column: 17, scope: !659)
!661 = !DILocation(line: 633, column: 6, scope: !598)
!662 = !DILocation(line: 635, column: 2, scope: !663)
!663 = distinct !DILexicalBlock(scope: !659, file: !3, line: 633, column: 22)
!664 = !DILocation(line: 637, column: 3, scope: !665)
!665 = distinct !DILexicalBlock(scope: !659, file: !3, line: 635, column: 9)
!666 = !DILocation(line: 637, column: 13, scope: !665)
!667 = !DILocation(line: 641, column: 1, scope: !598)
!668 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 657, type: !98, scopeLine: 658, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!669 = !DILocation(line: 660, column: 16, scope: !668)
!670 = !DILocation(line: 660, column: 44, scope: !668)
!671 = !DILocation(line: 660, column: 61, scope: !668)
!672 = !DILocation(line: 660, column: 59, scope: !668)
!673 = !DILocation(line: 660, column: 2, scope: !668)
!674 = !DILocation(line: 660, column: 12, scope: !668)
!675 = !DILocation(line: 663, column: 1, scope: !668)
!676 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 679, type: !98, scopeLine: 680, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!677 = !DILocalVariable(name: "m_n", scope: !676, file: !3, line: 681, type: !37)
!678 = !DILocation(line: 681, column: 10, scope: !676)
!679 = !DILocalVariable(name: "q", scope: !676, file: !3, line: 681, type: !37)
!680 = !DILocation(line: 681, column: 15, scope: !676)
!681 = !DILocalVariable(name: "qn", scope: !676, file: !3, line: 682, type: !7)
!682 = !DILocation(line: 682, column: 11, scope: !676)
!683 = !DILocalVariable(name: "n_q", scope: !676, file: !3, line: 682, type: !7)
!684 = !DILocation(line: 682, column: 15, scope: !676)
!685 = !DILocation(line: 684, column: 6, scope: !686)
!686 = distinct !DILexicalBlock(scope: !676, file: !3, line: 684, column: 6)
!687 = !DILocation(line: 684, column: 18, scope: !686)
!688 = !DILocation(line: 684, column: 33, scope: !686)
!689 = !DILocation(line: 684, column: 30, scope: !686)
!690 = !DILocation(line: 684, column: 6, scope: !676)
!691 = !DILocation(line: 685, column: 3, scope: !692)
!692 = distinct !DILexicalBlock(scope: !686, file: !3, line: 684, column: 62)
!693 = !DILocation(line: 685, column: 16, scope: !692)
!694 = !DILocation(line: 686, column: 2, scope: !692)
!695 = !DILocation(line: 687, column: 20, scope: !696)
!696 = distinct !DILexicalBlock(scope: !686, file: !3, line: 686, column: 9)
!697 = !DILocation(line: 687, column: 32, scope: !696)
!698 = !DILocation(line: 687, column: 44, scope: !696)
!699 = !DILocation(line: 687, column: 61, scope: !696)
!700 = !DILocation(line: 687, column: 73, scope: !696)
!701 = !DILocation(line: 687, column: 83, scope: !696)
!702 = !DILocation(line: 687, column: 89, scope: !696)
!703 = !DILocation(line: 687, column: 87, scope: !696)
!704 = !DILocation(line: 687, column: 59, scope: !696)
!705 = !DILocation(line: 687, column: 3, scope: !696)
!706 = !DILocation(line: 687, column: 16, scope: !696)
!707 = !DILocation(line: 690, column: 19, scope: !676)
!708 = !DILocation(line: 690, column: 31, scope: !676)
!709 = !DILocation(line: 690, column: 9, scope: !676)
!710 = !DILocation(line: 690, column: 43, scope: !676)
!711 = !DILocation(line: 690, column: 67, scope: !676)
!712 = !DILocation(line: 690, column: 79, scope: !676)
!713 = !DILocation(line: 690, column: 90, scope: !676)
!714 = !DILocation(line: 690, column: 95, scope: !676)
!715 = !DILocation(line: 690, column: 66, scope: !676)
!716 = !DILocation(line: 690, column: 64, scope: !676)
!717 = !DILocation(line: 690, column: 112, scope: !676)
!718 = !DILocation(line: 690, column: 124, scope: !676)
!719 = !DILocation(line: 690, column: 135, scope: !676)
!720 = !DILocation(line: 690, column: 110, scope: !676)
!721 = !DILocation(line: 690, column: 6, scope: !676)
!722 = !DILocation(line: 692, column: 2, scope: !676)
!723 = !DILocation(line: 692, column: 14, scope: !676)
!724 = !DILocation(line: 693, column: 2, scope: !676)
!725 = !DILocation(line: 694, column: 3, scope: !726)
!726 = distinct !DILexicalBlock(scope: !676, file: !3, line: 693, column: 5)
!727 = !DILocation(line: 694, column: 15, scope: !726)
!728 = !DILocation(line: 695, column: 15, scope: !726)
!729 = !DILocation(line: 695, column: 26, scope: !726)
!730 = !DILocation(line: 695, column: 8, scope: !726)
!731 = !DILocation(line: 695, column: 6, scope: !726)
!732 = !DILocation(line: 697, column: 2, scope: !726)
!733 = !DILocation(line: 697, column: 11, scope: !676)
!734 = !DILocation(line: 697, column: 16, scope: !676)
!735 = !DILocation(line: 697, column: 14, scope: !676)
!736 = distinct !{!736, !724, !737}
!737 = !DILocation(line: 697, column: 19, scope: !676)
!738 = !DILocation(line: 700, column: 2, scope: !676)
!739 = !DILocation(line: 700, column: 12, scope: !676)
!740 = !DILocation(line: 703, column: 1, scope: !676)
!741 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 719, type: !98, scopeLine: 720, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!742 = !DILocalVariable(name: "i", scope: !741, file: !3, line: 721, type: !171)
!743 = !DILocation(line: 721, column: 6, scope: !741)
!744 = !DILocalVariable(name: "m", scope: !741, file: !3, line: 722, type: !37)
!745 = !DILocation(line: 722, column: 10, scope: !741)
!746 = !DILocalVariable(name: "n", scope: !741, file: !3, line: 722, type: !37)
!747 = !DILocation(line: 722, column: 13, scope: !741)
!748 = !DILocalVariable(name: "c", scope: !741, file: !3, line: 723, type: !6)
!749 = !DILocation(line: 723, column: 11, scope: !741)
!750 = !DILocalVariable(name: "offset", scope: !741, file: !3, line: 723, type: !6)
!751 = !DILocation(line: 723, column: 14, scope: !741)
!752 = !DILocation(line: 725, column: 11, scope: !741)
!753 = !DILocation(line: 725, column: 22, scope: !741)
!754 = !DILocation(line: 725, column: 26, scope: !741)
!755 = !DILocation(line: 725, column: 9, scope: !741)
!756 = !DILocation(line: 727, column: 9, scope: !757)
!757 = distinct !DILexicalBlock(scope: !741, file: !3, line: 727, column: 2)
!758 = !DILocation(line: 727, column: 7, scope: !757)
!759 = !DILocation(line: 727, column: 14, scope: !760)
!760 = distinct !DILexicalBlock(scope: !757, file: !3, line: 727, column: 2)
!761 = !DILocation(line: 727, column: 18, scope: !760)
!762 = !DILocation(line: 727, column: 16, scope: !760)
!763 = !DILocation(line: 727, column: 2, scope: !757)
!764 = !DILocation(line: 728, column: 3, scope: !765)
!765 = distinct !DILexicalBlock(scope: !760, file: !3, line: 727, column: 31)
!766 = !DILocation(line: 728, column: 16, scope: !765)
!767 = !DILocation(line: 728, column: 19, scope: !765)
!768 = !DILocation(line: 729, column: 2, scope: !765)
!769 = !DILocation(line: 727, column: 26, scope: !760)
!770 = !DILocation(line: 727, column: 2, scope: !760)
!771 = distinct !{!771, !763, !772}
!772 = !DILocation(line: 729, column: 2, scope: !757)
!773 = !DILocation(line: 730, column: 4, scope: !741)
!774 = !DILocation(line: 731, column: 11, scope: !775)
!775 = distinct !DILexicalBlock(scope: !741, file: !3, line: 731, column: 2)
!776 = !DILocation(line: 731, column: 9, scope: !775)
!777 = !DILocation(line: 731, column: 7, scope: !775)
!778 = !DILocation(line: 731, column: 19, scope: !779)
!779 = distinct !DILexicalBlock(scope: !775, file: !3, line: 731, column: 2)
!780 = !DILocation(line: 731, column: 21, scope: !779)
!781 = !DILocation(line: 731, column: 2, scope: !775)
!782 = !DILocation(line: 733, column: 7, scope: !783)
!783 = distinct !DILexicalBlock(scope: !779, file: !3, line: 731, column: 44)
!784 = !DILocation(line: 733, column: 5, scope: !783)
!785 = !DILocation(line: 734, column: 7, scope: !786)
!786 = distinct !DILexicalBlock(scope: !783, file: !3, line: 734, column: 7)
!787 = !DILocation(line: 734, column: 11, scope: !786)
!788 = !DILocation(line: 734, column: 18, scope: !786)
!789 = !DILocation(line: 734, column: 9, scope: !786)
!790 = !DILocation(line: 734, column: 7, scope: !783)
!791 = !DILocation(line: 735, column: 8, scope: !792)
!792 = distinct !DILexicalBlock(scope: !786, file: !3, line: 734, column: 32)
!793 = !DILocation(line: 735, column: 20, scope: !792)
!794 = !DILocation(line: 735, column: 24, scope: !792)
!795 = !DILocation(line: 735, column: 22, scope: !792)
!796 = !DILocation(line: 735, column: 6, scope: !792)
!797 = !DILocation(line: 737, column: 9, scope: !792)
!798 = !DILocation(line: 737, column: 24, scope: !792)
!799 = !DILocation(line: 737, column: 22, scope: !792)
!800 = !DILocation(line: 737, column: 6, scope: !792)
!801 = !DILocation(line: 738, column: 3, scope: !792)
!802 = !DILocation(line: 739, column: 6, scope: !803)
!803 = distinct !DILexicalBlock(scope: !786, file: !3, line: 738, column: 10)
!804 = !DILocation(line: 744, column: 7, scope: !783)
!805 = !DILocation(line: 744, column: 9, scope: !783)
!806 = !DILocation(line: 744, column: 5, scope: !783)
!807 = !DILocation(line: 745, column: 5, scope: !783)
!808 = !DILocation(line: 747, column: 21, scope: !783)
!809 = !DILocation(line: 747, column: 3, scope: !783)
!810 = !DILocation(line: 747, column: 16, scope: !783)
!811 = !DILocation(line: 747, column: 19, scope: !783)
!812 = !DILocation(line: 749, column: 2, scope: !783)
!813 = !DILocation(line: 731, column: 39, scope: !779)
!814 = !DILocation(line: 731, column: 2, scope: !779)
!815 = distinct !{!815, !781, !816}
!816 = !DILocation(line: 749, column: 2, scope: !775)
!817 = !DILocation(line: 752, column: 1, scope: !741)
!818 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 768, type: !98, scopeLine: 769, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!819 = !DILocalVariable(name: "i", scope: !818, file: !3, line: 770, type: !171)
!820 = !DILocation(line: 770, column: 6, scope: !818)
!821 = !DILocalVariable(name: "relation", scope: !818, file: !3, line: 771, type: !822)
!822 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!823 = !DILocation(line: 771, column: 7, scope: !818)
!824 = !DILocation(line: 773, column: 9, scope: !825)
!825 = distinct !DILexicalBlock(scope: !818, file: !3, line: 773, column: 2)
!826 = !DILocation(line: 773, column: 7, scope: !825)
!827 = !DILocation(line: 773, column: 31, scope: !828)
!828 = distinct !DILexicalBlock(scope: !825, file: !3, line: 773, column: 2)
!829 = !DILocation(line: 773, column: 33, scope: !828)
!830 = !DILocation(line: 773, column: 2, scope: !825)
!831 = !DILocation(line: 775, column: 7, scope: !832)
!832 = distinct !DILexicalBlock(scope: !833, file: !3, line: 775, column: 7)
!833 = distinct !DILexicalBlock(scope: !828, file: !3, line: 773, column: 44)
!834 = !DILocation(line: 775, column: 19, scope: !832)
!835 = !DILocation(line: 775, column: 24, scope: !832)
!836 = !DILocation(line: 775, column: 37, scope: !832)
!837 = !DILocation(line: 775, column: 22, scope: !832)
!838 = !DILocation(line: 775, column: 7, scope: !833)
!839 = !DILocation(line: 776, column: 13, scope: !840)
!840 = distinct !DILexicalBlock(scope: !832, file: !3, line: 775, column: 41)
!841 = !DILocation(line: 777, column: 4, scope: !840)
!842 = !DILocation(line: 778, column: 14, scope: !843)
!843 = distinct !DILexicalBlock(scope: !832, file: !3, line: 778, column: 14)
!844 = !DILocation(line: 778, column: 26, scope: !843)
!845 = !DILocation(line: 778, column: 31, scope: !843)
!846 = !DILocation(line: 778, column: 44, scope: !843)
!847 = !DILocation(line: 778, column: 29, scope: !843)
!848 = !DILocation(line: 778, column: 14, scope: !832)
!849 = !DILocation(line: 779, column: 13, scope: !850)
!850 = distinct !DILexicalBlock(scope: !843, file: !3, line: 778, column: 48)
!851 = !DILocation(line: 780, column: 4, scope: !850)
!852 = !DILocation(line: 782, column: 2, scope: !833)
!853 = !DILocation(line: 773, column: 39, scope: !828)
!854 = !DILocation(line: 773, column: 2, scope: !828)
!855 = distinct !{!855, !830, !856}
!856 = !DILocation(line: 782, column: 2, scope: !825)
!857 = !DILocation(line: 784, column: 6, scope: !858)
!858 = distinct !DILexicalBlock(scope: !818, file: !3, line: 784, column: 6)
!859 = !DILocation(line: 784, column: 15, scope: !858)
!860 = !DILocation(line: 784, column: 6, scope: !818)
!861 = !DILocation(line: 785, column: 3, scope: !862)
!862 = distinct !DILexicalBlock(scope: !858, file: !3, line: 784, column: 23)
!863 = !DILocation(line: 785, column: 13, scope: !862)
!864 = !DILocation(line: 787, column: 2, scope: !862)
!865 = !DILocation(line: 788, column: 3, scope: !866)
!866 = distinct !DILexicalBlock(scope: !858, file: !3, line: 787, column: 9)
!867 = !DILocation(line: 788, column: 13, scope: !866)
!868 = !DILocation(line: 791, column: 1, scope: !818)
!869 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 807, type: !98, scopeLine: 808, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!870 = !DILocalVariable(name: "i", scope: !869, file: !3, line: 809, type: !171)
!871 = !DILocation(line: 809, column: 6, scope: !869)
!872 = !DILocalVariable(name: "j", scope: !869, file: !3, line: 809, type: !171)
!873 = !DILocation(line: 809, column: 9, scope: !869)
!874 = !DILocalVariable(name: "m", scope: !869, file: !3, line: 810, type: !37)
!875 = !DILocation(line: 810, column: 10, scope: !869)
!876 = !DILocalVariable(name: "n", scope: !869, file: !3, line: 810, type: !37)
!877 = !DILocation(line: 810, column: 13, scope: !869)
!878 = !DILocalVariable(name: "c", scope: !869, file: !3, line: 810, type: !37)
!879 = !DILocation(line: 810, column: 16, scope: !869)
!880 = !DILocalVariable(name: "offset", scope: !869, file: !3, line: 811, type: !6)
!881 = !DILocation(line: 811, column: 11, scope: !869)
!882 = !DILocation(line: 812, column: 11, scope: !869)
!883 = !DILocation(line: 812, column: 22, scope: !869)
!884 = !DILocation(line: 812, column: 26, scope: !869)
!885 = !DILocation(line: 812, column: 9, scope: !869)
!886 = !DILocation(line: 813, column: 4, scope: !869)
!887 = !DILocation(line: 814, column: 11, scope: !888)
!888 = distinct !DILexicalBlock(scope: !869, file: !3, line: 814, column: 2)
!889 = !DILocation(line: 814, column: 9, scope: !888)
!890 = !DILocation(line: 814, column: 7, scope: !888)
!891 = !DILocation(line: 814, column: 19, scope: !892)
!892 = distinct !DILexicalBlock(scope: !888, file: !3, line: 814, column: 2)
!893 = !DILocation(line: 814, column: 21, scope: !892)
!894 = !DILocation(line: 814, column: 2, scope: !888)
!895 = !DILocation(line: 815, column: 7, scope: !896)
!896 = distinct !DILexicalBlock(scope: !892, file: !3, line: 814, column: 44)
!897 = !DILocation(line: 815, column: 19, scope: !896)
!898 = !DILocation(line: 815, column: 5, scope: !896)
!899 = !DILocation(line: 817, column: 7, scope: !896)
!900 = !DILocation(line: 817, column: 11, scope: !896)
!901 = !DILocation(line: 817, column: 9, scope: !896)
!902 = !DILocation(line: 817, column: 5, scope: !896)
!903 = !DILocation(line: 819, column: 7, scope: !904)
!904 = distinct !DILexicalBlock(scope: !896, file: !3, line: 819, column: 7)
!905 = !DILocation(line: 819, column: 11, scope: !904)
!906 = !DILocation(line: 819, column: 18, scope: !904)
!907 = !DILocation(line: 819, column: 9, scope: !904)
!908 = !DILocation(line: 819, column: 7, scope: !896)
!909 = !DILocation(line: 820, column: 8, scope: !910)
!910 = distinct !DILexicalBlock(scope: !904, file: !3, line: 819, column: 32)
!911 = !DILocation(line: 820, column: 20, scope: !910)
!912 = !DILocation(line: 820, column: 6, scope: !910)
!913 = !DILocation(line: 821, column: 3, scope: !910)
!914 = !DILocation(line: 822, column: 6, scope: !915)
!915 = distinct !DILexicalBlock(scope: !904, file: !3, line: 821, column: 10)
!916 = !DILocation(line: 823, column: 6, scope: !915)
!917 = !DILocation(line: 826, column: 20, scope: !896)
!918 = !DILocation(line: 826, column: 24, scope: !896)
!919 = !DILocation(line: 826, column: 22, scope: !896)
!920 = !DILocation(line: 826, column: 28, scope: !896)
!921 = !DILocation(line: 826, column: 26, scope: !896)
!922 = !DILocation(line: 826, column: 3, scope: !896)
!923 = !DILocation(line: 826, column: 15, scope: !896)
!924 = !DILocation(line: 826, column: 18, scope: !896)
!925 = !DILocation(line: 828, column: 7, scope: !896)
!926 = !DILocation(line: 828, column: 19, scope: !896)
!927 = !DILocation(line: 828, column: 22, scope: !896)
!928 = !DILocation(line: 828, column: 5, scope: !896)
!929 = !DILocation(line: 829, column: 3, scope: !896)
!930 = !DILocation(line: 829, column: 15, scope: !896)
!931 = !DILocation(line: 829, column: 18, scope: !896)
!932 = !DILocation(line: 830, column: 2, scope: !896)
!933 = !DILocation(line: 814, column: 39, scope: !892)
!934 = !DILocation(line: 814, column: 2, scope: !892)
!935 = distinct !{!935, !894, !936}
!936 = !DILocation(line: 830, column: 2, scope: !888)
!937 = !DILocation(line: 834, column: 1, scope: !869)
!938 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 850, type: !98, scopeLine: 851, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!939 = !DILocalVariable(name: "i", scope: !938, file: !3, line: 852, type: !171)
!940 = !DILocation(line: 852, column: 6, scope: !938)
!941 = !DILocalVariable(name: "m", scope: !938, file: !3, line: 853, type: !37)
!942 = !DILocation(line: 853, column: 10, scope: !938)
!943 = !DILocalVariable(name: "s", scope: !938, file: !3, line: 853, type: !37)
!944 = !DILocation(line: 853, column: 13, scope: !938)
!945 = !DILocalVariable(name: "qn", scope: !938, file: !3, line: 853, type: !37)
!946 = !DILocation(line: 853, column: 16, scope: !938)
!947 = !DILocalVariable(name: "borrow", scope: !938, file: !3, line: 854, type: !6)
!948 = !DILocation(line: 854, column: 11, scope: !938)
!949 = !DILocalVariable(name: "offset", scope: !938, file: !3, line: 854, type: !6)
!950 = !DILocation(line: 854, column: 19, scope: !938)
!951 = !DILocation(line: 856, column: 11, scope: !938)
!952 = !DILocation(line: 856, column: 22, scope: !938)
!953 = !DILocation(line: 856, column: 26, scope: !938)
!954 = !DILocation(line: 856, column: 9, scope: !938)
!955 = !DILocation(line: 858, column: 9, scope: !938)
!956 = !DILocation(line: 859, column: 9, scope: !957)
!957 = distinct !DILexicalBlock(scope: !938, file: !3, line: 859, column: 2)
!958 = !DILocation(line: 859, column: 7, scope: !957)
!959 = !DILocation(line: 859, column: 14, scope: !960)
!960 = distinct !DILexicalBlock(scope: !957, file: !3, line: 859, column: 2)
!961 = !DILocation(line: 859, column: 16, scope: !960)
!962 = !DILocation(line: 859, column: 2, scope: !957)
!963 = !DILocation(line: 860, column: 7, scope: !964)
!964 = distinct !DILexicalBlock(scope: !960, file: !3, line: 859, column: 39)
!965 = !DILocation(line: 860, column: 19, scope: !964)
!966 = !DILocation(line: 860, column: 5, scope: !964)
!967 = !DILocation(line: 862, column: 7, scope: !968)
!968 = distinct !DILexicalBlock(scope: !964, file: !3, line: 862, column: 7)
!969 = !DILocation(line: 862, column: 12, scope: !968)
!970 = !DILocation(line: 862, column: 9, scope: !968)
!971 = !DILocation(line: 862, column: 7, scope: !964)
!972 = !DILocation(line: 863, column: 9, scope: !973)
!973 = distinct !DILexicalBlock(scope: !968, file: !3, line: 862, column: 20)
!974 = !DILocation(line: 863, column: 22, scope: !973)
!975 = !DILocation(line: 863, column: 7, scope: !973)
!976 = !DILocation(line: 865, column: 8, scope: !973)
!977 = !DILocation(line: 865, column: 13, scope: !973)
!978 = !DILocation(line: 865, column: 11, scope: !973)
!979 = !DILocation(line: 865, column: 6, scope: !973)
!980 = !DILocation(line: 866, column: 8, scope: !981)
!981 = distinct !DILexicalBlock(scope: !973, file: !3, line: 866, column: 8)
!982 = !DILocation(line: 866, column: 12, scope: !981)
!983 = !DILocation(line: 866, column: 10, scope: !981)
!984 = !DILocation(line: 866, column: 8, scope: !973)
!985 = !DILocation(line: 867, column: 7, scope: !986)
!986 = distinct !DILexicalBlock(scope: !981, file: !3, line: 866, column: 15)
!987 = !DILocation(line: 868, column: 12, scope: !986)
!988 = !DILocation(line: 869, column: 4, scope: !986)
!989 = !DILocation(line: 870, column: 12, scope: !990)
!990 = distinct !DILexicalBlock(scope: !981, file: !3, line: 869, column: 11)
!991 = !DILocation(line: 872, column: 21, scope: !973)
!992 = !DILocation(line: 872, column: 25, scope: !973)
!993 = !DILocation(line: 872, column: 23, scope: !973)
!994 = !DILocation(line: 872, column: 4, scope: !973)
!995 = !DILocation(line: 872, column: 16, scope: !973)
!996 = !DILocation(line: 872, column: 19, scope: !973)
!997 = !DILocation(line: 873, column: 3, scope: !973)
!998 = !DILocation(line: 874, column: 2, scope: !964)
!999 = !DILocation(line: 859, column: 34, scope: !960)
!1000 = !DILocation(line: 859, column: 2, scope: !960)
!1001 = distinct !{!1001, !962, !1002}
!1002 = !DILocation(line: 874, column: 2, scope: !957)
!1003 = !DILocation(line: 876, column: 6, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !938, file: !3, line: 876, column: 6)
!1005 = !DILocation(line: 876, column: 17, scope: !1004)
!1006 = !DILocation(line: 876, column: 21, scope: !1004)
!1007 = !DILocation(line: 876, column: 6, scope: !938)
!1008 = !DILocation(line: 878, column: 2, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1004, file: !3, line: 876, column: 35)
!1010 = !DILocation(line: 882, column: 1, scope: !938)
!1011 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 884, type: !98, scopeLine: 884, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1012 = !DILocation(line: 886, column: 1, scope: !1011)
!1013 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 888, type: !98, scopeLine: 888, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1014 = !DILocation(line: 890, column: 2, scope: !1013)
!1015 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 894, type: !1016, scopeLine: 894, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{!171}
!1018 = !DILocation(line: 896, column: 16, scope: !1015)
!1019 = !DILocation(line: 897, column: 10, scope: !1015)
!1020 = !DILocation(line: 898, column: 12, scope: !1015)
!1021 = !DILocation(line: 899, column: 5, scope: !1015)
!1022 = !DILocation(line: 901, column: 5, scope: !1015)
!1023 = !DILocation(line: 903, column: 6, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1015, file: !3, line: 901, column: 15)
!1025 = !DILocation(line: 904, column: 6, scope: !1024)
!1026 = !DILocation(line: 904, column: 6, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 904, column: 6)
!1028 = distinct !DILexicalBlock(scope: !1024, file: !3, line: 904, column: 6)
!1029 = !DILocation(line: 904, column: 6, scope: !1028)
!1030 = !DILocation(line: 904, column: 6, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1027, file: !3, line: 904, column: 6)
!1032 = !DILocalVariable(name: "__x", scope: !1033, file: !3, line: 904, type: !6)
!1033 = distinct !DILexicalBlock(scope: !1031, file: !3, line: 904, column: 6)
!1034 = !DILocation(line: 904, column: 6, scope: !1033)
!1035 = !{i32 -2146688415}
!1036 = !DILocalVariable(name: "__x", scope: !1037, file: !3, line: 904, type: !6)
!1037 = distinct !DILexicalBlock(scope: !1031, file: !3, line: 904, column: 6)
!1038 = !DILocation(line: 904, column: 6, scope: !1037)
!1039 = !{i32 -2146688290}
!1040 = !DILocation(line: 904, column: 6, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1027, file: !3, line: 904, column: 6)
!1042 = !DILocalVariable(name: "__x", scope: !1043, file: !3, line: 904, type: !6)
!1043 = distinct !DILexicalBlock(scope: !1041, file: !3, line: 904, column: 6)
!1044 = !DILocation(line: 904, column: 6, scope: !1043)
!1045 = !{i32 -2146688158}
!1046 = !DILocalVariable(name: "__x", scope: !1047, file: !3, line: 904, type: !6)
!1047 = distinct !DILexicalBlock(scope: !1041, file: !3, line: 904, column: 6)
!1048 = !DILocation(line: 904, column: 6, scope: !1047)
!1049 = !{i32 -2146688033}
!1050 = !DILocation(line: 906, column: 6, scope: !1024)
!1051 = !DILocation(line: 908, column: 6, scope: !1024)
!1052 = !DILocation(line: 910, column: 11, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 910, column: 11)
!1054 = distinct !DILexicalBlock(scope: !1024, file: !3, line: 908, column: 15)
!1055 = !DILocation(line: 910, column: 28, scope: !1053)
!1056 = !DILocation(line: 910, column: 33, scope: !1053)
!1057 = !DILocation(line: 910, column: 36, scope: !1053)
!1058 = !DILocation(line: 910, column: 46, scope: !1053)
!1059 = !DILocation(line: 910, column: 11, scope: !1054)
!1060 = !DILocation(line: 912, column: 8, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 910, column: 54)
!1062 = !DILocation(line: 913, column: 8, scope: !1061)
!1063 = !DILocation(line: 913, column: 8, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 913, column: 8)
!1065 = distinct !DILexicalBlock(scope: !1061, file: !3, line: 913, column: 8)
!1066 = !DILocation(line: 913, column: 8, scope: !1065)
!1067 = !DILocation(line: 913, column: 8, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 913, column: 8)
!1069 = !DILocalVariable(name: "__x", scope: !1070, file: !3, line: 913, type: !6)
!1070 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 913, column: 8)
!1071 = !DILocation(line: 913, column: 8, scope: !1070)
!1072 = !{i32 -2146685857}
!1073 = !DILocalVariable(name: "__x", scope: !1074, file: !3, line: 913, type: !6)
!1074 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 913, column: 8)
!1075 = !DILocation(line: 913, column: 8, scope: !1074)
!1076 = !{i32 -2146685732}
!1077 = !DILocation(line: 913, column: 8, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 913, column: 8)
!1079 = !DILocalVariable(name: "__x", scope: !1080, file: !3, line: 913, type: !6)
!1080 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 913, column: 8)
!1081 = !DILocation(line: 913, column: 8, scope: !1080)
!1082 = !{i32 -2146685600}
!1083 = !DILocalVariable(name: "__x", scope: !1084, file: !3, line: 913, type: !6)
!1084 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 913, column: 8)
!1085 = !DILocation(line: 913, column: 8, scope: !1084)
!1086 = !{i32 -2146685475}
!1087 = !DILocation(line: 915, column: 8, scope: !1061)
!1088 = !DILocation(line: 916, column: 4, scope: !1061)
!1089 = !DILocation(line: 918, column: 8, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 918, column: 8)
!1091 = !DILocation(line: 918, column: 18, scope: !1090)
!1092 = !DILocation(line: 918, column: 8, scope: !1054)
!1093 = !DILocation(line: 921, column: 5, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1090, file: !3, line: 918, column: 26)
!1095 = !DILocation(line: 922, column: 5, scope: !1094)
!1096 = !DILocation(line: 922, column: 5, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1098, file: !3, line: 922, column: 5)
!1098 = distinct !DILexicalBlock(scope: !1094, file: !3, line: 922, column: 5)
!1099 = !DILocation(line: 922, column: 5, scope: !1098)
!1100 = !DILocation(line: 922, column: 5, scope: !1101)
!1101 = distinct !DILexicalBlock(scope: !1097, file: !3, line: 922, column: 5)
!1102 = !DILocalVariable(name: "__x", scope: !1103, file: !3, line: 922, type: !6)
!1103 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 922, column: 5)
!1104 = !DILocation(line: 922, column: 5, scope: !1103)
!1105 = !{i32 -2146683327}
!1106 = !DILocalVariable(name: "__x", scope: !1107, file: !3, line: 922, type: !6)
!1107 = distinct !DILexicalBlock(scope: !1101, file: !3, line: 922, column: 5)
!1108 = !DILocation(line: 922, column: 5, scope: !1107)
!1109 = !{i32 -2146683202}
!1110 = !DILocation(line: 922, column: 5, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1097, file: !3, line: 922, column: 5)
!1112 = !DILocalVariable(name: "__x", scope: !1113, file: !3, line: 922, type: !6)
!1113 = distinct !DILexicalBlock(scope: !1111, file: !3, line: 922, column: 5)
!1114 = !DILocation(line: 922, column: 5, scope: !1113)
!1115 = !{i32 -2146683070}
!1116 = !DILocalVariable(name: "__x", scope: !1117, file: !3, line: 922, type: !6)
!1117 = distinct !DILexicalBlock(scope: !1111, file: !3, line: 922, column: 5)
!1118 = !DILocation(line: 922, column: 5, scope: !1117)
!1119 = !{i32 -2146682945}
!1120 = !DILocation(line: 924, column: 5, scope: !1094)
!1121 = !DILocation(line: 926, column: 4, scope: !1094)
!1122 = !DILocation(line: 948, column: 7, scope: !1054)
!1123 = !DILocation(line: 949, column: 7, scope: !1054)
!1124 = !DILocation(line: 949, column: 7, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1126, file: !3, line: 949, column: 7)
!1126 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 949, column: 7)
!1127 = !DILocation(line: 949, column: 7, scope: !1126)
!1128 = !DILocation(line: 949, column: 7, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1125, file: !3, line: 949, column: 7)
!1130 = !DILocalVariable(name: "__x", scope: !1131, file: !3, line: 949, type: !6)
!1131 = distinct !DILexicalBlock(scope: !1129, file: !3, line: 949, column: 7)
!1132 = !DILocation(line: 949, column: 7, scope: !1131)
!1133 = !{i32 -2146680821}
!1134 = !DILocalVariable(name: "__x", scope: !1135, file: !3, line: 949, type: !6)
!1135 = distinct !DILexicalBlock(scope: !1129, file: !3, line: 949, column: 7)
!1136 = !DILocation(line: 949, column: 7, scope: !1135)
!1137 = !{i32 -2146680696}
!1138 = !DILocation(line: 949, column: 7, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1125, file: !3, line: 949, column: 7)
!1140 = !DILocalVariable(name: "__x", scope: !1141, file: !3, line: 949, type: !6)
!1141 = distinct !DILexicalBlock(scope: !1139, file: !3, line: 949, column: 7)
!1142 = !DILocation(line: 949, column: 7, scope: !1141)
!1143 = !{i32 -2146680564}
!1144 = !DILocalVariable(name: "__x", scope: !1145, file: !3, line: 949, type: !6)
!1145 = distinct !DILexicalBlock(scope: !1139, file: !3, line: 949, column: 7)
!1146 = !DILocation(line: 949, column: 7, scope: !1145)
!1147 = !{i32 -2146680439}
!1148 = !DILocation(line: 951, column: 7, scope: !1054)
!1149 = !DILocation(line: 953, column: 4, scope: !1054)
!1150 = !DILocation(line: 956, column: 5, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 953, column: 7)
!1152 = !DILocation(line: 957, column: 5, scope: !1151)
!1153 = !DILocation(line: 957, column: 5, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1155, file: !3, line: 957, column: 5)
!1155 = distinct !DILexicalBlock(scope: !1151, file: !3, line: 957, column: 5)
!1156 = !DILocation(line: 957, column: 5, scope: !1155)
!1157 = !DILocation(line: 957, column: 5, scope: !1158)
!1158 = distinct !DILexicalBlock(scope: !1154, file: !3, line: 957, column: 5)
!1159 = !DILocalVariable(name: "__x", scope: !1160, file: !3, line: 957, type: !6)
!1160 = distinct !DILexicalBlock(scope: !1158, file: !3, line: 957, column: 5)
!1161 = !DILocation(line: 957, column: 5, scope: !1160)
!1162 = !{i32 -2146678315}
!1163 = !DILocalVariable(name: "__x", scope: !1164, file: !3, line: 957, type: !6)
!1164 = distinct !DILexicalBlock(scope: !1158, file: !3, line: 957, column: 5)
!1165 = !DILocation(line: 957, column: 5, scope: !1164)
!1166 = !{i32 -2146678190}
!1167 = !DILocation(line: 957, column: 5, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1154, file: !3, line: 957, column: 5)
!1169 = !DILocalVariable(name: "__x", scope: !1170, file: !3, line: 957, type: !6)
!1170 = distinct !DILexicalBlock(scope: !1168, file: !3, line: 957, column: 5)
!1171 = !DILocation(line: 957, column: 5, scope: !1170)
!1172 = !{i32 -2146678058}
!1173 = !DILocalVariable(name: "__x", scope: !1174, file: !3, line: 957, type: !6)
!1174 = distinct !DILexicalBlock(scope: !1168, file: !3, line: 957, column: 5)
!1175 = !DILocation(line: 957, column: 5, scope: !1174)
!1176 = !{i32 -2146677933}
!1177 = !DILocation(line: 959, column: 5, scope: !1151)
!1178 = !DILocation(line: 961, column: 4, scope: !1151)
!1179 = !DILocation(line: 961, column: 13, scope: !1054)
!1180 = !DILocation(line: 961, column: 24, scope: !1054)
!1181 = distinct !{!1181, !1149, !1182}
!1182 = !DILocation(line: 961, column: 28, scope: !1054)
!1183 = !DILocation(line: 964, column: 4, scope: !1054)
!1184 = !DILocation(line: 965, column: 4, scope: !1054)
!1185 = !DILocation(line: 965, column: 4, scope: !1186)
!1186 = distinct !DILexicalBlock(scope: !1187, file: !3, line: 965, column: 4)
!1187 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 965, column: 4)
!1188 = !DILocation(line: 965, column: 4, scope: !1187)
!1189 = !DILocation(line: 965, column: 4, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1186, file: !3, line: 965, column: 4)
!1191 = !DILocalVariable(name: "__x", scope: !1192, file: !3, line: 965, type: !6)
!1192 = distinct !DILexicalBlock(scope: !1190, file: !3, line: 965, column: 4)
!1193 = !DILocation(line: 965, column: 4, scope: !1192)
!1194 = !{i32 -2146675787}
!1195 = !DILocalVariable(name: "__x", scope: !1196, file: !3, line: 965, type: !6)
!1196 = distinct !DILexicalBlock(scope: !1190, file: !3, line: 965, column: 4)
!1197 = !DILocation(line: 965, column: 4, scope: !1196)
!1198 = !{i32 -2146675662}
!1199 = !DILocation(line: 965, column: 4, scope: !1200)
!1200 = distinct !DILexicalBlock(scope: !1186, file: !3, line: 965, column: 4)
!1201 = !DILocalVariable(name: "__x", scope: !1202, file: !3, line: 965, type: !6)
!1202 = distinct !DILexicalBlock(scope: !1200, file: !3, line: 965, column: 4)
!1203 = !DILocation(line: 965, column: 4, scope: !1202)
!1204 = !{i32 -2146675530}
!1205 = !DILocalVariable(name: "__x", scope: !1206, file: !3, line: 965, type: !6)
!1206 = distinct !DILexicalBlock(scope: !1200, file: !3, line: 965, column: 4)
!1207 = !DILocation(line: 965, column: 4, scope: !1206)
!1208 = !{i32 -2146675405}
!1209 = !DILocation(line: 967, column: 4, scope: !1054)
!1210 = !DILocation(line: 969, column: 8, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 969, column: 8)
!1212 = !DILocation(line: 969, column: 19, scope: !1211)
!1213 = !DILocation(line: 969, column: 8, scope: !1054)
!1214 = !DILocation(line: 971, column: 5, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1211, file: !3, line: 969, column: 24)
!1216 = !DILocation(line: 975, column: 4, scope: !1054)
!1217 = !DILocation(line: 976, column: 4, scope: !1054)
!1218 = !DILocation(line: 976, column: 4, scope: !1219)
!1219 = distinct !DILexicalBlock(scope: !1220, file: !3, line: 976, column: 4)
!1220 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 976, column: 4)
!1221 = !DILocation(line: 976, column: 4, scope: !1220)
!1222 = !DILocation(line: 976, column: 4, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1219, file: !3, line: 976, column: 4)
!1224 = !DILocalVariable(name: "__x", scope: !1225, file: !3, line: 976, type: !6)
!1225 = distinct !DILexicalBlock(scope: !1223, file: !3, line: 976, column: 4)
!1226 = !DILocation(line: 976, column: 4, scope: !1225)
!1227 = !{i32 -2146673259}
!1228 = !DILocalVariable(name: "__x", scope: !1229, file: !3, line: 976, type: !6)
!1229 = distinct !DILexicalBlock(scope: !1223, file: !3, line: 976, column: 4)
!1230 = !DILocation(line: 976, column: 4, scope: !1229)
!1231 = !{i32 -2146673134}
!1232 = !DILocation(line: 976, column: 4, scope: !1233)
!1233 = distinct !DILexicalBlock(scope: !1219, file: !3, line: 976, column: 4)
!1234 = !DILocalVariable(name: "__x", scope: !1235, file: !3, line: 976, type: !6)
!1235 = distinct !DILexicalBlock(scope: !1233, file: !3, line: 976, column: 4)
!1236 = !DILocation(line: 976, column: 4, scope: !1235)
!1237 = !{i32 -2146673002}
!1238 = !DILocalVariable(name: "__x", scope: !1239, file: !3, line: 976, type: !6)
!1239 = distinct !DILexicalBlock(scope: !1233, file: !3, line: 976, column: 4)
!1240 = !DILocation(line: 976, column: 4, scope: !1239)
!1241 = !{i32 -2146672877}
!1242 = !DILocation(line: 978, column: 4, scope: !1054)
!1243 = !DILocation(line: 980, column: 8, scope: !1244)
!1244 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 980, column: 8)
!1245 = !DILocation(line: 980, column: 19, scope: !1244)
!1246 = !DILocation(line: 980, column: 8, scope: !1054)
!1247 = !DILocation(line: 983, column: 5, scope: !1248)
!1248 = distinct !DILexicalBlock(scope: !1244, file: !3, line: 980, column: 25)
!1249 = !DILocation(line: 984, column: 5, scope: !1248)
!1250 = !DILocation(line: 984, column: 5, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !3, line: 984, column: 5)
!1252 = distinct !DILexicalBlock(scope: !1248, file: !3, line: 984, column: 5)
!1253 = !DILocation(line: 984, column: 5, scope: !1252)
!1254 = !DILocation(line: 984, column: 5, scope: !1255)
!1255 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 984, column: 5)
!1256 = !DILocalVariable(name: "__x", scope: !1257, file: !3, line: 984, type: !6)
!1257 = distinct !DILexicalBlock(scope: !1255, file: !3, line: 984, column: 5)
!1258 = !DILocation(line: 984, column: 5, scope: !1257)
!1259 = !{i32 -2146670731}
!1260 = !DILocalVariable(name: "__x", scope: !1261, file: !3, line: 984, type: !6)
!1261 = distinct !DILexicalBlock(scope: !1255, file: !3, line: 984, column: 5)
!1262 = !DILocation(line: 984, column: 5, scope: !1261)
!1263 = !{i32 -2146670606}
!1264 = !DILocation(line: 984, column: 5, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1251, file: !3, line: 984, column: 5)
!1266 = !DILocalVariable(name: "__x", scope: !1267, file: !3, line: 984, type: !6)
!1267 = distinct !DILexicalBlock(scope: !1265, file: !3, line: 984, column: 5)
!1268 = !DILocation(line: 984, column: 5, scope: !1267)
!1269 = !{i32 -2146670474}
!1270 = !DILocalVariable(name: "__x", scope: !1271, file: !3, line: 984, type: !6)
!1271 = distinct !DILexicalBlock(scope: !1265, file: !3, line: 984, column: 5)
!1272 = !DILocation(line: 984, column: 5, scope: !1271)
!1273 = !{i32 -2146670349}
!1274 = !DILocation(line: 986, column: 5, scope: !1248)
!1275 = !DILocation(line: 988, column: 9, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1248, file: !3, line: 988, column: 9)
!1277 = !DILocation(line: 988, column: 20, scope: !1276)
!1278 = !DILocation(line: 988, column: 9, scope: !1248)
!1279 = !DILocation(line: 991, column: 6, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1276, file: !3, line: 988, column: 25)
!1281 = !DILocation(line: 992, column: 6, scope: !1280)
!1282 = !DILocation(line: 992, column: 6, scope: !1283)
!1283 = distinct !DILexicalBlock(scope: !1284, file: !3, line: 992, column: 6)
!1284 = distinct !DILexicalBlock(scope: !1280, file: !3, line: 992, column: 6)
!1285 = !DILocation(line: 992, column: 6, scope: !1284)
!1286 = !DILocation(line: 992, column: 6, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1283, file: !3, line: 992, column: 6)
!1288 = !DILocalVariable(name: "__x", scope: !1289, file: !3, line: 992, type: !6)
!1289 = distinct !DILexicalBlock(scope: !1287, file: !3, line: 992, column: 6)
!1290 = !DILocation(line: 992, column: 6, scope: !1289)
!1291 = !{i32 -2146668200}
!1292 = !DILocalVariable(name: "__x", scope: !1293, file: !3, line: 992, type: !6)
!1293 = distinct !DILexicalBlock(scope: !1287, file: !3, line: 992, column: 6)
!1294 = !DILocation(line: 992, column: 6, scope: !1293)
!1295 = !{i32 -2146668075}
!1296 = !DILocation(line: 992, column: 6, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1283, file: !3, line: 992, column: 6)
!1298 = !DILocalVariable(name: "__x", scope: !1299, file: !3, line: 992, type: !6)
!1299 = distinct !DILexicalBlock(scope: !1297, file: !3, line: 992, column: 6)
!1300 = !DILocation(line: 992, column: 6, scope: !1299)
!1301 = !{i32 -2146667943}
!1302 = !DILocalVariable(name: "__x", scope: !1303, file: !3, line: 992, type: !6)
!1303 = distinct !DILexicalBlock(scope: !1297, file: !3, line: 992, column: 6)
!1304 = !DILocation(line: 992, column: 6, scope: !1303)
!1305 = !{i32 -2146667818}
!1306 = !DILocation(line: 994, column: 6, scope: !1280)
!1307 = !DILocation(line: 995, column: 5, scope: !1280)
!1308 = !DILocation(line: 997, column: 4, scope: !1248)
!1309 = !DILocation(line: 997, column: 15, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1244, file: !3, line: 997, column: 15)
!1311 = !DILocation(line: 997, column: 26, scope: !1310)
!1312 = !DILocation(line: 997, column: 15, scope: !1244)
!1313 = !DILocation(line: 1000, column: 5, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1310, file: !3, line: 997, column: 32)
!1315 = !DILocation(line: 1001, column: 5, scope: !1314)
!1316 = !DILocation(line: 1001, column: 5, scope: !1317)
!1317 = distinct !DILexicalBlock(scope: !1318, file: !3, line: 1001, column: 5)
!1318 = distinct !DILexicalBlock(scope: !1314, file: !3, line: 1001, column: 5)
!1319 = !DILocation(line: 1001, column: 5, scope: !1318)
!1320 = !DILocation(line: 1001, column: 5, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1317, file: !3, line: 1001, column: 5)
!1322 = !DILocalVariable(name: "__x", scope: !1323, file: !3, line: 1001, type: !6)
!1323 = distinct !DILexicalBlock(scope: !1321, file: !3, line: 1001, column: 5)
!1324 = !DILocation(line: 1001, column: 5, scope: !1323)
!1325 = !{i32 -2146665672}
!1326 = !DILocalVariable(name: "__x", scope: !1327, file: !3, line: 1001, type: !6)
!1327 = distinct !DILexicalBlock(scope: !1321, file: !3, line: 1001, column: 5)
!1328 = !DILocation(line: 1001, column: 5, scope: !1327)
!1329 = !{i32 -2146665547}
!1330 = !DILocation(line: 1001, column: 5, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1317, file: !3, line: 1001, column: 5)
!1332 = !DILocalVariable(name: "__x", scope: !1333, file: !3, line: 1001, type: !6)
!1333 = distinct !DILexicalBlock(scope: !1331, file: !3, line: 1001, column: 5)
!1334 = !DILocation(line: 1001, column: 5, scope: !1333)
!1335 = !{i32 -2146665415}
!1336 = !DILocalVariable(name: "__x", scope: !1337, file: !3, line: 1001, type: !6)
!1337 = distinct !DILexicalBlock(scope: !1331, file: !3, line: 1001, column: 5)
!1338 = !DILocation(line: 1001, column: 5, scope: !1337)
!1339 = !{i32 -2146665290}
!1340 = !DILocation(line: 1003, column: 5, scope: !1314)
!1341 = !DILocation(line: 1004, column: 4, scope: !1314)
!1342 = !DILocation(line: 1006, column: 8, scope: !1343)
!1343 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 1006, column: 8)
!1344 = !DILocation(line: 1006, column: 18, scope: !1343)
!1345 = !DILocation(line: 1006, column: 8, scope: !1054)
!1346 = !DILocation(line: 1007, column: 5, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1343, file: !3, line: 1006, column: 24)
!1348 = !DILocation(line: 1009, column: 6, scope: !1349)
!1349 = distinct !DILexicalBlock(scope: !1347, file: !3, line: 1007, column: 8)
!1350 = !DILocation(line: 1010, column: 6, scope: !1349)
!1351 = !DILocation(line: 1010, column: 6, scope: !1352)
!1352 = distinct !DILexicalBlock(scope: !1353, file: !3, line: 1010, column: 6)
!1353 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 1010, column: 6)
!1354 = !DILocation(line: 1010, column: 6, scope: !1353)
!1355 = !DILocation(line: 1010, column: 6, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1352, file: !3, line: 1010, column: 6)
!1357 = !DILocalVariable(name: "__x", scope: !1358, file: !3, line: 1010, type: !6)
!1358 = distinct !DILexicalBlock(scope: !1356, file: !3, line: 1010, column: 6)
!1359 = !DILocation(line: 1010, column: 6, scope: !1358)
!1360 = !{i32 -2146663142}
!1361 = !DILocalVariable(name: "__x", scope: !1362, file: !3, line: 1010, type: !6)
!1362 = distinct !DILexicalBlock(scope: !1356, file: !3, line: 1010, column: 6)
!1363 = !DILocation(line: 1010, column: 6, scope: !1362)
!1364 = !{i32 -2146663017}
!1365 = !DILocation(line: 1010, column: 6, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1352, file: !3, line: 1010, column: 6)
!1367 = !DILocalVariable(name: "__x", scope: !1368, file: !3, line: 1010, type: !6)
!1368 = distinct !DILexicalBlock(scope: !1366, file: !3, line: 1010, column: 6)
!1369 = !DILocation(line: 1010, column: 6, scope: !1368)
!1370 = !{i32 -2146662885}
!1371 = !DILocalVariable(name: "__x", scope: !1372, file: !3, line: 1010, type: !6)
!1372 = distinct !DILexicalBlock(scope: !1366, file: !3, line: 1010, column: 6)
!1373 = !DILocation(line: 1010, column: 6, scope: !1372)
!1374 = !{i32 -2146662760}
!1375 = !DILocation(line: 1012, column: 6, scope: !1349)
!1376 = !DILocation(line: 1015, column: 6, scope: !1349)
!1377 = !DILocation(line: 1016, column: 6, scope: !1349)
!1378 = !DILocation(line: 1016, column: 6, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1380, file: !3, line: 1016, column: 6)
!1380 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 1016, column: 6)
!1381 = !DILocation(line: 1016, column: 6, scope: !1380)
!1382 = !DILocation(line: 1016, column: 6, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1379, file: !3, line: 1016, column: 6)
!1384 = !DILocalVariable(name: "__x", scope: !1385, file: !3, line: 1016, type: !6)
!1385 = distinct !DILexicalBlock(scope: !1383, file: !3, line: 1016, column: 6)
!1386 = !DILocation(line: 1016, column: 6, scope: !1385)
!1387 = !{i32 -2146660636}
!1388 = !DILocalVariable(name: "__x", scope: !1389, file: !3, line: 1016, type: !6)
!1389 = distinct !DILexicalBlock(scope: !1383, file: !3, line: 1016, column: 6)
!1390 = !DILocation(line: 1016, column: 6, scope: !1389)
!1391 = !{i32 -2146660511}
!1392 = !DILocation(line: 1016, column: 6, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1379, file: !3, line: 1016, column: 6)
!1394 = !DILocalVariable(name: "__x", scope: !1395, file: !3, line: 1016, type: !6)
!1395 = distinct !DILexicalBlock(scope: !1393, file: !3, line: 1016, column: 6)
!1396 = !DILocation(line: 1016, column: 6, scope: !1395)
!1397 = !{i32 -2146660379}
!1398 = !DILocalVariable(name: "__x", scope: !1399, file: !3, line: 1016, type: !6)
!1399 = distinct !DILexicalBlock(scope: !1393, file: !3, line: 1016, column: 6)
!1400 = !DILocation(line: 1016, column: 6, scope: !1399)
!1401 = !{i32 -2146660254}
!1402 = !DILocation(line: 1018, column: 6, scope: !1349)
!1403 = !DILocation(line: 1021, column: 6, scope: !1349)
!1404 = !DILocation(line: 1022, column: 6, scope: !1349)
!1405 = !DILocation(line: 1022, column: 6, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1407, file: !3, line: 1022, column: 6)
!1407 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 1022, column: 6)
!1408 = !DILocation(line: 1022, column: 6, scope: !1407)
!1409 = !DILocation(line: 1022, column: 6, scope: !1410)
!1410 = distinct !DILexicalBlock(scope: !1406, file: !3, line: 1022, column: 6)
!1411 = !DILocalVariable(name: "__x", scope: !1412, file: !3, line: 1022, type: !6)
!1412 = distinct !DILexicalBlock(scope: !1410, file: !3, line: 1022, column: 6)
!1413 = !DILocation(line: 1022, column: 6, scope: !1412)
!1414 = !{i32 -2146658130}
!1415 = !DILocalVariable(name: "__x", scope: !1416, file: !3, line: 1022, type: !6)
!1416 = distinct !DILexicalBlock(scope: !1410, file: !3, line: 1022, column: 6)
!1417 = !DILocation(line: 1022, column: 6, scope: !1416)
!1418 = !{i32 -2146658005}
!1419 = !DILocation(line: 1022, column: 6, scope: !1420)
!1420 = distinct !DILexicalBlock(scope: !1406, file: !3, line: 1022, column: 6)
!1421 = !DILocalVariable(name: "__x", scope: !1422, file: !3, line: 1022, type: !6)
!1422 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 1022, column: 6)
!1423 = !DILocation(line: 1022, column: 6, scope: !1422)
!1424 = !{i32 -2146657873}
!1425 = !DILocalVariable(name: "__x", scope: !1426, file: !3, line: 1022, type: !6)
!1426 = distinct !DILexicalBlock(scope: !1420, file: !3, line: 1022, column: 6)
!1427 = !DILocation(line: 1022, column: 6, scope: !1426)
!1428 = !{i32 -2146657748}
!1429 = !DILocation(line: 1024, column: 6, scope: !1349)
!1430 = !DILocation(line: 1026, column: 10, scope: !1431)
!1431 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 1026, column: 10)
!1432 = !DILocation(line: 1026, column: 21, scope: !1431)
!1433 = !DILocation(line: 1026, column: 10, scope: !1349)
!1434 = !DILocation(line: 1029, column: 7, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1431, file: !3, line: 1026, column: 27)
!1436 = !DILocation(line: 1030, column: 7, scope: !1435)
!1437 = !DILocation(line: 1030, column: 7, scope: !1438)
!1438 = distinct !DILexicalBlock(scope: !1439, file: !3, line: 1030, column: 7)
!1439 = distinct !DILexicalBlock(scope: !1435, file: !3, line: 1030, column: 7)
!1440 = !DILocation(line: 1030, column: 7, scope: !1439)
!1441 = !DILocation(line: 1030, column: 7, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1438, file: !3, line: 1030, column: 7)
!1443 = !DILocalVariable(name: "__x", scope: !1444, file: !3, line: 1030, type: !6)
!1444 = distinct !DILexicalBlock(scope: !1442, file: !3, line: 1030, column: 7)
!1445 = !DILocation(line: 1030, column: 7, scope: !1444)
!1446 = !{i32 -2146655602}
!1447 = !DILocalVariable(name: "__x", scope: !1448, file: !3, line: 1030, type: !6)
!1448 = distinct !DILexicalBlock(scope: !1442, file: !3, line: 1030, column: 7)
!1449 = !DILocation(line: 1030, column: 7, scope: !1448)
!1450 = !{i32 -2146655477}
!1451 = !DILocation(line: 1030, column: 7, scope: !1452)
!1452 = distinct !DILexicalBlock(scope: !1438, file: !3, line: 1030, column: 7)
!1453 = !DILocalVariable(name: "__x", scope: !1454, file: !3, line: 1030, type: !6)
!1454 = distinct !DILexicalBlock(scope: !1452, file: !3, line: 1030, column: 7)
!1455 = !DILocation(line: 1030, column: 7, scope: !1454)
!1456 = !{i32 -2146655345}
!1457 = !DILocalVariable(name: "__x", scope: !1458, file: !3, line: 1030, type: !6)
!1458 = distinct !DILexicalBlock(scope: !1452, file: !3, line: 1030, column: 7)
!1459 = !DILocation(line: 1030, column: 7, scope: !1458)
!1460 = !{i32 -2146655220}
!1461 = !DILocation(line: 1032, column: 7, scope: !1435)
!1462 = !DILocation(line: 1034, column: 6, scope: !1435)
!1463 = !DILocation(line: 1037, column: 6, scope: !1349)
!1464 = !DILocation(line: 1038, column: 6, scope: !1349)
!1465 = !DILocation(line: 1038, column: 6, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1467, file: !3, line: 1038, column: 6)
!1467 = distinct !DILexicalBlock(scope: !1349, file: !3, line: 1038, column: 6)
!1468 = !DILocation(line: 1038, column: 6, scope: !1467)
!1469 = !DILocation(line: 1038, column: 6, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1466, file: !3, line: 1038, column: 6)
!1471 = !DILocalVariable(name: "__x", scope: !1472, file: !3, line: 1038, type: !6)
!1472 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 1038, column: 6)
!1473 = !DILocation(line: 1038, column: 6, scope: !1472)
!1474 = !{i32 -2146653096}
!1475 = !DILocalVariable(name: "__x", scope: !1476, file: !3, line: 1038, type: !6)
!1476 = distinct !DILexicalBlock(scope: !1470, file: !3, line: 1038, column: 6)
!1477 = !DILocation(line: 1038, column: 6, scope: !1476)
!1478 = !{i32 -2146652971}
!1479 = !DILocation(line: 1038, column: 6, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1466, file: !3, line: 1038, column: 6)
!1481 = !DILocalVariable(name: "__x", scope: !1482, file: !3, line: 1038, type: !6)
!1482 = distinct !DILexicalBlock(scope: !1480, file: !3, line: 1038, column: 6)
!1483 = !DILocation(line: 1038, column: 6, scope: !1482)
!1484 = !{i32 -2146652839}
!1485 = !DILocalVariable(name: "__x", scope: !1486, file: !3, line: 1038, type: !6)
!1486 = distinct !DILexicalBlock(scope: !1480, file: !3, line: 1038, column: 6)
!1487 = !DILocation(line: 1038, column: 6, scope: !1486)
!1488 = !{i32 -2146652714}
!1489 = !DILocation(line: 1040, column: 6, scope: !1349)
!1490 = !DILocation(line: 1042, column: 6, scope: !1349)
!1491 = !DILocation(line: 1042, column: 15, scope: !1347)
!1492 = !DILocation(line: 1042, column: 27, scope: !1347)
!1493 = !DILocation(line: 1042, column: 31, scope: !1347)
!1494 = distinct !{!1494, !1346, !1495}
!1495 = !DILocation(line: 1042, column: 43, scope: !1347)
!1496 = !DILocation(line: 1044, column: 5, scope: !1347)
!1497 = !DILocation(line: 1046, column: 9, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 1046, column: 9)
!1499 = !DILocation(line: 1046, column: 26, scope: !1498)
!1500 = !DILocation(line: 1046, column: 9, scope: !1054)
!1501 = !DILocation(line: 1049, column: 5, scope: !1502)
!1502 = distinct !DILexicalBlock(scope: !1498, file: !3, line: 1046, column: 32)
!1503 = !DILocation(line: 1050, column: 5, scope: !1502)
!1504 = !DILocation(line: 1050, column: 5, scope: !1505)
!1505 = distinct !DILexicalBlock(scope: !1506, file: !3, line: 1050, column: 5)
!1506 = distinct !DILexicalBlock(scope: !1502, file: !3, line: 1050, column: 5)
!1507 = !DILocation(line: 1050, column: 5, scope: !1506)
!1508 = !DILocation(line: 1050, column: 5, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1505, file: !3, line: 1050, column: 5)
!1510 = !DILocalVariable(name: "__x", scope: !1511, file: !3, line: 1050, type: !6)
!1511 = distinct !DILexicalBlock(scope: !1509, file: !3, line: 1050, column: 5)
!1512 = !DILocation(line: 1050, column: 5, scope: !1511)
!1513 = !{i32 -2146650505}
!1514 = !DILocalVariable(name: "__x", scope: !1515, file: !3, line: 1050, type: !6)
!1515 = distinct !DILexicalBlock(scope: !1509, file: !3, line: 1050, column: 5)
!1516 = !DILocation(line: 1050, column: 5, scope: !1515)
!1517 = !{i32 -2146650380}
!1518 = !DILocation(line: 1050, column: 5, scope: !1519)
!1519 = distinct !DILexicalBlock(scope: !1505, file: !3, line: 1050, column: 5)
!1520 = !DILocalVariable(name: "__x", scope: !1521, file: !3, line: 1050, type: !6)
!1521 = distinct !DILexicalBlock(scope: !1519, file: !3, line: 1050, column: 5)
!1522 = !DILocation(line: 1050, column: 5, scope: !1521)
!1523 = !{i32 -2146650248}
!1524 = !DILocalVariable(name: "__x", scope: !1525, file: !3, line: 1050, type: !6)
!1525 = distinct !DILexicalBlock(scope: !1519, file: !3, line: 1050, column: 5)
!1526 = !DILocation(line: 1050, column: 5, scope: !1525)
!1527 = !{i32 -2146650123}
!1528 = !DILocation(line: 1052, column: 5, scope: !1502)
!1529 = !DILocation(line: 1054, column: 4, scope: !1502)
!1530 = !DILocation(line: 1054, column: 15, scope: !1531)
!1531 = distinct !DILexicalBlock(scope: !1498, file: !3, line: 1054, column: 15)
!1532 = !DILocation(line: 1054, column: 32, scope: !1531)
!1533 = !DILocation(line: 1054, column: 15, scope: !1498)
!1534 = !DILocation(line: 1057, column: 5, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1531, file: !3, line: 1054, column: 38)
!1536 = !DILocation(line: 1058, column: 5, scope: !1535)
!1537 = !DILocation(line: 1058, column: 5, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1539, file: !3, line: 1058, column: 5)
!1539 = distinct !DILexicalBlock(scope: !1535, file: !3, line: 1058, column: 5)
!1540 = !DILocation(line: 1058, column: 5, scope: !1539)
!1541 = !DILocation(line: 1058, column: 5, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1538, file: !3, line: 1058, column: 5)
!1543 = !DILocalVariable(name: "__x", scope: !1544, file: !3, line: 1058, type: !6)
!1544 = distinct !DILexicalBlock(scope: !1542, file: !3, line: 1058, column: 5)
!1545 = !DILocation(line: 1058, column: 5, scope: !1544)
!1546 = !{i32 -2146647971}
!1547 = !DILocalVariable(name: "__x", scope: !1548, file: !3, line: 1058, type: !6)
!1548 = distinct !DILexicalBlock(scope: !1542, file: !3, line: 1058, column: 5)
!1549 = !DILocation(line: 1058, column: 5, scope: !1548)
!1550 = !{i32 -2146647846}
!1551 = !DILocation(line: 1058, column: 5, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1538, file: !3, line: 1058, column: 5)
!1553 = !DILocalVariable(name: "__x", scope: !1554, file: !3, line: 1058, type: !6)
!1554 = distinct !DILexicalBlock(scope: !1552, file: !3, line: 1058, column: 5)
!1555 = !DILocation(line: 1058, column: 5, scope: !1554)
!1556 = !{i32 -2146647714}
!1557 = !DILocalVariable(name: "__x", scope: !1558, file: !3, line: 1058, type: !6)
!1558 = distinct !DILexicalBlock(scope: !1552, file: !3, line: 1058, column: 5)
!1559 = !DILocation(line: 1058, column: 5, scope: !1558)
!1560 = !{i32 -2146647589}
!1561 = !DILocation(line: 1060, column: 5, scope: !1535)
!1562 = !DILocation(line: 1061, column: 4, scope: !1535)
!1563 = distinct !{!1563, !1051, !1564}
!1564 = !DILocation(line: 1062, column: 3, scope: !1024)
!1565 = distinct !{!1565, !1022, !1566}
!1566 = !DILocation(line: 1063, column: 2, scope: !1015)
