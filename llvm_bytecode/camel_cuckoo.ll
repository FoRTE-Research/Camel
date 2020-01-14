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
  %__x9 = alloca i16, align 2
  %tmp10 = alloca i16, align 2
  %__x15 = alloca i16, align 2
  %tmp16 = alloca i16, align 2
  %__x18 = alloca i16, align 2
  %tmp19 = alloca i16, align 2
  %__x30 = alloca i16, align 2
  %tmp31 = alloca i16, align 2
  %__x33 = alloca i16, align 2
  %tmp34 = alloca i16, align 2
  %__x43 = alloca i16, align 2
  %tmp44 = alloca i16, align 2
  %__x46 = alloca i16, align 2
  %tmp47 = alloca i16, align 2
  %__x60 = alloca i16, align 2
  %tmp61 = alloca i16, align 2
  %__x63 = alloca i16, align 2
  %tmp64 = alloca i16, align 2
  %__x73 = alloca i16, align 2
  %tmp74 = alloca i16, align 2
  %__x76 = alloca i16, align 2
  %tmp77 = alloca i16, align 2
  %__x90 = alloca i16, align 2
  %tmp91 = alloca i16, align 2
  %__x93 = alloca i16, align 2
  %tmp94 = alloca i16, align 2
  %__x103 = alloca i16, align 2
  %tmp104 = alloca i16, align 2
  %__x106 = alloca i16, align 2
  %tmp107 = alloca i16, align 2
  %__x123 = alloca i16, align 2
  %tmp124 = alloca i16, align 2
  %__x126 = alloca i16, align 2
  %tmp127 = alloca i16, align 2
  %__x136 = alloca i16, align 2
  %tmp137 = alloca i16, align 2
  %__x139 = alloca i16, align 2
  %tmp140 = alloca i16, align 2
  %__x172 = alloca i16, align 2
  %tmp173 = alloca i16, align 2
  %__x175 = alloca i16, align 2
  %tmp176 = alloca i16, align 2
  %__x185 = alloca i16, align 2
  %tmp186 = alloca i16, align 2
  %__x188 = alloca i16, align 2
  %tmp189 = alloca i16, align 2
  %__x204 = alloca i16, align 2
  %tmp205 = alloca i16, align 2
  %__x207 = alloca i16, align 2
  %tmp208 = alloca i16, align 2
  %__x217 = alloca i16, align 2
  %tmp218 = alloca i16, align 2
  %__x220 = alloca i16, align 2
  %tmp221 = alloca i16, align 2
  %__x236 = alloca i16, align 2
  %tmp237 = alloca i16, align 2
  %__x239 = alloca i16, align 2
  %tmp240 = alloca i16, align 2
  %__x249 = alloca i16, align 2
  %tmp250 = alloca i16, align 2
  %__x252 = alloca i16, align 2
  %tmp253 = alloca i16, align 2
  %__x267 = alloca i16, align 2
  %tmp268 = alloca i16, align 2
  %__x270 = alloca i16, align 2
  %tmp271 = alloca i16, align 2
  %__x280 = alloca i16, align 2
  %tmp281 = alloca i16, align 2
  %__x283 = alloca i16, align 2
  %tmp284 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !408
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !410
  call void @camel_init(), !dbg !411
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !412
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !412
  %arraydecay = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 0, !dbg !412
  %1 = bitcast i16* %arraydecay to i8*, !dbg !412
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !412
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !412
  %filter2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !412
  %arraydecay3 = getelementptr inbounds [128 x i16], [128 x i16]* %filter2, i16 0, i16 0, !dbg !412
  %3 = bitcast i16* %arraydecay3 to i8*, !dbg !412
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %1, i8* align 2 %3, i16 256, i1 false), !dbg !412
  call void @task_init(), !dbg !413
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !414
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !415
  %5 = bitcast %struct.camel_global_t* %globals4 to i8*, !dbg !416
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !418
  %7 = bitcast %struct.camel_global_t* %globals5 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %5, i8* align 2 %7, i16 276, i1 false), !dbg !416
  br label %while.cond, !dbg !419

while.cond:                                       ; preds = %if.end292, %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !420
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !420
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !420
  %9 = load i16, i16* %lookup_count, align 2, !dbg !420
  %cmp = icmp ult i16 %9, 32, !dbg !421
  br i1 %cmp, label %while.body, label %while.end293, !dbg !419

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !422
  br label %do.body, !dbg !424

do.body:                                          ; preds = %while.body
  %10 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !425
  %cmp7 = icmp eq i16 %10, 1, !dbg !425
  br i1 %cmp7, label %if.then, label %if.else, !dbg !428

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !429
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 0, !dbg !429
  %arraydecay8 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !429
  call void @__dump_registers(i16* %arraydecay8), !dbg !429
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !431, metadata !DIExpression()), !dbg !433
  %12 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !433, !srcloc !434
  store i16 %12, i16* %__x, align 2, !dbg !433
  %13 = load i16, i16* %__x, align 2, !dbg !433
  store i16 %13, i16* %tmp, align 2, !dbg !433
  %14 = load i16, i16* %tmp, align 2, !dbg !433
  %add = add i16 %14, 2, !dbg !429
  %15 = inttoptr i16 %add to i8*, !dbg !429
  call void @llvm.dbg.declare(metadata i16* %__x9, metadata !435, metadata !DIExpression()), !dbg !437
  %16 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !437, !srcloc !438
  store i16 %16, i16* %__x9, align 2, !dbg !437
  %17 = load i16, i16* %__x9, align 2, !dbg !437
  store i16 %17, i16* %tmp10, align 2, !dbg !437
  %18 = load i16, i16* %tmp10, align 2, !dbg !437
  %add11 = add i16 %18, 2, !dbg !429
  %sub = sub i16 9216, %add11, !dbg !429
  %call = call zeroext i16 @__fast_hw_crc(i8* %15, i16 zeroext %sub, i16 zeroext -1), !dbg !429
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !429
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !429
  %21 = load i16, i16* @tmp_stack_crc, align 2, !dbg !429
  %call12 = call zeroext i16 @__fast_hw_crc(i8* %20, i16 zeroext 298, i16 zeroext %21), !dbg !429
  store i16 %call12, i16* @tmp_stack_buf_crc, align 2, !dbg !429
  %22 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !429
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 2, !dbg !429
  store i16 %22, i16* %stack_and_buf_crc, align 2, !dbg !429
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !429
  br label %if.end, !dbg !429

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !439
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !439
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %reg_file13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 0, !dbg !439
  %arraydecay14 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file13, i16 0, i16 0, !dbg !439
  call void @__dump_registers(i16* %arraydecay14), !dbg !439
  call void @llvm.dbg.declare(metadata i16* %__x15, metadata !441, metadata !DIExpression()), !dbg !443
  %25 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !443, !srcloc !444
  store i16 %25, i16* %__x15, align 2, !dbg !443
  %26 = load i16, i16* %__x15, align 2, !dbg !443
  store i16 %26, i16* %tmp16, align 2, !dbg !443
  %27 = load i16, i16* %tmp16, align 2, !dbg !443
  %add17 = add i16 %27, 2, !dbg !439
  %28 = inttoptr i16 %add17 to i8*, !dbg !439
  call void @llvm.dbg.declare(metadata i16* %__x18, metadata !445, metadata !DIExpression()), !dbg !447
  %29 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !447, !srcloc !448
  store i16 %29, i16* %__x18, align 2, !dbg !447
  %30 = load i16, i16* %__x18, align 2, !dbg !447
  store i16 %30, i16* %tmp19, align 2, !dbg !447
  %31 = load i16, i16* %tmp19, align 2, !dbg !447
  %add20 = add i16 %31, 2, !dbg !439
  %sub21 = sub i16 9216, %add20, !dbg !439
  %call22 = call zeroext i16 @__fast_hw_crc(i8* %28, i16 zeroext %sub21, i16 zeroext -1), !dbg !439
  store i16 %call22, i16* @tmp_stack_crc, align 2, !dbg !439
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %33 = bitcast %struct.camel_buffer_t* %32 to i8*, !dbg !439
  %34 = load i16, i16* @tmp_stack_crc, align 2, !dbg !439
  %call23 = call zeroext i16 @__fast_hw_crc(i8* %33, i16 zeroext 298, i16 zeroext %34), !dbg !439
  store i16 %call23, i16* @tmp_stack_buf_crc, align 2, !dbg !439
  %35 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !439
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %stack_and_buf_crc24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 2, !dbg !439
  store i16 %35, i16* %stack_and_buf_crc24, align 2, !dbg !439
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !439
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !428

do.end:                                           ; preds = %if.end
  call void @task_calc_indexes(), !dbg !449
  br label %do.body25, !dbg !450

do.body25:                                        ; preds = %do.end
  %37 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !451
  %cmp26 = icmp eq i16 %37, 1, !dbg !451
  br i1 %cmp26, label %if.then27, label %if.else40, !dbg !454

if.then27:                                        ; preds = %do.body25
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !455
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !455
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %reg_file28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 0, !dbg !455
  %arraydecay29 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file28, i16 0, i16 0, !dbg !455
  call void @__dump_registers(i16* %arraydecay29), !dbg !455
  call void @llvm.dbg.declare(metadata i16* %__x30, metadata !457, metadata !DIExpression()), !dbg !459
  %39 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !459, !srcloc !460
  store i16 %39, i16* %__x30, align 2, !dbg !459
  %40 = load i16, i16* %__x30, align 2, !dbg !459
  store i16 %40, i16* %tmp31, align 2, !dbg !459
  %41 = load i16, i16* %tmp31, align 2, !dbg !459
  %add32 = add i16 %41, 2, !dbg !455
  %42 = inttoptr i16 %add32 to i8*, !dbg !455
  call void @llvm.dbg.declare(metadata i16* %__x33, metadata !461, metadata !DIExpression()), !dbg !463
  %43 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !463, !srcloc !464
  store i16 %43, i16* %__x33, align 2, !dbg !463
  %44 = load i16, i16* %__x33, align 2, !dbg !463
  store i16 %44, i16* %tmp34, align 2, !dbg !463
  %45 = load i16, i16* %tmp34, align 2, !dbg !463
  %add35 = add i16 %45, 2, !dbg !455
  %sub36 = sub i16 9216, %add35, !dbg !455
  %call37 = call zeroext i16 @__fast_hw_crc(i8* %42, i16 zeroext %sub36, i16 zeroext -1), !dbg !455
  store i16 %call37, i16* @tmp_stack_crc, align 2, !dbg !455
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %47 = bitcast %struct.camel_buffer_t* %46 to i8*, !dbg !455
  %48 = load i16, i16* @tmp_stack_crc, align 2, !dbg !455
  %call38 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext 298, i16 zeroext %48), !dbg !455
  store i16 %call38, i16* @tmp_stack_buf_crc, align 2, !dbg !455
  %49 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !455
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %stack_and_buf_crc39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 2, !dbg !455
  store i16 %49, i16* %stack_and_buf_crc39, align 2, !dbg !455
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !455
  br label %if.end53, !dbg !455

if.else40:                                        ; preds = %do.body25
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !465
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %reg_file41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 0, !dbg !465
  %arraydecay42 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file41, i16 0, i16 0, !dbg !465
  call void @__dump_registers(i16* %arraydecay42), !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x43, metadata !467, metadata !DIExpression()), !dbg !469
  %52 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !469, !srcloc !470
  store i16 %52, i16* %__x43, align 2, !dbg !469
  %53 = load i16, i16* %__x43, align 2, !dbg !469
  store i16 %53, i16* %tmp44, align 2, !dbg !469
  %54 = load i16, i16* %tmp44, align 2, !dbg !469
  %add45 = add i16 %54, 2, !dbg !465
  %55 = inttoptr i16 %add45 to i8*, !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x46, metadata !471, metadata !DIExpression()), !dbg !473
  %56 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !473, !srcloc !474
  store i16 %56, i16* %__x46, align 2, !dbg !473
  %57 = load i16, i16* %__x46, align 2, !dbg !473
  store i16 %57, i16* %tmp47, align 2, !dbg !473
  %58 = load i16, i16* %tmp47, align 2, !dbg !473
  %add48 = add i16 %58, 2, !dbg !465
  %sub49 = sub i16 9216, %add48, !dbg !465
  %call50 = call zeroext i16 @__fast_hw_crc(i8* %55, i16 zeroext %sub49, i16 zeroext -1), !dbg !465
  store i16 %call50, i16* @tmp_stack_crc, align 2, !dbg !465
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %60 = bitcast %struct.camel_buffer_t* %59 to i8*, !dbg !465
  %61 = load i16, i16* @tmp_stack_crc, align 2, !dbg !465
  %call51 = call zeroext i16 @__fast_hw_crc(i8* %60, i16 zeroext 298, i16 zeroext %61), !dbg !465
  store i16 %call51, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %62 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %stack_and_buf_crc52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %63, i32 0, i32 2, !dbg !465
  store i16 %62, i16* %stack_and_buf_crc52, align 2, !dbg !465
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !465
  br label %if.end53

