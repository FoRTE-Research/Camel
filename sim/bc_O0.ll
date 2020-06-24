; ModuleID = 'bc_O0.bc'
source_filename = "bc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [10 x i32], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%union.anon = type { i64 }

@camel = common dso_local global %struct.Camel zeroinitializer, align 4
@safe = dso_local global %struct.camel_buffer_t* bitcast (i8* getelementptr (i8, i8* bitcast (%struct.Camel* @camel to i8*), i64 92) to %struct.camel_buffer_t*), align 8
@unsafe = dso_local global %struct.camel_buffer_t* bitcast (i8* getelementptr (i8, i8* bitcast (%struct.Camel* @camel to i8*), i64 4) to %struct.camel_buffer_t*), align 8
@global_count = dso_local global i32 0, align 4
@c = dso_local global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"n0: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"n1: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"n2: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"n3: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"n4: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"n5: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"n6: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"The count is: %d\0A\00", align 1
@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@.str.8 = private unnamed_addr constant [32 x i8] c"bc took %f seconds to execute \0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @task_done() #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 0
  %1 = load i32, i32* %n_0, align 4, !tbaa !6
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %1)
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 1
  %3 = load i32, i32* %n_1, align 4, !tbaa !11
  %call2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2
  %5 = load i32, i32* %n_2, align 4, !tbaa !12
  %call4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %5)
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 3
  %7 = load i32, i32* %n_3, align 4, !tbaa !13
  %call6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 %7)
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 4
  %9 = load i32, i32* %n_4, align 4, !tbaa !14
  %call8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 %9)
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 5
  %11 = load i32, i32* %n_5, align 4, !tbaa !15
  %call10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 %11)
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 6
  %13 = load i32, i32* %n_6, align 4, !tbaa !16
  %call12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 %13)
  %14 = load i32, i32* @global_count, align 4, !tbaa !17
  %call13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i64 0, i64 0), i32 %14)
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define dso_local void @task_init() #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 7
  store i32 0, i32* %func, align 4, !tbaa !18
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 0
  store i32 0, i32* %n_0, align 4, !tbaa !6
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 1
  store i32 0, i32* %n_1, align 4, !tbaa !11
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 2
  store i32 0, i32* %n_2, align 4, !tbaa !12
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 3
  store i32 0, i32* %n_3, align 4, !tbaa !13
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 4
  store i32 0, i32* %n_4, align 4, !tbaa !14
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 5
  store i32 0, i32* %n_5, align 4, !tbaa !15
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 6
  store i32 0, i32* %n_6, align 4, !tbaa !16
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_select_func() #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  store i32 4, i32* %seed, align 4, !tbaa !19
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 9
  store i32 0, i32* %iter, align 4, !tbaa !20
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 7
  %3 = load i32, i32* %func, align 4, !tbaa !18
  %inc = add i32 %3, 1
  store i32 %inc, i32* %func, align 4, !tbaa !18
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_bit_count() #0 {
entry:
  %tmp_seed = alloca i32, align 4
  %temp = alloca i32, align 4
  %0 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %2 = load i32, i32* %seed, align 4, !tbaa !19
  store i32 %2, i32* %tmp_seed, align 4, !tbaa !17
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8
  %4 = load i32, i32* %seed2, align 4, !tbaa !19
  %add = add i32 %4, 13
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8
  store i32 %add, i32* %seed4, align 4, !tbaa !19
  %6 = bitcast i32* %temp to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #5
  store i32 0, i32* %temp, align 4, !tbaa !17
  %7 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %8 = load i32, i32* %temp, align 4, !tbaa !17
  %inc = add i32 %8, 1
  store i32 %inc, i32* %temp, align 4, !tbaa !17
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %9 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %10 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %sub = sub i32 %10, 1
  %and = and i32 %9, %sub
  store i32 %and, i32* %tmp_seed, align 4, !tbaa !17
  %cmp = icmp ne i32 0, %and
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %entry
  %11 = load i32, i32* %temp, align 4, !tbaa !17
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 0
  %13 = load i32, i32* %n_0, align 4, !tbaa !6
  %add6 = add i32 %13, %11
  store i32 %add6, i32* %n_0, align 4, !tbaa !6
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9
  %15 = load i32, i32* %iter, align 4, !tbaa !20
  %inc8 = add i32 %15, 1
  store i32 %inc8, i32* %iter, align 4, !tbaa !20
  %16 = bitcast i32* %temp to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #5
  %17 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #5
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local void @task_bitcount() #0 {
entry:
  %tmp_seed = alloca i32, align 4
  %0 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %2 = load i32, i32* %seed, align 4, !tbaa !19
  store i32 %2, i32* %tmp_seed, align 4, !tbaa !17
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %seed2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 8
  %4 = load i32, i32* %seed2, align 4, !tbaa !19
  %add = add i32 %4, 13
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8
  store i32 %add, i32* %seed4, align 4, !tbaa !19
  %6 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv = zext i32 %6 to i64
  %and = and i64 %conv, 2863311530
  %shr = ashr i64 %and, 1
  %7 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv5 = zext i32 %7 to i64
  %and6 = and i64 %conv5, 1431655765
  %add7 = add nsw i64 %shr, %and6
  %conv8 = trunc i64 %add7 to i32
  store i32 %conv8, i32* %tmp_seed, align 4, !tbaa !17
  %8 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv9 = zext i32 %8 to i64
  %and10 = and i64 %conv9, 3435973836
  %shr11 = ashr i64 %and10, 2
  %9 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv12 = zext i32 %9 to i64
  %and13 = and i64 %conv12, 858993459
  %add14 = add nsw i64 %shr11, %and13
  %conv15 = trunc i64 %add14 to i32
  store i32 %conv15, i32* %tmp_seed, align 4, !tbaa !17
  %10 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv16 = zext i32 %10 to i64
  %and17 = and i64 %conv16, 4042322160
  %shr18 = ashr i64 %and17, 4
  %11 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv19 = zext i32 %11 to i64
  %and20 = and i64 %conv19, 252645135
  %add21 = add nsw i64 %shr18, %and20
  %conv22 = trunc i64 %add21 to i32
  store i32 %conv22, i32* %tmp_seed, align 4, !tbaa !17
  %12 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv23 = zext i32 %12 to i64
  %and24 = and i64 %conv23, 4278255360
  %shr25 = ashr i64 %and24, 8
  %13 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv26 = zext i32 %13 to i64
  %and27 = and i64 %conv26, 16711935
  %add28 = add nsw i64 %shr25, %and27
  %conv29 = trunc i64 %add28 to i32
  store i32 %conv29, i32* %tmp_seed, align 4, !tbaa !17
  %14 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv30 = zext i32 %14 to i64
  %and31 = and i64 %conv30, 4294901760
  %shr32 = ashr i64 %and31, 16
  %15 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv33 = zext i32 %15 to i64
  %and34 = and i64 %conv33, 65535
  %add35 = add nsw i64 %shr32, %and34
  %conv36 = trunc i64 %add35 to i32
  store i32 %conv36, i32* %tmp_seed, align 4, !tbaa !17
  %16 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals37 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals37, i32 0, i32 1
  %18 = load i32, i32* %n_1, align 4, !tbaa !11
  %add38 = add i32 %18, %16
  store i32 %add38, i32* %n_1, align 4, !tbaa !11
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals39, i32 0, i32 9
  %20 = load i32, i32* %iter, align 4, !tbaa !20
  %inc = add i32 %20, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !20
  %21 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @recursive_cnt(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4, !tbaa !17
  %0 = bitcast i32* %cnt to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = load i32, i32* %x.addr, align 4, !tbaa !17
  %conv = zext i32 %1 to i64
  %and = and i64 %conv, 15
  %conv1 = trunc i64 %and to i32
  %idxprom = sext i32 %conv1 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv2 = sext i8 %2 to i32
  store i32 %conv2, i32* %cnt, align 4, !tbaa !17
  %3 = load i32, i32* %x.addr, align 4, !tbaa !17
  %shr = lshr i32 %3, 4
  store i32 %shr, i32* %x.addr, align 4, !tbaa !17
  %conv3 = zext i32 %shr to i64
  %cmp = icmp ne i64 0, %conv3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %x.addr, align 4, !tbaa !17
  %call = call i32 @recursive_cnt(i32 %4)
  %5 = load i32, i32* %cnt, align 4, !tbaa !17
  %add = add nsw i32 %5, %call
  store i32 %add, i32* %cnt, align 4, !tbaa !17
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %cnt, align 4, !tbaa !17
  %7 = bitcast i32* %cnt to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %7) #5
  ret i32 %6
}

