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
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x13 = alloca i16, align 2
  %tmp14 = alloca i16, align 2
  %__x16 = alloca i16, align 2
  %tmp17 = alloca i16, align 2
  %__x30 = alloca i16, align 2
  %tmp31 = alloca i16, align 2
  %__x33 = alloca i16, align 2
  %tmp34 = alloca i16, align 2
  %__x43 = alloca i16, align 2
  %tmp44 = alloca i16, align 2
  %__x46 = alloca i16, align 2
  %tmp47 = alloca i16, align 2
  %__x63 = alloca i16, align 2
  %tmp64 = alloca i16, align 2
  %__x66 = alloca i16, align 2
  %tmp67 = alloca i16, align 2
  %__x76 = alloca i16, align 2
  %tmp77 = alloca i16, align 2
  %__x79 = alloca i16, align 2
  %tmp80 = alloca i16, align 2
  %__x96 = alloca i16, align 2
  %tmp97 = alloca i16, align 2
  %__x99 = alloca i16, align 2
  %tmp100 = alloca i16, align 2
  %__x109 = alloca i16, align 2
  %tmp110 = alloca i16, align 2
  %__x112 = alloca i16, align 2
  %tmp113 = alloca i16, align 2
  %__x126 = alloca i16, align 2
  %tmp127 = alloca i16, align 2
  %__x129 = alloca i16, align 2
  %tmp130 = alloca i16, align 2
  %__x139 = alloca i16, align 2
  %tmp140 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x161 = alloca i16, align 2
  %tmp162 = alloca i16, align 2
  %__x164 = alloca i16, align 2
  %tmp165 = alloca i16, align 2
  %__x174 = alloca i16, align 2
  %tmp175 = alloca i16, align 2
  %__x177 = alloca i16, align 2
  %tmp178 = alloca i16, align 2
  %__x202 = alloca i16, align 2
  %tmp203 = alloca i16, align 2
  %__x205 = alloca i16, align 2
  %tmp206 = alloca i16, align 2
  %__x215 = alloca i16, align 2
  %tmp216 = alloca i16, align 2
  %__x218 = alloca i16, align 2
  %tmp219 = alloca i16, align 2
  %__x237 = alloca i16, align 2
  %tmp238 = alloca i16, align 2
  %__x240 = alloca i16, align 2
  %tmp241 = alloca i16, align 2
  %__x250 = alloca i16, align 2
  %tmp251 = alloca i16, align 2
  %__x253 = alloca i16, align 2
  %tmp254 = alloca i16, align 2
  %__x268 = alloca i16, align 2
  %tmp269 = alloca i16, align 2
  %__x271 = alloca i16, align 2
  %tmp272 = alloca i16, align 2
  %__x281 = alloca i16, align 2
  %tmp282 = alloca i16, align 2
  %__x284 = alloca i16, align 2
  %tmp285 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !481
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !482
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !483
  call void @camel_init(), !dbg !484
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !485
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !486
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 5, !dbg !487
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !488
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !489
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !490
  %2 = load i16, i16* %letter_idx, align 2, !dbg !490
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %2, !dbg !485
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !492
  %dict3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 5, !dbg !493
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !494
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !495
  %letter_idx5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !496
  %5 = load i16, i16* %letter_idx5, align 2, !dbg !496
  %arrayidx6 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict3, i16 0, i16 %5, !dbg !491
  %6 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !491
  %7 = bitcast %struct._node_t* %arrayidx6 to i8*, !dbg !491
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 6, i1 false), !dbg !491
  call void @task_init(), !dbg !497
  br label %do.body, !dbg !498

do.body:                                          ; preds = %entry
  %8 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !499
  %cmp = icmp eq i16 %8, 1, !dbg !499
  br i1 %cmp, label %if.then, label %if.else, !dbg !502

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !503
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !503
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 0, !dbg !503
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !503
  call void @__dump_registers(i16* %arraydecay), !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !505, metadata !DIExpression()), !dbg !507
  %10 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !507, !srcloc !508
  store i16 %10, i16* %__x, align 2, !dbg !507
  %11 = load i16, i16* %__x, align 2, !dbg !507
  store i16 %11, i16* %tmp, align 2, !dbg !507
  %12 = load i16, i16* %tmp, align 2, !dbg !507
  %add = add i16 %12, 2, !dbg !503
  %13 = inttoptr i16 %add to i8*, !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !509, metadata !DIExpression()), !dbg !511
  %14 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !511, !srcloc !512
  store i16 %14, i16* %__x7, align 2, !dbg !511
  %15 = load i16, i16* %__x7, align 2, !dbg !511
  store i16 %15, i16* %tmp8, align 2, !dbg !511
  %16 = load i16, i16* %tmp8, align 2, !dbg !511
  %add9 = add i16 %16, 2, !dbg !503
  %sub = sub i16 9216, %add9, !dbg !503
  %call = call zeroext i16 @__fast_hw_crc(i8* %13, i16 zeroext %sub, i16 zeroext -1), !dbg !503
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !503
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !503
  %19 = load i16, i16* @tmp_stack_crc, align 2, !dbg !503
  %call10 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext 3520, i16 zeroext %19), !dbg !503
  store i16 %call10, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %20 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 2, !dbg !503
  store i16 %20, i16* %stack_and_buf_crc, align 2, !dbg !503
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !503
  br label %if.end, !dbg !503

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !513
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !513
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 0, !dbg !513
  %arraydecay12 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !513
  call void @__dump_registers(i16* %arraydecay12), !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x13, metadata !515, metadata !DIExpression()), !dbg !517
  %23 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !517, !srcloc !518
  store i16 %23, i16* %__x13, align 2, !dbg !517
  %24 = load i16, i16* %__x13, align 2, !dbg !517
  store i16 %24, i16* %tmp14, align 2, !dbg !517
  %25 = load i16, i16* %tmp14, align 2, !dbg !517
  %add15 = add i16 %25, 2, !dbg !513
  %26 = inttoptr i16 %add15 to i8*, !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x16, metadata !519, metadata !DIExpression()), !dbg !521
  %27 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !521, !srcloc !522
  store i16 %27, i16* %__x16, align 2, !dbg !521
  %28 = load i16, i16* %__x16, align 2, !dbg !521
  store i16 %28, i16* %tmp17, align 2, !dbg !521
  %29 = load i16, i16* %tmp17, align 2, !dbg !521
  %add18 = add i16 %29, 2, !dbg !513
  %sub19 = sub i16 9216, %add18, !dbg !513
  %call20 = call zeroext i16 @__fast_hw_crc(i8* %26, i16 zeroext %sub19, i16 zeroext -1), !dbg !513
  store i16 %call20, i16* @tmp_stack_crc, align 2, !dbg !513
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !513
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !513
  %call21 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 3520, i16 zeroext %32), !dbg !513
  store i16 %call21, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %stack_and_buf_crc22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !513
  store i16 %33, i16* %stack_and_buf_crc22, align 2, !dbg !513
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !513
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !502

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !523
  br label %while.cond, !dbg !524

while.cond:                                       ; preds = %do.end293, %do.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !525
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !525
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 3, !dbg !525
  %36 = load i16, i16* %out_len, align 2, !dbg !525
  %cmp24 = icmp ult i16 %36, 64, !dbg !526
  br i1 %cmp24, label %while.body, label %while.end294, !dbg !524

while.body:                                       ; preds = %while.cond
  %tmp1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp1, i32 0, i32 1
  %global2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp3 = load i16, i16* %global2, align 2
  %tmp4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp4, i32 0, i32 1
  %global6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global5, i32 0, i32 1
  store i16 %tmp3, i16* %global6, align 2
  call void @task_sample(), !dbg !527
  br label %do.body25, !dbg !529

do.body25:                                        ; preds = %while.body
  %37 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !530
  %cmp26 = icmp eq i16 %37, 1, !dbg !530
  br i1 %cmp26, label %if.then27, label %if.else40, !dbg !533

if.then27:                                        ; preds = %do.body25
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !534
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !534
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !534
  %reg_file28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 0, !dbg !534
  %arraydecay29 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file28, i16 0, i16 0, !dbg !534
  call void @__dump_registers(i16* %arraydecay29), !dbg !534
  call void @llvm.dbg.declare(metadata i16* %__x30, metadata !536, metadata !DIExpression()), !dbg !538
  %39 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !538, !srcloc !539
  store i16 %39, i16* %__x30, align 2, !dbg !538
  %40 = load i16, i16* %__x30, align 2, !dbg !538
  store i16 %40, i16* %tmp31, align 2, !dbg !538
  %41 = load i16, i16* %tmp31, align 2, !dbg !538
  %add32 = add i16 %41, 2, !dbg !534
  %42 = inttoptr i16 %add32 to i8*, !dbg !534
  call void @llvm.dbg.declare(metadata i16* %__x33, metadata !540, metadata !DIExpression()), !dbg !542
  %43 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !542, !srcloc !543
  store i16 %43, i16* %__x33, align 2, !dbg !542
  %44 = load i16, i16* %__x33, align 2, !dbg !542
  store i16 %44, i16* %tmp34, align 2, !dbg !542
  %45 = load i16, i16* %tmp34, align 2, !dbg !542
  %add35 = add i16 %45, 2, !dbg !534
  %sub36 = sub i16 9216, %add35, !dbg !534
  %call37 = call zeroext i16 @__fast_hw_crc(i8* %42, i16 zeroext %sub36, i16 zeroext -1), !dbg !534
  store i16 %call37, i16* @tmp_stack_crc, align 2, !dbg !534
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !534
  %47 = bitcast %struct.camel_buffer_t* %46 to i8*, !dbg !534
  %48 = load i16, i16* @tmp_stack_crc, align 2, !dbg !534
  %call38 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext 3520, i16 zeroext %48), !dbg !534
  store i16 %call38, i16* @tmp_stack_buf_crc, align 2, !dbg !534
  %49 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !534
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !534
  %stack_and_buf_crc39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 2, !dbg !534
  store i16 %49, i16* %stack_and_buf_crc39, align 2, !dbg !534
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !534
  br label %if.end53, !dbg !534

if.else40:                                        ; preds = %do.body25
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !544
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !544
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %reg_file41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 0, !dbg !544
  %arraydecay42 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file41, i16 0, i16 0, !dbg !544
  call void @__dump_registers(i16* %arraydecay42), !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x43, metadata !546, metadata !DIExpression()), !dbg !548
  %52 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !548, !srcloc !549
  store i16 %52, i16* %__x43, align 2, !dbg !548
  %53 = load i16, i16* %__x43, align 2, !dbg !548
  store i16 %53, i16* %tmp44, align 2, !dbg !548
  %54 = load i16, i16* %tmp44, align 2, !dbg !548
  %add45 = add i16 %54, 2, !dbg !544
  %55 = inttoptr i16 %add45 to i8*, !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x46, metadata !550, metadata !DIExpression()), !dbg !552
  %56 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !552, !srcloc !553
  store i16 %56, i16* %__x46, align 2, !dbg !552
  %57 = load i16, i16* %__x46, align 2, !dbg !552
  store i16 %57, i16* %tmp47, align 2, !dbg !552
  %58 = load i16, i16* %tmp47, align 2, !dbg !552
  %add48 = add i16 %58, 2, !dbg !544
  %sub49 = sub i16 9216, %add48, !dbg !544
  %call50 = call zeroext i16 @__fast_hw_crc(i8* %55, i16 zeroext %sub49, i16 zeroext -1), !dbg !544
  store i16 %call50, i16* @tmp_stack_crc, align 2, !dbg !544
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %60 = bitcast %struct.camel_buffer_t* %59 to i8*, !dbg !544
  %61 = load i16, i16* @tmp_stack_crc, align 2, !dbg !544
  %call51 = call zeroext i16 @__fast_hw_crc(i8* %60, i16 zeroext 3520, i16 zeroext %61), !dbg !544
  store i16 %call51, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %62 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %stack_and_buf_crc52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %63, i32 0, i32 2, !dbg !544
  store i16 %62, i16* %stack_and_buf_crc52, align 2, !dbg !544
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !544
  br label %if.end53

if.end53:                                         ; preds = %if.else40, %if.then27
  br label %do.end54, !dbg !533

do.end54:                                         ; preds = %if.end53
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i32 0, i32 1
  %global9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global8, i32 0, i32 1
  %tmp10 = load i16, i16* %global9, align 2
  %tmp11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp11, i32 0, i32 1
  %global13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global12, i32 0, i32 1
  store i16 %tmp10, i16* %global13, align 2
  %tmp15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp15, i32 0, i32 1
  %global17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global16, i32 0, i32 18
  %tmp18 = load i16, i16* %global17, align 2
  %tmp19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp19, i32 0, i32 1
  %global21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global20, i32 0, i32 18
  store i16 %tmp18, i16* %global21, align 2
  call void @task_commit(), !dbg !554
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !555
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %64, i32 0, i32 1, !dbg !555
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 18, !dbg !555
  %65 = load i16, i16* %check, align 2, !dbg !555
  %cmp56 = icmp eq i16 %65, 0, !dbg !557
  br i1 %cmp56, label %if.then57, label %if.end88, !dbg !558

if.then57:                                        ; preds = %do.end54
  %tmp22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp22, i32 0, i32 1
  %global24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global23, i32 0, i32 2
  %tmp25 = load i16, i16* %global24, align 2
  %tmp26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp26, i32 0, i32 1
  %global28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global27, i32 0, i32 2
  store i16 %tmp25, i16* %global28, align 2
  call void @task_measure_temp(), !dbg !559
  br label %do.body58, !dbg !561

do.body58:                                        ; preds = %if.then57
  %66 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !562
  %cmp59 = icmp eq i16 %66, 1, !dbg !562
  br i1 %cmp59, label %if.then60, label %if.else73, !dbg !565