if.end53:                                         ; preds = %if.else40, %if.then27
  br label %do.end54, !dbg !454

do.end54:                                         ; preds = %if.end53
  call void @task_calc_indexes_index_1(), !dbg !475
  br label %do.body55, !dbg !476

do.body55:                                        ; preds = %do.end54
  %64 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !477
  %cmp56 = icmp eq i16 %64, 1, !dbg !477
  br i1 %cmp56, label %if.then57, label %if.else70, !dbg !480

if.then57:                                        ; preds = %do.body55
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !481
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !481
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %reg_file58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 0, !dbg !481
  %arraydecay59 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file58, i16 0, i16 0, !dbg !481
  call void @__dump_registers(i16* %arraydecay59), !dbg !481
  call void @llvm.dbg.declare(metadata i16* %__x60, metadata !483, metadata !DIExpression()), !dbg !485
  %66 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !485, !srcloc !486
  store i16 %66, i16* %__x60, align 2, !dbg !485
  %67 = load i16, i16* %__x60, align 2, !dbg !485
  store i16 %67, i16* %tmp61, align 2, !dbg !485
  %68 = load i16, i16* %tmp61, align 2, !dbg !485
  %add62 = add i16 %68, 2, !dbg !481
  %69 = inttoptr i16 %add62 to i8*, !dbg !481
  call void @llvm.dbg.declare(metadata i16* %__x63, metadata !487, metadata !DIExpression()), !dbg !489
  %70 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !489, !srcloc !490
  store i16 %70, i16* %__x63, align 2, !dbg !489
  %71 = load i16, i16* %__x63, align 2, !dbg !489
  store i16 %71, i16* %tmp64, align 2, !dbg !489
  %72 = load i16, i16* %tmp64, align 2, !dbg !489
  %add65 = add i16 %72, 2, !dbg !481
  %sub66 = sub i16 9216, %add65, !dbg !481
  %call67 = call zeroext i16 @__fast_hw_crc(i8* %69, i16 zeroext %sub66, i16 zeroext -1), !dbg !481
  store i16 %call67, i16* @tmp_stack_crc, align 2, !dbg !481
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %74 = bitcast %struct.camel_buffer_t* %73 to i8*, !dbg !481
  %75 = load i16, i16* @tmp_stack_crc, align 2, !dbg !481
  %call68 = call zeroext i16 @__fast_hw_crc(i8* %74, i16 zeroext 298, i16 zeroext %75), !dbg !481
  store i16 %call68, i16* @tmp_stack_buf_crc, align 2, !dbg !481
  %76 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !481
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %stack_and_buf_crc69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 2, !dbg !481
  store i16 %76, i16* %stack_and_buf_crc69, align 2, !dbg !481
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !481
  br label %if.end83, !dbg !481

if.else70:                                        ; preds = %do.body55
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !491
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !491
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %reg_file71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 0, !dbg !491
  %arraydecay72 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file71, i16 0, i16 0, !dbg !491
  call void @__dump_registers(i16* %arraydecay72), !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x73, metadata !493, metadata !DIExpression()), !dbg !495
  %79 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !495, !srcloc !496
  store i16 %79, i16* %__x73, align 2, !dbg !495
  %80 = load i16, i16* %__x73, align 2, !dbg !495
  store i16 %80, i16* %tmp74, align 2, !dbg !495
  %81 = load i16, i16* %tmp74, align 2, !dbg !495
  %add75 = add i16 %81, 2, !dbg !491
  %82 = inttoptr i16 %add75 to i8*, !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x76, metadata !497, metadata !DIExpression()), !dbg !499
  %83 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !499, !srcloc !500
  store i16 %83, i16* %__x76, align 2, !dbg !499
  %84 = load i16, i16* %__x76, align 2, !dbg !499
  store i16 %84, i16* %tmp77, align 2, !dbg !499
  %85 = load i16, i16* %tmp77, align 2, !dbg !499
  %add78 = add i16 %85, 2, !dbg !491
  %sub79 = sub i16 9216, %add78, !dbg !491
  %call80 = call zeroext i16 @__fast_hw_crc(i8* %82, i16 zeroext %sub79, i16 zeroext -1), !dbg !491
  store i16 %call80, i16* @tmp_stack_crc, align 2, !dbg !491
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %87 = bitcast %struct.camel_buffer_t* %86 to i8*, !dbg !491
  %88 = load i16, i16* @tmp_stack_crc, align 2, !dbg !491
  %call81 = call zeroext i16 @__fast_hw_crc(i8* %87, i16 zeroext 298, i16 zeroext %88), !dbg !491
  store i16 %call81, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %89 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %stack_and_buf_crc82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i32 0, i32 2, !dbg !491
  store i16 %89, i16* %stack_and_buf_crc82, align 2, !dbg !491
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !491
  br label %if.end83

if.end83:                                         ; preds = %if.else70, %if.then57
  br label %do.end84, !dbg !480

do.end84:                                         ; preds = %if.end83
  call void @task_calc_indexes_index_2(), !dbg !501
  br label %do.body85, !dbg !502

do.body85:                                        ; preds = %do.end84
  %91 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !503
  %cmp86 = icmp eq i16 %91, 1, !dbg !503
  br i1 %cmp86, label %if.then87, label %if.else100, !dbg !506

if.then87:                                        ; preds = %do.body85
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !507
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !507
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %reg_file88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %92, i32 0, i32 0, !dbg !507
  %arraydecay89 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file88, i16 0, i16 0, !dbg !507
  call void @__dump_registers(i16* %arraydecay89), !dbg !507
  call void @llvm.dbg.declare(metadata i16* %__x90, metadata !509, metadata !DIExpression()), !dbg !511
  %93 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !511, !srcloc !512
  store i16 %93, i16* %__x90, align 2, !dbg !511
  %94 = load i16, i16* %__x90, align 2, !dbg !511
  store i16 %94, i16* %tmp91, align 2, !dbg !511
  %95 = load i16, i16* %tmp91, align 2, !dbg !511
  %add92 = add i16 %95, 2, !dbg !507
  %96 = inttoptr i16 %add92 to i8*, !dbg !507
  call void @llvm.dbg.declare(metadata i16* %__x93, metadata !513, metadata !DIExpression()), !dbg !515
  %97 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !515, !srcloc !516
  store i16 %97, i16* %__x93, align 2, !dbg !515
  %98 = load i16, i16* %__x93, align 2, !dbg !515
  store i16 %98, i16* %tmp94, align 2, !dbg !515
  %99 = load i16, i16* %tmp94, align 2, !dbg !515
  %add95 = add i16 %99, 2, !dbg !507
  %sub96 = sub i16 9216, %add95, !dbg !507
  %call97 = call zeroext i16 @__fast_hw_crc(i8* %96, i16 zeroext %sub96, i16 zeroext -1), !dbg !507
  store i16 %call97, i16* @tmp_stack_crc, align 2, !dbg !507
  %100 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %101 = bitcast %struct.camel_buffer_t* %100 to i8*, !dbg !507
  %102 = load i16, i16* @tmp_stack_crc, align 2, !dbg !507
  %call98 = call zeroext i16 @__fast_hw_crc(i8* %101, i16 zeroext 298, i16 zeroext %102), !dbg !507
  store i16 %call98, i16* @tmp_stack_buf_crc, align 2, !dbg !507
  %103 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !507
  %104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %stack_and_buf_crc99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %104, i32 0, i32 2, !dbg !507
  store i16 %103, i16* %stack_and_buf_crc99, align 2, !dbg !507
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !507
  br label %if.end113, !dbg !507

if.else100:                                       ; preds = %do.body85
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !517
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !517
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %reg_file101 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %105, i32 0, i32 0, !dbg !517
  %arraydecay102 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file101, i16 0, i16 0, !dbg !517
  call void @__dump_registers(i16* %arraydecay102), !dbg !517
  call void @llvm.dbg.declare(metadata i16* %__x103, metadata !519, metadata !DIExpression()), !dbg !521
  %106 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !521, !srcloc !522
  store i16 %106, i16* %__x103, align 2, !dbg !521
  %107 = load i16, i16* %__x103, align 2, !dbg !521
  store i16 %107, i16* %tmp104, align 2, !dbg !521
  %108 = load i16, i16* %tmp104, align 2, !dbg !521
  %add105 = add i16 %108, 2, !dbg !517
  %109 = inttoptr i16 %add105 to i8*, !dbg !517
  call void @llvm.dbg.declare(metadata i16* %__x106, metadata !523, metadata !DIExpression()), !dbg !525
  %110 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !525, !srcloc !526
  store i16 %110, i16* %__x106, align 2, !dbg !525
  %111 = load i16, i16* %__x106, align 2, !dbg !525
  store i16 %111, i16* %tmp107, align 2, !dbg !525
  %112 = load i16, i16* %tmp107, align 2, !dbg !525
  %add108 = add i16 %112, 2, !dbg !517
  %sub109 = sub i16 9216, %add108, !dbg !517
  %call110 = call zeroext i16 @__fast_hw_crc(i8* %109, i16 zeroext %sub109, i16 zeroext -1), !dbg !517
  store i16 %call110, i16* @tmp_stack_crc, align 2, !dbg !517
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %114 = bitcast %struct.camel_buffer_t* %113 to i8*, !dbg !517
  %115 = load i16, i16* @tmp_stack_crc, align 2, !dbg !517
  %call111 = call zeroext i16 @__fast_hw_crc(i8* %114, i16 zeroext 298, i16 zeroext %115), !dbg !517
  store i16 %call111, i16* @tmp_stack_buf_crc, align 2, !dbg !517
  %116 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !517
  %117 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %stack_and_buf_crc112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %117, i32 0, i32 2, !dbg !517
  store i16 %116, i16* %stack_and_buf_crc112, align 2, !dbg !517
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !517
  br label %if.end113

if.end113:                                        ; preds = %if.else100, %if.then87
  br label %do.end114, !dbg !506

do.end114:                                        ; preds = %if.end113
  %118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !527
  %globals115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %118, i32 0, i32 1, !dbg !527
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals115, i32 0, i32 6, !dbg !527
  %119 = load i16, i16* %insert_count, align 2, !dbg !527
  %cmp116 = icmp ult i16 %119, 32, !dbg !529
  br i1 %cmp116, label %if.then117, label %if.else229, !dbg !530

if.then117:                                       ; preds = %do.end114
  call void @task_add(), !dbg !531
  br label %do.body118, !dbg !533

do.body118:                                       ; preds = %if.then117
  %120 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !534
  %cmp119 = icmp eq i16 %120, 1, !dbg !534
  br i1 %cmp119, label %if.then120, label %if.else133, !dbg !537

