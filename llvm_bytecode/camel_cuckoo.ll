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
  %__x11 = alloca i16, align 2
  %tmp12 = alloca i16, align 2
  %__x17 = alloca i16, align 2
  %tmp18 = alloca i16, align 2
  %__x20 = alloca i16, align 2
  %tmp21 = alloca i16, align 2
  %__x32 = alloca i16, align 2
  %tmp33 = alloca i16, align 2
  %__x35 = alloca i16, align 2
  %tmp36 = alloca i16, align 2
  %__x45 = alloca i16, align 2
  %tmp46 = alloca i16, align 2
  %__x48 = alloca i16, align 2
  %tmp49 = alloca i16, align 2
  %__x62 = alloca i16, align 2
  %tmp63 = alloca i16, align 2
  %__x65 = alloca i16, align 2
  %tmp66 = alloca i16, align 2
  %__x75 = alloca i16, align 2
  %tmp76 = alloca i16, align 2
  %__x78 = alloca i16, align 2
  %tmp79 = alloca i16, align 2
  %__x92 = alloca i16, align 2
  %tmp93 = alloca i16, align 2
  %__x95 = alloca i16, align 2
  %tmp96 = alloca i16, align 2
  %__x105 = alloca i16, align 2
  %tmp106 = alloca i16, align 2
  %__x108 = alloca i16, align 2
  %tmp109 = alloca i16, align 2
  %__x125 = alloca i16, align 2
  %tmp126 = alloca i16, align 2
  %__x128 = alloca i16, align 2
  %tmp129 = alloca i16, align 2
  %__x138 = alloca i16, align 2
  %tmp139 = alloca i16, align 2
  %__x141 = alloca i16, align 2
  %tmp142 = alloca i16, align 2
  %__x175 = alloca i16, align 2
  %tmp176 = alloca i16, align 2
  %__x178 = alloca i16, align 2
  %tmp179 = alloca i16, align 2
  %__x188 = alloca i16, align 2
  %tmp189 = alloca i16, align 2
  %__x191 = alloca i16, align 2
  %tmp192 = alloca i16, align 2
  %__x207 = alloca i16, align 2
  %tmp208 = alloca i16, align 2
  %__x210 = alloca i16, align 2
  %tmp211 = alloca i16, align 2
  %__x220 = alloca i16, align 2
  %tmp221 = alloca i16, align 2
  %__x223 = alloca i16, align 2
  %tmp224 = alloca i16, align 2
  %__x239 = alloca i16, align 2
  %tmp240 = alloca i16, align 2
  %__x242 = alloca i16, align 2
  %tmp243 = alloca i16, align 2
  %__x252 = alloca i16, align 2
  %tmp253 = alloca i16, align 2
  %__x255 = alloca i16, align 2
  %tmp256 = alloca i16, align 2
  %__x270 = alloca i16, align 2
  %tmp271 = alloca i16, align 2
  %__x273 = alloca i16, align 2
  %tmp274 = alloca i16, align 2
  %__x283 = alloca i16, align 2
  %tmp284 = alloca i16, align 2
  %__x286 = alloca i16, align 2
  %tmp287 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !408
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !410
  call void @camel_init(), !dbg !411
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !412
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !412
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !412
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !412
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !412
  %2 = load i16, i16* %key, align 2, !dbg !412
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !412
  %3 = load i16, i16* %arrayidx, align 2, !dbg !412
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !412
  %filter3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !412
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !412
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !412
  %key5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !412
  %6 = load i16, i16* %key5, align 2, !dbg !412
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter3, i16 0, i16 %6, !dbg !412
  store i16 %3, i16* %arrayidx6, align 2, !dbg !412
  call void @task_init(), !dbg !413
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !414
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !415
  %8 = bitcast %struct.camel_global_t* %globals7 to i8*, !dbg !416
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !418
  %10 = bitcast %struct.camel_global_t* %globals8 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %8, i8* align 2 %10, i16 276, i1 false), !dbg !416
  br label %while.cond, !dbg !419

while.cond:                                       ; preds = %if.end295, %entry
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !420
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !420
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 8, !dbg !420
  %12 = load i16, i16* %lookup_count, align 2, !dbg !420
  %cmp = icmp ult i16 %12, 32, !dbg !421
  br i1 %cmp, label %while.body, label %while.end296, !dbg !419

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !422
  br label %do.body, !dbg !424

do.body:                                          ; preds = %while.body
  %13 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !425
  %cmp10 = icmp eq i16 %13, 1, !dbg !425
  br i1 %cmp10, label %if.then, label %if.else, !dbg !428

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !429
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !429
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !429
  call void @__dump_registers(i16* %arraydecay), !dbg !429
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !431, metadata !DIExpression()), !dbg !433
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !433, !srcloc !434
  store i16 %15, i16* %__x, align 2, !dbg !433
  %16 = load i16, i16* %__x, align 2, !dbg !433
  store i16 %16, i16* %tmp, align 2, !dbg !433
  %17 = load i16, i16* %tmp, align 2, !dbg !433
  %add = add i16 %17, 2, !dbg !429
  %18 = inttoptr i16 %add to i8*, !dbg !429
  call void @llvm.dbg.declare(metadata i16* %__x11, metadata !435, metadata !DIExpression()), !dbg !437
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !437, !srcloc !438
  store i16 %19, i16* %__x11, align 2, !dbg !437
  %20 = load i16, i16* %__x11, align 2, !dbg !437
  store i16 %20, i16* %tmp12, align 2, !dbg !437
  %21 = load i16, i16* %tmp12, align 2, !dbg !437
  %add13 = add i16 %21, 2, !dbg !429
  %sub = sub i16 9216, %add13, !dbg !429
  %call = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub, i16 zeroext -1), !dbg !429
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !429
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !429
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !429
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 298, i16 zeroext %24), !dbg !429
  store i16 %call14, i16* @tmp_stack_buf_crc, align 2, !dbg !429
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !429
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !429
  store i16 %25, i16* %stack_and_buf_crc, align 2, !dbg !429
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !429
  br label %if.end, !dbg !429

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !439
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !439
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %reg_file15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 0, !dbg !439
  %arraydecay16 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file15, i16 0, i16 0, !dbg !439
  call void @__dump_registers(i16* %arraydecay16), !dbg !439
  call void @llvm.dbg.declare(metadata i16* %__x17, metadata !441, metadata !DIExpression()), !dbg !443
  %28 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !443, !srcloc !444
  store i16 %28, i16* %__x17, align 2, !dbg !443
  %29 = load i16, i16* %__x17, align 2, !dbg !443
  store i16 %29, i16* %tmp18, align 2, !dbg !443
  %30 = load i16, i16* %tmp18, align 2, !dbg !443
  %add19 = add i16 %30, 2, !dbg !439
  %31 = inttoptr i16 %add19 to i8*, !dbg !439
  call void @llvm.dbg.declare(metadata i16* %__x20, metadata !445, metadata !DIExpression()), !dbg !447
  %32 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !447, !srcloc !448
  store i16 %32, i16* %__x20, align 2, !dbg !447
  %33 = load i16, i16* %__x20, align 2, !dbg !447
  store i16 %33, i16* %tmp21, align 2, !dbg !447
  %34 = load i16, i16* %tmp21, align 2, !dbg !447
  %add22 = add i16 %34, 2, !dbg !439
  %sub23 = sub i16 9216, %add22, !dbg !439
  %call24 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext %sub23, i16 zeroext -1), !dbg !439
  store i16 %call24, i16* @tmp_stack_crc, align 2, !dbg !439
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %36 = bitcast %struct.camel_buffer_t* %35 to i8*, !dbg !439
  %37 = load i16, i16* @tmp_stack_crc, align 2, !dbg !439
  %call25 = call zeroext i16 @__fast_hw_crc(i8* %36, i16 zeroext 298, i16 zeroext %37), !dbg !439
  store i16 %call25, i16* @tmp_stack_buf_crc, align 2, !dbg !439
  %38 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !439
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !439
  %stack_and_buf_crc26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 2, !dbg !439
  store i16 %38, i16* %stack_and_buf_crc26, align 2, !dbg !439
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !439
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !428

do.end:                                           ; preds = %if.end
  call void @task_calc_indexes(), !dbg !449
  br label %do.body27, !dbg !450

do.body27:                                        ; preds = %do.end
  %40 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !451
  %cmp28 = icmp eq i16 %40, 1, !dbg !451
  br i1 %cmp28, label %if.then29, label %if.else42, !dbg !454

