; ModuleID = 'c/src/distance.c'
source_filename = "c/src/distance.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.StringPairs = type { ptr, ptr, i64 }
%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.JaroData = type { ptr, i32, i64, i64 }
%struct.NGramData = type { ptr, i32, i64, i64 }
%struct.GramHash = type { i32, i32, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [6 x i8] c"count\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Distance::Jaro\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"Distance::NGram\00", align 1

define dso_local ptr @generate_pair_strings(i64 noundef %0, i64 noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i64 %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %11 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %11, ptr %5, align 8
  %12 = load i64, ptr %3, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.StringPairs, ptr %13, i32 0, i32 2
  store i64 %12, ptr %14, align 8
  %15 = load i64, ptr %3, align 8
  %16 = mul i64 %15, 8
  %17 = call noalias ptr @malloc(i64 noundef %16)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.StringPairs, ptr %18, i32 0, i32 0
  store ptr %17, ptr %19, align 8
  %20 = load i64, ptr %3, align 8
  %21 = mul i64 %20, 8
  %22 = call noalias ptr @malloc(i64 noundef %21)
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.StringPairs, ptr %23, i32 0, i32 1
  store ptr %22, ptr %24, align 8
  store i64 0, ptr %6, align 8
  br label %25

25:                                               ; preds = %116, %2
  %26 = load i64, ptr %6, align 8
  %27 = load i64, ptr %3, align 8
  %28 = icmp slt i64 %26, %27
  br i1 %28, label %29, label %119

29:                                               ; preds = %25
  %30 = load i64, ptr %4, align 8
  %31 = trunc i64 %30 to i32
  %32 = call i32 @Helper_next_int(i32 noundef %31)
  %33 = add i32 %32, 4
  store i32 %33, ptr %7, align 4
  %34 = load i64, ptr %4, align 8
  %35 = trunc i64 %34 to i32
  %36 = call i32 @Helper_next_int(i32 noundef %35)
  %37 = add i32 %36, 4
  store i32 %37, ptr %8, align 4
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = call noalias ptr @malloc(i64 noundef %40)
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.StringPairs, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = load i64, ptr %6, align 8
  %46 = getelementptr inbounds ptr, ptr %44, i64 %45
  store ptr %41, ptr %46, align 8
  %47 = load i32, ptr %8, align 4
  %48 = add nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = call noalias ptr @malloc(i64 noundef %49)
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds nuw %struct.StringPairs, ptr %51, i32 0, i32 1
  %53 = load ptr, ptr %52, align 8
  %54 = load i64, ptr %6, align 8
  %55 = getelementptr inbounds ptr, ptr %53, i64 %54
  store ptr %50, ptr %55, align 8
  store i32 0, ptr %9, align 4
  br label %56

56:                                               ; preds = %73, %29
  %57 = load i32, ptr %9, align 4
  %58 = load i32, ptr %7, align 4
  %59 = icmp slt i32 %57, %58
  br i1 %59, label %60, label %76

60:                                               ; preds = %56
  %61 = call i32 @Helper_next_int(i32 noundef 10)
  %62 = add i32 97, %61
  %63 = trunc i32 %62 to i8
  %64 = load ptr, ptr %5, align 8
  %65 = getelementptr inbounds nuw %struct.StringPairs, ptr %64, i32 0, i32 0
  %66 = load ptr, ptr %65, align 8
  %67 = load i64, ptr %6, align 8
  %68 = getelementptr inbounds ptr, ptr %66, i64 %67
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %9, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %69, i64 %71
  store i8 %63, ptr %72, align 1
  br label %73

73:                                               ; preds = %60
  %74 = load i32, ptr %9, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %9, align 4
  br label %56, !llvm.loop !6

76:                                               ; preds = %56
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds nuw %struct.StringPairs, ptr %77, i32 0, i32 0
  %79 = load ptr, ptr %78, align 8
  %80 = load i64, ptr %6, align 8
  %81 = getelementptr inbounds ptr, ptr %79, i64 %80
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %7, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i8, ptr %82, i64 %84
  store i8 0, ptr %85, align 1
  store i32 0, ptr %10, align 4
  br label %86

86:                                               ; preds = %103, %76
  %87 = load i32, ptr %10, align 4
  %88 = load i32, ptr %8, align 4
  %89 = icmp slt i32 %87, %88
  br i1 %89, label %90, label %106

90:                                               ; preds = %86
  %91 = call i32 @Helper_next_int(i32 noundef 10)
  %92 = add i32 97, %91
  %93 = trunc i32 %92 to i8
  %94 = load ptr, ptr %5, align 8
  %95 = getelementptr inbounds nuw %struct.StringPairs, ptr %94, i32 0, i32 1
  %96 = load ptr, ptr %95, align 8
  %97 = load i64, ptr %6, align 8
  %98 = getelementptr inbounds ptr, ptr %96, i64 %97
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %10, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i8, ptr %99, i64 %101
  store i8 %93, ptr %102, align 1
  br label %103

103:                                              ; preds = %90
  %104 = load i32, ptr %10, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, ptr %10, align 4
  br label %86, !llvm.loop !8

106:                                              ; preds = %86
  %107 = load ptr, ptr %5, align 8
  %108 = getelementptr inbounds nuw %struct.StringPairs, ptr %107, i32 0, i32 1
  %109 = load ptr, ptr %108, align 8
  %110 = load i64, ptr %6, align 8
  %111 = getelementptr inbounds ptr, ptr %109, i64 %110
  %112 = load ptr, ptr %111, align 8
  %113 = load i32, ptr %8, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, ptr %112, i64 %114
  store i8 0, ptr %115, align 1
  br label %116

116:                                              ; preds = %106
  %117 = load i64, ptr %6, align 8
  %118 = add nsw i64 %117, 1
  store i64 %118, ptr %6, align 8
  br label %25, !llvm.loop !9

119:                                              ; preds = %25
  %120 = load ptr, ptr %5, align 8
  ret ptr %120
}

declare noalias ptr @malloc(i64 noundef)

declare i32 @Helper_next_int(i32 noundef)

define dso_local void @free_string_pairs(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  br label %56

7:                                                ; preds = %1
  store i64 0, ptr %3, align 8
  br label %8

8:                                                ; preds = %45, %7
  %9 = load i64, ptr %3, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.StringPairs, ptr %10, i32 0, i32 2
  %12 = load i64, ptr %11, align 8
  %13 = icmp ult i64 %9, %12
  br i1 %13, label %14, label %48

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.StringPairs, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = load i64, ptr %3, align 8
  %19 = getelementptr inbounds nuw ptr, ptr %17, i64 %18
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %29

22:                                               ; preds = %14
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.StringPairs, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load i64, ptr %3, align 8
  %27 = getelementptr inbounds nuw ptr, ptr %25, i64 %26
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  br label %29

29:                                               ; preds = %22, %14
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds nuw %struct.StringPairs, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  %33 = load i64, ptr %3, align 8
  %34 = getelementptr inbounds nuw ptr, ptr %32, i64 %33
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %44

37:                                               ; preds = %29
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.StringPairs, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = load i64, ptr %3, align 8
  %42 = getelementptr inbounds nuw ptr, ptr %40, i64 %41
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  br label %44

44:                                               ; preds = %37, %29
  br label %45

45:                                               ; preds = %44
  %46 = load i64, ptr %3, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr %3, align 8
  br label %8, !llvm.loop !10

48:                                               ; preds = %8
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds nuw %struct.StringPairs, ptr %49, i32 0, i32 0
  %51 = load ptr, ptr %50, align 8
  call void @free(ptr noundef %51)
  %52 = load ptr, ptr %2, align 8
  %53 = getelementptr inbounds nuw %struct.StringPairs, ptr %52, i32 0, i32 1
  %54 = load ptr, ptr %53, align 8
  call void @free(ptr noundef %54)
  %55 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %55)
  br label %56

56:                                               ; preds = %48, %6
  ret void
}

declare void @free(ptr noundef)

define dso_local void @Jaro_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.JaroData, ptr %11, i32 0, i32 2
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str.1)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.JaroData, ptr %17, i32 0, i32 3
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.JaroData, ptr %19, i32 0, i32 2
  %21 = load i64, ptr %20, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.JaroData, ptr %22, i32 0, i32 3
  %24 = load i64, ptr %23, align 8
  %25 = call ptr @generate_pair_strings(i64 noundef %21, i64 noundef %24)
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.JaroData, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.JaroData, ptr %28, i32 0, i32 1
  store i32 0, ptr %29, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local double @Jaro_calc(ptr noundef %0, ptr noundef %1) {
  %3 = alloca double, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i64, align 8
  %15 = alloca i64, align 8
  %16 = alloca double, align 8
  %17 = alloca i32, align 4
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca double, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = call i64 @strlen(ptr noundef %21)
  store i64 %22, ptr %6, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = call i64 @strlen(ptr noundef %23)
  store i64 %24, ptr %7, align 8
  %25 = load i64, ptr %6, align 8
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %2
  %28 = load i64, ptr %7, align 8
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %30, label %31

30:                                               ; preds = %27, %2
  store double 0.000000e+00, ptr %3, align 8
  br label %205

31:                                               ; preds = %27
  %32 = load i64, ptr %6, align 8
  %33 = load i64, ptr %7, align 8
  %34 = icmp ugt i64 %32, %33
  br i1 %34, label %35, label %37

35:                                               ; preds = %31
  %36 = load i64, ptr %6, align 8
  br label %39

37:                                               ; preds = %31
  %38 = load i64, ptr %7, align 8
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi i64 [ %36, %35 ], [ %38, %37 ]
  %41 = udiv i64 %40, 2
  %42 = sub i64 %41, 1
  store i64 %42, ptr %8, align 8
  %43 = load i64, ptr %8, align 8
  %44 = icmp slt i64 %43, 0
  br i1 %44, label %45, label %46

45:                                               ; preds = %39
  store i64 0, ptr %8, align 8
  br label %46

46:                                               ; preds = %45, %39
  %47 = load i64, ptr %6, align 8
  %48 = call noalias ptr @calloc(i64 noundef %47, i64 noundef 1)
  store ptr %48, ptr %9, align 8
  %49 = load i64, ptr %7, align 8
  %50 = call noalias ptr @calloc(i64 noundef %49, i64 noundef 1)
  store ptr %50, ptr %10, align 8
  store i32 0, ptr %11, align 4
  store i64 0, ptr %12, align 8
  br label %51

51:                                               ; preds = %118, %46
  %52 = load i64, ptr %12, align 8
  %53 = load i64, ptr %6, align 8
  %54 = icmp ult i64 %52, %53
  br i1 %54, label %55, label %121

55:                                               ; preds = %51
  %56 = load i64, ptr %12, align 8
  %57 = load i64, ptr %8, align 8
  %58 = icmp ugt i64 %56, %57
  br i1 %58, label %59, label %63

59:                                               ; preds = %55
  %60 = load i64, ptr %12, align 8
  %61 = load i64, ptr %8, align 8
  %62 = sub i64 %60, %61
  br label %64

63:                                               ; preds = %55
  br label %64

64:                                               ; preds = %63, %59
  %65 = phi i64 [ %62, %59 ], [ 0, %63 ]
  store i64 %65, ptr %13, align 8
  %66 = load i64, ptr %7, align 8
  %67 = sub i64 %66, 1
  %68 = load i64, ptr %12, align 8
  %69 = load i64, ptr %8, align 8
  %70 = add i64 %68, %69
  %71 = icmp ult i64 %67, %70
  br i1 %71, label %72, label %75

72:                                               ; preds = %64
  %73 = load i64, ptr %7, align 8
  %74 = sub i64 %73, 1
  br label %79

75:                                               ; preds = %64
  %76 = load i64, ptr %12, align 8
  %77 = load i64, ptr %8, align 8
  %78 = add i64 %76, %77
  br label %79

79:                                               ; preds = %75, %72
  %80 = phi i64 [ %74, %72 ], [ %78, %75 ]
  store i64 %80, ptr %14, align 8
  %81 = load i64, ptr %13, align 8
  store i64 %81, ptr %15, align 8
  br label %82

82:                                               ; preds = %114, %79
  %83 = load i64, ptr %15, align 8
  %84 = load i64, ptr %14, align 8
  %85 = icmp ule i64 %83, %84
  br i1 %85, label %86, label %117

86:                                               ; preds = %82
  %87 = load ptr, ptr %10, align 8
  %88 = load i64, ptr %15, align 8
  %89 = getelementptr inbounds nuw i8, ptr %87, i64 %88
  %90 = load i8, ptr %89, align 1
  %91 = trunc i8 %90 to i1
  br i1 %91, label %113, label %92

92:                                               ; preds = %86
  %93 = load ptr, ptr %4, align 8
  %94 = load i64, ptr %12, align 8
  %95 = getelementptr inbounds nuw i8, ptr %93, i64 %94
  %96 = load i8, ptr %95, align 1
  %97 = sext i8 %96 to i32
  %98 = load ptr, ptr %5, align 8
  %99 = load i64, ptr %15, align 8
  %100 = getelementptr inbounds nuw i8, ptr %98, i64 %99
  %101 = load i8, ptr %100, align 1
  %102 = sext i8 %101 to i32
  %103 = icmp eq i32 %97, %102
  br i1 %103, label %104, label %113

104:                                              ; preds = %92
  %105 = load ptr, ptr %9, align 8
  %106 = load i64, ptr %12, align 8
  %107 = getelementptr inbounds nuw i8, ptr %105, i64 %106
  store i8 1, ptr %107, align 1
  %108 = load ptr, ptr %10, align 8
  %109 = load i64, ptr %15, align 8
  %110 = getelementptr inbounds nuw i8, ptr %108, i64 %109
  store i8 1, ptr %110, align 1
  %111 = load i32, ptr %11, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %11, align 4
  br label %117

113:                                              ; preds = %92, %86
  br label %114

114:                                              ; preds = %113
  %115 = load i64, ptr %15, align 8
  %116 = add i64 %115, 1
  store i64 %116, ptr %15, align 8
  br label %82, !llvm.loop !11

117:                                              ; preds = %104, %82
  br label %118

118:                                              ; preds = %117
  %119 = load i64, ptr %12, align 8
  %120 = add i64 %119, 1
  store i64 %120, ptr %12, align 8
  br label %51, !llvm.loop !12

121:                                              ; preds = %51
  store double 0.000000e+00, ptr %16, align 8
  %122 = load i32, ptr %11, align 4
  %123 = icmp sgt i32 %122, 0
  br i1 %123, label %124, label %201

124:                                              ; preds = %121
  store i32 0, ptr %17, align 4
  store i64 0, ptr %18, align 8
  store i64 0, ptr %19, align 8
  br label %125

125:                                              ; preds = %176, %124
  %126 = load i64, ptr %19, align 8
  %127 = load i64, ptr %6, align 8
  %128 = icmp ult i64 %126, %127
  br i1 %128, label %129, label %179

129:                                              ; preds = %125
  %130 = load ptr, ptr %9, align 8
  %131 = load i64, ptr %19, align 8
  %132 = getelementptr inbounds nuw i8, ptr %130, i64 %131
  %133 = load i8, ptr %132, align 1
  %134 = trunc i8 %133 to i1
  br i1 %134, label %135, label %175

135:                                              ; preds = %129
  br label %136

136:                                              ; preds = %149, %135
  %137 = load i64, ptr %18, align 8
  %138 = load i64, ptr %7, align 8
  %139 = icmp ult i64 %137, %138
  br i1 %139, label %140, label %147

140:                                              ; preds = %136
  %141 = load ptr, ptr %10, align 8
  %142 = load i64, ptr %18, align 8
  %143 = getelementptr inbounds nuw i8, ptr %141, i64 %142
  %144 = load i8, ptr %143, align 1
  %145 = trunc i8 %144 to i1
  %146 = xor i1 %145, true
  br label %147

147:                                              ; preds = %140, %136
  %148 = phi i1 [ false, %136 ], [ %146, %140 ]
  br i1 %148, label %149, label %152

149:                                              ; preds = %147
  %150 = load i64, ptr %18, align 8
  %151 = add i64 %150, 1
  store i64 %151, ptr %18, align 8
  br label %136, !llvm.loop !13

152:                                              ; preds = %147
  %153 = load i64, ptr %18, align 8
  %154 = load i64, ptr %7, align 8
  %155 = icmp ult i64 %153, %154
  br i1 %155, label %156, label %174

156:                                              ; preds = %152
  %157 = load ptr, ptr %4, align 8
  %158 = load i64, ptr %19, align 8
  %159 = getelementptr inbounds nuw i8, ptr %157, i64 %158
  %160 = load i8, ptr %159, align 1
  %161 = sext i8 %160 to i32
  %162 = load ptr, ptr %5, align 8
  %163 = load i64, ptr %18, align 8
  %164 = getelementptr inbounds nuw i8, ptr %162, i64 %163
  %165 = load i8, ptr %164, align 1
  %166 = sext i8 %165 to i32
  %167 = icmp ne i32 %161, %166
  br i1 %167, label %168, label %171

168:                                              ; preds = %156
  %169 = load i32, ptr %17, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, ptr %17, align 4
  br label %171

171:                                              ; preds = %168, %156
  %172 = load i64, ptr %18, align 8
  %173 = add i64 %172, 1
  store i64 %173, ptr %18, align 8
  br label %174

174:                                              ; preds = %171, %152
  br label %175

175:                                              ; preds = %174, %129
  br label %176

176:                                              ; preds = %175
  %177 = load i64, ptr %19, align 8
  %178 = add i64 %177, 1
  store i64 %178, ptr %19, align 8
  br label %125, !llvm.loop !14

179:                                              ; preds = %125
  %180 = load i32, ptr %17, align 4
  %181 = sdiv i32 %180, 2
  store i32 %181, ptr %17, align 4
  %182 = load i32, ptr %11, align 4
  %183 = sitofp i32 %182 to double
  store double %183, ptr %20, align 8
  %184 = load double, ptr %20, align 8
  %185 = load i64, ptr %6, align 8
  %186 = uitofp i64 %185 to double
  %187 = fdiv double %184, %186
  %188 = load double, ptr %20, align 8
  %189 = load i64, ptr %7, align 8
  %190 = uitofp i64 %189 to double
  %191 = fdiv double %188, %190
  %192 = fadd double %187, %191
  %193 = load double, ptr %20, align 8
  %194 = load i32, ptr %17, align 4
  %195 = sitofp i32 %194 to double
  %196 = fsub double %193, %195
  %197 = load double, ptr %20, align 8
  %198 = fdiv double %196, %197
  %199 = fadd double %192, %198
  %200 = fdiv double %199, 3.000000e+00
  store double %200, ptr %16, align 8
  br label %201

201:                                              ; preds = %179, %121
  %202 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %202)
  %203 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %203)
  %204 = load double, ptr %16, align 8
  store double %204, ptr %3, align 8
  br label %205

205:                                              ; preds = %201, %30
  %206 = load double, ptr %3, align 8
  ret double %206
}

declare i64 @strlen(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define dso_local void @Jaro_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.JaroData, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  store i64 0, ptr %7, align 8
  br label %16

16:                                               ; preds = %43, %2
  %17 = load i64, ptr %7, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds nuw %struct.StringPairs, ptr %18, i32 0, i32 2
  %20 = load i64, ptr %19, align 8
  %21 = icmp ult i64 %17, %20
  br i1 %21, label %22, label %46

22:                                               ; preds = %16
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds nuw %struct.StringPairs, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load i64, ptr %7, align 8
  %27 = getelementptr inbounds nuw ptr, ptr %25, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds nuw %struct.StringPairs, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = load i64, ptr %7, align 8
  %33 = getelementptr inbounds nuw ptr, ptr %31, i64 %32
  %34 = load ptr, ptr %33, align 8
  %35 = call double @Jaro_calc(ptr noundef %28, ptr noundef %34)
  store double %35, ptr %8, align 8
  %36 = load double, ptr %8, align 8
  %37 = fmul double %36, 1.000000e+03
  %38 = fptoui double %37 to i32
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.JaroData, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 8
  %42 = add i32 %41, %38
  store i32 %42, ptr %40, align 8
  br label %43

43:                                               ; preds = %22
  %44 = load i64, ptr %7, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %7, align 8
  br label %16, !llvm.loop !15

46:                                               ; preds = %16
  ret void
}

define dso_local i32 @Jaro_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JaroData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @Jaro_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.JaroData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.JaroData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free_string_pairs(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.JaroData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @Jaro_create() {
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
  store ptr @Jaro_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Jaro_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Jaro_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Jaro_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define dso_local void @NGram_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.NGramData, ptr %11, i32 0, i32 2
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str.1)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.NGramData, ptr %17, i32 0, i32 3
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.NGramData, ptr %19, i32 0, i32 2
  %21 = load i64, ptr %20, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.NGramData, ptr %22, i32 0, i32 3
  %24 = load i64, ptr %23, align 8
  %25 = call ptr @generate_pair_strings(i64 noundef %21, i64 noundef %24)
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.NGramData, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.NGramData, ptr %28, i32 0, i32 1
  store i32 0, ptr %29, align 8
  ret void
}

