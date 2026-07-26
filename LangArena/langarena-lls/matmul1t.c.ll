; ModuleID = 'c/src/matmul1t.c'
source_filename = "c/src/matmul1t.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.MatmulBaseData = type { i64, i32, ptr, ptr }
%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.MatmulParallelData = type { %struct.MatmulBaseData, i32 }
%struct.MatmulThreadData = type { ptr, ptr, ptr, i32, i32, i32 }

@.str = private unnamed_addr constant [15 x i8] c"Matmul::Single\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Matmul::T4\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Matmul::T8\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Matmul::T16\00", align 1
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [28 x i8] c"Failed to create thread %d\0A\00", align 1

define dso_local ptr @Matmul_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %4, ptr %2, align 8
  %5 = call i64 @Helper_config_i64(ptr noundef @.str, ptr noundef @.str.1)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %6, i32 0, i32 0
  store i64 %5, ptr %7, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %8, i32 0, i32 0
  %10 = load i64, ptr %9, align 8
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %0
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %13, i32 0, i32 0
  store i64 100, ptr %14, align 8
  br label %15

15:                                               ; preds = %12, %0
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %16, i32 0, i32 1
  store i32 0, ptr %17, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %18, i32 0, i32 2
  store ptr null, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 3
  store ptr null, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = load ptr, ptr %1, align 8
  %24 = getelementptr inbounds nuw %struct.Benchmark, ptr %23, i32 0, i32 11
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %1, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 3
  store ptr @MatmulBase_prepare, ptr %26, align 8
  %27 = load ptr, ptr %1, align 8
  %28 = getelementptr inbounds nuw %struct.Benchmark, ptr %27, i32 0, i32 4
  store ptr @Matmul_run, ptr %28, align 8
  %29 = load ptr, ptr %1, align 8
  %30 = getelementptr inbounds nuw %struct.Benchmark, ptr %29, i32 0, i32 7
  store ptr @Matmul_checksum, ptr %30, align 8
  %31 = load ptr, ptr %1, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 10
  store ptr @MatmulBase_cleanup, ptr %32, align 8
  %33 = load ptr, ptr %1, align 8
  ret ptr %33
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal void @MatmulBase_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %8, i32 0, i32 0
  %10 = load i64, ptr %9, align 8
  %11 = trunc i64 %10 to i32
  store i32 %11, ptr %4, align 4
  %12 = load i32, ptr %4, align 4
  %13 = call ptr @matgen(i32 noundef %12)
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %14, i32 0, i32 2
  store ptr %13, ptr %15, align 8
  %16 = load i32, ptr %4, align 4
  %17 = call ptr @matgen(i32 noundef %16)
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %18, i32 0, i32 3
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 1
  store i32 0, ptr %21, align 8
  ret void
}

define internal void @Matmul_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 11
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = trunc i64 %16 to i32
  store i32 %17, ptr %6, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %18, i32 0, i32 2
  %20 = load ptr, ptr %19, align 8
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %6, align 4
  %25 = call ptr @matmul_sequential(ptr noundef %20, ptr noundef %23, i32 noundef %24)
  store ptr %25, ptr %7, align 8
  %26 = load ptr, ptr %7, align 8
  %27 = load i32, ptr %6, align 4
  %28 = ashr i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds ptr, ptr %26, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %6, align 4
  %33 = ashr i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, ptr %31, i64 %34
  %36 = load double, ptr %35, align 8
  store double %36, ptr %8, align 8
  %37 = load ptr, ptr %7, align 8
  %38 = load i32, ptr %6, align 4
  call void @free_matrix(ptr noundef %37, i32 noundef %38)
  %39 = load double, ptr %8, align 8
  %40 = call i32 @Helper_checksum_f64(double noundef %39)
  store i32 %40, ptr %9, align 4
  %41 = load i32, ptr %9, align 4
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 8
  %45 = add i32 %44, %41
  store i32 %45, ptr %43, align 8
  ret void
}

