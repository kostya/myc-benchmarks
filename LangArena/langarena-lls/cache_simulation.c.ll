; ModuleID = 'c/src/cache_simulation.c'
source_filename = "c/src/cache_simulation.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.CacheSimulationData = type { i32, i64, i64, i64, i64, ptr }
%struct.CacheSimulationCache = type { ptr, ptr, ptr, i64, i64, i64 }
%struct.CacheNode = type { ptr, ptr, i64, ptr, ptr, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [7 x i8] c"values\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"size\00", align 1
@.str.2 = private unnamed_addr constant [8 x i8] c"item_%u\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"updated_%d\00", align 1
@.str.4 = private unnamed_addr constant [7 x i8] c"new_%d\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Etc::CacheSimulation\00", align 1

define dso_local void @CacheSimulation_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %11, i32 0, i32 1
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %13, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = icmp sle i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %18, i32 0, i32 1
  store i64 2000, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %1
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.Benchmark, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = call i64 @Helper_config_i64(ptr noundef %23, ptr noundef @.str.1)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %25, i32 0, i32 2
  store i64 %24, ptr %26, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %27, i32 0, i32 2
  %29 = load i64, ptr %28, align 8
  %30 = icmp sle i64 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %20
  %32 = load ptr, ptr %3, align 8
  %33 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %32, i32 0, i32 2
  store i64 1000, ptr %33, align 8
  br label %34

34:                                               ; preds = %31, %20
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %35, i32 0, i32 0
  store i32 5432, ptr %36, align 8
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %37, i32 0, i32 3
  store i64 0, ptr %38, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %39, i32 0, i32 4
  store i64 0, ptr %40, align 8
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %41, i32 0, i32 2
  %43 = load i64, ptr %42, align 8
  %44 = call ptr @cache_simulation_cache_new(i64 noundef %43)
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %45, i32 0, i32 5
  store ptr %44, ptr %46, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @cache_simulation_cache_new(i64 noundef %0) {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 48)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %5, i32 0, i32 0
  store ptr null, ptr %6, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %7, i32 0, i32 1
  store ptr null, ptr %8, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %9, i32 0, i32 2
  store ptr null, ptr %10, align 8
  %11 = load i64, ptr %2, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %12, i32 0, i32 3
  store i64 %11, ptr %13, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %14, i32 0, i32 4
  store i64 0, ptr %15, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %16, i32 0, i32 5
  store i64 0, ptr %17, align 8
  %18 = load ptr, ptr %3, align 8
  ret ptr %18
}

define dso_local void @CacheSimulation_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [32 x i8], align 16
  %8 = alloca [32 x i8], align 16
  %9 = alloca [32 x i8], align 16
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %13

13:                                               ; preds = %57, %2
  %14 = load i32, ptr %6, align 4
  %15 = icmp slt i32 %14, 1000
  br i1 %15, label %16, label %60

16:                                               ; preds = %13
  %17 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %18, i32 0, i32 1
  %20 = load i64, ptr %19, align 8
  %21 = trunc i64 %20 to i32
  %22 = call i32 @Helper_next_int(i32 noundef %21)
  %23 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %17, i64 noundef 32, ptr noundef @.str.2, i32 noundef %22)
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %24, i32 0, i32 5
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0
  %28 = call ptr @cache_simulation_cache_get(ptr noundef %26, ptr noundef %27)
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %43

30:                                               ; preds = %16
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %31, i32 0, i32 3
  %33 = load i64, ptr %32, align 8
  %34 = add nsw i64 %33, 1
  store i64 %34, ptr %32, align 8
  %35 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %36 = load i32, ptr %4, align 4
  %37 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %35, i64 noundef 32, ptr noundef @.str.3, i32 noundef %36)
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %38, i32 0, i32 5
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0
  %42 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  call void @cache_simulation_cache_put(ptr noundef %40, ptr noundef %41, ptr noundef %42)
  br label %56

43:                                               ; preds = %16
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %44, i32 0, i32 4
  %46 = load i64, ptr %45, align 8
  %47 = add nsw i64 %46, 1
  store i64 %47, ptr %45, align 8
  %48 = getelementptr inbounds [32 x i8], ptr %9, i64 0, i64 0
  %49 = load i32, ptr %4, align 4
  %50 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %48, i64 noundef 32, ptr noundef @.str.4, i32 noundef %49)
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %51, i32 0, i32 5
  %53 = load ptr, ptr %52, align 8
  %54 = getelementptr inbounds [32 x i8], ptr %7, i64 0, i64 0
  %55 = getelementptr inbounds [32 x i8], ptr %9, i64 0, i64 0
  call void @cache_simulation_cache_put(ptr noundef %53, ptr noundef %54, ptr noundef %55)
  br label %56

56:                                               ; preds = %43, %30
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %6, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %6, align 4
  br label %13, !llvm.loop !6

60:                                               ; preds = %13
  ret void
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare i32 @Helper_next_int(i32 noundef)

