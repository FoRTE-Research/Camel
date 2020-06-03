; ModuleID = 'camel_cem_mod.bc'
source_filename = "../benchmarks/camel_cem.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, [128 x %struct._node_t], i16, i16, i16, i16, i16, i16, %struct._node_t, [16 x %struct._node_t], %struct._node_t, i16, i16 }
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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !23
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !70
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !14
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !9
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !72
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !84 {
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
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 924, i16 zeroext %13), !dbg !134
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
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 926, i1 false), !dbg !144
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
  %cmp = icmp ult i16 %7, 64, !dbg !169
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
  call void @llvm.dbg.declare(metadata i16* %i, metadata !175, metadata !DIExpression()), !dbg !177
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !178
  %letter12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !178
  %11 = load i16, i16* %letter12, align 2, !dbg !178
  store i16 %11, i16* %i, align 2, !dbg !177
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !179
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !179
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !179
  %13 = load i16, i16* %i, align 2, !dbg !180
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %13, !dbg !179
  %14 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !181
  %15 = bitcast %struct._node_t* %node to i8*, !dbg !181
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 6, i1 false), !dbg !181
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !182
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !182
  %letter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !182
  %17 = load i16, i16* %letter15, align 2, !dbg !183
  %inc = add i16 %17, 1, !dbg !183
  store i16 %inc, i16* %letter15, align 2, !dbg !183
  br label %while.cond, !dbg !167, !llvm.loop !184

while.end:                                        ; preds = %while.cond
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !186
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !186
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 4, !dbg !186
  store i16 64, i16* %node_count, align 2, !dbg !187
  ret void, !dbg !188
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !189 {
entry:
  %next_letter_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %next_letter_idx, metadata !190, metadata !DIExpression()), !dbg !191
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !192
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !192
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !192
  %1 = load i16, i16* %letter_idx, align 2, !dbg !192
  %add = add i16 %1, 1, !dbg !193
  store i16 %add, i16* %next_letter_idx, align 2, !dbg !191
  %2 = load i16, i16* %next_letter_idx, align 2, !dbg !194
  %cmp = icmp eq i16 %2, 2, !dbg !196
  br i1 %cmp, label %if.then, label %if.end, !dbg !197

if.then:                                          ; preds = %entry
  store i16 0, i16* %next_letter_idx, align 2, !dbg !198
  br label %if.end, !dbg !199

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !200
  %letter_idx2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !200
  %4 = load i16, i16* %letter_idx2, align 2, !dbg !200
  %cmp3 = icmp eq i16 %4, 0, !dbg !202
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !203

if.then4:                                         ; preds = %if.end
  %5 = load i16, i16* %next_letter_idx, align 2, !dbg !204
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !206
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !206
  %letter_idx6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !206
  store i16 %5, i16* %letter_idx6, align 2, !dbg !207
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !208
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !208
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 16, !dbg !208
  store i16 0, i16* %check, align 2, !dbg !209
  br label %if.end12, !dbg !210

if.else:                                          ; preds = %if.end
  %8 = load i16, i16* %next_letter_idx, align 2, !dbg !211
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !213
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !213
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !213
  store i16 %8, i16* %letter_idx9, align 2, !dbg !214
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !215
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !215
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !215
  store i16 1, i16* %check11, align 2, !dbg !216
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then4
  ret void, !dbg !217
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_measure_temp() #0 !dbg !218 {
entry:
  %prev_sample = alloca i16, align 2
  %sample = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !221
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !221
  %prev_sample1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !221
  %1 = load i16, i16* %prev_sample1, align 2, !dbg !221
  store i16 %1, i16* %prev_sample, align 2, !dbg !222
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !223, metadata !DIExpression()), !dbg !224
  %2 = load i16, i16* %prev_sample, align 2, !dbg !225
  %call = call i16 @acquire_sample(i16 %2), !dbg !226
  store i16 %call, i16* %sample, align 2, !dbg !224
  %3 = load i16, i16* %sample, align 2, !dbg !227
  store i16 %3, i16* %prev_sample, align 2, !dbg !228
  %4 = load i16, i16* %prev_sample, align 2, !dbg !229
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !230
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !230
  %prev_sample3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !230
  store i16 %4, i16* %prev_sample3, align 2, !dbg !231
  %6 = load i16, i16* %sample, align 2, !dbg !232
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !233
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !233
  %sample5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !233
  store i16 %6, i16* %sample5, align 2, !dbg !234
  ret void, !dbg !235
}

; Function Attrs: noinline nounwind optnone
define internal i16 @acquire_sample(i16 %prev_sample) #0 !dbg !236 {
entry:
  %prev_sample.addr = alloca i16, align 2
  %sample = alloca i16, align 2
  store i16 %prev_sample, i16* %prev_sample.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample.addr, metadata !239, metadata !DIExpression()), !dbg !240
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !241, metadata !DIExpression()), !dbg !242
  %0 = load i16, i16* %prev_sample.addr, align 2, !dbg !243
  %add = add i16 %0, 1, !dbg !244
  %and = and i16 %add, 3, !dbg !245
  store i16 %and, i16* %sample, align 2, !dbg !242
  %1 = load i16, i16* %sample, align 2, !dbg !246
  ret i16 %1, !dbg !247
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_letterize() #0 !dbg !248 {
entry:
  %letter_idx = alloca i16, align 2
  %letter_shift = alloca i16, align 2
  %letter = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %letter_idx, metadata !249, metadata !DIExpression()), !dbg !250
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !251
  %letter_idx1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !251
  %1 = load i16, i16* %letter_idx1, align 2, !dbg !251
  store i16 %1, i16* %letter_idx, align 2, !dbg !250
  %2 = load i16, i16* %letter_idx, align 2, !dbg !252
  %cmp = icmp eq i16 %2, 0, !dbg !254
  br i1 %cmp, label %if.then, label %if.else, !dbg !255

if.then:                                          ; preds = %entry
  store i16 2, i16* %letter_idx, align 2, !dbg !256
  br label %if.end, !dbg !257

