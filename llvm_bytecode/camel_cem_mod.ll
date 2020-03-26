; ModuleID = 'camel_cem_mod.bc'
source_filename = "../example/camel_cem.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, [512 x %struct._node_t], i16, i16, i16, i16, i16, i16, %struct._node_t, [64 x %struct._node_t], %struct._node_t, i16, i16, i16, i16 }
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !18
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !68
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !9
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !16
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !70

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !82 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !85
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !86
  %conv = zext i8 %0 to i16, !dbg !86
  %or = or i16 %conv, 1, !dbg !86
  %conv1 = trunc i16 %or to i8, !dbg !86
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !86
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !87
  %conv2 = zext i8 %1 to i16, !dbg !87
  %and = and i16 %conv2, -2, !dbg !87
  %conv3 = trunc i16 %and to i8, !dbg !87
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !87
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !88
  %and4 = and i16 %2, -2, !dbg !88
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !88
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !89
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !90
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !91
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !92
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !93
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !94
  ret void, !dbg !95
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !96 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !97
  %cmp = icmp eq i16 %0, 1, !dbg !99
  br i1 %cmp, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !101
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !103
  br label %if.end4, !dbg !104

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !105
  %cmp1 = icmp eq i16 %1, 2, !dbg !107
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !108

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !111
  br label %if.end, !dbg !112

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !115
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !115
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !115
  %3 = load i16, i16* %arrayidx, align 2, !dbg !115
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !115, !srcloc !117
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !118, metadata !DIExpression()), !dbg !120
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !120, !srcloc !121
  store i16 %4, i16* %__x, align 2, !dbg !120
  %5 = load i16, i16* %__x, align 2, !dbg !120
  store i16 %5, i16* %tmp, align 2, !dbg !120
  %6 = load i16, i16* %tmp, align 2, !dbg !120
  %add = add i16 %6, 2, !dbg !122
  %7 = inttoptr i16 %add to i8*, !dbg !123
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !124, metadata !DIExpression()), !dbg !126
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !126, !srcloc !127
  store i16 %8, i16* %__x5, align 2, !dbg !126
  %9 = load i16, i16* %__x5, align 2, !dbg !126
  store i16 %9, i16* %tmp6, align 2, !dbg !126
  %10 = load i16, i16* %tmp6, align 2, !dbg !126
  %add7 = add i16 %10, 2, !dbg !128
  %sub = sub i16 9216, %add7, !dbg !129
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !130
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !131
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !132
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !132
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !133
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 3520, i16 zeroext %13), !dbg !134
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !135
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !136
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !138
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !139
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !139
  %cmp9 = icmp eq i16 %14, %16, !dbg !140
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !141

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !142
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !144
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !145
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !144
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 3522, i1 false), !dbg !144
  call void @camel_init(), !dbg !146
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !147
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !148
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !147
  call void @__restore_registers(i16* %arraydecay), !dbg !149
  br label %if.end13, !dbg !150

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !151
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !153
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !154 {
entry:
  %node = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !155
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !155
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !155
  store i16 0, i16* %parent_next, align 2, !dbg !156
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !157
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !157
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !157
  store i16 0, i16* %out_len, align 2, !dbg !158
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !159
  %letter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !159
  store i16 0, i16* %letter, align 2, !dbg !160
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !161
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !161
  %prev_sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !161
  store i16 0, i16* %prev_sample, align 2, !dbg !162
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !163
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !163
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !163
  store i16 0, i16* %letter_idx, align 2, !dbg !164
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !165
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !165
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !165
  store i16 1, i16* %sample_count, align 2, !dbg !166
  br label %while.cond, !dbg !167

while.cond:                                       ; preds = %while.body, %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !168
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !168
  %letter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 0, !dbg !168
  %7 = load i16, i16* %letter7, align 2, !dbg !168
  %cmp = icmp ult i16 %7, 256, !dbg !169
  br i1 %cmp, label %while.body, label %while.end, !dbg !167

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct._node_t* %node, metadata !170, metadata !DIExpression()), !dbg !172
  %letter8 = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 0, !dbg !173
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !174
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !174
  %letter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !174
  %9 = load i16, i16* %letter10, align 2, !dbg !174
  store i16 %9, i16* %letter8, align 2, !dbg !173
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 1, !dbg !173
  store i16 0, i16* %sibling, align 2, !dbg !173
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 2, !dbg !173
  store i16 0, i16* %child, align 2, !dbg !173
  call void @llvm.dbg.declare(metadata i16* %i, metadata !175, metadata !DIExpression()), !dbg !176
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !177
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !177
  %letter12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !177
  %11 = load i16, i16* %letter12, align 2, !dbg !177
  store i16 %11, i16* %i, align 2, !dbg !176
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !178
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !178
  %13 = load i16, i16* %i, align 2, !dbg !179
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %13, !dbg !178
  %14 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !180
  %15 = bitcast %struct._node_t* %node to i8*, !dbg !180
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 6, i1 false), !dbg !180
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !181
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !181
  %letter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !181
  %17 = load i16, i16* %letter15, align 2, !dbg !182
  %inc = add i16 %17, 1, !dbg !182
  store i16 %inc, i16* %letter15, align 2, !dbg !182
  br label %while.cond, !dbg !167, !llvm.loop !183

while.end:                                        ; preds = %while.cond
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !185
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !185
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 4, !dbg !185
  store i16 256, i16* %node_count, align 2, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !188 {
entry:
  %next_letter_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %next_letter_idx, metadata !189, metadata !DIExpression()), !dbg !190
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !191
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !191
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !191
  %1 = load i16, i16* %letter_idx, align 2, !dbg !191
  %add = add i16 %1, 1, !dbg !192
  store i16 %add, i16* %next_letter_idx, align 2, !dbg !190
  %2 = load i16, i16* %next_letter_idx, align 2, !dbg !193
  %cmp = icmp eq i16 %2, 2, !dbg !195
  br i1 %cmp, label %if.then, label %if.end, !dbg !196

if.then:                                          ; preds = %entry
  store i16 0, i16* %next_letter_idx, align 2, !dbg !197
  br label %if.end, !dbg !198

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !199
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !199
  %letter_idx2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !199
  %4 = load i16, i16* %letter_idx2, align 2, !dbg !199
  %cmp3 = icmp eq i16 %4, 0, !dbg !201
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !202

if.then4:                                         ; preds = %if.end
  %5 = load i16, i16* %next_letter_idx, align 2, !dbg !203
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !205
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !205
  %letter_idx6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !205
  store i16 %5, i16* %letter_idx6, align 2, !dbg !206
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !207
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !207
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 18, !dbg !207
  store i16 0, i16* %check, align 2, !dbg !208
  br label %if.end12, !dbg !209

if.else:                                          ; preds = %if.end
  %8 = load i16, i16* %next_letter_idx, align 2, !dbg !210
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !212
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !212
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !212
  store i16 %8, i16* %letter_idx9, align 2, !dbg !213
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !214
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !214
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 18, !dbg !214
  store i16 1, i16* %check11, align 2, !dbg !215
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then4
  ret void, !dbg !216
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_measure_temp() #0 !dbg !217 {
entry:
  %prev_sample = alloca i16, align 2
  %sample = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample, metadata !218, metadata !DIExpression()), !dbg !219
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !220
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !220
  %prev_sample1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !220
  %1 = load i16, i16* %prev_sample1, align 2, !dbg !220
  store i16 %1, i16* %prev_sample, align 2, !dbg !221
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !222, metadata !DIExpression()), !dbg !223
  %2 = load i16, i16* %prev_sample, align 2, !dbg !224
  %call = call i16 @acquire_sample(i16 %2), !dbg !225
  store i16 %call, i16* %sample, align 2, !dbg !223
  %3 = load i16, i16* %sample, align 2, !dbg !226
  store i16 %3, i16* %prev_sample, align 2, !dbg !227
  %4 = load i16, i16* %prev_sample, align 2, !dbg !228
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !229
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !229
  %prev_sample3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !229
  store i16 %4, i16* %prev_sample3, align 2, !dbg !230
  %6 = load i16, i16* %sample, align 2, !dbg !231
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !232
  %sample5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !232
  store i16 %6, i16* %sample5, align 2, !dbg !233
  ret void, !dbg !234
}

; Function Attrs: noinline nounwind optnone
define internal i16 @acquire_sample(i16 %prev_sample) #0 !dbg !235 {
entry:
  %prev_sample.addr = alloca i16, align 2
  %sample = alloca i16, align 2
  store i16 %prev_sample, i16* %prev_sample.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample.addr, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !240, metadata !DIExpression()), !dbg !241
  %0 = load i16, i16* %prev_sample.addr, align 2, !dbg !242
  %add = add i16 %0, 1, !dbg !243
  %and = and i16 %add, 3, !dbg !244
  store i16 %and, i16* %sample, align 2, !dbg !241
  %1 = load i16, i16* %sample, align 2, !dbg !245
  ret i16 %1, !dbg !246
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_letterize() #0 !dbg !247 {
entry:
  %letter_idx = alloca i16, align 2
  %letter_shift = alloca i16, align 2
  %letter = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %letter_idx, metadata !248, metadata !DIExpression()), !dbg !249
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !250
  %letter_idx1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !250
  %1 = load i16, i16* %letter_idx1, align 2, !dbg !250
  store i16 %1, i16* %letter_idx, align 2, !dbg !249
  %2 = load i16, i16* %letter_idx, align 2, !dbg !251
  %cmp = icmp eq i16 %2, 0, !dbg !253
  br i1 %cmp, label %if.then, label %if.else, !dbg !254

if.then:                                          ; preds = %entry
  store i16 2, i16* %letter_idx, align 2, !dbg !255
  br label %if.end, !dbg !256

if.else:                                          ; preds = %entry
  %3 = load i16, i16* %letter_idx, align 2, !dbg !257
  %dec = add i16 %3, -1, !dbg !257
  store i16 %dec, i16* %letter_idx, align 2, !dbg !257
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i16* %letter_shift, metadata !258, metadata !DIExpression()), !dbg !259
  %4 = load i16, i16* %letter_idx, align 2, !dbg !260
  %mul = mul i16 8, %4, !dbg !261
  store i16 %mul, i16* %letter_shift, align 2, !dbg !259
  call void @llvm.dbg.declare(metadata i16* %letter, metadata !262, metadata !DIExpression()), !dbg !263
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !264
  %sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 6, !dbg !264
  %6 = load i16, i16* %sample, align 2, !dbg !264
  %7 = load i16, i16* %letter_shift, align 2, !dbg !265
  %shl = shl i16 255, %7, !dbg !266
  %and = and i16 %6, %shl, !dbg !267
  %8 = load i16, i16* %letter_shift, align 2, !dbg !268
  %shr = lshr i16 %and, %8, !dbg !269
  store i16 %shr, i16* %letter, align 2, !dbg !263
  %9 = load i16, i16* %letter, align 2, !dbg !270
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !271
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !271
  store i16 %9, i16* %letter4, align 2, !dbg !272
  ret void, !dbg !273
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_compress() #0 !dbg !274 {
entry:
  %parent_node = alloca %struct._node_t, align 2
  %parent = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node, metadata !275, metadata !DIExpression()), !dbg !276
  call void @llvm.dbg.declare(metadata i16* %parent, metadata !277, metadata !DIExpression()), !dbg !278
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !279
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !279
  %1 = load i16, i16* %parent_next, align 2, !dbg !279
  store i16 %1, i16* %parent, align 2, !dbg !278
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !280
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !280
  %3 = load i16, i16* %parent, align 2, !dbg !281
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !280
  %4 = bitcast %struct._node_t* %parent_node to i8*, !dbg !280
  %5 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !280
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %4, i8* align 2 %5, i16 6, i1 false), !dbg !280
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !282
  %6 = load i16, i16* %child, align 2, !dbg !282
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !283
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !283
  store i16 %6, i16* %sibling, align 2, !dbg !284
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !285
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !285
  %parent_node4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !285
  %9 = bitcast %struct._node_t* %parent_node4 to i8*, !dbg !286
  %10 = bitcast %struct._node_t* %parent_node to i8*, !dbg !286
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %9, i8* align 2 %10, i16 6, i1 false), !dbg !286
  %11 = load i16, i16* %parent, align 2, !dbg !287
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !288
  %parent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !288
  store i16 %11, i16* %parent6, align 2, !dbg !289
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !290
  %13 = load i16, i16* %child7, align 2, !dbg !290
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !291
  %child9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !291
  store i16 %13, i16* %child9, align 2, !dbg !292
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !293
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !293
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 7, !dbg !293
  %16 = load i16, i16* %sample_count, align 2, !dbg !294
  %inc = add i16 %16, 1, !dbg !294
  store i16 %inc, i16* %sample_count, align 2, !dbg !294
  ret void, !dbg !295
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_find_sibling() #0 !dbg !296 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %starting_node_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !297, metadata !DIExpression()), !dbg !299
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !300
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !300
  %1 = load i16, i16* %sibling, align 2, !dbg !300
  %cmp = icmp ne i16 %1, 0, !dbg !302
  br i1 %cmp, label %if.then, label %if.end21, !dbg !303

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %i, metadata !304, metadata !DIExpression()), !dbg !306
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !307
  %sibling2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !307
  %3 = load i16, i16* %sibling2, align 2, !dbg !307
  store i16 %3, i16* %i, align 2, !dbg !306
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !308
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 5, !dbg !308
  %5 = load i16, i16* %i, align 2, !dbg !309
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !308
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !310
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !311
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 0, !dbg !313
  %7 = load i16, i16* %letter, align 2, !dbg !313
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !314
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !314
  %letter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !314
  %9 = load i16, i16* %letter5, align 2, !dbg !314
  %cmp6 = icmp eq i16 %7, %9, !dbg !315
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !316

if.then7:                                         ; preds = %if.then
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !317
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !317
  %sibling9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !317
  %11 = load i16, i16* %sibling9, align 2, !dbg !317
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !319
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 11, !dbg !319
  store i16 %11, i16* %parent_next, align 2, !dbg !320
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !321
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !321
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 18, !dbg !321
  store i16 0, i16* %check, align 2, !dbg !322
  br label %if.end34, !dbg !323

if.else:                                          ; preds = %if.then
  %14 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !324
  %sibling12 = getelementptr inbounds %struct._node_t, %struct._node_t* %14, i32 0, i32 1, !dbg !327
  %15 = load i16, i16* %sibling12, align 2, !dbg !327
  %cmp13 = icmp ne i16 %15, 0, !dbg !328
  br i1 %cmp13, label %if.then14, label %if.end, !dbg !329

if.then14:                                        ; preds = %if.else
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !330
  %sibling15 = getelementptr inbounds %struct._node_t, %struct._node_t* %16, i32 0, i32 1, !dbg !332
  %17 = load i16, i16* %sibling15, align 2, !dbg !332
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !333
  %sibling17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !333
  store i16 %17, i16* %sibling17, align 2, !dbg !334
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !335
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 18, !dbg !335
  store i16 1, i16* %check19, align 2, !dbg !336
  br label %if.end34, !dbg !337

if.end:                                           ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end
  br label %if.end21, !dbg !338

if.end21:                                         ; preds = %if.end20, %entry
  call void @llvm.dbg.declare(metadata i16* %starting_node_idx, metadata !339, metadata !DIExpression()), !dbg !340
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !341
  %letter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !341
  %21 = load i16, i16* %letter23, align 2, !dbg !341
  store i16 %21, i16* %starting_node_idx, align 2, !dbg !340
  %22 = load i16, i16* %starting_node_idx, align 2, !dbg !342
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !343
  %parent_next25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 11, !dbg !343
  store i16 %22, i16* %parent_next25, align 2, !dbg !344
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !345
  %child = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !345
  %25 = load i16, i16* %child, align 2, !dbg !345
  %cmp27 = icmp eq i16 %25, 0, !dbg !347
  br i1 %cmp27, label %if.then28, label %if.else31, !dbg !348

if.then28:                                        ; preds = %if.end21
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !349
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !349
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 18, !dbg !349
  store i16 2, i16* %check30, align 2, !dbg !351
  br label %if.end34, !dbg !352

if.else31:                                        ; preds = %if.end21
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !353
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 18, !dbg !353
  store i16 3, i16* %check33, align 2, !dbg !355
  br label %if.end34

if.end34:                                         ; preds = %if.then7, %if.then14, %if.else31, %if.then28
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_node() #0 !dbg !357 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %next_sibling = alloca i16, align 2
  %sibling_node_obj = alloca %struct._node_t, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !358, metadata !DIExpression()), !dbg !359
  call void @llvm.dbg.declare(metadata i16* %i, metadata !360, metadata !DIExpression()), !dbg !361
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !362
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !362
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !362
  %1 = load i16, i16* %sibling, align 2, !dbg !362
  store i16 %1, i16* %i, align 2, !dbg !361
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !363
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !363
  %3 = load i16, i16* %i, align 2, !dbg !364
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !363
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !365
  %4 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !366
  %sibling2 = getelementptr inbounds %struct._node_t, %struct._node_t* %4, i32 0, i32 1, !dbg !368
  %5 = load i16, i16* %sibling2, align 2, !dbg !368
  %cmp = icmp ne i16 %5, 0, !dbg !369
  br i1 %cmp, label %if.then, label %if.else, !dbg !370

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %next_sibling, metadata !371, metadata !DIExpression()), !dbg !373
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !374
  %sibling3 = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 1, !dbg !375
  %7 = load i16, i16* %sibling3, align 2, !dbg !375
  store i16 %7, i16* %next_sibling, align 2, !dbg !373
  %8 = load i16, i16* %next_sibling, align 2, !dbg !376
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !377
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !377
  %sibling5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !377
  store i16 %8, i16* %sibling5, align 2, !dbg !378
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !379
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !379
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 18, !dbg !379
  store i16 0, i16* %check, align 2, !dbg !380
  br label %if.end, !dbg !381

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !382, metadata !DIExpression()), !dbg !384
  %11 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !385
  %12 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !386
  %13 = bitcast %struct._node_t* %11 to i8*, !dbg !386
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 6, i1 false), !dbg !386
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !387
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !387
  %sibling_node8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !387
  %15 = bitcast %struct._node_t* %sibling_node8 to i8*, !dbg !388
  %16 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !388
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !388
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !389
  %check10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 18, !dbg !389
  store i16 1, i16* %check10, align 2, !dbg !390
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !391
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() #0 !dbg !392 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !393
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !393
  %1 = load i16, i16* %node_count, align 2, !dbg !393
  %cmp = icmp eq i16 %1, 512, !dbg !395
  br i1 %cmp, label %if.then, label %if.end, !dbg !396

