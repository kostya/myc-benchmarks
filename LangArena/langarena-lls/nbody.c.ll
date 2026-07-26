; ModuleID = 'c/src/nbody.c'
source_filename = "c/src/nbody.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.NbodyData = type { i64, ptr, i64, double }
%struct.NbodyPlanet = type { double, double, double, double, double, double, double }

@.str = private unnamed_addr constant [12 x i8] c"CLBG::Nbody\00", align 1

define dso_local void @Nbody_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.NbodyData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %41, label %11

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.NbodyData, ptr %12, i32 0, i32 2
  store i64 5, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.NbodyData, ptr %14, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = mul i64 %16, 56
  %18 = call noalias ptr @malloc(i64 noundef %17)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.NbodyData, ptr %19, i32 0, i32 1
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.NbodyData, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = getelementptr inbounds %struct.NbodyPlanet, ptr %23, i64 0
  call void @Nbody_Planet_init(ptr noundef %24, double noundef 0.000000e+00, double noundef 0.000000e+00, double noundef 0.000000e+00, double noundef 0.000000e+00, double noundef 0.000000e+00, double noundef 0.000000e+00, double noundef 1.000000e+00)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.NbodyData, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds %struct.NbodyPlanet, ptr %27, i64 1
  call void @Nbody_Planet_init(ptr noundef %28, double noundef 0x40135DA0343CD92C, double noundef 0xBFF290ABC01FDB7C, double noundef 0xBFBA86F96C25EBF0, double noundef 0x3F5B32DDB8EC9209, double noundef 0x3F7F88FF93F670B6, double noundef 0xBF12199946DEBD80, double noundef 0x3F4F49601333C135)
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.NbodyData, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds %struct.NbodyPlanet, ptr %31, i64 2
  call void @Nbody_Planet_init(ptr noundef %32, double noundef 0x4020AFCDC332CA67, double noundef 0x40107FCB31DE01B0, double noundef 0xBFD9D353E1EB467C, double noundef 0xBF66ABB60A8E1D76, double noundef 0x3F747956257578B8, double noundef 0x3EF829379CAD4AC0, double noundef 0x3F32BC5EEFF5E6F8)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.NbodyData, ptr %33, i32 0, i32 1
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds %struct.NbodyPlanet, ptr %35, i64 3
  call void @Nbody_Planet_init(ptr noundef %36, double noundef 0x4029C9EACEA7D9CF, double noundef 0xC02E38E8D626667E, double noundef 0xBFCC9557BE257DA0, double noundef 0x3F6849383E87D954, double noundef 0x3F637C044AC0ACE1, double noundef 0xBEFF1983FEDBFAA0, double noundef 0x3F06E44607A13BD6)
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.NbodyData, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds %struct.NbodyPlanet, ptr %39, i64 4
  call void @Nbody_Planet_init(ptr noundef %40, double noundef 0x402EC267A905572A, double noundef 0xC039EB5833C8A220, double noundef 0x3FC6F1F393ABE540, double noundef 0x3F65F5C9E51B4320, double noundef 0x3F5AAD5736999D88, double noundef 0xBF18F2070B7F9750, double noundef 0x3F0B0213CA2D0EEC)
  br label %41

41:                                               ; preds = %11, %1
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.NbodyData, ptr %42, i32 0, i32 1
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.NbodyData, ptr %45, i32 0, i32 2
  %47 = load i64, ptr %46, align 8
  call void @Nbody_offset_momentum(ptr noundef %44, i64 noundef %47)
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds nuw %struct.NbodyData, ptr %48, i32 0, i32 1
  %50 = load ptr, ptr %49, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.NbodyData, ptr %51, i32 0, i32 2
  %53 = load i64, ptr %52, align 8
  %54 = call double @Nbody_energy(ptr noundef %50, i64 noundef %53)
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds nuw %struct.NbodyData, ptr %55, i32 0, i32 3
  store double %54, ptr %56, align 8
  ret void
}

declare noalias ptr @malloc(i64 noundef)

