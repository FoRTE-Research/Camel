; ModuleID = 'camel_cem.bc'
source_filename = "../example/camel_cem.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, [512 x %struct._node_t], i16, i16, i16, i16, i16, i16, %struct._node_t, [64 x %struct._node_t], %struct._node_t, i16, i16 }
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
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !66
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !9
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !16
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !68

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !80 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !83
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !84
  %conv = zext i8 %0 to i16, !dbg !84
  %or = or i16 %conv, 1, !dbg !84
  %conv1 = trunc i16 %or to i8, !dbg !84
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !84
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !85
  %conv2 = zext i8 %1 to i16, !dbg !85
  %and = and i16 %conv2, -2, !dbg !85
  %conv3 = trunc i16 %and to i8, !dbg !85
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !85
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !86
  %and4 = and i16 %2, -2, !dbg !86
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !86
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !87
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !88
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !89
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !90
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !91
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !92
  ret void, !dbg !93
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !94 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !95
  %cmp = icmp eq i16 %0, 1, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !101
  br label %if.end4, !dbg !102

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !103
  %cmp1 = icmp eq i16 %1, 2, !dbg !105
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !106

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !107
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !109
  br label %if.end, !dbg !110

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !113
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !113
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !113
  %3 = load i16, i16* %arrayidx, align 2, !dbg !113
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !113, !srcloc !115
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !116, metadata !DIExpression()), !dbg !118
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !118, !srcloc !119
  store i16 %4, i16* %__x, align 2, !dbg !118
  %5 = load i16, i16* %__x, align 2, !dbg !118
  store i16 %5, i16* %tmp, align 2, !dbg !118
  %6 = load i16, i16* %tmp, align 2, !dbg !118
  %add = add i16 %6, 2, !dbg !120
  %7 = inttoptr i16 %add to i8*, !dbg !121
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !122, metadata !DIExpression()), !dbg !124
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !124, !srcloc !125
  store i16 %8, i16* %__x5, align 2, !dbg !124
  %9 = load i16, i16* %__x5, align 2, !dbg !124
  store i16 %9, i16* %tmp6, align 2, !dbg !124
  %10 = load i16, i16* %tmp6, align 2, !dbg !124
  %add7 = add i16 %10, 2, !dbg !126
  %sub = sub i16 9216, %add7, !dbg !127
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !128
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !129
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !130
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !130
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !131
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 3516, i16 zeroext %13), !dbg !132
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !133
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !134
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !136
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !137
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !137
  %cmp9 = icmp eq i16 %14, %16, !dbg !138
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !139

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !140
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !142
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !143
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 3518, i1 false), !dbg !142
  call void @camel_init(), !dbg !144
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !145
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !146
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !145
  call void @__restore_registers(i16* %arraydecay), !dbg !147
  br label %if.end13, !dbg !148

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !149
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !151
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !152 {
entry:
  %node = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !153
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !153
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !153
  store i16 0, i16* %parent_next, align 2, !dbg !154
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !155
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !155
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !155
  store i16 0, i16* %out_len, align 2, !dbg !156
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !157
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !157
  %letter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !157
  store i16 0, i16* %letter, align 2, !dbg !158
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !159
  %prev_sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !159
  store i16 0, i16* %prev_sample, align 2, !dbg !160
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !161
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !161
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !161
  store i16 0, i16* %letter_idx, align 2, !dbg !162
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !163
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !163
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !163
  store i16 1, i16* %sample_count, align 2, !dbg !164
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !165
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !165
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 16, !dbg !165
  store i16 0, i16* %check, align 2, !dbg !166
  br label %while.cond, !dbg !167

while.cond:                                       ; preds = %while.body, %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !168
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !168
  %letter8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 0, !dbg !168
  %8 = load i16, i16* %letter8, align 2, !dbg !168
  %cmp = icmp ult i16 %8, 256, !dbg !169
  br i1 %cmp, label %while.body, label %while.end, !dbg !167

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct._node_t* %node, metadata !170, metadata !DIExpression()), !dbg !172
  %letter9 = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 0, !dbg !173
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !174
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !174
  %letter11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !174
  %10 = load i16, i16* %letter11, align 2, !dbg !174
  store i16 %10, i16* %letter9, align 2, !dbg !173
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 1, !dbg !173
  store i16 0, i16* %sibling, align 2, !dbg !173
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 2, !dbg !173
  store i16 0, i16* %child, align 2, !dbg !173
  call void @llvm.dbg.declare(metadata i16* %i, metadata !175, metadata !DIExpression()), !dbg !176
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !177
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !177
  %letter13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 0, !dbg !177
  %12 = load i16, i16* %letter13, align 2, !dbg !177
  store i16 %12, i16* %i, align 2, !dbg !176
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !178
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !178
  %14 = load i16, i16* %i, align 2, !dbg !179
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %14, !dbg !178
  %15 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !180
  %16 = bitcast %struct._node_t* %node to i8*, !dbg !180
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !180
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !181
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !181
  %letter16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !181
  %18 = load i16, i16* %letter16, align 2, !dbg !182
  %inc = add i16 %18, 1, !dbg !182
  store i16 %inc, i16* %letter16, align 2, !dbg !182
  br label %while.cond, !dbg !167, !llvm.loop !183

while.end:                                        ; preds = %while.cond
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !185
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !185
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 4, !dbg !185
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
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 16, !dbg !207
  store i16 1, i16* %check, align 2, !dbg !208
  br label %if.end12, !dbg !209

if.else:                                          ; preds = %if.end
  %8 = load i16, i16* %next_letter_idx, align 2, !dbg !210
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !212
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !212
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !212
  store i16 %8, i16* %letter_idx9, align 2, !dbg !213
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !214
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !214
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !214
  store i16 0, i16* %check11, align 2, !dbg !215
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
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 16, !dbg !321
  store i16 1, i16* %check, align 2, !dbg !322
  br label %if.end20, !dbg !323

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
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !335
  store i16 2, i16* %check19, align 2, !dbg !336
  br label %if.end, !dbg !337

if.end:                                           ; preds = %if.then14, %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end, %if.then7
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
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 16, !dbg !349
  store i16 3, i16* %check30, align 2, !dbg !351
  br label %if.end34, !dbg !352

if.else31:                                        ; preds = %if.end21
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !353
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 16, !dbg !353
  store i16 4, i16* %check33, align 2, !dbg !355
  br label %if.end34

if.end34:                                         ; preds = %if.else31, %if.then28
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
  br label %if.end, !dbg !379

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !380, metadata !DIExpression()), !dbg !382
  %10 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !383
  %11 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !384
  %12 = bitcast %struct._node_t* %10 to i8*, !dbg !384
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %12, i16 6, i1 false), !dbg !384
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !385
  %sibling_node7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 14, !dbg !385
  %14 = bitcast %struct._node_t* %sibling_node7 to i8*, !dbg !386
  %15 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !386
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 6, i1 false), !dbg !386
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !387
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() #0 !dbg !388 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %last_sibling = alloca i16, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !389
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !389
  %1 = load i16, i16* %node_count, align 2, !dbg !389
  %cmp = icmp eq i16 %1, 512, !dbg !391
  br i1 %cmp, label %if.then, label %if.end, !dbg !392

if.then:                                          ; preds = %entry
  br label %while.body, !dbg !393

while.body:                                       ; preds = %if.then, %while.body
  br label %while.body, !dbg !393, !llvm.loop !395

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %child, metadata !397, metadata !DIExpression()), !dbg !398
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !399
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !399
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !399
  %3 = load i16, i16* %node_count2, align 2, !dbg !399
  store i16 %3, i16* %child, align 2, !dbg !398
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !400, metadata !DIExpression()), !dbg !401
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !402
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !403
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !403
  %5 = load i16, i16* %letter4, align 2, !dbg !403
  store i16 %5, i16* %letter, align 2, !dbg !402
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !402
  store i16 0, i16* %sibling, align 2, !dbg !402
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !402
  store i16 0, i16* %child5, align 2, !dbg !402
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !404
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !404
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !404
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !406
  %7 = load i16, i16* %child7, align 2, !dbg !406
  %cmp8 = icmp eq i16 %7, 0, !dbg !407
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !408

if.then9:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !409, metadata !DIExpression()), !dbg !411
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !412
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !412
  %9 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !412
  %10 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !412
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %9, i8* align 2 %10, i16 6, i1 false), !dbg !412
  %11 = load i16, i16* %child, align 2, !dbg !413
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !414
  store i16 %11, i16* %child12, align 2, !dbg !415
  call void @llvm.dbg.declare(metadata i16* %i, metadata !416, metadata !DIExpression()), !dbg !417
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !418
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !418
  %13 = load i16, i16* %parent, align 2, !dbg !418
  store i16 %13, i16* %i, align 2, !dbg !417
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !419
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !419
  %15 = load i16, i16* %i, align 2, !dbg !420
  %arrayidx = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict, i16 0, i16 %15, !dbg !419
  %16 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !421
  %17 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !421
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %16, i8* align 2 %17, i16 6, i1 false), !dbg !421
  br label %if.end22, !dbg !422

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i16* %last_sibling, metadata !423, metadata !DIExpression()), !dbg !425
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !426
  %sibling16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 8, !dbg !426
  %19 = load i16, i16* %sibling16, align 2, !dbg !426
  store i16 %19, i16* %last_sibling, align 2, !dbg !425
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !427, metadata !DIExpression()), !dbg !428
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !429
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 14, !dbg !429
  %21 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !429
  %22 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !429
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %21, i8* align 2 %22, i16 6, i1 false), !dbg !429
  %23 = load i16, i16* %child, align 2, !dbg !430
  %sibling18 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !431
  store i16 %23, i16* %sibling18, align 2, !dbg !432
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !433
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !433
  %dict20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 5, !dbg !433
  %25 = load i16, i16* %last_sibling, align 2, !dbg !434
  %arrayidx21 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict20, i16 0, i16 %25, !dbg !433
  %26 = bitcast %struct._node_t* %arrayidx21 to i8*, !dbg !435
  %27 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !435
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %26, i8* align 2 %27, i16 6, i1 false), !dbg !435
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then9
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !436
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !436
  %29 = load i16, i16* %child, align 2, !dbg !437
  %arrayidx25 = getelementptr inbounds [512 x %struct._node_t], [512 x %struct._node_t]* %dict24, i16 0, i16 %29, !dbg !436
  %30 = bitcast %struct._node_t* %arrayidx25 to i8*, !dbg !438
  %31 = bitcast %struct._node_t* %child_node to i8*, !dbg !438
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %30, i8* align 2 %31, i16 6, i1 false), !dbg !438
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !439
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !439
  %parent27 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 10, !dbg !439
  %33 = load i16, i16* %parent27, align 2, !dbg !439
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !440
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 15, !dbg !440
  store i16 %33, i16* %symbol, align 2, !dbg !441
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !442
  %node_count30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 4, !dbg !442
  %36 = load i16, i16* %node_count30, align 2, !dbg !443
  %inc = add i16 %36, 1, !dbg !443
  store i16 %inc, i16* %node_count30, align 2, !dbg !443
  ret void, !dbg !444
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() #0 !dbg !445 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !446, metadata !DIExpression()), !dbg !447
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !448
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !448
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !448
  %1 = load i16, i16* %out_len, align 2, !dbg !448
  store i16 %1, i16* %i, align 2, !dbg !447
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !449
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 15, !dbg !449
  %3 = load i16, i16* %symbol, align 2, !dbg !449
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !450
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !450
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !450
  %5 = load i16, i16* %i, align 2, !dbg !450
  %arrayidx = getelementptr inbounds [64 x %struct._node_t], [64 x %struct._node_t]* %compressed_data, i16 0, i16 %5, !dbg !450
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 0, !dbg !451
  store i16 %3, i16* %letter, align 2, !dbg !452
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !453
  %out_len4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !453
  %7 = load i16, i16* %out_len4, align 2, !dbg !455
  %inc = add i16 %7, 1, !dbg !455
  store i16 %inc, i16* %out_len4, align 2, !dbg !455
  %cmp = icmp eq i16 %inc, 64, !dbg !456
  br i1 %cmp, label %if.then, label %if.else, !dbg !457

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !458

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !460
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !461 {
entry:
  call void @exit(i16 0) #6, !dbg !462
  unreachable, !dbg !462
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !463 {
entry:
  ret void, !dbg !464
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !465 {
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
  %__x26 = alloca i16, align 2
  %tmp27 = alloca i16, align 2
  %__x29 = alloca i16, align 2
  %tmp30 = alloca i16, align 2
  %__x39 = alloca i16, align 2
  %tmp40 = alloca i16, align 2
  %__x42 = alloca i16, align 2
  %tmp43 = alloca i16, align 2
  %__x59 = alloca i16, align 2
  %tmp60 = alloca i16, align 2
  %__x62 = alloca i16, align 2
  %tmp63 = alloca i16, align 2
  %__x72 = alloca i16, align 2
  %tmp73 = alloca i16, align 2
  %__x75 = alloca i16, align 2
  %tmp76 = alloca i16, align 2
  %__x89 = alloca i16, align 2
  %tmp90 = alloca i16, align 2
  %__x92 = alloca i16, align 2
  %tmp93 = alloca i16, align 2
  %__x102 = alloca i16, align 2
  %tmp103 = alloca i16, align 2
  %__x105 = alloca i16, align 2
  %tmp106 = alloca i16, align 2
  %__x121 = alloca i16, align 2
  %tmp122 = alloca i16, align 2
  %__x124 = alloca i16, align 2
  %tmp125 = alloca i16, align 2
  %__x134 = alloca i16, align 2
  %tmp135 = alloca i16, align 2
  %__x137 = alloca i16, align 2
  %tmp138 = alloca i16, align 2
  %__x167 = alloca i16, align 2
  %tmp168 = alloca i16, align 2
  %__x170 = alloca i16, align 2
  %tmp171 = alloca i16, align 2
  %__x180 = alloca i16, align 2
  %tmp181 = alloca i16, align 2
  %__x183 = alloca i16, align 2
  %tmp184 = alloca i16, align 2
  %__x197 = alloca i16, align 2
  %tmp198 = alloca i16, align 2
  %__x200 = alloca i16, align 2
  %tmp201 = alloca i16, align 2
  %__x210 = alloca i16, align 2
  %tmp211 = alloca i16, align 2
  %__x213 = alloca i16, align 2
  %tmp214 = alloca i16, align 2
  %__x227 = alloca i16, align 2
  %tmp228 = alloca i16, align 2
  %__x230 = alloca i16, align 2
  %tmp231 = alloca i16, align 2
  %__x240 = alloca i16, align 2
  %tmp241 = alloca i16, align 2
  %__x243 = alloca i16, align 2
  %tmp244 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !468
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !469
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !470
  call void @camel_init(), !dbg !471
  call void @task_init(), !dbg !472
  br label %do.body, !dbg !473

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !474
  %cmp = icmp eq i16 %0, 1, !dbg !474
  br i1 %cmp, label %if.then, label %if.else, !dbg !477

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !478
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !478
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !478
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !478
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !478
  call void @__dump_registers(i16* %arraydecay), !dbg !478
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !480, metadata !DIExpression()), !dbg !482
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !482, !srcloc !483
  store i16 %2, i16* %__x, align 2, !dbg !482
  %3 = load i16, i16* %__x, align 2, !dbg !482
  store i16 %3, i16* %tmp, align 2, !dbg !482
  %4 = load i16, i16* %tmp, align 2, !dbg !482
  %add = add i16 %4, 2, !dbg !478
  %5 = inttoptr i16 %add to i8*, !dbg !478
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !484, metadata !DIExpression()), !dbg !486
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !486, !srcloc !487
  store i16 %6, i16* %__x1, align 2, !dbg !486
  %7 = load i16, i16* %__x1, align 2, !dbg !486
  store i16 %7, i16* %tmp2, align 2, !dbg !486
  %8 = load i16, i16* %tmp2, align 2, !dbg !486
  %add3 = add i16 %8, 2, !dbg !478
  %sub = sub i16 9216, %add3, !dbg !478
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !478
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !478
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !478
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !478
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !478
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 3516, i16 zeroext %11), !dbg !478
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !478
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !478
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !478
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !478
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !478
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !478
  br label %if.end, !dbg !478

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !488
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !488
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !488
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !488
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !488
  call void @__dump_registers(i16* %arraydecay6), !dbg !488
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !490, metadata !DIExpression()), !dbg !492
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !492, !srcloc !493
  store i16 %15, i16* %__x7, align 2, !dbg !492
  %16 = load i16, i16* %__x7, align 2, !dbg !492
  store i16 %16, i16* %tmp8, align 2, !dbg !492
  %17 = load i16, i16* %tmp8, align 2, !dbg !492
  %add9 = add i16 %17, 2, !dbg !488
  %18 = inttoptr i16 %add9 to i8*, !dbg !488
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !494, metadata !DIExpression()), !dbg !496
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !496, !srcloc !497
  store i16 %19, i16* %__x10, align 2, !dbg !496
  %20 = load i16, i16* %__x10, align 2, !dbg !496
  store i16 %20, i16* %tmp11, align 2, !dbg !496
  %21 = load i16, i16* %tmp11, align 2, !dbg !496
  %add12 = add i16 %21, 2, !dbg !488
  %sub13 = sub i16 9216, %add12, !dbg !488
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !488
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !488
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !488
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !488
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !488
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 3516, i16 zeroext %24), !dbg !488
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !488
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !488
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !488
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !488
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !488
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !488
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !477

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !498
  br label %while.cond, !dbg !499

