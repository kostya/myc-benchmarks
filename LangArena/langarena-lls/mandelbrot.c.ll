; ModuleID = 'c/src/mandelbrot.c'
source_filename = "c/src/mandelbrot.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.MandelbrotData = type { i64, i64, ptr, i64, i64 }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"P4\0A%d %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"CLBG::Mandelbrot\00", align 1
@stderr = external global ptr, align 8
@.str.4 = private unnamed_addr constant [53 x i8] c"Mandelbrot_grow_result: Failed to reallocate memory\0A\00", align 1

define dso_local void @Mandelbrot_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str.1)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %17, i32 0, i32 1
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %19, i32 0, i32 0
  %21 = load i64, ptr %20, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %1
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %24, i32 0, i32 0
  store i64 200, ptr %25, align 8
  br label %26

26:                                               ; preds = %23, %1
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %27, i32 0, i32 1
  %29 = load i64, ptr %28, align 8
  %30 = icmp eq i64 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %26
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %32, i32 0, i32 1
  store i64 200, ptr %33, align 8
  br label %34

34:                                               ; preds = %31, %26
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %35, i32 0, i32 3
  store i64 0, ptr %36, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @Mandelbrot_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca [256 x i8], align 16
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8, align 1
  %14 = alloca i32, align 4
  %15 = alloca double, align 8
  %16 = alloca i32, align 4
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %23 = load i32, ptr %4, align 4
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 11
  %26 = load ptr, ptr %25, align 8
  store ptr %26, ptr %5, align 8
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %27, i32 0, i32 0
  %29 = load i64, ptr %28, align 8
  %30 = trunc i64 %29 to i32
  store i32 %30, ptr %6, align 4
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %31, i32 0, i32 1
  %33 = load i64, ptr %32, align 8
  %34 = trunc i64 %33 to i32
  store i32 %34, ptr %7, align 4
  %35 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %7, align 4
  %38 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %35, i64 noundef 256, ptr noundef @.str.2, i32 noundef %36, i32 noundef %37)
  store i32 %38, ptr %9, align 4
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds [256 x i8], ptr %8, i64 0, i64 0
  %41 = load i32, ptr %9, align 4
  %42 = sext i32 %41 to i64
  call void @Mandelbrot_append(ptr noundef %39, ptr noundef %40, i64 noundef %42)
  store i32 50, ptr %10, align 4
  store double 2.000000e+00, ptr %11, align 8
  store i32 0, ptr %12, align 4
  store i8 0, ptr %13, align 1
  store i32 0, ptr %14, align 4
  br label %43

43:                                               ; preds = %137, %2
  %44 = load i32, ptr %14, align 4
  %45 = load i32, ptr %7, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %140

47:                                               ; preds = %43
  %48 = load i32, ptr %14, align 4
  %49 = sitofp i32 %48 to double
  %50 = fmul double 2.000000e+00, %49
  %51 = load i32, ptr %7, align 4
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %50, %52
  %54 = fsub double %53, 1.000000e+00
  store double %54, ptr %15, align 8
  store i32 0, ptr %16, align 4
  br label %55

55:                                               ; preds = %133, %47
  %56 = load i32, ptr %16, align 4
  %57 = load i32, ptr %6, align 4
  %58 = icmp slt i32 %56, %57
  br i1 %58, label %59, label %136

59:                                               ; preds = %55
  %60 = load i32, ptr %16, align 4
  %61 = sitofp i32 %60 to double
  %62 = fmul double 2.000000e+00, %61
  %63 = load i32, ptr %6, align 4
  %64 = sitofp i32 %63 to double
  %65 = fdiv double %62, %64
  %66 = fsub double %65, 1.500000e+00
  store double %66, ptr %17, align 8
  store double 0.000000e+00, ptr %18, align 8
  store double 0.000000e+00, ptr %19, align 8
  store double 0.000000e+00, ptr %20, align 8
  store double 0.000000e+00, ptr %21, align 8
  store i32 0, ptr %22, align 4
  br label %67

67:                                               ; preds = %77, %59
  %68 = load i32, ptr %22, align 4
  %69 = icmp slt i32 %68, 50
  br i1 %69, label %70, label %75

70:                                               ; preds = %67
  %71 = load double, ptr %20, align 8
  %72 = load double, ptr %21, align 8
  %73 = fadd double %71, %72
  %74 = fcmp ole double %73, 4.000000e+00
  br label %75

75:                                               ; preds = %70, %67
  %76 = phi i1 [ false, %67 ], [ %74, %70 ]
  br i1 %76, label %77, label %96