define dso_local double @NGram_calc(ptr noundef %0, ptr noundef %1) {
  %3 = alloca double, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca i32, align 4
  %33 = alloca i64, align 8
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca ptr, align 8
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca ptr, align 8
  %47 = alloca i32, align 4
  %48 = alloca ptr, align 8
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca ptr, align 8
  %52 = alloca ptr, align 8
  %53 = alloca ptr, align 8
  %54 = alloca ptr, align 8
  %55 = alloca ptr, align 8
  %56 = alloca i32, align 4
  %57 = alloca i32, align 4
  %58 = alloca i32, align 4
  %59 = alloca i32, align 4
  %60 = alloca ptr, align 8
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca ptr, align 8
  %64 = alloca ptr, align 8
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  %67 = alloca ptr, align 8
  %68 = alloca ptr, align 8
  %69 = alloca i32, align 4
  %70 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %71 = load ptr, ptr %4, align 8
  %72 = call i64 @strlen(ptr noundef %71)
  store i64 %72, ptr %6, align 8
  %73 = load ptr, ptr %5, align 8
  %74 = call i64 @strlen(ptr noundef %73)
  store i64 %74, ptr %7, align 8
  %75 = load i64, ptr %6, align 8
  %76 = icmp ult i64 %75, 4
  br i1 %76, label %80, label %77

77:                                               ; preds = %2
  %78 = load i64, ptr %7, align 8
  %79 = icmp ult i64 %78, 4
  br i1 %79, label %80, label %81

80:                                               ; preds = %77, %2
  store double 0.000000e+00, ptr %3, align 8
  br label %3729

81:                                               ; preds = %77
  store ptr null, ptr %8, align 8
  store i64 0, ptr %9, align 8
  br label %82

82:                                               ; preds = %1442, %81
  %83 = load i64, ptr %9, align 8
  %84 = load i64, ptr %6, align 8
  %85 = sub i64 %84, 4
  %86 = icmp ule i64 %83, %85
  br i1 %86, label %87, label %1445

87:                                               ; preds = %82
  %88 = load ptr, ptr %4, align 8
  %89 = load i64, ptr %9, align 8
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 %89
  %91 = load i8, ptr %90, align 1
  %92 = zext i8 %91 to i32
  %93 = shl i32 %92, 24
  %94 = load ptr, ptr %4, align 8
  %95 = load i64, ptr %9, align 8
  %96 = add i64 %95, 1
  %97 = getelementptr inbounds nuw i8, ptr %94, i64 %96
  %98 = load i8, ptr %97, align 1
  %99 = zext i8 %98 to i32
  %100 = shl i32 %99, 16
  %101 = or i32 %93, %100
  %102 = load ptr, ptr %4, align 8
  %103 = load i64, ptr %9, align 8
  %104 = add i64 %103, 2
  %105 = getelementptr inbounds nuw i8, ptr %102, i64 %104
  %106 = load i8, ptr %105, align 1
  %107 = zext i8 %106 to i32
  %108 = shl i32 %107, 8
  %109 = or i32 %101, %108
  %110 = load ptr, ptr %4, align 8
  %111 = load i64, ptr %9, align 8
  %112 = add i64 %111, 3
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 %112
  %114 = load i8, ptr %113, align 1
  %115 = zext i8 %114 to i32
  %116 = or i32 %109, %115
  store i32 %116, ptr %10, align 4
  br label %117

117:                                              ; preds = %87
  store ptr null, ptr %11, align 8
  %118 = load ptr, ptr %8, align 8
  %119 = icmp ne ptr %118, null
  br i1 %119, label %120, label %586

120:                                              ; preds = %117
  br label %121

121:                                              ; preds = %120
  br label %122

122:                                              ; preds = %121
  store ptr %10, ptr %16, align 8
  store i32 -17973521, ptr %12, align 4
  store i32 -1640531527, ptr %14, align 4
  store i32 -1640531527, ptr %13, align 4
  store i32 4, ptr %15, align 4
  br label %123

123:                                              ; preds = %290, %122
  %124 = load i32, ptr %15, align 4
  %125 = icmp uge i32 %124, 12
  br i1 %125, label %126, label %295

126:                                              ; preds = %123
  %127 = load ptr, ptr %16, align 8
  %128 = getelementptr inbounds i8, ptr %127, i64 0
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = load ptr, ptr %16, align 8
  %132 = getelementptr inbounds i8, ptr %131, i64 1
  %133 = load i8, ptr %132, align 1
  %134 = zext i8 %133 to i32
  %135 = shl i32 %134, 8
  %136 = add i32 %130, %135
  %137 = load ptr, ptr %16, align 8
  %138 = getelementptr inbounds i8, ptr %137, i64 2
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  %141 = shl i32 %140, 16
  %142 = add i32 %136, %141
  %143 = load ptr, ptr %16, align 8
  %144 = getelementptr inbounds i8, ptr %143, i64 3
  %145 = load i8, ptr %144, align 1
  %146 = zext i8 %145 to i32
  %147 = shl i32 %146, 24
  %148 = add i32 %142, %147
  %149 = load i32, ptr %13, align 4
  %150 = add i32 %149, %148
  store i32 %150, ptr %13, align 4
  %151 = load ptr, ptr %16, align 8
  %152 = getelementptr inbounds i8, ptr %151, i64 4
  %153 = load i8, ptr %152, align 1
  %154 = zext i8 %153 to i32
  %155 = load ptr, ptr %16, align 8
  %156 = getelementptr inbounds i8, ptr %155, i64 5
  %157 = load i8, ptr %156, align 1
  %158 = zext i8 %157 to i32
  %159 = shl i32 %158, 8
  %160 = add i32 %154, %159
  %161 = load ptr, ptr %16, align 8
  %162 = getelementptr inbounds i8, ptr %161, i64 6
  %163 = load i8, ptr %162, align 1
  %164 = zext i8 %163 to i32
  %165 = shl i32 %164, 16
  %166 = add i32 %160, %165
  %167 = load ptr, ptr %16, align 8
  %168 = getelementptr inbounds i8, ptr %167, i64 7
  %169 = load i8, ptr %168, align 1
  %170 = zext i8 %169 to i32
  %171 = shl i32 %170, 24
  %172 = add i32 %166, %171
  %173 = load i32, ptr %14, align 4
  %174 = add i32 %173, %172
  store i32 %174, ptr %14, align 4
  %175 = load ptr, ptr %16, align 8
  %176 = getelementptr inbounds i8, ptr %175, i64 8
  %177 = load i8, ptr %176, align 1
  %178 = zext i8 %177 to i32
  %179 = load ptr, ptr %16, align 8
  %180 = getelementptr inbounds i8, ptr %179, i64 9
  %181 = load i8, ptr %180, align 1
  %182 = zext i8 %181 to i32
  %183 = shl i32 %182, 8
  %184 = add i32 %178, %183
  %185 = load ptr, ptr %16, align 8
  %186 = getelementptr inbounds i8, ptr %185, i64 10
  %187 = load i8, ptr %186, align 1
  %188 = zext i8 %187 to i32
  %189 = shl i32 %188, 16
  %190 = add i32 %184, %189
  %191 = load ptr, ptr %16, align 8
  %192 = getelementptr inbounds i8, ptr %191, i64 11
  %193 = load i8, ptr %192, align 1
  %194 = zext i8 %193 to i32
  %195 = shl i32 %194, 24
  %196 = add i32 %190, %195
  %197 = load i32, ptr %12, align 4
  %198 = add i32 %197, %196
  store i32 %198, ptr %12, align 4
  br label %199

199:                                              ; preds = %126
  %200 = load i32, ptr %14, align 4
  %201 = load i32, ptr %13, align 4
  %202 = sub i32 %201, %200
  store i32 %202, ptr %13, align 4
  %203 = load i32, ptr %12, align 4
  %204 = load i32, ptr %13, align 4
  %205 = sub i32 %204, %203
  store i32 %205, ptr %13, align 4
  %206 = load i32, ptr %12, align 4
  %207 = lshr i32 %206, 13
  %208 = load i32, ptr %13, align 4
  %209 = xor i32 %208, %207
  store i32 %209, ptr %13, align 4
  %210 = load i32, ptr %12, align 4
  %211 = load i32, ptr %14, align 4
  %212 = sub i32 %211, %210
  store i32 %212, ptr %14, align 4
  %213 = load i32, ptr %13, align 4
  %214 = load i32, ptr %14, align 4
  %215 = sub i32 %214, %213
  store i32 %215, ptr %14, align 4
  %216 = load i32, ptr %13, align 4
  %217 = shl i32 %216, 8
  %218 = load i32, ptr %14, align 4
  %219 = xor i32 %218, %217
  store i32 %219, ptr %14, align 4
  %220 = load i32, ptr %13, align 4
  %221 = load i32, ptr %12, align 4
  %222 = sub i32 %221, %220
  store i32 %222, ptr %12, align 4
  %223 = load i32, ptr %14, align 4
  %224 = load i32, ptr %12, align 4
  %225 = sub i32 %224, %223
  store i32 %225, ptr %12, align 4
  %226 = load i32, ptr %14, align 4
  %227 = lshr i32 %226, 13
  %228 = load i32, ptr %12, align 4
  %229 = xor i32 %228, %227
  store i32 %229, ptr %12, align 4
  %230 = load i32, ptr %14, align 4
  %231 = load i32, ptr %13, align 4
  %232 = sub i32 %231, %230
  store i32 %232, ptr %13, align 4
  %233 = load i32, ptr %12, align 4
  %234 = load i32, ptr %13, align 4
  %235 = sub i32 %234, %233
  store i32 %235, ptr %13, align 4
  %236 = load i32, ptr %12, align 4
  %237 = lshr i32 %236, 12
  %238 = load i32, ptr %13, align 4
  %239 = xor i32 %238, %237
  store i32 %239, ptr %13, align 4
  %240 = load i32, ptr %12, align 4
  %241 = load i32, ptr %14, align 4
  %242 = sub i32 %241, %240
  store i32 %242, ptr %14, align 4
  %243 = load i32, ptr %13, align 4
  %244 = load i32, ptr %14, align 4
  %245 = sub i32 %244, %243
  store i32 %245, ptr %14, align 4
  %246 = load i32, ptr %13, align 4
  %247 = shl i32 %246, 16
  %248 = load i32, ptr %14, align 4
  %249 = xor i32 %248, %247
  store i32 %249, ptr %14, align 4
  %250 = load i32, ptr %13, align 4
  %251 = load i32, ptr %12, align 4
  %252 = sub i32 %251, %250
  store i32 %252, ptr %12, align 4
  %253 = load i32, ptr %14, align 4
  %254 = load i32, ptr %12, align 4
  %255 = sub i32 %254, %253
  store i32 %255, ptr %12, align 4
  %256 = load i32, ptr %14, align 4
  %257 = lshr i32 %256, 5
  %258 = load i32, ptr %12, align 4
  %259 = xor i32 %258, %257
  store i32 %259, ptr %12, align 4
  %260 = load i32, ptr %14, align 4
  %261 = load i32, ptr %13, align 4
  %262 = sub i32 %261, %260
  store i32 %262, ptr %13, align 4
  %263 = load i32, ptr %12, align 4
  %264 = load i32, ptr %13, align 4
  %265 = sub i32 %264, %263
  store i32 %265, ptr %13, align 4
  %266 = load i32, ptr %12, align 4
  %267 = lshr i32 %266, 3
  %268 = load i32, ptr %13, align 4
  %269 = xor i32 %268, %267
  store i32 %269, ptr %13, align 4
  %270 = load i32, ptr %12, align 4
  %271 = load i32, ptr %14, align 4
  %272 = sub i32 %271, %270
  store i32 %272, ptr %14, align 4
  %273 = load i32, ptr %13, align 4
  %274 = load i32, ptr %14, align 4
  %275 = sub i32 %274, %273
  store i32 %275, ptr %14, align 4
  %276 = load i32, ptr %13, align 4
  %277 = shl i32 %276, 10
  %278 = load i32, ptr %14, align 4
  %279 = xor i32 %278, %277
  store i32 %279, ptr %14, align 4
  %280 = load i32, ptr %13, align 4
  %281 = load i32, ptr %12, align 4
  %282 = sub i32 %281, %280
  store i32 %282, ptr %12, align 4
  %283 = load i32, ptr %14, align 4
  %284 = load i32, ptr %12, align 4
  %285 = sub i32 %284, %283
  store i32 %285, ptr %12, align 4
  %286 = load i32, ptr %14, align 4
  %287 = lshr i32 %286, 15
  %288 = load i32, ptr %12, align 4
  %289 = xor i32 %288, %287
  store i32 %289, ptr %12, align 4
  br label %290

290:                                              ; preds = %199
  %291 = load ptr, ptr %16, align 8
  %292 = getelementptr inbounds i8, ptr %291, i64 12
  store ptr %292, ptr %16, align 8
  %293 = load i32, ptr %15, align 4
  %294 = sub i32 %293, 12
  store i32 %294, ptr %15, align 4
  br label %123, !llvm.loop !16

295:                                              ; preds = %123
  %296 = load i32, ptr %12, align 4
  %297 = add i32 %296, 4
  store i32 %297, ptr %12, align 4
  %298 = load i32, ptr %15, align 4
  switch i32 %298, label %385 [
    i32 11, label %299
    i32 10, label %307
    i32 9, label %315
    i32 8, label %323
    i32 7, label %331
    i32 6, label %339
    i32 5, label %347
    i32 4, label %354
    i32 3, label %362
    i32 2, label %370
    i32 1, label %378
  ]

299:                                              ; preds = %295
  %300 = load ptr, ptr %16, align 8
  %301 = getelementptr inbounds i8, ptr %300, i64 10
  %302 = load i8, ptr %301, align 1
  %303 = zext i8 %302 to i32
  %304 = shl i32 %303, 24
  %305 = load i32, ptr %12, align 4
  %306 = add i32 %305, %304
  store i32 %306, ptr %12, align 4
  br label %307

307:                                              ; preds = %295, %299
  %308 = load ptr, ptr %16, align 8
  %309 = getelementptr inbounds i8, ptr %308, i64 9
  %310 = load i8, ptr %309, align 1
  %311 = zext i8 %310 to i32
  %312 = shl i32 %311, 16
  %313 = load i32, ptr %12, align 4
  %314 = add i32 %313, %312
  store i32 %314, ptr %12, align 4
  br label %315

315:                                              ; preds = %295, %307
  %316 = load ptr, ptr %16, align 8
  %317 = getelementptr inbounds i8, ptr %316, i64 8
  %318 = load i8, ptr %317, align 1
  %319 = zext i8 %318 to i32
  %320 = shl i32 %319, 8
  %321 = load i32, ptr %12, align 4
  %322 = add i32 %321, %320
  store i32 %322, ptr %12, align 4
  br label %323

323:                                              ; preds = %295, %315
  %324 = load ptr, ptr %16, align 8
  %325 = getelementptr inbounds i8, ptr %324, i64 7
  %326 = load i8, ptr %325, align 1
  %327 = zext i8 %326 to i32
  %328 = shl i32 %327, 24
  %329 = load i32, ptr %14, align 4
  %330 = add i32 %329, %328
  store i32 %330, ptr %14, align 4
  br label %331

331:                                              ; preds = %295, %323
  %332 = load ptr, ptr %16, align 8
  %333 = getelementptr inbounds i8, ptr %332, i64 6
  %334 = load i8, ptr %333, align 1
  %335 = zext i8 %334 to i32
  %336 = shl i32 %335, 16
  %337 = load i32, ptr %14, align 4
  %338 = add i32 %337, %336
  store i32 %338, ptr %14, align 4
  br label %339

339:                                              ; preds = %295, %331
  %340 = load ptr, ptr %16, align 8
  %341 = getelementptr inbounds i8, ptr %340, i64 5
  %342 = load i8, ptr %341, align 1
  %343 = zext i8 %342 to i32
  %344 = shl i32 %343, 8
  %345 = load i32, ptr %14, align 4
  %346 = add i32 %345, %344
  store i32 %346, ptr %14, align 4
  br label %347

347:                                              ; preds = %295, %339
  %348 = load ptr, ptr %16, align 8
  %349 = getelementptr inbounds i8, ptr %348, i64 4
  %350 = load i8, ptr %349, align 1
  %351 = zext i8 %350 to i32
  %352 = load i32, ptr %14, align 4
  %353 = add i32 %352, %351
  store i32 %353, ptr %14, align 4
  br label %354

354:                                              ; preds = %295, %347
  %355 = load ptr, ptr %16, align 8
  %356 = getelementptr inbounds i8, ptr %355, i64 3
  %357 = load i8, ptr %356, align 1
  %358 = zext i8 %357 to i32
  %359 = shl i32 %358, 24
  %360 = load i32, ptr %13, align 4
  %361 = add i32 %360, %359
  store i32 %361, ptr %13, align 4
  br label %362

362:                                              ; preds = %295, %354
  %363 = load ptr, ptr %16, align 8
  %364 = getelementptr inbounds i8, ptr %363, i64 2
  %365 = load i8, ptr %364, align 1
  %366 = zext i8 %365 to i32
  %367 = shl i32 %366, 16
  %368 = load i32, ptr %13, align 4
  %369 = add i32 %368, %367
  store i32 %369, ptr %13, align 4
  br label %370

370:                                              ; preds = %295, %362
  %371 = load ptr, ptr %16, align 8
  %372 = getelementptr inbounds i8, ptr %371, i64 1
  %373 = load i8, ptr %372, align 1
  %374 = zext i8 %373 to i32
  %375 = shl i32 %374, 8
  %376 = load i32, ptr %13, align 4
  %377 = add i32 %376, %375
  store i32 %377, ptr %13, align 4
  br label %378

378:                                              ; preds = %295, %370
  %379 = load ptr, ptr %16, align 8
  %380 = getelementptr inbounds i8, ptr %379, i64 0
  %381 = load i8, ptr %380, align 1
  %382 = zext i8 %381 to i32
  %383 = load i32, ptr %13, align 4
  %384 = add i32 %383, %382
  store i32 %384, ptr %13, align 4
  br label %385

385:                                              ; preds = %295, %378
  br label %386

386:                                              ; preds = %385
  br label %387

387:                                              ; preds = %386
  %388 = load i32, ptr %14, align 4
  %389 = load i32, ptr %13, align 4
  %390 = sub i32 %389, %388
  store i32 %390, ptr %13, align 4
  %391 = load i32, ptr %12, align 4
  %392 = load i32, ptr %13, align 4
  %393 = sub i32 %392, %391
  store i32 %393, ptr %13, align 4
  %394 = load i32, ptr %12, align 4
  %395 = lshr i32 %394, 13
  %396 = load i32, ptr %13, align 4
  %397 = xor i32 %396, %395
  store i32 %397, ptr %13, align 4
  %398 = load i32, ptr %12, align 4
  %399 = load i32, ptr %14, align 4
  %400 = sub i32 %399, %398
  store i32 %400, ptr %14, align 4
  %401 = load i32, ptr %13, align 4
  %402 = load i32, ptr %14, align 4
  %403 = sub i32 %402, %401
  store i32 %403, ptr %14, align 4
  %404 = load i32, ptr %13, align 4
  %405 = shl i32 %404, 8
  %406 = load i32, ptr %14, align 4
  %407 = xor i32 %406, %405
  store i32 %407, ptr %14, align 4
  %408 = load i32, ptr %13, align 4
  %409 = load i32, ptr %12, align 4
  %410 = sub i32 %409, %408
  store i32 %410, ptr %12, align 4
  %411 = load i32, ptr %14, align 4
  %412 = load i32, ptr %12, align 4
  %413 = sub i32 %412, %411
  store i32 %413, ptr %12, align 4
  %414 = load i32, ptr %14, align 4
  %415 = lshr i32 %414, 13
  %416 = load i32, ptr %12, align 4
  %417 = xor i32 %416, %415
  store i32 %417, ptr %12, align 4
  %418 = load i32, ptr %14, align 4
  %419 = load i32, ptr %13, align 4
  %420 = sub i32 %419, %418
  store i32 %420, ptr %13, align 4
  %421 = load i32, ptr %12, align 4
  %422 = load i32, ptr %13, align 4
  %423 = sub i32 %422, %421
  store i32 %423, ptr %13, align 4
  %424 = load i32, ptr %12, align 4
  %425 = lshr i32 %424, 12
  %426 = load i32, ptr %13, align 4
  %427 = xor i32 %426, %425
  store i32 %427, ptr %13, align 4
  %428 = load i32, ptr %12, align 4
  %429 = load i32, ptr %14, align 4
  %430 = sub i32 %429, %428
  store i32 %430, ptr %14, align 4
  %431 = load i32, ptr %13, align 4
  %432 = load i32, ptr %14, align 4
  %433 = sub i32 %432, %431
  store i32 %433, ptr %14, align 4
  %434 = load i32, ptr %13, align 4
  %435 = shl i32 %434, 16
  %436 = load i32, ptr %14, align 4
  %437 = xor i32 %436, %435
  store i32 %437, ptr %14, align 4
  %438 = load i32, ptr %13, align 4
  %439 = load i32, ptr %12, align 4
  %440 = sub i32 %439, %438
  store i32 %440, ptr %12, align 4
  %441 = load i32, ptr %14, align 4
  %442 = load i32, ptr %12, align 4
  %443 = sub i32 %442, %441
  store i32 %443, ptr %12, align 4
  %444 = load i32, ptr %14, align 4
  %445 = lshr i32 %444, 5
  %446 = load i32, ptr %12, align 4
  %447 = xor i32 %446, %445
  store i32 %447, ptr %12, align 4
  %448 = load i32, ptr %14, align 4
  %449 = load i32, ptr %13, align 4
  %450 = sub i32 %449, %448
  store i32 %450, ptr %13, align 4
  %451 = load i32, ptr %12, align 4
  %452 = load i32, ptr %13, align 4
  %453 = sub i32 %452, %451
  store i32 %453, ptr %13, align 4
  %454 = load i32, ptr %12, align 4
  %455 = lshr i32 %454, 3
  %456 = load i32, ptr %13, align 4
  %457 = xor i32 %456, %455
  store i32 %457, ptr %13, align 4
  %458 = load i32, ptr %12, align 4
  %459 = load i32, ptr %14, align 4
  %460 = sub i32 %459, %458
  store i32 %460, ptr %14, align 4
  %461 = load i32, ptr %13, align 4
  %462 = load i32, ptr %14, align 4
  %463 = sub i32 %462, %461
  store i32 %463, ptr %14, align 4
  %464 = load i32, ptr %13, align 4
  %465 = shl i32 %464, 10
  %466 = load i32, ptr %14, align 4
  %467 = xor i32 %466, %465
  store i32 %467, ptr %14, align 4
  %468 = load i32, ptr %13, align 4
  %469 = load i32, ptr %12, align 4
  %470 = sub i32 %469, %468
  store i32 %470, ptr %12, align 4
  %471 = load i32, ptr %14, align 4
  %472 = load i32, ptr %12, align 4
  %473 = sub i32 %472, %471
  store i32 %473, ptr %12, align 4
  %474 = load i32, ptr %14, align 4
  %475 = lshr i32 %474, 15
  %476 = load i32, ptr %12, align 4
  %477 = xor i32 %476, %475
  store i32 %477, ptr %12, align 4
  br label %478

478:                                              ; preds = %387
  br label %479

479:                                              ; preds = %478
  br label %480

480:                                              ; preds = %479
  br label %481

481:                                              ; preds = %480
  store ptr null, ptr %11, align 8
  %482 = load ptr, ptr %8, align 8
  %483 = icmp ne ptr %482, null
  br i1 %483, label %484, label %584

484:                                              ; preds = %481
  br label %485

485:                                              ; preds = %484
  %486 = load i32, ptr %12, align 4
  %487 = load ptr, ptr %8, align 8
  %488 = getelementptr inbounds nuw %struct.GramHash, ptr %487, i32 0, i32 2
  %489 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %488, i32 0, i32 0
  %490 = load ptr, ptr %489, align 8
  %491 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %490, i32 0, i32 1
  %492 = load i32, ptr %491, align 8
  %493 = sub i32 %492, 1
  %494 = and i32 %486, %493
  store i32 %494, ptr %17, align 4
  br label %495

495:                                              ; preds = %485
  br label %496

496:                                              ; preds = %495
  %497 = load ptr, ptr %8, align 8
  %498 = getelementptr inbounds nuw %struct.GramHash, ptr %497, i32 0, i32 2
  %499 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %498, i32 0, i32 0
  %500 = load ptr, ptr %499, align 8
  %501 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %500, i32 0, i32 0
  %502 = load ptr, ptr %501, align 8
  %503 = load i32, ptr %17, align 4
  %504 = zext i32 %503 to i64
  %505 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %502, i64 %504
  %506 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %505, i32 0, i32 0
  %507 = load ptr, ptr %506, align 8
  %508 = icmp ne ptr %507, null
  br i1 %508, label %509, label %531

509:                                              ; preds = %496
  br label %510

510:                                              ; preds = %509
  %511 = load ptr, ptr %8, align 8
  %512 = getelementptr inbounds nuw %struct.GramHash, ptr %511, i32 0, i32 2
  %513 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %512, i32 0, i32 0
  %514 = load ptr, ptr %513, align 8
  %515 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %514, i32 0, i32 0
  %516 = load ptr, ptr %515, align 8
  %517 = load i32, ptr %17, align 4
  %518 = zext i32 %517 to i64
  %519 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %516, i64 %518
  %520 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %519, i32 0, i32 0
  %521 = load ptr, ptr %520, align 8
  %522 = load ptr, ptr %8, align 8
  %523 = getelementptr inbounds nuw %struct.GramHash, ptr %522, i32 0, i32 2
  %524 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %523, i32 0, i32 0
  %525 = load ptr, ptr %524, align 8
  %526 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %525, i32 0, i32 5
  %527 = load i64, ptr %526, align 8
  %528 = sub i64 0, %527
  %529 = getelementptr inbounds i8, ptr %521, i64 %528
  store ptr %529, ptr %11, align 8
  br label %530

530:                                              ; preds = %510
  br label %532

531:                                              ; preds = %496
  store ptr null, ptr %11, align 8
  br label %532

532:                                              ; preds = %531, %530
  br label %533

533:                                              ; preds = %581, %532
  %534 = load ptr, ptr %11, align 8
  %535 = icmp ne ptr %534, null
  br i1 %535, label %536, label %582

536:                                              ; preds = %533
  %537 = load ptr, ptr %11, align 8
  %538 = getelementptr inbounds nuw %struct.GramHash, ptr %537, i32 0, i32 2
  %539 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %538, i32 0, i32 7
  %540 = load i32, ptr %539, align 4
  %541 = load i32, ptr %12, align 4
  %542 = icmp eq i32 %540, %541
  br i1 %542, label %543, label %559

543:                                              ; preds = %536
  %544 = load ptr, ptr %11, align 8
  %545 = getelementptr inbounds nuw %struct.GramHash, ptr %544, i32 0, i32 2
  %546 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %545, i32 0, i32 6
  %547 = load i32, ptr %546, align 8
  %548 = zext i32 %547 to i64
  %549 = icmp eq i64 %548, 4
  br i1 %549, label %550, label %559

550:                                              ; preds = %543
  %551 = load ptr, ptr %11, align 8
  %552 = getelementptr inbounds nuw %struct.GramHash, ptr %551, i32 0, i32 2
  %553 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %552, i32 0, i32 5
  %554 = load ptr, ptr %553, align 8
  %555 = call i32 @memcmp(ptr noundef %554, ptr noundef %10, i64 noundef 4)
  %556 = icmp eq i32 %555, 0
  br i1 %556, label %557, label %558

557:                                              ; preds = %550
  br label %582

558:                                              ; preds = %550
  br label %559

559:                                              ; preds = %558, %543, %536
  %560 = load ptr, ptr %11, align 8
  %561 = getelementptr inbounds nuw %struct.GramHash, ptr %560, i32 0, i32 2
  %562 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %561, i32 0, i32 4
  %563 = load ptr, ptr %562, align 8
  %564 = icmp ne ptr %563, null
  br i1 %564, label %565, label %580

565:                                              ; preds = %559
  br label %566

566:                                              ; preds = %565
  %567 = load ptr, ptr %11, align 8
  %568 = getelementptr inbounds nuw %struct.GramHash, ptr %567, i32 0, i32 2
  %569 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %568, i32 0, i32 4
  %570 = load ptr, ptr %569, align 8
  %571 = load ptr, ptr %8, align 8
  %572 = getelementptr inbounds nuw %struct.GramHash, ptr %571, i32 0, i32 2
  %573 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %572, i32 0, i32 0
  %574 = load ptr, ptr %573, align 8
  %575 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %574, i32 0, i32 5
  %576 = load i64, ptr %575, align 8
  %577 = sub i64 0, %576
  %578 = getelementptr inbounds i8, ptr %570, i64 %577
  store ptr %578, ptr %11, align 8
  br label %579

579:                                              ; preds = %566
  br label %581

580:                                              ; preds = %559
  store ptr null, ptr %11, align 8
  br label %581

581:                                              ; preds = %580, %579
  br label %533, !llvm.loop !17

582:                                              ; preds = %557, %533
  br label %583

583:                                              ; preds = %582
  br label %584

584:                                              ; preds = %583, %481
  br label %585

585:                                              ; preds = %584
  br label %586

586:                                              ; preds = %585, %117
  br label %587

587:                                              ; preds = %586
  %588 = load ptr, ptr %11, align 8
  %589 = icmp ne ptr %588, null
  br i1 %589, label %590, label %595

590:                                              ; preds = %587
  %591 = load ptr, ptr %11, align 8
  %592 = getelementptr inbounds nuw %struct.GramHash, ptr %591, i32 0, i32 1
  %593 = load i32, ptr %592, align 4
  %594 = add nsw i32 %593, 1
  store i32 %594, ptr %592, align 4
  br label %1441

595:                                              ; preds = %587
  %596 = call noalias ptr @malloc(i64 noundef 64)
  store ptr %596, ptr %11, align 8
  %597 = load i32, ptr %10, align 4
  %598 = load ptr, ptr %11, align 8
  %599 = getelementptr inbounds nuw %struct.GramHash, ptr %598, i32 0, i32 0
  store i32 %597, ptr %599, align 8
  %600 = load ptr, ptr %11, align 8
  %601 = getelementptr inbounds nuw %struct.GramHash, ptr %600, i32 0, i32 1
  store i32 1, ptr %601, align 4
  br label %602

602:                                              ; preds = %595
  br label %603

603:                                              ; preds = %602
  br label %604

604:                                              ; preds = %603
  %605 = load ptr, ptr %11, align 8
  %606 = getelementptr inbounds nuw %struct.GramHash, ptr %605, i32 0, i32 0
  store ptr %606, ptr %22, align 8
  store i32 -17973521, ptr %18, align 4
  store i32 -1640531527, ptr %20, align 4
  store i32 -1640531527, ptr %19, align 4
  store i32 4, ptr %21, align 4
  br label %607

607:                                              ; preds = %774, %604
  %608 = load i32, ptr %21, align 4
  %609 = icmp uge i32 %608, 12
  br i1 %609, label %610, label %779

610:                                              ; preds = %607
  %611 = load ptr, ptr %22, align 8
  %612 = getelementptr inbounds i8, ptr %611, i64 0
  %613 = load i8, ptr %612, align 1
  %614 = zext i8 %613 to i32
  %615 = load ptr, ptr %22, align 8
  %616 = getelementptr inbounds i8, ptr %615, i64 1
  %617 = load i8, ptr %616, align 1
  %618 = zext i8 %617 to i32
  %619 = shl i32 %618, 8
  %620 = add i32 %614, %619
  %621 = load ptr, ptr %22, align 8
  %622 = getelementptr inbounds i8, ptr %621, i64 2
  %623 = load i8, ptr %622, align 1
  %624 = zext i8 %623 to i32
  %625 = shl i32 %624, 16
  %626 = add i32 %620, %625
  %627 = load ptr, ptr %22, align 8
  %628 = getelementptr inbounds i8, ptr %627, i64 3
  %629 = load i8, ptr %628, align 1
  %630 = zext i8 %629 to i32
  %631 = shl i32 %630, 24
  %632 = add i32 %626, %631
  %633 = load i32, ptr %19, align 4
  %634 = add i32 %633, %632
  store i32 %634, ptr %19, align 4
  %635 = load ptr, ptr %22, align 8
  %636 = getelementptr inbounds i8, ptr %635, i64 4
  %637 = load i8, ptr %636, align 1
  %638 = zext i8 %637 to i32
  %639 = load ptr, ptr %22, align 8
  %640 = getelementptr inbounds i8, ptr %639, i64 5
  %641 = load i8, ptr %640, align 1
  %642 = zext i8 %641 to i32
  %643 = shl i32 %642, 8
  %644 = add i32 %638, %643
  %645 = load ptr, ptr %22, align 8
  %646 = getelementptr inbounds i8, ptr %645, i64 6
  %647 = load i8, ptr %646, align 1
  %648 = zext i8 %647 to i32
  %649 = shl i32 %648, 16
  %650 = add i32 %644, %649
  %651 = load ptr, ptr %22, align 8
  %652 = getelementptr inbounds i8, ptr %651, i64 7
  %653 = load i8, ptr %652, align 1
  %654 = zext i8 %653 to i32
  %655 = shl i32 %654, 24
  %656 = add i32 %650, %655
  %657 = load i32, ptr %20, align 4
  %658 = add i32 %657, %656
  store i32 %658, ptr %20, align 4
  %659 = load ptr, ptr %22, align 8
  %660 = getelementptr inbounds i8, ptr %659, i64 8
  %661 = load i8, ptr %660, align 1
  %662 = zext i8 %661 to i32
  %663 = load ptr, ptr %22, align 8
  %664 = getelementptr inbounds i8, ptr %663, i64 9
  %665 = load i8, ptr %664, align 1
  %666 = zext i8 %665 to i32
  %667 = shl i32 %666, 8
  %668 = add i32 %662, %667
  %669 = load ptr, ptr %22, align 8
  %670 = getelementptr inbounds i8, ptr %669, i64 10
  %671 = load i8, ptr %670, align 1
  %672 = zext i8 %671 to i32
  %673 = shl i32 %672, 16
  %674 = add i32 %668, %673
  %675 = load ptr, ptr %22, align 8
  %676 = getelementptr inbounds i8, ptr %675, i64 11
  %677 = load i8, ptr %676, align 1
  %678 = zext i8 %677 to i32
  %679 = shl i32 %678, 24
  %680 = add i32 %674, %679
  %681 = load i32, ptr %18, align 4
  %682 = add i32 %681, %680
  store i32 %682, ptr %18, align 4
  br label %683

683:                                              ; preds = %610
  %684 = load i32, ptr %20, align 4
  %685 = load i32, ptr %19, align 4
  %686 = sub i32 %685, %684
  store i32 %686, ptr %19, align 4
  %687 = load i32, ptr %18, align 4
  %688 = load i32, ptr %19, align 4
  %689 = sub i32 %688, %687
  store i32 %689, ptr %19, align 4
  %690 = load i32, ptr %18, align 4
  %691 = lshr i32 %690, 13
  %692 = load i32, ptr %19, align 4
  %693 = xor i32 %692, %691
  store i32 %693, ptr %19, align 4
  %694 = load i32, ptr %18, align 4
  %695 = load i32, ptr %20, align 4
  %696 = sub i32 %695, %694
  store i32 %696, ptr %20, align 4
  %697 = load i32, ptr %19, align 4
  %698 = load i32, ptr %20, align 4
  %699 = sub i32 %698, %697
  store i32 %699, ptr %20, align 4
  %700 = load i32, ptr %19, align 4
  %701 = shl i32 %700, 8
  %702 = load i32, ptr %20, align 4
  %703 = xor i32 %702, %701
  store i32 %703, ptr %20, align 4
  %704 = load i32, ptr %19, align 4
  %705 = load i32, ptr %18, align 4
  %706 = sub i32 %705, %704
  store i32 %706, ptr %18, align 4
  %707 = load i32, ptr %20, align 4
  %708 = load i32, ptr %18, align 4
  %709 = sub i32 %708, %707
  store i32 %709, ptr %18, align 4
  %710 = load i32, ptr %20, align 4
  %711 = lshr i32 %710, 13
  %712 = load i32, ptr %18, align 4
  %713 = xor i32 %712, %711
  store i32 %713, ptr %18, align 4
  %714 = load i32, ptr %20, align 4
  %715 = load i32, ptr %19, align 4
  %716 = sub i32 %715, %714
  store i32 %716, ptr %19, align 4
  %717 = load i32, ptr %18, align 4
  %718 = load i32, ptr %19, align 4
  %719 = sub i32 %718, %717
  store i32 %719, ptr %19, align 4
  %720 = load i32, ptr %18, align 4
  %721 = lshr i32 %720, 12
  %722 = load i32, ptr %19, align 4
  %723 = xor i32 %722, %721
  store i32 %723, ptr %19, align 4
  %724 = load i32, ptr %18, align 4
  %725 = load i32, ptr %20, align 4
  %726 = sub i32 %725, %724
  store i32 %726, ptr %20, align 4
  %727 = load i32, ptr %19, align 4
  %728 = load i32, ptr %20, align 4
  %729 = sub i32 %728, %727
  store i32 %729, ptr %20, align 4
  %730 = load i32, ptr %19, align 4
  %731 = shl i32 %730, 16
  %732 = load i32, ptr %20, align 4
  %733 = xor i32 %732, %731
  store i32 %733, ptr %20, align 4
  %734 = load i32, ptr %19, align 4
  %735 = load i32, ptr %18, align 4
  %736 = sub i32 %735, %734
  store i32 %736, ptr %18, align 4
  %737 = load i32, ptr %20, align 4
  %738 = load i32, ptr %18, align 4
  %739 = sub i32 %738, %737
  store i32 %739, ptr %18, align 4
  %740 = load i32, ptr %20, align 4
  %741 = lshr i32 %740, 5
  %742 = load i32, ptr %18, align 4
  %743 = xor i32 %742, %741
  store i32 %743, ptr %18, align 4
  %744 = load i32, ptr %20, align 4
  %745 = load i32, ptr %19, align 4
  %746 = sub i32 %745, %744
  store i32 %746, ptr %19, align 4
  %747 = load i32, ptr %18, align 4
  %748 = load i32, ptr %19, align 4
  %749 = sub i32 %748, %747
  store i32 %749, ptr %19, align 4
  %750 = load i32, ptr %18, align 4
  %751 = lshr i32 %750, 3
  %752 = load i32, ptr %19, align 4
  %753 = xor i32 %752, %751
  store i32 %753, ptr %19, align 4
  %754 = load i32, ptr %18, align 4
  %755 = load i32, ptr %20, align 4
  %756 = sub i32 %755, %754
  store i32 %756, ptr %20, align 4
  %757 = load i32, ptr %19, align 4
  %758 = load i32, ptr %20, align 4
  %759 = sub i32 %758, %757
  store i32 %759, ptr %20, align 4
  %760 = load i32, ptr %19, align 4
  %761 = shl i32 %760, 10
  %762 = load i32, ptr %20, align 4
  %763 = xor i32 %762, %761
  store i32 %763, ptr %20, align 4
  %764 = load i32, ptr %19, align 4
  %765 = load i32, ptr %18, align 4
  %766 = sub i32 %765, %764
  store i32 %766, ptr %18, align 4
  %767 = load i32, ptr %20, align 4
  %768 = load i32, ptr %18, align 4
  %769 = sub i32 %768, %767
  store i32 %769, ptr %18, align 4
  %770 = load i32, ptr %20, align 4
  %771 = lshr i32 %770, 15
  %772 = load i32, ptr %18, align 4
  %773 = xor i32 %772, %771
  store i32 %773, ptr %18, align 4
  br label %774

774:                                              ; preds = %683
  %775 = load ptr, ptr %22, align 8
  %776 = getelementptr inbounds i8, ptr %775, i64 12
  store ptr %776, ptr %22, align 8
  %777 = load i32, ptr %21, align 4
  %778 = sub i32 %777, 12
  store i32 %778, ptr %21, align 4
  br label %607, !llvm.loop !18

779:                                              ; preds = %607
  %780 = load i32, ptr %18, align 4
  %781 = add i32 %780, 4
  store i32 %781, ptr %18, align 4
  %782 = load i32, ptr %21, align 4
  switch i32 %782, label %869 [
    i32 11, label %783
    i32 10, label %791
    i32 9, label %799
    i32 8, label %807
    i32 7, label %815
    i32 6, label %823
    i32 5, label %831
    i32 4, label %838
    i32 3, label %846
    i32 2, label %854
    i32 1, label %862
  ]

783:                                              ; preds = %779
  %784 = load ptr, ptr %22, align 8
  %785 = getelementptr inbounds i8, ptr %784, i64 10
  %786 = load i8, ptr %785, align 1
  %787 = zext i8 %786 to i32
  %788 = shl i32 %787, 24
  %789 = load i32, ptr %18, align 4
  %790 = add i32 %789, %788
  store i32 %790, ptr %18, align 4
  br label %791

791:                                              ; preds = %779, %783
  %792 = load ptr, ptr %22, align 8
  %793 = getelementptr inbounds i8, ptr %792, i64 9
  %794 = load i8, ptr %793, align 1
  %795 = zext i8 %794 to i32
  %796 = shl i32 %795, 16
  %797 = load i32, ptr %18, align 4
  %798 = add i32 %797, %796
  store i32 %798, ptr %18, align 4
  br label %799

799:                                              ; preds = %779, %791
  %800 = load ptr, ptr %22, align 8
  %801 = getelementptr inbounds i8, ptr %800, i64 8
  %802 = load i8, ptr %801, align 1
  %803 = zext i8 %802 to i32
  %804 = shl i32 %803, 8
  %805 = load i32, ptr %18, align 4
  %806 = add i32 %805, %804
  store i32 %806, ptr %18, align 4
  br label %807

807:                                              ; preds = %779, %799
  %808 = load ptr, ptr %22, align 8
  %809 = getelementptr inbounds i8, ptr %808, i64 7
  %810 = load i8, ptr %809, align 1
  %811 = zext i8 %810 to i32
  %812 = shl i32 %811, 24
  %813 = load i32, ptr %20, align 4
  %814 = add i32 %813, %812
  store i32 %814, ptr %20, align 4
  br label %815

815:                                              ; preds = %779, %807
  %816 = load ptr, ptr %22, align 8
  %817 = getelementptr inbounds i8, ptr %816, i64 6
  %818 = load i8, ptr %817, align 1
  %819 = zext i8 %818 to i32
  %820 = shl i32 %819, 16
  %821 = load i32, ptr %20, align 4
  %822 = add i32 %821, %820
  store i32 %822, ptr %20, align 4
  br label %823

823:                                              ; preds = %779, %815
  %824 = load ptr, ptr %22, align 8
  %825 = getelementptr inbounds i8, ptr %824, i64 5
  %826 = load i8, ptr %825, align 1
  %827 = zext i8 %826 to i32
  %828 = shl i32 %827, 8
  %829 = load i32, ptr %20, align 4
  %830 = add i32 %829, %828
  store i32 %830, ptr %20, align 4
  br label %831

831:                                              ; preds = %779, %823
  %832 = load ptr, ptr %22, align 8
  %833 = getelementptr inbounds i8, ptr %832, i64 4
  %834 = load i8, ptr %833, align 1
  %835 = zext i8 %834 to i32
  %836 = load i32, ptr %20, align 4
  %837 = add i32 %836, %835
  store i32 %837, ptr %20, align 4
  br label %838

838:                                              ; preds = %779, %831
  %839 = load ptr, ptr %22, align 8
  %840 = getelementptr inbounds i8, ptr %839, i64 3
  %841 = load i8, ptr %840, align 1
  %842 = zext i8 %841 to i32
  %843 = shl i32 %842, 24
  %844 = load i32, ptr %19, align 4
  %845 = add i32 %844, %843
  store i32 %845, ptr %19, align 4
  br label %846

846:                                              ; preds = %779, %838
  %847 = load ptr, ptr %22, align 8
  %848 = getelementptr inbounds i8, ptr %847, i64 2
  %849 = load i8, ptr %848, align 1
  %850 = zext i8 %849 to i32
  %851 = shl i32 %850, 16
  %852 = load i32, ptr %19, align 4
  %853 = add i32 %852, %851
  store i32 %853, ptr %19, align 4
  br label %854

854:                                              ; preds = %779, %846
  %855 = load ptr, ptr %22, align 8
  %856 = getelementptr inbounds i8, ptr %855, i64 1
  %857 = load i8, ptr %856, align 1
  %858 = zext i8 %857 to i32
  %859 = shl i32 %858, 8
  %860 = load i32, ptr %19, align 4
  %861 = add i32 %860, %859
  store i32 %861, ptr %19, align 4
  br label %862

862:                                              ; preds = %779, %854
  %863 = load ptr, ptr %22, align 8
  %864 = getelementptr inbounds i8, ptr %863, i64 0
  %865 = load i8, ptr %864, align 1
  %866 = zext i8 %865 to i32
  %867 = load i32, ptr %19, align 4
  %868 = add i32 %867, %866
  store i32 %868, ptr %19, align 4
  br label %869

869:                                              ; preds = %779, %862
  br label %870

870:                                              ; preds = %869
  br label %871

871:                                              ; preds = %870
  %872 = load i32, ptr %20, align 4
  %873 = load i32, ptr %19, align 4
  %874 = sub i32 %873, %872
  store i32 %874, ptr %19, align 4
  %875 = load i32, ptr %18, align 4
  %876 = load i32, ptr %19, align 4
  %877 = sub i32 %876, %875
  store i32 %877, ptr %19, align 4
  %878 = load i32, ptr %18, align 4
  %879 = lshr i32 %878, 13
  %880 = load i32, ptr %19, align 4
  %881 = xor i32 %880, %879
  store i32 %881, ptr %19, align 4
  %882 = load i32, ptr %18, align 4
  %883 = load i32, ptr %20, align 4
  %884 = sub i32 %883, %882
  store i32 %884, ptr %20, align 4
  %885 = load i32, ptr %19, align 4
  %886 = load i32, ptr %20, align 4
  %887 = sub i32 %886, %885
  store i32 %887, ptr %20, align 4
  %888 = load i32, ptr %19, align 4
  %889 = shl i32 %888, 8
  %890 = load i32, ptr %20, align 4
  %891 = xor i32 %890, %889
  store i32 %891, ptr %20, align 4
  %892 = load i32, ptr %19, align 4
  %893 = load i32, ptr %18, align 4
  %894 = sub i32 %893, %892
  store i32 %894, ptr %18, align 4
  %895 = load i32, ptr %20, align 4
  %896 = load i32, ptr %18, align 4
  %897 = sub i32 %896, %895
  store i32 %897, ptr %18, align 4
  %898 = load i32, ptr %20, align 4
  %899 = lshr i32 %898, 13
  %900 = load i32, ptr %18, align 4
  %901 = xor i32 %900, %899
  store i32 %901, ptr %18, align 4
  %902 = load i32, ptr %20, align 4
  %903 = load i32, ptr %19, align 4
  %904 = sub i32 %903, %902
  store i32 %904, ptr %19, align 4
  %905 = load i32, ptr %18, align 4
  %906 = load i32, ptr %19, align 4
  %907 = sub i32 %906, %905
  store i32 %907, ptr %19, align 4
  %908 = load i32, ptr %18, align 4
  %909 = lshr i32 %908, 12
  %910 = load i32, ptr %19, align 4
  %911 = xor i32 %910, %909
  store i32 %911, ptr %19, align 4
  %912 = load i32, ptr %18, align 4
  %913 = load i32, ptr %20, align 4
  %914 = sub i32 %913, %912
  store i32 %914, ptr %20, align 4
  %915 = load i32, ptr %19, align 4
  %916 = load i32, ptr %20, align 4
  %917 = sub i32 %916, %915
  store i32 %917, ptr %20, align 4
  %918 = load i32, ptr %19, align 4
  %919 = shl i32 %918, 16
  %920 = load i32, ptr %20, align 4
  %921 = xor i32 %920, %919
  store i32 %921, ptr %20, align 4
  %922 = load i32, ptr %19, align 4
  %923 = load i32, ptr %18, align 4
  %924 = sub i32 %923, %922
  store i32 %924, ptr %18, align 4
  %925 = load i32, ptr %20, align 4
  %926 = load i32, ptr %18, align 4
  %927 = sub i32 %926, %925
  store i32 %927, ptr %18, align 4
  %928 = load i32, ptr %20, align 4
  %929 = lshr i32 %928, 5
  %930 = load i32, ptr %18, align 4
  %931 = xor i32 %930, %929
  store i32 %931, ptr %18, align 4
  %932 = load i32, ptr %20, align 4
  %933 = load i32, ptr %19, align 4
  %934 = sub i32 %933, %932
  store i32 %934, ptr %19, align 4
  %935 = load i32, ptr %18, align 4
  %936 = load i32, ptr %19, align 4
  %937 = sub i32 %936, %935
  store i32 %937, ptr %19, align 4
  %938 = load i32, ptr %18, align 4
  %939 = lshr i32 %938, 3
  %940 = load i32, ptr %19, align 4
  %941 = xor i32 %940, %939
  store i32 %941, ptr %19, align 4
  %942 = load i32, ptr %18, align 4
  %943 = load i32, ptr %20, align 4
  %944 = sub i32 %943, %942
  store i32 %944, ptr %20, align 4
  %945 = load i32, ptr %19, align 4
  %946 = load i32, ptr %20, align 4
  %947 = sub i32 %946, %945
  store i32 %947, ptr %20, align 4
  %948 = load i32, ptr %19, align 4
  %949 = shl i32 %948, 10
  %950 = load i32, ptr %20, align 4
  %951 = xor i32 %950, %949
  store i32 %951, ptr %20, align 4
  %952 = load i32, ptr %19, align 4
  %953 = load i32, ptr %18, align 4
  %954 = sub i32 %953, %952
  store i32 %954, ptr %18, align 4
  %955 = load i32, ptr %20, align 4
  %956 = load i32, ptr %18, align 4
  %957 = sub i32 %956, %955
  store i32 %957, ptr %18, align 4
  %958 = load i32, ptr %20, align 4
  %959 = lshr i32 %958, 15
  %960 = load i32, ptr %18, align 4
  %961 = xor i32 %960, %959
  store i32 %961, ptr %18, align 4
  br label %962

962:                                              ; preds = %871
  br label %963

963:                                              ; preds = %962
  br label %964

964:                                              ; preds = %963
  br label %965

965:                                              ; preds = %964
  %966 = load i32, ptr %18, align 4
  %967 = load ptr, ptr %11, align 8
  %968 = getelementptr inbounds nuw %struct.GramHash, ptr %967, i32 0, i32 2
  %969 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %968, i32 0, i32 7
  store i32 %966, ptr %969, align 4
  %970 = load ptr, ptr %11, align 8
  %971 = getelementptr inbounds nuw %struct.GramHash, ptr %970, i32 0, i32 0
  %972 = load ptr, ptr %11, align 8
  %973 = getelementptr inbounds nuw %struct.GramHash, ptr %972, i32 0, i32 2
  %974 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %973, i32 0, i32 5
  store ptr %971, ptr %974, align 8
  %975 = load ptr, ptr %11, align 8
  %976 = getelementptr inbounds nuw %struct.GramHash, ptr %975, i32 0, i32 2
  %977 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %976, i32 0, i32 6
  store i32 4, ptr %977, align 8
  %978 = load ptr, ptr %8, align 8
  %979 = icmp ne ptr %978, null
  br i1 %979, label %1061, label %980

980:                                              ; preds = %965
  %981 = load ptr, ptr %11, align 8
  %982 = getelementptr inbounds nuw %struct.GramHash, ptr %981, i32 0, i32 2
  %983 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %982, i32 0, i32 2
  store ptr null, ptr %983, align 8
  %984 = load ptr, ptr %11, align 8
  %985 = getelementptr inbounds nuw %struct.GramHash, ptr %984, i32 0, i32 2
  %986 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %985, i32 0, i32 1
  store ptr null, ptr %986, align 8
  br label %987

987:                                              ; preds = %980
  %988 = call noalias ptr @malloc(i64 noundef 64)
  %989 = load ptr, ptr %11, align 8
  %990 = getelementptr inbounds nuw %struct.GramHash, ptr %989, i32 0, i32 2
  %991 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %990, i32 0, i32 0
  store ptr %988, ptr %991, align 8
  %992 = load ptr, ptr %11, align 8
  %993 = getelementptr inbounds nuw %struct.GramHash, ptr %992, i32 0, i32 2
  %994 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %993, i32 0, i32 0
  %995 = load ptr, ptr %994, align 8
  %996 = icmp ne ptr %995, null
  br i1 %996, label %998, label %997

997:                                              ; preds = %987
  call void @exit(i32 noundef -1)
  unreachable

998:                                              ; preds = %987
  %999 = load ptr, ptr %11, align 8
  %1000 = getelementptr inbounds nuw %struct.GramHash, ptr %999, i32 0, i32 2
  %1001 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1000, i32 0, i32 0
  %1002 = load ptr, ptr %1001, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %1002, i8 0, i64 64, i1 false)
  %1003 = load ptr, ptr %11, align 8
  %1004 = getelementptr inbounds nuw %struct.GramHash, ptr %1003, i32 0, i32 2
  %1005 = load ptr, ptr %11, align 8
  %1006 = getelementptr inbounds nuw %struct.GramHash, ptr %1005, i32 0, i32 2
  %1007 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1006, i32 0, i32 0
  %1008 = load ptr, ptr %1007, align 8
  %1009 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1008, i32 0, i32 4
  store ptr %1004, ptr %1009, align 8
  %1010 = load ptr, ptr %11, align 8
  %1011 = getelementptr inbounds nuw %struct.GramHash, ptr %1010, i32 0, i32 2
  %1012 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1011, i32 0, i32 0
  %1013 = load ptr, ptr %1012, align 8
  %1014 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1013, i32 0, i32 1
  store i32 32, ptr %1014, align 8
  %1015 = load ptr, ptr %11, align 8
  %1016 = getelementptr inbounds nuw %struct.GramHash, ptr %1015, i32 0, i32 2
  %1017 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1016, i32 0, i32 0
  %1018 = load ptr, ptr %1017, align 8
  %1019 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1018, i32 0, i32 2
  store i32 5, ptr %1019, align 4
  %1020 = load ptr, ptr %11, align 8
  %1021 = getelementptr inbounds nuw %struct.GramHash, ptr %1020, i32 0, i32 2
  %1022 = load ptr, ptr %11, align 8
  %1023 = ptrtoint ptr %1021 to i64
  %1024 = ptrtoint ptr %1022 to i64
  %1025 = sub i64 %1023, %1024
  %1026 = load ptr, ptr %11, align 8
  %1027 = getelementptr inbounds nuw %struct.GramHash, ptr %1026, i32 0, i32 2
  %1028 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1027, i32 0, i32 0
  %1029 = load ptr, ptr %1028, align 8
  %1030 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1029, i32 0, i32 5
  store i64 %1025, ptr %1030, align 8
  %1031 = call noalias ptr @malloc(i64 noundef 512)
  %1032 = load ptr, ptr %11, align 8
  %1033 = getelementptr inbounds nuw %struct.GramHash, ptr %1032, i32 0, i32 2
  %1034 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1033, i32 0, i32 0
  %1035 = load ptr, ptr %1034, align 8
  %1036 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1035, i32 0, i32 0
  store ptr %1031, ptr %1036, align 8
  %1037 = load ptr, ptr %11, align 8
  %1038 = getelementptr inbounds nuw %struct.GramHash, ptr %1037, i32 0, i32 2
  %1039 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1038, i32 0, i32 0
  %1040 = load ptr, ptr %1039, align 8
  %1041 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1040, i32 0, i32 10
  store i32 -1609490463, ptr %1041, align 8
  %1042 = load ptr, ptr %11, align 8
  %1043 = getelementptr inbounds nuw %struct.GramHash, ptr %1042, i32 0, i32 2
  %1044 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1043, i32 0, i32 0
  %1045 = load ptr, ptr %1044, align 8
  %1046 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1045, i32 0, i32 0
  %1047 = load ptr, ptr %1046, align 8
  %1048 = icmp ne ptr %1047, null
  br i1 %1048, label %1050, label %1049

