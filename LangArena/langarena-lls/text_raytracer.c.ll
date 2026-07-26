; ModuleID = 'c/src/text_raytracer.c'
source_filename = "c/src/text_raytracer.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.TRSphere = type { %struct.TRVector, double, %struct.TRColor }
%struct.TRVector = type { double, double, double }
%struct.TRColor = type { double, double, double }
%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.TextRaytracerData = type { i32, i32, i32 }
%struct.TRLight = type { %struct.TRVector, %struct.TRColor }
%struct.TRRay = type { %struct.TRVector, %struct.TRVector }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@__const.TextRaytracer_run.scene = private unnamed_addr constant [3 x %struct.TRSphere] [%struct.TRSphere { %struct.TRVector { double -1.000000e+00, double 0.000000e+00, double 3.000000e+00 }, double 3.000000e-01, %struct.TRColor { double 1.000000e+00, double 0.000000e+00, double 0.000000e+00 } }, %struct.TRSphere { %struct.TRVector { double 0.000000e+00, double 0.000000e+00, double 3.000000e+00 }, double 8.000000e-01, %struct.TRColor { double 0.000000e+00, double 1.000000e+00, double 0.000000e+00 } }, %struct.TRSphere { %struct.TRVector { double 1.000000e+00, double 0.000000e+00, double 3.000000e+00 }, double 4.000000e-01, %struct.TRColor { double 0.000000e+00, double 0.000000e+00, double 1.000000e+00 } }], align 16
@LUT = internal constant [6 x i8] c".-+*XM", align 1
@.str.2 = private unnamed_addr constant [19 x i8] c"Etc::TextRaytracer\00", align 1

define dso_local void @TextRaytracer_prepare(ptr noundef %0) {
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
  %11 = trunc i64 %10 to i32
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %12, i32 0, i32 0
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i64 @Helper_config_i64(ptr noundef %16, ptr noundef @.str.1)
  %18 = trunc i64 %17 to i32
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %19, i32 0, i32 1
  store i32 %18, ptr %20, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 4
  %24 = icmp sle i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %26, i32 0, i32 0
  store i32 10, ptr %27, align 4
  br label %28

28:                                               ; preds = %25, %1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %29, i32 0, i32 1
  %31 = load i32, ptr %30, align 4
  %32 = icmp sle i32 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %34, i32 0, i32 1
  store i32 10, ptr %35, align 4
  br label %36

36:                                               ; preds = %33, %28
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %37, i32 0, i32 2
  store i32 0, ptr %38, align 4
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @TextRaytracer_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [3 x %struct.TRSphere], align 16
  %7 = alloca %struct.TRLight, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca %struct.TRRay, align 8
  %16 = alloca %struct.TRVector, align 8
  %17 = alloca %struct.TRVector, align 8
  %18 = alloca %struct.TRVector, align 8
  %19 = alloca double, align 8
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca double, align 8
  %23 = alloca i8, align 1
  %24 = alloca %struct.TRVector, align 8
  %25 = alloca %struct.TRVector, align 8
  %26 = alloca %struct.TRColor, align 8
  %27 = alloca double, align 8
  %28 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %29 = load i32, ptr %4, align 4
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.Benchmark, ptr %30, i32 0, i32 11
  %32 = load ptr, ptr %31, align 8
  store ptr %32, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %6, ptr align 16 @__const.TextRaytracer_run.scene, i64 168, i1 false)
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 48, i1 false)
  %33 = getelementptr inbounds %struct.TRLight, ptr %7, i32 0, i32 0
  %34 = getelementptr inbounds %struct.TRVector, ptr %33, i32 0, i32 0
  store double 0x3FE6666666666666, ptr %34, align 8
  %35 = getelementptr inbounds %struct.TRVector, ptr %33, i32 0, i32 1
  store double -1.000000e+00, ptr %35, align 8
  %36 = getelementptr inbounds %struct.TRVector, ptr %33, i32 0, i32 2
  store double 1.700000e+00, ptr %36, align 8
  %37 = getelementptr inbounds %struct.TRLight, ptr %7, i32 0, i32 1
  %38 = getelementptr inbounds %struct.TRColor, ptr %37, i32 0, i32 0
  store double 1.000000e+00, ptr %38, align 8
  %39 = getelementptr inbounds %struct.TRColor, ptr %37, i32 0, i32 1
  store double 1.000000e+00, ptr %39, align 8
  %40 = getelementptr inbounds %struct.TRColor, ptr %37, i32 0, i32 2
  store double 1.000000e+00, ptr %40, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %41

