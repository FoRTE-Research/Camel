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
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !307
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !307
  %8 = load i16, i16* %index2_victim, align 2, !dbg !309
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %8, !dbg !307
  %9 = load i16, i16* %arrayidx, align 2, !dbg !307
  %tobool = icmp ne i16 %9, 0, !dbg !307
  br i1 %tobool, label %if.end, label %if.then, !dbg !310

if.then:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !311
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !311
  store i8 1, i8* %success, align 2, !dbg !313
  %11 = load i16, i16* %fp_victim, align 2, !dbg !314
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !315
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !315
  %13 = load i16, i16* %index2_victim, align 2, !dbg !316
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %13, !dbg !315
  store i16 %11, i16* %arrayidx6, align 2, !dbg !317
  br label %return, !dbg !318

if.end:                                           ; preds = %entry
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !319
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !319
  %15 = load i16, i16* %relocation_count, align 2, !dbg !319
  %cmp = icmp uge i16 %15, 8, !dbg !321
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !322

if.then8:                                         ; preds = %if.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !323
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !323
  store i8 0, i8* %success10, align 2, !dbg !325
  br label %return, !dbg !326

if.end11:                                         ; preds = %if.end
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !327
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !327
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !327
  %18 = load i16, i16* %relocation_count13, align 2, !dbg !328
  %inc = add i16 %18, 1, !dbg !328
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !328
  %19 = load i16, i16* %index2_victim, align 2, !dbg !329
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !330
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !330
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !330
  store i16 %19, i16* %index115, align 2, !dbg !331
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !332
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !332
  %22 = load i16, i16* %index2_victim, align 2, !dbg !333
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %22, !dbg !332
  %23 = load i16, i16* %arrayidx18, align 2, !dbg !332
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !334
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !334
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !334
  store i16 %23, i16* %fingerprint20, align 2, !dbg !335
  %25 = load i16, i16* %fp_victim, align 2, !dbg !336
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !337
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !337
  %27 = load i16, i16* %index2_victim, align 2, !dbg !338
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %27, !dbg !337
  store i16 %25, i16* %arrayidx23, align 2, !dbg !339
  br label %return, !dbg !340

return:                                           ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !340
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() #0 !dbg !341 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !342
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !342
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !342
  %1 = load i16, i16* %insert_count, align 2, !dbg !343
  %inc = add i16 %1, 1, !dbg !343
  store i16 %inc, i16* %insert_count, align 2, !dbg !343
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !344
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !344
  %3 = load i8, i8* %success, align 2, !dbg !344
  %tobool = trunc i8 %3 to i1, !dbg !344
  %conv = zext i1 %tobool to i16, !dbg !344
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !345
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !345
  %5 = load i16, i16* %inserted_count, align 2, !dbg !346
  %add = add i16 %5, %conv, !dbg !346
  store i16 %add, i16* %inserted_count, align 2, !dbg !346
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !347
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !347
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !347
  %7 = load i16, i16* %insert_count4, align 2, !dbg !347
  %cmp = icmp ult i16 %7, 32, !dbg !349
  br i1 %cmp, label %if.then, label %if.else, !dbg !350

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !351

if.else:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !353
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !353
  store i16 1, i16* %key, align 2, !dbg !355
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #0 !dbg !357 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !358
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !358
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !360
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !360
  %2 = load i16, i16* %index1, align 2, !dbg !360
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !358
  %3 = load i16, i16* %arrayidx, align 2, !dbg !358
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !361
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !361
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !361
  %5 = load i16, i16* %fingerprint, align 2, !dbg !361
  %cmp = icmp eq i16 %3, %5, !dbg !362
  br i1 %cmp, label %if.then, label %if.else, !dbg !363

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !364
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !364
  store i8 1, i8* %member, align 1, !dbg !366
  br label %if.end17, !dbg !367

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !368
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !368
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !368
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !371
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !371
  %9 = load i16, i16* %index2, align 2, !dbg !371
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !368
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !368
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !372
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !372
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !372
  %cmp10 = icmp eq i16 %10, %12, !dbg !373
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !374

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !375
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !375
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !375
  store i8 1, i8* %member13, align 1, !dbg !377
  br label %if.end, !dbg !378

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !379
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !379
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !379
  store i8 0, i8* %member16, align 1, !dbg !381
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !382
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !382
  %member19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 11, !dbg !382
  %16 = load i8, i8* %member19, align 1, !dbg !382
  %tobool = trunc i8 %16 to i1, !dbg !382
  br i1 %tobool, label %if.end21, label %if.then20, !dbg !384

if.then20:                                        ; preds = %if.end17
  br label %if.end21, !dbg !385

if.end21:                                         ; preds = %if.then20, %if.end17
  ret void, !dbg !387
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #0 !dbg !388 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !389
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !389
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !389
  %1 = load i16, i16* %lookup_count, align 2, !dbg !390
  %inc = add i16 %1, 1, !dbg !390
  store i16 %inc, i16* %lookup_count, align 2, !dbg !390
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !391
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !391
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !391
  %3 = load i8, i8* %member, align 1, !dbg !391
  %tobool = trunc i8 %3 to i1, !dbg !391
  %conv = zext i1 %tobool to i16, !dbg !391
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !392
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !392
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !392
  %5 = load i16, i16* %member_count, align 2, !dbg !393
  %add = add i16 %5, %conv, !dbg !393
  store i16 %add, i16* %member_count, align 2, !dbg !393
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !394
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !394
  %lookup_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !394
  %7 = load i16, i16* %lookup_count4, align 2, !dbg !394
  %cmp = icmp ult i16 %7, 32, !dbg !396
  br i1 %cmp, label %if.then, label %if.else, !dbg !397

if.then:                                          ; preds = %entry
  br label %if.end, !dbg !398

if.else:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !400
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !401 {
entry:
  call void @exit(i16 0) #6, !dbg !402
  unreachable, !dbg !402
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit_done() #0 !dbg !403 {
entry:
  ret void, !dbg !404
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !405 {
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
  %__x29 = alloca i16, align 2
  %tmp30 = alloca i16, align 2
  %__x32 = alloca i16, align 2
  %tmp33 = alloca i16, align 2
  %__x42 = alloca i16, align 2
  %tmp43 = alloca i16, align 2
  %__x45 = alloca i16, align 2
  %tmp46 = alloca i16, align 2
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
  %__x122 = alloca i16, align 2
  %tmp123 = alloca i16, align 2
  %__x125 = alloca i16, align 2
  %tmp126 = alloca i16, align 2
  %__x135 = alloca i16, align 2
  %tmp136 = alloca i16, align 2
  %__x138 = alloca i16, align 2
  %tmp139 = alloca i16, align 2
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
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !410
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !411
  call void @camel_init(), !dbg !412
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !413
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !413
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !413
  %1 = load i16, i16* @writeOpt, align 2, !dbg !413
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %1, !dbg !413
  %2 = load i16, i16* %arrayidx, align 2, !dbg !413
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !413
  %filter2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !413
  %4 = load i16, i16* @writeOpt, align 2, !dbg !413
  %arrayidx3 = getelementptr inbounds [128 x i16], [128 x i16]* %filter2, i16 0, i16 %4, !dbg !413
  store i16 %2, i16* %arrayidx3, align 2, !dbg !413
  call void @task_init(), !dbg !414
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !415
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !416
  %6 = bitcast %struct.camel_global_t* %globals4 to i8*, !dbg !417
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !419
  %8 = bitcast %struct.camel_global_t* %globals5 to i8*, !dbg !417
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %8, i16 276, i1 false), !dbg !417
  call void @task_commit_done(), !dbg !420
  br label %while.cond, !dbg !421

while.cond:                                       ; preds = %if.end292, %entry
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !422
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !422
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !422
  %10 = load i16, i16* %lookup_count, align 2, !dbg !422
  %cmp = icmp ult i16 %10, 32, !dbg !423
  br i1 %cmp, label %while.body, label %while.end293, !dbg !421

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !424
  br label %do.body, !dbg !426

do.body:                                          ; preds = %while.body
  %11 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !427
  %cmp7 = icmp eq i16 %11, 1, !dbg !427
  br i1 %cmp7, label %if.then, label %if.else, !dbg !430

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !431
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !431
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !431
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !431
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !431
  call void @__dump_registers(i16* %arraydecay), !dbg !431
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !433, metadata !DIExpression()), !dbg !435
  %13 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !435, !srcloc !436
  store i16 %13, i16* %__x, align 2, !dbg !435
  %14 = load i16, i16* %__x, align 2, !dbg !435
  store i16 %14, i16* %tmp, align 2, !dbg !435
  %15 = load i16, i16* %tmp, align 2, !dbg !435
  %add = add i16 %15, 2, !dbg !431
  %16 = inttoptr i16 %add to i8*, !dbg !431
  call void @llvm.dbg.declare(metadata i16* %__x8, metadata !437, metadata !DIExpression()), !dbg !439
  %17 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !439, !srcloc !440
  store i16 %17, i16* %__x8, align 2, !dbg !439
  %18 = load i16, i16* %__x8, align 2, !dbg !439
  store i16 %18, i16* %tmp9, align 2, !dbg !439
  %19 = load i16, i16* %tmp9, align 2, !dbg !439
  %add10 = add i16 %19, 2, !dbg !431
  %sub = sub i16 9216, %add10, !dbg !431
  %call = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext %sub, i16 zeroext -1), !dbg !431
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !431
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !431
  %21 = bitcast %struct.camel_buffer_t* %20 to i8*, !dbg !431
  %22 = load i16, i16* @tmp_stack_crc, align 2, !dbg !431
  %call11 = call zeroext i16 @__fast_hw_crc(i8* %21, i16 zeroext 298, i16 zeroext %22), !dbg !431
  store i16 %call11, i16* @tmp_stack_buf_crc, align 2, !dbg !431
  %23 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !431
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !431
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 2, !dbg !431
  store i16 %23, i16* %stack_and_buf_crc, align 2, !dbg !431
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !431
  br label %if.end, !dbg !431

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !441
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !441
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !441
  %reg_file12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !441
  %arraydecay13 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file12, i16 0, i16 0, !dbg !441
  call void @__dump_registers(i16* %arraydecay13), !dbg !441
  call void @llvm.dbg.declare(metadata i16* %__x14, metadata !443, metadata !DIExpression()), !dbg !445
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !445, !srcloc !446
  store i16 %26, i16* %__x14, align 2, !dbg !445
  %27 = load i16, i16* %__x14, align 2, !dbg !445
  store i16 %27, i16* %tmp15, align 2, !dbg !445
  %28 = load i16, i16* %tmp15, align 2, !dbg !445
  %add16 = add i16 %28, 2, !dbg !441
  %29 = inttoptr i16 %add16 to i8*, !dbg !441
  call void @llvm.dbg.declare(metadata i16* %__x17, metadata !447, metadata !DIExpression()), !dbg !449
  %30 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !449, !srcloc !450
  store i16 %30, i16* %__x17, align 2, !dbg !449
  %31 = load i16, i16* %__x17, align 2, !dbg !449
  store i16 %31, i16* %tmp18, align 2, !dbg !449
  %32 = load i16, i16* %tmp18, align 2, !dbg !449
  %add19 = add i16 %32, 2, !dbg !441
  %sub20 = sub i16 9216, %add19, !dbg !441
  %call21 = call zeroext i16 @__fast_hw_crc(i8* %29, i16 zeroext %sub20, i16 zeroext -1), !dbg !441
  store i16 %call21, i16* @tmp_stack_crc, align 2, !dbg !441
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !441
  %34 = bitcast %struct.camel_buffer_t* %33 to i8*, !dbg !441
  %35 = load i16, i16* @tmp_stack_crc, align 2, !dbg !441
  %call22 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext 298, i16 zeroext %35), !dbg !441
  store i16 %call22, i16* @tmp_stack_buf_crc, align 2, !dbg !441
  %36 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !441
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !441
  %stack_and_buf_crc23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 2, !dbg !441
  store i16 %36, i16* %stack_and_buf_crc23, align 2, !dbg !441
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !441
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !430

do.end:                                           ; preds = %if.end
  call void @task_commit_done(), !dbg !451
  call void @task_calc_indexes(), !dbg !452
  br label %do.body24, !dbg !453

do.body24:                                        ; preds = %do.end
  %38 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !454
  %cmp25 = icmp eq i16 %38, 1, !dbg !454
  br i1 %cmp25, label %if.then26, label %if.else39, !dbg !457

