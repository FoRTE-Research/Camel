; ModuleID = 'camel_bc_mod.bc'
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
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !456
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !457
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !458
  call void @camel_init(), !dbg !459
  call void @task_init(), !dbg !460
  br label %while.body, !dbg !461

while.body:                                       ; preds = %entry, %if.end81
  call void @task_select_func(), !dbg !462
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !464
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !464
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !464
  %1 = load i16, i16* %func, align 2, !dbg !464
  %cmp = icmp eq i16 %1, 1, !dbg !466
  br i1 %cmp, label %if.then, label %if.else, !dbg !467

if.then:                                          ; preds = %while.body
  br label %while.cond1, !dbg !468

while.cond1:                                      ; preds = %while.body4, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !470
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !470
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 9, !dbg !470
  %3 = load i16, i16* %iter, align 2, !dbg !470
  %cmp3 = icmp ult i16 %3, 100, !dbg !471
  br i1 %cmp3, label %while.body4, label %while.end, !dbg !468

while.body4:                                      ; preds = %while.cond1
  call void @task_bit_count(), !dbg !472
  br label %while.cond1, !dbg !468, !llvm.loop !474

while.end:                                        ; preds = %while.cond1
  br label %if.end81, !dbg !476

if.else:                                          ; preds = %while.body
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !477
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !477
  %func6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 7, !dbg !477
  %5 = load i16, i16* %func6, align 2, !dbg !477
  %cmp7 = icmp eq i16 %5, 2, !dbg !479
  br i1 %cmp7, label %if.then8, label %if.else15, !dbg !480

if.then8:                                         ; preds = %if.else
  br label %while.cond9, !dbg !481

while.cond9:                                      ; preds = %while.body13, %if.then8
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !483
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !483
  %iter11 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 9, !dbg !483
  %7 = load i16, i16* %iter11, align 2, !dbg !483
  %cmp12 = icmp ult i16 %7, 100, !dbg !484
  br i1 %cmp12, label %while.body13, label %while.end14, !dbg !481

while.body13:                                     ; preds = %while.cond9
  call void @task_bitcount(), !dbg !485
  br label %while.cond9, !dbg !481, !llvm.loop !487

while.end14:                                      ; preds = %while.cond9
  br label %if.end80, !dbg !489

if.else15:                                        ; preds = %if.else
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !490
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !490
  %func17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 7, !dbg !490
  %9 = load i16, i16* %func17, align 2, !dbg !490
  %cmp18 = icmp eq i16 %9, 3, !dbg !492
  br i1 %cmp18, label %if.then19, label %if.else26, !dbg !493

if.then19:                                        ; preds = %if.else15
  br label %while.cond20, !dbg !494

while.cond20:                                     ; preds = %while.body24, %if.then19
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !496
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !496
  %iter22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !496
  %11 = load i16, i16* %iter22, align 2, !dbg !496
  %cmp23 = icmp ult i16 %11, 100, !dbg !497
  br i1 %cmp23, label %while.body24, label %while.end25, !dbg !494

while.body24:                                     ; preds = %while.cond20
  call void @task_ntbl_bitcnt(), !dbg !498
  br label %while.cond20, !dbg !494, !llvm.loop !500

while.end25:                                      ; preds = %while.cond20
  br label %if.end79, !dbg !502

if.else26:                                        ; preds = %if.else15
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !503
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !503
  %func28 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 7, !dbg !503
  %13 = load i16, i16* %func28, align 2, !dbg !503
  %cmp29 = icmp eq i16 %13, 4, !dbg !505
  br i1 %cmp29, label %if.then30, label %if.else37, !dbg !506

if.then30:                                        ; preds = %if.else26
  br label %while.cond31, !dbg !507

while.cond31:                                     ; preds = %while.body35, %if.then30
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !509
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !509
  %iter33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 9, !dbg !509
  %15 = load i16, i16* %iter33, align 2, !dbg !509
  %cmp34 = icmp ult i16 %15, 100, !dbg !510
  br i1 %cmp34, label %while.body35, label %while.end36, !dbg !507

while.body35:                                     ; preds = %while.cond31
  call void @task_ntbl_bitcount(), !dbg !511
  br label %while.cond31, !dbg !507, !llvm.loop !513

while.end36:                                      ; preds = %while.cond31
  br label %if.end78, !dbg !515

if.else37:                                        ; preds = %if.else26
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !516
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !516
  %func39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 7, !dbg !516
  %17 = load i16, i16* %func39, align 2, !dbg !516
  %cmp40 = icmp eq i16 %17, 5, !dbg !518
  br i1 %cmp40, label %if.then41, label %if.else48, !dbg !519

if.then41:                                        ; preds = %if.else37
  br label %while.cond42, !dbg !520

while.cond42:                                     ; preds = %while.body46, %if.then41
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !522
  %globals43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !522
  %iter44 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals43, i32 0, i32 9, !dbg !522
  %19 = load i16, i16* %iter44, align 2, !dbg !522
  %cmp45 = icmp ult i16 %19, 100, !dbg !523
  br i1 %cmp45, label %while.body46, label %while.end47, !dbg !520

while.body46:                                     ; preds = %while.cond42
  call void @task_BW_btbl_bitcount(), !dbg !524
  br label %while.cond42, !dbg !520, !llvm.loop !526

while.end47:                                      ; preds = %while.cond42
  br label %if.end77, !dbg !528

if.else48:                                        ; preds = %if.else37
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !529
  %globals49 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !529
  %func50 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals49, i32 0, i32 7, !dbg !529
  %21 = load i16, i16* %func50, align 2, !dbg !529
  %cmp51 = icmp eq i16 %21, 6, !dbg !531
  br i1 %cmp51, label %if.then52, label %if.else59, !dbg !532

if.then52:                                        ; preds = %if.else48
  br label %while.cond53, !dbg !533

