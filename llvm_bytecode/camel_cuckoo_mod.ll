; ModuleID = 'camel_cuckoo_mod.bc'
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
  %__x4 = alloca i16, align 2
  %tmp5 = alloca i16, align 2
  %__x10 = alloca i16, align 2
  %tmp11 = alloca i16, align 2
  %__x13 = alloca i16, align 2
  %tmp14 = alloca i16, align 2
  %__x25 = alloca i16, align 2
  %tmp26 = alloca i16, align 2
  %__x28 = alloca i16, align 2
  %tmp29 = alloca i16, align 2
  %__x38 = alloca i16, align 2
  %tmp39 = alloca i16, align 2
  %__x41 = alloca i16, align 2
  %tmp42 = alloca i16, align 2
  %__x55 = alloca i16, align 2
  %tmp56 = alloca i16, align 2
  %__x58 = alloca i16, align 2
  %tmp59 = alloca i16, align 2
  %__x68 = alloca i16, align 2
  %tmp69 = alloca i16, align 2
  %__x71 = alloca i16, align 2
  %tmp72 = alloca i16, align 2
  %__x85 = alloca i16, align 2
  %tmp86 = alloca i16, align 2
  %__x88 = alloca i16, align 2
  %tmp89 = alloca i16, align 2
  %__x98 = alloca i16, align 2
  %tmp99 = alloca i16, align 2
  %__x101 = alloca i16, align 2
  %tmp102 = alloca i16, align 2
  %__x118 = alloca i16, align 2
  %tmp119 = alloca i16, align 2
  %__x121 = alloca i16, align 2
  %tmp122 = alloca i16, align 2
  %__x131 = alloca i16, align 2
  %tmp132 = alloca i16, align 2
  %__x134 = alloca i16, align 2
  %tmp135 = alloca i16, align 2
  %__x166 = alloca i16, align 2
  %tmp167 = alloca i16, align 2
  %__x169 = alloca i16, align 2
  %tmp170 = alloca i16, align 2
  %__x179 = alloca i16, align 2
  %tmp180 = alloca i16, align 2
  %__x182 = alloca i16, align 2
  %tmp183 = alloca i16, align 2
  %__x198 = alloca i16, align 2
  %tmp199 = alloca i16, align 2
  %__x201 = alloca i16, align 2
  %tmp202 = alloca i16, align 2
  %__x211 = alloca i16, align 2
  %tmp212 = alloca i16, align 2
  %__x214 = alloca i16, align 2
  %tmp215 = alloca i16, align 2
  %__x230 = alloca i16, align 2
  %tmp231 = alloca i16, align 2
  %__x233 = alloca i16, align 2
  %tmp234 = alloca i16, align 2
  %__x243 = alloca i16, align 2
  %tmp244 = alloca i16, align 2
  %__x246 = alloca i16, align 2
  %tmp247 = alloca i16, align 2
  %__x261 = alloca i16, align 2
  %tmp262 = alloca i16, align 2
  %__x264 = alloca i16, align 2
  %tmp265 = alloca i16, align 2
  %__x274 = alloca i16, align 2
  %tmp275 = alloca i16, align 2
  %__x277 = alloca i16, align 2
  %tmp278 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !409
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !410
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !411
  call void @camel_init(), !dbg !412
  call void @task_init(), !dbg !413
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !414
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !415
  %1 = bitcast %struct.camel_global_t* %globals to i8*, !dbg !416
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !418
  %3 = bitcast %struct.camel_global_t* %globals1 to i8*, !dbg !416
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %1, i8* align 2 %3, i16 276, i1 false), !dbg !416
  call void @task_commit_done(), !dbg !419
  br label %while.cond, !dbg !420

while.cond:                                       ; preds = %if.end286, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !421
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !421
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !421
  %5 = load i16, i16* %lookup_count, align 2, !dbg !421
  %cmp = icmp ult i16 %5, 32, !dbg !422
  br i1 %cmp, label %while.body, label %while.end287, !dbg !420

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !423
  br label %do.body, !dbg !425

do.body:                                          ; preds = %while.body
  %6 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !426
  %cmp3 = icmp eq i16 %6, 1, !dbg !426
  br i1 %cmp3, label %if.then, label %if.else, !dbg !429

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !430
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !430
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 0, !dbg !430
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !430
  call void @__dump_registers(i16* %arraydecay), !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !432, metadata !DIExpression()), !dbg !434
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !434, !srcloc !435
  store i16 %8, i16* %__x, align 2, !dbg !434
  %9 = load i16, i16* %__x, align 2, !dbg !434
  store i16 %9, i16* %tmp, align 2, !dbg !434
  %10 = load i16, i16* %tmp, align 2, !dbg !434
  %add = add i16 %10, 2, !dbg !430
  %11 = inttoptr i16 %add to i8*, !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x4, metadata !436, metadata !DIExpression()), !dbg !438
  %12 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !438, !srcloc !439
  store i16 %12, i16* %__x4, align 2, !dbg !438
  %13 = load i16, i16* %__x4, align 2, !dbg !438
  store i16 %13, i16* %tmp5, align 2, !dbg !438
  %14 = load i16, i16* %tmp5, align 2, !dbg !438
  %add6 = add i16 %14, 2, !dbg !430
  %sub = sub i16 9216, %add6, !dbg !430
  %call = call zeroext i16 @__fast_hw_crc(i8* %11, i16 zeroext %sub, i16 zeroext -1), !dbg !430
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !430
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %16 = bitcast %struct.camel_buffer_t* %15 to i8*, !dbg !430
  %17 = load i16, i16* @tmp_stack_crc, align 2, !dbg !430
  %call7 = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext 298, i16 zeroext %17), !dbg !430
  store i16 %call7, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %18 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 2, !dbg !430
  store i16 %18, i16* %stack_and_buf_crc, align 2, !dbg !430
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !430
  br label %if.end, !dbg !430

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !440
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %reg_file8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 0, !dbg !440
  %arraydecay9 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file8, i16 0, i16 0, !dbg !440
  call void @__dump_registers(i16* %arraydecay9), !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !442, metadata !DIExpression()), !dbg !444
  %21 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !444, !srcloc !445
  store i16 %21, i16* %__x10, align 2, !dbg !444
  %22 = load i16, i16* %__x10, align 2, !dbg !444
  store i16 %22, i16* %tmp11, align 2, !dbg !444
  %23 = load i16, i16* %tmp11, align 2, !dbg !444
  %add12 = add i16 %23, 2, !dbg !440
  %24 = inttoptr i16 %add12 to i8*, !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x13, metadata !446, metadata !DIExpression()), !dbg !448
  %25 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !448, !srcloc !449
  store i16 %25, i16* %__x13, align 2, !dbg !448
  %26 = load i16, i16* %__x13, align 2, !dbg !448
  store i16 %26, i16* %tmp14, align 2, !dbg !448
  %27 = load i16, i16* %tmp14, align 2, !dbg !448
  %add15 = add i16 %27, 2, !dbg !440
  %sub16 = sub i16 9216, %add15, !dbg !440
  %call17 = call zeroext i16 @__fast_hw_crc(i8* %24, i16 zeroext %sub16, i16 zeroext -1), !dbg !440
  store i16 %call17, i16* @tmp_stack_crc, align 2, !dbg !440
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %29 = bitcast %struct.camel_buffer_t* %28 to i8*, !dbg !440
  %30 = load i16, i16* @tmp_stack_crc, align 2, !dbg !440
  %call18 = call zeroext i16 @__fast_hw_crc(i8* %29, i16 zeroext 298, i16 zeroext %30), !dbg !440
  store i16 %call18, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %31 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %stack_and_buf_crc19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 2, !dbg !440
  store i16 %31, i16* %stack_and_buf_crc19, align 2, !dbg !440
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !440
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !429

do.end:                                           ; preds = %if.end
  call void @task_commit_done(), !dbg !450
  call void @task_calc_indexes(), !dbg !451
  br label %do.body20, !dbg !452

do.body20:                                        ; preds = %do.end
  %33 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !453
  %cmp21 = icmp eq i16 %33, 1, !dbg !453
  br i1 %cmp21, label %if.then22, label %if.else35, !dbg !456

if.then22:                                        ; preds = %do.body20
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !457
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !457
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !457
  %reg_file23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 0, !dbg !457
  %arraydecay24 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file23, i16 0, i16 0, !dbg !457
  call void @__dump_registers(i16* %arraydecay24), !dbg !457
  call void @llvm.dbg.declare(metadata i16* %__x25, metadata !459, metadata !DIExpression()), !dbg !461
  %35 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !461, !srcloc !462
  store i16 %35, i16* %__x25, align 2, !dbg !461
  %36 = load i16, i16* %__x25, align 2, !dbg !461
  store i16 %36, i16* %tmp26, align 2, !dbg !461
  %37 = load i16, i16* %tmp26, align 2, !dbg !461
  %add27 = add i16 %37, 2, !dbg !457
  %38 = inttoptr i16 %add27 to i8*, !dbg !457
  call void @llvm.dbg.declare(metadata i16* %__x28, metadata !463, metadata !DIExpression()), !dbg !465
  %39 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !465, !srcloc !466
  store i16 %39, i16* %__x28, align 2, !dbg !465
  %40 = load i16, i16* %__x28, align 2, !dbg !465
  store i16 %40, i16* %tmp29, align 2, !dbg !465
  %41 = load i16, i16* %tmp29, align 2, !dbg !465
  %add30 = add i16 %41, 2, !dbg !457
  %sub31 = sub i16 9216, %add30, !dbg !457
  %call32 = call zeroext i16 @__fast_hw_crc(i8* %38, i16 zeroext %sub31, i16 zeroext -1), !dbg !457
  store i16 %call32, i16* @tmp_stack_crc, align 2, !dbg !457
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !457
  %43 = bitcast %struct.camel_buffer_t* %42 to i8*, !dbg !457
  %44 = load i16, i16* @tmp_stack_crc, align 2, !dbg !457
  %call33 = call zeroext i16 @__fast_hw_crc(i8* %43, i16 zeroext 298, i16 zeroext %44), !dbg !457
  store i16 %call33, i16* @tmp_stack_buf_crc, align 2, !dbg !457
  %45 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !457
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !457
  %stack_and_buf_crc34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 2, !dbg !457
  store i16 %45, i16* %stack_and_buf_crc34, align 2, !dbg !457
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !457
  br label %if.end48, !dbg !457