; Function Attrs: nounwind uwtable
define dso_local void @task_ntbl_bitcnt() #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !19
  %call = call i32 @recursive_cnt(i32 %1)
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i32 0, i32 1
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals1, i32 0, i32 2
  %3 = load i32, i32* %n_2, align 4, !tbaa !12
  %add = add i32 %3, %call
  store i32 %add, i32* %n_2, align 4, !tbaa !12
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i32 0, i32 1
  %seed3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8
  %5 = load i32, i32* %seed3, align 4, !tbaa !19
  %add4 = add i32 %5, 13
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1
  %seed6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 8
  store i32 %add4, i32* %seed6, align 4, !tbaa !19
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals7, i32 0, i32 9
  %8 = load i32, i32* %iter, align 4, !tbaa !20
  %inc = add i32 %8, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !20
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_ntbl_bitcount() #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !19
  %conv = zext i32 %1 to i64
  %and = and i64 %conv, 15
  %conv1 = trunc i64 %and to i32
  %idxprom = sext i32 %conv1 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv2 = sext i8 %2 to i32
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8
  %4 = load i32, i32* %seed4, align 4, !tbaa !19
  %conv5 = zext i32 %4 to i64
  %and6 = and i64 %conv5, 240
  %shr = lshr i64 %and6, 4
  %conv7 = trunc i64 %shr to i32
  %idxprom8 = sext i32 %conv7 to i64
  %arrayidx9 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom8
  %5 = load i8, i8* %arrayidx9, align 1, !tbaa !21
  %conv10 = sext i8 %5 to i32
  %add = add nsw i32 %conv2, %conv10
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i32 0, i32 1
  %seed12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 8
  %7 = load i32, i32* %seed12, align 4, !tbaa !19
  %conv13 = zext i32 %7 to i64
  %and14 = and i64 %conv13, 3840
  %shr15 = lshr i64 %and14, 8
  %conv16 = trunc i64 %shr15 to i32
  %idxprom17 = sext i32 %conv16 to i64
  %arrayidx18 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom17
  %8 = load i8, i8* %arrayidx18, align 1, !tbaa !21
  %conv19 = sext i8 %8 to i32
  %add20 = add nsw i32 %add, %conv19
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i32 0, i32 1
  %seed22 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 8
  %10 = load i32, i32* %seed22, align 4, !tbaa !19
  %conv23 = zext i32 %10 to i64
  %and24 = and i64 %conv23, 61440
  %shr25 = lshr i64 %and24, 12
  %conv26 = trunc i64 %shr25 to i32
  %idxprom27 = sext i32 %conv26 to i64
  %arrayidx28 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom27
  %11 = load i8, i8* %arrayidx28, align 1, !tbaa !21
  %conv29 = sext i8 %11 to i32
  %add30 = add nsw i32 %add20, %conv29
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals31 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i32 0, i32 1
  %seed32 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals31, i32 0, i32 8
  %13 = load i32, i32* %seed32, align 4, !tbaa !19
  %conv33 = zext i32 %13 to i64
  %and34 = and i64 %conv33, 983040
  %shr35 = lshr i64 %and34, 16
  %conv36 = trunc i64 %shr35 to i32
  %idxprom37 = sext i32 %conv36 to i64
  %arrayidx38 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom37
  %14 = load i8, i8* %arrayidx38, align 1, !tbaa !21
  %conv39 = sext i8 %14 to i32
  %add40 = add nsw i32 %add30, %conv39
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1
  %seed42 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals41, i32 0, i32 8
  %16 = load i32, i32* %seed42, align 4, !tbaa !19
  %conv43 = zext i32 %16 to i64
  %and44 = and i64 %conv43, 15728640
  %shr45 = lshr i64 %and44, 20
  %conv46 = trunc i64 %shr45 to i32
  %idxprom47 = sext i32 %conv46 to i64
  %arrayidx48 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom47
  %17 = load i8, i8* %arrayidx48, align 1, !tbaa !21
  %conv49 = sext i8 %17 to i32
  %add50 = add nsw i32 %add40, %conv49
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1
  %seed52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 8
  %19 = load i32, i32* %seed52, align 4, !tbaa !19
  %conv53 = zext i32 %19 to i64
  %and54 = and i64 %conv53, 251658240
  %shr55 = lshr i64 %and54, 24
  %conv56 = trunc i64 %shr55 to i32
  %idxprom57 = sext i32 %conv56 to i64
  %arrayidx58 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom57
  %20 = load i8, i8* %arrayidx58, align 1, !tbaa !21
  %conv59 = sext i8 %20 to i32
  %add60 = add nsw i32 %add50, %conv59
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1
  %seed62 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals61, i32 0, i32 8
  %22 = load i32, i32* %seed62, align 4, !tbaa !19
  %conv63 = zext i32 %22 to i64
  %and64 = and i64 %conv63, 4026531840
  %shr65 = lshr i64 %and64, 28
  %conv66 = trunc i64 %shr65 to i32
  %idxprom67 = sext i32 %conv66 to i64
  %arrayidx68 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom67
  %23 = load i8, i8* %arrayidx68, align 1, !tbaa !21
  %conv69 = sext i8 %23 to i32
  %add70 = add nsw i32 %add60, %conv69
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals71 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals71, i32 0, i32 3
  %25 = load i32, i32* %n_3, align 4, !tbaa !13
  %add72 = add i32 %25, %add70
  store i32 %add72, i32* %n_3, align 4, !tbaa !13
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals73 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1
  %seed74 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals73, i32 0, i32 8
  %27 = load i32, i32* %seed74, align 4, !tbaa !19
  %add75 = add i32 %27, 13
  %28 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %28, i32 0, i32 1
  %seed77 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals76, i32 0, i32 8
  store i32 %add75, i32* %seed77, align 4, !tbaa !19
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals78, i32 0, i32 9
  %30 = load i32, i32* %iter, align 4, !tbaa !20
  %inc = add i32 %30, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !20
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_BW_btbl_bitcount() #0 {
entry:
  %U = alloca %union.anon, align 8
  %0 = bitcast %union.anon* %U to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %2 = load i32, i32* %seed, align 4, !tbaa !19
  %conv = zext i32 %2 to i64
  %y = bitcast %union.anon* %U to i64*
  store i64 %conv, i64* %y, align 8, !tbaa !21
  %ch = bitcast %union.anon* %U to [4 x i8]*
  %arrayidx = getelementptr inbounds [4 x i8], [4 x i8]* %ch, i64 0, i64 0
  %3 = load i8, i8* %arrayidx, align 8, !tbaa !21
  %idxprom = zext i8 %3 to i64
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %4 = load i8, i8* %arrayidx1, align 1, !tbaa !21
  %conv2 = sext i8 %4 to i32
  %ch3 = bitcast %union.anon* %U to [4 x i8]*
  %arrayidx4 = getelementptr inbounds [4 x i8], [4 x i8]* %ch3, i64 0, i64 1
  %5 = load i8, i8* %arrayidx4, align 1, !tbaa !21
  %idxprom5 = zext i8 %5 to i64
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom5
  %6 = load i8, i8* %arrayidx6, align 1, !tbaa !21
  %conv7 = sext i8 %6 to i32
  %add = add nsw i32 %conv2, %conv7
  %ch8 = bitcast %union.anon* %U to [4 x i8]*
  %arrayidx9 = getelementptr inbounds [4 x i8], [4 x i8]* %ch8, i64 0, i64 3
  %7 = load i8, i8* %arrayidx9, align 1, !tbaa !21
  %idxprom10 = zext i8 %7 to i64
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom10
  %8 = load i8, i8* %arrayidx11, align 1, !tbaa !21
  %conv12 = sext i8 %8 to i32
  %add13 = add nsw i32 %add, %conv12
  %ch14 = bitcast %union.anon* %U to [4 x i8]*
  %arrayidx15 = getelementptr inbounds [4 x i8], [4 x i8]* %ch14, i64 0, i64 2
  %9 = load i8, i8* %arrayidx15, align 2, !tbaa !21
  %idxprom16 = zext i8 %9 to i64
  %arrayidx17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom16
  %10 = load i8, i8* %arrayidx17, align 1, !tbaa !21
  %conv18 = sext i8 %10 to i32
  %add19 = add nsw i32 %add13, %conv18
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 4
  %12 = load i32, i32* %n_4, align 4, !tbaa !14
  %add21 = add i32 %12, %add19
  store i32 %add21, i32* %n_4, align 4, !tbaa !14
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1
  %seed23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 8
  %14 = load i32, i32* %seed23, align 4, !tbaa !19
  %add24 = add i32 %14, 13
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1
  %seed26 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals25, i32 0, i32 8
  store i32 %add24, i32* %seed26, align 4, !tbaa !19
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 9
  %17 = load i32, i32* %iter, align 4, !tbaa !20
  %inc = add i32 %17, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !20
  %18 = bitcast %union.anon* %U to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #5
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_AR_btbl_bitcount() #0 {
entry:
  %Ptr = alloca i8*, align 8
  %Accu = alloca i32, align 4
  %0 = bitcast i8** %Ptr to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %2 = bitcast i32* %seed to i8*
  store i8* %2, i8** %Ptr, align 8, !tbaa !2
  %3 = bitcast i32* %Accu to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5
  %4 = load i8*, i8** %Ptr, align 8, !tbaa !2
  %incdec.ptr = getelementptr inbounds i8, i8* %4, i32 1
  store i8* %incdec.ptr, i8** %Ptr, align 8, !tbaa !2
  %5 = load i8, i8* %4, align 1, !tbaa !21
  %idxprom = zext i8 %5 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %6 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv = sext i8 %6 to i32
  store i32 %conv, i32* %Accu, align 4, !tbaa !17
  %7 = load i8*, i8** %Ptr, align 8, !tbaa !2
  %incdec.ptr1 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr1, i8** %Ptr, align 8, !tbaa !2
  %8 = load i8, i8* %7, align 1, !tbaa !21
  %idxprom2 = zext i8 %8 to i64
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom2
  %9 = load i8, i8* %arrayidx3, align 1, !tbaa !21
  %conv4 = sext i8 %9 to i32
  %10 = load i32, i32* %Accu, align 4, !tbaa !17
  %add = add nsw i32 %10, %conv4
  store i32 %add, i32* %Accu, align 4, !tbaa !17
  %11 = load i8*, i8** %Ptr, align 8, !tbaa !2
  %incdec.ptr5 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr5, i8** %Ptr, align 8, !tbaa !2
  %12 = load i8, i8* %11, align 1, !tbaa !21
  %idxprom6 = zext i8 %12 to i64
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom6
  %13 = load i8, i8* %arrayidx7, align 1, !tbaa !21
  %conv8 = sext i8 %13 to i32
  %14 = load i32, i32* %Accu, align 4, !tbaa !17
  %add9 = add nsw i32 %14, %conv8
  store i32 %add9, i32* %Accu, align 4, !tbaa !17
  %15 = load i8*, i8** %Ptr, align 8, !tbaa !2
  %16 = load i8, i8* %15, align 1, !tbaa !21
  %idxprom10 = zext i8 %16 to i64
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom10
  %17 = load i8, i8* %arrayidx11, align 1, !tbaa !21
  %conv12 = sext i8 %17 to i32
  %18 = load i32, i32* %Accu, align 4, !tbaa !17
  %add13 = add nsw i32 %18, %conv12
  store i32 %add13, i32* %Accu, align 4, !tbaa !17
  %19 = load i32, i32* %Accu, align 4, !tbaa !17
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 5
  %21 = load i32, i32* %n_5, align 4, !tbaa !15
  %add15 = add i32 %21, %19
  store i32 %add15, i32* %n_5, align 4, !tbaa !15
  %22 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals16 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %22, i32 0, i32 1
  %seed17 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals16, i32 0, i32 8
  %23 = load i32, i32* %seed17, align 4, !tbaa !19
  %add18 = add i32 %23, 13
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1
  %seed20 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals19, i32 0, i32 8
  store i32 %add18, i32* %seed20, align 4, !tbaa !19
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals21, i32 0, i32 9
  %26 = load i32, i32* %iter, align 4, !tbaa !20
  %inc = add i32 %26, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !20
  %27 = bitcast i32* %Accu to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %27) #5
  %28 = bitcast i8** %Ptr to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #5
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_bit_shifter() #0 {
entry:
  %i = alloca i32, align 4
  %nn = alloca i32, align 4
  %tmp_seed = alloca i32, align 4
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #5
  %1 = bitcast i32* %nn to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %1) #5
  %2 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals, i32 0, i32 8
  %4 = load i32, i32* %seed, align 4, !tbaa !19
  store i32 %4, i32* %tmp_seed, align 4, !tbaa !17
  store i32 0, i32* %nn, align 4, !tbaa !17
  store i32 0, i32* %i, align 4, !tbaa !17
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %tobool = icmp ne i32 %5, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %6 = load i32, i32* %i, align 4, !tbaa !17
  %conv = sext i32 %6 to i64
  %cmp = icmp ult i64 %conv, 64
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %7 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %7, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %8 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %conv2 = zext i32 %8 to i64
  %and = and i64 %conv2, 1
  %conv3 = trunc i64 %and to i32
  %9 = load i32, i32* %nn, align 4, !tbaa !17
  %add = add nsw i32 %9, %conv3
  store i32 %add, i32* %nn, align 4, !tbaa !17
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4, !tbaa !17
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4, !tbaa !17
  %11 = load i32, i32* %tmp_seed, align 4, !tbaa !17
  %shr = lshr i32 %11, 1
  store i32 %shr, i32* %tmp_seed, align 4, !tbaa !17
  br label %for.cond

