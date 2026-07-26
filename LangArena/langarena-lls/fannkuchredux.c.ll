; ModuleID = 'c/src/fannkuchredux.c'
source_filename = "c/src/fannkuchredux.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.FannkuchreduxData = type { i64, i32 }

@.str = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"CLBG::Fannkuchredux\00", align 1

define dso_local void @Fannkuchredux_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %18, i32 0, i32 0
  store i64 12, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %1
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %21, i32 0, i32 1
  store i32 0, ptr %22, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @Fannkuchredux_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 11
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %5, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %12, i32 0, i32 0
  %14 = load i64, ptr %13, align 8
  %15 = trunc i64 %14 to i32
  call void @fannkuchredux_calculate(i32 noundef %15, ptr noundef %6, ptr noundef %7)
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  %19 = load i32, ptr %6, align 4
  %20 = mul nsw i32 %19, 100
  %21 = load i32, ptr %7, align 4
  %22 = add nsw i32 %20, %21
  %23 = add i32 %18, %22
  %24 = and i32 %23, -1
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %25, i32 0, i32 1
  store i32 %24, ptr %26, align 8
  ret void
}

define internal void @fannkuchredux_calculate(i32 noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca [32 x i32], align 16
  %8 = alloca [32 x i32], align 16
  %9 = alloca [32 x i32], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %20 = load i32, ptr %4, align 4
  %21 = icmp sgt i32 %20, 32
  br i1 %21, label %22, label %23

22:                                               ; preds = %3
  store i32 32, ptr %4, align 4
  br label %23

23:                                               ; preds = %22, %3
  store i32 0, ptr %10, align 4
  br label %24

24:                                               ; preds = %33, %23
  %25 = load i32, ptr %10, align 4
  %26 = load i32, ptr %4, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %36

28:                                               ; preds = %24
  %29 = load i32, ptr %10, align 4
  %30 = load i32, ptr %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 %31
  store i32 %29, ptr %32, align 4
  br label %33

33:                                               ; preds = %28
  %34 = load i32, ptr %10, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %10, align 4
  br label %24, !llvm.loop !6

36:                                               ; preds = %24
  %37 = load ptr, ptr %6, align 8
  store i32 0, ptr %37, align 4
  %38 = load ptr, ptr %5, align 8
  store i32 0, ptr %38, align 4
  store i32 0, ptr %11, align 4
  %39 = load i32, ptr %4, align 4
  store i32 %39, ptr %12, align 4
  br label %40

40:                                               ; preds = %36, %154
  br label %41

41:                                               ; preds = %44, %40
  %42 = load i32, ptr %12, align 4
  %43 = icmp sgt i32 %42, 1
  br i1 %43, label %44, label %52

44:                                               ; preds = %41
  %45 = load i32, ptr %12, align 4
  %46 = load i32, ptr %12, align 4
  %47 = sub nsw i32 %46, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [32 x i32], ptr %9, i64 0, i64 %48
  store i32 %45, ptr %49, align 4
  %50 = load i32, ptr %12, align 4
  %51 = add nsw i32 %50, -1
  store i32 %51, ptr %12, align 4
  br label %41, !llvm.loop !8

52:                                               ; preds = %41
  %53 = getelementptr inbounds [32 x i32], ptr %8, i64 0, i64 0
  %54 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 0
  %55 = load i32, ptr %4, align 4
  %56 = sext i32 %55 to i64
  %57 = mul i64 %56, 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %53, ptr align 16 %54, i64 %57, i1 false)
  store i32 0, ptr %13, align 4
  %58 = getelementptr inbounds [32 x i32], ptr %8, i64 0, i64 0
  %59 = load i32, ptr %58, align 16
  store i32 %59, ptr %14, align 4
  br label %60

60:                                               ; preds = %84, %52
  %61 = load i32, ptr %14, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %89

63:                                               ; preds = %60
  %64 = load i32, ptr %14, align 4
  %65 = add nsw i32 %64, 1
  %66 = ashr i32 %65, 1
  store i32 %66, ptr %15, align 4
  store i32 0, ptr %16, align 4
  br label %67

67:                                               ; preds = %81, %63
  %68 = load i32, ptr %16, align 4
  %69 = load i32, ptr %15, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %84

71:                                               ; preds = %67
  %72 = load i32, ptr %14, align 4
  %73 = load i32, ptr %16, align 4
  %74 = sub nsw i32 %72, %73
  store i32 %74, ptr %17, align 4
  %75 = load i32, ptr %16, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [32 x i32], ptr %8, i64 0, i64 %76
  %78 = load i32, ptr %17, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [32 x i32], ptr %8, i64 0, i64 %79
  call void @fannkuchredux_swap(ptr noundef %77, ptr noundef %80)
  br label %81

81:                                               ; preds = %71
  %82 = load i32, ptr %16, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, ptr %16, align 4
  br label %67, !llvm.loop !9