41:                                               ; preds = %156, %2
  %42 = load i32, ptr %9, align 4
  %43 = load ptr, ptr %5, align 8
  %44 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = icmp slt i32 %42, %45
  br i1 %46, label %47, label %159

47:                                               ; preds = %41
  store i32 0, ptr %10, align 4
  br label %48

48:                                               ; preds = %152, %47
  %49 = load i32, ptr %10, align 4
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 4
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %155

54:                                               ; preds = %48
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %55, i32 0, i32 0
  %57 = load i32, ptr %56, align 4
  %58 = sitofp i32 %57 to double
  store double %58, ptr %11, align 8
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %59, i32 0, i32 1
  %61 = load i32, ptr %60, align 4
  %62 = sitofp i32 %61 to double
  store double %62, ptr %12, align 8
  %63 = load i32, ptr %10, align 4
  %64 = sitofp i32 %63 to double
  store double %64, ptr %13, align 8
  %65 = load i32, ptr %9, align 4
  %66 = sitofp i32 %65 to double
  store double %66, ptr %14, align 8
  %67 = getelementptr inbounds nuw %struct.TRRay, ptr %15, i32 0, i32 0
  call void @llvm.memset.p0.i64(ptr align 8 %16, i8 0, i64 24, i1 false)
  %68 = getelementptr inbounds nuw %struct.TRVector, ptr %16, i32 0, i32 0
  %69 = getelementptr inbounds nuw %struct.TRVector, ptr %16, i32 0, i32 1
  %70 = getelementptr inbounds nuw %struct.TRVector, ptr %16, i32 0, i32 2
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %67, ptr align 8 %16, i64 24, i1 false)
  %71 = getelementptr inbounds nuw %struct.TRVector, ptr %17, i32 0, i32 0
  %72 = load double, ptr %13, align 8
  %73 = load double, ptr %11, align 8
  %74 = fdiv double %73, 2.000000e+00
  %75 = fsub double %72, %74
  %76 = load double, ptr %11, align 8
  %77 = fdiv double %75, %76
  store double %77, ptr %71, align 8
  %78 = getelementptr inbounds nuw %struct.TRVector, ptr %17, i32 0, i32 1
  %79 = load double, ptr %14, align 8
  %80 = load double, ptr %12, align 8
  %81 = fdiv double %80, 2.000000e+00
  %82 = fsub double %79, %81
  %83 = load double, ptr %12, align 8
  %84 = fdiv double %82, %83
  store double %84, ptr %78, align 8
  %85 = getelementptr inbounds nuw %struct.TRVector, ptr %17, i32 0, i32 2
  store double 1.000000e+00, ptr %85, align 8
  %86 = getelementptr inbounds nuw %struct.TRRay, ptr %15, i32 0, i32 1
  call void @tr_vector_normalize(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %18, ptr noundef byval(%struct.TRVector) align 8 %17)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %86, ptr align 8 %18, i64 24, i1 false)
  store double -1.000000e+00, ptr %19, align 8
  store ptr null, ptr %20, align 8
  store i32 0, ptr %21, align 4
  br label %87

87:                                               ; preds = %109, %54
  %88 = load i32, ptr %21, align 4
  %89 = icmp slt i32 %88, 3
  br i1 %89, label %90, label %112

90:                                               ; preds = %87
  %91 = load i32, ptr %21, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [3 x %struct.TRSphere], ptr %6, i64 0, i64 %92
  %94 = getelementptr inbounds nuw %struct.TRSphere, ptr %93, i32 0, i32 0
  %95 = load i32, ptr %21, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [3 x %struct.TRSphere], ptr %6, i64 0, i64 %96
  %98 = getelementptr inbounds nuw %struct.TRSphere, ptr %97, i32 0, i32 1
  %99 = load double, ptr %98, align 8
  %100 = call double @tr_intersect_sphere(ptr noundef byval(%struct.TRRay) align 8 %15, ptr noundef byval(%struct.TRVector) align 8 %94, double noundef %99)
  store double %100, ptr %22, align 8
  %101 = load double, ptr %22, align 8
  %102 = fcmp oge double %101, 0.000000e+00
  br i1 %102, label %103, label %108

103:                                              ; preds = %90
  %104 = load double, ptr %22, align 8
  store double %104, ptr %19, align 8
  %105 = load i32, ptr %21, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [3 x %struct.TRSphere], ptr %6, i64 0, i64 %106
  store ptr %107, ptr %20, align 8
  br label %112

