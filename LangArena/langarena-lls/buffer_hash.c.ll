; ModuleID = 'c/src/buffer_hash.c'
source_filename = "c/src/buffer_hash.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BufferHashSHA256Data = type { %struct.BufferHashBaseData }
%struct.BufferHashBaseData = type { ptr, i64, i32 }
%struct.BufferHashCRC32Data = type { %struct.BufferHashBaseData }

@.str = private unnamed_addr constant [13 x i8] c"Hash::SHA256\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"Hash::CRC32\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@__const.buffer_hash_sha256_digest.hashes = private unnamed_addr constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 16

define dso_local void @BufferHashSHA256_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %8, i32 0, i32 0
  call void @buffer_hash_base_prepare(ptr noundef %7, ptr noundef @.str, ptr noundef %9)
  ret void
}

define internal void @buffer_hash_base_prepare(ptr noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.2)
  %11 = load ptr, ptr %6, align 8
  %12 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %11, i32 0, i32 1
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %6, align 8
  %14 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = icmp sle i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %3
  %18 = load ptr, ptr %6, align 8
  %19 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %18, i32 0, i32 1
  store i64 1000000, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %3
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %21, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = mul i64 %23, 1
  %25 = call noalias ptr @malloc(i64 noundef %24)
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %26, i32 0, i32 0
  store ptr %25, ptr %27, align 8
  store i64 0, ptr %7, align 8
  br label %28

28:                                               ; preds = %42, %20
  %29 = load i64, ptr %7, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %30, i32 0, i32 1
  %32 = load i64, ptr %31, align 8
  %33 = icmp slt i64 %29, %32
  br i1 %33, label %34, label %45

34:                                               ; preds = %28
  %35 = call i32 @Helper_next_int(i32 noundef 256)
  %36 = trunc i32 %35 to i8
  %37 = load ptr, ptr %6, align 8
  %38 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = load i64, ptr %7, align 8
  %41 = getelementptr inbounds i8, ptr %39, i64 %40
  store i8 %36, ptr %41, align 1
  br label %42

42:                                               ; preds = %34
  %43 = load i64, ptr %7, align 8
  %44 = add nsw i64 %43, 1
  store i64 %44, ptr %7, align 8
  br label %28, !llvm.loop !6

45:                                               ; preds = %28
  %46 = load ptr, ptr %6, align 8
  %47 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %46, i32 0, i32 2
  store i32 0, ptr %47, align 8
  ret void
}

define dso_local void @BufferHashSHA256_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = call i32 @buffer_hash_sha256_digest(ptr noundef %14, i64 noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %20, i32 0, i32 0
  %22 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 8
  %24 = load i32, ptr %6, align 4
  %25 = add i32 %23, %24
  %26 = and i32 %25, -1
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %27, i32 0, i32 0
  %29 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %28, i32 0, i32 2
  store i32 %26, ptr %29, align 8
  ret void
}

define internal i32 @buffer_hash_sha256_digest(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca [8 x i32], align 16
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca [32 x i8], align 16
  %11 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %5, ptr align 16 @__const.buffer_hash_sha256_digest.hashes, i64 32, i1 false)
  store i64 0, ptr %6, align 8
  br label %12

12:                                               ; preds = %50, %2
  %13 = load i64, ptr %6, align 8
  %14 = load i64, ptr %4, align 8
  %15 = icmp slt i64 %13, %14
  br i1 %15, label %16, label %53