if.then29:                                        ; preds = %do.body27
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !455
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !455
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %reg_file30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 0, !dbg !455
  %arraydecay31 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file30, i16 0, i16 0, !dbg !455
  call void @__dump_registers(i16* %arraydecay31), !dbg !455
  call void @llvm.dbg.declare(metadata i16* %__x32, metadata !457, metadata !DIExpression()), !dbg !459
  %42 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !459, !srcloc !460
  store i16 %42, i16* %__x32, align 2, !dbg !459
  %43 = load i16, i16* %__x32, align 2, !dbg !459
  store i16 %43, i16* %tmp33, align 2, !dbg !459
  %44 = load i16, i16* %tmp33, align 2, !dbg !459
  %add34 = add i16 %44, 2, !dbg !455
  %45 = inttoptr i16 %add34 to i8*, !dbg !455
  call void @llvm.dbg.declare(metadata i16* %__x35, metadata !461, metadata !DIExpression()), !dbg !463
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !463, !srcloc !464
  store i16 %46, i16* %__x35, align 2, !dbg !463
  %47 = load i16, i16* %__x35, align 2, !dbg !463
  store i16 %47, i16* %tmp36, align 2, !dbg !463
  %48 = load i16, i16* %tmp36, align 2, !dbg !463
  %add37 = add i16 %48, 2, !dbg !455
  %sub38 = sub i16 9216, %add37, !dbg !455
  %call39 = call zeroext i16 @__fast_hw_crc(i8* %45, i16 zeroext %sub38, i16 zeroext -1), !dbg !455
  store i16 %call39, i16* @tmp_stack_crc, align 2, !dbg !455
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %50 = bitcast %struct.camel_buffer_t* %49 to i8*, !dbg !455
  %51 = load i16, i16* @tmp_stack_crc, align 2, !dbg !455
  %call40 = call zeroext i16 @__fast_hw_crc(i8* %50, i16 zeroext 298, i16 zeroext %51), !dbg !455
  store i16 %call40, i16* @tmp_stack_buf_crc, align 2, !dbg !455
  %52 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !455
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %stack_and_buf_crc41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 2, !dbg !455
  store i16 %52, i16* %stack_and_buf_crc41, align 2, !dbg !455
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !455
  br label %if.end55, !dbg !455

if.else42:                                        ; preds = %do.body27
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !465
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %54 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %reg_file43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %54, i32 0, i32 0, !dbg !465
  %arraydecay44 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file43, i16 0, i16 0, !dbg !465
  call void @__dump_registers(i16* %arraydecay44), !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x45, metadata !467, metadata !DIExpression()), !dbg !469
  %55 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !469, !srcloc !470
  store i16 %55, i16* %__x45, align 2, !dbg !469
  %56 = load i16, i16* %__x45, align 2, !dbg !469
  store i16 %56, i16* %tmp46, align 2, !dbg !469
  %57 = load i16, i16* %tmp46, align 2, !dbg !469
  %add47 = add i16 %57, 2, !dbg !465
  %58 = inttoptr i16 %add47 to i8*, !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x48, metadata !471, metadata !DIExpression()), !dbg !473
  %59 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !473, !srcloc !474
  store i16 %59, i16* %__x48, align 2, !dbg !473
  %60 = load i16, i16* %__x48, align 2, !dbg !473
  store i16 %60, i16* %tmp49, align 2, !dbg !473
  %61 = load i16, i16* %tmp49, align 2, !dbg !473
  %add50 = add i16 %61, 2, !dbg !465
  %sub51 = sub i16 9216, %add50, !dbg !465
  %call52 = call zeroext i16 @__fast_hw_crc(i8* %58, i16 zeroext %sub51, i16 zeroext -1), !dbg !465
  store i16 %call52, i16* @tmp_stack_crc, align 2, !dbg !465
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %63 = bitcast %struct.camel_buffer_t* %62 to i8*, !dbg !465
  %64 = load i16, i16* @tmp_stack_crc, align 2, !dbg !465
  %call53 = call zeroext i16 @__fast_hw_crc(i8* %63, i16 zeroext 298, i16 zeroext %64), !dbg !465
  store i16 %call53, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %65 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %stack_and_buf_crc54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 2, !dbg !465
  store i16 %65, i16* %stack_and_buf_crc54, align 2, !dbg !465
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !465
  br label %if.end55

if.end55:                                         ; preds = %if.else42, %if.then29
  br label %do.end56, !dbg !454

do.end56:                                         ; preds = %if.end55
  call void @task_calc_indexes_index_1(), !dbg !475
  br label %do.body57, !dbg !476

do.body57:                                        ; preds = %do.end56
  %67 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !477
  %cmp58 = icmp eq i16 %67, 1, !dbg !477
  br i1 %cmp58, label %if.then59, label %if.else72, !dbg !480

if.then59:                                        ; preds = %do.body57
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !481
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !481
  %68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %reg_file60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %68, i32 0, i32 0, !dbg !481
  %arraydecay61 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file60, i16 0, i16 0, !dbg !481
  call void @__dump_registers(i16* %arraydecay61), !dbg !481
  call void @llvm.dbg.declare(metadata i16* %__x62, metadata !483, metadata !DIExpression()), !dbg !485
  %69 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !485, !srcloc !486
  store i16 %69, i16* %__x62, align 2, !dbg !485
  %70 = load i16, i16* %__x62, align 2, !dbg !485
  store i16 %70, i16* %tmp63, align 2, !dbg !485
  %71 = load i16, i16* %tmp63, align 2, !dbg !485
  %add64 = add i16 %71, 2, !dbg !481
  %72 = inttoptr i16 %add64 to i8*, !dbg !481
  call void @llvm.dbg.declare(metadata i16* %__x65, metadata !487, metadata !DIExpression()), !dbg !489
  %73 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !489, !srcloc !490
  store i16 %73, i16* %__x65, align 2, !dbg !489
  %74 = load i16, i16* %__x65, align 2, !dbg !489
  store i16 %74, i16* %tmp66, align 2, !dbg !489
  %75 = load i16, i16* %tmp66, align 2, !dbg !489
  %add67 = add i16 %75, 2, !dbg !481
  %sub68 = sub i16 9216, %add67, !dbg !481
  %call69 = call zeroext i16 @__fast_hw_crc(i8* %72, i16 zeroext %sub68, i16 zeroext -1), !dbg !481
  store i16 %call69, i16* @tmp_stack_crc, align 2, !dbg !481
  %76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %77 = bitcast %struct.camel_buffer_t* %76 to i8*, !dbg !481
  %78 = load i16, i16* @tmp_stack_crc, align 2, !dbg !481
  %call70 = call zeroext i16 @__fast_hw_crc(i8* %77, i16 zeroext 298, i16 zeroext %78), !dbg !481
  store i16 %call70, i16* @tmp_stack_buf_crc, align 2, !dbg !481
  %79 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !481
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %stack_and_buf_crc71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 2, !dbg !481
  store i16 %79, i16* %stack_and_buf_crc71, align 2, !dbg !481
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !481
  br label %if.end85, !dbg !481

if.else72:                                        ; preds = %do.body57
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !491
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !491
  %81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %reg_file73 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %81, i32 0, i32 0, !dbg !491
  %arraydecay74 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file73, i16 0, i16 0, !dbg !491
  call void @__dump_registers(i16* %arraydecay74), !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x75, metadata !493, metadata !DIExpression()), !dbg !495
  %82 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !495, !srcloc !496
  store i16 %82, i16* %__x75, align 2, !dbg !495
  %83 = load i16, i16* %__x75, align 2, !dbg !495
  store i16 %83, i16* %tmp76, align 2, !dbg !495
  %84 = load i16, i16* %tmp76, align 2, !dbg !495
  %add77 = add i16 %84, 2, !dbg !491
  %85 = inttoptr i16 %add77 to i8*, !dbg !491
  call void @llvm.dbg.declare(metadata i16* %__x78, metadata !497, metadata !DIExpression()), !dbg !499
  %86 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !499, !srcloc !500
  store i16 %86, i16* %__x78, align 2, !dbg !499
  %87 = load i16, i16* %__x78, align 2, !dbg !499
  store i16 %87, i16* %tmp79, align 2, !dbg !499
  %88 = load i16, i16* %tmp79, align 2, !dbg !499
  %add80 = add i16 %88, 2, !dbg !491
  %sub81 = sub i16 9216, %add80, !dbg !491
  %call82 = call zeroext i16 @__fast_hw_crc(i8* %85, i16 zeroext %sub81, i16 zeroext -1), !dbg !491
  store i16 %call82, i16* @tmp_stack_crc, align 2, !dbg !491
  %89 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %90 = bitcast %struct.camel_buffer_t* %89 to i8*, !dbg !491
  %91 = load i16, i16* @tmp_stack_crc, align 2, !dbg !491
  %call83 = call zeroext i16 @__fast_hw_crc(i8* %90, i16 zeroext 298, i16 zeroext %91), !dbg !491
  store i16 %call83, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %92 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !491
  %93 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %stack_and_buf_crc84 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %93, i32 0, i32 2, !dbg !491
  store i16 %92, i16* %stack_and_buf_crc84, align 2, !dbg !491
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !491
  br label %if.end85

if.end85:                                         ; preds = %if.else72, %if.then59
  br label %do.end86, !dbg !480

do.end86:                                         ; preds = %if.end85
  call void @task_calc_indexes_index_2(), !dbg !501
  br label %do.body87, !dbg !502

