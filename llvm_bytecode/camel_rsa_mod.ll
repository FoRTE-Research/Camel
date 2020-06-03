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
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !18
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !23
@pubkey = internal constant %struct.pubkey_t { [8 x i8] c"\15p\F6B\0E\82q\A6", i16 3 }, align 2, !dbg !72
@PLAINTEXT = internal constant [12 x i8] c".RRRSSSAAA.\00", align 1, !dbg !84
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !13
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
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 224, i16 zeroext %13), !dbg !149
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
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 226, i1 false), !dbg !159
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
define dso_local void @task_done() #0 !dbg !169 {
entry:
  call void @exit(i16 0) #6, !dbg !170
  unreachable, !dbg !170
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !171 {
entry:
  %i = alloca i16, align 2
  %message_length = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !172, metadata !DIExpression()), !dbg !174
  call void @llvm.dbg.declare(metadata i16* %message_length, metadata !175, metadata !DIExpression()), !dbg !176
  store i16 11, i16* %message_length, align 2, !dbg !176
  store i16 0, i16* %i, align 2, !dbg !177
  br label %for.cond, !dbg !179

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !180
  %cmp = icmp slt i16 %0, 8, !dbg !182
  br i1 %cmp, label %for.body, label %for.end, !dbg !183

for.body:                                         ; preds = %for.cond
  %1 = load i16, i16* %i, align 2, !dbg !184
  %arrayidx = getelementptr inbounds [8 x i8], [8 x i8]* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 0), i16 0, i16 %1, !dbg !186
  %2 = load i8, i8* %arrayidx, align 1, !dbg !186
  %conv = zext i8 %2 to i16, !dbg !186
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !187
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !187
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !187
  %4 = load i16, i16* %i, align 2, !dbg !188
  %arrayidx1 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %4, !dbg !187
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
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !202
  store i16 0, i16* %check, align 2, !dbg !203
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !204
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !204
  store i16 0, i16* %check_final, align 2, !dbg !205
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
  %cmp2 = icmp ult i16 %4, 7, !dbg !225
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
  %arrayidx = getelementptr inbounds [12 x i8], [12 x i8]* @PLAINTEXT, i16 0, i16 %add10, !dbg !237
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
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %15, !dbg !238
  store i16 %cond, i16* %arrayidx12, align 2, !dbg !240
  br label %for.inc, !dbg !241

for.inc:                                          ; preds = %cond.end
  %16 = load i16, i16* %i, align 2, !dbg !242
  %inc = add nsw i16 %16, 1, !dbg !242
  store i16 %inc, i16* %i, align 2, !dbg !242
  br label %for.cond, !dbg !243, !llvm.loop !244

for.end:                                          ; preds = %for.cond
  store i16 7, i16* %i, align 2, !dbg !246
  br label %for.cond13, !dbg !248

for.cond13:                                       ; preds = %for.inc20, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !249
  %cmp14 = icmp slt i16 %17, 8, !dbg !251
  br i1 %cmp14, label %for.body16, label %for.end22, !dbg !252

for.body16:                                       ; preds = %for.cond13
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !253
  %base18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !253
  %19 = load i16, i16* %i, align 2, !dbg !255
  %arrayidx19 = getelementptr inbounds [16 x i16], [16 x i16]* %base18, i16 0, i16 %19, !dbg !253
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
  %22 = load i16, i16* %zero, align 2, !dbg !263
  %arrayidx24 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %22, !dbg !262
  store i16 1, i16* %arrayidx24, align 2, !dbg !264
  store i16 1, i16* %i, align 2, !dbg !265
  br label %for.cond25, !dbg !267

for.cond25:                                       ; preds = %for.inc32, %for.end22
  %23 = load i16, i16* %i, align 2, !dbg !268
  %cmp26 = icmp slt i16 %23, 8, !dbg !270
  br i1 %cmp26, label %for.body28, label %for.end34, !dbg !271

for.body28:                                       ; preds = %for.cond25
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !272
  %block30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 15, !dbg !272
  %25 = load i16, i16* %i, align 2, !dbg !273
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %block30, i16 0, i16 %25, !dbg !272
  store i16 0, i16* %arrayidx31, align 2, !dbg !274
  br label %for.inc32, !dbg !272

for.inc32:                                        ; preds = %for.body28
  %26 = load i16, i16* %i, align 2, !dbg !275
  %inc33 = add nsw i16 %26, 1, !dbg !275
  store i16 %inc33, i16* %i, align 2, !dbg !275
  br label %for.cond25, !dbg !276, !llvm.loop !277

for.end34:                                        ; preds = %for.cond25
  %27 = load i16, i16* getelementptr inbounds (%struct.pubkey_t, %struct.pubkey_t* @pubkey, i32 0, i32 1), align 2, !dbg !279
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !280
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 1, !dbg !280
  store i16 %27, i16* %exponent, align 2, !dbg !281
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !282
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !282
  %block_offset37 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 3, !dbg !282
  %30 = load i16, i16* %block_offset37, align 2, !dbg !283
  %add38 = add i16 %30, 7, !dbg !283
  store i16 %add38, i16* %block_offset37, align 2, !dbg !283
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !284
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 17, !dbg !284
  store i16 2, i16* %check, align 2, !dbg !285
  ret void, !dbg !286
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_exp() #0 !dbg !287 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !288
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !288
  %1 = load i16, i16* %exponent, align 2, !dbg !288
  %and = and i16 %1, 1, !dbg !290
  %tobool = icmp ne i16 %and, 0, !dbg !290
  br i1 %tobool, label %if.then, label %if.else, !dbg !291

if.then:                                          ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !292
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !292
  %exponent2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !292
  %3 = load i16, i16* %exponent2, align 2, !dbg !294
  %shr = lshr i16 %3, 1, !dbg !294
  store i16 %shr, i16* %exponent2, align 2, !dbg !294
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !295
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !295
  store i16 0, i16* %check, align 2, !dbg !296
  br label %if.end, !dbg !297

if.else:                                          ; preds = %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !298
  %exponent5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !298
  %6 = load i16, i16* %exponent5, align 2, !dbg !300
  %shr6 = lshr i16 %6, 1, !dbg !300
  store i16 %shr6, i16* %exponent5, align 2, !dbg !300
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !301
  %check8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 17, !dbg !301
  store i16 1, i16* %check8, align 2, !dbg !302
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !303
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block() #0 !dbg !304 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !305
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !305
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !305
  store i16 0, i16* %check_final, align 2, !dbg !306
  ret void, !dbg !307
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_block_get_result() #0 !dbg !308 {
entry:
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !309, metadata !DIExpression()), !dbg !310
  store i16 7, i16* %i, align 2, !dbg !311
  br label %for.cond, !dbg !313

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !314
  %cmp = icmp sge i16 %0, 0, !dbg !316
  br i1 %cmp, label %for.body, label %for.end, !dbg !317

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !318
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !318
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !318
  %2 = load i16, i16* %i, align 2, !dbg !320
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !318
  %3 = load i16, i16* %arrayidx, align 2, !dbg !318
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !321
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !321
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !321
  %5 = load i16, i16* %i, align 2, !dbg !322
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %5, !dbg !321
  store i16 %3, i16* %arrayidx2, align 2, !dbg !323
  br label %for.inc, !dbg !324

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !325
  %dec = add nsw i16 %6, -1, !dbg !325
  store i16 %dec, i16* %i, align 2, !dbg !325
  br label %for.cond, !dbg !326, !llvm.loop !327

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !329
  %exponent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !329
  %8 = load i16, i16* %exponent, align 2, !dbg !329
  %cmp4 = icmp ugt i16 %8, 0, !dbg !331
  br i1 %cmp4, label %if.then, label %if.else, !dbg !332

if.then:                                          ; preds = %for.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !333
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 17, !dbg !333
  store i16 1, i16* %check, align 2, !dbg !335
  br label %if.end26, !dbg !336

if.else:                                          ; preds = %for.end
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !337
  %cyphertext_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !337
  %11 = load i16, i16* %cyphertext_len, align 2, !dbg !337
  %add = add i16 %11, 8, !dbg !340
  %cmp7 = icmp ule i16 %add, 16, !dbg !341
  br i1 %cmp7, label %if.then8, label %if.end, !dbg !342

if.then8:                                         ; preds = %if.else
  store i16 0, i16* %i, align 2, !dbg !343
  br label %for.cond9, !dbg !346

for.cond9:                                        ; preds = %for.inc21, %if.then8
  %12 = load i16, i16* %i, align 2, !dbg !347
  %cmp10 = icmp slt i16 %12, 8, !dbg !349
  br i1 %cmp10, label %for.body11, label %for.end23, !dbg !350

for.body11:                                       ; preds = %for.cond9
  call void @llvm.dbg.declare(metadata i16* %op, metadata !351, metadata !DIExpression()), !dbg !353
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !354
  %cyphertext_len13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !354
  %14 = load i16, i16* %cyphertext_len13, align 2, !dbg !354
  store i16 %14, i16* %op, align 2, !dbg !353
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !355
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !355
  %product15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !355
  %16 = load i16, i16* %i, align 2, !dbg !356
  %arrayidx16 = getelementptr inbounds [16 x i16], [16 x i16]* %product15, i16 0, i16 %16, !dbg !355
  %17 = load i16, i16* %arrayidx16, align 2, !dbg !355
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !357
  %cyphertext = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 11, !dbg !357
  %19 = load i16, i16* %op, align 2, !dbg !358
  %arrayidx18 = getelementptr inbounds [16 x i16], [16 x i16]* %cyphertext, i16 0, i16 %19, !dbg !357
  store i16 %17, i16* %arrayidx18, align 2, !dbg !359
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !360
  %cyphertext_len20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !360
  %21 = load i16, i16* %cyphertext_len20, align 2, !dbg !361
  %inc = add i16 %21, 1, !dbg !361
  store i16 %inc, i16* %cyphertext_len20, align 2, !dbg !361
  br label %for.inc21, !dbg !362

for.inc21:                                        ; preds = %for.body11
  %22 = load i16, i16* %i, align 2, !dbg !363
  %inc22 = add nsw i16 %22, 1, !dbg !363
  store i16 %inc22, i16* %i, align 2, !dbg !363
  br label %for.cond9, !dbg !364, !llvm.loop !365

for.end23:                                        ; preds = %for.cond9
  br label %if.end, !dbg !367

if.end:                                           ; preds = %for.end23, %if.else
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !368
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !368
  %check25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !368
  store i16 0, i16* %check25, align 2, !dbg !369
  br label %if.end26

if.end26:                                         ; preds = %if.end, %if.then
  ret void, !dbg !370
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base() #0 !dbg !371 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !372
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 18, !dbg !372
  store i16 1, i16* %check_final, align 2, !dbg !373
  ret void, !dbg !374
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_square_base_get_result() #0 !dbg !375 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !376, metadata !DIExpression()), !dbg !377
  store i16 0, i16* %i, align 2, !dbg !378
  br label %for.cond, !dbg !380

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !381
  %cmp = icmp slt i16 %0, 8, !dbg !383
  br i1 %cmp, label %for.body, label %for.end, !dbg !384

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !385
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !385
  %2 = load i16, i16* %i, align 2, !dbg !387
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !385
  %3 = load i16, i16* %arrayidx, align 2, !dbg !385
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !388
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !388
  %5 = load i16, i16* %i, align 2, !dbg !389
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %5, !dbg !388
  store i16 %3, i16* %arrayidx2, align 2, !dbg !390
  br label %for.inc, !dbg !391

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !392
  %inc = add nsw i16 %6, 1, !dbg !392
  store i16 %inc, i16* %i, align 2, !dbg !392
  br label %for.cond, !dbg !393, !llvm.loop !394

for.end:                                          ; preds = %for.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !396
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !396
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !396
  store i16 2, i16* %check, align 2, !dbg !397
  ret void, !dbg !398
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult_mod() #0 !dbg !399 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !400
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !400
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !400
  store i16 0, i16* %digit, align 2, !dbg !401
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !402
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !402
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !402
  store i16 0, i16* %carry, align 2, !dbg !403
  ret void, !dbg !404
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_mult() #0 !dbg !405 {
entry:
  %i = alloca i16, align 2
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  %c = alloca i16, align 2
  %dp = alloca i16, align 2
  %p = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !406, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata i16* %a, metadata !408, metadata !DIExpression()), !dbg !409
  call void @llvm.dbg.declare(metadata i16* %b, metadata !410, metadata !DIExpression()), !dbg !411
  call void @llvm.dbg.declare(metadata i16* %c, metadata !412, metadata !DIExpression()), !dbg !413
  call void @llvm.dbg.declare(metadata i16* %dp, metadata !414, metadata !DIExpression()), !dbg !415
  call void @llvm.dbg.declare(metadata i16* %p, metadata !416, metadata !DIExpression()), !dbg !417
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !418
  %carry = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 9, !dbg !418
  %1 = load i16, i16* %carry, align 2, !dbg !418
  store i16 %1, i16* %p, align 2, !dbg !419
  store i16 0, i16* %c, align 2, !dbg !420
  store i16 0, i16* %i, align 2, !dbg !421
  br label %for.cond, !dbg !423

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !424
  %cmp = icmp slt i16 %2, 8, !dbg !426
  br i1 %cmp, label %for.body, label %for.end, !dbg !427

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !428
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !428
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !428
  %4 = load i16, i16* %digit, align 2, !dbg !428
  %5 = load i16, i16* %i, align 2, !dbg !431
  %sub = sub i16 %4, %5, !dbg !432
  %cmp2 = icmp uge i16 %sub, 0, !dbg !433
  br i1 %cmp2, label %land.lhs.true, label %if.end, !dbg !434

land.lhs.true:                                    ; preds = %for.body
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !435
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !435
  %digit4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !435
  %7 = load i16, i16* %digit4, align 2, !dbg !435
  %8 = load i16, i16* %i, align 2, !dbg !436
  %sub5 = sub i16 %7, %8, !dbg !437
  %cmp6 = icmp ult i16 %sub5, 8, !dbg !438
  br i1 %cmp6, label %if.then, label %if.end, !dbg !439

if.then:                                          ; preds = %land.lhs.true
  call void @llvm.dbg.declare(metadata i16* %op, metadata !440, metadata !DIExpression()), !dbg !442
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !443
  %digit8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !443
  %10 = load i16, i16* %digit8, align 2, !dbg !443
  %11 = load i16, i16* %i, align 2, !dbg !444
  %sub9 = sub i16 %10, %11, !dbg !445
  store i16 %sub9, i16* %op, align 2, !dbg !442
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !446
  %base = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !446
  %13 = load i16, i16* %op, align 2, !dbg !447
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %base, i16 0, i16 %13, !dbg !446
  %14 = load i16, i16* %arrayidx, align 2, !dbg !446
  store i16 %14, i16* %a, align 2, !dbg !448
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !449
  %block = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 15, !dbg !449
  %16 = load i16, i16* %i, align 2, !dbg !450
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %block, i16 0, i16 %16, !dbg !449
  %17 = load i16, i16* %arrayidx12, align 2, !dbg !449
  store i16 %17, i16* %b, align 2, !dbg !451
  %18 = load i16, i16* %a, align 2, !dbg !452
  %19 = load i16, i16* %b, align 2, !dbg !453
  %mul = mul i16 %18, %19, !dbg !454
  store i16 %mul, i16* %dp, align 2, !dbg !455
  %20 = load i16, i16* %dp, align 2, !dbg !456
  %shr = lshr i16 %20, 8, !dbg !457
  %21 = load i16, i16* %c, align 2, !dbg !458
  %add = add i16 %21, %shr, !dbg !458
  store i16 %add, i16* %c, align 2, !dbg !458
  %22 = load i16, i16* %dp, align 2, !dbg !459
  %and = and i16 %22, 255, !dbg !460
  %23 = load i16, i16* %p, align 2, !dbg !461
  %add13 = add i16 %23, %and, !dbg !461
  store i16 %add13, i16* %p, align 2, !dbg !461
  br label %if.end, !dbg !462

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc, !dbg !463

for.inc:                                          ; preds = %if.end
  %24 = load i16, i16* %i, align 2, !dbg !464
  %inc = add nsw i16 %24, 1, !dbg !464
  store i16 %inc, i16* %i, align 2, !dbg !464
  br label %for.cond, !dbg !465, !llvm.loop !466