if.then26:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !458
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !458
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %reg_file27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 0, !dbg !458
  %arraydecay28 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file27, i16 0, i16 0, !dbg !458
  call void @__dump_registers(i16* %arraydecay28), !dbg !458
  call void @llvm.dbg.declare(metadata i16* %__x29, metadata !460, metadata !DIExpression()), !dbg !462
  %40 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !462, !srcloc !463
  store i16 %40, i16* %__x29, align 2, !dbg !462
  %41 = load i16, i16* %__x29, align 2, !dbg !462
  store i16 %41, i16* %tmp30, align 2, !dbg !462
  %42 = load i16, i16* %tmp30, align 2, !dbg !462
  %add31 = add i16 %42, 2, !dbg !458
  %43 = inttoptr i16 %add31 to i8*, !dbg !458
  call void @llvm.dbg.declare(metadata i16* %__x32, metadata !464, metadata !DIExpression()), !dbg !466
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !466, !srcloc !467
  store i16 %44, i16* %__x32, align 2, !dbg !466
  %45 = load i16, i16* %__x32, align 2, !dbg !466
  store i16 %45, i16* %tmp33, align 2, !dbg !466
  %46 = load i16, i16* %tmp33, align 2, !dbg !466
  %add34 = add i16 %46, 2, !dbg !458
  %sub35 = sub i16 9216, %add34, !dbg !458
  %call36 = call zeroext i16 @__fast_hw_crc(i8* %43, i16 zeroext %sub35, i16 zeroext -1), !dbg !458
  store i16 %call36, i16* @tmp_stack_crc, align 2, !dbg !458
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %48 = bitcast %struct.camel_buffer_t* %47 to i8*, !dbg !458
  %49 = load i16, i16* @tmp_stack_crc, align 2, !dbg !458
  %call37 = call zeroext i16 @__fast_hw_crc(i8* %48, i16 zeroext 298, i16 zeroext %49), !dbg !458
  store i16 %call37, i16* @tmp_stack_buf_crc, align 2, !dbg !458
  %50 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !458
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !458
  %stack_and_buf_crc38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 2, !dbg !458
  store i16 %50, i16* %stack_and_buf_crc38, align 2, !dbg !458
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !458
  br label %if.end52, !dbg !458

if.else39:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !468
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !468
  %52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %reg_file40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %52, i32 0, i32 0, !dbg !468
  %arraydecay41 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file40, i16 0, i16 0, !dbg !468
  call void @__dump_registers(i16* %arraydecay41), !dbg !468
  call void @llvm.dbg.declare(metadata i16* %__x42, metadata !470, metadata !DIExpression()), !dbg !472
  %53 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !472, !srcloc !473
  store i16 %53, i16* %__x42, align 2, !dbg !472
  %54 = load i16, i16* %__x42, align 2, !dbg !472
  store i16 %54, i16* %tmp43, align 2, !dbg !472
  %55 = load i16, i16* %tmp43, align 2, !dbg !472
  %add44 = add i16 %55, 2, !dbg !468
  %56 = inttoptr i16 %add44 to i8*, !dbg !468
  call void @llvm.dbg.declare(metadata i16* %__x45, metadata !474, metadata !DIExpression()), !dbg !476
  %57 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !476, !srcloc !477
  store i16 %57, i16* %__x45, align 2, !dbg !476
  %58 = load i16, i16* %__x45, align 2, !dbg !476
  store i16 %58, i16* %tmp46, align 2, !dbg !476
  %59 = load i16, i16* %tmp46, align 2, !dbg !476
  %add47 = add i16 %59, 2, !dbg !468
  %sub48 = sub i16 9216, %add47, !dbg !468
  %call49 = call zeroext i16 @__fast_hw_crc(i8* %56, i16 zeroext %sub48, i16 zeroext -1), !dbg !468
  store i16 %call49, i16* @tmp_stack_crc, align 2, !dbg !468
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %61 = bitcast %struct.camel_buffer_t* %60 to i8*, !dbg !468
  %62 = load i16, i16* @tmp_stack_crc, align 2, !dbg !468
  %call50 = call zeroext i16 @__fast_hw_crc(i8* %61, i16 zeroext 298, i16 zeroext %62), !dbg !468
  store i16 %call50, i16* @tmp_stack_buf_crc, align 2, !dbg !468
  %63 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !468
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !468
  %stack_and_buf_crc51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %64, i32 0, i32 2, !dbg !468
  store i16 %63, i16* %stack_and_buf_crc51, align 2, !dbg !468
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !468
  br label %if.end52

if.end52:                                         ; preds = %if.else39, %if.then26
  br label %do.end53, !dbg !457

do.end53:                                         ; preds = %if.end52
  call void @task_commit_done(), !dbg !478
  call void @task_calc_indexes_index_1(), !dbg !479
  br label %do.body54, !dbg !480

do.body54:                                        ; preds = %do.end53
  %65 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !481
  %cmp55 = icmp eq i16 %65, 1, !dbg !481
  br i1 %cmp55, label %if.then56, label %if.else69, !dbg !484

if.then56:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !485
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !485
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !485
  %reg_file57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 0, !dbg !485
  %arraydecay58 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file57, i16 0, i16 0, !dbg !485
  call void @__dump_registers(i16* %arraydecay58), !dbg !485
  call void @llvm.dbg.declare(metadata i16* %__x59, metadata !487, metadata !DIExpression()), !dbg !489
  %67 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !489, !srcloc !490
  store i16 %67, i16* %__x59, align 2, !dbg !489
  %68 = load i16, i16* %__x59, align 2, !dbg !489
  store i16 %68, i16* %tmp60, align 2, !dbg !489
  %69 = load i16, i16* %tmp60, align 2, !dbg !489
  %add61 = add i16 %69, 2, !dbg !485
  %70 = inttoptr i16 %add61 to i8*, !dbg !485
  call void @llvm.dbg.declare(metadata i16* %__x62, metadata !491, metadata !DIExpression()), !dbg !493
  %71 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !493, !srcloc !494
  store i16 %71, i16* %__x62, align 2, !dbg !493
  %72 = load i16, i16* %__x62, align 2, !dbg !493
  store i16 %72, i16* %tmp63, align 2, !dbg !493
  %73 = load i16, i16* %tmp63, align 2, !dbg !493
  %add64 = add i16 %73, 2, !dbg !485
  %sub65 = sub i16 9216, %add64, !dbg !485
  %call66 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext %sub65, i16 zeroext -1), !dbg !485
  store i16 %call66, i16* @tmp_stack_crc, align 2, !dbg !485
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !485
  %75 = bitcast %struct.camel_buffer_t* %74 to i8*, !dbg !485
  %76 = load i16, i16* @tmp_stack_crc, align 2, !dbg !485
  %call67 = call zeroext i16 @__fast_hw_crc(i8* %75, i16 zeroext 298, i16 zeroext %76), !dbg !485
  store i16 %call67, i16* @tmp_stack_buf_crc, align 2, !dbg !485
  %77 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !485
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !485
  %stack_and_buf_crc68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 2, !dbg !485
  store i16 %77, i16* %stack_and_buf_crc68, align 2, !dbg !485
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !485
  br label %if.end82, !dbg !485

if.else69:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !495
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !495
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !495
  %reg_file70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 0, !dbg !495
  %arraydecay71 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file70, i16 0, i16 0, !dbg !495
  call void @__dump_registers(i16* %arraydecay71), !dbg !495
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !497, metadata !DIExpression()), !dbg !499
  %80 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !499, !srcloc !500
  store i16 %80, i16* %__x72, align 2, !dbg !499
  %81 = load i16, i16* %__x72, align 2, !dbg !499
  store i16 %81, i16* %tmp73, align 2, !dbg !499
  %82 = load i16, i16* %tmp73, align 2, !dbg !499
  %add74 = add i16 %82, 2, !dbg !495
  %83 = inttoptr i16 %add74 to i8*, !dbg !495
  call void @llvm.dbg.declare(metadata i16* %__x75, metadata !501, metadata !DIExpression()), !dbg !503
  %84 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !503, !srcloc !504
  store i16 %84, i16* %__x75, align 2, !dbg !503
  %85 = load i16, i16* %__x75, align 2, !dbg !503
  store i16 %85, i16* %tmp76, align 2, !dbg !503
  %86 = load i16, i16* %tmp76, align 2, !dbg !503
  %add77 = add i16 %86, 2, !dbg !495
  %sub78 = sub i16 9216, %add77, !dbg !495
  %call79 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext %sub78, i16 zeroext -1), !dbg !495
  store i16 %call79, i16* @tmp_stack_crc, align 2, !dbg !495
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !495
  %88 = bitcast %struct.camel_buffer_t* %87 to i8*, !dbg !495
  %89 = load i16, i16* @tmp_stack_crc, align 2, !dbg !495
  %call80 = call zeroext i16 @__fast_hw_crc(i8* %88, i16 zeroext 298, i16 zeroext %89), !dbg !495
  store i16 %call80, i16* @tmp_stack_buf_crc, align 2, !dbg !495
  %90 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !495
  %91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !495
  %stack_and_buf_crc81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i32 0, i32 2, !dbg !495
  store i16 %90, i16* %stack_and_buf_crc81, align 2, !dbg !495
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !495
  br label %if.end82

if.end82:                                         ; preds = %if.else69, %if.then56
  br label %do.end83, !dbg !484

do.end83:                                         ; preds = %if.end82
  call void @task_commit_done(), !dbg !505
  call void @task_calc_indexes_index_2(), !dbg !506
  br label %do.body84, !dbg !507

do.body84:                                        ; preds = %do.end83
  %92 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !508
  %cmp85 = icmp eq i16 %92, 1, !dbg !508
  br i1 %cmp85, label %if.then86, label %if.else99, !dbg !511

if.then86:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !512
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !512
  %93 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !512
  %reg_file87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %93, i32 0, i32 0, !dbg !512
  %arraydecay88 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file87, i16 0, i16 0, !dbg !512
  call void @__dump_registers(i16* %arraydecay88), !dbg !512
  call void @llvm.dbg.declare(metadata i16* %__x89, metadata !514, metadata !DIExpression()), !dbg !516
  %94 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !516, !srcloc !517
  store i16 %94, i16* %__x89, align 2, !dbg !516
  %95 = load i16, i16* %__x89, align 2, !dbg !516
  store i16 %95, i16* %tmp90, align 2, !dbg !516
  %96 = load i16, i16* %tmp90, align 2, !dbg !516
  %add91 = add i16 %96, 2, !dbg !512
  %97 = inttoptr i16 %add91 to i8*, !dbg !512
  call void @llvm.dbg.declare(metadata i16* %__x92, metadata !518, metadata !DIExpression()), !dbg !520
  %98 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !520, !srcloc !521
  store i16 %98, i16* %__x92, align 2, !dbg !520
  %99 = load i16, i16* %__x92, align 2, !dbg !520
  store i16 %99, i16* %tmp93, align 2, !dbg !520
  %100 = load i16, i16* %tmp93, align 2, !dbg !520
  %add94 = add i16 %100, 2, !dbg !512
  %sub95 = sub i16 9216, %add94, !dbg !512
  %call96 = call zeroext i16 @__fast_hw_crc(i8* %97, i16 zeroext %sub95, i16 zeroext -1), !dbg !512
  store i16 %call96, i16* @tmp_stack_crc, align 2, !dbg !512
  %101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !512
  %102 = bitcast %struct.camel_buffer_t* %101 to i8*, !dbg !512
  %103 = load i16, i16* @tmp_stack_crc, align 2, !dbg !512
  %call97 = call zeroext i16 @__fast_hw_crc(i8* %102, i16 zeroext 298, i16 zeroext %103), !dbg !512
  store i16 %call97, i16* @tmp_stack_buf_crc, align 2, !dbg !512
  %104 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !512
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !512
  %stack_and_buf_crc98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %105, i32 0, i32 2, !dbg !512
  store i16 %104, i16* %stack_and_buf_crc98, align 2, !dbg !512
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !512
  br label %if.end112, !dbg !512

if.else99:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !522
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !522
  %106 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %reg_file100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %106, i32 0, i32 0, !dbg !522
  %arraydecay101 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file100, i16 0, i16 0, !dbg !522
  call void @__dump_registers(i16* %arraydecay101), !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x102, metadata !524, metadata !DIExpression()), !dbg !526
  %107 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !526, !srcloc !527
  store i16 %107, i16* %__x102, align 2, !dbg !526
  %108 = load i16, i16* %__x102, align 2, !dbg !526
  store i16 %108, i16* %tmp103, align 2, !dbg !526
  %109 = load i16, i16* %tmp103, align 2, !dbg !526
  %add104 = add i16 %109, 2, !dbg !522
  %110 = inttoptr i16 %add104 to i8*, !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x105, metadata !528, metadata !DIExpression()), !dbg !530
  %111 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !530, !srcloc !531
  store i16 %111, i16* %__x105, align 2, !dbg !530
  %112 = load i16, i16* %__x105, align 2, !dbg !530
  store i16 %112, i16* %tmp106, align 2, !dbg !530
  %113 = load i16, i16* %tmp106, align 2, !dbg !530
  %add107 = add i16 %113, 2, !dbg !522
  %sub108 = sub i16 9216, %add107, !dbg !522
  %call109 = call zeroext i16 @__fast_hw_crc(i8* %110, i16 zeroext %sub108, i16 zeroext -1), !dbg !522
  store i16 %call109, i16* @tmp_stack_crc, align 2, !dbg !522
  %114 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %115 = bitcast %struct.camel_buffer_t* %114 to i8*, !dbg !522
  %116 = load i16, i16* @tmp_stack_crc, align 2, !dbg !522
  %call110 = call zeroext i16 @__fast_hw_crc(i8* %115, i16 zeroext 298, i16 zeroext %116), !dbg !522
  store i16 %call110, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %117 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %stack_and_buf_crc111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %118, i32 0, i32 2, !dbg !522
  store i16 %117, i16* %stack_and_buf_crc111, align 2, !dbg !522
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !522
  br label %if.end112

