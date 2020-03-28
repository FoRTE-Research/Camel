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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !27
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !81
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !18
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !25
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !83

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !95 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !99
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !100
  %conv = zext i8 %0 to i16, !dbg !100
  %or = or i16 %conv, 1, !dbg !100
  %conv1 = trunc i16 %or to i8, !dbg !100
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !100
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !101
  %conv2 = zext i8 %1 to i16, !dbg !101
  %and = and i16 %conv2, -2, !dbg !101
  %conv3 = trunc i16 %and to i8, !dbg !101
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !101
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !102
  %and4 = and i16 %2, -2, !dbg !102
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !102
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !103
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !104
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !105
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !106
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !107
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !108
  ret void, !dbg !109
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !110 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !111
  %cmp = icmp eq i16 %0, 1, !dbg !113
  br i1 %cmp, label %if.then, label %if.else, !dbg !114

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !115
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !117
  br label %if.end4, !dbg !118

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !119
  %cmp1 = icmp eq i16 %1, 2, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !122

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !123
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !125
  br label %if.end, !dbg !126

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !127
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !129
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !129
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !129
  %3 = load i16, i16* %arrayidx, align 2, !dbg !129
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !129, !srcloc !131
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !132, metadata !DIExpression()), !dbg !134
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !134, !srcloc !135
  store i16 %4, i16* %__x, align 2, !dbg !134
  %5 = load i16, i16* %__x, align 2, !dbg !134
  store i16 %5, i16* %tmp, align 2, !dbg !134
  %6 = load i16, i16* %tmp, align 2, !dbg !134
  %add = add i16 %6, 2, !dbg !136
  %7 = inttoptr i16 %add to i8*, !dbg !137
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !138, metadata !DIExpression()), !dbg !140
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !140, !srcloc !141
  store i16 %8, i16* %__x5, align 2, !dbg !140
  %9 = load i16, i16* %__x5, align 2, !dbg !140
  store i16 %9, i16* %tmp6, align 2, !dbg !140
  %10 = load i16, i16* %tmp6, align 2, !dbg !140
  %add7 = add i16 %10, 2, !dbg !142
  %sub = sub i16 9216, %add7, !dbg !143
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !144
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !145
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !146
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !146
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !147
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 186, i16 zeroext %13), !dbg !148
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !149
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !150
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !152
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !153
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !153
  %cmp9 = icmp eq i16 %14, %16, !dbg !154
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !155

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !156
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !158
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !159
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !158
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 188, i1 false), !dbg !158
  call void @camel_init(), !dbg !160
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !161
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !162
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !161
  call void @__restore_registers(i16* %arraydecay), !dbg !163
  br label %if.end13, !dbg !164

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !165
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !167
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %result, i16 %seed) #0 !dbg !168 {
entry:
  %result.addr = alloca %struct.threeAxis_t_8*, align 2
  %seed.addr = alloca i16, align 2
  store %struct.threeAxis_t_8* %result, %struct.threeAxis_t_8** %result.addr, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %result.addr, metadata !172, metadata !DIExpression()), !dbg !173
  store i16 %seed, i16* %seed.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %seed.addr, metadata !174, metadata !DIExpression()), !dbg !175
  %0 = load i16, i16* %seed.addr, align 2, !dbg !176
  %mul = mul i16 %0, 17, !dbg !177
  %rem = urem i16 %mul, 85, !dbg !178
  %conv = trunc i16 %rem to i8, !dbg !179
  %1 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !180
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %1, i32 0, i32 0, !dbg !181
  store i8 %conv, i8* %x, align 1, !dbg !182
  %2 = load i16, i16* %seed.addr, align 2, !dbg !183
  %mul1 = mul i16 %2, 17, !dbg !184
  %mul2 = mul i16 %mul1, 17, !dbg !185
  %rem3 = urem i16 %mul2, 85, !dbg !186
  %conv4 = trunc i16 %rem3 to i8, !dbg !187
  %3 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !188
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %3, i32 0, i32 1, !dbg !189
  store i8 %conv4, i8* %y, align 1, !dbg !190
  %4 = load i16, i16* %seed.addr, align 2, !dbg !191
  %mul5 = mul i16 %4, 17, !dbg !192
  %mul6 = mul i16 %mul5, 17, !dbg !193
  %mul7 = mul i16 %mul6, 17, !dbg !194
  %rem8 = urem i16 %mul7, 85, !dbg !195
  %conv9 = trunc i16 %rem8 to i8, !dbg !196
  %5 = load %struct.threeAxis_t_8*, %struct.threeAxis_t_8** %result.addr, align 2, !dbg !197
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %5, i32 0, i32 2, !dbg !198
  store i8 %conv9, i8* %z, align 1, !dbg !199
  %6 = load i16, i16* %seed.addr, align 2, !dbg !200
  %inc = add i16 %6, 1, !dbg !200
  store i16 %inc, i16* %seed.addr, align 2, !dbg !200
  %7 = load i16, i16* %seed.addr, align 2, !dbg !201
  ret i16 %7, !dbg !202
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !203 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !204
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !204
  store i16 3, i16* %pinState, align 2, !dbg !205
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !206
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !206
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !206
  store i16 0, i16* %count, align 2, !dbg !207
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !208
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !208
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !208
  store i16 1, i16* %seed, align 2, !dbg !209
  ret void, !dbg !210
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_selectMode() #0 !dbg !211 {
entry:
  %pin_state = alloca i16, align 2
  %mode = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %pin_state, metadata !212, metadata !DIExpression()), !dbg !213
  store i16 1, i16* %pin_state, align 2, !dbg !213
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !214
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !214
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !214
  %1 = load i16, i16* %count, align 2, !dbg !215
  %inc = add i16 %1, 1, !dbg !215
  store i16 %inc, i16* %count, align 2, !dbg !215
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !216
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !216
  %count2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 14, !dbg !216
  %3 = load i16, i16* %count2, align 2, !dbg !216
  %cmp = icmp uge i16 %3, 3, !dbg !218
  br i1 %cmp, label %if.then, label %if.end, !dbg !219

if.then:                                          ; preds = %entry
  store i16 2, i16* %pin_state, align 2, !dbg !220
  br label %if.end, !dbg !221

if.end:                                           ; preds = %if.then, %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !222
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !222
  %count4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 14, !dbg !222
  %5 = load i16, i16* %count4, align 2, !dbg !222
  %cmp5 = icmp uge i16 %5, 5, !dbg !224
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !225

if.then6:                                         ; preds = %if.end
  store i16 0, i16* %pin_state, align 2, !dbg !226
  br label %if.end7, !dbg !227

if.end7:                                          ; preds = %if.then6, %if.end
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !228
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !228
  %count9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 14, !dbg !228
  %7 = load i16, i16* %count9, align 2, !dbg !228
  %cmp10 = icmp uge i16 %7, 7, !dbg !230
  br i1 %cmp10, label %if.then11, label %if.end12, !dbg !231

if.then11:                                        ; preds = %if.end7
  call void @task_done(), !dbg !232
  br label %if.end12, !dbg !234

if.end12:                                         ; preds = %if.then11, %if.end7
  call void @llvm.dbg.declare(metadata i16* %mode, metadata !235, metadata !DIExpression()), !dbg !236
  call void @llvm.dbg.declare(metadata i16* %class, metadata !237, metadata !DIExpression()), !dbg !238
  %8 = load i16, i16* %pin_state, align 2, !dbg !239
  %cmp13 = icmp eq i16 %8, 2, !dbg !241
  br i1 %cmp13, label %land.lhs.true, label %lor.lhs.false, !dbg !242

lor.lhs.false:                                    ; preds = %if.end12
  %9 = load i16, i16* %pin_state, align 2, !dbg !243
  %cmp14 = icmp eq i16 %9, 1, !dbg !244
  br i1 %cmp14, label %land.lhs.true, label %if.else, !dbg !245

land.lhs.true:                                    ; preds = %lor.lhs.false, %if.end12
  %10 = load i16, i16* %pin_state, align 2, !dbg !246
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !247
  %pinState = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 0, !dbg !247
  %12 = load i16, i16* %pinState, align 2, !dbg !247
  %cmp16 = icmp eq i16 %10, %12, !dbg !248
  br i1 %cmp16, label %if.then17, label %if.else, !dbg !249

if.then17:                                        ; preds = %land.lhs.true
  store i16 3, i16* %pin_state, align 2, !dbg !250
  br label %if.end20, !dbg !252

if.else:                                          ; preds = %land.lhs.true, %lor.lhs.false
  %13 = load i16, i16* %pin_state, align 2, !dbg !253
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !255
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !255
  %pinState19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 0, !dbg !255
  store i16 %13, i16* %pinState19, align 2, !dbg !256
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then17
  %15 = load i16, i16* %pin_state, align 2, !dbg !257
  switch i16 %15, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb27
    i16 0, label %sw.bb36
  ], !dbg !258

sw.bb:                                            ; preds = %if.end20
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !259
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !259
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 1, !dbg !259
  store i16 0, i16* %discardedSamplesCount, align 2, !dbg !261
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !262
  %mode23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 12, !dbg !262
  store i16 2, i16* %mode23, align 2, !dbg !263
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !264
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !264
  %class25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 2, !dbg !264
  store i16 0, i16* %class25, align 2, !dbg !265
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !266
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1, !dbg !266
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 11, !dbg !266
  store i16 0, i16* %samplesInWindow, align 2, !dbg !267
  br label %sw.epilog, !dbg !268

sw.bb27:                                          ; preds = %if.end20
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !269
  %globals28 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !269
  %discardedSamplesCount29 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals28, i32 0, i32 1, !dbg !269
  store i16 0, i16* %discardedSamplesCount29, align 2, !dbg !270
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !271
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !271
  %mode31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 12, !dbg !271
  store i16 1, i16* %mode31, align 2, !dbg !272
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !273
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !273
  %class33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 2, !dbg !273
  store i16 1, i16* %class33, align 2, !dbg !274
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !275
  %samplesInWindow35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 11, !dbg !275
  store i16 0, i16* %samplesInWindow35, align 2, !dbg !276
  br label %sw.epilog, !dbg !277

sw.bb36:                                          ; preds = %if.end20
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !278
  %mode38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 12, !dbg !278
  store i16 0, i16* %mode38, align 2, !dbg !279
  br label %sw.epilog, !dbg !280

sw.default:                                       ; preds = %if.end20
  br label %sw.epilog, !dbg !281

sw.epilog:                                        ; preds = %sw.default, %sw.bb36, %sw.bb27, %sw.bb
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_resetStats() #0 !dbg !283 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !284
  %movingCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 4, !dbg !284
  store i16 0, i16* %movingCount, align 2, !dbg !285
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !286
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !286
  %stationaryCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 5, !dbg !286
  store i16 0, i16* %stationaryCount, align 2, !dbg !287
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !288
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 3, !dbg !288
  store i16 0, i16* %totalCount, align 2, !dbg !289
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !290
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !290
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 11, !dbg !290
  store i16 0, i16* %samplesInWindow, align 2, !dbg !291
  ret void, !dbg !292
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_sample() #0 !dbg !293 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  br label %while.cond, !dbg !294

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !295
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !295
  %samplesInWindow = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 11, !dbg !295
  %1 = load i16, i16* %samplesInWindow, align 2, !dbg !295
  %cmp = icmp ult i16 %1, 3, !dbg !296
  br i1 %cmp, label %while.body, label %while.end, !dbg !294

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !297, metadata !DIExpression()), !dbg !299
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !300
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !300
  %3 = load i16, i16* %seed, align 2, !dbg !300
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %3), !dbg !301
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !302
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !302
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !302
  store i16 %call, i16* %seed3, align 2, !dbg !303
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !304
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !304
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6, !dbg !304
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !305
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !305
  %samplesInWindow6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 11, !dbg !305
  %7 = load i16, i16* %samplesInWindow6, align 2, !dbg !305
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %7, !dbg !304
  %8 = bitcast %struct.threeAxis_t_8* %arrayidx to i8*, !dbg !306
  %9 = bitcast %struct.threeAxis_t_8* %sample to i8*, !dbg !306
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 1 %8, i8* align 1 %9, i16 3, i1 false), !dbg !306
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !307
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !307
  %samplesInWindow8 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 11, !dbg !307
  %11 = load i16, i16* %samplesInWindow8, align 2, !dbg !308
  %inc = add i16 %11, 1, !dbg !308
  store i16 %inc, i16* %samplesInWindow8, align 2, !dbg !308
  br label %while.cond, !dbg !294, !llvm.loop !309

while.end:                                        ; preds = %while.cond
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !311
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !311
  %samplesInWindow10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 11, !dbg !311
  store i16 0, i16* %samplesInWindow10, align 2, !dbg !312
  ret void, !dbg !313
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_transform() #0 !dbg !314 {
entry:
  %i = alloca i16, align 2
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  call void @llvm.dbg.declare(metadata i16* %i, metadata !315, metadata !DIExpression()), !dbg !316
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !317, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !320, metadata !DIExpression()), !dbg !321
  store i16 0, i16* %i, align 2, !dbg !322
  br label %for.cond, !dbg !324

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !325
  %cmp = icmp ult i16 %0, 3, !dbg !327
  br i1 %cmp, label %for.body, label %for.end, !dbg !328

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !329
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !329
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !329
  %2 = load i16, i16* %i, align 2, !dbg !332
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !329
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !333
  %3 = load i8, i8* %x, align 1, !dbg !333
  %conv = sext i8 %3 to i16, !dbg !329
  %cmp1 = icmp slt i16 %conv, 10, !dbg !334
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !335

lor.lhs.false:                                    ; preds = %for.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !336
  %window4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !336
  %5 = load i16, i16* %i, align 2, !dbg !337
  %arrayidx5 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window4, i16 0, i16 %5, !dbg !336
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx5, i32 0, i32 1, !dbg !338
  %6 = load i8, i8* %y, align 1, !dbg !338
  %conv6 = sext i8 %6 to i16, !dbg !336
  %cmp7 = icmp slt i16 %conv6, 10, !dbg !339
  br i1 %cmp7, label %if.then, label %lor.lhs.false9, !dbg !340

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !341
  %window11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !341
  %8 = load i16, i16* %i, align 2, !dbg !342
  %arrayidx12 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window11, i16 0, i16 %8, !dbg !341
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx12, i32 0, i32 2, !dbg !343
  %9 = load i8, i8* %z, align 1, !dbg !343
  %conv13 = sext i8 %9 to i16, !dbg !341
  %cmp14 = icmp slt i16 %conv13, 10, !dbg !344
  br i1 %cmp14, label %if.then, label %if.end, !dbg !345

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false, %for.body
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !346
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !346
  %window17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 6, !dbg !346
  %11 = load i16, i16* %i, align 2, !dbg !348
  %arrayidx18 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window17, i16 0, i16 %11, !dbg !346
  %x19 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx18, i32 0, i32 0, !dbg !349
  %12 = load i8, i8* %x19, align 1, !dbg !349
  %conv20 = sext i8 %12 to i16, !dbg !346
  %cmp21 = icmp sgt i16 %conv20, 10, !dbg !350
  br i1 %cmp21, label %cond.true, label %cond.false, !dbg !351