do.body87:                                        ; preds = %do.end86
  %94 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !503
  %cmp88 = icmp eq i16 %94, 1, !dbg !503
  br i1 %cmp88, label %if.then89, label %if.else102, !dbg !506

if.then89:                                        ; preds = %do.body87
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !507
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !507
  %95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %reg_file90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %95, i32 0, i32 0, !dbg !507
  %arraydecay91 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file90, i16 0, i16 0, !dbg !507
  call void @__dump_registers(i16* %arraydecay91), !dbg !507
  call void @llvm.dbg.declare(metadata i16* %__x92, metadata !509, metadata !DIExpression()), !dbg !511
  %96 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !511, !srcloc !512
  store i16 %96, i16* %__x92, align 2, !dbg !511
  %97 = load i16, i16* %__x92, align 2, !dbg !511
  store i16 %97, i16* %tmp93, align 2, !dbg !511
  %98 = load i16, i16* %tmp93, align 2, !dbg !511
  %add94 = add i16 %98, 2, !dbg !507
  %99 = inttoptr i16 %add94 to i8*, !dbg !507
  call void @llvm.dbg.declare(metadata i16* %__x95, metadata !513, metadata !DIExpression()), !dbg !515
  %100 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !515, !srcloc !516
  store i16 %100, i16* %__x95, align 2, !dbg !515
  %101 = load i16, i16* %__x95, align 2, !dbg !515
  store i16 %101, i16* %tmp96, align 2, !dbg !515
  %102 = load i16, i16* %tmp96, align 2, !dbg !515
  %add97 = add i16 %102, 2, !dbg !507
  %sub98 = sub i16 9216, %add97, !dbg !507
  %call99 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext %sub98, i16 zeroext -1), !dbg !507
  store i16 %call99, i16* @tmp_stack_crc, align 2, !dbg !507
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %104 = bitcast %struct.camel_buffer_t* %103 to i8*, !dbg !507
  %105 = load i16, i16* @tmp_stack_crc, align 2, !dbg !507
  %call100 = call zeroext i16 @__fast_hw_crc(i8* %104, i16 zeroext 298, i16 zeroext %105), !dbg !507
  store i16 %call100, i16* @tmp_stack_buf_crc, align 2, !dbg !507
  %106 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !507
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %stack_and_buf_crc101 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %107, i32 0, i32 2, !dbg !507
  store i16 %106, i16* %stack_and_buf_crc101, align 2, !dbg !507
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !507
  br label %if.end115, !dbg !507

if.else102:                                       ; preds = %do.body87
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !517
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !517
  %108 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %reg_file103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %108, i32 0, i32 0, !dbg !517
  %arraydecay104 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file103, i16 0, i16 0, !dbg !517
  call void @__dump_registers(i16* %arraydecay104), !dbg !517
  call void @llvm.dbg.declare(metadata i16* %__x105, metadata !519, metadata !DIExpression()), !dbg !521
  %109 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !521, !srcloc !522
  store i16 %109, i16* %__x105, align 2, !dbg !521
  %110 = load i16, i16* %__x105, align 2, !dbg !521
  store i16 %110, i16* %tmp106, align 2, !dbg !521
  %111 = load i16, i16* %tmp106, align 2, !dbg !521
  %add107 = add i16 %111, 2, !dbg !517
  %112 = inttoptr i16 %add107 to i8*, !dbg !517
  call void @llvm.dbg.declare(metadata i16* %__x108, metadata !523, metadata !DIExpression()), !dbg !525
  %113 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !525, !srcloc !526
  store i16 %113, i16* %__x108, align 2, !dbg !525
  %114 = load i16, i16* %__x108, align 2, !dbg !525
  store i16 %114, i16* %tmp109, align 2, !dbg !525
  %115 = load i16, i16* %tmp109, align 2, !dbg !525
  %add110 = add i16 %115, 2, !dbg !517
  %sub111 = sub i16 9216, %add110, !dbg !517
  %call112 = call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext %sub111, i16 zeroext -1), !dbg !517
  store i16 %call112, i16* @tmp_stack_crc, align 2, !dbg !517
  %116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %117 = bitcast %struct.camel_buffer_t* %116 to i8*, !dbg !517
  %118 = load i16, i16* @tmp_stack_crc, align 2, !dbg !517
  %call113 = call zeroext i16 @__fast_hw_crc(i8* %117, i16 zeroext 298, i16 zeroext %118), !dbg !517
  store i16 %call113, i16* @tmp_stack_buf_crc, align 2, !dbg !517
  %119 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !517
  %120 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !517
  %stack_and_buf_crc114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %120, i32 0, i32 2, !dbg !517
  store i16 %119, i16* %stack_and_buf_crc114, align 2, !dbg !517
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !517
  br label %if.end115

if.end115:                                        ; preds = %if.else102, %if.then89
  br label %do.end116, !dbg !506

do.end116:                                        ; preds = %if.end115
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !527
  %globals117 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %121, i32 0, i32 1, !dbg !527
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals117, i32 0, i32 6, !dbg !527
  %122 = load i16, i16* %insert_count, align 2, !dbg !527
  %cmp118 = icmp ult i16 %122, 32, !dbg !529
  br i1 %cmp118, label %if.then119, label %if.else232, !dbg !530

if.then119:                                       ; preds = %do.end116
  call void @task_add(), !dbg !531
  br label %do.body120, !dbg !533

do.body120:                                       ; preds = %if.then119
  %123 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !534
  %cmp121 = icmp eq i16 %123, 1, !dbg !534
  br i1 %cmp121, label %if.then122, label %if.else135, !dbg !537

if.then122:                                       ; preds = %do.body120
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !538
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !538
  %124 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %reg_file123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i32 0, i32 0, !dbg !538
  %arraydecay124 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file123, i16 0, i16 0, !dbg !538
  call void @__dump_registers(i16* %arraydecay124), !dbg !538
  call void @llvm.dbg.declare(metadata i16* %__x125, metadata !540, metadata !DIExpression()), !dbg !542
  %125 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !542, !srcloc !543
  store i16 %125, i16* %__x125, align 2, !dbg !542
  %126 = load i16, i16* %__x125, align 2, !dbg !542
  store i16 %126, i16* %tmp126, align 2, !dbg !542
  %127 = load i16, i16* %tmp126, align 2, !dbg !542
  %add127 = add i16 %127, 2, !dbg !538
  %128 = inttoptr i16 %add127 to i8*, !dbg !538
  call void @llvm.dbg.declare(metadata i16* %__x128, metadata !544, metadata !DIExpression()), !dbg !546
  %129 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !546, !srcloc !547
  store i16 %129, i16* %__x128, align 2, !dbg !546
  %130 = load i16, i16* %__x128, align 2, !dbg !546
  store i16 %130, i16* %tmp129, align 2, !dbg !546
  %131 = load i16, i16* %tmp129, align 2, !dbg !546
  %add130 = add i16 %131, 2, !dbg !538
  %sub131 = sub i16 9216, %add130, !dbg !538
  %call132 = call zeroext i16 @__fast_hw_crc(i8* %128, i16 zeroext %sub131, i16 zeroext -1), !dbg !538
  store i16 %call132, i16* @tmp_stack_crc, align 2, !dbg !538
  %132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %133 = bitcast %struct.camel_buffer_t* %132 to i8*, !dbg !538
  %134 = load i16, i16* @tmp_stack_crc, align 2, !dbg !538
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %133, i16 zeroext 298, i16 zeroext %134), !dbg !538
  store i16 %call133, i16* @tmp_stack_buf_crc, align 2, !dbg !538
  %135 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !538
  %136 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !538
  %stack_and_buf_crc134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %136, i32 0, i32 2, !dbg !538
  store i16 %135, i16* %stack_and_buf_crc134, align 2, !dbg !538
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !538
  br label %if.end148, !dbg !538

if.else135:                                       ; preds = %do.body120
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !548
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %reg_file136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %137, i32 0, i32 0, !dbg !548
  %arraydecay137 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file136, i16 0, i16 0, !dbg !548
  call void @__dump_registers(i16* %arraydecay137), !dbg !548
  call void @llvm.dbg.declare(metadata i16* %__x138, metadata !550, metadata !DIExpression()), !dbg !552
  %138 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !552, !srcloc !553
  store i16 %138, i16* %__x138, align 2, !dbg !552
  %139 = load i16, i16* %__x138, align 2, !dbg !552
  store i16 %139, i16* %tmp139, align 2, !dbg !552
  %140 = load i16, i16* %tmp139, align 2, !dbg !552
  %add140 = add i16 %140, 2, !dbg !548
  %141 = inttoptr i16 %add140 to i8*, !dbg !548
  call void @llvm.dbg.declare(metadata i16* %__x141, metadata !554, metadata !DIExpression()), !dbg !556
  %142 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !556, !srcloc !557
  store i16 %142, i16* %__x141, align 2, !dbg !556
  %143 = load i16, i16* %__x141, align 2, !dbg !556
  store i16 %143, i16* %tmp142, align 2, !dbg !556
  %144 = load i16, i16* %tmp142, align 2, !dbg !556
  %add143 = add i16 %144, 2, !dbg !548
  %sub144 = sub i16 9216, %add143, !dbg !548
  %call145 = call zeroext i16 @__fast_hw_crc(i8* %141, i16 zeroext %sub144, i16 zeroext -1), !dbg !548
  store i16 %call145, i16* @tmp_stack_crc, align 2, !dbg !548
  %145 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %146 = bitcast %struct.camel_buffer_t* %145 to i8*, !dbg !548
  %147 = load i16, i16* @tmp_stack_crc, align 2, !dbg !548
  %call146 = call zeroext i16 @__fast_hw_crc(i8* %146, i16 zeroext 298, i16 zeroext %147), !dbg !548
  store i16 %call146, i16* @tmp_stack_buf_crc, align 2, !dbg !548
  %148 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !548
  %149 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !548
  %stack_and_buf_crc147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %149, i32 0, i32 2, !dbg !548
  store i16 %148, i16* %stack_and_buf_crc147, align 2, !dbg !548
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !548
  br label %if.end148

