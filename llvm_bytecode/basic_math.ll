; ModuleID = 'basic_math.bc'
source_filename = "../example/basic_math.c"
target datalayout = "e-m:e-p:16:16-i32:16-i64:16-f32:16-f64:16-a:8-n8:16-S16"
target triple = "msp430"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [11 x i16], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i16, i16, i16, [5 x i16], [5 x i16] }

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
@safe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !24
@unsafe = common dso_local global %struct.camel_buffer_t* null, align 2, !dbg !49
@tmp_stack_crc = common dso_local global i16 0, align 2, !dbg !13
@tmp_stack_buf_crc = common dso_local global i16 0, align 2, !dbg !20
@__const.task_check.ref_arr1 = private unnamed_addr constant [5 x i16] [i16 2, i16 0, i16 0, i16 0, i16 5], align 2
@__const.task_check.ref_arr2 = private unnamed_addr constant [5 x i16] [i16 0, i16 2, i16 0, i16 5, i16 5], align 2
@reset_vector = internal global void ()* @camel_recover, section "__interrupt_vector_56", align 2, !dbg !8
@writeOpt = common dso_local global i16 0, align 2, !dbg !22
@buf = common dso_local global [11 x i16] zeroinitializer, align 2, !dbg !51
@llvm.used = appending global [1 x i8*] [i8* bitcast (void ()** @reset_vector to i8*)], section "llvm.metadata"

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_init() #0 !dbg !63 {
entry:
  store volatile i16 23168, i16* @WDTCTL, align 2, !dbg !64
  %0 = load volatile i8, i8* @PADIR_L, align 1, !dbg !65
  %conv = zext i8 %0 to i16, !dbg !65
  %or = or i16 %conv, 1, !dbg !65
  %conv1 = trunc i16 %or to i8, !dbg !65
  store volatile i8 %conv1, i8* @PADIR_L, align 1, !dbg !65
  %1 = load volatile i8, i8* @PAOUT_L, align 1, !dbg !66
  %conv2 = zext i8 %1 to i16, !dbg !66
  %and = and i16 %conv2, -2, !dbg !66
  %conv3 = trunc i16 %and to i8, !dbg !66
  store volatile i8 %conv3, i8* @PAOUT_L, align 1, !dbg !66
  %2 = load volatile i16, i16* @PM5CTL0, align 2, !dbg !67
  %and4 = and i16 %2, -2, !dbg !67
  store volatile i16 %and4, i16* @PM5CTL0, align 2, !dbg !67
  store volatile i8 -91, i8* @CSCTL0_H, align 1, !dbg !68
  store volatile i16 64, i16* @CSCTL1, align 2, !dbg !69
  store volatile i16 307, i16* @CSCTL2, align 2, !dbg !70
  store volatile i16 0, i16* @CSCTL3, align 2, !dbg !71
  store volatile i8 0, i8* @CSCTL0_H, align 1, !dbg !72
  store volatile i16 -23296, i16* @FRCTL0, align 2, !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind optnone
define dso_local void @camel_recover() #0 !dbg !75 {
entry:
  %__x = alloca i16, align 2
  %tmp = alloca i16, align 2
  %__x5 = alloca i16, align 2
  %tmp6 = alloca i16, align 2
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !76
  %cmp = icmp eq i16 %0, 1, !dbg !78
  br i1 %cmp, label %if.then, label %if.else, !dbg !79

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !80
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !82
  br label %if.end4, !dbg !83

if.else:                                          ; preds = %entry
  %1 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !84
  %cmp1 = icmp eq i16 %1, 2, !dbg !86
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !87

if.then2:                                         ; preds = %if.else
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !88
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !90
  br label %if.end, !dbg !91

if.else3:                                         ; preds = %if.else
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !92
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !94
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 0, !dbg !94
  %arrayidx = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 9, !dbg !94
  %3 = load i16, i16* %arrayidx, align 2, !dbg !94
  call void asm sideeffect "mov $0, SP", "ri"(i16 %3) #4, !dbg !94, !srcloc !96
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !97, metadata !DIExpression()), !dbg !99
  %4 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !99, !srcloc !100
  store i16 %4, i16* %__x, align 2, !dbg !99
  %5 = load i16, i16* %__x, align 2, !dbg !99
  store i16 %5, i16* %tmp, align 2, !dbg !99
  %6 = load i16, i16* %tmp, align 2, !dbg !99
  %add = add i16 %6, 2, !dbg !101
  %7 = inttoptr i16 %add to i8*, !dbg !102
  call void @llvm.dbg.declare(metadata i16* %__x5, metadata !103, metadata !DIExpression()), !dbg !105
  %8 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !105, !srcloc !106
  store i16 %8, i16* %__x5, align 2, !dbg !105
  %9 = load i16, i16* %__x5, align 2, !dbg !105
  store i16 %9, i16* %tmp6, align 2, !dbg !105
  %10 = load i16, i16* %tmp6, align 2, !dbg !105
  %add7 = add i16 %10, 2, !dbg !107
  %sub = sub i16 9216, %add7, !dbg !108
  %call = call zeroext i16 @__fast_hw_crc(i8* %7, i16 zeroext %sub, i16 zeroext -1), !dbg !109
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !110
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !111
  %12 = bitcast %struct.camel_buffer_t* %11 to i8*, !dbg !111
  %13 = load i16, i16* @tmp_stack_crc, align 2, !dbg !112
  %call8 = call zeroext i16 @__fast_hw_crc(i8* %12, i16 zeroext 48, i16 zeroext %13), !dbg !113
  store i16 %call8, i16* @tmp_stack_buf_crc, align 2, !dbg !114
  %14 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !115
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !117
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 2, !dbg !118
  %16 = load i16, i16* %stack_and_buf_crc, align 2, !dbg !118
  %cmp9 = icmp eq i16 %14, %16, !dbg !119
  br i1 %cmp9, label %if.then10, label %if.else12, !dbg !120

if.then10:                                        ; preds = %if.end4
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !121
  %18 = bitcast %struct.camel_buffer_t* %17 to i8*, !dbg !123
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !124
  %20 = bitcast %struct.camel_buffer_t* %19 to i8*, !dbg !123
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %18, i8* align 2 %20, i16 50, i1 false), !dbg !123
  call void @camel_init(), !dbg !125
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !126
  %reg_file11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 0, !dbg !127
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file11, i16 0, i16 0, !dbg !126
  call void @__restore_registers(i16* %arraydecay), !dbg !128
  br label %if.end13, !dbg !129

if.else12:                                        ; preds = %if.end4
  call void bitcast (void (...)* @__crt0_start to void ()*)(), !dbg !130
  br label %if.end13

if.end13:                                         ; preds = %if.else12, %if.then10
  ret void, !dbg !132
}

declare dso_local void @__crt0_start(...) #1

declare dso_local zeroext i16 @__fast_hw_crc(i8*, i16 zeroext, i16 zeroext) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i16(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i16, i1 immarg) #3

declare dso_local void @__restore_registers(i16*) #1

; Function Attrs: noinline nounwind optnone
define dso_local zeroext i8 @arrEqual(i16* %ptr1, i16* %ptr2, i16 %len) #0 !dbg !133 {
entry:
  %retval = alloca i8, align 1
  %ptr1.addr = alloca i16*, align 2
  %ptr2.addr = alloca i16*, align 2
  %len.addr = alloca i16, align 2
  %i = alloca i16, align 2
  store i16* %ptr1, i16** %ptr1.addr, align 2
  call void @llvm.dbg.declare(metadata i16** %ptr1.addr, metadata !142, metadata !DIExpression()), !dbg !143
  store i16* %ptr2, i16** %ptr2.addr, align 2
  call void @llvm.dbg.declare(metadata i16** %ptr2.addr, metadata !144, metadata !DIExpression()), !dbg !145
  store i16 %len, i16* %len.addr, align 2
  call void @llvm.dbg.declare(metadata i16* %len.addr, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i16* %i, metadata !148, metadata !DIExpression()), !dbg !149
  store i16 0, i16* %i, align 2, !dbg !150
  br label %for.cond, !dbg !152

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i16, i16* %i, align 2, !dbg !153
  %1 = load i16, i16* %len.addr, align 2, !dbg !155
  %cmp = icmp ult i16 %0, %1, !dbg !156
  br i1 %cmp, label %for.body, label %for.end, !dbg !157

for.body:                                         ; preds = %for.cond
  %2 = load i16*, i16** %ptr1.addr, align 2, !dbg !158
  %3 = load i16, i16* %i, align 2, !dbg !161
  %arrayidx = getelementptr inbounds i16, i16* %2, i16 %3, !dbg !158
  %4 = load i16, i16* %arrayidx, align 2, !dbg !158
  %5 = load i16*, i16** %ptr2.addr, align 2, !dbg !162
  %6 = load i16, i16* %i, align 2, !dbg !163
  %arrayidx1 = getelementptr inbounds i16, i16* %5, i16 %6, !dbg !162
  %7 = load i16, i16* %arrayidx1, align 2, !dbg !162
  %cmp2 = icmp ne i16 %4, %7, !dbg !164
  br i1 %cmp2, label %if.then, label %if.end, !dbg !165

if.then:                                          ; preds = %for.body
  store i8 0, i8* %retval, align 1, !dbg !166
  br label %return, !dbg !166

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !168