cond.true:                                        ; preds = %if.then
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !352
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !352
  %window24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 6, !dbg !352
  %14 = load i16, i16* %i, align 2, !dbg !353
  %arrayidx25 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window24, i16 0, i16 %14, !dbg !352
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx25, i32 0, i32 0, !dbg !354
  %15 = load i8, i8* %x26, align 1, !dbg !354
  %conv27 = sext i8 %15 to i16, !dbg !352
  br label %cond.end, !dbg !351

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !351

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv27, %cond.true ], [ 0, %cond.false ], !dbg !351
  %conv28 = trunc i16 %cond to i8, !dbg !351
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !355
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !355
  %window30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 6, !dbg !355
  %17 = load i16, i16* %i, align 2, !dbg !356
  %arrayidx31 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window30, i16 0, i16 %17, !dbg !355
  %x32 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx31, i32 0, i32 0, !dbg !357
  store i8 %conv28, i8* %x32, align 1, !dbg !358
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !359
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !359
  %window34 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals33, i32 0, i32 6, !dbg !359
  %19 = load i16, i16* %i, align 2, !dbg !360
  %arrayidx35 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window34, i16 0, i16 %19, !dbg !359
  %y36 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx35, i32 0, i32 1, !dbg !361
  %20 = load i8, i8* %y36, align 1, !dbg !361
  %conv37 = sext i8 %20 to i16, !dbg !359
  %cmp38 = icmp sgt i16 %conv37, 10, !dbg !362
  br i1 %cmp38, label %cond.true40, label %cond.false46, !dbg !363

cond.true40:                                      ; preds = %cond.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !364
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !364
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !364
  %22 = load i16, i16* %i, align 2, !dbg !365
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %22, !dbg !364
  %y44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 1, !dbg !366
  %23 = load i8, i8* %y44, align 1, !dbg !366
  %conv45 = sext i8 %23 to i16, !dbg !364
  br label %cond.end47, !dbg !363

cond.false46:                                     ; preds = %cond.end
  br label %cond.end47, !dbg !363

cond.end47:                                       ; preds = %cond.false46, %cond.true40
  %cond48 = phi i16 [ %conv45, %cond.true40 ], [ 0, %cond.false46 ], !dbg !363
  %conv49 = trunc i16 %cond48 to i8, !dbg !363
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !367
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !367
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !367
  %25 = load i16, i16* %i, align 2, !dbg !368
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %25, !dbg !367
  %y53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 1, !dbg !369
  store i8 %conv49, i8* %y53, align 1, !dbg !370
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !371
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !371
  %window55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 6, !dbg !371
  %27 = load i16, i16* %i, align 2, !dbg !372
  %arrayidx56 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window55, i16 0, i16 %27, !dbg !371
  %z57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx56, i32 0, i32 2, !dbg !373
  %28 = load i8, i8* %z57, align 1, !dbg !373
  %conv58 = sext i8 %28 to i16, !dbg !371
  %cmp59 = icmp sgt i16 %conv58, 10, !dbg !374
  br i1 %cmp59, label %cond.true61, label %cond.false67, !dbg !375

cond.true61:                                      ; preds = %cond.end47
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !376
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !376
  %window63 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals62, i32 0, i32 6, !dbg !376
  %30 = load i16, i16* %i, align 2, !dbg !377
  %arrayidx64 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window63, i16 0, i16 %30, !dbg !376
  %z65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx64, i32 0, i32 2, !dbg !378
  %31 = load i8, i8* %z65, align 1, !dbg !378
  %conv66 = sext i8 %31 to i16, !dbg !376
  br label %cond.end68, !dbg !375

cond.false67:                                     ; preds = %cond.end47
  br label %cond.end68, !dbg !375

cond.end68:                                       ; preds = %cond.false67, %cond.true61
  %cond69 = phi i16 [ %conv66, %cond.true61 ], [ 0, %cond.false67 ], !dbg !375
  %conv70 = trunc i16 %cond69 to i8, !dbg !375
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !379
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !379
  %window72 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals71, i32 0, i32 6, !dbg !379
  %33 = load i16, i16* %i, align 2, !dbg !380
  %arrayidx73 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window72, i16 0, i16 %33, !dbg !379
  %z74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx73, i32 0, i32 2, !dbg !381
  store i8 %conv70, i8* %z74, align 1, !dbg !382
  br label %if.end, !dbg !383

if.end:                                           ; preds = %cond.end68, %lor.lhs.false9
  br label %for.inc, !dbg !384

for.inc:                                          ; preds = %if.end
  %34 = load i16, i16* %i, align 2, !dbg !385
  %inc = add i16 %34, 1, !dbg !385
  store i16 %inc, i16* %i, align 2, !dbg !385
  br label %for.cond, !dbg !386, !llvm.loop !387

for.end:                                          ; preds = %for.cond
  ret void, !dbg !389
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_featurize() #0 !dbg !390 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !391, metadata !DIExpression()), !dbg !392
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !393, metadata !DIExpression()), !dbg !394
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !395
  store i8 0, i8* %z, align 1, !dbg !396
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !397
  store i8 0, i8* %y, align 1, !dbg !398
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !399
  store i8 0, i8* %x, align 1, !dbg !400
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !401
  store i8 0, i8* %z1, align 1, !dbg !402
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !403
  store i8 0, i8* %y2, align 1, !dbg !404
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !405
  store i8 0, i8* %x3, align 1, !dbg !406
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !407, metadata !DIExpression()), !dbg !408
  call void @llvm.dbg.declare(metadata i16* %i, metadata !409, metadata !DIExpression()), !dbg !411
  store i16 0, i16* %i, align 2, !dbg !412
  br label %for.cond, !dbg !414

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !415
  %cmp = icmp slt i16 %0, 3, !dbg !417
  br i1 %cmp, label %for.body, label %for.end, !dbg !418

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !419
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !419
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !419
  %2 = load i16, i16* %i, align 2, !dbg !421
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !419
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !422
  %3 = load i8, i8* %x4, align 1, !dbg !422
  %conv = sext i8 %3 to i16, !dbg !419
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !423
  %4 = load i8, i8* %x5, align 1, !dbg !424
  %conv6 = sext i8 %4 to i16, !dbg !424
  %add = add nsw i16 %conv6, %conv, !dbg !424
  %conv7 = trunc i16 %add to i8, !dbg !424
  store i8 %conv7, i8* %x5, align 1, !dbg !424
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !425
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !425
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !425
  %6 = load i16, i16* %i, align 2, !dbg !426
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %6, !dbg !425
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !427
  %7 = load i8, i8* %y11, align 1, !dbg !427
  %conv12 = sext i8 %7 to i16, !dbg !425
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !428
  %8 = load i8, i8* %y13, align 1, !dbg !429
  %conv14 = sext i8 %8 to i16, !dbg !429
  %add15 = add nsw i16 %conv14, %conv12, !dbg !429
  %conv16 = trunc i16 %add15 to i8, !dbg !429
  store i8 %conv16, i8* %y13, align 1, !dbg !429
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !430
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !430
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !430
  %10 = load i16, i16* %i, align 2, !dbg !431
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %10, !dbg !430
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !432
  %11 = load i8, i8* %z20, align 1, !dbg !432
  %conv21 = sext i8 %11 to i16, !dbg !430
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !433
  %12 = load i8, i8* %z22, align 1, !dbg !434
  %conv23 = sext i8 %12 to i16, !dbg !434
  %add24 = add nsw i16 %conv23, %conv21, !dbg !434
  %conv25 = trunc i16 %add24 to i8, !dbg !434
  store i8 %conv25, i8* %z22, align 1, !dbg !434
  br label %for.inc, !dbg !435

for.inc:                                          ; preds = %for.body
  %13 = load i16, i16* %i, align 2, !dbg !436
  %inc = add nsw i16 %13, 1, !dbg !436
  store i16 %inc, i16* %i, align 2, !dbg !436
  br label %for.cond, !dbg !437, !llvm.loop !438

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !440
  %14 = load i8, i8* %x26, align 1, !dbg !441
  %conv27 = sext i8 %14 to i16, !dbg !441
  %shr = ashr i16 %conv27, 2, !dbg !441
  %conv28 = trunc i16 %shr to i8, !dbg !441
  store i8 %conv28, i8* %x26, align 1, !dbg !441
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !442
  %15 = load i8, i8* %y29, align 1, !dbg !443
  %conv30 = sext i8 %15 to i16, !dbg !443
  %shr31 = ashr i16 %conv30, 2, !dbg !443
  %conv32 = trunc i16 %shr31 to i8, !dbg !443
  store i8 %conv32, i8* %y29, align 1, !dbg !443
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !444
  %16 = load i8, i8* %z33, align 1, !dbg !445
  %conv34 = sext i8 %16 to i16, !dbg !445
  %shr35 = ashr i16 %conv34, 2, !dbg !445
  %conv36 = trunc i16 %shr35 to i8, !dbg !445
  store i8 %conv36, i8* %z33, align 1, !dbg !445
  store i16 0, i16* %i, align 2, !dbg !446
  br label %for.cond37, !dbg !448

for.cond37:                                       ; preds = %for.inc135, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !449
  %cmp38 = icmp slt i16 %17, 3, !dbg !451
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !452

for.body40:                                       ; preds = %for.cond37
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !453
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !453
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !453
  %19 = load i16, i16* %i, align 2, !dbg !455
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %19, !dbg !453
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !456
  %20 = load i8, i8* %x44, align 1, !dbg !456
  %conv45 = sext i8 %20 to i16, !dbg !453
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !457
  %21 = load i8, i8* %x46, align 1, !dbg !457
  %conv47 = sext i8 %21 to i16, !dbg !458
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !459
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !453

cond.true:                                        ; preds = %for.body40
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !460
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !460
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !460
  %23 = load i16, i16* %i, align 2, !dbg !461
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %23, !dbg !460
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !462
  %24 = load i8, i8* %x53, align 1, !dbg !462
  %conv54 = sext i8 %24 to i16, !dbg !460
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !463
  %25 = load i8, i8* %x55, align 1, !dbg !463
  %conv56 = sext i8 %25 to i16, !dbg !464
  %sub = sub nsw i16 %conv54, %conv56, !dbg !465
  br label %cond.end, !dbg !453

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !466
  %26 = load i8, i8* %x57, align 1, !dbg !466
  %conv58 = sext i8 %26 to i16, !dbg !467
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !468
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !468
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !468
  %28 = load i16, i16* %i, align 2, !dbg !469
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %28, !dbg !468
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !470
  %29 = load i8, i8* %x62, align 1, !dbg !470
  %conv63 = sext i8 %29 to i16, !dbg !468
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !471
  br label %cond.end, !dbg !453

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !453
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !472
  %30 = load i8, i8* %x65, align 1, !dbg !473
  %conv66 = sext i8 %30 to i16, !dbg !473
  %add67 = add nsw i16 %conv66, %cond, !dbg !473
  %conv68 = trunc i16 %add67 to i8, !dbg !473
  store i8 %conv68, i8* %x65, align 1, !dbg !473
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !474
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !474
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !474
  %32 = load i16, i16* %i, align 2, !dbg !475
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %32, !dbg !474
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !476
  %33 = load i8, i8* %y72, align 1, !dbg !476
  %conv73 = sext i8 %33 to i16, !dbg !474
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !477
  %34 = load i8, i8* %y74, align 1, !dbg !477
  %conv75 = sext i8 %34 to i16, !dbg !478
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !479
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !474

cond.true78:                                      ; preds = %cond.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !480
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !480
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !480
  %36 = load i16, i16* %i, align 2, !dbg !481
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %36, !dbg !480
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !482
  %37 = load i8, i8* %y82, align 1, !dbg !482
  %conv83 = sext i8 %37 to i16, !dbg !480
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !483
  %38 = load i8, i8* %y84, align 1, !dbg !483
  %conv85 = sext i8 %38 to i16, !dbg !484
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !485
  br label %cond.end96, !dbg !474

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !486
  %39 = load i8, i8* %y88, align 1, !dbg !486
  %conv89 = sext i8 %39 to i16, !dbg !487
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !488
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !488
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !488
  %41 = load i16, i16* %i, align 2, !dbg !489
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %41, !dbg !488
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !490
  %42 = load i8, i8* %y93, align 1, !dbg !490
  %conv94 = sext i8 %42 to i16, !dbg !488
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !491
  br label %cond.end96, !dbg !474

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !474
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !492
  %43 = load i8, i8* %y98, align 1, !dbg !493
  %conv99 = sext i8 %43 to i16, !dbg !493
  %add100 = add nsw i16 %conv99, %cond97, !dbg !493
  %conv101 = trunc i16 %add100 to i8, !dbg !493
  store i8 %conv101, i8* %y98, align 1, !dbg !493
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !494
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !494
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !494
  %45 = load i16, i16* %i, align 2, !dbg !495
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %45, !dbg !494
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !496
  %46 = load i8, i8* %z105, align 1, !dbg !496
  %conv106 = sext i8 %46 to i16, !dbg !494
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !497
  %47 = load i8, i8* %z107, align 1, !dbg !497
  %conv108 = sext i8 %47 to i16, !dbg !498
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !499
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !494

cond.true111:                                     ; preds = %cond.end96
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !500
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !500
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !500
  %49 = load i16, i16* %i, align 2, !dbg !501
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %49, !dbg !500
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !502
  %50 = load i8, i8* %z115, align 1, !dbg !502
  %conv116 = sext i8 %50 to i16, !dbg !500
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !503
  %51 = load i8, i8* %z117, align 1, !dbg !503
  %conv118 = sext i8 %51 to i16, !dbg !504
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !505
  br label %cond.end129, !dbg !494

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !506
  %52 = load i8, i8* %z121, align 1, !dbg !506
  %conv122 = sext i8 %52 to i16, !dbg !507
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !508
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1, !dbg !508
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !508
  %54 = load i16, i16* %i, align 2, !dbg !509
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %54, !dbg !508
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !510
  %55 = load i8, i8* %z126, align 1, !dbg !510
  %conv127 = sext i8 %55 to i16, !dbg !508
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !511
  br label %cond.end129, !dbg !494

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !494
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !512
  %56 = load i8, i8* %z131, align 1, !dbg !513
  %conv132 = sext i8 %56 to i16, !dbg !513
  %add133 = add nsw i16 %conv132, %cond130, !dbg !513
  %conv134 = trunc i16 %add133 to i8, !dbg !513
  store i8 %conv134, i8* %z131, align 1, !dbg !513
  br label %for.inc135, !dbg !514