if.then:                                          ; preds = %entry
  br label %while.body, !dbg !397

while.body:                                       ; preds = %if.then, %while.body
  br label %while.body, !dbg !397, !llvm.loop !399

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %child, metadata !401, metadata !DIExpression()), !dbg !402
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !403
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !403
  %3 = load i16, i16* %node_count2, align 2, !dbg !403
  store i16 %3, i16* %child, align 2, !dbg !402
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !404, metadata !DIExpression()), !dbg !405
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !406
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !407
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !407
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !407
  %5 = load i16, i16* %letter4, align 2, !dbg !407
  store i16 %5, i16* %letter, align 2, !dbg !406
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !406
  store i16 0, i16* %sibling, align 2, !dbg !406
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !406
  store i16 0, i16* %child5, align 2, !dbg !406
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !408
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !408
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !410
  %7 = load i16, i16* %child7, align 2, !dbg !410
  %cmp8 = icmp eq i16 %7, 0, !dbg !411
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !412

if.then9:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !413, metadata !DIExpression()), !dbg !415
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !416
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !416
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !416
  %9 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !416
  %10 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %9, i8* align 2 %10, i16 6, i1 false), !dbg !416
  %11 = load i16, i16* %child, align 2, !dbg !417
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !418
  store i16 %11, i16* %child12, align 2, !dbg !419
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !420
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !420
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !420
  %13 = load i16, i16* %parent, align 2, !dbg !420
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !421
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !421
  %write1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 16, !dbg !421
  store i16 %13, i16* %write1, align 2, !dbg !422
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !423
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !423
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 5, !dbg !423
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !424
  %write117 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 16, !dbg !424
  %17 = load i16, i16* %write117, align 2, !dbg !424
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %17, !dbg !423
  %18 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !425
  %19 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !425
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %19, i16 6, i1 false), !dbg !425
  br label %if.end28, !dbg !426

if.else:                                          ; preds = %if.end
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !427
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !427
  %sibling19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8, !dbg !427
  %21 = load i16, i16* %sibling19, align 2, !dbg !427
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !429
  %write2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 17, !dbg !429
  store i16 %21, i16* %write2, align 2, !dbg !430
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !431, metadata !DIExpression()), !dbg !432
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !433
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !433
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 14, !dbg !433
  %24 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !433
  %25 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !433
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %24, i8* align 2 %25, i16 6, i1 false), !dbg !433
  %26 = load i16, i16* %child, align 2, !dbg !434
  %sibling22 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !435
  store i16 %26, i16* %sibling22, align 2, !dbg !436
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !437
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !437
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !437
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !438
  %write226 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 17, !dbg !438
  %29 = load i16, i16* %write226, align 2, !dbg !438
  %arrayidx27 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict24, i16 0, i16 %29, !dbg !437
  %30 = bitcast %struct._node_t* %arrayidx27 to i8*, !dbg !439
  %31 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !439
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %30, i8* align 2 %31, i16 6, i1 false), !dbg !439
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then9
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !440
  %dict30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 5, !dbg !440
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !441
  %child32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 9, !dbg !441
  %34 = load i16, i16* %child32, align 2, !dbg !441
  %arrayidx33 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict30, i16 0, i16 %34, !dbg !440
  %35 = bitcast %struct._node_t* %arrayidx33 to i8*, !dbg !442
  %36 = bitcast %struct._node_t* %child_node to i8*, !dbg !442
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %35, i8* align 2 %36, i16 6, i1 false), !dbg !442
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !443
  %parent35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 10, !dbg !443
  %38 = load i16, i16* %parent35, align 2, !dbg !443
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !444
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !444
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals36, i32 0, i32 15, !dbg !444
  store i16 %38, i16* %symbol, align 2, !dbg !445
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !446
  %node_count38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 4, !dbg !446
  %41 = load i16, i16* %node_count38, align 2, !dbg !447
  %inc = add i16 %41, 1, !dbg !447
  store i16 %inc, i16* %node_count38, align 2, !dbg !447
  ret void, !dbg !448
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() #0 !dbg !449 {
entry:
  %copy = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !450
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !450
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !450
  %1 = load i16, i16* %out_len, align 2, !dbg !450
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !451
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !451
  %write1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 16, !dbg !451
  store i16 %1, i16* %write1, align 2, !dbg !452
  call void @llvm.dbg.declare(metadata %struct._node_t* %copy, metadata !453, metadata !DIExpression()), !dbg !454
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %copy, i32 0, i32 0, !dbg !455
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !456
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !456
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 15, !dbg !456
  %4 = load i16, i16* %symbol, align 2, !dbg !456
  store i16 %4, i16* %letter, align 2, !dbg !455
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %copy, i32 0, i32 1, !dbg !455
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !457
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !457
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 13, !dbg !457
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !458
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !458
  %write15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 16, !dbg !458
  %7 = load i16, i16* %write15, align 2, !dbg !458
  %arrayidx = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %compressed_data, i16 0, i16 %7, !dbg !457
  %sibling6 = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 1, !dbg !459
  %8 = load i16, i16* %sibling6, align 2, !dbg !459
  store i16 %8, i16* %sibling, align 2, !dbg !455
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %copy, i32 0, i32 2, !dbg !455
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !460
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !460
  %compressed_data8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 13, !dbg !460
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !461
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !461
  %write110 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !461
  %11 = load i16, i16* %write110, align 2, !dbg !461
  %arrayidx11 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %compressed_data8, i16 0, i16 %11, !dbg !460
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx11, i32 0, i32 2, !dbg !462
  %12 = load i16, i16* %child12, align 2, !dbg !462
  store i16 %12, i16* %child, align 2, !dbg !455
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !463
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !463
  %compressed_data14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 13, !dbg !463
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !464
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !464
  %write116 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 16, !dbg !464
  %15 = load i16, i16* %write116, align 2, !dbg !464
  %arrayidx17 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %compressed_data14, i16 0, i16 %15, !dbg !463
  %16 = bitcast %struct._node_t* %arrayidx17 to i8*, !dbg !465
  %17 = bitcast %struct._node_t* %copy to i8*, !dbg !465
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %16, i8* align 2 %17, i16 6, i1 false), !dbg !465
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !466
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !466
  %out_len19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !466
  %19 = load i16, i16* %out_len19, align 2, !dbg !468
  %inc = add i16 %19, 1, !dbg !468
  store i16 %inc, i16* %out_len19, align 2, !dbg !468
  %cmp = icmp eq i16 %inc, 64, !dbg !469
  br i1 %cmp, label %if.then, label %if.else, !dbg !470

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !471

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !473
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !474 {
entry:
  call void @exit(i16 0) #6, !dbg !475
  unreachable, !dbg !475
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !476 {
entry:
  ret void, !dbg !477
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !478 {
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
  %__x23 = alloca i16, align 2
  %tmp24 = alloca i16, align 2
  %__x26 = alloca i16, align 2
  %tmp27 = alloca i16, align 2
  %__x36 = alloca i16, align 2
  %tmp37 = alloca i16, align 2
  %__x39 = alloca i16, align 2
  %tmp40 = alloca i16, align 2
  %__x56 = alloca i16, align 2
  %tmp57 = alloca i16, align 2
  %__x59 = alloca i16, align 2
  %tmp60 = alloca i16, align 2
  %__x69 = alloca i16, align 2
  %tmp70 = alloca i16, align 2
  %__x72 = alloca i16, align 2
  %tmp73 = alloca i16, align 2
  %__x89 = alloca i16, align 2
  %tmp90 = alloca i16, align 2
  %__x92 = alloca i16, align 2
  %tmp93 = alloca i16, align 2
  %__x102 = alloca i16, align 2
  %tmp103 = alloca i16, align 2
  %__x105 = alloca i16, align 2
  %tmp106 = alloca i16, align 2
  %__x119 = alloca i16, align 2
  %tmp120 = alloca i16, align 2
  %__x122 = alloca i16, align 2
  %tmp123 = alloca i16, align 2
  %__x132 = alloca i16, align 2
  %tmp133 = alloca i16, align 2
  %__x135 = alloca i16, align 2
  %tmp136 = alloca i16, align 2
  %__x154 = alloca i16, align 2
  %tmp155 = alloca i16, align 2
  %__x157 = alloca i16, align 2
  %tmp158 = alloca i16, align 2
  %__x167 = alloca i16, align 2
  %tmp168 = alloca i16, align 2
  %__x170 = alloca i16, align 2
  %tmp171 = alloca i16, align 2
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
  %__x261 = alloca i16, align 2
  %tmp262 = alloca i16, align 2
  %__x264 = alloca i16, align 2
  %tmp265 = alloca i16, align 2
  %__x274 = alloca i16, align 2
  %tmp275 = alloca i16, align 2
  %__x277 = alloca i16, align 2
  %tmp278 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !481
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !482
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !483
  call void @camel_init(), !dbg !484
  call void @task_init(), !dbg !485
  br label %do.body, !dbg !486

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !487
  %cmp = icmp eq i16 %0, 1, !dbg !487
  br i1 %cmp, label %if.then, label %if.else, !dbg !490

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !491
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !491
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !491
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !491
  call void @__dump_registers(i16* %arraydecay), !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !493, metadata !DIExpression()), !dbg !495
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !495, !srcloc !496
  store i16 %2, i16* %__x, align 2, !dbg !495
  %3 = load i16, i16* %__x, align 2, !dbg !495
  store i16 %3, i16* %tmp, align 2, !dbg !495
  %4 = load i16, i16* %tmp, align 2, !dbg !495
  %add = add i16 %4, 2, !dbg !491
  %5 = inttoptr i16 %add to i8*, !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !497, metadata !DIExpression()), !dbg !499
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !499, !srcloc !500
  store i16 %6, i16* %__x1, align 2, !dbg !499
  %7 = load i16, i16* %__x1, align 2, !dbg !499
  store i16 %7, i16* %tmp2, align 2, !dbg !499
  %8 = load i16, i16* %tmp2, align 2, !dbg !499
  %add3 = add i16 %8, 2, !dbg !491
  %sub = sub i16 9216, %add3, !dbg !491
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !491
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !491
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !491
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !491
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 3520, i16 zeroext %11), !dbg !491
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !491
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !491
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !491
  br label %if.end, !dbg !491

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !501
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !501
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !501
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !501
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !501
  call void @__dump_registers(i16* %arraydecay6), !dbg !501
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !503, metadata !DIExpression()), !dbg !505
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !505, !srcloc !506
  store i16 %15, i16* %__x7, align 2, !dbg !505
  %16 = load i16, i16* %__x7, align 2, !dbg !505
  store i16 %16, i16* %tmp8, align 2, !dbg !505
  %17 = load i16, i16* %tmp8, align 2, !dbg !505
  %add9 = add i16 %17, 2, !dbg !501
  %18 = inttoptr i16 %add9 to i8*, !dbg !501
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !507, metadata !DIExpression()), !dbg !509
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !509, !srcloc !510
  store i16 %19, i16* %__x10, align 2, !dbg !509
  %20 = load i16, i16* %__x10, align 2, !dbg !509
  store i16 %20, i16* %tmp11, align 2, !dbg !509
  %21 = load i16, i16* %tmp11, align 2, !dbg !509
  %add12 = add i16 %21, 2, !dbg !501
  %sub13 = sub i16 9216, %add12, !dbg !501
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !501
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !501
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !501
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !501
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !501
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 3520, i16 zeroext %24), !dbg !501
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !501
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !501
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !501
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !501
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !501
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !501
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !490

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !511
  br label %while.cond, !dbg !512

while.cond:                                       ; preds = %do.end286, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !513
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !513
  %28 = load i16, i16* %out_len, align 2, !dbg !513
  %cmp17 = icmp ult i16 %28, 64, !dbg !514
  br i1 %cmp17, label %while.body, label %while.end287, !dbg !512

while.body:                                       ; preds = %while.cond
  %tmp1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp1, i32 0, i32 1
  %global2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp3 = load i16, i16* %global2, align 2
  %tmp4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp4, i32 0, i32 1
  %global6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global5, i32 0, i32 1
  store i16 %tmp3, i16* %global6, align 2
  call void @task_sample(), !dbg !515
  br label %do.body18, !dbg !517

do.body18:                                        ; preds = %while.body
  %29 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !518
  %cmp19 = icmp eq i16 %29, 1, !dbg !518
  br i1 %cmp19, label %if.then20, label %if.else33, !dbg !521

if.then20:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !522
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !522
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %reg_file21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 0, !dbg !522
  %arraydecay22 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file21, i16 0, i16 0, !dbg !522
  call void @__dump_registers(i16* %arraydecay22), !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x23, metadata !524, metadata !DIExpression()), !dbg !526
  %31 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !526, !srcloc !527
  store i16 %31, i16* %__x23, align 2, !dbg !526
  %32 = load i16, i16* %__x23, align 2, !dbg !526
  store i16 %32, i16* %tmp24, align 2, !dbg !526
  %33 = load i16, i16* %tmp24, align 2, !dbg !526
  %add25 = add i16 %33, 2, !dbg !522
  %34 = inttoptr i16 %add25 to i8*, !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !528, metadata !DIExpression()), !dbg !530
  %35 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !530, !srcloc !531
  store i16 %35, i16* %__x26, align 2, !dbg !530
  %36 = load i16, i16* %__x26, align 2, !dbg !530
  store i16 %36, i16* %tmp27, align 2, !dbg !530
  %37 = load i16, i16* %tmp27, align 2, !dbg !530
  %add28 = add i16 %37, 2, !dbg !522
  %sub29 = sub i16 9216, %add28, !dbg !522
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext %sub29, i16 zeroext -1), !dbg !522
  store i16 %call30, i16* @tmp_stack_crc, align 2, !dbg !522
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %39 = bitcast %struct.camel_buffer_t* %38 to i8*, !dbg !522
  %40 = load i16, i16* @tmp_stack_crc, align 2, !dbg !522
  %call31 = call zeroext i16 @__fast_hw_crc(i8* %39, i16 zeroext 3520, i16 zeroext %40), !dbg !522
  store i16 %call31, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %41 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %stack_and_buf_crc32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 2, !dbg !522
  store i16 %41, i16* %stack_and_buf_crc32, align 2, !dbg !522
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !522
  br label %if.end46, !dbg !522

if.else33:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !532
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !532
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %reg_file34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !532
  %arraydecay35 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file34, i16 0, i16 0, !dbg !532
  call void @__dump_registers(i16* %arraydecay35), !dbg !532
  call void @llvm.dbg.declare(metadata i16* %__x36, metadata !534, metadata !DIExpression()), !dbg !536
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !536, !srcloc !537
  store i16 %44, i16* %__x36, align 2, !dbg !536
  %45 = load i16, i16* %__x36, align 2, !dbg !536
  store i16 %45, i16* %tmp37, align 2, !dbg !536
  %46 = load i16, i16* %tmp37, align 2, !dbg !536
  %add38 = add i16 %46, 2, !dbg !532
  %47 = inttoptr i16 %add38 to i8*, !dbg !532
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !538, metadata !DIExpression()), !dbg !540
  %48 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !540, !srcloc !541
  store i16 %48, i16* %__x39, align 2, !dbg !540
  %49 = load i16, i16* %__x39, align 2, !dbg !540
  store i16 %49, i16* %tmp40, align 2, !dbg !540
  %50 = load i16, i16* %tmp40, align 2, !dbg !540
  %add41 = add i16 %50, 2, !dbg !532
  %sub42 = sub i16 9216, %add41, !dbg !532
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext %sub42, i16 zeroext -1), !dbg !532
  store i16 %call43, i16* @tmp_stack_crc, align 2, !dbg !532
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %52 = bitcast %struct.camel_buffer_t* %51 to i8*, !dbg !532
  %53 = load i16, i16* @tmp_stack_crc, align 2, !dbg !532
  %call44 = call zeroext i16 @__fast_hw_crc(i8* %52, i16 zeroext 3520, i16 zeroext %53), !dbg !532
  store i16 %call44, i16* @tmp_stack_buf_crc, align 2, !dbg !532
  %54 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !532
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %stack_and_buf_crc45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 2, !dbg !532
  store i16 %54, i16* %stack_and_buf_crc45, align 2, !dbg !532
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !532
  br label %if.end46

if.end46:                                         ; preds = %if.else33, %if.then20
  br label %do.end47, !dbg !521

do.end47:                                         ; preds = %if.end46
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i32 0, i32 1
  %global9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global8, i32 0, i32 1
  %tmp10 = load i16, i16* %global9, align 2
  %tmp12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp12, i32 0, i32 1
  %global14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global13, i32 0, i32 1
  store i16 %tmp10, i16* %global14, align 2
  %tmp15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp15, i32 0, i32 1
  %global17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global16, i32 0, i32 18
  %tmp18 = load i16, i16* %global17, align 2
  %tmp19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp19, i32 0, i32 1
  %global21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global20, i32 0, i32 18
  store i16 %tmp18, i16* %global21, align 2
  call void @task_commit(), !dbg !542
  %56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !543
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %56, i32 0, i32 1, !dbg !543
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 18, !dbg !543
  %57 = load i16, i16* %check, align 2, !dbg !543
  %cmp49 = icmp eq i16 %57, 0, !dbg !545
  br i1 %cmp49, label %if.then50, label %if.end81, !dbg !546

