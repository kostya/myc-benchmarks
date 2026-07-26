; ModuleID = 'c/src/benchmark.c'
source_filename = "c/src/benchmark.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BenchmarkFactory = type { [100 x i8], ptr }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [18 x i8] c"warmup_iterations\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"iterations\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"checksum\00", align 1
@benchmark_factories = dso_local global ptr null, align 8
@benchmark_factories_count = dso_local global i64 0, align 8
@benchmark_factories_capacity = dso_local global i64 0, align 8
@global_order_count = external global i64, align 8
@global_order = external global ptr, align 8
@.str.3 = private unnamed_addr constant [65 x i8] c"Warning: Benchmark '%s' defined in config but not found in code\0A\00", align 1
@.str.4 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@stdout = external global ptr, align 8
@.str.5 = private unnamed_addr constant [4 x i8] c"OK \00", align 1
@.str.6 = private unnamed_addr constant [29 x i8] c"ERR[actual=%u, expected=%u] \00", align 1
@.str.7 = private unnamed_addr constant [10 x i8] c"in %.3fs\0A\00", align 1
@.str.8 = private unnamed_addr constant [28 x i8] c"Summary: %.4fs, %d, %d, %d\0A\00", align 1

define dso_local void @Benchmark_default_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

define dso_local void @Benchmark_default_warmup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = call i64 @Helper_config_i64(ptr noundef %7, ptr noundef @.str)
  store i64 %8, ptr %3, align 8
  %9 = load i64, ptr %3, align 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %11, label %25

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 8
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = call i64 %14(ptr noundef %15)
  store i64 %16, ptr %3, align 8
  %17 = load i64, ptr %3, align 8
  %18 = sitofp i64 %17 to double
  %19 = fmul double %18, 2.000000e-01
  %20 = fptosi double %19 to i64
  store i64 %20, ptr %3, align 8
  %21 = load i64, ptr %3, align 8
  %22 = icmp slt i64 %21, 1
  br i1 %22, label %23, label %24

23:                                               ; preds = %11
  store i64 1, ptr %3, align 8
  br label %24

24:                                               ; preds = %23, %11
  br label %25

25:                                               ; preds = %24, %1
  store i64 0, ptr %4, align 8
  br label %26

26:                                               ; preds = %37, %25
  %27 = load i64, ptr %4, align 8
  %28 = load i64, ptr %3, align 8
  %29 = icmp slt i64 %27, %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %26
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds nuw %struct.Benchmark, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %2, align 8
  %35 = load i64, ptr %4, align 8
  %36 = trunc i64 %35 to i32
  call void %33(ptr noundef %34, i32 noundef %36)
  br label %37

37:                                               ; preds = %30
  %38 = load i64, ptr %4, align 8
  %39 = add nsw i64 %38, 1
  store i64 %39, ptr %4, align 8
  br label %26, !llvm.loop !6

40:                                               ; preds = %26
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @Benchmark_default_run_all(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 8
  %7 = load ptr, ptr %6, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = call i64 %7(ptr noundef %8)
  store i64 %9, ptr %3, align 8
  store i64 0, ptr %4, align 8
  br label %10

10:                                               ; preds = %21, %1
  %11 = load i64, ptr %4, align 8
  %12 = load i64, ptr %3, align 8
  %13 = icmp slt i64 %11, %12
  br i1 %13, label %14, label %24

14:                                               ; preds = %10
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = load i64, ptr %4, align 8
  %20 = trunc i64 %19 to i32
  call void %17(ptr noundef %18, i32 noundef %20)
  br label %21

21:                                               ; preds = %14
  %22 = load i64, ptr %4, align 8
  %23 = add nsw i64 %22, 1
  store i64 %23, ptr %4, align 8
  br label %10, !llvm.loop !8

24:                                               ; preds = %10
  ret void
}

define dso_local i32 @Benchmark_default_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Benchmark, ptr %3, i32 0, i32 1
  %5 = load i32, ptr %4, align 8
  ret i32 %5
}

