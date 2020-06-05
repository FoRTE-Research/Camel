; ModuleID = 'camel_rsa_mod.bc'
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
@pubkey = internal constant %struct.pubkey_t { [8 x i8] c"\15p\F6B\0E\82q\A6", i16 3 }, align 2, !dbg !72
@PLAINTEXT = internal constant [12 x i8] c".RRRSSSAAA.\00", align 1, !dbg !84
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !13
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !18
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !23
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !69
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !99 {
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
  call void @camel_init(), !dbg !133
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !134
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !135
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !134
  call void @__restore_registers(i16* %arraydecay), !dbg !136
  ret void, !dbg !137
}

declare dso_local void @__crt0_start(...) #1

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !138 {
entry:
  call void @exit(i16 0) #6, !dbg !139
  unreachable, !dbg !139
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !140 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !141, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !144, metadata !DIExpression()), !dbg !145
  store i16 11, i16* %message_length, align 2, !dbg !145
  store i16 0, i16* %i, align 2, !dbg !146
  br label %for.cond, !dbg !148

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !149
  %cmp = icmp slt i16 %0, 8, !dbg !151
  br i1 %cmp, label %for.body, label %for.end, !dbg !152

for.body:                                         ; preds = %for.cond
  %1 = load i16, i16* %i, align 2, !dbg !153
  %arrayidx = getelementptr inbounds [8 x i8], [8 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %1, !dbg !155
  %2 = load i8, i8* %arrayidx, align 1, !dbg !155
  %conv = zext i8 %2 to i16, !dbg !155
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !156
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !156
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !156
  %4 = load i16, i16* %i, align 2, !dbg !157
  %arrayidx1 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %4, !dbg !156
  store i16 %conv, i16* %arrayidx1, align 2, !dbg !158
  br label %for.inc, !dbg !159

for.inc:                                          ; preds = %for.body
  %5 = load i16, i16* %i, align 2, !dbg !160
  %inc = add nsw i16 %5, 1, !dbg !160
  store i16 %inc, i16* %i, align 2, !dbg !160
  br label %for.cond, !dbg !161, !llvm.loop !162

for.end:                                          ; preds = %for.cond
  %6 = load i16, i16* %message_length, align 2, !dbg !164
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !165
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !165
  %message_length3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !165
  store i16 %6, i16* %message_length3, align 2, !dbg !166
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !167
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !167
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !167
  store i16 0, i16* %block_offset, align 2, !dbg !168
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !169
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !169
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 5, !dbg !169
  store i16 0, i16* %cyphertext_len, align 2, !dbg !170
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !171
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !171
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !171
  store i16 0, i16* %check, align 2, !dbg !172
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !173
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !173
  store i16 0, i16* %check_final, align 2, !dbg !174
  ret void, !dbg !175
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_pad() #0 !dbg !176 {
entry:
  %i = alloca i16, align 2
  %zero = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !179
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !179
  %block_offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !179
  %1 = load i16, i16* %block_offset, align 2, !dbg !179
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !181
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !181
  %message_length = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !181
  %3 = load i16, i16* %message_length, align 2, !dbg !181
  %cmp = icmp uge i16 %1, %3, !dbg !182
  br i1 %cmp, label %if.then, label %if.end, !dbg !183

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !184
  br label %if.end, !dbg !186

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i16* %zero, metadata !187, metadata !DIExpression()), !dbg !188
  store i16 0, i16* %zero, align 2, !dbg !188
  store i16 0, i16* %i, align 2, !dbg !189
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i16, i16* %i, align 2, !dbg !192
  %cmp2 = icmp ult i16 %4, 7, !dbg !194
  br i1 %cmp2, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !196
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !196
  %block_offset4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !196
  %6 = load i16, i16* %block_offset4, align 2, !dbg !196
  %7 = load i16, i16* %i, align 2, !dbg !198
  %add = add i16 %6, %7, !dbg !199
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !200
  %message_length6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !200
  %9 = load i16, i16* %message_length6, align 2, !dbg !200
  %cmp7 = icmp ult i16 %add, %9, !dbg !201
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !202

cond.true:                                        ; preds = %for.body
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !203
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !203
  %block_offset9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 3, !dbg !203
  %11 = load i16, i16* %block_offset9, align 2, !dbg !203
  %12 = load i16, i16* %i, align 2, !dbg !204
  %add10 = add i16 %11, %12, !dbg !205
  %arrayidx = getelementptr inbounds [12 x i8], [12 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !206
  %13 = load i8, i8* %arrayidx, align 1, !dbg !206
  %conv = zext i8 %13 to i16, !dbg !206
  br label %cond.end, !dbg !202

cond.false:                                       ; preds = %for.body
  br label %cond.end, !dbg !202

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv, %cond.true ], [ 255, %cond.false ], !dbg !202
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !207
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !207
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !207
  %15 = load i16, i16* %i, align 2, !dbg !208
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %15, !dbg !207
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !209
  br label %for.inc, !dbg !210

for.inc:                                          ; preds = %cond.end
  %16 = load i16, i16* %i, align 2, !dbg !211
  %inc = add nsw i16 %16, 1, !dbg !211
  store i16 %inc, i16* %i, align 2, !dbg !211
  br label %for.cond, !dbg !212, !llvm.loop !213

for.end:                                          ; preds = %for.cond
  store i16 7, i16* %i, align 2, !dbg !215
  br label %for.cond13, !dbg !217

for.cond13:                                       ; preds = %for.inc20, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !218
  %cmp14 = icmp slt i16 %17, 8, !dbg !220
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !221

for.body16:                                       ; preds = %for.cond13
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !222
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !222
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !222
  %19 = load i16, i16* %i, align 2, !dbg !224
  %arrayidx19 = getelementptr inbounds [16 x i16], [16 x i16]* %base18, i16 0, i16 %19, !dbg !222
  store i16 1, i16* %arrayidx19, align 2, !dbg !225
  br label %for.inc20, !dbg !226

for.inc20:                                        ; preds = %for.body16
  %20 = load i16, i16* %i, align 2, !dbg !227
  %inc21 = add nsw i16 %20, 1, !dbg !227
  store i16 %inc21, i16* %i, align 2, !dbg !227
  br label %for.cond13, !dbg !228, !llvm.loop !229

for.end22:                                        ; preds = %for.cond13
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !231
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !231
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 15, !dbg !231
  %22 = load i16, i16* %zero, align 2, !dbg !232
  %arrayidx24 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %22, !dbg !231
  store i16 1, i16* %arrayidx24, align 2, !dbg !233
  store i16 1, i16* %i, align 2, !dbg !234
  br label %for.cond25, !dbg !236

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %23 = load i16, i16* %i, align 2, !dbg !237
  %cmp26 = icmp slt i16 %23, 8, !dbg !239
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !240

for.body28:                                       ; preds = %for.cond25
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !241
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !241
  %25 = load i16, i16* %i, align 2, !dbg !242
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %block30, i16 0, i16 %25, !dbg !241
  store i16 0, i16* %arrayidx31, align 2, !dbg !243
  br label %for.inc32, !dbg !241

for.inc32:                                        ; preds = %for.body28
  %26 = load i16, i16* %i, align 2, !dbg !244
  %inc33 = add nsw i16 %26, 1, !dbg !244
  store i16 %inc33, i16* %i, align 2, !dbg !244
  br label %for.cond25, !dbg !245, !llvm.loop !246

for.end34:                                        ; preds = %for.cond25
  %27 = load i16, i16* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 1), align 2, !dbg !248
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !249
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !249
  store i16 %27, i16* %exponent, align 2, !dbg !250
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !251
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !251
  %30 = load i16, i16* %block_offset37, align 2, !dbg !252
  %add38 = add i16 %30, 7, !dbg !252
  store i16 %add38, i16* %block_offset37, align 2, !dbg !252
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !253
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 17, !dbg !253
  store i16 2, i16* %check, align 2, !dbg !254
  ret void, !dbg !255
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_exp() #0 !dbg !256 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !257
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !257
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !257
  %1 = load i16, i16* %exponent, align 2, !dbg !257
  %and = and i16 %1, 1, !dbg !259
  %tobool = icmp ne i16 %and, 0, !dbg !259
  br i1 %tobool, label %if.then, label %if.else, !dbg !260

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !261
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !261
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !261
  %3 = load i16, i16* %exponent2, align 2, !dbg !263
  %shr = lshr i16 %3, 1, !dbg !263
  store i16 %shr, i16* %exponent2, align 2, !dbg !263
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !264
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !264
  store i16 0, i16* %check, align 2, !dbg !265
  br label %if.end, !dbg !266

if.else:                                          ; preds = %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !267
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !267
  %exponent5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !267
  %6 = load i16, i16* %exponent5, align 2, !dbg !269
  %shr6 = lshr i16 %6, 1, !dbg !269
  store i16 %shr6, i16* %exponent5, align 2, !dbg !269
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !270
  %check8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 17, !dbg !270
  store i16 1, i16* %check8, align 2, !dbg !271
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !272
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block() #0 !dbg !273 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !274
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !274
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !274
  store i16 0, i16* %check_final, align 2, !dbg !275
  ret void, !dbg !276
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block_get_result() #0 !dbg !277 {
entry:
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !278, metadata !DIExpression()), !dbg !279
  store i16 7, i16* %i, align 2, !dbg !280
  br label %for.cond, !dbg !282

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !283
  %cmp = icmp sge i16 %0, 0, !dbg !285
  br i1 %cmp, label %for.body, label %for.end, !dbg !286

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !287
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !287
  %2 = load i16, i16* %i, align 2, !dbg !289
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !287
  %3 = load i16, i16* %arrayidx, align 2, !dbg !287
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !290
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !290
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !290
  %5 = load i16, i16* %i, align 2, !dbg !291
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %5, !dbg !290
  store i16 %3, i16* %arrayidx2, align 2, !dbg !292
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !294
  %dec = add nsw i16 %6, -1, !dbg !294
  store i16 %dec, i16* %i, align 2, !dbg !294
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !298
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !298
  %8 = load i16, i16* %exponent, align 2, !dbg !298
  %cmp4 = icmp ugt i16 %8, 0, !dbg !300
  br i1 %cmp4, label %if.then, label %if.else, !dbg !301

if.then:                                          ; preds = %for.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !302
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !302
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 17, !dbg !302
  store i16 1, i16* %check, align 2, !dbg !304
  br label %if.end26, !dbg !305

if.else:                                          ; preds = %for.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !306
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !306
  %11 = load i16, i16* %cyphertext_len, align 2, !dbg !306
  %add = add i16 %11, 8, !dbg !309
  %cmp7 = icmp ule i16 %add, 16, !dbg !310
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !311

if.then8:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !312
  br label %for.cond9, !dbg !315

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %12 = load i16, i16* %i, align 2, !dbg !316
  %cmp10 = icmp slt i16 %12, 8, !dbg !318
  br i1 %cmp10, label %for.body11, label %for.end23, !dbg !319

for.body11:                                       ; preds = %for.cond9
  call void @llvm.dbg.declare(metadata i16* %op, metadata !320, metadata !DIExpression()), !dbg !322
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !323
  %cyphertext_len13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !323
  %14 = load i16, i16* %cyphertext_len13, align 2, !dbg !323
  store i16 %14, i16* %op, align 2, !dbg !322
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !324
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !324
  %product15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !324
  %16 = load i16, i16* %i, align 2, !dbg !325
  %arrayidx16 = getelementptr inbounds [16 x i16], [16 x i16]* %product15, i16 0, i16 %16, !dbg !324
  %17 = load i16, i16* %arrayidx16, align 2, !dbg !324
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !326
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !326
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 11, !dbg !326
  %19 = load i16, i16* %op, align 2, !dbg !327
  %arrayidx18 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %19, !dbg !326
  store i16 %17, i16* %arrayidx18, align 2, !dbg !328
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !329
  %cyphertext_len20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !329
  %21 = load i16, i16* %cyphertext_len20, align 2, !dbg !330
  %inc = add i16 %21, 1, !dbg !330
  store i16 %inc, i16* %cyphertext_len20, align 2, !dbg !330
  br label %for.inc21, !dbg !331

for.inc21:                                        ; preds = %for.body11
  %22 = load i16, i16* %i, align 2, !dbg !332
  %inc22 = add nsw i16 %22, 1, !dbg !332
  store i16 %inc22, i16* %i, align 2, !dbg !332
  br label %for.cond9, !dbg !333, !llvm.loop !334

for.end23:                                        ; preds = %for.cond9
  br label %if.end, !dbg !336

if.end:                                           ; preds = %for.end23, %if.else
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !337
  %check25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !337
  store i16 0, i16* %check25, align 2, !dbg !338
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then
  ret void, !dbg !339
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base() #0 !dbg !340 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !341
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !341
  store i16 1, i16* %check_final, align 2, !dbg !342
  ret void, !dbg !343
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base_get_result() #0 !dbg !344 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !345, metadata !DIExpression()), !dbg !346
  store i16 0, i16* %i, align 2, !dbg !347
  br label %for.cond, !dbg !349

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !350
  %cmp = icmp slt i16 %0, 8, !dbg !352
  br i1 %cmp, label %for.body, label %for.end, !dbg !353

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !354
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !354
  %2 = load i16, i16* %i, align 2, !dbg !356
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !354
  %3 = load i16, i16* %arrayidx, align 2, !dbg !354
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !357
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !357
  %5 = load i16, i16* %i, align 2, !dbg !358
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %5, !dbg !357
  store i16 %3, i16* %arrayidx2, align 2, !dbg !359
  br label %for.inc, !dbg !360

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !361
  %inc = add nsw i16 %6, 1, !dbg !361
  store i16 %inc, i16* %i, align 2, !dbg !361
  br label %for.cond, !dbg !362, !llvm.loop !363

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !365
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !365
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !365
  store i16 2, i16* %check, align 2, !dbg !366
  ret void, !dbg !367
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_mod() #0 !dbg !368 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !369
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !369
  store i16 0, i16* %digit, align 2, !dbg !370
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !371
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !371
  store i16 0, i16* %carry, align 2, !dbg !372
  ret void, !dbg !373
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult() #0 !dbg !374 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !375, metadata !DIExpression()), !dbg !376
  call void @llvm.dbg.declare(metadata i16* %a, metadata !377, metadata !DIExpression()), !dbg !378
  call void @llvm.dbg.declare(metadata i16* %b, metadata !379, metadata !DIExpression()), !dbg !380
  call void @llvm.dbg.declare(metadata i16* %c, metadata !381, metadata !DIExpression()), !dbg !382
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !383, metadata !DIExpression()), !dbg !384
  call void @llvm.dbg.declare(metadata i16* %p, metadata !385, metadata !DIExpression()), !dbg !386
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !387
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !387
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !387
  %1 = load i16, i16* %carry, align 2, !dbg !387
  store i16 %1, i16* %p, align 2, !dbg !388
  store i16 0, i16* %c, align 2, !dbg !389
  store i16 0, i16* %i, align 2, !dbg !390
  br label %for.cond, !dbg !392

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !393
  %cmp = icmp slt i16 %2, 8, !dbg !395
  br i1 %cmp, label %for.body, label %for.end, !dbg !396

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !397
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !397
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !397
  %4 = load i16, i16* %digit, align 2, !dbg !397
  %5 = load i16, i16* %i, align 2, !dbg !400
  %sub = sub i16 %4, %5, !dbg !401
  %cmp2 = icmp uge i16 %sub, 0, !dbg !402
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !403

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !404
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !404
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !404
  %7 = load i16, i16* %digit4, align 2, !dbg !404
  %8 = load i16, i16* %i, align 2, !dbg !405
  %sub5 = sub i16 %7, %8, !dbg !406
  %cmp6 = icmp ult i16 %sub5, 8, !dbg !407
  br i1 %cmp6, label %if.then, label %if.end, !dbg !408

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata i16* %op, metadata !409, metadata !DIExpression()), !dbg !411
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !412
  %digit8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !412
  %10 = load i16, i16* %digit8, align 2, !dbg !412
  %11 = load i16, i16* %i, align 2, !dbg !413
  %sub9 = sub i16 %10, %11, !dbg !414
  store i16 %sub9, i16* %op, align 2, !dbg !411
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !415
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !415
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !415
  %13 = load i16, i16* %op, align 2, !dbg !416
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %13, !dbg !415
  %14 = load i16, i16* %arrayidx, align 2, !dbg !415
  store i16 %14, i16* %a, align 2, !dbg !417
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !418
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !418
  %16 = load i16, i16* %i, align 2, !dbg !419
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %16, !dbg !418
  %17 = load i16, i16* %arrayidx12, align 2, !dbg !418
  store i16 %17, i16* %b, align 2, !dbg !420
  %18 = load i16, i16* %a, align 2, !dbg !421
  %19 = load i16, i16* %b, align 2, !dbg !422
  %mul = mul i16 %18, %19, !dbg !423
  store i16 %mul, i16* %dp, align 2, !dbg !424
  %20 = load i16, i16* %dp, align 2, !dbg !425
  %shr = lshr i16 %20, 8, !dbg !426
  %21 = load i16, i16* %c, align 2, !dbg !427
  %add = add i16 %21, %shr, !dbg !427
  store i16 %add, i16* %c, align 2, !dbg !427
  %22 = load i16, i16* %dp, align 2, !dbg !428
  %and = and i16 %22, 255, !dbg !429
  %23 = load i16, i16* %p, align 2, !dbg !430
  %add13 = add i16 %23, %and, !dbg !430
  store i16 %add13, i16* %p, align 2, !dbg !430
  br label %if.end, !dbg !431

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !432

for.inc:                                          ; preds = %if.end
  %24 = load i16, i16* %i, align 2, !dbg !433
  %inc = add nsw i16 %24, 1, !dbg !433
  store i16 %inc, i16* %i, align 2, !dbg !433
  br label %for.cond, !dbg !434, !llvm.loop !435

for.end:                                          ; preds = %for.cond
  %25 = load i16, i16* %p, align 2, !dbg !437
  %shr14 = lshr i16 %25, 8, !dbg !438
  %26 = load i16, i16* %c, align 2, !dbg !439
  %add15 = add i16 %26, %shr14, !dbg !439
  store i16 %add15, i16* %c, align 2, !dbg !439
  %27 = load i16, i16* %p, align 2, !dbg !440
  %and16 = and i16 %27, 255, !dbg !440
  store i16 %and16, i16* %p, align 2, !dbg !440
  %28 = load i16, i16* %p, align 2, !dbg !441
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !442
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !442
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !443
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !443
  %31 = load i16, i16* %digit19, align 2, !dbg !443
  %arrayidx20 = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %31, !dbg !442
  store i16 %28, i16* %arrayidx20, align 2, !dbg !444
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !445
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !445
  %digit22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !445
  %33 = load i16, i16* %digit22, align 2, !dbg !446
  %inc23 = add i16 %33, 1, !dbg !446
  store i16 %inc23, i16* %digit22, align 2, !dbg !446
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !447
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !447
  %digit25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !447
  %35 = load i16, i16* %digit25, align 2, !dbg !447
  %cmp26 = icmp ult i16 %35, 16, !dbg !449
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !450

if.then27:                                        ; preds = %for.end
  %36 = load i16, i16* %c, align 2, !dbg !451
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !453
  %carry29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 9, !dbg !453
  store i16 %36, i16* %carry29, align 2, !dbg !454
  br label %if.end30, !dbg !455

if.end30:                                         ; preds = %if.then27, %for.end
  ret void, !dbg !456
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_digits() #0 !dbg !457 {
entry:
  %d = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %d, metadata !458, metadata !DIExpression()), !dbg !459
  store i16 16, i16* %d, align 2, !dbg !460
  br label %do.body, !dbg !461

do.body:                                          ; preds = %land.end, %entry
  %0 = load i16, i16* %d, align 2, !dbg !462
  %dec = add nsw i16 %0, -1, !dbg !462
  store i16 %dec, i16* %d, align 2, !dbg !462
  br label %do.cond, !dbg !464

do.cond:                                          ; preds = %do.body
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !465
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !465
  %2 = load i16, i16* %d, align 2, !dbg !466
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !465
  %3 = load i16, i16* %arrayidx, align 2, !dbg !465
  %cmp = icmp eq i16 %3, 0, !dbg !467
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !468

land.rhs:                                         ; preds = %do.cond
  %4 = load i16, i16* %d, align 2, !dbg !469
  %cmp1 = icmp sgt i16 %4, 0, !dbg !470
  br label %land.end

land.end:                                         ; preds = %land.rhs, %do.cond
  %5 = phi i1 [ false, %do.cond ], [ %cmp1, %land.rhs ], !dbg !471
  br i1 %5, label %do.body, label %do.end, !dbg !464, !llvm.loop !472