while.cond:                                       ; preds = %do.end251, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !500
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !500
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !500
  %28 = load i16, i16* %out_len, align 2, !dbg !500
  %cmp17 = icmp ult i16 %28, 64, !dbg !501
  br i1 %cmp17, label %while.body, label %while.end252, !dbg !499

while.body:                                       ; preds = %while.cond
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !502
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !502
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !502
  %30 = load i16, i16* %check, align 2, !dbg !502
  %cmp19 = icmp eq i16 %30, 1, !dbg !505
  br i1 %cmp19, label %if.then20, label %if.end51, !dbg !506

if.then20:                                        ; preds = %while.body
  call void @task_measure_temp(), !dbg !507
  br label %do.body21, !dbg !509

do.body21:                                        ; preds = %if.then20
  %31 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !510
  %cmp22 = icmp eq i16 %31, 1, !dbg !510
  br i1 %cmp22, label %if.then23, label %if.else36, !dbg !513

if.then23:                                        ; preds = %do.body21
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !514
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !514
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %reg_file24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !514
  %arraydecay25 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file24, i16 0, i16 0, !dbg !514
  call void @__dump_registers(i16* %arraydecay25), !dbg !514
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !516, metadata !DIExpression()), !dbg !518
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !518, !srcloc !519
  store i16 %33, i16* %__x26, align 2, !dbg !518
  %34 = load i16, i16* %__x26, align 2, !dbg !518
  store i16 %34, i16* %tmp27, align 2, !dbg !518
  %35 = load i16, i16* %tmp27, align 2, !dbg !518
  %add28 = add i16 %35, 2, !dbg !514
  %36 = inttoptr i16 %add28 to i8*, !dbg !514
  call void @llvm.dbg.declare(metadata i16* %__x29, metadata !520, metadata !DIExpression()), !dbg !522
  %37 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !522, !srcloc !523
  store i16 %37, i16* %__x29, align 2, !dbg !522
  %38 = load i16, i16* %__x29, align 2, !dbg !522
  store i16 %38, i16* %tmp30, align 2, !dbg !522
  %39 = load i16, i16* %tmp30, align 2, !dbg !522
  %add31 = add i16 %39, 2, !dbg !514
  %sub32 = sub i16 9216, %add31, !dbg !514
  %call33 = call zeroext i16 @__fast_hw_crc(i8* %36, i16 zeroext %sub32, i16 zeroext -1), !dbg !514
  store i16 %call33, i16* @tmp_stack_crc, align 2, !dbg !514
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %41 = bitcast %struct.camel_buffer_t* %40 to i8*, !dbg !514
  %42 = load i16, i16* @tmp_stack_crc, align 2, !dbg !514
  %call34 = call zeroext i16 @__fast_hw_crc(i8* %41, i16 zeroext 3516, i16 zeroext %42), !dbg !514
  store i16 %call34, i16* @tmp_stack_buf_crc, align 2, !dbg !514
  %43 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !514
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %stack_and_buf_crc35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 2, !dbg !514
  store i16 %43, i16* %stack_and_buf_crc35, align 2, !dbg !514
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !514
  br label %if.end49, !dbg !514

if.else36:                                        ; preds = %do.body21
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !524
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !524
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %reg_file37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 0, !dbg !524
  %arraydecay38 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file37, i16 0, i16 0, !dbg !524
  call void @__dump_registers(i16* %arraydecay38), !dbg !524
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !526, metadata !DIExpression()), !dbg !528
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !528, !srcloc !529
  store i16 %46, i16* %__x39, align 2, !dbg !528
  %47 = load i16, i16* %__x39, align 2, !dbg !528
  store i16 %47, i16* %tmp40, align 2, !dbg !528
  %48 = load i16, i16* %tmp40, align 2, !dbg !528
  %add41 = add i16 %48, 2, !dbg !524
  %49 = inttoptr i16 %add41 to i8*, !dbg !524
  call void @llvm.dbg.declare(metadata i16* %__x42, metadata !530, metadata !DIExpression()), !dbg !532
  %50 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !532, !srcloc !533
  store i16 %50, i16* %__x42, align 2, !dbg !532
  %51 = load i16, i16* %__x42, align 2, !dbg !532
  store i16 %51, i16* %tmp43, align 2, !dbg !532
  %52 = load i16, i16* %tmp43, align 2, !dbg !532
  %add44 = add i16 %52, 2, !dbg !524
  %sub45 = sub i16 9216, %add44, !dbg !524
  %call46 = call zeroext i16 @__fast_hw_crc(i8* %49, i16 zeroext %sub45, i16 zeroext -1), !dbg !524
  store i16 %call46, i16* @tmp_stack_crc, align 2, !dbg !524
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %54 = bitcast %struct.camel_buffer_t* %53 to i8*, !dbg !524
  %55 = load i16, i16* @tmp_stack_crc, align 2, !dbg !524
  %call47 = call zeroext i16 @__fast_hw_crc(i8* %54, i16 zeroext 3516, i16 zeroext %55), !dbg !524
  store i16 %call47, i16* @tmp_stack_buf_crc, align 2, !dbg !524
  %56 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !524
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %stack_and_buf_crc48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 2, !dbg !524
  store i16 %56, i16* %stack_and_buf_crc48, align 2, !dbg !524
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !524
  br label %if.end49

if.end49:                                         ; preds = %if.else36, %if.then23
  br label %do.end50, !dbg !513

do.end50:                                         ; preds = %if.end49
  call void @task_commit(), !dbg !534
  br label %if.end51, !dbg !535

if.end51:                                         ; preds = %do.end50, %while.body
  br label %while.body53, !dbg !536

while.body53:                                     ; preds = %if.end51, %if.end155
  call void @task_letterize(), !dbg !537
  br label %do.body54, !dbg !539

do.body54:                                        ; preds = %while.body53
  %58 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !540
  %cmp55 = icmp eq i16 %58, 1, !dbg !540
  br i1 %cmp55, label %if.then56, label %if.else69, !dbg !543

if.then56:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !544
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !544
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %reg_file57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 0, !dbg !544
  %arraydecay58 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file57, i16 0, i16 0, !dbg !544
  call void @__dump_registers(i16* %arraydecay58), !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x59, metadata !546, metadata !DIExpression()), !dbg !548
  %60 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !548, !srcloc !549
  store i16 %60, i16* %__x59, align 2, !dbg !548
  %61 = load i16, i16* %__x59, align 2, !dbg !548
  store i16 %61, i16* %tmp60, align 2, !dbg !548
  %62 = load i16, i16* %tmp60, align 2, !dbg !548
  %add61 = add i16 %62, 2, !dbg !544
  %63 = inttoptr i16 %add61 to i8*, !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x62, metadata !550, metadata !DIExpression()), !dbg !552
  %64 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !552, !srcloc !553
  store i16 %64, i16* %__x62, align 2, !dbg !552
  %65 = load i16, i16* %__x62, align 2, !dbg !552
  store i16 %65, i16* %tmp63, align 2, !dbg !552
  %66 = load i16, i16* %tmp63, align 2, !dbg !552
  %add64 = add i16 %66, 2, !dbg !544
  %sub65 = sub i16 9216, %add64, !dbg !544
  %call66 = call zeroext i16 @__fast_hw_crc(i8* %63, i16 zeroext %sub65, i16 zeroext -1), !dbg !544
  store i16 %call66, i16* @tmp_stack_crc, align 2, !dbg !544
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %68 = bitcast %struct.camel_buffer_t* %67 to i8*, !dbg !544
  %69 = load i16, i16* @tmp_stack_crc, align 2, !dbg !544
  %call67 = call zeroext i16 @__fast_hw_crc(i8* %68, i16 zeroext 3516, i16 zeroext %69), !dbg !544
  store i16 %call67, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %70 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %71 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %stack_and_buf_crc68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %71, i32 0, i32 2, !dbg !544
  store i16 %70, i16* %stack_and_buf_crc68, align 2, !dbg !544
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !544
  br label %if.end82, !dbg !544