define internal void @Nbody_Planet_init(ptr noundef %0, double noundef %1, double noundef %2, double noundef %3, double noundef %4, double noundef %5, double noundef %6, double noundef %7) {
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  store ptr %0, ptr %9, align 8
  store double %1, ptr %10, align 8
  store double %2, ptr %11, align 8
  store double %3, ptr %12, align 8
  store double %4, ptr %13, align 8
  store double %5, ptr %14, align 8
  store double %6, ptr %15, align 8
  store double %7, ptr %16, align 8
  %17 = load double, ptr %10, align 8
  %18 = load ptr, ptr %9, align 8
  %19 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %18, i32 0, i32 0
  store double %17, ptr %19, align 8
  %20 = load double, ptr %11, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %21, i32 0, i32 1
  store double %20, ptr %22, align 8
  %23 = load double, ptr %12, align 8
  %24 = load ptr, ptr %9, align 8
  %25 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %24, i32 0, i32 2
  store double %23, ptr %25, align 8
  %26 = load double, ptr %13, align 8
  %27 = fmul double %26, 3.652400e+02
  %28 = load ptr, ptr %9, align 8
  %29 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %28, i32 0, i32 3
  store double %27, ptr %29, align 8
  %30 = load double, ptr %14, align 8
  %31 = fmul double %30, 3.652400e+02
  %32 = load ptr, ptr %9, align 8
  %33 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %32, i32 0, i32 4
  store double %31, ptr %33, align 8
  %34 = load double, ptr %15, align 8
  %35 = fmul double %34, 3.652400e+02
  %36 = load ptr, ptr %9, align 8
  %37 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %36, i32 0, i32 5
  store double %35, ptr %37, align 8
  %38 = load double, ptr %16, align 8
  %39 = fmul double %38, 0x4043BD3CC9BE45DE
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %40, i32 0, i32 6
  store double %39, ptr %41, align 8
  ret void
}

define internal void @Nbody_offset_momentum(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store double 0.000000e+00, ptr %6, align 8
  store double 0.000000e+00, ptr %7, align 8
  store i64 0, ptr %8, align 8
  br label %11

11:                                               ; preds = %43, %2
  %12 = load i64, ptr %8, align 8
  %13 = load i64, ptr %4, align 8
  %14 = icmp slt i64 %12, %13
  br i1 %14, label %15, label %46

15:                                               ; preds = %11
  %16 = load ptr, ptr %3, align 8
  %17 = load i64, ptr %8, align 8
  %18 = getelementptr inbounds %struct.NbodyPlanet, ptr %16, i64 %17
  store ptr %18, ptr %9, align 8
  %19 = load ptr, ptr %9, align 8
  %20 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %19, i32 0, i32 3
  %21 = load double, ptr %20, align 8
  %22 = load ptr, ptr %9, align 8
  %23 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %22, i32 0, i32 6
  %24 = load double, ptr %23, align 8
  %25 = load double, ptr %5, align 8
  %26 = call double @llvm.fmuladd.f64(double %21, double %24, double %25)
  store double %26, ptr %5, align 8
  %27 = load ptr, ptr %9, align 8
  %28 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %27, i32 0, i32 4
  %29 = load double, ptr %28, align 8
  %30 = load ptr, ptr %9, align 8
  %31 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %30, i32 0, i32 6
  %32 = load double, ptr %31, align 8
  %33 = load double, ptr %6, align 8
  %34 = call double @llvm.fmuladd.f64(double %29, double %32, double %33)
  store double %34, ptr %6, align 8
  %35 = load ptr, ptr %9, align 8
  %36 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %35, i32 0, i32 5
  %37 = load double, ptr %36, align 8
  %38 = load ptr, ptr %9, align 8
  %39 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %38, i32 0, i32 6
  %40 = load double, ptr %39, align 8
  %41 = load double, ptr %7, align 8
  %42 = call double @llvm.fmuladd.f64(double %37, double %40, double %41)
  store double %42, ptr %7, align 8
  br label %43

43:                                               ; preds = %15
  %44 = load i64, ptr %8, align 8
  %45 = add nsw i64 %44, 1
  store i64 %45, ptr %8, align 8
  br label %11, !llvm.loop !6

46:                                               ; preds = %11
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds %struct.NbodyPlanet, ptr %47, i64 0
  store ptr %48, ptr %10, align 8
  %49 = load double, ptr %5, align 8
  %50 = fneg double %49
  %51 = fdiv double %50, 0x4043BD3CC9BE45DE
  %52 = load ptr, ptr %10, align 8
  %53 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %52, i32 0, i32 3
  store double %51, ptr %53, align 8
  %54 = load double, ptr %6, align 8
  %55 = fneg double %54
  %56 = fdiv double %55, 0x4043BD3CC9BE45DE
  %57 = load ptr, ptr %10, align 8
  %58 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %57, i32 0, i32 4
  store double %56, ptr %58, align 8
  %59 = load double, ptr %7, align 8
  %60 = fneg double %59
  %61 = fdiv double %60, 0x4043BD3CC9BE45DE
  %62 = load ptr, ptr %10, align 8
  %63 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %62, i32 0, i32 5
  store double %61, ptr %63, align 8
  ret void
}

