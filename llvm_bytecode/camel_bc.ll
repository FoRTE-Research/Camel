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
@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1, !dbg !59
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !16
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !21
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !26
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
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #4, !dbg !105, !srcloc !107
  call void @camel_init(), !dbg !108
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !109
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !110
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !109
  call void @__restore_registers(i16* %arraydecay), !dbg !111
  ret void, !dbg !112
}

declare dso_local void @__crt0_start(...) #1

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !113 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !114
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !114
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !114
  store i16 0, i16* %func, align 2, !dbg !115
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !116
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !116
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !116
  store i16 0, i16* %n_0, align 2, !dbg !117
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !118
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !118
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 1, !dbg !118
  store i16 0, i16* %n_1, align 2, !dbg !119
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !120
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !120
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2, !dbg !120
  store i16 0, i16* %n_2, align 2, !dbg !121
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !122
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !122
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3, !dbg !122
  store i16 0, i16* %n_3, align 2, !dbg !123
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !124
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !124
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4, !dbg !124
  store i16 0, i16* %n_4, align 2, !dbg !125
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !126
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !126
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5, !dbg !126
  store i16 0, i16* %n_5, align 2, !dbg !127
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !128
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !128
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6, !dbg !128
  store i16 0, i16* %n_6, align 2, !dbg !129
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_select_func() #0 !dbg !131 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !132
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !132
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !132
  store i32 4, i32* %seed, align 2, !dbg !133
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !134
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !134
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9, !dbg !134
  store i16 0, i16* %iter, align 2, !dbg !135
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !136
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !136
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7, !dbg !136
  %3 = load i16, i16* %func, align 2, !dbg !137
  %inc = add i16 %3, 1, !dbg !137
  store i16 %inc, i16* %func, align 2, !dbg !137
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_count() #0 !dbg !139 {
entry:
  %tmp_seed = alloca i32, align 2
  %temp = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !140, metadata !DIExpression()), !dbg !141
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !142
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !142
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !142
  %1 = load i32, i32* %seed, align 2, !dbg !142
  store i32 %1, i32* %tmp_seed, align 2, !dbg !141
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !143
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !143
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !143
  %3 = load i32, i32* %seed2, align 2, !dbg !143
  %add = add i32 %3, 13, !dbg !144
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !145
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !145
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !145
  store i32 %add, i32* %seed4, align 2, !dbg !146
  call void @llvm.dbg.declare(metadata i16* %temp, metadata !147, metadata !DIExpression()), !dbg !148
  store i16 0, i16* %temp, align 2, !dbg !148
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !149
  %tobool = icmp ne i32 %5, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  br label %do.body, !dbg !152

do.body:                                          ; preds = %do.cond, %if.then
  %6 = load i16, i16* %temp, align 2, !dbg !153
  %inc = add i16 %6, 1, !dbg !153
  store i16 %inc, i16* %temp, align 2, !dbg !153
  br label %do.cond, !dbg !154

do.cond:                                          ; preds = %do.body
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !155
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !156
  %sub = sub i32 %8, 1, !dbg !157
  %and = and i32 %7, %sub, !dbg !158
  store i32 %and, i32* %tmp_seed, align 2, !dbg !159
  %cmp = icmp ne i32 0, %and, !dbg !160
  br i1 %cmp, label %do.body, label %do.end, !dbg !154, !llvm.loop !161

do.end:                                           ; preds = %do.cond
  br label %if.end, !dbg !154

if.end:                                           ; preds = %do.end, %entry
  %9 = load i16, i16* %temp, align 2, !dbg !163
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !164
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !164
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0, !dbg !164
  %11 = load i16, i16* %n_0, align 2, !dbg !165
  %add6 = add i16 %11, %9, !dbg !165
  store i16 %add6, i16* %n_0, align 2, !dbg !165
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !166
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !166
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !166
  %13 = load i16, i16* %iter, align 2, !dbg !167
  %inc8 = add i16 %13, 1, !dbg !167
  store i16 %inc8, i16* %iter, align 2, !dbg !167
  ret void, !dbg !168
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bitcount() #0 !dbg !169 {
entry:
  %tmp_seed = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !170, metadata !DIExpression()), !dbg !171
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !172
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !172
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !172
  %1 = load i32, i32* %seed, align 2, !dbg !172
  store i32 %1, i32* %tmp_seed, align 2, !dbg !171
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !173
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !173
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8, !dbg !173
  %3 = load i32, i32* %seed2, align 2, !dbg !173
  %add = add i32 %3, 13, !dbg !174
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !175
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !175
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !175
  store i32 %add, i32* %seed4, align 2, !dbg !176
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !177
  %and = and i32 %5, -1431655766, !dbg !178
  %shr = lshr i32 %and, 1, !dbg !179
  %6 = load i32, i32* %tmp_seed, align 2, !dbg !180
  %and5 = and i32 %6, 1431655765, !dbg !181
  %add6 = add i32 %shr, %and5, !dbg !182
  store i32 %add6, i32* %tmp_seed, align 2, !dbg !183
  %7 = load i32, i32* %tmp_seed, align 2, !dbg !184
  %and7 = and i32 %7, -858993460, !dbg !185
  %shr8 = lshr i32 %and7, 2, !dbg !186
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !187
  %and9 = and i32 %8, 858993459, !dbg !188
  %add10 = add i32 %shr8, %and9, !dbg !189
  store i32 %add10, i32* %tmp_seed, align 2, !dbg !190
  %9 = load i32, i32* %tmp_seed, align 2, !dbg !191
  %and11 = and i32 %9, -252645136, !dbg !192
  %shr12 = lshr i32 %and11, 4, !dbg !193
  %10 = load i32, i32* %tmp_seed, align 2, !dbg !194
  %and13 = and i32 %10, 252645135, !dbg !195
  %add14 = add i32 %shr12, %and13, !dbg !196
  store i32 %add14, i32* %tmp_seed, align 2, !dbg !197
  %11 = load i32, i32* %tmp_seed, align 2, !dbg !198
  %and15 = and i32 %11, -16711936, !dbg !199
  %shr16 = lshr i32 %and15, 8, !dbg !200
  %12 = load i32, i32* %tmp_seed, align 2, !dbg !201
  %and17 = and i32 %12, 16711935, !dbg !202
  %add18 = add i32 %shr16, %and17, !dbg !203
  store i32 %add18, i32* %tmp_seed, align 2, !dbg !204
  %13 = load i32, i32* %tmp_seed, align 2, !dbg !205
  %and19 = and i32 %13, -65536, !dbg !206
  %shr20 = lshr i32 %and19, 16, !dbg !207
  %14 = load i32, i32* %tmp_seed, align 2, !dbg !208
  %and21 = and i32 %14, 65535, !dbg !209
  %add22 = add i32 %shr20, %and21, !dbg !210
  store i32 %add22, i32* %tmp_seed, align 2, !dbg !211
  %15 = load i32, i32* %tmp_seed, align 2, !dbg !212
  %conv = trunc i32 %15 to i16, !dbg !213
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !214
  %globals23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1, !dbg !214
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals23, i32 0, i32 1, !dbg !214
  %17 = load i16, i16* %n_1, align 2, !dbg !215
  %add24 = add i16 %17, %conv, !dbg !215
  store i16 %add24, i16* %n_1, align 2, !dbg !215
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !216
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !216
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 9, !dbg !216
  %19 = load i16, i16* %iter, align 2, !dbg !217
  %inc = add i16 %19, 1, !dbg !217
  store i16 %inc, i16* %iter, align 2, !dbg !217
  ret void, !dbg !218
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @recursive_cnt(i32 %x) #0 !dbg !219 {
entry:
  %x.addr = alloca i32, align 2
  %cnt = alloca i16, align 2
  store i32 %x, i32* %x.addr, align 2
  call void @llvm.dbg.declare(metadata i32* %x.addr, metadata !222, metadata !DIExpression()), !dbg !223
  call void @llvm.dbg.declare(metadata i16* %cnt, metadata !224, metadata !DIExpression()), !dbg !225
  %0 = load i32, i32* %x.addr, align 2, !dbg !226
  %and = and i32 %0, 15, !dbg !227
  %conv = trunc i32 %and to i16, !dbg !228
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !229
  %1 = load i8, i8* %arrayidx, align 1, !dbg !229
  %conv1 = sext i8 %1 to i16, !dbg !229
  store i16 %conv1, i16* %cnt, align 2, !dbg !225
  %2 = load i32, i32* %x.addr, align 2, !dbg !230
  %shr = lshr i32 %2, 4, !dbg !230
  store i32 %shr, i32* %x.addr, align 2, !dbg !230
  %cmp = icmp ne i32 0, %shr, !dbg !232
  br i1 %cmp, label %if.then, label %if.end, !dbg !233

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %x.addr, align 2, !dbg !234
  %call = call i16 @recursive_cnt(i32 %3), !dbg !235
  %4 = load i16, i16* %cnt, align 2, !dbg !236
  %add = add nsw i16 %4, %call, !dbg !236
  store i16 %add, i16* %cnt, align 2, !dbg !236
  br label %if.end, !dbg !237