define internal ptr @cache_simulation_cache_get(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr null, ptr %6, align 8
  br label %14

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = call i64 @strlen(ptr noundef %15)
  %17 = trunc i64 %16 to i32
  store i32 %17, ptr %7, align 4
  br label %18

18:                                               ; preds = %14
  store ptr null, ptr %6, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %507

23:                                               ; preds = %18
  br label %24

24:                                               ; preds = %23
  br label %25

25:                                               ; preds = %24
  %26 = load ptr, ptr %5, align 8
  store ptr %26, ptr %12, align 8
  store i32 -17973521, ptr %8, align 4
  store i32 -1640531527, ptr %10, align 4
  store i32 -1640531527, ptr %9, align 4
  %27 = load i32, ptr %7, align 4
  store i32 %27, ptr %11, align 4
  br label %28

28:                                               ; preds = %195, %25
  %29 = load i32, ptr %11, align 4
  %30 = icmp uge i32 %29, 12
  br i1 %30, label %31, label %200

31:                                               ; preds = %28
  %32 = load ptr, ptr %12, align 8
  %33 = getelementptr inbounds i8, ptr %32, i64 0
  %34 = load i8, ptr %33, align 1
  %35 = zext i8 %34 to i32
  %36 = load ptr, ptr %12, align 8
  %37 = getelementptr inbounds i8, ptr %36, i64 1
  %38 = load i8, ptr %37, align 1
  %39 = zext i8 %38 to i32
  %40 = shl i32 %39, 8
  %41 = add i32 %35, %40
  %42 = load ptr, ptr %12, align 8
  %43 = getelementptr inbounds i8, ptr %42, i64 2
  %44 = load i8, ptr %43, align 1
  %45 = zext i8 %44 to i32
  %46 = shl i32 %45, 16
  %47 = add i32 %41, %46
  %48 = load ptr, ptr %12, align 8
  %49 = getelementptr inbounds i8, ptr %48, i64 3
  %50 = load i8, ptr %49, align 1
  %51 = zext i8 %50 to i32
  %52 = shl i32 %51, 24
  %53 = add i32 %47, %52
  %54 = load i32, ptr %9, align 4
  %55 = add i32 %54, %53
  store i32 %55, ptr %9, align 4
  %56 = load ptr, ptr %12, align 8
  %57 = getelementptr inbounds i8, ptr %56, i64 4
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i32
  %60 = load ptr, ptr %12, align 8
  %61 = getelementptr inbounds i8, ptr %60, i64 5
  %62 = load i8, ptr %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl i32 %63, 8
  %65 = add i32 %59, %64
  %66 = load ptr, ptr %12, align 8
  %67 = getelementptr inbounds i8, ptr %66, i64 6
  %68 = load i8, ptr %67, align 1
  %69 = zext i8 %68 to i32
  %70 = shl i32 %69, 16
  %71 = add i32 %65, %70
  %72 = load ptr, ptr %12, align 8
  %73 = getelementptr inbounds i8, ptr %72, i64 7
  %74 = load i8, ptr %73, align 1
  %75 = zext i8 %74 to i32
  %76 = shl i32 %75, 24
  %77 = add i32 %71, %76
  %78 = load i32, ptr %10, align 4
  %79 = add i32 %78, %77
  store i32 %79, ptr %10, align 4
  %80 = load ptr, ptr %12, align 8
  %81 = getelementptr inbounds i8, ptr %80, i64 8
  %82 = load i8, ptr %81, align 1
  %83 = zext i8 %82 to i32
  %84 = load ptr, ptr %12, align 8
  %85 = getelementptr inbounds i8, ptr %84, i64 9
  %86 = load i8, ptr %85, align 1
  %87 = zext i8 %86 to i32
  %88 = shl i32 %87, 8
  %89 = add i32 %83, %88
  %90 = load ptr, ptr %12, align 8
  %91 = getelementptr inbounds i8, ptr %90, i64 10
  %92 = load i8, ptr %91, align 1
  %93 = zext i8 %92 to i32
  %94 = shl i32 %93, 16
  %95 = add i32 %89, %94
  %96 = load ptr, ptr %12, align 8
  %97 = getelementptr inbounds i8, ptr %96, i64 11
  %98 = load i8, ptr %97, align 1
  %99 = zext i8 %98 to i32
  %100 = shl i32 %99, 24
  %101 = add i32 %95, %100
  %102 = load i32, ptr %8, align 4
  %103 = add i32 %102, %101
  store i32 %103, ptr %8, align 4
  br label %104

104:                                              ; preds = %31
  %105 = load i32, ptr %10, align 4
  %106 = load i32, ptr %9, align 4
  %107 = sub i32 %106, %105
  store i32 %107, ptr %9, align 4
  %108 = load i32, ptr %8, align 4
  %109 = load i32, ptr %9, align 4
  %110 = sub i32 %109, %108
  store i32 %110, ptr %9, align 4
  %111 = load i32, ptr %8, align 4
  %112 = lshr i32 %111, 13
  %113 = load i32, ptr %9, align 4
  %114 = xor i32 %113, %112
  store i32 %114, ptr %9, align 4
  %115 = load i32, ptr %8, align 4
  %116 = load i32, ptr %10, align 4
  %117 = sub i32 %116, %115
  store i32 %117, ptr %10, align 4
  %118 = load i32, ptr %9, align 4
  %119 = load i32, ptr %10, align 4
  %120 = sub i32 %119, %118
  store i32 %120, ptr %10, align 4
  %121 = load i32, ptr %9, align 4
  %122 = shl i32 %121, 8
  %123 = load i32, ptr %10, align 4
  %124 = xor i32 %123, %122
  store i32 %124, ptr %10, align 4
  %125 = load i32, ptr %9, align 4
  %126 = load i32, ptr %8, align 4
  %127 = sub i32 %126, %125
  store i32 %127, ptr %8, align 4
  %128 = load i32, ptr %10, align 4
  %129 = load i32, ptr %8, align 4
  %130 = sub i32 %129, %128
  store i32 %130, ptr %8, align 4
  %131 = load i32, ptr %10, align 4
  %132 = lshr i32 %131, 13
  %133 = load i32, ptr %8, align 4
  %134 = xor i32 %133, %132
  store i32 %134, ptr %8, align 4
  %135 = load i32, ptr %10, align 4
  %136 = load i32, ptr %9, align 4
  %137 = sub i32 %136, %135
  store i32 %137, ptr %9, align 4
  %138 = load i32, ptr %8, align 4
  %139 = load i32, ptr %9, align 4
  %140 = sub i32 %139, %138
  store i32 %140, ptr %9, align 4
  %141 = load i32, ptr %8, align 4
  %142 = lshr i32 %141, 12
  %143 = load i32, ptr %9, align 4
  %144 = xor i32 %143, %142
  store i32 %144, ptr %9, align 4
  %145 = load i32, ptr %8, align 4
  %146 = load i32, ptr %10, align 4
  %147 = sub i32 %146, %145
  store i32 %147, ptr %10, align 4
  %148 = load i32, ptr %9, align 4
  %149 = load i32, ptr %10, align 4
  %150 = sub i32 %149, %148
  store i32 %150, ptr %10, align 4
  %151 = load i32, ptr %9, align 4
  %152 = shl i32 %151, 16
  %153 = load i32, ptr %10, align 4
  %154 = xor i32 %153, %152
  store i32 %154, ptr %10, align 4
  %155 = load i32, ptr %9, align 4
  %156 = load i32, ptr %8, align 4
  %157 = sub i32 %156, %155
  store i32 %157, ptr %8, align 4
  %158 = load i32, ptr %10, align 4
  %159 = load i32, ptr %8, align 4
  %160 = sub i32 %159, %158
  store i32 %160, ptr %8, align 4
  %161 = load i32, ptr %10, align 4
  %162 = lshr i32 %161, 5
  %163 = load i32, ptr %8, align 4
  %164 = xor i32 %163, %162
  store i32 %164, ptr %8, align 4
  %165 = load i32, ptr %10, align 4
  %166 = load i32, ptr %9, align 4
  %167 = sub i32 %166, %165
  store i32 %167, ptr %9, align 4
  %168 = load i32, ptr %8, align 4
  %169 = load i32, ptr %9, align 4
  %170 = sub i32 %169, %168
  store i32 %170, ptr %9, align 4
  %171 = load i32, ptr %8, align 4
  %172 = lshr i32 %171, 3
  %173 = load i32, ptr %9, align 4
  %174 = xor i32 %173, %172
  store i32 %174, ptr %9, align 4
  %175 = load i32, ptr %8, align 4
  %176 = load i32, ptr %10, align 4
  %177 = sub i32 %176, %175
  store i32 %177, ptr %10, align 4
  %178 = load i32, ptr %9, align 4
  %179 = load i32, ptr %10, align 4
  %180 = sub i32 %179, %178
  store i32 %180, ptr %10, align 4
  %181 = load i32, ptr %9, align 4
  %182 = shl i32 %181, 10
  %183 = load i32, ptr %10, align 4
  %184 = xor i32 %183, %182
  store i32 %184, ptr %10, align 4
  %185 = load i32, ptr %9, align 4
  %186 = load i32, ptr %8, align 4
  %187 = sub i32 %186, %185
  store i32 %187, ptr %8, align 4
  %188 = load i32, ptr %10, align 4
  %189 = load i32, ptr %8, align 4
  %190 = sub i32 %189, %188
  store i32 %190, ptr %8, align 4
  %191 = load i32, ptr %10, align 4
  %192 = lshr i32 %191, 15
  %193 = load i32, ptr %8, align 4
  %194 = xor i32 %193, %192
  store i32 %194, ptr %8, align 4
  br label %195

195:                                              ; preds = %104
  %196 = load ptr, ptr %12, align 8
  %197 = getelementptr inbounds i8, ptr %196, i64 12
  store ptr %197, ptr %12, align 8
  %198 = load i32, ptr %11, align 4
  %199 = sub i32 %198, 12
  store i32 %199, ptr %11, align 4
  br label %28, !llvm.loop !8

200:                                              ; preds = %28
  %201 = load i32, ptr %7, align 4
  %202 = load i32, ptr %8, align 4
  %203 = add i32 %202, %201
  store i32 %203, ptr %8, align 4
  %204 = load i32, ptr %11, align 4
  switch i32 %204, label %291 [
    i32 11, label %205
    i32 10, label %213
    i32 9, label %221
    i32 8, label %229
    i32 7, label %237
    i32 6, label %245
    i32 5, label %253
    i32 4, label %260
    i32 3, label %268
    i32 2, label %276
    i32 1, label %284
  ]

205:                                              ; preds = %200
  %206 = load ptr, ptr %12, align 8
  %207 = getelementptr inbounds i8, ptr %206, i64 10
  %208 = load i8, ptr %207, align 1
  %209 = zext i8 %208 to i32
  %210 = shl i32 %209, 24
  %211 = load i32, ptr %8, align 4
  %212 = add i32 %211, %210
  store i32 %212, ptr %8, align 4
  br label %213

213:                                              ; preds = %200, %205
  %214 = load ptr, ptr %12, align 8
  %215 = getelementptr inbounds i8, ptr %214, i64 9
  %216 = load i8, ptr %215, align 1
  %217 = zext i8 %216 to i32
  %218 = shl i32 %217, 16
  %219 = load i32, ptr %8, align 4
  %220 = add i32 %219, %218
  store i32 %220, ptr %8, align 4
  br label %221

221:                                              ; preds = %200, %213
  %222 = load ptr, ptr %12, align 8
  %223 = getelementptr inbounds i8, ptr %222, i64 8
  %224 = load i8, ptr %223, align 1
  %225 = zext i8 %224 to i32
  %226 = shl i32 %225, 8
  %227 = load i32, ptr %8, align 4
  %228 = add i32 %227, %226
  store i32 %228, ptr %8, align 4
  br label %229

229:                                              ; preds = %200, %221
  %230 = load ptr, ptr %12, align 8
  %231 = getelementptr inbounds i8, ptr %230, i64 7
  %232 = load i8, ptr %231, align 1
  %233 = zext i8 %232 to i32
  %234 = shl i32 %233, 24
  %235 = load i32, ptr %10, align 4
  %236 = add i32 %235, %234
  store i32 %236, ptr %10, align 4
  br label %237

237:                                              ; preds = %200, %229
  %238 = load ptr, ptr %12, align 8
  %239 = getelementptr inbounds i8, ptr %238, i64 6
  %240 = load i8, ptr %239, align 1
  %241 = zext i8 %240 to i32
  %242 = shl i32 %241, 16
  %243 = load i32, ptr %10, align 4
  %244 = add i32 %243, %242
  store i32 %244, ptr %10, align 4
  br label %245

245:                                              ; preds = %200, %237
  %246 = load ptr, ptr %12, align 8
  %247 = getelementptr inbounds i8, ptr %246, i64 5
  %248 = load i8, ptr %247, align 1
  %249 = zext i8 %248 to i32
  %250 = shl i32 %249, 8
  %251 = load i32, ptr %10, align 4
  %252 = add i32 %251, %250
  store i32 %252, ptr %10, align 4
  br label %253

253:                                              ; preds = %200, %245
  %254 = load ptr, ptr %12, align 8
  %255 = getelementptr inbounds i8, ptr %254, i64 4
  %256 = load i8, ptr %255, align 1
  %257 = zext i8 %256 to i32
  %258 = load i32, ptr %10, align 4
  %259 = add i32 %258, %257
  store i32 %259, ptr %10, align 4
  br label %260

260:                                              ; preds = %200, %253
  %261 = load ptr, ptr %12, align 8
  %262 = getelementptr inbounds i8, ptr %261, i64 3
  %263 = load i8, ptr %262, align 1
  %264 = zext i8 %263 to i32
  %265 = shl i32 %264, 24
  %266 = load i32, ptr %9, align 4
  %267 = add i32 %266, %265
  store i32 %267, ptr %9, align 4
  br label %268

268:                                              ; preds = %200, %260
  %269 = load ptr, ptr %12, align 8
  %270 = getelementptr inbounds i8, ptr %269, i64 2
  %271 = load i8, ptr %270, align 1
  %272 = zext i8 %271 to i32
  %273 = shl i32 %272, 16
  %274 = load i32, ptr %9, align 4
  %275 = add i32 %274, %273
  store i32 %275, ptr %9, align 4
  br label %276

276:                                              ; preds = %200, %268
  %277 = load ptr, ptr %12, align 8
  %278 = getelementptr inbounds i8, ptr %277, i64 1
  %279 = load i8, ptr %278, align 1
  %280 = zext i8 %279 to i32
  %281 = shl i32 %280, 8
  %282 = load i32, ptr %9, align 4
  %283 = add i32 %282, %281
  store i32 %283, ptr %9, align 4
  br label %284

284:                                              ; preds = %200, %276
  %285 = load ptr, ptr %12, align 8
  %286 = getelementptr inbounds i8, ptr %285, i64 0
  %287 = load i8, ptr %286, align 1
  %288 = zext i8 %287 to i32
  %289 = load i32, ptr %9, align 4
  %290 = add i32 %289, %288
  store i32 %290, ptr %9, align 4
  br label %291

291:                                              ; preds = %200, %284
  br label %292

292:                                              ; preds = %291
  br label %293

293:                                              ; preds = %292
  %294 = load i32, ptr %10, align 4
  %295 = load i32, ptr %9, align 4
  %296 = sub i32 %295, %294
  store i32 %296, ptr %9, align 4
  %297 = load i32, ptr %8, align 4
  %298 = load i32, ptr %9, align 4
  %299 = sub i32 %298, %297
  store i32 %299, ptr %9, align 4
  %300 = load i32, ptr %8, align 4
  %301 = lshr i32 %300, 13
  %302 = load i32, ptr %9, align 4
  %303 = xor i32 %302, %301
  store i32 %303, ptr %9, align 4
  %304 = load i32, ptr %8, align 4
  %305 = load i32, ptr %10, align 4
  %306 = sub i32 %305, %304
  store i32 %306, ptr %10, align 4
  %307 = load i32, ptr %9, align 4
  %308 = load i32, ptr %10, align 4
  %309 = sub i32 %308, %307
  store i32 %309, ptr %10, align 4
  %310 = load i32, ptr %9, align 4
  %311 = shl i32 %310, 8
  %312 = load i32, ptr %10, align 4
  %313 = xor i32 %312, %311
  store i32 %313, ptr %10, align 4
  %314 = load i32, ptr %9, align 4
  %315 = load i32, ptr %8, align 4
  %316 = sub i32 %315, %314
  store i32 %316, ptr %8, align 4
  %317 = load i32, ptr %10, align 4
  %318 = load i32, ptr %8, align 4
  %319 = sub i32 %318, %317
  store i32 %319, ptr %8, align 4
  %320 = load i32, ptr %10, align 4
  %321 = lshr i32 %320, 13
  %322 = load i32, ptr %8, align 4
  %323 = xor i32 %322, %321
  store i32 %323, ptr %8, align 4
  %324 = load i32, ptr %10, align 4
  %325 = load i32, ptr %9, align 4
  %326 = sub i32 %325, %324
  store i32 %326, ptr %9, align 4
  %327 = load i32, ptr %8, align 4
  %328 = load i32, ptr %9, align 4
  %329 = sub i32 %328, %327
  store i32 %329, ptr %9, align 4
  %330 = load i32, ptr %8, align 4
  %331 = lshr i32 %330, 12
  %332 = load i32, ptr %9, align 4
  %333 = xor i32 %332, %331
  store i32 %333, ptr %9, align 4
  %334 = load i32, ptr %8, align 4
  %335 = load i32, ptr %10, align 4
  %336 = sub i32 %335, %334
  store i32 %336, ptr %10, align 4
  %337 = load i32, ptr %9, align 4
  %338 = load i32, ptr %10, align 4
  %339 = sub i32 %338, %337
  store i32 %339, ptr %10, align 4
  %340 = load i32, ptr %9, align 4
  %341 = shl i32 %340, 16
  %342 = load i32, ptr %10, align 4
  %343 = xor i32 %342, %341
  store i32 %343, ptr %10, align 4
  %344 = load i32, ptr %9, align 4
  %345 = load i32, ptr %8, align 4
  %346 = sub i32 %345, %344
  store i32 %346, ptr %8, align 4
  %347 = load i32, ptr %10, align 4
  %348 = load i32, ptr %8, align 4
  %349 = sub i32 %348, %347
  store i32 %349, ptr %8, align 4
  %350 = load i32, ptr %10, align 4
  %351 = lshr i32 %350, 5
  %352 = load i32, ptr %8, align 4
  %353 = xor i32 %352, %351
  store i32 %353, ptr %8, align 4
  %354 = load i32, ptr %10, align 4
  %355 = load i32, ptr %9, align 4
  %356 = sub i32 %355, %354
  store i32 %356, ptr %9, align 4
  %357 = load i32, ptr %8, align 4
  %358 = load i32, ptr %9, align 4
  %359 = sub i32 %358, %357
  store i32 %359, ptr %9, align 4
  %360 = load i32, ptr %8, align 4
  %361 = lshr i32 %360, 3
  %362 = load i32, ptr %9, align 4
  %363 = xor i32 %362, %361
  store i32 %363, ptr %9, align 4
  %364 = load i32, ptr %8, align 4
  %365 = load i32, ptr %10, align 4
  %366 = sub i32 %365, %364
  store i32 %366, ptr %10, align 4
  %367 = load i32, ptr %9, align 4
  %368 = load i32, ptr %10, align 4
  %369 = sub i32 %368, %367
  store i32 %369, ptr %10, align 4
  %370 = load i32, ptr %9, align 4
  %371 = shl i32 %370, 10
  %372 = load i32, ptr %10, align 4
  %373 = xor i32 %372, %371
  store i32 %373, ptr %10, align 4
  %374 = load i32, ptr %9, align 4
  %375 = load i32, ptr %8, align 4
  %376 = sub i32 %375, %374
  store i32 %376, ptr %8, align 4
  %377 = load i32, ptr %10, align 4
  %378 = load i32, ptr %8, align 4
  %379 = sub i32 %378, %377
  store i32 %379, ptr %8, align 4
  %380 = load i32, ptr %10, align 4
  %381 = lshr i32 %380, 15
  %382 = load i32, ptr %8, align 4
  %383 = xor i32 %382, %381
  store i32 %383, ptr %8, align 4
  br label %384

384:                                              ; preds = %293
  br label %385

385:                                              ; preds = %384
  br label %386

386:                                              ; preds = %385
  br label %387

387:                                              ; preds = %386
  store ptr null, ptr %6, align 8
  %388 = load ptr, ptr %4, align 8
  %389 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %388, i32 0, i32 2
  %390 = load ptr, ptr %389, align 8
  %391 = icmp ne ptr %390, null
  br i1 %391, label %392, label %505

392:                                              ; preds = %387
  br label %393

393:                                              ; preds = %392
  %394 = load i32, ptr %8, align 4
  %395 = load ptr, ptr %4, align 8
  %396 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %395, i32 0, i32 2
  %397 = load ptr, ptr %396, align 8
  %398 = getelementptr inbounds nuw %struct.CacheNode, ptr %397, i32 0, i32 5
  %399 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %398, i32 0, i32 0
  %400 = load ptr, ptr %399, align 8
  %401 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %400, i32 0, i32 1
  %402 = load i32, ptr %401, align 8
  %403 = sub i32 %402, 1
  %404 = and i32 %394, %403
  store i32 %404, ptr %13, align 4
  br label %405

405:                                              ; preds = %393
  br label %406

406:                                              ; preds = %405
  %407 = load ptr, ptr %4, align 8
  %408 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %407, i32 0, i32 2
  %409 = load ptr, ptr %408, align 8
  %410 = getelementptr inbounds nuw %struct.CacheNode, ptr %409, i32 0, i32 5
  %411 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %410, i32 0, i32 0
  %412 = load ptr, ptr %411, align 8
  %413 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %412, i32 0, i32 0
  %414 = load ptr, ptr %413, align 8
  %415 = load i32, ptr %13, align 4
  %416 = zext i32 %415 to i64
  %417 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %414, i64 %416
  %418 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %417, i32 0, i32 0
  %419 = load ptr, ptr %418, align 8
  %420 = icmp ne ptr %419, null
  br i1 %420, label %421, label %447

421:                                              ; preds = %406
  br label %422

422:                                              ; preds = %421
  %423 = load ptr, ptr %4, align 8
  %424 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %423, i32 0, i32 2
  %425 = load ptr, ptr %424, align 8
  %426 = getelementptr inbounds nuw %struct.CacheNode, ptr %425, i32 0, i32 5
  %427 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %426, i32 0, i32 0
  %428 = load ptr, ptr %427, align 8
  %429 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %428, i32 0, i32 0
  %430 = load ptr, ptr %429, align 8
  %431 = load i32, ptr %13, align 4
  %432 = zext i32 %431 to i64
  %433 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %430, i64 %432
  %434 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %433, i32 0, i32 0
  %435 = load ptr, ptr %434, align 8
  %436 = load ptr, ptr %4, align 8
  %437 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %436, i32 0, i32 2
  %438 = load ptr, ptr %437, align 8
  %439 = getelementptr inbounds nuw %struct.CacheNode, ptr %438, i32 0, i32 5
  %440 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %439, i32 0, i32 0
  %441 = load ptr, ptr %440, align 8
  %442 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %441, i32 0, i32 5
  %443 = load i64, ptr %442, align 8
  %444 = sub i64 0, %443
  %445 = getelementptr inbounds i8, ptr %435, i64 %444
  store ptr %445, ptr %6, align 8
  br label %446

446:                                              ; preds = %422
  br label %448

447:                                              ; preds = %406
  store ptr null, ptr %6, align 8
  br label %448

448:                                              ; preds = %447, %446
  br label %449

449:                                              ; preds = %502, %448
  %450 = load ptr, ptr %6, align 8
  %451 = icmp ne ptr %450, null
  br i1 %451, label %452, label %503

452:                                              ; preds = %449
  %453 = load ptr, ptr %6, align 8
  %454 = getelementptr inbounds nuw %struct.CacheNode, ptr %453, i32 0, i32 5
  %455 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %454, i32 0, i32 7
  %456 = load i32, ptr %455, align 4
  %457 = load i32, ptr %8, align 4
  %458 = icmp eq i32 %456, %457
  br i1 %458, label %459, label %478

459:                                              ; preds = %452
  %460 = load ptr, ptr %6, align 8
  %461 = getelementptr inbounds nuw %struct.CacheNode, ptr %460, i32 0, i32 5
  %462 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %461, i32 0, i32 6
  %463 = load i32, ptr %462, align 8
  %464 = load i32, ptr %7, align 4
  %465 = icmp eq i32 %463, %464
  br i1 %465, label %466, label %478

466:                                              ; preds = %459
  %467 = load ptr, ptr %6, align 8
  %468 = getelementptr inbounds nuw %struct.CacheNode, ptr %467, i32 0, i32 5
  %469 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %468, i32 0, i32 5
  %470 = load ptr, ptr %469, align 8
  %471 = load ptr, ptr %5, align 8
  %472 = load i32, ptr %7, align 4
  %473 = zext i32 %472 to i64
  %474 = call i32 @memcmp(ptr noundef %470, ptr noundef %471, i64 noundef %473)
  %475 = icmp eq i32 %474, 0
  br i1 %475, label %476, label %477

476:                                              ; preds = %466
  br label %503

477:                                              ; preds = %466
  br label %478

478:                                              ; preds = %477, %459, %452
  %479 = load ptr, ptr %6, align 8
  %480 = getelementptr inbounds nuw %struct.CacheNode, ptr %479, i32 0, i32 5
  %481 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %480, i32 0, i32 4
  %482 = load ptr, ptr %481, align 8
  %483 = icmp ne ptr %482, null
  br i1 %483, label %484, label %501

484:                                              ; preds = %478
  br label %485

485:                                              ; preds = %484
  %486 = load ptr, ptr %6, align 8
  %487 = getelementptr inbounds nuw %struct.CacheNode, ptr %486, i32 0, i32 5
  %488 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %487, i32 0, i32 4
  %489 = load ptr, ptr %488, align 8
  %490 = load ptr, ptr %4, align 8
  %491 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %490, i32 0, i32 2
  %492 = load ptr, ptr %491, align 8
  %493 = getelementptr inbounds nuw %struct.CacheNode, ptr %492, i32 0, i32 5
  %494 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %493, i32 0, i32 0
  %495 = load ptr, ptr %494, align 8
  %496 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %495, i32 0, i32 5
  %497 = load i64, ptr %496, align 8
  %498 = sub i64 0, %497
  %499 = getelementptr inbounds i8, ptr %489, i64 %498
  store ptr %499, ptr %6, align 8
  br label %500

500:                                              ; preds = %485
  br label %502

501:                                              ; preds = %478
  store ptr null, ptr %6, align 8
  br label %502

502:                                              ; preds = %501, %500
  br label %449, !llvm.loop !9

503:                                              ; preds = %476, %449
  br label %504

504:                                              ; preds = %503
  br label %505

505:                                              ; preds = %504, %387
  br label %506

506:                                              ; preds = %505
  br label %507

507:                                              ; preds = %506, %18
  br label %508

508:                                              ; preds = %507
  br label %509

509:                                              ; preds = %508
  %510 = load ptr, ptr %6, align 8
  %511 = icmp ne ptr %510, null
  br i1 %511, label %512, label %522

512:                                              ; preds = %509
  %513 = load ptr, ptr %4, align 8
  %514 = load ptr, ptr %6, align 8
  call void @cache_simulation_cache_move_to_front(ptr noundef %513, ptr noundef %514)
  %515 = load ptr, ptr %4, align 8
  %516 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %515, i32 0, i32 5
  %517 = load i64, ptr %516, align 8
  %518 = add nsw i64 %517, 1
  store i64 %518, ptr %516, align 8
  %519 = load ptr, ptr %6, align 8
  %520 = getelementptr inbounds nuw %struct.CacheNode, ptr %519, i32 0, i32 2
  store i64 %518, ptr %520, align 8
  %521 = load ptr, ptr %6, align 8
  store ptr %521, ptr %3, align 8
  br label %523

522:                                              ; preds = %509
  store ptr null, ptr %3, align 8
  br label %523

523:                                              ; preds = %522, %512
  %524 = load ptr, ptr %3, align 8
  ret ptr %524
}