if.else35:                                        ; preds = %do.body20
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !467
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !467
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !467
  %reg_file36 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 0, !dbg !467
  %arraydecay37 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file36, i16 0, i16 0, !dbg !467
  call void @__dump_registers(i16* %arraydecay37), !dbg !467
  call void @llvm.dbg.declare(metadata i16* %__x38, metadata !469, metadata !DIExpression()), !dbg !471
  %48 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !471, !srcloc !472
  store i16 %48, i16* %__x38, align 2, !dbg !471
  %49 = load i16, i16* %__x38, align 2, !dbg !471
  store i16 %49, i16* %tmp39, align 2, !dbg !471
  %50 = load i16, i16* %tmp39, align 2, !dbg !471
  %add40 = add i16 %50, 2, !dbg !467
  %51 = inttoptr i16 %add40 to i8*, !dbg !467
  call void @llvm.dbg.declare(metadata i16* %__x41, metadata !473, metadata !DIExpression()), !dbg !475
  %52 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !475, !srcloc !476
  store i16 %52, i16* %__x41, align 2, !dbg !475
  %53 = load i16, i16* %__x41, align 2, !dbg !475
  store i16 %53, i16* %tmp42, align 2, !dbg !475
  %54 = load i16, i16* %tmp42, align 2, !dbg !475
  %add43 = add i16 %54, 2, !dbg !467
  %sub44 = sub i16 9216, %add43, !dbg !467
  %call45 = call zeroext i16 @__fast_hw_crc(i8* %51, i16 zeroext %sub44, i16 zeroext -1), !dbg !467
  store i16 %call45, i16* @tmp_stack_crc, align 2, !dbg !467
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !467
  %56 = bitcast %struct.camel_buffer_t* %55 to i8*, !dbg !467
  %57 = load i16, i16* @tmp_stack_crc, align 2, !dbg !467
  %call46 = call zeroext i16 @__fast_hw_crc(i8* %56, i16 zeroext 298, i16 zeroext %57), !dbg !467
  store i16 %call46, i16* @tmp_stack_buf_crc, align 2, !dbg !467
  %58 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !467
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !467
  %stack_and_buf_crc47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 2, !dbg !467
  store i16 %58, i16* %stack_and_buf_crc47, align 2, !dbg !467
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !467
  br label %if.end48

if.end48:                                         ; preds = %if.else35, %if.then22
  br label %do.end49, !dbg !456

do.end49:                                         ; preds = %if.end48
  call void @task_commit_done(), !dbg !477
  call void @task_calc_indexes_index_1(), !dbg !478
  br label %do.body50, !dbg !479

do.body50:                                        ; preds = %do.end49
  %60 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !480
  %cmp51 = icmp eq i16 %60, 1, !dbg !480
  br i1 %cmp51, label %if.then52, label %if.else65, !dbg !483

if.then52:                                        ; preds = %do.body50
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !484
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !484
  %reg_file53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 0, !dbg !484
  %arraydecay54 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file53, i16 0, i16 0, !dbg !484
  call void @__dump_registers(i16* %arraydecay54), !dbg !484
  call void @llvm.dbg.declare(metadata i16* %__x55, metadata !486, metadata !DIExpression()), !dbg !488
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !488, !srcloc !489
  store i16 %62, i16* %__x55, align 2, !dbg !488
  %63 = load i16, i16* %__x55, align 2, !dbg !488
  store i16 %63, i16* %tmp56, align 2, !dbg !488
  %64 = load i16, i16* %tmp56, align 2, !dbg !488
  %add57 = add i16 %64, 2, !dbg !484
  %65 = inttoptr i16 %add57 to i8*, !dbg !484
  call void @llvm.dbg.declare(metadata i16* %__x58, metadata !490, metadata !DIExpression()), !dbg !492
  %66 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !492, !srcloc !493
  store i16 %66, i16* %__x58, align 2, !dbg !492
  %67 = load i16, i16* %__x58, align 2, !dbg !492
  store i16 %67, i16* %tmp59, align 2, !dbg !492
  %68 = load i16, i16* %tmp59, align 2, !dbg !492
  %add60 = add i16 %68, 2, !dbg !484
  %sub61 = sub i16 9216, %add60, !dbg !484
  %call62 = call zeroext i16 @__fast_hw_crc(i8* %65, i16 zeroext %sub61, i16 zeroext -1), !dbg !484
  store i16 %call62, i16* @tmp_stack_crc, align 2, !dbg !484
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !484
  %70 = bitcast %struct.camel_buffer_t* %69 to i8*, !dbg !484
  %71 = load i16, i16* @tmp_stack_crc, align 2, !dbg !484
  %call63 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext 298, i16 zeroext %71), !dbg !484
  store i16 %call63, i16* @tmp_stack_buf_crc, align 2, !dbg !484
  %72 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !484
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !484
  %stack_and_buf_crc64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 2, !dbg !484
  store i16 %72, i16* %stack_and_buf_crc64, align 2, !dbg !484
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !484
  br label %if.end78, !dbg !484

if.else65:                                        ; preds = %do.body50
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !494
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !494
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !494
  %reg_file66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i32 0, i32 0, !dbg !494
  %arraydecay67 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file66, i16 0, i16 0, !dbg !494
  call void @__dump_registers(i16* %arraydecay67), !dbg !494
  call void @llvm.dbg.declare(metadata i16* %__x68, metadata !496, metadata !DIExpression()), !dbg !498
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !498, !srcloc !499
  store i16 %75, i16* %__x68, align 2, !dbg !498
  %76 = load i16, i16* %__x68, align 2, !dbg !498
  store i16 %76, i16* %tmp69, align 2, !dbg !498
  %77 = load i16, i16* %tmp69, align 2, !dbg !498
  %add70 = add i16 %77, 2, !dbg !494
  %78 = inttoptr i16 %add70 to i8*, !dbg !494
  call void @llvm.dbg.declare(metadata i16* %__x71, metadata !500, metadata !DIExpression()), !dbg !502
  %79 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !502, !srcloc !503
  store i16 %79, i16* %__x71, align 2, !dbg !502
  %80 = load i16, i16* %__x71, align 2, !dbg !502
  store i16 %80, i16* %tmp72, align 2, !dbg !502
  %81 = load i16, i16* %tmp72, align 2, !dbg !502
  %add73 = add i16 %81, 2, !dbg !494
  %sub74 = sub i16 9216, %add73, !dbg !494
  %call75 = call zeroext i16 @__fast_hw_crc(i8* %78, i16 zeroext %sub74, i16 zeroext -1), !dbg !494
  store i16 %call75, i16* @tmp_stack_crc, align 2, !dbg !494
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !494
  %83 = bitcast %struct.camel_buffer_t* %82 to i8*, !dbg !494
  %84 = load i16, i16* @tmp_stack_crc, align 2, !dbg !494
  %call76 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext 298, i16 zeroext %84), !dbg !494
  store i16 %call76, i16* @tmp_stack_buf_crc, align 2, !dbg !494
  %85 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !494
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !494
  %stack_and_buf_crc77 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 2, !dbg !494
  store i16 %85, i16* %stack_and_buf_crc77, align 2, !dbg !494
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !494
  br label %if.end78

if.end78:                                         ; preds = %if.else65, %if.then52
  br label %do.end79, !dbg !483

do.end79:                                         ; preds = %if.end78
  call void @task_commit_done(), !dbg !504
  call void @task_calc_indexes_index_2(), !dbg !505
  br label %do.body80, !dbg !506

do.body80:                                        ; preds = %do.end79
  %87 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !507
  %cmp81 = icmp eq i16 %87, 1, !dbg !507
  br i1 %cmp81, label %if.then82, label %if.else95, !dbg !510

if.then82:                                        ; preds = %do.body80
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !511
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !511
  %88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !511
  %reg_file83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %88, i32 0, i32 0, !dbg !511
  %arraydecay84 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file83, i16 0, i16 0, !dbg !511
  call void @__dump_registers(i16* %arraydecay84), !dbg !511
  call void @llvm.dbg.declare(metadata i16* %__x85, metadata !513, metadata !DIExpression()), !dbg !515
  %89 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !515, !srcloc !516
  store i16 %89, i16* %__x85, align 2, !dbg !515
  %90 = load i16, i16* %__x85, align 2, !dbg !515
  store i16 %90, i16* %tmp86, align 2, !dbg !515
  %91 = load i16, i16* %tmp86, align 2, !dbg !515
  %add87 = add i16 %91, 2, !dbg !511
  %92 = inttoptr i16 %add87 to i8*, !dbg !511
  call void @llvm.dbg.declare(metadata i16* %__x88, metadata !517, metadata !DIExpression()), !dbg !519
  %93 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !519, !srcloc !520
  store i16 %93, i16* %__x88, align 2, !dbg !519
  %94 = load i16, i16* %__x88, align 2, !dbg !519
  store i16 %94, i16* %tmp89, align 2, !dbg !519
  %95 = load i16, i16* %tmp89, align 2, !dbg !519
  %add90 = add i16 %95, 2, !dbg !511
  %sub91 = sub i16 9216, %add90, !dbg !511
  %call92 = call zeroext i16 @__fast_hw_crc(i8* %92, i16 zeroext %sub91, i16 zeroext -1), !dbg !511
  store i16 %call92, i16* @tmp_stack_crc, align 2, !dbg !511
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !511
  %97 = bitcast %struct.camel_buffer_t* %96 to i8*, !dbg !511
  %98 = load i16, i16* @tmp_stack_crc, align 2, !dbg !511
  %call93 = call zeroext i16 @__fast_hw_crc(i8* %97, i16 zeroext 298, i16 zeroext %98), !dbg !511
  store i16 %call93, i16* @tmp_stack_buf_crc, align 2, !dbg !511
  %99 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !511
  %100 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !511
  %stack_and_buf_crc94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %100, i32 0, i32 2, !dbg !511
  store i16 %99, i16* %stack_and_buf_crc94, align 2, !dbg !511
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !511
  br label %if.end108, !dbg !511