if.end148:                                        ; preds = %if.else135, %if.then122
  br label %do.end149, !dbg !537

do.end149:                                        ; preds = %if.end148
  %150 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !558
  %globals150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %150, i32 0, i32 1, !dbg !558
  %filter151 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals150, i32 0, i32 0, !dbg !558
  %151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !560
  %globals152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %151, i32 0, i32 1, !dbg !560
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals152, i32 0, i32 3, !dbg !560
  %152 = load i16, i16* %index1, align 2, !dbg !560
  %arrayidx153 = getelementptr inbounds [128 x i16], [128 x i16]* %filter151, i16 0, i16 %152, !dbg !558
  %153 = load i16, i16* %arrayidx153, align 2, !dbg !558
  %tobool = icmp ne i16 %153, 0, !dbg !558
  br i1 %tobool, label %land.lhs.true, label %if.end200, !dbg !561

land.lhs.true:                                    ; preds = %do.end149
  %154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %globals154 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %154, i32 0, i32 1, !dbg !562
  %filter155 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals154, i32 0, i32 0, !dbg !562
  %155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %155, i32 0, i32 1, !dbg !563
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals156, i32 0, i32 4, !dbg !563
  %156 = load i16, i16* %index2, align 2, !dbg !563
  %arrayidx157 = getelementptr inbounds [128 x i16], [128 x i16]* %filter155, i16 0, i16 %156, !dbg !562
  %157 = load i16, i16* %arrayidx157, align 2, !dbg !562
  %tobool158 = icmp ne i16 %157, 0, !dbg !562
  br i1 %tobool158, label %if.then159, label %if.end200, !dbg !564

if.then159:                                       ; preds = %land.lhs.true
  br label %while.cond160, !dbg !565

while.cond160:                                    ; preds = %do.end199, %if.then159
  %158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !567
  %globals161 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %158, i32 0, i32 1, !dbg !567
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals161, i32 0, i32 10, !dbg !567
  %159 = load i8, i8* %success, align 2, !dbg !567
  %tobool162 = trunc i8 %159 to i1, !dbg !567
  %conv = zext i1 %tobool162 to i16, !dbg !567
  %cmp163 = icmp eq i16 %conv, 0, !dbg !568
  br i1 %cmp163, label %land.rhs, label %land.end, !dbg !569

land.rhs:                                         ; preds = %while.cond160
  %160 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !570
  %globals165 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %160, i32 0, i32 1, !dbg !570
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals165, i32 0, i32 5, !dbg !570
  %161 = load i16, i16* %relocation_count, align 2, !dbg !570
  %cmp166 = icmp ult i16 %161, 8, !dbg !571
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond160
  %162 = phi i1 [ false, %while.cond160 ], [ %cmp166, %land.rhs ], !dbg !572
  br i1 %162, label %while.body168, label %while.end, !dbg !565

while.body168:                                    ; preds = %land.end
  call void @task_relocate(), !dbg !573
  br label %do.body169, !dbg !575

do.body169:                                       ; preds = %while.body168
  %163 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !576
  %cmp170 = icmp eq i16 %163, 1, !dbg !576
  br i1 %cmp170, label %if.then172, label %if.else185, !dbg !579

if.then172:                                       ; preds = %do.body169
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !580
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !580
  %164 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %reg_file173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %164, i32 0, i32 0, !dbg !580
  %arraydecay174 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file173, i16 0, i16 0, !dbg !580
  call void @__dump_registers(i16* %arraydecay174), !dbg !580
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !582, metadata !DIExpression()), !dbg !584
  %165 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !584, !srcloc !585
  store i16 %165, i16* %__x175, align 2, !dbg !584
  %166 = load i16, i16* %__x175, align 2, !dbg !584
  store i16 %166, i16* %tmp176, align 2, !dbg !584
  %167 = load i16, i16* %tmp176, align 2, !dbg !584
  %add177 = add i16 %167, 2, !dbg !580
  %168 = inttoptr i16 %add177 to i8*, !dbg !580
  call void @llvm.dbg.declare(metadata i16* %__x178, metadata !586, metadata !DIExpression()), !dbg !588
  %169 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !588, !srcloc !589
  store i16 %169, i16* %__x178, align 2, !dbg !588
  %170 = load i16, i16* %__x178, align 2, !dbg !588
  store i16 %170, i16* %tmp179, align 2, !dbg !588
  %171 = load i16, i16* %tmp179, align 2, !dbg !588
  %add180 = add i16 %171, 2, !dbg !580
  %sub181 = sub i16 9216, %add180, !dbg !580
  %call182 = call zeroext i16 @__fast_hw_crc(i8* %168, i16 zeroext %sub181, i16 zeroext -1), !dbg !580
  store i16 %call182, i16* @tmp_stack_crc, align 2, !dbg !580
  %172 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %173 = bitcast %struct.camel_buffer_t* %172 to i8*, !dbg !580
  %174 = load i16, i16* @tmp_stack_crc, align 2, !dbg !580
  %call183 = call zeroext i16 @__fast_hw_crc(i8* %173, i16 zeroext 298, i16 zeroext %174), !dbg !580
  store i16 %call183, i16* @tmp_stack_buf_crc, align 2, !dbg !580
  %175 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !580
  %176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !580
  %stack_and_buf_crc184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %176, i32 0, i32 2, !dbg !580
  store i16 %175, i16* %stack_and_buf_crc184, align 2, !dbg !580
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !580
  br label %if.end198, !dbg !580

if.else185:                                       ; preds = %do.body169
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !590
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !590
  %177 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %reg_file186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %177, i32 0, i32 0, !dbg !590
  %arraydecay187 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file186, i16 0, i16 0, !dbg !590
  call void @__dump_registers(i16* %arraydecay187), !dbg !590
  call void @llvm.dbg.declare(metadata i16* %__x188, metadata !592, metadata !DIExpression()), !dbg !594
  %178 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !594, !srcloc !595
  store i16 %178, i16* %__x188, align 2, !dbg !594
  %179 = load i16, i16* %__x188, align 2, !dbg !594
  store i16 %179, i16* %tmp189, align 2, !dbg !594
  %180 = load i16, i16* %tmp189, align 2, !dbg !594
  %add190 = add i16 %180, 2, !dbg !590
  %181 = inttoptr i16 %add190 to i8*, !dbg !590
  call void @llvm.dbg.declare(metadata i16* %__x191, metadata !596, metadata !DIExpression()), !dbg !598
  %182 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !598, !srcloc !599
  store i16 %182, i16* %__x191, align 2, !dbg !598
  %183 = load i16, i16* %__x191, align 2, !dbg !598
  store i16 %183, i16* %tmp192, align 2, !dbg !598
  %184 = load i16, i16* %tmp192, align 2, !dbg !598
  %add193 = add i16 %184, 2, !dbg !590
  %sub194 = sub i16 9216, %add193, !dbg !590
  %call195 = call zeroext i16 @__fast_hw_crc(i8* %181, i16 zeroext %sub194, i16 zeroext -1), !dbg !590
  store i16 %call195, i16* @tmp_stack_crc, align 2, !dbg !590
  %185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %186 = bitcast %struct.camel_buffer_t* %185 to i8*, !dbg !590
  %187 = load i16, i16* @tmp_stack_crc, align 2, !dbg !590
  %call196 = call zeroext i16 @__fast_hw_crc(i8* %186, i16 zeroext 298, i16 zeroext %187), !dbg !590
  store i16 %call196, i16* @tmp_stack_buf_crc, align 2, !dbg !590
  %188 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !590
  %189 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %stack_and_buf_crc197 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %189, i32 0, i32 2, !dbg !590
  store i16 %188, i16* %stack_and_buf_crc197, align 2, !dbg !590
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !590
  br label %if.end198

if.end198:                                        ; preds = %if.else185, %if.then172
  br label %do.end199, !dbg !579

do.end199:                                        ; preds = %if.end198
  br label %while.cond160, !dbg !565, !llvm.loop !600

while.end:                                        ; preds = %land.end
  br label %if.end200, !dbg !602