for.inc:                                          ; preds = %if.end
  %8 = load i16, i16* %i, align 2, !dbg !169
  %inc = add i16 %8, 1, !dbg !169
  store i16 %inc, i16* %i, align 2, !dbg !169
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  store i8 1, i8* %retval, align 1, !dbg !173
  br label %return, !dbg !173

return:                                           ; preds = %for.end, %if.then
  %9 = load i8, i8* %retval, align 1, !dbg !174
  ret i8 %9, !dbg !174
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_init() #0 !dbg !175 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !176
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !176
  %v1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !176
  store i16 1, i16* %v1, align 2, !dbg !177
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !178
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1, !dbg !178
  %v2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !178
  store i16 2, i16* %v2, align 2, !dbg !179
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !180
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !180
  %v3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !180
  store i16 0, i16* %v3, align 2, !dbg !181
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !182
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !182
  %arr1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !182
  %arraydecay = getelementptr inbounds [5 x i16], [5 x i16]* %arr1, i16 0, i16 0, !dbg !183
  %4 = bitcast i16* %arraydecay to i8*, !dbg !183
  call void @llvm.memset.p0i8.i16(i8* align 2 %4, i8 0, i16 10, i1 false), !dbg !183
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !184
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !184
  %arr2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 4, !dbg !184
  %arraydecay5 = getelementptr inbounds [5 x i16], [5 x i16]* %arr2, i16 0, i16 0, !dbg !185
  %6 = bitcast i16* %arraydecay5 to i8*, !dbg !185
  call void @llvm.memset.p0i8.i16(i8* align 2 %6, i8 0, i16 10, i1 false), !dbg !185
  ret void, !dbg !186
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i16(i8* nocapture writeonly, i8, i16, i1 immarg) #3

; Function Attrs: noinline nounwind optnone
define dso_local void @task_1() #0 !dbg !187 {
entry:
  %opt = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !188
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !188
  %v1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !188
  %1 = load i16, i16* %v1, align 2, !dbg !189
  %add = add i16 %1, 1, !dbg !189
  store i16 %add, i16* %v1, align 2, !dbg !189
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !190
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !190
  %v12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0, !dbg !190
  %3 = load i16, i16* %v12, align 2, !dbg !190
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !191
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1, !dbg !191
  %v14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 0, !dbg !191
  %5 = load i16, i16* %v14, align 2, !dbg !191
  %add5 = add i16 %3, %5, !dbg !192
  %add6 = add i16 %add5, 5, !dbg !193
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !194
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1, !dbg !194
  %v2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 1, !dbg !194
  store i16 %add6, i16* %v2, align 2, !dbg !195
  call void @llvm.dbg.declare(metadata i16* %opt, metadata !196, metadata !DIExpression()), !dbg !198
  store i16 0, i16* %opt, align 2, !dbg !198
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !199
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1, !dbg !199
  %v19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 0, !dbg !199
  %8 = load i16, i16* %v19, align 2, !dbg !199
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !200
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !200
  %arr1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 3, !dbg !200
  %10 = load i16, i16* %opt, align 2, !dbg !201
  %arrayidx = getelementptr inbounds [5 x i16], [5 x i16]* %arr1, i16 0, i16 %10, !dbg !200
  store i16 %8, i16* %arrayidx, align 2, !dbg !202
  ret void, !dbg !203
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_2() #0 !dbg !204 {
entry:
  %read1 = alloca i16, align 2
  %read2 = alloca i16, align 2
  %write1 = alloca i16, align 2
  %write2 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata i16* %read1, metadata !205, metadata !DIExpression()), !dbg !206
  store i16 0, i16* %read1, align 2, !dbg !206
  call void @llvm.dbg.declare(metadata i16* %read2, metadata !207, metadata !DIExpression()), !dbg !208
  store i16 3, i16* %read2, align 2, !dbg !208
  call void @llvm.dbg.declare(metadata i16* %write1, metadata !209, metadata !DIExpression()), !dbg !210
  store i16 1, i16* %write1, align 2, !dbg !210
  call void @llvm.dbg.declare(metadata i16* %write2, metadata !211, metadata !DIExpression()), !dbg !212
  store i16 1, i16* %write2, align 2, !dbg !212
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !213
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !213
  %arr1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 3, !dbg !213
  %1 = load i16, i16* %read1, align 2, !dbg !214
  %arrayidx = getelementptr inbounds [5 x i16], [5 x i16]* %arr1, i16 0, i16 %1, !dbg !213
  %2 = load i16, i16* %arrayidx, align 2, !dbg !213
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !215
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !215
  %arr2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 4, !dbg !215
  %4 = load i16, i16* %write1, align 2, !dbg !216
  %arrayidx2 = getelementptr inbounds [5 x i16], [5 x i16]* %arr2, i16 0, i16 %4, !dbg !215
  store i16 %2, i16* %arrayidx2, align 2, !dbg !217
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !218
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !218
  %arr14 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 3, !dbg !218
  %6 = load i16, i16* %read2, align 2, !dbg !219
  %arrayidx5 = getelementptr inbounds [5 x i16], [5 x i16]* %arr14, i16 0, i16 %6, !dbg !218
  %7 = load i16, i16* %arrayidx5, align 2, !dbg !218
  %add = add i16 %7, 5, !dbg !220
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !221
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !221
  %arr17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 3, !dbg !221
  %9 = load i16, i16* %write2, align 2, !dbg !222
  %arrayidx8 = getelementptr inbounds [5 x i16], [5 x i16]* %arr17, i16 0, i16 %9, !dbg !221
  %10 = load i16, i16* %arrayidx8, align 2, !dbg !223
  %add9 = add i16 %10, %add, !dbg !223
  store i16 %add9, i16* %arrayidx8, align 2, !dbg !223
  ret void, !dbg !224
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_3() #0 !dbg !225 {
entry:
  %opt = alloca i16, align 2
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !226
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1, !dbg !226
  %v1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !226
  %1 = load i16, i16* %v1, align 2, !dbg !226
  %add = add i16 %1, 1, !dbg !227
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !228
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !228
  %v3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2, !dbg !228
  store i16 %add, i16* %v3, align 2, !dbg !229
  call void @llvm.dbg.declare(metadata i16* %opt, metadata !230, metadata !DIExpression()), !dbg !231
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !232
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1, !dbg !232
  %v33 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 2, !dbg !232
  %4 = load i16, i16* %v33, align 2, !dbg !232
  %add4 = add i16 %4, 1, !dbg !233
  store i16 %add4, i16* %opt, align 2, !dbg !231
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !234
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !234
  %arr1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 3, !dbg !234
  %6 = load i16, i16* %opt, align 2, !dbg !235
  %arrayidx = getelementptr inbounds [5 x i16], [5 x i16]* %arr1, i16 0, i16 %6, !dbg !234
  %7 = load i16, i16* %arrayidx, align 2, !dbg !234
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !236
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !236
  %arr2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 4, !dbg !236
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !237
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1, !dbg !237
  %v38 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 2, !dbg !237
  %10 = load i16, i16* %v38, align 2, !dbg !237
  %arrayidx9 = getelementptr inbounds [5 x i16], [5 x i16]* %arr2, i16 0, i16 %10, !dbg !236
  store i16 %7, i16* %arrayidx9, align 2, !dbg !238
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !239
  %globals10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !239
  %v311 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals10, i32 0, i32 2, !dbg !239
  %12 = load i16, i16* %v311, align 2, !dbg !240
  %add12 = add i16 %12, 1, !dbg !240
  store i16 %add12, i16* %v311, align 2, !dbg !240
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !241
  %globals13 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1, !dbg !241
  %arr114 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals13, i32 0, i32 3, !dbg !241
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !242
  %globals15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1, !dbg !242
  %v316 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals15, i32 0, i32 2, !dbg !242
  %15 = load i16, i16* %v316, align 2, !dbg !242
  %arrayidx17 = getelementptr inbounds [5 x i16], [5 x i16]* %arr114, i16 0, i16 %15, !dbg !241
  %16 = load i16, i16* %arrayidx17, align 2, !dbg !241
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !243
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1, !dbg !243
  %arr219 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 4, !dbg !243
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !244
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1, !dbg !244
  %v321 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 2, !dbg !244
  %19 = load i16, i16* %v321, align 2, !dbg !244
  %arrayidx22 = getelementptr inbounds [5 x i16], [5 x i16]* %arr219, i16 0, i16 %19, !dbg !243
  store i16 %16, i16* %arrayidx22, align 2, !dbg !245
  ret void, !dbg !246
}

; Function Attrs: noinline nounwind optnone
define dso_local void @success() #0 !dbg !247 {
entry:
  ret void, !dbg !248
}

; Function Attrs: noinline nounwind optnone
define dso_local void @failure() #0 !dbg !249 {
entry:
  ret void, !dbg !250
}