define internal void @cache_simulation_cache_put(ptr noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca ptr, align 8
  %21 = alloca i32, align 4
  %22 = alloca ptr, align 8
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store ptr null, ptr %7, align 8
  br label %29

29:                                               ; preds = %3
  %30 = load ptr, ptr %5, align 8
  %31 = call i64 @strlen(ptr noundef %30)
  %32 = trunc i64 %31 to i32
  store i32 %32, ptr %8, align 4
  br label %33

33:                                               ; preds = %29
  store ptr null, ptr %7, align 8
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %35, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %522

38:                                               ; preds = %33
  br label %39

39:                                               ; preds = %38
  br label %40

40:                                               ; preds = %39
  %41 = load ptr, ptr %5, align 8
  store ptr %41, ptr %13, align 8
  store i32 -17973521, ptr %9, align 4
  store i32 -1640531527, ptr %11, align 4
  store i32 -1640531527, ptr %10, align 4
  %42 = load i32, ptr %8, align 4
  store i32 %42, ptr %12, align 4
  br label %43

43:                                               ; preds = %210, %40
  %44 = load i32, ptr %12, align 4
  %45 = icmp uge i32 %44, 12
  br i1 %45, label %46, label %215

46:                                               ; preds = %43
  %47 = load ptr, ptr %13, align 8
  %48 = getelementptr inbounds i8, ptr %47, i64 0
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = load ptr, ptr %13, align 8
  %52 = getelementptr inbounds i8, ptr %51, i64 1
  %53 = load i8, ptr %52, align 1
  %54 = zext i8 %53 to i32
  %55 = shl i32 %54, 8
  %56 = add i32 %50, %55
  %57 = load ptr, ptr %13, align 8
  %58 = getelementptr inbounds i8, ptr %57, i64 2
  %59 = load i8, ptr %58, align 1
  %60 = zext i8 %59 to i32
  %61 = shl i32 %60, 16
  %62 = add i32 %56, %61
  %63 = load ptr, ptr %13, align 8
  %64 = getelementptr inbounds i8, ptr %63, i64 3
  %65 = load i8, ptr %64, align 1
  %66 = zext i8 %65 to i32
  %67 = shl i32 %66, 24
  %68 = add i32 %62, %67
  %69 = load i32, ptr %10, align 4
  %70 = add i32 %69, %68
  store i32 %70, ptr %10, align 4
  %71 = load ptr, ptr %13, align 8
  %72 = getelementptr inbounds i8, ptr %71, i64 4
  %73 = load i8, ptr %72, align 1
  %74 = zext i8 %73 to i32
  %75 = load ptr, ptr %13, align 8
  %76 = getelementptr inbounds i8, ptr %75, i64 5
  %77 = load i8, ptr %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl i32 %78, 8
  %80 = add i32 %74, %79
  %81 = load ptr, ptr %13, align 8
  %82 = getelementptr inbounds i8, ptr %81, i64 6
  %83 = load i8, ptr %82, align 1
  %84 = zext i8 %83 to i32
  %85 = shl i32 %84, 16
  %86 = add i32 %80, %85
  %87 = load ptr, ptr %13, align 8
  %88 = getelementptr inbounds i8, ptr %87, i64 7
  %89 = load i8, ptr %88, align 1
  %90 = zext i8 %89 to i32
  %91 = shl i32 %90, 24
  %92 = add i32 %86, %91
  %93 = load i32, ptr %11, align 4
  %94 = add i32 %93, %92
  store i32 %94, ptr %11, align 4
  %95 = load ptr, ptr %13, align 8
  %96 = getelementptr inbounds i8, ptr %95, i64 8
  %97 = load i8, ptr %96, align 1
  %98 = zext i8 %97 to i32
  %99 = load ptr, ptr %13, align 8
  %100 = getelementptr inbounds i8, ptr %99, i64 9
  %101 = load i8, ptr %100, align 1
  %102 = zext i8 %101 to i32
  %103 = shl i32 %102, 8
  %104 = add i32 %98, %103
  %105 = load ptr, ptr %13, align 8
  %106 = getelementptr inbounds i8, ptr %105, i64 10
  %107 = load i8, ptr %106, align 1
  %108 = zext i8 %107 to i32
  %109 = shl i32 %108, 16
  %110 = add i32 %104, %109
  %111 = load ptr, ptr %13, align 8
  %112 = getelementptr inbounds i8, ptr %111, i64 11
  %113 = load i8, ptr %112, align 1
  %114 = zext i8 %113 to i32
  %115 = shl i32 %114, 24
  %116 = add i32 %110, %115
  %117 = load i32, ptr %9, align 4
  %118 = add i32 %117, %116
  store i32 %118, ptr %9, align 4
  br label %119

119:                                              ; preds = %46
  %120 = load i32, ptr %11, align 4
  %121 = load i32, ptr %10, align 4
  %122 = sub i32 %121, %120
  store i32 %122, ptr %10, align 4
  %123 = load i32, ptr %9, align 4
  %124 = load i32, ptr %10, align 4
  %125 = sub i32 %124, %123
  store i32 %125, ptr %10, align 4
  %126 = load i32, ptr %9, align 4
  %127 = lshr i32 %126, 13
  %128 = load i32, ptr %10, align 4
  %129 = xor i32 %128, %127
  store i32 %129, ptr %10, align 4
  %130 = load i32, ptr %9, align 4
  %131 = load i32, ptr %11, align 4
  %132 = sub i32 %131, %130
  store i32 %132, ptr %11, align 4
  %133 = load i32, ptr %10, align 4
  %134 = load i32, ptr %11, align 4
  %135 = sub i32 %134, %133
  store i32 %135, ptr %11, align 4
  %136 = load i32, ptr %10, align 4
  %137 = shl i32 %136, 8
  %138 = load i32, ptr %11, align 4
  %139 = xor i32 %138, %137
  store i32 %139, ptr %11, align 4
  %140 = load i32, ptr %10, align 4
  %141 = load i32, ptr %9, align 4
  %142 = sub i32 %141, %140
  store i32 %142, ptr %9, align 4
  %143 = load i32, ptr %11, align 4
  %144 = load i32, ptr %9, align 4
  %145 = sub i32 %144, %143
  store i32 %145, ptr %9, align 4
  %146 = load i32, ptr %11, align 4
  %147 = lshr i32 %146, 13
  %148 = load i32, ptr %9, align 4
  %149 = xor i32 %148, %147
  store i32 %149, ptr %9, align 4
  %150 = load i32, ptr %11, align 4
  %151 = load i32, ptr %10, align 4
  %152 = sub i32 %151, %150
  store i32 %152, ptr %10, align 4
  %153 = load i32, ptr %9, align 4
  %154 = load i32, ptr %10, align 4
  %155 = sub i32 %154, %153
  store i32 %155, ptr %10, align 4
  %156 = load i32, ptr %9, align 4
  %157 = lshr i32 %156, 12
  %158 = load i32, ptr %10, align 4
  %159 = xor i32 %158, %157
  store i32 %159, ptr %10, align 4
  %160 = load i32, ptr %9, align 4
  %161 = load i32, ptr %11, align 4
  %162 = sub i32 %161, %160
  store i32 %162, ptr %11, align 4
  %163 = load i32, ptr %10, align 4
  %164 = load i32, ptr %11, align 4
  %165 = sub i32 %164, %163
  store i32 %165, ptr %11, align 4
  %166 = load i32, ptr %10, align 4
  %167 = shl i32 %166, 16
  %168 = load i32, ptr %11, align 4
  %169 = xor i32 %168, %167
  store i32 %169, ptr %11, align 4
  %170 = load i32, ptr %10, align 4
  %171 = load i32, ptr %9, align 4
  %172 = sub i32 %171, %170
  store i32 %172, ptr %9, align 4
  %173 = load i32, ptr %11, align 4
  %174 = load i32, ptr %9, align 4
  %175 = sub i32 %174, %173
  store i32 %175, ptr %9, align 4
  %176 = load i32, ptr %11, align 4
  %177 = lshr i32 %176, 5
  %178 = load i32, ptr %9, align 4
  %179 = xor i32 %178, %177
  store i32 %179, ptr %9, align 4
  %180 = load i32, ptr %11, align 4
  %181 = load i32, ptr %10, align 4
  %182 = sub i32 %181, %180
  store i32 %182, ptr %10, align 4
  %183 = load i32, ptr %9, align 4
  %184 = load i32, ptr %10, align 4
  %185 = sub i32 %184, %183
  store i32 %185, ptr %10, align 4
  %186 = load i32, ptr %9, align 4
  %187 = lshr i32 %186, 3
  %188 = load i32, ptr %10, align 4
  %189 = xor i32 %188, %187
  store i32 %189, ptr %10, align 4
  %190 = load i32, ptr %9, align 4
  %191 = load i32, ptr %11, align 4
  %192 = sub i32 %191, %190
  store i32 %192, ptr %11, align 4
  %193 = load i32, ptr %10, align 4
  %194 = load i32, ptr %11, align 4
  %195 = sub i32 %194, %193
  store i32 %195, ptr %11, align 4
  %196 = load i32, ptr %10, align 4
  %197 = shl i32 %196, 10
  %198 = load i32, ptr %11, align 4
  %199 = xor i32 %198, %197
  store i32 %199, ptr %11, align 4
  %200 = load i32, ptr %10, align 4
  %201 = load i32, ptr %9, align 4
  %202 = sub i32 %201, %200
  store i32 %202, ptr %9, align 4
  %203 = load i32, ptr %11, align 4
  %204 = load i32, ptr %9, align 4
  %205 = sub i32 %204, %203
  store i32 %205, ptr %9, align 4
  %206 = load i32, ptr %11, align 4
  %207 = lshr i32 %206, 15
  %208 = load i32, ptr %9, align 4
  %209 = xor i32 %208, %207
  store i32 %209, ptr %9, align 4
  br label %210

210:                                              ; preds = %119
  %211 = load ptr, ptr %13, align 8
  %212 = getelementptr inbounds i8, ptr %211, i64 12
  store ptr %212, ptr %13, align 8
  %213 = load i32, ptr %12, align 4
  %214 = sub i32 %213, 12
  store i32 %214, ptr %12, align 4
  br label %43, !llvm.loop !10

215:                                              ; preds = %43
  %216 = load i32, ptr %8, align 4
  %217 = load i32, ptr %9, align 4
  %218 = add i32 %217, %216
  store i32 %218, ptr %9, align 4
  %219 = load i32, ptr %12, align 4
  switch i32 %219, label %306 [
    i32 11, label %220
    i32 10, label %228
    i32 9, label %236
    i32 8, label %244
    i32 7, label %252
    i32 6, label %260
    i32 5, label %268
    i32 4, label %275
    i32 3, label %283
    i32 2, label %291
    i32 1, label %299
  ]

220:                                              ; preds = %215
  %221 = load ptr, ptr %13, align 8
  %222 = getelementptr inbounds i8, ptr %221, i64 10
  %223 = load i8, ptr %222, align 1
  %224 = zext i8 %223 to i32
  %225 = shl i32 %224, 24
  %226 = load i32, ptr %9, align 4
  %227 = add i32 %226, %225
  store i32 %227, ptr %9, align 4
  br label %228

228:                                              ; preds = %215, %220
  %229 = load ptr, ptr %13, align 8
  %230 = getelementptr inbounds i8, ptr %229, i64 9
  %231 = load i8, ptr %230, align 1
  %232 = zext i8 %231 to i32
  %233 = shl i32 %232, 16
  %234 = load i32, ptr %9, align 4
  %235 = add i32 %234, %233
  store i32 %235, ptr %9, align 4
  br label %236

236:                                              ; preds = %215, %228
  %237 = load ptr, ptr %13, align 8
  %238 = getelementptr inbounds i8, ptr %237, i64 8
  %239 = load i8, ptr %238, align 1
  %240 = zext i8 %239 to i32
  %241 = shl i32 %240, 8
  %242 = load i32, ptr %9, align 4
  %243 = add i32 %242, %241
  store i32 %243, ptr %9, align 4
  br label %244

244:                                              ; preds = %215, %236
  %245 = load ptr, ptr %13, align 8
  %246 = getelementptr inbounds i8, ptr %245, i64 7
  %247 = load i8, ptr %246, align 1
  %248 = zext i8 %247 to i32
  %249 = shl i32 %248, 24
  %250 = load i32, ptr %11, align 4
  %251 = add i32 %250, %249
  store i32 %251, ptr %11, align 4
  br label %252

252:                                              ; preds = %215, %244
  %253 = load ptr, ptr %13, align 8
  %254 = getelementptr inbounds i8, ptr %253, i64 6
  %255 = load i8, ptr %254, align 1
  %256 = zext i8 %255 to i32
  %257 = shl i32 %256, 16
  %258 = load i32, ptr %11, align 4
  %259 = add i32 %258, %257
  store i32 %259, ptr %11, align 4
  br label %260

260:                                              ; preds = %215, %252
  %261 = load ptr, ptr %13, align 8
  %262 = getelementptr inbounds i8, ptr %261, i64 5
  %263 = load i8, ptr %262, align 1
  %264 = zext i8 %263 to i32
  %265 = shl i32 %264, 8
  %266 = load i32, ptr %11, align 4
  %267 = add i32 %266, %265
  store i32 %267, ptr %11, align 4
  br label %268

268:                                              ; preds = %215, %260
  %269 = load ptr, ptr %13, align 8
  %270 = getelementptr inbounds i8, ptr %269, i64 4
  %271 = load i8, ptr %270, align 1
  %272 = zext i8 %271 to i32
  %273 = load i32, ptr %11, align 4
  %274 = add i32 %273, %272
  store i32 %274, ptr %11, align 4
  br label %275

275:                                              ; preds = %215, %268
  %276 = load ptr, ptr %13, align 8
  %277 = getelementptr inbounds i8, ptr %276, i64 3
  %278 = load i8, ptr %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl i32 %279, 24
  %281 = load i32, ptr %10, align 4
  %282 = add i32 %281, %280
  store i32 %282, ptr %10, align 4
  br label %283

283:                                              ; preds = %215, %275
  %284 = load ptr, ptr %13, align 8
  %285 = getelementptr inbounds i8, ptr %284, i64 2
  %286 = load i8, ptr %285, align 1
  %287 = zext i8 %286 to i32
  %288 = shl i32 %287, 16
  %289 = load i32, ptr %10, align 4
  %290 = add i32 %289, %288
  store i32 %290, ptr %10, align 4
  br label %291

291:                                              ; preds = %215, %283
  %292 = load ptr, ptr %13, align 8
  %293 = getelementptr inbounds i8, ptr %292, i64 1
  %294 = load i8, ptr %293, align 1
  %295 = zext i8 %294 to i32
  %296 = shl i32 %295, 8
  %297 = load i32, ptr %10, align 4
  %298 = add i32 %297, %296
  store i32 %298, ptr %10, align 4
  br label %299

299:                                              ; preds = %215, %291
  %300 = load ptr, ptr %13, align 8
  %301 = getelementptr inbounds i8, ptr %300, i64 0
  %302 = load i8, ptr %301, align 1
  %303 = zext i8 %302 to i32
  %304 = load i32, ptr %10, align 4
  %305 = add i32 %304, %303
  store i32 %305, ptr %10, align 4
  br label %306

306:                                              ; preds = %215, %299
  br label %307

307:                                              ; preds = %306
  br label %308

308:                                              ; preds = %307
  %309 = load i32, ptr %11, align 4
  %310 = load i32, ptr %10, align 4
  %311 = sub i32 %310, %309
  store i32 %311, ptr %10, align 4
  %312 = load i32, ptr %9, align 4
  %313 = load i32, ptr %10, align 4
  %314 = sub i32 %313, %312
  store i32 %314, ptr %10, align 4
  %315 = load i32, ptr %9, align 4
  %316 = lshr i32 %315, 13
  %317 = load i32, ptr %10, align 4
  %318 = xor i32 %317, %316
  store i32 %318, ptr %10, align 4
  %319 = load i32, ptr %9, align 4
  %320 = load i32, ptr %11, align 4
  %321 = sub i32 %320, %319
  store i32 %321, ptr %11, align 4
  %322 = load i32, ptr %10, align 4
  %323 = load i32, ptr %11, align 4
  %324 = sub i32 %323, %322
  store i32 %324, ptr %11, align 4
  %325 = load i32, ptr %10, align 4
  %326 = shl i32 %325, 8
  %327 = load i32, ptr %11, align 4
  %328 = xor i32 %327, %326
  store i32 %328, ptr %11, align 4
  %329 = load i32, ptr %10, align 4
  %330 = load i32, ptr %9, align 4
  %331 = sub i32 %330, %329
  store i32 %331, ptr %9, align 4
  %332 = load i32, ptr %11, align 4
  %333 = load i32, ptr %9, align 4
  %334 = sub i32 %333, %332
  store i32 %334, ptr %9, align 4
  %335 = load i32, ptr %11, align 4
  %336 = lshr i32 %335, 13
  %337 = load i32, ptr %9, align 4
  %338 = xor i32 %337, %336
  store i32 %338, ptr %9, align 4
  %339 = load i32, ptr %11, align 4
  %340 = load i32, ptr %10, align 4
  %341 = sub i32 %340, %339
  store i32 %341, ptr %10, align 4
  %342 = load i32, ptr %9, align 4
  %343 = load i32, ptr %10, align 4
  %344 = sub i32 %343, %342
  store i32 %344, ptr %10, align 4
  %345 = load i32, ptr %9, align 4
  %346 = lshr i32 %345, 12
  %347 = load i32, ptr %10, align 4
  %348 = xor i32 %347, %346
  store i32 %348, ptr %10, align 4
  %349 = load i32, ptr %9, align 4
  %350 = load i32, ptr %11, align 4
  %351 = sub i32 %350, %349
  store i32 %351, ptr %11, align 4
  %352 = load i32, ptr %10, align 4
  %353 = load i32, ptr %11, align 4
  %354 = sub i32 %353, %352
  store i32 %354, ptr %11, align 4
  %355 = load i32, ptr %10, align 4
  %356 = shl i32 %355, 16
  %357 = load i32, ptr %11, align 4
  %358 = xor i32 %357, %356
  store i32 %358, ptr %11, align 4
  %359 = load i32, ptr %10, align 4
  %360 = load i32, ptr %9, align 4
  %361 = sub i32 %360, %359
  store i32 %361, ptr %9, align 4
  %362 = load i32, ptr %11, align 4
  %363 = load i32, ptr %9, align 4
  %364 = sub i32 %363, %362
  store i32 %364, ptr %9, align 4
  %365 = load i32, ptr %11, align 4
  %366 = lshr i32 %365, 5
  %367 = load i32, ptr %9, align 4
  %368 = xor i32 %367, %366
  store i32 %368, ptr %9, align 4
  %369 = load i32, ptr %11, align 4
  %370 = load i32, ptr %10, align 4
  %371 = sub i32 %370, %369
  store i32 %371, ptr %10, align 4
  %372 = load i32, ptr %9, align 4
  %373 = load i32, ptr %10, align 4
  %374 = sub i32 %373, %372
  store i32 %374, ptr %10, align 4
  %375 = load i32, ptr %9, align 4
  %376 = lshr i32 %375, 3
  %377 = load i32, ptr %10, align 4
  %378 = xor i32 %377, %376
  store i32 %378, ptr %10, align 4
  %379 = load i32, ptr %9, align 4
  %380 = load i32, ptr %11, align 4
  %381 = sub i32 %380, %379
  store i32 %381, ptr %11, align 4
  %382 = load i32, ptr %10, align 4
  %383 = load i32, ptr %11, align 4
  %384 = sub i32 %383, %382
  store i32 %384, ptr %11, align 4
  %385 = load i32, ptr %10, align 4
  %386 = shl i32 %385, 10
  %387 = load i32, ptr %11, align 4
  %388 = xor i32 %387, %386
  store i32 %388, ptr %11, align 4
  %389 = load i32, ptr %10, align 4
  %390 = load i32, ptr %9, align 4
  %391 = sub i32 %390, %389
  store i32 %391, ptr %9, align 4
  %392 = load i32, ptr %11, align 4
  %393 = load i32, ptr %9, align 4
  %394 = sub i32 %393, %392
  store i32 %394, ptr %9, align 4
  %395 = load i32, ptr %11, align 4
  %396 = lshr i32 %395, 15
  %397 = load i32, ptr %9, align 4
  %398 = xor i32 %397, %396
  store i32 %398, ptr %9, align 4
  br label %399

399:                                              ; preds = %308
  br label %400

400:                                              ; preds = %399
  br label %401

401:                                              ; preds = %400
  br label %402

402:                                              ; preds = %401
  store ptr null, ptr %7, align 8
  %403 = load ptr, ptr %4, align 8
  %404 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %403, i32 0, i32 2
  %405 = load ptr, ptr %404, align 8
  %406 = icmp ne ptr %405, null
  br i1 %406, label %407, label %520

407:                                              ; preds = %402
  br label %408

408:                                              ; preds = %407
  %409 = load i32, ptr %9, align 4
  %410 = load ptr, ptr %4, align 8
  %411 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %410, i32 0, i32 2
  %412 = load ptr, ptr %411, align 8
  %413 = getelementptr inbounds nuw %struct.CacheNode, ptr %412, i32 0, i32 5
  %414 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %413, i32 0, i32 0
  %415 = load ptr, ptr %414, align 8
  %416 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %415, i32 0, i32 1
  %417 = load i32, ptr %416, align 8
  %418 = sub i32 %417, 1
  %419 = and i32 %409, %418
  store i32 %419, ptr %14, align 4
  br label %420

420:                                              ; preds = %408
  br label %421

421:                                              ; preds = %420
  %422 = load ptr, ptr %4, align 8
  %423 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %422, i32 0, i32 2
  %424 = load ptr, ptr %423, align 8
  %425 = getelementptr inbounds nuw %struct.CacheNode, ptr %424, i32 0, i32 5
  %426 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %425, i32 0, i32 0
  %427 = load ptr, ptr %426, align 8
  %428 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %427, i32 0, i32 0
  %429 = load ptr, ptr %428, align 8
  %430 = load i32, ptr %14, align 4
  %431 = zext i32 %430 to i64
  %432 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %429, i64 %431
  %433 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %432, i32 0, i32 0
  %434 = load ptr, ptr %433, align 8
  %435 = icmp ne ptr %434, null
  br i1 %435, label %436, label %462

436:                                              ; preds = %421
  br label %437

437:                                              ; preds = %436
  %438 = load ptr, ptr %4, align 8
  %439 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %438, i32 0, i32 2
  %440 = load ptr, ptr %439, align 8
  %441 = getelementptr inbounds nuw %struct.CacheNode, ptr %440, i32 0, i32 5
  %442 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %441, i32 0, i32 0
  %443 = load ptr, ptr %442, align 8
  %444 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %443, i32 0, i32 0
  %445 = load ptr, ptr %444, align 8
  %446 = load i32, ptr %14, align 4
  %447 = zext i32 %446 to i64
  %448 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %445, i64 %447
  %449 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %448, i32 0, i32 0
  %450 = load ptr, ptr %449, align 8
  %451 = load ptr, ptr %4, align 8
  %452 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %451, i32 0, i32 2
  %453 = load ptr, ptr %452, align 8
  %454 = getelementptr inbounds nuw %struct.CacheNode, ptr %453, i32 0, i32 5
  %455 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %454, i32 0, i32 0
  %456 = load ptr, ptr %455, align 8
  %457 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %456, i32 0, i32 5
  %458 = load i64, ptr %457, align 8
  %459 = sub i64 0, %458
  %460 = getelementptr inbounds i8, ptr %450, i64 %459
  store ptr %460, ptr %7, align 8
  br label %461

461:                                              ; preds = %437
  br label %463

462:                                              ; preds = %421
  store ptr null, ptr %7, align 8
  br label %463

463:                                              ; preds = %462, %461
  br label %464

464:                                              ; preds = %517, %463
  %465 = load ptr, ptr %7, align 8
  %466 = icmp ne ptr %465, null
  br i1 %466, label %467, label %518

467:                                              ; preds = %464
  %468 = load ptr, ptr %7, align 8
  %469 = getelementptr inbounds nuw %struct.CacheNode, ptr %468, i32 0, i32 5
  %470 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %469, i32 0, i32 7
  %471 = load i32, ptr %470, align 4
  %472 = load i32, ptr %9, align 4
  %473 = icmp eq i32 %471, %472
  br i1 %473, label %474, label %493

474:                                              ; preds = %467
  %475 = load ptr, ptr %7, align 8
  %476 = getelementptr inbounds nuw %struct.CacheNode, ptr %475, i32 0, i32 5
  %477 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %476, i32 0, i32 6
  %478 = load i32, ptr %477, align 8
  %479 = load i32, ptr %8, align 4
  %480 = icmp eq i32 %478, %479
  br i1 %480, label %481, label %493

481:                                              ; preds = %474
  %482 = load ptr, ptr %7, align 8
  %483 = getelementptr inbounds nuw %struct.CacheNode, ptr %482, i32 0, i32 5
  %484 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %483, i32 0, i32 5
  %485 = load ptr, ptr %484, align 8
  %486 = load ptr, ptr %5, align 8
  %487 = load i32, ptr %8, align 4
  %488 = zext i32 %487 to i64
  %489 = call i32 @memcmp(ptr noundef %485, ptr noundef %486, i64 noundef %488)
  %490 = icmp eq i32 %489, 0
  br i1 %490, label %491, label %492

491:                                              ; preds = %481
  br label %518

492:                                              ; preds = %481
  br label %493

493:                                              ; preds = %492, %474, %467
  %494 = load ptr, ptr %7, align 8
  %495 = getelementptr inbounds nuw %struct.CacheNode, ptr %494, i32 0, i32 5
  %496 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %495, i32 0, i32 4
  %497 = load ptr, ptr %496, align 8
  %498 = icmp ne ptr %497, null
  br i1 %498, label %499, label %516

499:                                              ; preds = %493
  br label %500

500:                                              ; preds = %499
  %501 = load ptr, ptr %7, align 8
  %502 = getelementptr inbounds nuw %struct.CacheNode, ptr %501, i32 0, i32 5
  %503 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %502, i32 0, i32 4
  %504 = load ptr, ptr %503, align 8
  %505 = load ptr, ptr %4, align 8
  %506 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %505, i32 0, i32 2
  %507 = load ptr, ptr %506, align 8
  %508 = getelementptr inbounds nuw %struct.CacheNode, ptr %507, i32 0, i32 5
  %509 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %508, i32 0, i32 0
  %510 = load ptr, ptr %509, align 8
  %511 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %510, i32 0, i32 5
  %512 = load i64, ptr %511, align 8
  %513 = sub i64 0, %512
  %514 = getelementptr inbounds i8, ptr %504, i64 %513
  store ptr %514, ptr %7, align 8
  br label %515

515:                                              ; preds = %500
  br label %517

516:                                              ; preds = %493
  store ptr null, ptr %7, align 8
  br label %517

517:                                              ; preds = %516, %515
  br label %464, !llvm.loop !11

518:                                              ; preds = %491, %464
  br label %519

519:                                              ; preds = %518
  br label %520

520:                                              ; preds = %519, %402
  br label %521

521:                                              ; preds = %520
  br label %522

522:                                              ; preds = %521, %33
  br label %523

523:                                              ; preds = %522
  br label %524

524:                                              ; preds = %523
  %525 = load ptr, ptr %7, align 8
  %526 = icmp ne ptr %525, null
  br i1 %526, label %527, label %543

527:                                              ; preds = %524
  %528 = load ptr, ptr %7, align 8
  %529 = getelementptr inbounds nuw %struct.CacheNode, ptr %528, i32 0, i32 1
  %530 = load ptr, ptr %529, align 8
  call void @free(ptr noundef %530)
  %531 = load ptr, ptr %6, align 8
  %532 = call noalias ptr @strdup(ptr noundef %531)
  %533 = load ptr, ptr %7, align 8
  %534 = getelementptr inbounds nuw %struct.CacheNode, ptr %533, i32 0, i32 1
  store ptr %532, ptr %534, align 8
  %535 = load ptr, ptr %4, align 8
  %536 = load ptr, ptr %7, align 8
  call void @cache_simulation_cache_move_to_front(ptr noundef %535, ptr noundef %536)
  %537 = load ptr, ptr %4, align 8
  %538 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %537, i32 0, i32 5
  %539 = load i64, ptr %538, align 8
  %540 = add nsw i64 %539, 1
  store i64 %540, ptr %538, align 8
  %541 = load ptr, ptr %7, align 8
  %542 = getelementptr inbounds nuw %struct.CacheNode, ptr %541, i32 0, i32 2
  store i64 %540, ptr %542, align 8
  br label %1478

543:                                              ; preds = %524
  %544 = load ptr, ptr %4, align 8
  %545 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %544, i32 0, i32 4
  %546 = load i64, ptr %545, align 8
  %547 = load ptr, ptr %4, align 8
  %548 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %547, i32 0, i32 3
  %549 = load i64, ptr %548, align 8
  %550 = icmp uge i64 %546, %549
  br i1 %550, label %551, label %553

551:                                              ; preds = %543
  %552 = load ptr, ptr %4, align 8
  call void @cache_simulation_cache_remove_oldest(ptr noundef %552)
  br label %553

553:                                              ; preds = %551, %543
  %554 = call noalias ptr @malloc(i64 noundef 96)
  store ptr %554, ptr %7, align 8
  %555 = load ptr, ptr %5, align 8
  %556 = call noalias ptr @strdup(ptr noundef %555)
  %557 = load ptr, ptr %7, align 8
  %558 = getelementptr inbounds nuw %struct.CacheNode, ptr %557, i32 0, i32 0
  store ptr %556, ptr %558, align 8
  %559 = load ptr, ptr %6, align 8
  %560 = call noalias ptr @strdup(ptr noundef %559)
  %561 = load ptr, ptr %7, align 8
  %562 = getelementptr inbounds nuw %struct.CacheNode, ptr %561, i32 0, i32 1
  store ptr %560, ptr %562, align 8
  %563 = load ptr, ptr %4, align 8
  %564 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %563, i32 0, i32 5
  %565 = load i64, ptr %564, align 8
  %566 = add nsw i64 %565, 1
  store i64 %566, ptr %564, align 8
  %567 = load ptr, ptr %7, align 8
  %568 = getelementptr inbounds nuw %struct.CacheNode, ptr %567, i32 0, i32 2
  store i64 %566, ptr %568, align 8
  %569 = load ptr, ptr %7, align 8
  %570 = getelementptr inbounds nuw %struct.CacheNode, ptr %569, i32 0, i32 3
  store ptr null, ptr %570, align 8
  %571 = load ptr, ptr %7, align 8
  %572 = getelementptr inbounds nuw %struct.CacheNode, ptr %571, i32 0, i32 4
  store ptr null, ptr %572, align 8
  br label %573

573:                                              ; preds = %553
  %574 = load ptr, ptr %7, align 8
  %575 = getelementptr inbounds nuw %struct.CacheNode, ptr %574, i32 0, i32 0
  %576 = load ptr, ptr %575, align 8
  %577 = call i64 @strlen(ptr noundef %576)
  %578 = trunc i64 %577 to i32
  store i32 %578, ptr %15, align 4
  br label %579

579:                                              ; preds = %573
  br label %580

580:                                              ; preds = %579
  br label %581

581:                                              ; preds = %580
  %582 = load ptr, ptr %7, align 8
  %583 = getelementptr inbounds nuw %struct.CacheNode, ptr %582, i32 0, i32 0
  %584 = load ptr, ptr %583, align 8
  %585 = getelementptr inbounds i8, ptr %584, i64 0
  store ptr %585, ptr %20, align 8
  store i32 -17973521, ptr %16, align 4
  store i32 -1640531527, ptr %18, align 4
  store i32 -1640531527, ptr %17, align 4
  %586 = load i32, ptr %15, align 4
  store i32 %586, ptr %19, align 4
  br label %587

587:                                              ; preds = %754, %581
  %588 = load i32, ptr %19, align 4
  %589 = icmp uge i32 %588, 12
  br i1 %589, label %590, label %759

590:                                              ; preds = %587
  %591 = load ptr, ptr %20, align 8
  %592 = getelementptr inbounds i8, ptr %591, i64 0
  %593 = load i8, ptr %592, align 1
  %594 = zext i8 %593 to i32
  %595 = load ptr, ptr %20, align 8
  %596 = getelementptr inbounds i8, ptr %595, i64 1
  %597 = load i8, ptr %596, align 1
  %598 = zext i8 %597 to i32
  %599 = shl i32 %598, 8
  %600 = add i32 %594, %599
  %601 = load ptr, ptr %20, align 8
  %602 = getelementptr inbounds i8, ptr %601, i64 2
  %603 = load i8, ptr %602, align 1
  %604 = zext i8 %603 to i32
  %605 = shl i32 %604, 16
  %606 = add i32 %600, %605
  %607 = load ptr, ptr %20, align 8
  %608 = getelementptr inbounds i8, ptr %607, i64 3
  %609 = load i8, ptr %608, align 1
  %610 = zext i8 %609 to i32
  %611 = shl i32 %610, 24
  %612 = add i32 %606, %611
  %613 = load i32, ptr %17, align 4
  %614 = add i32 %613, %612
  store i32 %614, ptr %17, align 4
  %615 = load ptr, ptr %20, align 8
  %616 = getelementptr inbounds i8, ptr %615, i64 4
  %617 = load i8, ptr %616, align 1
  %618 = zext i8 %617 to i32
  %619 = load ptr, ptr %20, align 8
  %620 = getelementptr inbounds i8, ptr %619, i64 5
  %621 = load i8, ptr %620, align 1
  %622 = zext i8 %621 to i32
  %623 = shl i32 %622, 8
  %624 = add i32 %618, %623
  %625 = load ptr, ptr %20, align 8
  %626 = getelementptr inbounds i8, ptr %625, i64 6
  %627 = load i8, ptr %626, align 1
  %628 = zext i8 %627 to i32
  %629 = shl i32 %628, 16
  %630 = add i32 %624, %629
  %631 = load ptr, ptr %20, align 8
  %632 = getelementptr inbounds i8, ptr %631, i64 7
  %633 = load i8, ptr %632, align 1
  %634 = zext i8 %633 to i32
  %635 = shl i32 %634, 24
  %636 = add i32 %630, %635
  %637 = load i32, ptr %18, align 4
  %638 = add i32 %637, %636
  store i32 %638, ptr %18, align 4
  %639 = load ptr, ptr %20, align 8
  %640 = getelementptr inbounds i8, ptr %639, i64 8
  %641 = load i8, ptr %640, align 1
  %642 = zext i8 %641 to i32
  %643 = load ptr, ptr %20, align 8
  %644 = getelementptr inbounds i8, ptr %643, i64 9
  %645 = load i8, ptr %644, align 1
  %646 = zext i8 %645 to i32
  %647 = shl i32 %646, 8
  %648 = add i32 %642, %647
  %649 = load ptr, ptr %20, align 8
  %650 = getelementptr inbounds i8, ptr %649, i64 10
  %651 = load i8, ptr %650, align 1
  %652 = zext i8 %651 to i32
  %653 = shl i32 %652, 16
  %654 = add i32 %648, %653
  %655 = load ptr, ptr %20, align 8
  %656 = getelementptr inbounds i8, ptr %655, i64 11
  %657 = load i8, ptr %656, align 1
  %658 = zext i8 %657 to i32
  %659 = shl i32 %658, 24
  %660 = add i32 %654, %659
  %661 = load i32, ptr %16, align 4
  %662 = add i32 %661, %660
  store i32 %662, ptr %16, align 4
  br label %663

663:                                              ; preds = %590
  %664 = load i32, ptr %18, align 4
  %665 = load i32, ptr %17, align 4
  %666 = sub i32 %665, %664
  store i32 %666, ptr %17, align 4
  %667 = load i32, ptr %16, align 4
  %668 = load i32, ptr %17, align 4
  %669 = sub i32 %668, %667
  store i32 %669, ptr %17, align 4
  %670 = load i32, ptr %16, align 4
  %671 = lshr i32 %670, 13
  %672 = load i32, ptr %17, align 4
  %673 = xor i32 %672, %671
  store i32 %673, ptr %17, align 4
  %674 = load i32, ptr %16, align 4
  %675 = load i32, ptr %18, align 4
  %676 = sub i32 %675, %674
  store i32 %676, ptr %18, align 4
  %677 = load i32, ptr %17, align 4
  %678 = load i32, ptr %18, align 4
  %679 = sub i32 %678, %677
  store i32 %679, ptr %18, align 4
  %680 = load i32, ptr %17, align 4
  %681 = shl i32 %680, 8
  %682 = load i32, ptr %18, align 4
  %683 = xor i32 %682, %681
  store i32 %683, ptr %18, align 4
  %684 = load i32, ptr %17, align 4
  %685 = load i32, ptr %16, align 4
  %686 = sub i32 %685, %684
  store i32 %686, ptr %16, align 4
  %687 = load i32, ptr %18, align 4
  %688 = load i32, ptr %16, align 4
  %689 = sub i32 %688, %687
  store i32 %689, ptr %16, align 4
  %690 = load i32, ptr %18, align 4
  %691 = lshr i32 %690, 13
  %692 = load i32, ptr %16, align 4
  %693 = xor i32 %692, %691
  store i32 %693, ptr %16, align 4
  %694 = load i32, ptr %18, align 4
  %695 = load i32, ptr %17, align 4
  %696 = sub i32 %695, %694
  store i32 %696, ptr %17, align 4
  %697 = load i32, ptr %16, align 4
  %698 = load i32, ptr %17, align 4
  %699 = sub i32 %698, %697
  store i32 %699, ptr %17, align 4
  %700 = load i32, ptr %16, align 4
  %701 = lshr i32 %700, 12
  %702 = load i32, ptr %17, align 4
  %703 = xor i32 %702, %701
  store i32 %703, ptr %17, align 4
  %704 = load i32, ptr %16, align 4
  %705 = load i32, ptr %18, align 4
  %706 = sub i32 %705, %704
  store i32 %706, ptr %18, align 4
  %707 = load i32, ptr %17, align 4
  %708 = load i32, ptr %18, align 4
  %709 = sub i32 %708, %707
  store i32 %709, ptr %18, align 4
  %710 = load i32, ptr %17, align 4
  %711 = shl i32 %710, 16
  %712 = load i32, ptr %18, align 4
  %713 = xor i32 %712, %711
  store i32 %713, ptr %18, align 4
  %714 = load i32, ptr %17, align 4
  %715 = load i32, ptr %16, align 4
  %716 = sub i32 %715, %714
  store i32 %716, ptr %16, align 4
  %717 = load i32, ptr %18, align 4
  %718 = load i32, ptr %16, align 4
  %719 = sub i32 %718, %717
  store i32 %719, ptr %16, align 4
  %720 = load i32, ptr %18, align 4
  %721 = lshr i32 %720, 5
  %722 = load i32, ptr %16, align 4
  %723 = xor i32 %722, %721
  store i32 %723, ptr %16, align 4
  %724 = load i32, ptr %18, align 4
  %725 = load i32, ptr %17, align 4
  %726 = sub i32 %725, %724
  store i32 %726, ptr %17, align 4
  %727 = load i32, ptr %16, align 4
  %728 = load i32, ptr %17, align 4
  %729 = sub i32 %728, %727
  store i32 %729, ptr %17, align 4
  %730 = load i32, ptr %16, align 4
  %731 = lshr i32 %730, 3
  %732 = load i32, ptr %17, align 4
  %733 = xor i32 %732, %731
  store i32 %733, ptr %17, align 4
  %734 = load i32, ptr %16, align 4
  %735 = load i32, ptr %18, align 4
  %736 = sub i32 %735, %734
  store i32 %736, ptr %18, align 4
  %737 = load i32, ptr %17, align 4
  %738 = load i32, ptr %18, align 4
  %739 = sub i32 %738, %737
  store i32 %739, ptr %18, align 4
  %740 = load i32, ptr %17, align 4
  %741 = shl i32 %740, 10
  %742 = load i32, ptr %18, align 4
  %743 = xor i32 %742, %741
  store i32 %743, ptr %18, align 4
  %744 = load i32, ptr %17, align 4
  %745 = load i32, ptr %16, align 4
  %746 = sub i32 %745, %744
  store i32 %746, ptr %16, align 4
  %747 = load i32, ptr %18, align 4
  %748 = load i32, ptr %16, align 4
  %749 = sub i32 %748, %747
  store i32 %749, ptr %16, align 4
  %750 = load i32, ptr %18, align 4
  %751 = lshr i32 %750, 15
  %752 = load i32, ptr %16, align 4
  %753 = xor i32 %752, %751
  store i32 %753, ptr %16, align 4
  br label %754

754:                                              ; preds = %663
  %755 = load ptr, ptr %20, align 8
  %756 = getelementptr inbounds i8, ptr %755, i64 12
  store ptr %756, ptr %20, align 8
  %757 = load i32, ptr %19, align 4
  %758 = sub i32 %757, 12
  store i32 %758, ptr %19, align 4
  br label %587, !llvm.loop !12

759:                                              ; preds = %587
  %760 = load i32, ptr %15, align 4
  %761 = load i32, ptr %16, align 4
  %762 = add i32 %761, %760
  store i32 %762, ptr %16, align 4
  %763 = load i32, ptr %19, align 4
  switch i32 %763, label %850 [
    i32 11, label %764
    i32 10, label %772
    i32 9, label %780
    i32 8, label %788
    i32 7, label %796
    i32 6, label %804
    i32 5, label %812
    i32 4, label %819
    i32 3, label %827
    i32 2, label %835
    i32 1, label %843
  ]

764:                                              ; preds = %759
  %765 = load ptr, ptr %20, align 8
  %766 = getelementptr inbounds i8, ptr %765, i64 10
  %767 = load i8, ptr %766, align 1
  %768 = zext i8 %767 to i32
  %769 = shl i32 %768, 24
  %770 = load i32, ptr %16, align 4
  %771 = add i32 %770, %769
  store i32 %771, ptr %16, align 4
  br label %772

772:                                              ; preds = %759, %764
  %773 = load ptr, ptr %20, align 8
  %774 = getelementptr inbounds i8, ptr %773, i64 9
  %775 = load i8, ptr %774, align 1
  %776 = zext i8 %775 to i32
  %777 = shl i32 %776, 16
  %778 = load i32, ptr %16, align 4
  %779 = add i32 %778, %777
  store i32 %779, ptr %16, align 4
  br label %780

780:                                              ; preds = %759, %772
  %781 = load ptr, ptr %20, align 8
  %782 = getelementptr inbounds i8, ptr %781, i64 8
  %783 = load i8, ptr %782, align 1
  %784 = zext i8 %783 to i32
  %785 = shl i32 %784, 8
  %786 = load i32, ptr %16, align 4
  %787 = add i32 %786, %785
  store i32 %787, ptr %16, align 4
  br label %788

788:                                              ; preds = %759, %780
  %789 = load ptr, ptr %20, align 8
  %790 = getelementptr inbounds i8, ptr %789, i64 7
  %791 = load i8, ptr %790, align 1
  %792 = zext i8 %791 to i32
  %793 = shl i32 %792, 24
  %794 = load i32, ptr %18, align 4
  %795 = add i32 %794, %793
  store i32 %795, ptr %18, align 4
  br label %796

796:                                              ; preds = %759, %788
  %797 = load ptr, ptr %20, align 8
  %798 = getelementptr inbounds i8, ptr %797, i64 6
  %799 = load i8, ptr %798, align 1
  %800 = zext i8 %799 to i32
  %801 = shl i32 %800, 16
  %802 = load i32, ptr %18, align 4
  %803 = add i32 %802, %801
  store i32 %803, ptr %18, align 4
  br label %804

804:                                              ; preds = %759, %796
  %805 = load ptr, ptr %20, align 8
  %806 = getelementptr inbounds i8, ptr %805, i64 5
  %807 = load i8, ptr %806, align 1
  %808 = zext i8 %807 to i32
  %809 = shl i32 %808, 8
  %810 = load i32, ptr %18, align 4
  %811 = add i32 %810, %809
  store i32 %811, ptr %18, align 4
  br label %812

812:                                              ; preds = %759, %804
  %813 = load ptr, ptr %20, align 8
  %814 = getelementptr inbounds i8, ptr %813, i64 4
  %815 = load i8, ptr %814, align 1
  %816 = zext i8 %815 to i32
  %817 = load i32, ptr %18, align 4
  %818 = add i32 %817, %816
  store i32 %818, ptr %18, align 4
  br label %819

819:                                              ; preds = %759, %812
  %820 = load ptr, ptr %20, align 8
  %821 = getelementptr inbounds i8, ptr %820, i64 3
  %822 = load i8, ptr %821, align 1
  %823 = zext i8 %822 to i32
  %824 = shl i32 %823, 24
  %825 = load i32, ptr %17, align 4
  %826 = add i32 %825, %824
  store i32 %826, ptr %17, align 4
  br label %827

827:                                              ; preds = %759, %819
  %828 = load ptr, ptr %20, align 8
  %829 = getelementptr inbounds i8, ptr %828, i64 2
  %830 = load i8, ptr %829, align 1
  %831 = zext i8 %830 to i32
  %832 = shl i32 %831, 16
  %833 = load i32, ptr %17, align 4
  %834 = add i32 %833, %832
  store i32 %834, ptr %17, align 4
  br label %835

835:                                              ; preds = %759, %827
  %836 = load ptr, ptr %20, align 8
  %837 = getelementptr inbounds i8, ptr %836, i64 1
  %838 = load i8, ptr %837, align 1
  %839 = zext i8 %838 to i32
  %840 = shl i32 %839, 8
  %841 = load i32, ptr %17, align 4
  %842 = add i32 %841, %840
  store i32 %842, ptr %17, align 4
  br label %843

843:                                              ; preds = %759, %835
  %844 = load ptr, ptr %20, align 8
  %845 = getelementptr inbounds i8, ptr %844, i64 0
  %846 = load i8, ptr %845, align 1
  %847 = zext i8 %846 to i32
  %848 = load i32, ptr %17, align 4
  %849 = add i32 %848, %847
  store i32 %849, ptr %17, align 4
  br label %850

850:                                              ; preds = %759, %843
  br label %851

851:                                              ; preds = %850
  br label %852

852:                                              ; preds = %851
  %853 = load i32, ptr %18, align 4
  %854 = load i32, ptr %17, align 4
  %855 = sub i32 %854, %853
  store i32 %855, ptr %17, align 4
  %856 = load i32, ptr %16, align 4
  %857 = load i32, ptr %17, align 4
  %858 = sub i32 %857, %856
  store i32 %858, ptr %17, align 4
  %859 = load i32, ptr %16, align 4
  %860 = lshr i32 %859, 13
  %861 = load i32, ptr %17, align 4
  %862 = xor i32 %861, %860
  store i32 %862, ptr %17, align 4
  %863 = load i32, ptr %16, align 4
  %864 = load i32, ptr %18, align 4
  %865 = sub i32 %864, %863
  store i32 %865, ptr %18, align 4
  %866 = load i32, ptr %17, align 4
  %867 = load i32, ptr %18, align 4
  %868 = sub i32 %867, %866
  store i32 %868, ptr %18, align 4
  %869 = load i32, ptr %17, align 4
  %870 = shl i32 %869, 8
  %871 = load i32, ptr %18, align 4
  %872 = xor i32 %871, %870
  store i32 %872, ptr %18, align 4
  %873 = load i32, ptr %17, align 4
  %874 = load i32, ptr %16, align 4
  %875 = sub i32 %874, %873
  store i32 %875, ptr %16, align 4
  %876 = load i32, ptr %18, align 4
  %877 = load i32, ptr %16, align 4
  %878 = sub i32 %877, %876
  store i32 %878, ptr %16, align 4
  %879 = load i32, ptr %18, align 4
  %880 = lshr i32 %879, 13
  %881 = load i32, ptr %16, align 4
  %882 = xor i32 %881, %880
  store i32 %882, ptr %16, align 4
  %883 = load i32, ptr %18, align 4
  %884 = load i32, ptr %17, align 4
  %885 = sub i32 %884, %883
  store i32 %885, ptr %17, align 4
  %886 = load i32, ptr %16, align 4
  %887 = load i32, ptr %17, align 4
  %888 = sub i32 %887, %886
  store i32 %888, ptr %17, align 4
  %889 = load i32, ptr %16, align 4
  %890 = lshr i32 %889, 12
  %891 = load i32, ptr %17, align 4
  %892 = xor i32 %891, %890
  store i32 %892, ptr %17, align 4
  %893 = load i32, ptr %16, align 4
  %894 = load i32, ptr %18, align 4
  %895 = sub i32 %894, %893
  store i32 %895, ptr %18, align 4
  %896 = load i32, ptr %17, align 4
  %897 = load i32, ptr %18, align 4
  %898 = sub i32 %897, %896
  store i32 %898, ptr %18, align 4
  %899 = load i32, ptr %17, align 4
  %900 = shl i32 %899, 16
  %901 = load i32, ptr %18, align 4
  %902 = xor i32 %901, %900
  store i32 %902, ptr %18, align 4
  %903 = load i32, ptr %17, align 4
  %904 = load i32, ptr %16, align 4
  %905 = sub i32 %904, %903
  store i32 %905, ptr %16, align 4
  %906 = load i32, ptr %18, align 4
  %907 = load i32, ptr %16, align 4
  %908 = sub i32 %907, %906
  store i32 %908, ptr %16, align 4
  %909 = load i32, ptr %18, align 4
  %910 = lshr i32 %909, 5
  %911 = load i32, ptr %16, align 4
  %912 = xor i32 %911, %910
  store i32 %912, ptr %16, align 4
  %913 = load i32, ptr %18, align 4
  %914 = load i32, ptr %17, align 4
  %915 = sub i32 %914, %913
  store i32 %915, ptr %17, align 4
  %916 = load i32, ptr %16, align 4
  %917 = load i32, ptr %17, align 4
  %918 = sub i32 %917, %916
  store i32 %918, ptr %17, align 4
  %919 = load i32, ptr %16, align 4
  %920 = lshr i32 %919, 3
  %921 = load i32, ptr %17, align 4
  %922 = xor i32 %921, %920
  store i32 %922, ptr %17, align 4
  %923 = load i32, ptr %16, align 4
  %924 = load i32, ptr %18, align 4
  %925 = sub i32 %924, %923
  store i32 %925, ptr %18, align 4
  %926 = load i32, ptr %17, align 4
  %927 = load i32, ptr %18, align 4
  %928 = sub i32 %927, %926
  store i32 %928, ptr %18, align 4
  %929 = load i32, ptr %17, align 4
  %930 = shl i32 %929, 10
  %931 = load i32, ptr %18, align 4
  %932 = xor i32 %931, %930
  store i32 %932, ptr %18, align 4
  %933 = load i32, ptr %17, align 4
  %934 = load i32, ptr %16, align 4
  %935 = sub i32 %934, %933
  store i32 %935, ptr %16, align 4
  %936 = load i32, ptr %18, align 4
  %937 = load i32, ptr %16, align 4
  %938 = sub i32 %937, %936
  store i32 %938, ptr %16, align 4
  %939 = load i32, ptr %18, align 4
  %940 = lshr i32 %939, 15
  %941 = load i32, ptr %16, align 4
  %942 = xor i32 %941, %940
  store i32 %942, ptr %16, align 4
  br label %943

943:                                              ; preds = %852
  br label %944

944:                                              ; preds = %943
  br label %945

945:                                              ; preds = %944
  br label %946

946:                                              ; preds = %945
  %947 = load i32, ptr %16, align 4
  %948 = load ptr, ptr %7, align 8
  %949 = getelementptr inbounds nuw %struct.CacheNode, ptr %948, i32 0, i32 5
  %950 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %949, i32 0, i32 7
  store i32 %947, ptr %950, align 4
  %951 = load ptr, ptr %7, align 8
  %952 = getelementptr inbounds nuw %struct.CacheNode, ptr %951, i32 0, i32 0
  %953 = load ptr, ptr %952, align 8
  %954 = getelementptr inbounds i8, ptr %953, i64 0
  %955 = load ptr, ptr %7, align 8
  %956 = getelementptr inbounds nuw %struct.CacheNode, ptr %955, i32 0, i32 5
  %957 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %956, i32 0, i32 5
  store ptr %954, ptr %957, align 8
  %958 = load i32, ptr %15, align 4
  %959 = load ptr, ptr %7, align 8
  %960 = getelementptr inbounds nuw %struct.CacheNode, ptr %959, i32 0, i32 5
  %961 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %960, i32 0, i32 6
  store i32 %958, ptr %961, align 8
  %962 = load ptr, ptr %4, align 8
  %963 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %962, i32 0, i32 2
  %964 = load ptr, ptr %963, align 8
  %965 = icmp ne ptr %964, null
  br i1 %965, label %1049, label %966

966:                                              ; preds = %946
  %967 = load ptr, ptr %7, align 8
  %968 = getelementptr inbounds nuw %struct.CacheNode, ptr %967, i32 0, i32 5
  %969 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %968, i32 0, i32 2
  store ptr null, ptr %969, align 8
  %970 = load ptr, ptr %7, align 8
  %971 = getelementptr inbounds nuw %struct.CacheNode, ptr %970, i32 0, i32 5
  %972 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %971, i32 0, i32 1
  store ptr null, ptr %972, align 8
  br label %973

973:                                              ; preds = %966
  %974 = call noalias ptr @malloc(i64 noundef 64)
  %975 = load ptr, ptr %7, align 8
  %976 = getelementptr inbounds nuw %struct.CacheNode, ptr %975, i32 0, i32 5
  %977 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %976, i32 0, i32 0
  store ptr %974, ptr %977, align 8
  %978 = load ptr, ptr %7, align 8
  %979 = getelementptr inbounds nuw %struct.CacheNode, ptr %978, i32 0, i32 5
  %980 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %979, i32 0, i32 0
  %981 = load ptr, ptr %980, align 8
  %982 = icmp ne ptr %981, null
  br i1 %982, label %984, label %983

983:                                              ; preds = %973
  call void @exit(i32 noundef -1)
  unreachable

984:                                              ; preds = %973
  %985 = load ptr, ptr %7, align 8
  %986 = getelementptr inbounds nuw %struct.CacheNode, ptr %985, i32 0, i32 5
  %987 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %986, i32 0, i32 0
  %988 = load ptr, ptr %987, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %988, i8 0, i64 64, i1 false)
  %989 = load ptr, ptr %7, align 8
  %990 = getelementptr inbounds nuw %struct.CacheNode, ptr %989, i32 0, i32 5
  %991 = load ptr, ptr %7, align 8
  %992 = getelementptr inbounds nuw %struct.CacheNode, ptr %991, i32 0, i32 5
  %993 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %992, i32 0, i32 0
  %994 = load ptr, ptr %993, align 8
  %995 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %994, i32 0, i32 4
  store ptr %990, ptr %995, align 8
  %996 = load ptr, ptr %7, align 8
  %997 = getelementptr inbounds nuw %struct.CacheNode, ptr %996, i32 0, i32 5
  %998 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %997, i32 0, i32 0
  %999 = load ptr, ptr %998, align 8
  %1000 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %999, i32 0, i32 1
  store i32 32, ptr %1000, align 8
  %1001 = load ptr, ptr %7, align 8
  %1002 = getelementptr inbounds nuw %struct.CacheNode, ptr %1001, i32 0, i32 5
  %1003 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1002, i32 0, i32 0
  %1004 = load ptr, ptr %1003, align 8
  %1005 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1004, i32 0, i32 2
  store i32 5, ptr %1005, align 4
  %1006 = load ptr, ptr %7, align 8
  %1007 = getelementptr inbounds nuw %struct.CacheNode, ptr %1006, i32 0, i32 5
  %1008 = load ptr, ptr %7, align 8
  %1009 = ptrtoint ptr %1007 to i64
  %1010 = ptrtoint ptr %1008 to i64
  %1011 = sub i64 %1009, %1010
  %1012 = load ptr, ptr %7, align 8
  %1013 = getelementptr inbounds nuw %struct.CacheNode, ptr %1012, i32 0, i32 5
  %1014 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1013, i32 0, i32 0
  %1015 = load ptr, ptr %1014, align 8
  %1016 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1015, i32 0, i32 5
  store i64 %1011, ptr %1016, align 8
  %1017 = call noalias ptr @malloc(i64 noundef 512)
  %1018 = load ptr, ptr %7, align 8
  %1019 = getelementptr inbounds nuw %struct.CacheNode, ptr %1018, i32 0, i32 5
  %1020 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1019, i32 0, i32 0
  %1021 = load ptr, ptr %1020, align 8
  %1022 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1021, i32 0, i32 0
  store ptr %1017, ptr %1022, align 8
  %1023 = load ptr, ptr %7, align 8
  %1024 = getelementptr inbounds nuw %struct.CacheNode, ptr %1023, i32 0, i32 5
  %1025 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1024, i32 0, i32 0
  %1026 = load ptr, ptr %1025, align 8
  %1027 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1026, i32 0, i32 10
  store i32 -1609490463, ptr %1027, align 8
  %1028 = load ptr, ptr %7, align 8
  %1029 = getelementptr inbounds nuw %struct.CacheNode, ptr %1028, i32 0, i32 5
  %1030 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1029, i32 0, i32 0
  %1031 = load ptr, ptr %1030, align 8
  %1032 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1031, i32 0, i32 0
  %1033 = load ptr, ptr %1032, align 8
  %1034 = icmp ne ptr %1033, null
  br i1 %1034, label %1036, label %1035