for.end:                                          ; preds = %land.end
  %12 = load i32, i32* %nn, align 4, !tbaa !17
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals4, i32 0, i32 6
  %14 = load i32, i32* %n_6, align 4, !tbaa !16
  %add5 = add i32 %14, %12
  store i32 %add5, i32* %n_6, align 4, !tbaa !16
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i32 0, i32 1
  %seed7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 8
  %16 = load i32, i32* %seed7, align 4, !tbaa !19
  %add8 = add i32 %16, 13
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i32 0, i32 1
  %seed10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 8
  store i32 %add8, i32* %seed10, align 4, !tbaa !19
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 9
  %19 = load i32, i32* %iter, align 4, !tbaa !20
  %inc12 = add i32 %19, 1
  store i32 %inc12, i32* %iter, align 4, !tbaa !20
  %20 = bitcast i32* %tmp_seed to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %20) #5
  %21 = bitcast i32* %nn to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #5
  %22 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #5
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @task_commit() #0 {
entry:
  %0 = load i32, i32* @global_count, align 4, !tbaa !17
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @global_count, align 4, !tbaa !17
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local void @commit() #0 {
entry:
  %0 = load i32, i32* @global_count, align 4, !tbaa !17
  %rem = srem i32 %0, 2
  %cmp = icmp eq i32 %rem, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  br label %if.end