define internal i32 @Matmul_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define internal void @MatmulBase_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %8, i32 0, i32 0
  %10 = load i64, ptr %9, align 8
  %11 = trunc i64 %10 to i32
  store i32 %11, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %23

16:                                               ; preds = %1
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %17, i32 0, i32 2
  %19 = load ptr, ptr %18, align 8
  %20 = load i32, ptr %4, align 4
  call void @free_matrix(ptr noundef %19, i32 noundef %20)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %21, i32 0, i32 2
  store ptr null, ptr %22, align 8
  br label %23

23:                                               ; preds = %16, %1
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %35

28:                                               ; preds = %23
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %4, align 4
  call void @free_matrix(ptr noundef %31, i32 noundef %32)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %33, i32 0, i32 3
  store ptr null, ptr %34, align 8
  br label %35

35:                                               ; preds = %28, %23
  ret void
}

define dso_local ptr @Matmul4T_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = call i64 @Helper_config_i64(ptr noundef @.str.2, ptr noundef @.str.1)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %7, i32 0, i32 0
  store i64 %5, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %10, i32 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %0
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %16, i32 0, i32 0
  store i64 100, ptr %17, align 8
  br label %18

18:                                               ; preds = %14, %0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 1
  store i32 0, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %26, i32 0, i32 3
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %28, i32 0, i32 1
  store i32 4, ptr %29, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = load ptr, ptr %1, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 11
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr inbounds nuw %struct.Benchmark, ptr %33, i32 0, i32 3
  store ptr @MatmulBase_prepare, ptr %34, align 8
  %35 = load ptr, ptr %1, align 8
  %36 = getelementptr inbounds nuw %struct.Benchmark, ptr %35, i32 0, i32 4
  store ptr @MatmulParallel_run, ptr %36, align 8
  %37 = load ptr, ptr %1, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 7
  store ptr @Matmul_checksum, ptr %38, align 8
  %39 = load ptr, ptr %1, align 8
  %40 = getelementptr inbounds nuw %struct.Benchmark, ptr %39, i32 0, i32 10
  store ptr @MatmulBase_cleanup, ptr %40, align 8
  %41 = load ptr, ptr %1, align 8
  ret ptr %41
}

define internal void @MatmulParallel_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 11
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %5, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = trunc i64 %17 to i32
  store i32 %18, ptr %6, align 4
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %23, i32 0, i32 0
  %25 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %6, align 4
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %28, i32 0, i32 1
  %30 = load i32, ptr %29, align 8
  %31 = call ptr @matmul_parallel(ptr noundef %22, ptr noundef %26, i32 noundef %27, i32 noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = load i32, ptr %6, align 4
  %34 = ashr i32 %33, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %32, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = load i32, ptr %6, align 4
  %39 = ashr i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, ptr %37, i64 %40
  %42 = load double, ptr %41, align 8
  store double %42, ptr %8, align 8
  %43 = load ptr, ptr %7, align 8
  %44 = load i32, ptr %6, align 4
  call void @free_matrix(ptr noundef %43, i32 noundef %44)
  %45 = load double, ptr %8, align 8
  %46 = call i32 @Helper_checksum_f64(double noundef %45)
  store i32 %46, ptr %9, align 4
  %47 = load i32, ptr %9, align 4
  %48 = load ptr, ptr %5, align 8
  %49 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %48, i32 0, i32 0
  %50 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 8
  %52 = add i32 %51, %47
  store i32 %52, ptr %50, align 8
  ret void
}

define dso_local ptr @Matmul8T_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = call i64 @Helper_config_i64(ptr noundef @.str.3, ptr noundef @.str.1)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %7, i32 0, i32 0
  store i64 %5, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %10, i32 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %0
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %16, i32 0, i32 0
  store i64 100, ptr %17, align 8
  br label %18

