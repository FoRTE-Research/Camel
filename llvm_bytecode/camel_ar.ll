; ModuleID = 'camel_ar.bc'
source_filename = "../benchmarks/camel_ar.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, i16, [3 x %struct.threeAxis_t_8], %struct.features_t, [16 x %struct.features_t], [16 x %struct.features_t], i16, i16, i16, i16, i16 }
%struct.threeAxis_t_8 = type { i8, i8, i8 }
%struct.features_t = type { i16, i16 }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !32
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !86
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !23
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !30
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !18
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !88
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !100 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !102
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !103
  %conv = zext i8 %0 to i16, !dbg !103
  %or = or i16 %conv, 1, !dbg !103
  %conv1 = trunc i16 %or to i8, !dbg !103
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !103
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !104
  %conv2 = zext i8 %1 to i16, !dbg !104
  %and = and i16 %conv2, -2, !dbg !104
  %conv3 = trunc i16 %and to i8, !dbg !104
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !104
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !105
  %and4 = and i16 %2, -2, !dbg !105
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !105
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !106
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !107
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !108
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !109
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !110
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !111
  ret void, !dbg !112
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !113 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !114
  %cmp = icmp eq i16 %0, 1, !dbg !116
  br i1 %cmp, label %if.then, label %if.else, !dbg !117

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !118
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !120
  br label %if.end4, !dbg !121

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !122
  %cmp1 = icmp eq i16 %1, 2, !dbg !124
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !125

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !126
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !128
  br label %if.end, !dbg !129

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !132
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !132
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !132
  %3 = load i16, i16* %arrayidx, align 2, !dbg !132
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #6, !dbg !132, !srcloc !134
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !135, metadata !DIExpression()), !dbg !137
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !137, !srcloc !138
  store i16 %4, i16* %__x, align 2, !dbg !137
  %5 = load i16, i16* %__x, align 2, !dbg !137
  store i16 %5, i16* %tmp, align 2, !dbg !137
  %6 = load i16, i16* %tmp, align 2, !dbg !137
  %add = add i16 %6, 2, !dbg !139
  %7 = inttoptr i16 %add to i8*, !dbg !140
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !141, metadata !DIExpression()), !dbg !143
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #6, !dbg !143, !srcloc !144
  store i16 %8, i16* %__x5, align 2, !dbg !143
  %9 = load i16, i16* %__x5, align 2, !dbg !143
  store i16 %9, i16* %tmp6, align 2, !dbg !143
  %10 = load i16, i16* %tmp6, align 2, !dbg !143
  %add7 = add i16 %10, 2, !dbg !145
  %sub = sub i16 9216, %add7, !dbg !146
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !147
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !148
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !149
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !149
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !150
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 186, i16 zeroext %13), !dbg !151
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !152
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !153
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !155
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !156
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !156
  %cmp9 = icmp eq i16 %14, %16, !dbg !157
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !158

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !161
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !162
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !161
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 188, i1 false), !dbg !161
  call void @camel_init(), !dbg !163
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !164
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !165
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !164
  call void @__restore_registers(i16* %arraydecay), !dbg !166
  br label %if.end13, !dbg !167

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !168
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !170
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %result, i16 %seed) #0 !dbg !171 {
entry:
  %result.addr = alloca %struct.threeAxis_t_8*, align 2
  %seed.addr = alloca i16, align 2
  store %struct.threeAxis_t_8* %result, %struct.threeAxis_t_8** %result.addr, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %result.addr, metadata !175, metadata !DIExpression()), !dbg !176
  store i16 %seed, i16* %seed.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %seed.addr, metadata !177, metadata !DIExpression()), !dbg !178
  %0 = load i16, i16* %seed.addr, align 2, !dbg !179
  %mul = mul i16 %0, 17, !dbg !180
  %rem = urem i16 %mul, 85, !dbg !181
  %conv = trunc i16 %rem to i8, !dbg !182
  %1 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !183
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %1, i32 0, i32 0, !dbg !184
  store i8 %conv, i8* %x, align 1, !dbg !185
  %2 = load i16, i16* %seed.addr, align 2, !dbg !186
  %mul1 = mul i16 %2, 17, !dbg !187
  %mul2 = mul i16 %mul1, 17, !dbg !188
  %rem3 = urem i16 %mul2, 85, !dbg !189
  %conv4 = trunc i16 %rem3 to i8, !dbg !190
  %3 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !191
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %3, i32 0, i32 1, !dbg !192
  store i8 %conv4, i8* %y, align 1, !dbg !193
  %4 = load i16, i16* %seed.addr, align 2, !dbg !194
  %mul5 = mul i16 %4, 17, !dbg !195
  %mul6 = mul i16 %mul5, 17, !dbg !196
  %mul7 = mul i16 %mul6, 17, !dbg !197
  %rem8 = urem i16 %mul7, 85, !dbg !198
  %conv9 = trunc i16 %rem8 to i8, !dbg !199
  %5 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !200
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %5, i32 0, i32 2, !dbg !201
  store i8 %conv9, i8* %z, align 1, !dbg !202
  %6 = load i16, i16* %seed.addr, align 2, !dbg !203
  %inc = add i16 %6, 1, !dbg !203
  store i16 %inc, i16* %seed.addr, align 2, !dbg !203
  %7 = load i16, i16* %seed.addr, align 2, !dbg !204
  ret i16 %7, !dbg !205
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !206 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !207
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !207
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !207
  store i16 3, i16* %pinState, align 2, !dbg !208
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !209
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !209
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !209
  store i16 0, i16* %count, align 2, !dbg !210
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !211
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !211
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !211
  store i16 1, i16* %seed, align 2, !dbg !212
  ret void, !dbg !213
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_selectMode() #0 !dbg !214 {
entry:
  %pin_state = alloca i16, align 2
  %mode = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %pin_state, metadata !215, metadata !DIExpression()), !dbg !216
  store i16 1, i16* %pin_state, align 2, !dbg !216
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !217
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !217
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !217
  %1 = load i16, i16* %count, align 2, !dbg !218
  %inc = add i16 %1, 1, !dbg !218
  store i16 %inc, i16* %count, align 2, !dbg !218
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !219
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !219
  %count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !219
  %3 = load i16, i16* %count2, align 2, !dbg !219
  %cmp = icmp uge i16 %3, 3, !dbg !221
  br i1 %cmp, label %if.then, label %if.end, !dbg !222

if.then:                                          ; preds = %entry
  store i16 2, i16* %pin_state, align 2, !dbg !223
  br label %if.end, !dbg !224

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !225
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !225
  %count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !225
  %5 = load i16, i16* %count4, align 2, !dbg !225
  %cmp5 = icmp uge i16 %5, 5, !dbg !227
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !228

if.then6:                                         ; preds = %if.end
  store i16 0, i16* %pin_state, align 2, !dbg !229
  br label %if.end7, !dbg !230

if.end7:                                          ; preds = %if.then6, %if.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !231
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !231
  %count9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 14, !dbg !231
  %7 = load i16, i16* %count9, align 2, !dbg !231
  %cmp10 = icmp uge i16 %7, 7, !dbg !233
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !234

if.then11:                                        ; preds = %if.end7
  call void @task_done(), !dbg !235
  br label %if.end12, !dbg !237

if.end12:                                         ; preds = %if.then11, %if.end7
  call void @llvm.dbg.declare(metadata i16* %mode, metadata !238, metadata !DIExpression()), !dbg !239
  call void @llvm.dbg.declare(metadata i16* %class, metadata !240, metadata !DIExpression()), !dbg !241
  %8 = load i16, i16* %pin_state, align 2, !dbg !242
  %cmp13 = icmp eq i16 %8, 2, !dbg !244
  br i1 %cmp13, label %land.lhs.true, label %lor.lhs.false, !dbg !245

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i16, i16* %pin_state, align 2, !dbg !246
  %cmp14 = icmp eq i16 %9, 1, !dbg !247
  br i1 %cmp14, label %land.lhs.true, label %if.else, !dbg !248

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end12
  %10 = load i16, i16* %pin_state, align 2, !dbg !249
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !250
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !250
  %12 = load i16, i16* %pinState, align 2, !dbg !250
  %cmp16 = icmp eq i16 %10, %12, !dbg !251
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !252

if.then17:                                        ; preds = %land.lhs.true
  store i16 3, i16* %pin_state, align 2, !dbg !253
  br label %if.end20, !dbg !255

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %13 = load i16, i16* %pin_state, align 2, !dbg !256
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !258
  %pinState19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 0, !dbg !258
  store i16 %13, i16* %pinState19, align 2, !dbg !259
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  %15 = load i16, i16* %pin_state, align 2, !dbg !260
  switch i16 %15, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb27
    i16 0, label %sw.bb36
  ], !dbg !261

sw.bb:                                            ; preds = %if.end20
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !262
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 1, !dbg !262
  store i16 0, i16* %discardedSamplesCount, align 2, !dbg !264
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !265
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !265
  %mode23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 12, !dbg !265
  store i16 2, i16* %mode23, align 2, !dbg !266
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !267
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !267
  %class25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 2, !dbg !267
  store i16 0, i16* %class25, align 2, !dbg !268
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !269
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !269
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 11, !dbg !269
  store i16 0, i16* %samplesInWindow, align 2, !dbg !270
  br label %sw.epilog, !dbg !271

sw.bb27:                                          ; preds = %if.end20
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !272
  %discardedSamplesCount29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 1, !dbg !272
  store i16 0, i16* %discardedSamplesCount29, align 2, !dbg !273
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !274
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !274
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !274
  store i16 1, i16* %mode31, align 2, !dbg !275
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !276
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !276
  %class33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 2, !dbg !276
  store i16 1, i16* %class33, align 2, !dbg !277
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !278
  %samplesInWindow35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 11, !dbg !278
  store i16 0, i16* %samplesInWindow35, align 2, !dbg !279
  br label %sw.epilog, !dbg !280

sw.bb36:                                          ; preds = %if.end20
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !281
  %mode38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 12, !dbg !281
  store i16 0, i16* %mode38, align 2, !dbg !282
  br label %sw.epilog, !dbg !283

sw.default:                                       ; preds = %if.end20
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !284
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !284
  store i16 3, i16* %mode40, align 2, !dbg !285
  br label %sw.epilog, !dbg !286

sw.epilog:                                        ; preds = %sw.default, %sw.bb36, %sw.bb27, %sw.bb
  ret void, !dbg !287
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_resetStats() #0 !dbg !288 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !289
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !289
  %movingCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !289
  store i16 0, i16* %movingCount, align 2, !dbg !290
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !291
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !291
  %stationaryCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !291
  store i16 0, i16* %stationaryCount, align 2, !dbg !292
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !293
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !293
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !293
  store i16 0, i16* %totalCount, align 2, !dbg !294
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !295
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !295
  store i16 0, i16* %samplesInWindow, align 2, !dbg !296
  ret void, !dbg !297
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !298 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !299, metadata !DIExpression()), !dbg !300
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !301
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !301
  %1 = load i16, i16* %seed, align 2, !dbg !301
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %1), !dbg !302
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !303
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !303
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !304
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 11, !dbg !304
  %4 = load i16, i16* %samplesInWindow, align 2, !dbg !304
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %4, !dbg !303
  %5 = bitcast %struct.threeAxis_t_8* %arrayidx to i8*, !dbg !305
  %6 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !305
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 1 %5, i8* align 1 %6, i16 3, i1 false), !dbg !305
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !306
  %samplesInWindow4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !306
  %8 = load i16, i16* %samplesInWindow4, align 2, !dbg !307
  %inc = add i16 %8, 1, !dbg !307
  store i16 %inc, i16* %samplesInWindow4, align 2, !dbg !307
  ret void, !dbg !308
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_transform() #0 !dbg !309 {
entry:
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !310
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !310
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !310
  store i16 0, i16* %samplesInWindow, align 2, !dbg !311
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !312, metadata !DIExpression()), !dbg !314
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !315, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata i16* %i, metadata !317, metadata !DIExpression()), !dbg !319
  store i16 0, i16* %i, align 2, !dbg !319
  br label %for.cond, !dbg !320

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !321
  %cmp = icmp ult i16 %1, 3, !dbg !323
  br i1 %cmp, label %for.body, label %for.end, !dbg !324

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !325
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !325
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !325
  %3 = load i16, i16* %i, align 2, !dbg !328
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %3, !dbg !325
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !329
  %4 = load i8, i8* %x, align 1, !dbg !329
  %conv = sext i8 %4 to i16, !dbg !325
  %cmp2 = icmp slt i16 %conv, 10, !dbg !330
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !331

lor.lhs.false:                                    ; preds = %for.body
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !332
  %window5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !332
  %6 = load i16, i16* %i, align 2, !dbg !333
  %arrayidx6 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window5, i16 0, i16 %6, !dbg !332
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx6, i32 0, i32 1, !dbg !334
  %7 = load i8, i8* %y, align 1, !dbg !334
  %conv7 = sext i8 %7 to i16, !dbg !332
  %cmp8 = icmp slt i16 %conv7, 10, !dbg !335
  br i1 %cmp8, label %if.then, label %lor.lhs.false10, !dbg !336

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !337
  %window12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !337
  %9 = load i16, i16* %i, align 2, !dbg !338
  %arrayidx13 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window12, i16 0, i16 %9, !dbg !337
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx13, i32 0, i32 2, !dbg !339
  %10 = load i8, i8* %z, align 1, !dbg !339
  %conv14 = sext i8 %10 to i16, !dbg !337
  %cmp15 = icmp slt i16 %conv14, 10, !dbg !340
  br i1 %cmp15, label %if.then, label %if.end, !dbg !341

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %for.body
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !342
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !342
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !342
  %12 = load i16, i16* %i, align 2, !dbg !344
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %12, !dbg !342
  %x20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 0, !dbg !345
  %13 = load i8, i8* %x20, align 1, !dbg !345
  %conv21 = sext i8 %13 to i16, !dbg !342
  %cmp22 = icmp sgt i16 %conv21, 10, !dbg !346
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !347

cond.true:                                        ; preds = %if.then
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !348
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !348
  %window25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 6, !dbg !348
  %15 = load i16, i16* %i, align 2, !dbg !349
  %arrayidx26 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window25, i16 0, i16 %15, !dbg !348
  %x27 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx26, i32 0, i32 0, !dbg !350
  %16 = load i8, i8* %x27, align 1, !dbg !350
  %conv28 = sext i8 %16 to i16, !dbg !348
  br label %cond.end, !dbg !347

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !347

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv28, %cond.true ], [ 0, %cond.false ], !dbg !347
  %conv29 = trunc i16 %cond to i8, !dbg !347
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !351
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !351
  %window31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 6, !dbg !351
  %18 = load i16, i16* %i, align 2, !dbg !352
  %arrayidx32 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window31, i16 0, i16 %18, !dbg !351
  %x33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx32, i32 0, i32 0, !dbg !353
  store i8 %conv29, i8* %x33, align 1, !dbg !354
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !355
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !355
  %window35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 6, !dbg !355
  %20 = load i16, i16* %i, align 2, !dbg !356
  %arrayidx36 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window35, i16 0, i16 %20, !dbg !355
  %y37 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx36, i32 0, i32 1, !dbg !357
  %21 = load i8, i8* %y37, align 1, !dbg !357
  %conv38 = sext i8 %21 to i16, !dbg !355
  %cmp39 = icmp sgt i16 %conv38, 10, !dbg !358
  br i1 %cmp39, label %cond.true41, label %cond.false47, !dbg !359

