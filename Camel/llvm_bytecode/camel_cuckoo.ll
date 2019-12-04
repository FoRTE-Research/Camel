; ModuleID = 'camel_cuckoo.bc'
source_filename = "../example/camel_cuckoo.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { [128 x i16], i16, i16, i16, i16, i16, i16, i16, i16, i16, i8, i8 }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !33
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !66
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !29
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !31
@init_key = dso_local constant i16 1, align 2, !dbg !14
@writeOpt = dso_local global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !24
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !68
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !80 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !81
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !82
  %conv = zext i8 %0 to i16, !dbg !82
  %or = or i16 %conv, 1, !dbg !82
  %conv1 = trunc i16 %or to i8, !dbg !82
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !82
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !83
  %conv2 = zext i8 %1 to i16, !dbg !83
  %and = and i16 %conv2, -2, !dbg !83
  %conv3 = trunc i16 %and to i8, !dbg !83
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !83
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !84
  %and4 = and i16 %2, -2, !dbg !84
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !84
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !85
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !86
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !87
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !88
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !89
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !90
  ret void, !dbg !91
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !92 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !93
  %cmp = icmp eq i16 %0, 1, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !97
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !99
  br label %if.end4, !dbg !100

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !101
  %cmp1 = icmp eq i16 %1, 2, !dbg !103
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !104

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !105
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !107
  br label %if.end, !dbg !108

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !111
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !111
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !111
  %3 = load i16, i16* %arrayidx, align 2, !dbg !111
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !111, !srcloc !113
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !114, metadata !DIExpression()), !dbg !116
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !116, !srcloc !117
  store i16 %4, i16* %__x, align 2, !dbg !116
  %5 = load i16, i16* %__x, align 2, !dbg !116
  store i16 %5, i16* %tmp, align 2, !dbg !116
  %6 = load i16, i16* %tmp, align 2, !dbg !116
  %add = add i16 %6, 2, !dbg !118
  %7 = inttoptr i16 %add to i8*, !dbg !119
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !120, metadata !DIExpression()), !dbg !122
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !122, !srcloc !123
  store i16 %8, i16* %__x5, align 2, !dbg !122
  %9 = load i16, i16* %__x5, align 2, !dbg !122
  store i16 %9, i16* %tmp6, align 2, !dbg !122
  %10 = load i16, i16* %tmp6, align 2, !dbg !122
  %add7 = add i16 %10, 2, !dbg !124
  %sub = sub i16 9216, %add7, !dbg !125
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !126
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !127
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !128
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !128
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !129
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 298, i16 zeroext %13), !dbg !130
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !131
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !132
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !134
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !135
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !135
  %cmp9 = icmp eq i16 %14, %16, !dbg !136
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !137

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !138
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !140
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !141
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !140
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 300, i1 false), !dbg !140
  call void @camel_init(), !dbg !142
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !143
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !144
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !143
  call void @__restore_registers(i16* %arraydecay), !dbg !145
  br label %if.end13, !dbg !146

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !147
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !149
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !150 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !151, metadata !DIExpression()), !dbg !152
  store i16 0, i16* %i, align 2, !dbg !153
  br label %for.cond, !dbg !155

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !156
  %cmp = icmp ult i16 %0, 128, !dbg !158
  br i1 %cmp, label %for.body, label %for.end, !dbg !159

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !160
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !160
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !160
  %2 = load i16, i16* %i, align 2, !dbg !162
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !160
  store i16 0, i16* %arrayidx, align 2, !dbg !163
  br label %for.inc, !dbg !164

for.inc:                                          ; preds = %for.body
  %3 = load i16, i16* %i, align 2, !dbg !165
  %inc = add i16 %3, 1, !dbg !165
  store i16 %inc, i16* %i, align 2, !dbg !165
  br label %for.cond, !dbg !166, !llvm.loop !167

for.end:                                          ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !169
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !169
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !169
  store i16 0, i16* %insert_count, align 2, !dbg !170
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !171
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !171
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !171
  store i16 0, i16* %lookup_count, align 2, !dbg !172
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !173
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !173
  store i16 0, i16* %inserted_count, align 2, !dbg !174
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !175
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !175
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !175
  store i16 0, i16* %member_count, align 2, !dbg !176
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !177
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !177
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
  call void @llvm.dbg.declare(metadata i16* %fp.addr, metadata !210, metadata !DIExpression()), !dbg !211
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !212, metadata !DIExpression()), !dbg !214
  %0 = bitcast i16* %fp.addr to i8*, !dbg !215
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !216
  store i16 %call, i16* %hash, align 2, !dbg !214
  %1 = load i16, i16* %hash, align 2, !dbg !217
  %and = and i16 %1, 127, !dbg !218
  ret i16 %and, !dbg !219
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() #0 !dbg !220 {
entry:
  %fp_hash = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !221, metadata !DIExpression()), !dbg !222
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !223
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !223
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !223
  %1 = load i16, i16* %fingerprint, align 2, !dbg !223
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !224
  store i16 %call, i16* %fp_hash, align 2, !dbg !222
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !225
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !225
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !225
  %3 = load i16, i16* %index1, align 2, !dbg !225
  %4 = load i16, i16* %fp_hash, align 2, !dbg !226
  %xor = xor i16 %3, %4, !dbg !227
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !228
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !228
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !228
  store i16 %xor, i16* %index2, align 2, !dbg !229
  ret void, !dbg !230
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() #0 !dbg !231 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !232
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !232
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !234
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !234
  %2 = load i16, i16* %index1, align 2, !dbg !234
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !232
  %3 = load i16, i16* %arrayidx, align 2, !dbg !232
  %tobool = icmp ne i16 %3, 0, !dbg !232
  br i1 %tobool, label %if.else, label %if.then, !dbg !235

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !236
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !236
  store i8 1, i8* %success, align 2, !dbg !238
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !239
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !239
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !239
  %6 = load i16, i16* %fingerprint, align 2, !dbg !239
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !240
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !240
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !240
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !241
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !241
  %9 = load i16, i16* %index17, align 2, !dbg !241
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !240
  store i16 %6, i16* %arrayidx8, align 2, !dbg !242
  br label %if.end53, !dbg !243

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !244
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !244
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !244
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !247
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !247
  %12 = load i16, i16* %index2, align 2, !dbg !247
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !244
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !244
  %tobool13 = icmp ne i16 %13, 0, !dbg !244
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !248

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !249
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !249
  store i8 1, i8* %success16, align 2, !dbg !251
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !252
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !252
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !252
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !252
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !253
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !253
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !254
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !254
  %19 = load i16, i16* %index222, align 2, !dbg !254
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !253
  store i16 %16, i16* %arrayidx23, align 2, !dbg !255
  br label %if.end52, !dbg !256

if.else24:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !257, metadata !DIExpression()), !dbg !259
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !260, metadata !DIExpression()), !dbg !261
  %call = call i16 @rand(), !dbg !262
  %rem = srem i16 %call, 2, !dbg !264
  %tobool25 = icmp ne i16 %rem, 0, !dbg !264
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !265

if.then26:                                        ; preds = %if.else24
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !266
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !266
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !266
  %21 = load i16, i16* %index128, align 2, !dbg !266
  store i16 %21, i16* %index_victim, align 2, !dbg !268
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !269
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !269
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !269
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !270
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !270
  %24 = load i16, i16* %index132, align 2, !dbg !270
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %24, !dbg !269
  %25 = load i16, i16* %arrayidx33, align 2, !dbg !269
  store i16 %25, i16* %fp_victim, align 2, !dbg !271
  br label %if.end, !dbg !272

if.else34:                                        ; preds = %if.else24
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !273
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !273
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !273
  %27 = load i16, i16* %index236, align 2, !dbg !273
  store i16 %27, i16* %index_victim, align 2, !dbg !275
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !276
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !276
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !276
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !277
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !277
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !277
  %30 = load i16, i16* %index240, align 2, !dbg !277
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %30, !dbg !276
  %31 = load i16, i16* %arrayidx41, align 2, !dbg !276
  store i16 %31, i16* %fp_victim, align 2, !dbg !278
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !279
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !279
  %33 = load i16, i16* %fingerprint43, align 2, !dbg !279
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !280
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !280
  %35 = load i16, i16* %index_victim, align 2, !dbg !281
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %35, !dbg !280
  store i16 %33, i16* %arrayidx46, align 2, !dbg !282
  %36 = load i16, i16* %index_victim, align 2, !dbg !283
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !284
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !284
  store i16 %36, i16* %index148, align 2, !dbg !285
  %38 = load i16, i16* %fp_victim, align 2, !dbg !286
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !287
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !287
  store i16 %38, i16* %fingerprint50, align 2, !dbg !288
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !289
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !289
  store i16 0, i16* %relocation_count, align 2, !dbg !290
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  ret void, !dbg !291
}

declare dso_local i16 @rand() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() #0 !dbg !292 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !293, metadata !DIExpression()), !dbg !294
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !295
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !295
  %1 = load i16, i16* %fingerprint, align 2, !dbg !295
  store i16 %1, i16* %fp_victim, align 2, !dbg !294
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !296, metadata !DIExpression()), !dbg !297
  %2 = load i16, i16* %fp_victim, align 2, !dbg !298
  %call = call zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !299
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !297
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !300, metadata !DIExpression()), !dbg !301
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !302
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !302
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !302
  %4 = load i16, i16* %index1, align 2, !dbg !302
  %5 = load i16, i16* %fp_hash_victim, align 2, !dbg !303
  %xor = xor i16 %4, %5, !dbg !304
  store i16 %xor, i16* %index2_victim, align 2, !dbg !301
  %6 = load i16, i16* %index2_victim, align 2, !dbg !305
  store i16 %6, i16* @writeOpt, align 2, !dbg !306
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !307
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !307
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !307
  %8 = load i16, i16* @writeOpt, align 2, !dbg !307
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %8, !dbg !307
  %9 = load i16, i16* %arrayidx, align 2, !dbg !307
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !307
  %filter4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !307
  %11 = load i16, i16* @writeOpt, align 2, !dbg !307
  %arrayidx5 = getelementptr inbounds [128 x i16], [128 x i16]* %filter4, i16 0, i16 %11, !dbg !307
  store i16 %9, i16* %arrayidx5, align 2, !dbg !307
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !308
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !308
  %filter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 0, !dbg !308
  %13 = load i16, i16* %index2_victim, align 2, !dbg !310
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter7, i16 0, i16 %13, !dbg !308
  %14 = load i16, i16* %arrayidx8, align 2, !dbg !308
  %tobool = icmp ne i16 %14, 0, !dbg !308
  br i1 %tobool, label %if.end, label %if.then, !dbg !311

if.then:                                          ; preds = %entry
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !312
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !312
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !312
  store i8 1, i8* %success, align 2, !dbg !314
  %16 = load i16, i16* %fp_victim, align 2, !dbg !315
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !316
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !316
  %filter11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 0, !dbg !316
  %18 = load i16, i16* %index2_victim, align 2, !dbg !317
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter11, i16 0, i16 %18, !dbg !316
  store i16 %16, i16* %arrayidx12, align 2, !dbg !318
  br label %return, !dbg !319

if.end:                                           ; preds = %entry
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !320
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 5, !dbg !320
  %20 = load i16, i16* %relocation_count, align 2, !dbg !320
  %cmp = icmp uge i16 %20, 8, !dbg !322
  br i1 %cmp, label %if.then14, label %if.end17, !dbg !323

if.then14:                                        ; preds = %if.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !324
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !324
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !324
  store i8 0, i8* %success16, align 2, !dbg !326
  br label %return, !dbg !327

if.end17:                                         ; preds = %if.end
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !328
  %relocation_count19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 5, !dbg !328
  %23 = load i16, i16* %relocation_count19, align 2, !dbg !329
  %inc = add i16 %23, 1, !dbg !329
  store i16 %inc, i16* %relocation_count19, align 2, !dbg !329
  %24 = load i16, i16* %index2_victim, align 2, !dbg !330
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !331
  %index121 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 3, !dbg !331
  store i16 %24, i16* %index121, align 2, !dbg !332
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !333
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !333
  %filter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 0, !dbg !333
  %27 = load i16, i16* %index2_victim, align 2, !dbg !334
  %arrayidx24 = getelementptr inbounds [128 x i16], [128 x i16]* %filter23, i16 0, i16 %27, !dbg !333
  %28 = load i16, i16* %arrayidx24, align 2, !dbg !333
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !335
  %fingerprint26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 2, !dbg !335
  store i16 %28, i16* %fingerprint26, align 2, !dbg !336
  %30 = load i16, i16* %fp_victim, align 2, !dbg !337
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !338
  %filter28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 0, !dbg !338
  %32 = load i16, i16* %index2_victim, align 2, !dbg !339
  %arrayidx29 = getelementptr inbounds [128 x i16], [128 x i16]* %filter28, i16 0, i16 %32, !dbg !338
  store i16 %30, i16* %arrayidx29, align 2, !dbg !340
  br label %return, !dbg !341

return:                                           ; preds = %if.end17, %if.then14, %if.then
  ret void, !dbg !341
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() #0 !dbg !342 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !343
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !343
  %1 = load i16, i16* %insert_count, align 2, !dbg !344
  %inc = add i16 %1, 1, !dbg !344
  store i16 %inc, i16* %insert_count, align 2, !dbg !344
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !345
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !345
  %3 = load i8, i8* %success, align 2, !dbg !345
  %tobool = trunc i8 %3 to i1, !dbg !345
  %conv = zext i1 %tobool to i16, !dbg !345
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !346
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !346
  %5 = load i16, i16* %inserted_count, align 2, !dbg !347
  %add = add i16 %5, %conv, !dbg !347
  store i16 %add, i16* %inserted_count, align 2, !dbg !347
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !348
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !348
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !348
  %7 = load i16, i16* %insert_count4, align 2, !dbg !348
  %cmp = icmp ult i16 %7, 32, !dbg !350
  br i1 %cmp, label %if.then, label %if.else, !dbg !351

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !352

if.else:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !354
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !354
  store i16 1, i16* %key, align 2, !dbg !356
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !357
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #0 !dbg !358 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !359
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !359
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !361
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !361
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !361
  %2 = load i16, i16* %index1, align 2, !dbg !361
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !359
  %3 = load i16, i16* %arrayidx, align 2, !dbg !359
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !362
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !362
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !362
  %5 = load i16, i16* %fingerprint, align 2, !dbg !362
  %cmp = icmp eq i16 %3, %5, !dbg !363
  br i1 %cmp, label %if.then, label %if.else, !dbg !364

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !365
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !365
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !365
  store i8 1, i8* %member, align 1, !dbg !367
  br label %if.end17, !dbg !368

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !369
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !369
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !372
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !372
  %9 = load i16, i16* %index2, align 2, !dbg !372
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !369
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !369
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !373
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !373
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !373
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !373
  %cmp10 = icmp eq i16 %10, %12, !dbg !374
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !375

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !376
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !376
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !376
  store i8 1, i8* %member13, align 1, !dbg !378
  br label %if.end, !dbg !379

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !380
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !380
  store i8 0, i8* %member16, align 1, !dbg !382
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !383
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !383
  %member19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 11, !dbg !383
  %16 = load i8, i8* %member19, align 1, !dbg !383
  %tobool = trunc i8 %16 to i1, !dbg !383
  br i1 %tobool, label %if.end21, label %if.then20, !dbg !385

if.then20:                                        ; preds = %if.end17
  br label %if.end21, !dbg !386