if.else69:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !554
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %reg_file70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i32 0, i32 0, !dbg !554
  %arraydecay71 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file70, i16 0, i16 0, !dbg !554
  call void @__dump_registers(i16* %arraydecay71), !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !556, metadata !DIExpression()), !dbg !558
  %73 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !558, !srcloc !559
  store i16 %73, i16* %__x72, align 2, !dbg !558
  %74 = load i16, i16* %__x72, align 2, !dbg !558
  store i16 %74, i16* %tmp73, align 2, !dbg !558
  %75 = load i16, i16* %tmp73, align 2, !dbg !558
  %add74 = add i16 %75, 2, !dbg !554
  %76 = inttoptr i16 %add74 to i8*, !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x75, metadata !560, metadata !DIExpression()), !dbg !562
  %77 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !562, !srcloc !563
  store i16 %77, i16* %__x75, align 2, !dbg !562
  %78 = load i16, i16* %__x75, align 2, !dbg !562
  store i16 %78, i16* %tmp76, align 2, !dbg !562
  %79 = load i16, i16* %tmp76, align 2, !dbg !562
  %add77 = add i16 %79, 2, !dbg !554
  %sub78 = sub i16 9216, %add77, !dbg !554
  %call79 = call zeroext i16 @__fast_hw_crc(i8* %76, i16 zeroext %sub78, i16 zeroext -1), !dbg !554
  store i16 %call79, i16* @tmp_stack_crc, align 2, !dbg !554
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %81 = bitcast %struct.camel_buffer_t* %80 to i8*, !dbg !554
  %82 = load i16, i16* @tmp_stack_crc, align 2, !dbg !554
  %call80 = call zeroext i16 @__fast_hw_crc(i8* %81, i16 zeroext 3516, i16 zeroext %82), !dbg !554
  store i16 %call80, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %83 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %stack_and_buf_crc81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 2, !dbg !554
  store i16 %83, i16* %stack_and_buf_crc81, align 2, !dbg !554
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !554
  br label %if.end82

if.end82:                                         ; preds = %if.else69, %if.then56
  br label %do.end83, !dbg !543

do.end83:                                         ; preds = %if.end82
  call void @task_commit(), !dbg !564
  call void @task_compress(), !dbg !565
  br label %do.body84, !dbg !566

do.body84:                                        ; preds = %do.end83
  %85 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !567
  %cmp85 = icmp eq i16 %85, 1, !dbg !567
  br i1 %cmp85, label %if.then86, label %if.else99, !dbg !570

if.then86:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !571
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !571
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %reg_file87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 0, !dbg !571
  %arraydecay88 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file87, i16 0, i16 0, !dbg !571
  call void @__dump_registers(i16* %arraydecay88), !dbg !571
  call void @llvm.dbg.declare(metadata i16* %__x89, metadata !573, metadata !DIExpression()), !dbg !575
  %87 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !575, !srcloc !576
  store i16 %87, i16* %__x89, align 2, !dbg !575
  %88 = load i16, i16* %__x89, align 2, !dbg !575
  store i16 %88, i16* %tmp90, align 2, !dbg !575
  %89 = load i16, i16* %tmp90, align 2, !dbg !575
  %add91 = add i16 %89, 2, !dbg !571
  %90 = inttoptr i16 %add91 to i8*, !dbg !571
  call void @llvm.dbg.declare(metadata i16* %__x92, metadata !577, metadata !DIExpression()), !dbg !579
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !579, !srcloc !580
  store i16 %91, i16* %__x92, align 2, !dbg !579
  %92 = load i16, i16* %__x92, align 2, !dbg !579
  store i16 %92, i16* %tmp93, align 2, !dbg !579
  %93 = load i16, i16* %tmp93, align 2, !dbg !579
  %add94 = add i16 %93, 2, !dbg !571
  %sub95 = sub i16 9216, %add94, !dbg !571
  %call96 = call zeroext i16 @__fast_hw_crc(i8* %90, i16 zeroext %sub95, i16 zeroext -1), !dbg !571
  store i16 %call96, i16* @tmp_stack_crc, align 2, !dbg !571
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %95 = bitcast %struct.camel_buffer_t* %94 to i8*, !dbg !571
  %96 = load i16, i16* @tmp_stack_crc, align 2, !dbg !571
  %call97 = call zeroext i16 @__fast_hw_crc(i8* %95, i16 zeroext 3516, i16 zeroext %96), !dbg !571
  store i16 %call97, i16* @tmp_stack_buf_crc, align 2, !dbg !571
  %97 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !571
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %stack_and_buf_crc98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %98, i32 0, i32 2, !dbg !571
  store i16 %97, i16* %stack_and_buf_crc98, align 2, !dbg !571
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !571
  br label %if.end112, !dbg !571

if.else99:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !581
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !581
  %99 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %reg_file100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %99, i32 0, i32 0, !dbg !581
  %arraydecay101 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file100, i16 0, i16 0, !dbg !581
  call void @__dump_registers(i16* %arraydecay101), !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x102, metadata !583, metadata !DIExpression()), !dbg !585
  %100 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !585, !srcloc !586
  store i16 %100, i16* %__x102, align 2, !dbg !585
  %101 = load i16, i16* %__x102, align 2, !dbg !585
  store i16 %101, i16* %tmp103, align 2, !dbg !585
  %102 = load i16, i16* %tmp103, align 2, !dbg !585
  %add104 = add i16 %102, 2, !dbg !581
  %103 = inttoptr i16 %add104 to i8*, !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x105, metadata !587, metadata !DIExpression()), !dbg !589
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !589, !srcloc !590
  store i16 %104, i16* %__x105, align 2, !dbg !589
  %105 = load i16, i16* %__x105, align 2, !dbg !589
  store i16 %105, i16* %tmp106, align 2, !dbg !589
  %106 = load i16, i16* %tmp106, align 2, !dbg !589
  %add107 = add i16 %106, 2, !dbg !581
  %sub108 = sub i16 9216, %add107, !dbg !581
  %call109 = call zeroext i16 @__fast_hw_crc(i8* %103, i16 zeroext %sub108, i16 zeroext -1), !dbg !581
  store i16 %call109, i16* @tmp_stack_crc, align 2, !dbg !581
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %108 = bitcast %struct.camel_buffer_t* %107 to i8*, !dbg !581
  %109 = load i16, i16* @tmp_stack_crc, align 2, !dbg !581
  %call110 = call zeroext i16 @__fast_hw_crc(i8* %108, i16 zeroext 3516, i16 zeroext %109), !dbg !581
  store i16 %call110, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %110 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %stack_and_buf_crc111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 2, !dbg !581
  store i16 %110, i16* %stack_and_buf_crc111, align 2, !dbg !581
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !581
  br label %if.end112

if.end112:                                        ; preds = %if.else99, %if.then86
  br label %do.end113, !dbg !570

do.end113:                                        ; preds = %if.end112
  call void @task_commit(), !dbg !591
  br label %while.body115, !dbg !592

while.body115:                                    ; preds = %do.end113, %if.end150
  call void @task_find_sibling(), !dbg !593
  br label %do.body116, !dbg !595

do.body116:                                       ; preds = %while.body115
  %112 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !596
  %cmp117 = icmp eq i16 %112, 1, !dbg !596
  br i1 %cmp117, label %if.then118, label %if.else131, !dbg !599

if.then118:                                       ; preds = %do.body116
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !600
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !600
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %reg_file119 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i32 0, i32 0, !dbg !600
  %arraydecay120 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file119, i16 0, i16 0, !dbg !600
  call void @__dump_registers(i16* %arraydecay120), !dbg !600
  call void @llvm.dbg.declare(metadata i16* %__x121, metadata !602, metadata !DIExpression()), !dbg !604
  %114 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !604, !srcloc !605
  store i16 %114, i16* %__x121, align 2, !dbg !604
  %115 = load i16, i16* %__x121, align 2, !dbg !604
  store i16 %115, i16* %tmp122, align 2, !dbg !604
  %116 = load i16, i16* %tmp122, align 2, !dbg !604
  %add123 = add i16 %116, 2, !dbg !600
  %117 = inttoptr i16 %add123 to i8*, !dbg !600
  call void @llvm.dbg.declare(metadata i16* %__x124, metadata !606, metadata !DIExpression()), !dbg !608
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !608, !srcloc !609
  store i16 %118, i16* %__x124, align 2, !dbg !608
  %119 = load i16, i16* %__x124, align 2, !dbg !608
  store i16 %119, i16* %tmp125, align 2, !dbg !608
  %120 = load i16, i16* %tmp125, align 2, !dbg !608
  %add126 = add i16 %120, 2, !dbg !600
  %sub127 = sub i16 9216, %add126, !dbg !600
  %call128 = call zeroext i16 @__fast_hw_crc(i8* %117, i16 zeroext %sub127, i16 zeroext -1), !dbg !600
  store i16 %call128, i16* @tmp_stack_crc, align 2, !dbg !600
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %122 = bitcast %struct.camel_buffer_t* %121 to i8*, !dbg !600
  %123 = load i16, i16* @tmp_stack_crc, align 2, !dbg !600
  %call129 = call zeroext i16 @__fast_hw_crc(i8* %122, i16 zeroext 3516, i16 zeroext %123), !dbg !600
  store i16 %call129, i16* @tmp_stack_buf_crc, align 2, !dbg !600
  %124 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !600
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %stack_and_buf_crc130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %125, i32 0, i32 2, !dbg !600
  store i16 %124, i16* %stack_and_buf_crc130, align 2, !dbg !600
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !600
  br label %if.end144, !dbg !600

if.else131:                                       ; preds = %do.body116
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !610
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !610
  %126 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %reg_file132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %126, i32 0, i32 0, !dbg !610
  %arraydecay133 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file132, i16 0, i16 0, !dbg !610
  call void @__dump_registers(i16* %arraydecay133), !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x134, metadata !612, metadata !DIExpression()), !dbg !614
  %127 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !614, !srcloc !615
  store i16 %127, i16* %__x134, align 2, !dbg !614
  %128 = load i16, i16* %__x134, align 2, !dbg !614
  store i16 %128, i16* %tmp135, align 2, !dbg !614
  %129 = load i16, i16* %tmp135, align 2, !dbg !614
  %add136 = add i16 %129, 2, !dbg !610
  %130 = inttoptr i16 %add136 to i8*, !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x137, metadata !616, metadata !DIExpression()), !dbg !618
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !618, !srcloc !619
  store i16 %131, i16* %__x137, align 2, !dbg !618
  %132 = load i16, i16* %__x137, align 2, !dbg !618
  store i16 %132, i16* %tmp138, align 2, !dbg !618
  %133 = load i16, i16* %tmp138, align 2, !dbg !618
  %add139 = add i16 %133, 2, !dbg !610
  %sub140 = sub i16 9216, %add139, !dbg !610
  %call141 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext %sub140, i16 zeroext -1), !dbg !610
  store i16 %call141, i16* @tmp_stack_crc, align 2, !dbg !610
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %135 = bitcast %struct.camel_buffer_t* %134 to i8*, !dbg !610
  %136 = load i16, i16* @tmp_stack_crc, align 2, !dbg !610
  %call142 = call zeroext i16 @__fast_hw_crc(i8* %135, i16 zeroext 3516, i16 zeroext %136), !dbg !610
  store i16 %call142, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %137 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %stack_and_buf_crc143 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %138, i32 0, i32 2, !dbg !610
  store i16 %137, i16* %stack_and_buf_crc143, align 2, !dbg !610
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !610
  br label %if.end144

if.end144:                                        ; preds = %if.else131, %if.then118
  br label %do.end145, !dbg !599

do.end145:                                        ; preds = %if.end144
  call void @task_commit(), !dbg !620
  %139 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !621
  %globals146 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %139, i32 0, i32 1, !dbg !621
  %check147 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals146, i32 0, i32 16, !dbg !621
  %140 = load i16, i16* %check147, align 2, !dbg !621
  %cmp148 = icmp ne i16 %140, 2, !dbg !623
  br i1 %cmp148, label %if.then149, label %if.end150, !dbg !624

if.then149:                                       ; preds = %do.end145
  br label %while.end, !dbg !625

if.end150:                                        ; preds = %do.end145
  br label %while.body115, !dbg !592, !llvm.loop !626

while.end:                                        ; preds = %if.then149
  %141 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !628
  %globals151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %141, i32 0, i32 1, !dbg !628
  %check152 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals151, i32 0, i32 16, !dbg !628
  %142 = load i16, i16* %check152, align 2, !dbg !628
  %cmp153 = icmp ne i16 %142, 1, !dbg !630
  br i1 %cmp153, label %if.then154, label %if.end155, !dbg !631

if.then154:                                       ; preds = %while.end
  br label %while.end156, !dbg !632

if.end155:                                        ; preds = %while.end
  br label %while.body53, !dbg !536, !llvm.loop !633

while.end156:                                     ; preds = %if.then154
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %globals157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %143, i32 0, i32 1, !dbg !635
  %check158 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals157, i32 0, i32 16, !dbg !635
  %144 = load i16, i16* %check158, align 2, !dbg !635
  %cmp159 = icmp eq i16 %144, 3, !dbg !637
  br i1 %cmp159, label %if.then160, label %if.end161, !dbg !638