1035:                                             ; preds = %984
  call void @exit(i32 noundef -1)
  unreachable

1036:                                             ; preds = %984
  %1037 = load ptr, ptr %7, align 8
  %1038 = getelementptr inbounds nuw %struct.CacheNode, ptr %1037, i32 0, i32 5
  %1039 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1038, i32 0, i32 0
  %1040 = load ptr, ptr %1039, align 8
  %1041 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1040, i32 0, i32 0
  %1042 = load ptr, ptr %1041, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %1042, i8 0, i64 512, i1 false)
  br label %1043

1043:                                             ; preds = %1036
  br label %1044

1044:                                             ; preds = %1043
  br label %1045

1045:                                             ; preds = %1044
  %1046 = load ptr, ptr %7, align 8
  %1047 = load ptr, ptr %4, align 8
  %1048 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1047, i32 0, i32 2
  store ptr %1046, ptr %1048, align 8
  br label %1104

1049:                                             ; preds = %946
  %1050 = load ptr, ptr %4, align 8
  %1051 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1050, i32 0, i32 2
  %1052 = load ptr, ptr %1051, align 8
  %1053 = getelementptr inbounds nuw %struct.CacheNode, ptr %1052, i32 0, i32 5
  %1054 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1053, i32 0, i32 0
  %1055 = load ptr, ptr %1054, align 8
  %1056 = load ptr, ptr %7, align 8
  %1057 = getelementptr inbounds nuw %struct.CacheNode, ptr %1056, i32 0, i32 5
  %1058 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1057, i32 0, i32 0
  store ptr %1055, ptr %1058, align 8
  br label %1059

