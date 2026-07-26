; ModuleID = 'c/src/base64.c'
source_filename = "c/src/base64.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.Base64EncodeData = type { ptr, i64, ptr, i64, i32 }
%struct.Base64DecodeData = type { ptr, i64, ptr, i64, i32, i64 }

@.str = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"encode %s to %s: %u\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"Base64::Encode\00", align 1
@.str.3 = private unnamed_addr constant [20 x i8] c"decode %s to %s: %u\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Base64::Decode\00", align 1

define dso_local void @Base64Encode_prepare(ptr noundef %0) {
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
  store i64 %11, ptr %4, align 8
  %12 = load i64, ptr %4, align 8
  %13 = icmp sle i64 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %1
  store i64 100, ptr %4, align 8
  br label %15

15:                                               ; preds = %14, %1
  %16 = load i64, ptr %4, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %17, i32 0, i32 1
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %19, i32 0, i32 1
  %21 = load i64, ptr %20, align 8
  %22 = add i64 %21, 1
  %23 = call noalias ptr @malloc(i64 noundef %22)
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %29, i32 0, i32 1
  %31 = load i64, ptr %30, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %28, i8 97, i64 %31, i1 false)
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %35, i32 0, i32 1
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds nuw i8, ptr %34, i64 %37
  store i8 0, ptr %38, align 1
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %39, i32 0, i32 1
  %41 = load i64, ptr %40, align 8
  %42 = call i64 @b64_encode_size(i64 noundef %41)
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %43, i32 0, i32 3
  store i64 %42, ptr %44, align 8
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %45, i32 0, i32 3
  %47 = load i64, ptr %46, align 8
  %48 = call noalias ptr @malloc(i64 noundef %47)
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %49, i32 0, i32 2
  store ptr %48, ptr %50, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %51, i32 0, i32 2
  %53 = load ptr, ptr %52, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %54, i32 0, i32 0
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %57, i32 0, i32 1
  %59 = load i64, ptr %58, align 8
  %60 = call i64 @b64_encode(ptr noundef %53, ptr noundef %56, i64 noundef %59)
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %61, i32 0, i32 3
  store i64 %60, ptr %62, align 8
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %63, i32 0, i32 4
  store i32 0, ptr %64, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define internal i64 @b64_encode_size(i64 noundef %0) {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = mul i64 %3, 4
  %5 = uitofp i64 %4 to double
  %6 = fdiv double %5, 3.000000e+00
  %7 = fptoui double %6 to i64
  %8 = add i64 %7, 6
  ret i64 %8
}

define internal i64 @b64_encode(ptr noundef %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load i64, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  call void @base64_encode(ptr noundef %8, i64 noundef %9, ptr noundef %10, ptr noundef %7, i32 noundef 0)
  %11 = load i64, ptr %7, align 8
  ret i64 %11
}

define dso_local void @Base64Encode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = call i64 @b64_encode_size(i64 noundef %15)
  store i64 %16, ptr %6, align 8
  %17 = load i64, ptr %6, align 8
  %18 = call noalias ptr @malloc(i64 noundef %17)
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %23, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = call i64 @b64_encode(ptr noundef %19, ptr noundef %22, i64 noundef %25)
  store i64 %26, ptr %8, align 8
  %27 = load i64, ptr %8, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %28, i32 0, i32 4
  %30 = load i32, ptr %29, align 8
  %31 = zext i32 %30 to i64
  %32 = add i64 %31, %27
  %33 = trunc i64 %32 to i32
  store i32 %33, ptr %29, align 8
  %34 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %34)
  ret void
}

declare void @free(ptr noundef)

define dso_local i32 @Base64Encode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca [32 x i8], align 16
  %6 = alloca [32 x i8], align 16
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  %13 = icmp ugt i64 %12, 4
  br i1 %13, label %14, label %24

14:                                               ; preds = %1
  %15 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = call ptr @strncpy(ptr noundef %15, ptr noundef %18, i64 noundef 4)
  %20 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 4
  store i8 46, ptr %20, align 4
  %21 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 5
  store i8 46, ptr %21, align 1
  %22 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 6
  store i8 46, ptr %22, align 2
  %23 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 7
  store i8 0, ptr %23, align 1
  br label %37

24:                                               ; preds = %1
  %25 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %29, i32 0, i32 1
  %31 = load i64, ptr %30, align 8
  %32 = call ptr @strncpy(ptr noundef %25, ptr noundef %28, i64 noundef %31)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %33, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = getelementptr inbounds nuw [32 x i8], ptr %5, i64 0, i64 %35
  store i8 0, ptr %36, align 1
  br label %37

