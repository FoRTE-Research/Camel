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
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !18
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !23
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !30
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
  call void @camel_init(), !dbg !135
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !136
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !137
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !136
  call void @__restore_registers(i16* %arraydecay), !dbg !138
  ret void, !dbg !139
}

declare dso_local void @__crt0_start(...) #1

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %result, i16 %seed) #0 !dbg !140 {
entry:
  %result.addr = alloca %struct.threeAxis_t_8*, align 2
  %seed.addr = alloca i16, align 2
  store %struct.threeAxis_t_8* %result, %struct.threeAxis_t_8** %result.addr, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %result.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i16 %seed, i16* %seed.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %seed.addr, metadata !146, metadata !DIExpression()), !dbg !147
  %0 = load i16, i16* %seed.addr, align 2, !dbg !148
  %mul = mul i16 %0, 17, !dbg !149
  %rem = urem i16 %mul, 85, !dbg !150
  %conv = trunc i16 %rem to i8, !dbg !151
  %1 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !152
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %1, i32 0, i32 0, !dbg !153
  store i8 %conv, i8* %x, align 1, !dbg !154
  %2 = load i16, i16* %seed.addr, align 2, !dbg !155
  %mul1 = mul i16 %2, 17, !dbg !156
  %mul2 = mul i16 %mul1, 17, !dbg !157
  %rem3 = urem i16 %mul2, 85, !dbg !158
  %conv4 = trunc i16 %rem3 to i8, !dbg !159
  %3 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !160
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %3, i32 0, i32 1, !dbg !161
  store i8 %conv4, i8* %y, align 1, !dbg !162
  %4 = load i16, i16* %seed.addr, align 2, !dbg !163
  %mul5 = mul i16 %4, 17, !dbg !164
  %mul6 = mul i16 %mul5, 17, !dbg !165
  %mul7 = mul i16 %mul6, 17, !dbg !166
  %rem8 = urem i16 %mul7, 85, !dbg !167
  %conv9 = trunc i16 %rem8 to i8, !dbg !168
  %5 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !169
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %5, i32 0, i32 2, !dbg !170
  store i8 %conv9, i8* %z, align 1, !dbg !171
  %6 = load i16, i16* %seed.addr, align 2, !dbg !172
  %inc = add i16 %6, 1, !dbg !172
  store i16 %inc, i16* %seed.addr, align 2, !dbg !172
  %7 = load i16, i16* %seed.addr, align 2, !dbg !173
  ret i16 %7, !dbg !174
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !175 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !176
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !176
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !176
  store i16 3, i16* %pinState, align 2, !dbg !177
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !178
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !178
  store i16 0, i16* %count, align 2, !dbg !179
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !180
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !180
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !180
  store i16 1, i16* %seed, align 2, !dbg !181
  ret void, !dbg !182
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_selectMode() #0 !dbg !183 {
entry:
  %pin_state = alloca i16, align 2
  %mode = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %pin_state, metadata !184, metadata !DIExpression()), !dbg !185
  store i16 1, i16* %pin_state, align 2, !dbg !185
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !186
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !186
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !186
  %1 = load i16, i16* %count, align 2, !dbg !187
  %inc = add i16 %1, 1, !dbg !187
  store i16 %inc, i16* %count, align 2, !dbg !187
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !188
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !188
  %count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !188
  %3 = load i16, i16* %count2, align 2, !dbg !188
  %cmp = icmp uge i16 %3, 3, !dbg !190
  br i1 %cmp, label %if.then, label %if.end, !dbg !191

if.then:                                          ; preds = %entry
  store i16 2, i16* %pin_state, align 2, !dbg !192
  br label %if.end, !dbg !193

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !194
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !194
  %count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !194
  %5 = load i16, i16* %count4, align 2, !dbg !194
  %cmp5 = icmp uge i16 %5, 5, !dbg !196
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !197

if.then6:                                         ; preds = %if.end
  store i16 0, i16* %pin_state, align 2, !dbg !198
  br label %if.end7, !dbg !199

if.end7:                                          ; preds = %if.then6, %if.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !200
  %count9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 14, !dbg !200
  %7 = load i16, i16* %count9, align 2, !dbg !200
  %cmp10 = icmp uge i16 %7, 7, !dbg !202
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !203

if.then11:                                        ; preds = %if.end7
  call void @task_done(), !dbg !204
  br label %if.end12, !dbg !206

if.end12:                                         ; preds = %if.then11, %if.end7
  call void @llvm.dbg.declare(metadata i16* %mode, metadata !207, metadata !DIExpression()), !dbg !208
  call void @llvm.dbg.declare(metadata i16* %class, metadata !209, metadata !DIExpression()), !dbg !210
  %8 = load i16, i16* %pin_state, align 2, !dbg !211
  %cmp13 = icmp eq i16 %8, 2, !dbg !213
  br i1 %cmp13, label %land.lhs.true, label %lor.lhs.false, !dbg !214

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i16, i16* %pin_state, align 2, !dbg !215
  %cmp14 = icmp eq i16 %9, 1, !dbg !216
  br i1 %cmp14, label %land.lhs.true, label %if.else, !dbg !217

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end12
  %10 = load i16, i16* %pin_state, align 2, !dbg !218
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !219
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !219
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !219
  %12 = load i16, i16* %pinState, align 2, !dbg !219
  %cmp16 = icmp eq i16 %10, %12, !dbg !220
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !221

if.then17:                                        ; preds = %land.lhs.true
  store i16 3, i16* %pin_state, align 2, !dbg !222
  br label %if.end20, !dbg !224

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %13 = load i16, i16* %pin_state, align 2, !dbg !225
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !227
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !227
  %pinState19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 0, !dbg !227
  store i16 %13, i16* %pinState19, align 2, !dbg !228
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  %15 = load i16, i16* %pin_state, align 2, !dbg !229
  switch i16 %15, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb27
    i16 0, label %sw.bb36
  ], !dbg !230

sw.bb:                                            ; preds = %if.end20
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !231
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !231
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 1, !dbg !231
  store i16 0, i16* %discardedSamplesCount, align 2, !dbg !233
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !234
  %mode23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 12, !dbg !234
  store i16 2, i16* %mode23, align 2, !dbg !235
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !236
  %class25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 2, !dbg !236
  store i16 0, i16* %class25, align 2, !dbg !237
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !238
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !238
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 11, !dbg !238
  store i16 0, i16* %samplesInWindow, align 2, !dbg !239
  br label %sw.epilog, !dbg !240

sw.bb27:                                          ; preds = %if.end20
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !241
  %discardedSamplesCount29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 1, !dbg !241
  store i16 0, i16* %discardedSamplesCount29, align 2, !dbg !242
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !243
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !243
  store i16 1, i16* %mode31, align 2, !dbg !244
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !245
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !245
  %class33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 2, !dbg !245
  store i16 1, i16* %class33, align 2, !dbg !246
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !247
  %samplesInWindow35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 11, !dbg !247
  store i16 0, i16* %samplesInWindow35, align 2, !dbg !248
  br label %sw.epilog, !dbg !249

sw.bb36:                                          ; preds = %if.end20
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !250
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !250
  %mode38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 12, !dbg !250
  store i16 0, i16* %mode38, align 2, !dbg !251
  br label %sw.epilog, !dbg !252

sw.default:                                       ; preds = %if.end20
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !253
  %mode40 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 12, !dbg !253
  store i16 3, i16* %mode40, align 2, !dbg !254
  br label %sw.epilog, !dbg !255

sw.epilog:                                        ; preds = %sw.default, %sw.bb36, %sw.bb27, %sw.bb
  ret void, !dbg !256
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_resetStats() #0 !dbg !257 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !258
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !258
  %movingCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !258
  store i16 0, i16* %movingCount, align 2, !dbg !259
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !260
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !260
  %stationaryCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !260
  store i16 0, i16* %stationaryCount, align 2, !dbg !261
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !262
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !262
  store i16 0, i16* %totalCount, align 2, !dbg !263
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !264
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !264
  store i16 0, i16* %samplesInWindow, align 2, !dbg !265
  ret void, !dbg !266
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !267 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !268, metadata !DIExpression()), !dbg !269
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !270
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !270
  %1 = load i16, i16* %seed, align 2, !dbg !270
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %1), !dbg !271
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !272
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !272
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !273
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !273
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 11, !dbg !273
  %4 = load i16, i16* %samplesInWindow, align 2, !dbg !273
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %4, !dbg !272
  %5 = bitcast %struct.threeAxis_t_8* %arrayidx to i8*, !dbg !274
  %6 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !274
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 1 %5, i8* align 1 %6, i16 3, i1 false), !dbg !274
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !275
  %samplesInWindow4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !275
  %8 = load i16, i16* %samplesInWindow4, align 2, !dbg !276
  %inc = add i16 %8, 1, !dbg !276
  store i16 %inc, i16* %samplesInWindow4, align 2, !dbg !276
  ret void, !dbg !277
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_transform() #0 !dbg !278 {
entry:
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  %i = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !279
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !279
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !279
  store i16 0, i16* %samplesInWindow, align 2, !dbg !280
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !281, metadata !DIExpression()), !dbg !283
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !284, metadata !DIExpression()), !dbg !285
  call void @llvm.dbg.declare(metadata i16* %i, metadata !286, metadata !DIExpression()), !dbg !288
  store i16 0, i16* %i, align 2, !dbg !288
  br label %for.cond, !dbg !289

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i16, i16* %i, align 2, !dbg !290
  %cmp = icmp ult i16 %1, 3, !dbg !292
  br i1 %cmp, label %for.body, label %for.end, !dbg !293

for.body:                                         ; preds = %for.cond
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !294
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !294
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !294
  %3 = load i16, i16* %i, align 2, !dbg !297
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %3, !dbg !294
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !298
  %4 = load i8, i8* %x, align 1, !dbg !298
  %conv = sext i8 %4 to i16, !dbg !294
  %cmp2 = icmp slt i16 %conv, 10, !dbg !299
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !300

lor.lhs.false:                                    ; preds = %for.body
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !301
  %window5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !301
  %6 = load i16, i16* %i, align 2, !dbg !302
  %arrayidx6 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window5, i16 0, i16 %6, !dbg !301
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx6, i32 0, i32 1, !dbg !303
  %7 = load i8, i8* %y, align 1, !dbg !303
  %conv7 = sext i8 %7 to i16, !dbg !301
  %cmp8 = icmp slt i16 %conv7, 10, !dbg !304
  br i1 %cmp8, label %if.then, label %lor.lhs.false10, !dbg !305

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !306
  %window12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6, !dbg !306
  %9 = load i16, i16* %i, align 2, !dbg !307
  %arrayidx13 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window12, i16 0, i16 %9, !dbg !306
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx13, i32 0, i32 2, !dbg !308
  %10 = load i8, i8* %z, align 1, !dbg !308
  %conv14 = sext i8 %10 to i16, !dbg !306
  %cmp15 = icmp slt i16 %conv14, 10, !dbg !309
  br i1 %cmp15, label %if.then, label %if.end, !dbg !310

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false, %for.body
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !311
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !311
  %12 = load i16, i16* %i, align 2, !dbg !313
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %12, !dbg !311
  %x20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 0, !dbg !314
  %13 = load i8, i8* %x20, align 1, !dbg !314
  %conv21 = sext i8 %13 to i16, !dbg !311
  %cmp22 = icmp sgt i16 %conv21, 10, !dbg !315
  br i1 %cmp22, label %cond.true, label %cond.false, !dbg !316

cond.true:                                        ; preds = %if.then
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !317
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !317
  %window25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 6, !dbg !317
  %15 = load i16, i16* %i, align 2, !dbg !318
  %arrayidx26 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window25, i16 0, i16 %15, !dbg !317
  %x27 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx26, i32 0, i32 0, !dbg !319
  %16 = load i8, i8* %x27, align 1, !dbg !319
  %conv28 = sext i8 %16 to i16, !dbg !317
  br label %cond.end, !dbg !316

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !316

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv28, %cond.true ], [ 0, %cond.false ], !dbg !316
  %conv29 = trunc i16 %cond to i8, !dbg !316
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !320
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !320
  %window31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 6, !dbg !320
  %18 = load i16, i16* %i, align 2, !dbg !321
  %arrayidx32 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window31, i16 0, i16 %18, !dbg !320
  %x33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx32, i32 0, i32 0, !dbg !322
  store i8 %conv29, i8* %x33, align 1, !dbg !323
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !324
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !324
  %window35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 6, !dbg !324
  %20 = load i16, i16* %i, align 2, !dbg !325
  %arrayidx36 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window35, i16 0, i16 %20, !dbg !324
  %y37 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx36, i32 0, i32 1, !dbg !326
  %21 = load i8, i8* %y37, align 1, !dbg !326
  %conv38 = sext i8 %21 to i16, !dbg !324
  %cmp39 = icmp sgt i16 %conv38, 10, !dbg !327
  br i1 %cmp39, label %cond.true41, label %cond.false47, !dbg !328

cond.true41:                                      ; preds = %cond.end
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !329
  %window43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 6, !dbg !329
  %23 = load i16, i16* %i, align 2, !dbg !330
  %arrayidx44 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window43, i16 0, i16 %23, !dbg !329
  %y45 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx44, i32 0, i32 1, !dbg !331
  %24 = load i8, i8* %y45, align 1, !dbg !331
  %conv46 = sext i8 %24 to i16, !dbg !329
  br label %cond.end48, !dbg !328

cond.false47:                                     ; preds = %cond.end
  br label %cond.end48, !dbg !328

cond.end48:                                       ; preds = %cond.false47, %cond.true41
  %cond49 = phi i16 [ %conv46, %cond.true41 ], [ 0, %cond.false47 ], !dbg !328
  %conv50 = trunc i16 %cond49 to i8, !dbg !328
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1, !dbg !332
  %window52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 6, !dbg !332
  %26 = load i16, i16* %i, align 2, !dbg !333
  %arrayidx53 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window52, i16 0, i16 %26, !dbg !332
  %y54 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx53, i32 0, i32 1, !dbg !334
  store i8 %conv50, i8* %y54, align 1, !dbg !335
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals55 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !336
  %window56 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals55, i32 0, i32 6, !dbg !336
  %28 = load i16, i16* %i, align 2, !dbg !337
  %arrayidx57 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window56, i16 0, i16 %28, !dbg !336
  %z58 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx57, i32 0, i32 2, !dbg !338
  %29 = load i8, i8* %z58, align 1, !dbg !338
  %conv59 = sext i8 %29 to i16, !dbg !336
  %cmp60 = icmp sgt i16 %conv59, 10, !dbg !339
  br i1 %cmp60, label %cond.true62, label %cond.false68, !dbg !340

cond.true62:                                      ; preds = %cond.end48
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 1, !dbg !341
  %window64 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 6, !dbg !341
  %31 = load i16, i16* %i, align 2, !dbg !342
  %arrayidx65 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window64, i16 0, i16 %31, !dbg !341
  %z66 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx65, i32 0, i32 2, !dbg !343
  %32 = load i8, i8* %z66, align 1, !dbg !343
  %conv67 = sext i8 %32 to i16, !dbg !341
  br label %cond.end69, !dbg !340

cond.false68:                                     ; preds = %cond.end48
  br label %cond.end69, !dbg !340

