; ModuleID = 'c/src/brainfuck_recursion.c'
source_filename = "c/src/brainfuck_recursion.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BrainfuckRecursionData = type { ptr, ptr, i32 }
%struct.BrainfuckRecursion_Op = type { i32, ptr, i32 }
%struct.BrainfuckRecursion_Tape = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [8 x i8] c"program\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"warmup_program\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"warmup_iterations\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Brainfuck::Recursion\00", align 1

define dso_local void @BrainfuckRecursion_prepare(ptr noundef %0) {
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
  %10 = call ptr @Helper_config_s(ptr noundef %9, ptr noundef @.str)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %11, i32 0, i32 0
  store ptr %10, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call ptr @Helper_config_s(ptr noundef %15, ptr noundef @.str.1)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %17, i32 0, i32 1
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %19, i32 0, i32 2
  store i32 0, ptr %20, align 8
  ret void
}

declare ptr @Helper_config_s(ptr noundef, ptr noundef)

define dso_local void @BrainfuckRecursion_warmup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i64 @Helper_config_i64(ptr noundef %11, ptr noundef @.str.2)
  store i64 %12, ptr %4, align 8
  %13 = load i64, ptr %4, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %29

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 8
  %18 = load ptr, ptr %17, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = call i64 %18(ptr noundef %19)
  store i64 %20, ptr %4, align 8
  %21 = load i64, ptr %4, align 8
  %22 = sitofp i64 %21 to double
  %23 = fmul double %22, 2.000000e-01
  %24 = fptosi double %23 to i64
  store i64 %24, ptr %4, align 8
  %25 = load i64, ptr %4, align 8
  %26 = icmp slt i64 %25, 1
  br i1 %26, label %27, label %28

27:                                               ; preds = %15
  store i64 1, ptr %4, align 8
  br label %28

28:                                               ; preds = %27, %15
  br label %29

29:                                               ; preds = %28, %1
  store i64 0, ptr %5, align 8
  br label %30

30:                                               ; preds = %39, %29
  %31 = load i64, ptr %5, align 8
  %32 = load i64, ptr %4, align 8
  %33 = icmp slt i64 %31, %32
  br i1 %33, label %34, label %42

34:                                               ; preds = %30
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = call i32 @BrainfuckRecursion_run_program(ptr noundef %37)
  br label %39

39:                                               ; preds = %34
  %40 = load i64, ptr %5, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, ptr %5, align 8
  br label %30, !llvm.loop !6

42:                                               ; preds = %30
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal i32 @BrainfuckRecursion_run_program(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds i8, ptr %12, i64 0
  %14 = load i8, ptr %13, align 1
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %11, %1
  store i32 0, ptr %2, align 4
  br label %32

17:                                               ; preds = %11
  %18 = load ptr, ptr %3, align 8
  store ptr %18, ptr %4, align 8
  store i32 0, ptr %5, align 4
  %19 = call ptr @BrainfuckRecursion_parse_ops(ptr noundef %4, ptr noundef %5)
  store ptr %19, ptr %6, align 8
  %20 = load ptr, ptr %6, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %23, label %22

22:                                               ; preds = %17
  store i32 0, ptr %2, align 4
  br label %32

23:                                               ; preds = %17
  %24 = call ptr @BrainfuckRecursion_Tape_new()
  store ptr %24, ptr %7, align 8
  store i32 0, ptr %8, align 4
  %25 = load ptr, ptr %6, align 8
  %26 = load i32, ptr %5, align 4
  %27 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_run_ops(ptr noundef %25, i32 noundef %26, ptr noundef %27, ptr noundef %8)
  %28 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_Tape_free(ptr noundef %28)
  %29 = load ptr, ptr %6, align 8
  %30 = load i32, ptr %5, align 4
  call void @BrainfuckRecursion_free_ops(ptr noundef %29, i32 noundef %30)
  %31 = load i32, ptr %8, align 4
  store i32 %31, ptr %2, align 4
  br label %32

32:                                               ; preds = %23, %22, %16
  %33 = load i32, ptr %2, align 4
  ret i32 %33
}