37:                                               ; preds = %24, %14
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %38, i32 0, i32 3
  %40 = load i64, ptr %39, align 8
  %41 = icmp ugt i64 %40, 4
  br i1 %41, label %42, label %52

42:                                               ; preds = %37
  %43 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %44, i32 0, i32 2
  %46 = load ptr, ptr %45, align 8
  %47 = call ptr @strncpy(ptr noundef %43, ptr noundef %46, i64 noundef 4)
  %48 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 4
  store i8 46, ptr %48, align 4
  %49 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 5
  store i8 46, ptr %49, align 1
  %50 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 6
  store i8 46, ptr %50, align 2
  %51 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 7
  store i8 0, ptr %51, align 1
  br label %65

52:                                               ; preds = %37
  %53 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %54, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %57, i32 0, i32 3
  %59 = load i64, ptr %58, align 8
  %60 = call ptr @strncpy(ptr noundef %53, ptr noundef %56, i64 noundef %59)
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %61, i32 0, i32 3
  %63 = load i64, ptr %62, align 8
  %64 = getelementptr inbounds nuw [32 x i8], ptr %6, i64 0, i64 %63
  store i8 0, ptr %64, align 1
  br label %65

65:                                               ; preds = %52, %42
  %66 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %67 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %68 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %69, i32 0, i32 4
  %71 = load i32, ptr %70, align 8
  %72 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %66, i64 noundef 256, ptr noundef @.str.1, ptr noundef %67, ptr noundef %68, i32 noundef %71)
  %73 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %74 = call i32 @Helper_checksum_string(ptr noundef %73)
  ret i32 %74
}

declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef)

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare i32 @Helper_checksum_string(ptr noundef)

define dso_local void @Base64Encode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.Base64EncodeData, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  ret void
}

define dso_local ptr @Base64Encode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 40, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @Base64Encode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Base64Encode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Base64Encode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Base64Encode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

define dso_local void @Base64Decode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %3, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str)
  store i64 %16, ptr %4, align 8
  %17 = load i64, ptr %4, align 8
  %18 = icmp sle i64 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %1
  store i64 100, ptr %4, align 8
  br label %20

20:                                               ; preds = %19, %1
  %21 = load i64, ptr %4, align 8
  store i64 %21, ptr %5, align 8
  %22 = load i64, ptr %5, align 8
  %23 = add i64 %22, 1
  %24 = call noalias ptr @malloc(i64 noundef %23)
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = load i64, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 1 %25, i8 97, i64 %26, i1 false)
  %27 = load ptr, ptr %6, align 8
  %28 = load i64, ptr %5, align 8
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 %28
  store i8 0, ptr %29, align 1
  %30 = load i64, ptr %5, align 8
  %31 = call i64 @b64_encode_size(i64 noundef %30)
  store i64 %31, ptr %7, align 8
  %32 = load i64, ptr %7, align 8
  %33 = call noalias ptr @malloc(i64 noundef %32)
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %34, i32 0, i32 0
  store ptr %33, ptr %35, align 8
  store i64 0, ptr %8, align 8
  %36 = load ptr, ptr %6, align 8
  %37 = load i64, ptr %5, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %38, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  call void @base64_encode(ptr noundef %36, i64 noundef %37, ptr noundef %40, ptr noundef %8, i32 noundef 0)
  %41 = load i64, ptr %8, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %42, i32 0, i32 1
  store i64 %41, ptr %43, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %44, i32 0, i32 1
  %46 = load i64, ptr %45, align 8
  %47 = call i64 @b64_decode_size(i64 noundef %46)
  store i64 %47, ptr %9, align 8
  %48 = load i64, ptr %9, align 8
  %49 = call noalias ptr @malloc(i64 noundef %48)
  %50 = load ptr, ptr %3, align 8
  %51 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %50, i32 0, i32 2
  store ptr %49, ptr %51, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %52, i32 0, i32 2
  %54 = load ptr, ptr %53, align 8
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %58, i32 0, i32 1
  %60 = load i64, ptr %59, align 8
  %61 = call i64 @b64_decode(ptr noundef %54, ptr noundef %57, i64 noundef %60)
  %62 = load ptr, ptr %3, align 8
  %63 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %62, i32 0, i32 3
  store i64 %61, ptr %63, align 8
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %64, i32 0, i32 4
  store i32 0, ptr %65, align 8
  %66 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %66)
  ret void
}

declare void @base64_encode(ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef)

define internal i64 @b64_decode_size(i64 noundef %0) {
  %2 = alloca i64, align 8
  store i64 %0, ptr %2, align 8
  %3 = load i64, ptr %2, align 8
  %4 = mul i64 %3, 3
  %5 = uitofp i64 %4 to double
  %6 = fdiv double %5, 4.000000e+00
  %7 = fptoui double %6 to i64
  %8 = add i64 %7, 6
  ret i64 %8
}