if.else95:                                        ; preds = %do.body80
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !521
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !521
  %101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !521
  %reg_file96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %101, i32 0, i32 0, !dbg !521
  %arraydecay97 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file96, i16 0, i16 0, !dbg !521
  call void @__dump_registers(i16* %arraydecay97), !dbg !521
  call void @llvm.dbg.declare(metadata i16* %__x98, metadata !523, metadata !DIExpression()), !dbg !525
  %102 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !525, !srcloc !526
  store i16 %102, i16* %__x98, align 2, !dbg !525
  %103 = load i16, i16* %__x98, align 2, !dbg !525
  store i16 %103, i16* %tmp99, align 2, !dbg !525
  %104 = load i16, i16* %tmp99, align 2, !dbg !525
  %add100 = add i16 %104, 2, !dbg !521
  %105 = inttoptr i16 %add100 to i8*, !dbg !521
  call void @llvm.dbg.declare(metadata i16* %__x101, metadata !527, metadata !DIExpression()), !dbg !529
  %106 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !529, !srcloc !530
  store i16 %106, i16* %__x101, align 2, !dbg !529
  %107 = load i16, i16* %__x101, align 2, !dbg !529
  store i16 %107, i16* %tmp102, align 2, !dbg !529
  %108 = load i16, i16* %tmp102, align 2, !dbg !529
  %add103 = add i16 %108, 2, !dbg !521
  %sub104 = sub i16 9216, %add103, !dbg !521
  %call105 = call zeroext i16 @__fast_hw_crc(i8* %105, i16 zeroext %sub104, i16 zeroext -1), !dbg !521
  store i16 %call105, i16* @tmp_stack_crc, align 2, !dbg !521
  %109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !521
  %110 = bitcast %struct.camel_buffer_t* %109 to i8*, !dbg !521
  %111 = load i16, i16* @tmp_stack_crc, align 2, !dbg !521
  %call106 = call zeroext i16 @__fast_hw_crc(i8* %110, i16 zeroext 298, i16 zeroext %111), !dbg !521
  store i16 %call106, i16* @tmp_stack_buf_crc, align 2, !dbg !521
  %112 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !521
  %113 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !521
  %stack_and_buf_crc107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %113, i32 0, i32 2, !dbg !521
  store i16 %112, i16* %stack_and_buf_crc107, align 2, !dbg !521
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !521
  br label %if.end108

if.end108:                                        ; preds = %if.else95, %if.then82
  br label %do.end109, !dbg !510

do.end109:                                        ; preds = %if.end108
  call void @task_commit_done(), !dbg !531
  %114 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !532
  %globals110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %114, i32 0, i32 1, !dbg !532
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals110, i32 0, i32 6, !dbg !532
  %115 = load i16, i16* %insert_count, align 2, !dbg !532
  %cmp111 = icmp ult i16 %115, 32, !dbg !534
  br i1 %cmp111, label %if.then112, label %if.else223, !dbg !535

if.then112:                                       ; preds = %do.end109
  call void @task_add(), !dbg !536
  br label %do.body113, !dbg !538

do.body113:                                       ; preds = %if.then112
  %116 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !539
  %cmp114 = icmp eq i16 %116, 1, !dbg !539
  br i1 %cmp114, label %if.then115, label %if.else128, !dbg !542

if.then115:                                       ; preds = %do.body113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !543
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !543
  %117 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !543
  %reg_file116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %117, i32 0, i32 0, !dbg !543
  %arraydecay117 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file116, i16 0, i16 0, !dbg !543
  call void @__dump_registers(i16* %arraydecay117), !dbg !543
  call void @llvm.dbg.declare(metadata i16* %__x118, metadata !545, metadata !DIExpression()), !dbg !547
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !547, !srcloc !548
  store i16 %118, i16* %__x118, align 2, !dbg !547
  %119 = load i16, i16* %__x118, align 2, !dbg !547
  store i16 %119, i16* %tmp119, align 2, !dbg !547
  %120 = load i16, i16* %tmp119, align 2, !dbg !547
  %add120 = add i16 %120, 2, !dbg !543
  %121 = inttoptr i16 %add120 to i8*, !dbg !543
  call void @llvm.dbg.declare(metadata i16* %__x121, metadata !549, metadata !DIExpression()), !dbg !551
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !551, !srcloc !552
  store i16 %122, i16* %__x121, align 2, !dbg !551
  %123 = load i16, i16* %__x121, align 2, !dbg !551
  store i16 %123, i16* %tmp122, align 2, !dbg !551
  %124 = load i16, i16* %tmp122, align 2, !dbg !551
  %add123 = add i16 %124, 2, !dbg !543
  %sub124 = sub i16 9216, %add123, !dbg !543
  %call125 = call zeroext i16 @__fast_hw_crc(i8* %121, i16 zeroext %sub124, i16 zeroext -1), !dbg !543
  store i16 %call125, i16* @tmp_stack_crc, align 2, !dbg !543
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !543
  %126 = bitcast %struct.camel_buffer_t* %125 to i8*, !dbg !543
  %127 = load i16, i16* @tmp_stack_crc, align 2, !dbg !543
  %call126 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext 298, i16 zeroext %127), !dbg !543
  store i16 %call126, i16* @tmp_stack_buf_crc, align 2, !dbg !543
  %128 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !543
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !543
  %stack_and_buf_crc127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %129, i32 0, i32 2, !dbg !543
  store i16 %128, i16* %stack_and_buf_crc127, align 2, !dbg !543
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !543
  br label %if.end141, !dbg !543

if.else128:                                       ; preds = %do.body113
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !553
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !553
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !553
  %reg_file129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %130, i32 0, i32 0, !dbg !553
  %arraydecay130 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file129, i16 0, i16 0, !dbg !553
  call void @__dump_registers(i16* %arraydecay130), !dbg !553
  call void @llvm.dbg.declare(metadata i16* %__x131, metadata !555, metadata !DIExpression()), !dbg !557
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !557, !srcloc !558
  store i16 %131, i16* %__x131, align 2, !dbg !557
  %132 = load i16, i16* %__x131, align 2, !dbg !557
  store i16 %132, i16* %tmp132, align 2, !dbg !557
  %133 = load i16, i16* %tmp132, align 2, !dbg !557
  %add133 = add i16 %133, 2, !dbg !553
  %134 = inttoptr i16 %add133 to i8*, !dbg !553
  call void @llvm.dbg.declare(metadata i16* %__x134, metadata !559, metadata !DIExpression()), !dbg !561
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !561, !srcloc !562
  store i16 %135, i16* %__x134, align 2, !dbg !561
  %136 = load i16, i16* %__x134, align 2, !dbg !561
  store i16 %136, i16* %tmp135, align 2, !dbg !561
  %137 = load i16, i16* %tmp135, align 2, !dbg !561
  %add136 = add i16 %137, 2, !dbg !553
  %sub137 = sub i16 9216, %add136, !dbg !553
  %call138 = call zeroext i16 @__fast_hw_crc(i8* %134, i16 zeroext %sub137, i16 zeroext -1), !dbg !553
  store i16 %call138, i16* @tmp_stack_crc, align 2, !dbg !553
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !553
  %139 = bitcast %struct.camel_buffer_t* %138 to i8*, !dbg !553
  %140 = load i16, i16* @tmp_stack_crc, align 2, !dbg !553
  %call139 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext 298, i16 zeroext %140), !dbg !553
  store i16 %call139, i16* @tmp_stack_buf_crc, align 2, !dbg !553
  %141 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !553
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !553
  %stack_and_buf_crc140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %142, i32 0, i32 2, !dbg !553
  store i16 %141, i16* %stack_and_buf_crc140, align 2, !dbg !553
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !553
  br label %if.end141

if.end141:                                        ; preds = %if.else128, %if.then115
  br label %do.end142, !dbg !542

do.end142:                                        ; preds = %if.end141
  call void @task_commit_done(), !dbg !563
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !564
  %globals143 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %143, i32 0, i32 1, !dbg !564
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals143, i32 0, i32 0, !dbg !564
  %144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !566
  %globals144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %144, i32 0, i32 1, !dbg !566
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals144, i32 0, i32 3, !dbg !566
  %145 = load i16, i16* %index1, align 2, !dbg !566
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %145, !dbg !564
  %146 = load i16, i16* %arrayidx, align 2, !dbg !564
  %tobool = icmp ne i16 %146, 0, !dbg !564
  br i1 %tobool, label %land.lhs.true, label %if.end191, !dbg !567

