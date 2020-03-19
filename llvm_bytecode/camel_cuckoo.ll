; ModuleID = 'camel_cuckoo.bc'
source_filename = "../example/camel_cuckoo.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [128 x i16], i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8, i16 }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !30
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !65
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !26
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !28
@init_key = dso_local constant i16 1, align 2, !dbg !14
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !21
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !67
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !79 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !80
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !81
  %conv = zext i8 %0 to i16, !dbg !81
  %or = or i16 %conv, 1, !dbg !81
  %conv1 = trunc i16 %or to i8, !dbg !81
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !81
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !82
  %conv2 = zext i8 %1 to i16, !dbg !82
  %and = and i16 %conv2, -2, !dbg !82
  %conv3 = trunc i16 %and to i8, !dbg !82
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !82
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !83
  %and4 = and i16 %2, -2, !dbg !83
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !83
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !84
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !85
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !86
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !87
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !88
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !89
  ret void, !dbg !90
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !91 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !92
  %cmp = icmp eq i16 %0, 1, !dbg !94
  br i1 %cmp, label %if.then, label %if.else, !dbg !95

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !96
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !98
  br label %if.end4, !dbg !99

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !100
  %cmp1 = icmp eq i16 %1, 2, !dbg !102
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !103

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !106
  br label %if.end, !dbg !107

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !108
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !110
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !110
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !110
  %3 = load i16, i16* %arrayidx, align 2, !dbg !110
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !110, !srcloc !112
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !113, metadata !DIExpression()), !dbg !115
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !115, !srcloc !116
  store i16 %4, i16* %__x, align 2, !dbg !115
  %5 = load i16, i16* %__x, align 2, !dbg !115
  store i16 %5, i16* %tmp, align 2, !dbg !115
  %6 = load i16, i16* %tmp, align 2, !dbg !115
  %add = add i16 %6, 2, !dbg !117
  %7 = inttoptr i16 %add to i8*, !dbg !118
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !119, metadata !DIExpression()), !dbg !121
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !121, !srcloc !122
  store i16 %8, i16* %__x5, align 2, !dbg !121
  %9 = load i16, i16* %__x5, align 2, !dbg !121
  store i16 %9, i16* %tmp6, align 2, !dbg !121
  %10 = load i16, i16* %tmp6, align 2, !dbg !121
  %add7 = add i16 %10, 2, !dbg !123
  %sub = sub i16 9216, %add7, !dbg !124
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !125
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !126
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !127
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !127
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !128
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 300, i16 zeroext %13), !dbg !129
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !130
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !131
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !133
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !134
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !134
  %cmp9 = icmp eq i16 %14, %16, !dbg !135
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !136

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !137
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !139
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !140
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !139
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 302, i1 false), !dbg !139
  call void @camel_init(), !dbg !141
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !142
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !143
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !142
  call void @__restore_registers(i16* %arraydecay), !dbg !144
  br label %if.end13, !dbg !145

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !146
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !148
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !149 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !150, metadata !DIExpression()), !dbg !151
  store i16 0, i16* %i, align 2, !dbg !152
  br label %for.cond, !dbg !154

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !155
  %cmp = icmp ult i16 %0, 128, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %1 = load i16, i16* %i, align 2, !dbg !159
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !161
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !161
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !161
  %3 = load i16, i16* %i, align 2, !dbg !162
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %3, !dbg !161
  store i16 %1, i16* %arrayidx, align 2, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %4 = load i16, i16* %i, align 2, !dbg !165
  %inc = add i16 %4, 1, !dbg !165
  store i16 %inc, i16* %i, align 2, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !169
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !169
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !169
  store i16 0, i16* %insert_count, align 2, !dbg !170
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !171
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !171
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !171
  store i16 0, i16* %lookup_count, align 2, !dbg !172
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !173
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !173
  store i16 0, i16* %inserted_count, align 2, !dbg !174
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !175
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !175
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !175
  store i16 0, i16* %member_count, align 2, !dbg !176
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !177
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !177
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !177
  store i16 1, i16* %key, align 2, !dbg !178
  ret void, !dbg !179
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_generate_key() #0 !dbg !180 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !181
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !181
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !181
  %1 = load i16, i16* %key, align 2, !dbg !181
  %add = add i16 %1, 1, !dbg !182
  %mul = mul i16 %add, 17, !dbg !183
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !184
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !184
  %key2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !184
  store i16 %mul, i16* %key2, align 2, !dbg !185
  ret void, !dbg !186
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes() #0 !dbg !187 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !188
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !188
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !188
  %1 = load i16, i16* %key, align 2, !dbg !188
  %call = call zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !189
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !190
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !190
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !190
  store i16 %call, i16* %fingerprint, align 2, !dbg !191
  ret void, !dbg !192
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_fingerprint(i16 zeroext %key) #0 !dbg !193 {
entry:
  %key.addr = alloca i16, align 2
  store i16 %key, i16* %key.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %key.addr, metadata !196, metadata !DIExpression()), !dbg !197
  %0 = bitcast i16* %key.addr to i8*, !dbg !198
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !199
  ret i16 %call, !dbg !200
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_1() #0 !dbg !201 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !202
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !202
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !202
  %1 = load i16, i16* %key, align 2, !dbg !202
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !203
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !204
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !204
  store i16 %call, i16* %index1, align 2, !dbg !205
  ret void, !dbg !206
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_index(i16 zeroext %fp) #0 !dbg !207 {
entry:
  %fp.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  store i16 %fp, i16* %fp.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fp.addr, metadata !211, metadata !DIExpression()), !dbg !212
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !213, metadata !DIExpression()), !dbg !215
  %0 = bitcast i16* %fp.addr to i8*, !dbg !216
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !217
  store i16 %call, i16* %hash, align 2, !dbg !215
  %1 = load i16, i16* %hash, align 2, !dbg !218
  %and = and i16 %1, 127, !dbg !219
  ret i16 %and, !dbg !220
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() #0 !dbg !221 {
entry:
  %fp_hash = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !222, metadata !DIExpression()), !dbg !223
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !224
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !224
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !224
  %1 = load i16, i16* %fingerprint, align 2, !dbg !224
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !225
  store i16 %call, i16* %fp_hash, align 2, !dbg !223
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !226
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !226
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !226
  %3 = load i16, i16* %index1, align 2, !dbg !226
  %4 = load i16, i16* %fp_hash, align 2, !dbg !227
  %xor = xor i16 %3, %4, !dbg !228
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !229
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !229
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !229
  store i16 %xor, i16* %index2, align 2, !dbg !230
  ret void, !dbg !231
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() #0 !dbg !232 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !233
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !233
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !233
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !235
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !235
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !235
  %2 = load i16, i16* %index1, align 2, !dbg !235
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !233
  %3 = load i16, i16* %arrayidx, align 2, !dbg !233
  %tobool = icmp ne i16 %3, 0, !dbg !233
  br i1 %tobool, label %if.else, label %if.then, !dbg !236

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !237
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !237
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !237
  store i8 1, i8* %success, align 2, !dbg !239
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !240
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !240
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !240
  %6 = load i16, i16* %fingerprint, align 2, !dbg !240
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !241
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !241
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !242
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !242
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !242
  %9 = load i16, i16* %index17, align 2, !dbg !242
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !241
  store i16 %6, i16* %arrayidx8, align 2, !dbg !243
  br label %if.end53, !dbg !244

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !245
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !245
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !245
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !248
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !248
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !248
  %12 = load i16, i16* %index2, align 2, !dbg !248
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !245
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !245
  %tobool13 = icmp ne i16 %13, 0, !dbg !245
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !249

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !250
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !250
  store i8 1, i8* %success16, align 2, !dbg !252
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !253
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !253
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !253
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !254
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !254
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !255
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !255
  %19 = load i16, i16* %index222, align 2, !dbg !255
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !254
  store i16 %16, i16* %arrayidx23, align 2, !dbg !256
  br label %if.end52, !dbg !257

if.else24:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !258, metadata !DIExpression()), !dbg !260
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !261, metadata !DIExpression()), !dbg !262
  %call = call i16 @rand(), !dbg !263
  %rem = srem i16 %call, 2, !dbg !265
  %tobool25 = icmp ne i16 %rem, 0, !dbg !265
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !266

if.then26:                                        ; preds = %if.else24
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !267
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !267
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !267
  %21 = load i16, i16* %index128, align 2, !dbg !267
  store i16 %21, i16* %index_victim, align 2, !dbg !269
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !270
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !270
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !271
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !271
  %24 = load i16, i16* %index132, align 2, !dbg !271
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %24, !dbg !270
  %25 = load i16, i16* %arrayidx33, align 2, !dbg !270
  store i16 %25, i16* %fp_victim, align 2, !dbg !272
  br label %if.end, !dbg !273

if.else34:                                        ; preds = %if.else24
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !274
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !274
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !274
  %27 = load i16, i16* %index236, align 2, !dbg !274
  store i16 %27, i16* %index_victim, align 2, !dbg !276
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !277
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !277
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !278
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !278
  %30 = load i16, i16* %index240, align 2, !dbg !278
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %30, !dbg !277
  %31 = load i16, i16* %arrayidx41, align 2, !dbg !277
  store i16 %31, i16* %fp_victim, align 2, !dbg !279
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !280
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !280
  %33 = load i16, i16* %fingerprint43, align 2, !dbg !280
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !281
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !281
  %35 = load i16, i16* %index_victim, align 2, !dbg !282
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %35, !dbg !281
  store i16 %33, i16* %arrayidx46, align 2, !dbg !283
  %36 = load i16, i16* %index_victim, align 2, !dbg !284
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !285
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !285
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !285
  store i16 %36, i16* %index148, align 2, !dbg !286
  %38 = load i16, i16* %fp_victim, align 2, !dbg !287
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !288
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !288
  store i16 %38, i16* %fingerprint50, align 2, !dbg !289
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !290
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !290
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !290
  store i16 0, i16* %relocation_count, align 2, !dbg !291
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  ret void, !dbg !292
}

declare dso_local i16 @rand() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() #0 !dbg !293 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !294, metadata !DIExpression()), !dbg !295
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !296
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !296
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !296
  %1 = load i16, i16* %fingerprint, align 2, !dbg !296
  store i16 %1, i16* %fp_victim, align 2, !dbg !295
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !297, metadata !DIExpression()), !dbg !298
  %2 = load i16, i16* %fp_victim, align 2, !dbg !299
  %call = call zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !300
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !298
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !301, metadata !DIExpression()), !dbg !302
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !303
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !303
  %4 = load i16, i16* %index1, align 2, !dbg !303
  %5 = load i16, i16* %fp_hash_victim, align 2, !dbg !304
  %xor = xor i16 %4, %5, !dbg !305
  store i16 %xor, i16* %index2_victim, align 2, !dbg !302
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !306
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !306
  %7 = load i16, i16* %index2_victim, align 2, !dbg !308
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %7, !dbg !306
  %8 = load i16, i16* %arrayidx, align 2, !dbg !306
  %tobool = icmp ne i16 %8, 0, !dbg !306
  br i1 %tobool, label %if.end, label %if.then, !dbg !309

if.then:                                          ; preds = %entry
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !310
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !310
  store i8 1, i8* %success, align 2, !dbg !312
  %10 = load i16, i16* %fp_victim, align 2, !dbg !313
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !314
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !314
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !314
  %12 = load i16, i16* %index2_victim, align 2, !dbg !315
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %12, !dbg !314
  store i16 %10, i16* %arrayidx6, align 2, !dbg !316
  br label %return, !dbg !317

if.end:                                           ; preds = %entry
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !318
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !318
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !318
  %14 = load i16, i16* %relocation_count, align 2, !dbg !318
  %cmp = icmp uge i16 %14, 8, !dbg !320
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !321

if.then8:                                         ; preds = %if.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !322
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !322
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !322
  store i8 0, i8* %success10, align 2, !dbg !324
  br label %return, !dbg !325

if.end11:                                         ; preds = %if.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !326
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !326
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !326
  %17 = load i16, i16* %relocation_count13, align 2, !dbg !327
  %inc = add i16 %17, 1, !dbg !327
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !327
  %18 = load i16, i16* %index2_victim, align 2, !dbg !328
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !329
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !329
  store i16 %18, i16* %index115, align 2, !dbg !330
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !331
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !331
  %21 = load i16, i16* %index2_victim, align 2, !dbg !332
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %21, !dbg !331
  %22 = load i16, i16* %arrayidx18, align 2, !dbg !331
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !333
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !333
  store i16 %22, i16* %fingerprint20, align 2, !dbg !334
  %24 = load i16, i16* %fp_victim, align 2, !dbg !335
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !336
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !336
  %26 = load i16, i16* %index2_victim, align 2, !dbg !337
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %26, !dbg !336
  store i16 %24, i16* %arrayidx23, align 2, !dbg !338
  br label %return, !dbg !339

return:                                           ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !339
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() #0 !dbg !340 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !341
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !341
  %1 = load i16, i16* %insert_count, align 2, !dbg !342
  %inc = add i16 %1, 1, !dbg !342
  store i16 %inc, i16* %insert_count, align 2, !dbg !342
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !343
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !343
  %3 = load i8, i8* %success, align 2, !dbg !343
  %tobool = trunc i8 %3 to i1, !dbg !343
  %conv = zext i1 %tobool to i16, !dbg !343
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !344
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !344
  %5 = load i16, i16* %inserted_count, align 2, !dbg !345
  %add = add i16 %5, %conv, !dbg !345
  store i16 %add, i16* %inserted_count, align 2, !dbg !345
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !346
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !346
  %7 = load i16, i16* %insert_count4, align 2, !dbg !346
  %cmp = icmp ult i16 %7, 32, !dbg !348
  br i1 %cmp, label %if.then, label %if.else, !dbg !349

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !350

if.else:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !352
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !352
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !352
  store i16 1, i16* %key, align 2, !dbg !354
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !355
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #0 !dbg !356 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !357
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !357
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !357
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !359
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !359
  %2 = load i16, i16* %index1, align 2, !dbg !359
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !357
  %3 = load i16, i16* %arrayidx, align 2, !dbg !357
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !360
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !360
  %5 = load i16, i16* %fingerprint, align 2, !dbg !360
  %cmp = icmp eq i16 %3, %5, !dbg !361
  br i1 %cmp, label %if.then, label %if.else, !dbg !362

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !363
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !363
  store i8 1, i8* %member, align 1, !dbg !365
  br label %if.end17, !dbg !366

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !367
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !367
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !370
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !370
  %9 = load i16, i16* %index2, align 2, !dbg !370
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !367
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !367
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !371
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !371
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !371
  %cmp10 = icmp eq i16 %10, %12, !dbg !372
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !373

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !374
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !374
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !374
  store i8 1, i8* %member13, align 1, !dbg !376
  br label %if.end, !dbg !377

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !378
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !378
  store i8 0, i8* %member16, align 1, !dbg !380
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !381
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !381
  %member19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 11, !dbg !381
  %16 = load i8, i8* %member19, align 1, !dbg !381
  %tobool = trunc i8 %16 to i1, !dbg !381
  br i1 %tobool, label %if.end21, label %if.then20, !dbg !383