if.then120:                                       ; preds = %do.body118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !538
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !538
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %reg_file121 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %121, i32 0, i32 0, !dbg !538
  %arraydecay122 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file121, i16 0, i16 0, !dbg !538
  call void @__dump_registers(i16* %arraydecay122), !dbg !538
  call void @llvm.dbg.declare(metadata i16* %__x123, metadata !540, metadata !DIExpression()), !dbg !542
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !542, !srcloc !543
  store i16 %122, i16* %__x123, align 2, !dbg !542
  %123 = load i16, i16* %__x123, align 2, !dbg !542
  store i16 %123, i16* %tmp124, align 2, !dbg !542
  %124 = load i16, i16* %tmp124, align 2, !dbg !542
  %add125 = add i16 %124, 2, !dbg !538
  %125 = inttoptr i16 %add125 to i8*, !dbg !538
  call void @llvm.dbg.declare(metadata i16* %__x126, metadata !544, metadata !DIExpression()), !dbg !546
  %126 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !546, !srcloc !547
  store i16 %126, i16* %__x126, align 2, !dbg !546
  %127 = load i16, i16* %__x126, align 2, !dbg !546
  store i16 %127, i16* %tmp127, align 2, !dbg !546
  %128 = load i16, i16* %tmp127, align 2, !dbg !546
  %add128 = add i16 %128, 2, !dbg !538
  %sub129 = sub i16 9216, %add128, !dbg !538
  %call130 = call zeroext i16 @__fast_hw_crc(i8* %125, i16 zeroext %sub129, i16 zeroext -1), !dbg !538
  store i16 %call130, i16* @tmp_stack_crc, align 2, !dbg !538
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %130 = bitcast %struct.camel_buffer_t* %129 to i8*, !dbg !538
  %131 = load i16, i16* @tmp_stack_crc, align 2, !dbg !538
  %call131 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext 298, i16 zeroext %131), !dbg !538
  store i16 %call131, i16* @tmp_stack_buf_crc, align 2, !dbg !538
  %132 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !538
  %133 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %stack_and_buf_crc132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %133, i32 0, i32 2, !dbg !538
  store i16 %132, i16* %stack_and_buf_crc132, align 2, !dbg !538
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !538
  br label %if.end146, !dbg !538

if.else133:                                       ; preds = %do.body118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !548
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %reg_file134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %134, i32 0, i32 0, !dbg !548
  %arraydecay135 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file134, i16 0, i16 0, !dbg !548
  call void @__dump_registers(i16* %arraydecay135), !dbg !548
  call void @llvm.dbg.declare(metadata i16* %__x136, metadata !550, metadata !DIExpression()), !dbg !552
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !552, !srcloc !553
  store i16 %135, i16* %__x136, align 2, !dbg !552
  %136 = load i16, i16* %__x136, align 2, !dbg !552
  store i16 %136, i16* %tmp137, align 2, !dbg !552
  %137 = load i16, i16* %tmp137, align 2, !dbg !552
  %add138 = add i16 %137, 2, !dbg !548
  %138 = inttoptr i16 %add138 to i8*, !dbg !548
  call void @llvm.dbg.declare(metadata i16* %__x139, metadata !554, metadata !DIExpression()), !dbg !556
  %139 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !556, !srcloc !557
  store i16 %139, i16* %__x139, align 2, !dbg !556
  %140 = load i16, i16* %__x139, align 2, !dbg !556
  store i16 %140, i16* %tmp140, align 2, !dbg !556
  %141 = load i16, i16* %tmp140, align 2, !dbg !556
  %add141 = add i16 %141, 2, !dbg !548
  %sub142 = sub i16 9216, %add141, !dbg !548
  %call143 = call zeroext i16 @__fast_hw_crc(i8* %138, i16 zeroext %sub142, i16 zeroext -1), !dbg !548
  store i16 %call143, i16* @tmp_stack_crc, align 2, !dbg !548
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %143 = bitcast %struct.camel_buffer_t* %142 to i8*, !dbg !548
  %144 = load i16, i16* @tmp_stack_crc, align 2, !dbg !548
  %call144 = call zeroext i16 @__fast_hw_crc(i8* %143, i16 zeroext 298, i16 zeroext %144), !dbg !548
  store i16 %call144, i16* @tmp_stack_buf_crc, align 2, !dbg !548
  %145 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !548
  %146 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %stack_and_buf_crc145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %146, i32 0, i32 2, !dbg !548
  store i16 %145, i16* %stack_and_buf_crc145, align 2, !dbg !548
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !548
  br label %if.end146

if.end146:                                        ; preds = %if.else133, %if.then120
  br label %do.end147, !dbg !537

do.end147:                                        ; preds = %if.end146
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !558
  %globals148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 1, !dbg !558
  %filter149 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals148, i32 0, i32 0, !dbg !558
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !560
  %globals150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 1, !dbg !560
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals150, i32 0, i32 3, !dbg !560
  %149 = load i16, i16* %index1, align 2, !dbg !560
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter149, i16 0, i16 %149, !dbg !558
  %150 = load i16, i16* %arrayidx, align 2, !dbg !558
  %tobool = icmp ne i16 %150, 0, !dbg !558
  br i1 %tobool, label %land.lhs.true, label %if.end197, !dbg !561

land.lhs.true:                                    ; preds = %do.end147
  %151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %globals151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %151, i32 0, i32 1, !dbg !562
  %filter152 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals151, i32 0, i32 0, !dbg !562
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 1, !dbg !563
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals153, i32 0, i32 4, !dbg !563
  %153 = load i16, i16* %index2, align 2, !dbg !563
  %arrayidx154 = getelementptr inbounds [128 x i16], [128 x i16]* %filter152, i16 0, i16 %153, !dbg !562
  %154 = load i16, i16* %arrayidx154, align 2, !dbg !562
  %tobool155 = icmp ne i16 %154, 0, !dbg !562
  br i1 %tobool155, label %if.then156, label %if.end197, !dbg !564

if.then156:                                       ; preds = %land.lhs.true
  br label %while.cond157, !dbg !565

while.cond157:                                    ; preds = %do.end196, %if.then156
  %155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !567
  %globals158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %155, i32 0, i32 1, !dbg !567
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals158, i32 0, i32 10, !dbg !567
  %156 = load i8, i8* %success, align 2, !dbg !567
  %tobool159 = trunc i8 %156 to i1, !dbg !567
  %conv = zext i1 %tobool159 to i16, !dbg !567
  %cmp160 = icmp eq i16 %conv, 0, !dbg !568
  br i1 %cmp160, label %land.rhs, label %land.end, !dbg !569

land.rhs:                                         ; preds = %while.cond157
  %157 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !570
  %globals162 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %157, i32 0, i32 1, !dbg !570
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals162, i32 0, i32 5, !dbg !570
  %158 = load i16, i16* %relocation_count, align 2, !dbg !570
  %cmp163 = icmp ult i16 %158, 8, !dbg !571
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond157
  %159 = phi i1 [ false, %while.cond157 ], [ %cmp163, %land.rhs ], !dbg !572
  br i1 %159, label %while.body165, label %while.end, !dbg !565

while.body165:                                    ; preds = %land.end
  call void @task_relocate(), !dbg !573
  br label %do.body166, !dbg !575

do.body166:                                       ; preds = %while.body165
  %160 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !576
  %cmp167 = icmp eq i16 %160, 1, !dbg !576
  br i1 %cmp167, label %if.then169, label %if.else182, !dbg !579

if.then169:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !580
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !580
  %161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %reg_file170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %161, i32 0, i32 0, !dbg !580
  %arraydecay171 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file170, i16 0, i16 0, !dbg !580
  call void @__dump_registers(i16* %arraydecay171), !dbg !580
  call void @llvm.dbg.declare(metadata i16* %__x172, metadata !582, metadata !DIExpression()), !dbg !584
  %162 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !584, !srcloc !585
  store i16 %162, i16* %__x172, align 2, !dbg !584
  %163 = load i16, i16* %__x172, align 2, !dbg !584
  store i16 %163, i16* %tmp173, align 2, !dbg !584
  %164 = load i16, i16* %tmp173, align 2, !dbg !584
  %add174 = add i16 %164, 2, !dbg !580
  %165 = inttoptr i16 %add174 to i8*, !dbg !580
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !586, metadata !DIExpression()), !dbg !588
  %166 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !588, !srcloc !589
  store i16 %166, i16* %__x175, align 2, !dbg !588
  %167 = load i16, i16* %__x175, align 2, !dbg !588
  store i16 %167, i16* %tmp176, align 2, !dbg !588
  %168 = load i16, i16* %tmp176, align 2, !dbg !588
  %add177 = add i16 %168, 2, !dbg !580
  %sub178 = sub i16 9216, %add177, !dbg !580
  %call179 = call zeroext i16 @__fast_hw_crc(i8* %165, i16 zeroext %sub178, i16 zeroext -1), !dbg !580
  store i16 %call179, i16* @tmp_stack_crc, align 2, !dbg !580
  %169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %170 = bitcast %struct.camel_buffer_t* %169 to i8*, !dbg !580
  %171 = load i16, i16* @tmp_stack_crc, align 2, !dbg !580
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %170, i16 zeroext 298, i16 zeroext %171), !dbg !580
  store i16 %call180, i16* @tmp_stack_buf_crc, align 2, !dbg !580
  %172 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !580
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %stack_and_buf_crc181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 2, !dbg !580
  store i16 %172, i16* %stack_and_buf_crc181, align 2, !dbg !580
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !580
  br label %if.end195, !dbg !580

if.else182:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !590
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !590
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %reg_file183 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %174, i32 0, i32 0, !dbg !590
  %arraydecay184 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file183, i16 0, i16 0, !dbg !590
  call void @__dump_registers(i16* %arraydecay184), !dbg !590
  call void @llvm.dbg.declare(metadata i16* %__x185, metadata !592, metadata !DIExpression()), !dbg !594
  %175 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !594, !srcloc !595
  store i16 %175, i16* %__x185, align 2, !dbg !594
  %176 = load i16, i16* %__x185, align 2, !dbg !594
  store i16 %176, i16* %tmp186, align 2, !dbg !594
  %177 = load i16, i16* %tmp186, align 2, !dbg !594
  %add187 = add i16 %177, 2, !dbg !590
  %178 = inttoptr i16 %add187 to i8*, !dbg !590
  call void @llvm.dbg.declare(metadata i16* %__x188, metadata !596, metadata !DIExpression()), !dbg !598
  %179 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !598, !srcloc !599
  store i16 %179, i16* %__x188, align 2, !dbg !598
  %180 = load i16, i16* %__x188, align 2, !dbg !598
  store i16 %180, i16* %tmp189, align 2, !dbg !598
  %181 = load i16, i16* %tmp189, align 2, !dbg !598
  %add190 = add i16 %181, 2, !dbg !590
  %sub191 = sub i16 9216, %add190, !dbg !590
  %call192 = call zeroext i16 @__fast_hw_crc(i8* %178, i16 zeroext %sub191, i16 zeroext -1), !dbg !590
  store i16 %call192, i16* @tmp_stack_crc, align 2, !dbg !590
  %182 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %183 = bitcast %struct.camel_buffer_t* %182 to i8*, !dbg !590
  %184 = load i16, i16* @tmp_stack_crc, align 2, !dbg !590
  %call193 = call zeroext i16 @__fast_hw_crc(i8* %183, i16 zeroext 298, i16 zeroext %184), !dbg !590
  store i16 %call193, i16* @tmp_stack_buf_crc, align 2, !dbg !590
  %185 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !590
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %stack_and_buf_crc194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 2, !dbg !590
  store i16 %185, i16* %stack_and_buf_crc194, align 2, !dbg !590
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !590
  br label %if.end195

if.end195:                                        ; preds = %if.else182, %if.then169
  br label %do.end196, !dbg !579

do.end196:                                        ; preds = %if.end195
  br label %while.cond157, !dbg !565, !llvm.loop !600

while.end:                                        ; preds = %land.end
  br label %if.end197, !dbg !602

if.end197:                                        ; preds = %while.end, %land.lhs.true, %do.end147
  call void @task_insert_done(), !dbg !603
  br label %do.body198, !dbg !604

do.body198:                                       ; preds = %if.end197
  %187 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !605
  %cmp199 = icmp eq i16 %187, 1, !dbg !605
  br i1 %cmp199, label %if.then201, label %if.else214, !dbg !608