for.inc135:                                       ; preds = %cond.end129
  %57 = load i16, i16* %i, align 2, !dbg !515
  %inc136 = add nsw i16 %57, 1, !dbg !515
  store i16 %inc136, i16* %i, align 2, !dbg !515
  br label %for.cond37, !dbg !516, !llvm.loop !517

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !519
  %58 = load i8, i8* %x138, align 1, !dbg !520
  %conv139 = sext i8 %58 to i16, !dbg !520
  %shr140 = ashr i16 %conv139, 2, !dbg !520
  %conv141 = trunc i16 %shr140 to i8, !dbg !520
  store i8 %conv141, i8* %x138, align 1, !dbg !520
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !521
  %59 = load i8, i8* %y142, align 1, !dbg !522
  %conv143 = sext i8 %59 to i16, !dbg !522
  %shr144 = ashr i16 %conv143, 2, !dbg !522
  %conv145 = trunc i16 %shr144 to i8, !dbg !522
  store i8 %conv145, i8* %y142, align 1, !dbg !522
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !523
  %60 = load i8, i8* %z146, align 1, !dbg !524
  %conv147 = sext i8 %60 to i16, !dbg !524
  %shr148 = ashr i16 %conv147, 2, !dbg !524
  %conv149 = trunc i16 %shr148 to i8, !dbg !524
  store i8 %conv149, i8* %z146, align 1, !dbg !524
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !525, metadata !DIExpression()), !dbg !526
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !527
  %61 = load i8, i8* %x150, align 1, !dbg !527
  %conv151 = sext i8 %61 to i16, !dbg !528
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !529
  %62 = load i8, i8* %x152, align 1, !dbg !529
  %conv153 = sext i8 %62 to i16, !dbg !530
  %mul = mul nsw i16 %conv151, %conv153, !dbg !531
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !532
  %63 = load i8, i8* %y154, align 1, !dbg !532
  %conv155 = sext i8 %63 to i16, !dbg !533
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !534
  %64 = load i8, i8* %y156, align 1, !dbg !534
  %conv157 = sext i8 %64 to i16, !dbg !535
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !536
  %add159 = add nsw i16 %mul, %mul158, !dbg !537
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !538
  %65 = load i8, i8* %z160, align 1, !dbg !538
  %conv161 = sext i8 %65 to i16, !dbg !539
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !540
  %66 = load i8, i8* %z162, align 1, !dbg !540
  %conv163 = sext i8 %66 to i16, !dbg !541
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !542
  %add165 = add nsw i16 %add159, %mul164, !dbg !543
  store i16 %add165, i16* %meanmag, align 2, !dbg !526
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !544, metadata !DIExpression()), !dbg !545
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !546
  %67 = load i8, i8* %x166, align 1, !dbg !546
  %conv167 = sext i8 %67 to i16, !dbg !547
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !548
  %68 = load i8, i8* %x168, align 1, !dbg !548
  %conv169 = sext i8 %68 to i16, !dbg !549
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !550
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !551
  %69 = load i8, i8* %y171, align 1, !dbg !551
  %conv172 = sext i8 %69 to i16, !dbg !552
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !553
  %70 = load i8, i8* %y173, align 1, !dbg !553
  %conv174 = sext i8 %70 to i16, !dbg !554
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !555
  %add176 = add nsw i16 %mul170, %mul175, !dbg !556
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !557
  %71 = load i8, i8* %z177, align 1, !dbg !557
  %conv178 = sext i8 %71 to i16, !dbg !558
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !559
  %72 = load i8, i8* %z179, align 1, !dbg !559
  %conv180 = sext i8 %72 to i16, !dbg !560
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !561
  %add182 = add nsw i16 %add176, %mul181, !dbg !562
  store i16 %add182, i16* %stddevmag, align 2, !dbg !545
  %73 = load i16, i16* %meanmag, align 2, !dbg !563
  %call = call i16 bitcast (i16 (...)* @sqrt16 to i16 (i16)*)(i16 %73), !dbg !564
  %meanmag183 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !565
  store i16 %call, i16* %meanmag183, align 2, !dbg !566
  %74 = load i16, i16* %stddevmag, align 2, !dbg !567
  %call184 = call i16 bitcast (i16 (...)* @sqrt16 to i16 (i16)*)(i16 %74), !dbg !568
  %stddevmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !569
  store i16 %call184, i16* %stddevmag185, align 2, !dbg !570
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !571
  %globals186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1, !dbg !571
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals186, i32 0, i32 12, !dbg !571
  %76 = load i16, i16* %mode, align 2, !dbg !571
  switch i16 %76, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb189
  ], !dbg !572

sw.bb:                                            ; preds = %for.end137, %for.end137
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !573
  %globals187 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 1, !dbg !573
  %features188 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals187, i32 0, i32 7, !dbg !573
  %78 = bitcast %struct.features_t* %features188 to i8*, !dbg !575
  %79 = bitcast %struct.features_t* %features to i8*, !dbg !575
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %78, i8* align 2 %79, i16 4, i1 false), !dbg !575
  br label %sw.epilog, !dbg !576

sw.bb189:                                         ; preds = %for.end137
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !577
  %globals190 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 1, !dbg !577
  %features191 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals190, i32 0, i32 7, !dbg !577
  %81 = bitcast %struct.features_t* %features191 to i8*, !dbg !578
  %82 = bitcast %struct.features_t* %features to i8*, !dbg !578
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %81, i8* align 2 %82, i16 4, i1 false), !dbg !578
  br label %sw.epilog, !dbg !579

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !580

sw.epilog:                                        ; preds = %sw.default, %sw.bb189, %sw.bb
  ret void, !dbg !581
}

declare dso_local i16 @sqrt16(...) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_classify() #0 !dbg !582 {
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
  call void @llvm.dbg.declare(metadata i16* %move_less_error, metadata !583, metadata !DIExpression()), !dbg !584
  store i16 0, i16* %move_less_error, align 2, !dbg !584
  call void @llvm.dbg.declare(metadata i16* %stat_less_error, metadata !585, metadata !DIExpression()), !dbg !586
  store i16 0, i16* %stat_less_error, align 2, !dbg !586
  call void @llvm.dbg.declare(metadata i16* %i, metadata !587, metadata !DIExpression()), !dbg !588
  call void @llvm.dbg.declare(metadata i16* %class, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata i32* %meanmag, metadata !591, metadata !DIExpression()), !dbg !593
  call void @llvm.dbg.declare(metadata i32* %stddevmag, metadata !594, metadata !DIExpression()), !dbg !595
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !596
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !596
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !596
  %meanmag1 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !597
  %1 = load i16, i16* %meanmag1, align 2, !dbg !597
  %conv = zext i16 %1 to i32, !dbg !596
  store i32 %conv, i32* %meanmag, align 2, !dbg !598
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !599
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !599
  %features3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !599
  %stddevmag4 = getelementptr inbounds %struct.features_t, %struct.features_t* %features3, i32 0, i32 1, !dbg !600
  %3 = load i16, i16* %stddevmag4, align 2, !dbg !600
  %conv5 = zext i16 %3 to i32, !dbg !599
  store i32 %conv5, i32* %stddevmag, align 2, !dbg !601
  store i16 0, i16* %i, align 2, !dbg !602
  br label %for.cond, !dbg !604

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i16, i16* %i, align 2, !dbg !605
  %cmp = icmp slt i16 %4, 16, !dbg !607
  br i1 %cmp, label %for.body, label %for.end, !dbg !608

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i32* %stat_mean_err, metadata !609, metadata !DIExpression()), !dbg !611
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !612
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !612
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 8, !dbg !612
  %6 = load i16, i16* %i, align 2, !dbg !613
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %6, !dbg !612
  %meanmag8 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx, i32 0, i32 0, !dbg !614
  %7 = load i16, i16* %meanmag8, align 2, !dbg !614
  %conv9 = zext i16 %7 to i32, !dbg !612
  %8 = load i32, i32* %meanmag, align 2, !dbg !615
  %cmp10 = icmp sgt i32 %conv9, %8, !dbg !616
  br i1 %cmp10, label %cond.true, label %cond.false, !dbg !617

cond.true:                                        ; preds = %for.body
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !618
  %globals12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !618
  %model_stationary13 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals12, i32 0, i32 8, !dbg !618
  %10 = load i16, i16* %i, align 2, !dbg !619
  %arrayidx14 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary13, i16 0, i16 %10, !dbg !618
  %meanmag15 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx14, i32 0, i32 0, !dbg !620
  %11 = load i16, i16* %meanmag15, align 2, !dbg !620
  %conv16 = zext i16 %11 to i32, !dbg !618
  %12 = load i32, i32* %meanmag, align 2, !dbg !621
  %sub = sub nsw i32 %conv16, %12, !dbg !622
  br label %cond.end, !dbg !617

cond.false:                                       ; preds = %for.body
  %13 = load i32, i32* %meanmag, align 2, !dbg !623
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !624
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !624
  %model_stationary18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 8, !dbg !624
  %15 = load i16, i16* %i, align 2, !dbg !625
  %arrayidx19 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary18, i16 0, i16 %15, !dbg !624
  %meanmag20 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx19, i32 0, i32 0, !dbg !626
  %16 = load i16, i16* %meanmag20, align 2, !dbg !626
  %conv21 = zext i16 %16 to i32, !dbg !624
  %sub22 = sub nsw i32 %13, %conv21, !dbg !627
  br label %cond.end, !dbg !617

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub22, %cond.false ], !dbg !617
  store i32 %cond, i32* %stat_mean_err, align 2, !dbg !611
  call void @llvm.dbg.declare(metadata i32* %stat_sd_err, metadata !628, metadata !DIExpression()), !dbg !629
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !630
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !630
  %model_stationary24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 8, !dbg !630
  %18 = load i16, i16* %i, align 2, !dbg !631
  %arrayidx25 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary24, i16 0, i16 %18, !dbg !630
  %stddevmag26 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx25, i32 0, i32 1, !dbg !632
  %19 = load i16, i16* %stddevmag26, align 2, !dbg !632
  %conv27 = zext i16 %19 to i32, !dbg !630
  %20 = load i32, i32* %stddevmag, align 2, !dbg !633
  %cmp28 = icmp sgt i32 %conv27, %20, !dbg !634
  br i1 %cmp28, label %cond.true30, label %cond.false37, !dbg !635

cond.true30:                                      ; preds = %cond.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !636
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !636
  %model_stationary32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8, !dbg !636
  %22 = load i16, i16* %i, align 2, !dbg !637
  %arrayidx33 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary32, i16 0, i16 %22, !dbg !636
  %stddevmag34 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx33, i32 0, i32 1, !dbg !638
  %23 = load i16, i16* %stddevmag34, align 2, !dbg !638
  %conv35 = zext i16 %23 to i32, !dbg !636
  %24 = load i32, i32* %stddevmag, align 2, !dbg !639
  %sub36 = sub nsw i32 %conv35, %24, !dbg !640
  br label %cond.end44, !dbg !635

cond.false37:                                     ; preds = %cond.end
  %25 = load i32, i32* %stddevmag, align 2, !dbg !641
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !642
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !642
  %model_stationary39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8, !dbg !642
  %27 = load i16, i16* %i, align 2, !dbg !643
  %arrayidx40 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary39, i16 0, i16 %27, !dbg !642
  %stddevmag41 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx40, i32 0, i32 1, !dbg !644
  %28 = load i16, i16* %stddevmag41, align 2, !dbg !644
  %conv42 = zext i16 %28 to i32, !dbg !642
  %sub43 = sub nsw i32 %25, %conv42, !dbg !645
  br label %cond.end44, !dbg !635

cond.end44:                                       ; preds = %cond.false37, %cond.true30
  %cond45 = phi i32 [ %sub36, %cond.true30 ], [ %sub43, %cond.false37 ], !dbg !635
  store i32 %cond45, i32* %stat_sd_err, align 2, !dbg !629
  call void @llvm.dbg.declare(metadata i32* %move_mean_err, metadata !646, metadata !DIExpression()), !dbg !647
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !648
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !648
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 9, !dbg !648
  %30 = load i16, i16* %i, align 2, !dbg !649
  %arrayidx47 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %30, !dbg !648
  %meanmag48 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx47, i32 0, i32 0, !dbg !650
  %31 = load i16, i16* %meanmag48, align 2, !dbg !650
  %conv49 = zext i16 %31 to i32, !dbg !648
  %32 = load i32, i32* %meanmag, align 2, !dbg !651
  %cmp50 = icmp sgt i32 %conv49, %32, !dbg !652
  br i1 %cmp50, label %cond.true52, label %cond.false59, !dbg !653

cond.true52:                                      ; preds = %cond.end44
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !654
  %globals53 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1, !dbg !654
  %model_moving54 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals53, i32 0, i32 9, !dbg !654
  %34 = load i16, i16* %i, align 2, !dbg !655
  %arrayidx55 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving54, i16 0, i16 %34, !dbg !654
  %meanmag56 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx55, i32 0, i32 0, !dbg !656
  %35 = load i16, i16* %meanmag56, align 2, !dbg !656
  %conv57 = zext i16 %35 to i32, !dbg !654
  %36 = load i32, i32* %meanmag, align 2, !dbg !657
  %sub58 = sub nsw i32 %conv57, %36, !dbg !658
  br label %cond.end66, !dbg !653

cond.false59:                                     ; preds = %cond.end44
  %37 = load i32, i32* %meanmag, align 2, !dbg !659
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !660
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %38, i32 0, i32 1, !dbg !660
  %model_moving61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 9, !dbg !660
  %39 = load i16, i16* %i, align 2, !dbg !661
  %arrayidx62 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving61, i16 0, i16 %39, !dbg !660
  %meanmag63 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx62, i32 0, i32 0, !dbg !662
  %40 = load i16, i16* %meanmag63, align 2, !dbg !662
  %conv64 = zext i16 %40 to i32, !dbg !660
  %sub65 = sub nsw i32 %37, %conv64, !dbg !663
  br label %cond.end66, !dbg !653

cond.end66:                                       ; preds = %cond.false59, %cond.true52
  %cond67 = phi i32 [ %sub58, %cond.true52 ], [ %sub65, %cond.false59 ], !dbg !653
  store i32 %cond67, i32* %move_mean_err, align 2, !dbg !647
  call void @llvm.dbg.declare(metadata i32* %move_sd_err, metadata !664, metadata !DIExpression()), !dbg !665
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !666
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !666
  %model_moving69 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 9, !dbg !666
  %42 = load i16, i16* %i, align 2, !dbg !667
  %arrayidx70 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving69, i16 0, i16 %42, !dbg !666
  %stddevmag71 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx70, i32 0, i32 1, !dbg !668
  %43 = load i16, i16* %stddevmag71, align 2, !dbg !668
  %conv72 = zext i16 %43 to i32, !dbg !666
  %44 = load i32, i32* %stddevmag, align 2, !dbg !669
  %cmp73 = icmp sgt i32 %conv72, %44, !dbg !670
  br i1 %cmp73, label %cond.true75, label %cond.false82, !dbg !671

cond.true75:                                      ; preds = %cond.end66
  %45 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !672
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %45, i32 0, i32 1, !dbg !672
  %model_moving77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 9, !dbg !672
  %46 = load i16, i16* %i, align 2, !dbg !673
  %arrayidx78 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving77, i16 0, i16 %46, !dbg !672
  %stddevmag79 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx78, i32 0, i32 1, !dbg !674
  %47 = load i16, i16* %stddevmag79, align 2, !dbg !674
  %conv80 = zext i16 %47 to i32, !dbg !672
  %48 = load i32, i32* %stddevmag, align 2, !dbg !675
  %sub81 = sub nsw i32 %conv80, %48, !dbg !676
  br label %cond.end89, !dbg !671

