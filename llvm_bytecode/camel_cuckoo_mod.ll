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
@index_victim = common dso_local global i16 0, align 2
@index2_victim = common dso_local global i16 0, align 2

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
  %1 = load i16, i16* %i, align 2, !dbg !160
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !162
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !162
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !162
  %3 = load i16, i16* %i, align 2, !dbg !163
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %3, !dbg !162
  store i16 %1, i16* %arrayidx, align 2, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %4 = load i16, i16* %i, align 2, !dbg !166
  %inc = add i16 %4, 1, !dbg !166
  store i16 %inc, i16* %i, align 2, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !170
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !170
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !170
  store i16 0, i16* %insert_count, align 2, !dbg !171
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !172
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !172
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !172
  store i16 0, i16* %lookup_count, align 2, !dbg !173
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !174
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !174
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !174
  store i16 0, i16* %inserted_count, align 2, !dbg !175
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !176
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !176
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !176
  store i16 0, i16* %member_count, align 2, !dbg !177
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !178
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !178
  store i16 1, i16* %key, align 2, !dbg !179
  ret void, !dbg !180
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_generate_key() #0 !dbg !181 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !182
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !182
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !182
  %1 = load i16, i16* %key, align 2, !dbg !182
  %add = add i16 %1, 1, !dbg !183
  %mul = mul i16 %add, 17, !dbg !184
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !185
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !185
  %key2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !185
  store i16 %mul, i16* %key2, align 2, !dbg !186
  ret void, !dbg !187
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes() #0 !dbg !188 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !189
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !189
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !189
  %1 = load i16, i16* %key, align 2, !dbg !189
  %call = call zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !190
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !191
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !191
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !191
  store i16 %call, i16* %fingerprint, align 2, !dbg !192
  ret void, !dbg !193
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_fingerprint(i16 zeroext %key) #0 !dbg !194 {
entry:
  %key.addr = alloca i16, align 2
  store i16 %key, i16* %key.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %key.addr, metadata !197, metadata !DIExpression()), !dbg !198
  %0 = bitcast i16* %key.addr to i8*, !dbg !199
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !200
  ret i16 %call, !dbg !201
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_1() #0 !dbg !202 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !203
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !203
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !203
  %1 = load i16, i16* %key, align 2, !dbg !203
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !204
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !205
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !205
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !205
  store i16 %call, i16* %index1, align 2, !dbg !206
  ret void, !dbg !207
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_index(i16 zeroext %fp) #0 !dbg !208 {
entry:
  %fp.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  store i16 %fp, i16* %fp.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fp.addr, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !214, metadata !DIExpression()), !dbg !216
  %0 = bitcast i16* %fp.addr to i8*, !dbg !217
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !218
  store i16 %call, i16* %hash, align 2, !dbg !216
  %1 = load i16, i16* %hash, align 2, !dbg !219
  %and = and i16 %1, 127, !dbg !220
  ret i16 %and, !dbg !221
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() #0 !dbg !222 {
entry:
  %fp_hash = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !223, metadata !DIExpression()), !dbg !224
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !225
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !225
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !225
  %1 = load i16, i16* %fingerprint, align 2, !dbg !225
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !226
  store i16 %call, i16* %fp_hash, align 2, !dbg !224
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !227
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !227
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !227
  %3 = load i16, i16* %index1, align 2, !dbg !227
  %4 = load i16, i16* %fp_hash, align 2, !dbg !228
  %xor = xor i16 %3, %4, !dbg !229
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !230
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !230
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !230
  store i16 %xor, i16* %index2, align 2, !dbg !231
  ret void, !dbg !232
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() #0 !dbg !233 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !234
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !234
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !236
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !236
  %2 = load i16, i16* %index1, align 2, !dbg !236
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !234
  %3 = load i16, i16* %arrayidx, align 2, !dbg !234
  %tobool = icmp ne i16 %3, 0, !dbg !234
  br i1 %tobool, label %if.else, label %if.then, !dbg !237

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !238
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !238
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !238
  store i8 1, i8* %success, align 2, !dbg !240
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !241
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !241
  %6 = load i16, i16* %fingerprint, align 2, !dbg !241
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !242
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !242
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !242
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !243
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !243
  %9 = load i16, i16* %index17, align 2, !dbg !243
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !242
  store i16 %6, i16* %arrayidx8, align 2, !dbg !244
  br label %if.end53, !dbg !245

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !246
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !246
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !246
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !249
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !249
  %12 = load i16, i16* %index2, align 2, !dbg !249
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !246
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !246
  %tobool13 = icmp ne i16 %13, 0, !dbg !246
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !250

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !251
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !251
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !251
  store i8 1, i8* %success16, align 2, !dbg !253
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !254
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !254
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !254
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !255
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !255
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !256
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !256
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !256
  %19 = load i16, i16* %index222, align 2, !dbg !256
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !255
  store i16 %16, i16* %arrayidx23, align 2, !dbg !257
  br label %if.end52, !dbg !258

if.else24:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !259, metadata !DIExpression()), !dbg !261
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !262, metadata !DIExpression()), !dbg !263
  %call = call i16 @rand(), !dbg !264
  %rem = srem i16 %call, 2, !dbg !266
  %tobool25 = icmp ne i16 %rem, 0, !dbg !266
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !267

if.then26:                                        ; preds = %if.else24
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !268
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !268
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !268
  %21 = load i16, i16* %index128, align 2, !dbg !268
  store i16 %21, i16* %index_victim, align 2, !dbg !270
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !271
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !271
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !272
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !272
  %24 = load i16, i16* %index132, align 2, !dbg !272
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %24, !dbg !271
  %25 = load i16, i16* %arrayidx33, align 2, !dbg !271
  store i16 %25, i16* %fp_victim, align 2, !dbg !273
  br label %if.end, !dbg !274

if.else34:                                        ; preds = %if.else24
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !275
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !275
  %27 = load i16, i16* %index236, align 2, !dbg !275
  store i16 %27, i16* %index_victim, align 2, !dbg !277
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !278
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !278
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !279
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !279
  %30 = load i16, i16* %index240, align 2, !dbg !279
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %30, !dbg !278
  %31 = load i16, i16* %arrayidx41, align 2, !dbg !278
  store i16 %31, i16* %fp_victim, align 2, !dbg !280
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !281
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !281
  %33 = load i16, i16* %fingerprint43, align 2, !dbg !281
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !282
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !282
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !282
  %35 = load i16, i16* %index_victim, align 2, !dbg !283
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %35, !dbg !282
  store i16 %33, i16* %arrayidx46, align 2, !dbg !284
  %36 = load i16, i16* %index_victim, align 2, !dbg !285
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !286
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !286
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !286
  store i16 %36, i16* %index148, align 2, !dbg !287
  %38 = load i16, i16* %fp_victim, align 2, !dbg !288
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !289
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !289
  store i16 %38, i16* %fingerprint50, align 2, !dbg !290
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !291
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !291
  store i16 0, i16* %relocation_count, align 2, !dbg !292
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  %load = load i16, i16* %index_victim
  store i16 %load, i16* @index_victim
  ret void, !dbg !293
}

declare dso_local i16 @rand() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() #0 !dbg !294 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !295, metadata !DIExpression()), !dbg !296
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !297
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !297
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !297
  %1 = load i16, i16* %fingerprint, align 2, !dbg !297
  store i16 %1, i16* %fp_victim, align 2, !dbg !296
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !298, metadata !DIExpression()), !dbg !299
  %2 = load i16, i16* %fp_victim, align 2, !dbg !300
  %call = call zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !301
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !299
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !302, metadata !DIExpression()), !dbg !303
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !304
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !304
  %4 = load i16, i16* %index1, align 2, !dbg !304
  %5 = load i16, i16* %fp_hash_victim, align 2, !dbg !305
  %xor = xor i16 %4, %5, !dbg !306
  store i16 %xor, i16* %index2_victim, align 2, !dbg !303
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !307
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !307
  %7 = load i16, i16* %index2_victim, align 2, !dbg !309
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %7, !dbg !307
  %8 = load i16, i16* %arrayidx, align 2, !dbg !307
  %tobool = icmp ne i16 %8, 0, !dbg !307
  br i1 %tobool, label %if.end, label %if.then, !dbg !310

if.then:                                          ; preds = %entry
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !311
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !311
  store i8 1, i8* %success, align 2, !dbg !313
  %10 = load i16, i16* %fp_victim, align 2, !dbg !314
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !315
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !315
  %12 = load i16, i16* %index2_victim, align 2, !dbg !316
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %12, !dbg !315
  store i16 %10, i16* %arrayidx6, align 2, !dbg !317
  br label %return, !dbg !318

if.end:                                           ; preds = %entry
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !319
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !319
  %14 = load i16, i16* %relocation_count, align 2, !dbg !319
  %cmp = icmp uge i16 %14, 8, !dbg !321
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !322

if.then8:                                         ; preds = %if.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !323
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !323
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !323
  store i8 0, i8* %success10, align 2, !dbg !325
  br label %return, !dbg !326

if.end11:                                         ; preds = %if.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !327
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !327
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !327
  %17 = load i16, i16* %relocation_count13, align 2, !dbg !328
  %inc = add i16 %17, 1, !dbg !328
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !328
  %18 = load i16, i16* %index2_victim, align 2, !dbg !329
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !330
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !330
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !330
  store i16 %18, i16* %index115, align 2, !dbg !331
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !332
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !332
  %21 = load i16, i16* %index2_victim, align 2, !dbg !333
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %21, !dbg !332
  %22 = load i16, i16* %arrayidx18, align 2, !dbg !332
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !334
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !334
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !334
  store i16 %22, i16* %fingerprint20, align 2, !dbg !335
  %24 = load i16, i16* %fp_victim, align 2, !dbg !336
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !337
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !337
  %26 = load i16, i16* %index2_victim, align 2, !dbg !338
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %26, !dbg !337
  store i16 %24, i16* %arrayidx23, align 2, !dbg !339
  br label %return, !dbg !340

return:                                           ; preds = %if.end11, %if.then8, %if.then
  %load = load i16, i16* %index2_victim
  store i16 %load, i16* @index2_victim
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
define dso_local void @task_commit() #0 !dbg !403 {
entry:
  ret void, !dbg !404
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !405 {
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
  %__x23 = alloca i16, align 2
  %tmp24 = alloca i16, align 2
  %__x26 = alloca i16, align 2
  %tmp27 = alloca i16, align 2
  %__x36 = alloca i16, align 2
  %tmp37 = alloca i16, align 2
  %__x39 = alloca i16, align 2
  %tmp40 = alloca i16, align 2
  %__x53 = alloca i16, align 2
  %tmp54 = alloca i16, align 2
  %__x56 = alloca i16, align 2
  %tmp57 = alloca i16, align 2
  %__x66 = alloca i16, align 2
  %tmp67 = alloca i16, align 2
  %__x69 = alloca i16, align 2
  %tmp70 = alloca i16, align 2
  %__x83 = alloca i16, align 2
  %tmp84 = alloca i16, align 2
  %__x86 = alloca i16, align 2
  %tmp87 = alloca i16, align 2
  %__x96 = alloca i16, align 2
  %tmp97 = alloca i16, align 2
  %__x99 = alloca i16, align 2
  %tmp100 = alloca i16, align 2
  %__x113 = alloca i16, align 2
  %tmp114 = alloca i16, align 2
  %__x116 = alloca i16, align 2
  %tmp117 = alloca i16, align 2
  %__x126 = alloca i16, align 2
  %tmp127 = alloca i16, align 2
  %__x129 = alloca i16, align 2
  %tmp130 = alloca i16, align 2
  %__x146 = alloca i16, align 2
  %tmp147 = alloca i16, align 2
  %__x149 = alloca i16, align 2
  %tmp150 = alloca i16, align 2
  %__x159 = alloca i16, align 2
  %tmp160 = alloca i16, align 2
  %__x162 = alloca i16, align 2
  %tmp163 = alloca i16, align 2
  %__x194 = alloca i16, align 2
  %tmp195 = alloca i16, align 2
  %__x197 = alloca i16, align 2
  %tmp198 = alloca i16, align 2
  %__x207 = alloca i16, align 2
  %tmp208 = alloca i16, align 2
  %__x210 = alloca i16, align 2
  %tmp211 = alloca i16, align 2
  %__x226 = alloca i16, align 2
  %tmp227 = alloca i16, align 2
  %__x229 = alloca i16, align 2
  %tmp230 = alloca i16, align 2
  %__x239 = alloca i16, align 2
  %tmp240 = alloca i16, align 2
  %__x242 = alloca i16, align 2
  %tmp243 = alloca i16, align 2
  %__x258 = alloca i16, align 2
  %tmp259 = alloca i16, align 2
  %__x261 = alloca i16, align 2
  %tmp262 = alloca i16, align 2
  %__x271 = alloca i16, align 2
  %tmp272 = alloca i16, align 2
  %__x274 = alloca i16, align 2
  %tmp275 = alloca i16, align 2
  %__x289 = alloca i16, align 2
  %tmp290 = alloca i16, align 2
  %__x292 = alloca i16, align 2
  %tmp293 = alloca i16, align 2
  %__x302 = alloca i16, align 2
  %tmp303 = alloca i16, align 2
  %__x305 = alloca i16, align 2
  %tmp306 = alloca i16, align 2
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
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 298, i16 zeroext %11), !dbg !418
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
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 298, i16 zeroext %24), !dbg !428
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

while.cond:                                       ; preds = %if.end314, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !440
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !440
  %28 = load i16, i16* %lookup_count, align 2, !dbg !440
  %cmp17 = icmp ult i16 %28, 32, !dbg !441
  br i1 %cmp17, label %while.body, label %while.end315, !dbg !439

while.body:                                       ; preds = %while.cond
  %tmp1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp1, i32 0, i32 1
  %global2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global, i32 0, i32 1
  %tmp3 = load i16, i16* %global2, align 2
  %tmp4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp4, i32 0, i32 1
  %global6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global5, i32 0, i32 1
  store i16 %tmp3, i16* %global6, align 2
  call void @task_generate_key(), !dbg !442
  br label %do.body18, !dbg !444

do.body18:                                        ; preds = %while.body
  %29 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !445
  %cmp19 = icmp eq i16 %29, 1, !dbg !445
  br i1 %cmp19, label %if.then20, label %if.else33, !dbg !448

if.then20:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !449
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %reg_file21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 0, !dbg !449
  %arraydecay22 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file21, i16 0, i16 0, !dbg !449
  call void @__dump_registers(i16* %arraydecay22), !dbg !449
  call void @llvm.dbg.declare(metadata i16* %__x23, metadata !451, metadata !DIExpression()), !dbg !453
  %31 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !453, !srcloc !454
  store i16 %31, i16* %__x23, align 2, !dbg !453
  %32 = load i16, i16* %__x23, align 2, !dbg !453
  store i16 %32, i16* %tmp24, align 2, !dbg !453
  %33 = load i16, i16* %tmp24, align 2, !dbg !453
  %add25 = add i16 %33, 2, !dbg !449
  %34 = inttoptr i16 %add25 to i8*, !dbg !449
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !455, metadata !DIExpression()), !dbg !457
  %35 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !457, !srcloc !458
  store i16 %35, i16* %__x26, align 2, !dbg !457
  %36 = load i16, i16* %__x26, align 2, !dbg !457
  store i16 %36, i16* %tmp27, align 2, !dbg !457
  %37 = load i16, i16* %tmp27, align 2, !dbg !457
  %add28 = add i16 %37, 2, !dbg !449
  %sub29 = sub i16 9216, %add28, !dbg !449
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext %sub29, i16 zeroext -1), !dbg !449
  store i16 %call30, i16* @tmp_stack_crc, align 2, !dbg !449
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %39 = bitcast %struct.camel_buffer_t* %38 to i8*, !dbg !449
  %40 = load i16, i16* @tmp_stack_crc, align 2, !dbg !449
  %call31 = call zeroext i16 @__fast_hw_crc(i8* %39, i16 zeroext 298, i16 zeroext %40), !dbg !449
  store i16 %call31, i16* @tmp_stack_buf_crc, align 2, !dbg !449
  %41 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !449
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %stack_and_buf_crc32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 2, !dbg !449
  store i16 %41, i16* %stack_and_buf_crc32, align 2, !dbg !449
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !449
  br label %if.end46, !dbg !449