108:                                              ; preds = %90
  br label %109

109:                                              ; preds = %108
  %110 = load i32, ptr %21, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, ptr %21, align 4
  br label %87, !llvm.loop !6

112:                                              ; preds = %103, %87
  store i8 32, ptr %23, align 1
  %113 = load ptr, ptr %20, align 8
  %114 = icmp ne ptr %113, null
  br i1 %114, label %115, label %147

115:                                              ; preds = %112
  %116 = load double, ptr %19, align 8
  %117 = fcmp oge double %116, 0.000000e+00
  br i1 %117, label %118, label %147

118:                                              ; preds = %115
  %119 = getelementptr inbounds nuw %struct.TRRay, ptr %15, i32 0, i32 0
  %120 = getelementptr inbounds nuw %struct.TRRay, ptr %15, i32 0, i32 1
  %121 = load double, ptr %19, align 8
  call void @tr_vector_scale(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %25, ptr noundef byval(%struct.TRVector) align 8 %120, double noundef %121)
  call void @tr_vector_add(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %24, ptr noundef byval(%struct.TRVector) align 8 %119, ptr noundef byval(%struct.TRVector) align 8 %25)
  %122 = load ptr, ptr %20, align 8
  call void @tr_diffuse_shading(ptr dead_on_unwind writable sret(%struct.TRColor) align 8 %26, ptr noundef byval(%struct.TRVector) align 8 %24, ptr noundef %122, ptr noundef byval(%struct.TRLight) align 8 %7)
  %123 = getelementptr inbounds nuw %struct.TRColor, ptr %26, i32 0, i32 0
  %124 = load double, ptr %123, align 8
  %125 = getelementptr inbounds nuw %struct.TRColor, ptr %26, i32 0, i32 1
  %126 = load double, ptr %125, align 8
  %127 = fadd double %124, %126
  %128 = getelementptr inbounds nuw %struct.TRColor, ptr %26, i32 0, i32 2
  %129 = load double, ptr %128, align 8
  %130 = fadd double %127, %129
  %131 = fdiv double %130, 3.000000e+00
  store double %131, ptr %27, align 8
  %132 = load double, ptr %27, align 8
  %133 = fmul double %132, 6.000000e+00
  %134 = fptosi double %133 to i32
  store i32 %134, ptr %28, align 4
  %135 = load i32, ptr %28, align 4
  %136 = icmp slt i32 %135, 0
  br i1 %136, label %137, label %138

137:                                              ; preds = %118
  store i32 0, ptr %28, align 4
  br label %138

138:                                              ; preds = %137, %118
  %139 = load i32, ptr %28, align 4
  %140 = icmp sge i32 %139, 6
  br i1 %140, label %141, label %142

141:                                              ; preds = %138
  store i32 5, ptr %28, align 4
  br label %142

142:                                              ; preds = %141, %138
  %143 = load i32, ptr %28, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [6 x i8], ptr @LUT, i64 0, i64 %144
  %146 = load i8, ptr %145, align 1
  store i8 %146, ptr %23, align 1
  br label %147

147:                                              ; preds = %142, %115, %112
  %148 = load i8, ptr %23, align 1
  %149 = zext i8 %148 to i32
  %150 = load i32, ptr %8, align 4
  %151 = add i32 %150, %149
  store i32 %151, ptr %8, align 4
  br label %152

152:                                              ; preds = %147
  %153 = load i32, ptr %10, align 4
  %154 = add nsw i32 %153, 1
  store i32 %154, ptr %10, align 4
  br label %48, !llvm.loop !8

155:                                              ; preds = %48
  br label %156

156:                                              ; preds = %155
  %157 = load i32, ptr %9, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, ptr %9, align 4
  br label %41, !llvm.loop !9

159:                                              ; preds = %41
  %160 = load i32, ptr %8, align 4
  %161 = load ptr, ptr %5, align 8
  %162 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %161, i32 0, i32 2
  %163 = load i32, ptr %162, align 4
  %164 = add i32 %163, %160
  store i32 %164, ptr %162, align 4
  ret void
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define internal void @tr_vector_normalize(ptr dead_on_unwind noalias writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1) {
  %3 = alloca double, align 8
  %4 = call double @tr_vector_magnitude(ptr noundef byval(%struct.TRVector) align 8 %1)
  store double %4, ptr %3, align 8
  %5 = load double, ptr %3, align 8
  %6 = fcmp oeq double %5, 0.000000e+00
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 24, i1 false)
  %8 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 1
  %10 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 2
  br label %14

