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
@init_key = dso_local constant i16 1, align 2, !dbg !14
@writeOpt = dso_local global i16 0, align 2, !dbg !21
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !24
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !29
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !31
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
  call void @camel_init(), !dbg !114
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !115
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !116
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !115
  call void @__restore_registers(i16* %arraydecay), !dbg !117
  ret void, !dbg !118
}

declare dso_local void @__crt0_start(...) #1

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !119 {
entry:
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !120, metadata !DIExpression()), !dbg !121
  store i16 0, i16* %i, align 2, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !125
  %cmp = icmp ult i16 %0, 128, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !129
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !129
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !129
  %2 = load i16, i16* %i, align 2, !dbg !131
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !129
  store i16 0, i16* %arrayidx, align 2, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %3 = load i16, i16* %i, align 2, !dbg !134
  %inc = add i16 %3, 1, !dbg !134
  store i16 %inc, i16* %i, align 2, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !138
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !138
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !138
  store i16 0, i16* %insert_count, align 2, !dbg !139
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !140
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !140
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !140
  store i16 0, i16* %lookup_count, align 2, !dbg !141
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !142
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !142
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 7, !dbg !142
  store i16 0, i16* %inserted_count, align 2, !dbg !143
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !144
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !144
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 9, !dbg !144
  store i16 0, i16* %member_count, align 2, !dbg !145
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !146
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !146
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !146
  store i16 1, i16* %key, align 2, !dbg !147
  ret void, !dbg !148
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_generate_key() #0 !dbg !149 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !150
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !150
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !150
  %1 = load i16, i16* %key, align 2, !dbg !150
  %add = add i16 %1, 1, !dbg !151
  %mul = mul i16 %add, 17, !dbg !152
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !153
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !153
  %key2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !153
  store i16 %mul, i16* %key2, align 2, !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes() #0 !dbg !156 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !157
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !157
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !157
  %1 = load i16, i16* %key, align 2, !dbg !157
  %call = call zeroext i16 @hash_to_fingerprint(i16 zeroext %1), !dbg !158
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !159
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !159
  store i16 %call, i16* %fingerprint, align 2, !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_fingerprint(i16 zeroext %key) #0 !dbg !162 {
entry:
  %key.addr = alloca i16, align 2
  store i16 %key, i16* %key.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %key.addr, metadata !165, metadata !DIExpression()), !dbg !166
  %0 = bitcast i16* %key.addr to i8*, !dbg !167
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !168
  ret i16 %call, !dbg !169
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_1() #0 !dbg !170 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !171
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !171
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !171
  %1 = load i16, i16* %key, align 2, !dbg !171
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !172
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !173
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !173
  store i16 %call, i16* %index1, align 2, !dbg !174
  ret void, !dbg !175
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @hash_to_index(i16 zeroext %fp) #0 !dbg !176 {
entry:
  %fp.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  store i16 %fp, i16* %fp.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %fp.addr, metadata !180, metadata !DIExpression()), !dbg !181
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !182, metadata !DIExpression()), !dbg !184
  %0 = bitcast i16* %fp.addr to i8*, !dbg !185
  %call = call zeroext i16 @djb_hash(i8* %0, i16 2), !dbg !186
  store i16 %call, i16* %hash, align 2, !dbg !184
  %1 = load i16, i16* %hash, align 2, !dbg !187
  %and = and i16 %1, 127, !dbg !188
  ret i16 %and, !dbg !189
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_calc_indexes_index_2() #0 !dbg !190 {
entry:
  %fp_hash = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_hash, metadata !191, metadata !DIExpression()), !dbg !192
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !193
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !193
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !193
  %1 = load i16, i16* %fingerprint, align 2, !dbg !193
  %call = call zeroext i16 @hash_to_index(i16 zeroext %1), !dbg !194
  store i16 %call, i16* %fp_hash, align 2, !dbg !192
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !195
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !195
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !195
  %3 = load i16, i16* %index1, align 2, !dbg !195
  %4 = load i16, i16* %fp_hash, align 2, !dbg !196
  %xor = xor i16 %3, %4, !dbg !197
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !198
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !198
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !198
  store i16 %xor, i16* %index2, align 2, !dbg !199
  ret void, !dbg !200
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_add() #0 !dbg !201 {
entry:
  %fp_victim = alloca i16, align 2
  %index_victim = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !202
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !202
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !202
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !204
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !204
  %2 = load i16, i16* %index1, align 2, !dbg !204
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !202
  %3 = load i16, i16* %arrayidx, align 2, !dbg !202
  %tobool = icmp ne i16 %3, 0, !dbg !202
  br i1 %tobool, label %if.else, label %if.then, !dbg !205

if.then:                                          ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !206
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !206
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 10, !dbg !206
  store i8 1, i8* %success, align 2, !dbg !208
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !209
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !209
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !209
  %6 = load i16, i16* %fingerprint, align 2, !dbg !209
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !210
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !210
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !210
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !211
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !211
  %index17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !211
  %9 = load i16, i16* %index17, align 2, !dbg !211
  %arrayidx8 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !210
  store i16 %6, i16* %arrayidx8, align 2, !dbg !212
  br label %if.end53, !dbg !213

if.else:                                          ; preds = %entry
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !214
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !214
  %filter10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 0, !dbg !214
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !217
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !217
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 4, !dbg !217
  %12 = load i16, i16* %index2, align 2, !dbg !217
  %arrayidx12 = getelementptr inbounds [128 x i16], [128 x i16]* %filter10, i16 0, i16 %12, !dbg !214
  %13 = load i16, i16* %arrayidx12, align 2, !dbg !214
  %tobool13 = icmp ne i16 %13, 0, !dbg !214
  br i1 %tobool13, label %if.else24, label %if.then14, !dbg !218

if.then14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !219
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !219
  %success16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !219
  store i8 1, i8* %success16, align 2, !dbg !221
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !222
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !222
  %fingerprint18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 2, !dbg !222
  %16 = load i16, i16* %fingerprint18, align 2, !dbg !222
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !223
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !223
  %filter20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 0, !dbg !223
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !224
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !224
  %index222 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 4, !dbg !224
  %19 = load i16, i16* %index222, align 2, !dbg !224
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter20, i16 0, i16 %19, !dbg !223
  store i16 %16, i16* %arrayidx23, align 2, !dbg !225
  br label %if.end52, !dbg !226

if.else24:                                        ; preds = %if.else
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !227, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata i16* %index_victim, metadata !230, metadata !DIExpression()), !dbg !231
  %call = call i16 @rand(), !dbg !232
  %rem = srem i16 %call, 2, !dbg !234
  %tobool25 = icmp ne i16 %rem, 0, !dbg !234
  br i1 %tobool25, label %if.then26, label %if.else34, !dbg !235

if.then26:                                        ; preds = %if.else24
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !236
  %index128 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 3, !dbg !236
  %21 = load i16, i16* %index128, align 2, !dbg !236
  store i16 %21, i16* %index_victim, align 2, !dbg !238
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !239
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !239
  %filter30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 0, !dbg !239
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !240
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !240
  %index132 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !240
  %24 = load i16, i16* %index132, align 2, !dbg !240
  %arrayidx33 = getelementptr inbounds [128 x i16], [128 x i16]* %filter30, i16 0, i16 %24, !dbg !239
  %25 = load i16, i16* %arrayidx33, align 2, !dbg !239
  store i16 %25, i16* %fp_victim, align 2, !dbg !241
  br label %if.end, !dbg !242

if.else34:                                        ; preds = %if.else24
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !243
  %index236 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 4, !dbg !243
  %27 = load i16, i16* %index236, align 2, !dbg !243
  store i16 %27, i16* %index_victim, align 2, !dbg !245
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !246
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !246
  %filter38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 0, !dbg !246
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !247
  %index240 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 4, !dbg !247
  %30 = load i16, i16* %index240, align 2, !dbg !247
  %arrayidx41 = getelementptr inbounds [128 x i16], [128 x i16]* %filter38, i16 0, i16 %30, !dbg !246
  %31 = load i16, i16* %arrayidx41, align 2, !dbg !246
  store i16 %31, i16* %fp_victim, align 2, !dbg !248
  br label %if.end