if.end21:                                         ; preds = %if.then20, %if.end17
  ret void, !dbg !388
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #0 !dbg !389 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !390
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !390
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !390
  %1 = load i16, i16* %lookup_count, align 2, !dbg !391
  %inc = add i16 %1, 1, !dbg !391
  store i16 %inc, i16* %lookup_count, align 2, !dbg !391
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !392
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !392
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !392
  %3 = load i8, i8* %member, align 1, !dbg !392
  %tobool = trunc i8 %3 to i1, !dbg !392
  %conv = zext i1 %tobool to i16, !dbg !392
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !393
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !393
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !393
  %5 = load i16, i16* %member_count, align 2, !dbg !394
  %add = add i16 %5, %conv, !dbg !394
  store i16 %add, i16* %member_count, align 2, !dbg !394
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !395
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !395
  %lookup_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !395
  %7 = load i16, i16* %lookup_count4, align 2, !dbg !395
  %cmp = icmp ult i16 %7, 32, !dbg !397
  br i1 %cmp, label %if.then, label %if.else, !dbg !398

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !399

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !401
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !402 {
entry:
  call void @exit(i16 0) #6, !dbg !403
  unreachable, !dbg !403
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !404 {
entry:
  %retval = alloca i16, align 2
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x8 = alloca i16, align 2
  %tmp9 = alloca i16, align 2
  %__x14 = alloca i16, align 2
  %tmp15 = alloca i16, align 2
  %__x17 = alloca i16, align 2
  %tmp18 = alloca i16, align 2
  %__x34 = alloca i16, align 2
  %tmp35 = alloca i16, align 2
  %__x37 = alloca i16, align 2
  %tmp38 = alloca i16, align 2
  %__x47 = alloca i16, align 2
  %tmp48 = alloca i16, align 2
  %__x50 = alloca i16, align 2
  %tmp51 = alloca i16, align 2
  %__x69 = alloca i16, align 2
  %tmp70 = alloca i16, align 2
  %__x72 = alloca i16, align 2
  %tmp73 = alloca i16, align 2
  %__x82 = alloca i16, align 2
  %tmp83 = alloca i16, align 2
  %__x85 = alloca i16, align 2
  %tmp86 = alloca i16, align 2
  %__x104 = alloca i16, align 2
  %tmp105 = alloca i16, align 2
  %__x107 = alloca i16, align 2
  %tmp108 = alloca i16, align 2
  %__x117 = alloca i16, align 2
  %tmp118 = alloca i16, align 2
  %__x120 = alloca i16, align 2
  %tmp121 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x145 = alloca i16, align 2
  %tmp146 = alloca i16, align 2
  %__x155 = alloca i16, align 2
  %tmp156 = alloca i16, align 2
  %__x158 = alloca i16, align 2
  %tmp159 = alloca i16, align 2
  %__x198 = alloca i16, align 2
  %tmp199 = alloca i16, align 2
  %__x201 = alloca i16, align 2
  %tmp202 = alloca i16, align 2
  %__x211 = alloca i16, align 2
  %tmp212 = alloca i16, align 2
  %__x214 = alloca i16, align 2
  %tmp215 = alloca i16, align 2
  %__x255 = alloca i16, align 2
  %tmp256 = alloca i16, align 2
  %__x258 = alloca i16, align 2
  %tmp259 = alloca i16, align 2
  %__x268 = alloca i16, align 2
  %tmp269 = alloca i16, align 2
  %__x271 = alloca i16, align 2
  %tmp272 = alloca i16, align 2
  %__x300 = alloca i16, align 2
  %tmp301 = alloca i16, align 2
  %__x303 = alloca i16, align 2
  %tmp304 = alloca i16, align 2
  %__x313 = alloca i16, align 2
  %tmp314 = alloca i16, align 2
  %__x316 = alloca i16, align 2
  %tmp317 = alloca i16, align 2
  %__x338 = alloca i16, align 2
  %tmp339 = alloca i16, align 2
  %__x341 = alloca i16, align 2
  %tmp342 = alloca i16, align 2
  %__x351 = alloca i16, align 2
  %tmp352 = alloca i16, align 2
  %__x354 = alloca i16, align 2
  %tmp355 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !408
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !410
  call void @camel_init(), !dbg !411
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !412
  %1 = bitcast %struct.camel_global_t* %globals to i8*, !dbg !412
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !412
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !412
  %3 = bitcast %struct.camel_global_t* %globals1 to i8*, !dbg !412
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %1, i8* align 2 %3, i16 276, i1 false), !dbg !412
  call void @task_init(), !dbg !413
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !414
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !415
  %5 = bitcast %struct.camel_global_t* %globals2 to i8*, !dbg !416
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !418
  %7 = bitcast %struct.camel_global_t* %globals3 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %5, i8* align 2 %7, i16 276, i1 false), !dbg !416
  br label %while.cond, !dbg !419

while.cond:                                       ; preds = %if.end370, %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !420
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !420
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !420
  %9 = load i16, i16* %lookup_count, align 2, !dbg !420
  %cmp = icmp ult i16 %9, 32, !dbg !421
  br i1 %cmp, label %while.body, label %while.end371, !dbg !419

while.body:                                       ; preds = %while.cond
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !422
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !422
  %11 = bitcast %struct.camel_global_t* %globals5 to i8*, !dbg !422
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !422
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !422
  %13 = bitcast %struct.camel_global_t* %globals6 to i8*, !dbg !422
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %13, i16 276, i1 false), !dbg !422
  call void @task_generate_key(), !dbg !424
  br label %do.body, !dbg !425

do.body:                                          ; preds = %while.body
  %14 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !426
  %cmp7 = icmp eq i16 %14, 1, !dbg !426
  br i1 %cmp7, label %if.then, label %if.else, !dbg !429

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !430
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !430
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 0, !dbg !430
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !430
  call void @__dump_registers(i16* %arraydecay), !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !432, metadata !DIExpression()), !dbg !434
  %16 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !434, !srcloc !435
  store i16 %16, i16* %__x, align 2, !dbg !434
  %17 = load i16, i16* %__x, align 2, !dbg !434
  store i16 %17, i16* %tmp, align 2, !dbg !434
  %18 = load i16, i16* %tmp, align 2, !dbg !434
  %add = add i16 %18, 2, !dbg !430
  %19 = inttoptr i16 %add to i8*, !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x8, metadata !436, metadata !DIExpression()), !dbg !438
  %20 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !438, !srcloc !439
  store i16 %20, i16* %__x8, align 2, !dbg !438
  %21 = load i16, i16* %__x8, align 2, !dbg !438
  store i16 %21, i16* %tmp9, align 2, !dbg !438
  %22 = load i16, i16* %tmp9, align 2, !dbg !438
  %add10 = add i16 %22, 2, !dbg !430
  %sub = sub i16 9216, %add10, !dbg !430
  %call = call zeroext i16 @__fast_hw_crc(i8* %19, i16 zeroext %sub, i16 zeroext -1), !dbg !430
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !430
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %24 = bitcast %struct.camel_buffer_t* %23 to i8*, !dbg !430
  %25 = load i16, i16* @tmp_stack_crc, align 2, !dbg !430
  %call11 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext 298, i16 zeroext %25), !dbg !430
  store i16 %call11, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %26 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 2, !dbg !430
  store i16 %26, i16* %stack_and_buf_crc, align 2, !dbg !430
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !430
  br label %if.end, !dbg !430

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !440
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %reg_file12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 0, !dbg !440
  %arraydecay13 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file12, i16 0, i16 0, !dbg !440
  call void @__dump_registers(i16* %arraydecay13), !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x14, metadata !442, metadata !DIExpression()), !dbg !444
  %29 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !444, !srcloc !445
  store i16 %29, i16* %__x14, align 2, !dbg !444
  %30 = load i16, i16* %__x14, align 2, !dbg !444
  store i16 %30, i16* %tmp15, align 2, !dbg !444
  %31 = load i16, i16* %tmp15, align 2, !dbg !444
  %add16 = add i16 %31, 2, !dbg !440
  %32 = inttoptr i16 %add16 to i8*, !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x17, metadata !446, metadata !DIExpression()), !dbg !448
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !448, !srcloc !449
  store i16 %33, i16* %__x17, align 2, !dbg !448
  %34 = load i16, i16* %__x17, align 2, !dbg !448
  store i16 %34, i16* %tmp18, align 2, !dbg !448
  %35 = load i16, i16* %tmp18, align 2, !dbg !448
  %add19 = add i16 %35, 2, !dbg !440
  %sub20 = sub i16 9216, %add19, !dbg !440
  %call21 = call zeroext i16 @__fast_hw_crc(i8* %32, i16 zeroext %sub20, i16 zeroext -1), !dbg !440
  store i16 %call21, i16* @tmp_stack_crc, align 2, !dbg !440
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %37 = bitcast %struct.camel_buffer_t* %36 to i8*, !dbg !440
  %38 = load i16, i16* @tmp_stack_crc, align 2, !dbg !440
  %call22 = call zeroext i16 @__fast_hw_crc(i8* %37, i16 zeroext 298, i16 zeroext %38), !dbg !440
  store i16 %call22, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %39 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %stack_and_buf_crc23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 2, !dbg !440
  store i16 %39, i16* %stack_and_buf_crc23, align 2, !dbg !440
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !440
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !429

do.end:                                           ; preds = %if.end
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !450
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !450
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 1, !dbg !450
  %42 = load i16, i16* %key, align 2, !dbg !450
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !450
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !450
  %key26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 1, !dbg !450
  store i16 %42, i16* %key26, align 2, !dbg !450
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !451
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !451
  %45 = bitcast %struct.camel_global_t* %globals27 to i8*, !dbg !451
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !451
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 1, !dbg !451
  %47 = bitcast %struct.camel_global_t* %globals28 to i8*, !dbg !451
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %45, i8* align 2 %47, i16 276, i1 false), !dbg !451
  call void @task_calc_indexes(), !dbg !452
  br label %do.body29, !dbg !453

do.body29:                                        ; preds = %do.end
  %48 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !454
  %cmp30 = icmp eq i16 %48, 1, !dbg !454
  br i1 %cmp30, label %if.then31, label %if.else44, !dbg !457

if.then31:                                        ; preds = %do.body29
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !458
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !458
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %reg_file32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %49, i32 0, i32 0, !dbg !458
  %arraydecay33 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file32, i16 0, i16 0, !dbg !458
  call void @__dump_registers(i16* %arraydecay33), !dbg !458
  call void @llvm.dbg.declare(metadata i16* %__x34, metadata !460, metadata !DIExpression()), !dbg !462
  %50 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !462, !srcloc !463
  store i16 %50, i16* %__x34, align 2, !dbg !462
  %51 = load i16, i16* %__x34, align 2, !dbg !462
  store i16 %51, i16* %tmp35, align 2, !dbg !462
  %52 = load i16, i16* %tmp35, align 2, !dbg !462
  %add36 = add i16 %52, 2, !dbg !458
  %53 = inttoptr i16 %add36 to i8*, !dbg !458
  call void @llvm.dbg.declare(metadata i16* %__x37, metadata !464, metadata !DIExpression()), !dbg !466
  %54 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !466, !srcloc !467
  store i16 %54, i16* %__x37, align 2, !dbg !466
  %55 = load i16, i16* %__x37, align 2, !dbg !466
  store i16 %55, i16* %tmp38, align 2, !dbg !466
  %56 = load i16, i16* %tmp38, align 2, !dbg !466
  %add39 = add i16 %56, 2, !dbg !458
  %sub40 = sub i16 9216, %add39, !dbg !458
  %call41 = call zeroext i16 @__fast_hw_crc(i8* %53, i16 zeroext %sub40, i16 zeroext -1), !dbg !458
  store i16 %call41, i16* @tmp_stack_crc, align 2, !dbg !458
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %58 = bitcast %struct.camel_buffer_t* %57 to i8*, !dbg !458
  %59 = load i16, i16* @tmp_stack_crc, align 2, !dbg !458
  %call42 = call zeroext i16 @__fast_hw_crc(i8* %58, i16 zeroext 298, i16 zeroext %59), !dbg !458
  store i16 %call42, i16* @tmp_stack_buf_crc, align 2, !dbg !458
  %60 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !458
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %stack_and_buf_crc43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 2, !dbg !458
  store i16 %60, i16* %stack_and_buf_crc43, align 2, !dbg !458
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !458
  br label %if.end57, !dbg !458

if.else44:                                        ; preds = %do.body29
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !468
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !468
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %reg_file45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i32 0, i32 0, !dbg !468
  %arraydecay46 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file45, i16 0, i16 0, !dbg !468
  call void @__dump_registers(i16* %arraydecay46), !dbg !468
  call void @llvm.dbg.declare(metadata i16* %__x47, metadata !470, metadata !DIExpression()), !dbg !472
  %63 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !472, !srcloc !473
  store i16 %63, i16* %__x47, align 2, !dbg !472
  %64 = load i16, i16* %__x47, align 2, !dbg !472
  store i16 %64, i16* %tmp48, align 2, !dbg !472
  %65 = load i16, i16* %tmp48, align 2, !dbg !472
  %add49 = add i16 %65, 2, !dbg !468
  %66 = inttoptr i16 %add49 to i8*, !dbg !468
  call void @llvm.dbg.declare(metadata i16* %__x50, metadata !474, metadata !DIExpression()), !dbg !476
  %67 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !476, !srcloc !477
  store i16 %67, i16* %__x50, align 2, !dbg !476
  %68 = load i16, i16* %__x50, align 2, !dbg !476
  store i16 %68, i16* %tmp51, align 2, !dbg !476
  %69 = load i16, i16* %tmp51, align 2, !dbg !476
  %add52 = add i16 %69, 2, !dbg !468
  %sub53 = sub i16 9216, %add52, !dbg !468
  %call54 = call zeroext i16 @__fast_hw_crc(i8* %66, i16 zeroext %sub53, i16 zeroext -1), !dbg !468
  store i16 %call54, i16* @tmp_stack_crc, align 2, !dbg !468
  %70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %71 = bitcast %struct.camel_buffer_t* %70 to i8*, !dbg !468
  %72 = load i16, i16* @tmp_stack_crc, align 2, !dbg !468
  %call55 = call zeroext i16 @__fast_hw_crc(i8* %71, i16 zeroext 298, i16 zeroext %72), !dbg !468
  store i16 %call55, i16* @tmp_stack_buf_crc, align 2, !dbg !468
  %73 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !468
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %stack_and_buf_crc56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i32 0, i32 2, !dbg !468
  store i16 %73, i16* %stack_and_buf_crc56, align 2, !dbg !468
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !468
  br label %if.end57

if.end57:                                         ; preds = %if.else44, %if.then31
  br label %do.end58, !dbg !457

do.end58:                                         ; preds = %if.end57
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !478
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1, !dbg !478
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 2, !dbg !478
  %76 = load i16, i16* %fingerprint, align 2, !dbg !478
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !478
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 1, !dbg !478
  %fingerprint61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 2, !dbg !478
  store i16 %76, i16* %fingerprint61, align 2, !dbg !478
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !479
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 1, !dbg !479
  %79 = bitcast %struct.camel_global_t* %globals62 to i8*, !dbg !479
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !479
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 1, !dbg !479
  %81 = bitcast %struct.camel_global_t* %globals63 to i8*, !dbg !479
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %79, i8* align 2 %81, i16 276, i1 false), !dbg !479
  call void @task_calc_indexes_index_1(), !dbg !480
  br label %do.body64, !dbg !481

do.body64:                                        ; preds = %do.end58
  %82 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !482
  %cmp65 = icmp eq i16 %82, 1, !dbg !482
  br i1 %cmp65, label %if.then66, label %if.else79, !dbg !485