if.else:                                          ; preds = %entry
  %3 = load i16, i16* %letter_idx, align 2, !dbg !258
  %dec = add i16 %3, -1, !dbg !258
  store i16 %dec, i16* %letter_idx, align 2, !dbg !258
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i16* %letter_shift, metadata !259, metadata !DIExpression()), !dbg !260
  %4 = load i16, i16* %letter_idx, align 2, !dbg !261
  %mul = mul i16 8, %4, !dbg !262
  store i16 %mul, i16* %letter_shift, align 2, !dbg !260
  call void @llvm.dbg.declare(metadata i16* %letter, metadata !263, metadata !DIExpression()), !dbg !264
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !265
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !265
  %sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 6, !dbg !265
  %6 = load i16, i16* %sample, align 2, !dbg !265
  %7 = load i16, i16* %letter_shift, align 2, !dbg !266
  %shl = shl i16 63, %7, !dbg !267
  %and = and i16 %6, %shl, !dbg !268
  %8 = load i16, i16* %letter_shift, align 2, !dbg !269
  %shr = lshr i16 %and, %8, !dbg !270
  store i16 %shr, i16* %letter, align 2, !dbg !264
  %9 = load i16, i16* %letter, align 2, !dbg !271
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !272
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !272
  store i16 %9, i16* %letter4, align 2, !dbg !273
  ret void, !dbg !274
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_compress() #0 !dbg !275 {
entry:
  %parent_node = alloca %struct._node_t, align 2
  %parent = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node, metadata !276, metadata !DIExpression()), !dbg !277
  call void @llvm.dbg.declare(metadata i16* %parent, metadata !278, metadata !DIExpression()), !dbg !279
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !280
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !280
  %1 = load i16, i16* %parent_next, align 2, !dbg !280
  store i16 %1, i16* %parent, align 2, !dbg !279
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !281
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !281
  %3 = load i16, i16* %parent, align 2, !dbg !282
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !281
  %4 = bitcast %struct._node_t* %parent_node to i8*, !dbg !281
  %5 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !281
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %4, i8* align 2 %5, i16 6, i1 false), !dbg !281
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !283
  %6 = load i16, i16* %child, align 2, !dbg !283
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !284
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !284
  store i16 %6, i16* %sibling, align 2, !dbg !285
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !286
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !286
  %parent_node4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !286
  %9 = bitcast %struct._node_t* %parent_node4 to i8*, !dbg !287
  %10 = bitcast %struct._node_t* %parent_node to i8*, !dbg !287
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %9, i8* align 2 %10, i16 6, i1 false), !dbg !287
  %11 = load i16, i16* %parent, align 2, !dbg !288
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !289
  %parent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !289
  store i16 %11, i16* %parent6, align 2, !dbg !290
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !291
  %13 = load i16, i16* %child7, align 2, !dbg !291
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !292
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !292
  %child9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !292
  store i16 %13, i16* %child9, align 2, !dbg !293
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !294
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !294
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 7, !dbg !294
  %16 = load i16, i16* %sample_count, align 2, !dbg !295
  %inc = add i16 %16, 1, !dbg !295
  store i16 %inc, i16* %sample_count, align 2, !dbg !295
  ret void, !dbg !296
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_find_sibling() #0 !dbg !297 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %starting_node_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !298, metadata !DIExpression()), !dbg !300
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !301
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !301
  %1 = load i16, i16* %sibling, align 2, !dbg !301
  %cmp = icmp ne i16 %1, 0, !dbg !303
  br i1 %cmp, label %if.then, label %if.end21, !dbg !304

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %i, metadata !305, metadata !DIExpression()), !dbg !307
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !308
  %sibling2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !308
  %3 = load i16, i16* %sibling2, align 2, !dbg !308
  store i16 %3, i16* %i, align 2, !dbg !307
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !309
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !309
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 5, !dbg !309
  %5 = load i16, i16* %i, align 2, !dbg !310
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !309
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !311
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !312
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 0, !dbg !314
  %7 = load i16, i16* %letter, align 2, !dbg !314
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !315
  %letter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !315
  %9 = load i16, i16* %letter5, align 2, !dbg !315
  %cmp6 = icmp eq i16 %7, %9, !dbg !316
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !317

if.then7:                                         ; preds = %if.then
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !318
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !318
  %sibling9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !318
  %11 = load i16, i16* %sibling9, align 2, !dbg !318
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !320
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 11, !dbg !320
  store i16 %11, i16* %parent_next, align 2, !dbg !321
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !322
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !322
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 16, !dbg !322
  store i16 0, i16* %check, align 2, !dbg !323
  br label %if.end34, !dbg !324

if.else:                                          ; preds = %if.then
  %14 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !325
  %sibling12 = getelementptr inbounds %struct._node_t, %struct._node_t* %14, i32 0, i32 1, !dbg !328
  %15 = load i16, i16* %sibling12, align 2, !dbg !328
  %cmp13 = icmp ne i16 %15, 0, !dbg !329
  br i1 %cmp13, label %if.then14, label %if.end, !dbg !330

if.then14:                                        ; preds = %if.else
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !331
  %sibling15 = getelementptr inbounds %struct._node_t, %struct._node_t* %16, i32 0, i32 1, !dbg !333
  %17 = load i16, i16* %sibling15, align 2, !dbg !333
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !334
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !334
  %sibling17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !334
  store i16 %17, i16* %sibling17, align 2, !dbg !335
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !336
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !336
  store i16 1, i16* %check19, align 2, !dbg !337
  br label %if.end34, !dbg !338

if.end:                                           ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end
  br label %if.end21, !dbg !339

if.end21:                                         ; preds = %if.end20, %entry
  call void @llvm.dbg.declare(metadata i16* %starting_node_idx, metadata !340, metadata !DIExpression()), !dbg !341
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !342
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !342
  %letter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !342
  %21 = load i16, i16* %letter23, align 2, !dbg !342
  store i16 %21, i16* %starting_node_idx, align 2, !dbg !341
  %22 = load i16, i16* %starting_node_idx, align 2, !dbg !343
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !344
  %parent_next25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 11, !dbg !344
  store i16 %22, i16* %parent_next25, align 2, !dbg !345
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !346
  %child = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !346
  %25 = load i16, i16* %child, align 2, !dbg !346
  %cmp27 = icmp eq i16 %25, 0, !dbg !348
  br i1 %cmp27, label %if.then28, label %if.else31, !dbg !349

if.then28:                                        ; preds = %if.end21
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !350
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 16, !dbg !350
  store i16 2, i16* %check30, align 2, !dbg !352
  br label %if.end34, !dbg !353

if.else31:                                        ; preds = %if.end21
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !354
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 16, !dbg !354
  store i16 3, i16* %check33, align 2, !dbg !356
  br label %if.end34

if.end34:                                         ; preds = %if.then7, %if.then14, %if.else31, %if.then28
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_node() #0 !dbg !358 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %next_sibling = alloca i16, align 2
  %sibling_node_obj = alloca %struct._node_t, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !359, metadata !DIExpression()), !dbg !360
  call void @llvm.dbg.declare(metadata i16* %i, metadata !361, metadata !DIExpression()), !dbg !362
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !363
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !363
  %1 = load i16, i16* %sibling, align 2, !dbg !363
  store i16 %1, i16* %i, align 2, !dbg !362
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !364
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !364
  %3 = load i16, i16* %i, align 2, !dbg !365
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !364
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !366
  %4 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !367
  %sibling2 = getelementptr inbounds %struct._node_t, %struct._node_t* %4, i32 0, i32 1, !dbg !369
  %5 = load i16, i16* %sibling2, align 2, !dbg !369
  %cmp = icmp ne i16 %5, 0, !dbg !370
  br i1 %cmp, label %if.then, label %if.else, !dbg !371

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %next_sibling, metadata !372, metadata !DIExpression()), !dbg !374
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !375
  %sibling3 = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 1, !dbg !376
  %7 = load i16, i16* %sibling3, align 2, !dbg !376
  store i16 %7, i16* %next_sibling, align 2, !dbg !374
  %8 = load i16, i16* %next_sibling, align 2, !dbg !377
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !378
  %sibling5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !378
  store i16 %8, i16* %sibling5, align 2, !dbg !379
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !380
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 16, !dbg !380
  store i16 0, i16* %check, align 2, !dbg !381
  br label %if.end, !dbg !382

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !383, metadata !DIExpression()), !dbg !385
  %11 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !386
  %12 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !387
  %13 = bitcast %struct._node_t* %11 to i8*, !dbg !387
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 6, i1 false), !dbg !387
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !388
  %sibling_node8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !388
  %15 = bitcast %struct._node_t* %sibling_node8 to i8*, !dbg !389
  %16 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !389
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !389
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !390
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !390
  %check10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !390
  store i16 1, i16* %check10, align 2, !dbg !391
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !392
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() #0 !dbg !393 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %cond = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !394
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !394
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !394
  %1 = load i16, i16* %node_count, align 2, !dbg !394
  %cmp = icmp eq i16 %1, 128, !dbg !396
  br i1 %cmp, label %if.then, label %if.end, !dbg !397

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !398
  br label %while.body, !dbg !400