1059:                                             ; preds = %1049
  %1060 = load ptr, ptr %7, align 8
  %1061 = getelementptr inbounds nuw %struct.CacheNode, ptr %1060, i32 0, i32 5
  %1062 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1061, i32 0, i32 2
  store ptr null, ptr %1062, align 8
  %1063 = load ptr, ptr %4, align 8
  %1064 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1063, i32 0, i32 2
  %1065 = load ptr, ptr %1064, align 8
  %1066 = getelementptr inbounds nuw %struct.CacheNode, ptr %1065, i32 0, i32 5
  %1067 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1066, i32 0, i32 0
  %1068 = load ptr, ptr %1067, align 8
  %1069 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1068, i32 0, i32 4
  %1070 = load ptr, ptr %1069, align 8
  %1071 = load ptr, ptr %4, align 8
  %1072 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1071, i32 0, i32 2
  %1073 = load ptr, ptr %1072, align 8
  %1074 = getelementptr inbounds nuw %struct.CacheNode, ptr %1073, i32 0, i32 5
  %1075 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1074, i32 0, i32 0
  %1076 = load ptr, ptr %1075, align 8
  %1077 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1076, i32 0, i32 5
  %1078 = load i64, ptr %1077, align 8
  %1079 = sub i64 0, %1078
  %1080 = getelementptr inbounds i8, ptr %1070, i64 %1079
  %1081 = load ptr, ptr %7, align 8
  %1082 = getelementptr inbounds nuw %struct.CacheNode, ptr %1081, i32 0, i32 5
  %1083 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1082, i32 0, i32 1
  store ptr %1080, ptr %1083, align 8
  %1084 = load ptr, ptr %7, align 8
  %1085 = load ptr, ptr %4, align 8
  %1086 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1085, i32 0, i32 2
  %1087 = load ptr, ptr %1086, align 8
  %1088 = getelementptr inbounds nuw %struct.CacheNode, ptr %1087, i32 0, i32 5
  %1089 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1088, i32 0, i32 0
  %1090 = load ptr, ptr %1089, align 8
  %1091 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1090, i32 0, i32 4
  %1092 = load ptr, ptr %1091, align 8
  %1093 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1092, i32 0, i32 2
  store ptr %1084, ptr %1093, align 8
  %1094 = load ptr, ptr %7, align 8
  %1095 = getelementptr inbounds nuw %struct.CacheNode, ptr %1094, i32 0, i32 5
  %1096 = load ptr, ptr %4, align 8
  %1097 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1096, i32 0, i32 2
  %1098 = load ptr, ptr %1097, align 8
  %1099 = getelementptr inbounds nuw %struct.CacheNode, ptr %1098, i32 0, i32 5
  %1100 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1099, i32 0, i32 0
  %1101 = load ptr, ptr %1100, align 8
  %1102 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1101, i32 0, i32 4
  store ptr %1095, ptr %1102, align 8
  br label %1103

