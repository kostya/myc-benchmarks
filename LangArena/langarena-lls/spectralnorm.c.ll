; ModuleID = 'c/src/spectralnorm.c'
source_filename = "c/src/spectralnorm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.SpectralnormData = type { i64, ptr, ptr }

@.str = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"CLBG::Spectralnorm\00", align 1

define dso_local void @Spectralnorm_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i64 @Helper_config_i64(ptr noundef %10, ptr noundef @.str)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %12, i32 0, i32 0
  store i64 %11, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = icmp sle i64 %16, 0
  br i1 %17, label %18, label %21

18:                                               ; preds = %1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %19, i32 0, i32 0
  store i64 100, ptr %20, align 8
  br label %21

21:                                               ; preds = %18, %1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %22, i32 0, i32 0
  %24 = load i64, ptr %23, align 8
  %25 = mul i64 %24, 8
  %26 = call noalias ptr @malloc(i64 noundef %25)
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %29, i32 0, i32 0
  %31 = load i64, ptr %30, align 8
  %32 = mul i64 %31, 8
  %33 = call noalias ptr @malloc(i64 noundef %32)
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %34, i32 0, i32 2
  store ptr %33, ptr %35, align 8
  store i64 0, ptr %4, align 8
  br label %36

36:                                               ; preds = %53, %21
  %37 = load i64, ptr %4, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %38, i32 0, i32 0
  %40 = load i64, ptr %39, align 8
  %41 = icmp slt i64 %37, %40
  br i1 %41, label %42, label %56

42:                                               ; preds = %36
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = load i64, ptr %4, align 8
  %47 = getelementptr inbounds double, ptr %45, i64 %46
  store double 1.000000e+00, ptr %47, align 8
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %48, i32 0, i32 2
  %50 = load ptr, ptr %49, align 8
  %51 = load i64, ptr %4, align 8
  %52 = getelementptr inbounds double, ptr %50, i64 %51
  store double 1.000000e+00, ptr %52, align 8
  br label %53

53:                                               ; preds = %42
  %54 = load i64, ptr %4, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, ptr %4, align 8
  br label %36, !llvm.loop !6

56:                                               ; preds = %36
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define dso_local void @Spectralnorm_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 11
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %15, i32 0, i32 0
  %17 = load i64, ptr %16, align 8
  %18 = call ptr @eval_AtA_times_u(ptr noundef %14, i64 noundef %17)
  store ptr %18, ptr %6, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %20, i32 0, i32 0
  %22 = load i64, ptr %21, align 8
  %23 = call ptr @eval_AtA_times_u(ptr noundef %19, i64 noundef %22)
  store ptr %23, ptr %7, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %26)
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  call void @free(ptr noundef %29)
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %31, i32 0, i32 1
  store ptr %30, ptr %32, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %34, i32 0, i32 2
  store ptr %33, ptr %35, align 8
  ret void
}

define internal ptr @eval_AtA_times_u(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load i64, ptr %4, align 8
  %9 = call ptr @eval_A_times_u(ptr noundef %7, i64 noundef %8)
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = load i64, ptr %4, align 8
  %12 = call ptr @eval_At_times_u(ptr noundef %10, i64 noundef %11)
  store ptr %12, ptr %6, align 8
  %13 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %13)
  %14 = load ptr, ptr %6, align 8
  ret ptr %14
}

declare void @free(ptr noundef)

define dso_local i32 @Spectralnorm_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %3, align 8
  store double 0.000000e+00, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %11

11:                                               ; preds = %46, %1
  %12 = load i64, ptr %6, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = icmp slt i64 %12, %15
  br i1 %16, label %17, label %49

17:                                               ; preds = %11
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %18, i32 0, i32 1
  %20 = load ptr, ptr %19, align 8
  %21 = load i64, ptr %6, align 8
  %22 = getelementptr inbounds double, ptr %20, i64 %21
  %23 = load double, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = load i64, ptr %6, align 8
  %28 = getelementptr inbounds double, ptr %26, i64 %27
  %29 = load double, ptr %28, align 8
  %30 = load double, ptr %4, align 8
  %31 = call double @llvm.fmuladd.f64(double %23, double %29, double %30)
  store double %31, ptr %4, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %32, i32 0, i32 2
  %34 = load ptr, ptr %33, align 8
  %35 = load i64, ptr %6, align 8
  %36 = getelementptr inbounds double, ptr %34, i64 %35
  %37 = load double, ptr %36, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = load i64, ptr %6, align 8
  %42 = getelementptr inbounds double, ptr %40, i64 %41
  %43 = load double, ptr %42, align 8
  %44 = load double, ptr %5, align 8
  %45 = call double @llvm.fmuladd.f64(double %37, double %43, double %44)
  store double %45, ptr %5, align 8
  br label %46

46:                                               ; preds = %17
  %47 = load i64, ptr %6, align 8
  %48 = add nsw i64 %47, 1
  store i64 %48, ptr %6, align 8
  br label %11, !llvm.loop !8

49:                                               ; preds = %11
  %50 = load double, ptr %4, align 8
  %51 = load double, ptr %5, align 8
  %52 = fdiv double %50, %51
  %53 = call double @sqrt(double noundef %52)
  store double %53, ptr %7, align 8
  %54 = load double, ptr %7, align 8
  %55 = call i32 @Helper_checksum_f64(double noundef %54)
  ret i32 %55
}

