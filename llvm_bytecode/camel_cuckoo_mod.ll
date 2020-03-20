; ModuleID = 'camel_cuckoo_mod.bc'
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
  %__x26 = alloca i16, align 2
  %tmp27 = alloca i16, align 2
  %__x29 = alloca i16, align 2
  %tmp30 = alloca i16, align 2
  %__x39 = alloca i16, align 2
  %tmp40 = alloca i16, align 2
  %__x42 = alloca i16, align 2
  %tmp43 = alloca i16, align 2
  %__x64 = alloca i16, align 2
  %tmp65 = alloca i16, align 2
  %__x67 = alloca i16, align 2
  %tmp68 = alloca i16, align 2
  %__x77 = alloca i16, align 2
  %tmp78 = alloca i16, align 2
  %__x80 = alloca i16, align 2
  %tmp81 = alloca i16, align 2
  %__x101 = alloca i16, align 2
  %tmp102 = alloca i16, align 2
  %__x104 = alloca i16, align 2
  %tmp105 = alloca i16, align 2
  %__x114 = alloca i16, align 2
  %tmp115 = alloca i16, align 2
  %__x117 = alloca i16, align 2
  %tmp118 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x145 = alloca i16, align 2
  %tmp146 = alloca i16, align 2
  %__x155 = alloca i16, align 2
  %tmp156 = alloca i16, align 2
  %__x158 = alloca i16, align 2
  %tmp159 = alloca i16, align 2
  %__x195 = alloca i16, align 2
  %tmp196 = alloca i16, align 2
  %__x198 = alloca i16, align 2
  %tmp199 = alloca i16, align 2
  %__x208 = alloca i16, align 2
  %tmp209 = alloca i16, align 2
  %__x211 = alloca i16, align 2
  %tmp212 = alloca i16, align 2
  %__x268 = alloca i16, align 2
  %tmp269 = alloca i16, align 2
  %__x271 = alloca i16, align 2
  %tmp272 = alloca i16, align 2
  %__x281 = alloca i16, align 2
  %tmp282 = alloca i16, align 2
  %__x284 = alloca i16, align 2
  %tmp285 = alloca i16, align 2
  %__x330 = alloca i16, align 2
  %tmp331 = alloca i16, align 2
  %__x333 = alloca i16, align 2
  %tmp334 = alloca i16, align 2
  %__x343 = alloca i16, align 2
  %tmp344 = alloca i16, align 2
  %__x346 = alloca i16, align 2
  %tmp347 = alloca i16, align 2
  %__x392 = alloca i16, align 2
  %tmp393 = alloca i16, align 2
  %__x395 = alloca i16, align 2
  %tmp396 = alloca i16, align 2
  %__x405 = alloca i16, align 2
  %tmp406 = alloca i16, align 2
  %__x408 = alloca i16, align 2
  %tmp409 = alloca i16, align 2
  %__x440 = alloca i16, align 2
  %tmp441 = alloca i16, align 2
  %__x443 = alloca i16, align 2
  %tmp444 = alloca i16, align 2
  %__x453 = alloca i16, align 2
  %tmp454 = alloca i16, align 2
  %__x456 = alloca i16, align 2
  %tmp457 = alloca i16, align 2
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

while.cond:                                       ; preds = %if.end472, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !440
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !440
  %28 = load i16, i16* %lookup_count, align 2, !dbg !440
  %cmp17 = icmp ult i16 %28, 32, !dbg !441
  br i1 %cmp17, label %while.body, label %while.end473, !dbg !439

while.body:                                       ; preds = %while.cond
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !442
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !442
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 1, !dbg !442
  %30 = load i16, i16* %key, align 2, !dbg !442
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !442
  %key20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 1, !dbg !442
  store i16 %30, i16* %key20, align 2, !dbg !442
  call void @task_generate_key(), !dbg !444
  br label %do.body21, !dbg !445

do.body21:                                        ; preds = %while.body
  %32 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !446
  %cmp22 = icmp eq i16 %32, 1, !dbg !446
  br i1 %cmp22, label %if.then23, label %if.else36, !dbg !449

if.then23:                                        ; preds = %do.body21
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !450
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !450
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !450
  %reg_file24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 0, !dbg !450
  %arraydecay25 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file24, i16 0, i16 0, !dbg !450
  call void @__dump_registers(i16* %arraydecay25), !dbg !450
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !452, metadata !DIExpression()), !dbg !454
  %34 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !454, !srcloc !455
  store i16 %34, i16* %__x26, align 2, !dbg !454
  %35 = load i16, i16* %__x26, align 2, !dbg !454
  store i16 %35, i16* %tmp27, align 2, !dbg !454
  %36 = load i16, i16* %tmp27, align 2, !dbg !454
  %add28 = add i16 %36, 2, !dbg !450
  %37 = inttoptr i16 %add28 to i8*, !dbg !450
  call void @llvm.dbg.declare(metadata i16* %__x29, metadata !456, metadata !DIExpression()), !dbg !458
  %38 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !458, !srcloc !459
  store i16 %38, i16* %__x29, align 2, !dbg !458
  %39 = load i16, i16* %__x29, align 2, !dbg !458
  store i16 %39, i16* %tmp30, align 2, !dbg !458
  %40 = load i16, i16* %tmp30, align 2, !dbg !458
  %add31 = add i16 %40, 2, !dbg !450
  %sub32 = sub i16 9216, %add31, !dbg !450
  %call33 = call zeroext i16 @__fast_hw_crc(i8* %37, i16 zeroext %sub32, i16 zeroext -1), !dbg !450
  store i16 %call33, i16* @tmp_stack_crc, align 2, !dbg !450
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !450
  %42 = bitcast %struct.camel_buffer_t* %41 to i8*, !dbg !450
  %43 = load i16, i16* @tmp_stack_crc, align 2, !dbg !450
  %call34 = call zeroext i16 @__fast_hw_crc(i8* %42, i16 zeroext 300, i16 zeroext %43), !dbg !450
  store i16 %call34, i16* @tmp_stack_buf_crc, align 2, !dbg !450
  %44 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !450
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !450
  %stack_and_buf_crc35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 2, !dbg !450
  store i16 %44, i16* %stack_and_buf_crc35, align 2, !dbg !450
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !450
  br label %if.end49, !dbg !450

if.else36:                                        ; preds = %do.body21
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !460
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !460
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !460
  %reg_file37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 0, !dbg !460
  %arraydecay38 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file37, i16 0, i16 0, !dbg !460
  call void @__dump_registers(i16* %arraydecay38), !dbg !460
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !462, metadata !DIExpression()), !dbg !464
  %47 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !464, !srcloc !465
  store i16 %47, i16* %__x39, align 2, !dbg !464
  %48 = load i16, i16* %__x39, align 2, !dbg !464
  store i16 %48, i16* %tmp40, align 2, !dbg !464
  %49 = load i16, i16* %tmp40, align 2, !dbg !464
  %add41 = add i16 %49, 2, !dbg !460
  %50 = inttoptr i16 %add41 to i8*, !dbg !460
  call void @llvm.dbg.declare(metadata i16* %__x42, metadata !466, metadata !DIExpression()), !dbg !468
  %51 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !468, !srcloc !469
  store i16 %51, i16* %__x42, align 2, !dbg !468
  %52 = load i16, i16* %__x42, align 2, !dbg !468
  store i16 %52, i16* %tmp43, align 2, !dbg !468
  %53 = load i16, i16* %tmp43, align 2, !dbg !468
  %add44 = add i16 %53, 2, !dbg !460
  %sub45 = sub i16 9216, %add44, !dbg !460
  %call46 = call zeroext i16 @__fast_hw_crc(i8* %50, i16 zeroext %sub45, i16 zeroext -1), !dbg !460
  store i16 %call46, i16* @tmp_stack_crc, align 2, !dbg !460
  %54 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !460
  %55 = bitcast %struct.camel_buffer_t* %54 to i8*, !dbg !460
  %56 = load i16, i16* @tmp_stack_crc, align 2, !dbg !460
  %call47 = call zeroext i16 @__fast_hw_crc(i8* %55, i16 zeroext 300, i16 zeroext %56), !dbg !460
  store i16 %call47, i16* @tmp_stack_buf_crc, align 2, !dbg !460
  %57 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !460
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !460
  %stack_and_buf_crc48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i32 0, i32 2, !dbg !460
  store i16 %57, i16* %stack_and_buf_crc48, align 2, !dbg !460
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !460
  br label %if.end49

if.end49:                                         ; preds = %if.else36, %if.then23
  br label %do.end50, !dbg !449

do.end50:                                         ; preds = %if.end49
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !470
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 1, !dbg !470
  %key52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 1, !dbg !470
  %60 = load i16, i16* %key52, align 2, !dbg !470
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !470
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 1, !dbg !470
  %key54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 1, !dbg !470
  store i16 %60, i16* %key54, align 2, !dbg !470
  call void @task_commit(), !dbg !471
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !472
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i32 0, i32 1, !dbg !472
  %key56 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 1, !dbg !472
  %63 = load i16, i16* %key56, align 2, !dbg !472
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !472
  %globals57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %64, i32 0, i32 1, !dbg !472
  %key58 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals57, i32 0, i32 1, !dbg !472
  store i16 %63, i16* %key58, align 2, !dbg !472
  call void @task_calc_indexes(), !dbg !473
  br label %do.body59, !dbg !474

do.body59:                                        ; preds = %do.end50
  %65 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !475
  %cmp60 = icmp eq i16 %65, 1, !dbg !475
  br i1 %cmp60, label %if.then61, label %if.else74, !dbg !478

if.then61:                                        ; preds = %do.body59
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !479
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !479
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !479
  %reg_file62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 0, !dbg !479
  %arraydecay63 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file62, i16 0, i16 0, !dbg !479
  call void @__dump_registers(i16* %arraydecay63), !dbg !479
  call void @llvm.dbg.declare(metadata i16* %__x64, metadata !481, metadata !DIExpression()), !dbg !483
  %67 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !483, !srcloc !484
  store i16 %67, i16* %__x64, align 2, !dbg !483
  %68 = load i16, i16* %__x64, align 2, !dbg !483
  store i16 %68, i16* %tmp65, align 2, !dbg !483
  %69 = load i16, i16* %tmp65, align 2, !dbg !483
  %add66 = add i16 %69, 2, !dbg !479
  %70 = inttoptr i16 %add66 to i8*, !dbg !479
  call void @llvm.dbg.declare(metadata i16* %__x67, metadata !485, metadata !DIExpression()), !dbg !487
  %71 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !487, !srcloc !488
  store i16 %71, i16* %__x67, align 2, !dbg !487
  %72 = load i16, i16* %__x67, align 2, !dbg !487
  store i16 %72, i16* %tmp68, align 2, !dbg !487
  %73 = load i16, i16* %tmp68, align 2, !dbg !487
  %add69 = add i16 %73, 2, !dbg !479
  %sub70 = sub i16 9216, %add69, !dbg !479
  %call71 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext %sub70, i16 zeroext -1), !dbg !479
  store i16 %call71, i16* @tmp_stack_crc, align 2, !dbg !479
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !479
  %75 = bitcast %struct.camel_buffer_t* %74 to i8*, !dbg !479
  %76 = load i16, i16* @tmp_stack_crc, align 2, !dbg !479
  %call72 = call zeroext i16 @__fast_hw_crc(i8* %75, i16 zeroext 300, i16 zeroext %76), !dbg !479
  store i16 %call72, i16* @tmp_stack_buf_crc, align 2, !dbg !479
  %77 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !479
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !479
  %stack_and_buf_crc73 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 2, !dbg !479
  store i16 %77, i16* %stack_and_buf_crc73, align 2, !dbg !479
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !479
  br label %if.end87, !dbg !479

