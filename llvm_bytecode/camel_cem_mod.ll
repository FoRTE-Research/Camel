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
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !9
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !14
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !21
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
  call void @camel_init(), !dbg !118
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !119
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !120
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !119
  call void @__restore_registers(i16* %arraydecay), !dbg !121
  ret void, !dbg !122
}

declare dso_local void @__crt0_start(...) #1

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !123 {
entry:
  %node = alloca %struct._node_t, align 2
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !124
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !124
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !124
  store i16 0, i16* %parent_next, align 2, !dbg !125
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !126
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !126
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !126
  store i16 0, i16* %out_len, align 2, !dbg !127
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !128
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !128
  %letter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !128
  store i16 0, i16* %letter, align 2, !dbg !129
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !130
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !130
  %prev_sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !130
  store i16 0, i16* %prev_sample, align 2, !dbg !131
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !132
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !132
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !132
  store i16 0, i16* %letter_idx, align 2, !dbg !133
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !134
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !134
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !134
  store i16 1, i16* %sample_count, align 2, !dbg !135
  br label %while.cond, !dbg !136

while.cond:                                       ; preds = %while.body, %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !137
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !137
  %letter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 0, !dbg !137
  %7 = load i16, i16* %letter7, align 2, !dbg !137
  %cmp = icmp ult i16 %7, 64, !dbg !138
  br i1 %cmp, label %while.body, label %while.end, !dbg !136

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct._node_t* %node, metadata !139, metadata !DIExpression()), !dbg !141
  %letter8 = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 0, !dbg !142
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !143
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !143
  %letter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !143
  %9 = load i16, i16* %letter10, align 2, !dbg !143
  store i16 %9, i16* %letter8, align 2, !dbg !142
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 1, !dbg !142
  store i16 0, i16* %sibling, align 2, !dbg !142
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %node, i32 0, i32 2, !dbg !142
  store i16 0, i16* %child, align 2, !dbg !142
  call void @llvm.dbg.declare(metadata i16* %i, metadata !144, metadata !DIExpression()), !dbg !146
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !147
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !147
  %letter12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 0, !dbg !147
  %11 = load i16, i16* %letter12, align 2, !dbg !147
  store i16 %11, i16* %i, align 2, !dbg !146
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !148
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !148
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !148
  %13 = load i16, i16* %i, align 2, !dbg !149
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %13, !dbg !148
  %14 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !150
  %15 = bitcast %struct._node_t* %node to i8*, !dbg !150
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %14, i8* align 2 %15, i16 6, i1 false), !dbg !150
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !151
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !151
  %letter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 0, !dbg !151
  %17 = load i16, i16* %letter15, align 2, !dbg !152
  %inc = add i16 %17, 1, !dbg !152
  store i16 %inc, i16* %letter15, align 2, !dbg !152
  br label %while.cond, !dbg !136, !llvm.loop !153

while.end:                                        ; preds = %while.cond
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !155
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !155
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 4, !dbg !155
  store i16 64, i16* %node_count, align 2, !dbg !156
  ret void, !dbg !157
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !158 {
entry:
  %next_letter_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %next_letter_idx, metadata !159, metadata !DIExpression()), !dbg !160
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !161
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !161
  %letter_idx = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !161
  %1 = load i16, i16* %letter_idx, align 2, !dbg !161
  %add = add i16 %1, 1, !dbg !162
  store i16 %add, i16* %next_letter_idx, align 2, !dbg !160
  %2 = load i16, i16* %next_letter_idx, align 2, !dbg !163
  %cmp = icmp eq i16 %2, 2, !dbg !165
  br i1 %cmp, label %if.then, label %if.end, !dbg !166

if.then:                                          ; preds = %entry
  store i16 0, i16* %next_letter_idx, align 2, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !169
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !169
  %letter_idx2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !169
  %4 = load i16, i16* %letter_idx2, align 2, !dbg !169
  %cmp3 = icmp eq i16 %4, 0, !dbg !171
  br i1 %cmp3, label %if.then4, label %if.else, !dbg !172

if.then4:                                         ; preds = %if.end
  %5 = load i16, i16* %next_letter_idx, align 2, !dbg !173
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !175
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !175
  %letter_idx6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !175
  store i16 %5, i16* %letter_idx6, align 2, !dbg !176
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !177
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !177
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 16, !dbg !177
  store i16 0, i16* %check, align 2, !dbg !178
  br label %if.end12, !dbg !179

if.else:                                          ; preds = %if.end
  %8 = load i16, i16* %next_letter_idx, align 2, !dbg !180
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !182
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !182
  %letter_idx9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !182
  store i16 %8, i16* %letter_idx9, align 2, !dbg !183
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !184
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !184
  %check11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 16, !dbg !184
  store i16 1, i16* %check11, align 2, !dbg !185
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then4
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_measure_temp() #0 !dbg !187 {
entry:
  %prev_sample = alloca i16, align 2
  %sample = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample, metadata !188, metadata !DIExpression()), !dbg !189
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !190
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !190
  %prev_sample1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !190
  %1 = load i16, i16* %prev_sample1, align 2, !dbg !190
  store i16 %1, i16* %prev_sample, align 2, !dbg !191
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !192, metadata !DIExpression()), !dbg !193
  %2 = load i16, i16* %prev_sample, align 2, !dbg !194
  %call = call i16 @acquire_sample(i16 %2), !dbg !195
  store i16 %call, i16* %sample, align 2, !dbg !193
  %3 = load i16, i16* %sample, align 2, !dbg !196
  store i16 %3, i16* %prev_sample, align 2, !dbg !197
  %4 = load i16, i16* %prev_sample, align 2, !dbg !198
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !199
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !199
  %prev_sample3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !199
  store i16 %4, i16* %prev_sample3, align 2, !dbg !200
  %6 = load i16, i16* %sample, align 2, !dbg !201
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !202
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !202
  %sample5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !202
  store i16 %6, i16* %sample5, align 2, !dbg !203
  ret void, !dbg !204
}

; Function Attrs: noinline nounwind optnone
define internal i16 @acquire_sample(i16 %prev_sample) #0 !dbg !205 {
entry:
  %prev_sample.addr = alloca i16, align 2
  %sample = alloca i16, align 2
  store i16 %prev_sample, i16* %prev_sample.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %prev_sample.addr, metadata !208, metadata !DIExpression()), !dbg !209
  call void @llvm.dbg.declare(metadata i16* %sample, metadata !210, metadata !DIExpression()), !dbg !211
  %0 = load i16, i16* %prev_sample.addr, align 2, !dbg !212
  %add = add i16 %0, 1, !dbg !213
  %and = and i16 %add, 3, !dbg !214
  store i16 %and, i16* %sample, align 2, !dbg !211
  %1 = load i16, i16* %sample, align 2, !dbg !215
  ret i16 %1, !dbg !216
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_letterize() #0 !dbg !217 {
entry:
  %letter_idx = alloca i16, align 2
  %letter_shift = alloca i16, align 2
  %letter = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %letter_idx, metadata !218, metadata !DIExpression()), !dbg !219
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !220
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !220
  %letter_idx1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !220
  %1 = load i16, i16* %letter_idx1, align 2, !dbg !220
  store i16 %1, i16* %letter_idx, align 2, !dbg !219
  %2 = load i16, i16* %letter_idx, align 2, !dbg !221
  %cmp = icmp eq i16 %2, 0, !dbg !223
  br i1 %cmp, label %if.then, label %if.else, !dbg !224

if.then:                                          ; preds = %entry
  store i16 2, i16* %letter_idx, align 2, !dbg !225
  br label %if.end, !dbg !226

