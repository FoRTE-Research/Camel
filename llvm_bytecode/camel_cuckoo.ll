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
  %__x13 = alloca i16, align 2
  %tmp14 = alloca i16, align 2
  %__x19 = alloca i16, align 2
  %tmp20 = alloca i16, align 2
  %__x22 = alloca i16, align 2
  %tmp23 = alloca i16, align 2
  %__x39 = alloca i16, align 2
  %tmp40 = alloca i16, align 2
  %__x42 = alloca i16, align 2
  %tmp43 = alloca i16, align 2
  %__x52 = alloca i16, align 2
  %tmp53 = alloca i16, align 2
  %__x55 = alloca i16, align 2
  %tmp56 = alloca i16, align 2
  %__x74 = alloca i16, align 2
  %tmp75 = alloca i16, align 2
  %__x77 = alloca i16, align 2
  %tmp78 = alloca i16, align 2
  %__x87 = alloca i16, align 2
  %tmp88 = alloca i16, align 2
  %__x90 = alloca i16, align 2
  %tmp91 = alloca i16, align 2
  %__x112 = alloca i16, align 2
  %tmp113 = alloca i16, align 2
  %__x115 = alloca i16, align 2
  %tmp116 = alloca i16, align 2
  %__x125 = alloca i16, align 2
  %tmp126 = alloca i16, align 2
  %__x128 = alloca i16, align 2
  %tmp129 = alloca i16, align 2
  %__x168 = alloca i16, align 2
  %tmp169 = alloca i16, align 2
  %__x171 = alloca i16, align 2
  %tmp172 = alloca i16, align 2
  %__x181 = alloca i16, align 2
  %tmp182 = alloca i16, align 2
  %__x184 = alloca i16, align 2
  %tmp185 = alloca i16, align 2
  %__x225 = alloca i16, align 2
  %tmp226 = alloca i16, align 2
  %__x228 = alloca i16, align 2
  %tmp229 = alloca i16, align 2
  %__x238 = alloca i16, align 2
  %tmp239 = alloca i16, align 2
  %__x241 = alloca i16, align 2
  %tmp242 = alloca i16, align 2
  %__x270 = alloca i16, align 2
  %tmp271 = alloca i16, align 2
  %__x273 = alloca i16, align 2
  %tmp274 = alloca i16, align 2
  %__x283 = alloca i16, align 2
  %tmp284 = alloca i16, align 2
  %__x286 = alloca i16, align 2
  %tmp287 = alloca i16, align 2
  %__x308 = alloca i16, align 2
  %tmp309 = alloca i16, align 2
  %__x311 = alloca i16, align 2
  %tmp312 = alloca i16, align 2
  %__x321 = alloca i16, align 2
  %tmp322 = alloca i16, align 2
  %__x324 = alloca i16, align 2
  %tmp325 = alloca i16, align 2
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

while.cond:                                       ; preds = %if.end340, %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !420
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !420
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 8, !dbg !420
  %9 = load i16, i16* %lookup_count, align 2, !dbg !420
  %cmp = icmp ult i16 %9, 32, !dbg !421
  br i1 %cmp, label %while.body, label %while.end341, !dbg !419

while.body:                                       ; preds = %while.cond
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !422
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !422
  %11 = bitcast %struct.camel_global_t* %globals5 to i8*, !dbg !422
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !422
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !422
  %13 = bitcast %struct.camel_global_t* %globals6 to i8*, !dbg !422
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %11, i8* align 2 %13, i16 276, i1 false), !dbg !422
  call void @task_generate_key(), !dbg !424
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !425
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !425
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 1, !dbg !425
  %15 = load i16, i16* %key, align 2, !dbg !425
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !425
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !425
  %key9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 1, !dbg !425
  store i16 %15, i16* %key9, align 2, !dbg !425
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !426
  %18 = bitcast %struct.camel_global_t* %globals10 to i8*, !dbg !426
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !426
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !426
  %20 = bitcast %struct.camel_global_t* %globals11 to i8*, !dbg !426
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 276, i1 false), !dbg !426
  call void @task_calc_indexes(), !dbg !427
  br label %do.body, !dbg !428

do.body:                                          ; preds = %while.body
  %21 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !429
  %cmp12 = icmp eq i16 %21, 1, !dbg !429
  br i1 %cmp12, label %if.then, label %if.else, !dbg !432

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !433
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !433
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !433
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 0, !dbg !433
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !433
  call void @__dump_registers(i16* %arraydecay), !dbg !433
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !435, metadata !DIExpression()), !dbg !437
  %23 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !437, !srcloc !438
  store i16 %23, i16* %__x, align 2, !dbg !437
  %24 = load i16, i16* %__x, align 2, !dbg !437
  store i16 %24, i16* %tmp, align 2, !dbg !437
  %25 = load i16, i16* %tmp, align 2, !dbg !437
  %add = add i16 %25, 2, !dbg !433
  %26 = inttoptr i16 %add to i8*, !dbg !433
  call void @llvm.dbg.declare(metadata i16* %__x13, metadata !439, metadata !DIExpression()), !dbg !441
  %27 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !441, !srcloc !442
  store i16 %27, i16* %__x13, align 2, !dbg !441
  %28 = load i16, i16* %__x13, align 2, !dbg !441
  store i16 %28, i16* %tmp14, align 2, !dbg !441
  %29 = load i16, i16* %tmp14, align 2, !dbg !441
  %add15 = add i16 %29, 2, !dbg !433
  %sub = sub i16 9216, %add15, !dbg !433
  %call = call zeroext i16 @__fast_hw_crc(i8* %26, i16 zeroext %sub, i16 zeroext -1), !dbg !433
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !433
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !433
  %31 = bitcast %struct.camel_buffer_t* %30 to i8*, !dbg !433
  %32 = load i16, i16* @tmp_stack_crc, align 2, !dbg !433
  %call16 = call zeroext i16 @__fast_hw_crc(i8* %31, i16 zeroext 298, i16 zeroext %32), !dbg !433
  store i16 %call16, i16* @tmp_stack_buf_crc, align 2, !dbg !433
  %33 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !433
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !433
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 2, !dbg !433
  store i16 %33, i16* %stack_and_buf_crc, align 2, !dbg !433
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !433
  br label %if.end, !dbg !433

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !443
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !443
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !443
  %reg_file17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 0, !dbg !443
  %arraydecay18 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file17, i16 0, i16 0, !dbg !443
  call void @__dump_registers(i16* %arraydecay18), !dbg !443
  call void @llvm.dbg.declare(metadata i16* %__x19, metadata !445, metadata !DIExpression()), !dbg !447
  %36 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !447, !srcloc !448
  store i16 %36, i16* %__x19, align 2, !dbg !447
  %37 = load i16, i16* %__x19, align 2, !dbg !447
  store i16 %37, i16* %tmp20, align 2, !dbg !447
  %38 = load i16, i16* %tmp20, align 2, !dbg !447
  %add21 = add i16 %38, 2, !dbg !443
  %39 = inttoptr i16 %add21 to i8*, !dbg !443
  call void @llvm.dbg.declare(metadata i16* %__x22, metadata !449, metadata !DIExpression()), !dbg !451
  %40 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !451, !srcloc !452
  store i16 %40, i16* %__x22, align 2, !dbg !451
  %41 = load i16, i16* %__x22, align 2, !dbg !451
  store i16 %41, i16* %tmp23, align 2, !dbg !451
  %42 = load i16, i16* %tmp23, align 2, !dbg !451
  %add24 = add i16 %42, 2, !dbg !443
  %sub25 = sub i16 9216, %add24, !dbg !443
  %call26 = call zeroext i16 @__fast_hw_crc(i8* %39, i16 zeroext %sub25, i16 zeroext -1), !dbg !443
  store i16 %call26, i16* @tmp_stack_crc, align 2, !dbg !443
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !443
  %44 = bitcast %struct.camel_buffer_t* %43 to i8*, !dbg !443
  %45 = load i16, i16* @tmp_stack_crc, align 2, !dbg !443
  %call27 = call zeroext i16 @__fast_hw_crc(i8* %44, i16 zeroext 298, i16 zeroext %45), !dbg !443
  store i16 %call27, i16* @tmp_stack_buf_crc, align 2, !dbg !443
  %46 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !443
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !443
  %stack_and_buf_crc28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 2, !dbg !443
  store i16 %46, i16* %stack_and_buf_crc28, align 2, !dbg !443
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !443
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !432

do.end:                                           ; preds = %if.end
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !453
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !453
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 2, !dbg !453
  %49 = load i16, i16* %fingerprint, align 2, !dbg !453
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !453
  %fingerprint31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 2, !dbg !453
  store i16 %49, i16* %fingerprint31, align 2, !dbg !453
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !454
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 1, !dbg !454
  %52 = bitcast %struct.camel_global_t* %globals32 to i8*, !dbg !454
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !454
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1, !dbg !454
  %54 = bitcast %struct.camel_global_t* %globals33 to i8*, !dbg !454
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %52, i8* align 2 %54, i16 276, i1 false), !dbg !454
  call void @task_calc_indexes_index_1(), !dbg !455
  br label %do.body34, !dbg !456

do.body34:                                        ; preds = %do.end
  %55 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !457
  %cmp35 = icmp eq i16 %55, 1, !dbg !457
  br i1 %cmp35, label %if.then36, label %if.else49, !dbg !460