if.then66:                                        ; preds = %do.body64
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !486
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %83 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %reg_file67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %83, i32 0, i32 0, !dbg !486
  %arraydecay68 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file67, i16 0, i16 0, !dbg !486
  call void @__dump_registers(i16* %arraydecay68), !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x69, metadata !488, metadata !DIExpression()), !dbg !490
  %84 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !490, !srcloc !491
  store i16 %84, i16* %__x69, align 2, !dbg !490
  %85 = load i16, i16* %__x69, align 2, !dbg !490
  store i16 %85, i16* %tmp70, align 2, !dbg !490
  %86 = load i16, i16* %tmp70, align 2, !dbg !490
  %add71 = add i16 %86, 2, !dbg !486
  %87 = inttoptr i16 %add71 to i8*, !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !492, metadata !DIExpression()), !dbg !494
  %88 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !494, !srcloc !495
  store i16 %88, i16* %__x72, align 2, !dbg !494
  %89 = load i16, i16* %__x72, align 2, !dbg !494
  store i16 %89, i16* %tmp73, align 2, !dbg !494
  %90 = load i16, i16* %tmp73, align 2, !dbg !494
  %add74 = add i16 %90, 2, !dbg !486
  %sub75 = sub i16 9216, %add74, !dbg !486
  %call76 = call zeroext i16 @__fast_hw_crc(i8* %87, i16 zeroext %sub75, i16 zeroext -1), !dbg !486
  store i16 %call76, i16* @tmp_stack_crc, align 2, !dbg !486
  %91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %92 = bitcast %struct.camel_buffer_t* %91 to i8*, !dbg !486
  %93 = load i16, i16* @tmp_stack_crc, align 2, !dbg !486
  %call77 = call zeroext i16 @__fast_hw_crc(i8* %92, i16 zeroext 298, i16 zeroext %93), !dbg !486
  store i16 %call77, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %94 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %stack_and_buf_crc78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %95, i32 0, i32 2, !dbg !486
  store i16 %94, i16* %stack_and_buf_crc78, align 2, !dbg !486
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !486
  br label %if.end92, !dbg !486

if.else79:                                        ; preds = %do.body64
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !496
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !496
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !496
  %reg_file80 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %96, i32 0, i32 0, !dbg !496
  %arraydecay81 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file80, i16 0, i16 0, !dbg !496
  call void @__dump_registers(i16* %arraydecay81), !dbg !496
  call void @llvm.dbg.declare(metadata i16* %__x82, metadata !498, metadata !DIExpression()), !dbg !500
  %97 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !500, !srcloc !501
  store i16 %97, i16* %__x82, align 2, !dbg !500
  %98 = load i16, i16* %__x82, align 2, !dbg !500
  store i16 %98, i16* %tmp83, align 2, !dbg !500
  %99 = load i16, i16* %tmp83, align 2, !dbg !500
  %add84 = add i16 %99, 2, !dbg !496
  %100 = inttoptr i16 %add84 to i8*, !dbg !496
  call void @llvm.dbg.declare(metadata i16* %__x85, metadata !502, metadata !DIExpression()), !dbg !504
  %101 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !504, !srcloc !505
  store i16 %101, i16* %__x85, align 2, !dbg !504
  %102 = load i16, i16* %__x85, align 2, !dbg !504
  store i16 %102, i16* %tmp86, align 2, !dbg !504
  %103 = load i16, i16* %tmp86, align 2, !dbg !504
  %add87 = add i16 %103, 2, !dbg !496
  %sub88 = sub i16 9216, %add87, !dbg !496
  %call89 = call zeroext i16 @__fast_hw_crc(i8* %100, i16 zeroext %sub88, i16 zeroext -1), !dbg !496
  store i16 %call89, i16* @tmp_stack_crc, align 2, !dbg !496
  %104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !496
  %105 = bitcast %struct.camel_buffer_t* %104 to i8*, !dbg !496
  %106 = load i16, i16* @tmp_stack_crc, align 2, !dbg !496
  %call90 = call zeroext i16 @__fast_hw_crc(i8* %105, i16 zeroext 298, i16 zeroext %106), !dbg !496
  store i16 %call90, i16* @tmp_stack_buf_crc, align 2, !dbg !496
  %107 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !496
  %108 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !496
  %stack_and_buf_crc91 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %108, i32 0, i32 2, !dbg !496
  store i16 %107, i16* %stack_and_buf_crc91, align 2, !dbg !496
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !496
  br label %if.end92

if.end92:                                         ; preds = %if.else79, %if.then66
  br label %do.end93, !dbg !485

do.end93:                                         ; preds = %if.end92
  %109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !506
  %globals94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %109, i32 0, i32 1, !dbg !506
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals94, i32 0, i32 3, !dbg !506
  %110 = load i16, i16* %index1, align 2, !dbg !506
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !506
  %globals95 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 1, !dbg !506
  %index196 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals95, i32 0, i32 3, !dbg !506
  store i16 %110, i16* %index196, align 2, !dbg !506
  %112 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !507
  %globals97 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %112, i32 0, i32 1, !dbg !507
  %113 = bitcast %struct.camel_global_t* %globals97 to i8*, !dbg !507
  %114 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %globals98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %114, i32 0, i32 1, !dbg !507
  %115 = bitcast %struct.camel_global_t* %globals98 to i8*, !dbg !507
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %113, i8* align 2 %115, i16 276, i1 false), !dbg !507
  call void @task_calc_indexes_index_2(), !dbg !508
  br label %do.body99, !dbg !509

do.body99:                                        ; preds = %do.end93
  %116 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !510
  %cmp100 = icmp eq i16 %116, 1, !dbg !510
  br i1 %cmp100, label %if.then101, label %if.else114, !dbg !513

if.then101:                                       ; preds = %do.body99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !514
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !514
  %117 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %reg_file102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %117, i32 0, i32 0, !dbg !514
  %arraydecay103 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file102, i16 0, i16 0, !dbg !514
  call void @__dump_registers(i16* %arraydecay103), !dbg !514
  call void @llvm.dbg.declare(metadata i16* %__x104, metadata !516, metadata !DIExpression()), !dbg !518
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !518, !srcloc !519
  store i16 %118, i16* %__x104, align 2, !dbg !518
  %119 = load i16, i16* %__x104, align 2, !dbg !518
  store i16 %119, i16* %tmp105, align 2, !dbg !518
  %120 = load i16, i16* %tmp105, align 2, !dbg !518
  %add106 = add i16 %120, 2, !dbg !514
  %121 = inttoptr i16 %add106 to i8*, !dbg !514
  call void @llvm.dbg.declare(metadata i16* %__x107, metadata !520, metadata !DIExpression()), !dbg !522
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !522, !srcloc !523
  store i16 %122, i16* %__x107, align 2, !dbg !522
  %123 = load i16, i16* %__x107, align 2, !dbg !522
  store i16 %123, i16* %tmp108, align 2, !dbg !522
  %124 = load i16, i16* %tmp108, align 2, !dbg !522
  %add109 = add i16 %124, 2, !dbg !514
  %sub110 = sub i16 9216, %add109, !dbg !514
  %call111 = call zeroext i16 @__fast_hw_crc(i8* %121, i16 zeroext %sub110, i16 zeroext -1), !dbg !514
  store i16 %call111, i16* @tmp_stack_crc, align 2, !dbg !514
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %126 = bitcast %struct.camel_buffer_t* %125 to i8*, !dbg !514
  %127 = load i16, i16* @tmp_stack_crc, align 2, !dbg !514
  %call112 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext 298, i16 zeroext %127), !dbg !514
  store i16 %call112, i16* @tmp_stack_buf_crc, align 2, !dbg !514
  %128 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !514
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %stack_and_buf_crc113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %129, i32 0, i32 2, !dbg !514
  store i16 %128, i16* %stack_and_buf_crc113, align 2, !dbg !514
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !514
  br label %if.end127, !dbg !514

if.else114:                                       ; preds = %do.body99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !524
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !524
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %reg_file115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %130, i32 0, i32 0, !dbg !524
  %arraydecay116 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file115, i16 0, i16 0, !dbg !524
  call void @__dump_registers(i16* %arraydecay116), !dbg !524
  call void @llvm.dbg.declare(metadata i16* %__x117, metadata !526, metadata !DIExpression()), !dbg !528
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !528, !srcloc !529
  store i16 %131, i16* %__x117, align 2, !dbg !528
  %132 = load i16, i16* %__x117, align 2, !dbg !528
  store i16 %132, i16* %tmp118, align 2, !dbg !528
  %133 = load i16, i16* %tmp118, align 2, !dbg !528
  %add119 = add i16 %133, 2, !dbg !524
  %134 = inttoptr i16 %add119 to i8*, !dbg !524
  call void @llvm.dbg.declare(metadata i16* %__x120, metadata !530, metadata !DIExpression()), !dbg !532
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !532, !srcloc !533
  store i16 %135, i16* %__x120, align 2, !dbg !532
  %136 = load i16, i16* %__x120, align 2, !dbg !532
  store i16 %136, i16* %tmp121, align 2, !dbg !532
  %137 = load i16, i16* %tmp121, align 2, !dbg !532
  %add122 = add i16 %137, 2, !dbg !524
  %sub123 = sub i16 9216, %add122, !dbg !524
  %call124 = call zeroext i16 @__fast_hw_crc(i8* %134, i16 zeroext %sub123, i16 zeroext -1), !dbg !524
  store i16 %call124, i16* @tmp_stack_crc, align 2, !dbg !524
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %139 = bitcast %struct.camel_buffer_t* %138 to i8*, !dbg !524
  %140 = load i16, i16* @tmp_stack_crc, align 2, !dbg !524
  %call125 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext 298, i16 zeroext %140), !dbg !524
  store i16 %call125, i16* @tmp_stack_buf_crc, align 2, !dbg !524
  %141 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !524
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !524
  %stack_and_buf_crc126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %142, i32 0, i32 2, !dbg !524
  store i16 %141, i16* %stack_and_buf_crc126, align 2, !dbg !524
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !524
  br label %if.end127

if.end127:                                        ; preds = %if.else114, %if.then101
  br label %do.end128, !dbg !513

do.end128:                                        ; preds = %if.end127
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !534
  %globals129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %143, i32 0, i32 1, !dbg !534
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals129, i32 0, i32 4, !dbg !534
  %144 = load i16, i16* %index2, align 2, !dbg !534
  %145 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !534
  %globals130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %145, i32 0, i32 1, !dbg !534
  %index2131 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals130, i32 0, i32 4, !dbg !534
  store i16 %144, i16* %index2131, align 2, !dbg !534
  %146 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !535
  %globals132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %146, i32 0, i32 1, !dbg !535
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals132, i32 0, i32 6, !dbg !535
  %147 = load i16, i16* %insert_count, align 2, !dbg !535
  %cmp133 = icmp ult i16 %147, 32, !dbg !537
  br i1 %cmp133, label %if.then134, label %if.else291, !dbg !538

if.then134:                                       ; preds = %do.end128
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !539
  %globals135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 1, !dbg !539
  %149 = bitcast %struct.camel_global_t* %globals135 to i8*, !dbg !539
  %150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539
  %globals136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %150, i32 0, i32 1, !dbg !539
  %151 = bitcast %struct.camel_global_t* %globals136 to i8*, !dbg !539
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %149, i8* align 2 %151, i16 276, i1 false), !dbg !539
  call void @task_add(), !dbg !541
  br label %do.body137, !dbg !542

do.body137:                                       ; preds = %if.then134
  %152 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !543
  %cmp138 = icmp eq i16 %152, 1, !dbg !543
  br i1 %cmp138, label %if.then139, label %if.else152, !dbg !546

if.then139:                                       ; preds = %do.body137
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !547
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !547
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %reg_file140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 0, !dbg !547
  %arraydecay141 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file140, i16 0, i16 0, !dbg !547
  call void @__dump_registers(i16* %arraydecay141), !dbg !547
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !549, metadata !DIExpression()), !dbg !551
  %154 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !551, !srcloc !552
  store i16 %154, i16* %__x142, align 2, !dbg !551
  %155 = load i16, i16* %__x142, align 2, !dbg !551
  store i16 %155, i16* %tmp143, align 2, !dbg !551
  %156 = load i16, i16* %tmp143, align 2, !dbg !551
  %add144 = add i16 %156, 2, !dbg !547
  %157 = inttoptr i16 %add144 to i8*, !dbg !547
  call void @llvm.dbg.declare(metadata i16* %__x145, metadata !553, metadata !DIExpression()), !dbg !555
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !555, !srcloc !556
  store i16 %158, i16* %__x145, align 2, !dbg !555
  %159 = load i16, i16* %__x145, align 2, !dbg !555
  store i16 %159, i16* %tmp146, align 2, !dbg !555
  %160 = load i16, i16* %tmp146, align 2, !dbg !555
  %add147 = add i16 %160, 2, !dbg !547
  %sub148 = sub i16 9216, %add147, !dbg !547
  %call149 = call zeroext i16 @__fast_hw_crc(i8* %157, i16 zeroext %sub148, i16 zeroext -1), !dbg !547
  store i16 %call149, i16* @tmp_stack_crc, align 2, !dbg !547
  %161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %162 = bitcast %struct.camel_buffer_t* %161 to i8*, !dbg !547
  %163 = load i16, i16* @tmp_stack_crc, align 2, !dbg !547
  %call150 = call zeroext i16 @__fast_hw_crc(i8* %162, i16 zeroext 298, i16 zeroext %163), !dbg !547
  store i16 %call150, i16* @tmp_stack_buf_crc, align 2, !dbg !547
  %164 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !547
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %stack_and_buf_crc151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %165, i32 0, i32 2, !dbg !547
  store i16 %164, i16* %stack_and_buf_crc151, align 2, !dbg !547
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !547
  br label %if.end165, !dbg !547

if.else152:                                       ; preds = %do.body137
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !557
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !557
  %166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !557
  %reg_file153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %166, i32 0, i32 0, !dbg !557
  %arraydecay154 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file153, i16 0, i16 0, !dbg !557
  call void @__dump_registers(i16* %arraydecay154), !dbg !557
  call void @llvm.dbg.declare(metadata i16* %__x155, metadata !559, metadata !DIExpression()), !dbg !561
  %167 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !561, !srcloc !562
  store i16 %167, i16* %__x155, align 2, !dbg !561
  %168 = load i16, i16* %__x155, align 2, !dbg !561
  store i16 %168, i16* %tmp156, align 2, !dbg !561
  %169 = load i16, i16* %tmp156, align 2, !dbg !561
  %add157 = add i16 %169, 2, !dbg !557
  %170 = inttoptr i16 %add157 to i8*, !dbg !557
  call void @llvm.dbg.declare(metadata i16* %__x158, metadata !563, metadata !DIExpression()), !dbg !565
  %171 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !565, !srcloc !566
  store i16 %171, i16* %__x158, align 2, !dbg !565
  %172 = load i16, i16* %__x158, align 2, !dbg !565
  store i16 %172, i16* %tmp159, align 2, !dbg !565
  %173 = load i16, i16* %tmp159, align 2, !dbg !565
  %add160 = add i16 %173, 2, !dbg !557
  %sub161 = sub i16 9216, %add160, !dbg !557
  %call162 = call zeroext i16 @__fast_hw_crc(i8* %170, i16 zeroext %sub161, i16 zeroext -1), !dbg !557
  store i16 %call162, i16* @tmp_stack_crc, align 2, !dbg !557
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !557
  %175 = bitcast %struct.camel_buffer_t* %174 to i8*, !dbg !557
  %176 = load i16, i16* @tmp_stack_crc, align 2, !dbg !557
  %call163 = call zeroext i16 @__fast_hw_crc(i8* %175, i16 zeroext 298, i16 zeroext %176), !dbg !557
  store i16 %call163, i16* @tmp_stack_buf_crc, align 2, !dbg !557
  %177 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !557
  %178 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !557
  %stack_and_buf_crc164 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %178, i32 0, i32 2, !dbg !557
  store i16 %177, i16* %stack_and_buf_crc164, align 2, !dbg !557
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !557
  br label %if.end165

