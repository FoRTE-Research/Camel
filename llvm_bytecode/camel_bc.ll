; ModuleID = 'camel_bc.bc'
source_filename = "../benchmarks/camel_bc.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, i16, i16, i16, i16, i16, i32, i16 }
%union.anon = type { i32 }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !28
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !54
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !21
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !26
@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1, !dbg !59
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !16
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !56
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !74 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !75
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !76
  %conv = zext i8 %0 to i16, !dbg !76
  %or = or i16 %conv, 1, !dbg !76
  %conv1 = trunc i16 %or to i8, !dbg !76
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !76
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !77
  %conv2 = zext i8 %1 to i16, !dbg !77
  %and = and i16 %conv2, -2, !dbg !77
  %conv3 = trunc i16 %and to i8, !dbg !77
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !77
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !78
  %and4 = and i16 %2, -2, !dbg !78
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !78
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !79
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !80
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !81
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !82
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !83
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !86 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !87
  %cmp = icmp eq i16 %0, 1, !dbg !89
  br i1 %cmp, label %if.then, label %if.else, !dbg !90

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !91
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !93
  br label %if.end4, !dbg !94

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !95
  %cmp1 = icmp eq i16 %1, 2, !dbg !97
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !98

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !99
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !101
  br label %if.end, !dbg !102

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !103
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !105
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !105
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !105
  %3 = load i16, i16* %arrayidx, align 2, !dbg !105
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #5, !dbg !105, !srcloc !107
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !108, metadata !DIExpression()), !dbg !110
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !110, !srcloc !111
  store i16 %4, i16* %__x, align 2, !dbg !110
  %5 = load i16, i16* %__x, align 2, !dbg !110
  store i16 %5, i16* %tmp, align 2, !dbg !110
  %6 = load i16, i16* %tmp, align 2, !dbg !110
  %add = add i16 %6, 2, !dbg !112
  %7 = inttoptr i16 %add to i8*, !dbg !113
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !114, metadata !DIExpression()), !dbg !116
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !116, !srcloc !117
  store i16 %8, i16* %__x5, align 2, !dbg !116
  %9 = load i16, i16* %__x5, align 2, !dbg !116
  store i16 %9, i16* %tmp6, align 2, !dbg !116
  %10 = load i16, i16* %tmp6, align 2, !dbg !116
  %add7 = add i16 %10, 2, !dbg !118
  %sub = sub i16 9216, %add7, !dbg !119
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !120
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !121
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !122
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !122
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !123
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 44, i16 zeroext %13), !dbg !124
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !125
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !126
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !128
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !129
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !129
  %cmp9 = icmp eq i16 %14, %16, !dbg !130
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !131

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !132
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !134
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !135
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !134
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 46, i1 false), !dbg !134
  call void @camel_init(), !dbg !136
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !137
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !138
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !137
  call void @__restore_registers(i16* %arraydecay), !dbg !139
  br label %if.end13, !dbg !140

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !141
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !143
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !144 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !145
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !145
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !145
  store i16 0, i16* %func, align 2, !dbg !146
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !147
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !147
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !147
  store i16 0, i16* %n_0, align 2, !dbg !148
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !149
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !149
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 1, !dbg !149
  store i16 0, i16* %n_1, align 2, !dbg !150
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !151
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !151
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !151
  store i16 0, i16* %n_2, align 2, !dbg !152
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !153
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !153
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !153
  store i16 0, i16* %n_3, align 2, !dbg !154
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !155
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !155
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !155
  store i16 0, i16* %n_4, align 2, !dbg !156
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !157
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !157
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !157
  store i16 0, i16* %n_5, align 2, !dbg !158
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !159
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !159
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !159
  store i16 0, i16* %n_6, align 2, !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_select_func() #0 !dbg !162 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !163
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !163
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !163
  store i32 4, i32* %seed, align 2, !dbg !164
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !165
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !165
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !165
  store i16 0, i16* %iter, align 2, !dbg !166
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !167
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !167
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !167
  %3 = load i16, i16* %func, align 2, !dbg !168
  %inc = add i16 %3, 1, !dbg !168
  store i16 %inc, i16* %func, align 2, !dbg !168
  ret void, !dbg !169
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_count() #0 !dbg !170 {
entry:
  %tmp_seed = alloca i32, align 2
  %temp = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !173
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !173
  %1 = load i32, i32* %seed, align 2, !dbg !173
  store i32 %1, i32* %tmp_seed, align 2, !dbg !172
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !174
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !174
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !174
  %3 = load i32, i32* %seed2, align 2, !dbg !174
  %add = add i32 %3, 13, !dbg !175
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !176
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !176
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !176
  store i32 %add, i32* %seed4, align 2, !dbg !177
  call void @llvm.dbg.declare(metadata i16* %temp, metadata !178, metadata !DIExpression()), !dbg !179
  store i16 0, i16* %temp, align 2, !dbg !179
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !180
  %tobool = icmp ne i32 %5, 0, !dbg !180
  br i1 %tobool, label %if.then, label %if.end, !dbg !182

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !183

do.body:                                          ; preds = %do.cond, %if.then
  %6 = load i16, i16* %temp, align 2, !dbg !184
  %inc = add i16 %6, 1, !dbg !184
  store i16 %inc, i16* %temp, align 2, !dbg !184
  br label %do.cond, !dbg !185

do.cond:                                          ; preds = %do.body
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !186
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !187
  %sub = sub i32 %8, 1, !dbg !188
  %and = and i32 %7, %sub, !dbg !189
  store i32 %and, i32* %tmp_seed, align 2, !dbg !190
  %cmp = icmp ne i32 0, %and, !dbg !191
  br i1 %cmp, label %do.body, label %do.end, !dbg !185, !llvm.loop !192

do.end:                                           ; preds = %do.cond
  br label %if.end, !dbg !185

if.end:                                           ; preds = %do.end, %entry
  %9 = load i16, i16* %temp, align 2, !dbg !194
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !195
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !195
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !195
  %11 = load i16, i16* %n_0, align 2, !dbg !196
  %add6 = add i16 %11, %9, !dbg !196
  store i16 %add6, i16* %n_0, align 2, !dbg !196
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !197
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !197
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !197
  %13 = load i16, i16* %iter, align 2, !dbg !198
  %inc8 = add i16 %13, 1, !dbg !198
  store i16 %inc8, i16* %iter, align 2, !dbg !198
  ret void, !dbg !199
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bitcount() #0 !dbg !200 {
entry:
  %tmp_seed = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !201, metadata !DIExpression()), !dbg !202
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !203
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !203
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !203
  %1 = load i32, i32* %seed, align 2, !dbg !203
  store i32 %1, i32* %tmp_seed, align 2, !dbg !202
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !204
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !204
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !204
  %3 = load i32, i32* %seed2, align 2, !dbg !204
  %add = add i32 %3, 13, !dbg !205
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !206
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !206
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !206
  store i32 %add, i32* %seed4, align 2, !dbg !207
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !208
  %and = and i32 %5, -1431655766, !dbg !209
  %shr = lshr i32 %and, 1, !dbg !210
  %6 = load i32, i32* %tmp_seed, align 2, !dbg !211
  %and5 = and i32 %6, 1431655765, !dbg !212
  %add6 = add i32 %shr, %and5, !dbg !213
  store i32 %add6, i32* %tmp_seed, align 2, !dbg !214
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !215
  %and7 = and i32 %7, -858993460, !dbg !216
  %shr8 = lshr i32 %and7, 2, !dbg !217
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !218
  %and9 = and i32 %8, 858993459, !dbg !219
  %add10 = add i32 %shr8, %and9, !dbg !220
  store i32 %add10, i32* %tmp_seed, align 2, !dbg !221
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !222
  %and11 = and i32 %9, -252645136, !dbg !223
  %shr12 = lshr i32 %and11, 4, !dbg !224
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !225
  %and13 = and i32 %10, 252645135, !dbg !226
  %add14 = add i32 %shr12, %and13, !dbg !227
  store i32 %add14, i32* %tmp_seed, align 2, !dbg !228
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !229
  %and15 = and i32 %11, -16711936, !dbg !230
  %shr16 = lshr i32 %and15, 8, !dbg !231
  %12 = load i32, i32* %tmp_seed, align 2, !dbg !232
  %and17 = and i32 %12, 16711935, !dbg !233
  %add18 = add i32 %shr16, %and17, !dbg !234
  store i32 %add18, i32* %tmp_seed, align 2, !dbg !235
  %13 = load i32, i32* %tmp_seed, align 2, !dbg !236
  %and19 = and i32 %13, -65536, !dbg !237
  %shr20 = lshr i32 %and19, 16, !dbg !238
  %14 = load i32, i32* %tmp_seed, align 2, !dbg !239
  %and21 = and i32 %14, 65535, !dbg !240
  %add22 = add i32 %shr20, %and21, !dbg !241
  store i32 %add22, i32* %tmp_seed, align 2, !dbg !242
  %15 = load i32, i32* %tmp_seed, align 2, !dbg !243
  %conv = trunc i32 %15 to i16, !dbg !244
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !245
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !245
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 1, !dbg !245
  %17 = load i16, i16* %n_1, align 2, !dbg !246
  %add24 = add i16 %17, %conv, !dbg !246
  store i16 %add24, i16* %n_1, align 2, !dbg !246
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !247
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !247
  %19 = load i16, i16* %iter, align 2, !dbg !248
  %inc = add i16 %19, 1, !dbg !248
  store i16 %inc, i16* %iter, align 2, !dbg !248
  ret void, !dbg !249
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @recursive_cnt(i32 %x) #0 !dbg !250 {
entry:
  %x.addr = alloca i32, align 2
  %cnt = alloca i16, align 2
  store i32 %x, i32* %x.addr, align 2
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !253, metadata !DIExpression()), !dbg !254
  call void @llvm.dbg.declare(metadata i16* %cnt, metadata !255, metadata !DIExpression()), !dbg !256
  %0 = load i32, i32* %x.addr, align 2, !dbg !257
  %and = and i32 %0, 15, !dbg !258
  %conv = trunc i32 %and to i16, !dbg !259
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !260
  %1 = load i8, i8* %arrayidx, align 1, !dbg !260
  %conv1 = sext i8 %1 to i16, !dbg !260
  store i16 %conv1, i16* %cnt, align 2, !dbg !256
  %2 = load i32, i32* %x.addr, align 2, !dbg !261
  %shr = lshr i32 %2, 4, !dbg !261
  store i32 %shr, i32* %x.addr, align 2, !dbg !261
  %cmp = icmp ne i32 0, %shr, !dbg !263
  br i1 %cmp, label %if.then, label %if.end, !dbg !264

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %x.addr, align 2, !dbg !265
  %call = call i16 @recursive_cnt(i32 %3), !dbg !266
  %4 = load i16, i16* %cnt, align 2, !dbg !267
  %add = add nsw i16 %4, %call, !dbg !267
  store i16 %add, i16* %cnt, align 2, !dbg !267
  br label %if.end, !dbg !268