18:                                               ; preds = %14, %0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 1
  store i32 0, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %26, i32 0, i32 3
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %28, i32 0, i32 1
  store i32 8, ptr %29, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = load ptr, ptr %1, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 11
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr inbounds nuw %struct.Benchmark, ptr %33, i32 0, i32 3
  store ptr @MatmulBase_prepare, ptr %34, align 8
  %35 = load ptr, ptr %1, align 8
  %36 = getelementptr inbounds nuw %struct.Benchmark, ptr %35, i32 0, i32 4
  store ptr @MatmulParallel_run, ptr %36, align 8
  %37 = load ptr, ptr %1, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 7
  store ptr @Matmul_checksum, ptr %38, align 8
  %39 = load ptr, ptr %1, align 8
  %40 = getelementptr inbounds nuw %struct.Benchmark, ptr %39, i32 0, i32 10
  store ptr @MatmulBase_cleanup, ptr %40, align 8
  %41 = load ptr, ptr %1, align 8
  ret ptr %41
}

define dso_local ptr @Matmul16T_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.4)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = call i64 @Helper_config_i64(ptr noundef @.str.4, ptr noundef @.str.1)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %6, i32 0, i32 0
  %8 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %7, i32 0, i32 0
  store i64 %5, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %9, i32 0, i32 0
  %11 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %10, i32 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %0
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %16, i32 0, i32 0
  store i64 100, ptr %17, align 8
  br label %18

18:                                               ; preds = %14, %0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %19, i32 0, i32 0
  %21 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %20, i32 0, i32 1
  store i32 0, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %23, i32 0, i32 2
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds nuw %struct.MatmulBaseData, ptr %26, i32 0, i32 3
  store ptr null, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.MatmulParallelData, ptr %28, i32 0, i32 1
  store i32 16, ptr %29, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = load ptr, ptr %1, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 11
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %1, align 8
  %34 = getelementptr inbounds nuw %struct.Benchmark, ptr %33, i32 0, i32 3
  store ptr @MatmulBase_prepare, ptr %34, align 8
  %35 = load ptr, ptr %1, align 8
  %36 = getelementptr inbounds nuw %struct.Benchmark, ptr %35, i32 0, i32 4
  store ptr @MatmulParallel_run, ptr %36, align 8
  %37 = load ptr, ptr %1, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 7
  store ptr @Matmul_checksum, ptr %38, align 8
  %39 = load ptr, ptr %1, align 8
  %40 = getelementptr inbounds nuw %struct.Benchmark, ptr %39, i32 0, i32 10
  store ptr @MatmulBase_cleanup, ptr %40, align 8
  %41 = load ptr, ptr %1, align 8
  ret ptr %41
}

define internal ptr @matgen(i32 noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca double, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %7 = load i32, ptr %2, align 4
  %8 = sitofp i32 %7 to double
  %9 = fdiv double 1.000000e+00, %8
  %10 = load i32, ptr %2, align 4
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %9, %11
  store double %12, ptr %3, align 8
  %13 = load i32, ptr %2, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %14, 8
  %16 = call noalias ptr @malloc(i64 noundef %15)
  store ptr %16, ptr %4, align 8
  store i32 0, ptr %5, align 4
  br label %17

17:                                               ; preds = %58, %1
  %18 = load i32, ptr %5, align 4
  %19 = load i32, ptr %2, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %61

21:                                               ; preds = %17
  %22 = load i32, ptr %2, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = call noalias ptr @malloc(i64 noundef %24)
  %26 = load ptr, ptr %4, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds ptr, ptr %26, i64 %28
  store ptr %25, ptr %29, align 8
  store i32 0, ptr %6, align 4
  br label %30

30:                                               ; preds = %54, %21
  %31 = load i32, ptr %6, align 4
  %32 = load i32, ptr %2, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %57

34:                                               ; preds = %30
  %35 = load double, ptr %3, align 8
  %36 = load i32, ptr %5, align 4
  %37 = load i32, ptr %6, align 4
  %38 = sub nsw i32 %36, %37
  %39 = sitofp i32 %38 to double
  %40 = fmul double %35, %39
  %41 = load i32, ptr %5, align 4
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %41, %42
  %44 = sitofp i32 %43 to double
  %45 = fmul double %40, %44
  %46 = load ptr, ptr %4, align 8
  %47 = load i32, ptr %5, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds ptr, ptr %46, i64 %48
  %50 = load ptr, ptr %49, align 8
  %51 = load i32, ptr %6, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, ptr %50, i64 %52
  store double %45, ptr %53, align 8
  br label %54

54:                                               ; preds = %34
  %55 = load i32, ptr %6, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %6, align 4
  br label %30, !llvm.loop !6

57:                                               ; preds = %30
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %5, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %5, align 4
  br label %17, !llvm.loop !8

61:                                               ; preds = %17
  %62 = load ptr, ptr %4, align 8
  ret ptr %62
}