if.then36:                                        ; preds = %do.body34
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !461
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !461
  %56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !461
  %reg_file37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %56, i32 0, i32 0, !dbg !461
  %arraydecay38 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file37, i16 0, i16 0, !dbg !461
  call void @__dump_registers(i16* %arraydecay38), !dbg !461
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !463, metadata !DIExpression()), !dbg !465
  %57 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !465, !srcloc !466
  store i16 %57, i16* %__x39, align 2, !dbg !465
  %58 = load i16, i16* %__x39, align 2, !dbg !465
  store i16 %58, i16* %tmp40, align 2, !dbg !465
  %59 = load i16, i16* %tmp40, align 2, !dbg !465
  %add41 = add i16 %59, 2, !dbg !461
  %60 = inttoptr i16 %add41 to i8*, !dbg !461
  call void @llvm.dbg.declare(metadata i16* %__x42, metadata !467, metadata !DIExpression()), !dbg !469
  %61 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !469, !srcloc !470
  store i16 %61, i16* %__x42, align 2, !dbg !469
  %62 = load i16, i16* %__x42, align 2, !dbg !469
  store i16 %62, i16* %tmp43, align 2, !dbg !469
  %63 = load i16, i16* %tmp43, align 2, !dbg !469
  %add44 = add i16 %63, 2, !dbg !461
  %sub45 = sub i16 9216, %add44, !dbg !461
  %call46 = call zeroext i16 @__fast_hw_crc(i8* %60, i16 zeroext %sub45, i16 zeroext -1), !dbg !461
  store i16 %call46, i16* @tmp_stack_crc, align 2, !dbg !461
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !461
  %65 = bitcast %struct.camel_buffer_t* %64 to i8*, !dbg !461
  %66 = load i16, i16* @tmp_stack_crc, align 2, !dbg !461
  %call47 = call zeroext i16 @__fast_hw_crc(i8* %65, i16 zeroext 298, i16 zeroext %66), !dbg !461
  store i16 %call47, i16* @tmp_stack_buf_crc, align 2, !dbg !461
  %67 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !461
  %68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !461
  %stack_and_buf_crc48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %68, i32 0, i32 2, !dbg !461
  store i16 %67, i16* %stack_and_buf_crc48, align 2, !dbg !461
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !461
  br label %if.end62, !dbg !461

if.else49:                                        ; preds = %do.body34
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !471
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !471
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !471
  %reg_file50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i32 0, i32 0, !dbg !471
  %arraydecay51 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file50, i16 0, i16 0, !dbg !471
  call void @__dump_registers(i16* %arraydecay51), !dbg !471
  call void @llvm.dbg.declare(metadata i16* %__x52, metadata !473, metadata !DIExpression()), !dbg !475
  %70 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !475, !srcloc !476
  store i16 %70, i16* %__x52, align 2, !dbg !475
  %71 = load i16, i16* %__x52, align 2, !dbg !475
  store i16 %71, i16* %tmp53, align 2, !dbg !475
  %72 = load i16, i16* %tmp53, align 2, !dbg !475
  %add54 = add i16 %72, 2, !dbg !471
  %73 = inttoptr i16 %add54 to i8*, !dbg !471
  call void @llvm.dbg.declare(metadata i16* %__x55, metadata !477, metadata !DIExpression()), !dbg !479
  %74 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !479, !srcloc !480
  store i16 %74, i16* %__x55, align 2, !dbg !479
  %75 = load i16, i16* %__x55, align 2, !dbg !479
  store i16 %75, i16* %tmp56, align 2, !dbg !479
  %76 = load i16, i16* %tmp56, align 2, !dbg !479
  %add57 = add i16 %76, 2, !dbg !471
  %sub58 = sub i16 9216, %add57, !dbg !471
  %call59 = call zeroext i16 @__fast_hw_crc(i8* %73, i16 zeroext %sub58, i16 zeroext -1), !dbg !471
  store i16 %call59, i16* @tmp_stack_crc, align 2, !dbg !471
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !471
  %78 = bitcast %struct.camel_buffer_t* %77 to i8*, !dbg !471
  %79 = load i16, i16* @tmp_stack_crc, align 2, !dbg !471
  %call60 = call zeroext i16 @__fast_hw_crc(i8* %78, i16 zeroext 298, i16 zeroext %79), !dbg !471
  store i16 %call60, i16* @tmp_stack_buf_crc, align 2, !dbg !471
  %80 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !471
  %81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !471
  %stack_and_buf_crc61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %81, i32 0, i32 2, !dbg !471
  store i16 %80, i16* %stack_and_buf_crc61, align 2, !dbg !471
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !471
  br label %if.end62

if.end62:                                         ; preds = %if.else49, %if.then36
  br label %do.end63, !dbg !460

do.end63:                                         ; preds = %if.end62
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !481
  %globals64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %82, i32 0, i32 1, !dbg !481
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals64, i32 0, i32 3, !dbg !481
  %83 = load i16, i16* %index1, align 2, !dbg !481
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !481
  %globals65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 1, !dbg !481
  %index166 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals65, i32 0, i32 3, !dbg !481
  store i16 %83, i16* %index166, align 2, !dbg !481
  %85 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !482
  %globals67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %85, i32 0, i32 1, !dbg !482
  %86 = bitcast %struct.camel_global_t* %globals67 to i8*, !dbg !482
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !482
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %87, i32 0, i32 1, !dbg !482
  %88 = bitcast %struct.camel_global_t* %globals68 to i8*, !dbg !482
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %86, i8* align 2 %88, i16 276, i1 false), !dbg !482
  call void @task_calc_indexes_index_2(), !dbg !483
  br label %do.body69, !dbg !484

do.body69:                                        ; preds = %do.end63
  %89 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !485
  %cmp70 = icmp eq i16 %89, 1, !dbg !485
  br i1 %cmp70, label %if.then71, label %if.else84, !dbg !488

if.then71:                                        ; preds = %do.body69
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !489
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !489
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %reg_file72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i32 0, i32 0, !dbg !489
  %arraydecay73 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file72, i16 0, i16 0, !dbg !489
  call void @__dump_registers(i16* %arraydecay73), !dbg !489
  call void @llvm.dbg.declare(metadata i16* %__x74, metadata !491, metadata !DIExpression()), !dbg !493
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !493, !srcloc !494
  store i16 %91, i16* %__x74, align 2, !dbg !493
  %92 = load i16, i16* %__x74, align 2, !dbg !493
  store i16 %92, i16* %tmp75, align 2, !dbg !493
  %93 = load i16, i16* %tmp75, align 2, !dbg !493
  %add76 = add i16 %93, 2, !dbg !489
  %94 = inttoptr i16 %add76 to i8*, !dbg !489
  call void @llvm.dbg.declare(metadata i16* %__x77, metadata !495, metadata !DIExpression()), !dbg !497
  %95 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !497, !srcloc !498
  store i16 %95, i16* %__x77, align 2, !dbg !497
  %96 = load i16, i16* %__x77, align 2, !dbg !497
  store i16 %96, i16* %tmp78, align 2, !dbg !497
  %97 = load i16, i16* %tmp78, align 2, !dbg !497
  %add79 = add i16 %97, 2, !dbg !489
  %sub80 = sub i16 9216, %add79, !dbg !489
  %call81 = call zeroext i16 @__fast_hw_crc(i8* %94, i16 zeroext %sub80, i16 zeroext -1), !dbg !489
  store i16 %call81, i16* @tmp_stack_crc, align 2, !dbg !489
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %99 = bitcast %struct.camel_buffer_t* %98 to i8*, !dbg !489
  %100 = load i16, i16* @tmp_stack_crc, align 2, !dbg !489
  %call82 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext 298, i16 zeroext %100), !dbg !489
  store i16 %call82, i16* @tmp_stack_buf_crc, align 2, !dbg !489
  %101 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !489
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !489
  %stack_and_buf_crc83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i32 0, i32 2, !dbg !489
  store i16 %101, i16* %stack_and_buf_crc83, align 2, !dbg !489
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !489
  br label %if.end97, !dbg !489

if.else84:                                        ; preds = %do.body69
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !499
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !499
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !499
  %reg_file85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %103, i32 0, i32 0, !dbg !499
  %arraydecay86 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file85, i16 0, i16 0, !dbg !499
  call void @__dump_registers(i16* %arraydecay86), !dbg !499
  call void @llvm.dbg.declare(metadata i16* %__x87, metadata !501, metadata !DIExpression()), !dbg !503
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !503, !srcloc !504
  store i16 %104, i16* %__x87, align 2, !dbg !503
  %105 = load i16, i16* %__x87, align 2, !dbg !503
  store i16 %105, i16* %tmp88, align 2, !dbg !503
  %106 = load i16, i16* %tmp88, align 2, !dbg !503
  %add89 = add i16 %106, 2, !dbg !499
  %107 = inttoptr i16 %add89 to i8*, !dbg !499
  call void @llvm.dbg.declare(metadata i16* %__x90, metadata !505, metadata !DIExpression()), !dbg !507
  %108 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !507, !srcloc !508
  store i16 %108, i16* %__x90, align 2, !dbg !507
  %109 = load i16, i16* %__x90, align 2, !dbg !507
  store i16 %109, i16* %tmp91, align 2, !dbg !507
  %110 = load i16, i16* %tmp91, align 2, !dbg !507
  %add92 = add i16 %110, 2, !dbg !499
  %sub93 = sub i16 9216, %add92, !dbg !499
  %call94 = call zeroext i16 @__fast_hw_crc(i8* %107, i16 zeroext %sub93, i16 zeroext -1), !dbg !499
  store i16 %call94, i16* @tmp_stack_crc, align 2, !dbg !499
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !499
  %112 = bitcast %struct.camel_buffer_t* %111 to i8*, !dbg !499
  %113 = load i16, i16* @tmp_stack_crc, align 2, !dbg !499
  %call95 = call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext 298, i16 zeroext %113), !dbg !499
  store i16 %call95, i16* @tmp_stack_buf_crc, align 2, !dbg !499
  %114 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !499
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !499
  %stack_and_buf_crc96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i32 0, i32 2, !dbg !499
  store i16 %114, i16* %stack_and_buf_crc96, align 2, !dbg !499
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !499
  br label %if.end97

if.end97:                                         ; preds = %if.else84, %if.then71
  br label %do.end98, !dbg !488