if.end112:                                        ; preds = %if.else99, %if.then86
  br label %do.end113, !dbg !511

do.end113:                                        ; preds = %if.end112
  call void @task_commit_done(), !dbg !532
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !533
  %globals114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %119, i32 0, i32 1, !dbg !533
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals114, i32 0, i32 6, !dbg !533
  %120 = load i16, i16* %insert_count, align 2, !dbg !533
  %cmp115 = icmp ult i16 %120, 32, !dbg !535
  br i1 %cmp115, label %if.then116, label %if.else229, !dbg !536

if.then116:                                       ; preds = %do.end113
  call void @task_add(), !dbg !537
  br label %do.body117, !dbg !539

do.body117:                                       ; preds = %if.then116
  %121 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !540
  %cmp118 = icmp eq i16 %121, 1, !dbg !540
  br i1 %cmp118, label %if.then119, label %if.else132, !dbg !543

if.then119:                                       ; preds = %do.body117
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !544
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !544
  %122 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %reg_file120 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %122, i32 0, i32 0, !dbg !544
  %arraydecay121 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file120, i16 0, i16 0, !dbg !544
  call void @__dump_registers(i16* %arraydecay121), !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x122, metadata !546, metadata !DIExpression()), !dbg !548
  %123 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !548, !srcloc !549
  store i16 %123, i16* %__x122, align 2, !dbg !548
  %124 = load i16, i16* %__x122, align 2, !dbg !548
  store i16 %124, i16* %tmp123, align 2, !dbg !548
  %125 = load i16, i16* %tmp123, align 2, !dbg !548
  %add124 = add i16 %125, 2, !dbg !544
  %126 = inttoptr i16 %add124 to i8*, !dbg !544
  call void @llvm.dbg.declare(metadata i16* %__x125, metadata !550, metadata !DIExpression()), !dbg !552
  %127 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !552, !srcloc !553
  store i16 %127, i16* %__x125, align 2, !dbg !552
  %128 = load i16, i16* %__x125, align 2, !dbg !552
  store i16 %128, i16* %tmp126, align 2, !dbg !552
  %129 = load i16, i16* %tmp126, align 2, !dbg !552
  %add127 = add i16 %129, 2, !dbg !544
  %sub128 = sub i16 9216, %add127, !dbg !544
  %call129 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext %sub128, i16 zeroext -1), !dbg !544
  store i16 %call129, i16* @tmp_stack_crc, align 2, !dbg !544
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %131 = bitcast %struct.camel_buffer_t* %130 to i8*, !dbg !544
  %132 = load i16, i16* @tmp_stack_crc, align 2, !dbg !544
  %call130 = call zeroext i16 @__fast_hw_crc(i8* %131, i16 zeroext 298, i16 zeroext %132), !dbg !544
  store i16 %call130, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %133 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !544
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !544
  %stack_and_buf_crc131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %134, i32 0, i32 2, !dbg !544
  store i16 %133, i16* %stack_and_buf_crc131, align 2, !dbg !544
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !544
  br label %if.end145, !dbg !544

if.else132:                                       ; preds = %do.body117
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !554
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !554
  %135 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %reg_file133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %135, i32 0, i32 0, !dbg !554
  %arraydecay134 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file133, i16 0, i16 0, !dbg !554
  call void @__dump_registers(i16* %arraydecay134), !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x135, metadata !556, metadata !DIExpression()), !dbg !558
  %136 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !558, !srcloc !559
  store i16 %136, i16* %__x135, align 2, !dbg !558
  %137 = load i16, i16* %__x135, align 2, !dbg !558
  store i16 %137, i16* %tmp136, align 2, !dbg !558
  %138 = load i16, i16* %tmp136, align 2, !dbg !558
  %add137 = add i16 %138, 2, !dbg !554
  %139 = inttoptr i16 %add137 to i8*, !dbg !554
  call void @llvm.dbg.declare(metadata i16* %__x138, metadata !560, metadata !DIExpression()), !dbg !562
  %140 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !562, !srcloc !563
  store i16 %140, i16* %__x138, align 2, !dbg !562
  %141 = load i16, i16* %__x138, align 2, !dbg !562
  store i16 %141, i16* %tmp139, align 2, !dbg !562
  %142 = load i16, i16* %tmp139, align 2, !dbg !562
  %add140 = add i16 %142, 2, !dbg !554
  %sub141 = sub i16 9216, %add140, !dbg !554
  %call142 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext %sub141, i16 zeroext -1), !dbg !554
  store i16 %call142, i16* @tmp_stack_crc, align 2, !dbg !554
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %144 = bitcast %struct.camel_buffer_t* %143 to i8*, !dbg !554
  %145 = load i16, i16* @tmp_stack_crc, align 2, !dbg !554
  %call143 = call zeroext i16 @__fast_hw_crc(i8* %144, i16 zeroext 298, i16 zeroext %145), !dbg !554
  store i16 %call143, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %146 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !554
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %stack_and_buf_crc144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 2, !dbg !554
  store i16 %146, i16* %stack_and_buf_crc144, align 2, !dbg !554
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !554
  br label %if.end145

if.end145:                                        ; preds = %if.else132, %if.then119
  br label %do.end146, !dbg !543

do.end146:                                        ; preds = %if.end145
  call void @task_commit_done(), !dbg !564
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !565
  %globals147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 1, !dbg !565
  %filter148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals147, i32 0, i32 0, !dbg !565
  %149 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !567
  %globals149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %149, i32 0, i32 1, !dbg !567
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals149, i32 0, i32 3, !dbg !567
  %150 = load i16, i16* %index1, align 2, !dbg !567
  %arrayidx150 = getelementptr inbounds [128 x i16], [128 x i16]* %filter148, i16 0, i16 %150, !dbg !565
  %151 = load i16, i16* %arrayidx150, align 2, !dbg !565
  %tobool = icmp ne i16 %151, 0, !dbg !565
  br i1 %tobool, label %land.lhs.true, label %if.end197, !dbg !568

land.lhs.true:                                    ; preds = %do.end146
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !569
  %globals151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 1, !dbg !569
  %filter152 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals151, i32 0, i32 0, !dbg !569
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !570
  %globals153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 1, !dbg !570
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals153, i32 0, i32 4, !dbg !570
  %154 = load i16, i16* %index2, align 2, !dbg !570
  %arrayidx154 = getelementptr inbounds [128 x i16], [128 x i16]* %filter152, i16 0, i16 %154, !dbg !569
  %155 = load i16, i16* %arrayidx154, align 2, !dbg !569
  %tobool155 = icmp ne i16 %155, 0, !dbg !569
  br i1 %tobool155, label %if.then156, label %if.end197, !dbg !571

if.then156:                                       ; preds = %land.lhs.true
  br label %while.cond157, !dbg !572

while.cond157:                                    ; preds = %do.end196, %if.then156
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !574
  %globals158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 1, !dbg !574
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals158, i32 0, i32 10, !dbg !574
  %157 = load i8, i8* %success, align 2, !dbg !574
  %tobool159 = trunc i8 %157 to i1, !dbg !574
  %conv = zext i1 %tobool159 to i16, !dbg !574
  %cmp160 = icmp eq i16 %conv, 0, !dbg !575
  br i1 %cmp160, label %land.rhs, label %land.end, !dbg !576

land.rhs:                                         ; preds = %while.cond157
  %158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !577
  %globals162 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %158, i32 0, i32 1, !dbg !577
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals162, i32 0, i32 5, !dbg !577
  %159 = load i16, i16* %relocation_count, align 2, !dbg !577
  %cmp163 = icmp ult i16 %159, 8, !dbg !578
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond157
  %160 = phi i1 [ false, %while.cond157 ], [ %cmp163, %land.rhs ], !dbg !579
  br i1 %160, label %while.body165, label %while.end, !dbg !572

while.body165:                                    ; preds = %land.end
  call void @task_relocate(), !dbg !580
  br label %do.body166, !dbg !582

do.body166:                                       ; preds = %while.body165
  %161 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !583
  %cmp167 = icmp eq i16 %161, 1, !dbg !583
  br i1 %cmp167, label %if.then169, label %if.else182, !dbg !586

if.then169:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !587
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !587
  %162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !587
  %reg_file170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %162, i32 0, i32 0, !dbg !587
  %arraydecay171 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file170, i16 0, i16 0, !dbg !587
  call void @__dump_registers(i16* %arraydecay171), !dbg !587
  call void @llvm.dbg.declare(metadata i16* %__x172, metadata !589, metadata !DIExpression()), !dbg !591
  %163 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !591, !srcloc !592
  store i16 %163, i16* %__x172, align 2, !dbg !591
  %164 = load i16, i16* %__x172, align 2, !dbg !591
  store i16 %164, i16* %tmp173, align 2, !dbg !591
  %165 = load i16, i16* %tmp173, align 2, !dbg !591
  %add174 = add i16 %165, 2, !dbg !587
  %166 = inttoptr i16 %add174 to i8*, !dbg !587
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !593, metadata !DIExpression()), !dbg !595
  %167 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !595, !srcloc !596
  store i16 %167, i16* %__x175, align 2, !dbg !595
  %168 = load i16, i16* %__x175, align 2, !dbg !595
  store i16 %168, i16* %tmp176, align 2, !dbg !595
  %169 = load i16, i16* %tmp176, align 2, !dbg !595
  %add177 = add i16 %169, 2, !dbg !587
  %sub178 = sub i16 9216, %add177, !dbg !587
  %call179 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext %sub178, i16 zeroext -1), !dbg !587
  store i16 %call179, i16* @tmp_stack_crc, align 2, !dbg !587
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !587
  %171 = bitcast %struct.camel_buffer_t* %170 to i8*, !dbg !587
  %172 = load i16, i16* @tmp_stack_crc, align 2, !dbg !587
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %171, i16 zeroext 298, i16 zeroext %172), !dbg !587
  store i16 %call180, i16* @tmp_stack_buf_crc, align 2, !dbg !587
  %173 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !587
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !587
  %stack_and_buf_crc181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %174, i32 0, i32 2, !dbg !587
  store i16 %173, i16* %stack_and_buf_crc181, align 2, !dbg !587
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !587
  br label %if.end195, !dbg !587

if.else182:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !597
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !597
  %175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %reg_file183 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %175, i32 0, i32 0, !dbg !597
  %arraydecay184 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file183, i16 0, i16 0, !dbg !597
  call void @__dump_registers(i16* %arraydecay184), !dbg !597
  call void @llvm.dbg.declare(metadata i16* %__x185, metadata !599, metadata !DIExpression()), !dbg !601
  %176 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !601, !srcloc !602
  store i16 %176, i16* %__x185, align 2, !dbg !601
  %177 = load i16, i16* %__x185, align 2, !dbg !601
  store i16 %177, i16* %tmp186, align 2, !dbg !601
  %178 = load i16, i16* %tmp186, align 2, !dbg !601
  %add187 = add i16 %178, 2, !dbg !597
  %179 = inttoptr i16 %add187 to i8*, !dbg !597
  call void @llvm.dbg.declare(metadata i16* %__x188, metadata !603, metadata !DIExpression()), !dbg !605
  %180 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !605, !srcloc !606
  store i16 %180, i16* %__x188, align 2, !dbg !605
  %181 = load i16, i16* %__x188, align 2, !dbg !605
  store i16 %181, i16* %tmp189, align 2, !dbg !605
  %182 = load i16, i16* %tmp189, align 2, !dbg !605
  %add190 = add i16 %182, 2, !dbg !597
  %sub191 = sub i16 9216, %add190, !dbg !597
  %call192 = call zeroext i16 @__fast_hw_crc(i8* %179, i16 zeroext %sub191, i16 zeroext -1), !dbg !597
  store i16 %call192, i16* @tmp_stack_crc, align 2, !dbg !597
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %184 = bitcast %struct.camel_buffer_t* %183 to i8*, !dbg !597
  %185 = load i16, i16* @tmp_stack_crc, align 2, !dbg !597
  %call193 = call zeroext i16 @__fast_hw_crc(i8* %184, i16 zeroext 298, i16 zeroext %185), !dbg !597
  store i16 %call193, i16* @tmp_stack_buf_crc, align 2, !dbg !597
  %186 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !597
  %187 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %stack_and_buf_crc194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %187, i32 0, i32 2, !dbg !597
  store i16 %186, i16* %stack_and_buf_crc194, align 2, !dbg !597
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !597
  br label %if.end195

