; ModuleID = 'bc_O3.bc'
source_filename = "bc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Camel = type { i16, %struct.camel_buffer_t, %struct.camel_buffer_t }
%struct.camel_buffer_t = type { [10 x i32], %struct.camel_global_t, i16 }
%struct.camel_global_t = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }

@camel = common dso_local global %struct.Camel zeroinitializer, align 4
@safe = dso_local local_unnamed_addr global %struct.camel_buffer_t* bitcast (i32* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2, i32 0, i64 0) to %struct.camel_buffer_t*), align 8
@unsafe = dso_local local_unnamed_addr global %struct.camel_buffer_t* bitcast (i32* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1, i32 0, i64 0) to %struct.camel_buffer_t*), align 8
@global_count = dso_local local_unnamed_addr global i32 0, align 4
@c = dso_local local_unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"n0: %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"n1: %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"n2: %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"n3: %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"n4: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"n5: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [8 x i8] c"n6: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [18 x i8] c"The count is: %d\0A\00", align 1
@bits = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@.str.8 = private unnamed_addr constant [32 x i8] c"bc took %f seconds to execute \0A\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local void @task_done() local_unnamed_addr #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_0 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 0
  %1 = load i32, i32* %n_0, align 4, !tbaa !6
  %call = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0), i32 %1)
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i64 0, i32 1, i32 1
  %3 = load i32, i32* %n_1, align 4, !tbaa !11
  %call2 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i64 0, i64 0), i32 %3)
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i64 0, i32 1, i32 2
  %5 = load i32, i32* %n_2, align 4, !tbaa !12
  %call4 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.2, i64 0, i64 0), i32 %5)
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i64 0, i32 1, i32 3
  %7 = load i32, i32* %n_3, align 4, !tbaa !13
  %call6 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.3, i64 0, i64 0), i32 %7)
  %8 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %8, i64 0, i32 1, i32 4
  %9 = load i32, i32* %n_4, align 4, !tbaa !14
  %call8 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), i32 %9)
  %10 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %10, i64 0, i32 1, i32 5
  %11 = load i32, i32* %n_5, align 4, !tbaa !15
  %call10 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), i32 %11)
  %12 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %n_6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i64 0, i32 1, i32 6
  %13 = load i32, i32* %n_6, align 4, !tbaa !16
  %call12 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([8 x i8], [8 x i8]* @.str.6, i64 0, i64 0), i32 %13)
  %14 = load i32, i32* @global_count, align 4, !tbaa !17
  %call13 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([18 x i8], [18 x i8]* @.str.7, i64 0, i64 0), i32 %14)
  ret void
}

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_init() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %n_0 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 0
  %1 = bitcast i32* %n_0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %1, i8 0, i64 32, i1 false)
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_select_func() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  store i32 4, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  store i32 0, i32* %iter, align 4, !tbaa !19
  %func = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 7
  %1 = load i32, i32* %func, align 4, !tbaa !20
  %inc = add i32 %1, 1
  store i32 %inc, i32* %func, align 4, !tbaa !20
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_bit_count() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %add = add i32 %1, 13
  store i32 %add, i32* %seed, align 4, !tbaa !18
  %tobool = icmp eq i32 %1, 0
  br i1 %tobool, label %if.end, label %do.body

do.body:                                          ; preds = %entry, %do.body
  %tmp_seed.0 = phi i32 [ %and, %do.body ], [ %1, %entry ]
  %temp.0 = phi i32 [ %inc, %do.body ], [ 0, %entry ]
  %inc = add i32 %temp.0, 1
  %sub = add i32 %tmp_seed.0, -1
  %and = and i32 %sub, %tmp_seed.0
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.end, label %do.body

if.end:                                           ; preds = %do.body, %entry
  %temp.1 = phi i32 [ 0, %entry ], [ %inc, %do.body ]
  %n_0 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 0
  %2 = load i32, i32* %n_0, align 4, !tbaa !6
  %add6 = add i32 %2, %temp.1
  store i32 %add6, i32* %n_0, align 4, !tbaa !6
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %3 = load i32, i32* %iter, align 4, !tbaa !19
  %inc8 = add i32 %3, 1
  store i32 %inc8, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_bitcount() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %add = add i32 %1, 13
  store i32 %add, i32* %seed, align 4, !tbaa !18
  %and = lshr i32 %1, 1
  %2 = and i32 %and, 1431655765
  %and6 = and i32 %1, 1431655765
  %add7 = add nuw i32 %2, %and6
  %and10 = lshr i32 %add7, 2
  %3 = and i32 %and10, 858993459
  %and13 = and i32 %add7, 858993459
  %add14 = add nuw nsw i32 %3, %and13
  %and17 = lshr i32 %add14, 4
  %4 = and i32 %and17, 117901063
  %and20 = and i32 %add14, 117901063
  %add21 = add nuw nsw i32 %4, %and20
  %and24 = lshr i32 %add21, 8
  %5 = and i32 %and24, 983055
  %and27 = and i32 %add21, 983055
  %add28 = add nuw nsw i32 %5, %and27
  %6 = lshr i32 %add28, 16
  %and34 = and i32 %add28, 31
  %n_1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 1
  %7 = load i32, i32* %n_1, align 4, !tbaa !11
  %add35 = add i32 %and34, %7
  %add38 = add i32 %add35, %6
  store i32 %add38, i32* %n_1, align 4, !tbaa !11
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %8 = load i32, i32* %iter, align 4, !tbaa !19
  %inc = add i32 %8, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nounwind readnone uwtable
define dso_local i32 @recursive_cnt(i32 %x) local_unnamed_addr #3 {
entry:
  %0 = and i32 %x, 15
  %idxprom = zext i32 %0 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv2 = sext i8 %1 to i32
  %shr = lshr i32 %x, 4
  %cmp = icmp eq i32 %shr, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 @recursive_cnt(i32 %shr)
  %add = add nsw i32 %call, %conv2
  ret i32 %add