define dso_local void @BrainfuckRecursion_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %13, i32 0, i32 2
  store i32 0, ptr %14, align 8
  br label %15

15:                                               ; preds = %12, %2
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = call i32 @BrainfuckRecursion_run_program(ptr noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %6, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 8
  %24 = add i32 %23, %20
  store i32 %24, ptr %22, align 8
  ret void
}

define dso_local i32 @BrainfuckRecursion_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @BrainfuckRecursion_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

define dso_local ptr @BrainfuckRecursion_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %5, i32 0, i32 0
  store ptr null, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %7, i32 0, i32 1
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.BrainfuckRecursionData, ptr %9, i32 0, i32 2
  store i32 0, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  store ptr %11, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 3
  store ptr @BrainfuckRecursion_prepare, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 6
  store ptr @BrainfuckRecursion_warmup, ptr %17, align 8
  %18 = load ptr, ptr %1, align 8
  %19 = getelementptr inbounds nuw %struct.Benchmark, ptr %18, i32 0, i32 4
  store ptr @BrainfuckRecursion_run, ptr %19, align 8
  %20 = load ptr, ptr %1, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 7
  store ptr @BrainfuckRecursion_checksum, ptr %21, align 8
  %22 = load ptr, ptr %1, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 10
  store ptr @BrainfuckRecursion_cleanup, ptr %23, align 8
  %24 = load ptr, ptr %1, align 8
  ret ptr %24
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define internal ptr @BrainfuckRecursion_parse_ops(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 16, ptr %6, align 4
  %10 = load i32, ptr %6, align 4
  %11 = sext i32 %10 to i64
  %12 = mul i64 24, %11
  %13 = call noalias ptr @malloc(i64 noundef %12)
  store ptr %13, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %14

14:                                               ; preds = %168, %126, %2
  %15 = load ptr, ptr %4, align 8
  %16 = load ptr, ptr %15, align 8
  %17 = load i8, ptr %16, align 1
  %18 = icmp ne i8 %17, 0
  br i1 %18, label %19, label %172

19:                                               ; preds = %14
  %20 = load i32, ptr %8, align 4
  %21 = load i32, ptr %6, align 4
  %22 = icmp sge i32 %20, %21
  br i1 %22, label %23, label %31

23:                                               ; preds = %19
  %24 = load i32, ptr %6, align 4
  %25 = mul nsw i32 %24, 2
  store i32 %25, ptr %6, align 4
  %26 = load ptr, ptr %7, align 8
  %27 = load i32, ptr %6, align 4
  %28 = sext i32 %27 to i64
  %29 = mul i64 24, %28
  %30 = call ptr @realloc(ptr noundef %26, i64 noundef %29)
  store ptr %30, ptr %7, align 8
  br label %31

31:                                               ; preds = %23, %19
  %32 = load ptr, ptr %4, align 8
  %33 = load ptr, ptr %32, align 8
  %34 = load i8, ptr %33, align 1
  %35 = sext i8 %34 to i32
  switch i32 %35, label %167 [
    i32 43, label %36
    i32 45, label %54
    i32 62, label %72
    i32 60, label %90
    i32 46, label %108
    i32 91, label %126
    i32 93, label %160
  ]

36:                                               ; preds = %31
  %37 = load ptr, ptr %7, align 8
  %38 = load i32, ptr %8, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %37, i64 %39
  %41 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %40, i32 0, i32 0
  store i32 0, ptr %41, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = load i32, ptr %8, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %42, i64 %44
  %46 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %45, i32 0, i32 1
  store ptr null, ptr %46, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = load i32, ptr %8, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %47, i64 %49
  %51 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %50, i32 0, i32 2
  store i32 0, ptr %51, align 8
  %52 = load i32, ptr %8, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %8, align 4
  br label %168

54:                                               ; preds = %31
  %55 = load ptr, ptr %7, align 8
  %56 = load i32, ptr %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %55, i64 %57
  %59 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %58, i32 0, i32 0
  store i32 1, ptr %59, align 8
  %60 = load ptr, ptr %7, align 8
  %61 = load i32, ptr %8, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %60, i64 %62
  %64 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %63, i32 0, i32 1
  store ptr null, ptr %64, align 8
  %65 = load ptr, ptr %7, align 8
  %66 = load i32, ptr %8, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %65, i64 %67
  %69 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %68, i32 0, i32 2
  store i32 0, ptr %69, align 8
  %70 = load i32, ptr %8, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %8, align 4
  br label %168

72:                                               ; preds = %31
  %73 = load ptr, ptr %7, align 8
  %74 = load i32, ptr %8, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %73, i64 %75
  %77 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %76, i32 0, i32 0
  store i32 2, ptr %77, align 8
  %78 = load ptr, ptr %7, align 8
  %79 = load i32, ptr %8, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %78, i64 %80
  %82 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %81, i32 0, i32 1
  store ptr null, ptr %82, align 8
  %83 = load ptr, ptr %7, align 8
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %83, i64 %85
  %87 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %86, i32 0, i32 2
  store i32 0, ptr %87, align 8
  %88 = load i32, ptr %8, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %8, align 4
  br label %168

90:                                               ; preds = %31
  %91 = load ptr, ptr %7, align 8
  %92 = load i32, ptr %8, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %91, i64 %93
  %95 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %94, i32 0, i32 0
  store i32 3, ptr %95, align 8
  %96 = load ptr, ptr %7, align 8
  %97 = load i32, ptr %8, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %96, i64 %98
  %100 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %99, i32 0, i32 1
  store ptr null, ptr %100, align 8
  %101 = load ptr, ptr %7, align 8
  %102 = load i32, ptr %8, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %101, i64 %103
  %105 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %104, i32 0, i32 2
  store i32 0, ptr %105, align 8
  %106 = load i32, ptr %8, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, ptr %8, align 4
  br label %168

108:                                              ; preds = %31
  %109 = load ptr, ptr %7, align 8
  %110 = load i32, ptr %8, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %109, i64 %111
  %113 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %112, i32 0, i32 0
  store i32 4, ptr %113, align 8
  %114 = load ptr, ptr %7, align 8
  %115 = load i32, ptr %8, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %114, i64 %116
  %118 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %117, i32 0, i32 1
  store ptr null, ptr %118, align 8
  %119 = load ptr, ptr %7, align 8
  %120 = load i32, ptr %8, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %119, i64 %121
  %123 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %122, i32 0, i32 2
  store i32 0, ptr %123, align 8
  %124 = load i32, ptr %8, align 4
  %125 = add nsw i32 %124, 1
  store i32 %125, ptr %8, align 4
  br label %168

126:                                              ; preds = %31
  %127 = load ptr, ptr %4, align 8
  %128 = load ptr, ptr %127, align 8
  %129 = getelementptr inbounds nuw i8, ptr %128, i32 1
  store ptr %129, ptr %127, align 8
  %130 = load ptr, ptr %7, align 8
  %131 = load i32, ptr %8, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %130, i64 %132
  %134 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %133, i32 0, i32 0
  store i32 5, ptr %134, align 8
  %135 = load ptr, ptr %7, align 8
  %136 = load i32, ptr %8, align 4
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %135, i64 %137
  %139 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %138, i32 0, i32 1
  store ptr null, ptr %139, align 8
  %140 = load ptr, ptr %7, align 8
  %141 = load i32, ptr %8, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %140, i64 %142
  %144 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %143, i32 0, i32 2
  store i32 0, ptr %144, align 8
  store i32 0, ptr %9, align 4
  %145 = load ptr, ptr %4, align 8
  %146 = call ptr @BrainfuckRecursion_parse_ops(ptr noundef %145, ptr noundef %9)
  %147 = load ptr, ptr %7, align 8
  %148 = load i32, ptr %8, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %147, i64 %149
  %151 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %150, i32 0, i32 1
  store ptr %146, ptr %151, align 8
  %152 = load i32, ptr %9, align 4
  %153 = load ptr, ptr %7, align 8
  %154 = load i32, ptr %8, align 4
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %153, i64 %155
  %157 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %156, i32 0, i32 2
  store i32 %152, ptr %157, align 8
  %158 = load i32, ptr %8, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, ptr %8, align 4
  br label %14, !llvm.loop !8

160:                                              ; preds = %31
  %161 = load i32, ptr %8, align 4
  %162 = load ptr, ptr %5, align 8
  store i32 %161, ptr %162, align 4
  %163 = load ptr, ptr %4, align 8
  %164 = load ptr, ptr %163, align 8
  %165 = getelementptr inbounds nuw i8, ptr %164, i32 1
  store ptr %165, ptr %163, align 8
  %166 = load ptr, ptr %7, align 8
  store ptr %166, ptr %3, align 8
  br label %176

167:                                              ; preds = %31
  br label %168

168:                                              ; preds = %167, %108, %90, %72, %54, %36
  %169 = load ptr, ptr %4, align 8
  %170 = load ptr, ptr %169, align 8
  %171 = getelementptr inbounds nuw i8, ptr %170, i32 1
  store ptr %171, ptr %169, align 8
  br label %14, !llvm.loop !8

172:                                              ; preds = %14
  %173 = load i32, ptr %8, align 4
  %174 = load ptr, ptr %5, align 8
  store i32 %173, ptr %174, align 4
  %175 = load ptr, ptr %7, align 8
  store ptr %175, ptr %3, align 8
  br label %176

176:                                              ; preds = %172, %160
  %177 = load ptr, ptr %3, align 8
  ret ptr %177
}