if.else33:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !459
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !459
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %reg_file34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !459
  %arraydecay35 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file34, i16 0, i16 0, !dbg !459
  call void @__dump_registers(i16* %arraydecay35), !dbg !459
  call void @llvm.dbg.declare(metadata i16* %__x36, metadata !461, metadata !DIExpression()), !dbg !463
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !463, !srcloc !464
  store i16 %44, i16* %__x36, align 2, !dbg !463
  %45 = load i16, i16* %__x36, align 2, !dbg !463
  store i16 %45, i16* %tmp37, align 2, !dbg !463
  %46 = load i16, i16* %tmp37, align 2, !dbg !463
  %add38 = add i16 %46, 2, !dbg !459
  %47 = inttoptr i16 %add38 to i8*, !dbg !459
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !465, metadata !DIExpression()), !dbg !467
  %48 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !467, !srcloc !468
  store i16 %48, i16* %__x39, align 2, !dbg !467
  %49 = load i16, i16* %__x39, align 2, !dbg !467
  store i16 %49, i16* %tmp40, align 2, !dbg !467
  %50 = load i16, i16* %tmp40, align 2, !dbg !467
  %add41 = add i16 %50, 2, !dbg !459
  %sub42 = sub i16 9216, %add41, !dbg !459
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext %sub42, i16 zeroext -1), !dbg !459
  store i16 %call43, i16* @tmp_stack_crc, align 2, !dbg !459
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %52 = bitcast %struct.camel_buffer_t* %51 to i8*, !dbg !459
  %53 = load i16, i16* @tmp_stack_crc, align 2, !dbg !459
  %call44 = call zeroext i16 @__fast_hw_crc(i8* %52, i16 zeroext 298, i16 zeroext %53), !dbg !459
  store i16 %call44, i16* @tmp_stack_buf_crc, align 2, !dbg !459
  %54 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !459
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !459
  %stack_and_buf_crc45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 2, !dbg !459
  store i16 %54, i16* %stack_and_buf_crc45, align 2, !dbg !459
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !459
  br label %if.end46

if.end46:                                         ; preds = %if.else33, %if.then20
  br label %do.end47, !dbg !448

do.end47:                                         ; preds = %if.end46
  %tmp7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp7, i32 0, i32 1
  %global9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global8, i32 0, i32 1
  %tmp10 = load i16, i16* %global9, align 2
  %tmp12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp12, i32 0, i32 1
  %global14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global13, i32 0, i32 1
  store i16 %tmp10, i16* %global14, align 2
  call void @task_commit(), !dbg !469
  %tmp15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp15, i32 0, i32 1
  %global17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global16, i32 0, i32 1
  %tmp18 = load i16, i16* %global17, align 2
  %tmp19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp19, i32 0, i32 1
  %global21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global20, i32 0, i32 1
  store i16 %tmp18, i16* %global21, align 2
  call void @task_calc_indexes(), !dbg !470
  br label %do.body48, !dbg !471

do.body48:                                        ; preds = %do.end47
  %56 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !472
  %cmp49 = icmp eq i16 %56, 1, !dbg !472
  br i1 %cmp49, label %if.then50, label %if.else63, !dbg !475

if.then50:                                        ; preds = %do.body48
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !476
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !476
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %reg_file51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 0, !dbg !476
  %arraydecay52 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file51, i16 0, i16 0, !dbg !476
  call void @__dump_registers(i16* %arraydecay52), !dbg !476
  call void @llvm.dbg.declare(metadata i16* %__x53, metadata !478, metadata !DIExpression()), !dbg !480
  %58 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !480, !srcloc !481
  store i16 %58, i16* %__x53, align 2, !dbg !480
  %59 = load i16, i16* %__x53, align 2, !dbg !480
  store i16 %59, i16* %tmp54, align 2, !dbg !480
  %60 = load i16, i16* %tmp54, align 2, !dbg !480
  %add55 = add i16 %60, 2, !dbg !476
  %61 = inttoptr i16 %add55 to i8*, !dbg !476
  call void @llvm.dbg.declare(metadata i16* %__x56, metadata !482, metadata !DIExpression()), !dbg !484
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !484, !srcloc !485
  store i16 %62, i16* %__x56, align 2, !dbg !484
  %63 = load i16, i16* %__x56, align 2, !dbg !484
  store i16 %63, i16* %tmp57, align 2, !dbg !484
  %64 = load i16, i16* %tmp57, align 2, !dbg !484
  %add58 = add i16 %64, 2, !dbg !476
  %sub59 = sub i16 9216, %add58, !dbg !476
  %call60 = call zeroext i16 @__fast_hw_crc(i8* %61, i16 zeroext %sub59, i16 zeroext -1), !dbg !476
  store i16 %call60, i16* @tmp_stack_crc, align 2, !dbg !476
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %66 = bitcast %struct.camel_buffer_t* %65 to i8*, !dbg !476
  %67 = load i16, i16* @tmp_stack_crc, align 2, !dbg !476
  %call61 = call zeroext i16 @__fast_hw_crc(i8* %66, i16 zeroext 298, i16 zeroext %67), !dbg !476
  store i16 %call61, i16* @tmp_stack_buf_crc, align 2, !dbg !476
  %68 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !476
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %stack_and_buf_crc62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i32 0, i32 2, !dbg !476
  store i16 %68, i16* %stack_and_buf_crc62, align 2, !dbg !476
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !476
  br label %if.end76, !dbg !476

if.else63:                                        ; preds = %do.body48
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !486
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %reg_file64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %70, i32 0, i32 0, !dbg !486
  %arraydecay65 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file64, i16 0, i16 0, !dbg !486
  call void @__dump_registers(i16* %arraydecay65), !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x66, metadata !488, metadata !DIExpression()), !dbg !490
  %71 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !490, !srcloc !491
  store i16 %71, i16* %__x66, align 2, !dbg !490
  %72 = load i16, i16* %__x66, align 2, !dbg !490
  store i16 %72, i16* %tmp67, align 2, !dbg !490
  %73 = load i16, i16* %tmp67, align 2, !dbg !490
  %add68 = add i16 %73, 2, !dbg !486
  %74 = inttoptr i16 %add68 to i8*, !dbg !486
  call void @llvm.dbg.declare(metadata i16* %__x69, metadata !492, metadata !DIExpression()), !dbg !494
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !494, !srcloc !495
  store i16 %75, i16* %__x69, align 2, !dbg !494
  %76 = load i16, i16* %__x69, align 2, !dbg !494
  store i16 %76, i16* %tmp70, align 2, !dbg !494
  %77 = load i16, i16* %tmp70, align 2, !dbg !494
  %add71 = add i16 %77, 2, !dbg !486
  %sub72 = sub i16 9216, %add71, !dbg !486
  %call73 = call zeroext i16 @__fast_hw_crc(i8* %74, i16 zeroext %sub72, i16 zeroext -1), !dbg !486
  store i16 %call73, i16* @tmp_stack_crc, align 2, !dbg !486
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %79 = bitcast %struct.camel_buffer_t* %78 to i8*, !dbg !486
  %80 = load i16, i16* @tmp_stack_crc, align 2, !dbg !486
  %call74 = call zeroext i16 @__fast_hw_crc(i8* %79, i16 zeroext 298, i16 zeroext %80), !dbg !486
  store i16 %call74, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %81 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !486
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %stack_and_buf_crc75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %82, i32 0, i32 2, !dbg !486
  store i16 %81, i16* %stack_and_buf_crc75, align 2, !dbg !486
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !486
  br label %if.end76

if.end76:                                         ; preds = %if.else63, %if.then50
  br label %do.end77, !dbg !475

do.end77:                                         ; preds = %if.end76
  %tmp22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp22, i32 0, i32 1
  %global24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global23, i32 0, i32 2
  %tmp25 = load i16, i16* %global24, align 2
  %tmp26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp26, i32 0, i32 1
  %global28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global27, i32 0, i32 2
  store i16 %tmp25, i16* %global28, align 2
  call void @task_commit(), !dbg !496
  %tmp29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp29, i32 0, i32 1
  %global31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global30, i32 0, i32 1
  %tmp32 = load i16, i16* %global31, align 2
  %tmp33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp33, i32 0, i32 1
  %global35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global34, i32 0, i32 1
  store i16 %tmp32, i16* %global35, align 2
  call void @task_calc_indexes_index_1(), !dbg !497
  br label %do.body78, !dbg !498

do.body78:                                        ; preds = %do.end77
  %83 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !499
  %cmp79 = icmp eq i16 %83, 1, !dbg !499
  br i1 %cmp79, label %if.then80, label %if.else93, !dbg !502

if.then80:                                        ; preds = %do.body78
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !503
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !503
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %reg_file81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 0, !dbg !503
  %arraydecay82 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file81, i16 0, i16 0, !dbg !503
  call void @__dump_registers(i16* %arraydecay82), !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x83, metadata !505, metadata !DIExpression()), !dbg !507
  %85 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !507, !srcloc !508
  store i16 %85, i16* %__x83, align 2, !dbg !507
  %86 = load i16, i16* %__x83, align 2, !dbg !507
  store i16 %86, i16* %tmp84, align 2, !dbg !507
  %87 = load i16, i16* %tmp84, align 2, !dbg !507
  %add85 = add i16 %87, 2, !dbg !503
  %88 = inttoptr i16 %add85 to i8*, !dbg !503
  call void @llvm.dbg.declare(metadata i16* %__x86, metadata !509, metadata !DIExpression()), !dbg !511
  %89 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !511, !srcloc !512
  store i16 %89, i16* %__x86, align 2, !dbg !511
  %90 = load i16, i16* %__x86, align 2, !dbg !511
  store i16 %90, i16* %tmp87, align 2, !dbg !511
  %91 = load i16, i16* %tmp87, align 2, !dbg !511
  %add88 = add i16 %91, 2, !dbg !503
  %sub89 = sub i16 9216, %add88, !dbg !503
  %call90 = call zeroext i16 @__fast_hw_crc(i8* %88, i16 zeroext %sub89, i16 zeroext -1), !dbg !503
  store i16 %call90, i16* @tmp_stack_crc, align 2, !dbg !503
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %93 = bitcast %struct.camel_buffer_t* %92 to i8*, !dbg !503
  %94 = load i16, i16* @tmp_stack_crc, align 2, !dbg !503
  %call91 = call zeroext i16 @__fast_hw_crc(i8* %93, i16 zeroext 298, i16 zeroext %94), !dbg !503
  store i16 %call91, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %95 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !503
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !503
  %stack_and_buf_crc92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %96, i32 0, i32 2, !dbg !503
  store i16 %95, i16* %stack_and_buf_crc92, align 2, !dbg !503
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !503
  br label %if.end106, !dbg !503

if.else93:                                        ; preds = %do.body78
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !513
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !513
  %97 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %reg_file94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %97, i32 0, i32 0, !dbg !513
  %arraydecay95 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file94, i16 0, i16 0, !dbg !513
  call void @__dump_registers(i16* %arraydecay95), !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x96, metadata !515, metadata !DIExpression()), !dbg !517
  %98 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !517, !srcloc !518
  store i16 %98, i16* %__x96, align 2, !dbg !517
  %99 = load i16, i16* %__x96, align 2, !dbg !517
  store i16 %99, i16* %tmp97, align 2, !dbg !517
  %100 = load i16, i16* %tmp97, align 2, !dbg !517
  %add98 = add i16 %100, 2, !dbg !513
  %101 = inttoptr i16 %add98 to i8*, !dbg !513
  call void @llvm.dbg.declare(metadata i16* %__x99, metadata !519, metadata !DIExpression()), !dbg !521
  %102 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !521, !srcloc !522
  store i16 %102, i16* %__x99, align 2, !dbg !521
  %103 = load i16, i16* %__x99, align 2, !dbg !521
  store i16 %103, i16* %tmp100, align 2, !dbg !521
  %104 = load i16, i16* %tmp100, align 2, !dbg !521
  %add101 = add i16 %104, 2, !dbg !513
  %sub102 = sub i16 9216, %add101, !dbg !513
  %call103 = call zeroext i16 @__fast_hw_crc(i8* %101, i16 zeroext %sub102, i16 zeroext -1), !dbg !513
  store i16 %call103, i16* @tmp_stack_crc, align 2, !dbg !513
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %106 = bitcast %struct.camel_buffer_t* %105 to i8*, !dbg !513
  %107 = load i16, i16* @tmp_stack_crc, align 2, !dbg !513
  %call104 = call zeroext i16 @__fast_hw_crc(i8* %106, i16 zeroext 298, i16 zeroext %107), !dbg !513
  store i16 %call104, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %108 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !513
  %109 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !513
  %stack_and_buf_crc105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %109, i32 0, i32 2, !dbg !513
  store i16 %108, i16* %stack_and_buf_crc105, align 2, !dbg !513
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !513
  br label %if.end106

if.end106:                                        ; preds = %if.else93, %if.then80
  br label %do.end107, !dbg !502

do.end107:                                        ; preds = %if.end106
  %tmp36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp36, i32 0, i32 1
  %global38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global37, i32 0, i32 3
  %tmp39 = load i16, i16* %global38, align 2
  %tmp41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp41, i32 0, i32 1
  %global43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global42, i32 0, i32 3
  store i16 %tmp39, i16* %global43, align 2
  call void @task_commit(), !dbg !523
  %tmp44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp44, i32 0, i32 1
  %global46 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global45, i32 0, i32 2
  %tmp47 = load i16, i16* %global46, align 2
  %tmp48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp48, i32 0, i32 1
  %global50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global49, i32 0, i32 2
  store i16 %tmp47, i16* %global50, align 2
  %tmp51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global52 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp51, i32 0, i32 1
  %global53 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global52, i32 0, i32 3
  %tmp55 = load i16, i16* %global53, align 2
  %tmp56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp56, i32 0, i32 1
  %global58 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global57, i32 0, i32 3
  store i16 %tmp55, i16* %global58, align 2
  call void @task_calc_indexes_index_2(), !dbg !524
  br label %do.body108, !dbg !525

do.body108:                                       ; preds = %do.end107
  %110 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !526
  %cmp109 = icmp eq i16 %110, 1, !dbg !526
  br i1 %cmp109, label %if.then110, label %if.else123, !dbg !529