if.then201:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !609
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !609
  %188 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %reg_file202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %188, i32 0, i32 0, !dbg !609
  %arraydecay203 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file202, i16 0, i16 0, !dbg !609
  call void @__dump_registers(i16* %arraydecay203), !dbg !609
  call void @llvm.dbg.declare(metadata i16* %__x204, metadata !611, metadata !DIExpression()), !dbg !613
  %189 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !613, !srcloc !614
  store i16 %189, i16* %__x204, align 2, !dbg !613
  %190 = load i16, i16* %__x204, align 2, !dbg !613
  store i16 %190, i16* %tmp205, align 2, !dbg !613
  %191 = load i16, i16* %tmp205, align 2, !dbg !613
  %add206 = add i16 %191, 2, !dbg !609
  %192 = inttoptr i16 %add206 to i8*, !dbg !609
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !615, metadata !DIExpression()), !dbg !617
  %193 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !617, !srcloc !618
  store i16 %193, i16* %__x207, align 2, !dbg !617
  %194 = load i16, i16* %__x207, align 2, !dbg !617
  store i16 %194, i16* %tmp208, align 2, !dbg !617
  %195 = load i16, i16* %tmp208, align 2, !dbg !617
  %add209 = add i16 %195, 2, !dbg !609
  %sub210 = sub i16 9216, %add209, !dbg !609
  %call211 = call zeroext i16 @__fast_hw_crc(i8* %192, i16 zeroext %sub210, i16 zeroext -1), !dbg !609
  store i16 %call211, i16* @tmp_stack_crc, align 2, !dbg !609
  %196 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %197 = bitcast %struct.camel_buffer_t* %196 to i8*, !dbg !609
  %198 = load i16, i16* @tmp_stack_crc, align 2, !dbg !609
  %call212 = call zeroext i16 @__fast_hw_crc(i8* %197, i16 zeroext 298, i16 zeroext %198), !dbg !609
  store i16 %call212, i16* @tmp_stack_buf_crc, align 2, !dbg !609
  %199 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !609
  %200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %stack_and_buf_crc213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %200, i32 0, i32 2, !dbg !609
  store i16 %199, i16* %stack_and_buf_crc213, align 2, !dbg !609
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !609
  br label %if.end227, !dbg !609

if.else214:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !619
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !619
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %reg_file215 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %201, i32 0, i32 0, !dbg !619
  %arraydecay216 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file215, i16 0, i16 0, !dbg !619
  call void @__dump_registers(i16* %arraydecay216), !dbg !619
  call void @llvm.dbg.declare(metadata i16* %__x217, metadata !621, metadata !DIExpression()), !dbg !623
  %202 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !623, !srcloc !624
  store i16 %202, i16* %__x217, align 2, !dbg !623
  %203 = load i16, i16* %__x217, align 2, !dbg !623
  store i16 %203, i16* %tmp218, align 2, !dbg !623
  %204 = load i16, i16* %tmp218, align 2, !dbg !623
  %add219 = add i16 %204, 2, !dbg !619
  %205 = inttoptr i16 %add219 to i8*, !dbg !619
  call void @llvm.dbg.declare(metadata i16* %__x220, metadata !625, metadata !DIExpression()), !dbg !627
  %206 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !627, !srcloc !628
  store i16 %206, i16* %__x220, align 2, !dbg !627
  %207 = load i16, i16* %__x220, align 2, !dbg !627
  store i16 %207, i16* %tmp221, align 2, !dbg !627
  %208 = load i16, i16* %tmp221, align 2, !dbg !627
  %add222 = add i16 %208, 2, !dbg !619
  %sub223 = sub i16 9216, %add222, !dbg !619
  %call224 = call zeroext i16 @__fast_hw_crc(i8* %205, i16 zeroext %sub223, i16 zeroext -1), !dbg !619
  store i16 %call224, i16* @tmp_stack_crc, align 2, !dbg !619
  %209 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %210 = bitcast %struct.camel_buffer_t* %209 to i8*, !dbg !619
  %211 = load i16, i16* @tmp_stack_crc, align 2, !dbg !619
  %call225 = call zeroext i16 @__fast_hw_crc(i8* %210, i16 zeroext 298, i16 zeroext %211), !dbg !619
  store i16 %call225, i16* @tmp_stack_buf_crc, align 2, !dbg !619
  %212 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !619
  %213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %stack_and_buf_crc226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %213, i32 0, i32 2, !dbg !619
  store i16 %212, i16* %stack_and_buf_crc226, align 2, !dbg !619
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !619
  br label %if.end227

if.end227:                                        ; preds = %if.else214, %if.then201
  br label %do.end228, !dbg !608

do.end228:                                        ; preds = %if.end227
  br label %if.end292, !dbg !629

if.else229:                                       ; preds = %do.end114
  call void @task_lookup_search(), !dbg !630
  br label %do.body230, !dbg !632

do.body230:                                       ; preds = %if.else229
  %214 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !633
  %cmp231 = icmp eq i16 %214, 1, !dbg !633
  br i1 %cmp231, label %if.then233, label %if.else246, !dbg !636

if.then233:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !637
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %reg_file234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %215, i32 0, i32 0, !dbg !637
  %arraydecay235 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file234, i16 0, i16 0, !dbg !637
  call void @__dump_registers(i16* %arraydecay235), !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x236, metadata !639, metadata !DIExpression()), !dbg !641
  %216 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !641, !srcloc !642
  store i16 %216, i16* %__x236, align 2, !dbg !641
  %217 = load i16, i16* %__x236, align 2, !dbg !641
  store i16 %217, i16* %tmp237, align 2, !dbg !641
  %218 = load i16, i16* %tmp237, align 2, !dbg !641
  %add238 = add i16 %218, 2, !dbg !637
  %219 = inttoptr i16 %add238 to i8*, !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !643, metadata !DIExpression()), !dbg !645
  %220 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !645, !srcloc !646
  store i16 %220, i16* %__x239, align 2, !dbg !645
  %221 = load i16, i16* %__x239, align 2, !dbg !645
  store i16 %221, i16* %tmp240, align 2, !dbg !645
  %222 = load i16, i16* %tmp240, align 2, !dbg !645
  %add241 = add i16 %222, 2, !dbg !637
  %sub242 = sub i16 9216, %add241, !dbg !637
  %call243 = call zeroext i16 @__fast_hw_crc(i8* %219, i16 zeroext %sub242, i16 zeroext -1), !dbg !637
  store i16 %call243, i16* @tmp_stack_crc, align 2, !dbg !637
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %224 = bitcast %struct.camel_buffer_t* %223 to i8*, !dbg !637
  %225 = load i16, i16* @tmp_stack_crc, align 2, !dbg !637
  %call244 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext 298, i16 zeroext %225), !dbg !637
  store i16 %call244, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %226 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %stack_and_buf_crc245 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 2, !dbg !637
  store i16 %226, i16* %stack_and_buf_crc245, align 2, !dbg !637
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !637
  br label %if.end259, !dbg !637

if.else246:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !647
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !647
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %reg_file247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 0, !dbg !647
  %arraydecay248 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file247, i16 0, i16 0, !dbg !647
  call void @__dump_registers(i16* %arraydecay248), !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x249, metadata !649, metadata !DIExpression()), !dbg !651
  %229 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !651, !srcloc !652
  store i16 %229, i16* %__x249, align 2, !dbg !651
  %230 = load i16, i16* %__x249, align 2, !dbg !651
  store i16 %230, i16* %tmp250, align 2, !dbg !651
  %231 = load i16, i16* %tmp250, align 2, !dbg !651
  %add251 = add i16 %231, 2, !dbg !647
  %232 = inttoptr i16 %add251 to i8*, !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x252, metadata !653, metadata !DIExpression()), !dbg !655
  %233 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !655, !srcloc !656
  store i16 %233, i16* %__x252, align 2, !dbg !655
  %234 = load i16, i16* %__x252, align 2, !dbg !655
  store i16 %234, i16* %tmp253, align 2, !dbg !655
  %235 = load i16, i16* %tmp253, align 2, !dbg !655
  %add254 = add i16 %235, 2, !dbg !647
  %sub255 = sub i16 9216, %add254, !dbg !647
  %call256 = call zeroext i16 @__fast_hw_crc(i8* %232, i16 zeroext %sub255, i16 zeroext -1), !dbg !647
  store i16 %call256, i16* @tmp_stack_crc, align 2, !dbg !647
  %236 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %237 = bitcast %struct.camel_buffer_t* %236 to i8*, !dbg !647
  %238 = load i16, i16* @tmp_stack_crc, align 2, !dbg !647
  %call257 = call zeroext i16 @__fast_hw_crc(i8* %237, i16 zeroext 298, i16 zeroext %238), !dbg !647
  store i16 %call257, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %239 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %240 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %stack_and_buf_crc258 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %240, i32 0, i32 2, !dbg !647
  store i16 %239, i16* %stack_and_buf_crc258, align 2, !dbg !647
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !647
  br label %if.end259

if.end259:                                        ; preds = %if.else246, %if.then233
  br label %do.end260, !dbg !636

do.end260:                                        ; preds = %if.end259
  call void @task_lookup_done(), !dbg !657
  br label %do.body261, !dbg !658

do.body261:                                       ; preds = %do.end260
  %241 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !659
  %cmp262 = icmp eq i16 %241, 1, !dbg !659
  br i1 %cmp262, label %if.then264, label %if.else277, !dbg !662

if.then264:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !663
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !663
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %reg_file265 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %242, i32 0, i32 0, !dbg !663
  %arraydecay266 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file265, i16 0, i16 0, !dbg !663
  call void @__dump_registers(i16* %arraydecay266), !dbg !663
  call void @llvm.dbg.declare(metadata i16* %__x267, metadata !665, metadata !DIExpression()), !dbg !667
  %243 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !667, !srcloc !668
  store i16 %243, i16* %__x267, align 2, !dbg !667
  %244 = load i16, i16* %__x267, align 2, !dbg !667
  store i16 %244, i16* %tmp268, align 2, !dbg !667
  %245 = load i16, i16* %tmp268, align 2, !dbg !667
  %add269 = add i16 %245, 2, !dbg !663
  %246 = inttoptr i16 %add269 to i8*, !dbg !663
  call void @llvm.dbg.declare(metadata i16* %__x270, metadata !669, metadata !DIExpression()), !dbg !671
  %247 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !671, !srcloc !672
  store i16 %247, i16* %__x270, align 2, !dbg !671
  %248 = load i16, i16* %__x270, align 2, !dbg !671
  store i16 %248, i16* %tmp271, align 2, !dbg !671
  %249 = load i16, i16* %tmp271, align 2, !dbg !671
  %add272 = add i16 %249, 2, !dbg !663
  %sub273 = sub i16 9216, %add272, !dbg !663
  %call274 = call zeroext i16 @__fast_hw_crc(i8* %246, i16 zeroext %sub273, i16 zeroext -1), !dbg !663
  store i16 %call274, i16* @tmp_stack_crc, align 2, !dbg !663
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %251 = bitcast %struct.camel_buffer_t* %250 to i8*, !dbg !663
  %252 = load i16, i16* @tmp_stack_crc, align 2, !dbg !663
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %251, i16 zeroext 298, i16 zeroext %252), !dbg !663
  store i16 %call275, i16* @tmp_stack_buf_crc, align 2, !dbg !663
  %253 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !663
  %254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %stack_and_buf_crc276 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %254, i32 0, i32 2, !dbg !663
  store i16 %253, i16* %stack_and_buf_crc276, align 2, !dbg !663
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !663
  br label %if.end290, !dbg !663