if.else74:                                        ; preds = %do.body59
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !489
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !489
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %reg_file75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 0, !dbg !489
  %arraydecay76 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file75, i16 0, i16 0, !dbg !489
  call void @__dump_registers(i16* %arraydecay76), !dbg !489
  call void @llvm.dbg.declare(metadata i16* %__x77, metadata !491, metadata !DIExpression()), !dbg !493
  %80 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !493, !srcloc !494
  store i16 %80, i16* %__x77, align 2, !dbg !493
  %81 = load i16, i16* %__x77, align 2, !dbg !493
  store i16 %81, i16* %tmp78, align 2, !dbg !493
  %82 = load i16, i16* %tmp78, align 2, !dbg !493
  %add79 = add i16 %82, 2, !dbg !489
  %83 = inttoptr i16 %add79 to i8*, !dbg !489
  call void @llvm.dbg.declare(metadata i16* %__x80, metadata !495, metadata !DIExpression()), !dbg !497
  %84 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !497, !srcloc !498
  store i16 %84, i16* %__x80, align 2, !dbg !497
  %85 = load i16, i16* %__x80, align 2, !dbg !497
  store i16 %85, i16* %tmp81, align 2, !dbg !497
  %86 = load i16, i16* %tmp81, align 2, !dbg !497
  %add82 = add i16 %86, 2, !dbg !489
  %sub83 = sub i16 9216, %add82, !dbg !489
  %call84 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext %sub83, i16 zeroext -1), !dbg !489
  store i16 %call84, i16* @tmp_stack_crc, align 2, !dbg !489
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %88 = bitcast %struct.camel_buffer_t* %87 to i8*, !dbg !489
  %89 = load i16, i16* @tmp_stack_crc, align 2, !dbg !489
  %call85 = call zeroext i16 @__fast_hw_crc(i8* %88, i16 zeroext 300, i16 zeroext %89), !dbg !489
  store i16 %call85, i16* @tmp_stack_buf_crc, align 2, !dbg !489
  %90 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !489
  %91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %stack_and_buf_crc86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i32 0, i32 2, !dbg !489
  store i16 %90, i16* %stack_and_buf_crc86, align 2, !dbg !489
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !489
  br label %if.end87

if.end87:                                         ; preds = %if.else74, %if.then61
  br label %do.end88, !dbg !478

do.end88:                                         ; preds = %if.end87
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !499
  %globals89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %92, i32 0, i32 1, !dbg !499
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals89, i32 0, i32 2, !dbg !499
  %93 = load i16, i16* %fingerprint, align 2, !dbg !499
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !499
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %94, i32 0, i32 1, !dbg !499
  %fingerprint91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 2, !dbg !499
  store i16 %93, i16* %fingerprint91, align 2, !dbg !499
  call void @task_commit(), !dbg !500
  %95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !501
  %globals92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %95, i32 0, i32 1, !dbg !501
  %key93 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals92, i32 0, i32 1, !dbg !501
  %96 = load i16, i16* %key93, align 2, !dbg !501
  %97 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !501
  %globals94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %97, i32 0, i32 1, !dbg !501
  %key95 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals94, i32 0, i32 1, !dbg !501
  store i16 %96, i16* %key95, align 2, !dbg !501
  call void @task_calc_indexes_index_1(), !dbg !502
  br label %do.body96, !dbg !503

do.body96:                                        ; preds = %do.end88
  %98 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !504
  %cmp97 = icmp eq i16 %98, 1, !dbg !504
  br i1 %cmp97, label %if.then98, label %if.else111, !dbg !507

if.then98:                                        ; preds = %do.body96
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !508
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !508
  %99 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %reg_file99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %99, i32 0, i32 0, !dbg !508
  %arraydecay100 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file99, i16 0, i16 0, !dbg !508
  call void @__dump_registers(i16* %arraydecay100), !dbg !508
  call void @llvm.dbg.declare(metadata i16* %__x101, metadata !510, metadata !DIExpression()), !dbg !512
  %100 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !512, !srcloc !513
  store i16 %100, i16* %__x101, align 2, !dbg !512
  %101 = load i16, i16* %__x101, align 2, !dbg !512
  store i16 %101, i16* %tmp102, align 2, !dbg !512
  %102 = load i16, i16* %tmp102, align 2, !dbg !512
  %add103 = add i16 %102, 2, !dbg !508
  %103 = inttoptr i16 %add103 to i8*, !dbg !508
  call void @llvm.dbg.declare(metadata i16* %__x104, metadata !514, metadata !DIExpression()), !dbg !516
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !516, !srcloc !517
  store i16 %104, i16* %__x104, align 2, !dbg !516
  %105 = load i16, i16* %__x104, align 2, !dbg !516
  store i16 %105, i16* %tmp105, align 2, !dbg !516
  %106 = load i16, i16* %tmp105, align 2, !dbg !516
  %add106 = add i16 %106, 2, !dbg !508
  %sub107 = sub i16 9216, %add106, !dbg !508
  %call108 = call zeroext i16 @__fast_hw_crc(i8* %103, i16 zeroext %sub107, i16 zeroext -1), !dbg !508
  store i16 %call108, i16* @tmp_stack_crc, align 2, !dbg !508
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %108 = bitcast %struct.camel_buffer_t* %107 to i8*, !dbg !508
  %109 = load i16, i16* @tmp_stack_crc, align 2, !dbg !508
  %call109 = call zeroext i16 @__fast_hw_crc(i8* %108, i16 zeroext 300, i16 zeroext %109), !dbg !508
  store i16 %call109, i16* @tmp_stack_buf_crc, align 2, !dbg !508
  %110 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !508
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %stack_and_buf_crc110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 2, !dbg !508
  store i16 %110, i16* %stack_and_buf_crc110, align 2, !dbg !508
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !508
  br label %if.end124, !dbg !508

if.else111:                                       ; preds = %do.body96
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !518
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !518
  %112 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %reg_file112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %112, i32 0, i32 0, !dbg !518
  %arraydecay113 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file112, i16 0, i16 0, !dbg !518
  call void @__dump_registers(i16* %arraydecay113), !dbg !518
  call void @llvm.dbg.declare(metadata i16* %__x114, metadata !520, metadata !DIExpression()), !dbg !522
  %113 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !522, !srcloc !523
  store i16 %113, i16* %__x114, align 2, !dbg !522
  %114 = load i16, i16* %__x114, align 2, !dbg !522
  store i16 %114, i16* %tmp115, align 2, !dbg !522
  %115 = load i16, i16* %tmp115, align 2, !dbg !522
  %add116 = add i16 %115, 2, !dbg !518
  %116 = inttoptr i16 %add116 to i8*, !dbg !518
  call void @llvm.dbg.declare(metadata i16* %__x117, metadata !524, metadata !DIExpression()), !dbg !526
  %117 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !526, !srcloc !527
  store i16 %117, i16* %__x117, align 2, !dbg !526
  %118 = load i16, i16* %__x117, align 2, !dbg !526
  store i16 %118, i16* %tmp118, align 2, !dbg !526
  %119 = load i16, i16* %tmp118, align 2, !dbg !526
  %add119 = add i16 %119, 2, !dbg !518
  %sub120 = sub i16 9216, %add119, !dbg !518
  %call121 = call zeroext i16 @__fast_hw_crc(i8* %116, i16 zeroext %sub120, i16 zeroext -1), !dbg !518
  store i16 %call121, i16* @tmp_stack_crc, align 2, !dbg !518
  %120 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %121 = bitcast %struct.camel_buffer_t* %120 to i8*, !dbg !518
  %122 = load i16, i16* @tmp_stack_crc, align 2, !dbg !518
  %call122 = call zeroext i16 @__fast_hw_crc(i8* %121, i16 zeroext 300, i16 zeroext %122), !dbg !518
  store i16 %call122, i16* @tmp_stack_buf_crc, align 2, !dbg !518
  %123 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !518
  %124 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %stack_and_buf_crc123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i32 0, i32 2, !dbg !518
  store i16 %123, i16* %stack_and_buf_crc123, align 2, !dbg !518
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !518
  br label %if.end124

if.end124:                                        ; preds = %if.else111, %if.then98
  br label %do.end125, !dbg !507

do.end125:                                        ; preds = %if.end124
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !528
  %globals126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %125, i32 0, i32 1, !dbg !528
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals126, i32 0, i32 3, !dbg !528
  %126 = load i16, i16* %index1, align 2, !dbg !528
  %127 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !528
  %globals127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %127, i32 0, i32 1, !dbg !528
  %index1128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals127, i32 0, i32 3, !dbg !528
  store i16 %126, i16* %index1128, align 2, !dbg !528
  call void @task_commit(), !dbg !529
  %128 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %globals129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %128, i32 0, i32 1, !dbg !530
  %fingerprint130 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals129, i32 0, i32 2, !dbg !530
  %129 = load i16, i16* %fingerprint130, align 2, !dbg !530
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !530
  %globals131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %130, i32 0, i32 1, !dbg !530
  %fingerprint132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals131, i32 0, i32 2, !dbg !530
  store i16 %129, i16* %fingerprint132, align 2, !dbg !530
  %131 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %globals133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %131, i32 0, i32 1, !dbg !530
  %index1134 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals133, i32 0, i32 3, !dbg !530
  %132 = load i16, i16* %index1134, align 2, !dbg !530
  %133 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !530
  %globals135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %133, i32 0, i32 1, !dbg !530
  %index1136 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals135, i32 0, i32 3, !dbg !530
  store i16 %132, i16* %index1136, align 2, !dbg !530
  call void @task_calc_indexes_index_2(), !dbg !531
  br label %do.body137, !dbg !532

do.body137:                                       ; preds = %do.end125
  %134 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !533
  %cmp138 = icmp eq i16 %134, 1, !dbg !533
  br i1 %cmp138, label %if.then139, label %if.else152, !dbg !536

if.then139:                                       ; preds = %do.body137
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !537
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !537
  %135 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !537
  %reg_file140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %135, i32 0, i32 0, !dbg !537
  %arraydecay141 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file140, i16 0, i16 0, !dbg !537
  call void @__dump_registers(i16* %arraydecay141), !dbg !537
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !539, metadata !DIExpression()), !dbg !541
  %136 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !541, !srcloc !542
  store i16 %136, i16* %__x142, align 2, !dbg !541
  %137 = load i16, i16* %__x142, align 2, !dbg !541
  store i16 %137, i16* %tmp143, align 2, !dbg !541
  %138 = load i16, i16* %tmp143, align 2, !dbg !541
  %add144 = add i16 %138, 2, !dbg !537
  %139 = inttoptr i16 %add144 to i8*, !dbg !537
  call void @llvm.dbg.declare(metadata i16* %__x145, metadata !543, metadata !DIExpression()), !dbg !545
  %140 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !545, !srcloc !546
  store i16 %140, i16* %__x145, align 2, !dbg !545
  %141 = load i16, i16* %__x145, align 2, !dbg !545
  store i16 %141, i16* %tmp146, align 2, !dbg !545
  %142 = load i16, i16* %tmp146, align 2, !dbg !545
  %add147 = add i16 %142, 2, !dbg !537
  %sub148 = sub i16 9216, %add147, !dbg !537
  %call149 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext %sub148, i16 zeroext -1), !dbg !537
  store i16 %call149, i16* @tmp_stack_crc, align 2, !dbg !537
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !537
  %144 = bitcast %struct.camel_buffer_t* %143 to i8*, !dbg !537
  %145 = load i16, i16* @tmp_stack_crc, align 2, !dbg !537
  %call150 = call zeroext i16 @__fast_hw_crc(i8* %144, i16 zeroext 300, i16 zeroext %145), !dbg !537
  store i16 %call150, i16* @tmp_stack_buf_crc, align 2, !dbg !537
  %146 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !537
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !537
  %stack_and_buf_crc151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 2, !dbg !537
  store i16 %146, i16* %stack_and_buf_crc151, align 2, !dbg !537
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !537
  br label %if.end165, !dbg !537