if.else:                                          ; preds = %entry
  %3 = load i16, i16* %letter_idx, align 2, !dbg !227
  %dec = add i16 %3, -1, !dbg !227
  store i16 %dec, i16* %letter_idx, align 2, !dbg !227
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i16* %letter_shift, metadata !228, metadata !DIExpression()), !dbg !229
  %4 = load i16, i16* %letter_idx, align 2, !dbg !230
  %mul = mul i16 8, %4, !dbg !231
  store i16 %mul, i16* %letter_shift, align 2, !dbg !229
  call void @llvm.dbg.declare(metadata i16* %letter, metadata !232, metadata !DIExpression()), !dbg !233
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !234
  %sample = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 6, !dbg !234
  %6 = load i16, i16* %sample, align 2, !dbg !234
  %7 = load i16, i16* %letter_shift, align 2, !dbg !235
  %shl = shl i16 63, %7, !dbg !236
  %and = and i16 %6, %shl, !dbg !237
  %8 = load i16, i16* %letter_shift, align 2, !dbg !238
  %shr = lshr i16 %and, %8, !dbg !239
  store i16 %shr, i16* %letter, align 2, !dbg !233
  %9 = load i16, i16* %letter, align 2, !dbg !240
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !241
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !241
  store i16 %9, i16* %letter4, align 2, !dbg !242
  ret void, !dbg !243
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_compress() #0 !dbg !244 {
entry:
  %parent_node = alloca %struct._node_t, align 2
  %parent = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node, metadata !245, metadata !DIExpression()), !dbg !246
  call void @llvm.dbg.declare(metadata i16* %parent, metadata !247, metadata !DIExpression()), !dbg !248
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !249
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !249
  %1 = load i16, i16* %parent_next, align 2, !dbg !249
  store i16 %1, i16* %parent, align 2, !dbg !248
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !250
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !250
  %3 = load i16, i16* %parent, align 2, !dbg !251
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !250
  %4 = bitcast %struct._node_t* %parent_node to i8*, !dbg !250
  %5 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !250
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %4, i8* align 2 %5, i16 6, i1 false), !dbg !250
  %child = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !252
  %6 = load i16, i16* %child, align 2, !dbg !252
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !253
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !253
  store i16 %6, i16* %sibling, align 2, !dbg !254
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !255
  %parent_node4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !255
  %9 = bitcast %struct._node_t* %parent_node4 to i8*, !dbg !256
  %10 = bitcast %struct._node_t* %parent_node to i8*, !dbg !256
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %9, i8* align 2 %10, i16 6, i1 false), !dbg !256
  %11 = load i16, i16* %parent, align 2, !dbg !257
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !258
  %parent6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 10, !dbg !258
  store i16 %11, i16* %parent6, align 2, !dbg !259
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node, i32 0, i32 2, !dbg !260
  %13 = load i16, i16* %child7, align 2, !dbg !260
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !261
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !261
  %child9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !261
  store i16 %13, i16* %child9, align 2, !dbg !262
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !263
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !263
  %sample_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 7, !dbg !263
  %16 = load i16, i16* %sample_count, align 2, !dbg !264
  %inc = add i16 %16, 1, !dbg !264
  store i16 %inc, i16* %sample_count, align 2, !dbg !264
  ret void, !dbg !265
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_find_sibling() #0 !dbg !266 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %starting_node_idx = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !267, metadata !DIExpression()), !dbg !269
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !270
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !270
  %1 = load i16, i16* %sibling, align 2, !dbg !270
  %cmp = icmp ne i16 %1, 0, !dbg !272
  br i1 %cmp, label %if.then, label %if.end21, !dbg !273

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %i, metadata !274, metadata !DIExpression()), !dbg !276
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !277
  %sibling2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !277
  %3 = load i16, i16* %sibling2, align 2, !dbg !277
  store i16 %3, i16* %i, align 2, !dbg !276
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !278
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 5, !dbg !278
  %5 = load i16, i16* %i, align 2, !dbg !279
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %5, !dbg !278
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !280
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !281
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 0, !dbg !283
  %7 = load i16, i16* %letter, align 2, !dbg !283
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !284
  %letter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !284
  %9 = load i16, i16* %letter5, align 2, !dbg !284
  %cmp6 = icmp eq i16 %7, %9, !dbg !285
  br i1 %cmp6, label %if.then7, label %if.else, !dbg !286

if.then7:                                         ; preds = %if.then
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !287
  %sibling9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !287
  %11 = load i16, i16* %sibling9, align 2, !dbg !287
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !289
  %parent_next = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 11, !dbg !289
  store i16 %11, i16* %parent_next, align 2, !dbg !290
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !291
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 16, !dbg !291
  store i16 0, i16* %check, align 2, !dbg !292
  br label %if.end34, !dbg !293

if.else:                                          ; preds = %if.then
  %14 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !294
  %sibling12 = getelementptr inbounds %struct._node_t, %struct._node_t* %14, i32 0, i32 1, !dbg !297
  %15 = load i16, i16* %sibling12, align 2, !dbg !297
  %cmp13 = icmp ne i16 %15, 0, !dbg !298
  br i1 %cmp13, label %if.then14, label %if.end, !dbg !299

if.then14:                                        ; preds = %if.else
  %16 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !300
  %sibling15 = getelementptr inbounds %struct._node_t, %struct._node_t* %16, i32 0, i32 1, !dbg !302
  %17 = load i16, i16* %sibling15, align 2, !dbg !302
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !303
  %sibling17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !303
  store i16 %17, i16* %sibling17, align 2, !dbg !304
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !305
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !305
  %check19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 16, !dbg !305
  store i16 1, i16* %check19, align 2, !dbg !306
  br label %if.end34, !dbg !307

if.end:                                           ; preds = %if.else
  br label %if.end20

if.end20:                                         ; preds = %if.end
  br label %if.end21, !dbg !308

if.end21:                                         ; preds = %if.end20, %entry
  call void @llvm.dbg.declare(metadata i16* %starting_node_idx, metadata !309, metadata !DIExpression()), !dbg !310
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !311
  %letter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !311
  %21 = load i16, i16* %letter23, align 2, !dbg !311
  store i16 %21, i16* %starting_node_idx, align 2, !dbg !310
  %22 = load i16, i16* %starting_node_idx, align 2, !dbg !312
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !313
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !313
  %parent_next25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 11, !dbg !313
  store i16 %22, i16* %parent_next25, align 2, !dbg !314
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !315
  %child = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !315
  %25 = load i16, i16* %child, align 2, !dbg !315
  %cmp27 = icmp eq i16 %25, 0, !dbg !317
  br i1 %cmp27, label %if.then28, label %if.else31, !dbg !318

if.then28:                                        ; preds = %if.end21
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !319
  %check30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 16, !dbg !319
  store i16 2, i16* %check30, align 2, !dbg !321
  br label %if.end34, !dbg !322

if.else31:                                        ; preds = %if.end21
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !323
  %check33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 16, !dbg !323
  store i16 3, i16* %check33, align 2, !dbg !325
  br label %if.end34

if.end34:                                         ; preds = %if.then7, %if.then14, %if.else31, %if.then28
  ret void, !dbg !326
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_node() #0 !dbg !327 {
entry:
  %sibling_node = alloca %struct._node_t*, align 2
  %i = alloca i16, align 2
  %next_sibling = alloca i16, align 2
  %sibling_node_obj = alloca %struct._node_t, align 2
  call void @llvm.dbg.declare(metadata %struct._node_t** %sibling_node, metadata !328, metadata !DIExpression()), !dbg !329
  call void @llvm.dbg.declare(metadata i16* %i, metadata !330, metadata !DIExpression()), !dbg !331
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !332
  %sibling = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !332
  %1 = load i16, i16* %sibling, align 2, !dbg !332
  store i16 %1, i16* %i, align 2, !dbg !331
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !333
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !333
  %3 = load i16, i16* %i, align 2, !dbg !334
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %3, !dbg !333
  store %struct._node_t* %arrayidx, %struct._node_t** %sibling_node, align 2, !dbg !335
  %4 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !336
  %sibling2 = getelementptr inbounds %struct._node_t, %struct._node_t* %4, i32 0, i32 1, !dbg !338
  %5 = load i16, i16* %sibling2, align 2, !dbg !338
  %cmp = icmp ne i16 %5, 0, !dbg !339
  br i1 %cmp, label %if.then, label %if.else, !dbg !340

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %next_sibling, metadata !341, metadata !DIExpression()), !dbg !343
  %6 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !344
  %sibling3 = getelementptr inbounds %struct._node_t, %struct._node_t* %6, i32 0, i32 1, !dbg !345
  %7 = load i16, i16* %sibling3, align 2, !dbg !345
  store i16 %7, i16* %next_sibling, align 2, !dbg !343
  %8 = load i16, i16* %next_sibling, align 2, !dbg !346
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !347
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !347
  %sibling5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !347
  store i16 %8, i16* %sibling5, align 2, !dbg !348
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !349
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !349
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 16, !dbg !349
  store i16 0, i16* %check, align 2, !dbg !350
  br label %if.end, !dbg !351

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._node_t* %sibling_node_obj, metadata !352, metadata !DIExpression()), !dbg !354
  %11 = load %struct._node_t*, %struct._node_t** %sibling_node, align 2, !dbg !355
  %12 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !356
  %13 = bitcast %struct._node_t* %11 to i8*, !dbg !356
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 6, i1 false), !dbg !356
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !357
  %sibling_node8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 14, !dbg !357
  %15 = bitcast %struct._node_t* %sibling_node8 to i8*, !dbg !358
  %16 = bitcast %struct._node_t* %sibling_node_obj to i8*, !dbg !358
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %15, i8* align 2 %16, i16 6, i1 false), !dbg !358
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !359
  %check10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 16, !dbg !359
  store i16 1, i16* %check10, align 2, !dbg !360
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !361
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add_insert() #0 !dbg !362 {
entry:
  %child = alloca i16, align 2
  %child_node = alloca %struct._node_t, align 2
  %cond = alloca %struct._node_t, align 2
  %parent_node_obj = alloca %struct._node_t, align 2
  %last_sibling_node = alloca %struct._node_t, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !363
  %node_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !363
  %1 = load i16, i16* %node_count, align 2, !dbg !363
  %cmp = icmp eq i16 %1, 128, !dbg !365
  br i1 %cmp, label %if.then, label %if.end, !dbg !366

if.then:                                          ; preds = %entry
  call void @task_done(), !dbg !367
  br label %while.body, !dbg !369