if.end:                                           ; preds = %if.then, %entry
  %5 = load i16, i16* %cnt, align 2, !dbg !269
  ret i16 %5, !dbg !270
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcnt() #0 !dbg !271 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !272
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !272
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !272
  %1 = load i32, i32* %seed, align 2, !dbg !272
  %call = call i16 @recursive_cnt(i32 %1), !dbg !273
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !274
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !274
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !274
  %3 = load i16, i16* %n_2, align 2, !dbg !275
  %add = add i16 %3, %call, !dbg !275
  store i16 %add, i16* %n_2, align 2, !dbg !275
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !276
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !276
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !276
  %5 = load i32, i32* %seed3, align 2, !dbg !276
  %add4 = add i32 %5, 13, !dbg !277
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !278
  %seed6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 8, !dbg !278
  store i32 %add4, i32* %seed6, align 2, !dbg !279
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !280
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !280
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !280
  %8 = load i16, i16* %iter, align 2, !dbg !281
  %inc = add i16 %8, 1, !dbg !281
  store i16 %inc, i16* %iter, align 2, !dbg !281
  ret void, !dbg !282
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcount() #0 !dbg !283 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !284
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !284
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !284
  %1 = load i32, i32* %seed, align 2, !dbg !284
  %and = and i32 %1, 15, !dbg !285
  %conv = trunc i32 %and to i16, !dbg !286
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !287
  %2 = load i8, i8* %arrayidx, align 1, !dbg !287
  %conv1 = sext i8 %2 to i16, !dbg !287
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !288
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !288
  %4 = load i32, i32* %seed3, align 2, !dbg !288
  %and4 = and i32 %4, 240, !dbg !289
  %shr = lshr i32 %and4, 4, !dbg !290
  %conv5 = trunc i32 %shr to i16, !dbg !291
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv5, !dbg !292
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !292
  %conv7 = sext i8 %5 to i16, !dbg !292
  %add = add nsw i16 %conv1, %conv7, !dbg !293
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !294
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !294
  %seed9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !294
  %7 = load i32, i32* %seed9, align 2, !dbg !294
  %and10 = and i32 %7, 3840, !dbg !295
  %shr11 = lshr i32 %and10, 8, !dbg !296
  %conv12 = trunc i32 %shr11 to i16, !dbg !297
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv12, !dbg !298
  %8 = load i8, i8* %arrayidx13, align 1, !dbg !298
  %conv14 = sext i8 %8 to i16, !dbg !298
  %add15 = add nsw i16 %add, %conv14, !dbg !299
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !300
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !300
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !300
  %10 = load i32, i32* %seed17, align 2, !dbg !300
  %and18 = and i32 %10, 61440, !dbg !301
  %shr19 = lshr i32 %and18, 12, !dbg !302
  %conv20 = trunc i32 %shr19 to i16, !dbg !303
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv20, !dbg !304
  %11 = load i8, i8* %arrayidx21, align 1, !dbg !304
  %conv22 = sext i8 %11 to i16, !dbg !304
  %add23 = add nsw i16 %add15, %conv22, !dbg !305
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !306
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !306
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !306
  %13 = load i32, i32* %seed25, align 2, !dbg !306
  %and26 = and i32 %13, 983040, !dbg !307
  %shr27 = lshr i32 %and26, 16, !dbg !308
  %conv28 = trunc i32 %shr27 to i16, !dbg !309
  %arrayidx29 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv28, !dbg !310
  %14 = load i8, i8* %arrayidx29, align 1, !dbg !310
  %conv30 = sext i8 %14 to i16, !dbg !310
  %add31 = add nsw i16 %add23, %conv30, !dbg !311
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !312
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !312
  %seed33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 8, !dbg !312
  %16 = load i32, i32* %seed33, align 2, !dbg !312
  %and34 = and i32 %16, 15728640, !dbg !313
  %shr35 = lshr i32 %and34, 20, !dbg !314
  %conv36 = trunc i32 %shr35 to i16, !dbg !315
  %arrayidx37 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv36, !dbg !316
  %17 = load i8, i8* %arrayidx37, align 1, !dbg !316
  %conv38 = sext i8 %17 to i16, !dbg !316
  %add39 = add nsw i16 %add31, %conv38, !dbg !317
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !318
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !318
  %seed41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 8, !dbg !318
  %19 = load i32, i32* %seed41, align 2, !dbg !318
  %and42 = and i32 %19, 251658240, !dbg !319
  %shr43 = lshr i32 %and42, 24, !dbg !320
  %conv44 = trunc i32 %shr43 to i16, !dbg !321
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv44, !dbg !322
  %20 = load i8, i8* %arrayidx45, align 1, !dbg !322
  %conv46 = sext i8 %20 to i16, !dbg !322
  %add47 = add nsw i16 %add39, %conv46, !dbg !323
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !324
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !324
  %seed49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 8, !dbg !324
  %22 = load i32, i32* %seed49, align 2, !dbg !324
  %and50 = and i32 %22, -268435456, !dbg !325
  %shr51 = lshr i32 %and50, 28, !dbg !326
  %conv52 = trunc i32 %shr51 to i16, !dbg !327
  %arrayidx53 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv52, !dbg !328
  %23 = load i8, i8* %arrayidx53, align 1, !dbg !328
  %conv54 = sext i8 %23 to i16, !dbg !328
  %add55 = add nsw i16 %add47, %conv54, !dbg !329
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !330
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !330
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 3, !dbg !330
  %25 = load i16, i16* %n_3, align 2, !dbg !331
  %add57 = add i16 %25, %add55, !dbg !331
  store i16 %add57, i16* %n_3, align 2, !dbg !331
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !332
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !332
  %seed59 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 8, !dbg !332
  %27 = load i32, i32* %seed59, align 2, !dbg !332
  %add60 = add i32 %27, 13, !dbg !333
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !334
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !334
  %seed62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 8, !dbg !334
  store i32 %add60, i32* %seed62, align 2, !dbg !335
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !336
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !336
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 9, !dbg !336
  %30 = load i16, i16* %iter, align 2, !dbg !337
  %inc = add i16 %30, 1, !dbg !337
  store i16 %inc, i16* %iter, align 2, !dbg !337
  ret void, !dbg !338
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_BW_btbl_bitcount() #0 !dbg !339 {
entry:
  %U = alloca %union.anon, align 2
  call void @llvm.dbg.declare(metadata %union.anon* %U, metadata !340, metadata !DIExpression()), !dbg !349
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !350
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !350
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !350
  %1 = load i32, i32* %seed, align 2, !dbg !350
  %y = bitcast %union.anon* %U to i32*, !dbg !351
  store i32 %1, i32* %y, align 2, !dbg !352
  %ch = bitcast %union.anon* %U to [4 x i8]*, !dbg !353
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ch, i16 0, i16 0, !dbg !354
  %2 = load i8, i8* %arrayidx, align 2, !dbg !354
  %idxprom = zext i8 %2 to i16, !dbg !355
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !355
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !355
  %conv = sext i8 %3 to i16, !dbg !355
  %ch2 = bitcast %union.anon* %U to [4 x i8]*, !dbg !356
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %ch2, i16 0, i16 1, !dbg !357
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !357
  %idxprom4 = zext i8 %4 to i16, !dbg !358
  %arrayidx5 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom4, !dbg !358
  %5 = load i8, i8* %arrayidx5, align 1, !dbg !358
  %conv6 = sext i8 %5 to i16, !dbg !358
  %add = add nsw i16 %conv, %conv6, !dbg !359
  %ch7 = bitcast %union.anon* %U to [4 x i8]*, !dbg !360
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %ch7, i16 0, i16 3, !dbg !361
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !361
  %idxprom9 = zext i8 %6 to i16, !dbg !362
  %arrayidx10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom9, !dbg !362
  %7 = load i8, i8* %arrayidx10, align 1, !dbg !362
  %conv11 = sext i8 %7 to i16, !dbg !362
  %add12 = add nsw i16 %add, %conv11, !dbg !363
  %ch13 = bitcast %union.anon* %U to [4 x i8]*, !dbg !364
  %arrayidx14 = getelementptr inbounds [4 x i8], [4 x i8]* %ch13, i16 0, i16 2, !dbg !365
  %8 = load i8, i8* %arrayidx14, align 2, !dbg !365
  %idxprom15 = zext i8 %8 to i16, !dbg !366
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom15, !dbg !366
  %9 = load i8, i8* %arrayidx16, align 1, !dbg !366
  %conv17 = sext i8 %9 to i16, !dbg !366
  %add18 = add nsw i16 %add12, %conv17, !dbg !367
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !368
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !368
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 4, !dbg !368
  %11 = load i16, i16* %n_4, align 2, !dbg !369
  %add20 = add i16 %11, %add18, !dbg !369
  store i16 %add20, i16* %n_4, align 2, !dbg !369
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !370
  %seed22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !370
  %13 = load i32, i32* %seed22, align 2, !dbg !370
  %add23 = add i32 %13, 13, !dbg !371
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !372
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !372
  store i32 %add23, i32* %seed25, align 2, !dbg !373
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !374
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !374
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !374
  %16 = load i16, i16* %iter, align 2, !dbg !375
  %inc = add i16 %16, 1, !dbg !375
  store i16 %inc, i16* %iter, align 2, !dbg !375
  ret void, !dbg !376
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_AR_btbl_bitcount() #0 !dbg !377 {
entry:
  %Ptr = alloca i8*, align 2
  %Accu = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i8** %Ptr, metadata !378, metadata !DIExpression()), !dbg !379
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !380
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !380
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !380
  %1 = bitcast i32* %seed to i8*, !dbg !381
  store i8* %1, i8** %Ptr, align 2, !dbg !379
  call void @llvm.dbg.declare(metadata i16* %Accu, metadata !382, metadata !DIExpression()), !dbg !383
  %2 = load i8*, i8** %Ptr, align 2, !dbg !384
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1, !dbg !384
  store i8* %incdec.ptr, i8** %Ptr, align 2, !dbg !384
  %3 = load i8, i8* %2, align 1, !dbg !385
  %idxprom = zext i8 %3 to i16, !dbg !386
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !386
  %4 = load i8, i8* %arrayidx, align 1, !dbg !386
  %conv = sext i8 %4 to i16, !dbg !386
  store i16 %conv, i16* %Accu, align 2, !dbg !387
  %5 = load i8*, i8** %Ptr, align 2, !dbg !388
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !388
  store i8* %incdec.ptr1, i8** %Ptr, align 2, !dbg !388
  %6 = load i8, i8* %5, align 1, !dbg !389
  %idxprom2 = zext i8 %6 to i16, !dbg !390
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom2, !dbg !390
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !390
  %conv4 = sext i8 %7 to i16, !dbg !390
  %8 = load i16, i16* %Accu, align 2, !dbg !391
  %add = add nsw i16 %8, %conv4, !dbg !391
  store i16 %add, i16* %Accu, align 2, !dbg !391
  %9 = load i8*, i8** %Ptr, align 2, !dbg !392
  %incdec.ptr5 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !392
  store i8* %incdec.ptr5, i8** %Ptr, align 2, !dbg !392
  %10 = load i8, i8* %9, align 1, !dbg !393
  %idxprom6 = zext i8 %10 to i16, !dbg !394
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom6, !dbg !394
  %11 = load i8, i8* %arrayidx7, align 1, !dbg !394
  %conv8 = sext i8 %11 to i16, !dbg !394
  %12 = load i16, i16* %Accu, align 2, !dbg !395
  %add9 = add nsw i16 %12, %conv8, !dbg !395
  store i16 %add9, i16* %Accu, align 2, !dbg !395
  %13 = load i8*, i8** %Ptr, align 2, !dbg !396
  %14 = load i8, i8* %13, align 1, !dbg !397
  %idxprom10 = zext i8 %14 to i16, !dbg !398
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom10, !dbg !398
  %15 = load i8, i8* %arrayidx11, align 1, !dbg !398
  %conv12 = sext i8 %15 to i16, !dbg !398
  %16 = load i16, i16* %Accu, align 2, !dbg !399
  %add13 = add nsw i16 %16, %conv12, !dbg !399
  store i16 %add13, i16* %Accu, align 2, !dbg !399
  %17 = load i16, i16* %Accu, align 2, !dbg !400
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !401
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !401
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !401
  %19 = load i16, i16* %n_5, align 2, !dbg !402
  %add15 = add i16 %19, %17, !dbg !402
  store i16 %add15, i16* %n_5, align 2, !dbg !402
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !403
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !403
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !403
  %21 = load i32, i32* %seed17, align 2, !dbg !403
  %add18 = add i32 %21, 13, !dbg !404
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !405
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !405
  %seed20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !405
  store i32 %add18, i32* %seed20, align 2, !dbg !406
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !407
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !407
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !407
  %24 = load i16, i16* %iter, align 2, !dbg !408
  %inc = add i16 %24, 1, !dbg !408
  store i16 %inc, i16* %iter, align 2, !dbg !408
  ret void, !dbg !409
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_shifter() #0 !dbg !410 {
entry:
  %i = alloca i16, align 2
  %nn = alloca i16, align 2
  %tmp_seed = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata i16* %nn, metadata !413, metadata !DIExpression()), !dbg !414
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !415, metadata !DIExpression()), !dbg !416
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !417
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !417
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !417
  %1 = load i32, i32* %seed, align 2, !dbg !417
  store i32 %1, i32* %tmp_seed, align 2, !dbg !416
  store i16 0, i16* %nn, align 2, !dbg !418
  store i16 0, i16* %i, align 2, !dbg !420
  br label %for.cond, !dbg !421

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %tmp_seed, align 2, !dbg !422
  %tobool = icmp ne i32 %2, 0, !dbg !422
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !424

land.rhs:                                         ; preds = %for.cond
  %3 = load i16, i16* %i, align 2, !dbg !425
  %cmp = icmp ult i16 %3, 32, !dbg !426
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !427
  br i1 %4, label %for.body, label %for.end, !dbg !428

for.body:                                         ; preds = %land.end
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !429
  %and = and i32 %5, 1, !dbg !430
  %conv = trunc i32 %and to i16, !dbg !431
  %6 = load i16, i16* %nn, align 2, !dbg !432
  %add = add nsw i16 %6, %conv, !dbg !432
  store i16 %add, i16* %nn, align 2, !dbg !432
  br label %for.inc, !dbg !433

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !434
  %inc = add nsw i16 %7, 1, !dbg !434
  store i16 %inc, i16* %i, align 2, !dbg !434
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !435
  %shr = lshr i32 %8, 1, !dbg !435
  store i32 %shr, i32* %tmp_seed, align 2, !dbg !435
  br label %for.cond, !dbg !436, !llvm.loop !437

for.end:                                          ; preds = %land.end
  %9 = load i16, i16* %nn, align 2, !dbg !439
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !440
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !440
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !440
  %11 = load i16, i16* %n_6, align 2, !dbg !441
  %add2 = add i16 %11, %9, !dbg !441
  store i16 %add2, i16* %n_6, align 2, !dbg !441
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !442
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !442
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !442
  %13 = load i32, i32* %seed4, align 2, !dbg !442
  %add5 = add i32 %13, 13, !dbg !443
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !444
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !444
  %seed7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !444
  store i32 %add5, i32* %seed7, align 2, !dbg !445
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !446
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !446
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !446
  %16 = load i16, i16* %iter, align 2, !dbg !447
  %inc9 = add i16 %16, 1, !dbg !447
  store i16 %inc9, i16* %iter, align 2, !dbg !447
  ret void, !dbg !448
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !449 {
entry:
  call void @exit(i16 0) #6, !dbg !450
  unreachable, !dbg !450
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #4

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !451 {
entry:
  ret void, !dbg !452
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !453 {
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
  %__x22 = alloca i16, align 2
  %tmp23 = alloca i16, align 2
  %__x25 = alloca i16, align 2
  %tmp26 = alloca i16, align 2
  %__x35 = alloca i16, align 2
  %tmp36 = alloca i16, align 2
  %__x38 = alloca i16, align 2
  %tmp39 = alloca i16, align 2
  %__x58 = alloca i16, align 2
  %tmp59 = alloca i16, align 2
  %__x61 = alloca i16, align 2
  %tmp62 = alloca i16, align 2
  %__x71 = alloca i16, align 2
  %tmp72 = alloca i16, align 2
  %__x74 = alloca i16, align 2
  %tmp75 = alloca i16, align 2
  %__x98 = alloca i16, align 2
  %tmp99 = alloca i16, align 2
  %__x101 = alloca i16, align 2
  %tmp102 = alloca i16, align 2
  %__x111 = alloca i16, align 2
  %tmp112 = alloca i16, align 2
  %__x114 = alloca i16, align 2
  %tmp115 = alloca i16, align 2
  %__x139 = alloca i16, align 2
  %tmp140 = alloca i16, align 2
  %__x142 = alloca i16, align 2
  %tmp143 = alloca i16, align 2
  %__x152 = alloca i16, align 2
  %tmp153 = alloca i16, align 2
  %__x155 = alloca i16, align 2
  %tmp156 = alloca i16, align 2
  %__x180 = alloca i16, align 2
  %tmp181 = alloca i16, align 2
  %__x183 = alloca i16, align 2
  %tmp184 = alloca i16, align 2
  %__x193 = alloca i16, align 2
  %tmp194 = alloca i16, align 2
  %__x196 = alloca i16, align 2
  %tmp197 = alloca i16, align 2
  %__x221 = alloca i16, align 2
  %tmp222 = alloca i16, align 2
  %__x224 = alloca i16, align 2
  %tmp225 = alloca i16, align 2
  %__x234 = alloca i16, align 2
  %tmp235 = alloca i16, align 2
  %__x237 = alloca i16, align 2
  %tmp238 = alloca i16, align 2
  %__x262 = alloca i16, align 2
  %tmp263 = alloca i16, align 2
  %__x265 = alloca i16, align 2
  %tmp266 = alloca i16, align 2
  %__x275 = alloca i16, align 2
  %tmp276 = alloca i16, align 2
  %__x278 = alloca i16, align 2
  %tmp279 = alloca i16, align 2
  %__x303 = alloca i16, align 2
  %tmp304 = alloca i16, align 2
  %__x306 = alloca i16, align 2
  %tmp307 = alloca i16, align 2
  %__x316 = alloca i16, align 2
  %tmp317 = alloca i16, align 2
  %__x319 = alloca i16, align 2
  %tmp320 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !456
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !457
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !458
  call void @camel_init(), !dbg !459
  call void @task_init(), !dbg !460
  br label %do.body, !dbg !460

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !461
  %cmp = icmp eq i16 %0, 1, !dbg !461
  br i1 %cmp, label %if.then, label %if.else, !dbg !464

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !465
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !465
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !465
  call void @__dump_registers(i16* %arraydecay), !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !467, metadata !DIExpression()), !dbg !469
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !469, !srcloc !470
  store i16 %2, i16* %__x, align 2, !dbg !469
  %3 = load i16, i16* %__x, align 2, !dbg !469
  store i16 %3, i16* %tmp, align 2, !dbg !469
  %4 = load i16, i16* %tmp, align 2, !dbg !469
  %add = add i16 %4, 2, !dbg !465
  %5 = inttoptr i16 %add to i8*, !dbg !465
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !471, metadata !DIExpression()), !dbg !473
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !473, !srcloc !474
  store i16 %6, i16* %__x1, align 2, !dbg !473
  %7 = load i16, i16* %__x1, align 2, !dbg !473
  store i16 %7, i16* %tmp2, align 2, !dbg !473
  %8 = load i16, i16* %tmp2, align 2, !dbg !473
  %add3 = add i16 %8, 2, !dbg !465
  %sub = sub i16 9216, %add3, !dbg !465
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !465
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !465
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !465
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !465
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 44, i16 zeroext %11), !dbg !465
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !465
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !465
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !465
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !465
  br label %if.end, !dbg !465

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !475
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !475
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !475
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !475
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !475
  call void @__dump_registers(i16* %arraydecay6), !dbg !475
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !477, metadata !DIExpression()), !dbg !479
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !479, !srcloc !480
  store i16 %15, i16* %__x7, align 2, !dbg !479
  %16 = load i16, i16* %__x7, align 2, !dbg !479
  store i16 %16, i16* %tmp8, align 2, !dbg !479
  %17 = load i16, i16* %tmp8, align 2, !dbg !479
  %add9 = add i16 %17, 2, !dbg !475
  %18 = inttoptr i16 %add9 to i8*, !dbg !475
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !481, metadata !DIExpression()), !dbg !483
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !483, !srcloc !484
  store i16 %19, i16* %__x10, align 2, !dbg !483
  %20 = load i16, i16* %__x10, align 2, !dbg !483
  store i16 %20, i16* %tmp11, align 2, !dbg !483
  %21 = load i16, i16* %tmp11, align 2, !dbg !483
  %add12 = add i16 %21, 2, !dbg !475
  %sub13 = sub i16 9216, %add12, !dbg !475
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !475
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !475
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !475
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !475
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !475
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 44, i16 zeroext %24), !dbg !475
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !475
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !475
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !475
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !475
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !475
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !475
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !464

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !460
  br label %while.body, !dbg !485

while.body:                                       ; preds = %do.end, %if.end336
  call void @task_select_func(), !dbg !486
  br label %do.body17, !dbg !486

do.body17:                                        ; preds = %while.body
  %27 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !488
  %cmp18 = icmp eq i16 %27, 1, !dbg !488
  br i1 %cmp18, label %if.then19, label %if.else32, !dbg !491