if.then50:                                        ; preds = %do.end47
  %tmp22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp22, i32 0, i32 1
  %global24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global23, i32 0, i32 2
  %tmp25 = load i16, i16* %global24, align 2
  %tmp26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp26, i32 0, i32 1
  %global28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global27, i32 0, i32 2
  store i16 %tmp25, i16* %global28, align 2
  call void @task_measure_temp(), !dbg !547
  br label %do.body51, !dbg !549

do.body51:                                        ; preds = %if.then50
  %58 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !550
  %cmp52 = icmp eq i16 %58, 1, !dbg !550
  br i1 %cmp52, label %if.then53, label %if.else66, !dbg !553

if.then53:                                        ; preds = %do.body51
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !554
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %reg_file54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 0, !dbg !554
  %arraydecay55 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file54, i16 0, i16 0, !dbg !554
  call void @__dump_registers(i16* %arraydecay55), !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x56, metadata !556, metadata !DIExpression()), !dbg !558
  %60 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !558, !srcloc !559
  store i16 %60, i16* %__x56, align 2, !dbg !558
  %61 = load i16, i16* %__x56, align 2, !dbg !558
  store i16 %61, i16* %tmp57, align 2, !dbg !558
  %62 = load i16, i16* %tmp57, align 2, !dbg !558
  %add58 = add i16 %62, 2, !dbg !554
  %63 = inttoptr i16 %add58 to i8*, !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x59, metadata !560, metadata !DIExpression()), !dbg !562
  %64 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !562, !srcloc !563
  store i16 %64, i16* %__x59, align 2, !dbg !562
  %65 = load i16, i16* %__x59, align 2, !dbg !562
  store i16 %65, i16* %tmp60, align 2, !dbg !562
  %66 = load i16, i16* %tmp60, align 2, !dbg !562
  %add61 = add i16 %66, 2, !dbg !554
  %sub62 = sub i16 9216, %add61, !dbg !554
  %call63 = call zeroext i16 @__fast_hw_crc(i8* %63, i16 zeroext %sub62, i16 zeroext -1), !dbg !554
  store i16 %call63, i16* @tmp_stack_crc, align 2, !dbg !554
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %68 = bitcast %struct.camel_buffer_t* %67 to i8*, !dbg !554
  %69 = load i16, i16* @tmp_stack_crc, align 2, !dbg !554
  %call64 = call zeroext i16 @__fast_hw_crc(i8* %68, i16 zeroext 3520, i16 zeroext %69), !dbg !554
  store i16 %call64, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %70 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %71 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %stack_and_buf_crc65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %71, i32 0, i32 2, !dbg !554
  store i16 %70, i16* %stack_and_buf_crc65, align 2, !dbg !554
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !554
  br label %if.end79, !dbg !554

if.else66:                                        ; preds = %do.body51
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !564
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !564
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !564
  %reg_file67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i32 0, i32 0, !dbg !564
  %arraydecay68 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file67, i16 0, i16 0, !dbg !564
  call void @__dump_registers(i16* %arraydecay68), !dbg !564
  call void @llvm.dbg.declare(metadata i16* %__x69, metadata !566, metadata !DIExpression()), !dbg !568
  %73 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !568, !srcloc !569
  store i16 %73, i16* %__x69, align 2, !dbg !568
  %74 = load i16, i16* %__x69, align 2, !dbg !568
  store i16 %74, i16* %tmp70, align 2, !dbg !568
  %75 = load i16, i16* %tmp70, align 2, !dbg !568
  %add71 = add i16 %75, 2, !dbg !564
  %76 = inttoptr i16 %add71 to i8*, !dbg !564
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !570, metadata !DIExpression()), !dbg !572
  %77 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !572, !srcloc !573
  store i16 %77, i16* %__x72, align 2, !dbg !572
  %78 = load i16, i16* %__x72, align 2, !dbg !572
  store i16 %78, i16* %tmp73, align 2, !dbg !572
  %79 = load i16, i16* %tmp73, align 2, !dbg !572
  %add74 = add i16 %79, 2, !dbg !564
  %sub75 = sub i16 9216, %add74, !dbg !564
  %call76 = call zeroext i16 @__fast_hw_crc(i8* %76, i16 zeroext %sub75, i16 zeroext -1), !dbg !564
  store i16 %call76, i16* @tmp_stack_crc, align 2, !dbg !564
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !564
  %81 = bitcast %struct.camel_buffer_t* %80 to i8*, !dbg !564
  %82 = load i16, i16* @tmp_stack_crc, align 2, !dbg !564
  %call77 = call zeroext i16 @__fast_hw_crc(i8* %81, i16 zeroext 3520, i16 zeroext %82), !dbg !564
  store i16 %call77, i16* @tmp_stack_buf_crc, align 2, !dbg !564
  %83 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !564
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !564
  %stack_and_buf_crc78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 2, !dbg !564
  store i16 %83, i16* %stack_and_buf_crc78, align 2, !dbg !564
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !564
  br label %if.end79

if.end79:                                         ; preds = %if.else66, %if.then53
  br label %do.end80, !dbg !553

do.end80:                                         ; preds = %if.end79
  %tmp29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp29, i32 0, i32 1
  %global31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global30, i32 0, i32 2
  %tmp32 = load i16, i16* %global31, align 2
  %tmp33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp33, i32 0, i32 1
  %global35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global34, i32 0, i32 2
  store i16 %tmp32, i16* %global35, align 2
  %tmp36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp36, i32 0, i32 1
  %global38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global37, i32 0, i32 6
  %tmp39 = load i16, i16* %global38, align 2
  %tmp41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp41, i32 0, i32 1
  %global43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global42, i32 0, i32 6
  store i16 %tmp39, i16* %global43, align 2
  call void @task_commit(), !dbg !574
  br label %if.end81, !dbg !575

if.end81:                                         ; preds = %do.end80, %do.end47
  br label %while.body83, !dbg !576

while.body83:                                     ; preds = %if.end81, %if.end183
  %tmp44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp44, i32 0, i32 1
  %global46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global45, i32 0, i32 1
  %tmp47 = load i16, i16* %global46, align 2
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 1
  store i16 %tmp47, i16* %global50, align 2
  %tmp51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i32 0, i32 1
  %global53 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global52, i32 0, i32 6
  %tmp54 = load i16, i16* %global53, align 2
  %tmp55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp55, i32 0, i32 1
  %global57 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global56, i32 0, i32 6
  store i16 %tmp54, i16* %global57, align 2
  call void @task_letterize(), !dbg !577
  br label %do.body84, !dbg !579

do.body84:                                        ; preds = %while.body83
  %85 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !580
  %cmp85 = icmp eq i16 %85, 1, !dbg !580
  br i1 %cmp85, label %if.then86, label %if.else99, !dbg !583

if.then86:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !584
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !584
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !584
  %reg_file87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 0, !dbg !584
  %arraydecay88 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file87, i16 0, i16 0, !dbg !584
  call void @__dump_registers(i16* %arraydecay88), !dbg !584
  call void @llvm.dbg.declare(metadata i16* %__x89, metadata !586, metadata !DIExpression()), !dbg !588
  %87 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !588, !srcloc !589
  store i16 %87, i16* %__x89, align 2, !dbg !588
  %88 = load i16, i16* %__x89, align 2, !dbg !588
  store i16 %88, i16* %tmp90, align 2, !dbg !588
  %89 = load i16, i16* %tmp90, align 2, !dbg !588
  %add91 = add i16 %89, 2, !dbg !584
  %90 = inttoptr i16 %add91 to i8*, !dbg !584
  call void @llvm.dbg.declare(metadata i16* %__x92, metadata !590, metadata !DIExpression()), !dbg !592
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !592, !srcloc !593
  store i16 %91, i16* %__x92, align 2, !dbg !592
  %92 = load i16, i16* %__x92, align 2, !dbg !592
  store i16 %92, i16* %tmp93, align 2, !dbg !592
  %93 = load i16, i16* %tmp93, align 2, !dbg !592
  %add94 = add i16 %93, 2, !dbg !584
  %sub95 = sub i16 9216, %add94, !dbg !584
  %call96 = call zeroext i16 @__fast_hw_crc(i8* %90, i16 zeroext %sub95, i16 zeroext -1), !dbg !584
  store i16 %call96, i16* @tmp_stack_crc, align 2, !dbg !584
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !584
  %95 = bitcast %struct.camel_buffer_t* %94 to i8*, !dbg !584
  %96 = load i16, i16* @tmp_stack_crc, align 2, !dbg !584
  %call97 = call zeroext i16 @__fast_hw_crc(i8* %95, i16 zeroext 3520, i16 zeroext %96), !dbg !584
  store i16 %call97, i16* @tmp_stack_buf_crc, align 2, !dbg !584
  %97 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !584
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !584
  %stack_and_buf_crc98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %98, i32 0, i32 2, !dbg !584
  store i16 %97, i16* %stack_and_buf_crc98, align 2, !dbg !584
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !584
  br label %if.end112, !dbg !584

if.else99:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !594
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !594
  %99 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !594
  %reg_file100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %99, i32 0, i32 0, !dbg !594
  %arraydecay101 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file100, i16 0, i16 0, !dbg !594
  call void @__dump_registers(i16* %arraydecay101), !dbg !594
  call void @llvm.dbg.declare(metadata i16* %__x102, metadata !596, metadata !DIExpression()), !dbg !598
  %100 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !598, !srcloc !599
  store i16 %100, i16* %__x102, align 2, !dbg !598
  %101 = load i16, i16* %__x102, align 2, !dbg !598
  store i16 %101, i16* %tmp103, align 2, !dbg !598
  %102 = load i16, i16* %tmp103, align 2, !dbg !598
  %add104 = add i16 %102, 2, !dbg !594
  %103 = inttoptr i16 %add104 to i8*, !dbg !594
  call void @llvm.dbg.declare(metadata i16* %__x105, metadata !600, metadata !DIExpression()), !dbg !602
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !602, !srcloc !603
  store i16 %104, i16* %__x105, align 2, !dbg !602
  %105 = load i16, i16* %__x105, align 2, !dbg !602
  store i16 %105, i16* %tmp106, align 2, !dbg !602
  %106 = load i16, i16* %tmp106, align 2, !dbg !602
  %add107 = add i16 %106, 2, !dbg !594
  %sub108 = sub i16 9216, %add107, !dbg !594
  %call109 = call zeroext i16 @__fast_hw_crc(i8* %103, i16 zeroext %sub108, i16 zeroext -1), !dbg !594
  store i16 %call109, i16* @tmp_stack_crc, align 2, !dbg !594
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !594
  %108 = bitcast %struct.camel_buffer_t* %107 to i8*, !dbg !594
  %109 = load i16, i16* @tmp_stack_crc, align 2, !dbg !594
  %call110 = call zeroext i16 @__fast_hw_crc(i8* %108, i16 zeroext 3520, i16 zeroext %109), !dbg !594
  store i16 %call110, i16* @tmp_stack_buf_crc, align 2, !dbg !594
  %110 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !594
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !594
  %stack_and_buf_crc111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 2, !dbg !594
  store i16 %110, i16* %stack_and_buf_crc111, align 2, !dbg !594
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !594
  br label %if.end112

if.end112:                                        ; preds = %if.else99, %if.then86
  br label %do.end113, !dbg !583

do.end113:                                        ; preds = %if.end112
  %tmp58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp58, i32 0, i32 1
  %global60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global59, i32 0, i32 0
  %tmp61 = load i16, i16* %global60, align 2
  %tmp62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp62, i32 0, i32 1
  %global64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global63, i32 0, i32 0
  store i16 %tmp61, i16* %global64, align 2
  call void @task_commit(), !dbg !604
  %tmp65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp65, i32 0, i32 1
  %global67 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global66, i32 0, i32 11
  %tmp68 = load i16, i16* %global67, align 2
  %tmp69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp69, i32 0, i32 1
  %global71 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global70, i32 0, i32 11
  store i16 %tmp68, i16* %global71, align 2
  %tmp72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global73 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp72, i32 0, i32 1
  %global74 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global73, i32 0, i32 5
  %array = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global74, i16 0, i16 0
  %cast = bitcast %struct._node_t* %array to i8*
  %tmp75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp75, i32 0, i32 1
  %global77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global76, i32 0, i32 5
  %array78 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global77, i16 0, i16 0
  %cast79 = bitcast %struct._node_t* %array78 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast, i8* align 2 %cast79, i64 6, i1 false), !dbg !605
  %tmp80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp80, i32 0, i32 1
  %global82 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global81, i32 0, i32 7
  %tmp83 = load i16, i16* %global82, align 2
  %tmp84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i32 0, i32 1
  %global86 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global85, i32 0, i32 7
  store i16 %tmp83, i16* %global86, align 2
  call void @task_compress(), !dbg !605
  br label %do.body114, !dbg !606

do.body114:                                       ; preds = %do.end113
  %112 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !607
  %cmp115 = icmp eq i16 %112, 1, !dbg !607
  br i1 %cmp115, label %if.then116, label %if.else129, !dbg !610

if.then116:                                       ; preds = %do.body114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !611
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %reg_file117 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i32 0, i32 0, !dbg !611
  %arraydecay118 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file117, i16 0, i16 0, !dbg !611
  call void @__dump_registers(i16* %arraydecay118), !dbg !611
  call void @llvm.dbg.declare(metadata i16* %__x119, metadata !613, metadata !DIExpression()), !dbg !615
  %114 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !615, !srcloc !616
  store i16 %114, i16* %__x119, align 2, !dbg !615
  %115 = load i16, i16* %__x119, align 2, !dbg !615
  store i16 %115, i16* %tmp120, align 2, !dbg !615
  %116 = load i16, i16* %tmp120, align 2, !dbg !615
  %add121 = add i16 %116, 2, !dbg !611
  %117 = inttoptr i16 %add121 to i8*, !dbg !611
  call void @llvm.dbg.declare(metadata i16* %__x122, metadata !617, metadata !DIExpression()), !dbg !619
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !619, !srcloc !620
  store i16 %118, i16* %__x122, align 2, !dbg !619
  %119 = load i16, i16* %__x122, align 2, !dbg !619
  store i16 %119, i16* %tmp123, align 2, !dbg !619
  %120 = load i16, i16* %tmp123, align 2, !dbg !619
  %add124 = add i16 %120, 2, !dbg !611
  %sub125 = sub i16 9216, %add124, !dbg !611
  %call126 = call zeroext i16 @__fast_hw_crc(i8* %117, i16 zeroext %sub125, i16 zeroext -1), !dbg !611
  store i16 %call126, i16* @tmp_stack_crc, align 2, !dbg !611
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %122 = bitcast %struct.camel_buffer_t* %121 to i8*, !dbg !611
  %123 = load i16, i16* @tmp_stack_crc, align 2, !dbg !611
  %call127 = call zeroext i16 @__fast_hw_crc(i8* %122, i16 zeroext 3520, i16 zeroext %123), !dbg !611
  store i16 %call127, i16* @tmp_stack_buf_crc, align 2, !dbg !611
  %124 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !611
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %stack_and_buf_crc128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %125, i32 0, i32 2, !dbg !611
  store i16 %124, i16* %stack_and_buf_crc128, align 2, !dbg !611
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !611
  br label %if.end142, !dbg !611

if.else129:                                       ; preds = %do.body114
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !621
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !621
  %126 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !621
  %reg_file130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %126, i32 0, i32 0, !dbg !621
  %arraydecay131 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file130, i16 0, i16 0, !dbg !621
  call void @__dump_registers(i16* %arraydecay131), !dbg !621
  call void @llvm.dbg.declare(metadata i16* %__x132, metadata !623, metadata !DIExpression()), !dbg !625
  %127 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !625, !srcloc !626
  store i16 %127, i16* %__x132, align 2, !dbg !625
  %128 = load i16, i16* %__x132, align 2, !dbg !625
  store i16 %128, i16* %tmp133, align 2, !dbg !625
  %129 = load i16, i16* %tmp133, align 2, !dbg !625
  %add134 = add i16 %129, 2, !dbg !621
  %130 = inttoptr i16 %add134 to i8*, !dbg !621
  call void @llvm.dbg.declare(metadata i16* %__x135, metadata !627, metadata !DIExpression()), !dbg !629
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !629, !srcloc !630
  store i16 %131, i16* %__x135, align 2, !dbg !629
  %132 = load i16, i16* %__x135, align 2, !dbg !629
  store i16 %132, i16* %tmp136, align 2, !dbg !629
  %133 = load i16, i16* %tmp136, align 2, !dbg !629
  %add137 = add i16 %133, 2, !dbg !621
  %sub138 = sub i16 9216, %add137, !dbg !621
  %call139 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext %sub138, i16 zeroext -1), !dbg !621
  store i16 %call139, i16* @tmp_stack_crc, align 2, !dbg !621
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !621
  %135 = bitcast %struct.camel_buffer_t* %134 to i8*, !dbg !621
  %136 = load i16, i16* @tmp_stack_crc, align 2, !dbg !621
  %call140 = call zeroext i16 @__fast_hw_crc(i8* %135, i16 zeroext 3520, i16 zeroext %136), !dbg !621
  store i16 %call140, i16* @tmp_stack_buf_crc, align 2, !dbg !621
  %137 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !621
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !621
  %stack_and_buf_crc141 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %138, i32 0, i32 2, !dbg !621
  store i16 %137, i16* %stack_and_buf_crc141, align 2, !dbg !621
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !621
  br label %if.end142

if.end142:                                        ; preds = %if.else129, %if.then116
  br label %do.end143, !dbg !610

