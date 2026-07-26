; ModuleID = 'c/src/binarytrees.c'
source_filename = "c/src/binarytrees.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BinarytreesObjData = type { i64, i32 }
%struct.BinarytreesObj_TreeNode = type { ptr, ptr, i32 }
%struct.BinarytreesArenaData = type { i64, i32, ptr }
%struct.BinarytreesArena_Arena = type { ptr, i64, i64 }
%struct.BinarytreesArena_Node = type { i32, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"depth\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"Binarytrees::Obj\00", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Binarytrees::Arena\00", align 1

define dso_local void @BinarytreesObj_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %13, i32 0, i32 1
  store i32 0, ptr %14, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @BinarytreesObj_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %11, i32 0, i32 0
  %13 = load i64, ptr %12, align 8
  %14 = trunc i64 %13 to i32
  %15 = call ptr @BinarytreesObj_TreeNode_new(i32 noundef 0, i32 noundef %14)
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = call i32 @BinarytreesObj_TreeNode_sum(ptr noundef %16)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 8
  %21 = add i32 %20, %17
  store i32 %21, ptr %19, align 8
  %22 = load ptr, ptr %6, align 8
  call void @BinarytreesObj_TreeNode_free(ptr noundef %22)
  ret void
}

define internal ptr @BinarytreesObj_TreeNode_new(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %7 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %7, ptr %5, align 8
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %9, i32 0, i32 2
  store i32 %8, ptr %10, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %11, i32 0, i32 0
  store ptr null, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %13, i32 0, i32 1
  store ptr null, ptr %14, align 8
  %15 = load i32, ptr %4, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %37

17:                                               ; preds = %2
  %18 = load i32, ptr %4, align 4
  %19 = sub nsw i32 %18, 1
  %20 = shl i32 1, %19
  store i32 %20, ptr %6, align 4
  %21 = load i32, ptr %3, align 4
  %22 = load i32, ptr %6, align 4
  %23 = sub nsw i32 %21, %22
  %24 = load i32, ptr %4, align 4
  %25 = sub nsw i32 %24, 1
  %26 = call ptr @BinarytreesObj_TreeNode_new(i32 noundef %23, i32 noundef %25)
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %27, i32 0, i32 0
  store ptr %26, ptr %28, align 8
  %29 = load i32, ptr %3, align 4
  %30 = load i32, ptr %6, align 4
  %31 = add nsw i32 %29, %30
  %32 = load i32, ptr %4, align 4
  %33 = sub nsw i32 %32, 1
  %34 = call ptr @BinarytreesObj_TreeNode_new(i32 noundef %31, i32 noundef %33)
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %35, i32 0, i32 1
  store ptr %34, ptr %36, align 8
  br label %37

37:                                               ; preds = %17, %2
  %38 = load ptr, ptr %5, align 8
  ret ptr %38
}

define internal i32 @BinarytreesObj_TreeNode_sum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %4, i32 0, i32 2
  %6 = load i32, ptr %5, align 8
  %7 = add i32 %6, 1
  store i32 %7, ptr %3, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %19

12:                                               ; preds = %1
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @BinarytreesObj_TreeNode_sum(ptr noundef %15)
  %17 = load i32, ptr %3, align 4
  %18 = add i32 %17, %16
  store i32 %18, ptr %3, align 4
  br label %19

19:                                               ; preds = %12, %1
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %31

24:                                               ; preds = %19
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = call i32 @BinarytreesObj_TreeNode_sum(ptr noundef %27)
  %29 = load i32, ptr %3, align 4
  %30 = add i32 %29, %28
  store i32 %30, ptr %3, align 4
  br label %31

31:                                               ; preds = %24, %19
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

define internal void @BinarytreesObj_TreeNode_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  br label %14

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  call void @BinarytreesObj_TreeNode_free(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.BinarytreesObj_TreeNode, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  call void @BinarytreesObj_TreeNode_free(ptr noundef %12)
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  br label %14

14:                                               ; preds = %6, %5
  ret void
}

define dso_local i32 @BinarytreesObj_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @BinarytreesObj_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %18

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %18

11:                                               ; preds = %6
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 11
  store ptr null, ptr %17, align 8
  br label %18

18:                                               ; preds = %11, %6, %1
  ret void
}

declare void @free(ptr noundef)

define dso_local ptr @BinarytreesObj_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %31