if.end165:                                        ; preds = %if.else152, %if.then139
  br label %do.end166, !dbg !546

do.end166:                                        ; preds = %if.end165
  %179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !567
  %globals167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %179, i32 0, i32 1, !dbg !567
  %fingerprint168 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals167, i32 0, i32 2, !dbg !567
  %180 = load i16, i16* %fingerprint168, align 2, !dbg !567
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !567
  %globals169 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %181, i32 0, i32 1, !dbg !567
  %fingerprint170 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals169, i32 0, i32 2, !dbg !567
  store i16 %180, i16* %fingerprint170, align 2, !dbg !567
  %182 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !568
  %globals171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %182, i32 0, i32 1, !dbg !568
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals171, i32 0, i32 0, !dbg !568
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !570
  %globals172 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %183, i32 0, i32 1, !dbg !570
  %index1173 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals172, i32 0, i32 3, !dbg !570
  %184 = load i16, i16* %index1173, align 2, !dbg !570
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %184, !dbg !568
  %185 = load i16, i16* %arrayidx, align 2, !dbg !568
  %tobool = icmp ne i16 %185, 0, !dbg !568
  br i1 %tobool, label %land.lhs.true, label %if.end246, !dbg !571

land.lhs.true:                                    ; preds = %do.end166
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !572
  %globals174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 1, !dbg !572
  %filter175 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals174, i32 0, i32 0, !dbg !572
  %187 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !573
  %globals176 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %187, i32 0, i32 1, !dbg !573
  %index2177 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals176, i32 0, i32 4, !dbg !573
  %188 = load i16, i16* %index2177, align 2, !dbg !573
  %arrayidx178 = getelementptr inbounds [128 x i16], [128 x i16]* %filter175, i16 0, i16 %188, !dbg !572
  %189 = load i16, i16* %arrayidx178, align 2, !dbg !572
  %tobool179 = icmp ne i16 %189, 0, !dbg !572
  br i1 %tobool179, label %if.then180, label %if.end246, !dbg !574

if.then180:                                       ; preds = %land.lhs.true
  br label %while.cond181, !dbg !575

while.cond181:                                    ; preds = %do.end222, %if.then180
  %190 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !577
  %globals182 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %190, i32 0, i32 1, !dbg !577
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals182, i32 0, i32 10, !dbg !577
  %191 = load i8, i8* %success, align 2, !dbg !577
  %tobool183 = trunc i8 %191 to i1, !dbg !577
  %conv = zext i1 %tobool183 to i16, !dbg !577
  %cmp184 = icmp eq i16 %conv, 0, !dbg !578
  br i1 %cmp184, label %land.rhs, label %land.end, !dbg !579

land.rhs:                                         ; preds = %while.cond181
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !580
  %globals186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %192, i32 0, i32 1, !dbg !580
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals186, i32 0, i32 5, !dbg !580
  %193 = load i16, i16* %relocation_count, align 2, !dbg !580
  %cmp187 = icmp ult i16 %193, 8, !dbg !581
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond181
  %194 = phi i1 [ false, %while.cond181 ], [ %cmp187, %land.rhs ], !dbg !582
  br i1 %194, label %while.body189, label %while.end, !dbg !575

while.body189:                                    ; preds = %land.end
  %195 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !583
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %195, i32 0, i32 1, !dbg !583
  %196 = bitcast %struct.camel_global_t* %globals190 to i8*, !dbg !583
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !583
  %globals191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %197, i32 0, i32 1, !dbg !583
  %198 = bitcast %struct.camel_global_t* %globals191 to i8*, !dbg !583
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %196, i8* align 2 %198, i16 276, i1 false), !dbg !583
  call void @task_relocate(), !dbg !585
  br label %do.body192, !dbg !586

do.body192:                                       ; preds = %while.body189
  %199 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !587
  %cmp193 = icmp eq i16 %199, 1, !dbg !587
  br i1 %cmp193, label %if.then195, label %if.else208, !dbg !590

if.then195:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !591
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !591
  %200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %reg_file196 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %200, i32 0, i32 0, !dbg !591
  %arraydecay197 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file196, i16 0, i16 0, !dbg !591
  call void @__dump_registers(i16* %arraydecay197), !dbg !591
  call void @llvm.dbg.declare(metadata i16* %__x198, metadata !593, metadata !DIExpression()), !dbg !595
  %201 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !595, !srcloc !596
  store i16 %201, i16* %__x198, align 2, !dbg !595
  %202 = load i16, i16* %__x198, align 2, !dbg !595
  store i16 %202, i16* %tmp199, align 2, !dbg !595
  %203 = load i16, i16* %tmp199, align 2, !dbg !595
  %add200 = add i16 %203, 2, !dbg !591
  %204 = inttoptr i16 %add200 to i8*, !dbg !591
  call void @llvm.dbg.declare(metadata i16* %__x201, metadata !597, metadata !DIExpression()), !dbg !599
  %205 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !599, !srcloc !600
  store i16 %205, i16* %__x201, align 2, !dbg !599
  %206 = load i16, i16* %__x201, align 2, !dbg !599
  store i16 %206, i16* %tmp202, align 2, !dbg !599
  %207 = load i16, i16* %tmp202, align 2, !dbg !599
  %add203 = add i16 %207, 2, !dbg !591
  %sub204 = sub i16 9216, %add203, !dbg !591
  %call205 = call zeroext i16 @__fast_hw_crc(i8* %204, i16 zeroext %sub204, i16 zeroext -1), !dbg !591
  store i16 %call205, i16* @tmp_stack_crc, align 2, !dbg !591
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %209 = bitcast %struct.camel_buffer_t* %208 to i8*, !dbg !591
  %210 = load i16, i16* @tmp_stack_crc, align 2, !dbg !591
  %call206 = call zeroext i16 @__fast_hw_crc(i8* %209, i16 zeroext 298, i16 zeroext %210), !dbg !591
  store i16 %call206, i16* @tmp_stack_buf_crc, align 2, !dbg !591
  %211 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !591
  %212 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %stack_and_buf_crc207 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %212, i32 0, i32 2, !dbg !591
  store i16 %211, i16* %stack_and_buf_crc207, align 2, !dbg !591
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !591
  br label %if.end221, !dbg !591

if.else208:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !601
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !601
  %213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !601
  %reg_file209 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %213, i32 0, i32 0, !dbg !601
  %arraydecay210 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file209, i16 0, i16 0, !dbg !601
  call void @__dump_registers(i16* %arraydecay210), !dbg !601
  call void @llvm.dbg.declare(metadata i16* %__x211, metadata !603, metadata !DIExpression()), !dbg !605
  %214 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !605, !srcloc !606
  store i16 %214, i16* %__x211, align 2, !dbg !605
  %215 = load i16, i16* %__x211, align 2, !dbg !605
  store i16 %215, i16* %tmp212, align 2, !dbg !605
  %216 = load i16, i16* %tmp212, align 2, !dbg !605
  %add213 = add i16 %216, 2, !dbg !601
  %217 = inttoptr i16 %add213 to i8*, !dbg !601
  call void @llvm.dbg.declare(metadata i16* %__x214, metadata !607, metadata !DIExpression()), !dbg !609
  %218 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !609, !srcloc !610
  store i16 %218, i16* %__x214, align 2, !dbg !609
  %219 = load i16, i16* %__x214, align 2, !dbg !609
  store i16 %219, i16* %tmp215, align 2, !dbg !609
  %220 = load i16, i16* %tmp215, align 2, !dbg !609
  %add216 = add i16 %220, 2, !dbg !601
  %sub217 = sub i16 9216, %add216, !dbg !601
  %call218 = call zeroext i16 @__fast_hw_crc(i8* %217, i16 zeroext %sub217, i16 zeroext -1), !dbg !601
  store i16 %call218, i16* @tmp_stack_crc, align 2, !dbg !601
  %221 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !601
  %222 = bitcast %struct.camel_buffer_t* %221 to i8*, !dbg !601
  %223 = load i16, i16* @tmp_stack_crc, align 2, !dbg !601
  %call219 = call zeroext i16 @__fast_hw_crc(i8* %222, i16 zeroext 298, i16 zeroext %223), !dbg !601
  store i16 %call219, i16* @tmp_stack_buf_crc, align 2, !dbg !601
  %224 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !601
  %225 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !601
  %stack_and_buf_crc220 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %225, i32 0, i32 2, !dbg !601
  store i16 %224, i16* %stack_and_buf_crc220, align 2, !dbg !601
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !601
  br label %if.end221

if.end221:                                        ; preds = %if.else208, %if.then195
  br label %do.end222, !dbg !590

do.end222:                                        ; preds = %if.end221
  %226 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %globals223 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %226, i32 0, i32 1, !dbg !611
  %success224 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals223, i32 0, i32 10, !dbg !611
  %227 = load i8, i8* %success224, align 2, !dbg !611
  %tobool225 = trunc i8 %227 to i1, !dbg !611
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %globals226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 1, !dbg !611
  %success227 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals226, i32 0, i32 10, !dbg !611
  %frombool = zext i1 %tobool225 to i8, !dbg !611
  store i8 %frombool, i8* %success227, align 2, !dbg !611
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %globals228 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %229, i32 0, i32 1, !dbg !611
  %relocation_count229 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals228, i32 0, i32 5, !dbg !611
  %230 = load i16, i16* %relocation_count229, align 2, !dbg !611
  %231 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %globals230 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %231, i32 0, i32 1, !dbg !611
  %relocation_count231 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals230, i32 0, i32 5, !dbg !611
  store i16 %230, i16* %relocation_count231, align 2, !dbg !611
  %232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %globals232 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %232, i32 0, i32 1, !dbg !611
  %index1233 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals232, i32 0, i32 3, !dbg !611
  %233 = load i16, i16* %index1233, align 2, !dbg !611
  %234 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %globals234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %234, i32 0, i32 1, !dbg !611
  %index1235 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals234, i32 0, i32 3, !dbg !611
  store i16 %233, i16* %index1235, align 2, !dbg !611
  %235 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %globals236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %235, i32 0, i32 1, !dbg !611
  %fingerprint237 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals236, i32 0, i32 2, !dbg !611
  %236 = load i16, i16* %fingerprint237, align 2, !dbg !611
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %globals238 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %237, i32 0, i32 1, !dbg !611
  %fingerprint239 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals238, i32 0, i32 2, !dbg !611
  store i16 %236, i16* %fingerprint239, align 2, !dbg !611
  %238 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !611
  %globals240 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %238, i32 0, i32 1, !dbg !611
  %filter241 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals240, i32 0, i32 0, !dbg !611
  %239 = load i16, i16* @writeOpt, align 2, !dbg !611
  %arrayidx242 = getelementptr inbounds [128 x i16], [128 x i16]* %filter241, i16 0, i16 %239, !dbg !611
  %240 = load i16, i16* %arrayidx242, align 2, !dbg !611
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !611
  %globals243 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %241, i32 0, i32 1, !dbg !611
  %filter244 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals243, i32 0, i32 0, !dbg !611
  %242 = load i16, i16* @writeOpt, align 2, !dbg !611
  %arrayidx245 = getelementptr inbounds [128 x i16], [128 x i16]* %filter244, i16 0, i16 %242, !dbg !611
  store i16 %240, i16* %arrayidx245, align 2, !dbg !611
  br label %while.cond181, !dbg !575, !llvm.loop !612

while.end:                                        ; preds = %land.end
  br label %if.end246, !dbg !614

if.end246:                                        ; preds = %while.end, %land.lhs.true, %do.end166
  %243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !615
  %globals247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %243, i32 0, i32 1, !dbg !615
  %244 = bitcast %struct.camel_global_t* %globals247 to i8*, !dbg !615
  %245 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %globals248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %245, i32 0, i32 1, !dbg !615
  %246 = bitcast %struct.camel_global_t* %globals248 to i8*, !dbg !615
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %244, i8* align 2 %246, i16 276, i1 false), !dbg !615
  call void @task_insert_done(), !dbg !616
  br label %do.body249, !dbg !617

do.body249:                                       ; preds = %if.end246
  %247 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !618
  %cmp250 = icmp eq i16 %247, 1, !dbg !618
  br i1 %cmp250, label %if.then252, label %if.else265, !dbg !621

if.then252:                                       ; preds = %do.body249
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !622
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !622
  %248 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !622
  %reg_file253 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %248, i32 0, i32 0, !dbg !622
  %arraydecay254 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file253, i16 0, i16 0, !dbg !622
  call void @__dump_registers(i16* %arraydecay254), !dbg !622
  call void @llvm.dbg.declare(metadata i16* %__x255, metadata !624, metadata !DIExpression()), !dbg !626
  %249 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !626, !srcloc !627
  store i16 %249, i16* %__x255, align 2, !dbg !626
  %250 = load i16, i16* %__x255, align 2, !dbg !626
  store i16 %250, i16* %tmp256, align 2, !dbg !626
  %251 = load i16, i16* %tmp256, align 2, !dbg !626
  %add257 = add i16 %251, 2, !dbg !622
  %252 = inttoptr i16 %add257 to i8*, !dbg !622
  call void @llvm.dbg.declare(metadata i16* %__x258, metadata !628, metadata !DIExpression()), !dbg !630
  %253 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !630, !srcloc !631
  store i16 %253, i16* %__x258, align 2, !dbg !630
  %254 = load i16, i16* %__x258, align 2, !dbg !630
  store i16 %254, i16* %tmp259, align 2, !dbg !630
  %255 = load i16, i16* %tmp259, align 2, !dbg !630
  %add260 = add i16 %255, 2, !dbg !622
  %sub261 = sub i16 9216, %add260, !dbg !622
  %call262 = call zeroext i16 @__fast_hw_crc(i8* %252, i16 zeroext %sub261, i16 zeroext -1), !dbg !622
  store i16 %call262, i16* @tmp_stack_crc, align 2, !dbg !622
  %256 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !622
  %257 = bitcast %struct.camel_buffer_t* %256 to i8*, !dbg !622
  %258 = load i16, i16* @tmp_stack_crc, align 2, !dbg !622
  %call263 = call zeroext i16 @__fast_hw_crc(i8* %257, i16 zeroext 298, i16 zeroext %258), !dbg !622
  store i16 %call263, i16* @tmp_stack_buf_crc, align 2, !dbg !622
  %259 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !622
  %260 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !622
  %stack_and_buf_crc264 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %260, i32 0, i32 2, !dbg !622
  store i16 %259, i16* %stack_and_buf_crc264, align 2, !dbg !622
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !622
  br label %if.end278, !dbg !622

if.else265:                                       ; preds = %do.body249
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !632
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !632
  %261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !632
  %reg_file266 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %261, i32 0, i32 0, !dbg !632
  %arraydecay267 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file266, i16 0, i16 0, !dbg !632
  call void @__dump_registers(i16* %arraydecay267), !dbg !632
  call void @llvm.dbg.declare(metadata i16* %__x268, metadata !634, metadata !DIExpression()), !dbg !636
  %262 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !636, !srcloc !637
  store i16 %262, i16* %__x268, align 2, !dbg !636
  %263 = load i16, i16* %__x268, align 2, !dbg !636
  store i16 %263, i16* %tmp269, align 2, !dbg !636
  %264 = load i16, i16* %tmp269, align 2, !dbg !636
  %add270 = add i16 %264, 2, !dbg !632
  %265 = inttoptr i16 %add270 to i8*, !dbg !632
  call void @llvm.dbg.declare(metadata i16* %__x271, metadata !638, metadata !DIExpression()), !dbg !640
  %266 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !640, !srcloc !641
  store i16 %266, i16* %__x271, align 2, !dbg !640
  %267 = load i16, i16* %__x271, align 2, !dbg !640
  store i16 %267, i16* %tmp272, align 2, !dbg !640
  %268 = load i16, i16* %tmp272, align 2, !dbg !640
  %add273 = add i16 %268, 2, !dbg !632
  %sub274 = sub i16 9216, %add273, !dbg !632
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext %sub274, i16 zeroext -1), !dbg !632
  store i16 %call275, i16* @tmp_stack_crc, align 2, !dbg !632
  %269 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !632
  %270 = bitcast %struct.camel_buffer_t* %269 to i8*, !dbg !632
  %271 = load i16, i16* @tmp_stack_crc, align 2, !dbg !632
  %call276 = call zeroext i16 @__fast_hw_crc(i8* %270, i16 zeroext 298, i16 zeroext %271), !dbg !632
  store i16 %call276, i16* @tmp_stack_buf_crc, align 2, !dbg !632
  %272 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !632
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !632
  %stack_and_buf_crc277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 2, !dbg !632
  store i16 %272, i16* %stack_and_buf_crc277, align 2, !dbg !632
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !632
  br label %if.end278