if.then160:                                       ; preds = %while.end156
  call void @task_add_node(), !dbg !639
  br label %if.end161, !dbg !639

if.end161:                                        ; preds = %if.then160, %while.end156
  br label %do.body162, !dbg !640

do.body162:                                       ; preds = %if.end161
  %145 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !641
  %cmp163 = icmp eq i16 %145, 1, !dbg !641
  br i1 %cmp163, label %if.then164, label %if.else177, !dbg !644

if.then164:                                       ; preds = %do.body162
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !645
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !645
  %146 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %reg_file165 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %146, i32 0, i32 0, !dbg !645
  %arraydecay166 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file165, i16 0, i16 0, !dbg !645
  call void @__dump_registers(i16* %arraydecay166), !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x167, metadata !647, metadata !DIExpression()), !dbg !649
  %147 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !649, !srcloc !650
  store i16 %147, i16* %__x167, align 2, !dbg !649
  %148 = load i16, i16* %__x167, align 2, !dbg !649
  store i16 %148, i16* %tmp168, align 2, !dbg !649
  %149 = load i16, i16* %tmp168, align 2, !dbg !649
  %add169 = add i16 %149, 2, !dbg !645
  %150 = inttoptr i16 %add169 to i8*, !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x170, metadata !651, metadata !DIExpression()), !dbg !653
  %151 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !653, !srcloc !654
  store i16 %151, i16* %__x170, align 2, !dbg !653
  %152 = load i16, i16* %__x170, align 2, !dbg !653
  store i16 %152, i16* %tmp171, align 2, !dbg !653
  %153 = load i16, i16* %tmp171, align 2, !dbg !653
  %add172 = add i16 %153, 2, !dbg !645
  %sub173 = sub i16 9216, %add172, !dbg !645
  %call174 = call zeroext i16 @__fast_hw_crc(i8* %150, i16 zeroext %sub173, i16 zeroext -1), !dbg !645
  store i16 %call174, i16* @tmp_stack_crc, align 2, !dbg !645
  %154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %155 = bitcast %struct.camel_buffer_t* %154 to i8*, !dbg !645
  %156 = load i16, i16* @tmp_stack_crc, align 2, !dbg !645
  %call175 = call zeroext i16 @__fast_hw_crc(i8* %155, i16 zeroext 3516, i16 zeroext %156), !dbg !645
  store i16 %call175, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %157 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %stack_and_buf_crc176 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %158, i32 0, i32 2, !dbg !645
  store i16 %157, i16* %stack_and_buf_crc176, align 2, !dbg !645
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !645
  br label %if.end190, !dbg !645

if.else177:                                       ; preds = %do.body162
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !655
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !655
  %159 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %reg_file178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %159, i32 0, i32 0, !dbg !655
  %arraydecay179 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file178, i16 0, i16 0, !dbg !655
  call void @__dump_registers(i16* %arraydecay179), !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x180, metadata !657, metadata !DIExpression()), !dbg !659
  %160 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !659, !srcloc !660
  store i16 %160, i16* %__x180, align 2, !dbg !659
  %161 = load i16, i16* %__x180, align 2, !dbg !659
  store i16 %161, i16* %tmp181, align 2, !dbg !659
  %162 = load i16, i16* %tmp181, align 2, !dbg !659
  %add182 = add i16 %162, 2, !dbg !655
  %163 = inttoptr i16 %add182 to i8*, !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x183, metadata !661, metadata !DIExpression()), !dbg !663
  %164 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !663, !srcloc !664
  store i16 %164, i16* %__x183, align 2, !dbg !663
  %165 = load i16, i16* %__x183, align 2, !dbg !663
  store i16 %165, i16* %tmp184, align 2, !dbg !663
  %166 = load i16, i16* %tmp184, align 2, !dbg !663
  %add185 = add i16 %166, 2, !dbg !655
  %sub186 = sub i16 9216, %add185, !dbg !655
  %call187 = call zeroext i16 @__fast_hw_crc(i8* %163, i16 zeroext %sub186, i16 zeroext -1), !dbg !655
  store i16 %call187, i16* @tmp_stack_crc, align 2, !dbg !655
  %167 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %168 = bitcast %struct.camel_buffer_t* %167 to i8*, !dbg !655
  %169 = load i16, i16* @tmp_stack_crc, align 2, !dbg !655
  %call188 = call zeroext i16 @__fast_hw_crc(i8* %168, i16 zeroext 3516, i16 zeroext %169), !dbg !655
  store i16 %call188, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %170 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %stack_and_buf_crc189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %171, i32 0, i32 2, !dbg !655
  store i16 %170, i16* %stack_and_buf_crc189, align 2, !dbg !655
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !655
  br label %if.end190

if.end190:                                        ; preds = %if.else177, %if.then164
  br label %do.end191, !dbg !644

do.end191:                                        ; preds = %if.end190
  call void @task_commit(), !dbg !665
  call void @task_add_insert(), !dbg !666
  br label %do.body192, !dbg !667

do.body192:                                       ; preds = %do.end191
  %172 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !668
  %cmp193 = icmp eq i16 %172, 1, !dbg !668
  br i1 %cmp193, label %if.then194, label %if.else207, !dbg !671

if.then194:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !672
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !672
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %reg_file195 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 0, !dbg !672
  %arraydecay196 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file195, i16 0, i16 0, !dbg !672
  call void @__dump_registers(i16* %arraydecay196), !dbg !672
  call void @llvm.dbg.declare(metadata i16* %__x197, metadata !674, metadata !DIExpression()), !dbg !676
  %174 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !676, !srcloc !677
  store i16 %174, i16* %__x197, align 2, !dbg !676
  %175 = load i16, i16* %__x197, align 2, !dbg !676
  store i16 %175, i16* %tmp198, align 2, !dbg !676
  %176 = load i16, i16* %tmp198, align 2, !dbg !676
  %add199 = add i16 %176, 2, !dbg !672
  %177 = inttoptr i16 %add199 to i8*, !dbg !672
  call void @llvm.dbg.declare(metadata i16* %__x200, metadata !678, metadata !DIExpression()), !dbg !680
  %178 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !680, !srcloc !681
  store i16 %178, i16* %__x200, align 2, !dbg !680
  %179 = load i16, i16* %__x200, align 2, !dbg !680
  store i16 %179, i16* %tmp201, align 2, !dbg !680
  %180 = load i16, i16* %tmp201, align 2, !dbg !680
  %add202 = add i16 %180, 2, !dbg !672
  %sub203 = sub i16 9216, %add202, !dbg !672
  %call204 = call zeroext i16 @__fast_hw_crc(i8* %177, i16 zeroext %sub203, i16 zeroext -1), !dbg !672
  store i16 %call204, i16* @tmp_stack_crc, align 2, !dbg !672
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %182 = bitcast %struct.camel_buffer_t* %181 to i8*, !dbg !672
  %183 = load i16, i16* @tmp_stack_crc, align 2, !dbg !672
  %call205 = call zeroext i16 @__fast_hw_crc(i8* %182, i16 zeroext 3516, i16 zeroext %183), !dbg !672
  store i16 %call205, i16* @tmp_stack_buf_crc, align 2, !dbg !672
  %184 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !672
  %185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %stack_and_buf_crc206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %185, i32 0, i32 2, !dbg !672
  store i16 %184, i16* %stack_and_buf_crc206, align 2, !dbg !672
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !672
  br label %if.end220, !dbg !672

if.else207:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !682
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !682
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %reg_file208 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 0, !dbg !682
  %arraydecay209 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file208, i16 0, i16 0, !dbg !682
  call void @__dump_registers(i16* %arraydecay209), !dbg !682
  call void @llvm.dbg.declare(metadata i16* %__x210, metadata !684, metadata !DIExpression()), !dbg !686
  %187 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !686, !srcloc !687
  store i16 %187, i16* %__x210, align 2, !dbg !686
  %188 = load i16, i16* %__x210, align 2, !dbg !686
  store i16 %188, i16* %tmp211, align 2, !dbg !686
  %189 = load i16, i16* %tmp211, align 2, !dbg !686
  %add212 = add i16 %189, 2, !dbg !682
  %190 = inttoptr i16 %add212 to i8*, !dbg !682
  call void @llvm.dbg.declare(metadata i16* %__x213, metadata !688, metadata !DIExpression()), !dbg !690
  %191 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !690, !srcloc !691
  store i16 %191, i16* %__x213, align 2, !dbg !690
  %192 = load i16, i16* %__x213, align 2, !dbg !690
  store i16 %192, i16* %tmp214, align 2, !dbg !690
  %193 = load i16, i16* %tmp214, align 2, !dbg !690
  %add215 = add i16 %193, 2, !dbg !682
  %sub216 = sub i16 9216, %add215, !dbg !682
  %call217 = call zeroext i16 @__fast_hw_crc(i8* %190, i16 zeroext %sub216, i16 zeroext -1), !dbg !682
  store i16 %call217, i16* @tmp_stack_crc, align 2, !dbg !682
  %194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %195 = bitcast %struct.camel_buffer_t* %194 to i8*, !dbg !682
  %196 = load i16, i16* @tmp_stack_crc, align 2, !dbg !682
  %call218 = call zeroext i16 @__fast_hw_crc(i8* %195, i16 zeroext 3516, i16 zeroext %196), !dbg !682
  store i16 %call218, i16* @tmp_stack_buf_crc, align 2, !dbg !682
  %197 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !682
  %198 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %stack_and_buf_crc219 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %198, i32 0, i32 2, !dbg !682
  store i16 %197, i16* %stack_and_buf_crc219, align 2, !dbg !682
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !682
  br label %if.end220

if.end220:                                        ; preds = %if.else207, %if.then194
  br label %do.end221, !dbg !671

do.end221:                                        ; preds = %if.end220
  call void @task_commit(), !dbg !692
  call void @task_append_compressed(), !dbg !693
  br label %do.body222, !dbg !694

do.body222:                                       ; preds = %do.end221
  %199 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !695
  %cmp223 = icmp eq i16 %199, 1, !dbg !695
  br i1 %cmp223, label %if.then224, label %if.else237, !dbg !698

if.then224:                                       ; preds = %do.body222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !699
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !699
  %200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !699
  %reg_file225 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %200, i32 0, i32 0, !dbg !699
  %arraydecay226 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file225, i16 0, i16 0, !dbg !699
  call void @__dump_registers(i16* %arraydecay226), !dbg !699
  call void @llvm.dbg.declare(metadata i16* %__x227, metadata !701, metadata !DIExpression()), !dbg !703
  %201 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !703, !srcloc !704
  store i16 %201, i16* %__x227, align 2, !dbg !703
  %202 = load i16, i16* %__x227, align 2, !dbg !703
  store i16 %202, i16* %tmp228, align 2, !dbg !703
  %203 = load i16, i16* %tmp228, align 2, !dbg !703
  %add229 = add i16 %203, 2, !dbg !699
  %204 = inttoptr i16 %add229 to i8*, !dbg !699
  call void @llvm.dbg.declare(metadata i16* %__x230, metadata !705, metadata !DIExpression()), !dbg !707
  %205 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !707, !srcloc !708
  store i16 %205, i16* %__x230, align 2, !dbg !707
  %206 = load i16, i16* %__x230, align 2, !dbg !707
  store i16 %206, i16* %tmp231, align 2, !dbg !707
  %207 = load i16, i16* %tmp231, align 2, !dbg !707
  %add232 = add i16 %207, 2, !dbg !699
  %sub233 = sub i16 9216, %add232, !dbg !699
  %call234 = call zeroext i16 @__fast_hw_crc(i8* %204, i16 zeroext %sub233, i16 zeroext -1), !dbg !699
  store i16 %call234, i16* @tmp_stack_crc, align 2, !dbg !699
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !699
  %209 = bitcast %struct.camel_buffer_t* %208 to i8*, !dbg !699
  %210 = load i16, i16* @tmp_stack_crc, align 2, !dbg !699
  %call235 = call zeroext i16 @__fast_hw_crc(i8* %209, i16 zeroext 3516, i16 zeroext %210), !dbg !699
  store i16 %call235, i16* @tmp_stack_buf_crc, align 2, !dbg !699
  %211 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !699
  %212 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !699
  %stack_and_buf_crc236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %212, i32 0, i32 2, !dbg !699
  store i16 %211, i16* %stack_and_buf_crc236, align 2, !dbg !699
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !699
  br label %if.end250, !dbg !699