if.then19:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !492
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !492
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %reg_file20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 0, !dbg !492
  %arraydecay21 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file20, i16 0, i16 0, !dbg !492
  call void @__dump_registers(i16* %arraydecay21), !dbg !492
  call void @llvm.dbg.declare(metadata i16* %__x22, metadata !494, metadata !DIExpression()), !dbg !496
  %29 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !496, !srcloc !497
  store i16 %29, i16* %__x22, align 2, !dbg !496
  %30 = load i16, i16* %__x22, align 2, !dbg !496
  store i16 %30, i16* %tmp23, align 2, !dbg !496
  %31 = load i16, i16* %tmp23, align 2, !dbg !496
  %add24 = add i16 %31, 2, !dbg !492
  %32 = inttoptr i16 %add24 to i8*, !dbg !492
  call void @llvm.dbg.declare(metadata i16* %__x25, metadata !498, metadata !DIExpression()), !dbg !500
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !500, !srcloc !501
  store i16 %33, i16* %__x25, align 2, !dbg !500
  %34 = load i16, i16* %__x25, align 2, !dbg !500
  store i16 %34, i16* %tmp26, align 2, !dbg !500
  %35 = load i16, i16* %tmp26, align 2, !dbg !500
  %add27 = add i16 %35, 2, !dbg !492
  %sub28 = sub i16 9216, %add27, !dbg !492
  %call29 = call zeroext i16 @__fast_hw_crc(i8* %32, i16 zeroext %sub28, i16 zeroext -1), !dbg !492
  store i16 %call29, i16* @tmp_stack_crc, align 2, !dbg !492
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %37 = bitcast %struct.camel_buffer_t* %36 to i8*, !dbg !492
  %38 = load i16, i16* @tmp_stack_crc, align 2, !dbg !492
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %37, i16 zeroext 44, i16 zeroext %38), !dbg !492
  store i16 %call30, i16* @tmp_stack_buf_crc, align 2, !dbg !492
  %39 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !492
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !492
  %stack_and_buf_crc31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 2, !dbg !492
  store i16 %39, i16* %stack_and_buf_crc31, align 2, !dbg !492
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !492
  br label %if.end45, !dbg !492

if.else32:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !502
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !502
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !502
  %reg_file33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 0, !dbg !502
  %arraydecay34 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file33, i16 0, i16 0, !dbg !502
  call void @__dump_registers(i16* %arraydecay34), !dbg !502
  call void @llvm.dbg.declare(metadata i16* %__x35, metadata !504, metadata !DIExpression()), !dbg !506
  %42 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !506, !srcloc !507
  store i16 %42, i16* %__x35, align 2, !dbg !506
  %43 = load i16, i16* %__x35, align 2, !dbg !506
  store i16 %43, i16* %tmp36, align 2, !dbg !506
  %44 = load i16, i16* %tmp36, align 2, !dbg !506
  %add37 = add i16 %44, 2, !dbg !502
  %45 = inttoptr i16 %add37 to i8*, !dbg !502
  call void @llvm.dbg.declare(metadata i16* %__x38, metadata !508, metadata !DIExpression()), !dbg !510
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !510, !srcloc !511
  store i16 %46, i16* %__x38, align 2, !dbg !510
  %47 = load i16, i16* %__x38, align 2, !dbg !510
  store i16 %47, i16* %tmp39, align 2, !dbg !510
  %48 = load i16, i16* %tmp39, align 2, !dbg !510
  %add40 = add i16 %48, 2, !dbg !502
  %sub41 = sub i16 9216, %add40, !dbg !502
  %call42 = call zeroext i16 @__fast_hw_crc(i8* %45, i16 zeroext %sub41, i16 zeroext -1), !dbg !502
  store i16 %call42, i16* @tmp_stack_crc, align 2, !dbg !502
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !502
  %50 = bitcast %struct.camel_buffer_t* %49 to i8*, !dbg !502
  %51 = load i16, i16* @tmp_stack_crc, align 2, !dbg !502
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %50, i16 zeroext 44, i16 zeroext %51), !dbg !502
  store i16 %call43, i16* @tmp_stack_buf_crc, align 2, !dbg !502
  %52 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !502
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !502
  %stack_and_buf_crc44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 2, !dbg !502
  store i16 %52, i16* %stack_and_buf_crc44, align 2, !dbg !502
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !502
  br label %if.end45

if.end45:                                         ; preds = %if.else32, %if.then19
  br label %do.end46, !dbg !491

do.end46:                                         ; preds = %if.end45
  call void @task_commit(), !dbg !486
  %54 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !512
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %54, i32 0, i32 1, !dbg !512
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !512
  %55 = load i16, i16* %func, align 2, !dbg !512
  %cmp47 = icmp eq i16 %55, 0, !dbg !514
  br i1 %cmp47, label %if.then48, label %if.else83, !dbg !515

if.then48:                                        ; preds = %do.end46
  br label %while.cond49, !dbg !516

while.cond49:                                     ; preds = %do.end82, %if.then48
  %56 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !518
  %globals50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %56, i32 0, i32 1, !dbg !518
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals50, i32 0, i32 9, !dbg !518
  %57 = load i16, i16* %iter, align 2, !dbg !518
  %cmp51 = icmp ult i16 %57, 100, !dbg !519
  br i1 %cmp51, label %while.body52, label %while.end, !dbg !516

while.body52:                                     ; preds = %while.cond49
  call void @task_bitcount(), !dbg !520
  br label %do.body53, !dbg !520

do.body53:                                        ; preds = %while.body52
  %58 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !522
  %cmp54 = icmp eq i16 %58, 1, !dbg !522
  br i1 %cmp54, label %if.then55, label %if.else68, !dbg !525

if.then55:                                        ; preds = %do.body53
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !526
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !526
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !526
  %reg_file56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 0, !dbg !526
  %arraydecay57 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file56, i16 0, i16 0, !dbg !526
  call void @__dump_registers(i16* %arraydecay57), !dbg !526
  call void @llvm.dbg.declare(metadata i16* %__x58, metadata !528, metadata !DIExpression()), !dbg !530
  %60 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !530, !srcloc !531
  store i16 %60, i16* %__x58, align 2, !dbg !530
  %61 = load i16, i16* %__x58, align 2, !dbg !530
  store i16 %61, i16* %tmp59, align 2, !dbg !530
  %62 = load i16, i16* %tmp59, align 2, !dbg !530
  %add60 = add i16 %62, 2, !dbg !526
  %63 = inttoptr i16 %add60 to i8*, !dbg !526
  call void @llvm.dbg.declare(metadata i16* %__x61, metadata !532, metadata !DIExpression()), !dbg !534
  %64 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !534, !srcloc !535
  store i16 %64, i16* %__x61, align 2, !dbg !534
  %65 = load i16, i16* %__x61, align 2, !dbg !534
  store i16 %65, i16* %tmp62, align 2, !dbg !534
  %66 = load i16, i16* %tmp62, align 2, !dbg !534
  %add63 = add i16 %66, 2, !dbg !526
  %sub64 = sub i16 9216, %add63, !dbg !526
  %call65 = call zeroext i16 @__fast_hw_crc(i8* %63, i16 zeroext %sub64, i16 zeroext -1), !dbg !526
  store i16 %call65, i16* @tmp_stack_crc, align 2, !dbg !526
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !526
  %68 = bitcast %struct.camel_buffer_t* %67 to i8*, !dbg !526
  %69 = load i16, i16* @tmp_stack_crc, align 2, !dbg !526
  %call66 = call zeroext i16 @__fast_hw_crc(i8* %68, i16 zeroext 44, i16 zeroext %69), !dbg !526
  store i16 %call66, i16* @tmp_stack_buf_crc, align 2, !dbg !526
  %70 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !526
  %71 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !526
  %stack_and_buf_crc67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %71, i32 0, i32 2, !dbg !526
  store i16 %70, i16* %stack_and_buf_crc67, align 2, !dbg !526
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !526
  br label %if.end81, !dbg !526

if.else68:                                        ; preds = %do.body53
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !536
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !536
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !536
  %reg_file69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i32 0, i32 0, !dbg !536
  %arraydecay70 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file69, i16 0, i16 0, !dbg !536
  call void @__dump_registers(i16* %arraydecay70), !dbg !536
  call void @llvm.dbg.declare(metadata i16* %__x71, metadata !538, metadata !DIExpression()), !dbg !540
  %73 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !540, !srcloc !541
  store i16 %73, i16* %__x71, align 2, !dbg !540
  %74 = load i16, i16* %__x71, align 2, !dbg !540
  store i16 %74, i16* %tmp72, align 2, !dbg !540
  %75 = load i16, i16* %tmp72, align 2, !dbg !540
  %add73 = add i16 %75, 2, !dbg !536
  %76 = inttoptr i16 %add73 to i8*, !dbg !536
  call void @llvm.dbg.declare(metadata i16* %__x74, metadata !542, metadata !DIExpression()), !dbg !544
  %77 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !544, !srcloc !545
  store i16 %77, i16* %__x74, align 2, !dbg !544
  %78 = load i16, i16* %__x74, align 2, !dbg !544
  store i16 %78, i16* %tmp75, align 2, !dbg !544
  %79 = load i16, i16* %tmp75, align 2, !dbg !544
  %add76 = add i16 %79, 2, !dbg !536
  %sub77 = sub i16 9216, %add76, !dbg !536
  %call78 = call zeroext i16 @__fast_hw_crc(i8* %76, i16 zeroext %sub77, i16 zeroext -1), !dbg !536
  store i16 %call78, i16* @tmp_stack_crc, align 2, !dbg !536
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !536
  %81 = bitcast %struct.camel_buffer_t* %80 to i8*, !dbg !536
  %82 = load i16, i16* @tmp_stack_crc, align 2, !dbg !536
  %call79 = call zeroext i16 @__fast_hw_crc(i8* %81, i16 zeroext 44, i16 zeroext %82), !dbg !536
  store i16 %call79, i16* @tmp_stack_buf_crc, align 2, !dbg !536
  %83 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !536
  %84 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !536
  %stack_and_buf_crc80 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %84, i32 0, i32 2, !dbg !536
  store i16 %83, i16* %stack_and_buf_crc80, align 2, !dbg !536
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !536
  br label %if.end81

if.end81:                                         ; preds = %if.else68, %if.then55
  br label %do.end82, !dbg !525

do.end82:                                         ; preds = %if.end81
  call void @task_commit(), !dbg !520
  br label %while.cond49, !dbg !516, !llvm.loop !546

while.end:                                        ; preds = %while.cond49
  br label %if.end336, !dbg !548

if.else83:                                        ; preds = %do.end46
  %85 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !549
  %globals84 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %85, i32 0, i32 1, !dbg !549
  %func85 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals84, i32 0, i32 7, !dbg !549
  %86 = load i16, i16* %func85, align 2, !dbg !549
  %cmp86 = icmp eq i16 %86, 1, !dbg !551
  br i1 %cmp86, label %if.then87, label %if.else124, !dbg !552

if.then87:                                        ; preds = %if.else83
  br label %while.cond88, !dbg !553

while.cond88:                                     ; preds = %do.end122, %if.then87
  %87 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !555
  %globals89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %87, i32 0, i32 1, !dbg !555
  %iter90 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals89, i32 0, i32 9, !dbg !555
  %88 = load i16, i16* %iter90, align 2, !dbg !555
  %cmp91 = icmp ult i16 %88, 100, !dbg !556
  br i1 %cmp91, label %while.body92, label %while.end123, !dbg !553

while.body92:                                     ; preds = %while.cond88
  call void @task_bit_count(), !dbg !557
  br label %do.body93, !dbg !557

do.body93:                                        ; preds = %while.body92
  %89 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !559
  %cmp94 = icmp eq i16 %89, 1, !dbg !559
  br i1 %cmp94, label %if.then95, label %if.else108, !dbg !562

if.then95:                                        ; preds = %do.body93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !563
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !563
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %reg_file96 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %90, i32 0, i32 0, !dbg !563
  %arraydecay97 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file96, i16 0, i16 0, !dbg !563
  call void @__dump_registers(i16* %arraydecay97), !dbg !563
  call void @llvm.dbg.declare(metadata i16* %__x98, metadata !565, metadata !DIExpression()), !dbg !567
  %91 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !567, !srcloc !568
  store i16 %91, i16* %__x98, align 2, !dbg !567
  %92 = load i16, i16* %__x98, align 2, !dbg !567
  store i16 %92, i16* %tmp99, align 2, !dbg !567
  %93 = load i16, i16* %tmp99, align 2, !dbg !567
  %add100 = add i16 %93, 2, !dbg !563
  %94 = inttoptr i16 %add100 to i8*, !dbg !563
  call void @llvm.dbg.declare(metadata i16* %__x101, metadata !569, metadata !DIExpression()), !dbg !571
  %95 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !571, !srcloc !572
  store i16 %95, i16* %__x101, align 2, !dbg !571
  %96 = load i16, i16* %__x101, align 2, !dbg !571
  store i16 %96, i16* %tmp102, align 2, !dbg !571
  %97 = load i16, i16* %tmp102, align 2, !dbg !571
  %add103 = add i16 %97, 2, !dbg !563
  %sub104 = sub i16 9216, %add103, !dbg !563
  %call105 = call zeroext i16 @__fast_hw_crc(i8* %94, i16 zeroext %sub104, i16 zeroext -1), !dbg !563
  store i16 %call105, i16* @tmp_stack_crc, align 2, !dbg !563
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %99 = bitcast %struct.camel_buffer_t* %98 to i8*, !dbg !563
  %100 = load i16, i16* @tmp_stack_crc, align 2, !dbg !563
  %call106 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext 44, i16 zeroext %100), !dbg !563
  store i16 %call106, i16* @tmp_stack_buf_crc, align 2, !dbg !563
  %101 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !563
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !563
  %stack_and_buf_crc107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i32 0, i32 2, !dbg !563
  store i16 %101, i16* %stack_and_buf_crc107, align 2, !dbg !563
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !563
  br label %if.end121, !dbg !563

if.else108:                                       ; preds = %do.body93
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !573
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !573
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !573
  %reg_file109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %103, i32 0, i32 0, !dbg !573
  %arraydecay110 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file109, i16 0, i16 0, !dbg !573
  call void @__dump_registers(i16* %arraydecay110), !dbg !573
  call void @llvm.dbg.declare(metadata i16* %__x111, metadata !575, metadata !DIExpression()), !dbg !577
  %104 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !577, !srcloc !578
  store i16 %104, i16* %__x111, align 2, !dbg !577
  %105 = load i16, i16* %__x111, align 2, !dbg !577
  store i16 %105, i16* %tmp112, align 2, !dbg !577
  %106 = load i16, i16* %tmp112, align 2, !dbg !577
  %add113 = add i16 %106, 2, !dbg !573
  %107 = inttoptr i16 %add113 to i8*, !dbg !573
  call void @llvm.dbg.declare(metadata i16* %__x114, metadata !579, metadata !DIExpression()), !dbg !581
  %108 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !581, !srcloc !582
  store i16 %108, i16* %__x114, align 2, !dbg !581
  %109 = load i16, i16* %__x114, align 2, !dbg !581
  store i16 %109, i16* %tmp115, align 2, !dbg !581
  %110 = load i16, i16* %tmp115, align 2, !dbg !581
  %add116 = add i16 %110, 2, !dbg !573
  %sub117 = sub i16 9216, %add116, !dbg !573
  %call118 = call zeroext i16 @__fast_hw_crc(i8* %107, i16 zeroext %sub117, i16 zeroext -1), !dbg !573
  store i16 %call118, i16* @tmp_stack_crc, align 2, !dbg !573
  %111 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !573
  %112 = bitcast %struct.camel_buffer_t* %111 to i8*, !dbg !573
  %113 = load i16, i16* @tmp_stack_crc, align 2, !dbg !573
  %call119 = call zeroext i16 @__fast_hw_crc(i8* %112, i16 zeroext 44, i16 zeroext %113), !dbg !573
  store i16 %call119, i16* @tmp_stack_buf_crc, align 2, !dbg !573
  %114 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !573
  %115 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !573
  %stack_and_buf_crc120 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %115, i32 0, i32 2, !dbg !573
  store i16 %114, i16* %stack_and_buf_crc120, align 2, !dbg !573
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !573
  br label %if.end121

if.end121:                                        ; preds = %if.else108, %if.then95
  br label %do.end122, !dbg !562

do.end122:                                        ; preds = %if.end121
  call void @task_commit(), !dbg !557
  br label %while.cond88, !dbg !553, !llvm.loop !583

while.end123:                                     ; preds = %while.cond88
  br label %if.end335, !dbg !585

if.else124:                                       ; preds = %if.else83
  %116 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !586
  %globals125 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %116, i32 0, i32 1, !dbg !586
  %func126 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals125, i32 0, i32 7, !dbg !586
  %117 = load i16, i16* %func126, align 2, !dbg !586
  %cmp127 = icmp eq i16 %117, 2, !dbg !588
  br i1 %cmp127, label %if.then128, label %if.else165, !dbg !589

if.then128:                                       ; preds = %if.else124
  br label %while.cond129, !dbg !590

while.cond129:                                    ; preds = %do.end163, %if.then128
  %118 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !592
  %globals130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %118, i32 0, i32 1, !dbg !592
  %iter131 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals130, i32 0, i32 9, !dbg !592
  %119 = load i16, i16* %iter131, align 2, !dbg !592
  %cmp132 = icmp ult i16 %119, 100, !dbg !593
  br i1 %cmp132, label %while.body133, label %while.end164, !dbg !590