if.else152:                                       ; preds = %do.body137
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !547
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !547
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %reg_file153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 0, !dbg !547
  %arraydecay154 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file153, i16 0, i16 0, !dbg !547
  call void @__dump_registers(i16* %arraydecay154), !dbg !547
  call void @llvm.dbg.declare(metadata i16* %__x155, metadata !549, metadata !DIExpression()), !dbg !551
  %149 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !551, !srcloc !552
  store i16 %149, i16* %__x155, align 2, !dbg !551
  %150 = load i16, i16* %__x155, align 2, !dbg !551
  store i16 %150, i16* %tmp156, align 2, !dbg !551
  %151 = load i16, i16* %tmp156, align 2, !dbg !551
  %add157 = add i16 %151, 2, !dbg !547
  %152 = inttoptr i16 %add157 to i8*, !dbg !547
  call void @llvm.dbg.declare(metadata i16* %__x158, metadata !553, metadata !DIExpression()), !dbg !555
  %153 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !555, !srcloc !556
  store i16 %153, i16* %__x158, align 2, !dbg !555
  %154 = load i16, i16* %__x158, align 2, !dbg !555
  store i16 %154, i16* %tmp159, align 2, !dbg !555
  %155 = load i16, i16* %tmp159, align 2, !dbg !555
  %add160 = add i16 %155, 2, !dbg !547
  %sub161 = sub i16 9216, %add160, !dbg !547
  %call162 = call zeroext i16 @__fast_hw_crc(i8* %152, i16 zeroext %sub161, i16 zeroext -1), !dbg !547
  store i16 %call162, i16* @tmp_stack_crc, align 2, !dbg !547
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %157 = bitcast %struct.camel_buffer_t* %156 to i8*, !dbg !547
  %158 = load i16, i16* @tmp_stack_crc, align 2, !dbg !547
  %call163 = call zeroext i16 @__fast_hw_crc(i8* %157, i16 zeroext 300, i16 zeroext %158), !dbg !547
  store i16 %call163, i16* @tmp_stack_buf_crc, align 2, !dbg !547
  %159 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !547
  %160 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %stack_and_buf_crc164 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %160, i32 0, i32 2, !dbg !547
  store i16 %159, i16* %stack_and_buf_crc164, align 2, !dbg !547
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !547
  br label %if.end165

if.end165:                                        ; preds = %if.else152, %if.then139
  br label %do.end166, !dbg !536

do.end166:                                        ; preds = %if.end165
  %161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !557
  %globals167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %161, i32 0, i32 1, !dbg !557
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals167, i32 0, i32 4, !dbg !557
  %162 = load i16, i16* %index2, align 2, !dbg !557
  %163 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !557
  %globals168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %163, i32 0, i32 1, !dbg !557
  %index2169 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals168, i32 0, i32 4, !dbg !557
  store i16 %162, i16* %index2169, align 2, !dbg !557
  call void @task_commit(), !dbg !558
  %164 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !559
  %globals170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %164, i32 0, i32 1, !dbg !559
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals170, i32 0, i32 6, !dbg !559
  %165 = load i16, i16* %insert_count, align 2, !dbg !559
  %cmp171 = icmp ult i16 %165, 32, !dbg !561
  br i1 %cmp171, label %if.then172, label %if.else367, !dbg !562

if.then172:                                       ; preds = %do.end166
  %166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %globals173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %166, i32 0, i32 1, !dbg !563
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals173, i32 0, i32 0, !dbg !563
  %arraydecay174 = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 0, !dbg !563
  %167 = bitcast i16* %arraydecay174 to i8*, !dbg !563
  %168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals175 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %168, i32 0, i32 1, !dbg !563
  %filter176 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals175, i32 0, i32 0, !dbg !563
  %arraydecay177 = getelementptr inbounds [128 x i16], [128 x i16]* %filter176, i16 0, i16 0, !dbg !563
  %169 = bitcast i16* %arraydecay177 to i8*, !dbg !563
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %167, i8* align 2 %169, i16 256, i1 false), !dbg !563
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !563
  %index1179 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals178, i32 0, i32 3, !dbg !563
  %171 = load i16, i16* %index1179, align 2, !dbg !563
  %172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %globals180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %172, i32 0, i32 1, !dbg !563
  %index1181 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals180, i32 0, i32 3, !dbg !563
  store i16 %171, i16* %index1181, align 2, !dbg !563
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals182 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 1, !dbg !563
  %index2183 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals182, i32 0, i32 4, !dbg !563
  %174 = load i16, i16* %index2183, align 2, !dbg !563
  %175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %globals184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %175, i32 0, i32 1, !dbg !563
  %index2185 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals184, i32 0, i32 4, !dbg !563
  store i16 %174, i16* %index2185, align 2, !dbg !563
  %176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %176, i32 0, i32 1, !dbg !563
  %fingerprint187 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals186, i32 0, i32 2, !dbg !563
  %177 = load i16, i16* %fingerprint187, align 2, !dbg !563
  %178 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %globals188 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %178, i32 0, i32 1, !dbg !563
  %fingerprint189 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals188, i32 0, i32 2, !dbg !563
  store i16 %177, i16* %fingerprint189, align 2, !dbg !563
  call void @task_add(), !dbg !565
  br label %do.body190, !dbg !566

do.body190:                                       ; preds = %if.then172
  %179 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !567
  %cmp191 = icmp eq i16 %179, 1, !dbg !567
  br i1 %cmp191, label %if.then192, label %if.else205, !dbg !570

if.then192:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !571
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !571
  %180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %reg_file193 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %180, i32 0, i32 0, !dbg !571
  %arraydecay194 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file193, i16 0, i16 0, !dbg !571
  call void @__dump_registers(i16* %arraydecay194), !dbg !571
  call void @llvm.dbg.declare(metadata i16* %__x195, metadata !573, metadata !DIExpression()), !dbg !575
  %181 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !575, !srcloc !576
  store i16 %181, i16* %__x195, align 2, !dbg !575
  %182 = load i16, i16* %__x195, align 2, !dbg !575
  store i16 %182, i16* %tmp196, align 2, !dbg !575
  %183 = load i16, i16* %tmp196, align 2, !dbg !575
  %add197 = add i16 %183, 2, !dbg !571
  %184 = inttoptr i16 %add197 to i8*, !dbg !571
  call void @llvm.dbg.declare(metadata i16* %__x198, metadata !577, metadata !DIExpression()), !dbg !579
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !579, !srcloc !580
  store i16 %185, i16* %__x198, align 2, !dbg !579
  %186 = load i16, i16* %__x198, align 2, !dbg !579
  store i16 %186, i16* %tmp199, align 2, !dbg !579
  %187 = load i16, i16* %tmp199, align 2, !dbg !579
  %add200 = add i16 %187, 2, !dbg !571
  %sub201 = sub i16 9216, %add200, !dbg !571
  %call202 = call zeroext i16 @__fast_hw_crc(i8* %184, i16 zeroext %sub201, i16 zeroext -1), !dbg !571
  store i16 %call202, i16* @tmp_stack_crc, align 2, !dbg !571
  %188 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %189 = bitcast %struct.camel_buffer_t* %188 to i8*, !dbg !571
  %190 = load i16, i16* @tmp_stack_crc, align 2, !dbg !571
  %call203 = call zeroext i16 @__fast_hw_crc(i8* %189, i16 zeroext 300, i16 zeroext %190), !dbg !571
  store i16 %call203, i16* @tmp_stack_buf_crc, align 2, !dbg !571
  %191 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !571
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %stack_and_buf_crc204 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %192, i32 0, i32 2, !dbg !571
  store i16 %191, i16* %stack_and_buf_crc204, align 2, !dbg !571
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !571
  br label %if.end218, !dbg !571

if.else205:                                       ; preds = %do.body190
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !581
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !581
  %193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %reg_file206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %193, i32 0, i32 0, !dbg !581
  %arraydecay207 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file206, i16 0, i16 0, !dbg !581
  call void @__dump_registers(i16* %arraydecay207), !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x208, metadata !583, metadata !DIExpression()), !dbg !585
  %194 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !585, !srcloc !586
  store i16 %194, i16* %__x208, align 2, !dbg !585
  %195 = load i16, i16* %__x208, align 2, !dbg !585
  store i16 %195, i16* %tmp209, align 2, !dbg !585
  %196 = load i16, i16* %tmp209, align 2, !dbg !585
  %add210 = add i16 %196, 2, !dbg !581
  %197 = inttoptr i16 %add210 to i8*, !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x211, metadata !587, metadata !DIExpression()), !dbg !589
  %198 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !589, !srcloc !590
  store i16 %198, i16* %__x211, align 2, !dbg !589
  %199 = load i16, i16* %__x211, align 2, !dbg !589
  store i16 %199, i16* %tmp212, align 2, !dbg !589
  %200 = load i16, i16* %tmp212, align 2, !dbg !589
  %add213 = add i16 %200, 2, !dbg !581
  %sub214 = sub i16 9216, %add213, !dbg !581
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %197, i16 zeroext %sub214, i16 zeroext -1), !dbg !581
  store i16 %call215, i16* @tmp_stack_crc, align 2, !dbg !581
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %202 = bitcast %struct.camel_buffer_t* %201 to i8*, !dbg !581
  %203 = load i16, i16* @tmp_stack_crc, align 2, !dbg !581
  %call216 = call zeroext i16 @__fast_hw_crc(i8* %202, i16 zeroext 300, i16 zeroext %203), !dbg !581
  store i16 %call216, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %204 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %stack_and_buf_crc217 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %205, i32 0, i32 2, !dbg !581
  store i16 %204, i16* %stack_and_buf_crc217, align 2, !dbg !581
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !581
  br label %if.end218

if.end218:                                        ; preds = %if.else205, %if.then192
  br label %do.end219, !dbg !570

do.end219:                                        ; preds = %if.end218
  %206 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %globals220 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %206, i32 0, i32 1, !dbg !591
  %fingerprint221 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals220, i32 0, i32 2, !dbg !591
  %207 = load i16, i16* %fingerprint221, align 2, !dbg !591
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !591
  %globals222 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %208, i32 0, i32 1, !dbg !591
  %fingerprint223 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals222, i32 0, i32 2, !dbg !591
  store i16 %207, i16* %fingerprint223, align 2, !dbg !591
  call void @task_commit(), !dbg !592
  %209 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !593
  %globals224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %209, i32 0, i32 1, !dbg !593
  %filter225 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals224, i32 0, i32 0, !dbg !593
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !595
  %globals226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %210, i32 0, i32 1, !dbg !595
  %index1227 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals226, i32 0, i32 3, !dbg !595
  %211 = load i16, i16* %index1227, align 2, !dbg !595
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter225, i16 0, i16 %211, !dbg !593
  %212 = load i16, i16* %arrayidx, align 2, !dbg !593
  %tobool = icmp ne i16 %212, 0, !dbg !593
  br i1 %tobool, label %land.lhs.true, label %if.end310, !dbg !596

land.lhs.true:                                    ; preds = %do.end219
  %213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %globals228 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %213, i32 0, i32 1, !dbg !597
  %filter229 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals228, i32 0, i32 0, !dbg !597
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !598
  %globals230 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 1, !dbg !598
  %index2231 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals230, i32 0, i32 4, !dbg !598
  %215 = load i16, i16* %index2231, align 2, !dbg !598
  %arrayidx232 = getelementptr inbounds [128 x i16], [128 x i16]* %filter229, i16 0, i16 %215, !dbg !597
  %216 = load i16, i16* %arrayidx232, align 2, !dbg !597
  %tobool233 = icmp ne i16 %216, 0, !dbg !597
  br i1 %tobool233, label %if.then234, label %if.end310, !dbg !599

if.then234:                                       ; preds = %land.lhs.true
  br label %while.cond235, !dbg !600

while.cond235:                                    ; preds = %do.end292, %if.then234
  %217 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !602
  %globals236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %217, i32 0, i32 1, !dbg !602
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals236, i32 0, i32 10, !dbg !602
  %218 = load i8, i8* %success, align 2, !dbg !602
  %tobool237 = trunc i8 %218 to i1, !dbg !602
  %conv = zext i1 %tobool237 to i16, !dbg !602
  %cmp238 = icmp eq i16 %conv, 0, !dbg !603
  br i1 %cmp238, label %land.rhs, label %land.end, !dbg !604

land.rhs:                                         ; preds = %while.cond235
  %219 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %globals240 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %219, i32 0, i32 1, !dbg !605
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals240, i32 0, i32 5, !dbg !605
  %220 = load i16, i16* %relocation_count, align 2, !dbg !605
  %cmp241 = icmp ult i16 %220, 8, !dbg !606
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond235
  %221 = phi i1 [ false, %while.cond235 ], [ %cmp241, %land.rhs ], !dbg !607
  br i1 %221, label %while.body243, label %while.end, !dbg !600