if.then110:                                       ; preds = %do.body108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !530
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !530
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %reg_file111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %111, i32 0, i32 0, !dbg !530
  %arraydecay112 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file111, i16 0, i16 0, !dbg !530
  call void @__dump_registers(i16* %arraydecay112), !dbg !530
  call void @llvm.dbg.declare(metadata i16* %__x113, metadata !532, metadata !DIExpression()), !dbg !534
  %112 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !534, !srcloc !535
  store i16 %112, i16* %__x113, align 2, !dbg !534
  %113 = load i16, i16* %__x113, align 2, !dbg !534
  store i16 %113, i16* %tmp114, align 2, !dbg !534
  %114 = load i16, i16* %tmp114, align 2, !dbg !534
  %add115 = add i16 %114, 2, !dbg !530
  %115 = inttoptr i16 %add115 to i8*, !dbg !530
  call void @llvm.dbg.declare(metadata i16* %__x116, metadata !536, metadata !DIExpression()), !dbg !538
  %116 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !538, !srcloc !539
  store i16 %116, i16* %__x116, align 2, !dbg !538
  %117 = load i16, i16* %__x116, align 2, !dbg !538
  store i16 %117, i16* %tmp117, align 2, !dbg !538
  %118 = load i16, i16* %tmp117, align 2, !dbg !538
  %add118 = add i16 %118, 2, !dbg !530
  %sub119 = sub i16 9216, %add118, !dbg !530
  %call120 = call zeroext i16 @__fast_hw_crc(i8* %115, i16 zeroext %sub119, i16 zeroext -1), !dbg !530
  store i16 %call120, i16* @tmp_stack_crc, align 2, !dbg !530
  %119 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %120 = bitcast %struct.camel_buffer_t* %119 to i8*, !dbg !530
  %121 = load i16, i16* @tmp_stack_crc, align 2, !dbg !530
  %call121 = call zeroext i16 @__fast_hw_crc(i8* %120, i16 zeroext 298, i16 zeroext %121), !dbg !530
  store i16 %call121, i16* @tmp_stack_buf_crc, align 2, !dbg !530
  %122 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !530
  %123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !530
  %stack_and_buf_crc122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %123, i32 0, i32 2, !dbg !530
  store i16 %122, i16* %stack_and_buf_crc122, align 2, !dbg !530
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !530
  br label %if.end136, !dbg !530

if.else123:                                       ; preds = %do.body108
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !540
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !540
  %124 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %reg_file124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %124, i32 0, i32 0, !dbg !540
  %arraydecay125 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file124, i16 0, i16 0, !dbg !540
  call void @__dump_registers(i16* %arraydecay125), !dbg !540
  call void @llvm.dbg.declare(metadata i16* %__x126, metadata !542, metadata !DIExpression()), !dbg !544
  %125 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !544, !srcloc !545
  store i16 %125, i16* %__x126, align 2, !dbg !544
  %126 = load i16, i16* %__x126, align 2, !dbg !544
  store i16 %126, i16* %tmp127, align 2, !dbg !544
  %127 = load i16, i16* %tmp127, align 2, !dbg !544
  %add128 = add i16 %127, 2, !dbg !540
  %128 = inttoptr i16 %add128 to i8*, !dbg !540
  call void @llvm.dbg.declare(metadata i16* %__x129, metadata !546, metadata !DIExpression()), !dbg !548
  %129 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !548, !srcloc !549
  store i16 %129, i16* %__x129, align 2, !dbg !548
  %130 = load i16, i16* %__x129, align 2, !dbg !548
  store i16 %130, i16* %tmp130, align 2, !dbg !548
  %131 = load i16, i16* %tmp130, align 2, !dbg !548
  %add131 = add i16 %131, 2, !dbg !540
  %sub132 = sub i16 9216, %add131, !dbg !540
  %call133 = call zeroext i16 @__fast_hw_crc(i8* %128, i16 zeroext %sub132, i16 zeroext -1), !dbg !540
  store i16 %call133, i16* @tmp_stack_crc, align 2, !dbg !540
  %132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %133 = bitcast %struct.camel_buffer_t* %132 to i8*, !dbg !540
  %134 = load i16, i16* @tmp_stack_crc, align 2, !dbg !540
  %call134 = call zeroext i16 @__fast_hw_crc(i8* %133, i16 zeroext 298, i16 zeroext %134), !dbg !540
  store i16 %call134, i16* @tmp_stack_buf_crc, align 2, !dbg !540
  %135 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !540
  %136 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !540
  %stack_and_buf_crc135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %136, i32 0, i32 2, !dbg !540
  store i16 %135, i16* %stack_and_buf_crc135, align 2, !dbg !540
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !540
  br label %if.end136

if.end136:                                        ; preds = %if.else123, %if.then110
  br label %do.end137, !dbg !529

do.end137:                                        ; preds = %if.end136
  %tmp59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp59, i32 0, i32 1
  %global61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global60, i32 0, i32 4
  %tmp62 = load i16, i16* %global61, align 2
  %tmp63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp63, i32 0, i32 1
  %global65 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global64, i32 0, i32 4
  store i16 %tmp62, i16* %global65, align 2
  call void @task_commit(), !dbg !550
  %137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !551
  %globals138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %137, i32 0, i32 1, !dbg !551
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals138, i32 0, i32 6, !dbg !551
  %138 = load i16, i16* %insert_count, align 2, !dbg !551
  %cmp139 = icmp ult i16 %138, 32, !dbg !553
  br i1 %cmp139, label %if.then140, label %if.else251, !dbg !554

if.then140:                                       ; preds = %do.end137
  %tmp66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp66, i32 0, i32 1
  %global68 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global67, i32 0, i32 3
  %tmp69 = load i16, i16* %global68, align 2
  %tmp71 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp71, i32 0, i32 1
  %global73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global72, i32 0, i32 3
  store i16 %tmp69, i16* %global73, align 2
  %tmp74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp74, i32 0, i32 1
  %global76 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global75, i32 0, i32 0
  %array = getelementptr inbounds [128 x i16], [128 x i16]* %global76, i16 0, i16 0
  %cast = bitcast i16* %array to i8*
  %tmp77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp77, i32 0, i32 1
  %global79 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global78, i32 0, i32 0
  %array80 = getelementptr inbounds [128 x i16], [128 x i16]* %global79, i16 0, i16 0
  %cast81 = bitcast i16* %array80 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast, i8* align 2 %cast81, i64 2, i1 false), !dbg !555
  %tmp82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp82, i32 0, i32 1
  %global84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global83, i32 0, i32 2
  %tmp85 = load i16, i16* %global84, align 2
  %tmp86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp86, i32 0, i32 1
  %global88 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global87, i32 0, i32 2
  store i16 %tmp85, i16* %global88, align 2
  %tmp89 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp89, i32 0, i32 1
  %global91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global90, i32 0, i32 4
  %tmp92 = load i16, i16* %global91, align 2
  %tmp93 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global94 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp93, i32 0, i32 1
  %global95 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global94, i32 0, i32 4
  store i16 %tmp92, i16* %global95, align 2
  call void @task_add(), !dbg !555
  br label %do.body141, !dbg !557

do.body141:                                       ; preds = %if.then140
  %139 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !558
  %cmp142 = icmp eq i16 %139, 1, !dbg !558
  br i1 %cmp142, label %if.then143, label %if.else156, !dbg !561

if.then143:                                       ; preds = %do.body141
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !562
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !562
  %140 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %reg_file144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %140, i32 0, i32 0, !dbg !562
  %arraydecay145 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file144, i16 0, i16 0, !dbg !562
  call void @__dump_registers(i16* %arraydecay145), !dbg !562
  call void @llvm.dbg.declare(metadata i16* %__x146, metadata !564, metadata !DIExpression()), !dbg !566
  %141 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !566, !srcloc !567
  store i16 %141, i16* %__x146, align 2, !dbg !566
  %142 = load i16, i16* %__x146, align 2, !dbg !566
  store i16 %142, i16* %tmp147, align 2, !dbg !566
  %143 = load i16, i16* %tmp147, align 2, !dbg !566
  %add148 = add i16 %143, 2, !dbg !562
  %144 = inttoptr i16 %add148 to i8*, !dbg !562
  call void @llvm.dbg.declare(metadata i16* %__x149, metadata !568, metadata !DIExpression()), !dbg !570
  %145 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !570, !srcloc !571
  store i16 %145, i16* %__x149, align 2, !dbg !570
  %146 = load i16, i16* %__x149, align 2, !dbg !570
  store i16 %146, i16* %tmp150, align 2, !dbg !570
  %147 = load i16, i16* %tmp150, align 2, !dbg !570
  %add151 = add i16 %147, 2, !dbg !562
  %sub152 = sub i16 9216, %add151, !dbg !562
  %call153 = call zeroext i16 @__fast_hw_crc(i8* %144, i16 zeroext %sub152, i16 zeroext -1), !dbg !562
  store i16 %call153, i16* @tmp_stack_crc, align 2, !dbg !562
  %148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %149 = bitcast %struct.camel_buffer_t* %148 to i8*, !dbg !562
  %150 = load i16, i16* @tmp_stack_crc, align 2, !dbg !562
  %call154 = call zeroext i16 @__fast_hw_crc(i8* %149, i16 zeroext 298, i16 zeroext %150), !dbg !562
  store i16 %call154, i16* @tmp_stack_buf_crc, align 2, !dbg !562
  %151 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !562
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !562
  %stack_and_buf_crc155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 2, !dbg !562
  store i16 %151, i16* %stack_and_buf_crc155, align 2, !dbg !562
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !562
  br label %if.end169, !dbg !562

if.else156:                                       ; preds = %do.body141
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !572
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !572
  %153 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %reg_file157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %153, i32 0, i32 0, !dbg !572
  %arraydecay158 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file157, i16 0, i16 0, !dbg !572
  call void @__dump_registers(i16* %arraydecay158), !dbg !572
  call void @llvm.dbg.declare(metadata i16* %__x159, metadata !574, metadata !DIExpression()), !dbg !576
  %154 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !576, !srcloc !577
  store i16 %154, i16* %__x159, align 2, !dbg !576
  %155 = load i16, i16* %__x159, align 2, !dbg !576
  store i16 %155, i16* %tmp160, align 2, !dbg !576
  %156 = load i16, i16* %tmp160, align 2, !dbg !576
  %add161 = add i16 %156, 2, !dbg !572
  %157 = inttoptr i16 %add161 to i8*, !dbg !572
  call void @llvm.dbg.declare(metadata i16* %__x162, metadata !578, metadata !DIExpression()), !dbg !580
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !580, !srcloc !581
  store i16 %158, i16* %__x162, align 2, !dbg !580
  %159 = load i16, i16* %__x162, align 2, !dbg !580
  store i16 %159, i16* %tmp163, align 2, !dbg !580
  %160 = load i16, i16* %tmp163, align 2, !dbg !580
  %add164 = add i16 %160, 2, !dbg !572
  %sub165 = sub i16 9216, %add164, !dbg !572
  %call166 = call zeroext i16 @__fast_hw_crc(i8* %157, i16 zeroext %sub165, i16 zeroext -1), !dbg !572
  store i16 %call166, i16* @tmp_stack_crc, align 2, !dbg !572
  %161 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %162 = bitcast %struct.camel_buffer_t* %161 to i8*, !dbg !572
  %163 = load i16, i16* @tmp_stack_crc, align 2, !dbg !572
  %call167 = call zeroext i16 @__fast_hw_crc(i8* %162, i16 zeroext 298, i16 zeroext %163), !dbg !572
  store i16 %call167, i16* @tmp_stack_buf_crc, align 2, !dbg !572
  %164 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !572
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !572
  %stack_and_buf_crc168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %165, i32 0, i32 2, !dbg !572
  store i16 %164, i16* %stack_and_buf_crc168, align 2, !dbg !572
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !572
  br label %if.end169

if.end169:                                        ; preds = %if.else156, %if.then143
  br label %do.end170, !dbg !561

do.end170:                                        ; preds = %if.end169
  %tmp96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global97 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp96, i32 0, i32 1
  %global98 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global97, i32 0, i32 10
  %tmp99 = load i8, i8* %global98, align 2
  %tmp101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp101, i32 0, i32 1
  %global103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global102, i32 0, i32 10
  store i8 %tmp99, i8* %global103, align 2
  %tmp104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp104, i32 0, i32 1
  %global106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global105, i32 0, i32 0
  %tmp107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp107, i32 0, i32 1
  %global109 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global108, i32 0, i32 3
  %load = load i16, i16* %global109, align 2
  %access = getelementptr inbounds [128 x i16], [128 x i16]* %global106, i16 0, i16 %load
  %tmp110 = load i16, i16* %access, align 2
  %tmp111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp111, i32 0, i32 1
  %global113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global112, i32 0, i32 0
  %tmp115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp115, i32 0, i32 1
  %global117 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global116, i32 0, i32 3
  %load118 = load i16, i16* %global117, align 2
  %access119 = getelementptr inbounds [128 x i16], [128 x i16]* %global113, i16 0, i16 %load118
  store i16 %tmp110, i16* %access119, align 2
  %tmp120 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global121 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp120, i32 0, i32 1
  %global122 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global121, i32 0, i32 0
  %tmp123 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global124 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp123, i32 0, i32 1
  %global125 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global124, i32 0, i32 4
  %load126 = load i16, i16* %global125, align 2
  %access127 = getelementptr inbounds [128 x i16], [128 x i16]* %global122, i16 0, i16 %load126
  %tmp128 = load i16, i16* %access127, align 2
  %tmp129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp129, i32 0, i32 1
  %global131 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global130, i32 0, i32 0
  %tmp132 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp132, i32 0, i32 1
  %global134 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global133, i32 0, i32 4
  %load135 = load i16, i16* %global134, align 2
  %access136 = getelementptr inbounds [128 x i16], [128 x i16]* %global131, i16 0, i16 %load135
  store i16 %tmp128, i16* %access136, align 2
  %tmp137 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp137, i32 0, i32 1
  %global139 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global138, i32 0, i32 0
  %tmp140 = load i16, i16* @index_victim, align 2
  %access141 = getelementptr inbounds [128 x i16], [128 x i16]* %global139, i16 0, i16 %tmp140
  %tmp142 = load i16, i16* %access141, align 2
  %tmp143 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp143, i32 0, i32 1
  %global145 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global144, i32 0, i32 0
  %tmp146 = load i16, i16* @index_victim, align 2
  %access147 = getelementptr inbounds [128 x i16], [128 x i16]* %global145, i16 0, i16 %tmp146
  store i16 %tmp142, i16* %access147, align 2
  %tmp148 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp148, i32 0, i32 1
  %global150 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global149, i32 0, i32 3
  %tmp151 = load i16, i16* %global150, align 2
  %tmp152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp152, i32 0, i32 1
  %global154 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global153, i32 0, i32 3
  store i16 %tmp151, i16* %global154, align 2
  %tmp155 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp155, i32 0, i32 1
  %global157 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global156, i32 0, i32 2
  %tmp158 = load i16, i16* %global157, align 2
  %tmp159 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global160 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp159, i32 0, i32 1
  %global161 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global160, i32 0, i32 2
  store i16 %tmp158, i16* %global161, align 2
  %tmp162 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global163 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp162, i32 0, i32 1
  %global164 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global163, i32 0, i32 5
  %tmp165 = load i16, i16* %global164, align 2
  %tmp166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global167 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp166, i32 0, i32 1
  %global168 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global167, i32 0, i32 5
  store i16 %tmp165, i16* %global168, align 2
  call void @task_commit(), !dbg !582
  %166 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !583
  %globals171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %166, i32 0, i32 1, !dbg !583
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals171, i32 0, i32 0, !dbg !583
  %167 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !585
  %globals172 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %167, i32 0, i32 1, !dbg !585
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals172, i32 0, i32 3, !dbg !585
  %168 = load i16, i16* %index1, align 2, !dbg !585
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %168, !dbg !583
  %169 = load i16, i16* %arrayidx, align 2, !dbg !583
  %tobool = icmp ne i16 %169, 0, !dbg !583
  br i1 %tobool, label %land.lhs.true, label %if.end219, !dbg !586