1049:                                             ; preds = %998
  call void @exit(i32 noundef -1)
  unreachable

1050:                                             ; preds = %998
  %1051 = load ptr, ptr %11, align 8
  %1052 = getelementptr inbounds nuw %struct.GramHash, ptr %1051, i32 0, i32 2
  %1053 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1052, i32 0, i32 0
  %1054 = load ptr, ptr %1053, align 8
  %1055 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1054, i32 0, i32 0
  %1056 = load ptr, ptr %1055, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %1056, i8 0, i64 512, i1 false)
  br label %1057

1057:                                             ; preds = %1050
  br label %1058

1058:                                             ; preds = %1057
  br label %1059

1059:                                             ; preds = %1058
  %1060 = load ptr, ptr %11, align 8
  store ptr %1060, ptr %8, align 8
  br label %1106

1061:                                             ; preds = %965
  %1062 = load ptr, ptr %8, align 8
  %1063 = getelementptr inbounds nuw %struct.GramHash, ptr %1062, i32 0, i32 2
  %1064 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1063, i32 0, i32 0
  %1065 = load ptr, ptr %1064, align 8
  %1066 = load ptr, ptr %11, align 8
  %1067 = getelementptr inbounds nuw %struct.GramHash, ptr %1066, i32 0, i32 2
  %1068 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1067, i32 0, i32 0
  store ptr %1065, ptr %1068, align 8
  br label %1069

1069:                                             ; preds = %1061
  %1070 = load ptr, ptr %11, align 8
  %1071 = getelementptr inbounds nuw %struct.GramHash, ptr %1070, i32 0, i32 2
  %1072 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1071, i32 0, i32 2
  store ptr null, ptr %1072, align 8
  %1073 = load ptr, ptr %8, align 8
  %1074 = getelementptr inbounds nuw %struct.GramHash, ptr %1073, i32 0, i32 2
  %1075 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1074, i32 0, i32 0
  %1076 = load ptr, ptr %1075, align 8
  %1077 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1076, i32 0, i32 4
  %1078 = load ptr, ptr %1077, align 8
  %1079 = load ptr, ptr %8, align 8
  %1080 = getelementptr inbounds nuw %struct.GramHash, ptr %1079, i32 0, i32 2
  %1081 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1080, i32 0, i32 0
  %1082 = load ptr, ptr %1081, align 8
  %1083 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1082, i32 0, i32 5
  %1084 = load i64, ptr %1083, align 8
  %1085 = sub i64 0, %1084
  %1086 = getelementptr inbounds i8, ptr %1078, i64 %1085
  %1087 = load ptr, ptr %11, align 8
  %1088 = getelementptr inbounds nuw %struct.GramHash, ptr %1087, i32 0, i32 2
  %1089 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1088, i32 0, i32 1
  store ptr %1086, ptr %1089, align 8
  %1090 = load ptr, ptr %11, align 8
  %1091 = load ptr, ptr %8, align 8
  %1092 = getelementptr inbounds nuw %struct.GramHash, ptr %1091, i32 0, i32 2
  %1093 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1092, i32 0, i32 0
  %1094 = load ptr, ptr %1093, align 8
  %1095 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1094, i32 0, i32 4
  %1096 = load ptr, ptr %1095, align 8
  %1097 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1096, i32 0, i32 2
  store ptr %1090, ptr %1097, align 8
  %1098 = load ptr, ptr %11, align 8
  %1099 = getelementptr inbounds nuw %struct.GramHash, ptr %1098, i32 0, i32 2
  %1100 = load ptr, ptr %8, align 8
  %1101 = getelementptr inbounds nuw %struct.GramHash, ptr %1100, i32 0, i32 2
  %1102 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1101, i32 0, i32 0
  %1103 = load ptr, ptr %1102, align 8
  %1104 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1103, i32 0, i32 4
  store ptr %1099, ptr %1104, align 8
  br label %1105

1105:                                             ; preds = %1069
  br label %1106

1106:                                             ; preds = %1105, %1059
  br label %1107

1107:                                             ; preds = %1106
  %1108 = load ptr, ptr %8, align 8
  %1109 = getelementptr inbounds nuw %struct.GramHash, ptr %1108, i32 0, i32 2
  %1110 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1109, i32 0, i32 0
  %1111 = load ptr, ptr %1110, align 8
  %1112 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1111, i32 0, i32 3
  %1113 = load i32, ptr %1112, align 8
  %1114 = add i32 %1113, 1
  store i32 %1114, ptr %1112, align 8
  br label %1115

1115:                                             ; preds = %1107
  %1116 = load i32, ptr %18, align 4
  %1117 = load ptr, ptr %8, align 8
  %1118 = getelementptr inbounds nuw %struct.GramHash, ptr %1117, i32 0, i32 2
  %1119 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1118, i32 0, i32 0
  %1120 = load ptr, ptr %1119, align 8
  %1121 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1120, i32 0, i32 1
  %1122 = load i32, ptr %1121, align 8
  %1123 = sub i32 %1122, 1
  %1124 = and i32 %1116, %1123
  store i32 %1124, ptr %23, align 4
  br label %1125

1125:                                             ; preds = %1115
  br label %1126

1126:                                             ; preds = %1125
  %1127 = load ptr, ptr %8, align 8
  %1128 = getelementptr inbounds nuw %struct.GramHash, ptr %1127, i32 0, i32 2
  %1129 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1128, i32 0, i32 0
  %1130 = load ptr, ptr %1129, align 8
  %1131 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1130, i32 0, i32 0
  %1132 = load ptr, ptr %1131, align 8
  %1133 = load i32, ptr %23, align 4
  %1134 = zext i32 %1133 to i64
  %1135 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1132, i64 %1134
  store ptr %1135, ptr %24, align 8
  %1136 = load ptr, ptr %24, align 8
  %1137 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1136, i32 0, i32 1
  %1138 = load i32, ptr %1137, align 8
  %1139 = add i32 %1138, 1
  store i32 %1139, ptr %1137, align 8
  %1140 = load ptr, ptr %24, align 8
  %1141 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1140, i32 0, i32 0
  %1142 = load ptr, ptr %1141, align 8
  %1143 = load ptr, ptr %11, align 8
  %1144 = getelementptr inbounds nuw %struct.GramHash, ptr %1143, i32 0, i32 2
  %1145 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1144, i32 0, i32 4
  store ptr %1142, ptr %1145, align 8
  %1146 = load ptr, ptr %11, align 8
  %1147 = getelementptr inbounds nuw %struct.GramHash, ptr %1146, i32 0, i32 2
  %1148 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1147, i32 0, i32 3
  store ptr null, ptr %1148, align 8
  %1149 = load ptr, ptr %24, align 8
  %1150 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1149, i32 0, i32 0
  %1151 = load ptr, ptr %1150, align 8
  %1152 = icmp ne ptr %1151, null
  br i1 %1152, label %1153, label %1160

1153:                                             ; preds = %1126
  %1154 = load ptr, ptr %11, align 8
  %1155 = getelementptr inbounds nuw %struct.GramHash, ptr %1154, i32 0, i32 2
  %1156 = load ptr, ptr %24, align 8
  %1157 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1156, i32 0, i32 0
  %1158 = load ptr, ptr %1157, align 8
  %1159 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1158, i32 0, i32 3
  store ptr %1155, ptr %1159, align 8
  br label %1160

1160:                                             ; preds = %1153, %1126
  %1161 = load ptr, ptr %11, align 8
  %1162 = getelementptr inbounds nuw %struct.GramHash, ptr %1161, i32 0, i32 2
  %1163 = load ptr, ptr %24, align 8
  %1164 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1163, i32 0, i32 0
  store ptr %1162, ptr %1164, align 8
  %1165 = load ptr, ptr %24, align 8
  %1166 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1165, i32 0, i32 1
  %1167 = load i32, ptr %1166, align 8
  %1168 = load ptr, ptr %24, align 8
  %1169 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1168, i32 0, i32 2
  %1170 = load i32, ptr %1169, align 4
  %1171 = add i32 %1170, 1
  %1172 = mul i32 %1171, 10
  %1173 = icmp uge i32 %1167, %1172
  br i1 %1173, label %1174, label %1436

1174:                                             ; preds = %1160
  %1175 = load ptr, ptr %11, align 8
  %1176 = getelementptr inbounds nuw %struct.GramHash, ptr %1175, i32 0, i32 2
  %1177 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1176, i32 0, i32 0
  %1178 = load ptr, ptr %1177, align 8
  %1179 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1178, i32 0, i32 9
  %1180 = load i32, ptr %1179, align 4
  %1181 = icmp ne i32 %1180, 0
  br i1 %1181, label %1436, label %1182

1182:                                             ; preds = %1174
  br label %1183

1183:                                             ; preds = %1182
  %1184 = load ptr, ptr %11, align 8
  %1185 = getelementptr inbounds nuw %struct.GramHash, ptr %1184, i32 0, i32 2
  %1186 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1185, i32 0, i32 0
  %1187 = load ptr, ptr %1186, align 8
  %1188 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1187, i32 0, i32 1
  %1189 = load i32, ptr %1188, align 8
  %1190 = zext i32 %1189 to i64
  %1191 = mul i64 16, %1190
  %1192 = mul i64 %1191, 2
  %1193 = call noalias ptr @malloc(i64 noundef %1192)
  store ptr %1193, ptr %29, align 8
  %1194 = load ptr, ptr %29, align 8
  %1195 = icmp ne ptr %1194, null
  br i1 %1195, label %1197, label %1196

1196:                                             ; preds = %1183
  call void @exit(i32 noundef -1)
  unreachable

1197:                                             ; preds = %1183
  %1198 = load ptr, ptr %29, align 8
  %1199 = load ptr, ptr %11, align 8
  %1200 = getelementptr inbounds nuw %struct.GramHash, ptr %1199, i32 0, i32 2
  %1201 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1200, i32 0, i32 0
  %1202 = load ptr, ptr %1201, align 8
  %1203 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1202, i32 0, i32 1
  %1204 = load i32, ptr %1203, align 8
  %1205 = zext i32 %1204 to i64
  %1206 = mul i64 16, %1205
  %1207 = mul i64 %1206, 2
  call void @llvm.memset.p0.i64(ptr align 8 %1198, i8 0, i64 %1207, i1 false)
  %1208 = load ptr, ptr %11, align 8
  %1209 = getelementptr inbounds nuw %struct.GramHash, ptr %1208, i32 0, i32 2
  %1210 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1209, i32 0, i32 0
  %1211 = load ptr, ptr %1210, align 8
  %1212 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1211, i32 0, i32 3
  %1213 = load i32, ptr %1212, align 8
  %1214 = load ptr, ptr %11, align 8
  %1215 = getelementptr inbounds nuw %struct.GramHash, ptr %1214, i32 0, i32 2
  %1216 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1215, i32 0, i32 0
  %1217 = load ptr, ptr %1216, align 8
  %1218 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1217, i32 0, i32 2
  %1219 = load i32, ptr %1218, align 4
  %1220 = add i32 %1219, 1
  %1221 = lshr i32 %1213, %1220
  %1222 = load ptr, ptr %11, align 8
  %1223 = getelementptr inbounds nuw %struct.GramHash, ptr %1222, i32 0, i32 2
  %1224 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1223, i32 0, i32 0
  %1225 = load ptr, ptr %1224, align 8
  %1226 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1225, i32 0, i32 3
  %1227 = load i32, ptr %1226, align 8
  %1228 = load ptr, ptr %11, align 8
  %1229 = getelementptr inbounds nuw %struct.GramHash, ptr %1228, i32 0, i32 2
  %1230 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1229, i32 0, i32 0
  %1231 = load ptr, ptr %1230, align 8
  %1232 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1231, i32 0, i32 1
  %1233 = load i32, ptr %1232, align 8
  %1234 = mul i32 %1233, 2
  %1235 = sub i32 %1234, 1
  %1236 = and i32 %1227, %1235
  %1237 = icmp ne i32 %1236, 0
  %1238 = zext i1 %1237 to i64
  %1239 = select i1 %1237, i32 1, i32 0
  %1240 = add i32 %1221, %1239
  %1241 = load ptr, ptr %11, align 8
  %1242 = getelementptr inbounds nuw %struct.GramHash, ptr %1241, i32 0, i32 2
  %1243 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1242, i32 0, i32 0
  %1244 = load ptr, ptr %1243, align 8
  %1245 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1244, i32 0, i32 6
  store i32 %1240, ptr %1245, align 8
  %1246 = load ptr, ptr %11, align 8
  %1247 = getelementptr inbounds nuw %struct.GramHash, ptr %1246, i32 0, i32 2
  %1248 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1247, i32 0, i32 0
  %1249 = load ptr, ptr %1248, align 8
  %1250 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1249, i32 0, i32 7
  store i32 0, ptr %1250, align 4
  store i32 0, ptr %26, align 4
  br label %1251

1251:                                             ; preds = %1360, %1197
  %1252 = load i32, ptr %26, align 4
  %1253 = load ptr, ptr %11, align 8
  %1254 = getelementptr inbounds nuw %struct.GramHash, ptr %1253, i32 0, i32 2
  %1255 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1254, i32 0, i32 0
  %1256 = load ptr, ptr %1255, align 8
  %1257 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1256, i32 0, i32 1
  %1258 = load i32, ptr %1257, align 8
  %1259 = icmp ult i32 %1252, %1258
  br i1 %1259, label %1260, label %1363

1260:                                             ; preds = %1251
  %1261 = load ptr, ptr %11, align 8
  %1262 = getelementptr inbounds nuw %struct.GramHash, ptr %1261, i32 0, i32 2
  %1263 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1262, i32 0, i32 0
  %1264 = load ptr, ptr %1263, align 8
  %1265 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1264, i32 0, i32 0
  %1266 = load ptr, ptr %1265, align 8
  %1267 = load i32, ptr %26, align 4
  %1268 = zext i32 %1267 to i64
  %1269 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1266, i64 %1268
  %1270 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1269, i32 0, i32 0
  %1271 = load ptr, ptr %1270, align 8
  store ptr %1271, ptr %27, align 8
  br label %1272

1272:                                             ; preds = %1354, %1260
  %1273 = load ptr, ptr %27, align 8
  %1274 = icmp ne ptr %1273, null
  br i1 %1274, label %1275, label %1359

1275:                                             ; preds = %1272
  %1276 = load ptr, ptr %27, align 8
  %1277 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1276, i32 0, i32 4
  %1278 = load ptr, ptr %1277, align 8
  store ptr %1278, ptr %28, align 8
  br label %1279