11:                                               ; preds = %2
  %12 = load double, ptr %3, align 8
  %13 = fdiv double 1.000000e+00, %12
  call void @tr_vector_scale(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, double noundef %13)
  br label %14

14:                                               ; preds = %11, %7
  ret void
}

define internal double @tr_intersect_sphere(ptr noundef byval(%struct.TRRay) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, double noundef %2) {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca %struct.TRVector, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  store double %2, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.TRRay, ptr %0, i32 0, i32 0
  call void @tr_vector_sub(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %6, ptr noundef byval(%struct.TRVector) align 8 %1, ptr noundef byval(%struct.TRVector) align 8 %12)
  %13 = getelementptr inbounds nuw %struct.TRRay, ptr %0, i32 0, i32 1
  %14 = call double @tr_vector_dot(ptr noundef byval(%struct.TRVector) align 8 %6, ptr noundef byval(%struct.TRVector) align 8 %13)
  store double %14, ptr %7, align 8
  %15 = load double, ptr %7, align 8
  %16 = fcmp olt double %15, 0.000000e+00
  br i1 %16, label %17, label %18

17:                                               ; preds = %3
  store double -1.000000e+00, ptr %4, align 8
  br label %44

18:                                               ; preds = %3
  %19 = call double @tr_vector_dot(ptr noundef byval(%struct.TRVector) align 8 %6, ptr noundef byval(%struct.TRVector) align 8 %6)
  %20 = load double, ptr %7, align 8
  %21 = load double, ptr %7, align 8
  %22 = fneg double %20
  %23 = call double @llvm.fmuladd.f64(double %22, double %21, double %19)
  store double %23, ptr %8, align 8
  %24 = load double, ptr %5, align 8
  %25 = load double, ptr %5, align 8
  %26 = fmul double %24, %25
  store double %26, ptr %9, align 8
  %27 = load double, ptr %8, align 8
  %28 = load double, ptr %9, align 8
  %29 = fcmp ogt double %27, %28
  br i1 %29, label %30, label %31

30:                                               ; preds = %18
  store double -1.000000e+00, ptr %4, align 8
  br label %44

31:                                               ; preds = %18
  %32 = load double, ptr %9, align 8
  %33 = load double, ptr %8, align 8
  %34 = fsub double %32, %33
  %35 = call double @sqrt(double noundef %34)
  store double %35, ptr %10, align 8
  %36 = load double, ptr %7, align 8
  %37 = load double, ptr %10, align 8
  %38 = fsub double %36, %37
  store double %38, ptr %11, align 8
  %39 = load double, ptr %11, align 8
  %40 = fcmp ogt double %39, 1.000000e+04
  br i1 %40, label %41, label %42

41:                                               ; preds = %31
  store double -1.000000e+00, ptr %4, align 8
  br label %44

42:                                               ; preds = %31
  %43 = load double, ptr %11, align 8
  store double %43, ptr %4, align 8
  br label %44

44:                                               ; preds = %42, %41, %30, %17
  %45 = load double, ptr %4, align 8
  ret double %45
}

define internal void @tr_vector_add(ptr dead_on_unwind noalias writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, ptr noundef byval(%struct.TRVector) align 8 %2) {
  %4 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 0
  %5 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 0
  %6 = load double, ptr %5, align 8
  %7 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 0
  %8 = load double, ptr %7, align 8
  %9 = fadd double %6, %8
  store double %9, ptr %4, align 8
  %10 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 1
  %14 = load double, ptr %13, align 8
  %15 = fadd double %12, %14
  store double %15, ptr %10, align 8
  %16 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 2
  %17 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 2
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 2
  %20 = load double, ptr %19, align 8
  %21 = fadd double %18, %20
  store double %21, ptr %16, align 8
  ret void
}

define internal void @tr_vector_scale(ptr dead_on_unwind noalias writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, double noundef %2) {
  %4 = alloca double, align 8
  store double %2, ptr %4, align 8
  %5 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 0
  %6 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %4, align 8
  %9 = fmul double %7, %8
  store double %9, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = load double, ptr %4, align 8
  %14 = fmul double %12, %13
  store double %14, ptr %10, align 8
  %15 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 2
  %16 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 2
  %17 = load double, ptr %16, align 8
  %18 = load double, ptr %4, align 8
  %19 = fmul double %17, %18
  store double %19, ptr %15, align 8
  ret void
}