if.end:                                           ; preds = %if.else34, %if.then26
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !249
  %fingerprint43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 2, !dbg !249
  %33 = load i16, i16* %fingerprint43, align 2, !dbg !249
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !250
  %filter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 0, !dbg !250
  %35 = load i16, i16* %index_victim, align 2, !dbg !251
  %arrayidx46 = getelementptr inbounds [128 x i16], [128 x i16]* %filter45, i16 0, i16 %35, !dbg !250
  store i16 %33, i16* %arrayidx46, align 2, !dbg !252
  %36 = load i16, i16* %index_victim, align 2, !dbg !253
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !254
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1, !dbg !254
  %index148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 3, !dbg !254
  store i16 %36, i16* %index148, align 2, !dbg !255
  %38 = load i16, i16* %fp_victim, align 2, !dbg !256
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !257
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1, !dbg !257
  %fingerprint50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 2, !dbg !257
  store i16 %38, i16* %fingerprint50, align 2, !dbg !258
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !259
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !259
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 5, !dbg !259
  store i16 0, i16* %relocation_count, align 2, !dbg !260
  br label %if.end52

if.end52:                                         ; preds = %if.end, %if.then14
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %if.then
  ret void, !dbg !261
}

declare dso_local i16 @rand() #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_relocate() #0 !dbg !262 {
entry:
  %fp_victim = alloca i16, align 2
  %fp_hash_victim = alloca i16, align 2
  %index2_victim = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %fp_victim, metadata !263, metadata !DIExpression()), !dbg !264
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !265
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !265
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !265
  %1 = load i16, i16* %fingerprint, align 2, !dbg !265
  store i16 %1, i16* %fp_victim, align 2, !dbg !264
  call void @llvm.dbg.declare(metadata i16* %fp_hash_victim, metadata !266, metadata !DIExpression()), !dbg !267
  %2 = load i16, i16* %fp_victim, align 2, !dbg !268
  %call = call zeroext i16 @hash_to_index(i16 zeroext %2), !dbg !269
  store i16 %call, i16* %fp_hash_victim, align 2, !dbg !267
  call void @llvm.dbg.declare(metadata i16* %index2_victim, metadata !270, metadata !DIExpression()), !dbg !271
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !272
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !272
  %4 = load i16, i16* %index1, align 2, !dbg !272
  %5 = load i16, i16* %fp_hash_victim, align 2, !dbg !273
  %xor = xor i16 %4, %5, !dbg !274
  store i16 %xor, i16* %index2_victim, align 2, !dbg !271
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !275
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 0, !dbg !275
  %7 = load i16, i16* %index2_victim, align 2, !dbg !277
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %7, !dbg !275
  %8 = load i16, i16* %arrayidx, align 2, !dbg !275
  %tobool = icmp ne i16 %8, 0, !dbg !275
  br i1 %tobool, label %if.end, label %if.then, !dbg !278

if.then:                                          ; preds = %entry
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !279
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !279
  store i8 1, i8* %success, align 2, !dbg !281
  %10 = load i16, i16* %fp_victim, align 2, !dbg !282
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !283
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !283
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !283
  %12 = load i16, i16* %index2_victim, align 2, !dbg !284
  %arrayidx6 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %12, !dbg !283
  store i16 %10, i16* %arrayidx6, align 2, !dbg !285
  br label %return, !dbg !286

if.end:                                           ; preds = %entry
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !287
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 5, !dbg !287
  %14 = load i16, i16* %relocation_count, align 2, !dbg !287
  %cmp = icmp uge i16 %14, 8, !dbg !289
  br i1 %cmp, label %if.then8, label %if.end11, !dbg !290

if.then8:                                         ; preds = %if.end
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !291
  %success10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 10, !dbg !291
  store i8 0, i8* %success10, align 2, !dbg !293
  br label %return, !dbg !294

if.end11:                                         ; preds = %if.end
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !295
  %relocation_count13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 5, !dbg !295
  %17 = load i16, i16* %relocation_count13, align 2, !dbg !296
  %inc = add i16 %17, 1, !dbg !296
  store i16 %inc, i16* %relocation_count13, align 2, !dbg !296
  %18 = load i16, i16* %index2_victim, align 2, !dbg !297
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !298
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !298
  %index115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 3, !dbg !298
  store i16 %18, i16* %index115, align 2, !dbg !299
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !300
  %filter17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 0, !dbg !300
  %21 = load i16, i16* %index2_victim, align 2, !dbg !301
  %arrayidx18 = getelementptr inbounds [128 x i16], [128 x i16]* %filter17, i16 0, i16 %21, !dbg !300
  %22 = load i16, i16* %arrayidx18, align 2, !dbg !300
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !302
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !302
  %fingerprint20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 2, !dbg !302
  store i16 %22, i16* %fingerprint20, align 2, !dbg !303
  %24 = load i16, i16* %fp_victim, align 2, !dbg !304
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !305
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !305
  %filter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 0, !dbg !305
  %26 = load i16, i16* %index2_victim, align 2, !dbg !306
  %arrayidx23 = getelementptr inbounds [128 x i16], [128 x i16]* %filter22, i16 0, i16 %26, !dbg !305
  store i16 %24, i16* %arrayidx23, align 2, !dbg !307
  br label %return, !dbg !308

return:                                           ; preds = %if.end11, %if.then8, %if.then
  ret void, !dbg !308
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_insert_done() #0 !dbg !309 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !310
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !310
  %1 = load i16, i16* %insert_count, align 2, !dbg !311
  %inc = add i16 %1, 1, !dbg !311
  store i16 %inc, i16* %insert_count, align 2, !dbg !311
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !312
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !312
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 10, !dbg !312
  %3 = load i8, i8* %success, align 2, !dbg !312
  %tobool = trunc i8 %3 to i1, !dbg !312
  %conv = zext i1 %tobool to i16, !dbg !312
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !313
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !313
  %inserted_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !313
  %5 = load i16, i16* %inserted_count, align 2, !dbg !314
  %add = add i16 %5, %conv, !dbg !314
  store i16 %add, i16* %inserted_count, align 2, !dbg !314
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !315
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !315
  %insert_count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !315
  %7 = load i16, i16* %insert_count4, align 2, !dbg !315
  %cmp = icmp uge i16 %7, 32, !dbg !317
  br i1 %cmp, label %if.then, label %if.end, !dbg !318

if.then:                                          ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !319
  %key = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 1, !dbg !319
  store i16 1, i16* %key, align 2, !dbg !321
  br label %if.end, !dbg !322

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !323
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_search() #0 !dbg !324 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !325
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !325
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !325
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !327
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !327
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 3, !dbg !327
  %2 = load i16, i16* %index1, align 2, !dbg !327
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %2, !dbg !325
  %3 = load i16, i16* %arrayidx, align 2, !dbg !325
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !328
  %fingerprint = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !328
  %5 = load i16, i16* %fingerprint, align 2, !dbg !328
  %cmp = icmp eq i16 %3, %5, !dbg !329
  br i1 %cmp, label %if.then, label %if.else, !dbg !330

if.then:                                          ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !331
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !331
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !331
  store i8 1, i8* %member, align 1, !dbg !333
  br label %if.end17, !dbg !334

if.else:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !335
  %filter5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 0, !dbg !335
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !338
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !338
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !338
  %9 = load i16, i16* %index2, align 2, !dbg !338
  %arrayidx7 = getelementptr inbounds [128 x i16], [128 x i16]* %filter5, i16 0, i16 %9, !dbg !335
  %10 = load i16, i16* %arrayidx7, align 2, !dbg !335
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !339
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !339
  %fingerprint9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 2, !dbg !339
  %12 = load i16, i16* %fingerprint9, align 2, !dbg !339
  %cmp10 = icmp eq i16 %10, %12, !dbg !340
  br i1 %cmp10, label %if.then11, label %if.else14, !dbg !341

if.then11:                                        ; preds = %if.else
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !342
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !342
  %member13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 11, !dbg !342
  store i8 1, i8* %member13, align 1, !dbg !344
  br label %if.end, !dbg !345

if.else14:                                        ; preds = %if.else
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !346
  %member16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 11, !dbg !346
  store i8 0, i8* %member16, align 1, !dbg !348
  br label %if.end