define internal ptr @matmul_sequential(ptr noundef %0, ptr noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %6, align 4
  %17 = call ptr @transpose(ptr noundef %15, i32 noundef %16)
  store ptr %17, ptr %7, align 8
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = mul i64 %19, 8
  %21 = call noalias ptr @malloc(i64 noundef %20)
  store ptr %21, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %22

22:                                               ; preds = %84, %3
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %87

26:                                               ; preds = %22
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = mul i64 %28, 8
  %30 = call noalias ptr @malloc(i64 noundef %29)
  %31 = load ptr, ptr %8, align 8
  %32 = load i32, ptr %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33
  store ptr %30, ptr %34, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = load i32, ptr %9, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds ptr, ptr %35, i64 %37
  %39 = load ptr, ptr %38, align 8
  store ptr %39, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %40

40:                                               ; preds = %80, %26
  %41 = load i32, ptr %11, align 4
  %42 = load i32, ptr %6, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %83

44:                                               ; preds = %40
  store double 0.000000e+00, ptr %12, align 8
  %45 = load ptr, ptr %7, align 8
  %46 = load i32, ptr %11, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds ptr, ptr %45, i64 %47
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %13, align 8
  store i32 0, ptr %14, align 4
  br label %50

50:                                               ; preds = %67, %44
  %51 = load i32, ptr %14, align 4
  %52 = load i32, ptr %6, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %70

54:                                               ; preds = %50
  %55 = load ptr, ptr %10, align 8
  %56 = load i32, ptr %14, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, ptr %55, i64 %57
  %59 = load double, ptr %58, align 8
  %60 = load ptr, ptr %13, align 8
  %61 = load i32, ptr %14, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, ptr %60, i64 %62
  %64 = load double, ptr %63, align 8
  %65 = load double, ptr %12, align 8
  %66 = call double @llvm.fmuladd.f64(double %59, double %64, double %65)
  store double %66, ptr %12, align 8
  br label %67

67:                                               ; preds = %54
  %68 = load i32, ptr %14, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %14, align 4
  br label %50, !llvm.loop !9

70:                                               ; preds = %50
  %71 = load double, ptr %12, align 8
  %72 = load ptr, ptr %8, align 8
  %73 = load i32, ptr %9, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds ptr, ptr %72, i64 %74
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %11, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, ptr %76, i64 %78
  store double %71, ptr %79, align 8
  br label %80

80:                                               ; preds = %70
  %81 = load i32, ptr %11, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %11, align 4
  br label %40, !llvm.loop !10

83:                                               ; preds = %40
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %9, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %9, align 4
  br label %22, !llvm.loop !11

87:                                               ; preds = %22
  %88 = load ptr, ptr %7, align 8
  %89 = load i32, ptr %6, align 4
  call void @free_matrix(ptr noundef %88, i32 noundef %89)
  %90 = load ptr, ptr %8, align 8
  ret ptr %90
}

define internal void @free_matrix(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  br label %25

9:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %20, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %23

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds ptr, ptr %15, i64 %17
  %19 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %19)
  br label %20

20:                                               ; preds = %14
  %21 = load i32, ptr %5, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %5, align 4
  br label %10, !llvm.loop !12

23:                                               ; preds = %10
  %24 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %24)
  br label %25