; Function Attrs: noinline nounwind optnone
define dso_local void @task_check() #0 !dbg !251 {
entry:
  %ref_arr1 = alloca [5 x i16], align 2
  %ref_arr2 = alloca [5 x i16], align 2
  %ref_v1 = alloca i16, align 2
  %ref_v2 = alloca i16, align 2
  %ref_v3 = alloca i16, align 2
  call void @llvm.dbg.declare(metadata [5 x i16]* %ref_arr1, metadata !252, metadata !DIExpression()), !dbg !253
  %0 = bitcast [5 x i16]* %ref_arr1 to i8*, !dbg !253
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %0, i8* align 2 bitcast ([5 x i16]* @__const.task_check.ref_arr1 to i8*), i16 10, i1 false), !dbg !253
  call void @llvm.dbg.declare(metadata [5 x i16]* %ref_arr2, metadata !254, metadata !DIExpression()), !dbg !255
  %1 = bitcast [5 x i16]* %ref_arr2 to i8*, !dbg !255
  call void @llvm.memcpy.p0i8.p0i8.i16(i8* align 2 %1, i8* align 2 bitcast ([5 x i16]* @__const.task_check.ref_arr2 to i8*), i16 10, i1 false), !dbg !255
  call void @llvm.dbg.declare(metadata i16* %ref_v1, metadata !256, metadata !DIExpression()), !dbg !257
  store i16 2, i16* %ref_v1, align 2, !dbg !257
  call void @llvm.dbg.declare(metadata i16* %ref_v2, metadata !258, metadata !DIExpression()), !dbg !259
  store i16 9, i16* %ref_v2, align 2, !dbg !259
  call void @llvm.dbg.declare(metadata i16* %ref_v3, metadata !260, metadata !DIExpression()), !dbg !261
  store i16 4, i16* %ref_v3, align 2, !dbg !261
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !262
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1, !dbg !262
  %v1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0, !dbg !262
  %3 = load i16, i16* %v1, align 2, !dbg !262
  %4 = load i16, i16* %ref_v1, align 2, !dbg !264
  %cmp = icmp ne i16 %3, %4, !dbg !265
  br i1 %cmp, label %if.then, label %if.end, !dbg !266

if.then:                                          ; preds = %entry
  call void @failure(), !dbg !267
  br label %if.end, !dbg !269

if.end:                                           ; preds = %if.then, %entry
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !270
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1, !dbg !270
  %v2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1, !dbg !270
  %6 = load i16, i16* %v2, align 2, !dbg !270
  %7 = load i16, i16* %ref_v2, align 2, !dbg !272
  %cmp2 = icmp ne i16 %6, %7, !dbg !273
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !274

if.then3:                                         ; preds = %if.end
  call void @failure(), !dbg !275
  br label %if.end4, !dbg !277

if.end4:                                          ; preds = %if.then3, %if.end
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !278
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1, !dbg !278
  %v3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 2, !dbg !278
  %9 = load i16, i16* %v3, align 2, !dbg !278
  %10 = load i16, i16* %ref_v3, align 2, !dbg !280
  %cmp6 = icmp ne i16 %9, %10, !dbg !281
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !282

if.then7:                                         ; preds = %if.end4
  call void @failure(), !dbg !283
  br label %if.end8, !dbg !285

if.end8:                                          ; preds = %if.then7, %if.end4
  %arraydecay = getelementptr inbounds [5 x i16], [5 x i16]* %ref_arr1, i16 0, i16 0, !dbg !286
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !288
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1, !dbg !288
  %arr1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 3, !dbg !288
  %arraydecay10 = getelementptr inbounds [5 x i16], [5 x i16]* %arr1, i16 0, i16 0, !dbg !288
  %call = call zeroext i8 @arrEqual(i16* %arraydecay, i16* %arraydecay10, i16 5), !dbg !289
  %tobool = icmp ne i8 %call, 0, !dbg !289
  br i1 %tobool, label %if.end12, label %if.then11, !dbg !290

if.then11:                                        ; preds = %if.end8
  call void @failure(), !dbg !291
  br label %if.end12, !dbg !293

if.end12:                                         ; preds = %if.then11, %if.end8
  %arraydecay13 = getelementptr inbounds [5 x i16], [5 x i16]* %ref_arr2, i16 0, i16 0, !dbg !294
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 2, !dbg !296
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1, !dbg !296
  %arr2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 4, !dbg !296
  %arraydecay15 = getelementptr inbounds [5 x i16], [5 x i16]* %arr2, i16 0, i16 0, !dbg !296
  %call16 = call zeroext i8 @arrEqual(i16* %arraydecay13, i16* %arraydecay15, i16 5), !dbg !297
  %tobool17 = icmp ne i8 %call16, 0, !dbg !297
  br i1 %tobool17, label %if.end19, label %if.then18, !dbg !298

if.then18:                                        ; preds = %if.end12
  call void @failure(), !dbg !299
  br label %if.end19, !dbg !301

if.end19:                                         ; preds = %if.then18, %if.end12
  call void @success(), !dbg !302
  ret void, !dbg !303
}

; Function Attrs: noinline nounwind optnone
define dso_local i16 @main() #0 !dbg !304 {
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
  %__x52 = alloca i16, align 2
  %tmp53 = alloca i16, align 2
  %__x55 = alloca i16, align 2
  %tmp56 = alloca i16, align 2
  %__x65 = alloca i16, align 2
  %tmp66 = alloca i16, align 2
  %__x68 = alloca i16, align 2
  %tmp69 = alloca i16, align 2
  %__x82 = alloca i16, align 2
  %tmp83 = alloca i16, align 2
  %__x85 = alloca i16, align 2
  %tmp86 = alloca i16, align 2
  %__x95 = alloca i16, align 2
  %tmp96 = alloca i16, align 2
  %__x98 = alloca i16, align 2
  %tmp99 = alloca i16, align 2
  store i16 0, i16* %retval, align 2
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !307
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !308
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !309
  call void @camel_init(), !dbg !310
  call void @task_init(), !dbg !311
  br label %do.body, !dbg !312

do.body:                                          ; preds = %entry
  %0 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !313
  %cmp = icmp eq i16 %0, 1, !dbg !313
  br i1 %cmp, label %if.then, label %if.else, !dbg !316

if.then:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !317
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !317
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !317
  %reg_file = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 0, !dbg !317
  %arraydecay = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file, i16 0, i16 0, !dbg !317
  call void @__dump_registers(i16* %arraydecay), !dbg !317
  call void @llvm.dbg.declare(metadata i16* %__x, metadata !319, metadata !DIExpression()), !dbg !321
  %2 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !321, !srcloc !322
  store i16 %2, i16* %__x, align 2, !dbg !321
  %3 = load i16, i16* %__x, align 2, !dbg !321
  store i16 %3, i16* %tmp, align 2, !dbg !321
  %4 = load i16, i16* %tmp, align 2, !dbg !321
  %add = add i16 %4, 2, !dbg !317
  %5 = inttoptr i16 %add to i8*, !dbg !317
  call void @llvm.dbg.declare(metadata i16* %__x1, metadata !323, metadata !DIExpression()), !dbg !325
  %6 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !325, !srcloc !326
  store i16 %6, i16* %__x1, align 2, !dbg !325
  %7 = load i16, i16* %__x1, align 2, !dbg !325
  store i16 %7, i16* %tmp2, align 2, !dbg !325
  %8 = load i16, i16* %tmp2, align 2, !dbg !325
  %add3 = add i16 %8, 2, !dbg !317
  %sub = sub i16 9216, %add3, !dbg !317
  %call = call zeroext i16 @__fast_hw_crc(i8* %5, i16 zeroext %sub, i16 zeroext -1), !dbg !317
  store i16 %call, i16* @tmp_stack_crc, align 2, !dbg !317
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !317
  %10 = bitcast %struct.camel_buffer_t* %9 to i8*, !dbg !317
  %11 = load i16, i16* @tmp_stack_crc, align 2, !dbg !317
  %call4 = call zeroext i16 @__fast_hw_crc(i8* %10, i16 zeroext 48, i16 zeroext %11), !dbg !317
  store i16 %call4, i16* @tmp_stack_buf_crc, align 2, !dbg !317
  %12 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !317
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !317
  %stack_and_buf_crc = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 2, !dbg !317
  store i16 %12, i16* %stack_and_buf_crc, align 2, !dbg !317
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !317
  br label %if.end, !dbg !317

if.else:                                          ; preds = %do.body
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !327
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !327
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !327
  %reg_file5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 0, !dbg !327
  %arraydecay6 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file5, i16 0, i16 0, !dbg !327
  call void @__dump_registers(i16* %arraydecay6), !dbg !327
  call void @llvm.dbg.declare(metadata i16* %__x7, metadata !329, metadata !DIExpression()), !dbg !331
  %15 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !331, !srcloc !332
  store i16 %15, i16* %__x7, align 2, !dbg !331
  %16 = load i16, i16* %__x7, align 2, !dbg !331
  store i16 %16, i16* %tmp8, align 2, !dbg !331
  %17 = load i16, i16* %tmp8, align 2, !dbg !331
  %add9 = add i16 %17, 2, !dbg !327
  %18 = inttoptr i16 %add9 to i8*, !dbg !327
  call void @llvm.dbg.declare(metadata i16* %__x10, metadata !333, metadata !DIExpression()), !dbg !335
  %19 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !335, !srcloc !336
  store i16 %19, i16* %__x10, align 2, !dbg !335
  %20 = load i16, i16* %__x10, align 2, !dbg !335
  store i16 %20, i16* %tmp11, align 2, !dbg !335
  %21 = load i16, i16* %tmp11, align 2, !dbg !335
  %add12 = add i16 %21, 2, !dbg !327
  %sub13 = sub i16 9216, %add12, !dbg !327
  %call14 = call zeroext i16 @__fast_hw_crc(i8* %18, i16 zeroext %sub13, i16 zeroext -1), !dbg !327
  store i16 %call14, i16* @tmp_stack_crc, align 2, !dbg !327
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !327
  %23 = bitcast %struct.camel_buffer_t* %22 to i8*, !dbg !327
  %24 = load i16, i16* @tmp_stack_crc, align 2, !dbg !327
  %call15 = call zeroext i16 @__fast_hw_crc(i8* %23, i16 zeroext 48, i16 zeroext %24), !dbg !327
  store i16 %call15, i16* @tmp_stack_buf_crc, align 2, !dbg !327
  %25 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !327
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !327
  %stack_and_buf_crc16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 2, !dbg !327
  store i16 %25, i16* %stack_and_buf_crc16, align 2, !dbg !327
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !327
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %do.end, !dbg !316