if.end:                                           ; preds = %if.else14, %if.then11
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then
  ret void, !dbg !349
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_lookup_done() #0 !dbg !350 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !351
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !351
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !351
  %1 = load i16, i16* %lookup_count, align 2, !dbg !352
  %inc = add i16 %1, 1, !dbg !352
  store i16 %inc, i16* %lookup_count, align 2, !dbg !352
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !353
  %member = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 11, !dbg !353
  %3 = load i8, i8* %member, align 1, !dbg !353
  %tobool = trunc i8 %3 to i1, !dbg !353
  %conv = zext i1 %tobool to i16, !dbg !353
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !354
  %member_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !354
  %5 = load i16, i16* %member_count, align 2, !dbg !355
  %add = add i16 %5, %conv, !dbg !355
  store i16 %add, i16* %member_count, align 2, !dbg !355
  ret void, !dbg !356
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !357 {
entry:
  call void @exit(i16 0) #6, !dbg !358
  unreachable, !dbg !358
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !359 {
entry:
  ret void, !dbg !360
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !361 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !364
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !365
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !366
  call void @camel_init(), !dbg !367
  call void @task_init(), !dbg !368
  br label %do.body, !dbg !368

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !369
  %cmp = icmp eq i16 %0, 1, !dbg !369
  br i1 %cmp, label %if.then, label %if.else, !dbg !372

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !373
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !373
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !373
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !373
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !373
  call void @__dump_registers(i16* %arraydecay), !dbg !373
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !373
  br label %if.end, !dbg !373

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !375
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !375
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !375
  %reg_file1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !375
  %arraydecay2 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file1, i16 0, i16 0, !dbg !375
  call void @__dump_registers(i16* %arraydecay2), !dbg !375
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !375
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !372

do.end:                                           ; preds = %if.end
  %unsafe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe, i32 0, i32 1
  %BCast = bitcast %struct.camel_global_t* %globals1 to i8*
  %safe = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe, i32 0, i32 1
  %BCast3 = bitcast %struct.camel_global_t* %globals2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast, i8* align 2 %BCast3, i16 276, i1 false), !dbg !368
  call void @task_commit(), !dbg !368
  br label %while.cond, !dbg !377

while.cond:                                       ; preds = %if.end120, %do.end
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !378
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !378
  %lookup_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !378
  %4 = load i16, i16* %lookup_count, align 2, !dbg !378
  %cmp3 = icmp ult i16 %4, 32, !dbg !379
  br i1 %cmp3, label %while.body, label %while.end121, !dbg !377

while.body:                                       ; preds = %while.cond
  %unsafe4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe4, i32 0, i32 1
  %BCast6 = bitcast %struct.camel_global_t* %globals5 to i8*
  %safe7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe7, i32 0, i32 1
  %BCast9 = bitcast %struct.camel_global_t* %globals8 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast6, i8* align 2 %BCast9, i16 276, i1 false), !dbg !380
  call void @task_generate_key(), !dbg !380
  br label %do.body4, !dbg !380

do.body4:                                         ; preds = %while.body
  %5 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !382
  %cmp5 = icmp eq i16 %5, 1, !dbg !382
  br i1 %cmp5, label %if.then6, label %if.else9, !dbg !385

if.then6:                                         ; preds = %do.body4
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !386
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !386
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !386
  %reg_file7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 0, !dbg !386
  %arraydecay8 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file7, i16 0, i16 0, !dbg !386
  call void @__dump_registers(i16* %arraydecay8), !dbg !386
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !386
  br label %if.end12, !dbg !386

if.else9:                                         ; preds = %do.body4
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !388
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !388
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !388
  %reg_file10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 0, !dbg !388
  %arraydecay11 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file10, i16 0, i16 0, !dbg !388
  call void @__dump_registers(i16* %arraydecay11), !dbg !388
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !388
  br label %if.end12

if.end12:                                         ; preds = %if.else9, %if.then6
  br label %do.end13, !dbg !385

do.end13:                                         ; preds = %if.end12
  call void @task_commit(), !dbg !380
  %unsafe10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe10, i32 0, i32 1
  %BCast12 = bitcast %struct.camel_global_t* %globals11 to i8*
  %safe13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe13, i32 0, i32 1
  %BCast15 = bitcast %struct.camel_global_t* %globals14 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast12, i8* align 2 %BCast15, i16 276, i1 false), !dbg !390
  call void @task_calc_indexes(), !dbg !390
  br label %do.body14, !dbg !390

do.body14:                                        ; preds = %do.end13
  %8 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !391
  %cmp15 = icmp eq i16 %8, 1, !dbg !391
  br i1 %cmp15, label %if.then16, label %if.else19, !dbg !394

if.then16:                                        ; preds = %do.body14
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !395
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !395
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !395
  %reg_file17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 0, !dbg !395
  %arraydecay18 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file17, i16 0, i16 0, !dbg !395
  call void @__dump_registers(i16* %arraydecay18), !dbg !395
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !395
  br label %if.end22, !dbg !395

if.else19:                                        ; preds = %do.body14
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !397
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !397
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !397
  %reg_file20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 0, !dbg !397
  %arraydecay21 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file20, i16 0, i16 0, !dbg !397
  call void @__dump_registers(i16* %arraydecay21), !dbg !397
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !397
  br label %if.end22

if.end22:                                         ; preds = %if.else19, %if.then16
  br label %do.end23, !dbg !394

do.end23:                                         ; preds = %if.end22
  call void @task_commit(), !dbg !390
  %unsafe16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe16, i32 0, i32 1
  %BCast18 = bitcast %struct.camel_global_t* %globals17 to i8*
  %safe19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe19, i32 0, i32 1
  %BCast21 = bitcast %struct.camel_global_t* %globals20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast18, i8* align 2 %BCast21, i16 276, i1 false), !dbg !399
  call void @task_calc_indexes_index_1(), !dbg !399
  br label %do.body24, !dbg !399

do.body24:                                        ; preds = %do.end23
  %11 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !400
  %cmp25 = icmp eq i16 %11, 1, !dbg !400
  br i1 %cmp25, label %if.then26, label %if.else29, !dbg !403

if.then26:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !404
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !404
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !404
  %reg_file27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !404
  %arraydecay28 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file27, i16 0, i16 0, !dbg !404
  call void @__dump_registers(i16* %arraydecay28), !dbg !404
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !404
  br label %if.end32, !dbg !404

if.else29:                                        ; preds = %do.body24
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !406
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !406
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !406
  %reg_file30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 0, !dbg !406
  %arraydecay31 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file30, i16 0, i16 0, !dbg !406
  call void @__dump_registers(i16* %arraydecay31), !dbg !406
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !406
  br label %if.end32

if.end32:                                         ; preds = %if.else29, %if.then26
  br label %do.end33, !dbg !403

do.end33:                                         ; preds = %if.end32
  call void @task_commit(), !dbg !399
  %unsafe22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe22, i32 0, i32 1
  %BCast24 = bitcast %struct.camel_global_t* %globals23 to i8*
  %safe25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe25, i32 0, i32 1
  %BCast27 = bitcast %struct.camel_global_t* %globals26 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast24, i8* align 2 %BCast27, i16 276, i1 false), !dbg !408
  call void @task_calc_indexes_index_2(), !dbg !408
  br label %do.body34, !dbg !408

do.body34:                                        ; preds = %do.end33
  %14 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !409
  %cmp35 = icmp eq i16 %14, 1, !dbg !409
  br i1 %cmp35, label %if.then36, label %if.else39, !dbg !412

if.then36:                                        ; preds = %do.body34
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !413
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !413
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !413
  %reg_file37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 0, !dbg !413
  %arraydecay38 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file37, i16 0, i16 0, !dbg !413
  call void @__dump_registers(i16* %arraydecay38), !dbg !413
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !413
  br label %if.end42, !dbg !413

if.else39:                                        ; preds = %do.body34
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !415
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !415
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !415
  %reg_file40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 0, !dbg !415
  %arraydecay41 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file40, i16 0, i16 0, !dbg !415
  call void @__dump_registers(i16* %arraydecay41), !dbg !415
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !415
  br label %if.end42

if.end42:                                         ; preds = %if.else39, %if.then36
  br label %do.end43, !dbg !412

do.end43:                                         ; preds = %if.end42
  call void @task_commit(), !dbg !408
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !417
  %insert_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 6, !dbg !417
  %18 = load i16, i16* %insert_count, align 2, !dbg !417
  %cmp45 = icmp ult i16 %18, 32, !dbg !419
  br i1 %cmp45, label %if.then46, label %if.else97, !dbg !420

if.then46:                                        ; preds = %do.end43
  %unsafe28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe28, i32 0, i32 1
  %BCast30 = bitcast %struct.camel_global_t* %globals29 to i8*
  %safe31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe31, i32 0, i32 1
  %BCast33 = bitcast %struct.camel_global_t* %globals32 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast30, i8* align 2 %BCast33, i16 276, i1 false), !dbg !421
  call void @task_add(), !dbg !421
  br label %do.body47, !dbg !421

do.body47:                                        ; preds = %if.then46
  %19 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !423
  %cmp48 = icmp eq i16 %19, 1, !dbg !423
  br i1 %cmp48, label %if.then49, label %if.else52, !dbg !426

