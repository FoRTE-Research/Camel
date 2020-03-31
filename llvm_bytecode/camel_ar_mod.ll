; ModuleID = 'camel_ar_mod.bc'
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
  %sample = alloca %struct.threeAxis_t_8*, align 2
  %transformedSample = alloca %struct.threeAxis_t_8, align 1
  %i = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8** %sample, metadata !315, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %transformedSample, metadata !318, metadata !DIExpression()), !dbg !319
  call void @llvm.dbg.declare(metadata i16* %i, metadata !320, metadata !DIExpression()), !dbg !322
  store i16 0, i16* %i, align 2, !dbg !322
  br label %for.cond, !dbg !323

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !324
  %cmp = icmp ult i16 %0, 3, !dbg !326
  br i1 %cmp, label %for.body, label %for.end, !dbg !327

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !328
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !328
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !328
  %2 = load i16, i16* %i, align 2, !dbg !331
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !328
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !332
  %3 = load i8, i8* %x, align 1, !dbg !332
  %conv = sext i8 %3 to i16, !dbg !328
  %cmp1 = icmp slt i16 %conv, 10, !dbg !333
  br i1 %cmp1, label %if.then, label %lor.lhs.false, !dbg !334

lor.lhs.false:                                    ; preds = %for.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !335
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !335
  %window4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 6, !dbg !335
  %5 = load i16, i16* %i, align 2, !dbg !336
  %arrayidx5 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window4, i16 0, i16 %5, !dbg !335
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx5, i32 0, i32 1, !dbg !337
  %6 = load i8, i8* %y, align 1, !dbg !337
  %conv6 = sext i8 %6 to i16, !dbg !335
  %cmp7 = icmp slt i16 %conv6, 10, !dbg !338
  br i1 %cmp7, label %if.then, label %lor.lhs.false9, !dbg !339

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !340
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !340
  %window11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 6, !dbg !340
  %8 = load i16, i16* %i, align 2, !dbg !341
  %arrayidx12 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window11, i16 0, i16 %8, !dbg !340
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx12, i32 0, i32 2, !dbg !342
  %9 = load i8, i8* %z, align 1, !dbg !342
  %conv13 = sext i8 %9 to i16, !dbg !340
  %cmp14 = icmp slt i16 %conv13, 10, !dbg !343
  br i1 %cmp14, label %if.then, label %if.end, !dbg !344

if.then:                                          ; preds = %lor.lhs.false9, %lor.lhs.false, %for.body
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !345
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !345
  %window17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 6, !dbg !345
  %11 = load i16, i16* %i, align 2, !dbg !347
  %arrayidx18 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window17, i16 0, i16 %11, !dbg !345
  %x19 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx18, i32 0, i32 0, !dbg !348
  %12 = load i8, i8* %x19, align 1, !dbg !348
  %conv20 = sext i8 %12 to i16, !dbg !345
  %cmp21 = icmp sgt i16 %conv20, 10, !dbg !349
  br i1 %cmp21, label %cond.true, label %cond.false, !dbg !350

cond.true:                                        ; preds = %if.then
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !351
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !351
  %window24 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 6, !dbg !351
  %14 = load i16, i16* %i, align 2, !dbg !352
  %arrayidx25 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window24, i16 0, i16 %14, !dbg !351
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx25, i32 0, i32 0, !dbg !353
  %15 = load i8, i8* %x26, align 1, !dbg !353
  %conv27 = sext i8 %15 to i16, !dbg !351
  br label %cond.end, !dbg !350

cond.false:                                       ; preds = %if.then
  br label %cond.end, !dbg !350

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %conv27, %cond.true ], [ 0, %cond.false ], !dbg !350
  %conv28 = trunc i16 %cond to i8, !dbg !350
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !354
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !354
  %window30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 6, !dbg !354
  %17 = load i16, i16* %i, align 2, !dbg !355
  %arrayidx31 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window30, i16 0, i16 %17, !dbg !354
  %x32 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx31, i32 0, i32 0, !dbg !356
  store i8 %conv28, i8* %x32, align 1, !dbg !357
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !358
  %globals33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !358
  %window34 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals33, i32 0, i32 6, !dbg !358
  %19 = load i16, i16* %i, align 2, !dbg !359
  %arrayidx35 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window34, i16 0, i16 %19, !dbg !358
  %y36 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx35, i32 0, i32 1, !dbg !360
  %20 = load i8, i8* %y36, align 1, !dbg !360
  %conv37 = sext i8 %20 to i16, !dbg !358
  %cmp38 = icmp sgt i16 %conv37, 10, !dbg !361
  br i1 %cmp38, label %cond.true40, label %cond.false46, !dbg !362

cond.true40:                                      ; preds = %cond.end
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !363
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !363
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !363
  %22 = load i16, i16* %i, align 2, !dbg !364
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %22, !dbg !363
  %y44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 1, !dbg !365
  %23 = load i8, i8* %y44, align 1, !dbg !365
  %conv45 = sext i8 %23 to i16, !dbg !363
  br label %cond.end47, !dbg !362

cond.false46:                                     ; preds = %cond.end
  br label %cond.end47, !dbg !362

cond.end47:                                       ; preds = %cond.false46, %cond.true40
  %cond48 = phi i16 [ %conv45, %cond.true40 ], [ 0, %cond.false46 ], !dbg !362
  %conv49 = trunc i16 %cond48 to i8, !dbg !362
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !366
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !366
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !366
  %25 = load i16, i16* %i, align 2, !dbg !367
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %25, !dbg !366
  %y53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 1, !dbg !368
  store i8 %conv49, i8* %y53, align 1, !dbg !369
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !370
  %window55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 6, !dbg !370
  %27 = load i16, i16* %i, align 2, !dbg !371
  %arrayidx56 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window55, i16 0, i16 %27, !dbg !370
  %z57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx56, i32 0, i32 2, !dbg !372
  %28 = load i8, i8* %z57, align 1, !dbg !372
  %conv58 = sext i8 %28 to i16, !dbg !370
  %cmp59 = icmp sgt i16 %conv58, 10, !dbg !373
  br i1 %cmp59, label %cond.true61, label %cond.false67, !dbg !374

cond.true61:                                      ; preds = %cond.end47
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !375
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !375
  %window63 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals62, i32 0, i32 6, !dbg !375
  %30 = load i16, i16* %i, align 2, !dbg !376
  %arrayidx64 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window63, i16 0, i16 %30, !dbg !375
  %z65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx64, i32 0, i32 2, !dbg !377
  %31 = load i8, i8* %z65, align 1, !dbg !377
  %conv66 = sext i8 %31 to i16, !dbg !375
  br label %cond.end68, !dbg !374

cond.false67:                                     ; preds = %cond.end47
  br label %cond.end68, !dbg !374

cond.end68:                                       ; preds = %cond.false67, %cond.true61
  %cond69 = phi i16 [ %conv66, %cond.true61 ], [ 0, %cond.false67 ], !dbg !374
  %conv70 = trunc i16 %cond69 to i8, !dbg !374
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !378
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 1, !dbg !378
  %window72 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals71, i32 0, i32 6, !dbg !378
  %33 = load i16, i16* %i, align 2, !dbg !379
  %arrayidx73 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window72, i16 0, i16 %33, !dbg !378
  %z74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx73, i32 0, i32 2, !dbg !380
  store i8 %conv70, i8* %z74, align 1, !dbg !381
  br label %if.end, !dbg !382

if.end:                                           ; preds = %cond.end68, %lor.lhs.false9
  br label %for.inc, !dbg !383

for.inc:                                          ; preds = %if.end
  %34 = load i16, i16* %i, align 2, !dbg !384
  %inc = add i16 %34, 1, !dbg !384
  store i16 %inc, i16* %i, align 2, !dbg !384
  br label %for.cond, !dbg !385, !llvm.loop !386

for.end:                                          ; preds = %for.cond
  ret void, !dbg !388
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_featurize() #0 !dbg !389 {
entry:
  %mean = alloca %struct.threeAxis_t_8, align 1
  %stddev = alloca %struct.threeAxis_t_8, align 1
  %features = alloca %struct.features_t, align 2
  %i = alloca i16, align 2
  %meanmag = alloca i16, align 2
  %stddevmag = alloca i16, align 2
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %mean, metadata !390, metadata !DIExpression()), !dbg !391
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %stddev, metadata !392, metadata !DIExpression()), !dbg !393
  %z = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !394
  store i8 0, i8* %z, align 1, !dbg !395
  %y = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !396
  store i8 0, i8* %y, align 1, !dbg !397
  %x = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !398
  store i8 0, i8* %x, align 1, !dbg !399
  %z1 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !400
  store i8 0, i8* %z1, align 1, !dbg !401
  %y2 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !402
  store i8 0, i8* %y2, align 1, !dbg !403
  %x3 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !404
  store i8 0, i8* %x3, align 1, !dbg !405
  call void @llvm.dbg.declare(metadata %struct.features_t* %features, metadata !406, metadata !DIExpression()), !dbg !407
  call void @llvm.dbg.declare(metadata i16* %i, metadata !408, metadata !DIExpression()), !dbg !410
  store i16 0, i16* %i, align 2, !dbg !411
  br label %for.cond, !dbg !413

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !414
  %cmp = icmp slt i16 %0, 3, !dbg !416
  br i1 %cmp, label %for.body, label %for.end, !dbg !417

for.body:                                         ; preds = %for.cond
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !418
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !418
  %window = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 6, !dbg !418
  %2 = load i16, i16* %i, align 2, !dbg !420
  %arrayidx = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window, i16 0, i16 %2, !dbg !418
  %x4 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx, i32 0, i32 0, !dbg !421
  %3 = load i8, i8* %x4, align 1, !dbg !421
  %conv = sext i8 %3 to i16, !dbg !418
  %x5 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !422
  %4 = load i8, i8* %x5, align 1, !dbg !423
  %conv6 = sext i8 %4 to i16, !dbg !423
  %add = add nsw i16 %conv6, %conv, !dbg !423
  %conv7 = trunc i16 %add to i8, !dbg !423
  store i8 %conv7, i8* %x5, align 1, !dbg !423
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !424
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !424
  %window9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 6, !dbg !424
  %6 = load i16, i16* %i, align 2, !dbg !425
  %arrayidx10 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window9, i16 0, i16 %6, !dbg !424
  %y11 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx10, i32 0, i32 1, !dbg !426
  %7 = load i8, i8* %y11, align 1, !dbg !426
  %conv12 = sext i8 %7 to i16, !dbg !424
  %y13 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !427
  %8 = load i8, i8* %y13, align 1, !dbg !428
  %conv14 = sext i8 %8 to i16, !dbg !428
  %add15 = add nsw i16 %conv14, %conv12, !dbg !428
  %conv16 = trunc i16 %add15 to i8, !dbg !428
  store i8 %conv16, i8* %y13, align 1, !dbg !428
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !429
  %globals17 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !429
  %window18 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals17, i32 0, i32 6, !dbg !429
  %10 = load i16, i16* %i, align 2, !dbg !430
  %arrayidx19 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window18, i16 0, i16 %10, !dbg !429
  %z20 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx19, i32 0, i32 2, !dbg !431
  %11 = load i8, i8* %z20, align 1, !dbg !431
  %conv21 = sext i8 %11 to i16, !dbg !429
  %z22 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !432
  %12 = load i8, i8* %z22, align 1, !dbg !433
  %conv23 = sext i8 %12 to i16, !dbg !433
  %add24 = add nsw i16 %conv23, %conv21, !dbg !433
  %conv25 = trunc i16 %add24 to i8, !dbg !433
  store i8 %conv25, i8* %z22, align 1, !dbg !433
  br label %for.inc, !dbg !434

for.inc:                                          ; preds = %for.body
  %13 = load i16, i16* %i, align 2, !dbg !435
  %inc = add nsw i16 %13, 1, !dbg !435
  store i16 %inc, i16* %i, align 2, !dbg !435
  br label %for.cond, !dbg !436, !llvm.loop !437

for.end:                                          ; preds = %for.cond
  %x26 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !439
  %14 = load i8, i8* %x26, align 1, !dbg !440
  %conv27 = sext i8 %14 to i16, !dbg !440
  %shr = ashr i16 %conv27, 2, !dbg !440
  %conv28 = trunc i16 %shr to i8, !dbg !440
  store i8 %conv28, i8* %x26, align 1, !dbg !440
  %y29 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !441
  %15 = load i8, i8* %y29, align 1, !dbg !442
  %conv30 = sext i8 %15 to i16, !dbg !442
  %shr31 = ashr i16 %conv30, 2, !dbg !442
  %conv32 = trunc i16 %shr31 to i8, !dbg !442
  store i8 %conv32, i8* %y29, align 1, !dbg !442
  %z33 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !443
  %16 = load i8, i8* %z33, align 1, !dbg !444
  %conv34 = sext i8 %16 to i16, !dbg !444
  %shr35 = ashr i16 %conv34, 2, !dbg !444
  %conv36 = trunc i16 %shr35 to i8, !dbg !444
  store i8 %conv36, i8* %z33, align 1, !dbg !444
  store i16 0, i16* %i, align 2, !dbg !445
  br label %for.cond37, !dbg !447

for.cond37:                                       ; preds = %for.inc135, %for.end
  %17 = load i16, i16* %i, align 2, !dbg !448
  %cmp38 = icmp slt i16 %17, 3, !dbg !450
  br i1 %cmp38, label %for.body40, label %for.end137, !dbg !451

for.body40:                                       ; preds = %for.cond37
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !452
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !452
  %window42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 6, !dbg !452
  %19 = load i16, i16* %i, align 2, !dbg !454
  %arrayidx43 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window42, i16 0, i16 %19, !dbg !452
  %x44 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx43, i32 0, i32 0, !dbg !455
  %20 = load i8, i8* %x44, align 1, !dbg !455
  %conv45 = sext i8 %20 to i16, !dbg !452
  %x46 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !456
  %21 = load i8, i8* %x46, align 1, !dbg !456
  %conv47 = sext i8 %21 to i16, !dbg !457
  %cmp48 = icmp sgt i16 %conv45, %conv47, !dbg !458
  br i1 %cmp48, label %cond.true, label %cond.false, !dbg !452

cond.true:                                        ; preds = %for.body40
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !459
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !459
  %window51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 6, !dbg !459
  %23 = load i16, i16* %i, align 2, !dbg !460
  %arrayidx52 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window51, i16 0, i16 %23, !dbg !459
  %x53 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx52, i32 0, i32 0, !dbg !461
  %24 = load i8, i8* %x53, align 1, !dbg !461
  %conv54 = sext i8 %24 to i16, !dbg !459
  %x55 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !462
  %25 = load i8, i8* %x55, align 1, !dbg !462
  %conv56 = sext i8 %25 to i16, !dbg !463
  %sub = sub nsw i16 %conv54, %conv56, !dbg !464
  br label %cond.end, !dbg !452

cond.false:                                       ; preds = %for.body40
  %x57 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !465
  %26 = load i8, i8* %x57, align 1, !dbg !465
  %conv58 = sext i8 %26 to i16, !dbg !466
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !467
  %globals59 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !467
  %window60 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals59, i32 0, i32 6, !dbg !467
  %28 = load i16, i16* %i, align 2, !dbg !468
  %arrayidx61 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window60, i16 0, i16 %28, !dbg !467
  %x62 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx61, i32 0, i32 0, !dbg !469
  %29 = load i8, i8* %x62, align 1, !dbg !469
  %conv63 = sext i8 %29 to i16, !dbg !467
  %sub64 = sub nsw i16 %conv58, %conv63, !dbg !470
  br label %cond.end, !dbg !452

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i16 [ %sub, %cond.true ], [ %sub64, %cond.false ], !dbg !452
  %x65 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !471
  %30 = load i8, i8* %x65, align 1, !dbg !472
  %conv66 = sext i8 %30 to i16, !dbg !472
  %add67 = add nsw i16 %conv66, %cond, !dbg !472
  %conv68 = trunc i16 %add67 to i8, !dbg !472
  store i8 %conv68, i8* %x65, align 1, !dbg !472
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !473
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1, !dbg !473
  %window70 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 6, !dbg !473
  %32 = load i16, i16* %i, align 2, !dbg !474
  %arrayidx71 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window70, i16 0, i16 %32, !dbg !473
  %y72 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx71, i32 0, i32 1, !dbg !475
  %33 = load i8, i8* %y72, align 1, !dbg !475
  %conv73 = sext i8 %33 to i16, !dbg !473
  %y74 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !476
  %34 = load i8, i8* %y74, align 1, !dbg !476
  %conv75 = sext i8 %34 to i16, !dbg !477
  %cmp76 = icmp sgt i16 %conv73, %conv75, !dbg !478
  br i1 %cmp76, label %cond.true78, label %cond.false87, !dbg !473

cond.true78:                                      ; preds = %cond.end
  %35 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !479
  %globals79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %35, i32 0, i32 1, !dbg !479
  %window80 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals79, i32 0, i32 6, !dbg !479
  %36 = load i16, i16* %i, align 2, !dbg !480
  %arrayidx81 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window80, i16 0, i16 %36, !dbg !479
  %y82 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx81, i32 0, i32 1, !dbg !481
  %37 = load i8, i8* %y82, align 1, !dbg !481
  %conv83 = sext i8 %37 to i16, !dbg !479
  %y84 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !482
  %38 = load i8, i8* %y84, align 1, !dbg !482
  %conv85 = sext i8 %38 to i16, !dbg !483
  %sub86 = sub nsw i16 %conv83, %conv85, !dbg !484
  br label %cond.end96, !dbg !473

cond.false87:                                     ; preds = %cond.end
  %y88 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !485
  %39 = load i8, i8* %y88, align 1, !dbg !485
  %conv89 = sext i8 %39 to i16, !dbg !486
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !487
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1, !dbg !487
  %window91 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 6, !dbg !487
  %41 = load i16, i16* %i, align 2, !dbg !488
  %arrayidx92 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window91, i16 0, i16 %41, !dbg !487
  %y93 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx92, i32 0, i32 1, !dbg !489
  %42 = load i8, i8* %y93, align 1, !dbg !489
  %conv94 = sext i8 %42 to i16, !dbg !487
  %sub95 = sub nsw i16 %conv89, %conv94, !dbg !490
  br label %cond.end96, !dbg !473