1279:                                             ; preds = %1275
  %1280 = load ptr, ptr %27, align 8
  %1281 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1280, i32 0, i32 7
  %1282 = load i32, ptr %1281, align 4
  %1283 = load ptr, ptr %11, align 8
  %1284 = getelementptr inbounds nuw %struct.GramHash, ptr %1283, i32 0, i32 2
  %1285 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1284, i32 0, i32 0
  %1286 = load ptr, ptr %1285, align 8
  %1287 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1286, i32 0, i32 1
  %1288 = load i32, ptr %1287, align 8
  %1289 = mul i32 %1288, 2
  %1290 = sub i32 %1289, 1
  %1291 = and i32 %1282, %1290
  store i32 %1291, ptr %25, align 4
  br label %1292

1292:                                             ; preds = %1279
  %1293 = load ptr, ptr %29, align 8
  %1294 = load i32, ptr %25, align 4
  %1295 = zext i32 %1294 to i64
  %1296 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1293, i64 %1295
  store ptr %1296, ptr %30, align 8
  %1297 = load ptr, ptr %30, align 8
  %1298 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1297, i32 0, i32 1
  %1299 = load i32, ptr %1298, align 8
  %1300 = add i32 %1299, 1
  store i32 %1300, ptr %1298, align 8
  %1301 = load ptr, ptr %11, align 8
  %1302 = getelementptr inbounds nuw %struct.GramHash, ptr %1301, i32 0, i32 2
  %1303 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1302, i32 0, i32 0
  %1304 = load ptr, ptr %1303, align 8
  %1305 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1304, i32 0, i32 6
  %1306 = load i32, ptr %1305, align 8
  %1307 = icmp ugt i32 %1300, %1306
  br i1 %1307, label %1308, label %1336

1308:                                             ; preds = %1292
  %1309 = load ptr, ptr %11, align 8
  %1310 = getelementptr inbounds nuw %struct.GramHash, ptr %1309, i32 0, i32 2
  %1311 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1310, i32 0, i32 0
  %1312 = load ptr, ptr %1311, align 8
  %1313 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1312, i32 0, i32 7
  %1314 = load i32, ptr %1313, align 4
  %1315 = add i32 %1314, 1
  store i32 %1315, ptr %1313, align 4
  %1316 = load ptr, ptr %30, align 8
  %1317 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1316, i32 0, i32 1
  %1318 = load i32, ptr %1317, align 8
  %1319 = load ptr, ptr %30, align 8
  %1320 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1319, i32 0, i32 2
  %1321 = load i32, ptr %1320, align 4
  %1322 = load ptr, ptr %11, align 8
  %1323 = getelementptr inbounds nuw %struct.GramHash, ptr %1322, i32 0, i32 2
  %1324 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1323, i32 0, i32 0
  %1325 = load ptr, ptr %1324, align 8
  %1326 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1325, i32 0, i32 6
  %1327 = load i32, ptr %1326, align 8
  %1328 = mul i32 %1321, %1327
  %1329 = icmp ugt i32 %1318, %1328
  br i1 %1329, label %1330, label %1335

1330:                                             ; preds = %1308
  %1331 = load ptr, ptr %30, align 8
  %1332 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1331, i32 0, i32 2
  %1333 = load i32, ptr %1332, align 4
  %1334 = add i32 %1333, 1
  store i32 %1334, ptr %1332, align 4
  br label %1335

1335:                                             ; preds = %1330, %1308
  br label %1336

1336:                                             ; preds = %1335, %1292
  %1337 = load ptr, ptr %27, align 8
  %1338 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1337, i32 0, i32 3
  store ptr null, ptr %1338, align 8
  %1339 = load ptr, ptr %30, align 8
  %1340 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1339, i32 0, i32 0
  %1341 = load ptr, ptr %1340, align 8
  %1342 = load ptr, ptr %27, align 8
  %1343 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1342, i32 0, i32 4
  store ptr %1341, ptr %1343, align 8
  %1344 = load ptr, ptr %30, align 8
  %1345 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1344, i32 0, i32 0
  %1346 = load ptr, ptr %1345, align 8
  %1347 = icmp ne ptr %1346, null
  br i1 %1347, label %1348, label %1354

1348:                                             ; preds = %1336
  %1349 = load ptr, ptr %27, align 8
  %1350 = load ptr, ptr %30, align 8
  %1351 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1350, i32 0, i32 0
  %1352 = load ptr, ptr %1351, align 8
  %1353 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1352, i32 0, i32 3
  store ptr %1349, ptr %1353, align 8
  br label %1354

1354:                                             ; preds = %1348, %1336
  %1355 = load ptr, ptr %27, align 8
  %1356 = load ptr, ptr %30, align 8
  %1357 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1356, i32 0, i32 0
  store ptr %1355, ptr %1357, align 8
  %1358 = load ptr, ptr %28, align 8
  store ptr %1358, ptr %27, align 8
  br label %1272, !llvm.loop !19

1359:                                             ; preds = %1272
  br label %1360

1360:                                             ; preds = %1359
  %1361 = load i32, ptr %26, align 4
  %1362 = add i32 %1361, 1
  store i32 %1362, ptr %26, align 4
  br label %1251, !llvm.loop !20

1363:                                             ; preds = %1251
  %1364 = load ptr, ptr %11, align 8
  %1365 = getelementptr inbounds nuw %struct.GramHash, ptr %1364, i32 0, i32 2
  %1366 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1365, i32 0, i32 0
  %1367 = load ptr, ptr %1366, align 8
  %1368 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1367, i32 0, i32 0
  %1369 = load ptr, ptr %1368, align 8
  call void @free(ptr noundef %1369)
  %1370 = load ptr, ptr %11, align 8
  %1371 = getelementptr inbounds nuw %struct.GramHash, ptr %1370, i32 0, i32 2
  %1372 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1371, i32 0, i32 0
  %1373 = load ptr, ptr %1372, align 8
  %1374 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1373, i32 0, i32 1
  %1375 = load i32, ptr %1374, align 8
  %1376 = mul i32 %1375, 2
  store i32 %1376, ptr %1374, align 8
  %1377 = load ptr, ptr %11, align 8
  %1378 = getelementptr inbounds nuw %struct.GramHash, ptr %1377, i32 0, i32 2
  %1379 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1378, i32 0, i32 0
  %1380 = load ptr, ptr %1379, align 8
  %1381 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1380, i32 0, i32 2
  %1382 = load i32, ptr %1381, align 4
  %1383 = add i32 %1382, 1
  store i32 %1383, ptr %1381, align 4
  %1384 = load ptr, ptr %29, align 8
  %1385 = load ptr, ptr %11, align 8
  %1386 = getelementptr inbounds nuw %struct.GramHash, ptr %1385, i32 0, i32 2
  %1387 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1386, i32 0, i32 0
  %1388 = load ptr, ptr %1387, align 8
  %1389 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1388, i32 0, i32 0
  store ptr %1384, ptr %1389, align 8
  %1390 = load ptr, ptr %11, align 8
  %1391 = getelementptr inbounds nuw %struct.GramHash, ptr %1390, i32 0, i32 2
  %1392 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1391, i32 0, i32 0
  %1393 = load ptr, ptr %1392, align 8
  %1394 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1393, i32 0, i32 7
  %1395 = load i32, ptr %1394, align 4
  %1396 = load ptr, ptr %11, align 8
  %1397 = getelementptr inbounds nuw %struct.GramHash, ptr %1396, i32 0, i32 2
  %1398 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1397, i32 0, i32 0
  %1399 = load ptr, ptr %1398, align 8
  %1400 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1399, i32 0, i32 3
  %1401 = load i32, ptr %1400, align 8
  %1402 = lshr i32 %1401, 1
  %1403 = icmp ugt i32 %1395, %1402
  br i1 %1403, label %1404, label %1412

1404:                                             ; preds = %1363
  %1405 = load ptr, ptr %11, align 8
  %1406 = getelementptr inbounds nuw %struct.GramHash, ptr %1405, i32 0, i32 2
  %1407 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1406, i32 0, i32 0
  %1408 = load ptr, ptr %1407, align 8
  %1409 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1408, i32 0, i32 8
  %1410 = load i32, ptr %1409, align 8
  %1411 = add i32 %1410, 1
  br label %1413

1412:                                             ; preds = %1363
  br label %1413

1413:                                             ; preds = %1412, %1404
  %1414 = phi i32 [ %1411, %1404 ], [ 0, %1412 ]
  %1415 = load ptr, ptr %11, align 8
  %1416 = getelementptr inbounds nuw %struct.GramHash, ptr %1415, i32 0, i32 2
  %1417 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1416, i32 0, i32 0
  %1418 = load ptr, ptr %1417, align 8
  %1419 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1418, i32 0, i32 8
  store i32 %1414, ptr %1419, align 8
  %1420 = load ptr, ptr %11, align 8
  %1421 = getelementptr inbounds nuw %struct.GramHash, ptr %1420, i32 0, i32 2
  %1422 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1421, i32 0, i32 0
  %1423 = load ptr, ptr %1422, align 8
  %1424 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1423, i32 0, i32 8
  %1425 = load i32, ptr %1424, align 8
  %1426 = icmp ugt i32 %1425, 1
  br i1 %1426, label %1427, label %1433

1427:                                             ; preds = %1413
  %1428 = load ptr, ptr %11, align 8
  %1429 = getelementptr inbounds nuw %struct.GramHash, ptr %1428, i32 0, i32 2
  %1430 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1429, i32 0, i32 0
  %1431 = load ptr, ptr %1430, align 8
  %1432 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1431, i32 0, i32 9
  store i32 1, ptr %1432, align 4
  br label %1433

1433:                                             ; preds = %1427, %1413
  br label %1434

1434:                                             ; preds = %1433
  br label %1435

1435:                                             ; preds = %1434
  br label %1436

1436:                                             ; preds = %1435, %1174, %1160
  br label %1437

1437:                                             ; preds = %1436
  br label %1438

1438:                                             ; preds = %1437
  br label %1439

1439:                                             ; preds = %1438
  br label %1440

1440:                                             ; preds = %1439
  br label %1441

1441:                                             ; preds = %1440, %590
  br label %1442

1442:                                             ; preds = %1441
  %1443 = load i64, ptr %9, align 8
  %1444 = add i64 %1443, 1
  store i64 %1444, ptr %9, align 8
  br label %82, !llvm.loop !21

1445:                                             ; preds = %82
  store ptr null, ptr %31, align 8
  store i32 0, ptr %32, align 4
  store i64 0, ptr %33, align 8
  br label %1446

1446:                                             ; preds = %3291, %1445
  %1447 = load i64, ptr %33, align 8
  %1448 = load i64, ptr %7, align 8
  %1449 = sub i64 %1448, 4
  %1450 = icmp ule i64 %1447, %1449
  br i1 %1450, label %1451, label %3294

1451:                                             ; preds = %1446
  %1452 = load ptr, ptr %5, align 8
  %1453 = load i64, ptr %33, align 8
  %1454 = getelementptr inbounds nuw i8, ptr %1452, i64 %1453
  %1455 = load i8, ptr %1454, align 1
  %1456 = zext i8 %1455 to i32
  %1457 = shl i32 %1456, 24
  %1458 = load ptr, ptr %5, align 8
  %1459 = load i64, ptr %33, align 8
  %1460 = add i64 %1459, 1
  %1461 = getelementptr inbounds nuw i8, ptr %1458, i64 %1460
  %1462 = load i8, ptr %1461, align 1
  %1463 = zext i8 %1462 to i32
  %1464 = shl i32 %1463, 16
  %1465 = or i32 %1457, %1464
  %1466 = load ptr, ptr %5, align 8
  %1467 = load i64, ptr %33, align 8
  %1468 = add i64 %1467, 2
  %1469 = getelementptr inbounds nuw i8, ptr %1466, i64 %1468
  %1470 = load i8, ptr %1469, align 1
  %1471 = zext i8 %1470 to i32
  %1472 = shl i32 %1471, 8
  %1473 = or i32 %1465, %1472
  %1474 = load ptr, ptr %5, align 8
  %1475 = load i64, ptr %33, align 8
  %1476 = add i64 %1475, 3
  %1477 = getelementptr inbounds nuw i8, ptr %1474, i64 %1476
  %1478 = load i8, ptr %1477, align 1
  %1479 = zext i8 %1478 to i32
  %1480 = or i32 %1473, %1479
  store i32 %1480, ptr %34, align 4
  br label %1481

1481:                                             ; preds = %1451
  store ptr null, ptr %35, align 8
  %1482 = load ptr, ptr %31, align 8
  %1483 = icmp ne ptr %1482, null
  br i1 %1483, label %1484, label %1950

1484:                                             ; preds = %1481
  br label %1485

1485:                                             ; preds = %1484
  br label %1486

1486:                                             ; preds = %1485
  store ptr %34, ptr %40, align 8
  store i32 -17973521, ptr %36, align 4
  store i32 -1640531527, ptr %38, align 4
  store i32 -1640531527, ptr %37, align 4
  store i32 4, ptr %39, align 4
  br label %1487

1487:                                             ; preds = %1654, %1486
  %1488 = load i32, ptr %39, align 4
  %1489 = icmp uge i32 %1488, 12
  br i1 %1489, label %1490, label %1659

1490:                                             ; preds = %1487
  %1491 = load ptr, ptr %40, align 8
  %1492 = getelementptr inbounds i8, ptr %1491, i64 0
  %1493 = load i8, ptr %1492, align 1
  %1494 = zext i8 %1493 to i32
  %1495 = load ptr, ptr %40, align 8
  %1496 = getelementptr inbounds i8, ptr %1495, i64 1
  %1497 = load i8, ptr %1496, align 1
  %1498 = zext i8 %1497 to i32
  %1499 = shl i32 %1498, 8
  %1500 = add i32 %1494, %1499
  %1501 = load ptr, ptr %40, align 8
  %1502 = getelementptr inbounds i8, ptr %1501, i64 2
  %1503 = load i8, ptr %1502, align 1
  %1504 = zext i8 %1503 to i32
  %1505 = shl i32 %1504, 16
  %1506 = add i32 %1500, %1505
  %1507 = load ptr, ptr %40, align 8
  %1508 = getelementptr inbounds i8, ptr %1507, i64 3
  %1509 = load i8, ptr %1508, align 1
  %1510 = zext i8 %1509 to i32
  %1511 = shl i32 %1510, 24
  %1512 = add i32 %1506, %1511
  %1513 = load i32, ptr %37, align 4
  %1514 = add i32 %1513, %1512
  store i32 %1514, ptr %37, align 4
  %1515 = load ptr, ptr %40, align 8
  %1516 = getelementptr inbounds i8, ptr %1515, i64 4
  %1517 = load i8, ptr %1516, align 1
  %1518 = zext i8 %1517 to i32
  %1519 = load ptr, ptr %40, align 8
  %1520 = getelementptr inbounds i8, ptr %1519, i64 5
  %1521 = load i8, ptr %1520, align 1
  %1522 = zext i8 %1521 to i32
  %1523 = shl i32 %1522, 8
  %1524 = add i32 %1518, %1523
  %1525 = load ptr, ptr %40, align 8
  %1526 = getelementptr inbounds i8, ptr %1525, i64 6
  %1527 = load i8, ptr %1526, align 1
  %1528 = zext i8 %1527 to i32
  %1529 = shl i32 %1528, 16
  %1530 = add i32 %1524, %1529
  %1531 = load ptr, ptr %40, align 8
  %1532 = getelementptr inbounds i8, ptr %1531, i64 7
  %1533 = load i8, ptr %1532, align 1
  %1534 = zext i8 %1533 to i32
  %1535 = shl i32 %1534, 24
  %1536 = add i32 %1530, %1535
  %1537 = load i32, ptr %38, align 4
  %1538 = add i32 %1537, %1536
  store i32 %1538, ptr %38, align 4
  %1539 = load ptr, ptr %40, align 8
  %1540 = getelementptr inbounds i8, ptr %1539, i64 8
  %1541 = load i8, ptr %1540, align 1
  %1542 = zext i8 %1541 to i32
  %1543 = load ptr, ptr %40, align 8
  %1544 = getelementptr inbounds i8, ptr %1543, i64 9
  %1545 = load i8, ptr %1544, align 1
  %1546 = zext i8 %1545 to i32
  %1547 = shl i32 %1546, 8
  %1548 = add i32 %1542, %1547
  %1549 = load ptr, ptr %40, align 8
  %1550 = getelementptr inbounds i8, ptr %1549, i64 10
  %1551 = load i8, ptr %1550, align 1
  %1552 = zext i8 %1551 to i32
  %1553 = shl i32 %1552, 16
  %1554 = add i32 %1548, %1553
  %1555 = load ptr, ptr %40, align 8
  %1556 = getelementptr inbounds i8, ptr %1555, i64 11
  %1557 = load i8, ptr %1556, align 1
  %1558 = zext i8 %1557 to i32
  %1559 = shl i32 %1558, 24
  %1560 = add i32 %1554, %1559
  %1561 = load i32, ptr %36, align 4
  %1562 = add i32 %1561, %1560
  store i32 %1562, ptr %36, align 4
  br label %1563

1563:                                             ; preds = %1490
  %1564 = load i32, ptr %38, align 4
  %1565 = load i32, ptr %37, align 4
  %1566 = sub i32 %1565, %1564
  store i32 %1566, ptr %37, align 4
  %1567 = load i32, ptr %36, align 4
  %1568 = load i32, ptr %37, align 4
  %1569 = sub i32 %1568, %1567
  store i32 %1569, ptr %37, align 4
  %1570 = load i32, ptr %36, align 4
  %1571 = lshr i32 %1570, 13
  %1572 = load i32, ptr %37, align 4
  %1573 = xor i32 %1572, %1571
  store i32 %1573, ptr %37, align 4
  %1574 = load i32, ptr %36, align 4
  %1575 = load i32, ptr %38, align 4
  %1576 = sub i32 %1575, %1574
  store i32 %1576, ptr %38, align 4
  %1577 = load i32, ptr %37, align 4
  %1578 = load i32, ptr %38, align 4
  %1579 = sub i32 %1578, %1577
  store i32 %1579, ptr %38, align 4
  %1580 = load i32, ptr %37, align 4
  %1581 = shl i32 %1580, 8
  %1582 = load i32, ptr %38, align 4
  %1583 = xor i32 %1582, %1581
  store i32 %1583, ptr %38, align 4
  %1584 = load i32, ptr %37, align 4
  %1585 = load i32, ptr %36, align 4
  %1586 = sub i32 %1585, %1584
  store i32 %1586, ptr %36, align 4
  %1587 = load i32, ptr %38, align 4
  %1588 = load i32, ptr %36, align 4
  %1589 = sub i32 %1588, %1587
  store i32 %1589, ptr %36, align 4
  %1590 = load i32, ptr %38, align 4
  %1591 = lshr i32 %1590, 13
  %1592 = load i32, ptr %36, align 4
  %1593 = xor i32 %1592, %1591
  store i32 %1593, ptr %36, align 4
  %1594 = load i32, ptr %38, align 4
  %1595 = load i32, ptr %37, align 4
  %1596 = sub i32 %1595, %1594
  store i32 %1596, ptr %37, align 4
  %1597 = load i32, ptr %36, align 4
  %1598 = load i32, ptr %37, align 4
  %1599 = sub i32 %1598, %1597
  store i32 %1599, ptr %37, align 4
  %1600 = load i32, ptr %36, align 4
  %1601 = lshr i32 %1600, 12
  %1602 = load i32, ptr %37, align 4
  %1603 = xor i32 %1602, %1601
  store i32 %1603, ptr %37, align 4
  %1604 = load i32, ptr %36, align 4
  %1605 = load i32, ptr %38, align 4
  %1606 = sub i32 %1605, %1604
  store i32 %1606, ptr %38, align 4
  %1607 = load i32, ptr %37, align 4
  %1608 = load i32, ptr %38, align 4
  %1609 = sub i32 %1608, %1607
  store i32 %1609, ptr %38, align 4
  %1610 = load i32, ptr %37, align 4
  %1611 = shl i32 %1610, 16
  %1612 = load i32, ptr %38, align 4
  %1613 = xor i32 %1612, %1611
  store i32 %1613, ptr %38, align 4
  %1614 = load i32, ptr %37, align 4
  %1615 = load i32, ptr %36, align 4
  %1616 = sub i32 %1615, %1614
  store i32 %1616, ptr %36, align 4
  %1617 = load i32, ptr %38, align 4
  %1618 = load i32, ptr %36, align 4
  %1619 = sub i32 %1618, %1617
  store i32 %1619, ptr %36, align 4
  %1620 = load i32, ptr %38, align 4
  %1621 = lshr i32 %1620, 5
  %1622 = load i32, ptr %36, align 4
  %1623 = xor i32 %1622, %1621
  store i32 %1623, ptr %36, align 4
  %1624 = load i32, ptr %38, align 4
  %1625 = load i32, ptr %37, align 4
  %1626 = sub i32 %1625, %1624
  store i32 %1626, ptr %37, align 4
  %1627 = load i32, ptr %36, align 4
  %1628 = load i32, ptr %37, align 4
  %1629 = sub i32 %1628, %1627
  store i32 %1629, ptr %37, align 4
  %1630 = load i32, ptr %36, align 4
  %1631 = lshr i32 %1630, 3
  %1632 = load i32, ptr %37, align 4
  %1633 = xor i32 %1632, %1631
  store i32 %1633, ptr %37, align 4
  %1634 = load i32, ptr %36, align 4
  %1635 = load i32, ptr %38, align 4
  %1636 = sub i32 %1635, %1634
  store i32 %1636, ptr %38, align 4
  %1637 = load i32, ptr %37, align 4
  %1638 = load i32, ptr %38, align 4
  %1639 = sub i32 %1638, %1637
  store i32 %1639, ptr %38, align 4
  %1640 = load i32, ptr %37, align 4
  %1641 = shl i32 %1640, 10
  %1642 = load i32, ptr %38, align 4
  %1643 = xor i32 %1642, %1641
  store i32 %1643, ptr %38, align 4
  %1644 = load i32, ptr %37, align 4
  %1645 = load i32, ptr %36, align 4
  %1646 = sub i32 %1645, %1644
  store i32 %1646, ptr %36, align 4
  %1647 = load i32, ptr %38, align 4
  %1648 = load i32, ptr %36, align 4
  %1649 = sub i32 %1648, %1647
  store i32 %1649, ptr %36, align 4
  %1650 = load i32, ptr %38, align 4
  %1651 = lshr i32 %1650, 15
  %1652 = load i32, ptr %36, align 4
  %1653 = xor i32 %1652, %1651
  store i32 %1653, ptr %36, align 4
  br label %1654

1654:                                             ; preds = %1563
  %1655 = load ptr, ptr %40, align 8
  %1656 = getelementptr inbounds i8, ptr %1655, i64 12
  store ptr %1656, ptr %40, align 8
  %1657 = load i32, ptr %39, align 4
  %1658 = sub i32 %1657, 12
  store i32 %1658, ptr %39, align 4
  br label %1487, !llvm.loop !22

1659:                                             ; preds = %1487
  %1660 = load i32, ptr %36, align 4
  %1661 = add i32 %1660, 4
  store i32 %1661, ptr %36, align 4
  %1662 = load i32, ptr %39, align 4
  switch i32 %1662, label %1749 [
    i32 11, label %1663
    i32 10, label %1671
    i32 9, label %1679
    i32 8, label %1687
    i32 7, label %1695
    i32 6, label %1703
    i32 5, label %1711
    i32 4, label %1718
    i32 3, label %1726
    i32 2, label %1734
    i32 1, label %1742
  ]

1663:                                             ; preds = %1659
  %1664 = load ptr, ptr %40, align 8
  %1665 = getelementptr inbounds i8, ptr %1664, i64 10
  %1666 = load i8, ptr %1665, align 1
  %1667 = zext i8 %1666 to i32
  %1668 = shl i32 %1667, 24
  %1669 = load i32, ptr %36, align 4
  %1670 = add i32 %1669, %1668
  store i32 %1670, ptr %36, align 4
  br label %1671

1671:                                             ; preds = %1659, %1663
  %1672 = load ptr, ptr %40, align 8
  %1673 = getelementptr inbounds i8, ptr %1672, i64 9
  %1674 = load i8, ptr %1673, align 1
  %1675 = zext i8 %1674 to i32
  %1676 = shl i32 %1675, 16
  %1677 = load i32, ptr %36, align 4
  %1678 = add i32 %1677, %1676
  store i32 %1678, ptr %36, align 4
  br label %1679

1679:                                             ; preds = %1659, %1671
  %1680 = load ptr, ptr %40, align 8
  %1681 = getelementptr inbounds i8, ptr %1680, i64 8
  %1682 = load i8, ptr %1681, align 1
  %1683 = zext i8 %1682 to i32
  %1684 = shl i32 %1683, 8
  %1685 = load i32, ptr %36, align 4
  %1686 = add i32 %1685, %1684
  store i32 %1686, ptr %36, align 4
  br label %1687

1687:                                             ; preds = %1659, %1679
  %1688 = load ptr, ptr %40, align 8
  %1689 = getelementptr inbounds i8, ptr %1688, i64 7
  %1690 = load i8, ptr %1689, align 1
  %1691 = zext i8 %1690 to i32
  %1692 = shl i32 %1691, 24
  %1693 = load i32, ptr %38, align 4
  %1694 = add i32 %1693, %1692
  store i32 %1694, ptr %38, align 4
  br label %1695

1695:                                             ; preds = %1659, %1687
  %1696 = load ptr, ptr %40, align 8
  %1697 = getelementptr inbounds i8, ptr %1696, i64 6
  %1698 = load i8, ptr %1697, align 1
  %1699 = zext i8 %1698 to i32
  %1700 = shl i32 %1699, 16
  %1701 = load i32, ptr %38, align 4
  %1702 = add i32 %1701, %1700
  store i32 %1702, ptr %38, align 4
  br label %1703

1703:                                             ; preds = %1659, %1695
  %1704 = load ptr, ptr %40, align 8
  %1705 = getelementptr inbounds i8, ptr %1704, i64 5
  %1706 = load i8, ptr %1705, align 1
  %1707 = zext i8 %1706 to i32
  %1708 = shl i32 %1707, 8
  %1709 = load i32, ptr %38, align 4
  %1710 = add i32 %1709, %1708
  store i32 %1710, ptr %38, align 4
  br label %1711

1711:                                             ; preds = %1659, %1703
  %1712 = load ptr, ptr %40, align 8
  %1713 = getelementptr inbounds i8, ptr %1712, i64 4
  %1714 = load i8, ptr %1713, align 1
  %1715 = zext i8 %1714 to i32
  %1716 = load i32, ptr %38, align 4
  %1717 = add i32 %1716, %1715
  store i32 %1717, ptr %38, align 4
  br label %1718

1718:                                             ; preds = %1659, %1711
  %1719 = load ptr, ptr %40, align 8
  %1720 = getelementptr inbounds i8, ptr %1719, i64 3
  %1721 = load i8, ptr %1720, align 1
  %1722 = zext i8 %1721 to i32
  %1723 = shl i32 %1722, 24
  %1724 = load i32, ptr %37, align 4
  %1725 = add i32 %1724, %1723
  store i32 %1725, ptr %37, align 4
  br label %1726

1726:                                             ; preds = %1659, %1718
  %1727 = load ptr, ptr %40, align 8
  %1728 = getelementptr inbounds i8, ptr %1727, i64 2
  %1729 = load i8, ptr %1728, align 1
  %1730 = zext i8 %1729 to i32
  %1731 = shl i32 %1730, 16
  %1732 = load i32, ptr %37, align 4
  %1733 = add i32 %1732, %1731
  store i32 %1733, ptr %37, align 4
  br label %1734

1734:                                             ; preds = %1659, %1726
  %1735 = load ptr, ptr %40, align 8
  %1736 = getelementptr inbounds i8, ptr %1735, i64 1
  %1737 = load i8, ptr %1736, align 1
  %1738 = zext i8 %1737 to i32
  %1739 = shl i32 %1738, 8
  %1740 = load i32, ptr %37, align 4
  %1741 = add i32 %1740, %1739
  store i32 %1741, ptr %37, align 4
  br label %1742

1742:                                             ; preds = %1659, %1734
  %1743 = load ptr, ptr %40, align 8
  %1744 = getelementptr inbounds i8, ptr %1743, i64 0
  %1745 = load i8, ptr %1744, align 1
  %1746 = zext i8 %1745 to i32
  %1747 = load i32, ptr %37, align 4
  %1748 = add i32 %1747, %1746
  store i32 %1748, ptr %37, align 4
  br label %1749

1749:                                             ; preds = %1659, %1742
  br label %1750

1750:                                             ; preds = %1749
  br label %1751