do.end:                                           ; preds = %land.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !474
  %product3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !474
  %7 = load i16, i16* %d, align 2, !dbg !476
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product3, i16 0, i16 %7, !dbg !474
  %8 = load i16, i16* %arrayidx4, align 2, !dbg !474
  %cmp5 = icmp eq i16 %8, 0, !dbg !477
  br i1 %cmp5, label %if.then, label %if.end, !dbg !478

if.then:                                          ; preds = %do.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !479
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !479
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !479
  store i16 0, i16* %check, align 2, !dbg !481
  br label %if.end, !dbg !482

if.end:                                           ; preds = %if.then, %do.end
  %10 = load i16, i16* %d, align 2, !dbg !483
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !484
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 10, !dbg !484
  store i16 %10, i16* %reduce, align 2, !dbg !485
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !486
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !486
  store i16 1, i16* %check9, align 2, !dbg !487
  ret void, !dbg !488
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalizable() #0 !dbg !489 {
entry:
  %i = alloca i16, align 2
  %normalizable = alloca i8, align 1
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !490, metadata !DIExpression()), !dbg !491
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !492, metadata !DIExpression()), !dbg !494
  store i8 1, i8* %normalizable, align 1, !dbg !494
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !495
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !495
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !495
  %1 = load i16, i16* %reduce, align 2, !dbg !495
  %add = add i16 %1, 1, !dbg !496
  %sub = sub i16 %add, 8, !dbg !497
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !498
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !498
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !498
  store i16 %sub, i16* %offset, align 2, !dbg !499
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !500
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !500
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !500
  %4 = load i16, i16* %reduce3, align 2, !dbg !500
  store i16 %4, i16* %i, align 2, !dbg !502
  br label %for.cond, !dbg !503

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i16, i16* %i, align 2, !dbg !504
  %cmp = icmp sge i16 %5, 0, !dbg !506
  br i1 %cmp, label %for.body, label %for.end, !dbg !507

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16* %op, metadata !508, metadata !DIExpression()), !dbg !510
  %6 = load i16, i16* %i, align 2, !dbg !511
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !512
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !512
  %offset5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 12, !dbg !512
  %8 = load i16, i16* %offset5, align 2, !dbg !512
  %sub6 = sub i16 %6, %8, !dbg !513
  store i16 %sub6, i16* %op, align 2, !dbg !510
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !514
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !514
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !514
  %10 = load i16, i16* %i, align 2, !dbg !516
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %10, !dbg !514
  %11 = load i16, i16* %arrayidx, align 2, !dbg !514
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !517
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !517
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !517
  %13 = load i16, i16* %op, align 2, !dbg !518
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %13, !dbg !517
  %14 = load i16, i16* %arrayidx9, align 2, !dbg !517
  %cmp10 = icmp ugt i16 %11, %14, !dbg !519
  br i1 %cmp10, label %if.then, label %if.else, !dbg !520

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !521

if.else:                                          ; preds = %for.body
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !523
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !523
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !523
  %16 = load i16, i16* %i, align 2, !dbg !525
  %arrayidx13 = getelementptr inbounds [16 x i16], [16 x i16]* %product12, i16 0, i16 %16, !dbg !523
  %17 = load i16, i16* %arrayidx13, align 2, !dbg !523
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !526
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !526
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !526
  %19 = load i16, i16* %op, align 2, !dbg !527
  %arrayidx16 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus15, i16 0, i16 %19, !dbg !526
  %20 = load i16, i16* %arrayidx16, align 2, !dbg !526
  %cmp17 = icmp ult i16 %17, %20, !dbg !528
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !529

if.then18:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !530
  br label %for.end, !dbg !532

if.end:                                           ; preds = %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end
  br label %for.inc, !dbg !533

for.inc:                                          ; preds = %if.end19
  %21 = load i16, i16* %i, align 2, !dbg !534
  %dec = add nsw i16 %21, -1, !dbg !534
  store i16 %dec, i16* %i, align 2, !dbg !534
  br label %for.cond, !dbg !535, !llvm.loop !536

for.end:                                          ; preds = %if.then18, %if.then, %for.cond
  %22 = load i8, i8* %normalizable, align 1, !dbg !538
  %tobool = trunc i8 %22 to i1, !dbg !538
  br i1 %tobool, label %if.end25, label %land.lhs.true, !dbg !540

land.lhs.true:                                    ; preds = %for.end
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !541
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !541
  %reduce21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 10, !dbg !541
  %24 = load i16, i16* %reduce21, align 2, !dbg !541
  %cmp22 = icmp eq i16 %24, 7, !dbg !542
  br i1 %cmp22, label %if.then23, label %if.end25, !dbg !543

if.then23:                                        ; preds = %land.lhs.true
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !544
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !544
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !544
  store i16 0, i16* %check, align 2, !dbg !546
  br label %if.end25, !dbg !547

if.end25:                                         ; preds = %if.then23, %land.lhs.true, %for.end
  %26 = load i8, i8* %normalizable, align 1, !dbg !548
  %tobool26 = trunc i8 %26 to i1, !dbg !548
  br i1 %tobool26, label %if.then27, label %if.else30, !dbg !550

if.then27:                                        ; preds = %if.end25
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !551
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !551
  %check29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 17, !dbg !551
  store i16 1, i16* %check29, align 2, !dbg !553
  br label %if.end33, !dbg !554

if.else30:                                        ; preds = %if.end25
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !555
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !555
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !555
  store i16 2, i16* %check32, align 2, !dbg !557
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then27
  ret void, !dbg !558
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalize() #0 !dbg !559 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %m, metadata !560, metadata !DIExpression()), !dbg !561
  call void @llvm.dbg.declare(metadata i16* %n, metadata !562, metadata !DIExpression()), !dbg !563
  call void @llvm.dbg.declare(metadata i16* %d, metadata !564, metadata !DIExpression()), !dbg !565
  call void @llvm.dbg.declare(metadata i16* %s, metadata !566, metadata !DIExpression()), !dbg !567
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !568, metadata !DIExpression()), !dbg !569
  call void @llvm.dbg.declare(metadata i16* %i, metadata !570, metadata !DIExpression()), !dbg !571
  store i16 0, i16* %borrow, align 2, !dbg !572
  store i16 0, i16* %i, align 2, !dbg !573
  br label %for.cond, !dbg !575

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !576
  %cmp = icmp slt i16 %0, 8, !dbg !578
  br i1 %cmp, label %for.body, label %for.end, !dbg !579

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16* %op, metadata !580, metadata !DIExpression()), !dbg !582
  %1 = load i16, i16* %i, align 2, !dbg !583
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !584
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !584
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !584
  %3 = load i16, i16* %offset, align 2, !dbg !584
  %add = add i16 %1, %3, !dbg !585
  store i16 %add, i16* %op, align 2, !dbg !582
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !586
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !586
  %5 = load i16, i16* %op, align 2, !dbg !587
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %5, !dbg !586
  %6 = load i16, i16* %arrayidx, align 2, !dbg !586
  store i16 %6, i16* %m, align 2, !dbg !588
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !589
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !589
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !589
  %8 = load i16, i16* %i, align 2, !dbg !590
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %8, !dbg !589
  %9 = load i16, i16* %arrayidx3, align 2, !dbg !589
  store i16 %9, i16* %n, align 2, !dbg !591
  %10 = load i16, i16* %n, align 2, !dbg !592
  %11 = load i16, i16* %borrow, align 2, !dbg !593
  %add4 = add i16 %10, %11, !dbg !594
  store i16 %add4, i16* %s, align 2, !dbg !595
  %12 = load i16, i16* %m, align 2, !dbg !596
  %13 = load i16, i16* %s, align 2, !dbg !598
  %cmp5 = icmp ult i16 %12, %13, !dbg !599
  br i1 %cmp5, label %if.then, label %if.else, !dbg !600

if.then:                                          ; preds = %for.body
  %14 = load i16, i16* %m, align 2, !dbg !601
  %add6 = add i16 %14, 256, !dbg !601
  store i16 %add6, i16* %m, align 2, !dbg !601
  store i16 1, i16* %borrow, align 2, !dbg !603
  br label %if.end, !dbg !604

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !605
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load i16, i16* %m, align 2, !dbg !607
  %16 = load i16, i16* %s, align 2, !dbg !608
  %sub = sub i16 %15, %16, !dbg !609
  store i16 %sub, i16* %d, align 2, !dbg !610
  %17 = load i16, i16* %d, align 2, !dbg !611
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !612
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !612
  %product8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !612
  %19 = load i16, i16* %op, align 2, !dbg !613
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product8, i16 0, i16 %19, !dbg !612
  store i16 %17, i16* %arrayidx9, align 2, !dbg !614
  br label %for.inc, !dbg !615

for.inc:                                          ; preds = %if.end
  %20 = load i16, i16* %i, align 2, !dbg !616
  %inc = add nsw i16 %20, 1, !dbg !616
  store i16 %inc, i16* %i, align 2, !dbg !616
  br label %for.cond, !dbg !617, !llvm.loop !618

for.end:                                          ; preds = %for.cond
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !620
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !620
  %offset11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !620
  %22 = load i16, i16* %offset11, align 2, !dbg !620
  %cmp12 = icmp ugt i16 %22, 0, !dbg !622
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !623

if.then13:                                        ; preds = %for.end
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !624
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !624
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 17, !dbg !624
  store i16 2, i16* %check, align 2, !dbg !626
  br label %if.end18, !dbg !627

if.else15:                                        ; preds = %for.end
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !628
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !628
  %check17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !628
  store i16 0, i16* %check17, align 2, !dbg !630
  br label %if.end18

if.end18:                                         ; preds = %if.else15, %if.then13
  ret void, !dbg !631
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_n_divisor() #0 !dbg !632 {
entry:
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !633, metadata !DIExpression()), !dbg !634
  store i16 7, i16* %op1, align 2, !dbg !634
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !635, metadata !DIExpression()), !dbg !636
  store i16 6, i16* %op2, align 2, !dbg !636
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !637
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !637
  %1 = load i16, i16* %op1, align 2, !dbg !638
  %arrayidx = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %1, !dbg !637
  %2 = load i16, i16* %arrayidx, align 2, !dbg !637
  %shl = shl i16 %2, 8, !dbg !639
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !640
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !640
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !640
  %4 = load i16, i16* %op2, align 2, !dbg !641
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus2, i16 0, i16 %4, !dbg !640
  %5 = load i16, i16* %arrayidx3, align 2, !dbg !640
  %add = add i16 %shl, %5, !dbg !642
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !643
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !643
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !643
  store i16 %add, i16* %n_div, align 2, !dbg !644
  ret void, !dbg !645
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_quotient() #0 !dbg !646 {
entry:
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %op3 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !647, metadata !DIExpression()), !dbg !648
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !649, metadata !DIExpression()), !dbg !650
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !651, metadata !DIExpression()), !dbg !652
  store i16 7, i16* %op1, align 2, !dbg !652
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !653, metadata !DIExpression()), !dbg !654
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !655
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !655
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !655
  %1 = load i16, i16* %reduce, align 2, !dbg !655
  %sub = sub i16 %1, 1, !dbg !656
  store i16 %sub, i16* %op2, align 2, !dbg !654
  call void @llvm.dbg.declare(metadata i16* %op3, metadata !657, metadata !DIExpression()), !dbg !658
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !659
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !659
  %reduce2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !659
  %3 = load i16, i16* %reduce2, align 2, !dbg !659
  %sub3 = sub i16 %3, 2, !dbg !660
  store i16 %sub3, i16* %op3, align 2, !dbg !658
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !661
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !661
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !661
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !663
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !663
  %reduce6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !663
  %6 = load i16, i16* %reduce6, align 2, !dbg !663
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %6, !dbg !661
  %7 = load i16, i16* %arrayidx, align 2, !dbg !661
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !664
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !664
  %9 = load i16, i16* %op1, align 2, !dbg !665
  %arrayidx8 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %9, !dbg !664
  %10 = load i16, i16* %arrayidx8, align 2, !dbg !664
  %cmp = icmp eq i16 %7, %10, !dbg !666
  br i1 %cmp, label %if.then, label %if.else, !dbg !667

if.then:                                          ; preds = %entry
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !668
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !668
  store i16 255, i16* %quotient, align 2, !dbg !670
  br label %if.end, !dbg !671

if.else:                                          ; preds = %entry
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !672
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !672
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !672
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !674
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !674
  %14 = load i16, i16* %reduce13, align 2, !dbg !674
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %14, !dbg !672
  %15 = load i16, i16* %arrayidx14, align 2, !dbg !672
  %shl = shl i16 %15, 8, !dbg !675
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !676
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !676
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !676
  %17 = load i16, i16* %op2, align 2, !dbg !677
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %17, !dbg !676
  %18 = load i16, i16* %arrayidx17, align 2, !dbg !676
  %add = add i16 %shl, %18, !dbg !678
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !679
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !679
  %modulus19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 7, !dbg !679
  %20 = load i16, i16* %op1, align 2, !dbg !680
  %arrayidx20 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus19, i16 0, i16 %20, !dbg !679
  %21 = load i16, i16* %arrayidx20, align 2, !dbg !679
  %div = udiv i16 %add, %21, !dbg !681
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !682
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !682
  %quotient22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 16, !dbg !682
  store i16 %div, i16* %quotient22, align 2, !dbg !683
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !684
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !684
  %product24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 0, !dbg !684
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !685
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !685
  %reduce26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 10, !dbg !685
  %25 = load i16, i16* %reduce26, align 2, !dbg !685
  %arrayidx27 = getelementptr inbounds [16 x i16], [16 x i16]* %product24, i16 0, i16 %25, !dbg !684
  %26 = load i16, i16* %arrayidx27, align 2, !dbg !684
  %conv = zext i16 %26 to i32, !dbg !686
  %shl28 = shl i32 %conv, 16, !dbg !687
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !688
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !688
  %product30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !688
  %28 = load i16, i16* %op2, align 2, !dbg !689
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %product30, i16 0, i16 %28, !dbg !688
  %29 = load i16, i16* %arrayidx31, align 2, !dbg !688
  %shl32 = shl i16 %29, 8, !dbg !690
  %conv33 = zext i16 %shl32 to i32, !dbg !691
  %add34 = add i32 %shl28, %conv33, !dbg !692
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !693
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !693
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !693
  %31 = load i16, i16* %op3, align 2, !dbg !694
  %arrayidx37 = getelementptr inbounds [16 x i16], [16 x i16]* %product36, i16 0, i16 %31, !dbg !693
  %32 = load i16, i16* %arrayidx37, align 2, !dbg !693
  %conv38 = zext i16 %32 to i32, !dbg !693
  %add39 = add i32 %add34, %conv38, !dbg !695
  store i32 %add39, i32* %n_q, align 2, !dbg !696
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !697
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !697
  %quotient41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 16, !dbg !697
  %34 = load i16, i16* %quotient41, align 2, !dbg !698
  %inc = add i16 %34, 1, !dbg !698
  store i16 %inc, i16* %quotient41, align 2, !dbg !698
  br label %do.body, !dbg !699

do.body:                                          ; preds = %do.cond, %if.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !700
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !700
  %quotient43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 16, !dbg !700
  %36 = load i16, i16* %quotient43, align 2, !dbg !702
  %dec = add i16 %36, -1, !dbg !702
  store i16 %dec, i16* %quotient43, align 2, !dbg !702
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !703
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !703
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 13, !dbg !703
  %38 = load i16, i16* %n_div, align 2, !dbg !703
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !704
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !704
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !704
  %40 = load i16, i16* %quotient46, align 2, !dbg !704
  %mul = mul i16 %38, %40, !dbg !705
  %conv47 = zext i16 %mul to i32, !dbg !703
  store i32 %conv47, i32* %qn, align 2, !dbg !706
  br label %do.cond, !dbg !707

do.cond:                                          ; preds = %do.body
  %41 = load i32, i32* %qn, align 2, !dbg !708
  %42 = load i32, i32* %n_q, align 2, !dbg !709
  %cmp48 = icmp ugt i32 %41, %42, !dbg !710
  br i1 %cmp48, label %do.body, label %do.end, !dbg !707, !llvm.loop !711

do.end:                                           ; preds = %do.cond
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !713
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !713
  %reduce51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 10, !dbg !713
  %44 = load i16, i16* %reduce51, align 2, !dbg !714
  %dec52 = add i16 %44, -1, !dbg !714
  store i16 %dec52, i16* %reduce51, align 2, !dbg !714
  ret void, !dbg !715
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_multiply() #0 !dbg !716 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !717, metadata !DIExpression()), !dbg !718
  call void @llvm.dbg.declare(metadata i16* %m, metadata !719, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.declare(metadata i16* %n, metadata !721, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.declare(metadata i16* %c, metadata !723, metadata !DIExpression()), !dbg !724
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !725, metadata !DIExpression()), !dbg !726
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !727
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !727
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !727
  %1 = load i16, i16* %reduce, align 2, !dbg !727
  %add = add i16 %1, 1, !dbg !728
  %sub = sub i16 %add, 8, !dbg !729
  store i16 %sub, i16* %offset, align 2, !dbg !730
  store i16 0, i16* %i, align 2, !dbg !731
  br label %for.cond, !dbg !733

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !734
  %3 = load i16, i16* %offset, align 2, !dbg !736
  %cmp = icmp ult i16 %2, %3, !dbg !737
  br i1 %cmp, label %for.body, label %for.end, !dbg !738

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !739
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !739
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !739
  %5 = load i16, i16* %i, align 2, !dbg !741
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %5, !dbg !739
  store i16 0, i16* %arrayidx, align 2, !dbg !742
  br label %for.inc, !dbg !743

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !744
  %inc = add nsw i16 %6, 1, !dbg !744
  store i16 %inc, i16* %i, align 2, !dbg !744
  br label %for.cond, !dbg !745, !llvm.loop !746

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !748
  %7 = load i16, i16* %offset, align 2, !dbg !749
  store i16 %7, i16* %i, align 2, !dbg !751
  br label %for.cond2, !dbg !752

for.cond2:                                        ; preds = %for.inc15, %for.end
  %8 = load i16, i16* %i, align 2, !dbg !753
  %cmp3 = icmp slt i16 %8, 16, !dbg !755
  br i1 %cmp3, label %for.body4, label %for.end17, !dbg !756

for.body4:                                        ; preds = %for.cond2
  %9 = load i16, i16* %c, align 2, !dbg !757
  store i16 %9, i16* %m, align 2, !dbg !759
  %10 = load i16, i16* %i, align 2, !dbg !760
  %11 = load i16, i16* %offset, align 2, !dbg !762
  %add5 = add i16 %11, 8, !dbg !763
  %cmp6 = icmp ult i16 %10, %add5, !dbg !764
  br i1 %cmp6, label %if.then, label %if.else, !dbg !765

if.then:                                          ; preds = %for.body4
  call void @llvm.dbg.declare(metadata i16* %op, metadata !766, metadata !DIExpression()), !dbg !768
  %12 = load i16, i16* %i, align 2, !dbg !769
  %13 = load i16, i16* %offset, align 2, !dbg !770
  %sub7 = sub i16 %12, %13, !dbg !771
  store i16 %sub7, i16* %op, align 2, !dbg !768
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !772
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !772
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !772
  %15 = load i16, i16* %op, align 2, !dbg !773
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !772
  %16 = load i16, i16* %arrayidx9, align 2, !dbg !772
  store i16 %16, i16* %n, align 2, !dbg !774
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !775
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !775
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !775
  %18 = load i16, i16* %quotient, align 2, !dbg !775
  %19 = load i16, i16* %n, align 2, !dbg !776
  %mul = mul i16 %18, %19, !dbg !777
  %20 = load i16, i16* %m, align 2, !dbg !778
  %add11 = add i16 %20, %mul, !dbg !778
  store i16 %add11, i16* %m, align 2, !dbg !778
  br label %if.end, !dbg !779

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !780
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %21 = load i16, i16* %m, align 2, !dbg !782
  %shr = lshr i16 %21, 8, !dbg !783
  store i16 %shr, i16* %c, align 2, !dbg !784
  %22 = load i16, i16* %m, align 2, !dbg !785
  %and = and i16 %22, 255, !dbg !785
  store i16 %and, i16* %m, align 2, !dbg !785
  %23 = load i16, i16* %m, align 2, !dbg !786
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !787
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !787
  %product213 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 14, !dbg !787
  %25 = load i16, i16* %i, align 2, !dbg !788
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product213, i16 0, i16 %25, !dbg !787
  store i16 %23, i16* %arrayidx14, align 2, !dbg !789
  br label %for.inc15, !dbg !790

for.inc15:                                        ; preds = %if.end
  %26 = load i16, i16* %i, align 2, !dbg !791
  %inc16 = add nsw i16 %26, 1, !dbg !791
  store i16 %inc16, i16* %i, align 2, !dbg !791
  br label %for.cond2, !dbg !792, !llvm.loop !793

for.end17:                                        ; preds = %for.cond2
  ret void, !dbg !795
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_compare() #0 !dbg !796 {
entry:
  %i = alloca i16, align 2
  %relation = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !797, metadata !DIExpression()), !dbg !798
  call void @llvm.dbg.declare(metadata i8* %relation, metadata !799, metadata !DIExpression()), !dbg !801
  store i8 61, i8* %relation, align 1, !dbg !801
  store i16 15, i16* %i, align 2, !dbg !802
  br label %for.cond, !dbg !804

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !805
  %cmp = icmp sge i16 %0, 0, !dbg !807
  br i1 %cmp, label %for.body, label %for.end, !dbg !808

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !809
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !809
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !809
  %2 = load i16, i16* %i, align 2, !dbg !812
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !809
  %3 = load i16, i16* %arrayidx, align 2, !dbg !809
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !813
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !813
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !813
  %5 = load i16, i16* %i, align 2, !dbg !814
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %5, !dbg !813
  %6 = load i16, i16* %arrayidx2, align 2, !dbg !813
  %cmp3 = icmp ugt i16 %3, %6, !dbg !815
  br i1 %cmp3, label %if.then, label %if.else, !dbg !816