land.lhs.true:                                    ; preds = %do.end142
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !568
  %globals145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 1, !dbg !568
  %filter146 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals145, i32 0, i32 0, !dbg !568
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !569
  %globals147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 1, !dbg !569
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals147, i32 0, i32 4, !dbg !569
  %149 = load i16, i16* %index2, align 2, !dbg !569
  %arrayidx148 = getelementptr inbounds [128 x i16], [128 x i16]* %filter146, i16 0, i16 %149, !dbg !568
  %150 = load i16, i16* %arrayidx148, align 2, !dbg !568
  %tobool149 = icmp ne i16 %150, 0, !dbg !568
  br i1 %tobool149, label %if.then150, label %if.end191, !dbg !570

if.then150:                                       ; preds = %land.lhs.true
  br label %while.cond151, !dbg !571

while.cond151:                                    ; preds = %do.end190, %if.then150
  %151 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !573
  %globals152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %151, i32 0, i32 1, !dbg !573
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals152, i32 0, i32 10, !dbg !573
  %152 = load i8, i8* %success, align 2, !dbg !573
  %tobool153 = trunc i8 %152 to i1, !dbg !573
  %conv = zext i1 %tobool153 to i16, !dbg !573
  %cmp154 = icmp eq i16 %conv, 0, !dbg !574
  br i1 %cmp154, label %land.rhs, label %land.end, !dbg !575

land.rhs:                                         ; preds = %while.cond151
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !576
  %globals156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 1, !dbg !576
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals156, i32 0, i32 5, !dbg !576
  %154 = load i16, i16* %relocation_count, align 2, !dbg !576
  %cmp157 = icmp ult i16 %154, 8, !dbg !577
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond151
  %155 = phi i1 [ false, %while.cond151 ], [ %cmp157, %land.rhs ], !dbg !578
  br i1 %155, label %while.body159, label %while.end, !dbg !571

while.body159:                                    ; preds = %land.end
  call void @task_relocate(), !dbg !579
  br label %do.body160, !dbg !581

do.body160:                                       ; preds = %while.body159
  %156 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !582
  %cmp161 = icmp eq i16 %156, 1, !dbg !582
  br i1 %cmp161, label %if.then163, label %if.else176, !dbg !585

if.then163:                                       ; preds = %do.body160
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !586
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %157 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %reg_file164 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %157, i32 0, i32 0, !dbg !586
  %arraydecay165 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file164, i16 0, i16 0, !dbg !586
  call void @__dump_registers(i16* %arraydecay165), !dbg !586
  call void @llvm.dbg.declare(metadata i16* %__x166, metadata !588, metadata !DIExpression()), !dbg !590
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !590, !srcloc !591
  store i16 %158, i16* %__x166, align 2, !dbg !590
  %159 = load i16, i16* %__x166, align 2, !dbg !590
  store i16 %159, i16* %tmp167, align 2, !dbg !590
  %160 = load i16, i16* %tmp167, align 2, !dbg !590
  %add168 = add i16 %160, 2, !dbg !586
  %161 = inttoptr i16 %add168 to i8*, !dbg !586
  call void @llvm.dbg.declare(metadata i16* %__x169, metadata !592, metadata !DIExpression()), !dbg !594
  %162 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !594, !srcloc !595
  store i16 %162, i16* %__x169, align 2, !dbg !594
  %163 = load i16, i16* %__x169, align 2, !dbg !594
  store i16 %163, i16* %tmp170, align 2, !dbg !594
  %164 = load i16, i16* %tmp170, align 2, !dbg !594
  %add171 = add i16 %164, 2, !dbg !586
  %sub172 = sub i16 9216, %add171, !dbg !586
  %call173 = call zeroext i16 @__fast_hw_crc(i8* %161, i16 zeroext %sub172, i16 zeroext -1), !dbg !586
  store i16 %call173, i16* @tmp_stack_crc, align 2, !dbg !586
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %166 = bitcast %struct.camel_buffer_t* %165 to i8*, !dbg !586
  %167 = load i16, i16* @tmp_stack_crc, align 2, !dbg !586
  %call174 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext 298, i16 zeroext %167), !dbg !586
  store i16 %call174, i16* @tmp_stack_buf_crc, align 2, !dbg !586
  %168 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !586
  %169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !586
  %stack_and_buf_crc175 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %169, i32 0, i32 2, !dbg !586
  store i16 %168, i16* %stack_and_buf_crc175, align 2, !dbg !586
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !586
  br label %if.end189, !dbg !586

if.else176:                                       ; preds = %do.body160
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !596
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !596
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %reg_file177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 0, !dbg !596
  %arraydecay178 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file177, i16 0, i16 0, !dbg !596
  call void @__dump_registers(i16* %arraydecay178), !dbg !596
  call void @llvm.dbg.declare(metadata i16* %__x179, metadata !598, metadata !DIExpression()), !dbg !600
  %171 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !600, !srcloc !601
  store i16 %171, i16* %__x179, align 2, !dbg !600
  %172 = load i16, i16* %__x179, align 2, !dbg !600
  store i16 %172, i16* %tmp180, align 2, !dbg !600
  %173 = load i16, i16* %tmp180, align 2, !dbg !600
  %add181 = add i16 %173, 2, !dbg !596
  %174 = inttoptr i16 %add181 to i8*, !dbg !596
  call void @llvm.dbg.declare(metadata i16* %__x182, metadata !602, metadata !DIExpression()), !dbg !604
  %175 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !604, !srcloc !605
  store i16 %175, i16* %__x182, align 2, !dbg !604
  %176 = load i16, i16* %__x182, align 2, !dbg !604
  store i16 %176, i16* %tmp183, align 2, !dbg !604
  %177 = load i16, i16* %tmp183, align 2, !dbg !604
  %add184 = add i16 %177, 2, !dbg !596
  %sub185 = sub i16 9216, %add184, !dbg !596
  %call186 = call zeroext i16 @__fast_hw_crc(i8* %174, i16 zeroext %sub185, i16 zeroext -1), !dbg !596
  store i16 %call186, i16* @tmp_stack_crc, align 2, !dbg !596
  %178 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %179 = bitcast %struct.camel_buffer_t* %178 to i8*, !dbg !596
  %180 = load i16, i16* @tmp_stack_crc, align 2, !dbg !596
  %call187 = call zeroext i16 @__fast_hw_crc(i8* %179, i16 zeroext 298, i16 zeroext %180), !dbg !596
  store i16 %call187, i16* @tmp_stack_buf_crc, align 2, !dbg !596
  %181 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !596
  %182 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %stack_and_buf_crc188 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %182, i32 0, i32 2, !dbg !596
  store i16 %181, i16* %stack_and_buf_crc188, align 2, !dbg !596
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !596
  br label %if.end189

if.end189:                                        ; preds = %if.else176, %if.then163
  br label %do.end190, !dbg !585

do.end190:                                        ; preds = %if.end189
  call void @task_commit_done(), !dbg !606
  br label %while.cond151, !dbg !571, !llvm.loop !607

while.end:                                        ; preds = %land.end
  br label %if.end191, !dbg !609

if.end191:                                        ; preds = %while.end, %land.lhs.true, %do.end142
  call void @task_insert_done(), !dbg !610
  br label %do.body192, !dbg !611

do.body192:                                       ; preds = %if.end191
  %183 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !612
  %cmp193 = icmp eq i16 %183, 1, !dbg !612
  br i1 %cmp193, label %if.then195, label %if.else208, !dbg !615

if.then195:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !616
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !616
  %184 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %reg_file196 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %184, i32 0, i32 0, !dbg !616
  %arraydecay197 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file196, i16 0, i16 0, !dbg !616
  call void @__dump_registers(i16* %arraydecay197), !dbg !616
  call void @llvm.dbg.declare(metadata i16* %__x198, metadata !618, metadata !DIExpression()), !dbg !620
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !620, !srcloc !621
  store i16 %185, i16* %__x198, align 2, !dbg !620
  %186 = load i16, i16* %__x198, align 2, !dbg !620
  store i16 %186, i16* %tmp199, align 2, !dbg !620
  %187 = load i16, i16* %tmp199, align 2, !dbg !620
  %add200 = add i16 %187, 2, !dbg !616
  %188 = inttoptr i16 %add200 to i8*, !dbg !616
  call void @llvm.dbg.declare(metadata i16* %__x201, metadata !622, metadata !DIExpression()), !dbg !624
  %189 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !624, !srcloc !625
  store i16 %189, i16* %__x201, align 2, !dbg !624
  %190 = load i16, i16* %__x201, align 2, !dbg !624
  store i16 %190, i16* %tmp202, align 2, !dbg !624
  %191 = load i16, i16* %tmp202, align 2, !dbg !624
  %add203 = add i16 %191, 2, !dbg !616
  %sub204 = sub i16 9216, %add203, !dbg !616
  %call205 = call zeroext i16 @__fast_hw_crc(i8* %188, i16 zeroext %sub204, i16 zeroext -1), !dbg !616
  store i16 %call205, i16* @tmp_stack_crc, align 2, !dbg !616
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %193 = bitcast %struct.camel_buffer_t* %192 to i8*, !dbg !616
  %194 = load i16, i16* @tmp_stack_crc, align 2, !dbg !616
  %call206 = call zeroext i16 @__fast_hw_crc(i8* %193, i16 zeroext 298, i16 zeroext %194), !dbg !616
  store i16 %call206, i16* @tmp_stack_buf_crc, align 2, !dbg !616
  %195 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !616
  %196 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !616
  %stack_and_buf_crc207 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %196, i32 0, i32 2, !dbg !616
  store i16 %195, i16* %stack_and_buf_crc207, align 2, !dbg !616
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !616
  br label %if.end221, !dbg !616