if.then20:                                        ; preds = %if.end17
  br label %if.end21, !dbg !384

if.end21:                                         ; preds = %if.then20, %if.end17
  ret void, !dbg !386
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #0 !dbg !387 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !388
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !388
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !388
  %1 = load i16, i16* %lookup_count, align 2, !dbg !389
  %inc = add i16 %1, 1, !dbg !389
  store i16 %inc, i16* %lookup_count, align 2, !dbg !389
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !390
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !390
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !390
  %3 = load i8, i8* %member, align 1, !dbg !390
  %tobool = trunc i8 %3 to i1, !dbg !390
  %conv = zext i1 %tobool to i16, !dbg !390
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !391
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !391
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !391
  %5 = load i16, i16* %member_count, align 2, !dbg !392
  %add = add i16 %5, %conv, !dbg !392
  store i16 %add, i16* %member_count, align 2, !dbg !392
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !393
  %lookup_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !393
  %7 = load i16, i16* %lookup_count4, align 2, !dbg !393
  %cmp = icmp ult i16 %7, 32, !dbg !395
  br i1 %cmp, label %if.then, label %if.else, !dbg !396

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !397

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !399
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !400 {
entry:
  call void @exit(i16 0) #6, !dbg !401
  unreachable, !dbg !401
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !402 {
entry:
  ret void, !dbg !403
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !404 {
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
  %__x53 = alloca i16, align 2
  %tmp54 = alloca i16, align 2
  %__x56 = alloca i16, align 2
  %tmp57 = alloca i16, align 2
  %__x66 = alloca i16, align 2
  %tmp67 = alloca i16, align 2
  %__x69 = alloca i16, align 2
  %tmp70 = alloca i16, align 2
  %__x83 = alloca i16, align 2
  %tmp84 = alloca i16, align 2
  %__x86 = alloca i16, align 2
  %tmp87 = alloca i16, align 2
  %__x96 = alloca i16, align 2
  %tmp97 = alloca i16, align 2
  %__x99 = alloca i16, align 2
  %tmp100 = alloca i16, align 2
  %__x113 = alloca i16, align 2
  %tmp114 = alloca i16, align 2
  %__x116 = alloca i16, align 2
  %tmp117 = alloca i16, align 2
  %__x126 = alloca i16, align 2
  %tmp127 = alloca i16, align 2
  %__x129 = alloca i16, align 2
  %tmp130 = alloca i16, align 2
  %__x146 = alloca i16, align 2
  %tmp147 = alloca i16, align 2
  %__x149 = alloca i16, align 2
  %tmp150 = alloca i16, align 2
  %__x159 = alloca i16, align 2
  %tmp160 = alloca i16, align 2
  %__x162 = alloca i16, align 2
  %tmp163 = alloca i16, align 2
  %__x194 = alloca i16, align 2
  %tmp195 = alloca i16, align 2
  %__x197 = alloca i16, align 2
  %tmp198 = alloca i16, align 2
  %__x207 = alloca i16, align 2
  %tmp208 = alloca i16, align 2
  %__x210 = alloca i16, align 2
  %tmp211 = alloca i16, align 2
  %__x226 = alloca i16, align 2
  %tmp227 = alloca i16, align 2
  %__x229 = alloca i16, align 2
  %tmp230 = alloca i16, align 2
  %__x239 = alloca i16, align 2
  %tmp240 = alloca i16, align 2
  %__x242 = alloca i16, align 2
  %tmp243 = alloca i16, align 2
  %__x258 = alloca i16, align 2
  %tmp259 = alloca i16, align 2
  %__x261 = alloca i16, align 2
  %tmp262 = alloca i16, align 2
  %__x271 = alloca i16, align 2
  %tmp272 = alloca i16, align 2
  %__x274 = alloca i16, align 2
  %tmp275 = alloca i16, align 2
  %__x289 = alloca i16, align 2
  %tmp290 = alloca i16, align 2
  %__x292 = alloca i16, align 2
  %tmp293 = alloca i16, align 2
  %__x302 = alloca i16, align 2
  %tmp303 = alloca i16, align 2
  %__x305 = alloca i16, align 2
  %tmp306 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !408
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !410
  call void @camel_init(), !dbg !411
  call void @task_init(), !dbg !412
  br label %do.body, !dbg !413

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !414
  %cmp = icmp eq i16 %0, 1, !dbg !414
  br i1 %cmp, label %if.then, label %if.else, !dbg !417

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !418
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !418
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !418
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !418
  call void @__dump_registers(i16* %arraydecay), !dbg !418
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !420, metadata !DIExpression()), !dbg !422
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !422, !srcloc !423
  store i16 %2, i16* %__x, align 2, !dbg !422
  %3 = load i16, i16* %__x, align 2, !dbg !422
  store i16 %3, i16* %tmp, align 2, !dbg !422
  %4 = load i16, i16* %tmp, align 2, !dbg !422
  %add = add i16 %4, 2, !dbg !418
  %5 = inttoptr i16 %add to i8*, !dbg !418
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !424, metadata !DIExpression()), !dbg !426
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !426, !srcloc !427
  store i16 %6, i16* %__x1, align 2, !dbg !426
  %7 = load i16, i16* %__x1, align 2, !dbg !426
  store i16 %7, i16* %tmp2, align 2, !dbg !426
  %8 = load i16, i16* %tmp2, align 2, !dbg !426
  %add3 = add i16 %8, 2, !dbg !418
  %sub = sub i16 9216, %add3, !dbg !418
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !418
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !418
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !418
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !418
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !418
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 300, i16 zeroext %11), !dbg !418
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !418
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !418
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !418
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !418
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !418
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !418
  br label %if.end, !dbg !418

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !428
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !428
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !428
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !428
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !428
  call void @__dump_registers(i16* %arraydecay6), !dbg !428
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !430, metadata !DIExpression()), !dbg !432
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !432, !srcloc !433
  store i16 %15, i16* %__x7, align 2, !dbg !432
  %16 = load i16, i16* %__x7, align 2, !dbg !432
  store i16 %16, i16* %tmp8, align 2, !dbg !432
  %17 = load i16, i16* %tmp8, align 2, !dbg !432
  %add9 = add i16 %17, 2, !dbg !428
  %18 = inttoptr i16 %add9 to i8*, !dbg !428
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !434, metadata !DIExpression()), !dbg !436
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !436, !srcloc !437
  store i16 %19, i16* %__x10, align 2, !dbg !436
  %20 = load i16, i16* %__x10, align 2, !dbg !436
  store i16 %20, i16* %tmp11, align 2, !dbg !436
  %21 = load i16, i16* %tmp11, align 2, !dbg !436
  %add12 = add i16 %21, 2, !dbg !428
  %sub13 = sub i16 9216, %add12, !dbg !428
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !428
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !428
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !428
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !428
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !428
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 300, i16 zeroext %24), !dbg !428
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !428
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !428
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !428
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !428
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !428
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !428
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !417

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !438
  br label %while.cond, !dbg !439

while.cond:                                       ; preds = %if.end314, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !440
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !440
  %28 = load i16, i16* %lookup_count, align 2, !dbg !440
  %cmp17 = icmp ult i16 %28, 32, !dbg !441
  br i1 %cmp17, label %while.body, label %while.end315, !dbg !439

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !442
  br label %do.body18, !dbg !444

do.body18:                                        ; preds = %while.body
  %29 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !445
  %cmp19 = icmp eq i16 %29, 1, !dbg !445
  br i1 %cmp19, label %if.then20, label %if.else33, !dbg !448

if.then20:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !449
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %reg_file21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 0, !dbg !449
  %arraydecay22 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file21, i16 0, i16 0, !dbg !449
  call void @__dump_registers(i16* %arraydecay22), !dbg !449
  call void @llvm.dbg.declare(metadata i16* %__x23, metadata !451, metadata !DIExpression()), !dbg !453
  %31 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !453, !srcloc !454
  store i16 %31, i16* %__x23, align 2, !dbg !453
  %32 = load i16, i16* %__x23, align 2, !dbg !453
  store i16 %32, i16* %tmp24, align 2, !dbg !453
  %33 = load i16, i16* %tmp24, align 2, !dbg !453
  %add25 = add i16 %33, 2, !dbg !449
  %34 = inttoptr i16 %add25 to i8*, !dbg !449
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !455, metadata !DIExpression()), !dbg !457
  %35 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !457, !srcloc !458
  store i16 %35, i16* %__x26, align 2, !dbg !457
  %36 = load i16, i16* %__x26, align 2, !dbg !457
  store i16 %36, i16* %tmp27, align 2, !dbg !457
  %37 = load i16, i16* %tmp27, align 2, !dbg !457
  %add28 = add i16 %37, 2, !dbg !449
  %sub29 = sub i16 9216, %add28, !dbg !449
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext %sub29, i16 zeroext -1), !dbg !449
  store i16 %call30, i16* @tmp_stack_crc, align 2, !dbg !449
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %39 = bitcast %struct.camel_buffer_t* %38 to i8*, !dbg !449
  %40 = load i16, i16* @tmp_stack_crc, align 2, !dbg !449
  %call31 = call zeroext i16 @__fast_hw_crc(i8* %39, i16 zeroext 300, i16 zeroext %40), !dbg !449
  store i16 %call31, i16* @tmp_stack_buf_crc, align 2, !dbg !449
  %41 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !449
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %stack_and_buf_crc32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 2, !dbg !449
  store i16 %41, i16* %stack_and_buf_crc32, align 2, !dbg !449
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !449
  br label %if.end46, !dbg !449

if.else33:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !459
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !459
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %reg_file34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !459
  %arraydecay35 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file34, i16 0, i16 0, !dbg !459
  call void @__dump_registers(i16* %arraydecay35), !dbg !459
  call void @llvm.dbg.declare(metadata i16* %__x36, metadata !461, metadata !DIExpression()), !dbg !463
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !463, !srcloc !464
  store i16 %44, i16* %__x36, align 2, !dbg !463
  %45 = load i16, i16* %__x36, align 2, !dbg !463
  store i16 %45, i16* %tmp37, align 2, !dbg !463
  %46 = load i16, i16* %tmp37, align 2, !dbg !463
  %add38 = add i16 %46, 2, !dbg !459
  %47 = inttoptr i16 %add38 to i8*, !dbg !459
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !465, metadata !DIExpression()), !dbg !467
  %48 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !467, !srcloc !468
  store i16 %48, i16* %__x39, align 2, !dbg !467
  %49 = load i16, i16* %__x39, align 2, !dbg !467
  store i16 %49, i16* %tmp40, align 2, !dbg !467
  %50 = load i16, i16* %tmp40, align 2, !dbg !467
  %add41 = add i16 %50, 2, !dbg !459
  %sub42 = sub i16 9216, %add41, !dbg !459
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext %sub42, i16 zeroext -1), !dbg !459
  store i16 %call43, i16* @tmp_stack_crc, align 2, !dbg !459
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %52 = bitcast %struct.camel_buffer_t* %51 to i8*, !dbg !459
  %53 = load i16, i16* @tmp_stack_crc, align 2, !dbg !459
  %call44 = call zeroext i16 @__fast_hw_crc(i8* %52, i16 zeroext 300, i16 zeroext %53), !dbg !459
  store i16 %call44, i16* @tmp_stack_buf_crc, align 2, !dbg !459
  %54 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !459
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %stack_and_buf_crc45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 2, !dbg !459
  store i16 %54, i16* %stack_and_buf_crc45, align 2, !dbg !459
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !459
  br label %if.end46

if.end46:                                         ; preds = %if.else33, %if.then20
  br label %do.end47, !dbg !448

do.end47:                                         ; preds = %if.end46
  call void @task_commit(), !dbg !469
  call void @task_calc_indexes(), !dbg !470
  br label %do.body48, !dbg !471

do.body48:                                        ; preds = %do.end47
  %56 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !472
  %cmp49 = icmp eq i16 %56, 1, !dbg !472
  br i1 %cmp49, label %if.then50, label %if.else63, !dbg !475

if.then50:                                        ; preds = %do.body48
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !476
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !476
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %reg_file51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 0, !dbg !476
  %arraydecay52 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file51, i16 0, i16 0, !dbg !476
  call void @__dump_registers(i16* %arraydecay52), !dbg !476
  call void @llvm.dbg.declare(metadata i16* %__x53, metadata !478, metadata !DIExpression()), !dbg !480
  %58 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !480, !srcloc !481
  store i16 %58, i16* %__x53, align 2, !dbg !480
  %59 = load i16, i16* %__x53, align 2, !dbg !480
  store i16 %59, i16* %tmp54, align 2, !dbg !480
  %60 = load i16, i16* %tmp54, align 2, !dbg !480
  %add55 = add i16 %60, 2, !dbg !476
  %61 = inttoptr i16 %add55 to i8*, !dbg !476
  call void @llvm.dbg.declare(metadata i16* %__x56, metadata !482, metadata !DIExpression()), !dbg !484
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !484, !srcloc !485
  store i16 %62, i16* %__x56, align 2, !dbg !484
  %63 = load i16, i16* %__x56, align 2, !dbg !484
  store i16 %63, i16* %tmp57, align 2, !dbg !484
  %64 = load i16, i16* %tmp57, align 2, !dbg !484
  %add58 = add i16 %64, 2, !dbg !476
  %sub59 = sub i16 9216, %add58, !dbg !476
  %call60 = call zeroext i16 @__fast_hw_crc(i8* %61, i16 zeroext %sub59, i16 zeroext -1), !dbg !476
  store i16 %call60, i16* @tmp_stack_crc, align 2, !dbg !476
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %66 = bitcast %struct.camel_buffer_t* %65 to i8*, !dbg !476
  %67 = load i16, i16* @tmp_stack_crc, align 2, !dbg !476
  %call61 = call zeroext i16 @__fast_hw_crc(i8* %66, i16 zeroext 300, i16 zeroext %67), !dbg !476
  store i16 %call61, i16* @tmp_stack_buf_crc, align 2, !dbg !476
  %68 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !476
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %stack_and_buf_crc62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i32 0, i32 2, !dbg !476
  store i16 %68, i16* %stack_and_buf_crc62, align 2, !dbg !476
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !476
  br label %if.end76, !dbg !476