if.then:                                          ; preds = %for.body
  store i8 62, i8* %relation, align 1, !dbg !817
  br label %for.end, !dbg !819

if.else:                                          ; preds = %for.body
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !820
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !820
  %product5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !820
  %8 = load i16, i16* %i, align 2, !dbg !822
  %arrayidx6 = getelementptr inbounds [16 x i16], [16 x i16]* %product5, i16 0, i16 %8, !dbg !820
  %9 = load i16, i16* %arrayidx6, align 2, !dbg !820
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !823
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !823
  %product28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !823
  %11 = load i16, i16* %i, align 2, !dbg !824
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product28, i16 0, i16 %11, !dbg !823
  %12 = load i16, i16* %arrayidx9, align 2, !dbg !823
  %cmp10 = icmp ult i16 %9, %12, !dbg !825
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !826

if.then11:                                        ; preds = %if.else
  store i8 60, i8* %relation, align 1, !dbg !827
  br label %for.end, !dbg !829

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc, !dbg !830

for.inc:                                          ; preds = %if.end12
  %13 = load i16, i16* %i, align 2, !dbg !831
  %dec = add nsw i16 %13, -1, !dbg !831
  store i16 %dec, i16* %i, align 2, !dbg !831
  br label %for.cond, !dbg !832, !llvm.loop !833

for.end:                                          ; preds = %if.then11, %if.then, %for.cond
  %14 = load i8, i8* %relation, align 1, !dbg !835
  %conv = sext i8 %14 to i16, !dbg !835
  %cmp13 = icmp eq i16 %conv, 60, !dbg !837
  br i1 %cmp13, label %if.then15, label %if.end17, !dbg !838

if.then15:                                        ; preds = %for.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !839
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !839
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !839
  store i16 0, i16* %check, align 2, !dbg !841
  br label %if.end17, !dbg !842

if.end17:                                         ; preds = %if.then15, %for.end
  ret void, !dbg !843
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_add() #0 !dbg !844 {
entry:
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !845, metadata !DIExpression()), !dbg !846
  call void @llvm.dbg.declare(metadata i16* %j, metadata !847, metadata !DIExpression()), !dbg !848
  call void @llvm.dbg.declare(metadata i16* %m, metadata !849, metadata !DIExpression()), !dbg !850
  call void @llvm.dbg.declare(metadata i16* %n, metadata !851, metadata !DIExpression()), !dbg !852
  call void @llvm.dbg.declare(metadata i16* %c, metadata !853, metadata !DIExpression()), !dbg !854
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !855, metadata !DIExpression()), !dbg !856
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !857
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !857
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !857
  %1 = load i16, i16* %reduce, align 2, !dbg !857
  %add = add i16 %1, 1, !dbg !858
  %sub = sub i16 %add, 8, !dbg !859
  store i16 %sub, i16* %offset, align 2, !dbg !860
  store i16 0, i16* %c, align 2, !dbg !861
  %2 = load i16, i16* %offset, align 2, !dbg !862
  store i16 %2, i16* %i, align 2, !dbg !864
  br label %for.cond, !dbg !865

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i16, i16* %i, align 2, !dbg !866
  %cmp = icmp slt i16 %3, 16, !dbg !868
  br i1 %cmp, label %for.body, label %for.end, !dbg !869

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !870
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !870
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !870
  %5 = load i16, i16* %i, align 2, !dbg !872
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %5, !dbg !870
  %6 = load i16, i16* %arrayidx, align 2, !dbg !870
  store i16 %6, i16* %m, align 2, !dbg !873
  %7 = load i16, i16* %i, align 2, !dbg !874
  %8 = load i16, i16* %offset, align 2, !dbg !875
  %sub2 = sub i16 %7, %8, !dbg !876
  store i16 %sub2, i16* %j, align 2, !dbg !877
  %9 = load i16, i16* %i, align 2, !dbg !878
  %10 = load i16, i16* %offset, align 2, !dbg !880
  %add3 = add i16 %10, 8, !dbg !881
  %cmp4 = icmp ult i16 %9, %add3, !dbg !882
  br i1 %cmp4, label %if.then, label %if.else, !dbg !883

if.then:                                          ; preds = %for.body
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !884
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !884
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !884
  %12 = load i16, i16* %j, align 2, !dbg !886
  %arrayidx6 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %12, !dbg !884
  %13 = load i16, i16* %arrayidx6, align 2, !dbg !884
  store i16 %13, i16* %n, align 2, !dbg !887
  br label %if.end, !dbg !888

if.else:                                          ; preds = %for.body
  store i16 0, i16* %n, align 2, !dbg !889
  store i16 0, i16* %j, align 2, !dbg !891
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i16, i16* %c, align 2, !dbg !892
  %15 = load i16, i16* %m, align 2, !dbg !893
  %add7 = add i16 %14, %15, !dbg !894
  %16 = load i16, i16* %n, align 2, !dbg !895
  %add8 = add i16 %add7, %16, !dbg !896
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !897
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !897
  %product10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !897
  %18 = load i16, i16* %i, align 2, !dbg !898
  %arrayidx11 = getelementptr inbounds [16 x i16], [16 x i16]* %product10, i16 0, i16 %18, !dbg !897
  store i16 %add8, i16* %arrayidx11, align 2, !dbg !899
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !900
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !900
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !900
  %20 = load i16, i16* %i, align 2, !dbg !901
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product13, i16 0, i16 %20, !dbg !900
  %21 = load i16, i16* %arrayidx14, align 2, !dbg !900
  %shr = lshr i16 %21, 8, !dbg !902
  store i16 %shr, i16* %c, align 2, !dbg !903
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !904
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !904
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !904
  %23 = load i16, i16* %i, align 2, !dbg !905
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %23, !dbg !904
  %24 = load i16, i16* %arrayidx17, align 2, !dbg !906
  %and = and i16 %24, 255, !dbg !906
  store i16 %and, i16* %arrayidx17, align 2, !dbg !906
  br label %for.inc, !dbg !907

for.inc:                                          ; preds = %if.end
  %25 = load i16, i16* %i, align 2, !dbg !908
  %inc = add nsw i16 %25, 1, !dbg !908
  store i16 %inc, i16* %i, align 2, !dbg !908
  br label %for.cond, !dbg !909, !llvm.loop !910

for.end:                                          ; preds = %for.cond
  ret void, !dbg !912
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_subtract() #0 !dbg !913 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !914, metadata !DIExpression()), !dbg !915
  call void @llvm.dbg.declare(metadata i16* %m, metadata !916, metadata !DIExpression()), !dbg !917
  call void @llvm.dbg.declare(metadata i16* %s, metadata !918, metadata !DIExpression()), !dbg !919
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !920, metadata !DIExpression()), !dbg !921
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !922, metadata !DIExpression()), !dbg !923
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !924, metadata !DIExpression()), !dbg !925
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !926
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !926
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !926
  %1 = load i16, i16* %reduce, align 2, !dbg !926
  %add = add i16 %1, 1, !dbg !927
  %sub = sub i16 %add, 8, !dbg !928
  store i16 %sub, i16* %offset, align 2, !dbg !929
  store i16 0, i16* %borrow, align 2, !dbg !930
  store i16 0, i16* %i, align 2, !dbg !931
  br label %for.cond, !dbg !933

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !934
  %cmp = icmp slt i16 %2, 16, !dbg !936
  br i1 %cmp, label %for.body, label %for.end, !dbg !937

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !938
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !938
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !938
  %4 = load i16, i16* %i, align 2, !dbg !940
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %4, !dbg !938
  %5 = load i16, i16* %arrayidx, align 2, !dbg !938
  store i16 %5, i16* %m, align 2, !dbg !941
  %6 = load i16, i16* %i, align 2, !dbg !942
  %7 = load i16, i16* %offset, align 2, !dbg !944
  %cmp2 = icmp uge i16 %6, %7, !dbg !945
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !946

if.then:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !947
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !947
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !947
  %9 = load i16, i16* %i, align 2, !dbg !949
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %9, !dbg !947
  %10 = load i16, i16* %arrayidx4, align 2, !dbg !947
  store i16 %10, i16* %qn, align 2, !dbg !950
  %11 = load i16, i16* %qn, align 2, !dbg !951
  %12 = load i16, i16* %borrow, align 2, !dbg !952
  %add5 = add i16 %11, %12, !dbg !953
  store i16 %add5, i16* %s, align 2, !dbg !954
  %13 = load i16, i16* %m, align 2, !dbg !955
  %14 = load i16, i16* %s, align 2, !dbg !957
  %cmp6 = icmp ult i16 %13, %14, !dbg !958
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !959

if.then7:                                         ; preds = %if.then
  %15 = load i16, i16* %m, align 2, !dbg !960
  %add8 = add i16 %15, 256, !dbg !960
  store i16 %add8, i16* %m, align 2, !dbg !960
  store i16 1, i16* %borrow, align 2, !dbg !962
  br label %if.end, !dbg !963

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !964
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %16 = load i16, i16* %m, align 2, !dbg !966
  %17 = load i16, i16* %s, align 2, !dbg !967
  %sub9 = sub i16 %16, %17, !dbg !968
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !969
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !969
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !969
  %19 = load i16, i16* %i, align 2, !dbg !970
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %19, !dbg !969
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !971
  br label %if.end13, !dbg !972

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !973

for.inc:                                          ; preds = %if.end13
  %20 = load i16, i16* %i, align 2, !dbg !974
  %inc = add nsw i16 %20, 1, !dbg !974
  store i16 %inc, i16* %i, align 2, !dbg !974
  br label %for.cond, !dbg !975, !llvm.loop !976

for.end:                                          ; preds = %for.cond
  ret void, !dbg !978
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !979 {
entry:
  ret void, !dbg !980
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !981 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !984
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !985
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !986
  call void @camel_init(), !dbg !987
  br label %while.body, !dbg !988

while.body:                                       ; preds = %entry, %while.end
  call void @task_init(), !dbg !989
  br label %do.body, !dbg !989

do.body:                                          ; preds = %while.body
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !991
  %cmp = icmp eq i16 %0, 1, !dbg !991
  br i1 %cmp, label %if.then, label %if.else, !dbg !994

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !995
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !995
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !995
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !995
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !995
  call void @__dump_registers(i16* %arraydecay), !dbg !995
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !995
  br label %if.end, !dbg !995

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !997
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !997
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !997
  %reg_file1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !997
  %arraydecay2 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file1, i16 0, i16 0, !dbg !997
  call void @__dump_registers(i16* %arraydecay2), !dbg !997
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !997
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !994

do.end:                                           ; preds = %if.end
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i32 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals1 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i32 0, i32 1
  %BCast3 = bitcast %struct.camel_global_t* %globals2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast, i8* align 2 %BCast3, i16 202, i1 false), !dbg !989
  call void @task_commit(), !dbg !989
  br label %while.body4, !dbg !999

while.body4:                                      ; preds = %do.end, %if.end243
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1000
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !1000
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 17, !dbg !1000
  %4 = load i16, i16* %check, align 2, !dbg !1000
  %cmp5 = icmp eq i16 %4, 0, !dbg !1003
  br i1 %cmp5, label %if.then6, label %if.end17, !dbg !1004

if.then6:                                         ; preds = %while.body4
  %unsafe4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe4, i32 0, i32 1
  %BCast6 = bitcast %struct.camel_global_t* %globals5 to i8*
  %safe7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe7, i32 0, i32 1
  %BCast9 = bitcast %struct.camel_global_t* %globals8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast6, i8* align 2 %BCast9, i16 202, i1 false), !dbg !1005
  call void @task_pad(), !dbg !1005
  br label %do.body7, !dbg !1005

do.body7:                                         ; preds = %if.then6
  %5 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1007
  %cmp8 = icmp eq i16 %5, 1, !dbg !1007
  br i1 %cmp8, label %if.then9, label %if.else12, !dbg !1010

if.then9:                                         ; preds = %do.body7
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1011
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1011
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1011
  %reg_file10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 0, !dbg !1011
  %arraydecay11 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file10, i16 0, i16 0, !dbg !1011
  call void @__dump_registers(i16* %arraydecay11), !dbg !1011
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1011
  br label %if.end15, !dbg !1011

if.else12:                                        ; preds = %do.body7
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1013
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1013
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1013
  %reg_file13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 0, !dbg !1013
  %arraydecay14 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file13, i16 0, i16 0, !dbg !1013
  call void @__dump_registers(i16* %arraydecay14), !dbg !1013
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1013
  br label %if.end15

if.end15:                                         ; preds = %if.else12, %if.then9
  br label %do.end16, !dbg !1010

do.end16:                                         ; preds = %if.end15
  call void @task_commit(), !dbg !1005
  br label %if.end17, !dbg !1015

if.end17:                                         ; preds = %do.end16, %while.body4
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1016
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !1016
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 17, !dbg !1016
  %9 = load i16, i16* %check19, align 2, !dbg !1016
  %cmp20 = icmp eq i16 %9, 2, !dbg !1018
  br i1 %cmp20, label %if.then21, label %if.end32, !dbg !1019

if.then21:                                        ; preds = %if.end17
  %unsafe10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe10, i32 0, i32 1
  %BCast12 = bitcast %struct.camel_global_t* %globals11 to i8*
  %safe13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe13, i32 0, i32 1
  %BCast15 = bitcast %struct.camel_global_t* %globals14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast12, i8* align 2 %BCast15, i16 202, i1 false), !dbg !1020
  call void @task_exp(), !dbg !1020
  br label %do.body22, !dbg !1020

do.body22:                                        ; preds = %if.then21
  %10 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1022
  %cmp23 = icmp eq i16 %10, 1, !dbg !1022
  br i1 %cmp23, label %if.then24, label %if.else27, !dbg !1025

if.then24:                                        ; preds = %do.body22
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1026
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1026
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1026
  %reg_file25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 0, !dbg !1026
  %arraydecay26 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file25, i16 0, i16 0, !dbg !1026
  call void @__dump_registers(i16* %arraydecay26), !dbg !1026
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1026
  br label %if.end30, !dbg !1026

if.else27:                                        ; preds = %do.body22
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1028
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1028
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1028
  %reg_file28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !1028
  %arraydecay29 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file28, i16 0, i16 0, !dbg !1028
  call void @__dump_registers(i16* %arraydecay29), !dbg !1028
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1028
  br label %if.end30

if.end30:                                         ; preds = %if.else27, %if.then24
  br label %do.end31, !dbg !1025

do.end31:                                         ; preds = %if.end30
  call void @task_commit(), !dbg !1020
  br label %if.end32, !dbg !1030

if.end32:                                         ; preds = %do.end31, %if.end17
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1031
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !1031
  %check34 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals33, i32 0, i32 17, !dbg !1031
  %14 = load i16, i16* %check34, align 2, !dbg !1031
  %cmp35 = icmp eq i16 %14, 0, !dbg !1033
  br i1 %cmp35, label %if.then36, label %if.else47, !dbg !1034

if.then36:                                        ; preds = %if.end32
  %unsafe16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe16, i32 0, i32 1
  %BCast18 = bitcast %struct.camel_global_t* %globals17 to i8*
  %safe19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe19, i32 0, i32 1
  %BCast21 = bitcast %struct.camel_global_t* %globals20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast18, i8* align 2 %BCast21, i16 202, i1 false), !dbg !1035
  call void @task_mult_block(), !dbg !1035
  br label %do.body37, !dbg !1035

do.body37:                                        ; preds = %if.then36
  %15 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1037
  %cmp38 = icmp eq i16 %15, 1, !dbg !1037
  br i1 %cmp38, label %if.then39, label %if.else42, !dbg !1040

if.then39:                                        ; preds = %do.body37
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1041
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1041
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1041
  %reg_file40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 0, !dbg !1041
  %arraydecay41 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file40, i16 0, i16 0, !dbg !1041
  call void @__dump_registers(i16* %arraydecay41), !dbg !1041
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1041
  br label %if.end45, !dbg !1041

if.else42:                                        ; preds = %do.body37
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1043
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1043
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1043
  %reg_file43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 0, !dbg !1043
  %arraydecay44 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file43, i16 0, i16 0, !dbg !1043
  call void @__dump_registers(i16* %arraydecay44), !dbg !1043
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1043
  br label %if.end45

if.end45:                                         ; preds = %if.else42, %if.then39
  br label %do.end46, !dbg !1040

do.end46:                                         ; preds = %if.end45
  call void @task_commit(), !dbg !1035
  br label %if.end63, !dbg !1045

if.else47:                                        ; preds = %if.end32
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1046
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !1046
  %check49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 17, !dbg !1046
  %19 = load i16, i16* %check49, align 2, !dbg !1046
  %cmp50 = icmp eq i16 %19, 1, !dbg !1048
  br i1 %cmp50, label %if.then51, label %if.end62, !dbg !1049

if.then51:                                        ; preds = %if.else47
  %unsafe22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe22, i32 0, i32 1
  %BCast24 = bitcast %struct.camel_global_t* %globals23 to i8*
  %safe25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe25, i32 0, i32 1
  %BCast27 = bitcast %struct.camel_global_t* %globals26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast24, i8* align 2 %BCast27, i16 202, i1 false), !dbg !1050
  call void @task_square_base(), !dbg !1050
  br label %do.body52, !dbg !1050

do.body52:                                        ; preds = %if.then51
  %20 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1052
  %cmp53 = icmp eq i16 %20, 1, !dbg !1052
  br i1 %cmp53, label %if.then54, label %if.else57, !dbg !1055

if.then54:                                        ; preds = %do.body52
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1056
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1056
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1056
  %reg_file55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !1056
  %arraydecay56 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file55, i16 0, i16 0, !dbg !1056
  call void @__dump_registers(i16* %arraydecay56), !dbg !1056
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1056
  br label %if.end60, !dbg !1056

if.else57:                                        ; preds = %do.body52
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1058
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1058
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1058
  %reg_file58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 0, !dbg !1058
  %arraydecay59 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file58, i16 0, i16 0, !dbg !1058
  call void @__dump_registers(i16* %arraydecay59), !dbg !1058
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1058
  br label %if.end60

if.end60:                                         ; preds = %if.else57, %if.then54
  br label %do.end61, !dbg !1055

do.end61:                                         ; preds = %if.end60
  call void @task_commit(), !dbg !1050
  br label %if.end62, !dbg !1060

if.end62:                                         ; preds = %do.end61, %if.else47
  br label %if.end63

if.end63:                                         ; preds = %if.end62, %do.end46
  %unsafe28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe28, i32 0, i32 1
  %BCast30 = bitcast %struct.camel_global_t* %globals29 to i8*
  %safe31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe31, i32 0, i32 1
  %BCast33 = bitcast %struct.camel_global_t* %globals32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast30, i8* align 2 %BCast33, i16 202, i1 false), !dbg !1061
  call void @task_mult_mod(), !dbg !1061
  br label %do.body64, !dbg !1061

do.body64:                                        ; preds = %if.end63
  %23 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1062
  %cmp65 = icmp eq i16 %23, 1, !dbg !1062
  br i1 %cmp65, label %if.then66, label %if.else69, !dbg !1065

if.then66:                                        ; preds = %do.body64
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1066
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1066
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1066
  %reg_file67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 0, !dbg !1066
  %arraydecay68 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file67, i16 0, i16 0, !dbg !1066
  call void @__dump_registers(i16* %arraydecay68), !dbg !1066
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1066
  br label %if.end72, !dbg !1066

if.else69:                                        ; preds = %do.body64
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1068
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1068
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1068
  %reg_file70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !1068
  %arraydecay71 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file70, i16 0, i16 0, !dbg !1068
  call void @__dump_registers(i16* %arraydecay71), !dbg !1068
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1068
  br label %if.end72