define dso_local i64 @Benchmark_default_iterations(ptr noundef %0) {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 2
  %6 = load i64, ptr %5, align 8
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %1
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  store i64 %11, ptr %2, align 8
  br label %22

12:                                               ; preds = %1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str.1)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 2
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.Benchmark, ptr %19, i32 0, i32 2
  %21 = load i64, ptr %20, align 8
  store i64 %21, ptr %2, align 8
  br label %22

22:                                               ; preds = %12, %8
  %23 = load i64, ptr %2, align 8
  ret i64 %23
}

define dso_local i64 @Benchmark_default_expected_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Benchmark, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = call i64 @Helper_config_i64(ptr noundef %5, ptr noundef @.str.2)
  ret i64 %6
}

define dso_local void @Benchmark_default_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

define dso_local ptr @Benchmark_create(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 96)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 1
  store i32 0, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 2
  store i64 0, ptr %11, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  store ptr null, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 3
  store ptr @Benchmark_default_prepare, ptr %15, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 6
  store ptr @Benchmark_default_warmup, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.Benchmark, ptr %18, i32 0, i32 5
  store ptr @Benchmark_default_run_all, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 7
  store ptr @Benchmark_default_checksum, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 8
  store ptr @Benchmark_default_iterations, ptr %23, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 9
  store ptr @Benchmark_default_expected_checksum, ptr %25, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.Benchmark, ptr %26, i32 0, i32 10
  store ptr @Benchmark_default_cleanup, ptr %27, align 8
  %28 = load ptr, ptr %3, align 8
  ret ptr %28
}

declare noalias ptr @malloc(i64 noundef)

define dso_local void @Benchmark_register(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load i64, ptr @benchmark_factories_count, align 8
  %6 = load i64, ptr @benchmark_factories_capacity, align 8
  %7 = icmp uge i64 %5, %6
  br i1 %7, label %8, label %21

8:                                                ; preds = %2
  %9 = load i64, ptr @benchmark_factories_capacity, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = load i64, ptr @benchmark_factories_capacity, align 8
  %13 = mul i64 %12, 2
  br label %15

14:                                               ; preds = %8
  br label %15

15:                                               ; preds = %14, %11
  %16 = phi i64 [ %13, %11 ], [ 16, %14 ]
  store i64 %16, ptr @benchmark_factories_capacity, align 8
  %17 = load ptr, ptr @benchmark_factories, align 8
  %18 = load i64, ptr @benchmark_factories_capacity, align 8
  %19 = mul i64 112, %18
  %20 = call ptr @realloc(ptr noundef %17, i64 noundef %19)
  store ptr %20, ptr @benchmark_factories, align 8
  br label %21

21:                                               ; preds = %15, %2
  %22 = load ptr, ptr @benchmark_factories, align 8
  %23 = load i64, ptr @benchmark_factories_count, align 8
  %24 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %22, i64 %23
  %25 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds [100 x i8], ptr %25, i64 0, i64 0
  %27 = load ptr, ptr %3, align 8
  %28 = call ptr @strncpy(ptr noundef %26, ptr noundef %27, i64 noundef 99)
  %29 = load ptr, ptr @benchmark_factories, align 8
  %30 = load i64, ptr @benchmark_factories_count, align 8
  %31 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %29, i64 %30
  %32 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %31, i32 0, i32 0
  %33 = getelementptr inbounds nuw [100 x i8], ptr %32, i64 0, i64 99
  store i8 0, ptr %33, align 1
  %34 = load ptr, ptr %4, align 8
  %35 = load ptr, ptr @benchmark_factories, align 8
  %36 = load i64, ptr @benchmark_factories_count, align 8
  %37 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %35, i64 %36
  %38 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %37, i32 0, i32 1
  store ptr %34, ptr %38, align 8
  %39 = load i64, ptr @benchmark_factories_count, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr @benchmark_factories_count, align 8
  ret void
}

declare ptr @realloc(ptr noundef, i64 noundef)

declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef)