cond.end96:                                       ; preds = %cond.false87, %cond.true78
  %cond97 = phi i16 [ %sub86, %cond.true78 ], [ %sub95, %cond.false87 ], !dbg !473
  %y98 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !491
  %43 = load i8, i8* %y98, align 1, !dbg !492
  %conv99 = sext i8 %43 to i16, !dbg !492
  %add100 = add nsw i16 %conv99, %cond97, !dbg !492
  %conv101 = trunc i16 %add100 to i8, !dbg !492
  store i8 %conv101, i8* %y98, align 1, !dbg !492
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !493
  %globals102 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1, !dbg !493
  %window103 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals102, i32 0, i32 6, !dbg !493
  %45 = load i16, i16* %i, align 2, !dbg !494
  %arrayidx104 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window103, i16 0, i16 %45, !dbg !493
  %z105 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx104, i32 0, i32 2, !dbg !495
  %46 = load i8, i8* %z105, align 1, !dbg !495
  %conv106 = sext i8 %46 to i16, !dbg !493
  %z107 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !496
  %47 = load i8, i8* %z107, align 1, !dbg !496
  %conv108 = sext i8 %47 to i16, !dbg !497
  %cmp109 = icmp sgt i16 %conv106, %conv108, !dbg !498
  br i1 %cmp109, label %cond.true111, label %cond.false120, !dbg !493

cond.true111:                                     ; preds = %cond.end96
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !499
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !499
  %window113 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 6, !dbg !499
  %49 = load i16, i16* %i, align 2, !dbg !500
  %arrayidx114 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window113, i16 0, i16 %49, !dbg !499
  %z115 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx114, i32 0, i32 2, !dbg !501
  %50 = load i8, i8* %z115, align 1, !dbg !501
  %conv116 = sext i8 %50 to i16, !dbg !499
  %z117 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !502
  %51 = load i8, i8* %z117, align 1, !dbg !502
  %conv118 = sext i8 %51 to i16, !dbg !503
  %sub119 = sub nsw i16 %conv116, %conv118, !dbg !504
  br label %cond.end129, !dbg !493

cond.false120:                                    ; preds = %cond.end96
  %z121 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !505
  %52 = load i8, i8* %z121, align 1, !dbg !505
  %conv122 = sext i8 %52 to i16, !dbg !506
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !507
  %globals123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1, !dbg !507
  %window124 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals123, i32 0, i32 6, !dbg !507
  %54 = load i16, i16* %i, align 2, !dbg !508
  %arrayidx125 = getelementptr inbounds [3 x %struct.threeAxis_t_8], [3 x %struct.threeAxis_t_8]* %window124, i16 0, i16 %54, !dbg !507
  %z126 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %arrayidx125, i32 0, i32 2, !dbg !509
  %55 = load i8, i8* %z126, align 1, !dbg !509
  %conv127 = sext i8 %55 to i16, !dbg !507
  %sub128 = sub nsw i16 %conv122, %conv127, !dbg !510
  br label %cond.end129, !dbg !493

cond.end129:                                      ; preds = %cond.false120, %cond.true111
  %cond130 = phi i16 [ %sub119, %cond.true111 ], [ %sub128, %cond.false120 ], !dbg !493
  %z131 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !511
  %56 = load i8, i8* %z131, align 1, !dbg !512
  %conv132 = sext i8 %56 to i16, !dbg !512
  %add133 = add nsw i16 %conv132, %cond130, !dbg !512
  %conv134 = trunc i16 %add133 to i8, !dbg !512
  store i8 %conv134, i8* %z131, align 1, !dbg !512
  br label %for.inc135, !dbg !513

for.inc135:                                       ; preds = %cond.end129
  %57 = load i16, i16* %i, align 2, !dbg !514
  %inc136 = add nsw i16 %57, 1, !dbg !514
  store i16 %inc136, i16* %i, align 2, !dbg !514
  br label %for.cond37, !dbg !515, !llvm.loop !516

for.end137:                                       ; preds = %for.cond37
  %x138 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !518
  %58 = load i8, i8* %x138, align 1, !dbg !519
  %conv139 = sext i8 %58 to i16, !dbg !519
  %shr140 = ashr i16 %conv139, 2, !dbg !519
  %conv141 = trunc i16 %shr140 to i8, !dbg !519
  store i8 %conv141, i8* %x138, align 1, !dbg !519
  %y142 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !520
  %59 = load i8, i8* %y142, align 1, !dbg !521
  %conv143 = sext i8 %59 to i16, !dbg !521
  %shr144 = ashr i16 %conv143, 2, !dbg !521
  %conv145 = trunc i16 %shr144 to i8, !dbg !521
  store i8 %conv145, i8* %y142, align 1, !dbg !521
  %z146 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !522
  %60 = load i8, i8* %z146, align 1, !dbg !523
  %conv147 = sext i8 %60 to i16, !dbg !523
  %shr148 = ashr i16 %conv147, 2, !dbg !523
  %conv149 = trunc i16 %shr148 to i8, !dbg !523
  store i8 %conv149, i8* %z146, align 1, !dbg !523
  call void @llvm.dbg.declare(metadata i16* %meanmag, metadata !524, metadata !DIExpression()), !dbg !525
  %x150 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !526
  %61 = load i8, i8* %x150, align 1, !dbg !526
  %conv151 = sext i8 %61 to i16, !dbg !527
  %x152 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 0, !dbg !528
  %62 = load i8, i8* %x152, align 1, !dbg !528
  %conv153 = sext i8 %62 to i16, !dbg !529
  %mul = mul nsw i16 %conv151, %conv153, !dbg !530
  %y154 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !531
  %63 = load i8, i8* %y154, align 1, !dbg !531
  %conv155 = sext i8 %63 to i16, !dbg !532
  %y156 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 1, !dbg !533
  %64 = load i8, i8* %y156, align 1, !dbg !533
  %conv157 = sext i8 %64 to i16, !dbg !534
  %mul158 = mul nsw i16 %conv155, %conv157, !dbg !535
  %add159 = add nsw i16 %mul, %mul158, !dbg !536
  %z160 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !537
  %65 = load i8, i8* %z160, align 1, !dbg !537
  %conv161 = sext i8 %65 to i16, !dbg !538
  %z162 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %mean, i32 0, i32 2, !dbg !539
  %66 = load i8, i8* %z162, align 1, !dbg !539
  %conv163 = sext i8 %66 to i16, !dbg !540
  %mul164 = mul nsw i16 %conv161, %conv163, !dbg !541
  %add165 = add nsw i16 %add159, %mul164, !dbg !542
  store i16 %add165, i16* %meanmag, align 2, !dbg !525
  call void @llvm.dbg.declare(metadata i16* %stddevmag, metadata !543, metadata !DIExpression()), !dbg !544
  %x166 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !545
  %67 = load i8, i8* %x166, align 1, !dbg !545
  %conv167 = sext i8 %67 to i16, !dbg !546
  %x168 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 0, !dbg !547
  %68 = load i8, i8* %x168, align 1, !dbg !547
  %conv169 = sext i8 %68 to i16, !dbg !548
  %mul170 = mul nsw i16 %conv167, %conv169, !dbg !549
  %y171 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !550
  %69 = load i8, i8* %y171, align 1, !dbg !550
  %conv172 = sext i8 %69 to i16, !dbg !551
  %y173 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 1, !dbg !552
  %70 = load i8, i8* %y173, align 1, !dbg !552
  %conv174 = sext i8 %70 to i16, !dbg !553
  %mul175 = mul nsw i16 %conv172, %conv174, !dbg !554
  %add176 = add nsw i16 %mul170, %mul175, !dbg !555
  %z177 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !556
  %71 = load i8, i8* %z177, align 1, !dbg !556
  %conv178 = sext i8 %71 to i16, !dbg !557
  %z179 = getelementptr inbounds %struct.threeAxis_t_8, %struct.threeAxis_t_8* %stddev, i32 0, i32 2, !dbg !558
  %72 = load i8, i8* %z179, align 1, !dbg !558
  %conv180 = sext i8 %72 to i16, !dbg !559
  %mul181 = mul nsw i16 %conv178, %conv180, !dbg !560
  %add182 = add nsw i16 %add176, %mul181, !dbg !561
  store i16 %add182, i16* %stddevmag, align 2, !dbg !544
  %73 = load i16, i16* %meanmag, align 2, !dbg !562
  %call = call i16 bitcast (i16 (...)* @sqrt16 to i16 (i16)*)(i16 %73), !dbg !563
  %meanmag183 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 0, !dbg !564
  store i16 %call, i16* %meanmag183, align 2, !dbg !565
  %74 = load i16, i16* %stddevmag, align 2, !dbg !566
  %call184 = call i16 bitcast (i16 (...)* @sqrt16 to i16 (i16)*)(i16 %74), !dbg !567
  %stddevmag185 = getelementptr inbounds %struct.features_t, %struct.features_t* %features, i32 0, i32 1, !dbg !568
  store i16 %call184, i16* %stddevmag185, align 2, !dbg !569
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !570
  %globals186 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1, !dbg !570
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals186, i32 0, i32 12, !dbg !570
  %76 = load i16, i16* %mode, align 2, !dbg !570
  switch i16 %76, label %sw.default [
    i16 2, label %sw.bb
    i16 1, label %sw.bb
    i16 0, label %sw.bb
  ], !dbg !571

sw.bb:                                            ; preds = %for.end137, %for.end137, %for.end137
  %77 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !572
  %globals187 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %77, i32 0, i32 1, !dbg !572
  %features188 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals187, i32 0, i32 7, !dbg !572
  %78 = bitcast %struct.features_t* %features188 to i8*, !dbg !574
  %79 = bitcast %struct.features_t* %features to i8*, !dbg !574
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %78, i8* align 2 %79, i16 4, i1 false), !dbg !574
  br label %sw.epilog, !dbg !575

sw.default:                                       ; preds = %for.end137
  br label %sw.epilog, !dbg !576

sw.epilog:                                        ; preds = %sw.default, %sw.bb
  ret void, !dbg !577
}

declare dso_local i16 @sqrt16(...) #1

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
  br i1 %cmp, label %if.then, label %if.else, !dbg !729

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

if.else:                                          ; preds = %sw.epilog
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !749
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_warmup() #0 !dbg !750 {
entry:
  %sample = alloca %struct.threeAxis_t_8, align 1
  br label %while.cond, !dbg !751

while.cond:                                       ; preds = %while.body, %entry
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !752
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !752
  %discardedSamplesCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 1, !dbg !752
  %1 = load i16, i16* %discardedSamplesCount, align 2, !dbg !752
  %cmp = icmp ult i16 %1, 3, !dbg !753
  br i1 %cmp, label %while.body, label %while.end, !dbg !751

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.threeAxis_t_8* %sample, metadata !754, metadata !DIExpression()), !dbg !756
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !757
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !757
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 13, !dbg !757
  %3 = load i16, i16* %seed, align 2, !dbg !757
  %call = call i16 @ACCEL_singleSample_(%struct.threeAxis_t_8* %sample, i16 %3), !dbg !758
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !759
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !759
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 13, !dbg !759
  store i16 %call, i16* %seed3, align 2, !dbg !760
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !761
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !761
  %discardedSamplesCount5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 1, !dbg !761
  %6 = load i16, i16* %discardedSamplesCount5, align 2, !dbg !762
  %inc = add i16 %6, 1, !dbg !762
  store i16 %inc, i16* %discardedSamplesCount5, align 2, !dbg !762
  br label %while.cond, !dbg !751, !llvm.loop !763

while.end:                                        ; preds = %while.cond
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !765
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !765
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 10, !dbg !765
  store i16 0, i16* %trainingSetSize, align 2, !dbg !766
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
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !786
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !786
  %trainingSetSize16 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 10, !dbg !786
  %17 = load i16, i16* %trainingSetSize16, align 2, !dbg !786
  %cmp = icmp ult i16 %17, 16, !dbg !788
  br i1 %cmp, label %if.then, label %if.else, !dbg !789

if.then:                                          ; preds = %sw.epilog
  br label %if.end, !dbg !790

if.else:                                          ; preds = %sw.epilog
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void, !dbg !792
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !793 {
entry:
  call void @exit(i16 0) #6, !dbg !794
  unreachable, !dbg !794
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !795 {
entry:
  ret void, !dbg !796
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !797 {
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
  %__x59 = alloca i16, align 2
  %tmp60 = alloca i16, align 2
  %__x62 = alloca i16, align 2
  %tmp63 = alloca i16, align 2
  %__x72 = alloca i16, align 2
  %tmp73 = alloca i16, align 2
  %__x75 = alloca i16, align 2
  %tmp76 = alloca i16, align 2
  %__x94 = alloca i16, align 2
  %tmp95 = alloca i16, align 2
  %__x97 = alloca i16, align 2
  %tmp98 = alloca i16, align 2
  %__x107 = alloca i16, align 2
  %tmp108 = alloca i16, align 2
  %__x110 = alloca i16, align 2
  %tmp111 = alloca i16, align 2
  %__x129 = alloca i16, align 2
  %tmp130 = alloca i16, align 2
  %__x132 = alloca i16, align 2
  %tmp133 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x145 = alloca i16, align 2
  %tmp146 = alloca i16, align 2
  %__x159 = alloca i16, align 2
  %tmp160 = alloca i16, align 2
  %__x162 = alloca i16, align 2
  %tmp163 = alloca i16, align 2
  %__x172 = alloca i16, align 2
  %tmp173 = alloca i16, align 2
  %__x175 = alloca i16, align 2
  %tmp176 = alloca i16, align 2
  %__x189 = alloca i16, align 2
  %tmp190 = alloca i16, align 2
  %__x192 = alloca i16, align 2
  %tmp193 = alloca i16, align 2
  %__x202 = alloca i16, align 2
  %tmp203 = alloca i16, align 2
  %__x205 = alloca i16, align 2
  %tmp206 = alloca i16, align 2
  %__x227 = alloca i16, align 2
  %tmp228 = alloca i16, align 2
  %__x230 = alloca i16, align 2
  %tmp231 = alloca i16, align 2
  %__x240 = alloca i16, align 2
  %tmp241 = alloca i16, align 2
  %__x243 = alloca i16, align 2
  %tmp244 = alloca i16, align 2
  %__x266 = alloca i16, align 2
  %tmp267 = alloca i16, align 2
  %__x269 = alloca i16, align 2
  %tmp270 = alloca i16, align 2
  %__x279 = alloca i16, align 2
  %tmp280 = alloca i16, align 2
  %__x282 = alloca i16, align 2
  %tmp283 = alloca i16, align 2
  %__x296 = alloca i16, align 2
  %tmp297 = alloca i16, align 2
  %__x299 = alloca i16, align 2
  %tmp300 = alloca i16, align 2
  %__x309 = alloca i16, align 2
  %tmp310 = alloca i16, align 2
  %__x312 = alloca i16, align 2
  %tmp313 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !800
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !801
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !802
  call void @camel_init(), !dbg !803
  call void @task_init(), !dbg !804
  br label %do.body, !dbg !805

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !806
  %cmp = icmp eq i16 %0, 1, !dbg !806
  br i1 %cmp, label %if.then, label %if.else, !dbg !809

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !810
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !810
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !810
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !810
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !810
  call void @__dump_registers(i16* %arraydecay), !dbg !810
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !812, metadata !DIExpression()), !dbg !814
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !814, !srcloc !815
  store i16 %2, i16* %__x, align 2, !dbg !814
  %3 = load i16, i16* %__x, align 2, !dbg !814
  store i16 %3, i16* %tmp, align 2, !dbg !814
  %4 = load i16, i16* %tmp, align 2, !dbg !814
  %add = add i16 %4, 2, !dbg !810
  %5 = inttoptr i16 %add to i8*, !dbg !810
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !816, metadata !DIExpression()), !dbg !818
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !818, !srcloc !819
  store i16 %6, i16* %__x1, align 2, !dbg !818
  %7 = load i16, i16* %__x1, align 2, !dbg !818
  store i16 %7, i16* %tmp2, align 2, !dbg !818
  %8 = load i16, i16* %tmp2, align 2, !dbg !818
  %add3 = add i16 %8, 2, !dbg !810
  %sub = sub i16 9216, %add3, !dbg !810
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !810
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !810
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !810
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !810
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !810
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 186, i16 zeroext %11), !dbg !810
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !810
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !810
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !810
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !810
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !810
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !810
  br label %if.end, !dbg !810

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !820
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !820
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !820
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !820
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !820
  call void @__dump_registers(i16* %arraydecay6), !dbg !820
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !822, metadata !DIExpression()), !dbg !824
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !824, !srcloc !825
  store i16 %15, i16* %__x7, align 2, !dbg !824
  %16 = load i16, i16* %__x7, align 2, !dbg !824
  store i16 %16, i16* %tmp8, align 2, !dbg !824
  %17 = load i16, i16* %tmp8, align 2, !dbg !824
  %add9 = add i16 %17, 2, !dbg !820
  %18 = inttoptr i16 %add9 to i8*, !dbg !820
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !826, metadata !DIExpression()), !dbg !828
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !828, !srcloc !829
  store i16 %19, i16* %__x10, align 2, !dbg !828
  %20 = load i16, i16* %__x10, align 2, !dbg !828
  store i16 %20, i16* %tmp11, align 2, !dbg !828
  %21 = load i16, i16* %tmp11, align 2, !dbg !828
  %add12 = add i16 %21, 2, !dbg !820
  %sub13 = sub i16 9216, %add12, !dbg !820
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !820
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !820
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !820
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !820
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !820
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 186, i16 zeroext %24), !dbg !820
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !820
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !820
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !820
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !820
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !820
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !820
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !809

do.end:                                           ; preds = %if.end
  br label %while.cond, !dbg !830

while.cond:                                       ; preds = %while.end, %do.end
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !831
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !831
  %count = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 14, !dbg !831
  %28 = load i16, i16* %count, align 2, !dbg !831
  %cmp17 = icmp ult i16 %28, 7, !dbg !832
  br i1 %cmp17, label %while.body, label %while.end327, !dbg !830