while.body243:                                    ; preds = %land.end
  %222 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !608
  %globals244 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %222, i32 0, i32 1, !dbg !608
  %fingerprint245 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals244, i32 0, i32 2, !dbg !608
  %223 = load i16, i16* %fingerprint245, align 2, !dbg !608
  %224 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !608
  %globals246 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %224, i32 0, i32 1, !dbg !608
  %fingerprint247 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals246, i32 0, i32 2, !dbg !608
  store i16 %223, i16* %fingerprint247, align 2, !dbg !608
  %225 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !608
  %globals248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %225, i32 0, i32 1, !dbg !608
  %index1249 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals248, i32 0, i32 3, !dbg !608
  %226 = load i16, i16* %index1249, align 2, !dbg !608
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !608
  %globals250 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 1, !dbg !608
  %index1251 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals250, i32 0, i32 3, !dbg !608
  store i16 %226, i16* %index1251, align 2, !dbg !608
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !608
  %globals252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 1, !dbg !608
  %filter253 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals252, i32 0, i32 0, !dbg !608
  %arraydecay254 = getelementptr inbounds [128 x i16], [128 x i16]* %filter253, i16 0, i16 0, !dbg !608
  %229 = bitcast i16* %arraydecay254 to i8*, !dbg !608
  %230 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !608
  %globals255 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %230, i32 0, i32 1, !dbg !608
  %filter256 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals255, i32 0, i32 0, !dbg !608
  %arraydecay257 = getelementptr inbounds [128 x i16], [128 x i16]* %filter256, i16 0, i16 0, !dbg !608
  %231 = bitcast i16* %arraydecay257 to i8*, !dbg !608
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %229, i8* align 2 %231, i16 256, i1 false), !dbg !608
  %232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !608
  %globals258 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %232, i32 0, i32 1, !dbg !608
  %relocation_count259 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals258, i32 0, i32 5, !dbg !608
  %233 = load i16, i16* %relocation_count259, align 2, !dbg !608
  %234 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !608
  %globals260 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %234, i32 0, i32 1, !dbg !608
  %relocation_count261 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals260, i32 0, i32 5, !dbg !608
  store i16 %233, i16* %relocation_count261, align 2, !dbg !608
  call void @task_relocate(), !dbg !610
  br label %do.body262, !dbg !611

do.body262:                                       ; preds = %while.body243
  %235 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !612
  %cmp263 = icmp eq i16 %235, 1, !dbg !612
  br i1 %cmp263, label %if.then265, label %if.else278, !dbg !615

if.then265:                                       ; preds = %do.body262
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !616
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !616
  %236 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %reg_file266 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %236, i32 0, i32 0, !dbg !616
  %arraydecay267 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file266, i16 0, i16 0, !dbg !616
  call void @__dump_registers(i16* %arraydecay267), !dbg !616
  call void @llvm.dbg.declare(metadata i16* %__x268, metadata !618, metadata !DIExpression()), !dbg !620
  %237 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !620, !srcloc !621
  store i16 %237, i16* %__x268, align 2, !dbg !620
  %238 = load i16, i16* %__x268, align 2, !dbg !620
  store i16 %238, i16* %tmp269, align 2, !dbg !620
  %239 = load i16, i16* %tmp269, align 2, !dbg !620
  %add270 = add i16 %239, 2, !dbg !616
  %240 = inttoptr i16 %add270 to i8*, !dbg !616
  call void @llvm.dbg.declare(metadata i16* %__x271, metadata !622, metadata !DIExpression()), !dbg !624
  %241 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !624, !srcloc !625
  store i16 %241, i16* %__x271, align 2, !dbg !624
  %242 = load i16, i16* %__x271, align 2, !dbg !624
  store i16 %242, i16* %tmp272, align 2, !dbg !624
  %243 = load i16, i16* %tmp272, align 2, !dbg !624
  %add273 = add i16 %243, 2, !dbg !616
  %sub274 = sub i16 9216, %add273, !dbg !616
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %240, i16 zeroext %sub274, i16 zeroext -1), !dbg !616
  store i16 %call275, i16* @tmp_stack_crc, align 2, !dbg !616
  %244 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %245 = bitcast %struct.camel_buffer_t* %244 to i8*, !dbg !616
  %246 = load i16, i16* @tmp_stack_crc, align 2, !dbg !616
  %call276 = call zeroext i16 @__fast_hw_crc(i8* %245, i16 zeroext 300, i16 zeroext %246), !dbg !616
  store i16 %call276, i16* @tmp_stack_buf_crc, align 2, !dbg !616
  %247 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !616
  %248 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %stack_and_buf_crc277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %248, i32 0, i32 2, !dbg !616
  store i16 %247, i16* %stack_and_buf_crc277, align 2, !dbg !616
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !616
  br label %if.end291, !dbg !616

if.else278:                                       ; preds = %do.body262
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !626
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !626
  %249 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %reg_file279 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %249, i32 0, i32 0, !dbg !626
  %arraydecay280 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file279, i16 0, i16 0, !dbg !626
  call void @__dump_registers(i16* %arraydecay280), !dbg !626
  call void @llvm.dbg.declare(metadata i16* %__x281, metadata !628, metadata !DIExpression()), !dbg !630
  %250 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !630, !srcloc !631
  store i16 %250, i16* %__x281, align 2, !dbg !630
  %251 = load i16, i16* %__x281, align 2, !dbg !630
  store i16 %251, i16* %tmp282, align 2, !dbg !630
  %252 = load i16, i16* %tmp282, align 2, !dbg !630
  %add283 = add i16 %252, 2, !dbg !626
  %253 = inttoptr i16 %add283 to i8*, !dbg !626
  call void @llvm.dbg.declare(metadata i16* %__x284, metadata !632, metadata !DIExpression()), !dbg !634
  %254 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !634, !srcloc !635
  store i16 %254, i16* %__x284, align 2, !dbg !634
  %255 = load i16, i16* %__x284, align 2, !dbg !634
  store i16 %255, i16* %tmp285, align 2, !dbg !634
  %256 = load i16, i16* %tmp285, align 2, !dbg !634
  %add286 = add i16 %256, 2, !dbg !626
  %sub287 = sub i16 9216, %add286, !dbg !626
  %call288 = call zeroext i16 @__fast_hw_crc(i8* %253, i16 zeroext %sub287, i16 zeroext -1), !dbg !626
  store i16 %call288, i16* @tmp_stack_crc, align 2, !dbg !626
  %257 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %258 = bitcast %struct.camel_buffer_t* %257 to i8*, !dbg !626
  %259 = load i16, i16* @tmp_stack_crc, align 2, !dbg !626
  %call289 = call zeroext i16 @__fast_hw_crc(i8* %258, i16 zeroext 300, i16 zeroext %259), !dbg !626
  store i16 %call289, i16* @tmp_stack_buf_crc, align 2, !dbg !626
  %260 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !626
  %261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %stack_and_buf_crc290 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %261, i32 0, i32 2, !dbg !626
  store i16 %260, i16* %stack_and_buf_crc290, align 2, !dbg !626
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !626
  br label %if.end291

if.end291:                                        ; preds = %if.else278, %if.then265
  br label %do.end292, !dbg !615

do.end292:                                        ; preds = %if.end291
  %262 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !636
  %globals293 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %262, i32 0, i32 1, !dbg !636
  %success294 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals293, i32 0, i32 10, !dbg !636
  %263 = load i8, i8* %success294, align 2, !dbg !636
  %tobool295 = trunc i8 %263 to i1, !dbg !636
  %264 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !636
  %globals296 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %264, i32 0, i32 1, !dbg !636
  %success297 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals296, i32 0, i32 10, !dbg !636
  %frombool = zext i1 %tobool295 to i8, !dbg !636
  store i8 %frombool, i8* %success297, align 2, !dbg !636
  %265 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !636
  %globals298 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %265, i32 0, i32 1, !dbg !636
  %relocation_count299 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals298, i32 0, i32 5, !dbg !636
  %266 = load i16, i16* %relocation_count299, align 2, !dbg !636
  %267 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !636
  %globals300 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %267, i32 0, i32 1, !dbg !636
  %relocation_count301 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals300, i32 0, i32 5, !dbg !636
  store i16 %266, i16* %relocation_count301, align 2, !dbg !636
  %268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !636
  %globals302 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %268, i32 0, i32 1, !dbg !636
  %index1303 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals302, i32 0, i32 3, !dbg !636
  %269 = load i16, i16* %index1303, align 2, !dbg !636
  %270 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !636
  %globals304 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %270, i32 0, i32 1, !dbg !636
  %index1305 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals304, i32 0, i32 3, !dbg !636
  store i16 %269, i16* %index1305, align 2, !dbg !636
  %271 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !636
  %globals306 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %271, i32 0, i32 1, !dbg !636
  %fingerprint307 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals306, i32 0, i32 2, !dbg !636
  %272 = load i16, i16* %fingerprint307, align 2, !dbg !636
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !636
  %globals308 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 1, !dbg !636
  %fingerprint309 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals308, i32 0, i32 2, !dbg !636
  store i16 %272, i16* %fingerprint309, align 2, !dbg !636
  call void @task_commit(), !dbg !637
  br label %while.cond235, !dbg !600, !llvm.loop !638

while.end:                                        ; preds = %land.end
  br label %if.end310, !dbg !640

if.end310:                                        ; preds = %while.end, %land.lhs.true, %do.end219
  %274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !641
  %globals311 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %274, i32 0, i32 1, !dbg !641
  %insert_count312 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals311, i32 0, i32 6, !dbg !641
  %275 = load i16, i16* %insert_count312, align 2, !dbg !641
  %276 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !641
  %globals313 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %276, i32 0, i32 1, !dbg !641
  %insert_count314 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals313, i32 0, i32 6, !dbg !641
  store i16 %275, i16* %insert_count314, align 2, !dbg !641
  %277 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !641
  %globals315 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %277, i32 0, i32 1, !dbg !641
  %success316 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals315, i32 0, i32 10, !dbg !641
  %278 = load i8, i8* %success316, align 2, !dbg !641
  %tobool317 = trunc i8 %278 to i1, !dbg !641
  %279 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !641
  %globals318 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %279, i32 0, i32 1, !dbg !641
  %success319 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals318, i32 0, i32 10, !dbg !641
  %frombool320 = zext i1 %tobool317 to i8, !dbg !641
  store i8 %frombool320, i8* %success319, align 2, !dbg !641
  %280 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !641
  %globals321 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %280, i32 0, i32 1, !dbg !641
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals321, i32 0, i32 7, !dbg !641
  %281 = load i16, i16* %inserted_count, align 2, !dbg !641
  %282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !641
  %globals322 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %282, i32 0, i32 1, !dbg !641
  %inserted_count323 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals322, i32 0, i32 7, !dbg !641
  store i16 %281, i16* %inserted_count323, align 2, !dbg !641
  call void @task_insert_done(), !dbg !642
  br label %do.body324, !dbg !643

do.body324:                                       ; preds = %if.end310
  %283 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !644
  %cmp325 = icmp eq i16 %283, 1, !dbg !644
  br i1 %cmp325, label %if.then327, label %if.else340, !dbg !647