77:                                               ; preds = %75
  %78 = load double, ptr %18, align 8
  %79 = fmul double 2.000000e+00, %78
  %80 = load double, ptr %19, align 8
  %81 = load double, ptr %15, align 8
  %82 = call double @llvm.fmuladd.f64(double %79, double %80, double %81)
  store double %82, ptr %19, align 8
  %83 = load double, ptr %20, align 8
  %84 = load double, ptr %21, align 8
  %85 = fsub double %83, %84
  %86 = load double, ptr %17, align 8
  %87 = fadd double %85, %86
  store double %87, ptr %18, align 8
  %88 = load double, ptr %18, align 8
  %89 = load double, ptr %18, align 8
  %90 = fmul double %88, %89
  store double %90, ptr %20, align 8
  %91 = load double, ptr %19, align 8
  %92 = load double, ptr %19, align 8
  %93 = fmul double %91, %92
  store double %93, ptr %21, align 8
  %94 = load i32, ptr %22, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %22, align 4
  br label %67, !llvm.loop !6

96:                                               ; preds = %75
  %97 = load i8, ptr %13, align 1
  %98 = zext i8 %97 to i32
  %99 = shl i32 %98, 1
  %100 = trunc i32 %99 to i8
  store i8 %100, ptr %13, align 1
  %101 = load double, ptr %20, align 8
  %102 = load double, ptr %21, align 8
  %103 = fadd double %101, %102
  %104 = fcmp ole double %103, 4.000000e+00
  br i1 %104, label %105, label %110

105:                                              ; preds = %96
  %106 = load i8, ptr %13, align 1
  %107 = zext i8 %106 to i32
  %108 = or i32 %107, 1
  %109 = trunc i32 %108 to i8
  store i8 %109, ptr %13, align 1
  br label %110

110:                                              ; preds = %105, %96
  %111 = load i32, ptr %12, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %12, align 4
  %113 = load i32, ptr %12, align 4
  %114 = icmp eq i32 %113, 8
  br i1 %114, label %115, label %117

115:                                              ; preds = %110
  %116 = load ptr, ptr %5, align 8
  call void @Mandelbrot_append(ptr noundef %116, ptr noundef %13, i64 noundef 1)
  store i8 0, ptr %13, align 1
  store i32 0, ptr %12, align 4
  br label %132

117:                                              ; preds = %110
  %118 = load i32, ptr %16, align 4
  %119 = load i32, ptr %6, align 4
  %120 = sub nsw i32 %119, 1
  %121 = icmp eq i32 %118, %120
  br i1 %121, label %122, label %131

122:                                              ; preds = %117
  %123 = load i32, ptr %6, align 4
  %124 = srem i32 %123, 8
  %125 = sub nsw i32 8, %124
  %126 = load i8, ptr %13, align 1
  %127 = zext i8 %126 to i32
  %128 = shl i32 %127, %125
  %129 = trunc i32 %128 to i8
  store i8 %129, ptr %13, align 1
  %130 = load ptr, ptr %5, align 8
  call void @Mandelbrot_append(ptr noundef %130, ptr noundef %13, i64 noundef 1)
  store i8 0, ptr %13, align 1
  store i32 0, ptr %12, align 4
  br label %131

131:                                              ; preds = %122, %117
  br label %132

132:                                              ; preds = %131, %115
  br label %133

133:                                              ; preds = %132
  %134 = load i32, ptr %16, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %16, align 4
  br label %55, !llvm.loop !8

136:                                              ; preds = %55
  br label %137

137:                                              ; preds = %136
  %138 = load i32, ptr %14, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %14, align 4
  br label %43, !llvm.loop !9

140:                                              ; preds = %43
  ret void
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

define internal void @Mandelbrot_append(ptr noundef %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %6, align 8
  call void @Mandelbrot_grow_result(ptr noundef %7, i64 noundef %8)
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %12, i32 0, i32 3
  %14 = load i64, ptr %13, align 8
  %15 = getelementptr inbounds nuw i8, ptr %11, i64 %14
  %16 = load ptr, ptr %5, align 8
  %17 = load i64, ptr %6, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %15, ptr align 1 %16, i64 %17, i1 false)
  %18 = load i64, ptr %6, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %19, i32 0, i32 3
  %21 = load i64, ptr %20, align 8
  %22 = add i64 %21, %18
  store i64 %22, ptr %20, align 8
  ret void
}

declare double @llvm.fmuladd.f64(double, double, double)

define dso_local i32 @Mandelbrot_checksum(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %4, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %17

12:                                               ; preds = %1
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %13, i32 0, i32 3
  %15 = load i64, ptr %14, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %12, %1
  store i32 0, ptr %2, align 4
  br label %26

18:                                               ; preds = %12
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %22, i32 0, i32 3
  %24 = load i64, ptr %23, align 8
  %25 = call i32 @Helper_checksum_bytes(ptr noundef %21, i64 noundef %24)
  store i32 %25, ptr %2, align 4
  br label %26

26:                                               ; preds = %18, %17
  %27 = load i32, ptr %2, align 4
  ret i32 %27
}