land.lhs.true:                                    ; preds = %do.end170
  %170 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !587
  %globals173 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %170, i32 0, i32 1, !dbg !587
  %filter174 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals173, i32 0, i32 0, !dbg !587
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !588
  %globals175 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %171, i32 0, i32 1, !dbg !588
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals175, i32 0, i32 4, !dbg !588
  %172 = load i16, i16* %index2, align 2, !dbg !588
  %arrayidx176 = getelementptr inbounds [128 x i16], [128 x i16]* %filter174, i16 0, i16 %172, !dbg !587
  %173 = load i16, i16* %arrayidx176, align 2, !dbg !587
  %tobool177 = icmp ne i16 %173, 0, !dbg !587
  br i1 %tobool177, label %if.then178, label %if.end219, !dbg !589

if.then178:                                       ; preds = %land.lhs.true
  br label %while.cond179, !dbg !590

while.cond179:                                    ; preds = %do.end218, %if.then178
  %174 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !592
  %globals180 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %174, i32 0, i32 1, !dbg !592
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals180, i32 0, i32 10, !dbg !592
  %175 = load i8, i8* %success, align 2, !dbg !592
  %tobool181 = trunc i8 %175 to i1, !dbg !592
  %conv = zext i1 %tobool181 to i16, !dbg !592
  %cmp182 = icmp eq i16 %conv, 0, !dbg !593
  br i1 %cmp182, label %land.rhs, label %land.end, !dbg !594

land.rhs:                                         ; preds = %while.cond179
  %176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !595
  %globals184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %176, i32 0, i32 1, !dbg !595
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals184, i32 0, i32 5, !dbg !595
  %177 = load i16, i16* %relocation_count, align 2, !dbg !595
  %cmp185 = icmp ult i16 %177, 8, !dbg !596
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond179
  %178 = phi i1 [ false, %while.cond179 ], [ %cmp185, %land.rhs ], !dbg !597
  br i1 %178, label %while.body187, label %while.end, !dbg !590

while.body187:                                    ; preds = %land.end
  %tmp169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp169, i32 0, i32 1
  %global171 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global170, i32 0, i32 2
  %tmp172 = load i16, i16* %global171, align 2
  %tmp173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global174 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp173, i32 0, i32 1
  %global175 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global174, i32 0, i32 2
  store i16 %tmp172, i16* %global175, align 2
  %tmp176 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global177 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp176, i32 0, i32 1
  %global178 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global177, i32 0, i32 3
  %tmp179 = load i16, i16* %global178, align 2
  %tmp180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp180, i32 0, i32 1
  %global182 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global181, i32 0, i32 3
  store i16 %tmp179, i16* %global182, align 2
  %tmp183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global184 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp183, i32 0, i32 1
  %global185 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global184, i32 0, i32 0
  %array186 = getelementptr inbounds [128 x i16], [128 x i16]* %global185, i16 0, i16 0
  %cast187 = bitcast i16* %array186 to i8*
  %tmp188 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp188, i32 0, i32 1
  %global190 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global189, i32 0, i32 0
  %array191 = getelementptr inbounds [128 x i16], [128 x i16]* %global190, i16 0, i16 0
  %cast192 = bitcast i16* %array191 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast187, i8* align 2 %cast192, i64 2, i1 false), !dbg !598
  %tmp193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp193, i32 0, i32 1
  %global195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global194, i32 0, i32 5
  %tmp196 = load i16, i16* %global195, align 2
  %tmp197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global198 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp197, i32 0, i32 1
  %global199 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global198, i32 0, i32 5
  store i16 %tmp196, i16* %global199, align 2
  call void @task_relocate(), !dbg !598
  br label %do.body188, !dbg !600

do.body188:                                       ; preds = %while.body187
  %179 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !601
  %cmp189 = icmp eq i16 %179, 1, !dbg !601
  br i1 %cmp189, label %if.then191, label %if.else204, !dbg !604

if.then191:                                       ; preds = %do.body188
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !605
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !605
  %180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %reg_file192 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %180, i32 0, i32 0, !dbg !605
  %arraydecay193 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file192, i16 0, i16 0, !dbg !605
  call void @__dump_registers(i16* %arraydecay193), !dbg !605
  call void @llvm.dbg.declare(metadata i16* %__x194, metadata !607, metadata !DIExpression()), !dbg !609
  %181 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !609, !srcloc !610
  store i16 %181, i16* %__x194, align 2, !dbg !609
  %182 = load i16, i16* %__x194, align 2, !dbg !609
  store i16 %182, i16* %tmp195, align 2, !dbg !609
  %183 = load i16, i16* %tmp195, align 2, !dbg !609
  %add196 = add i16 %183, 2, !dbg !605
  %184 = inttoptr i16 %add196 to i8*, !dbg !605
  call void @llvm.dbg.declare(metadata i16* %__x197, metadata !611, metadata !DIExpression()), !dbg !613
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !613, !srcloc !614
  store i16 %185, i16* %__x197, align 2, !dbg !613
  %186 = load i16, i16* %__x197, align 2, !dbg !613
  store i16 %186, i16* %tmp198, align 2, !dbg !613
  %187 = load i16, i16* %tmp198, align 2, !dbg !613
  %add199 = add i16 %187, 2, !dbg !605
  %sub200 = sub i16 9216, %add199, !dbg !605
  %call201 = call zeroext i16 @__fast_hw_crc(i8* %184, i16 zeroext %sub200, i16 zeroext -1), !dbg !605
  store i16 %call201, i16* @tmp_stack_crc, align 2, !dbg !605
  %188 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %189 = bitcast %struct.camel_buffer_t* %188 to i8*, !dbg !605
  %190 = load i16, i16* @tmp_stack_crc, align 2, !dbg !605
  %call202 = call zeroext i16 @__fast_hw_crc(i8* %189, i16 zeroext 298, i16 zeroext %190), !dbg !605
  store i16 %call202, i16* @tmp_stack_buf_crc, align 2, !dbg !605
  %191 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !605
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !605
  %stack_and_buf_crc203 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %192, i32 0, i32 2, !dbg !605
  store i16 %191, i16* %stack_and_buf_crc203, align 2, !dbg !605
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !605
  br label %if.end217, !dbg !605

if.else204:                                       ; preds = %do.body188
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !615
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !615
  %193 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %reg_file205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %193, i32 0, i32 0, !dbg !615
  %arraydecay206 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file205, i16 0, i16 0, !dbg !615
  call void @__dump_registers(i16* %arraydecay206), !dbg !615
  call void @llvm.dbg.declare(metadata i16* %__x207, metadata !617, metadata !DIExpression()), !dbg !619
  %194 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !619, !srcloc !620
  store i16 %194, i16* %__x207, align 2, !dbg !619
  %195 = load i16, i16* %__x207, align 2, !dbg !619
  store i16 %195, i16* %tmp208, align 2, !dbg !619
  %196 = load i16, i16* %tmp208, align 2, !dbg !619
  %add209 = add i16 %196, 2, !dbg !615
  %197 = inttoptr i16 %add209 to i8*, !dbg !615
  call void @llvm.dbg.declare(metadata i16* %__x210, metadata !621, metadata !DIExpression()), !dbg !623
  %198 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !623, !srcloc !624
  store i16 %198, i16* %__x210, align 2, !dbg !623
  %199 = load i16, i16* %__x210, align 2, !dbg !623
  store i16 %199, i16* %tmp211, align 2, !dbg !623
  %200 = load i16, i16* %tmp211, align 2, !dbg !623
  %add212 = add i16 %200, 2, !dbg !615
  %sub213 = sub i16 9216, %add212, !dbg !615
  %call214 = call zeroext i16 @__fast_hw_crc(i8* %197, i16 zeroext %sub213, i16 zeroext -1), !dbg !615
  store i16 %call214, i16* @tmp_stack_crc, align 2, !dbg !615
  %201 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %202 = bitcast %struct.camel_buffer_t* %201 to i8*, !dbg !615
  %203 = load i16, i16* @tmp_stack_crc, align 2, !dbg !615
  %call215 = call zeroext i16 @__fast_hw_crc(i8* %202, i16 zeroext 298, i16 zeroext %203), !dbg !615
  store i16 %call215, i16* @tmp_stack_buf_crc, align 2, !dbg !615
  %204 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !615
  %205 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !615
  %stack_and_buf_crc216 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %205, i32 0, i32 2, !dbg !615
  store i16 %204, i16* %stack_and_buf_crc216, align 2, !dbg !615
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !615
  br label %if.end217

if.end217:                                        ; preds = %if.else204, %if.then191
  br label %do.end218, !dbg !604

do.end218:                                        ; preds = %if.end217
  %tmp200 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global201 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp200, i32 0, i32 1
  %global202 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global201, i32 0, i32 10
  %tmp203 = load i8, i8* %global202, align 2
  %tmp204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global205 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp204, i32 0, i32 1
  %global206 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global205, i32 0, i32 10
  store i8 %tmp203, i8* %global206, align 2
  %tmp207 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global208 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp207, i32 0, i32 1
  %global209 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global208, i32 0, i32 0
  %tmp210 = load i16, i16* @index2_victim, align 2
  %access211 = getelementptr inbounds [128 x i16], [128 x i16]* %global209, i16 0, i16 %tmp210
  %tmp212 = load i16, i16* %access211, align 2
  %tmp213 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global214 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp213, i32 0, i32 1
  %global215 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global214, i32 0, i32 0
  %tmp216 = load i16, i16* @index2_victim, align 2
  %access217 = getelementptr inbounds [128 x i16], [128 x i16]* %global215, i16 0, i16 %tmp216
  store i16 %tmp212, i16* %access217, align 2
  %tmp218 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global219 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp218, i32 0, i32 1
  %global220 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global219, i32 0, i32 5
  %tmp221 = load i16, i16* %global220, align 2
  %tmp222 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global223 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp222, i32 0, i32 1
  %global224 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global223, i32 0, i32 5
  store i16 %tmp221, i16* %global224, align 2
  %tmp225 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global226 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp225, i32 0, i32 1
  %global227 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global226, i32 0, i32 3
  %tmp228 = load i16, i16* %global227, align 2
  %tmp229 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global230 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp229, i32 0, i32 1
  %global231 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global230, i32 0, i32 3
  store i16 %tmp228, i16* %global231, align 2
  %tmp232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global233 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp232, i32 0, i32 1
  %global234 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global233, i32 0, i32 2
  %tmp235 = load i16, i16* %global234, align 2
  %tmp236 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp236, i32 0, i32 1
  %global238 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global237, i32 0, i32 2
  store i16 %tmp235, i16* %global238, align 2
  call void @task_commit(), !dbg !625
  br label %while.cond179, !dbg !590, !llvm.loop !626

while.end:                                        ; preds = %land.end
  br label %if.end219, !dbg !628

if.end219:                                        ; preds = %while.end, %land.lhs.true, %do.end170
  %tmp239 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global240 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp239, i32 0, i32 1
  %global241 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global240, i32 0, i32 6
  %tmp242 = load i16, i16* %global241, align 2
  %tmp244 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global245 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp244, i32 0, i32 1
  %global246 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global245, i32 0, i32 6
  store i16 %tmp242, i16* %global246, align 2
  %tmp247 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp247, i32 0, i32 1
  %global249 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global248, i32 0, i32 10
  %tmp250 = load i8, i8* %global249, align 2
  %tmp251 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp251, i32 0, i32 1
  %global253 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global252, i32 0, i32 10
  store i8 %tmp250, i8* %global253, align 2
  %tmp254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global255 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp254, i32 0, i32 1
  %global256 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global255, i32 0, i32 7
  %tmp257 = load i16, i16* %global256, align 2
  %tmp258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global259 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp258, i32 0, i32 1
  %global260 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global259, i32 0, i32 7
  store i16 %tmp257, i16* %global260, align 2
  call void @task_insert_done(), !dbg !629
  br label %do.body220, !dbg !630

do.body220:                                       ; preds = %if.end219
  %206 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !631
  %cmp221 = icmp eq i16 %206, 1, !dbg !631
  br i1 %cmp221, label %if.then223, label %if.else236, !dbg !634

if.then223:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !635
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !635
  %207 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %reg_file224 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %207, i32 0, i32 0, !dbg !635
  %arraydecay225 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file224, i16 0, i16 0, !dbg !635
  call void @__dump_registers(i16* %arraydecay225), !dbg !635
  call void @llvm.dbg.declare(metadata i16* %__x226, metadata !637, metadata !DIExpression()), !dbg !639
  %208 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !639, !srcloc !640
  store i16 %208, i16* %__x226, align 2, !dbg !639
  %209 = load i16, i16* %__x226, align 2, !dbg !639
  store i16 %209, i16* %tmp227, align 2, !dbg !639
  %210 = load i16, i16* %tmp227, align 2, !dbg !639
  %add228 = add i16 %210, 2, !dbg !635
  %211 = inttoptr i16 %add228 to i8*, !dbg !635
  call void @llvm.dbg.declare(metadata i16* %__x229, metadata !641, metadata !DIExpression()), !dbg !643
  %212 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !643, !srcloc !644
  store i16 %212, i16* %__x229, align 2, !dbg !643
  %213 = load i16, i16* %__x229, align 2, !dbg !643
  store i16 %213, i16* %tmp230, align 2, !dbg !643
  %214 = load i16, i16* %tmp230, align 2, !dbg !643
  %add231 = add i16 %214, 2, !dbg !635
  %sub232 = sub i16 9216, %add231, !dbg !635
  %call233 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext %sub232, i16 zeroext -1), !dbg !635
  store i16 %call233, i16* @tmp_stack_crc, align 2, !dbg !635
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %216 = bitcast %struct.camel_buffer_t* %215 to i8*, !dbg !635
  %217 = load i16, i16* @tmp_stack_crc, align 2, !dbg !635
  %call234 = call zeroext i16 @__fast_hw_crc(i8* %216, i16 zeroext 298, i16 zeroext %217), !dbg !635
  store i16 %call234, i16* @tmp_stack_buf_crc, align 2, !dbg !635
  %218 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !635
  %219 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !635
  %stack_and_buf_crc235 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %219, i32 0, i32 2, !dbg !635
  store i16 %218, i16* %stack_and_buf_crc235, align 2, !dbg !635
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !635
  br label %if.end249, !dbg !635

