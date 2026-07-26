; ModuleID = 'c/src/sort.c'
source_filename = "c/src/sort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.SortQuickData = type { %struct.SortBaseData, ptr }
%struct.SortBaseData = type { i64, ptr, i32 }
%struct.SortMergeData = type { %struct.SortBaseData, ptr }
%struct.SortSelfData = type { %struct.SortBaseData, ptr }

@.str = private unnamed_addr constant [12 x i8] c"Sort::Quick\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"Sort::Merge\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Sort::Self\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"size\00", align 1

define dso_local void @SortQuick_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  call void @sort_base_prepare(ptr noundef %7, ptr noundef @.str)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.SortQuickData, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  ret void
}

define internal void @sort_base_prepare(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = call i64 @Helper_config_i64(ptr noundef %10, ptr noundef @.str.3)
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.SortBaseData, ptr %12, i32 0, i32 0
  store i64 %11, ptr %13, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.SortBaseData, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = icmp sle i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %2
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.SortBaseData, ptr %19, i32 0, i32 0
  store i64 100000, ptr %20, align 8
  br label %21

21:                                               ; preds = %18, %2
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.SortBaseData, ptr %22, i32 0, i32 0
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 4
  %26 = call noalias ptr @malloc(i64 noundef %25)
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.SortBaseData, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  store i64 0, ptr %6, align 8
  br label %29

29:                                               ; preds = %42, %21
  %30 = load i64, ptr %6, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.SortBaseData, ptr %31, i32 0, i32 0
  %33 = load i64, ptr %32, align 8
  %34 = icmp slt i64 %30, %33
  br i1 %34, label %35, label %45

35:                                               ; preds = %29
  %36 = call i32 @Helper_next_int(i32 noundef 1000000)
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.SortBaseData, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load i64, ptr %6, align 8
  %41 = getelementptr inbounds i32, ptr %39, i64 %40
  store i32 %36, ptr %41, align 4
  br label %42

42:                                               ; preds = %35
  %43 = load i64, ptr %6, align 8
  %44 = add nsw i64 %43, 1
  store i64 %44, ptr %6, align 8
  br label %29, !llvm.loop !6

45:                                               ; preds = %29
  %46 = load ptr, ptr %5, align 8
  %47 = getelementptr inbounds nuw %struct.SortBaseData, ptr %46, i32 0, i32 2
  store i32 0, ptr %47, align 8
  ret void
}

define dso_local void @SortQuick_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  call void @sort_quick_test(ptr noundef %13)
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.SortQuickData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.SortBaseData, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  %19 = call i32 @Helper_next_int(i32 noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.SortQuickData, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds nuw %struct.SortBaseData, ptr %21, i32 0, i32 0
  %23 = load i64, ptr %22, align 8
  %24 = trunc i64 %23 to i32
  %25 = call i32 @Helper_next_int(i32 noundef %24)
  store i32 %25, ptr %7, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.SortQuickData, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds nuw %struct.SortBaseData, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.SortQuickData, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = add i32 %33, %40
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds nuw %struct.SortQuickData, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds nuw %struct.SortBaseData, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 8
  %47 = add i32 %46, %42
  store i32 %47, ptr %45, align 8
  ret void
}

define internal void @sort_quick_test(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SortQuickData, ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.SortQuickData, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  br label %11

11:                                               ; preds = %7, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.SortQuickData, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds nuw %struct.SortBaseData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16)
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.SortQuickData, ptr %18, i32 0, i32 1
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.SortQuickData, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.SortQuickData, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds nuw %struct.SortBaseData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.SortQuickData, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds nuw %struct.SortBaseData, ptr %28, i32 0, i32 0
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %26, i64 %31, i1 false)
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds nuw %struct.SortQuickData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.SortQuickData, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds nuw %struct.SortBaseData, ptr %36, i32 0, i32 0
  %38 = load i64, ptr %37, align 8
  %39 = sub nsw i64 %38, 1
  call void @sort_quick_quick_sort(ptr noundef %34, i64 noundef 0, i64 noundef %39)
  ret void
}

declare i32 @Helper_next_int(i32 noundef)

define dso_local i32 @SortQuick_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortQuickData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.SortBaseData, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @SortQuick_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortQuickData, ptr %7, i32 0, i32 0
  call void @sort_base_cleanup(ptr noundef %8)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.SortQuickData, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.SortQuickData, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.SortQuickData, ptr %17, i32 0, i32 1
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %13, %1
  ret void
}