while.body:                                       ; preds = %if.then, %while.body
  br label %while.body, !dbg !400, !llvm.loop !401

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %child, metadata !403, metadata !DIExpression()), !dbg !404
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !405
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !405
  %3 = load i16, i16* %node_count2, align 2, !dbg !405
  store i16 %3, i16* %child, align 2, !dbg !404
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !406, metadata !DIExpression()), !dbg !407
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !408
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !409
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !409
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !409
  %5 = load i16, i16* %letter4, align 2, !dbg !409
  store i16 %5, i16* %letter, align 2, !dbg !408
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !408
  store i16 0, i16* %sibling, align 2, !dbg !408
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !408
  store i16 0, i16* %child5, align 2, !dbg !408
  call void @llvm.dbg.declare(metadata %struct._node_t* %cond, metadata !410, metadata !DIExpression()), !dbg !411
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !412
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !412
  %7 = bitcast %struct._node_t* %cond to i8*, !dbg !412
  %8 = bitcast %struct._node_t* %parent_node to i8*, !dbg !412
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %7, i8* align 2 %8, i16 6, i1 false), !dbg !412
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %cond, i32 0, i32 2, !dbg !413
  %9 = load i16, i16* %child7, align 2, !dbg !413
  %cmp8 = icmp eq i16 %9, 0, !dbg !415
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !416