1751:                                             ; preds = %1750
  %1752 = load i32, ptr %38, align 4
  %1753 = load i32, ptr %37, align 4
  %1754 = sub i32 %1753, %1752
  store i32 %1754, ptr %37, align 4
  %1755 = load i32, ptr %36, align 4
  %1756 = load i32, ptr %37, align 4
  %1757 = sub i32 %1756, %1755
  store i32 %1757, ptr %37, align 4
  %1758 = load i32, ptr %36, align 4
  %1759 = lshr i32 %1758, 13
  %1760 = load i32, ptr %37, align 4
  %1761 = xor i32 %1760, %1759
  store i32 %1761, ptr %37, align 4
  %1762 = load i32, ptr %36, align 4
  %1763 = load i32, ptr %38, align 4
  %1764 = sub i32 %1763, %1762
  store i32 %1764, ptr %38, align 4
  %1765 = load i32, ptr %37, align 4
  %1766 = load i32, ptr %38, align 4
  %1767 = sub i32 %1766, %1765
  store i32 %1767, ptr %38, align 4
  %1768 = load i32, ptr %37, align 4
  %1769 = shl i32 %1768, 8
  %1770 = load i32, ptr %38, align 4
  %1771 = xor i32 %1770, %1769
  store i32 %1771, ptr %38, align 4
  %1772 = load i32, ptr %37, align 4
  %1773 = load i32, ptr %36, align 4
  %1774 = sub i32 %1773, %1772
  store i32 %1774, ptr %36, align 4
  %1775 = load i32, ptr %38, align 4
  %1776 = load i32, ptr %36, align 4
  %1777 = sub i32 %1776, %1775
  store i32 %1777, ptr %36, align 4
  %1778 = load i32, ptr %38, align 4
  %1779 = lshr i32 %1778, 13
  %1780 = load i32, ptr %36, align 4
  %1781 = xor i32 %1780, %1779
  store i32 %1781, ptr %36, align 4
  %1782 = load i32, ptr %38, align 4
  %1783 = load i32, ptr %37, align 4
  %1784 = sub i32 %1783, %1782
  store i32 %1784, ptr %37, align 4
  %1785 = load i32, ptr %36, align 4
  %1786 = load i32, ptr %37, align 4
  %1787 = sub i32 %1786, %1785
  store i32 %1787, ptr %37, align 4
  %1788 = load i32, ptr %36, align 4
  %1789 = lshr i32 %1788, 12
  %1790 = load i32, ptr %37, align 4
  %1791 = xor i32 %1790, %1789
  store i32 %1791, ptr %37, align 4
  %1792 = load i32, ptr %36, align 4
  %1793 = load i32, ptr %38, align 4
  %1794 = sub i32 %1793, %1792
  store i32 %1794, ptr %38, align 4
  %1795 = load i32, ptr %37, align 4
  %1796 = load i32, ptr %38, align 4
  %1797 = sub i32 %1796, %1795
  store i32 %1797, ptr %38, align 4
  %1798 = load i32, ptr %37, align 4
  %1799 = shl i32 %1798, 16
  %1800 = load i32, ptr %38, align 4
  %1801 = xor i32 %1800, %1799
  store i32 %1801, ptr %38, align 4
  %1802 = load i32, ptr %37, align 4
  %1803 = load i32, ptr %36, align 4
  %1804 = sub i32 %1803, %1802
  store i32 %1804, ptr %36, align 4
  %1805 = load i32, ptr %38, align 4
  %1806 = load i32, ptr %36, align 4
  %1807 = sub i32 %1806, %1805
  store i32 %1807, ptr %36, align 4
  %1808 = load i32, ptr %38, align 4
  %1809 = lshr i32 %1808, 5
  %1810 = load i32, ptr %36, align 4
  %1811 = xor i32 %1810, %1809
  store i32 %1811, ptr %36, align 4
  %1812 = load i32, ptr %38, align 4
  %1813 = load i32, ptr %37, align 4
  %1814 = sub i32 %1813, %1812
  store i32 %1814, ptr %37, align 4
  %1815 = load i32, ptr %36, align 4
  %1816 = load i32, ptr %37, align 4
  %1817 = sub i32 %1816, %1815
  store i32 %1817, ptr %37, align 4
  %1818 = load i32, ptr %36, align 4
  %1819 = lshr i32 %1818, 3
  %1820 = load i32, ptr %37, align 4
  %1821 = xor i32 %1820, %1819
  store i32 %1821, ptr %37, align 4
  %1822 = load i32, ptr %36, align 4
  %1823 = load i32, ptr %38, align 4
  %1824 = sub i32 %1823, %1822
  store i32 %1824, ptr %38, align 4
  %1825 = load i32, ptr %37, align 4
  %1826 = load i32, ptr %38, align 4
  %1827 = sub i32 %1826, %1825
  store i32 %1827, ptr %38, align 4
  %1828 = load i32, ptr %37, align 4
  %1829 = shl i32 %1828, 10
  %1830 = load i32, ptr %38, align 4
  %1831 = xor i32 %1830, %1829
  store i32 %1831, ptr %38, align 4
  %1832 = load i32, ptr %37, align 4
  %1833 = load i32, ptr %36, align 4
  %1834 = sub i32 %1833, %1832
  store i32 %1834, ptr %36, align 4
  %1835 = load i32, ptr %38, align 4
  %1836 = load i32, ptr %36, align 4
  %1837 = sub i32 %1836, %1835
  store i32 %1837, ptr %36, align 4
  %1838 = load i32, ptr %38, align 4
  %1839 = lshr i32 %1838, 15
  %1840 = load i32, ptr %36, align 4
  %1841 = xor i32 %1840, %1839
  store i32 %1841, ptr %36, align 4
  br label %1842

1842:                                             ; preds = %1751
  br label %1843

1843:                                             ; preds = %1842
  br label %1844

1844:                                             ; preds = %1843
  br label %1845

1845:                                             ; preds = %1844
  store ptr null, ptr %35, align 8
  %1846 = load ptr, ptr %31, align 8
  %1847 = icmp ne ptr %1846, null
  br i1 %1847, label %1848, label %1948

1848:                                             ; preds = %1845
  br label %1849

1849:                                             ; preds = %1848
  %1850 = load i32, ptr %36, align 4
  %1851 = load ptr, ptr %31, align 8
  %1852 = getelementptr inbounds nuw %struct.GramHash, ptr %1851, i32 0, i32 2
  %1853 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1852, i32 0, i32 0
  %1854 = load ptr, ptr %1853, align 8
  %1855 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1854, i32 0, i32 1
  %1856 = load i32, ptr %1855, align 8
  %1857 = sub i32 %1856, 1
  %1858 = and i32 %1850, %1857
  store i32 %1858, ptr %41, align 4
  br label %1859

1859:                                             ; preds = %1849
  br label %1860

1860:                                             ; preds = %1859
  %1861 = load ptr, ptr %31, align 8
  %1862 = getelementptr inbounds nuw %struct.GramHash, ptr %1861, i32 0, i32 2
  %1863 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1862, i32 0, i32 0
  %1864 = load ptr, ptr %1863, align 8
  %1865 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1864, i32 0, i32 0
  %1866 = load ptr, ptr %1865, align 8
  %1867 = load i32, ptr %41, align 4
  %1868 = zext i32 %1867 to i64
  %1869 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1866, i64 %1868
  %1870 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1869, i32 0, i32 0
  %1871 = load ptr, ptr %1870, align 8
  %1872 = icmp ne ptr %1871, null
  br i1 %1872, label %1873, label %1895

1873:                                             ; preds = %1860
  br label %1874

1874:                                             ; preds = %1873
  %1875 = load ptr, ptr %31, align 8
  %1876 = getelementptr inbounds nuw %struct.GramHash, ptr %1875, i32 0, i32 2
  %1877 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1876, i32 0, i32 0
  %1878 = load ptr, ptr %1877, align 8
  %1879 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1878, i32 0, i32 0
  %1880 = load ptr, ptr %1879, align 8
  %1881 = load i32, ptr %41, align 4
  %1882 = zext i32 %1881 to i64
  %1883 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1880, i64 %1882
  %1884 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1883, i32 0, i32 0
  %1885 = load ptr, ptr %1884, align 8
  %1886 = load ptr, ptr %31, align 8
  %1887 = getelementptr inbounds nuw %struct.GramHash, ptr %1886, i32 0, i32 2
  %1888 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1887, i32 0, i32 0
  %1889 = load ptr, ptr %1888, align 8
  %1890 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1889, i32 0, i32 5
  %1891 = load i64, ptr %1890, align 8
  %1892 = sub i64 0, %1891
  %1893 = getelementptr inbounds i8, ptr %1885, i64 %1892
  store ptr %1893, ptr %35, align 8
  br label %1894

1894:                                             ; preds = %1874
  br label %1896

1895:                                             ; preds = %1860
  store ptr null, ptr %35, align 8
  br label %1896

1896:                                             ; preds = %1895, %1894
  br label %1897

1897:                                             ; preds = %1945, %1896
  %1898 = load ptr, ptr %35, align 8
  %1899 = icmp ne ptr %1898, null
  br i1 %1899, label %1900, label %1946

1900:                                             ; preds = %1897
  %1901 = load ptr, ptr %35, align 8
  %1902 = getelementptr inbounds nuw %struct.GramHash, ptr %1901, i32 0, i32 2
  %1903 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1902, i32 0, i32 7
  %1904 = load i32, ptr %1903, align 4
  %1905 = load i32, ptr %36, align 4
  %1906 = icmp eq i32 %1904, %1905
  br i1 %1906, label %1907, label %1923

1907:                                             ; preds = %1900
  %1908 = load ptr, ptr %35, align 8
  %1909 = getelementptr inbounds nuw %struct.GramHash, ptr %1908, i32 0, i32 2
  %1910 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1909, i32 0, i32 6
  %1911 = load i32, ptr %1910, align 8
  %1912 = zext i32 %1911 to i64
  %1913 = icmp eq i64 %1912, 4
  br i1 %1913, label %1914, label %1923

1914:                                             ; preds = %1907
  %1915 = load ptr, ptr %35, align 8
  %1916 = getelementptr inbounds nuw %struct.GramHash, ptr %1915, i32 0, i32 2
  %1917 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1916, i32 0, i32 5
  %1918 = load ptr, ptr %1917, align 8
  %1919 = call i32 @memcmp(ptr noundef %1918, ptr noundef %34, i64 noundef 4)
  %1920 = icmp eq i32 %1919, 0
  br i1 %1920, label %1921, label %1922

1921:                                             ; preds = %1914
  br label %1946

1922:                                             ; preds = %1914
  br label %1923

1923:                                             ; preds = %1922, %1907, %1900
  %1924 = load ptr, ptr %35, align 8
  %1925 = getelementptr inbounds nuw %struct.GramHash, ptr %1924, i32 0, i32 2
  %1926 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1925, i32 0, i32 4
  %1927 = load ptr, ptr %1926, align 8
  %1928 = icmp ne ptr %1927, null
  br i1 %1928, label %1929, label %1944

1929:                                             ; preds = %1923
  br label %1930

1930:                                             ; preds = %1929
  %1931 = load ptr, ptr %35, align 8
  %1932 = getelementptr inbounds nuw %struct.GramHash, ptr %1931, i32 0, i32 2
  %1933 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1932, i32 0, i32 4
  %1934 = load ptr, ptr %1933, align 8
  %1935 = load ptr, ptr %31, align 8
  %1936 = getelementptr inbounds nuw %struct.GramHash, ptr %1935, i32 0, i32 2
  %1937 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1936, i32 0, i32 0
  %1938 = load ptr, ptr %1937, align 8
  %1939 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1938, i32 0, i32 5
  %1940 = load i64, ptr %1939, align 8
  %1941 = sub i64 0, %1940
  %1942 = getelementptr inbounds i8, ptr %1934, i64 %1941
  store ptr %1942, ptr %35, align 8
  br label %1943

1943:                                             ; preds = %1930
  br label %1945

1944:                                             ; preds = %1923
  store ptr null, ptr %35, align 8
  br label %1945

1945:                                             ; preds = %1944, %1943
  br label %1897, !llvm.loop !23

1946:                                             ; preds = %1921, %1897
  br label %1947

1947:                                             ; preds = %1946
  br label %1948

1948:                                             ; preds = %1947, %1845
  br label %1949

1949:                                             ; preds = %1948
  br label %1950

1950:                                             ; preds = %1949, %1481
  br label %1951

1951:                                             ; preds = %1950
  %1952 = load ptr, ptr %35, align 8
  %1953 = icmp ne ptr %1952, null
  br i1 %1953, label %1954, label %1959

1954:                                             ; preds = %1951
  %1955 = load ptr, ptr %35, align 8
  %1956 = getelementptr inbounds nuw %struct.GramHash, ptr %1955, i32 0, i32 1
  %1957 = load i32, ptr %1956, align 4
  %1958 = add nsw i32 %1957, 1
  store i32 %1958, ptr %1956, align 4
  br label %2805

1959:                                             ; preds = %1951
  %1960 = call noalias ptr @malloc(i64 noundef 64)
  store ptr %1960, ptr %35, align 8
  %1961 = load i32, ptr %34, align 4
  %1962 = load ptr, ptr %35, align 8
  %1963 = getelementptr inbounds nuw %struct.GramHash, ptr %1962, i32 0, i32 0
  store i32 %1961, ptr %1963, align 8
  %1964 = load ptr, ptr %35, align 8
  %1965 = getelementptr inbounds nuw %struct.GramHash, ptr %1964, i32 0, i32 1
  store i32 1, ptr %1965, align 4
  br label %1966

1966:                                             ; preds = %1959
  br label %1967

1967:                                             ; preds = %1966
  br label %1968

1968:                                             ; preds = %1967
  %1969 = load ptr, ptr %35, align 8
  %1970 = getelementptr inbounds nuw %struct.GramHash, ptr %1969, i32 0, i32 0
  store ptr %1970, ptr %46, align 8
  store i32 -17973521, ptr %42, align 4
  store i32 -1640531527, ptr %44, align 4
  store i32 -1640531527, ptr %43, align 4
  store i32 4, ptr %45, align 4
  br label %1971

1971:                                             ; preds = %2138, %1968
  %1972 = load i32, ptr %45, align 4
  %1973 = icmp uge i32 %1972, 12
  br i1 %1973, label %1974, label %2143

1974:                                             ; preds = %1971
  %1975 = load ptr, ptr %46, align 8
  %1976 = getelementptr inbounds i8, ptr %1975, i64 0
  %1977 = load i8, ptr %1976, align 1
  %1978 = zext i8 %1977 to i32
  %1979 = load ptr, ptr %46, align 8
  %1980 = getelementptr inbounds i8, ptr %1979, i64 1
  %1981 = load i8, ptr %1980, align 1
  %1982 = zext i8 %1981 to i32
  %1983 = shl i32 %1982, 8
  %1984 = add i32 %1978, %1983
  %1985 = load ptr, ptr %46, align 8
  %1986 = getelementptr inbounds i8, ptr %1985, i64 2
  %1987 = load i8, ptr %1986, align 1
  %1988 = zext i8 %1987 to i32
  %1989 = shl i32 %1988, 16
  %1990 = add i32 %1984, %1989
  %1991 = load ptr, ptr %46, align 8
  %1992 = getelementptr inbounds i8, ptr %1991, i64 3
  %1993 = load i8, ptr %1992, align 1
  %1994 = zext i8 %1993 to i32
  %1995 = shl i32 %1994, 24
  %1996 = add i32 %1990, %1995
  %1997 = load i32, ptr %43, align 4
  %1998 = add i32 %1997, %1996
  store i32 %1998, ptr %43, align 4
  %1999 = load ptr, ptr %46, align 8
  %2000 = getelementptr inbounds i8, ptr %1999, i64 4
  %2001 = load i8, ptr %2000, align 1
  %2002 = zext i8 %2001 to i32
  %2003 = load ptr, ptr %46, align 8
  %2004 = getelementptr inbounds i8, ptr %2003, i64 5
  %2005 = load i8, ptr %2004, align 1
  %2006 = zext i8 %2005 to i32
  %2007 = shl i32 %2006, 8
  %2008 = add i32 %2002, %2007
  %2009 = load ptr, ptr %46, align 8
  %2010 = getelementptr inbounds i8, ptr %2009, i64 6
  %2011 = load i8, ptr %2010, align 1
  %2012 = zext i8 %2011 to i32
  %2013 = shl i32 %2012, 16
  %2014 = add i32 %2008, %2013
  %2015 = load ptr, ptr %46, align 8
  %2016 = getelementptr inbounds i8, ptr %2015, i64 7
  %2017 = load i8, ptr %2016, align 1
  %2018 = zext i8 %2017 to i32
  %2019 = shl i32 %2018, 24
  %2020 = add i32 %2014, %2019
  %2021 = load i32, ptr %44, align 4
  %2022 = add i32 %2021, %2020
  store i32 %2022, ptr %44, align 4
  %2023 = load ptr, ptr %46, align 8
  %2024 = getelementptr inbounds i8, ptr %2023, i64 8
  %2025 = load i8, ptr %2024, align 1
  %2026 = zext i8 %2025 to i32
  %2027 = load ptr, ptr %46, align 8
  %2028 = getelementptr inbounds i8, ptr %2027, i64 9
  %2029 = load i8, ptr %2028, align 1
  %2030 = zext i8 %2029 to i32
  %2031 = shl i32 %2030, 8
  %2032 = add i32 %2026, %2031
  %2033 = load ptr, ptr %46, align 8
  %2034 = getelementptr inbounds i8, ptr %2033, i64 10
  %2035 = load i8, ptr %2034, align 1
  %2036 = zext i8 %2035 to i32
  %2037 = shl i32 %2036, 16
  %2038 = add i32 %2032, %2037
  %2039 = load ptr, ptr %46, align 8
  %2040 = getelementptr inbounds i8, ptr %2039, i64 11
  %2041 = load i8, ptr %2040, align 1
  %2042 = zext i8 %2041 to i32
  %2043 = shl i32 %2042, 24
  %2044 = add i32 %2038, %2043
  %2045 = load i32, ptr %42, align 4
  %2046 = add i32 %2045, %2044
  store i32 %2046, ptr %42, align 4
  br label %2047

2047:                                             ; preds = %1974
  %2048 = load i32, ptr %44, align 4
  %2049 = load i32, ptr %43, align 4
  %2050 = sub i32 %2049, %2048
  store i32 %2050, ptr %43, align 4
  %2051 = load i32, ptr %42, align 4
  %2052 = load i32, ptr %43, align 4
  %2053 = sub i32 %2052, %2051
  store i32 %2053, ptr %43, align 4
  %2054 = load i32, ptr %42, align 4
  %2055 = lshr i32 %2054, 13
  %2056 = load i32, ptr %43, align 4
  %2057 = xor i32 %2056, %2055
  store i32 %2057, ptr %43, align 4
  %2058 = load i32, ptr %42, align 4
  %2059 = load i32, ptr %44, align 4
  %2060 = sub i32 %2059, %2058
  store i32 %2060, ptr %44, align 4
  %2061 = load i32, ptr %43, align 4
  %2062 = load i32, ptr %44, align 4
  %2063 = sub i32 %2062, %2061
  store i32 %2063, ptr %44, align 4
  %2064 = load i32, ptr %43, align 4
  %2065 = shl i32 %2064, 8
  %2066 = load i32, ptr %44, align 4
  %2067 = xor i32 %2066, %2065
  store i32 %2067, ptr %44, align 4
  %2068 = load i32, ptr %43, align 4
  %2069 = load i32, ptr %42, align 4
  %2070 = sub i32 %2069, %2068
  store i32 %2070, ptr %42, align 4
  %2071 = load i32, ptr %44, align 4
  %2072 = load i32, ptr %42, align 4
  %2073 = sub i32 %2072, %2071
  store i32 %2073, ptr %42, align 4
  %2074 = load i32, ptr %44, align 4
  %2075 = lshr i32 %2074, 13
  %2076 = load i32, ptr %42, align 4
  %2077 = xor i32 %2076, %2075
  store i32 %2077, ptr %42, align 4
  %2078 = load i32, ptr %44, align 4
  %2079 = load i32, ptr %43, align 4
  %2080 = sub i32 %2079, %2078
  store i32 %2080, ptr %43, align 4
  %2081 = load i32, ptr %42, align 4
  %2082 = load i32, ptr %43, align 4
  %2083 = sub i32 %2082, %2081
  store i32 %2083, ptr %43, align 4
  %2084 = load i32, ptr %42, align 4
  %2085 = lshr i32 %2084, 12
  %2086 = load i32, ptr %43, align 4
  %2087 = xor i32 %2086, %2085
  store i32 %2087, ptr %43, align 4
  %2088 = load i32, ptr %42, align 4
  %2089 = load i32, ptr %44, align 4
  %2090 = sub i32 %2089, %2088
  store i32 %2090, ptr %44, align 4
  %2091 = load i32, ptr %43, align 4
  %2092 = load i32, ptr %44, align 4
  %2093 = sub i32 %2092, %2091
  store i32 %2093, ptr %44, align 4
  %2094 = load i32, ptr %43, align 4
  %2095 = shl i32 %2094, 16
  %2096 = load i32, ptr %44, align 4
  %2097 = xor i32 %2096, %2095
  store i32 %2097, ptr %44, align 4
  %2098 = load i32, ptr %43, align 4
  %2099 = load i32, ptr %42, align 4
  %2100 = sub i32 %2099, %2098
  store i32 %2100, ptr %42, align 4
  %2101 = load i32, ptr %44, align 4
  %2102 = load i32, ptr %42, align 4
  %2103 = sub i32 %2102, %2101
  store i32 %2103, ptr %42, align 4
  %2104 = load i32, ptr %44, align 4
  %2105 = lshr i32 %2104, 5
  %2106 = load i32, ptr %42, align 4
  %2107 = xor i32 %2106, %2105
  store i32 %2107, ptr %42, align 4
  %2108 = load i32, ptr %44, align 4
  %2109 = load i32, ptr %43, align 4
  %2110 = sub i32 %2109, %2108
  store i32 %2110, ptr %43, align 4
  %2111 = load i32, ptr %42, align 4
  %2112 = load i32, ptr %43, align 4
  %2113 = sub i32 %2112, %2111
  store i32 %2113, ptr %43, align 4
  %2114 = load i32, ptr %42, align 4
  %2115 = lshr i32 %2114, 3
  %2116 = load i32, ptr %43, align 4
  %2117 = xor i32 %2116, %2115
  store i32 %2117, ptr %43, align 4
  %2118 = load i32, ptr %42, align 4
  %2119 = load i32, ptr %44, align 4
  %2120 = sub i32 %2119, %2118
  store i32 %2120, ptr %44, align 4
  %2121 = load i32, ptr %43, align 4
  %2122 = load i32, ptr %44, align 4
  %2123 = sub i32 %2122, %2121
  store i32 %2123, ptr %44, align 4
  %2124 = load i32, ptr %43, align 4
  %2125 = shl i32 %2124, 10
  %2126 = load i32, ptr %44, align 4
  %2127 = xor i32 %2126, %2125
  store i32 %2127, ptr %44, align 4
  %2128 = load i32, ptr %43, align 4
  %2129 = load i32, ptr %42, align 4
  %2130 = sub i32 %2129, %2128
  store i32 %2130, ptr %42, align 4
  %2131 = load i32, ptr %44, align 4
  %2132 = load i32, ptr %42, align 4
  %2133 = sub i32 %2132, %2131
  store i32 %2133, ptr %42, align 4
  %2134 = load i32, ptr %44, align 4
  %2135 = lshr i32 %2134, 15
  %2136 = load i32, ptr %42, align 4
  %2137 = xor i32 %2136, %2135
  store i32 %2137, ptr %42, align 4
  br label %2138

2138:                                             ; preds = %2047
  %2139 = load ptr, ptr %46, align 8
  %2140 = getelementptr inbounds i8, ptr %2139, i64 12
  store ptr %2140, ptr %46, align 8
  %2141 = load i32, ptr %45, align 4
  %2142 = sub i32 %2141, 12
  store i32 %2142, ptr %45, align 4
  br label %1971, !llvm.loop !24

2143:                                             ; preds = %1971
  %2144 = load i32, ptr %42, align 4
  %2145 = add i32 %2144, 4
  store i32 %2145, ptr %42, align 4
  %2146 = load i32, ptr %45, align 4
  switch i32 %2146, label %2233 [
    i32 11, label %2147
    i32 10, label %2155
    i32 9, label %2163
    i32 8, label %2171
    i32 7, label %2179
    i32 6, label %2187
    i32 5, label %2195
    i32 4, label %2202
    i32 3, label %2210
    i32 2, label %2218
    i32 1, label %2226
  ]

2147:                                             ; preds = %2143
  %2148 = load ptr, ptr %46, align 8
  %2149 = getelementptr inbounds i8, ptr %2148, i64 10
  %2150 = load i8, ptr %2149, align 1
  %2151 = zext i8 %2150 to i32
  %2152 = shl i32 %2151, 24
  %2153 = load i32, ptr %42, align 4
  %2154 = add i32 %2153, %2152
  store i32 %2154, ptr %42, align 4
  br label %2155

2155:                                             ; preds = %2143, %2147
  %2156 = load ptr, ptr %46, align 8
  %2157 = getelementptr inbounds i8, ptr %2156, i64 9
  %2158 = load i8, ptr %2157, align 1
  %2159 = zext i8 %2158 to i32
  %2160 = shl i32 %2159, 16
  %2161 = load i32, ptr %42, align 4
  %2162 = add i32 %2161, %2160
  store i32 %2162, ptr %42, align 4
  br label %2163

2163:                                             ; preds = %2143, %2155
  %2164 = load ptr, ptr %46, align 8
  %2165 = getelementptr inbounds i8, ptr %2164, i64 8
  %2166 = load i8, ptr %2165, align 1
  %2167 = zext i8 %2166 to i32
  %2168 = shl i32 %2167, 8
  %2169 = load i32, ptr %42, align 4
  %2170 = add i32 %2169, %2168
  store i32 %2170, ptr %42, align 4
  br label %2171

2171:                                             ; preds = %2143, %2163
  %2172 = load ptr, ptr %46, align 8
  %2173 = getelementptr inbounds i8, ptr %2172, i64 7
  %2174 = load i8, ptr %2173, align 1
  %2175 = zext i8 %2174 to i32
  %2176 = shl i32 %2175, 24
  %2177 = load i32, ptr %44, align 4
  %2178 = add i32 %2177, %2176
  store i32 %2178, ptr %44, align 4
  br label %2179

2179:                                             ; preds = %2143, %2171
  %2180 = load ptr, ptr %46, align 8
  %2181 = getelementptr inbounds i8, ptr %2180, i64 6
  %2182 = load i8, ptr %2181, align 1
  %2183 = zext i8 %2182 to i32
  %2184 = shl i32 %2183, 16
  %2185 = load i32, ptr %44, align 4
  %2186 = add i32 %2185, %2184
  store i32 %2186, ptr %44, align 4
  br label %2187

2187:                                             ; preds = %2143, %2179
  %2188 = load ptr, ptr %46, align 8
  %2189 = getelementptr inbounds i8, ptr %2188, i64 5
  %2190 = load i8, ptr %2189, align 1
  %2191 = zext i8 %2190 to i32
  %2192 = shl i32 %2191, 8
  %2193 = load i32, ptr %44, align 4
  %2194 = add i32 %2193, %2192
  store i32 %2194, ptr %44, align 4
  br label %2195

2195:                                             ; preds = %2143, %2187
  %2196 = load ptr, ptr %46, align 8
  %2197 = getelementptr inbounds i8, ptr %2196, i64 4
  %2198 = load i8, ptr %2197, align 1
  %2199 = zext i8 %2198 to i32
  %2200 = load i32, ptr %44, align 4
  %2201 = add i32 %2200, %2199
  store i32 %2201, ptr %44, align 4
  br label %2202

2202:                                             ; preds = %2143, %2195
  %2203 = load ptr, ptr %46, align 8
  %2204 = getelementptr inbounds i8, ptr %2203, i64 3
  %2205 = load i8, ptr %2204, align 1
  %2206 = zext i8 %2205 to i32
  %2207 = shl i32 %2206, 24
  %2208 = load i32, ptr %43, align 4
  %2209 = add i32 %2208, %2207
  store i32 %2209, ptr %43, align 4
  br label %2210

2210:                                             ; preds = %2143, %2202
  %2211 = load ptr, ptr %46, align 8
  %2212 = getelementptr inbounds i8, ptr %2211, i64 2
  %2213 = load i8, ptr %2212, align 1
  %2214 = zext i8 %2213 to i32
  %2215 = shl i32 %2214, 16
  %2216 = load i32, ptr %43, align 4
  %2217 = add i32 %2216, %2215
  store i32 %2217, ptr %43, align 4
  br label %2218

2218:                                             ; preds = %2143, %2210
  %2219 = load ptr, ptr %46, align 8
  %2220 = getelementptr inbounds i8, ptr %2219, i64 1
  %2221 = load i8, ptr %2220, align 1
  %2222 = zext i8 %2221 to i32
  %2223 = shl i32 %2222, 8
  %2224 = load i32, ptr %43, align 4
  %2225 = add i32 %2224, %2223
  store i32 %2225, ptr %43, align 4
  br label %2226

2226:                                             ; preds = %2143, %2218
  %2227 = load ptr, ptr %46, align 8
  %2228 = getelementptr inbounds i8, ptr %2227, i64 0
  %2229 = load i8, ptr %2228, align 1
  %2230 = zext i8 %2229 to i32
  %2231 = load i32, ptr %43, align 4
  %2232 = add i32 %2231, %2230
  store i32 %2232, ptr %43, align 4
  br label %2233

2233:                                             ; preds = %2143, %2226
  br label %2234

2234:                                             ; preds = %2233
  br label %2235

2235:                                             ; preds = %2234
  %2236 = load i32, ptr %44, align 4
  %2237 = load i32, ptr %43, align 4
  %2238 = sub i32 %2237, %2236
  store i32 %2238, ptr %43, align 4
  %2239 = load i32, ptr %42, align 4
  %2240 = load i32, ptr %43, align 4
  %2241 = sub i32 %2240, %2239
  store i32 %2241, ptr %43, align 4
  %2242 = load i32, ptr %42, align 4
  %2243 = lshr i32 %2242, 13
  %2244 = load i32, ptr %43, align 4
  %2245 = xor i32 %2244, %2243
  store i32 %2245, ptr %43, align 4
  %2246 = load i32, ptr %42, align 4
  %2247 = load i32, ptr %44, align 4
  %2248 = sub i32 %2247, %2246
  store i32 %2248, ptr %44, align 4
  %2249 = load i32, ptr %43, align 4
  %2250 = load i32, ptr %44, align 4
  %2251 = sub i32 %2250, %2249
  store i32 %2251, ptr %44, align 4
  %2252 = load i32, ptr %43, align 4
  %2253 = shl i32 %2252, 8
  %2254 = load i32, ptr %44, align 4
  %2255 = xor i32 %2254, %2253
  store i32 %2255, ptr %44, align 4
  %2256 = load i32, ptr %43, align 4
  %2257 = load i32, ptr %42, align 4
  %2258 = sub i32 %2257, %2256
  store i32 %2258, ptr %42, align 4
  %2259 = load i32, ptr %44, align 4
  %2260 = load i32, ptr %42, align 4
  %2261 = sub i32 %2260, %2259
  store i32 %2261, ptr %42, align 4
  %2262 = load i32, ptr %44, align 4
  %2263 = lshr i32 %2262, 13
  %2264 = load i32, ptr %42, align 4
  %2265 = xor i32 %2264, %2263
  store i32 %2265, ptr %42, align 4
  %2266 = load i32, ptr %44, align 4
  %2267 = load i32, ptr %43, align 4
  %2268 = sub i32 %2267, %2266
  store i32 %2268, ptr %43, align 4
  %2269 = load i32, ptr %42, align 4
  %2270 = load i32, ptr %43, align 4
  %2271 = sub i32 %2270, %2269
  store i32 %2271, ptr %43, align 4
  %2272 = load i32, ptr %42, align 4
  %2273 = lshr i32 %2272, 12
  %2274 = load i32, ptr %43, align 4
  %2275 = xor i32 %2274, %2273
  store i32 %2275, ptr %43, align 4
  %2276 = load i32, ptr %42, align 4
  %2277 = load i32, ptr %44, align 4
  %2278 = sub i32 %2277, %2276
  store i32 %2278, ptr %44, align 4
  %2279 = load i32, ptr %43, align 4
  %2280 = load i32, ptr %44, align 4
  %2281 = sub i32 %2280, %2279
  store i32 %2281, ptr %44, align 4
  %2282 = load i32, ptr %43, align 4
  %2283 = shl i32 %2282, 16
  %2284 = load i32, ptr %44, align 4
  %2285 = xor i32 %2284, %2283
  store i32 %2285, ptr %44, align 4
  %2286 = load i32, ptr %43, align 4
  %2287 = load i32, ptr %42, align 4
  %2288 = sub i32 %2287, %2286
  store i32 %2288, ptr %42, align 4
  %2289 = load i32, ptr %44, align 4
  %2290 = load i32, ptr %42, align 4
  %2291 = sub i32 %2290, %2289
  store i32 %2291, ptr %42, align 4
  %2292 = load i32, ptr %44, align 4
  %2293 = lshr i32 %2292, 5
  %2294 = load i32, ptr %42, align 4
  %2295 = xor i32 %2294, %2293
  store i32 %2295, ptr %42, align 4
  %2296 = load i32, ptr %44, align 4
  %2297 = load i32, ptr %43, align 4
  %2298 = sub i32 %2297, %2296
  store i32 %2298, ptr %43, align 4
  %2299 = load i32, ptr %42, align 4
  %2300 = load i32, ptr %43, align 4
  %2301 = sub i32 %2300, %2299
  store i32 %2301, ptr %43, align 4
  %2302 = load i32, ptr %42, align 4
  %2303 = lshr i32 %2302, 3
  %2304 = load i32, ptr %43, align 4
  %2305 = xor i32 %2304, %2303
  store i32 %2305, ptr %43, align 4
  %2306 = load i32, ptr %42, align 4
  %2307 = load i32, ptr %44, align 4
  %2308 = sub i32 %2307, %2306
  store i32 %2308, ptr %44, align 4
  %2309 = load i32, ptr %43, align 4
  %2310 = load i32, ptr %44, align 4
  %2311 = sub i32 %2310, %2309
  store i32 %2311, ptr %44, align 4
  %2312 = load i32, ptr %43, align 4
  %2313 = shl i32 %2312, 10
  %2314 = load i32, ptr %44, align 4
  %2315 = xor i32 %2314, %2313
  store i32 %2315, ptr %44, align 4
  %2316 = load i32, ptr %43, align 4
  %2317 = load i32, ptr %42, align 4
  %2318 = sub i32 %2317, %2316
  store i32 %2318, ptr %42, align 4
  %2319 = load i32, ptr %44, align 4
  %2320 = load i32, ptr %42, align 4
  %2321 = sub i32 %2320, %2319
  store i32 %2321, ptr %42, align 4
  %2322 = load i32, ptr %44, align 4
  %2323 = lshr i32 %2322, 15
  %2324 = load i32, ptr %42, align 4
  %2325 = xor i32 %2324, %2323
  store i32 %2325, ptr %42, align 4
  br label %2326

