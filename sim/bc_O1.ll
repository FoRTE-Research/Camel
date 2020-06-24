; ModuleID = 'bc_O1.bc'
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
  tail call void @task_init()
  tail call void @commit()
  %0 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %globals = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %0, i64 0, i32 1
  %1 = bitcast %struct.camel_global_t* %globals to i8*
  %2 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %globals1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %2, i64 0, i32 1
  %3 = bitcast %struct.camel_global_t* %globals1 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 4 dereferenceable(44) %1, i8* nonnull align 4 dereferenceable(44) %3, i64 44, i1 false)
  tail call void @task_commit()
  br label %while.cond

while.cond:                                       ; preds = %while.cond.backedge, %entry
  tail call void @task_select_func()
  tail call void @commit()
  %4 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i64 0, i32 1, i32 8
  %5 = load i32, i32* %seed, align 4, !tbaa !18
  %6 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i64 0, i32 1, i32 8
  store i32 %5, i32* %seed4, align 4, !tbaa !18
  %iter = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i64 0, i32 1, i32 9
  %7 = load i32, i32* %iter, align 4, !tbaa !19
  %iter7 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i64 0, i32 1, i32 9
  store i32 %7, i32* %iter7, align 4, !tbaa !19
  %func = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %4, i64 0, i32 1, i32 7
  %8 = load i32, i32* %func, align 4, !tbaa !20
  %func10 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %6, i64 0, i32 1, i32 7
  store i32 %8, i32* %func10, align 4, !tbaa !20
  tail call void @task_commit()
  %9 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %func12 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %9, i64 0, i32 1, i32 7
  %10 = load i32, i32* %func12, align 4, !tbaa !20
  switch i32 %10, label %while.cond.backedge [
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
  %11 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter1458 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %11, i64 0, i32 1, i32 9
  %12 = load i32, i32* %iter1458, align 4, !tbaa !19
  %cmp1469 = icmp ult i32 %12, 100
  br i1 %cmp1469, label %while.body147, label %while.cond.backedge

while.cond.backedge:                              ; preds = %while.body147, %while.body125, %while.body103, %while.body81, %while.body59, %while.body37, %while.body17, %while.cond143.preheader, %while.cond121.preheader, %while.cond99.preheader, %while.cond77.preheader, %while.cond55.preheader, %while.cond33.preheader, %while.cond13.preheader, %while.cond
  br label %while.cond

while.cond121.preheader:                          ; preds = %while.cond
  %13 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter12310 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %13, i64 0, i32 1, i32 9
  %14 = load i32, i32* %iter12310, align 4, !tbaa !19
  %cmp12411 = icmp ult i32 %14, 100
  br i1 %cmp12411, label %while.body125, label %while.cond.backedge

while.cond99.preheader:                           ; preds = %while.cond
  %15 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter10112 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %15, i64 0, i32 1, i32 9
  %16 = load i32, i32* %iter10112, align 4, !tbaa !19
  %cmp10213 = icmp ult i32 %16, 100
  br i1 %cmp10213, label %while.body103, label %while.cond.backedge

while.cond77.preheader:                           ; preds = %while.cond
  %17 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter7914 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %17, i64 0, i32 1, i32 9
  %18 = load i32, i32* %iter7914, align 4, !tbaa !19
  %cmp8015 = icmp ult i32 %18, 100
  br i1 %cmp8015, label %while.body81, label %while.cond.backedge

while.cond55.preheader:                           ; preds = %while.cond
  %19 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter5716 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %19, i64 0, i32 1, i32 9
  %20 = load i32, i32* %iter5716, align 4, !tbaa !19
  %cmp5817 = icmp ult i32 %20, 100
  br i1 %cmp5817, label %while.body59, label %while.cond.backedge

while.cond33.preheader:                           ; preds = %while.cond
  %21 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter3518 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %21, i64 0, i32 1, i32 9
  %22 = load i32, i32* %iter3518, align 4, !tbaa !19
  %cmp3619 = icmp ult i32 %22, 100
  br i1 %cmp3619, label %while.body37, label %while.cond.backedge

while.cond13.preheader:                           ; preds = %while.cond
  %23 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter1520 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %23, i64 0, i32 1, i32 9
  %24 = load i32, i32* %iter1520, align 4, !tbaa !19
  %cmp1621 = icmp ult i32 %24, 100
  br i1 %cmp1621, label %while.body17, label %while.cond.backedge

while.body17:                                     ; preds = %while.cond13.preheader, %while.body17
  tail call void @task_bit_count()
  tail call void @commit()
  %25 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed19 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i64 0, i32 1, i32 8
  %26 = load i32, i32* %seed19, align 4, !tbaa !18
  %27 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed21 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i64 0, i32 1, i32 8
  store i32 %26, i32* %seed21, align 4, !tbaa !18
  %iter23 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i64 0, i32 1, i32 9
  %28 = load i32, i32* %iter23, align 4, !tbaa !19
  %iter25 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i64 0, i32 1, i32 9
  store i32 %28, i32* %iter25, align 4, !tbaa !19
  %n_0 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %25, i64 0, i32 1, i32 0
  %29 = load i32, i32* %n_0, align 4, !tbaa !6
  %n_028 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %27, i64 0, i32 1, i32 0
  store i32 %29, i32* %n_028, align 4, !tbaa !6
  tail call void @task_commit()
  %30 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter15 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %30, i64 0, i32 1, i32 9
  %31 = load i32, i32* %iter15, align 4, !tbaa !19
  %cmp16 = icmp ult i32 %31, 100
  br i1 %cmp16, label %while.body17, label %while.cond.backedge

while.body37:                                     ; preds = %while.cond33.preheader, %while.body37
  tail call void @task_bitcount()
  tail call void @commit()
  %32 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed39 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i64 0, i32 1, i32 8
  %33 = load i32, i32* %seed39, align 4, !tbaa !18
  %34 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed41 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i64 0, i32 1, i32 8
  store i32 %33, i32* %seed41, align 4, !tbaa !18
  %iter43 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i64 0, i32 1, i32 9
  %35 = load i32, i32* %iter43, align 4, !tbaa !19
  %iter45 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i64 0, i32 1, i32 9
  store i32 %35, i32* %iter45, align 4, !tbaa !19
  %n_1 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %32, i64 0, i32 1, i32 1
  %36 = load i32, i32* %n_1, align 4, !tbaa !11
  %n_148 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %34, i64 0, i32 1, i32 1
  store i32 %36, i32* %n_148, align 4, !tbaa !11
  tail call void @task_commit()
  %37 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter35 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %37, i64 0, i32 1, i32 9
  %38 = load i32, i32* %iter35, align 4, !tbaa !19
  %cmp36 = icmp ult i32 %38, 100
  br i1 %cmp36, label %while.body37, label %while.cond.backedge

while.body59:                                     ; preds = %while.cond55.preheader, %while.body59
  tail call void @task_ntbl_bitcnt()
  tail call void @commit()
  %39 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed61 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i64 0, i32 1, i32 8
  %40 = load i32, i32* %seed61, align 4, !tbaa !18
  %41 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed63 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i64 0, i32 1, i32 8
  store i32 %40, i32* %seed63, align 4, !tbaa !18
  %iter65 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i64 0, i32 1, i32 9
  %42 = load i32, i32* %iter65, align 4, !tbaa !19
  %iter67 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i64 0, i32 1, i32 9
  store i32 %42, i32* %iter67, align 4, !tbaa !19
  %n_2 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %39, i64 0, i32 1, i32 2
  %43 = load i32, i32* %n_2, align 4, !tbaa !12
  %n_270 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %41, i64 0, i32 1, i32 2
  store i32 %43, i32* %n_270, align 4, !tbaa !12
  tail call void @task_commit()
  %44 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter57 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %44, i64 0, i32 1, i32 9
  %45 = load i32, i32* %iter57, align 4, !tbaa !19
  %cmp58 = icmp ult i32 %45, 100
  br i1 %cmp58, label %while.body59, label %while.cond.backedge

while.body81:                                     ; preds = %while.cond77.preheader, %while.body81
  tail call void @task_ntbl_bitcount()
  tail call void @commit()
  %46 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed83 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i64 0, i32 1, i32 8
  %47 = load i32, i32* %seed83, align 4, !tbaa !18
  %48 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed85 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i64 0, i32 1, i32 8
  store i32 %47, i32* %seed85, align 4, !tbaa !18
  %iter87 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i64 0, i32 1, i32 9
  %49 = load i32, i32* %iter87, align 4, !tbaa !19
  %iter89 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i64 0, i32 1, i32 9
  store i32 %49, i32* %iter89, align 4, !tbaa !19
  %n_3 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %46, i64 0, i32 1, i32 3
  %50 = load i32, i32* %n_3, align 4, !tbaa !13
  %n_392 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %48, i64 0, i32 1, i32 3
  store i32 %50, i32* %n_392, align 4, !tbaa !13
  tail call void @task_commit()
  %51 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter79 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %51, i64 0, i32 1, i32 9
  %52 = load i32, i32* %iter79, align 4, !tbaa !19
  %cmp80 = icmp ult i32 %52, 100
  br i1 %cmp80, label %while.body81, label %while.cond.backedge

while.body103:                                    ; preds = %while.cond99.preheader, %while.body103
  tail call void @task_BW_btbl_bitcount()
  tail call void @commit()
  %53 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed105 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i64 0, i32 1, i32 8
  %54 = load i32, i32* %seed105, align 4, !tbaa !18
  %55 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed107 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i64 0, i32 1, i32 8
  store i32 %54, i32* %seed107, align 4, !tbaa !18
  %iter109 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i64 0, i32 1, i32 9
  %56 = load i32, i32* %iter109, align 4, !tbaa !19
  %iter111 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i64 0, i32 1, i32 9
  store i32 %56, i32* %iter111, align 4, !tbaa !19
  %n_4 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %53, i64 0, i32 1, i32 4
  %57 = load i32, i32* %n_4, align 4, !tbaa !14
  %n_4114 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %55, i64 0, i32 1, i32 4
  store i32 %57, i32* %n_4114, align 4, !tbaa !14
  tail call void @task_commit()
  %58 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter101 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %58, i64 0, i32 1, i32 9
  %59 = load i32, i32* %iter101, align 4, !tbaa !19
  %cmp102 = icmp ult i32 %59, 100
  br i1 %cmp102, label %while.body103, label %while.cond.backedge

while.body125:                                    ; preds = %while.cond121.preheader, %while.body125
  tail call void @task_AR_btbl_bitcount()
  tail call void @commit()
  %60 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed127 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i64 0, i32 1, i32 8
  %61 = load i32, i32* %seed127, align 4, !tbaa !18
  %62 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed129 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i64 0, i32 1, i32 8
  store i32 %61, i32* %seed129, align 4, !tbaa !18
  %iter131 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i64 0, i32 1, i32 9
  %63 = load i32, i32* %iter131, align 4, !tbaa !19
  %iter133 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i64 0, i32 1, i32 9
  store i32 %63, i32* %iter133, align 4, !tbaa !19
  %n_5 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %60, i64 0, i32 1, i32 5
  %64 = load i32, i32* %n_5, align 4, !tbaa !15
  %n_5136 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %62, i64 0, i32 1, i32 5
  store i32 %64, i32* %n_5136, align 4, !tbaa !15
  tail call void @task_commit()
  %65 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter123 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %65, i64 0, i32 1, i32 9
  %66 = load i32, i32* %iter123, align 4, !tbaa !19
  %cmp124 = icmp ult i32 %66, 100
  br i1 %cmp124, label %while.body125, label %while.cond.backedge

while.body147:                                    ; preds = %while.cond143.preheader, %while.body147
  tail call void @task_bit_shifter()
  tail call void @commit()
  %67 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @safe, align 8, !tbaa !2
  %seed149 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i64 0, i32 1, i32 8
  %68 = load i32, i32* %seed149, align 4, !tbaa !18
  %69 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %seed151 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i64 0, i32 1, i32 8
  store i32 %68, i32* %seed151, align 4, !tbaa !18
  %iter153 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i64 0, i32 1, i32 9
  %70 = load i32, i32* %iter153, align 4, !tbaa !19
  %iter155 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i64 0, i32 1, i32 9
  store i32 %70, i32* %iter155, align 4, !tbaa !19
  %n_6 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %67, i64 0, i32 1, i32 6
  %71 = load i32, i32* %n_6, align 4, !tbaa !16
  %n_6158 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %69, i64 0, i32 1, i32 6
  store i32 %71, i32* %n_6158, align 4, !tbaa !16
  tail call void @task_commit()
  %72 = load %struct.camel_buffer_t*, %struct.camel_buffer_t** @unsafe, align 8, !tbaa !2
  %iter145 = getelementptr inbounds %struct.camel_buffer_t, %struct.camel_buffer_t* %72, i64 0, i32 1, i32 9
  %73 = load i32, i32* %iter145, align 4, !tbaa !19
  %cmp146 = icmp ult i32 %73, 100
  br i1 %cmp146, label %while.body147, label %while.cond.backedge

if.then164:                                       ; preds = %while.cond
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