define internal double @Nbody_energy(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca double, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store double 0.000000e+00, ptr %5, align 8
  store i64 0, ptr %6, align 8
  br label %14

14:                                               ; preds = %105, %2
  %15 = load i64, ptr %6, align 8
  %16 = load i64, ptr %4, align 8
  %17 = icmp slt i64 %15, %16
  br i1 %17, label %18, label %108

18:                                               ; preds = %14
  %19 = load ptr, ptr %3, align 8
  %20 = load i64, ptr %6, align 8
  %21 = getelementptr inbounds %struct.NbodyPlanet, ptr %19, i64 %20
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %22, i32 0, i32 6
  %24 = load double, ptr %23, align 8
  %25 = fmul double 5.000000e-01, %24
  %26 = load ptr, ptr %7, align 8
  %27 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %26, i32 0, i32 3
  %28 = load double, ptr %27, align 8
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %29, i32 0, i32 3
  %31 = load double, ptr %30, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %32, i32 0, i32 4
  %34 = load double, ptr %33, align 8
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %35, i32 0, i32 4
  %37 = load double, ptr %36, align 8
  %38 = fmul double %34, %37
  %39 = call double @llvm.fmuladd.f64(double %28, double %31, double %38)
  %40 = load ptr, ptr %7, align 8
  %41 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %40, i32 0, i32 5
  %42 = load double, ptr %41, align 8
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %43, i32 0, i32 5
  %45 = load double, ptr %44, align 8
  %46 = call double @llvm.fmuladd.f64(double %42, double %45, double %39)
  %47 = load double, ptr %5, align 8
  %48 = call double @llvm.fmuladd.f64(double %25, double %46, double %47)
  store double %48, ptr %5, align 8
  %49 = load i64, ptr %6, align 8
  %50 = add nsw i64 %49, 1
  store i64 %50, ptr %8, align 8
  br label %51

51:                                               ; preds = %101, %18
  %52 = load i64, ptr %8, align 8
  %53 = load i64, ptr %4, align 8
  %54 = icmp slt i64 %52, %53
  br i1 %54, label %55, label %104

55:                                               ; preds = %51
  %56 = load ptr, ptr %3, align 8
  %57 = load i64, ptr %8, align 8
  %58 = getelementptr inbounds %struct.NbodyPlanet, ptr %56, i64 %57
  store ptr %58, ptr %9, align 8
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %59, i32 0, i32 0
  %61 = load double, ptr %60, align 8
  %62 = load ptr, ptr %9, align 8
  %63 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %62, i32 0, i32 0
  %64 = load double, ptr %63, align 8
  %65 = fsub double %61, %64
  store double %65, ptr %10, align 8
  %66 = load ptr, ptr %7, align 8
  %67 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %66, i32 0, i32 1
  %68 = load double, ptr %67, align 8
  %69 = load ptr, ptr %9, align 8
  %70 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %69, i32 0, i32 1
  %71 = load double, ptr %70, align 8
  %72 = fsub double %68, %71
  store double %72, ptr %11, align 8
  %73 = load ptr, ptr %7, align 8
  %74 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %73, i32 0, i32 2
  %75 = load double, ptr %74, align 8
  %76 = load ptr, ptr %9, align 8
  %77 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %76, i32 0, i32 2
  %78 = load double, ptr %77, align 8
  %79 = fsub double %75, %78
  store double %79, ptr %12, align 8
  %80 = load double, ptr %10, align 8
  %81 = load double, ptr %10, align 8
  %82 = load double, ptr %11, align 8
  %83 = load double, ptr %11, align 8
  %84 = fmul double %82, %83
  %85 = call double @llvm.fmuladd.f64(double %80, double %81, double %84)
  %86 = load double, ptr %12, align 8
  %87 = load double, ptr %12, align 8
  %88 = call double @llvm.fmuladd.f64(double %86, double %87, double %85)
  %89 = call double @sqrt(double noundef %88)
  store double %89, ptr %13, align 8
  %90 = load ptr, ptr %7, align 8
  %91 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %90, i32 0, i32 6
  %92 = load double, ptr %91, align 8
  %93 = load ptr, ptr %9, align 8
  %94 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %93, i32 0, i32 6
  %95 = load double, ptr %94, align 8
  %96 = fmul double %92, %95
  %97 = load double, ptr %13, align 8
  %98 = fdiv double %96, %97
  %99 = load double, ptr %5, align 8
  %100 = fsub double %99, %98
  store double %100, ptr %5, align 8
  br label %101

101:                                              ; preds = %55
  %102 = load i64, ptr %8, align 8
  %103 = add nsw i64 %102, 1
  store i64 %103, ptr %8, align 8
  br label %51, !llvm.loop !8

104:                                              ; preds = %51
  br label %105

105:                                              ; preds = %104
  %106 = load i64, ptr %6, align 8
  %107 = add nsw i64 %106, 1
  store i64 %107, ptr %6, align 8
  br label %14, !llvm.loop !9

108:                                              ; preds = %14
  %109 = load double, ptr %5, align 8
  ret double %109
}