if.else277:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !673
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !673
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %reg_file278 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %255, i32 0, i32 0, !dbg !673
  %arraydecay279 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file278, i16 0, i16 0, !dbg !673
  call void @__dump_registers(i16* %arraydecay279), !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x280, metadata !675, metadata !DIExpression()), !dbg !677
  %256 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !677, !srcloc !678
  store i16 %256, i16* %__x280, align 2, !dbg !677
  %257 = load i16, i16* %__x280, align 2, !dbg !677
  store i16 %257, i16* %tmp281, align 2, !dbg !677
  %258 = load i16, i16* %tmp281, align 2, !dbg !677
  %add282 = add i16 %258, 2, !dbg !673
  %259 = inttoptr i16 %add282 to i8*, !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x283, metadata !679, metadata !DIExpression()), !dbg !681
  %260 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !681, !srcloc !682
  store i16 %260, i16* %__x283, align 2, !dbg !681
  %261 = load i16, i16* %__x283, align 2, !dbg !681
  store i16 %261, i16* %tmp284, align 2, !dbg !681
  %262 = load i16, i16* %tmp284, align 2, !dbg !681
  %add285 = add i16 %262, 2, !dbg !673
  %sub286 = sub i16 9216, %add285, !dbg !673
  %call287 = call zeroext i16 @__fast_hw_crc(i8* %259, i16 zeroext %sub286, i16 zeroext -1), !dbg !673
  store i16 %call287, i16* @tmp_stack_crc, align 2, !dbg !673
  %263 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %264 = bitcast %struct.camel_buffer_t* %263 to i8*, !dbg !673
  %265 = load i16, i16* @tmp_stack_crc, align 2, !dbg !673
  %call288 = call zeroext i16 @__fast_hw_crc(i8* %264, i16 zeroext 298, i16 zeroext %265), !dbg !673
  store i16 %call288, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %266 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %267 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %stack_and_buf_crc289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %267, i32 0, i32 2, !dbg !673
  store i16 %266, i16* %stack_and_buf_crc289, align 2, !dbg !673
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !673
  br label %if.end290

if.end290:                                        ; preds = %if.else277, %if.then264
  br label %do.end291, !dbg !662

do.end291:                                        ; preds = %if.end290
  br label %if.end292

if.end292:                                        ; preds = %do.end291, %do.end228
  br label %while.cond, !dbg !419, !llvm.loop !683