if.else236:                                       ; preds = %do.body220
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !645
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !645
  %220 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %reg_file237 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %220, i32 0, i32 0, !dbg !645
  %arraydecay238 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file237, i16 0, i16 0, !dbg !645
  call void @__dump_registers(i16* %arraydecay238), !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x239, metadata !647, metadata !DIExpression()), !dbg !649
  %221 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !649, !srcloc !650
  store i16 %221, i16* %__x239, align 2, !dbg !649
  %222 = load i16, i16* %__x239, align 2, !dbg !649
  store i16 %222, i16* %tmp240, align 2, !dbg !649
  %223 = load i16, i16* %tmp240, align 2, !dbg !649
  %add241 = add i16 %223, 2, !dbg !645
  %224 = inttoptr i16 %add241 to i8*, !dbg !645
  call void @llvm.dbg.declare(metadata i16* %__x242, metadata !651, metadata !DIExpression()), !dbg !653
  %225 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !653, !srcloc !654
  store i16 %225, i16* %__x242, align 2, !dbg !653
  %226 = load i16, i16* %__x242, align 2, !dbg !653
  store i16 %226, i16* %tmp243, align 2, !dbg !653
  %227 = load i16, i16* %tmp243, align 2, !dbg !653
  %add244 = add i16 %227, 2, !dbg !645
  %sub245 = sub i16 9216, %add244, !dbg !645
  %call246 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext %sub245, i16 zeroext -1), !dbg !645
  store i16 %call246, i16* @tmp_stack_crc, align 2, !dbg !645
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %229 = bitcast %struct.camel_buffer_t* %228 to i8*, !dbg !645
  %230 = load i16, i16* @tmp_stack_crc, align 2, !dbg !645
  %call247 = call zeroext i16 @__fast_hw_crc(i8* %229, i16 zeroext 298, i16 zeroext %230), !dbg !645
  store i16 %call247, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %231 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !645
  %232 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !645
  %stack_and_buf_crc248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %232, i32 0, i32 2, !dbg !645
  store i16 %231, i16* %stack_and_buf_crc248, align 2, !dbg !645
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !645
  br label %if.end249

if.end249:                                        ; preds = %if.else236, %if.then223
  br label %do.end250, !dbg !634

do.end250:                                        ; preds = %if.end249
  %tmp261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global262 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp261, i32 0, i32 1
  %global263 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global262, i32 0, i32 6
  %tmp264 = load i16, i16* %global263, align 2
  %tmp265 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global266 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp265, i32 0, i32 1
  %global267 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global266, i32 0, i32 6
  store i16 %tmp264, i16* %global267, align 2
  %tmp268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global269 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp268, i32 0, i32 1
  %global270 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global269, i32 0, i32 7
  %tmp271 = load i16, i16* %global270, align 2
  %tmp273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global274 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp273, i32 0, i32 1
  %global275 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global274, i32 0, i32 7
  store i16 %tmp271, i16* %global275, align 2
  %tmp276 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp276, i32 0, i32 1
  %global278 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global277, i32 0, i32 1
  %tmp279 = load i16, i16* %global278, align 2
  %tmp280 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global281 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp280, i32 0, i32 1
  %global282 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global281, i32 0, i32 1
  store i16 %tmp279, i16* %global282, align 2
  call void @task_commit(), !dbg !655
  br label %if.end314, !dbg !656

if.else251:                                       ; preds = %do.end137
  %tmp283 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global284 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp283, i32 0, i32 1
  %global285 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global284, i32 0, i32 3
  %tmp286 = load i16, i16* %global285, align 2
  %tmp287 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global288 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp287, i32 0, i32 1
  %global289 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global288, i32 0, i32 3
  store i16 %tmp286, i16* %global289, align 2
  %tmp291 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global292 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp291, i32 0, i32 1
  %global293 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global292, i32 0, i32 0
  %array294 = getelementptr inbounds [128 x i16], [128 x i16]* %global293, i16 0, i16 0
  %cast295 = bitcast i16* %array294 to i8*
  %tmp296 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global297 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp296, i32 0, i32 1
  %global298 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global297, i32 0, i32 0
  %array299 = getelementptr inbounds [128 x i16], [128 x i16]* %global298, i16 0, i16 0
  %cast300 = bitcast i16* %array299 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 2 %cast295, i8* align 2 %cast300, i64 2, i1 false), !dbg !657
  %tmp301 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global302 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp301, i32 0, i32 1
  %global303 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global302, i32 0, i32 2
  %tmp304 = load i16, i16* %global303, align 2
  %tmp305 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global306 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp305, i32 0, i32 1
  %global307 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global306, i32 0, i32 2
  store i16 %tmp304, i16* %global307, align 2
  %tmp308 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global309 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp308, i32 0, i32 1
  %global310 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global309, i32 0, i32 4
  %tmp311 = load i16, i16* %global310, align 2
  %tmp312 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global313 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp312, i32 0, i32 1
  %global314 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global313, i32 0, i32 4
  store i16 %tmp311, i16* %global314, align 2
  %tmp315 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global316 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp315, i32 0, i32 1
  %global317 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global316, i32 0, i32 11
  %tmp318 = load i8, i8* %global317, align 2
  %tmp319 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global320 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp319, i32 0, i32 1
  %global321 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global320, i32 0, i32 11
  store i8 %tmp318, i8* %global321, align 2
  call void @task_lookup_search(), !dbg !657
  br label %do.body252, !dbg !659

do.body252:                                       ; preds = %if.else251
  %233 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !660
  %cmp253 = icmp eq i16 %233, 1, !dbg !660
  br i1 %cmp253, label %if.then255, label %if.else268, !dbg !663

if.then255:                                       ; preds = %do.body252
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !664
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !664
  %234 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %reg_file256 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %234, i32 0, i32 0, !dbg !664
  %arraydecay257 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file256, i16 0, i16 0, !dbg !664
  call void @__dump_registers(i16* %arraydecay257), !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x258, metadata !666, metadata !DIExpression()), !dbg !668
  %235 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !668, !srcloc !669
  store i16 %235, i16* %__x258, align 2, !dbg !668
  %236 = load i16, i16* %__x258, align 2, !dbg !668
  store i16 %236, i16* %tmp259, align 2, !dbg !668
  %237 = load i16, i16* %tmp259, align 2, !dbg !668
  %add260 = add i16 %237, 2, !dbg !664
  %238 = inttoptr i16 %add260 to i8*, !dbg !664
  call void @llvm.dbg.declare(metadata i16* %__x261, metadata !670, metadata !DIExpression()), !dbg !672
  %239 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !672, !srcloc !673
  store i16 %239, i16* %__x261, align 2, !dbg !672
  %240 = load i16, i16* %__x261, align 2, !dbg !672
  store i16 %240, i16* %tmp262, align 2, !dbg !672
  %241 = load i16, i16* %tmp262, align 2, !dbg !672
  %add263 = add i16 %241, 2, !dbg !664
  %sub264 = sub i16 9216, %add263, !dbg !664
  %call265 = call zeroext i16 @__fast_hw_crc(i8* %238, i16 zeroext %sub264, i16 zeroext -1), !dbg !664
  store i16 %call265, i16* @tmp_stack_crc, align 2, !dbg !664
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %243 = bitcast %struct.camel_buffer_t* %242 to i8*, !dbg !664
  %244 = load i16, i16* @tmp_stack_crc, align 2, !dbg !664
  %call266 = call zeroext i16 @__fast_hw_crc(i8* %243, i16 zeroext 298, i16 zeroext %244), !dbg !664
  store i16 %call266, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %245 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !664
  %246 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !664
  %stack_and_buf_crc267 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %246, i32 0, i32 2, !dbg !664
  store i16 %245, i16* %stack_and_buf_crc267, align 2, !dbg !664
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !664
  br label %if.end281, !dbg !664

if.else268:                                       ; preds = %do.body252
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !674
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %247 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %reg_file269 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %247, i32 0, i32 0, !dbg !674
  %arraydecay270 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file269, i16 0, i16 0, !dbg !674
  call void @__dump_registers(i16* %arraydecay270), !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x271, metadata !676, metadata !DIExpression()), !dbg !678
  %248 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !678, !srcloc !679
  store i16 %248, i16* %__x271, align 2, !dbg !678
  %249 = load i16, i16* %__x271, align 2, !dbg !678
  store i16 %249, i16* %tmp272, align 2, !dbg !678
  %250 = load i16, i16* %tmp272, align 2, !dbg !678
  %add273 = add i16 %250, 2, !dbg !674
  %251 = inttoptr i16 %add273 to i8*, !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x274, metadata !680, metadata !DIExpression()), !dbg !682
  %252 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !682, !srcloc !683
  store i16 %252, i16* %__x274, align 2, !dbg !682
  %253 = load i16, i16* %__x274, align 2, !dbg !682
  store i16 %253, i16* %tmp275, align 2, !dbg !682
  %254 = load i16, i16* %tmp275, align 2, !dbg !682
  %add276 = add i16 %254, 2, !dbg !674
  %sub277 = sub i16 9216, %add276, !dbg !674
  %call278 = call zeroext i16 @__fast_hw_crc(i8* %251, i16 zeroext %sub277, i16 zeroext -1), !dbg !674
  store i16 %call278, i16* @tmp_stack_crc, align 2, !dbg !674
  %255 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %256 = bitcast %struct.camel_buffer_t* %255 to i8*, !dbg !674
  %257 = load i16, i16* @tmp_stack_crc, align 2, !dbg !674
  %call279 = call zeroext i16 @__fast_hw_crc(i8* %256, i16 zeroext 298, i16 zeroext %257), !dbg !674
  store i16 %call279, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %258 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %259 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %stack_and_buf_crc280 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %259, i32 0, i32 2, !dbg !674
  store i16 %258, i16* %stack_and_buf_crc280, align 2, !dbg !674
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !674
  br label %if.end281

if.end281:                                        ; preds = %if.else268, %if.then255
  br label %do.end282, !dbg !663

do.end282:                                        ; preds = %if.end281
  %tmp322 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global323 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp322, i32 0, i32 1
  %global324 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global323, i32 0, i32 11
  %tmp325 = load i8, i8* %global324, align 2
  %tmp326 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global327 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp326, i32 0, i32 1
  %global328 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global327, i32 0, i32 11
  store i8 %tmp325, i8* %global328, align 2
  call void @task_commit(), !dbg !684
  %tmp329 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global330 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp329, i32 0, i32 1
  %global331 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global330, i32 0, i32 8
  %tmp332 = load i16, i16* %global331, align 2
  %tmp333 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global334 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp333, i32 0, i32 1
  %global335 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global334, i32 0, i32 8
  store i16 %tmp332, i16* %global335, align 2
  %tmp336 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global337 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp336, i32 0, i32 1
  %global338 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global337, i32 0, i32 11
  %tmp339 = load i8, i8* %global338, align 2
  %tmp340 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global341 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp340, i32 0, i32 1
  %global342 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global341, i32 0, i32 11
  store i8 %tmp339, i8* %global342, align 2
  %tmp343 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global344 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp343, i32 0, i32 1
  %global345 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global344, i32 0, i32 9
  %tmp346 = load i16, i16* %global345, align 2
  %tmp347 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global348 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp347, i32 0, i32 1
  %global349 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global348, i32 0, i32 9
  store i16 %tmp346, i16* %global349, align 2
  call void @task_lookup_done(), !dbg !685
  br label %do.body283, !dbg !686

do.body283:                                       ; preds = %do.end282
  %260 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !687
  %cmp284 = icmp eq i16 %260, 1, !dbg !687
  br i1 %cmp284, label %if.then286, label %if.else299, !dbg !690

if.then286:                                       ; preds = %do.body283
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !691
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !691
  %261 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %reg_file287 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %261, i32 0, i32 0, !dbg !691
  %arraydecay288 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file287, i16 0, i16 0, !dbg !691
  call void @__dump_registers(i16* %arraydecay288), !dbg !691
  call void @llvm.dbg.declare(metadata i16* %__x289, metadata !693, metadata !DIExpression()), !dbg !695
  %262 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !695, !srcloc !696
  store i16 %262, i16* %__x289, align 2, !dbg !695
  %263 = load i16, i16* %__x289, align 2, !dbg !695
  store i16 %263, i16* %tmp290, align 2, !dbg !695
  %264 = load i16, i16* %tmp290, align 2, !dbg !695
  %add291 = add i16 %264, 2, !dbg !691
  %265 = inttoptr i16 %add291 to i8*, !dbg !691
  call void @llvm.dbg.declare(metadata i16* %__x292, metadata !697, metadata !DIExpression()), !dbg !699
  %266 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !699, !srcloc !700
  store i16 %266, i16* %__x292, align 2, !dbg !699
  %267 = load i16, i16* %__x292, align 2, !dbg !699
  store i16 %267, i16* %tmp293, align 2, !dbg !699
  %268 = load i16, i16* %tmp293, align 2, !dbg !699
  %add294 = add i16 %268, 2, !dbg !691
  %sub295 = sub i16 9216, %add294, !dbg !691
  %call296 = call zeroext i16 @__fast_hw_crc(i8* %265, i16 zeroext %sub295, i16 zeroext -1), !dbg !691
  store i16 %call296, i16* @tmp_stack_crc, align 2, !dbg !691
  %269 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %270 = bitcast %struct.camel_buffer_t* %269 to i8*, !dbg !691
  %271 = load i16, i16* @tmp_stack_crc, align 2, !dbg !691
  %call297 = call zeroext i16 @__fast_hw_crc(i8* %270, i16 zeroext 298, i16 zeroext %271), !dbg !691
  store i16 %call297, i16* @tmp_stack_buf_crc, align 2, !dbg !691
  %272 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !691
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !691
  %stack_and_buf_crc298 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 2, !dbg !691
  store i16 %272, i16* %stack_and_buf_crc298, align 2, !dbg !691
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !691
  br label %if.end312, !dbg !691

if.else299:                                       ; preds = %do.body283
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !701
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !701
  %274 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %reg_file300 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %274, i32 0, i32 0, !dbg !701
  %arraydecay301 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file300, i16 0, i16 0, !dbg !701
  call void @__dump_registers(i16* %arraydecay301), !dbg !701
  call void @llvm.dbg.declare(metadata i16* %__x302, metadata !703, metadata !DIExpression()), !dbg !705
  %275 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !705, !srcloc !706
  store i16 %275, i16* %__x302, align 2, !dbg !705
  %276 = load i16, i16* %__x302, align 2, !dbg !705
  store i16 %276, i16* %tmp303, align 2, !dbg !705
  %277 = load i16, i16* %tmp303, align 2, !dbg !705
  %add304 = add i16 %277, 2, !dbg !701
  %278 = inttoptr i16 %add304 to i8*, !dbg !701
  call void @llvm.dbg.declare(metadata i16* %__x305, metadata !707, metadata !DIExpression()), !dbg !709
  %279 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !709, !srcloc !710
  store i16 %279, i16* %__x305, align 2, !dbg !709
  %280 = load i16, i16* %__x305, align 2, !dbg !709
  store i16 %280, i16* %tmp306, align 2, !dbg !709
  %281 = load i16, i16* %tmp306, align 2, !dbg !709
  %add307 = add i16 %281, 2, !dbg !701
  %sub308 = sub i16 9216, %add307, !dbg !701
  %call309 = call zeroext i16 @__fast_hw_crc(i8* %278, i16 zeroext %sub308, i16 zeroext -1), !dbg !701
  store i16 %call309, i16* @tmp_stack_crc, align 2, !dbg !701
  %282 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %283 = bitcast %struct.camel_buffer_t* %282 to i8*, !dbg !701
  %284 = load i16, i16* @tmp_stack_crc, align 2, !dbg !701
  %call310 = call zeroext i16 @__fast_hw_crc(i8* %283, i16 zeroext 298, i16 zeroext %284), !dbg !701
  store i16 %call310, i16* @tmp_stack_buf_crc, align 2, !dbg !701
  %285 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !701
  %286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !701
  %stack_and_buf_crc311 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %286, i32 0, i32 2, !dbg !701
  store i16 %285, i16* %stack_and_buf_crc311, align 2, !dbg !701
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !701
  br label %if.end312