cond.true41:                                      ; preds = %cond.end
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !360
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !360
  %window43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 6, !dbg !360
  %23 = load i16, i16* %i, align 2, !dbg !361
  %arrayidx44 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window43, i16 0, i16 %23, !dbg !360
  %y45 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx44, i32 0, i32 1, !dbg !362
  %24 = load i8, i8* %y45, align 1, !dbg !362
  %conv46 = sext i8 %24 to i16, !dbg !360
  br label %cond.end48, !dbg !359

cond.false47:                                     ; preds = %cond.end
  br label %cond.end48, !dbg !359

cond.end48:                                       ; preds = %cond.false47, %cond.true41
  %cond49 = phi i16 [ %conv46, %cond.true41 ], [ 0, %cond.false47 ], !dbg !359
  %conv50 = trunc i16 %cond49 to i8, !dbg !359
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !363
  %window52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 6, !dbg !363
  %26 = load i16, i16* %i, align 2, !dbg !364
  %arrayidx53 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window52, i16 0, i16 %26, !dbg !363
  %y54 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx53, i32 0, i32 1, !dbg !365
  store i8 %conv50, i8* %y54, align 1, !dbg !366
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !367
  %window56 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 6, !dbg !367
  %28 = load i16, i16* %i, align 2, !dbg !368
  %arrayidx57 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window56, i16 0, i16 %28, !dbg !367
  %z58 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx57, i32 0, i32 2, !dbg !369
  %29 = load i8, i8* %z58, align 1, !dbg !369
  %conv59 = sext i8 %29 to i16, !dbg !367
  %cmp60 = icmp sgt i16 %conv59, 10, !dbg !370
  br i1 %cmp60, label %cond.true62, label %cond.false68, !dbg !371

cond.true62:                                      ; preds = %cond.end48
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !372
  %window64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 6, !dbg !372
  %31 = load i16, i16* %i, align 2, !dbg !373
  %arrayidx65 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window64, i16 0, i16 %31, !dbg !372
  %z66 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx65, i32 0, i32 2, !dbg !374
  %32 = load i8, i8* %z66, align 1, !dbg !374
  %conv67 = sext i8 %32 to i16, !dbg !372
  br label %cond.end69, !dbg !371

cond.false68:                                     ; preds = %cond.end48
  br label %cond.end69, !dbg !371

cond.end69:                                       ; preds = %cond.false68, %cond.true62
  %cond70 = phi i16 [ %conv67, %cond.true62 ], [ 0, %cond.false68 ], !dbg !371
  %conv71 = trunc i16 %cond70 to i8, !dbg !371
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !375
  %globals72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !375
  %window73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals72, i32 0, i32 6, !dbg !375
  %34 = load i16, i16* %i, align 2, !dbg !376
  %arrayidx74 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window73, i16 0, i16 %34, !dbg !375
  %z75 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx74, i32 0, i32 2, !dbg !377
  store i8 %conv71, i8* %z75, align 1, !dbg !378
  br label %if.end, !dbg !379

if.end:                                           ; preds = %cond.end69, %lor.lhs.false10
  br label %for.inc, !dbg !380

for.inc:                                          ; preds = %if.end
  %35 = load i16, i16* %i, align 2, !dbg !381
  %inc = add i16 %35, 1, !dbg !381
  store i16 %inc, i16* %i, align 2, !dbg !381
  br label %for.cond, !dbg !382, !llvm.loop !383

for.end:                                          ; preds = %for.cond
  ret void, !dbg !385
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_featurize() #0 !dbg !386 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !387, metadata !DIExpression()), !dbg !388
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !389, metadata !DIExpression()), !dbg !390
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !391
  store i8 0, i8* %z, align 1, !dbg !392
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !393
  store i8 0, i8* %y, align 1, !dbg !394
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !395
  store i8 0, i8* %x, align 1, !dbg !396
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !397
  store i8 0, i8* %z1, align 1, !dbg !398
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !399
  store i8 0, i8* %y2, align 1, !dbg !400
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !401
  store i8 0, i8* %x3, align 1, !dbg !402
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !403, metadata !DIExpression()), !dbg !404
  call void @llvm.dbg.declare(metadata i16* %i, metadata !405, metadata !DIExpression()), !dbg !407
  store i16 0, i16* %i, align 2, !dbg !408
  br label %for.cond, !dbg !410

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !411
  %cmp = icmp slt i16 %0, 3, !dbg !413
  br i1 %cmp, label %for.body, label %for.end, !dbg !414

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !415
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !415
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !415
  %2 = load i16, i16* %i, align 2, !dbg !417
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !415
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !418
  %3 = load i8, i8* %x4, align 1, !dbg !418
  %conv = sext i8 %3 to i16, !dbg !415
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !419
  %4 = load i8, i8* %x5, align 1, !dbg !420
  %conv6 = sext i8 %4 to i16, !dbg !420
  %add = add nsw i16 %conv6, %conv, !dbg !420
  %conv7 = trunc i16 %add to i8, !dbg !420
  store i8 %conv7, i8* %x5, align 1, !dbg !420
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !421
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !421
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !421
  %6 = load i16, i16* %i, align 2, !dbg !422
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %6, !dbg !421
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !423
  %7 = load i8, i8* %y11, align 1, !dbg !423
  %conv12 = sext i8 %7 to i16, !dbg !421
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !424
  %8 = load i8, i8* %y13, align 1, !dbg !425
  %conv14 = sext i8 %8 to i16, !dbg !425
  %add15 = add nsw i16 %conv14, %conv12, !dbg !425
  %conv16 = trunc i16 %add15 to i8, !dbg !425
  store i8 %conv16, i8* %y13, align 1, !dbg !425
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !426
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !426
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !426
  %10 = load i16, i16* %i, align 2, !dbg !427
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %10, !dbg !426
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !428
  %11 = load i8, i8* %z20, align 1, !dbg !428
  %conv21 = sext i8 %11 to i16, !dbg !426
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !429
  %12 = load i8, i8* %z22, align 1, !dbg !430
  %conv23 = sext i8 %12 to i16, !dbg !430
  %add24 = add nsw i16 %conv23, %conv21, !dbg !430
  %conv25 = trunc i16 %add24 to i8, !dbg !430
  store i8 %conv25, i8* %z22, align 1, !dbg !430
  br label %for.inc, !dbg !431

for.inc:                                          ; preds = %for.body
  %13 = load i16, i16* %i, align 2, !dbg !432
  %inc = add nsw i16 %13, 1, !dbg !432
  store i16 %inc, i16* %i, align 2, !dbg !432
  br label %for.cond, !dbg !433, !llvm.loop !434

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !436
  %14 = load i8, i8* %x26, align 1, !dbg !437
  %conv27 = sext i8 %14 to i16, !dbg !437
  %shr = ashr i16 %conv27, 2, !dbg !437
  %conv28 = trunc i16 %shr to i8, !dbg !437
  store i8 %conv28, i8* %x26, align 1, !dbg !437
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !438
  %15 = load i8, i8* %y29, align 1, !dbg !439
  %conv30 = sext i8 %15 to i16, !dbg !439
  %shr31 = ashr i16 %conv30, 2, !dbg !439
  %conv32 = trunc i16 %shr31 to i8, !dbg !439
  store i8 %conv32, i8* %y29, align 1, !dbg !439
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !440
  %16 = load i8, i8* %z33, align 1, !dbg !441
  %conv34 = sext i8 %16 to i16, !dbg !441
  %shr35 = ashr i16 %conv34, 2, !dbg !441
  %conv36 = trunc i16 %shr35 to i8, !dbg !441
  store i8 %conv36, i8* %z33, align 1, !dbg !441
  store i16 0, i16* %i, align 2, !dbg !442
  br label %for.cond37, !dbg !444

for.cond37:                                       ; preds = %for.inc135, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !445
  %cmp38 = icmp slt i16 %17, 3, !dbg !447
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !448

for.body40:                                       ; preds = %for.cond37
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !449
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !449
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !449
  %19 = load i16, i16* %i, align 2, !dbg !451
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %19, !dbg !449
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !452
  %20 = load i8, i8* %x44, align 1, !dbg !452
  %conv45 = sext i8 %20 to i16, !dbg !449
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !453
  %21 = load i8, i8* %x46, align 1, !dbg !453
  %conv47 = sext i8 %21 to i16, !dbg !454
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !455
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !449

cond.true:                                        ; preds = %for.body40
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !456
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !456
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !456
  %23 = load i16, i16* %i, align 2, !dbg !457
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %23, !dbg !456
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !458
  %24 = load i8, i8* %x53, align 1, !dbg !458
  %conv54 = sext i8 %24 to i16, !dbg !456
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !459
  %25 = load i8, i8* %x55, align 1, !dbg !459
  %conv56 = sext i8 %25 to i16, !dbg !460
  %sub = sub nsw i16 %conv54, %conv56, !dbg !461
  br label %cond.end, !dbg !449

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !462
  %26 = load i8, i8* %x57, align 1, !dbg !462
  %conv58 = sext i8 %26 to i16, !dbg !463
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !464
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !464
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !464
  %28 = load i16, i16* %i, align 2, !dbg !465
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %28, !dbg !464
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !466
  %29 = load i8, i8* %x62, align 1, !dbg !466
  %conv63 = sext i8 %29 to i16, !dbg !464
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !467
  br label %cond.end, !dbg !449

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !449
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !468
  %30 = load i8, i8* %x65, align 1, !dbg !469
  %conv66 = sext i8 %30 to i16, !dbg !469
  %add67 = add nsw i16 %conv66, %cond, !dbg !469
  %conv68 = trunc i16 %add67 to i8, !dbg !469
  store i8 %conv68, i8* %x65, align 1, !dbg !469
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !470
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !470
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !470
  %32 = load i16, i16* %i, align 2, !dbg !471
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %32, !dbg !470
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !472
  %33 = load i8, i8* %y72, align 1, !dbg !472
  %conv73 = sext i8 %33 to i16, !dbg !470
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !473
  %34 = load i8, i8* %y74, align 1, !dbg !473
  %conv75 = sext i8 %34 to i16, !dbg !474
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !475
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !470

cond.true78:                                      ; preds = %cond.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !476
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !476
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !476
  %36 = load i16, i16* %i, align 2, !dbg !477
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %36, !dbg !476
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !478
  %37 = load i8, i8* %y82, align 1, !dbg !478
  %conv83 = sext i8 %37 to i16, !dbg !476
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !479
  %38 = load i8, i8* %y84, align 1, !dbg !479
  %conv85 = sext i8 %38 to i16, !dbg !480
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !481
  br label %cond.end96, !dbg !470

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !482
  %39 = load i8, i8* %y88, align 1, !dbg !482
  %conv89 = sext i8 %39 to i16, !dbg !483
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !484
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !484
  %41 = load i16, i16* %i, align 2, !dbg !485
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %41, !dbg !484
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !486
  %42 = load i8, i8* %y93, align 1, !dbg !486
  %conv94 = sext i8 %42 to i16, !dbg !484
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !487
  br label %cond.end96, !dbg !470

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !470
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !488
  %43 = load i8, i8* %y98, align 1, !dbg !489
  %conv99 = sext i8 %43 to i16, !dbg !489
  %add100 = add nsw i16 %conv99, %cond97, !dbg !489
  %conv101 = trunc i16 %add100 to i8, !dbg !489
  store i8 %conv101, i8* %y98, align 1, !dbg !489
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !490
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !490
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !490
  %45 = load i16, i16* %i, align 2, !dbg !491
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %45, !dbg !490
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !492
  %46 = load i8, i8* %z105, align 1, !dbg !492
  %conv106 = sext i8 %46 to i16, !dbg !490
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !493
  %47 = load i8, i8* %z107, align 1, !dbg !493
  %conv108 = sext i8 %47 to i16, !dbg !494
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !495
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !490

cond.true111:                                     ; preds = %cond.end96
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !496
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !496
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !496
  %49 = load i16, i16* %i, align 2, !dbg !497
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %49, !dbg !496
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !498
  %50 = load i8, i8* %z115, align 1, !dbg !498
  %conv116 = sext i8 %50 to i16, !dbg !496
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !499
  %51 = load i8, i8* %z117, align 1, !dbg !499
  %conv118 = sext i8 %51 to i16, !dbg !500
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !501
  br label %cond.end129, !dbg !490

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !502
  %52 = load i8, i8* %z121, align 1, !dbg !502
  %conv122 = sext i8 %52 to i16, !dbg !503
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !504
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1, !dbg !504
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !504
  %54 = load i16, i16* %i, align 2, !dbg !505
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %54, !dbg !504
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !506
  %55 = load i8, i8* %z126, align 1, !dbg !506
  %conv127 = sext i8 %55 to i16, !dbg !504
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !507
  br label %cond.end129, !dbg !490

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !490
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !508
  %56 = load i8, i8* %z131, align 1, !dbg !509
  %conv132 = sext i8 %56 to i16, !dbg !509
  %add133 = add nsw i16 %conv132, %cond130, !dbg !509
  %conv134 = trunc i16 %add133 to i8, !dbg !509
  store i8 %conv134, i8* %z131, align 1, !dbg !509
  br label %for.inc135, !dbg !510