1103:                                             ; preds = %1059
  br label %1104

1104:                                             ; preds = %1103, %1045
  br label %1105

1105:                                             ; preds = %1104
  %1106 = load ptr, ptr %4, align 8
  %1107 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1106, i32 0, i32 2
  %1108 = load ptr, ptr %1107, align 8
  %1109 = getelementptr inbounds nuw %struct.CacheNode, ptr %1108, i32 0, i32 5
  %1110 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1109, i32 0, i32 0
  %1111 = load ptr, ptr %1110, align 8
  %1112 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1111, i32 0, i32 3
  %1113 = load i32, ptr %1112, align 8
  %1114 = add i32 %1113, 1
  store i32 %1114, ptr %1112, align 8
  br label %1115

1115:                                             ; preds = %1105
  %1116 = load i32, ptr %16, align 4
  %1117 = load ptr, ptr %4, align 8
  %1118 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1117, i32 0, i32 2
  %1119 = load ptr, ptr %1118, align 8
  %1120 = getelementptr inbounds nuw %struct.CacheNode, ptr %1119, i32 0, i32 5
  %1121 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1120, i32 0, i32 0
  %1122 = load ptr, ptr %1121, align 8
  %1123 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1122, i32 0, i32 1
  %1124 = load i32, ptr %1123, align 8
  %1125 = sub i32 %1124, 1
  %1126 = and i32 %1116, %1125
  store i32 %1126, ptr %21, align 4
  br label %1127

1127:                                             ; preds = %1115
  br label %1128

1128:                                             ; preds = %1127
  %1129 = load ptr, ptr %4, align 8
  %1130 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1129, i32 0, i32 2
  %1131 = load ptr, ptr %1130, align 8
  %1132 = getelementptr inbounds nuw %struct.CacheNode, ptr %1131, i32 0, i32 5
  %1133 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1132, i32 0, i32 0
  %1134 = load ptr, ptr %1133, align 8
  %1135 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1134, i32 0, i32 0
  %1136 = load ptr, ptr %1135, align 8
  %1137 = load i32, ptr %21, align 4
  %1138 = zext i32 %1137 to i64
  %1139 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1136, i64 %1138
  store ptr %1139, ptr %22, align 8
  %1140 = load ptr, ptr %22, align 8
  %1141 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1140, i32 0, i32 1
  %1142 = load i32, ptr %1141, align 8
  %1143 = add i32 %1142, 1
  store i32 %1143, ptr %1141, align 8
  %1144 = load ptr, ptr %22, align 8
  %1145 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1144, i32 0, i32 0
  %1146 = load ptr, ptr %1145, align 8
  %1147 = load ptr, ptr %7, align 8
  %1148 = getelementptr inbounds nuw %struct.CacheNode, ptr %1147, i32 0, i32 5
  %1149 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1148, i32 0, i32 4
  store ptr %1146, ptr %1149, align 8
  %1150 = load ptr, ptr %7, align 8
  %1151 = getelementptr inbounds nuw %struct.CacheNode, ptr %1150, i32 0, i32 5
  %1152 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1151, i32 0, i32 3
  store ptr null, ptr %1152, align 8
  %1153 = load ptr, ptr %22, align 8
  %1154 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1153, i32 0, i32 0
  %1155 = load ptr, ptr %1154, align 8
  %1156 = icmp ne ptr %1155, null
  br i1 %1156, label %1157, label %1164

1157:                                             ; preds = %1128
  %1158 = load ptr, ptr %7, align 8
  %1159 = getelementptr inbounds nuw %struct.CacheNode, ptr %1158, i32 0, i32 5
  %1160 = load ptr, ptr %22, align 8
  %1161 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1160, i32 0, i32 0
  %1162 = load ptr, ptr %1161, align 8
  %1163 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1162, i32 0, i32 3
  store ptr %1159, ptr %1163, align 8
  br label %1164

1164:                                             ; preds = %1157, %1128
  %1165 = load ptr, ptr %7, align 8
  %1166 = getelementptr inbounds nuw %struct.CacheNode, ptr %1165, i32 0, i32 5
  %1167 = load ptr, ptr %22, align 8
  %1168 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1167, i32 0, i32 0
  store ptr %1166, ptr %1168, align 8
  %1169 = load ptr, ptr %22, align 8
  %1170 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1169, i32 0, i32 1
  %1171 = load i32, ptr %1170, align 8
  %1172 = load ptr, ptr %22, align 8
  %1173 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1172, i32 0, i32 2
  %1174 = load i32, ptr %1173, align 4
  %1175 = add i32 %1174, 1
  %1176 = mul i32 %1175, 10
  %1177 = icmp uge i32 %1171, %1176
  br i1 %1177, label %1178, label %1440

1178:                                             ; preds = %1164
  %1179 = load ptr, ptr %7, align 8
  %1180 = getelementptr inbounds nuw %struct.CacheNode, ptr %1179, i32 0, i32 5
  %1181 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1180, i32 0, i32 0
  %1182 = load ptr, ptr %1181, align 8
  %1183 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1182, i32 0, i32 9
  %1184 = load i32, ptr %1183, align 4
  %1185 = icmp ne i32 %1184, 0
  br i1 %1185, label %1440, label %1186

1186:                                             ; preds = %1178
  br label %1187

1187:                                             ; preds = %1186
  %1188 = load ptr, ptr %7, align 8
  %1189 = getelementptr inbounds nuw %struct.CacheNode, ptr %1188, i32 0, i32 5
  %1190 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1189, i32 0, i32 0
  %1191 = load ptr, ptr %1190, align 8
  %1192 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1191, i32 0, i32 1
  %1193 = load i32, ptr %1192, align 8
  %1194 = zext i32 %1193 to i64
  %1195 = mul i64 16, %1194
  %1196 = mul i64 %1195, 2
  %1197 = call noalias ptr @malloc(i64 noundef %1196)
  store ptr %1197, ptr %27, align 8
  %1198 = load ptr, ptr %27, align 8
  %1199 = icmp ne ptr %1198, null
  br i1 %1199, label %1201, label %1200

1200:                                             ; preds = %1187
  call void @exit(i32 noundef -1)
  unreachable

1201:                                             ; preds = %1187
  %1202 = load ptr, ptr %27, align 8
  %1203 = load ptr, ptr %7, align 8
  %1204 = getelementptr inbounds nuw %struct.CacheNode, ptr %1203, i32 0, i32 5
  %1205 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1204, i32 0, i32 0
  %1206 = load ptr, ptr %1205, align 8
  %1207 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1206, i32 0, i32 1
  %1208 = load i32, ptr %1207, align 8
  %1209 = zext i32 %1208 to i64
  %1210 = mul i64 16, %1209
  %1211 = mul i64 %1210, 2
  call void @llvm.memset.p0.i64(ptr align 8 %1202, i8 0, i64 %1211, i1 false)
  %1212 = load ptr, ptr %7, align 8
  %1213 = getelementptr inbounds nuw %struct.CacheNode, ptr %1212, i32 0, i32 5
  %1214 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1213, i32 0, i32 0
  %1215 = load ptr, ptr %1214, align 8
  %1216 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1215, i32 0, i32 3
  %1217 = load i32, ptr %1216, align 8
  %1218 = load ptr, ptr %7, align 8
  %1219 = getelementptr inbounds nuw %struct.CacheNode, ptr %1218, i32 0, i32 5
  %1220 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1219, i32 0, i32 0
  %1221 = load ptr, ptr %1220, align 8
  %1222 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1221, i32 0, i32 2
  %1223 = load i32, ptr %1222, align 4
  %1224 = add i32 %1223, 1
  %1225 = lshr i32 %1217, %1224
  %1226 = load ptr, ptr %7, align 8
  %1227 = getelementptr inbounds nuw %struct.CacheNode, ptr %1226, i32 0, i32 5
  %1228 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1227, i32 0, i32 0
  %1229 = load ptr, ptr %1228, align 8
  %1230 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1229, i32 0, i32 3
  %1231 = load i32, ptr %1230, align 8
  %1232 = load ptr, ptr %7, align 8
  %1233 = getelementptr inbounds nuw %struct.CacheNode, ptr %1232, i32 0, i32 5
  %1234 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1233, i32 0, i32 0
  %1235 = load ptr, ptr %1234, align 8
  %1236 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1235, i32 0, i32 1
  %1237 = load i32, ptr %1236, align 8
  %1238 = mul i32 %1237, 2
  %1239 = sub i32 %1238, 1
  %1240 = and i32 %1231, %1239
  %1241 = icmp ne i32 %1240, 0
  %1242 = zext i1 %1241 to i64
  %1243 = select i1 %1241, i32 1, i32 0
  %1244 = add i32 %1225, %1243
  %1245 = load ptr, ptr %7, align 8
  %1246 = getelementptr inbounds nuw %struct.CacheNode, ptr %1245, i32 0, i32 5
  %1247 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1246, i32 0, i32 0
  %1248 = load ptr, ptr %1247, align 8
  %1249 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1248, i32 0, i32 6
  store i32 %1244, ptr %1249, align 8
  %1250 = load ptr, ptr %7, align 8
  %1251 = getelementptr inbounds nuw %struct.CacheNode, ptr %1250, i32 0, i32 5
  %1252 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1251, i32 0, i32 0
  %1253 = load ptr, ptr %1252, align 8
  %1254 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1253, i32 0, i32 7
  store i32 0, ptr %1254, align 4
  store i32 0, ptr %24, align 4
  br label %1255

1255:                                             ; preds = %1364, %1201
  %1256 = load i32, ptr %24, align 4
  %1257 = load ptr, ptr %7, align 8
  %1258 = getelementptr inbounds nuw %struct.CacheNode, ptr %1257, i32 0, i32 5
  %1259 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1258, i32 0, i32 0
  %1260 = load ptr, ptr %1259, align 8
  %1261 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1260, i32 0, i32 1
  %1262 = load i32, ptr %1261, align 8
  %1263 = icmp ult i32 %1256, %1262
  br i1 %1263, label %1264, label %1367

1264:                                             ; preds = %1255
  %1265 = load ptr, ptr %7, align 8
  %1266 = getelementptr inbounds nuw %struct.CacheNode, ptr %1265, i32 0, i32 5
  %1267 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1266, i32 0, i32 0
  %1268 = load ptr, ptr %1267, align 8
  %1269 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1268, i32 0, i32 0
  %1270 = load ptr, ptr %1269, align 8
  %1271 = load i32, ptr %24, align 4
  %1272 = zext i32 %1271 to i64
  %1273 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1270, i64 %1272
  %1274 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1273, i32 0, i32 0
  %1275 = load ptr, ptr %1274, align 8
  store ptr %1275, ptr %25, align 8
  br label %1276

1276:                                             ; preds = %1358, %1264
  %1277 = load ptr, ptr %25, align 8
  %1278 = icmp ne ptr %1277, null
  br i1 %1278, label %1279, label %1363

1279:                                             ; preds = %1276
  %1280 = load ptr, ptr %25, align 8
  %1281 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1280, i32 0, i32 4
  %1282 = load ptr, ptr %1281, align 8
  store ptr %1282, ptr %26, align 8
  br label %1283

1283:                                             ; preds = %1279
  %1284 = load ptr, ptr %25, align 8
  %1285 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1284, i32 0, i32 7
  %1286 = load i32, ptr %1285, align 4
  %1287 = load ptr, ptr %7, align 8
  %1288 = getelementptr inbounds nuw %struct.CacheNode, ptr %1287, i32 0, i32 5
  %1289 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1288, i32 0, i32 0
  %1290 = load ptr, ptr %1289, align 8
  %1291 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1290, i32 0, i32 1
  %1292 = load i32, ptr %1291, align 8
  %1293 = mul i32 %1292, 2
  %1294 = sub i32 %1293, 1
  %1295 = and i32 %1286, %1294
  store i32 %1295, ptr %23, align 4
  br label %1296

1296:                                             ; preds = %1283
  %1297 = load ptr, ptr %27, align 8
  %1298 = load i32, ptr %23, align 4
  %1299 = zext i32 %1298 to i64
  %1300 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1297, i64 %1299
  store ptr %1300, ptr %28, align 8
  %1301 = load ptr, ptr %28, align 8
  %1302 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1301, i32 0, i32 1
  %1303 = load i32, ptr %1302, align 8
  %1304 = add i32 %1303, 1
  store i32 %1304, ptr %1302, align 8
  %1305 = load ptr, ptr %7, align 8
  %1306 = getelementptr inbounds nuw %struct.CacheNode, ptr %1305, i32 0, i32 5
  %1307 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1306, i32 0, i32 0
  %1308 = load ptr, ptr %1307, align 8
  %1309 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1308, i32 0, i32 6
  %1310 = load i32, ptr %1309, align 8
  %1311 = icmp ugt i32 %1304, %1310
  br i1 %1311, label %1312, label %1340

1312:                                             ; preds = %1296
  %1313 = load ptr, ptr %7, align 8
  %1314 = getelementptr inbounds nuw %struct.CacheNode, ptr %1313, i32 0, i32 5
  %1315 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1314, i32 0, i32 0
  %1316 = load ptr, ptr %1315, align 8
  %1317 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1316, i32 0, i32 7
  %1318 = load i32, ptr %1317, align 4
  %1319 = add i32 %1318, 1
  store i32 %1319, ptr %1317, align 4
  %1320 = load ptr, ptr %28, align 8
  %1321 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1320, i32 0, i32 1
  %1322 = load i32, ptr %1321, align 8
  %1323 = load ptr, ptr %28, align 8
  %1324 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1323, i32 0, i32 2
  %1325 = load i32, ptr %1324, align 4
  %1326 = load ptr, ptr %7, align 8
  %1327 = getelementptr inbounds nuw %struct.CacheNode, ptr %1326, i32 0, i32 5
  %1328 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1327, i32 0, i32 0
  %1329 = load ptr, ptr %1328, align 8
  %1330 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1329, i32 0, i32 6
  %1331 = load i32, ptr %1330, align 8
  %1332 = mul i32 %1325, %1331
  %1333 = icmp ugt i32 %1322, %1332
  br i1 %1333, label %1334, label %1339

1334:                                             ; preds = %1312
  %1335 = load ptr, ptr %28, align 8
  %1336 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1335, i32 0, i32 2
  %1337 = load i32, ptr %1336, align 4
  %1338 = add i32 %1337, 1
  store i32 %1338, ptr %1336, align 4
  br label %1339

1339:                                             ; preds = %1334, %1312
  br label %1340

1340:                                             ; preds = %1339, %1296
  %1341 = load ptr, ptr %25, align 8
  %1342 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1341, i32 0, i32 3
  store ptr null, ptr %1342, align 8
  %1343 = load ptr, ptr %28, align 8
  %1344 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1343, i32 0, i32 0
  %1345 = load ptr, ptr %1344, align 8
  %1346 = load ptr, ptr %25, align 8
  %1347 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1346, i32 0, i32 4
  store ptr %1345, ptr %1347, align 8
  %1348 = load ptr, ptr %28, align 8
  %1349 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1348, i32 0, i32 0
  %1350 = load ptr, ptr %1349, align 8
  %1351 = icmp ne ptr %1350, null
  br i1 %1351, label %1352, label %1358

1352:                                             ; preds = %1340
  %1353 = load ptr, ptr %25, align 8
  %1354 = load ptr, ptr %28, align 8
  %1355 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1354, i32 0, i32 0
  %1356 = load ptr, ptr %1355, align 8
  %1357 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1356, i32 0, i32 3
  store ptr %1353, ptr %1357, align 8
  br label %1358