declare double @llvm.fmuladd.f64(double, double, double)

declare double @sqrt(double noundef)

declare i32 @Helper_checksum_f64(double noundef)

define dso_local void @Spectralnorm_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.SpectralnormData, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  ret void
}

define dso_local ptr @Spectralnorm_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 24, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @Spectralnorm_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Spectralnorm_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Spectralnorm_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Spectralnorm_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define internal ptr @eval_A_times_u(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %9 = load i64, ptr %4, align 8
  %10 = mul i64 %9, 8
  %11 = call noalias ptr @malloc(i64 noundef %10)
  store ptr %11, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %12

12:                                               ; preds = %39, %2
  %13 = load i64, ptr %6, align 8
  %14 = load i64, ptr %4, align 8
  %15 = icmp slt i64 %13, %14
  br i1 %15, label %16, label %42

16:                                               ; preds = %12
  store double 0.000000e+00, ptr %7, align 8
  store i64 0, ptr %8, align 8
  br label %17

17:                                               ; preds = %31, %16
  %18 = load i64, ptr %8, align 8
  %19 = load i64, ptr %4, align 8
  %20 = icmp slt i64 %18, %19
  br i1 %20, label %21, label %34

21:                                               ; preds = %17
  %22 = load i64, ptr %6, align 8
  %23 = load i64, ptr %8, align 8
  %24 = call double @eval_A(i64 noundef %22, i64 noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = load i64, ptr %8, align 8
  %27 = getelementptr inbounds double, ptr %25, i64 %26
  %28 = load double, ptr %27, align 8
  %29 = load double, ptr %7, align 8
  %30 = call double @llvm.fmuladd.f64(double %24, double %28, double %29)
  store double %30, ptr %7, align 8
  br label %31

31:                                               ; preds = %21
  %32 = load i64, ptr %8, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, ptr %8, align 8
  br label %17, !llvm.loop !9

34:                                               ; preds = %17
  %35 = load double, ptr %7, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = load i64, ptr %6, align 8
  %38 = getelementptr inbounds double, ptr %36, i64 %37
  store double %35, ptr %38, align 8
  br label %39

39:                                               ; preds = %34
  %40 = load i64, ptr %6, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, ptr %6, align 8
  br label %12, !llvm.loop !10

42:                                               ; preds = %12
  %43 = load ptr, ptr %5, align 8
  ret ptr %43
}

define internal ptr @eval_At_times_u(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %9 = load i64, ptr %4, align 8
  %10 = mul i64 %9, 8
  %11 = call noalias ptr @malloc(i64 noundef %10)
  store ptr %11, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %12

12:                                               ; preds = %39, %2
  %13 = load i64, ptr %6, align 8
  %14 = load i64, ptr %4, align 8
  %15 = icmp slt i64 %13, %14
  br i1 %15, label %16, label %42

16:                                               ; preds = %12
  store double 0.000000e+00, ptr %7, align 8
  store i64 0, ptr %8, align 8
  br label %17

17:                                               ; preds = %31, %16
  %18 = load i64, ptr %8, align 8
  %19 = load i64, ptr %4, align 8
  %20 = icmp slt i64 %18, %19
  br i1 %20, label %21, label %34

21:                                               ; preds = %17
  %22 = load i64, ptr %8, align 8
  %23 = load i64, ptr %6, align 8
  %24 = call double @eval_A(i64 noundef %22, i64 noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = load i64, ptr %8, align 8
  %27 = getelementptr inbounds double, ptr %25, i64 %26
  %28 = load double, ptr %27, align 8
  %29 = load double, ptr %7, align 8
  %30 = call double @llvm.fmuladd.f64(double %24, double %28, double %29)
  store double %30, ptr %7, align 8
  br label %31

31:                                               ; preds = %21
  %32 = load i64, ptr %8, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, ptr %8, align 8
  br label %17, !llvm.loop !11

34:                                               ; preds = %17
  %35 = load double, ptr %7, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = load i64, ptr %6, align 8
  %38 = getelementptr inbounds double, ptr %36, i64 %37
  store double %35, ptr %38, align 8
  br label %39

39:                                               ; preds = %34
  %40 = load i64, ptr %6, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, ptr %6, align 8
  br label %12, !llvm.loop !12

42:                                               ; preds = %12
  %43 = load ptr, ptr %5, align 8
  ret ptr %43
}

define internal double @eval_A(i64 noundef %0, i64 noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %3, align 8
  %6 = load i64, ptr %4, align 8
  %7 = add nsw i64 %5, %6
  %8 = sitofp i64 %7 to double
  %9 = load i64, ptr %3, align 8
  %10 = load i64, ptr %4, align 8
  %11 = add nsw i64 %9, %10
  %12 = sitofp i64 %11 to double
  %13 = fadd double %12, 1.000000e+00
  %14 = fmul double %8, %13
  %15 = fdiv double %14, 2.000000e+00
  %16 = load i64, ptr %3, align 8
  %17 = sitofp i64 %16 to double
  %18 = fadd double %15, %17
  %19 = fadd double %18, 1.000000e+00
  %20 = fdiv double 1.000000e+00, %19
  ret double %20
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