if.end200:                                        ; preds = %while.end, %land.lhs.true, %do.end149
  call void @task_insert_done(), !dbg !603
  br label %do.body201, !dbg !604

do.body201:                                       ; preds = %if.end200
  %190 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !605
  %cmp202 = icmp eq i16 %190, 1, !dbg !605
  br i1 %cmp202, label %if.then204, label %if.else217, !dbg !608

if.then204:                                       ; preds = %do.body201
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !609
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !609
  %191 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %reg_file205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %191, i32 0, i32 0, !dbg !609
  %arraydecay206 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file205, i16 0, i16 0, !dbg !609
  call void @__dump_registers(i16* %arraydecay206), !dbg !609
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !611, metadata !DIExpression()), !dbg !613
  %192 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !613, !srcloc !614
  store i16 %192, i16* %__x207, align 2, !dbg !613
  %193 = load i16, i16* %__x207, align 2, !dbg !613
  store i16 %193, i16* %tmp208, align 2, !dbg !613
  %194 = load i16, i16* %tmp208, align 2, !dbg !613
  %add209 = add i16 %194, 2, !dbg !609
  %195 = inttoptr i16 %add209 to i8*, !dbg !609
  call void @llvm.dbg.declare(metadata i16* %__x210, metadata !615, metadata !DIExpression()), !dbg !617
  %196 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !617, !srcloc !618
  store i16 %196, i16* %__x210, align 2, !dbg !617
  %197 = load i16, i16* %__x210, align 2, !dbg !617
  store i16 %197, i16* %tmp211, align 2, !dbg !617
  %198 = load i16, i16* %tmp211, align 2, !dbg !617
  %add212 = add i16 %198, 2, !dbg !609
  %sub213 = sub i16 9216, %add212, !dbg !609
  %call214 = call zeroext i16 @__fast_hw_crc(i8* %195, i16 zeroext %sub213, i16 zeroext -1), !dbg !609
  store i16 %call214, i16* @tmp_stack_crc, align 2, !dbg !609
  %199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %200 = bitcast %struct.camel_buffer_t* %199 to i8*, !dbg !609
  %201 = load i16, i16* @tmp_stack_crc, align 2, !dbg !609
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %200, i16 zeroext 298, i16 zeroext %201), !dbg !609
  store i16 %call215, i16* @tmp_stack_buf_crc, align 2, !dbg !609
  %202 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !609
  %203 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !609
  %stack_and_buf_crc216 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %203, i32 0, i32 2, !dbg !609
  store i16 %202, i16* %stack_and_buf_crc216, align 2, !dbg !609
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !609
  br label %if.end230, !dbg !609

if.else217:                                       ; preds = %do.body201
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !619
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !619
  %204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %reg_file218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %204, i32 0, i32 0, !dbg !619
  %arraydecay219 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file218, i16 0, i16 0, !dbg !619
  call void @__dump_registers(i16* %arraydecay219), !dbg !619
  call void @llvm.dbg.declare(metadata i16* %__x220, metadata !621, metadata !DIExpression()), !dbg !623
  %205 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !623, !srcloc !624
  store i16 %205, i16* %__x220, align 2, !dbg !623
  %206 = load i16, i16* %__x220, align 2, !dbg !623
  store i16 %206, i16* %tmp221, align 2, !dbg !623
  %207 = load i16, i16* %tmp221, align 2, !dbg !623
  %add222 = add i16 %207, 2, !dbg !619
  %208 = inttoptr i16 %add222 to i8*, !dbg !619
  call void @llvm.dbg.declare(metadata i16* %__x223, metadata !625, metadata !DIExpression()), !dbg !627
  %209 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !627, !srcloc !628
  store i16 %209, i16* %__x223, align 2, !dbg !627
  %210 = load i16, i16* %__x223, align 2, !dbg !627
  store i16 %210, i16* %tmp224, align 2, !dbg !627
  %211 = load i16, i16* %tmp224, align 2, !dbg !627
  %add225 = add i16 %211, 2, !dbg !619
  %sub226 = sub i16 9216, %add225, !dbg !619
  %call227 = call zeroext i16 @__fast_hw_crc(i8* %208, i16 zeroext %sub226, i16 zeroext -1), !dbg !619
  store i16 %call227, i16* @tmp_stack_crc, align 2, !dbg !619
  %212 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %213 = bitcast %struct.camel_buffer_t* %212 to i8*, !dbg !619
  %214 = load i16, i16* @tmp_stack_crc, align 2, !dbg !619
  %call228 = call zeroext i16 @__fast_hw_crc(i8* %213, i16 zeroext 298, i16 zeroext %214), !dbg !619
  store i16 %call228, i16* @tmp_stack_buf_crc, align 2, !dbg !619
  %215 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !619
  %216 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %stack_and_buf_crc229 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %216, i32 0, i32 2, !dbg !619
  store i16 %215, i16* %stack_and_buf_crc229, align 2, !dbg !619
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !619
  br label %if.end230

if.end230:                                        ; preds = %if.else217, %if.then204
  br label %do.end231, !dbg !608

do.end231:                                        ; preds = %if.end230
  br label %if.end295, !dbg !629

if.else232:                                       ; preds = %do.end116
  call void @task_lookup_search(), !dbg !630
  br label %do.body233, !dbg !632

do.body233:                                       ; preds = %if.else232
  %217 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !633
  %cmp234 = icmp eq i16 %217, 1, !dbg !633
  br i1 %cmp234, label %if.then236, label %if.else249, !dbg !636

if.then236:                                       ; preds = %do.body233
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !637
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %218 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %reg_file237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %218, i32 0, i32 0, !dbg !637
  %arraydecay238 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file237, i16 0, i16 0, !dbg !637
  call void @__dump_registers(i16* %arraydecay238), !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !639, metadata !DIExpression()), !dbg !641
  %219 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !641, !srcloc !642
  store i16 %219, i16* %__x239, align 2, !dbg !641
  %220 = load i16, i16* %__x239, align 2, !dbg !641
  store i16 %220, i16* %tmp240, align 2, !dbg !641
  %221 = load i16, i16* %tmp240, align 2, !dbg !641
  %add241 = add i16 %221, 2, !dbg !637
  %222 = inttoptr i16 %add241 to i8*, !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x242, metadata !643, metadata !DIExpression()), !dbg !645
  %223 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !645, !srcloc !646
  store i16 %223, i16* %__x242, align 2, !dbg !645
  %224 = load i16, i16* %__x242, align 2, !dbg !645
  store i16 %224, i16* %tmp243, align 2, !dbg !645
  %225 = load i16, i16* %tmp243, align 2, !dbg !645
  %add244 = add i16 %225, 2, !dbg !637
  %sub245 = sub i16 9216, %add244, !dbg !637
  %call246 = call zeroext i16 @__fast_hw_crc(i8* %222, i16 zeroext %sub245, i16 zeroext -1), !dbg !637
  store i16 %call246, i16* @tmp_stack_crc, align 2, !dbg !637
  %226 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %227 = bitcast %struct.camel_buffer_t* %226 to i8*, !dbg !637
  %228 = load i16, i16* @tmp_stack_crc, align 2, !dbg !637
  %call247 = call zeroext i16 @__fast_hw_crc(i8* %227, i16 zeroext 298, i16 zeroext %228), !dbg !637
  store i16 %call247, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %229 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %230 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %stack_and_buf_crc248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %230, i32 0, i32 2, !dbg !637
  store i16 %229, i16* %stack_and_buf_crc248, align 2, !dbg !637
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !637
  br label %if.end262, !dbg !637

if.else249:                                       ; preds = %do.body233
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !647
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !647
  %231 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %reg_file250 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %231, i32 0, i32 0, !dbg !647
  %arraydecay251 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file250, i16 0, i16 0, !dbg !647
  call void @__dump_registers(i16* %arraydecay251), !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x252, metadata !649, metadata !DIExpression()), !dbg !651
  %232 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !651, !srcloc !652
  store i16 %232, i16* %__x252, align 2, !dbg !651
  %233 = load i16, i16* %__x252, align 2, !dbg !651
  store i16 %233, i16* %tmp253, align 2, !dbg !651
  %234 = load i16, i16* %tmp253, align 2, !dbg !651
  %add254 = add i16 %234, 2, !dbg !647
  %235 = inttoptr i16 %add254 to i8*, !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x255, metadata !653, metadata !DIExpression()), !dbg !655
  %236 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !655, !srcloc !656
  store i16 %236, i16* %__x255, align 2, !dbg !655
  %237 = load i16, i16* %__x255, align 2, !dbg !655
  store i16 %237, i16* %tmp256, align 2, !dbg !655
  %238 = load i16, i16* %tmp256, align 2, !dbg !655
  %add257 = add i16 %238, 2, !dbg !647
  %sub258 = sub i16 9216, %add257, !dbg !647
  %call259 = call zeroext i16 @__fast_hw_crc(i8* %235, i16 zeroext %sub258, i16 zeroext -1), !dbg !647
  store i16 %call259, i16* @tmp_stack_crc, align 2, !dbg !647
  %239 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %240 = bitcast %struct.camel_buffer_t* %239 to i8*, !dbg !647
  %241 = load i16, i16* @tmp_stack_crc, align 2, !dbg !647
  %call260 = call zeroext i16 @__fast_hw_crc(i8* %240, i16 zeroext 298, i16 zeroext %241), !dbg !647
  store i16 %call260, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %242 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %stack_and_buf_crc261 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %243, i32 0, i32 2, !dbg !647
  store i16 %242, i16* %stack_and_buf_crc261, align 2, !dbg !647
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !647
  br label %if.end262