if.else63:                                        ; preds = %do.body48
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !486
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %reg_file64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %70, i32 0, i32 0, !dbg !486
  %arraydecay65 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file64, i16 0, i16 0, !dbg !486
  call void @__dump_registers(i16* %arraydecay65), !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x66, metadata !488, metadata !DIExpression()), !dbg !490
  %71 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !490, !srcloc !491
  store i16 %71, i16* %__x66, align 2, !dbg !490
  %72 = load i16, i16* %__x66, align 2, !dbg !490
  store i16 %72, i16* %tmp67, align 2, !dbg !490
  %73 = load i16, i16* %tmp67, align 2, !dbg !490
  %add68 = add i16 %73, 2, !dbg !486
  %74 = inttoptr i16 %add68 to i8*, !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x69, metadata !492, metadata !DIExpression()), !dbg !494
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !494, !srcloc !495
  store i16 %75, i16* %__x69, align 2, !dbg !494
  %76 = load i16, i16* %__x69, align 2, !dbg !494
  store i16 %76, i16* %tmp70, align 2, !dbg !494
  %77 = load i16, i16* %tmp70, align 2, !dbg !494
  %add71 = add i16 %77, 2, !dbg !486
  %sub72 = sub i16 9216, %add71, !dbg !486
  %call73 = call zeroext i16 @__fast_hw_crc(i8* %74, i16 zeroext %sub72, i16 zeroext -1), !dbg !486
  store i16 %call73, i16* @tmp_stack_crc, align 2, !dbg !486
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %79 = bitcast %struct.camel_buffer_t* %78 to i8*, !dbg !486
  %80 = load i16, i16* @tmp_stack_crc, align 2, !dbg !486
  %call74 = call zeroext i16 @__fast_hw_crc(i8* %79, i16 zeroext 300, i16 zeroext %80), !dbg !486
  store i16 %call74, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %81 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %stack_and_buf_crc75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %82, i32 0, i32 2, !dbg !486
  store i16 %81, i16* %stack_and_buf_crc75, align 2, !dbg !486
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !486
  br label %if.end76

if.end76:                                         ; preds = %if.else63, %if.then50
  br label %do.end77, !dbg !475

do.end77:                                         ; preds = %if.end76
  call void @task_commit(), !dbg !496
  call void @task_calc_indexes_index_1(), !dbg !497
  br label %do.body78, !dbg !498

do.body78:                                        ; preds = %do.end77
  %83 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !499
  %cmp79 = icmp eq i16 %83, 1, !dbg !499
  br i1 %cmp79, label %if.then80, label %if.else93, !dbg !502

if.then80:                                        ; preds = %do.body78
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !503
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !503
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %reg_file81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 0, !dbg !503
  %arraydecay82 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file81, i16 0, i16 0, !dbg !503
  call void @__dump_registers(i16* %arraydecay82), !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x83, metadata !505, metadata !DIExpression()), !dbg !507
  %85 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !507, !srcloc !508
  store i16 %85, i16* %__x83, align 2, !dbg !507
  %86 = load i16, i16* %__x83, align 2, !dbg !507
  store i16 %86, i16* %tmp84, align 2, !dbg !507
  %87 = load i16, i16* %tmp84, align 2, !dbg !507
  %add85 = add i16 %87, 2, !dbg !503
  %88 = inttoptr i16 %add85 to i8*, !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x86, metadata !509, metadata !DIExpression()), !dbg !511
  %89 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !511, !srcloc !512
  store i16 %89, i16* %__x86, align 2, !dbg !511
  %90 = load i16, i16* %__x86, align 2, !dbg !511
  store i16 %90, i16* %tmp87, align 2, !dbg !511
  %91 = load i16, i16* %tmp87, align 2, !dbg !511
  %add88 = add i16 %91, 2, !dbg !503
  %sub89 = sub i16 9216, %add88, !dbg !503
  %call90 = call zeroext i16 @__fast_hw_crc(i8* %88, i16 zeroext %sub89, i16 zeroext -1), !dbg !503
  store i16 %call90, i16* @tmp_stack_crc, align 2, !dbg !503
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %93 = bitcast %struct.camel_buffer_t* %92 to i8*, !dbg !503
  %94 = load i16, i16* @tmp_stack_crc, align 2, !dbg !503
  %call91 = call zeroext i16 @__fast_hw_crc(i8* %93, i16 zeroext 300, i16 zeroext %94), !dbg !503
  store i16 %call91, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %95 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %stack_and_buf_crc92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %96, i32 0, i32 2, !dbg !503
  store i16 %95, i16* %stack_and_buf_crc92, align 2, !dbg !503
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !503
  br label %if.end106, !dbg !503

if.else93:                                        ; preds = %do.body78
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !513
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !513
  %97 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %reg_file94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %97, i32 0, i32 0, !dbg !513
  %arraydecay95 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file94, i16 0, i16 0, !dbg !513
  call void @__dump_registers(i16* %arraydecay95), !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x96, metadata !515, metadata !DIExpression()), !dbg !517
  %98 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !517, !srcloc !518
  store i16 %98, i16* %__x96, align 2, !dbg !517
  %99 = load i16, i16* %__x96, align 2, !dbg !517
  store i16 %99, i16* %tmp97, align 2, !dbg !517
  %100 = load i16, i16* %tmp97, align 2, !dbg !517
  %add98 = add i16 %100, 2, !dbg !513
  %101 = inttoptr i16 %add98 to i8*, !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x99, metadata !519, metadata !DIExpression()), !dbg !521
  %102 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !521, !srcloc !522
  store i16 %102, i16* %__x99, align 2, !dbg !521
  %103 = load i16, i16* %__x99, align 2, !dbg !521
  store i16 %103, i16* %tmp100, align 2, !dbg !521
  %104 = load i16, i16* %tmp100, align 2, !dbg !521
  %add101 = add i16 %104, 2, !dbg !513
  %sub102 = sub i16 9216, %add101, !dbg !513
  %call103 = call zeroext i16 @__fast_hw_crc(i8* %101, i16 zeroext %sub102, i16 zeroext -1), !dbg !513
  store i16 %call103, i16* @tmp_stack_crc, align 2, !dbg !513
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %106 = bitcast %struct.camel_buffer_t* %105 to i8*, !dbg !513
  %107 = load i16, i16* @tmp_stack_crc, align 2, !dbg !513
  %call104 = call zeroext i16 @__fast_hw_crc(i8* %106, i16 zeroext 300, i16 zeroext %107), !dbg !513
  store i16 %call104, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %108 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %stack_and_buf_crc105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %109, i32 0, i32 2, !dbg !513
  store i16 %108, i16* %stack_and_buf_crc105, align 2, !dbg !513
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !513
  br label %if.end106

if.end106:                                        ; preds = %if.else93, %if.then80
  br label %do.end107, !dbg !502

do.end107:                                        ; preds = %if.end106
  call void @task_commit(), !dbg !523
  call void @task_calc_indexes_index_2(), !dbg !524
  br label %do.body108, !dbg !525

do.body108:                                       ; preds = %do.end107
  %110 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !526
  %cmp109 = icmp eq i16 %110, 1, !dbg !526
  br i1 %cmp109, label %if.then110, label %if.else123, !dbg !529

if.then110:                                       ; preds = %do.body108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !530
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !530
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %reg_file111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 0, !dbg !530
  %arraydecay112 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file111, i16 0, i16 0, !dbg !530
  call void @__dump_registers(i16* %arraydecay112), !dbg !530
  call void @llvm.dbg.declare(metadata i16* %__x113, metadata !532, metadata !DIExpression()), !dbg !534
  %112 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !534, !srcloc !535
  store i16 %112, i16* %__x113, align 2, !dbg !534
  %113 = load i16, i16* %__x113, align 2, !dbg !534
  store i16 %113, i16* %tmp114, align 2, !dbg !534
  %114 = load i16, i16* %tmp114, align 2, !dbg !534
  %add115 = add i16 %114, 2, !dbg !530
  %115 = inttoptr i16 %add115 to i8*, !dbg !530
  call void @llvm.dbg.declare(metadata i16* %__x116, metadata !536, metadata !DIExpression()), !dbg !538
  %116 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !538, !srcloc !539
  store i16 %116, i16* %__x116, align 2, !dbg !538
  %117 = load i16, i16* %__x116, align 2, !dbg !538
  store i16 %117, i16* %tmp117, align 2, !dbg !538
  %118 = load i16, i16* %tmp117, align 2, !dbg !538
  %add118 = add i16 %118, 2, !dbg !530
  %sub119 = sub i16 9216, %add118, !dbg !530
  %call120 = call zeroext i16 @__fast_hw_crc(i8* %115, i16 zeroext %sub119, i16 zeroext -1), !dbg !530
  store i16 %call120, i16* @tmp_stack_crc, align 2, !dbg !530
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %120 = bitcast %struct.camel_buffer_t* %119 to i8*, !dbg !530
  %121 = load i16, i16* @tmp_stack_crc, align 2, !dbg !530
  %call121 = call zeroext i16 @__fast_hw_crc(i8* %120, i16 zeroext 300, i16 zeroext %121), !dbg !530
  store i16 %call121, i16* @tmp_stack_buf_crc, align 2, !dbg !530
  %122 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !530
  %123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %stack_and_buf_crc122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %123, i32 0, i32 2, !dbg !530
  store i16 %122, i16* %stack_and_buf_crc122, align 2, !dbg !530
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !530
  br label %if.end136, !dbg !530

if.else123:                                       ; preds = %do.body108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !540
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !540
  %124 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %reg_file124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i32 0, i32 0, !dbg !540
  %arraydecay125 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file124, i16 0, i16 0, !dbg !540
  call void @__dump_registers(i16* %arraydecay125), !dbg !540
  call void @llvm.dbg.declare(metadata i16* %__x126, metadata !542, metadata !DIExpression()), !dbg !544
  %125 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !544, !srcloc !545
  store i16 %125, i16* %__x126, align 2, !dbg !544
  %126 = load i16, i16* %__x126, align 2, !dbg !544
  store i16 %126, i16* %tmp127, align 2, !dbg !544
  %127 = load i16, i16* %tmp127, align 2, !dbg !544
  %add128 = add i16 %127, 2, !dbg !540
  %128 = inttoptr i16 %add128 to i8*, !dbg !540
  call void @llvm.dbg.declare(metadata i16* %__x129, metadata !546, metadata !DIExpression()), !dbg !548
  %129 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !548, !srcloc !549
  store i16 %129, i16* %__x129, align 2, !dbg !548
  %130 = load i16, i16* %__x129, align 2, !dbg !548
  store i16 %130, i16* %tmp130, align 2, !dbg !548
  %131 = load i16, i16* %tmp130, align 2, !dbg !548
  %add131 = add i16 %131, 2, !dbg !540
  %sub132 = sub i16 9216, %add131, !dbg !540
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %128, i16 zeroext %sub132, i16 zeroext -1), !dbg !540
  store i16 %call133, i16* @tmp_stack_crc, align 2, !dbg !540
  %132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %133 = bitcast %struct.camel_buffer_t* %132 to i8*, !dbg !540
  %134 = load i16, i16* @tmp_stack_crc, align 2, !dbg !540
  %call134 = call zeroext i16 @__fast_hw_crc(i8* %133, i16 zeroext 300, i16 zeroext %134), !dbg !540
  store i16 %call134, i16* @tmp_stack_buf_crc, align 2, !dbg !540
  %135 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !540
  %136 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %stack_and_buf_crc135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %136, i32 0, i32 2, !dbg !540
  store i16 %135, i16* %stack_and_buf_crc135, align 2, !dbg !540
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !540
  br label %if.end136

if.end136:                                        ; preds = %if.else123, %if.then110
  br label %do.end137, !dbg !529

do.end137:                                        ; preds = %if.end136
  call void @task_commit(), !dbg !550
  %137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !551
  %globals138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %137, i32 0, i32 1, !dbg !551
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals138, i32 0, i32 6, !dbg !551
  %138 = load i16, i16* %insert_count, align 2, !dbg !551
  %cmp139 = icmp ult i16 %138, 32, !dbg !553
  br i1 %cmp139, label %if.then140, label %if.else251, !dbg !554

if.then140:                                       ; preds = %do.end137
  call void @task_add(), !dbg !555
  br label %do.body141, !dbg !557

do.body141:                                       ; preds = %if.then140
  %139 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !558
  %cmp142 = icmp eq i16 %139, 1, !dbg !558
  br i1 %cmp142, label %if.then143, label %if.else156, !dbg !561

if.then143:                                       ; preds = %do.body141
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !562
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !562
  %140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %reg_file144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %140, i32 0, i32 0, !dbg !562
  %arraydecay145 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file144, i16 0, i16 0, !dbg !562
  call void @__dump_registers(i16* %arraydecay145), !dbg !562
  call void @llvm.dbg.declare(metadata i16* %__x146, metadata !564, metadata !DIExpression()), !dbg !566
  %141 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !566, !srcloc !567
  store i16 %141, i16* %__x146, align 2, !dbg !566
  %142 = load i16, i16* %__x146, align 2, !dbg !566
  store i16 %142, i16* %tmp147, align 2, !dbg !566
  %143 = load i16, i16* %tmp147, align 2, !dbg !566
  %add148 = add i16 %143, 2, !dbg !562
  %144 = inttoptr i16 %add148 to i8*, !dbg !562
  call void @llvm.dbg.declare(metadata i16* %__x149, metadata !568, metadata !DIExpression()), !dbg !570
  %145 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !570, !srcloc !571
  store i16 %145, i16* %__x149, align 2, !dbg !570
  %146 = load i16, i16* %__x149, align 2, !dbg !570
  store i16 %146, i16* %tmp150, align 2, !dbg !570
  %147 = load i16, i16* %tmp150, align 2, !dbg !570
  %add151 = add i16 %147, 2, !dbg !562
  %sub152 = sub i16 9216, %add151, !dbg !562
  %call153 = call zeroext i16 @__fast_hw_crc(i8* %144, i16 zeroext %sub152, i16 zeroext -1), !dbg !562
  store i16 %call153, i16* @tmp_stack_crc, align 2, !dbg !562
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %149 = bitcast %struct.camel_buffer_t* %148 to i8*, !dbg !562
  %150 = load i16, i16* @tmp_stack_crc, align 2, !dbg !562
  %call154 = call zeroext i16 @__fast_hw_crc(i8* %149, i16 zeroext 300, i16 zeroext %150), !dbg !562
  store i16 %call154, i16* @tmp_stack_buf_crc, align 2, !dbg !562
  %151 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !562
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %stack_and_buf_crc155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 2, !dbg !562
  store i16 %151, i16* %stack_and_buf_crc155, align 2, !dbg !562
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !562
  br label %if.end169, !dbg !562