while.body:                                       ; preds = %if.then, %while.body
  br label %while.body, !dbg !369, !llvm.loop !370

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i16* %child, metadata !372, metadata !DIExpression()), !dbg !373
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !374
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !374
  %node_count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !374
  %3 = load i16, i16* %node_count2, align 2, !dbg !374
  store i16 %3, i16* %child, align 2, !dbg !373
  call void @llvm.dbg.declare(metadata %struct._node_t* %child_node, metadata !375, metadata !DIExpression()), !dbg !376
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 0, !dbg !377
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !378
  %letter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !378
  %5 = load i16, i16* %letter4, align 2, !dbg !378
  store i16 %5, i16* %letter, align 2, !dbg !377
  %sibling = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 1, !dbg !377
  store i16 0, i16* %sibling, align 2, !dbg !377
  %child5 = getelementptr inbounds %struct._node_t, %struct._node_t* %child_node, i32 0, i32 2, !dbg !377
  store i16 0, i16* %child5, align 2, !dbg !377
  call void @llvm.dbg.declare(metadata %struct._node_t* %cond, metadata !379, metadata !DIExpression()), !dbg !380
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !381
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !381
  %parent_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !381
  %7 = bitcast %struct._node_t* %cond to i8*, !dbg !381
  %8 = bitcast %struct._node_t* %parent_node to i8*, !dbg !381
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %7, i8* align 2 %8, i16 6, i1 false), !dbg !381
  %child7 = getelementptr inbounds %struct._node_t, %struct._node_t* %cond, i32 0, i32 2, !dbg !382
  %9 = load i16, i16* %child7, align 2, !dbg !382
  %cmp8 = icmp eq i16 %9, 0, !dbg !384
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !385

if.then9:                                         ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %parent_node_obj, metadata !386, metadata !DIExpression()), !dbg !388
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !389
  %parent_node11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 12, !dbg !389
  %11 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !389
  %12 = bitcast %struct._node_t* %parent_node11 to i8*, !dbg !389
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %12, i16 6, i1 false), !dbg !389
  %13 = load i16, i16* %child, align 2, !dbg !390
  %child12 = getelementptr inbounds %struct._node_t, %struct._node_t* %parent_node_obj, i32 0, i32 2, !dbg !391
  store i16 %13, i16* %child12, align 2, !dbg !392
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !393
  %dict = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !393
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !394
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !394
  %parent = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 10, !dbg !394
  %16 = load i16, i16* %parent, align 2, !dbg !394
  %arrayidx = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict, i16 0, i16 %16, !dbg !393
  %17 = bitcast %struct._node_t* %arrayidx to i8*, !dbg !395
  %18 = bitcast %struct._node_t* %parent_node_obj to i8*, !dbg !395
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %17, i8* align 2 %18, i16 6, i1 false), !dbg !395
  br label %if.end22, !dbg !396

if.else:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct._node_t* %last_sibling_node, metadata !397, metadata !DIExpression()), !dbg !399
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !400
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !400
  %sibling_node = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 14, !dbg !400
  %20 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !400
  %21 = bitcast %struct._node_t* %sibling_node to i8*, !dbg !400
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %20, i8* align 2 %21, i16 6, i1 false), !dbg !400
  %22 = load i16, i16* %child, align 2, !dbg !401
  %sibling16 = getelementptr inbounds %struct._node_t, %struct._node_t* %last_sibling_node, i32 0, i32 1, !dbg !402
  store i16 %22, i16* %sibling16, align 2, !dbg !403
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !404
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !404
  %dict18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 5, !dbg !404
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !405
  %sibling20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !405
  %25 = load i16, i16* %sibling20, align 2, !dbg !405
  %arrayidx21 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict18, i16 0, i16 %25, !dbg !404
  %26 = bitcast %struct._node_t* %arrayidx21 to i8*, !dbg !406
  %27 = bitcast %struct._node_t* %last_sibling_node to i8*, !dbg !406
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %26, i8* align 2 %27, i16 6, i1 false), !dbg !406
  br label %if.end22

if.end22:                                         ; preds = %if.else, %if.then9
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !407
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !407
  %dict24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 5, !dbg !407
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !408
  %child26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !408
  %30 = load i16, i16* %child26, align 2, !dbg !408
  %arrayidx27 = getelementptr inbounds [128 x %struct._node_t], [128 x %struct._node_t]* %dict24, i16 0, i16 %30, !dbg !407
  %31 = bitcast %struct._node_t* %arrayidx27 to i8*, !dbg !409
  %32 = bitcast %struct._node_t* %child_node to i8*, !dbg !409
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %31, i8* align 2 %32, i16 6, i1 false), !dbg !409
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !410
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !410
  %parent29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 10, !dbg !410
  %34 = load i16, i16* %parent29, align 2, !dbg !410
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !411
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !411
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 15, !dbg !411
  store i16 %34, i16* %symbol, align 2, !dbg !412
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !413
  %node_count32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 4, !dbg !413
  %37 = load i16, i16* %node_count32, align 2, !dbg !414
  %inc = add i16 %37, 1, !dbg !414
  store i16 %inc, i16* %node_count32, align 2, !dbg !414
  ret void, !dbg !415
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_append_compressed() #0 !dbg !416 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !417
  %symbol = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 15, !dbg !417
  %1 = load i16, i16* %symbol, align 2, !dbg !417
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !418
  %compressed_data = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !418
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !419
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !419
  %4 = load i16, i16* %out_len, align 2, !dbg !419
  %arrayidx = getelementptr inbounds [16 x %struct._node_t], [16 x %struct._node_t]* %compressed_data, i16 0, i16 %4, !dbg !418
  %letter = getelementptr inbounds %struct._node_t, %struct._node_t* %arrayidx, i32 0, i32 0, !dbg !420
  store i16 %1, i16* %letter, align 2, !dbg !421
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !422
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !422
  %out_len4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !422
  %6 = load i16, i16* %out_len4, align 2, !dbg !423
  %inc = add i16 %6, 1, !dbg !423
  store i16 %inc, i16* %out_len4, align 2, !dbg !423
  ret void, !dbg !424
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !425 {
entry:
  call void @exit(i16 0) #6, !dbg !426
  unreachable, !dbg !426
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !427 {
entry:
  ret void, !dbg !428
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !429 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !432
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !433
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !434
  call void @camel_init(), !dbg !435
  call void @task_init(), !dbg !436
  br label %do.body, !dbg !436

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !437
  %cmp = icmp eq i16 %0, 1, !dbg !437
  br i1 %cmp, label %if.then, label %if.else, !dbg !440

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !441
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !441
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !441
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !441
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !441
  call void @__dump_registers(i16* %arraydecay), !dbg !441
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !441
  br label %if.end, !dbg !441

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !443
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !443
  %reg_file1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !443
  %arraydecay2 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file1, i16 0, i16 0, !dbg !443
  call void @__dump_registers(i16* %arraydecay2), !dbg !443
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !443
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !440

do.end:                                           ; preds = %if.end
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i32 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals1 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i32 0, i32 1
  %BCast3 = bitcast %struct.camel_global_t* %globals2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast, i8* align 2 %BCast3, i16 902, i1 false), !dbg !436
  call void @task_commit(), !dbg !436
  br label %while.cond, !dbg !445

while.cond:                                       ; preds = %do.end113, %do.end
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !446
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !446
  %out_len = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !446
  %4 = load i16, i16* %out_len, align 2, !dbg !446
  %cmp3 = icmp ult i16 %4, 16, !dbg !447
  br i1 %cmp3, label %while.body, label %while.end114, !dbg !445

while.body:                                       ; preds = %while.cond
  %unsafe4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe4, i32 0, i32 1
  %BCast6 = bitcast %struct.camel_global_t* %globals5 to i8*
  %safe7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe7, i32 0, i32 1
  %BCast9 = bitcast %struct.camel_global_t* %globals8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast6, i8* align 2 %BCast9, i16 902, i1 false), !dbg !448
  call void @task_sample(), !dbg !448
  br label %do.body4, !dbg !448

do.body4:                                         ; preds = %while.body
  %5 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !450
  %cmp5 = icmp eq i16 %5, 1, !dbg !450
  br i1 %cmp5, label %if.then6, label %if.else9, !dbg !453

if.then6:                                         ; preds = %do.body4
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !454
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !454
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !454
  %reg_file7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 0, !dbg !454
  %arraydecay8 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file7, i16 0, i16 0, !dbg !454
  call void @__dump_registers(i16* %arraydecay8), !dbg !454
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !454
  br label %if.end12, !dbg !454

if.else9:                                         ; preds = %do.body4
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !456
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !456
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !456
  %reg_file10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 0, !dbg !456
  %arraydecay11 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file10, i16 0, i16 0, !dbg !456
  call void @__dump_registers(i16* %arraydecay11), !dbg !456
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !456
  br label %if.end12

if.end12:                                         ; preds = %if.else9, %if.then6
  br label %do.end13, !dbg !453