25:                                               ; preds = %23, %8
  ret void
}

declare i32 @Helper_checksum_f64(double noundef)

define internal ptr @transpose(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  %9 = sext i32 %8 to i64
  %10 = mul i64 %9, 8
  %11 = call noalias ptr @malloc(i64 noundef %10)
  store ptr %11, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %51, %2
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %54

16:                                               ; preds = %12
  %17 = load i32, ptr %4, align 4
  %18 = sext i32 %17 to i64
  %19 = mul i64 %18, 8
  %20 = call noalias ptr @malloc(i64 noundef %19)
  %21 = load ptr, ptr %5, align 8
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  store ptr %20, ptr %24, align 8
  store i32 0, ptr %7, align 4
  br label %25

25:                                               ; preds = %47, %16
  %26 = load i32, ptr %7, align 4
  %27 = load i32, ptr %4, align 4
  %28 = icmp slt i32 %26, %27
  br i1 %28, label %29, label %50

29:                                               ; preds = %25
  %30 = load ptr, ptr %3, align 8
  %31 = load i32, ptr %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds ptr, ptr %30, i64 %32
  %34 = load ptr, ptr %33, align 8
  %35 = load i32, ptr %6, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, ptr %34, i64 %36
  %38 = load double, ptr %37, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = load i32, ptr %6, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds ptr, ptr %39, i64 %41
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds double, ptr %43, i64 %45
  store double %38, ptr %46, align 8
  br label %47

47:                                               ; preds = %29
  %48 = load i32, ptr %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, ptr %7, align 4
  br label %25, !llvm.loop !13

50:                                               ; preds = %25
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %6, align 4
  br label %12, !llvm.loop !14

54:                                               ; preds = %12
  %55 = load ptr, ptr %5, align 8
  ret ptr %55
}

declare double @llvm.fmuladd.f64(double, double, double)

declare void @free(ptr noundef)