define dso_local void @Nbody_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca double, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 11
  %13 = load ptr, ptr %12, align 8
  store ptr %13, ptr %5, align 8
  store double 1.000000e-02, ptr %6, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.NbodyData, ptr %14, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  %17 = trunc i64 %16 to i32
  store i32 %17, ptr %7, align 4
  store i32 0, ptr %8, align 4
  br label %18

18:                                               ; preds = %41, %2
  %19 = load i32, ptr %8, align 4
  %20 = icmp slt i32 %19, 1000
  br i1 %20, label %21, label %44

21:                                               ; preds = %18
  store i32 0, ptr %9, align 4
  br label %22

22:                                               ; preds = %37, %21
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %7, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %40

26:                                               ; preds = %22
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.NbodyData, ptr %27, i32 0, i32 1
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds nuw %struct.NbodyData, ptr %30, i32 0, i32 2
  %32 = load i64, ptr %31, align 8
  %33 = load double, ptr %6, align 8
  %34 = load i32, ptr %9, align 4
  %35 = add nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  call void @Nbody_Planet_move_from_i(ptr noundef %29, i64 noundef %32, double noundef %33, i64 noundef %36)
  br label %37

37:                                               ; preds = %26
  %38 = load i32, ptr %9, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %9, align 4
  br label %22, !llvm.loop !10

40:                                               ; preds = %22
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %8, align 4
  br label %18, !llvm.loop !11

44:                                               ; preds = %18
  ret void
}