do.end98:                                         ; preds = %if.end97
  %116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !509
  %globals99 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %116, i32 0, i32 1, !dbg !509
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals99, i32 0, i32 4, !dbg !509
  %117 = load i16, i16* %index2, align 2, !dbg !509
  %118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !509
  %globals100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %118, i32 0, i32 1, !dbg !509
  %index2101 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals100, i32 0, i32 4, !dbg !509
  store i16 %117, i16* %index2101, align 2, !dbg !509
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !510
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %119, i32 0, i32 1, !dbg !510
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !510
  %120 = load i16, i16* %insert_count, align 2, !dbg !510
  %cmp103 = icmp ult i16 %120, 32, !dbg !512
  br i1 %cmp103, label %if.then104, label %if.else261, !dbg !513

if.then104:                                       ; preds = %do.end98
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !514
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %121, i32 0, i32 1, !dbg !514
  %122 = bitcast %struct.camel_global_t* %globals105 to i8*, !dbg !514
  %123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !514
  %globals106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %123, i32 0, i32 1, !dbg !514
  %124 = bitcast %struct.camel_global_t* %globals106 to i8*, !dbg !514
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %122, i8* align 2 %124, i16 276, i1 false), !dbg !514
  call void @task_add(), !dbg !516
  br label %do.body107, !dbg !517

do.body107:                                       ; preds = %if.then104
  %125 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !518
  %cmp108 = icmp eq i16 %125, 1, !dbg !518
  br i1 %cmp108, label %if.then109, label %if.else122, !dbg !521

if.then109:                                       ; preds = %do.body107
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !522
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !522
  %126 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %reg_file110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %126, i32 0, i32 0, !dbg !522
  %arraydecay111 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file110, i16 0, i16 0, !dbg !522
  call void @__dump_registers(i16* %arraydecay111), !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x112, metadata !524, metadata !DIExpression()), !dbg !526
  %127 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !526, !srcloc !527
  store i16 %127, i16* %__x112, align 2, !dbg !526
  %128 = load i16, i16* %__x112, align 2, !dbg !526
  store i16 %128, i16* %tmp113, align 2, !dbg !526
  %129 = load i16, i16* %tmp113, align 2, !dbg !526
  %add114 = add i16 %129, 2, !dbg !522
  %130 = inttoptr i16 %add114 to i8*, !dbg !522
  call void @llvm.dbg.declare(metadata i16* %__x115, metadata !528, metadata !DIExpression()), !dbg !530
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !530, !srcloc !531
  store i16 %131, i16* %__x115, align 2, !dbg !530
  %132 = load i16, i16* %__x115, align 2, !dbg !530
  store i16 %132, i16* %tmp116, align 2, !dbg !530
  %133 = load i16, i16* %tmp116, align 2, !dbg !530
  %add117 = add i16 %133, 2, !dbg !522
  %sub118 = sub i16 9216, %add117, !dbg !522
  %call119 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext %sub118, i16 zeroext -1), !dbg !522
  store i16 %call119, i16* @tmp_stack_crc, align 2, !dbg !522
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %135 = bitcast %struct.camel_buffer_t* %134 to i8*, !dbg !522
  %136 = load i16, i16* @tmp_stack_crc, align 2, !dbg !522
  %call120 = call zeroext i16 @__fast_hw_crc(i8* %135, i16 zeroext 298, i16 zeroext %136), !dbg !522
  store i16 %call120, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %137 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !522
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !522
  %stack_and_buf_crc121 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %138, i32 0, i32 2, !dbg !522
  store i16 %137, i16* %stack_and_buf_crc121, align 2, !dbg !522
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !522
  br label %if.end135, !dbg !522

if.else122:                                       ; preds = %do.body107
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !532
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !532
  %139 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %reg_file123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %139, i32 0, i32 0, !dbg !532
  %arraydecay124 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file123, i16 0, i16 0, !dbg !532
  call void @__dump_registers(i16* %arraydecay124), !dbg !532
  call void @llvm.dbg.declare(metadata i16* %__x125, metadata !534, metadata !DIExpression()), !dbg !536
  %140 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !536, !srcloc !537
  store i16 %140, i16* %__x125, align 2, !dbg !536
  %141 = load i16, i16* %__x125, align 2, !dbg !536
  store i16 %141, i16* %tmp126, align 2, !dbg !536
  %142 = load i16, i16* %tmp126, align 2, !dbg !536
  %add127 = add i16 %142, 2, !dbg !532
  %143 = inttoptr i16 %add127 to i8*, !dbg !532
  call void @llvm.dbg.declare(metadata i16* %__x128, metadata !538, metadata !DIExpression()), !dbg !540
  %144 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !540, !srcloc !541
  store i16 %144, i16* %__x128, align 2, !dbg !540
  %145 = load i16, i16* %__x128, align 2, !dbg !540
  store i16 %145, i16* %tmp129, align 2, !dbg !540
  %146 = load i16, i16* %tmp129, align 2, !dbg !540
  %add130 = add i16 %146, 2, !dbg !532
  %sub131 = sub i16 9216, %add130, !dbg !532
  %call132 = call zeroext i16 @__fast_hw_crc(i8* %143, i16 zeroext %sub131, i16 zeroext -1), !dbg !532
  store i16 %call132, i16* @tmp_stack_crc, align 2, !dbg !532
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %148 = bitcast %struct.camel_buffer_t* %147 to i8*, !dbg !532
  %149 = load i16, i16* @tmp_stack_crc, align 2, !dbg !532
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %148, i16 zeroext 298, i16 zeroext %149), !dbg !532
  store i16 %call133, i16* @tmp_stack_buf_crc, align 2, !dbg !532
  %150 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !532
  %151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %stack_and_buf_crc134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %151, i32 0, i32 2, !dbg !532
  store i16 %150, i16* %stack_and_buf_crc134, align 2, !dbg !532
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !532
  br label %if.end135

if.end135:                                        ; preds = %if.else122, %if.then109
  br label %do.end136, !dbg !521

do.end136:                                        ; preds = %if.end135
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !542
  %globals137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 1, !dbg !542
  %fingerprint138 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals137, i32 0, i32 2, !dbg !542
  %153 = load i16, i16* %fingerprint138, align 2, !dbg !542
  %154 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !542
  %globals139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %154, i32 0, i32 1, !dbg !542
  %fingerprint140 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals139, i32 0, i32 2, !dbg !542
  store i16 %153, i16* %fingerprint140, align 2, !dbg !542
  %155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !543
  %globals141 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %155, i32 0, i32 1, !dbg !543
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals141, i32 0, i32 0, !dbg !543
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !545
  %globals142 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 1, !dbg !545
  %index1143 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals142, i32 0, i32 3, !dbg !545
  %157 = load i16, i16* %index1143, align 2, !dbg !545
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %157, !dbg !543
  %158 = load i16, i16* %arrayidx, align 2, !dbg !543
  %tobool = icmp ne i16 %158, 0, !dbg !543
  br i1 %tobool, label %land.lhs.true, label %if.end216, !dbg !546

land.lhs.true:                                    ; preds = %do.end136
  %159 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !547
  %globals144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %159, i32 0, i32 1, !dbg !547
  %filter145 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals144, i32 0, i32 0, !dbg !547
  %160 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %globals146 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %160, i32 0, i32 1, !dbg !548
  %index2147 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals146, i32 0, i32 4, !dbg !548
  %161 = load i16, i16* %index2147, align 2, !dbg !548
  %arrayidx148 = getelementptr inbounds [128 x i16], [128 x i16]* %filter145, i16 0, i16 %161, !dbg !547
  %162 = load i16, i16* %arrayidx148, align 2, !dbg !547
  %tobool149 = icmp ne i16 %162, 0, !dbg !547
  br i1 %tobool149, label %if.then150, label %if.end216, !dbg !549

if.then150:                                       ; preds = %land.lhs.true
  br label %while.cond151, !dbg !550

while.cond151:                                    ; preds = %do.end192, %if.then150
  %163 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !552
  %globals152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %163, i32 0, i32 1, !dbg !552
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals152, i32 0, i32 10, !dbg !552
  %164 = load i8, i8* %success, align 2, !dbg !552
  %tobool153 = trunc i8 %164 to i1, !dbg !552
  %conv = zext i1 %tobool153 to i16, !dbg !552
  %cmp154 = icmp eq i16 %conv, 0, !dbg !553
  br i1 %cmp154, label %land.rhs, label %land.end, !dbg !554

land.rhs:                                         ; preds = %while.cond151
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !555
  %globals156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %165, i32 0, i32 1, !dbg !555
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals156, i32 0, i32 5, !dbg !555
  %166 = load i16, i16* %relocation_count, align 2, !dbg !555
  %cmp157 = icmp ult i16 %166, 8, !dbg !556
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond151
  %167 = phi i1 [ false, %while.cond151 ], [ %cmp157, %land.rhs ], !dbg !557
  br i1 %167, label %while.body159, label %while.end, !dbg !550

while.body159:                                    ; preds = %land.end
  %168 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !558
  %globals160 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %168, i32 0, i32 1, !dbg !558
  %169 = bitcast %struct.camel_global_t* %globals160 to i8*, !dbg !558
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !558
  %globals161 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !558
  %171 = bitcast %struct.camel_global_t* %globals161 to i8*, !dbg !558
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %169, i8* align 2 %171, i16 276, i1 false), !dbg !558
  call void @task_relocate(), !dbg !560
  br label %do.body162, !dbg !561

do.body162:                                       ; preds = %while.body159
  %172 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !562
  %cmp163 = icmp eq i16 %172, 1, !dbg !562
  br i1 %cmp163, label %if.then165, label %if.else178, !dbg !565