do.end143:                                        ; preds = %if.end142
  %tmp87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp87, i32 0, i32 1
  %global89 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global88, i32 0, i32 8
  %tmp91 = load i16, i16* %global89, align 2
  %tmp92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp92, i32 0, i32 1
  %global94 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global93, i32 0, i32 8
  store i16 %tmp91, i16* %global94, align 2
  %tmp95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp95, i32 0, i32 1
  %global97 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global96, i32 0, i32 12
  %tmp98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i32 0, i32 1
  %global100 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global99, i32 0, i32 12
  %cast101 = bitcast %struct._node_t* %global97 to i8*
  %cast102 = bitcast %struct._node_t* %global100 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast101, i8* align 2 %cast102, i64 6, i1 false), !dbg !631
  %tmp104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp104, i32 0, i32 1
  %global106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global105, i32 0, i32 10
  %tmp107 = load i16, i16* %global106, align 2
  %tmp108 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp108, i32 0, i32 1
  %global110 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global109, i32 0, i32 10
  store i16 %tmp107, i16* %global110, align 2
  %tmp111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp111, i32 0, i32 1
  %global113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global112, i32 0, i32 9
  %tmp114 = load i16, i16* %global113, align 2
  %tmp115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp115, i32 0, i32 1
  %global117 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global116, i32 0, i32 9
  store i16 %tmp114, i16* %global117, align 2
  %tmp118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global119 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp118, i32 0, i32 1
  %global120 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global119, i32 0, i32 7
  %tmp121 = load i16, i16* %global120, align 2
  %tmp122 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp122, i32 0, i32 1
  %global124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global123, i32 0, i32 7
  store i16 %tmp121, i16* %global124, align 2
  call void @task_commit(), !dbg !631
  br label %while.cond144, !dbg !632

while.cond144:                                    ; preds = %do.end178, %do.end143
  %139 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !633
  %globals145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %139, i32 0, i32 1, !dbg !633
  %check146 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals145, i32 0, i32 18, !dbg !633
  %140 = load i16, i16* %check146, align 2, !dbg !633
  %cmp147 = icmp eq i16 %140, 1, !dbg !634
  br i1 %cmp147, label %while.body148, label %while.end, !dbg !632

while.body148:                                    ; preds = %while.cond144
  %tmp125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp125, i32 0, i32 1
  %global127 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global126, i32 0, i32 8
  %tmp128 = load i16, i16* %global127, align 2
  %tmp129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp129, i32 0, i32 1
  %global131 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global130, i32 0, i32 8
  store i16 %tmp128, i16* %global131, align 2
  %tmp132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i32 0, i32 1
  %global134 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global133, i32 0, i32 0
  %tmp135 = load i16, i16* %global134, align 2
  %tmp137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp137, i32 0, i32 1
  %global139 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global138, i32 0, i32 0
  store i16 %tmp135, i16* %global139, align 2
  %tmp140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global141 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp140, i32 0, i32 1
  %global142 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global141, i32 0, i32 9
  %tmp143 = load i16, i16* %global142, align 2
  %tmp144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i32 0, i32 1
  %global146 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global145, i32 0, i32 9
  store i16 %tmp143, i16* %global146, align 2
  call void @task_find_sibling(), !dbg !635
  br label %do.body149, !dbg !637

do.body149:                                       ; preds = %while.body148
  %141 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !638
  %cmp150 = icmp eq i16 %141, 1, !dbg !638
  br i1 %cmp150, label %if.then151, label %if.else164, !dbg !641

if.then151:                                       ; preds = %do.body149
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !642
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !642
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %reg_file152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %142, i32 0, i32 0, !dbg !642
  %arraydecay153 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file152, i16 0, i16 0, !dbg !642
  call void @__dump_registers(i16* %arraydecay153), !dbg !642
  call void @llvm.dbg.declare(metadata i16* %__x154, metadata !644, metadata !DIExpression()), !dbg !646
  %143 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !646, !srcloc !647
  store i16 %143, i16* %__x154, align 2, !dbg !646
  %144 = load i16, i16* %__x154, align 2, !dbg !646
  store i16 %144, i16* %tmp155, align 2, !dbg !646
  %145 = load i16, i16* %tmp155, align 2, !dbg !646
  %add156 = add i16 %145, 2, !dbg !642
  %146 = inttoptr i16 %add156 to i8*, !dbg !642
  call void @llvm.dbg.declare(metadata i16* %__x157, metadata !648, metadata !DIExpression()), !dbg !650
  %147 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !650, !srcloc !651
  store i16 %147, i16* %__x157, align 2, !dbg !650
  %148 = load i16, i16* %__x157, align 2, !dbg !650
  store i16 %148, i16* %tmp158, align 2, !dbg !650
  %149 = load i16, i16* %tmp158, align 2, !dbg !650
  %add159 = add i16 %149, 2, !dbg !642
  %sub160 = sub i16 9216, %add159, !dbg !642
  %call161 = call zeroext i16 @__fast_hw_crc(i8* %146, i16 zeroext %sub160, i16 zeroext -1), !dbg !642
  store i16 %call161, i16* @tmp_stack_crc, align 2, !dbg !642
  %150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %151 = bitcast %struct.camel_buffer_t* %150 to i8*, !dbg !642
  %152 = load i16, i16* @tmp_stack_crc, align 2, !dbg !642
  %call162 = call zeroext i16 @__fast_hw_crc(i8* %151, i16 zeroext 3520, i16 zeroext %152), !dbg !642
  store i16 %call162, i16* @tmp_stack_buf_crc, align 2, !dbg !642
  %153 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !642
  %154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %stack_and_buf_crc163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %154, i32 0, i32 2, !dbg !642
  store i16 %153, i16* %stack_and_buf_crc163, align 2, !dbg !642
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !642
  br label %if.end177, !dbg !642

if.else164:                                       ; preds = %do.body149
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !652
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !652
  %155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %reg_file165 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %155, i32 0, i32 0, !dbg !652
  %arraydecay166 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file165, i16 0, i16 0, !dbg !652
  call void @__dump_registers(i16* %arraydecay166), !dbg !652
  call void @llvm.dbg.declare(metadata i16* %__x167, metadata !654, metadata !DIExpression()), !dbg !656
  %156 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !656, !srcloc !657
  store i16 %156, i16* %__x167, align 2, !dbg !656
  %157 = load i16, i16* %__x167, align 2, !dbg !656
  store i16 %157, i16* %tmp168, align 2, !dbg !656
  %158 = load i16, i16* %tmp168, align 2, !dbg !656
  %add169 = add i16 %158, 2, !dbg !652
  %159 = inttoptr i16 %add169 to i8*, !dbg !652
  call void @llvm.dbg.declare(metadata i16* %__x170, metadata !658, metadata !DIExpression()), !dbg !660
  %160 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !660, !srcloc !661
  store i16 %160, i16* %__x170, align 2, !dbg !660
  %161 = load i16, i16* %__x170, align 2, !dbg !660
  store i16 %161, i16* %tmp171, align 2, !dbg !660
  %162 = load i16, i16* %tmp171, align 2, !dbg !660
  %add172 = add i16 %162, 2, !dbg !652
  %sub173 = sub i16 9216, %add172, !dbg !652
  %call174 = call zeroext i16 @__fast_hw_crc(i8* %159, i16 zeroext %sub173, i16 zeroext -1), !dbg !652
  store i16 %call174, i16* @tmp_stack_crc, align 2, !dbg !652
  %163 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %164 = bitcast %struct.camel_buffer_t* %163 to i8*, !dbg !652
  %165 = load i16, i16* @tmp_stack_crc, align 2, !dbg !652
  %call175 = call zeroext i16 @__fast_hw_crc(i8* %164, i16 zeroext 3520, i16 zeroext %165), !dbg !652
  store i16 %call175, i16* @tmp_stack_buf_crc, align 2, !dbg !652
  %166 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !652
  %167 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %stack_and_buf_crc176 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %167, i32 0, i32 2, !dbg !652
  store i16 %166, i16* %stack_and_buf_crc176, align 2, !dbg !652
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !652
  br label %if.end177

if.end177:                                        ; preds = %if.else164, %if.then151
  br label %do.end178, !dbg !641

do.end178:                                        ; preds = %if.end177
  %tmp147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp147, i32 0, i32 1
  %global149 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global148, i32 0, i32 11
  %tmp150 = load i16, i16* %global149, align 2
  %tmp151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp151, i32 0, i32 1
  %global153 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global152, i32 0, i32 11
  store i16 %tmp150, i16* %global153, align 2
  %tmp154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp154, i32 0, i32 1
  %global156 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global155, i32 0, i32 18
  %tmp157 = load i16, i16* %global156, align 2
  %tmp159 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global160 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp159, i32 0, i32 1
  %global161 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global160, i32 0, i32 18
  store i16 %tmp157, i16* %global161, align 2
  %tmp162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp162, i32 0, i32 1
  %global164 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global163, i32 0, i32 8
  %tmp165 = load i16, i16* %global164, align 2
  %tmp166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp166, i32 0, i32 1
  %global168 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global167, i32 0, i32 8
  store i16 %tmp165, i16* %global168, align 2
  call void @task_commit(), !dbg !662
  br label %while.cond144, !dbg !632, !llvm.loop !663

while.end:                                        ; preds = %while.cond144
  %168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !665
  %globals179 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %168, i32 0, i32 1, !dbg !665
  %check180 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals179, i32 0, i32 18, !dbg !665
  %169 = load i16, i16* %check180, align 2, !dbg !665
  %cmp181 = icmp ne i16 %169, 0, !dbg !667
  br i1 %cmp181, label %if.then182, label %if.end183, !dbg !668

if.then182:                                       ; preds = %while.end
  br label %while.end184, !dbg !669

if.end183:                                        ; preds = %while.end
  br label %while.body83, !dbg !576, !llvm.loop !670

while.end184:                                     ; preds = %if.then182
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %globals185 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !672
  %check186 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals185, i32 0, i32 18, !dbg !672
  %171 = load i16, i16* %check186, align 2, !dbg !672
  %cmp187 = icmp eq i16 %171, 3, !dbg !674
  br i1 %cmp187, label %if.then188, label %if.end224, !dbg !675

if.then188:                                       ; preds = %while.end184
  br label %do.body189, !dbg !676

do.body189:                                       ; preds = %do.cond, %if.then188
  %tmp169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp169, i32 0, i32 1
  %global171 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global170, i32 0, i32 8
  %tmp172 = load i16, i16* %global171, align 2
  %tmp173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp173, i32 0, i32 1
  %global175 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global174, i32 0, i32 8
  store i16 %tmp172, i16* %global175, align 2
  call void @task_add_node(), !dbg !678
  br label %do.body190, !dbg !680

do.body190:                                       ; preds = %do.body189
  %172 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !681
  %cmp191 = icmp eq i16 %172, 1, !dbg !681
  br i1 %cmp191, label %if.then192, label %if.else205, !dbg !684

if.then192:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !685
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !685
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !685
  %reg_file193 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 0, !dbg !685
  %arraydecay194 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file193, i16 0, i16 0, !dbg !685
  call void @__dump_registers(i16* %arraydecay194), !dbg !685
  call void @llvm.dbg.declare(metadata i16* %__x195, metadata !687, metadata !DIExpression()), !dbg !689
  %174 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !689, !srcloc !690
  store i16 %174, i16* %__x195, align 2, !dbg !689
  %175 = load i16, i16* %__x195, align 2, !dbg !689
  store i16 %175, i16* %tmp196, align 2, !dbg !689
  %176 = load i16, i16* %tmp196, align 2, !dbg !689
  %add197 = add i16 %176, 2, !dbg !685
  %177 = inttoptr i16 %add197 to i8*, !dbg !685
  call void @llvm.dbg.declare(metadata i16* %__x198, metadata !691, metadata !DIExpression()), !dbg !693
  %178 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !693, !srcloc !694
  store i16 %178, i16* %__x198, align 2, !dbg !693
  %179 = load i16, i16* %__x198, align 2, !dbg !693
  store i16 %179, i16* %tmp199, align 2, !dbg !693
  %180 = load i16, i16* %tmp199, align 2, !dbg !693
  %add200 = add i16 %180, 2, !dbg !685
  %sub201 = sub i16 9216, %add200, !dbg !685
  %call202 = call zeroext i16 @__fast_hw_crc(i8* %177, i16 zeroext %sub201, i16 zeroext -1), !dbg !685
  store i16 %call202, i16* @tmp_stack_crc, align 2, !dbg !685
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !685
  %182 = bitcast %struct.camel_buffer_t* %181 to i8*, !dbg !685
  %183 = load i16, i16* @tmp_stack_crc, align 2, !dbg !685
  %call203 = call zeroext i16 @__fast_hw_crc(i8* %182, i16 zeroext 3520, i16 zeroext %183), !dbg !685
  store i16 %call203, i16* @tmp_stack_buf_crc, align 2, !dbg !685
  %184 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !685
  %185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !685
  %stack_and_buf_crc204 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %185, i32 0, i32 2, !dbg !685
  store i16 %184, i16* %stack_and_buf_crc204, align 2, !dbg !685
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !685
  br label %if.end218, !dbg !685

if.else205:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !695
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !695
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !695
  %reg_file206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 0, !dbg !695
  %arraydecay207 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file206, i16 0, i16 0, !dbg !695
  call void @__dump_registers(i16* %arraydecay207), !dbg !695
  call void @llvm.dbg.declare(metadata i16* %__x208, metadata !697, metadata !DIExpression()), !dbg !699
  %187 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !699, !srcloc !700
  store i16 %187, i16* %__x208, align 2, !dbg !699
  %188 = load i16, i16* %__x208, align 2, !dbg !699
  store i16 %188, i16* %tmp209, align 2, !dbg !699
  %189 = load i16, i16* %tmp209, align 2, !dbg !699
  %add210 = add i16 %189, 2, !dbg !695
  %190 = inttoptr i16 %add210 to i8*, !dbg !695
  call void @llvm.dbg.declare(metadata i16* %__x211, metadata !701, metadata !DIExpression()), !dbg !703
  %191 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !703, !srcloc !704
  store i16 %191, i16* %__x211, align 2, !dbg !703
  %192 = load i16, i16* %__x211, align 2, !dbg !703
  store i16 %192, i16* %tmp212, align 2, !dbg !703
  %193 = load i16, i16* %tmp212, align 2, !dbg !703
  %add213 = add i16 %193, 2, !dbg !695
  %sub214 = sub i16 9216, %add213, !dbg !695
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %190, i16 zeroext %sub214, i16 zeroext -1), !dbg !695
  store i16 %call215, i16* @tmp_stack_crc, align 2, !dbg !695
  %194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !695
  %195 = bitcast %struct.camel_buffer_t* %194 to i8*, !dbg !695
  %196 = load i16, i16* @tmp_stack_crc, align 2, !dbg !695
  %call216 = call zeroext i16 @__fast_hw_crc(i8* %195, i16 zeroext 3520, i16 zeroext %196), !dbg !695
  store i16 %call216, i16* @tmp_stack_buf_crc, align 2, !dbg !695
  %197 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !695
  %198 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !695
  %stack_and_buf_crc217 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %198, i32 0, i32 2, !dbg !695
  store i16 %197, i16* %stack_and_buf_crc217, align 2, !dbg !695
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !695
  br label %if.end218

if.end218:                                        ; preds = %if.else205, %if.then192
  br label %do.end219, !dbg !684

do.end219:                                        ; preds = %if.end218
  %tmp176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i32 0, i32 1
  %global178 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global177, i32 0, i32 8
  %tmp179 = load i16, i16* %global178, align 2
  %tmp180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp180, i32 0, i32 1
  %global182 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global181, i32 0, i32 8
  store i16 %tmp179, i16* %global182, align 2
  %tmp183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp183, i32 0, i32 1
  %global185 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global184, i32 0, i32 18
  %tmp186 = load i16, i16* %global185, align 2
  %tmp187 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global188 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp187, i32 0, i32 1
  %global189 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global188, i32 0, i32 18
  store i16 %tmp186, i16* %global189, align 2
  %tmp190 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp190, i32 0, i32 1
  %global192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global191, i32 0, i32 14
  %tmp193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp193, i32 0, i32 1
  %global195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global194, i32 0, i32 14
  %cast196 = bitcast %struct._node_t* %global192 to i8*
  %cast197 = bitcast %struct._node_t* %global195 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast196, i8* align 2 %cast197, i64 6, i1 false), !dbg !705
  call void @task_commit(), !dbg !705
  br label %do.cond, !dbg !706

do.cond:                                          ; preds = %do.end219
  %199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !707
  %globals220 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %199, i32 0, i32 1, !dbg !707
  %check221 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals220, i32 0, i32 18, !dbg !707
  %200 = load i16, i16* %check221, align 2, !dbg !707
  %cmp222 = icmp eq i16 %200, 0, !dbg !708
  br i1 %cmp222, label %do.body189, label %do.end223, !dbg !706, !llvm.loop !709

do.end223:                                        ; preds = %do.cond
  br label %if.end224, !dbg !711