8:                                                ; preds = %0
  %9 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %31

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %15, i32 0, i32 0
  store i64 0, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.BinarytreesObjData, ptr %17, i32 0, i32 1
  store i32 0, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 11
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 3
  store ptr @BinarytreesObj_prepare, ptr %23, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 4
  store ptr @BinarytreesObj_run, ptr %25, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.Benchmark, ptr %26, i32 0, i32 7
  store ptr @BinarytreesObj_checksum, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.Benchmark, ptr %28, i32 0, i32 10
  store ptr @BinarytreesObj_cleanup, ptr %29, align 8
  %30 = load ptr, ptr %2, align 8
  store ptr %30, ptr %1, align 8
  br label %31

31:                                               ; preds = %14, %12, %7
  %32 = load ptr, ptr %1, align 8
  ret ptr %32
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define dso_local void @BinarytreesArena_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %6, %1
  br label %24

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 11
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %3, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = call i64 @Helper_config_i64(ptr noundef %18, ptr noundef @.str)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %20, i32 0, i32 0
  store i64 %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %22, i32 0, i32 1
  store i32 0, ptr %23, align 8
  br label %24

24:                                               ; preds = %12, %11
  ret void
}

define dso_local void @BinarytreesArena_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %15

10:                                               ; preds = %2
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 11
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %16, label %15

15:                                               ; preds = %10, %2
  br label %49

16:                                               ; preds = %10
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 11
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %5, align 8
  %20 = call ptr @BinarytreesArena_Arena_new()
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %21, i32 0, i32 2
  store ptr %20, ptr %22, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %23, i32 0, i32 2
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %26, i32 0, i32 0
  %28 = load i64, ptr %27, align 8
  %29 = trunc i64 %28 to i32
  %30 = call i32 @BinarytreesArena_build_tree(ptr noundef %25, i32 noundef 0, i32 noundef %29)
  store i32 %30, ptr %6, align 4
  %31 = load i32, ptr %6, align 4
  %32 = icmp sge i32 %31, 0
  br i1 %32, label %33, label %43

33:                                               ; preds = %16
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %35, align 8
  %37 = load i32, ptr %6, align 4
  %38 = call i32 @BinarytreesArena_sum(ptr noundef %36, i32 noundef %37)
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 8
  %42 = add i32 %41, %38
  store i32 %42, ptr %40, align 8
  br label %43

43:                                               ; preds = %33, %16
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %44, i32 0, i32 2
  %46 = load ptr, ptr %45, align 8
  call void @BinarytreesArena_Arena_free(ptr noundef %46)
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %47, i32 0, i32 2
  store ptr null, ptr %48, align 8
  br label %49

49:                                               ; preds = %43, %15
  ret void
}

define internal ptr @BinarytreesArena_Arena_new() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %15

7:                                                ; preds = %0
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %8, i32 0, i32 0
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %10, i32 0, i32 1
  store i64 0, ptr %11, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %12, i32 0, i32 2
  store i64 0, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  store ptr %14, ptr %1, align 8
  br label %15

15:                                               ; preds = %7, %6
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

define internal i32 @BinarytreesArena_build_tree(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %12 = load ptr, ptr %5, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %15, label %14

14:                                               ; preds = %3
  store i32 -1, ptr %4, align 4
  br label %68

15:                                               ; preds = %3
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = call i32 @BinarytreesArena_Arena_add(ptr noundef %16, i32 noundef %17)
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %8, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %22

21:                                               ; preds = %15
  store i32 -1, ptr %4, align 4
  br label %68

22:                                               ; preds = %15
  %23 = load i32, ptr %7, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %66

25:                                               ; preds = %22
  %26 = load i32, ptr %7, align 4
  %27 = sub nsw i32 %26, 1
  %28 = shl i32 1, %27
  store i32 %28, ptr %9, align 4
  %29 = load ptr, ptr %5, align 8
  %30 = load i32, ptr %6, align 4
  %31 = load i32, ptr %9, align 4
  %32 = sub nsw i32 %30, %31
  %33 = load i32, ptr %7, align 4
  %34 = sub nsw i32 %33, 1
  %35 = call i32 @BinarytreesArena_build_tree(ptr noundef %29, i32 noundef %32, i32 noundef %34)
  store i32 %35, ptr %10, align 4
  %36 = load ptr, ptr %5, align 8
  %37 = load i32, ptr %6, align 4
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %37, %38
  %40 = load i32, ptr %7, align 4
  %41 = sub nsw i32 %40, 1
  %42 = call i32 @BinarytreesArena_build_tree(ptr noundef %36, i32 noundef %39, i32 noundef %41)
  store i32 %42, ptr %11, align 4
  %43 = load i32, ptr %10, align 4
  %44 = icmp sge i32 %43, 0
  br i1 %44, label %45, label %65

45:                                               ; preds = %25
  %46 = load i32, ptr %11, align 4
  %47 = icmp sge i32 %46, 0
  br i1 %47, label %48, label %65

48:                                               ; preds = %45
  %49 = load i32, ptr %10, align 4
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = load i32, ptr %8, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %52, i64 %54
  %56 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %55, i32 0, i32 1
  store i32 %49, ptr %56, align 4
  %57 = load i32, ptr %11, align 4
  %58 = load ptr, ptr %5, align 8
  %59 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %58, i32 0, i32 0
  %60 = load ptr, ptr %59, align 8
  %61 = load i32, ptr %8, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %60, i64 %62
  %64 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %63, i32 0, i32 2
  store i32 %57, ptr %64, align 4
  br label %65

65:                                               ; preds = %48, %45, %25
  br label %66

66:                                               ; preds = %65, %22
  %67 = load i32, ptr %8, align 4
  store i32 %67, ptr %4, align 4
  br label %68

68:                                               ; preds = %66, %21, %14
  %69 = load i32, ptr %4, align 4
  ret i32 %69
}