if.end312:                                        ; preds = %if.else299, %if.then286
  br label %do.end313, !dbg !690

do.end313:                                        ; preds = %if.end312
  %tmp350 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global351 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp350, i32 0, i32 1
  %global352 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global351, i32 0, i32 8
  %tmp353 = load i16, i16* %global352, align 2
  %tmp354 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global355 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp354, i32 0, i32 1
  %global356 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global355, i32 0, i32 8
  store i16 %tmp353, i16* %global356, align 2
  %tmp357 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %global358 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp357, i32 0, i32 1
  %global359 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global358, i32 0, i32 9
  %tmp360 = load i16, i16* %global359, align 2
  %tmp361 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %global362 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %tmp361, i32 0, i32 1
  %global363 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %global362, i32 0, i32 9
  store i16 %tmp360, i16* %global363, align 2
  call void @task_commit(), !dbg !711
  br label %if.end314

if.end314:                                        ; preds = %do.end313, %do.end250
  br label %while.cond, !dbg !439, !llvm.loop !712

while.end315:                                     ; preds = %while.cond
  call void @task_done(), !dbg !714
  %287 = load i16, i16* %retval, align 2, !dbg !715
  ret i16 %287, !dbg !715
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !716 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !719, metadata !DIExpression()), !dbg !720
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !721, metadata !DIExpression()), !dbg !722
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !723, metadata !DIExpression()), !dbg !724
  store i16 5381, i16* %hash, align 2, !dbg !724
  call void @llvm.dbg.declare(metadata i16* %i, metadata !725, metadata !DIExpression()), !dbg !726
  store i16 0, i16* %i, align 2, !dbg !727
  br label %for.cond, !dbg !729

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !730
  %1 = load i16, i16* %len.addr, align 2, !dbg !732
  %cmp = icmp ult i16 %0, %1, !dbg !733
  br i1 %cmp, label %for.body, label %for.end, !dbg !734

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !735
  %shl = shl i16 %2, 5, !dbg !736
  %3 = load i16, i16* %hash, align 2, !dbg !737
  %add = add i16 %shl, %3, !dbg !738
  %4 = load i8*, i8** %data.addr, align 2, !dbg !739
  %5 = load i8, i8* %4, align 1, !dbg !740
  %conv = zext i8 %5 to i16, !dbg !741
  %add1 = add i16 %add, %conv, !dbg !742
  store i16 %add1, i16* %hash, align 2, !dbg !743
  br label %for.inc, !dbg !744

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !745
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !745
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !745
  %7 = load i16, i16* %i, align 2, !dbg !746
  %inc = add i16 %7, 1, !dbg !746
  store i16 %inc, i16* %i, align 2, !dbg !746
  br label %for.cond, !dbg !747, !llvm.loop !748

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !750
  ret i16 %8, !dbg !751
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

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
!22 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 570, type: !23, isLocal: false, isDefinition: true)
!23 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 673, type: !26, isLocal: true, isDefinition: true)
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
!113 = !{i32 -2146583636}
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 206, type: !6)
!115 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 33)
!116 = !DILocation(line: 206, column: 33, scope: !115)
!117 = !{i32 -2146583400}
!118 = !DILocation(line: 206, column: 51, scope: !92)
!119 = !DILocation(line: 206, column: 33, scope: !92)
!120 = !DILocalVariable(name: "__x", scope: !121, file: !3, line: 206, type: !6)
!121 = distinct !DILexicalBlock(scope: !92, file: !3, line: 206, column: 65)
!122 = !DILocation(line: 206, column: 65, scope: !121)
!123 = !{i32 -2146583275}
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
!160 = !DILocation(line: 268, column: 25, scope: !161)
!161 = distinct !DILexicalBlock(scope: !157, file: !3, line: 267, column: 40)
!162 = !DILocation(line: 268, column: 9, scope: !161)
!163 = !DILocation(line: 268, column: 20, scope: !161)
!164 = !DILocation(line: 268, column: 23, scope: !161)
!165 = !DILocation(line: 270, column: 5, scope: !161)
!166 = !DILocation(line: 267, column: 35, scope: !157)
!167 = !DILocation(line: 267, column: 5, scope: !157)
!168 = distinct !{!168, !159, !169}
!169 = !DILocation(line: 270, column: 5, scope: !154)
!170 = !DILocation(line: 271, column: 5, scope: !150)
!171 = !DILocation(line: 271, column: 22, scope: !150)
!172 = !DILocation(line: 272, column: 5, scope: !150)
!173 = !DILocation(line: 272, column: 22, scope: !150)
!174 = !DILocation(line: 273, column: 5, scope: !150)
!175 = !DILocation(line: 273, column: 24, scope: !150)
!176 = !DILocation(line: 274, column: 5, scope: !150)
!177 = !DILocation(line: 274, column: 22, scope: !150)
!178 = !DILocation(line: 275, column: 5, scope: !150)
!179 = !DILocation(line: 275, column: 13, scope: !150)
!180 = !DILocation(line: 276, column: 1, scope: !150)
!181 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 294, type: !27, scopeLine: 295, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!182 = !DILocation(line: 297, column: 16, scope: !181)
!183 = !DILocation(line: 297, column: 24, scope: !181)
!184 = !DILocation(line: 297, column: 29, scope: !181)
!185 = !DILocation(line: 297, column: 5, scope: !181)
!186 = !DILocation(line: 297, column: 13, scope: !181)
!187 = !DILocation(line: 298, column: 1, scope: !181)
!188 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 316, type: !27, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!189 = !DILocation(line: 318, column: 43, scope: !188)
!190 = !DILocation(line: 318, column: 23, scope: !188)
!191 = !DILocation(line: 318, column: 5, scope: !188)
!192 = !DILocation(line: 318, column: 21, scope: !188)
!193 = !DILocation(line: 319, column: 1, scope: !188)
!194 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 243, type: !195, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!195 = !DISubroutineType(types: !196)
!196 = !{!50, !17}
!197 = !DILocalVariable(name: "key", arg: 1, scope: !194, file: !3, line: 243, type: !17)
!198 = !DILocation(line: 243, column: 50, scope: !194)
!199 = !DILocation(line: 245, column: 21, scope: !194)
!200 = !DILocation(line: 245, column: 12, scope: !194)
!201 = !DILocation(line: 245, column: 5, scope: !194)
!202 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 337, type: !27, scopeLine: 338, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!203 = !DILocation(line: 339, column: 32, scope: !202)
!204 = !DILocation(line: 339, column: 18, scope: !202)
!205 = !DILocation(line: 339, column: 5, scope: !202)
!206 = !DILocation(line: 339, column: 16, scope: !202)
!207 = !DILocation(line: 340, column: 1, scope: !202)
!208 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 237, type: !209, scopeLine: 238, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!209 = !DISubroutineType(types: !210)
!210 = !{!211, !50}
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 20, baseType: !18)
!212 = !DILocalVariable(name: "fp", arg: 1, scope: !208, file: !3, line: 237, type: !50)
!213 = !DILocation(line: 237, column: 44, scope: !208)
!214 = !DILocalVariable(name: "hash", scope: !208, file: !3, line: 239, type: !215)
!215 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 18, baseType: !18)
!216 = !DILocation(line: 239, column: 12, scope: !208)
!217 = !DILocation(line: 239, column: 28, scope: !208)
!218 = !DILocation(line: 239, column: 19, scope: !208)
!219 = !DILocation(line: 240, column: 12, scope: !208)
!220 = !DILocation(line: 240, column: 17, scope: !208)
!221 = !DILocation(line: 240, column: 5, scope: !208)
!222 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 358, type: !27, scopeLine: 359, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!223 = !DILocalVariable(name: "fp_hash", scope: !222, file: !3, line: 360, type: !211)
!224 = !DILocation(line: 360, column: 13, scope: !222)
!225 = !DILocation(line: 360, column: 37, scope: !222)
!226 = !DILocation(line: 360, column: 23, scope: !222)
!227 = !DILocation(line: 361, column: 18, scope: !222)
!228 = !DILocation(line: 361, column: 31, scope: !222)
!229 = !DILocation(line: 361, column: 29, scope: !222)
!230 = !DILocation(line: 361, column: 5, scope: !222)
!231 = !DILocation(line: 361, column: 16, scope: !222)
!232 = !DILocation(line: 362, column: 1, scope: !222)
!233 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 380, type: !27, scopeLine: 381, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!234 = !DILocation(line: 382, column: 10, scope: !235)
!235 = distinct !DILexicalBlock(scope: !233, file: !3, line: 382, column: 9)
!236 = !DILocation(line: 382, column: 21, scope: !235)
!237 = !DILocation(line: 382, column: 9, scope: !233)
!238 = !DILocation(line: 383, column: 9, scope: !239)
!239 = distinct !DILexicalBlock(scope: !235, file: !3, line: 382, column: 34)
!240 = !DILocation(line: 383, column: 21, scope: !239)
!241 = !DILocation(line: 384, column: 34, scope: !239)
!242 = !DILocation(line: 384, column: 9, scope: !239)
!243 = !DILocation(line: 384, column: 20, scope: !239)
!244 = !DILocation(line: 384, column: 32, scope: !239)
!245 = !DILocation(line: 385, column: 5, scope: !239)
!246 = !DILocation(line: 386, column: 14, scope: !247)
!247 = distinct !DILexicalBlock(scope: !248, file: !3, line: 386, column: 13)
!248 = distinct !DILexicalBlock(scope: !235, file: !3, line: 385, column: 12)
!249 = !DILocation(line: 386, column: 25, scope: !247)
!250 = !DILocation(line: 386, column: 13, scope: !248)
!251 = !DILocation(line: 387, column: 13, scope: !252)
!252 = distinct !DILexicalBlock(scope: !247, file: !3, line: 386, column: 38)
!253 = !DILocation(line: 387, column: 25, scope: !252)
!254 = !DILocation(line: 388, column: 38, scope: !252)
!255 = !DILocation(line: 388, column: 13, scope: !252)
!256 = !DILocation(line: 388, column: 24, scope: !252)
!257 = !DILocation(line: 388, column: 36, scope: !252)
!258 = !DILocation(line: 389, column: 9, scope: !252)
!259 = !DILocalVariable(name: "fp_victim", scope: !260, file: !3, line: 390, type: !50)
!260 = distinct !DILexicalBlock(scope: !247, file: !3, line: 389, column: 16)
!261 = !DILocation(line: 390, column: 27, scope: !260)
!262 = !DILocalVariable(name: "index_victim", scope: !260, file: !3, line: 391, type: !211)
!263 = !DILocation(line: 391, column: 21, scope: !260)
!264 = !DILocation(line: 392, column: 17, scope: !265)
!265 = distinct !DILexicalBlock(scope: !260, file: !3, line: 392, column: 17)
!266 = !DILocation(line: 392, column: 24, scope: !265)
!267 = !DILocation(line: 392, column: 17, scope: !260)
!268 = !DILocation(line: 393, column: 32, scope: !269)
!269 = distinct !DILexicalBlock(scope: !265, file: !3, line: 392, column: 29)
!270 = !DILocation(line: 393, column: 30, scope: !269)
!271 = !DILocation(line: 394, column: 29, scope: !269)
!272 = !DILocation(line: 394, column: 40, scope: !269)
!273 = !DILocation(line: 394, column: 27, scope: !269)
!274 = !DILocation(line: 395, column: 13, scope: !269)
!275 = !DILocation(line: 396, column: 32, scope: !276)
!276 = distinct !DILexicalBlock(scope: !265, file: !3, line: 395, column: 20)
!277 = !DILocation(line: 396, column: 30, scope: !276)
!278 = !DILocation(line: 397, column: 29, scope: !276)
!279 = !DILocation(line: 397, column: 40, scope: !276)
!280 = !DILocation(line: 397, column: 27, scope: !276)
!281 = !DILocation(line: 401, column: 40, scope: !260)
!282 = !DILocation(line: 401, column: 13, scope: !260)
!283 = !DILocation(line: 401, column: 24, scope: !260)
!284 = !DILocation(line: 401, column: 38, scope: !260)
!285 = !DILocation(line: 402, column: 26, scope: !260)
!286 = !DILocation(line: 402, column: 13, scope: !260)
!287 = !DILocation(line: 402, column: 24, scope: !260)
!288 = !DILocation(line: 403, column: 31, scope: !260)
!289 = !DILocation(line: 403, column: 13, scope: !260)
!290 = !DILocation(line: 403, column: 29, scope: !260)
!291 = !DILocation(line: 404, column: 13, scope: !260)
!292 = !DILocation(line: 404, column: 34, scope: !260)
!293 = !DILocation(line: 407, column: 1, scope: !233)
!294 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 425, type: !27, scopeLine: 426, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!295 = !DILocalVariable(name: "fp_victim", scope: !294, file: !3, line: 427, type: !50)
!296 = !DILocation(line: 427, column: 19, scope: !294)
!297 = !DILocation(line: 427, column: 31, scope: !294)
!298 = !DILocalVariable(name: "fp_hash_victim", scope: !294, file: !3, line: 428, type: !211)
!299 = !DILocation(line: 428, column: 13, scope: !294)
!300 = !DILocation(line: 428, column: 44, scope: !294)
!301 = !DILocation(line: 428, column: 30, scope: !294)
!302 = !DILocalVariable(name: "index2_victim", scope: !294, file: !3, line: 429, type: !211)
!303 = !DILocation(line: 429, column: 13, scope: !294)
!304 = !DILocation(line: 429, column: 29, scope: !294)
!305 = !DILocation(line: 429, column: 42, scope: !294)
!306 = !DILocation(line: 429, column: 40, scope: !294)
!307 = !DILocation(line: 433, column: 14, scope: !308)
!308 = distinct !DILexicalBlock(scope: !294, file: !3, line: 433, column: 13)
!309 = !DILocation(line: 433, column: 25, scope: !308)
!310 = !DILocation(line: 433, column: 13, scope: !294)
!311 = !DILocation(line: 434, column: 13, scope: !312)
!312 = distinct !DILexicalBlock(scope: !308, file: !3, line: 433, column: 41)
!313 = !DILocation(line: 434, column: 25, scope: !312)
!314 = !DILocation(line: 435, column: 41, scope: !312)
!315 = !DILocation(line: 435, column: 13, scope: !312)
!316 = !DILocation(line: 435, column: 24, scope: !312)
!317 = !DILocation(line: 435, column: 39, scope: !312)
!318 = !DILocation(line: 436, column: 13, scope: !312)
!319 = !DILocation(line: 440, column: 13, scope: !320)
!320 = distinct !DILexicalBlock(scope: !294, file: !3, line: 440, column: 13)
!321 = !DILocation(line: 440, column: 34, scope: !320)
!322 = !DILocation(line: 440, column: 13, scope: !294)
!323 = !DILocation(line: 441, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !320, file: !3, line: 440, column: 54)
!325 = !DILocation(line: 441, column: 25, scope: !324)
!326 = !DILocation(line: 442, column: 13, scope: !324)
!327 = !DILocation(line: 445, column: 11, scope: !294)
!328 = !DILocation(line: 445, column: 9, scope: !294)
!329 = !DILocation(line: 446, column: 22, scope: !294)
!330 = !DILocation(line: 446, column: 9, scope: !294)
!331 = !DILocation(line: 446, column: 20, scope: !294)
!332 = !DILocation(line: 447, column: 27, scope: !294)
!333 = !DILocation(line: 447, column: 38, scope: !294)
!334 = !DILocation(line: 447, column: 9, scope: !294)
!335 = !DILocation(line: 447, column: 25, scope: !294)
!336 = !DILocation(line: 448, column: 37, scope: !294)
!337 = !DILocation(line: 448, column: 9, scope: !294)
!338 = !DILocation(line: 448, column: 20, scope: !294)
!339 = !DILocation(line: 448, column: 35, scope: !294)
!340 = !DILocation(line: 449, column: 1, scope: !294)
!341 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 467, type: !27, scopeLine: 468, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!342 = !DILocation(line: 469, column: 7, scope: !341)
!343 = !DILocation(line: 469, column: 5, scope: !341)
!344 = !DILocation(line: 470, column: 27, scope: !341)
!345 = !DILocation(line: 470, column: 5, scope: !341)
!346 = !DILocation(line: 470, column: 24, scope: !341)
!347 = !DILocation(line: 472, column: 9, scope: !348)
!348 = distinct !DILexicalBlock(scope: !341, file: !3, line: 472, column: 9)
!349 = !DILocation(line: 472, column: 26, scope: !348)
!350 = !DILocation(line: 472, column: 9, scope: !341)
!351 = !DILocation(line: 473, column: 5, scope: !352)
!352 = distinct !DILexicalBlock(scope: !348, file: !3, line: 472, column: 41)
!353 = !DILocation(line: 474, column: 9, scope: !354)
!354 = distinct !DILexicalBlock(scope: !348, file: !3, line: 473, column: 12)
!355 = !DILocation(line: 474, column: 17, scope: !354)
!356 = !DILocation(line: 476, column: 1, scope: !341)
!357 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 494, type: !27, scopeLine: 495, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocation(line: 496, column: 9, scope: !359)
!359 = distinct !DILexicalBlock(scope: !357, file: !3, line: 496, column: 9)
!360 = !DILocation(line: 496, column: 20, scope: !359)
!361 = !DILocation(line: 496, column: 35, scope: !359)
!362 = !DILocation(line: 496, column: 32, scope: !359)
!363 = !DILocation(line: 496, column: 9, scope: !357)
!364 = !DILocation(line: 497, column: 9, scope: !365)
!365 = distinct !DILexicalBlock(scope: !359, file: !3, line: 496, column: 52)
!366 = !DILocation(line: 497, column: 20, scope: !365)
!367 = !DILocation(line: 498, column: 5, scope: !365)
!368 = !DILocation(line: 499, column: 13, scope: !369)
!369 = distinct !DILexicalBlock(scope: !370, file: !3, line: 499, column: 13)
!370 = distinct !DILexicalBlock(scope: !359, file: !3, line: 498, column: 12)
!371 = !DILocation(line: 499, column: 24, scope: !369)
!372 = !DILocation(line: 499, column: 39, scope: !369)
!373 = !DILocation(line: 499, column: 36, scope: !369)
!374 = !DILocation(line: 499, column: 13, scope: !370)
!375 = !DILocation(line: 500, column: 13, scope: !376)
!376 = distinct !DILexicalBlock(scope: !369, file: !3, line: 499, column: 56)
!377 = !DILocation(line: 500, column: 24, scope: !376)
!378 = !DILocation(line: 501, column: 9, scope: !376)
!379 = !DILocation(line: 503, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !369, file: !3, line: 502, column: 14)
!381 = !DILocation(line: 503, column: 24, scope: !380)
!382 = !DILocation(line: 507, column: 10, scope: !383)
!383 = distinct !DILexicalBlock(scope: !357, file: !3, line: 507, column: 9)
!384 = !DILocation(line: 507, column: 9, scope: !357)
!385 = !DILocation(line: 508, column: 5, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !3, line: 507, column: 22)
!387 = !DILocation(line: 509, column: 1, scope: !357)
!388 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 527, type: !27, scopeLine: 528, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!389 = !DILocation(line: 529, column: 7, scope: !388)
!390 = !DILocation(line: 529, column: 5, scope: !388)
!391 = !DILocation(line: 531, column: 25, scope: !388)
!392 = !DILocation(line: 531, column: 5, scope: !388)
!393 = !DILocation(line: 531, column: 22, scope: !388)
!394 = !DILocation(line: 533, column: 9, scope: !395)
!395 = distinct !DILexicalBlock(scope: !388, file: !3, line: 533, column: 9)
!396 = !DILocation(line: 533, column: 26, scope: !395)
!397 = !DILocation(line: 533, column: 9, scope: !388)
!398 = !DILocation(line: 534, column: 5, scope: !399)
!399 = distinct !DILexicalBlock(scope: !395, file: !3, line: 533, column: 41)
!400 = !DILocation(line: 536, column: 1, scope: !388)
!401 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 538, type: !27, scopeLine: 539, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!402 = !DILocation(line: 542, column: 5, scope: !401)
!403 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 545, type: !27, scopeLine: 545, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!404 = !DILocation(line: 568, column: 1, scope: !403)
!405 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 572, type: !406, scopeLine: 572, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!406 = !DISubroutineType(types: !407)
!407 = !{!23}
!408 = !DILocation(line: 574, column: 16, scope: !405)
!409 = !DILocation(line: 575, column: 10, scope: !405)
!410 = !DILocation(line: 576, column: 12, scope: !405)
!411 = !DILocation(line: 577, column: 5, scope: !405)
!412 = !DILocation(line: 588, column: 5, scope: !405)
!413 = !DILocation(line: 589, column: 5, scope: !405)
!414 = !DILocation(line: 589, column: 5, scope: !415)
!415 = distinct !DILexicalBlock(scope: !416, file: !3, line: 589, column: 5)
!416 = distinct !DILexicalBlock(scope: !405, file: !3, line: 589, column: 5)
!417 = !DILocation(line: 589, column: 5, scope: !416)
!418 = !DILocation(line: 589, column: 5, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 589, column: 5)
!420 = !DILocalVariable(name: "__x", scope: !421, file: !3, line: 589, type: !6)
!421 = distinct !DILexicalBlock(scope: !419, file: !3, line: 589, column: 5)
!422 = !DILocation(line: 589, column: 5, scope: !421)
!423 = !{i32 -2146579195}
!424 = !DILocalVariable(name: "__x", scope: !425, file: !3, line: 589, type: !6)
!425 = distinct !DILexicalBlock(scope: !419, file: !3, line: 589, column: 5)
!426 = !DILocation(line: 589, column: 5, scope: !425)
!427 = !{i32 -2146579070}
!428 = !DILocation(line: 589, column: 5, scope: !429)
!429 = distinct !DILexicalBlock(scope: !415, file: !3, line: 589, column: 5)
!430 = !DILocalVariable(name: "__x", scope: !431, file: !3, line: 589, type: !6)
!431 = distinct !DILexicalBlock(scope: !429, file: !3, line: 589, column: 5)
!432 = !DILocation(line: 589, column: 5, scope: !431)
!433 = !{i32 -2146578938}
!434 = !DILocalVariable(name: "__x", scope: !435, file: !3, line: 589, type: !6)
!435 = distinct !DILexicalBlock(scope: !429, file: !3, line: 589, column: 5)
!436 = !DILocation(line: 589, column: 5, scope: !435)
!437 = !{i32 -2146578813}
!438 = !DILocation(line: 590, column: 5, scope: !405)
!439 = !DILocation(line: 594, column: 3, scope: !405)
!440 = !DILocation(line: 594, column: 9, scope: !405)
!441 = !DILocation(line: 594, column: 27, scope: !405)
!442 = !DILocation(line: 597, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !405, file: !3, line: 594, column: 42)
!444 = !DILocation(line: 598, column: 9, scope: !443)
!445 = !DILocation(line: 598, column: 9, scope: !446)
!446 = distinct !DILexicalBlock(scope: !447, file: !3, line: 598, column: 9)
!447 = distinct !DILexicalBlock(scope: !443, file: !3, line: 598, column: 9)
!448 = !DILocation(line: 598, column: 9, scope: !447)
!449 = !DILocation(line: 598, column: 9, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !3, line: 598, column: 9)
!451 = !DILocalVariable(name: "__x", scope: !452, file: !3, line: 598, type: !6)
!452 = distinct !DILexicalBlock(scope: !450, file: !3, line: 598, column: 9)
!453 = !DILocation(line: 598, column: 9, scope: !452)
!454 = !{i32 -2146576626}
!455 = !DILocalVariable(name: "__x", scope: !456, file: !3, line: 598, type: !6)
!456 = distinct !DILexicalBlock(scope: !450, file: !3, line: 598, column: 9)
!457 = !DILocation(line: 598, column: 9, scope: !456)
!458 = !{i32 -2146576501}
!459 = !DILocation(line: 598, column: 9, scope: !460)
!460 = distinct !DILexicalBlock(scope: !446, file: !3, line: 598, column: 9)
!461 = !DILocalVariable(name: "__x", scope: !462, file: !3, line: 598, type: !6)
!462 = distinct !DILexicalBlock(scope: !460, file: !3, line: 598, column: 9)
!463 = !DILocation(line: 598, column: 9, scope: !462)
!464 = !{i32 -2146576369}
!465 = !DILocalVariable(name: "__x", scope: !466, file: !3, line: 598, type: !6)
!466 = distinct !DILexicalBlock(scope: !460, file: !3, line: 598, column: 9)
!467 = !DILocation(line: 598, column: 9, scope: !466)
!468 = !{i32 -2146576244}
!469 = !DILocation(line: 600, column: 9, scope: !443)
!470 = !DILocation(line: 604, column: 9, scope: !443)
!471 = !DILocation(line: 605, column: 9, scope: !443)
!472 = !DILocation(line: 605, column: 9, scope: !473)
!473 = distinct !DILexicalBlock(scope: !474, file: !3, line: 605, column: 9)
!474 = distinct !DILexicalBlock(scope: !443, file: !3, line: 605, column: 9)
!475 = !DILocation(line: 605, column: 9, scope: !474)
!476 = !DILocation(line: 605, column: 9, scope: !477)
!477 = distinct !DILexicalBlock(scope: !473, file: !3, line: 605, column: 9)
!478 = !DILocalVariable(name: "__x", scope: !479, file: !3, line: 605, type: !6)
!479 = distinct !DILexicalBlock(scope: !477, file: !3, line: 605, column: 9)
!480 = !DILocation(line: 605, column: 9, scope: !479)
!481 = !{i32 -2146574120}
!482 = !DILocalVariable(name: "__x", scope: !483, file: !3, line: 605, type: !6)
!483 = distinct !DILexicalBlock(scope: !477, file: !3, line: 605, column: 9)
!484 = !DILocation(line: 605, column: 9, scope: !483)
!485 = !{i32 -2146573995}
!486 = !DILocation(line: 605, column: 9, scope: !487)
!487 = distinct !DILexicalBlock(scope: !473, file: !3, line: 605, column: 9)
!488 = !DILocalVariable(name: "__x", scope: !489, file: !3, line: 605, type: !6)
!489 = distinct !DILexicalBlock(scope: !487, file: !3, line: 605, column: 9)
!490 = !DILocation(line: 605, column: 9, scope: !489)
!491 = !{i32 -2146573863}
!492 = !DILocalVariable(name: "__x", scope: !493, file: !3, line: 605, type: !6)
!493 = distinct !DILexicalBlock(scope: !487, file: !3, line: 605, column: 9)
!494 = !DILocation(line: 605, column: 9, scope: !493)
!495 = !{i32 -2146573738}
!496 = !DILocation(line: 607, column: 9, scope: !443)
!497 = !DILocation(line: 611, column: 9, scope: !443)
!498 = !DILocation(line: 612, column: 9, scope: !443)
!499 = !DILocation(line: 612, column: 9, scope: !500)
!500 = distinct !DILexicalBlock(scope: !501, file: !3, line: 612, column: 9)
!501 = distinct !DILexicalBlock(scope: !443, file: !3, line: 612, column: 9)
!502 = !DILocation(line: 612, column: 9, scope: !501)
!503 = !DILocation(line: 612, column: 9, scope: !504)
!504 = distinct !DILexicalBlock(scope: !500, file: !3, line: 612, column: 9)
!505 = !DILocalVariable(name: "__x", scope: !506, file: !3, line: 612, type: !6)
!506 = distinct !DILexicalBlock(scope: !504, file: !3, line: 612, column: 9)
!507 = !DILocation(line: 612, column: 9, scope: !506)
!508 = !{i32 -2146571614}
!509 = !DILocalVariable(name: "__x", scope: !510, file: !3, line: 612, type: !6)
!510 = distinct !DILexicalBlock(scope: !504, file: !3, line: 612, column: 9)
!511 = !DILocation(line: 612, column: 9, scope: !510)
!512 = !{i32 -2146571489}
!513 = !DILocation(line: 612, column: 9, scope: !514)
!514 = distinct !DILexicalBlock(scope: !500, file: !3, line: 612, column: 9)
!515 = !DILocalVariable(name: "__x", scope: !516, file: !3, line: 612, type: !6)
!516 = distinct !DILexicalBlock(scope: !514, file: !3, line: 612, column: 9)
!517 = !DILocation(line: 612, column: 9, scope: !516)
!518 = !{i32 -2146571357}
!519 = !DILocalVariable(name: "__x", scope: !520, file: !3, line: 612, type: !6)
!520 = distinct !DILexicalBlock(scope: !514, file: !3, line: 612, column: 9)
!521 = !DILocation(line: 612, column: 9, scope: !520)
!522 = !{i32 -2146571232}
!523 = !DILocation(line: 614, column: 9, scope: !443)
!524 = !DILocation(line: 618, column: 9, scope: !443)
!525 = !DILocation(line: 619, column: 9, scope: !443)
!526 = !DILocation(line: 619, column: 9, scope: !527)
!527 = distinct !DILexicalBlock(scope: !528, file: !3, line: 619, column: 9)
!528 = distinct !DILexicalBlock(scope: !443, file: !3, line: 619, column: 9)
!529 = !DILocation(line: 619, column: 9, scope: !528)
!530 = !DILocation(line: 619, column: 9, scope: !531)
!531 = distinct !DILexicalBlock(scope: !527, file: !3, line: 619, column: 9)
!532 = !DILocalVariable(name: "__x", scope: !533, file: !3, line: 619, type: !6)
!533 = distinct !DILexicalBlock(scope: !531, file: !3, line: 619, column: 9)
!534 = !DILocation(line: 619, column: 9, scope: !533)
!535 = !{i32 -2146569108}
!536 = !DILocalVariable(name: "__x", scope: !537, file: !3, line: 619, type: !6)
!537 = distinct !DILexicalBlock(scope: !531, file: !3, line: 619, column: 9)
!538 = !DILocation(line: 619, column: 9, scope: !537)
!539 = !{i32 -2146568983}
!540 = !DILocation(line: 619, column: 9, scope: !541)
!541 = distinct !DILexicalBlock(scope: !527, file: !3, line: 619, column: 9)
!542 = !DILocalVariable(name: "__x", scope: !543, file: !3, line: 619, type: !6)
!543 = distinct !DILexicalBlock(scope: !541, file: !3, line: 619, column: 9)
!544 = !DILocation(line: 619, column: 9, scope: !543)
!545 = !{i32 -2146568851}
!546 = !DILocalVariable(name: "__x", scope: !547, file: !3, line: 619, type: !6)
!547 = distinct !DILexicalBlock(scope: !541, file: !3, line: 619, column: 9)
!548 = !DILocation(line: 619, column: 9, scope: !547)
!549 = !{i32 -2146568726}
!550 = !DILocation(line: 621, column: 9, scope: !443)
!551 = !DILocation(line: 623, column: 12, scope: !552)
!552 = distinct !DILexicalBlock(scope: !443, file: !3, line: 623, column: 12)
!553 = !DILocation(line: 623, column: 30, scope: !552)
!554 = !DILocation(line: 623, column: 12, scope: !443)
!555 = !DILocation(line: 626, column: 13, scope: !556)
!556 = distinct !DILexicalBlock(scope: !552, file: !3, line: 623, column: 45)
!557 = !DILocation(line: 627, column: 13, scope: !556)
!558 = !DILocation(line: 627, column: 13, scope: !559)
!559 = distinct !DILexicalBlock(scope: !560, file: !3, line: 627, column: 13)
!560 = distinct !DILexicalBlock(scope: !556, file: !3, line: 627, column: 13)
!561 = !DILocation(line: 627, column: 13, scope: !560)
!562 = !DILocation(line: 627, column: 13, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !3, line: 627, column: 13)
!564 = !DILocalVariable(name: "__x", scope: !565, file: !3, line: 627, type: !6)
!565 = distinct !DILexicalBlock(scope: !563, file: !3, line: 627, column: 13)
!566 = !DILocation(line: 627, column: 13, scope: !565)
!567 = !{i32 -2146566551}
!568 = !DILocalVariable(name: "__x", scope: !569, file: !3, line: 627, type: !6)
!569 = distinct !DILexicalBlock(scope: !563, file: !3, line: 627, column: 13)
!570 = !DILocation(line: 627, column: 13, scope: !569)
!571 = !{i32 -2146566426}
!572 = !DILocation(line: 627, column: 13, scope: !573)
!573 = distinct !DILexicalBlock(scope: !559, file: !3, line: 627, column: 13)
!574 = !DILocalVariable(name: "__x", scope: !575, file: !3, line: 627, type: !6)
!575 = distinct !DILexicalBlock(scope: !573, file: !3, line: 627, column: 13)
!576 = !DILocation(line: 627, column: 13, scope: !575)
!577 = !{i32 -2146566294}
!578 = !DILocalVariable(name: "__x", scope: !579, file: !3, line: 627, type: !6)
!579 = distinct !DILexicalBlock(scope: !573, file: !3, line: 627, column: 13)
!580 = !DILocation(line: 627, column: 13, scope: !579)
!581 = !{i32 -2146566169}
!582 = !DILocation(line: 629, column: 13, scope: !556)
!583 = !DILocation(line: 631, column: 16, scope: !584)
!584 = distinct !DILexicalBlock(scope: !556, file: !3, line: 631, column: 16)
!585 = !DILocation(line: 631, column: 28, scope: !584)
!586 = !DILocation(line: 631, column: 41, scope: !584)
!587 = !DILocation(line: 631, column: 44, scope: !584)
!588 = !DILocation(line: 631, column: 56, scope: !584)
!589 = !DILocation(line: 631, column: 16, scope: !556)
!590 = !DILocation(line: 632, column: 17, scope: !591)
!591 = distinct !DILexicalBlock(scope: !584, file: !3, line: 631, column: 70)
!592 = !DILocation(line: 632, column: 23, scope: !591)
!593 = !DILocation(line: 632, column: 36, scope: !591)
!594 = !DILocation(line: 632, column: 45, scope: !591)
!595 = !DILocation(line: 632, column: 49, scope: !591)
!596 = !DILocation(line: 632, column: 71, scope: !591)
!597 = !DILocation(line: 0, scope: !591)
!598 = !DILocation(line: 635, column: 21, scope: !599)
!599 = distinct !DILexicalBlock(scope: !591, file: !3, line: 632, column: 91)
!600 = !DILocation(line: 636, column: 21, scope: !599)
!601 = !DILocation(line: 636, column: 21, scope: !602)
!602 = distinct !DILexicalBlock(scope: !603, file: !3, line: 636, column: 21)
!603 = distinct !DILexicalBlock(scope: !599, file: !3, line: 636, column: 21)
!604 = !DILocation(line: 636, column: 21, scope: !603)
!605 = !DILocation(line: 636, column: 21, scope: !606)
!606 = distinct !DILexicalBlock(scope: !602, file: !3, line: 636, column: 21)
!607 = !DILocalVariable(name: "__x", scope: !608, file: !3, line: 636, type: !6)
!608 = distinct !DILexicalBlock(scope: !606, file: !3, line: 636, column: 21)
!609 = !DILocation(line: 636, column: 21, scope: !608)
!610 = !{i32 -2146563892}
!611 = !DILocalVariable(name: "__x", scope: !612, file: !3, line: 636, type: !6)
!612 = distinct !DILexicalBlock(scope: !606, file: !3, line: 636, column: 21)
!613 = !DILocation(line: 636, column: 21, scope: !612)
!614 = !{i32 -2146563767}
!615 = !DILocation(line: 636, column: 21, scope: !616)
!616 = distinct !DILexicalBlock(scope: !602, file: !3, line: 636, column: 21)
!617 = !DILocalVariable(name: "__x", scope: !618, file: !3, line: 636, type: !6)
!618 = distinct !DILexicalBlock(scope: !616, file: !3, line: 636, column: 21)
!619 = !DILocation(line: 636, column: 21, scope: !618)
!620 = !{i32 -2146563635}
!621 = !DILocalVariable(name: "__x", scope: !622, file: !3, line: 636, type: !6)
!622 = distinct !DILexicalBlock(scope: !616, file: !3, line: 636, column: 21)
!623 = !DILocation(line: 636, column: 21, scope: !622)
!624 = !{i32 -2146563510}
!625 = !DILocation(line: 638, column: 21, scope: !599)
!626 = distinct !{!626, !590, !627}
!627 = !DILocation(line: 639, column: 17, scope: !591)
!628 = !DILocation(line: 640, column: 13, scope: !591)
!629 = !DILocation(line: 644, column: 13, scope: !556)
!630 = !DILocation(line: 645, column: 13, scope: !556)
!631 = !DILocation(line: 645, column: 13, scope: !632)
!632 = distinct !DILexicalBlock(scope: !633, file: !3, line: 645, column: 13)
!633 = distinct !DILexicalBlock(scope: !556, file: !3, line: 645, column: 13)
!634 = !DILocation(line: 645, column: 13, scope: !633)
!635 = !DILocation(line: 645, column: 13, scope: !636)
!636 = distinct !DILexicalBlock(scope: !632, file: !3, line: 645, column: 13)
!637 = !DILocalVariable(name: "__x", scope: !638, file: !3, line: 645, type: !6)
!638 = distinct !DILexicalBlock(scope: !636, file: !3, line: 645, column: 13)
!639 = !DILocation(line: 645, column: 13, scope: !638)
!640 = !{i32 -2146561386}
!641 = !DILocalVariable(name: "__x", scope: !642, file: !3, line: 645, type: !6)
!642 = distinct !DILexicalBlock(scope: !636, file: !3, line: 645, column: 13)
!643 = !DILocation(line: 645, column: 13, scope: !642)
!644 = !{i32 -2146561261}
!645 = !DILocation(line: 645, column: 13, scope: !646)
!646 = distinct !DILexicalBlock(scope: !632, file: !3, line: 645, column: 13)
!647 = !DILocalVariable(name: "__x", scope: !648, file: !3, line: 645, type: !6)
!648 = distinct !DILexicalBlock(scope: !646, file: !3, line: 645, column: 13)
!649 = !DILocation(line: 645, column: 13, scope: !648)
!650 = !{i32 -2146561129}
!651 = !DILocalVariable(name: "__x", scope: !652, file: !3, line: 645, type: !6)
!652 = distinct !DILexicalBlock(scope: !646, file: !3, line: 645, column: 13)
!653 = !DILocation(line: 645, column: 13, scope: !652)
!654 = !{i32 -2146561004}
!655 = !DILocation(line: 647, column: 13, scope: !556)
!656 = !DILocation(line: 649, column: 9, scope: !556)
!657 = !DILocation(line: 652, column: 13, scope: !658)
!658 = distinct !DILexicalBlock(scope: !552, file: !3, line: 649, column: 16)
!659 = !DILocation(line: 653, column: 13, scope: !658)
!660 = !DILocation(line: 653, column: 13, scope: !661)
!661 = distinct !DILexicalBlock(scope: !662, file: !3, line: 653, column: 13)
!662 = distinct !DILexicalBlock(scope: !658, file: !3, line: 653, column: 13)
!663 = !DILocation(line: 653, column: 13, scope: !662)
!664 = !DILocation(line: 653, column: 13, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !3, line: 653, column: 13)
!666 = !DILocalVariable(name: "__x", scope: !667, file: !3, line: 653, type: !6)
!667 = distinct !DILexicalBlock(scope: !665, file: !3, line: 653, column: 13)
!668 = !DILocation(line: 653, column: 13, scope: !667)
!669 = !{i32 -2146558880}
!670 = !DILocalVariable(name: "__x", scope: !671, file: !3, line: 653, type: !6)
!671 = distinct !DILexicalBlock(scope: !665, file: !3, line: 653, column: 13)
!672 = !DILocation(line: 653, column: 13, scope: !671)
!673 = !{i32 -2146558755}
!674 = !DILocation(line: 653, column: 13, scope: !675)
!675 = distinct !DILexicalBlock(scope: !661, file: !3, line: 653, column: 13)
!676 = !DILocalVariable(name: "__x", scope: !677, file: !3, line: 653, type: !6)
!677 = distinct !DILexicalBlock(scope: !675, file: !3, line: 653, column: 13)
!678 = !DILocation(line: 653, column: 13, scope: !677)
!679 = !{i32 -2146558623}
!680 = !DILocalVariable(name: "__x", scope: !681, file: !3, line: 653, type: !6)
!681 = distinct !DILexicalBlock(scope: !675, file: !3, line: 653, column: 13)
!682 = !DILocation(line: 653, column: 13, scope: !681)
!683 = !{i32 -2146558498}
!684 = !DILocation(line: 655, column: 13, scope: !658)
!685 = !DILocation(line: 659, column: 13, scope: !658)
!686 = !DILocation(line: 660, column: 13, scope: !658)
!687 = !DILocation(line: 660, column: 13, scope: !688)
!688 = distinct !DILexicalBlock(scope: !689, file: !3, line: 660, column: 13)
!689 = distinct !DILexicalBlock(scope: !658, file: !3, line: 660, column: 13)
!690 = !DILocation(line: 660, column: 13, scope: !689)
!691 = !DILocation(line: 660, column: 13, scope: !692)
!692 = distinct !DILexicalBlock(scope: !688, file: !3, line: 660, column: 13)
!693 = !DILocalVariable(name: "__x", scope: !694, file: !3, line: 660, type: !6)
!694 = distinct !DILexicalBlock(scope: !692, file: !3, line: 660, column: 13)
!695 = !DILocation(line: 660, column: 13, scope: !694)
!696 = !{i32 -2146556374}
!697 = !DILocalVariable(name: "__x", scope: !698, file: !3, line: 660, type: !6)
!698 = distinct !DILexicalBlock(scope: !692, file: !3, line: 660, column: 13)
!699 = !DILocation(line: 660, column: 13, scope: !698)
!700 = !{i32 -2146556249}
!701 = !DILocation(line: 660, column: 13, scope: !702)
!702 = distinct !DILexicalBlock(scope: !688, file: !3, line: 660, column: 13)
!703 = !DILocalVariable(name: "__x", scope: !704, file: !3, line: 660, type: !6)
!704 = distinct !DILexicalBlock(scope: !702, file: !3, line: 660, column: 13)
!705 = !DILocation(line: 660, column: 13, scope: !704)
!706 = !{i32 -2146556117}
!707 = !DILocalVariable(name: "__x", scope: !708, file: !3, line: 660, type: !6)
!708 = distinct !DILexicalBlock(scope: !702, file: !3, line: 660, column: 13)
!709 = !DILocation(line: 660, column: 13, scope: !708)
!710 = !{i32 -2146555992}
!711 = !DILocation(line: 662, column: 13, scope: !658)
!712 = distinct !{!712, !439, !713}
!713 = !DILocation(line: 664, column: 5, scope: !405)
!714 = !DILocation(line: 667, column: 5, scope: !405)
!715 = !DILocation(line: 668, column: 1, scope: !405)
!716 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 225, type: !717, scopeLine: 226, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!717 = !DISubroutineType(types: !718)
!718 = !{!215, !7, !6}
!719 = !DILocalVariable(name: "data", arg: 1, scope: !716, file: !3, line: 225, type: !7)
!720 = !DILocation(line: 225, column: 33, scope: !716)
!721 = !DILocalVariable(name: "len", arg: 2, scope: !716, file: !3, line: 225, type: !6)
!722 = !DILocation(line: 225, column: 48, scope: !716)
!723 = !DILocalVariable(name: "hash", scope: !716, file: !3, line: 227, type: !18)
!724 = !DILocation(line: 227, column: 14, scope: !716)
!725 = !DILocalVariable(name: "i", scope: !716, file: !3, line: 228, type: !6)
!726 = !DILocation(line: 228, column: 18, scope: !716)
!727 = !DILocation(line: 230, column: 11, scope: !728)
!728 = distinct !DILexicalBlock(scope: !716, file: !3, line: 230, column: 5)
!729 = !DILocation(line: 230, column: 9, scope: !728)
!730 = !DILocation(line: 230, column: 16, scope: !731)
!731 = distinct !DILexicalBlock(scope: !728, file: !3, line: 230, column: 5)
!732 = !DILocation(line: 230, column: 20, scope: !731)
!733 = !DILocation(line: 230, column: 18, scope: !731)
!734 = !DILocation(line: 230, column: 5, scope: !728)
!735 = !DILocation(line: 231, column: 18, scope: !731)
!736 = !DILocation(line: 231, column: 23, scope: !731)
!737 = !DILocation(line: 231, column: 31, scope: !731)
!738 = !DILocation(line: 231, column: 29, scope: !731)
!739 = !DILocation(line: 231, column: 41, scope: !731)
!740 = !DILocation(line: 231, column: 40, scope: !731)
!741 = !DILocation(line: 231, column: 39, scope: !731)
!742 = !DILocation(line: 231, column: 37, scope: !731)
!743 = !DILocation(line: 231, column: 14, scope: !731)
!744 = !DILocation(line: 231, column: 9, scope: !731)
!745 = !DILocation(line: 230, column: 29, scope: !731)
!746 = !DILocation(line: 230, column: 34, scope: !731)
!747 = !DILocation(line: 230, column: 5, scope: !731)
!748 = distinct !{!748, !734, !749}
!749 = !DILocation(line: 231, column: 45, scope: !728)
!750 = !DILocation(line: 234, column: 12, scope: !716)
!751 = !DILocation(line: 234, column: 5, scope: !716)