for.end:                                          ; preds = %for.cond
  %25 = load i16, i16* %p, align 2, !dbg !468
  %shr14 = lshr i16 %25, 8, !dbg !469
  %26 = load i16, i16* %c, align 2, !dbg !470
  %add15 = add i16 %26, %shr14, !dbg !470
  store i16 %add15, i16* %c, align 2, !dbg !470
  %27 = load i16, i16* %p, align 2, !dbg !471
  %and16 = and i16 %27, 255, !dbg !471
  store i16 %and16, i16* %p, align 2, !dbg !471
  %28 = load i16, i16* %p, align 2, !dbg !472
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !473
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 0, !dbg !473
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !474
  %digit19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !474
  %31 = load i16, i16* %digit19, align 2, !dbg !474
  %arrayidx20 = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %31, !dbg !473
  store i16 %28, i16* %arrayidx20, align 2, !dbg !475
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !476
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !476
  %digit22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !476
  %33 = load i16, i16* %digit22, align 2, !dbg !477
  %inc23 = add i16 %33, 1, !dbg !477
  store i16 %inc23, i16* %digit22, align 2, !dbg !477
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !478
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !478
  %digit25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !478
  %35 = load i16, i16* %digit25, align 2, !dbg !478
  %cmp26 = icmp ult i16 %35, 16, !dbg !480
  br i1 %cmp26, label %if.then27, label %if.end30, !dbg !481

if.then27:                                        ; preds = %for.end
  %36 = load i16, i16* %c, align 2, !dbg !482
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !484
  %carry29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 9, !dbg !484
  store i16 %36, i16* %carry29, align 2, !dbg !485
  br label %if.end30, !dbg !486

if.end30:                                         ; preds = %if.then27, %for.end
  ret void, !dbg !487
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_digits() #0 !dbg !488 {
entry:
  %d = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %d, metadata !489, metadata !DIExpression()), !dbg !490
  store i16 16, i16* %d, align 2, !dbg !491
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
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !496
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
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product3, i16 0, i16 %7, !dbg !505
  %8 = load i16, i16* %arrayidx4, align 2, !dbg !505
  %cmp5 = icmp eq i16 %8, 0, !dbg !508
  br i1 %cmp5, label %if.then, label %if.end, !dbg !509

if.then:                                          ; preds = %do.end
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !510
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !510
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 17, !dbg !510
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
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !517
  store i16 1, i16* %check9, align 2, !dbg !518
  ret void, !dbg !519
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalizable() #0 !dbg !520 {
entry:
  %i = alloca i16, align 2
  %normalizable = alloca i8, align 1
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !521, metadata !DIExpression()), !dbg !522
  call void @llvm.dbg.declare(metadata i8* %normalizable, metadata !523, metadata !DIExpression()), !dbg !525
  store i8 1, i8* %normalizable, align 1, !dbg !525
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !526
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !526
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !526
  %1 = load i16, i16* %reduce, align 2, !dbg !526
  %add = add i16 %1, 1, !dbg !527
  %sub = sub i16 %add, 8, !dbg !528
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !529
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !529
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !529
  store i16 %sub, i16* %offset, align 2, !dbg !530
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !531
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !531
  %reduce3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !531
  %4 = load i16, i16* %reduce3, align 2, !dbg !531
  store i16 %4, i16* %i, align 2, !dbg !533
  br label %for.cond, !dbg !534

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i16, i16* %i, align 2, !dbg !535
  %cmp = icmp sge i16 %5, 0, !dbg !537
  br i1 %cmp, label %for.body, label %for.end, !dbg !538

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16* %op, metadata !539, metadata !DIExpression()), !dbg !541
  %6 = load i16, i16* %i, align 2, !dbg !542
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !543
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !543
  %offset5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 12, !dbg !543
  %8 = load i16, i16* %offset5, align 2, !dbg !543
  %sub6 = sub i16 %6, %8, !dbg !544
  store i16 %sub6, i16* %op, align 2, !dbg !541
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !545
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !545
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !545
  %10 = load i16, i16* %i, align 2, !dbg !547
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %10, !dbg !545
  %11 = load i16, i16* %arrayidx, align 2, !dbg !545
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !548
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !548
  %13 = load i16, i16* %op, align 2, !dbg !549
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %13, !dbg !548
  %14 = load i16, i16* %arrayidx9, align 2, !dbg !548
  %cmp10 = icmp ugt i16 %11, %14, !dbg !550
  br i1 %cmp10, label %if.then, label %if.else, !dbg !551

if.then:                                          ; preds = %for.body
  br label %for.end, !dbg !552

if.else:                                          ; preds = %for.body
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !554
  %product12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !554
  %16 = load i16, i16* %i, align 2, !dbg !556
  %arrayidx13 = getelementptr inbounds [16 x i16], [16 x i16]* %product12, i16 0, i16 %16, !dbg !554
  %17 = load i16, i16* %arrayidx13, align 2, !dbg !554
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !557
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !557
  %modulus15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 7, !dbg !557
  %19 = load i16, i16* %op, align 2, !dbg !558
  %arrayidx16 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus15, i16 0, i16 %19, !dbg !557
  %20 = load i16, i16* %arrayidx16, align 2, !dbg !557
  %cmp17 = icmp ult i16 %17, %20, !dbg !559
  br i1 %cmp17, label %if.then18, label %if.end, !dbg !560

if.then18:                                        ; preds = %if.else
  store i8 0, i8* %normalizable, align 1, !dbg !561
  br label %for.end, !dbg !563

if.end:                                           ; preds = %if.else
  br label %if.end19

if.end19:                                         ; preds = %if.end
  br label %for.inc, !dbg !564

for.inc:                                          ; preds = %if.end19
  %21 = load i16, i16* %i, align 2, !dbg !565
  %dec = add nsw i16 %21, -1, !dbg !565
  store i16 %dec, i16* %i, align 2, !dbg !565
  br label %for.cond, !dbg !566, !llvm.loop !567

for.end:                                          ; preds = %if.then18, %if.then, %for.cond
  %22 = load i8, i8* %normalizable, align 1, !dbg !569
  %tobool = trunc i8 %22 to i1, !dbg !569
  br i1 %tobool, label %if.end25, label %land.lhs.true, !dbg !571

land.lhs.true:                                    ; preds = %for.end
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !572
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !572
  %reduce21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 10, !dbg !572
  %24 = load i16, i16* %reduce21, align 2, !dbg !572
  %cmp22 = icmp eq i16 %24, 7, !dbg !573
  br i1 %cmp22, label %if.then23, label %if.end25, !dbg !574

if.then23:                                        ; preds = %land.lhs.true
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !575
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !575
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 17, !dbg !575
  store i16 0, i16* %check, align 2, !dbg !577
  br label %if.end25, !dbg !578

if.end25:                                         ; preds = %if.then23, %land.lhs.true, %for.end
  %26 = load i8, i8* %normalizable, align 1, !dbg !579
  %tobool26 = trunc i8 %26 to i1, !dbg !579
  br i1 %tobool26, label %if.then27, label %if.else30, !dbg !581

if.then27:                                        ; preds = %if.end25
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !582
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !582
  %check29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 17, !dbg !582
  store i16 1, i16* %check29, align 2, !dbg !584
  br label %if.end33, !dbg !585

if.else30:                                        ; preds = %if.end25
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !586
  %check32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 17, !dbg !586
  store i16 2, i16* %check32, align 2, !dbg !588
  br label %if.end33

if.end33:                                         ; preds = %if.else30, %if.then27
  ret void, !dbg !589
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_normalize() #0 !dbg !590 {
entry:
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %d = alloca i16, align 2
  %s = alloca i16, align 2
  %borrow = alloca i16, align 2
  %i = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %m, metadata !591, metadata !DIExpression()), !dbg !592
  call void @llvm.dbg.declare(metadata i16* %n, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata i16* %d, metadata !595, metadata !DIExpression()), !dbg !596
  call void @llvm.dbg.declare(metadata i16* %s, metadata !597, metadata !DIExpression()), !dbg !598
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !599, metadata !DIExpression()), !dbg !600
  call void @llvm.dbg.declare(metadata i16* %i, metadata !601, metadata !DIExpression()), !dbg !602
  store i16 0, i16* %borrow, align 2, !dbg !603
  store i16 0, i16* %i, align 2, !dbg !604
  br label %for.cond, !dbg !606

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !607
  %cmp = icmp slt i16 %0, 8, !dbg !609
  br i1 %cmp, label %for.body, label %for.end, !dbg !610

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i16* %op, metadata !611, metadata !DIExpression()), !dbg !613
  %1 = load i16, i16* %i, align 2, !dbg !614
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !615
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !615
  %offset = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !615
  %3 = load i16, i16* %offset, align 2, !dbg !615
  %add = add i16 %1, %3, !dbg !616
  store i16 %add, i16* %op, align 2, !dbg !613
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !617
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !617
  %5 = load i16, i16* %op, align 2, !dbg !618
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %5, !dbg !617
  %6 = load i16, i16* %arrayidx, align 2, !dbg !617
  store i16 %6, i16* %m, align 2, !dbg !619
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !620
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !620
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !620
  %8 = load i16, i16* %i, align 2, !dbg !621
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %8, !dbg !620
  %9 = load i16, i16* %arrayidx3, align 2, !dbg !620
  store i16 %9, i16* %n, align 2, !dbg !622
  %10 = load i16, i16* %n, align 2, !dbg !623
  %11 = load i16, i16* %borrow, align 2, !dbg !624
  %add4 = add i16 %10, %11, !dbg !625
  store i16 %add4, i16* %s, align 2, !dbg !626
  %12 = load i16, i16* %m, align 2, !dbg !627
  %13 = load i16, i16* %s, align 2, !dbg !629
  %cmp5 = icmp ult i16 %12, %13, !dbg !630
  br i1 %cmp5, label %if.then, label %if.else, !dbg !631

if.then:                                          ; preds = %for.body
  %14 = load i16, i16* %m, align 2, !dbg !632
  %add6 = add i16 %14, 256, !dbg !632
  store i16 %add6, i16* %m, align 2, !dbg !632
  store i16 1, i16* %borrow, align 2, !dbg !634
  br label %if.end, !dbg !635

if.else:                                          ; preds = %for.body
  store i16 0, i16* %borrow, align 2, !dbg !636
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %15 = load i16, i16* %m, align 2, !dbg !638
  %16 = load i16, i16* %s, align 2, !dbg !639
  %sub = sub i16 %15, %16, !dbg !640
  store i16 %sub, i16* %d, align 2, !dbg !641
  %17 = load i16, i16* %d, align 2, !dbg !642
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !643
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !643
  %product8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !643
  %19 = load i16, i16* %op, align 2, !dbg !644
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product8, i16 0, i16 %19, !dbg !643
  store i16 %17, i16* %arrayidx9, align 2, !dbg !645
  br label %for.inc, !dbg !646

for.inc:                                          ; preds = %if.end
  %20 = load i16, i16* %i, align 2, !dbg !647
  %inc = add nsw i16 %20, 1, !dbg !647
  store i16 %inc, i16* %i, align 2, !dbg !647
  br label %for.cond, !dbg !648, !llvm.loop !649

for.end:                                          ; preds = %for.cond
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !651
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !651
  %offset11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !651
  %22 = load i16, i16* %offset11, align 2, !dbg !651
  %cmp12 = icmp ugt i16 %22, 0, !dbg !653
  br i1 %cmp12, label %if.then13, label %if.else15, !dbg !654

if.then13:                                        ; preds = %for.end
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !655
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !655
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 17, !dbg !655
  store i16 2, i16* %check, align 2, !dbg !657
  br label %if.end18, !dbg !658

if.else15:                                        ; preds = %for.end
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !659
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !659
  %check17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !659
  store i16 0, i16* %check17, align 2, !dbg !661
  br label %if.end18