if.end:                                           ; preds = %entry
  ret i32 %conv2
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @task_ntbl_bitcnt() local_unnamed_addr #0 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %call = tail call i32 @recursive_cnt(i32 %1)
  %n_2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 2
  %2 = load i32, i32* %n_2, align 4, !tbaa !12
  %add = add i32 %2, %call
  store i32 %add, i32* %n_2, align 4, !tbaa !12
  %add4 = add i32 %1, 13
  store i32 %add4, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %3 = load i32, i32* %iter, align 4, !tbaa !19
  %inc = add i32 %3, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_ntbl_bitcount() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %and = and i32 %1, 15
  %idxprom = zext i32 %and to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv2 = sext i8 %2 to i32
  %and6 = lshr i32 %1, 4
  %shr = and i32 %and6, 15
  %idxprom8 = zext i32 %shr to i64
  %arrayidx9 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom8
  %3 = load i8, i8* %arrayidx9, align 1, !tbaa !21
  %conv10 = sext i8 %3 to i32
  %add = add nsw i32 %conv10, %conv2
  %and14 = lshr i32 %1, 8
  %shr15 = and i32 %and14, 15
  %idxprom17 = zext i32 %shr15 to i64
  %arrayidx18 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom17
  %4 = load i8, i8* %arrayidx18, align 1, !tbaa !21
  %conv19 = sext i8 %4 to i32
  %add20 = add nsw i32 %add, %conv19
  %and24 = lshr i32 %1, 12
  %shr25 = and i32 %and24, 15
  %idxprom27 = zext i32 %shr25 to i64
  %arrayidx28 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom27
  %5 = load i8, i8* %arrayidx28, align 1, !tbaa !21
  %conv29 = sext i8 %5 to i32
  %add30 = add nsw i32 %add20, %conv29
  %and34 = lshr i32 %1, 16
  %shr35 = and i32 %and34, 15
  %idxprom37 = zext i32 %shr35 to i64
  %arrayidx38 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom37
  %6 = load i8, i8* %arrayidx38, align 1, !tbaa !21
  %conv39 = sext i8 %6 to i32
  %add40 = add nsw i32 %add30, %conv39
  %and44 = lshr i32 %1, 20
  %shr45 = and i32 %and44, 15
  %idxprom47 = zext i32 %shr45 to i64
  %arrayidx48 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom47
  %7 = load i8, i8* %arrayidx48, align 1, !tbaa !21
  %conv49 = sext i8 %7 to i32
  %add50 = add nsw i32 %add40, %conv49
  %and54 = lshr i32 %1, 24
  %shr55 = and i32 %and54, 15
  %idxprom57 = zext i32 %shr55 to i64
  %arrayidx58 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom57
  %8 = load i8, i8* %arrayidx58, align 1, !tbaa !21
  %conv59 = sext i8 %8 to i32
  %add60 = add nsw i32 %add50, %conv59
  %9 = lshr i32 %1, 28
  %idxprom67 = zext i32 %9 to i64
  %arrayidx68 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom67
  %10 = load i8, i8* %arrayidx68, align 1, !tbaa !21
  %conv69 = sext i8 %10 to i32
  %add70 = add nsw i32 %add60, %conv69
  %n_3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 3
  %11 = load i32, i32* %n_3, align 4, !tbaa !13
  %add72 = add i32 %add70, %11
  store i32 %add72, i32* %n_3, align 4, !tbaa !13
  %add75 = add i32 %1, 13
  store i32 %add75, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %12 = load i32, i32* %iter, align 4, !tbaa !19
  %inc = add i32 %12, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_BW_btbl_bitcount() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %U.sroa.4.0.extract.shift = lshr i32 %1, 8
  %U.sroa.5.0.extract.shift = lshr i32 %1, 16
  %2 = lshr i32 %1, 24
  %U.sroa.6.0.extract.trunc = zext i32 %2 to i64
  %3 = and i32 %1, 255
  %idxprom = zext i32 %3 to i64
  %arrayidx1 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %4 = load i8, i8* %arrayidx1, align 1, !tbaa !21
  %conv2 = sext i8 %4 to i32
  %5 = and i32 %U.sroa.4.0.extract.shift, 255
  %idxprom5 = zext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom5
  %6 = load i8, i8* %arrayidx6, align 1, !tbaa !21
  %conv7 = sext i8 %6 to i32
  %add = add nsw i32 %conv7, %conv2
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %U.sroa.6.0.extract.trunc
  %7 = load i8, i8* %arrayidx11, align 1, !tbaa !21
  %conv12 = sext i8 %7 to i32
  %add13 = add nsw i32 %add, %conv12
  %8 = and i32 %U.sroa.5.0.extract.shift, 255
  %idxprom16 = zext i32 %8 to i64
  %arrayidx17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom16
  %9 = load i8, i8* %arrayidx17, align 1, !tbaa !21
  %conv18 = sext i8 %9 to i32
  %add19 = add nsw i32 %add13, %conv18
  %n_4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 4
  %10 = load i32, i32* %n_4, align 4, !tbaa !14
  %add21 = add i32 %add19, %10
  store i32 %add21, i32* %n_4, align 4, !tbaa !14
  %add24 = add i32 %1, 13
  store i32 %add24, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %11 = load i32, i32* %iter, align 4, !tbaa !19
  %inc = add i32 %11, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_AR_btbl_bitcount() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = bitcast i32* %seed to i8*
  %incdec.ptr = getelementptr inbounds i8, i8* %1, i64 1
  %2 = load i8, i8* %1, align 1, !tbaa !21
  %idxprom = zext i8 %2 to i64
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom
  %3 = load i8, i8* %arrayidx, align 1, !tbaa !21
  %conv = sext i8 %3 to i32
  %incdec.ptr1 = getelementptr inbounds i8, i8* %1, i64 2
  %4 = load i8, i8* %incdec.ptr, align 1, !tbaa !21
  %idxprom2 = zext i8 %4 to i64
  %arrayidx3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom2
  %5 = load i8, i8* %arrayidx3, align 1, !tbaa !21
  %conv4 = sext i8 %5 to i32
  %add = add nsw i32 %conv4, %conv
  %incdec.ptr5 = getelementptr inbounds i8, i8* %1, i64 3
  %6 = load i8, i8* %incdec.ptr1, align 1, !tbaa !21
  %idxprom6 = zext i8 %6 to i64
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom6
  %7 = load i8, i8* %arrayidx7, align 1, !tbaa !21
  %conv8 = sext i8 %7 to i32
  %add9 = add nsw i32 %add, %conv8
  %8 = load i8, i8* %incdec.ptr5, align 1, !tbaa !21
  %idxprom10 = zext i8 %8 to i64
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom10
  %9 = load i8, i8* %arrayidx11, align 1, !tbaa !21
  %conv12 = sext i8 %9 to i32
  %add13 = add nsw i32 %add9, %conv12
  %n_5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 5
  %10 = load i32, i32* %n_5, align 4, !tbaa !15
  %add15 = add i32 %add13, %10
  store i32 %add15, i32* %n_5, align 4, !tbaa !15
  %11 = load i32, i32* %seed, align 4, !tbaa !18
  %add18 = add i32 %11, 13
  store i32 %add18, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %12 = load i32, i32* %iter, align 4, !tbaa !19
  %inc = add i32 %12, 1
  store i32 %inc, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_bit_shifter() local_unnamed_addr #2 {