if.else156:                                       ; preds = %do.body141
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !572
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !572
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %reg_file157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 0, !dbg !572
  %arraydecay158 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file157, i16 0, i16 0, !dbg !572
  call void @__dump_registers(i16* %arraydecay158), !dbg !572
  call void @llvm.dbg.declare(metadata i16* %__x159, metadata !574, metadata !DIExpression()), !dbg !576
  %154 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !576, !srcloc !577
  store i16 %154, i16* %__x159, align 2, !dbg !576
  %155 = load i16, i16* %__x159, align 2, !dbg !576
  store i16 %155, i16* %tmp160, align 2, !dbg !576
  %156 = load i16, i16* %tmp160, align 2, !dbg !576
  %add161 = add i16 %156, 2, !dbg !572
  %157 = inttoptr i16 %add161 to i8*, !dbg !572
  call void @llvm.dbg.declare(metadata i16* %__x162, metadata !578, metadata !DIExpression()), !dbg !580
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !580, !srcloc !581
  store i16 %158, i16* %__x162, align 2, !dbg !580
  %159 = load i16, i16* %__x162, align 2, !dbg !580
  store i16 %159, i16* %tmp163, align 2, !dbg !580
  %160 = load i16, i16* %tmp163, align 2, !dbg !580
  %add164 = add i16 %160, 2, !dbg !572
  %sub165 = sub i16 9216, %add164, !dbg !572
  %call166 = call zeroext i16 @__fast_hw_crc(i8* %157, i16 zeroext %sub165, i16 zeroext -1), !dbg !572
  store i16 %call166, i16* @tmp_stack_crc, align 2, !dbg !572
  %161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %162 = bitcast %struct.camel_buffer_t* %161 to i8*, !dbg !572
  %163 = load i16, i16* @tmp_stack_crc, align 2, !dbg !572
  %call167 = call zeroext i16 @__fast_hw_crc(i8* %162, i16 zeroext 300, i16 zeroext %163), !dbg !572
  store i16 %call167, i16* @tmp_stack_buf_crc, align 2, !dbg !572
  %164 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !572
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %stack_and_buf_crc168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %165, i32 0, i32 2, !dbg !572
  store i16 %164, i16* %stack_and_buf_crc168, align 2, !dbg !572
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !572
  br label %if.end169

if.end169:                                        ; preds = %if.else156, %if.then143
  br label %do.end170, !dbg !561

do.end170:                                        ; preds = %if.end169
  call void @task_commit(), !dbg !582
  %166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !583
  %globals171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %166, i32 0, i32 1, !dbg !583
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals171, i32 0, i32 0, !dbg !583
  %167 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !585
  %globals172 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %167, i32 0, i32 1, !dbg !585
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals172, i32 0, i32 3, !dbg !585
  %168 = load i16, i16* %index1, align 2, !dbg !585
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %168, !dbg !583
  %169 = load i16, i16* %arrayidx, align 2, !dbg !583
  %tobool = icmp ne i16 %169, 0, !dbg !583
  br i1 %tobool, label %land.lhs.true, label %if.end219, !dbg !586

land.lhs.true:                                    ; preds = %do.end170
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !587
  %globals173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !587
  %filter174 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals173, i32 0, i32 0, !dbg !587
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !588
  %globals175 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %171, i32 0, i32 1, !dbg !588
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals175, i32 0, i32 4, !dbg !588
  %172 = load i16, i16* %index2, align 2, !dbg !588
  %arrayidx176 = getelementptr inbounds [128 x i16], [128 x i16]* %filter174, i16 0, i16 %172, !dbg !587
  %173 = load i16, i16* %arrayidx176, align 2, !dbg !587
  %tobool177 = icmp ne i16 %173, 0, !dbg !587
  br i1 %tobool177, label %if.then178, label %if.end219, !dbg !589

if.then178:                                       ; preds = %land.lhs.true
  br label %while.cond179, !dbg !590

while.cond179:                                    ; preds = %do.end218, %if.then178
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !592
  %globals180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %174, i32 0, i32 1, !dbg !592
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals180, i32 0, i32 10, !dbg !592
  %175 = load i8, i8* %success, align 2, !dbg !592
  %tobool181 = trunc i8 %175 to i1, !dbg !592
  %conv = zext i1 %tobool181 to i16, !dbg !592
  %cmp182 = icmp eq i16 %conv, 0, !dbg !593
  br i1 %cmp182, label %land.rhs, label %land.end, !dbg !594

land.rhs:                                         ; preds = %while.cond179
  %176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !595
  %globals184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %176, i32 0, i32 1, !dbg !595
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals184, i32 0, i32 5, !dbg !595
  %177 = load i16, i16* %relocation_count, align 2, !dbg !595
  %cmp185 = icmp ult i16 %177, 8, !dbg !596
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond179
  %178 = phi i1 [ false, %while.cond179 ], [ %cmp185, %land.rhs ], !dbg !597
  br i1 %178, label %while.body187, label %while.end, !dbg !590

while.body187:                                    ; preds = %land.end
  call void @task_relocate(), !dbg !598
  br label %do.body188, !dbg !600

do.body188:                                       ; preds = %while.body187
  %179 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !601
  %cmp189 = icmp eq i16 %179, 1, !dbg !601
  br i1 %cmp189, label %if.then191, label %if.else204, !dbg !604

if.then191:                                       ; preds = %do.body188
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !605
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !605
  %180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %reg_file192 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %180, i32 0, i32 0, !dbg !605
  %arraydecay193 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file192, i16 0, i16 0, !dbg !605
  call void @__dump_registers(i16* %arraydecay193), !dbg !605
  call void @llvm.dbg.declare(metadata i16* %__x194, metadata !607, metadata !DIExpression()), !dbg !609
  %181 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !609, !srcloc !610
  store i16 %181, i16* %__x194, align 2, !dbg !609
  %182 = load i16, i16* %__x194, align 2, !dbg !609
  store i16 %182, i16* %tmp195, align 2, !dbg !609
  %183 = load i16, i16* %tmp195, align 2, !dbg !609
  %add196 = add i16 %183, 2, !dbg !605
  %184 = inttoptr i16 %add196 to i8*, !dbg !605
  call void @llvm.dbg.declare(metadata i16* %__x197, metadata !611, metadata !DIExpression()), !dbg !613
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !613, !srcloc !614
  store i16 %185, i16* %__x197, align 2, !dbg !613
  %186 = load i16, i16* %__x197, align 2, !dbg !613
  store i16 %186, i16* %tmp198, align 2, !dbg !613
  %187 = load i16, i16* %tmp198, align 2, !dbg !613
  %add199 = add i16 %187, 2, !dbg !605
  %sub200 = sub i16 9216, %add199, !dbg !605
  %call201 = call zeroext i16 @__fast_hw_crc(i8* %184, i16 zeroext %sub200, i16 zeroext -1), !dbg !605
  store i16 %call201, i16* @tmp_stack_crc, align 2, !dbg !605
  %188 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %189 = bitcast %struct.camel_buffer_t* %188 to i8*, !dbg !605
  %190 = load i16, i16* @tmp_stack_crc, align 2, !dbg !605
  %call202 = call zeroext i16 @__fast_hw_crc(i8* %189, i16 zeroext 300, i16 zeroext %190), !dbg !605
  store i16 %call202, i16* @tmp_stack_buf_crc, align 2, !dbg !605
  %191 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !605
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %stack_and_buf_crc203 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %192, i32 0, i32 2, !dbg !605
  store i16 %191, i16* %stack_and_buf_crc203, align 2, !dbg !605
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !605
  br label %if.end217, !dbg !605

if.else204:                                       ; preds = %do.body188
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !615
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !615
  %193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %reg_file205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %193, i32 0, i32 0, !dbg !615
  %arraydecay206 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file205, i16 0, i16 0, !dbg !615
  call void @__dump_registers(i16* %arraydecay206), !dbg !615
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !617, metadata !DIExpression()), !dbg !619
  %194 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !619, !srcloc !620
  store i16 %194, i16* %__x207, align 2, !dbg !619
  %195 = load i16, i16* %__x207, align 2, !dbg !619
  store i16 %195, i16* %tmp208, align 2, !dbg !619
  %196 = load i16, i16* %tmp208, align 2, !dbg !619
  %add209 = add i16 %196, 2, !dbg !615
  %197 = inttoptr i16 %add209 to i8*, !dbg !615
  call void @llvm.dbg.declare(metadata i16* %__x210, metadata !621, metadata !DIExpression()), !dbg !623
  %198 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !623, !srcloc !624
  store i16 %198, i16* %__x210, align 2, !dbg !623
  %199 = load i16, i16* %__x210, align 2, !dbg !623
  store i16 %199, i16* %tmp211, align 2, !dbg !623
  %200 = load i16, i16* %tmp211, align 2, !dbg !623
  %add212 = add i16 %200, 2, !dbg !615
  %sub213 = sub i16 9216, %add212, !dbg !615
  %call214 = call zeroext i16 @__fast_hw_crc(i8* %197, i16 zeroext %sub213, i16 zeroext -1), !dbg !615
  store i16 %call214, i16* @tmp_stack_crc, align 2, !dbg !615
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %202 = bitcast %struct.camel_buffer_t* %201 to i8*, !dbg !615
  %203 = load i16, i16* @tmp_stack_crc, align 2, !dbg !615
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %202, i16 zeroext 300, i16 zeroext %203), !dbg !615
  store i16 %call215, i16* @tmp_stack_buf_crc, align 2, !dbg !615
  %204 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !615
  %205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %stack_and_buf_crc216 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %205, i32 0, i32 2, !dbg !615
  store i16 %204, i16* %stack_and_buf_crc216, align 2, !dbg !615
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !615
  br label %if.end217

if.end217:                                        ; preds = %if.else204, %if.then191
  br label %do.end218, !dbg !604

do.end218:                                        ; preds = %if.end217
  call void @task_commit(), !dbg !625
  br label %while.cond179, !dbg !590, !llvm.loop !626

while.end:                                        ; preds = %land.end
  br label %if.end219, !dbg !628

if.end219:                                        ; preds = %while.end, %land.lhs.true, %do.end170
  call void @task_insert_done(), !dbg !629
  br label %do.body220, !dbg !630

do.body220:                                       ; preds = %if.end219
  %206 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !631
  %cmp221 = icmp eq i16 %206, 1, !dbg !631
  br i1 %cmp221, label %if.then223, label %if.else236, !dbg !634

if.then223:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !635
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !635
  %207 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %reg_file224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %207, i32 0, i32 0, !dbg !635
  %arraydecay225 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file224, i16 0, i16 0, !dbg !635
  call void @__dump_registers(i16* %arraydecay225), !dbg !635
  call void @llvm.dbg.declare(metadata i16* %__x226, metadata !637, metadata !DIExpression()), !dbg !639
  %208 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !639, !srcloc !640
  store i16 %208, i16* %__x226, align 2, !dbg !639
  %209 = load i16, i16* %__x226, align 2, !dbg !639
  store i16 %209, i16* %tmp227, align 2, !dbg !639
  %210 = load i16, i16* %tmp227, align 2, !dbg !639
  %add228 = add i16 %210, 2, !dbg !635
  %211 = inttoptr i16 %add228 to i8*, !dbg !635
  call void @llvm.dbg.declare(metadata i16* %__x229, metadata !641, metadata !DIExpression()), !dbg !643
  %212 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !643, !srcloc !644
  store i16 %212, i16* %__x229, align 2, !dbg !643
  %213 = load i16, i16* %__x229, align 2, !dbg !643
  store i16 %213, i16* %tmp230, align 2, !dbg !643
  %214 = load i16, i16* %tmp230, align 2, !dbg !643
  %add231 = add i16 %214, 2, !dbg !635
  %sub232 = sub i16 9216, %add231, !dbg !635
  %call233 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext %sub232, i16 zeroext -1), !dbg !635
  store i16 %call233, i16* @tmp_stack_crc, align 2, !dbg !635
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %216 = bitcast %struct.camel_buffer_t* %215 to i8*, !dbg !635
  %217 = load i16, i16* @tmp_stack_crc, align 2, !dbg !635
  %call234 = call zeroext i16 @__fast_hw_crc(i8* %216, i16 zeroext 300, i16 zeroext %217), !dbg !635
  store i16 %call234, i16* @tmp_stack_buf_crc, align 2, !dbg !635
  %218 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !635
  %219 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %stack_and_buf_crc235 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %219, i32 0, i32 2, !dbg !635
  store i16 %218, i16* %stack_and_buf_crc235, align 2, !dbg !635
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !635
  br label %if.end249, !dbg !635

if.else236:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !645
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !645
  %220 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %reg_file237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %220, i32 0, i32 0, !dbg !645
  %arraydecay238 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file237, i16 0, i16 0, !dbg !645
  call void @__dump_registers(i16* %arraydecay238), !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !647, metadata !DIExpression()), !dbg !649
  %221 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !649, !srcloc !650
  store i16 %221, i16* %__x239, align 2, !dbg !649
  %222 = load i16, i16* %__x239, align 2, !dbg !649
  store i16 %222, i16* %tmp240, align 2, !dbg !649
  %223 = load i16, i16* %tmp240, align 2, !dbg !649
  %add241 = add i16 %223, 2, !dbg !645
  %224 = inttoptr i16 %add241 to i8*, !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x242, metadata !651, metadata !DIExpression()), !dbg !653
  %225 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !653, !srcloc !654
  store i16 %225, i16* %__x242, align 2, !dbg !653
  %226 = load i16, i16* %__x242, align 2, !dbg !653
  store i16 %226, i16* %tmp243, align 2, !dbg !653
  %227 = load i16, i16* %tmp243, align 2, !dbg !653
  %add244 = add i16 %227, 2, !dbg !645
  %sub245 = sub i16 9216, %add244, !dbg !645
  %call246 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext %sub245, i16 zeroext -1), !dbg !645
  store i16 %call246, i16* @tmp_stack_crc, align 2, !dbg !645
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %229 = bitcast %struct.camel_buffer_t* %228 to i8*, !dbg !645
  %230 = load i16, i16* @tmp_stack_crc, align 2, !dbg !645
  %call247 = call zeroext i16 @__fast_hw_crc(i8* %229, i16 zeroext 300, i16 zeroext %230), !dbg !645
  store i16 %call247, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %231 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %stack_and_buf_crc248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %232, i32 0, i32 2, !dbg !645
  store i16 %231, i16* %stack_and_buf_crc248, align 2, !dbg !645
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !645
  br label %if.end249

if.end249:                                        ; preds = %if.else236, %if.then223
  br label %do.end250, !dbg !634

do.end250:                                        ; preds = %if.end249
  call void @task_commit(), !dbg !655
  br label %if.end314, !dbg !656

if.else251:                                       ; preds = %do.end137
  call void @task_lookup_search(), !dbg !657
  br label %do.body252, !dbg !659

do.body252:                                       ; preds = %if.else251
  %233 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !660
  %cmp253 = icmp eq i16 %233, 1, !dbg !660
  br i1 %cmp253, label %if.then255, label %if.else268, !dbg !663