if.end262:                                        ; preds = %if.else249, %if.then236
  br label %do.end263, !dbg !636

do.end263:                                        ; preds = %if.end262
  call void @task_lookup_done(), !dbg !657
  br label %do.body264, !dbg !658

do.body264:                                       ; preds = %do.end263
  %244 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !659
  %cmp265 = icmp eq i16 %244, 1, !dbg !659
  br i1 %cmp265, label %if.then267, label %if.else280, !dbg !662

if.then267:                                       ; preds = %do.body264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !663
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !663
  %245 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %reg_file268 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %245, i32 0, i32 0, !dbg !663
  %arraydecay269 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file268, i16 0, i16 0, !dbg !663
  call void @__dump_registers(i16* %arraydecay269), !dbg !663
  call void @llvm.dbg.declare(metadata i16* %__x270, metadata !665, metadata !DIExpression()), !dbg !667
  %246 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !667, !srcloc !668
  store i16 %246, i16* %__x270, align 2, !dbg !667
  %247 = load i16, i16* %__x270, align 2, !dbg !667
  store i16 %247, i16* %tmp271, align 2, !dbg !667
  %248 = load i16, i16* %tmp271, align 2, !dbg !667
  %add272 = add i16 %248, 2, !dbg !663
  %249 = inttoptr i16 %add272 to i8*, !dbg !663
  call void @llvm.dbg.declare(metadata i16* %__x273, metadata !669, metadata !DIExpression()), !dbg !671
  %250 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !671, !srcloc !672
  store i16 %250, i16* %__x273, align 2, !dbg !671
  %251 = load i16, i16* %__x273, align 2, !dbg !671
  store i16 %251, i16* %tmp274, align 2, !dbg !671
  %252 = load i16, i16* %tmp274, align 2, !dbg !671
  %add275 = add i16 %252, 2, !dbg !663
  %sub276 = sub i16 9216, %add275, !dbg !663
  %call277 = call zeroext i16 @__fast_hw_crc(i8* %249, i16 zeroext %sub276, i16 zeroext -1), !dbg !663
  store i16 %call277, i16* @tmp_stack_crc, align 2, !dbg !663
  %253 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %254 = bitcast %struct.camel_buffer_t* %253 to i8*, !dbg !663
  %255 = load i16, i16* @tmp_stack_crc, align 2, !dbg !663
  %call278 = call zeroext i16 @__fast_hw_crc(i8* %254, i16 zeroext 298, i16 zeroext %255), !dbg !663
  store i16 %call278, i16* @tmp_stack_buf_crc, align 2, !dbg !663
  %256 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !663
  %257 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !663
  %stack_and_buf_crc279 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %257, i32 0, i32 2, !dbg !663
  store i16 %256, i16* %stack_and_buf_crc279, align 2, !dbg !663
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !663
  br label %if.end293, !dbg !663

if.else280:                                       ; preds = %do.body264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !673
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !673
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %reg_file281 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %258, i32 0, i32 0, !dbg !673
  %arraydecay282 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file281, i16 0, i16 0, !dbg !673
  call void @__dump_registers(i16* %arraydecay282), !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x283, metadata !675, metadata !DIExpression()), !dbg !677
  %259 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !677, !srcloc !678
  store i16 %259, i16* %__x283, align 2, !dbg !677
  %260 = load i16, i16* %__x283, align 2, !dbg !677
  store i16 %260, i16* %tmp284, align 2, !dbg !677
  %261 = load i16, i16* %tmp284, align 2, !dbg !677
  %add285 = add i16 %261, 2, !dbg !673
  %262 = inttoptr i16 %add285 to i8*, !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x286, metadata !679, metadata !DIExpression()), !dbg !681
  %263 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !681, !srcloc !682
  store i16 %263, i16* %__x286, align 2, !dbg !681
  %264 = load i16, i16* %__x286, align 2, !dbg !681
  store i16 %264, i16* %tmp287, align 2, !dbg !681
  %265 = load i16, i16* %tmp287, align 2, !dbg !681
  %add288 = add i16 %265, 2, !dbg !673
  %sub289 = sub i16 9216, %add288, !dbg !673
  %call290 = call zeroext i16 @__fast_hw_crc(i8* %262, i16 zeroext %sub289, i16 zeroext -1), !dbg !673
  store i16 %call290, i16* @tmp_stack_crc, align 2, !dbg !673
  %266 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %267 = bitcast %struct.camel_buffer_t* %266 to i8*, !dbg !673
  %268 = load i16, i16* @tmp_stack_crc, align 2, !dbg !673
  %call291 = call zeroext i16 @__fast_hw_crc(i8* %267, i16 zeroext 298, i16 zeroext %268), !dbg !673
  store i16 %call291, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %269 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %270 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %stack_and_buf_crc292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %270, i32 0, i32 2, !dbg !673
  store i16 %269, i16* %stack_and_buf_crc292, align 2, !dbg !673
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !673
  br label %if.end293

if.end293:                                        ; preds = %if.else280, %if.then267
  br label %do.end294, !dbg !662

do.end294:                                        ; preds = %if.end293
  br label %if.end295

if.end295:                                        ; preds = %do.end294, %do.end231
  br label %while.cond, !dbg !419, !llvm.loop !683