if.end18:                                         ; preds = %if.else15, %if.then13
  ret void, !dbg !662
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_n_divisor() #0 !dbg !663 {
entry:
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !664, metadata !DIExpression()), !dbg !665
  store i16 7, i16* %op1, align 2, !dbg !665
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !666, metadata !DIExpression()), !dbg !667
  store i16 6, i16* %op2, align 2, !dbg !667
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !668
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !668
  %1 = load i16, i16* %op1, align 2, !dbg !669
  %arrayidx = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %1, !dbg !668
  %2 = load i16, i16* %arrayidx, align 2, !dbg !668
  %shl = shl i16 %2, 8, !dbg !670
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !671
  %modulus2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 7, !dbg !671
  %4 = load i16, i16* %op2, align 2, !dbg !672
  %arrayidx3 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus2, i16 0, i16 %4, !dbg !671
  %5 = load i16, i16* %arrayidx3, align 2, !dbg !671
  %add = add i16 %shl, %5, !dbg !673
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !674
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 13, !dbg !674
  store i16 %add, i16* %n_div, align 2, !dbg !675
  ret void, !dbg !676
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_quotient() #0 !dbg !677 {
entry:
  %qn = alloca i32, align 2
  %n_q = alloca i32, align 2
  %op1 = alloca i16, align 2
  %op2 = alloca i16, align 2
  %op3 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i32* %qn, metadata !678, metadata !DIExpression()), !dbg !679
  call void @llvm.dbg.declare(metadata i32* %n_q, metadata !680, metadata !DIExpression()), !dbg !681
  call void @llvm.dbg.declare(metadata i16* %op1, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 7, i16* %op1, align 2, !dbg !683
  call void @llvm.dbg.declare(metadata i16* %op2, metadata !684, metadata !DIExpression()), !dbg !685
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !686
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !686
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !686
  %1 = load i16, i16* %reduce, align 2, !dbg !686
  %sub = sub i16 %1, 1, !dbg !687
  store i16 %sub, i16* %op2, align 2, !dbg !685
  call void @llvm.dbg.declare(metadata i16* %op3, metadata !688, metadata !DIExpression()), !dbg !689
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !690
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !690
  %reduce2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !690
  %3 = load i16, i16* %reduce2, align 2, !dbg !690
  %sub3 = sub i16 %3, 2, !dbg !691
  store i16 %sub3, i16* %op3, align 2, !dbg !689
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !692
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !692
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !692
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !694
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !694
  %reduce6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !694
  %6 = load i16, i16* %reduce6, align 2, !dbg !694
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %6, !dbg !692
  %7 = load i16, i16* %arrayidx, align 2, !dbg !692
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !695
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !695
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 7, !dbg !695
  %9 = load i16, i16* %op1, align 2, !dbg !696
  %arrayidx8 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %9, !dbg !695
  %10 = load i16, i16* %arrayidx8, align 2, !dbg !695
  %cmp = icmp eq i16 %7, %10, !dbg !697
  br i1 %cmp, label %if.then, label %if.else, !dbg !698

if.then:                                          ; preds = %entry
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !699
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !699
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !699
  store i16 255, i16* %quotient, align 2, !dbg !701
  br label %if.end, !dbg !702

if.else:                                          ; preds = %entry
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !703
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !703
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !703
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !705
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !705
  %reduce13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !705
  %14 = load i16, i16* %reduce13, align 2, !dbg !705
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %14, !dbg !703
  %15 = load i16, i16* %arrayidx14, align 2, !dbg !703
  %shl = shl i16 %15, 8, !dbg !706
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !707
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !707
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !707
  %17 = load i16, i16* %op2, align 2, !dbg !708
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %17, !dbg !707
  %18 = load i16, i16* %arrayidx17, align 2, !dbg !707
  %add = add i16 %shl, %18, !dbg !709
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !710
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !710
  %modulus19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 7, !dbg !710
  %20 = load i16, i16* %op1, align 2, !dbg !711
  %arrayidx20 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus19, i16 0, i16 %20, !dbg !710
  %21 = load i16, i16* %arrayidx20, align 2, !dbg !710
  %div = udiv i16 %add, %21, !dbg !712
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !713
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !713
  %quotient22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 16, !dbg !713
  store i16 %div, i16* %quotient22, align 2, !dbg !714
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !715
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !715
  %product24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 0, !dbg !715
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !716
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !716
  %reduce26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 10, !dbg !716
  %25 = load i16, i16* %reduce26, align 2, !dbg !716
  %arrayidx27 = getelementptr inbounds [16 x i16], [16 x i16]* %product24, i16 0, i16 %25, !dbg !715
  %26 = load i16, i16* %arrayidx27, align 2, !dbg !715
  %conv = zext i16 %26 to i32, !dbg !717
  %shl28 = shl i32 %conv, 16, !dbg !718
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !719
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !719
  %product30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !719
  %28 = load i16, i16* %op2, align 2, !dbg !720
  %arrayidx31 = getelementptr inbounds [16 x i16], [16 x i16]* %product30, i16 0, i16 %28, !dbg !719
  %29 = load i16, i16* %arrayidx31, align 2, !dbg !719
  %shl32 = shl i16 %29, 8, !dbg !721
  %conv33 = zext i16 %shl32 to i32, !dbg !722
  %add34 = add i32 %shl28, %conv33, !dbg !723
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !724
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !724
  %product36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 0, !dbg !724
  %31 = load i16, i16* %op3, align 2, !dbg !725
  %arrayidx37 = getelementptr inbounds [16 x i16], [16 x i16]* %product36, i16 0, i16 %31, !dbg !724
  %32 = load i16, i16* %arrayidx37, align 2, !dbg !724
  %conv38 = zext i16 %32 to i32, !dbg !724
  %add39 = add i32 %add34, %conv38, !dbg !726
  store i32 %add39, i32* %n_q, align 2, !dbg !727
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !728
  %quotient41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 16, !dbg !728
  %34 = load i16, i16* %quotient41, align 2, !dbg !729
  %inc = add i16 %34, 1, !dbg !729
  store i16 %inc, i16* %quotient41, align 2, !dbg !729
  br label %do.body, !dbg !730

do.body:                                          ; preds = %do.cond, %if.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !731
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !731
  %quotient43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 16, !dbg !731
  %36 = load i16, i16* %quotient43, align 2, !dbg !733
  %dec = add i16 %36, -1, !dbg !733
  store i16 %dec, i16* %quotient43, align 2, !dbg !733
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !734
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !734
  %n_div = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 13, !dbg !734
  %38 = load i16, i16* %n_div, align 2, !dbg !734
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !735
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !735
  %quotient46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 16, !dbg !735
  %40 = load i16, i16* %quotient46, align 2, !dbg !735
  %mul = mul i16 %38, %40, !dbg !736
  %conv47 = zext i16 %mul to i32, !dbg !734
  store i32 %conv47, i32* %qn, align 2, !dbg !737
  br label %do.cond, !dbg !738

do.cond:                                          ; preds = %do.body
  %41 = load i32, i32* %qn, align 2, !dbg !739
  %42 = load i32, i32* %n_q, align 2, !dbg !740
  %cmp48 = icmp ugt i32 %41, %42, !dbg !741
  br i1 %cmp48, label %do.body, label %do.end, !dbg !738, !llvm.loop !742

do.end:                                           ; preds = %do.cond
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !744
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !744
  %reduce51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 10, !dbg !744
  %44 = load i16, i16* %reduce51, align 2, !dbg !745
  %dec52 = add i16 %44, -1, !dbg !745
  store i16 %dec52, i16* %reduce51, align 2, !dbg !745
  ret void, !dbg !746
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_multiply() #0 !dbg !747 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  %op = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !748, metadata !DIExpression()), !dbg !749
  call void @llvm.dbg.declare(metadata i16* %m, metadata !750, metadata !DIExpression()), !dbg !751
  call void @llvm.dbg.declare(metadata i16* %n, metadata !752, metadata !DIExpression()), !dbg !753
  call void @llvm.dbg.declare(metadata i16* %c, metadata !754, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !756, metadata !DIExpression()), !dbg !757
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !758
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !758
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !758
  %1 = load i16, i16* %reduce, align 2, !dbg !758
  %add = add i16 %1, 1, !dbg !759
  %sub = sub i16 %add, 8, !dbg !760
  store i16 %sub, i16* %offset, align 2, !dbg !761
  store i16 0, i16* %i, align 2, !dbg !762
  br label %for.cond, !dbg !764

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !765
  %3 = load i16, i16* %offset, align 2, !dbg !767
  %cmp = icmp ult i16 %2, %3, !dbg !768
  br i1 %cmp, label %for.body, label %for.end, !dbg !769

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !770
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !770
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !770
  %5 = load i16, i16* %i, align 2, !dbg !772
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %5, !dbg !770
  store i16 0, i16* %arrayidx, align 2, !dbg !773
  br label %for.inc, !dbg !774

for.inc:                                          ; preds = %for.body
  %6 = load i16, i16* %i, align 2, !dbg !775
  %inc = add nsw i16 %6, 1, !dbg !775
  store i16 %inc, i16* %i, align 2, !dbg !775
  br label %for.cond, !dbg !776, !llvm.loop !777

for.end:                                          ; preds = %for.cond
  store i16 0, i16* %c, align 2, !dbg !779
  %7 = load i16, i16* %offset, align 2, !dbg !780
  store i16 %7, i16* %i, align 2, !dbg !782
  br label %for.cond2, !dbg !783

for.cond2:                                        ; preds = %for.inc15, %for.end
  %8 = load i16, i16* %i, align 2, !dbg !784
  %cmp3 = icmp slt i16 %8, 16, !dbg !786
  br i1 %cmp3, label %for.body4, label %for.end17, !dbg !787

for.body4:                                        ; preds = %for.cond2
  %9 = load i16, i16* %c, align 2, !dbg !788
  store i16 %9, i16* %m, align 2, !dbg !790
  %10 = load i16, i16* %i, align 2, !dbg !791
  %11 = load i16, i16* %offset, align 2, !dbg !793
  %add5 = add i16 %11, 8, !dbg !794
  %cmp6 = icmp ult i16 %10, %add5, !dbg !795
  br i1 %cmp6, label %if.then, label %if.else, !dbg !796

if.then:                                          ; preds = %for.body4
  call void @llvm.dbg.declare(metadata i16* %op, metadata !797, metadata !DIExpression()), !dbg !799
  %12 = load i16, i16* %i, align 2, !dbg !800
  %13 = load i16, i16* %offset, align 2, !dbg !801
  %sub7 = sub i16 %12, %13, !dbg !802
  store i16 %sub7, i16* %op, align 2, !dbg !799
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !803
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !803
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7, !dbg !803
  %15 = load i16, i16* %op, align 2, !dbg !804
  %arrayidx9 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %15, !dbg !803
  %16 = load i16, i16* %arrayidx9, align 2, !dbg !803
  store i16 %16, i16* %n, align 2, !dbg !805
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !806
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !806
  %quotient = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !806
  %18 = load i16, i16* %quotient, align 2, !dbg !806
  %19 = load i16, i16* %n, align 2, !dbg !807
  %mul = mul i16 %18, %19, !dbg !808
  %20 = load i16, i16* %m, align 2, !dbg !809
  %add11 = add i16 %20, %mul, !dbg !809
  store i16 %add11, i16* %m, align 2, !dbg !809
  br label %if.end, !dbg !810

if.else:                                          ; preds = %for.body4
  store i16 0, i16* %n, align 2, !dbg !811
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %21 = load i16, i16* %m, align 2, !dbg !813
  %shr = lshr i16 %21, 8, !dbg !814
  store i16 %shr, i16* %c, align 2, !dbg !815
  %22 = load i16, i16* %m, align 2, !dbg !816
  %and = and i16 %22, 255, !dbg !816
  store i16 %and, i16* %m, align 2, !dbg !816
  %23 = load i16, i16* %m, align 2, !dbg !817
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !818
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !818
  %product213 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 14, !dbg !818
  %25 = load i16, i16* %i, align 2, !dbg !819
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product213, i16 0, i16 %25, !dbg !818
  store i16 %23, i16* %arrayidx14, align 2, !dbg !820
  br label %for.inc15, !dbg !821

for.inc15:                                        ; preds = %if.end
  %26 = load i16, i16* %i, align 2, !dbg !822
  %inc16 = add nsw i16 %26, 1, !dbg !822
  store i16 %inc16, i16* %i, align 2, !dbg !822
  br label %for.cond2, !dbg !823, !llvm.loop !824

for.end17:                                        ; preds = %for.cond2
  ret void, !dbg !826
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_compare() #0 !dbg !827 {
entry:
  %i = alloca i16, align 2
  %relation = alloca i8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !828, metadata !DIExpression()), !dbg !829
  call void @llvm.dbg.declare(metadata i8* %relation, metadata !830, metadata !DIExpression()), !dbg !832
  store i8 61, i8* %relation, align 1, !dbg !832
  store i16 15, i16* %i, align 2, !dbg !833
  br label %for.cond, !dbg !835

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !836
  %cmp = icmp sge i16 %0, 0, !dbg !838
  br i1 %cmp, label %for.body, label %for.end, !dbg !839

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !840
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !840
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !840
  %2 = load i16, i16* %i, align 2, !dbg !843
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %2, !dbg !840
  %3 = load i16, i16* %arrayidx, align 2, !dbg !840
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !844
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !844
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !844
  %5 = load i16, i16* %i, align 2, !dbg !845
  %arrayidx2 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %5, !dbg !844
  %6 = load i16, i16* %arrayidx2, align 2, !dbg !844
  %cmp3 = icmp ugt i16 %3, %6, !dbg !846
  br i1 %cmp3, label %if.then, label %if.else, !dbg !847

if.then:                                          ; preds = %for.body
  store i8 62, i8* %relation, align 1, !dbg !848
  br label %for.end, !dbg !850

if.else:                                          ; preds = %for.body
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !851
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !851
  %product5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !851
  %8 = load i16, i16* %i, align 2, !dbg !853
  %arrayidx6 = getelementptr inbounds [16 x i16], [16 x i16]* %product5, i16 0, i16 %8, !dbg !851
  %9 = load i16, i16* %arrayidx6, align 2, !dbg !851
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !854
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !854
  %product28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !854
  %11 = load i16, i16* %i, align 2, !dbg !855
  %arrayidx9 = getelementptr inbounds [16 x i16], [16 x i16]* %product28, i16 0, i16 %11, !dbg !854
  %12 = load i16, i16* %arrayidx9, align 2, !dbg !854
  %cmp10 = icmp ult i16 %9, %12, !dbg !856
  br i1 %cmp10, label %if.then11, label %if.end, !dbg !857

if.then11:                                        ; preds = %if.else
  store i8 60, i8* %relation, align 1, !dbg !858
  br label %for.end, !dbg !860

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc, !dbg !861

for.inc:                                          ; preds = %if.end12
  %13 = load i16, i16* %i, align 2, !dbg !862
  %dec = add nsw i16 %13, -1, !dbg !862
  store i16 %dec, i16* %i, align 2, !dbg !862
  br label %for.cond, !dbg !863, !llvm.loop !864

for.end:                                          ; preds = %if.then11, %if.then, %for.cond
  %14 = load i8, i8* %relation, align 1, !dbg !866
  %conv = sext i8 %14 to i16, !dbg !866
  %cmp13 = icmp eq i16 %conv, 60, !dbg !868
  br i1 %cmp13, label %if.then15, label %if.end17, !dbg !869

if.then15:                                        ; preds = %for.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !870
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !870
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 17, !dbg !870
  store i16 0, i16* %check, align 2, !dbg !872
  br label %if.end17, !dbg !873

if.end17:                                         ; preds = %if.then15, %for.end
  ret void, !dbg !874
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_add() #0 !dbg !875 {
entry:
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  %m = alloca i16, align 2
  %n = alloca i16, align 2
  %c = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !876, metadata !DIExpression()), !dbg !877
  call void @llvm.dbg.declare(metadata i16* %j, metadata !878, metadata !DIExpression()), !dbg !879
  call void @llvm.dbg.declare(metadata i16* %m, metadata !880, metadata !DIExpression()), !dbg !881
  call void @llvm.dbg.declare(metadata i16* %n, metadata !882, metadata !DIExpression()), !dbg !883
  call void @llvm.dbg.declare(metadata i16* %c, metadata !884, metadata !DIExpression()), !dbg !885
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !886, metadata !DIExpression()), !dbg !887
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !888
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !888
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !888
  %1 = load i16, i16* %reduce, align 2, !dbg !888
  %add = add i16 %1, 1, !dbg !889
  %sub = sub i16 %add, 8, !dbg !890
  store i16 %sub, i16* %offset, align 2, !dbg !891
  store i16 0, i16* %c, align 2, !dbg !892
  %2 = load i16, i16* %offset, align 2, !dbg !893
  store i16 %2, i16* %i, align 2, !dbg !895
  br label %for.cond, !dbg !896

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i16, i16* %i, align 2, !dbg !897
  %cmp = icmp slt i16 %3, 16, !dbg !899
  br i1 %cmp, label %for.body, label %for.end, !dbg !900

for.body:                                         ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !901
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !901
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !901
  %5 = load i16, i16* %i, align 2, !dbg !903
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %5, !dbg !901
  %6 = load i16, i16* %arrayidx, align 2, !dbg !901
  store i16 %6, i16* %m, align 2, !dbg !904
  %7 = load i16, i16* %i, align 2, !dbg !905
  %8 = load i16, i16* %offset, align 2, !dbg !906
  %sub2 = sub i16 %7, %8, !dbg !907
  store i16 %sub2, i16* %j, align 2, !dbg !908
  %9 = load i16, i16* %i, align 2, !dbg !909
  %10 = load i16, i16* %offset, align 2, !dbg !911
  %add3 = add i16 %10, 8, !dbg !912
  %cmp4 = icmp ult i16 %9, %add3, !dbg !913
  br i1 %cmp4, label %if.then, label %if.else, !dbg !914

if.then:                                          ; preds = %for.body
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !915
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !915
  %modulus = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !915
  %12 = load i16, i16* %j, align 2, !dbg !917
  %arrayidx6 = getelementptr inbounds [8 x i16], [8 x i16]* %modulus, i16 0, i16 %12, !dbg !915
  %13 = load i16, i16* %arrayidx6, align 2, !dbg !915
  store i16 %13, i16* %n, align 2, !dbg !918
  br label %if.end, !dbg !919

if.else:                                          ; preds = %for.body
  store i16 0, i16* %n, align 2, !dbg !920
  store i16 0, i16* %j, align 2, !dbg !922
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = load i16, i16* %c, align 2, !dbg !923
  %15 = load i16, i16* %m, align 2, !dbg !924
  %add7 = add i16 %14, %15, !dbg !925
  %16 = load i16, i16* %n, align 2, !dbg !926
  %add8 = add i16 %add7, %16, !dbg !927
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !928
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !928
  %product10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !928
  %18 = load i16, i16* %i, align 2, !dbg !929
  %arrayidx11 = getelementptr inbounds [16 x i16], [16 x i16]* %product10, i16 0, i16 %18, !dbg !928
  store i16 %add8, i16* %arrayidx11, align 2, !dbg !930
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !931
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !931
  %product13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !931
  %20 = load i16, i16* %i, align 2, !dbg !932
  %arrayidx14 = getelementptr inbounds [16 x i16], [16 x i16]* %product13, i16 0, i16 %20, !dbg !931
  %21 = load i16, i16* %arrayidx14, align 2, !dbg !931
  %shr = lshr i16 %21, 8, !dbg !933
  store i16 %shr, i16* %c, align 2, !dbg !934
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !935
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !935
  %product16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !935
  %23 = load i16, i16* %i, align 2, !dbg !936
  %arrayidx17 = getelementptr inbounds [16 x i16], [16 x i16]* %product16, i16 0, i16 %23, !dbg !935
  %24 = load i16, i16* %arrayidx17, align 2, !dbg !937
  %and = and i16 %24, 255, !dbg !937
  store i16 %and, i16* %arrayidx17, align 2, !dbg !937
  br label %for.inc, !dbg !938

for.inc:                                          ; preds = %if.end
  %25 = load i16, i16* %i, align 2, !dbg !939
  %inc = add nsw i16 %25, 1, !dbg !939
  store i16 %inc, i16* %i, align 2, !dbg !939
  br label %for.cond, !dbg !940, !llvm.loop !941