do.end13:                                         ; preds = %if.end12
  call void @task_commit(), !dbg !448
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !458
  %check = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 16, !dbg !458
  %9 = load i16, i16* %check, align 2, !dbg !458
  %cmp15 = icmp eq i16 %9, 0, !dbg !460
  br i1 %cmp15, label %if.then16, label %if.end27, !dbg !461

if.then16:                                        ; preds = %do.end13
  %unsafe10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe10, i32 0, i32 1
  %BCast12 = bitcast %struct.camel_global_t* %globals11 to i8*
  %safe13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe13, i32 0, i32 1
  %BCast16 = bitcast %struct.camel_global_t* %globals15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast12, i8* align 2 %BCast16, i16 902, i1 false), !dbg !462
  call void @task_measure_temp(), !dbg !462
  br label %do.body17, !dbg !462

do.body17:                                        ; preds = %if.then16
  %10 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !464
  %cmp18 = icmp eq i16 %10, 1, !dbg !464
  br i1 %cmp18, label %if.then19, label %if.else22, !dbg !467

if.then19:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !468
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !468
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %reg_file20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 0, !dbg !468
  %arraydecay21 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file20, i16 0, i16 0, !dbg !468
  call void @__dump_registers(i16* %arraydecay21), !dbg !468
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !468
  br label %if.end25, !dbg !468

if.else22:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !470
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !470
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !470
  %reg_file23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !470
  %arraydecay24 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file23, i16 0, i16 0, !dbg !470
  call void @__dump_registers(i16* %arraydecay24), !dbg !470
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !470
  br label %if.end25

if.end25:                                         ; preds = %if.else22, %if.then19
  br label %do.end26, !dbg !467

do.end26:                                         ; preds = %if.end25
  call void @task_commit(), !dbg !462
  br label %if.end27, !dbg !472

if.end27:                                         ; preds = %do.end26, %do.end13
  br label %while.body29, !dbg !473

while.body29:                                     ; preds = %if.end27, %if.end69
  %unsafe17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe17, i32 0, i32 1
  %BCast19 = bitcast %struct.camel_global_t* %globals18 to i8*
  %safe20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe20, i32 0, i32 1
  %BCast22 = bitcast %struct.camel_global_t* %globals21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast19, i8* align 2 %BCast22, i16 902, i1 false), !dbg !474
  call void @task_letterize(), !dbg !474
  br label %do.body30, !dbg !474

do.body30:                                        ; preds = %while.body29
  %13 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !476
  %cmp31 = icmp eq i16 %13, 1, !dbg !476
  br i1 %cmp31, label %if.then32, label %if.else35, !dbg !479

if.then32:                                        ; preds = %do.body30
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !480
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !480
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !480
  %reg_file33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !480
  %arraydecay34 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file33, i16 0, i16 0, !dbg !480
  call void @__dump_registers(i16* %arraydecay34), !dbg !480
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !480
  br label %if.end38, !dbg !480

if.else35:                                        ; preds = %do.body30
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !482
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !482
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !482
  %reg_file36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 0, !dbg !482
  %arraydecay37 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file36, i16 0, i16 0, !dbg !482
  call void @__dump_registers(i16* %arraydecay37), !dbg !482
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !482
  br label %if.end38

if.end38:                                         ; preds = %if.else35, %if.then32
  br label %do.end39, !dbg !479

do.end39:                                         ; preds = %if.end38
  call void @task_commit(), !dbg !474
  %unsafe23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe23, i32 0, i32 1
  %BCast25 = bitcast %struct.camel_global_t* %globals24 to i8*
  %safe26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe26, i32 0, i32 1
  %BCast28 = bitcast %struct.camel_global_t* %globals27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast25, i8* align 2 %BCast28, i16 902, i1 false), !dbg !484
  call void @task_compress(), !dbg !484
  br label %do.body40, !dbg !484

do.body40:                                        ; preds = %do.end39
  %16 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !485
  %cmp41 = icmp eq i16 %16, 1, !dbg !485
  br i1 %cmp41, label %if.then42, label %if.else45, !dbg !488

if.then42:                                        ; preds = %do.body40
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !489
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !489
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %reg_file43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 0, !dbg !489
  %arraydecay44 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file43, i16 0, i16 0, !dbg !489
  call void @__dump_registers(i16* %arraydecay44), !dbg !489
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !489
  br label %if.end48, !dbg !489

if.else45:                                        ; preds = %do.body40
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !491
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !491
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %reg_file46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !491
  %arraydecay47 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file46, i16 0, i16 0, !dbg !491
  call void @__dump_registers(i16* %arraydecay47), !dbg !491
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !491
  br label %if.end48

if.end48:                                         ; preds = %if.else45, %if.then42
  br label %do.end49, !dbg !488

do.end49:                                         ; preds = %if.end48
  call void @task_commit(), !dbg !484
  br label %do.body50, !dbg !493

do.body50:                                        ; preds = %do.cond, %do.end49
  %unsafe29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe29, i32 0, i32 1
  %BCast31 = bitcast %struct.camel_global_t* %globals30 to i8*
  %safe32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe32, i32 0, i32 1
  %BCast34 = bitcast %struct.camel_global_t* %globals33 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast31, i8* align 2 %BCast34, i16 902, i1 false), !dbg !494
  call void @task_find_sibling(), !dbg !494
  br label %do.body51, !dbg !494

do.body51:                                        ; preds = %do.body50
  %19 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !496
  %cmp52 = icmp eq i16 %19, 1, !dbg !496
  br i1 %cmp52, label %if.then53, label %if.else56, !dbg !499

if.then53:                                        ; preds = %do.body51
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !500
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !500
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !500
  %reg_file54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 0, !dbg !500
  %arraydecay55 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file54, i16 0, i16 0, !dbg !500
  call void @__dump_registers(i16* %arraydecay55), !dbg !500
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !500
  br label %if.end59, !dbg !500

if.else56:                                        ; preds = %do.body51
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !502
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !502
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !502
  %reg_file57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !502
  %arraydecay58 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file57, i16 0, i16 0, !dbg !502
  call void @__dump_registers(i16* %arraydecay58), !dbg !502
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !502
  br label %if.end59

if.end59:                                         ; preds = %if.else56, %if.then53
  br label %do.end60, !dbg !499

do.end60:                                         ; preds = %if.end59
  call void @task_commit(), !dbg !494
  br label %do.cond, !dbg !504

do.cond:                                          ; preds = %do.end60
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !505
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !505
  %check62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 16, !dbg !505
  %23 = load i16, i16* %check62, align 2, !dbg !505
  %cmp63 = icmp eq i16 %23, 1, !dbg !506
  br i1 %cmp63, label %do.body50, label %do.end64, !dbg !504, !llvm.loop !507

do.end64:                                         ; preds = %do.cond
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !509
  %globals65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !509
  %check66 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals65, i32 0, i32 16, !dbg !509
  %25 = load i16, i16* %check66, align 2, !dbg !509
  %cmp67 = icmp ne i16 %25, 0, !dbg !511
  br i1 %cmp67, label %if.then68, label %if.end69, !dbg !512

if.then68:                                        ; preds = %do.end64
  br label %while.end, !dbg !513

if.end69:                                         ; preds = %do.end64
  br label %while.body29, !dbg !473, !llvm.loop !514

while.end:                                        ; preds = %if.then68
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !516
  %globals70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !516
  %check71 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals70, i32 0, i32 16, !dbg !516
  %27 = load i16, i16* %check71, align 2, !dbg !516
  %cmp72 = icmp eq i16 %27, 3, !dbg !518
  br i1 %cmp72, label %if.then73, label %if.end91, !dbg !519

if.then73:                                        ; preds = %while.end
  br label %do.body74, !dbg !520

do.body74:                                        ; preds = %do.cond86, %if.then73
  %unsafe35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe35, i32 0, i32 1
  %BCast37 = bitcast %struct.camel_global_t* %globals36 to i8*
  %safe38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe38, i32 0, i32 1
  %BCast40 = bitcast %struct.camel_global_t* %globals39 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast37, i8* align 2 %BCast40, i16 902, i1 false), !dbg !522
  call void @task_add_node(), !dbg !522
  br label %do.body75, !dbg !522

do.body75:                                        ; preds = %do.body74
  %28 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !524
  %cmp76 = icmp eq i16 %28, 1, !dbg !524
  br i1 %cmp76, label %if.then77, label %if.else80, !dbg !527

if.then77:                                        ; preds = %do.body75
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !528
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !528
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !528
  %reg_file78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 0, !dbg !528
  %arraydecay79 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file78, i16 0, i16 0, !dbg !528
  call void @__dump_registers(i16* %arraydecay79), !dbg !528
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !528
  br label %if.end83, !dbg !528

if.else80:                                        ; preds = %do.body75
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !530
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !530
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %reg_file81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 0, !dbg !530
  %arraydecay82 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file81, i16 0, i16 0, !dbg !530
  call void @__dump_registers(i16* %arraydecay82), !dbg !530
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !530
  br label %if.end83

if.end83:                                         ; preds = %if.else80, %if.then77
  br label %do.end85, !dbg !527

do.end85:                                         ; preds = %if.end83
  call void @task_commit(), !dbg !522
  br label %do.cond86, !dbg !532