if.then60:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !566
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !566
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %reg_file61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i32 0, i32 0, !dbg !566
  %arraydecay62 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file61, i16 0, i16 0, !dbg !566
  call void @__dump_registers(i16* %arraydecay62), !dbg !566
  call void @llvm.dbg.declare(metadata i16* %__x63, metadata !568, metadata !DIExpression()), !dbg !570
  %68 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !570, !srcloc !571
  store i16 %68, i16* %__x63, align 2, !dbg !570
  %69 = load i16, i16* %__x63, align 2, !dbg !570
  store i16 %69, i16* %tmp64, align 2, !dbg !570
  %70 = load i16, i16* %tmp64, align 2, !dbg !570
  %add65 = add i16 %70, 2, !dbg !566
  %71 = inttoptr i16 %add65 to i8*, !dbg !566
  call void @llvm.dbg.declare(metadata i16* %__x66, metadata !572, metadata !DIExpression()), !dbg !574
  %72 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !574, !srcloc !575
  store i16 %72, i16* %__x66, align 2, !dbg !574
  %73 = load i16, i16* %__x66, align 2, !dbg !574
  store i16 %73, i16* %tmp67, align 2, !dbg !574
  %74 = load i16, i16* %tmp67, align 2, !dbg !574
  %add68 = add i16 %74, 2, !dbg !566
  %sub69 = sub i16 9216, %add68, !dbg !566
  %call70 = call zeroext i16 @__fast_hw_crc(i8* %71, i16 zeroext %sub69, i16 zeroext -1), !dbg !566
  store i16 %call70, i16* @tmp_stack_crc, align 2, !dbg !566
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %76 = bitcast %struct.camel_buffer_t* %75 to i8*, !dbg !566
  %77 = load i16, i16* @tmp_stack_crc, align 2, !dbg !566
  %call71 = call zeroext i16 @__fast_hw_crc(i8* %76, i16 zeroext 3520, i16 zeroext %77), !dbg !566
  store i16 %call71, i16* @tmp_stack_buf_crc, align 2, !dbg !566
  %78 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !566
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %stack_and_buf_crc72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 2, !dbg !566
  store i16 %78, i16* %stack_and_buf_crc72, align 2, !dbg !566
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !566
  br label %if.end86, !dbg !566

if.else73:                                        ; preds = %do.body58
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !576
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !576
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %reg_file74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 0, !dbg !576
  %arraydecay75 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file74, i16 0, i16 0, !dbg !576
  call void @__dump_registers(i16* %arraydecay75), !dbg !576
  call void @llvm.dbg.declare(metadata i16* %__x76, metadata !578, metadata !DIExpression()), !dbg !580
  %81 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !580, !srcloc !581
  store i16 %81, i16* %__x76, align 2, !dbg !580
  %82 = load i16, i16* %__x76, align 2, !dbg !580
  store i16 %82, i16* %tmp77, align 2, !dbg !580
  %83 = load i16, i16* %tmp77, align 2, !dbg !580
  %add78 = add i16 %83, 2, !dbg !576
  %84 = inttoptr i16 %add78 to i8*, !dbg !576
  call void @llvm.dbg.declare(metadata i16* %__x79, metadata !582, metadata !DIExpression()), !dbg !584
  %85 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !584, !srcloc !585
  store i16 %85, i16* %__x79, align 2, !dbg !584
  %86 = load i16, i16* %__x79, align 2, !dbg !584
  store i16 %86, i16* %tmp80, align 2, !dbg !584
  %87 = load i16, i16* %tmp80, align 2, !dbg !584
  %add81 = add i16 %87, 2, !dbg !576
  %sub82 = sub i16 9216, %add81, !dbg !576
  %call83 = call zeroext i16 @__fast_hw_crc(i8* %84, i16 zeroext %sub82, i16 zeroext -1), !dbg !576
  store i16 %call83, i16* @tmp_stack_crc, align 2, !dbg !576
  %88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %89 = bitcast %struct.camel_buffer_t* %88 to i8*, !dbg !576
  %90 = load i16, i16* @tmp_stack_crc, align 2, !dbg !576
  %call84 = call zeroext i16 @__fast_hw_crc(i8* %89, i16 zeroext 3520, i16 zeroext %90), !dbg !576
  store i16 %call84, i16* @tmp_stack_buf_crc, align 2, !dbg !576
  %91 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !576
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %stack_and_buf_crc85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %92, i32 0, i32 2, !dbg !576
  store i16 %91, i16* %stack_and_buf_crc85, align 2, !dbg !576
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !576
  br label %if.end86

if.end86:                                         ; preds = %if.else73, %if.then60
  br label %do.end87, !dbg !565

do.end87:                                         ; preds = %if.end86
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
  %tmp40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp40, i32 0, i32 1
  %global42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global41, i32 0, i32 6
  store i16 %tmp39, i16* %global42, align 2
  call void @task_commit(), !dbg !586
  br label %if.end88, !dbg !587

if.end88:                                         ; preds = %do.end87, %do.end54
  br label %while.body90, !dbg !588

while.body90:                                     ; preds = %if.end88, %if.end190
  %tmp43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp43, i32 0, i32 1
  %global45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global44, i32 0, i32 1
  %tmp46 = load i16, i16* %global45, align 2
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 1
  store i16 %tmp46, i16* %global50, align 2
  %tmp51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i32 0, i32 1
  %global53 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global52, i32 0, i32 6
  %tmp54 = load i16, i16* %global53, align 2
  %tmp55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp55, i32 0, i32 1
  %global57 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global56, i32 0, i32 6
  store i16 %tmp54, i16* %global57, align 2
  call void @task_letterize(), !dbg !589
  br label %do.body91, !dbg !591

do.body91:                                        ; preds = %while.body90
  %93 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !592
  %cmp92 = icmp eq i16 %93, 1, !dbg !592
  br i1 %cmp92, label %if.then93, label %if.else106, !dbg !595

if.then93:                                        ; preds = %do.body91
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !596
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !596
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %reg_file94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %94, i32 0, i32 0, !dbg !596
  %arraydecay95 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file94, i16 0, i16 0, !dbg !596
  call void @__dump_registers(i16* %arraydecay95), !dbg !596
  call void @llvm.dbg.declare(metadata i16* %__x96, metadata !598, metadata !DIExpression()), !dbg !600
  %95 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !600, !srcloc !601
  store i16 %95, i16* %__x96, align 2, !dbg !600
  %96 = load i16, i16* %__x96, align 2, !dbg !600
  store i16 %96, i16* %tmp97, align 2, !dbg !600
  %97 = load i16, i16* %tmp97, align 2, !dbg !600
  %add98 = add i16 %97, 2, !dbg !596
  %98 = inttoptr i16 %add98 to i8*, !dbg !596
  call void @llvm.dbg.declare(metadata i16* %__x99, metadata !602, metadata !DIExpression()), !dbg !604
  %99 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !604, !srcloc !605
  store i16 %99, i16* %__x99, align 2, !dbg !604
  %100 = load i16, i16* %__x99, align 2, !dbg !604
  store i16 %100, i16* %tmp100, align 2, !dbg !604
  %101 = load i16, i16* %tmp100, align 2, !dbg !604
  %add101 = add i16 %101, 2, !dbg !596
  %sub102 = sub i16 9216, %add101, !dbg !596
  %call103 = call zeroext i16 @__fast_hw_crc(i8* %98, i16 zeroext %sub102, i16 zeroext -1), !dbg !596
  store i16 %call103, i16* @tmp_stack_crc, align 2, !dbg !596
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %103 = bitcast %struct.camel_buffer_t* %102 to i8*, !dbg !596
  %104 = load i16, i16* @tmp_stack_crc, align 2, !dbg !596
  %call104 = call zeroext i16 @__fast_hw_crc(i8* %103, i16 zeroext 3520, i16 zeroext %104), !dbg !596
  store i16 %call104, i16* @tmp_stack_buf_crc, align 2, !dbg !596
  %105 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !596
  %106 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %stack_and_buf_crc105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %106, i32 0, i32 2, !dbg !596
  store i16 %105, i16* %stack_and_buf_crc105, align 2, !dbg !596
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !596
  br label %if.end119, !dbg !596

if.else106:                                       ; preds = %do.body91
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !606
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !606
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !606
  %reg_file107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %107, i32 0, i32 0, !dbg !606
  %arraydecay108 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file107, i16 0, i16 0, !dbg !606
  call void @__dump_registers(i16* %arraydecay108), !dbg !606
  call void @llvm.dbg.declare(metadata i16* %__x109, metadata !608, metadata !DIExpression()), !dbg !610
  %108 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !610, !srcloc !611
  store i16 %108, i16* %__x109, align 2, !dbg !610
  %109 = load i16, i16* %__x109, align 2, !dbg !610
  store i16 %109, i16* %tmp110, align 2, !dbg !610
  %110 = load i16, i16* %tmp110, align 2, !dbg !610
  %add111 = add i16 %110, 2, !dbg !606
  %111 = inttoptr i16 %add111 to i8*, !dbg !606
  call void @llvm.dbg.declare(metadata i16* %__x112, metadata !612, metadata !DIExpression()), !dbg !614
  %112 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !614, !srcloc !615
  store i16 %112, i16* %__x112, align 2, !dbg !614
  %113 = load i16, i16* %__x112, align 2, !dbg !614
  store i16 %113, i16* %tmp113, align 2, !dbg !614
  %114 = load i16, i16* %tmp113, align 2, !dbg !614
  %add114 = add i16 %114, 2, !dbg !606
  %sub115 = sub i16 9216, %add114, !dbg !606
  %call116 = call zeroext i16 @__fast_hw_crc(i8* %111, i16 zeroext %sub115, i16 zeroext -1), !dbg !606
  store i16 %call116, i16* @tmp_stack_crc, align 2, !dbg !606
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !606
  %116 = bitcast %struct.camel_buffer_t* %115 to i8*, !dbg !606
  %117 = load i16, i16* @tmp_stack_crc, align 2, !dbg !606
  %call117 = call zeroext i16 @__fast_hw_crc(i8* %116, i16 zeroext 3520, i16 zeroext %117), !dbg !606
  store i16 %call117, i16* @tmp_stack_buf_crc, align 2, !dbg !606
  %118 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !606
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !606
  %stack_and_buf_crc118 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %119, i32 0, i32 2, !dbg !606
  store i16 %118, i16* %stack_and_buf_crc118, align 2, !dbg !606
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !606
  br label %if.end119

if.end119:                                        ; preds = %if.else106, %if.then93
  br label %do.end120, !dbg !595

do.end120:                                        ; preds = %if.end119
  %tmp58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp58, i32 0, i32 1
  %global60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global59, i32 0, i32 0
  %tmp61 = load i16, i16* %global60, align 2
  %tmp62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp62, i32 0, i32 1
  %global64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global63, i32 0, i32 0
  store i16 %tmp61, i16* %global64, align 2
  call void @task_commit(), !dbg !616
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast, i8* align 2 %cast79, i64 6, i1 false), !dbg !617
  %tmp81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp81, i32 0, i32 1
  %global83 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global82, i32 0, i32 7
  %tmp84 = load i16, i16* %global83, align 2
  %tmp85 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp85, i32 0, i32 1
  %global87 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global86, i32 0, i32 7
  store i16 %tmp84, i16* %global87, align 2
  call void @task_compress(), !dbg !617
  br label %do.body121, !dbg !618

do.body121:                                       ; preds = %do.end120
  %120 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !619
  %cmp122 = icmp eq i16 %120, 1, !dbg !619
  br i1 %cmp122, label %if.then123, label %if.else136, !dbg !622

if.then123:                                       ; preds = %do.body121
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !623
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !623
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !623
  %reg_file124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %121, i32 0, i32 0, !dbg !623
  %arraydecay125 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file124, i16 0, i16 0, !dbg !623
  call void @__dump_registers(i16* %arraydecay125), !dbg !623
  call void @llvm.dbg.declare(metadata i16* %__x126, metadata !625, metadata !DIExpression()), !dbg !627
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !627, !srcloc !628
  store i16 %122, i16* %__x126, align 2, !dbg !627
  %123 = load i16, i16* %__x126, align 2, !dbg !627
  store i16 %123, i16* %tmp127, align 2, !dbg !627
  %124 = load i16, i16* %tmp127, align 2, !dbg !627
  %add128 = add i16 %124, 2, !dbg !623
  %125 = inttoptr i16 %add128 to i8*, !dbg !623
  call void @llvm.dbg.declare(metadata i16* %__x129, metadata !629, metadata !DIExpression()), !dbg !631
  %126 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !631, !srcloc !632
  store i16 %126, i16* %__x129, align 2, !dbg !631
  %127 = load i16, i16* %__x129, align 2, !dbg !631
  store i16 %127, i16* %tmp130, align 2, !dbg !631
  %128 = load i16, i16* %tmp130, align 2, !dbg !631
  %add131 = add i16 %128, 2, !dbg !623
  %sub132 = sub i16 9216, %add131, !dbg !623
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %125, i16 zeroext %sub132, i16 zeroext -1), !dbg !623
  store i16 %call133, i16* @tmp_stack_crc, align 2, !dbg !623
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !623
  %130 = bitcast %struct.camel_buffer_t* %129 to i8*, !dbg !623
  %131 = load i16, i16* @tmp_stack_crc, align 2, !dbg !623
  %call134 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext 3520, i16 zeroext %131), !dbg !623
  store i16 %call134, i16* @tmp_stack_buf_crc, align 2, !dbg !623
  %132 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !623
  %133 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !623
  %stack_and_buf_crc135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %133, i32 0, i32 2, !dbg !623
  store i16 %132, i16* %stack_and_buf_crc135, align 2, !dbg !623
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !623
  br label %if.end149, !dbg !623

if.else136:                                       ; preds = %do.body121
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !633
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !633
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !633
  %reg_file137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %134, i32 0, i32 0, !dbg !633
  %arraydecay138 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file137, i16 0, i16 0, !dbg !633
  call void @__dump_registers(i16* %arraydecay138), !dbg !633
  call void @llvm.dbg.declare(metadata i16* %__x139, metadata !635, metadata !DIExpression()), !dbg !637
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !637, !srcloc !638
  store i16 %135, i16* %__x139, align 2, !dbg !637
  %136 = load i16, i16* %__x139, align 2, !dbg !637
  store i16 %136, i16* %tmp140, align 2, !dbg !637
  %137 = load i16, i16* %tmp140, align 2, !dbg !637
  %add141 = add i16 %137, 2, !dbg !633
  %138 = inttoptr i16 %add141 to i8*, !dbg !633
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !639, metadata !DIExpression()), !dbg !641
  %139 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !641, !srcloc !642
  store i16 %139, i16* %__x142, align 2, !dbg !641
  %140 = load i16, i16* %__x142, align 2, !dbg !641
  store i16 %140, i16* %tmp143, align 2, !dbg !641
  %141 = load i16, i16* %tmp143, align 2, !dbg !641
  %add144 = add i16 %141, 2, !dbg !633
  %sub145 = sub i16 9216, %add144, !dbg !633
  %call146 = call zeroext i16 @__fast_hw_crc(i8* %138, i16 zeroext %sub145, i16 zeroext -1), !dbg !633
  store i16 %call146, i16* @tmp_stack_crc, align 2, !dbg !633
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !633
  %143 = bitcast %struct.camel_buffer_t* %142 to i8*, !dbg !633
  %144 = load i16, i16* @tmp_stack_crc, align 2, !dbg !633
  %call147 = call zeroext i16 @__fast_hw_crc(i8* %143, i16 zeroext 3520, i16 zeroext %144), !dbg !633
  store i16 %call147, i16* @tmp_stack_buf_crc, align 2, !dbg !633
  %145 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !633
  %146 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !633
  %stack_and_buf_crc148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %146, i32 0, i32 2, !dbg !633
  store i16 %145, i16* %stack_and_buf_crc148, align 2, !dbg !633
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !633
  br label %if.end149