define internal void @sort_base_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SortBaseData, ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.SortBaseData, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.SortBaseData, ptr %11, i32 0, i32 1
  store ptr null, ptr %12, align 8
  br label %13

13:                                               ; preds = %7, %1
  ret void
}

declare void @free(ptr noundef)

define dso_local ptr @SortQuick_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 32, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @SortQuick_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @SortQuick_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @SortQuick_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @SortQuick_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define dso_local void @SortMerge_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  call void @sort_base_prepare(ptr noundef %7, ptr noundef @.str.1)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.SortMergeData, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  ret void
}

define dso_local void @SortMerge_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  call void @sort_merge_test(ptr noundef %13)
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.SortMergeData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.SortBaseData, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  %19 = call i32 @Helper_next_int(i32 noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.SortMergeData, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds nuw %struct.SortBaseData, ptr %21, i32 0, i32 0
  %23 = load i64, ptr %22, align 8
  %24 = trunc i64 %23 to i32
  %25 = call i32 @Helper_next_int(i32 noundef %24)
  store i32 %25, ptr %7, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.SortMergeData, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds nuw %struct.SortBaseData, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.SortMergeData, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = add i32 %33, %40
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds nuw %struct.SortMergeData, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds nuw %struct.SortBaseData, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 8
  %47 = add i32 %46, %42
  store i32 %47, ptr %45, align 8
  ret void
}

define internal void @sort_merge_test(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SortMergeData, ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.SortMergeData, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  br label %11

11:                                               ; preds = %7, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.SortMergeData, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds nuw %struct.SortBaseData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16)
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.SortMergeData, ptr %18, i32 0, i32 1
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.SortMergeData, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.SortMergeData, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds nuw %struct.SortBaseData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.SortMergeData, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds nuw %struct.SortBaseData, ptr %28, i32 0, i32 0
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %26, i64 %31, i1 false)
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds nuw %struct.SortMergeData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.SortMergeData, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds nuw %struct.SortBaseData, ptr %36, i32 0, i32 0
  %38 = load i64, ptr %37, align 8
  call void @sort_merge_merge_sort_inplace(ptr noundef %34, i64 noundef %38)
  ret void
}

define dso_local i32 @SortMerge_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortMergeData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.SortBaseData, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @SortMerge_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortMergeData, ptr %7, i32 0, i32 0
  call void @sort_base_cleanup(ptr noundef %8)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.SortMergeData, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.SortMergeData, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.SortMergeData, ptr %17, i32 0, i32 1
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %13, %1
  ret void
}

define dso_local ptr @SortMerge_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 32, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @SortMerge_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @SortMerge_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @SortMerge_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @SortMerge_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define dso_local void @SortSelf_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  call void @sort_base_prepare(ptr noundef %7, ptr noundef @.str.2)
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.SortSelfData, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  ret void
}

define dso_local void @SortSelf_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  call void @sort_self_test(ptr noundef %13)
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.SortSelfData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.SortBaseData, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  %19 = call i32 @Helper_next_int(i32 noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.SortSelfData, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds nuw %struct.SortBaseData, ptr %21, i32 0, i32 0
  %23 = load i64, ptr %22, align 8
  %24 = trunc i64 %23 to i32
  %25 = call i32 @Helper_next_int(i32 noundef %24)
  store i32 %25, ptr %7, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.SortSelfData, ptr %26, i32 0, i32 0
  %28 = getelementptr inbounds nuw %struct.SortBaseData, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load i32, ptr %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, ptr %29, i64 %31
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.SortSelfData, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load i32, ptr %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, ptr %36, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = add i32 %33, %40
  store i32 %41, ptr %8, align 4
  %42 = load i32, ptr %8, align 4
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds nuw %struct.SortSelfData, ptr %43, i32 0, i32 0
  %45 = getelementptr inbounds nuw %struct.SortBaseData, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 8
  %47 = add i32 %46, %42
  store i32 %47, ptr %45, align 8
  ret void
}