define dso_local void @Benchmark_all(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.timespec, align 8
  %4 = alloca %struct.timespec, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [100 x i8], align 16
  %13 = alloca [100 x i8], align 16
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca i64, align 8
  %18 = alloca ptr, align 8
  %19 = alloca double, align 8
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  store i64 0, ptr %8, align 8
  br label %22

22:                                               ; preds = %189, %1
  %23 = load i64, ptr %8, align 8
  %24 = load i64, ptr @global_order_count, align 8
  %25 = icmp ult i64 %23, %24
  br i1 %25, label %26, label %192

26:                                               ; preds = %22
  %27 = load ptr, ptr @global_order, align 8
  %28 = load i64, ptr %8, align 8
  %29 = getelementptr inbounds nuw ptr, ptr %27, i64 %28
  %30 = load ptr, ptr %29, align 8
  store ptr %30, ptr %9, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %86

33:                                               ; preds = %26
  %34 = load ptr, ptr %2, align 8
  %35 = call i64 @strlen(ptr noundef %34)
  %36 = icmp ugt i64 %35, 0
  br i1 %36, label %37, label %86

37:                                               ; preds = %33
  %38 = load ptr, ptr %9, align 8
  store ptr %38, ptr %10, align 8
  %39 = load ptr, ptr %2, align 8
  store ptr %39, ptr %11, align 8
  %40 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %41 = load ptr, ptr %10, align 8
  %42 = call ptr @strncpy(ptr noundef %40, ptr noundef %41, i64 noundef 99)
  %43 = getelementptr inbounds nuw [100 x i8], ptr %12, i64 0, i64 99
  store i8 0, ptr %43, align 1
  %44 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %45 = load ptr, ptr %11, align 8
  %46 = call ptr @strncpy(ptr noundef %44, ptr noundef %45, i64 noundef 99)
  %47 = getelementptr inbounds nuw [100 x i8], ptr %13, i64 0, i64 99
  store i8 0, ptr %47, align 1
  %48 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  store ptr %48, ptr %14, align 8
  br label %49

49:                                               ; preds = %60, %37
  %50 = load ptr, ptr %14, align 8
  %51 = load i8, ptr %50, align 1
  %52 = icmp ne i8 %51, 0
  br i1 %52, label %53, label %63

53:                                               ; preds = %49
  %54 = load ptr, ptr %14, align 8
  %55 = load i8, ptr %54, align 1
  %56 = sext i8 %55 to i32
  %57 = call i32 @tolower(i32 noundef %56)
  %58 = trunc i32 %57 to i8
  %59 = load ptr, ptr %14, align 8
  store i8 %58, ptr %59, align 1
  br label %60

60:                                               ; preds = %53
  %61 = load ptr, ptr %14, align 8
  %62 = getelementptr inbounds nuw i8, ptr %61, i32 1
  store ptr %62, ptr %14, align 8
  br label %49, !llvm.loop !9

63:                                               ; preds = %49
  %64 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  store ptr %64, ptr %15, align 8
  br label %65

65:                                               ; preds = %76, %63
  %66 = load ptr, ptr %15, align 8
  %67 = load i8, ptr %66, align 1
  %68 = icmp ne i8 %67, 0
  br i1 %68, label %69, label %79

69:                                               ; preds = %65
  %70 = load ptr, ptr %15, align 8
  %71 = load i8, ptr %70, align 1
  %72 = sext i8 %71 to i32
  %73 = call i32 @tolower(i32 noundef %72)
  %74 = trunc i32 %73 to i8
  %75 = load ptr, ptr %15, align 8
  store i8 %74, ptr %75, align 1
  br label %76

76:                                               ; preds = %69
  %77 = load ptr, ptr %15, align 8
  %78 = getelementptr inbounds nuw i8, ptr %77, i32 1
  store ptr %78, ptr %15, align 8
  br label %65, !llvm.loop !10

79:                                               ; preds = %65
  %80 = getelementptr inbounds [100 x i8], ptr %12, i64 0, i64 0
  %81 = getelementptr inbounds [100 x i8], ptr %13, i64 0, i64 0
  %82 = call ptr @strstr(ptr noundef %80, ptr noundef %81)
  %83 = icmp eq ptr %82, null
  br i1 %83, label %84, label %85

84:                                               ; preds = %79
  br label %189

85:                                               ; preds = %79
  br label %86

86:                                               ; preds = %85, %33, %26
  store ptr null, ptr %16, align 8
  store i64 0, ptr %17, align 8
  br label %87

87:                                               ; preds = %105, %86
  %88 = load i64, ptr %17, align 8
  %89 = load i64, ptr @benchmark_factories_count, align 8
  %90 = icmp ult i64 %88, %89
  br i1 %90, label %91, label %108

91:                                               ; preds = %87
  %92 = load ptr, ptr @benchmark_factories, align 8
  %93 = load i64, ptr %17, align 8
  %94 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %92, i64 %93
  %95 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %94, i32 0, i32 0
  %96 = getelementptr inbounds [100 x i8], ptr %95, i64 0, i64 0
  %97 = load ptr, ptr %9, align 8
  %98 = call i32 @strcmp(ptr noundef %96, ptr noundef %97)
  %99 = icmp eq i32 %98, 0
  br i1 %99, label %100, label %104

100:                                              ; preds = %91
  %101 = load ptr, ptr @benchmark_factories, align 8
  %102 = load i64, ptr %17, align 8
  %103 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %101, i64 %102
  store ptr %103, ptr %16, align 8
  br label %108

104:                                              ; preds = %91
  br label %105

105:                                              ; preds = %104
  %106 = load i64, ptr %17, align 8
  %107 = add i64 %106, 1
  store i64 %107, ptr %17, align 8
  br label %87, !llvm.loop !11

108:                                              ; preds = %100, %87
  %109 = load ptr, ptr %16, align 8
  %110 = icmp ne ptr %109, null
  br i1 %110, label %114, label %111

111:                                              ; preds = %108
  %112 = load ptr, ptr %9, align 8
  %113 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %112)
  br label %189