if.else:                                          ; preds = %entry
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 1), %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  store %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i32 0, i32 2), %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %t = alloca i64, align 8
  %time_taken = alloca double, align 8
  store i32 0, i32* %retval, align 4
  %0 = bitcast i64* %t to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #5
  %call = call i64 @clock() #5
  store i64 %call, i64* %t, align 8, !tbaa !22
  call void @task_init()
  call void @commit()
  %1 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %1, i32 0, i32 1
  %2 = bitcast %struct.camel_global_t* %globals to i8*
  %3 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %3, i32 0, i32 1
  %4 = bitcast %struct.camel_global_t* %globals1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %2, i8* align 4 %4, i64 44, i1 false)
  call void @task_commit()
  br label %while.cond

while.cond:                                       ; preds = %if.end173, %entry
  br label %while.body

while.body:                                       ; preds = %while.cond
  call void @task_select_func()
  call void @commit()
  %5 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %5, i32 0, i32 1
  %seed = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals2, i32 0, i32 8
  %6 = load i32, i32* %seed, align 4, !tbaa !19
  %7 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %7, i32 0, i32 1
  %seed4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals3, i32 0, i32 8
  store i32 %6, i32* %seed4, align 4, !tbaa !19
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i32 0, i32 1
  %iter = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals5, i32 0, i32 9
  %9 = load i32, i32* %iter, align 4, !tbaa !20
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i32 0, i32 1
  %iter7 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals6, i32 0, i32 9
  store i32 %9, i32* %iter7, align 4, !tbaa !20
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals8 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i32 0, i32 1
  %func = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals8, i32 0, i32 7
  %12 = load i32, i32* %func, align 4, !tbaa !18
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals9 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i32 0, i32 1
  %func10 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals9, i32 0, i32 7
  store i32 %12, i32* %func10, align 4, !tbaa !18
  call void @task_commit()
  %14 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %14, i32 0, i32 1
  %func12 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals11, i32 0, i32 7
  %15 = load i32, i32* %func12, align 4, !tbaa !18
  %cmp = icmp eq i32 %15, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %while.cond13

