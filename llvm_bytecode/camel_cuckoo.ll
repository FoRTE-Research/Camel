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
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !401
  %1 = bitcast %struct.camel_buffer_t* %0 to i8*, !dbg !401
  %call = call zeroext i16 @__fast_hw_crc(i8* %1, i16 zeroext 300, i16 zeroext -1), !dbg !402
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !403
  %crc = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !403
  store volatile i16 %call, i16* %crc, align 2, !dbg !404
  call void @exit(i16 0) #6, !dbg !405
  unreachable, !dbg !405
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !406 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %__x7 = alloca i16, align 2
  %tmp8 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  br label %do.body, !dbg !407

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !408
  %cmp = icmp eq i16 %0, 1, !dbg !411
  br i1 %cmp, label %if.then, label %if.else, !dbg !412

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !413
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !415
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !416
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !417
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !416
  call void @__dump_registers(i16* %arraydecay), !dbg !418
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !419, metadata !DIExpression()), !dbg !421
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !421, !srcloc !422
  store i16 %2, i16* %__x, align 2, !dbg !421
  %3 = load i16, i16* %__x, align 2, !dbg !421
  store i16 %3, i16* %tmp, align 2, !dbg !421
  %4 = load i16, i16* %tmp, align 2, !dbg !421
  %add = add i16 %4, 2, !dbg !423
  %5 = inttoptr i16 %add to i8*, !dbg !424
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !425, metadata !DIExpression()), !dbg !427
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !427, !srcloc !428
  store i16 %6, i16* %__x1, align 2, !dbg !427
  %7 = load i16, i16* %__x1, align 2, !dbg !427
  store i16 %7, i16* %tmp2, align 2, !dbg !427
  %8 = load i16, i16* %tmp2, align 2, !dbg !427
  %add3 = add i16 %8, 2, !dbg !429
  %sub = sub i16 9216, %add3, !dbg !430
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !431
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !432
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !433
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !433
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !434
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 300, i16 zeroext %11), !dbg !435
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !436
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !437
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !438
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !439
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !440
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !441
  br label %if.end, !dbg !442

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !443
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !445
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !446
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !447
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !446
  call void @__dump_registers(i16* %arraydecay6), !dbg !448
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !449, metadata !DIExpression()), !dbg !451
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !451, !srcloc !452
  store i16 %15, i16* %__x7, align 2, !dbg !451
  %16 = load i16, i16* %__x7, align 2, !dbg !451
  store i16 %16, i16* %tmp8, align 2, !dbg !451
  %17 = load i16, i16* %tmp8, align 2, !dbg !451
  %add9 = add i16 %17, 2, !dbg !453
  %18 = inttoptr i16 %add9 to i8*, !dbg !454
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !455, metadata !DIExpression()), !dbg !457
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !457, !srcloc !458
  store i16 %19, i16* %__x10, align 2, !dbg !457
  %20 = load i16, i16* %__x10, align 2, !dbg !457
  store i16 %20, i16* %tmp11, align 2, !dbg !457
  %21 = load i16, i16* %tmp11, align 2, !dbg !457
  %add12 = add i16 %21, 2, !dbg !459
  %sub13 = sub i16 9216, %add12, !dbg !460
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !461
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !462
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !463
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !463
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !464
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 300, i16 zeroext %24), !dbg !465
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !466
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !467
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !469
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !470
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !471
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !472

do.end:                                           ; preds = %if.end
  ret void, !dbg !473
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !474 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !478
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !479
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !480
  call void @camel_init(), !dbg !481
  call void @task_init(), !dbg !482
  call void @task_commit(), !dbg !483
  br label %while.cond, !dbg !484

while.cond:                                       ; preds = %if.end20, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !485
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !485
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !485
  %1 = load i16, i16* %lookup_count, align 2, !dbg !485
  %cmp = icmp ult i16 %1, 32, !dbg !486
  br i1 %cmp, label %while.body, label %while.end21, !dbg !484

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !487
  call void @task_commit(), !dbg !489
  call void @task_calc_indexes(), !dbg !490
  call void @task_commit(), !dbg !491
  call void @task_calc_indexes_index_1(), !dbg !492
  call void @task_commit(), !dbg !493
  call void @task_calc_indexes_index_2(), !dbg !494
  call void @task_commit(), !dbg !495
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !496
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !496
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !496
  %3 = load i16, i16* %insert_count, align 2, !dbg !496
  %cmp2 = icmp ult i16 %3, 32, !dbg !498
  br i1 %cmp2, label %if.then, label %if.else, !dbg !499