define internal void @Nbody_Planet_move_from_i(ptr noundef %0, i64 noundef %1, double noundef %2, i64 noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca double, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store double %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = load i64, ptr %8, align 8
  %22 = sub nsw i64 %21, 1
  %23 = getelementptr inbounds %struct.NbodyPlanet, ptr %20, i64 %22
  store ptr %23, ptr %9, align 8
  %24 = load i64, ptr %8, align 8
  store i64 %24, ptr %10, align 8
  br label %25

25:                                               ; preds = %121, %4
  %26 = load i64, ptr %10, align 8
  %27 = load i64, ptr %6, align 8
  %28 = icmp slt i64 %26, %27
  br i1 %28, label %29, label %124

29:                                               ; preds = %25
  %30 = load ptr, ptr %5, align 8
  %31 = load i64, ptr %10, align 8
  %32 = getelementptr inbounds %struct.NbodyPlanet, ptr %30, i64 %31
  store ptr %32, ptr %11, align 8
  %33 = load ptr, ptr %9, align 8
  %34 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %33, i32 0, i32 0
  %35 = load double, ptr %34, align 8
  %36 = load ptr, ptr %11, align 8
  %37 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %36, i32 0, i32 0
  %38 = load double, ptr %37, align 8
  %39 = fsub double %35, %38
  store double %39, ptr %12, align 8
  %40 = load ptr, ptr %9, align 8
  %41 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %40, i32 0, i32 1
  %42 = load double, ptr %41, align 8
  %43 = load ptr, ptr %11, align 8
  %44 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %43, i32 0, i32 1
  %45 = load double, ptr %44, align 8
  %46 = fsub double %42, %45
  store double %46, ptr %13, align 8
  %47 = load ptr, ptr %9, align 8
  %48 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %47, i32 0, i32 2
  %49 = load double, ptr %48, align 8
  %50 = load ptr, ptr %11, align 8
  %51 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %50, i32 0, i32 2
  %52 = load double, ptr %51, align 8
  %53 = fsub double %49, %52
  store double %53, ptr %14, align 8
  %54 = load double, ptr %12, align 8
  %55 = load double, ptr %12, align 8
  %56 = load double, ptr %13, align 8
  %57 = load double, ptr %13, align 8
  %58 = fmul double %56, %57
  %59 = call double @llvm.fmuladd.f64(double %54, double %55, double %58)
  %60 = load double, ptr %14, align 8
  %61 = load double, ptr %14, align 8
  %62 = call double @llvm.fmuladd.f64(double %60, double %61, double %59)
  store double %62, ptr %15, align 8
  %63 = load double, ptr %15, align 8
  %64 = call double @sqrt(double noundef %63)
  store double %64, ptr %16, align 8
  %65 = load double, ptr %7, align 8
  %66 = load double, ptr %16, align 8
  %67 = load double, ptr %16, align 8
  %68 = fmul double %66, %67
  %69 = load double, ptr %16, align 8
  %70 = fmul double %68, %69
  %71 = fdiv double %65, %70
  store double %71, ptr %17, align 8
  %72 = load ptr, ptr %9, align 8
  %73 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %72, i32 0, i32 6
  %74 = load double, ptr %73, align 8
  %75 = load double, ptr %17, align 8
  %76 = fmul double %74, %75
  store double %76, ptr %18, align 8
  %77 = load ptr, ptr %11, align 8
  %78 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %77, i32 0, i32 6
  %79 = load double, ptr %78, align 8
  %80 = load double, ptr %17, align 8
  %81 = fmul double %79, %80
  store double %81, ptr %19, align 8
  %82 = load double, ptr %12, align 8
  %83 = load double, ptr %19, align 8
  %84 = load ptr, ptr %9, align 8
  %85 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %84, i32 0, i32 3
  %86 = load double, ptr %85, align 8
  %87 = fneg double %82
  %88 = call double @llvm.fmuladd.f64(double %87, double %83, double %86)
  store double %88, ptr %85, align 8
  %89 = load double, ptr %13, align 8
  %90 = load double, ptr %19, align 8
  %91 = load ptr, ptr %9, align 8
  %92 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %91, i32 0, i32 4
  %93 = load double, ptr %92, align 8
  %94 = fneg double %89
  %95 = call double @llvm.fmuladd.f64(double %94, double %90, double %93)
  store double %95, ptr %92, align 8
  %96 = load double, ptr %14, align 8
  %97 = load double, ptr %19, align 8
  %98 = load ptr, ptr %9, align 8
  %99 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %98, i32 0, i32 5
  %100 = load double, ptr %99, align 8
  %101 = fneg double %96
  %102 = call double @llvm.fmuladd.f64(double %101, double %97, double %100)
  store double %102, ptr %99, align 8
  %103 = load double, ptr %12, align 8
  %104 = load double, ptr %18, align 8
  %105 = load ptr, ptr %11, align 8
  %106 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %105, i32 0, i32 3
  %107 = load double, ptr %106, align 8
  %108 = call double @llvm.fmuladd.f64(double %103, double %104, double %107)
  store double %108, ptr %106, align 8
  %109 = load double, ptr %13, align 8
  %110 = load double, ptr %18, align 8
  %111 = load ptr, ptr %11, align 8
  %112 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %111, i32 0, i32 4
  %113 = load double, ptr %112, align 8
  %114 = call double @llvm.fmuladd.f64(double %109, double %110, double %113)
  store double %114, ptr %112, align 8
  %115 = load double, ptr %14, align 8
  %116 = load double, ptr %18, align 8
  %117 = load ptr, ptr %11, align 8
  %118 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %117, i32 0, i32 5
  %119 = load double, ptr %118, align 8
  %120 = call double @llvm.fmuladd.f64(double %115, double %116, double %119)
  store double %120, ptr %118, align 8
  br label %121

121:                                              ; preds = %29
  %122 = load i64, ptr %10, align 8
  %123 = add nsw i64 %122, 1
  store i64 %123, ptr %10, align 8
  br label %25, !llvm.loop !12

124:                                              ; preds = %25
  %125 = load double, ptr %7, align 8
  %126 = load ptr, ptr %9, align 8
  %127 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %126, i32 0, i32 3
  %128 = load double, ptr %127, align 8
  %129 = load ptr, ptr %9, align 8
  %130 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %129, i32 0, i32 0
  %131 = load double, ptr %130, align 8
  %132 = call double @llvm.fmuladd.f64(double %125, double %128, double %131)
  store double %132, ptr %130, align 8
  %133 = load double, ptr %7, align 8
  %134 = load ptr, ptr %9, align 8
  %135 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %134, i32 0, i32 4
  %136 = load double, ptr %135, align 8
  %137 = load ptr, ptr %9, align 8
  %138 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %137, i32 0, i32 1
  %139 = load double, ptr %138, align 8
  %140 = call double @llvm.fmuladd.f64(double %133, double %136, double %139)
  store double %140, ptr %138, align 8
  %141 = load double, ptr %7, align 8
  %142 = load ptr, ptr %9, align 8
  %143 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %142, i32 0, i32 5
  %144 = load double, ptr %143, align 8
  %145 = load ptr, ptr %9, align 8
  %146 = getelementptr inbounds nuw %struct.NbodyPlanet, ptr %145, i32 0, i32 2
  %147 = load double, ptr %146, align 8
  %148 = call double @llvm.fmuladd.f64(double %141, double %144, double %147)
  store double %148, ptr %146, align 8
  ret void
}