if.else208:                                       ; preds = %do.body192
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !626
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !626
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %reg_file209 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %197, i32 0, i32 0, !dbg !626
  %arraydecay210 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file209, i16 0, i16 0, !dbg !626
  call void @__dump_registers(i16* %arraydecay210), !dbg !626
  call void @llvm.dbg.declare(metadata i16* %__x211, metadata !628, metadata !DIExpression()), !dbg !630
  %198 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !630, !srcloc !631
  store i16 %198, i16* %__x211, align 2, !dbg !630
  %199 = load i16, i16* %__x211, align 2, !dbg !630
  store i16 %199, i16* %tmp212, align 2, !dbg !630
  %200 = load i16, i16* %tmp212, align 2, !dbg !630
  %add213 = add i16 %200, 2, !dbg !626
  %201 = inttoptr i16 %add213 to i8*, !dbg !626
  call void @llvm.dbg.declare(metadata i16* %__x214, metadata !632, metadata !DIExpression()), !dbg !634
  %202 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !634, !srcloc !635
  store i16 %202, i16* %__x214, align 2, !dbg !634
  %203 = load i16, i16* %__x214, align 2, !dbg !634
  store i16 %203, i16* %tmp215, align 2, !dbg !634
  %204 = load i16, i16* %tmp215, align 2, !dbg !634
  %add216 = add i16 %204, 2, !dbg !626
  %sub217 = sub i16 9216, %add216, !dbg !626
  %call218 = call zeroext i16 @__fast_hw_crc(i8* %201, i16 zeroext %sub217, i16 zeroext -1), !dbg !626
  store i16 %call218, i16* @tmp_stack_crc, align 2, !dbg !626
  %205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %206 = bitcast %struct.camel_buffer_t* %205 to i8*, !dbg !626
  %207 = load i16, i16* @tmp_stack_crc, align 2, !dbg !626
  %call219 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext 298, i16 zeroext %207), !dbg !626
  store i16 %call219, i16* @tmp_stack_buf_crc, align 2, !dbg !626
  %208 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !626
  %209 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !626
  %stack_and_buf_crc220 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %209, i32 0, i32 2, !dbg !626
  store i16 %208, i16* %stack_and_buf_crc220, align 2, !dbg !626
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !626
  br label %if.end221

if.end221:                                        ; preds = %if.else208, %if.then195
  br label %do.end222, !dbg !615

do.end222:                                        ; preds = %if.end221
  call void @task_commit_done(), !dbg !636
  br label %if.end286, !dbg !637

if.else223:                                       ; preds = %do.end109
  call void @task_lookup_search(), !dbg !638
  br label %do.body224, !dbg !640

do.body224:                                       ; preds = %if.else223
  %210 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !641
  %cmp225 = icmp eq i16 %210, 1, !dbg !641
  br i1 %cmp225, label %if.then227, label %if.else240, !dbg !644

if.then227:                                       ; preds = %do.body224
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !645
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !645
  %211 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %reg_file228 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %211, i32 0, i32 0, !dbg !645
  %arraydecay229 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file228, i16 0, i16 0, !dbg !645
  call void @__dump_registers(i16* %arraydecay229), !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x230, metadata !647, metadata !DIExpression()), !dbg !649
  %212 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !649, !srcloc !650
  store i16 %212, i16* %__x230, align 2, !dbg !649
  %213 = load i16, i16* %__x230, align 2, !dbg !649
  store i16 %213, i16* %tmp231, align 2, !dbg !649
  %214 = load i16, i16* %tmp231, align 2, !dbg !649
  %add232 = add i16 %214, 2, !dbg !645
  %215 = inttoptr i16 %add232 to i8*, !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x233, metadata !651, metadata !DIExpression()), !dbg !653
  %216 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !653, !srcloc !654
  store i16 %216, i16* %__x233, align 2, !dbg !653
  %217 = load i16, i16* %__x233, align 2, !dbg !653
  store i16 %217, i16* %tmp234, align 2, !dbg !653
  %218 = load i16, i16* %tmp234, align 2, !dbg !653
  %add235 = add i16 %218, 2, !dbg !645
  %sub236 = sub i16 9216, %add235, !dbg !645
  %call237 = call zeroext i16 @__fast_hw_crc(i8* %215, i16 zeroext %sub236, i16 zeroext -1), !dbg !645
  store i16 %call237, i16* @tmp_stack_crc, align 2, !dbg !645
  %219 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %220 = bitcast %struct.camel_buffer_t* %219 to i8*, !dbg !645
  %221 = load i16, i16* @tmp_stack_crc, align 2, !dbg !645
  %call238 = call zeroext i16 @__fast_hw_crc(i8* %220, i16 zeroext 298, i16 zeroext %221), !dbg !645
  store i16 %call238, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %222 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %stack_and_buf_crc239 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %223, i32 0, i32 2, !dbg !645
  store i16 %222, i16* %stack_and_buf_crc239, align 2, !dbg !645
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !645
  br label %if.end253, !dbg !645

if.else240:                                       ; preds = %do.body224
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !655
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !655
  %224 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %reg_file241 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %224, i32 0, i32 0, !dbg !655
  %arraydecay242 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file241, i16 0, i16 0, !dbg !655
  call void @__dump_registers(i16* %arraydecay242), !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x243, metadata !657, metadata !DIExpression()), !dbg !659
  %225 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !659, !srcloc !660
  store i16 %225, i16* %__x243, align 2, !dbg !659
  %226 = load i16, i16* %__x243, align 2, !dbg !659
  store i16 %226, i16* %tmp244, align 2, !dbg !659
  %227 = load i16, i16* %tmp244, align 2, !dbg !659
  %add245 = add i16 %227, 2, !dbg !655
  %228 = inttoptr i16 %add245 to i8*, !dbg !655
  call void @llvm.dbg.declare(metadata i16* %__x246, metadata !661, metadata !DIExpression()), !dbg !663
  %229 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !663, !srcloc !664
  store i16 %229, i16* %__x246, align 2, !dbg !663
  %230 = load i16, i16* %__x246, align 2, !dbg !663
  store i16 %230, i16* %tmp247, align 2, !dbg !663
  %231 = load i16, i16* %tmp247, align 2, !dbg !663
  %add248 = add i16 %231, 2, !dbg !655
  %sub249 = sub i16 9216, %add248, !dbg !655
  %call250 = call zeroext i16 @__fast_hw_crc(i8* %228, i16 zeroext %sub249, i16 zeroext -1), !dbg !655
  store i16 %call250, i16* @tmp_stack_crc, align 2, !dbg !655
  %232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %233 = bitcast %struct.camel_buffer_t* %232 to i8*, !dbg !655
  %234 = load i16, i16* @tmp_stack_crc, align 2, !dbg !655
  %call251 = call zeroext i16 @__fast_hw_crc(i8* %233, i16 zeroext 298, i16 zeroext %234), !dbg !655
  store i16 %call251, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %235 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !655
  %236 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !655
  %stack_and_buf_crc252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %236, i32 0, i32 2, !dbg !655
  store i16 %235, i16* %stack_and_buf_crc252, align 2, !dbg !655
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !655
  br label %if.end253

if.end253:                                        ; preds = %if.else240, %if.then227
  br label %do.end254, !dbg !644

do.end254:                                        ; preds = %if.end253
  call void @task_commit_done(), !dbg !665
  call void @task_lookup_done(), !dbg !666
  br label %do.body255, !dbg !667

do.body255:                                       ; preds = %do.end254
  %237 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !668
  %cmp256 = icmp eq i16 %237, 1, !dbg !668
  br i1 %cmp256, label %if.then258, label %if.else271, !dbg !671

if.then258:                                       ; preds = %do.body255
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !672
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !672
  %238 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %reg_file259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %238, i32 0, i32 0, !dbg !672
  %arraydecay260 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file259, i16 0, i16 0, !dbg !672
  call void @__dump_registers(i16* %arraydecay260), !dbg !672
  call void @llvm.dbg.declare(metadata i16* %__x261, metadata !674, metadata !DIExpression()), !dbg !676
  %239 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !676, !srcloc !677
  store i16 %239, i16* %__x261, align 2, !dbg !676
  %240 = load i16, i16* %__x261, align 2, !dbg !676
  store i16 %240, i16* %tmp262, align 2, !dbg !676
  %241 = load i16, i16* %tmp262, align 2, !dbg !676
  %add263 = add i16 %241, 2, !dbg !672
  %242 = inttoptr i16 %add263 to i8*, !dbg !672
  call void @llvm.dbg.declare(metadata i16* %__x264, metadata !678, metadata !DIExpression()), !dbg !680
  %243 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !680, !srcloc !681
  store i16 %243, i16* %__x264, align 2, !dbg !680
  %244 = load i16, i16* %__x264, align 2, !dbg !680
  store i16 %244, i16* %tmp265, align 2, !dbg !680
  %245 = load i16, i16* %tmp265, align 2, !dbg !680
  %add266 = add i16 %245, 2, !dbg !672
  %sub267 = sub i16 9216, %add266, !dbg !672
  %call268 = call zeroext i16 @__fast_hw_crc(i8* %242, i16 zeroext %sub267, i16 zeroext -1), !dbg !672
  store i16 %call268, i16* @tmp_stack_crc, align 2, !dbg !672
  %246 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %247 = bitcast %struct.camel_buffer_t* %246 to i8*, !dbg !672
  %248 = load i16, i16* @tmp_stack_crc, align 2, !dbg !672
  %call269 = call zeroext i16 @__fast_hw_crc(i8* %247, i16 zeroext 298, i16 zeroext %248), !dbg !672
  store i16 %call269, i16* @tmp_stack_buf_crc, align 2, !dbg !672
  %249 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !672
  %250 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !672
  %stack_and_buf_crc270 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %250, i32 0, i32 2, !dbg !672
  store i16 %249, i16* %stack_and_buf_crc270, align 2, !dbg !672
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !672
  br label %if.end284, !dbg !672