if.then:                                          ; preds = %while.body
  call void @task_add(), !dbg !500
  call void @task_commit(), !dbg !502
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !503
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !503
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !505
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !505
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !505
  %6 = load i16, i16* %index1, align 2, !dbg !505
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %6, !dbg !503
  %7 = load i16, i16* %arrayidx, align 2, !dbg !503
  %tobool = icmp ne i16 %7, 0, !dbg !503
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !506

land.lhs.true:                                    ; preds = %if.then
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !507
  %filter6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !507
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !508
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 4, !dbg !508
  %10 = load i16, i16* %index2, align 2, !dbg !508
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter6, i16 0, i16 %10, !dbg !507
  %11 = load i16, i16* %arrayidx8, align 2, !dbg !507
  %tobool9 = icmp ne i16 %11, 0, !dbg !507
  br i1 %tobool9, label %if.then10, label %if.end, !dbg !509

if.then10:                                        ; preds = %land.lhs.true
  br label %while.cond11, !dbg !510

while.cond11:                                     ; preds = %while.body19, %if.then10
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !512
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !512
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !512
  %13 = load i8, i8* %success, align 2, !dbg !512
  %tobool13 = trunc i8 %13 to i1, !dbg !512
  %conv = zext i1 %tobool13 to i16, !dbg !512
  %cmp14 = icmp eq i16 %conv, 0, !dbg !513
  br i1 %cmp14, label %land.rhs, label %land.end, !dbg !514

land.rhs:                                         ; preds = %while.cond11
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !515
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !515
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 5, !dbg !515
  %15 = load i16, i16* %relocation_count, align 2, !dbg !515
  %cmp17 = icmp ult i16 %15, 8, !dbg !516
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond11
  %16 = phi i1 [ false, %while.cond11 ], [ %cmp17, %land.rhs ], !dbg !517
  br i1 %16, label %while.body19, label %while.end, !dbg !510

while.body19:                                     ; preds = %land.end
  call void @task_relocate(), !dbg !518
  call void @task_commit(), !dbg !520
  br label %while.cond11, !dbg !510, !llvm.loop !521

while.end:                                        ; preds = %land.end
  br label %if.end, !dbg !523

if.end:                                           ; preds = %while.end, %land.lhs.true, %if.then
  call void @task_insert_done(), !dbg !524
  call void @task_commit(), !dbg !525
  br label %if.end20, !dbg !526

if.else:                                          ; preds = %while.body
  call void @task_lookup_search(), !dbg !527
  call void @task_commit(), !dbg !529
  call void @task_lookup_done(), !dbg !530
  call void @task_commit(), !dbg !531
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  br label %while.cond, !dbg !484, !llvm.loop !532

