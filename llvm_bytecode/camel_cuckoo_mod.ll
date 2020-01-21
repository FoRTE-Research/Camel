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
define dso_local i16 @main() #0 !dbg !403 {
entry:
  %retval = alloca i16, align 2
  %x = alloca i16, align 2
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
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !407
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !408
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !409
  call void @camel_init(), !dbg !410
  call void @llvm.dbg.declare(metadata i16* %x, metadata !411, metadata !DIExpression()), !dbg !412
  store i16 0, i16* %x, align 2, !dbg !412
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !413
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !413
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !413
  %1 = load i16, i16* %x, align 2, !dbg !413
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %1, !dbg !413
  %2 = load i16, i16* %arrayidx, align 2, !dbg !413
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !413
  %filter2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !413
  %4 = load i16, i16* %x, align 2, !dbg !413
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
  br label %while.cond, !dbg !420

while.cond:                                       ; preds = %if.end292, %entry
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !421
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !421
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !421
  %10 = load i16, i16* %lookup_count, align 2, !dbg !421
  %cmp = icmp ult i16 %10, 32, !dbg !422
  br i1 %cmp, label %while.body, label %while.end293, !dbg !420

while.body:                                       ; preds = %while.cond
  %tmp1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp1, i32 0, i32 1
  %global2 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp3 = load i16, i16* %global2, align 2
  %tmp4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global5 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp4, i32 0, i32 1
  %global6 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global5, i32 0, i32 1
  store i16 %tmp3, i16* %global6, align 2
  call void @task_generate_key(), !dbg !423
  br label %do.body, !dbg !425

do.body:                                          ; preds = %while.body
  %11 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !426
  %cmp7 = icmp eq i16 %11, 1, !dbg !426
  br i1 %cmp7, label %if.then, label %if.else, !dbg !429

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !430
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !430
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !430
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !430
  call void @__dump_registers(i16* %arraydecay), !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !432, metadata !DIExpression()), !dbg !434
  %13 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !434, !srcloc !435
  store i16 %13, i16* %__x, align 2, !dbg !434
  %14 = load i16, i16* %__x, align 2, !dbg !434
  store i16 %14, i16* %tmp, align 2, !dbg !434
  %15 = load i16, i16* %tmp, align 2, !dbg !434
  %add = add i16 %15, 2, !dbg !430
  %16 = inttoptr i16 %add to i8*, !dbg !430
  call void @llvm.dbg.declare(metadata i16* %__x8, metadata !436, metadata !DIExpression()), !dbg !438
  %17 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !438, !srcloc !439
  store i16 %17, i16* %__x8, align 2, !dbg !438
  %18 = load i16, i16* %__x8, align 2, !dbg !438
  store i16 %18, i16* %tmp9, align 2, !dbg !438
  %19 = load i16, i16* %tmp9, align 2, !dbg !438
  %add10 = add i16 %19, 2, !dbg !430
  %sub = sub i16 9216, %add10, !dbg !430
  %call = call zeroext i16 @__fast_hw_crc(i8* %16, i16 zeroext %sub, i16 zeroext -1), !dbg !430
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !430
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %21 = bitcast %struct.camel_buffer_t* %20 to i8*, !dbg !430
  %22 = load i16, i16* @tmp_stack_crc, align 2, !dbg !430
  %call11 = call zeroext i16 @__fast_hw_crc(i8* %21, i16 zeroext 298, i16 zeroext %22), !dbg !430
  store i16 %call11, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %23 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !430
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !430
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 2, !dbg !430
  store i16 %23, i16* %stack_and_buf_crc, align 2, !dbg !430
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !430
  br label %if.end, !dbg !430

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !440
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %reg_file12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !440
  %arraydecay13 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file12, i16 0, i16 0, !dbg !440
  call void @__dump_registers(i16* %arraydecay13), !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x14, metadata !442, metadata !DIExpression()), !dbg !444
  %26 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !444, !srcloc !445
  store i16 %26, i16* %__x14, align 2, !dbg !444
  %27 = load i16, i16* %__x14, align 2, !dbg !444
  store i16 %27, i16* %tmp15, align 2, !dbg !444
  %28 = load i16, i16* %tmp15, align 2, !dbg !444
  %add16 = add i16 %28, 2, !dbg !440
  %29 = inttoptr i16 %add16 to i8*, !dbg !440
  call void @llvm.dbg.declare(metadata i16* %__x17, metadata !446, metadata !DIExpression()), !dbg !448
  %30 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !448, !srcloc !449
  store i16 %30, i16* %__x17, align 2, !dbg !448
  %31 = load i16, i16* %__x17, align 2, !dbg !448
  store i16 %31, i16* %tmp18, align 2, !dbg !448
  %32 = load i16, i16* %tmp18, align 2, !dbg !448
  %add19 = add i16 %32, 2, !dbg !440
  %sub20 = sub i16 9216, %add19, !dbg !440
  %call21 = call zeroext i16 @__fast_hw_crc(i8* %29, i16 zeroext %sub20, i16 zeroext -1), !dbg !440
  store i16 %call21, i16* @tmp_stack_crc, align 2, !dbg !440
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %34 = bitcast %struct.camel_buffer_t* %33 to i8*, !dbg !440
  %35 = load i16, i16* @tmp_stack_crc, align 2, !dbg !440
  %call22 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext 298, i16 zeroext %35), !dbg !440
  store i16 %call22, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %36 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !440
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %stack_and_buf_crc23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 2, !dbg !440
  store i16 %36, i16* %stack_and_buf_crc23, align 2, !dbg !440
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !440
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !429

do.end:                                           ; preds = %if.end
  call void @task_calc_indexes(), !dbg !450
  br label %do.body24, !dbg !451

do.body24:                                        ; preds = %do.end
  %38 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !452
  %cmp25 = icmp eq i16 %38, 1, !dbg !452
  br i1 %cmp25, label %if.then26, label %if.else39, !dbg !455

if.then26:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !456
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !456
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !456
  %reg_file27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 0, !dbg !456
  %arraydecay28 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file27, i16 0, i16 0, !dbg !456
  call void @__dump_registers(i16* %arraydecay28), !dbg !456
  call void @llvm.dbg.declare(metadata i16* %__x29, metadata !458, metadata !DIExpression()), !dbg !460
  %40 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !460, !srcloc !461
  store i16 %40, i16* %__x29, align 2, !dbg !460
  %41 = load i16, i16* %__x29, align 2, !dbg !460
  store i16 %41, i16* %tmp30, align 2, !dbg !460
  %42 = load i16, i16* %tmp30, align 2, !dbg !460
  %add31 = add i16 %42, 2, !dbg !456
  %43 = inttoptr i16 %add31 to i8*, !dbg !456
  call void @llvm.dbg.declare(metadata i16* %__x32, metadata !462, metadata !DIExpression()), !dbg !464
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !464, !srcloc !465
  store i16 %44, i16* %__x32, align 2, !dbg !464
  %45 = load i16, i16* %__x32, align 2, !dbg !464
  store i16 %45, i16* %tmp33, align 2, !dbg !464
  %46 = load i16, i16* %tmp33, align 2, !dbg !464
  %add34 = add i16 %46, 2, !dbg !456
  %sub35 = sub i16 9216, %add34, !dbg !456
  %call36 = call zeroext i16 @__fast_hw_crc(i8* %43, i16 zeroext %sub35, i16 zeroext -1), !dbg !456
  store i16 %call36, i16* @tmp_stack_crc, align 2, !dbg !456
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !456
  %48 = bitcast %struct.camel_buffer_t* %47 to i8*, !dbg !456
  %49 = load i16, i16* @tmp_stack_crc, align 2, !dbg !456
  %call37 = call zeroext i16 @__fast_hw_crc(i8* %48, i16 zeroext 298, i16 zeroext %49), !dbg !456
  store i16 %call37, i16* @tmp_stack_buf_crc, align 2, !dbg !456
  %50 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !456
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !456
  %stack_and_buf_crc38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i32 0, i32 2, !dbg !456
  store i16 %50, i16* %stack_and_buf_crc38, align 2, !dbg !456
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !456
  br label %if.end52, !dbg !456

if.else39:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !466
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !466
  %52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !466
  %reg_file40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %52, i32 0, i32 0, !dbg !466
  %arraydecay41 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file40, i16 0, i16 0, !dbg !466
  call void @__dump_registers(i16* %arraydecay41), !dbg !466
  call void @llvm.dbg.declare(metadata i16* %__x42, metadata !468, metadata !DIExpression()), !dbg !470
  %53 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !470, !srcloc !471
  store i16 %53, i16* %__x42, align 2, !dbg !470
  %54 = load i16, i16* %__x42, align 2, !dbg !470
  store i16 %54, i16* %tmp43, align 2, !dbg !470
  %55 = load i16, i16* %tmp43, align 2, !dbg !470
  %add44 = add i16 %55, 2, !dbg !466
  %56 = inttoptr i16 %add44 to i8*, !dbg !466
  call void @llvm.dbg.declare(metadata i16* %__x45, metadata !472, metadata !DIExpression()), !dbg !474
  %57 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !474, !srcloc !475
  store i16 %57, i16* %__x45, align 2, !dbg !474
  %58 = load i16, i16* %__x45, align 2, !dbg !474
  store i16 %58, i16* %tmp46, align 2, !dbg !474
  %59 = load i16, i16* %tmp46, align 2, !dbg !474
  %add47 = add i16 %59, 2, !dbg !466
  %sub48 = sub i16 9216, %add47, !dbg !466
  %call49 = call zeroext i16 @__fast_hw_crc(i8* %56, i16 zeroext %sub48, i16 zeroext -1), !dbg !466
  store i16 %call49, i16* @tmp_stack_crc, align 2, !dbg !466
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !466
  %61 = bitcast %struct.camel_buffer_t* %60 to i8*, !dbg !466
  %62 = load i16, i16* @tmp_stack_crc, align 2, !dbg !466
  %call50 = call zeroext i16 @__fast_hw_crc(i8* %61, i16 zeroext 298, i16 zeroext %62), !dbg !466
  store i16 %call50, i16* @tmp_stack_buf_crc, align 2, !dbg !466
  %63 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !466
  %64 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !466
  %stack_and_buf_crc51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %64, i32 0, i32 2, !dbg !466
  store i16 %63, i16* %stack_and_buf_crc51, align 2, !dbg !466
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !466
  br label %if.end52

if.end52:                                         ; preds = %if.else39, %if.then26
  br label %do.end53, !dbg !455