for.end:                                          ; preds = %for.cond
  ret void, !dbg !943
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_reduce_subtract() #0 !dbg !944 {
entry:
  %i = alloca i16, align 2
  %m = alloca i16, align 2
  %s = alloca i16, align 2
  %qn = alloca i16, align 2
  %borrow = alloca i16, align 2
  %offset = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !945, metadata !DIExpression()), !dbg !946
  call void @llvm.dbg.declare(metadata i16* %m, metadata !947, metadata !DIExpression()), !dbg !948
  call void @llvm.dbg.declare(metadata i16* %s, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata i16* %qn, metadata !951, metadata !DIExpression()), !dbg !952
  call void @llvm.dbg.declare(metadata i16* %borrow, metadata !953, metadata !DIExpression()), !dbg !954
  call void @llvm.dbg.declare(metadata i16* %offset, metadata !955, metadata !DIExpression()), !dbg !956
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !957
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !957
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 10, !dbg !957
  %1 = load i16, i16* %reduce, align 2, !dbg !957
  %add = add i16 %1, 1, !dbg !958
  %sub = sub i16 %add, 8, !dbg !959
  store i16 %sub, i16* %offset, align 2, !dbg !960
  store i16 0, i16* %borrow, align 2, !dbg !961
  store i16 0, i16* %i, align 2, !dbg !962
  br label %for.cond, !dbg !964

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i16, i16* %i, align 2, !dbg !965
  %cmp = icmp slt i16 %2, 16, !dbg !967
  br i1 %cmp, label %for.body, label %for.end, !dbg !968

for.body:                                         ; preds = %for.cond
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !969
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !969
  %product = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !969
  %4 = load i16, i16* %i, align 2, !dbg !971
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* %product, i16 0, i16 %4, !dbg !969
  %5 = load i16, i16* %arrayidx, align 2, !dbg !969
  store i16 %5, i16* %m, align 2, !dbg !972
  %6 = load i16, i16* %i, align 2, !dbg !973
  %7 = load i16, i16* %offset, align 2, !dbg !975
  %cmp2 = icmp uge i16 %6, %7, !dbg !976
  br i1 %cmp2, label %if.then, label %if.end13, !dbg !977

if.then:                                          ; preds = %for.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !978
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !978
  %product2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !978
  %9 = load i16, i16* %i, align 2, !dbg !980
  %arrayidx4 = getelementptr inbounds [16 x i16], [16 x i16]* %product2, i16 0, i16 %9, !dbg !978
  %10 = load i16, i16* %arrayidx4, align 2, !dbg !978
  store i16 %10, i16* %qn, align 2, !dbg !981
  %11 = load i16, i16* %qn, align 2, !dbg !982
  %12 = load i16, i16* %borrow, align 2, !dbg !983
  %add5 = add i16 %11, %12, !dbg !984
  store i16 %add5, i16* %s, align 2, !dbg !985
  %13 = load i16, i16* %m, align 2, !dbg !986
  %14 = load i16, i16* %s, align 2, !dbg !988
  %cmp6 = icmp ult i16 %13, %14, !dbg !989
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !990

if.then7:                                         ; preds = %if.then
  %15 = load i16, i16* %m, align 2, !dbg !991
  %add8 = add i16 %15, 256, !dbg !991
  store i16 %add8, i16* %m, align 2, !dbg !991
  store i16 1, i16* %borrow, align 2, !dbg !993
  br label %if.end, !dbg !994

if.else:                                          ; preds = %if.then
  store i16 0, i16* %borrow, align 2, !dbg !995
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then7
  %16 = load i16, i16* %m, align 2, !dbg !997
  %17 = load i16, i16* %s, align 2, !dbg !998
  %sub9 = sub i16 %16, %17, !dbg !999
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1000
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !1000
  %product11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !1000
  %19 = load i16, i16* %i, align 2, !dbg !1001
  %arrayidx12 = getelementptr inbounds [16 x i16], [16 x i16]* %product11, i16 0, i16 %19, !dbg !1000
  store i16 %sub9, i16* %arrayidx12, align 2, !dbg !1002
  br label %if.end13, !dbg !1003

if.end13:                                         ; preds = %if.end, %for.body
  br label %for.inc, !dbg !1004