do.end:                                           ; preds = %if.end
  call void @task_1(), !dbg !337
  br label %do.body17, !dbg !338

do.body17:                                        ; preds = %do.end
  %27 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !339
  %cmp18 = icmp eq i16 %27, 1, !dbg !339
  br i1 %cmp18, label %if.then19, label %if.else32, !dbg !342

if.then19:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !343
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !343
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !343
  %reg_file20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 0, !dbg !343
  %arraydecay21 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file20, i16 0, i16 0, !dbg !343
  call void @__dump_registers(i16* %arraydecay21), !dbg !343
  call void @llvm.dbg.declare(metadata i16* %__x22, metadata !345, metadata !DIExpression()), !dbg !347
  %29 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !347, !srcloc !348
  store i16 %29, i16* %__x22, align 2, !dbg !347
  %30 = load i16, i16* %__x22, align 2, !dbg !347
  store i16 %30, i16* %tmp23, align 2, !dbg !347
  %31 = load i16, i16* %tmp23, align 2, !dbg !347
  %add24 = add i16 %31, 2, !dbg !343
  %32 = inttoptr i16 %add24 to i8*, !dbg !343
  call void @llvm.dbg.declare(metadata i16* %__x25, metadata !349, metadata !DIExpression()), !dbg !351
  %33 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !351, !srcloc !352
  store i16 %33, i16* %__x25, align 2, !dbg !351
  %34 = load i16, i16* %__x25, align 2, !dbg !351
  store i16 %34, i16* %tmp26, align 2, !dbg !351
  %35 = load i16, i16* %tmp26, align 2, !dbg !351
  %add27 = add i16 %35, 2, !dbg !343
  %sub28 = sub i16 9216, %add27, !dbg !343
  %call29 = call zeroext i16 @__fast_hw_crc(i8* %32, i16 zeroext %sub28, i16 zeroext -1), !dbg !343
  store i16 %call29, i16* @tmp_stack_crc, align 2, !dbg !343
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !343
  %37 = bitcast %struct.camel_buffer_t* %36 to i8*, !dbg !343
  %38 = load i16, i16* @tmp_stack_crc, align 2, !dbg !343
  %call30 = call zeroext i16 @__fast_hw_crc(i8* %37, i16 zeroext 48, i16 zeroext %38), !dbg !343
  store i16 %call30, i16* @tmp_stack_buf_crc, align 2, !dbg !343
  %39 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !343
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !343
  %stack_and_buf_crc31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 2, !dbg !343
  store i16 %39, i16* %stack_and_buf_crc31, align 2, !dbg !343
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !343
  br label %if.end45, !dbg !343

if.else32:                                        ; preds = %do.body17
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !353
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !353
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !353
  %reg_file33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i32 0, i32 0, !dbg !353
  %arraydecay34 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file33, i16 0, i16 0, !dbg !353
  call void @__dump_registers(i16* %arraydecay34), !dbg !353
  call void @llvm.dbg.declare(metadata i16* %__x35, metadata !355, metadata !DIExpression()), !dbg !357
  %42 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !357, !srcloc !358
  store i16 %42, i16* %__x35, align 2, !dbg !357
  %43 = load i16, i16* %__x35, align 2, !dbg !357
  store i16 %43, i16* %tmp36, align 2, !dbg !357
  %44 = load i16, i16* %tmp36, align 2, !dbg !357
  %add37 = add i16 %44, 2, !dbg !353
  %45 = inttoptr i16 %add37 to i8*, !dbg !353
  call void @llvm.dbg.declare(metadata i16* %__x38, metadata !359, metadata !DIExpression()), !dbg !361
  %46 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !361, !srcloc !362
  store i16 %46, i16* %__x38, align 2, !dbg !361
  %47 = load i16, i16* %__x38, align 2, !dbg !361
  store i16 %47, i16* %tmp39, align 2, !dbg !361
  %48 = load i16, i16* %tmp39, align 2, !dbg !361
  %add40 = add i16 %48, 2, !dbg !353
  %sub41 = sub i16 9216, %add40, !dbg !353
  %call42 = call zeroext i16 @__fast_hw_crc(i8* %45, i16 zeroext %sub41, i16 zeroext -1), !dbg !353
  store i16 %call42, i16* @tmp_stack_crc, align 2, !dbg !353
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !353
  %50 = bitcast %struct.camel_buffer_t* %49 to i8*, !dbg !353
  %51 = load i16, i16* @tmp_stack_crc, align 2, !dbg !353
  %call43 = call zeroext i16 @__fast_hw_crc(i8* %50, i16 zeroext 48, i16 zeroext %51), !dbg !353
  store i16 %call43, i16* @tmp_stack_buf_crc, align 2, !dbg !353
  %52 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !353
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !353
  %stack_and_buf_crc44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 2, !dbg !353
  store i16 %52, i16* %stack_and_buf_crc44, align 2, !dbg !353
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !353
  br label %if.end45

if.end45:                                         ; preds = %if.else32, %if.then19
  br label %do.end46, !dbg !342

do.end46:                                         ; preds = %if.end45
  call void @task_2(), !dbg !363
  br label %do.body47, !dbg !364

do.body47:                                        ; preds = %do.end46
  %54 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !365
  %cmp48 = icmp eq i16 %54, 1, !dbg !365
  br i1 %cmp48, label %if.then49, label %if.else62, !dbg !368

if.then49:                                        ; preds = %do.body47
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !369
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !369
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !369
  %reg_file50 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 0, !dbg !369
  %arraydecay51 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file50, i16 0, i16 0, !dbg !369
  call void @__dump_registers(i16* %arraydecay51), !dbg !369
  call void @llvm.dbg.declare(metadata i16* %__x52, metadata !371, metadata !DIExpression()), !dbg !373
  %56 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !373, !srcloc !374
  store i16 %56, i16* %__x52, align 2, !dbg !373
  %57 = load i16, i16* %__x52, align 2, !dbg !373
  store i16 %57, i16* %tmp53, align 2, !dbg !373
  %58 = load i16, i16* %tmp53, align 2, !dbg !373
  %add54 = add i16 %58, 2, !dbg !369
  %59 = inttoptr i16 %add54 to i8*, !dbg !369
  call void @llvm.dbg.declare(metadata i16* %__x55, metadata !375, metadata !DIExpression()), !dbg !377
  %60 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !377, !srcloc !378
  store i16 %60, i16* %__x55, align 2, !dbg !377
  %61 = load i16, i16* %__x55, align 2, !dbg !377
  store i16 %61, i16* %tmp56, align 2, !dbg !377
  %62 = load i16, i16* %tmp56, align 2, !dbg !377
  %add57 = add i16 %62, 2, !dbg !369
  %sub58 = sub i16 9216, %add57, !dbg !369
  %call59 = call zeroext i16 @__fast_hw_crc(i8* %59, i16 zeroext %sub58, i16 zeroext -1), !dbg !369
  store i16 %call59, i16* @tmp_stack_crc, align 2, !dbg !369
  %63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !369
  %64 = bitcast %struct.camel_buffer_t* %63 to i8*, !dbg !369
  %65 = load i16, i16* @tmp_stack_crc, align 2, !dbg !369
  %call60 = call zeroext i16 @__fast_hw_crc(i8* %64, i16 zeroext 48, i16 zeroext %65), !dbg !369
  store i16 %call60, i16* @tmp_stack_buf_crc, align 2, !dbg !369
  %66 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !369
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !369
  %stack_and_buf_crc61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i32 0, i32 2, !dbg !369
  store i16 %66, i16* %stack_and_buf_crc61, align 2, !dbg !369
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !369
  br label %if.end75, !dbg !369

if.else62:                                        ; preds = %do.body47
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !379
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !379
  %68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !379
  %reg_file63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %68, i32 0, i32 0, !dbg !379
  %arraydecay64 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file63, i16 0, i16 0, !dbg !379
  call void @__dump_registers(i16* %arraydecay64), !dbg !379
  call void @llvm.dbg.declare(metadata i16* %__x65, metadata !381, metadata !DIExpression()), !dbg !383
  %69 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !383, !srcloc !384
  store i16 %69, i16* %__x65, align 2, !dbg !383
  %70 = load i16, i16* %__x65, align 2, !dbg !383
  store i16 %70, i16* %tmp66, align 2, !dbg !383
  %71 = load i16, i16* %tmp66, align 2, !dbg !383
  %add67 = add i16 %71, 2, !dbg !379
  %72 = inttoptr i16 %add67 to i8*, !dbg !379
  call void @llvm.dbg.declare(metadata i16* %__x68, metadata !385, metadata !DIExpression()), !dbg !387
  %73 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !387, !srcloc !388
  store i16 %73, i16* %__x68, align 2, !dbg !387
  %74 = load i16, i16* %__x68, align 2, !dbg !387
  store i16 %74, i16* %tmp69, align 2, !dbg !387
  %75 = load i16, i16* %tmp69, align 2, !dbg !387
  %add70 = add i16 %75, 2, !dbg !379
  %sub71 = sub i16 9216, %add70, !dbg !379
  %call72 = call zeroext i16 @__fast_hw_crc(i8* %72, i16 zeroext %sub71, i16 zeroext -1), !dbg !379
  store i16 %call72, i16* @tmp_stack_crc, align 2, !dbg !379
  %76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !379
  %77 = bitcast %struct.camel_buffer_t* %76 to i8*, !dbg !379
  %78 = load i16, i16* @tmp_stack_crc, align 2, !dbg !379
  %call73 = call zeroext i16 @__fast_hw_crc(i8* %77, i16 zeroext 48, i16 zeroext %78), !dbg !379
  store i16 %call73, i16* @tmp_stack_buf_crc, align 2, !dbg !379
  %79 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !379
  %80 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !379
  %stack_and_buf_crc74 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %80, i32 0, i32 2, !dbg !379
  store i16 %79, i16* %stack_and_buf_crc74, align 2, !dbg !379
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !379
  br label %if.end75