while.body133:                                    ; preds = %while.cond129
  call void @task_ntbl_bitcnt(), !dbg !594
  br label %do.body134, !dbg !594

do.body134:                                       ; preds = %while.body133
  %120 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !596
  %cmp135 = icmp eq i16 %120, 1, !dbg !596
  br i1 %cmp135, label %if.then136, label %if.else149, !dbg !599

if.then136:                                       ; preds = %do.body134
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !600
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !600
  %121 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %reg_file137 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %121, i32 0, i32 0, !dbg !600
  %arraydecay138 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file137, i16 0, i16 0, !dbg !600
  call void @__dump_registers(i16* %arraydecay138), !dbg !600
  call void @llvm.dbg.declare(metadata i16* %__x139, metadata !602, metadata !DIExpression()), !dbg !604
  %122 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !604, !srcloc !605
  store i16 %122, i16* %__x139, align 2, !dbg !604
  %123 = load i16, i16* %__x139, align 2, !dbg !604
  store i16 %123, i16* %tmp140, align 2, !dbg !604
  %124 = load i16, i16* %tmp140, align 2, !dbg !604
  %add141 = add i16 %124, 2, !dbg !600
  %125 = inttoptr i16 %add141 to i8*, !dbg !600
  call void @llvm.dbg.declare(metadata i16* %__x142, metadata !606, metadata !DIExpression()), !dbg !608
  %126 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !608, !srcloc !609
  store i16 %126, i16* %__x142, align 2, !dbg !608
  %127 = load i16, i16* %__x142, align 2, !dbg !608
  store i16 %127, i16* %tmp143, align 2, !dbg !608
  %128 = load i16, i16* %tmp143, align 2, !dbg !608
  %add144 = add i16 %128, 2, !dbg !600
  %sub145 = sub i16 9216, %add144, !dbg !600
  %call146 = call zeroext i16 @__fast_hw_crc(i8* %125, i16 zeroext %sub145, i16 zeroext -1), !dbg !600
  store i16 %call146, i16* @tmp_stack_crc, align 2, !dbg !600
  %129 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %130 = bitcast %struct.camel_buffer_t* %129 to i8*, !dbg !600
  %131 = load i16, i16* @tmp_stack_crc, align 2, !dbg !600
  %call147 = call zeroext i16 @__fast_hw_crc(i8* %130, i16 zeroext 44, i16 zeroext %131), !dbg !600
  store i16 %call147, i16* @tmp_stack_buf_crc, align 2, !dbg !600
  %132 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !600
  %133 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !600
  %stack_and_buf_crc148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %133, i32 0, i32 2, !dbg !600
  store i16 %132, i16* %stack_and_buf_crc148, align 2, !dbg !600
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !600
  br label %if.end162, !dbg !600

if.else149:                                       ; preds = %do.body134
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !610
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !610
  %134 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %reg_file150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %134, i32 0, i32 0, !dbg !610
  %arraydecay151 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file150, i16 0, i16 0, !dbg !610
  call void @__dump_registers(i16* %arraydecay151), !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x152, metadata !612, metadata !DIExpression()), !dbg !614
  %135 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !614, !srcloc !615
  store i16 %135, i16* %__x152, align 2, !dbg !614
  %136 = load i16, i16* %__x152, align 2, !dbg !614
  store i16 %136, i16* %tmp153, align 2, !dbg !614
  %137 = load i16, i16* %tmp153, align 2, !dbg !614
  %add154 = add i16 %137, 2, !dbg !610
  %138 = inttoptr i16 %add154 to i8*, !dbg !610
  call void @llvm.dbg.declare(metadata i16* %__x155, metadata !616, metadata !DIExpression()), !dbg !618
  %139 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !618, !srcloc !619
  store i16 %139, i16* %__x155, align 2, !dbg !618
  %140 = load i16, i16* %__x155, align 2, !dbg !618
  store i16 %140, i16* %tmp156, align 2, !dbg !618
  %141 = load i16, i16* %tmp156, align 2, !dbg !618
  %add157 = add i16 %141, 2, !dbg !610
  %sub158 = sub i16 9216, %add157, !dbg !610
  %call159 = call zeroext i16 @__fast_hw_crc(i8* %138, i16 zeroext %sub158, i16 zeroext -1), !dbg !610
  store i16 %call159, i16* @tmp_stack_crc, align 2, !dbg !610
  %142 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %143 = bitcast %struct.camel_buffer_t* %142 to i8*, !dbg !610
  %144 = load i16, i16* @tmp_stack_crc, align 2, !dbg !610
  %call160 = call zeroext i16 @__fast_hw_crc(i8* %143, i16 zeroext 44, i16 zeroext %144), !dbg !610
  store i16 %call160, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %145 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !610
  %146 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !610
  %stack_and_buf_crc161 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %146, i32 0, i32 2, !dbg !610
  store i16 %145, i16* %stack_and_buf_crc161, align 2, !dbg !610
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !610
  br label %if.end162

if.end162:                                        ; preds = %if.else149, %if.then136
  br label %do.end163, !dbg !599

do.end163:                                        ; preds = %if.end162
  call void @task_commit(), !dbg !594
  br label %while.cond129, !dbg !590, !llvm.loop !620

while.end164:                                     ; preds = %while.cond129
  br label %if.end334, !dbg !622

if.else165:                                       ; preds = %if.else124
  %147 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !623
  %globals166 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %147, i32 0, i32 1, !dbg !623
  %func167 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals166, i32 0, i32 7, !dbg !623
  %148 = load i16, i16* %func167, align 2, !dbg !623
  %cmp168 = icmp eq i16 %148, 3, !dbg !625
  br i1 %cmp168, label %if.then169, label %if.else206, !dbg !626

if.then169:                                       ; preds = %if.else165
  br label %while.cond170, !dbg !627

while.cond170:                                    ; preds = %do.end204, %if.then169
  %149 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !629
  %globals171 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %149, i32 0, i32 1, !dbg !629
  %iter172 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals171, i32 0, i32 9, !dbg !629
  %150 = load i16, i16* %iter172, align 2, !dbg !629
  %cmp173 = icmp ult i16 %150, 100, !dbg !630
  br i1 %cmp173, label %while.body174, label %while.end205, !dbg !627

while.body174:                                    ; preds = %while.cond170
  call void @task_ntbl_bitcount(), !dbg !631
  br label %do.body175, !dbg !631

do.body175:                                       ; preds = %while.body174
  %151 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !633
  %cmp176 = icmp eq i16 %151, 1, !dbg !633
  br i1 %cmp176, label %if.then177, label %if.else190, !dbg !636

if.then177:                                       ; preds = %do.body175
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !637
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !637
  %152 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %reg_file178 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %152, i32 0, i32 0, !dbg !637
  %arraydecay179 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file178, i16 0, i16 0, !dbg !637
  call void @__dump_registers(i16* %arraydecay179), !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x180, metadata !639, metadata !DIExpression()), !dbg !641
  %153 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !641, !srcloc !642
  store i16 %153, i16* %__x180, align 2, !dbg !641
  %154 = load i16, i16* %__x180, align 2, !dbg !641
  store i16 %154, i16* %tmp181, align 2, !dbg !641
  %155 = load i16, i16* %tmp181, align 2, !dbg !641
  %add182 = add i16 %155, 2, !dbg !637
  %156 = inttoptr i16 %add182 to i8*, !dbg !637
  call void @llvm.dbg.declare(metadata i16* %__x183, metadata !643, metadata !DIExpression()), !dbg !645
  %157 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !645, !srcloc !646
  store i16 %157, i16* %__x183, align 2, !dbg !645
  %158 = load i16, i16* %__x183, align 2, !dbg !645
  store i16 %158, i16* %tmp184, align 2, !dbg !645
  %159 = load i16, i16* %tmp184, align 2, !dbg !645
  %add185 = add i16 %159, 2, !dbg !637
  %sub186 = sub i16 9216, %add185, !dbg !637
  %call187 = call zeroext i16 @__fast_hw_crc(i8* %156, i16 zeroext %sub186, i16 zeroext -1), !dbg !637
  store i16 %call187, i16* @tmp_stack_crc, align 2, !dbg !637
  %160 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %161 = bitcast %struct.camel_buffer_t* %160 to i8*, !dbg !637
  %162 = load i16, i16* @tmp_stack_crc, align 2, !dbg !637
  %call188 = call zeroext i16 @__fast_hw_crc(i8* %161, i16 zeroext 44, i16 zeroext %162), !dbg !637
  store i16 %call188, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %163 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !637
  %164 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !637
  %stack_and_buf_crc189 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %164, i32 0, i32 2, !dbg !637
  store i16 %163, i16* %stack_and_buf_crc189, align 2, !dbg !637
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !637
  br label %if.end203, !dbg !637

if.else190:                                       ; preds = %do.body175
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !647
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !647
  %165 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %reg_file191 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %165, i32 0, i32 0, !dbg !647
  %arraydecay192 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file191, i16 0, i16 0, !dbg !647
  call void @__dump_registers(i16* %arraydecay192), !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x193, metadata !649, metadata !DIExpression()), !dbg !651
  %166 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !651, !srcloc !652
  store i16 %166, i16* %__x193, align 2, !dbg !651
  %167 = load i16, i16* %__x193, align 2, !dbg !651
  store i16 %167, i16* %tmp194, align 2, !dbg !651
  %168 = load i16, i16* %tmp194, align 2, !dbg !651
  %add195 = add i16 %168, 2, !dbg !647
  %169 = inttoptr i16 %add195 to i8*, !dbg !647
  call void @llvm.dbg.declare(metadata i16* %__x196, metadata !653, metadata !DIExpression()), !dbg !655
  %170 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !655, !srcloc !656
  store i16 %170, i16* %__x196, align 2, !dbg !655
  %171 = load i16, i16* %__x196, align 2, !dbg !655
  store i16 %171, i16* %tmp197, align 2, !dbg !655
  %172 = load i16, i16* %tmp197, align 2, !dbg !655
  %add198 = add i16 %172, 2, !dbg !647
  %sub199 = sub i16 9216, %add198, !dbg !647
  %call200 = call zeroext i16 @__fast_hw_crc(i8* %169, i16 zeroext %sub199, i16 zeroext -1), !dbg !647
  store i16 %call200, i16* @tmp_stack_crc, align 2, !dbg !647
  %173 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %174 = bitcast %struct.camel_buffer_t* %173 to i8*, !dbg !647
  %175 = load i16, i16* @tmp_stack_crc, align 2, !dbg !647
  %call201 = call zeroext i16 @__fast_hw_crc(i8* %174, i16 zeroext 44, i16 zeroext %175), !dbg !647
  store i16 %call201, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %176 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !647
  %177 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !647
  %stack_and_buf_crc202 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %177, i32 0, i32 2, !dbg !647
  store i16 %176, i16* %stack_and_buf_crc202, align 2, !dbg !647
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !647
  br label %if.end203

if.end203:                                        ; preds = %if.else190, %if.then177
  br label %do.end204, !dbg !636

do.end204:                                        ; preds = %if.end203
  call void @task_commit(), !dbg !631
  br label %while.cond170, !dbg !627, !llvm.loop !657

while.end205:                                     ; preds = %while.cond170
  br label %if.end333, !dbg !659

if.else206:                                       ; preds = %if.else165
  %178 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !660
  %globals207 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %178, i32 0, i32 1, !dbg !660
  %func208 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals207, i32 0, i32 7, !dbg !660
  %179 = load i16, i16* %func208, align 2, !dbg !660
  %cmp209 = icmp eq i16 %179, 4, !dbg !662
  br i1 %cmp209, label %if.then210, label %if.else247, !dbg !663

if.then210:                                       ; preds = %if.else206
  br label %while.cond211, !dbg !664

while.cond211:                                    ; preds = %do.end245, %if.then210
  %180 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !666
  %globals212 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %180, i32 0, i32 1, !dbg !666
  %iter213 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals212, i32 0, i32 9, !dbg !666
  %181 = load i16, i16* %iter213, align 2, !dbg !666
  %cmp214 = icmp ult i16 %181, 100, !dbg !667
  br i1 %cmp214, label %while.body215, label %while.end246, !dbg !664

while.body215:                                    ; preds = %while.cond211
  call void @task_BW_btbl_bitcount(), !dbg !668
  br label %do.body216, !dbg !668

do.body216:                                       ; preds = %while.body215
  %182 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !670
  %cmp217 = icmp eq i16 %182, 1, !dbg !670
  br i1 %cmp217, label %if.then218, label %if.else231, !dbg !673

if.then218:                                       ; preds = %do.body216
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !674
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !674
  %183 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %reg_file219 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %183, i32 0, i32 0, !dbg !674
  %arraydecay220 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file219, i16 0, i16 0, !dbg !674
  call void @__dump_registers(i16* %arraydecay220), !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x221, metadata !676, metadata !DIExpression()), !dbg !678
  %184 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !678, !srcloc !679
  store i16 %184, i16* %__x221, align 2, !dbg !678
  %185 = load i16, i16* %__x221, align 2, !dbg !678
  store i16 %185, i16* %tmp222, align 2, !dbg !678
  %186 = load i16, i16* %tmp222, align 2, !dbg !678
  %add223 = add i16 %186, 2, !dbg !674
  %187 = inttoptr i16 %add223 to i8*, !dbg !674
  call void @llvm.dbg.declare(metadata i16* %__x224, metadata !680, metadata !DIExpression()), !dbg !682
  %188 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !682, !srcloc !683
  store i16 %188, i16* %__x224, align 2, !dbg !682
  %189 = load i16, i16* %__x224, align 2, !dbg !682
  store i16 %189, i16* %tmp225, align 2, !dbg !682
  %190 = load i16, i16* %tmp225, align 2, !dbg !682
  %add226 = add i16 %190, 2, !dbg !674
  %sub227 = sub i16 9216, %add226, !dbg !674
  %call228 = call zeroext i16 @__fast_hw_crc(i8* %187, i16 zeroext %sub227, i16 zeroext -1), !dbg !674
  store i16 %call228, i16* @tmp_stack_crc, align 2, !dbg !674
  %191 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %192 = bitcast %struct.camel_buffer_t* %191 to i8*, !dbg !674
  %193 = load i16, i16* @tmp_stack_crc, align 2, !dbg !674
  %call229 = call zeroext i16 @__fast_hw_crc(i8* %192, i16 zeroext 44, i16 zeroext %193), !dbg !674
  store i16 %call229, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %194 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !674
  %195 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !674
  %stack_and_buf_crc230 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %195, i32 0, i32 2, !dbg !674
  store i16 %194, i16* %stack_and_buf_crc230, align 2, !dbg !674
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !674
  br label %if.end244, !dbg !674

if.else231:                                       ; preds = %do.body216
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !684
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !684
  %196 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !684
  %reg_file232 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %196, i32 0, i32 0, !dbg !684
  %arraydecay233 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file232, i16 0, i16 0, !dbg !684
  call void @__dump_registers(i16* %arraydecay233), !dbg !684
  call void @llvm.dbg.declare(metadata i16* %__x234, metadata !686, metadata !DIExpression()), !dbg !688
  %197 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !688, !srcloc !689
  store i16 %197, i16* %__x234, align 2, !dbg !688
  %198 = load i16, i16* %__x234, align 2, !dbg !688
  store i16 %198, i16* %tmp235, align 2, !dbg !688
  %199 = load i16, i16* %tmp235, align 2, !dbg !688
  %add236 = add i16 %199, 2, !dbg !684
  %200 = inttoptr i16 %add236 to i8*, !dbg !684
  call void @llvm.dbg.declare(metadata i16* %__x237, metadata !690, metadata !DIExpression()), !dbg !692
  %201 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !692, !srcloc !693
  store i16 %201, i16* %__x237, align 2, !dbg !692
  %202 = load i16, i16* %__x237, align 2, !dbg !692
  store i16 %202, i16* %tmp238, align 2, !dbg !692
  %203 = load i16, i16* %tmp238, align 2, !dbg !692
  %add239 = add i16 %203, 2, !dbg !684
  %sub240 = sub i16 9216, %add239, !dbg !684
  %call241 = call zeroext i16 @__fast_hw_crc(i8* %200, i16 zeroext %sub240, i16 zeroext -1), !dbg !684
  store i16 %call241, i16* @tmp_stack_crc, align 2, !dbg !684
  %204 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !684
  %205 = bitcast %struct.camel_buffer_t* %204 to i8*, !dbg !684
  %206 = load i16, i16* @tmp_stack_crc, align 2, !dbg !684
  %call242 = call zeroext i16 @__fast_hw_crc(i8* %205, i16 zeroext 44, i16 zeroext %206), !dbg !684
  store i16 %call242, i16* @tmp_stack_buf_crc, align 2, !dbg !684
  %207 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !684
  %208 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !684
  %stack_and_buf_crc243 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %208, i32 0, i32 2, !dbg !684
  store i16 %207, i16* %stack_and_buf_crc243, align 2, !dbg !684
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !684
  br label %if.end244