while.body:                                       ; preds = %while.cond
  call void @task_selectMode(), !dbg !833
  br label %do.body18, !dbg !835

do.body18:                                        ; preds = %while.body
  %29 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !836
  %cmp19 = icmp eq i16 %29, 1, !dbg !836
  br i1 %cmp19, label %if.then20, label %if.else33, !dbg !839

if.then20:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !840
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !840
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !840
  %reg_file21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i32 0, i32 0, !dbg !840
  %arraydecay22 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file21, i16 0, i16 0, !dbg !840
  call void @__dump_registers(i16* %arraydecay22), !dbg !840
  call void @llvm.dbg.declare(metadata i16* %__x23, metadata !842, metadata !DIExpression()), !dbg !844
  %31 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !844, !srcloc !845
  store i16 %31, i16* %__x23, align 2, !dbg !844
  %32 = load i16, i16* %__x23, align 2, !dbg !844
  store i16 %32, i16* %tmp24, align 2, !dbg !844
  %33 = load i16, i16* %tmp24, align 2, !dbg !844
  %add25 = add i16 %33, 2, !dbg !840
  %34 = inttoptr i16 %add25 to i8*, !dbg !840
  call void @llvm.dbg.declare(metadata i16* %__x26, metadata !846, metadata !DIExpression()), !dbg !848
  %35 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !848, !srcloc !849
  store i16 %35, i16* %__x26, align 2, !dbg !848
  %36 = load i16, i16* %__x26, align 2, !dbg !848
  store i16 %36, i16* %tmp27, align 2, !dbg !848
  %37 = load i16, i16* %tmp27, align 2, !dbg !848
  %add28 = add i16 %37, 2, !dbg !840
  %sub29 = sub i16 9216, %add28, !dbg !840
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %34, i16 zeroext %sub29, i16 zeroext -1), !dbg !840
  store i16 %call30, i16* @tmp_stack_crc, align 2, !dbg !840
  %38 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !840
  %39 = bitcast %struct.camel_buffer_t* %38 to i8*, !dbg !840
  %40 = load i16, i16* @tmp_stack_crc, align 2, !dbg !840
  %call31 = call zeroext i16 @__fast_hw_crc(i8* %39, i16 zeroext 186, i16 zeroext %40), !dbg !840
  store i16 %call31, i16* @tmp_stack_buf_crc, align 2, !dbg !840
  %41 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !840
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !840
  %stack_and_buf_crc32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 2, !dbg !840
  store i16 %41, i16* %stack_and_buf_crc32, align 2, !dbg !840
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !840
  br label %if.end46, !dbg !840

if.else33:                                        ; preds = %do.body18
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !850
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !850
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !850
  %reg_file34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 0, !dbg !850
  %arraydecay35 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file34, i16 0, i16 0, !dbg !850
  call void @__dump_registers(i16* %arraydecay35), !dbg !850
  call void @llvm.dbg.declare(metadata i16* %__x36, metadata !852, metadata !DIExpression()), !dbg !854
  %44 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !854, !srcloc !855
  store i16 %44, i16* %__x36, align 2, !dbg !854
  %45 = load i16, i16* %__x36, align 2, !dbg !854
  store i16 %45, i16* %tmp37, align 2, !dbg !854
  %46 = load i16, i16* %tmp37, align 2, !dbg !854
  %add38 = add i16 %46, 2, !dbg !850
  %47 = inttoptr i16 %add38 to i8*, !dbg !850
  call void @llvm.dbg.declare(metadata i16* %__x39, metadata !856, metadata !DIExpression()), !dbg !858
  %48 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !858, !srcloc !859
  store i16 %48, i16* %__x39, align 2, !dbg !858
  %49 = load i16, i16* %__x39, align 2, !dbg !858
  store i16 %49, i16* %tmp40, align 2, !dbg !858
  %50 = load i16, i16* %tmp40, align 2, !dbg !858
  %add41 = add i16 %50, 2, !dbg !850
  %sub42 = sub i16 9216, %add41, !dbg !850
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %47, i16 zeroext %sub42, i16 zeroext -1), !dbg !850
  store i16 %call43, i16* @tmp_stack_crc, align 2, !dbg !850
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !850
  %52 = bitcast %struct.camel_buffer_t* %51 to i8*, !dbg !850
  %53 = load i16, i16* @tmp_stack_crc, align 2, !dbg !850
  %call44 = call zeroext i16 @__fast_hw_crc(i8* %52, i16 zeroext 186, i16 zeroext %53), !dbg !850
  store i16 %call44, i16* @tmp_stack_buf_crc, align 2, !dbg !850
  %54 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !850
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !850
  %stack_and_buf_crc45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 2, !dbg !850
  store i16 %54, i16* %stack_and_buf_crc45, align 2, !dbg !850
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !850
  br label %if.end46

if.end46:                                         ; preds = %if.else33, %if.then20
  br label %do.end47, !dbg !839

do.end47:                                         ; preds = %if.end46
  call void @task_commit(), !dbg !860
  %56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !861
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %56, i32 0, i32 1, !dbg !861
  %mode = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 12, !dbg !861
  %57 = load i16, i16* %mode, align 2, !dbg !861
  %cmp49 = icmp eq i16 %57, 2, !dbg !863
  br i1 %cmp49, label %if.then53, label %lor.lhs.false, !dbg !864

lor.lhs.false:                                    ; preds = %do.end47
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !865
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i32 0, i32 1, !dbg !865
  %mode51 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 12, !dbg !865
  %59 = load i16, i16* %mode51, align 2, !dbg !865
  %cmp52 = icmp eq i16 %59, 1, !dbg !866
  br i1 %cmp52, label %if.then53, label %if.else84, !dbg !867

if.then53:                                        ; preds = %lor.lhs.false, %do.end47
  call void @task_warmup(), !dbg !868
  br label %do.body54, !dbg !870

do.body54:                                        ; preds = %if.then53
  %60 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !871
  %cmp55 = icmp eq i16 %60, 1, !dbg !871
  br i1 %cmp55, label %if.then56, label %if.else69, !dbg !874

if.then56:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !875
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !875
  %61 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !875
  %reg_file57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %61, i32 0, i32 0, !dbg !875
  %arraydecay58 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file57, i16 0, i16 0, !dbg !875
  call void @__dump_registers(i16* %arraydecay58), !dbg !875
  call void @llvm.dbg.declare(metadata i16* %__x59, metadata !877, metadata !DIExpression()), !dbg !879
  %62 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !879, !srcloc !880
  store i16 %62, i16* %__x59, align 2, !dbg !879
  %63 = load i16, i16* %__x59, align 2, !dbg !879
  store i16 %63, i16* %tmp60, align 2, !dbg !879
  %64 = load i16, i16* %tmp60, align 2, !dbg !879
  %add61 = add i16 %64, 2, !dbg !875
  %65 = inttoptr i16 %add61 to i8*, !dbg !875
  call void @llvm.dbg.declare(metadata i16* %__x62, metadata !881, metadata !DIExpression()), !dbg !883
  %66 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !883, !srcloc !884
  store i16 %66, i16* %__x62, align 2, !dbg !883
  %67 = load i16, i16* %__x62, align 2, !dbg !883
  store i16 %67, i16* %tmp63, align 2, !dbg !883
  %68 = load i16, i16* %tmp63, align 2, !dbg !883
  %add64 = add i16 %68, 2, !dbg !875
  %sub65 = sub i16 9216, %add64, !dbg !875
  %call66 = call zeroext i16 @__fast_hw_crc(i8* %65, i16 zeroext %sub65, i16 zeroext -1), !dbg !875
  store i16 %call66, i16* @tmp_stack_crc, align 2, !dbg !875
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !875
  %70 = bitcast %struct.camel_buffer_t* %69 to i8*, !dbg !875
  %71 = load i16, i16* @tmp_stack_crc, align 2, !dbg !875
  %call67 = call zeroext i16 @__fast_hw_crc(i8* %70, i16 zeroext 186, i16 zeroext %71), !dbg !875
  store i16 %call67, i16* @tmp_stack_buf_crc, align 2, !dbg !875
  %72 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !875
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !875
  %stack_and_buf_crc68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 2, !dbg !875
  store i16 %72, i16* %stack_and_buf_crc68, align 2, !dbg !875
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !875
  br label %if.end82, !dbg !875

if.else69:                                        ; preds = %do.body54
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !885
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !885
  %74 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !885
  %reg_file70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i32 0, i32 0, !dbg !885
  %arraydecay71 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file70, i16 0, i16 0, !dbg !885
  call void @__dump_registers(i16* %arraydecay71), !dbg !885
  call void @llvm.dbg.declare(metadata i16* %__x72, metadata !887, metadata !DIExpression()), !dbg !889
  %75 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !889, !srcloc !890
  store i16 %75, i16* %__x72, align 2, !dbg !889
  %76 = load i16, i16* %__x72, align 2, !dbg !889
  store i16 %76, i16* %tmp73, align 2, !dbg !889
  %77 = load i16, i16* %tmp73, align 2, !dbg !889
  %add74 = add i16 %77, 2, !dbg !885
  %78 = inttoptr i16 %add74 to i8*, !dbg !885
  call void @llvm.dbg.declare(metadata i16* %__x75, metadata !891, metadata !DIExpression()), !dbg !893
  %79 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !893, !srcloc !894
  store i16 %79, i16* %__x75, align 2, !dbg !893
  %80 = load i16, i16* %__x75, align 2, !dbg !893
  store i16 %80, i16* %tmp76, align 2, !dbg !893
  %81 = load i16, i16* %tmp76, align 2, !dbg !893
  %add77 = add i16 %81, 2, !dbg !885
  %sub78 = sub i16 9216, %add77, !dbg !885
  %call79 = call zeroext i16 @__fast_hw_crc(i8* %78, i16 zeroext %sub78, i16 zeroext -1), !dbg !885
  store i16 %call79, i16* @tmp_stack_crc, align 2, !dbg !885
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !885
  %83 = bitcast %struct.camel_buffer_t* %82 to i8*, !dbg !885
  %84 = load i16, i16* @tmp_stack_crc, align 2, !dbg !885
  %call80 = call zeroext i16 @__fast_hw_crc(i8* %83, i16 zeroext 186, i16 zeroext %84), !dbg !885
  store i16 %call80, i16* @tmp_stack_buf_crc, align 2, !dbg !885
  %85 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !885
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !885
  %stack_and_buf_crc81 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 2, !dbg !885
  store i16 %85, i16* %stack_and_buf_crc81, align 2, !dbg !885
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !885
  br label %if.end82

if.end82:                                         ; preds = %if.else69, %if.then56
  br label %do.end83, !dbg !874

do.end83:                                         ; preds = %if.end82
  call void @task_commit(), !dbg !895
  br label %if.end121, !dbg !896

if.else84:                                        ; preds = %lor.lhs.false
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !897
  %globals85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %87, i32 0, i32 1, !dbg !897
  %mode86 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals85, i32 0, i32 12, !dbg !897
  %88 = load i16, i16* %mode86, align 2, !dbg !897
  %cmp87 = icmp eq i16 %88, 0, !dbg !899
  br i1 %cmp87, label %if.then88, label %if.else119, !dbg !900

if.then88:                                        ; preds = %if.else84
  call void @task_resetStats(), !dbg !901
  br label %do.body89, !dbg !903

do.body89:                                        ; preds = %if.then88
  %89 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !904
  %cmp90 = icmp eq i16 %89, 1, !dbg !904
  br i1 %cmp90, label %if.then91, label %if.else104, !dbg !907

if.then91:                                        ; preds = %do.body89
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !908
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !908
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !908
  %reg_file92 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i32 0, i32 0, !dbg !908
  %arraydecay93 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file92, i16 0, i16 0, !dbg !908
  call void @__dump_registers(i16* %arraydecay93), !dbg !908
  call void @llvm.dbg.declare(metadata i16* %__x94, metadata !910, metadata !DIExpression()), !dbg !912
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !912, !srcloc !913
  store i16 %91, i16* %__x94, align 2, !dbg !912
  %92 = load i16, i16* %__x94, align 2, !dbg !912
  store i16 %92, i16* %tmp95, align 2, !dbg !912
  %93 = load i16, i16* %tmp95, align 2, !dbg !912
  %add96 = add i16 %93, 2, !dbg !908
  %94 = inttoptr i16 %add96 to i8*, !dbg !908
  call void @llvm.dbg.declare(metadata i16* %__x97, metadata !914, metadata !DIExpression()), !dbg !916
  %95 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !916, !srcloc !917
  store i16 %95, i16* %__x97, align 2, !dbg !916
  %96 = load i16, i16* %__x97, align 2, !dbg !916
  store i16 %96, i16* %tmp98, align 2, !dbg !916
  %97 = load i16, i16* %tmp98, align 2, !dbg !916
  %add99 = add i16 %97, 2, !dbg !908
  %sub100 = sub i16 9216, %add99, !dbg !908
  %call101 = call zeroext i16 @__fast_hw_crc(i8* %94, i16 zeroext %sub100, i16 zeroext -1), !dbg !908
  store i16 %call101, i16* @tmp_stack_crc, align 2, !dbg !908
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !908
  %99 = bitcast %struct.camel_buffer_t* %98 to i8*, !dbg !908
  %100 = load i16, i16* @tmp_stack_crc, align 2, !dbg !908
  %call102 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext 186, i16 zeroext %100), !dbg !908
  store i16 %call102, i16* @tmp_stack_buf_crc, align 2, !dbg !908
  %101 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !908
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !908
  %stack_and_buf_crc103 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i32 0, i32 2, !dbg !908
  store i16 %101, i16* %stack_and_buf_crc103, align 2, !dbg !908
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !908
  br label %if.end117, !dbg !908

if.else104:                                       ; preds = %do.body89
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !918
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !918
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !918
  %reg_file105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %103, i32 0, i32 0, !dbg !918
  %arraydecay106 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file105, i16 0, i16 0, !dbg !918
  call void @__dump_registers(i16* %arraydecay106), !dbg !918
  call void @llvm.dbg.declare(metadata i16* %__x107, metadata !920, metadata !DIExpression()), !dbg !922
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !922, !srcloc !923
  store i16 %104, i16* %__x107, align 2, !dbg !922
  %105 = load i16, i16* %__x107, align 2, !dbg !922
  store i16 %105, i16* %tmp108, align 2, !dbg !922
  %106 = load i16, i16* %tmp108, align 2, !dbg !922
  %add109 = add i16 %106, 2, !dbg !918
  %107 = inttoptr i16 %add109 to i8*, !dbg !918
  call void @llvm.dbg.declare(metadata i16* %__x110, metadata !924, metadata !DIExpression()), !dbg !926
  %108 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !926, !srcloc !927
  store i16 %108, i16* %__x110, align 2, !dbg !926
  %109 = load i16, i16* %__x110, align 2, !dbg !926
  store i16 %109, i16* %tmp111, align 2, !dbg !926
  %110 = load i16, i16* %tmp111, align 2, !dbg !926
  %add112 = add i16 %110, 2, !dbg !918
  %sub113 = sub i16 9216, %add112, !dbg !918
  %call114 = call zeroext i16 @__fast_hw_crc(i8* %107, i16 zeroext %sub113, i16 zeroext -1), !dbg !918
  store i16 %call114, i16* @tmp_stack_crc, align 2, !dbg !918
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !918
  %112 = bitcast %struct.camel_buffer_t* %111 to i8*, !dbg !918
  %113 = load i16, i16* @tmp_stack_crc, align 2, !dbg !918
  %call115 = call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext 186, i16 zeroext %113), !dbg !918
  store i16 %call115, i16* @tmp_stack_buf_crc, align 2, !dbg !918
  %114 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !918
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !918
  %stack_and_buf_crc116 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i32 0, i32 2, !dbg !918
  store i16 %114, i16* %stack_and_buf_crc116, align 2, !dbg !918
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !918
  br label %if.end117

if.end117:                                        ; preds = %if.else104, %if.then91
  br label %do.end118, !dbg !907

do.end118:                                        ; preds = %if.end117
  call void @task_commit(), !dbg !928
  br label %if.end120, !dbg !929

if.else119:                                       ; preds = %if.else84
  br label %while.end327, !dbg !930

if.end120:                                        ; preds = %do.end118
  br label %if.end121

if.end121:                                        ; preds = %if.end120, %do.end83
  br label %while.body123, !dbg !932

while.body123:                                    ; preds = %if.end121, %if.end326
  call void @task_sample(), !dbg !933
  br label %do.body124, !dbg !935

do.body124:                                       ; preds = %while.body123
  %116 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !936
  %cmp125 = icmp eq i16 %116, 1, !dbg !936
  br i1 %cmp125, label %if.then126, label %if.else139, !dbg !939

if.then126:                                       ; preds = %do.body124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !940
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !940
  %117 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !940
  %reg_file127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %117, i32 0, i32 0, !dbg !940
  %arraydecay128 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file127, i16 0, i16 0, !dbg !940
  call void @__dump_registers(i16* %arraydecay128), !dbg !940
  call void @llvm.dbg.declare(metadata i16* %__x129, metadata !942, metadata !DIExpression()), !dbg !944
  %118 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !944, !srcloc !945
  store i16 %118, i16* %__x129, align 2, !dbg !944
  %119 = load i16, i16* %__x129, align 2, !dbg !944
  store i16 %119, i16* %tmp130, align 2, !dbg !944
  %120 = load i16, i16* %tmp130, align 2, !dbg !944
  %add131 = add i16 %120, 2, !dbg !940
  %121 = inttoptr i16 %add131 to i8*, !dbg !940
  call void @llvm.dbg.declare(metadata i16* %__x132, metadata !946, metadata !DIExpression()), !dbg !948
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !948, !srcloc !949
  store i16 %122, i16* %__x132, align 2, !dbg !948
  %123 = load i16, i16* %__x132, align 2, !dbg !948
  store i16 %123, i16* %tmp133, align 2, !dbg !948
  %124 = load i16, i16* %tmp133, align 2, !dbg !948
  %add134 = add i16 %124, 2, !dbg !940
  %sub135 = sub i16 9216, %add134, !dbg !940
  %call136 = call zeroext i16 @__fast_hw_crc(i8* %121, i16 zeroext %sub135, i16 zeroext -1), !dbg !940
  store i16 %call136, i16* @tmp_stack_crc, align 2, !dbg !940
  %125 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !940
  %126 = bitcast %struct.camel_buffer_t* %125 to i8*, !dbg !940
  %127 = load i16, i16* @tmp_stack_crc, align 2, !dbg !940
  %call137 = call zeroext i16 @__fast_hw_crc(i8* %126, i16 zeroext 186, i16 zeroext %127), !dbg !940
  store i16 %call137, i16* @tmp_stack_buf_crc, align 2, !dbg !940
  %128 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !940
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !940
  %stack_and_buf_crc138 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %129, i32 0, i32 2, !dbg !940
  store i16 %128, i16* %stack_and_buf_crc138, align 2, !dbg !940
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !940
  br label %if.end152, !dbg !940

