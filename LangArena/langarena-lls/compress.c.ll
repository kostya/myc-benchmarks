; ModuleID = 'c/src/compress.c'
source_filename = "c/src/compress.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BWTEncodeData = type { i64, ptr, i64, i32 }
%struct.BWTResult = type { ptr, i64, i64 }
%struct.BWTDecodeData = type { i64, ptr, i64, ptr, i64, %struct.BWTResult, i32 }
%struct.HuffEncodeData = type { i64, ptr, i64, %struct.EncodedResult, i32 }
%struct.EncodedResult = type { ptr, i64, i32, [256 x i32] }
%struct.HuffmanCodes = type { [256 x i32], [256 x i32] }
%struct.HuffDecodeData = type { i64, ptr, i64, ptr, i64, %struct.EncodedResult, i32 }
%struct.ArithEncodeData = type { i64, ptr, i64, i32 }
%struct.ArithEncodedResult = type { ptr, i64, i32, [256 x i32] }
%struct.ArithDecodeData = type { i64, ptr, i64, ptr, i64, %struct.ArithEncodedResult, i32 }
%struct.LZWEncodeData = type { i64, ptr, i64, i32 }
%struct.LZWResult = type { ptr, i64, i32 }
%struct.LZWDecodeData = type { i64, ptr, i64, ptr, i64, %struct.LZWResult, i32 }
%struct.Pair = type { i32, i32 }
%struct.HuffmanNode = type { i32, i8, i8, ptr, ptr }
%struct.ArithFreqTable = type { i32, [256 x i32], [256 x i32] }
%struct.BitOutputStream = type { i32, i32, ptr, i64, i64, i32 }
%struct.BitInputStream = type { ptr, i64, i64, i32, i8 }
%struct.DictEntry = type { ptr, i32, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [20 x i8] c"Compress::BWTEncode\00", align 1
@.str.1 = private unnamed_addr constant [20 x i8] c"Compress::BWTDecode\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"Compress::HuffEncode\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Compress::HuffDecode\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"Compress::ArithEncode\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"Compress::ArithDecode\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"Compress::LZWEncode\00", align 1
@.str.7 = private unnamed_addr constant [20 x i8] c"Compress::LZWDecode\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"ABRACADABRA\00", align 1

define dso_local ptr @BWTEncode_create() {
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
  store ptr @bwt_encode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @bwt_encode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @bwt_encode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @bwt_encode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define internal void @bwt_encode_prepare(ptr noundef %0) {
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
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.8)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %16, i32 0, i32 2
  %18 = call ptr @generate_test_data(i64 noundef %15, ptr noundef %17)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %19, i32 0, i32 1
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %21, i32 0, i32 3
  store i32 0, ptr %22, align 8
  ret void
}

define internal void @bwt_encode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.BWTResult, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %14, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  call void @bwt_transform(ptr dead_on_unwind writable sret(%struct.BWTResult) align 8 %6, ptr noundef %13, i64 noundef %16)
  %17 = getelementptr inbounds nuw %struct.BWTResult, ptr %6, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %33

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %21, i32 0, i32 3
  %23 = load i32, ptr %22, align 8
  %24 = getelementptr inbounds nuw %struct.BWTResult, ptr %6, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = add i32 %23, %26
  %28 = and i32 %27, -1
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %29, i32 0, i32 3
  store i32 %28, ptr %30, align 8
  %31 = getelementptr inbounds nuw %struct.BWTResult, ptr %6, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  call void @free(ptr noundef %32)
  br label %33

33:                                               ; preds = %20, %2
  ret void
}

define internal i32 @bwt_encode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define internal void @bwt_encode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.BWTEncodeData, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  %18 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %18)
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.Benchmark, ptr %19, i32 0, i32 11
  store ptr null, ptr %20, align 8
  ret void
}

define dso_local ptr @BWTDecode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 72, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @bwt_decode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @bwt_decode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @bwt_decode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @bwt_decode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define internal void @bwt_decode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.BWTResult, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i64 @Helper_config_i64(ptr noundef %10, ptr noundef @.str.8)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %12, i32 0, i32 0
  store i64 %11, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %17, i32 0, i32 2
  %19 = call ptr @generate_test_data(i64 noundef %16, ptr noundef %18)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %20, i32 0, i32 1
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %22, i32 0, i32 5
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %27, i32 0, i32 2
  %29 = load i64, ptr %28, align 8
  call void @bwt_transform(ptr dead_on_unwind writable sret(%struct.BWTResult) align 8 %4, ptr noundef %26, i64 noundef %29)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %4, i64 24, i1 false)
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %30, i32 0, i32 3
  store ptr null, ptr %31, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %32, i32 0, i32 4
  store i64 0, ptr %33, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %34, i32 0, i32 6
  store i32 0, ptr %35, align 8
  ret void
}

define internal void @bwt_decode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %18, i32 0, i32 3
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %21, i32 0, i32 5
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %23, i32 0, i32 4
  %25 = call ptr @bwt_inverse(ptr noundef %22, ptr noundef %24)
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %26, i32 0, i32 3
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %28, i32 0, i32 3
  %30 = load ptr, ptr %29, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %44

32:                                               ; preds = %20
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %33, i32 0, i32 6
  %35 = load i32, ptr %34, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %36, i32 0, i32 4
  %38 = load i64, ptr %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = add i32 %35, %39
  %41 = and i32 %40, -1
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %42, i32 0, i32 6
  store i32 %41, ptr %43, align 8
  br label %44

44:                                               ; preds = %32, %20
  ret void
}

define internal i32 @bwt_decode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %8, i32 0, i32 6
  %10 = load i32, ptr %9, align 8
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %11, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %45

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %45

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %21, i32 0, i32 4
  %23 = load i64, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %24, i32 0, i32 2
  %26 = load i64, ptr %25, align 8
  %27 = icmp eq i64 %23, %26
  br i1 %27, label %28, label %45

28:                                               ; preds = %20
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %35, i32 0, i32 2
  %37 = load i64, ptr %36, align 8
  %38 = call i32 @memcmp(ptr noundef %31, ptr noundef %34, i64 noundef %37)
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %28
  %41 = load i32, ptr %4, align 4
  %42 = add i32 %41, 100000
  %43 = and i32 %42, -1
  store i32 %43, ptr %4, align 4
  br label %44

44:                                               ; preds = %40, %28
  br label %45

45:                                               ; preds = %44, %20, %15, %1
  %46 = load i32, ptr %4, align 4
  ret i32 %46
}

define internal void @bwt_decode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %25, i32 0, i32 5
  %27 = getelementptr inbounds nuw %struct.BWTResult, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %35

30:                                               ; preds = %24
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.BWTDecodeData, ptr %31, i32 0, i32 5
  %33 = getelementptr inbounds nuw %struct.BWTResult, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  call void @free(ptr noundef %34)
  br label %35

35:                                               ; preds = %30, %24
  %36 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %36)
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 11
  store ptr null, ptr %38, align 8
  ret void
}

define dso_local ptr @HuffEncode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 1080)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 1080, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @huff_encode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @huff_encode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @huff_encode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @huff_encode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define internal void @huff_encode_prepare(ptr noundef %0) {
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
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.8)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %16, i32 0, i32 2
  %18 = call ptr @generate_test_data(i64 noundef %15, ptr noundef %17)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %19, i32 0, i32 1
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %21, i32 0, i32 4
  store i32 0, ptr %22, align 8
  ret void
}

define internal void @huff_encode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [256 x i32], align 16
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.HuffmanCodes, align 4
  %10 = alloca %struct.EncodedResult, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %15, i32 0, i32 3
  %17 = getelementptr inbounds nuw %struct.EncodedResult, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %28

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %21, i32 0, i32 3
  %23 = getelementptr inbounds nuw %struct.EncodedResult, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %24)
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %25, i32 0, i32 3
  %27 = getelementptr inbounds nuw %struct.EncodedResult, ptr %26, i32 0, i32 0
  store ptr null, ptr %27, align 8
  br label %28

28:                                               ; preds = %20, %2
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 1024, i1 false)
  store i64 0, ptr %7, align 8
  br label %29

29:                                               ; preds = %46, %28
  %30 = load i64, ptr %7, align 8
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %31, i32 0, i32 2
  %33 = load i64, ptr %32, align 8
  %34 = icmp ult i64 %30, %33
  br i1 %34, label %35, label %49

35:                                               ; preds = %29
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %36, i32 0, i32 1
  %38 = load ptr, ptr %37, align 8
  %39 = load i64, ptr %7, align 8
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 %39
  %41 = load i8, ptr %40, align 1
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds nuw [256 x i32], ptr %6, i64 0, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %43, align 4
  br label %46

46:                                               ; preds = %35
  %47 = load i64, ptr %7, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr %7, align 8
  br label %29, !llvm.loop !6

49:                                               ; preds = %29
  %50 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 0
  %51 = call ptr @build_huffman_tree(ptr noundef %50)
  store ptr %51, ptr %8, align 8
  %52 = load ptr, ptr %8, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %55, label %54

54:                                               ; preds = %49
  br label %86

55:                                               ; preds = %49
  call void @llvm.memset.p0.i64(ptr align 4 %9, i8 0, i64 2048, i1 false)
  %56 = load ptr, ptr %8, align 8
  call void @build_huffman_codes(ptr noundef %56, i32 noundef 0, i32 noundef 0, ptr noundef %9)
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %57, i32 0, i32 3
  %59 = load ptr, ptr %5, align 8
  %60 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %59, i32 0, i32 1
  %61 = load ptr, ptr %60, align 8
  %62 = load ptr, ptr %5, align 8
  %63 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %62, i32 0, i32 2
  %64 = load i64, ptr %63, align 8
  %65 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 0
  call void @huffman_encode(ptr dead_on_unwind writable sret(%struct.EncodedResult) align 8 %10, ptr noundef %61, i64 noundef %64, ptr noundef %9, ptr noundef %65)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %58, ptr align 8 %10, i64 1048, i1 false)
  %66 = load ptr, ptr %5, align 8
  %67 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %66, i32 0, i32 3
  %68 = getelementptr inbounds nuw %struct.EncodedResult, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = icmp ne ptr %69, null
  br i1 %70, label %71, label %84

71:                                               ; preds = %55
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %72, i32 0, i32 4
  %74 = load i32, ptr %73, align 8
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %75, i32 0, i32 3
  %77 = getelementptr inbounds nuw %struct.EncodedResult, ptr %76, i32 0, i32 1
  %78 = load i64, ptr %77, align 8
  %79 = trunc i64 %78 to i32
  %80 = add i32 %74, %79
  %81 = and i32 %80, -1
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %82, i32 0, i32 4
  store i32 %81, ptr %83, align 8
  br label %84

84:                                               ; preds = %71, %55
  %85 = load ptr, ptr %8, align 8
  call void @free_huffman_tree(ptr noundef %85)
  br label %86

86:                                               ; preds = %84, %54
  ret void
}

define internal i32 @huff_encode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %7, i32 0, i32 4
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define internal void @huff_encode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %15, i32 0, i32 1
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %18, i32 0, i32 3
  %20 = getelementptr inbounds nuw %struct.EncodedResult, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %31

23:                                               ; preds = %17
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %24, i32 0, i32 3
  %26 = getelementptr inbounds nuw %struct.EncodedResult, ptr %25, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %27)
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %28, i32 0, i32 3
  %30 = getelementptr inbounds nuw %struct.EncodedResult, ptr %29, i32 0, i32 0
  store ptr null, ptr %30, align 8
  br label %31

31:                                               ; preds = %23, %17
  %32 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %32)
  %33 = load ptr, ptr %2, align 8
  %34 = getelementptr inbounds nuw %struct.Benchmark, ptr %33, i32 0, i32 11
  store ptr null, ptr %34, align 8
  ret void
}

define dso_local ptr @HuffDecode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 1096)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 1096, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @huff_decode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @huff_decode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @huff_decode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @huff_decode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define internal void @huff_decode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [256 x i32], align 16
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca %struct.HuffmanCodes, align 4
  %9 = alloca %struct.EncodedResult, align 8
  store ptr %0, ptr %2, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %3, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call i64 @Helper_config_i64(ptr noundef %15, ptr noundef @.str.8)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %17, i32 0, i32 0
  store i64 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %19, i32 0, i32 0
  %21 = load i64, ptr %20, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %22, i32 0, i32 2
  %24 = call ptr @generate_test_data(i64 noundef %21, ptr noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %25, i32 0, i32 1
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %27, i32 0, i32 6
  store i32 0, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %29, i32 0, i32 3
  store ptr null, ptr %30, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %31, i32 0, i32 4
  store i64 0, ptr %32, align 8
  %33 = call noalias ptr @malloc(i64 noundef 1080)
  store ptr %33, ptr %4, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %34, i32 0, i32 0
  %36 = load i64, ptr %35, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %37, i32 0, i32 0
  store i64 %36, ptr %38, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %42, i32 0, i32 1
  store ptr %41, ptr %43, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %44, i32 0, i32 2
  %46 = load i64, ptr %45, align 8
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds nuw %struct.HuffEncodeData, ptr %47, i32 0, i32 2
  store i64 %46, ptr %48, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %5, i8 0, i64 1024, i1 false)
  store i64 0, ptr %6, align 8
  br label %49

49:                                               ; preds = %66, %1
  %50 = load i64, ptr %6, align 8
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %51, i32 0, i32 2
  %53 = load i64, ptr %52, align 8
  %54 = icmp ult i64 %50, %53
  br i1 %54, label %55, label %69

55:                                               ; preds = %49
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %56, i32 0, i32 1
  %58 = load ptr, ptr %57, align 8
  %59 = load i64, ptr %6, align 8
  %60 = getelementptr inbounds nuw i8, ptr %58, i64 %59
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i64
  %63 = getelementptr inbounds nuw [256 x i32], ptr %5, i64 0, i64 %62
  %64 = load i32, ptr %63, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %63, align 4
  br label %66

66:                                               ; preds = %55
  %67 = load i64, ptr %6, align 8
  %68 = add i64 %67, 1
  store i64 %68, ptr %6, align 8
  br label %49, !llvm.loop !8

69:                                               ; preds = %49
  %70 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 0
  %71 = call ptr @build_huffman_tree(ptr noundef %70)
  store ptr %71, ptr %7, align 8
  %72 = load ptr, ptr %7, align 8
  %73 = icmp ne ptr %72, null
  br i1 %73, label %74, label %86

74:                                               ; preds = %69
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 2048, i1 false)
  %75 = load ptr, ptr %7, align 8
  call void @build_huffman_codes(ptr noundef %75, i32 noundef 0, i32 noundef 0, ptr noundef %8)
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %76, i32 0, i32 5
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %78, i32 0, i32 1
  %80 = load ptr, ptr %79, align 8
  %81 = load ptr, ptr %3, align 8
  %82 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %81, i32 0, i32 2
  %83 = load i64, ptr %82, align 8
  %84 = getelementptr inbounds [256 x i32], ptr %5, i64 0, i64 0
  call void @huffman_encode(ptr dead_on_unwind writable sret(%struct.EncodedResult) align 8 %9, ptr noundef %80, i64 noundef %83, ptr noundef %8, ptr noundef %84)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %77, ptr align 8 %9, i64 1048, i1 false)
  %85 = load ptr, ptr %7, align 8
  call void @free_huffman_tree(ptr noundef %85)
  br label %86

86:                                               ; preds = %74, %69
  %87 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %87)
  ret void
}

define internal void @huff_decode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %11, i32 0, i32 5
  %13 = getelementptr inbounds nuw %struct.EncodedResult, ptr %12, i32 0, i32 3
  %14 = getelementptr inbounds [256 x i32], ptr %13, i64 0, i64 0
  %15 = call ptr @build_huffman_tree(ptr noundef %14)
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %19, label %18

18:                                               ; preds = %2
  br label %65

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %20, i32 0, i32 3
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %28

24:                                               ; preds = %19
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %25, i32 0, i32 3
  %27 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %27)
  br label %28

28:                                               ; preds = %24, %19
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %29, i32 0, i32 5
  %31 = getelementptr inbounds nuw %struct.EncodedResult, ptr %30, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %33, i32 0, i32 5
  %35 = getelementptr inbounds nuw %struct.EncodedResult, ptr %34, i32 0, i32 1
  %36 = load i64, ptr %35, align 8
  %37 = load ptr, ptr %6, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %38, i32 0, i32 5
  %40 = getelementptr inbounds nuw %struct.EncodedResult, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %40, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %42, i32 0, i32 4
  %44 = call ptr @huffman_decode(ptr noundef %32, i64 noundef %36, ptr noundef %37, i32 noundef %41, ptr noundef %43)
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %45, i32 0, i32 3
  store ptr %44, ptr %46, align 8
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %47, i32 0, i32 3
  %49 = load ptr, ptr %48, align 8
  %50 = icmp ne ptr %49, null
  br i1 %50, label %51, label %63

51:                                               ; preds = %28
  %52 = load ptr, ptr %5, align 8
  %53 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %52, i32 0, i32 6
  %54 = load i32, ptr %53, align 8
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %55, i32 0, i32 4
  %57 = load i64, ptr %56, align 8
  %58 = trunc i64 %57 to i32
  %59 = add i32 %54, %58
  %60 = and i32 %59, -1
  %61 = load ptr, ptr %5, align 8
  %62 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %61, i32 0, i32 6
  store i32 %60, ptr %62, align 8
  br label %63

63:                                               ; preds = %51, %28
  %64 = load ptr, ptr %6, align 8
  call void @free_huffman_tree(ptr noundef %64)
  br label %65

65:                                               ; preds = %63, %18
  ret void
}

define internal i32 @huff_decode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %8, i32 0, i32 6
  %10 = load i32, ptr %9, align 8
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %11, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %45

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %45

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %21, i32 0, i32 4
  %23 = load i64, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %24, i32 0, i32 2
  %26 = load i64, ptr %25, align 8
  %27 = icmp eq i64 %23, %26
  br i1 %27, label %28, label %45

28:                                               ; preds = %20
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %35, i32 0, i32 2
  %37 = load i64, ptr %36, align 8
  %38 = call i32 @memcmp(ptr noundef %31, ptr noundef %34, i64 noundef %37)
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %28
  %41 = load i32, ptr %4, align 4
  %42 = add i32 %41, 100000
  %43 = and i32 %42, -1
  store i32 %43, ptr %4, align 4
  br label %44

44:                                               ; preds = %40, %28
  br label %45

45:                                               ; preds = %44, %20, %15, %1
  %46 = load i32, ptr %4, align 4
  ret i32 %46
}

define internal void @huff_decode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %25, i32 0, i32 5
  %27 = getelementptr inbounds nuw %struct.EncodedResult, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %35

30:                                               ; preds = %24
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.HuffDecodeData, ptr %31, i32 0, i32 5
  %33 = getelementptr inbounds nuw %struct.EncodedResult, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  call void @free(ptr noundef %34)
  br label %35

35:                                               ; preds = %30, %24
  %36 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %36)
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 11
  store ptr null, ptr %38, align 8
  ret void
}

define dso_local ptr @ArithEncode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @Benchmark_create(ptr noundef @.str.4)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %28

8:                                                ; preds = %0
  %9 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %28

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %15, i8 0, i64 32, i1 false)
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 11
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.Benchmark, ptr %19, i32 0, i32 3
  store ptr @arith_encode_prepare, ptr %20, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 4
  store ptr @arith_encode_run, ptr %22, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.Benchmark, ptr %23, i32 0, i32 7
  store ptr @arith_encode_checksum, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 10
  store ptr @arith_encode_cleanup, ptr %26, align 8
  %27 = load ptr, ptr %2, align 8
  store ptr %27, ptr %1, align 8
  br label %28

28:                                               ; preds = %14, %12, %7
  %29 = load ptr, ptr %1, align 8
  ret ptr %29
}

declare void @free(ptr noundef)

define internal void @arith_encode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %1
  br label %46

10:                                               ; preds = %1
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = call i64 @Helper_config_i64(ptr noundef %13, ptr noundef @.str.8)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %15, i32 0, i32 0
  store i64 %14, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %17, i32 0, i32 0
  %19 = load i64, ptr %18, align 8
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %24

21:                                               ; preds = %10
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %22, i32 0, i32 0
  store i64 1000, ptr %23, align 8
  br label %24

24:                                               ; preds = %21, %10
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %35

29:                                               ; preds = %24
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  call void @free(ptr noundef %32)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %33, i32 0, i32 1
  store ptr null, ptr %34, align 8
  br label %35

35:                                               ; preds = %29, %24
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %36, i32 0, i32 0
  %38 = load i64, ptr %37, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %39, i32 0, i32 2
  %41 = call ptr @generate_test_data(i64 noundef %38, ptr noundef %40)
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %42, i32 0, i32 1
  store ptr %41, ptr %43, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %44, i32 0, i32 3
  store i32 0, ptr %45, align 8
  br label %46

46:                                               ; preds = %35, %9
  ret void
}

define internal void @arith_encode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.ArithEncodedResult, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %18

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %14, i32 0, i32 1
  %16 = load ptr, ptr %15, align 8
  %17 = icmp ne ptr %16, null
  br i1 %17, label %19, label %18

18:                                               ; preds = %13, %2
  br label %42

19:                                               ; preds = %13
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %23, i32 0, i32 2
  %25 = load i64, ptr %24, align 8
  call void @arith_encode(ptr dead_on_unwind writable sret(%struct.ArithEncodedResult) align 8 %6, ptr noundef %22, i64 noundef %25)
  %26 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %6, i32 0, i32 0
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %42

29:                                               ; preds = %19
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %30, i32 0, i32 3
  %32 = load i32, ptr %31, align 8
  %33 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %6, i32 0, i32 1
  %34 = load i64, ptr %33, align 8
  %35 = trunc i64 %34 to i32
  %36 = add i32 %32, %35
  %37 = and i32 %36, -1
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %38, i32 0, i32 3
  store i32 %37, ptr %39, align 8
  %40 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %6, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  call void @free(ptr noundef %41)
  br label %42

42:                                               ; preds = %18, %29, %19
  ret void
}

define internal i32 @arith_encode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %13

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %10, i32 0, i32 3
  %12 = load i32, ptr %11, align 8
  br label %14

13:                                               ; preds = %1
  br label %14

14:                                               ; preds = %13, %9
  %15 = phi i32 [ %12, %9 ], [ 0, %13 ]
  ret i32 %15
}

define internal void @arith_encode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %20

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %18

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.ArithEncodeData, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  br label %18

18:                                               ; preds = %14, %9
  %19 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %19)
  br label %20

20:                                               ; preds = %18, %1
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 11
  store ptr null, ptr %22, align 8
  ret void
}

define dso_local ptr @ArithDecode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @Benchmark_create(ptr noundef @.str.5)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %28

8:                                                ; preds = %0
  %9 = call noalias ptr @malloc(i64 noundef 1096)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %28

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %15, i8 0, i64 1096, i1 false)
  %16 = load ptr, ptr %3, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 11
  store ptr %16, ptr %18, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.Benchmark, ptr %19, i32 0, i32 3
  store ptr @arith_decode_prepare, ptr %20, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 4
  store ptr @arith_decode_run, ptr %22, align 8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.Benchmark, ptr %23, i32 0, i32 7
  store ptr @arith_decode_checksum, ptr %24, align 8
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.Benchmark, ptr %25, i32 0, i32 10
  store ptr @arith_decode_cleanup, ptr %26, align 8
  %27 = load ptr, ptr %2, align 8
  store ptr %27, ptr %1, align 8
  br label %28

28:                                               ; preds = %14, %12, %7
  %29 = load ptr, ptr %1, align 8
  ret ptr %29
}

define internal void @arith_decode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.ArithEncodedResult, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %11, label %10

10:                                               ; preds = %1
  br label %85

11:                                               ; preds = %1
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = call i64 @Helper_config_i64(ptr noundef %14, ptr noundef @.str.8)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %16, i32 0, i32 0
  store i64 %15, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %18, i32 0, i32 0
  %20 = load i64, ptr %19, align 8
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %11
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %23, i32 0, i32 0
  store i64 1000, ptr %24, align 8
  br label %25

25:                                               ; preds = %22, %11
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %26, i32 0, i32 1
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %36

30:                                               ; preds = %25
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %31, i32 0, i32 1
  %33 = load ptr, ptr %32, align 8
  call void @free(ptr noundef %33)
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %34, i32 0, i32 1
  store ptr null, ptr %35, align 8
  br label %36

36:                                               ; preds = %30, %25
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %37, i32 0, i32 0
  %39 = load i64, ptr %38, align 8
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %40, i32 0, i32 2
  %42 = call ptr @generate_test_data(i64 noundef %39, ptr noundef %41)
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %43, i32 0, i32 1
  store ptr %42, ptr %44, align 8
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %45, i32 0, i32 5
  %47 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %46, i32 0, i32 0
  %48 = load ptr, ptr %47, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %50, label %57

50:                                               ; preds = %36
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %51, i32 0, i32 5
  %53 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  call void @free(ptr noundef %54)
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %55, i32 0, i32 5
  call void @llvm.memset.p0.i64(ptr align 8 %56, i8 0, i64 1048, i1 false)
  br label %57

57:                                               ; preds = %50, %36
  %58 = load ptr, ptr %3, align 8
  %59 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %58, i32 0, i32 5
  %60 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %59, i32 0, i32 0
  %61 = load ptr, ptr %60, align 8
  %62 = icmp ne ptr %61, null
  br i1 %62, label %63, label %70

63:                                               ; preds = %57
  %64 = load ptr, ptr %3, align 8
  %65 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %64, i32 0, i32 5
  %66 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %65, i32 0, i32 0
  %67 = load ptr, ptr %66, align 8
  call void @free(ptr noundef %67)
  %68 = load ptr, ptr %3, align 8
  %69 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %68, i32 0, i32 5
  call void @llvm.memset.p0.i64(ptr align 8 %69, i8 0, i64 1048, i1 false)
  br label %70

70:                                               ; preds = %63, %57
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %71, i32 0, i32 5
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = load ptr, ptr %3, align 8
  %77 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %76, i32 0, i32 2
  %78 = load i64, ptr %77, align 8
  call void @arith_encode(ptr dead_on_unwind writable sret(%struct.ArithEncodedResult) align 8 %4, ptr noundef %75, i64 noundef %78)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %72, ptr align 8 %4, i64 1048, i1 false)
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %79, i32 0, i32 3
  store ptr null, ptr %80, align 8
  %81 = load ptr, ptr %3, align 8
  %82 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %81, i32 0, i32 4
  store i64 0, ptr %82, align 8
  %83 = load ptr, ptr %3, align 8
  %84 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %83, i32 0, i32 6
  store i32 0, ptr %84, align 8
  br label %85

85:                                               ; preds = %70, %10
  ret void
}

define internal void @arith_decode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %18, i32 0, i32 3
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %21, i32 0, i32 5
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %23, i32 0, i32 4
  %25 = call ptr @arith_decode(ptr noundef %22, ptr noundef %24)
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %26, i32 0, i32 3
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %28, i32 0, i32 3
  %30 = load ptr, ptr %29, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %44

32:                                               ; preds = %20
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %33, i32 0, i32 6
  %35 = load i32, ptr %34, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %36, i32 0, i32 4
  %38 = load i64, ptr %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = add i32 %35, %39
  %41 = and i32 %40, -1
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %42, i32 0, i32 6
  store i32 %41, ptr %43, align 8
  br label %44

44:                                               ; preds = %32, %20
  ret void
}

define internal i32 @arith_decode_checksum(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %1
  store i32 0, ptr %2, align 4
  br label %52

12:                                               ; preds = %1
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %13, i32 0, i32 6
  %15 = load i32, ptr %14, align 8
  store i32 %15, ptr %5, align 4
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %50

20:                                               ; preds = %12
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %50

25:                                               ; preds = %20
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %26, i32 0, i32 4
  %28 = load i64, ptr %27, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %29, i32 0, i32 2
  %31 = load i64, ptr %30, align 8
  %32 = icmp eq i64 %28, %31
  br i1 %32, label %33, label %50

33:                                               ; preds = %25
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %34, i32 0, i32 3
  %36 = load ptr, ptr %35, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %40, i32 0, i32 2
  %42 = load i64, ptr %41, align 8
  %43 = call i32 @memcmp(ptr noundef %36, ptr noundef %39, i64 noundef %42)
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %33
  %46 = load i32, ptr %5, align 4
  %47 = add i32 %46, 100000
  %48 = and i32 %47, -1
  store i32 %48, ptr %5, align 4
  br label %49

49:                                               ; preds = %45, %33
  br label %50

50:                                               ; preds = %49, %25, %20, %12
  %51 = load i32, ptr %5, align 4
  store i32 %51, ptr %2, align 4
  br label %52

52:                                               ; preds = %50, %11
  %53 = load i32, ptr %2, align 4
  ret i32 %53
}

define internal void @arith_decode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = icmp ne ptr %7, null
  br i1 %8, label %9, label %40

9:                                                ; preds = %1
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %18

14:                                               ; preds = %9
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  br label %18

18:                                               ; preds = %14, %9
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %19, i32 0, i32 3
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %27

23:                                               ; preds = %18
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  call void @free(ptr noundef %26)
  br label %27

27:                                               ; preds = %23, %18
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %28, i32 0, i32 5
  %30 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %38

33:                                               ; preds = %27
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.ArithDecodeData, ptr %34, i32 0, i32 5
  %36 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %35, i32 0, i32 0
  %37 = load ptr, ptr %36, align 8
  call void @free(ptr noundef %37)
  br label %38

38:                                               ; preds = %33, %27
  %39 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %39)
  br label %40

40:                                               ; preds = %38, %1
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.Benchmark, ptr %41, i32 0, i32 11
  store ptr null, ptr %42, align 8
  ret void
}

define dso_local ptr @LZWEncode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.6)
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
  store ptr @lzw_encode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @lzw_encode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @lzw_encode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @lzw_encode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define internal void @lzw_encode_prepare(ptr noundef %0) {
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
  %10 = call i64 @Helper_config_i64(ptr noundef %9, ptr noundef @.str.8)
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %11, i32 0, i32 0
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %13, i32 0, i32 0
  %15 = load i64, ptr %14, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %16, i32 0, i32 2
  %18 = call ptr @generate_test_data(i64 noundef %15, ptr noundef %17)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %19, i32 0, i32 1
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %21, i32 0, i32 3
  store i32 0, ptr %22, align 8
  ret void
}

define internal void @lzw_encode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.LZWResult, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 11
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %5, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %14, i32 0, i32 2
  %16 = load i64, ptr %15, align 8
  call void @lzw_encode(ptr dead_on_unwind writable sret(%struct.LZWResult) align 8 %6, ptr noundef %13, i64 noundef %16)
  %17 = getelementptr inbounds nuw %struct.LZWResult, ptr %6, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %33

20:                                               ; preds = %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %21, i32 0, i32 3
  %23 = load i32, ptr %22, align 8
  %24 = getelementptr inbounds nuw %struct.LZWResult, ptr %6, i32 0, i32 1
  %25 = load i64, ptr %24, align 8
  %26 = trunc i64 %25 to i32
  %27 = add i32 %23, %26
  %28 = and i32 %27, -1
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %29, i32 0, i32 3
  store i32 %28, ptr %30, align 8
  %31 = getelementptr inbounds nuw %struct.LZWResult, ptr %6, i32 0, i32 0
  %32 = load ptr, ptr %31, align 8
  call void @free(ptr noundef %32)
  br label %33

33:                                               ; preds = %20, %2
  ret void
}

define internal i32 @lzw_encode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define internal void @lzw_encode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.LZWEncodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 11
  store ptr null, ptr %18, align 8
  ret void
}

define dso_local ptr @LZWDecode_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.7)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 72, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @lzw_decode_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @lzw_decode_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @lzw_decode_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @lzw_decode_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define internal void @lzw_decode_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.LZWResult, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i64 @Helper_config_i64(ptr noundef %10, ptr noundef @.str.8)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %12, i32 0, i32 0
  store i64 %11, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %14, i32 0, i32 0
  %16 = load i64, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %17, i32 0, i32 2
  %19 = call ptr @generate_test_data(i64 noundef %16, ptr noundef %18)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %20, i32 0, i32 1
  store ptr %19, ptr %21, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %22, i32 0, i32 5
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %24, i32 0, i32 1
  %26 = load ptr, ptr %25, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %27, i32 0, i32 2
  %29 = load i64, ptr %28, align 8
  call void @lzw_encode(ptr dead_on_unwind writable sret(%struct.LZWResult) align 8 %4, ptr noundef %26, i64 noundef %29)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %23, ptr align 8 %4, i64 24, i1 false)
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %30, i32 0, i32 3
  store ptr null, ptr %31, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %32, i32 0, i32 4
  store i64 0, ptr %33, align 8
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %34, i32 0, i32 6
  store i32 0, ptr %35, align 8
  ret void
}

define internal void @lzw_decode_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %15, i32 0, i32 3
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %18, i32 0, i32 3
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %21, i32 0, i32 5
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %23, i32 0, i32 4
  %25 = call ptr @lzw_decode(ptr noundef %22, ptr noundef %24)
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %26, i32 0, i32 3
  store ptr %25, ptr %27, align 8
  %28 = load ptr, ptr %5, align 8
  %29 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %28, i32 0, i32 3
  %30 = load ptr, ptr %29, align 8
  %31 = icmp ne ptr %30, null
  br i1 %31, label %32, label %44

32:                                               ; preds = %20
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %33, i32 0, i32 6
  %35 = load i32, ptr %34, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %36, i32 0, i32 4
  %38 = load i64, ptr %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = add i32 %35, %39
  %41 = and i32 %40, -1
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %42, i32 0, i32 6
  store i32 %41, ptr %43, align 8
  br label %44

44:                                               ; preds = %32, %20
  ret void
}

define internal i32 @lzw_decode_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %8, i32 0, i32 6
  %10 = load i32, ptr %9, align 8
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %11, i32 0, i32 3
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %45

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %16, i32 0, i32 1
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %45

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %21, i32 0, i32 4
  %23 = load i64, ptr %22, align 8
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %24, i32 0, i32 2
  %26 = load i64, ptr %25, align 8
  %27 = icmp eq i64 %23, %26
  br i1 %27, label %28, label %45

28:                                               ; preds = %20
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %35, i32 0, i32 2
  %37 = load i64, ptr %36, align 8
  %38 = call i32 @memcmp(ptr noundef %31, ptr noundef %34, i64 noundef %37)
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %44

40:                                               ; preds = %28
  %41 = load i32, ptr %4, align 4
  %42 = add i32 %41, 100000
  %43 = and i32 %42, -1
  store i32 %43, ptr %4, align 4
  br label %44

44:                                               ; preds = %40, %28
  br label %45

45:                                               ; preds = %44, %20, %15, %1
  %46 = load i32, ptr %4, align 4
  ret i32 %46
}

define internal void @lzw_decode_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %12, i32 0, i32 1
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %25, i32 0, i32 5
  %27 = getelementptr inbounds nuw %struct.LZWResult, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %35

30:                                               ; preds = %24
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.LZWDecodeData, ptr %31, i32 0, i32 5
  %33 = getelementptr inbounds nuw %struct.LZWResult, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  call void @free(ptr noundef %34)
  br label %35

35:                                               ; preds = %30, %24
  %36 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %36)
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.Benchmark, ptr %37, i32 0, i32 11
  store ptr null, ptr %38, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @generate_test_data(i64 noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  store i64 %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr @.str.9, ptr %6, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call i64 @strlen(ptr noundef %10)
  store i64 %11, ptr %7, align 8
  %12 = load i64, ptr %4, align 8
  %13 = call noalias ptr @malloc(i64 noundef %12)
  store ptr %13, ptr %8, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %18, label %16

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8
  store i64 0, ptr %17, align 8
  store ptr null, ptr %3, align 8
  br label %40

18:                                               ; preds = %2
  %19 = load i64, ptr %4, align 8
  %20 = load ptr, ptr %5, align 8
  store i64 %19, ptr %20, align 8
  store i64 0, ptr %9, align 8
  br label %21

21:                                               ; preds = %35, %18
  %22 = load i64, ptr %9, align 8
  %23 = load i64, ptr %4, align 8
  %24 = icmp slt i64 %22, %23
  br i1 %24, label %25, label %38

25:                                               ; preds = %21
  %26 = load ptr, ptr %6, align 8
  %27 = load i64, ptr %9, align 8
  %28 = load i64, ptr %7, align 8
  %29 = urem i64 %27, %28
  %30 = getelementptr inbounds nuw i8, ptr %26, i64 %29
  %31 = load i8, ptr %30, align 1
  %32 = load ptr, ptr %8, align 8
  %33 = load i64, ptr %9, align 8
  %34 = getelementptr inbounds i8, ptr %32, i64 %33
  store i8 %31, ptr %34, align 1
  br label %35

35:                                               ; preds = %25
  %36 = load i64, ptr %9, align 8
  %37 = add nsw i64 %36, 1
  store i64 %37, ptr %9, align 8
  br label %21, !llvm.loop !9

38:                                               ; preds = %21
  %39 = load ptr, ptr %8, align 8
  store ptr %39, ptr %3, align 8
  br label %40

40:                                               ; preds = %38, %16
  %41 = load ptr, ptr %3, align 8
  ret ptr %41
}

declare i64 @strlen(ptr noundef)

define internal void @bwt_transform(ptr dead_on_unwind noalias writable sret(%struct.BWTResult) align 8 %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [256 x i64], align 16
  %11 = alloca i64, align 8
  %12 = alloca [256 x i64], align 16
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i8, align 1
  %17 = alloca ptr, align 8
  %18 = alloca i32, align 4
  %19 = alloca i8, align 1
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i8, align 1
  %23 = alloca i64, align 8
  %24 = alloca ptr, align 8
  %25 = alloca i64, align 8
  %26 = alloca ptr, align 8
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca ptr, align 8
  %36 = alloca i64, align 8
  %37 = alloca %struct.Pair, align 4
  %38 = alloca %struct.Pair, align 4
  %39 = alloca i64, align 8
  %40 = alloca i64, align 8
  store ptr %1, ptr %4, align 8
  store i64 %2, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 24, i1 false)
  %41 = load i64, ptr %5, align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %3
  %44 = load ptr, ptr %4, align 8
  %45 = icmp ne ptr %44, null
  br i1 %45, label %47, label %46

46:                                               ; preds = %43, %3
  br label %508

47:                                               ; preds = %43
  %48 = load i64, ptr %5, align 8
  %49 = mul i64 %48, 2
  %50 = call noalias ptr @malloc(i64 noundef %49)
  store ptr %50, ptr %6, align 8
  %51 = load ptr, ptr %6, align 8
  %52 = load ptr, ptr %4, align 8
  %53 = load i64, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %51, ptr align 1 %52, i64 %53, i1 false)
  %54 = load ptr, ptr %6, align 8
  %55 = load i64, ptr %5, align 8
  %56 = getelementptr inbounds nuw i8, ptr %54, i64 %55
  %57 = load ptr, ptr %4, align 8
  %58 = load i64, ptr %5, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %56, ptr align 1 %57, i64 %58, i1 false)
  %59 = load i64, ptr %5, align 8
  %60 = mul i64 8, %59
  %61 = call noalias ptr @malloc(i64 noundef %60)
  store ptr %61, ptr %7, align 8
  store i64 0, ptr %8, align 8
  br label %62

62:                                               ; preds = %71, %47
  %63 = load i64, ptr %8, align 8
  %64 = load i64, ptr %5, align 8
  %65 = icmp ult i64 %63, %64
  br i1 %65, label %66, label %74

66:                                               ; preds = %62
  %67 = load i64, ptr %8, align 8
  %68 = load ptr, ptr %7, align 8
  %69 = load i64, ptr %8, align 8
  %70 = getelementptr inbounds nuw i64, ptr %68, i64 %69
  store i64 %67, ptr %70, align 8
  br label %71

71:                                               ; preds = %66
  %72 = load i64, ptr %8, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr %8, align 8
  br label %62, !llvm.loop !10

74:                                               ; preds = %62
  %75 = load i64, ptr %5, align 8
  %76 = mul i64 8, %75
  %77 = call noalias ptr @malloc(i64 noundef %76)
  store ptr %77, ptr %9, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %10, i8 0, i64 2048, i1 false)
  store i64 0, ptr %11, align 8
  br label %78

78:                                               ; preds = %94, %74
  %79 = load i64, ptr %11, align 8
  %80 = load i64, ptr %5, align 8
  %81 = icmp ult i64 %79, %80
  br i1 %81, label %82, label %97

82:                                               ; preds = %78
  %83 = load ptr, ptr %4, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = load i64, ptr %11, align 8
  %86 = getelementptr inbounds nuw i64, ptr %84, i64 %85
  %87 = load i64, ptr %86, align 8
  %88 = getelementptr inbounds nuw i8, ptr %83, i64 %87
  %89 = load i8, ptr %88, align 1
  %90 = zext i8 %89 to i64
  %91 = getelementptr inbounds nuw [256 x i64], ptr %10, i64 0, i64 %90
  %92 = load i64, ptr %91, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr %91, align 8
  br label %94

94:                                               ; preds = %82
  %95 = load i64, ptr %11, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr %11, align 8
  br label %78, !llvm.loop !11

97:                                               ; preds = %78
  store i64 0, ptr %13, align 8
  store i32 0, ptr %14, align 4
  br label %98

98:                                               ; preds = %112, %97
  %99 = load i32, ptr %14, align 4
  %100 = icmp slt i32 %99, 256
  br i1 %100, label %101, label %115

101:                                              ; preds = %98
  %102 = load i64, ptr %13, align 8
  %103 = load i32, ptr %14, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [256 x i64], ptr %12, i64 0, i64 %104
  store i64 %102, ptr %105, align 8
  %106 = load i32, ptr %14, align 4
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [256 x i64], ptr %10, i64 0, i64 %107
  %109 = load i64, ptr %108, align 8
  %110 = load i64, ptr %13, align 8
  %111 = add i64 %110, %109
  store i64 %111, ptr %13, align 8
  br label %112

112:                                              ; preds = %101
  %113 = load i32, ptr %14, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %14, align 4
  br label %98, !llvm.loop !12

115:                                              ; preds = %98
  store i64 0, ptr %15, align 8
  br label %116

116:                                              ; preds = %139, %115
  %117 = load i64, ptr %15, align 8
  %118 = load i64, ptr %5, align 8
  %119 = icmp ult i64 %117, %118
  br i1 %119, label %120, label %142

120:                                              ; preds = %116
  %121 = load ptr, ptr %4, align 8
  %122 = load ptr, ptr %7, align 8
  %123 = load i64, ptr %15, align 8
  %124 = getelementptr inbounds nuw i64, ptr %122, i64 %123
  %125 = load i64, ptr %124, align 8
  %126 = getelementptr inbounds nuw i8, ptr %121, i64 %125
  %127 = load i8, ptr %126, align 1
  store i8 %127, ptr %16, align 1
  %128 = load ptr, ptr %7, align 8
  %129 = load i64, ptr %15, align 8
  %130 = getelementptr inbounds nuw i64, ptr %128, i64 %129
  %131 = load i64, ptr %130, align 8
  %132 = load ptr, ptr %9, align 8
  %133 = load i8, ptr %16, align 1
  %134 = zext i8 %133 to i64
  %135 = getelementptr inbounds nuw [256 x i64], ptr %12, i64 0, i64 %134
  %136 = load i64, ptr %135, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr %135, align 8
  %138 = getelementptr inbounds nuw i64, ptr %132, i64 %136
  store i64 %131, ptr %138, align 8
  br label %139

139:                                              ; preds = %120
  %140 = load i64, ptr %15, align 8
  %141 = add i64 %140, 1
  store i64 %141, ptr %15, align 8
  br label %116, !llvm.loop !13

142:                                              ; preds = %116
  %143 = load ptr, ptr %7, align 8
  %144 = load ptr, ptr %9, align 8
  %145 = load i64, ptr %5, align 8
  %146 = mul i64 8, %145
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %143, ptr align 8 %144, i64 %146, i1 false)
  %147 = load i64, ptr %5, align 8
  %148 = icmp ugt i64 %147, 1
  br i1 %148, label %149, label %460

149:                                              ; preds = %142
  %150 = load i64, ptr %5, align 8
  %151 = mul i64 4, %150
  %152 = call noalias ptr @malloc(i64 noundef %151)
  store ptr %152, ptr %17, align 8
  store i32 0, ptr %18, align 4
  %153 = load ptr, ptr %4, align 8
  %154 = load ptr, ptr %7, align 8
  %155 = getelementptr inbounds i64, ptr %154, i64 0
  %156 = load i64, ptr %155, align 8
  %157 = getelementptr inbounds nuw i8, ptr %153, i64 %156
  %158 = load i8, ptr %157, align 1
  store i8 %158, ptr %19, align 1
  store i64 0, ptr %20, align 8
  br label %159

159:                                              ; preds = %186, %149
  %160 = load i64, ptr %20, align 8
  %161 = load i64, ptr %5, align 8
  %162 = icmp ult i64 %160, %161
  br i1 %162, label %163, label %189

163:                                              ; preds = %159
  %164 = load ptr, ptr %7, align 8
  %165 = load i64, ptr %20, align 8
  %166 = getelementptr inbounds nuw i64, ptr %164, i64 %165
  %167 = load i64, ptr %166, align 8
  store i64 %167, ptr %21, align 8
  %168 = load ptr, ptr %4, align 8
  %169 = load i64, ptr %21, align 8
  %170 = getelementptr inbounds nuw i8, ptr %168, i64 %169
  %171 = load i8, ptr %170, align 1
  store i8 %171, ptr %22, align 1
  %172 = load i8, ptr %22, align 1
  %173 = zext i8 %172 to i32
  %174 = load i8, ptr %19, align 1
  %175 = zext i8 %174 to i32
  %176 = icmp ne i32 %173, %175
  br i1 %176, label %177, label %181

177:                                              ; preds = %163
  %178 = load i32, ptr %18, align 4
  %179 = add nsw i32 %178, 1
  store i32 %179, ptr %18, align 4
  %180 = load i8, ptr %22, align 1
  store i8 %180, ptr %19, align 1
  br label %181

181:                                              ; preds = %177, %163
  %182 = load i32, ptr %18, align 4
  %183 = load ptr, ptr %17, align 8
  %184 = load i64, ptr %21, align 8
  %185 = getelementptr inbounds nuw i32, ptr %183, i64 %184
  store i32 %182, ptr %185, align 4
  br label %186

186:                                              ; preds = %181
  %187 = load i64, ptr %20, align 8
  %188 = add i64 %187, 1
  store i64 %188, ptr %20, align 8
  br label %159, !llvm.loop !14

189:                                              ; preds = %159
  store i64 1, ptr %23, align 8
  br label %190

190:                                              ; preds = %451, %189
  %191 = load i64, ptr %23, align 8
  %192 = load i64, ptr %5, align 8
  %193 = icmp ult i64 %191, %192
  br i1 %193, label %194, label %458

194:                                              ; preds = %190
  %195 = load i64, ptr %5, align 8
  %196 = mul i64 8, %195
  %197 = call noalias ptr @malloc(i64 noundef %196)
  store ptr %197, ptr %24, align 8
  store i64 0, ptr %25, align 8
  br label %198

198:                                              ; preds = %223, %194
  %199 = load i64, ptr %25, align 8
  %200 = load i64, ptr %5, align 8
  %201 = icmp ult i64 %199, %200
  br i1 %201, label %202, label %226

202:                                              ; preds = %198
  %203 = load ptr, ptr %17, align 8
  %204 = load i64, ptr %25, align 8
  %205 = getelementptr inbounds nuw i32, ptr %203, i64 %204
  %206 = load i32, ptr %205, align 4
  %207 = load ptr, ptr %24, align 8
  %208 = load i64, ptr %25, align 8
  %209 = getelementptr inbounds nuw %struct.Pair, ptr %207, i64 %208
  %210 = getelementptr inbounds nuw %struct.Pair, ptr %209, i32 0, i32 0
  store i32 %206, ptr %210, align 4
  %211 = load ptr, ptr %17, align 8
  %212 = load i64, ptr %25, align 8
  %213 = load i64, ptr %23, align 8
  %214 = add i64 %212, %213
  %215 = load i64, ptr %5, align 8
  %216 = urem i64 %214, %215
  %217 = getelementptr inbounds nuw i32, ptr %211, i64 %216
  %218 = load i32, ptr %217, align 4
  %219 = load ptr, ptr %24, align 8
  %220 = load i64, ptr %25, align 8
  %221 = getelementptr inbounds nuw %struct.Pair, ptr %219, i64 %220
  %222 = getelementptr inbounds nuw %struct.Pair, ptr %221, i32 0, i32 1
  store i32 %218, ptr %222, align 4
  br label %223

223:                                              ; preds = %202
  %224 = load i64, ptr %25, align 8
  %225 = add i64 %224, 1
  store i64 %225, ptr %25, align 8
  br label %198, !llvm.loop !15

226:                                              ; preds = %198
  %227 = load i64, ptr %5, align 8
  %228 = add i64 %227, 1
  %229 = call noalias ptr @calloc(i64 noundef %228, i64 noundef 4)
  store ptr %229, ptr %26, align 8
  store i64 0, ptr %27, align 8
  br label %230

230:                                              ; preds = %248, %226
  %231 = load i64, ptr %27, align 8
  %232 = load i64, ptr %5, align 8
  %233 = icmp ult i64 %231, %232
  br i1 %233, label %234, label %251

234:                                              ; preds = %230
  %235 = load ptr, ptr %26, align 8
  %236 = load ptr, ptr %24, align 8
  %237 = load ptr, ptr %7, align 8
  %238 = load i64, ptr %27, align 8
  %239 = getelementptr inbounds nuw i64, ptr %237, i64 %238
  %240 = load i64, ptr %239, align 8
  %241 = getelementptr inbounds nuw %struct.Pair, ptr %236, i64 %240
  %242 = getelementptr inbounds nuw %struct.Pair, ptr %241, i32 0, i32 1
  %243 = load i32, ptr %242, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds i32, ptr %235, i64 %244
  %246 = load i32, ptr %245, align 4
  %247 = add nsw i32 %246, 1
  store i32 %247, ptr %245, align 4
  br label %248

248:                                              ; preds = %234
  %249 = load i64, ptr %27, align 8
  %250 = add i64 %249, 1
  store i64 %250, ptr %27, align 8
  br label %230, !llvm.loop !16

251:                                              ; preds = %230
  store i64 1, ptr %28, align 8
  br label %252

252:                                              ; preds = %267, %251
  %253 = load i64, ptr %28, align 8
  %254 = load i64, ptr %5, align 8
  %255 = icmp ule i64 %253, %254
  br i1 %255, label %256, label %270

256:                                              ; preds = %252
  %257 = load ptr, ptr %26, align 8
  %258 = load i64, ptr %28, align 8
  %259 = sub i64 %258, 1
  %260 = getelementptr inbounds nuw i32, ptr %257, i64 %259
  %261 = load i32, ptr %260, align 4
  %262 = load ptr, ptr %26, align 8
  %263 = load i64, ptr %28, align 8
  %264 = getelementptr inbounds nuw i32, ptr %262, i64 %263
  %265 = load i32, ptr %264, align 4
  %266 = add nsw i32 %265, %261
  store i32 %266, ptr %264, align 4
  br label %267

267:                                              ; preds = %256
  %268 = load i64, ptr %28, align 8
  %269 = add i64 %268, 1
  store i64 %269, ptr %28, align 8
  br label %252, !llvm.loop !17

270:                                              ; preds = %252
  %271 = load ptr, ptr %9, align 8
  %272 = load ptr, ptr %7, align 8
  %273 = load i64, ptr %5, align 8
  %274 = mul i64 8, %273
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %271, ptr align 8 %272, i64 %274, i1 false)
  %275 = load i64, ptr %5, align 8
  %276 = sub i64 %275, 1
  %277 = trunc i64 %276 to i32
  store i32 %277, ptr %29, align 4
  br label %278

278:                                              ; preds = %305, %270
  %279 = load i32, ptr %29, align 4
  %280 = icmp sge i32 %279, 0
  br i1 %280, label %281, label %308

281:                                              ; preds = %278
  %282 = load ptr, ptr %24, align 8
  %283 = load ptr, ptr %9, align 8
  %284 = load i32, ptr %29, align 4
  %285 = sext i32 %284 to i64
  %286 = getelementptr inbounds i64, ptr %283, i64 %285
  %287 = load i64, ptr %286, align 8
  %288 = getelementptr inbounds nuw %struct.Pair, ptr %282, i64 %287
  %289 = getelementptr inbounds nuw %struct.Pair, ptr %288, i32 0, i32 1
  %290 = load i32, ptr %289, align 4
  store i32 %290, ptr %30, align 4
  %291 = load ptr, ptr %9, align 8
  %292 = load i32, ptr %29, align 4
  %293 = sext i32 %292 to i64
  %294 = getelementptr inbounds i64, ptr %291, i64 %293
  %295 = load i64, ptr %294, align 8
  %296 = load ptr, ptr %7, align 8
  %297 = load ptr, ptr %26, align 8
  %298 = load i32, ptr %30, align 4
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds i32, ptr %297, i64 %299
  %301 = load i32, ptr %300, align 4
  %302 = add nsw i32 %301, -1
  store i32 %302, ptr %300, align 4
  %303 = sext i32 %302 to i64
  %304 = getelementptr inbounds i64, ptr %296, i64 %303
  store i64 %295, ptr %304, align 8
  br label %305

305:                                              ; preds = %281
  %306 = load i32, ptr %29, align 4
  %307 = add nsw i32 %306, -1
  store i32 %307, ptr %29, align 4
  br label %278, !llvm.loop !18

308:                                              ; preds = %278
  %309 = load ptr, ptr %26, align 8
  %310 = load i64, ptr %5, align 8
  %311 = add i64 %310, 1
  %312 = mul i64 %311, 4
  call void @llvm.memset.p0.i64(ptr align 4 %309, i8 0, i64 %312, i1 false)
  store i64 0, ptr %31, align 8
  br label %313

313:                                              ; preds = %331, %308
  %314 = load i64, ptr %31, align 8
  %315 = load i64, ptr %5, align 8
  %316 = icmp ult i64 %314, %315
  br i1 %316, label %317, label %334

317:                                              ; preds = %313
  %318 = load ptr, ptr %26, align 8
  %319 = load ptr, ptr %24, align 8
  %320 = load ptr, ptr %7, align 8
  %321 = load i64, ptr %31, align 8
  %322 = getelementptr inbounds nuw i64, ptr %320, i64 %321
  %323 = load i64, ptr %322, align 8
  %324 = getelementptr inbounds nuw %struct.Pair, ptr %319, i64 %323
  %325 = getelementptr inbounds nuw %struct.Pair, ptr %324, i32 0, i32 0
  %326 = load i32, ptr %325, align 4
  %327 = sext i32 %326 to i64
  %328 = getelementptr inbounds i32, ptr %318, i64 %327
  %329 = load i32, ptr %328, align 4
  %330 = add nsw i32 %329, 1
  store i32 %330, ptr %328, align 4
  br label %331

331:                                              ; preds = %317
  %332 = load i64, ptr %31, align 8
  %333 = add i64 %332, 1
  store i64 %333, ptr %31, align 8
  br label %313, !llvm.loop !19

334:                                              ; preds = %313
  store i64 1, ptr %32, align 8
  br label %335

335:                                              ; preds = %350, %334
  %336 = load i64, ptr %32, align 8
  %337 = load i64, ptr %5, align 8
  %338 = icmp ule i64 %336, %337
  br i1 %338, label %339, label %353

339:                                              ; preds = %335
  %340 = load ptr, ptr %26, align 8
  %341 = load i64, ptr %32, align 8
  %342 = sub i64 %341, 1
  %343 = getelementptr inbounds nuw i32, ptr %340, i64 %342
  %344 = load i32, ptr %343, align 4
  %345 = load ptr, ptr %26, align 8
  %346 = load i64, ptr %32, align 8
  %347 = getelementptr inbounds nuw i32, ptr %345, i64 %346
  %348 = load i32, ptr %347, align 4
  %349 = add nsw i32 %348, %344
  store i32 %349, ptr %347, align 4
  br label %350

350:                                              ; preds = %339
  %351 = load i64, ptr %32, align 8
  %352 = add i64 %351, 1
  store i64 %352, ptr %32, align 8
  br label %335, !llvm.loop !20

353:                                              ; preds = %335
  %354 = load ptr, ptr %9, align 8
  %355 = load ptr, ptr %7, align 8
  %356 = load i64, ptr %5, align 8
  %357 = mul i64 8, %356
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %354, ptr align 8 %355, i64 %357, i1 false)
  %358 = load i64, ptr %5, align 8
  %359 = sub i64 %358, 1
  %360 = trunc i64 %359 to i32
  store i32 %360, ptr %33, align 4
  br label %361

361:                                              ; preds = %388, %353
  %362 = load i32, ptr %33, align 4
  %363 = icmp sge i32 %362, 0
  br i1 %363, label %364, label %391

364:                                              ; preds = %361
  %365 = load ptr, ptr %24, align 8
  %366 = load ptr, ptr %9, align 8
  %367 = load i32, ptr %33, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds i64, ptr %366, i64 %368
  %370 = load i64, ptr %369, align 8
  %371 = getelementptr inbounds nuw %struct.Pair, ptr %365, i64 %370
  %372 = getelementptr inbounds nuw %struct.Pair, ptr %371, i32 0, i32 0
  %373 = load i32, ptr %372, align 4
  store i32 %373, ptr %34, align 4
  %374 = load ptr, ptr %9, align 8
  %375 = load i32, ptr %33, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds i64, ptr %374, i64 %376
  %378 = load i64, ptr %377, align 8
  %379 = load ptr, ptr %7, align 8
  %380 = load ptr, ptr %26, align 8
  %381 = load i32, ptr %34, align 4
  %382 = sext i32 %381 to i64
  %383 = getelementptr inbounds i32, ptr %380, i64 %382
  %384 = load i32, ptr %383, align 4
  %385 = add nsw i32 %384, -1
  store i32 %385, ptr %383, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds i64, ptr %379, i64 %386
  store i64 %378, ptr %387, align 8
  br label %388

388:                                              ; preds = %364
  %389 = load i32, ptr %33, align 4
  %390 = add nsw i32 %389, -1
  store i32 %390, ptr %33, align 4
  br label %361, !llvm.loop !21

391:                                              ; preds = %361
  %392 = load i64, ptr %5, align 8
  %393 = mul i64 4, %392
  %394 = call noalias ptr @malloc(i64 noundef %393)
  store ptr %394, ptr %35, align 8
  %395 = load ptr, ptr %35, align 8
  %396 = load ptr, ptr %7, align 8
  %397 = getelementptr inbounds i64, ptr %396, i64 0
  %398 = load i64, ptr %397, align 8
  %399 = getelementptr inbounds nuw i32, ptr %395, i64 %398
  store i32 0, ptr %399, align 4
  store i64 1, ptr %36, align 8
  br label %400

400:                                              ; preds = %448, %391
  %401 = load i64, ptr %36, align 8
  %402 = load i64, ptr %5, align 8
  %403 = icmp ult i64 %401, %402
  br i1 %403, label %404, label %451

404:                                              ; preds = %400
  %405 = load ptr, ptr %24, align 8
  %406 = load ptr, ptr %7, align 8
  %407 = load i64, ptr %36, align 8
  %408 = sub i64 %407, 1
  %409 = getelementptr inbounds nuw i64, ptr %406, i64 %408
  %410 = load i64, ptr %409, align 8
  %411 = getelementptr inbounds nuw %struct.Pair, ptr %405, i64 %410
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %37, ptr align 4 %411, i64 8, i1 false)
  %412 = load ptr, ptr %24, align 8
  %413 = load ptr, ptr %7, align 8
  %414 = load i64, ptr %36, align 8
  %415 = getelementptr inbounds nuw i64, ptr %413, i64 %414
  %416 = load i64, ptr %415, align 8
  %417 = getelementptr inbounds nuw %struct.Pair, ptr %412, i64 %416
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %38, ptr align 4 %417, i64 8, i1 false)
  %418 = load ptr, ptr %35, align 8
  %419 = load ptr, ptr %7, align 8
  %420 = load i64, ptr %36, align 8
  %421 = sub i64 %420, 1
  %422 = getelementptr inbounds nuw i64, ptr %419, i64 %421
  %423 = load i64, ptr %422, align 8
  %424 = getelementptr inbounds nuw i32, ptr %418, i64 %423
  %425 = load i32, ptr %424, align 4
  %426 = getelementptr inbounds nuw %struct.Pair, ptr %37, i32 0, i32 0
  %427 = load i32, ptr %426, align 4
  %428 = getelementptr inbounds nuw %struct.Pair, ptr %38, i32 0, i32 0
  %429 = load i32, ptr %428, align 4
  %430 = icmp ne i32 %427, %429
  br i1 %430, label %437, label %431

431:                                              ; preds = %404
  %432 = getelementptr inbounds nuw %struct.Pair, ptr %37, i32 0, i32 1
  %433 = load i32, ptr %432, align 4
  %434 = getelementptr inbounds nuw %struct.Pair, ptr %38, i32 0, i32 1
  %435 = load i32, ptr %434, align 4
  %436 = icmp ne i32 %433, %435
  br label %437

437:                                              ; preds = %431, %404
  %438 = phi i1 [ true, %404 ], [ %436, %431 ]
  %439 = zext i1 %438 to i64
  %440 = select i1 %438, i32 1, i32 0
  %441 = add nsw i32 %425, %440
  %442 = load ptr, ptr %35, align 8
  %443 = load ptr, ptr %7, align 8
  %444 = load i64, ptr %36, align 8
  %445 = getelementptr inbounds nuw i64, ptr %443, i64 %444
  %446 = load i64, ptr %445, align 8
  %447 = getelementptr inbounds nuw i32, ptr %442, i64 %446
  store i32 %441, ptr %447, align 4
  br label %448

448:                                              ; preds = %437
  %449 = load i64, ptr %36, align 8
  %450 = add i64 %449, 1
  store i64 %450, ptr %36, align 8
  br label %400, !llvm.loop !22

451:                                              ; preds = %400
  %452 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %452)
  %453 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %453)
  %454 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %454)
  %455 = load ptr, ptr %35, align 8
  store ptr %455, ptr %17, align 8
  %456 = load i64, ptr %23, align 8
  %457 = mul i64 %456, 2
  store i64 %457, ptr %23, align 8
  br label %190, !llvm.loop !23

458:                                              ; preds = %190
  %459 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %459)
  br label %460

460:                                              ; preds = %458, %142
  %461 = load i64, ptr %5, align 8
  %462 = call noalias ptr @malloc(i64 noundef %461)
  %463 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 0
  store ptr %462, ptr %463, align 8
  %464 = load i64, ptr %5, align 8
  %465 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 1
  store i64 %464, ptr %465, align 8
  %466 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 2
  store i64 0, ptr %466, align 8
  store i64 0, ptr %39, align 8
  br label %467

467:                                              ; preds = %501, %460
  %468 = load i64, ptr %39, align 8
  %469 = load i64, ptr %5, align 8
  %470 = icmp ult i64 %468, %469
  br i1 %470, label %471, label %504

471:                                              ; preds = %467
  %472 = load ptr, ptr %7, align 8
  %473 = load i64, ptr %39, align 8
  %474 = getelementptr inbounds nuw i64, ptr %472, i64 %473
  %475 = load i64, ptr %474, align 8
  store i64 %475, ptr %40, align 8
  %476 = load i64, ptr %40, align 8
  %477 = icmp eq i64 %476, 0
  br i1 %477, label %478, label %490

478:                                              ; preds = %471
  %479 = load ptr, ptr %4, align 8
  %480 = load i64, ptr %5, align 8
  %481 = sub i64 %480, 1
  %482 = getelementptr inbounds nuw i8, ptr %479, i64 %481
  %483 = load i8, ptr %482, align 1
  %484 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 0
  %485 = load ptr, ptr %484, align 8
  %486 = load i64, ptr %39, align 8
  %487 = getelementptr inbounds nuw i8, ptr %485, i64 %486
  store i8 %483, ptr %487, align 1
  %488 = load i64, ptr %39, align 8
  %489 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 2
  store i64 %488, ptr %489, align 8
  br label %500

490:                                              ; preds = %471
  %491 = load ptr, ptr %4, align 8
  %492 = load i64, ptr %40, align 8
  %493 = sub i64 %492, 1
  %494 = getelementptr inbounds nuw i8, ptr %491, i64 %493
  %495 = load i8, ptr %494, align 1
  %496 = getelementptr inbounds nuw %struct.BWTResult, ptr %0, i32 0, i32 0
  %497 = load ptr, ptr %496, align 8
  %498 = load i64, ptr %39, align 8
  %499 = getelementptr inbounds nuw i8, ptr %497, i64 %498
  store i8 %495, ptr %499, align 1
  br label %500

500:                                              ; preds = %490, %478
  br label %501

501:                                              ; preds = %500
  %502 = load i64, ptr %39, align 8
  %503 = add i64 %502, 1
  store i64 %503, ptr %39, align 8
  br label %467, !llvm.loop !24

504:                                              ; preds = %467
  %505 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %505)
  %506 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %506)
  %507 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %507)
  br label %508

508:                                              ; preds = %504, %46
  ret void
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define internal ptr @bwt_inverse(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca [256 x i32], align 16
  %9 = alloca i64, align 8
  %10 = alloca [256 x i32], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca [256 x i32], align 16
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.BWTResult, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %6, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.BWTResult, ptr %24, i32 0, i32 1
  %26 = load i64, ptr %25, align 8
  store i64 %26, ptr %7, align 8
  %27 = load i64, ptr %7, align 8
  %28 = icmp eq i64 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %2
  %30 = load ptr, ptr %5, align 8
  store i64 0, ptr %30, align 8
  store ptr null, ptr %3, align 8
  br label %132

31:                                               ; preds = %2
  call void @llvm.memset.p0.i64(ptr align 16 %8, i8 0, i64 1024, i1 false)
  store i64 0, ptr %9, align 8
  br label %32

32:                                               ; preds = %45, %31
  %33 = load i64, ptr %9, align 8
  %34 = load i64, ptr %7, align 8
  %35 = icmp ult i64 %33, %34
  br i1 %35, label %36, label %48

36:                                               ; preds = %32
  %37 = load ptr, ptr %6, align 8
  %38 = load i64, ptr %9, align 8
  %39 = getelementptr inbounds nuw i8, ptr %37, i64 %38
  %40 = load i8, ptr %39, align 1
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds nuw [256 x i32], ptr %8, i64 0, i64 %41
  %43 = load i32, ptr %42, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %42, align 4
  br label %45

45:                                               ; preds = %36
  %46 = load i64, ptr %9, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr %9, align 8
  br label %32, !llvm.loop !25

48:                                               ; preds = %32
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %49

49:                                               ; preds = %63, %48
  %50 = load i32, ptr %12, align 4
  %51 = icmp slt i32 %50, 256
  br i1 %51, label %52, label %66

52:                                               ; preds = %49
  %53 = load i32, ptr %11, align 4
  %54 = load i32, ptr %12, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [256 x i32], ptr %10, i64 0, i64 %55
  store i32 %53, ptr %56, align 4
  %57 = load i32, ptr %12, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [256 x i32], ptr %8, i64 0, i64 %58
  %60 = load i32, ptr %59, align 4
  %61 = load i32, ptr %11, align 4
  %62 = add nsw i32 %61, %60
  store i32 %62, ptr %11, align 4
  br label %63

63:                                               ; preds = %52
  %64 = load i32, ptr %12, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %12, align 4
  br label %49, !llvm.loop !26

66:                                               ; preds = %49
  %67 = load i64, ptr %7, align 8
  %68 = mul i64 8, %67
  %69 = call noalias ptr @malloc(i64 noundef %68)
  store ptr %69, ptr %13, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 1024, i1 false)
  store i64 0, ptr %15, align 8
  br label %70

70:                                               ; preds = %99, %66
  %71 = load i64, ptr %15, align 8
  %72 = load i64, ptr %7, align 8
  %73 = icmp ult i64 %71, %72
  br i1 %73, label %74, label %102

74:                                               ; preds = %70
  %75 = load ptr, ptr %6, align 8
  %76 = load i64, ptr %15, align 8
  %77 = getelementptr inbounds nuw i8, ptr %75, i64 %76
  %78 = load i8, ptr %77, align 1
  %79 = zext i8 %78 to i32
  store i32 %79, ptr %16, align 4
  %80 = load i32, ptr %16, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [256 x i32], ptr %10, i64 0, i64 %81
  %83 = load i32, ptr %82, align 4
  %84 = load i32, ptr %16, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [256 x i32], ptr %14, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = add nsw i32 %83, %87
  store i32 %88, ptr %17, align 4
  %89 = load i64, ptr %15, align 8
  %90 = load ptr, ptr %13, align 8
  %91 = load i32, ptr %17, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i64, ptr %90, i64 %92
  store i64 %89, ptr %93, align 8
  %94 = load i32, ptr %16, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [256 x i32], ptr %14, i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = add nsw i32 %97, 1
  store i32 %98, ptr %96, align 4
  br label %99

99:                                               ; preds = %74
  %100 = load i64, ptr %15, align 8
  %101 = add i64 %100, 1
  store i64 %101, ptr %15, align 8
  br label %70, !llvm.loop !27

102:                                              ; preds = %70
  %103 = load i64, ptr %7, align 8
  %104 = call noalias ptr @malloc(i64 noundef %103)
  store ptr %104, ptr %18, align 8
  %105 = load ptr, ptr %4, align 8
  %106 = getelementptr inbounds nuw %struct.BWTResult, ptr %105, i32 0, i32 2
  %107 = load i64, ptr %106, align 8
  store i64 %107, ptr %19, align 8
  store i64 0, ptr %20, align 8
  br label %108

108:                                              ; preds = %124, %102
  %109 = load i64, ptr %20, align 8
  %110 = load i64, ptr %7, align 8
  %111 = icmp ult i64 %109, %110
  br i1 %111, label %112, label %127

112:                                              ; preds = %108
  %113 = load ptr, ptr %13, align 8
  %114 = load i64, ptr %19, align 8
  %115 = getelementptr inbounds nuw i64, ptr %113, i64 %114
  %116 = load i64, ptr %115, align 8
  store i64 %116, ptr %19, align 8
  %117 = load ptr, ptr %6, align 8
  %118 = load i64, ptr %19, align 8
  %119 = getelementptr inbounds nuw i8, ptr %117, i64 %118
  %120 = load i8, ptr %119, align 1
  %121 = load ptr, ptr %18, align 8
  %122 = load i64, ptr %20, align 8
  %123 = getelementptr inbounds nuw i8, ptr %121, i64 %122
  store i8 %120, ptr %123, align 1
  br label %124

124:                                              ; preds = %112
  %125 = load i64, ptr %20, align 8
  %126 = add i64 %125, 1
  store i64 %126, ptr %20, align 8
  br label %108, !llvm.loop !28

127:                                              ; preds = %108
  %128 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %128)
  %129 = load i64, ptr %7, align 8
  %130 = load ptr, ptr %5, align 8
  store i64 %129, ptr %130, align 8
  %131 = load ptr, ptr %18, align 8
  store ptr %131, ptr %3, align 8
  br label %132

132:                                              ; preds = %127, %29
  %133 = load ptr, ptr %3, align 8
  ret ptr %133
}

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

define internal ptr @build_huffman_tree(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %14 = call noalias ptr @malloc(i64 noundef 2048)
  store ptr %14, ptr %4, align 8
  store i32 0, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %51, %1
  %16 = load i32, ptr %6, align 4
  %17 = icmp slt i32 %16, 256
  br i1 %17, label %18, label %54

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %6, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %50

25:                                               ; preds = %18
  %26 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %26, ptr %7, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = load i32, ptr %6, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, ptr %27, i64 %29
  %31 = load i32, ptr %30, align 4
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %32, i32 0, i32 0
  store i32 %31, ptr %33, align 8
  %34 = load i32, ptr %6, align 4
  %35 = trunc i32 %34 to i8
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %36, i32 0, i32 1
  store i8 %35, ptr %37, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %38, i32 0, i32 2
  store i8 1, ptr %39, align 1
  %40 = load ptr, ptr %7, align 8
  %41 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %40, i32 0, i32 3
  store ptr null, ptr %41, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %42, i32 0, i32 4
  store ptr null, ptr %43, align 8
  %44 = load ptr, ptr %7, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = load i32, ptr %5, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %5, align 4
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds ptr, ptr %45, i64 %48
  store ptr %44, ptr %49, align 8
  br label %50

50:                                               ; preds = %25, %18
  br label %51

51:                                               ; preds = %50
  %52 = load i32, ptr %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, ptr %6, align 4
  br label %15, !llvm.loop !29

54:                                               ; preds = %15
  %55 = load i32, ptr %5, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %59

57:                                               ; preds = %54
  %58 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %58)
  store ptr null, ptr %2, align 8
  br label %173

59:                                               ; preds = %54
  %60 = load i32, ptr %5, align 4
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %62, label %105

62:                                               ; preds = %59
  %63 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %63, ptr %8, align 8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds ptr, ptr %64, i64 0
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %66, i32 0, i32 0
  %68 = load i32, ptr %67, align 8
  %69 = load ptr, ptr %8, align 8
  %70 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %69, i32 0, i32 0
  store i32 %68, ptr %70, align 8
  %71 = load ptr, ptr %8, align 8
  %72 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %71, i32 0, i32 1
  store i8 0, ptr %72, align 4
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %73, i32 0, i32 2
  store i8 0, ptr %74, align 1
  %75 = load ptr, ptr %4, align 8
  %76 = getelementptr inbounds ptr, ptr %75, i64 0
  %77 = load ptr, ptr %76, align 8
  %78 = load ptr, ptr %8, align 8
  %79 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %78, i32 0, i32 3
  store ptr %77, ptr %79, align 8
  %80 = call noalias ptr @malloc(i64 noundef 24)
  %81 = load ptr, ptr %8, align 8
  %82 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %81, i32 0, i32 4
  store ptr %80, ptr %82, align 8
  %83 = load ptr, ptr %8, align 8
  %84 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %83, i32 0, i32 4
  %85 = load ptr, ptr %84, align 8
  %86 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %85, i32 0, i32 0
  store i32 0, ptr %86, align 8
  %87 = load ptr, ptr %8, align 8
  %88 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %87, i32 0, i32 4
  %89 = load ptr, ptr %88, align 8
  %90 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %89, i32 0, i32 1
  store i8 0, ptr %90, align 4
  %91 = load ptr, ptr %8, align 8
  %92 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %91, i32 0, i32 4
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %93, i32 0, i32 2
  store i8 1, ptr %94, align 1
  %95 = load ptr, ptr %8, align 8
  %96 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %95, i32 0, i32 4
  %97 = load ptr, ptr %96, align 8
  %98 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %97, i32 0, i32 3
  store ptr null, ptr %98, align 8
  %99 = load ptr, ptr %8, align 8
  %100 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %99, i32 0, i32 4
  %101 = load ptr, ptr %100, align 8
  %102 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %101, i32 0, i32 4
  store ptr null, ptr %102, align 8
  %103 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %103)
  %104 = load ptr, ptr %8, align 8
  store ptr %104, ptr %2, align 8
  br label %173

105:                                              ; preds = %59
  %106 = load ptr, ptr %4, align 8
  %107 = load i32, ptr %5, align 4
  %108 = sext i32 %107 to i64
  call void @qsort(ptr noundef %106, i64 noundef %108, i64 noundef 8, ptr noundef @compare_huffman_nodes)
  br label %109

109:                                              ; preds = %161, %105
  %110 = load i32, ptr %5, align 4
  %111 = icmp sgt i32 %110, 1
  br i1 %111, label %112, label %167

112:                                              ; preds = %109
  %113 = load ptr, ptr %4, align 8
  %114 = getelementptr inbounds ptr, ptr %113, i64 0
  %115 = load ptr, ptr %114, align 8
  store ptr %115, ptr %9, align 8
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds ptr, ptr %116, i64 1
  %118 = load ptr, ptr %117, align 8
  store ptr %118, ptr %10, align 8
  %119 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %119, ptr %11, align 8
  %120 = load ptr, ptr %9, align 8
  %121 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %120, i32 0, i32 0
  %122 = load i32, ptr %121, align 8
  %123 = load ptr, ptr %10, align 8
  %124 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %123, i32 0, i32 0
  %125 = load i32, ptr %124, align 8
  %126 = add nsw i32 %122, %125
  %127 = load ptr, ptr %11, align 8
  %128 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %127, i32 0, i32 0
  store i32 %126, ptr %128, align 8
  %129 = load ptr, ptr %11, align 8
  %130 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %129, i32 0, i32 1
  store i8 0, ptr %130, align 4
  %131 = load ptr, ptr %11, align 8
  %132 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %131, i32 0, i32 2
  store i8 0, ptr %132, align 1
  %133 = load ptr, ptr %9, align 8
  %134 = load ptr, ptr %11, align 8
  %135 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %134, i32 0, i32 3
  store ptr %133, ptr %135, align 8
  %136 = load ptr, ptr %10, align 8
  %137 = load ptr, ptr %11, align 8
  %138 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %137, i32 0, i32 4
  store ptr %136, ptr %138, align 8
  %139 = load ptr, ptr %11, align 8
  %140 = load ptr, ptr %4, align 8
  %141 = getelementptr inbounds ptr, ptr %140, i64 0
  store ptr %139, ptr %141, align 8
  store i32 1, ptr %12, align 4
  br label %142

142:                                              ; preds = %158, %112
  %143 = load i32, ptr %12, align 4
  %144 = load i32, ptr %5, align 4
  %145 = sub nsw i32 %144, 1
  %146 = icmp slt i32 %143, %145
  br i1 %146, label %147, label %161

147:                                              ; preds = %142
  %148 = load ptr, ptr %4, align 8
  %149 = load i32, ptr %12, align 4
  %150 = add nsw i32 %149, 1
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds ptr, ptr %148, i64 %151
  %153 = load ptr, ptr %152, align 8
  %154 = load ptr, ptr %4, align 8
  %155 = load i32, ptr %12, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds ptr, ptr %154, i64 %156
  store ptr %153, ptr %157, align 8
  br label %158

158:                                              ; preds = %147
  %159 = load i32, ptr %12, align 4
  %160 = add nsw i32 %159, 1
  store i32 %160, ptr %12, align 4
  br label %142, !llvm.loop !30

161:                                              ; preds = %142
  %162 = load i32, ptr %5, align 4
  %163 = add nsw i32 %162, -1
  store i32 %163, ptr %5, align 4
  %164 = load ptr, ptr %4, align 8
  %165 = load i32, ptr %5, align 4
  %166 = sext i32 %165 to i64
  call void @qsort(ptr noundef %164, i64 noundef %166, i64 noundef 8, ptr noundef @compare_huffman_nodes)
  br label %109, !llvm.loop !31

167:                                              ; preds = %109
  %168 = load ptr, ptr %4, align 8
  %169 = getelementptr inbounds ptr, ptr %168, i64 0
  %170 = load ptr, ptr %169, align 8
  store ptr %170, ptr %13, align 8
  %171 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %171)
  %172 = load ptr, ptr %13, align 8
  store ptr %172, ptr %2, align 8
  br label %173

173:                                              ; preds = %167, %62, %57
  %174 = load ptr, ptr %2, align 8
  ret ptr %174
}

define internal void @build_huffman_codes(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  store ptr %3, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %13, label %12

12:                                               ; preds = %4
  br label %65

13:                                               ; preds = %4
  %14 = load ptr, ptr %5, align 8
  %15 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %14, i32 0, i32 2
  %16 = load i8, ptr %15, align 1
  %17 = trunc i8 %16 to i1
  br i1 %17, label %18, label %35

18:                                               ; preds = %13
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %19, i32 0, i32 1
  %21 = load i8, ptr %20, align 4
  %22 = zext i8 %21 to i32
  store i32 %22, ptr %9, align 4
  %23 = load i32, ptr %7, align 4
  %24 = load ptr, ptr %8, align 8
  %25 = getelementptr inbounds nuw %struct.HuffmanCodes, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %9, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [256 x i32], ptr %25, i64 0, i64 %27
  store i32 %23, ptr %28, align 4
  %29 = load i32, ptr %6, align 4
  %30 = load ptr, ptr %8, align 8
  %31 = getelementptr inbounds nuw %struct.HuffmanCodes, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %9, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [256 x i32], ptr %31, i64 0, i64 %33
  store i32 %29, ptr %34, align 4
  br label %65

35:                                               ; preds = %13
  %36 = load ptr, ptr %5, align 8
  %37 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %36, i32 0, i32 3
  %38 = load ptr, ptr %37, align 8
  %39 = icmp ne ptr %38, null
  br i1 %39, label %40, label %49

40:                                               ; preds = %35
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %41, i32 0, i32 3
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %6, align 4
  %45 = shl i32 %44, 1
  %46 = load i32, ptr %7, align 4
  %47 = add nsw i32 %46, 1
  %48 = load ptr, ptr %8, align 8
  call void @build_huffman_codes(ptr noundef %43, i32 noundef %45, i32 noundef %47, ptr noundef %48)
  br label %49

49:                                               ; preds = %40, %35
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %50, i32 0, i32 4
  %52 = load ptr, ptr %51, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %54, label %64

54:                                               ; preds = %49
  %55 = load ptr, ptr %5, align 8
  %56 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %55, i32 0, i32 4
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %6, align 4
  %59 = shl i32 %58, 1
  %60 = or i32 %59, 1
  %61 = load i32, ptr %7, align 4
  %62 = add nsw i32 %61, 1
  %63 = load ptr, ptr %8, align 8
  call void @build_huffman_codes(ptr noundef %57, i32 noundef %60, i32 noundef %62, ptr noundef %63)
  br label %64

64:                                               ; preds = %54, %49
  br label %65

65:                                               ; preds = %12, %64, %18
  ret void
}

define internal void @huffman_encode(ptr dead_on_unwind noalias writable sret(%struct.EncodedResult) align 8 %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4) {
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i64, align 8
  %11 = alloca i8, align 1
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  store ptr %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  store ptr %4, ptr %9, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 1048, i1 false)
  %21 = load ptr, ptr %6, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %29

23:                                               ; preds = %5
  %24 = load i64, ptr %7, align 8
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = load ptr, ptr %8, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %30, label %29

29:                                               ; preds = %26, %23, %5
  br label %186

30:                                               ; preds = %26
  %31 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 3
  %32 = getelementptr inbounds [256 x i32], ptr %31, i64 0, i64 0
  %33 = load ptr, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %32, ptr align 4 %33, i64 1024, i1 false)
  %34 = load i64, ptr %7, align 8
  %35 = mul i64 %34, 2
  store i64 %35, ptr %10, align 8
  %36 = load i64, ptr %10, align 8
  %37 = call noalias ptr @malloc(i64 noundef %36)
  %38 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr %37, ptr %38, align 8
  %39 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %40 = load ptr, ptr %39, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %43, label %42

42:                                               ; preds = %30
  br label %186

43:                                               ; preds = %30
  %44 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  store i64 0, ptr %44, align 8
  %45 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 2
  store i32 0, ptr %45, align 8
  store i8 0, ptr %11, align 1
  store i32 0, ptr %12, align 4
  store i64 0, ptr %13, align 8
  br label %46

46:                                               ; preds = %133, %43
  %47 = load i64, ptr %13, align 8
  %48 = load i64, ptr %7, align 8
  %49 = icmp ult i64 %47, %48
  br i1 %49, label %50, label %136

50:                                               ; preds = %46
  %51 = load ptr, ptr %6, align 8
  %52 = load i64, ptr %13, align 8
  %53 = getelementptr inbounds nuw i8, ptr %51, i64 %52
  %54 = load i8, ptr %53, align 1
  %55 = zext i8 %54 to i32
  store i32 %55, ptr %14, align 4
  %56 = load ptr, ptr %8, align 8
  %57 = getelementptr inbounds nuw %struct.HuffmanCodes, ptr %56, i32 0, i32 1
  %58 = load i32, ptr %14, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [256 x i32], ptr %57, i64 0, i64 %59
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %15, align 4
  %62 = load ptr, ptr %8, align 8
  %63 = getelementptr inbounds nuw %struct.HuffmanCodes, ptr %62, i32 0, i32 0
  %64 = load i32, ptr %14, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [256 x i32], ptr %63, i64 0, i64 %65
  %67 = load i32, ptr %66, align 4
  store i32 %67, ptr %16, align 4
  %68 = load i32, ptr %16, align 4
  %69 = icmp sle i32 %68, 0
  br i1 %69, label %70, label %71

70:                                               ; preds = %50
  br label %133

71:                                               ; preds = %50
  %72 = load i32, ptr %16, align 4
  %73 = sub nsw i32 %72, 1
  store i32 %73, ptr %17, align 4
  br label %74

74:                                               ; preds = %129, %71
  %75 = load i32, ptr %17, align 4
  %76 = icmp sge i32 %75, 0
  br i1 %76, label %77, label %132

77:                                               ; preds = %74
  %78 = load i32, ptr %15, align 4
  %79 = load i32, ptr %17, align 4
  %80 = shl i32 1, %79
  %81 = and i32 %78, %80
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %83, label %91

83:                                               ; preds = %77
  %84 = load i32, ptr %12, align 4
  %85 = sub nsw i32 7, %84
  %86 = shl i32 1, %85
  %87 = load i8, ptr %11, align 1
  %88 = zext i8 %87 to i32
  %89 = or i32 %88, %86
  %90 = trunc i32 %89 to i8
  store i8 %90, ptr %11, align 1
  br label %91

91:                                               ; preds = %83, %77
  %92 = load i32, ptr %12, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %12, align 4
  %94 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 2
  %95 = load i32, ptr %94, align 8
  %96 = add nsw i32 %95, 1
  store i32 %96, ptr %94, align 8
  %97 = load i32, ptr %12, align 4
  %98 = icmp eq i32 %97, 8
  br i1 %98, label %99, label %128

99:                                               ; preds = %91
  %100 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %101 = load i64, ptr %100, align 8
  %102 = load i64, ptr %10, align 8
  %103 = icmp uge i64 %101, %102
  br i1 %103, label %104, label %120

104:                                              ; preds = %99
  %105 = load i64, ptr %10, align 8
  %106 = mul i64 %105, 2
  store i64 %106, ptr %10, align 8
  %107 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %108 = load ptr, ptr %107, align 8
  %109 = load i64, ptr %10, align 8
  %110 = call ptr @realloc(ptr noundef %108, i64 noundef %109)
  store ptr %110, ptr %18, align 8
  %111 = load ptr, ptr %18, align 8
  %112 = icmp ne ptr %111, null
  br i1 %112, label %117, label %113

113:                                              ; preds = %104
  %114 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %115 = load ptr, ptr %114, align 8
  call void @free(ptr noundef %115)
  %116 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr null, ptr %116, align 8
  br label %186

117:                                              ; preds = %104
  %118 = load ptr, ptr %18, align 8
  %119 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr %118, ptr %119, align 8
  br label %120

120:                                              ; preds = %117, %99
  %121 = load i8, ptr %11, align 1
  %122 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %125 = load i64, ptr %124, align 8
  %126 = add i64 %125, 1
  store i64 %126, ptr %124, align 8
  %127 = getelementptr inbounds nuw i8, ptr %123, i64 %125
  store i8 %121, ptr %127, align 1
  store i8 0, ptr %11, align 1
  store i32 0, ptr %12, align 4
  br label %128

128:                                              ; preds = %120, %91
  br label %129

129:                                              ; preds = %128
  %130 = load i32, ptr %17, align 4
  %131 = add nsw i32 %130, -1
  store i32 %131, ptr %17, align 4
  br label %74, !llvm.loop !32

132:                                              ; preds = %74
  br label %133

133:                                              ; preds = %132, %70
  %134 = load i64, ptr %13, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr %13, align 8
  br label %46, !llvm.loop !33

136:                                              ; preds = %46
  %137 = load i32, ptr %12, align 4
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %139, label %168

139:                                              ; preds = %136
  %140 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %141 = load i64, ptr %140, align 8
  %142 = load i64, ptr %10, align 8
  %143 = icmp uge i64 %141, %142
  br i1 %143, label %144, label %160

144:                                              ; preds = %139
  %145 = load i64, ptr %10, align 8
  %146 = mul i64 %145, 2
  store i64 %146, ptr %10, align 8
  %147 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %148 = load ptr, ptr %147, align 8
  %149 = load i64, ptr %10, align 8
  %150 = call ptr @realloc(ptr noundef %148, i64 noundef %149)
  store ptr %150, ptr %19, align 8
  %151 = load ptr, ptr %19, align 8
  %152 = icmp ne ptr %151, null
  br i1 %152, label %157, label %153

153:                                              ; preds = %144
  %154 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %155 = load ptr, ptr %154, align 8
  call void @free(ptr noundef %155)
  %156 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr null, ptr %156, align 8
  br label %186

157:                                              ; preds = %144
  %158 = load ptr, ptr %19, align 8
  %159 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr %158, ptr %159, align 8
  br label %160

160:                                              ; preds = %157, %139
  %161 = load i8, ptr %11, align 1
  %162 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %163 = load ptr, ptr %162, align 8
  %164 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %165 = load i64, ptr %164, align 8
  %166 = add i64 %165, 1
  store i64 %166, ptr %164, align 8
  %167 = getelementptr inbounds nuw i8, ptr %163, i64 %165
  store i8 %161, ptr %167, align 1
  br label %168

168:                                              ; preds = %160, %136
  %169 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %170 = load i64, ptr %169, align 8
  %171 = load i64, ptr %10, align 8
  %172 = icmp ult i64 %170, %171
  br i1 %172, label %173, label %185

173:                                              ; preds = %168
  %174 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  %175 = load ptr, ptr %174, align 8
  %176 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 1
  %177 = load i64, ptr %176, align 8
  %178 = call ptr @realloc(ptr noundef %175, i64 noundef %177)
  store ptr %178, ptr %20, align 8
  %179 = load ptr, ptr %20, align 8
  %180 = icmp ne ptr %179, null
  br i1 %180, label %181, label %184

181:                                              ; preds = %173
  %182 = load ptr, ptr %20, align 8
  %183 = getelementptr inbounds nuw %struct.EncodedResult, ptr %0, i32 0, i32 0
  store ptr %182, ptr %183, align 8
  br label %184

184:                                              ; preds = %181, %173
  br label %185

185:                                              ; preds = %184, %168
  br label %186

186:                                              ; preds = %185, %153, %113, %42, %29
  ret void
}

define internal void @free_huffman_tree(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  br label %20

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %7, i32 0, i32 2
  %9 = load i8, ptr %8, align 1
  %10 = trunc i8 %9 to i1
  br i1 %10, label %18, label %11

11:                                               ; preds = %6
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %12, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8
  call void @free_huffman_tree(ptr noundef %14)
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  call void @free_huffman_tree(ptr noundef %17)
  br label %18

18:                                               ; preds = %11, %6
  %19 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %19)
  br label %20

20:                                               ; preds = %18, %5
  ret void
}

declare void @qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef)

define internal i32 @compare_huffman_nodes(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %5, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %6, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = sub nsw i32 %13, %16
  ret i32 %17
}

declare ptr @realloc(ptr noundef, i64 noundef)

define internal ptr @huffman_decode(ptr noundef %0, i64 noundef %1, ptr noundef %2, i32 noundef %3, ptr noundef %4) {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i8, align 1
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store i64 %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store ptr %4, ptr %11, align 8
  %21 = load ptr, ptr %9, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %29

23:                                               ; preds = %5
  %24 = load i32, ptr %10, align 4
  %25 = icmp sle i32 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %23
  %27 = load ptr, ptr %7, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %31, label %29

29:                                               ; preds = %26, %23, %5
  %30 = load ptr, ptr %11, align 8
  store i64 0, ptr %30, align 8
  store ptr null, ptr %6, align 8
  br label %113

31:                                               ; preds = %26
  %32 = load i32, ptr %10, align 4
  %33 = sext i32 %32 to i64
  store i64 %33, ptr %12, align 8
  %34 = load i64, ptr %12, align 8
  %35 = call noalias ptr @malloc(i64 noundef %34)
  store ptr %35, ptr %13, align 8
  %36 = load ptr, ptr %13, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %40, label %38

38:                                               ; preds = %31
  %39 = load ptr, ptr %11, align 8
  store i64 0, ptr %39, align 8
  store ptr null, ptr %6, align 8
  br label %113

40:                                               ; preds = %31
  store i64 0, ptr %14, align 8
  %41 = load ptr, ptr %9, align 8
  store ptr %41, ptr %15, align 8
  store i32 0, ptr %16, align 4
  store i64 0, ptr %17, align 8
  br label %42

42:                                               ; preds = %108, %40
  %43 = load i32, ptr %16, align 4
  %44 = load i32, ptr %10, align 4
  %45 = icmp slt i32 %43, %44
  br i1 %45, label %46, label %50

46:                                               ; preds = %42
  %47 = load i64, ptr %17, align 8
  %48 = load i64, ptr %8, align 8
  %49 = icmp ult i64 %47, %48
  br label %50

50:                                               ; preds = %46, %42
  %51 = phi i1 [ false, %42 ], [ %49, %46 ]
  br i1 %51, label %52, label %109

52:                                               ; preds = %50
  %53 = load ptr, ptr %7, align 8
  %54 = load i64, ptr %17, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr %17, align 8
  %56 = getelementptr inbounds nuw i8, ptr %53, i64 %54
  %57 = load i8, ptr %56, align 1
  store i8 %57, ptr %18, align 1
  store i32 7, ptr %19, align 4
  br label %58

58:                                               ; preds = %105, %52
  %59 = load i32, ptr %19, align 4
  %60 = icmp sge i32 %59, 0
  br i1 %60, label %61, label %65

61:                                               ; preds = %58
  %62 = load i32, ptr %16, align 4
  %63 = load i32, ptr %10, align 4
  %64 = icmp slt i32 %62, %63
  br label %65

65:                                               ; preds = %61, %58
  %66 = phi i1 [ false, %58 ], [ %64, %61 ]
  br i1 %66, label %67, label %108

67:                                               ; preds = %65
  %68 = load i8, ptr %18, align 1
  %69 = zext i8 %68 to i32
  %70 = load i32, ptr %19, align 4
  %71 = ashr i32 %69, %70
  %72 = and i32 %71, 1
  store i32 %72, ptr %20, align 4
  %73 = load i32, ptr %16, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %16, align 4
  %75 = load i32, ptr %20, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %81

77:                                               ; preds = %67
  %78 = load ptr, ptr %15, align 8
  %79 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %78, i32 0, i32 4
  %80 = load ptr, ptr %79, align 8
  br label %85

81:                                               ; preds = %67
  %82 = load ptr, ptr %15, align 8
  %83 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %82, i32 0, i32 3
  %84 = load ptr, ptr %83, align 8
  br label %85

85:                                               ; preds = %81, %77
  %86 = phi ptr [ %80, %77 ], [ %84, %81 ]
  store ptr %86, ptr %15, align 8
  %87 = load ptr, ptr %15, align 8
  %88 = icmp ne ptr %87, null
  br i1 %88, label %90, label %89

89:                                               ; preds = %85
  br label %108

90:                                               ; preds = %85
  %91 = load ptr, ptr %15, align 8
  %92 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %91, i32 0, i32 2
  %93 = load i8, ptr %92, align 1
  %94 = trunc i8 %93 to i1
  br i1 %94, label %95, label %104

95:                                               ; preds = %90
  %96 = load ptr, ptr %15, align 8
  %97 = getelementptr inbounds nuw %struct.HuffmanNode, ptr %96, i32 0, i32 1
  %98 = load i8, ptr %97, align 4
  %99 = load ptr, ptr %13, align 8
  %100 = load i64, ptr %14, align 8
  %101 = add i64 %100, 1
  store i64 %101, ptr %14, align 8
  %102 = getelementptr inbounds nuw i8, ptr %99, i64 %100
  store i8 %98, ptr %102, align 1
  %103 = load ptr, ptr %9, align 8
  store ptr %103, ptr %15, align 8
  br label %104

104:                                              ; preds = %95, %90
  br label %105

105:                                              ; preds = %104
  %106 = load i32, ptr %19, align 4
  %107 = add nsw i32 %106, -1
  store i32 %107, ptr %19, align 4
  br label %58, !llvm.loop !34

108:                                              ; preds = %89, %65
  br label %42, !llvm.loop !35

109:                                              ; preds = %50
  %110 = load i64, ptr %14, align 8
  %111 = load ptr, ptr %11, align 8
  store i64 %110, ptr %111, align 8
  %112 = load ptr, ptr %13, align 8
  store ptr %112, ptr %6, align 8
  br label %113

113:                                              ; preds = %109, %38, %29
  %114 = load ptr, ptr %6, align 8
  ret ptr %114
}

define internal void @arith_encode(ptr dead_on_unwind noalias writable sret(%struct.ArithEncodedResult) align 8 %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca [256 x i32], align 16
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i64, align 8
  %21 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8
  store i64 %2, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 1048, i1 false)
  %22 = load ptr, ptr %4, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %27

24:                                               ; preds = %3
  %25 = load i64, ptr %5, align 8
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %27, label %28

27:                                               ; preds = %24, %3
  br label %212

28:                                               ; preds = %24
  call void @llvm.memset.p0.i64(ptr align 16 %6, i8 0, i64 1024, i1 false)
  store i64 0, ptr %7, align 8
  br label %29

29:                                               ; preds = %42, %28
  %30 = load i64, ptr %7, align 8
  %31 = load i64, ptr %5, align 8
  %32 = icmp ult i64 %30, %31
  br i1 %32, label %33, label %45

33:                                               ; preds = %29
  %34 = load ptr, ptr %4, align 8
  %35 = load i64, ptr %7, align 8
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 %35
  %37 = load i8, ptr %36, align 1
  %38 = zext i8 %37 to i64
  %39 = getelementptr inbounds nuw [256 x i32], ptr %6, i64 0, i64 %38
  %40 = load i32, ptr %39, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %39, align 4
  br label %42

42:                                               ; preds = %33
  %43 = load i64, ptr %7, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr %7, align 8
  br label %29, !llvm.loop !36

45:                                               ; preds = %29
  %46 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 0
  %47 = call ptr @create_arith_freq_table(ptr noundef %46)
  store ptr %47, ptr %8, align 8
  %48 = load ptr, ptr %8, align 8
  %49 = icmp ne ptr %48, null
  br i1 %49, label %51, label %50

50:                                               ; preds = %45
  br label %212

51:                                               ; preds = %45
  store i64 0, ptr %9, align 8
  store i64 4294967295, ptr %10, align 8
  store i32 0, ptr %11, align 4
  %52 = call ptr @bit_output_create()
  store ptr %52, ptr %12, align 8
  %53 = load ptr, ptr %12, align 8
  %54 = icmp ne ptr %53, null
  br i1 %54, label %57, label %55

55:                                               ; preds = %51
  %56 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %56)
  br label %212

57:                                               ; preds = %51
  store i64 0, ptr %13, align 8
  br label %58

58:                                               ; preds = %164, %57
  %59 = load i64, ptr %13, align 8
  %60 = load i64, ptr %5, align 8
  %61 = icmp ult i64 %59, %60
  br i1 %61, label %62, label %167

62:                                               ; preds = %58
  %63 = load ptr, ptr %4, align 8
  %64 = load i64, ptr %13, align 8
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 %64
  %66 = load i8, ptr %65, align 1
  %67 = zext i8 %66 to i32
  store i32 %67, ptr %14, align 4
  %68 = load i64, ptr %10, align 8
  %69 = load i64, ptr %9, align 8
  %70 = sub i64 %68, %69
  %71 = add i64 %70, 1
  store i64 %71, ptr %15, align 8
  %72 = load i64, ptr %9, align 8
  %73 = load i64, ptr %15, align 8
  %74 = load ptr, ptr %8, align 8
  %75 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %74, i32 0, i32 2
  %76 = load i32, ptr %14, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [256 x i32], ptr %75, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = sext i32 %79 to i64
  %81 = mul i64 %73, %80
  %82 = load ptr, ptr %8, align 8
  %83 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %82, i32 0, i32 0
  %84 = load i32, ptr %83, align 4
  %85 = sext i32 %84 to i64
  %86 = udiv i64 %81, %85
  %87 = add i64 %72, %86
  %88 = sub i64 %87, 1
  store i64 %88, ptr %10, align 8
  %89 = load i64, ptr %9, align 8
  %90 = load i64, ptr %15, align 8
  %91 = load ptr, ptr %8, align 8
  %92 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %91, i32 0, i32 1
  %93 = load i32, ptr %14, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [256 x i32], ptr %92, i64 0, i64 %94
  %96 = load i32, ptr %95, align 4
  %97 = sext i32 %96 to i64
  %98 = mul i64 %90, %97
  %99 = load ptr, ptr %8, align 8
  %100 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %99, i32 0, i32 0
  %101 = load i32, ptr %100, align 4
  %102 = sext i32 %101 to i64
  %103 = udiv i64 %98, %102
  %104 = add i64 %89, %103
  store i64 %104, ptr %9, align 8
  br label %105

105:                                              ; preds = %62, %155
  %106 = load i64, ptr %10, align 8
  %107 = icmp ult i64 %106, 2147483648
  br i1 %107, label %108, label %120

108:                                              ; preds = %105
  %109 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %109, i32 noundef 0)
  store i32 0, ptr %16, align 4
  br label %110

110:                                              ; preds = %116, %108
  %111 = load i32, ptr %16, align 4
  %112 = load i32, ptr %11, align 4
  %113 = icmp slt i32 %111, %112
  br i1 %113, label %114, label %119

114:                                              ; preds = %110
  %115 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %115, i32 noundef 1)
  br label %116

116:                                              ; preds = %114
  %117 = load i32, ptr %16, align 4
  %118 = add nsw i32 %117, 1
  store i32 %118, ptr %16, align 4
  br label %110, !llvm.loop !37

119:                                              ; preds = %110
  store i32 0, ptr %11, align 4
  br label %155

120:                                              ; preds = %105
  %121 = load i64, ptr %9, align 8
  %122 = icmp uge i64 %121, 2147483648
  br i1 %122, label %123, label %139

123:                                              ; preds = %120
  %124 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %124, i32 noundef 1)
  store i32 0, ptr %17, align 4
  br label %125

125:                                              ; preds = %131, %123
  %126 = load i32, ptr %17, align 4
  %127 = load i32, ptr %11, align 4
  %128 = icmp slt i32 %126, %127
  br i1 %128, label %129, label %134

129:                                              ; preds = %125
  %130 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %130, i32 noundef 0)
  br label %131

131:                                              ; preds = %129
  %132 = load i32, ptr %17, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, ptr %17, align 4
  br label %125, !llvm.loop !38

134:                                              ; preds = %125
  store i32 0, ptr %11, align 4
  %135 = load i64, ptr %9, align 8
  %136 = sub i64 %135, 2147483648
  store i64 %136, ptr %9, align 8
  %137 = load i64, ptr %10, align 8
  %138 = sub i64 %137, 2147483648
  store i64 %138, ptr %10, align 8
  br label %154

139:                                              ; preds = %120
  %140 = load i64, ptr %9, align 8
  %141 = icmp uge i64 %140, 1073741824
  br i1 %141, label %142, label %152

142:                                              ; preds = %139
  %143 = load i64, ptr %10, align 8
  %144 = icmp ult i64 %143, 3221225472
  br i1 %144, label %145, label %152

145:                                              ; preds = %142
  %146 = load i32, ptr %11, align 4
  %147 = add nsw i32 %146, 1
  store i32 %147, ptr %11, align 4
  %148 = load i64, ptr %9, align 8
  %149 = sub i64 %148, 1073741824
  store i64 %149, ptr %9, align 8
  %150 = load i64, ptr %10, align 8
  %151 = sub i64 %150, 1073741824
  store i64 %151, ptr %10, align 8
  br label %153

152:                                              ; preds = %142, %139
  br label %163

153:                                              ; preds = %145
  br label %154

154:                                              ; preds = %153, %134
  br label %155

155:                                              ; preds = %154, %119
  %156 = load i64, ptr %9, align 8
  %157 = shl i64 %156, 1
  store i64 %157, ptr %9, align 8
  %158 = load i64, ptr %10, align 8
  %159 = shl i64 %158, 1
  %160 = or i64 %159, 1
  store i64 %160, ptr %10, align 8
  %161 = load i64, ptr %10, align 8
  %162 = and i64 %161, 4294967295
  store i64 %162, ptr %10, align 8
  br label %105

163:                                              ; preds = %152
  br label %164

164:                                              ; preds = %163
  %165 = load i64, ptr %13, align 8
  %166 = add i64 %165, 1
  store i64 %166, ptr %13, align 8
  br label %58, !llvm.loop !39

167:                                              ; preds = %58
  %168 = load i32, ptr %11, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, ptr %11, align 4
  %170 = load i64, ptr %9, align 8
  %171 = icmp ult i64 %170, 1073741824
  br i1 %171, label %172, label %184

172:                                              ; preds = %167
  %173 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %173, i32 noundef 0)
  store i32 0, ptr %18, align 4
  br label %174

174:                                              ; preds = %180, %172
  %175 = load i32, ptr %18, align 4
  %176 = load i32, ptr %11, align 4
  %177 = icmp slt i32 %175, %176
  br i1 %177, label %178, label %183

178:                                              ; preds = %174
  %179 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %179, i32 noundef 1)
  br label %180

180:                                              ; preds = %178
  %181 = load i32, ptr %18, align 4
  %182 = add nsw i32 %181, 1
  store i32 %182, ptr %18, align 4
  br label %174, !llvm.loop !40

183:                                              ; preds = %174
  br label %196

184:                                              ; preds = %167
  %185 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %185, i32 noundef 1)
  store i32 0, ptr %19, align 4
  br label %186

186:                                              ; preds = %192, %184
  %187 = load i32, ptr %19, align 4
  %188 = load i32, ptr %11, align 4
  %189 = icmp slt i32 %187, %188
  br i1 %189, label %190, label %195

190:                                              ; preds = %186
  %191 = load ptr, ptr %12, align 8
  call void @bit_output_write_bit(ptr noundef %191, i32 noundef 0)
  br label %192

192:                                              ; preds = %190
  %193 = load i32, ptr %19, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, ptr %19, align 4
  br label %186, !llvm.loop !41

195:                                              ; preds = %186
  br label %196

196:                                              ; preds = %195, %183
  %197 = load ptr, ptr %12, align 8
  %198 = call ptr @bit_output_flush(ptr noundef %197, ptr noundef %20)
  store ptr %198, ptr %21, align 8
  %199 = load ptr, ptr %21, align 8
  %200 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %0, i32 0, i32 0
  store ptr %199, ptr %200, align 8
  %201 = load i64, ptr %20, align 8
  %202 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %0, i32 0, i32 1
  store i64 %201, ptr %202, align 8
  %203 = load ptr, ptr %12, align 8
  %204 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %203, i32 0, i32 5
  %205 = load i32, ptr %204, align 8
  %206 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %0, i32 0, i32 2
  store i32 %205, ptr %206, align 8
  %207 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %0, i32 0, i32 3
  %208 = getelementptr inbounds [256 x i32], ptr %207, i64 0, i64 0
  %209 = getelementptr inbounds [256 x i32], ptr %6, i64 0, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %208, ptr align 16 %209, i64 1024, i1 false)
  %210 = load ptr, ptr %12, align 8
  call void @bit_output_free(ptr noundef %210)
  %211 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %211)
  br label %212

212:                                              ; preds = %196, %55, %50, %27
  ret void
}

define internal ptr @create_arith_freq_table(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %8 = call noalias ptr @malloc(i64 noundef 2052)
  store ptr %8, ptr %4, align 8
  %9 = load ptr, ptr %4, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %1
  store ptr null, ptr %2, align 8
  br label %60

12:                                               ; preds = %1
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %13, i32 0, i32 0
  store i32 0, ptr %14, align 4
  store i32 0, ptr %5, align 4
  br label %15

15:                                               ; preds = %28, %12
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %16, 256
  br i1 %17, label %18, label %31

18:                                               ; preds = %15
  %19 = load ptr, ptr %3, align 8
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, ptr %19, i64 %21
  %23 = load i32, ptr %22, align 4
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 4
  %27 = add nsw i32 %26, %23
  store i32 %27, ptr %25, align 4
  br label %28

28:                                               ; preds = %18
  %29 = load i32, ptr %5, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %5, align 4
  br label %15, !llvm.loop !42

31:                                               ; preds = %15
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %32

32:                                               ; preds = %55, %31
  %33 = load i32, ptr %7, align 4
  %34 = icmp slt i32 %33, 256
  br i1 %34, label %35, label %58

35:                                               ; preds = %32
  %36 = load i32, ptr %6, align 4
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %7, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [256 x i32], ptr %38, i64 0, i64 %40
  store i32 %36, ptr %41, align 4
  %42 = load ptr, ptr %3, align 8
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i32, ptr %42, i64 %44
  %46 = load i32, ptr %45, align 4
  %47 = load i32, ptr %6, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, ptr %6, align 4
  %49 = load i32, ptr %6, align 4
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.ArithFreqTable, ptr %50, i32 0, i32 2
  %52 = load i32, ptr %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i32], ptr %51, i64 0, i64 %53
  store i32 %49, ptr %54, align 4
  br label %55

55:                                               ; preds = %35
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %7, align 4
  br label %32, !llvm.loop !43

58:                                               ; preds = %32
  %59 = load ptr, ptr %4, align 8
  store ptr %59, ptr %2, align 8
  br label %60

60:                                               ; preds = %58, %11
  %61 = load ptr, ptr %2, align 8
  ret ptr %61
}

define internal ptr @bit_output_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %3, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %32

7:                                                ; preds = %0
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %8, i32 0, i32 0
  store i32 0, ptr %9, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %10, i32 0, i32 1
  store i32 0, ptr %11, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %12, i32 0, i32 4
  store i64 1024, ptr %13, align 8
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %14, i32 0, i32 4
  %16 = load i64, ptr %15, align 8
  %17 = call noalias ptr @malloc(i64 noundef %16)
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %18, i32 0, i32 2
  store ptr %17, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %26, label %24

24:                                               ; preds = %7
  %25 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %25)
  store ptr null, ptr %1, align 8
  br label %32

26:                                               ; preds = %7
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %27, i32 0, i32 3
  store i64 0, ptr %28, align 8
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %29, i32 0, i32 5
  store i32 0, ptr %30, align 8
  %31 = load ptr, ptr %2, align 8
  store ptr %31, ptr %1, align 8
  br label %32

32:                                               ; preds = %26, %24, %6
  %33 = load ptr, ptr %1, align 8
  ret ptr %33
}

define internal void @bit_output_write_bit(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %9, label %8

8:                                                ; preds = %2
  br label %75

9:                                                ; preds = %2
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %10, i32 0, i32 0
  %12 = load i32, ptr %11, align 8
  %13 = shl i32 %12, 1
  %14 = load i32, ptr %4, align 4
  %15 = and i32 %14, 1
  %16 = or i32 %13, %15
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %17, i32 0, i32 0
  store i32 %16, ptr %18, align 8
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %20, align 4
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %23, i32 0, i32 5
  %25 = load i32, ptr %24, align 8
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %24, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %27, i32 0, i32 1
  %29 = load i32, ptr %28, align 4
  %30 = icmp eq i32 %29, 8
  br i1 %30, label %31, label %75

31:                                               ; preds = %9
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %32, i32 0, i32 3
  %34 = load i64, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %35, i32 0, i32 4
  %37 = load i64, ptr %36, align 8
  %38 = icmp uge i64 %34, %37
  br i1 %38, label %39, label %58

39:                                               ; preds = %31
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %40, i32 0, i32 4
  %42 = load i64, ptr %41, align 8
  %43 = mul i64 %42, 2
  store i64 %43, ptr %41, align 8
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %44, i32 0, i32 2
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %47, i32 0, i32 4
  %49 = load i64, ptr %48, align 8
  %50 = call ptr @realloc(ptr noundef %46, i64 noundef %49)
  store ptr %50, ptr %5, align 8
  %51 = load ptr, ptr %5, align 8
  %52 = icmp ne ptr %51, null
  br i1 %52, label %54, label %53

53:                                               ; preds = %39
  br label %75

54:                                               ; preds = %39
  %55 = load ptr, ptr %5, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %56, i32 0, i32 2
  store ptr %55, ptr %57, align 8
  br label %58

58:                                               ; preds = %54, %31
  %59 = load ptr, ptr %3, align 8
  %60 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %59, i32 0, i32 0
  %61 = load i32, ptr %60, align 8
  %62 = trunc i32 %61 to i8
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %63, i32 0, i32 2
  %65 = load ptr, ptr %64, align 8
  %66 = load ptr, ptr %3, align 8
  %67 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %66, i32 0, i32 3
  %68 = load i64, ptr %67, align 8
  %69 = add i64 %68, 1
  store i64 %69, ptr %67, align 8
  %70 = getelementptr inbounds nuw i8, ptr %65, i64 %68
  store i8 %62, ptr %70, align 1
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %71, i32 0, i32 0
  store i32 0, ptr %72, align 8
  %73 = load ptr, ptr %3, align 8
  %74 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %73, i32 0, i32 1
  store i32 0, ptr %74, align 4
  br label %75

75:                                               ; preds = %8, %53, %58, %9
  ret void
}

define internal ptr @bit_output_flush(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = load ptr, ptr %5, align 8
  store i64 0, ptr %11, align 8
  store ptr null, ptr %3, align 8
  br label %97

12:                                               ; preds = %2
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 4
  %16 = icmp sgt i32 %15, 0
  br i1 %16, label %17, label %76

17:                                               ; preds = %12
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %19, align 4
  %21 = sub nsw i32 8, %20
  %22 = load ptr, ptr %4, align 8
  %23 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = shl i32 %24, %21
  store i32 %25, ptr %23, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %26, i32 0, i32 3
  %28 = load i64, ptr %27, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %29, i32 0, i32 4
  %31 = load i64, ptr %30, align 8
  %32 = icmp uge i64 %28, %31
  br i1 %32, label %33, label %59

33:                                               ; preds = %17
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %34, i32 0, i32 4
  %36 = load i64, ptr %35, align 8
  %37 = mul i64 %36, 2
  store i64 %37, ptr %35, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %41, i32 0, i32 4
  %43 = load i64, ptr %42, align 8
  %44 = call ptr @realloc(ptr noundef %40, i64 noundef %43)
  store ptr %44, ptr %6, align 8
  %45 = load ptr, ptr %6, align 8
  %46 = icmp ne ptr %45, null
  br i1 %46, label %55, label %47

47:                                               ; preds = %33
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %48, i32 0, i32 3
  %50 = load i64, ptr %49, align 8
  %51 = load ptr, ptr %5, align 8
  store i64 %50, ptr %51, align 8
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %52, i32 0, i32 2
  %54 = load ptr, ptr %53, align 8
  store ptr %54, ptr %3, align 8
  br label %97

55:                                               ; preds = %33
  %56 = load ptr, ptr %6, align 8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %57, i32 0, i32 2
  store ptr %56, ptr %58, align 8
  br label %59

59:                                               ; preds = %55, %17
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %60, i32 0, i32 0
  %62 = load i32, ptr %61, align 8
  %63 = trunc i32 %62 to i8
  %64 = load ptr, ptr %4, align 8
  %65 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %64, i32 0, i32 2
  %66 = load ptr, ptr %65, align 8
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %67, i32 0, i32 3
  %69 = load i64, ptr %68, align 8
  %70 = add i64 %69, 1
  store i64 %70, ptr %68, align 8
  %71 = getelementptr inbounds nuw i8, ptr %66, i64 %69
  store i8 %63, ptr %71, align 1
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %72, i32 0, i32 0
  store i32 0, ptr %73, align 8
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %74, i32 0, i32 1
  store i32 0, ptr %75, align 4
  br label %76

76:                                               ; preds = %59, %12
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %77, i32 0, i32 3
  %79 = load i64, ptr %78, align 8
  %80 = load ptr, ptr %5, align 8
  store i64 %79, ptr %80, align 8
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %81, i32 0, i32 3
  %83 = load i64, ptr %82, align 8
  %84 = call noalias ptr @malloc(i64 noundef %83)
  store ptr %84, ptr %7, align 8
  %85 = load ptr, ptr %7, align 8
  %86 = icmp ne ptr %85, null
  br i1 %86, label %87, label %95

87:                                               ; preds = %76
  %88 = load ptr, ptr %7, align 8
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %89, i32 0, i32 2
  %91 = load ptr, ptr %90, align 8
  %92 = load ptr, ptr %4, align 8
  %93 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %92, i32 0, i32 3
  %94 = load i64, ptr %93, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %88, ptr align 1 %91, i64 %94, i1 false)
  br label %95

95:                                               ; preds = %87, %76
  %96 = load ptr, ptr %7, align 8
  store ptr %96, ptr %3, align 8
  br label %97

97:                                               ; preds = %95, %47, %10
  %98 = load ptr, ptr %3, align 8
  ret ptr %98
}

define internal void @bit_output_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %18

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.BitOutputStream, ptr %14, i32 0, i32 2
  store ptr null, ptr %15, align 8
  br label %16

16:                                               ; preds = %10, %5
  %17 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %17)
  br label %18

18:                                               ; preds = %16, %1
  ret void
}

define internal ptr @arith_decode(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [256 x i32], align 16
  %10 = alloca [256 x i32], align 16
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca %struct.BitInputStream, align 8
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i32, align 4
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %35

25:                                               ; preds = %2
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %35

30:                                               ; preds = %25
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %31, i32 0, i32 1
  %33 = load i64, ptr %32, align 8
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %30, %25, %2
  %36 = load ptr, ptr %5, align 8
  store i64 0, ptr %36, align 8
  store ptr null, ptr %3, align 8
  br label %228

37:                                               ; preds = %30
  store i32 0, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %38

38:                                               ; preds = %50, %37
  %39 = load i32, ptr %7, align 4
  %40 = icmp slt i32 %39, 256
  br i1 %40, label %41, label %53

41:                                               ; preds = %38
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %42, i32 0, i32 3
  %44 = load i32, ptr %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [256 x i32], ptr %43, i64 0, i64 %45
  %47 = load i32, ptr %46, align 4
  %48 = load i32, ptr %6, align 4
  %49 = add nsw i32 %48, %47
  store i32 %49, ptr %6, align 4
  br label %50

50:                                               ; preds = %41
  %51 = load i32, ptr %7, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %7, align 4
  br label %38, !llvm.loop !44

53:                                               ; preds = %38
  %54 = load i32, ptr %6, align 4
  store i32 %54, ptr %8, align 4
  %55 = load i32, ptr %8, align 4
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %59

57:                                               ; preds = %53
  %58 = load ptr, ptr %5, align 8
  store i64 0, ptr %58, align 8
  store ptr null, ptr %3, align 8
  br label %228

59:                                               ; preds = %53
  store i32 0, ptr %11, align 4
  store i32 0, ptr %12, align 4
  br label %60

60:                                               ; preds = %80, %59
  %61 = load i32, ptr %12, align 4
  %62 = icmp slt i32 %61, 256
  br i1 %62, label %63, label %83

63:                                               ; preds = %60
  %64 = load i32, ptr %11, align 4
  %65 = load i32, ptr %12, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [256 x i32], ptr %9, i64 0, i64 %66
  store i32 %64, ptr %67, align 4
  %68 = load ptr, ptr %4, align 8
  %69 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %68, i32 0, i32 3
  %70 = load i32, ptr %12, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [256 x i32], ptr %69, i64 0, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = load i32, ptr %11, align 4
  %75 = add nsw i32 %74, %73
  store i32 %75, ptr %11, align 4
  %76 = load i32, ptr %11, align 4
  %77 = load i32, ptr %12, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [256 x i32], ptr %10, i64 0, i64 %78
  store i32 %76, ptr %79, align 4
  br label %80

80:                                               ; preds = %63
  %81 = load i32, ptr %12, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %12, align 4
  br label %60, !llvm.loop !45

83:                                               ; preds = %60
  %84 = load i32, ptr %8, align 4
  %85 = sext i32 %84 to i64
  %86 = call noalias ptr @malloc(i64 noundef %85)
  store ptr %86, ptr %13, align 8
  %87 = load ptr, ptr %13, align 8
  %88 = icmp ne ptr %87, null
  br i1 %88, label %91, label %89

89:                                               ; preds = %83
  %90 = load ptr, ptr %5, align 8
  store i64 0, ptr %90, align 8
  store ptr null, ptr %3, align 8
  br label %228

91:                                               ; preds = %83
  %92 = load ptr, ptr %4, align 8
  %93 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %92, i32 0, i32 0
  %94 = load ptr, ptr %93, align 8
  %95 = load ptr, ptr %4, align 8
  %96 = getelementptr inbounds nuw %struct.ArithEncodedResult, ptr %95, i32 0, i32 1
  %97 = load i64, ptr %96, align 8
  call void @bit_input_init(ptr noundef %14, ptr noundef %94, i64 noundef %97)
  store i64 0, ptr %15, align 8
  store i32 0, ptr %16, align 4
  br label %98

98:                                               ; preds = %107, %91
  %99 = load i32, ptr %16, align 4
  %100 = icmp slt i32 %99, 32
  br i1 %100, label %101, label %110

101:                                              ; preds = %98
  %102 = load i64, ptr %15, align 8
  %103 = shl i64 %102, 1
  %104 = call i32 @bit_input_read_bit(ptr noundef %14)
  %105 = sext i32 %104 to i64
  %106 = or i64 %103, %105
  store i64 %106, ptr %15, align 8
  br label %107

107:                                              ; preds = %101
  %108 = load i32, ptr %16, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %16, align 4
  br label %98, !llvm.loop !46

110:                                              ; preds = %98
  store i64 0, ptr %17, align 8
  store i64 4294967295, ptr %18, align 8
  store i32 0, ptr %19, align 4
  br label %111

111:                                              ; preds = %220, %110
  %112 = load i32, ptr %19, align 4
  %113 = load i32, ptr %8, align 4
  %114 = icmp slt i32 %112, %113
  br i1 %114, label %115, label %223

115:                                              ; preds = %111
  %116 = load i64, ptr %18, align 8
  %117 = load i64, ptr %17, align 8
  %118 = sub i64 %116, %117
  %119 = add i64 %118, 1
  store i64 %119, ptr %20, align 8
  %120 = load i64, ptr %15, align 8
  %121 = load i64, ptr %17, align 8
  %122 = sub i64 %120, %121
  %123 = add i64 %122, 1
  %124 = load i32, ptr %6, align 4
  %125 = sext i32 %124 to i64
  %126 = mul i64 %123, %125
  %127 = sub i64 %126, 1
  %128 = load i64, ptr %20, align 8
  %129 = udiv i64 %127, %128
  store i64 %129, ptr %21, align 8
  store i32 0, ptr %22, align 4
  br label %130

130:                                              ; preds = %143, %115
  %131 = load i32, ptr %22, align 4
  %132 = icmp slt i32 %131, 255
  br i1 %132, label %133, label %141

133:                                              ; preds = %130
  %134 = load i32, ptr %22, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [256 x i32], ptr %10, i64 0, i64 %135
  %137 = load i32, ptr %136, align 4
  %138 = sext i32 %137 to i64
  %139 = load i64, ptr %21, align 8
  %140 = icmp ule i64 %138, %139
  br label %141

141:                                              ; preds = %133, %130
  %142 = phi i1 [ false, %130 ], [ %140, %133 ]
  br i1 %142, label %143, label %146

143:                                              ; preds = %141
  %144 = load i32, ptr %22, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %22, align 4
  br label %130, !llvm.loop !47

146:                                              ; preds = %141
  %147 = load i32, ptr %22, align 4
  %148 = trunc i32 %147 to i8
  %149 = load ptr, ptr %13, align 8
  %150 = load i32, ptr %19, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds i8, ptr %149, i64 %151
  store i8 %148, ptr %152, align 1
  %153 = load i64, ptr %17, align 8
  %154 = load i64, ptr %20, align 8
  %155 = load i32, ptr %22, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [256 x i32], ptr %10, i64 0, i64 %156
  %158 = load i32, ptr %157, align 4
  %159 = sext i32 %158 to i64
  %160 = mul i64 %154, %159
  %161 = load i32, ptr %6, align 4
  %162 = sext i32 %161 to i64
  %163 = udiv i64 %160, %162
  %164 = add i64 %153, %163
  %165 = sub i64 %164, 1
  store i64 %165, ptr %18, align 8
  %166 = load i64, ptr %17, align 8
  %167 = load i64, ptr %20, align 8
  %168 = load i32, ptr %22, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [256 x i32], ptr %9, i64 0, i64 %169
  %171 = load i32, ptr %170, align 4
  %172 = sext i32 %171 to i64
  %173 = mul i64 %167, %172
  %174 = load i32, ptr %6, align 4
  %175 = sext i32 %174 to i64
  %176 = udiv i64 %173, %175
  %177 = add i64 %166, %176
  store i64 %177, ptr %17, align 8
  br label %178

178:                                              ; preds = %146, %208
  %179 = load i64, ptr %18, align 8
  %180 = icmp ult i64 %179, 2147483648
  br i1 %180, label %181, label %182

181:                                              ; preds = %178
  br label %208

182:                                              ; preds = %178
  %183 = load i64, ptr %17, align 8
  %184 = icmp uge i64 %183, 2147483648
  br i1 %184, label %185, label %192

185:                                              ; preds = %182
  %186 = load i64, ptr %15, align 8
  %187 = sub i64 %186, 2147483648
  store i64 %187, ptr %15, align 8
  %188 = load i64, ptr %17, align 8
  %189 = sub i64 %188, 2147483648
  store i64 %189, ptr %17, align 8
  %190 = load i64, ptr %18, align 8
  %191 = sub i64 %190, 2147483648
  store i64 %191, ptr %18, align 8
  br label %207

192:                                              ; preds = %182
  %193 = load i64, ptr %17, align 8
  %194 = icmp uge i64 %193, 1073741824
  br i1 %194, label %195, label %205

195:                                              ; preds = %192
  %196 = load i64, ptr %18, align 8
  %197 = icmp ult i64 %196, 3221225472
  br i1 %197, label %198, label %205

198:                                              ; preds = %195
  %199 = load i64, ptr %15, align 8
  %200 = sub i64 %199, 1073741824
  store i64 %200, ptr %15, align 8
  %201 = load i64, ptr %17, align 8
  %202 = sub i64 %201, 1073741824
  store i64 %202, ptr %17, align 8
  %203 = load i64, ptr %18, align 8
  %204 = sub i64 %203, 1073741824
  store i64 %204, ptr %18, align 8
  br label %206

205:                                              ; preds = %195, %192
  br label %219

206:                                              ; preds = %198
  br label %207

207:                                              ; preds = %206, %185
  br label %208

208:                                              ; preds = %207, %181
  %209 = load i64, ptr %17, align 8
  %210 = shl i64 %209, 1
  store i64 %210, ptr %17, align 8
  %211 = load i64, ptr %18, align 8
  %212 = shl i64 %211, 1
  %213 = or i64 %212, 1
  store i64 %213, ptr %18, align 8
  %214 = load i64, ptr %15, align 8
  %215 = shl i64 %214, 1
  %216 = call i32 @bit_input_read_bit(ptr noundef %14)
  %217 = sext i32 %216 to i64
  %218 = or i64 %215, %217
  store i64 %218, ptr %15, align 8
  br label %178

219:                                              ; preds = %205
  br label %220

220:                                              ; preds = %219
  %221 = load i32, ptr %19, align 4
  %222 = add nsw i32 %221, 1
  store i32 %222, ptr %19, align 4
  br label %111, !llvm.loop !48

223:                                              ; preds = %111
  %224 = load i32, ptr %8, align 4
  %225 = sext i32 %224 to i64
  %226 = load ptr, ptr %5, align 8
  store i64 %225, ptr %226, align 8
  %227 = load ptr, ptr %13, align 8
  store ptr %227, ptr %3, align 8
  br label %228

228:                                              ; preds = %223, %89, %57, %35
  %229 = load ptr, ptr %3, align 8
  ret ptr %229
}

define internal void @bit_input_init(ptr noundef %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds nuw %struct.BitInputStream, ptr %8, i32 0, i32 0
  store ptr %7, ptr %9, align 8
  %10 = load i64, ptr %6, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.BitInputStream, ptr %11, i32 0, i32 1
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.BitInputStream, ptr %13, i32 0, i32 2
  store i64 0, ptr %14, align 8
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds nuw %struct.BitInputStream, ptr %15, i32 0, i32 3
  store i32 0, ptr %16, align 8
  %17 = load i64, ptr %6, align 8
  %18 = icmp ugt i64 %17, 0
  br i1 %18, label %19, label %24

19:                                               ; preds = %3
  %20 = load ptr, ptr %5, align 8
  %21 = getelementptr inbounds i8, ptr %20, i64 0
  %22 = load i8, ptr %21, align 1
  %23 = zext i8 %22 to i32
  br label %25

24:                                               ; preds = %3
  br label %25

25:                                               ; preds = %24, %19
  %26 = phi i32 [ %23, %19 ], [ 0, %24 ]
  %27 = trunc i32 %26 to i8
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds nuw %struct.BitInputStream, ptr %28, i32 0, i32 4
  store i8 %27, ptr %29, align 4
  ret void
}

define internal i32 @bit_input_read_bit(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.BitInputStream, ptr %4, i32 0, i32 3
  %6 = load i32, ptr %5, align 8
  %7 = icmp eq i32 %6, 8
  br i1 %7, label %8, label %38

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.BitInputStream, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr %10, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.BitInputStream, ptr %13, i32 0, i32 3
  store i32 0, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.BitInputStream, ptr %15, i32 0, i32 2
  %17 = load i64, ptr %16, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.BitInputStream, ptr %18, i32 0, i32 1
  %20 = load i64, ptr %19, align 8
  %21 = icmp ult i64 %17, %20
  br i1 %21, label %22, label %32

22:                                               ; preds = %8
  %23 = load ptr, ptr %2, align 8
  %24 = getelementptr inbounds nuw %struct.BitInputStream, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.BitInputStream, ptr %26, i32 0, i32 2
  %28 = load i64, ptr %27, align 8
  %29 = getelementptr inbounds nuw i8, ptr %25, i64 %28
  %30 = load i8, ptr %29, align 1
  %31 = zext i8 %30 to i32
  br label %33

32:                                               ; preds = %8
  br label %33

33:                                               ; preds = %32, %22
  %34 = phi i32 [ %31, %22 ], [ 0, %32 ]
  %35 = trunc i32 %34 to i8
  %36 = load ptr, ptr %2, align 8
  %37 = getelementptr inbounds nuw %struct.BitInputStream, ptr %36, i32 0, i32 4
  store i8 %35, ptr %37, align 4
  br label %38

38:                                               ; preds = %33, %1
  %39 = load ptr, ptr %2, align 8
  %40 = getelementptr inbounds nuw %struct.BitInputStream, ptr %39, i32 0, i32 4
  %41 = load i8, ptr %40, align 4
  %42 = zext i8 %41 to i32
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds nuw %struct.BitInputStream, ptr %43, i32 0, i32 3
  %45 = load i32, ptr %44, align 8
  %46 = sub nsw i32 7, %45
  %47 = ashr i32 %42, %46
  %48 = and i32 %47, 1
  store i32 %48, ptr %3, align 4
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds nuw %struct.BitInputStream, ptr %49, i32 0, i32 3
  %51 = load i32, ptr %50, align 8
  %52 = add nsw i32 %51, 1
  store i32 %52, ptr %50, align 8
  %53 = load i32, ptr %3, align 4
  ret i32 %53
}

define internal void @lzw_encode(ptr dead_on_unwind noalias writable sret(%struct.LZWResult) align 8 %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  %21 = alloca ptr, align 8
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca i64, align 8
  %26 = alloca [2 x i8], align 1
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca i32, align 4
  %36 = alloca ptr, align 8
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca ptr, align 8
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca ptr, align 8
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca ptr, align 8
  %51 = alloca i32, align 4
  %52 = alloca ptr, align 8
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca ptr, align 8
  %56 = alloca ptr, align 8
  %57 = alloca ptr, align 8
  %58 = alloca ptr, align 8
  %59 = alloca ptr, align 8
  %60 = alloca i32, align 4
  %61 = alloca i32, align 4
  %62 = alloca i32, align 4
  %63 = alloca i32, align 4
  %64 = alloca i32, align 4
  %65 = alloca ptr, align 8
  %66 = alloca i32, align 4
  %67 = alloca i32, align 4
  %68 = alloca ptr, align 8
  %69 = alloca ptr, align 8
  %70 = alloca ptr, align 8
  %71 = alloca i32, align 4
  %72 = alloca ptr, align 8
  store ptr %1, ptr %4, align 8
  store i64 %2, ptr %5, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %0, i8 0, i64 24, i1 false)
  %73 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 2
  store i32 256, ptr %73, align 8
  %74 = load i64, ptr %5, align 8
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %76, label %79

76:                                               ; preds = %3
  %77 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  store ptr null, ptr %77, align 8
  %78 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  store i64 0, ptr %78, align 8
  br label %3571

79:                                               ; preds = %3
  store ptr null, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %80

80:                                               ; preds = %954, %79
  %81 = load i32, ptr %7, align 4
  %82 = icmp slt i32 %81, 256
  br i1 %82, label %83, label %957

83:                                               ; preds = %80
  %84 = call noalias ptr @malloc(i64 noundef 2)
  store ptr %84, ptr %8, align 8
  %85 = load i32, ptr %7, align 4
  %86 = trunc i32 %85 to i8
  %87 = load ptr, ptr %8, align 8
  %88 = getelementptr inbounds i8, ptr %87, i64 0
  store i8 %86, ptr %88, align 1
  %89 = load ptr, ptr %8, align 8
  %90 = getelementptr inbounds i8, ptr %89, i64 1
  store i8 0, ptr %90, align 1
  %91 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %91, ptr %9, align 8
  %92 = load ptr, ptr %8, align 8
  %93 = load ptr, ptr %9, align 8
  %94 = getelementptr inbounds nuw %struct.DictEntry, ptr %93, i32 0, i32 0
  store ptr %92, ptr %94, align 8
  %95 = load i32, ptr %7, align 4
  %96 = load ptr, ptr %9, align 8
  %97 = getelementptr inbounds nuw %struct.DictEntry, ptr %96, i32 0, i32 1
  store i32 %95, ptr %97, align 8
  br label %98

98:                                               ; preds = %83
  br label %99

99:                                               ; preds = %98
  br label %100

100:                                              ; preds = %99
  %101 = load ptr, ptr %9, align 8
  %102 = getelementptr inbounds nuw %struct.DictEntry, ptr %101, i32 0, i32 0
  %103 = load ptr, ptr %102, align 8
  store ptr %103, ptr %14, align 8
  store i32 -17973521, ptr %10, align 4
  store i32 -1640531527, ptr %12, align 4
  store i32 -1640531527, ptr %11, align 4
  %104 = load ptr, ptr %9, align 8
  %105 = getelementptr inbounds nuw %struct.DictEntry, ptr %104, i32 0, i32 0
  %106 = load ptr, ptr %105, align 8
  %107 = call i64 @strlen(ptr noundef %106)
  %108 = trunc i64 %107 to i32
  store i32 %108, ptr %13, align 4
  br label %109

109:                                              ; preds = %276, %100
  %110 = load i32, ptr %13, align 4
  %111 = icmp uge i32 %110, 12
  br i1 %111, label %112, label %281

112:                                              ; preds = %109
  %113 = load ptr, ptr %14, align 8
  %114 = getelementptr inbounds i8, ptr %113, i64 0
  %115 = load i8, ptr %114, align 1
  %116 = zext i8 %115 to i32
  %117 = load ptr, ptr %14, align 8
  %118 = getelementptr inbounds i8, ptr %117, i64 1
  %119 = load i8, ptr %118, align 1
  %120 = zext i8 %119 to i32
  %121 = shl i32 %120, 8
  %122 = add i32 %116, %121
  %123 = load ptr, ptr %14, align 8
  %124 = getelementptr inbounds i8, ptr %123, i64 2
  %125 = load i8, ptr %124, align 1
  %126 = zext i8 %125 to i32
  %127 = shl i32 %126, 16
  %128 = add i32 %122, %127
  %129 = load ptr, ptr %14, align 8
  %130 = getelementptr inbounds i8, ptr %129, i64 3
  %131 = load i8, ptr %130, align 1
  %132 = zext i8 %131 to i32
  %133 = shl i32 %132, 24
  %134 = add i32 %128, %133
  %135 = load i32, ptr %11, align 4
  %136 = add i32 %135, %134
  store i32 %136, ptr %11, align 4
  %137 = load ptr, ptr %14, align 8
  %138 = getelementptr inbounds i8, ptr %137, i64 4
  %139 = load i8, ptr %138, align 1
  %140 = zext i8 %139 to i32
  %141 = load ptr, ptr %14, align 8
  %142 = getelementptr inbounds i8, ptr %141, i64 5
  %143 = load i8, ptr %142, align 1
  %144 = zext i8 %143 to i32
  %145 = shl i32 %144, 8
  %146 = add i32 %140, %145
  %147 = load ptr, ptr %14, align 8
  %148 = getelementptr inbounds i8, ptr %147, i64 6
  %149 = load i8, ptr %148, align 1
  %150 = zext i8 %149 to i32
  %151 = shl i32 %150, 16
  %152 = add i32 %146, %151
  %153 = load ptr, ptr %14, align 8
  %154 = getelementptr inbounds i8, ptr %153, i64 7
  %155 = load i8, ptr %154, align 1
  %156 = zext i8 %155 to i32
  %157 = shl i32 %156, 24
  %158 = add i32 %152, %157
  %159 = load i32, ptr %12, align 4
  %160 = add i32 %159, %158
  store i32 %160, ptr %12, align 4
  %161 = load ptr, ptr %14, align 8
  %162 = getelementptr inbounds i8, ptr %161, i64 8
  %163 = load i8, ptr %162, align 1
  %164 = zext i8 %163 to i32
  %165 = load ptr, ptr %14, align 8
  %166 = getelementptr inbounds i8, ptr %165, i64 9
  %167 = load i8, ptr %166, align 1
  %168 = zext i8 %167 to i32
  %169 = shl i32 %168, 8
  %170 = add i32 %164, %169
  %171 = load ptr, ptr %14, align 8
  %172 = getelementptr inbounds i8, ptr %171, i64 10
  %173 = load i8, ptr %172, align 1
  %174 = zext i8 %173 to i32
  %175 = shl i32 %174, 16
  %176 = add i32 %170, %175
  %177 = load ptr, ptr %14, align 8
  %178 = getelementptr inbounds i8, ptr %177, i64 11
  %179 = load i8, ptr %178, align 1
  %180 = zext i8 %179 to i32
  %181 = shl i32 %180, 24
  %182 = add i32 %176, %181
  %183 = load i32, ptr %10, align 4
  %184 = add i32 %183, %182
  store i32 %184, ptr %10, align 4
  br label %185

185:                                              ; preds = %112
  %186 = load i32, ptr %12, align 4
  %187 = load i32, ptr %11, align 4
  %188 = sub i32 %187, %186
  store i32 %188, ptr %11, align 4
  %189 = load i32, ptr %10, align 4
  %190 = load i32, ptr %11, align 4
  %191 = sub i32 %190, %189
  store i32 %191, ptr %11, align 4
  %192 = load i32, ptr %10, align 4
  %193 = lshr i32 %192, 13
  %194 = load i32, ptr %11, align 4
  %195 = xor i32 %194, %193
  store i32 %195, ptr %11, align 4
  %196 = load i32, ptr %10, align 4
  %197 = load i32, ptr %12, align 4
  %198 = sub i32 %197, %196
  store i32 %198, ptr %12, align 4
  %199 = load i32, ptr %11, align 4
  %200 = load i32, ptr %12, align 4
  %201 = sub i32 %200, %199
  store i32 %201, ptr %12, align 4
  %202 = load i32, ptr %11, align 4
  %203 = shl i32 %202, 8
  %204 = load i32, ptr %12, align 4
  %205 = xor i32 %204, %203
  store i32 %205, ptr %12, align 4
  %206 = load i32, ptr %11, align 4
  %207 = load i32, ptr %10, align 4
  %208 = sub i32 %207, %206
  store i32 %208, ptr %10, align 4
  %209 = load i32, ptr %12, align 4
  %210 = load i32, ptr %10, align 4
  %211 = sub i32 %210, %209
  store i32 %211, ptr %10, align 4
  %212 = load i32, ptr %12, align 4
  %213 = lshr i32 %212, 13
  %214 = load i32, ptr %10, align 4
  %215 = xor i32 %214, %213
  store i32 %215, ptr %10, align 4
  %216 = load i32, ptr %12, align 4
  %217 = load i32, ptr %11, align 4
  %218 = sub i32 %217, %216
  store i32 %218, ptr %11, align 4
  %219 = load i32, ptr %10, align 4
  %220 = load i32, ptr %11, align 4
  %221 = sub i32 %220, %219
  store i32 %221, ptr %11, align 4
  %222 = load i32, ptr %10, align 4
  %223 = lshr i32 %222, 12
  %224 = load i32, ptr %11, align 4
  %225 = xor i32 %224, %223
  store i32 %225, ptr %11, align 4
  %226 = load i32, ptr %10, align 4
  %227 = load i32, ptr %12, align 4
  %228 = sub i32 %227, %226
  store i32 %228, ptr %12, align 4
  %229 = load i32, ptr %11, align 4
  %230 = load i32, ptr %12, align 4
  %231 = sub i32 %230, %229
  store i32 %231, ptr %12, align 4
  %232 = load i32, ptr %11, align 4
  %233 = shl i32 %232, 16
  %234 = load i32, ptr %12, align 4
  %235 = xor i32 %234, %233
  store i32 %235, ptr %12, align 4
  %236 = load i32, ptr %11, align 4
  %237 = load i32, ptr %10, align 4
  %238 = sub i32 %237, %236
  store i32 %238, ptr %10, align 4
  %239 = load i32, ptr %12, align 4
  %240 = load i32, ptr %10, align 4
  %241 = sub i32 %240, %239
  store i32 %241, ptr %10, align 4
  %242 = load i32, ptr %12, align 4
  %243 = lshr i32 %242, 5
  %244 = load i32, ptr %10, align 4
  %245 = xor i32 %244, %243
  store i32 %245, ptr %10, align 4
  %246 = load i32, ptr %12, align 4
  %247 = load i32, ptr %11, align 4
  %248 = sub i32 %247, %246
  store i32 %248, ptr %11, align 4
  %249 = load i32, ptr %10, align 4
  %250 = load i32, ptr %11, align 4
  %251 = sub i32 %250, %249
  store i32 %251, ptr %11, align 4
  %252 = load i32, ptr %10, align 4
  %253 = lshr i32 %252, 3
  %254 = load i32, ptr %11, align 4
  %255 = xor i32 %254, %253
  store i32 %255, ptr %11, align 4
  %256 = load i32, ptr %10, align 4
  %257 = load i32, ptr %12, align 4
  %258 = sub i32 %257, %256
  store i32 %258, ptr %12, align 4
  %259 = load i32, ptr %11, align 4
  %260 = load i32, ptr %12, align 4
  %261 = sub i32 %260, %259
  store i32 %261, ptr %12, align 4
  %262 = load i32, ptr %11, align 4
  %263 = shl i32 %262, 10
  %264 = load i32, ptr %12, align 4
  %265 = xor i32 %264, %263
  store i32 %265, ptr %12, align 4
  %266 = load i32, ptr %11, align 4
  %267 = load i32, ptr %10, align 4
  %268 = sub i32 %267, %266
  store i32 %268, ptr %10, align 4
  %269 = load i32, ptr %12, align 4
  %270 = load i32, ptr %10, align 4
  %271 = sub i32 %270, %269
  store i32 %271, ptr %10, align 4
  %272 = load i32, ptr %12, align 4
  %273 = lshr i32 %272, 15
  %274 = load i32, ptr %10, align 4
  %275 = xor i32 %274, %273
  store i32 %275, ptr %10, align 4
  br label %276

276:                                              ; preds = %185
  %277 = load ptr, ptr %14, align 8
  %278 = getelementptr inbounds i8, ptr %277, i64 12
  store ptr %278, ptr %14, align 8
  %279 = load i32, ptr %13, align 4
  %280 = sub i32 %279, 12
  store i32 %280, ptr %13, align 4
  br label %109, !llvm.loop !49

281:                                              ; preds = %109
  %282 = load ptr, ptr %9, align 8
  %283 = getelementptr inbounds nuw %struct.DictEntry, ptr %282, i32 0, i32 0
  %284 = load ptr, ptr %283, align 8
  %285 = call i64 @strlen(ptr noundef %284)
  %286 = trunc i64 %285 to i32
  %287 = load i32, ptr %10, align 4
  %288 = add i32 %287, %286
  store i32 %288, ptr %10, align 4
  %289 = load i32, ptr %13, align 4
  switch i32 %289, label %376 [
    i32 11, label %290
    i32 10, label %298
    i32 9, label %306
    i32 8, label %314
    i32 7, label %322
    i32 6, label %330
    i32 5, label %338
    i32 4, label %345
    i32 3, label %353
    i32 2, label %361
    i32 1, label %369
  ]

290:                                              ; preds = %281
  %291 = load ptr, ptr %14, align 8
  %292 = getelementptr inbounds i8, ptr %291, i64 10
  %293 = load i8, ptr %292, align 1
  %294 = zext i8 %293 to i32
  %295 = shl i32 %294, 24
  %296 = load i32, ptr %10, align 4
  %297 = add i32 %296, %295
  store i32 %297, ptr %10, align 4
  br label %298

298:                                              ; preds = %281, %290
  %299 = load ptr, ptr %14, align 8
  %300 = getelementptr inbounds i8, ptr %299, i64 9
  %301 = load i8, ptr %300, align 1
  %302 = zext i8 %301 to i32
  %303 = shl i32 %302, 16
  %304 = load i32, ptr %10, align 4
  %305 = add i32 %304, %303
  store i32 %305, ptr %10, align 4
  br label %306

306:                                              ; preds = %281, %298
  %307 = load ptr, ptr %14, align 8
  %308 = getelementptr inbounds i8, ptr %307, i64 8
  %309 = load i8, ptr %308, align 1
  %310 = zext i8 %309 to i32
  %311 = shl i32 %310, 8
  %312 = load i32, ptr %10, align 4
  %313 = add i32 %312, %311
  store i32 %313, ptr %10, align 4
  br label %314

314:                                              ; preds = %281, %306
  %315 = load ptr, ptr %14, align 8
  %316 = getelementptr inbounds i8, ptr %315, i64 7
  %317 = load i8, ptr %316, align 1
  %318 = zext i8 %317 to i32
  %319 = shl i32 %318, 24
  %320 = load i32, ptr %12, align 4
  %321 = add i32 %320, %319
  store i32 %321, ptr %12, align 4
  br label %322

322:                                              ; preds = %281, %314
  %323 = load ptr, ptr %14, align 8
  %324 = getelementptr inbounds i8, ptr %323, i64 6
  %325 = load i8, ptr %324, align 1
  %326 = zext i8 %325 to i32
  %327 = shl i32 %326, 16
  %328 = load i32, ptr %12, align 4
  %329 = add i32 %328, %327
  store i32 %329, ptr %12, align 4
  br label %330

330:                                              ; preds = %281, %322
  %331 = load ptr, ptr %14, align 8
  %332 = getelementptr inbounds i8, ptr %331, i64 5
  %333 = load i8, ptr %332, align 1
  %334 = zext i8 %333 to i32
  %335 = shl i32 %334, 8
  %336 = load i32, ptr %12, align 4
  %337 = add i32 %336, %335
  store i32 %337, ptr %12, align 4
  br label %338

338:                                              ; preds = %281, %330
  %339 = load ptr, ptr %14, align 8
  %340 = getelementptr inbounds i8, ptr %339, i64 4
  %341 = load i8, ptr %340, align 1
  %342 = zext i8 %341 to i32
  %343 = load i32, ptr %12, align 4
  %344 = add i32 %343, %342
  store i32 %344, ptr %12, align 4
  br label %345

345:                                              ; preds = %281, %338
  %346 = load ptr, ptr %14, align 8
  %347 = getelementptr inbounds i8, ptr %346, i64 3
  %348 = load i8, ptr %347, align 1
  %349 = zext i8 %348 to i32
  %350 = shl i32 %349, 24
  %351 = load i32, ptr %11, align 4
  %352 = add i32 %351, %350
  store i32 %352, ptr %11, align 4
  br label %353

353:                                              ; preds = %281, %345
  %354 = load ptr, ptr %14, align 8
  %355 = getelementptr inbounds i8, ptr %354, i64 2
  %356 = load i8, ptr %355, align 1
  %357 = zext i8 %356 to i32
  %358 = shl i32 %357, 16
  %359 = load i32, ptr %11, align 4
  %360 = add i32 %359, %358
  store i32 %360, ptr %11, align 4
  br label %361

361:                                              ; preds = %281, %353
  %362 = load ptr, ptr %14, align 8
  %363 = getelementptr inbounds i8, ptr %362, i64 1
  %364 = load i8, ptr %363, align 1
  %365 = zext i8 %364 to i32
  %366 = shl i32 %365, 8
  %367 = load i32, ptr %11, align 4
  %368 = add i32 %367, %366
  store i32 %368, ptr %11, align 4
  br label %369

369:                                              ; preds = %281, %361
  %370 = load ptr, ptr %14, align 8
  %371 = getelementptr inbounds i8, ptr %370, i64 0
  %372 = load i8, ptr %371, align 1
  %373 = zext i8 %372 to i32
  %374 = load i32, ptr %11, align 4
  %375 = add i32 %374, %373
  store i32 %375, ptr %11, align 4
  br label %376

376:                                              ; preds = %281, %369
  br label %377

377:                                              ; preds = %376
  br label %378

378:                                              ; preds = %377
  %379 = load i32, ptr %12, align 4
  %380 = load i32, ptr %11, align 4
  %381 = sub i32 %380, %379
  store i32 %381, ptr %11, align 4
  %382 = load i32, ptr %10, align 4
  %383 = load i32, ptr %11, align 4
  %384 = sub i32 %383, %382
  store i32 %384, ptr %11, align 4
  %385 = load i32, ptr %10, align 4
  %386 = lshr i32 %385, 13
  %387 = load i32, ptr %11, align 4
  %388 = xor i32 %387, %386
  store i32 %388, ptr %11, align 4
  %389 = load i32, ptr %10, align 4
  %390 = load i32, ptr %12, align 4
  %391 = sub i32 %390, %389
  store i32 %391, ptr %12, align 4
  %392 = load i32, ptr %11, align 4
  %393 = load i32, ptr %12, align 4
  %394 = sub i32 %393, %392
  store i32 %394, ptr %12, align 4
  %395 = load i32, ptr %11, align 4
  %396 = shl i32 %395, 8
  %397 = load i32, ptr %12, align 4
  %398 = xor i32 %397, %396
  store i32 %398, ptr %12, align 4
  %399 = load i32, ptr %11, align 4
  %400 = load i32, ptr %10, align 4
  %401 = sub i32 %400, %399
  store i32 %401, ptr %10, align 4
  %402 = load i32, ptr %12, align 4
  %403 = load i32, ptr %10, align 4
  %404 = sub i32 %403, %402
  store i32 %404, ptr %10, align 4
  %405 = load i32, ptr %12, align 4
  %406 = lshr i32 %405, 13
  %407 = load i32, ptr %10, align 4
  %408 = xor i32 %407, %406
  store i32 %408, ptr %10, align 4
  %409 = load i32, ptr %12, align 4
  %410 = load i32, ptr %11, align 4
  %411 = sub i32 %410, %409
  store i32 %411, ptr %11, align 4
  %412 = load i32, ptr %10, align 4
  %413 = load i32, ptr %11, align 4
  %414 = sub i32 %413, %412
  store i32 %414, ptr %11, align 4
  %415 = load i32, ptr %10, align 4
  %416 = lshr i32 %415, 12
  %417 = load i32, ptr %11, align 4
  %418 = xor i32 %417, %416
  store i32 %418, ptr %11, align 4
  %419 = load i32, ptr %10, align 4
  %420 = load i32, ptr %12, align 4
  %421 = sub i32 %420, %419
  store i32 %421, ptr %12, align 4
  %422 = load i32, ptr %11, align 4
  %423 = load i32, ptr %12, align 4
  %424 = sub i32 %423, %422
  store i32 %424, ptr %12, align 4
  %425 = load i32, ptr %11, align 4
  %426 = shl i32 %425, 16
  %427 = load i32, ptr %12, align 4
  %428 = xor i32 %427, %426
  store i32 %428, ptr %12, align 4
  %429 = load i32, ptr %11, align 4
  %430 = load i32, ptr %10, align 4
  %431 = sub i32 %430, %429
  store i32 %431, ptr %10, align 4
  %432 = load i32, ptr %12, align 4
  %433 = load i32, ptr %10, align 4
  %434 = sub i32 %433, %432
  store i32 %434, ptr %10, align 4
  %435 = load i32, ptr %12, align 4
  %436 = lshr i32 %435, 5
  %437 = load i32, ptr %10, align 4
  %438 = xor i32 %437, %436
  store i32 %438, ptr %10, align 4
  %439 = load i32, ptr %12, align 4
  %440 = load i32, ptr %11, align 4
  %441 = sub i32 %440, %439
  store i32 %441, ptr %11, align 4
  %442 = load i32, ptr %10, align 4
  %443 = load i32, ptr %11, align 4
  %444 = sub i32 %443, %442
  store i32 %444, ptr %11, align 4
  %445 = load i32, ptr %10, align 4
  %446 = lshr i32 %445, 3
  %447 = load i32, ptr %11, align 4
  %448 = xor i32 %447, %446
  store i32 %448, ptr %11, align 4
  %449 = load i32, ptr %10, align 4
  %450 = load i32, ptr %12, align 4
  %451 = sub i32 %450, %449
  store i32 %451, ptr %12, align 4
  %452 = load i32, ptr %11, align 4
  %453 = load i32, ptr %12, align 4
  %454 = sub i32 %453, %452
  store i32 %454, ptr %12, align 4
  %455 = load i32, ptr %11, align 4
  %456 = shl i32 %455, 10
  %457 = load i32, ptr %12, align 4
  %458 = xor i32 %457, %456
  store i32 %458, ptr %12, align 4
  %459 = load i32, ptr %11, align 4
  %460 = load i32, ptr %10, align 4
  %461 = sub i32 %460, %459
  store i32 %461, ptr %10, align 4
  %462 = load i32, ptr %12, align 4
  %463 = load i32, ptr %10, align 4
  %464 = sub i32 %463, %462
  store i32 %464, ptr %10, align 4
  %465 = load i32, ptr %12, align 4
  %466 = lshr i32 %465, 15
  %467 = load i32, ptr %10, align 4
  %468 = xor i32 %467, %466
  store i32 %468, ptr %10, align 4
  br label %469

469:                                              ; preds = %378
  br label %470

470:                                              ; preds = %469
  br label %471

471:                                              ; preds = %470
  br label %472

472:                                              ; preds = %471
  %473 = load i32, ptr %10, align 4
  %474 = load ptr, ptr %9, align 8
  %475 = getelementptr inbounds nuw %struct.DictEntry, ptr %474, i32 0, i32 2
  %476 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %475, i32 0, i32 7
  store i32 %473, ptr %476, align 4
  %477 = load ptr, ptr %9, align 8
  %478 = getelementptr inbounds nuw %struct.DictEntry, ptr %477, i32 0, i32 0
  %479 = load ptr, ptr %478, align 8
  %480 = load ptr, ptr %9, align 8
  %481 = getelementptr inbounds nuw %struct.DictEntry, ptr %480, i32 0, i32 2
  %482 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %481, i32 0, i32 5
  store ptr %479, ptr %482, align 8
  %483 = load ptr, ptr %9, align 8
  %484 = getelementptr inbounds nuw %struct.DictEntry, ptr %483, i32 0, i32 0
  %485 = load ptr, ptr %484, align 8
  %486 = call i64 @strlen(ptr noundef %485)
  %487 = trunc i64 %486 to i32
  %488 = load ptr, ptr %9, align 8
  %489 = getelementptr inbounds nuw %struct.DictEntry, ptr %488, i32 0, i32 2
  %490 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %489, i32 0, i32 6
  store i32 %487, ptr %490, align 8
  %491 = load ptr, ptr %6, align 8
  %492 = icmp ne ptr %491, null
  br i1 %492, label %574, label %493

493:                                              ; preds = %472
  %494 = load ptr, ptr %9, align 8
  %495 = getelementptr inbounds nuw %struct.DictEntry, ptr %494, i32 0, i32 2
  %496 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %495, i32 0, i32 2
  store ptr null, ptr %496, align 8
  %497 = load ptr, ptr %9, align 8
  %498 = getelementptr inbounds nuw %struct.DictEntry, ptr %497, i32 0, i32 2
  %499 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %498, i32 0, i32 1
  store ptr null, ptr %499, align 8
  br label %500

500:                                              ; preds = %493
  %501 = call noalias ptr @malloc(i64 noundef 64)
  %502 = load ptr, ptr %9, align 8
  %503 = getelementptr inbounds nuw %struct.DictEntry, ptr %502, i32 0, i32 2
  %504 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %503, i32 0, i32 0
  store ptr %501, ptr %504, align 8
  %505 = load ptr, ptr %9, align 8
  %506 = getelementptr inbounds nuw %struct.DictEntry, ptr %505, i32 0, i32 2
  %507 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %506, i32 0, i32 0
  %508 = load ptr, ptr %507, align 8
  %509 = icmp ne ptr %508, null
  br i1 %509, label %511, label %510

510:                                              ; preds = %500
  call void @exit(i32 noundef -1)
  unreachable

511:                                              ; preds = %500
  %512 = load ptr, ptr %9, align 8
  %513 = getelementptr inbounds nuw %struct.DictEntry, ptr %512, i32 0, i32 2
  %514 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %513, i32 0, i32 0
  %515 = load ptr, ptr %514, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %515, i8 0, i64 64, i1 false)
  %516 = load ptr, ptr %9, align 8
  %517 = getelementptr inbounds nuw %struct.DictEntry, ptr %516, i32 0, i32 2
  %518 = load ptr, ptr %9, align 8
  %519 = getelementptr inbounds nuw %struct.DictEntry, ptr %518, i32 0, i32 2
  %520 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %519, i32 0, i32 0
  %521 = load ptr, ptr %520, align 8
  %522 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %521, i32 0, i32 4
  store ptr %517, ptr %522, align 8
  %523 = load ptr, ptr %9, align 8
  %524 = getelementptr inbounds nuw %struct.DictEntry, ptr %523, i32 0, i32 2
  %525 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %524, i32 0, i32 0
  %526 = load ptr, ptr %525, align 8
  %527 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %526, i32 0, i32 1
  store i32 32, ptr %527, align 8
  %528 = load ptr, ptr %9, align 8
  %529 = getelementptr inbounds nuw %struct.DictEntry, ptr %528, i32 0, i32 2
  %530 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %529, i32 0, i32 0
  %531 = load ptr, ptr %530, align 8
  %532 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %531, i32 0, i32 2
  store i32 5, ptr %532, align 4
  %533 = load ptr, ptr %9, align 8
  %534 = getelementptr inbounds nuw %struct.DictEntry, ptr %533, i32 0, i32 2
  %535 = load ptr, ptr %9, align 8
  %536 = ptrtoint ptr %534 to i64
  %537 = ptrtoint ptr %535 to i64
  %538 = sub i64 %536, %537
  %539 = load ptr, ptr %9, align 8
  %540 = getelementptr inbounds nuw %struct.DictEntry, ptr %539, i32 0, i32 2
  %541 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %540, i32 0, i32 0
  %542 = load ptr, ptr %541, align 8
  %543 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %542, i32 0, i32 5
  store i64 %538, ptr %543, align 8
  %544 = call noalias ptr @malloc(i64 noundef 512)
  %545 = load ptr, ptr %9, align 8
  %546 = getelementptr inbounds nuw %struct.DictEntry, ptr %545, i32 0, i32 2
  %547 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %546, i32 0, i32 0
  %548 = load ptr, ptr %547, align 8
  %549 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %548, i32 0, i32 0
  store ptr %544, ptr %549, align 8
  %550 = load ptr, ptr %9, align 8
  %551 = getelementptr inbounds nuw %struct.DictEntry, ptr %550, i32 0, i32 2
  %552 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %551, i32 0, i32 0
  %553 = load ptr, ptr %552, align 8
  %554 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %553, i32 0, i32 10
  store i32 -1609490463, ptr %554, align 8
  %555 = load ptr, ptr %9, align 8
  %556 = getelementptr inbounds nuw %struct.DictEntry, ptr %555, i32 0, i32 2
  %557 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %556, i32 0, i32 0
  %558 = load ptr, ptr %557, align 8
  %559 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %558, i32 0, i32 0
  %560 = load ptr, ptr %559, align 8
  %561 = icmp ne ptr %560, null
  br i1 %561, label %563, label %562

562:                                              ; preds = %511
  call void @exit(i32 noundef -1)
  unreachable

563:                                              ; preds = %511
  %564 = load ptr, ptr %9, align 8
  %565 = getelementptr inbounds nuw %struct.DictEntry, ptr %564, i32 0, i32 2
  %566 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %565, i32 0, i32 0
  %567 = load ptr, ptr %566, align 8
  %568 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %567, i32 0, i32 0
  %569 = load ptr, ptr %568, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %569, i8 0, i64 512, i1 false)
  br label %570

570:                                              ; preds = %563
  br label %571

571:                                              ; preds = %570
  br label %572

572:                                              ; preds = %571
  %573 = load ptr, ptr %9, align 8
  store ptr %573, ptr %6, align 8
  br label %619

574:                                              ; preds = %472
  %575 = load ptr, ptr %6, align 8
  %576 = getelementptr inbounds nuw %struct.DictEntry, ptr %575, i32 0, i32 2
  %577 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %576, i32 0, i32 0
  %578 = load ptr, ptr %577, align 8
  %579 = load ptr, ptr %9, align 8
  %580 = getelementptr inbounds nuw %struct.DictEntry, ptr %579, i32 0, i32 2
  %581 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %580, i32 0, i32 0
  store ptr %578, ptr %581, align 8
  br label %582

582:                                              ; preds = %574
  %583 = load ptr, ptr %9, align 8
  %584 = getelementptr inbounds nuw %struct.DictEntry, ptr %583, i32 0, i32 2
  %585 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %584, i32 0, i32 2
  store ptr null, ptr %585, align 8
  %586 = load ptr, ptr %6, align 8
  %587 = getelementptr inbounds nuw %struct.DictEntry, ptr %586, i32 0, i32 2
  %588 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %587, i32 0, i32 0
  %589 = load ptr, ptr %588, align 8
  %590 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %589, i32 0, i32 4
  %591 = load ptr, ptr %590, align 8
  %592 = load ptr, ptr %6, align 8
  %593 = getelementptr inbounds nuw %struct.DictEntry, ptr %592, i32 0, i32 2
  %594 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %593, i32 0, i32 0
  %595 = load ptr, ptr %594, align 8
  %596 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %595, i32 0, i32 5
  %597 = load i64, ptr %596, align 8
  %598 = sub i64 0, %597
  %599 = getelementptr inbounds i8, ptr %591, i64 %598
  %600 = load ptr, ptr %9, align 8
  %601 = getelementptr inbounds nuw %struct.DictEntry, ptr %600, i32 0, i32 2
  %602 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %601, i32 0, i32 1
  store ptr %599, ptr %602, align 8
  %603 = load ptr, ptr %9, align 8
  %604 = load ptr, ptr %6, align 8
  %605 = getelementptr inbounds nuw %struct.DictEntry, ptr %604, i32 0, i32 2
  %606 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %605, i32 0, i32 0
  %607 = load ptr, ptr %606, align 8
  %608 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %607, i32 0, i32 4
  %609 = load ptr, ptr %608, align 8
  %610 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %609, i32 0, i32 2
  store ptr %603, ptr %610, align 8
  %611 = load ptr, ptr %9, align 8
  %612 = getelementptr inbounds nuw %struct.DictEntry, ptr %611, i32 0, i32 2
  %613 = load ptr, ptr %6, align 8
  %614 = getelementptr inbounds nuw %struct.DictEntry, ptr %613, i32 0, i32 2
  %615 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %614, i32 0, i32 0
  %616 = load ptr, ptr %615, align 8
  %617 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %616, i32 0, i32 4
  store ptr %612, ptr %617, align 8
  br label %618

618:                                              ; preds = %582
  br label %619

619:                                              ; preds = %618, %572
  br label %620

620:                                              ; preds = %619
  %621 = load ptr, ptr %6, align 8
  %622 = getelementptr inbounds nuw %struct.DictEntry, ptr %621, i32 0, i32 2
  %623 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %622, i32 0, i32 0
  %624 = load ptr, ptr %623, align 8
  %625 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %624, i32 0, i32 3
  %626 = load i32, ptr %625, align 8
  %627 = add i32 %626, 1
  store i32 %627, ptr %625, align 8
  br label %628

628:                                              ; preds = %620
  %629 = load i32, ptr %10, align 4
  %630 = load ptr, ptr %6, align 8
  %631 = getelementptr inbounds nuw %struct.DictEntry, ptr %630, i32 0, i32 2
  %632 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %631, i32 0, i32 0
  %633 = load ptr, ptr %632, align 8
  %634 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %633, i32 0, i32 1
  %635 = load i32, ptr %634, align 8
  %636 = sub i32 %635, 1
  %637 = and i32 %629, %636
  store i32 %637, ptr %15, align 4
  br label %638

638:                                              ; preds = %628
  br label %639

639:                                              ; preds = %638
  %640 = load ptr, ptr %6, align 8
  %641 = getelementptr inbounds nuw %struct.DictEntry, ptr %640, i32 0, i32 2
  %642 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %641, i32 0, i32 0
  %643 = load ptr, ptr %642, align 8
  %644 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %643, i32 0, i32 0
  %645 = load ptr, ptr %644, align 8
  %646 = load i32, ptr %15, align 4
  %647 = zext i32 %646 to i64
  %648 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %645, i64 %647
  store ptr %648, ptr %16, align 8
  %649 = load ptr, ptr %16, align 8
  %650 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %649, i32 0, i32 1
  %651 = load i32, ptr %650, align 8
  %652 = add i32 %651, 1
  store i32 %652, ptr %650, align 8
  %653 = load ptr, ptr %16, align 8
  %654 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %653, i32 0, i32 0
  %655 = load ptr, ptr %654, align 8
  %656 = load ptr, ptr %9, align 8
  %657 = getelementptr inbounds nuw %struct.DictEntry, ptr %656, i32 0, i32 2
  %658 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %657, i32 0, i32 4
  store ptr %655, ptr %658, align 8
  %659 = load ptr, ptr %9, align 8
  %660 = getelementptr inbounds nuw %struct.DictEntry, ptr %659, i32 0, i32 2
  %661 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %660, i32 0, i32 3
  store ptr null, ptr %661, align 8
  %662 = load ptr, ptr %16, align 8
  %663 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %662, i32 0, i32 0
  %664 = load ptr, ptr %663, align 8
  %665 = icmp ne ptr %664, null
  br i1 %665, label %666, label %673

666:                                              ; preds = %639
  %667 = load ptr, ptr %9, align 8
  %668 = getelementptr inbounds nuw %struct.DictEntry, ptr %667, i32 0, i32 2
  %669 = load ptr, ptr %16, align 8
  %670 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %669, i32 0, i32 0
  %671 = load ptr, ptr %670, align 8
  %672 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %671, i32 0, i32 3
  store ptr %668, ptr %672, align 8
  br label %673

673:                                              ; preds = %666, %639
  %674 = load ptr, ptr %9, align 8
  %675 = getelementptr inbounds nuw %struct.DictEntry, ptr %674, i32 0, i32 2
  %676 = load ptr, ptr %16, align 8
  %677 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %676, i32 0, i32 0
  store ptr %675, ptr %677, align 8
  %678 = load ptr, ptr %16, align 8
  %679 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %678, i32 0, i32 1
  %680 = load i32, ptr %679, align 8
  %681 = load ptr, ptr %16, align 8
  %682 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %681, i32 0, i32 2
  %683 = load i32, ptr %682, align 4
  %684 = add i32 %683, 1
  %685 = mul i32 %684, 10
  %686 = icmp uge i32 %680, %685
  br i1 %686, label %687, label %949

687:                                              ; preds = %673
  %688 = load ptr, ptr %9, align 8
  %689 = getelementptr inbounds nuw %struct.DictEntry, ptr %688, i32 0, i32 2
  %690 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %689, i32 0, i32 0
  %691 = load ptr, ptr %690, align 8
  %692 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %691, i32 0, i32 9
  %693 = load i32, ptr %692, align 4
  %694 = icmp ne i32 %693, 0
  br i1 %694, label %949, label %695

695:                                              ; preds = %687
  br label %696

696:                                              ; preds = %695
  %697 = load ptr, ptr %9, align 8
  %698 = getelementptr inbounds nuw %struct.DictEntry, ptr %697, i32 0, i32 2
  %699 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %698, i32 0, i32 0
  %700 = load ptr, ptr %699, align 8
  %701 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %700, i32 0, i32 1
  %702 = load i32, ptr %701, align 8
  %703 = zext i32 %702 to i64
  %704 = mul i64 16, %703
  %705 = mul i64 %704, 2
  %706 = call noalias ptr @malloc(i64 noundef %705)
  store ptr %706, ptr %21, align 8
  %707 = load ptr, ptr %21, align 8
  %708 = icmp ne ptr %707, null
  br i1 %708, label %710, label %709

709:                                              ; preds = %696
  call void @exit(i32 noundef -1)
  unreachable

710:                                              ; preds = %696
  %711 = load ptr, ptr %21, align 8
  %712 = load ptr, ptr %9, align 8
  %713 = getelementptr inbounds nuw %struct.DictEntry, ptr %712, i32 0, i32 2
  %714 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %713, i32 0, i32 0
  %715 = load ptr, ptr %714, align 8
  %716 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %715, i32 0, i32 1
  %717 = load i32, ptr %716, align 8
  %718 = zext i32 %717 to i64
  %719 = mul i64 16, %718
  %720 = mul i64 %719, 2
  call void @llvm.memset.p0.i64(ptr align 8 %711, i8 0, i64 %720, i1 false)
  %721 = load ptr, ptr %9, align 8
  %722 = getelementptr inbounds nuw %struct.DictEntry, ptr %721, i32 0, i32 2
  %723 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %722, i32 0, i32 0
  %724 = load ptr, ptr %723, align 8
  %725 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %724, i32 0, i32 3
  %726 = load i32, ptr %725, align 8
  %727 = load ptr, ptr %9, align 8
  %728 = getelementptr inbounds nuw %struct.DictEntry, ptr %727, i32 0, i32 2
  %729 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %728, i32 0, i32 0
  %730 = load ptr, ptr %729, align 8
  %731 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %730, i32 0, i32 2
  %732 = load i32, ptr %731, align 4
  %733 = add i32 %732, 1
  %734 = lshr i32 %726, %733
  %735 = load ptr, ptr %9, align 8
  %736 = getelementptr inbounds nuw %struct.DictEntry, ptr %735, i32 0, i32 2
  %737 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %736, i32 0, i32 0
  %738 = load ptr, ptr %737, align 8
  %739 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %738, i32 0, i32 3
  %740 = load i32, ptr %739, align 8
  %741 = load ptr, ptr %9, align 8
  %742 = getelementptr inbounds nuw %struct.DictEntry, ptr %741, i32 0, i32 2
  %743 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %742, i32 0, i32 0
  %744 = load ptr, ptr %743, align 8
  %745 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %744, i32 0, i32 1
  %746 = load i32, ptr %745, align 8
  %747 = mul i32 %746, 2
  %748 = sub i32 %747, 1
  %749 = and i32 %740, %748
  %750 = icmp ne i32 %749, 0
  %751 = zext i1 %750 to i64
  %752 = select i1 %750, i32 1, i32 0
  %753 = add i32 %734, %752
  %754 = load ptr, ptr %9, align 8
  %755 = getelementptr inbounds nuw %struct.DictEntry, ptr %754, i32 0, i32 2
  %756 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %755, i32 0, i32 0
  %757 = load ptr, ptr %756, align 8
  %758 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %757, i32 0, i32 6
  store i32 %753, ptr %758, align 8
  %759 = load ptr, ptr %9, align 8
  %760 = getelementptr inbounds nuw %struct.DictEntry, ptr %759, i32 0, i32 2
  %761 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %760, i32 0, i32 0
  %762 = load ptr, ptr %761, align 8
  %763 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %762, i32 0, i32 7
  store i32 0, ptr %763, align 4
  store i32 0, ptr %18, align 4
  br label %764

764:                                              ; preds = %873, %710
  %765 = load i32, ptr %18, align 4
  %766 = load ptr, ptr %9, align 8
  %767 = getelementptr inbounds nuw %struct.DictEntry, ptr %766, i32 0, i32 2
  %768 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %767, i32 0, i32 0
  %769 = load ptr, ptr %768, align 8
  %770 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %769, i32 0, i32 1
  %771 = load i32, ptr %770, align 8
  %772 = icmp ult i32 %765, %771
  br i1 %772, label %773, label %876

773:                                              ; preds = %764
  %774 = load ptr, ptr %9, align 8
  %775 = getelementptr inbounds nuw %struct.DictEntry, ptr %774, i32 0, i32 2
  %776 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %775, i32 0, i32 0
  %777 = load ptr, ptr %776, align 8
  %778 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %777, i32 0, i32 0
  %779 = load ptr, ptr %778, align 8
  %780 = load i32, ptr %18, align 4
  %781 = zext i32 %780 to i64
  %782 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %779, i64 %781
  %783 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %782, i32 0, i32 0
  %784 = load ptr, ptr %783, align 8
  store ptr %784, ptr %19, align 8
  br label %785

785:                                              ; preds = %867, %773
  %786 = load ptr, ptr %19, align 8
  %787 = icmp ne ptr %786, null
  br i1 %787, label %788, label %872

788:                                              ; preds = %785
  %789 = load ptr, ptr %19, align 8
  %790 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %789, i32 0, i32 4
  %791 = load ptr, ptr %790, align 8
  store ptr %791, ptr %20, align 8
  br label %792

792:                                              ; preds = %788
  %793 = load ptr, ptr %19, align 8
  %794 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %793, i32 0, i32 7
  %795 = load i32, ptr %794, align 4
  %796 = load ptr, ptr %9, align 8
  %797 = getelementptr inbounds nuw %struct.DictEntry, ptr %796, i32 0, i32 2
  %798 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %797, i32 0, i32 0
  %799 = load ptr, ptr %798, align 8
  %800 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %799, i32 0, i32 1
  %801 = load i32, ptr %800, align 8
  %802 = mul i32 %801, 2
  %803 = sub i32 %802, 1
  %804 = and i32 %795, %803
  store i32 %804, ptr %17, align 4
  br label %805

805:                                              ; preds = %792
  %806 = load ptr, ptr %21, align 8
  %807 = load i32, ptr %17, align 4
  %808 = zext i32 %807 to i64
  %809 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %806, i64 %808
  store ptr %809, ptr %22, align 8
  %810 = load ptr, ptr %22, align 8
  %811 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %810, i32 0, i32 1
  %812 = load i32, ptr %811, align 8
  %813 = add i32 %812, 1
  store i32 %813, ptr %811, align 8
  %814 = load ptr, ptr %9, align 8
  %815 = getelementptr inbounds nuw %struct.DictEntry, ptr %814, i32 0, i32 2
  %816 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %815, i32 0, i32 0
  %817 = load ptr, ptr %816, align 8
  %818 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %817, i32 0, i32 6
  %819 = load i32, ptr %818, align 8
  %820 = icmp ugt i32 %813, %819
  br i1 %820, label %821, label %849

821:                                              ; preds = %805
  %822 = load ptr, ptr %9, align 8
  %823 = getelementptr inbounds nuw %struct.DictEntry, ptr %822, i32 0, i32 2
  %824 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %823, i32 0, i32 0
  %825 = load ptr, ptr %824, align 8
  %826 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %825, i32 0, i32 7
  %827 = load i32, ptr %826, align 4
  %828 = add i32 %827, 1
  store i32 %828, ptr %826, align 4
  %829 = load ptr, ptr %22, align 8
  %830 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %829, i32 0, i32 1
  %831 = load i32, ptr %830, align 8
  %832 = load ptr, ptr %22, align 8
  %833 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %832, i32 0, i32 2
  %834 = load i32, ptr %833, align 4
  %835 = load ptr, ptr %9, align 8
  %836 = getelementptr inbounds nuw %struct.DictEntry, ptr %835, i32 0, i32 2
  %837 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %836, i32 0, i32 0
  %838 = load ptr, ptr %837, align 8
  %839 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %838, i32 0, i32 6
  %840 = load i32, ptr %839, align 8
  %841 = mul i32 %834, %840
  %842 = icmp ugt i32 %831, %841
  br i1 %842, label %843, label %848

843:                                              ; preds = %821
  %844 = load ptr, ptr %22, align 8
  %845 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %844, i32 0, i32 2
  %846 = load i32, ptr %845, align 4
  %847 = add i32 %846, 1
  store i32 %847, ptr %845, align 4
  br label %848

848:                                              ; preds = %843, %821
  br label %849

849:                                              ; preds = %848, %805
  %850 = load ptr, ptr %19, align 8
  %851 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %850, i32 0, i32 3
  store ptr null, ptr %851, align 8
  %852 = load ptr, ptr %22, align 8
  %853 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %852, i32 0, i32 0
  %854 = load ptr, ptr %853, align 8
  %855 = load ptr, ptr %19, align 8
  %856 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %855, i32 0, i32 4
  store ptr %854, ptr %856, align 8
  %857 = load ptr, ptr %22, align 8
  %858 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %857, i32 0, i32 0
  %859 = load ptr, ptr %858, align 8
  %860 = icmp ne ptr %859, null
  br i1 %860, label %861, label %867

861:                                              ; preds = %849
  %862 = load ptr, ptr %19, align 8
  %863 = load ptr, ptr %22, align 8
  %864 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %863, i32 0, i32 0
  %865 = load ptr, ptr %864, align 8
  %866 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %865, i32 0, i32 3
  store ptr %862, ptr %866, align 8
  br label %867

867:                                              ; preds = %861, %849
  %868 = load ptr, ptr %19, align 8
  %869 = load ptr, ptr %22, align 8
  %870 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %869, i32 0, i32 0
  store ptr %868, ptr %870, align 8
  %871 = load ptr, ptr %20, align 8
  store ptr %871, ptr %19, align 8
  br label %785, !llvm.loop !50

872:                                              ; preds = %785
  br label %873

873:                                              ; preds = %872
  %874 = load i32, ptr %18, align 4
  %875 = add i32 %874, 1
  store i32 %875, ptr %18, align 4
  br label %764, !llvm.loop !51

876:                                              ; preds = %764
  %877 = load ptr, ptr %9, align 8
  %878 = getelementptr inbounds nuw %struct.DictEntry, ptr %877, i32 0, i32 2
  %879 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %878, i32 0, i32 0
  %880 = load ptr, ptr %879, align 8
  %881 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %880, i32 0, i32 0
  %882 = load ptr, ptr %881, align 8
  call void @free(ptr noundef %882)
  %883 = load ptr, ptr %9, align 8
  %884 = getelementptr inbounds nuw %struct.DictEntry, ptr %883, i32 0, i32 2
  %885 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %884, i32 0, i32 0
  %886 = load ptr, ptr %885, align 8
  %887 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %886, i32 0, i32 1
  %888 = load i32, ptr %887, align 8
  %889 = mul i32 %888, 2
  store i32 %889, ptr %887, align 8
  %890 = load ptr, ptr %9, align 8
  %891 = getelementptr inbounds nuw %struct.DictEntry, ptr %890, i32 0, i32 2
  %892 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %891, i32 0, i32 0
  %893 = load ptr, ptr %892, align 8
  %894 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %893, i32 0, i32 2
  %895 = load i32, ptr %894, align 4
  %896 = add i32 %895, 1
  store i32 %896, ptr %894, align 4
  %897 = load ptr, ptr %21, align 8
  %898 = load ptr, ptr %9, align 8
  %899 = getelementptr inbounds nuw %struct.DictEntry, ptr %898, i32 0, i32 2
  %900 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %899, i32 0, i32 0
  %901 = load ptr, ptr %900, align 8
  %902 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %901, i32 0, i32 0
  store ptr %897, ptr %902, align 8
  %903 = load ptr, ptr %9, align 8
  %904 = getelementptr inbounds nuw %struct.DictEntry, ptr %903, i32 0, i32 2
  %905 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %904, i32 0, i32 0
  %906 = load ptr, ptr %905, align 8
  %907 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %906, i32 0, i32 7
  %908 = load i32, ptr %907, align 4
  %909 = load ptr, ptr %9, align 8
  %910 = getelementptr inbounds nuw %struct.DictEntry, ptr %909, i32 0, i32 2
  %911 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %910, i32 0, i32 0
  %912 = load ptr, ptr %911, align 8
  %913 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %912, i32 0, i32 3
  %914 = load i32, ptr %913, align 8
  %915 = lshr i32 %914, 1
  %916 = icmp ugt i32 %908, %915
  br i1 %916, label %917, label %925

917:                                              ; preds = %876
  %918 = load ptr, ptr %9, align 8
  %919 = getelementptr inbounds nuw %struct.DictEntry, ptr %918, i32 0, i32 2
  %920 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %919, i32 0, i32 0
  %921 = load ptr, ptr %920, align 8
  %922 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %921, i32 0, i32 8
  %923 = load i32, ptr %922, align 8
  %924 = add i32 %923, 1
  br label %926

925:                                              ; preds = %876
  br label %926

926:                                              ; preds = %925, %917
  %927 = phi i32 [ %924, %917 ], [ 0, %925 ]
  %928 = load ptr, ptr %9, align 8
  %929 = getelementptr inbounds nuw %struct.DictEntry, ptr %928, i32 0, i32 2
  %930 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %929, i32 0, i32 0
  %931 = load ptr, ptr %930, align 8
  %932 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %931, i32 0, i32 8
  store i32 %927, ptr %932, align 8
  %933 = load ptr, ptr %9, align 8
  %934 = getelementptr inbounds nuw %struct.DictEntry, ptr %933, i32 0, i32 2
  %935 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %934, i32 0, i32 0
  %936 = load ptr, ptr %935, align 8
  %937 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %936, i32 0, i32 8
  %938 = load i32, ptr %937, align 8
  %939 = icmp ugt i32 %938, 1
  br i1 %939, label %940, label %946

940:                                              ; preds = %926
  %941 = load ptr, ptr %9, align 8
  %942 = getelementptr inbounds nuw %struct.DictEntry, ptr %941, i32 0, i32 2
  %943 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %942, i32 0, i32 0
  %944 = load ptr, ptr %943, align 8
  %945 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %944, i32 0, i32 9
  store i32 1, ptr %945, align 4
  br label %946

946:                                              ; preds = %940, %926
  br label %947

947:                                              ; preds = %946
  br label %948

948:                                              ; preds = %947
  br label %949

949:                                              ; preds = %948, %687, %673
  br label %950

950:                                              ; preds = %949
  br label %951

951:                                              ; preds = %950
  br label %952

952:                                              ; preds = %951
  br label %953

953:                                              ; preds = %952
  br label %954

954:                                              ; preds = %953
  %955 = load i32, ptr %7, align 4
  %956 = add nsw i32 %955, 1
  store i32 %956, ptr %7, align 4
  br label %80, !llvm.loop !52

957:                                              ; preds = %80
  store i32 256, ptr %23, align 4
  %958 = load i64, ptr %5, align 8
  %959 = mul i64 %958, 2
  %960 = call noalias ptr @malloc(i64 noundef %959)
  %961 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  store ptr %960, ptr %961, align 8
  %962 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  store i64 0, ptr %962, align 8
  %963 = call noalias ptr @malloc(i64 noundef 2)
  store ptr %963, ptr %24, align 8
  %964 = load ptr, ptr %4, align 8
  %965 = getelementptr inbounds i8, ptr %964, i64 0
  %966 = load i8, ptr %965, align 1
  %967 = load ptr, ptr %24, align 8
  %968 = getelementptr inbounds i8, ptr %967, i64 0
  store i8 %966, ptr %968, align 1
  %969 = load ptr, ptr %24, align 8
  %970 = getelementptr inbounds i8, ptr %969, i64 1
  store i8 0, ptr %970, align 1
  store i64 1, ptr %25, align 8
  br label %971

971:                                              ; preds = %2858, %957
  %972 = load i64, ptr %25, align 8
  %973 = load i64, ptr %5, align 8
  %974 = icmp ult i64 %972, %973
  br i1 %974, label %975, label %2861

975:                                              ; preds = %971
  %976 = load ptr, ptr %4, align 8
  %977 = load i64, ptr %25, align 8
  %978 = getelementptr inbounds nuw i8, ptr %976, i64 %977
  %979 = load i8, ptr %978, align 1
  store i8 %979, ptr %26, align 1
  %980 = getelementptr inbounds i8, ptr %26, i64 1
  store i8 0, ptr %980, align 1
  %981 = load ptr, ptr %24, align 8
  %982 = call i64 @strlen(ptr noundef %981)
  %983 = add i64 %982, 2
  %984 = call noalias ptr @malloc(i64 noundef %983)
  store ptr %984, ptr %27, align 8
  %985 = load ptr, ptr %27, align 8
  %986 = load ptr, ptr %24, align 8
  %987 = call ptr @strcpy(ptr noundef %985, ptr noundef %986)
  %988 = load ptr, ptr %27, align 8
  %989 = getelementptr inbounds [2 x i8], ptr %26, i64 0, i64 0
  %990 = call ptr @strcat(ptr noundef %988, ptr noundef %989)
  store ptr null, ptr %28, align 8
  br label %991

991:                                              ; preds = %975
  %992 = load ptr, ptr %27, align 8
  %993 = call i64 @strlen(ptr noundef %992)
  %994 = trunc i64 %993 to i32
  store i32 %994, ptr %29, align 4
  br label %995

995:                                              ; preds = %991
  store ptr null, ptr %28, align 8
  %996 = load ptr, ptr %6, align 8
  %997 = icmp ne ptr %996, null
  br i1 %997, label %998, label %1470

998:                                              ; preds = %995
  br label %999

999:                                              ; preds = %998
  br label %1000

1000:                                             ; preds = %999
  %1001 = load ptr, ptr %27, align 8
  store ptr %1001, ptr %34, align 8
  store i32 -17973521, ptr %30, align 4
  store i32 -1640531527, ptr %32, align 4
  store i32 -1640531527, ptr %31, align 4
  %1002 = load i32, ptr %29, align 4
  store i32 %1002, ptr %33, align 4
  br label %1003

1003:                                             ; preds = %1170, %1000
  %1004 = load i32, ptr %33, align 4
  %1005 = icmp uge i32 %1004, 12
  br i1 %1005, label %1006, label %1175

1006:                                             ; preds = %1003
  %1007 = load ptr, ptr %34, align 8
  %1008 = getelementptr inbounds i8, ptr %1007, i64 0
  %1009 = load i8, ptr %1008, align 1
  %1010 = zext i8 %1009 to i32
  %1011 = load ptr, ptr %34, align 8
  %1012 = getelementptr inbounds i8, ptr %1011, i64 1
  %1013 = load i8, ptr %1012, align 1
  %1014 = zext i8 %1013 to i32
  %1015 = shl i32 %1014, 8
  %1016 = add i32 %1010, %1015
  %1017 = load ptr, ptr %34, align 8
  %1018 = getelementptr inbounds i8, ptr %1017, i64 2
  %1019 = load i8, ptr %1018, align 1
  %1020 = zext i8 %1019 to i32
  %1021 = shl i32 %1020, 16
  %1022 = add i32 %1016, %1021
  %1023 = load ptr, ptr %34, align 8
  %1024 = getelementptr inbounds i8, ptr %1023, i64 3
  %1025 = load i8, ptr %1024, align 1
  %1026 = zext i8 %1025 to i32
  %1027 = shl i32 %1026, 24
  %1028 = add i32 %1022, %1027
  %1029 = load i32, ptr %31, align 4
  %1030 = add i32 %1029, %1028
  store i32 %1030, ptr %31, align 4
  %1031 = load ptr, ptr %34, align 8
  %1032 = getelementptr inbounds i8, ptr %1031, i64 4
  %1033 = load i8, ptr %1032, align 1
  %1034 = zext i8 %1033 to i32
  %1035 = load ptr, ptr %34, align 8
  %1036 = getelementptr inbounds i8, ptr %1035, i64 5
  %1037 = load i8, ptr %1036, align 1
  %1038 = zext i8 %1037 to i32
  %1039 = shl i32 %1038, 8
  %1040 = add i32 %1034, %1039
  %1041 = load ptr, ptr %34, align 8
  %1042 = getelementptr inbounds i8, ptr %1041, i64 6
  %1043 = load i8, ptr %1042, align 1
  %1044 = zext i8 %1043 to i32
  %1045 = shl i32 %1044, 16
  %1046 = add i32 %1040, %1045
  %1047 = load ptr, ptr %34, align 8
  %1048 = getelementptr inbounds i8, ptr %1047, i64 7
  %1049 = load i8, ptr %1048, align 1
  %1050 = zext i8 %1049 to i32
  %1051 = shl i32 %1050, 24
  %1052 = add i32 %1046, %1051
  %1053 = load i32, ptr %32, align 4
  %1054 = add i32 %1053, %1052
  store i32 %1054, ptr %32, align 4
  %1055 = load ptr, ptr %34, align 8
  %1056 = getelementptr inbounds i8, ptr %1055, i64 8
  %1057 = load i8, ptr %1056, align 1
  %1058 = zext i8 %1057 to i32
  %1059 = load ptr, ptr %34, align 8
  %1060 = getelementptr inbounds i8, ptr %1059, i64 9
  %1061 = load i8, ptr %1060, align 1
  %1062 = zext i8 %1061 to i32
  %1063 = shl i32 %1062, 8
  %1064 = add i32 %1058, %1063
  %1065 = load ptr, ptr %34, align 8
  %1066 = getelementptr inbounds i8, ptr %1065, i64 10
  %1067 = load i8, ptr %1066, align 1
  %1068 = zext i8 %1067 to i32
  %1069 = shl i32 %1068, 16
  %1070 = add i32 %1064, %1069
  %1071 = load ptr, ptr %34, align 8
  %1072 = getelementptr inbounds i8, ptr %1071, i64 11
  %1073 = load i8, ptr %1072, align 1
  %1074 = zext i8 %1073 to i32
  %1075 = shl i32 %1074, 24
  %1076 = add i32 %1070, %1075
  %1077 = load i32, ptr %30, align 4
  %1078 = add i32 %1077, %1076
  store i32 %1078, ptr %30, align 4
  br label %1079

1079:                                             ; preds = %1006
  %1080 = load i32, ptr %32, align 4
  %1081 = load i32, ptr %31, align 4
  %1082 = sub i32 %1081, %1080
  store i32 %1082, ptr %31, align 4
  %1083 = load i32, ptr %30, align 4
  %1084 = load i32, ptr %31, align 4
  %1085 = sub i32 %1084, %1083
  store i32 %1085, ptr %31, align 4
  %1086 = load i32, ptr %30, align 4
  %1087 = lshr i32 %1086, 13
  %1088 = load i32, ptr %31, align 4
  %1089 = xor i32 %1088, %1087
  store i32 %1089, ptr %31, align 4
  %1090 = load i32, ptr %30, align 4
  %1091 = load i32, ptr %32, align 4
  %1092 = sub i32 %1091, %1090
  store i32 %1092, ptr %32, align 4
  %1093 = load i32, ptr %31, align 4
  %1094 = load i32, ptr %32, align 4
  %1095 = sub i32 %1094, %1093
  store i32 %1095, ptr %32, align 4
  %1096 = load i32, ptr %31, align 4
  %1097 = shl i32 %1096, 8
  %1098 = load i32, ptr %32, align 4
  %1099 = xor i32 %1098, %1097
  store i32 %1099, ptr %32, align 4
  %1100 = load i32, ptr %31, align 4
  %1101 = load i32, ptr %30, align 4
  %1102 = sub i32 %1101, %1100
  store i32 %1102, ptr %30, align 4
  %1103 = load i32, ptr %32, align 4
  %1104 = load i32, ptr %30, align 4
  %1105 = sub i32 %1104, %1103
  store i32 %1105, ptr %30, align 4
  %1106 = load i32, ptr %32, align 4
  %1107 = lshr i32 %1106, 13
  %1108 = load i32, ptr %30, align 4
  %1109 = xor i32 %1108, %1107
  store i32 %1109, ptr %30, align 4
  %1110 = load i32, ptr %32, align 4
  %1111 = load i32, ptr %31, align 4
  %1112 = sub i32 %1111, %1110
  store i32 %1112, ptr %31, align 4
  %1113 = load i32, ptr %30, align 4
  %1114 = load i32, ptr %31, align 4
  %1115 = sub i32 %1114, %1113
  store i32 %1115, ptr %31, align 4
  %1116 = load i32, ptr %30, align 4
  %1117 = lshr i32 %1116, 12
  %1118 = load i32, ptr %31, align 4
  %1119 = xor i32 %1118, %1117
  store i32 %1119, ptr %31, align 4
  %1120 = load i32, ptr %30, align 4
  %1121 = load i32, ptr %32, align 4
  %1122 = sub i32 %1121, %1120
  store i32 %1122, ptr %32, align 4
  %1123 = load i32, ptr %31, align 4
  %1124 = load i32, ptr %32, align 4
  %1125 = sub i32 %1124, %1123
  store i32 %1125, ptr %32, align 4
  %1126 = load i32, ptr %31, align 4
  %1127 = shl i32 %1126, 16
  %1128 = load i32, ptr %32, align 4
  %1129 = xor i32 %1128, %1127
  store i32 %1129, ptr %32, align 4
  %1130 = load i32, ptr %31, align 4
  %1131 = load i32, ptr %30, align 4
  %1132 = sub i32 %1131, %1130
  store i32 %1132, ptr %30, align 4
  %1133 = load i32, ptr %32, align 4
  %1134 = load i32, ptr %30, align 4
  %1135 = sub i32 %1134, %1133
  store i32 %1135, ptr %30, align 4
  %1136 = load i32, ptr %32, align 4
  %1137 = lshr i32 %1136, 5
  %1138 = load i32, ptr %30, align 4
  %1139 = xor i32 %1138, %1137
  store i32 %1139, ptr %30, align 4
  %1140 = load i32, ptr %32, align 4
  %1141 = load i32, ptr %31, align 4
  %1142 = sub i32 %1141, %1140
  store i32 %1142, ptr %31, align 4
  %1143 = load i32, ptr %30, align 4
  %1144 = load i32, ptr %31, align 4
  %1145 = sub i32 %1144, %1143
  store i32 %1145, ptr %31, align 4
  %1146 = load i32, ptr %30, align 4
  %1147 = lshr i32 %1146, 3
  %1148 = load i32, ptr %31, align 4
  %1149 = xor i32 %1148, %1147
  store i32 %1149, ptr %31, align 4
  %1150 = load i32, ptr %30, align 4
  %1151 = load i32, ptr %32, align 4
  %1152 = sub i32 %1151, %1150
  store i32 %1152, ptr %32, align 4
  %1153 = load i32, ptr %31, align 4
  %1154 = load i32, ptr %32, align 4
  %1155 = sub i32 %1154, %1153
  store i32 %1155, ptr %32, align 4
  %1156 = load i32, ptr %31, align 4
  %1157 = shl i32 %1156, 10
  %1158 = load i32, ptr %32, align 4
  %1159 = xor i32 %1158, %1157
  store i32 %1159, ptr %32, align 4
  %1160 = load i32, ptr %31, align 4
  %1161 = load i32, ptr %30, align 4
  %1162 = sub i32 %1161, %1160
  store i32 %1162, ptr %30, align 4
  %1163 = load i32, ptr %32, align 4
  %1164 = load i32, ptr %30, align 4
  %1165 = sub i32 %1164, %1163
  store i32 %1165, ptr %30, align 4
  %1166 = load i32, ptr %32, align 4
  %1167 = lshr i32 %1166, 15
  %1168 = load i32, ptr %30, align 4
  %1169 = xor i32 %1168, %1167
  store i32 %1169, ptr %30, align 4
  br label %1170

1170:                                             ; preds = %1079
  %1171 = load ptr, ptr %34, align 8
  %1172 = getelementptr inbounds i8, ptr %1171, i64 12
  store ptr %1172, ptr %34, align 8
  %1173 = load i32, ptr %33, align 4
  %1174 = sub i32 %1173, 12
  store i32 %1174, ptr %33, align 4
  br label %1003, !llvm.loop !53

1175:                                             ; preds = %1003
  %1176 = load i32, ptr %29, align 4
  %1177 = load i32, ptr %30, align 4
  %1178 = add i32 %1177, %1176
  store i32 %1178, ptr %30, align 4
  %1179 = load i32, ptr %33, align 4
  switch i32 %1179, label %1266 [
    i32 11, label %1180
    i32 10, label %1188
    i32 9, label %1196
    i32 8, label %1204
    i32 7, label %1212
    i32 6, label %1220
    i32 5, label %1228
    i32 4, label %1235
    i32 3, label %1243
    i32 2, label %1251
    i32 1, label %1259
  ]

1180:                                             ; preds = %1175
  %1181 = load ptr, ptr %34, align 8
  %1182 = getelementptr inbounds i8, ptr %1181, i64 10
  %1183 = load i8, ptr %1182, align 1
  %1184 = zext i8 %1183 to i32
  %1185 = shl i32 %1184, 24
  %1186 = load i32, ptr %30, align 4
  %1187 = add i32 %1186, %1185
  store i32 %1187, ptr %30, align 4
  br label %1188

1188:                                             ; preds = %1175, %1180
  %1189 = load ptr, ptr %34, align 8
  %1190 = getelementptr inbounds i8, ptr %1189, i64 9
  %1191 = load i8, ptr %1190, align 1
  %1192 = zext i8 %1191 to i32
  %1193 = shl i32 %1192, 16
  %1194 = load i32, ptr %30, align 4
  %1195 = add i32 %1194, %1193
  store i32 %1195, ptr %30, align 4
  br label %1196

1196:                                             ; preds = %1175, %1188
  %1197 = load ptr, ptr %34, align 8
  %1198 = getelementptr inbounds i8, ptr %1197, i64 8
  %1199 = load i8, ptr %1198, align 1
  %1200 = zext i8 %1199 to i32
  %1201 = shl i32 %1200, 8
  %1202 = load i32, ptr %30, align 4
  %1203 = add i32 %1202, %1201
  store i32 %1203, ptr %30, align 4
  br label %1204

1204:                                             ; preds = %1175, %1196
  %1205 = load ptr, ptr %34, align 8
  %1206 = getelementptr inbounds i8, ptr %1205, i64 7
  %1207 = load i8, ptr %1206, align 1
  %1208 = zext i8 %1207 to i32
  %1209 = shl i32 %1208, 24
  %1210 = load i32, ptr %32, align 4
  %1211 = add i32 %1210, %1209
  store i32 %1211, ptr %32, align 4
  br label %1212

1212:                                             ; preds = %1175, %1204
  %1213 = load ptr, ptr %34, align 8
  %1214 = getelementptr inbounds i8, ptr %1213, i64 6
  %1215 = load i8, ptr %1214, align 1
  %1216 = zext i8 %1215 to i32
  %1217 = shl i32 %1216, 16
  %1218 = load i32, ptr %32, align 4
  %1219 = add i32 %1218, %1217
  store i32 %1219, ptr %32, align 4
  br label %1220

1220:                                             ; preds = %1175, %1212
  %1221 = load ptr, ptr %34, align 8
  %1222 = getelementptr inbounds i8, ptr %1221, i64 5
  %1223 = load i8, ptr %1222, align 1
  %1224 = zext i8 %1223 to i32
  %1225 = shl i32 %1224, 8
  %1226 = load i32, ptr %32, align 4
  %1227 = add i32 %1226, %1225
  store i32 %1227, ptr %32, align 4
  br label %1228

1228:                                             ; preds = %1175, %1220
  %1229 = load ptr, ptr %34, align 8
  %1230 = getelementptr inbounds i8, ptr %1229, i64 4
  %1231 = load i8, ptr %1230, align 1
  %1232 = zext i8 %1231 to i32
  %1233 = load i32, ptr %32, align 4
  %1234 = add i32 %1233, %1232
  store i32 %1234, ptr %32, align 4
  br label %1235

1235:                                             ; preds = %1175, %1228
  %1236 = load ptr, ptr %34, align 8
  %1237 = getelementptr inbounds i8, ptr %1236, i64 3
  %1238 = load i8, ptr %1237, align 1
  %1239 = zext i8 %1238 to i32
  %1240 = shl i32 %1239, 24
  %1241 = load i32, ptr %31, align 4
  %1242 = add i32 %1241, %1240
  store i32 %1242, ptr %31, align 4
  br label %1243

1243:                                             ; preds = %1175, %1235
  %1244 = load ptr, ptr %34, align 8
  %1245 = getelementptr inbounds i8, ptr %1244, i64 2
  %1246 = load i8, ptr %1245, align 1
  %1247 = zext i8 %1246 to i32
  %1248 = shl i32 %1247, 16
  %1249 = load i32, ptr %31, align 4
  %1250 = add i32 %1249, %1248
  store i32 %1250, ptr %31, align 4
  br label %1251

1251:                                             ; preds = %1175, %1243
  %1252 = load ptr, ptr %34, align 8
  %1253 = getelementptr inbounds i8, ptr %1252, i64 1
  %1254 = load i8, ptr %1253, align 1
  %1255 = zext i8 %1254 to i32
  %1256 = shl i32 %1255, 8
  %1257 = load i32, ptr %31, align 4
  %1258 = add i32 %1257, %1256
  store i32 %1258, ptr %31, align 4
  br label %1259

1259:                                             ; preds = %1175, %1251
  %1260 = load ptr, ptr %34, align 8
  %1261 = getelementptr inbounds i8, ptr %1260, i64 0
  %1262 = load i8, ptr %1261, align 1
  %1263 = zext i8 %1262 to i32
  %1264 = load i32, ptr %31, align 4
  %1265 = add i32 %1264, %1263
  store i32 %1265, ptr %31, align 4
  br label %1266

1266:                                             ; preds = %1175, %1259
  br label %1267

1267:                                             ; preds = %1266
  br label %1268

1268:                                             ; preds = %1267
  %1269 = load i32, ptr %32, align 4
  %1270 = load i32, ptr %31, align 4
  %1271 = sub i32 %1270, %1269
  store i32 %1271, ptr %31, align 4
  %1272 = load i32, ptr %30, align 4
  %1273 = load i32, ptr %31, align 4
  %1274 = sub i32 %1273, %1272
  store i32 %1274, ptr %31, align 4
  %1275 = load i32, ptr %30, align 4
  %1276 = lshr i32 %1275, 13
  %1277 = load i32, ptr %31, align 4
  %1278 = xor i32 %1277, %1276
  store i32 %1278, ptr %31, align 4
  %1279 = load i32, ptr %30, align 4
  %1280 = load i32, ptr %32, align 4
  %1281 = sub i32 %1280, %1279
  store i32 %1281, ptr %32, align 4
  %1282 = load i32, ptr %31, align 4
  %1283 = load i32, ptr %32, align 4
  %1284 = sub i32 %1283, %1282
  store i32 %1284, ptr %32, align 4
  %1285 = load i32, ptr %31, align 4
  %1286 = shl i32 %1285, 8
  %1287 = load i32, ptr %32, align 4
  %1288 = xor i32 %1287, %1286
  store i32 %1288, ptr %32, align 4
  %1289 = load i32, ptr %31, align 4
  %1290 = load i32, ptr %30, align 4
  %1291 = sub i32 %1290, %1289
  store i32 %1291, ptr %30, align 4
  %1292 = load i32, ptr %32, align 4
  %1293 = load i32, ptr %30, align 4
  %1294 = sub i32 %1293, %1292
  store i32 %1294, ptr %30, align 4
  %1295 = load i32, ptr %32, align 4
  %1296 = lshr i32 %1295, 13
  %1297 = load i32, ptr %30, align 4
  %1298 = xor i32 %1297, %1296
  store i32 %1298, ptr %30, align 4
  %1299 = load i32, ptr %32, align 4
  %1300 = load i32, ptr %31, align 4
  %1301 = sub i32 %1300, %1299
  store i32 %1301, ptr %31, align 4
  %1302 = load i32, ptr %30, align 4
  %1303 = load i32, ptr %31, align 4
  %1304 = sub i32 %1303, %1302
  store i32 %1304, ptr %31, align 4
  %1305 = load i32, ptr %30, align 4
  %1306 = lshr i32 %1305, 12
  %1307 = load i32, ptr %31, align 4
  %1308 = xor i32 %1307, %1306
  store i32 %1308, ptr %31, align 4
  %1309 = load i32, ptr %30, align 4
  %1310 = load i32, ptr %32, align 4
  %1311 = sub i32 %1310, %1309
  store i32 %1311, ptr %32, align 4
  %1312 = load i32, ptr %31, align 4
  %1313 = load i32, ptr %32, align 4
  %1314 = sub i32 %1313, %1312
  store i32 %1314, ptr %32, align 4
  %1315 = load i32, ptr %31, align 4
  %1316 = shl i32 %1315, 16
  %1317 = load i32, ptr %32, align 4
  %1318 = xor i32 %1317, %1316
  store i32 %1318, ptr %32, align 4
  %1319 = load i32, ptr %31, align 4
  %1320 = load i32, ptr %30, align 4
  %1321 = sub i32 %1320, %1319
  store i32 %1321, ptr %30, align 4
  %1322 = load i32, ptr %32, align 4
  %1323 = load i32, ptr %30, align 4
  %1324 = sub i32 %1323, %1322
  store i32 %1324, ptr %30, align 4
  %1325 = load i32, ptr %32, align 4
  %1326 = lshr i32 %1325, 5
  %1327 = load i32, ptr %30, align 4
  %1328 = xor i32 %1327, %1326
  store i32 %1328, ptr %30, align 4
  %1329 = load i32, ptr %32, align 4
  %1330 = load i32, ptr %31, align 4
  %1331 = sub i32 %1330, %1329
  store i32 %1331, ptr %31, align 4
  %1332 = load i32, ptr %30, align 4
  %1333 = load i32, ptr %31, align 4
  %1334 = sub i32 %1333, %1332
  store i32 %1334, ptr %31, align 4
  %1335 = load i32, ptr %30, align 4
  %1336 = lshr i32 %1335, 3
  %1337 = load i32, ptr %31, align 4
  %1338 = xor i32 %1337, %1336
  store i32 %1338, ptr %31, align 4
  %1339 = load i32, ptr %30, align 4
  %1340 = load i32, ptr %32, align 4
  %1341 = sub i32 %1340, %1339
  store i32 %1341, ptr %32, align 4
  %1342 = load i32, ptr %31, align 4
  %1343 = load i32, ptr %32, align 4
  %1344 = sub i32 %1343, %1342
  store i32 %1344, ptr %32, align 4
  %1345 = load i32, ptr %31, align 4
  %1346 = shl i32 %1345, 10
  %1347 = load i32, ptr %32, align 4
  %1348 = xor i32 %1347, %1346
  store i32 %1348, ptr %32, align 4
  %1349 = load i32, ptr %31, align 4
  %1350 = load i32, ptr %30, align 4
  %1351 = sub i32 %1350, %1349
  store i32 %1351, ptr %30, align 4
  %1352 = load i32, ptr %32, align 4
  %1353 = load i32, ptr %30, align 4
  %1354 = sub i32 %1353, %1352
  store i32 %1354, ptr %30, align 4
  %1355 = load i32, ptr %32, align 4
  %1356 = lshr i32 %1355, 15
  %1357 = load i32, ptr %30, align 4
  %1358 = xor i32 %1357, %1356
  store i32 %1358, ptr %30, align 4
  br label %1359

1359:                                             ; preds = %1268
  br label %1360

1360:                                             ; preds = %1359
  br label %1361

1361:                                             ; preds = %1360
  br label %1362

1362:                                             ; preds = %1361
  store ptr null, ptr %28, align 8
  %1363 = load ptr, ptr %6, align 8
  %1364 = icmp ne ptr %1363, null
  br i1 %1364, label %1365, label %1468

1365:                                             ; preds = %1362
  br label %1366

1366:                                             ; preds = %1365
  %1367 = load i32, ptr %30, align 4
  %1368 = load ptr, ptr %6, align 8
  %1369 = getelementptr inbounds nuw %struct.DictEntry, ptr %1368, i32 0, i32 2
  %1370 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1369, i32 0, i32 0
  %1371 = load ptr, ptr %1370, align 8
  %1372 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1371, i32 0, i32 1
  %1373 = load i32, ptr %1372, align 8
  %1374 = sub i32 %1373, 1
  %1375 = and i32 %1367, %1374
  store i32 %1375, ptr %35, align 4
  br label %1376

1376:                                             ; preds = %1366
  br label %1377

1377:                                             ; preds = %1376
  %1378 = load ptr, ptr %6, align 8
  %1379 = getelementptr inbounds nuw %struct.DictEntry, ptr %1378, i32 0, i32 2
  %1380 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1379, i32 0, i32 0
  %1381 = load ptr, ptr %1380, align 8
  %1382 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1381, i32 0, i32 0
  %1383 = load ptr, ptr %1382, align 8
  %1384 = load i32, ptr %35, align 4
  %1385 = zext i32 %1384 to i64
  %1386 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1383, i64 %1385
  %1387 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1386, i32 0, i32 0
  %1388 = load ptr, ptr %1387, align 8
  %1389 = icmp ne ptr %1388, null
  br i1 %1389, label %1390, label %1412

1390:                                             ; preds = %1377
  br label %1391

1391:                                             ; preds = %1390
  %1392 = load ptr, ptr %6, align 8
  %1393 = getelementptr inbounds nuw %struct.DictEntry, ptr %1392, i32 0, i32 2
  %1394 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1393, i32 0, i32 0
  %1395 = load ptr, ptr %1394, align 8
  %1396 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1395, i32 0, i32 0
  %1397 = load ptr, ptr %1396, align 8
  %1398 = load i32, ptr %35, align 4
  %1399 = zext i32 %1398 to i64
  %1400 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1397, i64 %1399
  %1401 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1400, i32 0, i32 0
  %1402 = load ptr, ptr %1401, align 8
  %1403 = load ptr, ptr %6, align 8
  %1404 = getelementptr inbounds nuw %struct.DictEntry, ptr %1403, i32 0, i32 2
  %1405 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1404, i32 0, i32 0
  %1406 = load ptr, ptr %1405, align 8
  %1407 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1406, i32 0, i32 5
  %1408 = load i64, ptr %1407, align 8
  %1409 = sub i64 0, %1408
  %1410 = getelementptr inbounds i8, ptr %1402, i64 %1409
  store ptr %1410, ptr %28, align 8
  br label %1411

1411:                                             ; preds = %1391
  br label %1413

1412:                                             ; preds = %1377
  store ptr null, ptr %28, align 8
  br label %1413

1413:                                             ; preds = %1412, %1411
  br label %1414

1414:                                             ; preds = %1465, %1413
  %1415 = load ptr, ptr %28, align 8
  %1416 = icmp ne ptr %1415, null
  br i1 %1416, label %1417, label %1466

1417:                                             ; preds = %1414
  %1418 = load ptr, ptr %28, align 8
  %1419 = getelementptr inbounds nuw %struct.DictEntry, ptr %1418, i32 0, i32 2
  %1420 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1419, i32 0, i32 7
  %1421 = load i32, ptr %1420, align 4
  %1422 = load i32, ptr %30, align 4
  %1423 = icmp eq i32 %1421, %1422
  br i1 %1423, label %1424, label %1443

1424:                                             ; preds = %1417
  %1425 = load ptr, ptr %28, align 8
  %1426 = getelementptr inbounds nuw %struct.DictEntry, ptr %1425, i32 0, i32 2
  %1427 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1426, i32 0, i32 6
  %1428 = load i32, ptr %1427, align 8
  %1429 = load i32, ptr %29, align 4
  %1430 = icmp eq i32 %1428, %1429
  br i1 %1430, label %1431, label %1443

1431:                                             ; preds = %1424
  %1432 = load ptr, ptr %28, align 8
  %1433 = getelementptr inbounds nuw %struct.DictEntry, ptr %1432, i32 0, i32 2
  %1434 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1433, i32 0, i32 5
  %1435 = load ptr, ptr %1434, align 8
  %1436 = load ptr, ptr %27, align 8
  %1437 = load i32, ptr %29, align 4
  %1438 = zext i32 %1437 to i64
  %1439 = call i32 @memcmp(ptr noundef %1435, ptr noundef %1436, i64 noundef %1438)
  %1440 = icmp eq i32 %1439, 0
  br i1 %1440, label %1441, label %1442

1441:                                             ; preds = %1431
  br label %1466

1442:                                             ; preds = %1431
  br label %1443

1443:                                             ; preds = %1442, %1424, %1417
  %1444 = load ptr, ptr %28, align 8
  %1445 = getelementptr inbounds nuw %struct.DictEntry, ptr %1444, i32 0, i32 2
  %1446 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1445, i32 0, i32 4
  %1447 = load ptr, ptr %1446, align 8
  %1448 = icmp ne ptr %1447, null
  br i1 %1448, label %1449, label %1464

1449:                                             ; preds = %1443
  br label %1450

1450:                                             ; preds = %1449
  %1451 = load ptr, ptr %28, align 8
  %1452 = getelementptr inbounds nuw %struct.DictEntry, ptr %1451, i32 0, i32 2
  %1453 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1452, i32 0, i32 4
  %1454 = load ptr, ptr %1453, align 8
  %1455 = load ptr, ptr %6, align 8
  %1456 = getelementptr inbounds nuw %struct.DictEntry, ptr %1455, i32 0, i32 2
  %1457 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1456, i32 0, i32 0
  %1458 = load ptr, ptr %1457, align 8
  %1459 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1458, i32 0, i32 5
  %1460 = load i64, ptr %1459, align 8
  %1461 = sub i64 0, %1460
  %1462 = getelementptr inbounds i8, ptr %1454, i64 %1461
  store ptr %1462, ptr %28, align 8
  br label %1463

1463:                                             ; preds = %1450
  br label %1465

1464:                                             ; preds = %1443
  store ptr null, ptr %28, align 8
  br label %1465

1465:                                             ; preds = %1464, %1463
  br label %1414, !llvm.loop !54

1466:                                             ; preds = %1441, %1414
  br label %1467

1467:                                             ; preds = %1466
  br label %1468

1468:                                             ; preds = %1467, %1362
  br label %1469

1469:                                             ; preds = %1468
  br label %1470

1470:                                             ; preds = %1469, %995
  br label %1471

1471:                                             ; preds = %1470
  br label %1472

1472:                                             ; preds = %1471
  %1473 = load ptr, ptr %28, align 8
  %1474 = icmp ne ptr %1473, null
  br i1 %1474, label %1475, label %1478

1475:                                             ; preds = %1472
  %1476 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %1476)
  %1477 = load ptr, ptr %27, align 8
  store ptr %1477, ptr %24, align 8
  br label %2857

1478:                                             ; preds = %1472
  store ptr null, ptr %36, align 8
  br label %1479

1479:                                             ; preds = %1478
  %1480 = load ptr, ptr %24, align 8
  %1481 = call i64 @strlen(ptr noundef %1480)
  %1482 = trunc i64 %1481 to i32
  store i32 %1482, ptr %37, align 4
  br label %1483

1483:                                             ; preds = %1479
  store ptr null, ptr %36, align 8
  %1484 = load ptr, ptr %6, align 8
  %1485 = icmp ne ptr %1484, null
  br i1 %1485, label %1486, label %1958

1486:                                             ; preds = %1483
  br label %1487

1487:                                             ; preds = %1486
  br label %1488

1488:                                             ; preds = %1487
  %1489 = load ptr, ptr %24, align 8
  store ptr %1489, ptr %42, align 8
  store i32 -17973521, ptr %38, align 4
  store i32 -1640531527, ptr %40, align 4
  store i32 -1640531527, ptr %39, align 4
  %1490 = load i32, ptr %37, align 4
  store i32 %1490, ptr %41, align 4
  br label %1491

1491:                                             ; preds = %1658, %1488
  %1492 = load i32, ptr %41, align 4
  %1493 = icmp uge i32 %1492, 12
  br i1 %1493, label %1494, label %1663

1494:                                             ; preds = %1491
  %1495 = load ptr, ptr %42, align 8
  %1496 = getelementptr inbounds i8, ptr %1495, i64 0
  %1497 = load i8, ptr %1496, align 1
  %1498 = zext i8 %1497 to i32
  %1499 = load ptr, ptr %42, align 8
  %1500 = getelementptr inbounds i8, ptr %1499, i64 1
  %1501 = load i8, ptr %1500, align 1
  %1502 = zext i8 %1501 to i32
  %1503 = shl i32 %1502, 8
  %1504 = add i32 %1498, %1503
  %1505 = load ptr, ptr %42, align 8
  %1506 = getelementptr inbounds i8, ptr %1505, i64 2
  %1507 = load i8, ptr %1506, align 1
  %1508 = zext i8 %1507 to i32
  %1509 = shl i32 %1508, 16
  %1510 = add i32 %1504, %1509
  %1511 = load ptr, ptr %42, align 8
  %1512 = getelementptr inbounds i8, ptr %1511, i64 3
  %1513 = load i8, ptr %1512, align 1
  %1514 = zext i8 %1513 to i32
  %1515 = shl i32 %1514, 24
  %1516 = add i32 %1510, %1515
  %1517 = load i32, ptr %39, align 4
  %1518 = add i32 %1517, %1516
  store i32 %1518, ptr %39, align 4
  %1519 = load ptr, ptr %42, align 8
  %1520 = getelementptr inbounds i8, ptr %1519, i64 4
  %1521 = load i8, ptr %1520, align 1
  %1522 = zext i8 %1521 to i32
  %1523 = load ptr, ptr %42, align 8
  %1524 = getelementptr inbounds i8, ptr %1523, i64 5
  %1525 = load i8, ptr %1524, align 1
  %1526 = zext i8 %1525 to i32
  %1527 = shl i32 %1526, 8
  %1528 = add i32 %1522, %1527
  %1529 = load ptr, ptr %42, align 8
  %1530 = getelementptr inbounds i8, ptr %1529, i64 6
  %1531 = load i8, ptr %1530, align 1
  %1532 = zext i8 %1531 to i32
  %1533 = shl i32 %1532, 16
  %1534 = add i32 %1528, %1533
  %1535 = load ptr, ptr %42, align 8
  %1536 = getelementptr inbounds i8, ptr %1535, i64 7
  %1537 = load i8, ptr %1536, align 1
  %1538 = zext i8 %1537 to i32
  %1539 = shl i32 %1538, 24
  %1540 = add i32 %1534, %1539
  %1541 = load i32, ptr %40, align 4
  %1542 = add i32 %1541, %1540
  store i32 %1542, ptr %40, align 4
  %1543 = load ptr, ptr %42, align 8
  %1544 = getelementptr inbounds i8, ptr %1543, i64 8
  %1545 = load i8, ptr %1544, align 1
  %1546 = zext i8 %1545 to i32
  %1547 = load ptr, ptr %42, align 8
  %1548 = getelementptr inbounds i8, ptr %1547, i64 9
  %1549 = load i8, ptr %1548, align 1
  %1550 = zext i8 %1549 to i32
  %1551 = shl i32 %1550, 8
  %1552 = add i32 %1546, %1551
  %1553 = load ptr, ptr %42, align 8
  %1554 = getelementptr inbounds i8, ptr %1553, i64 10
  %1555 = load i8, ptr %1554, align 1
  %1556 = zext i8 %1555 to i32
  %1557 = shl i32 %1556, 16
  %1558 = add i32 %1552, %1557
  %1559 = load ptr, ptr %42, align 8
  %1560 = getelementptr inbounds i8, ptr %1559, i64 11
  %1561 = load i8, ptr %1560, align 1
  %1562 = zext i8 %1561 to i32
  %1563 = shl i32 %1562, 24
  %1564 = add i32 %1558, %1563
  %1565 = load i32, ptr %38, align 4
  %1566 = add i32 %1565, %1564
  store i32 %1566, ptr %38, align 4
  br label %1567

1567:                                             ; preds = %1494
  %1568 = load i32, ptr %40, align 4
  %1569 = load i32, ptr %39, align 4
  %1570 = sub i32 %1569, %1568
  store i32 %1570, ptr %39, align 4
  %1571 = load i32, ptr %38, align 4
  %1572 = load i32, ptr %39, align 4
  %1573 = sub i32 %1572, %1571
  store i32 %1573, ptr %39, align 4
  %1574 = load i32, ptr %38, align 4
  %1575 = lshr i32 %1574, 13
  %1576 = load i32, ptr %39, align 4
  %1577 = xor i32 %1576, %1575
  store i32 %1577, ptr %39, align 4
  %1578 = load i32, ptr %38, align 4
  %1579 = load i32, ptr %40, align 4
  %1580 = sub i32 %1579, %1578
  store i32 %1580, ptr %40, align 4
  %1581 = load i32, ptr %39, align 4
  %1582 = load i32, ptr %40, align 4
  %1583 = sub i32 %1582, %1581
  store i32 %1583, ptr %40, align 4
  %1584 = load i32, ptr %39, align 4
  %1585 = shl i32 %1584, 8
  %1586 = load i32, ptr %40, align 4
  %1587 = xor i32 %1586, %1585
  store i32 %1587, ptr %40, align 4
  %1588 = load i32, ptr %39, align 4
  %1589 = load i32, ptr %38, align 4
  %1590 = sub i32 %1589, %1588
  store i32 %1590, ptr %38, align 4
  %1591 = load i32, ptr %40, align 4
  %1592 = load i32, ptr %38, align 4
  %1593 = sub i32 %1592, %1591
  store i32 %1593, ptr %38, align 4
  %1594 = load i32, ptr %40, align 4
  %1595 = lshr i32 %1594, 13
  %1596 = load i32, ptr %38, align 4
  %1597 = xor i32 %1596, %1595
  store i32 %1597, ptr %38, align 4
  %1598 = load i32, ptr %40, align 4
  %1599 = load i32, ptr %39, align 4
  %1600 = sub i32 %1599, %1598
  store i32 %1600, ptr %39, align 4
  %1601 = load i32, ptr %38, align 4
  %1602 = load i32, ptr %39, align 4
  %1603 = sub i32 %1602, %1601
  store i32 %1603, ptr %39, align 4
  %1604 = load i32, ptr %38, align 4
  %1605 = lshr i32 %1604, 12
  %1606 = load i32, ptr %39, align 4
  %1607 = xor i32 %1606, %1605
  store i32 %1607, ptr %39, align 4
  %1608 = load i32, ptr %38, align 4
  %1609 = load i32, ptr %40, align 4
  %1610 = sub i32 %1609, %1608
  store i32 %1610, ptr %40, align 4
  %1611 = load i32, ptr %39, align 4
  %1612 = load i32, ptr %40, align 4
  %1613 = sub i32 %1612, %1611
  store i32 %1613, ptr %40, align 4
  %1614 = load i32, ptr %39, align 4
  %1615 = shl i32 %1614, 16
  %1616 = load i32, ptr %40, align 4
  %1617 = xor i32 %1616, %1615
  store i32 %1617, ptr %40, align 4
  %1618 = load i32, ptr %39, align 4
  %1619 = load i32, ptr %38, align 4
  %1620 = sub i32 %1619, %1618
  store i32 %1620, ptr %38, align 4
  %1621 = load i32, ptr %40, align 4
  %1622 = load i32, ptr %38, align 4
  %1623 = sub i32 %1622, %1621
  store i32 %1623, ptr %38, align 4
  %1624 = load i32, ptr %40, align 4
  %1625 = lshr i32 %1624, 5
  %1626 = load i32, ptr %38, align 4
  %1627 = xor i32 %1626, %1625
  store i32 %1627, ptr %38, align 4
  %1628 = load i32, ptr %40, align 4
  %1629 = load i32, ptr %39, align 4
  %1630 = sub i32 %1629, %1628
  store i32 %1630, ptr %39, align 4
  %1631 = load i32, ptr %38, align 4
  %1632 = load i32, ptr %39, align 4
  %1633 = sub i32 %1632, %1631
  store i32 %1633, ptr %39, align 4
  %1634 = load i32, ptr %38, align 4
  %1635 = lshr i32 %1634, 3
  %1636 = load i32, ptr %39, align 4
  %1637 = xor i32 %1636, %1635
  store i32 %1637, ptr %39, align 4
  %1638 = load i32, ptr %38, align 4
  %1639 = load i32, ptr %40, align 4
  %1640 = sub i32 %1639, %1638
  store i32 %1640, ptr %40, align 4
  %1641 = load i32, ptr %39, align 4
  %1642 = load i32, ptr %40, align 4
  %1643 = sub i32 %1642, %1641
  store i32 %1643, ptr %40, align 4
  %1644 = load i32, ptr %39, align 4
  %1645 = shl i32 %1644, 10
  %1646 = load i32, ptr %40, align 4
  %1647 = xor i32 %1646, %1645
  store i32 %1647, ptr %40, align 4
  %1648 = load i32, ptr %39, align 4
  %1649 = load i32, ptr %38, align 4
  %1650 = sub i32 %1649, %1648
  store i32 %1650, ptr %38, align 4
  %1651 = load i32, ptr %40, align 4
  %1652 = load i32, ptr %38, align 4
  %1653 = sub i32 %1652, %1651
  store i32 %1653, ptr %38, align 4
  %1654 = load i32, ptr %40, align 4
  %1655 = lshr i32 %1654, 15
  %1656 = load i32, ptr %38, align 4
  %1657 = xor i32 %1656, %1655
  store i32 %1657, ptr %38, align 4
  br label %1658

1658:                                             ; preds = %1567
  %1659 = load ptr, ptr %42, align 8
  %1660 = getelementptr inbounds i8, ptr %1659, i64 12
  store ptr %1660, ptr %42, align 8
  %1661 = load i32, ptr %41, align 4
  %1662 = sub i32 %1661, 12
  store i32 %1662, ptr %41, align 4
  br label %1491, !llvm.loop !55

1663:                                             ; preds = %1491
  %1664 = load i32, ptr %37, align 4
  %1665 = load i32, ptr %38, align 4
  %1666 = add i32 %1665, %1664
  store i32 %1666, ptr %38, align 4
  %1667 = load i32, ptr %41, align 4
  switch i32 %1667, label %1754 [
    i32 11, label %1668
    i32 10, label %1676
    i32 9, label %1684
    i32 8, label %1692
    i32 7, label %1700
    i32 6, label %1708
    i32 5, label %1716
    i32 4, label %1723
    i32 3, label %1731
    i32 2, label %1739
    i32 1, label %1747
  ]

1668:                                             ; preds = %1663
  %1669 = load ptr, ptr %42, align 8
  %1670 = getelementptr inbounds i8, ptr %1669, i64 10
  %1671 = load i8, ptr %1670, align 1
  %1672 = zext i8 %1671 to i32
  %1673 = shl i32 %1672, 24
  %1674 = load i32, ptr %38, align 4
  %1675 = add i32 %1674, %1673
  store i32 %1675, ptr %38, align 4
  br label %1676

1676:                                             ; preds = %1663, %1668
  %1677 = load ptr, ptr %42, align 8
  %1678 = getelementptr inbounds i8, ptr %1677, i64 9
  %1679 = load i8, ptr %1678, align 1
  %1680 = zext i8 %1679 to i32
  %1681 = shl i32 %1680, 16
  %1682 = load i32, ptr %38, align 4
  %1683 = add i32 %1682, %1681
  store i32 %1683, ptr %38, align 4
  br label %1684

1684:                                             ; preds = %1663, %1676
  %1685 = load ptr, ptr %42, align 8
  %1686 = getelementptr inbounds i8, ptr %1685, i64 8
  %1687 = load i8, ptr %1686, align 1
  %1688 = zext i8 %1687 to i32
  %1689 = shl i32 %1688, 8
  %1690 = load i32, ptr %38, align 4
  %1691 = add i32 %1690, %1689
  store i32 %1691, ptr %38, align 4
  br label %1692

1692:                                             ; preds = %1663, %1684
  %1693 = load ptr, ptr %42, align 8
  %1694 = getelementptr inbounds i8, ptr %1693, i64 7
  %1695 = load i8, ptr %1694, align 1
  %1696 = zext i8 %1695 to i32
  %1697 = shl i32 %1696, 24
  %1698 = load i32, ptr %40, align 4
  %1699 = add i32 %1698, %1697
  store i32 %1699, ptr %40, align 4
  br label %1700

1700:                                             ; preds = %1663, %1692
  %1701 = load ptr, ptr %42, align 8
  %1702 = getelementptr inbounds i8, ptr %1701, i64 6
  %1703 = load i8, ptr %1702, align 1
  %1704 = zext i8 %1703 to i32
  %1705 = shl i32 %1704, 16
  %1706 = load i32, ptr %40, align 4
  %1707 = add i32 %1706, %1705
  store i32 %1707, ptr %40, align 4
  br label %1708

1708:                                             ; preds = %1663, %1700
  %1709 = load ptr, ptr %42, align 8
  %1710 = getelementptr inbounds i8, ptr %1709, i64 5
  %1711 = load i8, ptr %1710, align 1
  %1712 = zext i8 %1711 to i32
  %1713 = shl i32 %1712, 8
  %1714 = load i32, ptr %40, align 4
  %1715 = add i32 %1714, %1713
  store i32 %1715, ptr %40, align 4
  br label %1716

1716:                                             ; preds = %1663, %1708
  %1717 = load ptr, ptr %42, align 8
  %1718 = getelementptr inbounds i8, ptr %1717, i64 4
  %1719 = load i8, ptr %1718, align 1
  %1720 = zext i8 %1719 to i32
  %1721 = load i32, ptr %40, align 4
  %1722 = add i32 %1721, %1720
  store i32 %1722, ptr %40, align 4
  br label %1723

1723:                                             ; preds = %1663, %1716
  %1724 = load ptr, ptr %42, align 8
  %1725 = getelementptr inbounds i8, ptr %1724, i64 3
  %1726 = load i8, ptr %1725, align 1
  %1727 = zext i8 %1726 to i32
  %1728 = shl i32 %1727, 24
  %1729 = load i32, ptr %39, align 4
  %1730 = add i32 %1729, %1728
  store i32 %1730, ptr %39, align 4
  br label %1731

1731:                                             ; preds = %1663, %1723
  %1732 = load ptr, ptr %42, align 8
  %1733 = getelementptr inbounds i8, ptr %1732, i64 2
  %1734 = load i8, ptr %1733, align 1
  %1735 = zext i8 %1734 to i32
  %1736 = shl i32 %1735, 16
  %1737 = load i32, ptr %39, align 4
  %1738 = add i32 %1737, %1736
  store i32 %1738, ptr %39, align 4
  br label %1739

1739:                                             ; preds = %1663, %1731
  %1740 = load ptr, ptr %42, align 8
  %1741 = getelementptr inbounds i8, ptr %1740, i64 1
  %1742 = load i8, ptr %1741, align 1
  %1743 = zext i8 %1742 to i32
  %1744 = shl i32 %1743, 8
  %1745 = load i32, ptr %39, align 4
  %1746 = add i32 %1745, %1744
  store i32 %1746, ptr %39, align 4
  br label %1747

1747:                                             ; preds = %1663, %1739
  %1748 = load ptr, ptr %42, align 8
  %1749 = getelementptr inbounds i8, ptr %1748, i64 0
  %1750 = load i8, ptr %1749, align 1
  %1751 = zext i8 %1750 to i32
  %1752 = load i32, ptr %39, align 4
  %1753 = add i32 %1752, %1751
  store i32 %1753, ptr %39, align 4
  br label %1754

1754:                                             ; preds = %1663, %1747
  br label %1755

1755:                                             ; preds = %1754
  br label %1756

1756:                                             ; preds = %1755
  %1757 = load i32, ptr %40, align 4
  %1758 = load i32, ptr %39, align 4
  %1759 = sub i32 %1758, %1757
  store i32 %1759, ptr %39, align 4
  %1760 = load i32, ptr %38, align 4
  %1761 = load i32, ptr %39, align 4
  %1762 = sub i32 %1761, %1760
  store i32 %1762, ptr %39, align 4
  %1763 = load i32, ptr %38, align 4
  %1764 = lshr i32 %1763, 13
  %1765 = load i32, ptr %39, align 4
  %1766 = xor i32 %1765, %1764
  store i32 %1766, ptr %39, align 4
  %1767 = load i32, ptr %38, align 4
  %1768 = load i32, ptr %40, align 4
  %1769 = sub i32 %1768, %1767
  store i32 %1769, ptr %40, align 4
  %1770 = load i32, ptr %39, align 4
  %1771 = load i32, ptr %40, align 4
  %1772 = sub i32 %1771, %1770
  store i32 %1772, ptr %40, align 4
  %1773 = load i32, ptr %39, align 4
  %1774 = shl i32 %1773, 8
  %1775 = load i32, ptr %40, align 4
  %1776 = xor i32 %1775, %1774
  store i32 %1776, ptr %40, align 4
  %1777 = load i32, ptr %39, align 4
  %1778 = load i32, ptr %38, align 4
  %1779 = sub i32 %1778, %1777
  store i32 %1779, ptr %38, align 4
  %1780 = load i32, ptr %40, align 4
  %1781 = load i32, ptr %38, align 4
  %1782 = sub i32 %1781, %1780
  store i32 %1782, ptr %38, align 4
  %1783 = load i32, ptr %40, align 4
  %1784 = lshr i32 %1783, 13
  %1785 = load i32, ptr %38, align 4
  %1786 = xor i32 %1785, %1784
  store i32 %1786, ptr %38, align 4
  %1787 = load i32, ptr %40, align 4
  %1788 = load i32, ptr %39, align 4
  %1789 = sub i32 %1788, %1787
  store i32 %1789, ptr %39, align 4
  %1790 = load i32, ptr %38, align 4
  %1791 = load i32, ptr %39, align 4
  %1792 = sub i32 %1791, %1790
  store i32 %1792, ptr %39, align 4
  %1793 = load i32, ptr %38, align 4
  %1794 = lshr i32 %1793, 12
  %1795 = load i32, ptr %39, align 4
  %1796 = xor i32 %1795, %1794
  store i32 %1796, ptr %39, align 4
  %1797 = load i32, ptr %38, align 4
  %1798 = load i32, ptr %40, align 4
  %1799 = sub i32 %1798, %1797
  store i32 %1799, ptr %40, align 4
  %1800 = load i32, ptr %39, align 4
  %1801 = load i32, ptr %40, align 4
  %1802 = sub i32 %1801, %1800
  store i32 %1802, ptr %40, align 4
  %1803 = load i32, ptr %39, align 4
  %1804 = shl i32 %1803, 16
  %1805 = load i32, ptr %40, align 4
  %1806 = xor i32 %1805, %1804
  store i32 %1806, ptr %40, align 4
  %1807 = load i32, ptr %39, align 4
  %1808 = load i32, ptr %38, align 4
  %1809 = sub i32 %1808, %1807
  store i32 %1809, ptr %38, align 4
  %1810 = load i32, ptr %40, align 4
  %1811 = load i32, ptr %38, align 4
  %1812 = sub i32 %1811, %1810
  store i32 %1812, ptr %38, align 4
  %1813 = load i32, ptr %40, align 4
  %1814 = lshr i32 %1813, 5
  %1815 = load i32, ptr %38, align 4
  %1816 = xor i32 %1815, %1814
  store i32 %1816, ptr %38, align 4
  %1817 = load i32, ptr %40, align 4
  %1818 = load i32, ptr %39, align 4
  %1819 = sub i32 %1818, %1817
  store i32 %1819, ptr %39, align 4
  %1820 = load i32, ptr %38, align 4
  %1821 = load i32, ptr %39, align 4
  %1822 = sub i32 %1821, %1820
  store i32 %1822, ptr %39, align 4
  %1823 = load i32, ptr %38, align 4
  %1824 = lshr i32 %1823, 3
  %1825 = load i32, ptr %39, align 4
  %1826 = xor i32 %1825, %1824
  store i32 %1826, ptr %39, align 4
  %1827 = load i32, ptr %38, align 4
  %1828 = load i32, ptr %40, align 4
  %1829 = sub i32 %1828, %1827
  store i32 %1829, ptr %40, align 4
  %1830 = load i32, ptr %39, align 4
  %1831 = load i32, ptr %40, align 4
  %1832 = sub i32 %1831, %1830
  store i32 %1832, ptr %40, align 4
  %1833 = load i32, ptr %39, align 4
  %1834 = shl i32 %1833, 10
  %1835 = load i32, ptr %40, align 4
  %1836 = xor i32 %1835, %1834
  store i32 %1836, ptr %40, align 4
  %1837 = load i32, ptr %39, align 4
  %1838 = load i32, ptr %38, align 4
  %1839 = sub i32 %1838, %1837
  store i32 %1839, ptr %38, align 4
  %1840 = load i32, ptr %40, align 4
  %1841 = load i32, ptr %38, align 4
  %1842 = sub i32 %1841, %1840
  store i32 %1842, ptr %38, align 4
  %1843 = load i32, ptr %40, align 4
  %1844 = lshr i32 %1843, 15
  %1845 = load i32, ptr %38, align 4
  %1846 = xor i32 %1845, %1844
  store i32 %1846, ptr %38, align 4
  br label %1847

1847:                                             ; preds = %1756
  br label %1848

1848:                                             ; preds = %1847
  br label %1849

1849:                                             ; preds = %1848
  br label %1850

1850:                                             ; preds = %1849
  store ptr null, ptr %36, align 8
  %1851 = load ptr, ptr %6, align 8
  %1852 = icmp ne ptr %1851, null
  br i1 %1852, label %1853, label %1956

1853:                                             ; preds = %1850
  br label %1854

1854:                                             ; preds = %1853
  %1855 = load i32, ptr %38, align 4
  %1856 = load ptr, ptr %6, align 8
  %1857 = getelementptr inbounds nuw %struct.DictEntry, ptr %1856, i32 0, i32 2
  %1858 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1857, i32 0, i32 0
  %1859 = load ptr, ptr %1858, align 8
  %1860 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1859, i32 0, i32 1
  %1861 = load i32, ptr %1860, align 8
  %1862 = sub i32 %1861, 1
  %1863 = and i32 %1855, %1862
  store i32 %1863, ptr %43, align 4
  br label %1864

1864:                                             ; preds = %1854
  br label %1865

1865:                                             ; preds = %1864
  %1866 = load ptr, ptr %6, align 8
  %1867 = getelementptr inbounds nuw %struct.DictEntry, ptr %1866, i32 0, i32 2
  %1868 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1867, i32 0, i32 0
  %1869 = load ptr, ptr %1868, align 8
  %1870 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1869, i32 0, i32 0
  %1871 = load ptr, ptr %1870, align 8
  %1872 = load i32, ptr %43, align 4
  %1873 = zext i32 %1872 to i64
  %1874 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1871, i64 %1873
  %1875 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1874, i32 0, i32 0
  %1876 = load ptr, ptr %1875, align 8
  %1877 = icmp ne ptr %1876, null
  br i1 %1877, label %1878, label %1900

1878:                                             ; preds = %1865
  br label %1879

1879:                                             ; preds = %1878
  %1880 = load ptr, ptr %6, align 8
  %1881 = getelementptr inbounds nuw %struct.DictEntry, ptr %1880, i32 0, i32 2
  %1882 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1881, i32 0, i32 0
  %1883 = load ptr, ptr %1882, align 8
  %1884 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1883, i32 0, i32 0
  %1885 = load ptr, ptr %1884, align 8
  %1886 = load i32, ptr %43, align 4
  %1887 = zext i32 %1886 to i64
  %1888 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1885, i64 %1887
  %1889 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1888, i32 0, i32 0
  %1890 = load ptr, ptr %1889, align 8
  %1891 = load ptr, ptr %6, align 8
  %1892 = getelementptr inbounds nuw %struct.DictEntry, ptr %1891, i32 0, i32 2
  %1893 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1892, i32 0, i32 0
  %1894 = load ptr, ptr %1893, align 8
  %1895 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1894, i32 0, i32 5
  %1896 = load i64, ptr %1895, align 8
  %1897 = sub i64 0, %1896
  %1898 = getelementptr inbounds i8, ptr %1890, i64 %1897
  store ptr %1898, ptr %36, align 8
  br label %1899

1899:                                             ; preds = %1879
  br label %1901

1900:                                             ; preds = %1865
  store ptr null, ptr %36, align 8
  br label %1901

1901:                                             ; preds = %1900, %1899
  br label %1902

1902:                                             ; preds = %1953, %1901
  %1903 = load ptr, ptr %36, align 8
  %1904 = icmp ne ptr %1903, null
  br i1 %1904, label %1905, label %1954

1905:                                             ; preds = %1902
  %1906 = load ptr, ptr %36, align 8
  %1907 = getelementptr inbounds nuw %struct.DictEntry, ptr %1906, i32 0, i32 2
  %1908 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1907, i32 0, i32 7
  %1909 = load i32, ptr %1908, align 4
  %1910 = load i32, ptr %38, align 4
  %1911 = icmp eq i32 %1909, %1910
  br i1 %1911, label %1912, label %1931

1912:                                             ; preds = %1905
  %1913 = load ptr, ptr %36, align 8
  %1914 = getelementptr inbounds nuw %struct.DictEntry, ptr %1913, i32 0, i32 2
  %1915 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1914, i32 0, i32 6
  %1916 = load i32, ptr %1915, align 8
  %1917 = load i32, ptr %37, align 4
  %1918 = icmp eq i32 %1916, %1917
  br i1 %1918, label %1919, label %1931

1919:                                             ; preds = %1912
  %1920 = load ptr, ptr %36, align 8
  %1921 = getelementptr inbounds nuw %struct.DictEntry, ptr %1920, i32 0, i32 2
  %1922 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1921, i32 0, i32 5
  %1923 = load ptr, ptr %1922, align 8
  %1924 = load ptr, ptr %24, align 8
  %1925 = load i32, ptr %37, align 4
  %1926 = zext i32 %1925 to i64
  %1927 = call i32 @memcmp(ptr noundef %1923, ptr noundef %1924, i64 noundef %1926)
  %1928 = icmp eq i32 %1927, 0
  br i1 %1928, label %1929, label %1930

1929:                                             ; preds = %1919
  br label %1954

1930:                                             ; preds = %1919
  br label %1931

1931:                                             ; preds = %1930, %1912, %1905
  %1932 = load ptr, ptr %36, align 8
  %1933 = getelementptr inbounds nuw %struct.DictEntry, ptr %1932, i32 0, i32 2
  %1934 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1933, i32 0, i32 4
  %1935 = load ptr, ptr %1934, align 8
  %1936 = icmp ne ptr %1935, null
  br i1 %1936, label %1937, label %1952

1937:                                             ; preds = %1931
  br label %1938

1938:                                             ; preds = %1937
  %1939 = load ptr, ptr %36, align 8
  %1940 = getelementptr inbounds nuw %struct.DictEntry, ptr %1939, i32 0, i32 2
  %1941 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1940, i32 0, i32 4
  %1942 = load ptr, ptr %1941, align 8
  %1943 = load ptr, ptr %6, align 8
  %1944 = getelementptr inbounds nuw %struct.DictEntry, ptr %1943, i32 0, i32 2
  %1945 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1944, i32 0, i32 0
  %1946 = load ptr, ptr %1945, align 8
  %1947 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1946, i32 0, i32 5
  %1948 = load i64, ptr %1947, align 8
  %1949 = sub i64 0, %1948
  %1950 = getelementptr inbounds i8, ptr %1942, i64 %1949
  store ptr %1950, ptr %36, align 8
  br label %1951

1951:                                             ; preds = %1938
  br label %1953

1952:                                             ; preds = %1931
  store ptr null, ptr %36, align 8
  br label %1953

1953:                                             ; preds = %1952, %1951
  br label %1902, !llvm.loop !56

1954:                                             ; preds = %1929, %1902
  br label %1955

1955:                                             ; preds = %1954
  br label %1956

1956:                                             ; preds = %1955, %1850
  br label %1957

1957:                                             ; preds = %1956
  br label %1958

1958:                                             ; preds = %1957, %1483
  br label %1959

1959:                                             ; preds = %1958
  br label %1960

1960:                                             ; preds = %1959
  %1961 = load ptr, ptr %36, align 8
  %1962 = getelementptr inbounds nuw %struct.DictEntry, ptr %1961, i32 0, i32 1
  %1963 = load i32, ptr %1962, align 8
  store i32 %1963, ptr %44, align 4
  %1964 = load i32, ptr %44, align 4
  %1965 = ashr i32 %1964, 8
  %1966 = and i32 %1965, 255
  %1967 = trunc i32 %1966 to i8
  %1968 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  %1969 = load ptr, ptr %1968, align 8
  %1970 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  %1971 = load i64, ptr %1970, align 8
  %1972 = add i64 %1971, 1
  store i64 %1972, ptr %1970, align 8
  %1973 = getelementptr inbounds nuw i8, ptr %1969, i64 %1971
  store i8 %1967, ptr %1973, align 1
  %1974 = load i32, ptr %44, align 4
  %1975 = and i32 %1974, 255
  %1976 = trunc i32 %1975 to i8
  %1977 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  %1978 = load ptr, ptr %1977, align 8
  %1979 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  %1980 = load i64, ptr %1979, align 8
  %1981 = add i64 %1980, 1
  store i64 %1981, ptr %1979, align 8
  %1982 = getelementptr inbounds nuw i8, ptr %1978, i64 %1980
  store i8 %1976, ptr %1982, align 1
  %1983 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %1983, ptr %45, align 8
  %1984 = load ptr, ptr %27, align 8
  %1985 = load ptr, ptr %45, align 8
  %1986 = getelementptr inbounds nuw %struct.DictEntry, ptr %1985, i32 0, i32 0
  store ptr %1984, ptr %1986, align 8
  %1987 = load i32, ptr %23, align 4
  %1988 = add nsw i32 %1987, 1
  store i32 %1988, ptr %23, align 4
  %1989 = load ptr, ptr %45, align 8
  %1990 = getelementptr inbounds nuw %struct.DictEntry, ptr %1989, i32 0, i32 1
  store i32 %1987, ptr %1990, align 8
  br label %1991

1991:                                             ; preds = %1960
  br label %1992

1992:                                             ; preds = %1991
  br label %1993

1993:                                             ; preds = %1992
  %1994 = load ptr, ptr %45, align 8
  %1995 = getelementptr inbounds nuw %struct.DictEntry, ptr %1994, i32 0, i32 0
  %1996 = load ptr, ptr %1995, align 8
  store ptr %1996, ptr %50, align 8
  store i32 -17973521, ptr %46, align 4
  store i32 -1640531527, ptr %48, align 4
  store i32 -1640531527, ptr %47, align 4
  %1997 = load ptr, ptr %45, align 8
  %1998 = getelementptr inbounds nuw %struct.DictEntry, ptr %1997, i32 0, i32 0
  %1999 = load ptr, ptr %1998, align 8
  %2000 = call i64 @strlen(ptr noundef %1999)
  %2001 = trunc i64 %2000 to i32
  store i32 %2001, ptr %49, align 4
  br label %2002

2002:                                             ; preds = %2169, %1993
  %2003 = load i32, ptr %49, align 4
  %2004 = icmp uge i32 %2003, 12
  br i1 %2004, label %2005, label %2174

2005:                                             ; preds = %2002
  %2006 = load ptr, ptr %50, align 8
  %2007 = getelementptr inbounds i8, ptr %2006, i64 0
  %2008 = load i8, ptr %2007, align 1
  %2009 = zext i8 %2008 to i32
  %2010 = load ptr, ptr %50, align 8
  %2011 = getelementptr inbounds i8, ptr %2010, i64 1
  %2012 = load i8, ptr %2011, align 1
  %2013 = zext i8 %2012 to i32
  %2014 = shl i32 %2013, 8
  %2015 = add i32 %2009, %2014
  %2016 = load ptr, ptr %50, align 8
  %2017 = getelementptr inbounds i8, ptr %2016, i64 2
  %2018 = load i8, ptr %2017, align 1
  %2019 = zext i8 %2018 to i32
  %2020 = shl i32 %2019, 16
  %2021 = add i32 %2015, %2020
  %2022 = load ptr, ptr %50, align 8
  %2023 = getelementptr inbounds i8, ptr %2022, i64 3
  %2024 = load i8, ptr %2023, align 1
  %2025 = zext i8 %2024 to i32
  %2026 = shl i32 %2025, 24
  %2027 = add i32 %2021, %2026
  %2028 = load i32, ptr %47, align 4
  %2029 = add i32 %2028, %2027
  store i32 %2029, ptr %47, align 4
  %2030 = load ptr, ptr %50, align 8
  %2031 = getelementptr inbounds i8, ptr %2030, i64 4
  %2032 = load i8, ptr %2031, align 1
  %2033 = zext i8 %2032 to i32
  %2034 = load ptr, ptr %50, align 8
  %2035 = getelementptr inbounds i8, ptr %2034, i64 5
  %2036 = load i8, ptr %2035, align 1
  %2037 = zext i8 %2036 to i32
  %2038 = shl i32 %2037, 8
  %2039 = add i32 %2033, %2038
  %2040 = load ptr, ptr %50, align 8
  %2041 = getelementptr inbounds i8, ptr %2040, i64 6
  %2042 = load i8, ptr %2041, align 1
  %2043 = zext i8 %2042 to i32
  %2044 = shl i32 %2043, 16
  %2045 = add i32 %2039, %2044
  %2046 = load ptr, ptr %50, align 8
  %2047 = getelementptr inbounds i8, ptr %2046, i64 7
  %2048 = load i8, ptr %2047, align 1
  %2049 = zext i8 %2048 to i32
  %2050 = shl i32 %2049, 24
  %2051 = add i32 %2045, %2050
  %2052 = load i32, ptr %48, align 4
  %2053 = add i32 %2052, %2051
  store i32 %2053, ptr %48, align 4
  %2054 = load ptr, ptr %50, align 8
  %2055 = getelementptr inbounds i8, ptr %2054, i64 8
  %2056 = load i8, ptr %2055, align 1
  %2057 = zext i8 %2056 to i32
  %2058 = load ptr, ptr %50, align 8
  %2059 = getelementptr inbounds i8, ptr %2058, i64 9
  %2060 = load i8, ptr %2059, align 1
  %2061 = zext i8 %2060 to i32
  %2062 = shl i32 %2061, 8
  %2063 = add i32 %2057, %2062
  %2064 = load ptr, ptr %50, align 8
  %2065 = getelementptr inbounds i8, ptr %2064, i64 10
  %2066 = load i8, ptr %2065, align 1
  %2067 = zext i8 %2066 to i32
  %2068 = shl i32 %2067, 16
  %2069 = add i32 %2063, %2068
  %2070 = load ptr, ptr %50, align 8
  %2071 = getelementptr inbounds i8, ptr %2070, i64 11
  %2072 = load i8, ptr %2071, align 1
  %2073 = zext i8 %2072 to i32
  %2074 = shl i32 %2073, 24
  %2075 = add i32 %2069, %2074
  %2076 = load i32, ptr %46, align 4
  %2077 = add i32 %2076, %2075
  store i32 %2077, ptr %46, align 4
  br label %2078

2078:                                             ; preds = %2005
  %2079 = load i32, ptr %48, align 4
  %2080 = load i32, ptr %47, align 4
  %2081 = sub i32 %2080, %2079
  store i32 %2081, ptr %47, align 4
  %2082 = load i32, ptr %46, align 4
  %2083 = load i32, ptr %47, align 4
  %2084 = sub i32 %2083, %2082
  store i32 %2084, ptr %47, align 4
  %2085 = load i32, ptr %46, align 4
  %2086 = lshr i32 %2085, 13
  %2087 = load i32, ptr %47, align 4
  %2088 = xor i32 %2087, %2086
  store i32 %2088, ptr %47, align 4
  %2089 = load i32, ptr %46, align 4
  %2090 = load i32, ptr %48, align 4
  %2091 = sub i32 %2090, %2089
  store i32 %2091, ptr %48, align 4
  %2092 = load i32, ptr %47, align 4
  %2093 = load i32, ptr %48, align 4
  %2094 = sub i32 %2093, %2092
  store i32 %2094, ptr %48, align 4
  %2095 = load i32, ptr %47, align 4
  %2096 = shl i32 %2095, 8
  %2097 = load i32, ptr %48, align 4
  %2098 = xor i32 %2097, %2096
  store i32 %2098, ptr %48, align 4
  %2099 = load i32, ptr %47, align 4
  %2100 = load i32, ptr %46, align 4
  %2101 = sub i32 %2100, %2099
  store i32 %2101, ptr %46, align 4
  %2102 = load i32, ptr %48, align 4
  %2103 = load i32, ptr %46, align 4
  %2104 = sub i32 %2103, %2102
  store i32 %2104, ptr %46, align 4
  %2105 = load i32, ptr %48, align 4
  %2106 = lshr i32 %2105, 13
  %2107 = load i32, ptr %46, align 4
  %2108 = xor i32 %2107, %2106
  store i32 %2108, ptr %46, align 4
  %2109 = load i32, ptr %48, align 4
  %2110 = load i32, ptr %47, align 4
  %2111 = sub i32 %2110, %2109
  store i32 %2111, ptr %47, align 4
  %2112 = load i32, ptr %46, align 4
  %2113 = load i32, ptr %47, align 4
  %2114 = sub i32 %2113, %2112
  store i32 %2114, ptr %47, align 4
  %2115 = load i32, ptr %46, align 4
  %2116 = lshr i32 %2115, 12
  %2117 = load i32, ptr %47, align 4
  %2118 = xor i32 %2117, %2116
  store i32 %2118, ptr %47, align 4
  %2119 = load i32, ptr %46, align 4
  %2120 = load i32, ptr %48, align 4
  %2121 = sub i32 %2120, %2119
  store i32 %2121, ptr %48, align 4
  %2122 = load i32, ptr %47, align 4
  %2123 = load i32, ptr %48, align 4
  %2124 = sub i32 %2123, %2122
  store i32 %2124, ptr %48, align 4
  %2125 = load i32, ptr %47, align 4
  %2126 = shl i32 %2125, 16
  %2127 = load i32, ptr %48, align 4
  %2128 = xor i32 %2127, %2126
  store i32 %2128, ptr %48, align 4
  %2129 = load i32, ptr %47, align 4
  %2130 = load i32, ptr %46, align 4
  %2131 = sub i32 %2130, %2129
  store i32 %2131, ptr %46, align 4
  %2132 = load i32, ptr %48, align 4
  %2133 = load i32, ptr %46, align 4
  %2134 = sub i32 %2133, %2132
  store i32 %2134, ptr %46, align 4
  %2135 = load i32, ptr %48, align 4
  %2136 = lshr i32 %2135, 5
  %2137 = load i32, ptr %46, align 4
  %2138 = xor i32 %2137, %2136
  store i32 %2138, ptr %46, align 4
  %2139 = load i32, ptr %48, align 4
  %2140 = load i32, ptr %47, align 4
  %2141 = sub i32 %2140, %2139
  store i32 %2141, ptr %47, align 4
  %2142 = load i32, ptr %46, align 4
  %2143 = load i32, ptr %47, align 4
  %2144 = sub i32 %2143, %2142
  store i32 %2144, ptr %47, align 4
  %2145 = load i32, ptr %46, align 4
  %2146 = lshr i32 %2145, 3
  %2147 = load i32, ptr %47, align 4
  %2148 = xor i32 %2147, %2146
  store i32 %2148, ptr %47, align 4
  %2149 = load i32, ptr %46, align 4
  %2150 = load i32, ptr %48, align 4
  %2151 = sub i32 %2150, %2149
  store i32 %2151, ptr %48, align 4
  %2152 = load i32, ptr %47, align 4
  %2153 = load i32, ptr %48, align 4
  %2154 = sub i32 %2153, %2152
  store i32 %2154, ptr %48, align 4
  %2155 = load i32, ptr %47, align 4
  %2156 = shl i32 %2155, 10
  %2157 = load i32, ptr %48, align 4
  %2158 = xor i32 %2157, %2156
  store i32 %2158, ptr %48, align 4
  %2159 = load i32, ptr %47, align 4
  %2160 = load i32, ptr %46, align 4
  %2161 = sub i32 %2160, %2159
  store i32 %2161, ptr %46, align 4
  %2162 = load i32, ptr %48, align 4
  %2163 = load i32, ptr %46, align 4
  %2164 = sub i32 %2163, %2162
  store i32 %2164, ptr %46, align 4
  %2165 = load i32, ptr %48, align 4
  %2166 = lshr i32 %2165, 15
  %2167 = load i32, ptr %46, align 4
  %2168 = xor i32 %2167, %2166
  store i32 %2168, ptr %46, align 4
  br label %2169

2169:                                             ; preds = %2078
  %2170 = load ptr, ptr %50, align 8
  %2171 = getelementptr inbounds i8, ptr %2170, i64 12
  store ptr %2171, ptr %50, align 8
  %2172 = load i32, ptr %49, align 4
  %2173 = sub i32 %2172, 12
  store i32 %2173, ptr %49, align 4
  br label %2002, !llvm.loop !57

2174:                                             ; preds = %2002
  %2175 = load ptr, ptr %45, align 8
  %2176 = getelementptr inbounds nuw %struct.DictEntry, ptr %2175, i32 0, i32 0
  %2177 = load ptr, ptr %2176, align 8
  %2178 = call i64 @strlen(ptr noundef %2177)
  %2179 = trunc i64 %2178 to i32
  %2180 = load i32, ptr %46, align 4
  %2181 = add i32 %2180, %2179
  store i32 %2181, ptr %46, align 4
  %2182 = load i32, ptr %49, align 4
  switch i32 %2182, label %2269 [
    i32 11, label %2183
    i32 10, label %2191
    i32 9, label %2199
    i32 8, label %2207
    i32 7, label %2215
    i32 6, label %2223
    i32 5, label %2231
    i32 4, label %2238
    i32 3, label %2246
    i32 2, label %2254
    i32 1, label %2262
  ]

2183:                                             ; preds = %2174
  %2184 = load ptr, ptr %50, align 8
  %2185 = getelementptr inbounds i8, ptr %2184, i64 10
  %2186 = load i8, ptr %2185, align 1
  %2187 = zext i8 %2186 to i32
  %2188 = shl i32 %2187, 24
  %2189 = load i32, ptr %46, align 4
  %2190 = add i32 %2189, %2188
  store i32 %2190, ptr %46, align 4
  br label %2191

2191:                                             ; preds = %2174, %2183
  %2192 = load ptr, ptr %50, align 8
  %2193 = getelementptr inbounds i8, ptr %2192, i64 9
  %2194 = load i8, ptr %2193, align 1
  %2195 = zext i8 %2194 to i32
  %2196 = shl i32 %2195, 16
  %2197 = load i32, ptr %46, align 4
  %2198 = add i32 %2197, %2196
  store i32 %2198, ptr %46, align 4
  br label %2199

2199:                                             ; preds = %2174, %2191
  %2200 = load ptr, ptr %50, align 8
  %2201 = getelementptr inbounds i8, ptr %2200, i64 8
  %2202 = load i8, ptr %2201, align 1
  %2203 = zext i8 %2202 to i32
  %2204 = shl i32 %2203, 8
  %2205 = load i32, ptr %46, align 4
  %2206 = add i32 %2205, %2204
  store i32 %2206, ptr %46, align 4
  br label %2207

2207:                                             ; preds = %2174, %2199
  %2208 = load ptr, ptr %50, align 8
  %2209 = getelementptr inbounds i8, ptr %2208, i64 7
  %2210 = load i8, ptr %2209, align 1
  %2211 = zext i8 %2210 to i32
  %2212 = shl i32 %2211, 24
  %2213 = load i32, ptr %48, align 4
  %2214 = add i32 %2213, %2212
  store i32 %2214, ptr %48, align 4
  br label %2215

2215:                                             ; preds = %2174, %2207
  %2216 = load ptr, ptr %50, align 8
  %2217 = getelementptr inbounds i8, ptr %2216, i64 6
  %2218 = load i8, ptr %2217, align 1
  %2219 = zext i8 %2218 to i32
  %2220 = shl i32 %2219, 16
  %2221 = load i32, ptr %48, align 4
  %2222 = add i32 %2221, %2220
  store i32 %2222, ptr %48, align 4
  br label %2223

2223:                                             ; preds = %2174, %2215
  %2224 = load ptr, ptr %50, align 8
  %2225 = getelementptr inbounds i8, ptr %2224, i64 5
  %2226 = load i8, ptr %2225, align 1
  %2227 = zext i8 %2226 to i32
  %2228 = shl i32 %2227, 8
  %2229 = load i32, ptr %48, align 4
  %2230 = add i32 %2229, %2228
  store i32 %2230, ptr %48, align 4
  br label %2231

2231:                                             ; preds = %2174, %2223
  %2232 = load ptr, ptr %50, align 8
  %2233 = getelementptr inbounds i8, ptr %2232, i64 4
  %2234 = load i8, ptr %2233, align 1
  %2235 = zext i8 %2234 to i32
  %2236 = load i32, ptr %48, align 4
  %2237 = add i32 %2236, %2235
  store i32 %2237, ptr %48, align 4
  br label %2238

2238:                                             ; preds = %2174, %2231
  %2239 = load ptr, ptr %50, align 8
  %2240 = getelementptr inbounds i8, ptr %2239, i64 3
  %2241 = load i8, ptr %2240, align 1
  %2242 = zext i8 %2241 to i32
  %2243 = shl i32 %2242, 24
  %2244 = load i32, ptr %47, align 4
  %2245 = add i32 %2244, %2243
  store i32 %2245, ptr %47, align 4
  br label %2246

2246:                                             ; preds = %2174, %2238
  %2247 = load ptr, ptr %50, align 8
  %2248 = getelementptr inbounds i8, ptr %2247, i64 2
  %2249 = load i8, ptr %2248, align 1
  %2250 = zext i8 %2249 to i32
  %2251 = shl i32 %2250, 16
  %2252 = load i32, ptr %47, align 4
  %2253 = add i32 %2252, %2251
  store i32 %2253, ptr %47, align 4
  br label %2254

2254:                                             ; preds = %2174, %2246
  %2255 = load ptr, ptr %50, align 8
  %2256 = getelementptr inbounds i8, ptr %2255, i64 1
  %2257 = load i8, ptr %2256, align 1
  %2258 = zext i8 %2257 to i32
  %2259 = shl i32 %2258, 8
  %2260 = load i32, ptr %47, align 4
  %2261 = add i32 %2260, %2259
  store i32 %2261, ptr %47, align 4
  br label %2262

2262:                                             ; preds = %2174, %2254
  %2263 = load ptr, ptr %50, align 8
  %2264 = getelementptr inbounds i8, ptr %2263, i64 0
  %2265 = load i8, ptr %2264, align 1
  %2266 = zext i8 %2265 to i32
  %2267 = load i32, ptr %47, align 4
  %2268 = add i32 %2267, %2266
  store i32 %2268, ptr %47, align 4
  br label %2269

2269:                                             ; preds = %2174, %2262
  br label %2270

2270:                                             ; preds = %2269
  br label %2271

2271:                                             ; preds = %2270
  %2272 = load i32, ptr %48, align 4
  %2273 = load i32, ptr %47, align 4
  %2274 = sub i32 %2273, %2272
  store i32 %2274, ptr %47, align 4
  %2275 = load i32, ptr %46, align 4
  %2276 = load i32, ptr %47, align 4
  %2277 = sub i32 %2276, %2275
  store i32 %2277, ptr %47, align 4
  %2278 = load i32, ptr %46, align 4
  %2279 = lshr i32 %2278, 13
  %2280 = load i32, ptr %47, align 4
  %2281 = xor i32 %2280, %2279
  store i32 %2281, ptr %47, align 4
  %2282 = load i32, ptr %46, align 4
  %2283 = load i32, ptr %48, align 4
  %2284 = sub i32 %2283, %2282
  store i32 %2284, ptr %48, align 4
  %2285 = load i32, ptr %47, align 4
  %2286 = load i32, ptr %48, align 4
  %2287 = sub i32 %2286, %2285
  store i32 %2287, ptr %48, align 4
  %2288 = load i32, ptr %47, align 4
  %2289 = shl i32 %2288, 8
  %2290 = load i32, ptr %48, align 4
  %2291 = xor i32 %2290, %2289
  store i32 %2291, ptr %48, align 4
  %2292 = load i32, ptr %47, align 4
  %2293 = load i32, ptr %46, align 4
  %2294 = sub i32 %2293, %2292
  store i32 %2294, ptr %46, align 4
  %2295 = load i32, ptr %48, align 4
  %2296 = load i32, ptr %46, align 4
  %2297 = sub i32 %2296, %2295
  store i32 %2297, ptr %46, align 4
  %2298 = load i32, ptr %48, align 4
  %2299 = lshr i32 %2298, 13
  %2300 = load i32, ptr %46, align 4
  %2301 = xor i32 %2300, %2299
  store i32 %2301, ptr %46, align 4
  %2302 = load i32, ptr %48, align 4
  %2303 = load i32, ptr %47, align 4
  %2304 = sub i32 %2303, %2302
  store i32 %2304, ptr %47, align 4
  %2305 = load i32, ptr %46, align 4
  %2306 = load i32, ptr %47, align 4
  %2307 = sub i32 %2306, %2305
  store i32 %2307, ptr %47, align 4
  %2308 = load i32, ptr %46, align 4
  %2309 = lshr i32 %2308, 12
  %2310 = load i32, ptr %47, align 4
  %2311 = xor i32 %2310, %2309
  store i32 %2311, ptr %47, align 4
  %2312 = load i32, ptr %46, align 4
  %2313 = load i32, ptr %48, align 4
  %2314 = sub i32 %2313, %2312
  store i32 %2314, ptr %48, align 4
  %2315 = load i32, ptr %47, align 4
  %2316 = load i32, ptr %48, align 4
  %2317 = sub i32 %2316, %2315
  store i32 %2317, ptr %48, align 4
  %2318 = load i32, ptr %47, align 4
  %2319 = shl i32 %2318, 16
  %2320 = load i32, ptr %48, align 4
  %2321 = xor i32 %2320, %2319
  store i32 %2321, ptr %48, align 4
  %2322 = load i32, ptr %47, align 4
  %2323 = load i32, ptr %46, align 4
  %2324 = sub i32 %2323, %2322
  store i32 %2324, ptr %46, align 4
  %2325 = load i32, ptr %48, align 4
  %2326 = load i32, ptr %46, align 4
  %2327 = sub i32 %2326, %2325
  store i32 %2327, ptr %46, align 4
  %2328 = load i32, ptr %48, align 4
  %2329 = lshr i32 %2328, 5
  %2330 = load i32, ptr %46, align 4
  %2331 = xor i32 %2330, %2329
  store i32 %2331, ptr %46, align 4
  %2332 = load i32, ptr %48, align 4
  %2333 = load i32, ptr %47, align 4
  %2334 = sub i32 %2333, %2332
  store i32 %2334, ptr %47, align 4
  %2335 = load i32, ptr %46, align 4
  %2336 = load i32, ptr %47, align 4
  %2337 = sub i32 %2336, %2335
  store i32 %2337, ptr %47, align 4
  %2338 = load i32, ptr %46, align 4
  %2339 = lshr i32 %2338, 3
  %2340 = load i32, ptr %47, align 4
  %2341 = xor i32 %2340, %2339
  store i32 %2341, ptr %47, align 4
  %2342 = load i32, ptr %46, align 4
  %2343 = load i32, ptr %48, align 4
  %2344 = sub i32 %2343, %2342
  store i32 %2344, ptr %48, align 4
  %2345 = load i32, ptr %47, align 4
  %2346 = load i32, ptr %48, align 4
  %2347 = sub i32 %2346, %2345
  store i32 %2347, ptr %48, align 4
  %2348 = load i32, ptr %47, align 4
  %2349 = shl i32 %2348, 10
  %2350 = load i32, ptr %48, align 4
  %2351 = xor i32 %2350, %2349
  store i32 %2351, ptr %48, align 4
  %2352 = load i32, ptr %47, align 4
  %2353 = load i32, ptr %46, align 4
  %2354 = sub i32 %2353, %2352
  store i32 %2354, ptr %46, align 4
  %2355 = load i32, ptr %48, align 4
  %2356 = load i32, ptr %46, align 4
  %2357 = sub i32 %2356, %2355
  store i32 %2357, ptr %46, align 4
  %2358 = load i32, ptr %48, align 4
  %2359 = lshr i32 %2358, 15
  %2360 = load i32, ptr %46, align 4
  %2361 = xor i32 %2360, %2359
  store i32 %2361, ptr %46, align 4
  br label %2362

2362:                                             ; preds = %2271
  br label %2363

2363:                                             ; preds = %2362
  br label %2364

2364:                                             ; preds = %2363
  br label %2365

2365:                                             ; preds = %2364
  %2366 = load i32, ptr %46, align 4
  %2367 = load ptr, ptr %45, align 8
  %2368 = getelementptr inbounds nuw %struct.DictEntry, ptr %2367, i32 0, i32 2
  %2369 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2368, i32 0, i32 7
  store i32 %2366, ptr %2369, align 4
  %2370 = load ptr, ptr %45, align 8
  %2371 = getelementptr inbounds nuw %struct.DictEntry, ptr %2370, i32 0, i32 0
  %2372 = load ptr, ptr %2371, align 8
  %2373 = load ptr, ptr %45, align 8
  %2374 = getelementptr inbounds nuw %struct.DictEntry, ptr %2373, i32 0, i32 2
  %2375 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2374, i32 0, i32 5
  store ptr %2372, ptr %2375, align 8
  %2376 = load ptr, ptr %45, align 8
  %2377 = getelementptr inbounds nuw %struct.DictEntry, ptr %2376, i32 0, i32 0
  %2378 = load ptr, ptr %2377, align 8
  %2379 = call i64 @strlen(ptr noundef %2378)
  %2380 = trunc i64 %2379 to i32
  %2381 = load ptr, ptr %45, align 8
  %2382 = getelementptr inbounds nuw %struct.DictEntry, ptr %2381, i32 0, i32 2
  %2383 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2382, i32 0, i32 6
  store i32 %2380, ptr %2383, align 8
  %2384 = load ptr, ptr %6, align 8
  %2385 = icmp ne ptr %2384, null
  br i1 %2385, label %2467, label %2386

2386:                                             ; preds = %2365
  %2387 = load ptr, ptr %45, align 8
  %2388 = getelementptr inbounds nuw %struct.DictEntry, ptr %2387, i32 0, i32 2
  %2389 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2388, i32 0, i32 2
  store ptr null, ptr %2389, align 8
  %2390 = load ptr, ptr %45, align 8
  %2391 = getelementptr inbounds nuw %struct.DictEntry, ptr %2390, i32 0, i32 2
  %2392 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2391, i32 0, i32 1
  store ptr null, ptr %2392, align 8
  br label %2393

2393:                                             ; preds = %2386
  %2394 = call noalias ptr @malloc(i64 noundef 64)
  %2395 = load ptr, ptr %45, align 8
  %2396 = getelementptr inbounds nuw %struct.DictEntry, ptr %2395, i32 0, i32 2
  %2397 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2396, i32 0, i32 0
  store ptr %2394, ptr %2397, align 8
  %2398 = load ptr, ptr %45, align 8
  %2399 = getelementptr inbounds nuw %struct.DictEntry, ptr %2398, i32 0, i32 2
  %2400 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2399, i32 0, i32 0
  %2401 = load ptr, ptr %2400, align 8
  %2402 = icmp ne ptr %2401, null
  br i1 %2402, label %2404, label %2403

2403:                                             ; preds = %2393
  call void @exit(i32 noundef -1)
  unreachable

2404:                                             ; preds = %2393
  %2405 = load ptr, ptr %45, align 8
  %2406 = getelementptr inbounds nuw %struct.DictEntry, ptr %2405, i32 0, i32 2
  %2407 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2406, i32 0, i32 0
  %2408 = load ptr, ptr %2407, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %2408, i8 0, i64 64, i1 false)
  %2409 = load ptr, ptr %45, align 8
  %2410 = getelementptr inbounds nuw %struct.DictEntry, ptr %2409, i32 0, i32 2
  %2411 = load ptr, ptr %45, align 8
  %2412 = getelementptr inbounds nuw %struct.DictEntry, ptr %2411, i32 0, i32 2
  %2413 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2412, i32 0, i32 0
  %2414 = load ptr, ptr %2413, align 8
  %2415 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2414, i32 0, i32 4
  store ptr %2410, ptr %2415, align 8
  %2416 = load ptr, ptr %45, align 8
  %2417 = getelementptr inbounds nuw %struct.DictEntry, ptr %2416, i32 0, i32 2
  %2418 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2417, i32 0, i32 0
  %2419 = load ptr, ptr %2418, align 8
  %2420 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2419, i32 0, i32 1
  store i32 32, ptr %2420, align 8
  %2421 = load ptr, ptr %45, align 8
  %2422 = getelementptr inbounds nuw %struct.DictEntry, ptr %2421, i32 0, i32 2
  %2423 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2422, i32 0, i32 0
  %2424 = load ptr, ptr %2423, align 8
  %2425 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2424, i32 0, i32 2
  store i32 5, ptr %2425, align 4
  %2426 = load ptr, ptr %45, align 8
  %2427 = getelementptr inbounds nuw %struct.DictEntry, ptr %2426, i32 0, i32 2
  %2428 = load ptr, ptr %45, align 8
  %2429 = ptrtoint ptr %2427 to i64
  %2430 = ptrtoint ptr %2428 to i64
  %2431 = sub i64 %2429, %2430
  %2432 = load ptr, ptr %45, align 8
  %2433 = getelementptr inbounds nuw %struct.DictEntry, ptr %2432, i32 0, i32 2
  %2434 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2433, i32 0, i32 0
  %2435 = load ptr, ptr %2434, align 8
  %2436 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2435, i32 0, i32 5
  store i64 %2431, ptr %2436, align 8
  %2437 = call noalias ptr @malloc(i64 noundef 512)
  %2438 = load ptr, ptr %45, align 8
  %2439 = getelementptr inbounds nuw %struct.DictEntry, ptr %2438, i32 0, i32 2
  %2440 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2439, i32 0, i32 0
  %2441 = load ptr, ptr %2440, align 8
  %2442 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2441, i32 0, i32 0
  store ptr %2437, ptr %2442, align 8
  %2443 = load ptr, ptr %45, align 8
  %2444 = getelementptr inbounds nuw %struct.DictEntry, ptr %2443, i32 0, i32 2
  %2445 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2444, i32 0, i32 0
  %2446 = load ptr, ptr %2445, align 8
  %2447 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2446, i32 0, i32 10
  store i32 -1609490463, ptr %2447, align 8
  %2448 = load ptr, ptr %45, align 8
  %2449 = getelementptr inbounds nuw %struct.DictEntry, ptr %2448, i32 0, i32 2
  %2450 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2449, i32 0, i32 0
  %2451 = load ptr, ptr %2450, align 8
  %2452 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2451, i32 0, i32 0
  %2453 = load ptr, ptr %2452, align 8
  %2454 = icmp ne ptr %2453, null
  br i1 %2454, label %2456, label %2455

2455:                                             ; preds = %2404
  call void @exit(i32 noundef -1)
  unreachable

2456:                                             ; preds = %2404
  %2457 = load ptr, ptr %45, align 8
  %2458 = getelementptr inbounds nuw %struct.DictEntry, ptr %2457, i32 0, i32 2
  %2459 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2458, i32 0, i32 0
  %2460 = load ptr, ptr %2459, align 8
  %2461 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2460, i32 0, i32 0
  %2462 = load ptr, ptr %2461, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %2462, i8 0, i64 512, i1 false)
  br label %2463

2463:                                             ; preds = %2456
  br label %2464

2464:                                             ; preds = %2463
  br label %2465

2465:                                             ; preds = %2464
  %2466 = load ptr, ptr %45, align 8
  store ptr %2466, ptr %6, align 8
  br label %2512

2467:                                             ; preds = %2365
  %2468 = load ptr, ptr %6, align 8
  %2469 = getelementptr inbounds nuw %struct.DictEntry, ptr %2468, i32 0, i32 2
  %2470 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2469, i32 0, i32 0
  %2471 = load ptr, ptr %2470, align 8
  %2472 = load ptr, ptr %45, align 8
  %2473 = getelementptr inbounds nuw %struct.DictEntry, ptr %2472, i32 0, i32 2
  %2474 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2473, i32 0, i32 0
  store ptr %2471, ptr %2474, align 8
  br label %2475

2475:                                             ; preds = %2467
  %2476 = load ptr, ptr %45, align 8
  %2477 = getelementptr inbounds nuw %struct.DictEntry, ptr %2476, i32 0, i32 2
  %2478 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2477, i32 0, i32 2
  store ptr null, ptr %2478, align 8
  %2479 = load ptr, ptr %6, align 8
  %2480 = getelementptr inbounds nuw %struct.DictEntry, ptr %2479, i32 0, i32 2
  %2481 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2480, i32 0, i32 0
  %2482 = load ptr, ptr %2481, align 8
  %2483 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2482, i32 0, i32 4
  %2484 = load ptr, ptr %2483, align 8
  %2485 = load ptr, ptr %6, align 8
  %2486 = getelementptr inbounds nuw %struct.DictEntry, ptr %2485, i32 0, i32 2
  %2487 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2486, i32 0, i32 0
  %2488 = load ptr, ptr %2487, align 8
  %2489 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2488, i32 0, i32 5
  %2490 = load i64, ptr %2489, align 8
  %2491 = sub i64 0, %2490
  %2492 = getelementptr inbounds i8, ptr %2484, i64 %2491
  %2493 = load ptr, ptr %45, align 8
  %2494 = getelementptr inbounds nuw %struct.DictEntry, ptr %2493, i32 0, i32 2
  %2495 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2494, i32 0, i32 1
  store ptr %2492, ptr %2495, align 8
  %2496 = load ptr, ptr %45, align 8
  %2497 = load ptr, ptr %6, align 8
  %2498 = getelementptr inbounds nuw %struct.DictEntry, ptr %2497, i32 0, i32 2
  %2499 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2498, i32 0, i32 0
  %2500 = load ptr, ptr %2499, align 8
  %2501 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2500, i32 0, i32 4
  %2502 = load ptr, ptr %2501, align 8
  %2503 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2502, i32 0, i32 2
  store ptr %2496, ptr %2503, align 8
  %2504 = load ptr, ptr %45, align 8
  %2505 = getelementptr inbounds nuw %struct.DictEntry, ptr %2504, i32 0, i32 2
  %2506 = load ptr, ptr %6, align 8
  %2507 = getelementptr inbounds nuw %struct.DictEntry, ptr %2506, i32 0, i32 2
  %2508 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2507, i32 0, i32 0
  %2509 = load ptr, ptr %2508, align 8
  %2510 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2509, i32 0, i32 4
  store ptr %2505, ptr %2510, align 8
  br label %2511

2511:                                             ; preds = %2475
  br label %2512

2512:                                             ; preds = %2511, %2465
  br label %2513

2513:                                             ; preds = %2512
  %2514 = load ptr, ptr %6, align 8
  %2515 = getelementptr inbounds nuw %struct.DictEntry, ptr %2514, i32 0, i32 2
  %2516 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2515, i32 0, i32 0
  %2517 = load ptr, ptr %2516, align 8
  %2518 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2517, i32 0, i32 3
  %2519 = load i32, ptr %2518, align 8
  %2520 = add i32 %2519, 1
  store i32 %2520, ptr %2518, align 8
  br label %2521

2521:                                             ; preds = %2513
  %2522 = load i32, ptr %46, align 4
  %2523 = load ptr, ptr %6, align 8
  %2524 = getelementptr inbounds nuw %struct.DictEntry, ptr %2523, i32 0, i32 2
  %2525 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2524, i32 0, i32 0
  %2526 = load ptr, ptr %2525, align 8
  %2527 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2526, i32 0, i32 1
  %2528 = load i32, ptr %2527, align 8
  %2529 = sub i32 %2528, 1
  %2530 = and i32 %2522, %2529
  store i32 %2530, ptr %51, align 4
  br label %2531

2531:                                             ; preds = %2521
  br label %2532

2532:                                             ; preds = %2531
  %2533 = load ptr, ptr %6, align 8
  %2534 = getelementptr inbounds nuw %struct.DictEntry, ptr %2533, i32 0, i32 2
  %2535 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2534, i32 0, i32 0
  %2536 = load ptr, ptr %2535, align 8
  %2537 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2536, i32 0, i32 0
  %2538 = load ptr, ptr %2537, align 8
  %2539 = load i32, ptr %51, align 4
  %2540 = zext i32 %2539 to i64
  %2541 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2538, i64 %2540
  store ptr %2541, ptr %52, align 8
  %2542 = load ptr, ptr %52, align 8
  %2543 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2542, i32 0, i32 1
  %2544 = load i32, ptr %2543, align 8
  %2545 = add i32 %2544, 1
  store i32 %2545, ptr %2543, align 8
  %2546 = load ptr, ptr %52, align 8
  %2547 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2546, i32 0, i32 0
  %2548 = load ptr, ptr %2547, align 8
  %2549 = load ptr, ptr %45, align 8
  %2550 = getelementptr inbounds nuw %struct.DictEntry, ptr %2549, i32 0, i32 2
  %2551 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2550, i32 0, i32 4
  store ptr %2548, ptr %2551, align 8
  %2552 = load ptr, ptr %45, align 8
  %2553 = getelementptr inbounds nuw %struct.DictEntry, ptr %2552, i32 0, i32 2
  %2554 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2553, i32 0, i32 3
  store ptr null, ptr %2554, align 8
  %2555 = load ptr, ptr %52, align 8
  %2556 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2555, i32 0, i32 0
  %2557 = load ptr, ptr %2556, align 8
  %2558 = icmp ne ptr %2557, null
  br i1 %2558, label %2559, label %2566

2559:                                             ; preds = %2532
  %2560 = load ptr, ptr %45, align 8
  %2561 = getelementptr inbounds nuw %struct.DictEntry, ptr %2560, i32 0, i32 2
  %2562 = load ptr, ptr %52, align 8
  %2563 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2562, i32 0, i32 0
  %2564 = load ptr, ptr %2563, align 8
  %2565 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2564, i32 0, i32 3
  store ptr %2561, ptr %2565, align 8
  br label %2566

2566:                                             ; preds = %2559, %2532
  %2567 = load ptr, ptr %45, align 8
  %2568 = getelementptr inbounds nuw %struct.DictEntry, ptr %2567, i32 0, i32 2
  %2569 = load ptr, ptr %52, align 8
  %2570 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2569, i32 0, i32 0
  store ptr %2568, ptr %2570, align 8
  %2571 = load ptr, ptr %52, align 8
  %2572 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2571, i32 0, i32 1
  %2573 = load i32, ptr %2572, align 8
  %2574 = load ptr, ptr %52, align 8
  %2575 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2574, i32 0, i32 2
  %2576 = load i32, ptr %2575, align 4
  %2577 = add i32 %2576, 1
  %2578 = mul i32 %2577, 10
  %2579 = icmp uge i32 %2573, %2578
  br i1 %2579, label %2580, label %2842

2580:                                             ; preds = %2566
  %2581 = load ptr, ptr %45, align 8
  %2582 = getelementptr inbounds nuw %struct.DictEntry, ptr %2581, i32 0, i32 2
  %2583 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2582, i32 0, i32 0
  %2584 = load ptr, ptr %2583, align 8
  %2585 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2584, i32 0, i32 9
  %2586 = load i32, ptr %2585, align 4
  %2587 = icmp ne i32 %2586, 0
  br i1 %2587, label %2842, label %2588

2588:                                             ; preds = %2580
  br label %2589

2589:                                             ; preds = %2588
  %2590 = load ptr, ptr %45, align 8
  %2591 = getelementptr inbounds nuw %struct.DictEntry, ptr %2590, i32 0, i32 2
  %2592 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2591, i32 0, i32 0
  %2593 = load ptr, ptr %2592, align 8
  %2594 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2593, i32 0, i32 1
  %2595 = load i32, ptr %2594, align 8
  %2596 = zext i32 %2595 to i64
  %2597 = mul i64 16, %2596
  %2598 = mul i64 %2597, 2
  %2599 = call noalias ptr @malloc(i64 noundef %2598)
  store ptr %2599, ptr %57, align 8
  %2600 = load ptr, ptr %57, align 8
  %2601 = icmp ne ptr %2600, null
  br i1 %2601, label %2603, label %2602

2602:                                             ; preds = %2589
  call void @exit(i32 noundef -1)
  unreachable

2603:                                             ; preds = %2589
  %2604 = load ptr, ptr %57, align 8
  %2605 = load ptr, ptr %45, align 8
  %2606 = getelementptr inbounds nuw %struct.DictEntry, ptr %2605, i32 0, i32 2
  %2607 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2606, i32 0, i32 0
  %2608 = load ptr, ptr %2607, align 8
  %2609 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2608, i32 0, i32 1
  %2610 = load i32, ptr %2609, align 8
  %2611 = zext i32 %2610 to i64
  %2612 = mul i64 16, %2611
  %2613 = mul i64 %2612, 2
  call void @llvm.memset.p0.i64(ptr align 8 %2604, i8 0, i64 %2613, i1 false)
  %2614 = load ptr, ptr %45, align 8
  %2615 = getelementptr inbounds nuw %struct.DictEntry, ptr %2614, i32 0, i32 2
  %2616 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2615, i32 0, i32 0
  %2617 = load ptr, ptr %2616, align 8
  %2618 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2617, i32 0, i32 3
  %2619 = load i32, ptr %2618, align 8
  %2620 = load ptr, ptr %45, align 8
  %2621 = getelementptr inbounds nuw %struct.DictEntry, ptr %2620, i32 0, i32 2
  %2622 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2621, i32 0, i32 0
  %2623 = load ptr, ptr %2622, align 8
  %2624 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2623, i32 0, i32 2
  %2625 = load i32, ptr %2624, align 4
  %2626 = add i32 %2625, 1
  %2627 = lshr i32 %2619, %2626
  %2628 = load ptr, ptr %45, align 8
  %2629 = getelementptr inbounds nuw %struct.DictEntry, ptr %2628, i32 0, i32 2
  %2630 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2629, i32 0, i32 0
  %2631 = load ptr, ptr %2630, align 8
  %2632 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2631, i32 0, i32 3
  %2633 = load i32, ptr %2632, align 8
  %2634 = load ptr, ptr %45, align 8
  %2635 = getelementptr inbounds nuw %struct.DictEntry, ptr %2634, i32 0, i32 2
  %2636 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2635, i32 0, i32 0
  %2637 = load ptr, ptr %2636, align 8
  %2638 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2637, i32 0, i32 1
  %2639 = load i32, ptr %2638, align 8
  %2640 = mul i32 %2639, 2
  %2641 = sub i32 %2640, 1
  %2642 = and i32 %2633, %2641
  %2643 = icmp ne i32 %2642, 0
  %2644 = zext i1 %2643 to i64
  %2645 = select i1 %2643, i32 1, i32 0
  %2646 = add i32 %2627, %2645
  %2647 = load ptr, ptr %45, align 8
  %2648 = getelementptr inbounds nuw %struct.DictEntry, ptr %2647, i32 0, i32 2
  %2649 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2648, i32 0, i32 0
  %2650 = load ptr, ptr %2649, align 8
  %2651 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2650, i32 0, i32 6
  store i32 %2646, ptr %2651, align 8
  %2652 = load ptr, ptr %45, align 8
  %2653 = getelementptr inbounds nuw %struct.DictEntry, ptr %2652, i32 0, i32 2
  %2654 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2653, i32 0, i32 0
  %2655 = load ptr, ptr %2654, align 8
  %2656 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2655, i32 0, i32 7
  store i32 0, ptr %2656, align 4
  store i32 0, ptr %54, align 4
  br label %2657

2657:                                             ; preds = %2766, %2603
  %2658 = load i32, ptr %54, align 4
  %2659 = load ptr, ptr %45, align 8
  %2660 = getelementptr inbounds nuw %struct.DictEntry, ptr %2659, i32 0, i32 2
  %2661 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2660, i32 0, i32 0
  %2662 = load ptr, ptr %2661, align 8
  %2663 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2662, i32 0, i32 1
  %2664 = load i32, ptr %2663, align 8
  %2665 = icmp ult i32 %2658, %2664
  br i1 %2665, label %2666, label %2769

2666:                                             ; preds = %2657
  %2667 = load ptr, ptr %45, align 8
  %2668 = getelementptr inbounds nuw %struct.DictEntry, ptr %2667, i32 0, i32 2
  %2669 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2668, i32 0, i32 0
  %2670 = load ptr, ptr %2669, align 8
  %2671 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2670, i32 0, i32 0
  %2672 = load ptr, ptr %2671, align 8
  %2673 = load i32, ptr %54, align 4
  %2674 = zext i32 %2673 to i64
  %2675 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2672, i64 %2674
  %2676 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2675, i32 0, i32 0
  %2677 = load ptr, ptr %2676, align 8
  store ptr %2677, ptr %55, align 8
  br label %2678

2678:                                             ; preds = %2760, %2666
  %2679 = load ptr, ptr %55, align 8
  %2680 = icmp ne ptr %2679, null
  br i1 %2680, label %2681, label %2765

2681:                                             ; preds = %2678
  %2682 = load ptr, ptr %55, align 8
  %2683 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2682, i32 0, i32 4
  %2684 = load ptr, ptr %2683, align 8
  store ptr %2684, ptr %56, align 8
  br label %2685

2685:                                             ; preds = %2681
  %2686 = load ptr, ptr %55, align 8
  %2687 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2686, i32 0, i32 7
  %2688 = load i32, ptr %2687, align 4
  %2689 = load ptr, ptr %45, align 8
  %2690 = getelementptr inbounds nuw %struct.DictEntry, ptr %2689, i32 0, i32 2
  %2691 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2690, i32 0, i32 0
  %2692 = load ptr, ptr %2691, align 8
  %2693 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2692, i32 0, i32 1
  %2694 = load i32, ptr %2693, align 8
  %2695 = mul i32 %2694, 2
  %2696 = sub i32 %2695, 1
  %2697 = and i32 %2688, %2696
  store i32 %2697, ptr %53, align 4
  br label %2698

2698:                                             ; preds = %2685
  %2699 = load ptr, ptr %57, align 8
  %2700 = load i32, ptr %53, align 4
  %2701 = zext i32 %2700 to i64
  %2702 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2699, i64 %2701
  store ptr %2702, ptr %58, align 8
  %2703 = load ptr, ptr %58, align 8
  %2704 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2703, i32 0, i32 1
  %2705 = load i32, ptr %2704, align 8
  %2706 = add i32 %2705, 1
  store i32 %2706, ptr %2704, align 8
  %2707 = load ptr, ptr %45, align 8
  %2708 = getelementptr inbounds nuw %struct.DictEntry, ptr %2707, i32 0, i32 2
  %2709 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2708, i32 0, i32 0
  %2710 = load ptr, ptr %2709, align 8
  %2711 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2710, i32 0, i32 6
  %2712 = load i32, ptr %2711, align 8
  %2713 = icmp ugt i32 %2706, %2712
  br i1 %2713, label %2714, label %2742

2714:                                             ; preds = %2698
  %2715 = load ptr, ptr %45, align 8
  %2716 = getelementptr inbounds nuw %struct.DictEntry, ptr %2715, i32 0, i32 2
  %2717 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2716, i32 0, i32 0
  %2718 = load ptr, ptr %2717, align 8
  %2719 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2718, i32 0, i32 7
  %2720 = load i32, ptr %2719, align 4
  %2721 = add i32 %2720, 1
  store i32 %2721, ptr %2719, align 4
  %2722 = load ptr, ptr %58, align 8
  %2723 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2722, i32 0, i32 1
  %2724 = load i32, ptr %2723, align 8
  %2725 = load ptr, ptr %58, align 8
  %2726 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2725, i32 0, i32 2
  %2727 = load i32, ptr %2726, align 4
  %2728 = load ptr, ptr %45, align 8
  %2729 = getelementptr inbounds nuw %struct.DictEntry, ptr %2728, i32 0, i32 2
  %2730 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2729, i32 0, i32 0
  %2731 = load ptr, ptr %2730, align 8
  %2732 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2731, i32 0, i32 6
  %2733 = load i32, ptr %2732, align 8
  %2734 = mul i32 %2727, %2733
  %2735 = icmp ugt i32 %2724, %2734
  br i1 %2735, label %2736, label %2741

2736:                                             ; preds = %2714
  %2737 = load ptr, ptr %58, align 8
  %2738 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2737, i32 0, i32 2
  %2739 = load i32, ptr %2738, align 4
  %2740 = add i32 %2739, 1
  store i32 %2740, ptr %2738, align 4
  br label %2741

2741:                                             ; preds = %2736, %2714
  br label %2742

2742:                                             ; preds = %2741, %2698
  %2743 = load ptr, ptr %55, align 8
  %2744 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2743, i32 0, i32 3
  store ptr null, ptr %2744, align 8
  %2745 = load ptr, ptr %58, align 8
  %2746 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2745, i32 0, i32 0
  %2747 = load ptr, ptr %2746, align 8
  %2748 = load ptr, ptr %55, align 8
  %2749 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2748, i32 0, i32 4
  store ptr %2747, ptr %2749, align 8
  %2750 = load ptr, ptr %58, align 8
  %2751 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2750, i32 0, i32 0
  %2752 = load ptr, ptr %2751, align 8
  %2753 = icmp ne ptr %2752, null
  br i1 %2753, label %2754, label %2760

2754:                                             ; preds = %2742
  %2755 = load ptr, ptr %55, align 8
  %2756 = load ptr, ptr %58, align 8
  %2757 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2756, i32 0, i32 0
  %2758 = load ptr, ptr %2757, align 8
  %2759 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2758, i32 0, i32 3
  store ptr %2755, ptr %2759, align 8
  br label %2760

2760:                                             ; preds = %2754, %2742
  %2761 = load ptr, ptr %55, align 8
  %2762 = load ptr, ptr %58, align 8
  %2763 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %2762, i32 0, i32 0
  store ptr %2761, ptr %2763, align 8
  %2764 = load ptr, ptr %56, align 8
  store ptr %2764, ptr %55, align 8
  br label %2678, !llvm.loop !58

2765:                                             ; preds = %2678
  br label %2766

2766:                                             ; preds = %2765
  %2767 = load i32, ptr %54, align 4
  %2768 = add i32 %2767, 1
  store i32 %2768, ptr %54, align 4
  br label %2657, !llvm.loop !59

2769:                                             ; preds = %2657
  %2770 = load ptr, ptr %45, align 8
  %2771 = getelementptr inbounds nuw %struct.DictEntry, ptr %2770, i32 0, i32 2
  %2772 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2771, i32 0, i32 0
  %2773 = load ptr, ptr %2772, align 8
  %2774 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2773, i32 0, i32 0
  %2775 = load ptr, ptr %2774, align 8
  call void @free(ptr noundef %2775)
  %2776 = load ptr, ptr %45, align 8
  %2777 = getelementptr inbounds nuw %struct.DictEntry, ptr %2776, i32 0, i32 2
  %2778 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2777, i32 0, i32 0
  %2779 = load ptr, ptr %2778, align 8
  %2780 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2779, i32 0, i32 1
  %2781 = load i32, ptr %2780, align 8
  %2782 = mul i32 %2781, 2
  store i32 %2782, ptr %2780, align 8
  %2783 = load ptr, ptr %45, align 8
  %2784 = getelementptr inbounds nuw %struct.DictEntry, ptr %2783, i32 0, i32 2
  %2785 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2784, i32 0, i32 0
  %2786 = load ptr, ptr %2785, align 8
  %2787 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2786, i32 0, i32 2
  %2788 = load i32, ptr %2787, align 4
  %2789 = add i32 %2788, 1
  store i32 %2789, ptr %2787, align 4
  %2790 = load ptr, ptr %57, align 8
  %2791 = load ptr, ptr %45, align 8
  %2792 = getelementptr inbounds nuw %struct.DictEntry, ptr %2791, i32 0, i32 2
  %2793 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2792, i32 0, i32 0
  %2794 = load ptr, ptr %2793, align 8
  %2795 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2794, i32 0, i32 0
  store ptr %2790, ptr %2795, align 8
  %2796 = load ptr, ptr %45, align 8
  %2797 = getelementptr inbounds nuw %struct.DictEntry, ptr %2796, i32 0, i32 2
  %2798 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2797, i32 0, i32 0
  %2799 = load ptr, ptr %2798, align 8
  %2800 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2799, i32 0, i32 7
  %2801 = load i32, ptr %2800, align 4
  %2802 = load ptr, ptr %45, align 8
  %2803 = getelementptr inbounds nuw %struct.DictEntry, ptr %2802, i32 0, i32 2
  %2804 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2803, i32 0, i32 0
  %2805 = load ptr, ptr %2804, align 8
  %2806 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2805, i32 0, i32 3
  %2807 = load i32, ptr %2806, align 8
  %2808 = lshr i32 %2807, 1
  %2809 = icmp ugt i32 %2801, %2808
  br i1 %2809, label %2810, label %2818

2810:                                             ; preds = %2769
  %2811 = load ptr, ptr %45, align 8
  %2812 = getelementptr inbounds nuw %struct.DictEntry, ptr %2811, i32 0, i32 2
  %2813 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2812, i32 0, i32 0
  %2814 = load ptr, ptr %2813, align 8
  %2815 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2814, i32 0, i32 8
  %2816 = load i32, ptr %2815, align 8
  %2817 = add i32 %2816, 1
  br label %2819

2818:                                             ; preds = %2769
  br label %2819

2819:                                             ; preds = %2818, %2810
  %2820 = phi i32 [ %2817, %2810 ], [ 0, %2818 ]
  %2821 = load ptr, ptr %45, align 8
  %2822 = getelementptr inbounds nuw %struct.DictEntry, ptr %2821, i32 0, i32 2
  %2823 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2822, i32 0, i32 0
  %2824 = load ptr, ptr %2823, align 8
  %2825 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2824, i32 0, i32 8
  store i32 %2820, ptr %2825, align 8
  %2826 = load ptr, ptr %45, align 8
  %2827 = getelementptr inbounds nuw %struct.DictEntry, ptr %2826, i32 0, i32 2
  %2828 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2827, i32 0, i32 0
  %2829 = load ptr, ptr %2828, align 8
  %2830 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2829, i32 0, i32 8
  %2831 = load i32, ptr %2830, align 8
  %2832 = icmp ugt i32 %2831, 1
  br i1 %2832, label %2833, label %2839

2833:                                             ; preds = %2819
  %2834 = load ptr, ptr %45, align 8
  %2835 = getelementptr inbounds nuw %struct.DictEntry, ptr %2834, i32 0, i32 2
  %2836 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %2835, i32 0, i32 0
  %2837 = load ptr, ptr %2836, align 8
  %2838 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %2837, i32 0, i32 9
  store i32 1, ptr %2838, align 4
  br label %2839

2839:                                             ; preds = %2833, %2819
  br label %2840

2840:                                             ; preds = %2839
  br label %2841

2841:                                             ; preds = %2840
  br label %2842

2842:                                             ; preds = %2841, %2580, %2566
  br label %2843

2843:                                             ; preds = %2842
  br label %2844

2844:                                             ; preds = %2843
  br label %2845

2845:                                             ; preds = %2844
  br label %2846

2846:                                             ; preds = %2845
  %2847 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %2847)
  %2848 = call noalias ptr @malloc(i64 noundef 2)
  store ptr %2848, ptr %24, align 8
  %2849 = load ptr, ptr %4, align 8
  %2850 = load i64, ptr %25, align 8
  %2851 = getelementptr inbounds nuw i8, ptr %2849, i64 %2850
  %2852 = load i8, ptr %2851, align 1
  %2853 = load ptr, ptr %24, align 8
  %2854 = getelementptr inbounds i8, ptr %2853, i64 0
  store i8 %2852, ptr %2854, align 1
  %2855 = load ptr, ptr %24, align 8
  %2856 = getelementptr inbounds i8, ptr %2855, i64 1
  store i8 0, ptr %2856, align 1
  br label %2857

2857:                                             ; preds = %2846, %1475
  br label %2858

2858:                                             ; preds = %2857
  %2859 = load i64, ptr %25, align 8
  %2860 = add i64 %2859, 1
  store i64 %2860, ptr %25, align 8
  br label %971, !llvm.loop !60

2861:                                             ; preds = %971
  store ptr null, ptr %59, align 8
  br label %2862

2862:                                             ; preds = %2861
  %2863 = load ptr, ptr %24, align 8
  %2864 = call i64 @strlen(ptr noundef %2863)
  %2865 = trunc i64 %2864 to i32
  store i32 %2865, ptr %60, align 4
  br label %2866

2866:                                             ; preds = %2862
  store ptr null, ptr %59, align 8
  %2867 = load ptr, ptr %6, align 8
  %2868 = icmp ne ptr %2867, null
  br i1 %2868, label %2869, label %3341

2869:                                             ; preds = %2866
  br label %2870

2870:                                             ; preds = %2869
  br label %2871

2871:                                             ; preds = %2870
  %2872 = load ptr, ptr %24, align 8
  store ptr %2872, ptr %65, align 8
  store i32 -17973521, ptr %61, align 4
  store i32 -1640531527, ptr %63, align 4
  store i32 -1640531527, ptr %62, align 4
  %2873 = load i32, ptr %60, align 4
  store i32 %2873, ptr %64, align 4
  br label %2874

2874:                                             ; preds = %3041, %2871
  %2875 = load i32, ptr %64, align 4
  %2876 = icmp uge i32 %2875, 12
  br i1 %2876, label %2877, label %3046

2877:                                             ; preds = %2874
  %2878 = load ptr, ptr %65, align 8
  %2879 = getelementptr inbounds i8, ptr %2878, i64 0
  %2880 = load i8, ptr %2879, align 1
  %2881 = zext i8 %2880 to i32
  %2882 = load ptr, ptr %65, align 8
  %2883 = getelementptr inbounds i8, ptr %2882, i64 1
  %2884 = load i8, ptr %2883, align 1
  %2885 = zext i8 %2884 to i32
  %2886 = shl i32 %2885, 8
  %2887 = add i32 %2881, %2886
  %2888 = load ptr, ptr %65, align 8
  %2889 = getelementptr inbounds i8, ptr %2888, i64 2
  %2890 = load i8, ptr %2889, align 1
  %2891 = zext i8 %2890 to i32
  %2892 = shl i32 %2891, 16
  %2893 = add i32 %2887, %2892
  %2894 = load ptr, ptr %65, align 8
  %2895 = getelementptr inbounds i8, ptr %2894, i64 3
  %2896 = load i8, ptr %2895, align 1
  %2897 = zext i8 %2896 to i32
  %2898 = shl i32 %2897, 24
  %2899 = add i32 %2893, %2898
  %2900 = load i32, ptr %62, align 4
  %2901 = add i32 %2900, %2899
  store i32 %2901, ptr %62, align 4
  %2902 = load ptr, ptr %65, align 8
  %2903 = getelementptr inbounds i8, ptr %2902, i64 4
  %2904 = load i8, ptr %2903, align 1
  %2905 = zext i8 %2904 to i32
  %2906 = load ptr, ptr %65, align 8
  %2907 = getelementptr inbounds i8, ptr %2906, i64 5
  %2908 = load i8, ptr %2907, align 1
  %2909 = zext i8 %2908 to i32
  %2910 = shl i32 %2909, 8
  %2911 = add i32 %2905, %2910
  %2912 = load ptr, ptr %65, align 8
  %2913 = getelementptr inbounds i8, ptr %2912, i64 6
  %2914 = load i8, ptr %2913, align 1
  %2915 = zext i8 %2914 to i32
  %2916 = shl i32 %2915, 16
  %2917 = add i32 %2911, %2916
  %2918 = load ptr, ptr %65, align 8
  %2919 = getelementptr inbounds i8, ptr %2918, i64 7
  %2920 = load i8, ptr %2919, align 1
  %2921 = zext i8 %2920 to i32
  %2922 = shl i32 %2921, 24
  %2923 = add i32 %2917, %2922
  %2924 = load i32, ptr %63, align 4
  %2925 = add i32 %2924, %2923
  store i32 %2925, ptr %63, align 4
  %2926 = load ptr, ptr %65, align 8
  %2927 = getelementptr inbounds i8, ptr %2926, i64 8
  %2928 = load i8, ptr %2927, align 1
  %2929 = zext i8 %2928 to i32
  %2930 = load ptr, ptr %65, align 8
  %2931 = getelementptr inbounds i8, ptr %2930, i64 9
  %2932 = load i8, ptr %2931, align 1
  %2933 = zext i8 %2932 to i32
  %2934 = shl i32 %2933, 8
  %2935 = add i32 %2929, %2934
  %2936 = load ptr, ptr %65, align 8
  %2937 = getelementptr inbounds i8, ptr %2936, i64 10
  %2938 = load i8, ptr %2937, align 1
  %2939 = zext i8 %2938 to i32
  %2940 = shl i32 %2939, 16
  %2941 = add i32 %2935, %2940
  %2942 = load ptr, ptr %65, align 8
  %2943 = getelementptr inbounds i8, ptr %2942, i64 11
  %2944 = load i8, ptr %2943, align 1
  %2945 = zext i8 %2944 to i32
  %2946 = shl i32 %2945, 24
  %2947 = add i32 %2941, %2946
  %2948 = load i32, ptr %61, align 4
  %2949 = add i32 %2948, %2947
  store i32 %2949, ptr %61, align 4
  br label %2950

2950:                                             ; preds = %2877
  %2951 = load i32, ptr %63, align 4
  %2952 = load i32, ptr %62, align 4
  %2953 = sub i32 %2952, %2951
  store i32 %2953, ptr %62, align 4
  %2954 = load i32, ptr %61, align 4
  %2955 = load i32, ptr %62, align 4
  %2956 = sub i32 %2955, %2954
  store i32 %2956, ptr %62, align 4
  %2957 = load i32, ptr %61, align 4
  %2958 = lshr i32 %2957, 13
  %2959 = load i32, ptr %62, align 4
  %2960 = xor i32 %2959, %2958
  store i32 %2960, ptr %62, align 4
  %2961 = load i32, ptr %61, align 4
  %2962 = load i32, ptr %63, align 4
  %2963 = sub i32 %2962, %2961
  store i32 %2963, ptr %63, align 4
  %2964 = load i32, ptr %62, align 4
  %2965 = load i32, ptr %63, align 4
  %2966 = sub i32 %2965, %2964
  store i32 %2966, ptr %63, align 4
  %2967 = load i32, ptr %62, align 4
  %2968 = shl i32 %2967, 8
  %2969 = load i32, ptr %63, align 4
  %2970 = xor i32 %2969, %2968
  store i32 %2970, ptr %63, align 4
  %2971 = load i32, ptr %62, align 4
  %2972 = load i32, ptr %61, align 4
  %2973 = sub i32 %2972, %2971
  store i32 %2973, ptr %61, align 4
  %2974 = load i32, ptr %63, align 4
  %2975 = load i32, ptr %61, align 4
  %2976 = sub i32 %2975, %2974
  store i32 %2976, ptr %61, align 4
  %2977 = load i32, ptr %63, align 4
  %2978 = lshr i32 %2977, 13
  %2979 = load i32, ptr %61, align 4
  %2980 = xor i32 %2979, %2978
  store i32 %2980, ptr %61, align 4
  %2981 = load i32, ptr %63, align 4
  %2982 = load i32, ptr %62, align 4
  %2983 = sub i32 %2982, %2981
  store i32 %2983, ptr %62, align 4
  %2984 = load i32, ptr %61, align 4
  %2985 = load i32, ptr %62, align 4
  %2986 = sub i32 %2985, %2984
  store i32 %2986, ptr %62, align 4
  %2987 = load i32, ptr %61, align 4
  %2988 = lshr i32 %2987, 12
  %2989 = load i32, ptr %62, align 4
  %2990 = xor i32 %2989, %2988
  store i32 %2990, ptr %62, align 4
  %2991 = load i32, ptr %61, align 4
  %2992 = load i32, ptr %63, align 4
  %2993 = sub i32 %2992, %2991
  store i32 %2993, ptr %63, align 4
  %2994 = load i32, ptr %62, align 4
  %2995 = load i32, ptr %63, align 4
  %2996 = sub i32 %2995, %2994
  store i32 %2996, ptr %63, align 4
  %2997 = load i32, ptr %62, align 4
  %2998 = shl i32 %2997, 16
  %2999 = load i32, ptr %63, align 4
  %3000 = xor i32 %2999, %2998
  store i32 %3000, ptr %63, align 4
  %3001 = load i32, ptr %62, align 4
  %3002 = load i32, ptr %61, align 4
  %3003 = sub i32 %3002, %3001
  store i32 %3003, ptr %61, align 4
  %3004 = load i32, ptr %63, align 4
  %3005 = load i32, ptr %61, align 4
  %3006 = sub i32 %3005, %3004
  store i32 %3006, ptr %61, align 4
  %3007 = load i32, ptr %63, align 4
  %3008 = lshr i32 %3007, 5
  %3009 = load i32, ptr %61, align 4
  %3010 = xor i32 %3009, %3008
  store i32 %3010, ptr %61, align 4
  %3011 = load i32, ptr %63, align 4
  %3012 = load i32, ptr %62, align 4
  %3013 = sub i32 %3012, %3011
  store i32 %3013, ptr %62, align 4
  %3014 = load i32, ptr %61, align 4
  %3015 = load i32, ptr %62, align 4
  %3016 = sub i32 %3015, %3014
  store i32 %3016, ptr %62, align 4
  %3017 = load i32, ptr %61, align 4
  %3018 = lshr i32 %3017, 3
  %3019 = load i32, ptr %62, align 4
  %3020 = xor i32 %3019, %3018
  store i32 %3020, ptr %62, align 4
  %3021 = load i32, ptr %61, align 4
  %3022 = load i32, ptr %63, align 4
  %3023 = sub i32 %3022, %3021
  store i32 %3023, ptr %63, align 4
  %3024 = load i32, ptr %62, align 4
  %3025 = load i32, ptr %63, align 4
  %3026 = sub i32 %3025, %3024
  store i32 %3026, ptr %63, align 4
  %3027 = load i32, ptr %62, align 4
  %3028 = shl i32 %3027, 10
  %3029 = load i32, ptr %63, align 4
  %3030 = xor i32 %3029, %3028
  store i32 %3030, ptr %63, align 4
  %3031 = load i32, ptr %62, align 4
  %3032 = load i32, ptr %61, align 4
  %3033 = sub i32 %3032, %3031
  store i32 %3033, ptr %61, align 4
  %3034 = load i32, ptr %63, align 4
  %3035 = load i32, ptr %61, align 4
  %3036 = sub i32 %3035, %3034
  store i32 %3036, ptr %61, align 4
  %3037 = load i32, ptr %63, align 4
  %3038 = lshr i32 %3037, 15
  %3039 = load i32, ptr %61, align 4
  %3040 = xor i32 %3039, %3038
  store i32 %3040, ptr %61, align 4
  br label %3041

3041:                                             ; preds = %2950
  %3042 = load ptr, ptr %65, align 8
  %3043 = getelementptr inbounds i8, ptr %3042, i64 12
  store ptr %3043, ptr %65, align 8
  %3044 = load i32, ptr %64, align 4
  %3045 = sub i32 %3044, 12
  store i32 %3045, ptr %64, align 4
  br label %2874, !llvm.loop !61

3046:                                             ; preds = %2874
  %3047 = load i32, ptr %60, align 4
  %3048 = load i32, ptr %61, align 4
  %3049 = add i32 %3048, %3047
  store i32 %3049, ptr %61, align 4
  %3050 = load i32, ptr %64, align 4
  switch i32 %3050, label %3137 [
    i32 11, label %3051
    i32 10, label %3059
    i32 9, label %3067
    i32 8, label %3075
    i32 7, label %3083
    i32 6, label %3091
    i32 5, label %3099
    i32 4, label %3106
    i32 3, label %3114
    i32 2, label %3122
    i32 1, label %3130
  ]

3051:                                             ; preds = %3046
  %3052 = load ptr, ptr %65, align 8
  %3053 = getelementptr inbounds i8, ptr %3052, i64 10
  %3054 = load i8, ptr %3053, align 1
  %3055 = zext i8 %3054 to i32
  %3056 = shl i32 %3055, 24
  %3057 = load i32, ptr %61, align 4
  %3058 = add i32 %3057, %3056
  store i32 %3058, ptr %61, align 4
  br label %3059

3059:                                             ; preds = %3046, %3051
  %3060 = load ptr, ptr %65, align 8
  %3061 = getelementptr inbounds i8, ptr %3060, i64 9
  %3062 = load i8, ptr %3061, align 1
  %3063 = zext i8 %3062 to i32
  %3064 = shl i32 %3063, 16
  %3065 = load i32, ptr %61, align 4
  %3066 = add i32 %3065, %3064
  store i32 %3066, ptr %61, align 4
  br label %3067

3067:                                             ; preds = %3046, %3059
  %3068 = load ptr, ptr %65, align 8
  %3069 = getelementptr inbounds i8, ptr %3068, i64 8
  %3070 = load i8, ptr %3069, align 1
  %3071 = zext i8 %3070 to i32
  %3072 = shl i32 %3071, 8
  %3073 = load i32, ptr %61, align 4
  %3074 = add i32 %3073, %3072
  store i32 %3074, ptr %61, align 4
  br label %3075

3075:                                             ; preds = %3046, %3067
  %3076 = load ptr, ptr %65, align 8
  %3077 = getelementptr inbounds i8, ptr %3076, i64 7
  %3078 = load i8, ptr %3077, align 1
  %3079 = zext i8 %3078 to i32
  %3080 = shl i32 %3079, 24
  %3081 = load i32, ptr %63, align 4
  %3082 = add i32 %3081, %3080
  store i32 %3082, ptr %63, align 4
  br label %3083

3083:                                             ; preds = %3046, %3075
  %3084 = load ptr, ptr %65, align 8
  %3085 = getelementptr inbounds i8, ptr %3084, i64 6
  %3086 = load i8, ptr %3085, align 1
  %3087 = zext i8 %3086 to i32
  %3088 = shl i32 %3087, 16
  %3089 = load i32, ptr %63, align 4
  %3090 = add i32 %3089, %3088
  store i32 %3090, ptr %63, align 4
  br label %3091

3091:                                             ; preds = %3046, %3083
  %3092 = load ptr, ptr %65, align 8
  %3093 = getelementptr inbounds i8, ptr %3092, i64 5
  %3094 = load i8, ptr %3093, align 1
  %3095 = zext i8 %3094 to i32
  %3096 = shl i32 %3095, 8
  %3097 = load i32, ptr %63, align 4
  %3098 = add i32 %3097, %3096
  store i32 %3098, ptr %63, align 4
  br label %3099

3099:                                             ; preds = %3046, %3091
  %3100 = load ptr, ptr %65, align 8
  %3101 = getelementptr inbounds i8, ptr %3100, i64 4
  %3102 = load i8, ptr %3101, align 1
  %3103 = zext i8 %3102 to i32
  %3104 = load i32, ptr %63, align 4
  %3105 = add i32 %3104, %3103
  store i32 %3105, ptr %63, align 4
  br label %3106

3106:                                             ; preds = %3046, %3099
  %3107 = load ptr, ptr %65, align 8
  %3108 = getelementptr inbounds i8, ptr %3107, i64 3
  %3109 = load i8, ptr %3108, align 1
  %3110 = zext i8 %3109 to i32
  %3111 = shl i32 %3110, 24
  %3112 = load i32, ptr %62, align 4
  %3113 = add i32 %3112, %3111
  store i32 %3113, ptr %62, align 4
  br label %3114

3114:                                             ; preds = %3046, %3106
  %3115 = load ptr, ptr %65, align 8
  %3116 = getelementptr inbounds i8, ptr %3115, i64 2
  %3117 = load i8, ptr %3116, align 1
  %3118 = zext i8 %3117 to i32
  %3119 = shl i32 %3118, 16
  %3120 = load i32, ptr %62, align 4
  %3121 = add i32 %3120, %3119
  store i32 %3121, ptr %62, align 4
  br label %3122

3122:                                             ; preds = %3046, %3114
  %3123 = load ptr, ptr %65, align 8
  %3124 = getelementptr inbounds i8, ptr %3123, i64 1
  %3125 = load i8, ptr %3124, align 1
  %3126 = zext i8 %3125 to i32
  %3127 = shl i32 %3126, 8
  %3128 = load i32, ptr %62, align 4
  %3129 = add i32 %3128, %3127
  store i32 %3129, ptr %62, align 4
  br label %3130

3130:                                             ; preds = %3046, %3122
  %3131 = load ptr, ptr %65, align 8
  %3132 = getelementptr inbounds i8, ptr %3131, i64 0
  %3133 = load i8, ptr %3132, align 1
  %3134 = zext i8 %3133 to i32
  %3135 = load i32, ptr %62, align 4
  %3136 = add i32 %3135, %3134
  store i32 %3136, ptr %62, align 4
  br label %3137

3137:                                             ; preds = %3046, %3130
  br label %3138

3138:                                             ; preds = %3137
  br label %3139

3139:                                             ; preds = %3138
  %3140 = load i32, ptr %63, align 4
  %3141 = load i32, ptr %62, align 4
  %3142 = sub i32 %3141, %3140
  store i32 %3142, ptr %62, align 4
  %3143 = load i32, ptr %61, align 4
  %3144 = load i32, ptr %62, align 4
  %3145 = sub i32 %3144, %3143
  store i32 %3145, ptr %62, align 4
  %3146 = load i32, ptr %61, align 4
  %3147 = lshr i32 %3146, 13
  %3148 = load i32, ptr %62, align 4
  %3149 = xor i32 %3148, %3147
  store i32 %3149, ptr %62, align 4
  %3150 = load i32, ptr %61, align 4
  %3151 = load i32, ptr %63, align 4
  %3152 = sub i32 %3151, %3150
  store i32 %3152, ptr %63, align 4
  %3153 = load i32, ptr %62, align 4
  %3154 = load i32, ptr %63, align 4
  %3155 = sub i32 %3154, %3153
  store i32 %3155, ptr %63, align 4
  %3156 = load i32, ptr %62, align 4
  %3157 = shl i32 %3156, 8
  %3158 = load i32, ptr %63, align 4
  %3159 = xor i32 %3158, %3157
  store i32 %3159, ptr %63, align 4
  %3160 = load i32, ptr %62, align 4
  %3161 = load i32, ptr %61, align 4
  %3162 = sub i32 %3161, %3160
  store i32 %3162, ptr %61, align 4
  %3163 = load i32, ptr %63, align 4
  %3164 = load i32, ptr %61, align 4
  %3165 = sub i32 %3164, %3163
  store i32 %3165, ptr %61, align 4
  %3166 = load i32, ptr %63, align 4
  %3167 = lshr i32 %3166, 13
  %3168 = load i32, ptr %61, align 4
  %3169 = xor i32 %3168, %3167
  store i32 %3169, ptr %61, align 4
  %3170 = load i32, ptr %63, align 4
  %3171 = load i32, ptr %62, align 4
  %3172 = sub i32 %3171, %3170
  store i32 %3172, ptr %62, align 4
  %3173 = load i32, ptr %61, align 4
  %3174 = load i32, ptr %62, align 4
  %3175 = sub i32 %3174, %3173
  store i32 %3175, ptr %62, align 4
  %3176 = load i32, ptr %61, align 4
  %3177 = lshr i32 %3176, 12
  %3178 = load i32, ptr %62, align 4
  %3179 = xor i32 %3178, %3177
  store i32 %3179, ptr %62, align 4
  %3180 = load i32, ptr %61, align 4
  %3181 = load i32, ptr %63, align 4
  %3182 = sub i32 %3181, %3180
  store i32 %3182, ptr %63, align 4
  %3183 = load i32, ptr %62, align 4
  %3184 = load i32, ptr %63, align 4
  %3185 = sub i32 %3184, %3183
  store i32 %3185, ptr %63, align 4
  %3186 = load i32, ptr %62, align 4
  %3187 = shl i32 %3186, 16
  %3188 = load i32, ptr %63, align 4
  %3189 = xor i32 %3188, %3187
  store i32 %3189, ptr %63, align 4
  %3190 = load i32, ptr %62, align 4
  %3191 = load i32, ptr %61, align 4
  %3192 = sub i32 %3191, %3190
  store i32 %3192, ptr %61, align 4
  %3193 = load i32, ptr %63, align 4
  %3194 = load i32, ptr %61, align 4
  %3195 = sub i32 %3194, %3193
  store i32 %3195, ptr %61, align 4
  %3196 = load i32, ptr %63, align 4
  %3197 = lshr i32 %3196, 5
  %3198 = load i32, ptr %61, align 4
  %3199 = xor i32 %3198, %3197
  store i32 %3199, ptr %61, align 4
  %3200 = load i32, ptr %63, align 4
  %3201 = load i32, ptr %62, align 4
  %3202 = sub i32 %3201, %3200
  store i32 %3202, ptr %62, align 4
  %3203 = load i32, ptr %61, align 4
  %3204 = load i32, ptr %62, align 4
  %3205 = sub i32 %3204, %3203
  store i32 %3205, ptr %62, align 4
  %3206 = load i32, ptr %61, align 4
  %3207 = lshr i32 %3206, 3
  %3208 = load i32, ptr %62, align 4
  %3209 = xor i32 %3208, %3207
  store i32 %3209, ptr %62, align 4
  %3210 = load i32, ptr %61, align 4
  %3211 = load i32, ptr %63, align 4
  %3212 = sub i32 %3211, %3210
  store i32 %3212, ptr %63, align 4
  %3213 = load i32, ptr %62, align 4
  %3214 = load i32, ptr %63, align 4
  %3215 = sub i32 %3214, %3213
  store i32 %3215, ptr %63, align 4
  %3216 = load i32, ptr %62, align 4
  %3217 = shl i32 %3216, 10
  %3218 = load i32, ptr %63, align 4
  %3219 = xor i32 %3218, %3217
  store i32 %3219, ptr %63, align 4
  %3220 = load i32, ptr %62, align 4
  %3221 = load i32, ptr %61, align 4
  %3222 = sub i32 %3221, %3220
  store i32 %3222, ptr %61, align 4
  %3223 = load i32, ptr %63, align 4
  %3224 = load i32, ptr %61, align 4
  %3225 = sub i32 %3224, %3223
  store i32 %3225, ptr %61, align 4
  %3226 = load i32, ptr %63, align 4
  %3227 = lshr i32 %3226, 15
  %3228 = load i32, ptr %61, align 4
  %3229 = xor i32 %3228, %3227
  store i32 %3229, ptr %61, align 4
  br label %3230

3230:                                             ; preds = %3139
  br label %3231

3231:                                             ; preds = %3230
  br label %3232

3232:                                             ; preds = %3231
  br label %3233

3233:                                             ; preds = %3232
  store ptr null, ptr %59, align 8
  %3234 = load ptr, ptr %6, align 8
  %3235 = icmp ne ptr %3234, null
  br i1 %3235, label %3236, label %3339

3236:                                             ; preds = %3233
  br label %3237

3237:                                             ; preds = %3236
  %3238 = load i32, ptr %61, align 4
  %3239 = load ptr, ptr %6, align 8
  %3240 = getelementptr inbounds nuw %struct.DictEntry, ptr %3239, i32 0, i32 2
  %3241 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3240, i32 0, i32 0
  %3242 = load ptr, ptr %3241, align 8
  %3243 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3242, i32 0, i32 1
  %3244 = load i32, ptr %3243, align 8
  %3245 = sub i32 %3244, 1
  %3246 = and i32 %3238, %3245
  store i32 %3246, ptr %66, align 4
  br label %3247

3247:                                             ; preds = %3237
  br label %3248

3248:                                             ; preds = %3247
  %3249 = load ptr, ptr %6, align 8
  %3250 = getelementptr inbounds nuw %struct.DictEntry, ptr %3249, i32 0, i32 2
  %3251 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3250, i32 0, i32 0
  %3252 = load ptr, ptr %3251, align 8
  %3253 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3252, i32 0, i32 0
  %3254 = load ptr, ptr %3253, align 8
  %3255 = load i32, ptr %66, align 4
  %3256 = zext i32 %3255 to i64
  %3257 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3254, i64 %3256
  %3258 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3257, i32 0, i32 0
  %3259 = load ptr, ptr %3258, align 8
  %3260 = icmp ne ptr %3259, null
  br i1 %3260, label %3261, label %3283

3261:                                             ; preds = %3248
  br label %3262

3262:                                             ; preds = %3261
  %3263 = load ptr, ptr %6, align 8
  %3264 = getelementptr inbounds nuw %struct.DictEntry, ptr %3263, i32 0, i32 2
  %3265 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3264, i32 0, i32 0
  %3266 = load ptr, ptr %3265, align 8
  %3267 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3266, i32 0, i32 0
  %3268 = load ptr, ptr %3267, align 8
  %3269 = load i32, ptr %66, align 4
  %3270 = zext i32 %3269 to i64
  %3271 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3268, i64 %3270
  %3272 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3271, i32 0, i32 0
  %3273 = load ptr, ptr %3272, align 8
  %3274 = load ptr, ptr %6, align 8
  %3275 = getelementptr inbounds nuw %struct.DictEntry, ptr %3274, i32 0, i32 2
  %3276 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3275, i32 0, i32 0
  %3277 = load ptr, ptr %3276, align 8
  %3278 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3277, i32 0, i32 5
  %3279 = load i64, ptr %3278, align 8
  %3280 = sub i64 0, %3279
  %3281 = getelementptr inbounds i8, ptr %3273, i64 %3280
  store ptr %3281, ptr %59, align 8
  br label %3282

3282:                                             ; preds = %3262
  br label %3284

3283:                                             ; preds = %3248
  store ptr null, ptr %59, align 8
  br label %3284

3284:                                             ; preds = %3283, %3282
  br label %3285

3285:                                             ; preds = %3336, %3284
  %3286 = load ptr, ptr %59, align 8
  %3287 = icmp ne ptr %3286, null
  br i1 %3287, label %3288, label %3337

3288:                                             ; preds = %3285
  %3289 = load ptr, ptr %59, align 8
  %3290 = getelementptr inbounds nuw %struct.DictEntry, ptr %3289, i32 0, i32 2
  %3291 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3290, i32 0, i32 7
  %3292 = load i32, ptr %3291, align 4
  %3293 = load i32, ptr %61, align 4
  %3294 = icmp eq i32 %3292, %3293
  br i1 %3294, label %3295, label %3314

3295:                                             ; preds = %3288
  %3296 = load ptr, ptr %59, align 8
  %3297 = getelementptr inbounds nuw %struct.DictEntry, ptr %3296, i32 0, i32 2
  %3298 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3297, i32 0, i32 6
  %3299 = load i32, ptr %3298, align 8
  %3300 = load i32, ptr %60, align 4
  %3301 = icmp eq i32 %3299, %3300
  br i1 %3301, label %3302, label %3314

3302:                                             ; preds = %3295
  %3303 = load ptr, ptr %59, align 8
  %3304 = getelementptr inbounds nuw %struct.DictEntry, ptr %3303, i32 0, i32 2
  %3305 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3304, i32 0, i32 5
  %3306 = load ptr, ptr %3305, align 8
  %3307 = load ptr, ptr %24, align 8
  %3308 = load i32, ptr %60, align 4
  %3309 = zext i32 %3308 to i64
  %3310 = call i32 @memcmp(ptr noundef %3306, ptr noundef %3307, i64 noundef %3309)
  %3311 = icmp eq i32 %3310, 0
  br i1 %3311, label %3312, label %3313

3312:                                             ; preds = %3302
  br label %3337

3313:                                             ; preds = %3302
  br label %3314

3314:                                             ; preds = %3313, %3295, %3288
  %3315 = load ptr, ptr %59, align 8
  %3316 = getelementptr inbounds nuw %struct.DictEntry, ptr %3315, i32 0, i32 2
  %3317 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3316, i32 0, i32 4
  %3318 = load ptr, ptr %3317, align 8
  %3319 = icmp ne ptr %3318, null
  br i1 %3319, label %3320, label %3335

3320:                                             ; preds = %3314
  br label %3321

3321:                                             ; preds = %3320
  %3322 = load ptr, ptr %59, align 8
  %3323 = getelementptr inbounds nuw %struct.DictEntry, ptr %3322, i32 0, i32 2
  %3324 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3323, i32 0, i32 4
  %3325 = load ptr, ptr %3324, align 8
  %3326 = load ptr, ptr %6, align 8
  %3327 = getelementptr inbounds nuw %struct.DictEntry, ptr %3326, i32 0, i32 2
  %3328 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3327, i32 0, i32 0
  %3329 = load ptr, ptr %3328, align 8
  %3330 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3329, i32 0, i32 5
  %3331 = load i64, ptr %3330, align 8
  %3332 = sub i64 0, %3331
  %3333 = getelementptr inbounds i8, ptr %3325, i64 %3332
  store ptr %3333, ptr %59, align 8
  br label %3334

3334:                                             ; preds = %3321
  br label %3336

3335:                                             ; preds = %3314
  store ptr null, ptr %59, align 8
  br label %3336

3336:                                             ; preds = %3335, %3334
  br label %3285, !llvm.loop !62

3337:                                             ; preds = %3312, %3285
  br label %3338

3338:                                             ; preds = %3337
  br label %3339

3339:                                             ; preds = %3338, %3233
  br label %3340

3340:                                             ; preds = %3339
  br label %3341

3341:                                             ; preds = %3340, %2866
  br label %3342

3342:                                             ; preds = %3341
  br label %3343

3343:                                             ; preds = %3342
  %3344 = load ptr, ptr %59, align 8
  %3345 = getelementptr inbounds nuw %struct.DictEntry, ptr %3344, i32 0, i32 1
  %3346 = load i32, ptr %3345, align 8
  store i32 %3346, ptr %67, align 4
  %3347 = load i32, ptr %67, align 4
  %3348 = ashr i32 %3347, 8
  %3349 = and i32 %3348, 255
  %3350 = trunc i32 %3349 to i8
  %3351 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  %3352 = load ptr, ptr %3351, align 8
  %3353 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  %3354 = load i64, ptr %3353, align 8
  %3355 = add i64 %3354, 1
  store i64 %3355, ptr %3353, align 8
  %3356 = getelementptr inbounds nuw i8, ptr %3352, i64 %3354
  store i8 %3350, ptr %3356, align 1
  %3357 = load i32, ptr %67, align 4
  %3358 = and i32 %3357, 255
  %3359 = trunc i32 %3358 to i8
  %3360 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 0
  %3361 = load ptr, ptr %3360, align 8
  %3362 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 1
  %3363 = load i64, ptr %3362, align 8
  %3364 = add i64 %3363, 1
  store i64 %3364, ptr %3362, align 8
  %3365 = getelementptr inbounds nuw i8, ptr %3361, i64 %3363
  store i8 %3359, ptr %3365, align 1
  %3366 = load i32, ptr %23, align 4
  %3367 = getelementptr inbounds nuw %struct.LZWResult, ptr %0, i32 0, i32 2
  store i32 %3366, ptr %3367, align 8
  %3368 = load ptr, ptr %24, align 8
  call void @free(ptr noundef %3368)
  %3369 = load ptr, ptr %6, align 8
  store ptr %3369, ptr %68, align 8
  %3370 = load ptr, ptr %6, align 8
  %3371 = icmp ne ptr %3370, null
  br i1 %3371, label %3372, label %3377

3372:                                             ; preds = %3343
  %3373 = load ptr, ptr %6, align 8
  %3374 = getelementptr inbounds nuw %struct.DictEntry, ptr %3373, i32 0, i32 2
  %3375 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3374, i32 0, i32 2
  %3376 = load ptr, ptr %3375, align 8
  br label %3378

3377:                                             ; preds = %3343
  br label %3378

3378:                                             ; preds = %3377, %3372
  %3379 = phi ptr [ %3376, %3372 ], [ null, %3377 ]
  store ptr %3379, ptr %69, align 8
  br label %3380

3380:                                             ; preds = %3568, %3378
  %3381 = load ptr, ptr %68, align 8
  %3382 = icmp ne ptr %3381, null
  br i1 %3382, label %3383, label %3570

3383:                                             ; preds = %3380
  br label %3384

3384:                                             ; preds = %3383
  %3385 = load ptr, ptr %68, align 8
  %3386 = getelementptr inbounds nuw %struct.DictEntry, ptr %3385, i32 0, i32 2
  store ptr %3386, ptr %70, align 8
  %3387 = load ptr, ptr %70, align 8
  %3388 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3387, i32 0, i32 1
  %3389 = load ptr, ptr %3388, align 8
  %3390 = icmp eq ptr %3389, null
  br i1 %3390, label %3391, label %3407

3391:                                             ; preds = %3384
  %3392 = load ptr, ptr %70, align 8
  %3393 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3392, i32 0, i32 2
  %3394 = load ptr, ptr %3393, align 8
  %3395 = icmp eq ptr %3394, null
  br i1 %3395, label %3396, label %3407

3396:                                             ; preds = %3391
  %3397 = load ptr, ptr %6, align 8
  %3398 = getelementptr inbounds nuw %struct.DictEntry, ptr %3397, i32 0, i32 2
  %3399 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3398, i32 0, i32 0
  %3400 = load ptr, ptr %3399, align 8
  %3401 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3400, i32 0, i32 0
  %3402 = load ptr, ptr %3401, align 8
  call void @free(ptr noundef %3402)
  %3403 = load ptr, ptr %6, align 8
  %3404 = getelementptr inbounds nuw %struct.DictEntry, ptr %3403, i32 0, i32 2
  %3405 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3404, i32 0, i32 0
  %3406 = load ptr, ptr %3405, align 8
  call void @free(ptr noundef %3406)
  store ptr null, ptr %6, align 8
  br label %3552

3407:                                             ; preds = %3391, %3384
  %3408 = load ptr, ptr %70, align 8
  %3409 = load ptr, ptr %6, align 8
  %3410 = getelementptr inbounds nuw %struct.DictEntry, ptr %3409, i32 0, i32 2
  %3411 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3410, i32 0, i32 0
  %3412 = load ptr, ptr %3411, align 8
  %3413 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3412, i32 0, i32 4
  %3414 = load ptr, ptr %3413, align 8
  %3415 = icmp eq ptr %3408, %3414
  br i1 %3415, label %3416, label %3432

3416:                                             ; preds = %3407
  %3417 = load ptr, ptr %70, align 8
  %3418 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3417, i32 0, i32 1
  %3419 = load ptr, ptr %3418, align 8
  %3420 = load ptr, ptr %6, align 8
  %3421 = getelementptr inbounds nuw %struct.DictEntry, ptr %3420, i32 0, i32 2
  %3422 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3421, i32 0, i32 0
  %3423 = load ptr, ptr %3422, align 8
  %3424 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3423, i32 0, i32 5
  %3425 = load i64, ptr %3424, align 8
  %3426 = getelementptr inbounds i8, ptr %3419, i64 %3425
  %3427 = load ptr, ptr %6, align 8
  %3428 = getelementptr inbounds nuw %struct.DictEntry, ptr %3427, i32 0, i32 2
  %3429 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3428, i32 0, i32 0
  %3430 = load ptr, ptr %3429, align 8
  %3431 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3430, i32 0, i32 4
  store ptr %3426, ptr %3431, align 8
  br label %3432

3432:                                             ; preds = %3416, %3407
  %3433 = load ptr, ptr %70, align 8
  %3434 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3433, i32 0, i32 1
  %3435 = load ptr, ptr %3434, align 8
  %3436 = icmp ne ptr %3435, null
  br i1 %3436, label %3437, label %3452

3437:                                             ; preds = %3432
  %3438 = load ptr, ptr %70, align 8
  %3439 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3438, i32 0, i32 2
  %3440 = load ptr, ptr %3439, align 8
  %3441 = load ptr, ptr %70, align 8
  %3442 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3441, i32 0, i32 1
  %3443 = load ptr, ptr %3442, align 8
  %3444 = load ptr, ptr %6, align 8
  %3445 = getelementptr inbounds nuw %struct.DictEntry, ptr %3444, i32 0, i32 2
  %3446 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3445, i32 0, i32 0
  %3447 = load ptr, ptr %3446, align 8
  %3448 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3447, i32 0, i32 5
  %3449 = load i64, ptr %3448, align 8
  %3450 = getelementptr inbounds i8, ptr %3443, i64 %3449
  %3451 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3450, i32 0, i32 2
  store ptr %3440, ptr %3451, align 8
  br label %3458

3452:                                             ; preds = %3432
  br label %3453

3453:                                             ; preds = %3452
  %3454 = load ptr, ptr %70, align 8
  %3455 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3454, i32 0, i32 2
  %3456 = load ptr, ptr %3455, align 8
  store ptr %3456, ptr %6, align 8
  br label %3457

3457:                                             ; preds = %3453
  br label %3458

3458:                                             ; preds = %3457, %3437
  %3459 = load ptr, ptr %70, align 8
  %3460 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3459, i32 0, i32 2
  %3461 = load ptr, ptr %3460, align 8
  %3462 = icmp ne ptr %3461, null
  br i1 %3462, label %3463, label %3478

3463:                                             ; preds = %3458
  %3464 = load ptr, ptr %70, align 8
  %3465 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3464, i32 0, i32 1
  %3466 = load ptr, ptr %3465, align 8
  %3467 = load ptr, ptr %70, align 8
  %3468 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3467, i32 0, i32 2
  %3469 = load ptr, ptr %3468, align 8
  %3470 = load ptr, ptr %6, align 8
  %3471 = getelementptr inbounds nuw %struct.DictEntry, ptr %3470, i32 0, i32 2
  %3472 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3471, i32 0, i32 0
  %3473 = load ptr, ptr %3472, align 8
  %3474 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3473, i32 0, i32 5
  %3475 = load i64, ptr %3474, align 8
  %3476 = getelementptr inbounds i8, ptr %3469, i64 %3475
  %3477 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3476, i32 0, i32 1
  store ptr %3466, ptr %3477, align 8
  br label %3478

3478:                                             ; preds = %3463, %3458
  br label %3479

3479:                                             ; preds = %3478
  %3480 = load ptr, ptr %70, align 8
  %3481 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3480, i32 0, i32 7
  %3482 = load i32, ptr %3481, align 4
  %3483 = load ptr, ptr %6, align 8
  %3484 = getelementptr inbounds nuw %struct.DictEntry, ptr %3483, i32 0, i32 2
  %3485 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3484, i32 0, i32 0
  %3486 = load ptr, ptr %3485, align 8
  %3487 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3486, i32 0, i32 1
  %3488 = load i32, ptr %3487, align 8
  %3489 = sub i32 %3488, 1
  %3490 = and i32 %3482, %3489
  store i32 %3490, ptr %71, align 4
  br label %3491

3491:                                             ; preds = %3479
  br label %3492

3492:                                             ; preds = %3491
  %3493 = load ptr, ptr %6, align 8
  %3494 = getelementptr inbounds nuw %struct.DictEntry, ptr %3493, i32 0, i32 2
  %3495 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3494, i32 0, i32 0
  %3496 = load ptr, ptr %3495, align 8
  %3497 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3496, i32 0, i32 0
  %3498 = load ptr, ptr %3497, align 8
  %3499 = load i32, ptr %71, align 4
  %3500 = zext i32 %3499 to i64
  %3501 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3498, i64 %3500
  store ptr %3501, ptr %72, align 8
  %3502 = load ptr, ptr %72, align 8
  %3503 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3502, i32 0, i32 1
  %3504 = load i32, ptr %3503, align 8
  %3505 = add i32 %3504, -1
  store i32 %3505, ptr %3503, align 8
  %3506 = load ptr, ptr %72, align 8
  %3507 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3506, i32 0, i32 0
  %3508 = load ptr, ptr %3507, align 8
  %3509 = load ptr, ptr %70, align 8
  %3510 = icmp eq ptr %3508, %3509
  br i1 %3510, label %3511, label %3517

3511:                                             ; preds = %3492
  %3512 = load ptr, ptr %70, align 8
  %3513 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3512, i32 0, i32 4
  %3514 = load ptr, ptr %3513, align 8
  %3515 = load ptr, ptr %72, align 8
  %3516 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %3515, i32 0, i32 0
  store ptr %3514, ptr %3516, align 8
  br label %3517

3517:                                             ; preds = %3511, %3492
  %3518 = load ptr, ptr %70, align 8
  %3519 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3518, i32 0, i32 3
  %3520 = load ptr, ptr %3519, align 8
  %3521 = icmp ne ptr %3520, null
  br i1 %3521, label %3522, label %3530

3522:                                             ; preds = %3517
  %3523 = load ptr, ptr %70, align 8
  %3524 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3523, i32 0, i32 4
  %3525 = load ptr, ptr %3524, align 8
  %3526 = load ptr, ptr %70, align 8
  %3527 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3526, i32 0, i32 3
  %3528 = load ptr, ptr %3527, align 8
  %3529 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3528, i32 0, i32 4
  store ptr %3525, ptr %3529, align 8
  br label %3530

3530:                                             ; preds = %3522, %3517
  %3531 = load ptr, ptr %70, align 8
  %3532 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3531, i32 0, i32 4
  %3533 = load ptr, ptr %3532, align 8
  %3534 = icmp ne ptr %3533, null
  br i1 %3534, label %3535, label %3543

3535:                                             ; preds = %3530
  %3536 = load ptr, ptr %70, align 8
  %3537 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3536, i32 0, i32 3
  %3538 = load ptr, ptr %3537, align 8
  %3539 = load ptr, ptr %70, align 8
  %3540 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3539, i32 0, i32 4
  %3541 = load ptr, ptr %3540, align 8
  %3542 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3541, i32 0, i32 3
  store ptr %3538, ptr %3542, align 8
  br label %3543

3543:                                             ; preds = %3535, %3530
  br label %3544

3544:                                             ; preds = %3543
  %3545 = load ptr, ptr %6, align 8
  %3546 = getelementptr inbounds nuw %struct.DictEntry, ptr %3545, i32 0, i32 2
  %3547 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3546, i32 0, i32 0
  %3548 = load ptr, ptr %3547, align 8
  %3549 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %3548, i32 0, i32 3
  %3550 = load i32, ptr %3549, align 8
  %3551 = add i32 %3550, -1
  store i32 %3551, ptr %3549, align 8
  br label %3552

3552:                                             ; preds = %3544, %3396
  br label %3553

3553:                                             ; preds = %3552
  %3554 = load ptr, ptr %68, align 8
  %3555 = getelementptr inbounds nuw %struct.DictEntry, ptr %3554, i32 0, i32 0
  %3556 = load ptr, ptr %3555, align 8
  call void @free(ptr noundef %3556)
  %3557 = load ptr, ptr %68, align 8
  call void @free(ptr noundef %3557)
  br label %3558

3558:                                             ; preds = %3553
  %3559 = load ptr, ptr %69, align 8
  store ptr %3559, ptr %68, align 8
  %3560 = load ptr, ptr %69, align 8
  %3561 = icmp ne ptr %3560, null
  br i1 %3561, label %3562, label %3567

3562:                                             ; preds = %3558
  %3563 = load ptr, ptr %69, align 8
  %3564 = getelementptr inbounds nuw %struct.DictEntry, ptr %3563, i32 0, i32 2
  %3565 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %3564, i32 0, i32 2
  %3566 = load ptr, ptr %3565, align 8
  br label %3568

3567:                                             ; preds = %3558
  br label %3568

3568:                                             ; preds = %3567, %3562
  %3569 = phi ptr [ %3566, %3562 ], [ null, %3567 ]
  store ptr %3569, ptr %69, align 8
  br label %3380, !llvm.loop !63

3570:                                             ; preds = %3380
  br label %3571

3571:                                             ; preds = %3570, %76
  ret void
}

declare void @exit(i32 noundef)

declare ptr @strcpy(ptr noundef, ptr noundef)

declare ptr @strcat(ptr noundef, ptr noundef)

define internal ptr @lzw_decode(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i16, align 2
  %18 = alloca i16, align 2
  %19 = alloca i32, align 4
  %20 = alloca i64, align 8
  %21 = alloca ptr, align 8
  %22 = alloca i64, align 8
  %23 = alloca i64, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca i64, align 8
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca i64, align 8
  %32 = alloca ptr, align 8
  %33 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = icmp ne ptr %34, null
  br i1 %35, label %36, label %41

36:                                               ; preds = %2
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.LZWResult, ptr %37, i32 0, i32 1
  %39 = load i64, ptr %38, align 8
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %36, %2
  %42 = load ptr, ptr %5, align 8
  store i64 0, ptr %42, align 8
  store ptr null, ptr %3, align 8
  br label %421

43:                                               ; preds = %36
  store i64 4096, ptr %6, align 8
  %44 = load i64, ptr %6, align 8
  %45 = mul i64 %44, 8
  %46 = call noalias ptr @malloc(i64 noundef %45)
  store ptr %46, ptr %7, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %51, label %49

49:                                               ; preds = %43
  %50 = load ptr, ptr %5, align 8
  store i64 0, ptr %50, align 8
  store ptr null, ptr %3, align 8
  br label %421

51:                                               ; preds = %43
  store i64 256, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %52

52:                                               ; preds = %75, %51
  %53 = load i32, ptr %9, align 4
  %54 = icmp slt i32 %53, 256
  br i1 %54, label %55, label %78

55:                                               ; preds = %52
  %56 = call noalias ptr @malloc(i64 noundef 2)
  %57 = load ptr, ptr %7, align 8
  %58 = load i32, ptr %9, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds ptr, ptr %57, i64 %59
  store ptr %56, ptr %60, align 8
  %61 = load i32, ptr %9, align 4
  %62 = trunc i32 %61 to i8
  %63 = load ptr, ptr %7, align 8
  %64 = load i32, ptr %9, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds ptr, ptr %63, i64 %65
  %67 = load ptr, ptr %66, align 8
  %68 = getelementptr inbounds i8, ptr %67, i64 0
  store i8 %62, ptr %68, align 1
  %69 = load ptr, ptr %7, align 8
  %70 = load i32, ptr %9, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = getelementptr inbounds i8, ptr %73, i64 1
  store i8 0, ptr %74, align 1
  br label %75

75:                                               ; preds = %55
  %76 = load i32, ptr %9, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %9, align 4
  br label %52, !llvm.loop !64

78:                                               ; preds = %52
  %79 = load ptr, ptr %4, align 8
  %80 = getelementptr inbounds nuw %struct.LZWResult, ptr %79, i32 0, i32 1
  %81 = load i64, ptr %80, align 8
  %82 = mul i64 %81, 2
  store i64 %82, ptr %10, align 8
  %83 = load i64, ptr %10, align 8
  %84 = call noalias ptr @malloc(i64 noundef %83)
  store ptr %84, ptr %11, align 8
  %85 = load ptr, ptr %11, align 8
  %86 = icmp ne ptr %85, null
  br i1 %86, label %103, label %87

87:                                               ; preds = %78
  store i64 0, ptr %12, align 8
  br label %88

88:                                               ; preds = %97, %87
  %89 = load i64, ptr %12, align 8
  %90 = load i64, ptr %8, align 8
  %91 = icmp ult i64 %89, %90
  br i1 %91, label %92, label %100

92:                                               ; preds = %88
  %93 = load ptr, ptr %7, align 8
  %94 = load i64, ptr %12, align 8
  %95 = getelementptr inbounds nuw ptr, ptr %93, i64 %94
  %96 = load ptr, ptr %95, align 8
  call void @free(ptr noundef %96)
  br label %97

97:                                               ; preds = %92
  %98 = load i64, ptr %12, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr %12, align 8
  br label %88, !llvm.loop !65

100:                                              ; preds = %88
  %101 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %101)
  %102 = load ptr, ptr %5, align 8
  store i64 0, ptr %102, align 8
  store ptr null, ptr %3, align 8
  br label %421

103:                                              ; preds = %78
  store i64 0, ptr %13, align 8
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds nuw %struct.LZWResult, ptr %104, i32 0, i32 0
  %106 = load ptr, ptr %105, align 8
  store ptr %106, ptr %14, align 8
  store i64 0, ptr %15, align 8
  %107 = load i64, ptr %15, align 8
  %108 = add i64 %107, 1
  %109 = load ptr, ptr %4, align 8
  %110 = getelementptr inbounds nuw %struct.LZWResult, ptr %109, i32 0, i32 1
  %111 = load i64, ptr %110, align 8
  %112 = icmp uge i64 %108, %111
  br i1 %112, label %113, label %130

113:                                              ; preds = %103
  %114 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %114)
  store i64 0, ptr %16, align 8
  br label %115

115:                                              ; preds = %124, %113
  %116 = load i64, ptr %16, align 8
  %117 = load i64, ptr %8, align 8
  %118 = icmp ult i64 %116, %117
  br i1 %118, label %119, label %127

119:                                              ; preds = %115
  %120 = load ptr, ptr %7, align 8
  %121 = load i64, ptr %16, align 8
  %122 = getelementptr inbounds nuw ptr, ptr %120, i64 %121
  %123 = load ptr, ptr %122, align 8
  call void @free(ptr noundef %123)
  br label %124

124:                                              ; preds = %119
  %125 = load i64, ptr %16, align 8
  %126 = add i64 %125, 1
  store i64 %126, ptr %16, align 8
  br label %115, !llvm.loop !66

127:                                              ; preds = %115
  %128 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %128)
  %129 = load ptr, ptr %5, align 8
  store i64 0, ptr %129, align 8
  store ptr null, ptr %3, align 8
  br label %421

130:                                              ; preds = %103
  %131 = load ptr, ptr %14, align 8
  %132 = load i64, ptr %15, align 8
  %133 = getelementptr inbounds nuw i8, ptr %131, i64 %132
  %134 = load i8, ptr %133, align 1
  %135 = zext i8 %134 to i16
  store i16 %135, ptr %17, align 2
  %136 = load ptr, ptr %14, align 8
  %137 = load i64, ptr %15, align 8
  %138 = add i64 %137, 1
  %139 = getelementptr inbounds nuw i8, ptr %136, i64 %138
  %140 = load i8, ptr %139, align 1
  %141 = zext i8 %140 to i16
  store i16 %141, ptr %18, align 2
  %142 = load i16, ptr %17, align 2
  %143 = zext i16 %142 to i32
  %144 = shl i32 %143, 8
  %145 = load i16, ptr %18, align 2
  %146 = zext i16 %145 to i32
  %147 = or i32 %144, %146
  store i32 %147, ptr %19, align 4
  %148 = load i64, ptr %15, align 8
  %149 = add i64 %148, 2
  store i64 %149, ptr %15, align 8
  %150 = load i32, ptr %19, align 4
  %151 = icmp slt i32 %150, 0
  br i1 %151, label %157, label %152

152:                                              ; preds = %130
  %153 = load i32, ptr %19, align 4
  %154 = load i64, ptr %8, align 8
  %155 = trunc i64 %154 to i32
  %156 = icmp sge i32 %153, %155
  br i1 %156, label %157, label %174

157:                                              ; preds = %152, %130
  %158 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %158)
  store i64 0, ptr %20, align 8
  br label %159

159:                                              ; preds = %168, %157
  %160 = load i64, ptr %20, align 8
  %161 = load i64, ptr %8, align 8
  %162 = icmp ult i64 %160, %161
  br i1 %162, label %163, label %171

163:                                              ; preds = %159
  %164 = load ptr, ptr %7, align 8
  %165 = load i64, ptr %20, align 8
  %166 = getelementptr inbounds nuw ptr, ptr %164, i64 %165
  %167 = load ptr, ptr %166, align 8
  call void @free(ptr noundef %167)
  br label %168

168:                                              ; preds = %163
  %169 = load i64, ptr %20, align 8
  %170 = add i64 %169, 1
  store i64 %170, ptr %20, align 8
  br label %159, !llvm.loop !67

171:                                              ; preds = %159
  %172 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %172)
  %173 = load ptr, ptr %5, align 8
  store i64 0, ptr %173, align 8
  store ptr null, ptr %3, align 8
  br label %421

174:                                              ; preds = %152
  %175 = load ptr, ptr %7, align 8
  %176 = load i32, ptr %19, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds ptr, ptr %175, i64 %177
  %179 = load ptr, ptr %178, align 8
  store ptr %179, ptr %21, align 8
  %180 = load ptr, ptr %21, align 8
  %181 = call i64 @strlen(ptr noundef %180)
  store i64 %181, ptr %22, align 8
  %182 = load i64, ptr %13, align 8
  %183 = load i64, ptr %22, align 8
  %184 = add i64 %182, %183
  %185 = load i64, ptr %10, align 8
  %186 = icmp uge i64 %184, %185
  br i1 %186, label %187, label %193

187:                                              ; preds = %174
  %188 = load i64, ptr %10, align 8
  %189 = mul i64 %188, 2
  store i64 %189, ptr %10, align 8
  %190 = load ptr, ptr %11, align 8
  %191 = load i64, ptr %10, align 8
  %192 = call ptr @realloc(ptr noundef %190, i64 noundef %191)
  store ptr %192, ptr %11, align 8
  br label %193

193:                                              ; preds = %187, %174
  store i64 0, ptr %23, align 8
  br label %194

194:                                              ; preds = %207, %193
  %195 = load i64, ptr %23, align 8
  %196 = load i64, ptr %22, align 8
  %197 = icmp ult i64 %195, %196
  br i1 %197, label %198, label %210

198:                                              ; preds = %194
  %199 = load ptr, ptr %21, align 8
  %200 = load i64, ptr %23, align 8
  %201 = getelementptr inbounds nuw i8, ptr %199, i64 %200
  %202 = load i8, ptr %201, align 1
  %203 = load ptr, ptr %11, align 8
  %204 = load i64, ptr %13, align 8
  %205 = add i64 %204, 1
  store i64 %205, ptr %13, align 8
  %206 = getelementptr inbounds nuw i8, ptr %203, i64 %204
  store i8 %202, ptr %206, align 1
  br label %207

207:                                              ; preds = %198
  %208 = load i64, ptr %23, align 8
  %209 = add i64 %208, 1
  store i64 %209, ptr %23, align 8
  br label %194, !llvm.loop !68

210:                                              ; preds = %194
  store i32 256, ptr %24, align 4
  br label %211

211:                                              ; preds = %399, %210
  %212 = load i64, ptr %15, align 8
  %213 = add i64 %212, 1
  %214 = load ptr, ptr %4, align 8
  %215 = getelementptr inbounds nuw %struct.LZWResult, ptr %214, i32 0, i32 1
  %216 = load i64, ptr %215, align 8
  %217 = icmp ult i64 %213, %216
  br i1 %217, label %218, label %403

218:                                              ; preds = %211
  %219 = load ptr, ptr %14, align 8
  %220 = load i64, ptr %15, align 8
  %221 = getelementptr inbounds nuw i8, ptr %219, i64 %220
  %222 = load i8, ptr %221, align 1
  %223 = zext i8 %222 to i16
  store i16 %223, ptr %17, align 2
  %224 = load ptr, ptr %14, align 8
  %225 = load i64, ptr %15, align 8
  %226 = add i64 %225, 1
  %227 = getelementptr inbounds nuw i8, ptr %224, i64 %226
  %228 = load i8, ptr %227, align 1
  %229 = zext i8 %228 to i16
  store i16 %229, ptr %18, align 2
  %230 = load i16, ptr %17, align 2
  %231 = zext i16 %230 to i32
  %232 = shl i32 %231, 8
  %233 = load i16, ptr %18, align 2
  %234 = zext i16 %233 to i32
  %235 = or i32 %232, %234
  store i32 %235, ptr %25, align 4
  %236 = load i64, ptr %15, align 8
  %237 = add i64 %236, 2
  store i64 %237, ptr %15, align 8
  %238 = load i32, ptr %25, align 4
  %239 = icmp sge i32 %238, 0
  br i1 %239, label %240, label %251

240:                                              ; preds = %218
  %241 = load i32, ptr %25, align 4
  %242 = load i64, ptr %8, align 8
  %243 = trunc i64 %242 to i32
  %244 = icmp slt i32 %241, %243
  br i1 %244, label %245, label %251

245:                                              ; preds = %240
  %246 = load ptr, ptr %7, align 8
  %247 = load i32, ptr %25, align 4
  %248 = sext i32 %247 to i64
  %249 = getelementptr inbounds ptr, ptr %246, i64 %248
  %250 = load ptr, ptr %249, align 8
  store ptr %250, ptr %26, align 8
  br label %304

251:                                              ; preds = %240, %218
  %252 = load i32, ptr %25, align 4
  %253 = load i32, ptr %24, align 4
  %254 = icmp eq i32 %252, %253
  br i1 %254, label %255, label %286

255:                                              ; preds = %251
  %256 = load ptr, ptr %7, align 8
  %257 = load i32, ptr %19, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds ptr, ptr %256, i64 %258
  %260 = load ptr, ptr %259, align 8
  %261 = call i64 @strlen(ptr noundef %260)
  store i64 %261, ptr %27, align 8
  %262 = load i64, ptr %27, align 8
  %263 = add i64 %262, 2
  %264 = call noalias ptr @malloc(i64 noundef %263)
  store ptr %264, ptr %26, align 8
  %265 = load ptr, ptr %26, align 8
  %266 = load ptr, ptr %7, align 8
  %267 = load i32, ptr %19, align 4
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds ptr, ptr %266, i64 %268
  %270 = load ptr, ptr %269, align 8
  %271 = call ptr @strcpy(ptr noundef %265, ptr noundef %270)
  %272 = load ptr, ptr %7, align 8
  %273 = load i32, ptr %19, align 4
  %274 = sext i32 %273 to i64
  %275 = getelementptr inbounds ptr, ptr %272, i64 %274
  %276 = load ptr, ptr %275, align 8
  %277 = getelementptr inbounds i8, ptr %276, i64 0
  %278 = load i8, ptr %277, align 1
  %279 = load ptr, ptr %26, align 8
  %280 = load i64, ptr %27, align 8
  %281 = getelementptr inbounds nuw i8, ptr %279, i64 %280
  store i8 %278, ptr %281, align 1
  %282 = load ptr, ptr %26, align 8
  %283 = load i64, ptr %27, align 8
  %284 = add i64 %283, 1
  %285 = getelementptr inbounds nuw i8, ptr %282, i64 %284
  store i8 0, ptr %285, align 1
  br label %303

286:                                              ; preds = %251
  %287 = load ptr, ptr %11, align 8
  call void @free(ptr noundef %287)
  store i64 0, ptr %28, align 8
  br label %288

288:                                              ; preds = %297, %286
  %289 = load i64, ptr %28, align 8
  %290 = load i64, ptr %8, align 8
  %291 = icmp ult i64 %289, %290
  br i1 %291, label %292, label %300

292:                                              ; preds = %288
  %293 = load ptr, ptr %7, align 8
  %294 = load i64, ptr %28, align 8
  %295 = getelementptr inbounds nuw ptr, ptr %293, i64 %294
  %296 = load ptr, ptr %295, align 8
  call void @free(ptr noundef %296)
  br label %297

297:                                              ; preds = %292
  %298 = load i64, ptr %28, align 8
  %299 = add i64 %298, 1
  store i64 %299, ptr %28, align 8
  br label %288, !llvm.loop !69

300:                                              ; preds = %288
  %301 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %301)
  %302 = load ptr, ptr %5, align 8
  store i64 0, ptr %302, align 8
  store ptr null, ptr %3, align 8
  br label %421

303:                                              ; preds = %255
  br label %304

304:                                              ; preds = %303, %245
  %305 = load ptr, ptr %26, align 8
  %306 = call i64 @strlen(ptr noundef %305)
  store i64 %306, ptr %29, align 8
  %307 = load i64, ptr %13, align 8
  %308 = load i64, ptr %29, align 8
  %309 = add i64 %307, %308
  %310 = load i64, ptr %10, align 8
  %311 = icmp uge i64 %309, %310
  br i1 %311, label %312, label %318

312:                                              ; preds = %304
  %313 = load i64, ptr %10, align 8
  %314 = mul i64 %313, 2
  store i64 %314, ptr %10, align 8
  %315 = load ptr, ptr %11, align 8
  %316 = load i64, ptr %10, align 8
  %317 = call ptr @realloc(ptr noundef %315, i64 noundef %316)
  store ptr %317, ptr %11, align 8
  br label %318

318:                                              ; preds = %312, %304
  store i64 0, ptr %30, align 8
  br label %319

319:                                              ; preds = %332, %318
  %320 = load i64, ptr %30, align 8
  %321 = load i64, ptr %29, align 8
  %322 = icmp ult i64 %320, %321
  br i1 %322, label %323, label %335

323:                                              ; preds = %319
  %324 = load ptr, ptr %26, align 8
  %325 = load i64, ptr %30, align 8
  %326 = getelementptr inbounds nuw i8, ptr %324, i64 %325
  %327 = load i8, ptr %326, align 1
  %328 = load ptr, ptr %11, align 8
  %329 = load i64, ptr %13, align 8
  %330 = add i64 %329, 1
  store i64 %330, ptr %13, align 8
  %331 = getelementptr inbounds nuw i8, ptr %328, i64 %329
  store i8 %327, ptr %331, align 1
  br label %332

332:                                              ; preds = %323
  %333 = load i64, ptr %30, align 8
  %334 = add i64 %333, 1
  store i64 %334, ptr %30, align 8
  br label %319, !llvm.loop !70

335:                                              ; preds = %319
  %336 = load i32, ptr %25, align 4
  %337 = load i32, ptr %24, align 4
  %338 = icmp eq i32 %336, %337
  br i1 %338, label %339, label %356

339:                                              ; preds = %335
  %340 = load i64, ptr %8, align 8
  %341 = load i64, ptr %6, align 8
  %342 = icmp uge i64 %340, %341
  br i1 %342, label %343, label %350

343:                                              ; preds = %339
  %344 = load i64, ptr %6, align 8
  %345 = mul i64 %344, 2
  store i64 %345, ptr %6, align 8
  %346 = load ptr, ptr %7, align 8
  %347 = load i64, ptr %6, align 8
  %348 = mul i64 %347, 8
  %349 = call ptr @realloc(ptr noundef %346, i64 noundef %348)
  store ptr %349, ptr %7, align 8
  br label %350

350:                                              ; preds = %343, %339
  %351 = load ptr, ptr %26, align 8
  %352 = load ptr, ptr %7, align 8
  %353 = load i64, ptr %8, align 8
  %354 = add i64 %353, 1
  store i64 %354, ptr %8, align 8
  %355 = getelementptr inbounds nuw ptr, ptr %352, i64 %353
  store ptr %351, ptr %355, align 8
  br label %399

356:                                              ; preds = %335
  %357 = load ptr, ptr %7, align 8
  %358 = load i32, ptr %19, align 4
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds ptr, ptr %357, i64 %359
  %361 = load ptr, ptr %360, align 8
  %362 = call i64 @strlen(ptr noundef %361)
  store i64 %362, ptr %31, align 8
  %363 = load i64, ptr %31, align 8
  %364 = add i64 %363, 2
  %365 = call noalias ptr @malloc(i64 noundef %364)
  store ptr %365, ptr %32, align 8
  %366 = load ptr, ptr %32, align 8
  %367 = load ptr, ptr %7, align 8
  %368 = load i32, ptr %19, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds ptr, ptr %367, i64 %369
  %371 = load ptr, ptr %370, align 8
  %372 = call ptr @strcpy(ptr noundef %366, ptr noundef %371)
  %373 = load ptr, ptr %26, align 8
  %374 = getelementptr inbounds i8, ptr %373, i64 0
  %375 = load i8, ptr %374, align 1
  %376 = load ptr, ptr %32, align 8
  %377 = load i64, ptr %31, align 8
  %378 = getelementptr inbounds nuw i8, ptr %376, i64 %377
  store i8 %375, ptr %378, align 1
  %379 = load ptr, ptr %32, align 8
  %380 = load i64, ptr %31, align 8
  %381 = add i64 %380, 1
  %382 = getelementptr inbounds nuw i8, ptr %379, i64 %381
  store i8 0, ptr %382, align 1
  %383 = load i64, ptr %8, align 8
  %384 = load i64, ptr %6, align 8
  %385 = icmp uge i64 %383, %384
  br i1 %385, label %386, label %393

386:                                              ; preds = %356
  %387 = load i64, ptr %6, align 8
  %388 = mul i64 %387, 2
  store i64 %388, ptr %6, align 8
  %389 = load ptr, ptr %7, align 8
  %390 = load i64, ptr %6, align 8
  %391 = mul i64 %390, 8
  %392 = call ptr @realloc(ptr noundef %389, i64 noundef %391)
  store ptr %392, ptr %7, align 8
  br label %393

393:                                              ; preds = %386, %356
  %394 = load ptr, ptr %32, align 8
  %395 = load ptr, ptr %7, align 8
  %396 = load i64, ptr %8, align 8
  %397 = add i64 %396, 1
  store i64 %397, ptr %8, align 8
  %398 = getelementptr inbounds nuw ptr, ptr %395, i64 %396
  store ptr %394, ptr %398, align 8
  br label %399

399:                                              ; preds = %393, %350
  %400 = load i32, ptr %24, align 4
  %401 = add nsw i32 %400, 1
  store i32 %401, ptr %24, align 4
  %402 = load i32, ptr %25, align 4
  store i32 %402, ptr %19, align 4
  br label %211, !llvm.loop !71

403:                                              ; preds = %211
  %404 = load i64, ptr %13, align 8
  %405 = load ptr, ptr %5, align 8
  store i64 %404, ptr %405, align 8
  store i64 0, ptr %33, align 8
  br label %406

406:                                              ; preds = %415, %403
  %407 = load i64, ptr %33, align 8
  %408 = load i64, ptr %8, align 8
  %409 = icmp ult i64 %407, %408
  br i1 %409, label %410, label %418

410:                                              ; preds = %406
  %411 = load ptr, ptr %7, align 8
  %412 = load i64, ptr %33, align 8
  %413 = getelementptr inbounds nuw ptr, ptr %411, i64 %412
  %414 = load ptr, ptr %413, align 8
  call void @free(ptr noundef %414)
  br label %415

415:                                              ; preds = %410
  %416 = load i64, ptr %33, align 8
  %417 = add i64 %416, 1
  store i64 %417, ptr %33, align 8
  br label %406, !llvm.loop !72

418:                                              ; preds = %406
  %419 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %419)
  %420 = load ptr, ptr %11, align 8
  store ptr %420, ptr %3, align 8
  br label %421

421:                                              ; preds = %418, %300, %171, %127, %100, %49, %41
  %422 = load ptr, ptr %3, align 8
  ret ptr %422
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
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