if.then49:                                        ; preds = %do.body47
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !427
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !427
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !427
  %reg_file50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 0, !dbg !427
  %arraydecay51 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file50, i16 0, i16 0, !dbg !427
  call void @__dump_registers(i16* %arraydecay51), !dbg !427
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !427
  br label %if.end55, !dbg !427

if.else52:                                        ; preds = %do.body47
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !429
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !429
  %reg_file53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !429
  %arraydecay54 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file53, i16 0, i16 0, !dbg !429
  call void @__dump_registers(i16* %arraydecay54), !dbg !429
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !429
  br label %if.end55

if.end55:                                         ; preds = %if.else52, %if.then49
  br label %do.end56, !dbg !426

do.end56:                                         ; preds = %if.end55
  call void @task_commit(), !dbg !421
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !431
  %globals57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !431
  %filter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals57, i32 0, i32 0, !dbg !431
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !433
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !433
  %index1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 3, !dbg !433
  %24 = load i16, i16* %index1, align 2, !dbg !433
  %arrayidx = getelementptr inbounds [128 x i16], [128 x i16]* %filter, i16 0, i16 %24, !dbg !431
  %25 = load i16, i16* %arrayidx, align 2, !dbg !431
  %tobool = icmp ne i16 %25, 0, !dbg !431
  br i1 %tobool, label %land.lhs.true, label %if.end85, !dbg !434

land.lhs.true:                                    ; preds = %do.end56
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !435
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !435
  %filter60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 0, !dbg !435
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !436
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !436
  %index2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 4, !dbg !436
  %28 = load i16, i16* %index2, align 2, !dbg !436
  %arrayidx62 = getelementptr inbounds [128 x i16], [128 x i16]* %filter60, i16 0, i16 %28, !dbg !435
  %29 = load i16, i16* %arrayidx62, align 2, !dbg !435
  %tobool63 = icmp ne i16 %29, 0, !dbg !435
  br i1 %tobool63, label %if.then64, label %if.end85, !dbg !437

if.then64:                                        ; preds = %land.lhs.true
  br label %while.cond65, !dbg !438

while.cond65:                                     ; preds = %do.end84, %if.then64
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !440
  %globals66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !440
  %success = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals66, i32 0, i32 10, !dbg !440
  %31 = load i8, i8* %success, align 2, !dbg !440
  %tobool67 = trunc i8 %31 to i1, !dbg !440
  %conv = zext i1 %tobool67 to i16, !dbg !440
  %cmp68 = icmp eq i16 %conv, 0, !dbg !441
  br i1 %cmp68, label %land.rhs, label %land.end, !dbg !442

land.rhs:                                         ; preds = %while.cond65
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !443
  %globals70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !443
  %relocation_count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals70, i32 0, i32 5, !dbg !443
  %33 = load i16, i16* %relocation_count, align 2, !dbg !443
  %cmp71 = icmp ult i16 %33, 8, !dbg !444
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond65
  %34 = phi i1 [ false, %while.cond65 ], [ %cmp71, %land.rhs ], !dbg !445
  br i1 %34, label %while.body73, label %while.end, !dbg !438

while.body73:                                     ; preds = %land.end
  %unsafe34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe34, i32 0, i32 1
  %BCast36 = bitcast %struct.camel_global_t* %globals35 to i8*
  %safe37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe37, i32 0, i32 1
  %BCast39 = bitcast %struct.camel_global_t* %globals38 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast36, i8* align 2 %BCast39, i16 276, i1 false), !dbg !446
  call void @task_relocate(), !dbg !446
  br label %do.body74, !dbg !446

do.body74:                                        ; preds = %while.body73
  %35 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !448
  %cmp75 = icmp eq i16 %35, 1, !dbg !448
  br i1 %cmp75, label %if.then77, label %if.else80, !dbg !451

if.then77:                                        ; preds = %do.body74
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !452
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !452
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !452
  %reg_file78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 0, !dbg !452
  %arraydecay79 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file78, i16 0, i16 0, !dbg !452
  call void @__dump_registers(i16* %arraydecay79), !dbg !452
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !452
  br label %if.end83, !dbg !452

if.else80:                                        ; preds = %do.body74
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !454
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !454
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !454
  %reg_file81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 0, !dbg !454
  %arraydecay82 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file81, i16 0, i16 0, !dbg !454
  call void @__dump_registers(i16* %arraydecay82), !dbg !454
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !454
  br label %if.end83

if.end83:                                         ; preds = %if.else80, %if.then77
  br label %do.end84, !dbg !451

do.end84:                                         ; preds = %if.end83
  call void @task_commit(), !dbg !446
  br label %while.cond65, !dbg !438, !llvm.loop !456

while.end:                                        ; preds = %land.end
  br label %if.end85, !dbg !458

if.end85:                                         ; preds = %while.end, %land.lhs.true, %do.end56
  %unsafe40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe40, i32 0, i32 1
  %BCast42 = bitcast %struct.camel_global_t* %globals41 to i8*
  %safe43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe43, i32 0, i32 1
  %BCast46 = bitcast %struct.camel_global_t* %globals45 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast42, i8* align 2 %BCast46, i16 276, i1 false), !dbg !459
  call void @task_insert_done(), !dbg !459
  br label %do.body86, !dbg !459

do.body86:                                        ; preds = %if.end85
  %38 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !460
  %cmp87 = icmp eq i16 %38, 1, !dbg !460
  br i1 %cmp87, label %if.then89, label %if.else92, !dbg !463

if.then89:                                        ; preds = %do.body86
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !464
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !464
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !464
  %reg_file90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 0, !dbg !464
  %arraydecay91 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file90, i16 0, i16 0, !dbg !464
  call void @__dump_registers(i16* %arraydecay91), !dbg !464
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !464
  br label %if.end95, !dbg !464

if.else92:                                        ; preds = %do.body86
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !466
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !466
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !466
  %reg_file93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 0, !dbg !466
  %arraydecay94 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file93, i16 0, i16 0, !dbg !466
  call void @__dump_registers(i16* %arraydecay94), !dbg !466
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !466
  br label %if.end95

if.end95:                                         ; preds = %if.else92, %if.then89
  br label %do.end96, !dbg !463

do.end96:                                         ; preds = %if.end95
  call void @task_commit(), !dbg !459
  br label %if.end120, !dbg !468

if.else97:                                        ; preds = %do.end43
  %unsafe47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe47, i32 0, i32 1
  %BCast49 = bitcast %struct.camel_global_t* %globals48 to i8*
  %safe50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe50, i32 0, i32 1
  %BCast52 = bitcast %struct.camel_global_t* %globals51 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast49, i8* align 2 %BCast52, i16 276, i1 false), !dbg !469
  call void @task_lookup_search(), !dbg !469
  br label %do.body98, !dbg !469

do.body98:                                        ; preds = %if.else97
  %41 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !471
  %cmp99 = icmp eq i16 %41, 1, !dbg !471
  br i1 %cmp99, label %if.then101, label %if.else104, !dbg !474

if.then101:                                       ; preds = %do.body98
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !475
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !475
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !475
  %reg_file102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 0, !dbg !475
  %arraydecay103 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file102, i16 0, i16 0, !dbg !475
  call void @__dump_registers(i16* %arraydecay103), !dbg !475
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !475
  br label %if.end107, !dbg !475

if.else104:                                       ; preds = %do.body98
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !477
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !477
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !477
  %reg_file105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !477
  %arraydecay106 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file105, i16 0, i16 0, !dbg !477
  call void @__dump_registers(i16* %arraydecay106), !dbg !477
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !477
  br label %if.end107

if.end107:                                        ; preds = %if.else104, %if.then101
  br label %do.end108, !dbg !474

do.end108:                                        ; preds = %if.end107
  call void @task_commit(), !dbg !469
  %unsafe53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe53, i32 0, i32 1
  %BCast55 = bitcast %struct.camel_global_t* %globals54 to i8*
  %safe56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe56, i32 0, i32 1
  %BCast61 = bitcast %struct.camel_global_t* %globals60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast55, i8* align 2 %BCast61, i16 276, i1 false), !dbg !479
  call void @task_lookup_done(), !dbg !479
  br label %do.body109, !dbg !479

do.body109:                                       ; preds = %do.end108
  %44 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !480
  %cmp110 = icmp eq i16 %44, 1, !dbg !480
  br i1 %cmp110, label %if.then112, label %if.else115, !dbg !483

if.then112:                                       ; preds = %do.body109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !484
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !484
  %reg_file113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 0, !dbg !484
  %arraydecay114 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file113, i16 0, i16 0, !dbg !484
  call void @__dump_registers(i16* %arraydecay114), !dbg !484
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !484
  br label %if.end118, !dbg !484