114:                                              ; preds = %108
  %115 = load ptr, ptr %9, align 8
  %116 = call i32 (ptr, ...) @printf(ptr noundef @.str.4, ptr noundef %115)
  %117 = load ptr, ptr @stdout, align 8
  %118 = call i32 @fflush(ptr noundef %117)
  %119 = load ptr, ptr %16, align 8
  %120 = getelementptr inbounds nuw %struct.BenchmarkFactory, ptr %119, i32 0, i32 1
  %121 = load ptr, ptr %120, align 8
  %122 = call ptr %121()
  store ptr %122, ptr %18, align 8
  call void @Helper_reset()
  %123 = load ptr, ptr %18, align 8
  %124 = getelementptr inbounds nuw %struct.Benchmark, ptr %123, i32 0, i32 3
  %125 = load ptr, ptr %124, align 8
  %126 = load ptr, ptr %18, align 8
  call void %125(ptr noundef %126)
  %127 = load ptr, ptr %18, align 8
  %128 = getelementptr inbounds nuw %struct.Benchmark, ptr %127, i32 0, i32 6
  %129 = load ptr, ptr %128, align 8
  %130 = load ptr, ptr %18, align 8
  call void %129(ptr noundef %130)
  call void @Helper_reset()
  %131 = call i32 @clock_gettime(i32 noundef 1, ptr noundef %3)
  %132 = load ptr, ptr %18, align 8
  %133 = getelementptr inbounds nuw %struct.Benchmark, ptr %132, i32 0, i32 5
  %134 = load ptr, ptr %133, align 8
  %135 = load ptr, ptr %18, align 8
  call void %134(ptr noundef %135)
  %136 = call i32 @clock_gettime(i32 noundef 1, ptr noundef %4)
  %137 = getelementptr inbounds nuw %struct.timespec, ptr %4, i32 0, i32 0
  %138 = load i64, ptr %137, align 8
  %139 = getelementptr inbounds nuw %struct.timespec, ptr %3, i32 0, i32 0
  %140 = load i64, ptr %139, align 8
  %141 = sub nsw i64 %138, %140
  %142 = sitofp i64 %141 to double
  %143 = getelementptr inbounds nuw %struct.timespec, ptr %4, i32 0, i32 1
  %144 = load i64, ptr %143, align 8
  %145 = getelementptr inbounds nuw %struct.timespec, ptr %3, i32 0, i32 1
  %146 = load i64, ptr %145, align 8
  %147 = sub nsw i64 %144, %146
  %148 = sitofp i64 %147 to double
  %149 = call double @llvm.fmuladd.f64(double %148, double 1.000000e-09, double %142)
  store double %149, ptr %19, align 8
  %150 = load double, ptr %19, align 8
  %151 = load double, ptr %5, align 8
  %152 = fadd double %151, %150
  store double %152, ptr %5, align 8
  %153 = load ptr, ptr %18, align 8
  %154 = getelementptr inbounds nuw %struct.Benchmark, ptr %153, i32 0, i32 7
  %155 = load ptr, ptr %154, align 8
  %156 = load ptr, ptr %18, align 8
  %157 = call i32 %155(ptr noundef %156)
  store i32 %157, ptr %20, align 4
  %158 = load ptr, ptr %18, align 8
  %159 = getelementptr inbounds nuw %struct.Benchmark, ptr %158, i32 0, i32 9
  %160 = load ptr, ptr %159, align 8
  %161 = load ptr, ptr %18, align 8
  %162 = call i64 %160(ptr noundef %161)
  %163 = trunc i64 %162 to i32
  store i32 %163, ptr %21, align 4
  %164 = load i32, ptr %20, align 4
  %165 = load i32, ptr %21, align 4
  %166 = icmp eq i32 %164, %165
  br i1 %166, label %167, label %171