while.cond53:                                     ; preds = %while.body57, %if.then52
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !535
  %globals54 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !535
  %iter55 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals54, i32 0, i32 9, !dbg !535
  %23 = load i16, i16* %iter55, align 2, !dbg !535
  %cmp56 = icmp ult i16 %23, 100, !dbg !536
  br i1 %cmp56, label %while.body57, label %while.end58, !dbg !533

while.body57:                                     ; preds = %while.cond53
  call void @task_AR_btbl_bitcount(), !dbg !537
  br label %while.cond53, !dbg !533, !llvm.loop !539

while.end58:                                      ; preds = %while.cond53
  br label %if.end76, !dbg !541

if.else59:                                        ; preds = %if.else48
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !542
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !542
  %func61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 7, !dbg !542
  %25 = load i16, i16* %func61, align 2, !dbg !542
  %cmp62 = icmp eq i16 %25, 7, !dbg !544
  br i1 %cmp62, label %if.then63, label %if.else70, !dbg !545

if.then63:                                        ; preds = %if.else59
  br label %while.cond64, !dbg !546

while.cond64:                                     ; preds = %while.body68, %if.then63
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !548
  %globals65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !548
  %iter66 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals65, i32 0, i32 9, !dbg !548
  %27 = load i16, i16* %iter66, align 2, !dbg !548
  %cmp67 = icmp ult i16 %27, 100, !dbg !549
  br i1 %cmp67, label %while.body68, label %while.end69, !dbg !546

while.body68:                                     ; preds = %while.cond64
  call void @task_bit_shifter(), !dbg !550
  br label %while.cond64, !dbg !546, !llvm.loop !552

while.end69:                                      ; preds = %while.cond64
  br label %if.end75, !dbg !554

if.else70:                                        ; preds = %if.else59
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !555
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !555
  %func72 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals71, i32 0, i32 7, !dbg !555
  %29 = load i16, i16* %func72, align 2, !dbg !555
  %cmp73 = icmp eq i16 %29, 8, !dbg !557
  br i1 %cmp73, label %if.then74, label %if.end, !dbg !558

if.then74:                                        ; preds = %if.else70
  call void @task_done(), !dbg !559
  br label %if.end, !dbg !561

if.end:                                           ; preds = %if.then74, %if.else70
  br label %if.end75

if.end75:                                         ; preds = %if.end, %while.end69
  br label %if.end76

if.end76:                                         ; preds = %if.end75, %while.end58
  br label %if.end77

if.end77:                                         ; preds = %if.end76, %while.end47
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %while.end36
  br label %if.end79

if.end79:                                         ; preds = %if.end78, %while.end25
  br label %if.end80

if.end80:                                         ; preds = %if.end79, %while.end14
  br label %if.end81