if.end224:                                        ; preds = %do.end223, %while.end184
  %tmp198 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global199 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp198, i32 0, i32 1
  %global200 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global199, i32 0, i32 4
  %tmp201 = load i16, i16* %global200, align 2
  %tmp202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global203 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp202, i32 0, i32 1
  %global204 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global203, i32 0, i32 4
  store i16 %tmp201, i16* %global204, align 2
  %tmp205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp205, i32 0, i32 1
  %global207 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global206, i32 0, i32 0
  %tmp208 = load i16, i16* %global207, align 2
  %tmp210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global211 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp210, i32 0, i32 1
  %global212 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global211, i32 0, i32 0
  store i16 %tmp208, i16* %global212, align 2
  %tmp213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global214 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp213, i32 0, i32 1
  %global215 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global214, i32 0, i32 2
  %tmp216 = load i16, i16* %global215, align 2
  %tmp217 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp217, i32 0, i32 1
  %global219 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global218, i32 0, i32 2
  store i16 %tmp216, i16* %global219, align 2
  %tmp220 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global221 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp220, i32 0, i32 1
  %global222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global221, i32 0, i32 12
  %tmp223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i32 0, i32 1
  %global225 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global224, i32 0, i32 12
  %cast226 = bitcast %struct._node_t* %global222 to i8*
  %cast227 = bitcast %struct._node_t* %global225 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast226, i8* align 2 %cast227, i64 6, i1 false), !dbg !712
  %tmp228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global229 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i32 0, i32 1
  %global230 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global229, i32 0, i32 10
  %tmp232 = load i16, i16* %global230, align 2
  %tmp233 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp233, i32 0, i32 1
  %global235 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global234, i32 0, i32 10
  store i16 %tmp232, i16* %global235, align 2
  %tmp236 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp236, i32 0, i32 1
  %global238 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global237, i32 0, i32 16
  %tmp239 = load i16, i16* %global238, align 2
  %tmp240 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp240, i32 0, i32 1
  %global242 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global241, i32 0, i32 16
  store i16 %tmp239, i16* %global242, align 2
  %tmp243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global244 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp243, i32 0, i32 1
  %global245 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global244, i32 0, i32 8
  %tmp246 = load i16, i16* %global245, align 2
  %tmp248 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global249 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp248, i32 0, i32 1
  %global250 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global249, i32 0, i32 8
  store i16 %tmp246, i16* %global250, align 2
  %tmp251 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp251, i32 0, i32 1
  %global253 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global252, i32 0, i32 14
  %tmp254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global255 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp254, i32 0, i32 1
  %global256 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global255, i32 0, i32 14
  %cast257 = bitcast %struct._node_t* %global253 to i8*
  %cast258 = bitcast %struct._node_t* %global256 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast257, i8* align 2 %cast258, i64 6, i1 false), !dbg !712
  %tmp259 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global260 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp259, i32 0, i32 1
  %global261 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global260, i32 0, i32 17
  %tmp263 = load i16, i16* %global261, align 2
  %tmp264 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global265 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp264, i32 0, i32 1
  %global266 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global265, i32 0, i32 17
  store i16 %tmp263, i16* %global266, align 2
  %tmp267 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global268 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp267, i32 0, i32 1
  %global269 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global268, i32 0, i32 9
  %tmp270 = load i16, i16* %global269, align 2
  %tmp271 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global272 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp271, i32 0, i32 1
  %global273 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global272, i32 0, i32 9
  store i16 %tmp270, i16* %global273, align 2
  call void @task_add_insert(), !dbg !712
  br label %do.body225, !dbg !713

do.body225:                                       ; preds = %if.end224
  %201 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !714
  %cmp226 = icmp eq i16 %201, 1, !dbg !714
  br i1 %cmp226, label %if.then227, label %if.else240, !dbg !717

if.then227:                                       ; preds = %do.body225
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !718
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !718
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %reg_file228 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 0, !dbg !718
  %arraydecay229 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file228, i16 0, i16 0, !dbg !718
  call void @__dump_registers(i16* %arraydecay229), !dbg !718
  call void @llvm.dbg.declare(metadata i16* %__x230, metadata !720, metadata !DIExpression()), !dbg !722
  %203 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !722, !srcloc !723
  store i16 %203, i16* %__x230, align 2, !dbg !722
  %204 = load i16, i16* %__x230, align 2, !dbg !722
  store i16 %204, i16* %tmp231, align 2, !dbg !722
  %205 = load i16, i16* %tmp231, align 2, !dbg !722
  %add232 = add i16 %205, 2, !dbg !718
  %206 = inttoptr i16 %add232 to i8*, !dbg !718
  call void @llvm.dbg.declare(metadata i16* %__x233, metadata !724, metadata !DIExpression()), !dbg !726
  %207 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !726, !srcloc !727
  store i16 %207, i16* %__x233, align 2, !dbg !726
  %208 = load i16, i16* %__x233, align 2, !dbg !726
  store i16 %208, i16* %tmp234, align 2, !dbg !726
  %209 = load i16, i16* %tmp234, align 2, !dbg !726
  %add235 = add i16 %209, 2, !dbg !718
  %sub236 = sub i16 9216, %add235, !dbg !718
  %call237 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext %sub236, i16 zeroext -1), !dbg !718
  store i16 %call237, i16* @tmp_stack_crc, align 2, !dbg !718
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %211 = bitcast %struct.camel_buffer_t* %210 to i8*, !dbg !718
  %212 = load i16, i16* @tmp_stack_crc, align 2, !dbg !718
  %call238 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext 3520, i16 zeroext %212), !dbg !718
  store i16 %call238, i16* @tmp_stack_buf_crc, align 2, !dbg !718
  %213 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !718
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %stack_and_buf_crc239 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 2, !dbg !718
  store i16 %213, i16* %stack_and_buf_crc239, align 2, !dbg !718
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !718
  br label %if.end253, !dbg !718

if.else240:                                       ; preds = %do.body225
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !728
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !728
  %reg_file241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %215, i32 0, i32 0, !dbg !728
  %arraydecay242 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file241, i16 0, i16 0, !dbg !728
  call void @__dump_registers(i16* %arraydecay242), !dbg !728
  call void @llvm.dbg.declare(metadata i16* %__x243, metadata !730, metadata !DIExpression()), !dbg !732
  %216 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !732, !srcloc !733
  store i16 %216, i16* %__x243, align 2, !dbg !732
  %217 = load i16, i16* %__x243, align 2, !dbg !732
  store i16 %217, i16* %tmp244, align 2, !dbg !732
  %218 = load i16, i16* %tmp244, align 2, !dbg !732
  %add245 = add i16 %218, 2, !dbg !728
  %219 = inttoptr i16 %add245 to i8*, !dbg !728
  call void @llvm.dbg.declare(metadata i16* %__x246, metadata !734, metadata !DIExpression()), !dbg !736
  %220 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !736, !srcloc !737
  store i16 %220, i16* %__x246, align 2, !dbg !736
  %221 = load i16, i16* %__x246, align 2, !dbg !736
  store i16 %221, i16* %tmp247, align 2, !dbg !736
  %222 = load i16, i16* %tmp247, align 2, !dbg !736
  %add248 = add i16 %222, 2, !dbg !728
  %sub249 = sub i16 9216, %add248, !dbg !728
  %call250 = call zeroext i16 @__fast_hw_crc(i8* %219, i16 zeroext %sub249, i16 zeroext -1), !dbg !728
  store i16 %call250, i16* @tmp_stack_crc, align 2, !dbg !728
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !728
  %224 = bitcast %struct.camel_buffer_t* %223 to i8*, !dbg !728
  %225 = load i16, i16* @tmp_stack_crc, align 2, !dbg !728
  %call251 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext 3520, i16 zeroext %225), !dbg !728
  store i16 %call251, i16* @tmp_stack_buf_crc, align 2, !dbg !728
  %226 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !728
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !728
  %stack_and_buf_crc252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 2, !dbg !728
  store i16 %226, i16* %stack_and_buf_crc252, align 2, !dbg !728
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !728
  br label %if.end253

if.end253:                                        ; preds = %if.else240, %if.then227
  br label %do.end255, !dbg !717

do.end255:                                        ; preds = %if.end253
  %tmp274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global275 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp274, i32 0, i32 1
  %global276 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global275, i32 0, i32 16
  %tmp277 = load i16, i16* %global276, align 2
  %tmp279 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global280 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp279, i32 0, i32 1
  %global281 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global280, i32 0, i32 16
  store i16 %tmp277, i16* %global281, align 2
  %tmp282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global283 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp282, i32 0, i32 1
  %global284 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global283, i32 0, i32 5
  %tmp285 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global286 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp285, i32 0, i32 1
  %global287 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global286, i32 0, i32 16
  %load = load i16, i16* %global287, align 2
  %access = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global284, i16 0, i16 %load
  %tmp288 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp288, i32 0, i32 1
  %global290 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global289, i32 0, i32 5
  %tmp291 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp291, i32 0, i32 1
  %global293 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global292, i32 0, i32 16
  %load294 = load i16, i16* %global293, align 2
  %access295 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global290, i16 0, i16 %load294
  %cast296 = bitcast %struct._node_t* %access to i8*
  %cast297 = bitcast %struct._node_t* %access295 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast296, i8* align 2 %cast297, i64 3072, i1 false), !dbg !738
  %tmp298 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global299 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp298, i32 0, i32 1
  %global300 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global299, i32 0, i32 17
  %tmp301 = load i16, i16* %global300, align 2
  %tmp302 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global303 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp302, i32 0, i32 1
  %global304 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global303, i32 0, i32 17
  store i16 %tmp301, i16* %global304, align 2
  %tmp305 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global306 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp305, i32 0, i32 1
  %global307 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global306, i32 0, i32 5
  %tmp308 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global309 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp308, i32 0, i32 1
  %global310 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global309, i32 0, i32 17
  %load311 = load i16, i16* %global310, align 2
  %access312 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global307, i16 0, i16 %load311
  %tmp313 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global314 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp313, i32 0, i32 1
  %global315 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global314, i32 0, i32 5
  %tmp316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global317 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp316, i32 0, i32 1
  %global318 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global317, i32 0, i32 17
  %load319 = load i16, i16* %global318, align 2
  %access320 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global315, i16 0, i16 %load319
  %cast321 = bitcast %struct._node_t* %access312 to i8*
  %cast322 = bitcast %struct._node_t* %access320 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast321, i8* align 2 %cast322, i64 3072, i1 false), !dbg !738
  %tmp323 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global324 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp323, i32 0, i32 1
  %global325 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global324, i32 0, i32 5
  %tmp326 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global327 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp326, i32 0, i32 1
  %global328 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global327, i32 0, i32 9
  %load329 = load i16, i16* %global328, align 2
  %access330 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global325, i16 0, i16 %load329
  %tmp331 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global332 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp331, i32 0, i32 1
  %global333 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global332, i32 0, i32 5
  %tmp334 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global335 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp334, i32 0, i32 1
  %global336 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global335, i32 0, i32 9
  %load337 = load i16, i16* %global336, align 2
  %access338 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global333, i16 0, i16 %load337
  %cast339 = bitcast %struct._node_t* %access330 to i8*
  %cast340 = bitcast %struct._node_t* %access338 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast339, i8* align 2 %cast340, i64 3072, i1 false), !dbg !738
  %tmp341 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global342 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp341, i32 0, i32 1
  %global343 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global342, i32 0, i32 15
  %tmp344 = load i16, i16* %global343, align 2
  %tmp345 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global346 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp345, i32 0, i32 1
  %global347 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global346, i32 0, i32 15
  store i16 %tmp344, i16* %global347, align 2
  %tmp348 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global349 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp348, i32 0, i32 1
  %global350 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global349, i32 0, i32 4
  %tmp351 = load i16, i16* %global350, align 2
  %tmp352 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global353 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp352, i32 0, i32 1
  %global354 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global353, i32 0, i32 4
  store i16 %tmp351, i16* %global354, align 2
  call void @task_commit(), !dbg !738
  %tmp355 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global356 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp355, i32 0, i32 1
  %global357 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global356, i32 0, i32 3
  %tmp358 = load i16, i16* %global357, align 2
  %tmp359 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global360 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp359, i32 0, i32 1
  %global361 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global360, i32 0, i32 3
  store i16 %tmp358, i16* %global361, align 2
  %tmp362 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global363 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp362, i32 0, i32 1
  %global364 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global363, i32 0, i32 15
  %tmp365 = load i16, i16* %global364, align 2
  %tmp366 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global367 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp366, i32 0, i32 1
  %global368 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global367, i32 0, i32 15
  store i16 %tmp365, i16* %global368, align 2
  %tmp369 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global370 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp369, i32 0, i32 1
  %global371 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global370, i32 0, i32 16
  %tmp372 = load i16, i16* %global371, align 2
  %tmp373 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global374 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp373, i32 0, i32 1
  %global375 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global374, i32 0, i32 16
  store i16 %tmp372, i16* %global375, align 2
  %tmp376 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global377 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp376, i32 0, i32 1
  %global378 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global377, i32 0, i32 1
  %tmp379 = load i16, i16* %global378, align 2
  %tmp380 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global381 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp380, i32 0, i32 1
  %global382 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global381, i32 0, i32 1
  store i16 %tmp379, i16* %global382, align 2
  %tmp383 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global384 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp383, i32 0, i32 1
  %global385 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global384, i32 0, i32 2
  %tmp386 = load i16, i16* %global385, align 2
  %tmp387 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global388 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp387, i32 0, i32 1
  %global389 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global388, i32 0, i32 2
  store i16 %tmp386, i16* %global389, align 2
  call void @task_append_compressed(), !dbg !739
  br label %do.body256, !dbg !740

do.body256:                                       ; preds = %do.end255
  %228 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !741
  %cmp257 = icmp eq i16 %228, 1, !dbg !741
  br i1 %cmp257, label %if.then258, label %if.else271, !dbg !744

if.then258:                                       ; preds = %do.body256
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !745
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !745
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !745
  %reg_file259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %229, i32 0, i32 0, !dbg !745
  %arraydecay260 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file259, i16 0, i16 0, !dbg !745
  call void @__dump_registers(i16* %arraydecay260), !dbg !745
  call void @llvm.dbg.declare(metadata i16* %__x261, metadata !747, metadata !DIExpression()), !dbg !749
  %230 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !749, !srcloc !750
  store i16 %230, i16* %__x261, align 2, !dbg !749
  %231 = load i16, i16* %__x261, align 2, !dbg !749
  store i16 %231, i16* %tmp262, align 2, !dbg !749
  %232 = load i16, i16* %tmp262, align 2, !dbg !749
  %add263 = add i16 %232, 2, !dbg !745
  %233 = inttoptr i16 %add263 to i8*, !dbg !745
  call void @llvm.dbg.declare(metadata i16* %__x264, metadata !751, metadata !DIExpression()), !dbg !753
  %234 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !753, !srcloc !754
  store i16 %234, i16* %__x264, align 2, !dbg !753
  %235 = load i16, i16* %__x264, align 2, !dbg !753
  store i16 %235, i16* %tmp265, align 2, !dbg !753
  %236 = load i16, i16* %tmp265, align 2, !dbg !753
  %add266 = add i16 %236, 2, !dbg !745
  %sub267 = sub i16 9216, %add266, !dbg !745
  %call268 = call zeroext i16 @__fast_hw_crc(i8* %233, i16 zeroext %sub267, i16 zeroext -1), !dbg !745
  store i16 %call268, i16* @tmp_stack_crc, align 2, !dbg !745
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !745
  %238 = bitcast %struct.camel_buffer_t* %237 to i8*, !dbg !745
  %239 = load i16, i16* @tmp_stack_crc, align 2, !dbg !745
  %call269 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext 3520, i16 zeroext %239), !dbg !745
  store i16 %call269, i16* @tmp_stack_buf_crc, align 2, !dbg !745
  %240 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !745
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !745
  %stack_and_buf_crc270 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %241, i32 0, i32 2, !dbg !745
  store i16 %240, i16* %stack_and_buf_crc270, align 2, !dbg !745
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !745
  br label %if.end284, !dbg !745

if.else271:                                       ; preds = %do.body256
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !755
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !755
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !755
  %reg_file272 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %242, i32 0, i32 0, !dbg !755
  %arraydecay273 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file272, i16 0, i16 0, !dbg !755
  call void @__dump_registers(i16* %arraydecay273), !dbg !755
  call void @llvm.dbg.declare(metadata i16* %__x274, metadata !757, metadata !DIExpression()), !dbg !759
  %243 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !759, !srcloc !760
  store i16 %243, i16* %__x274, align 2, !dbg !759
  %244 = load i16, i16* %__x274, align 2, !dbg !759
  store i16 %244, i16* %tmp275, align 2, !dbg !759
  %245 = load i16, i16* %tmp275, align 2, !dbg !759
  %add276 = add i16 %245, 2, !dbg !755
  %246 = inttoptr i16 %add276 to i8*, !dbg !755
  call void @llvm.dbg.declare(metadata i16* %__x277, metadata !761, metadata !DIExpression()), !dbg !763
  %247 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !763, !srcloc !764
  store i16 %247, i16* %__x277, align 2, !dbg !763
  %248 = load i16, i16* %__x277, align 2, !dbg !763
  store i16 %248, i16* %tmp278, align 2, !dbg !763
  %249 = load i16, i16* %tmp278, align 2, !dbg !763
  %add279 = add i16 %249, 2, !dbg !755
  %sub280 = sub i16 9216, %add279, !dbg !755
  %call281 = call zeroext i16 @__fast_hw_crc(i8* %246, i16 zeroext %sub280, i16 zeroext -1), !dbg !755
  store i16 %call281, i16* @tmp_stack_crc, align 2, !dbg !755
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !755
  %251 = bitcast %struct.camel_buffer_t* %250 to i8*, !dbg !755
  %252 = load i16, i16* @tmp_stack_crc, align 2, !dbg !755
  %call282 = call zeroext i16 @__fast_hw_crc(i8* %251, i16 zeroext 3520, i16 zeroext %252), !dbg !755
  store i16 %call282, i16* @tmp_stack_buf_crc, align 2, !dbg !755
  %253 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !755
  %254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !755
  %stack_and_buf_crc283 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %254, i32 0, i32 2, !dbg !755
  store i16 %253, i16* %stack_and_buf_crc283, align 2, !dbg !755
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !755
  br label %if.end284

if.end284:                                        ; preds = %if.else271, %if.then258
  br label %do.end286, !dbg !744