2326:                                             ; preds = %2235
  br label %2327

2327:                                             ; preds = %2326
  br label %2328

2328:                                             ; preds = %2327
  br label %2329

2329:                                             ; preds = %2328
  %2330 = load i32, ptr %42, align 4
  %2331 = load ptr, ptr %35, align 8
  %2332 = getelementptr inbounds nuw %struct.GramHash, ptr %2331, i32 0, i32 2
  %2333 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2332, i32 0, i32 7
  store i32 %2330, ptr %2333, align 4
  %2334 = load ptr, ptr %35, align 8
  %2335 = getelementptr inbounds nuw %struct.GramHash, ptr %2334, i32 0, i32 0
  %2336 = load ptr, ptr %35, align 8
  %2337 = getelementptr inbounds nuw %struct.GramHash, ptr %2336, i32 0, i32 2
  %2338 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2337, i32 0, i32 5
  store ptr %2335, ptr %2338, align 8
  %2339 = load ptr, ptr %35, align 8
  %2340 = getelementptr inbounds nuw %struct.GramHash, ptr %2339, i32 0, i32 2
  %2341 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2340, i32 0, i32 6
  store i32 4, ptr %2341, align 8
  %2342 = load ptr, ptr %31, align 8
  %2343 = icmp ne ptr %2342, null
  br i1 %2343, label %2425, label %2344

2344:                                             ; preds = %2329
  %2345 = load ptr, ptr %35, align 8
  %2346 = getelementptr inbounds nuw %struct.GramHash, ptr %2345, i32 0, i32 2
  %2347 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2346, i32 0, i32 2
  store ptr null, ptr %2347, align 8
  %2348 = load ptr, ptr %35, align 8
  %2349 = getelementptr inbounds nuw %struct.GramHash, ptr %2348, i32 0, i32 2
  %2350 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2349, i32 0, i32 1
  store ptr null, ptr %2350, align 8
  br label %2351

2351:                                             ; preds = %2344
  %2352 = call noalias ptr @malloc(i64 noundef 64)
  %2353 = load ptr, ptr %35, align 8
  %2354 = getelementptr inbounds nuw %struct.GramHash, ptr %2353, i32 0, i32 2
  %2355 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2354, i32 0, i32 0
  store ptr %2352, ptr %2355, align 8
  %2356 = load ptr, ptr %35, align 8
  %2357 = getelementptr inbounds nuw %struct.GramHash, ptr %2356, i32 0, i32 2
  %2358 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2357, i32 0, i32 0
  %2359 = load ptr, ptr %2358, align 8
  %2360 = icmp ne ptr %2359, null
  br i1 %2360, label %2362, label %2361

2361:                                             ; preds = %2351
  call void @exit(i32 noundef -1)
  unreachable

2362:                                             ; preds = %2351
  %2363 = load ptr, ptr %35, align 8
  %2364 = getelementptr inbounds nuw %struct.GramHash, ptr %2363, i32 0, i32 2
  %2365 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2364, i32 0, i32 0
  %2366 = load ptr, ptr %2365, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %2366, i8 0, i64 64, i1 false)
  %2367 = load ptr, ptr %35, align 8
  %2368 = getelementptr inbounds nuw %struct.GramHash, ptr %2367, i32 0, i32 2
  %2369 = load ptr, ptr %35, align 8
  %2370 = getelementptr inbounds nuw %struct.GramHash, ptr %2369, i32 0, i32 2
  %2371 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2370, i32 0, i32 0
  %2372 = load ptr, ptr %2371, align 8
  %2373 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2372, i32 0, i32 4
  store ptr %2368, ptr %2373, align 8
  %2374 = load ptr, ptr %35, align 8
  %2375 = getelementptr inbounds nuw %struct.GramHash, ptr %2374, i32 0, i32 2
  %2376 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2375, i32 0, i32 0
  %2377 = load ptr, ptr %2376, align 8
  %2378 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2377, i32 0, i32 1
  store i32 32, ptr %2378, align 8
  %2379 = load ptr, ptr %35, align 8
  %2380 = getelementptr inbounds nuw %struct.GramHash, ptr %2379, i32 0, i32 2
  %2381 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2380, i32 0, i32 0
  %2382 = load ptr, ptr %2381, align 8
  %2383 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2382, i32 0, i32 2
  store i32 5, ptr %2383, align 4
  %2384 = load ptr, ptr %35, align 8
  %2385 = getelementptr inbounds nuw %struct.GramHash, ptr %2384, i32 0, i32 2
  %2386 = load ptr, ptr %35, align 8
  %2387 = ptrtoint ptr %2385 to i64
  %2388 = ptrtoint ptr %2386 to i64
  %2389 = sub i64 %2387, %2388
  %2390 = load ptr, ptr %35, align 8
  %2391 = getelementptr inbounds nuw %struct.GramHash, ptr %2390, i32 0, i32 2
  %2392 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2391, i32 0, i32 0
  %2393 = load ptr, ptr %2392, align 8
  %2394 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2393, i32 0, i32 5
  store i64 %2389, ptr %2394, align 8
  %2395 = call noalias ptr @malloc(i64 noundef 512)
  %2396 = load ptr, ptr %35, align 8
  %2397 = getelementptr inbounds nuw %struct.GramHash, ptr %2396, i32 0, i32 2
  %2398 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2397, i32 0, i32 0
  %2399 = load ptr, ptr %2398, align 8
  %2400 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2399, i32 0, i32 0
  store ptr %2395, ptr %2400, align 8
  %2401 = load ptr, ptr %35, align 8
  %2402 = getelementptr inbounds nuw %struct.GramHash, ptr %2401, i32 0, i32 2
  %2403 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2402, i32 0, i32 0
  %2404 = load ptr, ptr %2403, align 8
  %2405 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2404, i32 0, i32 10
  store i32 -1609490463, ptr %2405, align 8
  %2406 = load ptr, ptr %35, align 8
  %2407 = getelementptr inbounds nuw %struct.GramHash, ptr %2406, i32 0, i32 2
  %2408 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2407, i32 0, i32 0
  %2409 = load ptr, ptr %2408, align 8
  %2410 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2409, i32 0, i32 0
  %2411 = load ptr, ptr %2410, align 8
  %2412 = icmp ne ptr %2411, null
  br i1 %2412, label %2414, label %2413

2413:                                             ; preds = %2362
  call void @exit(i32 noundef -1)
  unreachable

2414:                                             ; preds = %2362
  %2415 = load ptr, ptr %35, align 8
  %2416 = getelementptr inbounds nuw %struct.GramHash, ptr %2415, i32 0, i32 2
  %2417 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2416, i32 0, i32 0
  %2418 = load ptr, ptr %2417, align 8
  %2419 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2418, i32 0, i32 0
  %2420 = load ptr, ptr %2419, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %2420, i8 0, i64 512, i1 false)
  br label %2421

2421:                                             ; preds = %2414
  br label %2422

2422:                                             ; preds = %2421
  br label %2423

2423:                                             ; preds = %2422
  %2424 = load ptr, ptr %35, align 8
  store ptr %2424, ptr %31, align 8
  br label %2470

2425:                                             ; preds = %2329
  %2426 = load ptr, ptr %31, align 8
  %2427 = getelementptr inbounds nuw %struct.GramHash, ptr %2426, i32 0, i32 2
  %2428 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2427, i32 0, i32 0
  %2429 = load ptr, ptr %2428, align 8
  %2430 = load ptr, ptr %35, align 8
  %2431 = getelementptr inbounds nuw %struct.GramHash, ptr %2430, i32 0, i32 2
  %2432 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2431, i32 0, i32 0
  store ptr %2429, ptr %2432, align 8
  br label %2433

2433:                                             ; preds = %2425
  %2434 = load ptr, ptr %35, align 8
  %2435 = getelementptr inbounds nuw %struct.GramHash, ptr %2434, i32 0, i32 2
  %2436 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2435, i32 0, i32 2
  store ptr null, ptr %2436, align 8
  %2437 = load ptr, ptr %31, align 8
  %2438 = getelementptr inbounds nuw %struct.GramHash, ptr %2437, i32 0, i32 2
  %2439 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2438, i32 0, i32 0
  %2440 = load ptr, ptr %2439, align 8
  %2441 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2440, i32 0, i32 4
  %2442 = load ptr, ptr %2441, align 8
  %2443 = load ptr, ptr %31, align 8
  %2444 = getelementptr inbounds nuw %struct.GramHash, ptr %2443, i32 0, i32 2
  %2445 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2444, i32 0, i32 0
  %2446 = load ptr, ptr %2445, align 8
  %2447 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2446, i32 0, i32 5
  %2448 = load i64, ptr %2447, align 8
  %2449 = sub i64 0, %2448
  %2450 = getelementptr inbounds i8, ptr %2442, i64 %2449
  %2451 = load ptr, ptr %35, align 8
  %2452 = getelementptr inbounds nuw %struct.GramHash, ptr %2451, i32 0, i32 2
  %2453 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2452, i32 0, i32 1
  store ptr %2450, ptr %2453, align 8
  %2454 = load ptr, ptr %35, align 8
  %2455 = load ptr, ptr %31, align 8
  %2456 = getelementptr inbounds nuw %struct.GramHash, ptr %2455, i32 0, i32 2
  %2457 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2456, i32 0, i32 0
  %2458 = load ptr, ptr %2457, align 8
  %2459 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2458, i32 0, i32 4
  %2460 = load ptr, ptr %2459, align 8
  %2461 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2460, i32 0, i32 2
  store ptr %2454, ptr %2461, align 8
  %2462 = load ptr, ptr %35, align 8
  %2463 = getelementptr inbounds nuw %struct.GramHash, ptr %2462, i32 0, i32 2
  %2464 = load ptr, ptr %31, align 8
  %2465 = getelementptr inbounds nuw %struct.GramHash, ptr %2464, i32 0, i32 2
  %2466 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2465, i32 0, i32 0
  %2467 = load ptr, ptr %2466, align 8
  %2468 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2467, i32 0, i32 4
  store ptr %2463, ptr %2468, align 8
  br label %2469

2469:                                             ; preds = %2433
  br label %2470

2470:                                             ; preds = %2469, %2423
  br label %2471

2471:                                             ; preds = %2470
  %2472 = load ptr, ptr %31, align 8
  %2473 = getelementptr inbounds nuw %struct.GramHash, ptr %2472, i32 0, i32 2
  %2474 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2473, i32 0, i32 0
  %2475 = load ptr, ptr %2474, align 8
  %2476 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2475, i32 0, i32 3
  %2477 = load i32, ptr %2476, align 8
  %2478 = add i32 %2477, 1
  store i32 %2478, ptr %2476, align 8
  br label %2479

2479:                                             ; preds = %2471
  %2480 = load i32, ptr %42, align 4
  %2481 = load ptr, ptr %31, align 8
  %2482 = getelementptr inbounds nuw %struct.GramHash, ptr %2481, i32 0, i32 2
  %2483 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2482, i32 0, i32 0
  %2484 = load ptr, ptr %2483, align 8
  %2485 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2484, i32 0, i32 1
  %2486 = load i32, ptr %2485, align 8
  %2487 = sub i32 %2486, 1
  %2488 = and i32 %2480, %2487
  store i32 %2488, ptr %47, align 4
  br label %2489

2489:                                             ; preds = %2479
  br label %2490

2490:                                             ; preds = %2489
  %2491 = load ptr, ptr %31, align 8
  %2492 = getelementptr inbounds nuw %struct.GramHash, ptr %2491, i32 0, i32 2
  %2493 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2492, i32 0, i32 0
  %2494 = load ptr, ptr %2493, align 8
  %2495 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2494, i32 0, i32 0
  %2496 = load ptr, ptr %2495, align 8
  %2497 = load i32, ptr %47, align 4
  %2498 = zext i32 %2497 to i64
  %2499 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2496, i64 %2498
  store ptr %2499, ptr %48, align 8
  %2500 = load ptr, ptr %48, align 8
  %2501 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2500, i32 0, i32 1
  %2502 = load i32, ptr %2501, align 8
  %2503 = add i32 %2502, 1
  store i32 %2503, ptr %2501, align 8
  %2504 = load ptr, ptr %48, align 8
  %2505 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2504, i32 0, i32 0
  %2506 = load ptr, ptr %2505, align 8
  %2507 = load ptr, ptr %35, align 8
  %2508 = getelementptr inbounds nuw %struct.GramHash, ptr %2507, i32 0, i32 2
  %2509 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2508, i32 0, i32 4
  store ptr %2506, ptr %2509, align 8
  %2510 = load ptr, ptr %35, align 8
  %2511 = getelementptr inbounds nuw %struct.GramHash, ptr %2510, i32 0, i32 2
  %2512 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2511, i32 0, i32 3
  store ptr null, ptr %2512, align 8
  %2513 = load ptr, ptr %48, align 8
  %2514 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2513, i32 0, i32 0
  %2515 = load ptr, ptr %2514, align 8
  %2516 = icmp ne ptr %2515, null
  br i1 %2516, label %2517, label %2524

2517:                                             ; preds = %2490
  %2518 = load ptr, ptr %35, align 8
  %2519 = getelementptr inbounds nuw %struct.GramHash, ptr %2518, i32 0, i32 2
  %2520 = load ptr, ptr %48, align 8
  %2521 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2520, i32 0, i32 0
  %2522 = load ptr, ptr %2521, align 8
  %2523 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2522, i32 0, i32 3
  store ptr %2519, ptr %2523, align 8
  br label %2524

2524:                                             ; preds = %2517, %2490
  %2525 = load ptr, ptr %35, align 8
  %2526 = getelementptr inbounds nuw %struct.GramHash, ptr %2525, i32 0, i32 2
  %2527 = load ptr, ptr %48, align 8
  %2528 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2527, i32 0, i32 0
  store ptr %2526, ptr %2528, align 8
  %2529 = load ptr, ptr %48, align 8
  %2530 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2529, i32 0, i32 1
  %2531 = load i32, ptr %2530, align 8
  %2532 = load ptr, ptr %48, align 8
  %2533 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2532, i32 0, i32 2
  %2534 = load i32, ptr %2533, align 4
  %2535 = add i32 %2534, 1
  %2536 = mul i32 %2535, 10
  %2537 = icmp uge i32 %2531, %2536
  br i1 %2537, label %2538, label %2800

2538:                                             ; preds = %2524
  %2539 = load ptr, ptr %35, align 8
  %2540 = getelementptr inbounds nuw %struct.GramHash, ptr %2539, i32 0, i32 2
  %2541 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2540, i32 0, i32 0
  %2542 = load ptr, ptr %2541, align 8
  %2543 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2542, i32 0, i32 9
  %2544 = load i32, ptr %2543, align 4
  %2545 = icmp ne i32 %2544, 0
  br i1 %2545, label %2800, label %2546

2546:                                             ; preds = %2538
  br label %2547

2547:                                             ; preds = %2546
  %2548 = load ptr, ptr %35, align 8
  %2549 = getelementptr inbounds nuw %struct.GramHash, ptr %2548, i32 0, i32 2
  %2550 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2549, i32 0, i32 0
  %2551 = load ptr, ptr %2550, align 8
  %2552 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2551, i32 0, i32 1
  %2553 = load i32, ptr %2552, align 8
  %2554 = zext i32 %2553 to i64
  %2555 = mul i64 16, %2554
  %2556 = mul i64 %2555, 2
  %2557 = call noalias ptr @malloc(i64 noundef %2556)
  store ptr %2557, ptr %53, align 8
  %2558 = load ptr, ptr %53, align 8
  %2559 = icmp ne ptr %2558, null
  br i1 %2559, label %2561, label %2560

2560:                                             ; preds = %2547
  call void @exit(i32 noundef -1)
  unreachable

2561:                                             ; preds = %2547
  %2562 = load ptr, ptr %53, align 8
  %2563 = load ptr, ptr %35, align 8
  %2564 = getelementptr inbounds nuw %struct.GramHash, ptr %2563, i32 0, i32 2
  %2565 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2564, i32 0, i32 0
  %2566 = load ptr, ptr %2565, align 8
  %2567 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2566, i32 0, i32 1
  %2568 = load i32, ptr %2567, align 8
  %2569 = zext i32 %2568 to i64
  %2570 = mul i64 16, %2569
  %2571 = mul i64 %2570, 2
  call void @llvm.memset.p0.i64(ptr align 8 %2562, i8 0, i64 %2571, i1 false)
  %2572 = load ptr, ptr %35, align 8
  %2573 = getelementptr inbounds nuw %struct.GramHash, ptr %2572, i32 0, i32 2
  %2574 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2573, i32 0, i32 0
  %2575 = load ptr, ptr %2574, align 8
  %2576 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2575, i32 0, i32 3
  %2577 = load i32, ptr %2576, align 8
  %2578 = load ptr, ptr %35, align 8
  %2579 = getelementptr inbounds nuw %struct.GramHash, ptr %2578, i32 0, i32 2
  %2580 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2579, i32 0, i32 0
  %2581 = load ptr, ptr %2580, align 8
  %2582 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2581, i32 0, i32 2
  %2583 = load i32, ptr %2582, align 4
  %2584 = add i32 %2583, 1
  %2585 = lshr i32 %2577, %2584
  %2586 = load ptr, ptr %35, align 8
  %2587 = getelementptr inbounds nuw %struct.GramHash, ptr %2586, i32 0, i32 2
  %2588 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2587, i32 0, i32 0
  %2589 = load ptr, ptr %2588, align 8
  %2590 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2589, i32 0, i32 3
  %2591 = load i32, ptr %2590, align 8
  %2592 = load ptr, ptr %35, align 8
  %2593 = getelementptr inbounds nuw %struct.GramHash, ptr %2592, i32 0, i32 2
  %2594 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2593, i32 0, i32 0
  %2595 = load ptr, ptr %2594, align 8
  %2596 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2595, i32 0, i32 1
  %2597 = load i32, ptr %2596, align 8
  %2598 = mul i32 %2597, 2
  %2599 = sub i32 %2598, 1
  %2600 = and i32 %2591, %2599
  %2601 = icmp ne i32 %2600, 0
  %2602 = zext i1 %2601 to i64
  %2603 = select i1 %2601, i32 1, i32 0
  %2604 = add i32 %2585, %2603
  %2605 = load ptr, ptr %35, align 8
  %2606 = getelementptr inbounds nuw %struct.GramHash, ptr %2605, i32 0, i32 2
  %2607 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2606, i32 0, i32 0
  %2608 = load ptr, ptr %2607, align 8
  %2609 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2608, i32 0, i32 6
  store i32 %2604, ptr %2609, align 8
  %2610 = load ptr, ptr %35, align 8
  %2611 = getelementptr inbounds nuw %struct.GramHash, ptr %2610, i32 0, i32 2
  %2612 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2611, i32 0, i32 0
  %2613 = load ptr, ptr %2612, align 8
  %2614 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2613, i32 0, i32 7
  store i32 0, ptr %2614, align 4
  store i32 0, ptr %50, align 4
  br label %2615

2615:                                             ; preds = %2724, %2561
  %2616 = load i32, ptr %50, align 4
  %2617 = load ptr, ptr %35, align 8
  %2618 = getelementptr inbounds nuw %struct.GramHash, ptr %2617, i32 0, i32 2
  %2619 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2618, i32 0, i32 0
  %2620 = load ptr, ptr %2619, align 8
  %2621 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2620, i32 0, i32 1
  %2622 = load i32, ptr %2621, align 8
  %2623 = icmp ult i32 %2616, %2622
  br i1 %2623, label %2624, label %2727

2624:                                             ; preds = %2615
  %2625 = load ptr, ptr %35, align 8
  %2626 = getelementptr inbounds nuw %struct.GramHash, ptr %2625, i32 0, i32 2
  %2627 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2626, i32 0, i32 0
  %2628 = load ptr, ptr %2627, align 8
  %2629 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2628, i32 0, i32 0
  %2630 = load ptr, ptr %2629, align 8
  %2631 = load i32, ptr %50, align 4
  %2632 = zext i32 %2631 to i64
  %2633 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2630, i64 %2632
  %2634 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2633, i32 0, i32 0
  %2635 = load ptr, ptr %2634, align 8
  store ptr %2635, ptr %51, align 8
  br label %2636

2636:                                             ; preds = %2718, %2624
  %2637 = load ptr, ptr %51, align 8
  %2638 = icmp ne ptr %2637, null
  br i1 %2638, label %2639, label %2723

2639:                                             ; preds = %2636
  %2640 = load ptr, ptr %51, align 8
  %2641 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2640, i32 0, i32 4
  %2642 = load ptr, ptr %2641, align 8
  store ptr %2642, ptr %52, align 8
  br label %2643

2643:                                             ; preds = %2639
  %2644 = load ptr, ptr %51, align 8
  %2645 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2644, i32 0, i32 7
  %2646 = load i32, ptr %2645, align 4
  %2647 = load ptr, ptr %35, align 8
  %2648 = getelementptr inbounds nuw %struct.GramHash, ptr %2647, i32 0, i32 2
  %2649 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2648, i32 0, i32 0
  %2650 = load ptr, ptr %2649, align 8
  %2651 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2650, i32 0, i32 1
  %2652 = load i32, ptr %2651, align 8
  %2653 = mul i32 %2652, 2
  %2654 = sub i32 %2653, 1
  %2655 = and i32 %2646, %2654
  store i32 %2655, ptr %49, align 4
  br label %2656

2656:                                             ; preds = %2643
  %2657 = load ptr, ptr %53, align 8
  %2658 = load i32, ptr %49, align 4
  %2659 = zext i32 %2658 to i64
  %2660 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2657, i64 %2659
  store ptr %2660, ptr %54, align 8
  %2661 = load ptr, ptr %54, align 8
  %2662 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2661, i32 0, i32 1
  %2663 = load i32, ptr %2662, align 8
  %2664 = add i32 %2663, 1
  store i32 %2664, ptr %2662, align 8
  %2665 = load ptr, ptr %35, align 8
  %2666 = getelementptr inbounds nuw %struct.GramHash, ptr %2665, i32 0, i32 2
  %2667 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2666, i32 0, i32 0
  %2668 = load ptr, ptr %2667, align 8
  %2669 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2668, i32 0, i32 6
  %2670 = load i32, ptr %2669, align 8
  %2671 = icmp ugt i32 %2664, %2670
  br i1 %2671, label %2672, label %2700

2672:                                             ; preds = %2656
  %2673 = load ptr, ptr %35, align 8
  %2674 = getelementptr inbounds nuw %struct.GramHash, ptr %2673, i32 0, i32 2
  %2675 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2674, i32 0, i32 0
  %2676 = load ptr, ptr %2675, align 8
  %2677 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2676, i32 0, i32 7
  %2678 = load i32, ptr %2677, align 4
  %2679 = add i32 %2678, 1
  store i32 %2679, ptr %2677, align 4
  %2680 = load ptr, ptr %54, align 8
  %2681 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2680, i32 0, i32 1
  %2682 = load i32, ptr %2681, align 8
  %2683 = load ptr, ptr %54, align 8
  %2684 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2683, i32 0, i32 2
  %2685 = load i32, ptr %2684, align 4
  %2686 = load ptr, ptr %35, align 8
  %2687 = getelementptr inbounds nuw %struct.GramHash, ptr %2686, i32 0, i32 2
  %2688 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2687, i32 0, i32 0
  %2689 = load ptr, ptr %2688, align 8
  %2690 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2689, i32 0, i32 6
  %2691 = load i32, ptr %2690, align 8
  %2692 = mul i32 %2685, %2691
  %2693 = icmp ugt i32 %2682, %2692
  br i1 %2693, label %2694, label %2699

2694:                                             ; preds = %2672
  %2695 = load ptr, ptr %54, align 8
  %2696 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2695, i32 0, i32 2
  %2697 = load i32, ptr %2696, align 4
  %2698 = add i32 %2697, 1
  store i32 %2698, ptr %2696, align 4
  br label %2699

2699:                                             ; preds = %2694, %2672
  br label %2700

2700:                                             ; preds = %2699, %2656
  %2701 = load ptr, ptr %51, align 8
  %2702 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2701, i32 0, i32 3
  store ptr null, ptr %2702, align 8
  %2703 = load ptr, ptr %54, align 8
  %2704 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2703, i32 0, i32 0
  %2705 = load ptr, ptr %2704, align 8
  %2706 = load ptr, ptr %51, align 8
  %2707 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2706, i32 0, i32 4
  store ptr %2705, ptr %2707, align 8
  %2708 = load ptr, ptr %54, align 8
  %2709 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2708, i32 0, i32 0
  %2710 = load ptr, ptr %2709, align 8
  %2711 = icmp ne ptr %2710, null
  br i1 %2711, label %2712, label %2718

2712:                                             ; preds = %2700
  %2713 = load ptr, ptr %51, align 8
  %2714 = load ptr, ptr %54, align 8
  %2715 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2714, i32 0, i32 0
  %2716 = load ptr, ptr %2715, align 8
  %2717 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2716, i32 0, i32 3
  store ptr %2713, ptr %2717, align 8
  br label %2718

2718:                                             ; preds = %2712, %2700
  %2719 = load ptr, ptr %51, align 8
  %2720 = load ptr, ptr %54, align 8
  %2721 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2720, i32 0, i32 0
  store ptr %2719, ptr %2721, align 8
  %2722 = load ptr, ptr %52, align 8
  store ptr %2722, ptr %51, align 8
  br label %2636, !llvm.loop !25

2723:                                             ; preds = %2636
  br label %2724

2724:                                             ; preds = %2723
  %2725 = load i32, ptr %50, align 4
  %2726 = add i32 %2725, 1
  store i32 %2726, ptr %50, align 4
  br label %2615, !llvm.loop !26

2727:                                             ; preds = %2615
  %2728 = load ptr, ptr %35, align 8
  %2729 = getelementptr inbounds nuw %struct.GramHash, ptr %2728, i32 0, i32 2
  %2730 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2729, i32 0, i32 0
  %2731 = load ptr, ptr %2730, align 8
  %2732 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2731, i32 0, i32 0
  %2733 = load ptr, ptr %2732, align 8
  call void @free(ptr noundef %2733)
  %2734 = load ptr, ptr %35, align 8
  %2735 = getelementptr inbounds nuw %struct.GramHash, ptr %2734, i32 0, i32 2
  %2736 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2735, i32 0, i32 0
  %2737 = load ptr, ptr %2736, align 8
  %2738 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2737, i32 0, i32 1
  %2739 = load i32, ptr %2738, align 8
  %2740 = mul i32 %2739, 2
  store i32 %2740, ptr %2738, align 8
  %2741 = load ptr, ptr %35, align 8
  %2742 = getelementptr inbounds nuw %struct.GramHash, ptr %2741, i32 0, i32 2
  %2743 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2742, i32 0, i32 0
  %2744 = load ptr, ptr %2743, align 8
  %2745 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2744, i32 0, i32 2
  %2746 = load i32, ptr %2745, align 4
  %2747 = add i32 %2746, 1
  store i32 %2747, ptr %2745, align 4
  %2748 = load ptr, ptr %53, align 8
  %2749 = load ptr, ptr %35, align 8
  %2750 = getelementptr inbounds nuw %struct.GramHash, ptr %2749, i32 0, i32 2
  %2751 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2750, i32 0, i32 0
  %2752 = load ptr, ptr %2751, align 8
  %2753 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2752, i32 0, i32 0
  store ptr %2748, ptr %2753, align 8
  %2754 = load ptr, ptr %35, align 8
  %2755 = getelementptr inbounds nuw %struct.GramHash, ptr %2754, i32 0, i32 2
  %2756 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2755, i32 0, i32 0
  %2757 = load ptr, ptr %2756, align 8
  %2758 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2757, i32 0, i32 7
  %2759 = load i32, ptr %2758, align 4
  %2760 = load ptr, ptr %35, align 8
  %2761 = getelementptr inbounds nuw %struct.GramHash, ptr %2760, i32 0, i32 2
  %2762 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2761, i32 0, i32 0
  %2763 = load ptr, ptr %2762, align 8
  %2764 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2763, i32 0, i32 3
  %2765 = load i32, ptr %2764, align 8
  %2766 = lshr i32 %2765, 1
  %2767 = icmp ugt i32 %2759, %2766
  br i1 %2767, label %2768, label %2776