if.end278:                                        ; preds = %if.else265, %if.then252
  br label %do.end279, !dbg !621

do.end279:                                        ; preds = %if.end278
  %274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %globals280 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %274, i32 0, i32 1, !dbg !642
  %insert_count281 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals280, i32 0, i32 6, !dbg !642
  %275 = load i16, i16* %insert_count281, align 2, !dbg !642
  %276 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !642
  %globals282 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %276, i32 0, i32 1, !dbg !642
  %insert_count283 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals282, i32 0, i32 6, !dbg !642
  store i16 %275, i16* %insert_count283, align 2, !dbg !642
  %277 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %globals284 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %277, i32 0, i32 1, !dbg !642
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals284, i32 0, i32 7, !dbg !642
  %278 = load i16, i16* %inserted_count, align 2, !dbg !642
  %279 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !642
  %globals285 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %279, i32 0, i32 1, !dbg !642
  %inserted_count286 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals285, i32 0, i32 7, !dbg !642
  store i16 %278, i16* %inserted_count286, align 2, !dbg !642
  %280 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !642
  %globals287 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %280, i32 0, i32 1, !dbg !642
  %key288 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals287, i32 0, i32 1, !dbg !642
  %281 = load i16, i16* %key288, align 2, !dbg !642
  %282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !642
  %globals289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %282, i32 0, i32 1, !dbg !642
  %key290 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals289, i32 0, i32 1, !dbg !642
  store i16 %281, i16* %key290, align 2, !dbg !642
  br label %if.end370, !dbg !643

if.else291:                                       ; preds = %do.end128
  %283 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !644
  %globals292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %283, i32 0, i32 1, !dbg !644
  %284 = bitcast %struct.camel_global_t* %globals292 to i8*, !dbg !644
  %285 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !644
  %globals293 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %285, i32 0, i32 1, !dbg !644
  %286 = bitcast %struct.camel_global_t* %globals293 to i8*, !dbg !644
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %284, i8* align 2 %286, i16 276, i1 false), !dbg !644
  call void @task_lookup_search(), !dbg !646
  br label %do.body294, !dbg !647

do.body294:                                       ; preds = %if.else291
  %287 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !648
  %cmp295 = icmp eq i16 %287, 1, !dbg !648
  br i1 %cmp295, label %if.then297, label %if.else310, !dbg !651

if.then297:                                       ; preds = %do.body294
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !652
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !652
  %288 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %reg_file298 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %288, i32 0, i32 0, !dbg !652
  %arraydecay299 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file298, i16 0, i16 0, !dbg !652
  call void @__dump_registers(i16* %arraydecay299), !dbg !652
  call void @llvm.dbg.declare(metadata i16* %__x300, metadata !654, metadata !DIExpression()), !dbg !656
  %289 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !656, !srcloc !657
  store i16 %289, i16* %__x300, align 2, !dbg !656
  %290 = load i16, i16* %__x300, align 2, !dbg !656
  store i16 %290, i16* %tmp301, align 2, !dbg !656
  %291 = load i16, i16* %tmp301, align 2, !dbg !656
  %add302 = add i16 %291, 2, !dbg !652
  %292 = inttoptr i16 %add302 to i8*, !dbg !652
  call void @llvm.dbg.declare(metadata i16* %__x303, metadata !658, metadata !DIExpression()), !dbg !660
  %293 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !660, !srcloc !661
  store i16 %293, i16* %__x303, align 2, !dbg !660
  %294 = load i16, i16* %__x303, align 2, !dbg !660
  store i16 %294, i16* %tmp304, align 2, !dbg !660
  %295 = load i16, i16* %tmp304, align 2, !dbg !660
  %add305 = add i16 %295, 2, !dbg !652
  %sub306 = sub i16 9216, %add305, !dbg !652
  %call307 = call zeroext i16 @__fast_hw_crc(i8* %292, i16 zeroext %sub306, i16 zeroext -1), !dbg !652
  store i16 %call307, i16* @tmp_stack_crc, align 2, !dbg !652
  %296 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %297 = bitcast %struct.camel_buffer_t* %296 to i8*, !dbg !652
  %298 = load i16, i16* @tmp_stack_crc, align 2, !dbg !652
  %call308 = call zeroext i16 @__fast_hw_crc(i8* %297, i16 zeroext 298, i16 zeroext %298), !dbg !652
  store i16 %call308, i16* @tmp_stack_buf_crc, align 2, !dbg !652
  %299 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !652
  %300 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !652
  %stack_and_buf_crc309 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %300, i32 0, i32 2, !dbg !652
  store i16 %299, i16* %stack_and_buf_crc309, align 2, !dbg !652
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !652
  br label %if.end323, !dbg !652

if.else310:                                       ; preds = %do.body294
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !662
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !662
  %301 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !662
  %reg_file311 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %301, i32 0, i32 0, !dbg !662
  %arraydecay312 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file311, i16 0, i16 0, !dbg !662
  call void @__dump_registers(i16* %arraydecay312), !dbg !662
  call void @llvm.dbg.declare(metadata i16* %__x313, metadata !664, metadata !DIExpression()), !dbg !666
  %302 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !666, !srcloc !667
  store i16 %302, i16* %__x313, align 2, !dbg !666
  %303 = load i16, i16* %__x313, align 2, !dbg !666
  store i16 %303, i16* %tmp314, align 2, !dbg !666
  %304 = load i16, i16* %tmp314, align 2, !dbg !666
  %add315 = add i16 %304, 2, !dbg !662
  %305 = inttoptr i16 %add315 to i8*, !dbg !662
  call void @llvm.dbg.declare(metadata i16* %__x316, metadata !668, metadata !DIExpression()), !dbg !670
  %306 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !670, !srcloc !671
  store i16 %306, i16* %__x316, align 2, !dbg !670
  %307 = load i16, i16* %__x316, align 2, !dbg !670
  store i16 %307, i16* %tmp317, align 2, !dbg !670
  %308 = load i16, i16* %tmp317, align 2, !dbg !670
  %add318 = add i16 %308, 2, !dbg !662
  %sub319 = sub i16 9216, %add318, !dbg !662
  %call320 = call zeroext i16 @__fast_hw_crc(i8* %305, i16 zeroext %sub319, i16 zeroext -1), !dbg !662
  store i16 %call320, i16* @tmp_stack_crc, align 2, !dbg !662
  %309 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !662
  %310 = bitcast %struct.camel_buffer_t* %309 to i8*, !dbg !662
  %311 = load i16, i16* @tmp_stack_crc, align 2, !dbg !662
  %call321 = call zeroext i16 @__fast_hw_crc(i8* %310, i16 zeroext 298, i16 zeroext %311), !dbg !662
  store i16 %call321, i16* @tmp_stack_buf_crc, align 2, !dbg !662
  %312 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !662
  %313 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !662
  %stack_and_buf_crc322 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %313, i32 0, i32 2, !dbg !662
  store i16 %312, i16* %stack_and_buf_crc322, align 2, !dbg !662
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !662
  br label %if.end323

if.end323:                                        ; preds = %if.else310, %if.then297
  br label %do.end324, !dbg !651

do.end324:                                        ; preds = %if.end323
  %314 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %globals325 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %314, i32 0, i32 1, !dbg !672
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals325, i32 0, i32 11, !dbg !672
  %315 = load i8, i8* %member, align 1, !dbg !672
  %tobool326 = trunc i8 %315 to i1, !dbg !672
  %316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !672
  %globals327 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %316, i32 0, i32 1, !dbg !672
  %member328 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals327, i32 0, i32 11, !dbg !672
  %frombool329 = zext i1 %tobool326 to i8, !dbg !672
  store i8 %frombool329, i8* %member328, align 1, !dbg !672
  %317 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !673
  %globals330 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %317, i32 0, i32 1, !dbg !673
  %318 = bitcast %struct.camel_global_t* %globals330 to i8*, !dbg !673
  %319 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %globals331 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %319, i32 0, i32 1, !dbg !673
  %320 = bitcast %struct.camel_global_t* %globals331 to i8*, !dbg !673
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %318, i8* align 2 %320, i16 276, i1 false), !dbg !673
  call void @task_lookup_done(), !dbg !674
  br label %do.body332, !dbg !675

do.body332:                                       ; preds = %do.end324
  %321 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !676
  %cmp333 = icmp eq i16 %321, 1, !dbg !676
  br i1 %cmp333, label %if.then335, label %if.else348, !dbg !679

if.then335:                                       ; preds = %do.body332
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !680
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !680
  %322 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !680
  %reg_file336 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %322, i32 0, i32 0, !dbg !680
  %arraydecay337 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file336, i16 0, i16 0, !dbg !680
  call void @__dump_registers(i16* %arraydecay337), !dbg !680
  call void @llvm.dbg.declare(metadata i16* %__x338, metadata !682, metadata !DIExpression()), !dbg !684
  %323 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !684, !srcloc !685
  store i16 %323, i16* %__x338, align 2, !dbg !684
  %324 = load i16, i16* %__x338, align 2, !dbg !684
  store i16 %324, i16* %tmp339, align 2, !dbg !684
  %325 = load i16, i16* %tmp339, align 2, !dbg !684
  %add340 = add i16 %325, 2, !dbg !680
  %326 = inttoptr i16 %add340 to i8*, !dbg !680
  call void @llvm.dbg.declare(metadata i16* %__x341, metadata !686, metadata !DIExpression()), !dbg !688
  %327 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !688, !srcloc !689
  store i16 %327, i16* %__x341, align 2, !dbg !688
  %328 = load i16, i16* %__x341, align 2, !dbg !688
  store i16 %328, i16* %tmp342, align 2, !dbg !688
  %329 = load i16, i16* %tmp342, align 2, !dbg !688
  %add343 = add i16 %329, 2, !dbg !680
  %sub344 = sub i16 9216, %add343, !dbg !680
  %call345 = call zeroext i16 @__fast_hw_crc(i8* %326, i16 zeroext %sub344, i16 zeroext -1), !dbg !680
  store i16 %call345, i16* @tmp_stack_crc, align 2, !dbg !680
  %330 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !680
  %331 = bitcast %struct.camel_buffer_t* %330 to i8*, !dbg !680
  %332 = load i16, i16* @tmp_stack_crc, align 2, !dbg !680
  %call346 = call zeroext i16 @__fast_hw_crc(i8* %331, i16 zeroext 298, i16 zeroext %332), !dbg !680
  store i16 %call346, i16* @tmp_stack_buf_crc, align 2, !dbg !680
  %333 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !680
  %334 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !680
  %stack_and_buf_crc347 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %334, i32 0, i32 2, !dbg !680
  store i16 %333, i16* %stack_and_buf_crc347, align 2, !dbg !680
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !680
  br label %if.end361, !dbg !680

if.else348:                                       ; preds = %do.body332
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !690
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !690
  %335 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !690
  %reg_file349 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %335, i32 0, i32 0, !dbg !690
  %arraydecay350 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file349, i16 0, i16 0, !dbg !690
  call void @__dump_registers(i16* %arraydecay350), !dbg !690
  call void @llvm.dbg.declare(metadata i16* %__x351, metadata !692, metadata !DIExpression()), !dbg !694
  %336 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !694, !srcloc !695
  store i16 %336, i16* %__x351, align 2, !dbg !694
  %337 = load i16, i16* %__x351, align 2, !dbg !694
  store i16 %337, i16* %tmp352, align 2, !dbg !694
  %338 = load i16, i16* %tmp352, align 2, !dbg !694
  %add353 = add i16 %338, 2, !dbg !690
  %339 = inttoptr i16 %add353 to i8*, !dbg !690
  call void @llvm.dbg.declare(metadata i16* %__x354, metadata !696, metadata !DIExpression()), !dbg !698
  %340 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !698, !srcloc !699
  store i16 %340, i16* %__x354, align 2, !dbg !698
  %341 = load i16, i16* %__x354, align 2, !dbg !698
  store i16 %341, i16* %tmp355, align 2, !dbg !698
  %342 = load i16, i16* %tmp355, align 2, !dbg !698
  %add356 = add i16 %342, 2, !dbg !690
  %sub357 = sub i16 9216, %add356, !dbg !690
  %call358 = call zeroext i16 @__fast_hw_crc(i8* %339, i16 zeroext %sub357, i16 zeroext -1), !dbg !690
  store i16 %call358, i16* @tmp_stack_crc, align 2, !dbg !690
  %343 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !690
  %344 = bitcast %struct.camel_buffer_t* %343 to i8*, !dbg !690
  %345 = load i16, i16* @tmp_stack_crc, align 2, !dbg !690
  %call359 = call zeroext i16 @__fast_hw_crc(i8* %344, i16 zeroext 298, i16 zeroext %345), !dbg !690
  store i16 %call359, i16* @tmp_stack_buf_crc, align 2, !dbg !690
  %346 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !690
  %347 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !690
  %stack_and_buf_crc360 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %347, i32 0, i32 2, !dbg !690
  store i16 %346, i16* %stack_and_buf_crc360, align 2, !dbg !690
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !690
  br label %if.end361

if.end361:                                        ; preds = %if.else348, %if.then335
  br label %do.end362, !dbg !679

do.end362:                                        ; preds = %if.end361
  %348 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !700
  %globals363 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %348, i32 0, i32 1, !dbg !700
  %lookup_count364 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals363, i32 0, i32 8, !dbg !700
  %349 = load i16, i16* %lookup_count364, align 2, !dbg !700
  %350 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !700
  %globals365 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %350, i32 0, i32 1, !dbg !700
  %lookup_count366 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals365, i32 0, i32 8, !dbg !700
  store i16 %349, i16* %lookup_count366, align 2, !dbg !700
  %351 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !700
  %globals367 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %351, i32 0, i32 1, !dbg !700
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals367, i32 0, i32 9, !dbg !700
  %352 = load i16, i16* %member_count, align 2, !dbg !700
  %353 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !700
  %globals368 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %353, i32 0, i32 1, !dbg !700
  %member_count369 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals368, i32 0, i32 9, !dbg !700
  store i16 %352, i16* %member_count369, align 2, !dbg !700
  br label %if.end370

if.end370:                                        ; preds = %do.end362, %do.end279
  br label %while.cond, !dbg !419, !llvm.loop !701