define internal ptr @matmul_parallel(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %19 = load i32, ptr %8, align 4
  %20 = zext i32 %19 to i64
  %21 = call ptr @llvm.stacksave.p0()
  store ptr %21, ptr %9, align 8
  %22 = alloca i64, i64 %20, align 16
  store i64 %20, ptr %10, align 8
  %23 = load i32, ptr %8, align 4
  %24 = zext i32 %23 to i64
  %25 = alloca %struct.MatmulThreadData, i64 %24, align 16
  store i64 %24, ptr %11, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = load i32, ptr %7, align 4
  %28 = call ptr @transpose(ptr noundef %26, i32 noundef %27)
  store ptr %28, ptr %12, align 8
  %29 = load i32, ptr %7, align 4
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 8
  %32 = call noalias ptr @malloc(i64 noundef %31)
  store ptr %32, ptr %13, align 8
  store i32 0, ptr %14, align 4
  br label %33

33:                                               ; preds = %45, %4
  %34 = load i32, ptr %14, align 4
  %35 = load i32, ptr %7, align 4
  %36 = icmp slt i32 %34, %35
  br i1 %36, label %37, label %48

37:                                               ; preds = %33
  %38 = load i32, ptr %7, align 4
  %39 = sext i32 %38 to i64
  %40 = call noalias ptr @calloc(i64 noundef %39, i64 noundef 8)
  %41 = load ptr, ptr %13, align 8
  %42 = load i32, ptr %14, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds ptr, ptr %41, i64 %43
  store ptr %40, ptr %44, align 8
  br label %45

45:                                               ; preds = %37
  %46 = load i32, ptr %14, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %14, align 4
  br label %33, !llvm.loop !15

48:                                               ; preds = %33
  %49 = load i32, ptr %7, align 4
  %50 = load i32, ptr %8, align 4
  %51 = add nsw i32 %49, %50
  %52 = sub nsw i32 %51, 1
  %53 = load i32, ptr %8, align 4
  %54 = sdiv i32 %52, %53
  store i32 %54, ptr %15, align 4
  store i32 0, ptr %16, align 4
  br label %55

55:                                               ; preds = %138, %48
  %56 = load i32, ptr %16, align 4
  %57 = load i32, ptr %8, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %141

59:                                               ; preds = %55
  %60 = load ptr, ptr %5, align 8
  %61 = load i32, ptr %16, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %62
  %64 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %63, i32 0, i32 0
  store ptr %60, ptr %64, align 8
  %65 = load ptr, ptr %12, align 8
  %66 = load i32, ptr %16, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %67
  %69 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %68, i32 0, i32 1
  store ptr %65, ptr %69, align 8
  %70 = load ptr, ptr %13, align 8
  %71 = load i32, ptr %16, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %72
  %74 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %73, i32 0, i32 2
  store ptr %70, ptr %74, align 8
  %75 = load i32, ptr %7, align 4
  %76 = load i32, ptr %16, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %77
  %79 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %78, i32 0, i32 3
  store i32 %75, ptr %79, align 8
  %80 = load i32, ptr %16, align 4
  %81 = load i32, ptr %15, align 4
  %82 = mul nsw i32 %80, %81
  %83 = load i32, ptr %16, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %84
  %86 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %85, i32 0, i32 4
  store i32 %82, ptr %86, align 4
  %87 = load i32, ptr %16, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %88
  %90 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %89, i32 0, i32 4
  %91 = load i32, ptr %90, align 4
  %92 = load i32, ptr %15, align 4
  %93 = add nsw i32 %91, %92
  %94 = load i32, ptr %16, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %95
  %97 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %96, i32 0, i32 5
  store i32 %93, ptr %97, align 8
  %98 = load i32, ptr %16, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %99
  %101 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %100, i32 0, i32 5
  %102 = load i32, ptr %101, align 8
  %103 = load i32, ptr %7, align 4
  %104 = icmp sgt i32 %102, %103
  br i1 %104, label %110, label %105

105:                                              ; preds = %59
  %106 = load i32, ptr %16, align 4
  %107 = load i32, ptr %8, align 4
  %108 = sub nsw i32 %107, 1
  %109 = icmp eq i32 %106, %108
  br i1 %109, label %110, label %116

110:                                              ; preds = %105, %59
  %111 = load i32, ptr %7, align 4
  %112 = load i32, ptr %16, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %113
  %115 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %114, i32 0, i32 5
  store i32 %111, ptr %115, align 8
  br label %116

116:                                              ; preds = %110, %105
  %117 = load i32, ptr %16, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i64, ptr %22, i64 %118
  %120 = load i32, ptr %16, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %121
  %123 = call i32 @pthread_create(ptr noundef %119, ptr noundef null, ptr noundef @thread_func, ptr noundef %122)
  store i32 %123, ptr %17, align 4
  %124 = load i32, ptr %17, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %137

126:                                              ; preds = %116
  %127 = load ptr, ptr @stderr, align 8
  %128 = load i32, ptr %16, align 4
  %129 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %127, ptr noundef @.str.5, i32 noundef %128)
  %130 = load i32, ptr %16, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds %struct.MatmulThreadData, ptr %25, i64 %131
  %133 = call ptr @thread_func(ptr noundef %132)
  %134 = load i32, ptr %16, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i64, ptr %22, i64 %135
  store i64 0, ptr %136, align 8
  br label %137

137:                                              ; preds = %126, %116
  br label %138

138:                                              ; preds = %137
  %139 = load i32, ptr %16, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %16, align 4
  br label %55, !llvm.loop !16

141:                                              ; preds = %55
  store i32 0, ptr %18, align 4
  br label %142

142:                                              ; preds = %159, %141
  %143 = load i32, ptr %18, align 4
  %144 = load i32, ptr %8, align 4
  %145 = icmp slt i32 %143, %144
  br i1 %145, label %146, label %162

146:                                              ; preds = %142
  %147 = load i32, ptr %18, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i64, ptr %22, i64 %148
  %150 = load i64, ptr %149, align 8
  %151 = icmp ne i64 %150, 0
  br i1 %151, label %152, label %158