if.end195:                                        ; preds = %if.else182, %if.then169
  br label %do.end196, !dbg !586

do.end196:                                        ; preds = %if.end195
  call void @task_commit_done(), !dbg !607
  br label %while.cond157, !dbg !572, !llvm.loop !608

while.end:                                        ; preds = %land.end
  br label %if.end197, !dbg !610

if.end197:                                        ; preds = %while.end, %land.lhs.true, %do.end146
  call void @task_insert_done(), !dbg !611
  br label %do.body198, !dbg !612

do.body198:                                       ; preds = %if.end197
  %188 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !613
  %cmp199 = icmp eq i16 %188, 1, !dbg !613
  br i1 %cmp199, label %if.then201, label %if.else214, !dbg !616

if.then201:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !617
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %189 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %reg_file202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %189, i32 0, i32 0, !dbg !617
  %arraydecay203 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file202, i16 0, i16 0, !dbg !617
  call void @__dump_registers(i16* %arraydecay203), !dbg !617
  call void @llvm.dbg.declare(metadata i16* %__x204, metadata !619, metadata !DIExpression()), !dbg !621
  %190 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !621, !srcloc !622
  store i16 %190, i16* %__x204, align 2, !dbg !621
  %191 = load i16, i16* %__x204, align 2, !dbg !621
  store i16 %191, i16* %tmp205, align 2, !dbg !621
  %192 = load i16, i16* %tmp205, align 2, !dbg !621
  %add206 = add i16 %192, 2, !dbg !617
  %193 = inttoptr i16 %add206 to i8*, !dbg !617
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !623, metadata !DIExpression()), !dbg !625
  %194 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !625, !srcloc !626
  store i16 %194, i16* %__x207, align 2, !dbg !625
  %195 = load i16, i16* %__x207, align 2, !dbg !625
  store i16 %195, i16* %tmp208, align 2, !dbg !625
  %196 = load i16, i16* %tmp208, align 2, !dbg !625
  %add209 = add i16 %196, 2, !dbg !617
  %sub210 = sub i16 9216, %add209, !dbg !617
  %call211 = call zeroext i16 @__fast_hw_crc(i8* %193, i16 zeroext %sub210, i16 zeroext -1), !dbg !617
  store i16 %call211, i16* @tmp_stack_crc, align 2, !dbg !617
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %198 = bitcast %struct.camel_buffer_t* %197 to i8*, !dbg !617
  %199 = load i16, i16* @tmp_stack_crc, align 2, !dbg !617
  %call212 = call zeroext i16 @__fast_hw_crc(i8* %198, i16 zeroext 298, i16 zeroext %199), !dbg !617
  store i16 %call212, i16* @tmp_stack_buf_crc, align 2, !dbg !617
  %200 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !617
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %stack_and_buf_crc213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %201, i32 0, i32 2, !dbg !617
  store i16 %200, i16* %stack_and_buf_crc213, align 2, !dbg !617
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !617
  br label %if.end227, !dbg !617

if.else214:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !627
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !627
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %reg_file215 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 0, !dbg !627
  %arraydecay216 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file215, i16 0, i16 0, !dbg !627
  call void @__dump_registers(i16* %arraydecay216), !dbg !627
  call void @llvm.dbg.declare(metadata i16* %__x217, metadata !629, metadata !DIExpression()), !dbg !631
  %203 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !631, !srcloc !632
  store i16 %203, i16* %__x217, align 2, !dbg !631
  %204 = load i16, i16* %__x217, align 2, !dbg !631
  store i16 %204, i16* %tmp218, align 2, !dbg !631
  %205 = load i16, i16* %tmp218, align 2, !dbg !631
  %add219 = add i16 %205, 2, !dbg !627
  %206 = inttoptr i16 %add219 to i8*, !dbg !627
  call void @llvm.dbg.declare(metadata i16* %__x220, metadata !633, metadata !DIExpression()), !dbg !635
  %207 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !635, !srcloc !636
  store i16 %207, i16* %__x220, align 2, !dbg !635
  %208 = load i16, i16* %__x220, align 2, !dbg !635
  store i16 %208, i16* %tmp221, align 2, !dbg !635
  %209 = load i16, i16* %tmp221, align 2, !dbg !635
  %add222 = add i16 %209, 2, !dbg !627
  %sub223 = sub i16 9216, %add222, !dbg !627
  %call224 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext %sub223, i16 zeroext -1), !dbg !627
  store i16 %call224, i16* @tmp_stack_crc, align 2, !dbg !627
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %211 = bitcast %struct.camel_buffer_t* %210 to i8*, !dbg !627
  %212 = load i16, i16* @tmp_stack_crc, align 2, !dbg !627
  %call225 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext 298, i16 zeroext %212), !dbg !627
  store i16 %call225, i16* @tmp_stack_buf_crc, align 2, !dbg !627
  %213 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !627
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %stack_and_buf_crc226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 2, !dbg !627
  store i16 %213, i16* %stack_and_buf_crc226, align 2, !dbg !627
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !627
  br label %if.end227

if.end227:                                        ; preds = %if.else214, %if.then201
  br label %do.end228, !dbg !616

do.end228:                                        ; preds = %if.end227
  call void @task_commit_done(), !dbg !637
  br label %if.end292, !dbg !638

if.else229:                                       ; preds = %do.end113
  call void @task_lookup_search(), !dbg !639
  br label %do.body230, !dbg !641

do.body230:                                       ; preds = %if.else229
  %215 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !642
  %cmp231 = icmp eq i16 %215, 1, !dbg !642
  br i1 %cmp231, label %if.then233, label %if.else246, !dbg !645

if.then233:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !646
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !646
  %216 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !646
  %reg_file234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %216, i32 0, i32 0, !dbg !646
  %arraydecay235 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file234, i16 0, i16 0, !dbg !646
  call void @__dump_registers(i16* %arraydecay235), !dbg !646
  call void @llvm.dbg.declare(metadata i16* %__x236, metadata !648, metadata !DIExpression()), !dbg !650
  %217 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !650, !srcloc !651
  store i16 %217, i16* %__x236, align 2, !dbg !650
  %218 = load i16, i16* %__x236, align 2, !dbg !650
  store i16 %218, i16* %tmp237, align 2, !dbg !650
  %219 = load i16, i16* %tmp237, align 2, !dbg !650
  %add238 = add i16 %219, 2, !dbg !646
  %220 = inttoptr i16 %add238 to i8*, !dbg !646
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !652, metadata !DIExpression()), !dbg !654
  %221 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !654, !srcloc !655
  store i16 %221, i16* %__x239, align 2, !dbg !654
  %222 = load i16, i16* %__x239, align 2, !dbg !654
  store i16 %222, i16* %tmp240, align 2, !dbg !654
  %223 = load i16, i16* %tmp240, align 2, !dbg !654
  %add241 = add i16 %223, 2, !dbg !646
  %sub242 = sub i16 9216, %add241, !dbg !646
  %call243 = call zeroext i16 @__fast_hw_crc(i8* %220, i16 zeroext %sub242, i16 zeroext -1), !dbg !646
  store i16 %call243, i16* @tmp_stack_crc, align 2, !dbg !646
  %224 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !646
  %225 = bitcast %struct.camel_buffer_t* %224 to i8*, !dbg !646
  %226 = load i16, i16* @tmp_stack_crc, align 2, !dbg !646
  %call244 = call zeroext i16 @__fast_hw_crc(i8* %225, i16 zeroext 298, i16 zeroext %226), !dbg !646
  store i16 %call244, i16* @tmp_stack_buf_crc, align 2, !dbg !646
  %227 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !646
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !646
  %stack_and_buf_crc245 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 2, !dbg !646
  store i16 %227, i16* %stack_and_buf_crc245, align 2, !dbg !646
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !646
  br label %if.end259, !dbg !646

if.else246:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !656
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !656
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !656
  %reg_file247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %229, i32 0, i32 0, !dbg !656
  %arraydecay248 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file247, i16 0, i16 0, !dbg !656
  call void @__dump_registers(i16* %arraydecay248), !dbg !656
  call void @llvm.dbg.declare(metadata i16* %__x249, metadata !658, metadata !DIExpression()), !dbg !660
  %230 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !660, !srcloc !661
  store i16 %230, i16* %__x249, align 2, !dbg !660
  %231 = load i16, i16* %__x249, align 2, !dbg !660
  store i16 %231, i16* %tmp250, align 2, !dbg !660
  %232 = load i16, i16* %tmp250, align 2, !dbg !660
  %add251 = add i16 %232, 2, !dbg !656
  %233 = inttoptr i16 %add251 to i8*, !dbg !656
  call void @llvm.dbg.declare(metadata i16* %__x252, metadata !662, metadata !DIExpression()), !dbg !664
  %234 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !664, !srcloc !665
  store i16 %234, i16* %__x252, align 2, !dbg !664
  %235 = load i16, i16* %__x252, align 2, !dbg !664
  store i16 %235, i16* %tmp253, align 2, !dbg !664
  %236 = load i16, i16* %tmp253, align 2, !dbg !664
  %add254 = add i16 %236, 2, !dbg !656
  %sub255 = sub i16 9216, %add254, !dbg !656
  %call256 = call zeroext i16 @__fast_hw_crc(i8* %233, i16 zeroext %sub255, i16 zeroext -1), !dbg !656
  store i16 %call256, i16* @tmp_stack_crc, align 2, !dbg !656
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !656
  %238 = bitcast %struct.camel_buffer_t* %237 to i8*, !dbg !656
  %239 = load i16, i16* @tmp_stack_crc, align 2, !dbg !656
  %call257 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext 298, i16 zeroext %239), !dbg !656
  store i16 %call257, i16* @tmp_stack_buf_crc, align 2, !dbg !656
  %240 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !656
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !656
  %stack_and_buf_crc258 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %241, i32 0, i32 2, !dbg !656
  store i16 %240, i16* %stack_and_buf_crc258, align 2, !dbg !656
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !656
  br label %if.end259

if.end259:                                        ; preds = %if.else246, %if.then233
  br label %do.end260, !dbg !645

do.end260:                                        ; preds = %if.end259
  call void @task_commit_done(), !dbg !666
  call void @task_lookup_done(), !dbg !667
  br label %do.body261, !dbg !668

do.body261:                                       ; preds = %do.end260
  %242 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !669
  %cmp262 = icmp eq i16 %242, 1, !dbg !669
  br i1 %cmp262, label %if.then264, label %if.else277, !dbg !672

if.then264:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !673
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !673
  %243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %reg_file265 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %243, i32 0, i32 0, !dbg !673
  %arraydecay266 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file265, i16 0, i16 0, !dbg !673
  call void @__dump_registers(i16* %arraydecay266), !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x267, metadata !675, metadata !DIExpression()), !dbg !677
  %244 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !677, !srcloc !678
  store i16 %244, i16* %__x267, align 2, !dbg !677
  %245 = load i16, i16* %__x267, align 2, !dbg !677
  store i16 %245, i16* %tmp268, align 2, !dbg !677
  %246 = load i16, i16* %tmp268, align 2, !dbg !677
  %add269 = add i16 %246, 2, !dbg !673
  %247 = inttoptr i16 %add269 to i8*, !dbg !673
  call void @llvm.dbg.declare(metadata i16* %__x270, metadata !679, metadata !DIExpression()), !dbg !681
  %248 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !681, !srcloc !682
  store i16 %248, i16* %__x270, align 2, !dbg !681
  %249 = load i16, i16* %__x270, align 2, !dbg !681
  store i16 %249, i16* %tmp271, align 2, !dbg !681
  %250 = load i16, i16* %tmp271, align 2, !dbg !681
  %add272 = add i16 %250, 2, !dbg !673
  %sub273 = sub i16 9216, %add272, !dbg !673
  %call274 = call zeroext i16 @__fast_hw_crc(i8* %247, i16 zeroext %sub273, i16 zeroext -1), !dbg !673
  store i16 %call274, i16* @tmp_stack_crc, align 2, !dbg !673
  %251 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %252 = bitcast %struct.camel_buffer_t* %251 to i8*, !dbg !673
  %253 = load i16, i16* @tmp_stack_crc, align 2, !dbg !673
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %252, i16 zeroext 298, i16 zeroext %253), !dbg !673
  store i16 %call275, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %254 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !673
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !673
  %stack_and_buf_crc276 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %255, i32 0, i32 2, !dbg !673
  store i16 %254, i16* %stack_and_buf_crc276, align 2, !dbg !673
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !673
  br label %if.end290, !dbg !673