cond.end69:                                       ; preds = %cond.false68, %cond.true62
  %cond70 = phi i16 [ %conv67, %cond.true62 ], [ 0, %cond.false68 ], !dbg !340
  %conv71 = trunc i16 %cond70 to i8, !dbg !340
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !344
  %globals72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !344
  %window73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals72, i32 0, i32 6, !dbg !344
  %34 = load i16, i16* %i, align 2, !dbg !345
  %arrayidx74 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window73, i16 0, i16 %34, !dbg !344
  %z75 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx74, i32 0, i32 2, !dbg !346
  store i8 %conv71, i8* %z75, align 1, !dbg !347
  br label %if.end, !dbg !348

if.end:                                           ; preds = %cond.end69, %lor.lhs.false10
  br label %for.inc, !dbg !349

for.inc:                                          ; preds = %if.end
  %35 = load i16, i16* %i, align 2, !dbg !350
  %inc = add i16 %35, 1, !dbg !350
  store i16 %inc, i16* %i, align 2, !dbg !350
  br label %for.cond, !dbg !351, !llvm.loop !352

for.end:                                          ; preds = %for.cond
  ret void, !dbg !354
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_featurize() #0 !dbg !355 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !356, metadata !DIExpression()), !dbg !357
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !358, metadata !DIExpression()), !dbg !359
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !360
  store i8 0, i8* %z, align 1, !dbg !361
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !362
  store i8 0, i8* %y, align 1, !dbg !363
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !364
  store i8 0, i8* %x, align 1, !dbg !365
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !366
  store i8 0, i8* %z1, align 1, !dbg !367
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !368
  store i8 0, i8* %y2, align 1, !dbg !369
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !370
  store i8 0, i8* %x3, align 1, !dbg !371
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !372, metadata !DIExpression()), !dbg !373
  call void @llvm.dbg.declare(metadata i16* %i, metadata !374, metadata !DIExpression()), !dbg !376
  store i16 0, i16* %i, align 2, !dbg !377
  br label %for.cond, !dbg !379

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !380
  %cmp = icmp slt i16 %0, 3, !dbg !382
  br i1 %cmp, label %for.body, label %for.end, !dbg !383

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !384
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !384
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !384
  %2 = load i16, i16* %i, align 2, !dbg !386
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !384
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !387
  %3 = load i8, i8* %x4, align 1, !dbg !387
  %conv = sext i8 %3 to i16, !dbg !384
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !388
  %4 = load i8, i8* %x5, align 1, !dbg !389
  %conv6 = sext i8 %4 to i16, !dbg !389
  %add = add nsw i16 %conv6, %conv, !dbg !389
  %conv7 = trunc i16 %add to i8, !dbg !389
  store i8 %conv7, i8* %x5, align 1, !dbg !389
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !390
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !390
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !390
  %6 = load i16, i16* %i, align 2, !dbg !391
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %6, !dbg !390
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !392
  %7 = load i8, i8* %y11, align 1, !dbg !392
  %conv12 = sext i8 %7 to i16, !dbg !390
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !393
  %8 = load i8, i8* %y13, align 1, !dbg !394
  %conv14 = sext i8 %8 to i16, !dbg !394
  %add15 = add nsw i16 %conv14, %conv12, !dbg !394
  %conv16 = trunc i16 %add15 to i8, !dbg !394
  store i8 %conv16, i8* %y13, align 1, !dbg !394
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !395
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !395
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !395
  %10 = load i16, i16* %i, align 2, !dbg !396
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %10, !dbg !395
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !397
  %11 = load i8, i8* %z20, align 1, !dbg !397
  %conv21 = sext i8 %11 to i16, !dbg !395
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !398
  %12 = load i8, i8* %z22, align 1, !dbg !399
  %conv23 = sext i8 %12 to i16, !dbg !399
  %add24 = add nsw i16 %conv23, %conv21, !dbg !399
  %conv25 = trunc i16 %add24 to i8, !dbg !399
  store i8 %conv25, i8* %z22, align 1, !dbg !399
  br label %for.inc, !dbg !400

for.inc:                                          ; preds = %for.body
  %13 = load i16, i16* %i, align 2, !dbg !401
  %inc = add nsw i16 %13, 1, !dbg !401
  store i16 %inc, i16* %i, align 2, !dbg !401
  br label %for.cond, !dbg !402, !llvm.loop !403

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !405
  %14 = load i8, i8* %x26, align 1, !dbg !406
  %conv27 = sext i8 %14 to i16, !dbg !406
  %shr = ashr i16 %conv27, 2, !dbg !406
  %conv28 = trunc i16 %shr to i8, !dbg !406
  store i8 %conv28, i8* %x26, align 1, !dbg !406
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !407
  %15 = load i8, i8* %y29, align 1, !dbg !408
  %conv30 = sext i8 %15 to i16, !dbg !408
  %shr31 = ashr i16 %conv30, 2, !dbg !408
  %conv32 = trunc i16 %shr31 to i8, !dbg !408
  store i8 %conv32, i8* %y29, align 1, !dbg !408
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !409
  %16 = load i8, i8* %z33, align 1, !dbg !410
  %conv34 = sext i8 %16 to i16, !dbg !410
  %shr35 = ashr i16 %conv34, 2, !dbg !410
  %conv36 = trunc i16 %shr35 to i8, !dbg !410
  store i8 %conv36, i8* %z33, align 1, !dbg !410
  store i16 0, i16* %i, align 2, !dbg !411
  br label %for.cond37, !dbg !413

for.cond37:                                       ; preds = %for.inc135, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !414
  %cmp38 = icmp slt i16 %17, 3, !dbg !416
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !417

for.body40:                                       ; preds = %for.cond37
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !418
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !418
  %19 = load i16, i16* %i, align 2, !dbg !420
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %19, !dbg !418
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !421
  %20 = load i8, i8* %x44, align 1, !dbg !421
  %conv45 = sext i8 %20 to i16, !dbg !418
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !422
  %21 = load i8, i8* %x46, align 1, !dbg !422
  %conv47 = sext i8 %21 to i16, !dbg !423
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !424
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !418

cond.true:                                        ; preds = %for.body40
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !425
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !425
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !425
  %23 = load i16, i16* %i, align 2, !dbg !426
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %23, !dbg !425
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !427
  %24 = load i8, i8* %x53, align 1, !dbg !427
  %conv54 = sext i8 %24 to i16, !dbg !425
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !428
  %25 = load i8, i8* %x55, align 1, !dbg !428
  %conv56 = sext i8 %25 to i16, !dbg !429
  %sub = sub nsw i16 %conv54, %conv56, !dbg !430
  br label %cond.end, !dbg !418

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !431
  %26 = load i8, i8* %x57, align 1, !dbg !431
  %conv58 = sext i8 %26 to i16, !dbg !432
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !433
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !433
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !433
  %28 = load i16, i16* %i, align 2, !dbg !434
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %28, !dbg !433
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !435
  %29 = load i8, i8* %x62, align 1, !dbg !435
  %conv63 = sext i8 %29 to i16, !dbg !433
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !436
  br label %cond.end, !dbg !418

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !418
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !437
  %30 = load i8, i8* %x65, align 1, !dbg !438
  %conv66 = sext i8 %30 to i16, !dbg !438
  %add67 = add nsw i16 %conv66, %cond, !dbg !438
  %conv68 = trunc i16 %add67 to i8, !dbg !438
  store i8 %conv68, i8* %x65, align 1, !dbg !438
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !439
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !439
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !439
  %32 = load i16, i16* %i, align 2, !dbg !440
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %32, !dbg !439
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !441
  %33 = load i8, i8* %y72, align 1, !dbg !441
  %conv73 = sext i8 %33 to i16, !dbg !439
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !442
  %34 = load i8, i8* %y74, align 1, !dbg !442
  %conv75 = sext i8 %34 to i16, !dbg !443
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !444
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !439

cond.true78:                                      ; preds = %cond.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !445
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !445
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !445
  %36 = load i16, i16* %i, align 2, !dbg !446
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %36, !dbg !445
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !447
  %37 = load i8, i8* %y82, align 1, !dbg !447
  %conv83 = sext i8 %37 to i16, !dbg !445
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !448
  %38 = load i8, i8* %y84, align 1, !dbg !448
  %conv85 = sext i8 %38 to i16, !dbg !449
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !450
  br label %cond.end96, !dbg !439

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !451
  %39 = load i8, i8* %y88, align 1, !dbg !451
  %conv89 = sext i8 %39 to i16, !dbg !452
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !453
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !453
  %41 = load i16, i16* %i, align 2, !dbg !454
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %41, !dbg !453
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !455
  %42 = load i8, i8* %y93, align 1, !dbg !455
  %conv94 = sext i8 %42 to i16, !dbg !453
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !456
  br label %cond.end96, !dbg !439

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !439
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !457
  %43 = load i8, i8* %y98, align 1, !dbg !458
  %conv99 = sext i8 %43 to i16, !dbg !458
  %add100 = add nsw i16 %conv99, %cond97, !dbg !458
  %conv101 = trunc i16 %add100 to i8, !dbg !458
  store i8 %conv101, i8* %y98, align 1, !dbg !458
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !459
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !459
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !459
  %45 = load i16, i16* %i, align 2, !dbg !460
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %45, !dbg !459
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !461
  %46 = load i8, i8* %z105, align 1, !dbg !461
  %conv106 = sext i8 %46 to i16, !dbg !459
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !462
  %47 = load i8, i8* %z107, align 1, !dbg !462
  %conv108 = sext i8 %47 to i16, !dbg !463
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !464
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !459

cond.true111:                                     ; preds = %cond.end96
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !465
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !465
  %49 = load i16, i16* %i, align 2, !dbg !466
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %49, !dbg !465
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !467
  %50 = load i8, i8* %z115, align 1, !dbg !467
  %conv116 = sext i8 %50 to i16, !dbg !465
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !468
  %51 = load i8, i8* %z117, align 1, !dbg !468
  %conv118 = sext i8 %51 to i16, !dbg !469
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !470
  br label %cond.end129, !dbg !459

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !471
  %52 = load i8, i8* %z121, align 1, !dbg !471
  %conv122 = sext i8 %52 to i16, !dbg !472
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1, !dbg !473
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !473
  %54 = load i16, i16* %i, align 2, !dbg !474
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %54, !dbg !473
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !475
  %55 = load i8, i8* %z126, align 1, !dbg !475
  %conv127 = sext i8 %55 to i16, !dbg !473
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !476
  br label %cond.end129, !dbg !459

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !459
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !477
  %56 = load i8, i8* %z131, align 1, !dbg !478
  %conv132 = sext i8 %56 to i16, !dbg !478
  %add133 = add nsw i16 %conv132, %cond130, !dbg !478
  %conv134 = trunc i16 %add133 to i8, !dbg !478
  store i8 %conv134, i8* %z131, align 1, !dbg !478
  br label %for.inc135, !dbg !479

for.inc135:                                       ; preds = %cond.end129
  %57 = load i16, i16* %i, align 2, !dbg !480
  %inc136 = add nsw i16 %57, 1, !dbg !480
  store i16 %inc136, i16* %i, align 2, !dbg !480
  br label %for.cond37, !dbg !481, !llvm.loop !482

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !484
  %58 = load i8, i8* %x138, align 1, !dbg !485
  %conv139 = sext i8 %58 to i16, !dbg !485
  %shr140 = ashr i16 %conv139, 2, !dbg !485
  %conv141 = trunc i16 %shr140 to i8, !dbg !485
  store i8 %conv141, i8* %x138, align 1, !dbg !485
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !486
  %59 = load i8, i8* %y142, align 1, !dbg !487
  %conv143 = sext i8 %59 to i16, !dbg !487
  %shr144 = ashr i16 %conv143, 2, !dbg !487
  %conv145 = trunc i16 %shr144 to i8, !dbg !487
  store i8 %conv145, i8* %y142, align 1, !dbg !487
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !488
  %60 = load i8, i8* %z146, align 1, !dbg !489
  %conv147 = sext i8 %60 to i16, !dbg !489
  %shr148 = ashr i16 %conv147, 2, !dbg !489
  %conv149 = trunc i16 %shr148 to i8, !dbg !489
  store i8 %conv149, i8* %z146, align 1, !dbg !489
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !490, metadata !DIExpression()), !dbg !491
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !492
  %61 = load i8, i8* %x150, align 1, !dbg !492
  %conv151 = sext i8 %61 to i16, !dbg !493
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !494
  %62 = load i8, i8* %x152, align 1, !dbg !494
  %conv153 = sext i8 %62 to i16, !dbg !495
  %mul = mul nsw i16 %conv151, %conv153, !dbg !496
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !497
  %63 = load i8, i8* %y154, align 1, !dbg !497
  %conv155 = sext i8 %63 to i16, !dbg !498
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !499
  %64 = load i8, i8* %y156, align 1, !dbg !499
  %conv157 = sext i8 %64 to i16, !dbg !500
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !501
  %add159 = add nsw i16 %mul, %mul158, !dbg !502
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !503
  %65 = load i8, i8* %z160, align 1, !dbg !503
  %conv161 = sext i8 %65 to i16, !dbg !504
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !505
  %66 = load i8, i8* %z162, align 1, !dbg !505
  %conv163 = sext i8 %66 to i16, !dbg !506
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !507
  %add165 = add nsw i16 %add159, %mul164, !dbg !508
  store i16 %add165, i16* %meanmag, align 2, !dbg !491
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !509, metadata !DIExpression()), !dbg !510
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !511
  %67 = load i8, i8* %x166, align 1, !dbg !511
  %conv167 = sext i8 %67 to i16, !dbg !512
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !513
  %68 = load i8, i8* %x168, align 1, !dbg !513
  %conv169 = sext i8 %68 to i16, !dbg !514
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !515
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !516
  %69 = load i8, i8* %y171, align 1, !dbg !516
  %conv172 = sext i8 %69 to i16, !dbg !517
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !518
  %70 = load i8, i8* %y173, align 1, !dbg !518
  %conv174 = sext i8 %70 to i16, !dbg !519
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !520
  %add176 = add nsw i16 %mul170, %mul175, !dbg !521
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !522
  %71 = load i8, i8* %z177, align 1, !dbg !522
  %conv178 = sext i8 %71 to i16, !dbg !523
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !524
  %72 = load i8, i8* %z179, align 1, !dbg !524
  %conv180 = sext i8 %72 to i16, !dbg !525
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !526
  %add182 = add nsw i16 %add176, %mul181, !dbg !527
  store i16 %add182, i16* %stddevmag, align 2, !dbg !510
  %73 = load i16, i16* %meanmag, align 2, !dbg !528
  %conv183 = uitofp i16 %73 to double, !dbg !528
  %call = call double @sqrt(double %conv183) #6, !dbg !529
  %conv184 = fptoui double %call to i16, !dbg !529
  %meanmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !530
  store i16 %conv184, i16* %meanmag185, align 2, !dbg !531
  %74 = load i16, i16* %stddevmag, align 2, !dbg !532
  %conv186 = uitofp i16 %74 to double, !dbg !532
  %call187 = call double @sqrt(double %conv186) #6, !dbg !533
  %conv188 = fptoui double %call187 to i16, !dbg !533
  %stddevmag189 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !534
  store i16 %conv188, i16* %stddevmag189, align 2, !dbg !535
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !536
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1, !dbg !536
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals190, i32 0, i32 12, !dbg !536
  %76 = load i16, i16* %mode, align 2, !dbg !536
  switch i16 %76, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb193
  ], !dbg !537

sw.bb:                                            ; preds = %for.end137, %for.end137
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !538
  %globals191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 1, !dbg !538
  %features192 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals191, i32 0, i32 7, !dbg !538
  %78 = bitcast %struct.features_t* %features192 to i8*, !dbg !540
  %79 = bitcast %struct.features_t* %features to i8*, !dbg !540
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %78, i8* align 2 %79, i16 4, i1 false), !dbg !540
  br label %sw.epilog, !dbg !541

