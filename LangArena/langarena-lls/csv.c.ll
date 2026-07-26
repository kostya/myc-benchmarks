; ModuleID = 'c/src/csv.c'
source_filename = "c/src/csv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.CsvParseData = type { ptr, i32, i64 }
%struct.Point = type { double, double, double }

@.str = private unnamed_addr constant [5 x i8] c"rows\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"CSV::Parse\00", align 1
@.str.2 = private unnamed_addr constant [58 x i8] c"\22point %c\\n, \22\22%lld\22\22\22,%.10f,,%.10f,\22[%s\\n, %lld]\22,%.10f\0A\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"false\00", align 1

define dso_local void @CsvParse_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.CsvParseData, ptr %11, i32 0, i32 2
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.CsvParseData, ptr %13, i32 0, i32 2
  %15 = load i64, ptr %14, align 8
  %16 = call ptr @generate_csv_for_parsing(i64 noundef %15)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.CsvParseData, ptr %17, i32 0, i32 0
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.CsvParseData, ptr %19, i32 0, i32 1
  store i32 0, ptr %20, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @generate_csv_for_parsing(i64 noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8, align 1
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  store i64 %0, ptr %3, align 8
  %12 = load i64, ptr %3, align 8
  %13 = mul nsw i64 %12, 100
  %14 = add nsw i64 %13, 1
  store i64 %14, ptr %4, align 8
  %15 = load i64, ptr %4, align 8
  %16 = call noalias ptr @malloc(i64 noundef %15)
  store ptr %16, ptr %5, align 8
  %17 = load ptr, ptr %5, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %20, label %19

19:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %62

20:                                               ; preds = %1
  store i64 0, ptr %6, align 8
  store i64 0, ptr %7, align 8
  br label %21

21:                                               ; preds = %57, %20
  %22 = load i64, ptr %7, align 8
  %23 = load i64, ptr %3, align 8
  %24 = icmp slt i64 %22, %23
  br i1 %24, label %25, label %60

25:                                               ; preds = %21
  %26 = load i64, ptr %7, align 8
  %27 = srem i64 %26, 26
  %28 = add nsw i64 65, %27
  %29 = trunc i64 %28 to i8
  store i8 %29, ptr %8, align 1
  %30 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %30, ptr %9, align 8
  %31 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %31, ptr %10, align 8
  %32 = call double @Helper_next_float(double noundef 1.000000e+00)
  store double %32, ptr %11, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load i64, ptr %6, align 8
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 %34
  %36 = load i64, ptr %4, align 8
  %37 = load i64, ptr %6, align 8
  %38 = sub i64 %36, %37
  %39 = load i8, ptr %8, align 1
  %40 = sext i8 %39 to i32
  %41 = load i64, ptr %7, align 8
  %42 = srem i64 %41, 100
  %43 = load double, ptr %9, align 8
  %44 = load double, ptr %10, align 8
  %45 = load i64, ptr %7, align 8
  %46 = srem i64 %45, 2
  %47 = icmp eq i64 %46, 0
  %48 = zext i1 %47 to i64
  %49 = select i1 %47, ptr @.str.3, ptr @.str.4
  %50 = load i64, ptr %7, align 8
  %51 = srem i64 %50, 100
  %52 = load double, ptr %11, align 8
  %53 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %35, i64 noundef %38, ptr noundef @.str.2, i32 noundef %40, i64 noundef %42, double noundef %43, double noundef %44, ptr noundef %49, i64 noundef %51, double noundef %52)
  %54 = sext i32 %53 to i64
  %55 = load i64, ptr %6, align 8
  %56 = add i64 %55, %54
  store i64 %56, ptr %6, align 8
  br label %57

57:                                               ; preds = %25
  %58 = load i64, ptr %7, align 8
  %59 = add nsw i64 %58, 1
  store i64 %59, ptr %7, align 8
  br label %21, !llvm.loop !6

60:                                               ; preds = %21
  %61 = load ptr, ptr %5, align 8
  store ptr %61, ptr %2, align 8
  br label %62

62:                                               ; preds = %60, %19
  %63 = load ptr, ptr %2, align 8
  ret ptr %63
}

define dso_local void @CsvParse_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [512 x i8], align 16
  %11 = alloca i64, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca i32, align 4
  %19 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %20 = load i32, ptr %4, align 4
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 11
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %5, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.CsvParseData, ptr %24, i32 0, i32 0
  %26 = load ptr, ptr %25, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %29, label %28