if.then165:                                       ; preds = %do.body162
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !566
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !566
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %reg_file166 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %173, i32 0, i32 0, !dbg !566
  %arraydecay167 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file166, i16 0, i16 0, !dbg !566
  call void @__dump_registers(i16* %arraydecay167), !dbg !566
  call void @llvm.dbg.declare(metadata i16* %__x168, metadata !568, metadata !DIExpression()), !dbg !570
  %174 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !570, !srcloc !571
  store i16 %174, i16* %__x168, align 2, !dbg !570
  %175 = load i16, i16* %__x168, align 2, !dbg !570
  store i16 %175, i16* %tmp169, align 2, !dbg !570
  %176 = load i16, i16* %tmp169, align 2, !dbg !570
  %add170 = add i16 %176, 2, !dbg !566
  %177 = inttoptr i16 %add170 to i8*, !dbg !566
  call void @llvm.dbg.declare(metadata i16* %__x171, metadata !572, metadata !DIExpression()), !dbg !574
  %178 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !574, !srcloc !575
  store i16 %178, i16* %__x171, align 2, !dbg !574
  %179 = load i16, i16* %__x171, align 2, !dbg !574
  store i16 %179, i16* %tmp172, align 2, !dbg !574
  %180 = load i16, i16* %tmp172, align 2, !dbg !574
  %add173 = add i16 %180, 2, !dbg !566
  %sub174 = sub i16 9216, %add173, !dbg !566
  %call175 = call zeroext i16 @__fast_hw_crc(i8* %177, i16 zeroext %sub174, i16 zeroext -1), !dbg !566
  store i16 %call175, i16* @tmp_stack_crc, align 2, !dbg !566
  %181 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %182 = bitcast %struct.camel_buffer_t* %181 to i8*, !dbg !566
  %183 = load i16, i16* @tmp_stack_crc, align 2, !dbg !566
  %call176 = call zeroext i16 @__fast_hw_crc(i8* %182, i16 zeroext 298, i16 zeroext %183), !dbg !566
  store i16 %call176, i16* @tmp_stack_buf_crc, align 2, !dbg !566
  %184 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !566
  %185 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %stack_and_buf_crc177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %185, i32 0, i32 2, !dbg !566
  store i16 %184, i16* %stack_and_buf_crc177, align 2, !dbg !566
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !566
  br label %if.end191, !dbg !566

if.else178:                                       ; preds = %do.body162
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !576
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !576
  %186 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %reg_file179 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %186, i32 0, i32 0, !dbg !576
  %arraydecay180 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file179, i16 0, i16 0, !dbg !576
  call void @__dump_registers(i16* %arraydecay180), !dbg !576
  call void @llvm.dbg.declare(metadata i16* %__x181, metadata !578, metadata !DIExpression()), !dbg !580
  %187 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !580, !srcloc !581
  store i16 %187, i16* %__x181, align 2, !dbg !580
  %188 = load i16, i16* %__x181, align 2, !dbg !580
  store i16 %188, i16* %tmp182, align 2, !dbg !580
  %189 = load i16, i16* %tmp182, align 2, !dbg !580
  %add183 = add i16 %189, 2, !dbg !576
  %190 = inttoptr i16 %add183 to i8*, !dbg !576
  call void @llvm.dbg.declare(metadata i16* %__x184, metadata !582, metadata !DIExpression()), !dbg !584
  %191 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !584, !srcloc !585
  store i16 %191, i16* %__x184, align 2, !dbg !584
  %192 = load i16, i16* %__x184, align 2, !dbg !584
  store i16 %192, i16* %tmp185, align 2, !dbg !584
  %193 = load i16, i16* %tmp185, align 2, !dbg !584
  %add186 = add i16 %193, 2, !dbg !576
  %sub187 = sub i16 9216, %add186, !dbg !576
  %call188 = call zeroext i16 @__fast_hw_crc(i8* %190, i16 zeroext %sub187, i16 zeroext -1), !dbg !576
  store i16 %call188, i16* @tmp_stack_crc, align 2, !dbg !576
  %194 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %195 = bitcast %struct.camel_buffer_t* %194 to i8*, !dbg !576
  %196 = load i16, i16* @tmp_stack_crc, align 2, !dbg !576
  %call189 = call zeroext i16 @__fast_hw_crc(i8* %195, i16 zeroext 298, i16 zeroext %196), !dbg !576
  store i16 %call189, i16* @tmp_stack_buf_crc, align 2, !dbg !576
  %197 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !576
  %198 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %stack_and_buf_crc190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %198, i32 0, i32 2, !dbg !576
  store i16 %197, i16* %stack_and_buf_crc190, align 2, !dbg !576
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !576
  br label %if.end191

if.end191:                                        ; preds = %if.else178, %if.then165
  br label %do.end192, !dbg !565

do.end192:                                        ; preds = %if.end191
  %199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %globals193 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %199, i32 0, i32 1, !dbg !586
  %success194 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals193, i32 0, i32 10, !dbg !586
  %200 = load i8, i8* %success194, align 2, !dbg !586
  %tobool195 = trunc i8 %200 to i1, !dbg !586
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals196 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %201, i32 0, i32 1, !dbg !586
  %success197 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals196, i32 0, i32 10, !dbg !586
  %frombool = zext i1 %tobool195 to i8, !dbg !586
  store i8 %frombool, i8* %success197, align 2, !dbg !586
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %globals198 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 1, !dbg !586
  %relocation_count199 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals198, i32 0, i32 5, !dbg !586
  %203 = load i16, i16* %relocation_count199, align 2, !dbg !586
  %204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals200 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %204, i32 0, i32 1, !dbg !586
  %relocation_count201 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals200, i32 0, i32 5, !dbg !586
  store i16 %203, i16* %relocation_count201, align 2, !dbg !586
  %205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %globals202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %205, i32 0, i32 1, !dbg !586
  %index1203 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals202, i32 0, i32 3, !dbg !586
  %206 = load i16, i16* %index1203, align 2, !dbg !586
  %207 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals204 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %207, i32 0, i32 1, !dbg !586
  %index1205 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals204, i32 0, i32 3, !dbg !586
  store i16 %206, i16* %index1205, align 2, !dbg !586
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %globals206 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %208, i32 0, i32 1, !dbg !586
  %fingerprint207 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals206, i32 0, i32 2, !dbg !586
  %209 = load i16, i16* %fingerprint207, align 2, !dbg !586
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals208 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %210, i32 0, i32 1, !dbg !586
  %fingerprint209 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals208, i32 0, i32 2, !dbg !586
  store i16 %209, i16* %fingerprint209, align 2, !dbg !586
  %211 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %globals210 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %211, i32 0, i32 1, !dbg !586
  %filter211 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals210, i32 0, i32 0, !dbg !586
  %212 = load i16, i16* @writeOpt, align 2, !dbg !586
  %arrayidx212 = getelementptr inbounds [128 x i16], [128 x i16]* %filter211, i16 0, i16 %212, !dbg !586
  %213 = load i16, i16* %arrayidx212, align 2, !dbg !586
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 1, !dbg !586
  %filter214 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals213, i32 0, i32 0, !dbg !586
  %215 = load i16, i16* @writeOpt, align 2, !dbg !586
  %arrayidx215 = getelementptr inbounds [128 x i16], [128 x i16]* %filter214, i16 0, i16 %215, !dbg !586
  store i16 %213, i16* %arrayidx215, align 2, !dbg !586
  br label %while.cond151, !dbg !550, !llvm.loop !587

while.end:                                        ; preds = %land.end
  br label %if.end216, !dbg !589

if.end216:                                        ; preds = %while.end, %land.lhs.true, %do.end136
  %216 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !590
  %globals217 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %216, i32 0, i32 1, !dbg !590
  %217 = bitcast %struct.camel_global_t* %globals217 to i8*, !dbg !590
  %218 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !590
  %globals218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %218, i32 0, i32 1, !dbg !590
  %219 = bitcast %struct.camel_global_t* %globals218 to i8*, !dbg !590
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %217, i8* align 2 %219, i16 276, i1 false), !dbg !590
  call void @task_insert_done(), !dbg !591
  br label %do.body219, !dbg !592

do.body219:                                       ; preds = %if.end216
  %220 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !593
  %cmp220 = icmp eq i16 %220, 1, !dbg !593
  br i1 %cmp220, label %if.then222, label %if.else235, !dbg !596

if.then222:                                       ; preds = %do.body219
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !597
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !597
  %221 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %reg_file223 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %221, i32 0, i32 0, !dbg !597
  %arraydecay224 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file223, i16 0, i16 0, !dbg !597
  call void @__dump_registers(i16* %arraydecay224), !dbg !597
  call void @llvm.dbg.declare(metadata i16* %__x225, metadata !599, metadata !DIExpression()), !dbg !601
  %222 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !601, !srcloc !602
  store i16 %222, i16* %__x225, align 2, !dbg !601
  %223 = load i16, i16* %__x225, align 2, !dbg !601
  store i16 %223, i16* %tmp226, align 2, !dbg !601
  %224 = load i16, i16* %tmp226, align 2, !dbg !601
  %add227 = add i16 %224, 2, !dbg !597
  %225 = inttoptr i16 %add227 to i8*, !dbg !597
  call void @llvm.dbg.declare(metadata i16* %__x228, metadata !603, metadata !DIExpression()), !dbg !605
  %226 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !605, !srcloc !606
  store i16 %226, i16* %__x228, align 2, !dbg !605
  %227 = load i16, i16* %__x228, align 2, !dbg !605
  store i16 %227, i16* %tmp229, align 2, !dbg !605
  %228 = load i16, i16* %tmp229, align 2, !dbg !605
  %add230 = add i16 %228, 2, !dbg !597
  %sub231 = sub i16 9216, %add230, !dbg !597
  %call232 = call zeroext i16 @__fast_hw_crc(i8* %225, i16 zeroext %sub231, i16 zeroext -1), !dbg !597
  store i16 %call232, i16* @tmp_stack_crc, align 2, !dbg !597
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %230 = bitcast %struct.camel_buffer_t* %229 to i8*, !dbg !597
  %231 = load i16, i16* @tmp_stack_crc, align 2, !dbg !597
  %call233 = call zeroext i16 @__fast_hw_crc(i8* %230, i16 zeroext 298, i16 zeroext %231), !dbg !597
  store i16 %call233, i16* @tmp_stack_buf_crc, align 2, !dbg !597
  %232 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !597
  %233 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !597
  %stack_and_buf_crc234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %233, i32 0, i32 2, !dbg !597
  store i16 %232, i16* %stack_and_buf_crc234, align 2, !dbg !597
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !597
  br label %if.end248, !dbg !597