while.end293:                                     ; preds = %while.cond
  call void @task_done(), !dbg !685
  %268 = load i16, i16* %retval, align 2, !dbg !686
  ret i16 %268, !dbg !686
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !687 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !690, metadata !DIExpression()), !dbg !691
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !692, metadata !DIExpression()), !dbg !693
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !694, metadata !DIExpression()), !dbg !695
  store i16 5381, i16* %hash, align 2, !dbg !695
  call void @llvm.dbg.declare(metadata i16* %i, metadata !696, metadata !DIExpression()), !dbg !697
  store i16 0, i16* %i, align 2, !dbg !698
  br label %for.cond, !dbg !700

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !701
  %1 = load i16, i16* %len.addr, align 2, !dbg !703
  %cmp = icmp ult i16 %0, %1, !dbg !704
  br i1 %cmp, label %for.body, label %for.end, !dbg !705

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !706
  %shl = shl i16 %2, 5, !dbg !707
  %3 = load i16, i16* %hash, align 2, !dbg !708
  %add = add i16 %shl, %3, !dbg !709
  %4 = load i8*, i8** %data.addr, align 2, !dbg !710
  %5 = load i8, i8* %4, align 1, !dbg !711
  %conv = zext i8 %5 to i16, !dbg !712
  %add1 = add i16 %add, %conv, !dbg !713
  store i16 %add1, i16* %hash, align 2, !dbg !714
  br label %for.inc, !dbg !715

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !716
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !716
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !716
  %7 = load i16, i16* %i, align 2, !dbg !717
  %inc = add i16 %7, 1, !dbg !717
  store i16 %inc, i16* %i, align 2, !dbg !717
  br label %for.cond, !dbg !718, !llvm.loop !719

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !721
  ret i16 %8, !dbg !722
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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 138, type: !71, isLocal: false, isDefinition: true)
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
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 220, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 421, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 618, type: !26, isLocal: true, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 51, type: !18, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 145, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 16)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 131, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 126, size: 2400, elements: !38)
!38 = !{!39, !44, !65}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !37, file: !3, line: 128, baseType: !40, size: 176)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 176, elements: !42)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 48, baseType: !18)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !37, file: !3, line: 129, baseType: !45, size: 2208, offset: 176)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 123, baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 109, size: 2208, elements: !47)
!47 = !{!48, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !46, file: !3, line: 111, baseType: !49, size: 2048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2048, elements: !51)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 19, baseType: !18)
!51 = !{!52}
!52 = !DISubrange(count: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !46, file: !3, line: 112, baseType: !17, size: 16, offset: 2048)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !46, file: !3, line: 113, baseType: !50, size: 16, offset: 2064)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !46, file: !3, line: 114, baseType: !17, size: 16, offset: 2080)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !46, file: !3, line: 115, baseType: !17, size: 16, offset: 2096)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !46, file: !3, line: 116, baseType: !17, size: 16, offset: 2112)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !46, file: !3, line: 117, baseType: !17, size: 16, offset: 2128)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !46, file: !3, line: 118, baseType: !17, size: 16, offset: 2144)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !46, file: !3, line: 119, baseType: !17, size: 16, offset: 2160)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !46, file: !3, line: 120, baseType: !17, size: 16, offset: 2176)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !46, file: !3, line: 121, baseType: !63, size: 8, offset: 2192)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !46, file: !3, line: 122, baseType: !63, size: 8, offset: 2200)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !37, file: !3, line: 130, baseType: !18, size: 16, offset: 2384)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 145, type: !35, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 174, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !42)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 133, size: 4816, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 135, baseType: !18, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 136, baseType: !36, size: 2400, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 137, baseType: !36, size: 2400, offset: 2416)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 147, type: !27, scopeLine: 147, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 148, column: 10, scope: !80)
!82 = !DILocation(line: 150, column: 9, scope: !80)
!83 = !DILocation(line: 152, column: 9, scope: !80)
!84 = !DILocation(line: 157, column: 11, scope: !80)
!85 = !DILocation(line: 162, column: 12, scope: !80)
!86 = !DILocation(line: 163, column: 10, scope: !80)
!87 = !DILocation(line: 164, column: 10, scope: !80)
!88 = !DILocation(line: 166, column: 10, scope: !80)
!89 = !DILocation(line: 167, column: 12, scope: !80)
!90 = !DILocation(line: 170, column: 10, scope: !80)
!91 = !DILocation(line: 172, column: 1, scope: !80)
!92 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 176, type: !27, scopeLine: 176, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 177, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !3, line: 177, column: 8)
!95 = !DILocation(line: 177, column: 19, scope: !94)
!96 = !DILocation(line: 177, column: 8, scope: !92)
!97 = !DILocation(line: 178, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 177, column: 34)
!99 = !DILocation(line: 179, column: 16, scope: !98)
!100 = !DILocation(line: 180, column: 5, scope: !98)
!101 = !DILocation(line: 180, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !3, line: 180, column: 15)
!103 = !DILocation(line: 180, column: 26, scope: !102)
!104 = !DILocation(line: 180, column: 15, scope: !94)
!105 = !DILocation(line: 181, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 180, column: 41)
!107 = !DILocation(line: 182, column: 16, scope: !106)
!108 = !DILocation(line: 183, column: 5, scope: !106)
!109 = !DILocation(line: 184, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !3, line: 183, column: 12)
!111 = !DILocation(line: 201, column: 3, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !3, line: 201, column: 3)
!113 = !{i32 -2146587547}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 203, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 33)
!116 = !DILocation(line: 203, column: 33, scope: !115)
!117 = !{i32 -2146587311}
!118 = !DILocation(line: 203, column: 51, scope: !92)
!119 = !DILocation(line: 203, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 203, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 65)
!122 = !DILocation(line: 203, column: 65, scope: !121)
!123 = !{i32 -2146587186}
!124 = !DILocation(line: 203, column: 83, scope: !92)
!125 = !DILocation(line: 203, column: 63, scope: !92)
!126 = !DILocation(line: 203, column: 19, scope: !92)
!127 = !DILocation(line: 203, column: 17, scope: !92)
!128 = !DILocation(line: 204, column: 37, scope: !92)
!129 = !DILocation(line: 204, column: 71, scope: !92)
!130 = !DILocation(line: 204, column: 23, scope: !92)
!131 = !DILocation(line: 204, column: 21, scope: !92)
!132 = !DILocation(line: 207, column: 6, scope: !133)
!133 = distinct !DILexicalBlock(scope: !92, file: !3, line: 207, column: 6)
!134 = !DILocation(line: 207, column: 27, scope: !133)
!135 = !DILocation(line: 207, column: 33, scope: !133)
!136 = !DILocation(line: 207, column: 24, scope: !133)
!137 = !DILocation(line: 207, column: 6, scope: !92)
!138 = !DILocation(line: 208, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 207, column: 51)
!140 = !DILocation(line: 208, column: 4, scope: !139)
!141 = !DILocation(line: 208, column: 19, scope: !139)
!142 = !DILocation(line: 209, column: 4, scope: !139)
!143 = !DILocation(line: 210, column: 24, scope: !139)
!144 = !DILocation(line: 210, column: 30, scope: !139)
!145 = !DILocation(line: 210, column: 4, scope: !139)
!146 = !DILocation(line: 211, column: 3, scope: !139)
!147 = !DILocation(line: 212, column: 4, scope: !148)
!148 = distinct !DILexicalBlock(scope: !133, file: !3, line: 211, column: 9)
!149 = !DILocation(line: 215, column: 1, scope: !92)
!150 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 261, type: !27, scopeLine: 262, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "i", scope: !150, file: !3, line: 263, type: !6)
!152 = !DILocation(line: 263, column: 14, scope: !150)
!153 = !DILocation(line: 264, column: 12, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 264, column: 5)
!155 = !DILocation(line: 264, column: 10, scope: !154)
!156 = !DILocation(line: 264, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 264, column: 5)
!158 = !DILocation(line: 264, column: 19, scope: !157)
!159 = !DILocation(line: 264, column: 5, scope: !154)
!160 = !DILocation(line: 265, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 264, column: 40)
!162 = !DILocation(line: 265, column: 20, scope: !161)
!163 = !DILocation(line: 265, column: 23, scope: !161)
!164 = !DILocation(line: 267, column: 5, scope: !161)
!165 = !DILocation(line: 264, column: 35, scope: !157)
!166 = !DILocation(line: 264, column: 5, scope: !157)
!167 = distinct !{!167, !159, !168}
!168 = !DILocation(line: 267, column: 5, scope: !154)
!169 = !DILocation(line: 268, column: 5, scope: !150)
!170 = !DILocation(line: 268, column: 22, scope: !150)
!171 = !DILocation(line: 269, column: 5, scope: !150)
!172 = !DILocation(line: 269, column: 22, scope: !150)
!173 = !DILocation(line: 270, column: 5, scope: !150)
!174 = !DILocation(line: 270, column: 24, scope: !150)
!175 = !DILocation(line: 271, column: 5, scope: !150)
!176 = !DILocation(line: 271, column: 22, scope: !150)
!177 = !DILocation(line: 272, column: 5, scope: !150)
!178 = !DILocation(line: 272, column: 13, scope: !150)
!179 = !DILocation(line: 273, column: 1, scope: !150)
!180 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 291, type: !27, scopeLine: 292, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 294, column: 16, scope: !180)
!182 = !DILocation(line: 294, column: 24, scope: !180)
!183 = !DILocation(line: 294, column: 29, scope: !180)
!184 = !DILocation(line: 294, column: 5, scope: !180)
!185 = !DILocation(line: 294, column: 13, scope: !180)
!186 = !DILocation(line: 295, column: 1, scope: !180)
!187 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 313, type: !27, scopeLine: 314, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 315, column: 43, scope: !187)
!189 = !DILocation(line: 315, column: 23, scope: !187)
!190 = !DILocation(line: 315, column: 5, scope: !187)
!191 = !DILocation(line: 315, column: 21, scope: !187)
!192 = !DILocation(line: 316, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 240, type: !194, scopeLine: 241, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DISubroutineType(types: !195)
!195 = !{!50, !17}
!196 = !DILocalVariable(name: "key", arg: 1, scope: !193, file: !3, line: 240, type: !17)
!197 = !DILocation(line: 240, column: 50, scope: !193)
!198 = !DILocation(line: 242, column: 21, scope: !193)
!199 = !DILocation(line: 242, column: 12, scope: !193)
!200 = !DILocation(line: 242, column: 5, scope: !193)
!201 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 334, type: !27, scopeLine: 335, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 336, column: 32, scope: !201)
!203 = !DILocation(line: 336, column: 18, scope: !201)
!204 = !DILocation(line: 336, column: 5, scope: !201)
!205 = !DILocation(line: 336, column: 16, scope: !201)
!206 = !DILocation(line: 337, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 234, type: !208, scopeLine: 235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!23, !50}
!210 = !DILocalVariable(name: "fp", arg: 1, scope: !207, file: !3, line: 234, type: !50)
!211 = !DILocation(line: 234, column: 44, scope: !207)
!212 = !DILocalVariable(name: "hash", scope: !207, file: !3, line: 236, type: !213)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!214 = !DILocation(line: 236, column: 12, scope: !207)
!215 = !DILocation(line: 236, column: 28, scope: !207)
!216 = !DILocation(line: 236, column: 19, scope: !207)
!217 = !DILocation(line: 237, column: 12, scope: !207)
!218 = !DILocation(line: 237, column: 17, scope: !207)
!219 = !DILocation(line: 237, column: 5, scope: !207)
!220 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 355, type: !27, scopeLine: 356, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DILocalVariable(name: "fp_hash", scope: !220, file: !3, line: 357, type: !23)
!222 = !DILocation(line: 357, column: 13, scope: !220)
!223 = !DILocation(line: 357, column: 37, scope: !220)
!224 = !DILocation(line: 357, column: 23, scope: !220)
!225 = !DILocation(line: 358, column: 18, scope: !220)
!226 = !DILocation(line: 358, column: 31, scope: !220)
!227 = !DILocation(line: 358, column: 29, scope: !220)
!228 = !DILocation(line: 358, column: 5, scope: !220)
!229 = !DILocation(line: 358, column: 16, scope: !220)
!230 = !DILocation(line: 359, column: 1, scope: !220)
!231 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 377, type: !27, scopeLine: 378, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!232 = !DILocation(line: 379, column: 10, scope: !233)
!233 = distinct !DILexicalBlock(scope: !231, file: !3, line: 379, column: 9)
!234 = !DILocation(line: 379, column: 21, scope: !233)
!235 = !DILocation(line: 379, column: 9, scope: !231)
!236 = !DILocation(line: 380, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 379, column: 34)
!238 = !DILocation(line: 380, column: 21, scope: !237)
!239 = !DILocation(line: 381, column: 34, scope: !237)
!240 = !DILocation(line: 381, column: 9, scope: !237)
!241 = !DILocation(line: 381, column: 20, scope: !237)
!242 = !DILocation(line: 381, column: 32, scope: !237)
!243 = !DILocation(line: 382, column: 5, scope: !237)
!244 = !DILocation(line: 383, column: 14, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !3, line: 383, column: 13)
!246 = distinct !DILexicalBlock(scope: !233, file: !3, line: 382, column: 12)
!247 = !DILocation(line: 383, column: 25, scope: !245)
!248 = !DILocation(line: 383, column: 13, scope: !246)
!249 = !DILocation(line: 384, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !3, line: 383, column: 38)
!251 = !DILocation(line: 384, column: 25, scope: !250)
!252 = !DILocation(line: 385, column: 38, scope: !250)
!253 = !DILocation(line: 385, column: 13, scope: !250)
!254 = !DILocation(line: 385, column: 24, scope: !250)
!255 = !DILocation(line: 385, column: 36, scope: !250)
!256 = !DILocation(line: 386, column: 9, scope: !250)
!257 = !DILocalVariable(name: "fp_victim", scope: !258, file: !3, line: 387, type: !50)
!258 = distinct !DILexicalBlock(scope: !245, file: !3, line: 386, column: 16)
!259 = !DILocation(line: 387, column: 27, scope: !258)
!260 = !DILocalVariable(name: "index_victim", scope: !258, file: !3, line: 388, type: !23)
!261 = !DILocation(line: 388, column: 21, scope: !258)
!262 = !DILocation(line: 389, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !3, line: 389, column: 17)
!264 = !DILocation(line: 389, column: 24, scope: !263)
!265 = !DILocation(line: 389, column: 17, scope: !258)
!266 = !DILocation(line: 390, column: 32, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !3, line: 389, column: 29)
!268 = !DILocation(line: 390, column: 30, scope: !267)
!269 = !DILocation(line: 391, column: 29, scope: !267)
!270 = !DILocation(line: 391, column: 40, scope: !267)
!271 = !DILocation(line: 391, column: 27, scope: !267)
!272 = !DILocation(line: 392, column: 13, scope: !267)
!273 = !DILocation(line: 393, column: 32, scope: !274)
!274 = distinct !DILexicalBlock(scope: !263, file: !3, line: 392, column: 20)
!275 = !DILocation(line: 393, column: 30, scope: !274)
!276 = !DILocation(line: 394, column: 29, scope: !274)
!277 = !DILocation(line: 394, column: 40, scope: !274)
!278 = !DILocation(line: 394, column: 27, scope: !274)
!279 = !DILocation(line: 398, column: 40, scope: !258)
!280 = !DILocation(line: 398, column: 13, scope: !258)
!281 = !DILocation(line: 398, column: 24, scope: !258)
!282 = !DILocation(line: 398, column: 38, scope: !258)
!283 = !DILocation(line: 399, column: 26, scope: !258)
!284 = !DILocation(line: 399, column: 13, scope: !258)
!285 = !DILocation(line: 399, column: 24, scope: !258)
!286 = !DILocation(line: 400, column: 31, scope: !258)
!287 = !DILocation(line: 400, column: 13, scope: !258)
!288 = !DILocation(line: 400, column: 29, scope: !258)
!289 = !DILocation(line: 401, column: 13, scope: !258)
!290 = !DILocation(line: 401, column: 34, scope: !258)
!291 = !DILocation(line: 404, column: 1, scope: !231)
!292 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 423, type: !27, scopeLine: 424, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DILocalVariable(name: "fp_victim", scope: !292, file: !3, line: 425, type: !50)
!294 = !DILocation(line: 425, column: 19, scope: !292)
!295 = !DILocation(line: 425, column: 31, scope: !292)
!296 = !DILocalVariable(name: "fp_hash_victim", scope: !292, file: !3, line: 426, type: !23)
!297 = !DILocation(line: 426, column: 13, scope: !292)
!298 = !DILocation(line: 426, column: 44, scope: !292)
!299 = !DILocation(line: 426, column: 30, scope: !292)
!300 = !DILocalVariable(name: "index2_victim", scope: !292, file: !3, line: 427, type: !23)
!301 = !DILocation(line: 427, column: 13, scope: !292)
!302 = !DILocation(line: 427, column: 29, scope: !292)
!303 = !DILocation(line: 427, column: 42, scope: !292)
!304 = !DILocation(line: 427, column: 40, scope: !292)
!305 = !DILocation(line: 429, column: 20, scope: !292)
!306 = !DILocation(line: 429, column: 18, scope: !292)
!307 = !DILocation(line: 430, column: 9, scope: !292)
!308 = !DILocation(line: 431, column: 14, scope: !309)
!309 = distinct !DILexicalBlock(scope: !292, file: !3, line: 431, column: 13)
!310 = !DILocation(line: 431, column: 25, scope: !309)
!311 = !DILocation(line: 431, column: 13, scope: !292)
!312 = !DILocation(line: 432, column: 13, scope: !313)
!313 = distinct !DILexicalBlock(scope: !309, file: !3, line: 431, column: 41)
!314 = !DILocation(line: 432, column: 25, scope: !313)
!315 = !DILocation(line: 433, column: 41, scope: !313)
!316 = !DILocation(line: 433, column: 13, scope: !313)
!317 = !DILocation(line: 433, column: 24, scope: !313)
!318 = !DILocation(line: 433, column: 39, scope: !313)
!319 = !DILocation(line: 434, column: 13, scope: !313)
!320 = !DILocation(line: 438, column: 13, scope: !321)
!321 = distinct !DILexicalBlock(scope: !292, file: !3, line: 438, column: 13)
!322 = !DILocation(line: 438, column: 34, scope: !321)
!323 = !DILocation(line: 438, column: 13, scope: !292)
!324 = !DILocation(line: 439, column: 13, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !3, line: 438, column: 54)
!326 = !DILocation(line: 439, column: 25, scope: !325)
!327 = !DILocation(line: 440, column: 13, scope: !325)
!328 = !DILocation(line: 443, column: 11, scope: !292)
!329 = !DILocation(line: 443, column: 9, scope: !292)
!330 = !DILocation(line: 444, column: 22, scope: !292)
!331 = !DILocation(line: 444, column: 9, scope: !292)
!332 = !DILocation(line: 444, column: 20, scope: !292)
!333 = !DILocation(line: 445, column: 27, scope: !292)
!334 = !DILocation(line: 445, column: 38, scope: !292)
!335 = !DILocation(line: 445, column: 9, scope: !292)
!336 = !DILocation(line: 445, column: 25, scope: !292)
!337 = !DILocation(line: 446, column: 37, scope: !292)
!338 = !DILocation(line: 446, column: 9, scope: !292)
!339 = !DILocation(line: 446, column: 20, scope: !292)
!340 = !DILocation(line: 446, column: 35, scope: !292)
!341 = !DILocation(line: 447, column: 1, scope: !292)
!342 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 465, type: !27, scopeLine: 466, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!343 = !DILocation(line: 467, column: 7, scope: !342)
!344 = !DILocation(line: 467, column: 5, scope: !342)
!345 = !DILocation(line: 468, column: 27, scope: !342)
!346 = !DILocation(line: 468, column: 5, scope: !342)
!347 = !DILocation(line: 468, column: 24, scope: !342)
!348 = !DILocation(line: 470, column: 9, scope: !349)
!349 = distinct !DILexicalBlock(scope: !342, file: !3, line: 470, column: 9)
!350 = !DILocation(line: 470, column: 26, scope: !349)
!351 = !DILocation(line: 470, column: 9, scope: !342)
!352 = !DILocation(line: 471, column: 5, scope: !353)
!353 = distinct !DILexicalBlock(scope: !349, file: !3, line: 470, column: 41)
!354 = !DILocation(line: 472, column: 9, scope: !355)
!355 = distinct !DILexicalBlock(scope: !349, file: !3, line: 471, column: 12)
!356 = !DILocation(line: 472, column: 17, scope: !355)
!357 = !DILocation(line: 474, column: 1, scope: !342)
!358 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 492, type: !27, scopeLine: 493, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!359 = !DILocation(line: 494, column: 9, scope: !360)
!360 = distinct !DILexicalBlock(scope: !358, file: !3, line: 494, column: 9)
!361 = !DILocation(line: 494, column: 20, scope: !360)
!362 = !DILocation(line: 494, column: 35, scope: !360)
!363 = !DILocation(line: 494, column: 32, scope: !360)
!364 = !DILocation(line: 494, column: 9, scope: !358)
!365 = !DILocation(line: 495, column: 9, scope: !366)
!366 = distinct !DILexicalBlock(scope: !360, file: !3, line: 494, column: 52)
!367 = !DILocation(line: 495, column: 20, scope: !366)
!368 = !DILocation(line: 496, column: 5, scope: !366)
!369 = !DILocation(line: 497, column: 13, scope: !370)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 497, column: 13)
!371 = distinct !DILexicalBlock(scope: !360, file: !3, line: 496, column: 12)
!372 = !DILocation(line: 497, column: 24, scope: !370)
!373 = !DILocation(line: 497, column: 39, scope: !370)
!374 = !DILocation(line: 497, column: 36, scope: !370)
!375 = !DILocation(line: 497, column: 13, scope: !371)
!376 = !DILocation(line: 498, column: 13, scope: !377)
!377 = distinct !DILexicalBlock(scope: !370, file: !3, line: 497, column: 56)
!378 = !DILocation(line: 498, column: 24, scope: !377)
!379 = !DILocation(line: 499, column: 9, scope: !377)
!380 = !DILocation(line: 501, column: 13, scope: !381)
!381 = distinct !DILexicalBlock(scope: !370, file: !3, line: 500, column: 14)
!382 = !DILocation(line: 501, column: 24, scope: !381)
!383 = !DILocation(line: 505, column: 10, scope: !384)
!384 = distinct !DILexicalBlock(scope: !358, file: !3, line: 505, column: 9)
!385 = !DILocation(line: 505, column: 9, scope: !358)
!386 = !DILocation(line: 506, column: 5, scope: !387)
!387 = distinct !DILexicalBlock(scope: !384, file: !3, line: 505, column: 22)
!388 = !DILocation(line: 507, column: 1, scope: !358)
!389 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 525, type: !27, scopeLine: 526, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!390 = !DILocation(line: 527, column: 7, scope: !389)
!391 = !DILocation(line: 527, column: 5, scope: !389)
!392 = !DILocation(line: 529, column: 25, scope: !389)
!393 = !DILocation(line: 529, column: 5, scope: !389)
!394 = !DILocation(line: 529, column: 22, scope: !389)
!395 = !DILocation(line: 531, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !389, file: !3, line: 531, column: 9)
!397 = !DILocation(line: 531, column: 26, scope: !396)
!398 = !DILocation(line: 531, column: 9, scope: !389)
!399 = !DILocation(line: 532, column: 5, scope: !400)
!400 = distinct !DILexicalBlock(scope: !396, file: !3, line: 531, column: 41)
!401 = !DILocation(line: 534, column: 1, scope: !389)
!402 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 536, type: !27, scopeLine: 537, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!403 = !DILocation(line: 538, column: 5, scope: !402)
!404 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 541, type: !405, scopeLine: 541, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!405 = !DISubroutineType(types: !406)
!406 = !{!407}
!407 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!408 = !DILocation(line: 543, column: 16, scope: !404)
!409 = !DILocation(line: 544, column: 10, scope: !404)
!410 = !DILocation(line: 545, column: 12, scope: !404)
!411 = !DILocation(line: 546, column: 5, scope: !404)
!412 = !DILocation(line: 551, column: 5, scope: !404)
!413 = !DILocation(line: 555, column: 5, scope: !404)
!414 = !DILocation(line: 556, column: 14, scope: !404)
!415 = !DILocation(line: 556, column: 20, scope: !404)
!416 = !DILocation(line: 556, column: 5, scope: !404)
!417 = !DILocation(line: 556, column: 32, scope: !404)
!418 = !DILocation(line: 556, column: 40, scope: !404)
!419 = !DILocation(line: 559, column: 3, scope: !404)
!420 = !DILocation(line: 559, column: 9, scope: !404)
!421 = !DILocation(line: 559, column: 27, scope: !404)
!422 = !DILocation(line: 561, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !404, file: !3, line: 559, column: 42)
!424 = !DILocation(line: 562, column: 9, scope: !423)
!425 = !DILocation(line: 562, column: 9, scope: !426)
!426 = distinct !DILexicalBlock(scope: !427, file: !3, line: 562, column: 9)
!427 = distinct !DILexicalBlock(scope: !423, file: !3, line: 562, column: 9)
!428 = !DILocation(line: 562, column: 9, scope: !427)
!429 = !DILocation(line: 562, column: 9, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !3, line: 562, column: 9)
!431 = !DILocalVariable(name: "__x", scope: !432, file: !3, line: 562, type: !6)
!432 = distinct !DILexicalBlock(scope: !430, file: !3, line: 562, column: 9)
!433 = !DILocation(line: 562, column: 9, scope: !432)
!434 = !{i32 -2146582880}
!435 = !DILocalVariable(name: "__x", scope: !436, file: !3, line: 562, type: !6)
!436 = distinct !DILexicalBlock(scope: !430, file: !3, line: 562, column: 9)
!437 = !DILocation(line: 562, column: 9, scope: !436)
!438 = !{i32 -2146582755}
!439 = !DILocation(line: 562, column: 9, scope: !440)
!440 = distinct !DILexicalBlock(scope: !426, file: !3, line: 562, column: 9)
!441 = !DILocalVariable(name: "__x", scope: !442, file: !3, line: 562, type: !6)
!442 = distinct !DILexicalBlock(scope: !440, file: !3, line: 562, column: 9)
!443 = !DILocation(line: 562, column: 9, scope: !442)
!444 = !{i32 -2146582623}
!445 = !DILocalVariable(name: "__x", scope: !446, file: !3, line: 562, type: !6)
!446 = distinct !DILexicalBlock(scope: !440, file: !3, line: 562, column: 9)
!447 = !DILocation(line: 562, column: 9, scope: !446)
!448 = !{i32 -2146582498}
!449 = !DILocation(line: 566, column: 9, scope: !423)
!450 = !DILocation(line: 567, column: 9, scope: !423)
!451 = !DILocation(line: 567, column: 9, scope: !452)
!452 = distinct !DILexicalBlock(scope: !453, file: !3, line: 567, column: 9)
!453 = distinct !DILexicalBlock(scope: !423, file: !3, line: 567, column: 9)
!454 = !DILocation(line: 567, column: 9, scope: !453)
!455 = !DILocation(line: 567, column: 9, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !3, line: 567, column: 9)
!457 = !DILocalVariable(name: "__x", scope: !458, file: !3, line: 567, type: !6)
!458 = distinct !DILexicalBlock(scope: !456, file: !3, line: 567, column: 9)
!459 = !DILocation(line: 567, column: 9, scope: !458)
!460 = !{i32 -2146580374}
!461 = !DILocalVariable(name: "__x", scope: !462, file: !3, line: 567, type: !6)
!462 = distinct !DILexicalBlock(scope: !456, file: !3, line: 567, column: 9)
!463 = !DILocation(line: 567, column: 9, scope: !462)
!464 = !{i32 -2146580249}
!465 = !DILocation(line: 567, column: 9, scope: !466)
!466 = distinct !DILexicalBlock(scope: !452, file: !3, line: 567, column: 9)
!467 = !DILocalVariable(name: "__x", scope: !468, file: !3, line: 567, type: !6)
!468 = distinct !DILexicalBlock(scope: !466, file: !3, line: 567, column: 9)
!469 = !DILocation(line: 567, column: 9, scope: !468)
!470 = !{i32 -2146580117}
!471 = !DILocalVariable(name: "__x", scope: !472, file: !3, line: 567, type: !6)
!472 = distinct !DILexicalBlock(scope: !466, file: !3, line: 567, column: 9)
!473 = !DILocation(line: 567, column: 9, scope: !472)
!474 = !{i32 -2146579992}
!475 = !DILocation(line: 571, column: 9, scope: !423)
!476 = !DILocation(line: 572, column: 9, scope: !423)
!477 = !DILocation(line: 572, column: 9, scope: !478)
!478 = distinct !DILexicalBlock(scope: !479, file: !3, line: 572, column: 9)
!479 = distinct !DILexicalBlock(scope: !423, file: !3, line: 572, column: 9)
!480 = !DILocation(line: 572, column: 9, scope: !479)
!481 = !DILocation(line: 572, column: 9, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !3, line: 572, column: 9)
!483 = !DILocalVariable(name: "__x", scope: !484, file: !3, line: 572, type: !6)
!484 = distinct !DILexicalBlock(scope: !482, file: !3, line: 572, column: 9)
!485 = !DILocation(line: 572, column: 9, scope: !484)
!486 = !{i32 -2146577868}
!487 = !DILocalVariable(name: "__x", scope: !488, file: !3, line: 572, type: !6)
!488 = distinct !DILexicalBlock(scope: !482, file: !3, line: 572, column: 9)
!489 = !DILocation(line: 572, column: 9, scope: !488)
!490 = !{i32 -2146577743}
!491 = !DILocation(line: 572, column: 9, scope: !492)
!492 = distinct !DILexicalBlock(scope: !478, file: !3, line: 572, column: 9)
!493 = !DILocalVariable(name: "__x", scope: !494, file: !3, line: 572, type: !6)
!494 = distinct !DILexicalBlock(scope: !492, file: !3, line: 572, column: 9)
!495 = !DILocation(line: 572, column: 9, scope: !494)
!496 = !{i32 -2146577611}
!497 = !DILocalVariable(name: "__x", scope: !498, file: !3, line: 572, type: !6)
!498 = distinct !DILexicalBlock(scope: !492, file: !3, line: 572, column: 9)
!499 = !DILocation(line: 572, column: 9, scope: !498)
!500 = !{i32 -2146577486}
!501 = !DILocation(line: 576, column: 9, scope: !423)
!502 = !DILocation(line: 577, column: 9, scope: !423)
!503 = !DILocation(line: 577, column: 9, scope: !504)
!504 = distinct !DILexicalBlock(scope: !505, file: !3, line: 577, column: 9)
!505 = distinct !DILexicalBlock(scope: !423, file: !3, line: 577, column: 9)
!506 = !DILocation(line: 577, column: 9, scope: !505)
!507 = !DILocation(line: 577, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !3, line: 577, column: 9)
!509 = !DILocalVariable(name: "__x", scope: !510, file: !3, line: 577, type: !6)
!510 = distinct !DILexicalBlock(scope: !508, file: !3, line: 577, column: 9)
!511 = !DILocation(line: 577, column: 9, scope: !510)
!512 = !{i32 -2146575362}
!513 = !DILocalVariable(name: "__x", scope: !514, file: !3, line: 577, type: !6)
!514 = distinct !DILexicalBlock(scope: !508, file: !3, line: 577, column: 9)
!515 = !DILocation(line: 577, column: 9, scope: !514)
!516 = !{i32 -2146575237}
!517 = !DILocation(line: 577, column: 9, scope: !518)
!518 = distinct !DILexicalBlock(scope: !504, file: !3, line: 577, column: 9)
!519 = !DILocalVariable(name: "__x", scope: !520, file: !3, line: 577, type: !6)
!520 = distinct !DILexicalBlock(scope: !518, file: !3, line: 577, column: 9)
!521 = !DILocation(line: 577, column: 9, scope: !520)
!522 = !{i32 -2146575105}
!523 = !DILocalVariable(name: "__x", scope: !524, file: !3, line: 577, type: !6)
!524 = distinct !DILexicalBlock(scope: !518, file: !3, line: 577, column: 9)
!525 = !DILocation(line: 577, column: 9, scope: !524)
!526 = !{i32 -2146574980}
!527 = !DILocation(line: 580, column: 12, scope: !528)
!528 = distinct !DILexicalBlock(scope: !423, file: !3, line: 580, column: 12)
!529 = !DILocation(line: 580, column: 30, scope: !528)
!530 = !DILocation(line: 580, column: 12, scope: !423)
!531 = !DILocation(line: 582, column: 13, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !3, line: 580, column: 45)
!533 = !DILocation(line: 583, column: 13, scope: !532)
!534 = !DILocation(line: 583, column: 13, scope: !535)
!535 = distinct !DILexicalBlock(scope: !536, file: !3, line: 583, column: 13)
!536 = distinct !DILexicalBlock(scope: !532, file: !3, line: 583, column: 13)
!537 = !DILocation(line: 583, column: 13, scope: !536)
!538 = !DILocation(line: 583, column: 13, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !3, line: 583, column: 13)
!540 = !DILocalVariable(name: "__x", scope: !541, file: !3, line: 583, type: !6)
!541 = distinct !DILexicalBlock(scope: !539, file: !3, line: 583, column: 13)
!542 = !DILocation(line: 583, column: 13, scope: !541)
!543 = !{i32 -2146572805}
!544 = !DILocalVariable(name: "__x", scope: !545, file: !3, line: 583, type: !6)
!545 = distinct !DILexicalBlock(scope: !539, file: !3, line: 583, column: 13)
!546 = !DILocation(line: 583, column: 13, scope: !545)
!547 = !{i32 -2146572680}
!548 = !DILocation(line: 583, column: 13, scope: !549)
!549 = distinct !DILexicalBlock(scope: !535, file: !3, line: 583, column: 13)
!550 = !DILocalVariable(name: "__x", scope: !551, file: !3, line: 583, type: !6)
!551 = distinct !DILexicalBlock(scope: !549, file: !3, line: 583, column: 13)
!552 = !DILocation(line: 583, column: 13, scope: !551)
!553 = !{i32 -2146572548}
!554 = !DILocalVariable(name: "__x", scope: !555, file: !3, line: 583, type: !6)
!555 = distinct !DILexicalBlock(scope: !549, file: !3, line: 583, column: 13)
!556 = !DILocation(line: 583, column: 13, scope: !555)
!557 = !{i32 -2146572423}
!558 = !DILocation(line: 586, column: 16, scope: !559)
!559 = distinct !DILexicalBlock(scope: !532, file: !3, line: 586, column: 16)
!560 = !DILocation(line: 586, column: 28, scope: !559)
!561 = !DILocation(line: 586, column: 41, scope: !559)
!562 = !DILocation(line: 586, column: 44, scope: !559)
!563 = !DILocation(line: 586, column: 56, scope: !559)
!564 = !DILocation(line: 586, column: 16, scope: !532)
!565 = !DILocation(line: 587, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !559, file: !3, line: 586, column: 70)
!567 = !DILocation(line: 587, column: 23, scope: !566)
!568 = !DILocation(line: 587, column: 36, scope: !566)
!569 = !DILocation(line: 587, column: 45, scope: !566)
!570 = !DILocation(line: 587, column: 49, scope: !566)
!571 = !DILocation(line: 587, column: 71, scope: !566)
!572 = !DILocation(line: 0, scope: !566)
!573 = !DILocation(line: 589, column: 21, scope: !574)
!574 = distinct !DILexicalBlock(scope: !566, file: !3, line: 587, column: 91)
!575 = !DILocation(line: 590, column: 21, scope: !574)
!576 = !DILocation(line: 590, column: 21, scope: !577)
!577 = distinct !DILexicalBlock(scope: !578, file: !3, line: 590, column: 21)
!578 = distinct !DILexicalBlock(scope: !574, file: !3, line: 590, column: 21)
!579 = !DILocation(line: 590, column: 21, scope: !578)
!580 = !DILocation(line: 590, column: 21, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !3, line: 590, column: 21)
!582 = !DILocalVariable(name: "__x", scope: !583, file: !3, line: 590, type: !6)
!583 = distinct !DILexicalBlock(scope: !581, file: !3, line: 590, column: 21)
!584 = !DILocation(line: 590, column: 21, scope: !583)
!585 = !{i32 -2146570146}
!586 = !DILocalVariable(name: "__x", scope: !587, file: !3, line: 590, type: !6)
!587 = distinct !DILexicalBlock(scope: !581, file: !3, line: 590, column: 21)
!588 = !DILocation(line: 590, column: 21, scope: !587)
!589 = !{i32 -2146570021}
!590 = !DILocation(line: 590, column: 21, scope: !591)
!591 = distinct !DILexicalBlock(scope: !577, file: !3, line: 590, column: 21)
!592 = !DILocalVariable(name: "__x", scope: !593, file: !3, line: 590, type: !6)
!593 = distinct !DILexicalBlock(scope: !591, file: !3, line: 590, column: 21)
!594 = !DILocation(line: 590, column: 21, scope: !593)
!595 = !{i32 -2146569889}
!596 = !DILocalVariable(name: "__x", scope: !597, file: !3, line: 590, type: !6)
!597 = distinct !DILexicalBlock(scope: !591, file: !3, line: 590, column: 21)
!598 = !DILocation(line: 590, column: 21, scope: !597)
!599 = !{i32 -2146569764}
!600 = distinct !{!600, !565, !601}
!601 = !DILocation(line: 592, column: 17, scope: !566)
!602 = !DILocation(line: 593, column: 13, scope: !566)
!603 = !DILocation(line: 596, column: 13, scope: !532)
!604 = !DILocation(line: 597, column: 13, scope: !532)
!605 = !DILocation(line: 597, column: 13, scope: !606)
!606 = distinct !DILexicalBlock(scope: !607, file: !3, line: 597, column: 13)
!607 = distinct !DILexicalBlock(scope: !532, file: !3, line: 597, column: 13)
!608 = !DILocation(line: 597, column: 13, scope: !607)
!609 = !DILocation(line: 597, column: 13, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !3, line: 597, column: 13)
!611 = !DILocalVariable(name: "__x", scope: !612, file: !3, line: 597, type: !6)
!612 = distinct !DILexicalBlock(scope: !610, file: !3, line: 597, column: 13)
!613 = !DILocation(line: 597, column: 13, scope: !612)
!614 = !{i32 -2146567640}
!615 = !DILocalVariable(name: "__x", scope: !616, file: !3, line: 597, type: !6)
!616 = distinct !DILexicalBlock(scope: !610, file: !3, line: 597, column: 13)
!617 = !DILocation(line: 597, column: 13, scope: !616)
!618 = !{i32 -2146567515}
!619 = !DILocation(line: 597, column: 13, scope: !620)
!620 = distinct !DILexicalBlock(scope: !606, file: !3, line: 597, column: 13)
!621 = !DILocalVariable(name: "__x", scope: !622, file: !3, line: 597, type: !6)
!622 = distinct !DILexicalBlock(scope: !620, file: !3, line: 597, column: 13)
!623 = !DILocation(line: 597, column: 13, scope: !622)
!624 = !{i32 -2146567383}
!625 = !DILocalVariable(name: "__x", scope: !626, file: !3, line: 597, type: !6)
!626 = distinct !DILexicalBlock(scope: !620, file: !3, line: 597, column: 13)
!627 = !DILocation(line: 597, column: 13, scope: !626)
!628 = !{i32 -2146567258}
!629 = !DILocation(line: 599, column: 9, scope: !532)
!630 = !DILocation(line: 601, column: 13, scope: !631)
!631 = distinct !DILexicalBlock(scope: !528, file: !3, line: 599, column: 16)
!632 = !DILocation(line: 602, column: 13, scope: !631)
!633 = !DILocation(line: 602, column: 13, scope: !634)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 602, column: 13)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 602, column: 13)
!636 = !DILocation(line: 602, column: 13, scope: !635)
!637 = !DILocation(line: 602, column: 13, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !3, line: 602, column: 13)
!639 = !DILocalVariable(name: "__x", scope: !640, file: !3, line: 602, type: !6)
!640 = distinct !DILexicalBlock(scope: !638, file: !3, line: 602, column: 13)
!641 = !DILocation(line: 602, column: 13, scope: !640)
!642 = !{i32 -2146565134}
!643 = !DILocalVariable(name: "__x", scope: !644, file: !3, line: 602, type: !6)
!644 = distinct !DILexicalBlock(scope: !638, file: !3, line: 602, column: 13)
!645 = !DILocation(line: 602, column: 13, scope: !644)
!646 = !{i32 -2146565009}
!647 = !DILocation(line: 602, column: 13, scope: !648)
!648 = distinct !DILexicalBlock(scope: !634, file: !3, line: 602, column: 13)
!649 = !DILocalVariable(name: "__x", scope: !650, file: !3, line: 602, type: !6)
!650 = distinct !DILexicalBlock(scope: !648, file: !3, line: 602, column: 13)
!651 = !DILocation(line: 602, column: 13, scope: !650)
!652 = !{i32 -2146564877}
!653 = !DILocalVariable(name: "__x", scope: !654, file: !3, line: 602, type: !6)
!654 = distinct !DILexicalBlock(scope: !648, file: !3, line: 602, column: 13)
!655 = !DILocation(line: 602, column: 13, scope: !654)
!656 = !{i32 -2146564752}
!657 = !DILocation(line: 606, column: 13, scope: !631)
!658 = !DILocation(line: 607, column: 13, scope: !631)
!659 = !DILocation(line: 607, column: 13, scope: !660)
!660 = distinct !DILexicalBlock(scope: !661, file: !3, line: 607, column: 13)
!661 = distinct !DILexicalBlock(scope: !631, file: !3, line: 607, column: 13)
!662 = !DILocation(line: 607, column: 13, scope: !661)
!663 = !DILocation(line: 607, column: 13, scope: !664)
!664 = distinct !DILexicalBlock(scope: !660, file: !3, line: 607, column: 13)
!665 = !DILocalVariable(name: "__x", scope: !666, file: !3, line: 607, type: !6)
!666 = distinct !DILexicalBlock(scope: !664, file: !3, line: 607, column: 13)
!667 = !DILocation(line: 607, column: 13, scope: !666)
!668 = !{i32 -2146562628}
!669 = !DILocalVariable(name: "__x", scope: !670, file: !3, line: 607, type: !6)
!670 = distinct !DILexicalBlock(scope: !664, file: !3, line: 607, column: 13)
!671 = !DILocation(line: 607, column: 13, scope: !670)
!672 = !{i32 -2146562503}
!673 = !DILocation(line: 607, column: 13, scope: !674)
!674 = distinct !DILexicalBlock(scope: !660, file: !3, line: 607, column: 13)
!675 = !DILocalVariable(name: "__x", scope: !676, file: !3, line: 607, type: !6)
!676 = distinct !DILexicalBlock(scope: !674, file: !3, line: 607, column: 13)
!677 = !DILocation(line: 607, column: 13, scope: !676)
!678 = !{i32 -2146562371}
!679 = !DILocalVariable(name: "__x", scope: !680, file: !3, line: 607, type: !6)
!680 = distinct !DILexicalBlock(scope: !674, file: !3, line: 607, column: 13)
!681 = !DILocation(line: 607, column: 13, scope: !680)
!682 = !{i32 -2146562246}
!683 = distinct !{!683, !419, !684}
!684 = !DILocation(line: 610, column: 5, scope: !404)
!685 = !DILocation(line: 612, column: 5, scope: !404)
!686 = !DILocation(line: 613, column: 1, scope: !404)
!687 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 222, type: !688, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!688 = !DISubroutineType(types: !689)
!689 = !{!213, !7, !6}
!690 = !DILocalVariable(name: "data", arg: 1, scope: !687, file: !3, line: 222, type: !7)
!691 = !DILocation(line: 222, column: 33, scope: !687)
!692 = !DILocalVariable(name: "len", arg: 2, scope: !687, file: !3, line: 222, type: !6)
!693 = !DILocation(line: 222, column: 48, scope: !687)
!694 = !DILocalVariable(name: "hash", scope: !687, file: !3, line: 224, type: !18)
!695 = !DILocation(line: 224, column: 14, scope: !687)
!696 = !DILocalVariable(name: "i", scope: !687, file: !3, line: 225, type: !6)
!697 = !DILocation(line: 225, column: 18, scope: !687)
!698 = !DILocation(line: 227, column: 11, scope: !699)
!699 = distinct !DILexicalBlock(scope: !687, file: !3, line: 227, column: 5)
!700 = !DILocation(line: 227, column: 9, scope: !699)
!701 = !DILocation(line: 227, column: 16, scope: !702)
!702 = distinct !DILexicalBlock(scope: !699, file: !3, line: 227, column: 5)
!703 = !DILocation(line: 227, column: 20, scope: !702)
!704 = !DILocation(line: 227, column: 18, scope: !702)
!705 = !DILocation(line: 227, column: 5, scope: !699)
!706 = !DILocation(line: 228, column: 18, scope: !702)
!707 = !DILocation(line: 228, column: 23, scope: !702)
!708 = !DILocation(line: 228, column: 31, scope: !702)
!709 = !DILocation(line: 228, column: 29, scope: !702)
!710 = !DILocation(line: 228, column: 41, scope: !702)
!711 = !DILocation(line: 228, column: 40, scope: !702)
!712 = !DILocation(line: 228, column: 39, scope: !702)
!713 = !DILocation(line: 228, column: 37, scope: !702)
!714 = !DILocation(line: 228, column: 14, scope: !702)
!715 = !DILocation(line: 228, column: 9, scope: !702)
!716 = !DILocation(line: 227, column: 29, scope: !702)
!717 = !DILocation(line: 227, column: 34, scope: !702)
!718 = !DILocation(line: 227, column: 5, scope: !702)
!719 = distinct !{!719, !705, !720}
!720 = !DILocation(line: 228, column: 45, scope: !699)
!721 = !DILocation(line: 231, column: 12, scope: !687)
!722 = !DILocation(line: 231, column: 5, scope: !687)