if.else115:                                       ; preds = %do.body109
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !486
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %reg_file116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 0, !dbg !486
  %arraydecay117 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file116, i16 0, i16 0, !dbg !486
  call void @__dump_registers(i16* %arraydecay117), !dbg !486
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !486
  br label %if.end118

if.end118:                                        ; preds = %if.else115, %if.then112
  br label %do.end119, !dbg !483

do.end119:                                        ; preds = %if.end118
  call void @task_commit(), !dbg !479
  br label %if.end120

if.end120:                                        ; preds = %do.end119, %do.end96
  br label %while.cond, !dbg !377, !llvm.loop !488

while.end121:                                     ; preds = %while.cond
  %unsafe62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %unsafe62, i32 0, i32 1
  %BCast64 = bitcast %struct.camel_global_t* %globals63 to i8*
  %safe65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2
  %globals67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %safe65, i32 0, i32 1
  %BCast68 = bitcast %struct.camel_global_t* %globals67 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %BCast64, i8* align 2 %BCast68, i16 276, i1 false), !dbg !490
  call void @task_done(), !dbg !490
  %47 = load i16, i16* %retval, align 2, !dbg !491
  ret i16 %47, !dbg !491
}

declare dso_local void @__dump_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define internal zeroext i16 @djb_hash(i8* %data, i16 %len) #0 !dbg !492 {
entry:
  %data.addr = alloca i8*, align 2
  %len.addr = alloca i16, align 2
  %hash = alloca i16, align 2
  %i = alloca i16, align 2
  store i8* %data, i8** %data.addr, align 2
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !495, metadata !DIExpression()), !dbg !496
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !497, metadata !DIExpression()), !dbg !498
  call void @llvm.dbg.declare(metadata i16* %hash, metadata !499, metadata !DIExpression()), !dbg !500
  store i16 5381, i16* %hash, align 2, !dbg !500
  call void @llvm.dbg.declare(metadata i16* %i, metadata !501, metadata !DIExpression()), !dbg !502
  store i16 0, i16* %i, align 2, !dbg !503
  br label %for.cond, !dbg !505

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !506
  %1 = load i16, i16* %len.addr, align 2, !dbg !508
  %cmp = icmp ult i16 %0, %1, !dbg !509
  br i1 %cmp, label %for.body, label %for.end, !dbg !510

for.body:                                         ; preds = %for.cond
  %2 = load i16, i16* %hash, align 2, !dbg !511
  %shl = shl i16 %2, 5, !dbg !512
  %3 = load i16, i16* %hash, align 2, !dbg !513
  %add = add i16 %shl, %3, !dbg !514
  %4 = load i8*, i8** %data.addr, align 2, !dbg !515
  %5 = load i8, i8* %4, align 1, !dbg !516
  %conv = zext i8 %5 to i16, !dbg !517
  %add1 = add i16 %add, %conv, !dbg !518
  store i16 %add1, i16* %hash, align 2, !dbg !519
  br label %for.inc, !dbg !520

for.inc:                                          ; preds = %for.body
  %6 = load i8*, i8** %data.addr, align 2, !dbg !521
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1, !dbg !521
  store i8* %incdec.ptr, i8** %data.addr, align 2, !dbg !521
  %7 = load i16, i16* %i, align 2, !dbg !522
  %inc = add i16 %7, 1, !dbg !522
  store i16 %inc, i16* %i, align 2, !dbg !522
  br label %for.cond, !dbg !523, !llvm.loop !524