28:                                               ; preds = %2
  br label %167

29:                                               ; preds = %2
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds nuw %struct.CsvParseData, ptr %30, i32 0, i32 2
  %32 = load i64, ptr %31, align 8
  %33 = mul i64 %32, 24
  %34 = call noalias ptr @malloc(i64 noundef %33)
  store ptr %34, ptr %6, align 8
  %35 = load ptr, ptr %6, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %38, label %37

37:                                               ; preds = %29
  br label %167

38:                                               ; preds = %29
  store i32 0, ptr %7, align 4
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.CsvParseData, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  store ptr %41, ptr %8, align 8
  br label %42

42:                                               ; preds = %105, %38
  %43 = load ptr, ptr %8, align 8
  %44 = load i8, ptr %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %54

47:                                               ; preds = %42
  %48 = load i32, ptr %7, align 4
  %49 = sext i32 %48 to i64
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.CsvParseData, ptr %50, i32 0, i32 2
  %52 = load i64, ptr %51, align 8
  %53 = icmp slt i64 %49, %52
  br label %54

54:                                               ; preds = %47, %42
  %55 = phi i1 [ false, %42 ], [ %53, %47 ]
  br i1 %55, label %56, label %108

56:                                               ; preds = %54
  %57 = load ptr, ptr %8, align 8
  %58 = call ptr @strchr(ptr noundef %57, i32 noundef 10)
  store ptr %58, ptr %9, align 8
  %59 = load ptr, ptr %9, align 8
  %60 = icmp ne ptr %59, null
  br i1 %60, label %66, label %61

61:                                               ; preds = %56
  %62 = load ptr, ptr %8, align 8
  %63 = load ptr, ptr %8, align 8
  %64 = call i64 @strlen(ptr noundef %63)
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 %64
  store ptr %65, ptr %9, align 8
  br label %66

66:                                               ; preds = %61, %56
  %67 = load ptr, ptr %9, align 8
  %68 = load ptr, ptr %8, align 8
  %69 = ptrtoint ptr %67 to i64
  %70 = ptrtoint ptr %68 to i64
  %71 = sub i64 %69, %70
  store i64 %71, ptr %11, align 8
  %72 = load i64, ptr %11, align 8
  %73 = icmp ult i64 %72, 512
  br i1 %73, label %74, label %105

74:                                               ; preds = %66
  %75 = getelementptr inbounds [512 x i8], ptr %10, i64 0, i64 0
  %76 = load ptr, ptr %8, align 8
  %77 = load i64, ptr %11, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %75, ptr align 1 %76, i64 %77, i1 false)
  %78 = load i64, ptr %11, align 8
  %79 = getelementptr inbounds nuw [512 x i8], ptr %10, i64 0, i64 %78
  store i8 0, ptr %79, align 1
  %80 = getelementptr inbounds [512 x i8], ptr %10, i64 0, i64 0
  %81 = call i32 @parse_csv_line(ptr noundef %80, ptr noundef %12, ptr noundef %13, ptr noundef %14)
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %104

83:                                               ; preds = %74
  %84 = load double, ptr %12, align 8
  %85 = load ptr, ptr %6, align 8
  %86 = load i32, ptr %7, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds %struct.Point, ptr %85, i64 %87
  %89 = getelementptr inbounds nuw %struct.Point, ptr %88, i32 0, i32 0
  store double %84, ptr %89, align 8
  %90 = load double, ptr %13, align 8
  %91 = load ptr, ptr %6, align 8
  %92 = load i32, ptr %7, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %struct.Point, ptr %91, i64 %93
  %95 = getelementptr inbounds nuw %struct.Point, ptr %94, i32 0, i32 1
  store double %90, ptr %95, align 8
  %96 = load double, ptr %14, align 8
  %97 = load ptr, ptr %6, align 8
  %98 = load i32, ptr %7, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.Point, ptr %97, i64 %99
  %101 = getelementptr inbounds nuw %struct.Point, ptr %100, i32 0, i32 2
  store double %96, ptr %101, align 8
  %102 = load i32, ptr %7, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %7, align 4
  br label %104

104:                                              ; preds = %83, %74
  br label %105