define internal ptr @BrainfuckRecursion_Tape_new() {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 1
  store i32 30000, ptr %4, align 8
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %5, i32 0, i32 1
  %7 = load i32, ptr %6, align 8
  %8 = sext i32 %7 to i64
  %9 = call noalias ptr @calloc(i64 noundef %8, i64 noundef 1)
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %12, i32 0, i32 2
  store i32 0, ptr %13, align 4
  %14 = load ptr, ptr %1, align 8
  ret ptr %14
}

define internal void @BrainfuckRecursion_run_ops(ptr noundef %0, i32 noundef %1, ptr noundef %2, ptr noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %12

12:                                               ; preds = %59, %4
  %13 = load i32, ptr %9, align 4
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %62

16:                                               ; preds = %12
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %9, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %17, i64 %19
  store ptr %20, ptr %10, align 8
  %21 = load ptr, ptr %10, align 8
  %22 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  switch i32 %23, label %58 [
    i32 0, label %24
    i32 1, label %26
    i32 2, label %28
    i32 3, label %30
    i32 4, label %32
    i32 5, label %42
  ]

24:                                               ; preds = %16
  %25 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_Tape_inc(ptr noundef %25)
  br label %58

26:                                               ; preds = %16
  %27 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_Tape_dec(ptr noundef %27)
  br label %58

28:                                               ; preds = %16
  %29 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_Tape_right(ptr noundef %29)
  br label %58

30:                                               ; preds = %16
  %31 = load ptr, ptr %7, align 8
  call void @BrainfuckRecursion_Tape_left(ptr noundef %31)
  br label %58

32:                                               ; preds = %16
  %33 = load ptr, ptr %7, align 8
  %34 = call zeroext i8 @BrainfuckRecursion_Tape_get(ptr noundef %33)
  store i8 %34, ptr %11, align 1
  %35 = load ptr, ptr %8, align 8
  %36 = load i32, ptr %35, align 4
  %37 = shl i32 %36, 2
  %38 = load i8, ptr %11, align 1
  %39 = zext i8 %38 to i32
  %40 = add i32 %37, %39
  %41 = load ptr, ptr %8, align 8
  store i32 %40, ptr %41, align 4
  br label %58

42:                                               ; preds = %16
  br label %43

43:                                               ; preds = %48, %42
  %44 = load ptr, ptr %7, align 8
  %45 = call zeroext i8 @BrainfuckRecursion_Tape_get(ptr noundef %44)
  %46 = zext i8 %45 to i32
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %57

48:                                               ; preds = %43
  %49 = load ptr, ptr %10, align 8
  %50 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %52, i32 0, i32 2
  %54 = load i32, ptr %53, align 8
  %55 = load ptr, ptr %7, align 8
  %56 = load ptr, ptr %8, align 8
  call void @BrainfuckRecursion_run_ops(ptr noundef %51, i32 noundef %54, ptr noundef %55, ptr noundef %56)
  br label %43, !llvm.loop !9

57:                                               ; preds = %43
  br label %58

58:                                               ; preds = %16, %57, %32, %30, %28, %26, %24
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %9, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %9, align 4
  br label %12, !llvm.loop !10

62:                                               ; preds = %12
  ret void
}