if.end72:                                         ; preds = %if.else69, %if.then66
  br label %do.end73, !dbg !1065

do.end73:                                         ; preds = %if.end72
  call void @task_commit(), !dbg !1061
  br label %do.body74, !dbg !1070

do.body74:                                        ; preds = %do.cond, %do.end73
  %unsafe34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe34, i32 0, i32 1
  %BCast36 = bitcast %struct.camel_global_t* %globals35 to i8*
  %safe37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe37, i32 0, i32 1
  %BCast39 = bitcast %struct.camel_global_t* %globals38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast36, i8* align 2 %BCast39, i16 202, i1 false), !dbg !1071
  call void @task_mult(), !dbg !1071
  br label %do.body75, !dbg !1071

do.body75:                                        ; preds = %do.body74
  %26 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1073
  %cmp76 = icmp eq i16 %26, 1, !dbg !1073
  br i1 %cmp76, label %if.then77, label %if.else80, !dbg !1076

if.then77:                                        ; preds = %do.body75
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1077
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %reg_file78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 0, !dbg !1077
  %arraydecay79 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file78, i16 0, i16 0, !dbg !1077
  call void @__dump_registers(i16* %arraydecay79), !dbg !1077
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1077
  br label %if.end83, !dbg !1077

if.else80:                                        ; preds = %do.body75
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1079
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1079
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1079
  %reg_file81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 0, !dbg !1079
  %arraydecay82 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file81, i16 0, i16 0, !dbg !1079
  call void @__dump_registers(i16* %arraydecay82), !dbg !1079
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1079
  br label %if.end83

if.end83:                                         ; preds = %if.else80, %if.then77
  br label %do.end84, !dbg !1076

do.end84:                                         ; preds = %if.end83
  call void @task_commit(), !dbg !1071
  br label %do.cond, !dbg !1081

do.cond:                                          ; preds = %do.end84
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1082
  %globals85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !1082
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals85, i32 0, i32 8, !dbg !1082
  %30 = load i16, i16* %digit, align 2, !dbg !1082
  %cmp86 = icmp ult i16 %30, 16, !dbg !1083
  br i1 %cmp86, label %do.body74, label %do.end87, !dbg !1081, !llvm.loop !1084

do.end87:                                         ; preds = %do.cond
  %unsafe40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe40, i32 0, i32 1
  %BCast42 = bitcast %struct.camel_global_t* %globals41 to i8*
  %safe43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe43, i32 0, i32 1
  %BCast45 = bitcast %struct.camel_global_t* %globals44 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast42, i8* align 2 %BCast45, i16 202, i1 false), !dbg !1086
  call void @task_reduce_digits(), !dbg !1086
  br label %do.body88, !dbg !1086

do.body88:                                        ; preds = %do.end87
  %31 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1087
  %cmp89 = icmp eq i16 %31, 1, !dbg !1087
  br i1 %cmp89, label %if.then90, label %if.else93, !dbg !1090

if.then90:                                        ; preds = %do.body88
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1091
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1091
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1091
  %reg_file91 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !1091
  %arraydecay92 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file91, i16 0, i16 0, !dbg !1091
  call void @__dump_registers(i16* %arraydecay92), !dbg !1091
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1091
  br label %if.end96, !dbg !1091

if.else93:                                        ; preds = %do.body88
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1093
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1093
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1093
  %reg_file94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 0, !dbg !1093
  %arraydecay95 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file94, i16 0, i16 0, !dbg !1093
  call void @__dump_registers(i16* %arraydecay95), !dbg !1093
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1093
  br label %if.end96

if.end96:                                         ; preds = %if.else93, %if.then90
  br label %do.end98, !dbg !1090

do.end98:                                         ; preds = %if.end96
  call void @task_commit(), !dbg !1086
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1095
  %globals99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !1095
  %check100 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals99, i32 0, i32 17, !dbg !1095
  %35 = load i16, i16* %check100, align 2, !dbg !1095
  %cmp101 = icmp eq i16 %35, 0, !dbg !1097
  br i1 %cmp101, label %if.then102, label %if.end103, !dbg !1098

if.then102:                                       ; preds = %do.end98
  br label %while.end, !dbg !1099

if.end103:                                        ; preds = %do.end98
  %unsafe46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe46, i32 0, i32 1
  %BCast48 = bitcast %struct.camel_global_t* %globals47 to i8*
  %safe49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe49, i32 0, i32 1
  %BCast51 = bitcast %struct.camel_global_t* %globals50 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast48, i8* align 2 %BCast51, i16 202, i1 false), !dbg !1100
  call void @task_reduce_normalizable(), !dbg !1100
  br label %do.body104, !dbg !1100

do.body104:                                       ; preds = %if.end103
  %36 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1101
  %cmp105 = icmp eq i16 %36, 1, !dbg !1101
  br i1 %cmp105, label %if.then106, label %if.else109, !dbg !1104

if.then106:                                       ; preds = %do.body104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1105
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1105
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1105
  %reg_file107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 0, !dbg !1105
  %arraydecay108 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file107, i16 0, i16 0, !dbg !1105
  call void @__dump_registers(i16* %arraydecay108), !dbg !1105
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1105
  br label %if.end112, !dbg !1105

if.else109:                                       ; preds = %do.body104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1107
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1107
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1107
  %reg_file110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 0, !dbg !1107
  %arraydecay111 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file110, i16 0, i16 0, !dbg !1107
  call void @__dump_registers(i16* %arraydecay111), !dbg !1107
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1107
  br label %if.end112

if.end112:                                        ; preds = %if.else109, %if.then106
  br label %do.end114, !dbg !1104

do.end114:                                        ; preds = %if.end112
  call void @task_commit(), !dbg !1100
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1109
  %globals115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !1109
  %check116 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals115, i32 0, i32 17, !dbg !1109
  %40 = load i16, i16* %check116, align 2, !dbg !1109
  %cmp117 = icmp eq i16 %40, 1, !dbg !1111
  br i1 %cmp117, label %if.then118, label %if.end130, !dbg !1112

if.then118:                                       ; preds = %do.end114
  %unsafe52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe52, i32 0, i32 1
  %BCast54 = bitcast %struct.camel_global_t* %globals53 to i8*
  %safe55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe55, i32 0, i32 1
  %BCast57 = bitcast %struct.camel_global_t* %globals56 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast54, i8* align 2 %BCast57, i16 202, i1 false), !dbg !1113
  call void @task_reduce_normalize(), !dbg !1113
  br label %do.body119, !dbg !1113

do.body119:                                       ; preds = %if.then118
  %41 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1115
  %cmp120 = icmp eq i16 %41, 1, !dbg !1115
  br i1 %cmp120, label %if.then121, label %if.else124, !dbg !1118

if.then121:                                       ; preds = %do.body119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1119
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1119
  %reg_file122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 0, !dbg !1119
  %arraydecay123 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file122, i16 0, i16 0, !dbg !1119
  call void @__dump_registers(i16* %arraydecay123), !dbg !1119
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1119
  br label %if.end127, !dbg !1119

if.else124:                                       ; preds = %do.body119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1121
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1121
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1121
  %reg_file125 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !1121
  %arraydecay126 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file125, i16 0, i16 0, !dbg !1121
  call void @__dump_registers(i16* %arraydecay126), !dbg !1121
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1121
  br label %if.end127

if.end127:                                        ; preds = %if.else124, %if.then121
  br label %do.end129, !dbg !1118

do.end129:                                        ; preds = %if.end127
  call void @task_commit(), !dbg !1113
  br label %if.end130, !dbg !1123

if.end130:                                        ; preds = %do.end129, %do.end114
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1124
  %globals131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !1124
  %check132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals131, i32 0, i32 17, !dbg !1124
  %45 = load i16, i16* %check132, align 2, !dbg !1124
  %cmp133 = icmp eq i16 %45, 2, !dbg !1126
  br i1 %cmp133, label %if.then134, label %if.end211, !dbg !1127

if.then134:                                       ; preds = %if.end130
  %unsafe58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe58, i32 0, i32 1
  %BCast60 = bitcast %struct.camel_global_t* %globals59 to i8*
  %safe61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe61, i32 0, i32 1
  %BCast63 = bitcast %struct.camel_global_t* %globals62 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast60, i8* align 2 %BCast63, i16 202, i1 false), !dbg !1128
  call void @task_reduce_n_divisor(), !dbg !1128
  br label %do.body135, !dbg !1128

do.body135:                                       ; preds = %if.then134
  %46 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1130
  %cmp136 = icmp eq i16 %46, 1, !dbg !1130
  br i1 %cmp136, label %if.then137, label %if.else140, !dbg !1133

if.then137:                                       ; preds = %do.body135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1134
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1134
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1134
  %reg_file138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 0, !dbg !1134
  %arraydecay139 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file138, i16 0, i16 0, !dbg !1134
  call void @__dump_registers(i16* %arraydecay139), !dbg !1134
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1134
  br label %if.end143, !dbg !1134

if.else140:                                       ; preds = %do.body135
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1136
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1136
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1136
  %reg_file141 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 0, !dbg !1136
  %arraydecay142 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file141, i16 0, i16 0, !dbg !1136
  call void @__dump_registers(i16* %arraydecay142), !dbg !1136
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1136
  br label %if.end143

if.end143:                                        ; preds = %if.else140, %if.then137
  br label %do.end145, !dbg !1133

do.end145:                                        ; preds = %if.end143
  call void @task_commit(), !dbg !1128
  br label %do.body146, !dbg !1138

do.body146:                                       ; preds = %do.cond207, %do.end145
  %unsafe64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe64, i32 0, i32 1
  %BCast66 = bitcast %struct.camel_global_t* %globals65 to i8*
  %safe67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe67, i32 0, i32 1
  %BCast69 = bitcast %struct.camel_global_t* %globals68 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast66, i8* align 2 %BCast69, i16 202, i1 false), !dbg !1139
  call void @task_reduce_quotient(), !dbg !1139
  br label %do.body147, !dbg !1139

do.body147:                                       ; preds = %do.body146
  %49 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1141
  %cmp148 = icmp eq i16 %49, 1, !dbg !1141
  br i1 %cmp148, label %if.then149, label %if.else152, !dbg !1144

if.then149:                                       ; preds = %do.body147
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1145
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1145
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1145
  %reg_file150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 0, !dbg !1145
  %arraydecay151 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file150, i16 0, i16 0, !dbg !1145
  call void @__dump_registers(i16* %arraydecay151), !dbg !1145
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1145
  br label %if.end155, !dbg !1145

if.else152:                                       ; preds = %do.body147
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1147
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1147
  %reg_file153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 0, !dbg !1147
  %arraydecay154 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file153, i16 0, i16 0, !dbg !1147
  call void @__dump_registers(i16* %arraydecay154), !dbg !1147
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1147
  br label %if.end155

if.end155:                                        ; preds = %if.else152, %if.then149
  br label %do.end157, !dbg !1144

do.end157:                                        ; preds = %if.end155
  call void @task_commit(), !dbg !1139
  %unsafe70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe70, i32 0, i32 1
  %BCast72 = bitcast %struct.camel_global_t* %globals71 to i8*
  %safe73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe73, i32 0, i32 1
  %BCast75 = bitcast %struct.camel_global_t* %globals74 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast72, i8* align 2 %BCast75, i16 202, i1 false), !dbg !1149
  call void @task_reduce_multiply(), !dbg !1149
  br label %do.body158, !dbg !1149

do.body158:                                       ; preds = %do.end157
  %52 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1150
  %cmp159 = icmp eq i16 %52, 1, !dbg !1150
  br i1 %cmp159, label %if.then160, label %if.else163, !dbg !1153

if.then160:                                       ; preds = %do.body158
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1154
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1154
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1154
  %reg_file161 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 0, !dbg !1154
  %arraydecay162 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file161, i16 0, i16 0, !dbg !1154
  call void @__dump_registers(i16* %arraydecay162), !dbg !1154
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1154
  br label %if.end166, !dbg !1154

if.else163:                                       ; preds = %do.body158
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1156
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1156
  %54 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1156
  %reg_file164 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %54, i32 0, i32 0, !dbg !1156
  %arraydecay165 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file164, i16 0, i16 0, !dbg !1156
  call void @__dump_registers(i16* %arraydecay165), !dbg !1156
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1156
  br label %if.end166

if.end166:                                        ; preds = %if.else163, %if.then160
  br label %do.end168, !dbg !1153

do.end168:                                        ; preds = %if.end166
  call void @task_commit(), !dbg !1149
  %unsafe76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals77 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe76, i32 0, i32 1
  %BCast78 = bitcast %struct.camel_global_t* %globals77 to i8*
  %safe79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals80 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe79, i32 0, i32 1
  %BCast81 = bitcast %struct.camel_global_t* %globals80 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast78, i8* align 2 %BCast81, i16 202, i1 false), !dbg !1158
  call void @task_reduce_compare(), !dbg !1158
  br label %do.body169, !dbg !1158

do.body169:                                       ; preds = %do.end168
  %55 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1159
  %cmp170 = icmp eq i16 %55, 1, !dbg !1159
  br i1 %cmp170, label %if.then171, label %if.else174, !dbg !1162

if.then171:                                       ; preds = %do.body169
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1163
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1163
  %56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1163
  %reg_file172 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %56, i32 0, i32 0, !dbg !1163
  %arraydecay173 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file172, i16 0, i16 0, !dbg !1163
  call void @__dump_registers(i16* %arraydecay173), !dbg !1163
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1163
  br label %if.end177, !dbg !1163

if.else174:                                       ; preds = %do.body169
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1165
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1165
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1165
  %reg_file175 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 0, !dbg !1165
  %arraydecay176 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file175, i16 0, i16 0, !dbg !1165
  call void @__dump_registers(i16* %arraydecay176), !dbg !1165
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1165
  br label %if.end177

if.end177:                                        ; preds = %if.else174, %if.then171
  br label %do.end179, !dbg !1162

do.end179:                                        ; preds = %if.end177
  call void @task_commit(), !dbg !1158
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1167
  %globals180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i32 0, i32 1, !dbg !1167
  %check181 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals180, i32 0, i32 17, !dbg !1167
  %59 = load i16, i16* %check181, align 2, !dbg !1167
  %cmp182 = icmp eq i16 %59, 0, !dbg !1169
  br i1 %cmp182, label %if.then183, label %if.end195, !dbg !1170

if.then183:                                       ; preds = %do.end179
  %unsafe82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe82, i32 0, i32 1
  %BCast84 = bitcast %struct.camel_global_t* %globals83 to i8*
  %safe85 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe85, i32 0, i32 1
  %BCast87 = bitcast %struct.camel_global_t* %globals86 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast84, i8* align 2 %BCast87, i16 202, i1 false), !dbg !1171
  call void @task_reduce_compare(), !dbg !1171
  br label %do.body184, !dbg !1171

do.body184:                                       ; preds = %if.then183
  %60 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1173
  %cmp185 = icmp eq i16 %60, 1, !dbg !1173
  br i1 %cmp185, label %if.then186, label %if.else189, !dbg !1176

if.then186:                                       ; preds = %do.body184
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1177
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1177
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1177
  %reg_file187 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 0, !dbg !1177
  %arraydecay188 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file187, i16 0, i16 0, !dbg !1177
  call void @__dump_registers(i16* %arraydecay188), !dbg !1177
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1177
  br label %if.end192, !dbg !1177

if.else189:                                       ; preds = %do.body184
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1179
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1179
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1179
  %reg_file190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i32 0, i32 0, !dbg !1179
  %arraydecay191 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file190, i16 0, i16 0, !dbg !1179
  call void @__dump_registers(i16* %arraydecay191), !dbg !1179
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1179
  br label %if.end192

if.end192:                                        ; preds = %if.else189, %if.then186
  br label %do.end194, !dbg !1176

do.end194:                                        ; preds = %if.end192
  call void @task_commit(), !dbg !1171
  br label %if.end195, !dbg !1181

if.end195:                                        ; preds = %do.end194, %do.end179
  %unsafe88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe88, i32 0, i32 1
  %BCast90 = bitcast %struct.camel_global_t* %globals89 to i8*
  %safe91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe91, i32 0, i32 1
  %BCast93 = bitcast %struct.camel_global_t* %globals92 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast90, i8* align 2 %BCast93, i16 202, i1 false), !dbg !1182
  call void @task_reduce_subtract(), !dbg !1182
  br label %do.body196, !dbg !1182

do.body196:                                       ; preds = %if.end195
  %63 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1183
  %cmp197 = icmp eq i16 %63, 1, !dbg !1183
  br i1 %cmp197, label %if.then198, label %if.else201, !dbg !1186

if.then198:                                       ; preds = %do.body196
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1187
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1187
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1187
  %reg_file199 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %64, i32 0, i32 0, !dbg !1187
  %arraydecay200 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file199, i16 0, i16 0, !dbg !1187
  call void @__dump_registers(i16* %arraydecay200), !dbg !1187
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1187
  br label %if.end204, !dbg !1187

if.else201:                                       ; preds = %do.body196
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1189
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1189
  %reg_file202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 0, !dbg !1189
  %arraydecay203 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file202, i16 0, i16 0, !dbg !1189
  call void @__dump_registers(i16* %arraydecay203), !dbg !1189
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1189
  br label %if.end204

if.end204:                                        ; preds = %if.else201, %if.then198
  br label %do.end206, !dbg !1186

do.end206:                                        ; preds = %if.end204
  call void @task_commit(), !dbg !1182
  br label %do.cond207, !dbg !1191

do.cond207:                                       ; preds = %do.end206
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1192
  %globals208 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 1, !dbg !1192
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals208, i32 0, i32 10, !dbg !1192
  %67 = load i16, i16* %reduce, align 2, !dbg !1192
  %add = add i16 %67, 1, !dbg !1193
  %cmp209 = icmp ugt i16 %add, 8, !dbg !1194
  br i1 %cmp209, label %do.body146, label %do.end210, !dbg !1191, !llvm.loop !1195

do.end210:                                        ; preds = %do.cond207
  br label %if.end211, !dbg !1197

if.end211:                                        ; preds = %do.end210, %if.end130
  %68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1198
  %globals212 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %68, i32 0, i32 1, !dbg !1198
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals212, i32 0, i32 18, !dbg !1198
  %69 = load i16, i16* %check_final, align 2, !dbg !1198
  %cmp213 = icmp eq i16 %69, 0, !dbg !1200
  br i1 %cmp213, label %if.then214, label %if.else226, !dbg !1201

if.then214:                                       ; preds = %if.end211
  %unsafe94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals95 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe94, i32 0, i32 1
  %BCast96 = bitcast %struct.camel_global_t* %globals95 to i8*
  %safe97 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe97, i32 0, i32 1
  %BCast99 = bitcast %struct.camel_global_t* %globals98 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast96, i8* align 2 %BCast99, i16 202, i1 false), !dbg !1202
  call void @task_mult_block_get_result(), !dbg !1202
  br label %do.body215, !dbg !1202

do.body215:                                       ; preds = %if.then214
  %70 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1204
  %cmp216 = icmp eq i16 %70, 1, !dbg !1204
  br i1 %cmp216, label %if.then217, label %if.else220, !dbg !1207

if.then217:                                       ; preds = %do.body215
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1208
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1208
  %71 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1208
  %reg_file218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %71, i32 0, i32 0, !dbg !1208
  %arraydecay219 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file218, i16 0, i16 0, !dbg !1208
  call void @__dump_registers(i16* %arraydecay219), !dbg !1208
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1208
  br label %if.end223, !dbg !1208

if.else220:                                       ; preds = %do.body215
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1210
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1210
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1210
  %reg_file221 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i32 0, i32 0, !dbg !1210
  %arraydecay222 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file221, i16 0, i16 0, !dbg !1210
  call void @__dump_registers(i16* %arraydecay222), !dbg !1210
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1210
  br label %if.end223

if.end223:                                        ; preds = %if.else220, %if.then217
  br label %do.end225, !dbg !1207

do.end225:                                        ; preds = %if.end223
  call void @task_commit(), !dbg !1202
  br label %if.end243, !dbg !1212

if.else226:                                       ; preds = %if.end211
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1213
  %globals227 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 1, !dbg !1213
  %check_final228 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals227, i32 0, i32 18, !dbg !1213
  %74 = load i16, i16* %check_final228, align 2, !dbg !1213
  %cmp229 = icmp eq i16 %74, 1, !dbg !1215
  br i1 %cmp229, label %if.then230, label %if.end242, !dbg !1216

if.then230:                                       ; preds = %if.else226
  %unsafe100 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals101 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe100, i32 0, i32 1
  %BCast102 = bitcast %struct.camel_global_t* %globals101 to i8*
  %safe103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals104 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe103, i32 0, i32 1
  %BCast105 = bitcast %struct.camel_global_t* %globals104 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast102, i8* align 2 %BCast105, i16 202, i1 false), !dbg !1217
  call void @task_square_base_get_result(), !dbg !1217
  br label %do.body231, !dbg !1217