167:                                              ; preds = %114
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %169 = load i32, ptr %6, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, ptr %6, align 4
  br label %177

171:                                              ; preds = %114
  %172 = load i32, ptr %20, align 4
  %173 = load i32, ptr %21, align 4
  %174 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %172, i32 noundef %173)
  %175 = load i32, ptr %7, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, ptr %7, align 4
  br label %177

177:                                              ; preds = %171, %167
  %178 = load double, ptr %19, align 8
  %179 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, double noundef %178)
  %180 = load ptr, ptr %18, align 8
  %181 = getelementptr inbounds nuw %struct.Benchmark, ptr %180, i32 0, i32 10
  %182 = load ptr, ptr %181, align 8
  %183 = load ptr, ptr %18, align 8
  call void %182(ptr noundef %183)
  %184 = load ptr, ptr %18, align 8
  %185 = getelementptr inbounds nuw %struct.Benchmark, ptr %184, i32 0, i32 11
  %186 = load ptr, ptr %185, align 8
  call void @free(ptr noundef %186)
  %187 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %187)
  %188 = call i32 @usleep(i32 noundef 1000)
  br label %189

189:                                              ; preds = %177, %111, %84
  %190 = load i64, ptr %8, align 8
  %191 = add i64 %190, 1
  store i64 %191, ptr %8, align 8
  br label %22, !llvm.loop !12

192:                                              ; preds = %22
  %193 = load i32, ptr %6, align 4
  %194 = load i32, ptr %7, align 4
  %195 = add nsw i32 %193, %194
  %196 = icmp sgt i32 %195, 0
  br i1 %196, label %197, label %205

197:                                              ; preds = %192
  %198 = load double, ptr %5, align 8
  %199 = load i32, ptr %6, align 4
  %200 = load i32, ptr %7, align 4
  %201 = add nsw i32 %199, %200
  %202 = load i32, ptr %6, align 4
  %203 = load i32, ptr %7, align 4
  %204 = call i32 (ptr, ...) @printf(ptr noundef @.str.8, double noundef %198, i32 noundef %201, i32 noundef %202, i32 noundef %203)
  br label %205

205:                                              ; preds = %197, %192
  %206 = load i32, ptr %7, align 4
  %207 = icmp sgt i32 %206, 0
  br i1 %207, label %208, label %209

208:                                              ; preds = %205
  call void @exit(i32 noundef 1)
  unreachable

209:                                              ; preds = %205
  ret void
}

declare i64 @strlen(ptr noundef)

declare i32 @tolower(i32 noundef)

declare ptr @strstr(ptr noundef, ptr noundef)

declare i32 @strcmp(ptr noundef, ptr noundef)

declare i32 @printf(ptr noundef, ...)

declare i32 @fflush(ptr noundef)

declare void @Helper_reset()

declare i32 @clock_gettime(i32 noundef, ptr noundef)

declare double @llvm.fmuladd.f64(double, double, double)

declare void @free(ptr noundef)

declare i32 @usleep(i32 noundef)

declare void @exit(i32 noundef)


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