if.else237:                                       ; preds = %do.body222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !709
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !709
  %213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !709
  %reg_file238 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %213, i32 0, i32 0, !dbg !709
  %arraydecay239 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file238, i16 0, i16 0, !dbg !709
  call void @__dump_registers(i16* %arraydecay239), !dbg !709
  call void @llvm.dbg.declare(metadata i16* %__x240, metadata !711, metadata !DIExpression()), !dbg !713
  %214 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !713, !srcloc !714
  store i16 %214, i16* %__x240, align 2, !dbg !713
  %215 = load i16, i16* %__x240, align 2, !dbg !713
  store i16 %215, i16* %tmp241, align 2, !dbg !713
  %216 = load i16, i16* %tmp241, align 2, !dbg !713
  %add242 = add i16 %216, 2, !dbg !709
  %217 = inttoptr i16 %add242 to i8*, !dbg !709
  call void @llvm.dbg.declare(metadata i16* %__x243, metadata !715, metadata !DIExpression()), !dbg !717
  %218 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !717, !srcloc !718
  store i16 %218, i16* %__x243, align 2, !dbg !717
  %219 = load i16, i16* %__x243, align 2, !dbg !717
  store i16 %219, i16* %tmp244, align 2, !dbg !717
  %220 = load i16, i16* %tmp244, align 2, !dbg !717
  %add245 = add i16 %220, 2, !dbg !709
  %sub246 = sub i16 9216, %add245, !dbg !709
  %call247 = call zeroext i16 @__fast_hw_crc(i8* %217, i16 zeroext %sub246, i16 zeroext -1), !dbg !709
  store i16 %call247, i16* @tmp_stack_crc, align 2, !dbg !709
  %221 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !709
  %222 = bitcast %struct.camel_buffer_t* %221 to i8*, !dbg !709
  %223 = load i16, i16* @tmp_stack_crc, align 2, !dbg !709
  %call248 = call zeroext i16 @__fast_hw_crc(i8* %222, i16 zeroext 3516, i16 zeroext %223), !dbg !709
  store i16 %call248, i16* @tmp_stack_buf_crc, align 2, !dbg !709
  %224 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !709
  %225 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !709
  %stack_and_buf_crc249 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %225, i32 0, i32 2, !dbg !709
  store i16 %224, i16* %stack_and_buf_crc249, align 2, !dbg !709
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !709
  br label %if.end250

if.end250:                                        ; preds = %if.else237, %if.then224
  br label %do.end251, !dbg !698

do.end251:                                        ; preds = %if.end250
  call void @task_commit(), !dbg !719
  br label %while.cond, !dbg !499, !llvm.loop !720