if.else139:                                       ; preds = %do.body124
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !950
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !950
  %130 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !950
  %reg_file140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %130, i32 0, i32 0, !dbg !950
  %arraydecay141 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file140, i16 0, i16 0, !dbg !950
  call void @__dump_registers(i16* %arraydecay141), !dbg !950
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !952, metadata !DIExpression()), !dbg !954
  %131 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !954, !srcloc !955
  store i16 %131, i16* %__x142, align 2, !dbg !954
  %132 = load i16, i16* %__x142, align 2, !dbg !954
  store i16 %132, i16* %tmp143, align 2, !dbg !954
  %133 = load i16, i16* %tmp143, align 2, !dbg !954
  %add144 = add i16 %133, 2, !dbg !950
  %134 = inttoptr i16 %add144 to i8*, !dbg !950
  call void @llvm.dbg.declare(metadata i16* %__x145, metadata !956, metadata !DIExpression()), !dbg !958
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !958, !srcloc !959
  store i16 %135, i16* %__x145, align 2, !dbg !958
  %136 = load i16, i16* %__x145, align 2, !dbg !958
  store i16 %136, i16* %tmp146, align 2, !dbg !958
  %137 = load i16, i16* %tmp146, align 2, !dbg !958
  %add147 = add i16 %137, 2, !dbg !950
  %sub148 = sub i16 9216, %add147, !dbg !950
  %call149 = call zeroext i16 @__fast_hw_crc(i8* %134, i16 zeroext %sub148, i16 zeroext -1), !dbg !950
  store i16 %call149, i16* @tmp_stack_crc, align 2, !dbg !950
  %138 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !950
  %139 = bitcast %struct.camel_buffer_t* %138 to i8*, !dbg !950
  %140 = load i16, i16* @tmp_stack_crc, align 2, !dbg !950
  %call150 = call zeroext i16 @__fast_hw_crc(i8* %139, i16 zeroext 186, i16 zeroext %140), !dbg !950
  store i16 %call150, i16* @tmp_stack_buf_crc, align 2, !dbg !950
  %141 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !950
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !950
  %stack_and_buf_crc151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %142, i32 0, i32 2, !dbg !950
  store i16 %141, i16* %stack_and_buf_crc151, align 2, !dbg !950
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !950
  br label %if.end152

if.end152:                                        ; preds = %if.else139, %if.then126
  br label %do.end153, !dbg !939

do.end153:                                        ; preds = %if.end152
  call void @task_commit(), !dbg !960
  call void @task_transform(), !dbg !961
  br label %do.body154, !dbg !962

do.body154:                                       ; preds = %do.end153
  %143 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !963
  %cmp155 = icmp eq i16 %143, 1, !dbg !963
  br i1 %cmp155, label %if.then156, label %if.else169, !dbg !966

if.then156:                                       ; preds = %do.body154
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !967
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !967
  %144 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !967
  %reg_file157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %144, i32 0, i32 0, !dbg !967
  %arraydecay158 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file157, i16 0, i16 0, !dbg !967
  call void @__dump_registers(i16* %arraydecay158), !dbg !967
  call void @llvm.dbg.declare(metadata i16* %__x159, metadata !969, metadata !DIExpression()), !dbg !971
  %145 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !971, !srcloc !972
  store i16 %145, i16* %__x159, align 2, !dbg !971
  %146 = load i16, i16* %__x159, align 2, !dbg !971
  store i16 %146, i16* %tmp160, align 2, !dbg !971
  %147 = load i16, i16* %tmp160, align 2, !dbg !971
  %add161 = add i16 %147, 2, !dbg !967
  %148 = inttoptr i16 %add161 to i8*, !dbg !967
  call void @llvm.dbg.declare(metadata i16* %__x162, metadata !973, metadata !DIExpression()), !dbg !975
  %149 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !975, !srcloc !976
  store i16 %149, i16* %__x162, align 2, !dbg !975
  %150 = load i16, i16* %__x162, align 2, !dbg !975
  store i16 %150, i16* %tmp163, align 2, !dbg !975
  %151 = load i16, i16* %tmp163, align 2, !dbg !975
  %add164 = add i16 %151, 2, !dbg !967
  %sub165 = sub i16 9216, %add164, !dbg !967
  %call166 = call zeroext i16 @__fast_hw_crc(i8* %148, i16 zeroext %sub165, i16 zeroext -1), !dbg !967
  store i16 %call166, i16* @tmp_stack_crc, align 2, !dbg !967
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !967
  %153 = bitcast %struct.camel_buffer_t* %152 to i8*, !dbg !967
  %154 = load i16, i16* @tmp_stack_crc, align 2, !dbg !967
  %call167 = call zeroext i16 @__fast_hw_crc(i8* %153, i16 zeroext 186, i16 zeroext %154), !dbg !967
  store i16 %call167, i16* @tmp_stack_buf_crc, align 2, !dbg !967
  %155 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !967
  %156 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !967
  %stack_and_buf_crc168 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %156, i32 0, i32 2, !dbg !967
  store i16 %155, i16* %stack_and_buf_crc168, align 2, !dbg !967
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !967
  br label %if.end182, !dbg !967

if.else169:                                       ; preds = %do.body154
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !977
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !977
  %157 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !977
  %reg_file170 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %157, i32 0, i32 0, !dbg !977
  %arraydecay171 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file170, i16 0, i16 0, !dbg !977
  call void @__dump_registers(i16* %arraydecay171), !dbg !977
  call void @llvm.dbg.declare(metadata i16* %__x172, metadata !979, metadata !DIExpression()), !dbg !981
  %158 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !981, !srcloc !982
  store i16 %158, i16* %__x172, align 2, !dbg !981
  %159 = load i16, i16* %__x172, align 2, !dbg !981
  store i16 %159, i16* %tmp173, align 2, !dbg !981
  %160 = load i16, i16* %tmp173, align 2, !dbg !981
  %add174 = add i16 %160, 2, !dbg !977
  %161 = inttoptr i16 %add174 to i8*, !dbg !977
  call void @llvm.dbg.declare(metadata i16* %__x175, metadata !983, metadata !DIExpression()), !dbg !985
  %162 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !985, !srcloc !986
  store i16 %162, i16* %__x175, align 2, !dbg !985
  %163 = load i16, i16* %__x175, align 2, !dbg !985
  store i16 %163, i16* %tmp176, align 2, !dbg !985
  %164 = load i16, i16* %tmp176, align 2, !dbg !985
  %add177 = add i16 %164, 2, !dbg !977
  %sub178 = sub i16 9216, %add177, !dbg !977
  %call179 = call zeroext i16 @__fast_hw_crc(i8* %161, i16 zeroext %sub178, i16 zeroext -1), !dbg !977
  store i16 %call179, i16* @tmp_stack_crc, align 2, !dbg !977
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !977
  %166 = bitcast %struct.camel_buffer_t* %165 to i8*, !dbg !977
  %167 = load i16, i16* @tmp_stack_crc, align 2, !dbg !977
  %call180 = call zeroext i16 @__fast_hw_crc(i8* %166, i16 zeroext 186, i16 zeroext %167), !dbg !977
  store i16 %call180, i16* @tmp_stack_buf_crc, align 2, !dbg !977
  %168 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !977
  %169 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !977
  %stack_and_buf_crc181 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %169, i32 0, i32 2, !dbg !977
  store i16 %168, i16* %stack_and_buf_crc181, align 2, !dbg !977
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !977
  br label %if.end182

if.end182:                                        ; preds = %if.else169, %if.then156
  br label %do.end183, !dbg !966

do.end183:                                        ; preds = %if.end182
  call void @task_commit(), !dbg !987
  call void @task_featurize(), !dbg !988
  br label %do.body184, !dbg !989

do.body184:                                       ; preds = %do.end183
  %170 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !990
  %cmp185 = icmp eq i16 %170, 1, !dbg !990
  br i1 %cmp185, label %if.then186, label %if.else199, !dbg !993

if.then186:                                       ; preds = %do.body184
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !994
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !994
  %171 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !994
  %reg_file187 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %171, i32 0, i32 0, !dbg !994
  %arraydecay188 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file187, i16 0, i16 0, !dbg !994
  call void @__dump_registers(i16* %arraydecay188), !dbg !994
  call void @llvm.dbg.declare(metadata i16* %__x189, metadata !996, metadata !DIExpression()), !dbg !998
  %172 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !998, !srcloc !999
  store i16 %172, i16* %__x189, align 2, !dbg !998
  %173 = load i16, i16* %__x189, align 2, !dbg !998
  store i16 %173, i16* %tmp190, align 2, !dbg !998
  %174 = load i16, i16* %tmp190, align 2, !dbg !998
  %add191 = add i16 %174, 2, !dbg !994
  %175 = inttoptr i16 %add191 to i8*, !dbg !994
  call void @llvm.dbg.declare(metadata i16* %__x192, metadata !1000, metadata !DIExpression()), !dbg !1002
  %176 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1002, !srcloc !1003
  store i16 %176, i16* %__x192, align 2, !dbg !1002
  %177 = load i16, i16* %__x192, align 2, !dbg !1002
  store i16 %177, i16* %tmp193, align 2, !dbg !1002
  %178 = load i16, i16* %tmp193, align 2, !dbg !1002
  %add194 = add i16 %178, 2, !dbg !994
  %sub195 = sub i16 9216, %add194, !dbg !994
  %call196 = call zeroext i16 @__fast_hw_crc(i8* %175, i16 zeroext %sub195, i16 zeroext -1), !dbg !994
  store i16 %call196, i16* @tmp_stack_crc, align 2, !dbg !994
  %179 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !994
  %180 = bitcast %struct.camel_buffer_t* %179 to i8*, !dbg !994
  %181 = load i16, i16* @tmp_stack_crc, align 2, !dbg !994
  %call197 = call zeroext i16 @__fast_hw_crc(i8* %180, i16 zeroext 186, i16 zeroext %181), !dbg !994
  store i16 %call197, i16* @tmp_stack_buf_crc, align 2, !dbg !994
  %182 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !994
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !994
  %stack_and_buf_crc198 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %183, i32 0, i32 2, !dbg !994
  store i16 %182, i16* %stack_and_buf_crc198, align 2, !dbg !994
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !994
  br label %if.end212, !dbg !994

if.else199:                                       ; preds = %do.body184
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1004
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1004
  %184 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1004
  %reg_file200 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %184, i32 0, i32 0, !dbg !1004
  %arraydecay201 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file200, i16 0, i16 0, !dbg !1004
  call void @__dump_registers(i16* %arraydecay201), !dbg !1004
  call void @llvm.dbg.declare(metadata i16* %__x202, metadata !1006, metadata !DIExpression()), !dbg !1008
  %185 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1008, !srcloc !1009
  store i16 %185, i16* %__x202, align 2, !dbg !1008
  %186 = load i16, i16* %__x202, align 2, !dbg !1008
  store i16 %186, i16* %tmp203, align 2, !dbg !1008
  %187 = load i16, i16* %tmp203, align 2, !dbg !1008
  %add204 = add i16 %187, 2, !dbg !1004
  %188 = inttoptr i16 %add204 to i8*, !dbg !1004
  call void @llvm.dbg.declare(metadata i16* %__x205, metadata !1010, metadata !DIExpression()), !dbg !1012
  %189 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1012, !srcloc !1013
  store i16 %189, i16* %__x205, align 2, !dbg !1012
  %190 = load i16, i16* %__x205, align 2, !dbg !1012
  store i16 %190, i16* %tmp206, align 2, !dbg !1012
  %191 = load i16, i16* %tmp206, align 2, !dbg !1012
  %add207 = add i16 %191, 2, !dbg !1004
  %sub208 = sub i16 9216, %add207, !dbg !1004
  %call209 = call zeroext i16 @__fast_hw_crc(i8* %188, i16 zeroext %sub208, i16 zeroext -1), !dbg !1004
  store i16 %call209, i16* @tmp_stack_crc, align 2, !dbg !1004
  %192 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1004
  %193 = bitcast %struct.camel_buffer_t* %192 to i8*, !dbg !1004
  %194 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1004
  %call210 = call zeroext i16 @__fast_hw_crc(i8* %193, i16 zeroext 186, i16 zeroext %194), !dbg !1004
  store i16 %call210, i16* @tmp_stack_buf_crc, align 2, !dbg !1004
  %195 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1004
  %196 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1004
  %stack_and_buf_crc211 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %196, i32 0, i32 2, !dbg !1004
  store i16 %195, i16* %stack_and_buf_crc211, align 2, !dbg !1004
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1004
  br label %if.end212

if.end212:                                        ; preds = %if.else199, %if.then186
  br label %do.end213, !dbg !993

do.end213:                                        ; preds = %if.end212
  call void @task_commit(), !dbg !1014
  %197 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1015
  %globals214 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %197, i32 0, i32 1, !dbg !1015
  %mode215 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals214, i32 0, i32 12, !dbg !1015
  %198 = load i16, i16* %mode215, align 2, !dbg !1015
  %cmp216 = icmp eq i16 %198, 2, !dbg !1017
  br i1 %cmp216, label %if.then221, label %lor.lhs.false217, !dbg !1018

lor.lhs.false217:                                 ; preds = %do.end213
  %199 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1019
  %globals218 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %199, i32 0, i32 1, !dbg !1019
  %mode219 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals218, i32 0, i32 12, !dbg !1019
  %200 = load i16, i16* %mode219, align 2, !dbg !1019
  %cmp220 = icmp eq i16 %200, 1, !dbg !1020
  br i1 %cmp220, label %if.then221, label %if.else256, !dbg !1021

if.then221:                                       ; preds = %lor.lhs.false217, %do.end213
  call void @task_train(), !dbg !1022
  br label %do.body222, !dbg !1024

do.body222:                                       ; preds = %if.then221
  %201 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1025
  %cmp223 = icmp eq i16 %201, 1, !dbg !1025
  br i1 %cmp223, label %if.then224, label %if.else237, !dbg !1028

if.then224:                                       ; preds = %do.body222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1029
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1029
  %202 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1029
  %reg_file225 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %202, i32 0, i32 0, !dbg !1029
  %arraydecay226 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file225, i16 0, i16 0, !dbg !1029
  call void @__dump_registers(i16* %arraydecay226), !dbg !1029
  call void @llvm.dbg.declare(metadata i16* %__x227, metadata !1031, metadata !DIExpression()), !dbg !1033
  %203 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1033, !srcloc !1034
  store i16 %203, i16* %__x227, align 2, !dbg !1033
  %204 = load i16, i16* %__x227, align 2, !dbg !1033
  store i16 %204, i16* %tmp228, align 2, !dbg !1033
  %205 = load i16, i16* %tmp228, align 2, !dbg !1033
  %add229 = add i16 %205, 2, !dbg !1029
  %206 = inttoptr i16 %add229 to i8*, !dbg !1029
  call void @llvm.dbg.declare(metadata i16* %__x230, metadata !1035, metadata !DIExpression()), !dbg !1037
  %207 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1037, !srcloc !1038
  store i16 %207, i16* %__x230, align 2, !dbg !1037
  %208 = load i16, i16* %__x230, align 2, !dbg !1037
  store i16 %208, i16* %tmp231, align 2, !dbg !1037
  %209 = load i16, i16* %tmp231, align 2, !dbg !1037
  %add232 = add i16 %209, 2, !dbg !1029
  %sub233 = sub i16 9216, %add232, !dbg !1029
  %call234 = call zeroext i16 @__fast_hw_crc(i8* %206, i16 zeroext %sub233, i16 zeroext -1), !dbg !1029
  store i16 %call234, i16* @tmp_stack_crc, align 2, !dbg !1029
  %210 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1029
  %211 = bitcast %struct.camel_buffer_t* %210 to i8*, !dbg !1029
  %212 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1029
  %call235 = call zeroext i16 @__fast_hw_crc(i8* %211, i16 zeroext 186, i16 zeroext %212), !dbg !1029
  store i16 %call235, i16* @tmp_stack_buf_crc, align 2, !dbg !1029
  %213 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1029
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1029
  %stack_and_buf_crc236 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 2, !dbg !1029
  store i16 %213, i16* %stack_and_buf_crc236, align 2, !dbg !1029
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1029
  br label %if.end250, !dbg !1029

if.else237:                                       ; preds = %do.body222
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1039
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1039
  %215 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1039
  %reg_file238 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %215, i32 0, i32 0, !dbg !1039
  %arraydecay239 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file238, i16 0, i16 0, !dbg !1039
  call void @__dump_registers(i16* %arraydecay239), !dbg !1039
  call void @llvm.dbg.declare(metadata i16* %__x240, metadata !1041, metadata !DIExpression()), !dbg !1043
  %216 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1043, !srcloc !1044
  store i16 %216, i16* %__x240, align 2, !dbg !1043
  %217 = load i16, i16* %__x240, align 2, !dbg !1043
  store i16 %217, i16* %tmp241, align 2, !dbg !1043
  %218 = load i16, i16* %tmp241, align 2, !dbg !1043
  %add242 = add i16 %218, 2, !dbg !1039
  %219 = inttoptr i16 %add242 to i8*, !dbg !1039
  call void @llvm.dbg.declare(metadata i16* %__x243, metadata !1045, metadata !DIExpression()), !dbg !1047
  %220 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1047, !srcloc !1048
  store i16 %220, i16* %__x243, align 2, !dbg !1047
  %221 = load i16, i16* %__x243, align 2, !dbg !1047
  store i16 %221, i16* %tmp244, align 2, !dbg !1047
  %222 = load i16, i16* %tmp244, align 2, !dbg !1047
  %add245 = add i16 %222, 2, !dbg !1039
  %sub246 = sub i16 9216, %add245, !dbg !1039
  %call247 = call zeroext i16 @__fast_hw_crc(i8* %219, i16 zeroext %sub246, i16 zeroext -1), !dbg !1039
  store i16 %call247, i16* @tmp_stack_crc, align 2, !dbg !1039
  %223 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1039
  %224 = bitcast %struct.camel_buffer_t* %223 to i8*, !dbg !1039
  %225 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1039
  %call248 = call zeroext i16 @__fast_hw_crc(i8* %224, i16 zeroext 186, i16 zeroext %225), !dbg !1039
  store i16 %call248, i16* @tmp_stack_buf_crc, align 2, !dbg !1039
  %226 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1039
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1039
  %stack_and_buf_crc249 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 2, !dbg !1039
  store i16 %226, i16* %stack_and_buf_crc249, align 2, !dbg !1039
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1039
  br label %if.end250