if.then9:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !417, metadata !DIExpression()), !dbg !419
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !420
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !420
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !420
  %11 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !420
  %12 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !420
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %12, i16 6, i1 false), !dbg !420
  %13 = load i16, i16* %child, align 2, !dbg !421
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !422
  store i16 %13, i16* %child12, align 2, !dbg !423
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !424
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !424
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !425
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !425
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 10, !dbg !425
  %16 = load i16, i16* %parent, align 2, !dbg !425
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %16, !dbg !424
  %17 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !426
  %18 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !426
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %17, i8* align 2 %18, i16 6, i1 false), !dbg !426
  br label %if.end22, !dbg !427

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !428, metadata !DIExpression()), !dbg !430
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !431
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !431
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 14, !dbg !431
  %20 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !431
  %21 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !431
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %20, i8* align 2 %21, i16 6, i1 false), !dbg !431
  %22 = load i16, i16* %child, align 2, !dbg !432
  %sibling16 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !433
  store i16 %22, i16* %sibling16, align 2, !dbg !434
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !435
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !435
  %dict18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 5, !dbg !435
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !436
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !436
  %sibling20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !436
  %25 = load i16, i16* %sibling20, align 2, !dbg !436
  %arrayidx21 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict18, i16 0, i16 %25, !dbg !435
  %26 = bitcast %struct._node_t* %arrayidx21 to i8*, !dbg !437
  %27 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !437
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %26, i8* align 2 %27, i16 6, i1 false), !dbg !437
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then9
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !438
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !438
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !438
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !439
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !439
  %child26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !439
  %30 = load i16, i16* %child26, align 2, !dbg !439
  %arrayidx27 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict24, i16 0, i16 %30, !dbg !438
  %31 = bitcast %struct._node_t* %arrayidx27 to i8*, !dbg !440
  %32 = bitcast %struct._node_t* %child_node to i8*, !dbg !440
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %31, i8* align 2 %32, i16 6, i1 false), !dbg !440
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !441
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !441
  %parent29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !441
  %34 = load i16, i16* %parent29, align 2, !dbg !441
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !442
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 15, !dbg !442
  store i16 %34, i16* %symbol, align 2, !dbg !443
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !444
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !444
  %node_count32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 4, !dbg !444
  %37 = load i16, i16* %node_count32, align 2, !dbg !445
  %inc = add i16 %37, 1, !dbg !445
  store i16 %inc, i16* %node_count32, align 2, !dbg !445
  ret void, !dbg !446
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() #0 !dbg !447 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !448
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !448
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 15, !dbg !448
  %1 = load i16, i16* %symbol, align 2, !dbg !448
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !449
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !449
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !450
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !450
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !450
  %4 = load i16, i16* %out_len, align 2, !dbg !450
  %arrayidx = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %compressed_data, i16 0, i16 %4, !dbg !449
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 0, !dbg !451
  store i16 %1, i16* %letter, align 2, !dbg !452
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !453
  %out_len4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !453
  %6 = load i16, i16* %out_len4, align 2, !dbg !454
  %inc = add i16 %6, 1, !dbg !454
  store i16 %inc, i16* %out_len4, align 2, !dbg !454
  ret void, !dbg !455
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !456 {
entry:
  call void @exit(i16 0) #6, !dbg !457
  unreachable, !dbg !457
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !458 {
entry:
  ret void, !dbg !459
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !460 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !463
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !464
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  call void @camel_init(), !dbg !466
  call void @task_init(), !dbg !467
  br label %while.cond, !dbg !468

while.cond:                                       ; preds = %if.end23, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !469
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !469
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !469
  %1 = load i16, i16* %out_len, align 2, !dbg !469
  %cmp = icmp ult i16 %1, 16, !dbg !470
  br i1 %cmp, label %while.body, label %while.end24, !dbg !468

while.body:                                       ; preds = %while.cond
  call void @task_sample(), !dbg !471
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !473
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 16, !dbg !473
  %3 = load i16, i16* %check, align 2, !dbg !473
  %cmp2 = icmp eq i16 %3, 0, !dbg !475
  br i1 %cmp2, label %if.then, label %if.end, !dbg !476

if.then:                                          ; preds = %while.body
  call void @task_measure_temp(), !dbg !477
  br label %if.end, !dbg !479

if.end:                                           ; preds = %if.then, %while.body
  br label %while.body4, !dbg !480

while.body4:                                      ; preds = %if.end, %if.end12
  call void @task_letterize(), !dbg !481
  call void @task_compress(), !dbg !483
  br label %do.body, !dbg !484

do.body:                                          ; preds = %do.cond, %while.body4
  call void @task_find_sibling(), !dbg !485
  br label %do.cond, !dbg !487

do.cond:                                          ; preds = %do.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !488
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !488
  %check6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 16, !dbg !488
  %5 = load i16, i16* %check6, align 2, !dbg !488
  %cmp7 = icmp eq i16 %5, 1, !dbg !489
  br i1 %cmp7, label %do.body, label %do.end, !dbg !487, !llvm.loop !490

do.end:                                           ; preds = %do.cond
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !492
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !492
  %check9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 16, !dbg !492
  %7 = load i16, i16* %check9, align 2, !dbg !492
  %cmp10 = icmp ne i16 %7, 0, !dbg !494
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !495

if.then11:                                        ; preds = %do.end
  br label %while.end, !dbg !496

if.end12:                                         ; preds = %do.end
  br label %while.body4, !dbg !480, !llvm.loop !497

while.end:                                        ; preds = %if.then11
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !499
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !499
  %check14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 16, !dbg !499
  %9 = load i16, i16* %check14, align 2, !dbg !499
  %cmp15 = icmp eq i16 %9, 3, !dbg !501
  br i1 %cmp15, label %if.then16, label %if.end23, !dbg !502

if.then16:                                        ; preds = %while.end
  br label %do.body17, !dbg !503

do.body17:                                        ; preds = %do.cond18, %if.then16
  call void @task_add_node(), !dbg !505
  br label %do.cond18, !dbg !507

do.cond18:                                        ; preds = %do.body17
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !508
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !508
  %check20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 16, !dbg !508
  %11 = load i16, i16* %check20, align 2, !dbg !508
  %cmp21 = icmp eq i16 %11, 0, !dbg !509
  br i1 %cmp21, label %do.body17, label %do.end22, !dbg !507, !llvm.loop !510

do.end22:                                         ; preds = %do.cond18
  br label %if.end23, !dbg !512

if.end23:                                         ; preds = %do.end22, %while.end
  call void @task_add_insert(), !dbg !513
  call void @task_append_compressed(), !dbg !514
  br label %while.cond, !dbg !468, !llvm.loop !515

while.end24:                                      ; preds = %while.cond
  call void @task_done(), !dbg !517
  %12 = load i16, i16* %retval, align 2, !dbg !518
  ret i16 %12, !dbg !518
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!80, !81, !82}
!llvm.ident = !{!83}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 164, type: !75, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !8, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_cem.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 51, baseType: !6)
!8 = !{!9, !14, !21, !0, !23, !70, !72}
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 498, type: !11, isLocal: true, isDefinition: true)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 16)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 78, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 26, baseType: !18)
!17 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !19, line: 43, baseType: !20)
!19 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 79, type: !16, isLocal: false, isDefinition: true)
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 171, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 16)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 157, baseType: !27)
!27 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 152, size: 7408, elements: !28)
!28 = !{!29, !34, !69}
!29 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !27, file: !3, line: 154, baseType: !30, size: 176)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !31, size: 176, elements: !32)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 75, baseType: !16)
!32 = !{!33}
!33 = !DISubrange(count: 11)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !27, file: !3, line: 155, baseType: !35, size: 7216, offset: 176)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 149, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 128, size: 7216, elements: !37)
!37 = !{!38, !40, !41, !43, !44, !45, !55, !56, !57, !58, !59, !60, !61, !62, !66, !67, !68}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !36, file: !3, line: 130, baseType: !39, size: 16)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "letter_t", file: !3, line: 52, baseType: !6)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "letter_idx", scope: !36, file: !3, line: 131, baseType: !6, size: 16, offset: 16)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "prev_sample", scope: !36, file: !3, line: 132, baseType: !42, size: 16, offset: 32)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "sample_t", file: !3, line: 53, baseType: !6)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "out_len", scope: !36, file: !3, line: 133, baseType: !7, size: 16, offset: 48)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "node_count", scope: !36, file: !3, line: 134, baseType: !7, size: 16, offset: 64)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "dict", scope: !36, file: !3, line: 135, baseType: !46, size: 6144, offset: 80)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 6144, elements: !53)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !3, line: 59, baseType: !48)
!48 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_node_t", file: !3, line: 55, size: 48, elements: !49)
!49 = !{!50, !51, !52}
!50 = !DIDerivedType(tag: DW_TAG_member, name: "letter", scope: !48, file: !3, line: 56, baseType: !39, size: 16)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !48, file: !3, line: 57, baseType: !7, size: 16, offset: 16)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !48, file: !3, line: 58, baseType: !7, size: 16, offset: 32)
!53 = !{!54}
!54 = !DISubrange(count: 128)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "sample", scope: !36, file: !3, line: 136, baseType: !42, size: 16, offset: 6224)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "sample_count", scope: !36, file: !3, line: 137, baseType: !7, size: 16, offset: 6240)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !36, file: !3, line: 138, baseType: !7, size: 16, offset: 6256)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !36, file: !3, line: 139, baseType: !7, size: 16, offset: 6272)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !36, file: !3, line: 140, baseType: !7, size: 16, offset: 6288)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "parent_next", scope: !36, file: !3, line: 141, baseType: !7, size: 16, offset: 6304)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "parent_node", scope: !36, file: !3, line: 142, baseType: !47, size: 48, offset: 6320)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "compressed_data", scope: !36, file: !3, line: 143, baseType: !63, size: 768, offset: 6368)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 768, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 16)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_node", scope: !36, file: !3, line: 144, baseType: !47, size: 48, offset: 7136)
!67 = !DIDerivedType(tag: DW_TAG_member, name: "symbol", scope: !36, file: !3, line: 145, baseType: !7, size: 16, offset: 7184)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !36, file: !3, line: 148, baseType: !6, size: 16, offset: 7200)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !27, file: !3, line: 156, baseType: !16, size: 16, offset: 7392)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 171, type: !25, isLocal: false, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 200, type: !74, isLocal: false, isDefinition: true)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 176, elements: !32)
!75 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 159, size: 14832, elements: !76)
!76 = !{!77, !78, !79}
!77 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !75, file: !3, line: 161, baseType: !16, size: 16)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !75, file: !3, line: 162, baseType: !26, size: 7408, offset: 16)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !75, file: !3, line: 163, baseType: !26, size: 7408, offset: 7424)
!80 = !{i32 2, !"Dwarf Version", i32 4}
!81 = !{i32 2, !"Debug Info Version", i32 3}
!82 = !{i32 1, !"wchar_size", i32 2}
!83 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!84 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 173, type: !12, scopeLine: 173, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!85 = !DILocation(line: 174, column: 10, scope: !84)
!86 = !DILocation(line: 176, column: 9, scope: !84)
!87 = !DILocation(line: 178, column: 9, scope: !84)
!88 = !DILocation(line: 183, column: 11, scope: !84)
!89 = !DILocation(line: 188, column: 12, scope: !84)
!90 = !DILocation(line: 189, column: 10, scope: !84)
!91 = !DILocation(line: 190, column: 10, scope: !84)
!92 = !DILocation(line: 192, column: 10, scope: !84)
!93 = !DILocation(line: 193, column: 12, scope: !84)
!94 = !DILocation(line: 196, column: 10, scope: !84)
!95 = !DILocation(line: 198, column: 1, scope: !84)
!96 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 202, type: !12, scopeLine: 202, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!97 = !DILocation(line: 203, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !96, file: !3, line: 203, column: 8)
!99 = !DILocation(line: 203, column: 19, scope: !98)
!100 = !DILocation(line: 203, column: 8, scope: !96)
!101 = !DILocation(line: 204, column: 14, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !3, line: 203, column: 34)
!103 = !DILocation(line: 205, column: 16, scope: !102)
!104 = !DILocation(line: 206, column: 5, scope: !102)
!105 = !DILocation(line: 206, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !98, file: !3, line: 206, column: 15)
!107 = !DILocation(line: 206, column: 26, scope: !106)
!108 = !DILocation(line: 206, column: 15, scope: !98)
!109 = !DILocation(line: 207, column: 14, scope: !110)
!110 = distinct !DILexicalBlock(scope: !106, file: !3, line: 206, column: 41)
!111 = !DILocation(line: 208, column: 16, scope: !110)
!112 = !DILocation(line: 209, column: 5, scope: !110)
!113 = !DILocation(line: 210, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !106, file: !3, line: 209, column: 12)
!115 = !DILocation(line: 227, column: 3, scope: !116)
!116 = distinct !DILexicalBlock(scope: !96, file: !3, line: 227, column: 3)
!117 = !{i32 -2146595622}
!118 = !DILocalVariable(name: "__x", scope: !119, file: !3, line: 229, type: !6)
!119 = distinct !DILexicalBlock(scope: !96, file: !3, line: 229, column: 33)
!120 = !DILocation(line: 229, column: 33, scope: !119)
!121 = !{i32 -2146595386}
!122 = !DILocation(line: 229, column: 51, scope: !96)
!123 = !DILocation(line: 229, column: 33, scope: !96)
!124 = !DILocalVariable(name: "__x", scope: !125, file: !3, line: 229, type: !6)
!125 = distinct !DILexicalBlock(scope: !96, file: !3, line: 229, column: 65)
!126 = !DILocation(line: 229, column: 65, scope: !125)
!127 = !{i32 -2146595261}
!128 = !DILocation(line: 229, column: 83, scope: !96)
!129 = !DILocation(line: 229, column: 63, scope: !96)
!130 = !DILocation(line: 229, column: 19, scope: !96)
!131 = !DILocation(line: 229, column: 17, scope: !96)
!132 = !DILocation(line: 230, column: 37, scope: !96)
!133 = !DILocation(line: 230, column: 71, scope: !96)
!134 = !DILocation(line: 230, column: 23, scope: !96)
!135 = !DILocation(line: 230, column: 21, scope: !96)
!136 = !DILocation(line: 233, column: 6, scope: !137)
!137 = distinct !DILexicalBlock(scope: !96, file: !3, line: 233, column: 6)
!138 = !DILocation(line: 233, column: 27, scope: !137)
!139 = !DILocation(line: 233, column: 33, scope: !137)
!140 = !DILocation(line: 233, column: 24, scope: !137)
!141 = !DILocation(line: 233, column: 6, scope: !96)
!142 = !DILocation(line: 234, column: 11, scope: !143)
!143 = distinct !DILexicalBlock(scope: !137, file: !3, line: 233, column: 51)
!144 = !DILocation(line: 234, column: 4, scope: !143)
!145 = !DILocation(line: 234, column: 19, scope: !143)
!146 = !DILocation(line: 235, column: 4, scope: !143)
!147 = !DILocation(line: 236, column: 24, scope: !143)
!148 = !DILocation(line: 236, column: 30, scope: !143)
!149 = !DILocation(line: 236, column: 4, scope: !143)
!150 = !DILocation(line: 237, column: 3, scope: !143)
!151 = !DILocation(line: 238, column: 4, scope: !152)
!152 = distinct !DILexicalBlock(scope: !137, file: !3, line: 237, column: 9)
!153 = !DILocation(line: 241, column: 1, scope: !96)
!154 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 251, type: !12, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!155 = !DILocation(line: 253, column: 2, scope: !154)
!156 = !DILocation(line: 253, column: 18, scope: !154)
!157 = !DILocation(line: 254, column: 2, scope: !154)
!158 = !DILocation(line: 254, column: 14, scope: !154)
!159 = !DILocation(line: 255, column: 2, scope: !154)
!160 = !DILocation(line: 255, column: 13, scope: !154)
!161 = !DILocation(line: 256, column: 2, scope: !154)
!162 = !DILocation(line: 256, column: 18, scope: !154)
!163 = !DILocation(line: 257, column: 2, scope: !154)
!164 = !DILocation(line: 257, column: 17, scope: !154)
!165 = !DILocation(line: 258, column: 2, scope: !154)
!166 = !DILocation(line: 258, column: 19, scope: !154)
!167 = !DILocation(line: 260, column: 2, scope: !154)
!168 = !DILocation(line: 260, column: 9, scope: !154)
!169 = !DILocation(line: 260, column: 20, scope: !154)
!170 = !DILocalVariable(name: "node", scope: !171, file: !3, line: 262, type: !47)
!171 = distinct !DILexicalBlock(scope: !154, file: !3, line: 260, column: 35)
!172 = !DILocation(line: 262, column: 10, scope: !171)
!173 = !DILocation(line: 262, column: 17, scope: !171)
!174 = !DILocation(line: 263, column: 14, scope: !171)
!175 = !DILocalVariable(name: "i", scope: !171, file: !3, line: 267, type: !176)
!176 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!177 = !DILocation(line: 267, column: 7, scope: !171)
!178 = !DILocation(line: 267, column: 11, scope: !171)
!179 = !DILocation(line: 268, column: 3, scope: !171)
!180 = !DILocation(line: 268, column: 12, scope: !171)
!181 = !DILocation(line: 268, column: 17, scope: !171)
!182 = !DILocation(line: 269, column: 3, scope: !171)
!183 = !DILocation(line: 269, column: 13, scope: !171)
!184 = distinct !{!184, !167, !185}
!185 = !DILocation(line: 270, column: 2, scope: !154)
!186 = !DILocation(line: 272, column: 2, scope: !154)
!187 = !DILocation(line: 272, column: 17, scope: !154)
!188 = !DILocation(line: 273, column: 1, scope: !154)
!189 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 275, type: !12, scopeLine: 276, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!190 = !DILocalVariable(name: "next_letter_idx", scope: !189, file: !3, line: 277, type: !6)
!191 = !DILocation(line: 277, column: 11, scope: !189)
!192 = !DILocation(line: 277, column: 29, scope: !189)
!193 = !DILocation(line: 277, column: 44, scope: !189)
!194 = !DILocation(line: 278, column: 6, scope: !195)
!195 = distinct !DILexicalBlock(scope: !189, file: !3, line: 278, column: 6)
!196 = !DILocation(line: 278, column: 22, scope: !195)
!197 = !DILocation(line: 278, column: 6, scope: !189)
!198 = !DILocation(line: 279, column: 19, scope: !195)
!199 = !DILocation(line: 279, column: 3, scope: !195)
!200 = !DILocation(line: 281, column: 6, scope: !201)
!201 = distinct !DILexicalBlock(scope: !189, file: !3, line: 281, column: 6)
!202 = !DILocation(line: 281, column: 21, scope: !201)
!203 = !DILocation(line: 281, column: 6, scope: !189)
!204 = !DILocation(line: 282, column: 20, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !3, line: 281, column: 27)
!206 = !DILocation(line: 282, column: 3, scope: !205)
!207 = !DILocation(line: 282, column: 18, scope: !205)
!208 = !DILocation(line: 283, column: 3, scope: !205)
!209 = !DILocation(line: 283, column: 13, scope: !205)
!210 = !DILocation(line: 285, column: 2, scope: !205)
!211 = !DILocation(line: 286, column: 20, scope: !212)
!212 = distinct !DILexicalBlock(scope: !201, file: !3, line: 285, column: 9)
!213 = !DILocation(line: 286, column: 3, scope: !212)
!214 = !DILocation(line: 286, column: 18, scope: !212)
!215 = !DILocation(line: 287, column: 3, scope: !212)
!216 = !DILocation(line: 287, column: 13, scope: !212)
!217 = !DILocation(line: 290, column: 1, scope: !189)
!218 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 292, type: !12, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!219 = !DILocalVariable(name: "prev_sample", scope: !218, file: !3, line: 294, type: !42)
!220 = !DILocation(line: 294, column: 11, scope: !218)
!221 = !DILocation(line: 295, column: 16, scope: !218)
!222 = !DILocation(line: 295, column: 14, scope: !218)
!223 = !DILocalVariable(name: "sample", scope: !218, file: !3, line: 297, type: !42)
!224 = !DILocation(line: 297, column: 11, scope: !218)
!225 = !DILocation(line: 297, column: 35, scope: !218)
!226 = !DILocation(line: 297, column: 20, scope: !218)
!227 = !DILocation(line: 298, column: 16, scope: !218)
!228 = !DILocation(line: 298, column: 14, scope: !218)
!229 = !DILocation(line: 299, column: 20, scope: !218)
!230 = !DILocation(line: 299, column: 2, scope: !218)
!231 = !DILocation(line: 299, column: 18, scope: !218)
!232 = !DILocation(line: 300, column: 15, scope: !218)
!233 = !DILocation(line: 300, column: 2, scope: !218)
!234 = !DILocation(line: 300, column: 13, scope: !218)
!235 = !DILocation(line: 302, column: 1, scope: !218)
!236 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 245, type: !237, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!237 = !DISubroutineType(types: !238)
!238 = !{!42, !39}
!239 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !236, file: !3, line: 245, type: !39)
!240 = !DILocation(line: 245, column: 41, scope: !236)
!241 = !DILocalVariable(name: "sample", scope: !236, file: !3, line: 247, type: !39)
!242 = !DILocation(line: 247, column: 11, scope: !236)
!243 = !DILocation(line: 247, column: 21, scope: !236)
!244 = !DILocation(line: 247, column: 33, scope: !236)
!245 = !DILocation(line: 247, column: 38, scope: !236)
!246 = !DILocation(line: 248, column: 9, scope: !236)
!247 = !DILocation(line: 248, column: 2, scope: !236)
!248 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 304, type: !12, scopeLine: 305, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!249 = !DILocalVariable(name: "letter_idx", scope: !248, file: !3, line: 306, type: !6)
!250 = !DILocation(line: 306, column: 11, scope: !248)
!251 = !DILocation(line: 306, column: 24, scope: !248)
!252 = !DILocation(line: 307, column: 6, scope: !253)
!253 = distinct !DILexicalBlock(scope: !248, file: !3, line: 307, column: 6)
!254 = !DILocation(line: 307, column: 17, scope: !253)
!255 = !DILocation(line: 307, column: 6, scope: !248)
!256 = !DILocation(line: 308, column: 14, scope: !253)
!257 = !DILocation(line: 308, column: 3, scope: !253)
!258 = !DILocation(line: 310, column: 13, scope: !253)
!259 = !DILocalVariable(name: "letter_shift", scope: !248, file: !3, line: 311, type: !6)
!260 = !DILocation(line: 311, column: 11, scope: !248)
!261 = !DILocation(line: 311, column: 45, scope: !248)
!262 = !DILocation(line: 311, column: 43, scope: !248)
!263 = !DILocalVariable(name: "letter", scope: !248, file: !3, line: 312, type: !39)
!264 = !DILocation(line: 312, column: 11, scope: !248)
!265 = !DILocation(line: 312, column: 21, scope: !248)
!266 = !DILocation(line: 312, column: 50, scope: !248)
!267 = !DILocation(line: 312, column: 47, scope: !248)
!268 = !DILocation(line: 312, column: 32, scope: !248)
!269 = !DILocation(line: 312, column: 68, scope: !248)
!270 = !DILocation(line: 312, column: 65, scope: !248)
!271 = !DILocation(line: 314, column: 15, scope: !248)
!272 = !DILocation(line: 314, column: 2, scope: !248)
!273 = !DILocation(line: 314, column: 13, scope: !248)
!274 = !DILocation(line: 316, column: 1, scope: !248)
!275 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 318, type: !12, scopeLine: 319, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!276 = !DILocalVariable(name: "parent_node", scope: !275, file: !3, line: 320, type: !47)
!277 = !DILocation(line: 320, column: 9, scope: !275)
!278 = !DILocalVariable(name: "parent", scope: !275, file: !3, line: 321, type: !7)
!279 = !DILocation(line: 321, column: 10, scope: !275)
!280 = !DILocation(line: 321, column: 19, scope: !275)
!281 = !DILocation(line: 322, column: 16, scope: !275)
!282 = !DILocation(line: 322, column: 25, scope: !275)
!283 = !DILocation(line: 324, column: 28, scope: !275)
!284 = !DILocation(line: 324, column: 2, scope: !275)
!285 = !DILocation(line: 324, column: 14, scope: !275)
!286 = !DILocation(line: 325, column: 2, scope: !275)
!287 = !DILocation(line: 325, column: 20, scope: !275)
!288 = !DILocation(line: 326, column: 15, scope: !275)
!289 = !DILocation(line: 326, column: 2, scope: !275)
!290 = !DILocation(line: 326, column: 13, scope: !275)
!291 = !DILocation(line: 327, column: 26, scope: !275)
!292 = !DILocation(line: 327, column: 2, scope: !275)
!293 = !DILocation(line: 327, column: 12, scope: !275)
!294 = !DILocation(line: 328, column: 2, scope: !275)
!295 = !DILocation(line: 328, column: 18, scope: !275)
!296 = !DILocation(line: 330, column: 1, scope: !275)
!297 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 332, type: !12, scopeLine: 333, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!298 = !DILocalVariable(name: "sibling_node", scope: !297, file: !3, line: 334, type: !299)
!299 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 16)
!300 = !DILocation(line: 334, column: 10, scope: !297)
!301 = !DILocation(line: 336, column: 6, scope: !302)
!302 = distinct !DILexicalBlock(scope: !297, file: !3, line: 336, column: 6)
!303 = !DILocation(line: 336, column: 18, scope: !302)
!304 = !DILocation(line: 336, column: 6, scope: !297)
!305 = !DILocalVariable(name: "i", scope: !306, file: !3, line: 337, type: !176)
!306 = distinct !DILexicalBlock(scope: !302, file: !3, line: 336, column: 26)
!307 = !DILocation(line: 337, column: 7, scope: !306)
!308 = !DILocation(line: 337, column: 11, scope: !306)
!309 = !DILocation(line: 338, column: 19, scope: !306)
!310 = !DILocation(line: 338, column: 28, scope: !306)
!311 = !DILocation(line: 338, column: 16, scope: !306)
!312 = !DILocation(line: 340, column: 7, scope: !313)
!313 = distinct !DILexicalBlock(scope: !306, file: !3, line: 340, column: 7)
!314 = !DILocation(line: 340, column: 21, scope: !313)
!315 = !DILocation(line: 340, column: 31, scope: !313)
!316 = !DILocation(line: 340, column: 28, scope: !313)
!317 = !DILocation(line: 340, column: 7, scope: !306)
!318 = !DILocation(line: 342, column: 22, scope: !319)
!319 = distinct !DILexicalBlock(scope: !313, file: !3, line: 340, column: 43)
!320 = !DILocation(line: 342, column: 4, scope: !319)
!321 = !DILocation(line: 342, column: 20, scope: !319)
!322 = !DILocation(line: 344, column: 4, scope: !319)
!323 = !DILocation(line: 344, column: 14, scope: !319)
!324 = !DILocation(line: 345, column: 4, scope: !319)
!325 = !DILocation(line: 347, column: 7, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !3, line: 347, column: 7)
!327 = distinct !DILexicalBlock(scope: !313, file: !3, line: 346, column: 10)
!328 = !DILocation(line: 347, column: 21, scope: !326)
!329 = !DILocation(line: 347, column: 29, scope: !326)
!330 = !DILocation(line: 347, column: 7, scope: !327)
!331 = !DILocation(line: 348, column: 19, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !3, line: 347, column: 34)
!333 = !DILocation(line: 348, column: 33, scope: !332)
!334 = !DILocation(line: 348, column: 5, scope: !332)
!335 = !DILocation(line: 348, column: 17, scope: !332)
!336 = !DILocation(line: 349, column: 5, scope: !332)
!337 = !DILocation(line: 349, column: 15, scope: !332)
!338 = !DILocation(line: 350, column: 5, scope: !332)
!339 = !DILocation(line: 354, column: 2, scope: !306)
!340 = !DILocalVariable(name: "starting_node_idx", scope: !297, file: !3, line: 356, type: !7)
!341 = !DILocation(line: 356, column: 10, scope: !297)
!342 = !DILocation(line: 356, column: 39, scope: !297)
!343 = !DILocation(line: 357, column: 20, scope: !297)
!344 = !DILocation(line: 357, column: 2, scope: !297)
!345 = !DILocation(line: 357, column: 18, scope: !297)
!346 = !DILocation(line: 359, column: 6, scope: !347)
!347 = distinct !DILexicalBlock(scope: !297, file: !3, line: 359, column: 6)
!348 = !DILocation(line: 359, column: 16, scope: !347)
!349 = !DILocation(line: 359, column: 6, scope: !297)
!350 = !DILocation(line: 360, column: 3, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !3, line: 359, column: 24)
!352 = !DILocation(line: 360, column: 13, scope: !351)
!353 = !DILocation(line: 361, column: 2, scope: !351)
!354 = !DILocation(line: 362, column: 3, scope: !355)
!355 = distinct !DILexicalBlock(scope: !347, file: !3, line: 361, column: 9)
!356 = !DILocation(line: 362, column: 13, scope: !355)
!357 = !DILocation(line: 364, column: 1, scope: !297)
!358 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 367, type: !12, scopeLine: 368, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!359 = !DILocalVariable(name: "sibling_node", scope: !358, file: !3, line: 369, type: !299)
!360 = !DILocation(line: 369, column: 10, scope: !358)
!361 = !DILocalVariable(name: "i", scope: !358, file: !3, line: 371, type: !176)
!362 = !DILocation(line: 371, column: 6, scope: !358)
!363 = !DILocation(line: 371, column: 10, scope: !358)
!364 = !DILocation(line: 372, column: 18, scope: !358)
!365 = !DILocation(line: 372, column: 27, scope: !358)
!366 = !DILocation(line: 372, column: 15, scope: !358)
!367 = !DILocation(line: 374, column: 6, scope: !368)
!368 = distinct !DILexicalBlock(scope: !358, file: !3, line: 374, column: 6)
!369 = !DILocation(line: 374, column: 20, scope: !368)
!370 = !DILocation(line: 374, column: 28, scope: !368)
!371 = !DILocation(line: 374, column: 6, scope: !358)
!372 = !DILocalVariable(name: "next_sibling", scope: !373, file: !3, line: 375, type: !7)
!373 = distinct !DILexicalBlock(scope: !368, file: !3, line: 374, column: 36)
!374 = !DILocation(line: 375, column: 11, scope: !373)
!375 = !DILocation(line: 375, column: 26, scope: !373)
!376 = !DILocation(line: 375, column: 40, scope: !373)
!377 = !DILocation(line: 376, column: 17, scope: !373)
!378 = !DILocation(line: 376, column: 3, scope: !373)
!379 = !DILocation(line: 376, column: 15, scope: !373)
!380 = !DILocation(line: 378, column: 3, scope: !373)
!381 = !DILocation(line: 378, column: 13, scope: !373)
!382 = !DILocation(line: 380, column: 2, scope: !373)
!383 = !DILocalVariable(name: "sibling_node_obj", scope: !384, file: !3, line: 382, type: !47)
!384 = distinct !DILexicalBlock(scope: !368, file: !3, line: 380, column: 9)
!385 = !DILocation(line: 382, column: 10, scope: !384)
!386 = !DILocation(line: 382, column: 30, scope: !384)
!387 = !DILocation(line: 382, column: 29, scope: !384)
!388 = !DILocation(line: 383, column: 3, scope: !384)
!389 = !DILocation(line: 383, column: 22, scope: !384)
!390 = !DILocation(line: 385, column: 3, scope: !384)
!391 = !DILocation(line: 385, column: 13, scope: !384)
!392 = !DILocation(line: 387, column: 1, scope: !358)
!393 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 389, type: !12, scopeLine: 390, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!394 = !DILocation(line: 392, column: 6, scope: !395)
!395 = distinct !DILexicalBlock(scope: !393, file: !3, line: 392, column: 6)
!396 = !DILocation(line: 392, column: 21, scope: !395)
!397 = !DILocation(line: 392, column: 6, scope: !393)
!398 = !DILocation(line: 393, column: 3, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 392, column: 35)
!400 = !DILocation(line: 394, column: 3, scope: !399)
!401 = distinct !{!401, !400, !402}
!402 = !DILocation(line: 394, column: 12, scope: !399)
!403 = !DILocalVariable(name: "child", scope: !393, file: !3, line: 397, type: !7)
!404 = !DILocation(line: 397, column: 10, scope: !393)
!405 = !DILocation(line: 397, column: 18, scope: !393)
!406 = !DILocalVariable(name: "child_node", scope: !393, file: !3, line: 398, type: !47)
!407 = !DILocation(line: 398, column: 9, scope: !393)
!408 = !DILocation(line: 398, column: 22, scope: !393)
!409 = !DILocation(line: 399, column: 13, scope: !393)
!410 = !DILocalVariable(name: "cond", scope: !393, file: !3, line: 405, type: !47)
!411 = !DILocation(line: 405, column: 9, scope: !393)
!412 = !DILocation(line: 405, column: 16, scope: !393)
!413 = !DILocation(line: 407, column: 11, scope: !414)
!414 = distinct !DILexicalBlock(scope: !393, file: !3, line: 407, column: 6)
!415 = !DILocation(line: 407, column: 17, scope: !414)
!416 = !DILocation(line: 407, column: 6, scope: !393)
!417 = !DILocalVariable(name: "parent_node_obj", scope: !418, file: !3, line: 409, type: !47)
!418 = distinct !DILexicalBlock(scope: !414, file: !3, line: 407, column: 25)
!419 = !DILocation(line: 409, column: 10, scope: !418)
!420 = !DILocation(line: 409, column: 28, scope: !418)
!421 = !DILocation(line: 410, column: 27, scope: !418)
!422 = !DILocation(line: 410, column: 19, scope: !418)
!423 = !DILocation(line: 410, column: 25, scope: !418)
!424 = !DILocation(line: 412, column: 3, scope: !418)
!425 = !DILocation(line: 412, column: 12, scope: !418)
!426 = !DILocation(line: 412, column: 26, scope: !418)
!427 = !DILocation(line: 414, column: 2, scope: !418)
!428 = !DILocalVariable(name: "last_sibling_node", scope: !429, file: !3, line: 416, type: !47)
!429 = distinct !DILexicalBlock(scope: !414, file: !3, line: 414, column: 9)
!430 = !DILocation(line: 416, column: 10, scope: !429)
!431 = !DILocation(line: 416, column: 30, scope: !429)
!432 = !DILocation(line: 418, column: 31, scope: !429)
!433 = !DILocation(line: 418, column: 21, scope: !429)
!434 = !DILocation(line: 418, column: 29, scope: !429)
!435 = !DILocation(line: 419, column: 3, scope: !429)
!436 = !DILocation(line: 419, column: 12, scope: !429)
!437 = !DILocation(line: 419, column: 27, scope: !429)
!438 = !DILocation(line: 421, column: 2, scope: !393)
!439 = !DILocation(line: 421, column: 11, scope: !393)
!440 = !DILocation(line: 421, column: 24, scope: !393)
!441 = !DILocation(line: 422, column: 15, scope: !393)
!442 = !DILocation(line: 422, column: 2, scope: !393)
!443 = !DILocation(line: 422, column: 13, scope: !393)
!444 = !DILocation(line: 423, column: 2, scope: !393)
!445 = !DILocation(line: 423, column: 16, scope: !393)
!446 = !DILocation(line: 425, column: 1, scope: !393)
!447 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 427, type: !12, scopeLine: 428, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!448 = !DILocation(line: 429, column: 44, scope: !447)
!449 = !DILocation(line: 429, column: 2, scope: !447)
!450 = !DILocation(line: 429, column: 22, scope: !447)
!451 = !DILocation(line: 429, column: 35, scope: !447)
!452 = !DILocation(line: 429, column: 42, scope: !447)
!453 = !DILocation(line: 431, column: 4, scope: !447)
!454 = !DILocation(line: 431, column: 2, scope: !447)
!455 = !DILocation(line: 432, column: 1, scope: !447)
!456 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 434, type: !12, scopeLine: 435, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!457 = !DILocation(line: 436, column: 2, scope: !456)
!458 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 439, type: !12, scopeLine: 439, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!459 = !DILocation(line: 441, column: 1, scope: !458)
!460 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 443, type: !461, scopeLine: 443, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!461 = !DISubroutineType(types: !462)
!462 = !{!176}
!463 = !DILocation(line: 445, column: 16, scope: !460)
!464 = !DILocation(line: 446, column: 10, scope: !460)
!465 = !DILocation(line: 447, column: 12, scope: !460)
!466 = !DILocation(line: 448, column: 5, scope: !460)
!467 = !DILocation(line: 450, column: 2, scope: !460)
!468 = !DILocation(line: 452, column: 2, scope: !460)
!469 = !DILocation(line: 452, column: 8, scope: !460)
!470 = !DILocation(line: 452, column: 21, scope: !460)
!471 = !DILocation(line: 454, column: 3, scope: !472)
!472 = distinct !DILexicalBlock(scope: !460, file: !3, line: 452, column: 35)
!473 = !DILocation(line: 456, column: 7, scope: !474)
!474 = distinct !DILexicalBlock(scope: !472, file: !3, line: 456, column: 7)
!475 = !DILocation(line: 456, column: 18, scope: !474)
!476 = !DILocation(line: 456, column: 7, scope: !472)
!477 = !DILocation(line: 458, column: 4, scope: !478)
!478 = distinct !DILexicalBlock(scope: !474, file: !3, line: 456, column: 23)
!479 = !DILocation(line: 460, column: 3, scope: !478)
!480 = !DILocation(line: 462, column: 3, scope: !472)
!481 = !DILocation(line: 464, column: 4, scope: !482)
!482 = distinct !DILexicalBlock(scope: !472, file: !3, line: 462, column: 13)
!483 = !DILocation(line: 466, column: 4, scope: !482)
!484 = !DILocation(line: 468, column: 4, scope: !482)
!485 = !DILocation(line: 470, column: 5, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !3, line: 468, column: 7)
!487 = !DILocation(line: 472, column: 4, scope: !486)
!488 = !DILocation(line: 472, column: 13, scope: !482)
!489 = !DILocation(line: 472, column: 24, scope: !482)
!490 = distinct !{!490, !484, !491}
!491 = !DILocation(line: 472, column: 28, scope: !482)
!492 = !DILocation(line: 474, column: 8, scope: !493)
!493 = distinct !DILexicalBlock(scope: !482, file: !3, line: 474, column: 8)
!494 = !DILocation(line: 474, column: 19, scope: !493)
!495 = !DILocation(line: 474, column: 8, scope: !482)
!496 = !DILocation(line: 475, column: 5, scope: !493)
!497 = distinct !{!497, !480, !498}
!498 = !DILocation(line: 476, column: 3, scope: !472)
!499 = !DILocation(line: 478, column: 7, scope: !500)
!500 = distinct !DILexicalBlock(scope: !472, file: !3, line: 478, column: 7)
!501 = !DILocation(line: 478, column: 18, scope: !500)
!502 = !DILocation(line: 478, column: 7, scope: !472)
!503 = !DILocation(line: 479, column: 4, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !3, line: 478, column: 24)
!505 = !DILocation(line: 481, column: 5, scope: !506)
!506 = distinct !DILexicalBlock(scope: !504, file: !3, line: 479, column: 6)
!507 = !DILocation(line: 484, column: 4, scope: !506)
!508 = !DILocation(line: 484, column: 13, scope: !504)
!509 = !DILocation(line: 484, column: 24, scope: !504)
!510 = distinct !{!510, !503, !511}
!511 = !DILocation(line: 484, column: 28, scope: !504)
!512 = !DILocation(line: 485, column: 3, scope: !504)
!513 = !DILocation(line: 487, column: 3, scope: !472)
!514 = !DILocation(line: 489, column: 3, scope: !472)
!515 = distinct !{!515, !468, !516}
!516 = !DILocation(line: 491, column: 2, scope: !460)
!517 = !DILocation(line: 493, column: 2, scope: !460)
!518 = !DILocation(line: 494, column: 1, scope: !460)