105:                                              ; preds = %104, %66
  %106 = load ptr, ptr %9, align 8
  %107 = getelementptr inbounds i8, ptr %106, i64 1
  store ptr %107, ptr %8, align 8
  br label %42, !llvm.loop !8

108:                                              ; preds = %54
  %109 = load i32, ptr %7, align 4
  %110 = icmp sgt i32 %109, 0
  br i1 %110, label %111, label %165

111:                                              ; preds = %108
  store double 0.000000e+00, ptr %15, align 8
  store double 0.000000e+00, ptr %16, align 8
  store double 0.000000e+00, ptr %17, align 8
  store i32 0, ptr %18, align 4
  br label %112

112:                                              ; preds = %141, %111
  %113 = load i32, ptr %18, align 4
  %114 = load i32, ptr %7, align 4
  %115 = icmp slt i32 %113, %114
  br i1 %115, label %116, label %144

116:                                              ; preds = %112
  %117 = load ptr, ptr %6, align 8
  %118 = load i32, ptr %18, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds %struct.Point, ptr %117, i64 %119
  %121 = getelementptr inbounds nuw %struct.Point, ptr %120, i32 0, i32 0
  %122 = load double, ptr %121, align 8
  %123 = load double, ptr %15, align 8
  %124 = fadd double %123, %122
  store double %124, ptr %15, align 8
  %125 = load ptr, ptr %6, align 8
  %126 = load i32, ptr %18, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds %struct.Point, ptr %125, i64 %127
  %129 = getelementptr inbounds nuw %struct.Point, ptr %128, i32 0, i32 1
  %130 = load double, ptr %129, align 8
  %131 = load double, ptr %16, align 8
  %132 = fadd double %131, %130
  store double %132, ptr %16, align 8
  %133 = load ptr, ptr %6, align 8
  %134 = load i32, ptr %18, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds %struct.Point, ptr %133, i64 %135
  %137 = getelementptr inbounds nuw %struct.Point, ptr %136, i32 0, i32 2
  %138 = load double, ptr %137, align 8
  %139 = load double, ptr %17, align 8
  %140 = fadd double %139, %138
  store double %140, ptr %17, align 8
  br label %141

141:                                              ; preds = %116
  %142 = load i32, ptr %18, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %18, align 4
  br label %112, !llvm.loop !9

144:                                              ; preds = %112
  %145 = load i32, ptr %7, align 4
  %146 = sitofp i32 %145 to double
  store double %146, ptr %19, align 8
  %147 = load double, ptr %15, align 8
  %148 = load double, ptr %19, align 8
  %149 = fdiv double %147, %148
  %150 = call i32 @Helper_checksum_f64(double noundef %149)
  %151 = load double, ptr %16, align 8
  %152 = load double, ptr %19, align 8
  %153 = fdiv double %151, %152
  %154 = call i32 @Helper_checksum_f64(double noundef %153)
  %155 = add i32 %150, %154
  %156 = load double, ptr %17, align 8
  %157 = load double, ptr %19, align 8
  %158 = fdiv double %156, %157
  %159 = call i32 @Helper_checksum_f64(double noundef %158)
  %160 = add i32 %155, %159
  %161 = load ptr, ptr %5, align 8
  %162 = getelementptr inbounds nuw %struct.CsvParseData, ptr %161, i32 0, i32 1
  %163 = load i32, ptr %162, align 8
  %164 = add i32 %163, %160
  store i32 %164, ptr %162, align 8
  br label %165

165:                                              ; preds = %144, %108
  %166 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %166)
  br label %167

167:                                              ; preds = %165, %37, %28
  ret void
}

declare noalias ptr @malloc(i64 noundef)

declare ptr @strchr(ptr noundef, i32 noundef)