do.body231:                                       ; preds = %if.then230
  %75 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1219
  %cmp232 = icmp eq i16 %75, 1, !dbg !1219
  br i1 %cmp232, label %if.then233, label %if.else236, !dbg !1222

if.then233:                                       ; preds = %do.body231
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1223
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1223
  %76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1223
  %reg_file234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %76, i32 0, i32 0, !dbg !1223
  %arraydecay235 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file234, i16 0, i16 0, !dbg !1223
  call void @__dump_registers(i16* %arraydecay235), !dbg !1223
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1223
  br label %if.end239, !dbg !1223

if.else236:                                       ; preds = %do.body231
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1225
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1225
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1225
  %reg_file237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 0, !dbg !1225
  %arraydecay238 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file237, i16 0, i16 0, !dbg !1225
  call void @__dump_registers(i16* %arraydecay238), !dbg !1225
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1225
  br label %if.end239

if.end239:                                        ; preds = %if.else236, %if.then233
  br label %do.end241, !dbg !1222

do.end241:                                        ; preds = %if.end239
  call void @task_commit(), !dbg !1217
  br label %if.end242, !dbg !1227

if.end242:                                        ; preds = %do.end241, %if.else226
  br label %if.end243

if.end243:                                        ; preds = %if.end242, %do.end225
  br label %while.body4, !dbg !999, !llvm.loop !1228