for.end:                                          ; preds = %for.cond
  %8 = load i16, i16* %hash, align 2, !dbg !526
  ret i16 %8, !dbg !527
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #4

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
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
!111 = !DILocation(line: 185, column: 5, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !3, line: 185, column: 5)
!113 = !{i32 -2146596343}
!114 = !DILocation(line: 186, column: 5, scope: !92)
!115 = !DILocation(line: 187, column: 25, scope: !92)
!116 = !DILocation(line: 187, column: 31, scope: !92)
!117 = !DILocation(line: 187, column: 5, scope: !92)
!118 = !DILocation(line: 210, column: 1, scope: !92)
!119 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 239, type: !27, scopeLine: 240, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!120 = !DILocalVariable(name: "i", scope: !119, file: !3, line: 241, type: !6)
!121 = !DILocation(line: 241, column: 14, scope: !119)
!122 = !DILocation(line: 242, column: 12, scope: !123)
!123 = distinct !DILexicalBlock(scope: !119, file: !3, line: 242, column: 5)
!124 = !DILocation(line: 242, column: 10, scope: !123)
!125 = !DILocation(line: 242, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !3, line: 242, column: 5)
!127 = !DILocation(line: 242, column: 19, scope: !126)
!128 = !DILocation(line: 242, column: 5, scope: !123)
!129 = !DILocation(line: 243, column: 9, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !3, line: 242, column: 40)
!131 = !DILocation(line: 243, column: 20, scope: !130)
!132 = !DILocation(line: 243, column: 23, scope: !130)
!133 = !DILocation(line: 244, column: 5, scope: !130)
!134 = !DILocation(line: 242, column: 35, scope: !126)
!135 = !DILocation(line: 242, column: 5, scope: !126)
!136 = distinct !{!136, !128, !137}
!137 = !DILocation(line: 244, column: 5, scope: !123)
!138 = !DILocation(line: 245, column: 5, scope: !119)
!139 = !DILocation(line: 245, column: 22, scope: !119)
!140 = !DILocation(line: 246, column: 5, scope: !119)
!141 = !DILocation(line: 246, column: 22, scope: !119)
!142 = !DILocation(line: 247, column: 5, scope: !119)
!143 = !DILocation(line: 247, column: 24, scope: !119)
!144 = !DILocation(line: 248, column: 5, scope: !119)
!145 = !DILocation(line: 248, column: 22, scope: !119)
!146 = !DILocation(line: 249, column: 5, scope: !119)
!147 = !DILocation(line: 249, column: 13, scope: !119)
!148 = !DILocation(line: 250, column: 1, scope: !119)
!149 = distinct !DISubprogram(name: "task_generate_key", scope: !3, file: !3, line: 252, type: !27, scopeLine: 253, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!150 = !DILocation(line: 255, column: 16, scope: !149)
!151 = !DILocation(line: 255, column: 24, scope: !149)
!152 = !DILocation(line: 255, column: 29, scope: !149)
!153 = !DILocation(line: 255, column: 5, scope: !149)
!154 = !DILocation(line: 255, column: 13, scope: !149)
!155 = !DILocation(line: 256, column: 1, scope: !149)
!156 = distinct !DISubprogram(name: "task_calc_indexes", scope: !3, file: !3, line: 258, type: !27, scopeLine: 259, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocation(line: 260, column: 43, scope: !156)
!158 = !DILocation(line: 260, column: 23, scope: !156)
!159 = !DILocation(line: 260, column: 5, scope: !156)
!160 = !DILocation(line: 260, column: 21, scope: !156)
!161 = !DILocation(line: 261, column: 1, scope: !156)
!162 = distinct !DISubprogram(name: "hash_to_fingerprint", scope: !3, file: !3, line: 234, type: !163, scopeLine: 235, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DISubroutineType(types: !164)
!164 = !{!50, !17}
!165 = !DILocalVariable(name: "key", arg: 1, scope: !162, file: !3, line: 234, type: !17)
!166 = !DILocation(line: 234, column: 50, scope: !162)
!167 = !DILocation(line: 236, column: 21, scope: !162)
!168 = !DILocation(line: 236, column: 12, scope: !162)
!169 = !DILocation(line: 236, column: 5, scope: !162)
!170 = distinct !DISubprogram(name: "task_calc_indexes_index_1", scope: !3, file: !3, line: 263, type: !27, scopeLine: 264, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocation(line: 265, column: 32, scope: !170)
!172 = !DILocation(line: 265, column: 18, scope: !170)
!173 = !DILocation(line: 265, column: 5, scope: !170)
!174 = !DILocation(line: 265, column: 16, scope: !170)
!175 = !DILocation(line: 266, column: 1, scope: !170)
!176 = distinct !DISubprogram(name: "hash_to_index", scope: !3, file: !3, line: 228, type: !177, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!177 = !DISubroutineType(types: !178)
!178 = !{!179, !50}
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "index_t", file: !3, line: 21, baseType: !18)
!180 = !DILocalVariable(name: "fp", arg: 1, scope: !176, file: !3, line: 228, type: !50)
!181 = !DILocation(line: 228, column: 44, scope: !176)
!182 = !DILocalVariable(name: "hash", scope: !176, file: !3, line: 230, type: !183)
!183 = !DIDerivedType(tag: DW_TAG_typedef, name: "hash_t", file: !3, line: 19, baseType: !18)
!184 = !DILocation(line: 230, column: 12, scope: !176)
!185 = !DILocation(line: 230, column: 28, scope: !176)
!186 = !DILocation(line: 230, column: 19, scope: !176)
!187 = !DILocation(line: 231, column: 12, scope: !176)
!188 = !DILocation(line: 231, column: 17, scope: !176)
!189 = !DILocation(line: 231, column: 5, scope: !176)
!190 = distinct !DISubprogram(name: "task_calc_indexes_index_2", scope: !3, file: !3, line: 268, type: !27, scopeLine: 269, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!191 = !DILocalVariable(name: "fp_hash", scope: !190, file: !3, line: 270, type: !179)
!192 = !DILocation(line: 270, column: 13, scope: !190)
!193 = !DILocation(line: 270, column: 37, scope: !190)
!194 = !DILocation(line: 270, column: 23, scope: !190)
!195 = !DILocation(line: 271, column: 18, scope: !190)
!196 = !DILocation(line: 271, column: 31, scope: !190)
!197 = !DILocation(line: 271, column: 29, scope: !190)
!198 = !DILocation(line: 271, column: 5, scope: !190)
!199 = !DILocation(line: 271, column: 16, scope: !190)
!200 = !DILocation(line: 272, column: 1, scope: !190)
!201 = distinct !DISubprogram(name: "task_add", scope: !3, file: !3, line: 274, type: !27, scopeLine: 275, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!202 = !DILocation(line: 276, column: 10, scope: !203)
!203 = distinct !DILexicalBlock(scope: !201, file: !3, line: 276, column: 9)
!204 = !DILocation(line: 276, column: 21, scope: !203)
!205 = !DILocation(line: 276, column: 9, scope: !201)
!206 = !DILocation(line: 277, column: 9, scope: !207)
!207 = distinct !DILexicalBlock(scope: !203, file: !3, line: 276, column: 34)
!208 = !DILocation(line: 277, column: 21, scope: !207)
!209 = !DILocation(line: 278, column: 34, scope: !207)
!210 = !DILocation(line: 278, column: 9, scope: !207)
!211 = !DILocation(line: 278, column: 20, scope: !207)
!212 = !DILocation(line: 278, column: 32, scope: !207)
!213 = !DILocation(line: 279, column: 5, scope: !207)
!214 = !DILocation(line: 280, column: 14, scope: !215)
!215 = distinct !DILexicalBlock(scope: !216, file: !3, line: 280, column: 13)
!216 = distinct !DILexicalBlock(scope: !203, file: !3, line: 279, column: 12)
!217 = !DILocation(line: 280, column: 25, scope: !215)
!218 = !DILocation(line: 280, column: 13, scope: !216)
!219 = !DILocation(line: 281, column: 13, scope: !220)
!220 = distinct !DILexicalBlock(scope: !215, file: !3, line: 280, column: 38)
!221 = !DILocation(line: 281, column: 25, scope: !220)
!222 = !DILocation(line: 282, column: 38, scope: !220)
!223 = !DILocation(line: 282, column: 13, scope: !220)
!224 = !DILocation(line: 282, column: 24, scope: !220)
!225 = !DILocation(line: 282, column: 36, scope: !220)
!226 = !DILocation(line: 283, column: 9, scope: !220)
!227 = !DILocalVariable(name: "fp_victim", scope: !228, file: !3, line: 284, type: !50)
!228 = distinct !DILexicalBlock(scope: !215, file: !3, line: 283, column: 16)
!229 = !DILocation(line: 284, column: 27, scope: !228)
!230 = !DILocalVariable(name: "index_victim", scope: !228, file: !3, line: 285, type: !179)
!231 = !DILocation(line: 285, column: 21, scope: !228)
!232 = !DILocation(line: 286, column: 17, scope: !233)
!233 = distinct !DILexicalBlock(scope: !228, file: !3, line: 286, column: 17)
!234 = !DILocation(line: 286, column: 24, scope: !233)
!235 = !DILocation(line: 286, column: 17, scope: !228)
!236 = !DILocation(line: 287, column: 32, scope: !237)
!237 = distinct !DILexicalBlock(scope: !233, file: !3, line: 286, column: 29)
!238 = !DILocation(line: 287, column: 30, scope: !237)
!239 = !DILocation(line: 288, column: 29, scope: !237)
!240 = !DILocation(line: 288, column: 40, scope: !237)
!241 = !DILocation(line: 288, column: 27, scope: !237)
!242 = !DILocation(line: 289, column: 13, scope: !237)
!243 = !DILocation(line: 290, column: 32, scope: !244)
!244 = distinct !DILexicalBlock(scope: !233, file: !3, line: 289, column: 20)
!245 = !DILocation(line: 290, column: 30, scope: !244)
!246 = !DILocation(line: 291, column: 29, scope: !244)
!247 = !DILocation(line: 291, column: 40, scope: !244)
!248 = !DILocation(line: 291, column: 27, scope: !244)
!249 = !DILocation(line: 295, column: 40, scope: !228)
!250 = !DILocation(line: 295, column: 13, scope: !228)
!251 = !DILocation(line: 295, column: 24, scope: !228)
!252 = !DILocation(line: 295, column: 38, scope: !228)
!253 = !DILocation(line: 296, column: 26, scope: !228)
!254 = !DILocation(line: 296, column: 13, scope: !228)
!255 = !DILocation(line: 296, column: 24, scope: !228)
!256 = !DILocation(line: 297, column: 31, scope: !228)
!257 = !DILocation(line: 297, column: 13, scope: !228)
!258 = !DILocation(line: 297, column: 29, scope: !228)
!259 = !DILocation(line: 298, column: 13, scope: !228)
!260 = !DILocation(line: 298, column: 34, scope: !228)
!261 = !DILocation(line: 301, column: 1, scope: !201)
!262 = distinct !DISubprogram(name: "task_relocate", scope: !3, file: !3, line: 303, type: !27, scopeLine: 304, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!263 = !DILocalVariable(name: "fp_victim", scope: !262, file: !3, line: 305, type: !50)
!264 = !DILocation(line: 305, column: 19, scope: !262)
!265 = !DILocation(line: 305, column: 31, scope: !262)
!266 = !DILocalVariable(name: "fp_hash_victim", scope: !262, file: !3, line: 306, type: !179)
!267 = !DILocation(line: 306, column: 13, scope: !262)
!268 = !DILocation(line: 306, column: 44, scope: !262)
!269 = !DILocation(line: 306, column: 30, scope: !262)
!270 = !DILocalVariable(name: "index2_victim", scope: !262, file: !3, line: 307, type: !179)
!271 = !DILocation(line: 307, column: 13, scope: !262)
!272 = !DILocation(line: 307, column: 29, scope: !262)
!273 = !DILocation(line: 307, column: 42, scope: !262)
!274 = !DILocation(line: 307, column: 40, scope: !262)
!275 = !DILocation(line: 311, column: 14, scope: !276)
!276 = distinct !DILexicalBlock(scope: !262, file: !3, line: 311, column: 13)
!277 = !DILocation(line: 311, column: 25, scope: !276)
!278 = !DILocation(line: 311, column: 13, scope: !262)
!279 = !DILocation(line: 312, column: 13, scope: !280)
!280 = distinct !DILexicalBlock(scope: !276, file: !3, line: 311, column: 41)
!281 = !DILocation(line: 312, column: 25, scope: !280)
!282 = !DILocation(line: 313, column: 41, scope: !280)
!283 = !DILocation(line: 313, column: 13, scope: !280)
!284 = !DILocation(line: 313, column: 24, scope: !280)
!285 = !DILocation(line: 313, column: 39, scope: !280)
!286 = !DILocation(line: 314, column: 13, scope: !280)
!287 = !DILocation(line: 318, column: 13, scope: !288)
!288 = distinct !DILexicalBlock(scope: !262, file: !3, line: 318, column: 13)
!289 = !DILocation(line: 318, column: 34, scope: !288)
!290 = !DILocation(line: 318, column: 13, scope: !262)
!291 = !DILocation(line: 319, column: 13, scope: !292)
!292 = distinct !DILexicalBlock(scope: !288, file: !3, line: 318, column: 54)
!293 = !DILocation(line: 319, column: 25, scope: !292)
!294 = !DILocation(line: 320, column: 13, scope: !292)
!295 = !DILocation(line: 323, column: 11, scope: !262)
!296 = !DILocation(line: 323, column: 9, scope: !262)
!297 = !DILocation(line: 324, column: 22, scope: !262)
!298 = !DILocation(line: 324, column: 9, scope: !262)
!299 = !DILocation(line: 324, column: 20, scope: !262)
!300 = !DILocation(line: 325, column: 27, scope: !262)
!301 = !DILocation(line: 325, column: 38, scope: !262)
!302 = !DILocation(line: 325, column: 9, scope: !262)
!303 = !DILocation(line: 325, column: 25, scope: !262)
!304 = !DILocation(line: 326, column: 37, scope: !262)
!305 = !DILocation(line: 326, column: 9, scope: !262)
!306 = !DILocation(line: 326, column: 20, scope: !262)
!307 = !DILocation(line: 326, column: 35, scope: !262)
!308 = !DILocation(line: 327, column: 1, scope: !262)
!309 = distinct !DISubprogram(name: "task_insert_done", scope: !3, file: !3, line: 329, type: !27, scopeLine: 330, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!310 = !DILocation(line: 331, column: 7, scope: !309)
!311 = !DILocation(line: 331, column: 5, scope: !309)
!312 = !DILocation(line: 332, column: 27, scope: !309)
!313 = !DILocation(line: 332, column: 5, scope: !309)
!314 = !DILocation(line: 332, column: 24, scope: !309)
!315 = !DILocation(line: 334, column: 9, scope: !316)
!316 = distinct !DILexicalBlock(scope: !309, file: !3, line: 334, column: 9)
!317 = !DILocation(line: 334, column: 26, scope: !316)
!318 = !DILocation(line: 334, column: 9, scope: !309)
!319 = !DILocation(line: 336, column: 9, scope: !320)
!320 = distinct !DILexicalBlock(scope: !316, file: !3, line: 334, column: 42)
!321 = !DILocation(line: 336, column: 17, scope: !320)
!322 = !DILocation(line: 338, column: 5, scope: !320)
!323 = !DILocation(line: 339, column: 1, scope: !309)
!324 = distinct !DISubprogram(name: "task_lookup_search", scope: !3, file: !3, line: 341, type: !27, scopeLine: 342, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!325 = !DILocation(line: 343, column: 9, scope: !326)
!326 = distinct !DILexicalBlock(scope: !324, file: !3, line: 343, column: 9)
!327 = !DILocation(line: 343, column: 20, scope: !326)
!328 = !DILocation(line: 343, column: 35, scope: !326)
!329 = !DILocation(line: 343, column: 32, scope: !326)
!330 = !DILocation(line: 343, column: 9, scope: !324)
!331 = !DILocation(line: 344, column: 9, scope: !332)
!332 = distinct !DILexicalBlock(scope: !326, file: !3, line: 343, column: 52)
!333 = !DILocation(line: 344, column: 20, scope: !332)
!334 = !DILocation(line: 345, column: 5, scope: !332)
!335 = !DILocation(line: 346, column: 13, scope: !336)
!336 = distinct !DILexicalBlock(scope: !337, file: !3, line: 346, column: 13)
!337 = distinct !DILexicalBlock(scope: !326, file: !3, line: 345, column: 12)
!338 = !DILocation(line: 346, column: 24, scope: !336)
!339 = !DILocation(line: 346, column: 39, scope: !336)
!340 = !DILocation(line: 346, column: 36, scope: !336)
!341 = !DILocation(line: 346, column: 13, scope: !337)
!342 = !DILocation(line: 347, column: 13, scope: !343)
!343 = distinct !DILexicalBlock(scope: !336, file: !3, line: 346, column: 56)
!344 = !DILocation(line: 347, column: 24, scope: !343)
!345 = !DILocation(line: 348, column: 9, scope: !343)
!346 = !DILocation(line: 350, column: 13, scope: !347)
!347 = distinct !DILexicalBlock(scope: !336, file: !3, line: 349, column: 14)
!348 = !DILocation(line: 350, column: 24, scope: !347)
!349 = !DILocation(line: 353, column: 1, scope: !324)
!350 = distinct !DISubprogram(name: "task_lookup_done", scope: !3, file: !3, line: 355, type: !27, scopeLine: 356, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!351 = !DILocation(line: 357, column: 7, scope: !350)
!352 = !DILocation(line: 357, column: 5, scope: !350)
!353 = !DILocation(line: 359, column: 25, scope: !350)
!354 = !DILocation(line: 359, column: 5, scope: !350)
!355 = !DILocation(line: 359, column: 22, scope: !350)
!356 = !DILocation(line: 361, column: 1, scope: !350)
!357 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 363, type: !27, scopeLine: 364, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!358 = !DILocation(line: 365, column: 5, scope: !357)
!359 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 368, type: !27, scopeLine: 368, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!360 = !DILocation(line: 371, column: 1, scope: !359)
!361 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 375, type: !362, scopeLine: 375, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!362 = !DISubroutineType(types: !363)
!363 = !{!23}
!364 = !DILocation(line: 377, column: 16, scope: !361)
!365 = !DILocation(line: 378, column: 10, scope: !361)
!366 = !DILocation(line: 379, column: 12, scope: !361)
!367 = !DILocation(line: 380, column: 5, scope: !361)
!368 = !DILocation(line: 382, column: 5, scope: !361)
!369 = !DILocation(line: 382, column: 5, scope: !370)
!370 = distinct !DILexicalBlock(scope: !371, file: !3, line: 382, column: 5)
!371 = distinct !DILexicalBlock(scope: !361, file: !3, line: 382, column: 5)
!372 = !DILocation(line: 382, column: 5, scope: !371)
!373 = !DILocation(line: 382, column: 5, scope: !374)
!374 = distinct !DILexicalBlock(scope: !370, file: !3, line: 382, column: 5)
!375 = !DILocation(line: 382, column: 5, scope: !376)
!376 = distinct !DILexicalBlock(scope: !370, file: !3, line: 382, column: 5)
!377 = !DILocation(line: 384, column: 5, scope: !361)
!378 = !DILocation(line: 384, column: 11, scope: !361)
!379 = !DILocation(line: 384, column: 29, scope: !361)
!380 = !DILocation(line: 386, column: 9, scope: !381)
!381 = distinct !DILexicalBlock(scope: !361, file: !3, line: 384, column: 44)
!382 = !DILocation(line: 386, column: 9, scope: !383)
!383 = distinct !DILexicalBlock(scope: !384, file: !3, line: 386, column: 9)
!384 = distinct !DILexicalBlock(scope: !381, file: !3, line: 386, column: 9)
!385 = !DILocation(line: 386, column: 9, scope: !384)
!386 = !DILocation(line: 386, column: 9, scope: !387)
!387 = distinct !DILexicalBlock(scope: !383, file: !3, line: 386, column: 9)
!388 = !DILocation(line: 386, column: 9, scope: !389)
!389 = distinct !DILexicalBlock(scope: !383, file: !3, line: 386, column: 9)
!390 = !DILocation(line: 388, column: 9, scope: !381)
!391 = !DILocation(line: 388, column: 9, scope: !392)
!392 = distinct !DILexicalBlock(scope: !393, file: !3, line: 388, column: 9)
!393 = distinct !DILexicalBlock(scope: !381, file: !3, line: 388, column: 9)
!394 = !DILocation(line: 388, column: 9, scope: !393)
!395 = !DILocation(line: 388, column: 9, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !3, line: 388, column: 9)
!397 = !DILocation(line: 388, column: 9, scope: !398)
!398 = distinct !DILexicalBlock(scope: !392, file: !3, line: 388, column: 9)
!399 = !DILocation(line: 390, column: 9, scope: !381)
!400 = !DILocation(line: 390, column: 9, scope: !401)
!401 = distinct !DILexicalBlock(scope: !402, file: !3, line: 390, column: 9)
!402 = distinct !DILexicalBlock(scope: !381, file: !3, line: 390, column: 9)
!403 = !DILocation(line: 390, column: 9, scope: !402)
!404 = !DILocation(line: 390, column: 9, scope: !405)
!405 = distinct !DILexicalBlock(scope: !401, file: !3, line: 390, column: 9)
!406 = !DILocation(line: 390, column: 9, scope: !407)
!407 = distinct !DILexicalBlock(scope: !401, file: !3, line: 390, column: 9)
!408 = !DILocation(line: 392, column: 9, scope: !381)
!409 = !DILocation(line: 392, column: 9, scope: !410)
!410 = distinct !DILexicalBlock(scope: !411, file: !3, line: 392, column: 9)
!411 = distinct !DILexicalBlock(scope: !381, file: !3, line: 392, column: 9)
!412 = !DILocation(line: 392, column: 9, scope: !411)
!413 = !DILocation(line: 392, column: 9, scope: !414)
!414 = distinct !DILexicalBlock(scope: !410, file: !3, line: 392, column: 9)
!415 = !DILocation(line: 392, column: 9, scope: !416)
!416 = distinct !DILexicalBlock(scope: !410, file: !3, line: 392, column: 9)
!417 = !DILocation(line: 394, column: 12, scope: !418)
!418 = distinct !DILexicalBlock(scope: !381, file: !3, line: 394, column: 12)
!419 = !DILocation(line: 394, column: 29, scope: !418)
!420 = !DILocation(line: 394, column: 12, scope: !381)
!421 = !DILocation(line: 396, column: 13, scope: !422)
!422 = distinct !DILexicalBlock(scope: !418, file: !3, line: 394, column: 44)
!423 = !DILocation(line: 396, column: 13, scope: !424)
!424 = distinct !DILexicalBlock(scope: !425, file: !3, line: 396, column: 13)
!425 = distinct !DILexicalBlock(scope: !422, file: !3, line: 396, column: 13)
!426 = !DILocation(line: 396, column: 13, scope: !425)
!427 = !DILocation(line: 396, column: 13, scope: !428)
!428 = distinct !DILexicalBlock(scope: !424, file: !3, line: 396, column: 13)
!429 = !DILocation(line: 396, column: 13, scope: !430)
!430 = distinct !DILexicalBlock(scope: !424, file: !3, line: 396, column: 13)
!431 = !DILocation(line: 398, column: 16, scope: !432)
!432 = distinct !DILexicalBlock(scope: !422, file: !3, line: 398, column: 16)
!433 = !DILocation(line: 398, column: 28, scope: !432)
!434 = !DILocation(line: 398, column: 41, scope: !432)
!435 = !DILocation(line: 398, column: 44, scope: !432)
!436 = !DILocation(line: 398, column: 56, scope: !432)
!437 = !DILocation(line: 398, column: 16, scope: !422)
!438 = !DILocation(line: 399, column: 17, scope: !439)
!439 = distinct !DILexicalBlock(scope: !432, file: !3, line: 398, column: 70)
!440 = !DILocation(line: 399, column: 23, scope: !439)
!441 = !DILocation(line: 399, column: 36, scope: !439)
!442 = !DILocation(line: 399, column: 45, scope: !439)
!443 = !DILocation(line: 399, column: 49, scope: !439)
!444 = !DILocation(line: 399, column: 71, scope: !439)
!445 = !DILocation(line: 0, scope: !439)
!446 = !DILocation(line: 401, column: 21, scope: !447)
!447 = distinct !DILexicalBlock(scope: !439, file: !3, line: 399, column: 91)
!448 = !DILocation(line: 401, column: 21, scope: !449)
!449 = distinct !DILexicalBlock(scope: !450, file: !3, line: 401, column: 21)
!450 = distinct !DILexicalBlock(scope: !447, file: !3, line: 401, column: 21)
!451 = !DILocation(line: 401, column: 21, scope: !450)
!452 = !DILocation(line: 401, column: 21, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !3, line: 401, column: 21)
!454 = !DILocation(line: 401, column: 21, scope: !455)
!455 = distinct !DILexicalBlock(scope: !449, file: !3, line: 401, column: 21)
!456 = distinct !{!456, !438, !457}
!457 = !DILocation(line: 403, column: 17, scope: !439)
!458 = !DILocation(line: 404, column: 13, scope: !439)
!459 = !DILocation(line: 406, column: 9, scope: !422)
!460 = !DILocation(line: 406, column: 9, scope: !461)
!461 = distinct !DILexicalBlock(scope: !462, file: !3, line: 406, column: 9)
!462 = distinct !DILexicalBlock(scope: !422, file: !3, line: 406, column: 9)
!463 = !DILocation(line: 406, column: 9, scope: !462)
!464 = !DILocation(line: 406, column: 9, scope: !465)
!465 = distinct !DILexicalBlock(scope: !461, file: !3, line: 406, column: 9)
!466 = !DILocation(line: 406, column: 9, scope: !467)
!467 = distinct !DILexicalBlock(scope: !461, file: !3, line: 406, column: 9)
!468 = !DILocation(line: 408, column: 9, scope: !422)
!469 = !DILocation(line: 410, column: 13, scope: !470)
!470 = distinct !DILexicalBlock(scope: !418, file: !3, line: 408, column: 16)
!471 = !DILocation(line: 410, column: 13, scope: !472)
!472 = distinct !DILexicalBlock(scope: !473, file: !3, line: 410, column: 13)
!473 = distinct !DILexicalBlock(scope: !470, file: !3, line: 410, column: 13)
!474 = !DILocation(line: 410, column: 13, scope: !473)
!475 = !DILocation(line: 410, column: 13, scope: !476)
!476 = distinct !DILexicalBlock(scope: !472, file: !3, line: 410, column: 13)
!477 = !DILocation(line: 410, column: 13, scope: !478)
!478 = distinct !DILexicalBlock(scope: !472, file: !3, line: 410, column: 13)
!479 = !DILocation(line: 412, column: 13, scope: !470)
!480 = !DILocation(line: 412, column: 13, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !3, line: 412, column: 13)
!482 = distinct !DILexicalBlock(scope: !470, file: !3, line: 412, column: 13)
!483 = !DILocation(line: 412, column: 13, scope: !482)
!484 = !DILocation(line: 412, column: 13, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !3, line: 412, column: 13)
!486 = !DILocation(line: 412, column: 13, scope: !487)
!487 = distinct !DILexicalBlock(scope: !481, file: !3, line: 412, column: 13)
!488 = distinct !{!488, !377, !489}
!489 = !DILocation(line: 414, column: 5, scope: !361)
!490 = !DILocation(line: 416, column: 5, scope: !361)
!491 = !DILocation(line: 417, column: 1, scope: !361)
!492 = distinct !DISubprogram(name: "djb_hash", scope: !3, file: !3, line: 216, type: !493, scopeLine: 217, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!493 = !DISubroutineType(types: !494)
!494 = !{!183, !7, !6}
!495 = !DILocalVariable(name: "data", arg: 1, scope: !492, file: !3, line: 216, type: !7)
!496 = !DILocation(line: 216, column: 33, scope: !492)
!497 = !DILocalVariable(name: "len", arg: 2, scope: !492, file: !3, line: 216, type: !6)
!498 = !DILocation(line: 216, column: 48, scope: !492)
!499 = !DILocalVariable(name: "hash", scope: !492, file: !3, line: 218, type: !18)
!500 = !DILocation(line: 218, column: 14, scope: !492)
!501 = !DILocalVariable(name: "i", scope: !492, file: !3, line: 219, type: !6)
!502 = !DILocation(line: 219, column: 18, scope: !492)
!503 = !DILocation(line: 221, column: 11, scope: !504)
!504 = distinct !DILexicalBlock(scope: !492, file: !3, line: 221, column: 5)
!505 = !DILocation(line: 221, column: 9, scope: !504)
!506 = !DILocation(line: 221, column: 16, scope: !507)
!507 = distinct !DILexicalBlock(scope: !504, file: !3, line: 221, column: 5)
!508 = !DILocation(line: 221, column: 20, scope: !507)
!509 = !DILocation(line: 221, column: 18, scope: !507)
!510 = !DILocation(line: 221, column: 5, scope: !504)
!511 = !DILocation(line: 222, column: 18, scope: !507)
!512 = !DILocation(line: 222, column: 23, scope: !507)
!513 = !DILocation(line: 222, column: 31, scope: !507)
!514 = !DILocation(line: 222, column: 29, scope: !507)
!515 = !DILocation(line: 222, column: 41, scope: !507)
!516 = !DILocation(line: 222, column: 40, scope: !507)
!517 = !DILocation(line: 222, column: 39, scope: !507)
!518 = !DILocation(line: 222, column: 37, scope: !507)
!519 = !DILocation(line: 222, column: 14, scope: !507)
!520 = !DILocation(line: 222, column: 9, scope: !507)
!521 = !DILocation(line: 221, column: 29, scope: !507)
!522 = !DILocation(line: 221, column: 34, scope: !507)
!523 = !DILocation(line: 221, column: 5, scope: !507)
!524 = distinct !{!524, !510, !525}
!525 = !DILocation(line: 222, column: 45, scope: !504)
!526 = !DILocation(line: 225, column: 12, scope: !492)
!527 = !DILocation(line: 225, column: 5, scope: !492)