for.inc135:                                       ; preds = %cond.end129
  %57 = load i16, i16* %i, align 2, !dbg !511
  %inc136 = add nsw i16 %57, 1, !dbg !511
  store i16 %inc136, i16* %i, align 2, !dbg !511
  br label %for.cond37, !dbg !512, !llvm.loop !513

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !515
  %58 = load i8, i8* %x138, align 1, !dbg !516
  %conv139 = sext i8 %58 to i16, !dbg !516
  %shr140 = ashr i16 %conv139, 2, !dbg !516
  %conv141 = trunc i16 %shr140 to i8, !dbg !516
  store i8 %conv141, i8* %x138, align 1, !dbg !516
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !517
  %59 = load i8, i8* %y142, align 1, !dbg !518
  %conv143 = sext i8 %59 to i16, !dbg !518
  %shr144 = ashr i16 %conv143, 2, !dbg !518
  %conv145 = trunc i16 %shr144 to i8, !dbg !518
  store i8 %conv145, i8* %y142, align 1, !dbg !518
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !519
  %60 = load i8, i8* %z146, align 1, !dbg !520
  %conv147 = sext i8 %60 to i16, !dbg !520
  %shr148 = ashr i16 %conv147, 2, !dbg !520
  %conv149 = trunc i16 %shr148 to i8, !dbg !520
  store i8 %conv149, i8* %z146, align 1, !dbg !520
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !521, metadata !DIExpression()), !dbg !522
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !523
  %61 = load i8, i8* %x150, align 1, !dbg !523
  %conv151 = sext i8 %61 to i16, !dbg !524
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !525
  %62 = load i8, i8* %x152, align 1, !dbg !525
  %conv153 = sext i8 %62 to i16, !dbg !526
  %mul = mul nsw i16 %conv151, %conv153, !dbg !527
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !528
  %63 = load i8, i8* %y154, align 1, !dbg !528
  %conv155 = sext i8 %63 to i16, !dbg !529
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !530
  %64 = load i8, i8* %y156, align 1, !dbg !530
  %conv157 = sext i8 %64 to i16, !dbg !531
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !532
  %add159 = add nsw i16 %mul, %mul158, !dbg !533
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !534
  %65 = load i8, i8* %z160, align 1, !dbg !534
  %conv161 = sext i8 %65 to i16, !dbg !535
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !536
  %66 = load i8, i8* %z162, align 1, !dbg !536
  %conv163 = sext i8 %66 to i16, !dbg !537
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !538
  %add165 = add nsw i16 %add159, %mul164, !dbg !539
  store i16 %add165, i16* %meanmag, align 2, !dbg !522
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !540, metadata !DIExpression()), !dbg !541
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !542
  %67 = load i8, i8* %x166, align 1, !dbg !542
  %conv167 = sext i8 %67 to i16, !dbg !543
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !544
  %68 = load i8, i8* %x168, align 1, !dbg !544
  %conv169 = sext i8 %68 to i16, !dbg !545
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !546
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !547
  %69 = load i8, i8* %y171, align 1, !dbg !547
  %conv172 = sext i8 %69 to i16, !dbg !548
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !549
  %70 = load i8, i8* %y173, align 1, !dbg !549
  %conv174 = sext i8 %70 to i16, !dbg !550
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !551
  %add176 = add nsw i16 %mul170, %mul175, !dbg !552
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !553
  %71 = load i8, i8* %z177, align 1, !dbg !553
  %conv178 = sext i8 %71 to i16, !dbg !554
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !555
  %72 = load i8, i8* %z179, align 1, !dbg !555
  %conv180 = sext i8 %72 to i16, !dbg !556
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !557
  %add182 = add nsw i16 %add176, %mul181, !dbg !558
  store i16 %add182, i16* %stddevmag, align 2, !dbg !541
  %73 = load i16, i16* %meanmag, align 2, !dbg !559
  %conv183 = uitofp i16 %73 to double, !dbg !559
  %call = call double @sqrt(double %conv183) #6, !dbg !560
  %conv184 = fptoui double %call to i16, !dbg !560
  %meanmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !561
  store i16 %conv184, i16* %meanmag185, align 2, !dbg !562
  %74 = load i16, i16* %stddevmag, align 2, !dbg !563
  %conv186 = uitofp i16 %74 to double, !dbg !563
  %call187 = call double @sqrt(double %conv186) #6, !dbg !564
  %conv188 = fptoui double %call187 to i16, !dbg !564
  %stddevmag189 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !565
  store i16 %conv188, i16* %stddevmag189, align 2, !dbg !566
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !567
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1, !dbg !567
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals190, i32 0, i32 12, !dbg !567
  %76 = load i16, i16* %mode, align 2, !dbg !567
  switch i16 %76, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb193
  ], !dbg !568

sw.bb:                                            ; preds = %for.end137, %for.end137
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !569
  %globals191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 1, !dbg !569
  %features192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals191, i32 0, i32 7, !dbg !569
  %78 = bitcast %struct.features_t* %features192 to i8*, !dbg !571
  %79 = bitcast %struct.features_t* %features to i8*, !dbg !571
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %78, i8* align 2 %79, i16 4, i1 false), !dbg !571
  br label %sw.epilog, !dbg !572

sw.bb193:                                         ; preds = %for.end137
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !573
  %globals194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 1, !dbg !573
  %features195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals194, i32 0, i32 7, !dbg !573
  %81 = bitcast %struct.features_t* %features195 to i8*, !dbg !574
  %82 = bitcast %struct.features_t* %features to i8*, !dbg !574
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %81, i8* align 2 %82, i16 4, i1 false), !dbg !574
  br label %sw.epilog, !dbg !575

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !576

sw.epilog:                                        ; preds = %sw.default, %sw.bb193, %sw.bb
  ret void, !dbg !577
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_classify() #0 !dbg !578 {
entry:
  %move_less_error = alloca i16, align 2
  %stat_less_error = alloca i16, align 2
  %i = alloca i16, align 2
  %class = alloca i16, align 2
  %meanmag = alloca i32, align 2
  %stddevmag = alloca i32, align 2
  %stat_mean_err = alloca i32, align 2
  %stat_sd_err = alloca i32, align 2
  %move_mean_err = alloca i32, align 2
  %move_sd_err = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i16* %move_less_error, metadata !579, metadata !DIExpression()), !dbg !580
  store i16 0, i16* %move_less_error, align 2, !dbg !580
  call void @llvm.dbg.declare(metadata i16* %stat_less_error, metadata !581, metadata !DIExpression()), !dbg !582
  store i16 0, i16* %stat_less_error, align 2, !dbg !582
  call void @llvm.dbg.declare(metadata i16* %i, metadata !583, metadata !DIExpression()), !dbg !584
  call void @llvm.dbg.declare(metadata i16* %class, metadata !585, metadata !DIExpression()), !dbg !586
  call void @llvm.dbg.declare(metadata i32* %meanmag, metadata !587, metadata !DIExpression()), !dbg !589
  call void @llvm.dbg.declare(metadata i32* %stddevmag, metadata !590, metadata !DIExpression()), !dbg !591
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !592
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !592
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !592
  %meanmag1 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !593
  %1 = load i16, i16* %meanmag1, align 2, !dbg !593
  %conv = zext i16 %1 to i32, !dbg !592
  store i32 %conv, i32* %meanmag, align 2, !dbg !594
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !595
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !595
  %features3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !595
  %stddevmag4 = getelementptr inbounds %struct.features_t, %struct.features_t* %features3, i32 0, i32 1, !dbg !596
  %3 = load i16, i16* %stddevmag4, align 2, !dbg !596
  %conv5 = zext i16 %3 to i32, !dbg !595
  store i32 %conv5, i32* %stddevmag, align 2, !dbg !597
  store i16 0, i16* %i, align 2, !dbg !598
  br label %for.cond, !dbg !600

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !601
  %cmp = icmp slt i16 %4, 16, !dbg !603
  br i1 %cmp, label %for.body, label %for.end, !dbg !604

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %stat_mean_err, metadata !605, metadata !DIExpression()), !dbg !607
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !608
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !608
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !608
  %6 = load i16, i16* %i, align 2, !dbg !609
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %6, !dbg !608
  %meanmag8 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx, i32 0, i32 0, !dbg !610
  %7 = load i16, i16* %meanmag8, align 2, !dbg !610
  %conv9 = zext i16 %7 to i32, !dbg !608
  %8 = load i32, i32* %meanmag, align 2, !dbg !611
  %cmp10 = icmp sgt i32 %conv9, %8, !dbg !612
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !613

cond.true:                                        ; preds = %for.body
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !614
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !614
  %model_stationary13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 8, !dbg !614
  %10 = load i16, i16* %i, align 2, !dbg !615
  %arrayidx14 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary13, i16 0, i16 %10, !dbg !614
  %meanmag15 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx14, i32 0, i32 0, !dbg !616
  %11 = load i16, i16* %meanmag15, align 2, !dbg !616
  %conv16 = zext i16 %11 to i32, !dbg !614
  %12 = load i32, i32* %meanmag, align 2, !dbg !617
  %sub = sub nsw i32 %conv16, %12, !dbg !618
  br label %cond.end, !dbg !613

cond.false:                                       ; preds = %for.body
  %13 = load i32, i32* %meanmag, align 2, !dbg !619
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !620
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !620
  %model_stationary18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 8, !dbg !620
  %15 = load i16, i16* %i, align 2, !dbg !621
  %arrayidx19 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary18, i16 0, i16 %15, !dbg !620
  %meanmag20 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx19, i32 0, i32 0, !dbg !622
  %16 = load i16, i16* %meanmag20, align 2, !dbg !622
  %conv21 = zext i16 %16 to i32, !dbg !620
  %sub22 = sub nsw i32 %13, %conv21, !dbg !623
  br label %cond.end, !dbg !613

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub22, %cond.false ], !dbg !613
  store i32 %cond, i32* %stat_mean_err, align 2, !dbg !607
  call void @llvm.dbg.declare(metadata i32* %stat_sd_err, metadata !624, metadata !DIExpression()), !dbg !625
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !626
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !626
  %model_stationary24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 8, !dbg !626
  %18 = load i16, i16* %i, align 2, !dbg !627
  %arrayidx25 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary24, i16 0, i16 %18, !dbg !626
  %stddevmag26 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx25, i32 0, i32 1, !dbg !628
  %19 = load i16, i16* %stddevmag26, align 2, !dbg !628
  %conv27 = zext i16 %19 to i32, !dbg !626
  %20 = load i32, i32* %stddevmag, align 2, !dbg !629
  %cmp28 = icmp sgt i32 %conv27, %20, !dbg !630
  br i1 %cmp28, label %cond.true30, label %cond.false37, !dbg !631

cond.true30:                                      ; preds = %cond.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !632
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !632
  %model_stationary32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8, !dbg !632
  %22 = load i16, i16* %i, align 2, !dbg !633
  %arrayidx33 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary32, i16 0, i16 %22, !dbg !632
  %stddevmag34 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx33, i32 0, i32 1, !dbg !634
  %23 = load i16, i16* %stddevmag34, align 2, !dbg !634
  %conv35 = zext i16 %23 to i32, !dbg !632
  %24 = load i32, i32* %stddevmag, align 2, !dbg !635
  %sub36 = sub nsw i32 %conv35, %24, !dbg !636
  br label %cond.end44, !dbg !631

cond.false37:                                     ; preds = %cond.end
  %25 = load i32, i32* %stddevmag, align 2, !dbg !637
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !638
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !638
  %model_stationary39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8, !dbg !638
  %27 = load i16, i16* %i, align 2, !dbg !639
  %arrayidx40 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary39, i16 0, i16 %27, !dbg !638
  %stddevmag41 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx40, i32 0, i32 1, !dbg !640
  %28 = load i16, i16* %stddevmag41, align 2, !dbg !640
  %conv42 = zext i16 %28 to i32, !dbg !638
  %sub43 = sub nsw i32 %25, %conv42, !dbg !641
  br label %cond.end44, !dbg !631

cond.end44:                                       ; preds = %cond.false37, %cond.true30
  %cond45 = phi i32 [ %sub36, %cond.true30 ], [ %sub43, %cond.false37 ], !dbg !631
  store i32 %cond45, i32* %stat_sd_err, align 2, !dbg !625
  call void @llvm.dbg.declare(metadata i32* %move_mean_err, metadata !642, metadata !DIExpression()), !dbg !643
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !644
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !644
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 9, !dbg !644
  %30 = load i16, i16* %i, align 2, !dbg !645
  %arrayidx47 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %30, !dbg !644
  %meanmag48 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx47, i32 0, i32 0, !dbg !646
  %31 = load i16, i16* %meanmag48, align 2, !dbg !646
  %conv49 = zext i16 %31 to i32, !dbg !644
  %32 = load i32, i32* %meanmag, align 2, !dbg !647
  %cmp50 = icmp sgt i32 %conv49, %32, !dbg !648
  br i1 %cmp50, label %cond.true52, label %cond.false59, !dbg !649

cond.true52:                                      ; preds = %cond.end44
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !650
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !650
  %model_moving54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 9, !dbg !650
  %34 = load i16, i16* %i, align 2, !dbg !651
  %arrayidx55 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving54, i16 0, i16 %34, !dbg !650
  %meanmag56 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx55, i32 0, i32 0, !dbg !652
  %35 = load i16, i16* %meanmag56, align 2, !dbg !652
  %conv57 = zext i16 %35 to i32, !dbg !650
  %36 = load i32, i32* %meanmag, align 2, !dbg !653
  %sub58 = sub nsw i32 %conv57, %36, !dbg !654
  br label %cond.end66, !dbg !649

cond.false59:                                     ; preds = %cond.end44
  %37 = load i32, i32* %meanmag, align 2, !dbg !655
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !656
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !656
  %model_moving61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 9, !dbg !656
  %39 = load i16, i16* %i, align 2, !dbg !657
  %arrayidx62 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving61, i16 0, i16 %39, !dbg !656
  %meanmag63 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx62, i32 0, i32 0, !dbg !658
  %40 = load i16, i16* %meanmag63, align 2, !dbg !658
  %conv64 = zext i16 %40 to i32, !dbg !656
  %sub65 = sub nsw i32 %37, %conv64, !dbg !659
  br label %cond.end66, !dbg !649

cond.end66:                                       ; preds = %cond.false59, %cond.true52
  %cond67 = phi i32 [ %sub58, %cond.true52 ], [ %sub65, %cond.false59 ], !dbg !649
  store i32 %cond67, i32* %move_mean_err, align 2, !dbg !643
  call void @llvm.dbg.declare(metadata i32* %move_sd_err, metadata !660, metadata !DIExpression()), !dbg !661
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !662
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !662
  %model_moving69 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 9, !dbg !662
  %42 = load i16, i16* %i, align 2, !dbg !663
  %arrayidx70 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving69, i16 0, i16 %42, !dbg !662
  %stddevmag71 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx70, i32 0, i32 1, !dbg !664
  %43 = load i16, i16* %stddevmag71, align 2, !dbg !664
  %conv72 = zext i16 %43 to i32, !dbg !662
  %44 = load i32, i32* %stddevmag, align 2, !dbg !665
  %cmp73 = icmp sgt i32 %conv72, %44, !dbg !666
  br i1 %cmp73, label %cond.true75, label %cond.false82, !dbg !667

cond.true75:                                      ; preds = %cond.end66
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !668
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 1, !dbg !668
  %model_moving77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 9, !dbg !668
  %46 = load i16, i16* %i, align 2, !dbg !669
  %arrayidx78 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving77, i16 0, i16 %46, !dbg !668
  %stddevmag79 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx78, i32 0, i32 1, !dbg !670
  %47 = load i16, i16* %stddevmag79, align 2, !dbg !670
  %conv80 = zext i16 %47 to i32, !dbg !668
  %48 = load i32, i32* %stddevmag, align 2, !dbg !671
  %sub81 = sub nsw i32 %conv80, %48, !dbg !672
  br label %cond.end89, !dbg !667