2768:                                             ; preds = %2727
  %2769 = load ptr, ptr %35, align 8
  %2770 = getelementptr inbounds nuw %struct.GramHash, ptr %2769, i32 0, i32 2
  %2771 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2770, i32 0, i32 0
  %2772 = load ptr, ptr %2771, align 8
  %2773 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2772, i32 0, i32 8
  %2774 = load i32, ptr %2773, align 8
  %2775 = add i32 %2774, 1
  br label %2777

2776:                                             ; preds = %2727
  br label %2777

2777:                                             ; preds = %2776, %2768
  %2778 = phi i32 [ %2775, %2768 ], [ 0, %2776 ]
  %2779 = load ptr, ptr %35, align 8
  %2780 = getelementptr inbounds nuw %struct.GramHash, ptr %2779, i32 0, i32 2
  %2781 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2780, i32 0, i32 0
  %2782 = load ptr, ptr %2781, align 8
  %2783 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2782, i32 0, i32 8
  store i32 %2778, ptr %2783, align 8
  %2784 = load ptr, ptr %35, align 8
  %2785 = getelementptr inbounds nuw %struct.GramHash, ptr %2784, i32 0, i32 2
  %2786 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2785, i32 0, i32 0
  %2787 = load ptr, ptr %2786, align 8
  %2788 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2787, i32 0, i32 8
  %2789 = load i32, ptr %2788, align 8
  %2790 = icmp ugt i32 %2789, 1
  br i1 %2790, label %2791, label %2797

2791:                                             ; preds = %2777
  %2792 = load ptr, ptr %35, align 8
  %2793 = getelementptr inbounds nuw %struct.GramHash, ptr %2792, i32 0, i32 2
  %2794 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2793, i32 0, i32 0
  %2795 = load ptr, ptr %2794, align 8
  %2796 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2795, i32 0, i32 9
  store i32 1, ptr %2796, align 4
  br label %2797

2797:                                             ; preds = %2791, %2777
  br label %2798

2798:                                             ; preds = %2797
  br label %2799

2799:                                             ; preds = %2798
  br label %2800

2800:                                             ; preds = %2799, %2538, %2524
  br label %2801

2801:                                             ; preds = %2800
  br label %2802

2802:                                             ; preds = %2801
  br label %2803

2803:                                             ; preds = %2802
  br label %2804

2804:                                             ; preds = %2803
  br label %2805

2805:                                             ; preds = %2804, %1954
  br label %2806

2806:                                             ; preds = %2805
  store ptr null, ptr %55, align 8
  %2807 = load ptr, ptr %8, align 8
  %2808 = icmp ne ptr %2807, null
  br i1 %2808, label %2809, label %3275

2809:                                             ; preds = %2806
  br label %2810

2810:                                             ; preds = %2809
  br label %2811

2811:                                             ; preds = %2810
  store ptr %34, ptr %60, align 8
  store i32 -17973521, ptr %56, align 4
  store i32 -1640531527, ptr %58, align 4
  store i32 -1640531527, ptr %57, align 4
  store i32 4, ptr %59, align 4
  br label %2812

2812:                                             ; preds = %2979, %2811
  %2813 = load i32, ptr %59, align 4
  %2814 = icmp uge i32 %2813, 12
  br i1 %2814, label %2815, label %2984

2815:                                             ; preds = %2812
  %2816 = load ptr, ptr %60, align 8
  %2817 = getelementptr inbounds i8, ptr %2816, i64 0
  %2818 = load i8, ptr %2817, align 1
  %2819 = zext i8 %2818 to i32
  %2820 = load ptr, ptr %60, align 8
  %2821 = getelementptr inbounds i8, ptr %2820, i64 1
  %2822 = load i8, ptr %2821, align 1
  %2823 = zext i8 %2822 to i32
  %2824 = shl i32 %2823, 8
  %2825 = add i32 %2819, %2824
  %2826 = load ptr, ptr %60, align 8
  %2827 = getelementptr inbounds i8, ptr %2826, i64 2
  %2828 = load i8, ptr %2827, align 1
  %2829 = zext i8 %2828 to i32
  %2830 = shl i32 %2829, 16
  %2831 = add i32 %2825, %2830
  %2832 = load ptr, ptr %60, align 8
  %2833 = getelementptr inbounds i8, ptr %2832, i64 3
  %2834 = load i8, ptr %2833, align 1
  %2835 = zext i8 %2834 to i32
  %2836 = shl i32 %2835, 24
  %2837 = add i32 %2831, %2836
  %2838 = load i32, ptr %57, align 4
  %2839 = add i32 %2838, %2837
  store i32 %2839, ptr %57, align 4
  %2840 = load ptr, ptr %60, align 8
  %2841 = getelementptr inbounds i8, ptr %2840, i64 4
  %2842 = load i8, ptr %2841, align 1
  %2843 = zext i8 %2842 to i32
  %2844 = load ptr, ptr %60, align 8
  %2845 = getelementptr inbounds i8, ptr %2844, i64 5
  %2846 = load i8, ptr %2845, align 1
  %2847 = zext i8 %2846 to i32
  %2848 = shl i32 %2847, 8
  %2849 = add i32 %2843, %2848
  %2850 = load ptr, ptr %60, align 8
  %2851 = getelementptr inbounds i8, ptr %2850, i64 6
  %2852 = load i8, ptr %2851, align 1
  %2853 = zext i8 %2852 to i32
  %2854 = shl i32 %2853, 16
  %2855 = add i32 %2849, %2854
  %2856 = load ptr, ptr %60, align 8
  %2857 = getelementptr inbounds i8, ptr %2856, i64 7
  %2858 = load i8, ptr %2857, align 1
  %2859 = zext i8 %2858 to i32
  %2860 = shl i32 %2859, 24
  %2861 = add i32 %2855, %2860
  %2862 = load i32, ptr %58, align 4
  %2863 = add i32 %2862, %2861
  store i32 %2863, ptr %58, align 4
  %2864 = load ptr, ptr %60, align 8
  %2865 = getelementptr inbounds i8, ptr %2864, i64 8
  %2866 = load i8, ptr %2865, align 1
  %2867 = zext i8 %2866 to i32
  %2868 = load ptr, ptr %60, align 8
  %2869 = getelementptr inbounds i8, ptr %2868, i64 9
  %2870 = load i8, ptr %2869, align 1
  %2871 = zext i8 %2870 to i32
  %2872 = shl i32 %2871, 8
  %2873 = add i32 %2867, %2872
  %2874 = load ptr, ptr %60, align 8
  %2875 = getelementptr inbounds i8, ptr %2874, i64 10
  %2876 = load i8, ptr %2875, align 1
  %2877 = zext i8 %2876 to i32
  %2878 = shl i32 %2877, 16
  %2879 = add i32 %2873, %2878
  %2880 = load ptr, ptr %60, align 8
  %2881 = getelementptr inbounds i8, ptr %2880, i64 11
  %2882 = load i8, ptr %2881, align 1
  %2883 = zext i8 %2882 to i32
  %2884 = shl i32 %2883, 24
  %2885 = add i32 %2879, %2884
  %2886 = load i32, ptr %56, align 4
  %2887 = add i32 %2886, %2885
  store i32 %2887, ptr %56, align 4
  br label %2888

2888:                                             ; preds = %2815
  %2889 = load i32, ptr %58, align 4
  %2890 = load i32, ptr %57, align 4
  %2891 = sub i32 %2890, %2889
  store i32 %2891, ptr %57, align 4
  %2892 = load i32, ptr %56, align 4
  %2893 = load i32, ptr %57, align 4
  %2894 = sub i32 %2893, %2892
  store i32 %2894, ptr %57, align 4
  %2895 = load i32, ptr %56, align 4
  %2896 = lshr i32 %2895, 13
  %2897 = load i32, ptr %57, align 4
  %2898 = xor i32 %2897, %2896
  store i32 %2898, ptr %57, align 4
  %2899 = load i32, ptr %56, align 4
  %2900 = load i32, ptr %58, align 4
  %2901 = sub i32 %2900, %2899
  store i32 %2901, ptr %58, align 4
  %2902 = load i32, ptr %57, align 4
  %2903 = load i32, ptr %58, align 4
  %2904 = sub i32 %2903, %2902
  store i32 %2904, ptr %58, align 4
  %2905 = load i32, ptr %57, align 4
  %2906 = shl i32 %2905, 8
  %2907 = load i32, ptr %58, align 4
  %2908 = xor i32 %2907, %2906
  store i32 %2908, ptr %58, align 4
  %2909 = load i32, ptr %57, align 4
  %2910 = load i32, ptr %56, align 4
  %2911 = sub i32 %2910, %2909
  store i32 %2911, ptr %56, align 4
  %2912 = load i32, ptr %58, align 4
  %2913 = load i32, ptr %56, align 4
  %2914 = sub i32 %2913, %2912
  store i32 %2914, ptr %56, align 4
  %2915 = load i32, ptr %58, align 4
  %2916 = lshr i32 %2915, 13
  %2917 = load i32, ptr %56, align 4
  %2918 = xor i32 %2917, %2916
  store i32 %2918, ptr %56, align 4
  %2919 = load i32, ptr %58, align 4
  %2920 = load i32, ptr %57, align 4
  %2921 = sub i32 %2920, %2919
  store i32 %2921, ptr %57, align 4
  %2922 = load i32, ptr %56, align 4
  %2923 = load i32, ptr %57, align 4
  %2924 = sub i32 %2923, %2922
  store i32 %2924, ptr %57, align 4
  %2925 = load i32, ptr %56, align 4
  %2926 = lshr i32 %2925, 12
  %2927 = load i32, ptr %57, align 4
  %2928 = xor i32 %2927, %2926
  store i32 %2928, ptr %57, align 4
  %2929 = load i32, ptr %56, align 4
  %2930 = load i32, ptr %58, align 4
  %2931 = sub i32 %2930, %2929
  store i32 %2931, ptr %58, align 4
  %2932 = load i32, ptr %57, align 4
  %2933 = load i32, ptr %58, align 4
  %2934 = sub i32 %2933, %2932
  store i32 %2934, ptr %58, align 4
  %2935 = load i32, ptr %57, align 4
  %2936 = shl i32 %2935, 16
  %2937 = load i32, ptr %58, align 4
  %2938 = xor i32 %2937, %2936
  store i32 %2938, ptr %58, align 4
  %2939 = load i32, ptr %57, align 4
  %2940 = load i32, ptr %56, align 4
  %2941 = sub i32 %2940, %2939
  store i32 %2941, ptr %56, align 4
  %2942 = load i32, ptr %58, align 4
  %2943 = load i32, ptr %56, align 4
  %2944 = sub i32 %2943, %2942
  store i32 %2944, ptr %56, align 4
  %2945 = load i32, ptr %58, align 4
  %2946 = lshr i32 %2945, 5
  %2947 = load i32, ptr %56, align 4
  %2948 = xor i32 %2947, %2946
  store i32 %2948, ptr %56, align 4
  %2949 = load i32, ptr %58, align 4
  %2950 = load i32, ptr %57, align 4
  %2951 = sub i32 %2950, %2949
  store i32 %2951, ptr %57, align 4
  %2952 = load i32, ptr %56, align 4
  %2953 = load i32, ptr %57, align 4
  %2954 = sub i32 %2953, %2952
  store i32 %2954, ptr %57, align 4
  %2955 = load i32, ptr %56, align 4
  %2956 = lshr i32 %2955, 3
  %2957 = load i32, ptr %57, align 4
  %2958 = xor i32 %2957, %2956
  store i32 %2958, ptr %57, align 4
  %2959 = load i32, ptr %56, align 4
  %2960 = load i32, ptr %58, align 4
  %2961 = sub i32 %2960, %2959
  store i32 %2961, ptr %58, align 4
  %2962 = load i32, ptr %57, align 4
  %2963 = load i32, ptr %58, align 4
  %2964 = sub i32 %2963, %2962
  store i32 %2964, ptr %58, align 4
  %2965 = load i32, ptr %57, align 4
  %2966 = shl i32 %2965, 10
  %2967 = load i32, ptr %58, align 4
  %2968 = xor i32 %2967, %2966
  store i32 %2968, ptr %58, align 4
  %2969 = load i32, ptr %57, align 4
  %2970 = load i32, ptr %56, align 4
  %2971 = sub i32 %2970, %2969
  store i32 %2971, ptr %56, align 4
  %2972 = load i32, ptr %58, align 4
  %2973 = load i32, ptr %56, align 4
  %2974 = sub i32 %2973, %2972
  store i32 %2974, ptr %56, align 4
  %2975 = load i32, ptr %58, align 4
  %2976 = lshr i32 %2975, 15
  %2977 = load i32, ptr %56, align 4
  %2978 = xor i32 %2977, %2976
  store i32 %2978, ptr %56, align 4
  br label %2979

2979:                                             ; preds = %2888
  %2980 = load ptr, ptr %60, align 8
  %2981 = getelementptr inbounds i8, ptr %2980, i64 12
  store ptr %2981, ptr %60, align 8
  %2982 = load i32, ptr %59, align 4
  %2983 = sub i32 %2982, 12
  store i32 %2983, ptr %59, align 4
  br label %2812, !llvm.loop !27

2984:                                             ; preds = %2812
  %2985 = load i32, ptr %56, align 4
  %2986 = add i32 %2985, 4
  store i32 %2986, ptr %56, align 4
  %2987 = load i32, ptr %59, align 4
  switch i32 %2987, label %3074 [
    i32 11, label %2988
    i32 10, label %2996
    i32 9, label %3004
    i32 8, label %3012
    i32 7, label %3020
    i32 6, label %3028
    i32 5, label %3036
    i32 4, label %3043
    i32 3, label %3051
    i32 2, label %3059
    i32 1, label %3067
  ]

2988:                                             ; preds = %2984
  %2989 = load ptr, ptr %60, align 8
  %2990 = getelementptr inbounds i8, ptr %2989, i64 10
  %2991 = load i8, ptr %2990, align 1
  %2992 = zext i8 %2991 to i32
  %2993 = shl i32 %2992, 24
  %2994 = load i32, ptr %56, align 4
  %2995 = add i32 %2994, %2993
  store i32 %2995, ptr %56, align 4
  br label %2996

2996:                                             ; preds = %2984, %2988
  %2997 = load ptr, ptr %60, align 8
  %2998 = getelementptr inbounds i8, ptr %2997, i64 9
  %2999 = load i8, ptr %2998, align 1
  %3000 = zext i8 %2999 to i32
  %3001 = shl i32 %3000, 16
  %3002 = load i32, ptr %56, align 4
  %3003 = add i32 %3002, %3001
  store i32 %3003, ptr %56, align 4
  br label %3004

3004:                                             ; preds = %2984, %2996
  %3005 = load ptr, ptr %60, align 8
  %3006 = getelementptr inbounds i8, ptr %3005, i64 8
  %3007 = load i8, ptr %3006, align 1
  %3008 = zext i8 %3007 to i32
  %3009 = shl i32 %3008, 8
  %3010 = load i32, ptr %56, align 4
  %3011 = add i32 %3010, %3009
  store i32 %3011, ptr %56, align 4
  br label %3012

3012:                                             ; preds = %2984, %3004
  %3013 = load ptr, ptr %60, align 8
  %3014 = getelementptr inbounds i8, ptr %3013, i64 7
  %3015 = load i8, ptr %3014, align 1
  %3016 = zext i8 %3015 to i32
  %3017 = shl i32 %3016, 24
  %3018 = load i32, ptr %58, align 4
  %3019 = add i32 %3018, %3017
  store i32 %3019, ptr %58, align 4
  br label %3020

3020:                                             ; preds = %2984, %3012
  %3021 = load ptr, ptr %60, align 8
  %3022 = getelementptr inbounds i8, ptr %3021, i64 6
  %3023 = load i8, ptr %3022, align 1
  %3024 = zext i8 %3023 to i32
  %3025 = shl i32 %3024, 16
  %3026 = load i32, ptr %58, align 4
  %3027 = add i32 %3026, %3025
  store i32 %3027, ptr %58, align 4
  br label %3028

3028:                                             ; preds = %2984, %3020
  %3029 = load ptr, ptr %60, align 8
  %3030 = getelementptr inbounds i8, ptr %3029, i64 5
  %3031 = load i8, ptr %3030, align 1
  %3032 = zext i8 %3031 to i32
  %3033 = shl i32 %3032, 8
  %3034 = load i32, ptr %58, align 4
  %3035 = add i32 %3034, %3033
  store i32 %3035, ptr %58, align 4
  br label %3036

3036:                                             ; preds = %2984, %3028
  %3037 = load ptr, ptr %60, align 8
  %3038 = getelementptr inbounds i8, ptr %3037, i64 4
  %3039 = load i8, ptr %3038, align 1
  %3040 = zext i8 %3039 to i32
  %3041 = load i32, ptr %58, align 4
  %3042 = add i32 %3041, %3040
  store i32 %3042, ptr %58, align 4
  br label %3043

3043:                                             ; preds = %2984, %3036
  %3044 = load ptr, ptr %60, align 8
  %3045 = getelementptr inbounds i8, ptr %3044, i64 3
  %3046 = load i8, ptr %3045, align 1
  %3047 = zext i8 %3046 to i32
  %3048 = shl i32 %3047, 24
  %3049 = load i32, ptr %57, align 4
  %3050 = add i32 %3049, %3048
  store i32 %3050, ptr %57, align 4
  br label %3051

3051:                                             ; preds = %2984, %3043
  %3052 = load ptr, ptr %60, align 8
  %3053 = getelementptr inbounds i8, ptr %3052, i64 2
  %3054 = load i8, ptr %3053, align 1
  %3055 = zext i8 %3054 to i32
  %3056 = shl i32 %3055, 16
  %3057 = load i32, ptr %57, align 4
  %3058 = add i32 %3057, %3056
  store i32 %3058, ptr %57, align 4
  br label %3059

3059:                                             ; preds = %2984, %3051
  %3060 = load ptr, ptr %60, align 8
  %3061 = getelementptr inbounds i8, ptr %3060, i64 1
  %3062 = load i8, ptr %3061, align 1
  %3063 = zext i8 %3062 to i32
  %3064 = shl i32 %3063, 8
  %3065 = load i32, ptr %57, align 4
  %3066 = add i32 %3065, %3064
  store i32 %3066, ptr %57, align 4
  br label %3067

3067:                                             ; preds = %2984, %3059
  %3068 = load ptr, ptr %60, align 8
  %3069 = getelementptr inbounds i8, ptr %3068, i64 0
  %3070 = load i8, ptr %3069, align 1
  %3071 = zext i8 %3070 to i32
  %3072 = load i32, ptr %57, align 4
  %3073 = add i32 %3072, %3071
  store i32 %3073, ptr %57, align 4
  br label %3074

3074:                                             ; preds = %2984, %3067
  br label %3075

3075:                                             ; preds = %3074
  br label %3076

3076:                                             ; preds = %3075
  %3077 = load i32, ptr %58, align 4
  %3078 = load i32, ptr %57, align 4
  %3079 = sub i32 %3078, %3077
  store i32 %3079, ptr %57, align 4
  %3080 = load i32, ptr %56, align 4
  %3081 = load i32, ptr %57, align 4
  %3082 = sub i32 %3081, %3080
  store i32 %3082, ptr %57, align 4
  %3083 = load i32, ptr %56, align 4
  %3084 = lshr i32 %3083, 13
  %3085 = load i32, ptr %57, align 4
  %3086 = xor i32 %3085, %3084
  store i32 %3086, ptr %57, align 4
  %3087 = load i32, ptr %56, align 4
  %3088 = load i32, ptr %58, align 4
  %3089 = sub i32 %3088, %3087
  store i32 %3089, ptr %58, align 4
  %3090 = load i32, ptr %57, align 4
  %3091 = load i32, ptr %58, align 4
  %3092 = sub i32 %3091, %3090
  store i32 %3092, ptr %58, align 4
  %3093 = load i32, ptr %57, align 4
  %3094 = shl i32 %3093, 8
  %3095 = load i32, ptr %58, align 4
  %3096 = xor i32 %3095, %3094
  store i32 %3096, ptr %58, align 4
  %3097 = load i32, ptr %57, align 4
  %3098 = load i32, ptr %56, align 4
  %3099 = sub i32 %3098, %3097
  store i32 %3099, ptr %56, align 4
  %3100 = load i32, ptr %58, align 4
  %3101 = load i32, ptr %56, align 4
  %3102 = sub i32 %3101, %3100
  store i32 %3102, ptr %56, align 4
  %3103 = load i32, ptr %58, align 4
  %3104 = lshr i32 %3103, 13
  %3105 = load i32, ptr %56, align 4
  %3106 = xor i32 %3105, %3104
  store i32 %3106, ptr %56, align 4
  %3107 = load i32, ptr %58, align 4
  %3108 = load i32, ptr %57, align 4
  %3109 = sub i32 %3108, %3107
  store i32 %3109, ptr %57, align 4
  %3110 = load i32, ptr %56, align 4
  %3111 = load i32, ptr %57, align 4
  %3112 = sub i32 %3111, %3110
  store i32 %3112, ptr %57, align 4
  %3113 = load i32, ptr %56, align 4
  %3114 = lshr i32 %3113, 12
  %3115 = load i32, ptr %57, align 4
  %3116 = xor i32 %3115, %3114
  store i32 %3116, ptr %57, align 4
  %3117 = load i32, ptr %56, align 4
  %3118 = load i32, ptr %58, align 4
  %3119 = sub i32 %3118, %3117
  store i32 %3119, ptr %58, align 4
  %3120 = load i32, ptr %57, align 4
  %3121 = load i32, ptr %58, align 4
  %3122 = sub i32 %3121, %3120
  store i32 %3122, ptr %58, align 4
  %3123 = load i32, ptr %57, align 4
  %3124 = shl i32 %3123, 16
  %3125 = load i32, ptr %58, align 4
  %3126 = xor i32 %3125, %3124
  store i32 %3126, ptr %58, align 4
  %3127 = load i32, ptr %57, align 4
  %3128 = load i32, ptr %56, align 4
  %3129 = sub i32 %3128, %3127
  store i32 %3129, ptr %56, align 4
  %3130 = load i32, ptr %58, align 4
  %3131 = load i32, ptr %56, align 4
  %3132 = sub i32 %3131, %3130
  store i32 %3132, ptr %56, align 4
  %3133 = load i32, ptr %58, align 4
  %3134 = lshr i32 %3133, 5
  %3135 = load i32, ptr %56, align 4
  %3136 = xor i32 %3135, %3134
  store i32 %3136, ptr %56, align 4
  %3137 = load i32, ptr %58, align 4
  %3138 = load i32, ptr %57, align 4
  %3139 = sub i32 %3138, %3137
  store i32 %3139, ptr %57, align 4
  %3140 = load i32, ptr %56, align 4
  %3141 = load i32, ptr %57, align 4
  %3142 = sub i32 %3141, %3140
  store i32 %3142, ptr %57, align 4
  %3143 = load i32, ptr %56, align 4
  %3144 = lshr i32 %3143, 3
  %3145 = load i32, ptr %57, align 4
  %3146 = xor i32 %3145, %3144
  store i32 %3146, ptr %57, align 4
  %3147 = load i32, ptr %56, align 4
  %3148 = load i32, ptr %58, align 4
  %3149 = sub i32 %3148, %3147
  store i32 %3149, ptr %58, align 4
  %3150 = load i32, ptr %57, align 4
  %3151 = load i32, ptr %58, align 4
  %3152 = sub i32 %3151, %3150
  store i32 %3152, ptr %58, align 4
  %3153 = load i32, ptr %57, align 4
  %3154 = shl i32 %3153, 10
  %3155 = load i32, ptr %58, align 4
  %3156 = xor i32 %3155, %3154
  store i32 %3156, ptr %58, align 4
  %3157 = load i32, ptr %57, align 4
  %3158 = load i32, ptr %56, align 4
  %3159 = sub i32 %3158, %3157
  store i32 %3159, ptr %56, align 4
  %3160 = load i32, ptr %58, align 4
  %3161 = load i32, ptr %56, align 4
  %3162 = sub i32 %3161, %3160
  store i32 %3162, ptr %56, align 4
  %3163 = load i32, ptr %58, align 4
  %3164 = lshr i32 %3163, 15
  %3165 = load i32, ptr %56, align 4
  %3166 = xor i32 %3165, %3164
  store i32 %3166, ptr %56, align 4
  br label %3167

3167:                                             ; preds = %3076
  br label %3168

3168:                                             ; preds = %3167
  br label %3169

3169:                                             ; preds = %3168
  br label %3170

3170:                                             ; preds = %3169
  store ptr null, ptr %55, align 8
  %3171 = load ptr, ptr %8, align 8
  %3172 = icmp ne ptr %3171, null
  br i1 %3172, label %3173, label %3273

3173:                                             ; preds = %3170
  br label %3174

3174:                                             ; preds = %3173
  %3175 = load i32, ptr %56, align 4
  %3176 = load ptr, ptr %8, align 8
  %3177 = getelementptr inbounds nuw %struct.GramHash, ptr %3176, i32 0, i32 2
  %3178 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3177, i32 0, i32 0
  %3179 = load ptr, ptr %3178, align 8
  %3180 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3179, i32 0, i32 1
  %3181 = load i32, ptr %3180, align 8
  %3182 = sub i32 %3181, 1
  %3183 = and i32 %3175, %3182
  store i32 %3183, ptr %61, align 4
  br label %3184

3184:                                             ; preds = %3174
  br label %3185

3185:                                             ; preds = %3184
  %3186 = load ptr, ptr %8, align 8
  %3187 = getelementptr inbounds nuw %struct.GramHash, ptr %3186, i32 0, i32 2
  %3188 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3187, i32 0, i32 0
  %3189 = load ptr, ptr %3188, align 8
  %3190 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3189, i32 0, i32 0
  %3191 = load ptr, ptr %3190, align 8
  %3192 = load i32, ptr %61, align 4
  %3193 = zext i32 %3192 to i64
  %3194 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3191, i64 %3193
  %3195 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3194, i32 0, i32 0
  %3196 = load ptr, ptr %3195, align 8
  %3197 = icmp ne ptr %3196, null
  br i1 %3197, label %3198, label %3220

3198:                                             ; preds = %3185
  br label %3199

3199:                                             ; preds = %3198
  %3200 = load ptr, ptr %8, align 8
  %3201 = getelementptr inbounds nuw %struct.GramHash, ptr %3200, i32 0, i32 2
  %3202 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3201, i32 0, i32 0
  %3203 = load ptr, ptr %3202, align 8
  %3204 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3203, i32 0, i32 0
  %3205 = load ptr, ptr %3204, align 8
  %3206 = load i32, ptr %61, align 4
  %3207 = zext i32 %3206 to i64
  %3208 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3205, i64 %3207
  %3209 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3208, i32 0, i32 0
  %3210 = load ptr, ptr %3209, align 8
  %3211 = load ptr, ptr %8, align 8
  %3212 = getelementptr inbounds nuw %struct.GramHash, ptr %3211, i32 0, i32 2
  %3213 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3212, i32 0, i32 0
  %3214 = load ptr, ptr %3213, align 8
  %3215 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3214, i32 0, i32 5
  %3216 = load i64, ptr %3215, align 8
  %3217 = sub i64 0, %3216
  %3218 = getelementptr inbounds i8, ptr %3210, i64 %3217
  store ptr %3218, ptr %55, align 8
  br label %3219

3219:                                             ; preds = %3199
  br label %3221

3220:                                             ; preds = %3185
  store ptr null, ptr %55, align 8
  br label %3221

3221:                                             ; preds = %3220, %3219
  br label %3222

3222:                                             ; preds = %3270, %3221
  %3223 = load ptr, ptr %55, align 8
  %3224 = icmp ne ptr %3223, null
  br i1 %3224, label %3225, label %3271

3225:                                             ; preds = %3222
  %3226 = load ptr, ptr %55, align 8
  %3227 = getelementptr inbounds nuw %struct.GramHash, ptr %3226, i32 0, i32 2
  %3228 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3227, i32 0, i32 7
  %3229 = load i32, ptr %3228, align 4
  %3230 = load i32, ptr %56, align 4
  %3231 = icmp eq i32 %3229, %3230
  br i1 %3231, label %3232, label %3248

3232:                                             ; preds = %3225
  %3233 = load ptr, ptr %55, align 8
  %3234 = getelementptr inbounds nuw %struct.GramHash, ptr %3233, i32 0, i32 2
  %3235 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3234, i32 0, i32 6
  %3236 = load i32, ptr %3235, align 8
  %3237 = zext i32 %3236 to i64
  %3238 = icmp eq i64 %3237, 4
  br i1 %3238, label %3239, label %3248

3239:                                             ; preds = %3232
  %3240 = load ptr, ptr %55, align 8
  %3241 = getelementptr inbounds nuw %struct.GramHash, ptr %3240, i32 0, i32 2
  %3242 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3241, i32 0, i32 5
  %3243 = load ptr, ptr %3242, align 8
  %3244 = call i32 @memcmp(ptr noundef %3243, ptr noundef %34, i64 noundef 4)
  %3245 = icmp eq i32 %3244, 0
  br i1 %3245, label %3246, label %3247

3246:                                             ; preds = %3239
  br label %3271

3247:                                             ; preds = %3239
  br label %3248

3248:                                             ; preds = %3247, %3232, %3225
  %3249 = load ptr, ptr %55, align 8
  %3250 = getelementptr inbounds nuw %struct.GramHash, ptr %3249, i32 0, i32 2
  %3251 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3250, i32 0, i32 4
  %3252 = load ptr, ptr %3251, align 8
  %3253 = icmp ne ptr %3252, null
  br i1 %3253, label %3254, label %3269

3254:                                             ; preds = %3248
  br label %3255

3255:                                             ; preds = %3254
  %3256 = load ptr, ptr %55, align 8
  %3257 = getelementptr inbounds nuw %struct.GramHash, ptr %3256, i32 0, i32 2
  %3258 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3257, i32 0, i32 4
  %3259 = load ptr, ptr %3258, align 8
  %3260 = load ptr, ptr %8, align 8
  %3261 = getelementptr inbounds nuw %struct.GramHash, ptr %3260, i32 0, i32 2
  %3262 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3261, i32 0, i32 0
  %3263 = load ptr, ptr %3262, align 8
  %3264 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3263, i32 0, i32 5
  %3265 = load i64, ptr %3264, align 8
  %3266 = sub i64 0, %3265
  %3267 = getelementptr inbounds i8, ptr %3259, i64 %3266
  store ptr %3267, ptr %55, align 8
  br label %3268