sw.bb193:                                         ; preds = %for.end137
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !542
  %globals194 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 1, !dbg !542
  %features195 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals194, i32 0, i32 7, !dbg !542
  %81 = bitcast %struct.features_t* %features195 to i8*, !dbg !543
  %82 = bitcast %struct.features_t* %features to i8*, !dbg !543
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %81, i8* align 2 %82, i16 4, i1 false), !dbg !543
  br label %sw.epilog, !dbg !544

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !545

sw.epilog:                                        ; preds = %sw.default, %sw.bb193, %sw.bb
  ret void, !dbg !546
}

; Function Attrs: nounwind
declare dso_local double @sqrt(double) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_classify() #0 !dbg !547 {
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
  call void @llvm.dbg.declare(metadata i16* %move_less_error, metadata !548, metadata !DIExpression()), !dbg !549
  store i16 0, i16* %move_less_error, align 2, !dbg !549
  call void @llvm.dbg.declare(metadata i16* %stat_less_error, metadata !550, metadata !DIExpression()), !dbg !551
  store i16 0, i16* %stat_less_error, align 2, !dbg !551
  call void @llvm.dbg.declare(metadata i16* %i, metadata !552, metadata !DIExpression()), !dbg !553
  call void @llvm.dbg.declare(metadata i16* %class, metadata !554, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.declare(metadata i32* %meanmag, metadata !556, metadata !DIExpression()), !dbg !558
  call void @llvm.dbg.declare(metadata i32* %stddevmag, metadata !559, metadata !DIExpression()), !dbg !560
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !561
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !561
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !561
  %meanmag1 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !562
  %1 = load i16, i16* %meanmag1, align 2, !dbg !562
  %conv = zext i16 %1 to i32, !dbg !561
  store i32 %conv, i32* %meanmag, align 2, !dbg !563
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !564
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !564
  %features3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !564
  %stddevmag4 = getelementptr inbounds %struct.features_t, %struct.features_t* %features3, i32 0, i32 1, !dbg !565
  %3 = load i16, i16* %stddevmag4, align 2, !dbg !565
  %conv5 = zext i16 %3 to i32, !dbg !564
  store i32 %conv5, i32* %stddevmag, align 2, !dbg !566
  store i16 0, i16* %i, align 2, !dbg !567
  br label %for.cond, !dbg !569

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !570
  %cmp = icmp slt i16 %4, 16, !dbg !572
  br i1 %cmp, label %for.body, label %for.end, !dbg !573

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %stat_mean_err, metadata !574, metadata !DIExpression()), !dbg !576
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !577
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !577
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !577
  %6 = load i16, i16* %i, align 2, !dbg !578
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %6, !dbg !577
  %meanmag8 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx, i32 0, i32 0, !dbg !579
  %7 = load i16, i16* %meanmag8, align 2, !dbg !579
  %conv9 = zext i16 %7 to i32, !dbg !577
  %8 = load i32, i32* %meanmag, align 2, !dbg !580
  %cmp10 = icmp sgt i32 %conv9, %8, !dbg !581
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !582

cond.true:                                        ; preds = %for.body
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !583
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !583
  %model_stationary13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 8, !dbg !583
  %10 = load i16, i16* %i, align 2, !dbg !584
  %arrayidx14 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary13, i16 0, i16 %10, !dbg !583
  %meanmag15 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx14, i32 0, i32 0, !dbg !585
  %11 = load i16, i16* %meanmag15, align 2, !dbg !585
  %conv16 = zext i16 %11 to i32, !dbg !583
  %12 = load i32, i32* %meanmag, align 2, !dbg !586
  %sub = sub nsw i32 %conv16, %12, !dbg !587
  br label %cond.end, !dbg !582

cond.false:                                       ; preds = %for.body
  %13 = load i32, i32* %meanmag, align 2, !dbg !588
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !589
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !589
  %model_stationary18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 8, !dbg !589
  %15 = load i16, i16* %i, align 2, !dbg !590
  %arrayidx19 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary18, i16 0, i16 %15, !dbg !589
  %meanmag20 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx19, i32 0, i32 0, !dbg !591
  %16 = load i16, i16* %meanmag20, align 2, !dbg !591
  %conv21 = zext i16 %16 to i32, !dbg !589
  %sub22 = sub nsw i32 %13, %conv21, !dbg !592
  br label %cond.end, !dbg !582

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub22, %cond.false ], !dbg !582
  store i32 %cond, i32* %stat_mean_err, align 2, !dbg !576
  call void @llvm.dbg.declare(metadata i32* %stat_sd_err, metadata !593, metadata !DIExpression()), !dbg !594
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !595
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !595
  %model_stationary24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 8, !dbg !595
  %18 = load i16, i16* %i, align 2, !dbg !596
  %arrayidx25 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary24, i16 0, i16 %18, !dbg !595
  %stddevmag26 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx25, i32 0, i32 1, !dbg !597
  %19 = load i16, i16* %stddevmag26, align 2, !dbg !597
  %conv27 = zext i16 %19 to i32, !dbg !595
  %20 = load i32, i32* %stddevmag, align 2, !dbg !598
  %cmp28 = icmp sgt i32 %conv27, %20, !dbg !599
  br i1 %cmp28, label %cond.true30, label %cond.false37, !dbg !600

cond.true30:                                      ; preds = %cond.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !601
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !601
  %model_stationary32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8, !dbg !601
  %22 = load i16, i16* %i, align 2, !dbg !602
  %arrayidx33 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary32, i16 0, i16 %22, !dbg !601
  %stddevmag34 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx33, i32 0, i32 1, !dbg !603
  %23 = load i16, i16* %stddevmag34, align 2, !dbg !603
  %conv35 = zext i16 %23 to i32, !dbg !601
  %24 = load i32, i32* %stddevmag, align 2, !dbg !604
  %sub36 = sub nsw i32 %conv35, %24, !dbg !605
  br label %cond.end44, !dbg !600

cond.false37:                                     ; preds = %cond.end
  %25 = load i32, i32* %stddevmag, align 2, !dbg !606
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !607
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !607
  %model_stationary39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8, !dbg !607
  %27 = load i16, i16* %i, align 2, !dbg !608
  %arrayidx40 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary39, i16 0, i16 %27, !dbg !607
  %stddevmag41 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx40, i32 0, i32 1, !dbg !609
  %28 = load i16, i16* %stddevmag41, align 2, !dbg !609
  %conv42 = zext i16 %28 to i32, !dbg !607
  %sub43 = sub nsw i32 %25, %conv42, !dbg !610
  br label %cond.end44, !dbg !600

cond.end44:                                       ; preds = %cond.false37, %cond.true30
  %cond45 = phi i32 [ %sub36, %cond.true30 ], [ %sub43, %cond.false37 ], !dbg !600
  store i32 %cond45, i32* %stat_sd_err, align 2, !dbg !594
  call void @llvm.dbg.declare(metadata i32* %move_mean_err, metadata !611, metadata !DIExpression()), !dbg !612
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !613
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !613
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 9, !dbg !613
  %30 = load i16, i16* %i, align 2, !dbg !614
  %arrayidx47 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %30, !dbg !613
  %meanmag48 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx47, i32 0, i32 0, !dbg !615
  %31 = load i16, i16* %meanmag48, align 2, !dbg !615
  %conv49 = zext i16 %31 to i32, !dbg !613
  %32 = load i32, i32* %meanmag, align 2, !dbg !616
  %cmp50 = icmp sgt i32 %conv49, %32, !dbg !617
  br i1 %cmp50, label %cond.true52, label %cond.false59, !dbg !618

cond.true52:                                      ; preds = %cond.end44
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !619
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !619
  %model_moving54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 9, !dbg !619
  %34 = load i16, i16* %i, align 2, !dbg !620
  %arrayidx55 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving54, i16 0, i16 %34, !dbg !619
  %meanmag56 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx55, i32 0, i32 0, !dbg !621
  %35 = load i16, i16* %meanmag56, align 2, !dbg !621
  %conv57 = zext i16 %35 to i32, !dbg !619
  %36 = load i32, i32* %meanmag, align 2, !dbg !622
  %sub58 = sub nsw i32 %conv57, %36, !dbg !623
  br label %cond.end66, !dbg !618

cond.false59:                                     ; preds = %cond.end44
  %37 = load i32, i32* %meanmag, align 2, !dbg !624
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !625
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !625
  %model_moving61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 9, !dbg !625
  %39 = load i16, i16* %i, align 2, !dbg !626
  %arrayidx62 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving61, i16 0, i16 %39, !dbg !625
  %meanmag63 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx62, i32 0, i32 0, !dbg !627
  %40 = load i16, i16* %meanmag63, align 2, !dbg !627
  %conv64 = zext i16 %40 to i32, !dbg !625
  %sub65 = sub nsw i32 %37, %conv64, !dbg !628
  br label %cond.end66, !dbg !618

cond.end66:                                       ; preds = %cond.false59, %cond.true52
  %cond67 = phi i32 [ %sub58, %cond.true52 ], [ %sub65, %cond.false59 ], !dbg !618
  store i32 %cond67, i32* %move_mean_err, align 2, !dbg !612
  call void @llvm.dbg.declare(metadata i32* %move_sd_err, metadata !629, metadata !DIExpression()), !dbg !630
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !631
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !631
  %model_moving69 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 9, !dbg !631
  %42 = load i16, i16* %i, align 2, !dbg !632
  %arrayidx70 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving69, i16 0, i16 %42, !dbg !631
  %stddevmag71 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx70, i32 0, i32 1, !dbg !633
  %43 = load i16, i16* %stddevmag71, align 2, !dbg !633
  %conv72 = zext i16 %43 to i32, !dbg !631
  %44 = load i32, i32* %stddevmag, align 2, !dbg !634
  %cmp73 = icmp sgt i32 %conv72, %44, !dbg !635
  br i1 %cmp73, label %cond.true75, label %cond.false82, !dbg !636

cond.true75:                                      ; preds = %cond.end66
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 1, !dbg !637
  %model_moving77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 9, !dbg !637
  %46 = load i16, i16* %i, align 2, !dbg !638
  %arrayidx78 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving77, i16 0, i16 %46, !dbg !637
  %stddevmag79 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx78, i32 0, i32 1, !dbg !639
  %47 = load i16, i16* %stddevmag79, align 2, !dbg !639
  %conv80 = zext i16 %47 to i32, !dbg !637
  %48 = load i32, i32* %stddevmag, align 2, !dbg !640
  %sub81 = sub nsw i32 %conv80, %48, !dbg !641
  br label %cond.end89, !dbg !636

cond.false82:                                     ; preds = %cond.end66
  %49 = load i32, i32* %stddevmag, align 2, !dbg !642
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !643
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !643
  %model_moving84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals83, i32 0, i32 9, !dbg !643
  %51 = load i16, i16* %i, align 2, !dbg !644
  %arrayidx85 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving84, i16 0, i16 %51, !dbg !643
  %stddevmag86 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx85, i32 0, i32 1, !dbg !645
  %52 = load i16, i16* %stddevmag86, align 2, !dbg !645
  %conv87 = zext i16 %52 to i32, !dbg !643
  %sub88 = sub nsw i32 %49, %conv87, !dbg !646
  br label %cond.end89, !dbg !636

cond.end89:                                       ; preds = %cond.false82, %cond.true75
  %cond90 = phi i32 [ %sub81, %cond.true75 ], [ %sub88, %cond.false82 ], !dbg !636
  store i32 %cond90, i32* %move_sd_err, align 2, !dbg !630
  %53 = load i32, i32* %move_mean_err, align 2, !dbg !647
  %54 = load i32, i32* %stat_mean_err, align 2, !dbg !649
  %cmp91 = icmp slt i32 %53, %54, !dbg !650
  br i1 %cmp91, label %if.then, label %if.else, !dbg !651

if.then:                                          ; preds = %cond.end89
  %55 = load i16, i16* %move_less_error, align 2, !dbg !652
  %inc = add nsw i16 %55, 1, !dbg !652
  store i16 %inc, i16* %move_less_error, align 2, !dbg !652
  br label %if.end, !dbg !654

if.else:                                          ; preds = %cond.end89
  %56 = load i16, i16* %stat_less_error, align 2, !dbg !655
  %inc93 = add nsw i16 %56, 1, !dbg !655
  store i16 %inc93, i16* %stat_less_error, align 2, !dbg !655
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %57 = load i32, i32* %move_sd_err, align 2, !dbg !657
  %58 = load i32, i32* %stat_sd_err, align 2, !dbg !659
  %cmp94 = icmp slt i32 %57, %58, !dbg !660
  br i1 %cmp94, label %if.then96, label %if.else98, !dbg !661

if.then96:                                        ; preds = %if.end
  %59 = load i16, i16* %move_less_error, align 2, !dbg !662
  %inc97 = add nsw i16 %59, 1, !dbg !662
  store i16 %inc97, i16* %move_less_error, align 2, !dbg !662
  br label %if.end100, !dbg !664

if.else98:                                        ; preds = %if.end
  %60 = load i16, i16* %stat_less_error, align 2, !dbg !665
  %inc99 = add nsw i16 %60, 1, !dbg !665
  store i16 %inc99, i16* %stat_less_error, align 2, !dbg !665
  br label %if.end100

if.end100:                                        ; preds = %if.else98, %if.then96
  br label %for.inc, !dbg !667

for.inc:                                          ; preds = %if.end100
  %61 = load i16, i16* %i, align 2, !dbg !668
  %inc101 = add nsw i16 %61, 1, !dbg !668
  store i16 %inc101, i16* %i, align 2, !dbg !668
  br label %for.cond, !dbg !669, !llvm.loop !670

for.end:                                          ; preds = %for.cond
  %62 = load i16, i16* %move_less_error, align 2, !dbg !672
  %63 = load i16, i16* %stat_less_error, align 2, !dbg !673
  %cmp102 = icmp sgt i16 %62, %63, !dbg !674
  %64 = zext i1 %cmp102 to i64, !dbg !675
  %cond104 = select i1 %cmp102, i16 1, i16 0, !dbg !675
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !676
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 1, !dbg !676
  %class106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals105, i32 0, i32 2, !dbg !676
  store i16 %cond104, i16* %class106, align 2, !dbg !677
  ret void, !dbg !678
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_stats() #0 !dbg !679 {
entry:
  %movingCount = alloca i16, align 2
  %stationaryCount = alloca i16, align 2
  %resultStationaryPct = alloca i16, align 2
  %resultMovingPct = alloca i16, align 2
  %sum = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %movingCount, metadata !680, metadata !DIExpression()), !dbg !681
  store i16 0, i16* %movingCount, align 2, !dbg !681
  call void @llvm.dbg.declare(metadata i16* %stationaryCount, metadata !682, metadata !DIExpression()), !dbg !683
  store i16 0, i16* %stationaryCount, align 2, !dbg !683
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !684
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !684
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !684
  %1 = load i16, i16* %totalCount, align 2, !dbg !685
  %inc = add i16 %1, 1, !dbg !685
  store i16 %inc, i16* %totalCount, align 2, !dbg !685
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !686
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !686
  %class = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !686
  %3 = load i16, i16* %class, align 2, !dbg !686
  switch i16 %3, label %sw.epilog [
    i16 1, label %sw.bb
    i16 0, label %sw.bb5
  ], !dbg !687