if.then327:                                       ; preds = %do.body324
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !648
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %284 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %reg_file328 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %284, i32 0, i32 0, !dbg !648
  %arraydecay329 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file328, i16 0, i16 0, !dbg !648
  call void @__dump_registers(i16* %arraydecay329), !dbg !648
  call void @llvm.dbg.declare(metadata i16* %__x330, metadata !650, metadata !DIExpression()), !dbg !652
  %285 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !652, !srcloc !653
  store i16 %285, i16* %__x330, align 2, !dbg !652
  %286 = load i16, i16* %__x330, align 2, !dbg !652
  store i16 %286, i16* %tmp331, align 2, !dbg !652
  %287 = load i16, i16* %tmp331, align 2, !dbg !652
  %add332 = add i16 %287, 2, !dbg !648
  %288 = inttoptr i16 %add332 to i8*, !dbg !648
  call void @llvm.dbg.declare(metadata i16* %__x333, metadata !654, metadata !DIExpression()), !dbg !656
  %289 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !656, !srcloc !657
  store i16 %289, i16* %__x333, align 2, !dbg !656
  %290 = load i16, i16* %__x333, align 2, !dbg !656
  store i16 %290, i16* %tmp334, align 2, !dbg !656
  %291 = load i16, i16* %tmp334, align 2, !dbg !656
  %add335 = add i16 %291, 2, !dbg !648
  %sub336 = sub i16 9216, %add335, !dbg !648
  %call337 = call zeroext i16 @__fast_hw_crc(i8* %288, i16 zeroext %sub336, i16 zeroext -1), !dbg !648
  store i16 %call337, i16* @tmp_stack_crc, align 2, !dbg !648
  %292 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %293 = bitcast %struct.camel_buffer_t* %292 to i8*, !dbg !648
  %294 = load i16, i16* @tmp_stack_crc, align 2, !dbg !648
  %call338 = call zeroext i16 @__fast_hw_crc(i8* %293, i16 zeroext 300, i16 zeroext %294), !dbg !648
  store i16 %call338, i16* @tmp_stack_buf_crc, align 2, !dbg !648
  %295 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !648
  %296 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %stack_and_buf_crc339 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %296, i32 0, i32 2, !dbg !648
  store i16 %295, i16* %stack_and_buf_crc339, align 2, !dbg !648
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !648
  br label %if.end353, !dbg !648

if.else340:                                       ; preds = %do.body324
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !658
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !658
  %297 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !658
  %reg_file341 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %297, i32 0, i32 0, !dbg !658
  %arraydecay342 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file341, i16 0, i16 0, !dbg !658
  call void @__dump_registers(i16* %arraydecay342), !dbg !658
  call void @llvm.dbg.declare(metadata i16* %__x343, metadata !660, metadata !DIExpression()), !dbg !662
  %298 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !662, !srcloc !663
  store i16 %298, i16* %__x343, align 2, !dbg !662
  %299 = load i16, i16* %__x343, align 2, !dbg !662
  store i16 %299, i16* %tmp344, align 2, !dbg !662
  %300 = load i16, i16* %tmp344, align 2, !dbg !662
  %add345 = add i16 %300, 2, !dbg !658
  %301 = inttoptr i16 %add345 to i8*, !dbg !658
  call void @llvm.dbg.declare(metadata i16* %__x346, metadata !664, metadata !DIExpression()), !dbg !666
  %302 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !666, !srcloc !667
  store i16 %302, i16* %__x346, align 2, !dbg !666
  %303 = load i16, i16* %__x346, align 2, !dbg !666
  store i16 %303, i16* %tmp347, align 2, !dbg !666
  %304 = load i16, i16* %tmp347, align 2, !dbg !666
  %add348 = add i16 %304, 2, !dbg !658
  %sub349 = sub i16 9216, %add348, !dbg !658
  %call350 = call zeroext i16 @__fast_hw_crc(i8* %301, i16 zeroext %sub349, i16 zeroext -1), !dbg !658
  store i16 %call350, i16* @tmp_stack_crc, align 2, !dbg !658
  %305 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !658
  %306 = bitcast %struct.camel_buffer_t* %305 to i8*, !dbg !658
  %307 = load i16, i16* @tmp_stack_crc, align 2, !dbg !658
  %call351 = call zeroext i16 @__fast_hw_crc(i8* %306, i16 zeroext 300, i16 zeroext %307), !dbg !658
  store i16 %call351, i16* @tmp_stack_buf_crc, align 2, !dbg !658
  %308 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !658
  %309 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !658
  %stack_and_buf_crc352 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %309, i32 0, i32 2, !dbg !658
  store i16 %308, i16* %stack_and_buf_crc352, align 2, !dbg !658
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !658
  br label %if.end353

if.end353:                                        ; preds = %if.else340, %if.then327
  br label %do.end354, !dbg !647

do.end354:                                        ; preds = %if.end353
  %310 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !668
  %globals355 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %310, i32 0, i32 1, !dbg !668
  %insert_count356 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals355, i32 0, i32 6, !dbg !668
  %311 = load i16, i16* %insert_count356, align 2, !dbg !668
  %312 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals357 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %312, i32 0, i32 1, !dbg !668
  %insert_count358 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals357, i32 0, i32 6, !dbg !668
  store i16 %311, i16* %insert_count358, align 2, !dbg !668
  %313 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !668
  %globals359 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %313, i32 0, i32 1, !dbg !668
  %inserted_count360 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals359, i32 0, i32 7, !dbg !668
  %314 = load i16, i16* %inserted_count360, align 2, !dbg !668
  %315 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals361 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %315, i32 0, i32 1, !dbg !668
  %inserted_count362 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals361, i32 0, i32 7, !dbg !668
  store i16 %314, i16* %inserted_count362, align 2, !dbg !668
  %316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !668
  %globals363 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %316, i32 0, i32 1, !dbg !668
  %key364 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals363, i32 0, i32 1, !dbg !668
  %317 = load i16, i16* %key364, align 2, !dbg !668
  %318 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals365 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %318, i32 0, i32 1, !dbg !668
  %key366 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals365, i32 0, i32 1, !dbg !668
  store i16 %317, i16* %key366, align 2, !dbg !668
  call void @task_commit(), !dbg !669
  br label %if.end472, !dbg !670

if.else367:                                       ; preds = %do.end166
  %319 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals368 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %319, i32 0, i32 1, !dbg !671
  %filter369 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals368, i32 0, i32 0, !dbg !671
  %arraydecay370 = getelementptr inbounds [128 x i16], [128 x i16]* %filter369, i16 0, i16 0, !dbg !671
  %320 = bitcast i16* %arraydecay370 to i8*, !dbg !671
  %321 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !671
  %globals371 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %321, i32 0, i32 1, !dbg !671
  %filter372 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals371, i32 0, i32 0, !dbg !671
  %arraydecay373 = getelementptr inbounds [128 x i16], [128 x i16]* %filter372, i16 0, i16 0, !dbg !671
  %322 = bitcast i16* %arraydecay373 to i8*, !dbg !671
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %320, i8* align 2 %322, i16 256, i1 false), !dbg !671
  %323 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !671
  %globals374 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %323, i32 0, i32 1, !dbg !671
  %index1375 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals374, i32 0, i32 3, !dbg !671
  %324 = load i16, i16* %index1375, align 2, !dbg !671
  %325 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals376 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %325, i32 0, i32 1, !dbg !671
  %index1377 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals376, i32 0, i32 3, !dbg !671
  store i16 %324, i16* %index1377, align 2, !dbg !671
  %326 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !671
  %globals378 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %326, i32 0, i32 1, !dbg !671
  %index2379 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals378, i32 0, i32 4, !dbg !671
  %327 = load i16, i16* %index2379, align 2, !dbg !671
  %328 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals380 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %328, i32 0, i32 1, !dbg !671
  %index2381 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals380, i32 0, i32 4, !dbg !671
  store i16 %327, i16* %index2381, align 2, !dbg !671
  %329 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !671
  %globals382 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %329, i32 0, i32 1, !dbg !671
  %fingerprint383 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals382, i32 0, i32 2, !dbg !671
  %330 = load i16, i16* %fingerprint383, align 2, !dbg !671
  %331 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !671
  %globals384 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %331, i32 0, i32 1, !dbg !671
  %fingerprint385 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals384, i32 0, i32 2, !dbg !671
  store i16 %330, i16* %fingerprint385, align 2, !dbg !671
  call void @task_lookup_search(), !dbg !673
  br label %do.body386, !dbg !674

do.body386:                                       ; preds = %if.else367
  %332 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !675
  %cmp387 = icmp eq i16 %332, 1, !dbg !675
  br i1 %cmp387, label %if.then389, label %if.else402, !dbg !678

if.then389:                                       ; preds = %do.body386
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !679
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !679
  %333 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !679
  %reg_file390 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %333, i32 0, i32 0, !dbg !679
  %arraydecay391 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file390, i16 0, i16 0, !dbg !679
  call void @__dump_registers(i16* %arraydecay391), !dbg !679
  call void @llvm.dbg.declare(metadata i16* %__x392, metadata !681, metadata !DIExpression()), !dbg !683
  %334 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !683, !srcloc !684
  store i16 %334, i16* %__x392, align 2, !dbg !683
  %335 = load i16, i16* %__x392, align 2, !dbg !683
  store i16 %335, i16* %tmp393, align 2, !dbg !683
  %336 = load i16, i16* %tmp393, align 2, !dbg !683
  %add394 = add i16 %336, 2, !dbg !679
  %337 = inttoptr i16 %add394 to i8*, !dbg !679
  call void @llvm.dbg.declare(metadata i16* %__x395, metadata !685, metadata !DIExpression()), !dbg !687
  %338 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !687, !srcloc !688
  store i16 %338, i16* %__x395, align 2, !dbg !687
  %339 = load i16, i16* %__x395, align 2, !dbg !687
  store i16 %339, i16* %tmp396, align 2, !dbg !687
  %340 = load i16, i16* %tmp396, align 2, !dbg !687
  %add397 = add i16 %340, 2, !dbg !679
  %sub398 = sub i16 9216, %add397, !dbg !679
  %call399 = call zeroext i16 @__fast_hw_crc(i8* %337, i16 zeroext %sub398, i16 zeroext -1), !dbg !679
  store i16 %call399, i16* @tmp_stack_crc, align 2, !dbg !679
  %341 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !679
  %342 = bitcast %struct.camel_buffer_t* %341 to i8*, !dbg !679
  %343 = load i16, i16* @tmp_stack_crc, align 2, !dbg !679
  %call400 = call zeroext i16 @__fast_hw_crc(i8* %342, i16 zeroext 300, i16 zeroext %343), !dbg !679
  store i16 %call400, i16* @tmp_stack_buf_crc, align 2, !dbg !679
  %344 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !679
  %345 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !679
  %stack_and_buf_crc401 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %345, i32 0, i32 2, !dbg !679
  store i16 %344, i16* %stack_and_buf_crc401, align 2, !dbg !679
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !679
  br label %if.end415, !dbg !679

if.else402:                                       ; preds = %do.body386
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !689
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !689
  %346 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !689
  %reg_file403 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %346, i32 0, i32 0, !dbg !689
  %arraydecay404 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file403, i16 0, i16 0, !dbg !689
  call void @__dump_registers(i16* %arraydecay404), !dbg !689
  call void @llvm.dbg.declare(metadata i16* %__x405, metadata !691, metadata !DIExpression()), !dbg !693
  %347 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !693, !srcloc !694
  store i16 %347, i16* %__x405, align 2, !dbg !693
  %348 = load i16, i16* %__x405, align 2, !dbg !693
  store i16 %348, i16* %tmp406, align 2, !dbg !693
  %349 = load i16, i16* %tmp406, align 2, !dbg !693
  %add407 = add i16 %349, 2, !dbg !689
  %350 = inttoptr i16 %add407 to i8*, !dbg !689
  call void @llvm.dbg.declare(metadata i16* %__x408, metadata !695, metadata !DIExpression()), !dbg !697
  %351 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !697, !srcloc !698
  store i16 %351, i16* %__x408, align 2, !dbg !697
  %352 = load i16, i16* %__x408, align 2, !dbg !697
  store i16 %352, i16* %tmp409, align 2, !dbg !697
  %353 = load i16, i16* %tmp409, align 2, !dbg !697
  %add410 = add i16 %353, 2, !dbg !689
  %sub411 = sub i16 9216, %add410, !dbg !689
  %call412 = call zeroext i16 @__fast_hw_crc(i8* %350, i16 zeroext %sub411, i16 zeroext -1), !dbg !689
  store i16 %call412, i16* @tmp_stack_crc, align 2, !dbg !689
  %354 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !689
  %355 = bitcast %struct.camel_buffer_t* %354 to i8*, !dbg !689
  %356 = load i16, i16* @tmp_stack_crc, align 2, !dbg !689
  %call413 = call zeroext i16 @__fast_hw_crc(i8* %355, i16 zeroext 300, i16 zeroext %356), !dbg !689
  store i16 %call413, i16* @tmp_stack_buf_crc, align 2, !dbg !689
  %357 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !689
  %358 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !689
  %stack_and_buf_crc414 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %358, i32 0, i32 2, !dbg !689
  store i16 %357, i16* %stack_and_buf_crc414, align 2, !dbg !689
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !689
  br label %if.end415