if.end250:                                        ; preds = %if.else237, %if.then224
  br label %do.end251, !dbg !1028

do.end251:                                        ; preds = %if.end250
  call void @task_done(), !dbg !1049
  %228 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1050
  %globals252 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %228, i32 0, i32 1, !dbg !1050
  %trainingSetSize = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals252, i32 0, i32 10, !dbg !1050
  %229 = load i16, i16* %trainingSetSize, align 2, !dbg !1050
  %cmp253 = icmp uge i16 %229, 16, !dbg !1052
  br i1 %cmp253, label %if.then254, label %if.end255, !dbg !1053

if.then254:                                       ; preds = %do.end251
  br label %while.end, !dbg !1054

if.end255:                                        ; preds = %do.end251
  br label %if.end326, !dbg !1055

if.else256:                                       ; preds = %lor.lhs.false217
  %230 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1056
  %globals257 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %230, i32 0, i32 1, !dbg !1056
  %mode258 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals257, i32 0, i32 12, !dbg !1056
  %231 = load i16, i16* %mode258, align 2, !dbg !1056
  %cmp259 = icmp eq i16 %231, 0, !dbg !1058
  br i1 %cmp259, label %if.then260, label %if.end325, !dbg !1059

if.then260:                                       ; preds = %if.else256
  call void @task_classify(), !dbg !1060
  br label %do.body261, !dbg !1062

do.body261:                                       ; preds = %if.then260
  %232 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1063
  %cmp262 = icmp eq i16 %232, 1, !dbg !1063
  br i1 %cmp262, label %if.then263, label %if.else276, !dbg !1066

if.then263:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1067
  %233 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %reg_file264 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %233, i32 0, i32 0, !dbg !1067
  %arraydecay265 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file264, i16 0, i16 0, !dbg !1067
  call void @__dump_registers(i16* %arraydecay265), !dbg !1067
  call void @llvm.dbg.declare(metadata i16* %__x266, metadata !1069, metadata !DIExpression()), !dbg !1071
  %234 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1071, !srcloc !1072
  store i16 %234, i16* %__x266, align 2, !dbg !1071
  %235 = load i16, i16* %__x266, align 2, !dbg !1071
  store i16 %235, i16* %tmp267, align 2, !dbg !1071
  %236 = load i16, i16* %tmp267, align 2, !dbg !1071
  %add268 = add i16 %236, 2, !dbg !1067
  %237 = inttoptr i16 %add268 to i8*, !dbg !1067
  call void @llvm.dbg.declare(metadata i16* %__x269, metadata !1073, metadata !DIExpression()), !dbg !1075
  %238 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1075, !srcloc !1076
  store i16 %238, i16* %__x269, align 2, !dbg !1075
  %239 = load i16, i16* %__x269, align 2, !dbg !1075
  store i16 %239, i16* %tmp270, align 2, !dbg !1075
  %240 = load i16, i16* %tmp270, align 2, !dbg !1075
  %add271 = add i16 %240, 2, !dbg !1067
  %sub272 = sub i16 9216, %add271, !dbg !1067
  %call273 = call zeroext i16 @__fast_hw_crc(i8* %237, i16 zeroext %sub272, i16 zeroext -1), !dbg !1067
  store i16 %call273, i16* @tmp_stack_crc, align 2, !dbg !1067
  %241 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %242 = bitcast %struct.camel_buffer_t* %241 to i8*, !dbg !1067
  %243 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1067
  %call274 = call zeroext i16 @__fast_hw_crc(i8* %242, i16 zeroext 186, i16 zeroext %243), !dbg !1067
  store i16 %call274, i16* @tmp_stack_buf_crc, align 2, !dbg !1067
  %244 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1067
  %245 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1067
  %stack_and_buf_crc275 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %245, i32 0, i32 2, !dbg !1067
  store i16 %244, i16* %stack_and_buf_crc275, align 2, !dbg !1067
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1067
  br label %if.end289, !dbg !1067

if.else276:                                       ; preds = %do.body261
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1077
  %246 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %reg_file277 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %246, i32 0, i32 0, !dbg !1077
  %arraydecay278 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file277, i16 0, i16 0, !dbg !1077
  call void @__dump_registers(i16* %arraydecay278), !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %__x279, metadata !1079, metadata !DIExpression()), !dbg !1081
  %247 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1081, !srcloc !1082
  store i16 %247, i16* %__x279, align 2, !dbg !1081
  %248 = load i16, i16* %__x279, align 2, !dbg !1081
  store i16 %248, i16* %tmp280, align 2, !dbg !1081
  %249 = load i16, i16* %tmp280, align 2, !dbg !1081
  %add281 = add i16 %249, 2, !dbg !1077
  %250 = inttoptr i16 %add281 to i8*, !dbg !1077
  call void @llvm.dbg.declare(metadata i16* %__x282, metadata !1083, metadata !DIExpression()), !dbg !1085
  %251 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1085, !srcloc !1086
  store i16 %251, i16* %__x282, align 2, !dbg !1085
  %252 = load i16, i16* %__x282, align 2, !dbg !1085
  store i16 %252, i16* %tmp283, align 2, !dbg !1085
  %253 = load i16, i16* %tmp283, align 2, !dbg !1085
  %add284 = add i16 %253, 2, !dbg !1077
  %sub285 = sub i16 9216, %add284, !dbg !1077
  %call286 = call zeroext i16 @__fast_hw_crc(i8* %250, i16 zeroext %sub285, i16 zeroext -1), !dbg !1077
  store i16 %call286, i16* @tmp_stack_crc, align 2, !dbg !1077
  %254 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %255 = bitcast %struct.camel_buffer_t* %254 to i8*, !dbg !1077
  %256 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1077
  %call287 = call zeroext i16 @__fast_hw_crc(i8* %255, i16 zeroext 186, i16 zeroext %256), !dbg !1077
  store i16 %call287, i16* @tmp_stack_buf_crc, align 2, !dbg !1077
  %257 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1077
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1077
  %stack_and_buf_crc288 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %258, i32 0, i32 2, !dbg !1077
  store i16 %257, i16* %stack_and_buf_crc288, align 2, !dbg !1077
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1077
  br label %if.end289

if.end289:                                        ; preds = %if.else276, %if.then263
  br label %do.end290, !dbg !1066

do.end290:                                        ; preds = %if.end289
  call void @task_commit(), !dbg !1087
  call void @task_stats(), !dbg !1088
  br label %do.body291, !dbg !1089

do.body291:                                       ; preds = %do.end290
  %259 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1090
  %cmp292 = icmp eq i16 %259, 1, !dbg !1090
  br i1 %cmp292, label %if.then293, label %if.else306, !dbg !1093

if.then293:                                       ; preds = %do.body291
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !1094
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1094
  %260 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1094
  %reg_file294 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %260, i32 0, i32 0, !dbg !1094
  %arraydecay295 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file294, i16 0, i16 0, !dbg !1094
  call void @__dump_registers(i16* %arraydecay295), !dbg !1094
  call void @llvm.dbg.declare(metadata i16* %__x296, metadata !1096, metadata !DIExpression()), !dbg !1098
  %261 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1098, !srcloc !1099
  store i16 %261, i16* %__x296, align 2, !dbg !1098
  %262 = load i16, i16* %__x296, align 2, !dbg !1098
  store i16 %262, i16* %tmp297, align 2, !dbg !1098
  %263 = load i16, i16* %tmp297, align 2, !dbg !1098
  %add298 = add i16 %263, 2, !dbg !1094
  %264 = inttoptr i16 %add298 to i8*, !dbg !1094
  call void @llvm.dbg.declare(metadata i16* %__x299, metadata !1100, metadata !DIExpression()), !dbg !1102
  %265 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1102, !srcloc !1103
  store i16 %265, i16* %__x299, align 2, !dbg !1102
  %266 = load i16, i16* %__x299, align 2, !dbg !1102
  store i16 %266, i16* %tmp300, align 2, !dbg !1102
  %267 = load i16, i16* %tmp300, align 2, !dbg !1102
  %add301 = add i16 %267, 2, !dbg !1094
  %sub302 = sub i16 9216, %add301, !dbg !1094
  %call303 = call zeroext i16 @__fast_hw_crc(i8* %264, i16 zeroext %sub302, i16 zeroext -1), !dbg !1094
  store i16 %call303, i16* @tmp_stack_crc, align 2, !dbg !1094
  %268 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1094
  %269 = bitcast %struct.camel_buffer_t* %268 to i8*, !dbg !1094
  %270 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1094
  %call304 = call zeroext i16 @__fast_hw_crc(i8* %269, i16 zeroext 186, i16 zeroext %270), !dbg !1094
  store i16 %call304, i16* @tmp_stack_buf_crc, align 2, !dbg !1094
  %271 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1094
  %272 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1094
  %stack_and_buf_crc305 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %272, i32 0, i32 2, !dbg !1094
  store i16 %271, i16* %stack_and_buf_crc305, align 2, !dbg !1094
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1094
  br label %if.end319, !dbg !1094

if.else306:                                       ; preds = %do.body291
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !1104
  %273 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %reg_file307 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %273, i32 0, i32 0, !dbg !1104
  %arraydecay308 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file307, i16 0, i16 0, !dbg !1104
  call void @__dump_registers(i16* %arraydecay308), !dbg !1104
  call void @llvm.dbg.declare(metadata i16* %__x309, metadata !1106, metadata !DIExpression()), !dbg !1108
  %274 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1108, !srcloc !1109
  store i16 %274, i16* %__x309, align 2, !dbg !1108
  %275 = load i16, i16* %__x309, align 2, !dbg !1108
  store i16 %275, i16* %tmp310, align 2, !dbg !1108
  %276 = load i16, i16* %tmp310, align 2, !dbg !1108
  %add311 = add i16 %276, 2, !dbg !1104
  %277 = inttoptr i16 %add311 to i8*, !dbg !1104
  call void @llvm.dbg.declare(metadata i16* %__x312, metadata !1110, metadata !DIExpression()), !dbg !1112
  %278 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !1112, !srcloc !1113
  store i16 %278, i16* %__x312, align 2, !dbg !1112
  %279 = load i16, i16* %__x312, align 2, !dbg !1112
  store i16 %279, i16* %tmp313, align 2, !dbg !1112
  %280 = load i16, i16* %tmp313, align 2, !dbg !1112
  %add314 = add i16 %280, 2, !dbg !1104
  %sub315 = sub i16 9216, %add314, !dbg !1104
  %call316 = call zeroext i16 @__fast_hw_crc(i8* %277, i16 zeroext %sub315, i16 zeroext -1), !dbg !1104
  store i16 %call316, i16* @tmp_stack_crc, align 2, !dbg !1104
  %281 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %282 = bitcast %struct.camel_buffer_t* %281 to i8*, !dbg !1104
  %283 = load i16, i16* @tmp_stack_crc, align 2, !dbg !1104
  %call317 = call zeroext i16 @__fast_hw_crc(i8* %282, i16 zeroext 186, i16 zeroext %283), !dbg !1104
  store i16 %call317, i16* @tmp_stack_buf_crc, align 2, !dbg !1104
  %284 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !1104
  %285 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !1104
  %stack_and_buf_crc318 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %285, i32 0, i32 2, !dbg !1104
  store i16 %284, i16* %stack_and_buf_crc318, align 2, !dbg !1104
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !1104
  br label %if.end319

if.end319:                                        ; preds = %if.else306, %if.then293
  br label %do.end320, !dbg !1093

do.end320:                                        ; preds = %if.end319
  call void @task_commit(), !dbg !1114
  %286 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !1115
  %globals321 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %286, i32 0, i32 1, !dbg !1115
  %totalCount = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals321, i32 0, i32 3, !dbg !1115
  %287 = load i16, i16* %totalCount, align 2, !dbg !1115
  %cmp322 = icmp eq i16 %287, 128, !dbg !1117
  br i1 %cmp322, label %if.then323, label %if.end324, !dbg !1118

if.then323:                                       ; preds = %do.end320
  br label %while.end, !dbg !1119

if.end324:                                        ; preds = %do.end320
  br label %if.end325, !dbg !1120

if.end325:                                        ; preds = %if.end324, %if.else256
  br label %if.end326

if.end326:                                        ; preds = %if.end325, %if.end255
  br label %while.body123, !dbg !932, !llvm.loop !1121

while.end:                                        ; preds = %if.then323, %if.then254
  br label %while.cond, !dbg !830, !llvm.loop !1123

while.end327:                                     ; preds = %if.else119, %while.cond
  call void @task_done(), !dbg !1125
  %288 = load i16, i16* %retval, align 2, !dbg !1126
  ret i16 %288, !dbg !1126
}