if.else277:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !683
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !683
  %256 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !683
  %reg_file278 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %256, i32 0, i32 0, !dbg !683
  %arraydecay279 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file278, i16 0, i16 0, !dbg !683
  call void @__dump_registers(i16* %arraydecay279), !dbg !683
  call void @llvm.dbg.declare(metadata i16* %__x280, metadata !685, metadata !DIExpression()), !dbg !687
  %257 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !687, !srcloc !688
  store i16 %257, i16* %__x280, align 2, !dbg !687
  %258 = load i16, i16* %__x280, align 2, !dbg !687
  store i16 %258, i16* %tmp281, align 2, !dbg !687
  %259 = load i16, i16* %tmp281, align 2, !dbg !687
  %add282 = add i16 %259, 2, !dbg !683
  %260 = inttoptr i16 %add282 to i8*, !dbg !683
  call void @llvm.dbg.declare(metadata i16* %__x283, metadata !689, metadata !DIExpression()), !dbg !691
  %261 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !691, !srcloc !692
  store i16 %261, i16* %__x283, align 2, !dbg !691
  %262 = load i16, i16* %__x283, align 2, !dbg !691
  store i16 %262, i16* %tmp284, align 2, !dbg !691
  %263 = load i16, i16* %tmp284, align 2, !dbg !691
  %add285 = add i16 %263, 2, !dbg !683
  %sub286 = sub i16 9216, %add285, !dbg !683
  %call287 = call zeroext i16 @__fast_hw_crc(i8* %260, i16 zeroext %sub286, i16 zeroext -1), !dbg !683
  store i16 %call287, i16* @tmp_stack_crc, align 2, !dbg !683
  %264 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !683
  %265 = bitcast %struct.camel_buffer_t* %264 to i8*, !dbg !683
  %266 = load i16, i16* @tmp_stack_crc, align 2, !dbg !683
  %call288 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext 298, i16 zeroext %266), !dbg !683
  store i16 %call288, i16* @tmp_stack_buf_crc, align 2, !dbg !683
  %267 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !683
  %268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !683
  %stack_and_buf_crc289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %268, i32 0, i32 2, !dbg !683
  store i16 %267, i16* %stack_and_buf_crc289, align 2, !dbg !683
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !683
  br label %if.end290

if.end290:                                        ; preds = %if.else277, %if.then264
  br label %do.end291, !dbg !672

do.end291:                                        ; preds = %if.end290
  call void @task_commit_done(), !dbg !693
  br label %if.end292

if.end292:                                        ; preds = %do.end291, %do.end228
  br label %while.cond, !dbg !421, !llvm.loop !694