if.end415:                                        ; preds = %if.else402, %if.then389
  br label %do.end416, !dbg !678

do.end416:                                        ; preds = %if.end415
  %359 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !699
  %globals417 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %359, i32 0, i32 1, !dbg !699
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals417, i32 0, i32 11, !dbg !699
  %360 = load i8, i8* %member, align 1, !dbg !699
  %tobool418 = trunc i8 %360 to i1, !dbg !699
  %361 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !699
  %globals419 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %361, i32 0, i32 1, !dbg !699
  %member420 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals419, i32 0, i32 11, !dbg !699
  %frombool421 = zext i1 %tobool418 to i8, !dbg !699
  store i8 %frombool421, i8* %member420, align 1, !dbg !699
  call void @task_commit(), !dbg !700
  %362 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %globals422 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %362, i32 0, i32 1, !dbg !701
  %lookup_count423 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals422, i32 0, i32 8, !dbg !701
  %363 = load i16, i16* %lookup_count423, align 2, !dbg !701
  %364 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !701
  %globals424 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %364, i32 0, i32 1, !dbg !701
  %lookup_count425 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals424, i32 0, i32 8, !dbg !701
  store i16 %363, i16* %lookup_count425, align 2, !dbg !701
  %365 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %globals426 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %365, i32 0, i32 1, !dbg !701
  %lookup_count427 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals426, i32 0, i32 8, !dbg !701
  %366 = load i16, i16* %lookup_count427, align 2, !dbg !701
  %367 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !701
  %globals428 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %367, i32 0, i32 1, !dbg !701
  %lookup_count429 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals428, i32 0, i32 8, !dbg !701
  store i16 %366, i16* %lookup_count429, align 2, !dbg !701
  %368 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %globals430 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %368, i32 0, i32 1, !dbg !701
  %lookup_count431 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals430, i32 0, i32 8, !dbg !701
  %369 = load i16, i16* %lookup_count431, align 2, !dbg !701
  %370 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !701
  %globals432 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %370, i32 0, i32 1, !dbg !701
  %lookup_count433 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals432, i32 0, i32 8, !dbg !701
  store i16 %369, i16* %lookup_count433, align 2, !dbg !701
  call void @task_lookup_done(), !dbg !702
  br label %do.body434, !dbg !703

do.body434:                                       ; preds = %do.end416
  %371 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !704
  %cmp435 = icmp eq i16 %371, 1, !dbg !704
  br i1 %cmp435, label %if.then437, label %if.else450, !dbg !707

if.then437:                                       ; preds = %do.body434
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !708
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !708
  %372 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !708
  %reg_file438 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %372, i32 0, i32 0, !dbg !708
  %arraydecay439 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file438, i16 0, i16 0, !dbg !708
  call void @__dump_registers(i16* %arraydecay439), !dbg !708
  call void @llvm.dbg.declare(metadata i16* %__x440, metadata !710, metadata !DIExpression()), !dbg !712
  %373 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !712, !srcloc !713
  store i16 %373, i16* %__x440, align 2, !dbg !712
  %374 = load i16, i16* %__x440, align 2, !dbg !712
  store i16 %374, i16* %tmp441, align 2, !dbg !712
  %375 = load i16, i16* %tmp441, align 2, !dbg !712
  %add442 = add i16 %375, 2, !dbg !708
  %376 = inttoptr i16 %add442 to i8*, !dbg !708
  call void @llvm.dbg.declare(metadata i16* %__x443, metadata !714, metadata !DIExpression()), !dbg !716
  %377 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !716, !srcloc !717
  store i16 %377, i16* %__x443, align 2, !dbg !716
  %378 = load i16, i16* %__x443, align 2, !dbg !716
  store i16 %378, i16* %tmp444, align 2, !dbg !716
  %379 = load i16, i16* %tmp444, align 2, !dbg !716
  %add445 = add i16 %379, 2, !dbg !708
  %sub446 = sub i16 9216, %add445, !dbg !708
  %call447 = call zeroext i16 @__fast_hw_crc(i8* %376, i16 zeroext %sub446, i16 zeroext -1), !dbg !708
  store i16 %call447, i16* @tmp_stack_crc, align 2, !dbg !708
  %380 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !708
  %381 = bitcast %struct.camel_buffer_t* %380 to i8*, !dbg !708
  %382 = load i16, i16* @tmp_stack_crc, align 2, !dbg !708
  %call448 = call zeroext i16 @__fast_hw_crc(i8* %381, i16 zeroext 300, i16 zeroext %382), !dbg !708
  store i16 %call448, i16* @tmp_stack_buf_crc, align 2, !dbg !708
  %383 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !708
  %384 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !708
  %stack_and_buf_crc449 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %384, i32 0, i32 2, !dbg !708
  store i16 %383, i16* %stack_and_buf_crc449, align 2, !dbg !708
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !708
  br label %if.end463, !dbg !708

if.else450:                                       ; preds = %do.body434
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !718
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !718
  %385 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %reg_file451 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %385, i32 0, i32 0, !dbg !718
  %arraydecay452 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file451, i16 0, i16 0, !dbg !718
  call void @__dump_registers(i16* %arraydecay452), !dbg !718
  call void @llvm.dbg.declare(metadata i16* %__x453, metadata !720, metadata !DIExpression()), !dbg !722
  %386 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !722, !srcloc !723
  store i16 %386, i16* %__x453, align 2, !dbg !722
  %387 = load i16, i16* %__x453, align 2, !dbg !722
  store i16 %387, i16* %tmp454, align 2, !dbg !722
  %388 = load i16, i16* %tmp454, align 2, !dbg !722
  %add455 = add i16 %388, 2, !dbg !718
  %389 = inttoptr i16 %add455 to i8*, !dbg !718
  call void @llvm.dbg.declare(metadata i16* %__x456, metadata !724, metadata !DIExpression()), !dbg !726
  %390 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !726, !srcloc !727
  store i16 %390, i16* %__x456, align 2, !dbg !726
  %391 = load i16, i16* %__x456, align 2, !dbg !726
  store i16 %391, i16* %tmp457, align 2, !dbg !726
  %392 = load i16, i16* %tmp457, align 2, !dbg !726
  %add458 = add i16 %392, 2, !dbg !718
  %sub459 = sub i16 9216, %add458, !dbg !718
  %call460 = call zeroext i16 @__fast_hw_crc(i8* %389, i16 zeroext %sub459, i16 zeroext -1), !dbg !718
  store i16 %call460, i16* @tmp_stack_crc, align 2, !dbg !718
  %393 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %394 = bitcast %struct.camel_buffer_t* %393 to i8*, !dbg !718
  %395 = load i16, i16* @tmp_stack_crc, align 2, !dbg !718
  %call461 = call zeroext i16 @__fast_hw_crc(i8* %394, i16 zeroext 300, i16 zeroext %395), !dbg !718
  store i16 %call461, i16* @tmp_stack_buf_crc, align 2, !dbg !718
  %396 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !718
  %397 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !718
  %stack_and_buf_crc462 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %397, i32 0, i32 2, !dbg !718
  store i16 %396, i16* %stack_and_buf_crc462, align 2, !dbg !718
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !718
  br label %if.end463

if.end463:                                        ; preds = %if.else450, %if.then437
  br label %do.end464, !dbg !707

do.end464:                                        ; preds = %if.end463
  %398 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !728
  %globals465 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %398, i32 0, i32 1, !dbg !728
  %lookup_count466 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals465, i32 0, i32 8, !dbg !728
  %399 = load i16, i16* %lookup_count466, align 2, !dbg !728
  %400 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %globals467 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %400, i32 0, i32 1, !dbg !728
  %lookup_count468 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals467, i32 0, i32 8, !dbg !728
  store i16 %399, i16* %lookup_count468, align 2, !dbg !728
  %401 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !728
  %globals469 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %401, i32 0, i32 1, !dbg !728
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals469, i32 0, i32 9, !dbg !728
  %402 = load i16, i16* %member_count, align 2, !dbg !728
  %403 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %globals470 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %403, i32 0, i32 1, !dbg !728
  %member_count471 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals470, i32 0, i32 9, !dbg !728
  store i16 %402, i16* %member_count471, align 2, !dbg !728
  call void @task_commit(), !dbg !729
  br label %if.end472

if.end472:                                        ; preds = %do.end464, %do.end354
  br label %while.cond, !dbg !439, !llvm.loop !730