declare i64 @strlen(ptr noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal i32 @parse_csv_line(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca [6 x ptr], align 16
  %14 = alloca [6 x ptr], align 16
  %15 = alloca ptr, align 8
  %16 = alloca [64 x i8], align 16
  %17 = alloca i64, align 8
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store i32 0, ptr %10, align 4
  %18 = load ptr, ptr %6, align 8
  store ptr %18, ptr %11, align 8
  store i32 0, ptr %12, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 48, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 48, i1 false)
  %19 = load ptr, ptr %6, align 8
  store ptr %19, ptr %15, align 8
  br label %20

20:                                               ; preds = %63, %4
  %21 = load ptr, ptr %15, align 8
  %22 = load i8, ptr %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = load i32, ptr %10, align 4
  %27 = icmp slt i32 %26, 6
  br label %28

28:                                               ; preds = %25, %20
  %29 = phi i1 [ false, %20 ], [ %27, %25 ]
  br i1 %29, label %30, label %66

30:                                               ; preds = %28
  %31 = load ptr, ptr %15, align 8
  %32 = load i8, ptr %31, align 1
  %33 = sext i8 %32 to i32
  %34 = icmp eq i32 %33, 34
  br i1 %34, label %35, label %40

35:                                               ; preds = %30
  %36 = load i32, ptr %12, align 4
  %37 = icmp ne i32 %36, 0
  %38 = xor i1 %37, true
  %39 = zext i1 %38 to i32
  store i32 %39, ptr %12, align 4
  br label %62

40:                                               ; preds = %30
  %41 = load ptr, ptr %15, align 8
  %42 = load i8, ptr %41, align 1
  %43 = sext i8 %42 to i32
  %44 = icmp eq i32 %43, 44
  br i1 %44, label %45, label %61

45:                                               ; preds = %40
  %46 = load i32, ptr %12, align 4
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %61, label %48

48:                                               ; preds = %45
  %49 = load ptr, ptr %11, align 8
  %50 = load i32, ptr %10, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 %51
  store ptr %49, ptr %52, align 8
  %53 = load ptr, ptr %15, align 8
  %54 = load i32, ptr %10, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [6 x ptr], ptr %14, i64 0, i64 %55
  store ptr %53, ptr %56, align 8
  %57 = load i32, ptr %10, align 4
  %58 = add nsw i32 %57, 1
  store i32 %58, ptr %10, align 4
  %59 = load ptr, ptr %15, align 8
  %60 = getelementptr inbounds i8, ptr %59, i64 1
  store ptr %60, ptr %11, align 8
  br label %61

61:                                               ; preds = %48, %45, %40
  br label %62

62:                                               ; preds = %61, %35
  br label %63

63:                                               ; preds = %62
  %64 = load ptr, ptr %15, align 8
  %65 = getelementptr inbounds nuw i8, ptr %64, i32 1
  store ptr %65, ptr %15, align 8
  br label %20, !llvm.loop !10

66:                                               ; preds = %28
  %67 = load i32, ptr %10, align 4
  %68 = icmp slt i32 %67, 6
  br i1 %68, label %69, label %88

69:                                               ; preds = %66
  %70 = load ptr, ptr %11, align 8
  %71 = load i8, ptr %70, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %74, label %88

74:                                               ; preds = %69
  %75 = load ptr, ptr %11, align 8
  %76 = load i32, ptr %10, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 %77
  store ptr %75, ptr %78, align 8
  %79 = load ptr, ptr %11, align 8
  %80 = load ptr, ptr %11, align 8
  %81 = call i64 @strlen(ptr noundef %80)
  %82 = getelementptr inbounds nuw i8, ptr %79, i64 %81
  %83 = load i32, ptr %10, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [6 x ptr], ptr %14, i64 0, i64 %84
  store ptr %82, ptr %85, align 8
  %86 = load i32, ptr %10, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %10, align 4
  br label %88

88:                                               ; preds = %74, %69, %66
  %89 = load i32, ptr %10, align 4
  %90 = icmp slt i32 %89, 6
  br i1 %90, label %91, label %92

91:                                               ; preds = %88
  store i32 -1, ptr %5, align 4
  br label %153

92:                                               ; preds = %88
  %93 = getelementptr inbounds [6 x ptr], ptr %14, i64 0, i64 1
  %94 = load ptr, ptr %93, align 8
  %95 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 1
  %96 = load ptr, ptr %95, align 8
  %97 = ptrtoint ptr %94 to i64
  %98 = ptrtoint ptr %96 to i64
  %99 = sub i64 %97, %98
  store i64 %99, ptr %17, align 8
  %100 = load i64, ptr %17, align 8
  %101 = icmp uge i64 %100, 64
  br i1 %101, label %102, label %103

102:                                              ; preds = %92
  store i32 -1, ptr %5, align 4
  br label %153

103:                                              ; preds = %92
  %104 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %105 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 1
  %106 = load ptr, ptr %105, align 8
  %107 = load i64, ptr %17, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %104, ptr align 1 %106, i64 %107, i1 false)
  %108 = load i64, ptr %17, align 8
  %109 = getelementptr inbounds nuw [64 x i8], ptr %16, i64 0, i64 %108
  store i8 0, ptr %109, align 1
  %110 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %111 = call double @strtod(ptr noundef %110, ptr noundef null)
  %112 = load ptr, ptr %7, align 8
  store double %111, ptr %112, align 8
  %113 = getelementptr inbounds [6 x ptr], ptr %14, i64 0, i64 3
  %114 = load ptr, ptr %113, align 8
  %115 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 3
  %116 = load ptr, ptr %115, align 8
  %117 = ptrtoint ptr %114 to i64
  %118 = ptrtoint ptr %116 to i64
  %119 = sub i64 %117, %118
  store i64 %119, ptr %17, align 8
  %120 = load i64, ptr %17, align 8
  %121 = icmp uge i64 %120, 64
  br i1 %121, label %122, label %123