if.else235:                                       ; preds = %do.body219
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !607
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !607
  %234 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !607
  %reg_file236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %234, i32 0, i32 0, !dbg !607
  %arraydecay237 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file236, i16 0, i16 0, !dbg !607
  call void @__dump_registers(i16* %arraydecay237), !dbg !607
  call void @llvm.dbg.declare(metadata i16* %__x238, metadata !609, metadata !DIExpression()), !dbg !611
  %235 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !611, !srcloc !612
  store i16 %235, i16* %__x238, align 2, !dbg !611
  %236 = load i16, i16* %__x238, align 2, !dbg !611
  store i16 %236, i16* %tmp239, align 2, !dbg !611
  %237 = load i16, i16* %tmp239, align 2, !dbg !611
  %add240 = add i16 %237, 2, !dbg !607
  %238 = inttoptr i16 %add240 to i8*, !dbg !607
  call void @llvm.dbg.declare(metadata i16* %__x241, metadata !613, metadata !DIExpression()), !dbg !615
  %239 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !615, !srcloc !616
  store i16 %239, i16* %__x241, align 2, !dbg !615
  %240 = load i16, i16* %__x241, align 2, !dbg !615
  store i16 %240, i16* %tmp242, align 2, !dbg !615
  %241 = load i16, i16* %tmp242, align 2, !dbg !615
  %add243 = add i16 %241, 2, !dbg !607
  %sub244 = sub i16 9216, %add243, !dbg !607
  %call245 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext %sub244, i16 zeroext -1), !dbg !607
  store i16 %call245, i16* @tmp_stack_crc, align 2, !dbg !607
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !607
  %243 = bitcast %struct.camel_buffer_t* %242 to i8*, !dbg !607
  %244 = load i16, i16* @tmp_stack_crc, align 2, !dbg !607
  %call246 = call zeroext i16 @__fast_hw_crc(i8* %243, i16 zeroext 298, i16 zeroext %244), !dbg !607
  store i16 %call246, i16* @tmp_stack_buf_crc, align 2, !dbg !607
  %245 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !607
  %246 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !607
  %stack_and_buf_crc247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %246, i32 0, i32 2, !dbg !607
  store i16 %245, i16* %stack_and_buf_crc247, align 2, !dbg !607
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !607
  br label %if.end248

if.end248:                                        ; preds = %if.else235, %if.then222
  br label %do.end249, !dbg !596

do.end249:                                        ; preds = %if.end248
  %247 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %globals250 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %247, i32 0, i32 1, !dbg !617
  %insert_count251 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals250, i32 0, i32 6, !dbg !617
  %248 = load i16, i16* %insert_count251, align 2, !dbg !617
  %249 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %globals252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %249, i32 0, i32 1, !dbg !617
  %insert_count253 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals252, i32 0, i32 6, !dbg !617
  store i16 %248, i16* %insert_count253, align 2, !dbg !617
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %globals254 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %250, i32 0, i32 1, !dbg !617
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals254, i32 0, i32 7, !dbg !617
  %251 = load i16, i16* %inserted_count, align 2, !dbg !617
  %252 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %globals255 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %252, i32 0, i32 1, !dbg !617
  %inserted_count256 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals255, i32 0, i32 7, !dbg !617
  store i16 %251, i16* %inserted_count256, align 2, !dbg !617
  %253 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !617
  %globals257 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %253, i32 0, i32 1, !dbg !617
  %key258 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals257, i32 0, i32 1, !dbg !617
  %254 = load i16, i16* %key258, align 2, !dbg !617
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !617
  %globals259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %255, i32 0, i32 1, !dbg !617
  %key260 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals259, i32 0, i32 1, !dbg !617
  store i16 %254, i16* %key260, align 2, !dbg !617
  br label %if.end340, !dbg !618

if.else261:                                       ; preds = %do.end98
  %256 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !619
  %globals262 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %256, i32 0, i32 1, !dbg !619
  %257 = bitcast %struct.camel_global_t* %globals262 to i8*, !dbg !619
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !619
  %globals263 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %258, i32 0, i32 1, !dbg !619
  %259 = bitcast %struct.camel_global_t* %globals263 to i8*, !dbg !619
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %257, i8* align 2 %259, i16 276, i1 false), !dbg !619
  call void @task_lookup_search(), !dbg !621
  br label %do.body264, !dbg !622

do.body264:                                       ; preds = %if.else261
  %260 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !623
  %cmp265 = icmp eq i16 %260, 1, !dbg !623
  br i1 %cmp265, label %if.then267, label %if.else280, !dbg !626

if.then267:                                       ; preds = %do.body264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !627
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !627
  %261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %reg_file268 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %261, i32 0, i32 0, !dbg !627
  %arraydecay269 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file268, i16 0, i16 0, !dbg !627
  call void @__dump_registers(i16* %arraydecay269), !dbg !627
  call void @llvm.dbg.declare(metadata i16* %__x270, metadata !629, metadata !DIExpression()), !dbg !631
  %262 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !631, !srcloc !632
  store i16 %262, i16* %__x270, align 2, !dbg !631
  %263 = load i16, i16* %__x270, align 2, !dbg !631
  store i16 %263, i16* %tmp271, align 2, !dbg !631
  %264 = load i16, i16* %tmp271, align 2, !dbg !631
  %add272 = add i16 %264, 2, !dbg !627
  %265 = inttoptr i16 %add272 to i8*, !dbg !627
  call void @llvm.dbg.declare(metadata i16* %__x273, metadata !633, metadata !DIExpression()), !dbg !635
  %266 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !635, !srcloc !636
  store i16 %266, i16* %__x273, align 2, !dbg !635
  %267 = load i16, i16* %__x273, align 2, !dbg !635
  store i16 %267, i16* %tmp274, align 2, !dbg !635
  %268 = load i16, i16* %tmp274, align 2, !dbg !635
  %add275 = add i16 %268, 2, !dbg !627
  %sub276 = sub i16 9216, %add275, !dbg !627
  %call277 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext %sub276, i16 zeroext -1), !dbg !627
  store i16 %call277, i16* @tmp_stack_crc, align 2, !dbg !627
  %269 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %270 = bitcast %struct.camel_buffer_t* %269 to i8*, !dbg !627
  %271 = load i16, i16* @tmp_stack_crc, align 2, !dbg !627
  %call278 = call zeroext i16 @__fast_hw_crc(i8* %270, i16 zeroext 298, i16 zeroext %271), !dbg !627
  store i16 %call278, i16* @tmp_stack_buf_crc, align 2, !dbg !627
  %272 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !627
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !627
  %stack_and_buf_crc279 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 2, !dbg !627
  store i16 %272, i16* %stack_and_buf_crc279, align 2, !dbg !627
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !627
  br label %if.end293, !dbg !627

if.else280:                                       ; preds = %do.body264
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !637
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %reg_file281 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %274, i32 0, i32 0, !dbg !637
  %arraydecay282 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file281, i16 0, i16 0, !dbg !637
  call void @__dump_registers(i16* %arraydecay282), !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x283, metadata !639, metadata !DIExpression()), !dbg !641
  %275 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !641, !srcloc !642
  store i16 %275, i16* %__x283, align 2, !dbg !641
  %276 = load i16, i16* %__x283, align 2, !dbg !641
  store i16 %276, i16* %tmp284, align 2, !dbg !641
  %277 = load i16, i16* %tmp284, align 2, !dbg !641
  %add285 = add i16 %277, 2, !dbg !637
  %278 = inttoptr i16 %add285 to i8*, !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x286, metadata !643, metadata !DIExpression()), !dbg !645
  %279 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !645, !srcloc !646
  store i16 %279, i16* %__x286, align 2, !dbg !645
  %280 = load i16, i16* %__x286, align 2, !dbg !645
  store i16 %280, i16* %tmp287, align 2, !dbg !645
  %281 = load i16, i16* %tmp287, align 2, !dbg !645
  %add288 = add i16 %281, 2, !dbg !637
  %sub289 = sub i16 9216, %add288, !dbg !637
  %call290 = call zeroext i16 @__fast_hw_crc(i8* %278, i16 zeroext %sub289, i16 zeroext -1), !dbg !637
  store i16 %call290, i16* @tmp_stack_crc, align 2, !dbg !637
  %282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %283 = bitcast %struct.camel_buffer_t* %282 to i8*, !dbg !637
  %284 = load i16, i16* @tmp_stack_crc, align 2, !dbg !637
  %call291 = call zeroext i16 @__fast_hw_crc(i8* %283, i16 zeroext 298, i16 zeroext %284), !dbg !637
  store i16 %call291, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %285 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %stack_and_buf_crc292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %286, i32 0, i32 2, !dbg !637
  store i16 %285, i16* %stack_and_buf_crc292, align 2, !dbg !637
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !637
  br label %if.end293

if.end293:                                        ; preds = %if.else280, %if.then267
  br label %do.end294, !dbg !626

do.end294:                                        ; preds = %if.end293
  %287 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %globals295 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %287, i32 0, i32 1, !dbg !647
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals295, i32 0, i32 11, !dbg !647
  %288 = load i8, i8* %member, align 1, !dbg !647
  %tobool296 = trunc i8 %288 to i1, !dbg !647
  %289 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !647
  %globals297 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %289, i32 0, i32 1, !dbg !647
  %member298 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals297, i32 0, i32 11, !dbg !647
  %frombool299 = zext i1 %tobool296 to i8, !dbg !647
  store i8 %frombool299, i8* %member298, align 1, !dbg !647
  %290 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %globals300 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %290, i32 0, i32 1, !dbg !648
  %291 = bitcast %struct.camel_global_t* %globals300 to i8*, !dbg !648
  %292 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %globals301 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %292, i32 0, i32 1, !dbg !648
  %293 = bitcast %struct.camel_global_t* %globals301 to i8*, !dbg !648
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %291, i8* align 2 %293, i16 276, i1 false), !dbg !648
  call void @task_lookup_done(), !dbg !649
  br label %do.body302, !dbg !650