152:                                              ; preds = %146
  %153 = load i32, ptr %18, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i64, ptr %22, i64 %154
  %156 = load i64, ptr %155, align 8
  %157 = call i32 @pthread_join(i64 noundef %156, ptr noundef null)
  br label %158

158:                                              ; preds = %152, %146
  br label %159

159:                                              ; preds = %158
  %160 = load i32, ptr %18, align 4
  %161 = add nsw i32 %160, 1
  store i32 %161, ptr %18, align 4
  br label %142, !llvm.loop !17

162:                                              ; preds = %142
  %163 = load ptr, ptr %12, align 8
  %164 = load i32, ptr %7, align 4
  call void @free_matrix(ptr noundef %163, i32 noundef %164)
  %165 = load ptr, ptr %13, align 8
  %166 = load ptr, ptr %9, align 8
  call void @llvm.stackrestore.p0(ptr %166)
  ret ptr %165
}

declare ptr @llvm.stacksave.p0()

declare noalias ptr @calloc(i64 noundef, i64 noundef)

declare i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef)

define internal ptr @thread_func(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %11 = load ptr, ptr %2, align 8
  store ptr %11, ptr %3, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %12, i32 0, i32 4
  %14 = load i32, ptr %13, align 4
  store i32 %14, ptr %4, align 4
  br label %15

15:                                               ; preds = %82, %1
  %16 = load i32, ptr %4, align 4
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %17, i32 0, i32 5
  %19 = load i32, ptr %18, align 8
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %85

21:                                               ; preds = %15
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds ptr, ptr %24, i64 %26
  %28 = load ptr, ptr %27, align 8
  store ptr %28, ptr %5, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %4, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %36

36:                                               ; preds = %78, %21
  %37 = load i32, ptr %7, align 4
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %38, i32 0, i32 3
  %40 = load i32, ptr %39, align 8
  %41 = icmp slt i32 %37, %40
  br i1 %41, label %42, label %81

42:                                               ; preds = %36
  store double 0.000000e+00, ptr %8, align 8
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = load i32, ptr %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds ptr, ptr %45, i64 %47
  %49 = load ptr, ptr %48, align 8
  store ptr %49, ptr %9, align 8
  store i32 0, ptr %10, align 4
  br label %50

50:                                               ; preds = %69, %42
  %51 = load i32, ptr %10, align 4
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.MatmulThreadData, ptr %52, i32 0, i32 3
  %54 = load i32, ptr %53, align 8
  %55 = icmp slt i32 %51, %54
  br i1 %55, label %56, label %72

56:                                               ; preds = %50
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %10, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, ptr %57, i64 %59
  %61 = load double, ptr %60, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = load i32, ptr %10, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, ptr %62, i64 %64
  %66 = load double, ptr %65, align 8
  %67 = load double, ptr %8, align 8
  %68 = call double @llvm.fmuladd.f64(double %61, double %66, double %67)
  store double %68, ptr %8, align 8
  br label %69

69:                                               ; preds = %56
  %70 = load i32, ptr %10, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %10, align 4
  br label %50, !llvm.loop !18

72:                                               ; preds = %50
  %73 = load double, ptr %8, align 8
  %74 = load ptr, ptr %6, align 8
  %75 = load i32, ptr %7, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, ptr %74, i64 %76
  store double %73, ptr %77, align 8
  br label %78

78:                                               ; preds = %72
  %79 = load i32, ptr %7, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %7, align 4
  br label %36, !llvm.loop !19

81:                                               ; preds = %36
  br label %82

82:                                               ; preds = %81
  %83 = load i32, ptr %4, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, ptr %4, align 4
  br label %15, !llvm.loop !20

85:                                               ; preds = %15
  ret ptr null
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...)

declare i32 @pthread_join(i64 noundef, ptr noundef)

declare void @llvm.stackrestore.p0(ptr)


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
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