define internal i32 @BinarytreesArena_sum(ptr noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %20

10:                                               ; preds = %2
  %11 = load i32, ptr %5, align 4
  %12 = icmp slt i32 %11, 0
  br i1 %12, label %20, label %13

13:                                               ; preds = %10
  %14 = load i32, ptr %5, align 4
  %15 = sext i32 %14 to i64
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %16, i32 0, i32 2
  %18 = load i64, ptr %17, align 8
  %19 = icmp uge i64 %15, %18
  br i1 %19, label %20, label %21

20:                                               ; preds = %13, %10, %2
  store i32 0, ptr %3, align 4
  br label %59

21:                                               ; preds = %13
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %24, i64 %26
  store ptr %27, ptr %6, align 8
  %28 = load ptr, ptr %6, align 8
  %29 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %28, i32 0, i32 0
  %30 = load i32, ptr %29, align 4
  %31 = add i32 %30, 1
  store i32 %31, ptr %7, align 4
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %32, i32 0, i32 1
  %34 = load i32, ptr %33, align 4
  %35 = icmp sge i32 %34, 0
  br i1 %35, label %36, label %44

36:                                               ; preds = %21
  %37 = load ptr, ptr %4, align 8
  %38 = load ptr, ptr %6, align 8
  %39 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %38, i32 0, i32 1
  %40 = load i32, ptr %39, align 4
  %41 = call i32 @BinarytreesArena_sum(ptr noundef %37, i32 noundef %40)
  %42 = load i32, ptr %7, align 4
  %43 = add i32 %42, %41
  store i32 %43, ptr %7, align 4
  br label %44

44:                                               ; preds = %36, %21
  %45 = load ptr, ptr %6, align 8
  %46 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %45, i32 0, i32 2
  %47 = load i32, ptr %46, align 4
  %48 = icmp sge i32 %47, 0
  br i1 %48, label %49, label %57

49:                                               ; preds = %44
  %50 = load ptr, ptr %4, align 8
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %51, i32 0, i32 2
  %53 = load i32, ptr %52, align 4
  %54 = call i32 @BinarytreesArena_sum(ptr noundef %50, i32 noundef %53)
  %55 = load i32, ptr %7, align 4
  %56 = add i32 %55, %54
  store i32 %56, ptr %7, align 4
  br label %57

57:                                               ; preds = %49, %44
  %58 = load i32, ptr %7, align 4
  store i32 %58, ptr %3, align 4
  br label %59

59:                                               ; preds = %57, %20
  %60 = load i32, ptr %3, align 4
  ret i32 %60
}

define internal void @BinarytreesArena_Arena_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %22

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %14, i32 0, i32 0
  store ptr null, ptr %15, align 8
  br label %16

16:                                               ; preds = %10, %5
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %17, i32 0, i32 1
  store i64 0, ptr %18, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %19, i32 0, i32 2
  store i64 0, ptr %20, align 8
  %21 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %21)
  br label %22

22:                                               ; preds = %16, %1
  ret void
}