entry:
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 8
  %1 = load i32, i32* %seed, align 4, !tbaa !18
  %tobool8 = icmp eq i32 %1, 0
  br i1 %tobool8, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %tmp_seed.011 = phi i32 [ %shr, %for.body ], [ %1, %entry ]
  %nn.010 = phi i32 [ %add, %for.body ], [ 0, %entry ]
  %2 = and i32 %tmp_seed.011, 1
  %add = add nuw nsw i32 %2, %nn.010
  %shr = lshr i32 %tmp_seed.011, 1
  %tobool = icmp eq i32 %shr, 0
  br i1 %tobool, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %nn.0.lcssa = phi i32 [ 0, %entry ], [ %add, %for.body ]
  %n_6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 6
  %3 = load i32, i32* %n_6, align 4, !tbaa !16
  %add5 = add i32 %3, %nn.0.lcssa
  store i32 %add5, i32* %n_6, align 4, !tbaa !16
  %add8 = add i32 %1, 13
  store i32 %add8, i32* %seed, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 9
  %4 = load i32, i32* %iter, align 4, !tbaa !19
  %inc12 = add i32 %4, 1
  store i32 %inc12, i32* %iter, align 4, !tbaa !19
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @task_commit() local_unnamed_addr #2 {
entry:
  %0 = load i32, i32* @global_count, align 4, !tbaa !17
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @global_count, align 4, !tbaa !17
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @commit() local_unnamed_addr #2 {
entry:
  %0 = load i32, i32* @global_count, align 4, !tbaa !17
  %rem = srem i32 %0, 2
  %cmp = icmp eq i32 %rem, 1
  %. = select i1 %cmp, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2 = select i1 %cmp, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  store %struct.camel_buffer_t* %., %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  store %struct.camel_buffer_t* %.2, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
entry:
  %call = tail call i64 @clock() #8
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %n_0.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1, i32 0
  %1 = bitcast i32* %n_0.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(32) %1, i8 0, i64 32, i1 false) #8
  %2 = load i32, i32* @global_count, align 4, !tbaa !17
  %rem.i = srem i32 %2, 2
  %cmp.i = icmp eq i32 %rem.i, 1
  %..i = select i1 %cmp.i, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i = select i1 %cmp.i, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  store %struct.camel_buffer_t* %..i, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  store %struct.camel_buffer_t* %.2.i, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i, i64 0, i32 1
  %3 = bitcast %struct.camel_global_t* %globals to i8*
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i, i64 0, i32 1
  %4 = bitcast %struct.camel_global_t* %globals1 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(44) %3, i8* nonnull align 4 dereferenceable(44) %4, i64 44, i1 false)
  %inc.i50 = add nsw i32 %2, 1
  store i32 %inc.i50, i32* @global_count, align 4, !tbaa !17
  br label %while.cond

while.cond:                                       ; preds = %while.cond.backedge, %entry
  %inc.i65.lcssa137 = phi i32 [ %inc.i50, %entry ], [ %inc.i65.lcssa137.be, %while.cond.backedge ]
  %.2.i69.lcssa127 = phi %struct.camel_buffer_t* [ %.2.i, %entry ], [ %.2.i69.lcssa127.be, %while.cond.backedge ]
  %seed.i83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69.lcssa127, i64 0, i32 1, i32 8
  store i32 4, i32* %seed.i83, align 4, !tbaa !18
  %iter.i84 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69.lcssa127, i64 0, i32 1, i32 9
  store i32 0, i32* %iter.i84, align 4, !tbaa !19
  %func.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69.lcssa127, i64 0, i32 1, i32 7
  %5 = load i32, i32* %func.i, align 4, !tbaa !20
  %inc.i85 = add i32 %5, 1
  store i32 %inc.i85, i32* %func.i, align 4, !tbaa !20
  %rem.i79 = srem i32 %inc.i65.lcssa137, 2
  %cmp.i80 = icmp eq i32 %rem.i79, 1
  %..i81 = select i1 %cmp.i80, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i82 = select i1 %cmp.i80, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i81, i64 0, i32 1, i32 8
  %6 = load i32, i32* %seed, align 4, !tbaa !18
  %seed4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 8
  store i32 %6, i32* %seed4, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i81, i64 0, i32 1, i32 9
  %7 = load i32, i32* %iter, align 4, !tbaa !19
  %iter7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 9
  store i32 %7, i32* %iter7, align 4, !tbaa !19
  %func = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i81, i64 0, i32 1, i32 7
  %8 = load i32, i32* %func, align 4, !tbaa !20
  %func10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 7
  store i32 %8, i32* %func10, align 4, !tbaa !20
  %inc.i78 = add nsw i32 %inc.i65.lcssa137, 1
  switch i32 %8, label %while.cond.backedge [
    i32 1, label %while.cond13.preheader
    i32 2, label %while.cond33.preheader
    i32 3, label %while.cond55.preheader
    i32 4, label %while.cond77.preheader
    i32 5, label %while.cond99.preheader
    i32 6, label %while.cond121.preheader
    i32 7, label %while.cond143.preheader
    i32 8, label %if.then164
  ]

while.cond143.preheader:                          ; preds = %while.cond
  %cmp14693 = icmp ult i32 %7, 100
  br i1 %cmp14693, label %while.body147, label %while.cond.backedge