84:                                               ; preds = %67
  %85 = load i32, ptr %13, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %13, align 4
  %87 = getelementptr inbounds [32 x i32], ptr %8, i64 0, i64 0
  %88 = load i32, ptr %87, align 16
  store i32 %88, ptr %14, align 4
  br label %60, !llvm.loop !10

89:                                               ; preds = %60
  %90 = load i32, ptr %13, align 4
  %91 = load ptr, ptr %6, align 8
  %92 = load i32, ptr %91, align 4
  %93 = icmp sgt i32 %90, %92
  br i1 %93, label %94, label %97

94:                                               ; preds = %89
  %95 = load i32, ptr %13, align 4
  %96 = load ptr, ptr %6, align 8
  store i32 %95, ptr %96, align 4
  br label %97

97:                                               ; preds = %94, %89
  %98 = load i32, ptr %11, align 4
  %99 = srem i32 %98, 2
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %103

101:                                              ; preds = %97
  %102 = load i32, ptr %13, align 4
  br label %106

103:                                              ; preds = %97
  %104 = load i32, ptr %13, align 4
  %105 = sub nsw i32 0, %104
  br label %106

106:                                              ; preds = %103, %101
  %107 = phi i32 [ %102, %101 ], [ %105, %103 ]
  %108 = load ptr, ptr %5, align 8
  %109 = load i32, ptr %108, align 4
  %110 = add nsw i32 %109, %107
  store i32 %110, ptr %108, align 4
  br label %111

111:                                              ; preds = %106, %151
  %112 = load i32, ptr %12, align 4
  %113 = load i32, ptr %4, align 4
  %114 = icmp eq i32 %112, %113
  br i1 %114, label %115, label %116

115:                                              ; preds = %111
  ret void

116:                                              ; preds = %111
  %117 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 0
  %118 = load i32, ptr %117, align 16
  store i32 %118, ptr %18, align 4
  store i32 0, ptr %19, align 4
  br label %119

119:                                              ; preds = %132, %116
  %120 = load i32, ptr %19, align 4
  %121 = load i32, ptr %12, align 4
  %122 = icmp slt i32 %120, %121
  br i1 %122, label %123, label %135

123:                                              ; preds = %119
  %124 = load i32, ptr %19, align 4
  %125 = add nsw i32 %124, 1
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 %126
  %128 = load i32, ptr %127, align 4
  %129 = load i32, ptr %19, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 %130
  store i32 %128, ptr %131, align 4
  br label %132

132:                                              ; preds = %123
  %133 = load i32, ptr %19, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, ptr %19, align 4
  br label %119, !llvm.loop !11

135:                                              ; preds = %119
  %136 = load i32, ptr %18, align 4
  %137 = load i32, ptr %12, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds [32 x i32], ptr %7, i64 0, i64 %138
  store i32 %136, ptr %139, align 4
  %140 = load i32, ptr %12, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [32 x i32], ptr %9, i64 0, i64 %141
  %143 = load i32, ptr %142, align 4
  %144 = add nsw i32 %143, -1
  store i32 %144, ptr %142, align 4
  %145 = load i32, ptr %12, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [32 x i32], ptr %9, i64 0, i64 %146
  %148 = load i32, ptr %147, align 4
  %149 = icmp sgt i32 %148, 0
  br i1 %149, label %150, label %151

150:                                              ; preds = %135
  br label %154

151:                                              ; preds = %135
  %152 = load i32, ptr %12, align 4
  %153 = add nsw i32 %152, 1
  store i32 %153, ptr %12, align 4
  br label %111

154:                                              ; preds = %150
  %155 = load i32, ptr %11, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, ptr %11, align 4
  br label %40
}

define dso_local i32 @Fannkuchredux_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @Fannkuchredux_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  ret void
}

define dso_local ptr @Fannkuchredux_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %5, i32 0, i32 0
  store i64 0, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.FannkuchreduxData, ptr %7, i32 0, i32 1
  store i32 0, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 3
  store ptr @Fannkuchredux_prepare, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 4
  store ptr @Fannkuchredux_run, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 7
  store ptr @Fannkuchredux_checksum, ptr %17, align 8
  %18 = load ptr, ptr %1, align 8
  %19 = getelementptr inbounds nuw %struct.Benchmark, ptr %18, i32 0, i32 10
  store ptr @Fannkuchredux_cleanup, ptr %19, align 8
  %20 = load ptr, ptr %1, align 8
  ret ptr %20
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal void @fannkuchredux_swap(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = load i32, ptr %6, align 4
  store i32 %7, ptr %5, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load i32, ptr %8, align 4
  %10 = load ptr, ptr %3, align 8
  store i32 %9, ptr %10, align 4
  %11 = load i32, ptr %5, align 4
  %12 = load ptr, ptr %4, align 8
  store i32 %11, ptr %12, align 4
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
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