define dso_local i32 @BinarytreesArena_checksum(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %7, %1
  store i32 0, ptr %2, align 4
  br label %20

13:                                               ; preds = %7
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 11
  %16 = load ptr, ptr %15, align 8
  store ptr %16, ptr %4, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 8
  store i32 %19, ptr %2, align 4
  br label %20

20:                                               ; preds = %13, %12
  %21 = load i32, ptr %2, align 4
  ret i32 %21
}

define dso_local void @BinarytreesArena_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %29

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %29

11:                                               ; preds = %6
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %3, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %25

19:                                               ; preds = %11
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  call void @BinarytreesArena_Arena_free(ptr noundef %22)
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  br label %25

25:                                               ; preds = %19, %11
  %26 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %26)
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.Benchmark, ptr %27, i32 0, i32 11
  store ptr null, ptr %28, align 8
  br label %29

29:                                               ; preds = %25, %6, %1
  ret void
}

define dso_local ptr @BinarytreesArena_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %33

8:                                                ; preds = %0
  %9 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %33

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %15, i32 0, i32 0
  store i64 0, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %17, i32 0, i32 1
  store i32 0, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.BinarytreesArenaData, ptr %19, i32 0, i32 2
  store ptr null, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 11
  store ptr %21, ptr %23, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 3
  store ptr @BinarytreesArena_prepare, ptr %25, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.Benchmark, ptr %26, i32 0, i32 4
  store ptr @BinarytreesArena_run, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.Benchmark, ptr %28, i32 0, i32 7
  store ptr @BinarytreesArena_checksum, ptr %29, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds nuw %struct.Benchmark, ptr %30, i32 0, i32 10
  store ptr @BinarytreesArena_cleanup, ptr %31, align 8
  %32 = load ptr, ptr %2, align 8
  store ptr %32, ptr %1, align 8
  br label %33

33:                                               ; preds = %14, %12, %7
  %34 = load ptr, ptr %1, align 8
  ret ptr %34
}

define internal i32 @BinarytreesArena_Arena_add(ptr noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %2
  store i32 -1, ptr %3, align 4
  br label %81

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %13, i32 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = icmp uge i64 %15, %18
  br i1 %19, label %20, label %49

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %21, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %25, label %26

25:                                               ; preds = %20
  br label %31

26:                                               ; preds = %20
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %27, i32 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = mul i64 %29, 2
  br label %31

31:                                               ; preds = %26, %25
  %32 = phi i64 [ 1024, %25 ], [ %30, %26 ]
  store i64 %32, ptr %6, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = load i64, ptr %6, align 8
  %37 = mul i64 %36, 12
  %38 = call ptr @realloc(ptr noundef %35, i64 noundef %37)
  store ptr %38, ptr %7, align 8
  %39 = load ptr, ptr %7, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %42, label %41

41:                                               ; preds = %31
  store i32 -1, ptr %3, align 4
  br label %81

42:                                               ; preds = %31
  %43 = load ptr, ptr %7, align 8
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %44, i32 0, i32 0
  store ptr %43, ptr %45, align 8
  %46 = load i64, ptr %6, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %47, i32 0, i32 1
  store i64 %46, ptr %48, align 8
  br label %49

49:                                               ; preds = %42, %12
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %50, i32 0, i32 2
  %52 = load i64, ptr %51, align 8
  %53 = trunc i64 %52 to i32
  store i32 %53, ptr %8, align 4
  %54 = load i32, ptr %5, align 4
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %8, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %57, i64 %59
  %61 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %60, i32 0, i32 0
  store i32 %54, ptr %61, align 4
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %8, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %64, i64 %66
  %68 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %67, i32 0, i32 1
  store i32 -1, ptr %68, align 4
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %69, i32 0, i32 0
  %71 = load ptr, ptr %70, align 8
  %72 = load i32, ptr %8, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds %struct.BinarytreesArena_Node, ptr %71, i64 %73
  %75 = getelementptr inbounds nuw %struct.BinarytreesArena_Node, ptr %74, i32 0, i32 2
  store i32 -1, ptr %75, align 4
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds nuw %struct.BinarytreesArena_Arena, ptr %76, i32 0, i32 2
  %78 = load i64, ptr %77, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr %77, align 8
  %80 = load i32, ptr %8, align 4
  store i32 %80, ptr %3, align 4
  br label %81

81:                                               ; preds = %49, %41, %11
  %82 = load i32, ptr %3, align 4
  ret i32 %82
}

declare ptr @realloc(ptr noundef, i64 noundef)


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