while.cond.backedge:                              ; preds = %task_bit_shifter.exit, %while.body125, %while.body103, %while.body81, %while.body59, %while.body37, %task_bit_count.exit, %while.cond143.preheader, %while.cond121.preheader, %while.cond99.preheader, %while.cond77.preheader, %while.cond55.preheader, %while.cond33.preheader, %while.cond13.preheader, %while.cond
  %inc.i65.lcssa137.be = phi i32 [ %inc.i78, %while.cond ], [ %inc.i78, %while.cond13.preheader ], [ %inc.i78, %while.cond33.preheader ], [ %inc.i78, %while.cond55.preheader ], [ %inc.i78, %while.cond77.preheader ], [ %inc.i78, %while.cond99.preheader ], [ %inc.i78, %while.cond121.preheader ], [ %inc.i78, %while.cond143.preheader ], [ %inc.i65, %task_bit_count.exit ], [ %inc.i51, %while.body37 ], [ %inc.i41, %while.body59 ], [ %inc.i28, %while.body81 ], [ %inc.i15, %while.body103 ], [ %inc.i6, %while.body125 ], [ %inc.i, %task_bit_shifter.exit ]
  %.2.i69.lcssa127.be = phi %struct.camel_buffer_t* [ %.2.i82, %while.cond ], [ %.2.i82, %while.cond13.preheader ], [ %.2.i82, %while.cond33.preheader ], [ %.2.i82, %while.cond55.preheader ], [ %.2.i82, %while.cond77.preheader ], [ %.2.i82, %while.cond99.preheader ], [ %.2.i82, %while.cond121.preheader ], [ %.2.i82, %while.cond143.preheader ], [ %.2.i69, %task_bit_count.exit ], [ %.2.i55, %while.body37 ], [ %.2.i45, %while.body59 ], [ %.2.i32, %while.body81 ], [ %.2.i19, %while.body103 ], [ %.2.i10, %while.body125 ], [ %.2.i5, %task_bit_shifter.exit ]
  br label %while.cond

while.cond121.preheader:                          ; preds = %while.cond
  %cmp12496 = icmp ult i32 %7, 100
  br i1 %cmp12496, label %while.body125.preheader, label %while.cond.backedge

while.body125.preheader:                          ; preds = %while.cond121.preheader
  %n_5.i.phi.trans.insert = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 5
  %.pre = load i32, i32* %n_5.i.phi.trans.insert, align 4, !tbaa !15
  br label %while.body125

while.cond99.preheader:                           ; preds = %while.cond
  %cmp102100 = icmp ult i32 %7, 100
  br i1 %cmp102100, label %while.body103.preheader, label %while.cond.backedge

while.body103.preheader:                          ; preds = %while.cond99.preheader
  %n_4.i.phi.trans.insert = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 4
  %.pre144 = load i32, i32* %n_4.i.phi.trans.insert, align 4, !tbaa !14
  br label %while.body103

while.cond77.preheader:                           ; preds = %while.cond
  %cmp80104 = icmp ult i32 %7, 100
  br i1 %cmp80104, label %while.body81.preheader, label %while.cond.backedge

while.body81.preheader:                           ; preds = %while.cond77.preheader
  %n_3.i.phi.trans.insert = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 3
  %.pre145 = load i32, i32* %n_3.i.phi.trans.insert, align 4, !tbaa !13
  br label %while.body81

while.cond55.preheader:                           ; preds = %while.cond
  %cmp58108 = icmp ult i32 %7, 100
  br i1 %cmp58108, label %while.body59.preheader, label %while.cond.backedge

while.body59.preheader:                           ; preds = %while.cond55.preheader
  %n_2.i.phi.trans.insert = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 2
  %.pre146 = load i32, i32* %n_2.i.phi.trans.insert, align 4, !tbaa !12
  br label %while.body59

while.cond33.preheader:                           ; preds = %while.cond
  %cmp36112 = icmp ult i32 %7, 100
  br i1 %cmp36112, label %while.body37.preheader, label %while.cond.backedge

while.body37.preheader:                           ; preds = %while.cond33.preheader
  %n_1.i.phi.trans.insert = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i82, i64 0, i32 1, i32 1
  %.pre147 = load i32, i32* %n_1.i.phi.trans.insert, align 4, !tbaa !11
  br label %while.body37

while.cond13.preheader:                           ; preds = %while.cond
  %cmp16116 = icmp ult i32 %7, 100
  br i1 %cmp16116, label %while.body17, label %while.cond.backedge

while.body17:                                     ; preds = %while.cond13.preheader, %task_bit_count.exit
  %9 = phi i32 [ %14, %task_bit_count.exit ], [ %6, %while.cond13.preheader ]
  %10 = phi i32 [ %inc.i65, %task_bit_count.exit ], [ %inc.i78, %while.cond13.preheader ]
  %11 = phi i32 [ %15, %task_bit_count.exit ], [ %7, %while.cond13.preheader ]
  %iter15117 = phi i32* [ %iter25, %task_bit_count.exit ], [ %iter7, %while.cond13.preheader ]
  %12 = phi %struct.camel_buffer_t* [ %.2.i69, %task_bit_count.exit ], [ %.2.i82, %while.cond13.preheader ]
  %seed.i70 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i64 0, i32 1, i32 8
  %add.i71 = add i32 %9, 13
  store i32 %add.i71, i32* %seed.i70, align 4, !tbaa !18
  %tobool.i72 = icmp eq i32 %9, 0
  br i1 %tobool.i72, label %task_bit_count.exit, label %do.body.i

do.body.i:                                        ; preds = %while.body17, %do.body.i
  %tmp_seed.0.i = phi i32 [ %and.i74, %do.body.i ], [ %9, %while.body17 ]
  %temp.0.i = phi i32 [ %inc.i73, %do.body.i ], [ 0, %while.body17 ]
  %inc.i73 = add i32 %temp.0.i, 1
  %sub.i = add i32 %tmp_seed.0.i, -1
  %and.i74 = and i32 %sub.i, %tmp_seed.0.i
  %cmp.i75 = icmp eq i32 %and.i74, 0
  br i1 %cmp.i75, label %task_bit_count.exit, label %do.body.i