while.cond13:                                     ; preds = %while.body17, %if.then
  %16 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals14 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %16, i32 0, i32 1
  %iter15 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals14, i32 0, i32 9
  %17 = load i32, i32* %iter15, align 4, !tbaa !20
  %cmp16 = icmp ult i32 %17, 100
  br i1 %cmp16, label %while.body17, label %while.end

while.body17:                                     ; preds = %while.cond13
  call void @task_bit_count()
  call void @commit()
  %18 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals18 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %18, i32 0, i32 1
  %seed19 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals18, i32 0, i32 8
  %19 = load i32, i32* %seed19, align 4, !tbaa !19
  %20 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %20, i32 0, i32 1
  %seed21 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals20, i32 0, i32 8
  store i32 %19, i32* %seed21, align 4, !tbaa !19
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals22 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i32 0, i32 1
  %iter23 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals22, i32 0, i32 9
  %22 = load i32, i32* %iter23, align 4, !tbaa !20
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals24 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i32 0, i32 1
  %iter25 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals24, i32 0, i32 9
  store i32 %22, i32* %iter25, align 4, !tbaa !20
  %24 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals26 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %24, i32 0, i32 1
  %n_0 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals26, i32 0, i32 0
  %25 = load i32, i32* %n_0, align 4, !tbaa !6
  %26 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals27 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %26, i32 0, i32 1
  %n_028 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals27, i32 0, i32 0
  store i32 %25, i32* %n_028, align 4, !tbaa !6
  call void @task_commit()
  br label %while.cond13