1358:                                             ; preds = %1352, %1340
  %1359 = load ptr, ptr %25, align 8
  %1360 = load ptr, ptr %28, align 8
  %1361 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1360, i32 0, i32 0
  store ptr %1359, ptr %1361, align 8
  %1362 = load ptr, ptr %26, align 8
  store ptr %1362, ptr %25, align 8
  br label %1276, !llvm.loop !13

1363:                                             ; preds = %1276
  br label %1364

1364:                                             ; preds = %1363
  %1365 = load i32, ptr %24, align 4
  %1366 = add i32 %1365, 1
  store i32 %1366, ptr %24, align 4
  br label %1255, !llvm.loop !14

1367:                                             ; preds = %1255
  %1368 = load ptr, ptr %7, align 8
  %1369 = getelementptr inbounds nuw %struct.CacheNode, ptr %1368, i32 0, i32 5
  %1370 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1369, i32 0, i32 0
  %1371 = load ptr, ptr %1370, align 8
  %1372 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1371, i32 0, i32 0
  %1373 = load ptr, ptr %1372, align 8
  call void @free(ptr noundef %1373)
  %1374 = load ptr, ptr %7, align 8
  %1375 = getelementptr inbounds nuw %struct.CacheNode, ptr %1374, i32 0, i32 5
  %1376 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1375, i32 0, i32 0
  %1377 = load ptr, ptr %1376, align 8
  %1378 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1377, i32 0, i32 1
  %1379 = load i32, ptr %1378, align 8
  %1380 = mul i32 %1379, 2
  store i32 %1380, ptr %1378, align 8
  %1381 = load ptr, ptr %7, align 8
  %1382 = getelementptr inbounds nuw %struct.CacheNode, ptr %1381, i32 0, i32 5
  %1383 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1382, i32 0, i32 0
  %1384 = load ptr, ptr %1383, align 8
  %1385 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1384, i32 0, i32 2
  %1386 = load i32, ptr %1385, align 4
  %1387 = add i32 %1386, 1
  store i32 %1387, ptr %1385, align 4
  %1388 = load ptr, ptr %27, align 8
  %1389 = load ptr, ptr %7, align 8
  %1390 = getelementptr inbounds nuw %struct.CacheNode, ptr %1389, i32 0, i32 5
  %1391 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1390, i32 0, i32 0
  %1392 = load ptr, ptr %1391, align 8
  %1393 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1392, i32 0, i32 0
  store ptr %1388, ptr %1393, align 8
  %1394 = load ptr, ptr %7, align 8
  %1395 = getelementptr inbounds nuw %struct.CacheNode, ptr %1394, i32 0, i32 5
  %1396 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1395, i32 0, i32 0
  %1397 = load ptr, ptr %1396, align 8
  %1398 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1397, i32 0, i32 7
  %1399 = load i32, ptr %1398, align 4
  %1400 = load ptr, ptr %7, align 8
  %1401 = getelementptr inbounds nuw %struct.CacheNode, ptr %1400, i32 0, i32 5
  %1402 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1401, i32 0, i32 0
  %1403 = load ptr, ptr %1402, align 8
  %1404 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1403, i32 0, i32 3
  %1405 = load i32, ptr %1404, align 8
  %1406 = lshr i32 %1405, 1
  %1407 = icmp ugt i32 %1399, %1406
  br i1 %1407, label %1408, label %1416

1408:                                             ; preds = %1367
  %1409 = load ptr, ptr %7, align 8
  %1410 = getelementptr inbounds nuw %struct.CacheNode, ptr %1409, i32 0, i32 5
  %1411 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1410, i32 0, i32 0
  %1412 = load ptr, ptr %1411, align 8
  %1413 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1412, i32 0, i32 8
  %1414 = load i32, ptr %1413, align 8
  %1415 = add i32 %1414, 1
  br label %1417

1416:                                             ; preds = %1367
  br label %1417

1417:                                             ; preds = %1416, %1408
  %1418 = phi i32 [ %1415, %1408 ], [ 0, %1416 ]
  %1419 = load ptr, ptr %7, align 8
  %1420 = getelementptr inbounds nuw %struct.CacheNode, ptr %1419, i32 0, i32 5
  %1421 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1420, i32 0, i32 0
  %1422 = load ptr, ptr %1421, align 8
  %1423 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1422, i32 0, i32 8
  store i32 %1418, ptr %1423, align 8
  %1424 = load ptr, ptr %7, align 8
  %1425 = getelementptr inbounds nuw %struct.CacheNode, ptr %1424, i32 0, i32 5
  %1426 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1425, i32 0, i32 0
  %1427 = load ptr, ptr %1426, align 8
  %1428 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1427, i32 0, i32 8
  %1429 = load i32, ptr %1428, align 8
  %1430 = icmp ugt i32 %1429, 1
  br i1 %1430, label %1431, label %1437

1431:                                             ; preds = %1417
  %1432 = load ptr, ptr %7, align 8
  %1433 = getelementptr inbounds nuw %struct.CacheNode, ptr %1432, i32 0, i32 5
  %1434 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1433, i32 0, i32 0
  %1435 = load ptr, ptr %1434, align 8
  %1436 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1435, i32 0, i32 9
  store i32 1, ptr %1436, align 4
  br label %1437

1437:                                             ; preds = %1431, %1417
  br label %1438

1438:                                             ; preds = %1437
  br label %1439

1439:                                             ; preds = %1438
  br label %1440

1440:                                             ; preds = %1439, %1178, %1164
  br label %1441

1441:                                             ; preds = %1440
  br label %1442

1442:                                             ; preds = %1441
  br label %1443

1443:                                             ; preds = %1442
  br label %1444

1444:                                             ; preds = %1443
  br label %1445

1445:                                             ; preds = %1444
  %1446 = load ptr, ptr %4, align 8
  %1447 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1446, i32 0, i32 0
  %1448 = load ptr, ptr %1447, align 8
  %1449 = load ptr, ptr %7, align 8
  %1450 = getelementptr inbounds nuw %struct.CacheNode, ptr %1449, i32 0, i32 4
  store ptr %1448, ptr %1450, align 8
  %1451 = load ptr, ptr %4, align 8
  %1452 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1451, i32 0, i32 0
  %1453 = load ptr, ptr %1452, align 8
  %1454 = icmp ne ptr %1453, null
  br i1 %1454, label %1455, label %1461

1455:                                             ; preds = %1445
  %1456 = load ptr, ptr %7, align 8
  %1457 = load ptr, ptr %4, align 8
  %1458 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1457, i32 0, i32 0
  %1459 = load ptr, ptr %1458, align 8
  %1460 = getelementptr inbounds nuw %struct.CacheNode, ptr %1459, i32 0, i32 3
  store ptr %1456, ptr %1460, align 8
  br label %1461

1461:                                             ; preds = %1455, %1445
  %1462 = load ptr, ptr %7, align 8
  %1463 = load ptr, ptr %4, align 8
  %1464 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1463, i32 0, i32 0
  store ptr %1462, ptr %1464, align 8
  %1465 = load ptr, ptr %4, align 8
  %1466 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1465, i32 0, i32 1
  %1467 = load ptr, ptr %1466, align 8
  %1468 = icmp ne ptr %1467, null
  br i1 %1468, label %1473, label %1469

1469:                                             ; preds = %1461
  %1470 = load ptr, ptr %7, align 8
  %1471 = load ptr, ptr %4, align 8
  %1472 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1471, i32 0, i32 1
  store ptr %1470, ptr %1472, align 8
  br label %1473

1473:                                             ; preds = %1469, %1461
  %1474 = load ptr, ptr %4, align 8
  %1475 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %1474, i32 0, i32 4
  %1476 = load i64, ptr %1475, align 8
  %1477 = add i64 %1476, 1
  store i64 %1477, ptr %1475, align 8
  br label %1478

1478:                                             ; preds = %1473, %527
  ret void
}

define dso_local i32 @CacheSimulation_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  store i32 %10, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = zext i32 %11 to i64
  %13 = shl i64 %12, 5
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %14, i32 0, i32 3
  %16 = load i64, ptr %15, align 8
  %17 = trunc i64 %16 to i32
  %18 = zext i32 %17 to i64
  %19 = add nsw i64 %13, %18
  %20 = trunc i64 %19 to i32
  store i32 %20, ptr %4, align 4
  %21 = load i32, ptr %4, align 4
  %22 = zext i32 %21 to i64
  %23 = shl i64 %22, 5
  %24 = load ptr, ptr %3, align 8
  %25 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %24, i32 0, i32 4
  %26 = load i64, ptr %25, align 8
  %27 = trunc i64 %26 to i32
  %28 = zext i32 %27 to i64
  %29 = add nsw i64 %23, %28
  %30 = trunc i64 %29 to i32
  store i32 %30, ptr %4, align 4
  %31 = load i32, ptr %4, align 4
  %32 = zext i32 %31 to i64
  %33 = shl i64 %32, 5
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %34, i32 0, i32 5
  %36 = load ptr, ptr %35, align 8
  %37 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %36, i32 0, i32 4
  %38 = load i64, ptr %37, align 8
  %39 = trunc i64 %38 to i32
  %40 = zext i32 %39 to i64
  %41 = add nsw i64 %33, %40
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %4, align 4
  %43 = load i32, ptr %4, align 4
  ret i32 %43
}

define dso_local void @CacheSimulation_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %7, i32 0, i32 5
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %12, i32 0, i32 5
  %14 = load ptr, ptr %13, align 8
  call void @cache_simulation_cache_free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.CacheSimulationData, ptr %15, i32 0, i32 5
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define internal void @cache_simulation_cache_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %8, i32 0, i32 2
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %3, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %11, i32 0, i32 2
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %22

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %16, i32 0, i32 2
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.CacheNode, ptr %18, i32 0, i32 5
  %20 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  br label %23

22:                                               ; preds = %1
  br label %23

23:                                               ; preds = %22, %15
  %24 = phi ptr [ %21, %15 ], [ null, %22 ]
  store ptr %24, ptr %4, align 8
  br label %25

25:                                               ; preds = %240, %23
  %26 = load ptr, ptr %3, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %242

28:                                               ; preds = %25
  br label %29

29:                                               ; preds = %28
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.CacheNode, ptr %30, i32 0, i32 5
  store ptr %31, ptr %5, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %32, i32 0, i32 1
  %34 = load ptr, ptr %33, align 8
  %35 = icmp eq ptr %34, null
  br i1 %35, label %36, label %58

36:                                               ; preds = %29
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = icmp eq ptr %39, null
  br i1 %40, label %41, label %58

41:                                               ; preds = %36
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %42, i32 0, i32 2
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds nuw %struct.CacheNode, ptr %44, i32 0, i32 5
  %46 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  call void @free(ptr noundef %49)
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %50, i32 0, i32 2
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds nuw %struct.CacheNode, ptr %52, i32 0, i32 5
  %54 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %55)
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %56, i32 0, i32 2
  store ptr null, ptr %57, align 8
  br label %221

58:                                               ; preds = %36, %29
  %59 = load ptr, ptr %5, align 8
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds nuw %struct.CacheNode, ptr %62, i32 0, i32 5
  %64 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %63, i32 0, i32 0
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %65, i32 0, i32 4
  %67 = load ptr, ptr %66, align 8
  %68 = icmp eq ptr %59, %67
  br i1 %68, label %69, label %89

69:                                               ; preds = %58
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %70, i32 0, i32 1
  %72 = load ptr, ptr %71, align 8
  %73 = load ptr, ptr %2, align 8
  %74 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %73, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds nuw %struct.CacheNode, ptr %75, i32 0, i32 5
  %77 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %78, i32 0, i32 5
  %80 = load i64, ptr %79, align 8
  %81 = getelementptr inbounds i8, ptr %72, i64 %80
  %82 = load ptr, ptr %2, align 8
  %83 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %82, i32 0, i32 2
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds nuw %struct.CacheNode, ptr %84, i32 0, i32 5
  %86 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %85, i32 0, i32 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %87, i32 0, i32 4
  store ptr %81, ptr %88, align 8
  br label %89

89:                                               ; preds = %69, %58
  %90 = load ptr, ptr %5, align 8
  %91 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %90, i32 0, i32 1
  %92 = load ptr, ptr %91, align 8
  %93 = icmp ne ptr %92, null
  br i1 %93, label %94, label %111

94:                                               ; preds = %89
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %95, i32 0, i32 2
  %97 = load ptr, ptr %96, align 8
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %98, i32 0, i32 1
  %100 = load ptr, ptr %99, align 8
  %101 = load ptr, ptr %2, align 8
  %102 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %101, i32 0, i32 2
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr inbounds nuw %struct.CacheNode, ptr %103, i32 0, i32 5
  %105 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %104, i32 0, i32 0
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %106, i32 0, i32 5
  %108 = load i64, ptr %107, align 8
  %109 = getelementptr inbounds i8, ptr %100, i64 %108
  %110 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %109, i32 0, i32 2
  store ptr %97, ptr %110, align 8
  br label %119

111:                                              ; preds = %89
  br label %112

112:                                              ; preds = %111
  %113 = load ptr, ptr %5, align 8
  %114 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %113, i32 0, i32 2
  %115 = load ptr, ptr %114, align 8
  %116 = load ptr, ptr %2, align 8
  %117 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %116, i32 0, i32 2
  store ptr %115, ptr %117, align 8
  br label %118

118:                                              ; preds = %112
  br label %119

119:                                              ; preds = %118, %94
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %120, i32 0, i32 2
  %122 = load ptr, ptr %121, align 8
  %123 = icmp ne ptr %122, null
  br i1 %123, label %124, label %141

124:                                              ; preds = %119
  %125 = load ptr, ptr %5, align 8
  %126 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %125, i32 0, i32 1
  %127 = load ptr, ptr %126, align 8
  %128 = load ptr, ptr %5, align 8
  %129 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %128, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  %131 = load ptr, ptr %2, align 8
  %132 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %131, i32 0, i32 2
  %133 = load ptr, ptr %132, align 8
  %134 = getelementptr inbounds nuw %struct.CacheNode, ptr %133, i32 0, i32 5
  %135 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %134, i32 0, i32 0
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %136, i32 0, i32 5
  %138 = load i64, ptr %137, align 8
  %139 = getelementptr inbounds i8, ptr %130, i64 %138
  %140 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %139, i32 0, i32 1
  store ptr %127, ptr %140, align 8
  br label %141

141:                                              ; preds = %124, %119
  br label %142

142:                                              ; preds = %141
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %143, i32 0, i32 7
  %145 = load i32, ptr %144, align 4
  %146 = load ptr, ptr %2, align 8
  %147 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %146, i32 0, i32 2
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds nuw %struct.CacheNode, ptr %148, i32 0, i32 5
  %150 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %149, i32 0, i32 0
  %151 = load ptr, ptr %150, align 8
  %152 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %151, i32 0, i32 1
  %153 = load i32, ptr %152, align 8
  %154 = sub i32 %153, 1
  %155 = and i32 %145, %154
  store i32 %155, ptr %6, align 4
  br label %156

156:                                              ; preds = %142
  br label %157

157:                                              ; preds = %156
  %158 = load ptr, ptr %2, align 8
  %159 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %158, i32 0, i32 2
  %160 = load ptr, ptr %159, align 8
  %161 = getelementptr inbounds nuw %struct.CacheNode, ptr %160, i32 0, i32 5
  %162 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %161, i32 0, i32 0
  %163 = load ptr, ptr %162, align 8
  %164 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %163, i32 0, i32 0
  %165 = load ptr, ptr %164, align 8
  %166 = load i32, ptr %6, align 4
  %167 = zext i32 %166 to i64
  %168 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %165, i64 %167
  store ptr %168, ptr %7, align 8
  %169 = load ptr, ptr %7, align 8
  %170 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %169, i32 0, i32 1
  %171 = load i32, ptr %170, align 8
  %172 = add i32 %171, -1
  store i32 %172, ptr %170, align 8
  %173 = load ptr, ptr %7, align 8
  %174 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %173, i32 0, i32 0
  %175 = load ptr, ptr %174, align 8
  %176 = load ptr, ptr %5, align 8
  %177 = icmp eq ptr %175, %176
  br i1 %177, label %178, label %184

178:                                              ; preds = %157
  %179 = load ptr, ptr %5, align 8
  %180 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %179, i32 0, i32 4
  %181 = load ptr, ptr %180, align 8
  %182 = load ptr, ptr %7, align 8
  %183 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %182, i32 0, i32 0
  store ptr %181, ptr %183, align 8
  br label %184

184:                                              ; preds = %178, %157
  %185 = load ptr, ptr %5, align 8
  %186 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %185, i32 0, i32 3
  %187 = load ptr, ptr %186, align 8
  %188 = icmp ne ptr %187, null
  br i1 %188, label %189, label %197

189:                                              ; preds = %184
  %190 = load ptr, ptr %5, align 8
  %191 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %190, i32 0, i32 4
  %192 = load ptr, ptr %191, align 8
  %193 = load ptr, ptr %5, align 8
  %194 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %193, i32 0, i32 3
  %195 = load ptr, ptr %194, align 8
  %196 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %195, i32 0, i32 4
  store ptr %192, ptr %196, align 8
  br label %197

197:                                              ; preds = %189, %184
  %198 = load ptr, ptr %5, align 8
  %199 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %198, i32 0, i32 4
  %200 = load ptr, ptr %199, align 8
  %201 = icmp ne ptr %200, null
  br i1 %201, label %202, label %210

202:                                              ; preds = %197
  %203 = load ptr, ptr %5, align 8
  %204 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %203, i32 0, i32 3
  %205 = load ptr, ptr %204, align 8
  %206 = load ptr, ptr %5, align 8
  %207 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %206, i32 0, i32 4
  %208 = load ptr, ptr %207, align 8
  %209 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %208, i32 0, i32 3
  store ptr %205, ptr %209, align 8
  br label %210

210:                                              ; preds = %202, %197
  br label %211

211:                                              ; preds = %210
  %212 = load ptr, ptr %2, align 8
  %213 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %212, i32 0, i32 2
  %214 = load ptr, ptr %213, align 8
  %215 = getelementptr inbounds nuw %struct.CacheNode, ptr %214, i32 0, i32 5
  %216 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %215, i32 0, i32 0
  %217 = load ptr, ptr %216, align 8
  %218 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %217, i32 0, i32 3
  %219 = load i32, ptr %218, align 8
  %220 = add i32 %219, -1
  store i32 %220, ptr %218, align 8
  br label %221