task_bit_count.exit:                              ; preds = %do.body.i, %while.body17
  %temp.1.i = phi i32 [ 0, %while.body17 ], [ %inc.i73, %do.body.i ]
  %n_0.i76 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %12, i64 0, i32 1, i32 0
  %13 = load i32, i32* %n_0.i76, align 4, !tbaa !6
  %add6.i = add i32 %13, %temp.1.i
  store i32 %add6.i, i32* %n_0.i76, align 4, !tbaa !6
  %inc8.i = add i32 %11, 1
  store i32 %inc8.i, i32* %iter15117, align 4, !tbaa !19
  %rem.i66 = srem i32 %10, 2
  %cmp.i67 = icmp eq i32 %rem.i66, 1
  %..i68 = select i1 %cmp.i67, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i69 = select i1 %cmp.i67, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i68, i64 0, i32 1, i32 8
  %14 = load i32, i32* %seed19, align 4, !tbaa !18
  %seed21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69, i64 0, i32 1, i32 8
  store i32 %14, i32* %seed21, align 4, !tbaa !18
  %iter23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i68, i64 0, i32 1, i32 9
  %15 = load i32, i32* %iter23, align 4, !tbaa !19
  %iter25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69, i64 0, i32 1, i32 9
  store i32 %15, i32* %iter25, align 4, !tbaa !19
  %n_0 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i68, i64 0, i32 1, i32 0
  %16 = load i32, i32* %n_0, align 4, !tbaa !6
  %n_028 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i69, i64 0, i32 1, i32 0
  store i32 %16, i32* %n_028, align 4, !tbaa !6
  %inc.i65 = add nsw i32 %10, 1
  %cmp16 = icmp ult i32 %15, 100
  br i1 %cmp16, label %while.body17, label %while.cond.backedge

while.body37:                                     ; preds = %while.body37.preheader, %while.body37
  %17 = phi i32 [ %29, %while.body37 ], [ %.pre147, %while.body37.preheader ]
  %18 = phi i32 [ %27, %while.body37 ], [ %6, %while.body37.preheader ]
  %19 = phi i32 [ %inc.i51, %while.body37 ], [ %inc.i78, %while.body37.preheader ]
  %20 = phi i32 [ %28, %while.body37 ], [ %7, %while.body37.preheader ]
  %iter35113 = phi i32* [ %iter45, %while.body37 ], [ %iter7, %while.body37.preheader ]
  %21 = phi %struct.camel_buffer_t* [ %.2.i55, %while.body37 ], [ %.2.i82, %while.body37.preheader ]
  %seed.i56 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i64 0, i32 1, i32 8
  %add.i57 = add i32 %18, 13
  store i32 %add.i57, i32* %seed.i56, align 4, !tbaa !18
  %and.i58 = lshr i32 %18, 1
  %22 = and i32 %and.i58, 1431655765
  %and6.i59 = and i32 %18, 1431655765
  %add7.i = add nuw i32 %22, %and6.i59
  %and10.i = lshr i32 %add7.i, 2
  %23 = and i32 %and10.i, 858993459
  %and13.i = and i32 %add7.i, 858993459
  %add14.i = add nuw nsw i32 %23, %and13.i
  %and17.i = lshr i32 %add14.i, 4
  %24 = and i32 %and17.i, 117901063
  %and20.i = and i32 %add14.i, 117901063
  %add21.i60 = add nuw nsw i32 %24, %and20.i
  %and24.i61 = lshr i32 %add21.i60, 8
  %25 = and i32 %and24.i61, 983055
  %and27.i = and i32 %add21.i60, 983055
  %add28.i = add nuw nsw i32 %25, %and27.i
  %26 = lshr i32 %add28.i, 16
  %and34.i62 = and i32 %add28.i, 31
  %n_1.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i64 0, i32 1, i32 1
  %add35.i = add i32 %and34.i62, %17
  %add38.i = add i32 %add35.i, %26
  store i32 %add38.i, i32* %n_1.i, align 4, !tbaa !11
  %inc.i64 = add nuw nsw i32 %20, 1
  store i32 %inc.i64, i32* %iter35113, align 4, !tbaa !19
  %rem.i52 = srem i32 %19, 2
  %cmp.i53 = icmp eq i32 %rem.i52, 1
  %..i54 = select i1 %cmp.i53, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i55 = select i1 %cmp.i53, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i54, i64 0, i32 1, i32 8
  %27 = load i32, i32* %seed39, align 4, !tbaa !18
  %seed41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i55, i64 0, i32 1, i32 8
  store i32 %27, i32* %seed41, align 4, !tbaa !18
  %iter43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i54, i64 0, i32 1, i32 9
  %28 = load i32, i32* %iter43, align 4, !tbaa !19
  %iter45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i55, i64 0, i32 1, i32 9
  store i32 %28, i32* %iter45, align 4, !tbaa !19
  %n_1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i54, i64 0, i32 1, i32 1
  %29 = load i32, i32* %n_1, align 4, !tbaa !11
  %n_148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i55, i64 0, i32 1, i32 1
  store i32 %29, i32* %n_148, align 4, !tbaa !11
  %inc.i51 = add nsw i32 %19, 1
  %cmp36 = icmp ult i32 %28, 100
  br i1 %cmp36, label %while.body37, label %while.cond.backedge

while.body59:                                     ; preds = %while.body59.preheader, %while.body59
  %30 = phi i32 [ %37, %while.body59 ], [ %.pre146, %while.body59.preheader ]
  %31 = phi i32 [ %35, %while.body59 ], [ %6, %while.body59.preheader ]
  %32 = phi i32 [ %inc.i41, %while.body59 ], [ %inc.i78, %while.body59.preheader ]
  %33 = phi i32 [ %36, %while.body59 ], [ %7, %while.body59.preheader ]
  %iter57109 = phi i32* [ %iter67, %while.body59 ], [ %iter7, %while.body59.preheader ]
  %34 = phi %struct.camel_buffer_t* [ %.2.i45, %while.body59 ], [ %.2.i82, %while.body59.preheader ]
  %seed.i46 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i64 0, i32 1, i32 8
  %call.i = tail call i32 @recursive_cnt(i32 %31) #8
  %n_2.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i64 0, i32 1, i32 2
  %add.i47 = add i32 %30, %call.i
  store i32 %add.i47, i32* %n_2.i, align 4, !tbaa !12
  %add4.i = add i32 %31, 13
  store i32 %add4.i, i32* %seed.i46, align 4, !tbaa !18
  %inc.i49 = add nuw nsw i32 %33, 1
  store i32 %inc.i49, i32* %iter57109, align 4, !tbaa !19
  %rem.i42 = srem i32 %32, 2
  %cmp.i43 = icmp eq i32 %rem.i42, 1
  %..i44 = select i1 %cmp.i43, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i45 = select i1 %cmp.i43, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i44, i64 0, i32 1, i32 8
  %35 = load i32, i32* %seed61, align 4, !tbaa !18
  %seed63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i45, i64 0, i32 1, i32 8
  store i32 %35, i32* %seed63, align 4, !tbaa !18
  %iter65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i44, i64 0, i32 1, i32 9
  %36 = load i32, i32* %iter65, align 4, !tbaa !19
  %iter67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i45, i64 0, i32 1, i32 9
  store i32 %36, i32* %iter67, align 4, !tbaa !19
  %n_2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i44, i64 0, i32 1, i32 2
  %37 = load i32, i32* %n_2, align 4, !tbaa !12
  %n_270 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i45, i64 0, i32 1, i32 2
  store i32 %37, i32* %n_270, align 4, !tbaa !12
  %inc.i41 = add nsw i32 %32, 1
  %cmp58 = icmp ult i32 %36, 100
  br i1 %cmp58, label %while.body59, label %while.cond.backedge