while.end371:                                     ; preds = %while.cond
  call void @task_done(), !dbg !703
  %354 = load i16, i16* %retval, align 2, !dbg !704
  ret i16 %354, !dbg !704
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !705 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !708, metadata !DIExpression()), !dbg !709
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !710, metadata !DIExpression()), !dbg !711
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !712, metadata !DIExpression()), !dbg !713
  store i16 5381, i16* %hash, align 2, !dbg !713
  call void @llvm.dbg.declare(metadata i16* %i, metadata !714, metadata !DIExpression()), !dbg !715
  store i16 0, i16* %i, align 2, !dbg !716
  br label %for.cond, !dbg !718

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !719
  %1 = load i16, i16* %len.addr, align 2, !dbg !721
  %cmp = icmp ult i16 %0, %1, !dbg !722
  br i1 %cmp, label %for.body, label %for.end, !dbg !723

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !724
  %shl = shl i16 %2, 5, !dbg !725
  %3 = load i16, i16* %hash, align 2, !dbg !726
  %add = add i16 %shl, %3, !dbg !727
  %4 = load i8*, i8** %data.addr, align 2, !dbg !728
  %5 = load i8, i8* %4, align 1, !dbg !729
  %conv = zext i8 %5 to i16, !dbg !730
  %add1 = add i16 %add, %conv, !dbg !731
  store i16 %add1, i16* %hash, align 2, !dbg !732
  br label %for.inc, !dbg !733

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !734
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !734
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !734
  %7 = load i16, i16* %i, align 2, !dbg !735
  %inc = add i16 %7, 1, !dbg !735
  store i16 %inc, i16* %i, align 2, !dbg !735
  br label %for.cond, !dbg !736, !llvm.loop !737

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !739
  ret i16 %8, !dbg !740
}

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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 137, type: !71, isLocal: false, isDefinition: true)
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
!13 = !{!14, !21, !24, !29, !31, !0, !33, !66, !68}
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 219, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 420, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 610, type: !26, isLocal: true, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 51, type: !18, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 144, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 16)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 130, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 125, size: 2400, elements: !38)
!38 = !{!39, !44, !65}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !37, file: !3, line: 127, baseType: !40, size: 176)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 176, elements: !42)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 48, baseType: !18)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !37, file: !3, line: 128, baseType: !45, size: 2208, offset: 176)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 122, baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 108, size: 2208, elements: !47)
!47 = !{!48, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !46, file: !3, line: 110, baseType: !49, size: 2048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2048, elements: !51)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 19, baseType: !18)
!51 = !{!52}
!52 = !DISubrange(count: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !46, file: !3, line: 111, baseType: !17, size: 16, offset: 2048)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !46, file: !3, line: 112, baseType: !50, size: 16, offset: 2064)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !46, file: !3, line: 113, baseType: !17, size: 16, offset: 2080)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !46, file: !3, line: 114, baseType: !17, size: 16, offset: 2096)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !46, file: !3, line: 115, baseType: !17, size: 16, offset: 2112)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !46, file: !3, line: 116, baseType: !17, size: 16, offset: 2128)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !46, file: !3, line: 117, baseType: !17, size: 16, offset: 2144)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !46, file: !3, line: 118, baseType: !17, size: 16, offset: 2160)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !46, file: !3, line: 119, baseType: !17, size: 16, offset: 2176)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !46, file: !3, line: 120, baseType: !63, size: 8, offset: 2192)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !46, file: !3, line: 121, baseType: !63, size: 8, offset: 2200)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !37, file: !3, line: 129, baseType: !18, size: 16, offset: 2384)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 144, type: !35, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 173, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !42)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 132, size: 4816, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 134, baseType: !18, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 135, baseType: !36, size: 2400, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 136, baseType: !36, size: 2400, offset: 2416)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 146, type: !27, scopeLine: 146, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 147, column: 10, scope: !80)
!82 = !DILocation(line: 149, column: 9, scope: !80)
!83 = !DILocation(line: 151, column: 9, scope: !80)
!84 = !DILocation(line: 156, column: 11, scope: !80)
!85 = !DILocation(line: 161, column: 12, scope: !80)
!86 = !DILocation(line: 162, column: 10, scope: !80)
!87 = !DILocation(line: 163, column: 10, scope: !80)
!88 = !DILocation(line: 165, column: 10, scope: !80)
!89 = !DILocation(line: 166, column: 12, scope: !80)
!90 = !DILocation(line: 169, column: 10, scope: !80)
!91 = !DILocation(line: 171, column: 1, scope: !80)
!92 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 175, type: !27, scopeLine: 175, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 176, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !3, line: 176, column: 8)
!95 = !DILocation(line: 176, column: 19, scope: !94)
!96 = !DILocation(line: 176, column: 8, scope: !92)
!97 = !DILocation(line: 177, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 176, column: 34)
!99 = !DILocation(line: 178, column: 16, scope: !98)
!100 = !DILocation(line: 179, column: 5, scope: !98)
!101 = !DILocation(line: 179, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !3, line: 179, column: 15)
!103 = !DILocation(line: 179, column: 26, scope: !102)
!104 = !DILocation(line: 179, column: 15, scope: !94)
!105 = !DILocation(line: 180, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 179, column: 41)
!107 = !DILocation(line: 181, column: 16, scope: !106)
!108 = !DILocation(line: 182, column: 5, scope: !106)
!109 = !DILocation(line: 183, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !3, line: 182, column: 12)
!111 = !DILocation(line: 200, column: 3, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !3, line: 200, column: 3)
!113 = !{i32 -2146587813}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 202, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 202, column: 33)
!116 = !DILocation(line: 202, column: 33, scope: !115)
!117 = !{i32 -2146587577}
!118 = !DILocation(line: 202, column: 51, scope: !92)
!119 = !DILocation(line: 202, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 202, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 202, column: 65)
!122 = !DILocation(line: 202, column: 65, scope: !121)
!123 = !{i32 -2146587452}
!124 = !DILocation(line: 202, column: 83, scope: !92)
!125 = !DILocation(line: 202, column: 63, scope: !92)
!126 = !DILocation(line: 202, column: 19, scope: !92)
!127 = !DILocation(line: 202, column: 17, scope: !92)
!128 = !DILocation(line: 203, column: 37, scope: !92)
!129 = !DILocation(line: 203, column: 71, scope: !92)
!130 = !DILocation(line: 203, column: 23, scope: !92)
!131 = !DILocation(line: 203, column: 21, scope: !92)
!132 = !DILocation(line: 206, column: 6, scope: !133)
!133 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 6)
!134 = !DILocation(line: 206, column: 27, scope: !133)
!135 = !DILocation(line: 206, column: 33, scope: !133)
!136 = !DILocation(line: 206, column: 24, scope: !133)
!137 = !DILocation(line: 206, column: 6, scope: !92)
!138 = !DILocation(line: 207, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 206, column: 51)
!140 = !DILocation(line: 207, column: 4, scope: !139)
!141 = !DILocation(line: 207, column: 19, scope: !139)
!142 = !DILocation(line: 208, column: 4, scope: !139)
!143 = !DILocation(line: 209, column: 24, scope: !139)
!144 = !DILocation(line: 209, column: 30, scope: !139)
!145 = !DILocation(line: 209, column: 4, scope: !139)
!146 = !DILocation(line: 210, column: 3, scope: !139)
!147 = !DILocation(line: 211, column: 4, scope: !148)
!148 = distinct !DILexicalBlock(scope: !133, file: !3, line: 210, column: 9)
!149 = !DILocation(line: 214, column: 1, scope: !92)
!150 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 260, type: !27, scopeLine: 261, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "i", scope: !150, file: !3, line: 262, type: !6)
!152 = !DILocation(line: 262, column: 14, scope: !150)
!153 = !DILocation(line: 263, column: 12, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 263, column: 5)
!155 = !DILocation(line: 263, column: 10, scope: !154)
!156 = !DILocation(line: 263, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 263, column: 5)
!158 = !DILocation(line: 263, column: 19, scope: !157)
!159 = !DILocation(line: 263, column: 5, scope: !154)
!160 = !DILocation(line: 264, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 263, column: 40)
!162 = !DILocation(line: 264, column: 20, scope: !161)
!163 = !DILocation(line: 264, column: 23, scope: !161)
!164 = !DILocation(line: 266, column: 5, scope: !161)
!165 = !DILocation(line: 263, column: 35, scope: !157)
!166 = !DILocation(line: 263, column: 5, scope: !157)
!167 = distinct !{!167, !159, !168}
!168 = !DILocation(line: 266, column: 5, scope: !154)
!169 = !DILocation(line: 267, column: 5, scope: !150)
!170 = !DILocation(line: 267, column: 22, scope: !150)
!171 = !DILocation(line: 268, column: 5, scope: !150)
!172 = !DILocation(line: 268, column: 22, scope: !150)
!173 = !DILocation(line: 269, column: 5, scope: !150)
!174 = !DILocation(line: 269, column: 24, scope: !150)
!175 = !DILocation(line: 270, column: 5, scope: !150)
!176 = !DILocation(line: 270, column: 22, scope: !150)
!177 = !DILocation(line: 271, column: 5, scope: !150)
!178 = !DILocation(line: 271, column: 13, scope: !150)
!179 = !DILocation(line: 272, column: 1, scope: !150)
!180 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 290, type: !27, scopeLine: 291, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 293, column: 16, scope: !180)
!182 = !DILocation(line: 293, column: 24, scope: !180)
!183 = !DILocation(line: 293, column: 29, scope: !180)
!184 = !DILocation(line: 293, column: 5, scope: !180)
!185 = !DILocation(line: 293, column: 13, scope: !180)
!186 = !DILocation(line: 294, column: 1, scope: !180)
!187 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 312, type: !27, scopeLine: 313, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 314, column: 43, scope: !187)
!189 = !DILocation(line: 314, column: 23, scope: !187)
!190 = !DILocation(line: 314, column: 5, scope: !187)
!191 = !DILocation(line: 314, column: 21, scope: !187)
!192 = !DILocation(line: 315, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 239, type: !194, scopeLine: 240, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DISubroutineType(types: !195)
!195 = !{!50, !17}
!196 = !DILocalVariable(name: "key", arg: 1, scope: !193, file: !3, line: 239, type: !17)
!197 = !DILocation(line: 239, column: 50, scope: !193)
!198 = !DILocation(line: 241, column: 21, scope: !193)
!199 = !DILocation(line: 241, column: 12, scope: !193)
!200 = !DILocation(line: 241, column: 5, scope: !193)
!201 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 333, type: !27, scopeLine: 334, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 335, column: 32, scope: !201)
!203 = !DILocation(line: 335, column: 18, scope: !201)
!204 = !DILocation(line: 335, column: 5, scope: !201)
!205 = !DILocation(line: 335, column: 16, scope: !201)
!206 = !DILocation(line: 336, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 233, type: !208, scopeLine: 234, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!23, !50}
!210 = !DILocalVariable(name: "fp", arg: 1, scope: !207, file: !3, line: 233, type: !50)
!211 = !DILocation(line: 233, column: 44, scope: !207)
!212 = !DILocalVariable(name: "hash", scope: !207, file: !3, line: 235, type: !213)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!214 = !DILocation(line: 235, column: 12, scope: !207)
!215 = !DILocation(line: 235, column: 28, scope: !207)
!216 = !DILocation(line: 235, column: 19, scope: !207)
!217 = !DILocation(line: 236, column: 12, scope: !207)
!218 = !DILocation(line: 236, column: 17, scope: !207)
!219 = !DILocation(line: 236, column: 5, scope: !207)
!220 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 354, type: !27, scopeLine: 355, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DILocalVariable(name: "fp_hash", scope: !220, file: !3, line: 356, type: !23)
!222 = !DILocation(line: 356, column: 13, scope: !220)
!223 = !DILocation(line: 356, column: 37, scope: !220)
!224 = !DILocation(line: 356, column: 23, scope: !220)
!225 = !DILocation(line: 357, column: 18, scope: !220)
!226 = !DILocation(line: 357, column: 31, scope: !220)
!227 = !DILocation(line: 357, column: 29, scope: !220)
!228 = !DILocation(line: 357, column: 5, scope: !220)
!229 = !DILocation(line: 357, column: 16, scope: !220)
!230 = !DILocation(line: 358, column: 1, scope: !220)
!231 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 376, type: !27, scopeLine: 377, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!232 = !DILocation(line: 378, column: 10, scope: !233)
!233 = distinct !DILexicalBlock(scope: !231, file: !3, line: 378, column: 9)
!234 = !DILocation(line: 378, column: 21, scope: !233)
!235 = !DILocation(line: 378, column: 9, scope: !231)
!236 = !DILocation(line: 379, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 378, column: 34)
!238 = !DILocation(line: 379, column: 21, scope: !237)
!239 = !DILocation(line: 380, column: 34, scope: !237)
!240 = !DILocation(line: 380, column: 9, scope: !237)
!241 = !DILocation(line: 380, column: 20, scope: !237)
!242 = !DILocation(line: 380, column: 32, scope: !237)
!243 = !DILocation(line: 381, column: 5, scope: !237)
!244 = !DILocation(line: 382, column: 14, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !3, line: 382, column: 13)
!246 = distinct !DILexicalBlock(scope: !233, file: !3, line: 381, column: 12)
!247 = !DILocation(line: 382, column: 25, scope: !245)
!248 = !DILocation(line: 382, column: 13, scope: !246)
!249 = !DILocation(line: 383, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !3, line: 382, column: 38)
!251 = !DILocation(line: 383, column: 25, scope: !250)
!252 = !DILocation(line: 384, column: 38, scope: !250)
!253 = !DILocation(line: 384, column: 13, scope: !250)
!254 = !DILocation(line: 384, column: 24, scope: !250)
!255 = !DILocation(line: 384, column: 36, scope: !250)
!256 = !DILocation(line: 385, column: 9, scope: !250)
!257 = !DILocalVariable(name: "fp_victim", scope: !258, file: !3, line: 386, type: !50)
!258 = distinct !DILexicalBlock(scope: !245, file: !3, line: 385, column: 16)
!259 = !DILocation(line: 386, column: 27, scope: !258)
!260 = !DILocalVariable(name: "index_victim", scope: !258, file: !3, line: 387, type: !23)
!261 = !DILocation(line: 387, column: 21, scope: !258)
!262 = !DILocation(line: 388, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !3, line: 388, column: 17)
!264 = !DILocation(line: 388, column: 24, scope: !263)
!265 = !DILocation(line: 388, column: 17, scope: !258)
!266 = !DILocation(line: 389, column: 32, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !3, line: 388, column: 29)
!268 = !DILocation(line: 389, column: 30, scope: !267)
!269 = !DILocation(line: 390, column: 29, scope: !267)
!270 = !DILocation(line: 390, column: 40, scope: !267)
!271 = !DILocation(line: 390, column: 27, scope: !267)
!272 = !DILocation(line: 391, column: 13, scope: !267)
!273 = !DILocation(line: 392, column: 32, scope: !274)
!274 = distinct !DILexicalBlock(scope: !263, file: !3, line: 391, column: 20)
!275 = !DILocation(line: 392, column: 30, scope: !274)
!276 = !DILocation(line: 393, column: 29, scope: !274)
!277 = !DILocation(line: 393, column: 40, scope: !274)
!278 = !DILocation(line: 393, column: 27, scope: !274)
!279 = !DILocation(line: 397, column: 40, scope: !258)
!280 = !DILocation(line: 397, column: 13, scope: !258)
!281 = !DILocation(line: 397, column: 24, scope: !258)
!282 = !DILocation(line: 397, column: 38, scope: !258)
!283 = !DILocation(line: 398, column: 26, scope: !258)
!284 = !DILocation(line: 398, column: 13, scope: !258)
!285 = !DILocation(line: 398, column: 24, scope: !258)
!286 = !DILocation(line: 399, column: 31, scope: !258)
!287 = !DILocation(line: 399, column: 13, scope: !258)
!288 = !DILocation(line: 399, column: 29, scope: !258)
!289 = !DILocation(line: 400, column: 13, scope: !258)
!290 = !DILocation(line: 400, column: 34, scope: !258)
!291 = !DILocation(line: 403, column: 1, scope: !231)
!292 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 422, type: !27, scopeLine: 423, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DILocalVariable(name: "fp_victim", scope: !292, file: !3, line: 424, type: !50)
!294 = !DILocation(line: 424, column: 19, scope: !292)
!295 = !DILocation(line: 424, column: 31, scope: !292)
!296 = !DILocalVariable(name: "fp_hash_victim", scope: !292, file: !3, line: 425, type: !23)
!297 = !DILocation(line: 425, column: 13, scope: !292)
!298 = !DILocation(line: 425, column: 44, scope: !292)
!299 = !DILocation(line: 425, column: 30, scope: !292)
!300 = !DILocalVariable(name: "index2_victim", scope: !292, file: !3, line: 426, type: !23)
!301 = !DILocation(line: 426, column: 13, scope: !292)
!302 = !DILocation(line: 426, column: 29, scope: !292)
!303 = !DILocation(line: 426, column: 42, scope: !292)
!304 = !DILocation(line: 426, column: 40, scope: !292)
!305 = !DILocation(line: 428, column: 20, scope: !292)
!306 = !DILocation(line: 428, column: 18, scope: !292)
!307 = !DILocation(line: 429, column: 9, scope: !292)
!308 = !DILocation(line: 430, column: 14, scope: !309)
!309 = distinct !DILexicalBlock(scope: !292, file: !3, line: 430, column: 13)
!310 = !DILocation(line: 430, column: 25, scope: !309)
!311 = !DILocation(line: 430, column: 13, scope: !292)
!312 = !DILocation(line: 431, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !3, line: 430, column: 41)
!314 = !DILocation(line: 431, column: 25, scope: !313)
!315 = !DILocation(line: 432, column: 41, scope: !313)
!316 = !DILocation(line: 432, column: 13, scope: !313)
!317 = !DILocation(line: 432, column: 24, scope: !313)
!318 = !DILocation(line: 432, column: 39, scope: !313)
!319 = !DILocation(line: 433, column: 13, scope: !313)
!320 = !DILocation(line: 437, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !292, file: !3, line: 437, column: 13)
!322 = !DILocation(line: 437, column: 34, scope: !321)
!323 = !DILocation(line: 437, column: 13, scope: !292)
!324 = !DILocation(line: 438, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !3, line: 437, column: 54)
!326 = !DILocation(line: 438, column: 25, scope: !325)
!327 = !DILocation(line: 439, column: 13, scope: !325)
!328 = !DILocation(line: 442, column: 11, scope: !292)
!329 = !DILocation(line: 442, column: 9, scope: !292)
!330 = !DILocation(line: 443, column: 22, scope: !292)
!331 = !DILocation(line: 443, column: 9, scope: !292)
!332 = !DILocation(line: 443, column: 20, scope: !292)
!333 = !DILocation(line: 444, column: 27, scope: !292)
!334 = !DILocation(line: 444, column: 38, scope: !292)
!335 = !DILocation(line: 444, column: 9, scope: !292)
!336 = !DILocation(line: 444, column: 25, scope: !292)
!337 = !DILocation(line: 445, column: 37, scope: !292)
!338 = !DILocation(line: 445, column: 9, scope: !292)
!339 = !DILocation(line: 445, column: 20, scope: !292)
!340 = !DILocation(line: 445, column: 35, scope: !292)
!341 = !DILocation(line: 446, column: 1, scope: !292)
!342 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 464, type: !27, scopeLine: 465, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!343 = !DILocation(line: 466, column: 7, scope: !342)
!344 = !DILocation(line: 466, column: 5, scope: !342)
!345 = !DILocation(line: 467, column: 27, scope: !342)
!346 = !DILocation(line: 467, column: 5, scope: !342)
!347 = !DILocation(line: 467, column: 24, scope: !342)
!348 = !DILocation(line: 469, column: 9, scope: !349)
!349 = distinct !DILexicalBlock(scope: !342, file: !3, line: 469, column: 9)
!350 = !DILocation(line: 469, column: 26, scope: !349)
!351 = !DILocation(line: 469, column: 9, scope: !342)
!352 = !DILocation(line: 470, column: 5, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !3, line: 469, column: 41)
!354 = !DILocation(line: 471, column: 9, scope: !355)
!355 = distinct !DILexicalBlock(scope: !349, file: !3, line: 470, column: 12)
!356 = !DILocation(line: 471, column: 17, scope: !355)
!357 = !DILocation(line: 473, column: 1, scope: !342)
!358 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 491, type: !27, scopeLine: 492, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!359 = !DILocation(line: 493, column: 9, scope: !360)
!360 = distinct !DILexicalBlock(scope: !358, file: !3, line: 493, column: 9)
!361 = !DILocation(line: 493, column: 20, scope: !360)
!362 = !DILocation(line: 493, column: 35, scope: !360)
!363 = !DILocation(line: 493, column: 32, scope: !360)
!364 = !DILocation(line: 493, column: 9, scope: !358)
!365 = !DILocation(line: 494, column: 9, scope: !366)
!366 = distinct !DILexicalBlock(scope: !360, file: !3, line: 493, column: 52)
!367 = !DILocation(line: 494, column: 20, scope: !366)
!368 = !DILocation(line: 495, column: 5, scope: !366)
!369 = !DILocation(line: 496, column: 13, scope: !370)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 496, column: 13)
!371 = distinct !DILexicalBlock(scope: !360, file: !3, line: 495, column: 12)
!372 = !DILocation(line: 496, column: 24, scope: !370)
!373 = !DILocation(line: 496, column: 39, scope: !370)
!374 = !DILocation(line: 496, column: 36, scope: !370)
!375 = !DILocation(line: 496, column: 13, scope: !371)
!376 = !DILocation(line: 497, column: 13, scope: !377)
!377 = distinct !DILexicalBlock(scope: !370, file: !3, line: 496, column: 56)
!378 = !DILocation(line: 497, column: 24, scope: !377)
!379 = !DILocation(line: 498, column: 9, scope: !377)
!380 = !DILocation(line: 500, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !370, file: !3, line: 499, column: 14)
!382 = !DILocation(line: 500, column: 24, scope: !381)
!383 = !DILocation(line: 504, column: 10, scope: !384)
!384 = distinct !DILexicalBlock(scope: !358, file: !3, line: 504, column: 9)
!385 = !DILocation(line: 504, column: 9, scope: !358)
!386 = !DILocation(line: 505, column: 5, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !3, line: 504, column: 22)
!388 = !DILocation(line: 506, column: 1, scope: !358)
!389 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 524, type: !27, scopeLine: 525, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!390 = !DILocation(line: 526, column: 7, scope: !389)
!391 = !DILocation(line: 526, column: 5, scope: !389)
!392 = !DILocation(line: 528, column: 25, scope: !389)
!393 = !DILocation(line: 528, column: 5, scope: !389)
!394 = !DILocation(line: 528, column: 22, scope: !389)
!395 = !DILocation(line: 530, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !389, file: !3, line: 530, column: 9)
!397 = !DILocation(line: 530, column: 26, scope: !396)
!398 = !DILocation(line: 530, column: 9, scope: !389)
!399 = !DILocation(line: 531, column: 5, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !3, line: 530, column: 41)
!401 = !DILocation(line: 533, column: 1, scope: !389)
!402 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 535, type: !27, scopeLine: 536, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!403 = !DILocation(line: 537, column: 5, scope: !402)
!404 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 540, type: !405, scopeLine: 540, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!405 = !DISubroutineType(types: !406)
!406 = !{!407}
!407 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!408 = !DILocation(line: 541, column: 16, scope: !404)
!409 = !DILocation(line: 542, column: 10, scope: !404)
!410 = !DILocation(line: 543, column: 12, scope: !404)
!411 = !DILocation(line: 544, column: 5, scope: !404)
!412 = !DILocation(line: 546, column: 5, scope: !404)
!413 = !DILocation(line: 547, column: 5, scope: !404)
!414 = !DILocation(line: 548, column: 14, scope: !404)
!415 = !DILocation(line: 548, column: 20, scope: !404)
!416 = !DILocation(line: 548, column: 5, scope: !404)
!417 = !DILocation(line: 548, column: 32, scope: !404)
!418 = !DILocation(line: 548, column: 40, scope: !404)
!419 = !DILocation(line: 551, column: 3, scope: !404)
!420 = !DILocation(line: 551, column: 9, scope: !404)
!421 = !DILocation(line: 551, column: 26, scope: !404)
!422 = !DILocation(line: 552, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !404, file: !3, line: 551, column: 41)
!424 = !DILocation(line: 553, column: 9, scope: !423)
!425 = !DILocation(line: 554, column: 9, scope: !423)
!426 = !DILocation(line: 554, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !3, line: 554, column: 9)
!428 = distinct !DILexicalBlock(scope: !423, file: !3, line: 554, column: 9)
!429 = !DILocation(line: 554, column: 9, scope: !428)
!430 = !DILocation(line: 554, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !3, line: 554, column: 9)
!432 = !DILocalVariable(name: "__x", scope: !433, file: !3, line: 554, type: !6)
!433 = distinct !DILexicalBlock(scope: !431, file: !3, line: 554, column: 9)
!434 = !DILocation(line: 554, column: 9, scope: !433)
!435 = !{i32 -2146583094}
!436 = !DILocalVariable(name: "__x", scope: !437, file: !3, line: 554, type: !6)
!437 = distinct !DILexicalBlock(scope: !431, file: !3, line: 554, column: 9)
!438 = !DILocation(line: 554, column: 9, scope: !437)
!439 = !{i32 -2146582969}
!440 = !DILocation(line: 554, column: 9, scope: !441)
!441 = distinct !DILexicalBlock(scope: !427, file: !3, line: 554, column: 9)
!442 = !DILocalVariable(name: "__x", scope: !443, file: !3, line: 554, type: !6)
!443 = distinct !DILexicalBlock(scope: !441, file: !3, line: 554, column: 9)
!444 = !DILocation(line: 554, column: 9, scope: !443)
!445 = !{i32 -2146582837}
!446 = !DILocalVariable(name: "__x", scope: !447, file: !3, line: 554, type: !6)
!447 = distinct !DILexicalBlock(scope: !441, file: !3, line: 554, column: 9)
!448 = !DILocation(line: 554, column: 9, scope: !447)
!449 = !{i32 -2146582712}
!450 = !DILocation(line: 555, column: 9, scope: !423)
!451 = !DILocation(line: 557, column: 9, scope: !423)
!452 = !DILocation(line: 558, column: 9, scope: !423)
!453 = !DILocation(line: 559, column: 9, scope: !423)
!454 = !DILocation(line: 559, column: 9, scope: !455)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 559, column: 9)
!456 = distinct !DILexicalBlock(scope: !423, file: !3, line: 559, column: 9)
!457 = !DILocation(line: 559, column: 9, scope: !456)
!458 = !DILocation(line: 559, column: 9, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !3, line: 559, column: 9)
!460 = !DILocalVariable(name: "__x", scope: !461, file: !3, line: 559, type: !6)
!461 = distinct !DILexicalBlock(scope: !459, file: !3, line: 559, column: 9)
!462 = !DILocation(line: 559, column: 9, scope: !461)
!463 = !{i32 -2146580466}
!464 = !DILocalVariable(name: "__x", scope: !465, file: !3, line: 559, type: !6)
!465 = distinct !DILexicalBlock(scope: !459, file: !3, line: 559, column: 9)
!466 = !DILocation(line: 559, column: 9, scope: !465)
!467 = !{i32 -2146580341}
!468 = !DILocation(line: 559, column: 9, scope: !469)
!469 = distinct !DILexicalBlock(scope: !455, file: !3, line: 559, column: 9)
!470 = !DILocalVariable(name: "__x", scope: !471, file: !3, line: 559, type: !6)
!471 = distinct !DILexicalBlock(scope: !469, file: !3, line: 559, column: 9)
!472 = !DILocation(line: 559, column: 9, scope: !471)
!473 = !{i32 -2146580209}
!474 = !DILocalVariable(name: "__x", scope: !475, file: !3, line: 559, type: !6)
!475 = distinct !DILexicalBlock(scope: !469, file: !3, line: 559, column: 9)
!476 = !DILocation(line: 559, column: 9, scope: !475)
!477 = !{i32 -2146580084}
!478 = !DILocation(line: 560, column: 9, scope: !423)
!479 = !DILocation(line: 562, column: 9, scope: !423)
!480 = !DILocation(line: 563, column: 9, scope: !423)
!481 = !DILocation(line: 564, column: 9, scope: !423)
!482 = !DILocation(line: 564, column: 9, scope: !483)
!483 = distinct !DILexicalBlock(scope: !484, file: !3, line: 564, column: 9)
!484 = distinct !DILexicalBlock(scope: !423, file: !3, line: 564, column: 9)
!485 = !DILocation(line: 564, column: 9, scope: !484)
!486 = !DILocation(line: 564, column: 9, scope: !487)
!487 = distinct !DILexicalBlock(scope: !483, file: !3, line: 564, column: 9)
!488 = !DILocalVariable(name: "__x", scope: !489, file: !3, line: 564, type: !6)
!489 = distinct !DILexicalBlock(scope: !487, file: !3, line: 564, column: 9)
!490 = !DILocation(line: 564, column: 9, scope: !489)
!491 = !{i32 -2146577814}
!492 = !DILocalVariable(name: "__x", scope: !493, file: !3, line: 564, type: !6)
!493 = distinct !DILexicalBlock(scope: !487, file: !3, line: 564, column: 9)
!494 = !DILocation(line: 564, column: 9, scope: !493)
!495 = !{i32 -2146577689}
!496 = !DILocation(line: 564, column: 9, scope: !497)
!497 = distinct !DILexicalBlock(scope: !483, file: !3, line: 564, column: 9)
!498 = !DILocalVariable(name: "__x", scope: !499, file: !3, line: 564, type: !6)
!499 = distinct !DILexicalBlock(scope: !497, file: !3, line: 564, column: 9)
!500 = !DILocation(line: 564, column: 9, scope: !499)
!501 = !{i32 -2146577557}
!502 = !DILocalVariable(name: "__x", scope: !503, file: !3, line: 564, type: !6)
!503 = distinct !DILexicalBlock(scope: !497, file: !3, line: 564, column: 9)
!504 = !DILocation(line: 564, column: 9, scope: !503)
!505 = !{i32 -2146577432}
!506 = !DILocation(line: 565, column: 9, scope: !423)
!507 = !DILocation(line: 567, column: 9, scope: !423)
!508 = !DILocation(line: 568, column: 9, scope: !423)
!509 = !DILocation(line: 569, column: 9, scope: !423)
!510 = !DILocation(line: 569, column: 9, scope: !511)
!511 = distinct !DILexicalBlock(scope: !512, file: !3, line: 569, column: 9)
!512 = distinct !DILexicalBlock(scope: !423, file: !3, line: 569, column: 9)
!513 = !DILocation(line: 569, column: 9, scope: !512)
!514 = !DILocation(line: 569, column: 9, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !3, line: 569, column: 9)
!516 = !DILocalVariable(name: "__x", scope: !517, file: !3, line: 569, type: !6)
!517 = distinct !DILexicalBlock(scope: !515, file: !3, line: 569, column: 9)
!518 = !DILocation(line: 569, column: 9, scope: !517)
!519 = !{i32 -2146575177}
!520 = !DILocalVariable(name: "__x", scope: !521, file: !3, line: 569, type: !6)
!521 = distinct !DILexicalBlock(scope: !515, file: !3, line: 569, column: 9)
!522 = !DILocation(line: 569, column: 9, scope: !521)
!523 = !{i32 -2146575052}
!524 = !DILocation(line: 569, column: 9, scope: !525)
!525 = distinct !DILexicalBlock(scope: !511, file: !3, line: 569, column: 9)
!526 = !DILocalVariable(name: "__x", scope: !527, file: !3, line: 569, type: !6)
!527 = distinct !DILexicalBlock(scope: !525, file: !3, line: 569, column: 9)
!528 = !DILocation(line: 569, column: 9, scope: !527)
!529 = !{i32 -2146574920}
!530 = !DILocalVariable(name: "__x", scope: !531, file: !3, line: 569, type: !6)
!531 = distinct !DILexicalBlock(scope: !525, file: !3, line: 569, column: 9)
!532 = !DILocation(line: 569, column: 9, scope: !531)
!533 = !{i32 -2146574795}
!534 = !DILocation(line: 570, column: 9, scope: !423)
!535 = !DILocation(line: 572, column: 12, scope: !536)
!536 = distinct !DILexicalBlock(scope: !423, file: !3, line: 572, column: 12)
!537 = !DILocation(line: 572, column: 29, scope: !536)
!538 = !DILocation(line: 572, column: 12, scope: !423)
!539 = !DILocation(line: 573, column: 13, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !3, line: 572, column: 44)
!541 = !DILocation(line: 574, column: 13, scope: !540)
!542 = !DILocation(line: 575, column: 13, scope: !540)
!543 = !DILocation(line: 575, column: 13, scope: !544)
!544 = distinct !DILexicalBlock(scope: !545, file: !3, line: 575, column: 13)
!545 = distinct !DILexicalBlock(scope: !540, file: !3, line: 575, column: 13)
!546 = !DILocation(line: 575, column: 13, scope: !545)
!547 = !DILocation(line: 575, column: 13, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !3, line: 575, column: 13)
!549 = !DILocalVariable(name: "__x", scope: !550, file: !3, line: 575, type: !6)
!550 = distinct !DILexicalBlock(scope: !548, file: !3, line: 575, column: 13)
!551 = !DILocation(line: 575, column: 13, scope: !550)
!552 = !{i32 -2146572487}
!553 = !DILocalVariable(name: "__x", scope: !554, file: !3, line: 575, type: !6)
!554 = distinct !DILexicalBlock(scope: !548, file: !3, line: 575, column: 13)
!555 = !DILocation(line: 575, column: 13, scope: !554)
!556 = !{i32 -2146572362}
!557 = !DILocation(line: 575, column: 13, scope: !558)
!558 = distinct !DILexicalBlock(scope: !544, file: !3, line: 575, column: 13)
!559 = !DILocalVariable(name: "__x", scope: !560, file: !3, line: 575, type: !6)
!560 = distinct !DILexicalBlock(scope: !558, file: !3, line: 575, column: 13)
!561 = !DILocation(line: 575, column: 13, scope: !560)
!562 = !{i32 -2146572230}
!563 = !DILocalVariable(name: "__x", scope: !564, file: !3, line: 575, type: !6)
!564 = distinct !DILexicalBlock(scope: !558, file: !3, line: 575, column: 13)
!565 = !DILocation(line: 575, column: 13, scope: !564)
!566 = !{i32 -2146572105}
!567 = !DILocation(line: 576, column: 13, scope: !540)
!568 = !DILocation(line: 578, column: 16, scope: !569)
!569 = distinct !DILexicalBlock(scope: !540, file: !3, line: 578, column: 16)
!570 = !DILocation(line: 578, column: 27, scope: !569)
!571 = !DILocation(line: 578, column: 39, scope: !569)
!572 = !DILocation(line: 578, column: 42, scope: !569)
!573 = !DILocation(line: 578, column: 53, scope: !569)
!574 = !DILocation(line: 578, column: 16, scope: !540)
!575 = !DILocation(line: 579, column: 17, scope: !576)
!576 = distinct !DILexicalBlock(scope: !569, file: !3, line: 578, column: 66)
!577 = !DILocation(line: 579, column: 23, scope: !576)
!578 = !DILocation(line: 579, column: 35, scope: !576)
!579 = !DILocation(line: 579, column: 44, scope: !576)
!580 = !DILocation(line: 579, column: 48, scope: !576)
!581 = !DILocation(line: 579, column: 69, scope: !576)
!582 = !DILocation(line: 0, scope: !576)
!583 = !DILocation(line: 580, column: 21, scope: !584)
!584 = distinct !DILexicalBlock(scope: !576, file: !3, line: 579, column: 89)
!585 = !DILocation(line: 581, column: 21, scope: !584)
!586 = !DILocation(line: 582, column: 21, scope: !584)
!587 = !DILocation(line: 582, column: 21, scope: !588)
!588 = distinct !DILexicalBlock(scope: !589, file: !3, line: 582, column: 21)
!589 = distinct !DILexicalBlock(scope: !584, file: !3, line: 582, column: 21)
!590 = !DILocation(line: 582, column: 21, scope: !589)
!591 = !DILocation(line: 582, column: 21, scope: !592)
!592 = distinct !DILexicalBlock(scope: !588, file: !3, line: 582, column: 21)
!593 = !DILocalVariable(name: "__x", scope: !594, file: !3, line: 582, type: !6)
!594 = distinct !DILexicalBlock(scope: !592, file: !3, line: 582, column: 21)
!595 = !DILocation(line: 582, column: 21, scope: !594)
!596 = !{i32 -2146569670}
!597 = !DILocalVariable(name: "__x", scope: !598, file: !3, line: 582, type: !6)
!598 = distinct !DILexicalBlock(scope: !592, file: !3, line: 582, column: 21)
!599 = !DILocation(line: 582, column: 21, scope: !598)
!600 = !{i32 -2146569545}
!601 = !DILocation(line: 582, column: 21, scope: !602)
!602 = distinct !DILexicalBlock(scope: !588, file: !3, line: 582, column: 21)
!603 = !DILocalVariable(name: "__x", scope: !604, file: !3, line: 582, type: !6)
!604 = distinct !DILexicalBlock(scope: !602, file: !3, line: 582, column: 21)
!605 = !DILocation(line: 582, column: 21, scope: !604)
!606 = !{i32 -2146569413}
!607 = !DILocalVariable(name: "__x", scope: !608, file: !3, line: 582, type: !6)
!608 = distinct !DILexicalBlock(scope: !602, file: !3, line: 582, column: 21)
!609 = !DILocation(line: 582, column: 21, scope: !608)
!610 = !{i32 -2146569288}
!611 = !DILocation(line: 583, column: 21, scope: !584)
!612 = distinct !{!612, !575, !613}
!613 = !DILocation(line: 584, column: 17, scope: !576)
!614 = !DILocation(line: 585, column: 13, scope: !576)
!615 = !DILocation(line: 587, column: 13, scope: !540)
!616 = !DILocation(line: 588, column: 13, scope: !540)
!617 = !DILocation(line: 589, column: 13, scope: !540)
!618 = !DILocation(line: 589, column: 13, scope: !619)
!619 = distinct !DILexicalBlock(scope: !620, file: !3, line: 589, column: 13)
!620 = distinct !DILexicalBlock(scope: !540, file: !3, line: 589, column: 13)
!621 = !DILocation(line: 589, column: 13, scope: !620)
!622 = !DILocation(line: 589, column: 13, scope: !623)
!623 = distinct !DILexicalBlock(scope: !619, file: !3, line: 589, column: 13)
!624 = !DILocalVariable(name: "__x", scope: !625, file: !3, line: 589, type: !6)
!625 = distinct !DILexicalBlock(scope: !623, file: !3, line: 589, column: 13)
!626 = !DILocation(line: 589, column: 13, scope: !625)
!627 = !{i32 -2146566698}
!628 = !DILocalVariable(name: "__x", scope: !629, file: !3, line: 589, type: !6)
!629 = distinct !DILexicalBlock(scope: !623, file: !3, line: 589, column: 13)
!630 = !DILocation(line: 589, column: 13, scope: !629)
!631 = !{i32 -2146566573}
!632 = !DILocation(line: 589, column: 13, scope: !633)
!633 = distinct !DILexicalBlock(scope: !619, file: !3, line: 589, column: 13)
!634 = !DILocalVariable(name: "__x", scope: !635, file: !3, line: 589, type: !6)
!635 = distinct !DILexicalBlock(scope: !633, file: !3, line: 589, column: 13)
!636 = !DILocation(line: 589, column: 13, scope: !635)
!637 = !{i32 -2146566441}
!638 = !DILocalVariable(name: "__x", scope: !639, file: !3, line: 589, type: !6)
!639 = distinct !DILexicalBlock(scope: !633, file: !3, line: 589, column: 13)
!640 = !DILocation(line: 589, column: 13, scope: !639)
!641 = !{i32 -2146566316}
!642 = !DILocation(line: 590, column: 13, scope: !540)
!643 = !DILocation(line: 591, column: 9, scope: !540)
!644 = !DILocation(line: 592, column: 13, scope: !645)
!645 = distinct !DILexicalBlock(scope: !536, file: !3, line: 591, column: 16)
!646 = !DILocation(line: 593, column: 13, scope: !645)
!647 = !DILocation(line: 594, column: 13, scope: !645)
!648 = !DILocation(line: 594, column: 13, scope: !649)
!649 = distinct !DILexicalBlock(scope: !650, file: !3, line: 594, column: 13)
!650 = distinct !DILexicalBlock(scope: !645, file: !3, line: 594, column: 13)
!651 = !DILocation(line: 594, column: 13, scope: !650)
!652 = !DILocation(line: 594, column: 13, scope: !653)
!653 = distinct !DILexicalBlock(scope: !649, file: !3, line: 594, column: 13)
!654 = !DILocalVariable(name: "__x", scope: !655, file: !3, line: 594, type: !6)
!655 = distinct !DILexicalBlock(scope: !653, file: !3, line: 594, column: 13)
!656 = !DILocation(line: 594, column: 13, scope: !655)
!657 = !{i32 -2146563902}
!658 = !DILocalVariable(name: "__x", scope: !659, file: !3, line: 594, type: !6)
!659 = distinct !DILexicalBlock(scope: !653, file: !3, line: 594, column: 13)
!660 = !DILocation(line: 594, column: 13, scope: !659)
!661 = !{i32 -2146563777}
!662 = !DILocation(line: 594, column: 13, scope: !663)
!663 = distinct !DILexicalBlock(scope: !649, file: !3, line: 594, column: 13)
!664 = !DILocalVariable(name: "__x", scope: !665, file: !3, line: 594, type: !6)
!665 = distinct !DILexicalBlock(scope: !663, file: !3, line: 594, column: 13)
!666 = !DILocation(line: 594, column: 13, scope: !665)
!667 = !{i32 -2146563645}
!668 = !DILocalVariable(name: "__x", scope: !669, file: !3, line: 594, type: !6)
!669 = distinct !DILexicalBlock(scope: !663, file: !3, line: 594, column: 13)
!670 = !DILocation(line: 594, column: 13, scope: !669)
!671 = !{i32 -2146563520}
!672 = !DILocation(line: 595, column: 13, scope: !645)
!673 = !DILocation(line: 597, column: 13, scope: !645)
!674 = !DILocation(line: 598, column: 13, scope: !645)
!675 = !DILocation(line: 599, column: 13, scope: !645)
!676 = !DILocation(line: 599, column: 13, scope: !677)
!677 = distinct !DILexicalBlock(scope: !678, file: !3, line: 599, column: 13)
!678 = distinct !DILexicalBlock(scope: !645, file: !3, line: 599, column: 13)
!679 = !DILocation(line: 599, column: 13, scope: !678)
!680 = !DILocation(line: 599, column: 13, scope: !681)
!681 = distinct !DILexicalBlock(scope: !677, file: !3, line: 599, column: 13)
!682 = !DILocalVariable(name: "__x", scope: !683, file: !3, line: 599, type: !6)
!683 = distinct !DILexicalBlock(scope: !681, file: !3, line: 599, column: 13)
!684 = !DILocation(line: 599, column: 13, scope: !683)
!685 = !{i32 -2146561265}
!686 = !DILocalVariable(name: "__x", scope: !687, file: !3, line: 599, type: !6)
!687 = distinct !DILexicalBlock(scope: !681, file: !3, line: 599, column: 13)
!688 = !DILocation(line: 599, column: 13, scope: !687)
!689 = !{i32 -2146561140}
!690 = !DILocation(line: 599, column: 13, scope: !691)
!691 = distinct !DILexicalBlock(scope: !677, file: !3, line: 599, column: 13)
!692 = !DILocalVariable(name: "__x", scope: !693, file: !3, line: 599, type: !6)
!693 = distinct !DILexicalBlock(scope: !691, file: !3, line: 599, column: 13)
!694 = !DILocation(line: 599, column: 13, scope: !693)
!695 = !{i32 -2146561008}
!696 = !DILocalVariable(name: "__x", scope: !697, file: !3, line: 599, type: !6)
!697 = distinct !DILexicalBlock(scope: !691, file: !3, line: 599, column: 13)
!698 = !DILocation(line: 599, column: 13, scope: !697)
!699 = !{i32 -2146560883}
!700 = !DILocation(line: 600, column: 13, scope: !645)
!701 = distinct !{!701, !419, !702}
!702 = !DILocation(line: 602, column: 5, scope: !404)
!703 = !DILocation(line: 604, column: 5, scope: !404)
!704 = !DILocation(line: 605, column: 1, scope: !404)
!705 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 221, type: !706, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!706 = !DISubroutineType(types: !707)
!707 = !{!213, !7, !6}
!708 = !DILocalVariable(name: "data", arg: 1, scope: !705, file: !3, line: 221, type: !7)
!709 = !DILocation(line: 221, column: 33, scope: !705)
!710 = !DILocalVariable(name: "len", arg: 2, scope: !705, file: !3, line: 221, type: !6)
!711 = !DILocation(line: 221, column: 48, scope: !705)
!712 = !DILocalVariable(name: "hash", scope: !705, file: !3, line: 223, type: !18)
!713 = !DILocation(line: 223, column: 14, scope: !705)
!714 = !DILocalVariable(name: "i", scope: !705, file: !3, line: 224, type: !6)
!715 = !DILocation(line: 224, column: 18, scope: !705)
!716 = !DILocation(line: 226, column: 11, scope: !717)
!717 = distinct !DILexicalBlock(scope: !705, file: !3, line: 226, column: 5)
!718 = !DILocation(line: 226, column: 9, scope: !717)
!719 = !DILocation(line: 226, column: 16, scope: !720)
!720 = distinct !DILexicalBlock(scope: !717, file: !3, line: 226, column: 5)
!721 = !DILocation(line: 226, column: 20, scope: !720)
!722 = !DILocation(line: 226, column: 18, scope: !720)
!723 = !DILocation(line: 226, column: 5, scope: !717)
!724 = !DILocation(line: 227, column: 18, scope: !720)
!725 = !DILocation(line: 227, column: 23, scope: !720)
!726 = !DILocation(line: 227, column: 31, scope: !720)
!727 = !DILocation(line: 227, column: 29, scope: !720)
!728 = !DILocation(line: 227, column: 41, scope: !720)
!729 = !DILocation(line: 227, column: 40, scope: !720)
!730 = !DILocation(line: 227, column: 39, scope: !720)
!731 = !DILocation(line: 227, column: 37, scope: !720)
!732 = !DILocation(line: 227, column: 14, scope: !720)
!733 = !DILocation(line: 227, column: 9, scope: !720)
!734 = !DILocation(line: 226, column: 29, scope: !720)
!735 = !DILocation(line: 226, column: 34, scope: !720)
!736 = !DILocation(line: 226, column: 5, scope: !720)
!737 = distinct !{!737, !723, !738}
!738 = !DILocation(line: 227, column: 45, scope: !717)
!739 = !DILocation(line: 230, column: 12, scope: !705)
!740 = !DILocation(line: 230, column: 5, scope: !705)