while.end296:                                     ; preds = %while.cond
  call void @task_done(), !dbg !685
  %271 = load i16, i16* %retval, align 2, !dbg !686
  ret i16 %271, !dbg !686
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
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 615, type: !26, isLocal: true, isDefinition: true)
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
!113 = !{i32 -2146587651}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 203, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 33)
!116 = !DILocation(line: 203, column: 33, scope: !115)
!117 = !{i32 -2146587415}
!118 = !DILocation(line: 203, column: 51, scope: !92)
!119 = !DILocation(line: 203, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 203, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 65)
!122 = !DILocation(line: 203, column: 65, scope: !121)
!123 = !{i32 -2146587290}
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
!412 = !DILocation(line: 549, column: 5, scope: !404)
!413 = !DILocation(line: 552, column: 5, scope: !404)
!414 = !DILocation(line: 553, column: 14, scope: !404)
!415 = !DILocation(line: 553, column: 20, scope: !404)
!416 = !DILocation(line: 553, column: 5, scope: !404)
!417 = !DILocation(line: 553, column: 32, scope: !404)
!418 = !DILocation(line: 553, column: 40, scope: !404)
!419 = !DILocation(line: 556, column: 3, scope: !404)
!420 = !DILocation(line: 556, column: 9, scope: !404)
!421 = !DILocation(line: 556, column: 27, scope: !404)
!422 = !DILocation(line: 558, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !404, file: !3, line: 556, column: 42)
!424 = !DILocation(line: 559, column: 9, scope: !423)
!425 = !DILocation(line: 559, column: 9, scope: !426)
!426 = distinct !DILexicalBlock(scope: !427, file: !3, line: 559, column: 9)
!427 = distinct !DILexicalBlock(scope: !423, file: !3, line: 559, column: 9)
!428 = !DILocation(line: 559, column: 9, scope: !427)
!429 = !DILocation(line: 559, column: 9, scope: !430)
!430 = distinct !DILexicalBlock(scope: !426, file: !3, line: 559, column: 9)
!431 = !DILocalVariable(name: "__x", scope: !432, file: !3, line: 559, type: !6)
!432 = distinct !DILexicalBlock(scope: !430, file: !3, line: 559, column: 9)
!433 = !DILocation(line: 559, column: 9, scope: !432)
!434 = !{i32 -2146582977}
!435 = !DILocalVariable(name: "__x", scope: !436, file: !3, line: 559, type: !6)
!436 = distinct !DILexicalBlock(scope: !430, file: !3, line: 559, column: 9)
!437 = !DILocation(line: 559, column: 9, scope: !436)
!438 = !{i32 -2146582852}
!439 = !DILocation(line: 559, column: 9, scope: !440)
!440 = distinct !DILexicalBlock(scope: !426, file: !3, line: 559, column: 9)
!441 = !DILocalVariable(name: "__x", scope: !442, file: !3, line: 559, type: !6)
!442 = distinct !DILexicalBlock(scope: !440, file: !3, line: 559, column: 9)
!443 = !DILocation(line: 559, column: 9, scope: !442)
!444 = !{i32 -2146582720}
!445 = !DILocalVariable(name: "__x", scope: !446, file: !3, line: 559, type: !6)
!446 = distinct !DILexicalBlock(scope: !440, file: !3, line: 559, column: 9)
!447 = !DILocation(line: 559, column: 9, scope: !446)
!448 = !{i32 -2146582595}
!449 = !DILocation(line: 563, column: 9, scope: !423)
!450 = !DILocation(line: 564, column: 9, scope: !423)
!451 = !DILocation(line: 564, column: 9, scope: !452)
!452 = distinct !DILexicalBlock(scope: !453, file: !3, line: 564, column: 9)
!453 = distinct !DILexicalBlock(scope: !423, file: !3, line: 564, column: 9)
!454 = !DILocation(line: 564, column: 9, scope: !453)
!455 = !DILocation(line: 564, column: 9, scope: !456)
!456 = distinct !DILexicalBlock(scope: !452, file: !3, line: 564, column: 9)
!457 = !DILocalVariable(name: "__x", scope: !458, file: !3, line: 564, type: !6)
!458 = distinct !DILexicalBlock(scope: !456, file: !3, line: 564, column: 9)
!459 = !DILocation(line: 564, column: 9, scope: !458)
!460 = !{i32 -2146580471}
!461 = !DILocalVariable(name: "__x", scope: !462, file: !3, line: 564, type: !6)
!462 = distinct !DILexicalBlock(scope: !456, file: !3, line: 564, column: 9)
!463 = !DILocation(line: 564, column: 9, scope: !462)
!464 = !{i32 -2146580346}
!465 = !DILocation(line: 564, column: 9, scope: !466)
!466 = distinct !DILexicalBlock(scope: !452, file: !3, line: 564, column: 9)
!467 = !DILocalVariable(name: "__x", scope: !468, file: !3, line: 564, type: !6)
!468 = distinct !DILexicalBlock(scope: !466, file: !3, line: 564, column: 9)
!469 = !DILocation(line: 564, column: 9, scope: !468)
!470 = !{i32 -2146580214}
!471 = !DILocalVariable(name: "__x", scope: !472, file: !3, line: 564, type: !6)
!472 = distinct !DILexicalBlock(scope: !466, file: !3, line: 564, column: 9)
!473 = !DILocation(line: 564, column: 9, scope: !472)
!474 = !{i32 -2146580089}
!475 = !DILocation(line: 568, column: 9, scope: !423)
!476 = !DILocation(line: 569, column: 9, scope: !423)
!477 = !DILocation(line: 569, column: 9, scope: !478)
!478 = distinct !DILexicalBlock(scope: !479, file: !3, line: 569, column: 9)
!479 = distinct !DILexicalBlock(scope: !423, file: !3, line: 569, column: 9)
!480 = !DILocation(line: 569, column: 9, scope: !479)
!481 = !DILocation(line: 569, column: 9, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !3, line: 569, column: 9)
!483 = !DILocalVariable(name: "__x", scope: !484, file: !3, line: 569, type: !6)
!484 = distinct !DILexicalBlock(scope: !482, file: !3, line: 569, column: 9)
!485 = !DILocation(line: 569, column: 9, scope: !484)
!486 = !{i32 -2146577965}
!487 = !DILocalVariable(name: "__x", scope: !488, file: !3, line: 569, type: !6)
!488 = distinct !DILexicalBlock(scope: !482, file: !3, line: 569, column: 9)
!489 = !DILocation(line: 569, column: 9, scope: !488)
!490 = !{i32 -2146577840}
!491 = !DILocation(line: 569, column: 9, scope: !492)
!492 = distinct !DILexicalBlock(scope: !478, file: !3, line: 569, column: 9)
!493 = !DILocalVariable(name: "__x", scope: !494, file: !3, line: 569, type: !6)
!494 = distinct !DILexicalBlock(scope: !492, file: !3, line: 569, column: 9)
!495 = !DILocation(line: 569, column: 9, scope: !494)
!496 = !{i32 -2146577708}
!497 = !DILocalVariable(name: "__x", scope: !498, file: !3, line: 569, type: !6)
!498 = distinct !DILexicalBlock(scope: !492, file: !3, line: 569, column: 9)
!499 = !DILocation(line: 569, column: 9, scope: !498)
!500 = !{i32 -2146577583}
!501 = !DILocation(line: 573, column: 9, scope: !423)
!502 = !DILocation(line: 574, column: 9, scope: !423)
!503 = !DILocation(line: 574, column: 9, scope: !504)
!504 = distinct !DILexicalBlock(scope: !505, file: !3, line: 574, column: 9)
!505 = distinct !DILexicalBlock(scope: !423, file: !3, line: 574, column: 9)
!506 = !DILocation(line: 574, column: 9, scope: !505)
!507 = !DILocation(line: 574, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !3, line: 574, column: 9)
!509 = !DILocalVariable(name: "__x", scope: !510, file: !3, line: 574, type: !6)
!510 = distinct !DILexicalBlock(scope: !508, file: !3, line: 574, column: 9)
!511 = !DILocation(line: 574, column: 9, scope: !510)
!512 = !{i32 -2146575459}
!513 = !DILocalVariable(name: "__x", scope: !514, file: !3, line: 574, type: !6)
!514 = distinct !DILexicalBlock(scope: !508, file: !3, line: 574, column: 9)
!515 = !DILocation(line: 574, column: 9, scope: !514)
!516 = !{i32 -2146575334}
!517 = !DILocation(line: 574, column: 9, scope: !518)
!518 = distinct !DILexicalBlock(scope: !504, file: !3, line: 574, column: 9)
!519 = !DILocalVariable(name: "__x", scope: !520, file: !3, line: 574, type: !6)
!520 = distinct !DILexicalBlock(scope: !518, file: !3, line: 574, column: 9)
!521 = !DILocation(line: 574, column: 9, scope: !520)
!522 = !{i32 -2146575202}
!523 = !DILocalVariable(name: "__x", scope: !524, file: !3, line: 574, type: !6)
!524 = distinct !DILexicalBlock(scope: !518, file: !3, line: 574, column: 9)
!525 = !DILocation(line: 574, column: 9, scope: !524)
!526 = !{i32 -2146575077}
!527 = !DILocation(line: 577, column: 12, scope: !528)
!528 = distinct !DILexicalBlock(scope: !423, file: !3, line: 577, column: 12)
!529 = !DILocation(line: 577, column: 30, scope: !528)
!530 = !DILocation(line: 577, column: 12, scope: !423)
!531 = !DILocation(line: 579, column: 13, scope: !532)
!532 = distinct !DILexicalBlock(scope: !528, file: !3, line: 577, column: 45)
!533 = !DILocation(line: 580, column: 13, scope: !532)
!534 = !DILocation(line: 580, column: 13, scope: !535)
!535 = distinct !DILexicalBlock(scope: !536, file: !3, line: 580, column: 13)
!536 = distinct !DILexicalBlock(scope: !532, file: !3, line: 580, column: 13)
!537 = !DILocation(line: 580, column: 13, scope: !536)
!538 = !DILocation(line: 580, column: 13, scope: !539)
!539 = distinct !DILexicalBlock(scope: !535, file: !3, line: 580, column: 13)
!540 = !DILocalVariable(name: "__x", scope: !541, file: !3, line: 580, type: !6)
!541 = distinct !DILexicalBlock(scope: !539, file: !3, line: 580, column: 13)
!542 = !DILocation(line: 580, column: 13, scope: !541)
!543 = !{i32 -2146572902}
!544 = !DILocalVariable(name: "__x", scope: !545, file: !3, line: 580, type: !6)
!545 = distinct !DILexicalBlock(scope: !539, file: !3, line: 580, column: 13)
!546 = !DILocation(line: 580, column: 13, scope: !545)
!547 = !{i32 -2146572777}
!548 = !DILocation(line: 580, column: 13, scope: !549)
!549 = distinct !DILexicalBlock(scope: !535, file: !3, line: 580, column: 13)
!550 = !DILocalVariable(name: "__x", scope: !551, file: !3, line: 580, type: !6)
!551 = distinct !DILexicalBlock(scope: !549, file: !3, line: 580, column: 13)
!552 = !DILocation(line: 580, column: 13, scope: !551)
!553 = !{i32 -2146572645}
!554 = !DILocalVariable(name: "__x", scope: !555, file: !3, line: 580, type: !6)
!555 = distinct !DILexicalBlock(scope: !549, file: !3, line: 580, column: 13)
!556 = !DILocation(line: 580, column: 13, scope: !555)
!557 = !{i32 -2146572520}
!558 = !DILocation(line: 583, column: 16, scope: !559)
!559 = distinct !DILexicalBlock(scope: !532, file: !3, line: 583, column: 16)
!560 = !DILocation(line: 583, column: 28, scope: !559)
!561 = !DILocation(line: 583, column: 41, scope: !559)
!562 = !DILocation(line: 583, column: 44, scope: !559)
!563 = !DILocation(line: 583, column: 56, scope: !559)
!564 = !DILocation(line: 583, column: 16, scope: !532)
!565 = !DILocation(line: 584, column: 17, scope: !566)
!566 = distinct !DILexicalBlock(scope: !559, file: !3, line: 583, column: 70)
!567 = !DILocation(line: 584, column: 23, scope: !566)
!568 = !DILocation(line: 584, column: 36, scope: !566)
!569 = !DILocation(line: 584, column: 45, scope: !566)
!570 = !DILocation(line: 584, column: 49, scope: !566)
!571 = !DILocation(line: 584, column: 71, scope: !566)
!572 = !DILocation(line: 0, scope: !566)
!573 = !DILocation(line: 586, column: 21, scope: !574)
!574 = distinct !DILexicalBlock(scope: !566, file: !3, line: 584, column: 91)
!575 = !DILocation(line: 587, column: 21, scope: !574)
!576 = !DILocation(line: 587, column: 21, scope: !577)
!577 = distinct !DILexicalBlock(scope: !578, file: !3, line: 587, column: 21)
!578 = distinct !DILexicalBlock(scope: !574, file: !3, line: 587, column: 21)
!579 = !DILocation(line: 587, column: 21, scope: !578)
!580 = !DILocation(line: 587, column: 21, scope: !581)
!581 = distinct !DILexicalBlock(scope: !577, file: !3, line: 587, column: 21)
!582 = !DILocalVariable(name: "__x", scope: !583, file: !3, line: 587, type: !6)
!583 = distinct !DILexicalBlock(scope: !581, file: !3, line: 587, column: 21)
!584 = !DILocation(line: 587, column: 21, scope: !583)
!585 = !{i32 -2146570243}
!586 = !DILocalVariable(name: "__x", scope: !587, file: !3, line: 587, type: !6)
!587 = distinct !DILexicalBlock(scope: !581, file: !3, line: 587, column: 21)
!588 = !DILocation(line: 587, column: 21, scope: !587)
!589 = !{i32 -2146570118}
!590 = !DILocation(line: 587, column: 21, scope: !591)
!591 = distinct !DILexicalBlock(scope: !577, file: !3, line: 587, column: 21)
!592 = !DILocalVariable(name: "__x", scope: !593, file: !3, line: 587, type: !6)
!593 = distinct !DILexicalBlock(scope: !591, file: !3, line: 587, column: 21)
!594 = !DILocation(line: 587, column: 21, scope: !593)
!595 = !{i32 -2146569986}
!596 = !DILocalVariable(name: "__x", scope: !597, file: !3, line: 587, type: !6)
!597 = distinct !DILexicalBlock(scope: !591, file: !3, line: 587, column: 21)
!598 = !DILocation(line: 587, column: 21, scope: !597)
!599 = !{i32 -2146569861}
!600 = distinct !{!600, !565, !601}
!601 = !DILocation(line: 589, column: 17, scope: !566)
!602 = !DILocation(line: 590, column: 13, scope: !566)
!603 = !DILocation(line: 593, column: 13, scope: !532)
!604 = !DILocation(line: 594, column: 13, scope: !532)
!605 = !DILocation(line: 594, column: 13, scope: !606)
!606 = distinct !DILexicalBlock(scope: !607, file: !3, line: 594, column: 13)
!607 = distinct !DILexicalBlock(scope: !532, file: !3, line: 594, column: 13)
!608 = !DILocation(line: 594, column: 13, scope: !607)
!609 = !DILocation(line: 594, column: 13, scope: !610)
!610 = distinct !DILexicalBlock(scope: !606, file: !3, line: 594, column: 13)
!611 = !DILocalVariable(name: "__x", scope: !612, file: !3, line: 594, type: !6)
!612 = distinct !DILexicalBlock(scope: !610, file: !3, line: 594, column: 13)
!613 = !DILocation(line: 594, column: 13, scope: !612)
!614 = !{i32 -2146567737}
!615 = !DILocalVariable(name: "__x", scope: !616, file: !3, line: 594, type: !6)
!616 = distinct !DILexicalBlock(scope: !610, file: !3, line: 594, column: 13)
!617 = !DILocation(line: 594, column: 13, scope: !616)
!618 = !{i32 -2146567612}
!619 = !DILocation(line: 594, column: 13, scope: !620)
!620 = distinct !DILexicalBlock(scope: !606, file: !3, line: 594, column: 13)
!621 = !DILocalVariable(name: "__x", scope: !622, file: !3, line: 594, type: !6)
!622 = distinct !DILexicalBlock(scope: !620, file: !3, line: 594, column: 13)
!623 = !DILocation(line: 594, column: 13, scope: !622)
!624 = !{i32 -2146567480}
!625 = !DILocalVariable(name: "__x", scope: !626, file: !3, line: 594, type: !6)
!626 = distinct !DILexicalBlock(scope: !620, file: !3, line: 594, column: 13)
!627 = !DILocation(line: 594, column: 13, scope: !626)
!628 = !{i32 -2146567355}
!629 = !DILocation(line: 596, column: 9, scope: !532)
!630 = !DILocation(line: 598, column: 13, scope: !631)
!631 = distinct !DILexicalBlock(scope: !528, file: !3, line: 596, column: 16)
!632 = !DILocation(line: 599, column: 13, scope: !631)
!633 = !DILocation(line: 599, column: 13, scope: !634)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 599, column: 13)
!635 = distinct !DILexicalBlock(scope: !631, file: !3, line: 599, column: 13)
!636 = !DILocation(line: 599, column: 13, scope: !635)
!637 = !DILocation(line: 599, column: 13, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !3, line: 599, column: 13)
!639 = !DILocalVariable(name: "__x", scope: !640, file: !3, line: 599, type: !6)
!640 = distinct !DILexicalBlock(scope: !638, file: !3, line: 599, column: 13)
!641 = !DILocation(line: 599, column: 13, scope: !640)
!642 = !{i32 -2146565231}
!643 = !DILocalVariable(name: "__x", scope: !644, file: !3, line: 599, type: !6)
!644 = distinct !DILexicalBlock(scope: !638, file: !3, line: 599, column: 13)
!645 = !DILocation(line: 599, column: 13, scope: !644)
!646 = !{i32 -2146565106}
!647 = !DILocation(line: 599, column: 13, scope: !648)
!648 = distinct !DILexicalBlock(scope: !634, file: !3, line: 599, column: 13)
!649 = !DILocalVariable(name: "__x", scope: !650, file: !3, line: 599, type: !6)
!650 = distinct !DILexicalBlock(scope: !648, file: !3, line: 599, column: 13)
!651 = !DILocation(line: 599, column: 13, scope: !650)
!652 = !{i32 -2146564974}
!653 = !DILocalVariable(name: "__x", scope: !654, file: !3, line: 599, type: !6)
!654 = distinct !DILexicalBlock(scope: !648, file: !3, line: 599, column: 13)
!655 = !DILocation(line: 599, column: 13, scope: !654)
!656 = !{i32 -2146564849}
!657 = !DILocation(line: 603, column: 13, scope: !631)
!658 = !DILocation(line: 604, column: 13, scope: !631)
!659 = !DILocation(line: 604, column: 13, scope: !660)
!660 = distinct !DILexicalBlock(scope: !661, file: !3, line: 604, column: 13)
!661 = distinct !DILexicalBlock(scope: !631, file: !3, line: 604, column: 13)
!662 = !DILocation(line: 604, column: 13, scope: !661)
!663 = !DILocation(line: 604, column: 13, scope: !664)
!664 = distinct !DILexicalBlock(scope: !660, file: !3, line: 604, column: 13)
!665 = !DILocalVariable(name: "__x", scope: !666, file: !3, line: 604, type: !6)
!666 = distinct !DILexicalBlock(scope: !664, file: !3, line: 604, column: 13)
!667 = !DILocation(line: 604, column: 13, scope: !666)
!668 = !{i32 -2146562725}
!669 = !DILocalVariable(name: "__x", scope: !670, file: !3, line: 604, type: !6)
!670 = distinct !DILexicalBlock(scope: !664, file: !3, line: 604, column: 13)
!671 = !DILocation(line: 604, column: 13, scope: !670)
!672 = !{i32 -2146562600}
!673 = !DILocation(line: 604, column: 13, scope: !674)
!674 = distinct !DILexicalBlock(scope: !660, file: !3, line: 604, column: 13)
!675 = !DILocalVariable(name: "__x", scope: !676, file: !3, line: 604, type: !6)
!676 = distinct !DILexicalBlock(scope: !674, file: !3, line: 604, column: 13)
!677 = !DILocation(line: 604, column: 13, scope: !676)
!678 = !{i32 -2146562468}
!679 = !DILocalVariable(name: "__x", scope: !680, file: !3, line: 604, type: !6)
!680 = distinct !DILexicalBlock(scope: !674, file: !3, line: 604, column: 13)
!681 = !DILocation(line: 604, column: 13, scope: !680)
!682 = !{i32 -2146562343}
!683 = distinct !{!683, !419, !684}
!684 = !DILocation(line: 607, column: 5, scope: !404)
!685 = !DILocation(line: 609, column: 5, scope: !404)
!686 = !DILocation(line: 610, column: 1, scope: !404)
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