if.end149:                                        ; preds = %if.else136, %if.then123
  br label %do.end150, !dbg !622

do.end150:                                        ; preds = %if.end149
  %tmp88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i32 0, i32 1
  %global90 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global89, i32 0, i32 8
  %tmp91 = load i16, i16* %global90, align 2
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast101, i8* align 2 %cast102, i64 6, i1 false), !dbg !643
  %tmp103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global104 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp103, i32 0, i32 1
  %global105 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global104, i32 0, i32 10
  %tmp106 = load i16, i16* %global105, align 2
  %tmp107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp107, i32 0, i32 1
  %global109 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global108, i32 0, i32 10
  store i16 %tmp106, i16* %global109, align 2
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
  call void @task_commit(), !dbg !643
  br label %while.cond151, !dbg !644

while.cond151:                                    ; preds = %do.end185, %do.end150
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %globals152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 1, !dbg !645
  %check153 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals152, i32 0, i32 18, !dbg !645
  %148 = load i16, i16* %check153, align 2, !dbg !645
  %cmp154 = icmp eq i16 %148, 1, !dbg !646
  br i1 %cmp154, label %while.body155, label %while.end, !dbg !644

while.body155:                                    ; preds = %while.cond151
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
  %tmp136 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp136, i32 0, i32 1
  %global138 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global137, i32 0, i32 0
  store i16 %tmp135, i16* %global138, align 2
  %tmp139 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp139, i32 0, i32 1
  %global141 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global140, i32 0, i32 9
  %tmp142 = load i16, i16* %global141, align 2
  %tmp144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp144, i32 0, i32 1
  %global146 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global145, i32 0, i32 9
  store i16 %tmp142, i16* %global146, align 2
  call void @task_find_sibling(), !dbg !647
  br label %do.body156, !dbg !649

do.body156:                                       ; preds = %while.body155
  %149 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !650
  %cmp157 = icmp eq i16 %149, 1, !dbg !650
  br i1 %cmp157, label %if.then158, label %if.else171, !dbg !653

if.then158:                                       ; preds = %do.body156
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !654
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !654
  %150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !654
  %reg_file159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %150, i32 0, i32 0, !dbg !654
  %arraydecay160 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file159, i16 0, i16 0, !dbg !654
  call void @__dump_registers(i16* %arraydecay160), !dbg !654
  call void @llvm.dbg.declare(metadata i16* %__x161, metadata !656, metadata !DIExpression()), !dbg !658
  %151 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !658, !srcloc !659
  store i16 %151, i16* %__x161, align 2, !dbg !658
  %152 = load i16, i16* %__x161, align 2, !dbg !658
  store i16 %152, i16* %tmp162, align 2, !dbg !658
  %153 = load i16, i16* %tmp162, align 2, !dbg !658
  %add163 = add i16 %153, 2, !dbg !654
  %154 = inttoptr i16 %add163 to i8*, !dbg !654
  call void @llvm.dbg.declare(metadata i16* %__x164, metadata !660, metadata !DIExpression()), !dbg !662
  %155 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !662, !srcloc !663
  store i16 %155, i16* %__x164, align 2, !dbg !662
  %156 = load i16, i16* %__x164, align 2, !dbg !662
  store i16 %156, i16* %tmp165, align 2, !dbg !662
  %157 = load i16, i16* %tmp165, align 2, !dbg !662
  %add166 = add i16 %157, 2, !dbg !654
  %sub167 = sub i16 9216, %add166, !dbg !654
  %call168 = call zeroext i16 @__fast_hw_crc(i8* %154, i16 zeroext %sub167, i16 zeroext -1), !dbg !654
  store i16 %call168, i16* @tmp_stack_crc, align 2, !dbg !654
  %158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !654
  %159 = bitcast %struct.camel_buffer_t* %158 to i8*, !dbg !654
  %160 = load i16, i16* @tmp_stack_crc, align 2, !dbg !654
  %call169 = call zeroext i16 @__fast_hw_crc(i8* %159, i16 zeroext 3520, i16 zeroext %160), !dbg !654
  store i16 %call169, i16* @tmp_stack_buf_crc, align 2, !dbg !654
  %161 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !654
  %162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !654
  %stack_and_buf_crc170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %162, i32 0, i32 2, !dbg !654
  store i16 %161, i16* %stack_and_buf_crc170, align 2, !dbg !654
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !654
  br label %if.end184, !dbg !654

if.else171:                                       ; preds = %do.body156
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !664
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %163 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %reg_file172 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %163, i32 0, i32 0, !dbg !664
  %arraydecay173 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file172, i16 0, i16 0, !dbg !664
  call void @__dump_registers(i16* %arraydecay173), !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x174, metadata !666, metadata !DIExpression()), !dbg !668
  %164 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !668, !srcloc !669
  store i16 %164, i16* %__x174, align 2, !dbg !668
  %165 = load i16, i16* %__x174, align 2, !dbg !668
  store i16 %165, i16* %tmp175, align 2, !dbg !668
  %166 = load i16, i16* %tmp175, align 2, !dbg !668
  %add176 = add i16 %166, 2, !dbg !664
  %167 = inttoptr i16 %add176 to i8*, !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x177, metadata !670, metadata !DIExpression()), !dbg !672
  %168 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !672, !srcloc !673
  store i16 %168, i16* %__x177, align 2, !dbg !672
  %169 = load i16, i16* %__x177, align 2, !dbg !672
  store i16 %169, i16* %tmp178, align 2, !dbg !672
  %170 = load i16, i16* %tmp178, align 2, !dbg !672
  %add179 = add i16 %170, 2, !dbg !664
  %sub180 = sub i16 9216, %add179, !dbg !664
  %call181 = call zeroext i16 @__fast_hw_crc(i8* %167, i16 zeroext %sub180, i16 zeroext -1), !dbg !664
  store i16 %call181, i16* @tmp_stack_crc, align 2, !dbg !664
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %172 = bitcast %struct.camel_buffer_t* %171 to i8*, !dbg !664
  %173 = load i16, i16* @tmp_stack_crc, align 2, !dbg !664
  %call182 = call zeroext i16 @__fast_hw_crc(i8* %172, i16 zeroext 3520, i16 zeroext %173), !dbg !664
  store i16 %call182, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %174 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %stack_and_buf_crc183 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %175, i32 0, i32 2, !dbg !664
  store i16 %174, i16* %stack_and_buf_crc183, align 2, !dbg !664
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !664
  br label %if.end184

if.end184:                                        ; preds = %if.else171, %if.then158
  br label %do.end185, !dbg !653

do.end185:                                        ; preds = %if.end184
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
  %tmp158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global159 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp158, i32 0, i32 1
  %global160 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global159, i32 0, i32 18
  store i16 %tmp157, i16* %global160, align 2
  %tmp161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global162 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp161, i32 0, i32 1
  %global163 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global162, i32 0, i32 8
  %tmp164 = load i16, i16* %global163, align 2
  %tmp166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp166, i32 0, i32 1
  %global168 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global167, i32 0, i32 8
  store i16 %tmp164, i16* %global168, align 2
  call void @task_commit(), !dbg !674
  br label %while.cond151, !dbg !644, !llvm.loop !675

while.end:                                        ; preds = %while.cond151
  %176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !677
  %globals186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %176, i32 0, i32 1, !dbg !677
  %check187 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals186, i32 0, i32 18, !dbg !677
  %177 = load i16, i16* %check187, align 2, !dbg !677
  %cmp188 = icmp ne i16 %177, 0, !dbg !679
  br i1 %cmp188, label %if.then189, label %if.end190, !dbg !680

if.then189:                                       ; preds = %while.end
  br label %while.end191, !dbg !681

if.end190:                                        ; preds = %while.end
  br label %while.body90, !dbg !588, !llvm.loop !682

while.end191:                                     ; preds = %if.then189
  %178 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !684
  %globals192 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %178, i32 0, i32 1, !dbg !684
  %check193 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals192, i32 0, i32 18, !dbg !684
  %179 = load i16, i16* %check193, align 2, !dbg !684
  %cmp194 = icmp eq i16 %179, 3, !dbg !686
  br i1 %cmp194, label %if.then195, label %if.end231, !dbg !687

if.then195:                                       ; preds = %while.end191
  br label %do.body196, !dbg !688

do.body196:                                       ; preds = %do.cond, %if.then195
  %tmp169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp169, i32 0, i32 1
  %global171 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global170, i32 0, i32 8
  %tmp172 = load i16, i16* %global171, align 2
  %tmp173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp173, i32 0, i32 1
  %global175 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global174, i32 0, i32 8
  store i16 %tmp172, i16* %global175, align 2
  call void @task_add_node(), !dbg !690
  br label %do.body197, !dbg !692

do.body197:                                       ; preds = %do.body196
  %180 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !693
  %cmp198 = icmp eq i16 %180, 1, !dbg !693
  br i1 %cmp198, label %if.then199, label %if.else212, !dbg !696

if.then199:                                       ; preds = %do.body197
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !697
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !697
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !697
  %reg_file200 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %181, i32 0, i32 0, !dbg !697
  %arraydecay201 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file200, i16 0, i16 0, !dbg !697
  call void @__dump_registers(i16* %arraydecay201), !dbg !697
  call void @llvm.dbg.declare(metadata i16* %__x202, metadata !699, metadata !DIExpression()), !dbg !701
  %182 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !701, !srcloc !702
  store i16 %182, i16* %__x202, align 2, !dbg !701
  %183 = load i16, i16* %__x202, align 2, !dbg !701
  store i16 %183, i16* %tmp203, align 2, !dbg !701
  %184 = load i16, i16* %tmp203, align 2, !dbg !701
  %add204 = add i16 %184, 2, !dbg !697
  %185 = inttoptr i16 %add204 to i8*, !dbg !697
  call void @llvm.dbg.declare(metadata i16* %__x205, metadata !703, metadata !DIExpression()), !dbg !705
  %186 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !705, !srcloc !706
  store i16 %186, i16* %__x205, align 2, !dbg !705
  %187 = load i16, i16* %__x205, align 2, !dbg !705
  store i16 %187, i16* %tmp206, align 2, !dbg !705
  %188 = load i16, i16* %tmp206, align 2, !dbg !705
  %add207 = add i16 %188, 2, !dbg !697
  %sub208 = sub i16 9216, %add207, !dbg !697
  %call209 = call zeroext i16 @__fast_hw_crc(i8* %185, i16 zeroext %sub208, i16 zeroext -1), !dbg !697
  store i16 %call209, i16* @tmp_stack_crc, align 2, !dbg !697
  %189 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !697
  %190 = bitcast %struct.camel_buffer_t* %189 to i8*, !dbg !697
  %191 = load i16, i16* @tmp_stack_crc, align 2, !dbg !697
  %call210 = call zeroext i16 @__fast_hw_crc(i8* %190, i16 zeroext 3520, i16 zeroext %191), !dbg !697
  store i16 %call210, i16* @tmp_stack_buf_crc, align 2, !dbg !697
  %192 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !697
  %193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !697
  %stack_and_buf_crc211 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %193, i32 0, i32 2, !dbg !697
  store i16 %192, i16* %stack_and_buf_crc211, align 2, !dbg !697
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !697
  br label %if.end225, !dbg !697

if.else212:                                       ; preds = %do.body197
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !707
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !707
  %194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !707
  %reg_file213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %194, i32 0, i32 0, !dbg !707
  %arraydecay214 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file213, i16 0, i16 0, !dbg !707
  call void @__dump_registers(i16* %arraydecay214), !dbg !707
  call void @llvm.dbg.declare(metadata i16* %__x215, metadata !709, metadata !DIExpression()), !dbg !711
  %195 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !711, !srcloc !712
  store i16 %195, i16* %__x215, align 2, !dbg !711
  %196 = load i16, i16* %__x215, align 2, !dbg !711
  store i16 %196, i16* %tmp216, align 2, !dbg !711
  %197 = load i16, i16* %tmp216, align 2, !dbg !711
  %add217 = add i16 %197, 2, !dbg !707
  %198 = inttoptr i16 %add217 to i8*, !dbg !707
  call void @llvm.dbg.declare(metadata i16* %__x218, metadata !713, metadata !DIExpression()), !dbg !715
  %199 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !715, !srcloc !716
  store i16 %199, i16* %__x218, align 2, !dbg !715
  %200 = load i16, i16* %__x218, align 2, !dbg !715
  store i16 %200, i16* %tmp219, align 2, !dbg !715
  %201 = load i16, i16* %tmp219, align 2, !dbg !715
  %add220 = add i16 %201, 2, !dbg !707
  %sub221 = sub i16 9216, %add220, !dbg !707
  %call222 = call zeroext i16 @__fast_hw_crc(i8* %198, i16 zeroext %sub221, i16 zeroext -1), !dbg !707
  store i16 %call222, i16* @tmp_stack_crc, align 2, !dbg !707
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !707
  %203 = bitcast %struct.camel_buffer_t* %202 to i8*, !dbg !707
  %204 = load i16, i16* @tmp_stack_crc, align 2, !dbg !707
  %call223 = call zeroext i16 @__fast_hw_crc(i8* %203, i16 zeroext 3520, i16 zeroext %204), !dbg !707
  store i16 %call223, i16* @tmp_stack_buf_crc, align 2, !dbg !707
  %205 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !707
  %206 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !707
  %stack_and_buf_crc224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %206, i32 0, i32 2, !dbg !707
  store i16 %205, i16* %stack_and_buf_crc224, align 2, !dbg !707
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !707
  br label %if.end225

if.end225:                                        ; preds = %if.else212, %if.then199
  br label %do.end226, !dbg !696

do.end226:                                        ; preds = %if.end225
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast196, i8* align 2 %cast197, i64 6, i1 false), !dbg !717
  call void @task_commit(), !dbg !717
  br label %do.cond, !dbg !718

do.cond:                                          ; preds = %do.end226
  %207 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !719
  %globals227 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %207, i32 0, i32 1, !dbg !719
  %check228 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals227, i32 0, i32 18, !dbg !719
  %208 = load i16, i16* %check228, align 2, !dbg !719
  %cmp229 = icmp eq i16 %208, 0, !dbg !720
  br i1 %cmp229, label %do.body196, label %do.end230, !dbg !718, !llvm.loop !721