while.body81:                                     ; preds = %while.body81.preheader, %while.body81
  %38 = phi i32 [ %54, %while.body81 ], [ %.pre145, %while.body81.preheader ]
  %39 = phi i32 [ %52, %while.body81 ], [ %6, %while.body81.preheader ]
  %40 = phi i32 [ %inc.i28, %while.body81 ], [ %inc.i78, %while.body81.preheader ]
  %41 = phi i32 [ %53, %while.body81 ], [ %7, %while.body81.preheader ]
  %iter79105 = phi i32* [ %iter89, %while.body81 ], [ %iter7, %while.body81.preheader ]
  %42 = phi %struct.camel_buffer_t* [ %.2.i32, %while.body81 ], [ %.2.i82, %while.body81.preheader ]
  %seed.i33 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i64 0, i32 1, i32 8
  %and.i = and i32 %39, 15
  %idxprom.i34 = zext i32 %and.i to i64
  %arrayidx.i35 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom.i34
  %43 = load i8, i8* %arrayidx.i35, align 1, !tbaa !21
  %conv2.i36 = sext i8 %43 to i32
  %and6.i = lshr i32 %39, 4
  %shr.i37 = and i32 %and6.i, 15
  %idxprom8.i = zext i32 %shr.i37 to i64
  %arrayidx9.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom8.i
  %44 = load i8, i8* %arrayidx9.i, align 1, !tbaa !21
  %conv10.i = sext i8 %44 to i32
  %add.i38 = add nsw i32 %conv10.i, %conv2.i36
  %and14.i = lshr i32 %39, 8
  %shr15.i = and i32 %and14.i, 15
  %idxprom17.i = zext i32 %shr15.i to i64
  %arrayidx18.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom17.i
  %45 = load i8, i8* %arrayidx18.i, align 1, !tbaa !21
  %conv19.i = sext i8 %45 to i32
  %add20.i = add nsw i32 %add.i38, %conv19.i
  %and24.i = lshr i32 %39, 12
  %shr25.i = and i32 %and24.i, 15
  %idxprom27.i = zext i32 %shr25.i to i64
  %arrayidx28.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom27.i
  %46 = load i8, i8* %arrayidx28.i, align 1, !tbaa !21
  %conv29.i = sext i8 %46 to i32
  %add30.i = add nsw i32 %add20.i, %conv29.i
  %and34.i = lshr i32 %39, 16
  %shr35.i = and i32 %and34.i, 15
  %idxprom37.i = zext i32 %shr35.i to i64
  %arrayidx38.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom37.i
  %47 = load i8, i8* %arrayidx38.i, align 1, !tbaa !21
  %conv39.i = sext i8 %47 to i32
  %add40.i = add nsw i32 %add30.i, %conv39.i
  %and44.i = lshr i32 %39, 20
  %shr45.i = and i32 %and44.i, 15
  %idxprom47.i = zext i32 %shr45.i to i64
  %arrayidx48.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom47.i
  %48 = load i8, i8* %arrayidx48.i, align 1, !tbaa !21
  %conv49.i = sext i8 %48 to i32
  %add50.i = add nsw i32 %add40.i, %conv49.i
  %and54.i = lshr i32 %39, 24
  %shr55.i = and i32 %and54.i, 15
  %idxprom57.i = zext i32 %shr55.i to i64
  %arrayidx58.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom57.i
  %49 = load i8, i8* %arrayidx58.i, align 1, !tbaa !21
  %conv59.i = sext i8 %49 to i32
  %add60.i = add nsw i32 %add50.i, %conv59.i
  %50 = lshr i32 %39, 28
  %idxprom67.i = zext i32 %50 to i64
  %arrayidx68.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom67.i
  %51 = load i8, i8* %arrayidx68.i, align 1, !tbaa !21
  %conv69.i = sext i8 %51 to i32
  %add70.i = add nsw i32 %add60.i, %conv69.i
  %n_3.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %42, i64 0, i32 1, i32 3
  %add72.i = add i32 %add70.i, %38
  store i32 %add72.i, i32* %n_3.i, align 4, !tbaa !13
  %add75.i = add i32 %39, 13
  store i32 %add75.i, i32* %seed.i33, align 4, !tbaa !18
  %inc.i40 = add nuw nsw i32 %41, 1
  store i32 %inc.i40, i32* %iter79105, align 4, !tbaa !19
  %rem.i29 = srem i32 %40, 2
  %cmp.i30 = icmp eq i32 %rem.i29, 1
  %..i31 = select i1 %cmp.i30, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i32 = select i1 %cmp.i30, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i31, i64 0, i32 1, i32 8
  %52 = load i32, i32* %seed83, align 4, !tbaa !18
  %seed85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i32, i64 0, i32 1, i32 8
  store i32 %52, i32* %seed85, align 4, !tbaa !18
  %iter87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i31, i64 0, i32 1, i32 9
  %53 = load i32, i32* %iter87, align 4, !tbaa !19
  %iter89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i32, i64 0, i32 1, i32 9
  store i32 %53, i32* %iter89, align 4, !tbaa !19
  %n_3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i31, i64 0, i32 1, i32 3
  %54 = load i32, i32* %n_3, align 4, !tbaa !13
  %n_392 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i32, i64 0, i32 1, i32 3
  store i32 %54, i32* %n_392, align 4, !tbaa !13
  %inc.i28 = add nsw i32 %40, 1
  %cmp80 = icmp ult i32 %53, 100
  br i1 %cmp80, label %while.body81, label %while.cond.backedge