16:                                               ; preds = %12
  %17 = load i64, ptr %6, align 8
  %18 = and i64 %17, 7
  %19 = trunc i64 %18 to i32
  store i32 %19, ptr %7, align 4
  %20 = load i32, ptr %7, align 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw [8 x i32], ptr %5, i64 0, i64 %21
  store ptr %22, ptr %8, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = load i32, ptr %23, align 4
  %25 = shl i32 %24, 5
  %26 = load ptr, ptr %8, align 8
  %27 = load i32, ptr %26, align 4
  %28 = add i32 %25, %27
  store i32 %28, ptr %9, align 4
  %29 = load i32, ptr %9, align 4
  %30 = load ptr, ptr %3, align 8
  %31 = load i64, ptr %6, align 8
  %32 = getelementptr inbounds i8, ptr %30, i64 %31
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = add i32 %29, %34
  store i32 %35, ptr %9, align 4
  %36 = load i32, ptr %9, align 4
  %37 = load ptr, ptr %8, align 8
  store i32 %36, ptr %37, align 4
  %38 = load ptr, ptr %8, align 8
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %8, align 8
  %41 = load i32, ptr %40, align 4
  %42 = shl i32 %41, 10
  %43 = add i32 %39, %42
  store i32 %43, ptr %9, align 4
  %44 = load i32, ptr %9, align 4
  %45 = load ptr, ptr %8, align 8
  %46 = load i32, ptr %45, align 4
  %47 = lshr i32 %46, 6
  %48 = xor i32 %44, %47
  %49 = load ptr, ptr %8, align 8
  store i32 %48, ptr %49, align 4
  br label %50

50:                                               ; preds = %16
  %51 = load i64, ptr %6, align 8
  %52 = add nsw i64 %51, 1
  store i64 %52, ptr %6, align 8
  br label %12, !llvm.loop !8

53:                                               ; preds = %12
  store i32 0, ptr %11, align 4
  br label %54

54:                                               ; preds = %104, %53
  %55 = load i32, ptr %11, align 4
  %56 = icmp slt i32 %55, 8
  br i1 %56, label %57, label %107

57:                                               ; preds = %54
  %58 = load i32, ptr %11, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  %62 = lshr i32 %61, 24
  %63 = and i32 %62, 255
  %64 = trunc i32 %63 to i8
  %65 = load i32, ptr %11, align 4
  %66 = mul nsw i32 %65, 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %67
  store i8 %64, ptr %68, align 1
  %69 = load i32, ptr %11, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = lshr i32 %72, 16
  %74 = and i32 %73, 255
  %75 = trunc i32 %74 to i8
  %76 = load i32, ptr %11, align 4
  %77 = mul nsw i32 %76, 4
  %78 = add nsw i32 %77, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %79
  store i8 %75, ptr %80, align 1
  %81 = load i32, ptr %11, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 %82
  %84 = load i32, ptr %83, align 4
  %85 = lshr i32 %84, 8
  %86 = and i32 %85, 255
  %87 = trunc i32 %86 to i8
  %88 = load i32, ptr %11, align 4
  %89 = mul nsw i32 %88, 4
  %90 = add nsw i32 %89, 2
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %91
  store i8 %87, ptr %92, align 1
  %93 = load i32, ptr %11, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [8 x i32], ptr %5, i64 0, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = and i32 %96, 255
  %98 = trunc i32 %97 to i8
  %99 = load i32, ptr %11, align 4
  %100 = mul nsw i32 %99, 4
  %101 = add nsw i32 %100, 3
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 %102
  store i8 %98, ptr %103, align 1
  br label %104

104:                                              ; preds = %57
  %105 = load i32, ptr %11, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %11, align 4
  br label %54, !llvm.loop !9

107:                                              ; preds = %54
  %108 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %109 = load i8, ptr %108, align 16
  %110 = zext i8 %109 to i32
  %111 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 1
  %112 = load i8, ptr %111, align 1
  %113 = zext i8 %112 to i32
  %114 = shl i32 %113, 8
  %115 = or i32 %110, %114
  %116 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 2
  %117 = load i8, ptr %116, align 2
  %118 = zext i8 %117 to i32
  %119 = shl i32 %118, 16
  %120 = or i32 %115, %119
  %121 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 3
  %122 = load i8, ptr %121, align 1
  %123 = zext i8 %122 to i32
  %124 = shl i32 %123, 24
  %125 = or i32 %120, %124
  ret i32 %125
}