if.end:                                           ; preds = %if.then, %entry
  %5 = load i16, i16* %cnt, align 2, !dbg !238
  ret i16 %5, !dbg !239
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcnt() #0 !dbg !240 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !241
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !241
  %1 = load i32, i32* %seed, align 2, !dbg !241
  %call = call i16 @recursive_cnt(i32 %1), !dbg !242
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !243
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !243
  %3 = load i16, i16* %n_2, align 2, !dbg !244
  %add = add i16 %3, %call, !dbg !244
  store i16 %add, i16* %n_2, align 2, !dbg !244
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !245
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !245
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !245
  %5 = load i32, i32* %seed3, align 2, !dbg !245
  %add4 = add i32 %5, 13, !dbg !246
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !247
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !247
  %seed6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 8, !dbg !247
  store i32 %add4, i32* %seed6, align 2, !dbg !248
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !249
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !249
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9, !dbg !249
  %8 = load i16, i16* %iter, align 2, !dbg !250
  %inc = add i16 %8, 1, !dbg !250
  store i16 %inc, i16* %iter, align 2, !dbg !250
  ret void, !dbg !251
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_ntbl_bitcount() #0 !dbg !252 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !253
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !253
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !253
  %1 = load i32, i32* %seed, align 2, !dbg !253
  %and = and i32 %1, 15, !dbg !254
  %conv = trunc i32 %and to i16, !dbg !255
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv, !dbg !256
  %2 = load i8, i8* %arrayidx, align 1, !dbg !256
  %conv1 = sext i8 %2 to i16, !dbg !256
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !257
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !257
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8, !dbg !257
  %4 = load i32, i32* %seed3, align 2, !dbg !257
  %and4 = and i32 %4, 240, !dbg !258
  %shr = lshr i32 %and4, 4, !dbg !259
  %conv5 = trunc i32 %shr to i16, !dbg !260
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv5, !dbg !261
  %5 = load i8, i8* %arrayidx6, align 1, !dbg !261
  %conv7 = sext i8 %5 to i16, !dbg !261
  %add = add nsw i16 %conv1, %conv7, !dbg !262
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !263
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !263
  %seed9 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 8, !dbg !263
  %7 = load i32, i32* %seed9, align 2, !dbg !263
  %and10 = and i32 %7, 3840, !dbg !264
  %shr11 = lshr i32 %and10, 8, !dbg !265
  %conv12 = trunc i32 %shr11 to i16, !dbg !266
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv12, !dbg !267
  %8 = load i8, i8* %arrayidx13, align 1, !dbg !267
  %conv14 = sext i8 %8 to i16, !dbg !267
  %add15 = add nsw i16 %add, %conv14, !dbg !268
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !269
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !269
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !269
  %10 = load i32, i32* %seed17, align 2, !dbg !269
  %and18 = and i32 %10, 61440, !dbg !270
  %shr19 = lshr i32 %and18, 12, !dbg !271
  %conv20 = trunc i32 %shr19 to i16, !dbg !272
  %arrayidx21 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv20, !dbg !273
  %11 = load i8, i8* %arrayidx21, align 1, !dbg !273
  %conv22 = sext i8 %11 to i16, !dbg !273
  %add23 = add nsw i16 %add15, %conv22, !dbg !274
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !275
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !275
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !275
  %13 = load i32, i32* %seed25, align 2, !dbg !275
  %and26 = and i32 %13, 983040, !dbg !276
  %shr27 = lshr i32 %and26, 16, !dbg !277
  %conv28 = trunc i32 %shr27 to i16, !dbg !278
  %arrayidx29 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv28, !dbg !279
  %14 = load i8, i8* %arrayidx29, align 1, !dbg !279
  %conv30 = sext i8 %14 to i16, !dbg !279
  %add31 = add nsw i16 %add23, %conv30, !dbg !280
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !281
  %globals32 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !281
  %seed33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals32, i32 0, i32 8, !dbg !281
  %16 = load i32, i32* %seed33, align 2, !dbg !281
  %and34 = and i32 %16, 15728640, !dbg !282
  %shr35 = lshr i32 %and34, 20, !dbg !283
  %conv36 = trunc i32 %shr35 to i16, !dbg !284
  %arrayidx37 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv36, !dbg !285
  %17 = load i8, i8* %arrayidx37, align 1, !dbg !285
  %conv38 = sext i8 %17 to i16, !dbg !285
  %add39 = add nsw i16 %add31, %conv38, !dbg !286
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !287
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !287
  %seed41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 8, !dbg !287
  %19 = load i32, i32* %seed41, align 2, !dbg !287
  %and42 = and i32 %19, 251658240, !dbg !288
  %shr43 = lshr i32 %and42, 24, !dbg !289
  %conv44 = trunc i32 %shr43 to i16, !dbg !290
  %arrayidx45 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv44, !dbg !291
  %20 = load i8, i8* %arrayidx45, align 1, !dbg !291
  %conv46 = sext i8 %20 to i16, !dbg !291
  %add47 = add nsw i16 %add39, %conv46, !dbg !292
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !293
  %globals48 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1, !dbg !293
  %seed49 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals48, i32 0, i32 8, !dbg !293
  %22 = load i32, i32* %seed49, align 2, !dbg !293
  %and50 = and i32 %22, -268435456, !dbg !294
  %shr51 = lshr i32 %and50, 28, !dbg !295
  %conv52 = trunc i32 %shr51 to i16, !dbg !296
  %arrayidx53 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %conv52, !dbg !297
  %23 = load i8, i8* %arrayidx53, align 1, !dbg !297
  %conv54 = sext i8 %23 to i16, !dbg !297
  %add55 = add nsw i16 %add47, %conv54, !dbg !298
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !299
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1, !dbg !299
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 3, !dbg !299
  %25 = load i16, i16* %n_3, align 2, !dbg !300
  %add57 = add i16 %25, %add55, !dbg !300
  store i16 %add57, i16* %n_3, align 2, !dbg !300
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !301
  %globals58 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1, !dbg !301
  %seed59 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals58, i32 0, i32 8, !dbg !301
  %27 = load i32, i32* %seed59, align 2, !dbg !301
  %add60 = add i32 %27, 13, !dbg !302
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !303
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1, !dbg !303
  %seed62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 8, !dbg !303
  store i32 %add60, i32* %seed62, align 2, !dbg !304
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !305
  %globals63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !305
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals63, i32 0, i32 9, !dbg !305
  %30 = load i16, i16* %iter, align 2, !dbg !306
  %inc = add i16 %30, 1, !dbg !306
  store i16 %inc, i16* %iter, align 2, !dbg !306
  ret void, !dbg !307
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_BW_btbl_bitcount() #0 !dbg !308 {
entry:
  %U = alloca %union.anon, align 2
  call void @llvm.dbg.declare(metadata %union.anon* %U, metadata !309, metadata !DIExpression()), !dbg !318
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !319
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !319
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !319
  %1 = load i32, i32* %seed, align 2, !dbg !319
  %y = bitcast %union.anon* %U to i32*, !dbg !320
  store i32 %1, i32* %y, align 2, !dbg !321
  %ch = bitcast %union.anon* %U to [4 x i8]*, !dbg !322
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ch, i16 0, i16 0, !dbg !323
  %2 = load i8, i8* %arrayidx, align 2, !dbg !323
  %idxprom = zext i8 %2 to i16, !dbg !324
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !324
  %3 = load i8, i8* %arrayidx1, align 1, !dbg !324
  %conv = sext i8 %3 to i16, !dbg !324
  %ch2 = bitcast %union.anon* %U to [4 x i8]*, !dbg !325
  %arrayidx3 = getelementptr inbounds [4 x i8], [4 x i8]* %ch2, i16 0, i16 1, !dbg !326
  %4 = load i8, i8* %arrayidx3, align 1, !dbg !326
  %idxprom4 = zext i8 %4 to i16, !dbg !327
  %arrayidx5 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom4, !dbg !327
  %5 = load i8, i8* %arrayidx5, align 1, !dbg !327
  %conv6 = sext i8 %5 to i16, !dbg !327
  %add = add nsw i16 %conv, %conv6, !dbg !328
  %ch7 = bitcast %union.anon* %U to [4 x i8]*, !dbg !329
  %arrayidx8 = getelementptr inbounds [4 x i8], [4 x i8]* %ch7, i16 0, i16 3, !dbg !330
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !330
  %idxprom9 = zext i8 %6 to i16, !dbg !331
  %arrayidx10 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom9, !dbg !331
  %7 = load i8, i8* %arrayidx10, align 1, !dbg !331
  %conv11 = sext i8 %7 to i16, !dbg !331
  %add12 = add nsw i16 %add, %conv11, !dbg !332
  %ch13 = bitcast %union.anon* %U to [4 x i8]*, !dbg !333
  %arrayidx14 = getelementptr inbounds [4 x i8], [4 x i8]* %ch13, i16 0, i16 2, !dbg !334
  %8 = load i8, i8* %arrayidx14, align 2, !dbg !334
  %idxprom15 = zext i8 %8 to i16, !dbg !335
  %arrayidx16 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom15, !dbg !335
  %9 = load i8, i8* %arrayidx16, align 1, !dbg !335
  %conv17 = sext i8 %9 to i16, !dbg !335
  %add18 = add nsw i16 %add12, %conv17, !dbg !336
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !337
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !337
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 4, !dbg !337
  %11 = load i16, i16* %n_4, align 2, !dbg !338
  %add20 = add i16 %11, %add18, !dbg !338
  store i16 %add20, i16* %n_4, align 2, !dbg !338
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !339
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !339
  %seed22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8, !dbg !339
  %13 = load i32, i32* %seed22, align 2, !dbg !339
  %add23 = add i32 %13, 13, !dbg !340
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !341
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !341
  %seed25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 8, !dbg !341
  store i32 %add23, i32* %seed25, align 2, !dbg !342
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !343
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !343
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 9, !dbg !343
  %16 = load i16, i16* %iter, align 2, !dbg !344
  %inc = add i16 %16, 1, !dbg !344
  store i16 %inc, i16* %iter, align 2, !dbg !344
  ret void, !dbg !345
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_AR_btbl_bitcount() #0 !dbg !346 {
entry:
  %Ptr = alloca i8*, align 2
  %Accu = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i8** %Ptr, metadata !347, metadata !DIExpression()), !dbg !348
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !349
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !349
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !349
  %1 = bitcast i32* %seed to i8*, !dbg !350
  store i8* %1, i8** %Ptr, align 2, !dbg !348
  call void @llvm.dbg.declare(metadata i16* %Accu, metadata !351, metadata !DIExpression()), !dbg !352
  %2 = load i8*, i8** %Ptr, align 2, !dbg !353
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1, !dbg !353
  store i8* %incdec.ptr, i8** %Ptr, align 2, !dbg !353
  %3 = load i8, i8* %2, align 1, !dbg !354
  %idxprom = zext i8 %3 to i16, !dbg !355
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom, !dbg !355
  %4 = load i8, i8* %arrayidx, align 1, !dbg !355
  %conv = sext i8 %4 to i16, !dbg !355
  store i16 %conv, i16* %Accu, align 2, !dbg !356
  %5 = load i8*, i8** %Ptr, align 2, !dbg !357
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !357
  store i8* %incdec.ptr1, i8** %Ptr, align 2, !dbg !357
  %6 = load i8, i8* %5, align 1, !dbg !358
  %idxprom2 = zext i8 %6 to i16, !dbg !359
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom2, !dbg !359
  %7 = load i8, i8* %arrayidx3, align 1, !dbg !359
  %conv4 = sext i8 %7 to i16, !dbg !359
  %8 = load i16, i16* %Accu, align 2, !dbg !360
  %add = add nsw i16 %8, %conv4, !dbg !360
  store i16 %add, i16* %Accu, align 2, !dbg !360
  %9 = load i8*, i8** %Ptr, align 2, !dbg !361
  %incdec.ptr5 = getelementptr inbounds i8, i8* %9, i32 1, !dbg !361
  store i8* %incdec.ptr5, i8** %Ptr, align 2, !dbg !361
  %10 = load i8, i8* %9, align 1, !dbg !362
  %idxprom6 = zext i8 %10 to i16, !dbg !363
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom6, !dbg !363
  %11 = load i8, i8* %arrayidx7, align 1, !dbg !363
  %conv8 = sext i8 %11 to i16, !dbg !363
  %12 = load i16, i16* %Accu, align 2, !dbg !364
  %add9 = add nsw i16 %12, %conv8, !dbg !364
  store i16 %add9, i16* %Accu, align 2, !dbg !364
  %13 = load i8*, i8** %Ptr, align 2, !dbg !365
  %14 = load i8, i8* %13, align 1, !dbg !366
  %idxprom10 = zext i8 %14 to i16, !dbg !367
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i16 0, i16 %idxprom10, !dbg !367
  %15 = load i8, i8* %arrayidx11, align 1, !dbg !367
  %conv12 = sext i8 %15 to i16, !dbg !367
  %16 = load i16, i16* %Accu, align 2, !dbg !368
  %add13 = add nsw i16 %16, %conv12, !dbg !368
  store i16 %add13, i16* %Accu, align 2, !dbg !368
  %17 = load i16, i16* %Accu, align 2, !dbg !369
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !370
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !370
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5, !dbg !370
  %19 = load i16, i16* %n_5, align 2, !dbg !371
  %add15 = add i16 %19, %17, !dbg !371
  store i16 %add15, i16* %n_5, align 2, !dbg !371
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !372
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !372
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8, !dbg !372
  %21 = load i32, i32* %seed17, align 2, !dbg !372
  %add18 = add i32 %21, 13, !dbg !373
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !374
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !374
  %seed20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8, !dbg !374
  store i32 %add18, i32* %seed20, align 2, !dbg !375
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !376
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1, !dbg !376
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9, !dbg !376
  %24 = load i16, i16* %iter, align 2, !dbg !377
  %inc = add i16 %24, 1, !dbg !377
  store i16 %inc, i16* %iter, align 2, !dbg !377
  ret void, !dbg !378
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_bit_shifter() #0 !dbg !379 {
entry:
  %i = alloca i16, align 2
  %nn = alloca i16, align 2
  %tmp_seed = alloca i32, align 2
  call void @llvm.dbg.declare(metadata i16* %i, metadata !380, metadata !DIExpression()), !dbg !381
  call void @llvm.dbg.declare(metadata i16* %nn, metadata !382, metadata !DIExpression()), !dbg !383
  call void @llvm.dbg.declare(metadata i32* %tmp_seed, metadata !384, metadata !DIExpression()), !dbg !385
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !386
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !386
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8, !dbg !386
  %1 = load i32, i32* %seed, align 2, !dbg !386
  store i32 %1, i32* %tmp_seed, align 2, !dbg !385
  store i16 0, i16* %nn, align 2, !dbg !387
  store i16 0, i16* %i, align 2, !dbg !389
  br label %for.cond, !dbg !390

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %tmp_seed, align 2, !dbg !391
  %tobool = icmp ne i32 %2, 0, !dbg !391
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !393