do.cond86:                                        ; preds = %do.end85
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !533
  %globals87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !533
  %check88 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals87, i32 0, i32 16, !dbg !533
  %32 = load i16, i16* %check88, align 2, !dbg !533
  %cmp89 = icmp eq i16 %32, 0, !dbg !534
  br i1 %cmp89, label %do.body74, label %do.end90, !dbg !532, !llvm.loop !535

do.end90:                                         ; preds = %do.cond86
  br label %if.end91, !dbg !537

if.end91:                                         ; preds = %do.end90, %while.end
  %unsafe41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe41, i32 0, i32 1
  %BCast43 = bitcast %struct.camel_global_t* %globals42 to i8*
  %safe44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe44, i32 0, i32 1
  %BCast46 = bitcast %struct.camel_global_t* %globals45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast43, i8* align 2 %BCast46, i16 902, i1 false), !dbg !538
  call void @task_add_insert(), !dbg !538
  br label %do.body92, !dbg !538

do.body92:                                        ; preds = %if.end91
  %33 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !539
  %cmp93 = icmp eq i16 %33, 1, !dbg !539
  br i1 %cmp93, label %if.then94, label %if.else97, !dbg !542

if.then94:                                        ; preds = %do.body92
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !543
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !543
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !543
  %reg_file95 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 0, !dbg !543
  %arraydecay96 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file95, i16 0, i16 0, !dbg !543
  call void @__dump_registers(i16* %arraydecay96), !dbg !543
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !543
  br label %if.end100, !dbg !543

if.else97:                                        ; preds = %do.body92
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !545
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !545
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !545
  %reg_file98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 0, !dbg !545
  %arraydecay99 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file98, i16 0, i16 0, !dbg !545
  call void @__dump_registers(i16* %arraydecay99), !dbg !545
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !545
  br label %if.end100

if.end100:                                        ; preds = %if.else97, %if.then94
  br label %do.end102, !dbg !542

do.end102:                                        ; preds = %if.end100
  call void @task_commit(), !dbg !538
  %unsafe47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe47, i32 0, i32 1
  %BCast49 = bitcast %struct.camel_global_t* %globals48 to i8*
  %safe50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe50, i32 0, i32 1
  %BCast52 = bitcast %struct.camel_global_t* %globals51 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast49, i8* align 2 %BCast52, i16 902, i1 false), !dbg !547
  call void @task_append_compressed(), !dbg !547
  br label %do.body103, !dbg !547

do.body103:                                       ; preds = %do.end102
  %36 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !548
  %cmp104 = icmp eq i16 %36, 1, !dbg !548
  br i1 %cmp104, label %if.then105, label %if.else108, !dbg !551

if.then105:                                       ; preds = %do.body103
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !552
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !552
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !552
  %reg_file106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 0, !dbg !552
  %arraydecay107 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file106, i16 0, i16 0, !dbg !552
  call void @__dump_registers(i16* %arraydecay107), !dbg !552
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !552
  br label %if.end111, !dbg !552

if.else108:                                       ; preds = %do.body103
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !554
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %reg_file109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 0, !dbg !554
  %arraydecay110 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file109, i16 0, i16 0, !dbg !554
  call void @__dump_registers(i16* %arraydecay110), !dbg !554
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !554
  br label %if.end111

if.end111:                                        ; preds = %if.else108, %if.then105
  br label %do.end113, !dbg !551

do.end113:                                        ; preds = %if.end111
  call void @task_commit(), !dbg !547
  br label %while.cond, !dbg !445, !llvm.loop !556