define dso_local i32 @Nbody_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca double, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.NbodyData, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.NbodyData, ptr %13, i32 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = call double @Nbody_energy(ptr noundef %12, i64 noundef %15)
  store double %16, ptr %4, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.NbodyData, ptr %17, i32 0, i32 3
  %19 = load double, ptr %18, align 8
  %20 = call i32 @Helper_checksum_f64(double noundef %19)
  store i32 %20, ptr %5, align 4
  %21 = load double, ptr %4, align 8
  %22 = call i32 @Helper_checksum_f64(double noundef %21)
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %5, align 4
  %24 = zext i32 %23 to i64
  %25 = shl i64 %24, 5
  %26 = load i32, ptr %6, align 4
  %27 = zext i32 %26 to i64
  %28 = and i64 %25, %27
  %29 = trunc i64 %28 to i32
  ret i32 %29
}

declare i32 @Helper_checksum_f64(double noundef)

define dso_local void @Nbody_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %21

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.NbodyData, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.NbodyData, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.NbodyData, ptr %18, i32 0, i32 1
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %9
  br label %21

21:                                               ; preds = %20, %1
  ret void
}

declare void @free(ptr noundef)

define dso_local ptr @Nbody_create() {
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
  store ptr @Nbody_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Nbody_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Nbody_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Nbody_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare double @llvm.fmuladd.f64(double, double, double)

declare double @sqrt(double noundef)


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