if.end75:                                         ; preds = %if.else62, %if.then49
  br label %do.end76, !dbg !368

do.end76:                                         ; preds = %if.end75
  call void @task_3(), !dbg !389
  br label %do.body77, !dbg !390

do.body77:                                        ; preds = %do.end76
  %81 = load i16, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !391
  %cmp78 = icmp eq i16 %81, 1, !dbg !391
  br i1 %cmp78, label %if.then79, label %if.else92, !dbg !394

if.then79:                                        ; preds = %do.body77
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 2, !dbg !395
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 2, !dbg !395
  %82 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !395
  %reg_file80 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %82, i32 0, i32 0, !dbg !395
  %arraydecay81 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file80, i16 0, i16 0, !dbg !395
  call void @__dump_registers(i16* %arraydecay81), !dbg !395
  call void @llvm.dbg.declare(metadata i16* %__x82, metadata !397, metadata !DIExpression()), !dbg !399
  %83 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !399, !srcloc !400
  store i16 %83, i16* %__x82, align 2, !dbg !399
  %84 = load i16, i16* %__x82, align 2, !dbg !399
  store i16 %84, i16* %tmp83, align 2, !dbg !399
  %85 = load i16, i16* %tmp83, align 2, !dbg !399
  %add84 = add i16 %85, 2, !dbg !395
  %86 = inttoptr i16 %add84 to i8*, !dbg !395
  call void @llvm.dbg.declare(metadata i16* %__x85, metadata !401, metadata !DIExpression()), !dbg !403
  %87 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !403, !srcloc !404
  store i16 %87, i16* %__x85, align 2, !dbg !403
  %88 = load i16, i16* %__x85, align 2, !dbg !403
  store i16 %88, i16* %tmp86, align 2, !dbg !403
  %89 = load i16, i16* %tmp86, align 2, !dbg !403
  %add87 = add i16 %89, 2, !dbg !395
  %sub88 = sub i16 9216, %add87, !dbg !395
  %call89 = call zeroext i16 @__fast_hw_crc(i8* %86, i16 zeroext %sub88, i16 zeroext -1), !dbg !395
  store i16 %call89, i16* @tmp_stack_crc, align 2, !dbg !395
  %90 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !395
  %91 = bitcast %struct.camel_buffer_t* %90 to i8*, !dbg !395
  %92 = load i16, i16* @tmp_stack_crc, align 2, !dbg !395
  %call90 = call zeroext i16 @__fast_hw_crc(i8* %91, i16 zeroext 48, i16 zeroext %92), !dbg !395
  store i16 %call90, i16* @tmp_stack_buf_crc, align 2, !dbg !395
  %93 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !395
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !395
  %stack_and_buf_crc91 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %94, i32 0, i32 2, !dbg !395
  store i16 %93, i16* %stack_and_buf_crc91, align 2, !dbg !395
  store i16 2, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !395
  br label %if.end105, !dbg !395

if.else92:                                        ; preds = %do.body77
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 2, !dbg !405
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 2, !dbg !405
  %95 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !405
  %reg_file93 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %95, i32 0, i32 0, !dbg !405
  %arraydecay94 = getelementptr inbounds [11 x i16], [11 x i16]* %reg_file93, i16 0, i16 0, !dbg !405
  call void @__dump_registers(i16* %arraydecay94), !dbg !405
  call void @llvm.dbg.declare(metadata i16* %__x95, metadata !407, metadata !DIExpression()), !dbg !409
  %96 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !409, !srcloc !410
  store i16 %96, i16* %__x95, align 2, !dbg !409
  %97 = load i16, i16* %__x95, align 2, !dbg !409
  store i16 %97, i16* %tmp96, align 2, !dbg !409
  %98 = load i16, i16* %tmp96, align 2, !dbg !409
  %add97 = add i16 %98, 2, !dbg !405
  %99 = inttoptr i16 %add97 to i8*, !dbg !405
  call void @llvm.dbg.declare(metadata i16* %__x98, metadata !411, metadata !DIExpression()), !dbg !413
  %100 = call i16 asm sideeffect "mov SP, $0", "=r"() #4, !dbg !413, !srcloc !414
  store i16 %100, i16* %__x98, align 2, !dbg !413
  %101 = load i16, i16* %__x98, align 2, !dbg !413
  store i16 %101, i16* %tmp99, align 2, !dbg !413
  %102 = load i16, i16* %tmp99, align 2, !dbg !413
  %add100 = add i16 %102, 2, !dbg !405
  %sub101 = sub i16 9216, %add100, !dbg !405
  %call102 = call zeroext i16 @__fast_hw_crc(i8* %99, i16 zeroext %sub101, i16 zeroext -1), !dbg !405
  store i16 %call102, i16* @tmp_stack_crc, align 2, !dbg !405
  %103 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !405
  %104 = bitcast %struct.camel_buffer_t* %103 to i8*, !dbg !405
  %105 = load i16, i16* @tmp_stack_crc, align 2, !dbg !405
  %call103 = call zeroext i16 @__fast_hw_crc(i8* %104, i16 zeroext 48, i16 zeroext %105), !dbg !405
  store i16 %call103, i16* @tmp_stack_buf_crc, align 2, !dbg !405
  %106 = load i16, i16* @tmp_stack_buf_crc, align 2, !dbg !405
  %107 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 2, !dbg !405
  %stack_and_buf_crc104 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %107, i32 0, i32 2, !dbg !405
  store i16 %106, i16* %stack_and_buf_crc104, align 2, !dbg !405
  store i16 1, i16* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 0), align 2, !dbg !405
  br label %if.end105

if.end105:                                        ; preds = %if.else92, %if.then79
  br label %do.end106, !dbg !394

do.end106:                                        ; preds = %if.end105
  call void @task_check(), !dbg !415
  br label %while.body, !dbg !416

while.body:                                       ; preds = %do.end106, %while.body
  br label %while.body, !dbg !416, !llvm.loop !417
}