declare dso_local void @__dump_registers(i16*) #1

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
!131 = !{i32 -2146701990}
!132 = !DILocalVariable(name: "__x", scope: !133, file: !3, line: 230, type: !6)
!133 = distinct !DILexicalBlock(scope: !110, file: !3, line: 230, column: 33)
!134 = !DILocation(line: 230, column: 33, scope: !133)
!135 = !{i32 -2146701754}
!136 = !DILocation(line: 230, column: 51, scope: !110)
!137 = !DILocation(line: 230, column: 33, scope: !110)
!138 = !DILocalVariable(name: "__x", scope: !139, file: !3, line: 230, type: !6)
!139 = distinct !DILexicalBlock(scope: !110, file: !3, line: 230, column: 65)
!140 = !DILocation(line: 230, column: 65, scope: !139)
!141 = !{i32 -2146701629}
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
!314 = distinct !DISubprogram(name: "task_transform", scope: !3, file: !3, line: 421, type: !96, scopeLine: 422, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!315 = !DILocalVariable(name: "sample", scope: !314, file: !3, line: 425, type: !316)
!316 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 16)
!317 = !DILocation(line: 425, column: 16, scope: !314)
!318 = !DILocalVariable(name: "transformedSample", scope: !314, file: !3, line: 426, type: !51)
!319 = !DILocation(line: 426, column: 15, scope: !314)
!320 = !DILocalVariable(name: "i", scope: !321, file: !3, line: 428, type: !6)
!321 = distinct !DILexicalBlock(scope: !314, file: !3, line: 428, column: 2)
!322 = !DILocation(line: 428, column: 16, scope: !321)
!323 = !DILocation(line: 428, column: 7, scope: !321)
!324 = !DILocation(line: 428, column: 23, scope: !325)
!325 = distinct !DILexicalBlock(scope: !321, file: !3, line: 428, column: 2)
!326 = !DILocation(line: 428, column: 25, scope: !325)
!327 = !DILocation(line: 428, column: 2, scope: !321)
!328 = !DILocation(line: 429, column: 7, scope: !329)
!329 = distinct !DILexicalBlock(scope: !330, file: !3, line: 429, column: 7)
!330 = distinct !DILexicalBlock(scope: !325, file: !3, line: 428, column: 51)
!331 = !DILocation(line: 429, column: 18, scope: !329)
!332 = !DILocation(line: 429, column: 21, scope: !329)
!333 = !DILocation(line: 429, column: 23, scope: !329)
!334 = !DILocation(line: 429, column: 44, scope: !329)
!335 = !DILocation(line: 430, column: 5, scope: !329)
!336 = !DILocation(line: 430, column: 16, scope: !329)
!337 = !DILocation(line: 430, column: 19, scope: !329)
!338 = !DILocation(line: 430, column: 21, scope: !329)
!339 = !DILocation(line: 430, column: 42, scope: !329)
!340 = !DILocation(line: 431, column: 5, scope: !329)
!341 = !DILocation(line: 431, column: 16, scope: !329)
!342 = !DILocation(line: 431, column: 19, scope: !329)
!343 = !DILocation(line: 431, column: 21, scope: !329)
!344 = !DILocation(line: 429, column: 7, scope: !330)
!345 = !DILocation(line: 433, column: 23, scope: !346)
!346 = distinct !DILexicalBlock(scope: !329, file: !3, line: 431, column: 43)
!347 = !DILocation(line: 433, column: 34, scope: !346)
!348 = !DILocation(line: 433, column: 37, scope: !346)
!349 = !DILocation(line: 433, column: 39, scope: !346)
!350 = !DILocation(line: 433, column: 22, scope: !346)
!351 = !DILocation(line: 434, column: 7, scope: !346)
!352 = !DILocation(line: 434, column: 18, scope: !346)
!353 = !DILocation(line: 434, column: 21, scope: !346)
!354 = !DILocation(line: 433, column: 4, scope: !346)
!355 = !DILocation(line: 433, column: 15, scope: !346)
!356 = !DILocation(line: 433, column: 18, scope: !346)
!357 = !DILocation(line: 433, column: 20, scope: !346)
!358 = !DILocation(line: 435, column: 23, scope: !346)
!359 = !DILocation(line: 435, column: 34, scope: !346)
!360 = !DILocation(line: 435, column: 37, scope: !346)
!361 = !DILocation(line: 435, column: 39, scope: !346)
!362 = !DILocation(line: 435, column: 22, scope: !346)
!363 = !DILocation(line: 436, column: 7, scope: !346)
!364 = !DILocation(line: 436, column: 18, scope: !346)
!365 = !DILocation(line: 436, column: 21, scope: !346)
!366 = !DILocation(line: 435, column: 4, scope: !346)
!367 = !DILocation(line: 435, column: 15, scope: !346)
!368 = !DILocation(line: 435, column: 18, scope: !346)
!369 = !DILocation(line: 435, column: 20, scope: !346)
!370 = !DILocation(line: 437, column: 23, scope: !346)
!371 = !DILocation(line: 437, column: 34, scope: !346)
!372 = !DILocation(line: 437, column: 37, scope: !346)
!373 = !DILocation(line: 437, column: 39, scope: !346)
!374 = !DILocation(line: 437, column: 22, scope: !346)
!375 = !DILocation(line: 438, column: 7, scope: !346)
!376 = !DILocation(line: 438, column: 18, scope: !346)
!377 = !DILocation(line: 438, column: 21, scope: !346)
!378 = !DILocation(line: 437, column: 4, scope: !346)
!379 = !DILocation(line: 437, column: 15, scope: !346)
!380 = !DILocation(line: 437, column: 18, scope: !346)
!381 = !DILocation(line: 437, column: 20, scope: !346)
!382 = !DILocation(line: 439, column: 3, scope: !346)
!383 = !DILocation(line: 440, column: 2, scope: !330)
!384 = !DILocation(line: 428, column: 47, scope: !325)
!385 = !DILocation(line: 428, column: 2, scope: !325)
!386 = distinct !{!386, !327, !387}
!387 = !DILocation(line: 440, column: 2, scope: !321)
!388 = !DILocation(line: 442, column: 1, scope: !314)
!389 = distinct !DISubprogram(name: "task_featurize", scope: !3, file: !3, line: 459, type: !96, scopeLine: 460, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!390 = !DILocalVariable(name: "mean", scope: !389, file: !3, line: 461, type: !51)
!391 = !DILocation(line: 461, column: 15, scope: !389)
!392 = !DILocalVariable(name: "stddev", scope: !389, file: !3, line: 461, type: !51)
!393 = !DILocation(line: 461, column: 21, scope: !389)
!394 = !DILocation(line: 462, column: 25, scope: !389)
!395 = !DILocation(line: 462, column: 27, scope: !389)
!396 = !DILocation(line: 462, column: 16, scope: !389)
!397 = !DILocation(line: 462, column: 18, scope: !389)
!398 = !DILocation(line: 462, column: 7, scope: !389)
!399 = !DILocation(line: 462, column: 9, scope: !389)
!400 = !DILocation(line: 463, column: 31, scope: !389)
!401 = !DILocation(line: 463, column: 33, scope: !389)
!402 = !DILocation(line: 463, column: 20, scope: !389)
!403 = !DILocation(line: 463, column: 22, scope: !389)
!404 = !DILocation(line: 463, column: 9, scope: !389)
!405 = !DILocation(line: 463, column: 11, scope: !389)
!406 = !DILocalVariable(name: "features", scope: !389, file: !3, line: 464, type: !64)
!407 = !DILocation(line: 464, column: 13, scope: !389)
!408 = !DILocalVariable(name: "i", scope: !389, file: !3, line: 466, type: !409)
!409 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!410 = !DILocation(line: 466, column: 6, scope: !389)
!411 = !DILocation(line: 467, column: 9, scope: !412)
!412 = distinct !DILexicalBlock(scope: !389, file: !3, line: 467, column: 2)
!413 = !DILocation(line: 467, column: 7, scope: !412)
!414 = !DILocation(line: 467, column: 14, scope: !415)
!415 = distinct !DILexicalBlock(scope: !412, file: !3, line: 467, column: 2)
!416 = !DILocation(line: 467, column: 16, scope: !415)
!417 = !DILocation(line: 467, column: 2, scope: !412)
!418 = !DILocation(line: 469, column: 13, scope: !419)
!419 = distinct !DILexicalBlock(scope: !415, file: !3, line: 467, column: 42)
!420 = !DILocation(line: 469, column: 24, scope: !419)
!421 = !DILocation(line: 469, column: 27, scope: !419)
!422 = !DILocation(line: 469, column: 8, scope: !419)
!423 = !DILocation(line: 469, column: 10, scope: !419)
!424 = !DILocation(line: 470, column: 13, scope: !419)
!425 = !DILocation(line: 470, column: 24, scope: !419)
!426 = !DILocation(line: 470, column: 27, scope: !419)
!427 = !DILocation(line: 470, column: 8, scope: !419)
!428 = !DILocation(line: 470, column: 10, scope: !419)
!429 = !DILocation(line: 471, column: 13, scope: !419)
!430 = !DILocation(line: 471, column: 24, scope: !419)
!431 = !DILocation(line: 471, column: 27, scope: !419)
!432 = !DILocation(line: 471, column: 8, scope: !419)
!433 = !DILocation(line: 471, column: 10, scope: !419)
!434 = !DILocation(line: 472, column: 2, scope: !419)
!435 = !DILocation(line: 467, column: 38, scope: !415)
!436 = !DILocation(line: 467, column: 2, scope: !415)
!437 = distinct !{!437, !417, !438}
!438 = !DILocation(line: 472, column: 2, scope: !412)
!439 = !DILocation(line: 473, column: 7, scope: !389)
!440 = !DILocation(line: 473, column: 9, scope: !389)
!441 = !DILocation(line: 474, column: 7, scope: !389)
!442 = !DILocation(line: 474, column: 9, scope: !389)
!443 = !DILocation(line: 475, column: 7, scope: !389)
!444 = !DILocation(line: 475, column: 9, scope: !389)
!445 = !DILocation(line: 477, column: 9, scope: !446)
!446 = distinct !DILexicalBlock(scope: !389, file: !3, line: 477, column: 2)
!447 = !DILocation(line: 477, column: 7, scope: !446)
!448 = !DILocation(line: 477, column: 14, scope: !449)
!449 = distinct !DILexicalBlock(scope: !446, file: !3, line: 477, column: 2)
!450 = !DILocation(line: 477, column: 16, scope: !449)
!451 = !DILocation(line: 477, column: 2, scope: !446)
!452 = !DILocation(line: 478, column: 15, scope: !453)
!453 = distinct !DILexicalBlock(scope: !449, file: !3, line: 477, column: 42)
!454 = !DILocation(line: 478, column: 26, scope: !453)
!455 = !DILocation(line: 478, column: 29, scope: !453)
!456 = !DILocation(line: 478, column: 38, scope: !453)
!457 = !DILocation(line: 478, column: 33, scope: !453)
!458 = !DILocation(line: 478, column: 31, scope: !453)
!459 = !DILocation(line: 478, column: 42, scope: !453)
!460 = !DILocation(line: 478, column: 53, scope: !453)
!461 = !DILocation(line: 478, column: 56, scope: !453)
!462 = !DILocation(line: 478, column: 65, scope: !453)
!463 = !DILocation(line: 478, column: 60, scope: !453)
!464 = !DILocation(line: 478, column: 58, scope: !453)
!465 = !DILocation(line: 479, column: 11, scope: !453)
!466 = !DILocation(line: 479, column: 6, scope: !453)
!467 = !DILocation(line: 479, column: 15, scope: !453)
!468 = !DILocation(line: 479, column: 26, scope: !453)
!469 = !DILocation(line: 479, column: 29, scope: !453)
!470 = !DILocation(line: 479, column: 13, scope: !453)
!471 = !DILocation(line: 478, column: 10, scope: !453)
!472 = !DILocation(line: 478, column: 12, scope: !453)
!473 = !DILocation(line: 480, column: 15, scope: !453)
!474 = !DILocation(line: 480, column: 26, scope: !453)
!475 = !DILocation(line: 480, column: 29, scope: !453)
!476 = !DILocation(line: 480, column: 38, scope: !453)
!477 = !DILocation(line: 480, column: 33, scope: !453)
!478 = !DILocation(line: 480, column: 31, scope: !453)
!479 = !DILocation(line: 480, column: 42, scope: !453)
!480 = !DILocation(line: 480, column: 53, scope: !453)
!481 = !DILocation(line: 480, column: 56, scope: !453)
!482 = !DILocation(line: 480, column: 65, scope: !453)
!483 = !DILocation(line: 480, column: 60, scope: !453)
!484 = !DILocation(line: 480, column: 58, scope: !453)
!485 = !DILocation(line: 481, column: 11, scope: !453)
!486 = !DILocation(line: 481, column: 6, scope: !453)
!487 = !DILocation(line: 481, column: 15, scope: !453)
!488 = !DILocation(line: 481, column: 26, scope: !453)
!489 = !DILocation(line: 481, column: 29, scope: !453)
!490 = !DILocation(line: 481, column: 13, scope: !453)
!491 = !DILocation(line: 480, column: 10, scope: !453)
!492 = !DILocation(line: 480, column: 12, scope: !453)
!493 = !DILocation(line: 482, column: 15, scope: !453)
!494 = !DILocation(line: 482, column: 26, scope: !453)
!495 = !DILocation(line: 482, column: 29, scope: !453)
!496 = !DILocation(line: 482, column: 38, scope: !453)
!497 = !DILocation(line: 482, column: 33, scope: !453)
!498 = !DILocation(line: 482, column: 31, scope: !453)
!499 = !DILocation(line: 482, column: 42, scope: !453)
!500 = !DILocation(line: 482, column: 53, scope: !453)
!501 = !DILocation(line: 482, column: 56, scope: !453)
!502 = !DILocation(line: 482, column: 65, scope: !453)
!503 = !DILocation(line: 482, column: 60, scope: !453)
!504 = !DILocation(line: 482, column: 58, scope: !453)
!505 = !DILocation(line: 483, column: 11, scope: !453)
!506 = !DILocation(line: 483, column: 6, scope: !453)
!507 = !DILocation(line: 483, column: 15, scope: !453)
!508 = !DILocation(line: 483, column: 26, scope: !453)
!509 = !DILocation(line: 483, column: 29, scope: !453)
!510 = !DILocation(line: 483, column: 13, scope: !453)
!511 = !DILocation(line: 482, column: 10, scope: !453)
!512 = !DILocation(line: 482, column: 12, scope: !453)
!513 = !DILocation(line: 484, column: 2, scope: !453)
!514 = !DILocation(line: 477, column: 38, scope: !449)
!515 = !DILocation(line: 477, column: 2, scope: !449)
!516 = distinct !{!516, !451, !517}
!517 = !DILocation(line: 484, column: 2, scope: !446)
!518 = !DILocation(line: 485, column: 9, scope: !389)
!519 = !DILocation(line: 485, column: 11, scope: !389)
!520 = !DILocation(line: 486, column: 9, scope: !389)
!521 = !DILocation(line: 486, column: 11, scope: !389)
!522 = !DILocation(line: 487, column: 9, scope: !389)
!523 = !DILocation(line: 487, column: 11, scope: !389)
!524 = !DILocalVariable(name: "meanmag", scope: !389, file: !3, line: 489, type: !6)
!525 = !DILocation(line: 489, column: 11, scope: !389)
!526 = !DILocation(line: 489, column: 26, scope: !389)
!527 = !DILocation(line: 489, column: 21, scope: !389)
!528 = !DILocation(line: 489, column: 33, scope: !389)
!529 = !DILocation(line: 489, column: 28, scope: !389)
!530 = !DILocation(line: 489, column: 27, scope: !389)
!531 = !DILocation(line: 489, column: 42, scope: !389)
!532 = !DILocation(line: 489, column: 37, scope: !389)
!533 = !DILocation(line: 489, column: 49, scope: !389)
!534 = !DILocation(line: 489, column: 44, scope: !389)
!535 = !DILocation(line: 489, column: 43, scope: !389)
!536 = !DILocation(line: 489, column: 35, scope: !389)
!537 = !DILocation(line: 489, column: 58, scope: !389)
!538 = !DILocation(line: 489, column: 53, scope: !389)
!539 = !DILocation(line: 489, column: 65, scope: !389)
!540 = !DILocation(line: 489, column: 60, scope: !389)
!541 = !DILocation(line: 489, column: 59, scope: !389)
!542 = !DILocation(line: 489, column: 51, scope: !389)
!543 = !DILocalVariable(name: "stddevmag", scope: !389, file: !3, line: 490, type: !6)
!544 = !DILocation(line: 490, column: 11, scope: !389)
!545 = !DILocation(line: 490, column: 30, scope: !389)
!546 = !DILocation(line: 490, column: 23, scope: !389)
!547 = !DILocation(line: 490, column: 39, scope: !389)
!548 = !DILocation(line: 490, column: 32, scope: !389)
!549 = !DILocation(line: 490, column: 31, scope: !389)
!550 = !DILocation(line: 490, column: 50, scope: !389)
!551 = !DILocation(line: 490, column: 43, scope: !389)
!552 = !DILocation(line: 490, column: 59, scope: !389)
!553 = !DILocation(line: 490, column: 52, scope: !389)
!554 = !DILocation(line: 490, column: 51, scope: !389)
!555 = !DILocation(line: 490, column: 41, scope: !389)
!556 = !DILocation(line: 490, column: 70, scope: !389)
!557 = !DILocation(line: 490, column: 63, scope: !389)
!558 = !DILocation(line: 490, column: 79, scope: !389)
!559 = !DILocation(line: 490, column: 72, scope: !389)
!560 = !DILocation(line: 490, column: 71, scope: !389)
!561 = !DILocation(line: 490, column: 61, scope: !389)
!562 = !DILocation(line: 491, column: 30, scope: !389)
!563 = !DILocation(line: 491, column: 23, scope: !389)
!564 = !DILocation(line: 491, column: 11, scope: !389)
!565 = !DILocation(line: 491, column: 21, scope: !389)
!566 = !DILocation(line: 492, column: 30, scope: !389)
!567 = !DILocation(line: 492, column: 23, scope: !389)
!568 = !DILocation(line: 492, column: 11, scope: !389)
!569 = !DILocation(line: 492, column: 21, scope: !389)
!570 = !DILocation(line: 494, column: 10, scope: !389)
!571 = !DILocation(line: 494, column: 2, scope: !389)
!572 = !DILocation(line: 501, column: 4, scope: !573)
!573 = distinct !DILexicalBlock(scope: !389, file: !3, line: 494, column: 20)
!574 = !DILocation(line: 501, column: 19, scope: !573)
!575 = !DILocation(line: 503, column: 4, scope: !573)
!576 = !DILocation(line: 506, column: 4, scope: !573)
!577 = !DILocation(line: 508, column: 1, scope: !389)
!578 = distinct !DISubprogram(name: "task_classify", scope: !3, file: !3, line: 525, type: !96, scopeLine: 525, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!579 = !DILocalVariable(name: "move_less_error", scope: !578, file: !3, line: 526, type: !409)
!580 = !DILocation(line: 526, column: 6, scope: !578)
!581 = !DILocalVariable(name: "stat_less_error", scope: !578, file: !3, line: 527, type: !409)
!582 = !DILocation(line: 527, column: 6, scope: !578)
!583 = !DILocalVariable(name: "i", scope: !578, file: !3, line: 528, type: !409)
!584 = !DILocation(line: 528, column: 6, scope: !578)
!585 = !DILocalVariable(name: "class", scope: !578, file: !3, line: 529, type: !45)
!586 = !DILocation(line: 529, column: 10, scope: !578)
!587 = !DILocalVariable(name: "meanmag", scope: !578, file: !3, line: 530, type: !588)
!588 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!589 = !DILocation(line: 530, column: 11, scope: !578)
!590 = !DILocalVariable(name: "stddevmag", scope: !578, file: !3, line: 531, type: !588)
!591 = !DILocation(line: 531, column: 11, scope: !578)
!592 = !DILocation(line: 533, column: 12, scope: !578)
!593 = !DILocation(line: 533, column: 25, scope: !578)
!594 = !DILocation(line: 533, column: 10, scope: !578)
!595 = !DILocation(line: 534, column: 14, scope: !578)
!596 = !DILocation(line: 534, column: 27, scope: !578)
!597 = !DILocation(line: 534, column: 12, scope: !578)
!598 = !DILocation(line: 536, column: 9, scope: !599)
!599 = distinct !DILexicalBlock(scope: !578, file: !3, line: 536, column: 2)
!600 = !DILocation(line: 536, column: 7, scope: !599)
!601 = !DILocation(line: 536, column: 14, scope: !602)
!602 = distinct !DILexicalBlock(scope: !599, file: !3, line: 536, column: 2)
!603 = !DILocation(line: 536, column: 16, scope: !602)
!604 = !DILocation(line: 536, column: 2, scope: !599)
!605 = !DILocalVariable(name: "stat_mean_err", scope: !606, file: !3, line: 537, type: !588)
!606 = distinct !DILexicalBlock(scope: !602, file: !3, line: 536, column: 35)
!607 = !DILocation(line: 537, column: 12, scope: !606)
!608 = !DILocation(line: 537, column: 29, scope: !606)
!609 = !DILocation(line: 537, column: 50, scope: !606)
!610 = !DILocation(line: 537, column: 53, scope: !606)
!611 = !DILocation(line: 537, column: 63, scope: !606)
!612 = !DILocation(line: 537, column: 61, scope: !606)
!613 = !DILocation(line: 537, column: 28, scope: !606)
!614 = !DILocation(line: 538, column: 7, scope: !606)
!615 = !DILocation(line: 538, column: 28, scope: !606)
!616 = !DILocation(line: 538, column: 31, scope: !606)
!617 = !DILocation(line: 538, column: 41, scope: !606)
!618 = !DILocation(line: 538, column: 39, scope: !606)
!619 = !DILocation(line: 539, column: 7, scope: !606)
!620 = !DILocation(line: 539, column: 17, scope: !606)
!621 = !DILocation(line: 539, column: 38, scope: !606)
!622 = !DILocation(line: 539, column: 41, scope: !606)
!623 = !DILocation(line: 539, column: 15, scope: !606)
!624 = !DILocalVariable(name: "stat_sd_err", scope: !606, file: !3, line: 541, type: !588)
!625 = !DILocation(line: 541, column: 12, scope: !606)
!626 = !DILocation(line: 541, column: 27, scope: !606)
!627 = !DILocation(line: 541, column: 48, scope: !606)
!628 = !DILocation(line: 541, column: 51, scope: !606)
!629 = !DILocation(line: 541, column: 63, scope: !606)
!630 = !DILocation(line: 541, column: 61, scope: !606)
!631 = !DILocation(line: 541, column: 26, scope: !606)
!632 = !DILocation(line: 542, column: 7, scope: !606)
!633 = !DILocation(line: 542, column: 28, scope: !606)
!634 = !DILocation(line: 542, column: 31, scope: !606)
!635 = !DILocation(line: 542, column: 43, scope: !606)
!636 = !DILocation(line: 542, column: 41, scope: !606)
!637 = !DILocation(line: 543, column: 7, scope: !606)
!638 = !DILocation(line: 543, column: 19, scope: !606)
!639 = !DILocation(line: 543, column: 40, scope: !606)
!640 = !DILocation(line: 543, column: 43, scope: !606)
!641 = !DILocation(line: 543, column: 17, scope: !606)
!642 = !DILocalVariable(name: "move_mean_err", scope: !606, file: !3, line: 545, type: !588)
!643 = !DILocation(line: 545, column: 12, scope: !606)
!644 = !DILocation(line: 545, column: 29, scope: !606)
!645 = !DILocation(line: 545, column: 46, scope: !606)
!646 = !DILocation(line: 545, column: 49, scope: !606)
!647 = !DILocation(line: 545, column: 59, scope: !606)
!648 = !DILocation(line: 545, column: 57, scope: !606)
!649 = !DILocation(line: 545, column: 28, scope: !606)
!650 = !DILocation(line: 546, column: 7, scope: !606)
!651 = !DILocation(line: 546, column: 24, scope: !606)
!652 = !DILocation(line: 546, column: 27, scope: !606)
!653 = !DILocation(line: 546, column: 37, scope: !606)
!654 = !DILocation(line: 546, column: 35, scope: !606)
!655 = !DILocation(line: 547, column: 7, scope: !606)
!656 = !DILocation(line: 547, column: 17, scope: !606)
!657 = !DILocation(line: 547, column: 34, scope: !606)
!658 = !DILocation(line: 547, column: 37, scope: !606)
!659 = !DILocation(line: 547, column: 15, scope: !606)
!660 = !DILocalVariable(name: "move_sd_err", scope: !606, file: !3, line: 549, type: !588)
!661 = !DILocation(line: 549, column: 12, scope: !606)
!662 = !DILocation(line: 549, column: 27, scope: !606)
!663 = !DILocation(line: 549, column: 44, scope: !606)
!664 = !DILocation(line: 549, column: 47, scope: !606)
!665 = !DILocation(line: 549, column: 59, scope: !606)
!666 = !DILocation(line: 549, column: 57, scope: !606)
!667 = !DILocation(line: 549, column: 26, scope: !606)
!668 = !DILocation(line: 550, column: 7, scope: !606)
!669 = !DILocation(line: 550, column: 24, scope: !606)
!670 = !DILocation(line: 550, column: 27, scope: !606)
!671 = !DILocation(line: 550, column: 39, scope: !606)
!672 = !DILocation(line: 550, column: 37, scope: !606)
!673 = !DILocation(line: 551, column: 7, scope: !606)
!674 = !DILocation(line: 551, column: 19, scope: !606)
!675 = !DILocation(line: 551, column: 36, scope: !606)
!676 = !DILocation(line: 551, column: 39, scope: !606)
!677 = !DILocation(line: 551, column: 17, scope: !606)
!678 = !DILocation(line: 553, column: 7, scope: !679)
!679 = distinct !DILexicalBlock(scope: !606, file: !3, line: 553, column: 7)
!680 = !DILocation(line: 553, column: 23, scope: !679)
!681 = !DILocation(line: 553, column: 21, scope: !679)
!682 = !DILocation(line: 553, column: 7, scope: !606)
!683 = !DILocation(line: 554, column: 19, scope: !684)
!684 = distinct !DILexicalBlock(scope: !679, file: !3, line: 553, column: 38)
!685 = !DILocation(line: 555, column: 3, scope: !684)
!686 = !DILocation(line: 556, column: 19, scope: !687)
!687 = distinct !DILexicalBlock(scope: !679, file: !3, line: 555, column: 10)
!688 = !DILocation(line: 559, column: 7, scope: !689)
!689 = distinct !DILexicalBlock(scope: !606, file: !3, line: 559, column: 7)
!690 = !DILocation(line: 559, column: 21, scope: !689)
!691 = !DILocation(line: 559, column: 19, scope: !689)
!692 = !DILocation(line: 559, column: 7, scope: !606)
!693 = !DILocation(line: 560, column: 19, scope: !694)
!694 = distinct !DILexicalBlock(scope: !689, file: !3, line: 559, column: 34)
!695 = !DILocation(line: 561, column: 3, scope: !694)
!696 = !DILocation(line: 562, column: 19, scope: !697)
!697 = distinct !DILexicalBlock(scope: !689, file: !3, line: 561, column: 10)
!698 = !DILocation(line: 564, column: 2, scope: !606)
!699 = !DILocation(line: 536, column: 30, scope: !602)
!700 = !DILocation(line: 536, column: 2, scope: !602)
!701 = distinct !{!701, !604, !702}
!702 = !DILocation(line: 564, column: 2, scope: !599)
!703 = !DILocation(line: 566, column: 15, scope: !578)
!704 = !DILocation(line: 566, column: 33, scope: !578)
!705 = !DILocation(line: 566, column: 31, scope: !578)
!706 = !DILocation(line: 566, column: 14, scope: !578)
!707 = !DILocation(line: 566, column: 2, scope: !578)
!708 = !DILocation(line: 566, column: 12, scope: !578)
!709 = !DILocation(line: 570, column: 1, scope: !578)
!710 = distinct !DISubprogram(name: "task_stats", scope: !3, file: !3, line: 587, type: !96, scopeLine: 588, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!711 = !DILocalVariable(name: "movingCount", scope: !710, file: !3, line: 589, type: !6)
!712 = !DILocation(line: 589, column: 11, scope: !710)
!713 = !DILocalVariable(name: "stationaryCount", scope: !710, file: !3, line: 589, type: !6)
!714 = !DILocation(line: 589, column: 28, scope: !710)
!715 = !DILocation(line: 591, column: 4, scope: !710)
!716 = !DILocation(line: 591, column: 2, scope: !710)
!717 = !DILocation(line: 593, column: 10, scope: !710)
!718 = !DILocation(line: 593, column: 2, scope: !710)
!719 = !DILocation(line: 596, column: 6, scope: !720)
!720 = distinct !DILexicalBlock(scope: !710, file: !3, line: 593, column: 21)
!721 = !DILocation(line: 596, column: 4, scope: !720)
!722 = !DILocation(line: 597, column: 4, scope: !720)
!723 = !DILocation(line: 600, column: 6, scope: !720)
!724 = !DILocation(line: 600, column: 4, scope: !720)
!725 = !DILocation(line: 601, column: 4, scope: !720)
!726 = !DILocation(line: 604, column: 6, scope: !727)
!727 = distinct !DILexicalBlock(scope: !710, file: !3, line: 604, column: 6)
!728 = !DILocation(line: 604, column: 21, scope: !727)
!729 = !DILocation(line: 604, column: 6, scope: !710)
!730 = !DILocalVariable(name: "resultStationaryPct", scope: !731, file: !3, line: 606, type: !6)
!731 = distinct !DILexicalBlock(scope: !727, file: !3, line: 604, column: 44)
!732 = !DILocation(line: 606, column: 12, scope: !731)
!733 = !DILocation(line: 606, column: 34, scope: !731)
!734 = !DILocation(line: 606, column: 54, scope: !731)
!735 = !DILocation(line: 606, column: 62, scope: !731)
!736 = !DILocation(line: 606, column: 60, scope: !731)
!737 = !DILocalVariable(name: "resultMovingPct", scope: !731, file: !3, line: 607, type: !6)
!738 = !DILocation(line: 607, column: 12, scope: !731)
!739 = !DILocation(line: 607, column: 30, scope: !731)
!740 = !DILocation(line: 607, column: 46, scope: !731)
!741 = !DILocation(line: 607, column: 54, scope: !731)
!742 = !DILocation(line: 607, column: 52, scope: !731)
!743 = !DILocalVariable(name: "sum", scope: !731, file: !3, line: 609, type: !6)
!744 = !DILocation(line: 609, column: 12, scope: !731)
!745 = !DILocation(line: 609, column: 18, scope: !731)
!746 = !DILocation(line: 609, column: 40, scope: !731)
!747 = !DILocation(line: 609, column: 38, scope: !731)
!748 = !DILocation(line: 612, column: 2, scope: !731)
!749 = !DILocation(line: 615, column: 1, scope: !710)
!750 = distinct !DISubprogram(name: "task_warmup", scope: !3, file: !3, line: 632, type: !96, scopeLine: 633, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!751 = !DILocation(line: 637, column: 2, scope: !750)
!752 = !DILocation(line: 637, column: 9, scope: !750)
!753 = !DILocation(line: 637, column: 35, scope: !750)
!754 = !DILocalVariable(name: "sample", scope: !755, file: !3, line: 639, type: !52)
!755 = distinct !DILexicalBlock(scope: !750, file: !3, line: 637, column: 57)
!756 = !DILocation(line: 639, column: 17, scope: !755)
!757 = !DILocation(line: 640, column: 43, scope: !755)
!758 = !DILocation(line: 640, column: 14, scope: !755)
!759 = !DILocation(line: 640, column: 3, scope: !755)
!760 = !DILocation(line: 640, column: 12, scope: !755)
!761 = !DILocation(line: 641, column: 5, scope: !755)
!762 = !DILocation(line: 641, column: 3, scope: !755)
!763 = distinct !{!763, !751, !764}
!764 = !DILocation(line: 643, column: 2, scope: !750)
!765 = !DILocation(line: 645, column: 2, scope: !750)
!766 = !DILocation(line: 645, column: 22, scope: !750)
!767 = !DILocation(line: 660, column: 1, scope: !750)
!768 = distinct !DISubprogram(name: "task_train", scope: !3, file: !3, line: 677, type: !96, scopeLine: 678, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!769 = !DILocalVariable(name: "trainingSetSize", scope: !768, file: !3, line: 679, type: !6)
!770 = !DILocation(line: 679, column: 11, scope: !768)
!771 = !DILocalVariable(name: "class", scope: !768, file: !3, line: 680, type: !6)
!772 = !DILocation(line: 680, column: 11, scope: !768)
!773 = !DILocation(line: 682, column: 10, scope: !768)
!774 = !DILocation(line: 682, column: 2, scope: !768)
!775 = !DILocation(line: 684, column: 4, scope: !776)
!776 = distinct !DILexicalBlock(scope: !768, file: !3, line: 682, column: 21)
!777 = !DILocation(line: 684, column: 25, scope: !776)
!778 = !DILocation(line: 684, column: 48, scope: !776)
!779 = !DILocation(line: 685, column: 4, scope: !776)
!780 = !DILocation(line: 687, column: 4, scope: !776)
!781 = !DILocation(line: 687, column: 21, scope: !776)
!782 = !DILocation(line: 687, column: 44, scope: !776)
!783 = !DILocation(line: 688, column: 4, scope: !776)
!784 = !DILocation(line: 691, column: 4, scope: !768)
!785 = !DILocation(line: 691, column: 2, scope: !768)
!786 = !DILocation(line: 693, column: 6, scope: !787)
!787 = distinct !DILexicalBlock(scope: !768, file: !3, line: 693, column: 6)
!788 = !DILocation(line: 693, column: 26, scope: !787)
!789 = !DILocation(line: 693, column: 6, scope: !768)
!790 = !DILocation(line: 695, column: 2, scope: !791)
!791 = distinct !DILexicalBlock(scope: !787, file: !3, line: 693, column: 40)
!792 = !DILocation(line: 699, column: 1, scope: !768)
!793 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 701, type: !96, scopeLine: 701, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!794 = !DILocation(line: 703, column: 2, scope: !793)
!795 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 707, type: !96, scopeLine: 707, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!796 = !DILocation(line: 709, column: 1, scope: !795)
!797 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 711, type: !798, scopeLine: 711, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !98)
!798 = !DISubroutineType(types: !799)
!799 = !{!409}
!800 = !DILocation(line: 713, column: 16, scope: !797)
!801 = !DILocation(line: 714, column: 10, scope: !797)
!802 = !DILocation(line: 715, column: 12, scope: !797)
!803 = !DILocation(line: 716, column: 2, scope: !797)
!804 = !DILocation(line: 718, column: 2, scope: !797)
!805 = !DILocation(line: 719, column: 2, scope: !797)
!806 = !DILocation(line: 719, column: 2, scope: !807)
!807 = distinct !DILexicalBlock(scope: !808, file: !3, line: 719, column: 2)
!808 = distinct !DILexicalBlock(scope: !797, file: !3, line: 719, column: 2)
!809 = !DILocation(line: 719, column: 2, scope: !808)
!810 = !DILocation(line: 719, column: 2, scope: !811)
!811 = distinct !DILexicalBlock(scope: !807, file: !3, line: 719, column: 2)
!812 = !DILocalVariable(name: "__x", scope: !813, file: !3, line: 719, type: !6)
!813 = distinct !DILexicalBlock(scope: !811, file: !3, line: 719, column: 2)
!814 = !DILocation(line: 719, column: 2, scope: !813)
!815 = !{i32 -2146696730}
!816 = !DILocalVariable(name: "__x", scope: !817, file: !3, line: 719, type: !6)
!817 = distinct !DILexicalBlock(scope: !811, file: !3, line: 719, column: 2)
!818 = !DILocation(line: 719, column: 2, scope: !817)
!819 = !{i32 -2146696605}
!820 = !DILocation(line: 719, column: 2, scope: !821)
!821 = distinct !DILexicalBlock(scope: !807, file: !3, line: 719, column: 2)
!822 = !DILocalVariable(name: "__x", scope: !823, file: !3, line: 719, type: !6)
!823 = distinct !DILexicalBlock(scope: !821, file: !3, line: 719, column: 2)
!824 = !DILocation(line: 719, column: 2, scope: !823)
!825 = !{i32 -2146696473}
!826 = !DILocalVariable(name: "__x", scope: !827, file: !3, line: 719, type: !6)
!827 = distinct !DILexicalBlock(scope: !821, file: !3, line: 719, column: 2)
!828 = !DILocation(line: 719, column: 2, scope: !827)
!829 = !{i32 -2146696348}
!830 = !DILocation(line: 723, column: 2, scope: !797)
!831 = !DILocation(line: 723, column: 9, scope: !797)
!832 = !DILocation(line: 723, column: 20, scope: !797)
!833 = !DILocation(line: 726, column: 3, scope: !834)
!834 = distinct !DILexicalBlock(scope: !797, file: !3, line: 723, column: 25)
!835 = !DILocation(line: 727, column: 3, scope: !834)
!836 = !DILocation(line: 727, column: 3, scope: !837)
!837 = distinct !DILexicalBlock(scope: !838, file: !3, line: 727, column: 3)
!838 = distinct !DILexicalBlock(scope: !834, file: !3, line: 727, column: 3)
!839 = !DILocation(line: 727, column: 3, scope: !838)
!840 = !DILocation(line: 727, column: 3, scope: !841)
!841 = distinct !DILexicalBlock(scope: !837, file: !3, line: 727, column: 3)
!842 = !DILocalVariable(name: "__x", scope: !843, file: !3, line: 727, type: !6)
!843 = distinct !DILexicalBlock(scope: !841, file: !3, line: 727, column: 3)
!844 = !DILocation(line: 727, column: 3, scope: !843)
!845 = !{i32 -2146694202}
!846 = !DILocalVariable(name: "__x", scope: !847, file: !3, line: 727, type: !6)
!847 = distinct !DILexicalBlock(scope: !841, file: !3, line: 727, column: 3)
!848 = !DILocation(line: 727, column: 3, scope: !847)
!849 = !{i32 -2146694077}
!850 = !DILocation(line: 727, column: 3, scope: !851)
!851 = distinct !DILexicalBlock(scope: !837, file: !3, line: 727, column: 3)
!852 = !DILocalVariable(name: "__x", scope: !853, file: !3, line: 727, type: !6)
!853 = distinct !DILexicalBlock(scope: !851, file: !3, line: 727, column: 3)
!854 = !DILocation(line: 727, column: 3, scope: !853)
!855 = !{i32 -2146693945}
!856 = !DILocalVariable(name: "__x", scope: !857, file: !3, line: 727, type: !6)
!857 = distinct !DILexicalBlock(scope: !851, file: !3, line: 727, column: 3)
!858 = !DILocation(line: 727, column: 3, scope: !857)
!859 = !{i32 -2146693820}
!860 = !DILocation(line: 729, column: 3, scope: !834)
!861 = !DILocation(line: 731, column: 7, scope: !862)
!862 = distinct !DILexicalBlock(scope: !834, file: !3, line: 731, column: 7)
!863 = !DILocation(line: 731, column: 17, scope: !862)
!864 = !DILocation(line: 731, column: 22, scope: !862)
!865 = !DILocation(line: 731, column: 25, scope: !862)
!866 = !DILocation(line: 731, column: 35, scope: !862)
!867 = !DILocation(line: 731, column: 7, scope: !834)
!868 = !DILocation(line: 734, column: 4, scope: !869)
!869 = distinct !DILexicalBlock(scope: !862, file: !3, line: 731, column: 40)
!870 = !DILocation(line: 735, column: 4, scope: !869)
!871 = !DILocation(line: 735, column: 4, scope: !872)
!872 = distinct !DILexicalBlock(scope: !873, file: !3, line: 735, column: 4)
!873 = distinct !DILexicalBlock(scope: !869, file: !3, line: 735, column: 4)
!874 = !DILocation(line: 735, column: 4, scope: !873)
!875 = !DILocation(line: 735, column: 4, scope: !876)
!876 = distinct !DILexicalBlock(scope: !872, file: !3, line: 735, column: 4)
!877 = !DILocalVariable(name: "__x", scope: !878, file: !3, line: 735, type: !6)
!878 = distinct !DILexicalBlock(scope: !876, file: !3, line: 735, column: 4)
!879 = !DILocation(line: 735, column: 4, scope: !878)
!880 = !{i32 -2146691654}
!881 = !DILocalVariable(name: "__x", scope: !882, file: !3, line: 735, type: !6)
!882 = distinct !DILexicalBlock(scope: !876, file: !3, line: 735, column: 4)
!883 = !DILocation(line: 735, column: 4, scope: !882)
!884 = !{i32 -2146691529}
!885 = !DILocation(line: 735, column: 4, scope: !886)
!886 = distinct !DILexicalBlock(scope: !872, file: !3, line: 735, column: 4)
!887 = !DILocalVariable(name: "__x", scope: !888, file: !3, line: 735, type: !6)
!888 = distinct !DILexicalBlock(scope: !886, file: !3, line: 735, column: 4)
!889 = !DILocation(line: 735, column: 4, scope: !888)
!890 = !{i32 -2146691397}
!891 = !DILocalVariable(name: "__x", scope: !892, file: !3, line: 735, type: !6)
!892 = distinct !DILexicalBlock(scope: !886, file: !3, line: 735, column: 4)
!893 = !DILocation(line: 735, column: 4, scope: !892)
!894 = !{i32 -2146691272}
!895 = !DILocation(line: 737, column: 4, scope: !869)
!896 = !DILocation(line: 739, column: 3, scope: !869)
!897 = !DILocation(line: 739, column: 14, scope: !898)
!898 = distinct !DILexicalBlock(scope: !862, file: !3, line: 739, column: 14)
!899 = !DILocation(line: 739, column: 24, scope: !898)
!900 = !DILocation(line: 739, column: 14, scope: !862)
!901 = !DILocation(line: 742, column: 4, scope: !902)
!902 = distinct !DILexicalBlock(scope: !898, file: !3, line: 739, column: 30)
!903 = !DILocation(line: 743, column: 4, scope: !902)
!904 = !DILocation(line: 743, column: 4, scope: !905)
!905 = distinct !DILexicalBlock(scope: !906, file: !3, line: 743, column: 4)
!906 = distinct !DILexicalBlock(scope: !902, file: !3, line: 743, column: 4)
!907 = !DILocation(line: 743, column: 4, scope: !906)
!908 = !DILocation(line: 743, column: 4, scope: !909)
!909 = distinct !DILexicalBlock(scope: !905, file: !3, line: 743, column: 4)
!910 = !DILocalVariable(name: "__x", scope: !911, file: !3, line: 743, type: !6)
!911 = distinct !DILexicalBlock(scope: !909, file: !3, line: 743, column: 4)
!912 = !DILocation(line: 743, column: 4, scope: !911)
!913 = !{i32 -2146689127}
!914 = !DILocalVariable(name: "__x", scope: !915, file: !3, line: 743, type: !6)
!915 = distinct !DILexicalBlock(scope: !909, file: !3, line: 743, column: 4)
!916 = !DILocation(line: 743, column: 4, scope: !915)
!917 = !{i32 -2146689002}
!918 = !DILocation(line: 743, column: 4, scope: !919)
!919 = distinct !DILexicalBlock(scope: !905, file: !3, line: 743, column: 4)
!920 = !DILocalVariable(name: "__x", scope: !921, file: !3, line: 743, type: !6)
!921 = distinct !DILexicalBlock(scope: !919, file: !3, line: 743, column: 4)
!922 = !DILocation(line: 743, column: 4, scope: !921)
!923 = !{i32 -2146688870}
!924 = !DILocalVariable(name: "__x", scope: !925, file: !3, line: 743, type: !6)
!925 = distinct !DILexicalBlock(scope: !919, file: !3, line: 743, column: 4)
!926 = !DILocation(line: 743, column: 4, scope: !925)
!927 = !{i32 -2146688745}
!928 = !DILocation(line: 745, column: 4, scope: !902)
!929 = !DILocation(line: 747, column: 3, scope: !902)
!930 = !DILocation(line: 749, column: 4, scope: !931)
!931 = distinct !DILexicalBlock(scope: !898, file: !3, line: 747, column: 10)
!932 = !DILocation(line: 752, column: 3, scope: !834)
!933 = !DILocation(line: 755, column: 4, scope: !934)
!934 = distinct !DILexicalBlock(scope: !834, file: !3, line: 752, column: 13)
!935 = !DILocation(line: 756, column: 4, scope: !934)
!936 = !DILocation(line: 756, column: 4, scope: !937)
!937 = distinct !DILexicalBlock(scope: !938, file: !3, line: 756, column: 4)
!938 = distinct !DILexicalBlock(scope: !934, file: !3, line: 756, column: 4)
!939 = !DILocation(line: 756, column: 4, scope: !938)
!940 = !DILocation(line: 756, column: 4, scope: !941)
!941 = distinct !DILexicalBlock(scope: !937, file: !3, line: 756, column: 4)
!942 = !DILocalVariable(name: "__x", scope: !943, file: !3, line: 756, type: !6)
!943 = distinct !DILexicalBlock(scope: !941, file: !3, line: 756, column: 4)
!944 = !DILocation(line: 756, column: 4, scope: !943)
!945 = !{i32 -2146686621}
!946 = !DILocalVariable(name: "__x", scope: !947, file: !3, line: 756, type: !6)
!947 = distinct !DILexicalBlock(scope: !941, file: !3, line: 756, column: 4)
!948 = !DILocation(line: 756, column: 4, scope: !947)
!949 = !{i32 -2146686496}
!950 = !DILocation(line: 756, column: 4, scope: !951)
!951 = distinct !DILexicalBlock(scope: !937, file: !3, line: 756, column: 4)
!952 = !DILocalVariable(name: "__x", scope: !953, file: !3, line: 756, type: !6)
!953 = distinct !DILexicalBlock(scope: !951, file: !3, line: 756, column: 4)
!954 = !DILocation(line: 756, column: 4, scope: !953)
!955 = !{i32 -2146686364}
!956 = !DILocalVariable(name: "__x", scope: !957, file: !3, line: 756, type: !6)
!957 = distinct !DILexicalBlock(scope: !951, file: !3, line: 756, column: 4)
!958 = !DILocation(line: 756, column: 4, scope: !957)
!959 = !{i32 -2146686239}
!960 = !DILocation(line: 758, column: 4, scope: !934)
!961 = !DILocation(line: 761, column: 4, scope: !934)
!962 = !DILocation(line: 762, column: 4, scope: !934)
!963 = !DILocation(line: 762, column: 4, scope: !964)
!964 = distinct !DILexicalBlock(scope: !965, file: !3, line: 762, column: 4)
!965 = distinct !DILexicalBlock(scope: !934, file: !3, line: 762, column: 4)
!966 = !DILocation(line: 762, column: 4, scope: !965)
!967 = !DILocation(line: 762, column: 4, scope: !968)
!968 = distinct !DILexicalBlock(scope: !964, file: !3, line: 762, column: 4)
!969 = !DILocalVariable(name: "__x", scope: !970, file: !3, line: 762, type: !6)
!970 = distinct !DILexicalBlock(scope: !968, file: !3, line: 762, column: 4)
!971 = !DILocation(line: 762, column: 4, scope: !970)
!972 = !{i32 -2146684115}
!973 = !DILocalVariable(name: "__x", scope: !974, file: !3, line: 762, type: !6)
!974 = distinct !DILexicalBlock(scope: !968, file: !3, line: 762, column: 4)
!975 = !DILocation(line: 762, column: 4, scope: !974)
!976 = !{i32 -2146683990}
!977 = !DILocation(line: 762, column: 4, scope: !978)
!978 = distinct !DILexicalBlock(scope: !964, file: !3, line: 762, column: 4)
!979 = !DILocalVariable(name: "__x", scope: !980, file: !3, line: 762, type: !6)
!980 = distinct !DILexicalBlock(scope: !978, file: !3, line: 762, column: 4)
!981 = !DILocation(line: 762, column: 4, scope: !980)
!982 = !{i32 -2146683858}
!983 = !DILocalVariable(name: "__x", scope: !984, file: !3, line: 762, type: !6)
!984 = distinct !DILexicalBlock(scope: !978, file: !3, line: 762, column: 4)
!985 = !DILocation(line: 762, column: 4, scope: !984)
!986 = !{i32 -2146683733}
!987 = !DILocation(line: 764, column: 4, scope: !934)
!988 = !DILocation(line: 767, column: 4, scope: !934)
!989 = !DILocation(line: 768, column: 4, scope: !934)
!990 = !DILocation(line: 768, column: 4, scope: !991)
!991 = distinct !DILexicalBlock(scope: !992, file: !3, line: 768, column: 4)
!992 = distinct !DILexicalBlock(scope: !934, file: !3, line: 768, column: 4)
!993 = !DILocation(line: 768, column: 4, scope: !992)
!994 = !DILocation(line: 768, column: 4, scope: !995)
!995 = distinct !DILexicalBlock(scope: !991, file: !3, line: 768, column: 4)
!996 = !DILocalVariable(name: "__x", scope: !997, file: !3, line: 768, type: !6)
!997 = distinct !DILexicalBlock(scope: !995, file: !3, line: 768, column: 4)
!998 = !DILocation(line: 768, column: 4, scope: !997)
!999 = !{i32 -2146681609}
!1000 = !DILocalVariable(name: "__x", scope: !1001, file: !3, line: 768, type: !6)
!1001 = distinct !DILexicalBlock(scope: !995, file: !3, line: 768, column: 4)
!1002 = !DILocation(line: 768, column: 4, scope: !1001)
!1003 = !{i32 -2146681484}
!1004 = !DILocation(line: 768, column: 4, scope: !1005)
!1005 = distinct !DILexicalBlock(scope: !991, file: !3, line: 768, column: 4)
!1006 = !DILocalVariable(name: "__x", scope: !1007, file: !3, line: 768, type: !6)
!1007 = distinct !DILexicalBlock(scope: !1005, file: !3, line: 768, column: 4)
!1008 = !DILocation(line: 768, column: 4, scope: !1007)
!1009 = !{i32 -2146681352}
!1010 = !DILocalVariable(name: "__x", scope: !1011, file: !3, line: 768, type: !6)
!1011 = distinct !DILexicalBlock(scope: !1005, file: !3, line: 768, column: 4)
!1012 = !DILocation(line: 768, column: 4, scope: !1011)
!1013 = !{i32 -2146681227}
!1014 = !DILocation(line: 770, column: 4, scope: !934)
!1015 = !DILocation(line: 772, column: 8, scope: !1016)
!1016 = distinct !DILexicalBlock(scope: !934, file: !3, line: 772, column: 8)
!1017 = !DILocation(line: 772, column: 18, scope: !1016)
!1018 = !DILocation(line: 772, column: 23, scope: !1016)
!1019 = !DILocation(line: 772, column: 26, scope: !1016)
!1020 = !DILocation(line: 772, column: 36, scope: !1016)
!1021 = !DILocation(line: 772, column: 8, scope: !934)
!1022 = !DILocation(line: 775, column: 5, scope: !1023)
!1023 = distinct !DILexicalBlock(scope: !1016, file: !3, line: 772, column: 41)
!1024 = !DILocation(line: 776, column: 5, scope: !1023)
!1025 = !DILocation(line: 776, column: 5, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1027, file: !3, line: 776, column: 5)
!1027 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 776, column: 5)
!1028 = !DILocation(line: 776, column: 5, scope: !1027)
!1029 = !DILocation(line: 776, column: 5, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1026, file: !3, line: 776, column: 5)
!1031 = !DILocalVariable(name: "__x", scope: !1032, file: !3, line: 776, type: !6)
!1032 = distinct !DILexicalBlock(scope: !1030, file: !3, line: 776, column: 5)
!1033 = !DILocation(line: 776, column: 5, scope: !1032)
!1034 = !{i32 -2146679061}
!1035 = !DILocalVariable(name: "__x", scope: !1036, file: !3, line: 776, type: !6)
!1036 = distinct !DILexicalBlock(scope: !1030, file: !3, line: 776, column: 5)
!1037 = !DILocation(line: 776, column: 5, scope: !1036)
!1038 = !{i32 -2146678936}
!1039 = !DILocation(line: 776, column: 5, scope: !1040)
!1040 = distinct !DILexicalBlock(scope: !1026, file: !3, line: 776, column: 5)
!1041 = !DILocalVariable(name: "__x", scope: !1042, file: !3, line: 776, type: !6)
!1042 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 776, column: 5)
!1043 = !DILocation(line: 776, column: 5, scope: !1042)
!1044 = !{i32 -2146678804}
!1045 = !DILocalVariable(name: "__x", scope: !1046, file: !3, line: 776, type: !6)
!1046 = distinct !DILexicalBlock(scope: !1040, file: !3, line: 776, column: 5)
!1047 = !DILocation(line: 776, column: 5, scope: !1046)
!1048 = !{i32 -2146678679}
!1049 = !DILocation(line: 778, column: 5, scope: !1023)
!1050 = !DILocation(line: 780, column: 9, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1023, file: !3, line: 780, column: 9)
!1052 = !DILocation(line: 780, column: 29, scope: !1051)
!1053 = !DILocation(line: 780, column: 9, scope: !1023)
!1054 = !DILocation(line: 781, column: 6, scope: !1051)
!1055 = !DILocation(line: 783, column: 4, scope: !1023)
!1056 = !DILocation(line: 783, column: 15, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1016, file: !3, line: 783, column: 15)
!1058 = !DILocation(line: 783, column: 25, scope: !1057)
!1059 = !DILocation(line: 783, column: 15, scope: !1016)
!1060 = !DILocation(line: 786, column: 5, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1057, file: !3, line: 783, column: 31)
!1062 = !DILocation(line: 787, column: 5, scope: !1061)
!1063 = !DILocation(line: 787, column: 5, scope: !1064)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !3, line: 787, column: 5)
!1065 = distinct !DILexicalBlock(scope: !1061, file: !3, line: 787, column: 5)
!1066 = !DILocation(line: 787, column: 5, scope: !1065)
!1067 = !DILocation(line: 787, column: 5, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 787, column: 5)
!1069 = !DILocalVariable(name: "__x", scope: !1070, file: !3, line: 787, type: !6)
!1070 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 787, column: 5)
!1071 = !DILocation(line: 787, column: 5, scope: !1070)
!1072 = !{i32 -2146676497}
!1073 = !DILocalVariable(name: "__x", scope: !1074, file: !3, line: 787, type: !6)
!1074 = distinct !DILexicalBlock(scope: !1068, file: !3, line: 787, column: 5)
!1075 = !DILocation(line: 787, column: 5, scope: !1074)
!1076 = !{i32 -2146676372}
!1077 = !DILocation(line: 787, column: 5, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1064, file: !3, line: 787, column: 5)
!1079 = !DILocalVariable(name: "__x", scope: !1080, file: !3, line: 787, type: !6)
!1080 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 787, column: 5)
!1081 = !DILocation(line: 787, column: 5, scope: !1080)
!1082 = !{i32 -2146676240}
!1083 = !DILocalVariable(name: "__x", scope: !1084, file: !3, line: 787, type: !6)
!1084 = distinct !DILexicalBlock(scope: !1078, file: !3, line: 787, column: 5)
!1085 = !DILocation(line: 787, column: 5, scope: !1084)
!1086 = !{i32 -2146676115}
!1087 = !DILocation(line: 789, column: 5, scope: !1061)
!1088 = !DILocation(line: 792, column: 5, scope: !1061)
!1089 = !DILocation(line: 793, column: 5, scope: !1061)
!1090 = !DILocation(line: 793, column: 5, scope: !1091)
!1091 = distinct !DILexicalBlock(scope: !1092, file: !3, line: 793, column: 5)
!1092 = distinct !DILexicalBlock(scope: !1061, file: !3, line: 793, column: 5)
!1093 = !DILocation(line: 793, column: 5, scope: !1092)
!1094 = !DILocation(line: 793, column: 5, scope: !1095)
!1095 = distinct !DILexicalBlock(scope: !1091, file: !3, line: 793, column: 5)
!1096 = !DILocalVariable(name: "__x", scope: !1097, file: !3, line: 793, type: !6)
!1097 = distinct !DILexicalBlock(scope: !1095, file: !3, line: 793, column: 5)
!1098 = !DILocation(line: 793, column: 5, scope: !1097)
!1099 = !{i32 -2146673991}
!1100 = !DILocalVariable(name: "__x", scope: !1101, file: !3, line: 793, type: !6)
!1101 = distinct !DILexicalBlock(scope: !1095, file: !3, line: 793, column: 5)
!1102 = !DILocation(line: 793, column: 5, scope: !1101)
!1103 = !{i32 -2146673866}
!1104 = !DILocation(line: 793, column: 5, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1091, file: !3, line: 793, column: 5)
!1106 = !DILocalVariable(name: "__x", scope: !1107, file: !3, line: 793, type: !6)
!1107 = distinct !DILexicalBlock(scope: !1105, file: !3, line: 793, column: 5)
!1108 = !DILocation(line: 793, column: 5, scope: !1107)
!1109 = !{i32 -2146673734}
!1110 = !DILocalVariable(name: "__x", scope: !1111, file: !3, line: 793, type: !6)
!1111 = distinct !DILexicalBlock(scope: !1105, file: !3, line: 793, column: 5)
!1112 = !DILocation(line: 793, column: 5, scope: !1111)
!1113 = !{i32 -2146673609}
!1114 = !DILocation(line: 795, column: 5, scope: !1061)
!1115 = !DILocation(line: 797, column: 9, scope: !1116)
!1116 = distinct !DILexicalBlock(scope: !1061, file: !3, line: 797, column: 9)
!1117 = !DILocation(line: 797, column: 24, scope: !1116)
!1118 = !DILocation(line: 797, column: 9, scope: !1061)
!1119 = !DILocation(line: 798, column: 6, scope: !1116)
!1120 = !DILocation(line: 800, column: 4, scope: !1061)
!1121 = distinct !{!1121, !932, !1122}
!1122 = !DILocation(line: 801, column: 3, scope: !834)
!1123 = distinct !{!1123, !830, !1124}
!1124 = !DILocation(line: 804, column: 2, scope: !797)
!1125 = !DILocation(line: 806, column: 2, scope: !797)
!1126 = !DILocation(line: 807, column: 1, scope: !797)