cond.false82:                                     ; preds = %cond.end66
  %49 = load i32, i32* %stddevmag, align 2, !dbg !677
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !678
  %globals83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !678
  %model_moving84 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals83, i32 0, i32 9, !dbg !678
  %51 = load i16, i16* %i, align 2, !dbg !679
  %arrayidx85 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving84, i16 0, i16 %51, !dbg !678
  %stddevmag86 = getelementptr inbounds %struct.features_t, %struct.features_t* %arrayidx85, i32 0, i32 1, !dbg !680
  %52 = load i16, i16* %stddevmag86, align 2, !dbg !680
  %conv87 = zext i16 %52 to i32, !dbg !678
  %sub88 = sub nsw i32 %49, %conv87, !dbg !681
  br label %cond.end89, !dbg !671

cond.end89:                                       ; preds = %cond.false82, %cond.true75
  %cond90 = phi i32 [ %sub81, %cond.true75 ], [ %sub88, %cond.false82 ], !dbg !671
  store i32 %cond90, i32* %move_sd_err, align 2, !dbg !665
  %53 = load i32, i32* %move_mean_err, align 2, !dbg !682
  %54 = load i32, i32* %stat_mean_err, align 2, !dbg !684
  %cmp91 = icmp slt i32 %53, %54, !dbg !685
  br i1 %cmp91, label %if.then, label %if.else, !dbg !686

if.then:                                          ; preds = %cond.end89
  %55 = load i16, i16* %move_less_error, align 2, !dbg !687
  %inc = add nsw i16 %55, 1, !dbg !687
  store i16 %inc, i16* %move_less_error, align 2, !dbg !687
  br label %if.end, !dbg !689

if.else:                                          ; preds = %cond.end89
  %56 = load i16, i16* %stat_less_error, align 2, !dbg !690
  %inc93 = add nsw i16 %56, 1, !dbg !690
  store i16 %inc93, i16* %stat_less_error, align 2, !dbg !690
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %57 = load i32, i32* %move_sd_err, align 2, !dbg !692
  %58 = load i32, i32* %stat_sd_err, align 2, !dbg !694
  %cmp94 = icmp slt i32 %57, %58, !dbg !695
  br i1 %cmp94, label %if.then96, label %if.else98, !dbg !696

if.then96:                                        ; preds = %if.end
  %59 = load i16, i16* %move_less_error, align 2, !dbg !697
  %inc97 = add nsw i16 %59, 1, !dbg !697
  store i16 %inc97, i16* %move_less_error, align 2, !dbg !697
  br label %if.end100, !dbg !699

if.else98:                                        ; preds = %if.end
  %60 = load i16, i16* %stat_less_error, align 2, !dbg !700
  %inc99 = add nsw i16 %60, 1, !dbg !700
  store i16 %inc99, i16* %stat_less_error, align 2, !dbg !700
  br label %if.end100

if.end100:                                        ; preds = %if.else98, %if.then96
  br label %for.inc, !dbg !702

for.inc:                                          ; preds = %if.end100
  %61 = load i16, i16* %i, align 2, !dbg !703
  %inc101 = add nsw i16 %61, 1, !dbg !703
  store i16 %inc101, i16* %i, align 2, !dbg !703
  br label %for.cond, !dbg !704, !llvm.loop !705

for.end:                                          ; preds = %for.cond
  %62 = load i16, i16* %move_less_error, align 2, !dbg !707
  %63 = load i16, i16* %stat_less_error, align 2, !dbg !708
  %cmp102 = icmp sgt i16 %62, %63, !dbg !709
  %64 = zext i1 %cmp102 to i64, !dbg !710
  %cond104 = select i1 %cmp102, i16 1, i16 0, !dbg !710
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !711
  %globals105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 1, !dbg !711
  %class106 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals105, i32 0, i32 2, !dbg !711
  store i16 %cond104, i16* %class106, align 2, !dbg !712
  ret void, !dbg !713
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_stats() #0 !dbg !714 {
entry:
  %movingCount = alloca i16, align 2
  %stationaryCount = alloca i16, align 2
  %resultStationaryPct = alloca i16, align 2
  %resultMovingPct = alloca i16, align 2
  %sum = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %movingCount, metadata !715, metadata !DIExpression()), !dbg !716
  store i16 0, i16* %movingCount, align 2, !dbg !716
  call void @llvm.dbg.declare(metadata i16* %stationaryCount, metadata !717, metadata !DIExpression()), !dbg !718
  store i16 0, i16* %stationaryCount, align 2, !dbg !718
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !719
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !719
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !719
  %1 = load i16, i16* %totalCount, align 2, !dbg !720
  %inc = add i16 %1, 1, !dbg !720
  store i16 %inc, i16* %totalCount, align 2, !dbg !720
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !721
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !721
  %class = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !721
  %3 = load i16, i16* %class, align 2, !dbg !721
  switch i16 %3, label %sw.epilog [
    i16 1, label %sw.bb
    i16 0, label %sw.bb5
  ], !dbg !722

sw.bb:                                            ; preds = %entry
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !723
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !723
  %movingCount3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 4, !dbg !723
  %5 = load i16, i16* %movingCount3, align 2, !dbg !725
  %inc4 = add i16 %5, 1, !dbg !725
  store i16 %inc4, i16* %movingCount3, align 2, !dbg !725
  br label %sw.epilog, !dbg !726

sw.bb5:                                           ; preds = %entry
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !727
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !727
  %stationaryCount7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !727
  %7 = load i16, i16* %stationaryCount7, align 2, !dbg !728
  %inc8 = add i16 %7, 1, !dbg !728
  store i16 %inc8, i16* %stationaryCount7, align 2, !dbg !728
  br label %sw.epilog, !dbg !729

sw.epilog:                                        ; preds = %entry, %sw.bb5, %sw.bb
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !730
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !730
  %totalCount10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !730
  %9 = load i16, i16* %totalCount10, align 2, !dbg !730
  %cmp = icmp eq i16 %9, 128, !dbg !732
  br i1 %cmp, label %if.then, label %if.else, !dbg !733

if.then:                                          ; preds = %sw.epilog
  call void @llvm.dbg.declare(metadata i16* %resultStationaryPct, metadata !734, metadata !DIExpression()), !dbg !736
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !737
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !737
  %stationaryCount12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 5, !dbg !737
  %11 = load i16, i16* %stationaryCount12, align 2, !dbg !737
  %mul = mul i16 %11, 100, !dbg !738
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !739
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !739
  %totalCount14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !739
  %13 = load i16, i16* %totalCount14, align 2, !dbg !739
  %div = udiv i16 %mul, %13, !dbg !740
  store i16 %div, i16* %resultStationaryPct, align 2, !dbg !736
  call void @llvm.dbg.declare(metadata i16* %resultMovingPct, metadata !741, metadata !DIExpression()), !dbg !742
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !743
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !743
  %movingCount16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 4, !dbg !743
  %15 = load i16, i16* %movingCount16, align 2, !dbg !743
  %mul17 = mul i16 %15, 100, !dbg !744
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !745
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !745
  %totalCount19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 3, !dbg !745
  %17 = load i16, i16* %totalCount19, align 2, !dbg !745
  %div20 = udiv i16 %mul17, %17, !dbg !746
  store i16 %div20, i16* %resultMovingPct, align 2, !dbg !742
  call void @llvm.dbg.declare(metadata i16* %sum, metadata !747, metadata !DIExpression()), !dbg !748
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !749
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !749
  %stationaryCount22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 5, !dbg !749
  %19 = load i16, i16* %stationaryCount22, align 2, !dbg !749
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !750
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !750
  %movingCount24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 4, !dbg !750
  %21 = load i16, i16* %movingCount24, align 2, !dbg !750
  %add = add i16 %19, %21, !dbg !751
  store i16 %add, i16* %sum, align 2, !dbg !748
  br label %if.end, !dbg !752

if.else:                                          ; preds = %sw.epilog
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !753
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_warmup() #0 !dbg !754 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  br label %while.cond, !dbg !755

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !756
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !756
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !756
  %1 = load i16, i16* %discardedSamplesCount, align 2, !dbg !756
  %cmp = icmp ult i16 %1, 3, !dbg !757
  br i1 %cmp, label %while.body, label %while.end, !dbg !755

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !758, metadata !DIExpression()), !dbg !760
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !761
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !761
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !761
  %3 = load i16, i16* %seed, align 2, !dbg !761
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %3), !dbg !762
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !763
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !763
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !763
  store i16 %call, i16* %seed3, align 2, !dbg !764
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !765
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !765
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !765
  %6 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !766
  %inc = add i16 %6, 1, !dbg !766
  store i16 %inc, i16* %discardedSamplesCount5, align 2, !dbg !766
  br label %while.cond, !dbg !755, !llvm.loop !767

while.end:                                        ; preds = %while.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !769
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !769
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !769
  store i16 0, i16* %trainingSetSize, align 2, !dbg !770
  ret void, !dbg !771
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_train() #0 !dbg !772 {
entry:
  %trainingSetSize = alloca i16, align 2
  %class = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %trainingSetSize, metadata !773, metadata !DIExpression()), !dbg !774
  call void @llvm.dbg.declare(metadata i16* %class, metadata !775, metadata !DIExpression()), !dbg !776
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !777
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !777
  %class1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 2, !dbg !777
  %1 = load i16, i16* %class1, align 2, !dbg !777
  switch i16 %1, label %sw.epilog [
    i16 0, label %sw.bb
    i16 1, label %sw.bb6
  ], !dbg !778

sw.bb:                                            ; preds = %entry
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !779
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !779
  %model_stationary = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !779
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !781
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !781
  %trainingSetSize4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 10, !dbg !781
  %4 = load i16, i16* %trainingSetSize4, align 2, !dbg !781
  %arrayidx = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_stationary, i16 0, i16 %4, !dbg !779
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !782
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !782
  %features = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !782
  %6 = bitcast %struct.features_t* %arrayidx to i8*, !dbg !782
  %7 = bitcast %struct.features_t* %features to i8*, !dbg !782
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %6, i8* align 2 %7, i16 4, i1 false), !dbg !782
  br label %sw.epilog, !dbg !783

sw.bb6:                                           ; preds = %entry
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !784
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !784
  %model_moving = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !784
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !785
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !785
  %trainingSetSize9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 10, !dbg !785
  %10 = load i16, i16* %trainingSetSize9, align 2, !dbg !785
  %arrayidx10 = getelementptr inbounds [16 x %struct.features_t], [16 x %struct.features_t]* %model_moving, i16 0, i16 %10, !dbg !784
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !786
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !786
  %features12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7, !dbg !786
  %12 = bitcast %struct.features_t* %arrayidx10 to i8*, !dbg !786
  %13 = bitcast %struct.features_t* %features12 to i8*, !dbg !786
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %12, i8* align 2 %13, i16 4, i1 false), !dbg !786
  br label %sw.epilog, !dbg !787

sw.epilog:                                        ; preds = %entry, %sw.bb6, %sw.bb
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !788
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !788
  %trainingSetSize14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 10, !dbg !788
  %15 = load i16, i16* %trainingSetSize14, align 2, !dbg !789
  %inc = add i16 %15, 1, !dbg !789
  store i16 %inc, i16* %trainingSetSize14, align 2, !dbg !789
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !790
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !790
  %trainingSetSize16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !790
  %17 = load i16, i16* %trainingSetSize16, align 2, !dbg !790
  %cmp = icmp ult i16 %17, 16, !dbg !792
  br i1 %cmp, label %if.then, label %if.else, !dbg !793

if.then:                                          ; preds = %sw.epilog
  br label %if.end, !dbg !794

if.else:                                          ; preds = %sw.epilog
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !796
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !797 {
entry:
  call void @exit(i16 0) #6, !dbg !798
  unreachable, !dbg !798
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !799 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !802
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !803
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !804
  call void @camel_init(), !dbg !805
  call void @task_init(), !dbg !806
  br label %while.cond, !dbg !807

while.cond:                                       ; preds = %while.end, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !808
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !808
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !808
  %1 = load i16, i16* %count, align 2, !dbg !808
  %cmp = icmp ult i16 %1, 7, !dbg !809
  br i1 %cmp, label %while.body, label %while.end37, !dbg !807

while.body:                                       ; preds = %while.cond
  call void @task_selectMode(), !dbg !810
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !812
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !812
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 12, !dbg !812
  %3 = load i16, i16* %mode, align 2, !dbg !812
  %cmp2 = icmp eq i16 %3, 2, !dbg !814
  br i1 %cmp2, label %if.then, label %lor.lhs.false, !dbg !815

lor.lhs.false:                                    ; preds = %while.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !816
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !816
  %mode4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 12, !dbg !816
  %5 = load i16, i16* %mode4, align 2, !dbg !816
  %cmp5 = icmp eq i16 %5, 1, !dbg !817
  br i1 %cmp5, label %if.then, label %if.else, !dbg !818

if.then:                                          ; preds = %lor.lhs.false, %while.body
  call void @task_warmup(), !dbg !819
  br label %if.end11, !dbg !821

if.else:                                          ; preds = %lor.lhs.false
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !822
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !822
  %mode7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 12, !dbg !822
  %7 = load i16, i16* %mode7, align 2, !dbg !822
  %cmp8 = icmp eq i16 %7, 0, !dbg !824
  br i1 %cmp8, label %if.then9, label %if.else10, !dbg !825

if.then9:                                         ; preds = %if.else
  call void @task_resetStats(), !dbg !826
  br label %if.end, !dbg !828

if.else10:                                        ; preds = %if.else
  br label %while.end37, !dbg !829

if.end:                                           ; preds = %if.then9
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  br label %while.body13, !dbg !831

while.body13:                                     ; preds = %if.end11, %if.end36
  call void @task_sample(), !dbg !832
  call void @task_transform(), !dbg !834
  call void @task_featurize(), !dbg !835
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !836
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !836
  %mode15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 12, !dbg !836
  %9 = load i16, i16* %mode15, align 2, !dbg !836
  %cmp16 = icmp eq i16 %9, 2, !dbg !838
  br i1 %cmp16, label %if.then21, label %lor.lhs.false17, !dbg !839

lor.lhs.false17:                                  ; preds = %while.body13
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !840
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !840
  %mode19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 12, !dbg !840
  %11 = load i16, i16* %mode19, align 2, !dbg !840
  %cmp20 = icmp eq i16 %11, 1, !dbg !841
  br i1 %cmp20, label %if.then21, label %if.else26, !dbg !842

if.then21:                                        ; preds = %lor.lhs.false17, %while.body13
  call void @task_train(), !dbg !843
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !845
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !845
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 10, !dbg !845
  %13 = load i16, i16* %trainingSetSize, align 2, !dbg !845
  %cmp23 = icmp uge i16 %13, 16, !dbg !847
  br i1 %cmp23, label %if.then24, label %if.end25, !dbg !848

if.then24:                                        ; preds = %if.then21
  br label %while.end, !dbg !849

if.end25:                                         ; preds = %if.then21
  br label %if.end36, !dbg !850

if.else26:                                        ; preds = %lor.lhs.false17
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !851
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !851
  %mode28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 12, !dbg !851
  %15 = load i16, i16* %mode28, align 2, !dbg !851
  %cmp29 = icmp eq i16 %15, 0, !dbg !853
  br i1 %cmp29, label %if.then30, label %if.end35, !dbg !854

if.then30:                                        ; preds = %if.else26
  call void @task_classify(), !dbg !855
  call void @task_stats(), !dbg !857
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !858
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !858
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 3, !dbg !858
  %17 = load i16, i16* %totalCount, align 2, !dbg !858
  %cmp32 = icmp eq i16 %17, 128, !dbg !860
  br i1 %cmp32, label %if.then33, label %if.end34, !dbg !861

if.then33:                                        ; preds = %if.then30
  br label %while.end, !dbg !862

if.end34:                                         ; preds = %if.then30
  br label %if.end35, !dbg !863

if.end35:                                         ; preds = %if.end34, %if.else26
  br label %if.end36

if.end36:                                         ; preds = %if.end35, %if.end25
  br label %while.body13, !dbg !831, !llvm.loop !864

while.end:                                        ; preds = %if.then33, %if.then24
  %call = call i16 bitcast (i16 (...)* @task_idle to i16 ()*)(), !dbg !866
  br label %while.cond, !dbg !807, !llvm.loop !867

while.end37:                                      ; preds = %if.else10, %while.cond
  call void @task_done(), !dbg !869
  %18 = load i16, i16* %retval, align 2, !dbg !870
  ret i16 %18, !dbg !870
}