if.end244:                                        ; preds = %if.else231, %if.then218
  br label %do.end245, !dbg !673

do.end245:                                        ; preds = %if.end244
  call void @task_commit(), !dbg !668
  br label %while.cond211, !dbg !664, !llvm.loop !694

while.end246:                                     ; preds = %while.cond211
  br label %if.end332, !dbg !696

if.else247:                                       ; preds = %if.else206
  %209 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !697
  %globals248 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %209, i32 0, i32 1, !dbg !697
  %func249 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals248, i32 0, i32 7, !dbg !697
  %210 = load i16, i16* %func249, align 2, !dbg !697
  %cmp250 = icmp eq i16 %210, 5, !dbg !699
  br i1 %cmp250, label %if.then251, label %if.else288, !dbg !700

if.then251:                                       ; preds = %if.else247
  br label %while.cond252, !dbg !701

while.cond252:                                    ; preds = %do.end286, %if.then251
  %211 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !703
  %globals253 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %211, i32 0, i32 1, !dbg !703
  %iter254 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals253, i32 0, i32 9, !dbg !703
  %212 = load i16, i16* %iter254, align 2, !dbg !703
  %cmp255 = icmp ult i16 %212, 100, !dbg !704
  br i1 %cmp255, label %while.body256, label %while.end287, !dbg !701

while.body256:                                    ; preds = %while.cond252
  call void @task_AR_btbl_bitcount(), !dbg !705
  br label %do.body257, !dbg !705

do.body257:                                       ; preds = %while.body256
  %213 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !707
  %cmp258 = icmp eq i16 %213, 1, !dbg !707
  br i1 %cmp258, label %if.then259, label %if.else272, !dbg !710

if.then259:                                       ; preds = %do.body257
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !711
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !711
  %214 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !711
  %reg_file260 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %214, i32 0, i32 0, !dbg !711
  %arraydecay261 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file260, i16 0, i16 0, !dbg !711
  call void @__dump_registers(i16* %arraydecay261), !dbg !711
  call void @llvm.dbg.declare(metadata i16* %__x262, metadata !713, metadata !DIExpression()), !dbg !715
  %215 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !715, !srcloc !716
  store i16 %215, i16* %__x262, align 2, !dbg !715
  %216 = load i16, i16* %__x262, align 2, !dbg !715
  store i16 %216, i16* %tmp263, align 2, !dbg !715
  %217 = load i16, i16* %tmp263, align 2, !dbg !715
  %add264 = add i16 %217, 2, !dbg !711
  %218 = inttoptr i16 %add264 to i8*, !dbg !711
  call void @llvm.dbg.declare(metadata i16* %__x265, metadata !717, metadata !DIExpression()), !dbg !719
  %219 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !719, !srcloc !720
  store i16 %219, i16* %__x265, align 2, !dbg !719
  %220 = load i16, i16* %__x265, align 2, !dbg !719
  store i16 %220, i16* %tmp266, align 2, !dbg !719
  %221 = load i16, i16* %tmp266, align 2, !dbg !719
  %add267 = add i16 %221, 2, !dbg !711
  %sub268 = sub i16 9216, %add267, !dbg !711
  %call269 = call zeroext i16 @__fast_hw_crc(i8* %218, i16 zeroext %sub268, i16 zeroext -1), !dbg !711
  store i16 %call269, i16* @tmp_stack_crc, align 2, !dbg !711
  %222 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !711
  %223 = bitcast %struct.camel_buffer_t* %222 to i8*, !dbg !711
  %224 = load i16, i16* @tmp_stack_crc, align 2, !dbg !711
  %call270 = call zeroext i16 @__fast_hw_crc(i8* %223, i16 zeroext 44, i16 zeroext %224), !dbg !711
  store i16 %call270, i16* @tmp_stack_buf_crc, align 2, !dbg !711
  %225 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !711
  %226 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !711
  %stack_and_buf_crc271 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %226, i32 0, i32 2, !dbg !711
  store i16 %225, i16* %stack_and_buf_crc271, align 2, !dbg !711
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !711
  br label %if.end285, !dbg !711

if.else272:                                       ; preds = %do.body257
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !721
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !721
  %227 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !721
  %reg_file273 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %227, i32 0, i32 0, !dbg !721
  %arraydecay274 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file273, i16 0, i16 0, !dbg !721
  call void @__dump_registers(i16* %arraydecay274), !dbg !721
  call void @llvm.dbg.declare(metadata i16* %__x275, metadata !723, metadata !DIExpression()), !dbg !725
  %228 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !725, !srcloc !726
  store i16 %228, i16* %__x275, align 2, !dbg !725
  %229 = load i16, i16* %__x275, align 2, !dbg !725
  store i16 %229, i16* %tmp276, align 2, !dbg !725
  %230 = load i16, i16* %tmp276, align 2, !dbg !725
  %add277 = add i16 %230, 2, !dbg !721
  %231 = inttoptr i16 %add277 to i8*, !dbg !721
  call void @llvm.dbg.declare(metadata i16* %__x278, metadata !727, metadata !DIExpression()), !dbg !729
  %232 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !729, !srcloc !730
  store i16 %232, i16* %__x278, align 2, !dbg !729
  %233 = load i16, i16* %__x278, align 2, !dbg !729
  store i16 %233, i16* %tmp279, align 2, !dbg !729
  %234 = load i16, i16* %tmp279, align 2, !dbg !729
  %add280 = add i16 %234, 2, !dbg !721
  %sub281 = sub i16 9216, %add280, !dbg !721
  %call282 = call zeroext i16 @__fast_hw_crc(i8* %231, i16 zeroext %sub281, i16 zeroext -1), !dbg !721
  store i16 %call282, i16* @tmp_stack_crc, align 2, !dbg !721
  %235 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !721
  %236 = bitcast %struct.camel_buffer_t* %235 to i8*, !dbg !721
  %237 = load i16, i16* @tmp_stack_crc, align 2, !dbg !721
  %call283 = call zeroext i16 @__fast_hw_crc(i8* %236, i16 zeroext 44, i16 zeroext %237), !dbg !721
  store i16 %call283, i16* @tmp_stack_buf_crc, align 2, !dbg !721
  %238 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !721
  %239 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !721
  %stack_and_buf_crc284 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %239, i32 0, i32 2, !dbg !721
  store i16 %238, i16* %stack_and_buf_crc284, align 2, !dbg !721
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !721
  br label %if.end285

if.end285:                                        ; preds = %if.else272, %if.then259
  br label %do.end286, !dbg !710

do.end286:                                        ; preds = %if.end285
  call void @task_commit(), !dbg !705
  br label %while.cond252, !dbg !701, !llvm.loop !731

while.end287:                                     ; preds = %while.cond252
  br label %if.end331, !dbg !733

if.else288:                                       ; preds = %if.else247
  %240 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !734
  %globals289 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %240, i32 0, i32 1, !dbg !734
  %func290 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals289, i32 0, i32 7, !dbg !734
  %241 = load i16, i16* %func290, align 2, !dbg !734
  %cmp291 = icmp eq i16 %241, 6, !dbg !736
  br i1 %cmp291, label %if.then292, label %if.else329, !dbg !737

if.then292:                                       ; preds = %if.else288
  br label %while.cond293, !dbg !738

while.cond293:                                    ; preds = %do.end327, %if.then292
  %242 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !740
  %globals294 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %242, i32 0, i32 1, !dbg !740
  %iter295 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals294, i32 0, i32 9, !dbg !740
  %243 = load i16, i16* %iter295, align 2, !dbg !740
  %cmp296 = icmp ult i16 %243, 100, !dbg !741
  br i1 %cmp296, label %while.body297, label %while.end328, !dbg !738

while.body297:                                    ; preds = %while.cond293
  call void @task_bit_shifter(), !dbg !742
  br label %do.body298, !dbg !742

do.body298:                                       ; preds = %while.body297
  %244 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !744
  %cmp299 = icmp eq i16 %244, 1, !dbg !744
  br i1 %cmp299, label %if.then300, label %if.else313, !dbg !747

if.then300:                                       ; preds = %do.body298
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !748
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !748
  %245 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !748
  %reg_file301 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %245, i32 0, i32 0, !dbg !748
  %arraydecay302 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file301, i16 0, i16 0, !dbg !748
  call void @__dump_registers(i16* %arraydecay302), !dbg !748
  call void @llvm.dbg.declare(metadata i16* %__x303, metadata !750, metadata !DIExpression()), !dbg !752
  %246 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !752, !srcloc !753
  store i16 %246, i16* %__x303, align 2, !dbg !752
  %247 = load i16, i16* %__x303, align 2, !dbg !752
  store i16 %247, i16* %tmp304, align 2, !dbg !752
  %248 = load i16, i16* %tmp304, align 2, !dbg !752
  %add305 = add i16 %248, 2, !dbg !748
  %249 = inttoptr i16 %add305 to i8*, !dbg !748
  call void @llvm.dbg.declare(metadata i16* %__x306, metadata !754, metadata !DIExpression()), !dbg !756
  %250 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !756, !srcloc !757
  store i16 %250, i16* %__x306, align 2, !dbg !756
  %251 = load i16, i16* %__x306, align 2, !dbg !756
  store i16 %251, i16* %tmp307, align 2, !dbg !756
  %252 = load i16, i16* %tmp307, align 2, !dbg !756
  %add308 = add i16 %252, 2, !dbg !748
  %sub309 = sub i16 9216, %add308, !dbg !748
  %call310 = call zeroext i16 @__fast_hw_crc(i8* %249, i16 zeroext %sub309, i16 zeroext -1), !dbg !748
  store i16 %call310, i16* @tmp_stack_crc, align 2, !dbg !748
  %253 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !748
  %254 = bitcast %struct.camel_buffer_t* %253 to i8*, !dbg !748
  %255 = load i16, i16* @tmp_stack_crc, align 2, !dbg !748
  %call311 = call zeroext i16 @__fast_hw_crc(i8* %254, i16 zeroext 44, i16 zeroext %255), !dbg !748
  store i16 %call311, i16* @tmp_stack_buf_crc, align 2, !dbg !748
  %256 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !748
  %257 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !748
  %stack_and_buf_crc312 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %257, i32 0, i32 2, !dbg !748
  store i16 %256, i16* %stack_and_buf_crc312, align 2, !dbg !748
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !748
  br label %if.end326, !dbg !748

if.else313:                                       ; preds = %do.body298
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !758
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !758
  %258 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !758
  %reg_file314 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %258, i32 0, i32 0, !dbg !758
  %arraydecay315 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file314, i16 0, i16 0, !dbg !758
  call void @__dump_registers(i16* %arraydecay315), !dbg !758
  call void @llvm.dbg.declare(metadata i16* %__x316, metadata !760, metadata !DIExpression()), !dbg !762
  %259 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !762, !srcloc !763
  store i16 %259, i16* %__x316, align 2, !dbg !762
  %260 = load i16, i16* %__x316, align 2, !dbg !762
  store i16 %260, i16* %tmp317, align 2, !dbg !762
  %261 = load i16, i16* %tmp317, align 2, !dbg !762
  %add318 = add i16 %261, 2, !dbg !758
  %262 = inttoptr i16 %add318 to i8*, !dbg !758
  call void @llvm.dbg.declare(metadata i16* %__x319, metadata !764, metadata !DIExpression()), !dbg !766
  %263 = call i16 asm sideeffect "mov SP, $0", "=r"() #5, !dbg !766, !srcloc !767
  store i16 %263, i16* %__x319, align 2, !dbg !766
  %264 = load i16, i16* %__x319, align 2, !dbg !766
  store i16 %264, i16* %tmp320, align 2, !dbg !766
  %265 = load i16, i16* %tmp320, align 2, !dbg !766
  %add321 = add i16 %265, 2, !dbg !758
  %sub322 = sub i16 9216, %add321, !dbg !758
  %call323 = call zeroext i16 @__fast_hw_crc(i8* %262, i16 zeroext %sub322, i16 zeroext -1), !dbg !758
  store i16 %call323, i16* @tmp_stack_crc, align 2, !dbg !758
  %266 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !758
  %267 = bitcast %struct.camel_buffer_t* %266 to i8*, !dbg !758
  %268 = load i16, i16* @tmp_stack_crc, align 2, !dbg !758
  %call324 = call zeroext i16 @__fast_hw_crc(i8* %267, i16 zeroext 44, i16 zeroext %268), !dbg !758
  store i16 %call324, i16* @tmp_stack_buf_crc, align 2, !dbg !758
  %269 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !758
  %270 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !758
  %stack_and_buf_crc325 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %270, i32 0, i32 2, !dbg !758
  store i16 %269, i16* %stack_and_buf_crc325, align 2, !dbg !758
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !758
  br label %if.end326

if.end326:                                        ; preds = %if.else313, %if.then300
  br label %do.end327, !dbg !747

do.end327:                                        ; preds = %if.end326
  call void @task_commit(), !dbg !742
  br label %while.cond293, !dbg !738, !llvm.loop !768

while.end328:                                     ; preds = %while.cond293
  br label %if.end330, !dbg !770

if.else329:                                       ; preds = %if.else288
  br label %while.end337, !dbg !771

if.end330:                                        ; preds = %while.end328
  br label %if.end331

if.end331:                                        ; preds = %if.end330, %while.end287
  br label %if.end332

if.end332:                                        ; preds = %if.end331, %while.end246
  br label %if.end333

if.end333:                                        ; preds = %if.end332, %while.end205
  br label %if.end334

if.end334:                                        ; preds = %if.end333, %while.end164
  br label %if.end335

if.end335:                                        ; preds = %if.end334, %while.end123
  br label %if.end336

if.end336:                                        ; preds = %if.end335, %while.end
  br label %while.body, !dbg !485, !llvm.loop !773