do.end53:                                         ; preds = %if.end52
  call void @task_calc_indexes_index_1(), !dbg !476
  br label %do.body54, !dbg !477

do.body54:                                        ; preds = %do.end53
  %65 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !478
  %cmp55 = icmp eq i16 %65, 1, !dbg !478
  br i1 %cmp55, label %if.then56, label %if.else69, !dbg !481

if.then56:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !482
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !482
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !482
  %reg_file57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 0, !dbg !482
  %arraydecay58 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file57, i16 0, i16 0, !dbg !482
  call void @__dump_registers(i16* %arraydecay58), !dbg !482
  call void @llvm.dbg.declare(metadata i16* %__x59, metadata !484, metadata !DIExpression()), !dbg !486
  %67 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !486, !srcloc !487
  store i16 %67, i16* %__x59, align 2, !dbg !486
  %68 = load i16, i16* %__x59, align 2, !dbg !486
  store i16 %68, i16* %tmp60, align 2, !dbg !486
  %69 = load i16, i16* %tmp60, align 2, !dbg !486
  %add61 = add i16 %69, 2, !dbg !482
  %70 = inttoptr i16 %add61 to i8*, !dbg !482
  call void @llvm.dbg.declare(metadata i16* %__x62, metadata !488, metadata !DIExpression()), !dbg !490
  %71 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !490, !srcloc !491
  store i16 %71, i16* %__x62, align 2, !dbg !490
  %72 = load i16, i16* %__x62, align 2, !dbg !490
  store i16 %72, i16* %tmp63, align 2, !dbg !490
  %73 = load i16, i16* %tmp63, align 2, !dbg !490
  %add64 = add i16 %73, 2, !dbg !482
  %sub65 = sub i16 9216, %add64, !dbg !482
  %call66 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext %sub65, i16 zeroext -1), !dbg !482
  store i16 %call66, i16* @tmp_stack_crc, align 2, !dbg !482
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !482
  %75 = bitcast %struct.camel_buffer_t* %74 to i8*, !dbg !482
  %76 = load i16, i16* @tmp_stack_crc, align 2, !dbg !482
  %call67 = call zeroext i16 @__fast_hw_crc(i8* %75, i16 zeroext 298, i16 zeroext %76), !dbg !482
  store i16 %call67, i16* @tmp_stack_buf_crc, align 2, !dbg !482
  %77 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !482
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !482
  %stack_and_buf_crc68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 2, !dbg !482
  store i16 %77, i16* %stack_and_buf_crc68, align 2, !dbg !482
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !482
  br label %if.end82, !dbg !482

if.else69:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !492
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !492
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %reg_file70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 0, !dbg !492
  %arraydecay71 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file70, i16 0, i16 0, !dbg !492
  call void @__dump_registers(i16* %arraydecay71), !dbg !492
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !494, metadata !DIExpression()), !dbg !496
  %80 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !496, !srcloc !497
  store i16 %80, i16* %__x72, align 2, !dbg !496
  %81 = load i16, i16* %__x72, align 2, !dbg !496
  store i16 %81, i16* %tmp73, align 2, !dbg !496
  %82 = load i16, i16* %tmp73, align 2, !dbg !496
  %add74 = add i16 %82, 2, !dbg !492
  %83 = inttoptr i16 %add74 to i8*, !dbg !492
  call void @llvm.dbg.declare(metadata i16* %__x75, metadata !498, metadata !DIExpression()), !dbg !500
  %84 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !500, !srcloc !501
  store i16 %84, i16* %__x75, align 2, !dbg !500
  %85 = load i16, i16* %__x75, align 2, !dbg !500
  store i16 %85, i16* %tmp76, align 2, !dbg !500
  %86 = load i16, i16* %tmp76, align 2, !dbg !500
  %add77 = add i16 %86, 2, !dbg !492
  %sub78 = sub i16 9216, %add77, !dbg !492
  %call79 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext %sub78, i16 zeroext -1), !dbg !492
  store i16 %call79, i16* @tmp_stack_crc, align 2, !dbg !492
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %88 = bitcast %struct.camel_buffer_t* %87 to i8*, !dbg !492
  %89 = load i16, i16* @tmp_stack_crc, align 2, !dbg !492
  %call80 = call zeroext i16 @__fast_hw_crc(i8* %88, i16 zeroext 298, i16 zeroext %89), !dbg !492
  store i16 %call80, i16* @tmp_stack_buf_crc, align 2, !dbg !492
  %90 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !492
  %91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %stack_and_buf_crc81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i32 0, i32 2, !dbg !492
  store i16 %90, i16* %stack_and_buf_crc81, align 2, !dbg !492
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !492
  br label %if.end82

if.end82:                                         ; preds = %if.else69, %if.then56
  br label %do.end83, !dbg !481

do.end83:                                         ; preds = %if.end82
  call void @task_calc_indexes_index_2(), !dbg !502
  br label %do.body84, !dbg !503

do.body84:                                        ; preds = %do.end83
  %92 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !504
  %cmp85 = icmp eq i16 %92, 1, !dbg !504
  br i1 %cmp85, label %if.then86, label %if.else99, !dbg !507

if.then86:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !508
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !508
  %93 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %reg_file87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %93, i32 0, i32 0, !dbg !508
  %arraydecay88 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file87, i16 0, i16 0, !dbg !508
  call void @__dump_registers(i16* %arraydecay88), !dbg !508
  call void @llvm.dbg.declare(metadata i16* %__x89, metadata !510, metadata !DIExpression()), !dbg !512
  %94 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !512, !srcloc !513
  store i16 %94, i16* %__x89, align 2, !dbg !512
  %95 = load i16, i16* %__x89, align 2, !dbg !512
  store i16 %95, i16* %tmp90, align 2, !dbg !512
  %96 = load i16, i16* %tmp90, align 2, !dbg !512
  %add91 = add i16 %96, 2, !dbg !508
  %97 = inttoptr i16 %add91 to i8*, !dbg !508
  call void @llvm.dbg.declare(metadata i16* %__x92, metadata !514, metadata !DIExpression()), !dbg !516
  %98 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !516, !srcloc !517
  store i16 %98, i16* %__x92, align 2, !dbg !516
  %99 = load i16, i16* %__x92, align 2, !dbg !516
  store i16 %99, i16* %tmp93, align 2, !dbg !516
  %100 = load i16, i16* %tmp93, align 2, !dbg !516
  %add94 = add i16 %100, 2, !dbg !508
  %sub95 = sub i16 9216, %add94, !dbg !508
  %call96 = call zeroext i16 @__fast_hw_crc(i8* %97, i16 zeroext %sub95, i16 zeroext -1), !dbg !508
  store i16 %call96, i16* @tmp_stack_crc, align 2, !dbg !508
  %101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %102 = bitcast %struct.camel_buffer_t* %101 to i8*, !dbg !508
  %103 = load i16, i16* @tmp_stack_crc, align 2, !dbg !508
  %call97 = call zeroext i16 @__fast_hw_crc(i8* %102, i16 zeroext 298, i16 zeroext %103), !dbg !508
  store i16 %call97, i16* @tmp_stack_buf_crc, align 2, !dbg !508
  %104 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !508
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !508
  %stack_and_buf_crc98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %105, i32 0, i32 2, !dbg !508
  store i16 %104, i16* %stack_and_buf_crc98, align 2, !dbg !508
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !508
  br label %if.end112, !dbg !508

if.else99:                                        ; preds = %do.body84
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !518
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !518
  %106 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %reg_file100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %106, i32 0, i32 0, !dbg !518
  %arraydecay101 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file100, i16 0, i16 0, !dbg !518
  call void @__dump_registers(i16* %arraydecay101), !dbg !518
  call void @llvm.dbg.declare(metadata i16* %__x102, metadata !520, metadata !DIExpression()), !dbg !522
  %107 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !522, !srcloc !523
  store i16 %107, i16* %__x102, align 2, !dbg !522
  %108 = load i16, i16* %__x102, align 2, !dbg !522
  store i16 %108, i16* %tmp103, align 2, !dbg !522
  %109 = load i16, i16* %tmp103, align 2, !dbg !522
  %add104 = add i16 %109, 2, !dbg !518
  %110 = inttoptr i16 %add104 to i8*, !dbg !518
  call void @llvm.dbg.declare(metadata i16* %__x105, metadata !524, metadata !DIExpression()), !dbg !526
  %111 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !526, !srcloc !527
  store i16 %111, i16* %__x105, align 2, !dbg !526
  %112 = load i16, i16* %__x105, align 2, !dbg !526
  store i16 %112, i16* %tmp106, align 2, !dbg !526
  %113 = load i16, i16* %tmp106, align 2, !dbg !526
  %add107 = add i16 %113, 2, !dbg !518
  %sub108 = sub i16 9216, %add107, !dbg !518
  %call109 = call zeroext i16 @__fast_hw_crc(i8* %110, i16 zeroext %sub108, i16 zeroext -1), !dbg !518
  store i16 %call109, i16* @tmp_stack_crc, align 2, !dbg !518
  %114 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %115 = bitcast %struct.camel_buffer_t* %114 to i8*, !dbg !518
  %116 = load i16, i16* @tmp_stack_crc, align 2, !dbg !518
  %call110 = call zeroext i16 @__fast_hw_crc(i8* %115, i16 zeroext 298, i16 zeroext %116), !dbg !518
  store i16 %call110, i16* @tmp_stack_buf_crc, align 2, !dbg !518
  %117 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !518
  %118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %stack_and_buf_crc111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %118, i32 0, i32 2, !dbg !518
  store i16 %117, i16* %stack_and_buf_crc111, align 2, !dbg !518
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !518
  br label %if.end112

if.end112:                                        ; preds = %if.else99, %if.then86
  br label %do.end113, !dbg !507

do.end113:                                        ; preds = %if.end112
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !528
  %globals114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %119, i32 0, i32 1, !dbg !528
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals114, i32 0, i32 6, !dbg !528
  %120 = load i16, i16* %insert_count, align 2, !dbg !528
  %cmp115 = icmp ult i16 %120, 32, !dbg !530
  br i1 %cmp115, label %if.then116, label %if.else229, !dbg !531