while.end293:                                     ; preds = %while.cond
  call void @task_done(), !dbg !696
  call void @task_commit_done(), !dbg !697
  %269 = load i16, i16* %retval, align 2, !dbg !698
  ret i16 %269, !dbg !698
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !699 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !702, metadata !DIExpression()), !dbg !703
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !704, metadata !DIExpression()), !dbg !705
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !706, metadata !DIExpression()), !dbg !707
  store i16 5381, i16* %hash, align 2, !dbg !707
  call void @llvm.dbg.declare(metadata i16* %i, metadata !708, metadata !DIExpression()), !dbg !709
  store i16 0, i16* %i, align 2, !dbg !710
  br label %for.cond, !dbg !712

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !713
  %1 = load i16, i16* %len.addr, align 2, !dbg !715
  %cmp = icmp ult i16 %0, %1, !dbg !716
  br i1 %cmp, label %for.body, label %for.end, !dbg !717

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !718
  %shl = shl i16 %2, 5, !dbg !719
  %3 = load i16, i16* %hash, align 2, !dbg !720
  %add = add i16 %shl, %3, !dbg !721
  %4 = load i8*, i8** %data.addr, align 2, !dbg !722
  %5 = load i8, i8* %4, align 1, !dbg !723
  %conv = zext i8 %5 to i16, !dbg !724
  %add1 = add i16 %add, %conv, !dbg !725
  store i16 %add1, i16* %hash, align 2, !dbg !726
  br label %for.inc, !dbg !727

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !728
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !728
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !728
  %7 = load i16, i16* %i, align 2, !dbg !729
  %inc = add i16 %7, 1, !dbg !729
  store i16 %inc, i16* %i, align 2, !dbg !729
  br label %for.cond, !dbg !730, !llvm.loop !731

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !733
  ret i16 %8, !dbg !734
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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 141, type: !71, isLocal: false, isDefinition: true)
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
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 223, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 17, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 424, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 638, type: !26, isLocal: true, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 52, type: !18, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 148, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 16)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 134, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 129, size: 2400, elements: !38)
!38 = !{!39, !44, !65}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !37, file: !3, line: 131, baseType: !40, size: 176)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 176, elements: !42)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 49, baseType: !18)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !37, file: !3, line: 132, baseType: !45, size: 2208, offset: 176)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 126, baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 112, size: 2208, elements: !47)
!47 = !{!48, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !46, file: !3, line: 114, baseType: !49, size: 2048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2048, elements: !51)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 19, baseType: !18)
!51 = !{!52}
!52 = !DISubrange(count: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !46, file: !3, line: 115, baseType: !17, size: 16, offset: 2048)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !46, file: !3, line: 116, baseType: !50, size: 16, offset: 2064)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !46, file: !3, line: 117, baseType: !17, size: 16, offset: 2080)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !46, file: !3, line: 118, baseType: !17, size: 16, offset: 2096)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !46, file: !3, line: 119, baseType: !17, size: 16, offset: 2112)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !46, file: !3, line: 120, baseType: !17, size: 16, offset: 2128)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !46, file: !3, line: 121, baseType: !17, size: 16, offset: 2144)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !46, file: !3, line: 122, baseType: !17, size: 16, offset: 2160)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !46, file: !3, line: 123, baseType: !17, size: 16, offset: 2176)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !46, file: !3, line: 124, baseType: !63, size: 8, offset: 2192)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !46, file: !3, line: 125, baseType: !63, size: 8, offset: 2200)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !37, file: !3, line: 133, baseType: !18, size: 16, offset: 2384)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 148, type: !35, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 177, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !42)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 136, size: 4816, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 138, baseType: !18, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 139, baseType: !36, size: 2400, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 140, baseType: !36, size: 2400, offset: 2416)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 150, type: !27, scopeLine: 150, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 151, column: 10, scope: !80)
!82 = !DILocation(line: 153, column: 9, scope: !80)
!83 = !DILocation(line: 155, column: 9, scope: !80)
!84 = !DILocation(line: 160, column: 11, scope: !80)
!85 = !DILocation(line: 165, column: 12, scope: !80)
!86 = !DILocation(line: 166, column: 10, scope: !80)
!87 = !DILocation(line: 167, column: 10, scope: !80)
!88 = !DILocation(line: 169, column: 10, scope: !80)
!89 = !DILocation(line: 170, column: 12, scope: !80)
!90 = !DILocation(line: 173, column: 10, scope: !80)
!91 = !DILocation(line: 175, column: 1, scope: !80)
!92 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 179, type: !27, scopeLine: 179, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 180, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !3, line: 180, column: 8)
!95 = !DILocation(line: 180, column: 19, scope: !94)
!96 = !DILocation(line: 180, column: 8, scope: !92)
!97 = !DILocation(line: 181, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 180, column: 34)
!99 = !DILocation(line: 182, column: 16, scope: !98)
!100 = !DILocation(line: 183, column: 5, scope: !98)
!101 = !DILocation(line: 183, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !3, line: 183, column: 15)
!103 = !DILocation(line: 183, column: 26, scope: !102)
!104 = !DILocation(line: 183, column: 15, scope: !94)
!105 = !DILocation(line: 184, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 183, column: 41)
!107 = !DILocation(line: 185, column: 16, scope: !106)
!108 = !DILocation(line: 186, column: 5, scope: !106)
!109 = !DILocation(line: 187, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !3, line: 186, column: 12)
!111 = !DILocation(line: 204, column: 3, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !3, line: 204, column: 3)
!113 = !{i32 -2146587131}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 206, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 33)
!116 = !DILocation(line: 206, column: 33, scope: !115)
!117 = !{i32 -2146586895}
!118 = !DILocation(line: 206, column: 51, scope: !92)
!119 = !DILocation(line: 206, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 206, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 65)
!122 = !DILocation(line: 206, column: 65, scope: !121)
!123 = !{i32 -2146586770}
!124 = !DILocation(line: 206, column: 83, scope: !92)
!125 = !DILocation(line: 206, column: 63, scope: !92)
!126 = !DILocation(line: 206, column: 19, scope: !92)
!127 = !DILocation(line: 206, column: 17, scope: !92)
!128 = !DILocation(line: 207, column: 37, scope: !92)
!129 = !DILocation(line: 207, column: 71, scope: !92)
!130 = !DILocation(line: 207, column: 23, scope: !92)
!131 = !DILocation(line: 207, column: 21, scope: !92)
!132 = !DILocation(line: 210, column: 6, scope: !133)
!133 = distinct !DILexicalBlock(scope: !92, file: !3, line: 210, column: 6)
!134 = !DILocation(line: 210, column: 27, scope: !133)
!135 = !DILocation(line: 210, column: 33, scope: !133)
!136 = !DILocation(line: 210, column: 24, scope: !133)
!137 = !DILocation(line: 210, column: 6, scope: !92)
!138 = !DILocation(line: 211, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 210, column: 51)
!140 = !DILocation(line: 211, column: 4, scope: !139)
!141 = !DILocation(line: 211, column: 19, scope: !139)
!142 = !DILocation(line: 212, column: 4, scope: !139)
!143 = !DILocation(line: 213, column: 24, scope: !139)
!144 = !DILocation(line: 213, column: 30, scope: !139)
!145 = !DILocation(line: 213, column: 4, scope: !139)
!146 = !DILocation(line: 214, column: 3, scope: !139)
!147 = !DILocation(line: 215, column: 4, scope: !148)
!148 = distinct !DILexicalBlock(scope: !133, file: !3, line: 214, column: 9)
!149 = !DILocation(line: 218, column: 1, scope: !92)
!150 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 264, type: !27, scopeLine: 265, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "i", scope: !150, file: !3, line: 266, type: !6)
!152 = !DILocation(line: 266, column: 14, scope: !150)
!153 = !DILocation(line: 267, column: 12, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 267, column: 5)
!155 = !DILocation(line: 267, column: 10, scope: !154)
!156 = !DILocation(line: 267, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 267, column: 5)
!158 = !DILocation(line: 267, column: 19, scope: !157)
!159 = !DILocation(line: 267, column: 5, scope: !154)
!160 = !DILocation(line: 268, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 267, column: 40)
!162 = !DILocation(line: 268, column: 20, scope: !161)
!163 = !DILocation(line: 268, column: 23, scope: !161)
!164 = !DILocation(line: 270, column: 5, scope: !161)
!165 = !DILocation(line: 267, column: 35, scope: !157)
!166 = !DILocation(line: 267, column: 5, scope: !157)
!167 = distinct !{!167, !159, !168}
!168 = !DILocation(line: 270, column: 5, scope: !154)
!169 = !DILocation(line: 271, column: 5, scope: !150)
!170 = !DILocation(line: 271, column: 22, scope: !150)
!171 = !DILocation(line: 272, column: 5, scope: !150)
!172 = !DILocation(line: 272, column: 22, scope: !150)
!173 = !DILocation(line: 273, column: 5, scope: !150)
!174 = !DILocation(line: 273, column: 24, scope: !150)
!175 = !DILocation(line: 274, column: 5, scope: !150)
!176 = !DILocation(line: 274, column: 22, scope: !150)
!177 = !DILocation(line: 275, column: 5, scope: !150)
!178 = !DILocation(line: 275, column: 13, scope: !150)
!179 = !DILocation(line: 276, column: 1, scope: !150)
!180 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 294, type: !27, scopeLine: 295, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 297, column: 16, scope: !180)
!182 = !DILocation(line: 297, column: 24, scope: !180)
!183 = !DILocation(line: 297, column: 29, scope: !180)
!184 = !DILocation(line: 297, column: 5, scope: !180)
!185 = !DILocation(line: 297, column: 13, scope: !180)
!186 = !DILocation(line: 298, column: 1, scope: !180)
!187 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 316, type: !27, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 318, column: 43, scope: !187)
!189 = !DILocation(line: 318, column: 23, scope: !187)
!190 = !DILocation(line: 318, column: 5, scope: !187)
!191 = !DILocation(line: 318, column: 21, scope: !187)
!192 = !DILocation(line: 319, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 243, type: !194, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DISubroutineType(types: !195)
!195 = !{!50, !17}
!196 = !DILocalVariable(name: "key", arg: 1, scope: !193, file: !3, line: 243, type: !17)
!197 = !DILocation(line: 243, column: 50, scope: !193)
!198 = !DILocation(line: 245, column: 21, scope: !193)
!199 = !DILocation(line: 245, column: 12, scope: !193)
!200 = !DILocation(line: 245, column: 5, scope: !193)
!201 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 337, type: !27, scopeLine: 338, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 339, column: 32, scope: !201)
!203 = !DILocation(line: 339, column: 18, scope: !201)
!204 = !DILocation(line: 339, column: 5, scope: !201)
!205 = !DILocation(line: 339, column: 16, scope: !201)
!206 = !DILocation(line: 340, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 237, type: !208, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!23, !50}
!210 = !DILocalVariable(name: "fp", arg: 1, scope: !207, file: !3, line: 237, type: !50)
!211 = !DILocation(line: 237, column: 44, scope: !207)
!212 = !DILocalVariable(name: "hash", scope: !207, file: !3, line: 239, type: !213)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!214 = !DILocation(line: 239, column: 12, scope: !207)
!215 = !DILocation(line: 239, column: 28, scope: !207)
!216 = !DILocation(line: 239, column: 19, scope: !207)
!217 = !DILocation(line: 240, column: 12, scope: !207)
!218 = !DILocation(line: 240, column: 17, scope: !207)
!219 = !DILocation(line: 240, column: 5, scope: !207)
!220 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 358, type: !27, scopeLine: 359, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!221 = !DILocalVariable(name: "fp_hash", scope: !220, file: !3, line: 360, type: !23)
!222 = !DILocation(line: 360, column: 13, scope: !220)
!223 = !DILocation(line: 360, column: 37, scope: !220)
!224 = !DILocation(line: 360, column: 23, scope: !220)
!225 = !DILocation(line: 361, column: 18, scope: !220)
!226 = !DILocation(line: 361, column: 31, scope: !220)
!227 = !DILocation(line: 361, column: 29, scope: !220)
!228 = !DILocation(line: 361, column: 5, scope: !220)
!229 = !DILocation(line: 361, column: 16, scope: !220)
!230 = !DILocation(line: 362, column: 1, scope: !220)
!231 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 380, type: !27, scopeLine: 381, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!232 = !DILocation(line: 382, column: 10, scope: !233)
!233 = distinct !DILexicalBlock(scope: !231, file: !3, line: 382, column: 9)
!234 = !DILocation(line: 382, column: 21, scope: !233)
!235 = !DILocation(line: 382, column: 9, scope: !231)
!236 = !DILocation(line: 383, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 382, column: 34)
!238 = !DILocation(line: 383, column: 21, scope: !237)
!239 = !DILocation(line: 384, column: 34, scope: !237)
!240 = !DILocation(line: 384, column: 9, scope: !237)
!241 = !DILocation(line: 384, column: 20, scope: !237)
!242 = !DILocation(line: 384, column: 32, scope: !237)
!243 = !DILocation(line: 385, column: 5, scope: !237)
!244 = !DILocation(line: 386, column: 14, scope: !245)
!245 = distinct !DILexicalBlock(scope: !246, file: !3, line: 386, column: 13)
!246 = distinct !DILexicalBlock(scope: !233, file: !3, line: 385, column: 12)
!247 = !DILocation(line: 386, column: 25, scope: !245)
!248 = !DILocation(line: 386, column: 13, scope: !246)
!249 = !DILocation(line: 387, column: 13, scope: !250)
!250 = distinct !DILexicalBlock(scope: !245, file: !3, line: 386, column: 38)
!251 = !DILocation(line: 387, column: 25, scope: !250)
!252 = !DILocation(line: 388, column: 38, scope: !250)
!253 = !DILocation(line: 388, column: 13, scope: !250)
!254 = !DILocation(line: 388, column: 24, scope: !250)
!255 = !DILocation(line: 388, column: 36, scope: !250)
!256 = !DILocation(line: 389, column: 9, scope: !250)
!257 = !DILocalVariable(name: "fp_victim", scope: !258, file: !3, line: 390, type: !50)
!258 = distinct !DILexicalBlock(scope: !245, file: !3, line: 389, column: 16)
!259 = !DILocation(line: 390, column: 27, scope: !258)
!260 = !DILocalVariable(name: "index_victim", scope: !258, file: !3, line: 391, type: !23)
!261 = !DILocation(line: 391, column: 21, scope: !258)
!262 = !DILocation(line: 392, column: 17, scope: !263)
!263 = distinct !DILexicalBlock(scope: !258, file: !3, line: 392, column: 17)
!264 = !DILocation(line: 392, column: 24, scope: !263)
!265 = !DILocation(line: 392, column: 17, scope: !258)
!266 = !DILocation(line: 393, column: 32, scope: !267)
!267 = distinct !DILexicalBlock(scope: !263, file: !3, line: 392, column: 29)
!268 = !DILocation(line: 393, column: 30, scope: !267)
!269 = !DILocation(line: 394, column: 29, scope: !267)
!270 = !DILocation(line: 394, column: 40, scope: !267)
!271 = !DILocation(line: 394, column: 27, scope: !267)
!272 = !DILocation(line: 395, column: 13, scope: !267)
!273 = !DILocation(line: 396, column: 32, scope: !274)
!274 = distinct !DILexicalBlock(scope: !263, file: !3, line: 395, column: 20)
!275 = !DILocation(line: 396, column: 30, scope: !274)
!276 = !DILocation(line: 397, column: 29, scope: !274)
!277 = !DILocation(line: 397, column: 40, scope: !274)
!278 = !DILocation(line: 397, column: 27, scope: !274)
!279 = !DILocation(line: 401, column: 40, scope: !258)
!280 = !DILocation(line: 401, column: 13, scope: !258)
!281 = !DILocation(line: 401, column: 24, scope: !258)
!282 = !DILocation(line: 401, column: 38, scope: !258)
!283 = !DILocation(line: 402, column: 26, scope: !258)
!284 = !DILocation(line: 402, column: 13, scope: !258)
!285 = !DILocation(line: 402, column: 24, scope: !258)
!286 = !DILocation(line: 403, column: 31, scope: !258)
!287 = !DILocation(line: 403, column: 13, scope: !258)
!288 = !DILocation(line: 403, column: 29, scope: !258)
!289 = !DILocation(line: 404, column: 13, scope: !258)
!290 = !DILocation(line: 404, column: 34, scope: !258)
!291 = !DILocation(line: 407, column: 1, scope: !231)
!292 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 426, type: !27, scopeLine: 427, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!293 = !DILocalVariable(name: "fp_victim", scope: !292, file: !3, line: 428, type: !50)
!294 = !DILocation(line: 428, column: 19, scope: !292)
!295 = !DILocation(line: 428, column: 31, scope: !292)
!296 = !DILocalVariable(name: "fp_hash_victim", scope: !292, file: !3, line: 429, type: !23)
!297 = !DILocation(line: 429, column: 13, scope: !292)
!298 = !DILocation(line: 429, column: 44, scope: !292)
!299 = !DILocation(line: 429, column: 30, scope: !292)
!300 = !DILocalVariable(name: "index2_victim", scope: !292, file: !3, line: 430, type: !23)
!301 = !DILocation(line: 430, column: 13, scope: !292)
!302 = !DILocation(line: 430, column: 29, scope: !292)
!303 = !DILocation(line: 430, column: 42, scope: !292)
!304 = !DILocation(line: 430, column: 40, scope: !292)
!305 = !DILocation(line: 432, column: 20, scope: !292)
!306 = !DILocation(line: 432, column: 18, scope: !292)
!307 = !DILocation(line: 434, column: 14, scope: !308)
!308 = distinct !DILexicalBlock(scope: !292, file: !3, line: 434, column: 13)
!309 = !DILocation(line: 434, column: 25, scope: !308)
!310 = !DILocation(line: 434, column: 13, scope: !292)
!311 = !DILocation(line: 435, column: 13, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 434, column: 41)
!313 = !DILocation(line: 435, column: 25, scope: !312)
!314 = !DILocation(line: 436, column: 41, scope: !312)
!315 = !DILocation(line: 436, column: 13, scope: !312)
!316 = !DILocation(line: 436, column: 24, scope: !312)
!317 = !DILocation(line: 436, column: 39, scope: !312)
!318 = !DILocation(line: 437, column: 13, scope: !312)
!319 = !DILocation(line: 441, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !292, file: !3, line: 441, column: 13)
!321 = !DILocation(line: 441, column: 34, scope: !320)
!322 = !DILocation(line: 441, column: 13, scope: !292)
!323 = !DILocation(line: 442, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !3, line: 441, column: 54)
!325 = !DILocation(line: 442, column: 25, scope: !324)
!326 = !DILocation(line: 443, column: 13, scope: !324)
!327 = !DILocation(line: 446, column: 11, scope: !292)
!328 = !DILocation(line: 446, column: 9, scope: !292)
!329 = !DILocation(line: 447, column: 22, scope: !292)
!330 = !DILocation(line: 447, column: 9, scope: !292)
!331 = !DILocation(line: 447, column: 20, scope: !292)
!332 = !DILocation(line: 448, column: 27, scope: !292)
!333 = !DILocation(line: 448, column: 38, scope: !292)
!334 = !DILocation(line: 448, column: 9, scope: !292)
!335 = !DILocation(line: 448, column: 25, scope: !292)
!336 = !DILocation(line: 449, column: 37, scope: !292)
!337 = !DILocation(line: 449, column: 9, scope: !292)
!338 = !DILocation(line: 449, column: 20, scope: !292)
!339 = !DILocation(line: 449, column: 35, scope: !292)
!340 = !DILocation(line: 450, column: 1, scope: !292)
!341 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 468, type: !27, scopeLine: 469, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DILocation(line: 470, column: 7, scope: !341)
!343 = !DILocation(line: 470, column: 5, scope: !341)
!344 = !DILocation(line: 471, column: 27, scope: !341)
!345 = !DILocation(line: 471, column: 5, scope: !341)
!346 = !DILocation(line: 471, column: 24, scope: !341)
!347 = !DILocation(line: 473, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !3, line: 473, column: 9)
!349 = !DILocation(line: 473, column: 26, scope: !348)
!350 = !DILocation(line: 473, column: 9, scope: !341)
!351 = !DILocation(line: 474, column: 5, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 473, column: 41)
!353 = !DILocation(line: 475, column: 9, scope: !354)
!354 = distinct !DILexicalBlock(scope: !348, file: !3, line: 474, column: 12)
!355 = !DILocation(line: 475, column: 17, scope: !354)
!356 = !DILocation(line: 477, column: 1, scope: !341)
!357 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 495, type: !27, scopeLine: 496, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocation(line: 497, column: 9, scope: !359)
!359 = distinct !DILexicalBlock(scope: !357, file: !3, line: 497, column: 9)
!360 = !DILocation(line: 497, column: 20, scope: !359)
!361 = !DILocation(line: 497, column: 35, scope: !359)
!362 = !DILocation(line: 497, column: 32, scope: !359)
!363 = !DILocation(line: 497, column: 9, scope: !357)
!364 = !DILocation(line: 498, column: 9, scope: !365)
!365 = distinct !DILexicalBlock(scope: !359, file: !3, line: 497, column: 52)
!366 = !DILocation(line: 498, column: 20, scope: !365)
!367 = !DILocation(line: 499, column: 5, scope: !365)
!368 = !DILocation(line: 500, column: 13, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !3, line: 500, column: 13)
!370 = distinct !DILexicalBlock(scope: !359, file: !3, line: 499, column: 12)
!371 = !DILocation(line: 500, column: 24, scope: !369)
!372 = !DILocation(line: 500, column: 39, scope: !369)
!373 = !DILocation(line: 500, column: 36, scope: !369)
!374 = !DILocation(line: 500, column: 13, scope: !370)
!375 = !DILocation(line: 501, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !3, line: 500, column: 56)
!377 = !DILocation(line: 501, column: 24, scope: !376)
!378 = !DILocation(line: 502, column: 9, scope: !376)
!379 = !DILocation(line: 504, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !369, file: !3, line: 503, column: 14)
!381 = !DILocation(line: 504, column: 24, scope: !380)
!382 = !DILocation(line: 508, column: 10, scope: !383)
!383 = distinct !DILexicalBlock(scope: !357, file: !3, line: 508, column: 9)
!384 = !DILocation(line: 508, column: 9, scope: !357)
!385 = !DILocation(line: 509, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !3, line: 508, column: 22)
!387 = !DILocation(line: 510, column: 1, scope: !357)
!388 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 528, type: !27, scopeLine: 529, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 530, column: 7, scope: !388)
!390 = !DILocation(line: 530, column: 5, scope: !388)
!391 = !DILocation(line: 532, column: 25, scope: !388)
!392 = !DILocation(line: 532, column: 5, scope: !388)
!393 = !DILocation(line: 532, column: 22, scope: !388)
!394 = !DILocation(line: 534, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !388, file: !3, line: 534, column: 9)
!396 = !DILocation(line: 534, column: 26, scope: !395)
!397 = !DILocation(line: 534, column: 9, scope: !388)
!398 = !DILocation(line: 535, column: 5, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 534, column: 41)
!400 = !DILocation(line: 537, column: 1, scope: !388)
!401 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 539, type: !27, scopeLine: 540, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!402 = !DILocation(line: 541, column: 5, scope: !401)
!403 = distinct !DISubprogram(name: "task_commit_done", scope: !3, file: !3, line: 544, type: !27, scopeLine: 544, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!404 = !DILocation(line: 546, column: 1, scope: !403)
!405 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 548, type: !406, scopeLine: 548, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!406 = !DISubroutineType(types: !407)
!407 = !{!408}
!408 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!409 = !DILocation(line: 550, column: 16, scope: !405)
!410 = !DILocation(line: 551, column: 10, scope: !405)
!411 = !DILocation(line: 552, column: 12, scope: !405)
!412 = !DILocation(line: 553, column: 5, scope: !405)
!413 = !DILocation(line: 559, column: 5, scope: !405)
!414 = !DILocation(line: 563, column: 5, scope: !405)
!415 = !DILocation(line: 564, column: 14, scope: !405)
!416 = !DILocation(line: 564, column: 20, scope: !405)
!417 = !DILocation(line: 564, column: 5, scope: !405)
!418 = !DILocation(line: 564, column: 32, scope: !405)
!419 = !DILocation(line: 564, column: 40, scope: !405)
!420 = !DILocation(line: 565, column: 5, scope: !405)
!421 = !DILocation(line: 568, column: 3, scope: !405)
!422 = !DILocation(line: 568, column: 9, scope: !405)
!423 = !DILocation(line: 568, column: 27, scope: !405)
!424 = !DILocation(line: 570, column: 9, scope: !425)
!425 = distinct !DILexicalBlock(scope: !405, file: !3, line: 568, column: 42)
!426 = !DILocation(line: 571, column: 9, scope: !425)
!427 = !DILocation(line: 571, column: 9, scope: !428)
!428 = distinct !DILexicalBlock(scope: !429, file: !3, line: 571, column: 9)
!429 = distinct !DILexicalBlock(scope: !425, file: !3, line: 571, column: 9)
!430 = !DILocation(line: 571, column: 9, scope: !429)
!431 = !DILocation(line: 571, column: 9, scope: !432)
!432 = distinct !DILexicalBlock(scope: !428, file: !3, line: 571, column: 9)
!433 = !DILocalVariable(name: "__x", scope: !434, file: !3, line: 571, type: !6)
!434 = distinct !DILexicalBlock(scope: !432, file: !3, line: 571, column: 9)
!435 = !DILocation(line: 571, column: 9, scope: !434)
!436 = !{i32 -2146582553}
!437 = !DILocalVariable(name: "__x", scope: !438, file: !3, line: 571, type: !6)
!438 = distinct !DILexicalBlock(scope: !432, file: !3, line: 571, column: 9)
!439 = !DILocation(line: 571, column: 9, scope: !438)
!440 = !{i32 -2146582428}
!441 = !DILocation(line: 571, column: 9, scope: !442)
!442 = distinct !DILexicalBlock(scope: !428, file: !3, line: 571, column: 9)
!443 = !DILocalVariable(name: "__x", scope: !444, file: !3, line: 571, type: !6)
!444 = distinct !DILexicalBlock(scope: !442, file: !3, line: 571, column: 9)
!445 = !DILocation(line: 571, column: 9, scope: !444)
!446 = !{i32 -2146582296}
!447 = !DILocalVariable(name: "__x", scope: !448, file: !3, line: 571, type: !6)
!448 = distinct !DILexicalBlock(scope: !442, file: !3, line: 571, column: 9)
!449 = !DILocation(line: 571, column: 9, scope: !448)
!450 = !{i32 -2146582171}
!451 = !DILocation(line: 572, column: 9, scope: !425)
!452 = !DILocation(line: 576, column: 9, scope: !425)
!453 = !DILocation(line: 577, column: 9, scope: !425)
!454 = !DILocation(line: 577, column: 9, scope: !455)
!455 = distinct !DILexicalBlock(scope: !456, file: !3, line: 577, column: 9)
!456 = distinct !DILexicalBlock(scope: !425, file: !3, line: 577, column: 9)
!457 = !DILocation(line: 577, column: 9, scope: !456)
!458 = !DILocation(line: 577, column: 9, scope: !459)
!459 = distinct !DILexicalBlock(scope: !455, file: !3, line: 577, column: 9)
!460 = !DILocalVariable(name: "__x", scope: !461, file: !3, line: 577, type: !6)
!461 = distinct !DILexicalBlock(scope: !459, file: !3, line: 577, column: 9)
!462 = !DILocation(line: 577, column: 9, scope: !461)
!463 = !{i32 -2146580047}
!464 = !DILocalVariable(name: "__x", scope: !465, file: !3, line: 577, type: !6)
!465 = distinct !DILexicalBlock(scope: !459, file: !3, line: 577, column: 9)
!466 = !DILocation(line: 577, column: 9, scope: !465)
!467 = !{i32 -2146579922}
!468 = !DILocation(line: 577, column: 9, scope: !469)
!469 = distinct !DILexicalBlock(scope: !455, file: !3, line: 577, column: 9)
!470 = !DILocalVariable(name: "__x", scope: !471, file: !3, line: 577, type: !6)
!471 = distinct !DILexicalBlock(scope: !469, file: !3, line: 577, column: 9)
!472 = !DILocation(line: 577, column: 9, scope: !471)
!473 = !{i32 -2146579790}
!474 = !DILocalVariable(name: "__x", scope: !475, file: !3, line: 577, type: !6)
!475 = distinct !DILexicalBlock(scope: !469, file: !3, line: 577, column: 9)
!476 = !DILocation(line: 577, column: 9, scope: !475)
!477 = !{i32 -2146579665}
!478 = !DILocation(line: 578, column: 9, scope: !425)
!479 = !DILocation(line: 582, column: 9, scope: !425)
!480 = !DILocation(line: 583, column: 9, scope: !425)
!481 = !DILocation(line: 583, column: 9, scope: !482)
!482 = distinct !DILexicalBlock(scope: !483, file: !3, line: 583, column: 9)
!483 = distinct !DILexicalBlock(scope: !425, file: !3, line: 583, column: 9)
!484 = !DILocation(line: 583, column: 9, scope: !483)
!485 = !DILocation(line: 583, column: 9, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !3, line: 583, column: 9)
!487 = !DILocalVariable(name: "__x", scope: !488, file: !3, line: 583, type: !6)
!488 = distinct !DILexicalBlock(scope: !486, file: !3, line: 583, column: 9)
!489 = !DILocation(line: 583, column: 9, scope: !488)
!490 = !{i32 -2146577541}
!491 = !DILocalVariable(name: "__x", scope: !492, file: !3, line: 583, type: !6)
!492 = distinct !DILexicalBlock(scope: !486, file: !3, line: 583, column: 9)
!493 = !DILocation(line: 583, column: 9, scope: !492)
!494 = !{i32 -2146577416}
!495 = !DILocation(line: 583, column: 9, scope: !496)
!496 = distinct !DILexicalBlock(scope: !482, file: !3, line: 583, column: 9)
!497 = !DILocalVariable(name: "__x", scope: !498, file: !3, line: 583, type: !6)
!498 = distinct !DILexicalBlock(scope: !496, file: !3, line: 583, column: 9)
!499 = !DILocation(line: 583, column: 9, scope: !498)
!500 = !{i32 -2146577284}
!501 = !DILocalVariable(name: "__x", scope: !502, file: !3, line: 583, type: !6)
!502 = distinct !DILexicalBlock(scope: !496, file: !3, line: 583, column: 9)
!503 = !DILocation(line: 583, column: 9, scope: !502)
!504 = !{i32 -2146577159}
!505 = !DILocation(line: 584, column: 9, scope: !425)
!506 = !DILocation(line: 588, column: 9, scope: !425)
!507 = !DILocation(line: 589, column: 9, scope: !425)
!508 = !DILocation(line: 589, column: 9, scope: !509)
!509 = distinct !DILexicalBlock(scope: !510, file: !3, line: 589, column: 9)
!510 = distinct !DILexicalBlock(scope: !425, file: !3, line: 589, column: 9)
!511 = !DILocation(line: 589, column: 9, scope: !510)
!512 = !DILocation(line: 589, column: 9, scope: !513)
!513 = distinct !DILexicalBlock(scope: !509, file: !3, line: 589, column: 9)
!514 = !DILocalVariable(name: "__x", scope: !515, file: !3, line: 589, type: !6)
!515 = distinct !DILexicalBlock(scope: !513, file: !3, line: 589, column: 9)
!516 = !DILocation(line: 589, column: 9, scope: !515)
!517 = !{i32 -2146575035}
!518 = !DILocalVariable(name: "__x", scope: !519, file: !3, line: 589, type: !6)
!519 = distinct !DILexicalBlock(scope: !513, file: !3, line: 589, column: 9)
!520 = !DILocation(line: 589, column: 9, scope: !519)
!521 = !{i32 -2146574910}
!522 = !DILocation(line: 589, column: 9, scope: !523)
!523 = distinct !DILexicalBlock(scope: !509, file: !3, line: 589, column: 9)
!524 = !DILocalVariable(name: "__x", scope: !525, file: !3, line: 589, type: !6)
!525 = distinct !DILexicalBlock(scope: !523, file: !3, line: 589, column: 9)
!526 = !DILocation(line: 589, column: 9, scope: !525)
!527 = !{i32 -2146574778}
!528 = !DILocalVariable(name: "__x", scope: !529, file: !3, line: 589, type: !6)
!529 = distinct !DILexicalBlock(scope: !523, file: !3, line: 589, column: 9)
!530 = !DILocation(line: 589, column: 9, scope: !529)
!531 = !{i32 -2146574653}
!532 = !DILocation(line: 590, column: 9, scope: !425)
!533 = !DILocation(line: 593, column: 12, scope: !534)
!534 = distinct !DILexicalBlock(scope: !425, file: !3, line: 593, column: 12)
!535 = !DILocation(line: 593, column: 30, scope: !534)
!536 = !DILocation(line: 593, column: 12, scope: !425)
!537 = !DILocation(line: 595, column: 13, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !3, line: 593, column: 45)
!539 = !DILocation(line: 596, column: 13, scope: !538)
!540 = !DILocation(line: 596, column: 13, scope: !541)
!541 = distinct !DILexicalBlock(scope: !542, file: !3, line: 596, column: 13)
!542 = distinct !DILexicalBlock(scope: !538, file: !3, line: 596, column: 13)
!543 = !DILocation(line: 596, column: 13, scope: !542)
!544 = !DILocation(line: 596, column: 13, scope: !545)
!545 = distinct !DILexicalBlock(scope: !541, file: !3, line: 596, column: 13)
!546 = !DILocalVariable(name: "__x", scope: !547, file: !3, line: 596, type: !6)
!547 = distinct !DILexicalBlock(scope: !545, file: !3, line: 596, column: 13)
!548 = !DILocation(line: 596, column: 13, scope: !547)
!549 = !{i32 -2146572478}
!550 = !DILocalVariable(name: "__x", scope: !551, file: !3, line: 596, type: !6)
!551 = distinct !DILexicalBlock(scope: !545, file: !3, line: 596, column: 13)
!552 = !DILocation(line: 596, column: 13, scope: !551)
!553 = !{i32 -2146572353}
!554 = !DILocation(line: 596, column: 13, scope: !555)
!555 = distinct !DILexicalBlock(scope: !541, file: !3, line: 596, column: 13)
!556 = !DILocalVariable(name: "__x", scope: !557, file: !3, line: 596, type: !6)
!557 = distinct !DILexicalBlock(scope: !555, file: !3, line: 596, column: 13)
!558 = !DILocation(line: 596, column: 13, scope: !557)
!559 = !{i32 -2146572221}
!560 = !DILocalVariable(name: "__x", scope: !561, file: !3, line: 596, type: !6)
!561 = distinct !DILexicalBlock(scope: !555, file: !3, line: 596, column: 13)
!562 = !DILocation(line: 596, column: 13, scope: !561)
!563 = !{i32 -2146572096}
!564 = !DILocation(line: 597, column: 13, scope: !538)
!565 = !DILocation(line: 600, column: 16, scope: !566)
!566 = distinct !DILexicalBlock(scope: !538, file: !3, line: 600, column: 16)
!567 = !DILocation(line: 600, column: 28, scope: !566)
!568 = !DILocation(line: 600, column: 41, scope: !566)
!569 = !DILocation(line: 600, column: 44, scope: !566)
!570 = !DILocation(line: 600, column: 56, scope: !566)
!571 = !DILocation(line: 600, column: 16, scope: !538)
!572 = !DILocation(line: 601, column: 17, scope: !573)
!573 = distinct !DILexicalBlock(scope: !566, file: !3, line: 600, column: 70)
!574 = !DILocation(line: 601, column: 23, scope: !573)
!575 = !DILocation(line: 601, column: 36, scope: !573)
!576 = !DILocation(line: 601, column: 45, scope: !573)
!577 = !DILocation(line: 601, column: 49, scope: !573)
!578 = !DILocation(line: 601, column: 71, scope: !573)
!579 = !DILocation(line: 0, scope: !573)
!580 = !DILocation(line: 603, column: 21, scope: !581)
!581 = distinct !DILexicalBlock(scope: !573, file: !3, line: 601, column: 91)
!582 = !DILocation(line: 604, column: 21, scope: !581)
!583 = !DILocation(line: 604, column: 21, scope: !584)
!584 = distinct !DILexicalBlock(scope: !585, file: !3, line: 604, column: 21)
!585 = distinct !DILexicalBlock(scope: !581, file: !3, line: 604, column: 21)
!586 = !DILocation(line: 604, column: 21, scope: !585)
!587 = !DILocation(line: 604, column: 21, scope: !588)
!588 = distinct !DILexicalBlock(scope: !584, file: !3, line: 604, column: 21)
!589 = !DILocalVariable(name: "__x", scope: !590, file: !3, line: 604, type: !6)
!590 = distinct !DILexicalBlock(scope: !588, file: !3, line: 604, column: 21)
!591 = !DILocation(line: 604, column: 21, scope: !590)
!592 = !{i32 -2146569819}
!593 = !DILocalVariable(name: "__x", scope: !594, file: !3, line: 604, type: !6)
!594 = distinct !DILexicalBlock(scope: !588, file: !3, line: 604, column: 21)
!595 = !DILocation(line: 604, column: 21, scope: !594)
!596 = !{i32 -2146569694}
!597 = !DILocation(line: 604, column: 21, scope: !598)
!598 = distinct !DILexicalBlock(scope: !584, file: !3, line: 604, column: 21)
!599 = !DILocalVariable(name: "__x", scope: !600, file: !3, line: 604, type: !6)
!600 = distinct !DILexicalBlock(scope: !598, file: !3, line: 604, column: 21)
!601 = !DILocation(line: 604, column: 21, scope: !600)
!602 = !{i32 -2146569562}
!603 = !DILocalVariable(name: "__x", scope: !604, file: !3, line: 604, type: !6)
!604 = distinct !DILexicalBlock(scope: !598, file: !3, line: 604, column: 21)
!605 = !DILocation(line: 604, column: 21, scope: !604)
!606 = !{i32 -2146569437}
!607 = !DILocation(line: 605, column: 21, scope: !581)
!608 = distinct !{!608, !572, !609}
!609 = !DILocation(line: 607, column: 17, scope: !573)
!610 = !DILocation(line: 608, column: 13, scope: !573)
!611 = !DILocation(line: 611, column: 13, scope: !538)
!612 = !DILocation(line: 612, column: 13, scope: !538)
!613 = !DILocation(line: 612, column: 13, scope: !614)
!614 = distinct !DILexicalBlock(scope: !615, file: !3, line: 612, column: 13)
!615 = distinct !DILexicalBlock(scope: !538, file: !3, line: 612, column: 13)
!616 = !DILocation(line: 612, column: 13, scope: !615)
!617 = !DILocation(line: 612, column: 13, scope: !618)
!618 = distinct !DILexicalBlock(scope: !614, file: !3, line: 612, column: 13)
!619 = !DILocalVariable(name: "__x", scope: !620, file: !3, line: 612, type: !6)
!620 = distinct !DILexicalBlock(scope: !618, file: !3, line: 612, column: 13)
!621 = !DILocation(line: 612, column: 13, scope: !620)
!622 = !{i32 -2146567313}
!623 = !DILocalVariable(name: "__x", scope: !624, file: !3, line: 612, type: !6)
!624 = distinct !DILexicalBlock(scope: !618, file: !3, line: 612, column: 13)
!625 = !DILocation(line: 612, column: 13, scope: !624)
!626 = !{i32 -2146567188}
!627 = !DILocation(line: 612, column: 13, scope: !628)
!628 = distinct !DILexicalBlock(scope: !614, file: !3, line: 612, column: 13)
!629 = !DILocalVariable(name: "__x", scope: !630, file: !3, line: 612, type: !6)
!630 = distinct !DILexicalBlock(scope: !628, file: !3, line: 612, column: 13)
!631 = !DILocation(line: 612, column: 13, scope: !630)
!632 = !{i32 -2146567056}
!633 = !DILocalVariable(name: "__x", scope: !634, file: !3, line: 612, type: !6)
!634 = distinct !DILexicalBlock(scope: !628, file: !3, line: 612, column: 13)
!635 = !DILocation(line: 612, column: 13, scope: !634)
!636 = !{i32 -2146566931}
!637 = !DILocation(line: 613, column: 13, scope: !538)
!638 = !DILocation(line: 615, column: 9, scope: !538)
!639 = !DILocation(line: 617, column: 13, scope: !640)
!640 = distinct !DILexicalBlock(scope: !534, file: !3, line: 615, column: 16)
!641 = !DILocation(line: 618, column: 13, scope: !640)
!642 = !DILocation(line: 618, column: 13, scope: !643)
!643 = distinct !DILexicalBlock(scope: !644, file: !3, line: 618, column: 13)
!644 = distinct !DILexicalBlock(scope: !640, file: !3, line: 618, column: 13)
!645 = !DILocation(line: 618, column: 13, scope: !644)
!646 = !DILocation(line: 618, column: 13, scope: !647)
!647 = distinct !DILexicalBlock(scope: !643, file: !3, line: 618, column: 13)
!648 = !DILocalVariable(name: "__x", scope: !649, file: !3, line: 618, type: !6)
!649 = distinct !DILexicalBlock(scope: !647, file: !3, line: 618, column: 13)
!650 = !DILocation(line: 618, column: 13, scope: !649)
!651 = !{i32 -2146564807}
!652 = !DILocalVariable(name: "__x", scope: !653, file: !3, line: 618, type: !6)
!653 = distinct !DILexicalBlock(scope: !647, file: !3, line: 618, column: 13)
!654 = !DILocation(line: 618, column: 13, scope: !653)
!655 = !{i32 -2146564682}
!656 = !DILocation(line: 618, column: 13, scope: !657)
!657 = distinct !DILexicalBlock(scope: !643, file: !3, line: 618, column: 13)
!658 = !DILocalVariable(name: "__x", scope: !659, file: !3, line: 618, type: !6)
!659 = distinct !DILexicalBlock(scope: !657, file: !3, line: 618, column: 13)
!660 = !DILocation(line: 618, column: 13, scope: !659)
!661 = !{i32 -2146564550}
!662 = !DILocalVariable(name: "__x", scope: !663, file: !3, line: 618, type: !6)
!663 = distinct !DILexicalBlock(scope: !657, file: !3, line: 618, column: 13)
!664 = !DILocation(line: 618, column: 13, scope: !663)
!665 = !{i32 -2146564425}
!666 = !DILocation(line: 619, column: 13, scope: !640)
!667 = !DILocation(line: 623, column: 13, scope: !640)
!668 = !DILocation(line: 624, column: 13, scope: !640)
!669 = !DILocation(line: 624, column: 13, scope: !670)
!670 = distinct !DILexicalBlock(scope: !671, file: !3, line: 624, column: 13)
!671 = distinct !DILexicalBlock(scope: !640, file: !3, line: 624, column: 13)
!672 = !DILocation(line: 624, column: 13, scope: !671)
!673 = !DILocation(line: 624, column: 13, scope: !674)
!674 = distinct !DILexicalBlock(scope: !670, file: !3, line: 624, column: 13)
!675 = !DILocalVariable(name: "__x", scope: !676, file: !3, line: 624, type: !6)
!676 = distinct !DILexicalBlock(scope: !674, file: !3, line: 624, column: 13)
!677 = !DILocation(line: 624, column: 13, scope: !676)
!678 = !{i32 -2146562301}
!679 = !DILocalVariable(name: "__x", scope: !680, file: !3, line: 624, type: !6)
!680 = distinct !DILexicalBlock(scope: !674, file: !3, line: 624, column: 13)
!681 = !DILocation(line: 624, column: 13, scope: !680)
!682 = !{i32 -2146562176}
!683 = !DILocation(line: 624, column: 13, scope: !684)
!684 = distinct !DILexicalBlock(scope: !670, file: !3, line: 624, column: 13)
!685 = !DILocalVariable(name: "__x", scope: !686, file: !3, line: 624, type: !6)
!686 = distinct !DILexicalBlock(scope: !684, file: !3, line: 624, column: 13)
!687 = !DILocation(line: 624, column: 13, scope: !686)
!688 = !{i32 -2146562044}
!689 = !DILocalVariable(name: "__x", scope: !690, file: !3, line: 624, type: !6)
!690 = distinct !DILexicalBlock(scope: !684, file: !3, line: 624, column: 13)
!691 = !DILocation(line: 624, column: 13, scope: !690)
!692 = !{i32 -2146561919}
!693 = !DILocation(line: 625, column: 13, scope: !640)
!694 = distinct !{!694, !421, !695}
!695 = !DILocation(line: 628, column: 5, scope: !405)
!696 = !DILocation(line: 630, column: 5, scope: !405)
!697 = !DILocation(line: 631, column: 5, scope: !405)
!698 = !DILocation(line: 633, column: 1, scope: !405)
!699 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 225, type: !700, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!700 = !DISubroutineType(types: !701)
!701 = !{!213, !7, !6}
!702 = !DILocalVariable(name: "data", arg: 1, scope: !699, file: !3, line: 225, type: !7)
!703 = !DILocation(line: 225, column: 33, scope: !699)
!704 = !DILocalVariable(name: "len", arg: 2, scope: !699, file: !3, line: 225, type: !6)
!705 = !DILocation(line: 225, column: 48, scope: !699)
!706 = !DILocalVariable(name: "hash", scope: !699, file: !3, line: 227, type: !18)
!707 = !DILocation(line: 227, column: 14, scope: !699)
!708 = !DILocalVariable(name: "i", scope: !699, file: !3, line: 228, type: !6)
!709 = !DILocation(line: 228, column: 18, scope: !699)
!710 = !DILocation(line: 230, column: 11, scope: !711)
!711 = distinct !DILexicalBlock(scope: !699, file: !3, line: 230, column: 5)
!712 = !DILocation(line: 230, column: 9, scope: !711)
!713 = !DILocation(line: 230, column: 16, scope: !714)
!714 = distinct !DILexicalBlock(scope: !711, file: !3, line: 230, column: 5)
!715 = !DILocation(line: 230, column: 20, scope: !714)
!716 = !DILocation(line: 230, column: 18, scope: !714)
!717 = !DILocation(line: 230, column: 5, scope: !711)
!718 = !DILocation(line: 231, column: 18, scope: !714)
!719 = !DILocation(line: 231, column: 23, scope: !714)
!720 = !DILocation(line: 231, column: 31, scope: !714)
!721 = !DILocation(line: 231, column: 29, scope: !714)
!722 = !DILocation(line: 231, column: 41, scope: !714)
!723 = !DILocation(line: 231, column: 40, scope: !714)
!724 = !DILocation(line: 231, column: 39, scope: !714)
!725 = !DILocation(line: 231, column: 37, scope: !714)
!726 = !DILocation(line: 231, column: 14, scope: !714)
!727 = !DILocation(line: 231, column: 9, scope: !714)
!728 = !DILocation(line: 230, column: 29, scope: !714)
!729 = !DILocation(line: 230, column: 34, scope: !714)
!730 = !DILocation(line: 230, column: 5, scope: !714)
!731 = distinct !{!731, !717, !732}
!732 = !DILocation(line: 231, column: 45, scope: !711)
!733 = !DILocation(line: 234, column: 12, scope: !699)
!734 = !DILocation(line: 234, column: 5, scope: !699)