sw.bb:                                            ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !688
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !688
  %movingCount3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !688
  %5 = load i16, i16* %movingCount3, align 2, !dbg !690
  %inc4 = add i16 %5, 1, !dbg !690
  store i16 %inc4, i16* %movingCount3, align 2, !dbg !690
  br label %sw.epilog, !dbg !691

sw.bb5:                                           ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !692
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !692
  %stationaryCount7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !692
  %7 = load i16, i16* %stationaryCount7, align 2, !dbg !693
  %inc8 = add i16 %7, 1, !dbg !693
  store i16 %inc8, i16* %stationaryCount7, align 2, !dbg !693
  br label %sw.epilog, !dbg !694

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !695
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !695
  %totalCount10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !695
  %9 = load i16, i16* %totalCount10, align 2, !dbg !695
  %cmp = icmp eq i16 %9, 128, !dbg !697
  br i1 %cmp, label %if.then, label %if.end, !dbg !698

if.then:                                          ; preds = %sw.epilog
  call void @llvm.dbg.declare(metadata i16* %resultStationaryPct, metadata !699, metadata !DIExpression()), !dbg !701
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !702
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !702
  %stationaryCount12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 5, !dbg !702
  %11 = load i16, i16* %stationaryCount12, align 2, !dbg !702
  %mul = mul i16 %11, 100, !dbg !703
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !704
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !704
  %totalCount14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !704
  %13 = load i16, i16* %totalCount14, align 2, !dbg !704
  %div = udiv i16 %mul, %13, !dbg !705
  store i16 %div, i16* %resultStationaryPct, align 2, !dbg !701
  call void @llvm.dbg.declare(metadata i16* %resultMovingPct, metadata !706, metadata !DIExpression()), !dbg !707
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !708
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !708
  %movingCount16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 4, !dbg !708
  %15 = load i16, i16* %movingCount16, align 2, !dbg !708
  %mul17 = mul i16 %15, 100, !dbg !709
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !710
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !710
  %totalCount19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !710
  %17 = load i16, i16* %totalCount19, align 2, !dbg !710
  %div20 = udiv i16 %mul17, %17, !dbg !711
  store i16 %div20, i16* %resultMovingPct, align 2, !dbg !707
  call void @llvm.dbg.declare(metadata i16* %sum, metadata !712, metadata !DIExpression()), !dbg !713
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !714
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !714
  %stationaryCount22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 5, !dbg !714
  %19 = load i16, i16* %stationaryCount22, align 2, !dbg !714
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !715
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !715
  %movingCount24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 4, !dbg !715
  %21 = load i16, i16* %movingCount24, align 2, !dbg !715
  %add = add i16 %19, %21, !dbg !716
  store i16 %add, i16* %sum, align 2, !dbg !713
  br label %if.end, !dbg !717

if.end:                                           ; preds = %if.then, %sw.epilog
  ret void, !dbg !718
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_warmup() #0 !dbg !719 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !720, metadata !DIExpression()), !dbg !721
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !722
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !722
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 13, !dbg !722
  %1 = load i16, i16* %seed, align 2, !dbg !722
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %1), !dbg !723
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !724
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !724
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !724
  store i16 %call, i16* %seed2, align 2, !dbg !725
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !726
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !726
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 1, !dbg !726
  %4 = load i16, i16* %discardedSamplesCount, align 2, !dbg !727
  %inc = add i16 %4, 1, !dbg !727
  store i16 %inc, i16* %discardedSamplesCount, align 2, !dbg !727
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !728
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !728
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !728
  %6 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !728
  %cmp = icmp eq i16 %6, 3, !dbg !730
  br i1 %cmp, label %if.then, label %if.end, !dbg !731

if.then:                                          ; preds = %entry
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !732
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !732
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !732
  store i16 0, i16* %trainingSetSize, align 2, !dbg !734
  br label %if.end, !dbg !735

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !736
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_train() #0 !dbg !737 {
entry:
  %trainingSetSize = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %trainingSetSize, metadata !738, metadata !DIExpression()), !dbg !739
  call void @llvm.dbg.declare(metadata i16* %class, metadata !740, metadata !DIExpression()), !dbg !741
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !742
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !742
  %class1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !742
  %1 = load i16, i16* %class1, align 2, !dbg !742
  switch i16 %1, label %sw.epilog [
    i16 0, label %sw.bb
    i16 1, label %sw.bb6
  ], !dbg !743

sw.bb:                                            ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !744
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !744
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !744
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !746
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !746
  %trainingSetSize4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !746
  %4 = load i16, i16* %trainingSetSize4, align 2, !dbg !746
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %4, !dbg !744
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !747
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !747
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !747
  %6 = bitcast %struct.features_t* %arrayidx to i8*, !dbg !747
  %7 = bitcast %struct.features_t* %features to i8*, !dbg !747
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 4, i1 false), !dbg !747
  br label %sw.epilog, !dbg !748