do.body302:                                       ; preds = %do.end294
  %294 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !651
  %cmp303 = icmp eq i16 %294, 1, !dbg !651
  br i1 %cmp303, label %if.then305, label %if.else318, !dbg !654

if.then305:                                       ; preds = %do.body302
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !655
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !655
  %295 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %reg_file306 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %295, i32 0, i32 0, !dbg !655
  %arraydecay307 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file306, i16 0, i16 0, !dbg !655
  call void @__dump_registers(i16* %arraydecay307), !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x308, metadata !657, metadata !DIExpression()), !dbg !659
  %296 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !659, !srcloc !660
  store i16 %296, i16* %__x308, align 2, !dbg !659
  %297 = load i16, i16* %__x308, align 2, !dbg !659
  store i16 %297, i16* %tmp309, align 2, !dbg !659
  %298 = load i16, i16* %tmp309, align 2, !dbg !659
  %add310 = add i16 %298, 2, !dbg !655
  %299 = inttoptr i16 %add310 to i8*, !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x311, metadata !661, metadata !DIExpression()), !dbg !663
  %300 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !663, !srcloc !664
  store i16 %300, i16* %__x311, align 2, !dbg !663
  %301 = load i16, i16* %__x311, align 2, !dbg !663
  store i16 %301, i16* %tmp312, align 2, !dbg !663
  %302 = load i16, i16* %tmp312, align 2, !dbg !663
  %add313 = add i16 %302, 2, !dbg !655
  %sub314 = sub i16 9216, %add313, !dbg !655
  %call315 = call zeroext i16 @__fast_hw_crc(i8* %299, i16 zeroext %sub314, i16 zeroext -1), !dbg !655
  store i16 %call315, i16* @tmp_stack_crc, align 2, !dbg !655
  %303 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %304 = bitcast %struct.camel_buffer_t* %303 to i8*, !dbg !655
  %305 = load i16, i16* @tmp_stack_crc, align 2, !dbg !655
  %call316 = call zeroext i16 @__fast_hw_crc(i8* %304, i16 zeroext 298, i16 zeroext %305), !dbg !655
  store i16 %call316, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %306 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %307 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %stack_and_buf_crc317 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %307, i32 0, i32 2, !dbg !655
  store i16 %306, i16* %stack_and_buf_crc317, align 2, !dbg !655
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !655
  br label %if.end331, !dbg !655

if.else318:                                       ; preds = %do.body302
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !665
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !665
  %308 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !665
  %reg_file319 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %308, i32 0, i32 0, !dbg !665
  %arraydecay320 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file319, i16 0, i16 0, !dbg !665
  call void @__dump_registers(i16* %arraydecay320), !dbg !665
  call void @llvm.dbg.declare(metadata i16* %__x321, metadata !667, metadata !DIExpression()), !dbg !669
  %309 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !669, !srcloc !670
  store i16 %309, i16* %__x321, align 2, !dbg !669
  %310 = load i16, i16* %__x321, align 2, !dbg !669
  store i16 %310, i16* %tmp322, align 2, !dbg !669
  %311 = load i16, i16* %tmp322, align 2, !dbg !669
  %add323 = add i16 %311, 2, !dbg !665
  %312 = inttoptr i16 %add323 to i8*, !dbg !665
  call void @llvm.dbg.declare(metadata i16* %__x324, metadata !671, metadata !DIExpression()), !dbg !673
  %313 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !673, !srcloc !674
  store i16 %313, i16* %__x324, align 2, !dbg !673
  %314 = load i16, i16* %__x324, align 2, !dbg !673
  store i16 %314, i16* %tmp325, align 2, !dbg !673
  %315 = load i16, i16* %tmp325, align 2, !dbg !673
  %add326 = add i16 %315, 2, !dbg !665
  %sub327 = sub i16 9216, %add326, !dbg !665
  %call328 = call zeroext i16 @__fast_hw_crc(i8* %312, i16 zeroext %sub327, i16 zeroext -1), !dbg !665
  store i16 %call328, i16* @tmp_stack_crc, align 2, !dbg !665
  %316 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !665
  %317 = bitcast %struct.camel_buffer_t* %316 to i8*, !dbg !665
  %318 = load i16, i16* @tmp_stack_crc, align 2, !dbg !665
  %call329 = call zeroext i16 @__fast_hw_crc(i8* %317, i16 zeroext 298, i16 zeroext %318), !dbg !665
  store i16 %call329, i16* @tmp_stack_buf_crc, align 2, !dbg !665
  %319 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !665
  %320 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !665
  %stack_and_buf_crc330 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %320, i32 0, i32 2, !dbg !665
  store i16 %319, i16* %stack_and_buf_crc330, align 2, !dbg !665
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !665
  br label %if.end331

if.end331:                                        ; preds = %if.else318, %if.then305
  br label %do.end332, !dbg !654

do.end332:                                        ; preds = %if.end331
  %321 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !675
  %globals333 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %321, i32 0, i32 1, !dbg !675
  %lookup_count334 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals333, i32 0, i32 8, !dbg !675
  %322 = load i16, i16* %lookup_count334, align 2, !dbg !675
  %323 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !675
  %globals335 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %323, i32 0, i32 1, !dbg !675
  %lookup_count336 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals335, i32 0, i32 8, !dbg !675
  store i16 %322, i16* %lookup_count336, align 2, !dbg !675
  %324 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !675
  %globals337 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %324, i32 0, i32 1, !dbg !675
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals337, i32 0, i32 9, !dbg !675
  %325 = load i16, i16* %member_count, align 2, !dbg !675
  %326 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !675
  %globals338 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %326, i32 0, i32 1, !dbg !675
  %member_count339 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals338, i32 0, i32 9, !dbg !675
  store i16 %325, i16* %member_count339, align 2, !dbg !675
  br label %if.end340

if.end340:                                        ; preds = %do.end332, %do.end249
  br label %while.cond, !dbg !419, !llvm.loop !676