while.end:                                        ; preds = %if.then102
  br label %while.body, !dbg !988, !llvm.loop !1230
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #4

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!95, !96, !97}
!llvm.ident = !{!98}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 146, type: !90, isLocal: false, isDefinition: true)
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
!12 = !{!13, !18, !23, !0, !25, !67, !69, !72, !84}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 719, type: !15, isLocal: true, isDefinition: true)
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
!26 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 153, type: !27, isLocal: false, isDefinition: true)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 16)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 139, baseType: !29)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 134, size: 1808, elements: !30)
!30 = !{!31, !36, !66}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !29, file: !3, line: 136, baseType: !32, size: 176)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !33, size: 176, elements: !34)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 53, baseType: !20)
!34 = !{!35}
!35 = !DISubrange(count: 11)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !29, file: !3, line: 137, baseType: !37, size: 1616, offset: 176)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 131, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 106, size: 1616, elements: !39)
!39 = !{!40, !45, !46, !47, !48, !49, !50, !51, !55, !56, !57, !58, !59, !60, !61, !62, !63, !64, !65}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "product", scope: !38, file: !3, line: 109, baseType: !41, size: 256)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 256, elements: !43)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "digit_t", file: !3, line: 17, baseType: !20)
!43 = !{!44}
!44 = !DISubrange(count: 16)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "exponent", scope: !38, file: !3, line: 110, baseType: !42, size: 16, offset: 256)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "exponent_next", scope: !38, file: !3, line: 111, baseType: !42, size: 16, offset: 272)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "block_offset", scope: !38, file: !3, line: 112, baseType: !6, size: 16, offset: 288)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "message_length", scope: !38, file: !3, line: 113, baseType: !6, size: 16, offset: 304)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext_len", scope: !38, file: !3, line: 114, baseType: !6, size: 16, offset: 320)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "base", scope: !38, file: !3, line: 115, baseType: !41, size: 256, offset: 336)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "modulus", scope: !38, file: !3, line: 116, baseType: !52, size: 128, offset: 592)
!52 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 128, elements: !53)
!53 = !{!54}
!54 = !DISubrange(count: 8)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "digit", scope: !38, file: !3, line: 117, baseType: !42, size: 16, offset: 720)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "carry", scope: !38, file: !3, line: 118, baseType: !42, size: 16, offset: 736)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "reduce", scope: !38, file: !3, line: 119, baseType: !6, size: 16, offset: 752)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "cyphertext", scope: !38, file: !3, line: 120, baseType: !41, size: 256, offset: 768)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "offset", scope: !38, file: !3, line: 121, baseType: !6, size: 16, offset: 1024)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "n_div", scope: !38, file: !3, line: 122, baseType: !42, size: 16, offset: 1040)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "product2", scope: !38, file: !3, line: 123, baseType: !41, size: 256, offset: 1056)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "block", scope: !38, file: !3, line: 124, baseType: !41, size: 256, offset: 1312)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "quotient", scope: !38, file: !3, line: 125, baseType: !6, size: 16, offset: 1568)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !38, file: !3, line: 128, baseType: !6, size: 16, offset: 1584)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "check_final", scope: !38, file: !3, line: 129, baseType: !6, size: 16, offset: 1600)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !29, file: !3, line: 138, baseType: !20, size: 16, offset: 1792)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 153, type: !27, isLocal: false, isDefinition: true)
!69 = !DIGlobalVariableExpression(var: !70, expr: !DIExpression())
!70 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 182, type: !71, isLocal: false, isDefinition: true)
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
!90 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 141, size: 3632, elements: !91)
!91 = !{!92, !93, !94}
!92 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !90, file: !3, line: 143, baseType: !20, size: 16)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !90, file: !3, line: 144, baseType: !28, size: 1808, offset: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !90, file: !3, line: 145, baseType: !28, size: 1808, offset: 1824)
!95 = !{i32 2, !"Dwarf Version", i32 4}
!96 = !{i32 2, !"Debug Info Version", i32 3}
!97 = !{i32 1, !"wchar_size", i32 2}
!98 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!99 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 155, type: !16, scopeLine: 155, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!100 = !DILocation(line: 156, column: 10, scope: !99)
!101 = !DILocation(line: 158, column: 9, scope: !99)
!102 = !DILocation(line: 160, column: 9, scope: !99)
!103 = !DILocation(line: 165, column: 11, scope: !99)
!104 = !DILocation(line: 170, column: 12, scope: !99)
!105 = !DILocation(line: 171, column: 10, scope: !99)
!106 = !DILocation(line: 172, column: 10, scope: !99)
!107 = !DILocation(line: 174, column: 10, scope: !99)
!108 = !DILocation(line: 175, column: 12, scope: !99)
!109 = !DILocation(line: 178, column: 10, scope: !99)
!110 = !DILocation(line: 180, column: 1, scope: !99)
!111 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 184, type: !16, scopeLine: 184, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!112 = !DILocation(line: 185, column: 14, scope: !113)
!113 = distinct !DILexicalBlock(scope: !111, file: !3, line: 185, column: 8)
!114 = !DILocation(line: 185, column: 19, scope: !113)
!115 = !DILocation(line: 185, column: 8, scope: !111)
!116 = !DILocation(line: 186, column: 14, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !3, line: 185, column: 34)
!118 = !DILocation(line: 187, column: 16, scope: !117)
!119 = !DILocation(line: 188, column: 5, scope: !117)
!120 = !DILocation(line: 188, column: 21, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !3, line: 188, column: 15)
!122 = !DILocation(line: 188, column: 26, scope: !121)
!123 = !DILocation(line: 188, column: 15, scope: !113)
!124 = !DILocation(line: 189, column: 14, scope: !125)
!125 = distinct !DILexicalBlock(scope: !121, file: !3, line: 188, column: 41)
!126 = !DILocation(line: 190, column: 16, scope: !125)
!127 = !DILocation(line: 191, column: 5, scope: !125)
!128 = !DILocation(line: 192, column: 9, scope: !129)
!129 = distinct !DILexicalBlock(scope: !121, file: !3, line: 191, column: 12)
!130 = !DILocation(line: 198, column: 5, scope: !131)
!131 = distinct !DILexicalBlock(scope: !111, file: !3, line: 198, column: 5)
!132 = !{i32 -2146650957}
!133 = !DILocation(line: 199, column: 5, scope: !111)
!134 = !DILocation(line: 200, column: 25, scope: !111)
!135 = !DILocation(line: 200, column: 31, scope: !111)
!136 = !DILocation(line: 200, column: 5, scope: !111)
!137 = !DILocation(line: 223, column: 1, scope: !111)
!138 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 227, type: !16, scopeLine: 227, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!139 = !DILocation(line: 229, column: 2, scope: !138)
!140 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 233, type: !16, scopeLine: 234, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocalVariable(name: "i", scope: !140, file: !3, line: 235, type: !142)
!142 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!143 = !DILocation(line: 235, column: 6, scope: !140)
!144 = !DILocalVariable(name: "message_length", scope: !140, file: !3, line: 236, type: !6)
!145 = !DILocation(line: 236, column: 11, scope: !140)
!146 = !DILocation(line: 239, column: 9, scope: !147)
!147 = distinct !DILexicalBlock(scope: !140, file: !3, line: 239, column: 2)
!148 = !DILocation(line: 239, column: 7, scope: !147)
!149 = !DILocation(line: 239, column: 14, scope: !150)
!150 = distinct !DILexicalBlock(scope: !147, file: !3, line: 239, column: 2)
!151 = !DILocation(line: 239, column: 16, scope: !150)
!152 = !DILocation(line: 239, column: 2, scope: !147)
!153 = !DILocation(line: 240, column: 29, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 239, column: 35)
!155 = !DILocation(line: 240, column: 20, scope: !154)
!156 = !DILocation(line: 240, column: 3, scope: !154)
!157 = !DILocation(line: 240, column: 15, scope: !154)
!158 = !DILocation(line: 240, column: 18, scope: !154)
!159 = !DILocation(line: 241, column: 2, scope: !154)
!160 = !DILocation(line: 239, column: 30, scope: !150)
!161 = !DILocation(line: 239, column: 2, scope: !150)
!162 = distinct !{!162, !152, !163}
!163 = !DILocation(line: 241, column: 2, scope: !147)
!164 = !DILocation(line: 244, column: 23, scope: !140)
!165 = !DILocation(line: 244, column: 2, scope: !140)
!166 = !DILocation(line: 244, column: 21, scope: !140)
!167 = !DILocation(line: 245, column: 2, scope: !140)
!168 = !DILocation(line: 245, column: 19, scope: !140)
!169 = !DILocation(line: 246, column: 2, scope: !140)
!170 = !DILocation(line: 246, column: 21, scope: !140)
!171 = !DILocation(line: 249, column: 2, scope: !140)
!172 = !DILocation(line: 249, column: 12, scope: !140)
!173 = !DILocation(line: 250, column: 2, scope: !140)
!174 = !DILocation(line: 250, column: 18, scope: !140)
!175 = !DILocation(line: 251, column: 1, scope: !140)
!176 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 253, type: !16, scopeLine: 254, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DILocalVariable(name: "i", scope: !176, file: !3, line: 255, type: !142)
!178 = !DILocation(line: 255, column: 6, scope: !176)
!179 = !DILocation(line: 257, column: 6, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !3, line: 257, column: 6)
!181 = !DILocation(line: 257, column: 26, scope: !180)
!182 = !DILocation(line: 257, column: 23, scope: !180)
!183 = !DILocation(line: 257, column: 6, scope: !176)
!184 = !DILocation(line: 258, column: 3, scope: !185)
!185 = distinct !DILexicalBlock(scope: !180, file: !3, line: 257, column: 46)
!186 = !DILocation(line: 259, column: 2, scope: !185)
!187 = !DILocalVariable(name: "zero", scope: !176, file: !3, line: 261, type: !42)
!188 = !DILocation(line: 261, column: 10, scope: !176)
!189 = !DILocation(line: 262, column: 9, scope: !190)
!190 = distinct !DILexicalBlock(scope: !176, file: !3, line: 262, column: 2)
!191 = !DILocation(line: 262, column: 7, scope: !190)
!192 = !DILocation(line: 262, column: 14, scope: !193)
!193 = distinct !DILexicalBlock(scope: !190, file: !3, line: 262, column: 2)
!194 = !DILocation(line: 262, column: 16, scope: !193)
!195 = !DILocation(line: 262, column: 2, scope: !190)
!196 = !DILocation(line: 263, column: 18, scope: !197)
!197 = distinct !DILexicalBlock(scope: !193, file: !3, line: 262, column: 52)
!198 = !DILocation(line: 263, column: 37, scope: !197)
!199 = !DILocation(line: 263, column: 35, scope: !197)
!200 = !DILocation(line: 263, column: 41, scope: !197)
!201 = !DILocation(line: 263, column: 39, scope: !197)
!202 = !DILocation(line: 263, column: 17, scope: !197)
!203 = !DILocation(line: 263, column: 73, scope: !197)
!204 = !DILocation(line: 263, column: 92, scope: !197)
!205 = !DILocation(line: 263, column: 90, scope: !197)
!206 = !DILocation(line: 263, column: 63, scope: !197)
!207 = !DILocation(line: 263, column: 3, scope: !197)
!208 = !DILocation(line: 263, column: 12, scope: !197)
!209 = !DILocation(line: 263, column: 15, scope: !197)
!210 = !DILocation(line: 264, column: 2, scope: !197)
!211 = !DILocation(line: 262, column: 47, scope: !193)
!212 = !DILocation(line: 262, column: 2, scope: !193)
!213 = distinct !{!213, !195, !214}
!214 = !DILocation(line: 264, column: 2, scope: !190)
!215 = !DILocation(line: 265, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !176, file: !3, line: 265, column: 2)
!217 = !DILocation(line: 265, column: 7, scope: !216)
!218 = !DILocation(line: 265, column: 40, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !3, line: 265, column: 2)
!220 = !DILocation(line: 265, column: 42, scope: !219)
!221 = !DILocation(line: 265, column: 2, scope: !216)
!222 = !DILocation(line: 266, column: 3, scope: !223)
!223 = distinct !DILexicalBlock(scope: !219, file: !3, line: 265, column: 61)
!224 = !DILocation(line: 266, column: 12, scope: !223)
!225 = !DILocation(line: 266, column: 15, scope: !223)
!226 = !DILocation(line: 267, column: 2, scope: !223)
!227 = !DILocation(line: 265, column: 56, scope: !219)
!228 = !DILocation(line: 265, column: 2, scope: !219)
!229 = distinct !{!229, !221, !230}
!230 = !DILocation(line: 267, column: 2, scope: !216)
!231 = !DILocation(line: 268, column: 2, scope: !176)
!232 = !DILocation(line: 268, column: 12, scope: !176)
!233 = !DILocation(line: 268, column: 18, scope: !176)
!234 = !DILocation(line: 269, column: 9, scope: !235)
!235 = distinct !DILexicalBlock(scope: !176, file: !3, line: 269, column: 2)
!236 = !DILocation(line: 269, column: 7, scope: !235)
!237 = !DILocation(line: 269, column: 14, scope: !238)
!238 = distinct !DILexicalBlock(scope: !235, file: !3, line: 269, column: 2)
!239 = !DILocation(line: 269, column: 16, scope: !238)
!240 = !DILocation(line: 269, column: 2, scope: !235)
!241 = !DILocation(line: 270, column: 3, scope: !238)
!242 = !DILocation(line: 270, column: 13, scope: !238)
!243 = !DILocation(line: 270, column: 16, scope: !238)
!244 = !DILocation(line: 269, column: 30, scope: !238)
!245 = !DILocation(line: 269, column: 2, scope: !238)
!246 = distinct !{!246, !240, !247}
!247 = !DILocation(line: 270, column: 18, scope: !235)
!248 = !DILocation(line: 272, column: 24, scope: !176)
!249 = !DILocation(line: 272, column: 2, scope: !176)
!250 = !DILocation(line: 272, column: 15, scope: !176)
!251 = !DILocation(line: 274, column: 2, scope: !176)
!252 = !DILocation(line: 274, column: 19, scope: !176)
!253 = !DILocation(line: 276, column: 2, scope: !176)
!254 = !DILocation(line: 276, column: 12, scope: !176)
!255 = !DILocation(line: 277, column: 1, scope: !176)
!256 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 279, type: !16, scopeLine: 280, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!257 = !DILocation(line: 282, column: 6, scope: !258)
!258 = distinct !DILexicalBlock(scope: !256, file: !3, line: 282, column: 6)
!259 = !DILocation(line: 282, column: 19, scope: !258)
!260 = !DILocation(line: 282, column: 6, scope: !256)
!261 = !DILocation(line: 283, column: 3, scope: !262)
!262 = distinct !DILexicalBlock(scope: !258, file: !3, line: 282, column: 26)
!263 = !DILocation(line: 283, column: 16, scope: !262)
!264 = !DILocation(line: 284, column: 9, scope: !262)
!265 = !DILocation(line: 284, column: 19, scope: !262)
!266 = !DILocation(line: 285, column: 2, scope: !262)
!267 = !DILocation(line: 286, column: 3, scope: !268)
!268 = distinct !DILexicalBlock(scope: !258, file: !3, line: 285, column: 9)
!269 = !DILocation(line: 286, column: 16, scope: !268)
!270 = !DILocation(line: 287, column: 9, scope: !268)
!271 = !DILocation(line: 287, column: 19, scope: !268)
!272 = !DILocation(line: 289, column: 1, scope: !256)
!273 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 291, type: !16, scopeLine: 292, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!274 = !DILocation(line: 294, column: 5, scope: !273)
!275 = !DILocation(line: 294, column: 21, scope: !273)
!276 = !DILocation(line: 296, column: 1, scope: !273)
!277 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 298, type: !16, scopeLine: 299, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!278 = !DILocalVariable(name: "i", scope: !277, file: !3, line: 300, type: !142)
!279 = !DILocation(line: 300, column: 6, scope: !277)
!280 = !DILocation(line: 302, column: 9, scope: !281)
!281 = distinct !DILexicalBlock(scope: !277, file: !3, line: 302, column: 2)
!282 = !DILocation(line: 302, column: 7, scope: !281)
!283 = !DILocation(line: 302, column: 27, scope: !284)
!284 = distinct !DILexicalBlock(scope: !281, file: !3, line: 302, column: 2)
!285 = !DILocation(line: 302, column: 29, scope: !284)
!286 = !DILocation(line: 302, column: 2, scope: !281)
!287 = !DILocation(line: 303, column: 18, scope: !288)
!288 = distinct !DILexicalBlock(scope: !284, file: !3, line: 302, column: 40)
!289 = !DILocation(line: 303, column: 30, scope: !288)
!290 = !DILocation(line: 303, column: 3, scope: !288)
!291 = !DILocation(line: 303, column: 13, scope: !288)
!292 = !DILocation(line: 303, column: 16, scope: !288)
!293 = !DILocation(line: 304, column: 2, scope: !288)
!294 = !DILocation(line: 302, column: 35, scope: !284)
!295 = !DILocation(line: 302, column: 2, scope: !284)
!296 = distinct !{!296, !286, !297}
!297 = !DILocation(line: 304, column: 2, scope: !281)
!298 = !DILocation(line: 306, column: 6, scope: !299)
!299 = distinct !DILexicalBlock(scope: !277, file: !3, line: 306, column: 6)
!300 = !DILocation(line: 306, column: 19, scope: !299)
!301 = !DILocation(line: 306, column: 6, scope: !277)
!302 = !DILocation(line: 308, column: 3, scope: !303)
!303 = distinct !DILexicalBlock(scope: !299, file: !3, line: 306, column: 24)
!304 = !DILocation(line: 308, column: 13, scope: !303)
!305 = !DILocation(line: 310, column: 2, scope: !303)
!306 = !DILocation(line: 312, column: 7, scope: !307)
!307 = distinct !DILexicalBlock(scope: !308, file: !3, line: 312, column: 7)
!308 = distinct !DILexicalBlock(scope: !299, file: !3, line: 310, column: 9)
!309 = !DILocation(line: 312, column: 26, scope: !307)
!310 = !DILocation(line: 312, column: 39, scope: !307)
!311 = !DILocation(line: 312, column: 7, scope: !308)
!312 = !DILocation(line: 314, column: 11, scope: !313)
!313 = distinct !DILexicalBlock(scope: !314, file: !3, line: 314, column: 4)
!314 = distinct !DILexicalBlock(scope: !307, file: !3, line: 312, column: 59)
!315 = !DILocation(line: 314, column: 9, scope: !313)
!316 = !DILocation(line: 314, column: 16, scope: !317)
!317 = distinct !DILexicalBlock(scope: !313, file: !3, line: 314, column: 4)
!318 = !DILocation(line: 314, column: 18, scope: !317)
!319 = !DILocation(line: 314, column: 4, scope: !313)
!320 = !DILocalVariable(name: "op", scope: !321, file: !3, line: 316, type: !6)
!321 = distinct !DILexicalBlock(scope: !317, file: !3, line: 314, column: 37)
!322 = !DILocation(line: 316, column: 14, scope: !321)
!323 = !DILocation(line: 316, column: 19, scope: !321)
!324 = !DILocation(line: 317, column: 26, scope: !321)
!325 = !DILocation(line: 317, column: 38, scope: !321)
!326 = !DILocation(line: 317, column: 5, scope: !321)
!327 = !DILocation(line: 317, column: 20, scope: !321)
!328 = !DILocation(line: 317, column: 24, scope: !321)
!329 = !DILocation(line: 318, column: 7, scope: !321)
!330 = !DILocation(line: 318, column: 5, scope: !321)
!331 = !DILocation(line: 319, column: 4, scope: !321)
!332 = !DILocation(line: 314, column: 32, scope: !317)
!333 = !DILocation(line: 314, column: 4, scope: !317)
!334 = distinct !{!334, !319, !335}
!335 = !DILocation(line: 319, column: 4, scope: !313)
!336 = !DILocation(line: 321, column: 3, scope: !314)
!337 = !DILocation(line: 323, column: 3, scope: !308)
!338 = !DILocation(line: 323, column: 13, scope: !308)
!339 = !DILocation(line: 326, column: 1, scope: !277)
!340 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 328, type: !16, scopeLine: 329, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!341 = !DILocation(line: 330, column: 2, scope: !340)
!342 = !DILocation(line: 330, column: 18, scope: !340)
!343 = !DILocation(line: 332, column: 1, scope: !340)
!344 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 334, type: !16, scopeLine: 335, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!345 = !DILocalVariable(name: "i", scope: !344, file: !3, line: 336, type: !142)
!346 = !DILocation(line: 336, column: 6, scope: !344)
!347 = !DILocation(line: 338, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !3, line: 338, column: 2)
!349 = !DILocation(line: 338, column: 7, scope: !348)
!350 = !DILocation(line: 338, column: 14, scope: !351)
!351 = distinct !DILexicalBlock(scope: !348, file: !3, line: 338, column: 2)
!352 = !DILocation(line: 338, column: 16, scope: !351)
!353 = !DILocation(line: 338, column: 2, scope: !348)
!354 = !DILocation(line: 339, column: 17, scope: !355)
!355 = distinct !DILexicalBlock(scope: !351, file: !3, line: 338, column: 35)
!356 = !DILocation(line: 339, column: 29, scope: !355)
!357 = !DILocation(line: 339, column: 3, scope: !355)
!358 = !DILocation(line: 339, column: 12, scope: !355)
!359 = !DILocation(line: 339, column: 15, scope: !355)
!360 = !DILocation(line: 340, column: 2, scope: !355)
!361 = !DILocation(line: 338, column: 30, scope: !351)
!362 = !DILocation(line: 338, column: 2, scope: !351)
!363 = distinct !{!363, !353, !364}
!364 = !DILocation(line: 340, column: 2, scope: !348)
!365 = !DILocation(line: 342, column: 2, scope: !344)
!366 = !DILocation(line: 342, column: 12, scope: !344)
!367 = !DILocation(line: 343, column: 1, scope: !344)
!368 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 345, type: !16, scopeLine: 346, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!369 = !DILocation(line: 347, column: 2, scope: !368)
!370 = !DILocation(line: 347, column: 12, scope: !368)
!371 = !DILocation(line: 348, column: 2, scope: !368)
!372 = !DILocation(line: 348, column: 12, scope: !368)
!373 = !DILocation(line: 350, column: 1, scope: !368)
!374 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 352, type: !16, scopeLine: 353, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!375 = !DILocalVariable(name: "i", scope: !374, file: !3, line: 354, type: !142)
!376 = !DILocation(line: 354, column: 6, scope: !374)
!377 = !DILocalVariable(name: "a", scope: !374, file: !3, line: 355, type: !42)
!378 = !DILocation(line: 355, column: 10, scope: !374)
!379 = !DILocalVariable(name: "b", scope: !374, file: !3, line: 355, type: !42)
!380 = !DILocation(line: 355, column: 13, scope: !374)
!381 = !DILocalVariable(name: "c", scope: !374, file: !3, line: 355, type: !42)
!382 = !DILocation(line: 355, column: 16, scope: !374)
!383 = !DILocalVariable(name: "dp", scope: !374, file: !3, line: 356, type: !42)
!384 = !DILocation(line: 356, column: 10, scope: !374)
!385 = !DILocalVariable(name: "p", scope: !374, file: !3, line: 356, type: !42)
!386 = !DILocation(line: 356, column: 14, scope: !374)
!387 = !DILocation(line: 358, column: 6, scope: !374)
!388 = !DILocation(line: 358, column: 4, scope: !374)
!389 = !DILocation(line: 359, column: 4, scope: !374)
!390 = !DILocation(line: 360, column: 9, scope: !391)
!391 = distinct !DILexicalBlock(scope: !374, file: !3, line: 360, column: 2)
!392 = !DILocation(line: 360, column: 7, scope: !391)
!393 = !DILocation(line: 360, column: 14, scope: !394)
!394 = distinct !DILexicalBlock(scope: !391, file: !3, line: 360, column: 2)
!395 = !DILocation(line: 360, column: 16, scope: !394)
!396 = !DILocation(line: 360, column: 2, scope: !391)
!397 = !DILocation(line: 361, column: 7, scope: !398)
!398 = distinct !DILexicalBlock(scope: !399, file: !3, line: 361, column: 7)
!399 = distinct !DILexicalBlock(scope: !394, file: !3, line: 360, column: 35)
!400 = !DILocation(line: 361, column: 19, scope: !398)
!401 = !DILocation(line: 361, column: 17, scope: !398)
!402 = !DILocation(line: 361, column: 21, scope: !398)
!403 = !DILocation(line: 361, column: 26, scope: !398)
!404 = !DILocation(line: 361, column: 29, scope: !398)
!405 = !DILocation(line: 361, column: 41, scope: !398)
!406 = !DILocation(line: 361, column: 39, scope: !398)
!407 = !DILocation(line: 361, column: 43, scope: !398)
!408 = !DILocation(line: 361, column: 7, scope: !399)
!409 = !DILocalVariable(name: "op", scope: !410, file: !3, line: 363, type: !6)
!410 = distinct !DILexicalBlock(scope: !398, file: !3, line: 361, column: 57)
!411 = !DILocation(line: 363, column: 13, scope: !410)
!412 = !DILocation(line: 363, column: 18, scope: !410)
!413 = !DILocation(line: 363, column: 30, scope: !410)
!414 = !DILocation(line: 363, column: 28, scope: !410)
!415 = !DILocation(line: 365, column: 8, scope: !410)
!416 = !DILocation(line: 365, column: 17, scope: !410)
!417 = !DILocation(line: 365, column: 6, scope: !410)
!418 = !DILocation(line: 366, column: 8, scope: !410)
!419 = !DILocation(line: 366, column: 18, scope: !410)
!420 = !DILocation(line: 366, column: 6, scope: !410)
!421 = !DILocation(line: 367, column: 9, scope: !410)
!422 = !DILocation(line: 367, column: 13, scope: !410)
!423 = !DILocation(line: 367, column: 11, scope: !410)
!424 = !DILocation(line: 367, column: 7, scope: !410)
!425 = !DILocation(line: 369, column: 9, scope: !410)
!426 = !DILocation(line: 369, column: 12, scope: !410)
!427 = !DILocation(line: 369, column: 6, scope: !410)
!428 = !DILocation(line: 370, column: 9, scope: !410)
!429 = !DILocation(line: 370, column: 12, scope: !410)
!430 = !DILocation(line: 370, column: 6, scope: !410)
!431 = !DILocation(line: 372, column: 3, scope: !410)
!432 = !DILocation(line: 373, column: 2, scope: !399)
!433 = !DILocation(line: 360, column: 30, scope: !394)
!434 = !DILocation(line: 360, column: 2, scope: !394)
!435 = distinct !{!435, !396, !436}
!436 = !DILocation(line: 373, column: 2, scope: !391)
!437 = !DILocation(line: 375, column: 7, scope: !374)
!438 = !DILocation(line: 375, column: 9, scope: !374)
!439 = !DILocation(line: 375, column: 4, scope: !374)
!440 = !DILocation(line: 376, column: 4, scope: !374)
!441 = !DILocation(line: 378, column: 27, scope: !374)
!442 = !DILocation(line: 378, column: 2, scope: !374)
!443 = !DILocation(line: 378, column: 14, scope: !374)
!444 = !DILocation(line: 378, column: 25, scope: !374)
!445 = !DILocation(line: 379, column: 2, scope: !374)
!446 = !DILocation(line: 379, column: 11, scope: !374)
!447 = !DILocation(line: 381, column: 6, scope: !448)
!448 = distinct !DILexicalBlock(scope: !374, file: !3, line: 381, column: 6)
!449 = !DILocation(line: 381, column: 16, scope: !448)
!450 = !DILocation(line: 381, column: 6, scope: !374)
!451 = !DILocation(line: 382, column: 15, scope: !452)
!452 = distinct !DILexicalBlock(scope: !448, file: !3, line: 381, column: 34)
!453 = !DILocation(line: 382, column: 3, scope: !452)
!454 = !DILocation(line: 382, column: 13, scope: !452)
!455 = !DILocation(line: 383, column: 2, scope: !452)
!456 = !DILocation(line: 384, column: 1, scope: !374)
!457 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 386, type: !16, scopeLine: 387, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!458 = !DILocalVariable(name: "d", scope: !457, file: !3, line: 388, type: !142)
!459 = !DILocation(line: 388, column: 6, scope: !457)
!460 = !DILocation(line: 390, column: 4, scope: !457)
!461 = !DILocation(line: 391, column: 2, scope: !457)
!462 = !DILocation(line: 392, column: 4, scope: !463)
!463 = distinct !DILexicalBlock(scope: !457, file: !3, line: 391, column: 5)
!464 = !DILocation(line: 393, column: 2, scope: !463)
!465 = !DILocation(line: 393, column: 11, scope: !457)
!466 = !DILocation(line: 393, column: 23, scope: !457)
!467 = !DILocation(line: 393, column: 26, scope: !457)
!468 = !DILocation(line: 393, column: 31, scope: !457)
!469 = !DILocation(line: 393, column: 34, scope: !457)
!470 = !DILocation(line: 393, column: 36, scope: !457)
!471 = !DILocation(line: 0, scope: !457)
!472 = distinct !{!472, !461, !473}
!473 = !DILocation(line: 393, column: 39, scope: !457)
!474 = !DILocation(line: 395, column: 6, scope: !475)
!475 = distinct !DILexicalBlock(scope: !457, file: !3, line: 395, column: 6)
!476 = !DILocation(line: 395, column: 18, scope: !475)
!477 = !DILocation(line: 395, column: 21, scope: !475)
!478 = !DILocation(line: 395, column: 6, scope: !457)
!479 = !DILocation(line: 396, column: 3, scope: !480)
!480 = distinct !DILexicalBlock(scope: !475, file: !3, line: 395, column: 27)
!481 = !DILocation(line: 396, column: 13, scope: !480)
!482 = !DILocation(line: 397, column: 2, scope: !480)
!483 = !DILocation(line: 399, column: 15, scope: !457)
!484 = !DILocation(line: 399, column: 2, scope: !457)
!485 = !DILocation(line: 399, column: 13, scope: !457)
!486 = !DILocation(line: 401, column: 2, scope: !457)
!487 = !DILocation(line: 401, column: 12, scope: !457)
!488 = !DILocation(line: 402, column: 1, scope: !457)
!489 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 404, type: !16, scopeLine: 405, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!490 = !DILocalVariable(name: "i", scope: !489, file: !3, line: 406, type: !142)
!491 = !DILocation(line: 406, column: 6, scope: !489)
!492 = !DILocalVariable(name: "normalizable", scope: !489, file: !3, line: 407, type: !493)
!493 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!494 = !DILocation(line: 407, column: 7, scope: !489)
!495 = !DILocation(line: 409, column: 15, scope: !489)
!496 = !DILocation(line: 409, column: 26, scope: !489)
!497 = !DILocation(line: 409, column: 30, scope: !489)
!498 = !DILocation(line: 409, column: 2, scope: !489)
!499 = !DILocation(line: 409, column: 13, scope: !489)
!500 = !DILocation(line: 411, column: 11, scope: !501)
!501 = distinct !DILexicalBlock(scope: !489, file: !3, line: 411, column: 2)
!502 = !DILocation(line: 411, column: 9, scope: !501)
!503 = !DILocation(line: 411, column: 7, scope: !501)
!504 = !DILocation(line: 411, column: 23, scope: !505)
!505 = distinct !DILexicalBlock(scope: !501, file: !3, line: 411, column: 2)
!506 = !DILocation(line: 411, column: 25, scope: !505)
!507 = !DILocation(line: 411, column: 2, scope: !501)
!508 = !DILocalVariable(name: "op", scope: !509, file: !3, line: 413, type: !6)
!509 = distinct !DILexicalBlock(scope: !505, file: !3, line: 411, column: 36)
!510 = !DILocation(line: 413, column: 12, scope: !509)
!511 = !DILocation(line: 413, column: 17, scope: !509)
!512 = !DILocation(line: 413, column: 19, scope: !509)
!513 = !DILocation(line: 413, column: 18, scope: !509)
!514 = !DILocation(line: 415, column: 7, scope: !515)
!515 = distinct !DILexicalBlock(scope: !509, file: !3, line: 415, column: 7)
!516 = !DILocation(line: 415, column: 19, scope: !515)
!517 = !DILocation(line: 415, column: 24, scope: !515)
!518 = !DILocation(line: 415, column: 36, scope: !515)
!519 = !DILocation(line: 415, column: 22, scope: !515)
!520 = !DILocation(line: 415, column: 7, scope: !509)
!521 = !DILocation(line: 416, column: 4, scope: !522)
!522 = distinct !DILexicalBlock(scope: !515, file: !3, line: 415, column: 41)
!523 = !DILocation(line: 417, column: 14, scope: !524)
!524 = distinct !DILexicalBlock(scope: !515, file: !3, line: 417, column: 14)
!525 = !DILocation(line: 417, column: 26, scope: !524)
!526 = !DILocation(line: 417, column: 31, scope: !524)
!527 = !DILocation(line: 417, column: 43, scope: !524)
!528 = !DILocation(line: 417, column: 29, scope: !524)
!529 = !DILocation(line: 417, column: 14, scope: !515)
!530 = !DILocation(line: 418, column: 17, scope: !531)
!531 = distinct !DILexicalBlock(scope: !524, file: !3, line: 417, column: 48)
!532 = !DILocation(line: 419, column: 4, scope: !531)
!533 = !DILocation(line: 421, column: 2, scope: !509)
!534 = !DILocation(line: 411, column: 31, scope: !505)
!535 = !DILocation(line: 411, column: 2, scope: !505)
!536 = distinct !{!536, !507, !537}
!537 = !DILocation(line: 421, column: 2, scope: !501)
!538 = !DILocation(line: 423, column: 7, scope: !539)
!539 = distinct !DILexicalBlock(scope: !489, file: !3, line: 423, column: 6)
!540 = !DILocation(line: 423, column: 20, scope: !539)
!541 = !DILocation(line: 423, column: 23, scope: !539)
!542 = !DILocation(line: 423, column: 34, scope: !539)
!543 = !DILocation(line: 423, column: 6, scope: !489)
!544 = !DILocation(line: 425, column: 3, scope: !545)
!545 = distinct !DILexicalBlock(scope: !539, file: !3, line: 423, column: 53)
!546 = !DILocation(line: 425, column: 13, scope: !545)
!547 = !DILocation(line: 426, column: 2, scope: !545)
!548 = !DILocation(line: 428, column: 6, scope: !549)
!549 = distinct !DILexicalBlock(scope: !489, file: !3, line: 428, column: 6)
!550 = !DILocation(line: 428, column: 6, scope: !489)
!551 = !DILocation(line: 430, column: 3, scope: !552)
!552 = distinct !DILexicalBlock(scope: !549, file: !3, line: 428, column: 20)
!553 = !DILocation(line: 430, column: 13, scope: !552)
!554 = !DILocation(line: 431, column: 2, scope: !552)
!555 = !DILocation(line: 433, column: 3, scope: !556)
!556 = distinct !DILexicalBlock(scope: !549, file: !3, line: 431, column: 9)
!557 = !DILocation(line: 433, column: 13, scope: !556)
!558 = !DILocation(line: 435, column: 1, scope: !489)
!559 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 436, type: !16, scopeLine: 437, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!560 = !DILocalVariable(name: "m", scope: !559, file: !3, line: 438, type: !42)
!561 = !DILocation(line: 438, column: 10, scope: !559)
!562 = !DILocalVariable(name: "n", scope: !559, file: !3, line: 438, type: !42)
!563 = !DILocation(line: 438, column: 13, scope: !559)
!564 = !DILocalVariable(name: "d", scope: !559, file: !3, line: 438, type: !42)
!565 = !DILocation(line: 438, column: 16, scope: !559)
!566 = !DILocalVariable(name: "s", scope: !559, file: !3, line: 438, type: !42)
!567 = !DILocation(line: 438, column: 19, scope: !559)
!568 = !DILocalVariable(name: "borrow", scope: !559, file: !3, line: 439, type: !6)
!569 = !DILocation(line: 439, column: 11, scope: !559)
!570 = !DILocalVariable(name: "i", scope: !559, file: !3, line: 441, type: !142)
!571 = !DILocation(line: 441, column: 6, scope: !559)
!572 = !DILocation(line: 443, column: 9, scope: !559)
!573 = !DILocation(line: 444, column: 9, scope: !574)
!574 = distinct !DILexicalBlock(scope: !559, file: !3, line: 444, column: 2)
!575 = !DILocation(line: 444, column: 7, scope: !574)
!576 = !DILocation(line: 444, column: 14, scope: !577)
!577 = distinct !DILexicalBlock(scope: !574, file: !3, line: 444, column: 2)
!578 = !DILocation(line: 444, column: 16, scope: !577)
!579 = !DILocation(line: 444, column: 2, scope: !574)
!580 = !DILocalVariable(name: "op", scope: !581, file: !3, line: 446, type: !6)
!581 = distinct !DILexicalBlock(scope: !577, file: !3, line: 444, column: 35)
!582 = !DILocation(line: 446, column: 12, scope: !581)
!583 = !DILocation(line: 446, column: 17, scope: !581)
!584 = !DILocation(line: 446, column: 21, scope: !581)
!585 = !DILocation(line: 446, column: 19, scope: !581)
!586 = !DILocation(line: 448, column: 7, scope: !581)
!587 = !DILocation(line: 448, column: 19, scope: !581)
!588 = !DILocation(line: 448, column: 5, scope: !581)
!589 = !DILocation(line: 449, column: 7, scope: !581)
!590 = !DILocation(line: 449, column: 19, scope: !581)
!591 = !DILocation(line: 449, column: 5, scope: !581)
!592 = !DILocation(line: 451, column: 7, scope: !581)
!593 = !DILocation(line: 451, column: 11, scope: !581)
!594 = !DILocation(line: 451, column: 9, scope: !581)
!595 = !DILocation(line: 451, column: 5, scope: !581)
!596 = !DILocation(line: 452, column: 7, scope: !597)
!597 = distinct !DILexicalBlock(scope: !581, file: !3, line: 452, column: 7)
!598 = !DILocation(line: 452, column: 11, scope: !597)
!599 = !DILocation(line: 452, column: 9, scope: !597)
!600 = !DILocation(line: 452, column: 7, scope: !581)
!601 = !DILocation(line: 453, column: 6, scope: !602)
!602 = distinct !DILexicalBlock(scope: !597, file: !3, line: 452, column: 14)
!603 = !DILocation(line: 454, column: 11, scope: !602)
!604 = !DILocation(line: 455, column: 3, scope: !602)
!605 = !DILocation(line: 456, column: 11, scope: !606)
!606 = distinct !DILexicalBlock(scope: !597, file: !3, line: 455, column: 10)
!607 = !DILocation(line: 458, column: 7, scope: !581)
!608 = !DILocation(line: 458, column: 11, scope: !581)
!609 = !DILocation(line: 458, column: 9, scope: !581)
!610 = !DILocation(line: 458, column: 5, scope: !581)
!611 = !DILocation(line: 460, column: 21, scope: !581)
!612 = !DILocation(line: 460, column: 3, scope: !581)
!613 = !DILocation(line: 460, column: 15, scope: !581)
!614 = !DILocation(line: 460, column: 19, scope: !581)
!615 = !DILocation(line: 462, column: 2, scope: !581)
!616 = !DILocation(line: 444, column: 30, scope: !577)
!617 = !DILocation(line: 444, column: 2, scope: !577)
!618 = distinct !{!618, !579, !619}
!619 = !DILocation(line: 462, column: 2, scope: !574)
!620 = !DILocation(line: 464, column: 6, scope: !621)
!621 = distinct !DILexicalBlock(scope: !559, file: !3, line: 464, column: 6)
!622 = !DILocation(line: 464, column: 17, scope: !621)
!623 = !DILocation(line: 464, column: 6, scope: !559)
!624 = !DILocation(line: 465, column: 3, scope: !625)
!625 = distinct !DILexicalBlock(scope: !621, file: !3, line: 464, column: 22)
!626 = !DILocation(line: 465, column: 13, scope: !625)
!627 = !DILocation(line: 466, column: 2, scope: !625)
!628 = !DILocation(line: 467, column: 3, scope: !629)
!629 = distinct !DILexicalBlock(scope: !621, file: !3, line: 466, column: 9)
!630 = !DILocation(line: 467, column: 13, scope: !629)
!631 = !DILocation(line: 469, column: 1, scope: !559)
!632 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 471, type: !16, scopeLine: 472, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!633 = !DILocalVariable(name: "op1", scope: !632, file: !3, line: 473, type: !6)
!634 = !DILocation(line: 473, column: 11, scope: !632)
!635 = !DILocalVariable(name: "op2", scope: !632, file: !3, line: 474, type: !6)
!636 = !DILocation(line: 474, column: 11, scope: !632)
!637 = !DILocation(line: 476, column: 16, scope: !632)
!638 = !DILocation(line: 476, column: 28, scope: !632)
!639 = !DILocation(line: 476, column: 32, scope: !632)
!640 = !DILocation(line: 476, column: 49, scope: !632)
!641 = !DILocation(line: 476, column: 61, scope: !632)
!642 = !DILocation(line: 476, column: 47, scope: !632)
!643 = !DILocation(line: 476, column: 2, scope: !632)
!644 = !DILocation(line: 476, column: 12, scope: !632)
!645 = !DILocation(line: 478, column: 1, scope: !632)
!646 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 480, type: !16, scopeLine: 481, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!647 = !DILocalVariable(name: "qn", scope: !646, file: !3, line: 482, type: !7)
!648 = !DILocation(line: 482, column: 11, scope: !646)
!649 = !DILocalVariable(name: "n_q", scope: !646, file: !3, line: 482, type: !7)
!650 = !DILocation(line: 482, column: 15, scope: !646)
!651 = !DILocalVariable(name: "op1", scope: !646, file: !3, line: 484, type: !6)
!652 = !DILocation(line: 484, column: 11, scope: !646)
!653 = !DILocalVariable(name: "op2", scope: !646, file: !3, line: 485, type: !6)
!654 = !DILocation(line: 485, column: 11, scope: !646)
!655 = !DILocation(line: 485, column: 17, scope: !646)
!656 = !DILocation(line: 485, column: 28, scope: !646)
!657 = !DILocalVariable(name: "op3", scope: !646, file: !3, line: 486, type: !6)
!658 = !DILocation(line: 486, column: 11, scope: !646)
!659 = !DILocation(line: 486, column: 17, scope: !646)
!660 = !DILocation(line: 486, column: 28, scope: !646)
!661 = !DILocation(line: 488, column: 6, scope: !662)
!662 = distinct !DILexicalBlock(scope: !646, file: !3, line: 488, column: 6)
!663 = !DILocation(line: 488, column: 18, scope: !662)
!664 = !DILocation(line: 488, column: 33, scope: !662)
!665 = !DILocation(line: 488, column: 45, scope: !662)
!666 = !DILocation(line: 488, column: 30, scope: !662)
!667 = !DILocation(line: 488, column: 6, scope: !646)
!668 = !DILocation(line: 489, column: 3, scope: !669)
!669 = distinct !DILexicalBlock(scope: !662, file: !3, line: 488, column: 51)
!670 = !DILocation(line: 489, column: 16, scope: !669)
!671 = !DILocation(line: 490, column: 2, scope: !669)
!672 = !DILocation(line: 491, column: 20, scope: !673)
!673 = distinct !DILexicalBlock(scope: !662, file: !3, line: 490, column: 9)
!674 = !DILocation(line: 491, column: 32, scope: !673)
!675 = !DILocation(line: 491, column: 44, scope: !673)
!676 = !DILocation(line: 491, column: 61, scope: !673)
!677 = !DILocation(line: 491, column: 73, scope: !673)
!678 = !DILocation(line: 491, column: 59, scope: !673)
!679 = !DILocation(line: 491, column: 81, scope: !673)
!680 = !DILocation(line: 491, column: 93, scope: !673)
!681 = !DILocation(line: 491, column: 79, scope: !673)
!682 = !DILocation(line: 491, column: 3, scope: !673)
!683 = !DILocation(line: 491, column: 16, scope: !673)
!684 = !DILocation(line: 494, column: 19, scope: !646)
!685 = !DILocation(line: 494, column: 31, scope: !646)
!686 = !DILocation(line: 494, column: 9, scope: !646)
!687 = !DILocation(line: 494, column: 43, scope: !646)
!688 = !DILocation(line: 494, column: 67, scope: !646)
!689 = !DILocation(line: 494, column: 79, scope: !646)
!690 = !DILocation(line: 494, column: 84, scope: !646)
!691 = !DILocation(line: 494, column: 66, scope: !646)
!692 = !DILocation(line: 494, column: 64, scope: !646)
!693 = !DILocation(line: 494, column: 101, scope: !646)
!694 = !DILocation(line: 494, column: 113, scope: !646)
!695 = !DILocation(line: 494, column: 99, scope: !646)
!696 = !DILocation(line: 494, column: 6, scope: !646)
!697 = !DILocation(line: 496, column: 2, scope: !646)
!698 = !DILocation(line: 496, column: 14, scope: !646)
!699 = !DILocation(line: 497, column: 2, scope: !646)
!700 = !DILocation(line: 498, column: 3, scope: !701)
!701 = distinct !DILexicalBlock(scope: !646, file: !3, line: 497, column: 5)
!702 = !DILocation(line: 498, column: 15, scope: !701)
!703 = !DILocation(line: 499, column: 8, scope: !701)
!704 = !DILocation(line: 499, column: 21, scope: !701)
!705 = !DILocation(line: 499, column: 18, scope: !701)
!706 = !DILocation(line: 499, column: 6, scope: !701)
!707 = !DILocation(line: 500, column: 2, scope: !701)
!708 = !DILocation(line: 500, column: 11, scope: !646)
!709 = !DILocation(line: 500, column: 16, scope: !646)
!710 = !DILocation(line: 500, column: 14, scope: !646)
!711 = distinct !{!711, !699, !712}
!712 = !DILocation(line: 500, column: 19, scope: !646)
!713 = !DILocation(line: 502, column: 2, scope: !646)
!714 = !DILocation(line: 502, column: 12, scope: !646)
!715 = !DILocation(line: 504, column: 1, scope: !646)
!716 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 506, type: !16, scopeLine: 507, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!717 = !DILocalVariable(name: "i", scope: !716, file: !3, line: 508, type: !142)
!718 = !DILocation(line: 508, column: 6, scope: !716)
!719 = !DILocalVariable(name: "m", scope: !716, file: !3, line: 509, type: !42)
!720 = !DILocation(line: 509, column: 10, scope: !716)
!721 = !DILocalVariable(name: "n", scope: !716, file: !3, line: 509, type: !42)
!722 = !DILocation(line: 509, column: 13, scope: !716)
!723 = !DILocalVariable(name: "c", scope: !716, file: !3, line: 510, type: !6)
!724 = !DILocation(line: 510, column: 11, scope: !716)
!725 = !DILocalVariable(name: "offset", scope: !716, file: !3, line: 510, type: !6)
!726 = !DILocation(line: 510, column: 14, scope: !716)
!727 = !DILocation(line: 512, column: 11, scope: !716)
!728 = !DILocation(line: 512, column: 22, scope: !716)
!729 = !DILocation(line: 512, column: 26, scope: !716)
!730 = !DILocation(line: 512, column: 9, scope: !716)
!731 = !DILocation(line: 514, column: 9, scope: !732)
!732 = distinct !DILexicalBlock(scope: !716, file: !3, line: 514, column: 2)
!733 = !DILocation(line: 514, column: 7, scope: !732)
!734 = !DILocation(line: 514, column: 14, scope: !735)
!735 = distinct !DILexicalBlock(scope: !732, file: !3, line: 514, column: 2)
!736 = !DILocation(line: 514, column: 18, scope: !735)
!737 = !DILocation(line: 514, column: 16, scope: !735)
!738 = !DILocation(line: 514, column: 2, scope: !732)
!739 = !DILocation(line: 515, column: 3, scope: !740)
!740 = distinct !DILexicalBlock(scope: !735, file: !3, line: 514, column: 31)
!741 = !DILocation(line: 515, column: 16, scope: !740)
!742 = !DILocation(line: 515, column: 19, scope: !740)
!743 = !DILocation(line: 516, column: 2, scope: !740)
!744 = !DILocation(line: 514, column: 26, scope: !735)
!745 = !DILocation(line: 514, column: 2, scope: !735)
!746 = distinct !{!746, !738, !747}
!747 = !DILocation(line: 516, column: 2, scope: !732)
!748 = !DILocation(line: 518, column: 4, scope: !716)
!749 = !DILocation(line: 519, column: 11, scope: !750)
!750 = distinct !DILexicalBlock(scope: !716, file: !3, line: 519, column: 2)
!751 = !DILocation(line: 519, column: 9, scope: !750)
!752 = !DILocation(line: 519, column: 7, scope: !750)
!753 = !DILocation(line: 519, column: 19, scope: !754)
!754 = distinct !DILexicalBlock(scope: !750, file: !3, line: 519, column: 2)
!755 = !DILocation(line: 519, column: 21, scope: !754)
!756 = !DILocation(line: 519, column: 2, scope: !750)
!757 = !DILocation(line: 521, column: 7, scope: !758)
!758 = distinct !DILexicalBlock(scope: !754, file: !3, line: 519, column: 44)
!759 = !DILocation(line: 521, column: 5, scope: !758)
!760 = !DILocation(line: 522, column: 7, scope: !761)
!761 = distinct !DILexicalBlock(scope: !758, file: !3, line: 522, column: 7)
!762 = !DILocation(line: 522, column: 11, scope: !761)
!763 = !DILocation(line: 522, column: 18, scope: !761)
!764 = !DILocation(line: 522, column: 9, scope: !761)
!765 = !DILocation(line: 522, column: 7, scope: !758)
!766 = !DILocalVariable(name: "op", scope: !767, file: !3, line: 524, type: !6)
!767 = distinct !DILexicalBlock(scope: !761, file: !3, line: 522, column: 32)
!768 = !DILocation(line: 524, column: 13, scope: !767)
!769 = !DILocation(line: 524, column: 18, scope: !767)
!770 = !DILocation(line: 524, column: 22, scope: !767)
!771 = !DILocation(line: 524, column: 20, scope: !767)
!772 = !DILocation(line: 526, column: 8, scope: !767)
!773 = !DILocation(line: 526, column: 20, scope: !767)
!774 = !DILocation(line: 526, column: 6, scope: !767)
!775 = !DILocation(line: 527, column: 9, scope: !767)
!776 = !DILocation(line: 527, column: 24, scope: !767)
!777 = !DILocation(line: 527, column: 22, scope: !767)
!778 = !DILocation(line: 527, column: 6, scope: !767)
!779 = !DILocation(line: 528, column: 3, scope: !767)
!780 = !DILocation(line: 529, column: 6, scope: !781)
!781 = distinct !DILexicalBlock(scope: !761, file: !3, line: 528, column: 10)
!782 = !DILocation(line: 532, column: 7, scope: !758)
!783 = !DILocation(line: 532, column: 9, scope: !758)
!784 = !DILocation(line: 532, column: 5, scope: !758)
!785 = !DILocation(line: 533, column: 5, scope: !758)
!786 = !DILocation(line: 535, column: 21, scope: !758)
!787 = !DILocation(line: 535, column: 3, scope: !758)
!788 = !DILocation(line: 535, column: 16, scope: !758)
!789 = !DILocation(line: 535, column: 19, scope: !758)
!790 = !DILocation(line: 537, column: 2, scope: !758)
!791 = !DILocation(line: 519, column: 39, scope: !754)
!792 = !DILocation(line: 519, column: 2, scope: !754)
!793 = distinct !{!793, !756, !794}
!794 = !DILocation(line: 537, column: 2, scope: !750)
!795 = !DILocation(line: 539, column: 1, scope: !716)
!796 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 541, type: !16, scopeLine: 542, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!797 = !DILocalVariable(name: "i", scope: !796, file: !3, line: 543, type: !142)
!798 = !DILocation(line: 543, column: 6, scope: !796)
!799 = !DILocalVariable(name: "relation", scope: !796, file: !3, line: 544, type: !800)
!800 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!801 = !DILocation(line: 544, column: 7, scope: !796)
!802 = !DILocation(line: 546, column: 9, scope: !803)
!803 = distinct !DILexicalBlock(scope: !796, file: !3, line: 546, column: 2)
!804 = !DILocation(line: 546, column: 7, scope: !803)
!805 = !DILocation(line: 546, column: 31, scope: !806)
!806 = distinct !DILexicalBlock(scope: !803, file: !3, line: 546, column: 2)
!807 = !DILocation(line: 546, column: 33, scope: !806)
!808 = !DILocation(line: 546, column: 2, scope: !803)
!809 = !DILocation(line: 548, column: 7, scope: !810)
!810 = distinct !DILexicalBlock(scope: !811, file: !3, line: 548, column: 7)
!811 = distinct !DILexicalBlock(scope: !806, file: !3, line: 546, column: 44)
!812 = !DILocation(line: 548, column: 19, scope: !810)
!813 = !DILocation(line: 548, column: 24, scope: !810)
!814 = !DILocation(line: 548, column: 37, scope: !810)
!815 = !DILocation(line: 548, column: 22, scope: !810)
!816 = !DILocation(line: 548, column: 7, scope: !811)
!817 = !DILocation(line: 549, column: 13, scope: !818)
!818 = distinct !DILexicalBlock(scope: !810, file: !3, line: 548, column: 41)
!819 = !DILocation(line: 550, column: 4, scope: !818)
!820 = !DILocation(line: 551, column: 14, scope: !821)
!821 = distinct !DILexicalBlock(scope: !810, file: !3, line: 551, column: 14)
!822 = !DILocation(line: 551, column: 26, scope: !821)
!823 = !DILocation(line: 551, column: 31, scope: !821)
!824 = !DILocation(line: 551, column: 44, scope: !821)
!825 = !DILocation(line: 551, column: 29, scope: !821)
!826 = !DILocation(line: 551, column: 14, scope: !810)
!827 = !DILocation(line: 552, column: 13, scope: !828)
!828 = distinct !DILexicalBlock(scope: !821, file: !3, line: 551, column: 48)
!829 = !DILocation(line: 553, column: 4, scope: !828)
!830 = !DILocation(line: 555, column: 2, scope: !811)
!831 = !DILocation(line: 546, column: 39, scope: !806)
!832 = !DILocation(line: 546, column: 2, scope: !806)
!833 = distinct !{!833, !808, !834}
!834 = !DILocation(line: 555, column: 2, scope: !803)
!835 = !DILocation(line: 557, column: 6, scope: !836)
!836 = distinct !DILexicalBlock(scope: !796, file: !3, line: 557, column: 6)
!837 = !DILocation(line: 557, column: 15, scope: !836)
!838 = !DILocation(line: 557, column: 6, scope: !796)
!839 = !DILocation(line: 558, column: 3, scope: !840)
!840 = distinct !DILexicalBlock(scope: !836, file: !3, line: 557, column: 23)
!841 = !DILocation(line: 558, column: 13, scope: !840)
!842 = !DILocation(line: 559, column: 2, scope: !840)
!843 = !DILocation(line: 560, column: 1, scope: !796)
!844 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 562, type: !16, scopeLine: 563, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!845 = !DILocalVariable(name: "i", scope: !844, file: !3, line: 564, type: !142)
!846 = !DILocation(line: 564, column: 6, scope: !844)
!847 = !DILocalVariable(name: "j", scope: !844, file: !3, line: 564, type: !142)
!848 = !DILocation(line: 564, column: 9, scope: !844)
!849 = !DILocalVariable(name: "m", scope: !844, file: !3, line: 565, type: !42)
!850 = !DILocation(line: 565, column: 10, scope: !844)
!851 = !DILocalVariable(name: "n", scope: !844, file: !3, line: 565, type: !42)
!852 = !DILocation(line: 565, column: 13, scope: !844)
!853 = !DILocalVariable(name: "c", scope: !844, file: !3, line: 565, type: !42)
!854 = !DILocation(line: 565, column: 16, scope: !844)
!855 = !DILocalVariable(name: "offset", scope: !844, file: !3, line: 566, type: !6)
!856 = !DILocation(line: 566, column: 11, scope: !844)
!857 = !DILocation(line: 568, column: 11, scope: !844)
!858 = !DILocation(line: 568, column: 22, scope: !844)
!859 = !DILocation(line: 568, column: 26, scope: !844)
!860 = !DILocation(line: 568, column: 9, scope: !844)
!861 = !DILocation(line: 570, column: 4, scope: !844)
!862 = !DILocation(line: 571, column: 11, scope: !863)
!863 = distinct !DILexicalBlock(scope: !844, file: !3, line: 571, column: 2)
!864 = !DILocation(line: 571, column: 9, scope: !863)
!865 = !DILocation(line: 571, column: 7, scope: !863)
!866 = !DILocation(line: 571, column: 19, scope: !867)
!867 = distinct !DILexicalBlock(scope: !863, file: !3, line: 571, column: 2)
!868 = !DILocation(line: 571, column: 21, scope: !867)
!869 = !DILocation(line: 571, column: 2, scope: !863)
!870 = !DILocation(line: 572, column: 7, scope: !871)
!871 = distinct !DILexicalBlock(scope: !867, file: !3, line: 571, column: 44)
!872 = !DILocation(line: 572, column: 19, scope: !871)
!873 = !DILocation(line: 572, column: 5, scope: !871)
!874 = !DILocation(line: 574, column: 7, scope: !871)
!875 = !DILocation(line: 574, column: 11, scope: !871)
!876 = !DILocation(line: 574, column: 9, scope: !871)
!877 = !DILocation(line: 574, column: 5, scope: !871)
!878 = !DILocation(line: 576, column: 7, scope: !879)
!879 = distinct !DILexicalBlock(scope: !871, file: !3, line: 576, column: 7)
!880 = !DILocation(line: 576, column: 11, scope: !879)
!881 = !DILocation(line: 576, column: 18, scope: !879)
!882 = !DILocation(line: 576, column: 9, scope: !879)
!883 = !DILocation(line: 576, column: 7, scope: !871)
!884 = !DILocation(line: 577, column: 8, scope: !885)
!885 = distinct !DILexicalBlock(scope: !879, file: !3, line: 576, column: 32)
!886 = !DILocation(line: 577, column: 20, scope: !885)
!887 = !DILocation(line: 577, column: 6, scope: !885)
!888 = !DILocation(line: 578, column: 3, scope: !885)
!889 = !DILocation(line: 579, column: 6, scope: !890)
!890 = distinct !DILexicalBlock(scope: !879, file: !3, line: 578, column: 10)
!891 = !DILocation(line: 580, column: 6, scope: !890)
!892 = !DILocation(line: 583, column: 20, scope: !871)
!893 = !DILocation(line: 583, column: 24, scope: !871)
!894 = !DILocation(line: 583, column: 22, scope: !871)
!895 = !DILocation(line: 583, column: 28, scope: !871)
!896 = !DILocation(line: 583, column: 26, scope: !871)
!897 = !DILocation(line: 583, column: 3, scope: !871)
!898 = !DILocation(line: 583, column: 15, scope: !871)
!899 = !DILocation(line: 583, column: 18, scope: !871)
!900 = !DILocation(line: 585, column: 7, scope: !871)
!901 = !DILocation(line: 585, column: 19, scope: !871)
!902 = !DILocation(line: 585, column: 22, scope: !871)
!903 = !DILocation(line: 585, column: 5, scope: !871)
!904 = !DILocation(line: 586, column: 3, scope: !871)
!905 = !DILocation(line: 586, column: 15, scope: !871)
!906 = !DILocation(line: 586, column: 18, scope: !871)
!907 = !DILocation(line: 587, column: 2, scope: !871)
!908 = !DILocation(line: 571, column: 39, scope: !867)
!909 = !DILocation(line: 571, column: 2, scope: !867)
!910 = distinct !{!910, !869, !911}
!911 = !DILocation(line: 587, column: 2, scope: !863)
!912 = !DILocation(line: 589, column: 1, scope: !844)
!913 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 591, type: !16, scopeLine: 592, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!914 = !DILocalVariable(name: "i", scope: !913, file: !3, line: 593, type: !142)
!915 = !DILocation(line: 593, column: 6, scope: !913)
!916 = !DILocalVariable(name: "m", scope: !913, file: !3, line: 594, type: !42)
!917 = !DILocation(line: 594, column: 10, scope: !913)
!918 = !DILocalVariable(name: "s", scope: !913, file: !3, line: 594, type: !42)
!919 = !DILocation(line: 594, column: 13, scope: !913)
!920 = !DILocalVariable(name: "qn", scope: !913, file: !3, line: 594, type: !42)
!921 = !DILocation(line: 594, column: 16, scope: !913)
!922 = !DILocalVariable(name: "borrow", scope: !913, file: !3, line: 595, type: !6)
!923 = !DILocation(line: 595, column: 11, scope: !913)
!924 = !DILocalVariable(name: "offset", scope: !913, file: !3, line: 595, type: !6)
!925 = !DILocation(line: 595, column: 19, scope: !913)
!926 = !DILocation(line: 597, column: 11, scope: !913)
!927 = !DILocation(line: 597, column: 22, scope: !913)
!928 = !DILocation(line: 597, column: 26, scope: !913)
!929 = !DILocation(line: 597, column: 9, scope: !913)
!930 = !DILocation(line: 599, column: 9, scope: !913)
!931 = !DILocation(line: 600, column: 9, scope: !932)
!932 = distinct !DILexicalBlock(scope: !913, file: !3, line: 600, column: 2)
!933 = !DILocation(line: 600, column: 7, scope: !932)
!934 = !DILocation(line: 600, column: 14, scope: !935)
!935 = distinct !DILexicalBlock(scope: !932, file: !3, line: 600, column: 2)
!936 = !DILocation(line: 600, column: 16, scope: !935)
!937 = !DILocation(line: 600, column: 2, scope: !932)
!938 = !DILocation(line: 601, column: 7, scope: !939)
!939 = distinct !DILexicalBlock(scope: !935, file: !3, line: 600, column: 39)
!940 = !DILocation(line: 601, column: 19, scope: !939)
!941 = !DILocation(line: 601, column: 5, scope: !939)
!942 = !DILocation(line: 603, column: 7, scope: !943)
!943 = distinct !DILexicalBlock(scope: !939, file: !3, line: 603, column: 7)
!944 = !DILocation(line: 603, column: 12, scope: !943)
!945 = !DILocation(line: 603, column: 9, scope: !943)
!946 = !DILocation(line: 603, column: 7, scope: !939)
!947 = !DILocation(line: 604, column: 9, scope: !948)
!948 = distinct !DILexicalBlock(scope: !943, file: !3, line: 603, column: 20)
!949 = !DILocation(line: 604, column: 22, scope: !948)
!950 = !DILocation(line: 604, column: 7, scope: !948)
!951 = !DILocation(line: 606, column: 8, scope: !948)
!952 = !DILocation(line: 606, column: 13, scope: !948)
!953 = !DILocation(line: 606, column: 11, scope: !948)
!954 = !DILocation(line: 606, column: 6, scope: !948)
!955 = !DILocation(line: 607, column: 8, scope: !956)
!956 = distinct !DILexicalBlock(scope: !948, file: !3, line: 607, column: 8)
!957 = !DILocation(line: 607, column: 12, scope: !956)
!958 = !DILocation(line: 607, column: 10, scope: !956)
!959 = !DILocation(line: 607, column: 8, scope: !948)
!960 = !DILocation(line: 608, column: 7, scope: !961)
!961 = distinct !DILexicalBlock(scope: !956, file: !3, line: 607, column: 15)
!962 = !DILocation(line: 609, column: 12, scope: !961)
!963 = !DILocation(line: 610, column: 4, scope: !961)
!964 = !DILocation(line: 611, column: 12, scope: !965)
!965 = distinct !DILexicalBlock(scope: !956, file: !3, line: 610, column: 11)
!966 = !DILocation(line: 613, column: 21, scope: !948)
!967 = !DILocation(line: 613, column: 25, scope: !948)
!968 = !DILocation(line: 613, column: 23, scope: !948)
!969 = !DILocation(line: 613, column: 4, scope: !948)
!970 = !DILocation(line: 613, column: 16, scope: !948)
!971 = !DILocation(line: 613, column: 19, scope: !948)
!972 = !DILocation(line: 615, column: 3, scope: !948)
!973 = !DILocation(line: 616, column: 2, scope: !939)
!974 = !DILocation(line: 600, column: 34, scope: !935)
!975 = !DILocation(line: 600, column: 2, scope: !935)
!976 = distinct !{!976, !937, !977}
!977 = !DILocation(line: 616, column: 2, scope: !932)
!978 = !DILocation(line: 617, column: 1, scope: !913)
!979 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 619, type: !16, scopeLine: 619, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!980 = !DILocation(line: 621, column: 1, scope: !979)
!981 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 624, type: !982, scopeLine: 624, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!982 = !DISubroutineType(types: !983)
!983 = !{!142}
!984 = !DILocation(line: 626, column: 16, scope: !981)
!985 = !DILocation(line: 627, column: 10, scope: !981)
!986 = !DILocation(line: 628, column: 12, scope: !981)
!987 = !DILocation(line: 629, column: 5, scope: !981)
!988 = !DILocation(line: 631, column: 2, scope: !981)
!989 = !DILocation(line: 633, column: 3, scope: !990)
!990 = distinct !DILexicalBlock(scope: !981, file: !3, line: 631, column: 12)
!991 = !DILocation(line: 633, column: 3, scope: !992)
!992 = distinct !DILexicalBlock(scope: !993, file: !3, line: 633, column: 3)
!993 = distinct !DILexicalBlock(scope: !990, file: !3, line: 633, column: 3)
!994 = !DILocation(line: 633, column: 3, scope: !993)
!995 = !DILocation(line: 633, column: 3, scope: !996)
!996 = distinct !DILexicalBlock(scope: !992, file: !3, line: 633, column: 3)
!997 = !DILocation(line: 633, column: 3, scope: !998)
!998 = distinct !DILexicalBlock(scope: !992, file: !3, line: 633, column: 3)
!999 = !DILocation(line: 635, column: 3, scope: !990)
!1000 = !DILocation(line: 637, column: 8, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 637, column: 8)
!1002 = distinct !DILexicalBlock(scope: !990, file: !3, line: 635, column: 13)
!1003 = !DILocation(line: 637, column: 19, scope: !1001)
!1004 = !DILocation(line: 637, column: 8, scope: !1002)
!1005 = !DILocation(line: 639, column: 5, scope: !1006)
!1006 = distinct !DILexicalBlock(scope: !1001, file: !3, line: 637, column: 25)
!1007 = !DILocation(line: 639, column: 5, scope: !1008)
!1008 = distinct !DILexicalBlock(scope: !1009, file: !3, line: 639, column: 5)
!1009 = distinct !DILexicalBlock(scope: !1006, file: !3, line: 639, column: 5)
!1010 = !DILocation(line: 639, column: 5, scope: !1009)
!1011 = !DILocation(line: 639, column: 5, scope: !1012)
!1012 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 639, column: 5)
!1013 = !DILocation(line: 639, column: 5, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !1008, file: !3, line: 639, column: 5)
!1015 = !DILocation(line: 641, column: 4, scope: !1006)
!1016 = !DILocation(line: 643, column: 8, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 643, column: 8)
!1018 = !DILocation(line: 643, column: 19, scope: !1017)
!1019 = !DILocation(line: 643, column: 8, scope: !1002)
!1020 = !DILocation(line: 645, column: 5, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1017, file: !3, line: 643, column: 25)
!1022 = !DILocation(line: 645, column: 5, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1024, file: !3, line: 645, column: 5)
!1024 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 645, column: 5)
!1025 = !DILocation(line: 645, column: 5, scope: !1024)
!1026 = !DILocation(line: 645, column: 5, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 645, column: 5)
!1028 = !DILocation(line: 645, column: 5, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 645, column: 5)
!1030 = !DILocation(line: 647, column: 4, scope: !1021)
!1031 = !DILocation(line: 649, column: 8, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 649, column: 8)
!1033 = !DILocation(line: 649, column: 19, scope: !1032)
!1034 = !DILocation(line: 649, column: 8, scope: !1002)
!1035 = !DILocation(line: 651, column: 5, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 649, column: 25)
!1037 = !DILocation(line: 651, column: 5, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1039, file: !3, line: 651, column: 5)
!1039 = distinct !DILexicalBlock(scope: !1036, file: !3, line: 651, column: 5)
!1040 = !DILocation(line: 651, column: 5, scope: !1039)
!1041 = !DILocation(line: 651, column: 5, scope: !1042)
!1042 = distinct !DILexicalBlock(scope: !1038, file: !3, line: 651, column: 5)
!1043 = !DILocation(line: 651, column: 5, scope: !1044)
!1044 = distinct !DILexicalBlock(scope: !1038, file: !3, line: 651, column: 5)
!1045 = !DILocation(line: 653, column: 4, scope: !1036)
!1046 = !DILocation(line: 653, column: 15, scope: !1047)
!1047 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 653, column: 15)
!1048 = !DILocation(line: 653, column: 26, scope: !1047)
!1049 = !DILocation(line: 653, column: 15, scope: !1032)
!1050 = !DILocation(line: 655, column: 5, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1047, file: !3, line: 653, column: 32)
!1052 = !DILocation(line: 655, column: 5, scope: !1053)
!1053 = distinct !DILexicalBlock(scope: !1054, file: !3, line: 655, column: 5)
!1054 = distinct !DILexicalBlock(scope: !1051, file: !3, line: 655, column: 5)
!1055 = !DILocation(line: 655, column: 5, scope: !1054)
!1056 = !DILocation(line: 655, column: 5, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 655, column: 5)
!1058 = !DILocation(line: 655, column: 5, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1053, file: !3, line: 655, column: 5)
!1060 = !DILocation(line: 657, column: 4, scope: !1051)
!1061 = !DILocation(line: 659, column: 4, scope: !1002)
!1062 = !DILocation(line: 659, column: 4, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 659, column: 4)
!1064 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 659, column: 4)
!1065 = !DILocation(line: 659, column: 4, scope: !1064)
!1066 = !DILocation(line: 659, column: 4, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1063, file: !3, line: 659, column: 4)
!1068 = !DILocation(line: 659, column: 4, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1063, file: !3, line: 659, column: 4)
!1070 = !DILocation(line: 661, column: 4, scope: !1002)
!1071 = !DILocation(line: 663, column: 5, scope: !1072)
!1072 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 661, column: 7)
!1073 = !DILocation(line: 663, column: 5, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1075, file: !3, line: 663, column: 5)
!1075 = distinct !DILexicalBlock(scope: !1072, file: !3, line: 663, column: 5)
!1076 = !DILocation(line: 663, column: 5, scope: !1075)
!1077 = !DILocation(line: 663, column: 5, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1074, file: !3, line: 663, column: 5)
!1079 = !DILocation(line: 663, column: 5, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1074, file: !3, line: 663, column: 5)
!1081 = !DILocation(line: 665, column: 4, scope: !1072)
!1082 = !DILocation(line: 665, column: 13, scope: !1002)
!1083 = !DILocation(line: 665, column: 24, scope: !1002)
!1084 = distinct !{!1084, !1070, !1085}
!1085 = !DILocation(line: 665, column: 40, scope: !1002)
!1086 = !DILocation(line: 667, column: 4, scope: !1002)
!1087 = !DILocation(line: 667, column: 4, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1089, file: !3, line: 667, column: 4)
!1089 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 667, column: 4)
!1090 = !DILocation(line: 667, column: 4, scope: !1089)
!1091 = !DILocation(line: 667, column: 4, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1088, file: !3, line: 667, column: 4)
!1093 = !DILocation(line: 667, column: 4, scope: !1094)
!1094 = distinct !DILexicalBlock(scope: !1088, file: !3, line: 667, column: 4)
!1095 = !DILocation(line: 669, column: 8, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 669, column: 8)
!1097 = !DILocation(line: 669, column: 19, scope: !1096)
!1098 = !DILocation(line: 669, column: 8, scope: !1002)
!1099 = !DILocation(line: 670, column: 5, scope: !1096)
!1100 = !DILocation(line: 672, column: 4, scope: !1002)
!1101 = !DILocation(line: 672, column: 4, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1103, file: !3, line: 672, column: 4)
!1103 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 672, column: 4)
!1104 = !DILocation(line: 672, column: 4, scope: !1103)
!1105 = !DILocation(line: 672, column: 4, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 672, column: 4)
!1107 = !DILocation(line: 672, column: 4, scope: !1108)
!1108 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 672, column: 4)
!1109 = !DILocation(line: 674, column: 8, scope: !1110)
!1110 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 674, column: 8)
!1111 = !DILocation(line: 674, column: 19, scope: !1110)
!1112 = !DILocation(line: 674, column: 8, scope: !1002)
!1113 = !DILocation(line: 676, column: 5, scope: !1114)
!1114 = distinct !DILexicalBlock(scope: !1110, file: !3, line: 674, column: 25)
!1115 = !DILocation(line: 676, column: 5, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1117, file: !3, line: 676, column: 5)
!1117 = distinct !DILexicalBlock(scope: !1114, file: !3, line: 676, column: 5)
!1118 = !DILocation(line: 676, column: 5, scope: !1117)
!1119 = !DILocation(line: 676, column: 5, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1116, file: !3, line: 676, column: 5)
!1121 = !DILocation(line: 676, column: 5, scope: !1122)
!1122 = distinct !DILexicalBlock(scope: !1116, file: !3, line: 676, column: 5)
!1123 = !DILocation(line: 678, column: 4, scope: !1114)
!1124 = !DILocation(line: 680, column: 8, scope: !1125)
!1125 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 680, column: 8)
!1126 = !DILocation(line: 680, column: 19, scope: !1125)
!1127 = !DILocation(line: 680, column: 8, scope: !1002)
!1128 = !DILocation(line: 682, column: 5, scope: !1129)
!1129 = distinct !DILexicalBlock(scope: !1125, file: !3, line: 680, column: 25)
!1130 = !DILocation(line: 682, column: 5, scope: !1131)
!1131 = distinct !DILexicalBlock(scope: !1132, file: !3, line: 682, column: 5)
!1132 = distinct !DILexicalBlock(scope: !1129, file: !3, line: 682, column: 5)
!1133 = !DILocation(line: 682, column: 5, scope: !1132)
!1134 = !DILocation(line: 682, column: 5, scope: !1135)
!1135 = distinct !DILexicalBlock(scope: !1131, file: !3, line: 682, column: 5)
!1136 = !DILocation(line: 682, column: 5, scope: !1137)
!1137 = distinct !DILexicalBlock(scope: !1131, file: !3, line: 682, column: 5)
!1138 = !DILocation(line: 684, column: 5, scope: !1129)
!1139 = !DILocation(line: 686, column: 6, scope: !1140)
!1140 = distinct !DILexicalBlock(scope: !1129, file: !3, line: 684, column: 8)
!1141 = !DILocation(line: 686, column: 6, scope: !1142)
!1142 = distinct !DILexicalBlock(scope: !1143, file: !3, line: 686, column: 6)
!1143 = distinct !DILexicalBlock(scope: !1140, file: !3, line: 686, column: 6)
!1144 = !DILocation(line: 686, column: 6, scope: !1143)
!1145 = !DILocation(line: 686, column: 6, scope: !1146)
!1146 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 686, column: 6)
!1147 = !DILocation(line: 686, column: 6, scope: !1148)
!1148 = distinct !DILexicalBlock(scope: !1142, file: !3, line: 686, column: 6)
!1149 = !DILocation(line: 688, column: 6, scope: !1140)
!1150 = !DILocation(line: 688, column: 6, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1152, file: !3, line: 688, column: 6)
!1152 = distinct !DILexicalBlock(scope: !1140, file: !3, line: 688, column: 6)
!1153 = !DILocation(line: 688, column: 6, scope: !1152)
!1154 = !DILocation(line: 688, column: 6, scope: !1155)
!1155 = distinct !DILexicalBlock(scope: !1151, file: !3, line: 688, column: 6)
!1156 = !DILocation(line: 688, column: 6, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1151, file: !3, line: 688, column: 6)
!1158 = !DILocation(line: 690, column: 6, scope: !1140)
!1159 = !DILocation(line: 690, column: 6, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1161, file: !3, line: 690, column: 6)
!1161 = distinct !DILexicalBlock(scope: !1140, file: !3, line: 690, column: 6)
!1162 = !DILocation(line: 690, column: 6, scope: !1161)
!1163 = !DILocation(line: 690, column: 6, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 690, column: 6)
!1165 = !DILocation(line: 690, column: 6, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1160, file: !3, line: 690, column: 6)
!1167 = !DILocation(line: 692, column: 10, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1140, file: !3, line: 692, column: 10)
!1169 = !DILocation(line: 692, column: 21, scope: !1168)
!1170 = !DILocation(line: 692, column: 10, scope: !1140)
!1171 = !DILocation(line: 694, column: 7, scope: !1172)
!1172 = distinct !DILexicalBlock(scope: !1168, file: !3, line: 692, column: 27)
!1173 = !DILocation(line: 694, column: 7, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1175, file: !3, line: 694, column: 7)
!1175 = distinct !DILexicalBlock(scope: !1172, file: !3, line: 694, column: 7)
!1176 = !DILocation(line: 694, column: 7, scope: !1175)
!1177 = !DILocation(line: 694, column: 7, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1174, file: !3, line: 694, column: 7)
!1179 = !DILocation(line: 694, column: 7, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1174, file: !3, line: 694, column: 7)
!1181 = !DILocation(line: 696, column: 6, scope: !1172)
!1182 = !DILocation(line: 698, column: 6, scope: !1140)
!1183 = !DILocation(line: 698, column: 6, scope: !1184)
!1184 = distinct !DILexicalBlock(scope: !1185, file: !3, line: 698, column: 6)
!1185 = distinct !DILexicalBlock(scope: !1140, file: !3, line: 698, column: 6)
!1186 = !DILocation(line: 698, column: 6, scope: !1185)
!1187 = !DILocation(line: 698, column: 6, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1184, file: !3, line: 698, column: 6)
!1189 = !DILocation(line: 698, column: 6, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1184, file: !3, line: 698, column: 6)
!1191 = !DILocation(line: 700, column: 5, scope: !1140)
!1192 = !DILocation(line: 700, column: 13, scope: !1129)
!1193 = !DILocation(line: 700, column: 25, scope: !1129)
!1194 = !DILocation(line: 700, column: 29, scope: !1129)
!1195 = distinct !{!1195, !1138, !1196}
!1196 = !DILocation(line: 700, column: 41, scope: !1129)
!1197 = !DILocation(line: 701, column: 4, scope: !1129)
!1198 = !DILocation(line: 703, column: 8, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1002, file: !3, line: 703, column: 8)
!1200 = !DILocation(line: 703, column: 25, scope: !1199)
!1201 = !DILocation(line: 703, column: 8, scope: !1002)
!1202 = !DILocation(line: 705, column: 5, scope: !1203)
!1203 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 703, column: 31)
!1204 = !DILocation(line: 705, column: 5, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1206, file: !3, line: 705, column: 5)
!1206 = distinct !DILexicalBlock(scope: !1203, file: !3, line: 705, column: 5)
!1207 = !DILocation(line: 705, column: 5, scope: !1206)
!1208 = !DILocation(line: 705, column: 5, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1205, file: !3, line: 705, column: 5)
!1210 = !DILocation(line: 705, column: 5, scope: !1211)
!1211 = distinct !DILexicalBlock(scope: !1205, file: !3, line: 705, column: 5)
!1212 = !DILocation(line: 707, column: 4, scope: !1203)
!1213 = !DILocation(line: 707, column: 15, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1199, file: !3, line: 707, column: 15)
!1215 = !DILocation(line: 707, column: 32, scope: !1214)
!1216 = !DILocation(line: 707, column: 15, scope: !1199)
!1217 = !DILocation(line: 709, column: 5, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1214, file: !3, line: 707, column: 38)
!1219 = !DILocation(line: 709, column: 5, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !3, line: 709, column: 5)
!1221 = distinct !DILexicalBlock(scope: !1218, file: !3, line: 709, column: 5)
!1222 = !DILocation(line: 709, column: 5, scope: !1221)
!1223 = !DILocation(line: 709, column: 5, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1220, file: !3, line: 709, column: 5)
!1225 = !DILocation(line: 709, column: 5, scope: !1226)
!1226 = distinct !DILexicalBlock(scope: !1220, file: !3, line: 709, column: 5)
!1227 = !DILocation(line: 711, column: 4, scope: !1218)
!1228 = distinct !{!1228, !999, !1229}
!1229 = !DILocation(line: 712, column: 3, scope: !990)
!1230 = distinct !{!1230, !988, !1231}
!1231 = !DILocation(line: 713, column: 2, scope: !981)