sw.bb6:                                           ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !749
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !749
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !749
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !750
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !750
  %trainingSetSize9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 10, !dbg !750
  %10 = load i16, i16* %trainingSetSize9, align 2, !dbg !750
  %arrayidx10 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %10, !dbg !749
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !751
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !751
  %features12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7, !dbg !751
  %12 = bitcast %struct.features_t* %arrayidx10 to i8*, !dbg !751
  %13 = bitcast %struct.features_t* %features12 to i8*, !dbg !751
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 4, i1 false), !dbg !751
  br label %sw.epilog, !dbg !752

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !753
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !753
  %trainingSetSize14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !753
  %15 = load i16, i16* %trainingSetSize14, align 2, !dbg !754
  %inc = add i16 %15, 1, !dbg !754
  store i16 %inc, i16* %trainingSetSize14, align 2, !dbg !754
  ret void, !dbg !755
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !756 {
entry:
  call void @exit(i16 0) #7, !dbg !757
  unreachable, !dbg !757
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #5

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !758 {
entry:
  ret void, !dbg !759
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !760 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !763
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !764
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !765
  call void @camel_init(), !dbg !766
  call void @task_init(), !dbg !767
  br label %do.body, !dbg !767

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !768
  %cmp = icmp eq i16 %0, 1, !dbg !768
  br i1 %cmp, label %if.then, label %if.else, !dbg !771

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !772
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !772
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !772
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !772
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !772
  call void @__dump_registers(i16* %arraydecay), !dbg !772
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !772
  br label %if.end, !dbg !772

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !774
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !774
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !774
  %reg_file1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !774
  %arraydecay2 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file1, i16 0, i16 0, !dbg !774
  call void @__dump_registers(i16* %arraydecay2), !dbg !774
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !774
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !771

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !767
  br label %while.body, !dbg !776

while.body:                                       ; preds = %do.end, %if.then51, %while.end145
  call void @task_selectMode(), !dbg !777
  br label %do.body3, !dbg !777

do.body3:                                         ; preds = %while.body
  %3 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !779
  %cmp4 = icmp eq i16 %3, 1, !dbg !779
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !782

if.then5:                                         ; preds = %do.body3
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !783
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !783
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !783
  %reg_file6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !783
  %arraydecay7 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file6, i16 0, i16 0, !dbg !783
  call void @__dump_registers(i16* %arraydecay7), !dbg !783
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !783
  br label %if.end11, !dbg !783

if.else8:                                         ; preds = %do.body3
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !785
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !785
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !785
  %reg_file9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 0, !dbg !785
  %arraydecay10 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file9, i16 0, i16 0, !dbg !785
  call void @__dump_registers(i16* %arraydecay10), !dbg !785
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !785
  br label %if.end11

if.end11:                                         ; preds = %if.else8, %if.then5
  br label %do.end12, !dbg !782

do.end12:                                         ; preds = %if.end11
  call void @task_commit(), !dbg !777
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !787
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !787
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 12, !dbg !787
  %7 = load i16, i16* %mode, align 2, !dbg !787
  %cmp13 = icmp eq i16 %7, 2, !dbg !789
  br i1 %cmp13, label %if.then17, label %lor.lhs.false, !dbg !790

lor.lhs.false:                                    ; preds = %do.end12
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !791
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !791
  %mode15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 12, !dbg !791
  %9 = load i16, i16* %mode15, align 2, !dbg !791
  %cmp16 = icmp eq i16 %9, 1, !dbg !792
  br i1 %cmp16, label %if.then17, label %if.else32, !dbg !793

if.then17:                                        ; preds = %lor.lhs.false, %do.end12
  br label %while.cond18, !dbg !794

while.cond18:                                     ; preds = %do.end31, %if.then17
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !796
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !796
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 1, !dbg !796
  %11 = load i16, i16* %discardedSamplesCount, align 2, !dbg !796
  %cmp20 = icmp ult i16 %11, 3, !dbg !797
  br i1 %cmp20, label %while.body21, label %while.end, !dbg !794

while.body21:                                     ; preds = %while.cond18
  call void @task_warmup(), !dbg !798
  br label %do.body22, !dbg !798

do.body22:                                        ; preds = %while.body21
  %12 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !800
  %cmp23 = icmp eq i16 %12, 1, !dbg !800
  br i1 %cmp23, label %if.then24, label %if.else27, !dbg !803

if.then24:                                        ; preds = %do.body22
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !804
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !804
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !804
  %reg_file25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 0, !dbg !804
  %arraydecay26 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file25, i16 0, i16 0, !dbg !804
  call void @__dump_registers(i16* %arraydecay26), !dbg !804
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !804
  br label %if.end30, !dbg !804

if.else27:                                        ; preds = %do.body22
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !806
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !806
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !806
  %reg_file28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !806
  %arraydecay29 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file28, i16 0, i16 0, !dbg !806
  call void @__dump_registers(i16* %arraydecay29), !dbg !806
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !806
  br label %if.end30

if.end30:                                         ; preds = %if.else27, %if.then24
  br label %do.end31, !dbg !803

do.end31:                                         ; preds = %if.end30
  call void @task_commit(), !dbg !798
  br label %while.cond18, !dbg !794, !llvm.loop !808

while.end:                                        ; preds = %while.cond18
  br label %if.end54, !dbg !810

if.else32:                                        ; preds = %lor.lhs.false
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !811
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !811
  %mode34 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals33, i32 0, i32 12, !dbg !811
  %16 = load i16, i16* %mode34, align 2, !dbg !811
  %cmp35 = icmp eq i16 %16, 0, !dbg !813
  br i1 %cmp35, label %if.then36, label %if.else47, !dbg !814

if.then36:                                        ; preds = %if.else32
  call void @task_resetStats(), !dbg !815
  br label %do.body37, !dbg !815

do.body37:                                        ; preds = %if.then36
  %17 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !817
  %cmp38 = icmp eq i16 %17, 1, !dbg !817
  br i1 %cmp38, label %if.then39, label %if.else42, !dbg !820

if.then39:                                        ; preds = %do.body37
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !821
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !821
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !821
  %reg_file40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !821
  %arraydecay41 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file40, i16 0, i16 0, !dbg !821
  call void @__dump_registers(i16* %arraydecay41), !dbg !821
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !821
  br label %if.end45, !dbg !821

if.else42:                                        ; preds = %do.body37
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !823
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !823
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !823
  %reg_file43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 0, !dbg !823
  %arraydecay44 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file43, i16 0, i16 0, !dbg !823
  call void @__dump_registers(i16* %arraydecay44), !dbg !823
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !823
  br label %if.end45

if.end45:                                         ; preds = %if.else42, %if.then39
  br label %do.end46, !dbg !820

do.end46:                                         ; preds = %if.end45
  call void @task_commit(), !dbg !815
  br label %if.end53, !dbg !825

if.else47:                                        ; preds = %if.else32
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !826
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !826
  %mode49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 12, !dbg !826
  %21 = load i16, i16* %mode49, align 2, !dbg !826
  %cmp50 = icmp eq i16 %21, 3, !dbg !828
  br i1 %cmp50, label %if.then51, label %if.end52, !dbg !829

if.then51:                                        ; preds = %if.else47
  br label %while.body, !dbg !830, !llvm.loop !832

if.end52:                                         ; preds = %if.else47
  br label %if.end53

if.end53:                                         ; preds = %if.end52, %do.end46
  br label %if.end54

if.end54:                                         ; preds = %if.end53, %while.end
  br label %while.body56, !dbg !834

while.body56:                                     ; preds = %if.end54, %if.end144
  br label %while.cond57, !dbg !835

while.cond57:                                     ; preds = %do.end70, %while.body56
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !837
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !837
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 11, !dbg !837
  %23 = load i16, i16* %samplesInWindow, align 2, !dbg !837
  %cmp59 = icmp ult i16 %23, 3, !dbg !838
  br i1 %cmp59, label %while.body60, label %while.end71, !dbg !835

while.body60:                                     ; preds = %while.cond57
  call void @task_sample(), !dbg !839
  br label %do.body61, !dbg !839

do.body61:                                        ; preds = %while.body60
  %24 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !841
  %cmp62 = icmp eq i16 %24, 1, !dbg !841
  br i1 %cmp62, label %if.then63, label %if.else66, !dbg !844

if.then63:                                        ; preds = %do.body61
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !845
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !845
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !845
  %reg_file64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !845
  %arraydecay65 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file64, i16 0, i16 0, !dbg !845
  call void @__dump_registers(i16* %arraydecay65), !dbg !845
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !845
  br label %if.end69, !dbg !845

if.else66:                                        ; preds = %do.body61
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !847
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !847
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !847
  %reg_file67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 0, !dbg !847
  %arraydecay68 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file67, i16 0, i16 0, !dbg !847
  call void @__dump_registers(i16* %arraydecay68), !dbg !847
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !847
  br label %if.end69

if.end69:                                         ; preds = %if.else66, %if.then63
  br label %do.end70, !dbg !844

do.end70:                                         ; preds = %if.end69
  call void @task_commit(), !dbg !839
  br label %while.cond57, !dbg !835, !llvm.loop !849

while.end71:                                      ; preds = %while.cond57
  call void @task_transform(), !dbg !851
  br label %do.body72, !dbg !851

do.body72:                                        ; preds = %while.end71
  %27 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !852
  %cmp73 = icmp eq i16 %27, 1, !dbg !852
  br i1 %cmp73, label %if.then74, label %if.else77, !dbg !855

if.then74:                                        ; preds = %do.body72
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !856
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !856
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !856
  %reg_file75 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 0, !dbg !856
  %arraydecay76 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file75, i16 0, i16 0, !dbg !856
  call void @__dump_registers(i16* %arraydecay76), !dbg !856
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !856
  br label %if.end80, !dbg !856

if.else77:                                        ; preds = %do.body72
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !858
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !858
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !858
  %reg_file78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 0, !dbg !858
  %arraydecay79 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file78, i16 0, i16 0, !dbg !858
  call void @__dump_registers(i16* %arraydecay79), !dbg !858
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !858
  br label %if.end80

if.end80:                                         ; preds = %if.else77, %if.then74
  br label %do.end81, !dbg !855

do.end81:                                         ; preds = %if.end80
  call void @task_commit(), !dbg !851
  call void @task_featurize(), !dbg !860
  br label %do.body82, !dbg !860

do.body82:                                        ; preds = %do.end81
  %30 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !861
  %cmp83 = icmp eq i16 %30, 1, !dbg !861
  br i1 %cmp83, label %if.then84, label %if.else87, !dbg !864

if.then84:                                        ; preds = %do.body82
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !865
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !865
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !865
  %reg_file85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 0, !dbg !865
  %arraydecay86 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file85, i16 0, i16 0, !dbg !865
  call void @__dump_registers(i16* %arraydecay86), !dbg !865
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !865
  br label %if.end90, !dbg !865

if.else87:                                        ; preds = %do.body82
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !867
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !867
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !867
  %reg_file88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !867
  %arraydecay89 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file88, i16 0, i16 0, !dbg !867
  call void @__dump_registers(i16* %arraydecay89), !dbg !867
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !867
  br label %if.end90

if.end90:                                         ; preds = %if.else87, %if.then84
  br label %do.end91, !dbg !864

do.end91:                                         ; preds = %if.end90
  call void @task_commit(), !dbg !860
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !869
  %globals92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !869
  %mode93 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals92, i32 0, i32 12, !dbg !869
  %34 = load i16, i16* %mode93, align 2, !dbg !869
  %cmp94 = icmp eq i16 %34, 2, !dbg !871
  br i1 %cmp94, label %if.then99, label %lor.lhs.false95, !dbg !872

lor.lhs.false95:                                  ; preds = %do.end91
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !873
  %globals96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !873
  %mode97 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals96, i32 0, i32 12, !dbg !873
  %36 = load i16, i16* %mode97, align 2, !dbg !873
  %cmp98 = icmp eq i16 %36, 1, !dbg !874
  br i1 %cmp98, label %if.then99, label %if.else114, !dbg !875

if.then99:                                        ; preds = %lor.lhs.false95, %do.end91
  call void @task_train(), !dbg !876
  br label %do.body100, !dbg !876

do.body100:                                       ; preds = %if.then99
  %37 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !878
  %cmp101 = icmp eq i16 %37, 1, !dbg !878
  br i1 %cmp101, label %if.then102, label %if.else105, !dbg !881

if.then102:                                       ; preds = %do.body100
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !882
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !882
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !882
  %reg_file103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 0, !dbg !882
  %arraydecay104 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file103, i16 0, i16 0, !dbg !882
  call void @__dump_registers(i16* %arraydecay104), !dbg !882
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !882
  br label %if.end108, !dbg !882

if.else105:                                       ; preds = %do.body100
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !884
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !884
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !884
  %reg_file106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 0, !dbg !884
  %arraydecay107 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file106, i16 0, i16 0, !dbg !884
  call void @__dump_registers(i16* %arraydecay107), !dbg !884
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !884
  br label %if.end108

if.end108:                                        ; preds = %if.else105, %if.then102
  br label %do.end109, !dbg !881

do.end109:                                        ; preds = %if.end108
  call void @task_commit(), !dbg !876
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !886
  %globals110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !886
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals110, i32 0, i32 10, !dbg !886
  %41 = load i16, i16* %trainingSetSize, align 2, !dbg !886
  %cmp111 = icmp uge i16 %41, 16, !dbg !888
  br i1 %cmp111, label %if.then112, label %if.end113, !dbg !889

if.then112:                                       ; preds = %do.end109
  br label %while.end145, !dbg !890

if.end113:                                        ; preds = %do.end109
  br label %if.end144, !dbg !891

if.else114:                                       ; preds = %lor.lhs.false95
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !892
  %globals115 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1, !dbg !892
  %mode116 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals115, i32 0, i32 12, !dbg !892
  %43 = load i16, i16* %mode116, align 2, !dbg !892
  %cmp117 = icmp eq i16 %43, 0, !dbg !894
  br i1 %cmp117, label %if.then118, label %if.end143, !dbg !895

if.then118:                                       ; preds = %if.else114
  call void @task_classify(), !dbg !896
  br label %do.body119, !dbg !896

do.body119:                                       ; preds = %if.then118
  %44 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !898
  %cmp120 = icmp eq i16 %44, 1, !dbg !898
  br i1 %cmp120, label %if.then121, label %if.else124, !dbg !901

if.then121:                                       ; preds = %do.body119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !902
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !902
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !902
  %reg_file122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 0, !dbg !902
  %arraydecay123 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file122, i16 0, i16 0, !dbg !902
  call void @__dump_registers(i16* %arraydecay123), !dbg !902
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !902
  br label %if.end127, !dbg !902

if.else124:                                       ; preds = %do.body119
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !904
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !904
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !904
  %reg_file125 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 0, !dbg !904
  %arraydecay126 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file125, i16 0, i16 0, !dbg !904
  call void @__dump_registers(i16* %arraydecay126), !dbg !904
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !904
  br label %if.end127

if.end127:                                        ; preds = %if.else124, %if.then121
  br label %do.end128, !dbg !901

do.end128:                                        ; preds = %if.end127
  call void @task_commit(), !dbg !896
  call void @task_stats(), !dbg !906
  br label %do.body129, !dbg !906

do.body129:                                       ; preds = %do.end128
  %47 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !907
  %cmp130 = icmp eq i16 %47, 1, !dbg !907
  br i1 %cmp130, label %if.then131, label %if.else134, !dbg !910

if.then131:                                       ; preds = %do.body129
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !911
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !911
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !911
  %reg_file132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 0, !dbg !911
  %arraydecay133 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file132, i16 0, i16 0, !dbg !911
  call void @__dump_registers(i16* %arraydecay133), !dbg !911
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !911
  br label %if.end137, !dbg !911

if.else134:                                       ; preds = %do.body129
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !913
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !913
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !913
  %reg_file135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %49, i32 0, i32 0, !dbg !913
  %arraydecay136 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file135, i16 0, i16 0, !dbg !913
  call void @__dump_registers(i16* %arraydecay136), !dbg !913
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !913
  br label %if.end137

if.end137:                                        ; preds = %if.else134, %if.then131
  br label %do.end138, !dbg !910

do.end138:                                        ; preds = %if.end137
  call void @task_commit(), !dbg !906
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !915
  %globals139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !915
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals139, i32 0, i32 3, !dbg !915
  %51 = load i16, i16* %totalCount, align 2, !dbg !915
  %cmp140 = icmp eq i16 %51, 128, !dbg !917
  br i1 %cmp140, label %if.then141, label %if.end142, !dbg !918

if.then141:                                       ; preds = %do.end138
  br label %while.end145, !dbg !919

if.end142:                                        ; preds = %do.end138
  br label %if.end143, !dbg !920

if.end143:                                        ; preds = %if.end142, %if.else114
  br label %if.end144

if.end144:                                        ; preds = %if.end143, %if.end113
  br label %while.body56, !dbg !834, !llvm.loop !921

while.end145:                                     ; preds = %if.then141, %if.then112
  br label %while.body, !dbg !776, !llvm.loop !832
}

declare dso_local void @__dump_registers(i16*) #1

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
!132 = !DILocation(line: 202, column: 5, scope: !133)
!133 = distinct !DILexicalBlock(scope: !113, file: !3, line: 202, column: 5)
!134 = !{i32 -2146652343}
!135 = !DILocation(line: 203, column: 5, scope: !113)
!136 = !DILocation(line: 204, column: 25, scope: !113)
!137 = !DILocation(line: 204, column: 31, scope: !113)
!138 = !DILocation(line: 204, column: 5, scope: !113)
!139 = !DILocation(line: 227, column: 1, scope: !113)
!140 = distinct !DISubprogram(name: "ACCEL_singleSample_", scope: !3, file: !3, line: 229, type: !141, scopeLine: 229, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!141 = !DISubroutineType(types: !142)
!142 = !{!6, !143, !6}
!143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 16)
!144 = !DILocalVariable(name: "result", arg: 1, scope: !140, file: !3, line: 229, type: !143)
!145 = !DILocation(line: 229, column: 45, scope: !140)
!146 = !DILocalVariable(name: "seed", arg: 2, scope: !140, file: !3, line: 229, type: !6)
!147 = !DILocation(line: 229, column: 62, scope: !140)
!148 = !DILocation(line: 230, column: 15, scope: !140)
!149 = !DILocation(line: 230, column: 19, scope: !140)
!150 = !DILocation(line: 230, column: 23, scope: !140)
!151 = !DILocation(line: 230, column: 14, scope: !140)
!152 = !DILocation(line: 230, column: 2, scope: !140)
!153 = !DILocation(line: 230, column: 10, scope: !140)
!154 = !DILocation(line: 230, column: 12, scope: !140)
!155 = !DILocation(line: 231, column: 15, scope: !140)
!156 = !DILocation(line: 231, column: 19, scope: !140)
!157 = !DILocation(line: 231, column: 22, scope: !140)
!158 = !DILocation(line: 231, column: 26, scope: !140)
!159 = !DILocation(line: 231, column: 14, scope: !140)
!160 = !DILocation(line: 231, column: 2, scope: !140)
!161 = !DILocation(line: 231, column: 10, scope: !140)
!162 = !DILocation(line: 231, column: 12, scope: !140)
!163 = !DILocation(line: 232, column: 15, scope: !140)
!164 = !DILocation(line: 232, column: 19, scope: !140)
!165 = !DILocation(line: 232, column: 22, scope: !140)
!166 = !DILocation(line: 232, column: 25, scope: !140)
!167 = !DILocation(line: 232, column: 29, scope: !140)
!168 = !DILocation(line: 232, column: 14, scope: !140)
!169 = !DILocation(line: 232, column: 2, scope: !140)
!170 = !DILocation(line: 232, column: 10, scope: !140)
!171 = !DILocation(line: 232, column: 12, scope: !140)
!172 = !DILocation(line: 233, column: 2, scope: !140)
!173 = !DILocation(line: 235, column: 9, scope: !140)
!174 = !DILocation(line: 235, column: 2, scope: !140)
!175 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 238, type: !21, scopeLine: 239, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!176 = !DILocation(line: 240, column: 2, scope: !175)
!177 = !DILocation(line: 240, column: 15, scope: !175)
!178 = !DILocation(line: 241, column: 2, scope: !175)
!179 = !DILocation(line: 241, column: 12, scope: !175)
!180 = !DILocation(line: 242, column: 2, scope: !175)
!181 = !DILocation(line: 242, column: 11, scope: !175)
!182 = !DILocation(line: 243, column: 1, scope: !175)
!183 = distinct !DISubprogram(name: "task_selectMode", scope: !3, file: !3, line: 245, type: !21, scopeLine: 246, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!184 = !DILocalVariable(name: "pin_state", scope: !183, file: !3, line: 247, type: !25)
!185 = !DILocation(line: 247, column: 11, scope: !183)
!186 = !DILocation(line: 248, column: 4, scope: !183)
!187 = !DILocation(line: 248, column: 2, scope: !183)
!188 = !DILocation(line: 250, column: 5, scope: !189)
!189 = distinct !DILexicalBlock(scope: !183, file: !3, line: 250, column: 5)
!190 = !DILocation(line: 250, column: 15, scope: !189)
!191 = !DILocation(line: 250, column: 5, scope: !183)
!192 = !DILocation(line: 250, column: 30, scope: !189)
!193 = !DILocation(line: 250, column: 21, scope: !189)
!194 = !DILocation(line: 251, column: 5, scope: !195)
!195 = distinct !DILexicalBlock(scope: !183, file: !3, line: 251, column: 5)
!196 = !DILocation(line: 251, column: 14, scope: !195)
!197 = !DILocation(line: 251, column: 5, scope: !183)
!198 = !DILocation(line: 251, column: 28, scope: !195)
!199 = !DILocation(line: 251, column: 19, scope: !195)
!200 = !DILocation(line: 252, column: 6, scope: !201)
!201 = distinct !DILexicalBlock(scope: !183, file: !3, line: 252, column: 6)
!202 = !DILocation(line: 252, column: 16, scope: !201)
!203 = !DILocation(line: 252, column: 6, scope: !183)
!204 = !DILocation(line: 254, column: 3, scope: !205)
!205 = distinct !DILexicalBlock(scope: !201, file: !3, line: 252, column: 22)
!206 = !DILocation(line: 255, column: 2, scope: !205)
!207 = !DILocalVariable(name: "mode", scope: !183, file: !3, line: 256, type: !82)
!208 = !DILocation(line: 256, column: 13, scope: !183)
!209 = !DILocalVariable(name: "class", scope: !183, file: !3, line: 257, type: !50)
!210 = !DILocation(line: 257, column: 10, scope: !183)
!211 = !DILocation(line: 259, column: 7, scope: !212)
!212 = distinct !DILexicalBlock(scope: !183, file: !3, line: 259, column: 6)
!213 = !DILocation(line: 259, column: 17, scope: !212)
!214 = !DILocation(line: 259, column: 42, scope: !212)
!215 = !DILocation(line: 260, column: 5, scope: !212)
!216 = !DILocation(line: 260, column: 15, scope: !212)
!217 = !DILocation(line: 260, column: 37, scope: !212)
!218 = !DILocation(line: 261, column: 4, scope: !212)
!219 = !DILocation(line: 261, column: 17, scope: !212)
!220 = !DILocation(line: 261, column: 14, scope: !212)
!221 = !DILocation(line: 259, column: 6, scope: !183)
!222 = !DILocation(line: 262, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !212, file: !3, line: 261, column: 31)
!224 = !DILocation(line: 263, column: 2, scope: !223)
!225 = !DILocation(line: 264, column: 18, scope: !226)
!226 = distinct !DILexicalBlock(scope: !212, file: !3, line: 263, column: 9)
!227 = !DILocation(line: 264, column: 3, scope: !226)
!228 = !DILocation(line: 264, column: 16, scope: !226)
!229 = !DILocation(line: 267, column: 9, scope: !183)
!230 = !DILocation(line: 267, column: 2, scope: !183)
!231 = !DILocation(line: 269, column: 4, scope: !232)
!232 = distinct !DILexicalBlock(scope: !183, file: !3, line: 267, column: 20)
!233 = !DILocation(line: 269, column: 30, scope: !232)
!234 = !DILocation(line: 270, column: 4, scope: !232)
!235 = !DILocation(line: 270, column: 13, scope: !232)
!236 = !DILocation(line: 271, column: 4, scope: !232)
!237 = !DILocation(line: 271, column: 14, scope: !232)
!238 = !DILocation(line: 272, column: 4, scope: !232)
!239 = !DILocation(line: 272, column: 24, scope: !232)
!240 = !DILocation(line: 274, column: 4, scope: !232)
!241 = !DILocation(line: 277, column: 4, scope: !232)
!242 = !DILocation(line: 277, column: 30, scope: !232)
!243 = !DILocation(line: 278, column: 4, scope: !232)
!244 = !DILocation(line: 278, column: 13, scope: !232)
!245 = !DILocation(line: 279, column: 4, scope: !232)
!246 = !DILocation(line: 279, column: 14, scope: !232)
!247 = !DILocation(line: 280, column: 4, scope: !232)
!248 = !DILocation(line: 280, column: 24, scope: !232)
!249 = !DILocation(line: 282, column: 4, scope: !232)
!250 = !DILocation(line: 285, column: 4, scope: !232)
!251 = !DILocation(line: 285, column: 13, scope: !232)
!252 = !DILocation(line: 287, column: 4, scope: !232)
!253 = !DILocation(line: 290, column: 4, scope: !232)
!254 = !DILocation(line: 290, column: 13, scope: !232)
!255 = !DILocation(line: 291, column: 4, scope: !232)
!256 = !DILocation(line: 293, column: 1, scope: !183)
!257 = distinct !DISubprogram(name: "task_resetStats", scope: !3, file: !3, line: 295, type: !21, scopeLine: 296, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!258 = !DILocation(line: 298, column: 2, scope: !257)
!259 = !DILocation(line: 298, column: 18, scope: !257)
!260 = !DILocation(line: 299, column: 2, scope: !257)
!261 = !DILocation(line: 299, column: 22, scope: !257)
!262 = !DILocation(line: 300, column: 2, scope: !257)
!263 = !DILocation(line: 300, column: 17, scope: !257)
!264 = !DILocation(line: 302, column: 2, scope: !257)
!265 = !DILocation(line: 302, column: 22, scope: !257)
!266 = !DILocation(line: 304, column: 1, scope: !257)
!267 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 306, type: !21, scopeLine: 307, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!268 = !DILocalVariable(name: "sample", scope: !267, file: !3, line: 309, type: !56)
!269 = !DILocation(line: 309, column: 15, scope: !267)
!270 = !DILocation(line: 310, column: 31, scope: !267)
!271 = !DILocation(line: 310, column: 2, scope: !267)
!272 = !DILocation(line: 311, column: 2, scope: !267)
!273 = !DILocation(line: 311, column: 13, scope: !267)
!274 = !DILocation(line: 311, column: 36, scope: !267)
!275 = !DILocation(line: 312, column: 4, scope: !267)
!276 = !DILocation(line: 312, column: 2, scope: !267)
!277 = !DILocation(line: 314, column: 1, scope: !267)
!278 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 316, type: !21, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!279 = !DILocation(line: 318, column: 5, scope: !278)
!280 = !DILocation(line: 318, column: 25, scope: !278)
!281 = !DILocalVariable(name: "sample", scope: !278, file: !3, line: 320, type: !282)
!282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 16)
!283 = !DILocation(line: 320, column: 16, scope: !278)
!284 = !DILocalVariable(name: "transformedSample", scope: !278, file: !3, line: 321, type: !56)
!285 = !DILocation(line: 321, column: 15, scope: !278)
!286 = !DILocalVariable(name: "i", scope: !287, file: !3, line: 323, type: !6)
!287 = distinct !DILexicalBlock(scope: !278, file: !3, line: 323, column: 2)
!288 = !DILocation(line: 323, column: 16, scope: !287)
!289 = !DILocation(line: 323, column: 7, scope: !287)
!290 = !DILocation(line: 323, column: 23, scope: !291)
!291 = distinct !DILexicalBlock(scope: !287, file: !3, line: 323, column: 2)
!292 = !DILocation(line: 323, column: 25, scope: !291)
!293 = !DILocation(line: 323, column: 2, scope: !287)
!294 = !DILocation(line: 324, column: 7, scope: !295)
!295 = distinct !DILexicalBlock(scope: !296, file: !3, line: 324, column: 7)
!296 = distinct !DILexicalBlock(scope: !291, file: !3, line: 323, column: 51)
!297 = !DILocation(line: 324, column: 18, scope: !295)
!298 = !DILocation(line: 324, column: 21, scope: !295)
!299 = !DILocation(line: 324, column: 23, scope: !295)
!300 = !DILocation(line: 324, column: 44, scope: !295)
!301 = !DILocation(line: 325, column: 5, scope: !295)
!302 = !DILocation(line: 325, column: 16, scope: !295)
!303 = !DILocation(line: 325, column: 19, scope: !295)
!304 = !DILocation(line: 325, column: 21, scope: !295)
!305 = !DILocation(line: 325, column: 42, scope: !295)
!306 = !DILocation(line: 326, column: 5, scope: !295)
!307 = !DILocation(line: 326, column: 16, scope: !295)
!308 = !DILocation(line: 326, column: 19, scope: !295)
!309 = !DILocation(line: 326, column: 21, scope: !295)
!310 = !DILocation(line: 324, column: 7, scope: !296)
!311 = !DILocation(line: 328, column: 23, scope: !312)
!312 = distinct !DILexicalBlock(scope: !295, file: !3, line: 326, column: 43)
!313 = !DILocation(line: 328, column: 34, scope: !312)
!314 = !DILocation(line: 328, column: 37, scope: !312)
!315 = !DILocation(line: 328, column: 39, scope: !312)
!316 = !DILocation(line: 328, column: 22, scope: !312)
!317 = !DILocation(line: 329, column: 7, scope: !312)
!318 = !DILocation(line: 329, column: 18, scope: !312)
!319 = !DILocation(line: 329, column: 21, scope: !312)
!320 = !DILocation(line: 328, column: 4, scope: !312)
!321 = !DILocation(line: 328, column: 15, scope: !312)
!322 = !DILocation(line: 328, column: 18, scope: !312)
!323 = !DILocation(line: 328, column: 20, scope: !312)
!324 = !DILocation(line: 330, column: 23, scope: !312)
!325 = !DILocation(line: 330, column: 34, scope: !312)
!326 = !DILocation(line: 330, column: 37, scope: !312)
!327 = !DILocation(line: 330, column: 39, scope: !312)
!328 = !DILocation(line: 330, column: 22, scope: !312)
!329 = !DILocation(line: 331, column: 7, scope: !312)
!330 = !DILocation(line: 331, column: 18, scope: !312)
!331 = !DILocation(line: 331, column: 21, scope: !312)
!332 = !DILocation(line: 330, column: 4, scope: !312)
!333 = !DILocation(line: 330, column: 15, scope: !312)
!334 = !DILocation(line: 330, column: 18, scope: !312)
!335 = !DILocation(line: 330, column: 20, scope: !312)
!336 = !DILocation(line: 332, column: 23, scope: !312)
!337 = !DILocation(line: 332, column: 34, scope: !312)
!338 = !DILocation(line: 332, column: 37, scope: !312)
!339 = !DILocation(line: 332, column: 39, scope: !312)
!340 = !DILocation(line: 332, column: 22, scope: !312)
!341 = !DILocation(line: 333, column: 7, scope: !312)
!342 = !DILocation(line: 333, column: 18, scope: !312)
!343 = !DILocation(line: 333, column: 21, scope: !312)
!344 = !DILocation(line: 332, column: 4, scope: !312)
!345 = !DILocation(line: 332, column: 15, scope: !312)
!346 = !DILocation(line: 332, column: 18, scope: !312)
!347 = !DILocation(line: 332, column: 20, scope: !312)
!348 = !DILocation(line: 334, column: 3, scope: !312)
!349 = !DILocation(line: 335, column: 2, scope: !296)
!350 = !DILocation(line: 323, column: 47, scope: !291)
!351 = !DILocation(line: 323, column: 2, scope: !291)
!352 = distinct !{!352, !293, !353}
!353 = !DILocation(line: 335, column: 2, scope: !287)
!354 = !DILocation(line: 336, column: 1, scope: !278)
!355 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 338, type: !21, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!356 = !DILocalVariable(name: "mean", scope: !355, file: !3, line: 340, type: !56)
!357 = !DILocation(line: 340, column: 15, scope: !355)
!358 = !DILocalVariable(name: "stddev", scope: !355, file: !3, line: 340, type: !56)
!359 = !DILocation(line: 340, column: 21, scope: !355)
!360 = !DILocation(line: 341, column: 25, scope: !355)
!361 = !DILocation(line: 341, column: 27, scope: !355)
!362 = !DILocation(line: 341, column: 16, scope: !355)
!363 = !DILocation(line: 341, column: 18, scope: !355)
!364 = !DILocation(line: 341, column: 7, scope: !355)
!365 = !DILocation(line: 341, column: 9, scope: !355)
!366 = !DILocation(line: 342, column: 31, scope: !355)
!367 = !DILocation(line: 342, column: 33, scope: !355)
!368 = !DILocation(line: 342, column: 20, scope: !355)
!369 = !DILocation(line: 342, column: 22, scope: !355)
!370 = !DILocation(line: 342, column: 9, scope: !355)
!371 = !DILocation(line: 342, column: 11, scope: !355)
!372 = !DILocalVariable(name: "features", scope: !355, file: !3, line: 343, type: !69)
!373 = !DILocation(line: 343, column: 13, scope: !355)
!374 = !DILocalVariable(name: "i", scope: !355, file: !3, line: 345, type: !375)
!375 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!376 = !DILocation(line: 345, column: 6, scope: !355)
!377 = !DILocation(line: 346, column: 9, scope: !378)
!378 = distinct !DILexicalBlock(scope: !355, file: !3, line: 346, column: 2)
!379 = !DILocation(line: 346, column: 7, scope: !378)
!380 = !DILocation(line: 346, column: 14, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !3, line: 346, column: 2)
!382 = !DILocation(line: 346, column: 16, scope: !381)
!383 = !DILocation(line: 346, column: 2, scope: !378)
!384 = !DILocation(line: 348, column: 13, scope: !385)
!385 = distinct !DILexicalBlock(scope: !381, file: !3, line: 346, column: 42)
!386 = !DILocation(line: 348, column: 24, scope: !385)
!387 = !DILocation(line: 348, column: 27, scope: !385)
!388 = !DILocation(line: 348, column: 8, scope: !385)
!389 = !DILocation(line: 348, column: 10, scope: !385)
!390 = !DILocation(line: 349, column: 13, scope: !385)
!391 = !DILocation(line: 349, column: 24, scope: !385)
!392 = !DILocation(line: 349, column: 27, scope: !385)
!393 = !DILocation(line: 349, column: 8, scope: !385)
!394 = !DILocation(line: 349, column: 10, scope: !385)
!395 = !DILocation(line: 350, column: 13, scope: !385)
!396 = !DILocation(line: 350, column: 24, scope: !385)
!397 = !DILocation(line: 350, column: 27, scope: !385)
!398 = !DILocation(line: 350, column: 8, scope: !385)
!399 = !DILocation(line: 350, column: 10, scope: !385)
!400 = !DILocation(line: 351, column: 2, scope: !385)
!401 = !DILocation(line: 346, column: 38, scope: !381)
!402 = !DILocation(line: 346, column: 2, scope: !381)
!403 = distinct !{!403, !383, !404}
!404 = !DILocation(line: 351, column: 2, scope: !378)
!405 = !DILocation(line: 352, column: 7, scope: !355)
!406 = !DILocation(line: 352, column: 9, scope: !355)
!407 = !DILocation(line: 353, column: 7, scope: !355)
!408 = !DILocation(line: 353, column: 9, scope: !355)
!409 = !DILocation(line: 354, column: 7, scope: !355)
!410 = !DILocation(line: 354, column: 9, scope: !355)
!411 = !DILocation(line: 356, column: 9, scope: !412)
!412 = distinct !DILexicalBlock(scope: !355, file: !3, line: 356, column: 2)
!413 = !DILocation(line: 356, column: 7, scope: !412)
!414 = !DILocation(line: 356, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !3, line: 356, column: 2)
!416 = !DILocation(line: 356, column: 16, scope: !415)
!417 = !DILocation(line: 356, column: 2, scope: !412)
!418 = !DILocation(line: 357, column: 15, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 356, column: 42)
!420 = !DILocation(line: 357, column: 26, scope: !419)
!421 = !DILocation(line: 357, column: 29, scope: !419)
!422 = !DILocation(line: 357, column: 38, scope: !419)
!423 = !DILocation(line: 357, column: 33, scope: !419)
!424 = !DILocation(line: 357, column: 31, scope: !419)
!425 = !DILocation(line: 357, column: 42, scope: !419)
!426 = !DILocation(line: 357, column: 53, scope: !419)
!427 = !DILocation(line: 357, column: 56, scope: !419)
!428 = !DILocation(line: 357, column: 65, scope: !419)
!429 = !DILocation(line: 357, column: 60, scope: !419)
!430 = !DILocation(line: 357, column: 58, scope: !419)
!431 = !DILocation(line: 358, column: 11, scope: !419)
!432 = !DILocation(line: 358, column: 6, scope: !419)
!433 = !DILocation(line: 358, column: 15, scope: !419)
!434 = !DILocation(line: 358, column: 26, scope: !419)
!435 = !DILocation(line: 358, column: 29, scope: !419)
!436 = !DILocation(line: 358, column: 13, scope: !419)
!437 = !DILocation(line: 357, column: 10, scope: !419)
!438 = !DILocation(line: 357, column: 12, scope: !419)
!439 = !DILocation(line: 359, column: 15, scope: !419)
!440 = !DILocation(line: 359, column: 26, scope: !419)
!441 = !DILocation(line: 359, column: 29, scope: !419)
!442 = !DILocation(line: 359, column: 38, scope: !419)
!443 = !DILocation(line: 359, column: 33, scope: !419)
!444 = !DILocation(line: 359, column: 31, scope: !419)
!445 = !DILocation(line: 359, column: 42, scope: !419)
!446 = !DILocation(line: 359, column: 53, scope: !419)
!447 = !DILocation(line: 359, column: 56, scope: !419)
!448 = !DILocation(line: 359, column: 65, scope: !419)
!449 = !DILocation(line: 359, column: 60, scope: !419)
!450 = !DILocation(line: 359, column: 58, scope: !419)
!451 = !DILocation(line: 360, column: 11, scope: !419)
!452 = !DILocation(line: 360, column: 6, scope: !419)
!453 = !DILocation(line: 360, column: 15, scope: !419)
!454 = !DILocation(line: 360, column: 26, scope: !419)
!455 = !DILocation(line: 360, column: 29, scope: !419)
!456 = !DILocation(line: 360, column: 13, scope: !419)
!457 = !DILocation(line: 359, column: 10, scope: !419)
!458 = !DILocation(line: 359, column: 12, scope: !419)
!459 = !DILocation(line: 361, column: 15, scope: !419)
!460 = !DILocation(line: 361, column: 26, scope: !419)
!461 = !DILocation(line: 361, column: 29, scope: !419)
!462 = !DILocation(line: 361, column: 38, scope: !419)
!463 = !DILocation(line: 361, column: 33, scope: !419)
!464 = !DILocation(line: 361, column: 31, scope: !419)
!465 = !DILocation(line: 361, column: 42, scope: !419)
!466 = !DILocation(line: 361, column: 53, scope: !419)
!467 = !DILocation(line: 361, column: 56, scope: !419)
!468 = !DILocation(line: 361, column: 65, scope: !419)
!469 = !DILocation(line: 361, column: 60, scope: !419)
!470 = !DILocation(line: 361, column: 58, scope: !419)
!471 = !DILocation(line: 362, column: 11, scope: !419)
!472 = !DILocation(line: 362, column: 6, scope: !419)
!473 = !DILocation(line: 362, column: 15, scope: !419)
!474 = !DILocation(line: 362, column: 26, scope: !419)
!475 = !DILocation(line: 362, column: 29, scope: !419)
!476 = !DILocation(line: 362, column: 13, scope: !419)
!477 = !DILocation(line: 361, column: 10, scope: !419)
!478 = !DILocation(line: 361, column: 12, scope: !419)
!479 = !DILocation(line: 363, column: 2, scope: !419)
!480 = !DILocation(line: 356, column: 38, scope: !415)
!481 = !DILocation(line: 356, column: 2, scope: !415)
!482 = distinct !{!482, !417, !483}
!483 = !DILocation(line: 363, column: 2, scope: !412)
!484 = !DILocation(line: 364, column: 9, scope: !355)
!485 = !DILocation(line: 364, column: 11, scope: !355)
!486 = !DILocation(line: 365, column: 9, scope: !355)
!487 = !DILocation(line: 365, column: 11, scope: !355)
!488 = !DILocation(line: 366, column: 9, scope: !355)
!489 = !DILocation(line: 366, column: 11, scope: !355)
!490 = !DILocalVariable(name: "meanmag", scope: !355, file: !3, line: 368, type: !6)
!491 = !DILocation(line: 368, column: 11, scope: !355)
!492 = !DILocation(line: 368, column: 26, scope: !355)
!493 = !DILocation(line: 368, column: 21, scope: !355)
!494 = !DILocation(line: 368, column: 33, scope: !355)
!495 = !DILocation(line: 368, column: 28, scope: !355)
!496 = !DILocation(line: 368, column: 27, scope: !355)
!497 = !DILocation(line: 368, column: 42, scope: !355)
!498 = !DILocation(line: 368, column: 37, scope: !355)
!499 = !DILocation(line: 368, column: 49, scope: !355)
!500 = !DILocation(line: 368, column: 44, scope: !355)
!501 = !DILocation(line: 368, column: 43, scope: !355)
!502 = !DILocation(line: 368, column: 35, scope: !355)
!503 = !DILocation(line: 368, column: 58, scope: !355)
!504 = !DILocation(line: 368, column: 53, scope: !355)
!505 = !DILocation(line: 368, column: 65, scope: !355)
!506 = !DILocation(line: 368, column: 60, scope: !355)
!507 = !DILocation(line: 368, column: 59, scope: !355)
!508 = !DILocation(line: 368, column: 51, scope: !355)
!509 = !DILocalVariable(name: "stddevmag", scope: !355, file: !3, line: 369, type: !6)
!510 = !DILocation(line: 369, column: 11, scope: !355)
!511 = !DILocation(line: 369, column: 30, scope: !355)
!512 = !DILocation(line: 369, column: 23, scope: !355)
!513 = !DILocation(line: 369, column: 39, scope: !355)
!514 = !DILocation(line: 369, column: 32, scope: !355)
!515 = !DILocation(line: 369, column: 31, scope: !355)
!516 = !DILocation(line: 369, column: 50, scope: !355)
!517 = !DILocation(line: 369, column: 43, scope: !355)
!518 = !DILocation(line: 369, column: 59, scope: !355)
!519 = !DILocation(line: 369, column: 52, scope: !355)
!520 = !DILocation(line: 369, column: 51, scope: !355)
!521 = !DILocation(line: 369, column: 41, scope: !355)
!522 = !DILocation(line: 369, column: 70, scope: !355)
!523 = !DILocation(line: 369, column: 63, scope: !355)
!524 = !DILocation(line: 369, column: 79, scope: !355)
!525 = !DILocation(line: 369, column: 72, scope: !355)
!526 = !DILocation(line: 369, column: 71, scope: !355)
!527 = !DILocation(line: 369, column: 61, scope: !355)
!528 = !DILocation(line: 370, column: 28, scope: !355)
!529 = !DILocation(line: 370, column: 23, scope: !355)
!530 = !DILocation(line: 370, column: 11, scope: !355)
!531 = !DILocation(line: 370, column: 21, scope: !355)
!532 = !DILocation(line: 371, column: 28, scope: !355)
!533 = !DILocation(line: 371, column: 23, scope: !355)
!534 = !DILocation(line: 371, column: 11, scope: !355)
!535 = !DILocation(line: 371, column: 21, scope: !355)
!536 = !DILocation(line: 373, column: 10, scope: !355)
!537 = !DILocation(line: 373, column: 2, scope: !355)
!538 = !DILocation(line: 376, column: 4, scope: !539)
!539 = distinct !DILexicalBlock(scope: !355, file: !3, line: 373, column: 20)
!540 = !DILocation(line: 376, column: 19, scope: !539)
!541 = !DILocation(line: 377, column: 4, scope: !539)
!542 = !DILocation(line: 379, column: 4, scope: !539)
!543 = !DILocation(line: 379, column: 19, scope: !539)
!544 = !DILocation(line: 380, column: 4, scope: !539)
!545 = !DILocation(line: 382, column: 4, scope: !539)
!546 = !DILocation(line: 384, column: 1, scope: !355)
!547 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 386, type: !21, scopeLine: 386, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!548 = !DILocalVariable(name: "move_less_error", scope: !547, file: !3, line: 387, type: !375)
!549 = !DILocation(line: 387, column: 6, scope: !547)
!550 = !DILocalVariable(name: "stat_less_error", scope: !547, file: !3, line: 388, type: !375)
!551 = !DILocation(line: 388, column: 6, scope: !547)
!552 = !DILocalVariable(name: "i", scope: !547, file: !3, line: 389, type: !375)
!553 = !DILocation(line: 389, column: 6, scope: !547)
!554 = !DILocalVariable(name: "class", scope: !547, file: !3, line: 390, type: !50)
!555 = !DILocation(line: 390, column: 10, scope: !547)
!556 = !DILocalVariable(name: "meanmag", scope: !547, file: !3, line: 391, type: !557)
!557 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!558 = !DILocation(line: 391, column: 11, scope: !547)
!559 = !DILocalVariable(name: "stddevmag", scope: !547, file: !3, line: 392, type: !557)
!560 = !DILocation(line: 392, column: 11, scope: !547)
!561 = !DILocation(line: 394, column: 12, scope: !547)
!562 = !DILocation(line: 394, column: 25, scope: !547)
!563 = !DILocation(line: 394, column: 10, scope: !547)
!564 = !DILocation(line: 395, column: 14, scope: !547)
!565 = !DILocation(line: 395, column: 27, scope: !547)
!566 = !DILocation(line: 395, column: 12, scope: !547)
!567 = !DILocation(line: 397, column: 9, scope: !568)
!568 = distinct !DILexicalBlock(scope: !547, file: !3, line: 397, column: 2)
!569 = !DILocation(line: 397, column: 7, scope: !568)
!570 = !DILocation(line: 397, column: 14, scope: !571)
!571 = distinct !DILexicalBlock(scope: !568, file: !3, line: 397, column: 2)
!572 = !DILocation(line: 397, column: 16, scope: !571)
!573 = !DILocation(line: 397, column: 2, scope: !568)
!574 = !DILocalVariable(name: "stat_mean_err", scope: !575, file: !3, line: 398, type: !557)
!575 = distinct !DILexicalBlock(scope: !571, file: !3, line: 397, column: 35)
!576 = !DILocation(line: 398, column: 12, scope: !575)
!577 = !DILocation(line: 398, column: 29, scope: !575)
!578 = !DILocation(line: 398, column: 50, scope: !575)
!579 = !DILocation(line: 398, column: 53, scope: !575)
!580 = !DILocation(line: 398, column: 63, scope: !575)
!581 = !DILocation(line: 398, column: 61, scope: !575)
!582 = !DILocation(line: 398, column: 28, scope: !575)
!583 = !DILocation(line: 399, column: 7, scope: !575)
!584 = !DILocation(line: 399, column: 28, scope: !575)
!585 = !DILocation(line: 399, column: 31, scope: !575)
!586 = !DILocation(line: 399, column: 41, scope: !575)
!587 = !DILocation(line: 399, column: 39, scope: !575)
!588 = !DILocation(line: 400, column: 7, scope: !575)
!589 = !DILocation(line: 400, column: 17, scope: !575)
!590 = !DILocation(line: 400, column: 38, scope: !575)
!591 = !DILocation(line: 400, column: 41, scope: !575)
!592 = !DILocation(line: 400, column: 15, scope: !575)
!593 = !DILocalVariable(name: "stat_sd_err", scope: !575, file: !3, line: 402, type: !557)
!594 = !DILocation(line: 402, column: 12, scope: !575)
!595 = !DILocation(line: 402, column: 27, scope: !575)
!596 = !DILocation(line: 402, column: 48, scope: !575)
!597 = !DILocation(line: 402, column: 51, scope: !575)
!598 = !DILocation(line: 402, column: 63, scope: !575)
!599 = !DILocation(line: 402, column: 61, scope: !575)
!600 = !DILocation(line: 402, column: 26, scope: !575)
!601 = !DILocation(line: 403, column: 7, scope: !575)
!602 = !DILocation(line: 403, column: 28, scope: !575)
!603 = !DILocation(line: 403, column: 31, scope: !575)
!604 = !DILocation(line: 403, column: 43, scope: !575)
!605 = !DILocation(line: 403, column: 41, scope: !575)
!606 = !DILocation(line: 404, column: 7, scope: !575)
!607 = !DILocation(line: 404, column: 19, scope: !575)
!608 = !DILocation(line: 404, column: 40, scope: !575)
!609 = !DILocation(line: 404, column: 43, scope: !575)
!610 = !DILocation(line: 404, column: 17, scope: !575)
!611 = !DILocalVariable(name: "move_mean_err", scope: !575, file: !3, line: 406, type: !557)
!612 = !DILocation(line: 406, column: 12, scope: !575)
!613 = !DILocation(line: 406, column: 29, scope: !575)
!614 = !DILocation(line: 406, column: 46, scope: !575)
!615 = !DILocation(line: 406, column: 49, scope: !575)
!616 = !DILocation(line: 406, column: 59, scope: !575)
!617 = !DILocation(line: 406, column: 57, scope: !575)
!618 = !DILocation(line: 406, column: 28, scope: !575)
!619 = !DILocation(line: 407, column: 7, scope: !575)
!620 = !DILocation(line: 407, column: 24, scope: !575)
!621 = !DILocation(line: 407, column: 27, scope: !575)
!622 = !DILocation(line: 407, column: 37, scope: !575)
!623 = !DILocation(line: 407, column: 35, scope: !575)
!624 = !DILocation(line: 408, column: 7, scope: !575)
!625 = !DILocation(line: 408, column: 17, scope: !575)
!626 = !DILocation(line: 408, column: 34, scope: !575)
!627 = !DILocation(line: 408, column: 37, scope: !575)
!628 = !DILocation(line: 408, column: 15, scope: !575)
!629 = !DILocalVariable(name: "move_sd_err", scope: !575, file: !3, line: 410, type: !557)
!630 = !DILocation(line: 410, column: 12, scope: !575)
!631 = !DILocation(line: 410, column: 27, scope: !575)
!632 = !DILocation(line: 410, column: 44, scope: !575)
!633 = !DILocation(line: 410, column: 47, scope: !575)
!634 = !DILocation(line: 410, column: 59, scope: !575)
!635 = !DILocation(line: 410, column: 57, scope: !575)
!636 = !DILocation(line: 410, column: 26, scope: !575)
!637 = !DILocation(line: 411, column: 7, scope: !575)
!638 = !DILocation(line: 411, column: 24, scope: !575)
!639 = !DILocation(line: 411, column: 27, scope: !575)
!640 = !DILocation(line: 411, column: 39, scope: !575)
!641 = !DILocation(line: 411, column: 37, scope: !575)
!642 = !DILocation(line: 412, column: 7, scope: !575)
!643 = !DILocation(line: 412, column: 19, scope: !575)
!644 = !DILocation(line: 412, column: 36, scope: !575)
!645 = !DILocation(line: 412, column: 39, scope: !575)
!646 = !DILocation(line: 412, column: 17, scope: !575)
!647 = !DILocation(line: 414, column: 7, scope: !648)
!648 = distinct !DILexicalBlock(scope: !575, file: !3, line: 414, column: 7)
!649 = !DILocation(line: 414, column: 23, scope: !648)
!650 = !DILocation(line: 414, column: 21, scope: !648)
!651 = !DILocation(line: 414, column: 7, scope: !575)
!652 = !DILocation(line: 415, column: 19, scope: !653)
!653 = distinct !DILexicalBlock(scope: !648, file: !3, line: 414, column: 38)
!654 = !DILocation(line: 416, column: 3, scope: !653)
!655 = !DILocation(line: 417, column: 19, scope: !656)
!656 = distinct !DILexicalBlock(scope: !648, file: !3, line: 416, column: 10)
!657 = !DILocation(line: 420, column: 7, scope: !658)
!658 = distinct !DILexicalBlock(scope: !575, file: !3, line: 420, column: 7)
!659 = !DILocation(line: 420, column: 21, scope: !658)
!660 = !DILocation(line: 420, column: 19, scope: !658)
!661 = !DILocation(line: 420, column: 7, scope: !575)
!662 = !DILocation(line: 421, column: 19, scope: !663)
!663 = distinct !DILexicalBlock(scope: !658, file: !3, line: 420, column: 34)
!664 = !DILocation(line: 422, column: 3, scope: !663)
!665 = !DILocation(line: 423, column: 19, scope: !666)
!666 = distinct !DILexicalBlock(scope: !658, file: !3, line: 422, column: 10)
!667 = !DILocation(line: 425, column: 2, scope: !575)
!668 = !DILocation(line: 397, column: 30, scope: !571)
!669 = !DILocation(line: 397, column: 2, scope: !571)
!670 = distinct !{!670, !573, !671}
!671 = !DILocation(line: 425, column: 2, scope: !568)
!672 = !DILocation(line: 427, column: 15, scope: !547)
!673 = !DILocation(line: 427, column: 33, scope: !547)
!674 = !DILocation(line: 427, column: 31, scope: !547)
!675 = !DILocation(line: 427, column: 14, scope: !547)
!676 = !DILocation(line: 427, column: 2, scope: !547)
!677 = !DILocation(line: 427, column: 12, scope: !547)
!678 = !DILocation(line: 429, column: 1, scope: !547)
!679 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 431, type: !21, scopeLine: 432, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!680 = !DILocalVariable(name: "movingCount", scope: !679, file: !3, line: 433, type: !6)
!681 = !DILocation(line: 433, column: 11, scope: !679)
!682 = !DILocalVariable(name: "stationaryCount", scope: !679, file: !3, line: 433, type: !6)
!683 = !DILocation(line: 433, column: 28, scope: !679)
!684 = !DILocation(line: 435, column: 4, scope: !679)
!685 = !DILocation(line: 435, column: 2, scope: !679)
!686 = !DILocation(line: 437, column: 10, scope: !679)
!687 = !DILocation(line: 437, column: 2, scope: !679)
!688 = !DILocation(line: 440, column: 6, scope: !689)
!689 = distinct !DILexicalBlock(scope: !679, file: !3, line: 437, column: 21)
!690 = !DILocation(line: 440, column: 4, scope: !689)
!691 = !DILocation(line: 441, column: 4, scope: !689)
!692 = !DILocation(line: 444, column: 6, scope: !689)
!693 = !DILocation(line: 444, column: 4, scope: !689)
!694 = !DILocation(line: 445, column: 4, scope: !689)
!695 = !DILocation(line: 448, column: 6, scope: !696)
!696 = distinct !DILexicalBlock(scope: !679, file: !3, line: 448, column: 6)
!697 = !DILocation(line: 448, column: 21, scope: !696)
!698 = !DILocation(line: 448, column: 6, scope: !679)
!699 = !DILocalVariable(name: "resultStationaryPct", scope: !700, file: !3, line: 450, type: !6)
!700 = distinct !DILexicalBlock(scope: !696, file: !3, line: 448, column: 44)
!701 = !DILocation(line: 450, column: 12, scope: !700)
!702 = !DILocation(line: 450, column: 34, scope: !700)
!703 = !DILocation(line: 450, column: 54, scope: !700)
!704 = !DILocation(line: 450, column: 62, scope: !700)
!705 = !DILocation(line: 450, column: 60, scope: !700)
!706 = !DILocalVariable(name: "resultMovingPct", scope: !700, file: !3, line: 451, type: !6)
!707 = !DILocation(line: 451, column: 12, scope: !700)
!708 = !DILocation(line: 451, column: 30, scope: !700)
!709 = !DILocation(line: 451, column: 46, scope: !700)
!710 = !DILocation(line: 451, column: 54, scope: !700)
!711 = !DILocation(line: 451, column: 52, scope: !700)
!712 = !DILocalVariable(name: "sum", scope: !700, file: !3, line: 453, type: !6)
!713 = !DILocation(line: 453, column: 12, scope: !700)
!714 = !DILocation(line: 453, column: 18, scope: !700)
!715 = !DILocation(line: 453, column: 40, scope: !700)
!716 = !DILocation(line: 453, column: 38, scope: !700)
!717 = !DILocation(line: 455, column: 2, scope: !700)
!718 = !DILocation(line: 456, column: 1, scope: !679)
!719 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 458, type: !21, scopeLine: 459, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!720 = !DILocalVariable(name: "sample", scope: !719, file: !3, line: 461, type: !57)
!721 = !DILocation(line: 461, column: 19, scope: !719)
!722 = !DILocation(line: 463, column: 45, scope: !719)
!723 = !DILocation(line: 463, column: 16, scope: !719)
!724 = !DILocation(line: 463, column: 5, scope: !719)
!725 = !DILocation(line: 463, column: 14, scope: !719)
!726 = !DILocation(line: 464, column: 7, scope: !719)
!727 = !DILocation(line: 464, column: 5, scope: !719)
!728 = !DILocation(line: 466, column: 9, scope: !729)
!729 = distinct !DILexicalBlock(scope: !719, file: !3, line: 466, column: 9)
!730 = !DILocation(line: 466, column: 35, scope: !729)
!731 = !DILocation(line: 466, column: 9, scope: !719)
!732 = !DILocation(line: 467, column: 9, scope: !733)
!733 = distinct !DILexicalBlock(scope: !729, file: !3, line: 466, column: 57)
!734 = !DILocation(line: 467, column: 29, scope: !733)
!735 = !DILocation(line: 468, column: 5, scope: !733)
!736 = !DILocation(line: 469, column: 1, scope: !719)
!737 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 471, type: !21, scopeLine: 472, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!738 = !DILocalVariable(name: "trainingSetSize", scope: !737, file: !3, line: 473, type: !6)
!739 = !DILocation(line: 473, column: 11, scope: !737)
!740 = !DILocalVariable(name: "class", scope: !737, file: !3, line: 474, type: !6)
!741 = !DILocation(line: 474, column: 11, scope: !737)
!742 = !DILocation(line: 476, column: 10, scope: !737)
!743 = !DILocation(line: 476, column: 2, scope: !737)
!744 = !DILocation(line: 478, column: 4, scope: !745)
!745 = distinct !DILexicalBlock(scope: !737, file: !3, line: 476, column: 21)
!746 = !DILocation(line: 478, column: 25, scope: !745)
!747 = !DILocation(line: 478, column: 48, scope: !745)
!748 = !DILocation(line: 479, column: 4, scope: !745)
!749 = !DILocation(line: 481, column: 4, scope: !745)
!750 = !DILocation(line: 481, column: 21, scope: !745)
!751 = !DILocation(line: 481, column: 44, scope: !745)
!752 = !DILocation(line: 482, column: 4, scope: !745)
!753 = !DILocation(line: 485, column: 4, scope: !737)
!754 = !DILocation(line: 485, column: 2, scope: !737)
!755 = !DILocation(line: 487, column: 1, scope: !737)
!756 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 489, type: !21, scopeLine: 489, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!757 = !DILocation(line: 491, column: 2, scope: !756)
!758 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 494, type: !21, scopeLine: 494, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!759 = !DILocation(line: 496, column: 1, scope: !758)
!760 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 498, type: !761, scopeLine: 498, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !101)
!761 = !DISubroutineType(types: !762)
!762 = !{!375}
!763 = !DILocation(line: 500, column: 16, scope: !760)
!764 = !DILocation(line: 501, column: 10, scope: !760)
!765 = !DILocation(line: 502, column: 12, scope: !760)
!766 = !DILocation(line: 503, column: 2, scope: !760)
!767 = !DILocation(line: 505, column: 2, scope: !760)
!768 = !DILocation(line: 505, column: 2, scope: !769)
!769 = distinct !DILexicalBlock(scope: !770, file: !3, line: 505, column: 2)
!770 = distinct !DILexicalBlock(scope: !760, file: !3, line: 505, column: 2)
!771 = !DILocation(line: 505, column: 2, scope: !770)
!772 = !DILocation(line: 505, column: 2, scope: !773)
!773 = distinct !DILexicalBlock(scope: !769, file: !3, line: 505, column: 2)
!774 = !DILocation(line: 505, column: 2, scope: !775)
!775 = distinct !DILexicalBlock(scope: !769, file: !3, line: 505, column: 2)
!776 = !DILocation(line: 507, column: 2, scope: !760)
!777 = !DILocation(line: 509, column: 3, scope: !778)
!778 = distinct !DILexicalBlock(scope: !760, file: !3, line: 507, column: 12)
!779 = !DILocation(line: 509, column: 3, scope: !780)
!780 = distinct !DILexicalBlock(scope: !781, file: !3, line: 509, column: 3)
!781 = distinct !DILexicalBlock(scope: !778, file: !3, line: 509, column: 3)
!782 = !DILocation(line: 509, column: 3, scope: !781)
!783 = !DILocation(line: 509, column: 3, scope: !784)
!784 = distinct !DILexicalBlock(scope: !780, file: !3, line: 509, column: 3)
!785 = !DILocation(line: 509, column: 3, scope: !786)
!786 = distinct !DILexicalBlock(scope: !780, file: !3, line: 509, column: 3)
!787 = !DILocation(line: 511, column: 7, scope: !788)
!788 = distinct !DILexicalBlock(scope: !778, file: !3, line: 511, column: 7)
!789 = !DILocation(line: 511, column: 17, scope: !788)
!790 = !DILocation(line: 511, column: 42, scope: !788)
!791 = !DILocation(line: 511, column: 45, scope: !788)
!792 = !DILocation(line: 511, column: 55, scope: !788)
!793 = !DILocation(line: 511, column: 7, scope: !778)
!794 = !DILocation(line: 514, column: 13, scope: !795)
!795 = distinct !DILexicalBlock(scope: !788, file: !3, line: 511, column: 76)
!796 = !DILocation(line: 514, column: 20, scope: !795)
!797 = !DILocation(line: 514, column: 47, scope: !795)
!798 = !DILocation(line: 516, column: 5, scope: !799)
!799 = distinct !DILexicalBlock(scope: !795, file: !3, line: 514, column: 69)
!800 = !DILocation(line: 516, column: 5, scope: !801)
!801 = distinct !DILexicalBlock(scope: !802, file: !3, line: 516, column: 5)
!802 = distinct !DILexicalBlock(scope: !799, file: !3, line: 516, column: 5)
!803 = !DILocation(line: 516, column: 5, scope: !802)
!804 = !DILocation(line: 516, column: 5, scope: !805)
!805 = distinct !DILexicalBlock(scope: !801, file: !3, line: 516, column: 5)
!806 = !DILocation(line: 516, column: 5, scope: !807)
!807 = distinct !DILexicalBlock(scope: !801, file: !3, line: 516, column: 5)
!808 = distinct !{!808, !794, !809}
!809 = !DILocation(line: 518, column: 13, scope: !795)
!810 = !DILocation(line: 520, column: 3, scope: !795)
!811 = !DILocation(line: 520, column: 14, scope: !812)
!812 = distinct !DILexicalBlock(scope: !788, file: !3, line: 520, column: 14)
!813 = !DILocation(line: 520, column: 24, scope: !812)
!814 = !DILocation(line: 520, column: 14, scope: !788)
!815 = !DILocation(line: 522, column: 4, scope: !816)
!816 = distinct !DILexicalBlock(scope: !812, file: !3, line: 520, column: 44)
!817 = !DILocation(line: 522, column: 4, scope: !818)
!818 = distinct !DILexicalBlock(scope: !819, file: !3, line: 522, column: 4)
!819 = distinct !DILexicalBlock(scope: !816, file: !3, line: 522, column: 4)
!820 = !DILocation(line: 522, column: 4, scope: !819)
!821 = !DILocation(line: 522, column: 4, scope: !822)
!822 = distinct !DILexicalBlock(scope: !818, file: !3, line: 522, column: 4)
!823 = !DILocation(line: 522, column: 4, scope: !824)
!824 = distinct !DILexicalBlock(scope: !818, file: !3, line: 522, column: 4)
!825 = !DILocation(line: 524, column: 3, scope: !816)
!826 = !DILocation(line: 524, column: 14, scope: !827)
!827 = distinct !DILexicalBlock(scope: !812, file: !3, line: 524, column: 14)
!828 = !DILocation(line: 524, column: 24, scope: !827)
!829 = !DILocation(line: 524, column: 14, scope: !812)
!830 = !DILocation(line: 526, column: 4, scope: !831)
!831 = distinct !DILexicalBlock(scope: !827, file: !3, line: 524, column: 38)
!832 = distinct !{!832, !776, !833}
!833 = !DILocation(line: 562, column: 2, scope: !760)
!834 = !DILocation(line: 529, column: 3, scope: !778)
!835 = !DILocation(line: 532, column: 13, scope: !836)
!836 = distinct !DILexicalBlock(scope: !778, file: !3, line: 529, column: 13)
!837 = !DILocation(line: 532, column: 20, scope: !836)
!838 = !DILocation(line: 532, column: 41, scope: !836)
!839 = !DILocation(line: 534, column: 5, scope: !840)
!840 = distinct !DILexicalBlock(scope: !836, file: !3, line: 532, column: 61)
!841 = !DILocation(line: 534, column: 5, scope: !842)
!842 = distinct !DILexicalBlock(scope: !843, file: !3, line: 534, column: 5)
!843 = distinct !DILexicalBlock(scope: !840, file: !3, line: 534, column: 5)
!844 = !DILocation(line: 534, column: 5, scope: !843)
!845 = !DILocation(line: 534, column: 5, scope: !846)
!846 = distinct !DILexicalBlock(scope: !842, file: !3, line: 534, column: 5)
!847 = !DILocation(line: 534, column: 5, scope: !848)
!848 = distinct !DILexicalBlock(scope: !842, file: !3, line: 534, column: 5)
!849 = distinct !{!849, !835, !850}
!850 = !DILocation(line: 536, column: 13, scope: !836)
!851 = !DILocation(line: 538, column: 4, scope: !836)
!852 = !DILocation(line: 538, column: 4, scope: !853)
!853 = distinct !DILexicalBlock(scope: !854, file: !3, line: 538, column: 4)
!854 = distinct !DILexicalBlock(scope: !836, file: !3, line: 538, column: 4)
!855 = !DILocation(line: 538, column: 4, scope: !854)
!856 = !DILocation(line: 538, column: 4, scope: !857)
!857 = distinct !DILexicalBlock(scope: !853, file: !3, line: 538, column: 4)
!858 = !DILocation(line: 538, column: 4, scope: !859)
!859 = distinct !DILexicalBlock(scope: !853, file: !3, line: 538, column: 4)
!860 = !DILocation(line: 540, column: 4, scope: !836)
!861 = !DILocation(line: 540, column: 4, scope: !862)
!862 = distinct !DILexicalBlock(scope: !863, file: !3, line: 540, column: 4)
!863 = distinct !DILexicalBlock(scope: !836, file: !3, line: 540, column: 4)
!864 = !DILocation(line: 540, column: 4, scope: !863)
!865 = !DILocation(line: 540, column: 4, scope: !866)
!866 = distinct !DILexicalBlock(scope: !862, file: !3, line: 540, column: 4)
!867 = !DILocation(line: 540, column: 4, scope: !868)
!868 = distinct !DILexicalBlock(scope: !862, file: !3, line: 540, column: 4)
!869 = !DILocation(line: 542, column: 8, scope: !870)
!870 = distinct !DILexicalBlock(scope: !836, file: !3, line: 542, column: 8)
!871 = !DILocation(line: 542, column: 18, scope: !870)
!872 = !DILocation(line: 542, column: 43, scope: !870)
!873 = !DILocation(line: 542, column: 46, scope: !870)
!874 = !DILocation(line: 542, column: 56, scope: !870)
!875 = !DILocation(line: 542, column: 8, scope: !836)
!876 = !DILocation(line: 544, column: 5, scope: !877)
!877 = distinct !DILexicalBlock(scope: !870, file: !3, line: 542, column: 77)
!878 = !DILocation(line: 544, column: 5, scope: !879)
!879 = distinct !DILexicalBlock(scope: !880, file: !3, line: 544, column: 5)
!880 = distinct !DILexicalBlock(scope: !877, file: !3, line: 544, column: 5)
!881 = !DILocation(line: 544, column: 5, scope: !880)
!882 = !DILocation(line: 544, column: 5, scope: !883)
!883 = distinct !DILexicalBlock(scope: !879, file: !3, line: 544, column: 5)
!884 = !DILocation(line: 544, column: 5, scope: !885)
!885 = distinct !DILexicalBlock(scope: !879, file: !3, line: 544, column: 5)
!886 = !DILocation(line: 546, column: 9, scope: !887)
!887 = distinct !DILexicalBlock(scope: !877, file: !3, line: 546, column: 9)
!888 = !DILocation(line: 546, column: 30, scope: !887)
!889 = !DILocation(line: 546, column: 9, scope: !877)
!890 = !DILocation(line: 547, column: 6, scope: !887)
!891 = !DILocation(line: 549, column: 4, scope: !877)
!892 = !DILocation(line: 549, column: 15, scope: !893)
!893 = distinct !DILexicalBlock(scope: !870, file: !3, line: 549, column: 15)
!894 = !DILocation(line: 549, column: 25, scope: !893)
!895 = !DILocation(line: 549, column: 15, scope: !870)
!896 = !DILocation(line: 551, column: 5, scope: !897)
!897 = distinct !DILexicalBlock(scope: !893, file: !3, line: 549, column: 45)
!898 = !DILocation(line: 551, column: 5, scope: !899)
!899 = distinct !DILexicalBlock(scope: !900, file: !3, line: 551, column: 5)
!900 = distinct !DILexicalBlock(scope: !897, file: !3, line: 551, column: 5)
!901 = !DILocation(line: 551, column: 5, scope: !900)
!902 = !DILocation(line: 551, column: 5, scope: !903)
!903 = distinct !DILexicalBlock(scope: !899, file: !3, line: 551, column: 5)
!904 = !DILocation(line: 551, column: 5, scope: !905)
!905 = distinct !DILexicalBlock(scope: !899, file: !3, line: 551, column: 5)
!906 = !DILocation(line: 553, column: 5, scope: !897)
!907 = !DILocation(line: 553, column: 5, scope: !908)
!908 = distinct !DILexicalBlock(scope: !909, file: !3, line: 553, column: 5)
!909 = distinct !DILexicalBlock(scope: !897, file: !3, line: 553, column: 5)
!910 = !DILocation(line: 553, column: 5, scope: !909)
!911 = !DILocation(line: 553, column: 5, scope: !912)
!912 = distinct !DILexicalBlock(scope: !908, file: !3, line: 553, column: 5)
!913 = !DILocation(line: 553, column: 5, scope: !914)
!914 = distinct !DILexicalBlock(scope: !908, file: !3, line: 553, column: 5)
!915 = !DILocation(line: 555, column: 9, scope: !916)
!916 = distinct !DILexicalBlock(scope: !897, file: !3, line: 555, column: 9)
!917 = !DILocation(line: 555, column: 25, scope: !916)
!918 = !DILocation(line: 555, column: 9, scope: !897)
!919 = !DILocation(line: 556, column: 6, scope: !916)
!920 = !DILocation(line: 558, column: 4, scope: !897)
!921 = distinct !{!921, !834, !922}
!922 = !DILocation(line: 559, column: 3, scope: !778)