if.else271:                                       ; preds = %do.body255
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !682
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !682
  %251 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %reg_file272 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %251, i32 0, i32 0, !dbg !682
  %arraydecay273 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file272, i16 0, i16 0, !dbg !682
  call void @__dump_registers(i16* %arraydecay273), !dbg !682
  call void @llvm.dbg.declare(metadata i16* %__x274, metadata !684, metadata !DIExpression()), !dbg !686
  %252 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !686, !srcloc !687
  store i16 %252, i16* %__x274, align 2, !dbg !686
  %253 = load i16, i16* %__x274, align 2, !dbg !686
  store i16 %253, i16* %tmp275, align 2, !dbg !686
  %254 = load i16, i16* %tmp275, align 2, !dbg !686
  %add276 = add i16 %254, 2, !dbg !682
  %255 = inttoptr i16 %add276 to i8*, !dbg !682
  call void @llvm.dbg.declare(metadata i16* %__x277, metadata !688, metadata !DIExpression()), !dbg !690
  %256 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !690, !srcloc !691
  store i16 %256, i16* %__x277, align 2, !dbg !690
  %257 = load i16, i16* %__x277, align 2, !dbg !690
  store i16 %257, i16* %tmp278, align 2, !dbg !690
  %258 = load i16, i16* %tmp278, align 2, !dbg !690
  %add279 = add i16 %258, 2, !dbg !682
  %sub280 = sub i16 9216, %add279, !dbg !682
  %call281 = call zeroext i16 @__fast_hw_crc(i8* %255, i16 zeroext %sub280, i16 zeroext -1), !dbg !682
  store i16 %call281, i16* @tmp_stack_crc, align 2, !dbg !682
  %259 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %260 = bitcast %struct.camel_buffer_t* %259 to i8*, !dbg !682
  %261 = load i16, i16* @tmp_stack_crc, align 2, !dbg !682
  %call282 = call zeroext i16 @__fast_hw_crc(i8* %260, i16 zeroext 298, i16 zeroext %261), !dbg !682
  store i16 %call282, i16* @tmp_stack_buf_crc, align 2, !dbg !682
  %262 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !682
  %263 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !682
  %stack_and_buf_crc283 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %263, i32 0, i32 2, !dbg !682
  store i16 %262, i16* %stack_and_buf_crc283, align 2, !dbg !682
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !682
  br label %if.end284

if.end284:                                        ; preds = %if.else271, %if.then258
  br label %do.end285, !dbg !671

do.end285:                                        ; preds = %if.end284
  call void @task_commit_done(), !dbg !692
  br label %if.end286

if.end286:                                        ; preds = %do.end285, %do.end222
  br label %while.cond, !dbg !420, !llvm.loop !693