declare dso_local void @__dump_registers(i16*) #1

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!59, !60, !61}
!llvm.ident = !{!62}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "camel", scope: !2, file: !3, line: 74, type: !54, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, nameTableKind: None)
!3 = !DIFile(filename: "../example/basic_math.c", directory: "/home/saim/Desktop/Camel/llvm_bytecode")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 16, encoding: DW_ATE_unsigned)
!7 = !{!8, !13, !20, !22, !0, !24, !49, !51}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "reset_vector", scope: !2, file: !3, line: 267, type: !10, isLocal: true, isDefinition: true)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 16)
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "tmp_stack_crc", scope: !2, file: !3, line: 18, type: !15, isLocal: false, isDefinition: true)
!15 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !16, line: 26, baseType: !17)
!16 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/sys/_stdint.h", directory: "/home/saim")
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !18, line: 43, baseType: !19)
!18 = !DIFile(filename: "ti/msp430-gcc/msp430-elf/include/machine/_default_types.h", directory: "/home/saim")
!19 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!20 = !DIGlobalVariableExpression(var: !21, expr: !DIExpression())
!21 = distinct !DIGlobalVariable(name: "tmp_stack_buf_crc", scope: !2, file: !3, line: 19, type: !15, isLocal: false, isDefinition: true)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "writeOpt", scope: !2, file: !3, line: 29, type: !15, isLocal: false, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "safe", scope: !2, file: !3, line: 81, type: !26, isLocal: false, isDefinition: true)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 16)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_buffer_t", file: !3, line: 67, baseType: !28)
!28 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_buffer_t", file: !3, line: 62, size: 400, elements: !29)
!29 = !{!30, !35, !48}
!30 = !DIDerivedType(tag: DW_TAG_member, name: "reg_file", scope: !28, file: !3, line: 64, baseType: !31, size: 176)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !32, size: 176, elements: !33)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_reg_t", file: !3, line: 14, baseType: !15)
!33 = !{!34}
!34 = !DISubrange(count: 11)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "globals", scope: !28, file: !3, line: 65, baseType: !36, size: 208, offset: 176)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "camel_global_t", file: !3, line: 59, baseType: !37)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "camel_global_t", file: !3, line: 55, size: 208, elements: !38)
!38 = !{!39, !41, !42, !43, !47}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "v1", scope: !37, file: !3, line: 57, baseType: !40, size: 16)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_t", file: !3, line: 15, baseType: !15)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "v2", scope: !37, file: !3, line: 57, baseType: !40, size: 16, offset: 16)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "v3", scope: !37, file: !3, line: 57, baseType: !40, size: 16, offset: 32)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "arr1", scope: !37, file: !3, line: 58, baseType: !44, size: 80, offset: 48)
!44 = !DICompositeType(tag: DW_TAG_array_type, baseType: !40, size: 80, elements: !45)
!45 = !{!46}
!46 = !DISubrange(count: 5)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "arr2", scope: !37, file: !3, line: 58, baseType: !44, size: 80, offset: 128)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "stack_and_buf_crc", scope: !28, file: !3, line: 66, baseType: !15, size: 16, offset: 384)
!49 = !DIGlobalVariableExpression(var: !50, expr: !DIExpression())
!50 = distinct !DIGlobalVariable(name: "unsafe", scope: !2, file: !3, line: 81, type: !26, isLocal: false, isDefinition: true)
!51 = !DIGlobalVariableExpression(var: !52, expr: !DIExpression())
!52 = distinct !DIGlobalVariable(name: "buf", scope: !2, file: !3, line: 110, type: !53, isLocal: false, isDefinition: true)
!53 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 176, elements: !33)
!54 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Camel", file: !3, line: 69, size: 816, elements: !55)
!55 = !{!56, !57, !58}
!56 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !54, file: !3, line: 71, baseType: !15, size: 16)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "buf1", scope: !54, file: !3, line: 72, baseType: !27, size: 400, offset: 16)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "buf2", scope: !54, file: !3, line: 73, baseType: !27, size: 400, offset: 416)
!59 = !{i32 2, !"Dwarf Version", i32 4}
!60 = !{i32 2, !"Debug Info Version", i32 3}
!61 = !{i32 1, !"wchar_size", i32 2}
!62 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!63 = distinct !DISubprogram(name: "camel_init", scope: !3, file: !3, line: 83, type: !11, scopeLine: 83, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!64 = !DILocation(line: 84, column: 10, scope: !63)
!65 = !DILocation(line: 86, column: 9, scope: !63)
!66 = !DILocation(line: 88, column: 9, scope: !63)
!67 = !DILocation(line: 93, column: 11, scope: !63)
!68 = !DILocation(line: 98, column: 12, scope: !63)
!69 = !DILocation(line: 99, column: 10, scope: !63)
!70 = !DILocation(line: 100, column: 10, scope: !63)
!71 = !DILocation(line: 102, column: 10, scope: !63)
!72 = !DILocation(line: 103, column: 12, scope: !63)
!73 = !DILocation(line: 106, column: 10, scope: !63)
!74 = !DILocation(line: 108, column: 1, scope: !63)
!75 = distinct !DISubprogram(name: "camel_recover", scope: !3, file: !3, line: 112, type: !11, scopeLine: 112, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DILocation(line: 113, column: 14, scope: !77)
!77 = distinct !DILexicalBlock(scope: !75, file: !3, line: 113, column: 8)
!78 = !DILocation(line: 113, column: 19, scope: !77)
!79 = !DILocation(line: 113, column: 8, scope: !75)
!80 = !DILocation(line: 114, column: 14, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !3, line: 113, column: 34)
!82 = !DILocation(line: 115, column: 16, scope: !81)
!83 = !DILocation(line: 116, column: 5, scope: !81)
!84 = !DILocation(line: 116, column: 21, scope: !85)
!85 = distinct !DILexicalBlock(scope: !77, file: !3, line: 116, column: 15)
!86 = !DILocation(line: 116, column: 26, scope: !85)
!87 = !DILocation(line: 116, column: 15, scope: !77)
!88 = !DILocation(line: 117, column: 14, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !3, line: 116, column: 41)
!90 = !DILocation(line: 118, column: 16, scope: !89)
!91 = !DILocation(line: 119, column: 5, scope: !89)
!92 = !DILocation(line: 120, column: 9, scope: !93)
!93 = distinct !DILexicalBlock(scope: !85, file: !3, line: 119, column: 12)
!94 = !DILocation(line: 129, column: 3, scope: !95)
!95 = distinct !DILexicalBlock(scope: !75, file: !3, line: 129, column: 3)
!96 = !{i32 -2146601175}
!97 = !DILocalVariable(name: "__x", scope: !98, file: !3, line: 131, type: !6)
!98 = distinct !DILexicalBlock(scope: !75, file: !3, line: 131, column: 33)
!99 = !DILocation(line: 131, column: 33, scope: !98)
!100 = !{i32 -2146600939}
!101 = !DILocation(line: 131, column: 51, scope: !75)
!102 = !DILocation(line: 131, column: 33, scope: !75)
!103 = !DILocalVariable(name: "__x", scope: !104, file: !3, line: 131, type: !6)
!104 = distinct !DILexicalBlock(scope: !75, file: !3, line: 131, column: 65)
!105 = !DILocation(line: 131, column: 65, scope: !104)
!106 = !{i32 -2146600814}
!107 = !DILocation(line: 131, column: 83, scope: !75)
!108 = !DILocation(line: 131, column: 63, scope: !75)
!109 = !DILocation(line: 131, column: 19, scope: !75)
!110 = !DILocation(line: 131, column: 17, scope: !75)
!111 = !DILocation(line: 132, column: 37, scope: !75)
!112 = !DILocation(line: 132, column: 71, scope: !75)
!113 = !DILocation(line: 132, column: 23, scope: !75)
!114 = !DILocation(line: 132, column: 21, scope: !75)
!115 = !DILocation(line: 135, column: 6, scope: !116)
!116 = distinct !DILexicalBlock(scope: !75, file: !3, line: 135, column: 6)
!117 = !DILocation(line: 135, column: 27, scope: !116)
!118 = !DILocation(line: 135, column: 33, scope: !116)
!119 = !DILocation(line: 135, column: 24, scope: !116)
!120 = !DILocation(line: 135, column: 6, scope: !75)
!121 = !DILocation(line: 136, column: 11, scope: !122)
!122 = distinct !DILexicalBlock(scope: !116, file: !3, line: 135, column: 51)
!123 = !DILocation(line: 136, column: 4, scope: !122)
!124 = !DILocation(line: 136, column: 19, scope: !122)
!125 = !DILocation(line: 137, column: 4, scope: !122)
!126 = !DILocation(line: 138, column: 24, scope: !122)
!127 = !DILocation(line: 138, column: 30, scope: !122)
!128 = !DILocation(line: 138, column: 4, scope: !122)
!129 = !DILocation(line: 139, column: 3, scope: !122)
!130 = !DILocation(line: 140, column: 4, scope: !131)
!131 = distinct !DILexicalBlock(scope: !116, file: !3, line: 139, column: 9)
!132 = !DILocation(line: 142, column: 1, scope: !75)
!133 = distinct !DISubprogram(name: "arrEqual", scope: !3, file: !3, line: 146, type: !134, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DISubroutineType(types: !135)
!135 = !{!136, !139, !139, !140}
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !16, line: 20, baseType: !137)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !18, line: 29, baseType: !138)
!138 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!139 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !40, size: 16)
!140 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !141, line: 216, baseType: !6)
!141 = !DIFile(filename: "ti/msp430-gcc/lib/gcc/msp430-elf/8.3.0/include/stddef.h", directory: "/home/saim")
!142 = !DILocalVariable(name: "ptr1", arg: 1, scope: !133, file: !3, line: 146, type: !139)
!143 = !DILocation(line: 146, column: 26, scope: !133)
!144 = !DILocalVariable(name: "ptr2", arg: 2, scope: !133, file: !3, line: 146, type: !139)
!145 = !DILocation(line: 146, column: 42, scope: !133)
!146 = !DILocalVariable(name: "len", arg: 3, scope: !133, file: !3, line: 146, type: !140)
!147 = !DILocation(line: 146, column: 57, scope: !133)
!148 = !DILocalVariable(name: "i", scope: !133, file: !3, line: 147, type: !140)
!149 = !DILocation(line: 147, column: 10, scope: !133)
!150 = !DILocation(line: 148, column: 9, scope: !151)
!151 = distinct !DILexicalBlock(scope: !133, file: !3, line: 148, column: 3)
!152 = !DILocation(line: 148, column: 7, scope: !151)
!153 = !DILocation(line: 148, column: 14, scope: !154)
!154 = distinct !DILexicalBlock(scope: !151, file: !3, line: 148, column: 3)
!155 = !DILocation(line: 148, column: 18, scope: !154)
!156 = !DILocation(line: 148, column: 16, scope: !154)
!157 = !DILocation(line: 148, column: 3, scope: !151)
!158 = !DILocation(line: 149, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !3, line: 149, column: 8)
!160 = distinct !DILexicalBlock(scope: !154, file: !3, line: 148, column: 27)
!161 = !DILocation(line: 149, column: 13, scope: !159)
!162 = !DILocation(line: 149, column: 19, scope: !159)
!163 = !DILocation(line: 149, column: 24, scope: !159)
!164 = !DILocation(line: 149, column: 16, scope: !159)
!165 = !DILocation(line: 149, column: 8, scope: !160)
!166 = !DILocation(line: 150, column: 7, scope: !167)
!167 = distinct !DILexicalBlock(scope: !159, file: !3, line: 149, column: 27)
!168 = !DILocation(line: 152, column: 3, scope: !160)
!169 = !DILocation(line: 148, column: 24, scope: !154)
!170 = !DILocation(line: 148, column: 3, scope: !154)
!171 = distinct !{!171, !157, !172}
!172 = !DILocation(line: 152, column: 3, scope: !151)
!173 = !DILocation(line: 153, column: 3, scope: !133)
!174 = !DILocation(line: 154, column: 1, scope: !133)
!175 = distinct !DISubprogram(name: "task_init", scope: !3, file: !3, line: 157, type: !11, scopeLine: 157, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!176 = !DILocation(line: 158, column: 3, scope: !175)
!177 = !DILocation(line: 158, column: 10, scope: !175)
!178 = !DILocation(line: 159, column: 3, scope: !175)
!179 = !DILocation(line: 159, column: 10, scope: !175)
!180 = !DILocation(line: 160, column: 3, scope: !175)
!181 = !DILocation(line: 160, column: 10, scope: !175)
!182 = !DILocation(line: 161, column: 10, scope: !175)
!183 = !DILocation(line: 161, column: 3, scope: !175)
!184 = !DILocation(line: 162, column: 10, scope: !175)
!185 = !DILocation(line: 162, column: 3, scope: !175)
!186 = !DILocation(line: 163, column: 1, scope: !175)
!187 = distinct !DISubprogram(name: "task_1", scope: !3, file: !3, line: 166, type: !11, scopeLine: 166, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!188 = !DILocation(line: 167, column: 3, scope: !187)
!189 = !DILocation(line: 167, column: 10, scope: !187)
!190 = !DILocation(line: 168, column: 12, scope: !187)
!191 = !DILocation(line: 168, column: 21, scope: !187)
!192 = !DILocation(line: 168, column: 19, scope: !187)
!193 = !DILocation(line: 168, column: 28, scope: !187)
!194 = !DILocation(line: 168, column: 3, scope: !187)
!195 = !DILocation(line: 168, column: 10, scope: !187)
!196 = !DILocalVariable(name: "opt", scope: !187, file: !3, line: 169, type: !197)
!197 = !DIBasicType(name: "int", size: 16, encoding: DW_ATE_signed)
!198 = !DILocation(line: 169, column: 7, scope: !187)
!199 = !DILocation(line: 170, column: 19, scope: !187)
!200 = !DILocation(line: 170, column: 3, scope: !187)
!201 = !DILocation(line: 170, column: 12, scope: !187)
!202 = !DILocation(line: 170, column: 17, scope: !187)
!203 = !DILocation(line: 171, column: 1, scope: !187)
!204 = distinct !DISubprogram(name: "task_2", scope: !3, file: !3, line: 174, type: !11, scopeLine: 174, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!205 = !DILocalVariable(name: "read1", scope: !204, file: !3, line: 177, type: !197)
!206 = !DILocation(line: 177, column: 7, scope: !204)
!207 = !DILocalVariable(name: "read2", scope: !204, file: !3, line: 178, type: !197)
!208 = !DILocation(line: 178, column: 7, scope: !204)
!209 = !DILocalVariable(name: "write1", scope: !204, file: !3, line: 179, type: !197)
!210 = !DILocation(line: 179, column: 7, scope: !204)
!211 = !DILocalVariable(name: "write2", scope: !204, file: !3, line: 180, type: !197)
!212 = !DILocation(line: 180, column: 7, scope: !204)
!213 = !DILocation(line: 182, column: 22, scope: !204)
!214 = !DILocation(line: 182, column: 31, scope: !204)
!215 = !DILocation(line: 182, column: 3, scope: !204)
!216 = !DILocation(line: 182, column: 12, scope: !204)
!217 = !DILocation(line: 182, column: 20, scope: !204)
!218 = !DILocation(line: 183, column: 23, scope: !204)
!219 = !DILocation(line: 183, column: 32, scope: !204)
!220 = !DILocation(line: 183, column: 39, scope: !204)
!221 = !DILocation(line: 183, column: 3, scope: !204)
!222 = !DILocation(line: 183, column: 12, scope: !204)
!223 = !DILocation(line: 183, column: 20, scope: !204)
!224 = !DILocation(line: 184, column: 1, scope: !204)
!225 = distinct !DISubprogram(name: "task_3", scope: !3, file: !3, line: 190, type: !11, scopeLine: 190, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!226 = !DILocation(line: 191, column: 12, scope: !225)
!227 = !DILocation(line: 191, column: 19, scope: !225)
!228 = !DILocation(line: 191, column: 3, scope: !225)
!229 = !DILocation(line: 191, column: 10, scope: !225)
!230 = !DILocalVariable(name: "opt", scope: !225, file: !3, line: 193, type: !197)
!231 = !DILocation(line: 193, column: 7, scope: !225)
!232 = !DILocation(line: 193, column: 13, scope: !225)
!233 = !DILocation(line: 193, column: 20, scope: !225)
!234 = !DILocation(line: 195, column: 22, scope: !225)
!235 = !DILocation(line: 195, column: 31, scope: !225)
!236 = !DILocation(line: 195, column: 3, scope: !225)
!237 = !DILocation(line: 195, column: 12, scope: !225)
!238 = !DILocation(line: 195, column: 20, scope: !225)
!239 = !DILocation(line: 199, column: 3, scope: !225)
!240 = !DILocation(line: 199, column: 10, scope: !225)
!241 = !DILocation(line: 200, column: 22, scope: !225)
!242 = !DILocation(line: 200, column: 31, scope: !225)
!243 = !DILocation(line: 200, column: 3, scope: !225)
!244 = !DILocation(line: 200, column: 12, scope: !225)
!245 = !DILocation(line: 200, column: 20, scope: !225)
!246 = !DILocation(line: 201, column: 1, scope: !225)
!247 = distinct !DISubprogram(name: "success", scope: !3, file: !3, line: 204, type: !11, scopeLine: 204, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!248 = !DILocation(line: 204, column: 16, scope: !247)
!249 = distinct !DISubprogram(name: "failure", scope: !3, file: !3, line: 205, type: !11, scopeLine: 205, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!250 = !DILocation(line: 205, column: 16, scope: !249)
!251 = distinct !DISubprogram(name: "task_check", scope: !3, file: !3, line: 207, type: !11, scopeLine: 207, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!252 = !DILocalVariable(name: "ref_arr1", scope: !251, file: !3, line: 208, type: !44)
!253 = !DILocation(line: 208, column: 11, scope: !251)
!254 = !DILocalVariable(name: "ref_arr2", scope: !251, file: !3, line: 209, type: !44)
!255 = !DILocation(line: 209, column: 11, scope: !251)
!256 = !DILocalVariable(name: "ref_v1", scope: !251, file: !3, line: 210, type: !40)
!257 = !DILocation(line: 210, column: 11, scope: !251)
!258 = !DILocalVariable(name: "ref_v2", scope: !251, file: !3, line: 211, type: !40)
!259 = !DILocation(line: 211, column: 11, scope: !251)
!260 = !DILocalVariable(name: "ref_v3", scope: !251, file: !3, line: 212, type: !40)
!261 = !DILocation(line: 212, column: 11, scope: !251)
!262 = !DILocation(line: 214, column: 6, scope: !263)
!263 = distinct !DILexicalBlock(scope: !251, file: !3, line: 214, column: 6)
!264 = !DILocation(line: 214, column: 16, scope: !263)
!265 = !DILocation(line: 214, column: 13, scope: !263)
!266 = !DILocation(line: 214, column: 6, scope: !251)
!267 = !DILocation(line: 215, column: 5, scope: !268)
!268 = distinct !DILexicalBlock(scope: !263, file: !3, line: 214, column: 23)
!269 = !DILocation(line: 216, column: 3, scope: !268)
!270 = !DILocation(line: 217, column: 6, scope: !271)
!271 = distinct !DILexicalBlock(scope: !251, file: !3, line: 217, column: 6)
!272 = !DILocation(line: 217, column: 16, scope: !271)
!273 = !DILocation(line: 217, column: 13, scope: !271)
!274 = !DILocation(line: 217, column: 6, scope: !251)
!275 = !DILocation(line: 218, column: 5, scope: !276)
!276 = distinct !DILexicalBlock(scope: !271, file: !3, line: 217, column: 23)
!277 = !DILocation(line: 219, column: 3, scope: !276)
!278 = !DILocation(line: 220, column: 6, scope: !279)
!279 = distinct !DILexicalBlock(scope: !251, file: !3, line: 220, column: 6)
!280 = !DILocation(line: 220, column: 16, scope: !279)
!281 = !DILocation(line: 220, column: 13, scope: !279)
!282 = !DILocation(line: 220, column: 6, scope: !251)
!283 = !DILocation(line: 221, column: 5, scope: !284)
!284 = distinct !DILexicalBlock(scope: !279, file: !3, line: 220, column: 23)
!285 = !DILocation(line: 222, column: 3, scope: !284)
!286 = !DILocation(line: 223, column: 16, scope: !287)
!287 = distinct !DILexicalBlock(scope: !251, file: !3, line: 223, column: 6)
!288 = !DILocation(line: 223, column: 26, scope: !287)
!289 = !DILocation(line: 223, column: 7, scope: !287)
!290 = !DILocation(line: 223, column: 6, scope: !251)
!291 = !DILocation(line: 224, column: 5, scope: !292)
!292 = distinct !DILexicalBlock(scope: !287, file: !3, line: 223, column: 46)
!293 = !DILocation(line: 225, column: 3, scope: !292)
!294 = !DILocation(line: 226, column: 16, scope: !295)
!295 = distinct !DILexicalBlock(scope: !251, file: !3, line: 226, column: 6)
!296 = !DILocation(line: 226, column: 26, scope: !295)
!297 = !DILocation(line: 226, column: 7, scope: !295)
!298 = !DILocation(line: 226, column: 6, scope: !251)
!299 = !DILocation(line: 227, column: 5, scope: !300)
!300 = distinct !DILexicalBlock(scope: !295, file: !3, line: 226, column: 46)
!301 = !DILocation(line: 228, column: 3, scope: !300)
!302 = !DILocation(line: 229, column: 3, scope: !251)
!303 = !DILocation(line: 230, column: 1, scope: !251)
!304 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 232, type: !305, scopeLine: 232, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!305 = !DISubroutineType(types: !306)
!306 = !{!197}
!307 = !DILocation(line: 238, column: 14, scope: !304)
!308 = !DILocation(line: 239, column: 8, scope: !304)
!309 = !DILocation(line: 240, column: 10, scope: !304)
!310 = !DILocation(line: 241, column: 3, scope: !304)
!311 = !DILocation(line: 243, column: 3, scope: !304)
!312 = !DILocation(line: 244, column: 3, scope: !304)
!313 = !DILocation(line: 244, column: 3, scope: !314)
!314 = distinct !DILexicalBlock(scope: !315, file: !3, line: 244, column: 3)
!315 = distinct !DILexicalBlock(scope: !304, file: !3, line: 244, column: 3)
!316 = !DILocation(line: 244, column: 3, scope: !315)
!317 = !DILocation(line: 244, column: 3, scope: !318)
!318 = distinct !DILexicalBlock(scope: !314, file: !3, line: 244, column: 3)
!319 = !DILocalVariable(name: "__x", scope: !320, file: !3, line: 244, type: !6)
!320 = distinct !DILexicalBlock(scope: !318, file: !3, line: 244, column: 3)
!321 = !DILocation(line: 244, column: 3, scope: !320)
!322 = !{i32 -2146598051}
!323 = !DILocalVariable(name: "__x", scope: !324, file: !3, line: 244, type: !6)
!324 = distinct !DILexicalBlock(scope: !318, file: !3, line: 244, column: 3)
!325 = !DILocation(line: 244, column: 3, scope: !324)
!326 = !{i32 -2146597926}
!327 = !DILocation(line: 244, column: 3, scope: !328)
!328 = distinct !DILexicalBlock(scope: !314, file: !3, line: 244, column: 3)
!329 = !DILocalVariable(name: "__x", scope: !330, file: !3, line: 244, type: !6)
!330 = distinct !DILexicalBlock(scope: !328, file: !3, line: 244, column: 3)
!331 = !DILocation(line: 244, column: 3, scope: !330)
!332 = !{i32 -2146597794}
!333 = !DILocalVariable(name: "__x", scope: !334, file: !3, line: 244, type: !6)
!334 = distinct !DILexicalBlock(scope: !328, file: !3, line: 244, column: 3)
!335 = !DILocation(line: 244, column: 3, scope: !334)
!336 = !{i32 -2146597669}
!337 = !DILocation(line: 248, column: 3, scope: !304)
!338 = !DILocation(line: 249, column: 3, scope: !304)
!339 = !DILocation(line: 249, column: 3, scope: !340)
!340 = distinct !DILexicalBlock(scope: !341, file: !3, line: 249, column: 3)
!341 = distinct !DILexicalBlock(scope: !304, file: !3, line: 249, column: 3)
!342 = !DILocation(line: 249, column: 3, scope: !341)
!343 = !DILocation(line: 249, column: 3, scope: !344)
!344 = distinct !DILexicalBlock(scope: !340, file: !3, line: 249, column: 3)
!345 = !DILocalVariable(name: "__x", scope: !346, file: !3, line: 249, type: !6)
!346 = distinct !DILexicalBlock(scope: !344, file: !3, line: 249, column: 3)
!347 = !DILocation(line: 249, column: 3, scope: !346)
!348 = !{i32 -2146595595}
!349 = !DILocalVariable(name: "__x", scope: !350, file: !3, line: 249, type: !6)
!350 = distinct !DILexicalBlock(scope: !344, file: !3, line: 249, column: 3)
!351 = !DILocation(line: 249, column: 3, scope: !350)
!352 = !{i32 -2146595470}
!353 = !DILocation(line: 249, column: 3, scope: !354)
!354 = distinct !DILexicalBlock(scope: !340, file: !3, line: 249, column: 3)
!355 = !DILocalVariable(name: "__x", scope: !356, file: !3, line: 249, type: !6)
!356 = distinct !DILexicalBlock(scope: !354, file: !3, line: 249, column: 3)
!357 = !DILocation(line: 249, column: 3, scope: !356)
!358 = !{i32 -2146595338}
!359 = !DILocalVariable(name: "__x", scope: !360, file: !3, line: 249, type: !6)
!360 = distinct !DILexicalBlock(scope: !354, file: !3, line: 249, column: 3)
!361 = !DILocation(line: 249, column: 3, scope: !360)
!362 = !{i32 -2146595213}
!363 = !DILocation(line: 252, column: 3, scope: !304)
!364 = !DILocation(line: 253, column: 3, scope: !304)
!365 = !DILocation(line: 253, column: 3, scope: !366)
!366 = distinct !DILexicalBlock(scope: !367, file: !3, line: 253, column: 3)
!367 = distinct !DILexicalBlock(scope: !304, file: !3, line: 253, column: 3)
!368 = !DILocation(line: 253, column: 3, scope: !367)
!369 = !DILocation(line: 253, column: 3, scope: !370)
!370 = distinct !DILexicalBlock(scope: !366, file: !3, line: 253, column: 3)
!371 = !DILocalVariable(name: "__x", scope: !372, file: !3, line: 253, type: !6)
!372 = distinct !DILexicalBlock(scope: !370, file: !3, line: 253, column: 3)
!373 = !DILocation(line: 253, column: 3, scope: !372)
!374 = !{i32 -2146593139}
!375 = !DILocalVariable(name: "__x", scope: !376, file: !3, line: 253, type: !6)
!376 = distinct !DILexicalBlock(scope: !370, file: !3, line: 253, column: 3)
!377 = !DILocation(line: 253, column: 3, scope: !376)
!378 = !{i32 -2146593014}
!379 = !DILocation(line: 253, column: 3, scope: !380)
!380 = distinct !DILexicalBlock(scope: !366, file: !3, line: 253, column: 3)
!381 = !DILocalVariable(name: "__x", scope: !382, file: !3, line: 253, type: !6)
!382 = distinct !DILexicalBlock(scope: !380, file: !3, line: 253, column: 3)
!383 = !DILocation(line: 253, column: 3, scope: !382)
!384 = !{i32 -2146592882}
!385 = !DILocalVariable(name: "__x", scope: !386, file: !3, line: 253, type: !6)
!386 = distinct !DILexicalBlock(scope: !380, file: !3, line: 253, column: 3)
!387 = !DILocation(line: 253, column: 3, scope: !386)
!388 = !{i32 -2146592757}
!389 = !DILocation(line: 256, column: 3, scope: !304)
!390 = !DILocation(line: 257, column: 3, scope: !304)
!391 = !DILocation(line: 257, column: 3, scope: !392)
!392 = distinct !DILexicalBlock(scope: !393, file: !3, line: 257, column: 3)
!393 = distinct !DILexicalBlock(scope: !304, file: !3, line: 257, column: 3)
!394 = !DILocation(line: 257, column: 3, scope: !393)
!395 = !DILocation(line: 257, column: 3, scope: !396)
!396 = distinct !DILexicalBlock(scope: !392, file: !3, line: 257, column: 3)
!397 = !DILocalVariable(name: "__x", scope: !398, file: !3, line: 257, type: !6)
!398 = distinct !DILexicalBlock(scope: !396, file: !3, line: 257, column: 3)
!399 = !DILocation(line: 257, column: 3, scope: !398)
!400 = !{i32 -2146590683}
!401 = !DILocalVariable(name: "__x", scope: !402, file: !3, line: 257, type: !6)
!402 = distinct !DILexicalBlock(scope: !396, file: !3, line: 257, column: 3)
!403 = !DILocation(line: 257, column: 3, scope: !402)
!404 = !{i32 -2146590558}
!405 = !DILocation(line: 257, column: 3, scope: !406)
!406 = distinct !DILexicalBlock(scope: !392, file: !3, line: 257, column: 3)
!407 = !DILocalVariable(name: "__x", scope: !408, file: !3, line: 257, type: !6)
!408 = distinct !DILexicalBlock(scope: !406, file: !3, line: 257, column: 3)
!409 = !DILocation(line: 257, column: 3, scope: !408)
!410 = !{i32 -2146590426}
!411 = !DILocalVariable(name: "__x", scope: !412, file: !3, line: 257, type: !6)
!412 = distinct !DILexicalBlock(scope: !406, file: !3, line: 257, column: 3)
!413 = !DILocation(line: 257, column: 3, scope: !412)
!414 = !{i32 -2146590301}
!415 = !DILocation(line: 260, column: 3, scope: !304)
!416 = !DILocation(line: 262, column: 3, scope: !304)
!417 = distinct !{!417, !416, !418}
!418 = !DILocation(line: 262, column: 11, scope: !304)