if.then255:                                       ; preds = %do.body252
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !664
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %234 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %reg_file256 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %234, i32 0, i32 0, !dbg !664
  %arraydecay257 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file256, i16 0, i16 0, !dbg !664
  call void @__dump_registers(i16* %arraydecay257), !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x258, metadata !666, metadata !DIExpression()), !dbg !668
  %235 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !668, !srcloc !669
  store i16 %235, i16* %__x258, align 2, !dbg !668
  %236 = load i16, i16* %__x258, align 2, !dbg !668
  store i16 %236, i16* %tmp259, align 2, !dbg !668
  %237 = load i16, i16* %tmp259, align 2, !dbg !668
  %add260 = add i16 %237, 2, !dbg !664
  %238 = inttoptr i16 %add260 to i8*, !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x261, metadata !670, metadata !DIExpression()), !dbg !672
  %239 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !672, !srcloc !673
  store i16 %239, i16* %__x261, align 2, !dbg !672
  %240 = load i16, i16* %__x261, align 2, !dbg !672
  store i16 %240, i16* %tmp262, align 2, !dbg !672
  %241 = load i16, i16* %tmp262, align 2, !dbg !672
  %add263 = add i16 %241, 2, !dbg !664
  %sub264 = sub i16 9216, %add263, !dbg !664
  %call265 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext %sub264, i16 zeroext -1), !dbg !664
  store i16 %call265, i16* @tmp_stack_crc, align 2, !dbg !664
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %243 = bitcast %struct.camel_buffer_t* %242 to i8*, !dbg !664
  %244 = load i16, i16* @tmp_stack_crc, align 2, !dbg !664
  %call266 = call zeroext i16 @__fast_hw_crc(i8* %243, i16 zeroext 300, i16 zeroext %244), !dbg !664
  store i16 %call266, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %245 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %246 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %stack_and_buf_crc267 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %246, i32 0, i32 2, !dbg !664
  store i16 %245, i16* %stack_and_buf_crc267, align 2, !dbg !664
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !664
  br label %if.end281, !dbg !664

if.else268:                                       ; preds = %do.body252
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !674
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %247 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %reg_file269 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %247, i32 0, i32 0, !dbg !674
  %arraydecay270 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file269, i16 0, i16 0, !dbg !674
  call void @__dump_registers(i16* %arraydecay270), !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x271, metadata !676, metadata !DIExpression()), !dbg !678
  %248 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !678, !srcloc !679
  store i16 %248, i16* %__x271, align 2, !dbg !678
  %249 = load i16, i16* %__x271, align 2, !dbg !678
  store i16 %249, i16* %tmp272, align 2, !dbg !678
  %250 = load i16, i16* %tmp272, align 2, !dbg !678
  %add273 = add i16 %250, 2, !dbg !674
  %251 = inttoptr i16 %add273 to i8*, !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x274, metadata !680, metadata !DIExpression()), !dbg !682
  %252 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !682, !srcloc !683
  store i16 %252, i16* %__x274, align 2, !dbg !682
  %253 = load i16, i16* %__x274, align 2, !dbg !682
  store i16 %253, i16* %tmp275, align 2, !dbg !682
  %254 = load i16, i16* %tmp275, align 2, !dbg !682
  %add276 = add i16 %254, 2, !dbg !674
  %sub277 = sub i16 9216, %add276, !dbg !674
  %call278 = call zeroext i16 @__fast_hw_crc(i8* %251, i16 zeroext %sub277, i16 zeroext -1), !dbg !674
  store i16 %call278, i16* @tmp_stack_crc, align 2, !dbg !674
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %256 = bitcast %struct.camel_buffer_t* %255 to i8*, !dbg !674
  %257 = load i16, i16* @tmp_stack_crc, align 2, !dbg !674
  %call279 = call zeroext i16 @__fast_hw_crc(i8* %256, i16 zeroext 300, i16 zeroext %257), !dbg !674
  store i16 %call279, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %258 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %259 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %stack_and_buf_crc280 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %259, i32 0, i32 2, !dbg !674
  store i16 %258, i16* %stack_and_buf_crc280, align 2, !dbg !674
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !674
  br label %if.end281

if.end281:                                        ; preds = %if.else268, %if.then255
  br label %do.end282, !dbg !663

do.end282:                                        ; preds = %if.end281
  call void @task_commit(), !dbg !684
  call void @task_lookup_done(), !dbg !685
  br label %do.body283, !dbg !686

do.body283:                                       ; preds = %do.end282
  %260 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !687
  %cmp284 = icmp eq i16 %260, 1, !dbg !687
  br i1 %cmp284, label %if.then286, label %if.else299, !dbg !690

if.then286:                                       ; preds = %do.body283
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !691
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !691
  %261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %reg_file287 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %261, i32 0, i32 0, !dbg !691
  %arraydecay288 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file287, i16 0, i16 0, !dbg !691
  call void @__dump_registers(i16* %arraydecay288), !dbg !691
  call void @llvm.dbg.declare(metadata i16* %__x289, metadata !693, metadata !DIExpression()), !dbg !695
  %262 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !695, !srcloc !696
  store i16 %262, i16* %__x289, align 2, !dbg !695
  %263 = load i16, i16* %__x289, align 2, !dbg !695
  store i16 %263, i16* %tmp290, align 2, !dbg !695
  %264 = load i16, i16* %tmp290, align 2, !dbg !695
  %add291 = add i16 %264, 2, !dbg !691
  %265 = inttoptr i16 %add291 to i8*, !dbg !691
  call void @llvm.dbg.declare(metadata i16* %__x292, metadata !697, metadata !DIExpression()), !dbg !699
  %266 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !699, !srcloc !700
  store i16 %266, i16* %__x292, align 2, !dbg !699
  %267 = load i16, i16* %__x292, align 2, !dbg !699
  store i16 %267, i16* %tmp293, align 2, !dbg !699
  %268 = load i16, i16* %tmp293, align 2, !dbg !699
  %add294 = add i16 %268, 2, !dbg !691
  %sub295 = sub i16 9216, %add294, !dbg !691
  %call296 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext %sub295, i16 zeroext -1), !dbg !691
  store i16 %call296, i16* @tmp_stack_crc, align 2, !dbg !691
  %269 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %270 = bitcast %struct.camel_buffer_t* %269 to i8*, !dbg !691
  %271 = load i16, i16* @tmp_stack_crc, align 2, !dbg !691
  %call297 = call zeroext i16 @__fast_hw_crc(i8* %270, i16 zeroext 300, i16 zeroext %271), !dbg !691
  store i16 %call297, i16* @tmp_stack_buf_crc, align 2, !dbg !691
  %272 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !691
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %stack_and_buf_crc298 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 2, !dbg !691
  store i16 %272, i16* %stack_and_buf_crc298, align 2, !dbg !691
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !691
  br label %if.end312, !dbg !691

if.else299:                                       ; preds = %do.body283
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !701
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !701
  %274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %reg_file300 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %274, i32 0, i32 0, !dbg !701
  %arraydecay301 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file300, i16 0, i16 0, !dbg !701
  call void @__dump_registers(i16* %arraydecay301), !dbg !701
  call void @llvm.dbg.declare(metadata i16* %__x302, metadata !703, metadata !DIExpression()), !dbg !705
  %275 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !705, !srcloc !706
  store i16 %275, i16* %__x302, align 2, !dbg !705
  %276 = load i16, i16* %__x302, align 2, !dbg !705
  store i16 %276, i16* %tmp303, align 2, !dbg !705
  %277 = load i16, i16* %tmp303, align 2, !dbg !705
  %add304 = add i16 %277, 2, !dbg !701
  %278 = inttoptr i16 %add304 to i8*, !dbg !701
  call void @llvm.dbg.declare(metadata i16* %__x305, metadata !707, metadata !DIExpression()), !dbg !709
  %279 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !709, !srcloc !710
  store i16 %279, i16* %__x305, align 2, !dbg !709
  %280 = load i16, i16* %__x305, align 2, !dbg !709
  store i16 %280, i16* %tmp306, align 2, !dbg !709
  %281 = load i16, i16* %tmp306, align 2, !dbg !709
  %add307 = add i16 %281, 2, !dbg !701
  %sub308 = sub i16 9216, %add307, !dbg !701
  %call309 = call zeroext i16 @__fast_hw_crc(i8* %278, i16 zeroext %sub308, i16 zeroext -1), !dbg !701
  store i16 %call309, i16* @tmp_stack_crc, align 2, !dbg !701
  %282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %283 = bitcast %struct.camel_buffer_t* %282 to i8*, !dbg !701
  %284 = load i16, i16* @tmp_stack_crc, align 2, !dbg !701
  %call310 = call zeroext i16 @__fast_hw_crc(i8* %283, i16 zeroext 300, i16 zeroext %284), !dbg !701
  store i16 %call310, i16* @tmp_stack_buf_crc, align 2, !dbg !701
  %285 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !701
  %286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %stack_and_buf_crc311 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %286, i32 0, i32 2, !dbg !701
  store i16 %285, i16* %stack_and_buf_crc311, align 2, !dbg !701
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !701
  br label %if.end312

if.end312:                                        ; preds = %if.else299, %if.then286
  br label %do.end313, !dbg !690

do.end313:                                        ; preds = %if.end312
  call void @task_commit(), !dbg !711
  br label %if.end314

if.end314:                                        ; preds = %do.end313, %do.end250
  br label %while.cond, !dbg !439, !llvm.loop !712

