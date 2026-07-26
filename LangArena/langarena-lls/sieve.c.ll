; ModuleID = 'c/src/sieve.c'
source_filename = "c/src/sieve.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.SieveData = type { i64, i32 }

@.str = private unnamed_addr constant [6 x i8] c"limit\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Etc::Sieve\00", align 1

define dso_local void @Sieve_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.SieveData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.SieveData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = icmp sle i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.SieveData, ptr %18, i32 0, i32 0
  store i64 1000000, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %1
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.SieveData, ptr %21, i32 0, i32 1
  store i32 0, ptr %22, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define dso_local void @Sieve_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  store i32 0, ptr %6, align 4
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.SieveData, ptr %11, i32 0, i32 0
  %13 = load i64, ptr %12, align 8
  %14 = call ptr @sieve_generate(i64 noundef %13, ptr noundef %6)
  %15 = load i32, ptr %6, align 4
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.SieveData, ptr %16, i32 0, i32 1
  %18 = load i32, ptr %17, align 8
  %19 = add i32 %18, %15
  store i32 %19, ptr %17, align 8
  ret void
}

define internal ptr @sieve_generate(i64 noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i64 %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %13 = load i64, ptr %4, align 8
  %14 = icmp slt i64 %13, 2
  br i1 %14, label %15, label %17

15:                                               ; preds = %2
  %16 = load ptr, ptr %5, align 8
  store i32 0, ptr %16, align 4
  store ptr null, ptr %3, align 8
  br label %101

17:                                               ; preds = %2
  %18 = load i64, ptr %4, align 8
  %19 = add nsw i64 %18, 1
  %20 = mul i64 %19, 1
  %21 = call noalias ptr @malloc(i64 noundef %20)
  store ptr %21, ptr %6, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %17
  store ptr null, ptr %3, align 8
  br label %101

25:                                               ; preds = %17
  %26 = load ptr, ptr %6, align 8
  %27 = load i64, ptr %4, align 8
  %28 = add nsw i64 %27, 1
  %29 = mul i64 %28, 1
  call void @llvm.memset.p0.i64(ptr align 1 %26, i8 1, i64 %29, i1 false)
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds i8, ptr %30, i64 0
  store i8 0, ptr %31, align 1
  %32 = load ptr, ptr %6, align 8
  %33 = getelementptr inbounds i8, ptr %32, i64 1
  store i8 0, ptr %33, align 1
  %34 = load i64, ptr %4, align 8
  %35 = sitofp i64 %34 to double
  %36 = call double @sqrt(double noundef %35)
  %37 = fptosi double %36 to i32
  store i32 %37, ptr %7, align 4
  store i32 2, ptr %8, align 4
  br label %38

38:                                               ; preds = %70, %25
  %39 = load i32, ptr %8, align 4
  %40 = load i32, ptr %7, align 4
  %41 = icmp sle i32 %39, %40
  br i1 %41, label %42, label %73

42:                                               ; preds = %38
  %43 = load ptr, ptr %6, align 8
  %44 = load i32, ptr %8, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i8, ptr %43, i64 %45
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp eq i32 %48, 1
  br i1 %49, label %50, label %69

50:                                               ; preds = %42
  %51 = load i32, ptr %8, align 4
  %52 = load i32, ptr %8, align 4
  %53 = mul nsw i32 %51, %52
  store i32 %53, ptr %9, align 4
  br label %54

54:                                               ; preds = %64, %50
  %55 = load i32, ptr %9, align 4
  %56 = sext i32 %55 to i64
  %57 = load i64, ptr %4, align 8
  %58 = icmp sle i64 %56, %57
  br i1 %58, label %59, label %68

59:                                               ; preds = %54
  %60 = load ptr, ptr %6, align 8
  %61 = load i32, ptr %9, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, ptr %60, i64 %62
  store i8 0, ptr %63, align 1
  br label %64

64:                                               ; preds = %59
  %65 = load i32, ptr %8, align 4
  %66 = load i32, ptr %9, align 4
  %67 = add nsw i32 %66, %65
  store i32 %67, ptr %9, align 4
  br label %54, !llvm.loop !6

68:                                               ; preds = %54
  br label %69

69:                                               ; preds = %68, %42
  br label %70

70:                                               ; preds = %69
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %8, align 4
  br label %38, !llvm.loop !8

73:                                               ; preds = %38
  store i32 2, ptr %10, align 4
  store i32 1, ptr %11, align 4
  store i32 3, ptr %12, align 4
  br label %74

74:                                               ; preds = %92, %73
  %75 = load i32, ptr %12, align 4
  %76 = sext i32 %75 to i64
  %77 = load i64, ptr %4, align 8
  %78 = icmp sle i64 %76, %77
  br i1 %78, label %79, label %95

79:                                               ; preds = %74
  %80 = load ptr, ptr %6, align 8
  %81 = load i32, ptr %12, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, ptr %80, i64 %82
  %84 = load i8, ptr %83, align 1
  %85 = zext i8 %84 to i32
  %86 = icmp eq i32 %85, 1
  br i1 %86, label %87, label %91

87:                                               ; preds = %79
  %88 = load i32, ptr %12, align 4
  store i32 %88, ptr %10, align 4
  %89 = load i32, ptr %11, align 4
  %90 = add nsw i32 %89, 1
  store i32 %90, ptr %11, align 4
  br label %91

91:                                               ; preds = %87, %79
  br label %92

92:                                               ; preds = %91
  %93 = load i32, ptr %12, align 4
  %94 = add nsw i32 %93, 2
  store i32 %94, ptr %12, align 4
  br label %74, !llvm.loop !9

95:                                               ; preds = %74
  %96 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %96)
  %97 = load i32, ptr %10, align 4
  %98 = load i32, ptr %11, align 4
  %99 = add nsw i32 %97, %98
  %100 = load ptr, ptr %5, align 8
  store i32 %99, ptr %100, align 4
  store ptr null, ptr %3, align 8
  br label %101

101:                                              ; preds = %95, %24, %15
  %102 = load ptr, ptr %3, align 8
  ret ptr %102
}

define dso_local i32 @Sieve_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.SieveData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local ptr @Sieve_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 16, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @Sieve_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Sieve_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Sieve_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  ret ptr %15
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare double @sqrt(double noundef)

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