land.rhs:                                         ; preds = %for.cond
  %3 = load i16, i16* %i, align 2, !dbg !394
  %cmp = icmp ult i16 %3, 32, !dbg !395
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %4 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ], !dbg !396
  br i1 %4, label %for.body, label %for.end, !dbg !397

for.body:                                         ; preds = %land.end
  %5 = load i32, i32* %tmp_seed, align 2, !dbg !398
  %and = and i32 %5, 1, !dbg !399
  %conv = trunc i32 %and to i16, !dbg !400
  %6 = load i16, i16* %nn, align 2, !dbg !401
  %add = add nsw i16 %6, %conv, !dbg !401
  store i16 %add, i16* %nn, align 2, !dbg !401
  br label %for.inc, !dbg !402

for.inc:                                          ; preds = %for.body
  %7 = load i16, i16* %i, align 2, !dbg !403
  %inc = add nsw i16 %7, 1, !dbg !403
  store i16 %inc, i16* %i, align 2, !dbg !403
  %8 = load i32, i32* %tmp_seed, align 2, !dbg !404
  %shr = lshr i32 %8, 1, !dbg !404
  store i32 %shr, i32* %tmp_seed, align 2, !dbg !404
  br label %for.cond, !dbg !405, !llvm.loop !406

for.end:                                          ; preds = %land.end
  %9 = load i16, i16* %nn, align 2, !dbg !408
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !409
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1, !dbg !409
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 6, !dbg !409
  %11 = load i16, i16* %n_6, align 2, !dbg !410
  %add2 = add i16 %11, %9, !dbg !410
  store i16 %add2, i16* %n_6, align 2, !dbg !410
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !411
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !411
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8, !dbg !411
  %13 = load i32, i32* %seed4, align 2, !dbg !411
  %add5 = add i32 %13, 13, !dbg !412
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !413
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !413
  %seed7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8, !dbg !413
  store i32 %add5, i32* %seed7, align 2, !dbg !414
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !415
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !415
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 9, !dbg !415
  %16 = load i16, i16* %iter, align 2, !dbg !416
  %inc9 = add i16 %16, 1, !dbg !416
  store i16 %inc9, i16* %iter, align 2, !dbg !416
  ret void, !dbg !417
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_done() #0 !dbg !418 {
entry:
  call void @exit(i16 0) #5, !dbg !419
  unreachable, !dbg !419
}