do.end230:                                        ; preds = %do.cond
  br label %if.end231, !dbg !723

if.end231:                                        ; preds = %do.end230, %while.end191
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
  %tmp209 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global210 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp209, i32 0, i32 1
  %global211 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global210, i32 0, i32 0
  store i16 %tmp208, i16* %global211, align 2
  %tmp212 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp212, i32 0, i32 1
  %global214 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global213, i32 0, i32 2
  %tmp215 = load i16, i16* %global214, align 2
  %tmp217 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp217, i32 0, i32 1
  %global219 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global218, i32 0, i32 2
  store i16 %tmp215, i16* %global219, align 2
  %tmp220 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global221 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp220, i32 0, i32 1
  %global222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global221, i32 0, i32 12
  %tmp223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp223, i32 0, i32 1
  %global225 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global224, i32 0, i32 12
  %cast226 = bitcast %struct._node_t* %global222 to i8*
  %cast227 = bitcast %struct._node_t* %global225 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast226, i8* align 2 %cast227, i64 6, i1 false), !dbg !724
  %tmp228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global229 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp228, i32 0, i32 1
  %global230 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global229, i32 0, i32 10
  %tmp231 = load i16, i16* %global230, align 2
  %tmp232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global233 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp232, i32 0, i32 1
  %global234 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global233, i32 0, i32 10
  store i16 %tmp231, i16* %global234, align 2
  %tmp235 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp235, i32 0, i32 1
  %global237 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global236, i32 0, i32 16
  %tmp239 = load i16, i16* %global237, align 2
  %tmp240 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp240, i32 0, i32 1
  %global242 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global241, i32 0, i32 16
  store i16 %tmp239, i16* %global242, align 2
  %tmp243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global244 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp243, i32 0, i32 1
  %global245 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global244, i32 0, i32 8
  %tmp246 = load i16, i16* %global245, align 2
  %tmp247 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp247, i32 0, i32 1
  %global249 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global248, i32 0, i32 8
  store i16 %tmp246, i16* %global249, align 2
  %tmp250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global251 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp250, i32 0, i32 1
  %global252 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global251, i32 0, i32 14
  %tmp253 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global254 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp253, i32 0, i32 1
  %global255 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global254, i32 0, i32 14
  %cast256 = bitcast %struct._node_t* %global252 to i8*
  %cast257 = bitcast %struct._node_t* %global255 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast256, i8* align 2 %cast257, i64 6, i1 false), !dbg !724
  %tmp258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp258, i32 0, i32 1
  %global260 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global259, i32 0, i32 17
  %tmp261 = load i16, i16* %global260, align 2
  %tmp262 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global263 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp262, i32 0, i32 1
  %global264 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global263, i32 0, i32 17
  store i16 %tmp261, i16* %global264, align 2
  %tmp265 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global266 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp265, i32 0, i32 1
  %global267 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global266, i32 0, i32 9
  %tmp268 = load i16, i16* %global267, align 2
  %tmp270 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global271 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp270, i32 0, i32 1
  %global272 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global271, i32 0, i32 9
  store i16 %tmp268, i16* %global272, align 2
  call void @task_add_insert(), !dbg !724
  br label %do.body232, !dbg !725

do.body232:                                       ; preds = %if.end231
  %209 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !726
  %cmp233 = icmp eq i16 %209, 1, !dbg !726
  br i1 %cmp233, label %if.then234, label %if.else247, !dbg !729

if.then234:                                       ; preds = %do.body232
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !730
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !730
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !730
  %reg_file235 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %210, i32 0, i32 0, !dbg !730
  %arraydecay236 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file235, i16 0, i16 0, !dbg !730
  call void @__dump_registers(i16* %arraydecay236), !dbg !730
  call void @llvm.dbg.declare(metadata i16* %__x237, metadata !732, metadata !DIExpression()), !dbg !734
  %211 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !734, !srcloc !735
  store i16 %211, i16* %__x237, align 2, !dbg !734
  %212 = load i16, i16* %__x237, align 2, !dbg !734
  store i16 %212, i16* %tmp238, align 2, !dbg !734
  %213 = load i16, i16* %tmp238, align 2, !dbg !734
  %add239 = add i16 %213, 2, !dbg !730
  %214 = inttoptr i16 %add239 to i8*, !dbg !730
  call void @llvm.dbg.declare(metadata i16* %__x240, metadata !736, metadata !DIExpression()), !dbg !738
  %215 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !738, !srcloc !739
  store i16 %215, i16* %__x240, align 2, !dbg !738
  %216 = load i16, i16* %__x240, align 2, !dbg !738
  store i16 %216, i16* %tmp241, align 2, !dbg !738
  %217 = load i16, i16* %tmp241, align 2, !dbg !738
  %add242 = add i16 %217, 2, !dbg !730
  %sub243 = sub i16 9216, %add242, !dbg !730
  %call244 = call zeroext i16 @__fast_hw_crc(i8* %214, i16 zeroext %sub243, i16 zeroext -1), !dbg !730
  store i16 %call244, i16* @tmp_stack_crc, align 2, !dbg !730
  %218 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !730
  %219 = bitcast %struct.camel_buffer_t* %218 to i8*, !dbg !730
  %220 = load i16, i16* @tmp_stack_crc, align 2, !dbg !730
  %call245 = call zeroext i16 @__fast_hw_crc(i8* %219, i16 zeroext 3520, i16 zeroext %220), !dbg !730
  store i16 %call245, i16* @tmp_stack_buf_crc, align 2, !dbg !730
  %221 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !730
  %222 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !730
  %stack_and_buf_crc246 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %222, i32 0, i32 2, !dbg !730
  store i16 %221, i16* %stack_and_buf_crc246, align 2, !dbg !730
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !730
  br label %if.end260, !dbg !730

if.else247:                                       ; preds = %do.body232
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !740
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !740
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !740
  %reg_file248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %223, i32 0, i32 0, !dbg !740
  %arraydecay249 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file248, i16 0, i16 0, !dbg !740
  call void @__dump_registers(i16* %arraydecay249), !dbg !740
  call void @llvm.dbg.declare(metadata i16* %__x250, metadata !742, metadata !DIExpression()), !dbg !744
  %224 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !744, !srcloc !745
  store i16 %224, i16* %__x250, align 2, !dbg !744
  %225 = load i16, i16* %__x250, align 2, !dbg !744
  store i16 %225, i16* %tmp251, align 2, !dbg !744
  %226 = load i16, i16* %tmp251, align 2, !dbg !744
  %add252 = add i16 %226, 2, !dbg !740
  %227 = inttoptr i16 %add252 to i8*, !dbg !740
  call void @llvm.dbg.declare(metadata i16* %__x253, metadata !746, metadata !DIExpression()), !dbg !748
  %228 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !748, !srcloc !749
  store i16 %228, i16* %__x253, align 2, !dbg !748
  %229 = load i16, i16* %__x253, align 2, !dbg !748
  store i16 %229, i16* %tmp254, align 2, !dbg !748
  %230 = load i16, i16* %tmp254, align 2, !dbg !748
  %add255 = add i16 %230, 2, !dbg !740
  %sub256 = sub i16 9216, %add255, !dbg !740
  %call257 = call zeroext i16 @__fast_hw_crc(i8* %227, i16 zeroext %sub256, i16 zeroext -1), !dbg !740
  store i16 %call257, i16* @tmp_stack_crc, align 2, !dbg !740
  %231 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !740
  %232 = bitcast %struct.camel_buffer_t* %231 to i8*, !dbg !740
  %233 = load i16, i16* @tmp_stack_crc, align 2, !dbg !740
  %call258 = call zeroext i16 @__fast_hw_crc(i8* %232, i16 zeroext 3520, i16 zeroext %233), !dbg !740
  store i16 %call258, i16* @tmp_stack_buf_crc, align 2, !dbg !740
  %234 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !740
  %235 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !740
  %stack_and_buf_crc259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %235, i32 0, i32 2, !dbg !740
  store i16 %234, i16* %stack_and_buf_crc259, align 2, !dbg !740
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !740
  br label %if.end260

if.end260:                                        ; preds = %if.else247, %if.then234
  br label %do.end262, !dbg !729

do.end262:                                        ; preds = %if.end260
  %tmp273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global274 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp273, i32 0, i32 1
  %global275 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global274, i32 0, i32 16
  %tmp276 = load i16, i16* %global275, align 2
  %tmp277 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global278 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp277, i32 0, i32 1
  %global279 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global278, i32 0, i32 16
  store i16 %tmp276, i16* %global279, align 2
  %tmp280 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global281 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp280, i32 0, i32 1
  %global282 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global281, i32 0, i32 5
  %tmp283 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global284 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp283, i32 0, i32 1
  %global285 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global284, i32 0, i32 16
  %load = load i16, i16* %global285, align 2
  %access = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global282, i16 0, i16 %load
  %tmp286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global287 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp286, i32 0, i32 1
  %global288 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global287, i32 0, i32 5
  %tmp289 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global290 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp289, i32 0, i32 1
  %global291 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global290, i32 0, i32 16
  %load292 = load i16, i16* %global291, align 2
  %access293 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global288, i16 0, i16 %load292
  %cast294 = bitcast %struct._node_t* %access to i8*
  %cast295 = bitcast %struct._node_t* %access293 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast294, i8* align 2 %cast295, i64 3072, i1 false), !dbg !750
  %tmp296 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global297 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp296, i32 0, i32 1
  %global298 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global297, i32 0, i32 17
  %tmp299 = load i16, i16* %global298, align 2
  %tmp300 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global301 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp300, i32 0, i32 1
  %global302 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global301, i32 0, i32 17
  store i16 %tmp299, i16* %global302, align 2
  %tmp303 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global304 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp303, i32 0, i32 1
  %global305 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global304, i32 0, i32 5
  %tmp306 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global307 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp306, i32 0, i32 1
  %global308 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global307, i32 0, i32 17
  %load309 = load i16, i16* %global308, align 2
  %access310 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global305, i16 0, i16 %load309
  %tmp311 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global312 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp311, i32 0, i32 1
  %global313 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global312, i32 0, i32 5
  %tmp314 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global315 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp314, i32 0, i32 1
  %global316 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global315, i32 0, i32 17
  %load317 = load i16, i16* %global316, align 2
  %access318 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global313, i16 0, i16 %load317
  %cast319 = bitcast %struct._node_t* %access310 to i8*
  %cast320 = bitcast %struct._node_t* %access318 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast319, i8* align 2 %cast320, i64 3072, i1 false), !dbg !750
  %tmp321 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global322 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp321, i32 0, i32 1
  %global323 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global322, i32 0, i32 5
  %tmp324 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global325 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp324, i32 0, i32 1
  %global326 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global325, i32 0, i32 9
  %load327 = load i16, i16* %global326, align 2
  %access328 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global323, i16 0, i16 %load327
  %tmp329 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global330 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp329, i32 0, i32 1
  %global331 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global330, i32 0, i32 5
  %tmp332 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global333 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp332, i32 0, i32 1
  %global334 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global333, i32 0, i32 9
  %load335 = load i16, i16* %global334, align 2
  %access336 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %global331, i16 0, i16 %load335
  %cast337 = bitcast %struct._node_t* %access328 to i8*
  %cast338 = bitcast %struct._node_t* %access336 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast337, i8* align 2 %cast338, i64 3072, i1 false), !dbg !750
  %tmp339 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global340 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp339, i32 0, i32 1
  %global341 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global340, i32 0, i32 15
  %tmp342 = load i16, i16* %global341, align 2
  %tmp343 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global344 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp343, i32 0, i32 1
  %global345 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global344, i32 0, i32 15
  store i16 %tmp342, i16* %global345, align 2
  %tmp346 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global347 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp346, i32 0, i32 1
  %global348 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global347, i32 0, i32 4
  %tmp349 = load i16, i16* %global348, align 2
  %tmp350 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global351 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp350, i32 0, i32 1
  %global352 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global351, i32 0, i32 4
  store i16 %tmp349, i16* %global352, align 2
  call void @task_commit(), !dbg !750
  %tmp353 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global354 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp353, i32 0, i32 1
  %global355 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global354, i32 0, i32 3
  %tmp356 = load i16, i16* %global355, align 2
  %tmp357 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global358 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp357, i32 0, i32 1
  %global359 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global358, i32 0, i32 3
  store i16 %tmp356, i16* %global359, align 2
  %tmp360 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global361 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp360, i32 0, i32 1
  %global362 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global361, i32 0, i32 15
  %tmp363 = load i16, i16* %global362, align 2
  %tmp364 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global365 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp364, i32 0, i32 1
  %global366 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global365, i32 0, i32 15
  store i16 %tmp363, i16* %global366, align 2
  %tmp367 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global368 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp367, i32 0, i32 1
  %global369 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global368, i32 0, i32 16
  %tmp370 = load i16, i16* %global369, align 2
  %tmp371 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global372 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp371, i32 0, i32 1
  %global373 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global372, i32 0, i32 16
  store i16 %tmp370, i16* %global373, align 2
  %tmp374 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global375 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp374, i32 0, i32 1
  %global376 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global375, i32 0, i32 1
  %tmp377 = load i16, i16* %global376, align 2
  %tmp378 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global379 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp378, i32 0, i32 1
  %global380 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global379, i32 0, i32 1
  store i16 %tmp377, i16* %global380, align 2
  %tmp381 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global382 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp381, i32 0, i32 1
  %global383 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global382, i32 0, i32 2
  %tmp384 = load i16, i16* %global383, align 2
  %tmp385 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global386 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp385, i32 0, i32 1
  %global387 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global386, i32 0, i32 2
  store i16 %tmp384, i16* %global387, align 2
  call void @task_append_compressed(), !dbg !751
  br label %do.body263, !dbg !752

do.body263:                                       ; preds = %do.end262
  %236 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !753
  %cmp264 = icmp eq i16 %236, 1, !dbg !753
  br i1 %cmp264, label %if.then265, label %if.else278, !dbg !756