221:                                              ; preds = %211, %41
  br label %222

222:                                              ; preds = %221
  %223 = load ptr, ptr %3, align 8
  %224 = getelementptr inbounds nuw %struct.CacheNode, ptr %223, i32 0, i32 0
  %225 = load ptr, ptr %224, align 8
  call void @free(ptr noundef %225)
  %226 = load ptr, ptr %3, align 8
  %227 = getelementptr inbounds nuw %struct.CacheNode, ptr %226, i32 0, i32 1
  %228 = load ptr, ptr %227, align 8
  call void @free(ptr noundef %228)
  %229 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %229)
  br label %230

230:                                              ; preds = %222
  %231 = load ptr, ptr %4, align 8
  store ptr %231, ptr %3, align 8
  %232 = load ptr, ptr %4, align 8
  %233 = icmp ne ptr %232, null
  br i1 %233, label %234, label %239

234:                                              ; preds = %230
  %235 = load ptr, ptr %4, align 8
  %236 = getelementptr inbounds nuw %struct.CacheNode, ptr %235, i32 0, i32 5
  %237 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %236, i32 0, i32 2
  %238 = load ptr, ptr %237, align 8
  br label %240

239:                                              ; preds = %230
  br label %240

240:                                              ; preds = %239, %234
  %241 = phi ptr [ %238, %234 ], [ null, %239 ]
  store ptr %241, ptr %4, align 8
  br label %25, !llvm.loop !15

242:                                              ; preds = %25
  %243 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %243)
  ret void
}

define dso_local ptr @CacheSimulation_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.5)
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
  store ptr @CacheSimulation_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @CacheSimulation_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @CacheSimulation_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @CacheSimulation_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare i64 @strlen(ptr noundef)

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

define internal void @cache_simulation_cache_move_to_front(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp eq ptr %5, %8
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  br label %79

11:                                               ; preds = %2
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds nuw %struct.CacheNode, ptr %12, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8
  %15 = icmp ne ptr %14, null
  br i1 %15, label %16, label %24

16:                                               ; preds = %11
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.CacheNode, ptr %17, i32 0, i32 4
  %19 = load ptr, ptr %18, align 8
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds nuw %struct.CacheNode, ptr %20, i32 0, i32 3
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds nuw %struct.CacheNode, ptr %22, i32 0, i32 4
  store ptr %19, ptr %23, align 8
  br label %24

24:                                               ; preds = %16, %11
  %25 = load ptr, ptr %4, align 8
  %26 = getelementptr inbounds nuw %struct.CacheNode, ptr %25, i32 0, i32 4
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %29, label %37

29:                                               ; preds = %24
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.CacheNode, ptr %30, i32 0, i32 3
  %32 = load ptr, ptr %31, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.CacheNode, ptr %33, i32 0, i32 4
  %35 = load ptr, ptr %34, align 8
  %36 = getelementptr inbounds nuw %struct.CacheNode, ptr %35, i32 0, i32 3
  store ptr %32, ptr %36, align 8
  br label %37

37:                                               ; preds = %29, %24
  %38 = load ptr, ptr %4, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %39, i32 0, i32 1
  %41 = load ptr, ptr %40, align 8
  %42 = icmp eq ptr %38, %41
  br i1 %42, label %43, label %49

43:                                               ; preds = %37
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds nuw %struct.CacheNode, ptr %44, i32 0, i32 3
  %46 = load ptr, ptr %45, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %47, i32 0, i32 1
  store ptr %46, ptr %48, align 8
  br label %49

49:                                               ; preds = %43, %37
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.CacheNode, ptr %50, i32 0, i32 3
  store ptr null, ptr %51, align 8
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.CacheNode, ptr %55, i32 0, i32 4
  store ptr %54, ptr %56, align 8
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %57, i32 0, i32 0
  %59 = load ptr, ptr %58, align 8
  %60 = icmp ne ptr %59, null
  br i1 %60, label %61, label %67

61:                                               ; preds = %49
  %62 = load ptr, ptr %4, align 8
  %63 = load ptr, ptr %3, align 8
  %64 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %63, i32 0, i32 0
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds nuw %struct.CacheNode, ptr %65, i32 0, i32 3
  store ptr %62, ptr %66, align 8
  br label %67

67:                                               ; preds = %61, %49
  %68 = load ptr, ptr %4, align 8
  %69 = load ptr, ptr %3, align 8
  %70 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %69, i32 0, i32 0
  store ptr %68, ptr %70, align 8
  %71 = load ptr, ptr %3, align 8
  %72 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %71, i32 0, i32 1
  %73 = load ptr, ptr %72, align 8
  %74 = icmp ne ptr %73, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %67
  %76 = load ptr, ptr %4, align 8
  %77 = load ptr, ptr %3, align 8
  %78 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %77, i32 0, i32 1
  store ptr %76, ptr %78, align 8
  br label %79

79:                                               ; preds = %10, %75, %67
  ret void
}

declare void @free(ptr noundef)

declare noalias ptr @strdup(ptr noundef)

define internal void @cache_simulation_cache_remove_oldest(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %7, i32 0, i32 1
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %1
  br label %271

12:                                               ; preds = %1
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %3, align 8
  br label %16

16:                                               ; preds = %12
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.CacheNode, ptr %17, i32 0, i32 5
  store ptr %18, ptr %4, align 8
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %19, i32 0, i32 1
  %21 = load ptr, ptr %20, align 8
  %22 = icmp eq ptr %21, null
  br i1 %22, label %23, label %45

23:                                               ; preds = %16
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = icmp eq ptr %26, null
  br i1 %27, label %28, label %45

28:                                               ; preds = %23
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %29, i32 0, i32 2
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds nuw %struct.CacheNode, ptr %31, i32 0, i32 5
  %33 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %34, i32 0, i32 0
  %36 = load ptr, ptr %35, align 8
  call void @free(ptr noundef %36)
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds nuw %struct.CacheNode, ptr %39, i32 0, i32 5
  %41 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %40, i32 0, i32 0
  %42 = load ptr, ptr %41, align 8
  call void @free(ptr noundef %42)
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %43, i32 0, i32 2
  store ptr null, ptr %44, align 8
  br label %208

45:                                               ; preds = %23, %16
  %46 = load ptr, ptr %4, align 8
  %47 = load ptr, ptr %2, align 8
  %48 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %47, i32 0, i32 2
  %49 = load ptr, ptr %48, align 8
  %50 = getelementptr inbounds nuw %struct.CacheNode, ptr %49, i32 0, i32 5
  %51 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %52, i32 0, i32 4
  %54 = load ptr, ptr %53, align 8
  %55 = icmp eq ptr %46, %54
  br i1 %55, label %56, label %76

56:                                               ; preds = %45
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %57, i32 0, i32 1
  %59 = load ptr, ptr %58, align 8
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds nuw %struct.CacheNode, ptr %62, i32 0, i32 5
  %64 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %63, i32 0, i32 0
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %65, i32 0, i32 5
  %67 = load i64, ptr %66, align 8
  %68 = getelementptr inbounds i8, ptr %59, i64 %67
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %69, i32 0, i32 2
  %71 = load ptr, ptr %70, align 8
  %72 = getelementptr inbounds nuw %struct.CacheNode, ptr %71, i32 0, i32 5
  %73 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  %75 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %74, i32 0, i32 4
  store ptr %68, ptr %75, align 8
  br label %76

76:                                               ; preds = %56, %45
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %77, i32 0, i32 1
  %79 = load ptr, ptr %78, align 8
  %80 = icmp ne ptr %79, null
  br i1 %80, label %81, label %98

81:                                               ; preds = %76
  %82 = load ptr, ptr %4, align 8
  %83 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %82, i32 0, i32 2
  %84 = load ptr, ptr %83, align 8
  %85 = load ptr, ptr %4, align 8
  %86 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %85, i32 0, i32 1
  %87 = load ptr, ptr %86, align 8
  %88 = load ptr, ptr %2, align 8
  %89 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %88, i32 0, i32 2
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds nuw %struct.CacheNode, ptr %90, i32 0, i32 5
  %92 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %91, i32 0, i32 0
  %93 = load ptr, ptr %92, align 8
  %94 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %93, i32 0, i32 5
  %95 = load i64, ptr %94, align 8
  %96 = getelementptr inbounds i8, ptr %87, i64 %95
  %97 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %96, i32 0, i32 2
  store ptr %84, ptr %97, align 8
  br label %106

98:                                               ; preds = %76
  br label %99

99:                                               ; preds = %98
  %100 = load ptr, ptr %4, align 8
  %101 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %100, i32 0, i32 2
  %102 = load ptr, ptr %101, align 8
  %103 = load ptr, ptr %2, align 8
  %104 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %103, i32 0, i32 2
  store ptr %102, ptr %104, align 8
  br label %105

105:                                              ; preds = %99
  br label %106

106:                                              ; preds = %105, %81
  %107 = load ptr, ptr %4, align 8
  %108 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %107, i32 0, i32 2
  %109 = load ptr, ptr %108, align 8
  %110 = icmp ne ptr %109, null
  br i1 %110, label %111, label %128

111:                                              ; preds = %106
  %112 = load ptr, ptr %4, align 8
  %113 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %112, i32 0, i32 1
  %114 = load ptr, ptr %113, align 8
  %115 = load ptr, ptr %4, align 8
  %116 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %115, i32 0, i32 2
  %117 = load ptr, ptr %116, align 8
  %118 = load ptr, ptr %2, align 8
  %119 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %118, i32 0, i32 2
  %120 = load ptr, ptr %119, align 8
  %121 = getelementptr inbounds nuw %struct.CacheNode, ptr %120, i32 0, i32 5
  %122 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %121, i32 0, i32 0
  %123 = load ptr, ptr %122, align 8
  %124 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %123, i32 0, i32 5
  %125 = load i64, ptr %124, align 8
  %126 = getelementptr inbounds i8, ptr %117, i64 %125
  %127 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %126, i32 0, i32 1
  store ptr %114, ptr %127, align 8
  br label %128

128:                                              ; preds = %111, %106
  br label %129

129:                                              ; preds = %128
  %130 = load ptr, ptr %4, align 8
  %131 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %130, i32 0, i32 7
  %132 = load i32, ptr %131, align 4
  %133 = load ptr, ptr %2, align 8
  %134 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %133, i32 0, i32 2
  %135 = load ptr, ptr %134, align 8
  %136 = getelementptr inbounds nuw %struct.CacheNode, ptr %135, i32 0, i32 5
  %137 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %136, i32 0, i32 0
  %138 = load ptr, ptr %137, align 8
  %139 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %138, i32 0, i32 1
  %140 = load i32, ptr %139, align 8
  %141 = sub i32 %140, 1
  %142 = and i32 %132, %141
  store i32 %142, ptr %5, align 4
  br label %143

143:                                              ; preds = %129
  br label %144

144:                                              ; preds = %143
  %145 = load ptr, ptr %2, align 8
  %146 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %145, i32 0, i32 2
  %147 = load ptr, ptr %146, align 8
  %148 = getelementptr inbounds nuw %struct.CacheNode, ptr %147, i32 0, i32 5
  %149 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %148, i32 0, i32 0
  %150 = load ptr, ptr %149, align 8
  %151 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %150, i32 0, i32 0
  %152 = load ptr, ptr %151, align 8
  %153 = load i32, ptr %5, align 4
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %152, i64 %154
  store ptr %155, ptr %6, align 8
  %156 = load ptr, ptr %6, align 8
  %157 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %156, i32 0, i32 1
  %158 = load i32, ptr %157, align 8
  %159 = add i32 %158, -1
  store i32 %159, ptr %157, align 8
  %160 = load ptr, ptr %6, align 8
  %161 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %160, i32 0, i32 0
  %162 = load ptr, ptr %161, align 8
  %163 = load ptr, ptr %4, align 8
  %164 = icmp eq ptr %162, %163
  br i1 %164, label %165, label %171

165:                                              ; preds = %144
  %166 = load ptr, ptr %4, align 8
  %167 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %166, i32 0, i32 4
  %168 = load ptr, ptr %167, align 8
  %169 = load ptr, ptr %6, align 8
  %170 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %169, i32 0, i32 0
  store ptr %168, ptr %170, align 8
  br label %171

171:                                              ; preds = %165, %144
  %172 = load ptr, ptr %4, align 8
  %173 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %172, i32 0, i32 3
  %174 = load ptr, ptr %173, align 8
  %175 = icmp ne ptr %174, null
  br i1 %175, label %176, label %184

176:                                              ; preds = %171
  %177 = load ptr, ptr %4, align 8
  %178 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %177, i32 0, i32 4
  %179 = load ptr, ptr %178, align 8
  %180 = load ptr, ptr %4, align 8
  %181 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %180, i32 0, i32 3
  %182 = load ptr, ptr %181, align 8
  %183 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %182, i32 0, i32 4
  store ptr %179, ptr %183, align 8
  br label %184

184:                                              ; preds = %176, %171
  %185 = load ptr, ptr %4, align 8
  %186 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %185, i32 0, i32 4
  %187 = load ptr, ptr %186, align 8
  %188 = icmp ne ptr %187, null
  br i1 %188, label %189, label %197

189:                                              ; preds = %184
  %190 = load ptr, ptr %4, align 8
  %191 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %190, i32 0, i32 3
  %192 = load ptr, ptr %191, align 8
  %193 = load ptr, ptr %4, align 8
  %194 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %193, i32 0, i32 4
  %195 = load ptr, ptr %194, align 8
  %196 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %195, i32 0, i32 3
  store ptr %192, ptr %196, align 8
  br label %197

197:                                              ; preds = %189, %184
  br label %198

198:                                              ; preds = %197
  %199 = load ptr, ptr %2, align 8
  %200 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %199, i32 0, i32 2
  %201 = load ptr, ptr %200, align 8
  %202 = getelementptr inbounds nuw %struct.CacheNode, ptr %201, i32 0, i32 5
  %203 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %202, i32 0, i32 0
  %204 = load ptr, ptr %203, align 8
  %205 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %204, i32 0, i32 3
  %206 = load i32, ptr %205, align 8
  %207 = add i32 %206, -1
  store i32 %207, ptr %205, align 8
  br label %208

208:                                              ; preds = %198, %28
  br label %209

209:                                              ; preds = %208
  %210 = load ptr, ptr %3, align 8
  %211 = getelementptr inbounds nuw %struct.CacheNode, ptr %210, i32 0, i32 3
  %212 = load ptr, ptr %211, align 8
  %213 = icmp ne ptr %212, null
  br i1 %213, label %214, label %222

214:                                              ; preds = %209
  %215 = load ptr, ptr %3, align 8
  %216 = getelementptr inbounds nuw %struct.CacheNode, ptr %215, i32 0, i32 4
  %217 = load ptr, ptr %216, align 8
  %218 = load ptr, ptr %3, align 8
  %219 = getelementptr inbounds nuw %struct.CacheNode, ptr %218, i32 0, i32 3
  %220 = load ptr, ptr %219, align 8
  %221 = getelementptr inbounds nuw %struct.CacheNode, ptr %220, i32 0, i32 4
  store ptr %217, ptr %221, align 8
  br label %222

222:                                              ; preds = %214, %209
  %223 = load ptr, ptr %3, align 8
  %224 = getelementptr inbounds nuw %struct.CacheNode, ptr %223, i32 0, i32 4
  %225 = load ptr, ptr %224, align 8
  %226 = icmp ne ptr %225, null
  br i1 %226, label %227, label %235

227:                                              ; preds = %222
  %228 = load ptr, ptr %3, align 8
  %229 = getelementptr inbounds nuw %struct.CacheNode, ptr %228, i32 0, i32 3
  %230 = load ptr, ptr %229, align 8
  %231 = load ptr, ptr %3, align 8
  %232 = getelementptr inbounds nuw %struct.CacheNode, ptr %231, i32 0, i32 4
  %233 = load ptr, ptr %232, align 8
  %234 = getelementptr inbounds nuw %struct.CacheNode, ptr %233, i32 0, i32 3
  store ptr %230, ptr %234, align 8
  br label %235

235:                                              ; preds = %227, %222
  %236 = load ptr, ptr %2, align 8
  %237 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %236, i32 0, i32 0
  %238 = load ptr, ptr %237, align 8
  %239 = load ptr, ptr %3, align 8
  %240 = icmp eq ptr %238, %239
  br i1 %240, label %241, label %247

241:                                              ; preds = %235
  %242 = load ptr, ptr %3, align 8
  %243 = getelementptr inbounds nuw %struct.CacheNode, ptr %242, i32 0, i32 4
  %244 = load ptr, ptr %243, align 8
  %245 = load ptr, ptr %2, align 8
  %246 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %245, i32 0, i32 0
  store ptr %244, ptr %246, align 8
  br label %247

247:                                              ; preds = %241, %235
  %248 = load ptr, ptr %2, align 8
  %249 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %248, i32 0, i32 1
  %250 = load ptr, ptr %249, align 8
  %251 = load ptr, ptr %3, align 8
  %252 = icmp eq ptr %250, %251
  br i1 %252, label %253, label %259

253:                                              ; preds = %247
  %254 = load ptr, ptr %3, align 8
  %255 = getelementptr inbounds nuw %struct.CacheNode, ptr %254, i32 0, i32 3
  %256 = load ptr, ptr %255, align 8
  %257 = load ptr, ptr %2, align 8
  %258 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %257, i32 0, i32 1
  store ptr %256, ptr %258, align 8
  br label %259

259:                                              ; preds = %253, %247
  %260 = load ptr, ptr %3, align 8
  %261 = getelementptr inbounds nuw %struct.CacheNode, ptr %260, i32 0, i32 0
  %262 = load ptr, ptr %261, align 8
  call void @free(ptr noundef %262)
  %263 = load ptr, ptr %3, align 8
  %264 = getelementptr inbounds nuw %struct.CacheNode, ptr %263, i32 0, i32 1
  %265 = load ptr, ptr %264, align 8
  call void @free(ptr noundef %265)
  %266 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %266)
  %267 = load ptr, ptr %2, align 8
  %268 = getelementptr inbounds nuw %struct.CacheSimulationCache, ptr %267, i32 0, i32 4
  %269 = load i64, ptr %268, align 8
  %270 = add i64 %269, -1
  store i64 %270, ptr %268, align 8
  br label %271

271:                                              ; preds = %259, %11
  ret void
}

declare void @exit(i32 noundef)


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