for.inc:                                          ; preds = %if.end13
  %20 = load i16, i16* %i, align 2, !dbg !1005
  %inc = add nsw i16 %20, 1, !dbg !1005
  store i16 %inc, i16* %i, align 2, !dbg !1005
  br label %for.cond, !dbg !1006, !llvm.loop !1007

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1009
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !1010 {
entry:
  ret void, !dbg !1011
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !1012 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1015
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1016
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1017
  call void @camel_init(), !dbg !1018
  br label %while.body, !dbg !1019

while.body:                                       ; preds = %entry, %while.end
  call void @task_init(), !dbg !1020
  br label %while.body2, !dbg !1022

while.body2:                                      ; preds = %while.body, %if.end54
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1023
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !1023
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 17, !dbg !1023
  %1 = load i16, i16* %check, align 2, !dbg !1023
  %cmp = icmp eq i16 %1, 0, !dbg !1026
  br i1 %cmp, label %if.then, label %if.end, !dbg !1027

if.then:                                          ; preds = %while.body2
  call void @task_pad(), !dbg !1028
  br label %if.end, !dbg !1030

if.end:                                           ; preds = %if.then, %while.body2
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1031
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !1031
  %check4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 17, !dbg !1031
  %3 = load i16, i16* %check4, align 2, !dbg !1031
  %cmp5 = icmp eq i16 %3, 2, !dbg !1033
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !1034

if.then6:                                         ; preds = %if.end
  call void @task_exp(), !dbg !1035
  br label %if.end7, !dbg !1037

if.end7:                                          ; preds = %if.then6, %if.end
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1038
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !1038
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 17, !dbg !1038
  %5 = load i16, i16* %check9, align 2, !dbg !1038
  %cmp10 = icmp eq i16 %5, 0, !dbg !1040
  br i1 %cmp10, label %if.then11, label %if.else, !dbg !1041

if.then11:                                        ; preds = %if.end7
  call void @task_mult_block(), !dbg !1042
  br label %if.end17, !dbg !1044

if.else:                                          ; preds = %if.end7
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1045
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !1045
  %check13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 17, !dbg !1045
  %7 = load i16, i16* %check13, align 2, !dbg !1045
  %cmp14 = icmp eq i16 %7, 1, !dbg !1047
  br i1 %cmp14, label %if.then15, label %if.end16, !dbg !1048

if.then15:                                        ; preds = %if.else
  call void @task_square_base(), !dbg !1049
  br label %if.end16, !dbg !1051

if.end16:                                         ; preds = %if.then15, %if.else
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then11
  call void @task_mult_mod(), !dbg !1052
  br label %do.body, !dbg !1053

do.body:                                          ; preds = %do.cond, %if.end17
  call void @task_mult(), !dbg !1054
  br label %do.cond, !dbg !1056

do.cond:                                          ; preds = %do.body
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1057
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !1057
  %digit = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !1057
  %9 = load i16, i16* %digit, align 2, !dbg !1057
  %cmp19 = icmp ult i16 %9, 16, !dbg !1058
  br i1 %cmp19, label %do.body, label %do.end, !dbg !1056, !llvm.loop !1059

do.end:                                           ; preds = %do.cond
  call void @task_reduce_digits(), !dbg !1061
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1062
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !1062
  %check21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 17, !dbg !1062
  %11 = load i16, i16* %check21, align 2, !dbg !1062
  %cmp22 = icmp eq i16 %11, 0, !dbg !1064
  br i1 %cmp22, label %if.then23, label %if.end24, !dbg !1065

if.then23:                                        ; preds = %do.end
  br label %while.end, !dbg !1066

if.end24:                                         ; preds = %do.end
  call void @task_reduce_normalizable(), !dbg !1067
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1068
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !1068
  %check26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 17, !dbg !1068
  %13 = load i16, i16* %check26, align 2, !dbg !1068
  %cmp27 = icmp eq i16 %13, 1, !dbg !1070
  br i1 %cmp27, label %if.then28, label %if.end29, !dbg !1071

if.then28:                                        ; preds = %if.end24
  call void @task_reduce_normalize(), !dbg !1072
  br label %if.end29, !dbg !1074

if.end29:                                         ; preds = %if.then28, %if.end24
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1075
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !1075
  %check31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 17, !dbg !1075
  %15 = load i16, i16* %check31, align 2, !dbg !1075
  %cmp32 = icmp eq i16 %15, 2, !dbg !1077
  br i1 %cmp32, label %if.then33, label %if.end44, !dbg !1078

if.then33:                                        ; preds = %if.end29
  call void @task_reduce_n_divisor(), !dbg !1079
  br label %do.body34, !dbg !1081

do.body34:                                        ; preds = %do.cond40, %if.then33
  call void @task_reduce_quotient(), !dbg !1082
  call void @task_reduce_multiply(), !dbg !1084
  call void @task_reduce_compare(), !dbg !1085
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1086
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !1086
  %check36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 17, !dbg !1086
  %17 = load i16, i16* %check36, align 2, !dbg !1086
  %cmp37 = icmp eq i16 %17, 0, !dbg !1088
  br i1 %cmp37, label %if.then38, label %if.end39, !dbg !1089

if.then38:                                        ; preds = %do.body34
  call void @task_reduce_compare(), !dbg !1090
  br label %if.end39, !dbg !1092

if.end39:                                         ; preds = %if.then38, %do.body34
  call void @task_reduce_subtract(), !dbg !1093
  br label %do.cond40, !dbg !1094

do.cond40:                                        ; preds = %if.end39
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1095
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !1095
  %reduce = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 10, !dbg !1095
  %19 = load i16, i16* %reduce, align 2, !dbg !1095
  %add = add i16 %19, 1, !dbg !1096
  %cmp42 = icmp ugt i16 %add, 8, !dbg !1097
  br i1 %cmp42, label %do.body34, label %do.end43, !dbg !1094, !llvm.loop !1098

do.end43:                                         ; preds = %do.cond40
  br label %if.end44, !dbg !1100

if.end44:                                         ; preds = %do.end43, %if.end29
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1101
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !1101
  %check_final = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals45, i32 0, i32 18, !dbg !1101
  %21 = load i16, i16* %check_final, align 2, !dbg !1101
  %cmp46 = icmp eq i16 %21, 0, !dbg !1103
  br i1 %cmp46, label %if.then47, label %if.else48, !dbg !1104

if.then47:                                        ; preds = %if.end44
  call void @task_mult_block_get_result(), !dbg !1105
  br label %if.end54, !dbg !1107

if.else48:                                        ; preds = %if.end44
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1108
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !1108
  %check_final50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 18, !dbg !1108
  %23 = load i16, i16* %check_final50, align 2, !dbg !1108
  %cmp51 = icmp eq i16 %23, 1, !dbg !1110
  br i1 %cmp51, label %if.then52, label %if.end53, !dbg !1111

if.then52:                                        ; preds = %if.else48
  call void @task_square_base_get_result(), !dbg !1112
  br label %if.end53, !dbg !1114

if.end53:                                         ; preds = %if.then52, %if.else48
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %if.then47
  br label %while.body2, !dbg !1022, !llvm.loop !1115

while.end:                                        ; preds = %if.then23
  br label %while.body, !dbg !1019, !llvm.loop !1117
}

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
!130 = !DILocation(line: 209, column: 3, scope: !131)
!131 = distinct !DILexicalBlock(scope: !111, file: !3, line: 209, column: 3)
!132 = !{i32 -2146650955}
!133 = !DILocalVariable(name: "__x", scope: !134, file: !3, line: 211, type: !6)
!134 = distinct !DILexicalBlock(scope: !111, file: !3, line: 211, column: 33)
!135 = !DILocation(line: 211, column: 33, scope: !134)
!136 = !{i32 -2146650719}
!137 = !DILocation(line: 211, column: 51, scope: !111)
!138 = !DILocation(line: 211, column: 33, scope: !111)
!139 = !DILocalVariable(name: "__x", scope: !140, file: !3, line: 211, type: !6)
!140 = distinct !DILexicalBlock(scope: !111, file: !3, line: 211, column: 65)
!141 = !DILocation(line: 211, column: 65, scope: !140)
!142 = !{i32 -2146650594}
!143 = !DILocation(line: 211, column: 83, scope: !111)
!144 = !DILocation(line: 211, column: 63, scope: !111)
!145 = !DILocation(line: 211, column: 19, scope: !111)
!146 = !DILocation(line: 211, column: 17, scope: !111)
!147 = !DILocation(line: 212, column: 37, scope: !111)
!148 = !DILocation(line: 212, column: 71, scope: !111)
!149 = !DILocation(line: 212, column: 23, scope: !111)
!150 = !DILocation(line: 212, column: 21, scope: !111)
!151 = !DILocation(line: 215, column: 6, scope: !152)
!152 = distinct !DILexicalBlock(scope: !111, file: !3, line: 215, column: 6)
!153 = !DILocation(line: 215, column: 27, scope: !152)
!154 = !DILocation(line: 215, column: 33, scope: !152)
!155 = !DILocation(line: 215, column: 24, scope: !152)
!156 = !DILocation(line: 215, column: 6, scope: !111)
!157 = !DILocation(line: 216, column: 11, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !3, line: 215, column: 51)
!159 = !DILocation(line: 216, column: 4, scope: !158)
!160 = !DILocation(line: 216, column: 19, scope: !158)
!161 = !DILocation(line: 217, column: 4, scope: !158)
!162 = !DILocation(line: 218, column: 24, scope: !158)
!163 = !DILocation(line: 218, column: 30, scope: !158)
!164 = !DILocation(line: 218, column: 4, scope: !158)
!165 = !DILocation(line: 219, column: 3, scope: !158)
!166 = !DILocation(line: 220, column: 4, scope: !167)
!167 = distinct !DILexicalBlock(scope: !152, file: !3, line: 219, column: 9)
!168 = !DILocation(line: 223, column: 1, scope: !111)
!169 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 227, type: !16, scopeLine: 227, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocation(line: 229, column: 2, scope: !169)
!171 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 233, type: !16, scopeLine: 234, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!172 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 235, type: !173)
!173 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!174 = !DILocation(line: 235, column: 6, scope: !171)
!175 = !DILocalVariable(name: "message_length", scope: !171, file: !3, line: 236, type: !6)
!176 = !DILocation(line: 236, column: 11, scope: !171)
!177 = !DILocation(line: 239, column: 9, scope: !178)
!178 = distinct !DILexicalBlock(scope: !171, file: !3, line: 239, column: 2)
!179 = !DILocation(line: 239, column: 7, scope: !178)
!180 = !DILocation(line: 239, column: 14, scope: !181)
!181 = distinct !DILexicalBlock(scope: !178, file: !3, line: 239, column: 2)
!182 = !DILocation(line: 239, column: 16, scope: !181)
!183 = !DILocation(line: 239, column: 2, scope: !178)
!184 = !DILocation(line: 240, column: 29, scope: !185)
!185 = distinct !DILexicalBlock(scope: !181, file: !3, line: 239, column: 35)
!186 = !DILocation(line: 240, column: 20, scope: !185)
!187 = !DILocation(line: 240, column: 3, scope: !185)
!188 = !DILocation(line: 240, column: 15, scope: !185)
!189 = !DILocation(line: 240, column: 18, scope: !185)
!190 = !DILocation(line: 241, column: 2, scope: !185)
!191 = !DILocation(line: 239, column: 30, scope: !181)
!192 = !DILocation(line: 239, column: 2, scope: !181)
!193 = distinct !{!193, !183, !194}
!194 = !DILocation(line: 241, column: 2, scope: !178)
!195 = !DILocation(line: 244, column: 23, scope: !171)
!196 = !DILocation(line: 244, column: 2, scope: !171)
!197 = !DILocation(line: 244, column: 21, scope: !171)
!198 = !DILocation(line: 245, column: 2, scope: !171)
!199 = !DILocation(line: 245, column: 19, scope: !171)
!200 = !DILocation(line: 246, column: 2, scope: !171)
!201 = !DILocation(line: 246, column: 21, scope: !171)
!202 = !DILocation(line: 249, column: 2, scope: !171)
!203 = !DILocation(line: 249, column: 12, scope: !171)
!204 = !DILocation(line: 250, column: 2, scope: !171)
!205 = !DILocation(line: 250, column: 18, scope: !171)
!206 = !DILocation(line: 251, column: 1, scope: !171)
!207 = distinct !DISubprogram(name: "task_pad", scope: !3, file: !3, line: 253, type: !16, scopeLine: 254, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DILocalVariable(name: "i", scope: !207, file: !3, line: 255, type: !173)
!209 = !DILocation(line: 255, column: 6, scope: !207)
!210 = !DILocation(line: 257, column: 6, scope: !211)
!211 = distinct !DILexicalBlock(scope: !207, file: !3, line: 257, column: 6)
!212 = !DILocation(line: 257, column: 26, scope: !211)
!213 = !DILocation(line: 257, column: 23, scope: !211)
!214 = !DILocation(line: 257, column: 6, scope: !207)
!215 = !DILocation(line: 258, column: 3, scope: !216)
!216 = distinct !DILexicalBlock(scope: !211, file: !3, line: 257, column: 46)
!217 = !DILocation(line: 259, column: 2, scope: !216)
!218 = !DILocalVariable(name: "zero", scope: !207, file: !3, line: 261, type: !42)
!219 = !DILocation(line: 261, column: 10, scope: !207)
!220 = !DILocation(line: 262, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !207, file: !3, line: 262, column: 2)
!222 = !DILocation(line: 262, column: 7, scope: !221)
!223 = !DILocation(line: 262, column: 14, scope: !224)
!224 = distinct !DILexicalBlock(scope: !221, file: !3, line: 262, column: 2)
!225 = !DILocation(line: 262, column: 16, scope: !224)
!226 = !DILocation(line: 262, column: 2, scope: !221)
!227 = !DILocation(line: 263, column: 18, scope: !228)
!228 = distinct !DILexicalBlock(scope: !224, file: !3, line: 262, column: 52)
!229 = !DILocation(line: 263, column: 37, scope: !228)
!230 = !DILocation(line: 263, column: 35, scope: !228)
!231 = !DILocation(line: 263, column: 41, scope: !228)
!232 = !DILocation(line: 263, column: 39, scope: !228)
!233 = !DILocation(line: 263, column: 17, scope: !228)
!234 = !DILocation(line: 263, column: 73, scope: !228)
!235 = !DILocation(line: 263, column: 92, scope: !228)
!236 = !DILocation(line: 263, column: 90, scope: !228)
!237 = !DILocation(line: 263, column: 63, scope: !228)
!238 = !DILocation(line: 263, column: 3, scope: !228)
!239 = !DILocation(line: 263, column: 12, scope: !228)
!240 = !DILocation(line: 263, column: 15, scope: !228)
!241 = !DILocation(line: 264, column: 2, scope: !228)
!242 = !DILocation(line: 262, column: 47, scope: !224)
!243 = !DILocation(line: 262, column: 2, scope: !224)
!244 = distinct !{!244, !226, !245}
!245 = !DILocation(line: 264, column: 2, scope: !221)
!246 = !DILocation(line: 265, column: 9, scope: !247)
!247 = distinct !DILexicalBlock(scope: !207, file: !3, line: 265, column: 2)
!248 = !DILocation(line: 265, column: 7, scope: !247)
!249 = !DILocation(line: 265, column: 40, scope: !250)
!250 = distinct !DILexicalBlock(scope: !247, file: !3, line: 265, column: 2)
!251 = !DILocation(line: 265, column: 42, scope: !250)
!252 = !DILocation(line: 265, column: 2, scope: !247)
!253 = !DILocation(line: 266, column: 3, scope: !254)
!254 = distinct !DILexicalBlock(scope: !250, file: !3, line: 265, column: 61)
!255 = !DILocation(line: 266, column: 12, scope: !254)
!256 = !DILocation(line: 266, column: 15, scope: !254)
!257 = !DILocation(line: 267, column: 2, scope: !254)
!258 = !DILocation(line: 265, column: 56, scope: !250)
!259 = !DILocation(line: 265, column: 2, scope: !250)
!260 = distinct !{!260, !252, !261}
!261 = !DILocation(line: 267, column: 2, scope: !247)
!262 = !DILocation(line: 268, column: 2, scope: !207)
!263 = !DILocation(line: 268, column: 12, scope: !207)
!264 = !DILocation(line: 268, column: 18, scope: !207)
!265 = !DILocation(line: 269, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !207, file: !3, line: 269, column: 2)
!267 = !DILocation(line: 269, column: 7, scope: !266)
!268 = !DILocation(line: 269, column: 14, scope: !269)
!269 = distinct !DILexicalBlock(scope: !266, file: !3, line: 269, column: 2)
!270 = !DILocation(line: 269, column: 16, scope: !269)
!271 = !DILocation(line: 269, column: 2, scope: !266)
!272 = !DILocation(line: 270, column: 3, scope: !269)
!273 = !DILocation(line: 270, column: 13, scope: !269)
!274 = !DILocation(line: 270, column: 16, scope: !269)
!275 = !DILocation(line: 269, column: 30, scope: !269)
!276 = !DILocation(line: 269, column: 2, scope: !269)
!277 = distinct !{!277, !271, !278}
!278 = !DILocation(line: 270, column: 18, scope: !266)
!279 = !DILocation(line: 272, column: 24, scope: !207)
!280 = !DILocation(line: 272, column: 2, scope: !207)
!281 = !DILocation(line: 272, column: 15, scope: !207)
!282 = !DILocation(line: 274, column: 2, scope: !207)
!283 = !DILocation(line: 274, column: 19, scope: !207)
!284 = !DILocation(line: 276, column: 2, scope: !207)
!285 = !DILocation(line: 276, column: 12, scope: !207)
!286 = !DILocation(line: 277, column: 1, scope: !207)
!287 = distinct !DISubprogram(name: "task_exp", scope: !3, file: !3, line: 279, type: !16, scopeLine: 280, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!288 = !DILocation(line: 282, column: 6, scope: !289)
!289 = distinct !DILexicalBlock(scope: !287, file: !3, line: 282, column: 6)
!290 = !DILocation(line: 282, column: 19, scope: !289)
!291 = !DILocation(line: 282, column: 6, scope: !287)
!292 = !DILocation(line: 283, column: 3, scope: !293)
!293 = distinct !DILexicalBlock(scope: !289, file: !3, line: 282, column: 26)
!294 = !DILocation(line: 283, column: 16, scope: !293)
!295 = !DILocation(line: 284, column: 9, scope: !293)
!296 = !DILocation(line: 284, column: 19, scope: !293)
!297 = !DILocation(line: 285, column: 2, scope: !293)
!298 = !DILocation(line: 286, column: 3, scope: !299)
!299 = distinct !DILexicalBlock(scope: !289, file: !3, line: 285, column: 9)
!300 = !DILocation(line: 286, column: 16, scope: !299)
!301 = !DILocation(line: 287, column: 9, scope: !299)
!302 = !DILocation(line: 287, column: 19, scope: !299)
!303 = !DILocation(line: 289, column: 1, scope: !287)
!304 = distinct !DISubprogram(name: "task_mult_block", scope: !3, file: !3, line: 291, type: !16, scopeLine: 292, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!305 = !DILocation(line: 294, column: 5, scope: !304)
!306 = !DILocation(line: 294, column: 21, scope: !304)
!307 = !DILocation(line: 296, column: 1, scope: !304)
!308 = distinct !DISubprogram(name: "task_mult_block_get_result", scope: !3, file: !3, line: 298, type: !16, scopeLine: 299, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!309 = !DILocalVariable(name: "i", scope: !308, file: !3, line: 300, type: !173)
!310 = !DILocation(line: 300, column: 6, scope: !308)
!311 = !DILocation(line: 302, column: 9, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 302, column: 2)
!313 = !DILocation(line: 302, column: 7, scope: !312)
!314 = !DILocation(line: 302, column: 27, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !3, line: 302, column: 2)
!316 = !DILocation(line: 302, column: 29, scope: !315)
!317 = !DILocation(line: 302, column: 2, scope: !312)
!318 = !DILocation(line: 303, column: 18, scope: !319)
!319 = distinct !DILexicalBlock(scope: !315, file: !3, line: 302, column: 40)
!320 = !DILocation(line: 303, column: 30, scope: !319)
!321 = !DILocation(line: 303, column: 3, scope: !319)
!322 = !DILocation(line: 303, column: 13, scope: !319)
!323 = !DILocation(line: 303, column: 16, scope: !319)
!324 = !DILocation(line: 304, column: 2, scope: !319)
!325 = !DILocation(line: 302, column: 35, scope: !315)
!326 = !DILocation(line: 302, column: 2, scope: !315)
!327 = distinct !{!327, !317, !328}
!328 = !DILocation(line: 304, column: 2, scope: !312)
!329 = !DILocation(line: 306, column: 6, scope: !330)
!330 = distinct !DILexicalBlock(scope: !308, file: !3, line: 306, column: 6)
!331 = !DILocation(line: 306, column: 19, scope: !330)
!332 = !DILocation(line: 306, column: 6, scope: !308)
!333 = !DILocation(line: 308, column: 3, scope: !334)
!334 = distinct !DILexicalBlock(scope: !330, file: !3, line: 306, column: 24)
!335 = !DILocation(line: 308, column: 13, scope: !334)
!336 = !DILocation(line: 310, column: 2, scope: !334)
!337 = !DILocation(line: 312, column: 7, scope: !338)
!338 = distinct !DILexicalBlock(scope: !339, file: !3, line: 312, column: 7)
!339 = distinct !DILexicalBlock(scope: !330, file: !3, line: 310, column: 9)
!340 = !DILocation(line: 312, column: 26, scope: !338)
!341 = !DILocation(line: 312, column: 39, scope: !338)
!342 = !DILocation(line: 312, column: 7, scope: !339)
!343 = !DILocation(line: 314, column: 11, scope: !344)
!344 = distinct !DILexicalBlock(scope: !345, file: !3, line: 314, column: 4)
!345 = distinct !DILexicalBlock(scope: !338, file: !3, line: 312, column: 59)
!346 = !DILocation(line: 314, column: 9, scope: !344)
!347 = !DILocation(line: 314, column: 16, scope: !348)
!348 = distinct !DILexicalBlock(scope: !344, file: !3, line: 314, column: 4)
!349 = !DILocation(line: 314, column: 18, scope: !348)
!350 = !DILocation(line: 314, column: 4, scope: !344)
!351 = !DILocalVariable(name: "op", scope: !352, file: !3, line: 316, type: !6)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 314, column: 37)
!353 = !DILocation(line: 316, column: 14, scope: !352)
!354 = !DILocation(line: 316, column: 19, scope: !352)
!355 = !DILocation(line: 317, column: 26, scope: !352)
!356 = !DILocation(line: 317, column: 38, scope: !352)
!357 = !DILocation(line: 317, column: 5, scope: !352)
!358 = !DILocation(line: 317, column: 20, scope: !352)
!359 = !DILocation(line: 317, column: 24, scope: !352)
!360 = !DILocation(line: 318, column: 7, scope: !352)
!361 = !DILocation(line: 318, column: 5, scope: !352)
!362 = !DILocation(line: 319, column: 4, scope: !352)
!363 = !DILocation(line: 314, column: 32, scope: !348)
!364 = !DILocation(line: 314, column: 4, scope: !348)
!365 = distinct !{!365, !350, !366}
!366 = !DILocation(line: 319, column: 4, scope: !344)
!367 = !DILocation(line: 321, column: 3, scope: !345)
!368 = !DILocation(line: 323, column: 3, scope: !339)
!369 = !DILocation(line: 323, column: 13, scope: !339)
!370 = !DILocation(line: 326, column: 1, scope: !308)
!371 = distinct !DISubprogram(name: "task_square_base", scope: !3, file: !3, line: 328, type: !16, scopeLine: 329, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!372 = !DILocation(line: 330, column: 2, scope: !371)
!373 = !DILocation(line: 330, column: 18, scope: !371)
!374 = !DILocation(line: 332, column: 1, scope: !371)
!375 = distinct !DISubprogram(name: "task_square_base_get_result", scope: !3, file: !3, line: 334, type: !16, scopeLine: 335, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!376 = !DILocalVariable(name: "i", scope: !375, file: !3, line: 336, type: !173)
!377 = !DILocation(line: 336, column: 6, scope: !375)
!378 = !DILocation(line: 338, column: 9, scope: !379)
!379 = distinct !DILexicalBlock(scope: !375, file: !3, line: 338, column: 2)
!380 = !DILocation(line: 338, column: 7, scope: !379)
!381 = !DILocation(line: 338, column: 14, scope: !382)
!382 = distinct !DILexicalBlock(scope: !379, file: !3, line: 338, column: 2)
!383 = !DILocation(line: 338, column: 16, scope: !382)
!384 = !DILocation(line: 338, column: 2, scope: !379)
!385 = !DILocation(line: 339, column: 17, scope: !386)
!386 = distinct !DILexicalBlock(scope: !382, file: !3, line: 338, column: 35)
!387 = !DILocation(line: 339, column: 29, scope: !386)
!388 = !DILocation(line: 339, column: 3, scope: !386)
!389 = !DILocation(line: 339, column: 12, scope: !386)
!390 = !DILocation(line: 339, column: 15, scope: !386)
!391 = !DILocation(line: 340, column: 2, scope: !386)
!392 = !DILocation(line: 338, column: 30, scope: !382)
!393 = !DILocation(line: 338, column: 2, scope: !382)
!394 = distinct !{!394, !384, !395}
!395 = !DILocation(line: 340, column: 2, scope: !379)
!396 = !DILocation(line: 342, column: 2, scope: !375)
!397 = !DILocation(line: 342, column: 12, scope: !375)
!398 = !DILocation(line: 343, column: 1, scope: !375)
!399 = distinct !DISubprogram(name: "task_mult_mod", scope: !3, file: !3, line: 345, type: !16, scopeLine: 346, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!400 = !DILocation(line: 347, column: 2, scope: !399)
!401 = !DILocation(line: 347, column: 12, scope: !399)
!402 = !DILocation(line: 348, column: 2, scope: !399)
!403 = !DILocation(line: 348, column: 12, scope: !399)
!404 = !DILocation(line: 350, column: 1, scope: !399)
!405 = distinct !DISubprogram(name: "task_mult", scope: !3, file: !3, line: 352, type: !16, scopeLine: 353, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!406 = !DILocalVariable(name: "i", scope: !405, file: !3, line: 354, type: !173)
!407 = !DILocation(line: 354, column: 6, scope: !405)
!408 = !DILocalVariable(name: "a", scope: !405, file: !3, line: 355, type: !42)
!409 = !DILocation(line: 355, column: 10, scope: !405)
!410 = !DILocalVariable(name: "b", scope: !405, file: !3, line: 355, type: !42)
!411 = !DILocation(line: 355, column: 13, scope: !405)
!412 = !DILocalVariable(name: "c", scope: !405, file: !3, line: 355, type: !42)
!413 = !DILocation(line: 355, column: 16, scope: !405)
!414 = !DILocalVariable(name: "dp", scope: !405, file: !3, line: 356, type: !42)
!415 = !DILocation(line: 356, column: 10, scope: !405)
!416 = !DILocalVariable(name: "p", scope: !405, file: !3, line: 356, type: !42)
!417 = !DILocation(line: 356, column: 14, scope: !405)
!418 = !DILocation(line: 358, column: 6, scope: !405)
!419 = !DILocation(line: 358, column: 4, scope: !405)
!420 = !DILocation(line: 359, column: 4, scope: !405)
!421 = !DILocation(line: 360, column: 9, scope: !422)
!422 = distinct !DILexicalBlock(scope: !405, file: !3, line: 360, column: 2)
!423 = !DILocation(line: 360, column: 7, scope: !422)
!424 = !DILocation(line: 360, column: 14, scope: !425)
!425 = distinct !DILexicalBlock(scope: !422, file: !3, line: 360, column: 2)
!426 = !DILocation(line: 360, column: 16, scope: !425)
!427 = !DILocation(line: 360, column: 2, scope: !422)
!428 = !DILocation(line: 361, column: 7, scope: !429)
!429 = distinct !DILexicalBlock(scope: !430, file: !3, line: 361, column: 7)
!430 = distinct !DILexicalBlock(scope: !425, file: !3, line: 360, column: 35)
!431 = !DILocation(line: 361, column: 19, scope: !429)
!432 = !DILocation(line: 361, column: 17, scope: !429)
!433 = !DILocation(line: 361, column: 21, scope: !429)
!434 = !DILocation(line: 361, column: 26, scope: !429)
!435 = !DILocation(line: 361, column: 29, scope: !429)
!436 = !DILocation(line: 361, column: 41, scope: !429)
!437 = !DILocation(line: 361, column: 39, scope: !429)
!438 = !DILocation(line: 361, column: 43, scope: !429)
!439 = !DILocation(line: 361, column: 7, scope: !430)
!440 = !DILocalVariable(name: "op", scope: !441, file: !3, line: 363, type: !6)
!441 = distinct !DILexicalBlock(scope: !429, file: !3, line: 361, column: 57)
!442 = !DILocation(line: 363, column: 13, scope: !441)
!443 = !DILocation(line: 363, column: 18, scope: !441)
!444 = !DILocation(line: 363, column: 30, scope: !441)
!445 = !DILocation(line: 363, column: 28, scope: !441)
!446 = !DILocation(line: 365, column: 8, scope: !441)
!447 = !DILocation(line: 365, column: 17, scope: !441)
!448 = !DILocation(line: 365, column: 6, scope: !441)
!449 = !DILocation(line: 366, column: 8, scope: !441)
!450 = !DILocation(line: 366, column: 18, scope: !441)
!451 = !DILocation(line: 366, column: 6, scope: !441)
!452 = !DILocation(line: 367, column: 9, scope: !441)
!453 = !DILocation(line: 367, column: 13, scope: !441)
!454 = !DILocation(line: 367, column: 11, scope: !441)
!455 = !DILocation(line: 367, column: 7, scope: !441)
!456 = !DILocation(line: 369, column: 9, scope: !441)
!457 = !DILocation(line: 369, column: 12, scope: !441)
!458 = !DILocation(line: 369, column: 6, scope: !441)
!459 = !DILocation(line: 370, column: 9, scope: !441)
!460 = !DILocation(line: 370, column: 12, scope: !441)
!461 = !DILocation(line: 370, column: 6, scope: !441)
!462 = !DILocation(line: 372, column: 3, scope: !441)
!463 = !DILocation(line: 373, column: 2, scope: !430)
!464 = !DILocation(line: 360, column: 30, scope: !425)
!465 = !DILocation(line: 360, column: 2, scope: !425)
!466 = distinct !{!466, !427, !467}
!467 = !DILocation(line: 373, column: 2, scope: !422)
!468 = !DILocation(line: 375, column: 7, scope: !405)
!469 = !DILocation(line: 375, column: 9, scope: !405)
!470 = !DILocation(line: 375, column: 4, scope: !405)
!471 = !DILocation(line: 376, column: 4, scope: !405)
!472 = !DILocation(line: 378, column: 27, scope: !405)
!473 = !DILocation(line: 378, column: 2, scope: !405)
!474 = !DILocation(line: 378, column: 14, scope: !405)
!475 = !DILocation(line: 378, column: 25, scope: !405)
!476 = !DILocation(line: 379, column: 2, scope: !405)
!477 = !DILocation(line: 379, column: 11, scope: !405)
!478 = !DILocation(line: 381, column: 6, scope: !479)
!479 = distinct !DILexicalBlock(scope: !405, file: !3, line: 381, column: 6)
!480 = !DILocation(line: 381, column: 16, scope: !479)
!481 = !DILocation(line: 381, column: 6, scope: !405)
!482 = !DILocation(line: 382, column: 15, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !3, line: 381, column: 34)
!484 = !DILocation(line: 382, column: 3, scope: !483)
!485 = !DILocation(line: 382, column: 13, scope: !483)
!486 = !DILocation(line: 383, column: 2, scope: !483)
!487 = !DILocation(line: 384, column: 1, scope: !405)
!488 = distinct !DISubprogram(name: "task_reduce_digits", scope: !3, file: !3, line: 386, type: !16, scopeLine: 387, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!489 = !DILocalVariable(name: "d", scope: !488, file: !3, line: 388, type: !173)
!490 = !DILocation(line: 388, column: 6, scope: !488)
!491 = !DILocation(line: 390, column: 4, scope: !488)
!492 = !DILocation(line: 391, column: 2, scope: !488)
!493 = !DILocation(line: 392, column: 4, scope: !494)
!494 = distinct !DILexicalBlock(scope: !488, file: !3, line: 391, column: 5)
!495 = !DILocation(line: 393, column: 2, scope: !494)
!496 = !DILocation(line: 393, column: 11, scope: !488)
!497 = !DILocation(line: 393, column: 23, scope: !488)
!498 = !DILocation(line: 393, column: 26, scope: !488)
!499 = !DILocation(line: 393, column: 31, scope: !488)
!500 = !DILocation(line: 393, column: 34, scope: !488)
!501 = !DILocation(line: 393, column: 36, scope: !488)
!502 = !DILocation(line: 0, scope: !488)
!503 = distinct !{!503, !492, !504}
!504 = !DILocation(line: 393, column: 39, scope: !488)
!505 = !DILocation(line: 395, column: 6, scope: !506)
!506 = distinct !DILexicalBlock(scope: !488, file: !3, line: 395, column: 6)
!507 = !DILocation(line: 395, column: 18, scope: !506)
!508 = !DILocation(line: 395, column: 21, scope: !506)
!509 = !DILocation(line: 395, column: 6, scope: !488)
!510 = !DILocation(line: 396, column: 3, scope: !511)
!511 = distinct !DILexicalBlock(scope: !506, file: !3, line: 395, column: 27)
!512 = !DILocation(line: 396, column: 13, scope: !511)
!513 = !DILocation(line: 397, column: 2, scope: !511)
!514 = !DILocation(line: 399, column: 15, scope: !488)
!515 = !DILocation(line: 399, column: 2, scope: !488)
!516 = !DILocation(line: 399, column: 13, scope: !488)
!517 = !DILocation(line: 401, column: 2, scope: !488)
!518 = !DILocation(line: 401, column: 12, scope: !488)
!519 = !DILocation(line: 402, column: 1, scope: !488)
!520 = distinct !DISubprogram(name: "task_reduce_normalizable", scope: !3, file: !3, line: 404, type: !16, scopeLine: 405, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!521 = !DILocalVariable(name: "i", scope: !520, file: !3, line: 406, type: !173)
!522 = !DILocation(line: 406, column: 6, scope: !520)
!523 = !DILocalVariable(name: "normalizable", scope: !520, file: !3, line: 407, type: !524)
!524 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!525 = !DILocation(line: 407, column: 7, scope: !520)
!526 = !DILocation(line: 409, column: 15, scope: !520)
!527 = !DILocation(line: 409, column: 26, scope: !520)
!528 = !DILocation(line: 409, column: 30, scope: !520)
!529 = !DILocation(line: 409, column: 2, scope: !520)
!530 = !DILocation(line: 409, column: 13, scope: !520)
!531 = !DILocation(line: 411, column: 11, scope: !532)
!532 = distinct !DILexicalBlock(scope: !520, file: !3, line: 411, column: 2)
!533 = !DILocation(line: 411, column: 9, scope: !532)
!534 = !DILocation(line: 411, column: 7, scope: !532)
!535 = !DILocation(line: 411, column: 23, scope: !536)
!536 = distinct !DILexicalBlock(scope: !532, file: !3, line: 411, column: 2)
!537 = !DILocation(line: 411, column: 25, scope: !536)
!538 = !DILocation(line: 411, column: 2, scope: !532)
!539 = !DILocalVariable(name: "op", scope: !540, file: !3, line: 413, type: !6)
!540 = distinct !DILexicalBlock(scope: !536, file: !3, line: 411, column: 36)
!541 = !DILocation(line: 413, column: 12, scope: !540)
!542 = !DILocation(line: 413, column: 17, scope: !540)
!543 = !DILocation(line: 413, column: 19, scope: !540)
!544 = !DILocation(line: 413, column: 18, scope: !540)
!545 = !DILocation(line: 415, column: 7, scope: !546)
!546 = distinct !DILexicalBlock(scope: !540, file: !3, line: 415, column: 7)
!547 = !DILocation(line: 415, column: 19, scope: !546)
!548 = !DILocation(line: 415, column: 24, scope: !546)
!549 = !DILocation(line: 415, column: 36, scope: !546)
!550 = !DILocation(line: 415, column: 22, scope: !546)
!551 = !DILocation(line: 415, column: 7, scope: !540)
!552 = !DILocation(line: 416, column: 4, scope: !553)
!553 = distinct !DILexicalBlock(scope: !546, file: !3, line: 415, column: 41)
!554 = !DILocation(line: 417, column: 14, scope: !555)
!555 = distinct !DILexicalBlock(scope: !546, file: !3, line: 417, column: 14)
!556 = !DILocation(line: 417, column: 26, scope: !555)
!557 = !DILocation(line: 417, column: 31, scope: !555)
!558 = !DILocation(line: 417, column: 43, scope: !555)
!559 = !DILocation(line: 417, column: 29, scope: !555)
!560 = !DILocation(line: 417, column: 14, scope: !546)
!561 = !DILocation(line: 418, column: 17, scope: !562)
!562 = distinct !DILexicalBlock(scope: !555, file: !3, line: 417, column: 48)
!563 = !DILocation(line: 419, column: 4, scope: !562)
!564 = !DILocation(line: 421, column: 2, scope: !540)
!565 = !DILocation(line: 411, column: 31, scope: !536)
!566 = !DILocation(line: 411, column: 2, scope: !536)
!567 = distinct !{!567, !538, !568}
!568 = !DILocation(line: 421, column: 2, scope: !532)
!569 = !DILocation(line: 423, column: 7, scope: !570)
!570 = distinct !DILexicalBlock(scope: !520, file: !3, line: 423, column: 6)
!571 = !DILocation(line: 423, column: 20, scope: !570)
!572 = !DILocation(line: 423, column: 23, scope: !570)
!573 = !DILocation(line: 423, column: 34, scope: !570)
!574 = !DILocation(line: 423, column: 6, scope: !520)
!575 = !DILocation(line: 425, column: 3, scope: !576)
!576 = distinct !DILexicalBlock(scope: !570, file: !3, line: 423, column: 53)
!577 = !DILocation(line: 425, column: 13, scope: !576)
!578 = !DILocation(line: 426, column: 2, scope: !576)
!579 = !DILocation(line: 428, column: 6, scope: !580)
!580 = distinct !DILexicalBlock(scope: !520, file: !3, line: 428, column: 6)
!581 = !DILocation(line: 428, column: 6, scope: !520)
!582 = !DILocation(line: 430, column: 3, scope: !583)
!583 = distinct !DILexicalBlock(scope: !580, file: !3, line: 428, column: 20)
!584 = !DILocation(line: 430, column: 13, scope: !583)
!585 = !DILocation(line: 431, column: 2, scope: !583)
!586 = !DILocation(line: 433, column: 3, scope: !587)
!587 = distinct !DILexicalBlock(scope: !580, file: !3, line: 431, column: 9)
!588 = !DILocation(line: 433, column: 13, scope: !587)
!589 = !DILocation(line: 435, column: 1, scope: !520)
!590 = distinct !DISubprogram(name: "task_reduce_normalize", scope: !3, file: !3, line: 436, type: !16, scopeLine: 437, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!591 = !DILocalVariable(name: "m", scope: !590, file: !3, line: 438, type: !42)
!592 = !DILocation(line: 438, column: 10, scope: !590)
!593 = !DILocalVariable(name: "n", scope: !590, file: !3, line: 438, type: !42)
!594 = !DILocation(line: 438, column: 13, scope: !590)
!595 = !DILocalVariable(name: "d", scope: !590, file: !3, line: 438, type: !42)
!596 = !DILocation(line: 438, column: 16, scope: !590)
!597 = !DILocalVariable(name: "s", scope: !590, file: !3, line: 438, type: !42)
!598 = !DILocation(line: 438, column: 19, scope: !590)
!599 = !DILocalVariable(name: "borrow", scope: !590, file: !3, line: 439, type: !6)
!600 = !DILocation(line: 439, column: 11, scope: !590)
!601 = !DILocalVariable(name: "i", scope: !590, file: !3, line: 441, type: !173)
!602 = !DILocation(line: 441, column: 6, scope: !590)
!603 = !DILocation(line: 443, column: 9, scope: !590)
!604 = !DILocation(line: 444, column: 9, scope: !605)
!605 = distinct !DILexicalBlock(scope: !590, file: !3, line: 444, column: 2)
!606 = !DILocation(line: 444, column: 7, scope: !605)
!607 = !DILocation(line: 444, column: 14, scope: !608)
!608 = distinct !DILexicalBlock(scope: !605, file: !3, line: 444, column: 2)
!609 = !DILocation(line: 444, column: 16, scope: !608)
!610 = !DILocation(line: 444, column: 2, scope: !605)
!611 = !DILocalVariable(name: "op", scope: !612, file: !3, line: 446, type: !6)
!612 = distinct !DILexicalBlock(scope: !608, file: !3, line: 444, column: 35)
!613 = !DILocation(line: 446, column: 12, scope: !612)
!614 = !DILocation(line: 446, column: 17, scope: !612)
!615 = !DILocation(line: 446, column: 21, scope: !612)
!616 = !DILocation(line: 446, column: 19, scope: !612)
!617 = !DILocation(line: 448, column: 7, scope: !612)
!618 = !DILocation(line: 448, column: 19, scope: !612)
!619 = !DILocation(line: 448, column: 5, scope: !612)
!620 = !DILocation(line: 449, column: 7, scope: !612)
!621 = !DILocation(line: 449, column: 19, scope: !612)
!622 = !DILocation(line: 449, column: 5, scope: !612)
!623 = !DILocation(line: 451, column: 7, scope: !612)
!624 = !DILocation(line: 451, column: 11, scope: !612)
!625 = !DILocation(line: 451, column: 9, scope: !612)
!626 = !DILocation(line: 451, column: 5, scope: !612)
!627 = !DILocation(line: 452, column: 7, scope: !628)
!628 = distinct !DILexicalBlock(scope: !612, file: !3, line: 452, column: 7)
!629 = !DILocation(line: 452, column: 11, scope: !628)
!630 = !DILocation(line: 452, column: 9, scope: !628)
!631 = !DILocation(line: 452, column: 7, scope: !612)
!632 = !DILocation(line: 453, column: 6, scope: !633)
!633 = distinct !DILexicalBlock(scope: !628, file: !3, line: 452, column: 14)
!634 = !DILocation(line: 454, column: 11, scope: !633)
!635 = !DILocation(line: 455, column: 3, scope: !633)
!636 = !DILocation(line: 456, column: 11, scope: !637)
!637 = distinct !DILexicalBlock(scope: !628, file: !3, line: 455, column: 10)
!638 = !DILocation(line: 458, column: 7, scope: !612)
!639 = !DILocation(line: 458, column: 11, scope: !612)
!640 = !DILocation(line: 458, column: 9, scope: !612)
!641 = !DILocation(line: 458, column: 5, scope: !612)
!642 = !DILocation(line: 460, column: 21, scope: !612)
!643 = !DILocation(line: 460, column: 3, scope: !612)
!644 = !DILocation(line: 460, column: 15, scope: !612)
!645 = !DILocation(line: 460, column: 19, scope: !612)
!646 = !DILocation(line: 462, column: 2, scope: !612)
!647 = !DILocation(line: 444, column: 30, scope: !608)
!648 = !DILocation(line: 444, column: 2, scope: !608)
!649 = distinct !{!649, !610, !650}
!650 = !DILocation(line: 462, column: 2, scope: !605)
!651 = !DILocation(line: 464, column: 6, scope: !652)
!652 = distinct !DILexicalBlock(scope: !590, file: !3, line: 464, column: 6)
!653 = !DILocation(line: 464, column: 17, scope: !652)
!654 = !DILocation(line: 464, column: 6, scope: !590)
!655 = !DILocation(line: 465, column: 3, scope: !656)
!656 = distinct !DILexicalBlock(scope: !652, file: !3, line: 464, column: 22)
!657 = !DILocation(line: 465, column: 13, scope: !656)
!658 = !DILocation(line: 466, column: 2, scope: !656)
!659 = !DILocation(line: 467, column: 3, scope: !660)
!660 = distinct !DILexicalBlock(scope: !652, file: !3, line: 466, column: 9)
!661 = !DILocation(line: 467, column: 13, scope: !660)
!662 = !DILocation(line: 469, column: 1, scope: !590)
!663 = distinct !DISubprogram(name: "task_reduce_n_divisor", scope: !3, file: !3, line: 471, type: !16, scopeLine: 472, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!664 = !DILocalVariable(name: "op1", scope: !663, file: !3, line: 473, type: !6)
!665 = !DILocation(line: 473, column: 11, scope: !663)
!666 = !DILocalVariable(name: "op2", scope: !663, file: !3, line: 474, type: !6)
!667 = !DILocation(line: 474, column: 11, scope: !663)
!668 = !DILocation(line: 476, column: 16, scope: !663)
!669 = !DILocation(line: 476, column: 28, scope: !663)
!670 = !DILocation(line: 476, column: 32, scope: !663)
!671 = !DILocation(line: 476, column: 49, scope: !663)
!672 = !DILocation(line: 476, column: 61, scope: !663)
!673 = !DILocation(line: 476, column: 47, scope: !663)
!674 = !DILocation(line: 476, column: 2, scope: !663)
!675 = !DILocation(line: 476, column: 12, scope: !663)
!676 = !DILocation(line: 478, column: 1, scope: !663)
!677 = distinct !DISubprogram(name: "task_reduce_quotient", scope: !3, file: !3, line: 480, type: !16, scopeLine: 481, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!678 = !DILocalVariable(name: "qn", scope: !677, file: !3, line: 482, type: !7)
!679 = !DILocation(line: 482, column: 11, scope: !677)
!680 = !DILocalVariable(name: "n_q", scope: !677, file: !3, line: 482, type: !7)
!681 = !DILocation(line: 482, column: 15, scope: !677)
!682 = !DILocalVariable(name: "op1", scope: !677, file: !3, line: 484, type: !6)
!683 = !DILocation(line: 484, column: 11, scope: !677)
!684 = !DILocalVariable(name: "op2", scope: !677, file: !3, line: 485, type: !6)
!685 = !DILocation(line: 485, column: 11, scope: !677)
!686 = !DILocation(line: 485, column: 17, scope: !677)
!687 = !DILocation(line: 485, column: 28, scope: !677)
!688 = !DILocalVariable(name: "op3", scope: !677, file: !3, line: 486, type: !6)
!689 = !DILocation(line: 486, column: 11, scope: !677)
!690 = !DILocation(line: 486, column: 17, scope: !677)
!691 = !DILocation(line: 486, column: 28, scope: !677)
!692 = !DILocation(line: 488, column: 6, scope: !693)
!693 = distinct !DILexicalBlock(scope: !677, file: !3, line: 488, column: 6)
!694 = !DILocation(line: 488, column: 18, scope: !693)
!695 = !DILocation(line: 488, column: 33, scope: !693)
!696 = !DILocation(line: 488, column: 45, scope: !693)
!697 = !DILocation(line: 488, column: 30, scope: !693)
!698 = !DILocation(line: 488, column: 6, scope: !677)
!699 = !DILocation(line: 489, column: 3, scope: !700)
!700 = distinct !DILexicalBlock(scope: !693, file: !3, line: 488, column: 51)
!701 = !DILocation(line: 489, column: 16, scope: !700)
!702 = !DILocation(line: 490, column: 2, scope: !700)
!703 = !DILocation(line: 491, column: 20, scope: !704)
!704 = distinct !DILexicalBlock(scope: !693, file: !3, line: 490, column: 9)
!705 = !DILocation(line: 491, column: 32, scope: !704)
!706 = !DILocation(line: 491, column: 44, scope: !704)
!707 = !DILocation(line: 491, column: 61, scope: !704)
!708 = !DILocation(line: 491, column: 73, scope: !704)
!709 = !DILocation(line: 491, column: 59, scope: !704)
!710 = !DILocation(line: 491, column: 81, scope: !704)
!711 = !DILocation(line: 491, column: 93, scope: !704)
!712 = !DILocation(line: 491, column: 79, scope: !704)
!713 = !DILocation(line: 491, column: 3, scope: !704)
!714 = !DILocation(line: 491, column: 16, scope: !704)
!715 = !DILocation(line: 494, column: 19, scope: !677)
!716 = !DILocation(line: 494, column: 31, scope: !677)
!717 = !DILocation(line: 494, column: 9, scope: !677)
!718 = !DILocation(line: 494, column: 43, scope: !677)
!719 = !DILocation(line: 494, column: 67, scope: !677)
!720 = !DILocation(line: 494, column: 79, scope: !677)
!721 = !DILocation(line: 494, column: 84, scope: !677)
!722 = !DILocation(line: 494, column: 66, scope: !677)
!723 = !DILocation(line: 494, column: 64, scope: !677)
!724 = !DILocation(line: 494, column: 101, scope: !677)
!725 = !DILocation(line: 494, column: 113, scope: !677)
!726 = !DILocation(line: 494, column: 99, scope: !677)
!727 = !DILocation(line: 494, column: 6, scope: !677)
!728 = !DILocation(line: 496, column: 2, scope: !677)
!729 = !DILocation(line: 496, column: 14, scope: !677)
!730 = !DILocation(line: 497, column: 2, scope: !677)
!731 = !DILocation(line: 498, column: 3, scope: !732)
!732 = distinct !DILexicalBlock(scope: !677, file: !3, line: 497, column: 5)
!733 = !DILocation(line: 498, column: 15, scope: !732)
!734 = !DILocation(line: 499, column: 8, scope: !732)
!735 = !DILocation(line: 499, column: 21, scope: !732)
!736 = !DILocation(line: 499, column: 18, scope: !732)
!737 = !DILocation(line: 499, column: 6, scope: !732)
!738 = !DILocation(line: 500, column: 2, scope: !732)
!739 = !DILocation(line: 500, column: 11, scope: !677)
!740 = !DILocation(line: 500, column: 16, scope: !677)
!741 = !DILocation(line: 500, column: 14, scope: !677)
!742 = distinct !{!742, !730, !743}
!743 = !DILocation(line: 500, column: 19, scope: !677)
!744 = !DILocation(line: 502, column: 2, scope: !677)
!745 = !DILocation(line: 502, column: 12, scope: !677)
!746 = !DILocation(line: 504, column: 1, scope: !677)
!747 = distinct !DISubprogram(name: "task_reduce_multiply", scope: !3, file: !3, line: 506, type: !16, scopeLine: 507, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!748 = !DILocalVariable(name: "i", scope: !747, file: !3, line: 508, type: !173)
!749 = !DILocation(line: 508, column: 6, scope: !747)
!750 = !DILocalVariable(name: "m", scope: !747, file: !3, line: 509, type: !42)
!751 = !DILocation(line: 509, column: 10, scope: !747)
!752 = !DILocalVariable(name: "n", scope: !747, file: !3, line: 509, type: !42)
!753 = !DILocation(line: 509, column: 13, scope: !747)
!754 = !DILocalVariable(name: "c", scope: !747, file: !3, line: 510, type: !6)
!755 = !DILocation(line: 510, column: 11, scope: !747)
!756 = !DILocalVariable(name: "offset", scope: !747, file: !3, line: 510, type: !6)
!757 = !DILocation(line: 510, column: 14, scope: !747)
!758 = !DILocation(line: 512, column: 11, scope: !747)
!759 = !DILocation(line: 512, column: 22, scope: !747)
!760 = !DILocation(line: 512, column: 26, scope: !747)
!761 = !DILocation(line: 512, column: 9, scope: !747)
!762 = !DILocation(line: 514, column: 9, scope: !763)
!763 = distinct !DILexicalBlock(scope: !747, file: !3, line: 514, column: 2)
!764 = !DILocation(line: 514, column: 7, scope: !763)
!765 = !DILocation(line: 514, column: 14, scope: !766)
!766 = distinct !DILexicalBlock(scope: !763, file: !3, line: 514, column: 2)
!767 = !DILocation(line: 514, column: 18, scope: !766)
!768 = !DILocation(line: 514, column: 16, scope: !766)
!769 = !DILocation(line: 514, column: 2, scope: !763)
!770 = !DILocation(line: 515, column: 3, scope: !771)
!771 = distinct !DILexicalBlock(scope: !766, file: !3, line: 514, column: 31)
!772 = !DILocation(line: 515, column: 16, scope: !771)
!773 = !DILocation(line: 515, column: 19, scope: !771)
!774 = !DILocation(line: 516, column: 2, scope: !771)
!775 = !DILocation(line: 514, column: 26, scope: !766)
!776 = !DILocation(line: 514, column: 2, scope: !766)
!777 = distinct !{!777, !769, !778}
!778 = !DILocation(line: 516, column: 2, scope: !763)
!779 = !DILocation(line: 518, column: 4, scope: !747)
!780 = !DILocation(line: 519, column: 11, scope: !781)
!781 = distinct !DILexicalBlock(scope: !747, file: !3, line: 519, column: 2)
!782 = !DILocation(line: 519, column: 9, scope: !781)
!783 = !DILocation(line: 519, column: 7, scope: !781)
!784 = !DILocation(line: 519, column: 19, scope: !785)
!785 = distinct !DILexicalBlock(scope: !781, file: !3, line: 519, column: 2)
!786 = !DILocation(line: 519, column: 21, scope: !785)
!787 = !DILocation(line: 519, column: 2, scope: !781)
!788 = !DILocation(line: 521, column: 7, scope: !789)
!789 = distinct !DILexicalBlock(scope: !785, file: !3, line: 519, column: 44)
!790 = !DILocation(line: 521, column: 5, scope: !789)
!791 = !DILocation(line: 522, column: 7, scope: !792)
!792 = distinct !DILexicalBlock(scope: !789, file: !3, line: 522, column: 7)
!793 = !DILocation(line: 522, column: 11, scope: !792)
!794 = !DILocation(line: 522, column: 18, scope: !792)
!795 = !DILocation(line: 522, column: 9, scope: !792)
!796 = !DILocation(line: 522, column: 7, scope: !789)
!797 = !DILocalVariable(name: "op", scope: !798, file: !3, line: 524, type: !6)
!798 = distinct !DILexicalBlock(scope: !792, file: !3, line: 522, column: 32)
!799 = !DILocation(line: 524, column: 13, scope: !798)
!800 = !DILocation(line: 524, column: 18, scope: !798)
!801 = !DILocation(line: 524, column: 22, scope: !798)
!802 = !DILocation(line: 524, column: 20, scope: !798)
!803 = !DILocation(line: 526, column: 8, scope: !798)
!804 = !DILocation(line: 526, column: 20, scope: !798)
!805 = !DILocation(line: 526, column: 6, scope: !798)
!806 = !DILocation(line: 527, column: 9, scope: !798)
!807 = !DILocation(line: 527, column: 24, scope: !798)
!808 = !DILocation(line: 527, column: 22, scope: !798)
!809 = !DILocation(line: 527, column: 6, scope: !798)
!810 = !DILocation(line: 528, column: 3, scope: !798)
!811 = !DILocation(line: 529, column: 6, scope: !812)
!812 = distinct !DILexicalBlock(scope: !792, file: !3, line: 528, column: 10)
!813 = !DILocation(line: 532, column: 7, scope: !789)
!814 = !DILocation(line: 532, column: 9, scope: !789)
!815 = !DILocation(line: 532, column: 5, scope: !789)
!816 = !DILocation(line: 533, column: 5, scope: !789)
!817 = !DILocation(line: 535, column: 21, scope: !789)
!818 = !DILocation(line: 535, column: 3, scope: !789)
!819 = !DILocation(line: 535, column: 16, scope: !789)
!820 = !DILocation(line: 535, column: 19, scope: !789)
!821 = !DILocation(line: 537, column: 2, scope: !789)
!822 = !DILocation(line: 519, column: 39, scope: !785)
!823 = !DILocation(line: 519, column: 2, scope: !785)
!824 = distinct !{!824, !787, !825}
!825 = !DILocation(line: 537, column: 2, scope: !781)
!826 = !DILocation(line: 539, column: 1, scope: !747)
!827 = distinct !DISubprogram(name: "task_reduce_compare", scope: !3, file: !3, line: 541, type: !16, scopeLine: 542, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!828 = !DILocalVariable(name: "i", scope: !827, file: !3, line: 543, type: !173)
!829 = !DILocation(line: 543, column: 6, scope: !827)
!830 = !DILocalVariable(name: "relation", scope: !827, file: !3, line: 544, type: !831)
!831 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!832 = !DILocation(line: 544, column: 7, scope: !827)
!833 = !DILocation(line: 546, column: 9, scope: !834)
!834 = distinct !DILexicalBlock(scope: !827, file: !3, line: 546, column: 2)
!835 = !DILocation(line: 546, column: 7, scope: !834)
!836 = !DILocation(line: 546, column: 31, scope: !837)
!837 = distinct !DILexicalBlock(scope: !834, file: !3, line: 546, column: 2)
!838 = !DILocation(line: 546, column: 33, scope: !837)
!839 = !DILocation(line: 546, column: 2, scope: !834)
!840 = !DILocation(line: 548, column: 7, scope: !841)
!841 = distinct !DILexicalBlock(scope: !842, file: !3, line: 548, column: 7)
!842 = distinct !DILexicalBlock(scope: !837, file: !3, line: 546, column: 44)
!843 = !DILocation(line: 548, column: 19, scope: !841)
!844 = !DILocation(line: 548, column: 24, scope: !841)
!845 = !DILocation(line: 548, column: 37, scope: !841)
!846 = !DILocation(line: 548, column: 22, scope: !841)
!847 = !DILocation(line: 548, column: 7, scope: !842)
!848 = !DILocation(line: 549, column: 13, scope: !849)
!849 = distinct !DILexicalBlock(scope: !841, file: !3, line: 548, column: 41)
!850 = !DILocation(line: 550, column: 4, scope: !849)
!851 = !DILocation(line: 551, column: 14, scope: !852)
!852 = distinct !DILexicalBlock(scope: !841, file: !3, line: 551, column: 14)
!853 = !DILocation(line: 551, column: 26, scope: !852)
!854 = !DILocation(line: 551, column: 31, scope: !852)
!855 = !DILocation(line: 551, column: 44, scope: !852)
!856 = !DILocation(line: 551, column: 29, scope: !852)
!857 = !DILocation(line: 551, column: 14, scope: !841)
!858 = !DILocation(line: 552, column: 13, scope: !859)
!859 = distinct !DILexicalBlock(scope: !852, file: !3, line: 551, column: 48)
!860 = !DILocation(line: 553, column: 4, scope: !859)
!861 = !DILocation(line: 555, column: 2, scope: !842)
!862 = !DILocation(line: 546, column: 39, scope: !837)
!863 = !DILocation(line: 546, column: 2, scope: !837)
!864 = distinct !{!864, !839, !865}
!865 = !DILocation(line: 555, column: 2, scope: !834)
!866 = !DILocation(line: 557, column: 6, scope: !867)
!867 = distinct !DILexicalBlock(scope: !827, file: !3, line: 557, column: 6)
!868 = !DILocation(line: 557, column: 15, scope: !867)
!869 = !DILocation(line: 557, column: 6, scope: !827)
!870 = !DILocation(line: 558, column: 3, scope: !871)
!871 = distinct !DILexicalBlock(scope: !867, file: !3, line: 557, column: 23)
!872 = !DILocation(line: 558, column: 13, scope: !871)
!873 = !DILocation(line: 559, column: 2, scope: !871)
!874 = !DILocation(line: 560, column: 1, scope: !827)
!875 = distinct !DISubprogram(name: "task_reduce_add", scope: !3, file: !3, line: 562, type: !16, scopeLine: 563, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!876 = !DILocalVariable(name: "i", scope: !875, file: !3, line: 564, type: !173)
!877 = !DILocation(line: 564, column: 6, scope: !875)
!878 = !DILocalVariable(name: "j", scope: !875, file: !3, line: 564, type: !173)
!879 = !DILocation(line: 564, column: 9, scope: !875)
!880 = !DILocalVariable(name: "m", scope: !875, file: !3, line: 565, type: !42)
!881 = !DILocation(line: 565, column: 10, scope: !875)
!882 = !DILocalVariable(name: "n", scope: !875, file: !3, line: 565, type: !42)
!883 = !DILocation(line: 565, column: 13, scope: !875)
!884 = !DILocalVariable(name: "c", scope: !875, file: !3, line: 565, type: !42)
!885 = !DILocation(line: 565, column: 16, scope: !875)
!886 = !DILocalVariable(name: "offset", scope: !875, file: !3, line: 566, type: !6)
!887 = !DILocation(line: 566, column: 11, scope: !875)
!888 = !DILocation(line: 568, column: 11, scope: !875)
!889 = !DILocation(line: 568, column: 22, scope: !875)
!890 = !DILocation(line: 568, column: 26, scope: !875)
!891 = !DILocation(line: 568, column: 9, scope: !875)
!892 = !DILocation(line: 570, column: 4, scope: !875)
!893 = !DILocation(line: 571, column: 11, scope: !894)
!894 = distinct !DILexicalBlock(scope: !875, file: !3, line: 571, column: 2)
!895 = !DILocation(line: 571, column: 9, scope: !894)
!896 = !DILocation(line: 571, column: 7, scope: !894)
!897 = !DILocation(line: 571, column: 19, scope: !898)
!898 = distinct !DILexicalBlock(scope: !894, file: !3, line: 571, column: 2)
!899 = !DILocation(line: 571, column: 21, scope: !898)
!900 = !DILocation(line: 571, column: 2, scope: !894)
!901 = !DILocation(line: 572, column: 7, scope: !902)
!902 = distinct !DILexicalBlock(scope: !898, file: !3, line: 571, column: 44)
!903 = !DILocation(line: 572, column: 19, scope: !902)
!904 = !DILocation(line: 572, column: 5, scope: !902)
!905 = !DILocation(line: 574, column: 7, scope: !902)
!906 = !DILocation(line: 574, column: 11, scope: !902)
!907 = !DILocation(line: 574, column: 9, scope: !902)
!908 = !DILocation(line: 574, column: 5, scope: !902)
!909 = !DILocation(line: 576, column: 7, scope: !910)
!910 = distinct !DILexicalBlock(scope: !902, file: !3, line: 576, column: 7)
!911 = !DILocation(line: 576, column: 11, scope: !910)
!912 = !DILocation(line: 576, column: 18, scope: !910)
!913 = !DILocation(line: 576, column: 9, scope: !910)
!914 = !DILocation(line: 576, column: 7, scope: !902)
!915 = !DILocation(line: 577, column: 8, scope: !916)
!916 = distinct !DILexicalBlock(scope: !910, file: !3, line: 576, column: 32)
!917 = !DILocation(line: 577, column: 20, scope: !916)
!918 = !DILocation(line: 577, column: 6, scope: !916)
!919 = !DILocation(line: 578, column: 3, scope: !916)
!920 = !DILocation(line: 579, column: 6, scope: !921)
!921 = distinct !DILexicalBlock(scope: !910, file: !3, line: 578, column: 10)
!922 = !DILocation(line: 580, column: 6, scope: !921)
!923 = !DILocation(line: 583, column: 20, scope: !902)
!924 = !DILocation(line: 583, column: 24, scope: !902)
!925 = !DILocation(line: 583, column: 22, scope: !902)
!926 = !DILocation(line: 583, column: 28, scope: !902)
!927 = !DILocation(line: 583, column: 26, scope: !902)
!928 = !DILocation(line: 583, column: 3, scope: !902)
!929 = !DILocation(line: 583, column: 15, scope: !902)
!930 = !DILocation(line: 583, column: 18, scope: !902)
!931 = !DILocation(line: 585, column: 7, scope: !902)
!932 = !DILocation(line: 585, column: 19, scope: !902)
!933 = !DILocation(line: 585, column: 22, scope: !902)
!934 = !DILocation(line: 585, column: 5, scope: !902)
!935 = !DILocation(line: 586, column: 3, scope: !902)
!936 = !DILocation(line: 586, column: 15, scope: !902)
!937 = !DILocation(line: 586, column: 18, scope: !902)
!938 = !DILocation(line: 587, column: 2, scope: !902)
!939 = !DILocation(line: 571, column: 39, scope: !898)
!940 = !DILocation(line: 571, column: 2, scope: !898)
!941 = distinct !{!941, !900, !942}
!942 = !DILocation(line: 587, column: 2, scope: !894)
!943 = !DILocation(line: 589, column: 1, scope: !875)
!944 = distinct !DISubprogram(name: "task_reduce_subtract", scope: !3, file: !3, line: 591, type: !16, scopeLine: 592, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!945 = !DILocalVariable(name: "i", scope: !944, file: !3, line: 593, type: !173)
!946 = !DILocation(line: 593, column: 6, scope: !944)
!947 = !DILocalVariable(name: "m", scope: !944, file: !3, line: 594, type: !42)
!948 = !DILocation(line: 594, column: 10, scope: !944)
!949 = !DILocalVariable(name: "s", scope: !944, file: !3, line: 594, type: !42)
!950 = !DILocation(line: 594, column: 13, scope: !944)
!951 = !DILocalVariable(name: "qn", scope: !944, file: !3, line: 594, type: !42)
!952 = !DILocation(line: 594, column: 16, scope: !944)
!953 = !DILocalVariable(name: "borrow", scope: !944, file: !3, line: 595, type: !6)
!954 = !DILocation(line: 595, column: 11, scope: !944)
!955 = !DILocalVariable(name: "offset", scope: !944, file: !3, line: 595, type: !6)
!956 = !DILocation(line: 595, column: 19, scope: !944)
!957 = !DILocation(line: 597, column: 11, scope: !944)
!958 = !DILocation(line: 597, column: 22, scope: !944)
!959 = !DILocation(line: 597, column: 26, scope: !944)
!960 = !DILocation(line: 597, column: 9, scope: !944)
!961 = !DILocation(line: 599, column: 9, scope: !944)
!962 = !DILocation(line: 600, column: 9, scope: !963)
!963 = distinct !DILexicalBlock(scope: !944, file: !3, line: 600, column: 2)
!964 = !DILocation(line: 600, column: 7, scope: !963)
!965 = !DILocation(line: 600, column: 14, scope: !966)
!966 = distinct !DILexicalBlock(scope: !963, file: !3, line: 600, column: 2)
!967 = !DILocation(line: 600, column: 16, scope: !966)
!968 = !DILocation(line: 600, column: 2, scope: !963)
!969 = !DILocation(line: 601, column: 7, scope: !970)
!970 = distinct !DILexicalBlock(scope: !966, file: !3, line: 600, column: 39)
!971 = !DILocation(line: 601, column: 19, scope: !970)
!972 = !DILocation(line: 601, column: 5, scope: !970)
!973 = !DILocation(line: 603, column: 7, scope: !974)
!974 = distinct !DILexicalBlock(scope: !970, file: !3, line: 603, column: 7)
!975 = !DILocation(line: 603, column: 12, scope: !974)
!976 = !DILocation(line: 603, column: 9, scope: !974)
!977 = !DILocation(line: 603, column: 7, scope: !970)
!978 = !DILocation(line: 604, column: 9, scope: !979)
!979 = distinct !DILexicalBlock(scope: !974, file: !3, line: 603, column: 20)
!980 = !DILocation(line: 604, column: 22, scope: !979)
!981 = !DILocation(line: 604, column: 7, scope: !979)
!982 = !DILocation(line: 606, column: 8, scope: !979)
!983 = !DILocation(line: 606, column: 13, scope: !979)
!984 = !DILocation(line: 606, column: 11, scope: !979)
!985 = !DILocation(line: 606, column: 6, scope: !979)
!986 = !DILocation(line: 607, column: 8, scope: !987)
!987 = distinct !DILexicalBlock(scope: !979, file: !3, line: 607, column: 8)
!988 = !DILocation(line: 607, column: 12, scope: !987)
!989 = !DILocation(line: 607, column: 10, scope: !987)
!990 = !DILocation(line: 607, column: 8, scope: !979)
!991 = !DILocation(line: 608, column: 7, scope: !992)
!992 = distinct !DILexicalBlock(scope: !987, file: !3, line: 607, column: 15)
!993 = !DILocation(line: 609, column: 12, scope: !992)
!994 = !DILocation(line: 610, column: 4, scope: !992)
!995 = !DILocation(line: 611, column: 12, scope: !996)
!996 = distinct !DILexicalBlock(scope: !987, file: !3, line: 610, column: 11)
!997 = !DILocation(line: 613, column: 21, scope: !979)
!998 = !DILocation(line: 613, column: 25, scope: !979)
!999 = !DILocation(line: 613, column: 23, scope: !979)
!1000 = !DILocation(line: 613, column: 4, scope: !979)
!1001 = !DILocation(line: 613, column: 16, scope: !979)
!1002 = !DILocation(line: 613, column: 19, scope: !979)
!1003 = !DILocation(line: 615, column: 3, scope: !979)
!1004 = !DILocation(line: 616, column: 2, scope: !970)
!1005 = !DILocation(line: 600, column: 34, scope: !966)
!1006 = !DILocation(line: 600, column: 2, scope: !966)
!1007 = distinct !{!1007, !968, !1008}
!1008 = !DILocation(line: 616, column: 2, scope: !963)
!1009 = !DILocation(line: 617, column: 1, scope: !944)
!1010 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 619, type: !16, scopeLine: 619, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1011 = !DILocation(line: 621, column: 1, scope: !1010)
!1012 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 624, type: !1013, scopeLine: 624, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!1013 = !DISubroutineType(types: !1014)
!1014 = !{!173}
!1015 = !DILocation(line: 626, column: 16, scope: !1012)
!1016 = !DILocation(line: 627, column: 10, scope: !1012)
!1017 = !DILocation(line: 628, column: 12, scope: !1012)
!1018 = !DILocation(line: 629, column: 5, scope: !1012)
!1019 = !DILocation(line: 631, column: 2, scope: !1012)
!1020 = !DILocation(line: 633, column: 3, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1012, file: !3, line: 631, column: 12)
!1022 = !DILocation(line: 635, column: 3, scope: !1021)
!1023 = !DILocation(line: 637, column: 8, scope: !1024)
!1024 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 637, column: 8)
!1025 = distinct !DILexicalBlock(scope: !1021, file: !3, line: 635, column: 13)
!1026 = !DILocation(line: 637, column: 19, scope: !1024)
!1027 = !DILocation(line: 637, column: 8, scope: !1025)
!1028 = !DILocation(line: 639, column: 5, scope: !1029)
!1029 = distinct !DILexicalBlock(scope: !1024, file: !3, line: 637, column: 25)
!1030 = !DILocation(line: 641, column: 4, scope: !1029)
!1031 = !DILocation(line: 643, column: 8, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 643, column: 8)
!1033 = !DILocation(line: 643, column: 19, scope: !1032)
!1034 = !DILocation(line: 643, column: 8, scope: !1025)
!1035 = !DILocation(line: 645, column: 5, scope: !1036)
!1036 = distinct !DILexicalBlock(scope: !1032, file: !3, line: 643, column: 25)
!1037 = !DILocation(line: 647, column: 4, scope: !1036)
!1038 = !DILocation(line: 649, column: 8, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 649, column: 8)
!1040 = !DILocation(line: 649, column: 19, scope: !1039)
!1041 = !DILocation(line: 649, column: 8, scope: !1025)
!1042 = !DILocation(line: 651, column: 5, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1039, file: !3, line: 649, column: 25)
!1044 = !DILocation(line: 653, column: 4, scope: !1043)
!1045 = !DILocation(line: 653, column: 15, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1039, file: !3, line: 653, column: 15)
!1047 = !DILocation(line: 653, column: 26, scope: !1046)
!1048 = !DILocation(line: 653, column: 15, scope: !1039)
!1049 = !DILocation(line: 655, column: 5, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1046, file: !3, line: 653, column: 32)
!1051 = !DILocation(line: 657, column: 4, scope: !1050)
!1052 = !DILocation(line: 659, column: 4, scope: !1025)
!1053 = !DILocation(line: 661, column: 4, scope: !1025)
!1054 = !DILocation(line: 663, column: 5, scope: !1055)
!1055 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 661, column: 7)
!1056 = !DILocation(line: 665, column: 4, scope: !1055)
!1057 = !DILocation(line: 665, column: 13, scope: !1025)
!1058 = !DILocation(line: 665, column: 24, scope: !1025)
!1059 = distinct !{!1059, !1053, !1060}
!1060 = !DILocation(line: 665, column: 40, scope: !1025)
!1061 = !DILocation(line: 667, column: 4, scope: !1025)
!1062 = !DILocation(line: 669, column: 8, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 669, column: 8)
!1064 = !DILocation(line: 669, column: 19, scope: !1063)
!1065 = !DILocation(line: 669, column: 8, scope: !1025)
!1066 = !DILocation(line: 670, column: 5, scope: !1063)
!1067 = !DILocation(line: 672, column: 4, scope: !1025)
!1068 = !DILocation(line: 674, column: 8, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 674, column: 8)
!1070 = !DILocation(line: 674, column: 19, scope: !1069)
!1071 = !DILocation(line: 674, column: 8, scope: !1025)
!1072 = !DILocation(line: 676, column: 5, scope: !1073)
!1073 = distinct !DILexicalBlock(scope: !1069, file: !3, line: 674, column: 25)
!1074 = !DILocation(line: 678, column: 4, scope: !1073)
!1075 = !DILocation(line: 680, column: 8, scope: !1076)
!1076 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 680, column: 8)
!1077 = !DILocation(line: 680, column: 19, scope: !1076)
!1078 = !DILocation(line: 680, column: 8, scope: !1025)
!1079 = !DILocation(line: 682, column: 5, scope: !1080)
!1080 = distinct !DILexicalBlock(scope: !1076, file: !3, line: 680, column: 25)
!1081 = !DILocation(line: 684, column: 5, scope: !1080)
!1082 = !DILocation(line: 686, column: 6, scope: !1083)
!1083 = distinct !DILexicalBlock(scope: !1080, file: !3, line: 684, column: 8)
!1084 = !DILocation(line: 688, column: 6, scope: !1083)
!1085 = !DILocation(line: 690, column: 6, scope: !1083)
!1086 = !DILocation(line: 692, column: 10, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1083, file: !3, line: 692, column: 10)
!1088 = !DILocation(line: 692, column: 21, scope: !1087)
!1089 = !DILocation(line: 692, column: 10, scope: !1083)
!1090 = !DILocation(line: 694, column: 7, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1087, file: !3, line: 692, column: 27)
!1092 = !DILocation(line: 696, column: 6, scope: !1091)
!1093 = !DILocation(line: 698, column: 6, scope: !1083)
!1094 = !DILocation(line: 700, column: 5, scope: !1083)
!1095 = !DILocation(line: 700, column: 13, scope: !1080)
!1096 = !DILocation(line: 700, column: 25, scope: !1080)
!1097 = !DILocation(line: 700, column: 29, scope: !1080)
!1098 = distinct !{!1098, !1081, !1099}
!1099 = !DILocation(line: 700, column: 41, scope: !1080)
!1100 = !DILocation(line: 701, column: 4, scope: !1080)
!1101 = !DILocation(line: 703, column: 8, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1025, file: !3, line: 703, column: 8)
!1103 = !DILocation(line: 703, column: 25, scope: !1102)
!1104 = !DILocation(line: 703, column: 8, scope: !1025)
!1105 = !DILocation(line: 705, column: 5, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 703, column: 31)
!1107 = !DILocation(line: 707, column: 4, scope: !1106)
!1108 = !DILocation(line: 707, column: 15, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1102, file: !3, line: 707, column: 15)
!1110 = !DILocation(line: 707, column: 32, scope: !1109)
!1111 = !DILocation(line: 707, column: 15, scope: !1102)
!1112 = !DILocation(line: 709, column: 5, scope: !1113)
!1113 = distinct !DILexicalBlock(scope: !1109, file: !3, line: 707, column: 38)
!1114 = !DILocation(line: 711, column: 4, scope: !1113)
!1115 = distinct !{!1115, !1022, !1116}
!1116 = !DILocation(line: 712, column: 3, scope: !1021)
!1117 = distinct !{!1117, !1019, !1118}
!1118 = !DILocation(line: 713, column: 2, scope: !1012)