while.end341:                                     ; preds = %while.cond
  call void @task_done(), !dbg !678
  %327 = load i16, i16* %retval, align 2, !dbg !679
  ret i16 %327, !dbg !679
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !680 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !683, metadata !DIExpression()), !dbg !684
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !685, metadata !DIExpression()), !dbg !686
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !687, metadata !DIExpression()), !dbg !688
  store i16 5381, i16* %hash, align 2, !dbg !688
  call void @llvm.dbg.declare(metadata i16* %i, metadata !689, metadata !DIExpression()), !dbg !690
  store i16 0, i16* %i, align 2, !dbg !691
  br label %for.cond, !dbg !693

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !694
  %1 = load i16, i16* %len.addr, align 2, !dbg !696
  %cmp = icmp ult i16 %0, %1, !dbg !697
  br i1 %cmp, label %for.body, label %for.end, !dbg !698

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !699
  %shl = shl i16 %2, 5, !dbg !700
  %3 = load i16, i16* %hash, align 2, !dbg !701
  %add = add i16 %shl, %3, !dbg !702
  %4 = load i8*, i8** %data.addr, align 2, !dbg !703
  %5 = load i8, i8* %4, align 1, !dbg !704
  %conv = zext i8 %5 to i16, !dbg !705
  %add1 = add i16 %add, %conv, !dbg !706
  store i16 %add1, i16* %hash, align 2, !dbg !707
  br label %for.inc, !dbg !708

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !709
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !709
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !709
  %7 = load i16, i16* %i, align 2, !dbg !710
  %inc = add i16 %7, 1, !dbg !710
  store i16 %inc, i16* %i, align 2, !dbg !710
  br label %for.cond, !dbg !711, !llvm.loop !712

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !714
  ret i16 %8, !dbg !715
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
!113 = !{i32 -2146587811}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 202, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 202, column: 33)
!116 = !DILocation(line: 202, column: 33, scope: !115)
!117 = !{i32 -2146587575}
!118 = !DILocation(line: 202, column: 51, scope: !92)
!119 = !DILocation(line: 202, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 202, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 202, column: 65)
!122 = !DILocation(line: 202, column: 65, scope: !121)
!123 = !{i32 -2146587450}
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
!425 = !DILocation(line: 555, column: 9, scope: !423)
!426 = !DILocation(line: 557, column: 9, scope: !423)
!427 = !DILocation(line: 558, column: 9, scope: !423)
!428 = !DILocation(line: 559, column: 9, scope: !423)
!429 = !DILocation(line: 559, column: 9, scope: !430)
!430 = distinct !DILexicalBlock(scope: !431, file: !3, line: 559, column: 9)
!431 = distinct !DILexicalBlock(scope: !423, file: !3, line: 559, column: 9)
!432 = !DILocation(line: 559, column: 9, scope: !431)
!433 = !DILocation(line: 559, column: 9, scope: !434)
!434 = distinct !DILexicalBlock(scope: !430, file: !3, line: 559, column: 9)
!435 = !DILocalVariable(name: "__x", scope: !436, file: !3, line: 559, type: !6)
!436 = distinct !DILexicalBlock(scope: !434, file: !3, line: 559, column: 9)
!437 = !DILocation(line: 559, column: 9, scope: !436)
!438 = !{i32 -2146582970}
!439 = !DILocalVariable(name: "__x", scope: !440, file: !3, line: 559, type: !6)
!440 = distinct !DILexicalBlock(scope: !434, file: !3, line: 559, column: 9)
!441 = !DILocation(line: 559, column: 9, scope: !440)
!442 = !{i32 -2146582845}
!443 = !DILocation(line: 559, column: 9, scope: !444)
!444 = distinct !DILexicalBlock(scope: !430, file: !3, line: 559, column: 9)
!445 = !DILocalVariable(name: "__x", scope: !446, file: !3, line: 559, type: !6)
!446 = distinct !DILexicalBlock(scope: !444, file: !3, line: 559, column: 9)
!447 = !DILocation(line: 559, column: 9, scope: !446)
!448 = !{i32 -2146582713}
!449 = !DILocalVariable(name: "__x", scope: !450, file: !3, line: 559, type: !6)
!450 = distinct !DILexicalBlock(scope: !444, file: !3, line: 559, column: 9)
!451 = !DILocation(line: 559, column: 9, scope: !450)
!452 = !{i32 -2146582588}
!453 = !DILocation(line: 560, column: 9, scope: !423)
!454 = !DILocation(line: 562, column: 9, scope: !423)
!455 = !DILocation(line: 563, column: 9, scope: !423)
!456 = !DILocation(line: 564, column: 9, scope: !423)
!457 = !DILocation(line: 564, column: 9, scope: !458)
!458 = distinct !DILexicalBlock(scope: !459, file: !3, line: 564, column: 9)
!459 = distinct !DILexicalBlock(scope: !423, file: !3, line: 564, column: 9)
!460 = !DILocation(line: 564, column: 9, scope: !459)
!461 = !DILocation(line: 564, column: 9, scope: !462)
!462 = distinct !DILexicalBlock(scope: !458, file: !3, line: 564, column: 9)
!463 = !DILocalVariable(name: "__x", scope: !464, file: !3, line: 564, type: !6)
!464 = distinct !DILexicalBlock(scope: !462, file: !3, line: 564, column: 9)
!465 = !DILocation(line: 564, column: 9, scope: !464)
!466 = !{i32 -2146580318}
!467 = !DILocalVariable(name: "__x", scope: !468, file: !3, line: 564, type: !6)
!468 = distinct !DILexicalBlock(scope: !462, file: !3, line: 564, column: 9)
!469 = !DILocation(line: 564, column: 9, scope: !468)
!470 = !{i32 -2146580193}
!471 = !DILocation(line: 564, column: 9, scope: !472)
!472 = distinct !DILexicalBlock(scope: !458, file: !3, line: 564, column: 9)
!473 = !DILocalVariable(name: "__x", scope: !474, file: !3, line: 564, type: !6)
!474 = distinct !DILexicalBlock(scope: !472, file: !3, line: 564, column: 9)
!475 = !DILocation(line: 564, column: 9, scope: !474)
!476 = !{i32 -2146580061}
!477 = !DILocalVariable(name: "__x", scope: !478, file: !3, line: 564, type: !6)
!478 = distinct !DILexicalBlock(scope: !472, file: !3, line: 564, column: 9)
!479 = !DILocation(line: 564, column: 9, scope: !478)
!480 = !{i32 -2146579936}
!481 = !DILocation(line: 565, column: 9, scope: !423)
!482 = !DILocation(line: 567, column: 9, scope: !423)
!483 = !DILocation(line: 568, column: 9, scope: !423)
!484 = !DILocation(line: 569, column: 9, scope: !423)
!485 = !DILocation(line: 569, column: 9, scope: !486)
!486 = distinct !DILexicalBlock(scope: !487, file: !3, line: 569, column: 9)
!487 = distinct !DILexicalBlock(scope: !423, file: !3, line: 569, column: 9)
!488 = !DILocation(line: 569, column: 9, scope: !487)
!489 = !DILocation(line: 569, column: 9, scope: !490)
!490 = distinct !DILexicalBlock(scope: !486, file: !3, line: 569, column: 9)
!491 = !DILocalVariable(name: "__x", scope: !492, file: !3, line: 569, type: !6)
!492 = distinct !DILexicalBlock(scope: !490, file: !3, line: 569, column: 9)
!493 = !DILocation(line: 569, column: 9, scope: !492)
!494 = !{i32 -2146577681}
!495 = !DILocalVariable(name: "__x", scope: !496, file: !3, line: 569, type: !6)
!496 = distinct !DILexicalBlock(scope: !490, file: !3, line: 569, column: 9)
!497 = !DILocation(line: 569, column: 9, scope: !496)
!498 = !{i32 -2146577556}
!499 = !DILocation(line: 569, column: 9, scope: !500)
!500 = distinct !DILexicalBlock(scope: !486, file: !3, line: 569, column: 9)
!501 = !DILocalVariable(name: "__x", scope: !502, file: !3, line: 569, type: !6)
!502 = distinct !DILexicalBlock(scope: !500, file: !3, line: 569, column: 9)
!503 = !DILocation(line: 569, column: 9, scope: !502)
!504 = !{i32 -2146577424}
!505 = !DILocalVariable(name: "__x", scope: !506, file: !3, line: 569, type: !6)
!506 = distinct !DILexicalBlock(scope: !500, file: !3, line: 569, column: 9)
!507 = !DILocation(line: 569, column: 9, scope: !506)
!508 = !{i32 -2146577299}
!509 = !DILocation(line: 570, column: 9, scope: !423)
!510 = !DILocation(line: 572, column: 12, scope: !511)
!511 = distinct !DILexicalBlock(scope: !423, file: !3, line: 572, column: 12)
!512 = !DILocation(line: 572, column: 29, scope: !511)
!513 = !DILocation(line: 572, column: 12, scope: !423)
!514 = !DILocation(line: 573, column: 13, scope: !515)
!515 = distinct !DILexicalBlock(scope: !511, file: !3, line: 572, column: 44)
!516 = !DILocation(line: 574, column: 13, scope: !515)
!517 = !DILocation(line: 575, column: 13, scope: !515)
!518 = !DILocation(line: 575, column: 13, scope: !519)
!519 = distinct !DILexicalBlock(scope: !520, file: !3, line: 575, column: 13)
!520 = distinct !DILexicalBlock(scope: !515, file: !3, line: 575, column: 13)
!521 = !DILocation(line: 575, column: 13, scope: !520)
!522 = !DILocation(line: 575, column: 13, scope: !523)
!523 = distinct !DILexicalBlock(scope: !519, file: !3, line: 575, column: 13)
!524 = !DILocalVariable(name: "__x", scope: !525, file: !3, line: 575, type: !6)
!525 = distinct !DILexicalBlock(scope: !523, file: !3, line: 575, column: 13)
!526 = !DILocation(line: 575, column: 13, scope: !525)
!527 = !{i32 -2146574991}
!528 = !DILocalVariable(name: "__x", scope: !529, file: !3, line: 575, type: !6)
!529 = distinct !DILexicalBlock(scope: !523, file: !3, line: 575, column: 13)
!530 = !DILocation(line: 575, column: 13, scope: !529)
!531 = !{i32 -2146574866}
!532 = !DILocation(line: 575, column: 13, scope: !533)
!533 = distinct !DILexicalBlock(scope: !519, file: !3, line: 575, column: 13)
!534 = !DILocalVariable(name: "__x", scope: !535, file: !3, line: 575, type: !6)
!535 = distinct !DILexicalBlock(scope: !533, file: !3, line: 575, column: 13)
!536 = !DILocation(line: 575, column: 13, scope: !535)
!537 = !{i32 -2146574734}
!538 = !DILocalVariable(name: "__x", scope: !539, file: !3, line: 575, type: !6)
!539 = distinct !DILexicalBlock(scope: !533, file: !3, line: 575, column: 13)
!540 = !DILocation(line: 575, column: 13, scope: !539)
!541 = !{i32 -2146574609}
!542 = !DILocation(line: 576, column: 13, scope: !515)
!543 = !DILocation(line: 578, column: 16, scope: !544)
!544 = distinct !DILexicalBlock(scope: !515, file: !3, line: 578, column: 16)
!545 = !DILocation(line: 578, column: 27, scope: !544)
!546 = !DILocation(line: 578, column: 39, scope: !544)
!547 = !DILocation(line: 578, column: 42, scope: !544)
!548 = !DILocation(line: 578, column: 53, scope: !544)
!549 = !DILocation(line: 578, column: 16, scope: !515)
!550 = !DILocation(line: 579, column: 17, scope: !551)
!551 = distinct !DILexicalBlock(scope: !544, file: !3, line: 578, column: 66)
!552 = !DILocation(line: 579, column: 23, scope: !551)
!553 = !DILocation(line: 579, column: 35, scope: !551)
!554 = !DILocation(line: 579, column: 44, scope: !551)
!555 = !DILocation(line: 579, column: 48, scope: !551)
!556 = !DILocation(line: 579, column: 69, scope: !551)
!557 = !DILocation(line: 0, scope: !551)
!558 = !DILocation(line: 580, column: 21, scope: !559)
!559 = distinct !DILexicalBlock(scope: !551, file: !3, line: 579, column: 89)
!560 = !DILocation(line: 581, column: 21, scope: !559)
!561 = !DILocation(line: 582, column: 21, scope: !559)
!562 = !DILocation(line: 582, column: 21, scope: !563)
!563 = distinct !DILexicalBlock(scope: !564, file: !3, line: 582, column: 21)
!564 = distinct !DILexicalBlock(scope: !559, file: !3, line: 582, column: 21)
!565 = !DILocation(line: 582, column: 21, scope: !564)
!566 = !DILocation(line: 582, column: 21, scope: !567)
!567 = distinct !DILexicalBlock(scope: !563, file: !3, line: 582, column: 21)
!568 = !DILocalVariable(name: "__x", scope: !569, file: !3, line: 582, type: !6)
!569 = distinct !DILexicalBlock(scope: !567, file: !3, line: 582, column: 21)
!570 = !DILocation(line: 582, column: 21, scope: !569)
!571 = !{i32 -2146572174}
!572 = !DILocalVariable(name: "__x", scope: !573, file: !3, line: 582, type: !6)
!573 = distinct !DILexicalBlock(scope: !567, file: !3, line: 582, column: 21)
!574 = !DILocation(line: 582, column: 21, scope: !573)
!575 = !{i32 -2146572049}
!576 = !DILocation(line: 582, column: 21, scope: !577)
!577 = distinct !DILexicalBlock(scope: !563, file: !3, line: 582, column: 21)
!578 = !DILocalVariable(name: "__x", scope: !579, file: !3, line: 582, type: !6)
!579 = distinct !DILexicalBlock(scope: !577, file: !3, line: 582, column: 21)
!580 = !DILocation(line: 582, column: 21, scope: !579)
!581 = !{i32 -2146571917}
!582 = !DILocalVariable(name: "__x", scope: !583, file: !3, line: 582, type: !6)
!583 = distinct !DILexicalBlock(scope: !577, file: !3, line: 582, column: 21)
!584 = !DILocation(line: 582, column: 21, scope: !583)
!585 = !{i32 -2146571792}
!586 = !DILocation(line: 583, column: 21, scope: !559)
!587 = distinct !{!587, !550, !588}
!588 = !DILocation(line: 584, column: 17, scope: !551)
!589 = !DILocation(line: 585, column: 13, scope: !551)
!590 = !DILocation(line: 587, column: 13, scope: !515)
!591 = !DILocation(line: 588, column: 13, scope: !515)
!592 = !DILocation(line: 589, column: 13, scope: !515)
!593 = !DILocation(line: 589, column: 13, scope: !594)
!594 = distinct !DILexicalBlock(scope: !595, file: !3, line: 589, column: 13)
!595 = distinct !DILexicalBlock(scope: !515, file: !3, line: 589, column: 13)
!596 = !DILocation(line: 589, column: 13, scope: !595)
!597 = !DILocation(line: 589, column: 13, scope: !598)
!598 = distinct !DILexicalBlock(scope: !594, file: !3, line: 589, column: 13)
!599 = !DILocalVariable(name: "__x", scope: !600, file: !3, line: 589, type: !6)
!600 = distinct !DILexicalBlock(scope: !598, file: !3, line: 589, column: 13)
!601 = !DILocation(line: 589, column: 13, scope: !600)
!602 = !{i32 -2146569202}
!603 = !DILocalVariable(name: "__x", scope: !604, file: !3, line: 589, type: !6)
!604 = distinct !DILexicalBlock(scope: !598, file: !3, line: 589, column: 13)
!605 = !DILocation(line: 589, column: 13, scope: !604)
!606 = !{i32 -2146569077}
!607 = !DILocation(line: 589, column: 13, scope: !608)
!608 = distinct !DILexicalBlock(scope: !594, file: !3, line: 589, column: 13)
!609 = !DILocalVariable(name: "__x", scope: !610, file: !3, line: 589, type: !6)
!610 = distinct !DILexicalBlock(scope: !608, file: !3, line: 589, column: 13)
!611 = !DILocation(line: 589, column: 13, scope: !610)
!612 = !{i32 -2146568945}
!613 = !DILocalVariable(name: "__x", scope: !614, file: !3, line: 589, type: !6)
!614 = distinct !DILexicalBlock(scope: !608, file: !3, line: 589, column: 13)
!615 = !DILocation(line: 589, column: 13, scope: !614)
!616 = !{i32 -2146568820}
!617 = !DILocation(line: 590, column: 13, scope: !515)
!618 = !DILocation(line: 591, column: 9, scope: !515)
!619 = !DILocation(line: 592, column: 13, scope: !620)
!620 = distinct !DILexicalBlock(scope: !511, file: !3, line: 591, column: 16)
!621 = !DILocation(line: 593, column: 13, scope: !620)
!622 = !DILocation(line: 594, column: 13, scope: !620)
!623 = !DILocation(line: 594, column: 13, scope: !624)
!624 = distinct !DILexicalBlock(scope: !625, file: !3, line: 594, column: 13)
!625 = distinct !DILexicalBlock(scope: !620, file: !3, line: 594, column: 13)
!626 = !DILocation(line: 594, column: 13, scope: !625)
!627 = !DILocation(line: 594, column: 13, scope: !628)
!628 = distinct !DILexicalBlock(scope: !624, file: !3, line: 594, column: 13)
!629 = !DILocalVariable(name: "__x", scope: !630, file: !3, line: 594, type: !6)
!630 = distinct !DILexicalBlock(scope: !628, file: !3, line: 594, column: 13)
!631 = !DILocation(line: 594, column: 13, scope: !630)
!632 = !{i32 -2146566406}
!633 = !DILocalVariable(name: "__x", scope: !634, file: !3, line: 594, type: !6)
!634 = distinct !DILexicalBlock(scope: !628, file: !3, line: 594, column: 13)
!635 = !DILocation(line: 594, column: 13, scope: !634)
!636 = !{i32 -2146566281}
!637 = !DILocation(line: 594, column: 13, scope: !638)
!638 = distinct !DILexicalBlock(scope: !624, file: !3, line: 594, column: 13)
!639 = !DILocalVariable(name: "__x", scope: !640, file: !3, line: 594, type: !6)
!640 = distinct !DILexicalBlock(scope: !638, file: !3, line: 594, column: 13)
!641 = !DILocation(line: 594, column: 13, scope: !640)
!642 = !{i32 -2146566149}
!643 = !DILocalVariable(name: "__x", scope: !644, file: !3, line: 594, type: !6)
!644 = distinct !DILexicalBlock(scope: !638, file: !3, line: 594, column: 13)
!645 = !DILocation(line: 594, column: 13, scope: !644)
!646 = !{i32 -2146566024}
!647 = !DILocation(line: 595, column: 13, scope: !620)
!648 = !DILocation(line: 597, column: 13, scope: !620)
!649 = !DILocation(line: 598, column: 13, scope: !620)
!650 = !DILocation(line: 599, column: 13, scope: !620)
!651 = !DILocation(line: 599, column: 13, scope: !652)
!652 = distinct !DILexicalBlock(scope: !653, file: !3, line: 599, column: 13)
!653 = distinct !DILexicalBlock(scope: !620, file: !3, line: 599, column: 13)
!654 = !DILocation(line: 599, column: 13, scope: !653)
!655 = !DILocation(line: 599, column: 13, scope: !656)
!656 = distinct !DILexicalBlock(scope: !652, file: !3, line: 599, column: 13)
!657 = !DILocalVariable(name: "__x", scope: !658, file: !3, line: 599, type: !6)
!658 = distinct !DILexicalBlock(scope: !656, file: !3, line: 599, column: 13)
!659 = !DILocation(line: 599, column: 13, scope: !658)
!660 = !{i32 -2146563769}
!661 = !DILocalVariable(name: "__x", scope: !662, file: !3, line: 599, type: !6)
!662 = distinct !DILexicalBlock(scope: !656, file: !3, line: 599, column: 13)
!663 = !DILocation(line: 599, column: 13, scope: !662)
!664 = !{i32 -2146563644}
!665 = !DILocation(line: 599, column: 13, scope: !666)
!666 = distinct !DILexicalBlock(scope: !652, file: !3, line: 599, column: 13)
!667 = !DILocalVariable(name: "__x", scope: !668, file: !3, line: 599, type: !6)
!668 = distinct !DILexicalBlock(scope: !666, file: !3, line: 599, column: 13)
!669 = !DILocation(line: 599, column: 13, scope: !668)
!670 = !{i32 -2146563512}
!671 = !DILocalVariable(name: "__x", scope: !672, file: !3, line: 599, type: !6)
!672 = distinct !DILexicalBlock(scope: !666, file: !3, line: 599, column: 13)
!673 = !DILocation(line: 599, column: 13, scope: !672)
!674 = !{i32 -2146563387}
!675 = !DILocation(line: 600, column: 13, scope: !620)
!676 = distinct !{!676, !419, !677}
!677 = !DILocation(line: 602, column: 5, scope: !404)
!678 = !DILocation(line: 604, column: 5, scope: !404)
!679 = !DILocation(line: 605, column: 1, scope: !404)
!680 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 221, type: !681, scopeLine: 222, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!681 = !DISubroutineType(types: !682)
!682 = !{!213, !7, !6}
!683 = !DILocalVariable(name: "data", arg: 1, scope: !680, file: !3, line: 221, type: !7)
!684 = !DILocation(line: 221, column: 33, scope: !680)
!685 = !DILocalVariable(name: "len", arg: 2, scope: !680, file: !3, line: 221, type: !6)
!686 = !DILocation(line: 221, column: 48, scope: !680)
!687 = !DILocalVariable(name: "hash", scope: !680, file: !3, line: 223, type: !18)
!688 = !DILocation(line: 223, column: 14, scope: !680)
!689 = !DILocalVariable(name: "i", scope: !680, file: !3, line: 224, type: !6)
!690 = !DILocation(line: 224, column: 18, scope: !680)
!691 = !DILocation(line: 226, column: 11, scope: !692)
!692 = distinct !DILexicalBlock(scope: !680, file: !3, line: 226, column: 5)
!693 = !DILocation(line: 226, column: 9, scope: !692)
!694 = !DILocation(line: 226, column: 16, scope: !695)
!695 = distinct !DILexicalBlock(scope: !692, file: !3, line: 226, column: 5)
!696 = !DILocation(line: 226, column: 20, scope: !695)
!697 = !DILocation(line: 226, column: 18, scope: !695)
!698 = !DILocation(line: 226, column: 5, scope: !692)
!699 = !DILocation(line: 227, column: 18, scope: !695)
!700 = !DILocation(line: 227, column: 23, scope: !695)
!701 = !DILocation(line: 227, column: 31, scope: !695)
!702 = !DILocation(line: 227, column: 29, scope: !695)
!703 = !DILocation(line: 227, column: 41, scope: !695)
!704 = !DILocation(line: 227, column: 40, scope: !695)
!705 = !DILocation(line: 227, column: 39, scope: !695)
!706 = !DILocation(line: 227, column: 37, scope: !695)
!707 = !DILocation(line: 227, column: 14, scope: !695)
!708 = !DILocation(line: 227, column: 9, scope: !695)
!709 = !DILocation(line: 226, column: 29, scope: !695)
!710 = !DILocation(line: 226, column: 34, scope: !695)
!711 = !DILocation(line: 226, column: 5, scope: !695)
!712 = distinct !{!712, !698, !713}
!713 = !DILocation(line: 227, column: 45, scope: !692)
!714 = !DILocation(line: 230, column: 12, scope: !680)
!715 = !DILocation(line: 230, column: 5, scope: !680)