if.then116:                                       ; preds = %do.end113
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global8 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i32 0, i32 1
  %global9 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global8, i32 0, i32 0
  %tmp10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global11 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp10, i32 0, i32 1
  %global12 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global11, i32 0, i32 3
  %load = load i16, i16* %global12, align 2
  %access = getelementptr [128 x i16], [128 x i16]* %global9, i16 0, i16 %load
  %tmp13 = load i16, i16* %access, align 2
  %tmp14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global15 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp14, i32 0, i32 1
  %global16 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global15, i32 0, i32 0
  %tmp17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global18 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp17, i32 0, i32 1
  %global19 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global18, i32 0, i32 3
  %load20 = load i16, i16* %global19, align 2
  %access21 = getelementptr [128 x i16], [128 x i16]* %global16, i16 0, i16 %load20
  store i16 %tmp13, i16* %access21, align 2
  %tmp22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global23 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp22, i32 0, i32 1
  %global24 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global23, i32 0, i32 0
  %tmp25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global26 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp25, i32 0, i32 1
  %global27 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global26, i32 0, i32 4
  %load28 = load i16, i16* %global27, align 2
  %access29 = getelementptr [128 x i16], [128 x i16]* %global24, i16 0, i16 %load28
  %tmp31 = load i16, i16* %access29, align 2
  %tmp32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global33 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp32, i32 0, i32 1
  %global34 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global33, i32 0, i32 0
  %tmp35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global36 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp35, i32 0, i32 1
  %global37 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global36, i32 0, i32 4
  %load38 = load i16, i16* %global37, align 2
  %access39 = getelementptr [128 x i16], [128 x i16]* %global34, i16 0, i16 %load38
  store i16 %tmp31, i16* %access39, align 2
  %tmp40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global41 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp40, i32 0, i32 1
  %global42 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global41, i32 0, i32 3
  %tmp44 = load i16, i16* %global42, align 2
  %tmp45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global46 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp45, i32 0, i32 1
  %global47 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global46, i32 0, i32 3
  store i16 %tmp44, i16* %global47, align 2
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global49 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 2
  %tmp51 = load i16, i16* %global50, align 2
  %tmp52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global53 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp52, i32 0, i32 1
  %global54 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global53, i32 0, i32 2
  store i16 %tmp51, i16* %global54, align 2
  call void @task_add(), !dbg !532
  br label %do.body117, !dbg !534

do.body117:                                       ; preds = %if.then116
  %121 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !535
  %cmp118 = icmp eq i16 %121, 1, !dbg !535
  br i1 %cmp118, label %if.then119, label %if.else132, !dbg !538

if.then119:                                       ; preds = %do.body117
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !539
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !539
  %122 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539
  %reg_file120 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %122, i32 0, i32 0, !dbg !539
  %arraydecay121 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file120, i16 0, i16 0, !dbg !539
  call void @__dump_registers(i16* %arraydecay121), !dbg !539
  call void @llvm.dbg.declare(metadata i16* %__x122, metadata !541, metadata !DIExpression()), !dbg !543
  %123 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !543, !srcloc !544
  store i16 %123, i16* %__x122, align 2, !dbg !543
  %124 = load i16, i16* %__x122, align 2, !dbg !543
  store i16 %124, i16* %tmp123, align 2, !dbg !543
  %125 = load i16, i16* %tmp123, align 2, !dbg !543
  %add124 = add i16 %125, 2, !dbg !539
  %126 = inttoptr i16 %add124 to i8*, !dbg !539
  call void @llvm.dbg.declare(metadata i16* %__x125, metadata !545, metadata !DIExpression()), !dbg !547
  %127 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !547, !srcloc !548
  store i16 %127, i16* %__x125, align 2, !dbg !547
  %128 = load i16, i16* %__x125, align 2, !dbg !547
  store i16 %128, i16* %tmp126, align 2, !dbg !547
  %129 = load i16, i16* %tmp126, align 2, !dbg !547
  %add127 = add i16 %129, 2, !dbg !539
  %sub128 = sub i16 9216, %add127, !dbg !539
  %call129 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext %sub128, i16 zeroext -1), !dbg !539
  store i16 %call129, i16* @tmp_stack_crc, align 2, !dbg !539
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539
  %131 = bitcast %struct.camel_buffer_t* %130 to i8*, !dbg !539
  %132 = load i16, i16* @tmp_stack_crc, align 2, !dbg !539
  %call130 = call zeroext i16 @__fast_hw_crc(i8* %131, i16 zeroext 298, i16 zeroext %132), !dbg !539
  store i16 %call130, i16* @tmp_stack_buf_crc, align 2, !dbg !539
  %133 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !539
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539
  %stack_and_buf_crc131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %134, i32 0, i32 2, !dbg !539
  store i16 %133, i16* %stack_and_buf_crc131, align 2, !dbg !539
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !539
  br label %if.end145, !dbg !539

if.else132:                                       ; preds = %do.body117
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !549
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !549
  %135 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !549
  %reg_file133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %135, i32 0, i32 0, !dbg !549
  %arraydecay134 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file133, i16 0, i16 0, !dbg !549
  call void @__dump_registers(i16* %arraydecay134), !dbg !549
  call void @llvm.dbg.declare(metadata i16* %__x135, metadata !551, metadata !DIExpression()), !dbg !553
  %136 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !553, !srcloc !554
  store i16 %136, i16* %__x135, align 2, !dbg !553
  %137 = load i16, i16* %__x135, align 2, !dbg !553
  store i16 %137, i16* %tmp136, align 2, !dbg !553
  %138 = load i16, i16* %tmp136, align 2, !dbg !553
  %add137 = add i16 %138, 2, !dbg !549
  %139 = inttoptr i16 %add137 to i8*, !dbg !549
  call void @llvm.dbg.declare(metadata i16* %__x138, metadata !555, metadata !DIExpression()), !dbg !557
  %140 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !557, !srcloc !558
  store i16 %140, i16* %__x138, align 2, !dbg !557
  %141 = load i16, i16* %__x138, align 2, !dbg !557
  store i16 %141, i16* %tmp139, align 2, !dbg !557
  %142 = load i16, i16* %tmp139, align 2, !dbg !557
  %add140 = add i16 %142, 2, !dbg !549
  %sub141 = sub i16 9216, %add140, !dbg !549
  %call142 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext %sub141, i16 zeroext -1), !dbg !549
  store i16 %call142, i16* @tmp_stack_crc, align 2, !dbg !549
  %143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !549
  %144 = bitcast %struct.camel_buffer_t* %143 to i8*, !dbg !549
  %145 = load i16, i16* @tmp_stack_crc, align 2, !dbg !549
  %call143 = call zeroext i16 @__fast_hw_crc(i8* %144, i16 zeroext 298, i16 zeroext %145), !dbg !549
  store i16 %call143, i16* @tmp_stack_buf_crc, align 2, !dbg !549
  %146 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !549
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !549
  %stack_and_buf_crc144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 2, !dbg !549
  store i16 %146, i16* %stack_and_buf_crc144, align 2, !dbg !549
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !549
  br label %if.end145

if.end145:                                        ; preds = %if.else132, %if.then119
  br label %do.end146, !dbg !538

do.end146:                                        ; preds = %if.end145
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !559
  %globals147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %148, i32 0, i32 1, !dbg !559
  %filter148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals147, i32 0, i32 0, !dbg !559
  %149 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !561
  %globals149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %149, i32 0, i32 1, !dbg !561
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals149, i32 0, i32 3, !dbg !561
  %150 = load i16, i16* %index1, align 2, !dbg !561
  %arrayidx150 = getelementptr inbounds [128 x i16], [128 x i16]* %filter148, i16 0, i16 %150, !dbg !559
  %151 = load i16, i16* %arrayidx150, align 2, !dbg !559
  %tobool = icmp ne i16 %151, 0, !dbg !559
  br i1 %tobool, label %land.lhs.true, label %if.end197, !dbg !562

land.lhs.true:                                    ; preds = %do.end146
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %globals151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 1, !dbg !563
  %filter152 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals151, i32 0, i32 0, !dbg !563
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !564
  %globals153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 1, !dbg !564
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals153, i32 0, i32 4, !dbg !564
  %154 = load i16, i16* %index2, align 2, !dbg !564
  %arrayidx154 = getelementptr inbounds [128 x i16], [128 x i16]* %filter152, i16 0, i16 %154, !dbg !563
  %155 = load i16, i16* %arrayidx154, align 2, !dbg !563
  %tobool155 = icmp ne i16 %155, 0, !dbg !563
  br i1 %tobool155, label %if.then156, label %if.end197, !dbg !565

if.then156:                                       ; preds = %land.lhs.true
  br label %while.cond157, !dbg !566

while.cond157:                                    ; preds = %do.end196, %if.then156
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !568
  %globals158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 1, !dbg !568
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals158, i32 0, i32 10, !dbg !568
  %157 = load i8, i8* %success, align 2, !dbg !568
  %tobool159 = trunc i8 %157 to i1, !dbg !568
  %conv = zext i1 %tobool159 to i16, !dbg !568
  %cmp160 = icmp eq i16 %conv, 0, !dbg !569
  br i1 %cmp160, label %land.rhs, label %land.end, !dbg !570

land.rhs:                                         ; preds = %while.cond157
  %158 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !571
  %globals162 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %158, i32 0, i32 1, !dbg !571
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals162, i32 0, i32 5, !dbg !571
  %159 = load i16, i16* %relocation_count, align 2, !dbg !571
  %cmp163 = icmp ult i16 %159, 8, !dbg !572
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond157
  %160 = phi i1 [ false, %while.cond157 ], [ %cmp163, %land.rhs ], !dbg !573
  br i1 %160, label %while.body165, label %while.end, !dbg !566

while.body165:                                    ; preds = %land.end
  %tmp55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global56 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp55, i32 0, i32 1
  %global57 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global56, i32 0, i32 5
  %tmp58 = load i16, i16* %global57, align 2
  %tmp59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global60 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i32 0, i32 1
  %global61 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global60, i32 0, i32 5
  store i16 %tmp58, i16* %global61, align 2
  %tmp62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global63 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp62, i32 0, i32 1
  %global64 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global63, i32 0, i32 3
  %tmp65 = load i16, i16* %global64, align 2
  %tmp66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global67 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i32 0, i32 1
  %global68 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global67, i32 0, i32 3
  store i16 %tmp65, i16* %global68, align 2
  %tmp69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global70 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp69, i32 0, i32 1
  %global71 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global70, i32 0, i32 2
  %tmp72 = load i16, i16* %global71, align 2
  %tmp74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global75 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp74, i32 0, i32 1
  %global76 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global75, i32 0, i32 2
  store i16 %tmp72, i16* %global76, align 2
  call void @task_relocate(), !dbg !574
  br label %do.body166, !dbg !576