define internal void @sort_self_test(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.SortSelfData, ptr %3, i32 0, i32 1
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.SortSelfData, ptr %8, i32 0, i32 1
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  br label %11

11:                                               ; preds = %7, %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.SortSelfData, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds nuw %struct.SortBaseData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = mul i64 %15, 4
  %17 = call noalias ptr @malloc(i64 noundef %16)
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.SortSelfData, ptr %18, i32 0, i32 1
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.SortSelfData, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.SortSelfData, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds nuw %struct.SortBaseData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.SortSelfData, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds nuw %struct.SortBaseData, ptr %28, i32 0, i32 0
  %30 = load i64, ptr %29, align 8
  %31 = mul i64 %30, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %22, ptr align 4 %26, i64 %31, i1 false)
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds nuw %struct.SortSelfData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.SortSelfData, ptr %35, i32 0, i32 0
  %37 = getelementptr inbounds nuw %struct.SortBaseData, ptr %36, i32 0, i32 0
  %38 = load i64, ptr %37, align 8
  call void @qsort(ptr noundef %34, i64 noundef %38, i64 noundef 4, ptr noundef @sort_self_compare)
  ret void
}

define dso_local i32 @SortSelf_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortSelfData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.SortBaseData, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @SortSelf_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SortSelfData, ptr %7, i32 0, i32 0
  call void @sort_base_cleanup(ptr noundef %8)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.SortSelfData, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.SortSelfData, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.SortSelfData, ptr %17, i32 0, i32 1
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %13, %1
  ret void
}

define dso_local ptr @SortSelf_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 32, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @SortSelf_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @SortSelf_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @SortSelf_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @SortSelf_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal void @sort_quick_quick_sort(ptr noundef %0, i64 noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %11 = load i64, ptr %5, align 8
  %12 = load i64, ptr %6, align 8
  %13 = icmp sge i64 %11, %12
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  br label %83

15:                                               ; preds = %3
  %16 = load ptr, ptr %4, align 8
  %17 = load i64, ptr %5, align 8
  %18 = load i64, ptr %6, align 8
  %19 = add nsw i64 %17, %18
  %20 = sdiv i64 %19, 2
  %21 = getelementptr inbounds i32, ptr %16, i64 %20
  %22 = load i32, ptr %21, align 4
  store i32 %22, ptr %7, align 4
  %23 = load i64, ptr %5, align 8
  store i64 %23, ptr %8, align 8
  %24 = load i64, ptr %6, align 8
  store i64 %24, ptr %9, align 8
  br label %25

25:                                               ; preds = %75, %15
  %26 = load i64, ptr %8, align 8
  %27 = load i64, ptr %9, align 8
  %28 = icmp sle i64 %26, %27
  br i1 %28, label %29, label %76

29:                                               ; preds = %25
  br label %30

30:                                               ; preds = %37, %29
  %31 = load ptr, ptr %4, align 8
  %32 = load i64, ptr %8, align 8
  %33 = getelementptr inbounds i32, ptr %31, i64 %32
  %34 = load i32, ptr %33, align 4
  %35 = load i32, ptr %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %30
  %38 = load i64, ptr %8, align 8
  %39 = add nsw i64 %38, 1
  store i64 %39, ptr %8, align 8
  br label %30, !llvm.loop !8

40:                                               ; preds = %30
  br label %41

41:                                               ; preds = %48, %40
  %42 = load ptr, ptr %4, align 8
  %43 = load i64, ptr %9, align 8
  %44 = getelementptr inbounds i32, ptr %42, i64 %43
  %45 = load i32, ptr %44, align 4
  %46 = load i32, ptr %7, align 4
  %47 = icmp sgt i32 %45, %46
  br i1 %47, label %48, label %51

48:                                               ; preds = %41
  %49 = load i64, ptr %9, align 8
  %50 = add nsw i64 %49, -1
  store i64 %50, ptr %9, align 8
  br label %41, !llvm.loop !9

51:                                               ; preds = %41
  %52 = load i64, ptr %8, align 8
  %53 = load i64, ptr %9, align 8
  %54 = icmp sle i64 %52, %53
  br i1 %54, label %55, label %75

55:                                               ; preds = %51
  %56 = load ptr, ptr %4, align 8
  %57 = load i64, ptr %8, align 8
  %58 = getelementptr inbounds i32, ptr %56, i64 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %10, align 4
  %60 = load ptr, ptr %4, align 8
  %61 = load i64, ptr %9, align 8
  %62 = getelementptr inbounds i32, ptr %60, i64 %61
  %63 = load i32, ptr %62, align 4
  %64 = load ptr, ptr %4, align 8
  %65 = load i64, ptr %8, align 8
  %66 = getelementptr inbounds i32, ptr %64, i64 %65
  store i32 %63, ptr %66, align 4
  %67 = load i32, ptr %10, align 4
  %68 = load ptr, ptr %4, align 8
  %69 = load i64, ptr %9, align 8
  %70 = getelementptr inbounds i32, ptr %68, i64 %69
  store i32 %67, ptr %70, align 4
  %71 = load i64, ptr %8, align 8
  %72 = add nsw i64 %71, 1
  store i64 %72, ptr %8, align 8
  %73 = load i64, ptr %9, align 8
  %74 = add nsw i64 %73, -1
  store i64 %74, ptr %9, align 8
  br label %75

75:                                               ; preds = %55, %51
  br label %25, !llvm.loop !10

76:                                               ; preds = %25
  %77 = load ptr, ptr %4, align 8
  %78 = load i64, ptr %5, align 8
  %79 = load i64, ptr %9, align 8
  call void @sort_quick_quick_sort(ptr noundef %77, i64 noundef %78, i64 noundef %79)
  %80 = load ptr, ptr %4, align 8
  %81 = load i64, ptr %8, align 8
  %82 = load i64, ptr %6, align 8
  call void @sort_quick_quick_sort(ptr noundef %80, i64 noundef %81, i64 noundef %82)
  br label %83

83:                                               ; preds = %76, %14
  ret void
}