define internal void @BrainfuckRecursion_Tape_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5)
  %6 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %6)
  ret void
}

define internal void @BrainfuckRecursion_free_ops(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  br label %49

9:                                                ; preds = %2
  store i32 0, ptr %5, align 4
  br label %10

10:                                               ; preds = %44, %9
  %11 = load i32, ptr %5, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %47

14:                                               ; preds = %10
  %15 = load ptr, ptr %3, align 8
  %16 = load i32, ptr %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %15, i64 %17
  %19 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = icmp eq i32 %20, 5
  br i1 %21, label %22, label %43

22:                                               ; preds = %14
  %23 = load ptr, ptr %3, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %23, i64 %25
  %27 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %43

30:                                               ; preds = %22
  %31 = load ptr, ptr %3, align 8
  %32 = load i32, ptr %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %31, i64 %33
  %35 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %3, align 8
  %38 = load i32, ptr %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds %struct.BrainfuckRecursion_Op, ptr %37, i64 %39
  %41 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Op, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  call void @BrainfuckRecursion_free_ops(ptr noundef %36, i32 noundef %42)
  br label %43

43:                                               ; preds = %30, %22, %14
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %5, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %5, align 4
  br label %10, !llvm.loop !11

47:                                               ; preds = %10
  %48 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %48)
  br label %49