cond.false82:                                     ; preds = %cond.end66
  %49 = load i32, i32* %stddevmag, align 2, !dbg !673
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !674
  %model_moving84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals83, i32 0, i32 9, !dbg !674
  %51 = load i16, i16* %i, align 2, !dbg !675
  %arrayidx85 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving84, i16 0, i16 %51, !dbg !674
  %stddevmag86 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx85, i32 0, i32 1, !dbg !676
  %52 = load i16, i16* %stddevmag86, align 2, !dbg !676
  %conv87 = zext i16 %52 to i32, !dbg !674
  %sub88 = sub nsw i32 %49, %conv87, !dbg !677
  br label %cond.end89, !dbg !667

cond.end89:                                       ; preds = %cond.false82, %cond.true75
  %cond90 = phi i32 [ %sub81, %cond.true75 ], [ %sub88, %cond.false82 ], !dbg !667
  store i32 %cond90, i32* %move_sd_err, align 2, !dbg !661
  %53 = load i32, i32* %move_mean_err, align 2, !dbg !678
  %54 = load i32, i32* %stat_mean_err, align 2, !dbg !680
  %cmp91 = icmp slt i32 %53, %54, !dbg !681
  br i1 %cmp91, label %if.then, label %if.else, !dbg !682

if.then:                                          ; preds = %cond.end89
  %55 = load i16, i16* %move_less_error, align 2, !dbg !683
  %inc = add nsw i16 %55, 1, !dbg !683
  store i16 %inc, i16* %move_less_error, align 2, !dbg !683
  br label %if.end, !dbg !685

if.else:                                          ; preds = %cond.end89
  %56 = load i16, i16* %stat_less_error, align 2, !dbg !686
  %inc93 = add nsw i16 %56, 1, !dbg !686
  store i16 %inc93, i16* %stat_less_error, align 2, !dbg !686
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %57 = load i32, i32* %move_sd_err, align 2, !dbg !688
  %58 = load i32, i32* %stat_sd_err, align 2, !dbg !690
  %cmp94 = icmp slt i32 %57, %58, !dbg !691
  br i1 %cmp94, label %if.then96, label %if.else98, !dbg !692

if.then96:                                        ; preds = %if.end
  %59 = load i16, i16* %move_less_error, align 2, !dbg !693
  %inc97 = add nsw i16 %59, 1, !dbg !693
  store i16 %inc97, i16* %move_less_error, align 2, !dbg !693
  br label %if.end100, !dbg !695

if.else98:                                        ; preds = %if.end
  %60 = load i16, i16* %stat_less_error, align 2, !dbg !696
  %inc99 = add nsw i16 %60, 1, !dbg !696
  store i16 %inc99, i16* %stat_less_error, align 2, !dbg !696
  br label %if.end100

if.end100:                                        ; preds = %if.else98, %if.then96
  br label %for.inc, !dbg !698

for.inc:                                          ; preds = %if.end100
  %61 = load i16, i16* %i, align 2, !dbg !699
  %inc101 = add nsw i16 %61, 1, !dbg !699
  store i16 %inc101, i16* %i, align 2, !dbg !699
  br label %for.cond, !dbg !700, !llvm.loop !701

for.end:                                          ; preds = %for.cond
  %62 = load i16, i16* %move_less_error, align 2, !dbg !703
  %63 = load i16, i16* %stat_less_error, align 2, !dbg !704
  %cmp102 = icmp sgt i16 %62, %63, !dbg !705
  %64 = zext i1 %cmp102 to i64, !dbg !706
  %cond104 = select i1 %cmp102, i16 1, i16 0, !dbg !706
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !707
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 1, !dbg !707
  %class106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals105, i32 0, i32 2, !dbg !707
  store i16 %cond104, i16* %class106, align 2, !dbg !708
  ret void, !dbg !709
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_stats() #0 !dbg !710 {
entry:
  %movingCount = alloca i16, align 2
  %stationaryCount = alloca i16, align 2
  %resultStationaryPct = alloca i16, align 2
  %resultMovingPct = alloca i16, align 2
  %sum = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %movingCount, metadata !711, metadata !DIExpression()), !dbg !712
  store i16 0, i16* %movingCount, align 2, !dbg !712
  call void @llvm.dbg.declare(metadata i16* %stationaryCount, metadata !713, metadata !DIExpression()), !dbg !714
  store i16 0, i16* %stationaryCount, align 2, !dbg !714
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !715
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !715
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !715
  %1 = load i16, i16* %totalCount, align 2, !dbg !716
  %inc = add i16 %1, 1, !dbg !716
  store i16 %inc, i16* %totalCount, align 2, !dbg !716
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !717
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !717
  %class = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !717
  %3 = load i16, i16* %class, align 2, !dbg !717
  switch i16 %3, label %sw.epilog [
    i16 1, label %sw.bb
    i16 0, label %sw.bb5
  ], !dbg !718

sw.bb:                                            ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !719
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !719
  %movingCount3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !719
  %5 = load i16, i16* %movingCount3, align 2, !dbg !721
  %inc4 = add i16 %5, 1, !dbg !721
  store i16 %inc4, i16* %movingCount3, align 2, !dbg !721
  br label %sw.epilog, !dbg !722

sw.bb5:                                           ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !723
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !723
  %stationaryCount7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !723
  %7 = load i16, i16* %stationaryCount7, align 2, !dbg !724
  %inc8 = add i16 %7, 1, !dbg !724
  store i16 %inc8, i16* %stationaryCount7, align 2, !dbg !724
  br label %sw.epilog, !dbg !725

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !726
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !726
  %totalCount10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !726
  %9 = load i16, i16* %totalCount10, align 2, !dbg !726
  %cmp = icmp eq i16 %9, 128, !dbg !728
  br i1 %cmp, label %if.then, label %if.end, !dbg !729

if.then:                                          ; preds = %sw.epilog
  call void @llvm.dbg.declare(metadata i16* %resultStationaryPct, metadata !730, metadata !DIExpression()), !dbg !732
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !733
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !733
  %stationaryCount12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 5, !dbg !733
  %11 = load i16, i16* %stationaryCount12, align 2, !dbg !733
  %mul = mul i16 %11, 100, !dbg !734
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !735
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !735
  %totalCount14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !735
  %13 = load i16, i16* %totalCount14, align 2, !dbg !735
  %div = udiv i16 %mul, %13, !dbg !736
  store i16 %div, i16* %resultStationaryPct, align 2, !dbg !732
  call void @llvm.dbg.declare(metadata i16* %resultMovingPct, metadata !737, metadata !DIExpression()), !dbg !738
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !739
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !739
  %movingCount16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 4, !dbg !739
  %15 = load i16, i16* %movingCount16, align 2, !dbg !739
  %mul17 = mul i16 %15, 100, !dbg !740
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !741
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !741
  %totalCount19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !741
  %17 = load i16, i16* %totalCount19, align 2, !dbg !741
  %div20 = udiv i16 %mul17, %17, !dbg !742
  store i16 %div20, i16* %resultMovingPct, align 2, !dbg !738
  call void @llvm.dbg.declare(metadata i16* %sum, metadata !743, metadata !DIExpression()), !dbg !744
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !745
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !745
  %stationaryCount22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 5, !dbg !745
  %19 = load i16, i16* %stationaryCount22, align 2, !dbg !745
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !746
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !746
  %movingCount24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 4, !dbg !746
  %21 = load i16, i16* %movingCount24, align 2, !dbg !746
  %add = add i16 %19, %21, !dbg !747
  store i16 %add, i16* %sum, align 2, !dbg !744
  br label %if.end, !dbg !748

if.end:                                           ; preds = %if.then, %sw.epilog
  ret void, !dbg !749
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_warmup() #0 !dbg !750 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !751, metadata !DIExpression()), !dbg !752
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !753
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !753
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !753
  %1 = load i16, i16* %seed, align 2, !dbg !753
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %1), !dbg !754
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !755
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !755
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !755
  store i16 %call, i16* %seed2, align 2, !dbg !756
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !757
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !757
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !757
  %4 = load i16, i16* %discardedSamplesCount, align 2, !dbg !758
  %inc = add i16 %4, 1, !dbg !758
  store i16 %inc, i16* %discardedSamplesCount, align 2, !dbg !758
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !759
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !759
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !759
  %6 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !759
  %cmp = icmp eq i16 %6, 3, !dbg !761
  br i1 %cmp, label %if.then, label %if.end, !dbg !762

if.then:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !763
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !763
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !763
  store i16 0, i16* %trainingSetSize, align 2, !dbg !765
  br label %if.end, !dbg !766

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !767
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_train() #0 !dbg !768 {
entry:
  %trainingSetSize = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %trainingSetSize, metadata !769, metadata !DIExpression()), !dbg !770
  call void @llvm.dbg.declare(metadata i16* %class, metadata !771, metadata !DIExpression()), !dbg !772
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !773
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !773
  %class1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !773
  %1 = load i16, i16* %class1, align 2, !dbg !773
  switch i16 %1, label %sw.epilog [
    i16 0, label %sw.bb
    i16 1, label %sw.bb6
  ], !dbg !774

sw.bb:                                            ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !775
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !775
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !775
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !777
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !777
  %trainingSetSize4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !777
  %4 = load i16, i16* %trainingSetSize4, align 2, !dbg !777
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %4, !dbg !775
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !778
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !778
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !778
  %6 = bitcast %struct.features_t* %arrayidx to i8*, !dbg !778
  %7 = bitcast %struct.features_t* %features to i8*, !dbg !778
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 4, i1 false), !dbg !778
  br label %sw.epilog, !dbg !779