while.end21:                                      ; preds = %while.cond
  call void @task_done(), !dbg !534
  call void @task_commit(), !dbg !535
  %17 = load i16, i16* %retval, align 2, !dbg !536
  ret i16 %17, !dbg !536
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !537 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !540, metadata !DIExpression()), !dbg !541
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !542, metadata !DIExpression()), !dbg !543
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !544, metadata !DIExpression()), !dbg !545
  store i16 5381, i16* %hash, align 2, !dbg !545
  call void @llvm.dbg.declare(metadata i16* %i, metadata !546, metadata !DIExpression()), !dbg !547
  store i16 0, i16* %i, align 2, !dbg !548
  br label %for.cond, !dbg !550

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !551
  %1 = load i16, i16* %len.addr, align 2, !dbg !553
  %cmp = icmp ult i16 %0, %1, !dbg !554
  br i1 %cmp, label %for.body, label %for.end, !dbg !555

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !556
  %shl = shl i16 %2, 5, !dbg !557
  %3 = load i16, i16* %hash, align 2, !dbg !558
  %add = add i16 %shl, %3, !dbg !559
  %4 = load i8*, i8** %data.addr, align 2, !dbg !560
  %5 = load i8, i8* %4, align 1, !dbg !561
  %conv = zext i8 %5 to i16, !dbg !562
  %add1 = add i16 %add, %conv, !dbg !563
  store i16 %add1, i16* %hash, align 2, !dbg !564
  br label %for.inc, !dbg !565

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !566
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !566
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !566
  %7 = load i16, i16* %i, align 2, !dbg !567
  %inc = add i16 %7, 1, !dbg !567
  store i16 %inc, i16* %i, align 2, !dbg !567
  br label %for.cond, !dbg !568, !llvm.loop !569

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !571
  ret i16 %8, !dbg !572
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
!22 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 661, type: !23, isLocal: true, isDefinition: true)
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
!112 = !{i32 -2146584597}
!113 = !DILocalVariable(name: "__x", scope: !114, file: !3, line: 207, type: !6)
!114 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 33)
!115 = !DILocation(line: 207, column: 33, scope: !114)
!116 = !{i32 -2146584361}
!117 = !DILocation(line: 207, column: 51, scope: !91)
!118 = !DILocation(line: 207, column: 33, scope: !91)
!119 = !DILocalVariable(name: "__x", scope: !120, file: !3, line: 207, type: !6)
!120 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 65)
!121 = !DILocation(line: 207, column: 65, scope: !120)
!122 = !{i32 -2146584236}
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
!401 = !DILocation(line: 542, column: 26, scope: !400)
!402 = !DILocation(line: 542, column: 12, scope: !400)
!403 = !DILocation(line: 542, column: 2, scope: !400)
!404 = !DILocation(line: 542, column: 10, scope: !400)
!405 = !DILocation(line: 543, column: 5, scope: !400)
!406 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 546, type: !24, scopeLine: 546, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!407 = !DILocation(line: 548, column: 5, scope: !406)
!408 = !DILocation(line: 550, column: 38, scope: !409)
!409 = distinct !DILexicalBlock(scope: !410, file: !3, line: 550, column: 32)
!410 = distinct !DILexicalBlock(scope: !406, file: !3, line: 548, column: 7)
!411 = !DILocation(line: 550, column: 43, scope: !409)
!412 = !DILocation(line: 550, column: 32, scope: !410)
!413 = !DILocation(line: 551, column: 38, scope: !414)
!414 = distinct !DILexicalBlock(scope: !409, file: !3, line: 550, column: 57)
!415 = !DILocation(line: 552, column: 40, scope: !414)
!416 = !DILocation(line: 553, column: 50, scope: !414)
!417 = !DILocation(line: 553, column: 56, scope: !414)
!418 = !DILocation(line: 553, column: 33, scope: !414)
!419 = !DILocalVariable(name: "__x", scope: !420, file: !3, line: 554, type: !6)
!420 = distinct !DILexicalBlock(scope: !414, file: !3, line: 554, column: 65)
!421 = !DILocation(line: 554, column: 65, scope: !420)
!422 = !{i32 -2146581943}
!423 = !DILocation(line: 554, column: 83, scope: !414)
!424 = !DILocation(line: 554, column: 65, scope: !414)
!425 = !DILocalVariable(name: "__x", scope: !426, file: !3, line: 554, type: !6)
!426 = distinct !DILexicalBlock(scope: !414, file: !3, line: 554, column: 97)
!427 = !DILocation(line: 554, column: 97, scope: !426)
!428 = !{i32 -2146581818}
!429 = !DILocation(line: 554, column: 115, scope: !414)
!430 = !DILocation(line: 554, column: 95, scope: !414)
!431 = !DILocation(line: 554, column: 51, scope: !414)
!432 = !DILocation(line: 554, column: 49, scope: !414)
!433 = !DILocation(line: 555, column: 67, scope: !414)
!434 = !DILocation(line: 555, column: 101, scope: !414)
!435 = !DILocation(line: 555, column: 53, scope: !414)
!436 = !DILocation(line: 555, column: 51, scope: !414)
!437 = !DILocation(line: 556, column: 59, scope: !414)
!438 = !DILocation(line: 556, column: 33, scope: !414)
!439 = !DILocation(line: 556, column: 39, scope: !414)
!440 = !DILocation(line: 556, column: 57, scope: !414)
!441 = !DILocation(line: 557, column: 44, scope: !414)
!442 = !DILocation(line: 558, column: 29, scope: !414)
!443 = !DILocation(line: 559, column: 38, scope: !444)
!444 = distinct !DILexicalBlock(scope: !409, file: !3, line: 558, column: 35)
!445 = !DILocation(line: 560, column: 40, scope: !444)
!446 = !DILocation(line: 561, column: 50, scope: !444)
!447 = !DILocation(line: 561, column: 56, scope: !444)
!448 = !DILocation(line: 561, column: 33, scope: !444)
!449 = !DILocalVariable(name: "__x", scope: !450, file: !3, line: 562, type: !6)
!450 = distinct !DILexicalBlock(scope: !444, file: !3, line: 562, column: 65)
!451 = !DILocation(line: 562, column: 65, scope: !450)
!452 = !{i32 -2146581686}
!453 = !DILocation(line: 562, column: 83, scope: !444)
!454 = !DILocation(line: 562, column: 65, scope: !444)
!455 = !DILocalVariable(name: "__x", scope: !456, file: !3, line: 562, type: !6)
!456 = distinct !DILexicalBlock(scope: !444, file: !3, line: 562, column: 97)
!457 = !DILocation(line: 562, column: 97, scope: !456)
!458 = !{i32 -2146581561}
!459 = !DILocation(line: 562, column: 115, scope: !444)
!460 = !DILocation(line: 562, column: 95, scope: !444)
!461 = !DILocation(line: 562, column: 51, scope: !444)
!462 = !DILocation(line: 562, column: 49, scope: !444)
!463 = !DILocation(line: 563, column: 67, scope: !444)
!464 = !DILocation(line: 563, column: 101, scope: !444)
!465 = !DILocation(line: 563, column: 53, scope: !444)
!466 = !DILocation(line: 563, column: 51, scope: !444)
!467 = !DILocation(line: 564, column: 59, scope: !444)
!468 = !DILocation(line: 564, column: 33, scope: !444)
!469 = !DILocation(line: 564, column: 39, scope: !444)
!470 = !DILocation(line: 564, column: 57, scope: !444)
!471 = !DILocation(line: 565, column: 44, scope: !444)
!472 = !DILocation(line: 568, column: 5, scope: !410)
!473 = !DILocation(line: 569, column: 1, scope: !406)
!474 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 571, type: !475, scopeLine: 571, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!475 = !DISubroutineType(types: !476)
!476 = !{!477}
!477 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!478 = !DILocation(line: 573, column: 16, scope: !474)
!479 = !DILocation(line: 574, column: 10, scope: !474)
!480 = !DILocation(line: 575, column: 12, scope: !474)
!481 = !DILocation(line: 576, column: 5, scope: !474)
!482 = !DILocation(line: 586, column: 5, scope: !474)
!483 = !DILocation(line: 587, column: 5, scope: !474)
!484 = !DILocation(line: 591, column: 3, scope: !474)
!485 = !DILocation(line: 591, column: 9, scope: !474)
!486 = !DILocation(line: 591, column: 27, scope: !474)
!487 = !DILocation(line: 593, column: 9, scope: !488)
!488 = distinct !DILexicalBlock(scope: !474, file: !3, line: 591, column: 42)
!489 = !DILocation(line: 595, column: 9, scope: !488)
!490 = !DILocation(line: 599, column: 9, scope: !488)
!491 = !DILocation(line: 601, column: 9, scope: !488)
!492 = !DILocation(line: 605, column: 9, scope: !488)
!493 = !DILocation(line: 607, column: 9, scope: !488)
!494 = !DILocation(line: 611, column: 9, scope: !488)
!495 = !DILocation(line: 613, column: 9, scope: !488)
!496 = !DILocation(line: 616, column: 12, scope: !497)
!497 = distinct !DILexicalBlock(scope: !488, file: !3, line: 616, column: 12)
!498 = !DILocation(line: 616, column: 30, scope: !497)
!499 = !DILocation(line: 616, column: 12, scope: !488)
!500 = !DILocation(line: 618, column: 13, scope: !501)
!501 = distinct !DILexicalBlock(scope: !497, file: !3, line: 616, column: 45)
!502 = !DILocation(line: 620, column: 13, scope: !501)
!503 = !DILocation(line: 623, column: 16, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !3, line: 623, column: 16)
!505 = !DILocation(line: 623, column: 28, scope: !504)
!506 = !DILocation(line: 623, column: 41, scope: !504)
!507 = !DILocation(line: 623, column: 44, scope: !504)
!508 = !DILocation(line: 623, column: 56, scope: !504)
!509 = !DILocation(line: 623, column: 16, scope: !501)
!510 = !DILocation(line: 624, column: 17, scope: !511)
!511 = distinct !DILexicalBlock(scope: !504, file: !3, line: 623, column: 70)
!512 = !DILocation(line: 624, column: 23, scope: !511)
!513 = !DILocation(line: 624, column: 36, scope: !511)
!514 = !DILocation(line: 624, column: 45, scope: !511)
!515 = !DILocation(line: 624, column: 49, scope: !511)
!516 = !DILocation(line: 624, column: 71, scope: !511)
!517 = !DILocation(line: 0, scope: !511)
!518 = !DILocation(line: 626, column: 21, scope: !519)
!519 = distinct !DILexicalBlock(scope: !511, file: !3, line: 624, column: 91)
!520 = !DILocation(line: 628, column: 21, scope: !519)
!521 = distinct !{!521, !510, !522}
!522 = !DILocation(line: 630, column: 17, scope: !511)
!523 = !DILocation(line: 631, column: 13, scope: !511)
!524 = !DILocation(line: 634, column: 13, scope: !501)
!525 = !DILocation(line: 636, column: 13, scope: !501)
!526 = !DILocation(line: 638, column: 9, scope: !501)
!527 = !DILocation(line: 640, column: 13, scope: !528)
!528 = distinct !DILexicalBlock(scope: !497, file: !3, line: 638, column: 16)
!529 = !DILocation(line: 642, column: 13, scope: !528)
!530 = !DILocation(line: 646, column: 13, scope: !528)
!531 = !DILocation(line: 648, column: 13, scope: !528)
!532 = distinct !{!532, !484, !533}
!533 = !DILocation(line: 651, column: 5, scope: !474)
!534 = !DILocation(line: 653, column: 5, scope: !474)
!535 = !DILocation(line: 654, column: 5, scope: !474)
!536 = !DILocation(line: 656, column: 1, scope: !474)
!537 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 226, type: !538, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!538 = !DISubroutineType(types: !539)
!539 = !{!214, !7, !6}
!540 = !DILocalVariable(name: "data", arg: 1, scope: !537, file: !3, line: 226, type: !7)
!541 = !DILocation(line: 226, column: 33, scope: !537)
!542 = !DILocalVariable(name: "len", arg: 2, scope: !537, file: !3, line: 226, type: !6)
!543 = !DILocation(line: 226, column: 48, scope: !537)
!544 = !DILocalVariable(name: "hash", scope: !537, file: !3, line: 228, type: !18)
!545 = !DILocation(line: 228, column: 14, scope: !537)
!546 = !DILocalVariable(name: "i", scope: !537, file: !3, line: 229, type: !6)
!547 = !DILocation(line: 229, column: 18, scope: !537)
!548 = !DILocation(line: 231, column: 11, scope: !549)
!549 = distinct !DILexicalBlock(scope: !537, file: !3, line: 231, column: 5)
!550 = !DILocation(line: 231, column: 9, scope: !549)
!551 = !DILocation(line: 231, column: 16, scope: !552)
!552 = distinct !DILexicalBlock(scope: !549, file: !3, line: 231, column: 5)
!553 = !DILocation(line: 231, column: 20, scope: !552)
!554 = !DILocation(line: 231, column: 18, scope: !552)
!555 = !DILocation(line: 231, column: 5, scope: !549)
!556 = !DILocation(line: 232, column: 18, scope: !552)
!557 = !DILocation(line: 232, column: 23, scope: !552)
!558 = !DILocation(line: 232, column: 31, scope: !552)
!559 = !DILocation(line: 232, column: 29, scope: !552)
!560 = !DILocation(line: 232, column: 41, scope: !552)
!561 = !DILocation(line: 232, column: 40, scope: !552)
!562 = !DILocation(line: 232, column: 39, scope: !552)
!563 = !DILocation(line: 232, column: 37, scope: !552)
!564 = !DILocation(line: 232, column: 14, scope: !552)
!565 = !DILocation(line: 232, column: 9, scope: !552)
!566 = !DILocation(line: 231, column: 29, scope: !552)
!567 = !DILocation(line: 231, column: 34, scope: !552)
!568 = !DILocation(line: 231, column: 5, scope: !552)
!569 = distinct !{!569, !555, !570}
!570 = !DILocation(line: 232, column: 45, scope: !549)
!571 = !DILocation(line: 235, column: 12, scope: !537)
!572 = !DILocation(line: 235, column: 5, scope: !537)