define internal void @sort_merge_merge_sort_inplace(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load i64, ptr %4, align 8
  %7 = mul i64 %6, 4
  %8 = call noalias ptr @malloc(i64 noundef %7)
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %4, align 8
  %12 = sub nsw i64 %11, 1
  call void @sort_merge_merge_sort_helper(ptr noundef %9, ptr noundef %10, i64 noundef 0, i64 noundef %12)
  %13 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %13)
  ret void
}

define internal void @sort_merge_merge_sort_helper(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %10 = load i64, ptr %7, align 8
  %11 = load i64, ptr %8, align 8
  %12 = icmp sge i64 %10, %11
  br i1 %12, label %13, label %14

13:                                               ; preds = %4
  br label %33

14:                                               ; preds = %4
  %15 = load i64, ptr %7, align 8
  %16 = load i64, ptr %8, align 8
  %17 = add nsw i64 %15, %16
  %18 = sdiv i64 %17, 2
  store i64 %18, ptr %9, align 8
  %19 = load ptr, ptr %5, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = load i64, ptr %7, align 8
  %22 = load i64, ptr %9, align 8
  call void @sort_merge_merge_sort_helper(ptr noundef %19, ptr noundef %20, i64 noundef %21, i64 noundef %22)
  %23 = load ptr, ptr %5, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = load i64, ptr %9, align 8
  %26 = add nsw i64 %25, 1
  %27 = load i64, ptr %8, align 8
  call void @sort_merge_merge_sort_helper(ptr noundef %23, ptr noundef %24, i64 noundef %26, i64 noundef %27)
  %28 = load ptr, ptr %5, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = load i64, ptr %7, align 8
  %31 = load i64, ptr %9, align 8
  %32 = load i64, ptr %8, align 8
  call void @sort_merge_merge(ptr noundef %28, ptr noundef %29, i64 noundef %30, i64 noundef %31, i64 noundef %32)
  br label %33

33:                                               ; preds = %14, %13
  ret void
}

