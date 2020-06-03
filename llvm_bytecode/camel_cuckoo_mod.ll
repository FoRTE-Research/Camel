; ModuleID = 'camel_cuckoo_mod.bc'
source_filename = "../benchmarks/camel_cuckoo.c"
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
  %cmp = icmp uge i16 %7, 32, !dbg !348
  br i1 %cmp, label %if.then, label %if.end, !dbg !349

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !350
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !350
  store i16 1, i16* %key, align 2, !dbg !352
  br label %if.end, !dbg !353

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #0 !dbg !355 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !356
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !356
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !356
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !358
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !358
  %2 = load i16, i16* %index1, align 2, !dbg !358
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !356
  %3 = load i16, i16* %arrayidx, align 2, !dbg !356
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !359
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !359
  %5 = load i16, i16* %fingerprint, align 2, !dbg !359
  %cmp = icmp eq i16 %3, %5, !dbg !360
  br i1 %cmp, label %if.then, label %if.else, !dbg !361

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !362
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !362
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !362
  store i8 1, i8* %member, align 1, !dbg !364
  br label %if.end17, !dbg !365

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !366
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !366
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !369
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !369
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !369
  %9 = load i16, i16* %index2, align 2, !dbg !369
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !366
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !366
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !370
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !370
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !370
  %cmp10 = icmp eq i16 %10, %12, !dbg !371
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !372

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !373
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !373
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !373
  store i8 1, i8* %member13, align 1, !dbg !375
  br label %if.end, !dbg !376

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !377
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !377
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !377
  store i8 0, i8* %member16, align 1, !dbg !379
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  ret void, !dbg !380
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #0 !dbg !381 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !382
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !382
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !382
  %1 = load i16, i16* %lookup_count, align 2, !dbg !383
  %inc = add i16 %1, 1, !dbg !383
  store i16 %inc, i16* %lookup_count, align 2, !dbg !383
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !384
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !384
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !384
  %3 = load i8, i8* %member, align 1, !dbg !384
  %tobool = trunc i8 %3 to i1, !dbg !384
  %conv = zext i1 %tobool to i16, !dbg !384
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !385
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !385
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !385
  %5 = load i16, i16* %member_count, align 2, !dbg !386
  %add = add i16 %5, %conv, !dbg !386
  store i16 %add, i16* %member_count, align 2, !dbg !386
  ret void, !dbg !387
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !388 {
entry:
  call void @exit(i16 0) #6, !dbg !389
  unreachable, !dbg !389
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !390 {
entry:
  ret void, !dbg !391
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !392 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !395
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !396
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !397
  call void @camel_init(), !dbg !398
  call void @task_init(), !dbg !399
  br label %while.cond, !dbg !400

while.cond:                                       ; preds = %if.end20, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !401
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !401
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !401
  %1 = load i16, i16* %lookup_count, align 2, !dbg !401
  %cmp = icmp ult i16 %1, 32, !dbg !402
  br i1 %cmp, label %while.body, label %while.end21, !dbg !400

while.body:                                       ; preds = %while.cond
  call void @task_generate_key(), !dbg !403
  call void @task_calc_indexes(), !dbg !405
  call void @task_calc_indexes_index_1(), !dbg !406
  call void @task_calc_indexes_index_2(), !dbg !407
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !408
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !408
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !408
  %3 = load i16, i16* %insert_count, align 2, !dbg !408
  %cmp2 = icmp ult i16 %3, 32, !dbg !410
  br i1 %cmp2, label %if.then, label %if.else, !dbg !411

if.then:                                          ; preds = %while.body
  call void @task_add(), !dbg !412
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !414
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !414
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !414
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !416
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !416
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !416
  %6 = load i16, i16* %index1, align 2, !dbg !416
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %6, !dbg !414
  %7 = load i16, i16* %arrayidx, align 2, !dbg !414
  %tobool = icmp ne i16 %7, 0, !dbg !414
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !417

land.lhs.true:                                    ; preds = %if.then
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !418
  %filter6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !418
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !419
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 4, !dbg !419
  %10 = load i16, i16* %index2, align 2, !dbg !419
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter6, i16 0, i16 %10, !dbg !418
  %11 = load i16, i16* %arrayidx8, align 2, !dbg !418
  %tobool9 = icmp ne i16 %11, 0, !dbg !418
  br i1 %tobool9, label %if.then10, label %if.end, !dbg !420

if.then10:                                        ; preds = %land.lhs.true
  br label %while.cond11, !dbg !421

while.cond11:                                     ; preds = %while.body19, %if.then10
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !423
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !423
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 10, !dbg !423
  %13 = load i8, i8* %success, align 2, !dbg !423
  %tobool13 = trunc i8 %13 to i1, !dbg !423
  %conv = zext i1 %tobool13 to i16, !dbg !423
  %cmp14 = icmp eq i16 %conv, 0, !dbg !424
  br i1 %cmp14, label %land.rhs, label %land.end, !dbg !425

land.rhs:                                         ; preds = %while.cond11
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !426
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 5, !dbg !426
  %15 = load i16, i16* %relocation_count, align 2, !dbg !426
  %cmp17 = icmp ult i16 %15, 8, !dbg !427
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond11
  %16 = phi i1 [ false, %while.cond11 ], [ %cmp17, %land.rhs ], !dbg !428
  br i1 %16, label %while.body19, label %while.end, !dbg !421

while.body19:                                     ; preds = %land.end
  call void @task_relocate(), !dbg !429
  br label %while.cond11, !dbg !421, !llvm.loop !431

while.end:                                        ; preds = %land.end
  br label %if.end, !dbg !433

if.end:                                           ; preds = %while.end, %land.lhs.true, %if.then
  call void @task_insert_done(), !dbg !434
  br label %if.end20, !dbg !435

if.else:                                          ; preds = %while.body
  call void @task_lookup_search(), !dbg !436
  call void @task_lookup_done(), !dbg !438
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.end
  br label %while.cond, !dbg !400, !llvm.loop !439

while.end21:                                      ; preds = %while.cond
  call void @task_done(), !dbg !441
  %17 = load i16, i16* %retval, align 2, !dbg !442
  ret i16 %17, !dbg !442
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !443 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !446, metadata !DIExpression()), !dbg !447
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !448, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !450, metadata !DIExpression()), !dbg !451
  store i16 5381, i16* %hash, align 2, !dbg !451
  call void @llvm.dbg.declare(metadata i16* %i, metadata !452, metadata !DIExpression()), !dbg !453
  store i16 0, i16* %i, align 2, !dbg !454
  br label %for.cond, !dbg !456

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !457
  %1 = load i16, i16* %len.addr, align 2, !dbg !459
  %cmp = icmp ult i16 %0, %1, !dbg !460
  br i1 %cmp, label %for.body, label %for.end, !dbg !461

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !462
  %shl = shl i16 %2, 5, !dbg !463
  %3 = load i16, i16* %hash, align 2, !dbg !464
  %add = add i16 %shl, %3, !dbg !465
  %4 = load i8*, i8** %data.addr, align 2, !dbg !466
  %5 = load i8, i8* %4, align 1, !dbg !467
  %conv = zext i8 %5 to i16, !dbg !468
  %add1 = add i16 %add, %conv, !dbg !469
  store i16 %add1, i16* %hash, align 2, !dbg !470
  br label %for.inc, !dbg !471

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !472
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !472
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !472
  %7 = load i16, i16* %i, align 2, !dbg !473
  %inc = add i16 %7, 1, !dbg !473
  store i16 %inc, i16* %i, align 2, !dbg !473
  br label %for.cond, !dbg !474, !llvm.loop !475

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !477
  ret i16 %8, !dbg !478
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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 133, type: !71, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !13, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_cuckoo.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
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
!15 = distinct !DIGlobalVariable(name: "init_key", scope: !2, file: !3, line: 214, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 18, baseType: !18)
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !9, line: 26, baseType: !19)
!19 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !11, line: 43, baseType: !20)
!20 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 373, type: !23, isLocal: false, isDefinition: true)
!23 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 422, type: !26, isLocal: true, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DISubroutineType(types: !28)
!28 = !{null}
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 53, type: !18, isLocal: false, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 54, type: !18, isLocal: false, isDefinition: true)
!33 = !DIGlobalVariableExpression(var: !34, expr: !DIExpression())
!34 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 140, type: !35, isLocal: false, isDefinition: true)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !36, size: 16)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 126, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 121, size: 2400, elements: !38)
!38 = !{!39, !44, !65}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !37, file: !3, line: 123, baseType: !40, size: 176)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !41, size: 176, elements: !42)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 50, baseType: !18)
!42 = !{!43}
!43 = !DISubrange(count: 11)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !37, file: !3, line: 124, baseType: !45, size: 2208, offset: 176)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 118, baseType: !46)
!46 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 103, size: 2208, elements: !47)
!47 = !{!48, !53, !54, !55, !56, !57, !58, !59, !60, !61, !62, !64}
!48 = !DIDerivedType(tag: DW_TAG_member, name: "filter", scope: !46, file: !3, line: 105, baseType: !49, size: 2048)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2048, elements: !51)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "fingerprint_t", file: !3, line: 20, baseType: !18)
!51 = !{!52}
!52 = !DISubrange(count: 128)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !46, file: !3, line: 106, baseType: !17, size: 16, offset: 2048)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "fingerprint", scope: !46, file: !3, line: 107, baseType: !50, size: 16, offset: 2064)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "index1", scope: !46, file: !3, line: 108, baseType: !17, size: 16, offset: 2080)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "index2", scope: !46, file: !3, line: 109, baseType: !17, size: 16, offset: 2096)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "relocation_count", scope: !46, file: !3, line: 110, baseType: !17, size: 16, offset: 2112)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "insert_count", scope: !46, file: !3, line: 111, baseType: !17, size: 16, offset: 2128)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "inserted_count", scope: !46, file: !3, line: 112, baseType: !17, size: 16, offset: 2144)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "lookup_count", scope: !46, file: !3, line: 113, baseType: !17, size: 16, offset: 2160)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "member_count", scope: !46, file: !3, line: 114, baseType: !17, size: 16, offset: 2176)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "success", scope: !46, file: !3, line: 115, baseType: !63, size: 8, offset: 2192)
!63 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "member", scope: !46, file: !3, line: 116, baseType: !63, size: 8, offset: 2200)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !37, file: !3, line: 125, baseType: !18, size: 16, offset: 2384)
!66 = !DIGlobalVariableExpression(var: !67, expr: !DIExpression())
!67 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 140, type: !35, isLocal: false, isDefinition: true)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 169, type: !70, isLocal: false, isDefinition: true)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 176, elements: !42)
!71 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 128, size: 4816, elements: !72)
!72 = !{!73, !74, !75}
!73 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !71, file: !3, line: 130, baseType: !18, size: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !71, file: !3, line: 131, baseType: !36, size: 2400, offset: 16)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !71, file: !3, line: 132, baseType: !36, size: 2400, offset: 2416)
!76 = !{i32 2, !"Dwarf Version", i32 4}
!77 = !{i32 2, !"Debug Info Version", i32 3}
!78 = !{i32 1, !"wchar_size", i32 2}
!79 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!80 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 142, type: !27, scopeLine: 142, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!81 = !DILocation(line: 143, column: 10, scope: !80)
!82 = !DILocation(line: 145, column: 9, scope: !80)
!83 = !DILocation(line: 147, column: 9, scope: !80)
!84 = !DILocation(line: 152, column: 11, scope: !80)
!85 = !DILocation(line: 157, column: 12, scope: !80)
!86 = !DILocation(line: 158, column: 10, scope: !80)
!87 = !DILocation(line: 159, column: 10, scope: !80)
!88 = !DILocation(line: 161, column: 10, scope: !80)
!89 = !DILocation(line: 162, column: 12, scope: !80)
!90 = !DILocation(line: 165, column: 10, scope: !80)
!91 = !DILocation(line: 167, column: 1, scope: !80)
!92 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 171, type: !27, scopeLine: 171, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 172, column: 14, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !3, line: 172, column: 8)
!95 = !DILocation(line: 172, column: 19, scope: !94)
!96 = !DILocation(line: 172, column: 8, scope: !92)
!97 = !DILocation(line: 173, column: 14, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !3, line: 172, column: 34)
!99 = !DILocation(line: 174, column: 16, scope: !98)
!100 = !DILocation(line: 175, column: 5, scope: !98)
!101 = !DILocation(line: 175, column: 21, scope: !102)
!102 = distinct !DILexicalBlock(scope: !94, file: !3, line: 175, column: 15)
!103 = !DILocation(line: 175, column: 26, scope: !102)
!104 = !DILocation(line: 175, column: 15, scope: !94)
!105 = !DILocation(line: 176, column: 14, scope: !106)
!106 = distinct !DILexicalBlock(scope: !102, file: !3, line: 175, column: 41)
!107 = !DILocation(line: 177, column: 16, scope: !106)
!108 = !DILocation(line: 178, column: 5, scope: !106)
!109 = !DILocation(line: 179, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !102, file: !3, line: 178, column: 12)
!111 = !DILocation(line: 196, column: 3, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !3, line: 196, column: 3)
!113 = !{i32 -2146596341}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 198, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 198, column: 33)
!116 = !DILocation(line: 198, column: 33, scope: !115)
!117 = !{i32 -2146596105}
!118 = !DILocation(line: 198, column: 51, scope: !92)
!119 = !DILocation(line: 198, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 198, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 198, column: 65)
!122 = !DILocation(line: 198, column: 65, scope: !121)
!123 = !{i32 -2146595980}
!124 = !DILocation(line: 198, column: 83, scope: !92)
!125 = !DILocation(line: 198, column: 63, scope: !92)
!126 = !DILocation(line: 198, column: 19, scope: !92)
!127 = !DILocation(line: 198, column: 17, scope: !92)
!128 = !DILocation(line: 199, column: 37, scope: !92)
!129 = !DILocation(line: 199, column: 71, scope: !92)
!130 = !DILocation(line: 199, column: 23, scope: !92)
!131 = !DILocation(line: 199, column: 21, scope: !92)
!132 = !DILocation(line: 202, column: 6, scope: !133)
!133 = distinct !DILexicalBlock(scope: !92, file: !3, line: 202, column: 6)
!134 = !DILocation(line: 202, column: 27, scope: !133)
!135 = !DILocation(line: 202, column: 33, scope: !133)
!136 = !DILocation(line: 202, column: 24, scope: !133)
!137 = !DILocation(line: 202, column: 6, scope: !92)
!138 = !DILocation(line: 203, column: 11, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !3, line: 202, column: 51)
!140 = !DILocation(line: 203, column: 4, scope: !139)
!141 = !DILocation(line: 203, column: 19, scope: !139)
!142 = !DILocation(line: 204, column: 4, scope: !139)
!143 = !DILocation(line: 205, column: 24, scope: !139)
!144 = !DILocation(line: 205, column: 30, scope: !139)
!145 = !DILocation(line: 205, column: 4, scope: !139)
!146 = !DILocation(line: 206, column: 3, scope: !139)
!147 = !DILocation(line: 207, column: 4, scope: !148)
!148 = distinct !DILexicalBlock(scope: !133, file: !3, line: 206, column: 9)
!149 = !DILocation(line: 210, column: 1, scope: !92)
!150 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 239, type: !27, scopeLine: 240, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!151 = !DILocalVariable(name: "i", scope: !150, file: !3, line: 241, type: !6)
!152 = !DILocation(line: 241, column: 14, scope: !150)
!153 = !DILocation(line: 242, column: 12, scope: !154)
!154 = distinct !DILexicalBlock(scope: !150, file: !3, line: 242, column: 5)
!155 = !DILocation(line: 242, column: 10, scope: !154)
!156 = !DILocation(line: 242, column: 17, scope: !157)
!157 = distinct !DILexicalBlock(scope: !154, file: !3, line: 242, column: 5)
!158 = !DILocation(line: 242, column: 19, scope: !157)
!159 = !DILocation(line: 242, column: 5, scope: !154)
!160 = !DILocation(line: 243, column: 9, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 242, column: 40)
!162 = !DILocation(line: 243, column: 20, scope: !161)
!163 = !DILocation(line: 243, column: 23, scope: !161)
!164 = !DILocation(line: 244, column: 5, scope: !161)
!165 = !DILocation(line: 242, column: 35, scope: !157)
!166 = !DILocation(line: 242, column: 5, scope: !157)
!167 = distinct !{!167, !159, !168}
!168 = !DILocation(line: 244, column: 5, scope: !154)
!169 = !DILocation(line: 245, column: 5, scope: !150)
!170 = !DILocation(line: 245, column: 22, scope: !150)
!171 = !DILocation(line: 246, column: 5, scope: !150)
!172 = !DILocation(line: 246, column: 22, scope: !150)
!173 = !DILocation(line: 247, column: 5, scope: !150)
!174 = !DILocation(line: 247, column: 24, scope: !150)
!175 = !DILocation(line: 248, column: 5, scope: !150)
!176 = !DILocation(line: 248, column: 22, scope: !150)
!177 = !DILocation(line: 249, column: 5, scope: !150)
!178 = !DILocation(line: 249, column: 13, scope: !150)
!179 = !DILocation(line: 250, column: 1, scope: !150)
!180 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 252, type: !27, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!181 = !DILocation(line: 255, column: 16, scope: !180)
!182 = !DILocation(line: 255, column: 24, scope: !180)
!183 = !DILocation(line: 255, column: 29, scope: !180)
!184 = !DILocation(line: 255, column: 5, scope: !180)
!185 = !DILocation(line: 255, column: 13, scope: !180)
!186 = !DILocation(line: 256, column: 1, scope: !180)
!187 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 258, type: !27, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 260, column: 43, scope: !187)
!189 = !DILocation(line: 260, column: 23, scope: !187)
!190 = !DILocation(line: 260, column: 5, scope: !187)
!191 = !DILocation(line: 260, column: 21, scope: !187)
!192 = !DILocation(line: 261, column: 1, scope: !187)
!193 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 234, type: !194, scopeLine: 235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!194 = !DISubroutineType(types: !195)
!195 = !{!50, !17}
!196 = !DILocalVariable(name: "key", arg: 1, scope: !193, file: !3, line: 234, type: !17)
!197 = !DILocation(line: 234, column: 50, scope: !193)
!198 = !DILocation(line: 236, column: 21, scope: !193)
!199 = !DILocation(line: 236, column: 12, scope: !193)
!200 = !DILocation(line: 236, column: 5, scope: !193)
!201 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 263, type: !27, scopeLine: 264, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 265, column: 32, scope: !201)
!203 = !DILocation(line: 265, column: 18, scope: !201)
!204 = !DILocation(line: 265, column: 5, scope: !201)
!205 = !DILocation(line: 265, column: 16, scope: !201)
!206 = !DILocation(line: 266, column: 1, scope: !201)
!207 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 228, type: !208, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!208 = !DISubroutineType(types: !209)
!209 = !{!210, !50}
!210 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 21, baseType: !18)
!211 = !DILocalVariable(name: "fp", arg: 1, scope: !207, file: !3, line: 228, type: !50)
!212 = !DILocation(line: 228, column: 44, scope: !207)
!213 = !DILocalVariable(name: "hash", scope: !207, file: !3, line: 230, type: !214)
!214 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 19, baseType: !18)
!215 = !DILocation(line: 230, column: 12, scope: !207)
!216 = !DILocation(line: 230, column: 28, scope: !207)
!217 = !DILocation(line: 230, column: 19, scope: !207)
!218 = !DILocation(line: 231, column: 12, scope: !207)
!219 = !DILocation(line: 231, column: 17, scope: !207)
!220 = !DILocation(line: 231, column: 5, scope: !207)
!221 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 268, type: !27, scopeLine: 269, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!222 = !DILocalVariable(name: "fp_hash", scope: !221, file: !3, line: 270, type: !210)
!223 = !DILocation(line: 270, column: 13, scope: !221)
!224 = !DILocation(line: 270, column: 37, scope: !221)
!225 = !DILocation(line: 270, column: 23, scope: !221)
!226 = !DILocation(line: 271, column: 18, scope: !221)
!227 = !DILocation(line: 271, column: 31, scope: !221)
!228 = !DILocation(line: 271, column: 29, scope: !221)
!229 = !DILocation(line: 271, column: 5, scope: !221)
!230 = !DILocation(line: 271, column: 16, scope: !221)
!231 = !DILocation(line: 272, column: 1, scope: !221)
!232 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 274, type: !27, scopeLine: 275, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!233 = !DILocation(line: 276, column: 10, scope: !234)
!234 = distinct !DILexicalBlock(scope: !232, file: !3, line: 276, column: 9)
!235 = !DILocation(line: 276, column: 21, scope: !234)
!236 = !DILocation(line: 276, column: 9, scope: !232)
!237 = !DILocation(line: 277, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !234, file: !3, line: 276, column: 34)
!239 = !DILocation(line: 277, column: 21, scope: !238)
!240 = !DILocation(line: 278, column: 34, scope: !238)
!241 = !DILocation(line: 278, column: 9, scope: !238)
!242 = !DILocation(line: 278, column: 20, scope: !238)
!243 = !DILocation(line: 278, column: 32, scope: !238)
!244 = !DILocation(line: 279, column: 5, scope: !238)
!245 = !DILocation(line: 280, column: 14, scope: !246)
!246 = distinct !DILexicalBlock(scope: !247, file: !3, line: 280, column: 13)
!247 = distinct !DILexicalBlock(scope: !234, file: !3, line: 279, column: 12)
!248 = !DILocation(line: 280, column: 25, scope: !246)
!249 = !DILocation(line: 280, column: 13, scope: !247)
!250 = !DILocation(line: 281, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !3, line: 280, column: 38)
!252 = !DILocation(line: 281, column: 25, scope: !251)
!253 = !DILocation(line: 282, column: 38, scope: !251)
!254 = !DILocation(line: 282, column: 13, scope: !251)
!255 = !DILocation(line: 282, column: 24, scope: !251)
!256 = !DILocation(line: 282, column: 36, scope: !251)
!257 = !DILocation(line: 283, column: 9, scope: !251)
!258 = !DILocalVariable(name: "fp_victim", scope: !259, file: !3, line: 284, type: !50)
!259 = distinct !DILexicalBlock(scope: !246, file: !3, line: 283, column: 16)
!260 = !DILocation(line: 284, column: 27, scope: !259)
!261 = !DILocalVariable(name: "index_victim", scope: !259, file: !3, line: 285, type: !210)
!262 = !DILocation(line: 285, column: 21, scope: !259)
!263 = !DILocation(line: 286, column: 17, scope: !264)
!264 = distinct !DILexicalBlock(scope: !259, file: !3, line: 286, column: 17)
!265 = !DILocation(line: 286, column: 24, scope: !264)
!266 = !DILocation(line: 286, column: 17, scope: !259)
!267 = !DILocation(line: 287, column: 32, scope: !268)
!268 = distinct !DILexicalBlock(scope: !264, file: !3, line: 286, column: 29)
!269 = !DILocation(line: 287, column: 30, scope: !268)
!270 = !DILocation(line: 288, column: 29, scope: !268)
!271 = !DILocation(line: 288, column: 40, scope: !268)
!272 = !DILocation(line: 288, column: 27, scope: !268)
!273 = !DILocation(line: 289, column: 13, scope: !268)
!274 = !DILocation(line: 290, column: 32, scope: !275)
!275 = distinct !DILexicalBlock(scope: !264, file: !3, line: 289, column: 20)
!276 = !DILocation(line: 290, column: 30, scope: !275)
!277 = !DILocation(line: 291, column: 29, scope: !275)
!278 = !DILocation(line: 291, column: 40, scope: !275)
!279 = !DILocation(line: 291, column: 27, scope: !275)
!280 = !DILocation(line: 295, column: 40, scope: !259)
!281 = !DILocation(line: 295, column: 13, scope: !259)
!282 = !DILocation(line: 295, column: 24, scope: !259)
!283 = !DILocation(line: 295, column: 38, scope: !259)
!284 = !DILocation(line: 296, column: 26, scope: !259)
!285 = !DILocation(line: 296, column: 13, scope: !259)
!286 = !DILocation(line: 296, column: 24, scope: !259)
!287 = !DILocation(line: 297, column: 31, scope: !259)
!288 = !DILocation(line: 297, column: 13, scope: !259)
!289 = !DILocation(line: 297, column: 29, scope: !259)
!290 = !DILocation(line: 298, column: 13, scope: !259)
!291 = !DILocation(line: 298, column: 34, scope: !259)
!292 = !DILocation(line: 301, column: 1, scope: !232)
!293 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 303, type: !27, scopeLine: 304, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!294 = !DILocalVariable(name: "fp_victim", scope: !293, file: !3, line: 305, type: !50)
!295 = !DILocation(line: 305, column: 19, scope: !293)
!296 = !DILocation(line: 305, column: 31, scope: !293)
!297 = !DILocalVariable(name: "fp_hash_victim", scope: !293, file: !3, line: 306, type: !210)
!298 = !DILocation(line: 306, column: 13, scope: !293)
!299 = !DILocation(line: 306, column: 44, scope: !293)
!300 = !DILocation(line: 306, column: 30, scope: !293)
!301 = !DILocalVariable(name: "index2_victim", scope: !293, file: !3, line: 307, type: !210)
!302 = !DILocation(line: 307, column: 13, scope: !293)
!303 = !DILocation(line: 307, column: 29, scope: !293)
!304 = !DILocation(line: 307, column: 42, scope: !293)
!305 = !DILocation(line: 307, column: 40, scope: !293)
!306 = !DILocation(line: 311, column: 14, scope: !307)
!307 = distinct !DILexicalBlock(scope: !293, file: !3, line: 311, column: 13)
!308 = !DILocation(line: 311, column: 25, scope: !307)
!309 = !DILocation(line: 311, column: 13, scope: !293)
!310 = !DILocation(line: 312, column: 13, scope: !311)
!311 = distinct !DILexicalBlock(scope: !307, file: !3, line: 311, column: 41)
!312 = !DILocation(line: 312, column: 25, scope: !311)
!313 = !DILocation(line: 313, column: 41, scope: !311)
!314 = !DILocation(line: 313, column: 13, scope: !311)
!315 = !DILocation(line: 313, column: 24, scope: !311)
!316 = !DILocation(line: 313, column: 39, scope: !311)
!317 = !DILocation(line: 314, column: 13, scope: !311)
!318 = !DILocation(line: 318, column: 13, scope: !319)
!319 = distinct !DILexicalBlock(scope: !293, file: !3, line: 318, column: 13)
!320 = !DILocation(line: 318, column: 34, scope: !319)
!321 = !DILocation(line: 318, column: 13, scope: !293)
!322 = !DILocation(line: 319, column: 13, scope: !323)
!323 = distinct !DILexicalBlock(scope: !319, file: !3, line: 318, column: 54)
!324 = !DILocation(line: 319, column: 25, scope: !323)
!325 = !DILocation(line: 320, column: 13, scope: !323)
!326 = !DILocation(line: 323, column: 11, scope: !293)
!327 = !DILocation(line: 323, column: 9, scope: !293)
!328 = !DILocation(line: 324, column: 22, scope: !293)
!329 = !DILocation(line: 324, column: 9, scope: !293)
!330 = !DILocation(line: 324, column: 20, scope: !293)
!331 = !DILocation(line: 325, column: 27, scope: !293)
!332 = !DILocation(line: 325, column: 38, scope: !293)
!333 = !DILocation(line: 325, column: 9, scope: !293)
!334 = !DILocation(line: 325, column: 25, scope: !293)
!335 = !DILocation(line: 326, column: 37, scope: !293)
!336 = !DILocation(line: 326, column: 9, scope: !293)
!337 = !DILocation(line: 326, column: 20, scope: !293)
!338 = !DILocation(line: 326, column: 35, scope: !293)
!339 = !DILocation(line: 327, column: 1, scope: !293)
!340 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 329, type: !27, scopeLine: 330, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!341 = !DILocation(line: 331, column: 7, scope: !340)
!342 = !DILocation(line: 331, column: 5, scope: !340)
!343 = !DILocation(line: 332, column: 27, scope: !340)
!344 = !DILocation(line: 332, column: 5, scope: !340)
!345 = !DILocation(line: 332, column: 24, scope: !340)
!346 = !DILocation(line: 334, column: 9, scope: !347)
!347 = distinct !DILexicalBlock(scope: !340, file: !3, line: 334, column: 9)
!348 = !DILocation(line: 334, column: 26, scope: !347)
!349 = !DILocation(line: 334, column: 9, scope: !340)
!350 = !DILocation(line: 336, column: 9, scope: !351)
!351 = distinct !DILexicalBlock(scope: !347, file: !3, line: 334, column: 42)
!352 = !DILocation(line: 336, column: 17, scope: !351)
!353 = !DILocation(line: 338, column: 5, scope: !351)
!354 = !DILocation(line: 339, column: 1, scope: !340)
!355 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 341, type: !27, scopeLine: 342, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!356 = !DILocation(line: 343, column: 9, scope: !357)
!357 = distinct !DILexicalBlock(scope: !355, file: !3, line: 343, column: 9)
!358 = !DILocation(line: 343, column: 20, scope: !357)
!359 = !DILocation(line: 343, column: 35, scope: !357)
!360 = !DILocation(line: 343, column: 32, scope: !357)
!361 = !DILocation(line: 343, column: 9, scope: !355)
!362 = !DILocation(line: 344, column: 9, scope: !363)
!363 = distinct !DILexicalBlock(scope: !357, file: !3, line: 343, column: 52)
!364 = !DILocation(line: 344, column: 20, scope: !363)
!365 = !DILocation(line: 345, column: 5, scope: !363)
!366 = !DILocation(line: 346, column: 13, scope: !367)
!367 = distinct !DILexicalBlock(scope: !368, file: !3, line: 346, column: 13)
!368 = distinct !DILexicalBlock(scope: !357, file: !3, line: 345, column: 12)
!369 = !DILocation(line: 346, column: 24, scope: !367)
!370 = !DILocation(line: 346, column: 39, scope: !367)
!371 = !DILocation(line: 346, column: 36, scope: !367)
!372 = !DILocation(line: 346, column: 13, scope: !368)
!373 = !DILocation(line: 347, column: 13, scope: !374)
!374 = distinct !DILexicalBlock(scope: !367, file: !3, line: 346, column: 56)
!375 = !DILocation(line: 347, column: 24, scope: !374)
!376 = !DILocation(line: 348, column: 9, scope: !374)
!377 = !DILocation(line: 350, column: 13, scope: !378)
!378 = distinct !DILexicalBlock(scope: !367, file: !3, line: 349, column: 14)
!379 = !DILocation(line: 350, column: 24, scope: !378)
!380 = !DILocation(line: 353, column: 1, scope: !355)
!381 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 355, type: !27, scopeLine: 356, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!382 = !DILocation(line: 357, column: 7, scope: !381)
!383 = !DILocation(line: 357, column: 5, scope: !381)
!384 = !DILocation(line: 359, column: 25, scope: !381)
!385 = !DILocation(line: 359, column: 5, scope: !381)
!386 = !DILocation(line: 359, column: 22, scope: !381)
!387 = !DILocation(line: 361, column: 1, scope: !381)
!388 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 363, type: !27, scopeLine: 364, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 365, column: 5, scope: !388)
!390 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 368, type: !27, scopeLine: 368, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!391 = !DILocation(line: 371, column: 1, scope: !390)
!392 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 375, type: !393, scopeLine: 375, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!393 = !DISubroutineType(types: !394)
!394 = !{!23}
!395 = !DILocation(line: 377, column: 16, scope: !392)
!396 = !DILocation(line: 378, column: 10, scope: !392)
!397 = !DILocation(line: 379, column: 12, scope: !392)
!398 = !DILocation(line: 380, column: 5, scope: !392)
!399 = !DILocation(line: 382, column: 5, scope: !392)
!400 = !DILocation(line: 384, column: 5, scope: !392)
!401 = !DILocation(line: 384, column: 11, scope: !392)
!402 = !DILocation(line: 384, column: 29, scope: !392)
!403 = !DILocation(line: 386, column: 9, scope: !404)
!404 = distinct !DILexicalBlock(scope: !392, file: !3, line: 384, column: 44)
!405 = !DILocation(line: 388, column: 9, scope: !404)
!406 = !DILocation(line: 390, column: 9, scope: !404)
!407 = !DILocation(line: 392, column: 9, scope: !404)
!408 = !DILocation(line: 394, column: 12, scope: !409)
!409 = distinct !DILexicalBlock(scope: !404, file: !3, line: 394, column: 12)
!410 = !DILocation(line: 394, column: 29, scope: !409)
!411 = !DILocation(line: 394, column: 12, scope: !404)
!412 = !DILocation(line: 396, column: 13, scope: !413)
!413 = distinct !DILexicalBlock(scope: !409, file: !3, line: 394, column: 44)
!414 = !DILocation(line: 398, column: 16, scope: !415)
!415 = distinct !DILexicalBlock(scope: !413, file: !3, line: 398, column: 16)
!416 = !DILocation(line: 398, column: 28, scope: !415)
!417 = !DILocation(line: 398, column: 41, scope: !415)
!418 = !DILocation(line: 398, column: 44, scope: !415)
!419 = !DILocation(line: 398, column: 56, scope: !415)
!420 = !DILocation(line: 398, column: 16, scope: !413)
!421 = !DILocation(line: 399, column: 17, scope: !422)
!422 = distinct !DILexicalBlock(scope: !415, file: !3, line: 398, column: 70)
!423 = !DILocation(line: 399, column: 23, scope: !422)
!424 = !DILocation(line: 399, column: 36, scope: !422)
!425 = !DILocation(line: 399, column: 45, scope: !422)
!426 = !DILocation(line: 399, column: 49, scope: !422)
!427 = !DILocation(line: 399, column: 71, scope: !422)
!428 = !DILocation(line: 0, scope: !422)
!429 = !DILocation(line: 401, column: 21, scope: !430)
!430 = distinct !DILexicalBlock(scope: !422, file: !3, line: 399, column: 91)
!431 = distinct !{!431, !421, !432}
!432 = !DILocation(line: 403, column: 17, scope: !422)
!433 = !DILocation(line: 404, column: 13, scope: !422)
!434 = !DILocation(line: 406, column: 9, scope: !413)
!435 = !DILocation(line: 408, column: 9, scope: !413)
!436 = !DILocation(line: 410, column: 13, scope: !437)
!437 = distinct !DILexicalBlock(scope: !409, file: !3, line: 408, column: 16)
!438 = !DILocation(line: 412, column: 13, scope: !437)
!439 = distinct !{!439, !400, !440}
!440 = !DILocation(line: 414, column: 5, scope: !392)
!441 = !DILocation(line: 416, column: 5, scope: !392)
!442 = !DILocation(line: 417, column: 1, scope: !392)
!443 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 216, type: !444, scopeLine: 217, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!444 = !DISubroutineType(types: !445)
!445 = !{!214, !7, !6}
!446 = !DILocalVariable(name: "data", arg: 1, scope: !443, file: !3, line: 216, type: !7)
!447 = !DILocation(line: 216, column: 33, scope: !443)
!448 = !DILocalVariable(name: "len", arg: 2, scope: !443, file: !3, line: 216, type: !6)
!449 = !DILocation(line: 216, column: 48, scope: !443)
!450 = !DILocalVariable(name: "hash", scope: !443, file: !3, line: 218, type: !18)
!451 = !DILocation(line: 218, column: 14, scope: !443)
!452 = !DILocalVariable(name: "i", scope: !443, file: !3, line: 219, type: !6)
!453 = !DILocation(line: 219, column: 18, scope: !443)
!454 = !DILocation(line: 221, column: 11, scope: !455)
!455 = distinct !DILexicalBlock(scope: !443, file: !3, line: 221, column: 5)
!456 = !DILocation(line: 221, column: 9, scope: !455)
!457 = !DILocation(line: 221, column: 16, scope: !458)
!458 = distinct !DILexicalBlock(scope: !455, file: !3, line: 221, column: 5)
!459 = !DILocation(line: 221, column: 20, scope: !458)
!460 = !DILocation(line: 221, column: 18, scope: !458)
!461 = !DILocation(line: 221, column: 5, scope: !455)
!462 = !DILocation(line: 222, column: 18, scope: !458)
!463 = !DILocation(line: 222, column: 23, scope: !458)
!464 = !DILocation(line: 222, column: 31, scope: !458)
!465 = !DILocation(line: 222, column: 29, scope: !458)
!466 = !DILocation(line: 222, column: 41, scope: !458)
!467 = !DILocation(line: 222, column: 40, scope: !458)
!468 = !DILocation(line: 222, column: 39, scope: !458)
!469 = !DILocation(line: 222, column: 37, scope: !458)
!470 = !DILocation(line: 222, column: 14, scope: !458)
!471 = !DILocation(line: 222, column: 9, scope: !458)
!472 = !DILocation(line: 221, column: 29, scope: !458)
!473 = !DILocation(line: 221, column: 34, scope: !458)
!474 = !DILocation(line: 221, column: 5, scope: !458)
!475 = distinct !{!475, !461, !476}
!476 = !DILocation(line: 222, column: 45, scope: !455)
!477 = !DILocation(line: 225, column: 12, scope: !443)
!478 = !DILocation(line: 225, column: 5, scope: !443)