define internal void @tr_diffuse_shading(ptr dead_on_unwind noalias writable sret(%struct.TRColor) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, ptr noundef %2, ptr noundef byval(%struct.TRLight) align 8 %3) {
  %5 = alloca ptr, align 8
  %6 = alloca %struct.TRVector, align 8
  %7 = alloca %struct.TRVector, align 8
  %8 = alloca %struct.TRVector, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca %struct.TRColor, align 8
  %12 = alloca %struct.TRColor, align 8
  store ptr %2, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  call void @tr_sphere_get_normal(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %6, ptr noundef %13, ptr noundef byval(%struct.TRVector) align 8 %1)
  %14 = getelementptr inbounds nuw %struct.TRLight, ptr %3, i32 0, i32 0
  call void @tr_vector_sub(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %8, ptr noundef byval(%struct.TRVector) align 8 %14, ptr noundef byval(%struct.TRVector) align 8 %1)
  call void @tr_vector_normalize(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %7, ptr noundef byval(%struct.TRVector) align 8 %8)
  %15 = call double @tr_vector_dot(ptr noundef byval(%struct.TRVector) align 8 %7, ptr noundef byval(%struct.TRVector) align 8 %6)
  store double %15, ptr %9, align 8
  %16 = load double, ptr %9, align 8
  %17 = call double @tr_clamp(double noundef %16, double noundef 0.000000e+00, double noundef 1.000000e+00)
  store double %17, ptr %10, align 8
  %18 = getelementptr inbounds nuw %struct.TRLight, ptr %3, i32 0, i32 1
  %19 = load double, ptr %10, align 8
  %20 = fmul double %19, 5.000000e-01
  call void @tr_color_scale(ptr dead_on_unwind writable sret(%struct.TRColor) align 8 %11, ptr noundef byval(%struct.TRColor) align 8 %18, double noundef %20)
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.TRSphere, ptr %21, i32 0, i32 2
  call void @tr_color_scale(ptr dead_on_unwind writable sret(%struct.TRColor) align 8 %12, ptr noundef byval(%struct.TRColor) align 8 %22, double noundef 3.000000e-01)
  call void @tr_color_add(ptr dead_on_unwind writable sret(%struct.TRColor) align 8 %0, ptr noundef byval(%struct.TRColor) align 8 %11, ptr noundef byval(%struct.TRColor) align 8 %12)
  ret void
}

define dso_local i32 @TextRaytracer_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.TextRaytracerData, ptr %7, i32 0, i32 2
  %9 = load i32, ptr %8, align 4
  ret i32 %9
}

define dso_local void @TextRaytracer_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

define dso_local ptr @TextRaytracer_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 12)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 4 %5, i8 0, i64 12, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @TextRaytracer_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @TextRaytracer_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @TextRaytracer_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @TextRaytracer_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