while.end287:                                     ; preds = %while.cond
  call void @task_done(), !dbg !695
  call void @task_commit_done(), !dbg !696
  %264 = load i16, i16* %retval, align 2, !dbg !697
  ret i16 %264, !dbg !697
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !698 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !701, metadata !DIExpression()), !dbg !702
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !703, metadata !DIExpression()), !dbg !704
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !705, metadata !DIExpression()), !dbg !706
  store i16 5381, i16* %hash, align 2, !dbg !706
  call void @llvm.dbg.declare(metadata i16* %i, metadata !707, metadata !DIExpression()), !dbg !708
  store i16 0, i16* %i, align 2, !dbg !709
  br label %for.cond, !dbg !711

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !712
  %1 = load i16, i16* %len.addr, align 2, !dbg !714
  %cmp = icmp ult i16 %0, %1, !dbg !715
  br i1 %cmp, label %for.body, label %for.end, !dbg !716

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !717
  %shl = shl i16 %2, 5, !dbg !718
  %3 = load i16, i16* %hash, align 2, !dbg !719
  %add = add i16 %shl, %3, !dbg !720
  %4 = load i8*, i8** %data.addr, align 2, !dbg !721
  %5 = load i8, i8* %4, align 1, !dbg !722
  %conv = zext i8 %5 to i16, !dbg !723
  %add1 = add i16 %add, %conv, !dbg !724
  store i16 %add1, i16* %hash, align 2, !dbg !725
  br label %for.inc, !dbg !726

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !727
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !727
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !727
  %7 = load i16, i16* %i, align 2, !dbg !728
  %inc = add i16 %7, 1, !dbg !728
  store i16 %inc, i16* %i, align 2, !dbg !728
  br label %for.cond, !dbg !729, !llvm.loop !730

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !732
  ret i16 %8, !dbg !733
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
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 639, type: !26, isLocal: true, isDefinition: true)
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
!113 = !{i32 -2146587117}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 206, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 33)
!116 = !DILocation(line: 206, column: 33, scope: !115)
!117 = !{i32 -2146586881}
!118 = !DILocation(line: 206, column: 51, scope: !92)
!119 = !DILocation(line: 206, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 206, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 65)
!122 = !DILocation(line: 206, column: 65, scope: !121)
!123 = !{i32 -2146586756}
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
!413 = !DILocation(line: 564, column: 5, scope: !405)
!414 = !DILocation(line: 565, column: 14, scope: !405)
!415 = !DILocation(line: 565, column: 20, scope: !405)
!416 = !DILocation(line: 565, column: 5, scope: !405)
!417 = !DILocation(line: 565, column: 32, scope: !405)
!418 = !DILocation(line: 565, column: 40, scope: !405)
!419 = !DILocation(line: 566, column: 5, scope: !405)
!420 = !DILocation(line: 569, column: 3, scope: !405)
!421 = !DILocation(line: 569, column: 9, scope: !405)
!422 = !DILocation(line: 569, column: 27, scope: !405)
!423 = !DILocation(line: 571, column: 9, scope: !424)
!424 = distinct !DILexicalBlock(scope: !405, file: !3, line: 569, column: 42)
!425 = !DILocation(line: 572, column: 9, scope: !424)
!426 = !DILocation(line: 572, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !3, line: 572, column: 9)
!428 = distinct !DILexicalBlock(scope: !424, file: !3, line: 572, column: 9)
!429 = !DILocation(line: 572, column: 9, scope: !428)
!430 = !DILocation(line: 572, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !3, line: 572, column: 9)
!432 = !DILocalVariable(name: "__x", scope: !433, file: !3, line: 572, type: !6)
!433 = distinct !DILexicalBlock(scope: !431, file: !3, line: 572, column: 9)
!434 = !DILocation(line: 572, column: 9, scope: !433)
!435 = !{i32 -2146582613}
!436 = !DILocalVariable(name: "__x", scope: !437, file: !3, line: 572, type: !6)
!437 = distinct !DILexicalBlock(scope: !431, file: !3, line: 572, column: 9)
!438 = !DILocation(line: 572, column: 9, scope: !437)
!439 = !{i32 -2146582488}
!440 = !DILocation(line: 572, column: 9, scope: !441)
!441 = distinct !DILexicalBlock(scope: !427, file: !3, line: 572, column: 9)
!442 = !DILocalVariable(name: "__x", scope: !443, file: !3, line: 572, type: !6)
!443 = distinct !DILexicalBlock(scope: !441, file: !3, line: 572, column: 9)
!444 = !DILocation(line: 572, column: 9, scope: !443)
!445 = !{i32 -2146582356}
!446 = !DILocalVariable(name: "__x", scope: !447, file: !3, line: 572, type: !6)
!447 = distinct !DILexicalBlock(scope: !441, file: !3, line: 572, column: 9)
!448 = !DILocation(line: 572, column: 9, scope: !447)
!449 = !{i32 -2146582231}
!450 = !DILocation(line: 573, column: 9, scope: !424)
!451 = !DILocation(line: 577, column: 9, scope: !424)
!452 = !DILocation(line: 578, column: 9, scope: !424)
!453 = !DILocation(line: 578, column: 9, scope: !454)
!454 = distinct !DILexicalBlock(scope: !455, file: !3, line: 578, column: 9)
!455 = distinct !DILexicalBlock(scope: !424, file: !3, line: 578, column: 9)
!456 = !DILocation(line: 578, column: 9, scope: !455)
!457 = !DILocation(line: 578, column: 9, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !3, line: 578, column: 9)
!459 = !DILocalVariable(name: "__x", scope: !460, file: !3, line: 578, type: !6)
!460 = distinct !DILexicalBlock(scope: !458, file: !3, line: 578, column: 9)
!461 = !DILocation(line: 578, column: 9, scope: !460)
!462 = !{i32 -2146580107}
!463 = !DILocalVariable(name: "__x", scope: !464, file: !3, line: 578, type: !6)
!464 = distinct !DILexicalBlock(scope: !458, file: !3, line: 578, column: 9)
!465 = !DILocation(line: 578, column: 9, scope: !464)
!466 = !{i32 -2146579982}
!467 = !DILocation(line: 578, column: 9, scope: !468)
!468 = distinct !DILexicalBlock(scope: !454, file: !3, line: 578, column: 9)
!469 = !DILocalVariable(name: "__x", scope: !470, file: !3, line: 578, type: !6)
!470 = distinct !DILexicalBlock(scope: !468, file: !3, line: 578, column: 9)
!471 = !DILocation(line: 578, column: 9, scope: !470)
!472 = !{i32 -2146579850}
!473 = !DILocalVariable(name: "__x", scope: !474, file: !3, line: 578, type: !6)
!474 = distinct !DILexicalBlock(scope: !468, file: !3, line: 578, column: 9)
!475 = !DILocation(line: 578, column: 9, scope: !474)
!476 = !{i32 -2146579725}
!477 = !DILocation(line: 579, column: 9, scope: !424)
!478 = !DILocation(line: 583, column: 9, scope: !424)
!479 = !DILocation(line: 584, column: 9, scope: !424)
!480 = !DILocation(line: 584, column: 9, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !3, line: 584, column: 9)
!482 = distinct !DILexicalBlock(scope: !424, file: !3, line: 584, column: 9)
!483 = !DILocation(line: 584, column: 9, scope: !482)
!484 = !DILocation(line: 584, column: 9, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !3, line: 584, column: 9)
!486 = !DILocalVariable(name: "__x", scope: !487, file: !3, line: 584, type: !6)
!487 = distinct !DILexicalBlock(scope: !485, file: !3, line: 584, column: 9)
!488 = !DILocation(line: 584, column: 9, scope: !487)
!489 = !{i32 -2146577601}
!490 = !DILocalVariable(name: "__x", scope: !491, file: !3, line: 584, type: !6)
!491 = distinct !DILexicalBlock(scope: !485, file: !3, line: 584, column: 9)
!492 = !DILocation(line: 584, column: 9, scope: !491)
!493 = !{i32 -2146577476}
!494 = !DILocation(line: 584, column: 9, scope: !495)
!495 = distinct !DILexicalBlock(scope: !481, file: !3, line: 584, column: 9)
!496 = !DILocalVariable(name: "__x", scope: !497, file: !3, line: 584, type: !6)
!497 = distinct !DILexicalBlock(scope: !495, file: !3, line: 584, column: 9)
!498 = !DILocation(line: 584, column: 9, scope: !497)
!499 = !{i32 -2146577344}
!500 = !DILocalVariable(name: "__x", scope: !501, file: !3, line: 584, type: !6)
!501 = distinct !DILexicalBlock(scope: !495, file: !3, line: 584, column: 9)
!502 = !DILocation(line: 584, column: 9, scope: !501)
!503 = !{i32 -2146577219}
!504 = !DILocation(line: 585, column: 9, scope: !424)
!505 = !DILocation(line: 589, column: 9, scope: !424)
!506 = !DILocation(line: 590, column: 9, scope: !424)
!507 = !DILocation(line: 590, column: 9, scope: !508)
!508 = distinct !DILexicalBlock(scope: !509, file: !3, line: 590, column: 9)
!509 = distinct !DILexicalBlock(scope: !424, file: !3, line: 590, column: 9)
!510 = !DILocation(line: 590, column: 9, scope: !509)
!511 = !DILocation(line: 590, column: 9, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !3, line: 590, column: 9)
!513 = !DILocalVariable(name: "__x", scope: !514, file: !3, line: 590, type: !6)
!514 = distinct !DILexicalBlock(scope: !512, file: !3, line: 590, column: 9)
!515 = !DILocation(line: 590, column: 9, scope: !514)
!516 = !{i32 -2146575095}
!517 = !DILocalVariable(name: "__x", scope: !518, file: !3, line: 590, type: !6)
!518 = distinct !DILexicalBlock(scope: !512, file: !3, line: 590, column: 9)
!519 = !DILocation(line: 590, column: 9, scope: !518)
!520 = !{i32 -2146574970}
!521 = !DILocation(line: 590, column: 9, scope: !522)
!522 = distinct !DILexicalBlock(scope: !508, file: !3, line: 590, column: 9)
!523 = !DILocalVariable(name: "__x", scope: !524, file: !3, line: 590, type: !6)
!524 = distinct !DILexicalBlock(scope: !522, file: !3, line: 590, column: 9)
!525 = !DILocation(line: 590, column: 9, scope: !524)
!526 = !{i32 -2146574838}
!527 = !DILocalVariable(name: "__x", scope: !528, file: !3, line: 590, type: !6)
!528 = distinct !DILexicalBlock(scope: !522, file: !3, line: 590, column: 9)
!529 = !DILocation(line: 590, column: 9, scope: !528)
!530 = !{i32 -2146574713}
!531 = !DILocation(line: 591, column: 9, scope: !424)
!532 = !DILocation(line: 594, column: 12, scope: !533)
!533 = distinct !DILexicalBlock(scope: !424, file: !3, line: 594, column: 12)
!534 = !DILocation(line: 594, column: 30, scope: !533)
!535 = !DILocation(line: 594, column: 12, scope: !424)
!536 = !DILocation(line: 596, column: 13, scope: !537)
!537 = distinct !DILexicalBlock(scope: !533, file: !3, line: 594, column: 45)
!538 = !DILocation(line: 597, column: 13, scope: !537)
!539 = !DILocation(line: 597, column: 13, scope: !540)
!540 = distinct !DILexicalBlock(scope: !541, file: !3, line: 597, column: 13)
!541 = distinct !DILexicalBlock(scope: !537, file: !3, line: 597, column: 13)
!542 = !DILocation(line: 597, column: 13, scope: !541)
!543 = !DILocation(line: 597, column: 13, scope: !544)
!544 = distinct !DILexicalBlock(scope: !540, file: !3, line: 597, column: 13)
!545 = !DILocalVariable(name: "__x", scope: !546, file: !3, line: 597, type: !6)
!546 = distinct !DILexicalBlock(scope: !544, file: !3, line: 597, column: 13)
!547 = !DILocation(line: 597, column: 13, scope: !546)
!548 = !{i32 -2146572538}
!549 = !DILocalVariable(name: "__x", scope: !550, file: !3, line: 597, type: !6)
!550 = distinct !DILexicalBlock(scope: !544, file: !3, line: 597, column: 13)
!551 = !DILocation(line: 597, column: 13, scope: !550)
!552 = !{i32 -2146572413}
!553 = !DILocation(line: 597, column: 13, scope: !554)
!554 = distinct !DILexicalBlock(scope: !540, file: !3, line: 597, column: 13)
!555 = !DILocalVariable(name: "__x", scope: !556, file: !3, line: 597, type: !6)
!556 = distinct !DILexicalBlock(scope: !554, file: !3, line: 597, column: 13)
!557 = !DILocation(line: 597, column: 13, scope: !556)
!558 = !{i32 -2146572281}
!559 = !DILocalVariable(name: "__x", scope: !560, file: !3, line: 597, type: !6)
!560 = distinct !DILexicalBlock(scope: !554, file: !3, line: 597, column: 13)
!561 = !DILocation(line: 597, column: 13, scope: !560)
!562 = !{i32 -2146572156}
!563 = !DILocation(line: 598, column: 13, scope: !537)
!564 = !DILocation(line: 601, column: 16, scope: !565)
!565 = distinct !DILexicalBlock(scope: !537, file: !3, line: 601, column: 16)
!566 = !DILocation(line: 601, column: 28, scope: !565)
!567 = !DILocation(line: 601, column: 41, scope: !565)
!568 = !DILocation(line: 601, column: 44, scope: !565)
!569 = !DILocation(line: 601, column: 56, scope: !565)
!570 = !DILocation(line: 601, column: 16, scope: !537)
!571 = !DILocation(line: 602, column: 17, scope: !572)
!572 = distinct !DILexicalBlock(scope: !565, file: !3, line: 601, column: 70)
!573 = !DILocation(line: 602, column: 23, scope: !572)
!574 = !DILocation(line: 602, column: 36, scope: !572)
!575 = !DILocation(line: 602, column: 45, scope: !572)
!576 = !DILocation(line: 602, column: 49, scope: !572)
!577 = !DILocation(line: 602, column: 71, scope: !572)
!578 = !DILocation(line: 0, scope: !572)
!579 = !DILocation(line: 604, column: 21, scope: !580)
!580 = distinct !DILexicalBlock(scope: !572, file: !3, line: 602, column: 91)
!581 = !DILocation(line: 605, column: 21, scope: !580)
!582 = !DILocation(line: 605, column: 21, scope: !583)
!583 = distinct !DILexicalBlock(scope: !584, file: !3, line: 605, column: 21)
!584 = distinct !DILexicalBlock(scope: !580, file: !3, line: 605, column: 21)
!585 = !DILocation(line: 605, column: 21, scope: !584)
!586 = !DILocation(line: 605, column: 21, scope: !587)
!587 = distinct !DILexicalBlock(scope: !583, file: !3, line: 605, column: 21)
!588 = !DILocalVariable(name: "__x", scope: !589, file: !3, line: 605, type: !6)
!589 = distinct !DILexicalBlock(scope: !587, file: !3, line: 605, column: 21)
!590 = !DILocation(line: 605, column: 21, scope: !589)
!591 = !{i32 -2146569879}
!592 = !DILocalVariable(name: "__x", scope: !593, file: !3, line: 605, type: !6)
!593 = distinct !DILexicalBlock(scope: !587, file: !3, line: 605, column: 21)
!594 = !DILocation(line: 605, column: 21, scope: !593)
!595 = !{i32 -2146569754}
!596 = !DILocation(line: 605, column: 21, scope: !597)
!597 = distinct !DILexicalBlock(scope: !583, file: !3, line: 605, column: 21)
!598 = !DILocalVariable(name: "__x", scope: !599, file: !3, line: 605, type: !6)
!599 = distinct !DILexicalBlock(scope: !597, file: !3, line: 605, column: 21)
!600 = !DILocation(line: 605, column: 21, scope: !599)
!601 = !{i32 -2146569622}
!602 = !DILocalVariable(name: "__x", scope: !603, file: !3, line: 605, type: !6)
!603 = distinct !DILexicalBlock(scope: !597, file: !3, line: 605, column: 21)
!604 = !DILocation(line: 605, column: 21, scope: !603)
!605 = !{i32 -2146569497}
!606 = !DILocation(line: 606, column: 21, scope: !580)
!607 = distinct !{!607, !571, !608}
!608 = !DILocation(line: 608, column: 17, scope: !572)
!609 = !DILocation(line: 609, column: 13, scope: !572)
!610 = !DILocation(line: 612, column: 13, scope: !537)
!611 = !DILocation(line: 613, column: 13, scope: !537)
!612 = !DILocation(line: 613, column: 13, scope: !613)
!613 = distinct !DILexicalBlock(scope: !614, file: !3, line: 613, column: 13)
!614 = distinct !DILexicalBlock(scope: !537, file: !3, line: 613, column: 13)
!615 = !DILocation(line: 613, column: 13, scope: !614)
!616 = !DILocation(line: 613, column: 13, scope: !617)
!617 = distinct !DILexicalBlock(scope: !613, file: !3, line: 613, column: 13)
!618 = !DILocalVariable(name: "__x", scope: !619, file: !3, line: 613, type: !6)
!619 = distinct !DILexicalBlock(scope: !617, file: !3, line: 613, column: 13)
!620 = !DILocation(line: 613, column: 13, scope: !619)
!621 = !{i32 -2146567373}
!622 = !DILocalVariable(name: "__x", scope: !623, file: !3, line: 613, type: !6)
!623 = distinct !DILexicalBlock(scope: !617, file: !3, line: 613, column: 13)
!624 = !DILocation(line: 613, column: 13, scope: !623)
!625 = !{i32 -2146567248}
!626 = !DILocation(line: 613, column: 13, scope: !627)
!627 = distinct !DILexicalBlock(scope: !613, file: !3, line: 613, column: 13)
!628 = !DILocalVariable(name: "__x", scope: !629, file: !3, line: 613, type: !6)
!629 = distinct !DILexicalBlock(scope: !627, file: !3, line: 613, column: 13)
!630 = !DILocation(line: 613, column: 13, scope: !629)
!631 = !{i32 -2146567116}
!632 = !DILocalVariable(name: "__x", scope: !633, file: !3, line: 613, type: !6)
!633 = distinct !DILexicalBlock(scope: !627, file: !3, line: 613, column: 13)
!634 = !DILocation(line: 613, column: 13, scope: !633)
!635 = !{i32 -2146566991}
!636 = !DILocation(line: 614, column: 13, scope: !537)
!637 = !DILocation(line: 616, column: 9, scope: !537)
!638 = !DILocation(line: 618, column: 13, scope: !639)
!639 = distinct !DILexicalBlock(scope: !533, file: !3, line: 616, column: 16)
!640 = !DILocation(line: 619, column: 13, scope: !639)
!641 = !DILocation(line: 619, column: 13, scope: !642)
!642 = distinct !DILexicalBlock(scope: !643, file: !3, line: 619, column: 13)
!643 = distinct !DILexicalBlock(scope: !639, file: !3, line: 619, column: 13)
!644 = !DILocation(line: 619, column: 13, scope: !643)
!645 = !DILocation(line: 619, column: 13, scope: !646)
!646 = distinct !DILexicalBlock(scope: !642, file: !3, line: 619, column: 13)
!647 = !DILocalVariable(name: "__x", scope: !648, file: !3, line: 619, type: !6)
!648 = distinct !DILexicalBlock(scope: !646, file: !3, line: 619, column: 13)
!649 = !DILocation(line: 619, column: 13, scope: !648)
!650 = !{i32 -2146564867}
!651 = !DILocalVariable(name: "__x", scope: !652, file: !3, line: 619, type: !6)
!652 = distinct !DILexicalBlock(scope: !646, file: !3, line: 619, column: 13)
!653 = !DILocation(line: 619, column: 13, scope: !652)
!654 = !{i32 -2146564742}
!655 = !DILocation(line: 619, column: 13, scope: !656)
!656 = distinct !DILexicalBlock(scope: !642, file: !3, line: 619, column: 13)
!657 = !DILocalVariable(name: "__x", scope: !658, file: !3, line: 619, type: !6)
!658 = distinct !DILexicalBlock(scope: !656, file: !3, line: 619, column: 13)
!659 = !DILocation(line: 619, column: 13, scope: !658)
!660 = !{i32 -2146564610}
!661 = !DILocalVariable(name: "__x", scope: !662, file: !3, line: 619, type: !6)
!662 = distinct !DILexicalBlock(scope: !656, file: !3, line: 619, column: 13)
!663 = !DILocation(line: 619, column: 13, scope: !662)
!664 = !{i32 -2146564485}
!665 = !DILocation(line: 620, column: 13, scope: !639)
!666 = !DILocation(line: 624, column: 13, scope: !639)
!667 = !DILocation(line: 625, column: 13, scope: !639)
!668 = !DILocation(line: 625, column: 13, scope: !669)
!669 = distinct !DILexicalBlock(scope: !670, file: !3, line: 625, column: 13)
!670 = distinct !DILexicalBlock(scope: !639, file: !3, line: 625, column: 13)
!671 = !DILocation(line: 625, column: 13, scope: !670)
!672 = !DILocation(line: 625, column: 13, scope: !673)
!673 = distinct !DILexicalBlock(scope: !669, file: !3, line: 625, column: 13)
!674 = !DILocalVariable(name: "__x", scope: !675, file: !3, line: 625, type: !6)
!675 = distinct !DILexicalBlock(scope: !673, file: !3, line: 625, column: 13)
!676 = !DILocation(line: 625, column: 13, scope: !675)
!677 = !{i32 -2146562361}
!678 = !DILocalVariable(name: "__x", scope: !679, file: !3, line: 625, type: !6)
!679 = distinct !DILexicalBlock(scope: !673, file: !3, line: 625, column: 13)
!680 = !DILocation(line: 625, column: 13, scope: !679)
!681 = !{i32 -2146562236}
!682 = !DILocation(line: 625, column: 13, scope: !683)
!683 = distinct !DILexicalBlock(scope: !669, file: !3, line: 625, column: 13)
!684 = !DILocalVariable(name: "__x", scope: !685, file: !3, line: 625, type: !6)
!685 = distinct !DILexicalBlock(scope: !683, file: !3, line: 625, column: 13)
!686 = !DILocation(line: 625, column: 13, scope: !685)
!687 = !{i32 -2146562104}
!688 = !DILocalVariable(name: "__x", scope: !689, file: !3, line: 625, type: !6)
!689 = distinct !DILexicalBlock(scope: !683, file: !3, line: 625, column: 13)
!690 = !DILocation(line: 625, column: 13, scope: !689)
!691 = !{i32 -2146561979}
!692 = !DILocation(line: 626, column: 13, scope: !639)
!693 = distinct !{!693, !420, !694}
!694 = !DILocation(line: 629, column: 5, scope: !405)
!695 = !DILocation(line: 631, column: 5, scope: !405)
!696 = !DILocation(line: 632, column: 5, scope: !405)
!697 = !DILocation(line: 634, column: 1, scope: !405)
!698 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 225, type: !699, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!699 = !DISubroutineType(types: !700)
!700 = !{!213, !7, !6}
!701 = !DILocalVariable(name: "data", arg: 1, scope: !698, file: !3, line: 225, type: !7)
!702 = !DILocation(line: 225, column: 33, scope: !698)
!703 = !DILocalVariable(name: "len", arg: 2, scope: !698, file: !3, line: 225, type: !6)
!704 = !DILocation(line: 225, column: 48, scope: !698)
!705 = !DILocalVariable(name: "hash", scope: !698, file: !3, line: 227, type: !18)
!706 = !DILocation(line: 227, column: 14, scope: !698)
!707 = !DILocalVariable(name: "i", scope: !698, file: !3, line: 228, type: !6)
!708 = !DILocation(line: 228, column: 18, scope: !698)
!709 = !DILocation(line: 230, column: 11, scope: !710)
!710 = distinct !DILexicalBlock(scope: !698, file: !3, line: 230, column: 5)
!711 = !DILocation(line: 230, column: 9, scope: !710)
!712 = !DILocation(line: 230, column: 16, scope: !713)
!713 = distinct !DILexicalBlock(scope: !710, file: !3, line: 230, column: 5)
!714 = !DILocation(line: 230, column: 20, scope: !713)
!715 = !DILocation(line: 230, column: 18, scope: !713)
!716 = !DILocation(line: 230, column: 5, scope: !710)
!717 = !DILocation(line: 231, column: 18, scope: !713)
!718 = !DILocation(line: 231, column: 23, scope: !713)
!719 = !DILocation(line: 231, column: 31, scope: !713)
!720 = !DILocation(line: 231, column: 29, scope: !713)
!721 = !DILocation(line: 231, column: 41, scope: !713)
!722 = !DILocation(line: 231, column: 40, scope: !713)
!723 = !DILocation(line: 231, column: 39, scope: !713)
!724 = !DILocation(line: 231, column: 37, scope: !713)
!725 = !DILocation(line: 231, column: 14, scope: !713)
!726 = !DILocation(line: 231, column: 9, scope: !713)
!727 = !DILocation(line: 230, column: 29, scope: !713)
!728 = !DILocation(line: 230, column: 34, scope: !713)
!729 = !DILocation(line: 230, column: 5, scope: !713)
!730 = distinct !{!730, !716, !731}
!731 = !DILocation(line: 231, column: 45, scope: !710)
!732 = !DILocation(line: 234, column: 12, scope: !698)
!733 = !DILocation(line: 234, column: 5, scope: !698)