declare i32 @Helper_checksum_bytes(ptr noundef, i64 noundef)

define dso_local void @Mandelbrot_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %15, i32 0, i32 2
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %18, i32 0, i32 3
  store i64 0, ptr %19, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %20, i32 0, i32 4
  store i64 0, ptr %21, align 8
  ret void
}

declare void @free(ptr noundef)

define dso_local ptr @Mandelbrot_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = call i64 @Helper_config_i64(ptr noundef @.str.3, ptr noundef @.str)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %6, i32 0, i32 0
  store i64 %5, ptr %7, align 8
  %8 = call i64 @Helper_config_i64(ptr noundef @.str.3, ptr noundef @.str.1)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %9, i32 0, i32 1
  store i64 %8, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %11, i32 0, i32 0
  %13 = load i64, ptr %12, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %18

15:                                               ; preds = %0
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %16, i32 0, i32 0
  store i64 200, ptr %17, align 8
  br label %18

18:                                               ; preds = %15, %0
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %19, i32 0, i32 1
  %21 = load i64, ptr %20, align 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %26

23:                                               ; preds = %18
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %24, i32 0, i32 1
  store i64 200, ptr %25, align 8
  br label %26

26:                                               ; preds = %23, %18
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %27, i32 0, i32 2
  store ptr null, ptr %28, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %29, i32 0, i32 3
  store i64 0, ptr %30, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %31, i32 0, i32 4
  store i64 0, ptr %32, align 8
  %33 = load ptr, ptr %2, align 8
  %34 = load ptr, ptr %1, align 8
  %35 = getelementptr inbounds nuw %struct.Benchmark, ptr %34, i32 0, i32 11
  store ptr %33, ptr %35, align 8
  %36 = load ptr, ptr %1, align 8
  %37 = getelementptr inbounds nuw %struct.Benchmark, ptr %36, i32 0, i32 3
  store ptr @Mandelbrot_prepare, ptr %37, align 8
  %38 = load ptr, ptr %1, align 8
  %39 = getelementptr inbounds nuw %struct.Benchmark, ptr %38, i32 0, i32 4
  store ptr @Mandelbrot_run, ptr %39, align 8
  %40 = load ptr, ptr %1, align 8
  %41 = getelementptr inbounds nuw %struct.Benchmark, ptr %40, i32 0, i32 7
  store ptr @Mandelbrot_checksum, ptr %41, align 8
  %42 = load ptr, ptr %1, align 8
  %43 = getelementptr inbounds nuw %struct.Benchmark, ptr %42, i32 0, i32 10
  store ptr @Mandelbrot_cleanup, ptr %43, align 8
  %44 = load ptr, ptr %1, align 8
  ret ptr %44
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define internal void @Mandelbrot_grow_result(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %6, i32 0, i32 4
  %8 = load i64, ptr %7, align 8
  store i64 %8, ptr %5, align 8
  br label %9

9:                                                ; preds = %24, %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %10, i32 0, i32 3
  %12 = load i64, ptr %11, align 8
  %13 = load i64, ptr %4, align 8
  %14 = add i64 %12, %13
  %15 = load i64, ptr %5, align 8
  %16 = icmp uge i64 %14, %15
  br i1 %16, label %17, label %26

17:                                               ; preds = %9
  %18 = load i64, ptr %5, align 8
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %17
  %21 = load i64, ptr %5, align 8
  %22 = mul i64 %21, 2
  br label %24

23:                                               ; preds = %17
  br label %24

24:                                               ; preds = %23, %20
  %25 = phi i64 [ %22, %20 ], [ 1024, %23 ]
  store i64 %25, ptr %5, align 8
  br label %9, !llvm.loop !10

26:                                               ; preds = %9
  %27 = load i64, ptr %5, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %28, i32 0, i32 4
  %30 = load i64, ptr %29, align 8
  %31 = icmp ugt i64 %27, %30
  br i1 %31, label %32, label %51

32:                                               ; preds = %26
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = load i64, ptr %5, align 8
  %37 = call ptr @realloc(ptr noundef %35, i64 noundef %36)
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %38, i32 0, i32 2
  store ptr %37, ptr %39, align 8
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %40, i32 0, i32 2
  %42 = load ptr, ptr %41, align 8
  %43 = icmp ne ptr %42, null
  br i1 %43, label %47, label %44

44:                                               ; preds = %32
  %45 = load ptr, ptr @stderr, align 8
  %46 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %45, ptr noundef @.str.4)
  br label %51

47:                                               ; preds = %32
  %48 = load i64, ptr %5, align 8
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.MandelbrotData, ptr %49, i32 0, i32 4
  store i64 %48, ptr %50, align 8
  br label %51

51:                                               ; preds = %44, %47, %26
  ret void
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

declare ptr @realloc(ptr noundef, i64 noundef)

declare i32 @fprintf(ptr noundef, ptr noundef, ...)


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