while.body103:                                    ; preds = %while.body103.preheader, %while.body103
  %55 = phi i32 [ %70, %while.body103 ], [ %.pre144, %while.body103.preheader ]
  %56 = phi i32 [ %68, %while.body103 ], [ %6, %while.body103.preheader ]
  %57 = phi i32 [ %inc.i15, %while.body103 ], [ %inc.i78, %while.body103.preheader ]
  %58 = phi i32 [ %69, %while.body103 ], [ %7, %while.body103.preheader ]
  %iter101101 = phi i32* [ %iter111, %while.body103 ], [ %iter7, %while.body103.preheader ]
  %59 = phi %struct.camel_buffer_t* [ %.2.i19, %while.body103 ], [ %.2.i82, %while.body103.preheader ]
  %seed.i20 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i64 0, i32 1, i32 8
  %U.sroa.4.0.extract.shift.i = lshr i32 %56, 8
  %U.sroa.5.0.extract.shift.i = lshr i32 %56, 16
  %60 = lshr i32 %56, 24
  %U.sroa.6.0.extract.trunc.i = zext i32 %60 to i64
  %61 = and i32 %56, 255
  %idxprom.i21 = zext i32 %61 to i64
  %arrayidx1.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom.i21
  %62 = load i8, i8* %arrayidx1.i, align 1, !tbaa !21
  %conv2.i = sext i8 %62 to i32
  %63 = and i32 %U.sroa.4.0.extract.shift.i, 255
  %idxprom5.i = zext i32 %63 to i64
  %arrayidx6.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom5.i
  %64 = load i8, i8* %arrayidx6.i, align 1, !tbaa !21
  %conv7.i = sext i8 %64 to i32
  %add.i22 = add nsw i32 %conv7.i, %conv2.i
  %arrayidx11.i23 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %U.sroa.6.0.extract.trunc.i
  %65 = load i8, i8* %arrayidx11.i23, align 1, !tbaa !21
  %conv12.i24 = sext i8 %65 to i32
  %add13.i25 = add nsw i32 %add.i22, %conv12.i24
  %66 = and i32 %U.sroa.5.0.extract.shift.i, 255
  %idxprom16.i = zext i32 %66 to i64
  %arrayidx17.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom16.i
  %67 = load i8, i8* %arrayidx17.i, align 1, !tbaa !21
  %conv18.i = sext i8 %67 to i32
  %add19.i = add nsw i32 %add13.i25, %conv18.i
  %n_4.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %59, i64 0, i32 1, i32 4
  %add21.i = add i32 %add19.i, %55
  store i32 %add21.i, i32* %n_4.i, align 4, !tbaa !14
  %add24.i = add i32 %56, 13
  store i32 %add24.i, i32* %seed.i20, align 4, !tbaa !18
  %inc.i27 = add nuw nsw i32 %58, 1
  store i32 %inc.i27, i32* %iter101101, align 4, !tbaa !19
  %rem.i16 = srem i32 %57, 2
  %cmp.i17 = icmp eq i32 %rem.i16, 1
  %..i18 = select i1 %cmp.i17, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i19 = select i1 %cmp.i17, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i18, i64 0, i32 1, i32 8
  %68 = load i32, i32* %seed105, align 4, !tbaa !18
  %seed107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i19, i64 0, i32 1, i32 8
  store i32 %68, i32* %seed107, align 4, !tbaa !18
  %iter109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i18, i64 0, i32 1, i32 9
  %69 = load i32, i32* %iter109, align 4, !tbaa !19
  %iter111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i19, i64 0, i32 1, i32 9
  store i32 %69, i32* %iter111, align 4, !tbaa !19
  %n_4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i18, i64 0, i32 1, i32 4
  %70 = load i32, i32* %n_4, align 4, !tbaa !14
  %n_4114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i19, i64 0, i32 1, i32 4
  store i32 %70, i32* %n_4114, align 4, !tbaa !14
  %inc.i15 = add nsw i32 %57, 1
  %cmp102 = icmp ult i32 %69, 100
  br i1 %cmp102, label %while.body103, label %while.cond.backedge

while.body125:                                    ; preds = %while.body125.preheader, %while.body125
  %71 = phi i32 [ %87, %while.body125 ], [ %.pre, %while.body125.preheader ]
  %72 = phi i32 [ %inc.i6, %while.body125 ], [ %inc.i78, %while.body125.preheader ]
  %73 = phi i32 [ %86, %while.body125 ], [ %7, %while.body125.preheader ]
  %iter12397 = phi i32* [ %iter133, %while.body125 ], [ %iter7, %while.body125.preheader ]
  %74 = phi %struct.camel_buffer_t* [ %.2.i10, %while.body125 ], [ %.2.i82, %while.body125.preheader ]
  %seed.i11 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i64 0, i32 1, i32 8
  %75 = bitcast i32* %seed.i11 to i8*
  %incdec.ptr.i = getelementptr inbounds i8, i8* %75, i64 1
  %76 = load i8, i8* %75, align 1, !tbaa !21
  %idxprom.i = zext i8 %76 to i64
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom.i
  %77 = load i8, i8* %arrayidx.i, align 1, !tbaa !21
  %conv.i = sext i8 %77 to i32
  %incdec.ptr1.i = getelementptr inbounds i8, i8* %75, i64 2
  %78 = load i8, i8* %incdec.ptr.i, align 1, !tbaa !21
  %idxprom2.i = zext i8 %78 to i64
  %arrayidx3.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom2.i
  %79 = load i8, i8* %arrayidx3.i, align 1, !tbaa !21
  %conv4.i = sext i8 %79 to i32
  %add.i12 = add nsw i32 %conv4.i, %conv.i
  %incdec.ptr5.i = getelementptr inbounds i8, i8* %75, i64 3
  %80 = load i8, i8* %incdec.ptr1.i, align 1, !tbaa !21
  %idxprom6.i = zext i8 %80 to i64
  %arrayidx7.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom6.i
  %81 = load i8, i8* %arrayidx7.i, align 1, !tbaa !21
  %conv8.i = sext i8 %81 to i32
  %add9.i = add nsw i32 %add.i12, %conv8.i
  %82 = load i8, i8* %incdec.ptr5.i, align 1, !tbaa !21
  %idxprom10.i = zext i8 %82 to i64
  %arrayidx11.i = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %idxprom10.i
  %83 = load i8, i8* %arrayidx11.i, align 1, !tbaa !21
  %conv12.i = sext i8 %83 to i32
  %add13.i = add nsw i32 %add9.i, %conv12.i
  %n_5.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %74, i64 0, i32 1, i32 5
  %add15.i = add i32 %add13.i, %71
  store i32 %add15.i, i32* %n_5.i, align 4, !tbaa !15
  %84 = load i32, i32* %seed.i11, align 4, !tbaa !18
  %add18.i = add i32 %84, 13
  store i32 %add18.i, i32* %seed.i11, align 4, !tbaa !18
  %inc.i14 = add nuw nsw i32 %73, 1
  store i32 %inc.i14, i32* %iter12397, align 4, !tbaa !19
  %rem.i7 = srem i32 %72, 2
  %cmp.i8 = icmp eq i32 %rem.i7, 1
  %..i9 = select i1 %cmp.i8, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i10 = select i1 %cmp.i8, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i9, i64 0, i32 1, i32 8
  %85 = load i32, i32* %seed127, align 4, !tbaa !18
  %seed129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i10, i64 0, i32 1, i32 8
  store i32 %85, i32* %seed129, align 4, !tbaa !18
  %iter131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i9, i64 0, i32 1, i32 9
  %86 = load i32, i32* %iter131, align 4, !tbaa !19
  %iter133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i10, i64 0, i32 1, i32 9
  store i32 %86, i32* %iter133, align 4, !tbaa !19
  %n_5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i9, i64 0, i32 1, i32 5
  %87 = load i32, i32* %n_5, align 4, !tbaa !15
  %n_5136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i10, i64 0, i32 1, i32 5
  store i32 %87, i32* %n_5136, align 4, !tbaa !15
  %inc.i6 = add nsw i32 %72, 1
  %cmp124 = icmp ult i32 %86, 100
  br i1 %cmp124, label %while.body125, label %while.cond.backedge