while.end337:                                     ; preds = %if.else329
  call void @task_done(), !dbg !775
  %271 = load i16, i16* %retval, align 2, !dbg !776
  ret i16 %271, !dbg !776
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
!llvm.module.flags = !{!70, !71, !72}
!llvm.ident = !{!73}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 135, type: !65, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, nameTableKind: None)
!3 = !DIFile(filename: "../benchmarks/camel_bc.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6, !7, !12, !13}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 32, baseType: !9)
!8 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 65, baseType: !11)
!10 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!11 = !DIBasicType(name: "long unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !14, size: 16)
!14 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!15 = !{!16, !21, !26, !0, !28, !54, !56, !59}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 501, type: !18, isLocal: true, isDefinition: true)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 16)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 20, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 21, type: !23, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 142, type: !30, isLocal: false, isDefinition: true)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 16)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 128, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 123, size: 368, elements: !33)
!33 = !{!34, !39, !53}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !32, file: !3, line: 125, baseType: !35, size: 176)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 176, elements: !37)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 17, baseType: !23)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !32, file: !3, line: 126, baseType: !40, size: 176, offset: 176)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 120, baseType: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 107, size: 176, elements: !42)
!42 = !{!43, !44, !45, !46, !47, !48, !49, !50, !51, !52}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "n_0", scope: !41, file: !3, line: 109, baseType: !6, size: 16)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "n_1", scope: !41, file: !3, line: 110, baseType: !6, size: 16, offset: 16)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "n_2", scope: !41, file: !3, line: 111, baseType: !6, size: 16, offset: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "n_3", scope: !41, file: !3, line: 112, baseType: !6, size: 16, offset: 48)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "n_4", scope: !41, file: !3, line: 113, baseType: !6, size: 16, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "n_5", scope: !41, file: !3, line: 114, baseType: !6, size: 16, offset: 80)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "n_6", scope: !41, file: !3, line: 115, baseType: !6, size: 16, offset: 96)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "func", scope: !41, file: !3, line: 116, baseType: !6, size: 16, offset: 112)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !41, file: !3, line: 117, baseType: !7, size: 32, offset: 128)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "iter", scope: !41, file: !3, line: 118, baseType: !6, size: 16, offset: 160)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !32, file: !3, line: 127, baseType: !23, size: 16, offset: 352)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 142, type: !30, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 171, type: !58, isLocal: false, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 176, elements: !37)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "bits", scope: !2, file: !3, line: 216, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 2048, elements: !63)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !{!64}
!64 = !DISubrange(count: 256)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 130, size: 752, elements: !66)
!66 = !{!67, !68, !69}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !65, file: !3, line: 132, baseType: !23, size: 16)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !65, file: !3, line: 133, baseType: !31, size: 368, offset: 16)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !65, file: !3, line: 134, baseType: !31, size: 368, offset: 384)
!70 = !{i32 2, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 2}
!73 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!74 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 144, type: !19, scopeLine: 144, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 145, column: 10, scope: !74)
!76 = !DILocation(line: 147, column: 9, scope: !74)
!77 = !DILocation(line: 149, column: 9, scope: !74)
!78 = !DILocation(line: 154, column: 11, scope: !74)
!79 = !DILocation(line: 159, column: 12, scope: !74)
!80 = !DILocation(line: 160, column: 10, scope: !74)
!81 = !DILocation(line: 161, column: 10, scope: !74)
!82 = !DILocation(line: 163, column: 10, scope: !74)
!83 = !DILocation(line: 164, column: 12, scope: !74)
!84 = !DILocation(line: 167, column: 10, scope: !74)
!85 = !DILocation(line: 169, column: 1, scope: !74)
!86 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 173, type: !19, scopeLine: 173, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 174, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !86, file: !3, line: 174, column: 8)
!89 = !DILocation(line: 174, column: 19, scope: !88)
!90 = !DILocation(line: 174, column: 8, scope: !86)
!91 = !DILocation(line: 175, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 174, column: 34)
!93 = !DILocation(line: 176, column: 16, scope: !92)
!94 = !DILocation(line: 177, column: 5, scope: !92)
!95 = !DILocation(line: 177, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !3, line: 177, column: 15)
!97 = !DILocation(line: 177, column: 26, scope: !96)
!98 = !DILocation(line: 177, column: 15, scope: !88)
!99 = !DILocation(line: 178, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 177, column: 41)
!101 = !DILocation(line: 179, column: 16, scope: !100)
!102 = !DILocation(line: 180, column: 5, scope: !100)
!103 = !DILocation(line: 181, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !3, line: 180, column: 12)
!105 = !DILocation(line: 198, column: 3, scope: !106)
!106 = distinct !DILexicalBlock(scope: !86, file: !3, line: 198, column: 3)
!107 = !{i32 -2146675289}
!108 = !DILocalVariable(name: "__x", scope: !109, file: !3, line: 200, type: !6)
!109 = distinct !DILexicalBlock(scope: !86, file: !3, line: 200, column: 33)
!110 = !DILocation(line: 200, column: 33, scope: !109)
!111 = !{i32 -2146675053}
!112 = !DILocation(line: 200, column: 51, scope: !86)
!113 = !DILocation(line: 200, column: 33, scope: !86)
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 200, type: !6)
!115 = distinct !DILexicalBlock(scope: !86, file: !3, line: 200, column: 65)
!116 = !DILocation(line: 200, column: 65, scope: !115)
!117 = !{i32 -2146674928}
!118 = !DILocation(line: 200, column: 83, scope: !86)
!119 = !DILocation(line: 200, column: 63, scope: !86)
!120 = !DILocation(line: 200, column: 19, scope: !86)
!121 = !DILocation(line: 200, column: 17, scope: !86)
!122 = !DILocation(line: 201, column: 37, scope: !86)
!123 = !DILocation(line: 201, column: 71, scope: !86)
!124 = !DILocation(line: 201, column: 23, scope: !86)
!125 = !DILocation(line: 201, column: 21, scope: !86)
!126 = !DILocation(line: 204, column: 6, scope: !127)
!127 = distinct !DILexicalBlock(scope: !86, file: !3, line: 204, column: 6)
!128 = !DILocation(line: 204, column: 27, scope: !127)
!129 = !DILocation(line: 204, column: 33, scope: !127)
!130 = !DILocation(line: 204, column: 24, scope: !127)
!131 = !DILocation(line: 204, column: 6, scope: !86)
!132 = !DILocation(line: 205, column: 11, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !3, line: 204, column: 51)
!134 = !DILocation(line: 205, column: 4, scope: !133)
!135 = !DILocation(line: 205, column: 19, scope: !133)
!136 = !DILocation(line: 206, column: 4, scope: !133)
!137 = !DILocation(line: 207, column: 24, scope: !133)
!138 = !DILocation(line: 207, column: 30, scope: !133)
!139 = !DILocation(line: 207, column: 4, scope: !133)
!140 = !DILocation(line: 208, column: 3, scope: !133)
!141 = !DILocation(line: 209, column: 4, scope: !142)
!142 = distinct !DILexicalBlock(scope: !127, file: !3, line: 208, column: 9)
!143 = !DILocation(line: 212, column: 1, scope: !86)
!144 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 236, type: !19, scopeLine: 236, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocation(line: 238, column: 2, scope: !144)
!146 = !DILocation(line: 238, column: 11, scope: !144)
!147 = !DILocation(line: 239, column: 2, scope: !144)
!148 = !DILocation(line: 239, column: 10, scope: !144)
!149 = !DILocation(line: 240, column: 2, scope: !144)
!150 = !DILocation(line: 240, column: 10, scope: !144)
!151 = !DILocation(line: 241, column: 2, scope: !144)
!152 = !DILocation(line: 241, column: 10, scope: !144)
!153 = !DILocation(line: 242, column: 2, scope: !144)
!154 = !DILocation(line: 242, column: 10, scope: !144)
!155 = !DILocation(line: 243, column: 2, scope: !144)
!156 = !DILocation(line: 243, column: 10, scope: !144)
!157 = !DILocation(line: 244, column: 2, scope: !144)
!158 = !DILocation(line: 244, column: 10, scope: !144)
!159 = !DILocation(line: 245, column: 2, scope: !144)
!160 = !DILocation(line: 245, column: 10, scope: !144)
!161 = !DILocation(line: 248, column: 1, scope: !144)
!162 = distinct !DISubprogram(name: "task_select_func", scope: !3, file: !3, line: 250, type: !19, scopeLine: 250, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocation(line: 252, column: 2, scope: !162)
!164 = !DILocation(line: 252, column: 11, scope: !162)
!165 = !DILocation(line: 253, column: 2, scope: !162)
!166 = !DILocation(line: 253, column: 11, scope: !162)
!167 = !DILocation(line: 254, column: 2, scope: !162)
!168 = !DILocation(line: 254, column: 10, scope: !162)
!169 = !DILocation(line: 287, column: 1, scope: !162)
!170 = distinct !DISubprogram(name: "task_bit_count", scope: !3, file: !3, line: 288, type: !19, scopeLine: 288, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "tmp_seed", scope: !170, file: !3, line: 289, type: !7)
!172 = !DILocation(line: 289, column: 11, scope: !170)
!173 = !DILocation(line: 289, column: 22, scope: !170)
!174 = !DILocation(line: 290, column: 13, scope: !170)
!175 = !DILocation(line: 290, column: 22, scope: !170)
!176 = !DILocation(line: 290, column: 2, scope: !170)
!177 = !DILocation(line: 290, column: 11, scope: !170)
!178 = !DILocalVariable(name: "temp", scope: !170, file: !3, line: 291, type: !6)
!179 = !DILocation(line: 291, column: 11, scope: !170)
!180 = !DILocation(line: 292, column: 5, scope: !181)
!181 = distinct !DILexicalBlock(scope: !170, file: !3, line: 292, column: 5)
!182 = !DILocation(line: 292, column: 5, scope: !170)
!183 = !DILocation(line: 292, column: 15, scope: !181)
!184 = !DILocation(line: 293, column: 7, scope: !181)
!185 = !DILocation(line: 293, column: 3, scope: !181)
!186 = !DILocation(line: 294, column: 26, scope: !181)
!187 = !DILocation(line: 294, column: 36, scope: !181)
!188 = !DILocation(line: 294, column: 44, scope: !181)
!189 = !DILocation(line: 294, column: 34, scope: !181)
!190 = !DILocation(line: 294, column: 24, scope: !181)
!191 = !DILocation(line: 294, column: 11, scope: !181)
!192 = distinct !{!192, !183, !193}
!193 = !DILocation(line: 294, column: 48, scope: !181)
!194 = !DILocation(line: 295, column: 13, scope: !170)
!195 = !DILocation(line: 295, column: 2, scope: !170)
!196 = !DILocation(line: 295, column: 10, scope: !170)
!197 = !DILocation(line: 296, column: 2, scope: !170)
!198 = !DILocation(line: 296, column: 10, scope: !170)
!199 = !DILocation(line: 304, column: 1, scope: !170)
!200 = distinct !DISubprogram(name: "task_bitcount", scope: !3, file: !3, line: 305, type: !19, scopeLine: 305, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!201 = !DILocalVariable(name: "tmp_seed", scope: !200, file: !3, line: 306, type: !7)
!202 = !DILocation(line: 306, column: 11, scope: !200)
!203 = !DILocation(line: 306, column: 22, scope: !200)
!204 = !DILocation(line: 307, column: 13, scope: !200)
!205 = !DILocation(line: 307, column: 22, scope: !200)
!206 = !DILocation(line: 307, column: 2, scope: !200)
!207 = !DILocation(line: 307, column: 11, scope: !200)
!208 = !DILocation(line: 308, column: 15, scope: !200)
!209 = !DILocation(line: 308, column: 24, scope: !200)
!210 = !DILocation(line: 308, column: 39, scope: !200)
!211 = !DILocation(line: 308, column: 49, scope: !200)
!212 = !DILocation(line: 308, column: 58, scope: !200)
!213 = !DILocation(line: 308, column: 46, scope: !200)
!214 = !DILocation(line: 308, column: 11, scope: !200)
!215 = !DILocation(line: 309, column: 15, scope: !200)
!216 = !DILocation(line: 309, column: 24, scope: !200)
!217 = !DILocation(line: 309, column: 39, scope: !200)
!218 = !DILocation(line: 309, column: 49, scope: !200)
!219 = !DILocation(line: 309, column: 58, scope: !200)
!220 = !DILocation(line: 309, column: 46, scope: !200)
!221 = !DILocation(line: 309, column: 11, scope: !200)
!222 = !DILocation(line: 310, column: 15, scope: !200)
!223 = !DILocation(line: 310, column: 24, scope: !200)
!224 = !DILocation(line: 310, column: 39, scope: !200)
!225 = !DILocation(line: 310, column: 49, scope: !200)
!226 = !DILocation(line: 310, column: 58, scope: !200)
!227 = !DILocation(line: 310, column: 46, scope: !200)
!228 = !DILocation(line: 310, column: 11, scope: !200)
!229 = !DILocation(line: 311, column: 15, scope: !200)
!230 = !DILocation(line: 311, column: 24, scope: !200)
!231 = !DILocation(line: 311, column: 39, scope: !200)
!232 = !DILocation(line: 311, column: 49, scope: !200)
!233 = !DILocation(line: 311, column: 58, scope: !200)
!234 = !DILocation(line: 311, column: 46, scope: !200)
!235 = !DILocation(line: 311, column: 11, scope: !200)
!236 = !DILocation(line: 312, column: 15, scope: !200)
!237 = !DILocation(line: 312, column: 24, scope: !200)
!238 = !DILocation(line: 312, column: 39, scope: !200)
!239 = !DILocation(line: 312, column: 49, scope: !200)
!240 = !DILocation(line: 312, column: 58, scope: !200)
!241 = !DILocation(line: 312, column: 46, scope: !200)
!242 = !DILocation(line: 312, column: 11, scope: !200)
!243 = !DILocation(line: 313, column: 18, scope: !200)
!244 = !DILocation(line: 313, column: 13, scope: !200)
!245 = !DILocation(line: 313, column: 2, scope: !200)
!246 = !DILocation(line: 313, column: 10, scope: !200)
!247 = !DILocation(line: 314, column: 2, scope: !200)
!248 = !DILocation(line: 314, column: 10, scope: !200)
!249 = !DILocation(line: 322, column: 1, scope: !200)
!250 = distinct !DISubprogram(name: "recursive_cnt", scope: !3, file: !3, line: 323, type: !251, scopeLine: 323, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!251 = !DISubroutineType(types: !252)
!252 = !{!12, !7}
!253 = !DILocalVariable(name: "x", arg: 1, scope: !250, file: !3, line: 323, type: !7)
!254 = !DILocation(line: 323, column: 28, scope: !250)
!255 = !DILocalVariable(name: "cnt", scope: !250, file: !3, line: 324, type: !12)
!256 = !DILocation(line: 324, column: 6, scope: !250)
!257 = !DILocation(line: 324, column: 23, scope: !250)
!258 = !DILocation(line: 324, column: 25, scope: !250)
!259 = !DILocation(line: 324, column: 17, scope: !250)
!260 = !DILocation(line: 324, column: 12, scope: !250)
!261 = !DILocation(line: 326, column: 15, scope: !262)
!262 = distinct !DILexicalBlock(scope: !250, file: !3, line: 326, column: 6)
!263 = !DILocation(line: 326, column: 9, scope: !262)
!264 = !DILocation(line: 326, column: 6, scope: !250)
!265 = !DILocation(line: 327, column: 24, scope: !262)
!266 = !DILocation(line: 327, column: 10, scope: !262)
!267 = !DILocation(line: 327, column: 7, scope: !262)
!268 = !DILocation(line: 327, column: 3, scope: !262)
!269 = !DILocation(line: 329, column: 9, scope: !250)
!270 = !DILocation(line: 329, column: 2, scope: !250)
!271 = distinct !DISubprogram(name: "task_ntbl_bitcnt", scope: !3, file: !3, line: 331, type: !19, scopeLine: 331, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DILocation(line: 332, column: 27, scope: !271)
!273 = !DILocation(line: 332, column: 13, scope: !271)
!274 = !DILocation(line: 332, column: 2, scope: !271)
!275 = !DILocation(line: 332, column: 10, scope: !271)
!276 = !DILocation(line: 333, column: 13, scope: !271)
!277 = !DILocation(line: 333, column: 22, scope: !271)
!278 = !DILocation(line: 333, column: 2, scope: !271)
!279 = !DILocation(line: 333, column: 11, scope: !271)
!280 = !DILocation(line: 334, column: 2, scope: !271)
!281 = !DILocation(line: 334, column: 10, scope: !271)
!282 = !DILocation(line: 342, column: 1, scope: !271)
!283 = distinct !DISubprogram(name: "task_ntbl_bitcount", scope: !3, file: !3, line: 343, type: !19, scopeLine: 343, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DILocation(line: 344, column: 26, scope: !283)
!285 = !DILocation(line: 344, column: 35, scope: !283)
!286 = !DILocation(line: 344, column: 19, scope: !283)
!287 = !DILocation(line: 344, column: 13, scope: !283)
!288 = !DILocation(line: 345, column: 16, scope: !283)
!289 = !DILocation(line: 345, column: 25, scope: !283)
!290 = !DILocation(line: 345, column: 41, scope: !283)
!291 = !DILocation(line: 345, column: 9, scope: !283)
!292 = !DILocation(line: 345, column: 3, scope: !283)
!293 = !DILocation(line: 344, column: 59, scope: !283)
!294 = !DILocation(line: 346, column: 16, scope: !283)
!295 = !DILocation(line: 346, column: 25, scope: !283)
!296 = !DILocation(line: 346, column: 41, scope: !283)
!297 = !DILocation(line: 346, column: 9, scope: !283)
!298 = !DILocation(line: 346, column: 3, scope: !283)
!299 = !DILocation(line: 345, column: 49, scope: !283)
!300 = !DILocation(line: 347, column: 16, scope: !283)
!301 = !DILocation(line: 347, column: 25, scope: !283)
!302 = !DILocation(line: 347, column: 41, scope: !283)
!303 = !DILocation(line: 347, column: 9, scope: !283)
!304 = !DILocation(line: 347, column: 3, scope: !283)
!305 = !DILocation(line: 346, column: 49, scope: !283)
!306 = !DILocation(line: 348, column: 16, scope: !283)
!307 = !DILocation(line: 348, column: 25, scope: !283)
!308 = !DILocation(line: 348, column: 41, scope: !283)
!309 = !DILocation(line: 348, column: 9, scope: !283)
!310 = !DILocation(line: 348, column: 3, scope: !283)
!311 = !DILocation(line: 347, column: 49, scope: !283)
!312 = !DILocation(line: 349, column: 16, scope: !283)
!313 = !DILocation(line: 349, column: 25, scope: !283)
!314 = !DILocation(line: 349, column: 41, scope: !283)
!315 = !DILocation(line: 349, column: 9, scope: !283)
!316 = !DILocation(line: 349, column: 3, scope: !283)
!317 = !DILocation(line: 348, column: 49, scope: !283)
!318 = !DILocation(line: 350, column: 16, scope: !283)
!319 = !DILocation(line: 350, column: 25, scope: !283)
!320 = !DILocation(line: 350, column: 41, scope: !283)
!321 = !DILocation(line: 350, column: 9, scope: !283)
!322 = !DILocation(line: 350, column: 3, scope: !283)
!323 = !DILocation(line: 349, column: 49, scope: !283)
!324 = !DILocation(line: 351, column: 16, scope: !283)
!325 = !DILocation(line: 351, column: 25, scope: !283)
!326 = !DILocation(line: 351, column: 41, scope: !283)
!327 = !DILocation(line: 351, column: 9, scope: !283)
!328 = !DILocation(line: 351, column: 3, scope: !283)
!329 = !DILocation(line: 350, column: 49, scope: !283)
!330 = !DILocation(line: 344, column: 2, scope: !283)
!331 = !DILocation(line: 344, column: 10, scope: !283)
!332 = !DILocation(line: 352, column: 13, scope: !283)
!333 = !DILocation(line: 352, column: 22, scope: !283)
!334 = !DILocation(line: 352, column: 2, scope: !283)
!335 = !DILocation(line: 352, column: 11, scope: !283)
!336 = !DILocation(line: 353, column: 2, scope: !283)
!337 = !DILocation(line: 353, column: 10, scope: !283)
!338 = !DILocation(line: 361, column: 1, scope: !283)
!339 = distinct !DISubprogram(name: "task_BW_btbl_bitcount", scope: !3, file: !3, line: 362, type: !19, scopeLine: 362, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!340 = !DILocalVariable(name: "U", scope: !339, file: !3, line: 367, type: !341)
!341 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !339, file: !3, line: 363, size: 32, elements: !342)
!342 = !{!343, !347}
!343 = !DIDerivedType(tag: DW_TAG_member, name: "ch", scope: !341, file: !3, line: 365, baseType: !344, size: 32)
!344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32, elements: !345)
!345 = !{!346}
!346 = !DISubrange(count: 4)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !341, file: !3, line: 366, baseType: !348, size: 32)
!348 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!349 = !DILocation(line: 367, column: 4, scope: !339)
!350 = !DILocation(line: 369, column: 8, scope: !339)
!351 = !DILocation(line: 369, column: 4, scope: !339)
!352 = !DILocation(line: 369, column: 6, scope: !339)
!353 = !DILocation(line: 371, column: 21, scope: !339)
!354 = !DILocation(line: 371, column: 19, scope: !339)
!355 = !DILocation(line: 371, column: 13, scope: !339)
!356 = !DILocation(line: 371, column: 39, scope: !339)
!357 = !DILocation(line: 371, column: 37, scope: !339)
!358 = !DILocation(line: 371, column: 31, scope: !339)
!359 = !DILocation(line: 371, column: 29, scope: !339)
!360 = !DILocation(line: 372, column: 11, scope: !339)
!361 = !DILocation(line: 372, column: 9, scope: !339)
!362 = !DILocation(line: 372, column: 3, scope: !339)
!363 = !DILocation(line: 371, column: 47, scope: !339)
!364 = !DILocation(line: 372, column: 29, scope: !339)
!365 = !DILocation(line: 372, column: 27, scope: !339)
!366 = !DILocation(line: 372, column: 21, scope: !339)
!367 = !DILocation(line: 372, column: 19, scope: !339)
!368 = !DILocation(line: 371, column: 2, scope: !339)
!369 = !DILocation(line: 371, column: 10, scope: !339)
!370 = !DILocation(line: 373, column: 13, scope: !339)
!371 = !DILocation(line: 373, column: 22, scope: !339)
!372 = !DILocation(line: 373, column: 2, scope: !339)
!373 = !DILocation(line: 373, column: 11, scope: !339)
!374 = !DILocation(line: 374, column: 2, scope: !339)
!375 = !DILocation(line: 374, column: 10, scope: !339)
!376 = !DILocation(line: 382, column: 1, scope: !339)
!377 = distinct !DISubprogram(name: "task_AR_btbl_bitcount", scope: !3, file: !3, line: 383, type: !19, scopeLine: 383, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!378 = !DILocalVariable(name: "Ptr", scope: !377, file: !3, line: 384, type: !13)
!379 = !DILocation(line: 384, column: 18, scope: !377)
!380 = !DILocation(line: 384, column: 43, scope: !377)
!381 = !DILocation(line: 384, column: 24, scope: !377)
!382 = !DILocalVariable(name: "Accu", scope: !377, file: !3, line: 385, type: !12)
!383 = !DILocation(line: 385, column: 6, scope: !377)
!384 = !DILocation(line: 387, column: 20, scope: !377)
!385 = !DILocation(line: 387, column: 16, scope: !377)
!386 = !DILocation(line: 387, column: 10, scope: !377)
!387 = !DILocation(line: 387, column: 8, scope: !377)
!388 = !DILocation(line: 388, column: 20, scope: !377)
!389 = !DILocation(line: 388, column: 16, scope: !377)
!390 = !DILocation(line: 388, column: 10, scope: !377)
!391 = !DILocation(line: 388, column: 7, scope: !377)
!392 = !DILocation(line: 389, column: 20, scope: !377)
!393 = !DILocation(line: 389, column: 16, scope: !377)
!394 = !DILocation(line: 389, column: 10, scope: !377)
!395 = !DILocation(line: 389, column: 7, scope: !377)
!396 = !DILocation(line: 390, column: 17, scope: !377)
!397 = !DILocation(line: 390, column: 16, scope: !377)
!398 = !DILocation(line: 390, column: 10, scope: !377)
!399 = !DILocation(line: 390, column: 7, scope: !377)
!400 = !DILocation(line: 391, column: 12, scope: !377)
!401 = !DILocation(line: 391, column: 2, scope: !377)
!402 = !DILocation(line: 391, column: 9, scope: !377)
!403 = !DILocation(line: 392, column: 13, scope: !377)
!404 = !DILocation(line: 392, column: 22, scope: !377)
!405 = !DILocation(line: 392, column: 2, scope: !377)
!406 = !DILocation(line: 392, column: 11, scope: !377)
!407 = !DILocation(line: 393, column: 2, scope: !377)
!408 = !DILocation(line: 393, column: 10, scope: !377)
!409 = !DILocation(line: 401, column: 1, scope: !377)
!410 = distinct !DISubprogram(name: "task_bit_shifter", scope: !3, file: !3, line: 402, type: !19, scopeLine: 402, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!411 = !DILocalVariable(name: "i", scope: !410, file: !3, line: 403, type: !12)
!412 = !DILocation(line: 403, column: 6, scope: !410)
!413 = !DILocalVariable(name: "nn", scope: !410, file: !3, line: 403, type: !12)
!414 = !DILocation(line: 403, column: 9, scope: !410)
!415 = !DILocalVariable(name: "tmp_seed", scope: !410, file: !3, line: 404, type: !7)
!416 = !DILocation(line: 404, column: 11, scope: !410)
!417 = !DILocation(line: 404, column: 22, scope: !410)
!418 = !DILocation(line: 405, column: 14, scope: !419)
!419 = distinct !DILexicalBlock(scope: !410, file: !3, line: 405, column: 2)
!420 = !DILocation(line: 405, column: 9, scope: !419)
!421 = !DILocation(line: 405, column: 7, scope: !419)
!422 = !DILocation(line: 405, column: 19, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !3, line: 405, column: 2)
!424 = !DILocation(line: 405, column: 28, scope: !423)
!425 = !DILocation(line: 405, column: 32, scope: !423)
!426 = !DILocation(line: 405, column: 34, scope: !423)
!427 = !DILocation(line: 0, scope: !423)
!428 = !DILocation(line: 405, column: 2, scope: !419)
!429 = !DILocation(line: 406, column: 15, scope: !423)
!430 = !DILocation(line: 406, column: 24, scope: !423)
!431 = !DILocation(line: 406, column: 9, scope: !423)
!432 = !DILocation(line: 406, column: 6, scope: !423)
!433 = !DILocation(line: 406, column: 3, scope: !423)
!434 = !DILocation(line: 405, column: 64, scope: !423)
!435 = !DILocation(line: 405, column: 78, scope: !423)
!436 = !DILocation(line: 405, column: 2, scope: !423)
!437 = distinct !{!437, !428, !438}
!438 = !DILocation(line: 406, column: 28, scope: !419)
!439 = !DILocation(line: 407, column: 13, scope: !410)
!440 = !DILocation(line: 407, column: 2, scope: !410)
!441 = !DILocation(line: 407, column: 10, scope: !410)
!442 = !DILocation(line: 408, column: 13, scope: !410)
!443 = !DILocation(line: 408, column: 22, scope: !410)
!444 = !DILocation(line: 408, column: 2, scope: !410)
!445 = !DILocation(line: 408, column: 11, scope: !410)
!446 = !DILocation(line: 410, column: 2, scope: !410)
!447 = !DILocation(line: 410, column: 10, scope: !410)
!448 = !DILocation(line: 418, column: 1, scope: !410)
!449 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 420, type: !19, scopeLine: 420, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!450 = !DILocation(line: 422, column: 2, scope: !449)
!451 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 426, type: !19, scopeLine: 426, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!452 = !DILocation(line: 428, column: 1, scope: !451)
!453 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 430, type: !454, scopeLine: 430, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!454 = !DISubroutineType(types: !455)
!455 = !{!12}
!456 = !DILocation(line: 433, column: 16, scope: !453)
!457 = !DILocation(line: 434, column: 10, scope: !453)
!458 = !DILocation(line: 435, column: 12, scope: !453)
!459 = !DILocation(line: 436, column: 5, scope: !453)
!460 = !DILocation(line: 439, column: 2, scope: !453)
!461 = !DILocation(line: 439, column: 2, scope: !462)
!462 = distinct !DILexicalBlock(scope: !463, file: !3, line: 439, column: 2)
!463 = distinct !DILexicalBlock(scope: !453, file: !3, line: 439, column: 2)
!464 = !DILocation(line: 439, column: 2, scope: !463)
!465 = !DILocation(line: 439, column: 2, scope: !466)
!466 = distinct !DILexicalBlock(scope: !462, file: !3, line: 439, column: 2)
!467 = !DILocalVariable(name: "__x", scope: !468, file: !3, line: 439, type: !6)
!468 = distinct !DILexicalBlock(scope: !466, file: !3, line: 439, column: 2)
!469 = !DILocation(line: 439, column: 2, scope: !468)
!470 = !{i32 -2146671552}
!471 = !DILocalVariable(name: "__x", scope: !472, file: !3, line: 439, type: !6)
!472 = distinct !DILexicalBlock(scope: !466, file: !3, line: 439, column: 2)
!473 = !DILocation(line: 439, column: 2, scope: !472)
!474 = !{i32 -2146671427}
!475 = !DILocation(line: 439, column: 2, scope: !476)
!476 = distinct !DILexicalBlock(scope: !462, file: !3, line: 439, column: 2)
!477 = !DILocalVariable(name: "__x", scope: !478, file: !3, line: 439, type: !6)
!478 = distinct !DILexicalBlock(scope: !476, file: !3, line: 439, column: 2)
!479 = !DILocation(line: 439, column: 2, scope: !478)
!480 = !{i32 -2146671295}
!481 = !DILocalVariable(name: "__x", scope: !482, file: !3, line: 439, type: !6)
!482 = distinct !DILexicalBlock(scope: !476, file: !3, line: 439, column: 2)
!483 = !DILocation(line: 439, column: 2, scope: !482)
!484 = !{i32 -2146671170}
!485 = !DILocation(line: 442, column: 2, scope: !453)
!486 = !DILocation(line: 444, column: 3, scope: !487)
!487 = distinct !DILexicalBlock(scope: !453, file: !3, line: 442, column: 12)
!488 = !DILocation(line: 444, column: 3, scope: !489)
!489 = distinct !DILexicalBlock(scope: !490, file: !3, line: 444, column: 3)
!490 = distinct !DILexicalBlock(scope: !487, file: !3, line: 444, column: 3)
!491 = !DILocation(line: 444, column: 3, scope: !490)
!492 = !DILocation(line: 444, column: 3, scope: !493)
!493 = distinct !DILexicalBlock(scope: !489, file: !3, line: 444, column: 3)
!494 = !DILocalVariable(name: "__x", scope: !495, file: !3, line: 444, type: !6)
!495 = distinct !DILexicalBlock(scope: !493, file: !3, line: 444, column: 3)
!496 = !DILocation(line: 444, column: 3, scope: !495)
!497 = !{i32 -2146668997}
!498 = !DILocalVariable(name: "__x", scope: !499, file: !3, line: 444, type: !6)
!499 = distinct !DILexicalBlock(scope: !493, file: !3, line: 444, column: 3)
!500 = !DILocation(line: 444, column: 3, scope: !499)
!501 = !{i32 -2146668872}
!502 = !DILocation(line: 444, column: 3, scope: !503)
!503 = distinct !DILexicalBlock(scope: !489, file: !3, line: 444, column: 3)
!504 = !DILocalVariable(name: "__x", scope: !505, file: !3, line: 444, type: !6)
!505 = distinct !DILexicalBlock(scope: !503, file: !3, line: 444, column: 3)
!506 = !DILocation(line: 444, column: 3, scope: !505)
!507 = !{i32 -2146668740}
!508 = !DILocalVariable(name: "__x", scope: !509, file: !3, line: 444, type: !6)
!509 = distinct !DILexicalBlock(scope: !503, file: !3, line: 444, column: 3)
!510 = !DILocation(line: 444, column: 3, scope: !509)
!511 = !{i32 -2146668615}
!512 = !DILocation(line: 446, column: 7, scope: !513)
!513 = distinct !DILexicalBlock(scope: !487, file: !3, line: 446, column: 7)
!514 = !DILocation(line: 446, column: 16, scope: !513)
!515 = !DILocation(line: 446, column: 7, scope: !487)
!516 = !DILocation(line: 448, column: 4, scope: !517)
!517 = distinct !DILexicalBlock(scope: !513, file: !3, line: 446, column: 22)
!518 = !DILocation(line: 448, column: 11, scope: !517)
!519 = !DILocation(line: 448, column: 20, scope: !517)
!520 = !DILocation(line: 449, column: 5, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !3, line: 448, column: 28)
!522 = !DILocation(line: 449, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !524, file: !3, line: 449, column: 5)
!524 = distinct !DILexicalBlock(scope: !521, file: !3, line: 449, column: 5)
!525 = !DILocation(line: 449, column: 5, scope: !524)
!526 = !DILocation(line: 449, column: 5, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !3, line: 449, column: 5)
!528 = !DILocalVariable(name: "__x", scope: !529, file: !3, line: 449, type: !6)
!529 = distinct !DILexicalBlock(scope: !527, file: !3, line: 449, column: 5)
!530 = !DILocation(line: 449, column: 5, scope: !529)
!531 = !{i32 -2146666395}
!532 = !DILocalVariable(name: "__x", scope: !533, file: !3, line: 449, type: !6)
!533 = distinct !DILexicalBlock(scope: !527, file: !3, line: 449, column: 5)
!534 = !DILocation(line: 449, column: 5, scope: !533)
!535 = !{i32 -2146666270}
!536 = !DILocation(line: 449, column: 5, scope: !537)
!537 = distinct !DILexicalBlock(scope: !523, file: !3, line: 449, column: 5)
!538 = !DILocalVariable(name: "__x", scope: !539, file: !3, line: 449, type: !6)
!539 = distinct !DILexicalBlock(scope: !537, file: !3, line: 449, column: 5)
!540 = !DILocation(line: 449, column: 5, scope: !539)
!541 = !{i32 -2146666138}
!542 = !DILocalVariable(name: "__x", scope: !543, file: !3, line: 449, type: !6)
!543 = distinct !DILexicalBlock(scope: !537, file: !3, line: 449, column: 5)
!544 = !DILocation(line: 449, column: 5, scope: !543)
!545 = !{i32 -2146666013}
!546 = distinct !{!546, !516, !547}
!547 = !DILocation(line: 450, column: 4, scope: !517)
!548 = !DILocation(line: 452, column: 3, scope: !517)
!549 = !DILocation(line: 452, column: 14, scope: !550)
!550 = distinct !DILexicalBlock(scope: !513, file: !3, line: 452, column: 14)
!551 = !DILocation(line: 452, column: 23, scope: !550)
!552 = !DILocation(line: 452, column: 14, scope: !513)
!553 = !DILocation(line: 454, column: 4, scope: !554)
!554 = distinct !DILexicalBlock(scope: !550, file: !3, line: 452, column: 29)
!555 = !DILocation(line: 454, column: 11, scope: !554)
!556 = !DILocation(line: 454, column: 20, scope: !554)
!557 = !DILocation(line: 455, column: 5, scope: !558)
!558 = distinct !DILexicalBlock(scope: !554, file: !3, line: 454, column: 28)
!559 = !DILocation(line: 455, column: 5, scope: !560)
!560 = distinct !DILexicalBlock(scope: !561, file: !3, line: 455, column: 5)
!561 = distinct !DILexicalBlock(scope: !558, file: !3, line: 455, column: 5)
!562 = !DILocation(line: 455, column: 5, scope: !561)
!563 = !DILocation(line: 455, column: 5, scope: !564)
!564 = distinct !DILexicalBlock(scope: !560, file: !3, line: 455, column: 5)
!565 = !DILocalVariable(name: "__x", scope: !566, file: !3, line: 455, type: !6)
!566 = distinct !DILexicalBlock(scope: !564, file: !3, line: 455, column: 5)
!567 = !DILocation(line: 455, column: 5, scope: !566)
!568 = !{i32 -2146663792}
!569 = !DILocalVariable(name: "__x", scope: !570, file: !3, line: 455, type: !6)
!570 = distinct !DILexicalBlock(scope: !564, file: !3, line: 455, column: 5)
!571 = !DILocation(line: 455, column: 5, scope: !570)
!572 = !{i32 -2146663667}
!573 = !DILocation(line: 455, column: 5, scope: !574)
!574 = distinct !DILexicalBlock(scope: !560, file: !3, line: 455, column: 5)
!575 = !DILocalVariable(name: "__x", scope: !576, file: !3, line: 455, type: !6)
!576 = distinct !DILexicalBlock(scope: !574, file: !3, line: 455, column: 5)
!577 = !DILocation(line: 455, column: 5, scope: !576)
!578 = !{i32 -2146663535}
!579 = !DILocalVariable(name: "__x", scope: !580, file: !3, line: 455, type: !6)
!580 = distinct !DILexicalBlock(scope: !574, file: !3, line: 455, column: 5)
!581 = !DILocation(line: 455, column: 5, scope: !580)
!582 = !{i32 -2146663410}
!583 = distinct !{!583, !553, !584}
!584 = !DILocation(line: 456, column: 4, scope: !554)
!585 = !DILocation(line: 458, column: 3, scope: !554)
!586 = !DILocation(line: 458, column: 14, scope: !587)
!587 = distinct !DILexicalBlock(scope: !550, file: !3, line: 458, column: 14)
!588 = !DILocation(line: 458, column: 23, scope: !587)
!589 = !DILocation(line: 458, column: 14, scope: !550)
!590 = !DILocation(line: 460, column: 4, scope: !591)
!591 = distinct !DILexicalBlock(scope: !587, file: !3, line: 458, column: 29)
!592 = !DILocation(line: 460, column: 11, scope: !591)
!593 = !DILocation(line: 460, column: 20, scope: !591)
!594 = !DILocation(line: 461, column: 5, scope: !595)
!595 = distinct !DILexicalBlock(scope: !591, file: !3, line: 460, column: 28)
!596 = !DILocation(line: 461, column: 5, scope: !597)
!597 = distinct !DILexicalBlock(scope: !598, file: !3, line: 461, column: 5)
!598 = distinct !DILexicalBlock(scope: !595, file: !3, line: 461, column: 5)
!599 = !DILocation(line: 461, column: 5, scope: !598)
!600 = !DILocation(line: 461, column: 5, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !3, line: 461, column: 5)
!602 = !DILocalVariable(name: "__x", scope: !603, file: !3, line: 461, type: !6)
!603 = distinct !DILexicalBlock(scope: !601, file: !3, line: 461, column: 5)
!604 = !DILocation(line: 461, column: 5, scope: !603)
!605 = !{i32 -2146661187}
!606 = !DILocalVariable(name: "__x", scope: !607, file: !3, line: 461, type: !6)
!607 = distinct !DILexicalBlock(scope: !601, file: !3, line: 461, column: 5)
!608 = !DILocation(line: 461, column: 5, scope: !607)
!609 = !{i32 -2146661062}
!610 = !DILocation(line: 461, column: 5, scope: !611)
!611 = distinct !DILexicalBlock(scope: !597, file: !3, line: 461, column: 5)
!612 = !DILocalVariable(name: "__x", scope: !613, file: !3, line: 461, type: !6)
!613 = distinct !DILexicalBlock(scope: !611, file: !3, line: 461, column: 5)
!614 = !DILocation(line: 461, column: 5, scope: !613)
!615 = !{i32 -2146660930}
!616 = !DILocalVariable(name: "__x", scope: !617, file: !3, line: 461, type: !6)
!617 = distinct !DILexicalBlock(scope: !611, file: !3, line: 461, column: 5)
!618 = !DILocation(line: 461, column: 5, scope: !617)
!619 = !{i32 -2146660805}
!620 = distinct !{!620, !590, !621}
!621 = !DILocation(line: 462, column: 4, scope: !591)
!622 = !DILocation(line: 464, column: 3, scope: !591)
!623 = !DILocation(line: 464, column: 14, scope: !624)
!624 = distinct !DILexicalBlock(scope: !587, file: !3, line: 464, column: 14)
!625 = !DILocation(line: 464, column: 23, scope: !624)
!626 = !DILocation(line: 464, column: 14, scope: !587)
!627 = !DILocation(line: 466, column: 4, scope: !628)
!628 = distinct !DILexicalBlock(scope: !624, file: !3, line: 464, column: 29)
!629 = !DILocation(line: 466, column: 11, scope: !628)
!630 = !DILocation(line: 466, column: 20, scope: !628)
!631 = !DILocation(line: 467, column: 5, scope: !632)
!632 = distinct !DILexicalBlock(scope: !628, file: !3, line: 466, column: 28)
!633 = !DILocation(line: 467, column: 5, scope: !634)
!634 = distinct !DILexicalBlock(scope: !635, file: !3, line: 467, column: 5)
!635 = distinct !DILexicalBlock(scope: !632, file: !3, line: 467, column: 5)
!636 = !DILocation(line: 467, column: 5, scope: !635)
!637 = !DILocation(line: 467, column: 5, scope: !638)
!638 = distinct !DILexicalBlock(scope: !634, file: !3, line: 467, column: 5)
!639 = !DILocalVariable(name: "__x", scope: !640, file: !3, line: 467, type: !6)
!640 = distinct !DILexicalBlock(scope: !638, file: !3, line: 467, column: 5)
!641 = !DILocation(line: 467, column: 5, scope: !640)
!642 = !{i32 -2146658580}
!643 = !DILocalVariable(name: "__x", scope: !644, file: !3, line: 467, type: !6)
!644 = distinct !DILexicalBlock(scope: !638, file: !3, line: 467, column: 5)
!645 = !DILocation(line: 467, column: 5, scope: !644)
!646 = !{i32 -2146658455}
!647 = !DILocation(line: 467, column: 5, scope: !648)
!648 = distinct !DILexicalBlock(scope: !634, file: !3, line: 467, column: 5)
!649 = !DILocalVariable(name: "__x", scope: !650, file: !3, line: 467, type: !6)
!650 = distinct !DILexicalBlock(scope: !648, file: !3, line: 467, column: 5)
!651 = !DILocation(line: 467, column: 5, scope: !650)
!652 = !{i32 -2146658323}
!653 = !DILocalVariable(name: "__x", scope: !654, file: !3, line: 467, type: !6)
!654 = distinct !DILexicalBlock(scope: !648, file: !3, line: 467, column: 5)
!655 = !DILocation(line: 467, column: 5, scope: !654)
!656 = !{i32 -2146658198}
!657 = distinct !{!657, !627, !658}
!658 = !DILocation(line: 468, column: 4, scope: !628)
!659 = !DILocation(line: 470, column: 3, scope: !628)
!660 = !DILocation(line: 470, column: 14, scope: !661)
!661 = distinct !DILexicalBlock(scope: !624, file: !3, line: 470, column: 14)
!662 = !DILocation(line: 470, column: 23, scope: !661)
!663 = !DILocation(line: 470, column: 14, scope: !624)
!664 = !DILocation(line: 472, column: 4, scope: !665)
!665 = distinct !DILexicalBlock(scope: !661, file: !3, line: 470, column: 29)
!666 = !DILocation(line: 472, column: 11, scope: !665)
!667 = !DILocation(line: 472, column: 20, scope: !665)
!668 = !DILocation(line: 473, column: 5, scope: !669)
!669 = distinct !DILexicalBlock(scope: !665, file: !3, line: 472, column: 28)
!670 = !DILocation(line: 473, column: 5, scope: !671)
!671 = distinct !DILexicalBlock(scope: !672, file: !3, line: 473, column: 5)
!672 = distinct !DILexicalBlock(scope: !669, file: !3, line: 473, column: 5)
!673 = !DILocation(line: 473, column: 5, scope: !672)
!674 = !DILocation(line: 473, column: 5, scope: !675)
!675 = distinct !DILexicalBlock(scope: !671, file: !3, line: 473, column: 5)
!676 = !DILocalVariable(name: "__x", scope: !677, file: !3, line: 473, type: !6)
!677 = distinct !DILexicalBlock(scope: !675, file: !3, line: 473, column: 5)
!678 = !DILocation(line: 473, column: 5, scope: !677)
!679 = !{i32 -2146655970}
!680 = !DILocalVariable(name: "__x", scope: !681, file: !3, line: 473, type: !6)
!681 = distinct !DILexicalBlock(scope: !675, file: !3, line: 473, column: 5)
!682 = !DILocation(line: 473, column: 5, scope: !681)
!683 = !{i32 -2146655845}
!684 = !DILocation(line: 473, column: 5, scope: !685)
!685 = distinct !DILexicalBlock(scope: !671, file: !3, line: 473, column: 5)
!686 = !DILocalVariable(name: "__x", scope: !687, file: !3, line: 473, type: !6)
!687 = distinct !DILexicalBlock(scope: !685, file: !3, line: 473, column: 5)
!688 = !DILocation(line: 473, column: 5, scope: !687)
!689 = !{i32 -2146655713}
!690 = !DILocalVariable(name: "__x", scope: !691, file: !3, line: 473, type: !6)
!691 = distinct !DILexicalBlock(scope: !685, file: !3, line: 473, column: 5)
!692 = !DILocation(line: 473, column: 5, scope: !691)
!693 = !{i32 -2146655588}
!694 = distinct !{!694, !664, !695}
!695 = !DILocation(line: 474, column: 4, scope: !665)
!696 = !DILocation(line: 476, column: 3, scope: !665)
!697 = !DILocation(line: 476, column: 14, scope: !698)
!698 = distinct !DILexicalBlock(scope: !661, file: !3, line: 476, column: 14)
!699 = !DILocation(line: 476, column: 23, scope: !698)
!700 = !DILocation(line: 476, column: 14, scope: !661)
!701 = !DILocation(line: 478, column: 4, scope: !702)
!702 = distinct !DILexicalBlock(scope: !698, file: !3, line: 476, column: 29)
!703 = !DILocation(line: 478, column: 11, scope: !702)
!704 = !DILocation(line: 478, column: 20, scope: !702)
!705 = !DILocation(line: 479, column: 5, scope: !706)
!706 = distinct !DILexicalBlock(scope: !702, file: !3, line: 478, column: 28)
!707 = !DILocation(line: 479, column: 5, scope: !708)
!708 = distinct !DILexicalBlock(scope: !709, file: !3, line: 479, column: 5)
!709 = distinct !DILexicalBlock(scope: !706, file: !3, line: 479, column: 5)
!710 = !DILocation(line: 479, column: 5, scope: !709)
!711 = !DILocation(line: 479, column: 5, scope: !712)
!712 = distinct !DILexicalBlock(scope: !708, file: !3, line: 479, column: 5)
!713 = !DILocalVariable(name: "__x", scope: !714, file: !3, line: 479, type: !6)
!714 = distinct !DILexicalBlock(scope: !712, file: !3, line: 479, column: 5)
!715 = !DILocation(line: 479, column: 5, scope: !714)
!716 = !{i32 -2146653360}
!717 = !DILocalVariable(name: "__x", scope: !718, file: !3, line: 479, type: !6)
!718 = distinct !DILexicalBlock(scope: !712, file: !3, line: 479, column: 5)
!719 = !DILocation(line: 479, column: 5, scope: !718)
!720 = !{i32 -2146653235}
!721 = !DILocation(line: 479, column: 5, scope: !722)
!722 = distinct !DILexicalBlock(scope: !708, file: !3, line: 479, column: 5)
!723 = !DILocalVariable(name: "__x", scope: !724, file: !3, line: 479, type: !6)
!724 = distinct !DILexicalBlock(scope: !722, file: !3, line: 479, column: 5)
!725 = !DILocation(line: 479, column: 5, scope: !724)
!726 = !{i32 -2146653103}
!727 = !DILocalVariable(name: "__x", scope: !728, file: !3, line: 479, type: !6)
!728 = distinct !DILexicalBlock(scope: !722, file: !3, line: 479, column: 5)
!729 = !DILocation(line: 479, column: 5, scope: !728)
!730 = !{i32 -2146652978}
!731 = distinct !{!731, !701, !732}
!732 = !DILocation(line: 480, column: 4, scope: !702)
!733 = !DILocation(line: 482, column: 3, scope: !702)
!734 = !DILocation(line: 482, column: 14, scope: !735)
!735 = distinct !DILexicalBlock(scope: !698, file: !3, line: 482, column: 14)
!736 = !DILocation(line: 482, column: 23, scope: !735)
!737 = !DILocation(line: 482, column: 14, scope: !698)
!738 = !DILocation(line: 484, column: 4, scope: !739)
!739 = distinct !DILexicalBlock(scope: !735, file: !3, line: 482, column: 29)
!740 = !DILocation(line: 484, column: 11, scope: !739)
!741 = !DILocation(line: 484, column: 20, scope: !739)
!742 = !DILocation(line: 485, column: 5, scope: !743)
!743 = distinct !DILexicalBlock(scope: !739, file: !3, line: 484, column: 28)
!744 = !DILocation(line: 485, column: 5, scope: !745)
!745 = distinct !DILexicalBlock(scope: !746, file: !3, line: 485, column: 5)
!746 = distinct !DILexicalBlock(scope: !743, file: !3, line: 485, column: 5)
!747 = !DILocation(line: 485, column: 5, scope: !746)
!748 = !DILocation(line: 485, column: 5, scope: !749)
!749 = distinct !DILexicalBlock(scope: !745, file: !3, line: 485, column: 5)
!750 = !DILocalVariable(name: "__x", scope: !751, file: !3, line: 485, type: !6)
!751 = distinct !DILexicalBlock(scope: !749, file: !3, line: 485, column: 5)
!752 = !DILocation(line: 485, column: 5, scope: !751)
!753 = !{i32 -2146650755}
!754 = !DILocalVariable(name: "__x", scope: !755, file: !3, line: 485, type: !6)
!755 = distinct !DILexicalBlock(scope: !749, file: !3, line: 485, column: 5)
!756 = !DILocation(line: 485, column: 5, scope: !755)
!757 = !{i32 -2146650630}
!758 = !DILocation(line: 485, column: 5, scope: !759)
!759 = distinct !DILexicalBlock(scope: !745, file: !3, line: 485, column: 5)
!760 = !DILocalVariable(name: "__x", scope: !761, file: !3, line: 485, type: !6)
!761 = distinct !DILexicalBlock(scope: !759, file: !3, line: 485, column: 5)
!762 = !DILocation(line: 485, column: 5, scope: !761)
!763 = !{i32 -2146650498}
!764 = !DILocalVariable(name: "__x", scope: !765, file: !3, line: 485, type: !6)
!765 = distinct !DILexicalBlock(scope: !759, file: !3, line: 485, column: 5)
!766 = !DILocation(line: 485, column: 5, scope: !765)
!767 = !{i32 -2146650373}
!768 = distinct !{!768, !738, !769}
!769 = !DILocation(line: 486, column: 4, scope: !739)
!770 = !DILocation(line: 488, column: 3, scope: !739)
!771 = !DILocation(line: 490, column: 4, scope: !772)
!772 = distinct !DILexicalBlock(scope: !735, file: !3, line: 488, column: 10)
!773 = distinct !{!773, !485, !774}
!774 = !DILocation(line: 493, column: 2, scope: !453)
!775 = !DILocation(line: 496, column: 2, scope: !453)
!776 = !DILocation(line: 497, column: 1, scope: !453)