define internal double @tr_vector_magnitude(ptr noundef byval(%struct.TRVector) align 8 %0) {
  %2 = call double @tr_vector_dot(ptr noundef byval(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %0)
  %3 = call double @sqrt(double noundef %2)
  ret double %3
}

declare double @sqrt(double noundef)

define internal double @tr_vector_dot(ptr noundef byval(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1) {
  %3 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 0
  %4 = load double, ptr %3, align 8
  %5 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 0
  %6 = load double, ptr %5, align 8
  %7 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 1
  %8 = load double, ptr %7, align 8
  %9 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 1
  %10 = load double, ptr %9, align 8
  %11 = fmul double %8, %10
  %12 = call double @llvm.fmuladd.f64(double %4, double %6, double %11)
  %13 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 2
  %14 = load double, ptr %13, align 8
  %15 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 2
  %16 = load double, ptr %15, align 8
  %17 = call double @llvm.fmuladd.f64(double %14, double %16, double %12)
  ret double %17
}

declare double @llvm.fmuladd.f64(double, double, double)

define internal void @tr_vector_sub(ptr dead_on_unwind noalias writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %1, ptr noundef byval(%struct.TRVector) align 8 %2) {
  %4 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 0
  %5 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 0
  %6 = load double, ptr %5, align 8
  %7 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 0
  %8 = load double, ptr %7, align 8
  %9 = fsub double %6, %8
  store double %9, ptr %4, align 8
  %10 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 1
  %14 = load double, ptr %13, align 8
  %15 = fsub double %12, %14
  store double %15, ptr %10, align 8
  %16 = getelementptr inbounds nuw %struct.TRVector, ptr %0, i32 0, i32 2
  %17 = getelementptr inbounds nuw %struct.TRVector, ptr %1, i32 0, i32 2
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.TRVector, ptr %2, i32 0, i32 2
  %20 = load double, ptr %19, align 8
  %21 = fsub double %18, %20
  store double %21, ptr %16, align 8
  ret void
}

define internal void @tr_sphere_get_normal(ptr dead_on_unwind noalias writable sret(%struct.TRVector) align 8 %0, ptr noundef %1, ptr noundef byval(%struct.TRVector) align 8 %2) {
  %4 = alloca ptr, align 8
  %5 = alloca %struct.TRVector, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %4, align 8
  %7 = getelementptr inbounds nuw %struct.TRSphere, ptr %6, i32 0, i32 0
  call void @tr_vector_sub(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %5, ptr noundef byval(%struct.TRVector) align 8 %2, ptr noundef byval(%struct.TRVector) align 8 %7)
  call void @tr_vector_normalize(ptr dead_on_unwind writable sret(%struct.TRVector) align 8 %0, ptr noundef byval(%struct.TRVector) align 8 %5)
  ret void
}

define internal double @tr_clamp(double noundef %0, double noundef %1, double noundef %2) {
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store double %0, ptr %5, align 8
  store double %1, ptr %6, align 8
  store double %2, ptr %7, align 8
  %8 = load double, ptr %5, align 8
  %9 = load double, ptr %6, align 8
  %10 = fcmp olt double %8, %9
  br i1 %10, label %11, label %13

11:                                               ; preds = %3
  %12 = load double, ptr %6, align 8
  store double %12, ptr %4, align 8
  br label %21

13:                                               ; preds = %3
  %14 = load double, ptr %5, align 8
  %15 = load double, ptr %7, align 8
  %16 = fcmp ogt double %14, %15
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = load double, ptr %7, align 8
  store double %18, ptr %4, align 8
  br label %21

19:                                               ; preds = %13
  %20 = load double, ptr %5, align 8
  store double %20, ptr %4, align 8
  br label %21

21:                                               ; preds = %19, %17, %11
  %22 = load double, ptr %4, align 8
  ret double %22
}

define internal void @tr_color_scale(ptr dead_on_unwind noalias writable sret(%struct.TRColor) align 8 %0, ptr noundef byval(%struct.TRColor) align 8 %1, double noundef %2) {
  %4 = alloca double, align 8
  store double %2, ptr %4, align 8
  %5 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 0
  %6 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 0
  %7 = load double, ptr %6, align 8
  %8 = load double, ptr %4, align 8
  %9 = fmul double %7, %8
  store double %9, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = load double, ptr %4, align 8
  %14 = fmul double %12, %13
  store double %14, ptr %10, align 8
  %15 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 2
  %16 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 2
  %17 = load double, ptr %16, align 8
  %18 = load double, ptr %4, align 8
  %19 = fmul double %17, %18
  store double %19, ptr %15, align 8
  ret void
}

define internal void @tr_color_add(ptr dead_on_unwind noalias writable sret(%struct.TRColor) align 8 %0, ptr noundef byval(%struct.TRColor) align 8 %1, ptr noundef byval(%struct.TRColor) align 8 %2) {
  %4 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 0
  %5 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 0
  %6 = load double, ptr %5, align 8
  %7 = getelementptr inbounds nuw %struct.TRColor, ptr %2, i32 0, i32 0
  %8 = load double, ptr %7, align 8
  %9 = fadd double %6, %8
  store double %9, ptr %4, align 8
  %10 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 1
  %11 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 1
  %12 = load double, ptr %11, align 8
  %13 = getelementptr inbounds nuw %struct.TRColor, ptr %2, i32 0, i32 1
  %14 = load double, ptr %13, align 8
  %15 = fadd double %12, %14
  store double %15, ptr %10, align 8
  %16 = getelementptr inbounds nuw %struct.TRColor, ptr %0, i32 0, i32 2
  %17 = getelementptr inbounds nuw %struct.TRColor, ptr %1, i32 0, i32 2
  %18 = load double, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.TRColor, ptr %2, i32 0, i32 2
  %20 = load double, ptr %19, align 8
  %21 = fadd double %18, %20
  store double %21, ptr %16, align 8
  ret void
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