while.end473:                                     ; preds = %while.cond
  call void @task_done(), !dbg !732
  %404 = load i16, i16* %retval, align 2, !dbg !733
  ret i16 %404, !dbg !733
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !734 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !737, metadata !DIExpression()), !dbg !738
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !739, metadata !DIExpression()), !dbg !740
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !741, metadata !DIExpression()), !dbg !742
  store i16 5381, i16* %hash, align 2, !dbg !742
  call void @llvm.dbg.declare(metadata i16* %i, metadata !743, metadata !DIExpression()), !dbg !744
  store i16 0, i16* %i, align 2, !dbg !745
  br label %for.cond, !dbg !747

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !748
  %1 = load i16, i16* %len.addr, align 2, !dbg !750
  %cmp = icmp ult i16 %0, %1, !dbg !751
  br i1 %cmp, label %for.body, label %for.end, !dbg !752

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !753
  %shl = shl i16 %2, 5, !dbg !754
  %3 = load i16, i16* %hash, align 2, !dbg !755
  %add = add i16 %shl, %3, !dbg !756
  %4 = load i8*, i8** %data.addr, align 2, !dbg !757
  %5 = load i8, i8* %4, align 1, !dbg !758
  %conv = zext i8 %5 to i16, !dbg !759
  %add1 = add i16 %add, %conv, !dbg !760
  store i16 %add1, i16* %hash, align 2, !dbg !761
  br label %for.inc, !dbg !762

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !763
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !763
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !763
  %7 = load i16, i16* %i, align 2, !dbg !764
  %inc = add i16 %7, 1, !dbg !764
  store i16 %inc, i16* %i, align 2, !dbg !764
  br label %for.cond, !dbg !765, !llvm.loop !766

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !768
  ret i16 %8, !dbg !769
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
!112 = !{i32 -2146583661}
!113 = !DILocalVariable(name: "__x", scope: !114, file: !3, line: 207, type: !6)
!114 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 33)
!115 = !DILocation(line: 207, column: 33, scope: !114)
!116 = !{i32 -2146583425}
!117 = !DILocation(line: 207, column: 51, scope: !91)
!118 = !DILocation(line: 207, column: 33, scope: !91)
!119 = !DILocalVariable(name: "__x", scope: !120, file: !3, line: 207, type: !6)
!120 = distinct !DILexicalBlock(scope: !91, file: !3, line: 207, column: 65)
!121 = !DILocation(line: 207, column: 65, scope: !120)
!122 = !{i32 -2146583300}
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
!423 = !{i32 -2146579220}
!424 = !DILocalVariable(name: "__x", scope: !425, file: !3, line: 588, type: !6)
!425 = distinct !DILexicalBlock(scope: !419, file: !3, line: 588, column: 5)
!426 = !DILocation(line: 588, column: 5, scope: !425)
!427 = !{i32 -2146579095}
!428 = !DILocation(line: 588, column: 5, scope: !429)
!429 = distinct !DILexicalBlock(scope: !415, file: !3, line: 588, column: 5)
!430 = !DILocalVariable(name: "__x", scope: !431, file: !3, line: 588, type: !6)
!431 = distinct !DILexicalBlock(scope: !429, file: !3, line: 588, column: 5)
!432 = !DILocation(line: 588, column: 5, scope: !431)
!433 = !{i32 -2146578963}
!434 = !DILocalVariable(name: "__x", scope: !435, file: !3, line: 588, type: !6)
!435 = distinct !DILexicalBlock(scope: !429, file: !3, line: 588, column: 5)
!436 = !DILocation(line: 588, column: 5, scope: !435)
!437 = !{i32 -2146578838}
!438 = !DILocation(line: 589, column: 5, scope: !404)
!439 = !DILocation(line: 593, column: 3, scope: !404)
!440 = !DILocation(line: 593, column: 9, scope: !404)
!441 = !DILocation(line: 593, column: 27, scope: !404)
!442 = !DILocation(line: 594, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !404, file: !3, line: 593, column: 42)
!444 = !DILocation(line: 596, column: 9, scope: !443)
!445 = !DILocation(line: 597, column: 9, scope: !443)
!446 = !DILocation(line: 597, column: 9, scope: !447)
!447 = distinct !DILexicalBlock(scope: !448, file: !3, line: 597, column: 9)
!448 = distinct !DILexicalBlock(scope: !443, file: !3, line: 597, column: 9)
!449 = !DILocation(line: 597, column: 9, scope: !448)
!450 = !DILocation(line: 597, column: 9, scope: !451)
!451 = distinct !DILexicalBlock(scope: !447, file: !3, line: 597, column: 9)
!452 = !DILocalVariable(name: "__x", scope: !453, file: !3, line: 597, type: !6)
!453 = distinct !DILexicalBlock(scope: !451, file: !3, line: 597, column: 9)
!454 = !DILocation(line: 597, column: 9, scope: !453)
!455 = !{i32 -2146576598}
!456 = !DILocalVariable(name: "__x", scope: !457, file: !3, line: 597, type: !6)
!457 = distinct !DILexicalBlock(scope: !451, file: !3, line: 597, column: 9)
!458 = !DILocation(line: 597, column: 9, scope: !457)
!459 = !{i32 -2146576473}
!460 = !DILocation(line: 597, column: 9, scope: !461)
!461 = distinct !DILexicalBlock(scope: !447, file: !3, line: 597, column: 9)
!462 = !DILocalVariable(name: "__x", scope: !463, file: !3, line: 597, type: !6)
!463 = distinct !DILexicalBlock(scope: !461, file: !3, line: 597, column: 9)
!464 = !DILocation(line: 597, column: 9, scope: !463)
!465 = !{i32 -2146576341}
!466 = !DILocalVariable(name: "__x", scope: !467, file: !3, line: 597, type: !6)
!467 = distinct !DILexicalBlock(scope: !461, file: !3, line: 597, column: 9)
!468 = !DILocation(line: 597, column: 9, scope: !467)
!469 = !{i32 -2146576216}
!470 = !DILocation(line: 598, column: 9, scope: !443)
!471 = !DILocation(line: 599, column: 9, scope: !443)
!472 = !DILocation(line: 601, column: 9, scope: !443)
!473 = !DILocation(line: 603, column: 9, scope: !443)
!474 = !DILocation(line: 604, column: 9, scope: !443)
!475 = !DILocation(line: 604, column: 9, scope: !476)
!476 = distinct !DILexicalBlock(scope: !477, file: !3, line: 604, column: 9)
!477 = distinct !DILexicalBlock(scope: !443, file: !3, line: 604, column: 9)
!478 = !DILocation(line: 604, column: 9, scope: !477)
!479 = !DILocation(line: 604, column: 9, scope: !480)
!480 = distinct !DILexicalBlock(scope: !476, file: !3, line: 604, column: 9)
!481 = !DILocalVariable(name: "__x", scope: !482, file: !3, line: 604, type: !6)
!482 = distinct !DILexicalBlock(scope: !480, file: !3, line: 604, column: 9)
!483 = !DILocation(line: 604, column: 9, scope: !482)
!484 = !{i32 -2146573986}
!485 = !DILocalVariable(name: "__x", scope: !486, file: !3, line: 604, type: !6)
!486 = distinct !DILexicalBlock(scope: !480, file: !3, line: 604, column: 9)
!487 = !DILocation(line: 604, column: 9, scope: !486)
!488 = !{i32 -2146573861}
!489 = !DILocation(line: 604, column: 9, scope: !490)
!490 = distinct !DILexicalBlock(scope: !476, file: !3, line: 604, column: 9)
!491 = !DILocalVariable(name: "__x", scope: !492, file: !3, line: 604, type: !6)
!492 = distinct !DILexicalBlock(scope: !490, file: !3, line: 604, column: 9)
!493 = !DILocation(line: 604, column: 9, scope: !492)
!494 = !{i32 -2146573729}
!495 = !DILocalVariable(name: "__x", scope: !496, file: !3, line: 604, type: !6)
!496 = distinct !DILexicalBlock(scope: !490, file: !3, line: 604, column: 9)
!497 = !DILocation(line: 604, column: 9, scope: !496)
!498 = !{i32 -2146573604}
!499 = !DILocation(line: 605, column: 9, scope: !443)
!500 = !DILocation(line: 606, column: 9, scope: !443)
!501 = !DILocation(line: 608, column: 9, scope: !443)
!502 = !DILocation(line: 610, column: 9, scope: !443)
!503 = !DILocation(line: 611, column: 9, scope: !443)
!504 = !DILocation(line: 611, column: 9, scope: !505)
!505 = distinct !DILexicalBlock(scope: !506, file: !3, line: 611, column: 9)
!506 = distinct !DILexicalBlock(scope: !443, file: !3, line: 611, column: 9)
!507 = !DILocation(line: 611, column: 9, scope: !506)
!508 = !DILocation(line: 611, column: 9, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !3, line: 611, column: 9)
!510 = !DILocalVariable(name: "__x", scope: !511, file: !3, line: 611, type: !6)
!511 = distinct !DILexicalBlock(scope: !509, file: !3, line: 611, column: 9)
!512 = !DILocation(line: 611, column: 9, scope: !511)
!513 = !{i32 -2146571350}
!514 = !DILocalVariable(name: "__x", scope: !515, file: !3, line: 611, type: !6)
!515 = distinct !DILexicalBlock(scope: !509, file: !3, line: 611, column: 9)
!516 = !DILocation(line: 611, column: 9, scope: !515)
!517 = !{i32 -2146571225}
!518 = !DILocation(line: 611, column: 9, scope: !519)
!519 = distinct !DILexicalBlock(scope: !505, file: !3, line: 611, column: 9)
!520 = !DILocalVariable(name: "__x", scope: !521, file: !3, line: 611, type: !6)
!521 = distinct !DILexicalBlock(scope: !519, file: !3, line: 611, column: 9)
!522 = !DILocation(line: 611, column: 9, scope: !521)
!523 = !{i32 -2146571093}
!524 = !DILocalVariable(name: "__x", scope: !525, file: !3, line: 611, type: !6)
!525 = distinct !DILexicalBlock(scope: !519, file: !3, line: 611, column: 9)
!526 = !DILocation(line: 611, column: 9, scope: !525)
!527 = !{i32 -2146570968}
!528 = !DILocation(line: 612, column: 9, scope: !443)
!529 = !DILocation(line: 613, column: 9, scope: !443)
!530 = !DILocation(line: 615, column: 9, scope: !443)
!531 = !DILocation(line: 617, column: 9, scope: !443)
!532 = !DILocation(line: 618, column: 9, scope: !443)
!533 = !DILocation(line: 618, column: 9, scope: !534)
!534 = distinct !DILexicalBlock(scope: !535, file: !3, line: 618, column: 9)
!535 = distinct !DILexicalBlock(scope: !443, file: !3, line: 618, column: 9)
!536 = !DILocation(line: 618, column: 9, scope: !535)
!537 = !DILocation(line: 618, column: 9, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !3, line: 618, column: 9)
!539 = !DILocalVariable(name: "__x", scope: !540, file: !3, line: 618, type: !6)
!540 = distinct !DILexicalBlock(scope: !538, file: !3, line: 618, column: 9)
!541 = !DILocation(line: 618, column: 9, scope: !540)
!542 = !{i32 -2146568642}
!543 = !DILocalVariable(name: "__x", scope: !544, file: !3, line: 618, type: !6)
!544 = distinct !DILexicalBlock(scope: !538, file: !3, line: 618, column: 9)
!545 = !DILocation(line: 618, column: 9, scope: !544)
!546 = !{i32 -2146568517}
!547 = !DILocation(line: 618, column: 9, scope: !548)
!548 = distinct !DILexicalBlock(scope: !534, file: !3, line: 618, column: 9)
!549 = !DILocalVariable(name: "__x", scope: !550, file: !3, line: 618, type: !6)
!550 = distinct !DILexicalBlock(scope: !548, file: !3, line: 618, column: 9)
!551 = !DILocation(line: 618, column: 9, scope: !550)
!552 = !{i32 -2146568385}
!553 = !DILocalVariable(name: "__x", scope: !554, file: !3, line: 618, type: !6)
!554 = distinct !DILexicalBlock(scope: !548, file: !3, line: 618, column: 9)
!555 = !DILocation(line: 618, column: 9, scope: !554)
!556 = !{i32 -2146568260}
!557 = !DILocation(line: 619, column: 9, scope: !443)
!558 = !DILocation(line: 620, column: 9, scope: !443)
!559 = !DILocation(line: 622, column: 12, scope: !560)
!560 = distinct !DILexicalBlock(scope: !443, file: !3, line: 622, column: 12)
!561 = !DILocation(line: 622, column: 30, scope: !560)
!562 = !DILocation(line: 622, column: 12, scope: !443)
!563 = !DILocation(line: 623, column: 13, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !3, line: 622, column: 45)
!565 = !DILocation(line: 625, column: 13, scope: !564)
!566 = !DILocation(line: 626, column: 13, scope: !564)
!567 = !DILocation(line: 626, column: 13, scope: !568)
!568 = distinct !DILexicalBlock(scope: !569, file: !3, line: 626, column: 13)
!569 = distinct !DILexicalBlock(scope: !564, file: !3, line: 626, column: 13)
!570 = !DILocation(line: 626, column: 13, scope: !569)
!571 = !DILocation(line: 626, column: 13, scope: !572)
!572 = distinct !DILexicalBlock(scope: !568, file: !3, line: 626, column: 13)
!573 = !DILocalVariable(name: "__x", scope: !574, file: !3, line: 626, type: !6)
!574 = distinct !DILexicalBlock(scope: !572, file: !3, line: 626, column: 13)
!575 = !DILocation(line: 626, column: 13, scope: !574)
!576 = !{i32 -2146565683}
!577 = !DILocalVariable(name: "__x", scope: !578, file: !3, line: 626, type: !6)
!578 = distinct !DILexicalBlock(scope: !572, file: !3, line: 626, column: 13)
!579 = !DILocation(line: 626, column: 13, scope: !578)
!580 = !{i32 -2146565558}
!581 = !DILocation(line: 626, column: 13, scope: !582)
!582 = distinct !DILexicalBlock(scope: !568, file: !3, line: 626, column: 13)
!583 = !DILocalVariable(name: "__x", scope: !584, file: !3, line: 626, type: !6)
!584 = distinct !DILexicalBlock(scope: !582, file: !3, line: 626, column: 13)
!585 = !DILocation(line: 626, column: 13, scope: !584)
!586 = !{i32 -2146565426}
!587 = !DILocalVariable(name: "__x", scope: !588, file: !3, line: 626, type: !6)
!588 = distinct !DILexicalBlock(scope: !582, file: !3, line: 626, column: 13)
!589 = !DILocation(line: 626, column: 13, scope: !588)
!590 = !{i32 -2146565301}
!591 = !DILocation(line: 627, column: 13, scope: !564)
!592 = !DILocation(line: 628, column: 13, scope: !564)
!593 = !DILocation(line: 630, column: 16, scope: !594)
!594 = distinct !DILexicalBlock(scope: !564, file: !3, line: 630, column: 16)
!595 = !DILocation(line: 630, column: 28, scope: !594)
!596 = !DILocation(line: 630, column: 41, scope: !594)
!597 = !DILocation(line: 630, column: 44, scope: !594)
!598 = !DILocation(line: 630, column: 56, scope: !594)
!599 = !DILocation(line: 630, column: 16, scope: !564)
!600 = !DILocation(line: 631, column: 17, scope: !601)
!601 = distinct !DILexicalBlock(scope: !594, file: !3, line: 630, column: 70)
!602 = !DILocation(line: 631, column: 23, scope: !601)
!603 = !DILocation(line: 631, column: 36, scope: !601)
!604 = !DILocation(line: 631, column: 45, scope: !601)
!605 = !DILocation(line: 631, column: 49, scope: !601)
!606 = !DILocation(line: 631, column: 71, scope: !601)
!607 = !DILocation(line: 0, scope: !601)
!608 = !DILocation(line: 632, column: 21, scope: !609)
!609 = distinct !DILexicalBlock(scope: !601, file: !3, line: 631, column: 91)
!610 = !DILocation(line: 634, column: 21, scope: !609)
!611 = !DILocation(line: 635, column: 21, scope: !609)
!612 = !DILocation(line: 635, column: 21, scope: !613)
!613 = distinct !DILexicalBlock(scope: !614, file: !3, line: 635, column: 21)
!614 = distinct !DILexicalBlock(scope: !609, file: !3, line: 635, column: 21)
!615 = !DILocation(line: 635, column: 21, scope: !614)
!616 = !DILocation(line: 635, column: 21, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !3, line: 635, column: 21)
!618 = !DILocalVariable(name: "__x", scope: !619, file: !3, line: 635, type: !6)
!619 = distinct !DILexicalBlock(scope: !617, file: !3, line: 635, column: 21)
!620 = !DILocation(line: 635, column: 21, scope: !619)
!621 = !{i32 -2146562577}
!622 = !DILocalVariable(name: "__x", scope: !623, file: !3, line: 635, type: !6)
!623 = distinct !DILexicalBlock(scope: !617, file: !3, line: 635, column: 21)
!624 = !DILocation(line: 635, column: 21, scope: !623)
!625 = !{i32 -2146562452}
!626 = !DILocation(line: 635, column: 21, scope: !627)
!627 = distinct !DILexicalBlock(scope: !613, file: !3, line: 635, column: 21)
!628 = !DILocalVariable(name: "__x", scope: !629, file: !3, line: 635, type: !6)
!629 = distinct !DILexicalBlock(scope: !627, file: !3, line: 635, column: 21)
!630 = !DILocation(line: 635, column: 21, scope: !629)
!631 = !{i32 -2146562320}
!632 = !DILocalVariable(name: "__x", scope: !633, file: !3, line: 635, type: !6)
!633 = distinct !DILexicalBlock(scope: !627, file: !3, line: 635, column: 21)
!634 = !DILocation(line: 635, column: 21, scope: !633)
!635 = !{i32 -2146562195}
!636 = !DILocation(line: 636, column: 21, scope: !609)
!637 = !DILocation(line: 637, column: 21, scope: !609)
!638 = distinct !{!638, !600, !639}
!639 = !DILocation(line: 638, column: 17, scope: !601)
!640 = !DILocation(line: 639, column: 13, scope: !601)
!641 = !DILocation(line: 641, column: 13, scope: !564)
!642 = !DILocation(line: 643, column: 13, scope: !564)
!643 = !DILocation(line: 644, column: 13, scope: !564)
!644 = !DILocation(line: 644, column: 13, scope: !645)
!645 = distinct !DILexicalBlock(scope: !646, file: !3, line: 644, column: 13)
!646 = distinct !DILexicalBlock(scope: !564, file: !3, line: 644, column: 13)
!647 = !DILocation(line: 644, column: 13, scope: !646)
!648 = !DILocation(line: 644, column: 13, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !3, line: 644, column: 13)
!650 = !DILocalVariable(name: "__x", scope: !651, file: !3, line: 644, type: !6)
!651 = distinct !DILexicalBlock(scope: !649, file: !3, line: 644, column: 13)
!652 = !DILocation(line: 644, column: 13, scope: !651)
!653 = !{i32 -2146559538}
!654 = !DILocalVariable(name: "__x", scope: !655, file: !3, line: 644, type: !6)
!655 = distinct !DILexicalBlock(scope: !649, file: !3, line: 644, column: 13)
!656 = !DILocation(line: 644, column: 13, scope: !655)
!657 = !{i32 -2146559413}
!658 = !DILocation(line: 644, column: 13, scope: !659)
!659 = distinct !DILexicalBlock(scope: !645, file: !3, line: 644, column: 13)
!660 = !DILocalVariable(name: "__x", scope: !661, file: !3, line: 644, type: !6)
!661 = distinct !DILexicalBlock(scope: !659, file: !3, line: 644, column: 13)
!662 = !DILocation(line: 644, column: 13, scope: !661)
!663 = !{i32 -2146559281}
!664 = !DILocalVariable(name: "__x", scope: !665, file: !3, line: 644, type: !6)
!665 = distinct !DILexicalBlock(scope: !659, file: !3, line: 644, column: 13)
!666 = !DILocation(line: 644, column: 13, scope: !665)
!667 = !{i32 -2146559156}
!668 = !DILocation(line: 645, column: 13, scope: !564)
!669 = !DILocation(line: 646, column: 13, scope: !564)
!670 = !DILocation(line: 648, column: 9, scope: !564)
!671 = !DILocation(line: 649, column: 13, scope: !672)
!672 = distinct !DILexicalBlock(scope: !560, file: !3, line: 648, column: 16)
!673 = !DILocation(line: 651, column: 13, scope: !672)
!674 = !DILocation(line: 652, column: 13, scope: !672)
!675 = !DILocation(line: 652, column: 13, scope: !676)
!676 = distinct !DILexicalBlock(scope: !677, file: !3, line: 652, column: 13)
!677 = distinct !DILexicalBlock(scope: !672, file: !3, line: 652, column: 13)
!678 = !DILocation(line: 652, column: 13, scope: !677)
!679 = !DILocation(line: 652, column: 13, scope: !680)
!680 = distinct !DILexicalBlock(scope: !676, file: !3, line: 652, column: 13)
!681 = !DILocalVariable(name: "__x", scope: !682, file: !3, line: 652, type: !6)
!682 = distinct !DILexicalBlock(scope: !680, file: !3, line: 652, column: 13)
!683 = !DILocation(line: 652, column: 13, scope: !682)
!684 = !{i32 -2146556471}
!685 = !DILocalVariable(name: "__x", scope: !686, file: !3, line: 652, type: !6)
!686 = distinct !DILexicalBlock(scope: !680, file: !3, line: 652, column: 13)
!687 = !DILocation(line: 652, column: 13, scope: !686)
!688 = !{i32 -2146556346}
!689 = !DILocation(line: 652, column: 13, scope: !690)
!690 = distinct !DILexicalBlock(scope: !676, file: !3, line: 652, column: 13)
!691 = !DILocalVariable(name: "__x", scope: !692, file: !3, line: 652, type: !6)
!692 = distinct !DILexicalBlock(scope: !690, file: !3, line: 652, column: 13)
!693 = !DILocation(line: 652, column: 13, scope: !692)
!694 = !{i32 -2146556214}
!695 = !DILocalVariable(name: "__x", scope: !696, file: !3, line: 652, type: !6)
!696 = distinct !DILexicalBlock(scope: !690, file: !3, line: 652, column: 13)
!697 = !DILocation(line: 652, column: 13, scope: !696)
!698 = !{i32 -2146556089}
!699 = !DILocation(line: 653, column: 13, scope: !672)
!700 = !DILocation(line: 654, column: 13, scope: !672)
!701 = !DILocation(line: 656, column: 13, scope: !672)
!702 = !DILocation(line: 658, column: 13, scope: !672)
!703 = !DILocation(line: 659, column: 13, scope: !672)
!704 = !DILocation(line: 659, column: 13, scope: !705)
!705 = distinct !DILexicalBlock(scope: !706, file: !3, line: 659, column: 13)
!706 = distinct !DILexicalBlock(scope: !672, file: !3, line: 659, column: 13)
!707 = !DILocation(line: 659, column: 13, scope: !706)
!708 = !DILocation(line: 659, column: 13, scope: !709)
!709 = distinct !DILexicalBlock(scope: !705, file: !3, line: 659, column: 13)
!710 = !DILocalVariable(name: "__x", scope: !711, file: !3, line: 659, type: !6)
!711 = distinct !DILexicalBlock(scope: !709, file: !3, line: 659, column: 13)
!712 = !DILocation(line: 659, column: 13, scope: !711)
!713 = !{i32 -2146553661}
!714 = !DILocalVariable(name: "__x", scope: !715, file: !3, line: 659, type: !6)
!715 = distinct !DILexicalBlock(scope: !709, file: !3, line: 659, column: 13)
!716 = !DILocation(line: 659, column: 13, scope: !715)
!717 = !{i32 -2146553536}
!718 = !DILocation(line: 659, column: 13, scope: !719)
!719 = distinct !DILexicalBlock(scope: !705, file: !3, line: 659, column: 13)
!720 = !DILocalVariable(name: "__x", scope: !721, file: !3, line: 659, type: !6)
!721 = distinct !DILexicalBlock(scope: !719, file: !3, line: 659, column: 13)
!722 = !DILocation(line: 659, column: 13, scope: !721)
!723 = !{i32 -2146553404}
!724 = !DILocalVariable(name: "__x", scope: !725, file: !3, line: 659, type: !6)
!725 = distinct !DILexicalBlock(scope: !719, file: !3, line: 659, column: 13)
!726 = !DILocation(line: 659, column: 13, scope: !725)
!727 = !{i32 -2146553279}
!728 = !DILocation(line: 660, column: 13, scope: !672)
!729 = !DILocation(line: 661, column: 13, scope: !672)
!730 = distinct !{!730, !439, !731}
!731 = !DILocation(line: 663, column: 5, scope: !404)
!732 = !DILocation(line: 666, column: 5, scope: !404)
!733 = !DILocation(line: 667, column: 1, scope: !404)
!734 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 226, type: !735, scopeLine: 227, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!735 = !DISubroutineType(types: !736)
!736 = !{!214, !7, !6}
!737 = !DILocalVariable(name: "data", arg: 1, scope: !734, file: !3, line: 226, type: !7)
!738 = !DILocation(line: 226, column: 33, scope: !734)
!739 = !DILocalVariable(name: "len", arg: 2, scope: !734, file: !3, line: 226, type: !6)
!740 = !DILocation(line: 226, column: 48, scope: !734)
!741 = !DILocalVariable(name: "hash", scope: !734, file: !3, line: 228, type: !18)
!742 = !DILocation(line: 228, column: 14, scope: !734)
!743 = !DILocalVariable(name: "i", scope: !734, file: !3, line: 229, type: !6)
!744 = !DILocation(line: 229, column: 18, scope: !734)
!745 = !DILocation(line: 231, column: 11, scope: !746)
!746 = distinct !DILexicalBlock(scope: !734, file: !3, line: 231, column: 5)
!747 = !DILocation(line: 231, column: 9, scope: !746)
!748 = !DILocation(line: 231, column: 16, scope: !749)
!749 = distinct !DILexicalBlock(scope: !746, file: !3, line: 231, column: 5)
!750 = !DILocation(line: 231, column: 20, scope: !749)
!751 = !DILocation(line: 231, column: 18, scope: !749)
!752 = !DILocation(line: 231, column: 5, scope: !746)
!753 = !DILocation(line: 232, column: 18, scope: !749)
!754 = !DILocation(line: 232, column: 23, scope: !749)
!755 = !DILocation(line: 232, column: 31, scope: !749)
!756 = !DILocation(line: 232, column: 29, scope: !749)
!757 = !DILocation(line: 232, column: 41, scope: !749)
!758 = !DILocation(line: 232, column: 40, scope: !749)
!759 = !DILocation(line: 232, column: 39, scope: !749)
!760 = !DILocation(line: 232, column: 37, scope: !749)
!761 = !DILocation(line: 232, column: 14, scope: !749)
!762 = !DILocation(line: 232, column: 9, scope: !749)
!763 = !DILocation(line: 231, column: 29, scope: !749)
!764 = !DILocation(line: 231, column: 34, scope: !749)
!765 = !DILocation(line: 231, column: 5, scope: !749)
!766 = distinct !{!766, !752, !767}
!767 = !DILocation(line: 232, column: 45, scope: !746)
!768 = !DILocation(line: 235, column: 12, scope: !734)
!769 = !DILocation(line: 235, column: 5, scope: !734)