do.end286:                                        ; preds = %if.end284
  %tmp390 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global391 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp390, i32 0, i32 1
  %global392 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global391, i32 0, i32 16
  %tmp393 = load i16, i16* %global392, align 2
  %tmp394 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global395 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp394, i32 0, i32 1
  %global396 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global395, i32 0, i32 16
  store i16 %tmp393, i16* %global396, align 2
  %tmp397 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global398 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp397, i32 0, i32 1
  %global399 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global398, i32 0, i32 13
  %tmp400 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global401 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp400, i32 0, i32 1
  %global402 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global401, i32 0, i32 16
  %load403 = load i16, i16* %global402, align 2
  %access404 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %global399, i16 0, i16 %load403
  %tmp405 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global406 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp405, i32 0, i32 1
  %global407 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global406, i32 0, i32 13
  %tmp408 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global409 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp408, i32 0, i32 1
  %global410 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global409, i32 0, i32 16
  %load411 = load i16, i16* %global410, align 2
  %access412 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %global407, i16 0, i16 %load411
  %cast413 = bitcast %struct._node_t* %access404 to i8*
  %cast414 = bitcast %struct._node_t* %access412 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast413, i8* align 2 %cast414, i64 384, i1 false), !dbg !765
  %tmp415 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global416 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp415, i32 0, i32 1
  %global417 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global416, i32 0, i32 3
  %tmp418 = load i16, i16* %global417, align 2
  %tmp419 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global420 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp419, i32 0, i32 1
  %global421 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global420, i32 0, i32 3
  store i16 %tmp418, i16* %global421, align 2
  call void @task_commit(), !dbg !765
  br label %while.cond, !dbg !512, !llvm.loop !766