122:                                              ; preds = %103
  store i32 -1, ptr %5, align 4
  br label %153

123:                                              ; preds = %103
  %124 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %125 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 3
  %126 = load ptr, ptr %125, align 8
  %127 = load i64, ptr %17, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %124, ptr align 1 %126, i64 %127, i1 false)
  %128 = load i64, ptr %17, align 8
  %129 = getelementptr inbounds nuw [64 x i8], ptr %16, i64 0, i64 %128
  store i8 0, ptr %129, align 1
  %130 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %131 = call double @strtod(ptr noundef %130, ptr noundef null)
  %132 = load ptr, ptr %9, align 8
  store double %131, ptr %132, align 8
  %133 = getelementptr inbounds [6 x ptr], ptr %14, i64 0, i64 5
  %134 = load ptr, ptr %133, align 8
  %135 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 5
  %136 = load ptr, ptr %135, align 8
  %137 = ptrtoint ptr %134 to i64
  %138 = ptrtoint ptr %136 to i64
  %139 = sub i64 %137, %138
  store i64 %139, ptr %17, align 8
  %140 = load i64, ptr %17, align 8
  %141 = icmp uge i64 %140, 64
  br i1 %141, label %142, label %143

142:                                              ; preds = %123
  store i32 -1, ptr %5, align 4
  br label %153

143:                                              ; preds = %123
  %144 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %145 = getelementptr inbounds [6 x ptr], ptr %13, i64 0, i64 5
  %146 = load ptr, ptr %145, align 8
  %147 = load i64, ptr %17, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %144, ptr align 1 %146, i64 %147, i1 false)
  %148 = load i64, ptr %17, align 8
  %149 = getelementptr inbounds nuw [64 x i8], ptr %16, i64 0, i64 %148
  store i8 0, ptr %149, align 1
  %150 = getelementptr inbounds [64 x i8], ptr %16, i64 0, i64 0
  %151 = call double @strtod(ptr noundef %150, ptr noundef null)
  %152 = load ptr, ptr %8, align 8
  store double %151, ptr %152, align 8
  store i32 0, ptr %5, align 4
  br label %153

153:                                              ; preds = %143, %142, %122, %102, %91
  %154 = load i32, ptr %5, align 4
  ret i32 %154
}

declare i32 @Helper_checksum_f64(double noundef)

declare void @free(ptr noundef)

define dso_local i32 @CsvParse_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CsvParseData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @CsvParse_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CsvParseData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.CsvParseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.CsvParseData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @CsvParse_create() {
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
  br label %27

8:                                                ; preds = %0
  %9 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 24)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %27

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 11
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.Benchmark, ptr %18, i32 0, i32 3
  store ptr @CsvParse_prepare, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 4
  store ptr @CsvParse_run, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 7
  store ptr @CsvParse_checksum, ptr %23, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 10
  store ptr @CsvParse_cleanup, ptr %25, align 8
  %26 = load ptr, ptr %2, align 8
  store ptr %26, ptr %1, align 8
  br label %27

27:                                               ; preds = %14, %12, %7
  %28 = load ptr, ptr %1, align 8
  ret ptr %28
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

declare double @Helper_next_float(double noundef)

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare double @strtod(ptr noundef, ptr noundef)


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