; Function Attrs: noreturn
declare dso_local void @exit(i16) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_commit() #0 !dbg !420 {
entry:
  ret void, !dbg !421
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !422 {
entry:
  %retval = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !425
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !426
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !427
  call void @camel_init(), !dbg !428
  call void @task_init(), !dbg !429
  br label %do.body, !dbg !429

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !430
  %cmp = icmp eq i16 %0, 1, !dbg !430
  br i1 %cmp, label %if.then, label %if.else, !dbg !433

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !434
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !434
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !434
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !434
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !434
  call void @__dump_registers(i16* %arraydecay), !dbg !434
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !434
  br label %if.end, !dbg !434

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !436
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !436
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !436
  %reg_file1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !436
  %arraydecay2 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file1, i16 0, i16 0, !dbg !436
  call void @__dump_registers(i16* %arraydecay2), !dbg !436
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !436
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !433

do.end:                                           ; preds = %if.end
  call void @task_commit(), !dbg !429
  br label %while.body, !dbg !438

while.body:                                       ; preds = %do.end, %if.end167
  call void @task_select_func(), !dbg !439
  br label %do.body3, !dbg !439

do.body3:                                         ; preds = %while.body
  %3 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !441
  %cmp4 = icmp eq i16 %3, 1, !dbg !441
  br i1 %cmp4, label %if.then5, label %if.else8, !dbg !444

if.then5:                                         ; preds = %do.body3
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !445
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !445
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !445
  %reg_file6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 0, !dbg !445
  %arraydecay7 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file6, i16 0, i16 0, !dbg !445
  call void @__dump_registers(i16* %arraydecay7), !dbg !445
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !445
  br label %if.end11, !dbg !445

if.else8:                                         ; preds = %do.body3
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !447
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !447
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !447
  %reg_file9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 0, !dbg !447
  %arraydecay10 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file9, i16 0, i16 0, !dbg !447
  call void @__dump_registers(i16* %arraydecay10), !dbg !447
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !447
  br label %if.end11

if.end11:                                         ; preds = %if.else8, %if.then5
  br label %do.end12, !dbg !444

do.end12:                                         ; preds = %if.end11
  call void @task_commit(), !dbg !439
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !449
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !449
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7, !dbg !449
  %7 = load i16, i16* %func, align 2, !dbg !449
  %cmp13 = icmp eq i16 %7, 1, !dbg !451
  br i1 %cmp13, label %if.then14, label %if.else29, !dbg !452

if.then14:                                        ; preds = %do.end12
  br label %while.cond15, !dbg !453

while.cond15:                                     ; preds = %do.end28, %if.then14
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !455
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !455
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 9, !dbg !455
  %9 = load i16, i16* %iter, align 2, !dbg !455
  %cmp17 = icmp ult i16 %9, 100, !dbg !456
  br i1 %cmp17, label %while.body18, label %while.end, !dbg !453

while.body18:                                     ; preds = %while.cond15
  call void @task_bit_count(), !dbg !457
  br label %do.body19, !dbg !457

do.body19:                                        ; preds = %while.body18
  %10 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !459
  %cmp20 = icmp eq i16 %10, 1, !dbg !459
  br i1 %cmp20, label %if.then21, label %if.else24, !dbg !462

if.then21:                                        ; preds = %do.body19
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !463
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !463
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !463
  %reg_file22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 0, !dbg !463
  %arraydecay23 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file22, i16 0, i16 0, !dbg !463
  call void @__dump_registers(i16* %arraydecay23), !dbg !463
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !463
  br label %if.end27, !dbg !463

if.else24:                                        ; preds = %do.body19
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !465
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !465
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !465
  %reg_file25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 0, !dbg !465
  %arraydecay26 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file25, i16 0, i16 0, !dbg !465
  call void @__dump_registers(i16* %arraydecay26), !dbg !465
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !465
  br label %if.end27

if.end27:                                         ; preds = %if.else24, %if.then21
  br label %do.end28, !dbg !462

do.end28:                                         ; preds = %if.end27
  call void @task_commit(), !dbg !457
  br label %while.cond15, !dbg !453, !llvm.loop !467

while.end:                                        ; preds = %while.cond15
  br label %if.end167, !dbg !469

if.else29:                                        ; preds = %do.end12
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !470
  %globals30 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !470
  %func31 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals30, i32 0, i32 7, !dbg !470
  %14 = load i16, i16* %func31, align 2, !dbg !470
  %cmp32 = icmp eq i16 %14, 2, !dbg !472
  br i1 %cmp32, label %if.then33, label %if.else50, !dbg !473

if.then33:                                        ; preds = %if.else29
  br label %while.cond34, !dbg !474

while.cond34:                                     ; preds = %do.end48, %if.then33
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !476
  %globals35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1, !dbg !476
  %iter36 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals35, i32 0, i32 9, !dbg !476
  %16 = load i16, i16* %iter36, align 2, !dbg !476
  %cmp37 = icmp ult i16 %16, 100, !dbg !477
  br i1 %cmp37, label %while.body38, label %while.end49, !dbg !474

while.body38:                                     ; preds = %while.cond34
  call void @task_bitcount(), !dbg !478
  br label %do.body39, !dbg !478

do.body39:                                        ; preds = %while.body38
  %17 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !480
  %cmp40 = icmp eq i16 %17, 1, !dbg !480
  br i1 %cmp40, label %if.then41, label %if.else44, !dbg !483

if.then41:                                        ; preds = %do.body39
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !484
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !484
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !484
  %reg_file42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 0, !dbg !484
  %arraydecay43 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file42, i16 0, i16 0, !dbg !484
  call void @__dump_registers(i16* %arraydecay43), !dbg !484
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !484
  br label %if.end47, !dbg !484

if.else44:                                        ; preds = %do.body39
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !486
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !486
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !486
  %reg_file45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 0, !dbg !486
  %arraydecay46 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file45, i16 0, i16 0, !dbg !486
  call void @__dump_registers(i16* %arraydecay46), !dbg !486
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !486
  br label %if.end47

if.end47:                                         ; preds = %if.else44, %if.then41
  br label %do.end48, !dbg !483

do.end48:                                         ; preds = %if.end47
  call void @task_commit(), !dbg !478
  br label %while.cond34, !dbg !474, !llvm.loop !488

while.end49:                                      ; preds = %while.cond34
  br label %if.end166, !dbg !490

if.else50:                                        ; preds = %if.else29
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !491
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1, !dbg !491
  %func52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 7, !dbg !491
  %21 = load i16, i16* %func52, align 2, !dbg !491
  %cmp53 = icmp eq i16 %21, 3, !dbg !493
  br i1 %cmp53, label %if.then54, label %if.else71, !dbg !494

if.then54:                                        ; preds = %if.else50
  br label %while.cond55, !dbg !495

while.cond55:                                     ; preds = %do.end69, %if.then54
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !497
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1, !dbg !497
  %iter57 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 9, !dbg !497
  %23 = load i16, i16* %iter57, align 2, !dbg !497
  %cmp58 = icmp ult i16 %23, 100, !dbg !498
  br i1 %cmp58, label %while.body59, label %while.end70, !dbg !495

while.body59:                                     ; preds = %while.cond55
  call void @task_ntbl_bitcnt(), !dbg !499
  br label %do.body60, !dbg !499

do.body60:                                        ; preds = %while.body59
  %24 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !501
  %cmp61 = icmp eq i16 %24, 1, !dbg !501
  br i1 %cmp61, label %if.then62, label %if.else65, !dbg !504

if.then62:                                        ; preds = %do.body60
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !505
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !505
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !505
  %reg_file63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 0, !dbg !505
  %arraydecay64 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file63, i16 0, i16 0, !dbg !505
  call void @__dump_registers(i16* %arraydecay64), !dbg !505
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !505
  br label %if.end68, !dbg !505

if.else65:                                        ; preds = %do.body60
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !507
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !507
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !507
  %reg_file66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 0, !dbg !507
  %arraydecay67 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file66, i16 0, i16 0, !dbg !507
  call void @__dump_registers(i16* %arraydecay67), !dbg !507
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !507
  br label %if.end68

if.end68:                                         ; preds = %if.else65, %if.then62
  br label %do.end69, !dbg !504

do.end69:                                         ; preds = %if.end68
  call void @task_commit(), !dbg !499
  br label %while.cond55, !dbg !495, !llvm.loop !509

while.end70:                                      ; preds = %while.cond55
  br label %if.end165, !dbg !511

if.else71:                                        ; preds = %if.else50
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !512
  %globals72 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1, !dbg !512
  %func73 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals72, i32 0, i32 7, !dbg !512
  %28 = load i16, i16* %func73, align 2, !dbg !512
  %cmp74 = icmp eq i16 %28, 4, !dbg !514
  br i1 %cmp74, label %if.then75, label %if.else92, !dbg !515

if.then75:                                        ; preds = %if.else71
  br label %while.cond76, !dbg !516

while.cond76:                                     ; preds = %do.end90, %if.then75
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !518
  %globals77 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1, !dbg !518
  %iter78 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals77, i32 0, i32 9, !dbg !518
  %30 = load i16, i16* %iter78, align 2, !dbg !518
  %cmp79 = icmp ult i16 %30, 100, !dbg !519
  br i1 %cmp79, label %while.body80, label %while.end91, !dbg !516

while.body80:                                     ; preds = %while.cond76
  call void @task_ntbl_bitcount(), !dbg !520
  br label %do.body81, !dbg !520

do.body81:                                        ; preds = %while.body80
  %31 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !522
  %cmp82 = icmp eq i16 %31, 1, !dbg !522
  br i1 %cmp82, label %if.then83, label %if.else86, !dbg !525

if.then83:                                        ; preds = %do.body81
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !526
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !526
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !526
  %reg_file84 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i32 0, i32 0, !dbg !526
  %arraydecay85 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file84, i16 0, i16 0, !dbg !526
  call void @__dump_registers(i16* %arraydecay85), !dbg !526
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !526
  br label %if.end89, !dbg !526

if.else86:                                        ; preds = %do.body81
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !528
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !528
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !528
  %reg_file87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 0, !dbg !528
  %arraydecay88 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file87, i16 0, i16 0, !dbg !528
  call void @__dump_registers(i16* %arraydecay88), !dbg !528
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !528
  br label %if.end89

if.end89:                                         ; preds = %if.else86, %if.then83
  br label %do.end90, !dbg !525

do.end90:                                         ; preds = %if.end89
  call void @task_commit(), !dbg !520
  br label %while.cond76, !dbg !516, !llvm.loop !530

while.end91:                                      ; preds = %while.cond76
  br label %if.end164, !dbg !532

if.else92:                                        ; preds = %if.else71
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !533
  %globals93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1, !dbg !533
  %func94 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals93, i32 0, i32 7, !dbg !533
  %35 = load i16, i16* %func94, align 2, !dbg !533
  %cmp95 = icmp eq i16 %35, 5, !dbg !535
  br i1 %cmp95, label %if.then96, label %if.else113, !dbg !536

if.then96:                                        ; preds = %if.else92
  br label %while.cond97, !dbg !537

while.cond97:                                     ; preds = %do.end111, %if.then96
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !539
  %globals98 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1, !dbg !539
  %iter99 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals98, i32 0, i32 9, !dbg !539
  %37 = load i16, i16* %iter99, align 2, !dbg !539
  %cmp100 = icmp ult i16 %37, 100, !dbg !540
  br i1 %cmp100, label %while.body101, label %while.end112, !dbg !537

while.body101:                                    ; preds = %while.cond97
  call void @task_BW_btbl_bitcount(), !dbg !541
  br label %do.body102, !dbg !541

do.body102:                                       ; preds = %while.body101
  %38 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !543
  %cmp103 = icmp eq i16 %38, 1, !dbg !543
  br i1 %cmp103, label %if.then104, label %if.else107, !dbg !546

if.then104:                                       ; preds = %do.body102
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !547
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !547
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !547
  %reg_file105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 0, !dbg !547
  %arraydecay106 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file105, i16 0, i16 0, !dbg !547
  call void @__dump_registers(i16* %arraydecay106), !dbg !547
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !547
  br label %if.end110, !dbg !547

if.else107:                                       ; preds = %do.body102
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !549
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !549
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !549
  %reg_file108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 0, !dbg !549
  %arraydecay109 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file108, i16 0, i16 0, !dbg !549
  call void @__dump_registers(i16* %arraydecay109), !dbg !549
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !549
  br label %if.end110

if.end110:                                        ; preds = %if.else107, %if.then104
  br label %do.end111, !dbg !546

do.end111:                                        ; preds = %if.end110
  call void @task_commit(), !dbg !541
  br label %while.cond97, !dbg !537, !llvm.loop !551

while.end112:                                     ; preds = %while.cond97
  br label %if.end163, !dbg !553

if.else113:                                       ; preds = %if.else92
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !554
  %globals114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 1, !dbg !554
  %func115 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals114, i32 0, i32 7, !dbg !554
  %42 = load i16, i16* %func115, align 2, !dbg !554
  %cmp116 = icmp eq i16 %42, 6, !dbg !556
  br i1 %cmp116, label %if.then117, label %if.else134, !dbg !557

if.then117:                                       ; preds = %if.else113
  br label %while.cond118, !dbg !558

while.cond118:                                    ; preds = %do.end132, %if.then117
  %43 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !560
  %globals119 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %43, i32 0, i32 1, !dbg !560
  %iter120 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals119, i32 0, i32 9, !dbg !560
  %44 = load i16, i16* %iter120, align 2, !dbg !560
  %cmp121 = icmp ult i16 %44, 100, !dbg !561
  br i1 %cmp121, label %while.body122, label %while.end133, !dbg !558

while.body122:                                    ; preds = %while.cond118
  call void @task_AR_btbl_bitcount(), !dbg !562
  br label %do.body123, !dbg !562

do.body123:                                       ; preds = %while.body122
  %45 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !564
  %cmp124 = icmp eq i16 %45, 1, !dbg !564
  br i1 %cmp124, label %if.then125, label %if.else128, !dbg !567

if.then125:                                       ; preds = %do.body123
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !568
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !568
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !568
  %reg_file126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 0, !dbg !568
  %arraydecay127 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file126, i16 0, i16 0, !dbg !568
  call void @__dump_registers(i16* %arraydecay127), !dbg !568
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !568
  br label %if.end131, !dbg !568

if.else128:                                       ; preds = %do.body123
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !570
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !570
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !570
  %reg_file129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 0, !dbg !570
  %arraydecay130 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file129, i16 0, i16 0, !dbg !570
  call void @__dump_registers(i16* %arraydecay130), !dbg !570
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !570
  br label %if.end131

if.end131:                                        ; preds = %if.else128, %if.then125
  br label %do.end132, !dbg !567

do.end132:                                        ; preds = %if.end131
  call void @task_commit(), !dbg !562
  br label %while.cond118, !dbg !558, !llvm.loop !572

while.end133:                                     ; preds = %while.cond118
  br label %if.end162, !dbg !574

if.else134:                                       ; preds = %if.else113
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !575
  %globals135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i32 0, i32 1, !dbg !575
  %func136 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals135, i32 0, i32 7, !dbg !575
  %49 = load i16, i16* %func136, align 2, !dbg !575
  %cmp137 = icmp eq i16 %49, 7, !dbg !577
  br i1 %cmp137, label %if.then138, label %if.else155, !dbg !578

if.then138:                                       ; preds = %if.else134
  br label %while.cond139, !dbg !579

while.cond139:                                    ; preds = %do.end153, %if.then138
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !581
  %globals140 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1, !dbg !581
  %iter141 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals140, i32 0, i32 9, !dbg !581
  %51 = load i16, i16* %iter141, align 2, !dbg !581
  %cmp142 = icmp ult i16 %51, 100, !dbg !582
  br i1 %cmp142, label %while.body143, label %while.end154, !dbg !579

while.body143:                                    ; preds = %while.cond139
  call void @task_bit_shifter(), !dbg !583
  br label %do.body144, !dbg !583

do.body144:                                       ; preds = %while.body143
  %52 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !585
  %cmp145 = icmp eq i16 %52, 1, !dbg !585
  br i1 %cmp145, label %if.then146, label %if.else149, !dbg !588

if.then146:                                       ; preds = %do.body144
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !589
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !589
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !589
  %reg_file147 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 0, !dbg !589
  %arraydecay148 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file147, i16 0, i16 0, !dbg !589
  call void @__dump_registers(i16* %arraydecay148), !dbg !589
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !589
  br label %if.end152, !dbg !589

if.else149:                                       ; preds = %do.body144
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !591
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !591
  %54 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !591
  %reg_file150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %54, i32 0, i32 0, !dbg !591
  %arraydecay151 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file150, i16 0, i16 0, !dbg !591
  call void @__dump_registers(i16* %arraydecay151), !dbg !591
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !591
  br label %if.end152

if.end152:                                        ; preds = %if.else149, %if.then146
  br label %do.end153, !dbg !588

do.end153:                                        ; preds = %if.end152
  call void @task_commit(), !dbg !583
  br label %while.cond139, !dbg !579, !llvm.loop !593

while.end154:                                     ; preds = %while.cond139
  br label %if.end161, !dbg !595

if.else155:                                       ; preds = %if.else134
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !596
  %globals156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 1, !dbg !596
  %func157 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals156, i32 0, i32 7, !dbg !596
  %56 = load i16, i16* %func157, align 2, !dbg !596
  %cmp158 = icmp eq i16 %56, 8, !dbg !598
  br i1 %cmp158, label %if.then159, label %if.end160, !dbg !599

if.then159:                                       ; preds = %if.else155
  call void @task_done(), !dbg !600
  br label %if.end160, !dbg !602

if.end160:                                        ; preds = %if.then159, %if.else155
  br label %if.end161

if.end161:                                        ; preds = %if.end160, %while.end154
  br label %if.end162

if.end162:                                        ; preds = %if.end161, %while.end133
  br label %if.end163

if.end163:                                        ; preds = %if.end162, %while.end112
  br label %if.end164

if.end164:                                        ; preds = %if.end163, %while.end91
  br label %if.end165

if.end165:                                        ; preds = %if.end164, %while.end70
  br label %if.end166

if.end166:                                        ; preds = %if.end165, %while.end49
  br label %if.end167

if.end167:                                        ; preds = %if.end166, %while.end
  br label %while.body, !dbg !438, !llvm.loop !603
}