do.body166:                                       ; preds = %while.body165
  %161 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !577
  %cmp167 = icmp eq i16 %161, 1, !dbg !577
  br i1 %cmp167, label %if.then169, label %if.else182, !dbg !580

if.then169:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !581
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !581
  %162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %reg_file170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %162, i32 0, i32 0, !dbg !581
  %arraydecay171 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file170, i16 0, i16 0, !dbg !581
  call void @__dump_registers(i16* %arraydecay171), !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x172, metadata !583, metadata !DIExpression()), !dbg !585
  %163 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !585, !srcloc !586
  store i16 %163, i16* %__x172, align 2, !dbg !585
  %164 = load i16, i16* %__x172, align 2, !dbg !585
  store i16 %164, i16* %tmp173, align 2, !dbg !585
  %165 = load i16, i16* %tmp173, align 2, !dbg !585
  %add174 = add i16 %165, 2, !dbg !581
  %166 = inttoptr i16 %add174 to i8*, !dbg !581
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !587, metadata !DIExpression()), !dbg !589
  %167 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !589, !srcloc !590
  store i16 %167, i16* %__x175, align 2, !dbg !589
  %168 = load i16, i16* %__x175, align 2, !dbg !589
  store i16 %168, i16* %tmp176, align 2, !dbg !589
  %169 = load i16, i16* %tmp176, align 2, !dbg !589
  %add177 = add i16 %169, 2, !dbg !581
  %sub178 = sub i16 9216, %add177, !dbg !581
  %call179 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext %sub178, i16 zeroext -1), !dbg !581
  store i16 %call179, i16* @tmp_stack_crc, align 2, !dbg !581
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %171 = bitcast %struct.camel_buffer_t* %170 to i8*, !dbg !581
  %172 = load i16, i16* @tmp_stack_crc, align 2, !dbg !581
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %171, i16 zeroext 298, i16 zeroext %172), !dbg !581
  store i16 %call180, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %173 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !581
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %stack_and_buf_crc181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %174, i32 0, i32 2, !dbg !581
  store i16 %173, i16* %stack_and_buf_crc181, align 2, !dbg !581
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !581
  br label %if.end195, !dbg !581

if.else182:                                       ; preds = %do.body166
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !591
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !591
  %175 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %reg_file183 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %175, i32 0, i32 0, !dbg !591
  %arraydecay184 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file183, i16 0, i16 0, !dbg !591
  call void @__dump_registers(i16* %arraydecay184), !dbg !591
  call void @llvm.dbg.declare(metadata i16* %__x185, metadata !593, metadata !DIExpression()), !dbg !595
  %176 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !595, !srcloc !596
  store i16 %176, i16* %__x185, align 2, !dbg !595
  %177 = load i16, i16* %__x185, align 2, !dbg !595
  store i16 %177, i16* %tmp186, align 2, !dbg !595
  %178 = load i16, i16* %tmp186, align 2, !dbg !595
  %add187 = add i16 %178, 2, !dbg !591
  %179 = inttoptr i16 %add187 to i8*, !dbg !591
  call void @llvm.dbg.declare(metadata i16* %__x188, metadata !597, metadata !DIExpression()), !dbg !599
  %180 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !599, !srcloc !600
  store i16 %180, i16* %__x188, align 2, !dbg !599
  %181 = load i16, i16* %__x188, align 2, !dbg !599
  store i16 %181, i16* %tmp189, align 2, !dbg !599
  %182 = load i16, i16* %tmp189, align 2, !dbg !599
  %add190 = add i16 %182, 2, !dbg !591
  %sub191 = sub i16 9216, %add190, !dbg !591
  %call192 = call zeroext i16 @__fast_hw_crc(i8* %179, i16 zeroext %sub191, i16 zeroext -1), !dbg !591
  store i16 %call192, i16* @tmp_stack_crc, align 2, !dbg !591
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %184 = bitcast %struct.camel_buffer_t* %183 to i8*, !dbg !591
  %185 = load i16, i16* @tmp_stack_crc, align 2, !dbg !591
  %call193 = call zeroext i16 @__fast_hw_crc(i8* %184, i16 zeroext 298, i16 zeroext %185), !dbg !591
  store i16 %call193, i16* @tmp_stack_buf_crc, align 2, !dbg !591
  %186 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !591
  %187 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %stack_and_buf_crc194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %187, i32 0, i32 2, !dbg !591
  store i16 %186, i16* %stack_and_buf_crc194, align 2, !dbg !591
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !591
  br label %if.end195

if.end195:                                        ; preds = %if.else182, %if.then169
  br label %do.end196, !dbg !580

do.end196:                                        ; preds = %if.end195
  br label %while.cond157, !dbg !566, !llvm.loop !601

while.end:                                        ; preds = %land.end
  br label %if.end197, !dbg !603

if.end197:                                        ; preds = %while.end, %land.lhs.true, %do.end146
  %tmp77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global78 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i32 0, i32 1
  %global79 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global78, i32 0, i32 6
  %tmp80 = load i16, i16* %global79, align 2
  %tmp81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global82 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp81, i32 0, i32 1
  %global83 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global82, i32 0, i32 6
  store i16 %tmp80, i16* %global83, align 2
  %tmp84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global85 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp84, i32 0, i32 1
  %global86 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global85, i32 0, i32 7
  %tmp87 = load i16, i16* %global86, align 2
  %tmp88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global89 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp88, i32 0, i32 1
  %global90 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global89, i32 0, i32 7
  store i16 %tmp87, i16* %global90, align 2
  call void @task_insert_done(), !dbg !604
  br label %do.body198, !dbg !605

do.body198:                                       ; preds = %if.end197
  %188 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !606
  %cmp199 = icmp eq i16 %188, 1, !dbg !606
  br i1 %cmp199, label %if.then201, label %if.else214, !dbg !609

if.then201:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !610
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !610
  %189 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %reg_file202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %189, i32 0, i32 0, !dbg !610
  %arraydecay203 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file202, i16 0, i16 0, !dbg !610
  call void @__dump_registers(i16* %arraydecay203), !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x204, metadata !612, metadata !DIExpression()), !dbg !614
  %190 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !614, !srcloc !615
  store i16 %190, i16* %__x204, align 2, !dbg !614
  %191 = load i16, i16* %__x204, align 2, !dbg !614
  store i16 %191, i16* %tmp205, align 2, !dbg !614
  %192 = load i16, i16* %tmp205, align 2, !dbg !614
  %add206 = add i16 %192, 2, !dbg !610
  %193 = inttoptr i16 %add206 to i8*, !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !616, metadata !DIExpression()), !dbg !618
  %194 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !618, !srcloc !619
  store i16 %194, i16* %__x207, align 2, !dbg !618
  %195 = load i16, i16* %__x207, align 2, !dbg !618
  store i16 %195, i16* %tmp208, align 2, !dbg !618
  %196 = load i16, i16* %tmp208, align 2, !dbg !618
  %add209 = add i16 %196, 2, !dbg !610
  %sub210 = sub i16 9216, %add209, !dbg !610
  %call211 = call zeroext i16 @__fast_hw_crc(i8* %193, i16 zeroext %sub210, i16 zeroext -1), !dbg !610
  store i16 %call211, i16* @tmp_stack_crc, align 2, !dbg !610
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %198 = bitcast %struct.camel_buffer_t* %197 to i8*, !dbg !610
  %199 = load i16, i16* @tmp_stack_crc, align 2, !dbg !610
  %call212 = call zeroext i16 @__fast_hw_crc(i8* %198, i16 zeroext 298, i16 zeroext %199), !dbg !610
  store i16 %call212, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %200 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %stack_and_buf_crc213 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %201, i32 0, i32 2, !dbg !610
  store i16 %200, i16* %stack_and_buf_crc213, align 2, !dbg !610
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !610
  br label %if.end227, !dbg !610

if.else214:                                       ; preds = %do.body198
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !620
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !620
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !620
  %reg_file215 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 0, !dbg !620
  %arraydecay216 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file215, i16 0, i16 0, !dbg !620
  call void @__dump_registers(i16* %arraydecay216), !dbg !620
  call void @llvm.dbg.declare(metadata i16* %__x217, metadata !622, metadata !DIExpression()), !dbg !624
  %203 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !624, !srcloc !625
  store i16 %203, i16* %__x217, align 2, !dbg !624
  %204 = load i16, i16* %__x217, align 2, !dbg !624
  store i16 %204, i16* %tmp218, align 2, !dbg !624
  %205 = load i16, i16* %tmp218, align 2, !dbg !624
  %add219 = add i16 %205, 2, !dbg !620
  %206 = inttoptr i16 %add219 to i8*, !dbg !620
  call void @llvm.dbg.declare(metadata i16* %__x220, metadata !626, metadata !DIExpression()), !dbg !628
  %207 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !628, !srcloc !629
  store i16 %207, i16* %__x220, align 2, !dbg !628
  %208 = load i16, i16* %__x220, align 2, !dbg !628
  store i16 %208, i16* %tmp221, align 2, !dbg !628
  %209 = load i16, i16* %tmp221, align 2, !dbg !628
  %add222 = add i16 %209, 2, !dbg !620
  %sub223 = sub i16 9216, %add222, !dbg !620
  %call224 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext %sub223, i16 zeroext -1), !dbg !620
  store i16 %call224, i16* @tmp_stack_crc, align 2, !dbg !620
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !620
  %211 = bitcast %struct.camel_buffer_t* %210 to i8*, !dbg !620
  %212 = load i16, i16* @tmp_stack_crc, align 2, !dbg !620
  %call225 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext 298, i16 zeroext %212), !dbg !620
  store i16 %call225, i16* @tmp_stack_buf_crc, align 2, !dbg !620
  %213 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !620
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !620
  %stack_and_buf_crc226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 2, !dbg !620
  store i16 %213, i16* %stack_and_buf_crc226, align 2, !dbg !620
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !620
  br label %if.end227

if.end227:                                        ; preds = %if.else214, %if.then201
  br label %do.end228, !dbg !609

do.end228:                                        ; preds = %if.end227
  br label %if.end292, !dbg !630

if.else229:                                       ; preds = %do.end113
  call void @task_lookup_search(), !dbg !631
  br label %do.body230, !dbg !633

do.body230:                                       ; preds = %if.else229
  %215 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !634
  %cmp231 = icmp eq i16 %215, 1, !dbg !634
  br i1 %cmp231, label %if.then233, label %if.else246, !dbg !637