while.end:                                        ; preds = %while.cond13
  br label %if.end173

if.else:                                          ; preds = %while.body
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals29 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i32 0, i32 1
  %func30 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals29, i32 0, i32 7
  %28 = load i32, i32* %func30, align 4, !tbaa !18
  %cmp31 = icmp eq i32 %28, 2
  br i1 %cmp31, label %if.then32, label %if.else50

if.then32:                                        ; preds = %if.else
  br label %while.cond33

while.cond33:                                     ; preds = %while.body37, %if.then32
  %29 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals34 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %29, i32 0, i32 1
  %iter35 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals34, i32 0, i32 9
  %30 = load i32, i32* %iter35, align 4, !tbaa !20
  %cmp36 = icmp ult i32 %30, 100
  br i1 %cmp36, label %while.body37, label %while.end49

while.body37:                                     ; preds = %while.cond33
  call void @task_bitcount()
  call void @commit()
  %31 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals38 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %31, i32 0, i32 1
  %seed39 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals38, i32 0, i32 8
  %32 = load i32, i32* %seed39, align 4, !tbaa !19
  %33 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals40 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %33, i32 0, i32 1
  %seed41 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals40, i32 0, i32 8
  store i32 %32, i32* %seed41, align 4, !tbaa !19
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals42 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i32 0, i32 1
  %iter43 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals42, i32 0, i32 9
  %35 = load i32, i32* %iter43, align 4, !tbaa !20
  %36 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals44 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %36, i32 0, i32 1
  %iter45 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals44, i32 0, i32 9
  store i32 %35, i32* %iter45, align 4, !tbaa !20
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i32 0, i32 1
  %n_1 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals46, i32 0, i32 1
  %38 = load i32, i32* %n_1, align 4, !tbaa !11
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals47 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i32 0, i32 1
  %n_148 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals47, i32 0, i32 1
  store i32 %38, i32* %n_148, align 4, !tbaa !11
  call void @task_commit()
  br label %while.cond33

while.end49:                                      ; preds = %while.cond33
  br label %if.end172

if.else50:                                        ; preds = %if.else
  %40 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals51 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %40, i32 0, i32 1
  %func52 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals51, i32 0, i32 7
  %41 = load i32, i32* %func52, align 4, !tbaa !18
  %cmp53 = icmp eq i32 %41, 3
  br i1 %cmp53, label %if.then54, label %if.else72

if.then54:                                        ; preds = %if.else50
  br label %while.cond55

while.cond55:                                     ; preds = %while.body59, %if.then54
  %42 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i32 0, i32 1
  %iter57 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals56, i32 0, i32 9
  %43 = load i32, i32* %iter57, align 4, !tbaa !20
  %cmp58 = icmp ult i32 %43, 100
  br i1 %cmp58, label %while.body59, label %while.end71

while.body59:                                     ; preds = %while.cond55
  call void @task_ntbl_bitcnt()
  call void @commit()
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals60 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i32 0, i32 1
  %seed61 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals60, i32 0, i32 8
  %45 = load i32, i32* %seed61, align 4, !tbaa !19
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals62 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i32 0, i32 1
  %seed63 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals62, i32 0, i32 8
  store i32 %45, i32* %seed63, align 4, !tbaa !19
  %47 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals64 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %47, i32 0, i32 1
  %iter65 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals64, i32 0, i32 9
  %48 = load i32, i32* %iter65, align 4, !tbaa !20
  %49 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals66 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %49, i32 0, i32 1
  %iter67 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals66, i32 0, i32 9
  store i32 %48, i32* %iter67, align 4, !tbaa !20
  %50 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals68 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %50, i32 0, i32 1
  %n_2 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals68, i32 0, i32 2
  %51 = load i32, i32* %n_2, align 4, !tbaa !12
  %52 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals69 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %52, i32 0, i32 1
  %n_270 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals69, i32 0, i32 2
  store i32 %51, i32* %n_270, align 4, !tbaa !12
  call void @task_commit()
  br label %while.cond55

while.end71:                                      ; preds = %while.cond55
  br label %if.end171

if.else72:                                        ; preds = %if.else50
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals73 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i32 0, i32 1
  %func74 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals73, i32 0, i32 7
  %54 = load i32, i32* %func74, align 4, !tbaa !18
  %cmp75 = icmp eq i32 %54, 4
  br i1 %cmp75, label %if.then76, label %if.else94

if.then76:                                        ; preds = %if.else72
  br label %while.cond77