while.end252:                                     ; preds = %while.cond
  call void @task_done(), !dbg !722
  %226 = load i16, i16* %retval, align 2, !dbg !723
  ret i16 %226, !dbg !723
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
!llvm.module.flags = !{!76, !77, !78}
!llvm.ident = !{!79}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 143, type: !71, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, nameTableKind: None)
!3 = !DIFile(filename: "../example/camel_cem.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !6)
!8 = !{!9, !16, !0, !18, !66, !68}
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
!19 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 150, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 16)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 136, baseType: !22)
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 131, size: 28144, elements: !23)
!23 = !{!24, !29, !65}
!24 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !22, file: !3, line: 133, baseType: !25, size: 176)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 176, elements: !27)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 45, baseType: !11)
!27 = !{!28}
!28 = !DISubrange(count: 11)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !22, file: !3, line: 134, baseType: !30, size: 27952, offset: 176)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 128, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 108, size: 27952, elements: !32)
!32 = !{!33, !35, !36, !38, !39, !40, !50, !51, !52, !53, !54, !55, !56, !57, !61, !62, !63}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !31, file: !3, line: 110, baseType: !34, size: 16)
!34 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_t", file: !3, line: 21, baseType: !6)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "letter_idx", scope: !31, file: !3, line: 111, baseType: !6, size: 16, offset: 16)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "prev_sample", scope: !31, file: !3, line: 112, baseType: !37, size: 16, offset: 32)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "sample_t", file: !3, line: 22, baseType: !6)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "out_len", scope: !31, file: !3, line: 113, baseType: !7, size: 16, offset: 48)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "node_count", scope: !31, file: !3, line: 114, baseType: !7, size: 16, offset: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "dict", scope: !31, file: !3, line: 115, baseType: !41, size: 24576, offset: 80)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 24576, elements: !48)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !3, line: 28, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_node_t", file: !3, line: 24, size: 48, elements: !44)
!44 = !{!45, !46, !47}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !43, file: !3, line: 25, baseType: !34, size: 16)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !43, file: !3, line: 26, baseType: !7, size: 16, offset: 16)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !43, file: !3, line: 27, baseType: !7, size: 16, offset: 32)
!48 = !{!49}
!49 = !DISubrange(count: 512)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !31, file: !3, line: 116, baseType: !37, size: 16, offset: 24656)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sample_count", scope: !31, file: !3, line: 117, baseType: !7, size: 16, offset: 24672)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !31, file: !3, line: 118, baseType: !7, size: 16, offset: 24688)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !31, file: !3, line: 119, baseType: !7, size: 16, offset: 24704)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !31, file: !3, line: 120, baseType: !7, size: 16, offset: 24720)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "parent_next", scope: !31, file: !3, line: 121, baseType: !7, size: 16, offset: 24736)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "parent_node", scope: !31, file: !3, line: 122, baseType: !42, size: 48, offset: 24752)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "compressed_data", scope: !31, file: !3, line: 123, baseType: !58, size: 3072, offset: 24800)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !42, size: 3072, elements: !59)
!59 = !{!60}
!60 = !DISubrange(count: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_node", scope: !31, file: !3, line: 124, baseType: !42, size: 48, offset: 27872)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "symbol", scope: !31, file: !3, line: 125, baseType: !7, size: 16, offset: 27920)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !31, file: !3, line: 127, baseType: !64, size: 16, offset: 27936)
!64 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !22, file: !3, line: 135, baseType: !11, size: 16, offset: 28128)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 150, type: !20, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 179, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 176, elements: !27)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 138, size: 56304, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 140, baseType: !11, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 141, baseType: !21, size: 28144, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 142, baseType: !21, size: 28144, offset: 28160)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 152, type: !81, scopeLine: 152, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DISubroutineType(types: !82)
!82 = !{null}
!83 = !DILocation(line: 153, column: 10, scope: !80)
!84 = !DILocation(line: 155, column: 9, scope: !80)
!85 = !DILocation(line: 157, column: 9, scope: !80)
!86 = !DILocation(line: 162, column: 11, scope: !80)
!87 = !DILocation(line: 167, column: 12, scope: !80)
!88 = !DILocation(line: 168, column: 10, scope: !80)
!89 = !DILocation(line: 169, column: 10, scope: !80)
!90 = !DILocation(line: 171, column: 10, scope: !80)
!91 = !DILocation(line: 172, column: 12, scope: !80)
!92 = !DILocation(line: 175, column: 10, scope: !80)
!93 = !DILocation(line: 177, column: 1, scope: !80)
!94 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 181, type: !81, scopeLine: 181, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocation(line: 182, column: 14, scope: !96)
!96 = distinct !DILexicalBlock(scope: !94, file: !3, line: 182, column: 8)
!97 = !DILocation(line: 182, column: 19, scope: !96)
!98 = !DILocation(line: 182, column: 8, scope: !94)
!99 = !DILocation(line: 183, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 182, column: 34)
!101 = !DILocation(line: 184, column: 16, scope: !100)
!102 = !DILocation(line: 185, column: 5, scope: !100)
!103 = !DILocation(line: 185, column: 21, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !3, line: 185, column: 15)
!105 = !DILocation(line: 185, column: 26, scope: !104)
!106 = !DILocation(line: 185, column: 15, scope: !96)
!107 = !DILocation(line: 186, column: 14, scope: !108)
!108 = distinct !DILexicalBlock(scope: !104, file: !3, line: 185, column: 41)
!109 = !DILocation(line: 187, column: 16, scope: !108)
!110 = !DILocation(line: 188, column: 5, scope: !108)
!111 = !DILocation(line: 189, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !104, file: !3, line: 188, column: 12)
!113 = !DILocation(line: 206, column: 3, scope: !114)
!114 = distinct !DILexicalBlock(scope: !94, file: !3, line: 206, column: 3)
!115 = !{i32 -2146619325}
!116 = !DILocalVariable(name: "__x", scope: !117, file: !3, line: 208, type: !6)
!117 = distinct !DILexicalBlock(scope: !94, file: !3, line: 208, column: 33)
!118 = !DILocation(line: 208, column: 33, scope: !117)
!119 = !{i32 -2146619089}
!120 = !DILocation(line: 208, column: 51, scope: !94)
!121 = !DILocation(line: 208, column: 33, scope: !94)
!122 = !DILocalVariable(name: "__x", scope: !123, file: !3, line: 208, type: !6)
!123 = distinct !DILexicalBlock(scope: !94, file: !3, line: 208, column: 65)
!124 = !DILocation(line: 208, column: 65, scope: !123)
!125 = !{i32 -2146618964}
!126 = !DILocation(line: 208, column: 83, scope: !94)
!127 = !DILocation(line: 208, column: 63, scope: !94)
!128 = !DILocation(line: 208, column: 19, scope: !94)
!129 = !DILocation(line: 208, column: 17, scope: !94)
!130 = !DILocation(line: 209, column: 37, scope: !94)
!131 = !DILocation(line: 209, column: 71, scope: !94)
!132 = !DILocation(line: 209, column: 23, scope: !94)
!133 = !DILocation(line: 209, column: 21, scope: !94)
!134 = !DILocation(line: 212, column: 6, scope: !135)
!135 = distinct !DILexicalBlock(scope: !94, file: !3, line: 212, column: 6)
!136 = !DILocation(line: 212, column: 27, scope: !135)
!137 = !DILocation(line: 212, column: 33, scope: !135)
!138 = !DILocation(line: 212, column: 24, scope: !135)
!139 = !DILocation(line: 212, column: 6, scope: !94)
!140 = !DILocation(line: 213, column: 11, scope: !141)
!141 = distinct !DILexicalBlock(scope: !135, file: !3, line: 212, column: 51)
!142 = !DILocation(line: 213, column: 4, scope: !141)
!143 = !DILocation(line: 213, column: 19, scope: !141)
!144 = !DILocation(line: 214, column: 4, scope: !141)
!145 = !DILocation(line: 215, column: 24, scope: !141)
!146 = !DILocation(line: 215, column: 30, scope: !141)
!147 = !DILocation(line: 215, column: 4, scope: !141)
!148 = !DILocation(line: 216, column: 3, scope: !141)
!149 = !DILocation(line: 217, column: 4, scope: !150)
!150 = distinct !DILexicalBlock(scope: !135, file: !3, line: 216, column: 9)
!151 = !DILocation(line: 220, column: 1, scope: !94)
!152 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 230, type: !81, scopeLine: 231, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!153 = !DILocation(line: 232, column: 2, scope: !152)
!154 = !DILocation(line: 232, column: 18, scope: !152)
!155 = !DILocation(line: 233, column: 2, scope: !152)
!156 = !DILocation(line: 233, column: 14, scope: !152)
!157 = !DILocation(line: 234, column: 2, scope: !152)
!158 = !DILocation(line: 234, column: 13, scope: !152)
!159 = !DILocation(line: 235, column: 2, scope: !152)
!160 = !DILocation(line: 235, column: 18, scope: !152)
!161 = !DILocation(line: 236, column: 2, scope: !152)
!162 = !DILocation(line: 236, column: 17, scope: !152)
!163 = !DILocation(line: 237, column: 2, scope: !152)
!164 = !DILocation(line: 237, column: 19, scope: !152)
!165 = !DILocation(line: 238, column: 2, scope: !152)
!166 = !DILocation(line: 238, column: 12, scope: !152)
!167 = !DILocation(line: 240, column: 2, scope: !152)
!168 = !DILocation(line: 240, column: 9, scope: !152)
!169 = !DILocation(line: 240, column: 20, scope: !152)
!170 = !DILocalVariable(name: "node", scope: !171, file: !3, line: 242, type: !42)
!171 = distinct !DILexicalBlock(scope: !152, file: !3, line: 240, column: 34)
!172 = !DILocation(line: 242, column: 10, scope: !171)
!173 = !DILocation(line: 242, column: 17, scope: !171)
!174 = !DILocation(line: 243, column: 14, scope: !171)
!175 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 248, type: !64)
!176 = !DILocation(line: 248, column: 7, scope: !171)
!177 = !DILocation(line: 248, column: 11, scope: !171)
!178 = !DILocation(line: 249, column: 3, scope: !171)
!179 = !DILocation(line: 249, column: 12, scope: !171)
!180 = !DILocation(line: 249, column: 17, scope: !171)
!181 = !DILocation(line: 250, column: 3, scope: !171)
!182 = !DILocation(line: 250, column: 13, scope: !171)
!183 = distinct !{!183, !167, !184}
!184 = !DILocation(line: 251, column: 2, scope: !152)
!185 = !DILocation(line: 253, column: 2, scope: !152)
!186 = !DILocation(line: 253, column: 17, scope: !152)
!187 = !DILocation(line: 254, column: 1, scope: !152)
!188 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 256, type: !81, scopeLine: 257, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocalVariable(name: "next_letter_idx", scope: !188, file: !3, line: 259, type: !6)
!190 = !DILocation(line: 259, column: 11, scope: !188)
!191 = !DILocation(line: 259, column: 29, scope: !188)
!192 = !DILocation(line: 259, column: 44, scope: !188)
!193 = !DILocation(line: 260, column: 6, scope: !194)
!194 = distinct !DILexicalBlock(scope: !188, file: !3, line: 260, column: 6)
!195 = !DILocation(line: 260, column: 22, scope: !194)
!196 = !DILocation(line: 260, column: 6, scope: !188)
!197 = !DILocation(line: 261, column: 19, scope: !194)
!198 = !DILocation(line: 261, column: 3, scope: !194)
!199 = !DILocation(line: 263, column: 6, scope: !200)
!200 = distinct !DILexicalBlock(scope: !188, file: !3, line: 263, column: 6)
!201 = !DILocation(line: 263, column: 21, scope: !200)
!202 = !DILocation(line: 263, column: 6, scope: !188)
!203 = !DILocation(line: 264, column: 20, scope: !204)
!204 = distinct !DILexicalBlock(scope: !200, file: !3, line: 263, column: 27)
!205 = !DILocation(line: 264, column: 3, scope: !204)
!206 = !DILocation(line: 264, column: 18, scope: !204)
!207 = !DILocation(line: 265, column: 3, scope: !204)
!208 = !DILocation(line: 265, column: 13, scope: !204)
!209 = !DILocation(line: 266, column: 2, scope: !204)
!210 = !DILocation(line: 267, column: 20, scope: !211)
!211 = distinct !DILexicalBlock(scope: !200, file: !3, line: 266, column: 9)
!212 = !DILocation(line: 267, column: 3, scope: !211)
!213 = !DILocation(line: 267, column: 18, scope: !211)
!214 = !DILocation(line: 268, column: 3, scope: !211)
!215 = !DILocation(line: 268, column: 13, scope: !211)
!216 = !DILocation(line: 270, column: 1, scope: !188)
!217 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 272, type: !81, scopeLine: 273, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!218 = !DILocalVariable(name: "prev_sample", scope: !217, file: !3, line: 274, type: !37)
!219 = !DILocation(line: 274, column: 11, scope: !217)
!220 = !DILocation(line: 275, column: 16, scope: !217)
!221 = !DILocation(line: 275, column: 14, scope: !217)
!222 = !DILocalVariable(name: "sample", scope: !217, file: !3, line: 277, type: !37)
!223 = !DILocation(line: 277, column: 11, scope: !217)
!224 = !DILocation(line: 277, column: 35, scope: !217)
!225 = !DILocation(line: 277, column: 20, scope: !217)
!226 = !DILocation(line: 278, column: 16, scope: !217)
!227 = !DILocation(line: 278, column: 14, scope: !217)
!228 = !DILocation(line: 279, column: 20, scope: !217)
!229 = !DILocation(line: 279, column: 2, scope: !217)
!230 = !DILocation(line: 279, column: 18, scope: !217)
!231 = !DILocation(line: 280, column: 15, scope: !217)
!232 = !DILocation(line: 280, column: 2, scope: !217)
!233 = !DILocation(line: 280, column: 13, scope: !217)
!234 = !DILocation(line: 281, column: 1, scope: !217)
!235 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 224, type: !236, scopeLine: 225, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!236 = !DISubroutineType(types: !237)
!237 = !{!37, !34}
!238 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !235, file: !3, line: 224, type: !34)
!239 = !DILocation(line: 224, column: 41, scope: !235)
!240 = !DILocalVariable(name: "sample", scope: !235, file: !3, line: 226, type: !34)
!241 = !DILocation(line: 226, column: 11, scope: !235)
!242 = !DILocation(line: 226, column: 21, scope: !235)
!243 = !DILocation(line: 226, column: 33, scope: !235)
!244 = !DILocation(line: 226, column: 38, scope: !235)
!245 = !DILocation(line: 227, column: 9, scope: !235)
!246 = !DILocation(line: 227, column: 2, scope: !235)
!247 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 283, type: !81, scopeLine: 284, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DILocalVariable(name: "letter_idx", scope: !247, file: !3, line: 285, type: !6)
!249 = !DILocation(line: 285, column: 11, scope: !247)
!250 = !DILocation(line: 285, column: 24, scope: !247)
!251 = !DILocation(line: 286, column: 6, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !3, line: 286, column: 6)
!253 = !DILocation(line: 286, column: 17, scope: !252)
!254 = !DILocation(line: 286, column: 6, scope: !247)
!255 = !DILocation(line: 287, column: 14, scope: !252)
!256 = !DILocation(line: 287, column: 3, scope: !252)
!257 = !DILocation(line: 289, column: 13, scope: !252)
!258 = !DILocalVariable(name: "letter_shift", scope: !247, file: !3, line: 290, type: !6)
!259 = !DILocation(line: 290, column: 11, scope: !247)
!260 = !DILocation(line: 290, column: 45, scope: !247)
!261 = !DILocation(line: 290, column: 43, scope: !247)
!262 = !DILocalVariable(name: "letter", scope: !247, file: !3, line: 291, type: !34)
!263 = !DILocation(line: 291, column: 11, scope: !247)
!264 = !DILocation(line: 291, column: 21, scope: !247)
!265 = !DILocation(line: 291, column: 50, scope: !247)
!266 = !DILocation(line: 291, column: 47, scope: !247)
!267 = !DILocation(line: 291, column: 32, scope: !247)
!268 = !DILocation(line: 291, column: 68, scope: !247)
!269 = !DILocation(line: 291, column: 65, scope: !247)
!270 = !DILocation(line: 293, column: 15, scope: !247)
!271 = !DILocation(line: 293, column: 2, scope: !247)
!272 = !DILocation(line: 293, column: 13, scope: !247)
!273 = !DILocation(line: 294, column: 1, scope: !247)
!274 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 296, type: !81, scopeLine: 297, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!275 = !DILocalVariable(name: "parent_node", scope: !274, file: !3, line: 298, type: !42)
!276 = !DILocation(line: 298, column: 9, scope: !274)
!277 = !DILocalVariable(name: "parent", scope: !274, file: !3, line: 299, type: !7)
!278 = !DILocation(line: 299, column: 10, scope: !274)
!279 = !DILocation(line: 299, column: 19, scope: !274)
!280 = !DILocation(line: 300, column: 16, scope: !274)
!281 = !DILocation(line: 300, column: 25, scope: !274)
!282 = !DILocation(line: 302, column: 28, scope: !274)
!283 = !DILocation(line: 302, column: 2, scope: !274)
!284 = !DILocation(line: 302, column: 14, scope: !274)
!285 = !DILocation(line: 303, column: 2, scope: !274)
!286 = !DILocation(line: 303, column: 20, scope: !274)
!287 = !DILocation(line: 304, column: 15, scope: !274)
!288 = !DILocation(line: 304, column: 2, scope: !274)
!289 = !DILocation(line: 304, column: 13, scope: !274)
!290 = !DILocation(line: 305, column: 26, scope: !274)
!291 = !DILocation(line: 305, column: 2, scope: !274)
!292 = !DILocation(line: 305, column: 12, scope: !274)
!293 = !DILocation(line: 306, column: 2, scope: !274)
!294 = !DILocation(line: 306, column: 18, scope: !274)
!295 = !DILocation(line: 308, column: 1, scope: !274)
!296 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 310, type: !81, scopeLine: 311, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!297 = !DILocalVariable(name: "sibling_node", scope: !296, file: !3, line: 312, type: !298)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 16)
!299 = !DILocation(line: 312, column: 10, scope: !296)
!300 = !DILocation(line: 314, column: 6, scope: !301)
!301 = distinct !DILexicalBlock(scope: !296, file: !3, line: 314, column: 6)
!302 = !DILocation(line: 314, column: 18, scope: !301)
!303 = !DILocation(line: 314, column: 6, scope: !296)
!304 = !DILocalVariable(name: "i", scope: !305, file: !3, line: 315, type: !64)
!305 = distinct !DILexicalBlock(scope: !301, file: !3, line: 314, column: 26)
!306 = !DILocation(line: 315, column: 7, scope: !305)
!307 = !DILocation(line: 315, column: 11, scope: !305)
!308 = !DILocation(line: 316, column: 19, scope: !305)
!309 = !DILocation(line: 316, column: 28, scope: !305)
!310 = !DILocation(line: 316, column: 16, scope: !305)
!311 = !DILocation(line: 318, column: 7, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !3, line: 318, column: 7)
!313 = !DILocation(line: 318, column: 21, scope: !312)
!314 = !DILocation(line: 318, column: 31, scope: !312)
!315 = !DILocation(line: 318, column: 28, scope: !312)
!316 = !DILocation(line: 318, column: 7, scope: !305)
!317 = !DILocation(line: 320, column: 22, scope: !318)
!318 = distinct !DILexicalBlock(scope: !312, file: !3, line: 318, column: 43)
!319 = !DILocation(line: 320, column: 4, scope: !318)
!320 = !DILocation(line: 320, column: 20, scope: !318)
!321 = !DILocation(line: 322, column: 4, scope: !318)
!322 = !DILocation(line: 322, column: 14, scope: !318)
!323 = !DILocation(line: 324, column: 3, scope: !318)
!324 = !DILocation(line: 325, column: 7, scope: !325)
!325 = distinct !DILexicalBlock(scope: !326, file: !3, line: 325, column: 7)
!326 = distinct !DILexicalBlock(scope: !312, file: !3, line: 324, column: 10)
!327 = !DILocation(line: 325, column: 21, scope: !325)
!328 = !DILocation(line: 325, column: 29, scope: !325)
!329 = !DILocation(line: 325, column: 7, scope: !326)
!330 = !DILocation(line: 326, column: 19, scope: !331)
!331 = distinct !DILexicalBlock(scope: !325, file: !3, line: 325, column: 34)
!332 = !DILocation(line: 326, column: 33, scope: !331)
!333 = !DILocation(line: 326, column: 5, scope: !331)
!334 = !DILocation(line: 326, column: 17, scope: !331)
!335 = !DILocation(line: 327, column: 5, scope: !331)
!336 = !DILocation(line: 327, column: 15, scope: !331)
!337 = !DILocation(line: 328, column: 4, scope: !331)
!338 = !DILocation(line: 331, column: 2, scope: !305)
!339 = !DILocalVariable(name: "starting_node_idx", scope: !296, file: !3, line: 333, type: !7)
!340 = !DILocation(line: 333, column: 10, scope: !296)
!341 = !DILocation(line: 333, column: 39, scope: !296)
!342 = !DILocation(line: 334, column: 20, scope: !296)
!343 = !DILocation(line: 334, column: 2, scope: !296)
!344 = !DILocation(line: 334, column: 18, scope: !296)
!345 = !DILocation(line: 336, column: 6, scope: !346)
!346 = distinct !DILexicalBlock(scope: !296, file: !3, line: 336, column: 6)
!347 = !DILocation(line: 336, column: 16, scope: !346)
!348 = !DILocation(line: 336, column: 6, scope: !296)
!349 = !DILocation(line: 337, column: 3, scope: !350)
!350 = distinct !DILexicalBlock(scope: !346, file: !3, line: 336, column: 24)
!351 = !DILocation(line: 337, column: 13, scope: !350)
!352 = !DILocation(line: 338, column: 2, scope: !350)
!353 = !DILocation(line: 339, column: 3, scope: !354)
!354 = distinct !DILexicalBlock(scope: !346, file: !3, line: 338, column: 9)
!355 = !DILocation(line: 339, column: 13, scope: !354)
!356 = !DILocation(line: 341, column: 1, scope: !296)
!357 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 343, type: !81, scopeLine: 344, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocalVariable(name: "sibling_node", scope: !357, file: !3, line: 345, type: !298)
!359 = !DILocation(line: 345, column: 10, scope: !357)
!360 = !DILocalVariable(name: "i", scope: !357, file: !3, line: 347, type: !64)
!361 = !DILocation(line: 347, column: 6, scope: !357)
!362 = !DILocation(line: 347, column: 10, scope: !357)
!363 = !DILocation(line: 348, column: 18, scope: !357)
!364 = !DILocation(line: 348, column: 27, scope: !357)
!365 = !DILocation(line: 348, column: 15, scope: !357)
!366 = !DILocation(line: 350, column: 6, scope: !367)
!367 = distinct !DILexicalBlock(scope: !357, file: !3, line: 350, column: 6)
!368 = !DILocation(line: 350, column: 20, scope: !367)
!369 = !DILocation(line: 350, column: 28, scope: !367)
!370 = !DILocation(line: 350, column: 6, scope: !357)
!371 = !DILocalVariable(name: "next_sibling", scope: !372, file: !3, line: 351, type: !7)
!372 = distinct !DILexicalBlock(scope: !367, file: !3, line: 350, column: 36)
!373 = !DILocation(line: 351, column: 11, scope: !372)
!374 = !DILocation(line: 351, column: 26, scope: !372)
!375 = !DILocation(line: 351, column: 40, scope: !372)
!376 = !DILocation(line: 352, column: 17, scope: !372)
!377 = !DILocation(line: 352, column: 3, scope: !372)
!378 = !DILocation(line: 352, column: 15, scope: !372)
!379 = !DILocation(line: 354, column: 2, scope: !372)
!380 = !DILocalVariable(name: "sibling_node_obj", scope: !381, file: !3, line: 357, type: !42)
!381 = distinct !DILexicalBlock(scope: !367, file: !3, line: 354, column: 9)
!382 = !DILocation(line: 357, column: 10, scope: !381)
!383 = !DILocation(line: 357, column: 30, scope: !381)
!384 = !DILocation(line: 357, column: 29, scope: !381)
!385 = !DILocation(line: 358, column: 3, scope: !381)
!386 = !DILocation(line: 358, column: 22, scope: !381)
!387 = !DILocation(line: 361, column: 1, scope: !357)
!388 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 363, type: !81, scopeLine: 364, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 366, column: 6, scope: !390)
!390 = distinct !DILexicalBlock(scope: !388, file: !3, line: 366, column: 6)
!391 = !DILocation(line: 366, column: 21, scope: !390)
!392 = !DILocation(line: 366, column: 6, scope: !388)
!393 = !DILocation(line: 367, column: 3, scope: !394)
!394 = distinct !DILexicalBlock(scope: !390, file: !3, line: 366, column: 35)
!395 = distinct !{!395, !393, !396}
!396 = !DILocation(line: 367, column: 12, scope: !394)
!397 = !DILocalVariable(name: "child", scope: !388, file: !3, line: 371, type: !7)
!398 = !DILocation(line: 371, column: 10, scope: !388)
!399 = !DILocation(line: 371, column: 18, scope: !388)
!400 = !DILocalVariable(name: "child_node", scope: !388, file: !3, line: 372, type: !42)
!401 = !DILocation(line: 372, column: 9, scope: !388)
!402 = !DILocation(line: 372, column: 22, scope: !388)
!403 = !DILocation(line: 373, column: 13, scope: !388)
!404 = !DILocation(line: 378, column: 6, scope: !405)
!405 = distinct !DILexicalBlock(scope: !388, file: !3, line: 378, column: 6)
!406 = !DILocation(line: 378, column: 22, scope: !405)
!407 = !DILocation(line: 378, column: 28, scope: !405)
!408 = !DILocation(line: 378, column: 6, scope: !388)
!409 = !DILocalVariable(name: "parent_node_obj", scope: !410, file: !3, line: 380, type: !42)
!410 = distinct !DILexicalBlock(scope: !405, file: !3, line: 378, column: 36)
!411 = !DILocation(line: 380, column: 10, scope: !410)
!412 = !DILocation(line: 380, column: 28, scope: !410)
!413 = !DILocation(line: 381, column: 27, scope: !410)
!414 = !DILocation(line: 381, column: 19, scope: !410)
!415 = !DILocation(line: 381, column: 25, scope: !410)
!416 = !DILocalVariable(name: "i", scope: !410, file: !3, line: 382, type: !64)
!417 = !DILocation(line: 382, column: 7, scope: !410)
!418 = !DILocation(line: 382, column: 11, scope: !410)
!419 = !DILocation(line: 383, column: 3, scope: !410)
!420 = !DILocation(line: 383, column: 12, scope: !410)
!421 = !DILocation(line: 383, column: 17, scope: !410)
!422 = !DILocation(line: 385, column: 2, scope: !410)
!423 = !DILocalVariable(name: "last_sibling", scope: !424, file: !3, line: 387, type: !7)
!424 = distinct !DILexicalBlock(scope: !405, file: !3, line: 385, column: 9)
!425 = !DILocation(line: 387, column: 11, scope: !424)
!426 = !DILocation(line: 387, column: 26, scope: !424)
!427 = !DILocalVariable(name: "last_sibling_node", scope: !424, file: !3, line: 388, type: !42)
!428 = !DILocation(line: 388, column: 10, scope: !424)
!429 = !DILocation(line: 388, column: 30, scope: !424)
!430 = !DILocation(line: 390, column: 31, scope: !424)
!431 = !DILocation(line: 390, column: 21, scope: !424)
!432 = !DILocation(line: 390, column: 29, scope: !424)
!433 = !DILocation(line: 391, column: 3, scope: !424)
!434 = !DILocation(line: 391, column: 12, scope: !424)
!435 = !DILocation(line: 391, column: 28, scope: !424)
!436 = !DILocation(line: 393, column: 2, scope: !388)
!437 = !DILocation(line: 393, column: 11, scope: !388)
!438 = !DILocation(line: 393, column: 20, scope: !388)
!439 = !DILocation(line: 394, column: 15, scope: !388)
!440 = !DILocation(line: 394, column: 2, scope: !388)
!441 = !DILocation(line: 394, column: 13, scope: !388)
!442 = !DILocation(line: 395, column: 2, scope: !388)
!443 = !DILocation(line: 395, column: 16, scope: !388)
!444 = !DILocation(line: 397, column: 1, scope: !388)
!445 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 399, type: !81, scopeLine: 400, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!446 = !DILocalVariable(name: "i", scope: !445, file: !3, line: 401, type: !64)
!447 = !DILocation(line: 401, column: 6, scope: !445)
!448 = !DILocation(line: 401, column: 10, scope: !445)
!449 = !DILocation(line: 402, column: 34, scope: !445)
!450 = !DILocation(line: 402, column: 2, scope: !445)
!451 = !DILocation(line: 402, column: 25, scope: !445)
!452 = !DILocation(line: 402, column: 32, scope: !445)
!453 = !DILocation(line: 404, column: 8, scope: !454)
!454 = distinct !DILexicalBlock(scope: !445, file: !3, line: 404, column: 6)
!455 = !DILocation(line: 404, column: 6, scope: !454)
!456 = !DILocation(line: 404, column: 20, scope: !454)
!457 = !DILocation(line: 404, column: 6, scope: !445)
!458 = !DILocation(line: 406, column: 2, scope: !459)
!459 = distinct !DILexicalBlock(scope: !454, file: !3, line: 404, column: 35)
!460 = !DILocation(line: 409, column: 1, scope: !445)
!461 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 411, type: !81, scopeLine: 412, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!462 = !DILocation(line: 413, column: 2, scope: !461)
!463 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 416, type: !81, scopeLine: 416, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!464 = !DILocation(line: 418, column: 1, scope: !463)
!465 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 420, type: !466, scopeLine: 420, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!466 = !DISubroutineType(types: !467)
!467 = !{!64}
!468 = !DILocation(line: 422, column: 16, scope: !465)
!469 = !DILocation(line: 423, column: 10, scope: !465)
!470 = !DILocation(line: 424, column: 12, scope: !465)
!471 = !DILocation(line: 425, column: 2, scope: !465)
!472 = !DILocation(line: 427, column: 2, scope: !465)
!473 = !DILocation(line: 428, column: 2, scope: !465)
!474 = !DILocation(line: 428, column: 2, scope: !475)
!475 = distinct !DILexicalBlock(scope: !476, file: !3, line: 428, column: 2)
!476 = distinct !DILexicalBlock(scope: !465, file: !3, line: 428, column: 2)
!477 = !DILocation(line: 428, column: 2, scope: !476)
!478 = !DILocation(line: 428, column: 2, scope: !479)
!479 = distinct !DILexicalBlock(scope: !475, file: !3, line: 428, column: 2)
!480 = !DILocalVariable(name: "__x", scope: !481, file: !3, line: 428, type: !6)
!481 = distinct !DILexicalBlock(scope: !479, file: !3, line: 428, column: 2)
!482 = !DILocation(line: 428, column: 2, scope: !481)
!483 = !{i32 -2146614940}
!484 = !DILocalVariable(name: "__x", scope: !485, file: !3, line: 428, type: !6)
!485 = distinct !DILexicalBlock(scope: !479, file: !3, line: 428, column: 2)
!486 = !DILocation(line: 428, column: 2, scope: !485)
!487 = !{i32 -2146614815}
!488 = !DILocation(line: 428, column: 2, scope: !489)
!489 = distinct !DILexicalBlock(scope: !475, file: !3, line: 428, column: 2)
!490 = !DILocalVariable(name: "__x", scope: !491, file: !3, line: 428, type: !6)
!491 = distinct !DILexicalBlock(scope: !489, file: !3, line: 428, column: 2)
!492 = !DILocation(line: 428, column: 2, scope: !491)
!493 = !{i32 -2146614683}
!494 = !DILocalVariable(name: "__x", scope: !495, file: !3, line: 428, type: !6)
!495 = distinct !DILexicalBlock(scope: !489, file: !3, line: 428, column: 2)
!496 = !DILocation(line: 428, column: 2, scope: !495)
!497 = !{i32 -2146614558}
!498 = !DILocation(line: 429, column: 2, scope: !465)
!499 = !DILocation(line: 431, column: 2, scope: !465)
!500 = !DILocation(line: 431, column: 9, scope: !465)
!501 = !DILocation(line: 431, column: 22, scope: !465)
!502 = !DILocation(line: 433, column: 7, scope: !503)
!503 = distinct !DILexicalBlock(scope: !504, file: !3, line: 433, column: 7)
!504 = distinct !DILexicalBlock(scope: !465, file: !3, line: 431, column: 35)
!505 = !DILocation(line: 433, column: 18, scope: !503)
!506 = !DILocation(line: 433, column: 7, scope: !504)
!507 = !DILocation(line: 434, column: 4, scope: !508)
!508 = distinct !DILexicalBlock(scope: !503, file: !3, line: 433, column: 23)
!509 = !DILocation(line: 435, column: 4, scope: !508)
!510 = !DILocation(line: 435, column: 4, scope: !511)
!511 = distinct !DILexicalBlock(scope: !512, file: !3, line: 435, column: 4)
!512 = distinct !DILexicalBlock(scope: !508, file: !3, line: 435, column: 4)
!513 = !DILocation(line: 435, column: 4, scope: !512)
!514 = !DILocation(line: 435, column: 4, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !3, line: 435, column: 4)
!516 = !DILocalVariable(name: "__x", scope: !517, file: !3, line: 435, type: !6)
!517 = distinct !DILexicalBlock(scope: !515, file: !3, line: 435, column: 4)
!518 = !DILocation(line: 435, column: 4, scope: !517)
!519 = !{i32 -2146612385}
!520 = !DILocalVariable(name: "__x", scope: !521, file: !3, line: 435, type: !6)
!521 = distinct !DILexicalBlock(scope: !515, file: !3, line: 435, column: 4)
!522 = !DILocation(line: 435, column: 4, scope: !521)
!523 = !{i32 -2146612260}
!524 = !DILocation(line: 435, column: 4, scope: !525)
!525 = distinct !DILexicalBlock(scope: !511, file: !3, line: 435, column: 4)
!526 = !DILocalVariable(name: "__x", scope: !527, file: !3, line: 435, type: !6)
!527 = distinct !DILexicalBlock(scope: !525, file: !3, line: 435, column: 4)
!528 = !DILocation(line: 435, column: 4, scope: !527)
!529 = !{i32 -2146612128}
!530 = !DILocalVariable(name: "__x", scope: !531, file: !3, line: 435, type: !6)
!531 = distinct !DILexicalBlock(scope: !525, file: !3, line: 435, column: 4)
!532 = !DILocation(line: 435, column: 4, scope: !531)
!533 = !{i32 -2146612003}
!534 = !DILocation(line: 436, column: 4, scope: !508)
!535 = !DILocation(line: 437, column: 3, scope: !508)
!536 = !DILocation(line: 439, column: 3, scope: !504)
!537 = !DILocation(line: 441, column: 4, scope: !538)
!538 = distinct !DILexicalBlock(scope: !504, file: !3, line: 439, column: 11)
!539 = !DILocation(line: 442, column: 4, scope: !538)
!540 = !DILocation(line: 442, column: 4, scope: !541)
!541 = distinct !DILexicalBlock(scope: !542, file: !3, line: 442, column: 4)
!542 = distinct !DILexicalBlock(scope: !538, file: !3, line: 442, column: 4)
!543 = !DILocation(line: 442, column: 4, scope: !542)
!544 = !DILocation(line: 442, column: 4, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !3, line: 442, column: 4)
!546 = !DILocalVariable(name: "__x", scope: !547, file: !3, line: 442, type: !6)
!547 = distinct !DILexicalBlock(scope: !545, file: !3, line: 442, column: 4)
!548 = !DILocation(line: 442, column: 4, scope: !547)
!549 = !{i32 -2146609879}
!550 = !DILocalVariable(name: "__x", scope: !551, file: !3, line: 442, type: !6)
!551 = distinct !DILexicalBlock(scope: !545, file: !3, line: 442, column: 4)
!552 = !DILocation(line: 442, column: 4, scope: !551)
!553 = !{i32 -2146609754}
!554 = !DILocation(line: 442, column: 4, scope: !555)
!555 = distinct !DILexicalBlock(scope: !541, file: !3, line: 442, column: 4)
!556 = !DILocalVariable(name: "__x", scope: !557, file: !3, line: 442, type: !6)
!557 = distinct !DILexicalBlock(scope: !555, file: !3, line: 442, column: 4)
!558 = !DILocation(line: 442, column: 4, scope: !557)
!559 = !{i32 -2146609622}
!560 = !DILocalVariable(name: "__x", scope: !561, file: !3, line: 442, type: !6)
!561 = distinct !DILexicalBlock(scope: !555, file: !3, line: 442, column: 4)
!562 = !DILocation(line: 442, column: 4, scope: !561)
!563 = !{i32 -2146609497}
!564 = !DILocation(line: 443, column: 4, scope: !538)
!565 = !DILocation(line: 445, column: 4, scope: !538)
!566 = !DILocation(line: 446, column: 4, scope: !538)
!567 = !DILocation(line: 446, column: 4, scope: !568)
!568 = distinct !DILexicalBlock(scope: !569, file: !3, line: 446, column: 4)
!569 = distinct !DILexicalBlock(scope: !538, file: !3, line: 446, column: 4)
!570 = !DILocation(line: 446, column: 4, scope: !569)
!571 = !DILocation(line: 446, column: 4, scope: !572)
!572 = distinct !DILexicalBlock(scope: !568, file: !3, line: 446, column: 4)
!573 = !DILocalVariable(name: "__x", scope: !574, file: !3, line: 446, type: !6)
!574 = distinct !DILexicalBlock(scope: !572, file: !3, line: 446, column: 4)
!575 = !DILocation(line: 446, column: 4, scope: !574)
!576 = !{i32 -2146607373}
!577 = !DILocalVariable(name: "__x", scope: !578, file: !3, line: 446, type: !6)
!578 = distinct !DILexicalBlock(scope: !572, file: !3, line: 446, column: 4)
!579 = !DILocation(line: 446, column: 4, scope: !578)
!580 = !{i32 -2146607248}
!581 = !DILocation(line: 446, column: 4, scope: !582)
!582 = distinct !DILexicalBlock(scope: !568, file: !3, line: 446, column: 4)
!583 = !DILocalVariable(name: "__x", scope: !584, file: !3, line: 446, type: !6)
!584 = distinct !DILexicalBlock(scope: !582, file: !3, line: 446, column: 4)
!585 = !DILocation(line: 446, column: 4, scope: !584)
!586 = !{i32 -2146607116}
!587 = !DILocalVariable(name: "__x", scope: !588, file: !3, line: 446, type: !6)
!588 = distinct !DILexicalBlock(scope: !582, file: !3, line: 446, column: 4)
!589 = !DILocation(line: 446, column: 4, scope: !588)
!590 = !{i32 -2146606991}
!591 = !DILocation(line: 447, column: 4, scope: !538)
!592 = !DILocation(line: 449, column: 4, scope: !538)
!593 = !DILocation(line: 450, column: 5, scope: !594)
!594 = distinct !DILexicalBlock(scope: !538, file: !3, line: 449, column: 12)
!595 = !DILocation(line: 451, column: 5, scope: !594)
!596 = !DILocation(line: 451, column: 5, scope: !597)
!597 = distinct !DILexicalBlock(scope: !598, file: !3, line: 451, column: 5)
!598 = distinct !DILexicalBlock(scope: !594, file: !3, line: 451, column: 5)
!599 = !DILocation(line: 451, column: 5, scope: !598)
!600 = !DILocation(line: 451, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !3, line: 451, column: 5)
!602 = !DILocalVariable(name: "__x", scope: !603, file: !3, line: 451, type: !6)
!603 = distinct !DILexicalBlock(scope: !601, file: !3, line: 451, column: 5)
!604 = !DILocation(line: 451, column: 5, scope: !603)
!605 = !{i32 -2146604867}
!606 = !DILocalVariable(name: "__x", scope: !607, file: !3, line: 451, type: !6)
!607 = distinct !DILexicalBlock(scope: !601, file: !3, line: 451, column: 5)
!608 = !DILocation(line: 451, column: 5, scope: !607)
!609 = !{i32 -2146604742}
!610 = !DILocation(line: 451, column: 5, scope: !611)
!611 = distinct !DILexicalBlock(scope: !597, file: !3, line: 451, column: 5)
!612 = !DILocalVariable(name: "__x", scope: !613, file: !3, line: 451, type: !6)
!613 = distinct !DILexicalBlock(scope: !611, file: !3, line: 451, column: 5)
!614 = !DILocation(line: 451, column: 5, scope: !613)
!615 = !{i32 -2146604610}
!616 = !DILocalVariable(name: "__x", scope: !617, file: !3, line: 451, type: !6)
!617 = distinct !DILexicalBlock(scope: !611, file: !3, line: 451, column: 5)
!618 = !DILocation(line: 451, column: 5, scope: !617)
!619 = !{i32 -2146604485}
!620 = !DILocation(line: 452, column: 5, scope: !594)
!621 = !DILocation(line: 453, column: 9, scope: !622)
!622 = distinct !DILexicalBlock(scope: !594, file: !3, line: 453, column: 9)
!623 = !DILocation(line: 453, column: 20, scope: !622)
!624 = !DILocation(line: 453, column: 9, scope: !594)
!625 = !DILocation(line: 454, column: 6, scope: !622)
!626 = distinct !{!626, !592, !627}
!627 = !DILocation(line: 455, column: 4, scope: !538)
!628 = !DILocation(line: 457, column: 8, scope: !629)
!629 = distinct !DILexicalBlock(scope: !538, file: !3, line: 457, column: 8)
!630 = !DILocation(line: 457, column: 19, scope: !629)
!631 = !DILocation(line: 457, column: 8, scope: !538)
!632 = !DILocation(line: 458, column: 5, scope: !629)
!633 = distinct !{!633, !536, !634}
!634 = !DILocation(line: 459, column: 3, scope: !504)
!635 = !DILocation(line: 461, column: 7, scope: !636)
!636 = distinct !DILexicalBlock(scope: !504, file: !3, line: 461, column: 7)
!637 = !DILocation(line: 461, column: 18, scope: !636)
!638 = !DILocation(line: 461, column: 7, scope: !504)
!639 = !DILocation(line: 462, column: 4, scope: !636)
!640 = !DILocation(line: 463, column: 4, scope: !504)
!641 = !DILocation(line: 463, column: 4, scope: !642)
!642 = distinct !DILexicalBlock(scope: !643, file: !3, line: 463, column: 4)
!643 = distinct !DILexicalBlock(scope: !504, file: !3, line: 463, column: 4)
!644 = !DILocation(line: 463, column: 4, scope: !643)
!645 = !DILocation(line: 463, column: 4, scope: !646)
!646 = distinct !DILexicalBlock(scope: !642, file: !3, line: 463, column: 4)
!647 = !DILocalVariable(name: "__x", scope: !648, file: !3, line: 463, type: !6)
!648 = distinct !DILexicalBlock(scope: !646, file: !3, line: 463, column: 4)
!649 = !DILocation(line: 463, column: 4, scope: !648)
!650 = !{i32 -2146602295}
!651 = !DILocalVariable(name: "__x", scope: !652, file: !3, line: 463, type: !6)
!652 = distinct !DILexicalBlock(scope: !646, file: !3, line: 463, column: 4)
!653 = !DILocation(line: 463, column: 4, scope: !652)
!654 = !{i32 -2146602170}
!655 = !DILocation(line: 463, column: 4, scope: !656)
!656 = distinct !DILexicalBlock(scope: !642, file: !3, line: 463, column: 4)
!657 = !DILocalVariable(name: "__x", scope: !658, file: !3, line: 463, type: !6)
!658 = distinct !DILexicalBlock(scope: !656, file: !3, line: 463, column: 4)
!659 = !DILocation(line: 463, column: 4, scope: !658)
!660 = !{i32 -2146602038}
!661 = !DILocalVariable(name: "__x", scope: !662, file: !3, line: 463, type: !6)
!662 = distinct !DILexicalBlock(scope: !656, file: !3, line: 463, column: 4)
!663 = !DILocation(line: 463, column: 4, scope: !662)
!664 = !{i32 -2146601913}
!665 = !DILocation(line: 464, column: 4, scope: !504)
!666 = !DILocation(line: 466, column: 3, scope: !504)
!667 = !DILocation(line: 467, column: 3, scope: !504)
!668 = !DILocation(line: 467, column: 3, scope: !669)
!669 = distinct !DILexicalBlock(scope: !670, file: !3, line: 467, column: 3)
!670 = distinct !DILexicalBlock(scope: !504, file: !3, line: 467, column: 3)
!671 = !DILocation(line: 467, column: 3, scope: !670)
!672 = !DILocation(line: 467, column: 3, scope: !673)
!673 = distinct !DILexicalBlock(scope: !669, file: !3, line: 467, column: 3)
!674 = !DILocalVariable(name: "__x", scope: !675, file: !3, line: 467, type: !6)
!675 = distinct !DILexicalBlock(scope: !673, file: !3, line: 467, column: 3)
!676 = !DILocation(line: 467, column: 3, scope: !675)
!677 = !{i32 -2146599789}
!678 = !DILocalVariable(name: "__x", scope: !679, file: !3, line: 467, type: !6)
!679 = distinct !DILexicalBlock(scope: !673, file: !3, line: 467, column: 3)
!680 = !DILocation(line: 467, column: 3, scope: !679)
!681 = !{i32 -2146599664}
!682 = !DILocation(line: 467, column: 3, scope: !683)
!683 = distinct !DILexicalBlock(scope: !669, file: !3, line: 467, column: 3)
!684 = !DILocalVariable(name: "__x", scope: !685, file: !3, line: 467, type: !6)
!685 = distinct !DILexicalBlock(scope: !683, file: !3, line: 467, column: 3)
!686 = !DILocation(line: 467, column: 3, scope: !685)
!687 = !{i32 -2146599532}
!688 = !DILocalVariable(name: "__x", scope: !689, file: !3, line: 467, type: !6)
!689 = distinct !DILexicalBlock(scope: !683, file: !3, line: 467, column: 3)
!690 = !DILocation(line: 467, column: 3, scope: !689)
!691 = !{i32 -2146599407}
!692 = !DILocation(line: 468, column: 3, scope: !504)
!693 = !DILocation(line: 470, column: 3, scope: !504)
!694 = !DILocation(line: 471, column: 3, scope: !504)
!695 = !DILocation(line: 471, column: 3, scope: !696)
!696 = distinct !DILexicalBlock(scope: !697, file: !3, line: 471, column: 3)
!697 = distinct !DILexicalBlock(scope: !504, file: !3, line: 471, column: 3)
!698 = !DILocation(line: 471, column: 3, scope: !697)
!699 = !DILocation(line: 471, column: 3, scope: !700)
!700 = distinct !DILexicalBlock(scope: !696, file: !3, line: 471, column: 3)
!701 = !DILocalVariable(name: "__x", scope: !702, file: !3, line: 471, type: !6)
!702 = distinct !DILexicalBlock(scope: !700, file: !3, line: 471, column: 3)
!703 = !DILocation(line: 471, column: 3, scope: !702)
!704 = !{i32 -2146597283}
!705 = !DILocalVariable(name: "__x", scope: !706, file: !3, line: 471, type: !6)
!706 = distinct !DILexicalBlock(scope: !700, file: !3, line: 471, column: 3)
!707 = !DILocation(line: 471, column: 3, scope: !706)
!708 = !{i32 -2146597158}
!709 = !DILocation(line: 471, column: 3, scope: !710)
!710 = distinct !DILexicalBlock(scope: !696, file: !3, line: 471, column: 3)
!711 = !DILocalVariable(name: "__x", scope: !712, file: !3, line: 471, type: !6)
!712 = distinct !DILexicalBlock(scope: !710, file: !3, line: 471, column: 3)
!713 = !DILocation(line: 471, column: 3, scope: !712)
!714 = !{i32 -2146597026}
!715 = !DILocalVariable(name: "__x", scope: !716, file: !3, line: 471, type: !6)
!716 = distinct !DILexicalBlock(scope: !710, file: !3, line: 471, column: 3)
!717 = !DILocation(line: 471, column: 3, scope: !716)
!718 = !{i32 -2146596901}
!719 = !DILocation(line: 472, column: 3, scope: !504)
!720 = distinct !{!720, !499, !721}
!721 = !DILocation(line: 473, column: 2, scope: !465)
!722 = !DILocation(line: 475, column: 2, scope: !465)
!723 = !DILocation(line: 476, column: 1, scope: !465)