declare dso_local void @__dump_registers(i16*) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

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
!105 = !DILocation(line: 165, column: 5, scope: !106)
!106 = distinct !DILexicalBlock(scope: !86, file: !3, line: 165, column: 5)
!107 = !{i32 -2146655279}
!108 = !DILocation(line: 166, column: 5, scope: !86)
!109 = !DILocation(line: 167, column: 25, scope: !86)
!110 = !DILocation(line: 167, column: 31, scope: !86)
!111 = !DILocation(line: 167, column: 5, scope: !86)
!112 = !DILocation(line: 190, column: 1, scope: !86)
!113 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 214, type: !19, scopeLine: 214, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!114 = !DILocation(line: 216, column: 2, scope: !113)
!115 = !DILocation(line: 216, column: 11, scope: !113)
!116 = !DILocation(line: 217, column: 2, scope: !113)
!117 = !DILocation(line: 217, column: 10, scope: !113)
!118 = !DILocation(line: 218, column: 2, scope: !113)
!119 = !DILocation(line: 218, column: 10, scope: !113)
!120 = !DILocation(line: 219, column: 2, scope: !113)
!121 = !DILocation(line: 219, column: 10, scope: !113)
!122 = !DILocation(line: 220, column: 2, scope: !113)
!123 = !DILocation(line: 220, column: 10, scope: !113)
!124 = !DILocation(line: 221, column: 2, scope: !113)
!125 = !DILocation(line: 221, column: 10, scope: !113)
!126 = !DILocation(line: 222, column: 2, scope: !113)
!127 = !DILocation(line: 222, column: 10, scope: !113)
!128 = !DILocation(line: 223, column: 2, scope: !113)
!129 = !DILocation(line: 223, column: 10, scope: !113)
!130 = !DILocation(line: 225, column: 1, scope: !113)
!131 = distinct !DISubprogram(name: "task_select_func", scope: !3, file: !3, line: 227, type: !19, scopeLine: 227, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!132 = !DILocation(line: 229, column: 2, scope: !131)
!133 = !DILocation(line: 229, column: 11, scope: !131)
!134 = !DILocation(line: 230, column: 2, scope: !131)
!135 = !DILocation(line: 230, column: 11, scope: !131)
!136 = !DILocation(line: 231, column: 2, scope: !131)
!137 = !DILocation(line: 231, column: 10, scope: !131)
!138 = !DILocation(line: 232, column: 1, scope: !131)
!139 = distinct !DISubprogram(name: "task_bit_count", scope: !3, file: !3, line: 233, type: !19, scopeLine: 233, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!140 = !DILocalVariable(name: "tmp_seed", scope: !139, file: !3, line: 235, type: !7)
!141 = !DILocation(line: 235, column: 11, scope: !139)
!142 = !DILocation(line: 235, column: 22, scope: !139)
!143 = !DILocation(line: 236, column: 13, scope: !139)
!144 = !DILocation(line: 236, column: 22, scope: !139)
!145 = !DILocation(line: 236, column: 2, scope: !139)
!146 = !DILocation(line: 236, column: 11, scope: !139)
!147 = !DILocalVariable(name: "temp", scope: !139, file: !3, line: 237, type: !6)
!148 = !DILocation(line: 237, column: 11, scope: !139)
!149 = !DILocation(line: 238, column: 5, scope: !150)
!150 = distinct !DILexicalBlock(scope: !139, file: !3, line: 238, column: 5)
!151 = !DILocation(line: 238, column: 5, scope: !139)
!152 = !DILocation(line: 238, column: 15, scope: !150)
!153 = !DILocation(line: 239, column: 7, scope: !150)
!154 = !DILocation(line: 239, column: 3, scope: !150)
!155 = !DILocation(line: 240, column: 26, scope: !150)
!156 = !DILocation(line: 240, column: 36, scope: !150)
!157 = !DILocation(line: 240, column: 44, scope: !150)
!158 = !DILocation(line: 240, column: 34, scope: !150)
!159 = !DILocation(line: 240, column: 24, scope: !150)
!160 = !DILocation(line: 240, column: 11, scope: !150)
!161 = distinct !{!161, !152, !162}
!162 = !DILocation(line: 240, column: 48, scope: !150)
!163 = !DILocation(line: 241, column: 13, scope: !139)
!164 = !DILocation(line: 241, column: 2, scope: !139)
!165 = !DILocation(line: 241, column: 10, scope: !139)
!166 = !DILocation(line: 242, column: 2, scope: !139)
!167 = !DILocation(line: 242, column: 10, scope: !139)
!168 = !DILocation(line: 244, column: 1, scope: !139)
!169 = distinct !DISubprogram(name: "task_bitcount", scope: !3, file: !3, line: 245, type: !19, scopeLine: 245, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!170 = !DILocalVariable(name: "tmp_seed", scope: !169, file: !3, line: 247, type: !7)
!171 = !DILocation(line: 247, column: 11, scope: !169)
!172 = !DILocation(line: 247, column: 22, scope: !169)
!173 = !DILocation(line: 248, column: 13, scope: !169)
!174 = !DILocation(line: 248, column: 22, scope: !169)
!175 = !DILocation(line: 248, column: 2, scope: !169)
!176 = !DILocation(line: 248, column: 11, scope: !169)
!177 = !DILocation(line: 249, column: 15, scope: !169)
!178 = !DILocation(line: 249, column: 24, scope: !169)
!179 = !DILocation(line: 249, column: 39, scope: !169)
!180 = !DILocation(line: 249, column: 49, scope: !169)
!181 = !DILocation(line: 249, column: 58, scope: !169)
!182 = !DILocation(line: 249, column: 46, scope: !169)
!183 = !DILocation(line: 249, column: 11, scope: !169)
!184 = !DILocation(line: 250, column: 15, scope: !169)
!185 = !DILocation(line: 250, column: 24, scope: !169)
!186 = !DILocation(line: 250, column: 39, scope: !169)
!187 = !DILocation(line: 250, column: 49, scope: !169)
!188 = !DILocation(line: 250, column: 58, scope: !169)
!189 = !DILocation(line: 250, column: 46, scope: !169)
!190 = !DILocation(line: 250, column: 11, scope: !169)
!191 = !DILocation(line: 251, column: 15, scope: !169)
!192 = !DILocation(line: 251, column: 24, scope: !169)
!193 = !DILocation(line: 251, column: 39, scope: !169)
!194 = !DILocation(line: 251, column: 49, scope: !169)
!195 = !DILocation(line: 251, column: 58, scope: !169)
!196 = !DILocation(line: 251, column: 46, scope: !169)
!197 = !DILocation(line: 251, column: 11, scope: !169)
!198 = !DILocation(line: 252, column: 15, scope: !169)
!199 = !DILocation(line: 252, column: 24, scope: !169)
!200 = !DILocation(line: 252, column: 39, scope: !169)
!201 = !DILocation(line: 252, column: 49, scope: !169)
!202 = !DILocation(line: 252, column: 58, scope: !169)
!203 = !DILocation(line: 252, column: 46, scope: !169)
!204 = !DILocation(line: 252, column: 11, scope: !169)
!205 = !DILocation(line: 253, column: 15, scope: !169)
!206 = !DILocation(line: 253, column: 24, scope: !169)
!207 = !DILocation(line: 253, column: 39, scope: !169)
!208 = !DILocation(line: 253, column: 49, scope: !169)
!209 = !DILocation(line: 253, column: 58, scope: !169)
!210 = !DILocation(line: 253, column: 46, scope: !169)
!211 = !DILocation(line: 253, column: 11, scope: !169)
!212 = !DILocation(line: 254, column: 18, scope: !169)
!213 = !DILocation(line: 254, column: 13, scope: !169)
!214 = !DILocation(line: 254, column: 2, scope: !169)
!215 = !DILocation(line: 254, column: 10, scope: !169)
!216 = !DILocation(line: 255, column: 2, scope: !169)
!217 = !DILocation(line: 255, column: 10, scope: !169)
!218 = !DILocation(line: 257, column: 1, scope: !169)
!219 = distinct !DISubprogram(name: "recursive_cnt", scope: !3, file: !3, line: 258, type: !220, scopeLine: 258, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!220 = !DISubroutineType(types: !221)
!221 = !{!12, !7}
!222 = !DILocalVariable(name: "x", arg: 1, scope: !219, file: !3, line: 258, type: !7)
!223 = !DILocation(line: 258, column: 28, scope: !219)
!224 = !DILocalVariable(name: "cnt", scope: !219, file: !3, line: 259, type: !12)
!225 = !DILocation(line: 259, column: 6, scope: !219)
!226 = !DILocation(line: 259, column: 23, scope: !219)
!227 = !DILocation(line: 259, column: 25, scope: !219)
!228 = !DILocation(line: 259, column: 17, scope: !219)
!229 = !DILocation(line: 259, column: 12, scope: !219)
!230 = !DILocation(line: 261, column: 15, scope: !231)
!231 = distinct !DILexicalBlock(scope: !219, file: !3, line: 261, column: 6)
!232 = !DILocation(line: 261, column: 9, scope: !231)
!233 = !DILocation(line: 261, column: 6, scope: !219)
!234 = !DILocation(line: 262, column: 24, scope: !231)
!235 = !DILocation(line: 262, column: 10, scope: !231)
!236 = !DILocation(line: 262, column: 7, scope: !231)
!237 = !DILocation(line: 262, column: 3, scope: !231)
!238 = !DILocation(line: 264, column: 9, scope: !219)
!239 = !DILocation(line: 264, column: 2, scope: !219)
!240 = distinct !DISubprogram(name: "task_ntbl_bitcnt", scope: !3, file: !3, line: 266, type: !19, scopeLine: 266, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!241 = !DILocation(line: 268, column: 27, scope: !240)
!242 = !DILocation(line: 268, column: 13, scope: !240)
!243 = !DILocation(line: 268, column: 2, scope: !240)
!244 = !DILocation(line: 268, column: 10, scope: !240)
!245 = !DILocation(line: 269, column: 13, scope: !240)
!246 = !DILocation(line: 269, column: 22, scope: !240)
!247 = !DILocation(line: 269, column: 2, scope: !240)
!248 = !DILocation(line: 269, column: 11, scope: !240)
!249 = !DILocation(line: 270, column: 2, scope: !240)
!250 = !DILocation(line: 270, column: 10, scope: !240)
!251 = !DILocation(line: 272, column: 1, scope: !240)
!252 = distinct !DISubprogram(name: "task_ntbl_bitcount", scope: !3, file: !3, line: 273, type: !19, scopeLine: 273, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!253 = !DILocation(line: 275, column: 26, scope: !252)
!254 = !DILocation(line: 275, column: 35, scope: !252)
!255 = !DILocation(line: 275, column: 19, scope: !252)
!256 = !DILocation(line: 275, column: 13, scope: !252)
!257 = !DILocation(line: 276, column: 16, scope: !252)
!258 = !DILocation(line: 276, column: 25, scope: !252)
!259 = !DILocation(line: 276, column: 41, scope: !252)
!260 = !DILocation(line: 276, column: 9, scope: !252)
!261 = !DILocation(line: 276, column: 3, scope: !252)
!262 = !DILocation(line: 275, column: 59, scope: !252)
!263 = !DILocation(line: 277, column: 16, scope: !252)
!264 = !DILocation(line: 277, column: 25, scope: !252)
!265 = !DILocation(line: 277, column: 41, scope: !252)
!266 = !DILocation(line: 277, column: 9, scope: !252)
!267 = !DILocation(line: 277, column: 3, scope: !252)
!268 = !DILocation(line: 276, column: 49, scope: !252)
!269 = !DILocation(line: 278, column: 16, scope: !252)
!270 = !DILocation(line: 278, column: 25, scope: !252)
!271 = !DILocation(line: 278, column: 41, scope: !252)
!272 = !DILocation(line: 278, column: 9, scope: !252)
!273 = !DILocation(line: 278, column: 3, scope: !252)
!274 = !DILocation(line: 277, column: 49, scope: !252)
!275 = !DILocation(line: 279, column: 16, scope: !252)
!276 = !DILocation(line: 279, column: 25, scope: !252)
!277 = !DILocation(line: 279, column: 41, scope: !252)
!278 = !DILocation(line: 279, column: 9, scope: !252)
!279 = !DILocation(line: 279, column: 3, scope: !252)
!280 = !DILocation(line: 278, column: 49, scope: !252)
!281 = !DILocation(line: 280, column: 16, scope: !252)
!282 = !DILocation(line: 280, column: 25, scope: !252)
!283 = !DILocation(line: 280, column: 41, scope: !252)
!284 = !DILocation(line: 280, column: 9, scope: !252)
!285 = !DILocation(line: 280, column: 3, scope: !252)
!286 = !DILocation(line: 279, column: 49, scope: !252)
!287 = !DILocation(line: 281, column: 16, scope: !252)
!288 = !DILocation(line: 281, column: 25, scope: !252)
!289 = !DILocation(line: 281, column: 41, scope: !252)
!290 = !DILocation(line: 281, column: 9, scope: !252)
!291 = !DILocation(line: 281, column: 3, scope: !252)
!292 = !DILocation(line: 280, column: 49, scope: !252)
!293 = !DILocation(line: 282, column: 16, scope: !252)
!294 = !DILocation(line: 282, column: 25, scope: !252)
!295 = !DILocation(line: 282, column: 41, scope: !252)
!296 = !DILocation(line: 282, column: 9, scope: !252)
!297 = !DILocation(line: 282, column: 3, scope: !252)
!298 = !DILocation(line: 281, column: 49, scope: !252)
!299 = !DILocation(line: 275, column: 2, scope: !252)
!300 = !DILocation(line: 275, column: 10, scope: !252)
!301 = !DILocation(line: 283, column: 13, scope: !252)
!302 = !DILocation(line: 283, column: 22, scope: !252)
!303 = !DILocation(line: 283, column: 2, scope: !252)
!304 = !DILocation(line: 283, column: 11, scope: !252)
!305 = !DILocation(line: 284, column: 2, scope: !252)
!306 = !DILocation(line: 284, column: 10, scope: !252)
!307 = !DILocation(line: 286, column: 1, scope: !252)
!308 = distinct !DISubprogram(name: "task_BW_btbl_bitcount", scope: !3, file: !3, line: 287, type: !19, scopeLine: 287, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!309 = !DILocalVariable(name: "U", scope: !308, file: !3, line: 293, type: !310)
!310 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !308, file: !3, line: 289, size: 32, elements: !311)
!311 = !{!312, !316}
!312 = !DIDerivedType(tag: DW_TAG_member, name: "ch", scope: !310, file: !3, line: 291, baseType: !313, size: 32)
!313 = !DICompositeType(tag: DW_TAG_array_type, baseType: !14, size: 32, elements: !314)
!314 = !{!315}
!315 = !DISubrange(count: 4)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "y", scope: !310, file: !3, line: 292, baseType: !317, size: 32)
!317 = !DIBasicType(name: "long int", size: 32, encoding: DW_ATE_signed)
!318 = !DILocation(line: 293, column: 4, scope: !308)
!319 = !DILocation(line: 295, column: 8, scope: !308)
!320 = !DILocation(line: 295, column: 4, scope: !308)
!321 = !DILocation(line: 295, column: 6, scope: !308)
!322 = !DILocation(line: 297, column: 21, scope: !308)
!323 = !DILocation(line: 297, column: 19, scope: !308)
!324 = !DILocation(line: 297, column: 13, scope: !308)
!325 = !DILocation(line: 297, column: 39, scope: !308)
!326 = !DILocation(line: 297, column: 37, scope: !308)
!327 = !DILocation(line: 297, column: 31, scope: !308)
!328 = !DILocation(line: 297, column: 29, scope: !308)
!329 = !DILocation(line: 298, column: 11, scope: !308)
!330 = !DILocation(line: 298, column: 9, scope: !308)
!331 = !DILocation(line: 298, column: 3, scope: !308)
!332 = !DILocation(line: 297, column: 47, scope: !308)
!333 = !DILocation(line: 298, column: 29, scope: !308)
!334 = !DILocation(line: 298, column: 27, scope: !308)
!335 = !DILocation(line: 298, column: 21, scope: !308)
!336 = !DILocation(line: 298, column: 19, scope: !308)
!337 = !DILocation(line: 297, column: 2, scope: !308)
!338 = !DILocation(line: 297, column: 10, scope: !308)
!339 = !DILocation(line: 299, column: 13, scope: !308)
!340 = !DILocation(line: 299, column: 22, scope: !308)
!341 = !DILocation(line: 299, column: 2, scope: !308)
!342 = !DILocation(line: 299, column: 11, scope: !308)
!343 = !DILocation(line: 300, column: 2, scope: !308)
!344 = !DILocation(line: 300, column: 10, scope: !308)
!345 = !DILocation(line: 302, column: 1, scope: !308)
!346 = distinct !DISubprogram(name: "task_AR_btbl_bitcount", scope: !3, file: !3, line: 303, type: !19, scopeLine: 303, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!347 = !DILocalVariable(name: "Ptr", scope: !346, file: !3, line: 305, type: !13)
!348 = !DILocation(line: 305, column: 18, scope: !346)
!349 = !DILocation(line: 305, column: 43, scope: !346)
!350 = !DILocation(line: 305, column: 24, scope: !346)
!351 = !DILocalVariable(name: "Accu", scope: !346, file: !3, line: 306, type: !12)
!352 = !DILocation(line: 306, column: 6, scope: !346)
!353 = !DILocation(line: 308, column: 20, scope: !346)
!354 = !DILocation(line: 308, column: 16, scope: !346)
!355 = !DILocation(line: 308, column: 10, scope: !346)
!356 = !DILocation(line: 308, column: 8, scope: !346)
!357 = !DILocation(line: 309, column: 20, scope: !346)
!358 = !DILocation(line: 309, column: 16, scope: !346)
!359 = !DILocation(line: 309, column: 10, scope: !346)
!360 = !DILocation(line: 309, column: 7, scope: !346)
!361 = !DILocation(line: 310, column: 20, scope: !346)
!362 = !DILocation(line: 310, column: 16, scope: !346)
!363 = !DILocation(line: 310, column: 10, scope: !346)
!364 = !DILocation(line: 310, column: 7, scope: !346)
!365 = !DILocation(line: 311, column: 17, scope: !346)
!366 = !DILocation(line: 311, column: 16, scope: !346)
!367 = !DILocation(line: 311, column: 10, scope: !346)
!368 = !DILocation(line: 311, column: 7, scope: !346)
!369 = !DILocation(line: 312, column: 12, scope: !346)
!370 = !DILocation(line: 312, column: 2, scope: !346)
!371 = !DILocation(line: 312, column: 9, scope: !346)
!372 = !DILocation(line: 313, column: 13, scope: !346)
!373 = !DILocation(line: 313, column: 22, scope: !346)
!374 = !DILocation(line: 313, column: 2, scope: !346)
!375 = !DILocation(line: 313, column: 11, scope: !346)
!376 = !DILocation(line: 314, column: 2, scope: !346)
!377 = !DILocation(line: 314, column: 10, scope: !346)
!378 = !DILocation(line: 316, column: 1, scope: !346)
!379 = distinct !DISubprogram(name: "task_bit_shifter", scope: !3, file: !3, line: 317, type: !19, scopeLine: 317, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!380 = !DILocalVariable(name: "i", scope: !379, file: !3, line: 319, type: !12)
!381 = !DILocation(line: 319, column: 6, scope: !379)
!382 = !DILocalVariable(name: "nn", scope: !379, file: !3, line: 319, type: !12)
!383 = !DILocation(line: 319, column: 9, scope: !379)
!384 = !DILocalVariable(name: "tmp_seed", scope: !379, file: !3, line: 320, type: !7)
!385 = !DILocation(line: 320, column: 11, scope: !379)
!386 = !DILocation(line: 320, column: 22, scope: !379)
!387 = !DILocation(line: 321, column: 14, scope: !388)
!388 = distinct !DILexicalBlock(scope: !379, file: !3, line: 321, column: 2)
!389 = !DILocation(line: 321, column: 9, scope: !388)
!390 = !DILocation(line: 321, column: 7, scope: !388)
!391 = !DILocation(line: 321, column: 19, scope: !392)
!392 = distinct !DILexicalBlock(scope: !388, file: !3, line: 321, column: 2)
!393 = !DILocation(line: 321, column: 28, scope: !392)
!394 = !DILocation(line: 321, column: 32, scope: !392)
!395 = !DILocation(line: 321, column: 34, scope: !392)
!396 = !DILocation(line: 0, scope: !392)
!397 = !DILocation(line: 321, column: 2, scope: !388)
!398 = !DILocation(line: 322, column: 15, scope: !392)
!399 = !DILocation(line: 322, column: 24, scope: !392)
!400 = !DILocation(line: 322, column: 9, scope: !392)
!401 = !DILocation(line: 322, column: 6, scope: !392)
!402 = !DILocation(line: 322, column: 3, scope: !392)
!403 = !DILocation(line: 321, column: 64, scope: !392)
!404 = !DILocation(line: 321, column: 78, scope: !392)
!405 = !DILocation(line: 321, column: 2, scope: !392)
!406 = distinct !{!406, !397, !407}
!407 = !DILocation(line: 322, column: 28, scope: !388)
!408 = !DILocation(line: 323, column: 13, scope: !379)
!409 = !DILocation(line: 323, column: 2, scope: !379)
!410 = !DILocation(line: 323, column: 10, scope: !379)
!411 = !DILocation(line: 324, column: 13, scope: !379)
!412 = !DILocation(line: 324, column: 22, scope: !379)
!413 = !DILocation(line: 324, column: 2, scope: !379)
!414 = !DILocation(line: 324, column: 11, scope: !379)
!415 = !DILocation(line: 326, column: 2, scope: !379)
!416 = !DILocation(line: 326, column: 10, scope: !379)
!417 = !DILocation(line: 328, column: 1, scope: !379)
!418 = distinct !DISubprogram(name: "task_done", scope: !3, file: !3, line: 330, type: !19, scopeLine: 330, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!419 = !DILocation(line: 332, column: 2, scope: !418)
!420 = distinct !DISubprogram(name: "task_commit", scope: !3, file: !3, line: 335, type: !19, scopeLine: 335, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!421 = !DILocation(line: 337, column: 1, scope: !420)
!422 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 339, type: !423, scopeLine: 339, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!423 = !DISubroutineType(types: !424)
!424 = !{!12}
!425 = !DILocation(line: 341, column: 16, scope: !422)
!426 = !DILocation(line: 342, column: 10, scope: !422)
!427 = !DILocation(line: 343, column: 12, scope: !422)
!428 = !DILocation(line: 344, column: 5, scope: !422)
!429 = !DILocation(line: 346, column: 2, scope: !422)
!430 = !DILocation(line: 346, column: 2, scope: !431)
!431 = distinct !DILexicalBlock(scope: !432, file: !3, line: 346, column: 2)
!432 = distinct !DILexicalBlock(scope: !422, file: !3, line: 346, column: 2)
!433 = !DILocation(line: 346, column: 2, scope: !432)
!434 = !DILocation(line: 346, column: 2, scope: !435)
!435 = distinct !DILexicalBlock(scope: !431, file: !3, line: 346, column: 2)
!436 = !DILocation(line: 346, column: 2, scope: !437)
!437 = distinct !DILexicalBlock(scope: !431, file: !3, line: 346, column: 2)
!438 = !DILocation(line: 348, column: 2, scope: !422)
!439 = !DILocation(line: 350, column: 3, scope: !440)
!440 = distinct !DILexicalBlock(scope: !422, file: !3, line: 348, column: 11)
!441 = !DILocation(line: 350, column: 3, scope: !442)
!442 = distinct !DILexicalBlock(scope: !443, file: !3, line: 350, column: 3)
!443 = distinct !DILexicalBlock(scope: !440, file: !3, line: 350, column: 3)
!444 = !DILocation(line: 350, column: 3, scope: !443)
!445 = !DILocation(line: 350, column: 3, scope: !446)
!446 = distinct !DILexicalBlock(scope: !442, file: !3, line: 350, column: 3)
!447 = !DILocation(line: 350, column: 3, scope: !448)
!448 = distinct !DILexicalBlock(scope: !442, file: !3, line: 350, column: 3)
!449 = !DILocation(line: 352, column: 7, scope: !450)
!450 = distinct !DILexicalBlock(scope: !440, file: !3, line: 352, column: 7)
!451 = !DILocation(line: 352, column: 17, scope: !450)
!452 = !DILocation(line: 352, column: 7, scope: !440)
!453 = !DILocation(line: 354, column: 4, scope: !454)
!454 = distinct !DILexicalBlock(scope: !450, file: !3, line: 352, column: 22)
!455 = !DILocation(line: 354, column: 11, scope: !454)
!456 = !DILocation(line: 354, column: 21, scope: !454)
!457 = !DILocation(line: 356, column: 5, scope: !458)
!458 = distinct !DILexicalBlock(scope: !454, file: !3, line: 354, column: 29)
!459 = !DILocation(line: 356, column: 5, scope: !460)
!460 = distinct !DILexicalBlock(scope: !461, file: !3, line: 356, column: 5)
!461 = distinct !DILexicalBlock(scope: !458, file: !3, line: 356, column: 5)
!462 = !DILocation(line: 356, column: 5, scope: !461)
!463 = !DILocation(line: 356, column: 5, scope: !464)
!464 = distinct !DILexicalBlock(scope: !460, file: !3, line: 356, column: 5)
!465 = !DILocation(line: 356, column: 5, scope: !466)
!466 = distinct !DILexicalBlock(scope: !460, file: !3, line: 356, column: 5)
!467 = distinct !{!467, !453, !468}
!468 = !DILocation(line: 358, column: 4, scope: !454)
!469 = !DILocation(line: 360, column: 3, scope: !454)
!470 = !DILocation(line: 360, column: 14, scope: !471)
!471 = distinct !DILexicalBlock(scope: !450, file: !3, line: 360, column: 14)
!472 = !DILocation(line: 360, column: 24, scope: !471)
!473 = !DILocation(line: 360, column: 14, scope: !450)
!474 = !DILocation(line: 362, column: 4, scope: !475)
!475 = distinct !DILexicalBlock(scope: !471, file: !3, line: 360, column: 30)
!476 = !DILocation(line: 362, column: 11, scope: !475)
!477 = !DILocation(line: 362, column: 21, scope: !475)
!478 = !DILocation(line: 364, column: 5, scope: !479)
!479 = distinct !DILexicalBlock(scope: !475, file: !3, line: 362, column: 29)
!480 = !DILocation(line: 364, column: 5, scope: !481)
!481 = distinct !DILexicalBlock(scope: !482, file: !3, line: 364, column: 5)
!482 = distinct !DILexicalBlock(scope: !479, file: !3, line: 364, column: 5)
!483 = !DILocation(line: 364, column: 5, scope: !482)
!484 = !DILocation(line: 364, column: 5, scope: !485)
!485 = distinct !DILexicalBlock(scope: !481, file: !3, line: 364, column: 5)
!486 = !DILocation(line: 364, column: 5, scope: !487)
!487 = distinct !DILexicalBlock(scope: !481, file: !3, line: 364, column: 5)
!488 = distinct !{!488, !474, !489}
!489 = !DILocation(line: 366, column: 4, scope: !475)
!490 = !DILocation(line: 368, column: 3, scope: !475)
!491 = !DILocation(line: 368, column: 14, scope: !492)
!492 = distinct !DILexicalBlock(scope: !471, file: !3, line: 368, column: 14)
!493 = !DILocation(line: 368, column: 24, scope: !492)
!494 = !DILocation(line: 368, column: 14, scope: !471)
!495 = !DILocation(line: 370, column: 4, scope: !496)
!496 = distinct !DILexicalBlock(scope: !492, file: !3, line: 368, column: 30)
!497 = !DILocation(line: 370, column: 11, scope: !496)
!498 = !DILocation(line: 370, column: 21, scope: !496)
!499 = !DILocation(line: 372, column: 5, scope: !500)
!500 = distinct !DILexicalBlock(scope: !496, file: !3, line: 370, column: 29)
!501 = !DILocation(line: 372, column: 5, scope: !502)
!502 = distinct !DILexicalBlock(scope: !503, file: !3, line: 372, column: 5)
!503 = distinct !DILexicalBlock(scope: !500, file: !3, line: 372, column: 5)
!504 = !DILocation(line: 372, column: 5, scope: !503)
!505 = !DILocation(line: 372, column: 5, scope: !506)
!506 = distinct !DILexicalBlock(scope: !502, file: !3, line: 372, column: 5)
!507 = !DILocation(line: 372, column: 5, scope: !508)
!508 = distinct !DILexicalBlock(scope: !502, file: !3, line: 372, column: 5)
!509 = distinct !{!509, !495, !510}
!510 = !DILocation(line: 374, column: 4, scope: !496)
!511 = !DILocation(line: 376, column: 3, scope: !496)
!512 = !DILocation(line: 376, column: 14, scope: !513)
!513 = distinct !DILexicalBlock(scope: !492, file: !3, line: 376, column: 14)
!514 = !DILocation(line: 376, column: 24, scope: !513)
!515 = !DILocation(line: 376, column: 14, scope: !492)
!516 = !DILocation(line: 378, column: 4, scope: !517)
!517 = distinct !DILexicalBlock(scope: !513, file: !3, line: 376, column: 30)
!518 = !DILocation(line: 378, column: 11, scope: !517)
!519 = !DILocation(line: 378, column: 21, scope: !517)
!520 = !DILocation(line: 380, column: 5, scope: !521)
!521 = distinct !DILexicalBlock(scope: !517, file: !3, line: 378, column: 29)
!522 = !DILocation(line: 380, column: 5, scope: !523)
!523 = distinct !DILexicalBlock(scope: !524, file: !3, line: 380, column: 5)
!524 = distinct !DILexicalBlock(scope: !521, file: !3, line: 380, column: 5)
!525 = !DILocation(line: 380, column: 5, scope: !524)
!526 = !DILocation(line: 380, column: 5, scope: !527)
!527 = distinct !DILexicalBlock(scope: !523, file: !3, line: 380, column: 5)
!528 = !DILocation(line: 380, column: 5, scope: !529)
!529 = distinct !DILexicalBlock(scope: !523, file: !3, line: 380, column: 5)
!530 = distinct !{!530, !516, !531}
!531 = !DILocation(line: 382, column: 4, scope: !517)
!532 = !DILocation(line: 384, column: 3, scope: !517)
!533 = !DILocation(line: 384, column: 14, scope: !534)
!534 = distinct !DILexicalBlock(scope: !513, file: !3, line: 384, column: 14)
!535 = !DILocation(line: 384, column: 24, scope: !534)
!536 = !DILocation(line: 384, column: 14, scope: !513)
!537 = !DILocation(line: 386, column: 4, scope: !538)
!538 = distinct !DILexicalBlock(scope: !534, file: !3, line: 384, column: 30)
!539 = !DILocation(line: 386, column: 11, scope: !538)
!540 = !DILocation(line: 386, column: 21, scope: !538)
!541 = !DILocation(line: 388, column: 5, scope: !542)
!542 = distinct !DILexicalBlock(scope: !538, file: !3, line: 386, column: 29)
!543 = !DILocation(line: 388, column: 5, scope: !544)
!544 = distinct !DILexicalBlock(scope: !545, file: !3, line: 388, column: 5)
!545 = distinct !DILexicalBlock(scope: !542, file: !3, line: 388, column: 5)
!546 = !DILocation(line: 388, column: 5, scope: !545)
!547 = !DILocation(line: 388, column: 5, scope: !548)
!548 = distinct !DILexicalBlock(scope: !544, file: !3, line: 388, column: 5)
!549 = !DILocation(line: 388, column: 5, scope: !550)
!550 = distinct !DILexicalBlock(scope: !544, file: !3, line: 388, column: 5)
!551 = distinct !{!551, !537, !552}
!552 = !DILocation(line: 390, column: 4, scope: !538)
!553 = !DILocation(line: 392, column: 3, scope: !538)
!554 = !DILocation(line: 392, column: 14, scope: !555)
!555 = distinct !DILexicalBlock(scope: !534, file: !3, line: 392, column: 14)
!556 = !DILocation(line: 392, column: 24, scope: !555)
!557 = !DILocation(line: 392, column: 14, scope: !534)
!558 = !DILocation(line: 394, column: 4, scope: !559)
!559 = distinct !DILexicalBlock(scope: !555, file: !3, line: 392, column: 30)
!560 = !DILocation(line: 394, column: 11, scope: !559)
!561 = !DILocation(line: 394, column: 21, scope: !559)
!562 = !DILocation(line: 396, column: 5, scope: !563)
!563 = distinct !DILexicalBlock(scope: !559, file: !3, line: 394, column: 29)
!564 = !DILocation(line: 396, column: 5, scope: !565)
!565 = distinct !DILexicalBlock(scope: !566, file: !3, line: 396, column: 5)
!566 = distinct !DILexicalBlock(scope: !563, file: !3, line: 396, column: 5)
!567 = !DILocation(line: 396, column: 5, scope: !566)
!568 = !DILocation(line: 396, column: 5, scope: !569)
!569 = distinct !DILexicalBlock(scope: !565, file: !3, line: 396, column: 5)
!570 = !DILocation(line: 396, column: 5, scope: !571)
!571 = distinct !DILexicalBlock(scope: !565, file: !3, line: 396, column: 5)
!572 = distinct !{!572, !558, !573}
!573 = !DILocation(line: 398, column: 4, scope: !559)
!574 = !DILocation(line: 400, column: 3, scope: !559)
!575 = !DILocation(line: 400, column: 14, scope: !576)
!576 = distinct !DILexicalBlock(scope: !555, file: !3, line: 400, column: 14)
!577 = !DILocation(line: 400, column: 24, scope: !576)
!578 = !DILocation(line: 400, column: 14, scope: !555)
!579 = !DILocation(line: 402, column: 4, scope: !580)
!580 = distinct !DILexicalBlock(scope: !576, file: !3, line: 400, column: 30)
!581 = !DILocation(line: 402, column: 11, scope: !580)
!582 = !DILocation(line: 402, column: 21, scope: !580)
!583 = !DILocation(line: 404, column: 5, scope: !584)
!584 = distinct !DILexicalBlock(scope: !580, file: !3, line: 402, column: 29)
!585 = !DILocation(line: 404, column: 5, scope: !586)
!586 = distinct !DILexicalBlock(scope: !587, file: !3, line: 404, column: 5)
!587 = distinct !DILexicalBlock(scope: !584, file: !3, line: 404, column: 5)
!588 = !DILocation(line: 404, column: 5, scope: !587)
!589 = !DILocation(line: 404, column: 5, scope: !590)
!590 = distinct !DILexicalBlock(scope: !586, file: !3, line: 404, column: 5)
!591 = !DILocation(line: 404, column: 5, scope: !592)
!592 = distinct !DILexicalBlock(scope: !586, file: !3, line: 404, column: 5)
!593 = distinct !{!593, !579, !594}
!594 = !DILocation(line: 406, column: 4, scope: !580)
!595 = !DILocation(line: 408, column: 3, scope: !580)
!596 = !DILocation(line: 408, column: 14, scope: !597)
!597 = distinct !DILexicalBlock(scope: !576, file: !3, line: 408, column: 14)
!598 = !DILocation(line: 408, column: 24, scope: !597)
!599 = !DILocation(line: 408, column: 14, scope: !576)
!600 = !DILocation(line: 410, column: 4, scope: !601)
!601 = distinct !DILexicalBlock(scope: !597, file: !3, line: 408, column: 30)
!602 = !DILocation(line: 412, column: 3, scope: !601)
!603 = distinct !{!603, !438, !604}
!604 = !DILocation(line: 413, column: 2, scope: !422)