define internal i64 @b64_decode(ptr noundef %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = load i64, ptr %7, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = call i32 @base64_decode(ptr noundef %9, i64 noundef %10, ptr noundef %11, ptr noundef %8, i32 noundef 0)
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  store i64 0, ptr %4, align 8
  br label %17

15:                                               ; preds = %3
  %16 = load i64, ptr %8, align 8
  store i64 %16, ptr %4, align 8
  br label %17

17:                                               ; preds = %15, %14
  %18 = load i64, ptr %4, align 8
  ret i64 %18
}

define dso_local void @Base64Decode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = call i64 @b64_decode_size(i64 noundef %15)
  store i64 %16, ptr %6, align 8
  %17 = load i64, ptr %6, align 8
  %18 = call noalias ptr @malloc(i64 noundef %17)
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %23, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = call i64 @b64_decode(ptr noundef %19, ptr noundef %22, i64 noundef %25)
  store i64 %26, ptr %8, align 8
  %27 = load i64, ptr %8, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %28, i32 0, i32 4
  %30 = load i32, ptr %29, align 8
  %31 = zext i32 %30 to i64
  %32 = add i64 %31, %27
  %33 = trunc i64 %32 to i32
  store i32 %33, ptr %29, align 8
  %34 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %34)
  ret void
}

define dso_local i32 @Base64Decode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca [256 x i8], align 16
  %5 = alloca [32 x i8], align 16
  %6 = alloca [32 x i8], align 16
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  %13 = icmp ugt i64 %12, 4
  br i1 %13, label %14, label %24

14:                                               ; preds = %1
  %15 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = call ptr @strncpy(ptr noundef %15, ptr noundef %18, i64 noundef 4)
  %20 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 4
  store i8 46, ptr %20, align 4
  %21 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 5
  store i8 46, ptr %21, align 1
  %22 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 6
  store i8 46, ptr %22, align 2
  %23 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 7
  store i8 0, ptr %23, align 1
  br label %37

24:                                               ; preds = %1
  %25 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %29, i32 0, i32 1
  %31 = load i64, ptr %30, align 8
  %32 = call ptr @strncpy(ptr noundef %25, ptr noundef %28, i64 noundef %31)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %33, i32 0, i32 1
  %35 = load i64, ptr %34, align 8
  %36 = getelementptr inbounds nuw [32 x i8], ptr %5, i64 0, i64 %35
  store i8 0, ptr %36, align 1
  br label %37

37:                                               ; preds = %24, %14
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %38, i32 0, i32 3
  %40 = load i64, ptr %39, align 8
  %41 = icmp ugt i64 %40, 4
  br i1 %41, label %42, label %52

42:                                               ; preds = %37
  %43 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %44, i32 0, i32 2
  %46 = load ptr, ptr %45, align 8
  %47 = call ptr @strncpy(ptr noundef %43, ptr noundef %46, i64 noundef 4)
  %48 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 4
  store i8 46, ptr %48, align 4
  %49 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 5
  store i8 46, ptr %49, align 1
  %50 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 6
  store i8 46, ptr %50, align 2
  %51 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 7
  store i8 0, ptr %51, align 1
  br label %65

52:                                               ; preds = %37
  %53 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %54, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %57, i32 0, i32 3
  %59 = load i64, ptr %58, align 8
  %60 = call ptr @strncpy(ptr noundef %53, ptr noundef %56, i64 noundef %59)
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %61, i32 0, i32 3
  %63 = load i64, ptr %62, align 8
  %64 = getelementptr inbounds nuw [32 x i8], ptr %6, i64 0, i64 %63
  store i8 0, ptr %64, align 1
  br label %65

65:                                               ; preds = %52, %42
  %66 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %67 = getelementptr inbounds [32 x i8], ptr %5, i64 0, i64 0
  %68 = getelementptr inbounds [32 x i8], ptr %6, i64 0, i64 0
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %69, i32 0, i32 4
  %71 = load i32, ptr %70, align 8
  %72 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %66, i64 noundef 256, ptr noundef @.str.3, ptr noundef %67, ptr noundef %68, i32 noundef %71)
  %73 = getelementptr inbounds [256 x i8], ptr %4, i64 0, i64 0
  %74 = call i32 @Helper_checksum_string(ptr noundef %73)
  ret i32 %74
}

define dso_local void @Base64Decode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.Base64DecodeData, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  ret void
}

define dso_local ptr @Base64Decode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.4)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 48)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 48, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @Base64Decode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Base64Decode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Base64Decode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Base64Decode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare i32 @base64_decode(ptr noundef, i64 noundef, ptr noundef, ptr noundef, i32 noundef)


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