if.end81:                                         ; preds = %if.end80, %while.end
  br label %while.body, !dbg !461, !llvm.loop !562
}

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
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 113, type: !65, isLocal: false, isDefinition: true)
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
!17 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 418, type: !18, isLocal: true, isDefinition: true)
!18 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 16)
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DIGlobalVariableExpression(var: !22, expr: !DIExpression())
!22 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 23, type: !23, isLocal: false, isDefinition: true)
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !8, line: 26, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !10, line: 43, baseType: !25)
!25 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 24, type: !23, isLocal: false, isDefinition: true)
!28 = !DIGlobalVariableExpression(var: !29, expr: !DIExpression())
!29 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 120, type: !30, isLocal: false, isDefinition: true)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 16)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 106, baseType: !32)
!32 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 101, size: 368, elements: !33)
!33 = !{!34, !39, !53}
!34 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !32, file: !3, line: 103, baseType: !35, size: 176)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !36, size: 176, elements: !37)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 20, baseType: !23)
!37 = !{!38}
!38 = !DISubrange(count: 11)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !32, file: !3, line: 104, baseType: !40, size: 176, offset: 176)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 98, baseType: !41)
!41 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 84, size: 176, elements: !42)
!42 = !{!43, !44, !45, !46, !47, !48, !49, !50, !51, !52}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "n_0", scope: !41, file: !3, line: 87, baseType: !6, size: 16)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "n_1", scope: !41, file: !3, line: 88, baseType: !6, size: 16, offset: 16)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "n_2", scope: !41, file: !3, line: 89, baseType: !6, size: 16, offset: 32)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "n_3", scope: !41, file: !3, line: 90, baseType: !6, size: 16, offset: 48)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "n_4", scope: !41, file: !3, line: 91, baseType: !6, size: 16, offset: 64)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "n_5", scope: !41, file: !3, line: 92, baseType: !6, size: 16, offset: 80)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "n_6", scope: !41, file: !3, line: 93, baseType: !6, size: 16, offset: 96)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "func", scope: !41, file: !3, line: 94, baseType: !6, size: 16, offset: 112)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "seed", scope: !41, file: !3, line: 95, baseType: !7, size: 32, offset: 128)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "iter", scope: !41, file: !3, line: 96, baseType: !6, size: 16, offset: 160)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !32, file: !3, line: 105, baseType: !23, size: 16, offset: 352)
!54 = !DIGlobalVariableExpression(var: !55, expr: !DIExpression())
!55 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 120, type: !30, isLocal: false, isDefinition: true)
!56 = !DIGlobalVariableExpression(var: !57, expr: !DIExpression())
!57 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 149, type: !58, isLocal: false, isDefinition: true)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !23, size: 176, elements: !37)
!59 = !DIGlobalVariableExpression(var: !60, expr: !DIExpression())
!60 = distinct !DIGlobalVariable(name: "bits", scope: !2, file: !3, line: 194, type: !61, isLocal: true, isDefinition: true)
!61 = !DICompositeType(tag: DW_TAG_array_type, baseType: !62, size: 2048, elements: !63)
!62 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!63 = !{!64}
!64 = !DISubrange(count: 256)
!65 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 108, size: 752, elements: !66)
!66 = !{!67, !68, !69}
!67 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !65, file: !3, line: 110, baseType: !23, size: 16)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !65, file: !3, line: 111, baseType: !31, size: 368, offset: 16)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !65, file: !3, line: 112, baseType: !31, size: 368, offset: 384)
!70 = !{i32 2, !"Dwarf Version", i32 4}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 2}
!73 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!74 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 122, type: !19, scopeLine: 122, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 123, column: 10, scope: !74)
!76 = !DILocation(line: 125, column: 9, scope: !74)
!77 = !DILocation(line: 127, column: 9, scope: !74)
!78 = !DILocation(line: 132, column: 11, scope: !74)
!79 = !DILocation(line: 137, column: 12, scope: !74)
!80 = !DILocation(line: 138, column: 10, scope: !74)
!81 = !DILocation(line: 139, column: 10, scope: !74)
!82 = !DILocation(line: 141, column: 10, scope: !74)
!83 = !DILocation(line: 142, column: 12, scope: !74)
!84 = !DILocation(line: 145, column: 10, scope: !74)
!85 = !DILocation(line: 147, column: 1, scope: !74)
!86 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 151, type: !19, scopeLine: 151, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!87 = !DILocation(line: 152, column: 14, scope: !88)
!88 = distinct !DILexicalBlock(scope: !86, file: !3, line: 152, column: 8)
!89 = !DILocation(line: 152, column: 19, scope: !88)
!90 = !DILocation(line: 152, column: 8, scope: !86)
!91 = !DILocation(line: 153, column: 14, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !3, line: 152, column: 34)
!93 = !DILocation(line: 154, column: 16, scope: !92)
!94 = !DILocation(line: 155, column: 5, scope: !92)
!95 = !DILocation(line: 155, column: 21, scope: !96)
!96 = distinct !DILexicalBlock(scope: !88, file: !3, line: 155, column: 15)
!97 = !DILocation(line: 155, column: 26, scope: !96)
!98 = !DILocation(line: 155, column: 15, scope: !88)
!99 = !DILocation(line: 156, column: 14, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !3, line: 155, column: 41)
!101 = !DILocation(line: 157, column: 16, scope: !100)
!102 = !DILocation(line: 158, column: 5, scope: !100)
!103 = !DILocation(line: 159, column: 9, scope: !104)
!104 = distinct !DILexicalBlock(scope: !96, file: !3, line: 158, column: 12)
!105 = !DILocation(line: 176, column: 3, scope: !106)
!106 = distinct !DILexicalBlock(scope: !86, file: !3, line: 176, column: 3)
!107 = !{i32 -2146655277}
!108 = !DILocalVariable(name: "__x", scope: !109, file: !3, line: 178, type: !6)
!109 = distinct !DILexicalBlock(scope: !86, file: !3, line: 178, column: 33)
!110 = !DILocation(line: 178, column: 33, scope: !109)
!111 = !{i32 -2146655041}
!112 = !DILocation(line: 178, column: 51, scope: !86)
!113 = !DILocation(line: 178, column: 33, scope: !86)
!114 = !DILocalVariable(name: "__x", scope: !115, file: !3, line: 178, type: !6)
!115 = distinct !DILexicalBlock(scope: !86, file: !3, line: 178, column: 65)
!116 = !DILocation(line: 178, column: 65, scope: !115)
!117 = !{i32 -2146654916}
!118 = !DILocation(line: 178, column: 83, scope: !86)
!119 = !DILocation(line: 178, column: 63, scope: !86)
!120 = !DILocation(line: 178, column: 19, scope: !86)
!121 = !DILocation(line: 178, column: 17, scope: !86)
!122 = !DILocation(line: 179, column: 37, scope: !86)
!123 = !DILocation(line: 179, column: 71, scope: !86)
!124 = !DILocation(line: 179, column: 23, scope: !86)
!125 = !DILocation(line: 179, column: 21, scope: !86)
!126 = !DILocation(line: 182, column: 6, scope: !127)
!127 = distinct !DILexicalBlock(scope: !86, file: !3, line: 182, column: 6)
!128 = !DILocation(line: 182, column: 27, scope: !127)
!129 = !DILocation(line: 182, column: 33, scope: !127)
!130 = !DILocation(line: 182, column: 24, scope: !127)
!131 = !DILocation(line: 182, column: 6, scope: !86)
!132 = !DILocation(line: 183, column: 11, scope: !133)
!133 = distinct !DILexicalBlock(scope: !127, file: !3, line: 182, column: 51)
!134 = !DILocation(line: 183, column: 4, scope: !133)
!135 = !DILocation(line: 183, column: 19, scope: !133)
!136 = !DILocation(line: 184, column: 4, scope: !133)
!137 = !DILocation(line: 185, column: 24, scope: !133)
!138 = !DILocation(line: 185, column: 30, scope: !133)
!139 = !DILocation(line: 185, column: 4, scope: !133)
!140 = !DILocation(line: 186, column: 3, scope: !133)
!141 = !DILocation(line: 187, column: 4, scope: !142)
!142 = distinct !DILexicalBlock(scope: !127, file: !3, line: 186, column: 9)
!143 = !DILocation(line: 190, column: 1, scope: !86)
!144 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 214, type: !19, scopeLine: 214, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!145 = !DILocation(line: 216, column: 2, scope: !144)
!146 = !DILocation(line: 216, column: 11, scope: !144)
!147 = !DILocation(line: 217, column: 2, scope: !144)
!148 = !DILocation(line: 217, column: 10, scope: !144)
!149 = !DILocation(line: 218, column: 2, scope: !144)
!150 = !DILocation(line: 218, column: 10, scope: !144)
!151 = !DILocation(line: 219, column: 2, scope: !144)
!152 = !DILocation(line: 219, column: 10, scope: !144)
!153 = !DILocation(line: 220, column: 2, scope: !144)
!154 = !DILocation(line: 220, column: 10, scope: !144)
!155 = !DILocation(line: 221, column: 2, scope: !144)
!156 = !DILocation(line: 221, column: 10, scope: !144)
!157 = !DILocation(line: 222, column: 2, scope: !144)
!158 = !DILocation(line: 222, column: 10, scope: !144)
!159 = !DILocation(line: 223, column: 2, scope: !144)
!160 = !DILocation(line: 223, column: 10, scope: !144)
!161 = !DILocation(line: 225, column: 1, scope: !144)
!162 = distinct !DISubprogram(name: "task_select_func", scope: !3, file: !3, line: 227, type: !19, scopeLine: 227, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocation(line: 229, column: 2, scope: !162)
!164 = !DILocation(line: 229, column: 11, scope: !162)
!165 = !DILocation(line: 230, column: 2, scope: !162)
!166 = !DILocation(line: 230, column: 11, scope: !162)
!167 = !DILocation(line: 231, column: 2, scope: !162)
!168 = !DILocation(line: 231, column: 10, scope: !162)
!169 = !DILocation(line: 232, column: 1, scope: !162)
!170 = distinct !DISubprogram(name: "task_bit_count", scope: !3, file: !3, line: 233, type: !19, scopeLine: 233, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!171 = !DILocalVariable(name: "tmp_seed", scope: !170, file: !3, line: 235, type: !7)
!172 = !DILocation(line: 235, column: 11, scope: !170)
!173 = !DILocation(line: 235, column: 22, scope: !170)
!174 = !DILocation(line: 236, column: 13, scope: !170)
!175 = !DILocation(line: 236, column: 22, scope: !170)
!176 = !DILocation(line: 236, column: 2, scope: !170)
!177 = !DILocation(line: 236, column: 11, scope: !170)
!178 = !DILocalVariable(name: "temp", scope: !170, file: !3, line: 237, type: !6)
!179 = !DILocation(line: 237, column: 11, scope: !170)
!180 = !DILocation(line: 238, column: 5, scope: !181)
!181 = distinct !DILexicalBlock(scope: !170, file: !3, line: 238, column: 5)
!182 = !DILocation(line: 238, column: 5, scope: !170)
!183 = !DILocation(line: 238, column: 15, scope: !181)
!184 = !DILocation(line: 239, column: 7, scope: !181)
!185 = !DILocation(line: 239, column: 3, scope: !181)
!186 = !DILocation(line: 240, column: 26, scope: !181)
!187 = !DILocation(line: 240, column: 36, scope: !181)
!188 = !DILocation(line: 240, column: 44, scope: !181)
!189 = !DILocation(line: 240, column: 34, scope: !181)
!190 = !DILocation(line: 240, column: 24, scope: !181)
!191 = !DILocation(line: 240, column: 11, scope: !181)
!192 = distinct !{!192, !183, !193}
!193 = !DILocation(line: 240, column: 48, scope: !181)
!194 = !DILocation(line: 241, column: 13, scope: !170)
!195 = !DILocation(line: 241, column: 2, scope: !170)
!196 = !DILocation(line: 241, column: 10, scope: !170)
!197 = !DILocation(line: 242, column: 2, scope: !170)
!198 = !DILocation(line: 242, column: 10, scope: !170)
!199 = !DILocation(line: 244, column: 1, scope: !170)
!200 = distinct !DISubprogram(name: "task_bitcount", scope: !3, file: !3, line: 245, type: !19, scopeLine: 245, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!201 = !DILocalVariable(name: "tmp_seed", scope: !200, file: !3, line: 247, type: !7)
!202 = !DILocation(line: 247, column: 11, scope: !200)
!203 = !DILocation(line: 247, column: 22, scope: !200)
!204 = !DILocation(line: 248, column: 13, scope: !200)
!205 = !DILocation(line: 248, column: 22, scope: !200)
!206 = !DILocation(line: 248, column: 2, scope: !200)
!207 = !DILocation(line: 248, column: 11, scope: !200)
!208 = !DILocation(line: 249, column: 15, scope: !200)
!209 = !DILocation(line: 249, column: 24, scope: !200)
!210 = !DILocation(line: 249, column: 39, scope: !200)
!211 = !DILocation(line: 249, column: 49, scope: !200)
!212 = !DILocation(line: 249, column: 58, scope: !200)
!213 = !DILocation(line: 249, column: 46, scope: !200)
!214 = !DILocation(line: 249, column: 11, scope: !200)
!215 = !DILocation(line: 250, column: 15, scope: !200)
!216 = !DILocation(line: 250, column: 24, scope: !200)
!217 = !DILocation(line: 250, column: 39, scope: !200)
!218 = !DILocation(line: 250, column: 49, scope: !200)
!219 = !DILocation(line: 250, column: 58, scope: !200)
!220 = !DILocation(line: 250, column: 46, scope: !200)
!221 = !DILocation(line: 250, column: 11, scope: !200)
!222 = !DILocation(line: 251, column: 15, scope: !200)
!223 = !DILocation(line: 251, column: 24, scope: !200)
!224 = !DILocation(line: 251, column: 39, scope: !200)
!225 = !DILocation(line: 251, column: 49, scope: !200)
!226 = !DILocation(line: 251, column: 58, scope: !200)
!227 = !DILocation(line: 251, column: 46, scope: !200)
!228 = !DILocation(line: 251, column: 11, scope: !200)
!229 = !DILocation(line: 252, column: 15, scope: !200)
!230 = !DILocation(line: 252, column: 24, scope: !200)
!231 = !DILocation(line: 252, column: 39, scope: !200)
!232 = !DILocation(line: 252, column: 49, scope: !200)
!233 = !DILocation(line: 252, column: 58, scope: !200)
!234 = !DILocation(line: 252, column: 46, scope: !200)
!235 = !DILocation(line: 252, column: 11, scope: !200)
!236 = !DILocation(line: 253, column: 15, scope: !200)
!237 = !DILocation(line: 253, column: 24, scope: !200)
!238 = !DILocation(line: 253, column: 39, scope: !200)
!239 = !DILocation(line: 253, column: 49, scope: !200)
!240 = !DILocation(line: 253, column: 58, scope: !200)
!241 = !DILocation(line: 253, column: 46, scope: !200)
!242 = !DILocation(line: 253, column: 11, scope: !200)
!243 = !DILocation(line: 254, column: 18, scope: !200)
!244 = !DILocation(line: 254, column: 13, scope: !200)
!245 = !DILocation(line: 254, column: 2, scope: !200)
!246 = !DILocation(line: 254, column: 10, scope: !200)
!247 = !DILocation(line: 255, column: 2, scope: !200)
!248 = !DILocation(line: 255, column: 10, scope: !200)
!249 = !DILocation(line: 257, column: 1, scope: !200)
!250 = distinct !DISubprogram(name: "recursive_cnt", scope: !3, file: !3, line: 258, type: !251, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!251 = !DISubroutineType(types: !252)
!252 = !{!12, !7}
!253 = !DILocalVariable(name: "x", arg: 1, scope: !250, file: !3, line: 258, type: !7)
!254 = !DILocation(line: 258, column: 28, scope: !250)
!255 = !DILocalVariable(name: "cnt", scope: !250, file: !3, line: 259, type: !12)
!256 = !DILocation(line: 259, column: 6, scope: !250)
!257 = !DILocation(line: 259, column: 23, scope: !250)
!258 = !DILocation(line: 259, column: 25, scope: !250)
!259 = !DILocation(line: 259, column: 17, scope: !250)
!260 = !DILocation(line: 259, column: 12, scope: !250)
!261 = !DILocation(line: 261, column: 15, scope: !262)
!262 = distinct !DILexicalBlock(scope: !250, file: !3, line: 261, column: 6)
!263 = !DILocation(line: 261, column: 9, scope: !262)
!264 = !DILocation(line: 261, column: 6, scope: !250)
!265 = !DILocation(line: 262, column: 24, scope: !262)
!266 = !DILocation(line: 262, column: 10, scope: !262)
!267 = !DILocation(line: 262, column: 7, scope: !262)
!268 = !DILocation(line: 262, column: 3, scope: !262)
!269 = !DILocation(line: 264, column: 9, scope: !250)
!270 = !DILocation(line: 264, column: 2, scope: !250)
!271 = distinct !DISubprogram(name: "task_ntbl_bitcnt", scope: !3, file: !3, line: 266, type: !19, scopeLine: 266, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!272 = !DILocation(line: 268, column: 27, scope: !271)
!273 = !DILocation(line: 268, column: 13, scope: !271)
!274 = !DILocation(line: 268, column: 2, scope: !271)
!275 = !DILocation(line: 268, column: 10, scope: !271)
!276 = !DILocation(line: 269, column: 13, scope: !271)
!277 = !DILocation(line: 269, column: 22, scope: !271)
!278 = !DILocation(line: 269, column: 2, scope: !271)
!279 = !DILocation(line: 269, column: 11, scope: !271)
!280 = !DILocation(line: 270, column: 2, scope: !271)
!281 = !DILocation(line: 270, column: 10, scope: !271)
!282 = !DILocation(line: 272, column: 1, scope: !271)
!283 = distinct !DISubprogram(name: "task_ntbl_bitcount", scope: !3, file: !3, line: 273, type: !19, scopeLine: 273, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!284 = !DILocation(line: 275, column: 26, scope: !283)
!285 = !DILocation(line: 275, column: 35, scope: !283)
!286 = !DILocation(line: 275, column: 19, scope: !283)
!287 = !DILocation(line: 275, column: 13, scope: !283)
!288 = !DILocation(line: 276, column: 16, scope: !283)
!289 = !DILocation(line: 276, column: 25, scope: !283)
!290 = !DILocation(line: 276, column: 41, scope: !283)
!291 = !DILocation(line: 276, column: 9, scope: !283)
!292 = !DILocation(line: 276, column: 3, scope: !283)
!293 = !DILocation(line: 275, column: 59, scope: !283)
!294 = !DILocation(line: 277, column: 16, scope: !283)
!295 = !DILocation(line: 277, column: 25, scope: !283)
!296 = !DILocation(line: 277, column: 41, scope: !283)
!297 = !DILocation(line: 277, column: 9, scope: !283)
!298 = !DILocation(line: 277, column: 3, scope: !283)
!299 = !DILocation(line: 276, column: 49, scope: !283)
!300 = !DILocation(line: 278, column: 16, scope: !283)
!301 = !DILocation(line: 278, column: 25, scope: !283)
!302 = !DILocation(line: 278, column: 41, scope: !283)
!303 = !DILocation(line: 278, column: 9, scope: !283)
!304 = !DILocation(line: 278, column: 3, scope: !283)
!305 = !DILocation(line: 277, column: 49, scope: !283)
!306 = !DILocation(line: 279, column: 16, scope: !283)
!307 = !DILocation(line: 279, column: 25, scope: !283)
!308 = !DILocation(line: 279, column: 41, scope: !283)
!309 = !DILocation(line: 279, column: 9, scope: !283)
!310 = !DILocation(line: 279, column: 3, scope: !283)
!311 = !DILocation(line: 278, column: 49, scope: !283)
!312 = !DILocation(line: 280, column: 16, scope: !283)
!313 = !DILocation(line: 280, column: 25, scope: !283)
!314 = !DILocation(line: 280, column: 41, scope: !283)
!315 = !DILocation(line: 280, column: 9, scope: !283)
!316 = !DILocation(line: 280, column: 3, scope: !283)
!317 = !DILocation(line: 279, column: 49, scope: !283)
!318 = !DILocation(line: 281, column: 16, scope: !283)
!319 = !DILocation(line: 281, column: 25, scope: !283)
!320 = !DILocation(line: 281, column: 41, scope: !283)
!321 = !DILocation(line: 281, column: 9, scope: !283)
!322 = !DILocation(line: 281, column: 3, scope: !283)
!323 = !DILocation(line: 280, column: 49, scope: !283)
!324 = !DILocation(line: 282, column: 16, scope: !283)
!325 = !DILocation(line: 282, column: 25, scope: !283)
!326 = !DILocation(line: 282, column: 41, scope: !283)
!327 = !DILocation(line: 282, column: 9, scope: !283)
!328 = !DILocation(line: 282, column: 3, scope: !283)
!329 = !DILocation(line: 281, column: 49, scope: !283)
!330 = !DILocation(line: 275, column: 2, scope: !283)
!331 = !DILocation(line: 275, column: 10, scope: !283)
!332 = !DILocation(line: 283, column: 13, scope: !283)
!333 = !DILocation(line: 283, column: 22, scope: !283)
!334 = !DILocation(line: 283, column: 2, scope: !283)
!335 = !DILocation(line: 283, column: 11, scope: !283)
!336 = !DILocation(line: 284, column: 2, scope: !283)
!337 = !DILocation(line: 284, column: 10, scope: !283)
!338 = !DILocation(line: 286, column: 1, scope: !283)
!339 = distinct !DISubprogram(name: "task_BW_btbl_bitcount", scope: !3, file: !3, line: 287, type: !19, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!340 = !DILocalVariable(name: "U", scope: !339, file: !3, line: 293, type: !341)
!341 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !339, file: !3, line: 289, size: 32, elements: !342)
!342 = !{!343, !347}
!343 = !DIDerivedType(tag: DW_TAG_member, name: "ch", scope: !341, file: !3, line: 291, baseType: !344, size: 32)
!344 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32, elements: !345)
!345 = !{!346}
!346 = !DISubrange(count: 4)
!347 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !341, file: !3, line: 292, baseType: !348, size: 32)
!348 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!349 = !DILocation(line: 293, column: 4, scope: !339)
!350 = !DILocation(line: 295, column: 8, scope: !339)
!351 = !DILocation(line: 295, column: 4, scope: !339)
!352 = !DILocation(line: 295, column: 6, scope: !339)
!353 = !DILocation(line: 297, column: 21, scope: !339)
!354 = !DILocation(line: 297, column: 19, scope: !339)
!355 = !DILocation(line: 297, column: 13, scope: !339)
!356 = !DILocation(line: 297, column: 39, scope: !339)
!357 = !DILocation(line: 297, column: 37, scope: !339)
!358 = !DILocation(line: 297, column: 31, scope: !339)
!359 = !DILocation(line: 297, column: 29, scope: !339)
!360 = !DILocation(line: 298, column: 11, scope: !339)
!361 = !DILocation(line: 298, column: 9, scope: !339)
!362 = !DILocation(line: 298, column: 3, scope: !339)
!363 = !DILocation(line: 297, column: 47, scope: !339)
!364 = !DILocation(line: 298, column: 29, scope: !339)
!365 = !DILocation(line: 298, column: 27, scope: !339)
!366 = !DILocation(line: 298, column: 21, scope: !339)
!367 = !DILocation(line: 298, column: 19, scope: !339)
!368 = !DILocation(line: 297, column: 2, scope: !339)
!369 = !DILocation(line: 297, column: 10, scope: !339)
!370 = !DILocation(line: 299, column: 13, scope: !339)
!371 = !DILocation(line: 299, column: 22, scope: !339)
!372 = !DILocation(line: 299, column: 2, scope: !339)
!373 = !DILocation(line: 299, column: 11, scope: !339)
!374 = !DILocation(line: 300, column: 2, scope: !339)
!375 = !DILocation(line: 300, column: 10, scope: !339)
!376 = !DILocation(line: 302, column: 1, scope: !339)
!377 = distinct !DISubprogram(name: "task_AR_btbl_bitcount", scope: !3, file: !3, line: 303, type: !19, scopeLine: 303, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!378 = !DILocalVariable(name: "Ptr", scope: !377, file: !3, line: 305, type: !13)
!379 = !DILocation(line: 305, column: 18, scope: !377)
!380 = !DILocation(line: 305, column: 43, scope: !377)
!381 = !DILocation(line: 305, column: 24, scope: !377)
!382 = !DILocalVariable(name: "Accu", scope: !377, file: !3, line: 306, type: !12)
!383 = !DILocation(line: 306, column: 6, scope: !377)
!384 = !DILocation(line: 308, column: 20, scope: !377)
!385 = !DILocation(line: 308, column: 16, scope: !377)
!386 = !DILocation(line: 308, column: 10, scope: !377)
!387 = !DILocation(line: 308, column: 8, scope: !377)
!388 = !DILocation(line: 309, column: 20, scope: !377)
!389 = !DILocation(line: 309, column: 16, scope: !377)
!390 = !DILocation(line: 309, column: 10, scope: !377)
!391 = !DILocation(line: 309, column: 7, scope: !377)
!392 = !DILocation(line: 310, column: 20, scope: !377)
!393 = !DILocation(line: 310, column: 16, scope: !377)
!394 = !DILocation(line: 310, column: 10, scope: !377)
!395 = !DILocation(line: 310, column: 7, scope: !377)
!396 = !DILocation(line: 311, column: 17, scope: !377)
!397 = !DILocation(line: 311, column: 16, scope: !377)
!398 = !DILocation(line: 311, column: 10, scope: !377)
!399 = !DILocation(line: 311, column: 7, scope: !377)
!400 = !DILocation(line: 312, column: 12, scope: !377)
!401 = !DILocation(line: 312, column: 2, scope: !377)
!402 = !DILocation(line: 312, column: 9, scope: !377)
!403 = !DILocation(line: 313, column: 13, scope: !377)
!404 = !DILocation(line: 313, column: 22, scope: !377)
!405 = !DILocation(line: 313, column: 2, scope: !377)
!406 = !DILocation(line: 313, column: 11, scope: !377)
!407 = !DILocation(line: 314, column: 2, scope: !377)
!408 = !DILocation(line: 314, column: 10, scope: !377)
!409 = !DILocation(line: 316, column: 1, scope: !377)
!410 = distinct !DISubprogram(name: "task_bit_shifter", scope: !3, file: !3, line: 317, type: !19, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!411 = !DILocalVariable(name: "i", scope: !410, file: !3, line: 319, type: !12)
!412 = !DILocation(line: 319, column: 6, scope: !410)
!413 = !DILocalVariable(name: "nn", scope: !410, file: !3, line: 319, type: !12)
!414 = !DILocation(line: 319, column: 9, scope: !410)
!415 = !DILocalVariable(name: "tmp_seed", scope: !410, file: !3, line: 320, type: !7)
!416 = !DILocation(line: 320, column: 11, scope: !410)
!417 = !DILocation(line: 320, column: 22, scope: !410)
!418 = !DILocation(line: 321, column: 14, scope: !419)
!419 = distinct !DILexicalBlock(scope: !410, file: !3, line: 321, column: 2)
!420 = !DILocation(line: 321, column: 9, scope: !419)
!421 = !DILocation(line: 321, column: 7, scope: !419)
!422 = !DILocation(line: 321, column: 19, scope: !423)
!423 = distinct !DILexicalBlock(scope: !419, file: !3, line: 321, column: 2)
!424 = !DILocation(line: 321, column: 28, scope: !423)
!425 = !DILocation(line: 321, column: 32, scope: !423)
!426 = !DILocation(line: 321, column: 34, scope: !423)
!427 = !DILocation(line: 0, scope: !423)
!428 = !DILocation(line: 321, column: 2, scope: !419)
!429 = !DILocation(line: 322, column: 15, scope: !423)
!430 = !DILocation(line: 322, column: 24, scope: !423)
!431 = !DILocation(line: 322, column: 9, scope: !423)
!432 = !DILocation(line: 322, column: 6, scope: !423)
!433 = !DILocation(line: 322, column: 3, scope: !423)
!434 = !DILocation(line: 321, column: 64, scope: !423)
!435 = !DILocation(line: 321, column: 78, scope: !423)
!436 = !DILocation(line: 321, column: 2, scope: !423)
!437 = distinct !{!437, !428, !438}
!438 = !DILocation(line: 322, column: 28, scope: !419)
!439 = !DILocation(line: 323, column: 13, scope: !410)
!440 = !DILocation(line: 323, column: 2, scope: !410)
!441 = !DILocation(line: 323, column: 10, scope: !410)
!442 = !DILocation(line: 324, column: 13, scope: !410)
!443 = !DILocation(line: 324, column: 22, scope: !410)
!444 = !DILocation(line: 324, column: 2, scope: !410)
!445 = !DILocation(line: 324, column: 11, scope: !410)
!446 = !DILocation(line: 326, column: 2, scope: !410)
!447 = !DILocation(line: 326, column: 10, scope: !410)
!448 = !DILocation(line: 328, column: 1, scope: !410)
!449 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 330, type: !19, scopeLine: 330, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!450 = !DILocation(line: 332, column: 2, scope: !449)
!451 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 335, type: !19, scopeLine: 335, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!452 = !DILocation(line: 337, column: 1, scope: !451)
!453 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 339, type: !454, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!454 = !DISubroutineType(types: !455)
!455 = !{!12}
!456 = !DILocation(line: 341, column: 16, scope: !453)
!457 = !DILocation(line: 342, column: 10, scope: !453)
!458 = !DILocation(line: 343, column: 12, scope: !453)
!459 = !DILocation(line: 344, column: 5, scope: !453)
!460 = !DILocation(line: 346, column: 2, scope: !453)
!461 = !DILocation(line: 348, column: 2, scope: !453)
!462 = !DILocation(line: 350, column: 3, scope: !463)
!463 = distinct !DILexicalBlock(scope: !453, file: !3, line: 348, column: 11)
!464 = !DILocation(line: 352, column: 7, scope: !465)
!465 = distinct !DILexicalBlock(scope: !463, file: !3, line: 352, column: 7)
!466 = !DILocation(line: 352, column: 17, scope: !465)
!467 = !DILocation(line: 352, column: 7, scope: !463)
!468 = !DILocation(line: 354, column: 4, scope: !469)
!469 = distinct !DILexicalBlock(scope: !465, file: !3, line: 352, column: 22)
!470 = !DILocation(line: 354, column: 11, scope: !469)
!471 = !DILocation(line: 354, column: 21, scope: !469)
!472 = !DILocation(line: 356, column: 5, scope: !473)
!473 = distinct !DILexicalBlock(scope: !469, file: !3, line: 354, column: 29)
!474 = distinct !{!474, !468, !475}
!475 = !DILocation(line: 358, column: 4, scope: !469)
!476 = !DILocation(line: 360, column: 3, scope: !469)
!477 = !DILocation(line: 360, column: 14, scope: !478)
!478 = distinct !DILexicalBlock(scope: !465, file: !3, line: 360, column: 14)
!479 = !DILocation(line: 360, column: 24, scope: !478)
!480 = !DILocation(line: 360, column: 14, scope: !465)
!481 = !DILocation(line: 362, column: 4, scope: !482)
!482 = distinct !DILexicalBlock(scope: !478, file: !3, line: 360, column: 30)
!483 = !DILocation(line: 362, column: 11, scope: !482)
!484 = !DILocation(line: 362, column: 21, scope: !482)
!485 = !DILocation(line: 364, column: 5, scope: !486)
!486 = distinct !DILexicalBlock(scope: !482, file: !3, line: 362, column: 29)
!487 = distinct !{!487, !481, !488}
!488 = !DILocation(line: 366, column: 4, scope: !482)
!489 = !DILocation(line: 368, column: 3, scope: !482)
!490 = !DILocation(line: 368, column: 14, scope: !491)
!491 = distinct !DILexicalBlock(scope: !478, file: !3, line: 368, column: 14)
!492 = !DILocation(line: 368, column: 24, scope: !491)
!493 = !DILocation(line: 368, column: 14, scope: !478)
!494 = !DILocation(line: 370, column: 4, scope: !495)
!495 = distinct !DILexicalBlock(scope: !491, file: !3, line: 368, column: 30)
!496 = !DILocation(line: 370, column: 11, scope: !495)
!497 = !DILocation(line: 370, column: 21, scope: !495)
!498 = !DILocation(line: 372, column: 5, scope: !499)
!499 = distinct !DILexicalBlock(scope: !495, file: !3, line: 370, column: 29)
!500 = distinct !{!500, !494, !501}
!501 = !DILocation(line: 374, column: 4, scope: !495)
!502 = !DILocation(line: 376, column: 3, scope: !495)
!503 = !DILocation(line: 376, column: 14, scope: !504)
!504 = distinct !DILexicalBlock(scope: !491, file: !3, line: 376, column: 14)
!505 = !DILocation(line: 376, column: 24, scope: !504)
!506 = !DILocation(line: 376, column: 14, scope: !491)
!507 = !DILocation(line: 378, column: 4, scope: !508)
!508 = distinct !DILexicalBlock(scope: !504, file: !3, line: 376, column: 30)
!509 = !DILocation(line: 378, column: 11, scope: !508)
!510 = !DILocation(line: 378, column: 21, scope: !508)
!511 = !DILocation(line: 380, column: 5, scope: !512)
!512 = distinct !DILexicalBlock(scope: !508, file: !3, line: 378, column: 29)
!513 = distinct !{!513, !507, !514}
!514 = !DILocation(line: 382, column: 4, scope: !508)
!515 = !DILocation(line: 384, column: 3, scope: !508)
!516 = !DILocation(line: 384, column: 14, scope: !517)
!517 = distinct !DILexicalBlock(scope: !504, file: !3, line: 384, column: 14)
!518 = !DILocation(line: 384, column: 24, scope: !517)
!519 = !DILocation(line: 384, column: 14, scope: !504)
!520 = !DILocation(line: 386, column: 4, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !3, line: 384, column: 30)
!522 = !DILocation(line: 386, column: 11, scope: !521)
!523 = !DILocation(line: 386, column: 21, scope: !521)
!524 = !DILocation(line: 388, column: 5, scope: !525)
!525 = distinct !DILexicalBlock(scope: !521, file: !3, line: 386, column: 29)
!526 = distinct !{!526, !520, !527}
!527 = !DILocation(line: 390, column: 4, scope: !521)
!528 = !DILocation(line: 392, column: 3, scope: !521)
!529 = !DILocation(line: 392, column: 14, scope: !530)
!530 = distinct !DILexicalBlock(scope: !517, file: !3, line: 392, column: 14)
!531 = !DILocation(line: 392, column: 24, scope: !530)
!532 = !DILocation(line: 392, column: 14, scope: !517)
!533 = !DILocation(line: 394, column: 4, scope: !534)
!534 = distinct !DILexicalBlock(scope: !530, file: !3, line: 392, column: 30)
!535 = !DILocation(line: 394, column: 11, scope: !534)
!536 = !DILocation(line: 394, column: 21, scope: !534)
!537 = !DILocation(line: 396, column: 5, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !3, line: 394, column: 29)
!539 = distinct !{!539, !533, !540}
!540 = !DILocation(line: 398, column: 4, scope: !534)
!541 = !DILocation(line: 400, column: 3, scope: !534)
!542 = !DILocation(line: 400, column: 14, scope: !543)
!543 = distinct !DILexicalBlock(scope: !530, file: !3, line: 400, column: 14)
!544 = !DILocation(line: 400, column: 24, scope: !543)
!545 = !DILocation(line: 400, column: 14, scope: !530)
!546 = !DILocation(line: 402, column: 4, scope: !547)
!547 = distinct !DILexicalBlock(scope: !543, file: !3, line: 400, column: 30)
!548 = !DILocation(line: 402, column: 11, scope: !547)
!549 = !DILocation(line: 402, column: 21, scope: !547)
!550 = !DILocation(line: 404, column: 5, scope: !551)
!551 = distinct !DILexicalBlock(scope: !547, file: !3, line: 402, column: 29)
!552 = distinct !{!552, !546, !553}
!553 = !DILocation(line: 406, column: 4, scope: !547)
!554 = !DILocation(line: 408, column: 3, scope: !547)
!555 = !DILocation(line: 408, column: 14, scope: !556)
!556 = distinct !DILexicalBlock(scope: !543, file: !3, line: 408, column: 14)
!557 = !DILocation(line: 408, column: 24, scope: !556)
!558 = !DILocation(line: 408, column: 14, scope: !543)
!559 = !DILocation(line: 410, column: 4, scope: !560)
!560 = distinct !DILexicalBlock(scope: !556, file: !3, line: 408, column: 30)
!561 = !DILocation(line: 412, column: 3, scope: !560)
!562 = distinct !{!562, !461, !563}
!563 = !DILocation(line: 413, column: 2, scope: !453)