if.then265:                                       ; preds = %do.body263
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !757
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !757
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !757
  %reg_file266 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %237, i32 0, i32 0, !dbg !757
  %arraydecay267 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file266, i16 0, i16 0, !dbg !757
  call void @__dump_registers(i16* %arraydecay267), !dbg !757
  call void @llvm.dbg.declare(metadata i16* %__x268, metadata !759, metadata !DIExpression()), !dbg !761
  %238 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !761, !srcloc !762
  store i16 %238, i16* %__x268, align 2, !dbg !761
  %239 = load i16, i16* %__x268, align 2, !dbg !761
  store i16 %239, i16* %tmp269, align 2, !dbg !761
  %240 = load i16, i16* %tmp269, align 2, !dbg !761
  %add270 = add i16 %240, 2, !dbg !757
  %241 = inttoptr i16 %add270 to i8*, !dbg !757
  call void @llvm.dbg.declare(metadata i16* %__x271, metadata !763, metadata !DIExpression()), !dbg !765
  %242 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !765, !srcloc !766
  store i16 %242, i16* %__x271, align 2, !dbg !765
  %243 = load i16, i16* %__x271, align 2, !dbg !765
  store i16 %243, i16* %tmp272, align 2, !dbg !765
  %244 = load i16, i16* %tmp272, align 2, !dbg !765
  %add273 = add i16 %244, 2, !dbg !757
  %sub274 = sub i16 9216, %add273, !dbg !757
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %241, i16 zeroext %sub274, i16 zeroext -1), !dbg !757
  store i16 %call275, i16* @tmp_stack_crc, align 2, !dbg !757
  %245 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !757
  %246 = bitcast %struct.camel_buffer_t* %245 to i8*, !dbg !757
  %247 = load i16, i16* @tmp_stack_crc, align 2, !dbg !757
  %call276 = call zeroext i16 @__fast_hw_crc(i8* %246, i16 zeroext 3520, i16 zeroext %247), !dbg !757
  store i16 %call276, i16* @tmp_stack_buf_crc, align 2, !dbg !757
  %248 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !757
  %249 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !757
  %stack_and_buf_crc277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %249, i32 0, i32 2, !dbg !757
  store i16 %248, i16* %stack_and_buf_crc277, align 2, !dbg !757
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !757
  br label %if.end291, !dbg !757

if.else278:                                       ; preds = %do.body263
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !767
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !767
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !767
  %reg_file279 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %250, i32 0, i32 0, !dbg !767
  %arraydecay280 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file279, i16 0, i16 0, !dbg !767
  call void @__dump_registers(i16* %arraydecay280), !dbg !767
  call void @llvm.dbg.declare(metadata i16* %__x281, metadata !769, metadata !DIExpression()), !dbg !771
  %251 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !771, !srcloc !772
  store i16 %251, i16* %__x281, align 2, !dbg !771
  %252 = load i16, i16* %__x281, align 2, !dbg !771
  store i16 %252, i16* %tmp282, align 2, !dbg !771
  %253 = load i16, i16* %tmp282, align 2, !dbg !771
  %add283 = add i16 %253, 2, !dbg !767
  %254 = inttoptr i16 %add283 to i8*, !dbg !767
  call void @llvm.dbg.declare(metadata i16* %__x284, metadata !773, metadata !DIExpression()), !dbg !775
  %255 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !775, !srcloc !776
  store i16 %255, i16* %__x284, align 2, !dbg !775
  %256 = load i16, i16* %__x284, align 2, !dbg !775
  store i16 %256, i16* %tmp285, align 2, !dbg !775
  %257 = load i16, i16* %tmp285, align 2, !dbg !775
  %add286 = add i16 %257, 2, !dbg !767
  %sub287 = sub i16 9216, %add286, !dbg !767
  %call288 = call zeroext i16 @__fast_hw_crc(i8* %254, i16 zeroext %sub287, i16 zeroext -1), !dbg !767
  store i16 %call288, i16* @tmp_stack_crc, align 2, !dbg !767
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !767
  %259 = bitcast %struct.camel_buffer_t* %258 to i8*, !dbg !767
  %260 = load i16, i16* @tmp_stack_crc, align 2, !dbg !767
  %call289 = call zeroext i16 @__fast_hw_crc(i8* %259, i16 zeroext 3520, i16 zeroext %260), !dbg !767
  store i16 %call289, i16* @tmp_stack_buf_crc, align 2, !dbg !767
  %261 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !767
  %262 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !767
  %stack_and_buf_crc290 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %262, i32 0, i32 2, !dbg !767
  store i16 %261, i16* %stack_and_buf_crc290, align 2, !dbg !767
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !767
  br label %if.end291

if.end291:                                        ; preds = %if.else278, %if.then265
  br label %do.end293, !dbg !756

do.end293:                                        ; preds = %if.end291
  %tmp388 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global389 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp388, i32 0, i32 1
  %global390 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global389, i32 0, i32 16
  %tmp391 = load i16, i16* %global390, align 2
  %tmp392 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global393 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp392, i32 0, i32 1
  %global394 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global393, i32 0, i32 16
  store i16 %tmp391, i16* %global394, align 2
  %tmp395 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global396 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp395, i32 0, i32 1
  %global397 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global396, i32 0, i32 13
  %tmp398 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global399 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp398, i32 0, i32 1
  %global400 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global399, i32 0, i32 16
  %load401 = load i16, i16* %global400, align 2
  %access402 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %global397, i16 0, i16 %load401
  %tmp403 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global404 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp403, i32 0, i32 1
  %global405 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global404, i32 0, i32 13
  %tmp406 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global407 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp406, i32 0, i32 1
  %global408 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global407, i32 0, i32 16
  %load409 = load i16, i16* %global408, align 2
  %access410 = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %global405, i16 0, i16 %load409
  %cast411 = bitcast %struct._node_t* %access402 to i8*
  %cast412 = bitcast %struct._node_t* %access410 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast411, i8* align 2 %cast412, i64 384, i1 false), !dbg !777
  %tmp413 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global414 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp413, i32 0, i32 1
  %global415 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global414, i32 0, i32 3
  %tmp416 = load i16, i16* %global415, align 2
  %tmp417 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global418 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp417, i32 0, i32 1
  %global419 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global418, i32 0, i32 3
  store i16 %tmp416, i16* %global419, align 2
  call void @task_commit(), !dbg !777
  br label %while.cond, !dbg !524, !llvm.loop !778