while.end114:                                     ; preds = %while.cond
  %unsafe53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe53, i32 0, i32 1
  %BCast55 = bitcast %struct.camel_global_t* %globals54 to i8*
  %safe56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe56, i32 0, i32 1
  %BCast58 = bitcast %struct.camel_global_t* %globals57 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast55, i8* align 2 %BCast58, i16 902, i1 false), !dbg !558
  call void @task_done(), !dbg !558
  %39 = load i16, i16* %retval, align 2, !dbg !559
  ret i16 %39, !dbg !559
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
!115 = !DILocation(line: 216, column: 5, scope: !116)
!116 = distinct !DILexicalBlock(scope: !96, file: !3, line: 216, column: 5)
!117 = !{i32 -2146595624}
!118 = !DILocation(line: 217, column: 5, scope: !96)
!119 = !DILocation(line: 218, column: 25, scope: !96)
!120 = !DILocation(line: 218, column: 31, scope: !96)
!121 = !DILocation(line: 218, column: 5, scope: !96)
!122 = !DILocation(line: 241, column: 1, scope: !96)
!123 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 251, type: !12, scopeLine: 252, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!124 = !DILocation(line: 253, column: 2, scope: !123)
!125 = !DILocation(line: 253, column: 18, scope: !123)
!126 = !DILocation(line: 254, column: 2, scope: !123)
!127 = !DILocation(line: 254, column: 14, scope: !123)
!128 = !DILocation(line: 255, column: 2, scope: !123)
!129 = !DILocation(line: 255, column: 13, scope: !123)
!130 = !DILocation(line: 256, column: 2, scope: !123)
!131 = !DILocation(line: 256, column: 18, scope: !123)
!132 = !DILocation(line: 257, column: 2, scope: !123)
!133 = !DILocation(line: 257, column: 17, scope: !123)
!134 = !DILocation(line: 258, column: 2, scope: !123)
!135 = !DILocation(line: 258, column: 19, scope: !123)
!136 = !DILocation(line: 260, column: 2, scope: !123)
!137 = !DILocation(line: 260, column: 9, scope: !123)
!138 = !DILocation(line: 260, column: 20, scope: !123)
!139 = !DILocalVariable(name: "node", scope: !140, file: !3, line: 262, type: !47)
!140 = distinct !DILexicalBlock(scope: !123, file: !3, line: 260, column: 35)
!141 = !DILocation(line: 262, column: 10, scope: !140)
!142 = !DILocation(line: 262, column: 17, scope: !140)
!143 = !DILocation(line: 263, column: 14, scope: !140)
!144 = !DILocalVariable(name: "i", scope: !140, file: !3, line: 267, type: !145)
!145 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!146 = !DILocation(line: 267, column: 7, scope: !140)
!147 = !DILocation(line: 267, column: 11, scope: !140)
!148 = !DILocation(line: 268, column: 3, scope: !140)
!149 = !DILocation(line: 268, column: 12, scope: !140)
!150 = !DILocation(line: 268, column: 17, scope: !140)
!151 = !DILocation(line: 269, column: 3, scope: !140)
!152 = !DILocation(line: 269, column: 13, scope: !140)
!153 = distinct !{!153, !136, !154}
!154 = !DILocation(line: 270, column: 2, scope: !123)
!155 = !DILocation(line: 272, column: 2, scope: !123)
!156 = !DILocation(line: 272, column: 17, scope: !123)
!157 = !DILocation(line: 273, column: 1, scope: !123)
!158 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 275, type: !12, scopeLine: 276, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!159 = !DILocalVariable(name: "next_letter_idx", scope: !158, file: !3, line: 277, type: !6)
!160 = !DILocation(line: 277, column: 11, scope: !158)
!161 = !DILocation(line: 277, column: 29, scope: !158)
!162 = !DILocation(line: 277, column: 44, scope: !158)
!163 = !DILocation(line: 278, column: 6, scope: !164)
!164 = distinct !DILexicalBlock(scope: !158, file: !3, line: 278, column: 6)
!165 = !DILocation(line: 278, column: 22, scope: !164)
!166 = !DILocation(line: 278, column: 6, scope: !158)
!167 = !DILocation(line: 279, column: 19, scope: !164)
!168 = !DILocation(line: 279, column: 3, scope: !164)
!169 = !DILocation(line: 281, column: 6, scope: !170)
!170 = distinct !DILexicalBlock(scope: !158, file: !3, line: 281, column: 6)
!171 = !DILocation(line: 281, column: 21, scope: !170)
!172 = !DILocation(line: 281, column: 6, scope: !158)
!173 = !DILocation(line: 282, column: 20, scope: !174)
!174 = distinct !DILexicalBlock(scope: !170, file: !3, line: 281, column: 27)
!175 = !DILocation(line: 282, column: 3, scope: !174)
!176 = !DILocation(line: 282, column: 18, scope: !174)
!177 = !DILocation(line: 283, column: 3, scope: !174)
!178 = !DILocation(line: 283, column: 13, scope: !174)
!179 = !DILocation(line: 285, column: 2, scope: !174)
!180 = !DILocation(line: 286, column: 20, scope: !181)
!181 = distinct !DILexicalBlock(scope: !170, file: !3, line: 285, column: 9)
!182 = !DILocation(line: 286, column: 3, scope: !181)
!183 = !DILocation(line: 286, column: 18, scope: !181)
!184 = !DILocation(line: 287, column: 3, scope: !181)
!185 = !DILocation(line: 287, column: 13, scope: !181)
!186 = !DILocation(line: 290, column: 1, scope: !158)
!187 = distinct !DISubprogram(name: "task_measure_temp", scope: !3, file: !3, line: 292, type: !12, scopeLine: 293, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocalVariable(name: "prev_sample", scope: !187, file: !3, line: 294, type: !42)
!189 = !DILocation(line: 294, column: 11, scope: !187)
!190 = !DILocation(line: 295, column: 16, scope: !187)
!191 = !DILocation(line: 295, column: 14, scope: !187)
!192 = !DILocalVariable(name: "sample", scope: !187, file: !3, line: 297, type: !42)
!193 = !DILocation(line: 297, column: 11, scope: !187)
!194 = !DILocation(line: 297, column: 35, scope: !187)
!195 = !DILocation(line: 297, column: 20, scope: !187)
!196 = !DILocation(line: 298, column: 16, scope: !187)
!197 = !DILocation(line: 298, column: 14, scope: !187)
!198 = !DILocation(line: 299, column: 20, scope: !187)
!199 = !DILocation(line: 299, column: 2, scope: !187)
!200 = !DILocation(line: 299, column: 18, scope: !187)
!201 = !DILocation(line: 300, column: 15, scope: !187)
!202 = !DILocation(line: 300, column: 2, scope: !187)
!203 = !DILocation(line: 300, column: 13, scope: !187)
!204 = !DILocation(line: 302, column: 1, scope: !187)
!205 = distinct !DISubprogram(name: "acquire_sample", scope: !3, file: !3, line: 245, type: !206, scopeLine: 246, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!206 = !DISubroutineType(types: !207)
!207 = !{!42, !39}
!208 = !DILocalVariable(name: "prev_sample", arg: 1, scope: !205, file: !3, line: 245, type: !39)
!209 = !DILocation(line: 245, column: 41, scope: !205)
!210 = !DILocalVariable(name: "sample", scope: !205, file: !3, line: 247, type: !39)
!211 = !DILocation(line: 247, column: 11, scope: !205)
!212 = !DILocation(line: 247, column: 21, scope: !205)
!213 = !DILocation(line: 247, column: 33, scope: !205)
!214 = !DILocation(line: 247, column: 38, scope: !205)
!215 = !DILocation(line: 248, column: 9, scope: !205)
!216 = !DILocation(line: 248, column: 2, scope: !205)
!217 = distinct !DISubprogram(name: "task_letterize", scope: !3, file: !3, line: 304, type: !12, scopeLine: 305, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!218 = !DILocalVariable(name: "letter_idx", scope: !217, file: !3, line: 306, type: !6)
!219 = !DILocation(line: 306, column: 11, scope: !217)
!220 = !DILocation(line: 306, column: 24, scope: !217)
!221 = !DILocation(line: 307, column: 6, scope: !222)
!222 = distinct !DILexicalBlock(scope: !217, file: !3, line: 307, column: 6)
!223 = !DILocation(line: 307, column: 17, scope: !222)
!224 = !DILocation(line: 307, column: 6, scope: !217)
!225 = !DILocation(line: 308, column: 14, scope: !222)
!226 = !DILocation(line: 308, column: 3, scope: !222)
!227 = !DILocation(line: 310, column: 13, scope: !222)
!228 = !DILocalVariable(name: "letter_shift", scope: !217, file: !3, line: 311, type: !6)
!229 = !DILocation(line: 311, column: 11, scope: !217)
!230 = !DILocation(line: 311, column: 45, scope: !217)
!231 = !DILocation(line: 311, column: 43, scope: !217)
!232 = !DILocalVariable(name: "letter", scope: !217, file: !3, line: 312, type: !39)
!233 = !DILocation(line: 312, column: 11, scope: !217)
!234 = !DILocation(line: 312, column: 21, scope: !217)
!235 = !DILocation(line: 312, column: 50, scope: !217)
!236 = !DILocation(line: 312, column: 47, scope: !217)
!237 = !DILocation(line: 312, column: 32, scope: !217)
!238 = !DILocation(line: 312, column: 68, scope: !217)
!239 = !DILocation(line: 312, column: 65, scope: !217)
!240 = !DILocation(line: 314, column: 15, scope: !217)
!241 = !DILocation(line: 314, column: 2, scope: !217)
!242 = !DILocation(line: 314, column: 13, scope: !217)
!243 = !DILocation(line: 316, column: 1, scope: !217)
!244 = distinct !DISubprogram(name: "task_compress", scope: !3, file: !3, line: 318, type: !12, scopeLine: 319, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!245 = !DILocalVariable(name: "parent_node", scope: !244, file: !3, line: 320, type: !47)
!246 = !DILocation(line: 320, column: 9, scope: !244)
!247 = !DILocalVariable(name: "parent", scope: !244, file: !3, line: 321, type: !7)
!248 = !DILocation(line: 321, column: 10, scope: !244)
!249 = !DILocation(line: 321, column: 19, scope: !244)
!250 = !DILocation(line: 322, column: 16, scope: !244)
!251 = !DILocation(line: 322, column: 25, scope: !244)
!252 = !DILocation(line: 324, column: 28, scope: !244)
!253 = !DILocation(line: 324, column: 2, scope: !244)
!254 = !DILocation(line: 324, column: 14, scope: !244)
!255 = !DILocation(line: 325, column: 2, scope: !244)
!256 = !DILocation(line: 325, column: 20, scope: !244)
!257 = !DILocation(line: 326, column: 15, scope: !244)
!258 = !DILocation(line: 326, column: 2, scope: !244)
!259 = !DILocation(line: 326, column: 13, scope: !244)
!260 = !DILocation(line: 327, column: 26, scope: !244)
!261 = !DILocation(line: 327, column: 2, scope: !244)
!262 = !DILocation(line: 327, column: 12, scope: !244)
!263 = !DILocation(line: 328, column: 2, scope: !244)
!264 = !DILocation(line: 328, column: 18, scope: !244)
!265 = !DILocation(line: 330, column: 1, scope: !244)
!266 = distinct !DISubprogram(name: "task_find_sibling", scope: !3, file: !3, line: 332, type: !12, scopeLine: 333, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!267 = !DILocalVariable(name: "sibling_node", scope: !266, file: !3, line: 334, type: !268)
!268 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 16)
!269 = !DILocation(line: 334, column: 10, scope: !266)
!270 = !DILocation(line: 336, column: 6, scope: !271)
!271 = distinct !DILexicalBlock(scope: !266, file: !3, line: 336, column: 6)
!272 = !DILocation(line: 336, column: 18, scope: !271)
!273 = !DILocation(line: 336, column: 6, scope: !266)
!274 = !DILocalVariable(name: "i", scope: !275, file: !3, line: 337, type: !145)
!275 = distinct !DILexicalBlock(scope: !271, file: !3, line: 336, column: 26)
!276 = !DILocation(line: 337, column: 7, scope: !275)
!277 = !DILocation(line: 337, column: 11, scope: !275)
!278 = !DILocation(line: 338, column: 19, scope: !275)
!279 = !DILocation(line: 338, column: 28, scope: !275)
!280 = !DILocation(line: 338, column: 16, scope: !275)
!281 = !DILocation(line: 340, column: 7, scope: !282)
!282 = distinct !DILexicalBlock(scope: !275, file: !3, line: 340, column: 7)
!283 = !DILocation(line: 340, column: 21, scope: !282)
!284 = !DILocation(line: 340, column: 31, scope: !282)
!285 = !DILocation(line: 340, column: 28, scope: !282)
!286 = !DILocation(line: 340, column: 7, scope: !275)
!287 = !DILocation(line: 342, column: 22, scope: !288)
!288 = distinct !DILexicalBlock(scope: !282, file: !3, line: 340, column: 43)
!289 = !DILocation(line: 342, column: 4, scope: !288)
!290 = !DILocation(line: 342, column: 20, scope: !288)
!291 = !DILocation(line: 344, column: 4, scope: !288)
!292 = !DILocation(line: 344, column: 14, scope: !288)
!293 = !DILocation(line: 345, column: 4, scope: !288)
!294 = !DILocation(line: 347, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 347, column: 7)
!296 = distinct !DILexicalBlock(scope: !282, file: !3, line: 346, column: 10)
!297 = !DILocation(line: 347, column: 21, scope: !295)
!298 = !DILocation(line: 347, column: 29, scope: !295)
!299 = !DILocation(line: 347, column: 7, scope: !296)
!300 = !DILocation(line: 348, column: 19, scope: !301)
!301 = distinct !DILexicalBlock(scope: !295, file: !3, line: 347, column: 34)
!302 = !DILocation(line: 348, column: 33, scope: !301)
!303 = !DILocation(line: 348, column: 5, scope: !301)
!304 = !DILocation(line: 348, column: 17, scope: !301)
!305 = !DILocation(line: 349, column: 5, scope: !301)
!306 = !DILocation(line: 349, column: 15, scope: !301)
!307 = !DILocation(line: 350, column: 5, scope: !301)
!308 = !DILocation(line: 354, column: 2, scope: !275)
!309 = !DILocalVariable(name: "starting_node_idx", scope: !266, file: !3, line: 356, type: !7)
!310 = !DILocation(line: 356, column: 10, scope: !266)
!311 = !DILocation(line: 356, column: 39, scope: !266)
!312 = !DILocation(line: 357, column: 20, scope: !266)
!313 = !DILocation(line: 357, column: 2, scope: !266)
!314 = !DILocation(line: 357, column: 18, scope: !266)
!315 = !DILocation(line: 359, column: 6, scope: !316)
!316 = distinct !DILexicalBlock(scope: !266, file: !3, line: 359, column: 6)
!317 = !DILocation(line: 359, column: 16, scope: !316)
!318 = !DILocation(line: 359, column: 6, scope: !266)
!319 = !DILocation(line: 360, column: 3, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !3, line: 359, column: 24)
!321 = !DILocation(line: 360, column: 13, scope: !320)
!322 = !DILocation(line: 361, column: 2, scope: !320)
!323 = !DILocation(line: 362, column: 3, scope: !324)
!324 = distinct !DILexicalBlock(scope: !316, file: !3, line: 361, column: 9)
!325 = !DILocation(line: 362, column: 13, scope: !324)
!326 = !DILocation(line: 364, column: 1, scope: !266)
!327 = distinct !DISubprogram(name: "task_add_node", scope: !3, file: !3, line: 367, type: !12, scopeLine: 368, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!328 = !DILocalVariable(name: "sibling_node", scope: !327, file: !3, line: 369, type: !268)
!329 = !DILocation(line: 369, column: 10, scope: !327)
!330 = !DILocalVariable(name: "i", scope: !327, file: !3, line: 371, type: !145)
!331 = !DILocation(line: 371, column: 6, scope: !327)
!332 = !DILocation(line: 371, column: 10, scope: !327)
!333 = !DILocation(line: 372, column: 18, scope: !327)
!334 = !DILocation(line: 372, column: 27, scope: !327)
!335 = !DILocation(line: 372, column: 15, scope: !327)
!336 = !DILocation(line: 374, column: 6, scope: !337)
!337 = distinct !DILexicalBlock(scope: !327, file: !3, line: 374, column: 6)
!338 = !DILocation(line: 374, column: 20, scope: !337)
!339 = !DILocation(line: 374, column: 28, scope: !337)
!340 = !DILocation(line: 374, column: 6, scope: !327)
!341 = !DILocalVariable(name: "next_sibling", scope: !342, file: !3, line: 375, type: !7)
!342 = distinct !DILexicalBlock(scope: !337, file: !3, line: 374, column: 36)
!343 = !DILocation(line: 375, column: 11, scope: !342)
!344 = !DILocation(line: 375, column: 26, scope: !342)
!345 = !DILocation(line: 375, column: 40, scope: !342)
!346 = !DILocation(line: 376, column: 17, scope: !342)
!347 = !DILocation(line: 376, column: 3, scope: !342)
!348 = !DILocation(line: 376, column: 15, scope: !342)
!349 = !DILocation(line: 378, column: 3, scope: !342)
!350 = !DILocation(line: 378, column: 13, scope: !342)
!351 = !DILocation(line: 380, column: 2, scope: !342)
!352 = !DILocalVariable(name: "sibling_node_obj", scope: !353, file: !3, line: 382, type: !47)
!353 = distinct !DILexicalBlock(scope: !337, file: !3, line: 380, column: 9)
!354 = !DILocation(line: 382, column: 10, scope: !353)
!355 = !DILocation(line: 382, column: 30, scope: !353)
!356 = !DILocation(line: 382, column: 29, scope: !353)
!357 = !DILocation(line: 383, column: 3, scope: !353)
!358 = !DILocation(line: 383, column: 22, scope: !353)
!359 = !DILocation(line: 385, column: 3, scope: !353)
!360 = !DILocation(line: 385, column: 13, scope: !353)
!361 = !DILocation(line: 387, column: 1, scope: !327)
!362 = distinct !DISubprogram(name: "task_add_insert", scope: !3, file: !3, line: 389, type: !12, scopeLine: 390, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!363 = !DILocation(line: 392, column: 6, scope: !364)
!364 = distinct !DILexicalBlock(scope: !362, file: !3, line: 392, column: 6)
!365 = !DILocation(line: 392, column: 21, scope: !364)
!366 = !DILocation(line: 392, column: 6, scope: !362)
!367 = !DILocation(line: 393, column: 3, scope: !368)
!368 = distinct !DILexicalBlock(scope: !364, file: !3, line: 392, column: 35)
!369 = !DILocation(line: 394, column: 3, scope: !368)
!370 = distinct !{!370, !369, !371}
!371 = !DILocation(line: 394, column: 12, scope: !368)
!372 = !DILocalVariable(name: "child", scope: !362, file: !3, line: 397, type: !7)
!373 = !DILocation(line: 397, column: 10, scope: !362)
!374 = !DILocation(line: 397, column: 18, scope: !362)
!375 = !DILocalVariable(name: "child_node", scope: !362, file: !3, line: 398, type: !47)
!376 = !DILocation(line: 398, column: 9, scope: !362)
!377 = !DILocation(line: 398, column: 22, scope: !362)
!378 = !DILocation(line: 399, column: 13, scope: !362)
!379 = !DILocalVariable(name: "cond", scope: !362, file: !3, line: 405, type: !47)
!380 = !DILocation(line: 405, column: 9, scope: !362)
!381 = !DILocation(line: 405, column: 16, scope: !362)
!382 = !DILocation(line: 407, column: 11, scope: !383)
!383 = distinct !DILexicalBlock(scope: !362, file: !3, line: 407, column: 6)
!384 = !DILocation(line: 407, column: 17, scope: !383)
!385 = !DILocation(line: 407, column: 6, scope: !362)
!386 = !DILocalVariable(name: "parent_node_obj", scope: !387, file: !3, line: 409, type: !47)
!387 = distinct !DILexicalBlock(scope: !383, file: !3, line: 407, column: 25)
!388 = !DILocation(line: 409, column: 10, scope: !387)
!389 = !DILocation(line: 409, column: 28, scope: !387)
!390 = !DILocation(line: 410, column: 27, scope: !387)
!391 = !DILocation(line: 410, column: 19, scope: !387)
!392 = !DILocation(line: 410, column: 25, scope: !387)
!393 = !DILocation(line: 412, column: 3, scope: !387)
!394 = !DILocation(line: 412, column: 12, scope: !387)
!395 = !DILocation(line: 412, column: 26, scope: !387)
!396 = !DILocation(line: 414, column: 2, scope: !387)
!397 = !DILocalVariable(name: "last_sibling_node", scope: !398, file: !3, line: 416, type: !47)
!398 = distinct !DILexicalBlock(scope: !383, file: !3, line: 414, column: 9)
!399 = !DILocation(line: 416, column: 10, scope: !398)
!400 = !DILocation(line: 416, column: 30, scope: !398)
!401 = !DILocation(line: 418, column: 31, scope: !398)
!402 = !DILocation(line: 418, column: 21, scope: !398)
!403 = !DILocation(line: 418, column: 29, scope: !398)
!404 = !DILocation(line: 419, column: 3, scope: !398)
!405 = !DILocation(line: 419, column: 12, scope: !398)
!406 = !DILocation(line: 419, column: 27, scope: !398)
!407 = !DILocation(line: 421, column: 2, scope: !362)
!408 = !DILocation(line: 421, column: 11, scope: !362)
!409 = !DILocation(line: 421, column: 24, scope: !362)
!410 = !DILocation(line: 422, column: 15, scope: !362)
!411 = !DILocation(line: 422, column: 2, scope: !362)
!412 = !DILocation(line: 422, column: 13, scope: !362)
!413 = !DILocation(line: 423, column: 2, scope: !362)
!414 = !DILocation(line: 423, column: 16, scope: !362)
!415 = !DILocation(line: 425, column: 1, scope: !362)
!416 = distinct !DISubprogram(name: "task_append_compressed", scope: !3, file: !3, line: 427, type: !12, scopeLine: 428, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!417 = !DILocation(line: 429, column: 44, scope: !416)
!418 = !DILocation(line: 429, column: 2, scope: !416)
!419 = !DILocation(line: 429, column: 22, scope: !416)
!420 = !DILocation(line: 429, column: 35, scope: !416)
!421 = !DILocation(line: 429, column: 42, scope: !416)
!422 = !DILocation(line: 431, column: 4, scope: !416)
!423 = !DILocation(line: 431, column: 2, scope: !416)
!424 = !DILocation(line: 432, column: 1, scope: !416)
!425 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 434, type: !12, scopeLine: 435, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!426 = !DILocation(line: 436, column: 2, scope: !425)
!427 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 439, type: !12, scopeLine: 439, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!428 = !DILocation(line: 441, column: 1, scope: !427)
!429 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 443, type: !430, scopeLine: 443, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!430 = !DISubroutineType(types: !431)
!431 = !{!145}
!432 = !DILocation(line: 445, column: 16, scope: !429)
!433 = !DILocation(line: 446, column: 10, scope: !429)
!434 = !DILocation(line: 447, column: 12, scope: !429)
!435 = !DILocation(line: 448, column: 5, scope: !429)
!436 = !DILocation(line: 450, column: 2, scope: !429)
!437 = !DILocation(line: 450, column: 2, scope: !438)
!438 = distinct !DILexicalBlock(scope: !439, file: !3, line: 450, column: 2)
!439 = distinct !DILexicalBlock(scope: !429, file: !3, line: 450, column: 2)
!440 = !DILocation(line: 450, column: 2, scope: !439)
!441 = !DILocation(line: 450, column: 2, scope: !442)
!442 = distinct !DILexicalBlock(scope: !438, file: !3, line: 450, column: 2)
!443 = !DILocation(line: 450, column: 2, scope: !444)
!444 = distinct !DILexicalBlock(scope: !438, file: !3, line: 450, column: 2)
!445 = !DILocation(line: 452, column: 2, scope: !429)
!446 = !DILocation(line: 452, column: 8, scope: !429)
!447 = !DILocation(line: 452, column: 21, scope: !429)
!448 = !DILocation(line: 454, column: 3, scope: !449)
!449 = distinct !DILexicalBlock(scope: !429, file: !3, line: 452, column: 35)
!450 = !DILocation(line: 454, column: 3, scope: !451)
!451 = distinct !DILexicalBlock(scope: !452, file: !3, line: 454, column: 3)
!452 = distinct !DILexicalBlock(scope: !449, file: !3, line: 454, column: 3)
!453 = !DILocation(line: 454, column: 3, scope: !452)
!454 = !DILocation(line: 454, column: 3, scope: !455)
!455 = distinct !DILexicalBlock(scope: !451, file: !3, line: 454, column: 3)
!456 = !DILocation(line: 454, column: 3, scope: !457)
!457 = distinct !DILexicalBlock(scope: !451, file: !3, line: 454, column: 3)
!458 = !DILocation(line: 456, column: 7, scope: !459)
!459 = distinct !DILexicalBlock(scope: !449, file: !3, line: 456, column: 7)
!460 = !DILocation(line: 456, column: 18, scope: !459)
!461 = !DILocation(line: 456, column: 7, scope: !449)
!462 = !DILocation(line: 458, column: 4, scope: !463)
!463 = distinct !DILexicalBlock(scope: !459, file: !3, line: 456, column: 23)
!464 = !DILocation(line: 458, column: 4, scope: !465)
!465 = distinct !DILexicalBlock(scope: !466, file: !3, line: 458, column: 4)
!466 = distinct !DILexicalBlock(scope: !463, file: !3, line: 458, column: 4)
!467 = !DILocation(line: 458, column: 4, scope: !466)
!468 = !DILocation(line: 458, column: 4, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !3, line: 458, column: 4)
!470 = !DILocation(line: 458, column: 4, scope: !471)
!471 = distinct !DILexicalBlock(scope: !465, file: !3, line: 458, column: 4)
!472 = !DILocation(line: 460, column: 3, scope: !463)
!473 = !DILocation(line: 462, column: 3, scope: !449)
!474 = !DILocation(line: 464, column: 4, scope: !475)
!475 = distinct !DILexicalBlock(scope: !449, file: !3, line: 462, column: 13)
!476 = !DILocation(line: 464, column: 4, scope: !477)
!477 = distinct !DILexicalBlock(scope: !478, file: !3, line: 464, column: 4)
!478 = distinct !DILexicalBlock(scope: !475, file: !3, line: 464, column: 4)
!479 = !DILocation(line: 464, column: 4, scope: !478)
!480 = !DILocation(line: 464, column: 4, scope: !481)
!481 = distinct !DILexicalBlock(scope: !477, file: !3, line: 464, column: 4)
!482 = !DILocation(line: 464, column: 4, scope: !483)
!483 = distinct !DILexicalBlock(scope: !477, file: !3, line: 464, column: 4)
!484 = !DILocation(line: 466, column: 4, scope: !475)
!485 = !DILocation(line: 466, column: 4, scope: !486)
!486 = distinct !DILexicalBlock(scope: !487, file: !3, line: 466, column: 4)
!487 = distinct !DILexicalBlock(scope: !475, file: !3, line: 466, column: 4)
!488 = !DILocation(line: 466, column: 4, scope: !487)
!489 = !DILocation(line: 466, column: 4, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !3, line: 466, column: 4)
!491 = !DILocation(line: 466, column: 4, scope: !492)
!492 = distinct !DILexicalBlock(scope: !486, file: !3, line: 466, column: 4)
!493 = !DILocation(line: 468, column: 4, scope: !475)
!494 = !DILocation(line: 470, column: 5, scope: !495)
!495 = distinct !DILexicalBlock(scope: !475, file: !3, line: 468, column: 7)
!496 = !DILocation(line: 470, column: 5, scope: !497)
!497 = distinct !DILexicalBlock(scope: !498, file: !3, line: 470, column: 5)
!498 = distinct !DILexicalBlock(scope: !495, file: !3, line: 470, column: 5)
!499 = !DILocation(line: 470, column: 5, scope: !498)
!500 = !DILocation(line: 470, column: 5, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !3, line: 470, column: 5)
!502 = !DILocation(line: 470, column: 5, scope: !503)
!503 = distinct !DILexicalBlock(scope: !497, file: !3, line: 470, column: 5)
!504 = !DILocation(line: 472, column: 4, scope: !495)
!505 = !DILocation(line: 472, column: 13, scope: !475)
!506 = !DILocation(line: 472, column: 24, scope: !475)
!507 = distinct !{!507, !493, !508}
!508 = !DILocation(line: 472, column: 28, scope: !475)
!509 = !DILocation(line: 474, column: 8, scope: !510)
!510 = distinct !DILexicalBlock(scope: !475, file: !3, line: 474, column: 8)
!511 = !DILocation(line: 474, column: 19, scope: !510)
!512 = !DILocation(line: 474, column: 8, scope: !475)
!513 = !DILocation(line: 475, column: 5, scope: !510)
!514 = distinct !{!514, !473, !515}
!515 = !DILocation(line: 476, column: 3, scope: !449)
!516 = !DILocation(line: 478, column: 7, scope: !517)
!517 = distinct !DILexicalBlock(scope: !449, file: !3, line: 478, column: 7)
!518 = !DILocation(line: 478, column: 18, scope: !517)
!519 = !DILocation(line: 478, column: 7, scope: !449)
!520 = !DILocation(line: 479, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !3, line: 478, column: 24)
!522 = !DILocation(line: 481, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !521, file: !3, line: 479, column: 6)
!524 = !DILocation(line: 481, column: 5, scope: !525)
!525 = distinct !DILexicalBlock(scope: !526, file: !3, line: 481, column: 5)
!526 = distinct !DILexicalBlock(scope: !523, file: !3, line: 481, column: 5)
!527 = !DILocation(line: 481, column: 5, scope: !526)
!528 = !DILocation(line: 481, column: 5, scope: !529)
!529 = distinct !DILexicalBlock(scope: !525, file: !3, line: 481, column: 5)
!530 = !DILocation(line: 481, column: 5, scope: !531)
!531 = distinct !DILexicalBlock(scope: !525, file: !3, line: 481, column: 5)
!532 = !DILocation(line: 484, column: 4, scope: !523)
!533 = !DILocation(line: 484, column: 13, scope: !521)
!534 = !DILocation(line: 484, column: 24, scope: !521)
!535 = distinct !{!535, !520, !536}
!536 = !DILocation(line: 484, column: 28, scope: !521)
!537 = !DILocation(line: 485, column: 3, scope: !521)
!538 = !DILocation(line: 487, column: 3, scope: !449)
!539 = !DILocation(line: 487, column: 3, scope: !540)
!540 = distinct !DILexicalBlock(scope: !541, file: !3, line: 487, column: 3)
!541 = distinct !DILexicalBlock(scope: !449, file: !3, line: 487, column: 3)
!542 = !DILocation(line: 487, column: 3, scope: !541)
!543 = !DILocation(line: 487, column: 3, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !3, line: 487, column: 3)
!545 = !DILocation(line: 487, column: 3, scope: !546)
!546 = distinct !DILexicalBlock(scope: !540, file: !3, line: 487, column: 3)
!547 = !DILocation(line: 489, column: 3, scope: !449)
!548 = !DILocation(line: 489, column: 3, scope: !549)
!549 = distinct !DILexicalBlock(scope: !550, file: !3, line: 489, column: 3)
!550 = distinct !DILexicalBlock(scope: !449, file: !3, line: 489, column: 3)
!551 = !DILocation(line: 489, column: 3, scope: !550)
!552 = !DILocation(line: 489, column: 3, scope: !553)
!553 = distinct !DILexicalBlock(scope: !549, file: !3, line: 489, column: 3)
!554 = !DILocation(line: 489, column: 3, scope: !555)
!555 = distinct !DILexicalBlock(scope: !549, file: !3, line: 489, column: 3)
!556 = distinct !{!556, !445, !557}
!557 = !DILocation(line: 491, column: 2, scope: !429)
!558 = !DILocation(line: 493, column: 2, scope: !429)
!559 = !DILocation(line: 494, column: 1, scope: !429)