define internal void @sort_merge_merge(ptr noundef %0, ptr noundef %1, i64 noundef %2, i64 noundef %3, i64 noundef %4) {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store i64 %2, ptr %8, align 8
  store i64 %3, ptr %9, align 8
  store i64 %4, ptr %10, align 8
  %15 = load i64, ptr %8, align 8
  store i64 %15, ptr %11, align 8
  br label %16

16:                                               ; preds = %28, %5
  %17 = load i64, ptr %11, align 8
  %18 = load i64, ptr %10, align 8
  %19 = icmp sle i64 %17, %18
  br i1 %19, label %20, label %31

20:                                               ; preds = %16
  %21 = load ptr, ptr %6, align 8
  %22 = load i64, ptr %11, align 8
  %23 = getelementptr inbounds i32, ptr %21, i64 %22
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %7, align 8
  %26 = load i64, ptr %11, align 8
  %27 = getelementptr inbounds i32, ptr %25, i64 %26
  store i32 %24, ptr %27, align 4
  br label %28

28:                                               ; preds = %20
  %29 = load i64, ptr %11, align 8
  %30 = add nsw i64 %29, 1
  store i64 %30, ptr %11, align 8
  br label %16, !llvm.loop !11

31:                                               ; preds = %16
  %32 = load i64, ptr %8, align 8
  store i64 %32, ptr %12, align 8
  %33 = load i64, ptr %9, align 8
  %34 = add nsw i64 %33, 1
  store i64 %34, ptr %13, align 8
  %35 = load i64, ptr %8, align 8
  store i64 %35, ptr %14, align 8
  br label %36

36:                                               ; preds = %76, %31
  %37 = load i64, ptr %12, align 8
  %38 = load i64, ptr %9, align 8
  %39 = icmp sle i64 %37, %38
  br i1 %39, label %40, label %44

40:                                               ; preds = %36
  %41 = load i64, ptr %13, align 8
  %42 = load i64, ptr %10, align 8
  %43 = icmp sle i64 %41, %42
  br label %44

44:                                               ; preds = %40, %36
  %45 = phi i1 [ false, %36 ], [ %43, %40 ]
  br i1 %45, label %46, label %79

46:                                               ; preds = %44
  %47 = load ptr, ptr %7, align 8
  %48 = load i64, ptr %12, align 8
  %49 = getelementptr inbounds i32, ptr %47, i64 %48
  %50 = load i32, ptr %49, align 4
  %51 = load ptr, ptr %7, align 8
  %52 = load i64, ptr %13, align 8
  %53 = getelementptr inbounds i32, ptr %51, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = icmp sle i32 %50, %54
  br i1 %55, label %56, label %66

56:                                               ; preds = %46
  %57 = load ptr, ptr %7, align 8
  %58 = load i64, ptr %12, align 8
  %59 = getelementptr inbounds i32, ptr %57, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load ptr, ptr %6, align 8
  %62 = load i64, ptr %14, align 8
  %63 = getelementptr inbounds i32, ptr %61, i64 %62
  store i32 %60, ptr %63, align 4
  %64 = load i64, ptr %12, align 8
  %65 = add nsw i64 %64, 1
  store i64 %65, ptr %12, align 8
  br label %76

66:                                               ; preds = %46
  %67 = load ptr, ptr %7, align 8
  %68 = load i64, ptr %13, align 8
  %69 = getelementptr inbounds i32, ptr %67, i64 %68
  %70 = load i32, ptr %69, align 4
  %71 = load ptr, ptr %6, align 8
  %72 = load i64, ptr %14, align 8
  %73 = getelementptr inbounds i32, ptr %71, i64 %72
  store i32 %70, ptr %73, align 4
  %74 = load i64, ptr %13, align 8
  %75 = add nsw i64 %74, 1
  store i64 %75, ptr %13, align 8
  br label %76

76:                                               ; preds = %66, %56
  %77 = load i64, ptr %14, align 8
  %78 = add nsw i64 %77, 1
  store i64 %78, ptr %14, align 8
  br label %36, !llvm.loop !12

79:                                               ; preds = %44
  br label %80

80:                                               ; preds = %84, %79
  %81 = load i64, ptr %12, align 8
  %82 = load i64, ptr %9, align 8
  %83 = icmp sle i64 %81, %82
  br i1 %83, label %84, label %96

84:                                               ; preds = %80
  %85 = load ptr, ptr %7, align 8
  %86 = load i64, ptr %12, align 8
  %87 = getelementptr inbounds i32, ptr %85, i64 %86
  %88 = load i32, ptr %87, align 4
  %89 = load ptr, ptr %6, align 8
  %90 = load i64, ptr %14, align 8
  %91 = getelementptr inbounds i32, ptr %89, i64 %90
  store i32 %88, ptr %91, align 4
  %92 = load i64, ptr %12, align 8
  %93 = add nsw i64 %92, 1
  store i64 %93, ptr %12, align 8
  %94 = load i64, ptr %14, align 8
  %95 = add nsw i64 %94, 1
  store i64 %95, ptr %14, align 8
  br label %80, !llvm.loop !13

96:                                               ; preds = %80
  ret void
}

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef)

define internal i32 @sort_self_compare(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load i32, ptr %7, align 4
  store i32 %8, ptr %5, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = load i32, ptr %9, align 4
  store i32 %10, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %6, align 4
  %13 = icmp sgt i32 %11, %12
  %14 = zext i1 %13 to i32
  %15 = load i32, ptr %5, align 4
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %15, %16
  %18 = zext i1 %17 to i32
  %19 = sub nsw i32 %14, %18
  ret i32 %19
}


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