while.cond77:                                     ; preds = %while.body81, %if.then76
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals78 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i32 0, i32 1
  %iter79 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals78, i32 0, i32 9
  %56 = load i32, i32* %iter79, align 4, !tbaa !20
  %cmp80 = icmp ult i32 %56, 100
  br i1 %cmp80, label %while.body81, label %while.end93

while.body81:                                     ; preds = %while.cond77
  call void @task_ntbl_bitcount()
  call void @commit()
  %57 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals82 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %57, i32 0, i32 1
  %seed83 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals82, i32 0, i32 8
  %58 = load i32, i32* %seed83, align 4, !tbaa !19
  %59 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals84 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i32 0, i32 1
  %seed85 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals84, i32 0, i32 8
  store i32 %58, i32* %seed85, align 4, !tbaa !19
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals86 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i32 0, i32 1
  %iter87 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals86, i32 0, i32 9
  %61 = load i32, i32* %iter87, align 4, !tbaa !20
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals88 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i32 0, i32 1
  %iter89 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals88, i32 0, i32 9
  store i32 %61, i32* %iter89, align 4, !tbaa !20
  %63 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals90 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %63, i32 0, i32 1
  %n_3 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals90, i32 0, i32 3
  %64 = load i32, i32* %n_3, align 4, !tbaa !13
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals91 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i32 0, i32 1
  %n_392 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals91, i32 0, i32 3
  store i32 %64, i32* %n_392, align 4, !tbaa !13
  call void @task_commit()
  br label %while.cond77

while.end93:                                      ; preds = %while.cond77
  br label %if.end170

if.else94:                                        ; preds = %if.else72
  %66 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals95 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %66, i32 0, i32 1
  %func96 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals95, i32 0, i32 7
  %67 = load i32, i32* %func96, align 4, !tbaa !18
  %cmp97 = icmp eq i32 %67, 5
  br i1 %cmp97, label %if.then98, label %if.else116

if.then98:                                        ; preds = %if.else94
  br label %while.cond99

while.cond99:                                     ; preds = %while.body103, %if.then98
  %68 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals100 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %68, i32 0, i32 1
  %iter101 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals100, i32 0, i32 9
  %69 = load i32, i32* %iter101, align 4, !tbaa !20
  %cmp102 = icmp ult i32 %69, 100
  br i1 %cmp102, label %while.body103, label %while.end115

while.body103:                                    ; preds = %while.cond99
  call void @task_BW_btbl_bitcount()
  call void @commit()
  %70 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals104 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %70, i32 0, i32 1
  %seed105 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals104, i32 0, i32 8
  %71 = load i32, i32* %seed105, align 4, !tbaa !19
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals106 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i32 0, i32 1
  %seed107 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals106, i32 0, i32 8
  store i32 %71, i32* %seed107, align 4, !tbaa !19
  %73 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals108 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %73, i32 0, i32 1
  %iter109 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals108, i32 0, i32 9
  %74 = load i32, i32* %iter109, align 4, !tbaa !20
  %75 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals110 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %75, i32 0, i32 1
  %iter111 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals110, i32 0, i32 9
  store i32 %74, i32* %iter111, align 4, !tbaa !20
  %76 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %76, i32 0, i32 1
  %n_4 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals112, i32 0, i32 4
  %77 = load i32, i32* %n_4, align 4, !tbaa !14
  %78 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals113 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %78, i32 0, i32 1
  %n_4114 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals113, i32 0, i32 4
  store i32 %77, i32* %n_4114, align 4, !tbaa !14
  call void @task_commit()
  br label %while.cond99

while.end115:                                     ; preds = %while.cond99
  br label %if.end169

if.else116:                                       ; preds = %if.else94
  %79 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals117 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %79, i32 0, i32 1
  %func118 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals117, i32 0, i32 7
  %80 = load i32, i32* %func118, align 4, !tbaa !18
  %cmp119 = icmp eq i32 %80, 6
  br i1 %cmp119, label %if.then120, label %if.else138

if.then120:                                       ; preds = %if.else116
  br label %while.cond121

while.cond121:                                    ; preds = %while.body125, %if.then120
  %81 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals122 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %81, i32 0, i32 1
  %iter123 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals122, i32 0, i32 9
  %82 = load i32, i32* %iter123, align 4, !tbaa !20
  %cmp124 = icmp ult i32 %82, 100
  br i1 %cmp124, label %while.body125, label %while.end137

while.body125:                                    ; preds = %while.cond121
  call void @task_AR_btbl_bitcount()
  call void @commit()
  %83 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals126 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %83, i32 0, i32 1
  %seed127 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals126, i32 0, i32 8
  %84 = load i32, i32* %seed127, align 4, !tbaa !19
  %85 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals128 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %85, i32 0, i32 1
  %seed129 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals128, i32 0, i32 8
  store i32 %84, i32* %seed129, align 4, !tbaa !19
  %86 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals130 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %86, i32 0, i32 1
  %iter131 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals130, i32 0, i32 9
  %87 = load i32, i32* %iter131, align 4, !tbaa !20
  %88 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals132 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %88, i32 0, i32 1
  %iter133 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals132, i32 0, i32 9
  store i32 %87, i32* %iter133, align 4, !tbaa !20
  %89 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals134 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %89, i32 0, i32 1
  %n_5 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals134, i32 0, i32 5
  %90 = load i32, i32* %n_5, align 4, !tbaa !15
  %91 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals135 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i32 0, i32 1
  %n_5136 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals135, i32 0, i32 5
  store i32 %90, i32* %n_5136, align 4, !tbaa !15
  call void @task_commit()
  br label %while.cond121