while.end294:                                     ; preds = %while.cond
  call void @task_done(), !dbg !780
  %263 = load i16, i16* %retval, align 2, !dbg !781
  ret i16 %263, !dbg !781
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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 150, type: !73, isLocal: false, isDefinition: true)
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
!19 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 157, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 16)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 143, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 138, size: 28176, elements: !23)
!23 = !{!24, !29, !67}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !22, file: !3, line: 140, baseType: !25, size: 176)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 176, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 45, baseType: !11)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !22, file: !3, line: 141, baseType: !30, size: 27984, offset: 176)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 135, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 111, size: 27984, elements: !32)
!32 = !{!33, !35, !36, !38, !39, !40, !50, !51, !52, !53, !54, !55, !56, !57, !61, !62, !63, !64, !65}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !31, file: !3, line: 113, baseType: !34, size: 16)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_t", file: !3, line: 21, baseType: !6)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "letter_idx", scope: !31, file: !3, line: 114, baseType: !6, size: 16, offset: 16)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "prev_sample", scope: !31, file: !3, line: 115, baseType: !37, size: 16, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "sample_t", file: !3, line: 22, baseType: !6)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "out_len", scope: !31, file: !3, line: 116, baseType: !7, size: 16, offset: 48)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "node_count", scope: !31, file: !3, line: 117, baseType: !7, size: 16, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "dict", scope: !31, file: !3, line: 118, baseType: !41, size: 24576, offset: 80)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 24576, elements: !48)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !3, line: 28, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_node_t", file: !3, line: 24, size: 48, elements: !44)
!44 = !{!45, !46, !47}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !43, file: !3, line: 25, baseType: !34, size: 16)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !43, file: !3, line: 26, baseType: !7, size: 16, offset: 16)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !43, file: !3, line: 27, baseType: !7, size: 16, offset: 32)
!48 = !{!49}
!49 = !DISubrange(count: 512)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !31, file: !3, line: 119, baseType: !37, size: 16, offset: 24656)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sample_count", scope: !31, file: !3, line: 120, baseType: !7, size: 16, offset: 24672)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !31, file: !3, line: 121, baseType: !7, size: 16, offset: 24688)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !31, file: !3, line: 122, baseType: !7, size: 16, offset: 24704)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !31, file: !3, line: 123, baseType: !7, size: 16, offset: 24720)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "parent_next", scope: !31, file: !3, line: 124, baseType: !7, size: 16, offset: 24736)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "parent_node", scope: !31, file: !3, line: 125, baseType: !42, size: 48, offset: 24752)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "compressed_data", scope: !31, file: !3, line: 126, baseType: !58, size: 3072, offset: 24800)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 3072, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_node", scope: !31, file: !3, line: 127, baseType: !42, size: 48, offset: 27872)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "symbol", scope: !31, file: !3, line: 128, baseType: !7, size: 16, offset: 27920)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "write1", scope: !31, file: !3, line: 130, baseType: !6, size: 16, offset: 27936)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "write2", scope: !31, file: !3, line: 131, baseType: !6, size: 16, offset: 27952)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !31, file: !3, line: 134, baseType: !66, size: 16, offset: 27968)
!66 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !22, file: !3, line: 142, baseType: !11, size: 16, offset: 28160)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 157, type: !20, isLocal: false, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 186, type: !72, isLocal: false, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 176, elements: !27)
!73 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 145, size: 56368, elements: !74)
!74 = !{!75, !76, !77}
!75 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !73, file: !3, line: 147, baseType: !11, size: 16)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !73, file: !3, line: 148, baseType: !21, size: 28176, offset: 16)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !73, file: !3, line: 149, baseType: !21, size: 28176, offset: 28192)
!78 = !{i32 2, !"Dwarf Version", i32 4}
!79 = !{i32 2, !"Debug Info Version", i32 3}
!80 = !{i32 1, !"wchar_size", i32 2}
!81 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!82 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 159, type: !83, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!83 = !DISubroutineType(types: !84)
!84 = !{null}
!85 = !DILocation(line: 160, column: 10, scope: !82)
!86 = !DILocation(line: 162, column: 9, scope: !82)
!87 = !DILocation(line: 164, column: 9, scope: !82)
!88 = !DILocation(line: 169, column: 11, scope: !82)
!89 = !DILocation(line: 174, column: 12, scope: !82)
!90 = !DILocation(line: 175, column: 10, scope: !82)
!91 = !DILocation(line: 176, column: 10, scope: !82)
!92 = !DILocation(line: 178, column: 10, scope: !82)
!93 = !DILocation(line: 179, column: 12, scope: !82)
!94 = !DILocation(line: 182, column: 10, scope: !82)
!95 = !DILocation(line: 184, column: 1, scope: !82)
!96 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 188, type: !83, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 189, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !96, file: !3, line: 189, column: 8)
!99 = !DILocation(line: 189, column: 19, scope: !98)
!100 = !DILocation(line: 189, column: 8, scope: !96)
!101 = !DILocation(line: 190, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 189, column: 34)
!103 = !DILocation(line: 191, column: 16, scope: !102)
!104 = !DILocation(line: 192, column: 5, scope: !102)
!105 = !DILocation(line: 192, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !3, line: 192, column: 15)
!107 = !DILocation(line: 192, column: 26, scope: !106)
!108 = !DILocation(line: 192, column: 15, scope: !98)
!109 = !DILocation(line: 193, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 192, column: 41)
!111 = !DILocation(line: 194, column: 16, scope: !110)
!112 = !DILocation(line: 195, column: 5, scope: !110)
!113 = !DILocation(line: 196, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !3, line: 195, column: 12)
!115 = !DILocation(line: 213, column: 3, scope: !116)
!116 = distinct !DILexicalBlock(scope: !96, file: !3, line: 213, column: 3)
!117 = !{i32 -2146618056}
!118 = !DILocalVariable(name: "__x", scope: !119, file: !3, line: 215, type: !6)
!119 = distinct !DILexicalBlock(scope: !96, file: !3, line: 215, column: 33)
!120 = !DILocation(line: 215, column: 33, scope: !119)
!121 = !{i32 -2146617820}
!122 = !DILocation(line: 215, column: 51, scope: !96)
!123 = !DILocation(line: 215, column: 33, scope: !96)
!124 = !DILocalVariable(name: "__x", scope: !125, file: !3, line: 215, type: !6)
!125 = distinct !DILexicalBlock(scope: !96, file: !3, line: 215, column: 65)
!126 = !DILocation(line: 215, column: 65, scope: !125)
!127 = !{i32 -2146617695}
!128 = !DILocation(line: 215, column: 83, scope: !96)
!129 = !DILocation(line: 215, column: 63, scope: !96)
!130 = !DILocation(line: 215, column: 19, scope: !96)
!131 = !DILocation(line: 215, column: 17, scope: !96)
!132 = !DILocation(line: 216, column: 37, scope: !96)
!133 = !DILocation(line: 216, column: 71, scope: !96)
!134 = !DILocation(line: 216, column: 23, scope: !96)
!135 = !DILocation(line: 216, column: 21, scope: !96)
!136 = !DILocation(line: 219, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !96, file: !3, line: 219, column: 6)
!138 = !DILocation(line: 219, column: 27, scope: !137)
!139 = !DILocation(line: 219, column: 33, scope: !137)
!140 = !DILocation(line: 219, column: 24, scope: !137)
!141 = !DILocation(line: 219, column: 6, scope: !96)
!142 = !DILocation(line: 220, column: 11, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !3, line: 219, column: 51)
!144 = !DILocation(line: 220, column: 4, scope: !143)
!145 = !DILocation(line: 220, column: 19, scope: !143)
!146 = !DILocation(line: 221, column: 4, scope: !143)
!147 = !DILocation(line: 222, column: 24, scope: !143)
!148 = !DILocation(line: 222, column: 30, scope: !143)
!149 = !DILocation(line: 222, column: 4, scope: !143)
!150 = !DILocation(line: 223, column: 3, scope: !143)
!151 = !DILocation(line: 224, column: 4, scope: !152)
!152 = distinct !DILexicalBlock(scope: !137, file: !3, line: 223, column: 9)
!153 = !DILocation(line: 227, column: 1, scope: !96)
!154 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 237, type: !83, scopeLine: 238, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocation(line: 239, column: 2, scope: !154)
!156 = !DILocation(line: 239, column: 18, scope: !154)
!157 = !DILocation(line: 240, column: 2, scope: !154)
!158 = !DILocation(line: 240, column: 14, scope: !154)
!159 = !DILocation(line: 241, column: 2, scope: !154)
!160 = !DILocation(line: 241, column: 13, scope: !154)
!161 = !DILocation(line: 242, column: 2, scope: !154)
!162 = !DILocation(line: 242, column: 18, scope: !154)
!163 = !DILocation(line: 243, column: 2, scope: !154)
!164 = !DILocation(line: 243, column: 17, scope: !154)
!165 = !DILocation(line: 244, column: 2, scope: !154)
!166 = !DILocation(line: 244, column: 19, scope: !154)
!167 = !DILocation(line: 246, column: 2, scope: !154)
!168 = !DILocation(line: 246, column: 9, scope: !154)
!169 = !DILocation(line: 246, column: 20, scope: !154)
!170 = !DILocalVariable(name: "node", scope: !171, file: !3, line: 248, type: !42)
!171 = distinct !DILexicalBlock(scope: !154, file: !3, line: 246, column: 35)
!172 = !DILocation(line: 248, column: 10, scope: !171)
!173 = !DILocation(line: 248, column: 17, scope: !171)
!174 = !DILocation(line: 249, column: 14, scope: !171)
!175 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 253, type: !66)
!176 = !DILocation(line: 253, column: 7, scope: !171)
!177 = !DILocation(line: 253, column: 11, scope: !171)
!178 = !DILocation(line: 254, column: 3, scope: !171)
!179 = !DILocation(line: 254, column: 12, scope: !171)
!180 = !DILocation(line: 254, column: 17, scope: !171)
!181 = !DILocation(line: 255, column: 3, scope: !171)
!182 = !DILocation(line: 255, column: 13, scope: !171)
!183 = distinct !{!183, !167, !184}
!184 = !DILocation(line: 256, column: 2, scope: !154)
!185 = !DILocation(line: 258, column: 2, scope: !154)
!186 = !DILocation(line: 258, column: 17, scope: !154)
!187 = !DILocation(line: 259, column: 1, scope: !154)
!188 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 261, type: !83, scopeLine: 262, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocalVariable(name: "next_letter_idx", scope: !188, file: !3, line: 263, type: !6)
!190 = !DILocation(line: 263, column: 11, scope: !188)
!191 = !DILocation(line: 263, column: 29, scope: !188)
!192 = !DILocation(line: 263, column: 44, scope: !188)
!193 = !DILocation(line: 264, column: 6, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !3, line: 264, column: 6)
!195 = !DILocation(line: 264, column: 22, scope: !194)
!196 = !DILocation(line: 264, column: 6, scope: !188)
!197 = !DILocation(line: 265, column: 19, scope: !194)
!198 = !DILocation(line: 265, column: 3, scope: !194)
!199 = !DILocation(line: 267, column: 6, scope: !200)
!200 = distinct !DILexicalBlock(scope: !188, file: !3, line: 267, column: 6)
!201 = !DILocation(line: 267, column: 21, scope: !200)
!202 = !DILocation(line: 267, column: 6, scope: !188)
!203 = !DILocation(line: 268, column: 20, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !3, line: 267, column: 27)
!205 = !DILocation(line: 268, column: 3, scope: !204)
!206 = !DILocation(line: 268, column: 18, scope: !204)
!207 = !DILocation(line: 269, column: 3, scope: !204)
!208 = !DILocation(line: 269, column: 13, scope: !204)
!209 = !DILocation(line: 272, column: 2, scope: !204)
!210 = !DILocation(line: 273, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !200, file: !3, line: 272, column: 9)
!212 = !DILocation(line: 273, column: 3, scope: !211)
!213 = !DILocation(line: 273, column: 18, scope: !211)
!214 = !DILocation(line: 274, column: 3, scope: !211)
!215 = !DILocation(line: 274, column: 13, scope: !211)
!216 = !DILocation(line: 278, column: 1, scope: !188)
!217 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 280, type: !83, scopeLine: 281, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!218 = !DILocalVariable(name: "prev_sample", scope: !217, file: !3, line: 282, type: !37)
!219 = !DILocation(line: 282, column: 11, scope: !217)
!220 = !DILocation(line: 283, column: 16, scope: !217)
!221 = !DILocation(line: 283, column: 14, scope: !217)
!222 = !DILocalVariable(name: "sample", scope: !217, file: !3, line: 285, type: !37)
!223 = !DILocation(line: 285, column: 11, scope: !217)
!224 = !DILocation(line: 285, column: 35, scope: !217)
!225 = !DILocation(line: 285, column: 20, scope: !217)
!226 = !DILocation(line: 286, column: 16, scope: !217)
!227 = !DILocation(line: 286, column: 14, scope: !217)
!228 = !DILocation(line: 287, column: 20, scope: !217)
!229 = !DILocation(line: 287, column: 2, scope: !217)
!230 = !DILocation(line: 287, column: 18, scope: !217)
!231 = !DILocation(line: 288, column: 15, scope: !217)
!232 = !DILocation(line: 288, column: 2, scope: !217)
!233 = !DILocation(line: 288, column: 13, scope: !217)
!234 = !DILocation(line: 290, column: 1, scope: !217)
!235 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 231, type: !236, scopeLine: 232, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DISubroutineType(types: !237)
!237 = !{!37, !34}
!238 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !235, file: !3, line: 231, type: !34)
!239 = !DILocation(line: 231, column: 41, scope: !235)
!240 = !DILocalVariable(name: "sample", scope: !235, file: !3, line: 233, type: !34)
!241 = !DILocation(line: 233, column: 11, scope: !235)
!242 = !DILocation(line: 233, column: 21, scope: !235)
!243 = !DILocation(line: 233, column: 33, scope: !235)
!244 = !DILocation(line: 233, column: 38, scope: !235)
!245 = !DILocation(line: 234, column: 9, scope: !235)
!246 = !DILocation(line: 234, column: 2, scope: !235)
!247 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 292, type: !83, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DILocalVariable(name: "letter_idx", scope: !247, file: !3, line: 294, type: !6)
!249 = !DILocation(line: 294, column: 11, scope: !247)
!250 = !DILocation(line: 294, column: 24, scope: !247)
!251 = !DILocation(line: 295, column: 6, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !3, line: 295, column: 6)
!253 = !DILocation(line: 295, column: 17, scope: !252)
!254 = !DILocation(line: 295, column: 6, scope: !247)
!255 = !DILocation(line: 296, column: 14, scope: !252)
!256 = !DILocation(line: 296, column: 3, scope: !252)
!257 = !DILocation(line: 298, column: 13, scope: !252)
!258 = !DILocalVariable(name: "letter_shift", scope: !247, file: !3, line: 299, type: !6)
!259 = !DILocation(line: 299, column: 11, scope: !247)
!260 = !DILocation(line: 299, column: 45, scope: !247)
!261 = !DILocation(line: 299, column: 43, scope: !247)
!262 = !DILocalVariable(name: "letter", scope: !247, file: !3, line: 300, type: !34)
!263 = !DILocation(line: 300, column: 11, scope: !247)
!264 = !DILocation(line: 300, column: 21, scope: !247)
!265 = !DILocation(line: 300, column: 50, scope: !247)
!266 = !DILocation(line: 300, column: 47, scope: !247)
!267 = !DILocation(line: 300, column: 32, scope: !247)
!268 = !DILocation(line: 300, column: 68, scope: !247)
!269 = !DILocation(line: 300, column: 65, scope: !247)
!270 = !DILocation(line: 302, column: 15, scope: !247)
!271 = !DILocation(line: 302, column: 2, scope: !247)
!272 = !DILocation(line: 302, column: 13, scope: !247)
!273 = !DILocation(line: 304, column: 1, scope: !247)
!274 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 306, type: !83, scopeLine: 307, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!275 = !DILocalVariable(name: "parent_node", scope: !274, file: !3, line: 308, type: !42)
!276 = !DILocation(line: 308, column: 9, scope: !274)
!277 = !DILocalVariable(name: "parent", scope: !274, file: !3, line: 309, type: !7)
!278 = !DILocation(line: 309, column: 10, scope: !274)
!279 = !DILocation(line: 309, column: 19, scope: !274)
!280 = !DILocation(line: 310, column: 16, scope: !274)
!281 = !DILocation(line: 310, column: 25, scope: !274)
!282 = !DILocation(line: 312, column: 28, scope: !274)
!283 = !DILocation(line: 312, column: 2, scope: !274)
!284 = !DILocation(line: 312, column: 14, scope: !274)
!285 = !DILocation(line: 313, column: 2, scope: !274)
!286 = !DILocation(line: 313, column: 20, scope: !274)
!287 = !DILocation(line: 314, column: 15, scope: !274)
!288 = !DILocation(line: 314, column: 2, scope: !274)
!289 = !DILocation(line: 314, column: 13, scope: !274)
!290 = !DILocation(line: 315, column: 26, scope: !274)
!291 = !DILocation(line: 315, column: 2, scope: !274)
!292 = !DILocation(line: 315, column: 12, scope: !274)
!293 = !DILocation(line: 316, column: 2, scope: !274)
!294 = !DILocation(line: 316, column: 18, scope: !274)
!295 = !DILocation(line: 319, column: 1, scope: !274)
!296 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 321, type: !83, scopeLine: 322, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!297 = !DILocalVariable(name: "sibling_node", scope: !296, file: !3, line: 323, type: !298)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 16)
!299 = !DILocation(line: 323, column: 10, scope: !296)
!300 = !DILocation(line: 325, column: 6, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !3, line: 325, column: 6)
!302 = !DILocation(line: 325, column: 18, scope: !301)
!303 = !DILocation(line: 325, column: 6, scope: !296)
!304 = !DILocalVariable(name: "i", scope: !305, file: !3, line: 326, type: !66)
!305 = distinct !DILexicalBlock(scope: !301, file: !3, line: 325, column: 26)
!306 = !DILocation(line: 326, column: 7, scope: !305)
!307 = !DILocation(line: 326, column: 11, scope: !305)
!308 = !DILocation(line: 327, column: 19, scope: !305)
!309 = !DILocation(line: 327, column: 28, scope: !305)
!310 = !DILocation(line: 327, column: 16, scope: !305)
!311 = !DILocation(line: 329, column: 7, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !3, line: 329, column: 7)
!313 = !DILocation(line: 329, column: 21, scope: !312)
!314 = !DILocation(line: 329, column: 31, scope: !312)
!315 = !DILocation(line: 329, column: 28, scope: !312)
!316 = !DILocation(line: 329, column: 7, scope: !305)
!317 = !DILocation(line: 331, column: 22, scope: !318)
!318 = distinct !DILexicalBlock(scope: !312, file: !3, line: 329, column: 43)
!319 = !DILocation(line: 331, column: 4, scope: !318)
!320 = !DILocation(line: 331, column: 20, scope: !318)
!321 = !DILocation(line: 333, column: 4, scope: !318)
!322 = !DILocation(line: 333, column: 14, scope: !318)
!323 = !DILocation(line: 335, column: 4, scope: !318)
!324 = !DILocation(line: 337, column: 7, scope: !325)
!325 = distinct !DILexicalBlock(scope: !326, file: !3, line: 337, column: 7)
!326 = distinct !DILexicalBlock(scope: !312, file: !3, line: 336, column: 10)
!327 = !DILocation(line: 337, column: 21, scope: !325)
!328 = !DILocation(line: 337, column: 29, scope: !325)
!329 = !DILocation(line: 337, column: 7, scope: !326)
!330 = !DILocation(line: 338, column: 19, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !3, line: 337, column: 34)
!332 = !DILocation(line: 338, column: 33, scope: !331)
!333 = !DILocation(line: 338, column: 5, scope: !331)
!334 = !DILocation(line: 338, column: 17, scope: !331)
!335 = !DILocation(line: 339, column: 5, scope: !331)
!336 = !DILocation(line: 339, column: 15, scope: !331)
!337 = !DILocation(line: 341, column: 5, scope: !331)
!338 = !DILocation(line: 345, column: 2, scope: !305)
!339 = !DILocalVariable(name: "starting_node_idx", scope: !296, file: !3, line: 347, type: !7)
!340 = !DILocation(line: 347, column: 10, scope: !296)
!341 = !DILocation(line: 347, column: 39, scope: !296)
!342 = !DILocation(line: 348, column: 20, scope: !296)
!343 = !DILocation(line: 348, column: 2, scope: !296)
!344 = !DILocation(line: 348, column: 18, scope: !296)
!345 = !DILocation(line: 350, column: 6, scope: !346)
!346 = distinct !DILexicalBlock(scope: !296, file: !3, line: 350, column: 6)
!347 = !DILocation(line: 350, column: 16, scope: !346)
!348 = !DILocation(line: 350, column: 6, scope: !296)
!349 = !DILocation(line: 351, column: 3, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !3, line: 350, column: 24)
!351 = !DILocation(line: 351, column: 13, scope: !350)
!352 = !DILocation(line: 353, column: 2, scope: !350)
!353 = !DILocation(line: 354, column: 3, scope: !354)
!354 = distinct !DILexicalBlock(scope: !346, file: !3, line: 353, column: 9)
!355 = !DILocation(line: 354, column: 13, scope: !354)
!356 = !DILocation(line: 357, column: 1, scope: !296)
!357 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 359, type: !83, scopeLine: 360, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocalVariable(name: "sibling_node", scope: !357, file: !3, line: 361, type: !298)
!359 = !DILocation(line: 361, column: 10, scope: !357)
!360 = !DILocalVariable(name: "i", scope: !357, file: !3, line: 363, type: !66)
!361 = !DILocation(line: 363, column: 6, scope: !357)
!362 = !DILocation(line: 363, column: 10, scope: !357)
!363 = !DILocation(line: 364, column: 18, scope: !357)
!364 = !DILocation(line: 364, column: 27, scope: !357)
!365 = !DILocation(line: 364, column: 15, scope: !357)
!366 = !DILocation(line: 366, column: 6, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !3, line: 366, column: 6)
!368 = !DILocation(line: 366, column: 20, scope: !367)
!369 = !DILocation(line: 366, column: 28, scope: !367)
!370 = !DILocation(line: 366, column: 6, scope: !357)
!371 = !DILocalVariable(name: "next_sibling", scope: !372, file: !3, line: 367, type: !7)
!372 = distinct !DILexicalBlock(scope: !367, file: !3, line: 366, column: 36)
!373 = !DILocation(line: 367, column: 11, scope: !372)
!374 = !DILocation(line: 367, column: 26, scope: !372)
!375 = !DILocation(line: 367, column: 40, scope: !372)
!376 = !DILocation(line: 368, column: 17, scope: !372)
!377 = !DILocation(line: 368, column: 3, scope: !372)
!378 = !DILocation(line: 368, column: 15, scope: !372)
!379 = !DILocation(line: 371, column: 3, scope: !372)
!380 = !DILocation(line: 371, column: 13, scope: !372)
!381 = !DILocation(line: 373, column: 2, scope: !372)
!382 = !DILocalVariable(name: "sibling_node_obj", scope: !383, file: !3, line: 375, type: !42)
!383 = distinct !DILexicalBlock(scope: !367, file: !3, line: 373, column: 9)
!384 = !DILocation(line: 375, column: 10, scope: !383)
!385 = !DILocation(line: 375, column: 30, scope: !383)
!386 = !DILocation(line: 375, column: 29, scope: !383)
!387 = !DILocation(line: 376, column: 3, scope: !383)
!388 = !DILocation(line: 376, column: 22, scope: !383)
!389 = !DILocation(line: 379, column: 3, scope: !383)
!390 = !DILocation(line: 379, column: 13, scope: !383)
!391 = !DILocation(line: 381, column: 1, scope: !357)
!392 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 383, type: !83, scopeLine: 384, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!393 = !DILocation(line: 386, column: 6, scope: !394)
!394 = distinct !DILexicalBlock(scope: !392, file: !3, line: 386, column: 6)
!395 = !DILocation(line: 386, column: 21, scope: !394)
!396 = !DILocation(line: 386, column: 6, scope: !392)
!397 = !DILocation(line: 387, column: 3, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !3, line: 386, column: 35)
!399 = distinct !{!399, !397, !400}
!400 = !DILocation(line: 387, column: 12, scope: !398)
!401 = !DILocalVariable(name: "child", scope: !392, file: !3, line: 390, type: !7)
!402 = !DILocation(line: 390, column: 10, scope: !392)
!403 = !DILocation(line: 390, column: 18, scope: !392)
!404 = !DILocalVariable(name: "child_node", scope: !392, file: !3, line: 391, type: !42)
!405 = !DILocation(line: 391, column: 9, scope: !392)
!406 = !DILocation(line: 391, column: 22, scope: !392)
!407 = !DILocation(line: 392, column: 13, scope: !392)
!408 = !DILocation(line: 397, column: 6, scope: !409)
!409 = distinct !DILexicalBlock(scope: !392, file: !3, line: 397, column: 6)
!410 = !DILocation(line: 397, column: 22, scope: !409)
!411 = !DILocation(line: 397, column: 28, scope: !409)
!412 = !DILocation(line: 397, column: 6, scope: !392)
!413 = !DILocalVariable(name: "parent_node_obj", scope: !414, file: !3, line: 399, type: !42)
!414 = distinct !DILexicalBlock(scope: !409, file: !3, line: 397, column: 36)
!415 = !DILocation(line: 399, column: 10, scope: !414)
!416 = !DILocation(line: 399, column: 28, scope: !414)
!417 = !DILocation(line: 400, column: 27, scope: !414)
!418 = !DILocation(line: 400, column: 19, scope: !414)
!419 = !DILocation(line: 400, column: 25, scope: !414)
!420 = !DILocation(line: 403, column: 16, scope: !414)
!421 = !DILocation(line: 403, column: 3, scope: !414)
!422 = !DILocation(line: 403, column: 14, scope: !414)
!423 = !DILocation(line: 404, column: 3, scope: !414)
!424 = !DILocation(line: 404, column: 12, scope: !414)
!425 = !DILocation(line: 404, column: 26, scope: !414)
!426 = !DILocation(line: 406, column: 2, scope: !414)
!427 = !DILocation(line: 409, column: 16, scope: !428)
!428 = distinct !DILexicalBlock(scope: !409, file: !3, line: 406, column: 9)
!429 = !DILocation(line: 409, column: 3, scope: !428)
!430 = !DILocation(line: 409, column: 14, scope: !428)
!431 = !DILocalVariable(name: "last_sibling_node", scope: !428, file: !3, line: 410, type: !42)
!432 = !DILocation(line: 410, column: 10, scope: !428)
!433 = !DILocation(line: 410, column: 30, scope: !428)
!434 = !DILocation(line: 412, column: 31, scope: !428)
!435 = !DILocation(line: 412, column: 21, scope: !428)
!436 = !DILocation(line: 412, column: 29, scope: !428)
!437 = !DILocation(line: 414, column: 3, scope: !428)
!438 = !DILocation(line: 414, column: 12, scope: !428)
!439 = !DILocation(line: 414, column: 26, scope: !428)
!440 = !DILocation(line: 416, column: 2, scope: !392)
!441 = !DILocation(line: 416, column: 11, scope: !392)
!442 = !DILocation(line: 416, column: 24, scope: !392)
!443 = !DILocation(line: 417, column: 15, scope: !392)
!444 = !DILocation(line: 417, column: 2, scope: !392)
!445 = !DILocation(line: 417, column: 13, scope: !392)
!446 = !DILocation(line: 418, column: 2, scope: !392)
!447 = !DILocation(line: 418, column: 16, scope: !392)
!448 = !DILocation(line: 421, column: 1, scope: !392)
!449 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 423, type: !83, scopeLine: 424, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!450 = !DILocation(line: 427, column: 15, scope: !449)
!451 = !DILocation(line: 427, column: 2, scope: !449)
!452 = !DILocation(line: 427, column: 13, scope: !449)
!453 = !DILocalVariable(name: "copy", scope: !449, file: !3, line: 433, type: !42)
!454 = !DILocation(line: 433, column: 9, scope: !449)
!455 = !DILocation(line: 433, column: 16, scope: !449)
!456 = !DILocation(line: 434, column: 13, scope: !449)
!457 = !DILocation(line: 435, column: 14, scope: !449)
!458 = !DILocation(line: 435, column: 34, scope: !449)
!459 = !DILocation(line: 435, column: 46, scope: !449)
!460 = !DILocation(line: 436, column: 12, scope: !449)
!461 = !DILocation(line: 436, column: 32, scope: !449)
!462 = !DILocation(line: 436, column: 44, scope: !449)
!463 = !DILocation(line: 439, column: 2, scope: !449)
!464 = !DILocation(line: 439, column: 22, scope: !449)
!465 = !DILocation(line: 439, column: 36, scope: !449)
!466 = !DILocation(line: 441, column: 8, scope: !467)
!467 = distinct !DILexicalBlock(scope: !449, file: !3, line: 441, column: 6)
!468 = !DILocation(line: 441, column: 6, scope: !467)
!469 = !DILocation(line: 441, column: 20, scope: !467)
!470 = !DILocation(line: 441, column: 6, scope: !449)
!471 = !DILocation(line: 443, column: 2, scope: !472)
!472 = distinct !DILexicalBlock(scope: !467, file: !3, line: 441, column: 35)
!473 = !DILocation(line: 446, column: 1, scope: !449)
!474 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 448, type: !83, scopeLine: 449, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!475 = !DILocation(line: 450, column: 2, scope: !474)
!476 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 453, type: !83, scopeLine: 453, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!477 = !DILocation(line: 455, column: 1, scope: !476)
!478 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 457, type: !479, scopeLine: 457, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!479 = !DISubroutineType(types: !480)
!480 = !{!66}
!481 = !DILocation(line: 459, column: 16, scope: !478)
!482 = !DILocation(line: 460, column: 10, scope: !478)
!483 = !DILocation(line: 461, column: 12, scope: !478)
!484 = !DILocation(line: 462, column: 5, scope: !478)
!485 = !DILocation(line: 464, column: 2, scope: !478)
!486 = !DILocation(line: 464, column: 10, scope: !478)
!487 = !DILocation(line: 464, column: 18, scope: !478)
!488 = !DILocation(line: 464, column: 23, scope: !478)
!489 = !DILocation(line: 464, column: 31, scope: !478)
!490 = !DILocation(line: 464, column: 39, scope: !478)
!491 = !DILocation(line: 464, column: 53, scope: !478)
!492 = !DILocation(line: 464, column: 59, scope: !478)
!493 = !DILocation(line: 464, column: 67, scope: !478)
!494 = !DILocation(line: 464, column: 72, scope: !478)
!495 = !DILocation(line: 464, column: 78, scope: !478)
!496 = !DILocation(line: 464, column: 86, scope: !478)
!497 = !DILocation(line: 466, column: 2, scope: !478)
!498 = !DILocation(line: 467, column: 2, scope: !478)
!499 = !DILocation(line: 467, column: 2, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !3, line: 467, column: 2)
!501 = distinct !DILexicalBlock(scope: !478, file: !3, line: 467, column: 2)
!502 = !DILocation(line: 467, column: 2, scope: !501)
!503 = !DILocation(line: 467, column: 2, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !3, line: 467, column: 2)
!505 = !DILocalVariable(name: "__x", scope: !506, file: !3, line: 467, type: !6)
!506 = distinct !DILexicalBlock(scope: !504, file: !3, line: 467, column: 2)
!507 = !DILocation(line: 467, column: 2, scope: !506)
!508 = !{i32 -2146613358}
!509 = !DILocalVariable(name: "__x", scope: !510, file: !3, line: 467, type: !6)
!510 = distinct !DILexicalBlock(scope: !504, file: !3, line: 467, column: 2)
!511 = !DILocation(line: 467, column: 2, scope: !510)
!512 = !{i32 -2146613233}
!513 = !DILocation(line: 467, column: 2, scope: !514)
!514 = distinct !DILexicalBlock(scope: !500, file: !3, line: 467, column: 2)
!515 = !DILocalVariable(name: "__x", scope: !516, file: !3, line: 467, type: !6)
!516 = distinct !DILexicalBlock(scope: !514, file: !3, line: 467, column: 2)
!517 = !DILocation(line: 467, column: 2, scope: !516)
!518 = !{i32 -2146613101}
!519 = !DILocalVariable(name: "__x", scope: !520, file: !3, line: 467, type: !6)
!520 = distinct !DILexicalBlock(scope: !514, file: !3, line: 467, column: 2)
!521 = !DILocation(line: 467, column: 2, scope: !520)
!522 = !{i32 -2146612976}
!523 = !DILocation(line: 468, column: 2, scope: !478)
!524 = !DILocation(line: 470, column: 2, scope: !478)
!525 = !DILocation(line: 470, column: 8, scope: !478)
!526 = !DILocation(line: 470, column: 21, scope: !478)
!527 = !DILocation(line: 472, column: 3, scope: !528)
!528 = distinct !DILexicalBlock(scope: !478, file: !3, line: 470, column: 34)
!529 = !DILocation(line: 473, column: 3, scope: !528)
!530 = !DILocation(line: 473, column: 3, scope: !531)
!531 = distinct !DILexicalBlock(scope: !532, file: !3, line: 473, column: 3)
!532 = distinct !DILexicalBlock(scope: !528, file: !3, line: 473, column: 3)
!533 = !DILocation(line: 473, column: 3, scope: !532)
!534 = !DILocation(line: 473, column: 3, scope: !535)
!535 = distinct !DILexicalBlock(scope: !531, file: !3, line: 473, column: 3)
!536 = !DILocalVariable(name: "__x", scope: !537, file: !3, line: 473, type: !6)
!537 = distinct !DILexicalBlock(scope: !535, file: !3, line: 473, column: 3)
!538 = !DILocation(line: 473, column: 3, scope: !537)
!539 = !{i32 -2146610825}
!540 = !DILocalVariable(name: "__x", scope: !541, file: !3, line: 473, type: !6)
!541 = distinct !DILexicalBlock(scope: !535, file: !3, line: 473, column: 3)
!542 = !DILocation(line: 473, column: 3, scope: !541)
!543 = !{i32 -2146610700}
!544 = !DILocation(line: 473, column: 3, scope: !545)
!545 = distinct !DILexicalBlock(scope: !531, file: !3, line: 473, column: 3)
!546 = !DILocalVariable(name: "__x", scope: !547, file: !3, line: 473, type: !6)
!547 = distinct !DILexicalBlock(scope: !545, file: !3, line: 473, column: 3)
!548 = !DILocation(line: 473, column: 3, scope: !547)
!549 = !{i32 -2146610568}
!550 = !DILocalVariable(name: "__x", scope: !551, file: !3, line: 473, type: !6)
!551 = distinct !DILexicalBlock(scope: !545, file: !3, line: 473, column: 3)
!552 = !DILocation(line: 473, column: 3, scope: !551)
!553 = !{i32 -2146610443}
!554 = !DILocation(line: 474, column: 3, scope: !528)
!555 = !DILocation(line: 476, column: 7, scope: !556)
!556 = distinct !DILexicalBlock(scope: !528, file: !3, line: 476, column: 7)
!557 = !DILocation(line: 476, column: 18, scope: !556)
!558 = !DILocation(line: 476, column: 7, scope: !528)
!559 = !DILocation(line: 478, column: 4, scope: !560)
!560 = distinct !DILexicalBlock(scope: !556, file: !3, line: 476, column: 23)
!561 = !DILocation(line: 479, column: 4, scope: !560)
!562 = !DILocation(line: 479, column: 4, scope: !563)
!563 = distinct !DILexicalBlock(scope: !564, file: !3, line: 479, column: 4)
!564 = distinct !DILexicalBlock(scope: !560, file: !3, line: 479, column: 4)
!565 = !DILocation(line: 479, column: 4, scope: !564)
!566 = !DILocation(line: 479, column: 4, scope: !567)
!567 = distinct !DILexicalBlock(scope: !563, file: !3, line: 479, column: 4)
!568 = !DILocalVariable(name: "__x", scope: !569, file: !3, line: 479, type: !6)
!569 = distinct !DILexicalBlock(scope: !567, file: !3, line: 479, column: 4)
!570 = !DILocation(line: 479, column: 4, scope: !569)
!571 = !{i32 -2146608297}
!572 = !DILocalVariable(name: "__x", scope: !573, file: !3, line: 479, type: !6)
!573 = distinct !DILexicalBlock(scope: !567, file: !3, line: 479, column: 4)
!574 = !DILocation(line: 479, column: 4, scope: !573)
!575 = !{i32 -2146608172}
!576 = !DILocation(line: 479, column: 4, scope: !577)
!577 = distinct !DILexicalBlock(scope: !563, file: !3, line: 479, column: 4)
!578 = !DILocalVariable(name: "__x", scope: !579, file: !3, line: 479, type: !6)
!579 = distinct !DILexicalBlock(scope: !577, file: !3, line: 479, column: 4)
!580 = !DILocation(line: 479, column: 4, scope: !579)
!581 = !{i32 -2146608040}
!582 = !DILocalVariable(name: "__x", scope: !583, file: !3, line: 479, type: !6)
!583 = distinct !DILexicalBlock(scope: !577, file: !3, line: 479, column: 4)
!584 = !DILocation(line: 479, column: 4, scope: !583)
!585 = !{i32 -2146607915}
!586 = !DILocation(line: 480, column: 4, scope: !560)
!587 = !DILocation(line: 481, column: 3, scope: !560)
!588 = !DILocation(line: 483, column: 3, scope: !528)
!589 = !DILocation(line: 485, column: 4, scope: !590)
!590 = distinct !DILexicalBlock(scope: !528, file: !3, line: 483, column: 13)
!591 = !DILocation(line: 486, column: 4, scope: !590)
!592 = !DILocation(line: 486, column: 4, scope: !593)
!593 = distinct !DILexicalBlock(scope: !594, file: !3, line: 486, column: 4)
!594 = distinct !DILexicalBlock(scope: !590, file: !3, line: 486, column: 4)
!595 = !DILocation(line: 486, column: 4, scope: !594)
!596 = !DILocation(line: 486, column: 4, scope: !597)
!597 = distinct !DILexicalBlock(scope: !593, file: !3, line: 486, column: 4)
!598 = !DILocalVariable(name: "__x", scope: !599, file: !3, line: 486, type: !6)
!599 = distinct !DILexicalBlock(scope: !597, file: !3, line: 486, column: 4)
!600 = !DILocation(line: 486, column: 4, scope: !599)
!601 = !{i32 -2146605791}
!602 = !DILocalVariable(name: "__x", scope: !603, file: !3, line: 486, type: !6)
!603 = distinct !DILexicalBlock(scope: !597, file: !3, line: 486, column: 4)
!604 = !DILocation(line: 486, column: 4, scope: !603)
!605 = !{i32 -2146605666}
!606 = !DILocation(line: 486, column: 4, scope: !607)
!607 = distinct !DILexicalBlock(scope: !593, file: !3, line: 486, column: 4)
!608 = !DILocalVariable(name: "__x", scope: !609, file: !3, line: 486, type: !6)
!609 = distinct !DILexicalBlock(scope: !607, file: !3, line: 486, column: 4)
!610 = !DILocation(line: 486, column: 4, scope: !609)
!611 = !{i32 -2146605534}
!612 = !DILocalVariable(name: "__x", scope: !613, file: !3, line: 486, type: !6)
!613 = distinct !DILexicalBlock(scope: !607, file: !3, line: 486, column: 4)
!614 = !DILocation(line: 486, column: 4, scope: !613)
!615 = !{i32 -2146605409}
!616 = !DILocation(line: 487, column: 4, scope: !590)
!617 = !DILocation(line: 489, column: 4, scope: !590)
!618 = !DILocation(line: 490, column: 4, scope: !590)
!619 = !DILocation(line: 490, column: 4, scope: !620)
!620 = distinct !DILexicalBlock(scope: !621, file: !3, line: 490, column: 4)
!621 = distinct !DILexicalBlock(scope: !590, file: !3, line: 490, column: 4)
!622 = !DILocation(line: 490, column: 4, scope: !621)
!623 = !DILocation(line: 490, column: 4, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !3, line: 490, column: 4)
!625 = !DILocalVariable(name: "__x", scope: !626, file: !3, line: 490, type: !6)
!626 = distinct !DILexicalBlock(scope: !624, file: !3, line: 490, column: 4)
!627 = !DILocation(line: 490, column: 4, scope: !626)
!628 = !{i32 -2146603285}
!629 = !DILocalVariable(name: "__x", scope: !630, file: !3, line: 490, type: !6)
!630 = distinct !DILexicalBlock(scope: !624, file: !3, line: 490, column: 4)
!631 = !DILocation(line: 490, column: 4, scope: !630)
!632 = !{i32 -2146603160}
!633 = !DILocation(line: 490, column: 4, scope: !634)
!634 = distinct !DILexicalBlock(scope: !620, file: !3, line: 490, column: 4)
!635 = !DILocalVariable(name: "__x", scope: !636, file: !3, line: 490, type: !6)
!636 = distinct !DILexicalBlock(scope: !634, file: !3, line: 490, column: 4)
!637 = !DILocation(line: 490, column: 4, scope: !636)
!638 = !{i32 -2146603028}
!639 = !DILocalVariable(name: "__x", scope: !640, file: !3, line: 490, type: !6)
!640 = distinct !DILexicalBlock(scope: !634, file: !3, line: 490, column: 4)
!641 = !DILocation(line: 490, column: 4, scope: !640)
!642 = !{i32 -2146602903}
!643 = !DILocation(line: 491, column: 4, scope: !590)
!644 = !DILocation(line: 493, column: 4, scope: !590)
!645 = !DILocation(line: 493, column: 11, scope: !590)
!646 = !DILocation(line: 493, column: 22, scope: !590)
!647 = !DILocation(line: 495, column: 5, scope: !648)
!648 = distinct !DILexicalBlock(scope: !590, file: !3, line: 493, column: 28)
!649 = !DILocation(line: 496, column: 5, scope: !648)
!650 = !DILocation(line: 496, column: 5, scope: !651)
!651 = distinct !DILexicalBlock(scope: !652, file: !3, line: 496, column: 5)
!652 = distinct !DILexicalBlock(scope: !648, file: !3, line: 496, column: 5)
!653 = !DILocation(line: 496, column: 5, scope: !652)
!654 = !DILocation(line: 496, column: 5, scope: !655)
!655 = distinct !DILexicalBlock(scope: !651, file: !3, line: 496, column: 5)
!656 = !DILocalVariable(name: "__x", scope: !657, file: !3, line: 496, type: !6)
!657 = distinct !DILexicalBlock(scope: !655, file: !3, line: 496, column: 5)
!658 = !DILocation(line: 496, column: 5, scope: !657)
!659 = !{i32 -2146600757}
!660 = !DILocalVariable(name: "__x", scope: !661, file: !3, line: 496, type: !6)
!661 = distinct !DILexicalBlock(scope: !655, file: !3, line: 496, column: 5)
!662 = !DILocation(line: 496, column: 5, scope: !661)
!663 = !{i32 -2146600632}
!664 = !DILocation(line: 496, column: 5, scope: !665)
!665 = distinct !DILexicalBlock(scope: !651, file: !3, line: 496, column: 5)
!666 = !DILocalVariable(name: "__x", scope: !667, file: !3, line: 496, type: !6)
!667 = distinct !DILexicalBlock(scope: !665, file: !3, line: 496, column: 5)
!668 = !DILocation(line: 496, column: 5, scope: !667)
!669 = !{i32 -2146600500}
!670 = !DILocalVariable(name: "__x", scope: !671, file: !3, line: 496, type: !6)
!671 = distinct !DILexicalBlock(scope: !665, file: !3, line: 496, column: 5)
!672 = !DILocation(line: 496, column: 5, scope: !671)
!673 = !{i32 -2146600375}
!674 = !DILocation(line: 497, column: 5, scope: !648)
!675 = distinct !{!675, !644, !676}
!676 = !DILocation(line: 499, column: 4, scope: !590)
!677 = !DILocation(line: 501, column: 8, scope: !678)
!678 = distinct !DILexicalBlock(scope: !590, file: !3, line: 501, column: 8)
!679 = !DILocation(line: 501, column: 19, scope: !678)
!680 = !DILocation(line: 501, column: 8, scope: !590)
!681 = !DILocation(line: 502, column: 5, scope: !678)
!682 = distinct !{!682, !588, !683}
!683 = !DILocation(line: 503, column: 3, scope: !528)
!684 = !DILocation(line: 505, column: 7, scope: !685)
!685 = distinct !DILexicalBlock(scope: !528, file: !3, line: 505, column: 7)
!686 = !DILocation(line: 505, column: 18, scope: !685)
!687 = !DILocation(line: 505, column: 7, scope: !528)
!688 = !DILocation(line: 506, column: 4, scope: !689)
!689 = distinct !DILexicalBlock(scope: !685, file: !3, line: 505, column: 24)
!690 = !DILocation(line: 507, column: 5, scope: !691)
!691 = distinct !DILexicalBlock(scope: !689, file: !3, line: 506, column: 6)
!692 = !DILocation(line: 508, column: 5, scope: !691)
!693 = !DILocation(line: 508, column: 5, scope: !694)
!694 = distinct !DILexicalBlock(scope: !695, file: !3, line: 508, column: 5)
!695 = distinct !DILexicalBlock(scope: !691, file: !3, line: 508, column: 5)
!696 = !DILocation(line: 508, column: 5, scope: !695)
!697 = !DILocation(line: 508, column: 5, scope: !698)
!698 = distinct !DILexicalBlock(scope: !694, file: !3, line: 508, column: 5)
!699 = !DILocalVariable(name: "__x", scope: !700, file: !3, line: 508, type: !6)
!700 = distinct !DILexicalBlock(scope: !698, file: !3, line: 508, column: 5)
!701 = !DILocation(line: 508, column: 5, scope: !700)
!702 = !{i32 -2146598207}
!703 = !DILocalVariable(name: "__x", scope: !704, file: !3, line: 508, type: !6)
!704 = distinct !DILexicalBlock(scope: !698, file: !3, line: 508, column: 5)
!705 = !DILocation(line: 508, column: 5, scope: !704)
!706 = !{i32 -2146598082}
!707 = !DILocation(line: 508, column: 5, scope: !708)
!708 = distinct !DILexicalBlock(scope: !694, file: !3, line: 508, column: 5)
!709 = !DILocalVariable(name: "__x", scope: !710, file: !3, line: 508, type: !6)
!710 = distinct !DILexicalBlock(scope: !708, file: !3, line: 508, column: 5)
!711 = !DILocation(line: 508, column: 5, scope: !710)
!712 = !{i32 -2146597950}
!713 = !DILocalVariable(name: "__x", scope: !714, file: !3, line: 508, type: !6)
!714 = distinct !DILexicalBlock(scope: !708, file: !3, line: 508, column: 5)
!715 = !DILocation(line: 508, column: 5, scope: !714)
!716 = !{i32 -2146597825}
!717 = !DILocation(line: 509, column: 5, scope: !691)
!718 = !DILocation(line: 510, column: 4, scope: !691)
!719 = !DILocation(line: 510, column: 13, scope: !689)
!720 = !DILocation(line: 510, column: 24, scope: !689)
!721 = distinct !{!721, !688, !722}
!722 = !DILocation(line: 510, column: 28, scope: !689)
!723 = !DILocation(line: 511, column: 3, scope: !689)
!724 = !DILocation(line: 513, column: 3, scope: !528)
!725 = !DILocation(line: 514, column: 3, scope: !528)
!726 = !DILocation(line: 514, column: 3, scope: !727)
!727 = distinct !DILexicalBlock(scope: !728, file: !3, line: 514, column: 3)
!728 = distinct !DILexicalBlock(scope: !528, file: !3, line: 514, column: 3)
!729 = !DILocation(line: 514, column: 3, scope: !728)
!730 = !DILocation(line: 514, column: 3, scope: !731)
!731 = distinct !DILexicalBlock(scope: !727, file: !3, line: 514, column: 3)
!732 = !DILocalVariable(name: "__x", scope: !733, file: !3, line: 514, type: !6)
!733 = distinct !DILexicalBlock(scope: !731, file: !3, line: 514, column: 3)
!734 = !DILocation(line: 514, column: 3, scope: !733)
!735 = !{i32 -2146595679}
!736 = !DILocalVariable(name: "__x", scope: !737, file: !3, line: 514, type: !6)
!737 = distinct !DILexicalBlock(scope: !731, file: !3, line: 514, column: 3)
!738 = !DILocation(line: 514, column: 3, scope: !737)
!739 = !{i32 -2146595554}
!740 = !DILocation(line: 514, column: 3, scope: !741)
!741 = distinct !DILexicalBlock(scope: !727, file: !3, line: 514, column: 3)
!742 = !DILocalVariable(name: "__x", scope: !743, file: !3, line: 514, type: !6)
!743 = distinct !DILexicalBlock(scope: !741, file: !3, line: 514, column: 3)
!744 = !DILocation(line: 514, column: 3, scope: !743)
!745 = !{i32 -2146595422}
!746 = !DILocalVariable(name: "__x", scope: !747, file: !3, line: 514, type: !6)
!747 = distinct !DILexicalBlock(scope: !741, file: !3, line: 514, column: 3)
!748 = !DILocation(line: 514, column: 3, scope: !747)
!749 = !{i32 -2146595297}
!750 = !DILocation(line: 515, column: 3, scope: !528)
!751 = !DILocation(line: 517, column: 3, scope: !528)
!752 = !DILocation(line: 518, column: 3, scope: !528)
!753 = !DILocation(line: 518, column: 3, scope: !754)
!754 = distinct !DILexicalBlock(scope: !755, file: !3, line: 518, column: 3)
!755 = distinct !DILexicalBlock(scope: !528, file: !3, line: 518, column: 3)
!756 = !DILocation(line: 518, column: 3, scope: !755)
!757 = !DILocation(line: 518, column: 3, scope: !758)
!758 = distinct !DILexicalBlock(scope: !754, file: !3, line: 518, column: 3)
!759 = !DILocalVariable(name: "__x", scope: !760, file: !3, line: 518, type: !6)
!760 = distinct !DILexicalBlock(scope: !758, file: !3, line: 518, column: 3)
!761 = !DILocation(line: 518, column: 3, scope: !760)
!762 = !{i32 -2146593173}
!763 = !DILocalVariable(name: "__x", scope: !764, file: !3, line: 518, type: !6)
!764 = distinct !DILexicalBlock(scope: !758, file: !3, line: 518, column: 3)
!765 = !DILocation(line: 518, column: 3, scope: !764)
!766 = !{i32 -2146593048}
!767 = !DILocation(line: 518, column: 3, scope: !768)
!768 = distinct !DILexicalBlock(scope: !754, file: !3, line: 518, column: 3)
!769 = !DILocalVariable(name: "__x", scope: !770, file: !3, line: 518, type: !6)
!770 = distinct !DILexicalBlock(scope: !768, file: !3, line: 518, column: 3)
!771 = !DILocation(line: 518, column: 3, scope: !770)
!772 = !{i32 -2146592916}
!773 = !DILocalVariable(name: "__x", scope: !774, file: !3, line: 518, type: !6)
!774 = distinct !DILexicalBlock(scope: !768, file: !3, line: 518, column: 3)
!775 = !DILocation(line: 518, column: 3, scope: !774)
!776 = !{i32 -2146592791}
!777 = !DILocation(line: 519, column: 3, scope: !528)
!778 = distinct !{!778, !524, !779}
!779 = !DILocation(line: 520, column: 2, scope: !478)
!780 = !DILocation(line: 522, column: 2, scope: !478)
!781 = !DILocation(line: 523, column: 1, scope: !478)