if.then233:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !638
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !638
  %216 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !638
  %reg_file234 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %216, i32 0, i32 0, !dbg !638
  %arraydecay235 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file234, i16 0, i16 0, !dbg !638
  call void @__dump_registers(i16* %arraydecay235), !dbg !638
  call void @llvm.dbg.declare(metadata i16* %__x236, metadata !640, metadata !DIExpression()), !dbg !642
  %217 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !642, !srcloc !643
  store i16 %217, i16* %__x236, align 2, !dbg !642
  %218 = load i16, i16* %__x236, align 2, !dbg !642
  store i16 %218, i16* %tmp237, align 2, !dbg !642
  %219 = load i16, i16* %tmp237, align 2, !dbg !642
  %add238 = add i16 %219, 2, !dbg !638
  %220 = inttoptr i16 %add238 to i8*, !dbg !638
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !644, metadata !DIExpression()), !dbg !646
  %221 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !646, !srcloc !647
  store i16 %221, i16* %__x239, align 2, !dbg !646
  %222 = load i16, i16* %__x239, align 2, !dbg !646
  store i16 %222, i16* %tmp240, align 2, !dbg !646
  %223 = load i16, i16* %tmp240, align 2, !dbg !646
  %add241 = add i16 %223, 2, !dbg !638
  %sub242 = sub i16 9216, %add241, !dbg !638
  %call243 = call zeroext i16 @__fast_hw_crc(i8* %220, i16 zeroext %sub242, i16 zeroext -1), !dbg !638
  store i16 %call243, i16* @tmp_stack_crc, align 2, !dbg !638
  %224 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !638
  %225 = bitcast %struct.camel_buffer_t* %224 to i8*, !dbg !638
  %226 = load i16, i16* @tmp_stack_crc, align 2, !dbg !638
  %call244 = call zeroext i16 @__fast_hw_crc(i8* %225, i16 zeroext 298, i16 zeroext %226), !dbg !638
  store i16 %call244, i16* @tmp_stack_buf_crc, align 2, !dbg !638
  %227 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !638
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !638
  %stack_and_buf_crc245 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 2, !dbg !638
  store i16 %227, i16* %stack_and_buf_crc245, align 2, !dbg !638
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !638
  br label %if.end259, !dbg !638

if.else246:                                       ; preds = %do.body230
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !648
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %reg_file247 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %229, i32 0, i32 0, !dbg !648
  %arraydecay248 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file247, i16 0, i16 0, !dbg !648
  call void @__dump_registers(i16* %arraydecay248), !dbg !648
  call void @llvm.dbg.declare(metadata i16* %__x249, metadata !650, metadata !DIExpression()), !dbg !652
  %230 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !652, !srcloc !653
  store i16 %230, i16* %__x249, align 2, !dbg !652
  %231 = load i16, i16* %__x249, align 2, !dbg !652
  store i16 %231, i16* %tmp250, align 2, !dbg !652
  %232 = load i16, i16* %tmp250, align 2, !dbg !652
  %add251 = add i16 %232, 2, !dbg !648
  %233 = inttoptr i16 %add251 to i8*, !dbg !648
  call void @llvm.dbg.declare(metadata i16* %__x252, metadata !654, metadata !DIExpression()), !dbg !656
  %234 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !656, !srcloc !657
  store i16 %234, i16* %__x252, align 2, !dbg !656
  %235 = load i16, i16* %__x252, align 2, !dbg !656
  store i16 %235, i16* %tmp253, align 2, !dbg !656
  %236 = load i16, i16* %tmp253, align 2, !dbg !656
  %add254 = add i16 %236, 2, !dbg !648
  %sub255 = sub i16 9216, %add254, !dbg !648
  %call256 = call zeroext i16 @__fast_hw_crc(i8* %233, i16 zeroext %sub255, i16 zeroext -1), !dbg !648
  store i16 %call256, i16* @tmp_stack_crc, align 2, !dbg !648
  %237 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %238 = bitcast %struct.camel_buffer_t* %237 to i8*, !dbg !648
  %239 = load i16, i16* @tmp_stack_crc, align 2, !dbg !648
  %call257 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext 298, i16 zeroext %239), !dbg !648
  store i16 %call257, i16* @tmp_stack_buf_crc, align 2, !dbg !648
  %240 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !648
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !648
  %stack_and_buf_crc258 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %241, i32 0, i32 2, !dbg !648
  store i16 %240, i16* %stack_and_buf_crc258, align 2, !dbg !648
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !648
  br label %if.end259

if.end259:                                        ; preds = %if.else246, %if.then233
  br label %do.end260, !dbg !637

do.end260:                                        ; preds = %if.end259
  %tmp91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global92 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp91, i32 0, i32 1
  %global93 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global92, i32 0, i32 8
  %tmp94 = load i16, i16* %global93, align 2
  %tmp95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global96 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp95, i32 0, i32 1
  %global97 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global96, i32 0, i32 8
  store i16 %tmp94, i16* %global97, align 2
  %tmp98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global99 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp98, i32 0, i32 1
  %global100 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global99, i32 0, i32 9
  %tmp101 = load i16, i16* %global100, align 2
  %tmp102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global103 = getelementptr %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp102, i32 0, i32 1
  %global104 = getelementptr %struct.camel_global_t, %struct.camel_global_t* %global103, i32 0, i32 9
  store i16 %tmp101, i16* %global104, align 2
  call void @task_lookup_done(), !dbg !658
  br label %do.body261, !dbg !659

do.body261:                                       ; preds = %do.end260
  %242 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !660
  %cmp262 = icmp eq i16 %242, 1, !dbg !660
  br i1 %cmp262, label %if.then264, label %if.else277, !dbg !663

if.then264:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !664
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %243 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %reg_file265 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %243, i32 0, i32 0, !dbg !664
  %arraydecay266 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file265, i16 0, i16 0, !dbg !664
  call void @__dump_registers(i16* %arraydecay266), !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x267, metadata !666, metadata !DIExpression()), !dbg !668
  %244 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !668, !srcloc !669
  store i16 %244, i16* %__x267, align 2, !dbg !668
  %245 = load i16, i16* %__x267, align 2, !dbg !668
  store i16 %245, i16* %tmp268, align 2, !dbg !668
  %246 = load i16, i16* %tmp268, align 2, !dbg !668
  %add269 = add i16 %246, 2, !dbg !664
  %247 = inttoptr i16 %add269 to i8*, !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x270, metadata !670, metadata !DIExpression()), !dbg !672
  %248 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !672, !srcloc !673
  store i16 %248, i16* %__x270, align 2, !dbg !672
  %249 = load i16, i16* %__x270, align 2, !dbg !672
  store i16 %249, i16* %tmp271, align 2, !dbg !672
  %250 = load i16, i16* %tmp271, align 2, !dbg !672
  %add272 = add i16 %250, 2, !dbg !664
  %sub273 = sub i16 9216, %add272, !dbg !664
  %call274 = call zeroext i16 @__fast_hw_crc(i8* %247, i16 zeroext %sub273, i16 zeroext -1), !dbg !664
  store i16 %call274, i16* @tmp_stack_crc, align 2, !dbg !664
  %251 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %252 = bitcast %struct.camel_buffer_t* %251 to i8*, !dbg !664
  %253 = load i16, i16* @tmp_stack_crc, align 2, !dbg !664
  %call275 = call zeroext i16 @__fast_hw_crc(i8* %252, i16 zeroext 298, i16 zeroext %253), !dbg !664
  store i16 %call275, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %254 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %stack_and_buf_crc276 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %255, i32 0, i32 2, !dbg !664
  store i16 %254, i16* %stack_and_buf_crc276, align 2, !dbg !664
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !664
  br label %if.end290, !dbg !664

if.else277:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !674
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %256 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %reg_file278 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %256, i32 0, i32 0, !dbg !674
  %arraydecay279 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file278, i16 0, i16 0, !dbg !674
  call void @__dump_registers(i16* %arraydecay279), !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x280, metadata !676, metadata !DIExpression()), !dbg !678
  %257 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !678, !srcloc !679
  store i16 %257, i16* %__x280, align 2, !dbg !678
  %258 = load i16, i16* %__x280, align 2, !dbg !678
  store i16 %258, i16* %tmp281, align 2, !dbg !678
  %259 = load i16, i16* %tmp281, align 2, !dbg !678
  %add282 = add i16 %259, 2, !dbg !674
  %260 = inttoptr i16 %add282 to i8*, !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x283, metadata !680, metadata !DIExpression()), !dbg !682
  %261 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !682, !srcloc !683
  store i16 %261, i16* %__x283, align 2, !dbg !682
  %262 = load i16, i16* %__x283, align 2, !dbg !682
  store i16 %262, i16* %tmp284, align 2, !dbg !682
  %263 = load i16, i16* %tmp284, align 2, !dbg !682
  %add285 = add i16 %263, 2, !dbg !674
  %sub286 = sub i16 9216, %add285, !dbg !674
  %call287 = call zeroext i16 @__fast_hw_crc(i8* %260, i16 zeroext %sub286, i16 zeroext -1), !dbg !674
  store i16 %call287, i16* @tmp_stack_crc, align 2, !dbg !674
  %264 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %265 = bitcast %struct.camel_buffer_t* %264 to i8*, !dbg !674
  %266 = load i16, i16* @tmp_stack_crc, align 2, !dbg !674
  %call288 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext 298, i16 zeroext %266), !dbg !674
  store i16 %call288, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %267 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %stack_and_buf_crc289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %268, i32 0, i32 2, !dbg !674
  store i16 %267, i16* %stack_and_buf_crc289, align 2, !dbg !674
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !674
  br label %if.end290

if.end290:                                        ; preds = %if.else277, %if.then264
  br label %do.end291, !dbg !663

do.end291:                                        ; preds = %if.end290
  br label %if.end292

if.end292:                                        ; preds = %do.end291, %do.end228
  br label %while.cond, !dbg !420, !llvm.loop !684