3268:                                             ; preds = %3255
  br label %3270

3269:                                             ; preds = %3248
  store ptr null, ptr %55, align 8
  br label %3270

3270:                                             ; preds = %3269, %3268
  br label %3222, !llvm.loop !28

3271:                                             ; preds = %3246, %3222
  br label %3272

3272:                                             ; preds = %3271
  br label %3273

3273:                                             ; preds = %3272, %3170
  br label %3274

3274:                                             ; preds = %3273
  br label %3275

3275:                                             ; preds = %3274, %2806
  br label %3276

3276:                                             ; preds = %3275
  %3277 = load ptr, ptr %55, align 8
  %3278 = icmp ne ptr %3277, null
  br i1 %3278, label %3279, label %3290

3279:                                             ; preds = %3276
  %3280 = load ptr, ptr %35, align 8
  %3281 = getelementptr inbounds nuw %struct.GramHash, ptr %3280, i32 0, i32 1
  %3282 = load i32, ptr %3281, align 4
  %3283 = load ptr, ptr %55, align 8
  %3284 = getelementptr inbounds nuw %struct.GramHash, ptr %3283, i32 0, i32 1
  %3285 = load i32, ptr %3284, align 4
  %3286 = icmp sle i32 %3282, %3285
  br i1 %3286, label %3287, label %3290

3287:                                             ; preds = %3279
  %3288 = load i32, ptr %32, align 4
  %3289 = add nsw i32 %3288, 1
  store i32 %3289, ptr %32, align 4
  br label %3290

3290:                                             ; preds = %3287, %3279, %3276
  br label %3291

3291:                                             ; preds = %3290
  %3292 = load i64, ptr %33, align 8
  %3293 = add i64 %3292, 1
  store i64 %3293, ptr %33, align 8
  br label %1446, !llvm.loop !29

3294:                                             ; preds = %1446
  %3295 = load ptr, ptr %8, align 8
  %3296 = icmp ne ptr %3295, null
  br i1 %3296, label %3297, label %3304

3297:                                             ; preds = %3294
  %3298 = load ptr, ptr %8, align 8
  %3299 = getelementptr inbounds nuw %struct.GramHash, ptr %3298, i32 0, i32 2
  %3300 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3299, i32 0, i32 0
  %3301 = load ptr, ptr %3300, align 8
  %3302 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3301, i32 0, i32 3
  %3303 = load i32, ptr %3302, align 8
  br label %3305

3304:                                             ; preds = %3294
  br label %3305

3305:                                             ; preds = %3304, %3297
  %3306 = phi i32 [ %3303, %3297 ], [ 0, %3304 ]
  %3307 = load ptr, ptr %31, align 8
  %3308 = icmp ne ptr %3307, null
  br i1 %3308, label %3309, label %3316

3309:                                             ; preds = %3305
  %3310 = load ptr, ptr %31, align 8
  %3311 = getelementptr inbounds nuw %struct.GramHash, ptr %3310, i32 0, i32 2
  %3312 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3311, i32 0, i32 0
  %3313 = load ptr, ptr %3312, align 8
  %3314 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3313, i32 0, i32 3
  %3315 = load i32, ptr %3314, align 8
  br label %3317

3316:                                             ; preds = %3305
  br label %3317

3317:                                             ; preds = %3316, %3309
  %3318 = phi i32 [ %3315, %3309 ], [ 0, %3316 ]
  %3319 = add i32 %3306, %3318
  store i32 %3319, ptr %62, align 4
  %3320 = load ptr, ptr %8, align 8
  store ptr %3320, ptr %63, align 8
  %3321 = load ptr, ptr %8, align 8
  %3322 = icmp ne ptr %3321, null
  br i1 %3322, label %3323, label %3328

3323:                                             ; preds = %3317
  %3324 = load ptr, ptr %8, align 8
  %3325 = getelementptr inbounds nuw %struct.GramHash, ptr %3324, i32 0, i32 2
  %3326 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3325, i32 0, i32 2
  %3327 = load ptr, ptr %3326, align 8
  br label %3329

3328:                                             ; preds = %3317
  br label %3329

3329:                                             ; preds = %3328, %3323
  %3330 = phi ptr [ %3327, %3323 ], [ null, %3328 ]
  store ptr %3330, ptr %64, align 8
  br label %3331

3331:                                             ; preds = %3516, %3329
  %3332 = load ptr, ptr %63, align 8
  %3333 = icmp ne ptr %3332, null
  br i1 %3333, label %3334, label %3518

3334:                                             ; preds = %3331
  br label %3335

3335:                                             ; preds = %3334
  %3336 = load ptr, ptr %63, align 8
  %3337 = getelementptr inbounds nuw %struct.GramHash, ptr %3336, i32 0, i32 2
  store ptr %3337, ptr %65, align 8
  %3338 = load ptr, ptr %65, align 8
  %3339 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3338, i32 0, i32 1
  %3340 = load ptr, ptr %3339, align 8
  %3341 = icmp eq ptr %3340, null
  br i1 %3341, label %3342, label %3358

3342:                                             ; preds = %3335
  %3343 = load ptr, ptr %65, align 8
  %3344 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3343, i32 0, i32 2
  %3345 = load ptr, ptr %3344, align 8
  %3346 = icmp eq ptr %3345, null
  br i1 %3346, label %3347, label %3358

3347:                                             ; preds = %3342
  %3348 = load ptr, ptr %8, align 8
  %3349 = getelementptr inbounds nuw %struct.GramHash, ptr %3348, i32 0, i32 2
  %3350 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3349, i32 0, i32 0
  %3351 = load ptr, ptr %3350, align 8
  %3352 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3351, i32 0, i32 0
  %3353 = load ptr, ptr %3352, align 8
  call void @free(ptr noundef %3353)
  %3354 = load ptr, ptr %8, align 8
  %3355 = getelementptr inbounds nuw %struct.GramHash, ptr %3354, i32 0, i32 2
  %3356 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3355, i32 0, i32 0
  %3357 = load ptr, ptr %3356, align 8
  call void @free(ptr noundef %3357)
  store ptr null, ptr %8, align 8
  br label %3503

3358:                                             ; preds = %3342, %3335
  %3359 = load ptr, ptr %65, align 8
  %3360 = load ptr, ptr %8, align 8
  %3361 = getelementptr inbounds nuw %struct.GramHash, ptr %3360, i32 0, i32 2
  %3362 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3361, i32 0, i32 0
  %3363 = load ptr, ptr %3362, align 8
  %3364 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3363, i32 0, i32 4
  %3365 = load ptr, ptr %3364, align 8
  %3366 = icmp eq ptr %3359, %3365
  br i1 %3366, label %3367, label %3383

3367:                                             ; preds = %3358
  %3368 = load ptr, ptr %65, align 8
  %3369 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3368, i32 0, i32 1
  %3370 = load ptr, ptr %3369, align 8
  %3371 = load ptr, ptr %8, align 8
  %3372 = getelementptr inbounds nuw %struct.GramHash, ptr %3371, i32 0, i32 2
  %3373 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3372, i32 0, i32 0
  %3374 = load ptr, ptr %3373, align 8
  %3375 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3374, i32 0, i32 5
  %3376 = load i64, ptr %3375, align 8
  %3377 = getelementptr inbounds i8, ptr %3370, i64 %3376
  %3378 = load ptr, ptr %8, align 8
  %3379 = getelementptr inbounds nuw %struct.GramHash, ptr %3378, i32 0, i32 2
  %3380 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3379, i32 0, i32 0
  %3381 = load ptr, ptr %3380, align 8
  %3382 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3381, i32 0, i32 4
  store ptr %3377, ptr %3382, align 8
  br label %3383

3383:                                             ; preds = %3367, %3358
  %3384 = load ptr, ptr %65, align 8
  %3385 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3384, i32 0, i32 1
  %3386 = load ptr, ptr %3385, align 8
  %3387 = icmp ne ptr %3386, null
  br i1 %3387, label %3388, label %3403

3388:                                             ; preds = %3383
  %3389 = load ptr, ptr %65, align 8
  %3390 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3389, i32 0, i32 2
  %3391 = load ptr, ptr %3390, align 8
  %3392 = load ptr, ptr %65, align 8
  %3393 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3392, i32 0, i32 1
  %3394 = load ptr, ptr %3393, align 8
  %3395 = load ptr, ptr %8, align 8
  %3396 = getelementptr inbounds nuw %struct.GramHash, ptr %3395, i32 0, i32 2
  %3397 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3396, i32 0, i32 0
  %3398 = load ptr, ptr %3397, align 8
  %3399 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3398, i32 0, i32 5
  %3400 = load i64, ptr %3399, align 8
  %3401 = getelementptr inbounds i8, ptr %3394, i64 %3400
  %3402 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3401, i32 0, i32 2
  store ptr %3391, ptr %3402, align 8
  br label %3409

3403:                                             ; preds = %3383
  br label %3404

3404:                                             ; preds = %3403
  %3405 = load ptr, ptr %65, align 8
  %3406 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3405, i32 0, i32 2
  %3407 = load ptr, ptr %3406, align 8
  store ptr %3407, ptr %8, align 8
  br label %3408

3408:                                             ; preds = %3404
  br label %3409

3409:                                             ; preds = %3408, %3388
  %3410 = load ptr, ptr %65, align 8
  %3411 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3410, i32 0, i32 2
  %3412 = load ptr, ptr %3411, align 8
  %3413 = icmp ne ptr %3412, null
  br i1 %3413, label %3414, label %3429

3414:                                             ; preds = %3409
  %3415 = load ptr, ptr %65, align 8
  %3416 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3415, i32 0, i32 1
  %3417 = load ptr, ptr %3416, align 8
  %3418 = load ptr, ptr %65, align 8
  %3419 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3418, i32 0, i32 2
  %3420 = load ptr, ptr %3419, align 8
  %3421 = load ptr, ptr %8, align 8
  %3422 = getelementptr inbounds nuw %struct.GramHash, ptr %3421, i32 0, i32 2
  %3423 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3422, i32 0, i32 0
  %3424 = load ptr, ptr %3423, align 8
  %3425 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3424, i32 0, i32 5
  %3426 = load i64, ptr %3425, align 8
  %3427 = getelementptr inbounds i8, ptr %3420, i64 %3426
  %3428 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3427, i32 0, i32 1
  store ptr %3417, ptr %3428, align 8
  br label %3429

3429:                                             ; preds = %3414, %3409
  br label %3430

3430:                                             ; preds = %3429
  %3431 = load ptr, ptr %65, align 8
  %3432 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3431, i32 0, i32 7
  %3433 = load i32, ptr %3432, align 4
  %3434 = load ptr, ptr %8, align 8
  %3435 = getelementptr inbounds nuw %struct.GramHash, ptr %3434, i32 0, i32 2
  %3436 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3435, i32 0, i32 0
  %3437 = load ptr, ptr %3436, align 8
  %3438 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3437, i32 0, i32 1
  %3439 = load i32, ptr %3438, align 8
  %3440 = sub i32 %3439, 1
  %3441 = and i32 %3433, %3440
  store i32 %3441, ptr %66, align 4
  br label %3442

3442:                                             ; preds = %3430
  br label %3443

3443:                                             ; preds = %3442
  %3444 = load ptr, ptr %8, align 8
  %3445 = getelementptr inbounds nuw %struct.GramHash, ptr %3444, i32 0, i32 2
  %3446 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3445, i32 0, i32 0
  %3447 = load ptr, ptr %3446, align 8
  %3448 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3447, i32 0, i32 0
  %3449 = load ptr, ptr %3448, align 8
  %3450 = load i32, ptr %66, align 4
  %3451 = zext i32 %3450 to i64
  %3452 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3449, i64 %3451
  store ptr %3452, ptr %67, align 8
  %3453 = load ptr, ptr %67, align 8
  %3454 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3453, i32 0, i32 1
  %3455 = load i32, ptr %3454, align 8
  %3456 = add i32 %3455, -1
  store i32 %3456, ptr %3454, align 8
  %3457 = load ptr, ptr %67, align 8
  %3458 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3457, i32 0, i32 0
  %3459 = load ptr, ptr %3458, align 8
  %3460 = load ptr, ptr %65, align 8
  %3461 = icmp eq ptr %3459, %3460
  br i1 %3461, label %3462, label %3468

3462:                                             ; preds = %3443
  %3463 = load ptr, ptr %65, align 8
  %3464 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3463, i32 0, i32 4
  %3465 = load ptr, ptr %3464, align 8
  %3466 = load ptr, ptr %67, align 8
  %3467 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3466, i32 0, i32 0
  store ptr %3465, ptr %3467, align 8
  br label %3468

3468:                                             ; preds = %3462, %3443
  %3469 = load ptr, ptr %65, align 8
  %3470 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3469, i32 0, i32 3
  %3471 = load ptr, ptr %3470, align 8
  %3472 = icmp ne ptr %3471, null
  br i1 %3472, label %3473, label %3481

3473:                                             ; preds = %3468
  %3474 = load ptr, ptr %65, align 8
  %3475 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3474, i32 0, i32 4
  %3476 = load ptr, ptr %3475, align 8
  %3477 = load ptr, ptr %65, align 8
  %3478 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3477, i32 0, i32 3
  %3479 = load ptr, ptr %3478, align 8
  %3480 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3479, i32 0, i32 4
  store ptr %3476, ptr %3480, align 8
  br label %3481

3481:                                             ; preds = %3473, %3468
  %3482 = load ptr, ptr %65, align 8
  %3483 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3482, i32 0, i32 4
  %3484 = load ptr, ptr %3483, align 8
  %3485 = icmp ne ptr %3484, null
  br i1 %3485, label %3486, label %3494

3486:                                             ; preds = %3481
  %3487 = load ptr, ptr %65, align 8
  %3488 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3487, i32 0, i32 3
  %3489 = load ptr, ptr %3488, align 8
  %3490 = load ptr, ptr %65, align 8
  %3491 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3490, i32 0, i32 4
  %3492 = load ptr, ptr %3491, align 8
  %3493 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3492, i32 0, i32 3
  store ptr %3489, ptr %3493, align 8
  br label %3494

3494:                                             ; preds = %3486, %3481
  br label %3495

3495:                                             ; preds = %3494
  %3496 = load ptr, ptr %8, align 8
  %3497 = getelementptr inbounds nuw %struct.GramHash, ptr %3496, i32 0, i32 2
  %3498 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3497, i32 0, i32 0
  %3499 = load ptr, ptr %3498, align 8
  %3500 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3499, i32 0, i32 3
  %3501 = load i32, ptr %3500, align 8
  %3502 = add i32 %3501, -1
  store i32 %3502, ptr %3500, align 8
  br label %3503

3503:                                             ; preds = %3495, %3347
  br label %3504

3504:                                             ; preds = %3503
  %3505 = load ptr, ptr %63, align 8
  call void @free(ptr noundef %3505)
  br label %3506

3506:                                             ; preds = %3504
  %3507 = load ptr, ptr %64, align 8
  store ptr %3507, ptr %63, align 8
  %3508 = load ptr, ptr %64, align 8
  %3509 = icmp ne ptr %3508, null
  br i1 %3509, label %3510, label %3515

3510:                                             ; preds = %3506
  %3511 = load ptr, ptr %64, align 8
  %3512 = getelementptr inbounds nuw %struct.GramHash, ptr %3511, i32 0, i32 2
  %3513 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3512, i32 0, i32 2
  %3514 = load ptr, ptr %3513, align 8
  br label %3516

3515:                                             ; preds = %3506
  br label %3516

3516:                                             ; preds = %3515, %3510
  %3517 = phi ptr [ %3514, %3510 ], [ null, %3515 ]
  store ptr %3517, ptr %64, align 8
  br label %3331, !llvm.loop !30

3518:                                             ; preds = %3331
  %3519 = load ptr, ptr %31, align 8
  store ptr %3519, ptr %63, align 8
  %3520 = load ptr, ptr %31, align 8
  %3521 = icmp ne ptr %3520, null
  br i1 %3521, label %3522, label %3527

3522:                                             ; preds = %3518
  %3523 = load ptr, ptr %31, align 8
  %3524 = getelementptr inbounds nuw %struct.GramHash, ptr %3523, i32 0, i32 2
  %3525 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3524, i32 0, i32 2
  %3526 = load ptr, ptr %3525, align 8
  br label %3528

3527:                                             ; preds = %3518
  br label %3528

3528:                                             ; preds = %3527, %3522
  %3529 = phi ptr [ %3526, %3522 ], [ null, %3527 ]
  store ptr %3529, ptr %64, align 8
  br label %3530

3530:                                             ; preds = %3715, %3528
  %3531 = load ptr, ptr %63, align 8
  %3532 = icmp ne ptr %3531, null
  br i1 %3532, label %3533, label %3717

3533:                                             ; preds = %3530
  br label %3534

3534:                                             ; preds = %3533
  %3535 = load ptr, ptr %63, align 8
  %3536 = getelementptr inbounds nuw %struct.GramHash, ptr %3535, i32 0, i32 2
  store ptr %3536, ptr %68, align 8
  %3537 = load ptr, ptr %68, align 8
  %3538 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3537, i32 0, i32 1
  %3539 = load ptr, ptr %3538, align 8
  %3540 = icmp eq ptr %3539, null
  br i1 %3540, label %3541, label %3557

3541:                                             ; preds = %3534
  %3542 = load ptr, ptr %68, align 8
  %3543 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3542, i32 0, i32 2
  %3544 = load ptr, ptr %3543, align 8
  %3545 = icmp eq ptr %3544, null
  br i1 %3545, label %3546, label %3557

3546:                                             ; preds = %3541
  %3547 = load ptr, ptr %31, align 8
  %3548 = getelementptr inbounds nuw %struct.GramHash, ptr %3547, i32 0, i32 2
  %3549 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3548, i32 0, i32 0
  %3550 = load ptr, ptr %3549, align 8
  %3551 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3550, i32 0, i32 0
  %3552 = load ptr, ptr %3551, align 8
  call void @free(ptr noundef %3552)
  %3553 = load ptr, ptr %31, align 8
  %3554 = getelementptr inbounds nuw %struct.GramHash, ptr %3553, i32 0, i32 2
  %3555 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3554, i32 0, i32 0
  %3556 = load ptr, ptr %3555, align 8
  call void @free(ptr noundef %3556)
  store ptr null, ptr %31, align 8
  br label %3702

3557:                                             ; preds = %3541, %3534
  %3558 = load ptr, ptr %68, align 8
  %3559 = load ptr, ptr %31, align 8
  %3560 = getelementptr inbounds nuw %struct.GramHash, ptr %3559, i32 0, i32 2
  %3561 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3560, i32 0, i32 0
  %3562 = load ptr, ptr %3561, align 8
  %3563 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3562, i32 0, i32 4
  %3564 = load ptr, ptr %3563, align 8
  %3565 = icmp eq ptr %3558, %3564
  br i1 %3565, label %3566, label %3582

3566:                                             ; preds = %3557
  %3567 = load ptr, ptr %68, align 8
  %3568 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3567, i32 0, i32 1
  %3569 = load ptr, ptr %3568, align 8
  %3570 = load ptr, ptr %31, align 8
  %3571 = getelementptr inbounds nuw %struct.GramHash, ptr %3570, i32 0, i32 2
  %3572 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3571, i32 0, i32 0
  %3573 = load ptr, ptr %3572, align 8
  %3574 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3573, i32 0, i32 5
  %3575 = load i64, ptr %3574, align 8
  %3576 = getelementptr inbounds i8, ptr %3569, i64 %3575
  %3577 = load ptr, ptr %31, align 8
  %3578 = getelementptr inbounds nuw %struct.GramHash, ptr %3577, i32 0, i32 2
  %3579 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3578, i32 0, i32 0
  %3580 = load ptr, ptr %3579, align 8
  %3581 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3580, i32 0, i32 4
  store ptr %3576, ptr %3581, align 8
  br label %3582

3582:                                             ; preds = %3566, %3557
  %3583 = load ptr, ptr %68, align 8
  %3584 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3583, i32 0, i32 1
  %3585 = load ptr, ptr %3584, align 8
  %3586 = icmp ne ptr %3585, null
  br i1 %3586, label %3587, label %3602

3587:                                             ; preds = %3582
  %3588 = load ptr, ptr %68, align 8
  %3589 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3588, i32 0, i32 2
  %3590 = load ptr, ptr %3589, align 8
  %3591 = load ptr, ptr %68, align 8
  %3592 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3591, i32 0, i32 1
  %3593 = load ptr, ptr %3592, align 8
  %3594 = load ptr, ptr %31, align 8
  %3595 = getelementptr inbounds nuw %struct.GramHash, ptr %3594, i32 0, i32 2
  %3596 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3595, i32 0, i32 0
  %3597 = load ptr, ptr %3596, align 8
  %3598 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3597, i32 0, i32 5
  %3599 = load i64, ptr %3598, align 8
  %3600 = getelementptr inbounds i8, ptr %3593, i64 %3599
  %3601 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3600, i32 0, i32 2
  store ptr %3590, ptr %3601, align 8
  br label %3608

3602:                                             ; preds = %3582
  br label %3603

3603:                                             ; preds = %3602
  %3604 = load ptr, ptr %68, align 8
  %3605 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3604, i32 0, i32 2
  %3606 = load ptr, ptr %3605, align 8
  store ptr %3606, ptr %31, align 8
  br label %3607

3607:                                             ; preds = %3603
  br label %3608

3608:                                             ; preds = %3607, %3587
  %3609 = load ptr, ptr %68, align 8
  %3610 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3609, i32 0, i32 2
  %3611 = load ptr, ptr %3610, align 8
  %3612 = icmp ne ptr %3611, null
  br i1 %3612, label %3613, label %3628

3613:                                             ; preds = %3608
  %3614 = load ptr, ptr %68, align 8
  %3615 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3614, i32 0, i32 1
  %3616 = load ptr, ptr %3615, align 8
  %3617 = load ptr, ptr %68, align 8
  %3618 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3617, i32 0, i32 2
  %3619 = load ptr, ptr %3618, align 8
  %3620 = load ptr, ptr %31, align 8
  %3621 = getelementptr inbounds nuw %struct.GramHash, ptr %3620, i32 0, i32 2
  %3622 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3621, i32 0, i32 0
  %3623 = load ptr, ptr %3622, align 8
  %3624 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3623, i32 0, i32 5
  %3625 = load i64, ptr %3624, align 8
  %3626 = getelementptr inbounds i8, ptr %3619, i64 %3625
  %3627 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3626, i32 0, i32 1
  store ptr %3616, ptr %3627, align 8
  br label %3628

3628:                                             ; preds = %3613, %3608
  br label %3629

3629:                                             ; preds = %3628
  %3630 = load ptr, ptr %68, align 8
  %3631 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3630, i32 0, i32 7
  %3632 = load i32, ptr %3631, align 4
  %3633 = load ptr, ptr %31, align 8
  %3634 = getelementptr inbounds nuw %struct.GramHash, ptr %3633, i32 0, i32 2
  %3635 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3634, i32 0, i32 0
  %3636 = load ptr, ptr %3635, align 8
  %3637 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3636, i32 0, i32 1
  %3638 = load i32, ptr %3637, align 8
  %3639 = sub i32 %3638, 1
  %3640 = and i32 %3632, %3639
  store i32 %3640, ptr %69, align 4
  br label %3641

3641:                                             ; preds = %3629
  br label %3642

3642:                                             ; preds = %3641
  %3643 = load ptr, ptr %31, align 8
  %3644 = getelementptr inbounds nuw %struct.GramHash, ptr %3643, i32 0, i32 2
  %3645 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3644, i32 0, i32 0
  %3646 = load ptr, ptr %3645, align 8
  %3647 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3646, i32 0, i32 0
  %3648 = load ptr, ptr %3647, align 8
  %3649 = load i32, ptr %69, align 4
  %3650 = zext i32 %3649 to i64
  %3651 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3648, i64 %3650
  store ptr %3651, ptr %70, align 8
  %3652 = load ptr, ptr %70, align 8
  %3653 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3652, i32 0, i32 1
  %3654 = load i32, ptr %3653, align 8
  %3655 = add i32 %3654, -1
  store i32 %3655, ptr %3653, align 8
  %3656 = load ptr, ptr %70, align 8
  %3657 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3656, i32 0, i32 0
  %3658 = load ptr, ptr %3657, align 8
  %3659 = load ptr, ptr %68, align 8
  %3660 = icmp eq ptr %3658, %3659
  br i1 %3660, label %3661, label %3667

3661:                                             ; preds = %3642
  %3662 = load ptr, ptr %68, align 8
  %3663 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3662, i32 0, i32 4
  %3664 = load ptr, ptr %3663, align 8
  %3665 = load ptr, ptr %70, align 8
  %3666 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3665, i32 0, i32 0
  store ptr %3664, ptr %3666, align 8
  br label %3667

3667:                                             ; preds = %3661, %3642
  %3668 = load ptr, ptr %68, align 8
  %3669 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3668, i32 0, i32 3
  %3670 = load ptr, ptr %3669, align 8
  %3671 = icmp ne ptr %3670, null
  br i1 %3671, label %3672, label %3680

3672:                                             ; preds = %3667
  %3673 = load ptr, ptr %68, align 8
  %3674 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3673, i32 0, i32 4
  %3675 = load ptr, ptr %3674, align 8
  %3676 = load ptr, ptr %68, align 8
  %3677 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3676, i32 0, i32 3
  %3678 = load ptr, ptr %3677, align 8
  %3679 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3678, i32 0, i32 4
  store ptr %3675, ptr %3679, align 8
  br label %3680

3680:                                             ; preds = %3672, %3667
  %3681 = load ptr, ptr %68, align 8
  %3682 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3681, i32 0, i32 4
  %3683 = load ptr, ptr %3682, align 8
  %3684 = icmp ne ptr %3683, null
  br i1 %3684, label %3685, label %3693

3685:                                             ; preds = %3680
  %3686 = load ptr, ptr %68, align 8
  %3687 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3686, i32 0, i32 3
  %3688 = load ptr, ptr %3687, align 8
  %3689 = load ptr, ptr %68, align 8
  %3690 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3689, i32 0, i32 4
  %3691 = load ptr, ptr %3690, align 8
  %3692 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3691, i32 0, i32 3
  store ptr %3688, ptr %3692, align 8
  br label %3693

3693:                                             ; preds = %3685, %3680
  br label %3694

3694:                                             ; preds = %3693
  %3695 = load ptr, ptr %31, align 8
  %3696 = getelementptr inbounds nuw %struct.GramHash, ptr %3695, i32 0, i32 2
  %3697 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3696, i32 0, i32 0
  %3698 = load ptr, ptr %3697, align 8
  %3699 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3698, i32 0, i32 3
  %3700 = load i32, ptr %3699, align 8
  %3701 = add i32 %3700, -1
  store i32 %3701, ptr %3699, align 8
  br label %3702

3702:                                             ; preds = %3694, %3546
  br label %3703

3703:                                             ; preds = %3702
  %3704 = load ptr, ptr %63, align 8
  call void @free(ptr noundef %3704)
  br label %3705

3705:                                             ; preds = %3703
  %3706 = load ptr, ptr %64, align 8
  store ptr %3706, ptr %63, align 8
  %3707 = load ptr, ptr %64, align 8
  %3708 = icmp ne ptr %3707, null
  br i1 %3708, label %3709, label %3714

3709:                                             ; preds = %3705
  %3710 = load ptr, ptr %64, align 8
  %3711 = getelementptr inbounds nuw %struct.GramHash, ptr %3710, i32 0, i32 2
  %3712 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3711, i32 0, i32 2
  %3713 = load ptr, ptr %3712, align 8
  br label %3715

3714:                                             ; preds = %3705
  br label %3715

3715:                                             ; preds = %3714, %3709
  %3716 = phi ptr [ %3713, %3709 ], [ null, %3714 ]
  store ptr %3716, ptr %64, align 8
  br label %3530, !llvm.loop !31

3717:                                             ; preds = %3530
  %3718 = load i32, ptr %62, align 4
  %3719 = icmp sgt i32 %3718, 0
  br i1 %3719, label %3720, label %3726

3720:                                             ; preds = %3717
  %3721 = load i32, ptr %32, align 4
  %3722 = sitofp i32 %3721 to double
  %3723 = load i32, ptr %62, align 4
  %3724 = sitofp i32 %3723 to double
  %3725 = fdiv double %3722, %3724
  br label %3727

3726:                                             ; preds = %3717
  br label %3727

3727:                                             ; preds = %3726, %3720
  %3728 = phi double [ %3725, %3720 ], [ 0.000000e+00, %3726 ]
  store double %3728, ptr %3, align 8
  br label %3729

3729:                                             ; preds = %3727, %80
  %3730 = load double, ptr %3, align 8
  ret double %3730
}

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

declare void @exit(i32 noundef)

define dso_local void @NGram_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca double, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.NGramData, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %6, align 8
  store i64 0, ptr %7, align 8
  br label %16

16:                                               ; preds = %43, %2
  %17 = load i64, ptr %7, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds nuw %struct.StringPairs, ptr %18, i32 0, i32 2
  %20 = load i64, ptr %19, align 8
  %21 = icmp ult i64 %17, %20
  br i1 %21, label %22, label %46

22:                                               ; preds = %16
  %23 = load ptr, ptr %6, align 8
  %24 = getelementptr inbounds nuw %struct.StringPairs, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load i64, ptr %7, align 8
  %27 = getelementptr inbounds nuw ptr, ptr %25, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds nuw %struct.StringPairs, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = load i64, ptr %7, align 8
  %33 = getelementptr inbounds nuw ptr, ptr %31, i64 %32
  %34 = load ptr, ptr %33, align 8
  %35 = call double @NGram_calc(ptr noundef %28, ptr noundef %34)
  store double %35, ptr %8, align 8
  %36 = load double, ptr %8, align 8
  %37 = fmul double %36, 1.000000e+03
  %38 = fptoui double %37 to i32
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.NGramData, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 8
  %42 = add i32 %41, %38
  store i32 %42, ptr %40, align 8
  br label %43

43:                                               ; preds = %22
  %44 = load i64, ptr %7, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr %7, align 8
  br label %16, !llvm.loop !32

46:                                               ; preds = %16
  ret void
}

define dso_local i32 @NGram_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.NGramData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @NGram_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.NGramData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.NGramData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free_string_pairs(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.NGramData, ptr %15, i32 0, i32 0
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define dso_local ptr @NGram_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
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
  store ptr @NGram_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @NGram_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @NGram_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @NGram_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
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
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