sw.bb6:                                           ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !780
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !780
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !780
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !781
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !781
  %trainingSetSize9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 10, !dbg !781
  %10 = load i16, i16* %trainingSetSize9, align 2, !dbg !781
  %arrayidx10 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %10, !dbg !780
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !782
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !782
  %features12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7, !dbg !782
  %12 = bitcast %struct.features_t* %arrayidx10 to i8*, !dbg !782
  %13 = bitcast %struct.features_t* %features12 to i8*, !dbg !782
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 4, i1 false), !dbg !782
  br label %sw.epilog, !dbg !783

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !784
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !784
  %trainingSetSize14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !784
  %15 = load i16, i16* %trainingSetSize14, align 2, !dbg !785
  %inc = add i16 %15, 1, !dbg !785
  store i16 %inc, i16* %trainingSetSize14, align 2, !dbg !785
  ret void, !dbg !786
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !787 {
entry:
  call void @exit(i16 0) #7, !dbg !788
  unreachable, !dbg !788
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #5

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !789 {
entry:
  ret void, !dbg !790
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !791 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !794
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !795
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !796
  call void @camel_init(), !dbg !797
  call void @task_init(), !dbg !798
  br label %while.body, !dbg !799

while.body:                                       ; preds = %entry, %if.then16, %while.end49
  call void @task_selectMode(), !dbg !800
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !802
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !802
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !802
  %1 = load i16, i16* %mode, align 2, !dbg !802
  %cmp = icmp eq i16 %1, 2, !dbg !804
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !805

lor.lhs.false:                                    ; preds = %while.body
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !806
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !806
  %mode2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !806
  %3 = load i16, i16* %mode2, align 2, !dbg !806
  %cmp3 = icmp eq i16 %3, 1, !dbg !807
  br i1 %cmp3, label %if.then, label %if.else, !dbg !808

if.then:                                          ; preds = %lor.lhs.false, %while.body
  br label %while.cond4, !dbg !809

while.cond4:                                      ; preds = %while.body7, %if.then
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !811
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !811
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 1, !dbg !811
  %5 = load i16, i16* %discardedSamplesCount, align 2, !dbg !811
  %cmp6 = icmp ult i16 %5, 3, !dbg !812
  br i1 %cmp6, label %while.body7, label %while.end, !dbg !809

while.body7:                                      ; preds = %while.cond4
  call void @task_warmup(), !dbg !813
  br label %while.cond4, !dbg !809, !llvm.loop !815

while.end:                                        ; preds = %while.cond4
  br label %if.end18, !dbg !817

if.else:                                          ; preds = %lor.lhs.false
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !818
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !818
  %mode9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 12, !dbg !818
  %7 = load i16, i16* %mode9, align 2, !dbg !818
  %cmp10 = icmp eq i16 %7, 0, !dbg !820
  br i1 %cmp10, label %if.then11, label %if.else12, !dbg !821

if.then11:                                        ; preds = %if.else
  call void @task_resetStats(), !dbg !822
  br label %if.end17, !dbg !824

if.else12:                                        ; preds = %if.else
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !825
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !825
  %mode14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 12, !dbg !825
  %9 = load i16, i16* %mode14, align 2, !dbg !825
  %cmp15 = icmp eq i16 %9, 3, !dbg !827
  br i1 %cmp15, label %if.then16, label %if.end, !dbg !828

if.then16:                                        ; preds = %if.else12
  br label %while.body, !dbg !829, !llvm.loop !831

if.end:                                           ; preds = %if.else12
  br label %if.end17

if.end17:                                         ; preds = %if.end, %if.then11
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %while.end
  br label %while.body20, !dbg !833

while.body20:                                     ; preds = %if.end18, %if.end48
  br label %while.cond21, !dbg !834

while.cond21:                                     ; preds = %while.body24, %while.body20
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !836
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !836
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 11, !dbg !836
  %11 = load i16, i16* %samplesInWindow, align 2, !dbg !836
  %cmp23 = icmp ult i16 %11, 3, !dbg !837
  br i1 %cmp23, label %while.body24, label %while.end25, !dbg !834

while.body24:                                     ; preds = %while.cond21
  call void @task_sample(), !dbg !838
  br label %while.cond21, !dbg !834, !llvm.loop !840

while.end25:                                      ; preds = %while.cond21
  call void @task_transform(), !dbg !842
  call void @task_featurize(), !dbg !843
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !844
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !844
  %mode27 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 12, !dbg !844
  %13 = load i16, i16* %mode27, align 2, !dbg !844
  %cmp28 = icmp eq i16 %13, 2, !dbg !846
  br i1 %cmp28, label %if.then33, label %lor.lhs.false29, !dbg !847

lor.lhs.false29:                                  ; preds = %while.end25
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !848
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !848
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !848
  %15 = load i16, i16* %mode31, align 2, !dbg !848
  %cmp32 = icmp eq i16 %15, 1, !dbg !849
  br i1 %cmp32, label %if.then33, label %if.else38, !dbg !850

if.then33:                                        ; preds = %lor.lhs.false29, %while.end25
  call void @task_train(), !dbg !851
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !853
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !853
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 10, !dbg !853
  %17 = load i16, i16* %trainingSetSize, align 2, !dbg !853
  %cmp35 = icmp uge i16 %17, 16, !dbg !855
  br i1 %cmp35, label %if.then36, label %if.end37, !dbg !856

if.then36:                                        ; preds = %if.then33
  br label %while.end49, !dbg !857

if.end37:                                         ; preds = %if.then33
  br label %if.end48, !dbg !858

if.else38:                                        ; preds = %lor.lhs.false29
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !859
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !859
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !859
  %19 = load i16, i16* %mode40, align 2, !dbg !859
  %cmp41 = icmp eq i16 %19, 0, !dbg !861
  br i1 %cmp41, label %if.then42, label %if.end47, !dbg !862

if.then42:                                        ; preds = %if.else38
  call void @task_classify(), !dbg !863
  call void @task_stats(), !dbg !865
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !866
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !866
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 3, !dbg !866
  %21 = load i16, i16* %totalCount, align 2, !dbg !866
  %cmp44 = icmp eq i16 %21, 128, !dbg !868
  br i1 %cmp44, label %if.then45, label %if.end46, !dbg !869

if.then45:                                        ; preds = %if.then42
  br label %while.end49, !dbg !870

if.end46:                                         ; preds = %if.then42
  br label %if.end47, !dbg !871

if.end47:                                         ; preds = %if.end46, %if.else38
  br label %if.end48

if.end48:                                         ; preds = %if.end47, %if.end37
  br label %while.body20, !dbg !833, !llvm.loop !872

while.end49:                                      ; preds = %if.then45, %if.then36
  br label %while.body, !dbg !799, !llvm.loop !831
}

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!96, !97, !98}
!llvm.ident = !{!99}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 150, type: !91, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !16, globals: !17, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_ar.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{!5, !12}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 40, baseType: !6, size: 16, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11}
!8 = !DIEnumerator(name: "MODE_IDLE", value: 3, isUnsigned: true)
!9 = !DIEnumerator(name: "MODE_TRAIN_STATIONARY", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "MODE_TRAIN_MOVING", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "MODE_RECOGNIZE", value: 0, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 35, baseType: !6, size: 16, elements: !13)
!13 = !{!14, !15}
!14 = !DIEnumerator(name: "CLASS_STATIONARY", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "CLASS_MOVING", value: 1, isUnsigned: true)
!16 = !{!6}
!17 = !{!18, !23, !30, !0, !32, !86, !88}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 567, type: !20, isLocal: true, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 16)
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 68, type: !25, isLocal: false, isDefinition: true)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !26, line: 26, baseType: !27)
!26 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !28, line: 43, baseType: !29)
!28 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!29 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 69, type: !25, isLocal: false, isDefinition: true)
!32 = !DIGlobalVariableExpression(var: !33, expr: !DIExpression())
!33 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 157, type: !34, isLocal: false, isDefinition: true)
!34 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !35, size: 16)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 143, baseType: !36)
!36 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 138, size: 1504, elements: !37)
!37 = !{!38, !43, !85}
!38 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !36, file: !3, line: 140, baseType: !39, size: 176)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 176, elements: !41)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 65, baseType: !25)
!41 = !{!42}
!42 = !DISubrange(count: 11)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !36, file: !3, line: 141, baseType: !44, size: 1312, offset: 176)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 135, baseType: !45)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 118, size: 1312, elements: !46)
!46 = !{!47, !48, !49, !51, !52, !53, !54, !68, !74, !78, !79, !80, !81, !83, !84}
!47 = !DIDerivedType(tag: DW_TAG_member, name: "pinState", scope: !45, file: !3, line: 120, baseType: !25, size: 16)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "discardedSamplesCount", scope: !45, file: !3, line: 121, baseType: !6, size: 16, offset: 16)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "class", scope: !45, file: !3, line: 122, baseType: !50, size: 16, offset: 32)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "class_t", file: !3, line: 38, baseType: !12)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "totalCount", scope: !45, file: !3, line: 123, baseType: !6, size: 16, offset: 48)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "movingCount", scope: !45, file: !3, line: 124, baseType: !6, size: 16, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "stationaryCount", scope: !45, file: !3, line: 125, baseType: !6, size: 16, offset: 80)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !45, file: !3, line: 126, baseType: !55, size: 72, offset: 96)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 72, elements: !66)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "accelReading", file: !3, line: 27, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "threeAxis_t_8", file: !3, line: 25, baseType: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 21, size: 24, elements: !59)
!59 = !{!60, !64, !65}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !58, file: !3, line: 22, baseType: !61, size: 8)
!61 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !26, line: 19, baseType: !62)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !28, line: 27, baseType: !63)
!63 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !58, file: !3, line: 23, baseType: !61, size: 8, offset: 8)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !58, file: !3, line: 24, baseType: !61, size: 8, offset: 16)
!66 = !{!67}
!67 = !DISubrange(count: 3)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "features", scope: !45, file: !3, line: 127, baseType: !69, size: 32, offset: 176)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "features_t", file: !3, line: 33, baseType: !70)
!70 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 30, size: 32, elements: !71)
!71 = !{!72, !73}
!72 = !DIDerivedType(tag: DW_TAG_member, name: "meanmag", scope: !70, file: !3, line: 31, baseType: !6, size: 16)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "stddevmag", scope: !70, file: !3, line: 32, baseType: !6, size: 16, offset: 16)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "model_stationary", scope: !45, file: !3, line: 128, baseType: !75, size: 512, offset: 208)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !69, size: 512, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 16)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "model_moving", scope: !45, file: !3, line: 129, baseType: !75, size: 512, offset: 720)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "trainingSetSize", scope: !45, file: !3, line: 130, baseType: !6, size: 16, offset: 1232)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "samplesInWindow", scope: !45, file: !3, line: 131, baseType: !6, size: 16, offset: 1248)
!81 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !45, file: !3, line: 132, baseType: !82, size: 16, offset: 1264)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "run_mode_t", file: !3, line: 48, baseType: !5)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !45, file: !3, line: 133, baseType: !6, size: 16, offset: 1280)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !45, file: !3, line: 134, baseType: !6, size: 16, offset: 1296)
!85 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !36, file: !3, line: 142, baseType: !25, size: 16, offset: 1488)
!86 = !DIGlobalVariableExpression(var: !87, expr: !DIExpression())
!87 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 157, type: !34, isLocal: false, isDefinition: true)
!88 = !DIGlobalVariableExpression(var: !89, expr: !DIExpression())
!89 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 186, type: !90, isLocal: false, isDefinition: true)
!90 = !DICompositeType(tag: DW_TAG_array_type, baseType: !25, size: 176, elements: !41)
!91 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 145, size: 3024, elements: !92)
!92 = !{!93, !94, !95}
!93 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !91, file: !3, line: 147, baseType: !25, size: 16)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !91, file: !3, line: 148, baseType: !35, size: 1504, offset: 16)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !91, file: !3, line: 149, baseType: !35, size: 1504, offset: 1520)
!96 = !{i32 2, !"Dwarf Version", i32 4}
!97 = !{i32 2, !"Debug Info Version", i32 3}
!98 = !{i32 1, !"wchar_size", i32 2}
!99 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!100 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 159, type: !21, scopeLine: 159, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!101 = !{}
!102 = !DILocation(line: 160, column: 10, scope: !100)
!103 = !DILocation(line: 162, column: 9, scope: !100)
!104 = !DILocation(line: 164, column: 9, scope: !100)
!105 = !DILocation(line: 169, column: 11, scope: !100)
!106 = !DILocation(line: 174, column: 12, scope: !100)
!107 = !DILocation(line: 175, column: 10, scope: !100)
!108 = !DILocation(line: 176, column: 10, scope: !100)
!109 = !DILocation(line: 178, column: 10, scope: !100)
!110 = !DILocation(line: 179, column: 12, scope: !100)
!111 = !DILocation(line: 182, column: 10, scope: !100)
!112 = !DILocation(line: 184, column: 1, scope: !100)
!113 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 188, type: !21, scopeLine: 188, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!114 = !DILocation(line: 189, column: 14, scope: !115)
!115 = distinct !DILexicalBlock(scope: !113, file: !3, line: 189, column: 8)
!116 = !DILocation(line: 189, column: 19, scope: !115)
!117 = !DILocation(line: 189, column: 8, scope: !113)
!118 = !DILocation(line: 190, column: 14, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !3, line: 189, column: 34)
!120 = !DILocation(line: 191, column: 16, scope: !119)
!121 = !DILocation(line: 192, column: 5, scope: !119)
!122 = !DILocation(line: 192, column: 21, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !3, line: 192, column: 15)
!124 = !DILocation(line: 192, column: 26, scope: !123)
!125 = !DILocation(line: 192, column: 15, scope: !115)
!126 = !DILocation(line: 193, column: 14, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !3, line: 192, column: 41)
!128 = !DILocation(line: 194, column: 16, scope: !127)
!129 = !DILocation(line: 195, column: 5, scope: !127)
!130 = !DILocation(line: 196, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !123, file: !3, line: 195, column: 12)
!132 = !DILocation(line: 213, column: 3, scope: !133)
!133 = distinct !DILexicalBlock(scope: !113, file: !3, line: 213, column: 3)
!134 = !{i32 -2146652341}
!135 = !DILocalVariable(name: "__x", scope: !136, file: !3, line: 215, type: !6)
!136 = distinct !DILexicalBlock(scope: !113, file: !3, line: 215, column: 33)
!137 = !DILocation(line: 215, column: 33, scope: !136)
!138 = !{i32 -2146652105}
!139 = !DILocation(line: 215, column: 51, scope: !113)
!140 = !DILocation(line: 215, column: 33, scope: !113)
!141 = !DILocalVariable(name: "__x", scope: !142, file: !3, line: 215, type: !6)
!142 = distinct !DILexicalBlock(scope: !113, file: !3, line: 215, column: 65)
!143 = !DILocation(line: 215, column: 65, scope: !142)
!144 = !{i32 -2146651980}
!145 = !DILocation(line: 215, column: 83, scope: !113)
!146 = !DILocation(line: 215, column: 63, scope: !113)
!147 = !DILocation(line: 215, column: 19, scope: !113)
!148 = !DILocation(line: 215, column: 17, scope: !113)
!149 = !DILocation(line: 216, column: 37, scope: !113)
!150 = !DILocation(line: 216, column: 71, scope: !113)
!151 = !DILocation(line: 216, column: 23, scope: !113)
!152 = !DILocation(line: 216, column: 21, scope: !113)
!153 = !DILocation(line: 219, column: 6, scope: !154)
!154 = distinct !DILexicalBlock(scope: !113, file: !3, line: 219, column: 6)
!155 = !DILocation(line: 219, column: 27, scope: !154)
!156 = !DILocation(line: 219, column: 33, scope: !154)
!157 = !DILocation(line: 219, column: 24, scope: !154)
!158 = !DILocation(line: 219, column: 6, scope: !113)
!159 = !DILocation(line: 220, column: 11, scope: !160)
!160 = distinct !DILexicalBlock(scope: !154, file: !3, line: 219, column: 51)
!161 = !DILocation(line: 220, column: 4, scope: !160)
!162 = !DILocation(line: 220, column: 19, scope: !160)
!163 = !DILocation(line: 221, column: 4, scope: !160)
!164 = !DILocation(line: 222, column: 24, scope: !160)
!165 = !DILocation(line: 222, column: 30, scope: !160)
!166 = !DILocation(line: 222, column: 4, scope: !160)
!167 = !DILocation(line: 223, column: 3, scope: !160)
!168 = !DILocation(line: 224, column: 4, scope: !169)
!169 = distinct !DILexicalBlock(scope: !154, file: !3, line: 223, column: 9)
!170 = !DILocation(line: 227, column: 1, scope: !113)
!171 = distinct !DISubprogram(name: "ACCEL_singleSample_", scope: !3, file: !3, line: 229, type: !172, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!172 = !DISubroutineType(types: !173)
!173 = !{!6, !174, !6}
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 16)
!175 = !DILocalVariable(name: "result", arg: 1, scope: !171, file: !3, line: 229, type: !174)
!176 = !DILocation(line: 229, column: 45, scope: !171)
!177 = !DILocalVariable(name: "seed", arg: 2, scope: !171, file: !3, line: 229, type: !6)
!178 = !DILocation(line: 229, column: 62, scope: !171)
!179 = !DILocation(line: 230, column: 15, scope: !171)
!180 = !DILocation(line: 230, column: 19, scope: !171)
!181 = !DILocation(line: 230, column: 23, scope: !171)
!182 = !DILocation(line: 230, column: 14, scope: !171)
!183 = !DILocation(line: 230, column: 2, scope: !171)
!184 = !DILocation(line: 230, column: 10, scope: !171)
!185 = !DILocation(line: 230, column: 12, scope: !171)
!186 = !DILocation(line: 231, column: 15, scope: !171)
!187 = !DILocation(line: 231, column: 19, scope: !171)
!188 = !DILocation(line: 231, column: 22, scope: !171)
!189 = !DILocation(line: 231, column: 26, scope: !171)
!190 = !DILocation(line: 231, column: 14, scope: !171)
!191 = !DILocation(line: 231, column: 2, scope: !171)
!192 = !DILocation(line: 231, column: 10, scope: !171)
!193 = !DILocation(line: 231, column: 12, scope: !171)
!194 = !DILocation(line: 232, column: 15, scope: !171)
!195 = !DILocation(line: 232, column: 19, scope: !171)
!196 = !DILocation(line: 232, column: 22, scope: !171)
!197 = !DILocation(line: 232, column: 25, scope: !171)
!198 = !DILocation(line: 232, column: 29, scope: !171)
!199 = !DILocation(line: 232, column: 14, scope: !171)
!200 = !DILocation(line: 232, column: 2, scope: !171)
!201 = !DILocation(line: 232, column: 10, scope: !171)
!202 = !DILocation(line: 232, column: 12, scope: !171)
!203 = !DILocation(line: 233, column: 2, scope: !171)
!204 = !DILocation(line: 235, column: 9, scope: !171)
!205 = !DILocation(line: 235, column: 2, scope: !171)
!206 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 238, type: !21, scopeLine: 239, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!207 = !DILocation(line: 240, column: 2, scope: !206)
!208 = !DILocation(line: 240, column: 15, scope: !206)
!209 = !DILocation(line: 241, column: 2, scope: !206)
!210 = !DILocation(line: 241, column: 12, scope: !206)
!211 = !DILocation(line: 242, column: 2, scope: !206)
!212 = !DILocation(line: 242, column: 11, scope: !206)
!213 = !DILocation(line: 243, column: 1, scope: !206)
!214 = distinct !DISubprogram(name: "task_selectMode", scope: !3, file: !3, line: 245, type: !21, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!215 = !DILocalVariable(name: "pin_state", scope: !214, file: !3, line: 247, type: !25)
!216 = !DILocation(line: 247, column: 11, scope: !214)
!217 = !DILocation(line: 248, column: 4, scope: !214)
!218 = !DILocation(line: 248, column: 2, scope: !214)
!219 = !DILocation(line: 250, column: 5, scope: !220)
!220 = distinct !DILexicalBlock(scope: !214, file: !3, line: 250, column: 5)
!221 = !DILocation(line: 250, column: 15, scope: !220)
!222 = !DILocation(line: 250, column: 5, scope: !214)
!223 = !DILocation(line: 250, column: 30, scope: !220)
!224 = !DILocation(line: 250, column: 21, scope: !220)
!225 = !DILocation(line: 251, column: 5, scope: !226)
!226 = distinct !DILexicalBlock(scope: !214, file: !3, line: 251, column: 5)
!227 = !DILocation(line: 251, column: 14, scope: !226)
!228 = !DILocation(line: 251, column: 5, scope: !214)
!229 = !DILocation(line: 251, column: 28, scope: !226)
!230 = !DILocation(line: 251, column: 19, scope: !226)
!231 = !DILocation(line: 252, column: 6, scope: !232)
!232 = distinct !DILexicalBlock(scope: !214, file: !3, line: 252, column: 6)
!233 = !DILocation(line: 252, column: 16, scope: !232)
!234 = !DILocation(line: 252, column: 6, scope: !214)
!235 = !DILocation(line: 254, column: 3, scope: !236)
!236 = distinct !DILexicalBlock(scope: !232, file: !3, line: 252, column: 22)
!237 = !DILocation(line: 255, column: 2, scope: !236)
!238 = !DILocalVariable(name: "mode", scope: !214, file: !3, line: 256, type: !82)
!239 = !DILocation(line: 256, column: 13, scope: !214)
!240 = !DILocalVariable(name: "class", scope: !214, file: !3, line: 257, type: !50)
!241 = !DILocation(line: 257, column: 10, scope: !214)
!242 = !DILocation(line: 259, column: 7, scope: !243)
!243 = distinct !DILexicalBlock(scope: !214, file: !3, line: 259, column: 6)
!244 = !DILocation(line: 259, column: 17, scope: !243)
!245 = !DILocation(line: 259, column: 42, scope: !243)
!246 = !DILocation(line: 260, column: 5, scope: !243)
!247 = !DILocation(line: 260, column: 15, scope: !243)
!248 = !DILocation(line: 260, column: 37, scope: !243)
!249 = !DILocation(line: 261, column: 4, scope: !243)
!250 = !DILocation(line: 261, column: 17, scope: !243)
!251 = !DILocation(line: 261, column: 14, scope: !243)
!252 = !DILocation(line: 259, column: 6, scope: !214)
!253 = !DILocation(line: 262, column: 13, scope: !254)
!254 = distinct !DILexicalBlock(scope: !243, file: !3, line: 261, column: 31)
!255 = !DILocation(line: 263, column: 2, scope: !254)
!256 = !DILocation(line: 264, column: 18, scope: !257)
!257 = distinct !DILexicalBlock(scope: !243, file: !3, line: 263, column: 9)
!258 = !DILocation(line: 264, column: 3, scope: !257)
!259 = !DILocation(line: 264, column: 16, scope: !257)
!260 = !DILocation(line: 267, column: 9, scope: !214)
!261 = !DILocation(line: 267, column: 2, scope: !214)
!262 = !DILocation(line: 269, column: 4, scope: !263)
!263 = distinct !DILexicalBlock(scope: !214, file: !3, line: 267, column: 20)
!264 = !DILocation(line: 269, column: 30, scope: !263)
!265 = !DILocation(line: 270, column: 4, scope: !263)
!266 = !DILocation(line: 270, column: 13, scope: !263)
!267 = !DILocation(line: 271, column: 4, scope: !263)
!268 = !DILocation(line: 271, column: 14, scope: !263)
!269 = !DILocation(line: 272, column: 4, scope: !263)
!270 = !DILocation(line: 272, column: 24, scope: !263)
!271 = !DILocation(line: 274, column: 4, scope: !263)
!272 = !DILocation(line: 277, column: 4, scope: !263)
!273 = !DILocation(line: 277, column: 30, scope: !263)
!274 = !DILocation(line: 278, column: 4, scope: !263)
!275 = !DILocation(line: 278, column: 13, scope: !263)
!276 = !DILocation(line: 279, column: 4, scope: !263)
!277 = !DILocation(line: 279, column: 14, scope: !263)
!278 = !DILocation(line: 280, column: 4, scope: !263)
!279 = !DILocation(line: 280, column: 24, scope: !263)
!280 = !DILocation(line: 282, column: 4, scope: !263)
!281 = !DILocation(line: 285, column: 4, scope: !263)
!282 = !DILocation(line: 285, column: 13, scope: !263)
!283 = !DILocation(line: 287, column: 4, scope: !263)
!284 = !DILocation(line: 290, column: 4, scope: !263)
!285 = !DILocation(line: 290, column: 13, scope: !263)
!286 = !DILocation(line: 291, column: 4, scope: !263)
!287 = !DILocation(line: 293, column: 1, scope: !214)
!288 = distinct !DISubprogram(name: "task_resetStats", scope: !3, file: !3, line: 295, type: !21, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!289 = !DILocation(line: 298, column: 2, scope: !288)
!290 = !DILocation(line: 298, column: 18, scope: !288)
!291 = !DILocation(line: 299, column: 2, scope: !288)
!292 = !DILocation(line: 299, column: 22, scope: !288)
!293 = !DILocation(line: 300, column: 2, scope: !288)
!294 = !DILocation(line: 300, column: 17, scope: !288)
!295 = !DILocation(line: 302, column: 2, scope: !288)
!296 = !DILocation(line: 302, column: 22, scope: !288)
!297 = !DILocation(line: 304, column: 1, scope: !288)
!298 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 306, type: !21, scopeLine: 307, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!299 = !DILocalVariable(name: "sample", scope: !298, file: !3, line: 309, type: !56)
!300 = !DILocation(line: 309, column: 15, scope: !298)
!301 = !DILocation(line: 310, column: 31, scope: !298)
!302 = !DILocation(line: 310, column: 2, scope: !298)
!303 = !DILocation(line: 311, column: 2, scope: !298)
!304 = !DILocation(line: 311, column: 13, scope: !298)
!305 = !DILocation(line: 311, column: 36, scope: !298)
!306 = !DILocation(line: 312, column: 4, scope: !298)
!307 = !DILocation(line: 312, column: 2, scope: !298)
!308 = !DILocation(line: 314, column: 1, scope: !298)
!309 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 316, type: !21, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!310 = !DILocation(line: 318, column: 5, scope: !309)
!311 = !DILocation(line: 318, column: 25, scope: !309)
!312 = !DILocalVariable(name: "sample", scope: !309, file: !3, line: 320, type: !313)
!313 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 16)
!314 = !DILocation(line: 320, column: 16, scope: !309)
!315 = !DILocalVariable(name: "transformedSample", scope: !309, file: !3, line: 321, type: !56)
!316 = !DILocation(line: 321, column: 15, scope: !309)
!317 = !DILocalVariable(name: "i", scope: !318, file: !3, line: 323, type: !6)
!318 = distinct !DILexicalBlock(scope: !309, file: !3, line: 323, column: 2)
!319 = !DILocation(line: 323, column: 16, scope: !318)
!320 = !DILocation(line: 323, column: 7, scope: !318)
!321 = !DILocation(line: 323, column: 23, scope: !322)
!322 = distinct !DILexicalBlock(scope: !318, file: !3, line: 323, column: 2)
!323 = !DILocation(line: 323, column: 25, scope: !322)
!324 = !DILocation(line: 323, column: 2, scope: !318)
!325 = !DILocation(line: 324, column: 7, scope: !326)
!326 = distinct !DILexicalBlock(scope: !327, file: !3, line: 324, column: 7)
!327 = distinct !DILexicalBlock(scope: !322, file: !3, line: 323, column: 51)
!328 = !DILocation(line: 324, column: 18, scope: !326)
!329 = !DILocation(line: 324, column: 21, scope: !326)
!330 = !DILocation(line: 324, column: 23, scope: !326)
!331 = !DILocation(line: 324, column: 44, scope: !326)
!332 = !DILocation(line: 325, column: 5, scope: !326)
!333 = !DILocation(line: 325, column: 16, scope: !326)
!334 = !DILocation(line: 325, column: 19, scope: !326)
!335 = !DILocation(line: 325, column: 21, scope: !326)
!336 = !DILocation(line: 325, column: 42, scope: !326)
!337 = !DILocation(line: 326, column: 5, scope: !326)
!338 = !DILocation(line: 326, column: 16, scope: !326)
!339 = !DILocation(line: 326, column: 19, scope: !326)
!340 = !DILocation(line: 326, column: 21, scope: !326)
!341 = !DILocation(line: 324, column: 7, scope: !327)
!342 = !DILocation(line: 328, column: 23, scope: !343)
!343 = distinct !DILexicalBlock(scope: !326, file: !3, line: 326, column: 43)
!344 = !DILocation(line: 328, column: 34, scope: !343)
!345 = !DILocation(line: 328, column: 37, scope: !343)
!346 = !DILocation(line: 328, column: 39, scope: !343)
!347 = !DILocation(line: 328, column: 22, scope: !343)
!348 = !DILocation(line: 329, column: 7, scope: !343)
!349 = !DILocation(line: 329, column: 18, scope: !343)
!350 = !DILocation(line: 329, column: 21, scope: !343)
!351 = !DILocation(line: 328, column: 4, scope: !343)
!352 = !DILocation(line: 328, column: 15, scope: !343)
!353 = !DILocation(line: 328, column: 18, scope: !343)
!354 = !DILocation(line: 328, column: 20, scope: !343)
!355 = !DILocation(line: 330, column: 23, scope: !343)
!356 = !DILocation(line: 330, column: 34, scope: !343)
!357 = !DILocation(line: 330, column: 37, scope: !343)
!358 = !DILocation(line: 330, column: 39, scope: !343)
!359 = !DILocation(line: 330, column: 22, scope: !343)
!360 = !DILocation(line: 331, column: 7, scope: !343)
!361 = !DILocation(line: 331, column: 18, scope: !343)
!362 = !DILocation(line: 331, column: 21, scope: !343)
!363 = !DILocation(line: 330, column: 4, scope: !343)
!364 = !DILocation(line: 330, column: 15, scope: !343)
!365 = !DILocation(line: 330, column: 18, scope: !343)
!366 = !DILocation(line: 330, column: 20, scope: !343)
!367 = !DILocation(line: 332, column: 23, scope: !343)
!368 = !DILocation(line: 332, column: 34, scope: !343)
!369 = !DILocation(line: 332, column: 37, scope: !343)
!370 = !DILocation(line: 332, column: 39, scope: !343)
!371 = !DILocation(line: 332, column: 22, scope: !343)
!372 = !DILocation(line: 333, column: 7, scope: !343)
!373 = !DILocation(line: 333, column: 18, scope: !343)
!374 = !DILocation(line: 333, column: 21, scope: !343)
!375 = !DILocation(line: 332, column: 4, scope: !343)
!376 = !DILocation(line: 332, column: 15, scope: !343)
!377 = !DILocation(line: 332, column: 18, scope: !343)
!378 = !DILocation(line: 332, column: 20, scope: !343)
!379 = !DILocation(line: 334, column: 3, scope: !343)
!380 = !DILocation(line: 335, column: 2, scope: !327)
!381 = !DILocation(line: 323, column: 47, scope: !322)
!382 = !DILocation(line: 323, column: 2, scope: !322)
!383 = distinct !{!383, !324, !384}
!384 = !DILocation(line: 335, column: 2, scope: !318)
!385 = !DILocation(line: 336, column: 1, scope: !309)
!386 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 338, type: !21, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!387 = !DILocalVariable(name: "mean", scope: !386, file: !3, line: 340, type: !56)
!388 = !DILocation(line: 340, column: 15, scope: !386)
!389 = !DILocalVariable(name: "stddev", scope: !386, file: !3, line: 340, type: !56)
!390 = !DILocation(line: 340, column: 21, scope: !386)
!391 = !DILocation(line: 341, column: 25, scope: !386)
!392 = !DILocation(line: 341, column: 27, scope: !386)
!393 = !DILocation(line: 341, column: 16, scope: !386)
!394 = !DILocation(line: 341, column: 18, scope: !386)
!395 = !DILocation(line: 341, column: 7, scope: !386)
!396 = !DILocation(line: 341, column: 9, scope: !386)
!397 = !DILocation(line: 342, column: 31, scope: !386)
!398 = !DILocation(line: 342, column: 33, scope: !386)
!399 = !DILocation(line: 342, column: 20, scope: !386)
!400 = !DILocation(line: 342, column: 22, scope: !386)
!401 = !DILocation(line: 342, column: 9, scope: !386)
!402 = !DILocation(line: 342, column: 11, scope: !386)
!403 = !DILocalVariable(name: "features", scope: !386, file: !3, line: 343, type: !69)
!404 = !DILocation(line: 343, column: 13, scope: !386)
!405 = !DILocalVariable(name: "i", scope: !386, file: !3, line: 345, type: !406)
!406 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!407 = !DILocation(line: 345, column: 6, scope: !386)
!408 = !DILocation(line: 346, column: 9, scope: !409)
!409 = distinct !DILexicalBlock(scope: !386, file: !3, line: 346, column: 2)
!410 = !DILocation(line: 346, column: 7, scope: !409)
!411 = !DILocation(line: 346, column: 14, scope: !412)
!412 = distinct !DILexicalBlock(scope: !409, file: !3, line: 346, column: 2)
!413 = !DILocation(line: 346, column: 16, scope: !412)
!414 = !DILocation(line: 346, column: 2, scope: !409)
!415 = !DILocation(line: 348, column: 13, scope: !416)
!416 = distinct !DILexicalBlock(scope: !412, file: !3, line: 346, column: 42)
!417 = !DILocation(line: 348, column: 24, scope: !416)
!418 = !DILocation(line: 348, column: 27, scope: !416)
!419 = !DILocation(line: 348, column: 8, scope: !416)
!420 = !DILocation(line: 348, column: 10, scope: !416)
!421 = !DILocation(line: 349, column: 13, scope: !416)
!422 = !DILocation(line: 349, column: 24, scope: !416)
!423 = !DILocation(line: 349, column: 27, scope: !416)
!424 = !DILocation(line: 349, column: 8, scope: !416)
!425 = !DILocation(line: 349, column: 10, scope: !416)
!426 = !DILocation(line: 350, column: 13, scope: !416)
!427 = !DILocation(line: 350, column: 24, scope: !416)
!428 = !DILocation(line: 350, column: 27, scope: !416)
!429 = !DILocation(line: 350, column: 8, scope: !416)
!430 = !DILocation(line: 350, column: 10, scope: !416)
!431 = !DILocation(line: 351, column: 2, scope: !416)
!432 = !DILocation(line: 346, column: 38, scope: !412)
!433 = !DILocation(line: 346, column: 2, scope: !412)
!434 = distinct !{!434, !414, !435}
!435 = !DILocation(line: 351, column: 2, scope: !409)
!436 = !DILocation(line: 352, column: 7, scope: !386)
!437 = !DILocation(line: 352, column: 9, scope: !386)
!438 = !DILocation(line: 353, column: 7, scope: !386)
!439 = !DILocation(line: 353, column: 9, scope: !386)
!440 = !DILocation(line: 354, column: 7, scope: !386)
!441 = !DILocation(line: 354, column: 9, scope: !386)
!442 = !DILocation(line: 356, column: 9, scope: !443)
!443 = distinct !DILexicalBlock(scope: !386, file: !3, line: 356, column: 2)
!444 = !DILocation(line: 356, column: 7, scope: !443)
!445 = !DILocation(line: 356, column: 14, scope: !446)
!446 = distinct !DILexicalBlock(scope: !443, file: !3, line: 356, column: 2)
!447 = !DILocation(line: 356, column: 16, scope: !446)
!448 = !DILocation(line: 356, column: 2, scope: !443)
!449 = !DILocation(line: 357, column: 15, scope: !450)
!450 = distinct !DILexicalBlock(scope: !446, file: !3, line: 356, column: 42)
!451 = !DILocation(line: 357, column: 26, scope: !450)
!452 = !DILocation(line: 357, column: 29, scope: !450)
!453 = !DILocation(line: 357, column: 38, scope: !450)
!454 = !DILocation(line: 357, column: 33, scope: !450)
!455 = !DILocation(line: 357, column: 31, scope: !450)
!456 = !DILocation(line: 357, column: 42, scope: !450)
!457 = !DILocation(line: 357, column: 53, scope: !450)
!458 = !DILocation(line: 357, column: 56, scope: !450)
!459 = !DILocation(line: 357, column: 65, scope: !450)
!460 = !DILocation(line: 357, column: 60, scope: !450)
!461 = !DILocation(line: 357, column: 58, scope: !450)
!462 = !DILocation(line: 358, column: 11, scope: !450)
!463 = !DILocation(line: 358, column: 6, scope: !450)
!464 = !DILocation(line: 358, column: 15, scope: !450)
!465 = !DILocation(line: 358, column: 26, scope: !450)
!466 = !DILocation(line: 358, column: 29, scope: !450)
!467 = !DILocation(line: 358, column: 13, scope: !450)
!468 = !DILocation(line: 357, column: 10, scope: !450)
!469 = !DILocation(line: 357, column: 12, scope: !450)
!470 = !DILocation(line: 359, column: 15, scope: !450)
!471 = !DILocation(line: 359, column: 26, scope: !450)
!472 = !DILocation(line: 359, column: 29, scope: !450)
!473 = !DILocation(line: 359, column: 38, scope: !450)
!474 = !DILocation(line: 359, column: 33, scope: !450)
!475 = !DILocation(line: 359, column: 31, scope: !450)
!476 = !DILocation(line: 359, column: 42, scope: !450)
!477 = !DILocation(line: 359, column: 53, scope: !450)
!478 = !DILocation(line: 359, column: 56, scope: !450)
!479 = !DILocation(line: 359, column: 65, scope: !450)
!480 = !DILocation(line: 359, column: 60, scope: !450)
!481 = !DILocation(line: 359, column: 58, scope: !450)
!482 = !DILocation(line: 360, column: 11, scope: !450)
!483 = !DILocation(line: 360, column: 6, scope: !450)
!484 = !DILocation(line: 360, column: 15, scope: !450)
!485 = !DILocation(line: 360, column: 26, scope: !450)
!486 = !DILocation(line: 360, column: 29, scope: !450)
!487 = !DILocation(line: 360, column: 13, scope: !450)
!488 = !DILocation(line: 359, column: 10, scope: !450)
!489 = !DILocation(line: 359, column: 12, scope: !450)
!490 = !DILocation(line: 361, column: 15, scope: !450)
!491 = !DILocation(line: 361, column: 26, scope: !450)
!492 = !DILocation(line: 361, column: 29, scope: !450)
!493 = !DILocation(line: 361, column: 38, scope: !450)
!494 = !DILocation(line: 361, column: 33, scope: !450)
!495 = !DILocation(line: 361, column: 31, scope: !450)
!496 = !DILocation(line: 361, column: 42, scope: !450)
!497 = !DILocation(line: 361, column: 53, scope: !450)
!498 = !DILocation(line: 361, column: 56, scope: !450)
!499 = !DILocation(line: 361, column: 65, scope: !450)
!500 = !DILocation(line: 361, column: 60, scope: !450)
!501 = !DILocation(line: 361, column: 58, scope: !450)
!502 = !DILocation(line: 362, column: 11, scope: !450)
!503 = !DILocation(line: 362, column: 6, scope: !450)
!504 = !DILocation(line: 362, column: 15, scope: !450)
!505 = !DILocation(line: 362, column: 26, scope: !450)
!506 = !DILocation(line: 362, column: 29, scope: !450)
!507 = !DILocation(line: 362, column: 13, scope: !450)
!508 = !DILocation(line: 361, column: 10, scope: !450)
!509 = !DILocation(line: 361, column: 12, scope: !450)
!510 = !DILocation(line: 363, column: 2, scope: !450)
!511 = !DILocation(line: 356, column: 38, scope: !446)
!512 = !DILocation(line: 356, column: 2, scope: !446)
!513 = distinct !{!513, !448, !514}
!514 = !DILocation(line: 363, column: 2, scope: !443)
!515 = !DILocation(line: 364, column: 9, scope: !386)
!516 = !DILocation(line: 364, column: 11, scope: !386)
!517 = !DILocation(line: 365, column: 9, scope: !386)
!518 = !DILocation(line: 365, column: 11, scope: !386)
!519 = !DILocation(line: 366, column: 9, scope: !386)
!520 = !DILocation(line: 366, column: 11, scope: !386)
!521 = !DILocalVariable(name: "meanmag", scope: !386, file: !3, line: 368, type: !6)
!522 = !DILocation(line: 368, column: 11, scope: !386)
!523 = !DILocation(line: 368, column: 26, scope: !386)
!524 = !DILocation(line: 368, column: 21, scope: !386)
!525 = !DILocation(line: 368, column: 33, scope: !386)
!526 = !DILocation(line: 368, column: 28, scope: !386)
!527 = !DILocation(line: 368, column: 27, scope: !386)
!528 = !DILocation(line: 368, column: 42, scope: !386)
!529 = !DILocation(line: 368, column: 37, scope: !386)
!530 = !DILocation(line: 368, column: 49, scope: !386)
!531 = !DILocation(line: 368, column: 44, scope: !386)
!532 = !DILocation(line: 368, column: 43, scope: !386)
!533 = !DILocation(line: 368, column: 35, scope: !386)
!534 = !DILocation(line: 368, column: 58, scope: !386)
!535 = !DILocation(line: 368, column: 53, scope: !386)
!536 = !DILocation(line: 368, column: 65, scope: !386)
!537 = !DILocation(line: 368, column: 60, scope: !386)
!538 = !DILocation(line: 368, column: 59, scope: !386)
!539 = !DILocation(line: 368, column: 51, scope: !386)
!540 = !DILocalVariable(name: "stddevmag", scope: !386, file: !3, line: 369, type: !6)
!541 = !DILocation(line: 369, column: 11, scope: !386)
!542 = !DILocation(line: 369, column: 30, scope: !386)
!543 = !DILocation(line: 369, column: 23, scope: !386)
!544 = !DILocation(line: 369, column: 39, scope: !386)
!545 = !DILocation(line: 369, column: 32, scope: !386)
!546 = !DILocation(line: 369, column: 31, scope: !386)
!547 = !DILocation(line: 369, column: 50, scope: !386)
!548 = !DILocation(line: 369, column: 43, scope: !386)
!549 = !DILocation(line: 369, column: 59, scope: !386)
!550 = !DILocation(line: 369, column: 52, scope: !386)
!551 = !DILocation(line: 369, column: 51, scope: !386)
!552 = !DILocation(line: 369, column: 41, scope: !386)
!553 = !DILocation(line: 369, column: 70, scope: !386)
!554 = !DILocation(line: 369, column: 63, scope: !386)
!555 = !DILocation(line: 369, column: 79, scope: !386)
!556 = !DILocation(line: 369, column: 72, scope: !386)
!557 = !DILocation(line: 369, column: 71, scope: !386)
!558 = !DILocation(line: 369, column: 61, scope: !386)
!559 = !DILocation(line: 370, column: 28, scope: !386)
!560 = !DILocation(line: 370, column: 23, scope: !386)
!561 = !DILocation(line: 370, column: 11, scope: !386)
!562 = !DILocation(line: 370, column: 21, scope: !386)
!563 = !DILocation(line: 371, column: 28, scope: !386)
!564 = !DILocation(line: 371, column: 23, scope: !386)
!565 = !DILocation(line: 371, column: 11, scope: !386)
!566 = !DILocation(line: 371, column: 21, scope: !386)
!567 = !DILocation(line: 373, column: 10, scope: !386)
!568 = !DILocation(line: 373, column: 2, scope: !386)
!569 = !DILocation(line: 376, column: 4, scope: !570)
!570 = distinct !DILexicalBlock(scope: !386, file: !3, line: 373, column: 20)
!571 = !DILocation(line: 376, column: 19, scope: !570)
!572 = !DILocation(line: 377, column: 4, scope: !570)
!573 = !DILocation(line: 379, column: 4, scope: !570)
!574 = !DILocation(line: 379, column: 19, scope: !570)
!575 = !DILocation(line: 380, column: 4, scope: !570)
!576 = !DILocation(line: 382, column: 4, scope: !570)
!577 = !DILocation(line: 384, column: 1, scope: !386)
!578 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 386, type: !21, scopeLine: 386, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!579 = !DILocalVariable(name: "move_less_error", scope: !578, file: !3, line: 387, type: !406)
!580 = !DILocation(line: 387, column: 6, scope: !578)
!581 = !DILocalVariable(name: "stat_less_error", scope: !578, file: !3, line: 388, type: !406)
!582 = !DILocation(line: 388, column: 6, scope: !578)
!583 = !DILocalVariable(name: "i", scope: !578, file: !3, line: 389, type: !406)
!584 = !DILocation(line: 389, column: 6, scope: !578)
!585 = !DILocalVariable(name: "class", scope: !578, file: !3, line: 390, type: !50)
!586 = !DILocation(line: 390, column: 10, scope: !578)
!587 = !DILocalVariable(name: "meanmag", scope: !578, file: !3, line: 391, type: !588)
!588 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!589 = !DILocation(line: 391, column: 11, scope: !578)
!590 = !DILocalVariable(name: "stddevmag", scope: !578, file: !3, line: 392, type: !588)
!591 = !DILocation(line: 392, column: 11, scope: !578)
!592 = !DILocation(line: 394, column: 12, scope: !578)
!593 = !DILocation(line: 394, column: 25, scope: !578)
!594 = !DILocation(line: 394, column: 10, scope: !578)
!595 = !DILocation(line: 395, column: 14, scope: !578)
!596 = !DILocation(line: 395, column: 27, scope: !578)
!597 = !DILocation(line: 395, column: 12, scope: !578)
!598 = !DILocation(line: 397, column: 9, scope: !599)
!599 = distinct !DILexicalBlock(scope: !578, file: !3, line: 397, column: 2)
!600 = !DILocation(line: 397, column: 7, scope: !599)
!601 = !DILocation(line: 397, column: 14, scope: !602)
!602 = distinct !DILexicalBlock(scope: !599, file: !3, line: 397, column: 2)
!603 = !DILocation(line: 397, column: 16, scope: !602)
!604 = !DILocation(line: 397, column: 2, scope: !599)
!605 = !DILocalVariable(name: "stat_mean_err", scope: !606, file: !3, line: 398, type: !588)
!606 = distinct !DILexicalBlock(scope: !602, file: !3, line: 397, column: 35)
!607 = !DILocation(line: 398, column: 12, scope: !606)
!608 = !DILocation(line: 398, column: 29, scope: !606)
!609 = !DILocation(line: 398, column: 50, scope: !606)
!610 = !DILocation(line: 398, column: 53, scope: !606)
!611 = !DILocation(line: 398, column: 63, scope: !606)
!612 = !DILocation(line: 398, column: 61, scope: !606)
!613 = !DILocation(line: 398, column: 28, scope: !606)
!614 = !DILocation(line: 399, column: 7, scope: !606)
!615 = !DILocation(line: 399, column: 28, scope: !606)
!616 = !DILocation(line: 399, column: 31, scope: !606)
!617 = !DILocation(line: 399, column: 41, scope: !606)
!618 = !DILocation(line: 399, column: 39, scope: !606)
!619 = !DILocation(line: 400, column: 7, scope: !606)
!620 = !DILocation(line: 400, column: 17, scope: !606)
!621 = !DILocation(line: 400, column: 38, scope: !606)
!622 = !DILocation(line: 400, column: 41, scope: !606)
!623 = !DILocation(line: 400, column: 15, scope: !606)
!624 = !DILocalVariable(name: "stat_sd_err", scope: !606, file: !3, line: 402, type: !588)
!625 = !DILocation(line: 402, column: 12, scope: !606)
!626 = !DILocation(line: 402, column: 27, scope: !606)
!627 = !DILocation(line: 402, column: 48, scope: !606)
!628 = !DILocation(line: 402, column: 51, scope: !606)
!629 = !DILocation(line: 402, column: 63, scope: !606)
!630 = !DILocation(line: 402, column: 61, scope: !606)
!631 = !DILocation(line: 402, column: 26, scope: !606)
!632 = !DILocation(line: 403, column: 7, scope: !606)
!633 = !DILocation(line: 403, column: 28, scope: !606)
!634 = !DILocation(line: 403, column: 31, scope: !606)
!635 = !DILocation(line: 403, column: 43, scope: !606)
!636 = !DILocation(line: 403, column: 41, scope: !606)
!637 = !DILocation(line: 404, column: 7, scope: !606)
!638 = !DILocation(line: 404, column: 19, scope: !606)
!639 = !DILocation(line: 404, column: 40, scope: !606)
!640 = !DILocation(line: 404, column: 43, scope: !606)
!641 = !DILocation(line: 404, column: 17, scope: !606)
!642 = !DILocalVariable(name: "move_mean_err", scope: !606, file: !3, line: 406, type: !588)
!643 = !DILocation(line: 406, column: 12, scope: !606)
!644 = !DILocation(line: 406, column: 29, scope: !606)
!645 = !DILocation(line: 406, column: 46, scope: !606)
!646 = !DILocation(line: 406, column: 49, scope: !606)
!647 = !DILocation(line: 406, column: 59, scope: !606)
!648 = !DILocation(line: 406, column: 57, scope: !606)
!649 = !DILocation(line: 406, column: 28, scope: !606)
!650 = !DILocation(line: 407, column: 7, scope: !606)
!651 = !DILocation(line: 407, column: 24, scope: !606)
!652 = !DILocation(line: 407, column: 27, scope: !606)
!653 = !DILocation(line: 407, column: 37, scope: !606)
!654 = !DILocation(line: 407, column: 35, scope: !606)
!655 = !DILocation(line: 408, column: 7, scope: !606)
!656 = !DILocation(line: 408, column: 17, scope: !606)
!657 = !DILocation(line: 408, column: 34, scope: !606)
!658 = !DILocation(line: 408, column: 37, scope: !606)
!659 = !DILocation(line: 408, column: 15, scope: !606)
!660 = !DILocalVariable(name: "move_sd_err", scope: !606, file: !3, line: 410, type: !588)
!661 = !DILocation(line: 410, column: 12, scope: !606)
!662 = !DILocation(line: 410, column: 27, scope: !606)
!663 = !DILocation(line: 410, column: 44, scope: !606)
!664 = !DILocation(line: 410, column: 47, scope: !606)
!665 = !DILocation(line: 410, column: 59, scope: !606)
!666 = !DILocation(line: 410, column: 57, scope: !606)
!667 = !DILocation(line: 410, column: 26, scope: !606)
!668 = !DILocation(line: 411, column: 7, scope: !606)
!669 = !DILocation(line: 411, column: 24, scope: !606)
!670 = !DILocation(line: 411, column: 27, scope: !606)
!671 = !DILocation(line: 411, column: 39, scope: !606)
!672 = !DILocation(line: 411, column: 37, scope: !606)
!673 = !DILocation(line: 412, column: 7, scope: !606)
!674 = !DILocation(line: 412, column: 19, scope: !606)
!675 = !DILocation(line: 412, column: 36, scope: !606)
!676 = !DILocation(line: 412, column: 39, scope: !606)
!677 = !DILocation(line: 412, column: 17, scope: !606)
!678 = !DILocation(line: 414, column: 7, scope: !679)
!679 = distinct !DILexicalBlock(scope: !606, file: !3, line: 414, column: 7)
!680 = !DILocation(line: 414, column: 23, scope: !679)
!681 = !DILocation(line: 414, column: 21, scope: !679)
!682 = !DILocation(line: 414, column: 7, scope: !606)
!683 = !DILocation(line: 415, column: 19, scope: !684)
!684 = distinct !DILexicalBlock(scope: !679, file: !3, line: 414, column: 38)
!685 = !DILocation(line: 416, column: 3, scope: !684)
!686 = !DILocation(line: 417, column: 19, scope: !687)
!687 = distinct !DILexicalBlock(scope: !679, file: !3, line: 416, column: 10)
!688 = !DILocation(line: 420, column: 7, scope: !689)
!689 = distinct !DILexicalBlock(scope: !606, file: !3, line: 420, column: 7)
!690 = !DILocation(line: 420, column: 21, scope: !689)
!691 = !DILocation(line: 420, column: 19, scope: !689)
!692 = !DILocation(line: 420, column: 7, scope: !606)
!693 = !DILocation(line: 421, column: 19, scope: !694)
!694 = distinct !DILexicalBlock(scope: !689, file: !3, line: 420, column: 34)
!695 = !DILocation(line: 422, column: 3, scope: !694)
!696 = !DILocation(line: 423, column: 19, scope: !697)
!697 = distinct !DILexicalBlock(scope: !689, file: !3, line: 422, column: 10)
!698 = !DILocation(line: 425, column: 2, scope: !606)
!699 = !DILocation(line: 397, column: 30, scope: !602)
!700 = !DILocation(line: 397, column: 2, scope: !602)
!701 = distinct !{!701, !604, !702}
!702 = !DILocation(line: 425, column: 2, scope: !599)
!703 = !DILocation(line: 427, column: 15, scope: !578)
!704 = !DILocation(line: 427, column: 33, scope: !578)
!705 = !DILocation(line: 427, column: 31, scope: !578)
!706 = !DILocation(line: 427, column: 14, scope: !578)
!707 = !DILocation(line: 427, column: 2, scope: !578)
!708 = !DILocation(line: 427, column: 12, scope: !578)
!709 = !DILocation(line: 429, column: 1, scope: !578)
!710 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 431, type: !21, scopeLine: 432, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!711 = !DILocalVariable(name: "movingCount", scope: !710, file: !3, line: 433, type: !6)
!712 = !DILocation(line: 433, column: 11, scope: !710)
!713 = !DILocalVariable(name: "stationaryCount", scope: !710, file: !3, line: 433, type: !6)
!714 = !DILocation(line: 433, column: 28, scope: !710)
!715 = !DILocation(line: 435, column: 4, scope: !710)
!716 = !DILocation(line: 435, column: 2, scope: !710)
!717 = !DILocation(line: 437, column: 10, scope: !710)
!718 = !DILocation(line: 437, column: 2, scope: !710)
!719 = !DILocation(line: 440, column: 6, scope: !720)
!720 = distinct !DILexicalBlock(scope: !710, file: !3, line: 437, column: 21)
!721 = !DILocation(line: 440, column: 4, scope: !720)
!722 = !DILocation(line: 441, column: 4, scope: !720)
!723 = !DILocation(line: 444, column: 6, scope: !720)
!724 = !DILocation(line: 444, column: 4, scope: !720)
!725 = !DILocation(line: 445, column: 4, scope: !720)
!726 = !DILocation(line: 448, column: 6, scope: !727)
!727 = distinct !DILexicalBlock(scope: !710, file: !3, line: 448, column: 6)
!728 = !DILocation(line: 448, column: 21, scope: !727)
!729 = !DILocation(line: 448, column: 6, scope: !710)
!730 = !DILocalVariable(name: "resultStationaryPct", scope: !731, file: !3, line: 450, type: !6)
!731 = distinct !DILexicalBlock(scope: !727, file: !3, line: 448, column: 44)
!732 = !DILocation(line: 450, column: 12, scope: !731)
!733 = !DILocation(line: 450, column: 34, scope: !731)
!734 = !DILocation(line: 450, column: 54, scope: !731)
!735 = !DILocation(line: 450, column: 62, scope: !731)
!736 = !DILocation(line: 450, column: 60, scope: !731)
!737 = !DILocalVariable(name: "resultMovingPct", scope: !731, file: !3, line: 451, type: !6)
!738 = !DILocation(line: 451, column: 12, scope: !731)
!739 = !DILocation(line: 451, column: 30, scope: !731)
!740 = !DILocation(line: 451, column: 46, scope: !731)
!741 = !DILocation(line: 451, column: 54, scope: !731)
!742 = !DILocation(line: 451, column: 52, scope: !731)
!743 = !DILocalVariable(name: "sum", scope: !731, file: !3, line: 453, type: !6)
!744 = !DILocation(line: 453, column: 12, scope: !731)
!745 = !DILocation(line: 453, column: 18, scope: !731)
!746 = !DILocation(line: 453, column: 40, scope: !731)
!747 = !DILocation(line: 453, column: 38, scope: !731)
!748 = !DILocation(line: 455, column: 2, scope: !731)
!749 = !DILocation(line: 456, column: 1, scope: !710)
!750 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 458, type: !21, scopeLine: 459, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!751 = !DILocalVariable(name: "sample", scope: !750, file: !3, line: 461, type: !57)
!752 = !DILocation(line: 461, column: 19, scope: !750)
!753 = !DILocation(line: 463, column: 45, scope: !750)
!754 = !DILocation(line: 463, column: 16, scope: !750)
!755 = !DILocation(line: 463, column: 5, scope: !750)
!756 = !DILocation(line: 463, column: 14, scope: !750)
!757 = !DILocation(line: 464, column: 7, scope: !750)
!758 = !DILocation(line: 464, column: 5, scope: !750)
!759 = !DILocation(line: 466, column: 9, scope: !760)
!760 = distinct !DILexicalBlock(scope: !750, file: !3, line: 466, column: 9)
!761 = !DILocation(line: 466, column: 35, scope: !760)
!762 = !DILocation(line: 466, column: 9, scope: !750)
!763 = !DILocation(line: 467, column: 9, scope: !764)
!764 = distinct !DILexicalBlock(scope: !760, file: !3, line: 466, column: 57)
!765 = !DILocation(line: 467, column: 29, scope: !764)
!766 = !DILocation(line: 468, column: 5, scope: !764)
!767 = !DILocation(line: 469, column: 1, scope: !750)
!768 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 471, type: !21, scopeLine: 472, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!769 = !DILocalVariable(name: "trainingSetSize", scope: !768, file: !3, line: 473, type: !6)
!770 = !DILocation(line: 473, column: 11, scope: !768)
!771 = !DILocalVariable(name: "class", scope: !768, file: !3, line: 474, type: !6)
!772 = !DILocation(line: 474, column: 11, scope: !768)
!773 = !DILocation(line: 476, column: 10, scope: !768)
!774 = !DILocation(line: 476, column: 2, scope: !768)
!775 = !DILocation(line: 478, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !768, file: !3, line: 476, column: 21)
!777 = !DILocation(line: 478, column: 25, scope: !776)
!778 = !DILocation(line: 478, column: 48, scope: !776)
!779 = !DILocation(line: 479, column: 4, scope: !776)
!780 = !DILocation(line: 481, column: 4, scope: !776)
!781 = !DILocation(line: 481, column: 21, scope: !776)
!782 = !DILocation(line: 481, column: 44, scope: !776)
!783 = !DILocation(line: 482, column: 4, scope: !776)
!784 = !DILocation(line: 485, column: 4, scope: !768)
!785 = !DILocation(line: 485, column: 2, scope: !768)
!786 = !DILocation(line: 487, column: 1, scope: !768)
!787 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 489, type: !21, scopeLine: 489, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!788 = !DILocation(line: 491, column: 2, scope: !787)
!789 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 494, type: !21, scopeLine: 494, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!790 = !DILocation(line: 496, column: 1, scope: !789)
!791 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 498, type: !792, scopeLine: 498, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!792 = !DISubroutineType(types: !793)
!793 = !{!406}
!794 = !DILocation(line: 500, column: 16, scope: !791)
!795 = !DILocation(line: 501, column: 10, scope: !791)
!796 = !DILocation(line: 502, column: 12, scope: !791)
!797 = !DILocation(line: 503, column: 2, scope: !791)
!798 = !DILocation(line: 505, column: 2, scope: !791)
!799 = !DILocation(line: 507, column: 2, scope: !791)
!800 = !DILocation(line: 509, column: 3, scope: !801)
!801 = distinct !DILexicalBlock(scope: !791, file: !3, line: 507, column: 12)
!802 = !DILocation(line: 511, column: 7, scope: !803)
!803 = distinct !DILexicalBlock(scope: !801, file: !3, line: 511, column: 7)
!804 = !DILocation(line: 511, column: 17, scope: !803)
!805 = !DILocation(line: 511, column: 42, scope: !803)
!806 = !DILocation(line: 511, column: 45, scope: !803)
!807 = !DILocation(line: 511, column: 55, scope: !803)
!808 = !DILocation(line: 511, column: 7, scope: !801)
!809 = !DILocation(line: 514, column: 13, scope: !810)
!810 = distinct !DILexicalBlock(scope: !803, file: !3, line: 511, column: 76)
!811 = !DILocation(line: 514, column: 20, scope: !810)
!812 = !DILocation(line: 514, column: 47, scope: !810)
!813 = !DILocation(line: 516, column: 5, scope: !814)
!814 = distinct !DILexicalBlock(scope: !810, file: !3, line: 514, column: 69)
!815 = distinct !{!815, !809, !816}
!816 = !DILocation(line: 518, column: 13, scope: !810)
!817 = !DILocation(line: 520, column: 3, scope: !810)
!818 = !DILocation(line: 520, column: 14, scope: !819)
!819 = distinct !DILexicalBlock(scope: !803, file: !3, line: 520, column: 14)
!820 = !DILocation(line: 520, column: 24, scope: !819)
!821 = !DILocation(line: 520, column: 14, scope: !803)
!822 = !DILocation(line: 522, column: 4, scope: !823)
!823 = distinct !DILexicalBlock(scope: !819, file: !3, line: 520, column: 44)
!824 = !DILocation(line: 524, column: 3, scope: !823)
!825 = !DILocation(line: 524, column: 14, scope: !826)
!826 = distinct !DILexicalBlock(scope: !819, file: !3, line: 524, column: 14)
!827 = !DILocation(line: 524, column: 24, scope: !826)
!828 = !DILocation(line: 524, column: 14, scope: !819)
!829 = !DILocation(line: 526, column: 4, scope: !830)
!830 = distinct !DILexicalBlock(scope: !826, file: !3, line: 524, column: 38)
!831 = distinct !{!831, !799, !832}
!832 = !DILocation(line: 562, column: 2, scope: !791)
!833 = !DILocation(line: 529, column: 3, scope: !801)
!834 = !DILocation(line: 532, column: 13, scope: !835)
!835 = distinct !DILexicalBlock(scope: !801, file: !3, line: 529, column: 13)
!836 = !DILocation(line: 532, column: 20, scope: !835)
!837 = !DILocation(line: 532, column: 41, scope: !835)
!838 = !DILocation(line: 534, column: 5, scope: !839)
!839 = distinct !DILexicalBlock(scope: !835, file: !3, line: 532, column: 61)
!840 = distinct !{!840, !834, !841}
!841 = !DILocation(line: 536, column: 13, scope: !835)
!842 = !DILocation(line: 538, column: 4, scope: !835)
!843 = !DILocation(line: 540, column: 4, scope: !835)
!844 = !DILocation(line: 542, column: 8, scope: !845)
!845 = distinct !DILexicalBlock(scope: !835, file: !3, line: 542, column: 8)
!846 = !DILocation(line: 542, column: 18, scope: !845)
!847 = !DILocation(line: 542, column: 43, scope: !845)
!848 = !DILocation(line: 542, column: 46, scope: !845)
!849 = !DILocation(line: 542, column: 56, scope: !845)
!850 = !DILocation(line: 542, column: 8, scope: !835)
!851 = !DILocation(line: 544, column: 5, scope: !852)
!852 = distinct !DILexicalBlock(scope: !845, file: !3, line: 542, column: 77)
!853 = !DILocation(line: 546, column: 9, scope: !854)
!854 = distinct !DILexicalBlock(scope: !852, file: !3, line: 546, column: 9)
!855 = !DILocation(line: 546, column: 30, scope: !854)
!856 = !DILocation(line: 546, column: 9, scope: !852)
!857 = !DILocation(line: 547, column: 6, scope: !854)
!858 = !DILocation(line: 549, column: 4, scope: !852)
!859 = !DILocation(line: 549, column: 15, scope: !860)
!860 = distinct !DILexicalBlock(scope: !845, file: !3, line: 549, column: 15)
!861 = !DILocation(line: 549, column: 25, scope: !860)
!862 = !DILocation(line: 549, column: 15, scope: !845)
!863 = !DILocation(line: 551, column: 5, scope: !864)
!864 = distinct !DILexicalBlock(scope: !860, file: !3, line: 549, column: 45)
!865 = !DILocation(line: 553, column: 5, scope: !864)
!866 = !DILocation(line: 555, column: 9, scope: !867)
!867 = distinct !DILexicalBlock(scope: !864, file: !3, line: 555, column: 9)
!868 = !DILocation(line: 555, column: 25, scope: !867)
!869 = !DILocation(line: 555, column: 9, scope: !864)
!870 = !DILocation(line: 556, column: 6, scope: !867)
!871 = !DILocation(line: 558, column: 4, scope: !864)
!872 = distinct !{!872, !833, !873}
!873 = !DILocation(line: 559, column: 3, scope: !801)