define dso_local i32 @BufferHashSHA256_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @BufferHashSHA256_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BufferHashSHA256Data, ptr %7, i32 0, i32 0
  call void @buffer_hash_base_cleanup(ptr noundef %8)
  ret void
}

define internal void @buffer_hash_base_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %11, i32 0, i32 0
  store ptr null, ptr %12, align 8
  br label %13

13:                                               ; preds = %7, %1
  ret void
}

define dso_local ptr @BufferHashSHA256_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str)
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
  store ptr @BufferHashSHA256_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @BufferHashSHA256_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @BufferHashSHA256_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @BufferHashSHA256_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define dso_local void @BufferHashCRC32_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %8, i32 0, i32 0
  call void @buffer_hash_base_prepare(ptr noundef %7, ptr noundef @.str.1, ptr noundef %9)
  ret void
}

define dso_local void @BufferHashCRC32_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  %19 = call i32 @buffer_hash_crc32_digest(ptr noundef %14, i64 noundef %18)
  store i32 %19, ptr %6, align 4
  %20 = load i32, ptr %6, align 4
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 8
  %25 = add i32 %24, %20
  store i32 %25, ptr %23, align 8
  ret void
}

define internal i32 @buffer_hash_crc32_digest(ptr noundef %0, i64 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  store i32 -1, ptr %5, align 4
  store i64 0, ptr %6, align 8
  br label %8

8:                                                ; preds = %39, %2
  %9 = load i64, ptr %6, align 8
  %10 = load i64, ptr %4, align 8
  %11 = icmp slt i64 %9, %10
  br i1 %11, label %12, label %42

12:                                               ; preds = %8
  %13 = load i32, ptr %5, align 4
  %14 = load ptr, ptr %3, align 8
  %15 = load i64, ptr %6, align 8
  %16 = getelementptr inbounds i8, ptr %14, i64 %15
  %17 = load i8, ptr %16, align 1
  %18 = zext i8 %17 to i32
  %19 = xor i32 %13, %18
  store i32 %19, ptr %5, align 4
  store i32 0, ptr %7, align 4
  br label %20

20:                                               ; preds = %35, %12
  %21 = load i32, ptr %7, align 4
  %22 = icmp slt i32 %21, 8
  br i1 %22, label %23, label %38

23:                                               ; preds = %20
  %24 = load i32, ptr %5, align 4
  %25 = and i32 %24, 1
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %23
  %28 = load i32, ptr %5, align 4
  %29 = lshr i32 %28, 1
  %30 = xor i32 %29, -306674912
  store i32 %30, ptr %5, align 4
  br label %34

31:                                               ; preds = %23
  %32 = load i32, ptr %5, align 4
  %33 = lshr i32 %32, 1
  store i32 %33, ptr %5, align 4
  br label %34

34:                                               ; preds = %31, %27
  br label %35

35:                                               ; preds = %34
  %36 = load i32, ptr %7, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, ptr %7, align 4
  br label %20, !llvm.loop !10

38:                                               ; preds = %20
  br label %39

39:                                               ; preds = %38
  %40 = load i64, ptr %6, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, ptr %6, align 8
  br label %8, !llvm.loop !11

42:                                               ; preds = %8
  %43 = load i32, ptr %5, align 4
  %44 = xor i32 %43, -1
  ret i32 %44
}

define dso_local i32 @BufferHashCRC32_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.BufferHashBaseData, ptr %8, i32 0, i32 2
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @BufferHashCRC32_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BufferHashCRC32Data, ptr %7, i32 0, i32 0
  call void @buffer_hash_base_cleanup(ptr noundef %8)
  ret void
}

define dso_local ptr @BufferHashCRC32_create() {
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
  store ptr @BufferHashCRC32_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @BufferHashCRC32_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @BufferHashCRC32_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @BufferHashCRC32_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

declare i32 @Helper_next_int(i32 noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

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