declare dso_local i16 @task_idle(...) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!91, !92, !93}
!llvm.ident = !{!94}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 165, type: !86, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !16, globals: !17, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_ar.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{!5, !12}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 37, baseType: !6, size: 16, elements: !7)
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !{!8, !9, !10, !11}
!8 = !DIEnumerator(name: "MODE_IDLE", value: 3, isUnsigned: true)
!9 = !DIEnumerator(name: "MODE_TRAIN_STATIONARY", value: 2, isUnsigned: true)
!10 = !DIEnumerator(name: "MODE_TRAIN_MOVING", value: 1, isUnsigned: true)
!11 = !DIEnumerator(name: "MODE_RECOGNIZE", value: 0, isUnsigned: true)
!12 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !3, line: 32, baseType: !6, size: 16, elements: !13)
!13 = !{!14, !15}
!14 = !DIEnumerator(name: "CLASS_STATIONARY", value: 0, isUnsigned: true)
!15 = !DIEnumerator(name: "CLASS_MOVING", value: 1, isUnsigned: true)
!16 = !{!6}
!17 = !{!18, !25, !0, !27, !81, !83}
!18 = !DIGlobalVariableExpression(var: !19, expr: !DIExpression())
!19 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 65, type: !20, isLocal: false, isDefinition: true)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !21, line: 26, baseType: !22)
!21 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !23, line: 43, baseType: !24)
!23 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!24 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!25 = !DIGlobalVariableExpression(var: !26, expr: !DIExpression())
!26 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 66, type: !20, isLocal: false, isDefinition: true)
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 172, type: !29, isLocal: false, isDefinition: true)
!29 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !30, size: 16)
!30 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 158, baseType: !31)
!31 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 153, size: 1504, elements: !32)
!32 = !{!33, !38, !80}
!33 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !31, file: !3, line: 155, baseType: !34, size: 176)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !35, size: 176, elements: !36)
!35 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 62, baseType: !20)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !31, file: !3, line: 156, baseType: !39, size: 1312, offset: 176)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 150, baseType: !40)
!40 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 133, size: 1312, elements: !41)
!41 = !{!42, !43, !44, !46, !47, !48, !49, !63, !69, !73, !74, !75, !76, !78, !79}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "pinState", scope: !40, file: !3, line: 135, baseType: !20, size: 16)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "discardedSamplesCount", scope: !40, file: !3, line: 136, baseType: !6, size: 16, offset: 16)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "class", scope: !40, file: !3, line: 137, baseType: !45, size: 16, offset: 32)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "class_t", file: !3, line: 35, baseType: !12)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "totalCount", scope: !40, file: !3, line: 138, baseType: !6, size: 16, offset: 48)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "movingCount", scope: !40, file: !3, line: 139, baseType: !6, size: 16, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "stationaryCount", scope: !40, file: !3, line: 140, baseType: !6, size: 16, offset: 80)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !40, file: !3, line: 141, baseType: !50, size: 72, offset: 96)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 72, elements: !61)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "accelReading", file: !3, line: 24, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "threeAxis_t_8", file: !3, line: 22, baseType: !53)
!53 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 18, size: 24, elements: !54)
!54 = !{!55, !59, !60}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "x", scope: !53, file: !3, line: 19, baseType: !56, size: 8)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !21, line: 19, baseType: !57)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !23, line: 27, baseType: !58)
!58 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !53, file: !3, line: 20, baseType: !56, size: 8, offset: 8)
!60 = !DIDerivedType(tag: DW_TAG_member, name: "z", scope: !53, file: !3, line: 21, baseType: !56, size: 8, offset: 16)
!61 = !{!62}
!62 = !DISubrange(count: 3)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "features", scope: !40, file: !3, line: 142, baseType: !64, size: 32, offset: 176)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "features_t", file: !3, line: 30, baseType: !65)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 27, size: 32, elements: !66)
!66 = !{!67, !68}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "meanmag", scope: !65, file: !3, line: 28, baseType: !6, size: 16)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "stddevmag", scope: !65, file: !3, line: 29, baseType: !6, size: 16, offset: 16)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "model_stationary", scope: !40, file: !3, line: 143, baseType: !70, size: 512, offset: 208)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !64, size: 512, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 16)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "model_moving", scope: !40, file: !3, line: 144, baseType: !70, size: 512, offset: 720)
!74 = !DIDerivedType(tag: DW_TAG_member, name: "trainingSetSize", scope: !40, file: !3, line: 145, baseType: !6, size: 16, offset: 1232)
!75 = !DIDerivedType(tag: DW_TAG_member, name: "samplesInWindow", scope: !40, file: !3, line: 146, baseType: !6, size: 16, offset: 1248)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "mode", scope: !40, file: !3, line: 147, baseType: !77, size: 16, offset: 1264)
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "run_mode_t", file: !3, line: 45, baseType: !5)
!78 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !40, file: !3, line: 148, baseType: !6, size: 16, offset: 1280)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "count", scope: !40, file: !3, line: 149, baseType: !6, size: 16, offset: 1296)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !31, file: !3, line: 157, baseType: !20, size: 16, offset: 1488)
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 172, type: !29, isLocal: false, isDefinition: true)
!83 = !DIGlobalVariableExpression(var: !84, expr: !DIExpression())
!84 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 201, type: !85, isLocal: false, isDefinition: true)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 176, elements: !36)
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 160, size: 3024, elements: !87)
!87 = !{!88, !89, !90}
!88 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !86, file: !3, line: 162, baseType: !20, size: 16)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !86, file: !3, line: 163, baseType: !30, size: 1504, offset: 16)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !86, file: !3, line: 164, baseType: !30, size: 1504, offset: 1520)
!91 = !{i32 2, !"Dwarf Version", i32 4}
!92 = !{i32 2, !"Debug Info Version", i32 3}
!93 = !{i32 1, !"wchar_size", i32 2}
!94 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!95 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 174, type: !96, scopeLine: 174, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!96 = !DISubroutineType(types: !97)
!97 = !{null}
!98 = !{}
!99 = !DILocation(line: 175, column: 10, scope: !95)
!100 = !DILocation(line: 177, column: 9, scope: !95)
!101 = !DILocation(line: 179, column: 9, scope: !95)
!102 = !DILocation(line: 184, column: 11, scope: !95)
!103 = !DILocation(line: 189, column: 12, scope: !95)
!104 = !DILocation(line: 190, column: 10, scope: !95)
!105 = !DILocation(line: 191, column: 10, scope: !95)
!106 = !DILocation(line: 193, column: 10, scope: !95)
!107 = !DILocation(line: 194, column: 12, scope: !95)
!108 = !DILocation(line: 197, column: 10, scope: !95)
!109 = !DILocation(line: 199, column: 1, scope: !95)
!110 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 203, type: !96, scopeLine: 203, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!111 = !DILocation(line: 204, column: 14, scope: !112)
!112 = distinct !DILexicalBlock(scope: !110, file: !3, line: 204, column: 8)
!113 = !DILocation(line: 204, column: 19, scope: !112)
!114 = !DILocation(line: 204, column: 8, scope: !110)
!115 = !DILocation(line: 205, column: 14, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !3, line: 204, column: 34)
!117 = !DILocation(line: 206, column: 16, scope: !116)
!118 = !DILocation(line: 207, column: 5, scope: !116)
!119 = !DILocation(line: 207, column: 21, scope: !120)
!120 = distinct !DILexicalBlock(scope: !112, file: !3, line: 207, column: 15)
!121 = !DILocation(line: 207, column: 26, scope: !120)
!122 = !DILocation(line: 207, column: 15, scope: !112)
!123 = !DILocation(line: 208, column: 14, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !3, line: 207, column: 41)
!125 = !DILocation(line: 209, column: 16, scope: !124)
!126 = !DILocation(line: 210, column: 5, scope: !124)
!127 = !DILocation(line: 211, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !120, file: !3, line: 210, column: 12)
!129 = !DILocation(line: 228, column: 3, scope: !130)
!130 = distinct !DILexicalBlock(scope: !110, file: !3, line: 228, column: 3)
!131 = !{i32 -2146704458}
!132 = !DILocalVariable(name: "__x", scope: !133, file: !3, line: 230, type: !6)
!133 = distinct !DILexicalBlock(scope: !110, file: !3, line: 230, column: 33)
!134 = !DILocation(line: 230, column: 33, scope: !133)
!135 = !{i32 -2146704222}
!136 = !DILocation(line: 230, column: 51, scope: !110)
!137 = !DILocation(line: 230, column: 33, scope: !110)
!138 = !DILocalVariable(name: "__x", scope: !139, file: !3, line: 230, type: !6)
!139 = distinct !DILexicalBlock(scope: !110, file: !3, line: 230, column: 65)
!140 = !DILocation(line: 230, column: 65, scope: !139)
!141 = !{i32 -2146704097}
!142 = !DILocation(line: 230, column: 83, scope: !110)
!143 = !DILocation(line: 230, column: 63, scope: !110)
!144 = !DILocation(line: 230, column: 19, scope: !110)
!145 = !DILocation(line: 230, column: 17, scope: !110)
!146 = !DILocation(line: 231, column: 37, scope: !110)
!147 = !DILocation(line: 231, column: 71, scope: !110)
!148 = !DILocation(line: 231, column: 23, scope: !110)
!149 = !DILocation(line: 231, column: 21, scope: !110)
!150 = !DILocation(line: 234, column: 6, scope: !151)
!151 = distinct !DILexicalBlock(scope: !110, file: !3, line: 234, column: 6)
!152 = !DILocation(line: 234, column: 27, scope: !151)
!153 = !DILocation(line: 234, column: 33, scope: !151)
!154 = !DILocation(line: 234, column: 24, scope: !151)
!155 = !DILocation(line: 234, column: 6, scope: !110)
!156 = !DILocation(line: 235, column: 11, scope: !157)
!157 = distinct !DILexicalBlock(scope: !151, file: !3, line: 234, column: 51)
!158 = !DILocation(line: 235, column: 4, scope: !157)
!159 = !DILocation(line: 235, column: 19, scope: !157)
!160 = !DILocation(line: 236, column: 4, scope: !157)
!161 = !DILocation(line: 237, column: 24, scope: !157)
!162 = !DILocation(line: 237, column: 30, scope: !157)
!163 = !DILocation(line: 237, column: 4, scope: !157)
!164 = !DILocation(line: 238, column: 3, scope: !157)
!165 = !DILocation(line: 239, column: 4, scope: !166)
!166 = distinct !DILexicalBlock(scope: !151, file: !3, line: 238, column: 9)
!167 = !DILocation(line: 242, column: 1, scope: !110)
!168 = distinct !DISubprogram(name: "ACCEL_singleSample_", scope: !3, file: !3, line: 244, type: !169, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!169 = !DISubroutineType(types: !170)
!170 = !{!6, !171, !6}
!171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 16)
!172 = !DILocalVariable(name: "result", arg: 1, scope: !168, file: !3, line: 244, type: !171)
!173 = !DILocation(line: 244, column: 45, scope: !168)
!174 = !DILocalVariable(name: "seed", arg: 2, scope: !168, file: !3, line: 244, type: !6)
!175 = !DILocation(line: 244, column: 62, scope: !168)
!176 = !DILocation(line: 245, column: 15, scope: !168)
!177 = !DILocation(line: 245, column: 19, scope: !168)
!178 = !DILocation(line: 245, column: 23, scope: !168)
!179 = !DILocation(line: 245, column: 14, scope: !168)
!180 = !DILocation(line: 245, column: 2, scope: !168)
!181 = !DILocation(line: 245, column: 10, scope: !168)
!182 = !DILocation(line: 245, column: 12, scope: !168)
!183 = !DILocation(line: 246, column: 15, scope: !168)
!184 = !DILocation(line: 246, column: 19, scope: !168)
!185 = !DILocation(line: 246, column: 22, scope: !168)
!186 = !DILocation(line: 246, column: 26, scope: !168)
!187 = !DILocation(line: 246, column: 14, scope: !168)
!188 = !DILocation(line: 246, column: 2, scope: !168)
!189 = !DILocation(line: 246, column: 10, scope: !168)
!190 = !DILocation(line: 246, column: 12, scope: !168)
!191 = !DILocation(line: 247, column: 15, scope: !168)
!192 = !DILocation(line: 247, column: 19, scope: !168)
!193 = !DILocation(line: 247, column: 22, scope: !168)
!194 = !DILocation(line: 247, column: 25, scope: !168)
!195 = !DILocation(line: 247, column: 29, scope: !168)
!196 = !DILocation(line: 247, column: 14, scope: !168)
!197 = !DILocation(line: 247, column: 2, scope: !168)
!198 = !DILocation(line: 247, column: 10, scope: !168)
!199 = !DILocation(line: 247, column: 12, scope: !168)
!200 = !DILocation(line: 248, column: 2, scope: !168)
!201 = !DILocation(line: 250, column: 9, scope: !168)
!202 = !DILocation(line: 250, column: 2, scope: !168)
!203 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 253, type: !96, scopeLine: 254, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!204 = !DILocation(line: 255, column: 2, scope: !203)
!205 = !DILocation(line: 255, column: 15, scope: !203)
!206 = !DILocation(line: 256, column: 2, scope: !203)
!207 = !DILocation(line: 256, column: 12, scope: !203)
!208 = !DILocation(line: 257, column: 2, scope: !203)
!209 = !DILocation(line: 257, column: 11, scope: !203)
!210 = !DILocation(line: 259, column: 1, scope: !203)
!211 = distinct !DISubprogram(name: "task_selectMode", scope: !3, file: !3, line: 276, type: !96, scopeLine: 277, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!212 = !DILocalVariable(name: "pin_state", scope: !211, file: !3, line: 278, type: !20)
!213 = !DILocation(line: 278, column: 11, scope: !211)
!214 = !DILocation(line: 279, column: 4, scope: !211)
!215 = !DILocation(line: 279, column: 2, scope: !211)
!216 = !DILocation(line: 281, column: 5, scope: !217)
!217 = distinct !DILexicalBlock(scope: !211, file: !3, line: 281, column: 5)
!218 = !DILocation(line: 281, column: 15, scope: !217)
!219 = !DILocation(line: 281, column: 5, scope: !211)
!220 = !DILocation(line: 281, column: 30, scope: !217)
!221 = !DILocation(line: 281, column: 21, scope: !217)
!222 = !DILocation(line: 282, column: 5, scope: !223)
!223 = distinct !DILexicalBlock(scope: !211, file: !3, line: 282, column: 5)
!224 = !DILocation(line: 282, column: 14, scope: !223)
!225 = !DILocation(line: 282, column: 5, scope: !211)
!226 = !DILocation(line: 282, column: 28, scope: !223)
!227 = !DILocation(line: 282, column: 19, scope: !223)
!228 = !DILocation(line: 283, column: 6, scope: !229)
!229 = distinct !DILexicalBlock(scope: !211, file: !3, line: 283, column: 6)
!230 = !DILocation(line: 283, column: 16, scope: !229)
!231 = !DILocation(line: 283, column: 6, scope: !211)
!232 = !DILocation(line: 285, column: 3, scope: !233)
!233 = distinct !DILexicalBlock(scope: !229, file: !3, line: 283, column: 22)
!234 = !DILocation(line: 288, column: 2, scope: !233)
!235 = !DILocalVariable(name: "mode", scope: !211, file: !3, line: 289, type: !77)
!236 = !DILocation(line: 289, column: 13, scope: !211)
!237 = !DILocalVariable(name: "class", scope: !211, file: !3, line: 290, type: !45)
!238 = !DILocation(line: 290, column: 10, scope: !211)
!239 = !DILocation(line: 295, column: 7, scope: !240)
!240 = distinct !DILexicalBlock(scope: !211, file: !3, line: 295, column: 6)
!241 = !DILocation(line: 295, column: 17, scope: !240)
!242 = !DILocation(line: 295, column: 42, scope: !240)
!243 = !DILocation(line: 296, column: 5, scope: !240)
!244 = !DILocation(line: 296, column: 15, scope: !240)
!245 = !DILocation(line: 296, column: 37, scope: !240)
!246 = !DILocation(line: 297, column: 4, scope: !240)
!247 = !DILocation(line: 297, column: 17, scope: !240)
!248 = !DILocation(line: 297, column: 14, scope: !240)
!249 = !DILocation(line: 295, column: 6, scope: !211)
!250 = !DILocation(line: 298, column: 13, scope: !251)
!251 = distinct !DILexicalBlock(scope: !240, file: !3, line: 297, column: 31)
!252 = !DILocation(line: 299, column: 2, scope: !251)
!253 = !DILocation(line: 300, column: 18, scope: !254)
!254 = distinct !DILexicalBlock(scope: !240, file: !3, line: 299, column: 9)
!255 = !DILocation(line: 300, column: 3, scope: !254)
!256 = !DILocation(line: 300, column: 16, scope: !254)
!257 = !DILocation(line: 303, column: 9, scope: !211)
!258 = !DILocation(line: 303, column: 2, scope: !211)
!259 = !DILocation(line: 305, column: 4, scope: !260)
!260 = distinct !DILexicalBlock(scope: !211, file: !3, line: 303, column: 20)
!261 = !DILocation(line: 305, column: 30, scope: !260)
!262 = !DILocation(line: 306, column: 4, scope: !260)
!263 = !DILocation(line: 306, column: 13, scope: !260)
!264 = !DILocation(line: 307, column: 4, scope: !260)
!265 = !DILocation(line: 307, column: 14, scope: !260)
!266 = !DILocation(line: 308, column: 4, scope: !260)
!267 = !DILocation(line: 308, column: 24, scope: !260)
!268 = !DILocation(line: 311, column: 4, scope: !260)
!269 = !DILocation(line: 314, column: 4, scope: !260)
!270 = !DILocation(line: 314, column: 30, scope: !260)
!271 = !DILocation(line: 315, column: 4, scope: !260)
!272 = !DILocation(line: 315, column: 13, scope: !260)
!273 = !DILocation(line: 316, column: 4, scope: !260)
!274 = !DILocation(line: 316, column: 14, scope: !260)
!275 = !DILocation(line: 317, column: 4, scope: !260)
!276 = !DILocation(line: 317, column: 24, scope: !260)
!277 = !DILocation(line: 320, column: 4, scope: !260)
!278 = !DILocation(line: 323, column: 4, scope: !260)
!279 = !DILocation(line: 323, column: 13, scope: !260)
!280 = !DILocation(line: 326, column: 4, scope: !260)
!281 = !DILocation(line: 329, column: 4, scope: !260)
!282 = !DILocation(line: 332, column: 1, scope: !211)
!283 = distinct !DISubprogram(name: "task_resetStats", scope: !3, file: !3, line: 349, type: !96, scopeLine: 350, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!284 = !DILocation(line: 353, column: 2, scope: !283)
!285 = !DILocation(line: 353, column: 18, scope: !283)
!286 = !DILocation(line: 354, column: 2, scope: !283)
!287 = !DILocation(line: 354, column: 22, scope: !283)
!288 = !DILocation(line: 355, column: 2, scope: !283)
!289 = !DILocation(line: 355, column: 17, scope: !283)
!290 = !DILocation(line: 357, column: 2, scope: !283)
!291 = !DILocation(line: 357, column: 22, scope: !283)
!292 = !DILocation(line: 360, column: 1, scope: !283)
!293 = distinct !DISubprogram(name: "task_sample", scope: !3, file: !3, line: 377, type: !96, scopeLine: 378, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!294 = !DILocation(line: 379, column: 2, scope: !293)
!295 = !DILocation(line: 379, column: 9, scope: !293)
!296 = !DILocation(line: 379, column: 29, scope: !293)
!297 = !DILocalVariable(name: "sample", scope: !298, file: !3, line: 381, type: !51)
!298 = distinct !DILexicalBlock(scope: !293, file: !3, line: 379, column: 49)
!299 = !DILocation(line: 381, column: 16, scope: !298)
!300 = !DILocation(line: 382, column: 43, scope: !298)
!301 = !DILocation(line: 382, column: 14, scope: !298)
!302 = !DILocation(line: 382, column: 3, scope: !298)
!303 = !DILocation(line: 382, column: 12, scope: !298)
!304 = !DILocation(line: 383, column: 3, scope: !298)
!305 = !DILocation(line: 383, column: 14, scope: !298)
!306 = !DILocation(line: 383, column: 37, scope: !298)
!307 = !DILocation(line: 384, column: 5, scope: !298)
!308 = !DILocation(line: 384, column: 3, scope: !298)
!309 = distinct !{!309, !294, !310}
!310 = !DILocation(line: 386, column: 2, scope: !293)
!311 = !DILocation(line: 388, column: 2, scope: !293)
!312 = !DILocation(line: 388, column: 22, scope: !293)
!313 = !DILocation(line: 402, column: 1, scope: !293)
!314 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 419, type: !96, scopeLine: 420, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!315 = !DILocalVariable(name: "i", scope: !314, file: !3, line: 421, type: !6)
!316 = !DILocation(line: 421, column: 11, scope: !314)
!317 = !DILocalVariable(name: "sample", scope: !314, file: !3, line: 423, type: !318)
!318 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 16)
!319 = !DILocation(line: 423, column: 16, scope: !314)
!320 = !DILocalVariable(name: "transformedSample", scope: !314, file: !3, line: 424, type: !51)
!321 = !DILocation(line: 424, column: 15, scope: !314)
!322 = !DILocation(line: 426, column: 9, scope: !323)
!323 = distinct !DILexicalBlock(scope: !314, file: !3, line: 426, column: 2)
!324 = !DILocation(line: 426, column: 7, scope: !323)
!325 = !DILocation(line: 426, column: 14, scope: !326)
!326 = distinct !DILexicalBlock(scope: !323, file: !3, line: 426, column: 2)
!327 = !DILocation(line: 426, column: 16, scope: !326)
!328 = !DILocation(line: 426, column: 2, scope: !323)
!329 = !DILocation(line: 427, column: 7, scope: !330)
!330 = distinct !DILexicalBlock(scope: !331, file: !3, line: 427, column: 7)
!331 = distinct !DILexicalBlock(scope: !326, file: !3, line: 426, column: 42)
!332 = !DILocation(line: 427, column: 18, scope: !330)
!333 = !DILocation(line: 427, column: 21, scope: !330)
!334 = !DILocation(line: 427, column: 23, scope: !330)
!335 = !DILocation(line: 427, column: 44, scope: !330)
!336 = !DILocation(line: 428, column: 5, scope: !330)
!337 = !DILocation(line: 428, column: 16, scope: !330)
!338 = !DILocation(line: 428, column: 19, scope: !330)
!339 = !DILocation(line: 428, column: 21, scope: !330)
!340 = !DILocation(line: 428, column: 42, scope: !330)
!341 = !DILocation(line: 429, column: 5, scope: !330)
!342 = !DILocation(line: 429, column: 16, scope: !330)
!343 = !DILocation(line: 429, column: 19, scope: !330)
!344 = !DILocation(line: 429, column: 21, scope: !330)
!345 = !DILocation(line: 427, column: 7, scope: !331)
!346 = !DILocation(line: 431, column: 23, scope: !347)
!347 = distinct !DILexicalBlock(scope: !330, file: !3, line: 429, column: 43)
!348 = !DILocation(line: 431, column: 34, scope: !347)
!349 = !DILocation(line: 431, column: 37, scope: !347)
!350 = !DILocation(line: 431, column: 39, scope: !347)
!351 = !DILocation(line: 431, column: 22, scope: !347)
!352 = !DILocation(line: 432, column: 7, scope: !347)
!353 = !DILocation(line: 432, column: 18, scope: !347)
!354 = !DILocation(line: 432, column: 21, scope: !347)
!355 = !DILocation(line: 431, column: 4, scope: !347)
!356 = !DILocation(line: 431, column: 15, scope: !347)
!357 = !DILocation(line: 431, column: 18, scope: !347)
!358 = !DILocation(line: 431, column: 20, scope: !347)
!359 = !DILocation(line: 433, column: 23, scope: !347)
!360 = !DILocation(line: 433, column: 34, scope: !347)
!361 = !DILocation(line: 433, column: 37, scope: !347)
!362 = !DILocation(line: 433, column: 39, scope: !347)
!363 = !DILocation(line: 433, column: 22, scope: !347)
!364 = !DILocation(line: 434, column: 7, scope: !347)
!365 = !DILocation(line: 434, column: 18, scope: !347)
!366 = !DILocation(line: 434, column: 21, scope: !347)
!367 = !DILocation(line: 433, column: 4, scope: !347)
!368 = !DILocation(line: 433, column: 15, scope: !347)
!369 = !DILocation(line: 433, column: 18, scope: !347)
!370 = !DILocation(line: 433, column: 20, scope: !347)
!371 = !DILocation(line: 435, column: 23, scope: !347)
!372 = !DILocation(line: 435, column: 34, scope: !347)
!373 = !DILocation(line: 435, column: 37, scope: !347)
!374 = !DILocation(line: 435, column: 39, scope: !347)
!375 = !DILocation(line: 435, column: 22, scope: !347)
!376 = !DILocation(line: 436, column: 7, scope: !347)
!377 = !DILocation(line: 436, column: 18, scope: !347)
!378 = !DILocation(line: 436, column: 21, scope: !347)
!379 = !DILocation(line: 435, column: 4, scope: !347)
!380 = !DILocation(line: 435, column: 15, scope: !347)
!381 = !DILocation(line: 435, column: 18, scope: !347)
!382 = !DILocation(line: 435, column: 20, scope: !347)
!383 = !DILocation(line: 437, column: 3, scope: !347)
!384 = !DILocation(line: 438, column: 2, scope: !331)
!385 = !DILocation(line: 426, column: 38, scope: !326)
!386 = !DILocation(line: 426, column: 2, scope: !326)
!387 = distinct !{!387, !328, !388}
!388 = !DILocation(line: 438, column: 2, scope: !323)
!389 = !DILocation(line: 440, column: 1, scope: !314)
!390 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 457, type: !96, scopeLine: 458, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!391 = !DILocalVariable(name: "mean", scope: !390, file: !3, line: 459, type: !51)
!392 = !DILocation(line: 459, column: 15, scope: !390)
!393 = !DILocalVariable(name: "stddev", scope: !390, file: !3, line: 459, type: !51)
!394 = !DILocation(line: 459, column: 21, scope: !390)
!395 = !DILocation(line: 460, column: 25, scope: !390)
!396 = !DILocation(line: 460, column: 27, scope: !390)
!397 = !DILocation(line: 460, column: 16, scope: !390)
!398 = !DILocation(line: 460, column: 18, scope: !390)
!399 = !DILocation(line: 460, column: 7, scope: !390)
!400 = !DILocation(line: 460, column: 9, scope: !390)
!401 = !DILocation(line: 461, column: 31, scope: !390)
!402 = !DILocation(line: 461, column: 33, scope: !390)
!403 = !DILocation(line: 461, column: 20, scope: !390)
!404 = !DILocation(line: 461, column: 22, scope: !390)
!405 = !DILocation(line: 461, column: 9, scope: !390)
!406 = !DILocation(line: 461, column: 11, scope: !390)
!407 = !DILocalVariable(name: "features", scope: !390, file: !3, line: 462, type: !64)
!408 = !DILocation(line: 462, column: 13, scope: !390)
!409 = !DILocalVariable(name: "i", scope: !390, file: !3, line: 464, type: !410)
!410 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!411 = !DILocation(line: 464, column: 6, scope: !390)
!412 = !DILocation(line: 465, column: 9, scope: !413)
!413 = distinct !DILexicalBlock(scope: !390, file: !3, line: 465, column: 2)
!414 = !DILocation(line: 465, column: 7, scope: !413)
!415 = !DILocation(line: 465, column: 14, scope: !416)
!416 = distinct !DILexicalBlock(scope: !413, file: !3, line: 465, column: 2)
!417 = !DILocation(line: 465, column: 16, scope: !416)
!418 = !DILocation(line: 465, column: 2, scope: !413)
!419 = !DILocation(line: 467, column: 13, scope: !420)
!420 = distinct !DILexicalBlock(scope: !416, file: !3, line: 465, column: 42)
!421 = !DILocation(line: 467, column: 24, scope: !420)
!422 = !DILocation(line: 467, column: 27, scope: !420)
!423 = !DILocation(line: 467, column: 8, scope: !420)
!424 = !DILocation(line: 467, column: 10, scope: !420)
!425 = !DILocation(line: 468, column: 13, scope: !420)
!426 = !DILocation(line: 468, column: 24, scope: !420)
!427 = !DILocation(line: 468, column: 27, scope: !420)
!428 = !DILocation(line: 468, column: 8, scope: !420)
!429 = !DILocation(line: 468, column: 10, scope: !420)
!430 = !DILocation(line: 469, column: 13, scope: !420)
!431 = !DILocation(line: 469, column: 24, scope: !420)
!432 = !DILocation(line: 469, column: 27, scope: !420)
!433 = !DILocation(line: 469, column: 8, scope: !420)
!434 = !DILocation(line: 469, column: 10, scope: !420)
!435 = !DILocation(line: 470, column: 2, scope: !420)
!436 = !DILocation(line: 465, column: 38, scope: !416)
!437 = !DILocation(line: 465, column: 2, scope: !416)
!438 = distinct !{!438, !418, !439}
!439 = !DILocation(line: 470, column: 2, scope: !413)
!440 = !DILocation(line: 471, column: 7, scope: !390)
!441 = !DILocation(line: 471, column: 9, scope: !390)
!442 = !DILocation(line: 472, column: 7, scope: !390)
!443 = !DILocation(line: 472, column: 9, scope: !390)
!444 = !DILocation(line: 473, column: 7, scope: !390)
!445 = !DILocation(line: 473, column: 9, scope: !390)
!446 = !DILocation(line: 475, column: 9, scope: !447)
!447 = distinct !DILexicalBlock(scope: !390, file: !3, line: 475, column: 2)
!448 = !DILocation(line: 475, column: 7, scope: !447)
!449 = !DILocation(line: 475, column: 14, scope: !450)
!450 = distinct !DILexicalBlock(scope: !447, file: !3, line: 475, column: 2)
!451 = !DILocation(line: 475, column: 16, scope: !450)
!452 = !DILocation(line: 475, column: 2, scope: !447)
!453 = !DILocation(line: 476, column: 15, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !3, line: 475, column: 42)
!455 = !DILocation(line: 476, column: 26, scope: !454)
!456 = !DILocation(line: 476, column: 29, scope: !454)
!457 = !DILocation(line: 476, column: 38, scope: !454)
!458 = !DILocation(line: 476, column: 33, scope: !454)
!459 = !DILocation(line: 476, column: 31, scope: !454)
!460 = !DILocation(line: 476, column: 42, scope: !454)
!461 = !DILocation(line: 476, column: 53, scope: !454)
!462 = !DILocation(line: 476, column: 56, scope: !454)
!463 = !DILocation(line: 476, column: 65, scope: !454)
!464 = !DILocation(line: 476, column: 60, scope: !454)
!465 = !DILocation(line: 476, column: 58, scope: !454)
!466 = !DILocation(line: 477, column: 11, scope: !454)
!467 = !DILocation(line: 477, column: 6, scope: !454)
!468 = !DILocation(line: 477, column: 15, scope: !454)
!469 = !DILocation(line: 477, column: 26, scope: !454)
!470 = !DILocation(line: 477, column: 29, scope: !454)
!471 = !DILocation(line: 477, column: 13, scope: !454)
!472 = !DILocation(line: 476, column: 10, scope: !454)
!473 = !DILocation(line: 476, column: 12, scope: !454)
!474 = !DILocation(line: 478, column: 15, scope: !454)
!475 = !DILocation(line: 478, column: 26, scope: !454)
!476 = !DILocation(line: 478, column: 29, scope: !454)
!477 = !DILocation(line: 478, column: 38, scope: !454)
!478 = !DILocation(line: 478, column: 33, scope: !454)
!479 = !DILocation(line: 478, column: 31, scope: !454)
!480 = !DILocation(line: 478, column: 42, scope: !454)
!481 = !DILocation(line: 478, column: 53, scope: !454)
!482 = !DILocation(line: 478, column: 56, scope: !454)
!483 = !DILocation(line: 478, column: 65, scope: !454)
!484 = !DILocation(line: 478, column: 60, scope: !454)
!485 = !DILocation(line: 478, column: 58, scope: !454)
!486 = !DILocation(line: 479, column: 11, scope: !454)
!487 = !DILocation(line: 479, column: 6, scope: !454)
!488 = !DILocation(line: 479, column: 15, scope: !454)
!489 = !DILocation(line: 479, column: 26, scope: !454)
!490 = !DILocation(line: 479, column: 29, scope: !454)
!491 = !DILocation(line: 479, column: 13, scope: !454)
!492 = !DILocation(line: 478, column: 10, scope: !454)
!493 = !DILocation(line: 478, column: 12, scope: !454)
!494 = !DILocation(line: 480, column: 15, scope: !454)
!495 = !DILocation(line: 480, column: 26, scope: !454)
!496 = !DILocation(line: 480, column: 29, scope: !454)
!497 = !DILocation(line: 480, column: 38, scope: !454)
!498 = !DILocation(line: 480, column: 33, scope: !454)
!499 = !DILocation(line: 480, column: 31, scope: !454)
!500 = !DILocation(line: 480, column: 42, scope: !454)
!501 = !DILocation(line: 480, column: 53, scope: !454)
!502 = !DILocation(line: 480, column: 56, scope: !454)
!503 = !DILocation(line: 480, column: 65, scope: !454)
!504 = !DILocation(line: 480, column: 60, scope: !454)
!505 = !DILocation(line: 480, column: 58, scope: !454)
!506 = !DILocation(line: 481, column: 11, scope: !454)
!507 = !DILocation(line: 481, column: 6, scope: !454)
!508 = !DILocation(line: 481, column: 15, scope: !454)
!509 = !DILocation(line: 481, column: 26, scope: !454)
!510 = !DILocation(line: 481, column: 29, scope: !454)
!511 = !DILocation(line: 481, column: 13, scope: !454)
!512 = !DILocation(line: 480, column: 10, scope: !454)
!513 = !DILocation(line: 480, column: 12, scope: !454)
!514 = !DILocation(line: 482, column: 2, scope: !454)
!515 = !DILocation(line: 475, column: 38, scope: !450)
!516 = !DILocation(line: 475, column: 2, scope: !450)
!517 = distinct !{!517, !452, !518}
!518 = !DILocation(line: 482, column: 2, scope: !447)
!519 = !DILocation(line: 483, column: 9, scope: !390)
!520 = !DILocation(line: 483, column: 11, scope: !390)
!521 = !DILocation(line: 484, column: 9, scope: !390)
!522 = !DILocation(line: 484, column: 11, scope: !390)
!523 = !DILocation(line: 485, column: 9, scope: !390)
!524 = !DILocation(line: 485, column: 11, scope: !390)
!525 = !DILocalVariable(name: "meanmag", scope: !390, file: !3, line: 487, type: !6)
!526 = !DILocation(line: 487, column: 11, scope: !390)
!527 = !DILocation(line: 487, column: 26, scope: !390)
!528 = !DILocation(line: 487, column: 21, scope: !390)
!529 = !DILocation(line: 487, column: 33, scope: !390)
!530 = !DILocation(line: 487, column: 28, scope: !390)
!531 = !DILocation(line: 487, column: 27, scope: !390)
!532 = !DILocation(line: 487, column: 42, scope: !390)
!533 = !DILocation(line: 487, column: 37, scope: !390)
!534 = !DILocation(line: 487, column: 49, scope: !390)
!535 = !DILocation(line: 487, column: 44, scope: !390)
!536 = !DILocation(line: 487, column: 43, scope: !390)
!537 = !DILocation(line: 487, column: 35, scope: !390)
!538 = !DILocation(line: 487, column: 58, scope: !390)
!539 = !DILocation(line: 487, column: 53, scope: !390)
!540 = !DILocation(line: 487, column: 65, scope: !390)
!541 = !DILocation(line: 487, column: 60, scope: !390)
!542 = !DILocation(line: 487, column: 59, scope: !390)
!543 = !DILocation(line: 487, column: 51, scope: !390)
!544 = !DILocalVariable(name: "stddevmag", scope: !390, file: !3, line: 488, type: !6)
!545 = !DILocation(line: 488, column: 11, scope: !390)
!546 = !DILocation(line: 488, column: 30, scope: !390)
!547 = !DILocation(line: 488, column: 23, scope: !390)
!548 = !DILocation(line: 488, column: 39, scope: !390)
!549 = !DILocation(line: 488, column: 32, scope: !390)
!550 = !DILocation(line: 488, column: 31, scope: !390)
!551 = !DILocation(line: 488, column: 50, scope: !390)
!552 = !DILocation(line: 488, column: 43, scope: !390)
!553 = !DILocation(line: 488, column: 59, scope: !390)
!554 = !DILocation(line: 488, column: 52, scope: !390)
!555 = !DILocation(line: 488, column: 51, scope: !390)
!556 = !DILocation(line: 488, column: 41, scope: !390)
!557 = !DILocation(line: 488, column: 70, scope: !390)
!558 = !DILocation(line: 488, column: 63, scope: !390)
!559 = !DILocation(line: 488, column: 79, scope: !390)
!560 = !DILocation(line: 488, column: 72, scope: !390)
!561 = !DILocation(line: 488, column: 71, scope: !390)
!562 = !DILocation(line: 488, column: 61, scope: !390)
!563 = !DILocation(line: 489, column: 30, scope: !390)
!564 = !DILocation(line: 489, column: 23, scope: !390)
!565 = !DILocation(line: 489, column: 11, scope: !390)
!566 = !DILocation(line: 489, column: 21, scope: !390)
!567 = !DILocation(line: 490, column: 30, scope: !390)
!568 = !DILocation(line: 490, column: 23, scope: !390)
!569 = !DILocation(line: 490, column: 11, scope: !390)
!570 = !DILocation(line: 490, column: 21, scope: !390)
!571 = !DILocation(line: 492, column: 10, scope: !390)
!572 = !DILocation(line: 492, column: 2, scope: !390)
!573 = !DILocation(line: 495, column: 4, scope: !574)
!574 = distinct !DILexicalBlock(scope: !390, file: !3, line: 492, column: 20)
!575 = !DILocation(line: 495, column: 19, scope: !574)
!576 = !DILocation(line: 497, column: 4, scope: !574)
!577 = !DILocation(line: 499, column: 4, scope: !574)
!578 = !DILocation(line: 499, column: 19, scope: !574)
!579 = !DILocation(line: 501, column: 4, scope: !574)
!580 = !DILocation(line: 504, column: 4, scope: !574)
!581 = !DILocation(line: 506, column: 1, scope: !390)
!582 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 523, type: !96, scopeLine: 523, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!583 = !DILocalVariable(name: "move_less_error", scope: !582, file: !3, line: 524, type: !410)
!584 = !DILocation(line: 524, column: 6, scope: !582)
!585 = !DILocalVariable(name: "stat_less_error", scope: !582, file: !3, line: 525, type: !410)
!586 = !DILocation(line: 525, column: 6, scope: !582)
!587 = !DILocalVariable(name: "i", scope: !582, file: !3, line: 526, type: !410)
!588 = !DILocation(line: 526, column: 6, scope: !582)
!589 = !DILocalVariable(name: "class", scope: !582, file: !3, line: 527, type: !45)
!590 = !DILocation(line: 527, column: 10, scope: !582)
!591 = !DILocalVariable(name: "meanmag", scope: !582, file: !3, line: 528, type: !592)
!592 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!593 = !DILocation(line: 528, column: 11, scope: !582)
!594 = !DILocalVariable(name: "stddevmag", scope: !582, file: !3, line: 529, type: !592)
!595 = !DILocation(line: 529, column: 11, scope: !582)
!596 = !DILocation(line: 531, column: 12, scope: !582)
!597 = !DILocation(line: 531, column: 25, scope: !582)
!598 = !DILocation(line: 531, column: 10, scope: !582)
!599 = !DILocation(line: 532, column: 14, scope: !582)
!600 = !DILocation(line: 532, column: 27, scope: !582)
!601 = !DILocation(line: 532, column: 12, scope: !582)
!602 = !DILocation(line: 534, column: 9, scope: !603)
!603 = distinct !DILexicalBlock(scope: !582, file: !3, line: 534, column: 2)
!604 = !DILocation(line: 534, column: 7, scope: !603)
!605 = !DILocation(line: 534, column: 14, scope: !606)
!606 = distinct !DILexicalBlock(scope: !603, file: !3, line: 534, column: 2)
!607 = !DILocation(line: 534, column: 16, scope: !606)
!608 = !DILocation(line: 534, column: 2, scope: !603)
!609 = !DILocalVariable(name: "stat_mean_err", scope: !610, file: !3, line: 535, type: !592)
!610 = distinct !DILexicalBlock(scope: !606, file: !3, line: 534, column: 35)
!611 = !DILocation(line: 535, column: 12, scope: !610)
!612 = !DILocation(line: 535, column: 29, scope: !610)
!613 = !DILocation(line: 535, column: 50, scope: !610)
!614 = !DILocation(line: 535, column: 53, scope: !610)
!615 = !DILocation(line: 535, column: 63, scope: !610)
!616 = !DILocation(line: 535, column: 61, scope: !610)
!617 = !DILocation(line: 535, column: 28, scope: !610)
!618 = !DILocation(line: 536, column: 7, scope: !610)
!619 = !DILocation(line: 536, column: 28, scope: !610)
!620 = !DILocation(line: 536, column: 31, scope: !610)
!621 = !DILocation(line: 536, column: 41, scope: !610)
!622 = !DILocation(line: 536, column: 39, scope: !610)
!623 = !DILocation(line: 537, column: 7, scope: !610)
!624 = !DILocation(line: 537, column: 17, scope: !610)
!625 = !DILocation(line: 537, column: 38, scope: !610)
!626 = !DILocation(line: 537, column: 41, scope: !610)
!627 = !DILocation(line: 537, column: 15, scope: !610)
!628 = !DILocalVariable(name: "stat_sd_err", scope: !610, file: !3, line: 539, type: !592)
!629 = !DILocation(line: 539, column: 12, scope: !610)
!630 = !DILocation(line: 539, column: 27, scope: !610)
!631 = !DILocation(line: 539, column: 48, scope: !610)
!632 = !DILocation(line: 539, column: 51, scope: !610)
!633 = !DILocation(line: 539, column: 63, scope: !610)
!634 = !DILocation(line: 539, column: 61, scope: !610)
!635 = !DILocation(line: 539, column: 26, scope: !610)
!636 = !DILocation(line: 540, column: 7, scope: !610)
!637 = !DILocation(line: 540, column: 28, scope: !610)
!638 = !DILocation(line: 540, column: 31, scope: !610)
!639 = !DILocation(line: 540, column: 43, scope: !610)
!640 = !DILocation(line: 540, column: 41, scope: !610)
!641 = !DILocation(line: 541, column: 7, scope: !610)
!642 = !DILocation(line: 541, column: 19, scope: !610)
!643 = !DILocation(line: 541, column: 40, scope: !610)
!644 = !DILocation(line: 541, column: 43, scope: !610)
!645 = !DILocation(line: 541, column: 17, scope: !610)
!646 = !DILocalVariable(name: "move_mean_err", scope: !610, file: !3, line: 543, type: !592)
!647 = !DILocation(line: 543, column: 12, scope: !610)
!648 = !DILocation(line: 543, column: 29, scope: !610)
!649 = !DILocation(line: 543, column: 46, scope: !610)
!650 = !DILocation(line: 543, column: 49, scope: !610)
!651 = !DILocation(line: 543, column: 59, scope: !610)
!652 = !DILocation(line: 543, column: 57, scope: !610)
!653 = !DILocation(line: 543, column: 28, scope: !610)
!654 = !DILocation(line: 544, column: 7, scope: !610)
!655 = !DILocation(line: 544, column: 24, scope: !610)
!656 = !DILocation(line: 544, column: 27, scope: !610)
!657 = !DILocation(line: 544, column: 37, scope: !610)
!658 = !DILocation(line: 544, column: 35, scope: !610)
!659 = !DILocation(line: 545, column: 7, scope: !610)
!660 = !DILocation(line: 545, column: 17, scope: !610)
!661 = !DILocation(line: 545, column: 34, scope: !610)
!662 = !DILocation(line: 545, column: 37, scope: !610)
!663 = !DILocation(line: 545, column: 15, scope: !610)
!664 = !DILocalVariable(name: "move_sd_err", scope: !610, file: !3, line: 547, type: !592)
!665 = !DILocation(line: 547, column: 12, scope: !610)
!666 = !DILocation(line: 547, column: 27, scope: !610)
!667 = !DILocation(line: 547, column: 44, scope: !610)
!668 = !DILocation(line: 547, column: 47, scope: !610)
!669 = !DILocation(line: 547, column: 59, scope: !610)
!670 = !DILocation(line: 547, column: 57, scope: !610)
!671 = !DILocation(line: 547, column: 26, scope: !610)
!672 = !DILocation(line: 548, column: 7, scope: !610)
!673 = !DILocation(line: 548, column: 24, scope: !610)
!674 = !DILocation(line: 548, column: 27, scope: !610)
!675 = !DILocation(line: 548, column: 39, scope: !610)
!676 = !DILocation(line: 548, column: 37, scope: !610)
!677 = !DILocation(line: 549, column: 7, scope: !610)
!678 = !DILocation(line: 549, column: 19, scope: !610)
!679 = !DILocation(line: 549, column: 36, scope: !610)
!680 = !DILocation(line: 549, column: 39, scope: !610)
!681 = !DILocation(line: 549, column: 17, scope: !610)
!682 = !DILocation(line: 551, column: 7, scope: !683)
!683 = distinct !DILexicalBlock(scope: !610, file: !3, line: 551, column: 7)
!684 = !DILocation(line: 551, column: 23, scope: !683)
!685 = !DILocation(line: 551, column: 21, scope: !683)
!686 = !DILocation(line: 551, column: 7, scope: !610)
!687 = !DILocation(line: 552, column: 19, scope: !688)
!688 = distinct !DILexicalBlock(scope: !683, file: !3, line: 551, column: 38)
!689 = !DILocation(line: 553, column: 3, scope: !688)
!690 = !DILocation(line: 554, column: 19, scope: !691)
!691 = distinct !DILexicalBlock(scope: !683, file: !3, line: 553, column: 10)
!692 = !DILocation(line: 557, column: 7, scope: !693)
!693 = distinct !DILexicalBlock(scope: !610, file: !3, line: 557, column: 7)
!694 = !DILocation(line: 557, column: 21, scope: !693)
!695 = !DILocation(line: 557, column: 19, scope: !693)
!696 = !DILocation(line: 557, column: 7, scope: !610)
!697 = !DILocation(line: 558, column: 19, scope: !698)
!698 = distinct !DILexicalBlock(scope: !693, file: !3, line: 557, column: 34)
!699 = !DILocation(line: 559, column: 3, scope: !698)
!700 = !DILocation(line: 560, column: 19, scope: !701)
!701 = distinct !DILexicalBlock(scope: !693, file: !3, line: 559, column: 10)
!702 = !DILocation(line: 562, column: 2, scope: !610)
!703 = !DILocation(line: 534, column: 30, scope: !606)
!704 = !DILocation(line: 534, column: 2, scope: !606)
!705 = distinct !{!705, !608, !706}
!706 = !DILocation(line: 562, column: 2, scope: !603)
!707 = !DILocation(line: 564, column: 15, scope: !582)
!708 = !DILocation(line: 564, column: 33, scope: !582)
!709 = !DILocation(line: 564, column: 31, scope: !582)
!710 = !DILocation(line: 564, column: 14, scope: !582)
!711 = !DILocation(line: 564, column: 2, scope: !582)
!712 = !DILocation(line: 564, column: 12, scope: !582)
!713 = !DILocation(line: 568, column: 1, scope: !582)
!714 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 585, type: !96, scopeLine: 586, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!715 = !DILocalVariable(name: "movingCount", scope: !714, file: !3, line: 587, type: !6)
!716 = !DILocation(line: 587, column: 11, scope: !714)
!717 = !DILocalVariable(name: "stationaryCount", scope: !714, file: !3, line: 587, type: !6)
!718 = !DILocation(line: 587, column: 28, scope: !714)
!719 = !DILocation(line: 589, column: 4, scope: !714)
!720 = !DILocation(line: 589, column: 2, scope: !714)
!721 = !DILocation(line: 591, column: 10, scope: !714)
!722 = !DILocation(line: 591, column: 2, scope: !714)
!723 = !DILocation(line: 594, column: 6, scope: !724)
!724 = distinct !DILexicalBlock(scope: !714, file: !3, line: 591, column: 21)
!725 = !DILocation(line: 594, column: 4, scope: !724)
!726 = !DILocation(line: 595, column: 4, scope: !724)
!727 = !DILocation(line: 598, column: 6, scope: !724)
!728 = !DILocation(line: 598, column: 4, scope: !724)
!729 = !DILocation(line: 599, column: 4, scope: !724)
!730 = !DILocation(line: 602, column: 6, scope: !731)
!731 = distinct !DILexicalBlock(scope: !714, file: !3, line: 602, column: 6)
!732 = !DILocation(line: 602, column: 21, scope: !731)
!733 = !DILocation(line: 602, column: 6, scope: !714)
!734 = !DILocalVariable(name: "resultStationaryPct", scope: !735, file: !3, line: 604, type: !6)
!735 = distinct !DILexicalBlock(scope: !731, file: !3, line: 602, column: 44)
!736 = !DILocation(line: 604, column: 12, scope: !735)
!737 = !DILocation(line: 604, column: 34, scope: !735)
!738 = !DILocation(line: 604, column: 54, scope: !735)
!739 = !DILocation(line: 604, column: 62, scope: !735)
!740 = !DILocation(line: 604, column: 60, scope: !735)
!741 = !DILocalVariable(name: "resultMovingPct", scope: !735, file: !3, line: 605, type: !6)
!742 = !DILocation(line: 605, column: 12, scope: !735)
!743 = !DILocation(line: 605, column: 30, scope: !735)
!744 = !DILocation(line: 605, column: 46, scope: !735)
!745 = !DILocation(line: 605, column: 54, scope: !735)
!746 = !DILocation(line: 605, column: 52, scope: !735)
!747 = !DILocalVariable(name: "sum", scope: !735, file: !3, line: 607, type: !6)
!748 = !DILocation(line: 607, column: 12, scope: !735)
!749 = !DILocation(line: 607, column: 18, scope: !735)
!750 = !DILocation(line: 607, column: 40, scope: !735)
!751 = !DILocation(line: 607, column: 38, scope: !735)
!752 = !DILocation(line: 610, column: 2, scope: !735)
!753 = !DILocation(line: 613, column: 1, scope: !714)
!754 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 630, type: !96, scopeLine: 631, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!755 = !DILocation(line: 635, column: 2, scope: !754)
!756 = !DILocation(line: 635, column: 9, scope: !754)
!757 = !DILocation(line: 635, column: 35, scope: !754)
!758 = !DILocalVariable(name: "sample", scope: !759, file: !3, line: 637, type: !52)
!759 = distinct !DILexicalBlock(scope: !754, file: !3, line: 635, column: 57)
!760 = !DILocation(line: 637, column: 17, scope: !759)
!761 = !DILocation(line: 638, column: 43, scope: !759)
!762 = !DILocation(line: 638, column: 14, scope: !759)
!763 = !DILocation(line: 638, column: 3, scope: !759)
!764 = !DILocation(line: 638, column: 12, scope: !759)
!765 = !DILocation(line: 639, column: 5, scope: !759)
!766 = !DILocation(line: 639, column: 3, scope: !759)
!767 = distinct !{!767, !755, !768}
!768 = !DILocation(line: 641, column: 2, scope: !754)
!769 = !DILocation(line: 643, column: 2, scope: !754)
!770 = !DILocation(line: 643, column: 22, scope: !754)
!771 = !DILocation(line: 658, column: 1, scope: !754)
!772 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 675, type: !96, scopeLine: 676, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!773 = !DILocalVariable(name: "trainingSetSize", scope: !772, file: !3, line: 677, type: !6)
!774 = !DILocation(line: 677, column: 11, scope: !772)
!775 = !DILocalVariable(name: "class", scope: !772, file: !3, line: 678, type: !6)
!776 = !DILocation(line: 678, column: 11, scope: !772)
!777 = !DILocation(line: 680, column: 10, scope: !772)
!778 = !DILocation(line: 680, column: 2, scope: !772)
!779 = !DILocation(line: 682, column: 4, scope: !780)
!780 = distinct !DILexicalBlock(scope: !772, file: !3, line: 680, column: 21)
!781 = !DILocation(line: 682, column: 25, scope: !780)
!782 = !DILocation(line: 682, column: 48, scope: !780)
!783 = !DILocation(line: 683, column: 4, scope: !780)
!784 = !DILocation(line: 685, column: 4, scope: !780)
!785 = !DILocation(line: 685, column: 21, scope: !780)
!786 = !DILocation(line: 685, column: 44, scope: !780)
!787 = !DILocation(line: 686, column: 4, scope: !780)
!788 = !DILocation(line: 689, column: 4, scope: !772)
!789 = !DILocation(line: 689, column: 2, scope: !772)
!790 = !DILocation(line: 691, column: 6, scope: !791)
!791 = distinct !DILexicalBlock(scope: !772, file: !3, line: 691, column: 6)
!792 = !DILocation(line: 691, column: 26, scope: !791)
!793 = !DILocation(line: 691, column: 6, scope: !772)
!794 = !DILocation(line: 693, column: 2, scope: !795)
!795 = distinct !DILexicalBlock(scope: !791, file: !3, line: 691, column: 40)
!796 = !DILocation(line: 697, column: 1, scope: !772)
!797 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 699, type: !96, scopeLine: 699, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!798 = !DILocation(line: 701, column: 2, scope: !797)
!799 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 705, type: !800, scopeLine: 705, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!800 = !DISubroutineType(types: !801)
!801 = !{!410}
!802 = !DILocation(line: 707, column: 16, scope: !799)
!803 = !DILocation(line: 708, column: 10, scope: !799)
!804 = !DILocation(line: 709, column: 12, scope: !799)
!805 = !DILocation(line: 710, column: 2, scope: !799)
!806 = !DILocation(line: 712, column: 2, scope: !799)
!807 = !DILocation(line: 714, column: 2, scope: !799)
!808 = !DILocation(line: 714, column: 9, scope: !799)
!809 = !DILocation(line: 714, column: 20, scope: !799)
!810 = !DILocation(line: 716, column: 3, scope: !811)
!811 = distinct !DILexicalBlock(scope: !799, file: !3, line: 714, column: 25)
!812 = !DILocation(line: 718, column: 7, scope: !813)
!813 = distinct !DILexicalBlock(scope: !811, file: !3, line: 718, column: 7)
!814 = !DILocation(line: 718, column: 17, scope: !813)
!815 = !DILocation(line: 718, column: 22, scope: !813)
!816 = !DILocation(line: 718, column: 25, scope: !813)
!817 = !DILocation(line: 718, column: 35, scope: !813)
!818 = !DILocation(line: 718, column: 7, scope: !811)
!819 = !DILocation(line: 720, column: 4, scope: !820)
!820 = distinct !DILexicalBlock(scope: !813, file: !3, line: 718, column: 40)
!821 = !DILocation(line: 722, column: 3, scope: !820)
!822 = !DILocation(line: 722, column: 14, scope: !823)
!823 = distinct !DILexicalBlock(scope: !813, file: !3, line: 722, column: 14)
!824 = !DILocation(line: 722, column: 24, scope: !823)
!825 = !DILocation(line: 722, column: 14, scope: !813)
!826 = !DILocation(line: 724, column: 4, scope: !827)
!827 = distinct !DILexicalBlock(scope: !823, file: !3, line: 722, column: 30)
!828 = !DILocation(line: 725, column: 3, scope: !827)
!829 = !DILocation(line: 727, column: 4, scope: !830)
!830 = distinct !DILexicalBlock(scope: !823, file: !3, line: 725, column: 10)
!831 = !DILocation(line: 730, column: 3, scope: !811)
!832 = !DILocation(line: 731, column: 4, scope: !833)
!833 = distinct !DILexicalBlock(scope: !811, file: !3, line: 730, column: 13)
!834 = !DILocation(line: 732, column: 4, scope: !833)
!835 = !DILocation(line: 733, column: 4, scope: !833)
!836 = !DILocation(line: 735, column: 8, scope: !837)
!837 = distinct !DILexicalBlock(scope: !833, file: !3, line: 735, column: 8)
!838 = !DILocation(line: 735, column: 18, scope: !837)
!839 = !DILocation(line: 735, column: 23, scope: !837)
!840 = !DILocation(line: 735, column: 26, scope: !837)
!841 = !DILocation(line: 735, column: 36, scope: !837)
!842 = !DILocation(line: 735, column: 8, scope: !833)
!843 = !DILocation(line: 737, column: 5, scope: !844)
!844 = distinct !DILexicalBlock(scope: !837, file: !3, line: 735, column: 41)
!845 = !DILocation(line: 739, column: 9, scope: !846)
!846 = distinct !DILexicalBlock(scope: !844, file: !3, line: 739, column: 9)
!847 = !DILocation(line: 739, column: 29, scope: !846)
!848 = !DILocation(line: 739, column: 9, scope: !844)
!849 = !DILocation(line: 740, column: 6, scope: !846)
!850 = !DILocation(line: 742, column: 4, scope: !844)
!851 = !DILocation(line: 742, column: 15, scope: !852)
!852 = distinct !DILexicalBlock(scope: !837, file: !3, line: 742, column: 15)
!853 = !DILocation(line: 742, column: 25, scope: !852)
!854 = !DILocation(line: 742, column: 15, scope: !837)
!855 = !DILocation(line: 744, column: 5, scope: !856)
!856 = distinct !DILexicalBlock(scope: !852, file: !3, line: 742, column: 31)
!857 = !DILocation(line: 745, column: 5, scope: !856)
!858 = !DILocation(line: 747, column: 9, scope: !859)
!859 = distinct !DILexicalBlock(scope: !856, file: !3, line: 747, column: 9)
!860 = !DILocation(line: 747, column: 24, scope: !859)
!861 = !DILocation(line: 747, column: 9, scope: !856)
!862 = !DILocation(line: 748, column: 6, scope: !859)
!863 = !DILocation(line: 750, column: 4, scope: !856)
!864 = distinct !{!864, !831, !865}
!865 = !DILocation(line: 751, column: 3, scope: !811)
!866 = !DILocation(line: 753, column: 3, scope: !811)
!867 = distinct !{!867, !807, !868}
!868 = !DILocation(line: 754, column: 2, scope: !799)
!869 = !DILocation(line: 756, column: 2, scope: !799)
!870 = !DILocation(line: 757, column: 1, scope: !799)