while.end287:                                     ; preds = %while.cond
  call void @task_done(), !dbg !768
  %255 = load i16, i16* %retval, align 2, !dbg !769
  ret i16 %255, !dbg !769
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!78, !79, !80}
!llvm.ident = !{!81}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 156, type: !73, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, nameTableKind: None)
!3 = !DIFile(filename: "../example/camel_cem.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !6)
!8 = !{!9, !16, !0, !18, !68, !70}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 48, type: !11, isLocal: false, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !12, line: 26, baseType: !13)
!12 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !14, line: 43, baseType: !15)
!14 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!15 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 49, type: !11, isLocal: false, isDefinition: true)
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 163, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 16)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 149, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 144, size: 28176, elements: !23)
!23 = !{!24, !29, !67}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !22, file: !3, line: 146, baseType: !25, size: 176)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 176, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 45, baseType: !11)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !22, file: !3, line: 147, baseType: !30, size: 27984, offset: 176)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 141, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 116, size: 27984, elements: !32)
!32 = !{!33, !35, !36, !38, !39, !40, !50, !51, !52, !53, !54, !55, !56, !57, !61, !62, !63, !64, !65}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !31, file: !3, line: 118, baseType: !34, size: 16)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_t", file: !3, line: 21, baseType: !6)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "letter_idx", scope: !31, file: !3, line: 119, baseType: !6, size: 16, offset: 16)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "prev_sample", scope: !31, file: !3, line: 120, baseType: !37, size: 16, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "sample_t", file: !3, line: 22, baseType: !6)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "out_len", scope: !31, file: !3, line: 121, baseType: !7, size: 16, offset: 48)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "node_count", scope: !31, file: !3, line: 122, baseType: !7, size: 16, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "dict", scope: !31, file: !3, line: 123, baseType: !41, size: 24576, offset: 80)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 24576, elements: !48)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !3, line: 28, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_node_t", file: !3, line: 24, size: 48, elements: !44)
!44 = !{!45, !46, !47}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !43, file: !3, line: 25, baseType: !34, size: 16)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !43, file: !3, line: 26, baseType: !7, size: 16, offset: 16)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !43, file: !3, line: 27, baseType: !7, size: 16, offset: 32)
!48 = !{!49}
!49 = !DISubrange(count: 512)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !31, file: !3, line: 124, baseType: !37, size: 16, offset: 24656)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sample_count", scope: !31, file: !3, line: 125, baseType: !7, size: 16, offset: 24672)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !31, file: !3, line: 126, baseType: !7, size: 16, offset: 24688)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !31, file: !3, line: 127, baseType: !7, size: 16, offset: 24704)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !31, file: !3, line: 128, baseType: !7, size: 16, offset: 24720)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "parent_next", scope: !31, file: !3, line: 129, baseType: !7, size: 16, offset: 24736)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "parent_node", scope: !31, file: !3, line: 130, baseType: !42, size: 48, offset: 24752)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "compressed_data", scope: !31, file: !3, line: 131, baseType: !58, size: 3072, offset: 24800)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 3072, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_node", scope: !31, file: !3, line: 132, baseType: !42, size: 48, offset: 27872)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "symbol", scope: !31, file: !3, line: 133, baseType: !7, size: 16, offset: 27920)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "write1", scope: !31, file: !3, line: 136, baseType: !6, size: 16, offset: 27936)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "write2", scope: !31, file: !3, line: 137, baseType: !6, size: 16, offset: 27952)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !31, file: !3, line: 140, baseType: !66, size: 16, offset: 27968)
!66 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !22, file: !3, line: 148, baseType: !11, size: 16, offset: 28160)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 163, type: !20, isLocal: false, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 192, type: !72, isLocal: false, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 176, elements: !27)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 151, size: 56368, elements: !74)
!74 = !{!75, !76, !77}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !73, file: !3, line: 153, baseType: !11, size: 16)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !73, file: !3, line: 154, baseType: !21, size: 28176, offset: 16)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !73, file: !3, line: 155, baseType: !21, size: 28176, offset: 28192)
!78 = !{i32 2, !"Dwarf Version", i32 4}
!79 = !{i32 2, !"Debug Info Version", i32 3}
!80 = !{i32 1, !"wchar_size", i32 2}
!81 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!82 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 165, type: !83, scopeLine: 165, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{null}
!85 = !DILocation(line: 166, column: 10, scope: !82)
!86 = !DILocation(line: 168, column: 9, scope: !82)
!87 = !DILocation(line: 170, column: 9, scope: !82)
!88 = !DILocation(line: 175, column: 11, scope: !82)
!89 = !DILocation(line: 180, column: 12, scope: !82)
!90 = !DILocation(line: 181, column: 10, scope: !82)
!91 = !DILocation(line: 182, column: 10, scope: !82)
!92 = !DILocation(line: 184, column: 10, scope: !82)
!93 = !DILocation(line: 185, column: 12, scope: !82)
!94 = !DILocation(line: 188, column: 10, scope: !82)
!95 = !DILocation(line: 190, column: 1, scope: !82)
!96 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 194, type: !83, scopeLine: 194, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 195, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !96, file: !3, line: 195, column: 8)
!99 = !DILocation(line: 195, column: 19, scope: !98)
!100 = !DILocation(line: 195, column: 8, scope: !96)
!101 = !DILocation(line: 196, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 195, column: 34)
!103 = !DILocation(line: 197, column: 16, scope: !102)
!104 = !DILocation(line: 198, column: 5, scope: !102)
!105 = !DILocation(line: 198, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !3, line: 198, column: 15)
!107 = !DILocation(line: 198, column: 26, scope: !106)
!108 = !DILocation(line: 198, column: 15, scope: !98)
!109 = !DILocation(line: 199, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 198, column: 41)
!111 = !DILocation(line: 200, column: 16, scope: !110)
!112 = !DILocation(line: 201, column: 5, scope: !110)
!113 = !DILocation(line: 202, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !3, line: 201, column: 12)
!115 = !DILocation(line: 219, column: 3, scope: !116)
!116 = distinct !DILexicalBlock(scope: !96, file: !3, line: 219, column: 3)
!117 = !{i32 -2146613700}
!118 = !DILocalVariable(name: "__x", scope: !119, file: !3, line: 221, type: !6)
!119 = distinct !DILexicalBlock(scope: !96, file: !3, line: 221, column: 33)
!120 = !DILocation(line: 221, column: 33, scope: !119)
!121 = !{i32 -2146613464}
!122 = !DILocation(line: 221, column: 51, scope: !96)
!123 = !DILocation(line: 221, column: 33, scope: !96)
!124 = !DILocalVariable(name: "__x", scope: !125, file: !3, line: 221, type: !6)
!125 = distinct !DILexicalBlock(scope: !96, file: !3, line: 221, column: 65)
!126 = !DILocation(line: 221, column: 65, scope: !125)
!127 = !{i32 -2146613339}
!128 = !DILocation(line: 221, column: 83, scope: !96)
!129 = !DILocation(line: 221, column: 63, scope: !96)
!130 = !DILocation(line: 221, column: 19, scope: !96)
!131 = !DILocation(line: 221, column: 17, scope: !96)
!132 = !DILocation(line: 222, column: 37, scope: !96)
!133 = !DILocation(line: 222, column: 71, scope: !96)
!134 = !DILocation(line: 222, column: 23, scope: !96)
!135 = !DILocation(line: 222, column: 21, scope: !96)
!136 = !DILocation(line: 225, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !96, file: !3, line: 225, column: 6)
!138 = !DILocation(line: 225, column: 27, scope: !137)
!139 = !DILocation(line: 225, column: 33, scope: !137)
!140 = !DILocation(line: 225, column: 24, scope: !137)
!141 = !DILocation(line: 225, column: 6, scope: !96)
!142 = !DILocation(line: 226, column: 11, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !3, line: 225, column: 51)
!144 = !DILocation(line: 226, column: 4, scope: !143)
!145 = !DILocation(line: 226, column: 19, scope: !143)
!146 = !DILocation(line: 227, column: 4, scope: !143)
!147 = !DILocation(line: 228, column: 24, scope: !143)
!148 = !DILocation(line: 228, column: 30, scope: !143)
!149 = !DILocation(line: 228, column: 4, scope: !143)
!150 = !DILocation(line: 229, column: 3, scope: !143)
!151 = !DILocation(line: 230, column: 4, scope: !152)
!152 = distinct !DILexicalBlock(scope: !137, file: !3, line: 229, column: 9)
!153 = !DILocation(line: 233, column: 1, scope: !96)
!154 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 243, type: !83, scopeLine: 244, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocation(line: 245, column: 2, scope: !154)
!156 = !DILocation(line: 245, column: 18, scope: !154)
!157 = !DILocation(line: 246, column: 2, scope: !154)
!158 = !DILocation(line: 246, column: 14, scope: !154)
!159 = !DILocation(line: 247, column: 2, scope: !154)
!160 = !DILocation(line: 247, column: 13, scope: !154)
!161 = !DILocation(line: 248, column: 2, scope: !154)
!162 = !DILocation(line: 248, column: 18, scope: !154)
!163 = !DILocation(line: 249, column: 2, scope: !154)
!164 = !DILocation(line: 249, column: 17, scope: !154)
!165 = !DILocation(line: 250, column: 2, scope: !154)
!166 = !DILocation(line: 250, column: 19, scope: !154)
!167 = !DILocation(line: 252, column: 2, scope: !154)
!168 = !DILocation(line: 252, column: 9, scope: !154)
!169 = !DILocation(line: 252, column: 20, scope: !154)
!170 = !DILocalVariable(name: "node", scope: !171, file: !3, line: 254, type: !42)
!171 = distinct !DILexicalBlock(scope: !154, file: !3, line: 252, column: 35)
!172 = !DILocation(line: 254, column: 10, scope: !171)
!173 = !DILocation(line: 254, column: 17, scope: !171)
!174 = !DILocation(line: 255, column: 14, scope: !171)
!175 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 259, type: !66)
!176 = !DILocation(line: 259, column: 7, scope: !171)
!177 = !DILocation(line: 259, column: 11, scope: !171)
!178 = !DILocation(line: 260, column: 3, scope: !171)
!179 = !DILocation(line: 260, column: 12, scope: !171)
!180 = !DILocation(line: 260, column: 17, scope: !171)
!181 = !DILocation(line: 261, column: 3, scope: !171)
!182 = !DILocation(line: 261, column: 13, scope: !171)
!183 = distinct !{!183, !167, !184}
!184 = !DILocation(line: 262, column: 2, scope: !154)
!185 = !DILocation(line: 264, column: 2, scope: !154)
!186 = !DILocation(line: 264, column: 17, scope: !154)
!187 = !DILocation(line: 265, column: 1, scope: !154)
!188 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 282, type: !83, scopeLine: 283, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocalVariable(name: "next_letter_idx", scope: !188, file: !3, line: 284, type: !6)
!190 = !DILocation(line: 284, column: 11, scope: !188)
!191 = !DILocation(line: 284, column: 29, scope: !188)
!192 = !DILocation(line: 284, column: 44, scope: !188)
!193 = !DILocation(line: 285, column: 6, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !3, line: 285, column: 6)
!195 = !DILocation(line: 285, column: 22, scope: !194)
!196 = !DILocation(line: 285, column: 6, scope: !188)
!197 = !DILocation(line: 286, column: 19, scope: !194)
!198 = !DILocation(line: 286, column: 3, scope: !194)
!199 = !DILocation(line: 288, column: 6, scope: !200)
!200 = distinct !DILexicalBlock(scope: !188, file: !3, line: 288, column: 6)
!201 = !DILocation(line: 288, column: 21, scope: !200)
!202 = !DILocation(line: 288, column: 6, scope: !188)
!203 = !DILocation(line: 289, column: 20, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !3, line: 288, column: 27)
!205 = !DILocation(line: 289, column: 3, scope: !204)
!206 = !DILocation(line: 289, column: 18, scope: !204)
!207 = !DILocation(line: 290, column: 3, scope: !204)
!208 = !DILocation(line: 290, column: 13, scope: !204)
!209 = !DILocation(line: 293, column: 2, scope: !204)
!210 = !DILocation(line: 294, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !200, file: !3, line: 293, column: 9)
!212 = !DILocation(line: 294, column: 3, scope: !211)
!213 = !DILocation(line: 294, column: 18, scope: !211)
!214 = !DILocation(line: 295, column: 3, scope: !211)
!215 = !DILocation(line: 295, column: 13, scope: !211)
!216 = !DILocation(line: 299, column: 1, scope: !188)
!217 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 316, type: !83, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!218 = !DILocalVariable(name: "prev_sample", scope: !217, file: !3, line: 318, type: !37)
!219 = !DILocation(line: 318, column: 11, scope: !217)
!220 = !DILocation(line: 319, column: 16, scope: !217)
!221 = !DILocation(line: 319, column: 14, scope: !217)
!222 = !DILocalVariable(name: "sample", scope: !217, file: !3, line: 321, type: !37)
!223 = !DILocation(line: 321, column: 11, scope: !217)
!224 = !DILocation(line: 321, column: 35, scope: !217)
!225 = !DILocation(line: 321, column: 20, scope: !217)
!226 = !DILocation(line: 322, column: 16, scope: !217)
!227 = !DILocation(line: 322, column: 14, scope: !217)
!228 = !DILocation(line: 323, column: 20, scope: !217)
!229 = !DILocation(line: 323, column: 2, scope: !217)
!230 = !DILocation(line: 323, column: 18, scope: !217)
!231 = !DILocation(line: 324, column: 15, scope: !217)
!232 = !DILocation(line: 324, column: 2, scope: !217)
!233 = !DILocation(line: 324, column: 13, scope: !217)
!234 = !DILocation(line: 326, column: 1, scope: !217)
!235 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 237, type: !236, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DISubroutineType(types: !237)
!237 = !{!37, !34}
!238 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !235, file: !3, line: 237, type: !34)
!239 = !DILocation(line: 237, column: 41, scope: !235)
!240 = !DILocalVariable(name: "sample", scope: !235, file: !3, line: 239, type: !34)
!241 = !DILocation(line: 239, column: 11, scope: !235)
!242 = !DILocation(line: 239, column: 21, scope: !235)
!243 = !DILocation(line: 239, column: 33, scope: !235)
!244 = !DILocation(line: 239, column: 38, scope: !235)
!245 = !DILocation(line: 240, column: 9, scope: !235)
!246 = !DILocation(line: 240, column: 2, scope: !235)
!247 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 343, type: !83, scopeLine: 344, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DILocalVariable(name: "letter_idx", scope: !247, file: !3, line: 345, type: !6)
!249 = !DILocation(line: 345, column: 11, scope: !247)
!250 = !DILocation(line: 345, column: 24, scope: !247)
!251 = !DILocation(line: 346, column: 6, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !3, line: 346, column: 6)
!253 = !DILocation(line: 346, column: 17, scope: !252)
!254 = !DILocation(line: 346, column: 6, scope: !247)
!255 = !DILocation(line: 347, column: 14, scope: !252)
!256 = !DILocation(line: 347, column: 3, scope: !252)
!257 = !DILocation(line: 349, column: 13, scope: !252)
!258 = !DILocalVariable(name: "letter_shift", scope: !247, file: !3, line: 350, type: !6)
!259 = !DILocation(line: 350, column: 11, scope: !247)
!260 = !DILocation(line: 350, column: 45, scope: !247)
!261 = !DILocation(line: 350, column: 43, scope: !247)
!262 = !DILocalVariable(name: "letter", scope: !247, file: !3, line: 351, type: !34)
!263 = !DILocation(line: 351, column: 11, scope: !247)
!264 = !DILocation(line: 351, column: 21, scope: !247)
!265 = !DILocation(line: 351, column: 50, scope: !247)
!266 = !DILocation(line: 351, column: 47, scope: !247)
!267 = !DILocation(line: 351, column: 32, scope: !247)
!268 = !DILocation(line: 351, column: 68, scope: !247)
!269 = !DILocation(line: 351, column: 65, scope: !247)
!270 = !DILocation(line: 353, column: 15, scope: !247)
!271 = !DILocation(line: 353, column: 2, scope: !247)
!272 = !DILocation(line: 353, column: 13, scope: !247)
!273 = !DILocation(line: 355, column: 1, scope: !247)
!274 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 372, type: !83, scopeLine: 373, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!275 = !DILocalVariable(name: "parent_node", scope: !274, file: !3, line: 374, type: !42)
!276 = !DILocation(line: 374, column: 9, scope: !274)
!277 = !DILocalVariable(name: "parent", scope: !274, file: !3, line: 375, type: !7)
!278 = !DILocation(line: 375, column: 10, scope: !274)
!279 = !DILocation(line: 375, column: 19, scope: !274)
!280 = !DILocation(line: 376, column: 16, scope: !274)
!281 = !DILocation(line: 376, column: 25, scope: !274)
!282 = !DILocation(line: 378, column: 28, scope: !274)
!283 = !DILocation(line: 378, column: 2, scope: !274)
!284 = !DILocation(line: 378, column: 14, scope: !274)
!285 = !DILocation(line: 379, column: 2, scope: !274)
!286 = !DILocation(line: 379, column: 20, scope: !274)
!287 = !DILocation(line: 380, column: 15, scope: !274)
!288 = !DILocation(line: 380, column: 2, scope: !274)
!289 = !DILocation(line: 380, column: 13, scope: !274)
!290 = !DILocation(line: 381, column: 26, scope: !274)
!291 = !DILocation(line: 381, column: 2, scope: !274)
!292 = !DILocation(line: 381, column: 12, scope: !274)
!293 = !DILocation(line: 382, column: 2, scope: !274)
!294 = !DILocation(line: 382, column: 18, scope: !274)
!295 = !DILocation(line: 385, column: 1, scope: !274)
!296 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 402, type: !83, scopeLine: 403, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!297 = !DILocalVariable(name: "sibling_node", scope: !296, file: !3, line: 404, type: !298)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 16)
!299 = !DILocation(line: 404, column: 10, scope: !296)
!300 = !DILocation(line: 406, column: 6, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !3, line: 406, column: 6)
!302 = !DILocation(line: 406, column: 18, scope: !301)
!303 = !DILocation(line: 406, column: 6, scope: !296)
!304 = !DILocalVariable(name: "i", scope: !305, file: !3, line: 407, type: !66)
!305 = distinct !DILexicalBlock(scope: !301, file: !3, line: 406, column: 26)
!306 = !DILocation(line: 407, column: 7, scope: !305)
!307 = !DILocation(line: 407, column: 11, scope: !305)
!308 = !DILocation(line: 408, column: 19, scope: !305)
!309 = !DILocation(line: 408, column: 28, scope: !305)
!310 = !DILocation(line: 408, column: 16, scope: !305)
!311 = !DILocation(line: 410, column: 7, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !3, line: 410, column: 7)
!313 = !DILocation(line: 410, column: 21, scope: !312)
!314 = !DILocation(line: 410, column: 31, scope: !312)
!315 = !DILocation(line: 410, column: 28, scope: !312)
!316 = !DILocation(line: 410, column: 7, scope: !305)
!317 = !DILocation(line: 412, column: 22, scope: !318)
!318 = distinct !DILexicalBlock(scope: !312, file: !3, line: 410, column: 43)
!319 = !DILocation(line: 412, column: 4, scope: !318)
!320 = !DILocation(line: 412, column: 20, scope: !318)
!321 = !DILocation(line: 414, column: 4, scope: !318)
!322 = !DILocation(line: 414, column: 14, scope: !318)
!323 = !DILocation(line: 416, column: 4, scope: !318)
!324 = !DILocation(line: 418, column: 7, scope: !325)
!325 = distinct !DILexicalBlock(scope: !326, file: !3, line: 418, column: 7)
!326 = distinct !DILexicalBlock(scope: !312, file: !3, line: 417, column: 10)
!327 = !DILocation(line: 418, column: 21, scope: !325)
!328 = !DILocation(line: 418, column: 29, scope: !325)
!329 = !DILocation(line: 418, column: 7, scope: !326)
!330 = !DILocation(line: 419, column: 19, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !3, line: 418, column: 34)
!332 = !DILocation(line: 419, column: 33, scope: !331)
!333 = !DILocation(line: 419, column: 5, scope: !331)
!334 = !DILocation(line: 419, column: 17, scope: !331)
!335 = !DILocation(line: 420, column: 5, scope: !331)
!336 = !DILocation(line: 420, column: 15, scope: !331)
!337 = !DILocation(line: 422, column: 5, scope: !331)
!338 = !DILocation(line: 426, column: 2, scope: !305)
!339 = !DILocalVariable(name: "starting_node_idx", scope: !296, file: !3, line: 428, type: !7)
!340 = !DILocation(line: 428, column: 10, scope: !296)
!341 = !DILocation(line: 428, column: 39, scope: !296)
!342 = !DILocation(line: 429, column: 20, scope: !296)
!343 = !DILocation(line: 429, column: 2, scope: !296)
!344 = !DILocation(line: 429, column: 18, scope: !296)
!345 = !DILocation(line: 431, column: 6, scope: !346)
!346 = distinct !DILexicalBlock(scope: !296, file: !3, line: 431, column: 6)
!347 = !DILocation(line: 431, column: 16, scope: !346)
!348 = !DILocation(line: 431, column: 6, scope: !296)
!349 = !DILocation(line: 432, column: 3, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !3, line: 431, column: 24)
!351 = !DILocation(line: 432, column: 13, scope: !350)
!352 = !DILocation(line: 434, column: 2, scope: !350)
!353 = !DILocation(line: 435, column: 3, scope: !354)
!354 = distinct !DILexicalBlock(scope: !346, file: !3, line: 434, column: 9)
!355 = !DILocation(line: 435, column: 13, scope: !354)
!356 = !DILocation(line: 438, column: 1, scope: !296)
!357 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 455, type: !83, scopeLine: 456, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocalVariable(name: "sibling_node", scope: !357, file: !3, line: 457, type: !298)
!359 = !DILocation(line: 457, column: 10, scope: !357)
!360 = !DILocalVariable(name: "i", scope: !357, file: !3, line: 459, type: !66)
!361 = !DILocation(line: 459, column: 6, scope: !357)
!362 = !DILocation(line: 459, column: 10, scope: !357)
!363 = !DILocation(line: 460, column: 18, scope: !357)
!364 = !DILocation(line: 460, column: 27, scope: !357)
!365 = !DILocation(line: 460, column: 15, scope: !357)
!366 = !DILocation(line: 462, column: 6, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !3, line: 462, column: 6)
!368 = !DILocation(line: 462, column: 20, scope: !367)
!369 = !DILocation(line: 462, column: 28, scope: !367)
!370 = !DILocation(line: 462, column: 6, scope: !357)
!371 = !DILocalVariable(name: "next_sibling", scope: !372, file: !3, line: 463, type: !7)
!372 = distinct !DILexicalBlock(scope: !367, file: !3, line: 462, column: 36)
!373 = !DILocation(line: 463, column: 11, scope: !372)
!374 = !DILocation(line: 463, column: 26, scope: !372)
!375 = !DILocation(line: 463, column: 40, scope: !372)
!376 = !DILocation(line: 464, column: 17, scope: !372)
!377 = !DILocation(line: 464, column: 3, scope: !372)
!378 = !DILocation(line: 464, column: 15, scope: !372)
!379 = !DILocation(line: 467, column: 3, scope: !372)
!380 = !DILocation(line: 467, column: 13, scope: !372)
!381 = !DILocation(line: 469, column: 2, scope: !372)
!382 = !DILocalVariable(name: "sibling_node_obj", scope: !383, file: !3, line: 471, type: !42)
!383 = distinct !DILexicalBlock(scope: !367, file: !3, line: 469, column: 9)
!384 = !DILocation(line: 471, column: 10, scope: !383)
!385 = !DILocation(line: 471, column: 30, scope: !383)
!386 = !DILocation(line: 471, column: 29, scope: !383)
!387 = !DILocation(line: 472, column: 3, scope: !383)
!388 = !DILocation(line: 472, column: 22, scope: !383)
!389 = !DILocation(line: 475, column: 3, scope: !383)
!390 = !DILocation(line: 475, column: 13, scope: !383)
!391 = !DILocation(line: 477, column: 1, scope: !357)
!392 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 494, type: !83, scopeLine: 495, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!393 = !DILocation(line: 497, column: 6, scope: !394)
!394 = distinct !DILexicalBlock(scope: !392, file: !3, line: 497, column: 6)
!395 = !DILocation(line: 497, column: 21, scope: !394)
!396 = !DILocation(line: 497, column: 6, scope: !392)
!397 = !DILocation(line: 498, column: 3, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !3, line: 497, column: 35)
!399 = distinct !{!399, !397, !400}
!400 = !DILocation(line: 498, column: 12, scope: !398)
!401 = !DILocalVariable(name: "child", scope: !392, file: !3, line: 501, type: !7)
!402 = !DILocation(line: 501, column: 10, scope: !392)
!403 = !DILocation(line: 501, column: 18, scope: !392)
!404 = !DILocalVariable(name: "child_node", scope: !392, file: !3, line: 502, type: !42)
!405 = !DILocation(line: 502, column: 9, scope: !392)
!406 = !DILocation(line: 502, column: 22, scope: !392)
!407 = !DILocation(line: 503, column: 13, scope: !392)
!408 = !DILocation(line: 508, column: 6, scope: !409)
!409 = distinct !DILexicalBlock(scope: !392, file: !3, line: 508, column: 6)
!410 = !DILocation(line: 508, column: 22, scope: !409)
!411 = !DILocation(line: 508, column: 28, scope: !409)
!412 = !DILocation(line: 508, column: 6, scope: !392)
!413 = !DILocalVariable(name: "parent_node_obj", scope: !414, file: !3, line: 510, type: !42)
!414 = distinct !DILexicalBlock(scope: !409, file: !3, line: 508, column: 36)
!415 = !DILocation(line: 510, column: 10, scope: !414)
!416 = !DILocation(line: 510, column: 28, scope: !414)
!417 = !DILocation(line: 511, column: 27, scope: !414)
!418 = !DILocation(line: 511, column: 19, scope: !414)
!419 = !DILocation(line: 511, column: 25, scope: !414)
!420 = !DILocation(line: 514, column: 16, scope: !414)
!421 = !DILocation(line: 514, column: 3, scope: !414)
!422 = !DILocation(line: 514, column: 14, scope: !414)
!423 = !DILocation(line: 515, column: 3, scope: !414)
!424 = !DILocation(line: 515, column: 12, scope: !414)
!425 = !DILocation(line: 515, column: 26, scope: !414)
!426 = !DILocation(line: 517, column: 2, scope: !414)
!427 = !DILocation(line: 520, column: 16, scope: !428)
!428 = distinct !DILexicalBlock(scope: !409, file: !3, line: 517, column: 9)
!429 = !DILocation(line: 520, column: 3, scope: !428)
!430 = !DILocation(line: 520, column: 14, scope: !428)
!431 = !DILocalVariable(name: "last_sibling_node", scope: !428, file: !3, line: 521, type: !42)
!432 = !DILocation(line: 521, column: 10, scope: !428)
!433 = !DILocation(line: 521, column: 30, scope: !428)
!434 = !DILocation(line: 523, column: 31, scope: !428)
!435 = !DILocation(line: 523, column: 21, scope: !428)
!436 = !DILocation(line: 523, column: 29, scope: !428)
!437 = !DILocation(line: 525, column: 3, scope: !428)
!438 = !DILocation(line: 525, column: 12, scope: !428)
!439 = !DILocation(line: 525, column: 26, scope: !428)
!440 = !DILocation(line: 527, column: 2, scope: !392)
!441 = !DILocation(line: 527, column: 11, scope: !392)
!442 = !DILocation(line: 527, column: 24, scope: !392)
!443 = !DILocation(line: 528, column: 15, scope: !392)
!444 = !DILocation(line: 528, column: 2, scope: !392)
!445 = !DILocation(line: 528, column: 13, scope: !392)
!446 = !DILocation(line: 529, column: 2, scope: !392)
!447 = !DILocation(line: 529, column: 16, scope: !392)
!448 = !DILocation(line: 532, column: 1, scope: !392)
!449 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 549, type: !83, scopeLine: 550, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!450 = !DILocation(line: 553, column: 15, scope: !449)
!451 = !DILocation(line: 553, column: 2, scope: !449)
!452 = !DILocation(line: 553, column: 13, scope: !449)
!453 = !DILocalVariable(name: "copy", scope: !449, file: !3, line: 559, type: !42)
!454 = !DILocation(line: 559, column: 9, scope: !449)
!455 = !DILocation(line: 559, column: 16, scope: !449)
!456 = !DILocation(line: 560, column: 13, scope: !449)
!457 = !DILocation(line: 561, column: 14, scope: !449)
!458 = !DILocation(line: 561, column: 34, scope: !449)
!459 = !DILocation(line: 561, column: 46, scope: !449)
!460 = !DILocation(line: 562, column: 12, scope: !449)
!461 = !DILocation(line: 562, column: 32, scope: !449)
!462 = !DILocation(line: 562, column: 44, scope: !449)
!463 = !DILocation(line: 565, column: 2, scope: !449)
!464 = !DILocation(line: 565, column: 22, scope: !449)
!465 = !DILocation(line: 565, column: 36, scope: !449)
!466 = !DILocation(line: 567, column: 8, scope: !467)
!467 = distinct !DILexicalBlock(scope: !449, file: !3, line: 567, column: 6)
!468 = !DILocation(line: 567, column: 6, scope: !467)
!469 = !DILocation(line: 567, column: 20, scope: !467)
!470 = !DILocation(line: 567, column: 6, scope: !449)
!471 = !DILocation(line: 569, column: 2, scope: !472)
!472 = distinct !DILexicalBlock(scope: !467, file: !3, line: 567, column: 35)
!473 = !DILocation(line: 572, column: 1, scope: !449)
!474 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 574, type: !83, scopeLine: 575, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!475 = !DILocation(line: 576, column: 2, scope: !474)
!476 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 579, type: !83, scopeLine: 579, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!477 = !DILocation(line: 581, column: 1, scope: !476)
!478 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 583, type: !479, scopeLine: 583, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!479 = !DISubroutineType(types: !480)
!480 = !{!66}
!481 = !DILocation(line: 585, column: 16, scope: !478)
!482 = !DILocation(line: 586, column: 10, scope: !478)
!483 = !DILocation(line: 587, column: 12, scope: !478)
!484 = !DILocation(line: 588, column: 5, scope: !478)
!485 = !DILocation(line: 590, column: 2, scope: !478)
!486 = !DILocation(line: 591, column: 2, scope: !478)
!487 = !DILocation(line: 591, column: 2, scope: !488)
!488 = distinct !DILexicalBlock(scope: !489, file: !3, line: 591, column: 2)
!489 = distinct !DILexicalBlock(scope: !478, file: !3, line: 591, column: 2)
!490 = !DILocation(line: 591, column: 2, scope: !489)
!491 = !DILocation(line: 591, column: 2, scope: !492)
!492 = distinct !DILexicalBlock(scope: !488, file: !3, line: 591, column: 2)
!493 = !DILocalVariable(name: "__x", scope: !494, file: !3, line: 591, type: !6)
!494 = distinct !DILexicalBlock(scope: !492, file: !3, line: 591, column: 2)
!495 = !DILocation(line: 591, column: 2, scope: !494)
!496 = !{i32 -2146608986}
!497 = !DILocalVariable(name: "__x", scope: !498, file: !3, line: 591, type: !6)
!498 = distinct !DILexicalBlock(scope: !492, file: !3, line: 591, column: 2)
!499 = !DILocation(line: 591, column: 2, scope: !498)
!500 = !{i32 -2146608861}
!501 = !DILocation(line: 591, column: 2, scope: !502)
!502 = distinct !DILexicalBlock(scope: !488, file: !3, line: 591, column: 2)
!503 = !DILocalVariable(name: "__x", scope: !504, file: !3, line: 591, type: !6)
!504 = distinct !DILexicalBlock(scope: !502, file: !3, line: 591, column: 2)
!505 = !DILocation(line: 591, column: 2, scope: !504)
!506 = !{i32 -2146608729}
!507 = !DILocalVariable(name: "__x", scope: !508, file: !3, line: 591, type: !6)
!508 = distinct !DILexicalBlock(scope: !502, file: !3, line: 591, column: 2)
!509 = !DILocation(line: 591, column: 2, scope: !508)
!510 = !{i32 -2146608604}
!511 = !DILocation(line: 592, column: 2, scope: !478)
!512 = !DILocation(line: 594, column: 2, scope: !478)
!513 = !DILocation(line: 594, column: 8, scope: !478)
!514 = !DILocation(line: 594, column: 21, scope: !478)
!515 = !DILocation(line: 596, column: 3, scope: !516)
!516 = distinct !DILexicalBlock(scope: !478, file: !3, line: 594, column: 35)
!517 = !DILocation(line: 597, column: 3, scope: !516)
!518 = !DILocation(line: 597, column: 3, scope: !519)
!519 = distinct !DILexicalBlock(scope: !520, file: !3, line: 597, column: 3)
!520 = distinct !DILexicalBlock(scope: !516, file: !3, line: 597, column: 3)
!521 = !DILocation(line: 597, column: 3, scope: !520)
!522 = !DILocation(line: 597, column: 3, scope: !523)
!523 = distinct !DILexicalBlock(scope: !519, file: !3, line: 597, column: 3)
!524 = !DILocalVariable(name: "__x", scope: !525, file: !3, line: 597, type: !6)
!525 = distinct !DILexicalBlock(scope: !523, file: !3, line: 597, column: 3)
!526 = !DILocation(line: 597, column: 3, scope: !525)
!527 = !{i32 -2146606453}
!528 = !DILocalVariable(name: "__x", scope: !529, file: !3, line: 597, type: !6)
!529 = distinct !DILexicalBlock(scope: !523, file: !3, line: 597, column: 3)
!530 = !DILocation(line: 597, column: 3, scope: !529)
!531 = !{i32 -2146606328}
!532 = !DILocation(line: 597, column: 3, scope: !533)
!533 = distinct !DILexicalBlock(scope: !519, file: !3, line: 597, column: 3)
!534 = !DILocalVariable(name: "__x", scope: !535, file: !3, line: 597, type: !6)
!535 = distinct !DILexicalBlock(scope: !533, file: !3, line: 597, column: 3)
!536 = !DILocation(line: 597, column: 3, scope: !535)
!537 = !{i32 -2146606196}
!538 = !DILocalVariable(name: "__x", scope: !539, file: !3, line: 597, type: !6)
!539 = distinct !DILexicalBlock(scope: !533, file: !3, line: 597, column: 3)
!540 = !DILocation(line: 597, column: 3, scope: !539)
!541 = !{i32 -2146606071}
!542 = !DILocation(line: 598, column: 3, scope: !516)
!543 = !DILocation(line: 600, column: 7, scope: !544)
!544 = distinct !DILexicalBlock(scope: !516, file: !3, line: 600, column: 7)
!545 = !DILocation(line: 600, column: 18, scope: !544)
!546 = !DILocation(line: 600, column: 7, scope: !516)
!547 = !DILocation(line: 602, column: 4, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !3, line: 600, column: 23)
!549 = !DILocation(line: 603, column: 4, scope: !548)
!550 = !DILocation(line: 603, column: 4, scope: !551)
!551 = distinct !DILexicalBlock(scope: !552, file: !3, line: 603, column: 4)
!552 = distinct !DILexicalBlock(scope: !548, file: !3, line: 603, column: 4)
!553 = !DILocation(line: 603, column: 4, scope: !552)
!554 = !DILocation(line: 603, column: 4, scope: !555)
!555 = distinct !DILexicalBlock(scope: !551, file: !3, line: 603, column: 4)
!556 = !DILocalVariable(name: "__x", scope: !557, file: !3, line: 603, type: !6)
!557 = distinct !DILexicalBlock(scope: !555, file: !3, line: 603, column: 4)
!558 = !DILocation(line: 603, column: 4, scope: !557)
!559 = !{i32 -2146603925}
!560 = !DILocalVariable(name: "__x", scope: !561, file: !3, line: 603, type: !6)
!561 = distinct !DILexicalBlock(scope: !555, file: !3, line: 603, column: 4)
!562 = !DILocation(line: 603, column: 4, scope: !561)
!563 = !{i32 -2146603800}
!564 = !DILocation(line: 603, column: 4, scope: !565)
!565 = distinct !DILexicalBlock(scope: !551, file: !3, line: 603, column: 4)
!566 = !DILocalVariable(name: "__x", scope: !567, file: !3, line: 603, type: !6)
!567 = distinct !DILexicalBlock(scope: !565, file: !3, line: 603, column: 4)
!568 = !DILocation(line: 603, column: 4, scope: !567)
!569 = !{i32 -2146603668}
!570 = !DILocalVariable(name: "__x", scope: !571, file: !3, line: 603, type: !6)
!571 = distinct !DILexicalBlock(scope: !565, file: !3, line: 603, column: 4)
!572 = !DILocation(line: 603, column: 4, scope: !571)
!573 = !{i32 -2146603543}
!574 = !DILocation(line: 604, column: 4, scope: !548)
!575 = !DILocation(line: 606, column: 3, scope: !548)
!576 = !DILocation(line: 608, column: 3, scope: !516)
!577 = !DILocation(line: 610, column: 4, scope: !578)
!578 = distinct !DILexicalBlock(scope: !516, file: !3, line: 608, column: 13)
!579 = !DILocation(line: 611, column: 4, scope: !578)
!580 = !DILocation(line: 611, column: 4, scope: !581)
!581 = distinct !DILexicalBlock(scope: !582, file: !3, line: 611, column: 4)
!582 = distinct !DILexicalBlock(scope: !578, file: !3, line: 611, column: 4)
!583 = !DILocation(line: 611, column: 4, scope: !582)
!584 = !DILocation(line: 611, column: 4, scope: !585)
!585 = distinct !DILexicalBlock(scope: !581, file: !3, line: 611, column: 4)
!586 = !DILocalVariable(name: "__x", scope: !587, file: !3, line: 611, type: !6)
!587 = distinct !DILexicalBlock(scope: !585, file: !3, line: 611, column: 4)
!588 = !DILocation(line: 611, column: 4, scope: !587)
!589 = !{i32 -2146601419}
!590 = !DILocalVariable(name: "__x", scope: !591, file: !3, line: 611, type: !6)
!591 = distinct !DILexicalBlock(scope: !585, file: !3, line: 611, column: 4)
!592 = !DILocation(line: 611, column: 4, scope: !591)
!593 = !{i32 -2146601294}
!594 = !DILocation(line: 611, column: 4, scope: !595)
!595 = distinct !DILexicalBlock(scope: !581, file: !3, line: 611, column: 4)
!596 = !DILocalVariable(name: "__x", scope: !597, file: !3, line: 611, type: !6)
!597 = distinct !DILexicalBlock(scope: !595, file: !3, line: 611, column: 4)
!598 = !DILocation(line: 611, column: 4, scope: !597)
!599 = !{i32 -2146601162}
!600 = !DILocalVariable(name: "__x", scope: !601, file: !3, line: 611, type: !6)
!601 = distinct !DILexicalBlock(scope: !595, file: !3, line: 611, column: 4)
!602 = !DILocation(line: 611, column: 4, scope: !601)
!603 = !{i32 -2146601037}
!604 = !DILocation(line: 612, column: 4, scope: !578)
!605 = !DILocation(line: 614, column: 4, scope: !578)
!606 = !DILocation(line: 615, column: 4, scope: !578)
!607 = !DILocation(line: 615, column: 4, scope: !608)
!608 = distinct !DILexicalBlock(scope: !609, file: !3, line: 615, column: 4)
!609 = distinct !DILexicalBlock(scope: !578, file: !3, line: 615, column: 4)
!610 = !DILocation(line: 615, column: 4, scope: !609)
!611 = !DILocation(line: 615, column: 4, scope: !612)
!612 = distinct !DILexicalBlock(scope: !608, file: !3, line: 615, column: 4)
!613 = !DILocalVariable(name: "__x", scope: !614, file: !3, line: 615, type: !6)
!614 = distinct !DILexicalBlock(scope: !612, file: !3, line: 615, column: 4)
!615 = !DILocation(line: 615, column: 4, scope: !614)
!616 = !{i32 -2146598913}
!617 = !DILocalVariable(name: "__x", scope: !618, file: !3, line: 615, type: !6)
!618 = distinct !DILexicalBlock(scope: !612, file: !3, line: 615, column: 4)
!619 = !DILocation(line: 615, column: 4, scope: !618)
!620 = !{i32 -2146598788}
!621 = !DILocation(line: 615, column: 4, scope: !622)
!622 = distinct !DILexicalBlock(scope: !608, file: !3, line: 615, column: 4)
!623 = !DILocalVariable(name: "__x", scope: !624, file: !3, line: 615, type: !6)
!624 = distinct !DILexicalBlock(scope: !622, file: !3, line: 615, column: 4)
!625 = !DILocation(line: 615, column: 4, scope: !624)
!626 = !{i32 -2146598656}
!627 = !DILocalVariable(name: "__x", scope: !628, file: !3, line: 615, type: !6)
!628 = distinct !DILexicalBlock(scope: !622, file: !3, line: 615, column: 4)
!629 = !DILocation(line: 615, column: 4, scope: !628)
!630 = !{i32 -2146598531}
!631 = !DILocation(line: 616, column: 4, scope: !578)
!632 = !DILocation(line: 618, column: 4, scope: !578)
!633 = !DILocation(line: 618, column: 11, scope: !578)
!634 = !DILocation(line: 618, column: 22, scope: !578)
!635 = !DILocation(line: 620, column: 5, scope: !636)
!636 = distinct !DILexicalBlock(scope: !578, file: !3, line: 618, column: 28)
!637 = !DILocation(line: 621, column: 5, scope: !636)
!638 = !DILocation(line: 621, column: 5, scope: !639)
!639 = distinct !DILexicalBlock(scope: !640, file: !3, line: 621, column: 5)
!640 = distinct !DILexicalBlock(scope: !636, file: !3, line: 621, column: 5)
!641 = !DILocation(line: 621, column: 5, scope: !640)
!642 = !DILocation(line: 621, column: 5, scope: !643)
!643 = distinct !DILexicalBlock(scope: !639, file: !3, line: 621, column: 5)
!644 = !DILocalVariable(name: "__x", scope: !645, file: !3, line: 621, type: !6)
!645 = distinct !DILexicalBlock(scope: !643, file: !3, line: 621, column: 5)
!646 = !DILocation(line: 621, column: 5, scope: !645)
!647 = !{i32 -2146596385}
!648 = !DILocalVariable(name: "__x", scope: !649, file: !3, line: 621, type: !6)
!649 = distinct !DILexicalBlock(scope: !643, file: !3, line: 621, column: 5)
!650 = !DILocation(line: 621, column: 5, scope: !649)
!651 = !{i32 -2146596260}
!652 = !DILocation(line: 621, column: 5, scope: !653)
!653 = distinct !DILexicalBlock(scope: !639, file: !3, line: 621, column: 5)
!654 = !DILocalVariable(name: "__x", scope: !655, file: !3, line: 621, type: !6)
!655 = distinct !DILexicalBlock(scope: !653, file: !3, line: 621, column: 5)
!656 = !DILocation(line: 621, column: 5, scope: !655)
!657 = !{i32 -2146596128}
!658 = !DILocalVariable(name: "__x", scope: !659, file: !3, line: 621, type: !6)
!659 = distinct !DILexicalBlock(scope: !653, file: !3, line: 621, column: 5)
!660 = !DILocation(line: 621, column: 5, scope: !659)
!661 = !{i32 -2146596003}
!662 = !DILocation(line: 622, column: 5, scope: !636)
!663 = distinct !{!663, !632, !664}
!664 = !DILocation(line: 624, column: 4, scope: !578)
!665 = !DILocation(line: 626, column: 8, scope: !666)
!666 = distinct !DILexicalBlock(scope: !578, file: !3, line: 626, column: 8)
!667 = !DILocation(line: 626, column: 19, scope: !666)
!668 = !DILocation(line: 626, column: 8, scope: !578)
!669 = !DILocation(line: 627, column: 5, scope: !666)
!670 = distinct !{!670, !576, !671}
!671 = !DILocation(line: 628, column: 3, scope: !516)
!672 = !DILocation(line: 630, column: 7, scope: !673)
!673 = distinct !DILexicalBlock(scope: !516, file: !3, line: 630, column: 7)
!674 = !DILocation(line: 630, column: 18, scope: !673)
!675 = !DILocation(line: 630, column: 7, scope: !516)
!676 = !DILocation(line: 631, column: 4, scope: !677)
!677 = distinct !DILexicalBlock(scope: !673, file: !3, line: 630, column: 24)
!678 = !DILocation(line: 633, column: 5, scope: !679)
!679 = distinct !DILexicalBlock(scope: !677, file: !3, line: 631, column: 6)
!680 = !DILocation(line: 634, column: 5, scope: !679)
!681 = !DILocation(line: 634, column: 5, scope: !682)
!682 = distinct !DILexicalBlock(scope: !683, file: !3, line: 634, column: 5)
!683 = distinct !DILexicalBlock(scope: !679, file: !3, line: 634, column: 5)
!684 = !DILocation(line: 634, column: 5, scope: !683)
!685 = !DILocation(line: 634, column: 5, scope: !686)
!686 = distinct !DILexicalBlock(scope: !682, file: !3, line: 634, column: 5)
!687 = !DILocalVariable(name: "__x", scope: !688, file: !3, line: 634, type: !6)
!688 = distinct !DILexicalBlock(scope: !686, file: !3, line: 634, column: 5)
!689 = !DILocation(line: 634, column: 5, scope: !688)
!690 = !{i32 -2146593835}
!691 = !DILocalVariable(name: "__x", scope: !692, file: !3, line: 634, type: !6)
!692 = distinct !DILexicalBlock(scope: !686, file: !3, line: 634, column: 5)
!693 = !DILocation(line: 634, column: 5, scope: !692)
!694 = !{i32 -2146593710}
!695 = !DILocation(line: 634, column: 5, scope: !696)
!696 = distinct !DILexicalBlock(scope: !682, file: !3, line: 634, column: 5)
!697 = !DILocalVariable(name: "__x", scope: !698, file: !3, line: 634, type: !6)
!698 = distinct !DILexicalBlock(scope: !696, file: !3, line: 634, column: 5)
!699 = !DILocation(line: 634, column: 5, scope: !698)
!700 = !{i32 -2146593578}
!701 = !DILocalVariable(name: "__x", scope: !702, file: !3, line: 634, type: !6)
!702 = distinct !DILexicalBlock(scope: !696, file: !3, line: 634, column: 5)
!703 = !DILocation(line: 634, column: 5, scope: !702)
!704 = !{i32 -2146593453}
!705 = !DILocation(line: 635, column: 5, scope: !679)
!706 = !DILocation(line: 637, column: 4, scope: !679)
!707 = !DILocation(line: 637, column: 13, scope: !677)
!708 = !DILocation(line: 637, column: 24, scope: !677)
!709 = distinct !{!709, !676, !710}
!710 = !DILocation(line: 637, column: 28, scope: !677)
!711 = !DILocation(line: 638, column: 3, scope: !677)
!712 = !DILocation(line: 640, column: 3, scope: !516)
!713 = !DILocation(line: 641, column: 3, scope: !516)
!714 = !DILocation(line: 641, column: 3, scope: !715)
!715 = distinct !DILexicalBlock(scope: !716, file: !3, line: 641, column: 3)
!716 = distinct !DILexicalBlock(scope: !516, file: !3, line: 641, column: 3)
!717 = !DILocation(line: 641, column: 3, scope: !716)
!718 = !DILocation(line: 641, column: 3, scope: !719)
!719 = distinct !DILexicalBlock(scope: !715, file: !3, line: 641, column: 3)
!720 = !DILocalVariable(name: "__x", scope: !721, file: !3, line: 641, type: !6)
!721 = distinct !DILexicalBlock(scope: !719, file: !3, line: 641, column: 3)
!722 = !DILocation(line: 641, column: 3, scope: !721)
!723 = !{i32 -2146591307}
!724 = !DILocalVariable(name: "__x", scope: !725, file: !3, line: 641, type: !6)
!725 = distinct !DILexicalBlock(scope: !719, file: !3, line: 641, column: 3)
!726 = !DILocation(line: 641, column: 3, scope: !725)
!727 = !{i32 -2146591182}
!728 = !DILocation(line: 641, column: 3, scope: !729)
!729 = distinct !DILexicalBlock(scope: !715, file: !3, line: 641, column: 3)
!730 = !DILocalVariable(name: "__x", scope: !731, file: !3, line: 641, type: !6)
!731 = distinct !DILexicalBlock(scope: !729, file: !3, line: 641, column: 3)
!732 = !DILocation(line: 641, column: 3, scope: !731)
!733 = !{i32 -2146591050}
!734 = !DILocalVariable(name: "__x", scope: !735, file: !3, line: 641, type: !6)
!735 = distinct !DILexicalBlock(scope: !729, file: !3, line: 641, column: 3)
!736 = !DILocation(line: 641, column: 3, scope: !735)
!737 = !{i32 -2146590925}
!738 = !DILocation(line: 642, column: 3, scope: !516)
!739 = !DILocation(line: 644, column: 3, scope: !516)
!740 = !DILocation(line: 645, column: 3, scope: !516)
!741 = !DILocation(line: 645, column: 3, scope: !742)
!742 = distinct !DILexicalBlock(scope: !743, file: !3, line: 645, column: 3)
!743 = distinct !DILexicalBlock(scope: !516, file: !3, line: 645, column: 3)
!744 = !DILocation(line: 645, column: 3, scope: !743)
!745 = !DILocation(line: 645, column: 3, scope: !746)
!746 = distinct !DILexicalBlock(scope: !742, file: !3, line: 645, column: 3)
!747 = !DILocalVariable(name: "__x", scope: !748, file: !3, line: 645, type: !6)
!748 = distinct !DILexicalBlock(scope: !746, file: !3, line: 645, column: 3)
!749 = !DILocation(line: 645, column: 3, scope: !748)
!750 = !{i32 -2146588801}
!751 = !DILocalVariable(name: "__x", scope: !752, file: !3, line: 645, type: !6)
!752 = distinct !DILexicalBlock(scope: !746, file: !3, line: 645, column: 3)
!753 = !DILocation(line: 645, column: 3, scope: !752)
!754 = !{i32 -2146588676}
!755 = !DILocation(line: 645, column: 3, scope: !756)
!756 = distinct !DILexicalBlock(scope: !742, file: !3, line: 645, column: 3)
!757 = !DILocalVariable(name: "__x", scope: !758, file: !3, line: 645, type: !6)
!758 = distinct !DILexicalBlock(scope: !756, file: !3, line: 645, column: 3)
!759 = !DILocation(line: 645, column: 3, scope: !758)
!760 = !{i32 -2146588544}
!761 = !DILocalVariable(name: "__x", scope: !762, file: !3, line: 645, type: !6)
!762 = distinct !DILexicalBlock(scope: !756, file: !3, line: 645, column: 3)
!763 = !DILocation(line: 645, column: 3, scope: !762)
!764 = !{i32 -2146588419}
!765 = !DILocation(line: 646, column: 3, scope: !516)
!766 = distinct !{!766, !512, !767}
!767 = !DILocation(line: 648, column: 2, scope: !478)
!768 = !DILocation(line: 650, column: 2, scope: !478)
!769 = !DILocation(line: 651, column: 1, scope: !478)