while.body147:                                    ; preds = %while.cond143.preheader, %task_bit_shifter.exit
  %88 = phi i32 [ %94, %task_bit_shifter.exit ], [ %6, %while.cond143.preheader ]
  %89 = phi i32 [ %inc.i, %task_bit_shifter.exit ], [ %inc.i78, %while.cond143.preheader ]
  %90 = phi i32 [ %95, %task_bit_shifter.exit ], [ %7, %while.cond143.preheader ]
  %iter14594 = phi i32* [ %iter155, %task_bit_shifter.exit ], [ %iter7, %while.cond143.preheader ]
  %91 = phi %struct.camel_buffer_t* [ %.2.i5, %task_bit_shifter.exit ], [ %.2.i82, %while.cond143.preheader ]
  %seed.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i64 0, i32 1, i32 8
  %tobool8.i = icmp eq i32 %88, 0
  br i1 %tobool8.i, label %task_bit_shifter.exit, label %for.body.i

for.body.i:                                       ; preds = %while.body147, %for.body.i
  %tmp_seed.011.i = phi i32 [ %shr.i, %for.body.i ], [ %88, %while.body147 ]
  %nn.010.i = phi i32 [ %add.i, %for.body.i ], [ 0, %while.body147 ]
  %92 = and i32 %tmp_seed.011.i, 1
  %add.i = add nuw nsw i32 %92, %nn.010.i
  %shr.i = lshr i32 %tmp_seed.011.i, 1
  %tobool.i = icmp eq i32 %shr.i, 0
  br i1 %tobool.i, label %task_bit_shifter.exit, label %for.body.i

task_bit_shifter.exit:                            ; preds = %for.body.i, %while.body147
  %nn.0.lcssa.i = phi i32 [ 0, %while.body147 ], [ %add.i, %for.body.i ]
  %n_6.i = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %91, i64 0, i32 1, i32 6
  %93 = load i32, i32* %n_6.i, align 4, !tbaa !16
  %add5.i = add i32 %93, %nn.0.lcssa.i
  store i32 %add5.i, i32* %n_6.i, align 4, !tbaa !16
  %add8.i = add i32 %88, 13
  store i32 %add8.i, i32* %seed.i, align 4, !tbaa !18
  %inc12.i = add i32 %90, 1
  store i32 %inc12.i, i32* %iter14594, align 4, !tbaa !19
  %rem.i2 = srem i32 %89, 2
  %cmp.i3 = icmp eq i32 %rem.i2, 1
  %..i4 = select i1 %cmp.i3, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1)
  %.2.i5 = select i1 %cmp.i3, %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 1), %struct.camel_buffer_t* getelementptr inbounds (%struct.Camel, %struct.Camel* @camel, i64 0, i32 2)
  %seed149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i4, i64 0, i32 1, i32 8
  %94 = load i32, i32* %seed149, align 4, !tbaa !18
  %seed151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i5, i64 0, i32 1, i32 8
  store i32 %94, i32* %seed151, align 4, !tbaa !18
  %iter153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i4, i64 0, i32 1, i32 9
  %95 = load i32, i32* %iter153, align 4, !tbaa !19
  %iter155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i5, i64 0, i32 1, i32 9
  store i32 %95, i32* %iter155, align 4, !tbaa !19
  %n_6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %..i4, i64 0, i32 1, i32 6
  %96 = load i32, i32* %n_6, align 4, !tbaa !16
  %n_6158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %.2.i5, i64 0, i32 1, i32 6
  store i32 %96, i32* %n_6158, align 4, !tbaa !16
  %inc.i = add nsw i32 %89, 1
  %cmp146 = icmp ult i32 %95, 100
  br i1 %cmp146, label %while.body147, label %while.cond.backedge

if.then164:                                       ; preds = %while.cond
  store %struct.camel_buffer_t* %.2.i82, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  store i32 %inc.i78, i32* @global_count, align 4, !tbaa !17
  store %struct.camel_buffer_t* %..i81, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  tail call void @task_done()
  %call165 = tail call i64 @clock() #8
  %sub = sub nsw i64 %call165, %call
  %conv = sitofp i64 %sub to double
  %div = fdiv double %conv, 1.000000e+06
  %call166 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([32 x i8], [32 x i8]* @.str.8, i64 0, i64 0), double %div)
  tail call void @exit(i32 0) #9
  unreachable
}

; Function Attrs: nounwind
declare dso_local i64 @clock() local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }

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
!18 = !{!7, !9, i64 72}
!19 = !{!7, !9, i64 76}
!20 = !{!7, !9, i64 68}
!21 = !{!4, !4, i64 0}