while.end137:                                     ; preds = %while.cond121
  br label %if.end168

if.else138:                                       ; preds = %if.else116
  %92 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals139 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %92, i32 0, i32 1
  %func140 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals139, i32 0, i32 7
  %93 = load i32, i32* %func140, align 4, !tbaa !18
  %cmp141 = icmp eq i32 %93, 7
  br i1 %cmp141, label %if.then142, label %if.else160

if.then142:                                       ; preds = %if.else138
  br label %while.cond143

while.cond143:                                    ; preds = %while.body147, %if.then142
  %94 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals144 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %94, i32 0, i32 1
  %iter145 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals144, i32 0, i32 9
  %95 = load i32, i32* %iter145, align 4, !tbaa !20
  %cmp146 = icmp ult i32 %95, 100
  br i1 %cmp146, label %while.body147, label %while.end159

while.body147:                                    ; preds = %while.cond143
  call void @task_bit_shifter()
  call void @commit()
  %96 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %96, i32 0, i32 1
  %seed149 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals148, i32 0, i32 8
  %97 = load i32, i32* %seed149, align 4, !tbaa !19
  %98 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals150 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %98, i32 0, i32 1
  %seed151 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals150, i32 0, i32 8
  store i32 %97, i32* %seed151, align 4, !tbaa !19
  %99 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals152 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %99, i32 0, i32 1
  %iter153 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals152, i32 0, i32 9
  %100 = load i32, i32* %iter153, align 4, !tbaa !20
  %101 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals154 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %101, i32 0, i32 1
  %iter155 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals154, i32 0, i32 9
  store i32 %100, i32* %iter155, align 4, !tbaa !20
  %102 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals156 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %102, i32 0, i32 1
  %n_6 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals156, i32 0, i32 6
  %103 = load i32, i32* %n_6, align 4, !tbaa !16
  %104 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals157 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %104, i32 0, i32 1
  %n_6158 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals157, i32 0, i32 6
  store i32 %103, i32* %n_6158, align 4, !tbaa !16
  call void @task_commit()
  br label %while.cond143

while.end159:                                     ; preds = %while.cond143
  br label %if.end167

if.else160:                                       ; preds = %if.else138
  %105 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals161 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %105, i32 0, i32 1
  %func162 = getelementptr inbounds %struct.camel_global_t, %struct.camel_global_t* %globals161, i32 0, i32 7
  %106 = load i32, i32* %func162, align 4, !tbaa !18
  %cmp163 = icmp eq i32 %106, 8
  br i1 %cmp163, label %if.then164, label %if.end

if.then164:                                       ; preds = %if.else160
  call void @task_done()
  %call165 = call i64 @clock() #5
  %107 = load i64, i64* %t, align 8, !tbaa !22
  %sub = sub nsw i64 %call165, %107
  store i64 %sub, i64* %t, align 8, !tbaa !22
  %108 = bitcast double* %time_taken to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %108) #5
  %109 = load i64, i64* %t, align 8, !tbaa !22
  %conv = sitofp i64 %109 to double
  %div = fdiv double %conv, 1.000000e+06
  store double %div, double* %time_taken, align 8, !tbaa !24
  %110 = load double, double* %time_taken, align 8, !tbaa !24
  %call166 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i64 0, i64 0), double %110)
  call void @exit(i32 0) #6
  unreachable

if.end:                                           ; preds = %if.else160
  br label %if.end167

if.end167:                                        ; preds = %if.end, %while.end159
  br label %if.end168

if.end168:                                        ; preds = %if.end167, %while.end137
  br label %if.end169

if.end169:                                        ; preds = %if.end168, %while.end115
  br label %if.end170

if.end170:                                        ; preds = %if.end169, %while.end93
  br label %if.end171

if.end171:                                        ; preds = %if.end170, %while.end71
  br label %if.end172

if.end172:                                        ; preds = %if.end171, %while.end49
  br label %if.end173

if.end173:                                        ; preds = %if.end172, %while.end
  br label %while.cond
}

; Function Attrs: nounwind
declare dso_local i64 @clock() #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0 (https://github.com/llvm/llvm-project.git f79f68975d51b389d9f141aa30ab47723a75a868)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 40}
!7 = !{!"camel_buffer_t", !4, i64 0, !8, i64 40, !10, i64 84}
!8 = !{!"camel_global_t", !9, i64 0, !9, i64 4, !9, i64 8, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !9, i64 32, !9, i64 36, !9, i64 40}
!9 = !{!"int", !4, i64 0}
!10 = !{!"short", !4, i64 0}
!11 = !{!7, !9, i64 44}
!12 = !{!7, !9, i64 48}
!13 = !{!7, !9, i64 52}
!14 = !{!7, !9, i64 56}
!15 = !{!7, !9, i64 60}
!16 = !{!7, !9, i64 64}
!17 = !{!9, !9, i64 0}
!18 = !{!7, !9, i64 68}
!19 = !{!7, !9, i64 72}
!20 = !{!7, !9, i64 76}
!21 = !{!4, !4, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"long", !4, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"double", !4, i64 0}