while.end293:                                     ; preds = %while.cond
  call void @task_done(), !dbg !686
  %269 = load i16, i16* %retval, align 2, !dbg !687
  ret i16 %269, !dbg !687
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !688 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !691, metadata !DIExpression()), !dbg !692
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !693, metadata !DIExpression()), !dbg !694
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !695, metadata !DIExpression()), !dbg !696
  store i16 5381, i16* %hash, align 2, !dbg !696
  call void @llvm.dbg.declare(metadata i16* %i, metadata !697, metadata !DIExpression()), !dbg !698
  store i16 0, i16* %i, align 2, !dbg !699
  br label %for.cond, !dbg !701

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !702
  %1 = load i16, i16* %len.addr, align 2, !dbg !704
  %cmp = icmp ult i16 %0, %1, !dbg !705
  br i1 %cmp, label %for.body, label %for.end, !dbg !706

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !707
  %shl = shl i16 %2, 5, !dbg !708
  %3 = load i16, i16* %hash, align 2, !dbg !709
  %add = add i16 %shl, %3, !dbg !710
  %4 = load i8*, i8** %data.addr, align 2, !dbg !711
  %5 = load i8, i8* %4, align 1, !dbg !712
  %conv = zext i8 %5 to i16, !dbg !713
  %add1 = add i16 %add, %conv, !dbg !714
  store i16 %add1, i16* %hash, align 2, !dbg !715
  br label %for.inc, !dbg !716

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !717
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !717
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !717
  %7 = load i16, i16* %i, align 2, !dbg !718
  %inc = add i16 %7, 1, !dbg !718
  store i16 %inc, i16* %i, align 2, !dbg !718
  br label %for.cond, !dbg !719, !llvm.loop !720

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !722
  ret i16 %8, !dbg !723
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
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 620, type: !26, isLocal: true, isDefinition: true)
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
!113 = !{i32 -2146587509}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 203, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 33)
!116 = !DILocation(line: 203, column: 33, scope: !115)
!117 = !{i32 -2146587273}
!118 = !DILocation(line: 203, column: 51, scope: !92)
!119 = !DILocation(line: 203, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 203, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 203, column: 65)
!122 = !DILocation(line: 203, column: 65, scope: !121)
!123 = !{i32 -2146587148}
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
!307 = !DILocation(line: 431, column: 14, scope: !308)
!308 = distinct !DILexicalBlock(scope: !292, file: !3, line: 431, column: 13)
!309 = !DILocation(line: 431, column: 25, scope: !308)
!310 = !DILocation(line: 431, column: 13, scope: !292)
!311 = !DILocation(line: 432, column: 13, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 431, column: 41)
!313 = !DILocation(line: 432, column: 25, scope: !312)
!314 = !DILocation(line: 433, column: 41, scope: !312)
!315 = !DILocation(line: 433, column: 13, scope: !312)
!316 = !DILocation(line: 433, column: 24, scope: !312)
!317 = !DILocation(line: 433, column: 39, scope: !312)
!318 = !DILocation(line: 434, column: 13, scope: !312)
!319 = !DILocation(line: 438, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !292, file: !3, line: 438, column: 13)
!321 = !DILocation(line: 438, column: 34, scope: !320)
!322 = !DILocation(line: 438, column: 13, scope: !292)
!323 = !DILocation(line: 439, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !3, line: 438, column: 54)
!325 = !DILocation(line: 439, column: 25, scope: !324)
!326 = !DILocation(line: 440, column: 13, scope: !324)
!327 = !DILocation(line: 443, column: 11, scope: !292)
!328 = !DILocation(line: 443, column: 9, scope: !292)
!329 = !DILocation(line: 444, column: 22, scope: !292)
!330 = !DILocation(line: 444, column: 9, scope: !292)
!331 = !DILocation(line: 444, column: 20, scope: !292)
!332 = !DILocation(line: 445, column: 27, scope: !292)
!333 = !DILocation(line: 445, column: 38, scope: !292)
!334 = !DILocation(line: 445, column: 9, scope: !292)
!335 = !DILocation(line: 445, column: 25, scope: !292)
!336 = !DILocation(line: 446, column: 37, scope: !292)
!337 = !DILocation(line: 446, column: 9, scope: !292)
!338 = !DILocation(line: 446, column: 20, scope: !292)
!339 = !DILocation(line: 446, column: 35, scope: !292)
!340 = !DILocation(line: 447, column: 1, scope: !292)
!341 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 465, type: !27, scopeLine: 466, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DILocation(line: 467, column: 7, scope: !341)
!343 = !DILocation(line: 467, column: 5, scope: !341)
!344 = !DILocation(line: 468, column: 27, scope: !341)
!345 = !DILocation(line: 468, column: 5, scope: !341)
!346 = !DILocation(line: 468, column: 24, scope: !341)
!347 = !DILocation(line: 470, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !3, line: 470, column: 9)
!349 = !DILocation(line: 470, column: 26, scope: !348)
!350 = !DILocation(line: 470, column: 9, scope: !341)
!351 = !DILocation(line: 471, column: 5, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 470, column: 41)
!353 = !DILocation(line: 472, column: 9, scope: !354)
!354 = distinct !DILexicalBlock(scope: !348, file: !3, line: 471, column: 12)
!355 = !DILocation(line: 472, column: 17, scope: !354)
!356 = !DILocation(line: 474, column: 1, scope: !341)
!357 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 492, type: !27, scopeLine: 493, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocation(line: 494, column: 9, scope: !359)
!359 = distinct !DILexicalBlock(scope: !357, file: !3, line: 494, column: 9)
!360 = !DILocation(line: 494, column: 20, scope: !359)
!361 = !DILocation(line: 494, column: 35, scope: !359)
!362 = !DILocation(line: 494, column: 32, scope: !359)
!363 = !DILocation(line: 494, column: 9, scope: !357)
!364 = !DILocation(line: 495, column: 9, scope: !365)
!365 = distinct !DILexicalBlock(scope: !359, file: !3, line: 494, column: 52)
!366 = !DILocation(line: 495, column: 20, scope: !365)
!367 = !DILocation(line: 496, column: 5, scope: !365)
!368 = !DILocation(line: 497, column: 13, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !3, line: 497, column: 13)
!370 = distinct !DILexicalBlock(scope: !359, file: !3, line: 496, column: 12)
!371 = !DILocation(line: 497, column: 24, scope: !369)
!372 = !DILocation(line: 497, column: 39, scope: !369)
!373 = !DILocation(line: 497, column: 36, scope: !369)
!374 = !DILocation(line: 497, column: 13, scope: !370)
!375 = !DILocation(line: 498, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !3, line: 497, column: 56)
!377 = !DILocation(line: 498, column: 24, scope: !376)
!378 = !DILocation(line: 499, column: 9, scope: !376)
!379 = !DILocation(line: 501, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !369, file: !3, line: 500, column: 14)
!381 = !DILocation(line: 501, column: 24, scope: !380)
!382 = !DILocation(line: 505, column: 10, scope: !383)
!383 = distinct !DILexicalBlock(scope: !357, file: !3, line: 505, column: 9)
!384 = !DILocation(line: 505, column: 9, scope: !357)
!385 = !DILocation(line: 506, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !3, line: 505, column: 22)
!387 = !DILocation(line: 507, column: 1, scope: !357)
!388 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 525, type: !27, scopeLine: 526, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 527, column: 7, scope: !388)
!390 = !DILocation(line: 527, column: 5, scope: !388)
!391 = !DILocation(line: 529, column: 25, scope: !388)
!392 = !DILocation(line: 529, column: 5, scope: !388)
!393 = !DILocation(line: 529, column: 22, scope: !388)
!394 = !DILocation(line: 531, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !388, file: !3, line: 531, column: 9)
!396 = !DILocation(line: 531, column: 26, scope: !395)
!397 = !DILocation(line: 531, column: 9, scope: !388)
!398 = !DILocation(line: 532, column: 5, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 531, column: 41)
!400 = !DILocation(line: 534, column: 1, scope: !388)
!401 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 536, type: !27, scopeLine: 537, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!402 = !DILocation(line: 538, column: 5, scope: !401)
!403 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 541, type: !404, scopeLine: 541, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!404 = !DISubroutineType(types: !405)
!405 = !{!406}
!406 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!407 = !DILocation(line: 543, column: 16, scope: !403)
!408 = !DILocation(line: 544, column: 10, scope: !403)
!409 = !DILocation(line: 545, column: 12, scope: !403)
!410 = !DILocation(line: 546, column: 5, scope: !403)
!411 = !DILocalVariable(name: "x", scope: !403, file: !3, line: 552, type: !406)
!412 = !DILocation(line: 552, column: 9, scope: !403)
!413 = !DILocation(line: 553, column: 5, scope: !403)
!414 = !DILocation(line: 557, column: 5, scope: !403)
!415 = !DILocation(line: 558, column: 14, scope: !403)
!416 = !DILocation(line: 558, column: 20, scope: !403)
!417 = !DILocation(line: 558, column: 5, scope: !403)
!418 = !DILocation(line: 558, column: 32, scope: !403)
!419 = !DILocation(line: 558, column: 40, scope: !403)
!420 = !DILocation(line: 561, column: 3, scope: !403)
!421 = !DILocation(line: 561, column: 9, scope: !403)
!422 = !DILocation(line: 561, column: 27, scope: !403)
!423 = !DILocation(line: 563, column: 9, scope: !424)
!424 = distinct !DILexicalBlock(scope: !403, file: !3, line: 561, column: 42)
!425 = !DILocation(line: 564, column: 9, scope: !424)
!426 = !DILocation(line: 564, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !428, file: !3, line: 564, column: 9)
!428 = distinct !DILexicalBlock(scope: !424, file: !3, line: 564, column: 9)
!429 = !DILocation(line: 564, column: 9, scope: !428)
!430 = !DILocation(line: 564, column: 9, scope: !431)
!431 = distinct !DILexicalBlock(scope: !427, file: !3, line: 564, column: 9)
!432 = !DILocalVariable(name: "__x", scope: !433, file: !3, line: 564, type: !6)
!433 = distinct !DILexicalBlock(scope: !431, file: !3, line: 564, column: 9)
!434 = !DILocation(line: 564, column: 9, scope: !433)
!435 = !{i32 -2146582945}
!436 = !DILocalVariable(name: "__x", scope: !437, file: !3, line: 564, type: !6)
!437 = distinct !DILexicalBlock(scope: !431, file: !3, line: 564, column: 9)
!438 = !DILocation(line: 564, column: 9, scope: !437)
!439 = !{i32 -2146582820}
!440 = !DILocation(line: 564, column: 9, scope: !441)
!441 = distinct !DILexicalBlock(scope: !427, file: !3, line: 564, column: 9)
!442 = !DILocalVariable(name: "__x", scope: !443, file: !3, line: 564, type: !6)
!443 = distinct !DILexicalBlock(scope: !441, file: !3, line: 564, column: 9)
!444 = !DILocation(line: 564, column: 9, scope: !443)
!445 = !{i32 -2146582688}
!446 = !DILocalVariable(name: "__x", scope: !447, file: !3, line: 564, type: !6)
!447 = distinct !DILexicalBlock(scope: !441, file: !3, line: 564, column: 9)
!448 = !DILocation(line: 564, column: 9, scope: !447)
!449 = !{i32 -2146582563}
!450 = !DILocation(line: 568, column: 9, scope: !424)
!451 = !DILocation(line: 569, column: 9, scope: !424)
!452 = !DILocation(line: 569, column: 9, scope: !453)
!453 = distinct !DILexicalBlock(scope: !454, file: !3, line: 569, column: 9)
!454 = distinct !DILexicalBlock(scope: !424, file: !3, line: 569, column: 9)
!455 = !DILocation(line: 569, column: 9, scope: !454)
!456 = !DILocation(line: 569, column: 9, scope: !457)
!457 = distinct !DILexicalBlock(scope: !453, file: !3, line: 569, column: 9)
!458 = !DILocalVariable(name: "__x", scope: !459, file: !3, line: 569, type: !6)
!459 = distinct !DILexicalBlock(scope: !457, file: !3, line: 569, column: 9)
!460 = !DILocation(line: 569, column: 9, scope: !459)
!461 = !{i32 -2146580439}
!462 = !DILocalVariable(name: "__x", scope: !463, file: !3, line: 569, type: !6)
!463 = distinct !DILexicalBlock(scope: !457, file: !3, line: 569, column: 9)
!464 = !DILocation(line: 569, column: 9, scope: !463)
!465 = !{i32 -2146580314}
!466 = !DILocation(line: 569, column: 9, scope: !467)
!467 = distinct !DILexicalBlock(scope: !453, file: !3, line: 569, column: 9)
!468 = !DILocalVariable(name: "__x", scope: !469, file: !3, line: 569, type: !6)
!469 = distinct !DILexicalBlock(scope: !467, file: !3, line: 569, column: 9)
!470 = !DILocation(line: 569, column: 9, scope: !469)
!471 = !{i32 -2146580182}
!472 = !DILocalVariable(name: "__x", scope: !473, file: !3, line: 569, type: !6)
!473 = distinct !DILexicalBlock(scope: !467, file: !3, line: 569, column: 9)
!474 = !DILocation(line: 569, column: 9, scope: !473)
!475 = !{i32 -2146580057}
!476 = !DILocation(line: 573, column: 9, scope: !424)
!477 = !DILocation(line: 574, column: 9, scope: !424)
!478 = !DILocation(line: 574, column: 9, scope: !479)
!479 = distinct !DILexicalBlock(scope: !480, file: !3, line: 574, column: 9)
!480 = distinct !DILexicalBlock(scope: !424, file: !3, line: 574, column: 9)
!481 = !DILocation(line: 574, column: 9, scope: !480)
!482 = !DILocation(line: 574, column: 9, scope: !483)
!483 = distinct !DILexicalBlock(scope: !479, file: !3, line: 574, column: 9)
!484 = !DILocalVariable(name: "__x", scope: !485, file: !3, line: 574, type: !6)
!485 = distinct !DILexicalBlock(scope: !483, file: !3, line: 574, column: 9)
!486 = !DILocation(line: 574, column: 9, scope: !485)
!487 = !{i32 -2146577933}
!488 = !DILocalVariable(name: "__x", scope: !489, file: !3, line: 574, type: !6)
!489 = distinct !DILexicalBlock(scope: !483, file: !3, line: 574, column: 9)
!490 = !DILocation(line: 574, column: 9, scope: !489)
!491 = !{i32 -2146577808}
!492 = !DILocation(line: 574, column: 9, scope: !493)
!493 = distinct !DILexicalBlock(scope: !479, file: !3, line: 574, column: 9)
!494 = !DILocalVariable(name: "__x", scope: !495, file: !3, line: 574, type: !6)
!495 = distinct !DILexicalBlock(scope: !493, file: !3, line: 574, column: 9)
!496 = !DILocation(line: 574, column: 9, scope: !495)
!497 = !{i32 -2146577676}
!498 = !DILocalVariable(name: "__x", scope: !499, file: !3, line: 574, type: !6)
!499 = distinct !DILexicalBlock(scope: !493, file: !3, line: 574, column: 9)
!500 = !DILocation(line: 574, column: 9, scope: !499)
!501 = !{i32 -2146577551}
!502 = !DILocation(line: 578, column: 9, scope: !424)
!503 = !DILocation(line: 579, column: 9, scope: !424)
!504 = !DILocation(line: 579, column: 9, scope: !505)
!505 = distinct !DILexicalBlock(scope: !506, file: !3, line: 579, column: 9)
!506 = distinct !DILexicalBlock(scope: !424, file: !3, line: 579, column: 9)
!507 = !DILocation(line: 579, column: 9, scope: !506)
!508 = !DILocation(line: 579, column: 9, scope: !509)
!509 = distinct !DILexicalBlock(scope: !505, file: !3, line: 579, column: 9)
!510 = !DILocalVariable(name: "__x", scope: !511, file: !3, line: 579, type: !6)
!511 = distinct !DILexicalBlock(scope: !509, file: !3, line: 579, column: 9)
!512 = !DILocation(line: 579, column: 9, scope: !511)
!513 = !{i32 -2146575427}
!514 = !DILocalVariable(name: "__x", scope: !515, file: !3, line: 579, type: !6)
!515 = distinct !DILexicalBlock(scope: !509, file: !3, line: 579, column: 9)
!516 = !DILocation(line: 579, column: 9, scope: !515)
!517 = !{i32 -2146575302}
!518 = !DILocation(line: 579, column: 9, scope: !519)
!519 = distinct !DILexicalBlock(scope: !505, file: !3, line: 579, column: 9)
!520 = !DILocalVariable(name: "__x", scope: !521, file: !3, line: 579, type: !6)
!521 = distinct !DILexicalBlock(scope: !519, file: !3, line: 579, column: 9)
!522 = !DILocation(line: 579, column: 9, scope: !521)
!523 = !{i32 -2146575170}
!524 = !DILocalVariable(name: "__x", scope: !525, file: !3, line: 579, type: !6)
!525 = distinct !DILexicalBlock(scope: !519, file: !3, line: 579, column: 9)
!526 = !DILocation(line: 579, column: 9, scope: !525)
!527 = !{i32 -2146575045}
!528 = !DILocation(line: 582, column: 12, scope: !529)
!529 = distinct !DILexicalBlock(scope: !424, file: !3, line: 582, column: 12)
!530 = !DILocation(line: 582, column: 30, scope: !529)
!531 = !DILocation(line: 582, column: 12, scope: !424)
!532 = !DILocation(line: 584, column: 13, scope: !533)
!533 = distinct !DILexicalBlock(scope: !529, file: !3, line: 582, column: 45)
!534 = !DILocation(line: 585, column: 13, scope: !533)
!535 = !DILocation(line: 585, column: 13, scope: !536)
!536 = distinct !DILexicalBlock(scope: !537, file: !3, line: 585, column: 13)
!537 = distinct !DILexicalBlock(scope: !533, file: !3, line: 585, column: 13)
!538 = !DILocation(line: 585, column: 13, scope: !537)
!539 = !DILocation(line: 585, column: 13, scope: !540)
!540 = distinct !DILexicalBlock(scope: !536, file: !3, line: 585, column: 13)
!541 = !DILocalVariable(name: "__x", scope: !542, file: !3, line: 585, type: !6)
!542 = distinct !DILexicalBlock(scope: !540, file: !3, line: 585, column: 13)
!543 = !DILocation(line: 585, column: 13, scope: !542)
!544 = !{i32 -2146572870}
!545 = !DILocalVariable(name: "__x", scope: !546, file: !3, line: 585, type: !6)
!546 = distinct !DILexicalBlock(scope: !540, file: !3, line: 585, column: 13)
!547 = !DILocation(line: 585, column: 13, scope: !546)
!548 = !{i32 -2146572745}
!549 = !DILocation(line: 585, column: 13, scope: !550)
!550 = distinct !DILexicalBlock(scope: !536, file: !3, line: 585, column: 13)
!551 = !DILocalVariable(name: "__x", scope: !552, file: !3, line: 585, type: !6)
!552 = distinct !DILexicalBlock(scope: !550, file: !3, line: 585, column: 13)
!553 = !DILocation(line: 585, column: 13, scope: !552)
!554 = !{i32 -2146572613}
!555 = !DILocalVariable(name: "__x", scope: !556, file: !3, line: 585, type: !6)
!556 = distinct !DILexicalBlock(scope: !550, file: !3, line: 585, column: 13)
!557 = !DILocation(line: 585, column: 13, scope: !556)
!558 = !{i32 -2146572488}
!559 = !DILocation(line: 588, column: 16, scope: !560)
!560 = distinct !DILexicalBlock(scope: !533, file: !3, line: 588, column: 16)
!561 = !DILocation(line: 588, column: 28, scope: !560)
!562 = !DILocation(line: 588, column: 41, scope: !560)
!563 = !DILocation(line: 588, column: 44, scope: !560)
!564 = !DILocation(line: 588, column: 56, scope: !560)
!565 = !DILocation(line: 588, column: 16, scope: !533)
!566 = !DILocation(line: 589, column: 17, scope: !567)
!567 = distinct !DILexicalBlock(scope: !560, file: !3, line: 588, column: 70)
!568 = !DILocation(line: 589, column: 23, scope: !567)
!569 = !DILocation(line: 589, column: 36, scope: !567)
!570 = !DILocation(line: 589, column: 45, scope: !567)
!571 = !DILocation(line: 589, column: 49, scope: !567)
!572 = !DILocation(line: 589, column: 71, scope: !567)
!573 = !DILocation(line: 0, scope: !567)
!574 = !DILocation(line: 591, column: 21, scope: !575)
!575 = distinct !DILexicalBlock(scope: !567, file: !3, line: 589, column: 91)
!576 = !DILocation(line: 592, column: 21, scope: !575)
!577 = !DILocation(line: 592, column: 21, scope: !578)
!578 = distinct !DILexicalBlock(scope: !579, file: !3, line: 592, column: 21)
!579 = distinct !DILexicalBlock(scope: !575, file: !3, line: 592, column: 21)
!580 = !DILocation(line: 592, column: 21, scope: !579)
!581 = !DILocation(line: 592, column: 21, scope: !582)
!582 = distinct !DILexicalBlock(scope: !578, file: !3, line: 592, column: 21)
!583 = !DILocalVariable(name: "__x", scope: !584, file: !3, line: 592, type: !6)
!584 = distinct !DILexicalBlock(scope: !582, file: !3, line: 592, column: 21)
!585 = !DILocation(line: 592, column: 21, scope: !584)
!586 = !{i32 -2146570211}
!587 = !DILocalVariable(name: "__x", scope: !588, file: !3, line: 592, type: !6)
!588 = distinct !DILexicalBlock(scope: !582, file: !3, line: 592, column: 21)
!589 = !DILocation(line: 592, column: 21, scope: !588)
!590 = !{i32 -2146570086}
!591 = !DILocation(line: 592, column: 21, scope: !592)
!592 = distinct !DILexicalBlock(scope: !578, file: !3, line: 592, column: 21)
!593 = !DILocalVariable(name: "__x", scope: !594, file: !3, line: 592, type: !6)
!594 = distinct !DILexicalBlock(scope: !592, file: !3, line: 592, column: 21)
!595 = !DILocation(line: 592, column: 21, scope: !594)
!596 = !{i32 -2146569954}
!597 = !DILocalVariable(name: "__x", scope: !598, file: !3, line: 592, type: !6)
!598 = distinct !DILexicalBlock(scope: !592, file: !3, line: 592, column: 21)
!599 = !DILocation(line: 592, column: 21, scope: !598)
!600 = !{i32 -2146569829}
!601 = distinct !{!601, !566, !602}
!602 = !DILocation(line: 594, column: 17, scope: !567)
!603 = !DILocation(line: 595, column: 13, scope: !567)
!604 = !DILocation(line: 598, column: 13, scope: !533)
!605 = !DILocation(line: 599, column: 13, scope: !533)
!606 = !DILocation(line: 599, column: 13, scope: !607)
!607 = distinct !DILexicalBlock(scope: !608, file: !3, line: 599, column: 13)
!608 = distinct !DILexicalBlock(scope: !533, file: !3, line: 599, column: 13)
!609 = !DILocation(line: 599, column: 13, scope: !608)
!610 = !DILocation(line: 599, column: 13, scope: !611)
!611 = distinct !DILexicalBlock(scope: !607, file: !3, line: 599, column: 13)
!612 = !DILocalVariable(name: "__x", scope: !613, file: !3, line: 599, type: !6)
!613 = distinct !DILexicalBlock(scope: !611, file: !3, line: 599, column: 13)
!614 = !DILocation(line: 599, column: 13, scope: !613)
!615 = !{i32 -2146567705}
!616 = !DILocalVariable(name: "__x", scope: !617, file: !3, line: 599, type: !6)
!617 = distinct !DILexicalBlock(scope: !611, file: !3, line: 599, column: 13)
!618 = !DILocation(line: 599, column: 13, scope: !617)
!619 = !{i32 -2146567580}
!620 = !DILocation(line: 599, column: 13, scope: !621)
!621 = distinct !DILexicalBlock(scope: !607, file: !3, line: 599, column: 13)
!622 = !DILocalVariable(name: "__x", scope: !623, file: !3, line: 599, type: !6)
!623 = distinct !DILexicalBlock(scope: !621, file: !3, line: 599, column: 13)
!624 = !DILocation(line: 599, column: 13, scope: !623)
!625 = !{i32 -2146567448}
!626 = !DILocalVariable(name: "__x", scope: !627, file: !3, line: 599, type: !6)
!627 = distinct !DILexicalBlock(scope: !621, file: !3, line: 599, column: 13)
!628 = !DILocation(line: 599, column: 13, scope: !627)
!629 = !{i32 -2146567323}
!630 = !DILocation(line: 601, column: 9, scope: !533)
!631 = !DILocation(line: 603, column: 13, scope: !632)
!632 = distinct !DILexicalBlock(scope: !529, file: !3, line: 601, column: 16)
!633 = !DILocation(line: 604, column: 13, scope: !632)
!634 = !DILocation(line: 604, column: 13, scope: !635)
!635 = distinct !DILexicalBlock(scope: !636, file: !3, line: 604, column: 13)
!636 = distinct !DILexicalBlock(scope: !632, file: !3, line: 604, column: 13)
!637 = !DILocation(line: 604, column: 13, scope: !636)
!638 = !DILocation(line: 604, column: 13, scope: !639)
!639 = distinct !DILexicalBlock(scope: !635, file: !3, line: 604, column: 13)
!640 = !DILocalVariable(name: "__x", scope: !641, file: !3, line: 604, type: !6)
!641 = distinct !DILexicalBlock(scope: !639, file: !3, line: 604, column: 13)
!642 = !DILocation(line: 604, column: 13, scope: !641)
!643 = !{i32 -2146565199}
!644 = !DILocalVariable(name: "__x", scope: !645, file: !3, line: 604, type: !6)
!645 = distinct !DILexicalBlock(scope: !639, file: !3, line: 604, column: 13)
!646 = !DILocation(line: 604, column: 13, scope: !645)
!647 = !{i32 -2146565074}
!648 = !DILocation(line: 604, column: 13, scope: !649)
!649 = distinct !DILexicalBlock(scope: !635, file: !3, line: 604, column: 13)
!650 = !DILocalVariable(name: "__x", scope: !651, file: !3, line: 604, type: !6)
!651 = distinct !DILexicalBlock(scope: !649, file: !3, line: 604, column: 13)
!652 = !DILocation(line: 604, column: 13, scope: !651)
!653 = !{i32 -2146564942}
!654 = !DILocalVariable(name: "__x", scope: !655, file: !3, line: 604, type: !6)
!655 = distinct !DILexicalBlock(scope: !649, file: !3, line: 604, column: 13)
!656 = !DILocation(line: 604, column: 13, scope: !655)
!657 = !{i32 -2146564817}
!658 = !DILocation(line: 608, column: 13, scope: !632)
!659 = !DILocation(line: 609, column: 13, scope: !632)
!660 = !DILocation(line: 609, column: 13, scope: !661)
!661 = distinct !DILexicalBlock(scope: !662, file: !3, line: 609, column: 13)
!662 = distinct !DILexicalBlock(scope: !632, file: !3, line: 609, column: 13)
!663 = !DILocation(line: 609, column: 13, scope: !662)
!664 = !DILocation(line: 609, column: 13, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !3, line: 609, column: 13)
!666 = !DILocalVariable(name: "__x", scope: !667, file: !3, line: 609, type: !6)
!667 = distinct !DILexicalBlock(scope: !665, file: !3, line: 609, column: 13)
!668 = !DILocation(line: 609, column: 13, scope: !667)
!669 = !{i32 -2146562693}
!670 = !DILocalVariable(name: "__x", scope: !671, file: !3, line: 609, type: !6)
!671 = distinct !DILexicalBlock(scope: !665, file: !3, line: 609, column: 13)
!672 = !DILocation(line: 609, column: 13, scope: !671)
!673 = !{i32 -2146562568}
!674 = !DILocation(line: 609, column: 13, scope: !675)
!675 = distinct !DILexicalBlock(scope: !661, file: !3, line: 609, column: 13)
!676 = !DILocalVariable(name: "__x", scope: !677, file: !3, line: 609, type: !6)
!677 = distinct !DILexicalBlock(scope: !675, file: !3, line: 609, column: 13)
!678 = !DILocation(line: 609, column: 13, scope: !677)
!679 = !{i32 -2146562436}
!680 = !DILocalVariable(name: "__x", scope: !681, file: !3, line: 609, type: !6)
!681 = distinct !DILexicalBlock(scope: !675, file: !3, line: 609, column: 13)
!682 = !DILocation(line: 609, column: 13, scope: !681)
!683 = !{i32 -2146562311}
!684 = distinct !{!684, !420, !685}
!685 = !DILocation(line: 612, column: 5, scope: !403)
!686 = !DILocation(line: 614, column: 5, scope: !403)
!687 = !DILocation(line: 615, column: 1, scope: !403)
!688 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 222, type: !689, scopeLine: 223, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!689 = !DISubroutineType(types: !690)
!690 = !{!213, !7, !6}
!691 = !DILocalVariable(name: "data", arg: 1, scope: !688, file: !3, line: 222, type: !7)
!692 = !DILocation(line: 222, column: 33, scope: !688)
!693 = !DILocalVariable(name: "len", arg: 2, scope: !688, file: !3, line: 222, type: !6)
!694 = !DILocation(line: 222, column: 48, scope: !688)
!695 = !DILocalVariable(name: "hash", scope: !688, file: !3, line: 224, type: !18)
!696 = !DILocation(line: 224, column: 14, scope: !688)
!697 = !DILocalVariable(name: "i", scope: !688, file: !3, line: 225, type: !6)
!698 = !DILocation(line: 225, column: 18, scope: !688)
!699 = !DILocation(line: 227, column: 11, scope: !700)
!700 = distinct !DILexicalBlock(scope: !688, file: !3, line: 227, column: 5)
!701 = !DILocation(line: 227, column: 9, scope: !700)
!702 = !DILocation(line: 227, column: 16, scope: !703)
!703 = distinct !DILexicalBlock(scope: !700, file: !3, line: 227, column: 5)
!704 = !DILocation(line: 227, column: 20, scope: !703)
!705 = !DILocation(line: 227, column: 18, scope: !703)
!706 = !DILocation(line: 227, column: 5, scope: !700)
!707 = !DILocation(line: 228, column: 18, scope: !703)
!708 = !DILocation(line: 228, column: 23, scope: !703)
!709 = !DILocation(line: 228, column: 31, scope: !703)
!710 = !DILocation(line: 228, column: 29, scope: !703)
!711 = !DILocation(line: 228, column: 41, scope: !703)
!712 = !DILocation(line: 228, column: 40, scope: !703)
!713 = !DILocation(line: 228, column: 39, scope: !703)
!714 = !DILocation(line: 228, column: 37, scope: !703)
!715 = !DILocation(line: 228, column: 14, scope: !703)
!716 = !DILocation(line: 228, column: 9, scope: !703)
!717 = !DILocation(line: 227, column: 29, scope: !703)
!718 = !DILocation(line: 227, column: 34, scope: !703)
!719 = !DILocation(line: 227, column: 5, scope: !703)
!720 = distinct !{!720, !706, !721}
!721 = !DILocation(line: 228, column: 45, scope: !700)
!722 = !DILocation(line: 231, column: 12, scope: !688)
!723 = !DILocation(line: 231, column: 5, scope: !688)