while.end315:                                     ; preds = %while.cond
  call void @task_done(), !dbg !714
  %287 = load i16, i16* %retval, align 2, !dbg !715
  ret i16 %287, !dbg !715
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !716 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !721, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !723, metadata !DIExpression()), !dbg !724
  store i16 5381, i16* %hash, align 2, !dbg !724
  call void @llvm.dbg.declare(metadata i16* %i, metadata !725, metadata !DIExpression()), !dbg !726
  store i16 0, i16* %i, align 2, !dbg !727
  br label %for.cond, !dbg !729

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !730
  %1 = load i16, i16* %len.addr, align 2, !dbg !732
  %cmp = icmp ult i16 %0, %1, !dbg !733
  br i1 %cmp, label %for.body, label %for.end, !dbg !734

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !735
  %shl = shl i16 %2, 5, !dbg !736
  %3 = load i16, i16* %hash, align 2, !dbg !737
  %add = add i16 %shl, %3, !dbg !738
  %4 = load i8*, i8** %data.addr, align 2, !dbg !739
  %5 = load i8, i8* %4, align 1, !dbg !740
  %conv = zext i8 %5 to i16, !dbg !741
  %add1 = add i16 %add, %conv, !dbg !742
  store i16 %add1, i16* %hash, align 2, !dbg !743
  br label %for.inc, !dbg !744

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !745
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !745
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !745
  %7 = load i16, i16* %i, align 2, !dbg !746
  %inc = add i16 %7, 1, !dbg !746
  store i16 %inc, i16* %i, align 2, !dbg !746
  br label %for.cond, !dbg !747, !llvm.loop !748

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !750
  ret i16 %8, !dbg !751
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!75, !76, !77}
!llvm.ident = !{!78}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 142, type: !70, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, nameTableKind: None)
!3 = !DIFile(filename: "../example/camel_cuckoo.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 16)
!8 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !9, line: 20, baseType: !10)
!9 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!10 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !11, line: 29, baseType: !12)
!11 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!12 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!13 = !{!14, !21, !26, !28, !0, !30, !65, !67}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 224, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 672, type: !23, isLocal: true, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 16)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 149, type: !32, isLocal: false, isDefinition: true)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !33, size: 16)
!33 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 135, baseType: !34)
!34 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 130, size: 2416, elements: !35)
!35 = !{!36, !41, !64}
!36 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !34, file: !3, line: 132, baseType: !37, size: 176)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !38, size: 176, elements: !39)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 49, baseType: !18)
!39 = !{!40}
!40 = !DISubrange(count: 11)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !34, file: !3, line: 133, baseType: !42, size: 2224, offset: 176)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 127, baseType: !43)
!43 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 112, size: 2224, elements: !44)
!44 = !{!45, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !61, !62}
!45 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !43, file: !3, line: 114, baseType: !46, size: 2048)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, size: 2048, elements: !48)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 19, baseType: !18)
!48 = !{!49}
!49 = !DISubrange(count: 128)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !43, file: !3, line: 115, baseType: !17, size: 16, offset: 2048)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !43, file: !3, line: 116, baseType: !47, size: 16, offset: 2064)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !43, file: !3, line: 117, baseType: !17, size: 16, offset: 2080)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !43, file: !3, line: 118, baseType: !17, size: 16, offset: 2096)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !43, file: !3, line: 119, baseType: !17, size: 16, offset: 2112)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !43, file: !3, line: 120, baseType: !17, size: 16, offset: 2128)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !43, file: !3, line: 121, baseType: !17, size: 16, offset: 2144)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !43, file: !3, line: 122, baseType: !17, size: 16, offset: 2160)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !43, file: !3, line: 123, baseType: !17, size: 16, offset: 2176)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !43, file: !3, line: 124, baseType: !60, size: 8, offset: 2192)
!60 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !43, file: !3, line: 125, baseType: !60, size: 8, offset: 2200)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "crc", scope: !43, file: !3, line: 126, baseType: !63, size: 16, offset: 2208)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !18)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !34, file: !3, line: 134, baseType: !18, size: 16, offset: 2400)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 149, type: !32, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 178, type: !69, isLocal: false, isDefinition: true)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !39)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 137, size: 4848, elements: !71)
!71 = !{!72, !73, !74}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !70, file: !3, line: 139, baseType: !18, size: 16)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !70, file: !3, line: 140, baseType: !33, size: 2416, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !70, file: !3, line: 141, baseType: !33, size: 2416, offset: 2432)
!75 = !{i32 2, !"Dwarf Version", i32 4}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 2}
!78 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!79 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 151, type: !24, scopeLine: 151, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!80 = !DILocation(line: 152, column: 10, scope: !79)
!81 = !DILocation(line: 154, column: 9, scope: !79)
!82 = !DILocation(line: 156, column: 9, scope: !79)
!83 = !DILocation(line: 161, column: 11, scope: !79)
!84 = !DILocation(line: 166, column: 12, scope: !79)
!85 = !DILocation(line: 167, column: 10, scope: !79)
!86 = !DILocation(line: 168, column: 10, scope: !79)
!87 = !DILocation(line: 170, column: 10, scope: !79)
!88 = !DILocation(line: 171, column: 12, scope: !79)
!89 = !DILocation(line: 174, column: 10, scope: !79)
!90 = !DILocation(line: 176, column: 1, scope: !79)
!91 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 180, type: !24, scopeLine: 180, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocation(line: 181, column: 14, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !3, line: 181, column: 8)
!94 = !DILocation(line: 181, column: 19, scope: !93)
!95 = !DILocation(line: 181, column: 8, scope: !91)
!96 = !DILocation(line: 182, column: 14, scope: !97)
!97 = distinct !DILexicalBlock(scope: !93, file: !3, line: 181, column: 34)
!98 = !DILocation(line: 183, column: 16, scope: !97)
!99 = !DILocation(line: 184, column: 5, scope: !97)
!100 = !DILocation(line: 184, column: 21, scope: !101)
!101 = distinct !DILexicalBlock(scope: !93, file: !3, line: 184, column: 15)
!102 = !DILocation(line: 184, column: 26, scope: !101)
!103 = !DILocation(line: 184, column: 15, scope: !93)
!104 = !DILocation(line: 185, column: 14, scope: !105)
!105 = distinct !DILexicalBlock(scope: !101, file: !3, line: 184, column: 41)
!106 = !DILocation(line: 186, column: 16, scope: !105)
!107 = !DILocation(line: 187, column: 5, scope: !105)
!108 = !DILocation(line: 188, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !101, file: !3, line: 187, column: 12)
!110 = !DILocation(line: 205, column: 3, scope: !111)
!111 = distinct !DILexicalBlock(scope: !91, file: !3, line: 205, column: 3)
!112 = !{i32 -2146583627}
!113 = !DILocalVariable(name: "__x", scope: !114, file: !3, line: 207, type: !6)
!114 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 33)
!115 = !DILocation(line: 207, column: 33, scope: !114)
!116 = !{i32 -2146583391}
!117 = !DILocation(line: 207, column: 51, scope: !91)
!118 = !DILocation(line: 207, column: 33, scope: !91)
!119 = !DILocalVariable(name: "__x", scope: !120, file: !3, line: 207, type: !6)
!120 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 65)
!121 = !DILocation(line: 207, column: 65, scope: !120)
!122 = !{i32 -2146583266}
!123 = !DILocation(line: 207, column: 83, scope: !91)
!124 = !DILocation(line: 207, column: 63, scope: !91)
!125 = !DILocation(line: 207, column: 19, scope: !91)
!126 = !DILocation(line: 207, column: 17, scope: !91)
!127 = !DILocation(line: 208, column: 37, scope: !91)
!128 = !DILocation(line: 208, column: 71, scope: !91)
!129 = !DILocation(line: 208, column: 23, scope: !91)
!130 = !DILocation(line: 208, column: 21, scope: !91)
!131 = !DILocation(line: 211, column: 6, scope: !132)
!132 = distinct !DILexicalBlock(scope: !91, file: !3, line: 211, column: 6)
!133 = !DILocation(line: 211, column: 27, scope: !132)
!134 = !DILocation(line: 211, column: 33, scope: !132)
!135 = !DILocation(line: 211, column: 24, scope: !132)
!136 = !DILocation(line: 211, column: 6, scope: !91)
!137 = !DILocation(line: 212, column: 11, scope: !138)
!138 = distinct !DILexicalBlock(scope: !132, file: !3, line: 211, column: 51)
!139 = !DILocation(line: 212, column: 4, scope: !138)
!140 = !DILocation(line: 212, column: 19, scope: !138)
!141 = !DILocation(line: 213, column: 4, scope: !138)
!142 = !DILocation(line: 214, column: 24, scope: !138)
!143 = !DILocation(line: 214, column: 30, scope: !138)
!144 = !DILocation(line: 214, column: 4, scope: !138)
!145 = !DILocation(line: 215, column: 3, scope: !138)
!146 = !DILocation(line: 216, column: 4, scope: !147)
!147 = distinct !DILexicalBlock(scope: !132, file: !3, line: 215, column: 9)
!148 = !DILocation(line: 219, column: 1, scope: !91)
!149 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 265, type: !24, scopeLine: 266, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocalVariable(name: "i", scope: !149, file: !3, line: 267, type: !6)
!151 = !DILocation(line: 267, column: 14, scope: !149)
!152 = !DILocation(line: 268, column: 12, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !3, line: 268, column: 5)
!154 = !DILocation(line: 268, column: 10, scope: !153)
!155 = !DILocation(line: 268, column: 17, scope: !156)
!156 = distinct !DILexicalBlock(scope: !153, file: !3, line: 268, column: 5)
!157 = !DILocation(line: 268, column: 19, scope: !156)
!158 = !DILocation(line: 268, column: 5, scope: !153)
!159 = !DILocation(line: 269, column: 25, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !3, line: 268, column: 40)
!161 = !DILocation(line: 269, column: 9, scope: !160)
!162 = !DILocation(line: 269, column: 20, scope: !160)
!163 = !DILocation(line: 269, column: 23, scope: !160)
!164 = !DILocation(line: 271, column: 5, scope: !160)
!165 = !DILocation(line: 268, column: 35, scope: !156)
!166 = !DILocation(line: 268, column: 5, scope: !156)
!167 = distinct !{!167, !158, !168}
!168 = !DILocation(line: 271, column: 5, scope: !153)
!169 = !DILocation(line: 272, column: 5, scope: !149)
!170 = !DILocation(line: 272, column: 22, scope: !149)
!171 = !DILocation(line: 273, column: 5, scope: !149)
!172 = !DILocation(line: 273, column: 22, scope: !149)
!173 = !DILocation(line: 274, column: 5, scope: !149)
!174 = !DILocation(line: 274, column: 24, scope: !149)
!175 = !DILocation(line: 275, column: 5, scope: !149)
!176 = !DILocation(line: 275, column: 22, scope: !149)
!177 = !DILocation(line: 276, column: 5, scope: !149)
!178 = !DILocation(line: 276, column: 13, scope: !149)
!179 = !DILocation(line: 277, column: 1, scope: !149)
!180 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 295, type: !24, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 298, column: 16, scope: !180)
!182 = !DILocation(line: 298, column: 24, scope: !180)
!183 = !DILocation(line: 298, column: 29, scope: !180)
!184 = !DILocation(line: 298, column: 5, scope: !180)
!185 = !DILocation(line: 298, column: 13, scope: !180)
!186 = !DILocation(line: 299, column: 1, scope: !180)
!187 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 317, type: !24, scopeLine: 318, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 319, column: 43, scope: !187)
!189 = !DILocation(line: 319, column: 23, scope: !187)
!190 = !DILocation(line: 319, column: 5, scope: !187)
!191 = !DILocation(line: 319, column: 21, scope: !187)
!192 = !DILocation(line: 320, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 244, type: !194, scopeLine: 245, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DISubroutineType(types: !195)
!195 = !{!47, !17}
!196 = !DILocalVariable(name: "key", arg: 1, scope: !193, file: !3, line: 244, type: !17)
!197 = !DILocation(line: 244, column: 50, scope: !193)
!198 = !DILocation(line: 246, column: 21, scope: !193)
!199 = !DILocation(line: 246, column: 12, scope: !193)
!200 = !DILocation(line: 246, column: 5, scope: !193)
!201 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 338, type: !24, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 340, column: 32, scope: !201)
!203 = !DILocation(line: 340, column: 18, scope: !201)
!204 = !DILocation(line: 340, column: 5, scope: !201)
!205 = !DILocation(line: 340, column: 16, scope: !201)
!206 = !DILocation(line: 341, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 238, type: !208, scopeLine: 239, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!210, !47}
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!211 = !DILocalVariable(name: "fp", arg: 1, scope: !207, file: !3, line: 238, type: !47)
!212 = !DILocation(line: 238, column: 44, scope: !207)
!213 = !DILocalVariable(name: "hash", scope: !207, file: !3, line: 240, type: !214)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!215 = !DILocation(line: 240, column: 12, scope: !207)
!216 = !DILocation(line: 240, column: 28, scope: !207)
!217 = !DILocation(line: 240, column: 19, scope: !207)
!218 = !DILocation(line: 241, column: 12, scope: !207)
!219 = !DILocation(line: 241, column: 17, scope: !207)
!220 = !DILocation(line: 241, column: 5, scope: !207)
!221 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 359, type: !24, scopeLine: 360, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!222 = !DILocalVariable(name: "fp_hash", scope: !221, file: !3, line: 361, type: !210)
!223 = !DILocation(line: 361, column: 13, scope: !221)
!224 = !DILocation(line: 361, column: 37, scope: !221)
!225 = !DILocation(line: 361, column: 23, scope: !221)
!226 = !DILocation(line: 362, column: 18, scope: !221)
!227 = !DILocation(line: 362, column: 31, scope: !221)
!228 = !DILocation(line: 362, column: 29, scope: !221)
!229 = !DILocation(line: 362, column: 5, scope: !221)
!230 = !DILocation(line: 362, column: 16, scope: !221)
!231 = !DILocation(line: 363, column: 1, scope: !221)
!232 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 381, type: !24, scopeLine: 382, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!233 = !DILocation(line: 383, column: 10, scope: !234)
!234 = distinct !DILexicalBlock(scope: !232, file: !3, line: 383, column: 9)
!235 = !DILocation(line: 383, column: 21, scope: !234)
!236 = !DILocation(line: 383, column: 9, scope: !232)
!237 = !DILocation(line: 384, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !3, line: 383, column: 34)
!239 = !DILocation(line: 384, column: 21, scope: !238)
!240 = !DILocation(line: 385, column: 34, scope: !238)
!241 = !DILocation(line: 385, column: 9, scope: !238)
!242 = !DILocation(line: 385, column: 20, scope: !238)
!243 = !DILocation(line: 385, column: 32, scope: !238)
!244 = !DILocation(line: 386, column: 5, scope: !238)
!245 = !DILocation(line: 387, column: 14, scope: !246)
!246 = distinct !DILexicalBlock(scope: !247, file: !3, line: 387, column: 13)
!247 = distinct !DILexicalBlock(scope: !234, file: !3, line: 386, column: 12)
!248 = !DILocation(line: 387, column: 25, scope: !246)
!249 = !DILocation(line: 387, column: 13, scope: !247)
!250 = !DILocation(line: 388, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !3, line: 387, column: 38)
!252 = !DILocation(line: 388, column: 25, scope: !251)
!253 = !DILocation(line: 389, column: 38, scope: !251)
!254 = !DILocation(line: 389, column: 13, scope: !251)
!255 = !DILocation(line: 389, column: 24, scope: !251)
!256 = !DILocation(line: 389, column: 36, scope: !251)
!257 = !DILocation(line: 390, column: 9, scope: !251)
!258 = !DILocalVariable(name: "fp_victim", scope: !259, file: !3, line: 391, type: !47)
!259 = distinct !DILexicalBlock(scope: !246, file: !3, line: 390, column: 16)
!260 = !DILocation(line: 391, column: 27, scope: !259)
!261 = !DILocalVariable(name: "index_victim", scope: !259, file: !3, line: 392, type: !210)
!262 = !DILocation(line: 392, column: 21, scope: !259)
!263 = !DILocation(line: 393, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !3, line: 393, column: 17)
!265 = !DILocation(line: 393, column: 24, scope: !264)
!266 = !DILocation(line: 393, column: 17, scope: !259)
!267 = !DILocation(line: 394, column: 32, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !3, line: 393, column: 29)
!269 = !DILocation(line: 394, column: 30, scope: !268)
!270 = !DILocation(line: 395, column: 29, scope: !268)
!271 = !DILocation(line: 395, column: 40, scope: !268)
!272 = !DILocation(line: 395, column: 27, scope: !268)
!273 = !DILocation(line: 396, column: 13, scope: !268)
!274 = !DILocation(line: 397, column: 32, scope: !275)
!275 = distinct !DILexicalBlock(scope: !264, file: !3, line: 396, column: 20)
!276 = !DILocation(line: 397, column: 30, scope: !275)
!277 = !DILocation(line: 398, column: 29, scope: !275)
!278 = !DILocation(line: 398, column: 40, scope: !275)
!279 = !DILocation(line: 398, column: 27, scope: !275)
!280 = !DILocation(line: 402, column: 40, scope: !259)
!281 = !DILocation(line: 402, column: 13, scope: !259)
!282 = !DILocation(line: 402, column: 24, scope: !259)
!283 = !DILocation(line: 402, column: 38, scope: !259)
!284 = !DILocation(line: 403, column: 26, scope: !259)
!285 = !DILocation(line: 403, column: 13, scope: !259)
!286 = !DILocation(line: 403, column: 24, scope: !259)
!287 = !DILocation(line: 404, column: 31, scope: !259)
!288 = !DILocation(line: 404, column: 13, scope: !259)
!289 = !DILocation(line: 404, column: 29, scope: !259)
!290 = !DILocation(line: 405, column: 13, scope: !259)
!291 = !DILocation(line: 405, column: 34, scope: !259)
!292 = !DILocation(line: 408, column: 1, scope: !232)
!293 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 426, type: !24, scopeLine: 427, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!294 = !DILocalVariable(name: "fp_victim", scope: !293, file: !3, line: 428, type: !47)
!295 = !DILocation(line: 428, column: 19, scope: !293)
!296 = !DILocation(line: 428, column: 31, scope: !293)
!297 = !DILocalVariable(name: "fp_hash_victim", scope: !293, file: !3, line: 429, type: !210)
!298 = !DILocation(line: 429, column: 13, scope: !293)
!299 = !DILocation(line: 429, column: 44, scope: !293)
!300 = !DILocation(line: 429, column: 30, scope: !293)
!301 = !DILocalVariable(name: "index2_victim", scope: !293, file: !3, line: 430, type: !210)
!302 = !DILocation(line: 430, column: 13, scope: !293)
!303 = !DILocation(line: 430, column: 29, scope: !293)
!304 = !DILocation(line: 430, column: 42, scope: !293)
!305 = !DILocation(line: 430, column: 40, scope: !293)
!306 = !DILocation(line: 434, column: 14, scope: !307)
!307 = distinct !DILexicalBlock(scope: !293, file: !3, line: 434, column: 13)
!308 = !DILocation(line: 434, column: 25, scope: !307)
!309 = !DILocation(line: 434, column: 13, scope: !293)
!310 = !DILocation(line: 435, column: 13, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !3, line: 434, column: 41)
!312 = !DILocation(line: 435, column: 25, scope: !311)
!313 = !DILocation(line: 436, column: 41, scope: !311)
!314 = !DILocation(line: 436, column: 13, scope: !311)
!315 = !DILocation(line: 436, column: 24, scope: !311)
!316 = !DILocation(line: 436, column: 39, scope: !311)
!317 = !DILocation(line: 437, column: 13, scope: !311)
!318 = !DILocation(line: 441, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !293, file: !3, line: 441, column: 13)
!320 = !DILocation(line: 441, column: 34, scope: !319)
!321 = !DILocation(line: 441, column: 13, scope: !293)
!322 = !DILocation(line: 442, column: 13, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !3, line: 441, column: 54)
!324 = !DILocation(line: 442, column: 25, scope: !323)
!325 = !DILocation(line: 443, column: 13, scope: !323)
!326 = !DILocation(line: 446, column: 11, scope: !293)
!327 = !DILocation(line: 446, column: 9, scope: !293)
!328 = !DILocation(line: 447, column: 22, scope: !293)
!329 = !DILocation(line: 447, column: 9, scope: !293)
!330 = !DILocation(line: 447, column: 20, scope: !293)
!331 = !DILocation(line: 448, column: 27, scope: !293)
!332 = !DILocation(line: 448, column: 38, scope: !293)
!333 = !DILocation(line: 448, column: 9, scope: !293)
!334 = !DILocation(line: 448, column: 25, scope: !293)
!335 = !DILocation(line: 449, column: 37, scope: !293)
!336 = !DILocation(line: 449, column: 9, scope: !293)
!337 = !DILocation(line: 449, column: 20, scope: !293)
!338 = !DILocation(line: 449, column: 35, scope: !293)
!339 = !DILocation(line: 450, column: 1, scope: !293)
!340 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 468, type: !24, scopeLine: 469, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!341 = !DILocation(line: 470, column: 7, scope: !340)
!342 = !DILocation(line: 470, column: 5, scope: !340)
!343 = !DILocation(line: 471, column: 27, scope: !340)
!344 = !DILocation(line: 471, column: 5, scope: !340)
!345 = !DILocation(line: 471, column: 24, scope: !340)
!346 = !DILocation(line: 473, column: 9, scope: !347)
!347 = distinct !DILexicalBlock(scope: !340, file: !3, line: 473, column: 9)
!348 = !DILocation(line: 473, column: 26, scope: !347)
!349 = !DILocation(line: 473, column: 9, scope: !340)
!350 = !DILocation(line: 474, column: 5, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !3, line: 473, column: 41)
!352 = !DILocation(line: 475, column: 9, scope: !353)
!353 = distinct !DILexicalBlock(scope: !347, file: !3, line: 474, column: 12)
!354 = !DILocation(line: 475, column: 17, scope: !353)
!355 = !DILocation(line: 477, column: 1, scope: !340)
!356 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 495, type: !24, scopeLine: 496, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!357 = !DILocation(line: 497, column: 9, scope: !358)
!358 = distinct !DILexicalBlock(scope: !356, file: !3, line: 497, column: 9)
!359 = !DILocation(line: 497, column: 20, scope: !358)
!360 = !DILocation(line: 497, column: 35, scope: !358)
!361 = !DILocation(line: 497, column: 32, scope: !358)
!362 = !DILocation(line: 497, column: 9, scope: !356)
!363 = !DILocation(line: 498, column: 9, scope: !364)
!364 = distinct !DILexicalBlock(scope: !358, file: !3, line: 497, column: 52)
!365 = !DILocation(line: 498, column: 20, scope: !364)
!366 = !DILocation(line: 499, column: 5, scope: !364)
!367 = !DILocation(line: 500, column: 13, scope: !368)
!368 = distinct !DILexicalBlock(scope: !369, file: !3, line: 500, column: 13)
!369 = distinct !DILexicalBlock(scope: !358, file: !3, line: 499, column: 12)
!370 = !DILocation(line: 500, column: 24, scope: !368)
!371 = !DILocation(line: 500, column: 39, scope: !368)
!372 = !DILocation(line: 500, column: 36, scope: !368)
!373 = !DILocation(line: 500, column: 13, scope: !369)
!374 = !DILocation(line: 501, column: 13, scope: !375)
!375 = distinct !DILexicalBlock(scope: !368, file: !3, line: 500, column: 56)
!376 = !DILocation(line: 501, column: 24, scope: !375)
!377 = !DILocation(line: 502, column: 9, scope: !375)
!378 = !DILocation(line: 504, column: 13, scope: !379)
!379 = distinct !DILexicalBlock(scope: !368, file: !3, line: 503, column: 14)
!380 = !DILocation(line: 504, column: 24, scope: !379)
!381 = !DILocation(line: 508, column: 10, scope: !382)
!382 = distinct !DILexicalBlock(scope: !356, file: !3, line: 508, column: 9)
!383 = !DILocation(line: 508, column: 9, scope: !356)
!384 = !DILocation(line: 509, column: 5, scope: !385)
!385 = distinct !DILexicalBlock(scope: !382, file: !3, line: 508, column: 22)
!386 = !DILocation(line: 510, column: 1, scope: !356)
!387 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 528, type: !24, scopeLine: 529, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!388 = !DILocation(line: 530, column: 7, scope: !387)
!389 = !DILocation(line: 530, column: 5, scope: !387)
!390 = !DILocation(line: 532, column: 25, scope: !387)
!391 = !DILocation(line: 532, column: 5, scope: !387)
!392 = !DILocation(line: 532, column: 22, scope: !387)
!393 = !DILocation(line: 534, column: 9, scope: !394)
!394 = distinct !DILexicalBlock(scope: !387, file: !3, line: 534, column: 9)
!395 = !DILocation(line: 534, column: 26, scope: !394)
!396 = !DILocation(line: 534, column: 9, scope: !387)
!397 = !DILocation(line: 535, column: 5, scope: !398)
!398 = distinct !DILexicalBlock(scope: !394, file: !3, line: 534, column: 41)
!399 = !DILocation(line: 537, column: 1, scope: !387)
!400 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 539, type: !24, scopeLine: 540, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!401 = !DILocation(line: 543, column: 5, scope: !400)
!402 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 546, type: !24, scopeLine: 546, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!403 = !DILocation(line: 569, column: 1, scope: !402)
!404 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 571, type: !405, scopeLine: 571, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!405 = !DISubroutineType(types: !406)
!406 = !{!407}
!407 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!408 = !DILocation(line: 573, column: 16, scope: !404)
!409 = !DILocation(line: 574, column: 10, scope: !404)
!410 = !DILocation(line: 575, column: 12, scope: !404)
!411 = !DILocation(line: 576, column: 5, scope: !404)
!412 = !DILocation(line: 587, column: 5, scope: !404)
!413 = !DILocation(line: 588, column: 5, scope: !404)
!414 = !DILocation(line: 588, column: 5, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 588, column: 5)
!416 = distinct !DILexicalBlock(scope: !404, file: !3, line: 588, column: 5)
!417 = !DILocation(line: 588, column: 5, scope: !416)
!418 = !DILocation(line: 588, column: 5, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 588, column: 5)
!420 = !DILocalVariable(name: "__x", scope: !421, file: !3, line: 588, type: !6)
!421 = distinct !DILexicalBlock(scope: !419, file: !3, line: 588, column: 5)
!422 = !DILocation(line: 588, column: 5, scope: !421)
!423 = !{i32 -2146579186}
!424 = !DILocalVariable(name: "__x", scope: !425, file: !3, line: 588, type: !6)
!425 = distinct !DILexicalBlock(scope: !419, file: !3, line: 588, column: 5)
!426 = !DILocation(line: 588, column: 5, scope: !425)
!427 = !{i32 -2146579061}
!428 = !DILocation(line: 588, column: 5, scope: !429)
!429 = distinct !DILexicalBlock(scope: !415, file: !3, line: 588, column: 5)
!430 = !DILocalVariable(name: "__x", scope: !431, file: !3, line: 588, type: !6)
!431 = distinct !DILexicalBlock(scope: !429, file: !3, line: 588, column: 5)
!432 = !DILocation(line: 588, column: 5, scope: !431)
!433 = !{i32 -2146578929}
!434 = !DILocalVariable(name: "__x", scope: !435, file: !3, line: 588, type: !6)
!435 = distinct !DILexicalBlock(scope: !429, file: !3, line: 588, column: 5)
!436 = !DILocation(line: 588, column: 5, scope: !435)
!437 = !{i32 -2146578804}
!438 = !DILocation(line: 589, column: 5, scope: !404)
!439 = !DILocation(line: 593, column: 3, scope: !404)
!440 = !DILocation(line: 593, column: 9, scope: !404)
!441 = !DILocation(line: 593, column: 27, scope: !404)
!442 = !DILocation(line: 596, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !404, file: !3, line: 593, column: 42)
!444 = !DILocation(line: 597, column: 9, scope: !443)
!445 = !DILocation(line: 597, column: 9, scope: !446)
!446 = distinct !DILexicalBlock(scope: !447, file: !3, line: 597, column: 9)
!447 = distinct !DILexicalBlock(scope: !443, file: !3, line: 597, column: 9)
!448 = !DILocation(line: 597, column: 9, scope: !447)
!449 = !DILocation(line: 597, column: 9, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !3, line: 597, column: 9)
!451 = !DILocalVariable(name: "__x", scope: !452, file: !3, line: 597, type: !6)
!452 = distinct !DILexicalBlock(scope: !450, file: !3, line: 597, column: 9)
!453 = !DILocation(line: 597, column: 9, scope: !452)
!454 = !{i32 -2146576617}
!455 = !DILocalVariable(name: "__x", scope: !456, file: !3, line: 597, type: !6)
!456 = distinct !DILexicalBlock(scope: !450, file: !3, line: 597, column: 9)
!457 = !DILocation(line: 597, column: 9, scope: !456)
!458 = !{i32 -2146576492}
!459 = !DILocation(line: 597, column: 9, scope: !460)
!460 = distinct !DILexicalBlock(scope: !446, file: !3, line: 597, column: 9)
!461 = !DILocalVariable(name: "__x", scope: !462, file: !3, line: 597, type: !6)
!462 = distinct !DILexicalBlock(scope: !460, file: !3, line: 597, column: 9)
!463 = !DILocation(line: 597, column: 9, scope: !462)
!464 = !{i32 -2146576360}
!465 = !DILocalVariable(name: "__x", scope: !466, file: !3, line: 597, type: !6)
!466 = distinct !DILexicalBlock(scope: !460, file: !3, line: 597, column: 9)
!467 = !DILocation(line: 597, column: 9, scope: !466)
!468 = !{i32 -2146576235}
!469 = !DILocation(line: 598, column: 9, scope: !443)
!470 = !DILocation(line: 603, column: 9, scope: !443)
!471 = !DILocation(line: 604, column: 9, scope: !443)
!472 = !DILocation(line: 604, column: 9, scope: !473)
!473 = distinct !DILexicalBlock(scope: !474, file: !3, line: 604, column: 9)
!474 = distinct !DILexicalBlock(scope: !443, file: !3, line: 604, column: 9)
!475 = !DILocation(line: 604, column: 9, scope: !474)
!476 = !DILocation(line: 604, column: 9, scope: !477)
!477 = distinct !DILexicalBlock(scope: !473, file: !3, line: 604, column: 9)
!478 = !DILocalVariable(name: "__x", scope: !479, file: !3, line: 604, type: !6)
!479 = distinct !DILexicalBlock(scope: !477, file: !3, line: 604, column: 9)
!480 = !DILocation(line: 604, column: 9, scope: !479)
!481 = !{i32 -2146574111}
!482 = !DILocalVariable(name: "__x", scope: !483, file: !3, line: 604, type: !6)
!483 = distinct !DILexicalBlock(scope: !477, file: !3, line: 604, column: 9)
!484 = !DILocation(line: 604, column: 9, scope: !483)
!485 = !{i32 -2146573986}
!486 = !DILocation(line: 604, column: 9, scope: !487)
!487 = distinct !DILexicalBlock(scope: !473, file: !3, line: 604, column: 9)
!488 = !DILocalVariable(name: "__x", scope: !489, file: !3, line: 604, type: !6)
!489 = distinct !DILexicalBlock(scope: !487, file: !3, line: 604, column: 9)
!490 = !DILocation(line: 604, column: 9, scope: !489)
!491 = !{i32 -2146573854}
!492 = !DILocalVariable(name: "__x", scope: !493, file: !3, line: 604, type: !6)
!493 = distinct !DILexicalBlock(scope: !487, file: !3, line: 604, column: 9)
!494 = !DILocation(line: 604, column: 9, scope: !493)
!495 = !{i32 -2146573729}
!496 = !DILocation(line: 605, column: 9, scope: !443)
!497 = !DILocation(line: 610, column: 9, scope: !443)
!498 = !DILocation(line: 611, column: 9, scope: !443)
!499 = !DILocation(line: 611, column: 9, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !3, line: 611, column: 9)
!501 = distinct !DILexicalBlock(scope: !443, file: !3, line: 611, column: 9)
!502 = !DILocation(line: 611, column: 9, scope: !501)
!503 = !DILocation(line: 611, column: 9, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !3, line: 611, column: 9)
!505 = !DILocalVariable(name: "__x", scope: !506, file: !3, line: 611, type: !6)
!506 = distinct !DILexicalBlock(scope: !504, file: !3, line: 611, column: 9)
!507 = !DILocation(line: 611, column: 9, scope: !506)
!508 = !{i32 -2146571605}
!509 = !DILocalVariable(name: "__x", scope: !510, file: !3, line: 611, type: !6)
!510 = distinct !DILexicalBlock(scope: !504, file: !3, line: 611, column: 9)
!511 = !DILocation(line: 611, column: 9, scope: !510)
!512 = !{i32 -2146571480}
!513 = !DILocation(line: 611, column: 9, scope: !514)
!514 = distinct !DILexicalBlock(scope: !500, file: !3, line: 611, column: 9)
!515 = !DILocalVariable(name: "__x", scope: !516, file: !3, line: 611, type: !6)
!516 = distinct !DILexicalBlock(scope: !514, file: !3, line: 611, column: 9)
!517 = !DILocation(line: 611, column: 9, scope: !516)
!518 = !{i32 -2146571348}
!519 = !DILocalVariable(name: "__x", scope: !520, file: !3, line: 611, type: !6)
!520 = distinct !DILexicalBlock(scope: !514, file: !3, line: 611, column: 9)
!521 = !DILocation(line: 611, column: 9, scope: !520)
!522 = !{i32 -2146571223}
!523 = !DILocation(line: 612, column: 9, scope: !443)
!524 = !DILocation(line: 617, column: 9, scope: !443)
!525 = !DILocation(line: 618, column: 9, scope: !443)
!526 = !DILocation(line: 618, column: 9, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !3, line: 618, column: 9)
!528 = distinct !DILexicalBlock(scope: !443, file: !3, line: 618, column: 9)
!529 = !DILocation(line: 618, column: 9, scope: !528)
!530 = !DILocation(line: 618, column: 9, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !3, line: 618, column: 9)
!532 = !DILocalVariable(name: "__x", scope: !533, file: !3, line: 618, type: !6)
!533 = distinct !DILexicalBlock(scope: !531, file: !3, line: 618, column: 9)
!534 = !DILocation(line: 618, column: 9, scope: !533)
!535 = !{i32 -2146569099}
!536 = !DILocalVariable(name: "__x", scope: !537, file: !3, line: 618, type: !6)
!537 = distinct !DILexicalBlock(scope: !531, file: !3, line: 618, column: 9)
!538 = !DILocation(line: 618, column: 9, scope: !537)
!539 = !{i32 -2146568974}
!540 = !DILocation(line: 618, column: 9, scope: !541)
!541 = distinct !DILexicalBlock(scope: !527, file: !3, line: 618, column: 9)
!542 = !DILocalVariable(name: "__x", scope: !543, file: !3, line: 618, type: !6)
!543 = distinct !DILexicalBlock(scope: !541, file: !3, line: 618, column: 9)
!544 = !DILocation(line: 618, column: 9, scope: !543)
!545 = !{i32 -2146568842}
!546 = !DILocalVariable(name: "__x", scope: !547, file: !3, line: 618, type: !6)
!547 = distinct !DILexicalBlock(scope: !541, file: !3, line: 618, column: 9)
!548 = !DILocation(line: 618, column: 9, scope: !547)
!549 = !{i32 -2146568717}
!550 = !DILocation(line: 619, column: 9, scope: !443)
!551 = !DILocation(line: 622, column: 12, scope: !552)
!552 = distinct !DILexicalBlock(scope: !443, file: !3, line: 622, column: 12)
!553 = !DILocation(line: 622, column: 30, scope: !552)
!554 = !DILocation(line: 622, column: 12, scope: !443)
!555 = !DILocation(line: 625, column: 13, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !3, line: 622, column: 45)
!557 = !DILocation(line: 626, column: 13, scope: !556)
!558 = !DILocation(line: 626, column: 13, scope: !559)
!559 = distinct !DILexicalBlock(scope: !560, file: !3, line: 626, column: 13)
!560 = distinct !DILexicalBlock(scope: !556, file: !3, line: 626, column: 13)
!561 = !DILocation(line: 626, column: 13, scope: !560)
!562 = !DILocation(line: 626, column: 13, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !3, line: 626, column: 13)
!564 = !DILocalVariable(name: "__x", scope: !565, file: !3, line: 626, type: !6)
!565 = distinct !DILexicalBlock(scope: !563, file: !3, line: 626, column: 13)
!566 = !DILocation(line: 626, column: 13, scope: !565)
!567 = !{i32 -2146566542}
!568 = !DILocalVariable(name: "__x", scope: !569, file: !3, line: 626, type: !6)
!569 = distinct !DILexicalBlock(scope: !563, file: !3, line: 626, column: 13)
!570 = !DILocation(line: 626, column: 13, scope: !569)
!571 = !{i32 -2146566417}
!572 = !DILocation(line: 626, column: 13, scope: !573)
!573 = distinct !DILexicalBlock(scope: !559, file: !3, line: 626, column: 13)
!574 = !DILocalVariable(name: "__x", scope: !575, file: !3, line: 626, type: !6)
!575 = distinct !DILexicalBlock(scope: !573, file: !3, line: 626, column: 13)
!576 = !DILocation(line: 626, column: 13, scope: !575)
!577 = !{i32 -2146566285}
!578 = !DILocalVariable(name: "__x", scope: !579, file: !3, line: 626, type: !6)
!579 = distinct !DILexicalBlock(scope: !573, file: !3, line: 626, column: 13)
!580 = !DILocation(line: 626, column: 13, scope: !579)
!581 = !{i32 -2146566160}
!582 = !DILocation(line: 627, column: 13, scope: !556)
!583 = !DILocation(line: 630, column: 16, scope: !584)
!584 = distinct !DILexicalBlock(scope: !556, file: !3, line: 630, column: 16)
!585 = !DILocation(line: 630, column: 28, scope: !584)
!586 = !DILocation(line: 630, column: 41, scope: !584)
!587 = !DILocation(line: 630, column: 44, scope: !584)
!588 = !DILocation(line: 630, column: 56, scope: !584)
!589 = !DILocation(line: 630, column: 16, scope: !556)
!590 = !DILocation(line: 631, column: 17, scope: !591)
!591 = distinct !DILexicalBlock(scope: !584, file: !3, line: 630, column: 70)
!592 = !DILocation(line: 631, column: 23, scope: !591)
!593 = !DILocation(line: 631, column: 36, scope: !591)
!594 = !DILocation(line: 631, column: 45, scope: !591)
!595 = !DILocation(line: 631, column: 49, scope: !591)
!596 = !DILocation(line: 631, column: 71, scope: !591)
!597 = !DILocation(line: 0, scope: !591)
!598 = !DILocation(line: 634, column: 21, scope: !599)
!599 = distinct !DILexicalBlock(scope: !591, file: !3, line: 631, column: 91)
!600 = !DILocation(line: 635, column: 21, scope: !599)
!601 = !DILocation(line: 635, column: 21, scope: !602)
!602 = distinct !DILexicalBlock(scope: !603, file: !3, line: 635, column: 21)
!603 = distinct !DILexicalBlock(scope: !599, file: !3, line: 635, column: 21)
!604 = !DILocation(line: 635, column: 21, scope: !603)
!605 = !DILocation(line: 635, column: 21, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !3, line: 635, column: 21)
!607 = !DILocalVariable(name: "__x", scope: !608, file: !3, line: 635, type: !6)
!608 = distinct !DILexicalBlock(scope: !606, file: !3, line: 635, column: 21)
!609 = !DILocation(line: 635, column: 21, scope: !608)
!610 = !{i32 -2146563883}
!611 = !DILocalVariable(name: "__x", scope: !612, file: !3, line: 635, type: !6)
!612 = distinct !DILexicalBlock(scope: !606, file: !3, line: 635, column: 21)
!613 = !DILocation(line: 635, column: 21, scope: !612)
!614 = !{i32 -2146563758}
!615 = !DILocation(line: 635, column: 21, scope: !616)
!616 = distinct !DILexicalBlock(scope: !602, file: !3, line: 635, column: 21)
!617 = !DILocalVariable(name: "__x", scope: !618, file: !3, line: 635, type: !6)
!618 = distinct !DILexicalBlock(scope: !616, file: !3, line: 635, column: 21)
!619 = !DILocation(line: 635, column: 21, scope: !618)
!620 = !{i32 -2146563626}
!621 = !DILocalVariable(name: "__x", scope: !622, file: !3, line: 635, type: !6)
!622 = distinct !DILexicalBlock(scope: !616, file: !3, line: 635, column: 21)
!623 = !DILocation(line: 635, column: 21, scope: !622)
!624 = !{i32 -2146563501}
!625 = !DILocation(line: 636, column: 21, scope: !599)
!626 = distinct !{!626, !590, !627}
!627 = !DILocation(line: 638, column: 17, scope: !591)
!628 = !DILocation(line: 639, column: 13, scope: !591)
!629 = !DILocation(line: 643, column: 13, scope: !556)
!630 = !DILocation(line: 644, column: 13, scope: !556)
!631 = !DILocation(line: 644, column: 13, scope: !632)
!632 = distinct !DILexicalBlock(scope: !633, file: !3, line: 644, column: 13)
!633 = distinct !DILexicalBlock(scope: !556, file: !3, line: 644, column: 13)
!634 = !DILocation(line: 644, column: 13, scope: !633)
!635 = !DILocation(line: 644, column: 13, scope: !636)
!636 = distinct !DILexicalBlock(scope: !632, file: !3, line: 644, column: 13)
!637 = !DILocalVariable(name: "__x", scope: !638, file: !3, line: 644, type: !6)
!638 = distinct !DILexicalBlock(scope: !636, file: !3, line: 644, column: 13)
!639 = !DILocation(line: 644, column: 13, scope: !638)
!640 = !{i32 -2146561377}
!641 = !DILocalVariable(name: "__x", scope: !642, file: !3, line: 644, type: !6)
!642 = distinct !DILexicalBlock(scope: !636, file: !3, line: 644, column: 13)
!643 = !DILocation(line: 644, column: 13, scope: !642)
!644 = !{i32 -2146561252}
!645 = !DILocation(line: 644, column: 13, scope: !646)
!646 = distinct !DILexicalBlock(scope: !632, file: !3, line: 644, column: 13)
!647 = !DILocalVariable(name: "__x", scope: !648, file: !3, line: 644, type: !6)
!648 = distinct !DILexicalBlock(scope: !646, file: !3, line: 644, column: 13)
!649 = !DILocation(line: 644, column: 13, scope: !648)
!650 = !{i32 -2146561120}
!651 = !DILocalVariable(name: "__x", scope: !652, file: !3, line: 644, type: !6)
!652 = distinct !DILexicalBlock(scope: !646, file: !3, line: 644, column: 13)
!653 = !DILocation(line: 644, column: 13, scope: !652)
!654 = !{i32 -2146560995}
!655 = !DILocation(line: 645, column: 13, scope: !556)
!656 = !DILocation(line: 648, column: 9, scope: !556)
!657 = !DILocation(line: 651, column: 13, scope: !658)
!658 = distinct !DILexicalBlock(scope: !552, file: !3, line: 648, column: 16)
!659 = !DILocation(line: 652, column: 13, scope: !658)
!660 = !DILocation(line: 652, column: 13, scope: !661)
!661 = distinct !DILexicalBlock(scope: !662, file: !3, line: 652, column: 13)
!662 = distinct !DILexicalBlock(scope: !658, file: !3, line: 652, column: 13)
!663 = !DILocation(line: 652, column: 13, scope: !662)
!664 = !DILocation(line: 652, column: 13, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !3, line: 652, column: 13)
!666 = !DILocalVariable(name: "__x", scope: !667, file: !3, line: 652, type: !6)
!667 = distinct !DILexicalBlock(scope: !665, file: !3, line: 652, column: 13)
!668 = !DILocation(line: 652, column: 13, scope: !667)
!669 = !{i32 -2146558871}
!670 = !DILocalVariable(name: "__x", scope: !671, file: !3, line: 652, type: !6)
!671 = distinct !DILexicalBlock(scope: !665, file: !3, line: 652, column: 13)
!672 = !DILocation(line: 652, column: 13, scope: !671)
!673 = !{i32 -2146558746}
!674 = !DILocation(line: 652, column: 13, scope: !675)
!675 = distinct !DILexicalBlock(scope: !661, file: !3, line: 652, column: 13)
!676 = !DILocalVariable(name: "__x", scope: !677, file: !3, line: 652, type: !6)
!677 = distinct !DILexicalBlock(scope: !675, file: !3, line: 652, column: 13)
!678 = !DILocation(line: 652, column: 13, scope: !677)
!679 = !{i32 -2146558614}
!680 = !DILocalVariable(name: "__x", scope: !681, file: !3, line: 652, type: !6)
!681 = distinct !DILexicalBlock(scope: !675, file: !3, line: 652, column: 13)
!682 = !DILocation(line: 652, column: 13, scope: !681)
!683 = !{i32 -2146558489}
!684 = !DILocation(line: 653, column: 13, scope: !658)
!685 = !DILocation(line: 658, column: 13, scope: !658)
!686 = !DILocation(line: 659, column: 13, scope: !658)
!687 = !DILocation(line: 659, column: 13, scope: !688)
!688 = distinct !DILexicalBlock(scope: !689, file: !3, line: 659, column: 13)
!689 = distinct !DILexicalBlock(scope: !658, file: !3, line: 659, column: 13)
!690 = !DILocation(line: 659, column: 13, scope: !689)
!691 = !DILocation(line: 659, column: 13, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !3, line: 659, column: 13)
!693 = !DILocalVariable(name: "__x", scope: !694, file: !3, line: 659, type: !6)
!694 = distinct !DILexicalBlock(scope: !692, file: !3, line: 659, column: 13)
!695 = !DILocation(line: 659, column: 13, scope: !694)
!696 = !{i32 -2146556365}
!697 = !DILocalVariable(name: "__x", scope: !698, file: !3, line: 659, type: !6)
!698 = distinct !DILexicalBlock(scope: !692, file: !3, line: 659, column: 13)
!699 = !DILocation(line: 659, column: 13, scope: !698)
!700 = !{i32 -2146556240}
!701 = !DILocation(line: 659, column: 13, scope: !702)
!702 = distinct !DILexicalBlock(scope: !688, file: !3, line: 659, column: 13)
!703 = !DILocalVariable(name: "__x", scope: !704, file: !3, line: 659, type: !6)
!704 = distinct !DILexicalBlock(scope: !702, file: !3, line: 659, column: 13)
!705 = !DILocation(line: 659, column: 13, scope: !704)
!706 = !{i32 -2146556108}
!707 = !DILocalVariable(name: "__x", scope: !708, file: !3, line: 659, type: !6)
!708 = distinct !DILexicalBlock(scope: !702, file: !3, line: 659, column: 13)
!709 = !DILocation(line: 659, column: 13, scope: !708)
!710 = !{i32 -2146555983}
!711 = !DILocation(line: 660, column: 13, scope: !658)
!712 = distinct !{!712, !439, !713}
!713 = !DILocation(line: 663, column: 5, scope: !404)
!714 = !DILocation(line: 666, column: 5, scope: !404)
!715 = !DILocation(line: 667, column: 1, scope: !404)
!716 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 226, type: !717, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!717 = !DISubroutineType(types: !718)
!718 = !{!214, !7, !6}
!719 = !DILocalVariable(name: "data", arg: 1, scope: !716, file: !3, line: 226, type: !7)
!720 = !DILocation(line: 226, column: 33, scope: !716)
!721 = !DILocalVariable(name: "len", arg: 2, scope: !716, file: !3, line: 226, type: !6)
!722 = !DILocation(line: 226, column: 48, scope: !716)
!723 = !DILocalVariable(name: "hash", scope: !716, file: !3, line: 228, type: !18)
!724 = !DILocation(line: 228, column: 14, scope: !716)
!725 = !DILocalVariable(name: "i", scope: !716, file: !3, line: 229, type: !6)
!726 = !DILocation(line: 229, column: 18, scope: !716)
!727 = !DILocation(line: 231, column: 11, scope: !728)
!728 = distinct !DILexicalBlock(scope: !716, file: !3, line: 231, column: 5)
!729 = !DILocation(line: 231, column: 9, scope: !728)
!730 = !DILocation(line: 231, column: 16, scope: !731)
!731 = distinct !DILexicalBlock(scope: !728, file: !3, line: 231, column: 5)
!732 = !DILocation(line: 231, column: 20, scope: !731)
!733 = !DILocation(line: 231, column: 18, scope: !731)
!734 = !DILocation(line: 231, column: 5, scope: !728)
!735 = !DILocation(line: 232, column: 18, scope: !731)
!736 = !DILocation(line: 232, column: 23, scope: !731)
!737 = !DILocation(line: 232, column: 31, scope: !731)
!738 = !DILocation(line: 232, column: 29, scope: !731)
!739 = !DILocation(line: 232, column: 41, scope: !731)
!740 = !DILocation(line: 232, column: 40, scope: !731)
!741 = !DILocation(line: 232, column: 39, scope: !731)
!742 = !DILocation(line: 232, column: 37, scope: !731)
!743 = !DILocation(line: 232, column: 14, scope: !731)
!744 = !DILocation(line: 232, column: 9, scope: !731)
!745 = !DILocation(line: 231, column: 29, scope: !731)
!746 = !DILocation(line: 231, column: 34, scope: !731)
!747 = !DILocation(line: 231, column: 5, scope: !731)
!748 = distinct !{!748, !734, !749}
!749 = !DILocation(line: 232, column: 45, scope: !728)
!750 = !DILocation(line: 235, column: 12, scope: !716)
!751 = !DILocation(line: 235, column: 5, scope: !716)