49:                                               ; preds = %47, %8
  ret void
}

declare ptr @realloc(ptr noundef, i64 noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define internal void @BrainfuckRecursion_Tape_inc(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8, ptr %5, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = add i8 %11, 1
  store i8 %12, ptr %10, align 1
  ret void
}

define internal void @BrainfuckRecursion_Tape_dec(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8, ptr %5, i64 %9
  %11 = load i8, ptr %10, align 1
  %12 = add i8 %11, -1
  store i8 %12, ptr %10, align 1
  ret void
}

define internal void @BrainfuckRecursion_Tape_right(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 2
  %5 = load i32, ptr %4, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr %4, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = icmp sge i32 %9, %12
  br i1 %13, label %14, label %38

14:                                               ; preds = %1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 8
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %16, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 8
  %25 = sext i32 %24 to i64
  %26 = call ptr @realloc(ptr noundef %21, i64 noundef %25)
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %27, i32 0, i32 0
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %32, i32 0, i32 1
  %34 = load i32, ptr %33, align 8
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, ptr %31, i64 %36
  store i8 0, ptr %37, align 1
  br label %38

38:                                               ; preds = %14, %1
  ret void
}

define internal void @BrainfuckRecursion_Tape_left(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 2
  %5 = load i32, ptr %4, align 4
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, ptr %9, align 4
  br label %12

12:                                               ; preds = %7, %1
  ret void
}

define internal zeroext i8 @BrainfuckRecursion_Tape_get(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckRecursion_Tape, ptr %6, i32 0, i32 2
  %8 = load i32, ptr %7, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i8, ptr %5, i64 %9
  %11 = load i8, ptr %10, align 1
  ret i8 %11
}

declare void @free(ptr noundef)


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
