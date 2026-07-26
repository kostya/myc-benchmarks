; ModuleID = 'c/src/graph_path.c'
source_filename = "c/src/graph_path.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.GraphPathBFSData = type { %struct.GraphPathBaseData }
%struct.GraphPathBaseData = type { ptr, i32 }
%struct.GraphPathGraph = type { i32, i32, i32, ptr, ptr, ptr }
%struct.GraphPathDFSData = type { %struct.GraphPathBaseData }
%struct.GraphPathAStarData = type { %struct.GraphPathBaseData }
%struct.PriorityQueue = type { ptr, i32, i32 }
%struct.PriorityQueueItem = type { i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"Graph::BFS\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Graph::DFS\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"Graph::AStar\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"vertices\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"jumps\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"jump_len\00", align 1

define dso_local void @GraphPathBFS_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %8, i32 0, i32 0
  call void @graph_path_base_prepare(ptr noundef %7, ptr noundef @.str, ptr noundef %9)
  ret void
}

define internal void @graph_path_base_prepare(ptr noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %5, align 8
  %12 = call i64 @Helper_config_i64(ptr noundef %11, ptr noundef @.str.3)
  %13 = trunc i64 %12 to i32
  store i32 %13, ptr %7, align 4
  %14 = load ptr, ptr %5, align 8
  %15 = call i64 @Helper_config_i64(ptr noundef %14, ptr noundef @.str.4)
  %16 = trunc i64 %15 to i32
  store i32 %16, ptr %8, align 4
  %17 = load ptr, ptr %5, align 8
  %18 = call i64 @Helper_config_i64(ptr noundef %17, ptr noundef @.str.5)
  %19 = trunc i64 %18 to i32
  store i32 %19, ptr %9, align 4
  %20 = load i32, ptr %7, align 4
  %21 = load i32, ptr %8, align 4
  %22 = load i32, ptr %9, align 4
  %23 = call ptr @graph_path_graph_new(i32 noundef %20, i32 noundef %21, i32 noundef %22)
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %26, i32 0, i32 0
  %28 = load ptr, ptr %27, align 8
  call void @graph_path_graph_generate_random(ptr noundef %28)
  %29 = load ptr, ptr %6, align 8
  %30 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %29, i32 0, i32 1
  store i32 0, ptr %30, align 8
  ret void
}

define dso_local void @GraphPathBFS_run(ptr noundef %0, i32 noundef %1) {
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
  %12 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %20, 1
  %22 = call i32 @graph_path_bfs_search(ptr noundef %14, i32 noundef 0, i32 noundef %21)
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = add i32 %27, %23
  store i32 %28, ptr %26, align 8
  ret void
}

define internal i32 @graph_path_bfs_search(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %128

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 1)
  store ptr %25, ptr %8, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 8
  %29 = mul nsw i32 %28, 2
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 4
  %32 = call noalias ptr @malloc(i64 noundef %31)
  store ptr %32, ptr %9, align 8
  store i32 0, ptr %10, align 4
  store i32 0, ptr %11, align 4
  %33 = load ptr, ptr %8, align 8
  %34 = load i32, ptr %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, ptr %33, i64 %35
  store i8 1, ptr %36, align 1
  %37 = load i32, ptr %6, align 4
  %38 = load ptr, ptr %9, align 8
  %39 = load i32, ptr %11, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %11, align 4
  %41 = sext i32 %39 to i64
  %42 = getelementptr inbounds i32, ptr %38, i64 %41
  store i32 %37, ptr %42, align 4
  %43 = load ptr, ptr %9, align 8
  %44 = load i32, ptr %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %11, align 4
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds i32, ptr %43, i64 %46
  store i32 0, ptr %47, align 4
  br label %48

48:                                               ; preds = %124, %20
  %49 = load i32, ptr %10, align 4
  %50 = load i32, ptr %11, align 4
  %51 = icmp slt i32 %49, %50
  br i1 %51, label %52, label %125

52:                                               ; preds = %48
  %53 = load ptr, ptr %9, align 8
  %54 = load i32, ptr %10, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %10, align 4
  %56 = sext i32 %54 to i64
  %57 = getelementptr inbounds i32, ptr %53, i64 %56
  %58 = load i32, ptr %57, align 4
  store i32 %58, ptr %12, align 4
  %59 = load ptr, ptr %9, align 8
  %60 = load i32, ptr %10, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %10, align 4
  %62 = sext i32 %60 to i64
  %63 = getelementptr inbounds i32, ptr %59, i64 %62
  %64 = load i32, ptr %63, align 4
  store i32 %64, ptr %13, align 4
  store i32 0, ptr %14, align 4
  br label %65

65:                                               ; preds = %121, %52
  %66 = load i32, ptr %14, align 4
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %67, i32 0, i32 4
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %12, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %69, i64 %71
  %73 = load i32, ptr %72, align 4
  %74 = icmp slt i32 %66, %73
  br i1 %74, label %75, label %124

75:                                               ; preds = %65
  %76 = load ptr, ptr %5, align 8
  %77 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %76, i32 0, i32 3
  %78 = load ptr, ptr %77, align 8
  %79 = load i32, ptr %12, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds ptr, ptr %78, i64 %80
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %14, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, ptr %82, i64 %84
  %86 = load i32, ptr %85, align 4
  store i32 %86, ptr %15, align 4
  %87 = load i32, ptr %15, align 4
  %88 = load i32, ptr %7, align 4
  %89 = icmp eq i32 %87, %88
  br i1 %89, label %90, label %95

90:                                               ; preds = %75
  %91 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %91)
  %92 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %92)
  %93 = load i32, ptr %13, align 4
  %94 = add nsw i32 %93, 1
  store i32 %94, ptr %4, align 4
  br label %128

95:                                               ; preds = %75
  %96 = load ptr, ptr %8, align 8
  %97 = load i32, ptr %15, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, ptr %96, i64 %98
  %100 = load i8, ptr %99, align 1
  %101 = icmp ne i8 %100, 0
  br i1 %101, label %120, label %102

102:                                              ; preds = %95
  %103 = load ptr, ptr %8, align 8
  %104 = load i32, ptr %15, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, ptr %103, i64 %105
  store i8 1, ptr %106, align 1
  %107 = load i32, ptr %15, align 4
  %108 = load ptr, ptr %9, align 8
  %109 = load i32, ptr %11, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, ptr %11, align 4
  %111 = sext i32 %109 to i64
  %112 = getelementptr inbounds i32, ptr %108, i64 %111
  store i32 %107, ptr %112, align 4
  %113 = load i32, ptr %13, align 4
  %114 = add nsw i32 %113, 1
  %115 = load ptr, ptr %9, align 8
  %116 = load i32, ptr %11, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %11, align 4
  %118 = sext i32 %116 to i64
  %119 = getelementptr inbounds i32, ptr %115, i64 %118
  store i32 %114, ptr %119, align 4
  br label %120

120:                                              ; preds = %102, %95
  br label %121

121:                                              ; preds = %120
  %122 = load i32, ptr %14, align 4
  %123 = add nsw i32 %122, 1
  store i32 %123, ptr %14, align 4
  br label %65, !llvm.loop !6

124:                                              ; preds = %65
  br label %48, !llvm.loop !8

125:                                              ; preds = %48
  %126 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %126)
  %127 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %127)
  store i32 -1, ptr %4, align 4
  br label %128

128:                                              ; preds = %125, %90, %19
  %129 = load i32, ptr %4, align 4
  ret i32 %129
}

define dso_local i32 @GraphPathBFS_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @GraphPathBFS_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathBFSData, ptr %7, i32 0, i32 0
  call void @graph_path_base_cleanup(ptr noundef %8)
  ret void
}

define internal void @graph_path_base_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  call void @graph_path_graph_free(ptr noundef %10)
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %11, i32 0, i32 0
  store ptr null, ptr %12, align 8
  br label %13

13:                                               ; preds = %7, %1
  ret void
}

define dso_local ptr @GraphPathBFS_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str)
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
  store ptr @GraphPathBFS_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @GraphPathBFS_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @GraphPathBFS_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @GraphPathBFS_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define dso_local void @GraphPathDFS_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %8, i32 0, i32 0
  call void @graph_path_base_prepare(ptr noundef %7, ptr noundef @.str.1, ptr noundef %9)
  ret void
}

define dso_local void @GraphPathDFS_run(ptr noundef %0, i32 noundef %1) {
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
  %12 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %20, 1
  %22 = call i32 @graph_path_dfs_search(ptr noundef %14, i32 noundef 0, i32 noundef %21)
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = add i32 %27, %23
  store i32 %28, ptr %26, align 8
  ret void
}

define internal i32 @graph_path_dfs_search(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %16 = load i32, ptr %6, align 4
  %17 = load i32, ptr %7, align 4
  %18 = icmp eq i32 %16, %17
  br i1 %18, label %19, label %20

19:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %148

20:                                               ; preds = %3
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  %24 = sext i32 %23 to i64
  %25 = call noalias ptr @calloc(i64 noundef %24, i64 noundef 1)
  store ptr %25, ptr %8, align 8
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 8
  %29 = mul nsw i32 %28, 2
  %30 = sext i32 %29 to i64
  %31 = mul i64 %30, 4
  %32 = call noalias ptr @malloc(i64 noundef %31)
  store ptr %32, ptr %9, align 8
  store i32 -1, ptr %10, align 4
  store i32 2147483647, ptr %11, align 4
  %33 = load i32, ptr %6, align 4
  %34 = load ptr, ptr %9, align 8
  %35 = load i32, ptr %10, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, ptr %34, i64 %37
  store i32 %33, ptr %38, align 4
  %39 = load ptr, ptr %9, align 8
  %40 = load i32, ptr %10, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %10, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %39, i64 %42
  store i32 0, ptr %43, align 4
  br label %44

44:                                               ; preds = %137, %71, %20
  %45 = load i32, ptr %10, align 4
  %46 = icmp sge i32 %45, 0
  br i1 %46, label %47, label %138

47:                                               ; preds = %44
  %48 = load ptr, ptr %9, align 8
  %49 = load i32, ptr %10, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, ptr %10, align 4
  %51 = sext i32 %49 to i64
  %52 = getelementptr inbounds i32, ptr %48, i64 %51
  %53 = load i32, ptr %52, align 4
  store i32 %53, ptr %12, align 4
  %54 = load ptr, ptr %9, align 8
  %55 = load i32, ptr %10, align 4
  %56 = add nsw i32 %55, -1
  store i32 %56, ptr %10, align 4
  %57 = sext i32 %55 to i64
  %58 = getelementptr inbounds i32, ptr %54, i64 %57
  %59 = load i32, ptr %58, align 4
  store i32 %59, ptr %13, align 4
  %60 = load ptr, ptr %8, align 8
  %61 = load i32, ptr %13, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, ptr %60, i64 %62
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %71, label %67

67:                                               ; preds = %47
  %68 = load i32, ptr %12, align 4
  %69 = load i32, ptr %11, align 4
  %70 = icmp sge i32 %68, %69
  br i1 %70, label %71, label %72

71:                                               ; preds = %67, %47
  br label %44, !llvm.loop !9

72:                                               ; preds = %67
  %73 = load ptr, ptr %8, align 8
  %74 = load i32, ptr %13, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %73, i64 %75
  store i8 1, ptr %76, align 1
  store i32 0, ptr %14, align 4
  br label %77

77:                                               ; preds = %134, %72
  %78 = load i32, ptr %14, align 4
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %79, i32 0, i32 4
  %81 = load ptr, ptr %80, align 8
  %82 = load i32, ptr %13, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i32, ptr %81, i64 %83
  %85 = load i32, ptr %84, align 4
  %86 = icmp slt i32 %78, %85
  br i1 %86, label %87, label %137

87:                                               ; preds = %77
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %88, i32 0, i32 3
  %90 = load ptr, ptr %89, align 8
  %91 = load i32, ptr %13, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds ptr, ptr %90, i64 %92
  %94 = load ptr, ptr %93, align 8
  %95 = load i32, ptr %14, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i32, ptr %94, i64 %96
  %98 = load i32, ptr %97, align 4
  store i32 %98, ptr %15, align 4
  %99 = load i32, ptr %15, align 4
  %100 = load i32, ptr %7, align 4
  %101 = icmp eq i32 %99, %100
  br i1 %101, label %102, label %111

102:                                              ; preds = %87
  %103 = load i32, ptr %12, align 4
  %104 = add nsw i32 %103, 1
  %105 = load i32, ptr %11, align 4
  %106 = icmp slt i32 %104, %105
  br i1 %106, label %107, label %110

107:                                              ; preds = %102
  %108 = load i32, ptr %12, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %11, align 4
  br label %110

110:                                              ; preds = %107, %102
  br label %133

111:                                              ; preds = %87
  %112 = load ptr, ptr %8, align 8
  %113 = load i32, ptr %15, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds i8, ptr %112, i64 %114
  %116 = load i8, ptr %115, align 1
  %117 = icmp ne i8 %116, 0
  br i1 %117, label %132, label %118

118:                                              ; preds = %111
  %119 = load i32, ptr %15, align 4
  %120 = load ptr, ptr %9, align 8
  %121 = load i32, ptr %10, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, ptr %10, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i32, ptr %120, i64 %123
  store i32 %119, ptr %124, align 4
  %125 = load i32, ptr %12, align 4
  %126 = add nsw i32 %125, 1
  %127 = load ptr, ptr %9, align 8
  %128 = load i32, ptr %10, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, ptr %10, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, ptr %127, i64 %130
  store i32 %126, ptr %131, align 4
  br label %132

132:                                              ; preds = %118, %111
  br label %133

133:                                              ; preds = %132, %110
  br label %134

134:                                              ; preds = %133
  %135 = load i32, ptr %14, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %14, align 4
  br label %77, !llvm.loop !10

137:                                              ; preds = %77
  br label %44, !llvm.loop !9

138:                                              ; preds = %44
  %139 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %139)
  %140 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %140)
  %141 = load i32, ptr %11, align 4
  %142 = icmp eq i32 %141, 2147483647
  br i1 %142, label %143, label %144

143:                                              ; preds = %138
  br label %146

144:                                              ; preds = %138
  %145 = load i32, ptr %11, align 4
  br label %146

146:                                              ; preds = %144, %143
  %147 = phi i32 [ -1, %143 ], [ %145, %144 ]
  store i32 %147, ptr %4, align 4
  br label %148

148:                                              ; preds = %146, %19
  %149 = load i32, ptr %4, align 4
  ret i32 %149
}

define dso_local i32 @GraphPathDFS_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @GraphPathDFS_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathDFSData, ptr %7, i32 0, i32 0
  call void @graph_path_base_cleanup(ptr noundef %8)
  ret void
}

define dso_local ptr @GraphPathDFS_create() {
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
  store ptr @GraphPathDFS_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @GraphPathDFS_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @GraphPathDFS_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @GraphPathDFS_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

define dso_local void @GraphPathAStar_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %8, i32 0, i32 0
  call void @graph_path_base_prepare(ptr noundef %7, ptr noundef @.str.2, ptr noundef %9)
  ret void
}

define dso_local void @GraphPathAStar_run(ptr noundef %0, i32 noundef %1) {
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
  %12 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %11, i32 0, i32 0
  %13 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %12, i32 0, i32 0
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %20, 1
  %22 = call i32 @graph_path_astar_search(ptr noundef %14, i32 noundef 0, i32 noundef %21)
  store i32 %22, ptr %6, align 4
  %23 = load i32, ptr %6, align 4
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %24, i32 0, i32 0
  %26 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = add i32 %27, %23
  store i32 %28, ptr %26, align 8
  ret void
}

define internal i32 @graph_path_astar_search(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.PriorityQueue, align 8
  %13 = alloca ptr, align 8
  %14 = alloca %struct.PriorityQueueItem, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store i32 %2, ptr %7, align 4
  %21 = load i32, ptr %6, align 4
  %22 = load i32, ptr %7, align 4
  %23 = icmp eq i32 %21, %22
  br i1 %23, label %24, label %25

24:                                               ; preds = %3
  store i32 0, ptr %4, align 4
  br label %206

25:                                               ; preds = %3
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 8
  %29 = sext i32 %28 to i64
  %30 = mul i64 %29, 4
  %31 = call noalias ptr @malloc(i64 noundef %30)
  store ptr %31, ptr %8, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %32, i32 0, i32 0
  %34 = load i32, ptr %33, align 8
  %35 = sext i32 %34 to i64
  %36 = mul i64 %35, 4
  %37 = call noalias ptr @malloc(i64 noundef %36)
  store ptr %37, ptr %9, align 8
  %38 = load ptr, ptr %5, align 8
  %39 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %38, i32 0, i32 0
  %40 = load i32, ptr %39, align 8
  %41 = sext i32 %40 to i64
  %42 = call noalias ptr @calloc(i64 noundef %41, i64 noundef 1)
  store ptr %42, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %43

43:                                               ; preds = %58, %25
  %44 = load i32, ptr %11, align 4
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %45, i32 0, i32 0
  %47 = load i32, ptr %46, align 8
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %49, label %61

49:                                               ; preds = %43
  %50 = load ptr, ptr %8, align 8
  %51 = load i32, ptr %11, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %50, i64 %52
  store i32 2147483647, ptr %53, align 4
  %54 = load ptr, ptr %9, align 8
  %55 = load i32, ptr %11, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  store i32 2147483647, ptr %57, align 4
  br label %58

58:                                               ; preds = %49
  %59 = load i32, ptr %11, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %11, align 4
  br label %43, !llvm.loop !11

61:                                               ; preds = %43
  %62 = load ptr, ptr %8, align 8
  %63 = load i32, ptr %6, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, ptr %62, i64 %64
  store i32 0, ptr %65, align 4
  %66 = load i32, ptr %6, align 4
  %67 = load i32, ptr %7, align 4
  %68 = call i32 @heuristic(i32 noundef %66, i32 noundef %67)
  %69 = load ptr, ptr %9, align 8
  %70 = load i32, ptr %6, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, ptr %69, i64 %71
  store i32 %68, ptr %72, align 4
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 16, i1 false)
  %73 = load i32, ptr %6, align 4
  %74 = load ptr, ptr %9, align 8
  %75 = load i32, ptr %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %74, i64 %76
  %78 = load i32, ptr %77, align 4
  call void @priority_queue_push(ptr noundef %12, i32 noundef %73, i32 noundef %78)
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = sext i32 %81 to i64
  %83 = call noalias ptr @calloc(i64 noundef %82, i64 noundef 1)
  store ptr %83, ptr %13, align 8
  %84 = load ptr, ptr %13, align 8
  %85 = load i32, ptr %6, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i8, ptr %84, i64 %86
  store i8 1, ptr %87, align 1
  br label %88

88:                                               ; preds = %198, %61
  %89 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %12, i32 0, i32 1
  %90 = load i32, ptr %89, align 8
  %91 = icmp sgt i32 %90, 0
  br i1 %91, label %92, label %199

92:                                               ; preds = %88
  %93 = call i64 @priority_queue_pop(ptr noundef %12)
  store i64 %93, ptr %14, align 4
  %94 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %14, i32 0, i32 0
  %95 = load i32, ptr %94, align 4
  store i32 %95, ptr %15, align 4
  %96 = load ptr, ptr %13, align 8
  %97 = load i32, ptr %15, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, ptr %96, i64 %98
  store i8 0, ptr %99, align 1
  %100 = load i32, ptr %15, align 4
  %101 = load i32, ptr %7, align 4
  %102 = icmp eq i32 %100, %101
  br i1 %102, label %103, label %116

103:                                              ; preds = %92
  %104 = load ptr, ptr %8, align 8
  %105 = load i32, ptr %15, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds i32, ptr %104, i64 %106
  %108 = load i32, ptr %107, align 4
  store i32 %108, ptr %16, align 4
  %109 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %109)
  %110 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %110)
  %111 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %111)
  %112 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %112)
  %113 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %12, i32 0, i32 0
  %114 = load ptr, ptr %113, align 8
  call void @free(ptr noundef %114)
  %115 = load i32, ptr %16, align 4
  store i32 %115, ptr %4, align 4
  br label %206

116:                                              ; preds = %92
  %117 = load ptr, ptr %10, align 8
  %118 = load i32, ptr %15, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, ptr %117, i64 %119
  store i8 1, ptr %120, align 1
  store i32 0, ptr %17, align 4
  br label %121

121:                                              ; preds = %195, %116
  %122 = load i32, ptr %17, align 4
  %123 = load ptr, ptr %5, align 8
  %124 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %123, i32 0, i32 4
  %125 = load ptr, ptr %124, align 8
  %126 = load i32, ptr %15, align 4
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds i32, ptr %125, i64 %127
  %129 = load i32, ptr %128, align 4
  %130 = icmp slt i32 %122, %129
  br i1 %130, label %131, label %198

131:                                              ; preds = %121
  %132 = load ptr, ptr %5, align 8
  %133 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %132, i32 0, i32 3
  %134 = load ptr, ptr %133, align 8
  %135 = load i32, ptr %15, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds ptr, ptr %134, i64 %136
  %138 = load ptr, ptr %137, align 8
  %139 = load i32, ptr %17, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i32, ptr %138, i64 %140
  %142 = load i32, ptr %141, align 4
  store i32 %142, ptr %18, align 4
  %143 = load ptr, ptr %10, align 8
  %144 = load i32, ptr %18, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i8, ptr %143, i64 %145
  %147 = load i8, ptr %146, align 1
  %148 = icmp ne i8 %147, 0
  br i1 %148, label %149, label %150

149:                                              ; preds = %131
  br label %195

150:                                              ; preds = %131
  %151 = load ptr, ptr %8, align 8
  %152 = load i32, ptr %15, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i32, ptr %151, i64 %153
  %155 = load i32, ptr %154, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, ptr %19, align 4
  %157 = load i32, ptr %19, align 4
  %158 = load ptr, ptr %8, align 8
  %159 = load i32, ptr %18, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds i32, ptr %158, i64 %160
  %162 = load i32, ptr %161, align 4
  %163 = icmp slt i32 %157, %162
  br i1 %163, label %164, label %194

164:                                              ; preds = %150
  %165 = load i32, ptr %19, align 4
  %166 = load ptr, ptr %8, align 8
  %167 = load i32, ptr %18, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, ptr %166, i64 %168
  store i32 %165, ptr %169, align 4
  %170 = load i32, ptr %19, align 4
  %171 = load i32, ptr %18, align 4
  %172 = load i32, ptr %7, align 4
  %173 = call i32 @heuristic(i32 noundef %171, i32 noundef %172)
  %174 = add nsw i32 %170, %173
  store i32 %174, ptr %20, align 4
  %175 = load i32, ptr %20, align 4
  %176 = load ptr, ptr %9, align 8
  %177 = load i32, ptr %18, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i32, ptr %176, i64 %178
  store i32 %175, ptr %179, align 4
  %180 = load ptr, ptr %13, align 8
  %181 = load i32, ptr %18, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds i8, ptr %180, i64 %182
  %184 = load i8, ptr %183, align 1
  %185 = icmp ne i8 %184, 0
  br i1 %185, label %193, label %186

186:                                              ; preds = %164
  %187 = load i32, ptr %18, align 4
  %188 = load i32, ptr %20, align 4
  call void @priority_queue_push(ptr noundef %12, i32 noundef %187, i32 noundef %188)
  %189 = load ptr, ptr %13, align 8
  %190 = load i32, ptr %18, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds i8, ptr %189, i64 %191
  store i8 1, ptr %192, align 1
  br label %193

193:                                              ; preds = %186, %164
  br label %194

194:                                              ; preds = %193, %150
  br label %195

195:                                              ; preds = %194, %149
  %196 = load i32, ptr %17, align 4
  %197 = add nsw i32 %196, 1
  store i32 %197, ptr %17, align 4
  br label %121, !llvm.loop !12

198:                                              ; preds = %121
  br label %88, !llvm.loop !13

199:                                              ; preds = %88
  %200 = load ptr, ptr %8, align 8
  call void @free(ptr noundef %200)
  %201 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %201)
  %202 = load ptr, ptr %10, align 8
  call void @free(ptr noundef %202)
  %203 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %203)
  %204 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %12, i32 0, i32 0
  %205 = load ptr, ptr %204, align 8
  call void @free(ptr noundef %205)
  store i32 -1, ptr %4, align 4
  br label %206

206:                                              ; preds = %199, %103, %24
  %207 = load i32, ptr %4, align 4
  ret i32 %207
}

define dso_local i32 @GraphPathAStar_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %7, i32 0, i32 0
  %9 = getelementptr inbounds nuw %struct.GraphPathBaseData, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 8
  ret i32 %10
}

define dso_local void @GraphPathAStar_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathAStarData, ptr %7, i32 0, i32 0
  call void @graph_path_base_cleanup(ptr noundef %8)
  ret void
}

define dso_local ptr @GraphPathAStar_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
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
  store ptr @GraphPathAStar_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @GraphPathAStar_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @GraphPathAStar_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @GraphPathAStar_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @graph_path_graph_new(i32 noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = call noalias ptr @malloc(i64 noundef 40)
  store ptr %9, ptr %7, align 8
  %10 = load i32, ptr %4, align 4
  %11 = load ptr, ptr %7, align 8
  %12 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %11, i32 0, i32 0
  store i32 %10, ptr %12, align 8
  %13 = load i32, ptr %5, align 4
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %14, i32 0, i32 1
  store i32 %13, ptr %15, align 4
  %16 = load i32, ptr %6, align 4
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %17, i32 0, i32 2
  store i32 %16, ptr %18, align 8
  %19 = load i32, ptr %4, align 4
  %20 = sext i32 %19 to i64
  %21 = mul i64 %20, 8
  %22 = call noalias ptr @malloc(i64 noundef %21)
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %23, i32 0, i32 3
  store ptr %22, ptr %24, align 8
  %25 = load i32, ptr %4, align 4
  %26 = sext i32 %25 to i64
  %27 = mul i64 %26, 4
  %28 = call noalias ptr @malloc(i64 noundef %27)
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %29, i32 0, i32 4
  store ptr %28, ptr %30, align 8
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = mul i64 %32, 4
  %34 = call noalias ptr @malloc(i64 noundef %33)
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %35, i32 0, i32 5
  store ptr %34, ptr %36, align 8
  store i32 0, ptr %8, align 4
  br label %37

37:                                               ; preds = %70, %3
  %38 = load i32, ptr %8, align 4
  %39 = load i32, ptr %4, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %73

41:                                               ; preds = %37
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %42, i32 0, i32 5
  %44 = load ptr, ptr %43, align 8
  %45 = load i32, ptr %8, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, ptr %44, i64 %46
  store i32 4, ptr %47, align 4
  %48 = load ptr, ptr %7, align 8
  %49 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %48, i32 0, i32 5
  %50 = load ptr, ptr %49, align 8
  %51 = load i32, ptr %8, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, ptr %50, i64 %52
  %54 = load i32, ptr %53, align 4
  %55 = sext i32 %54 to i64
  %56 = mul i64 %55, 4
  %57 = call noalias ptr @malloc(i64 noundef %56)
  %58 = load ptr, ptr %7, align 8
  %59 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %58, i32 0, i32 3
  %60 = load ptr, ptr %59, align 8
  %61 = load i32, ptr %8, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %60, i64 %62
  store ptr %57, ptr %63, align 8
  %64 = load ptr, ptr %7, align 8
  %65 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %64, i32 0, i32 4
  %66 = load ptr, ptr %65, align 8
  %67 = load i32, ptr %8, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, ptr %66, i64 %68
  store i32 0, ptr %69, align 4
  br label %70

70:                                               ; preds = %41
  %71 = load i32, ptr %8, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %8, align 4
  br label %37, !llvm.loop !14

73:                                               ; preds = %37
  %74 = load ptr, ptr %7, align 8
  ret ptr %74
}

define internal void @graph_path_graph_generate_random(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 1, ptr %3, align 4
  br label %9

9:                                                ; preds = %20, %1
  %10 = load i32, ptr %3, align 4
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %11, i32 0, i32 0
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %10, %13
  br i1 %14, label %15, label %23

15:                                               ; preds = %9
  %16 = load ptr, ptr %2, align 8
  %17 = load i32, ptr %3, align 4
  %18 = load i32, ptr %3, align 4
  %19 = sub nsw i32 %18, 1
  call void @graph_path_graph_add_edge(ptr noundef %16, i32 noundef %17, i32 noundef %19)
  br label %20

20:                                               ; preds = %15
  %21 = load i32, ptr %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, ptr %3, align 4
  br label %9, !llvm.loop !15

23:                                               ; preds = %9
  store i32 0, ptr %4, align 4
  br label %24

24:                                               ; preds = %73, %23
  %25 = load i32, ptr %4, align 4
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %26, i32 0, i32 0
  %28 = load i32, ptr %27, align 8
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %76

30:                                               ; preds = %24
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = call i32 @Helper_next_int(i32 noundef %33)
  store i32 %34, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %35

35:                                               ; preds = %69, %30
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %72

39:                                               ; preds = %35
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = call i32 @Helper_next_int(i32 noundef %42)
  %44 = load ptr, ptr %2, align 8
  %45 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %44, i32 0, i32 2
  %46 = load i32, ptr %45, align 8
  %47 = sdiv i32 %46, 2
  %48 = sub i32 %43, %47
  store i32 %48, ptr %7, align 4
  %49 = load i32, ptr %4, align 4
  %50 = load i32, ptr %7, align 4
  %51 = add nsw i32 %49, %50
  store i32 %51, ptr %8, align 4
  %52 = load i32, ptr %8, align 4
  %53 = icmp sge i32 %52, 0
  br i1 %53, label %54, label %68

54:                                               ; preds = %39
  %55 = load i32, ptr %8, align 4
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %56, i32 0, i32 0
  %58 = load i32, ptr %57, align 8
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %68

60:                                               ; preds = %54
  %61 = load i32, ptr %8, align 4
  %62 = load i32, ptr %4, align 4
  %63 = icmp ne i32 %61, %62
  br i1 %63, label %64, label %68

64:                                               ; preds = %60
  %65 = load ptr, ptr %2, align 8
  %66 = load i32, ptr %4, align 4
  %67 = load i32, ptr %8, align 4
  call void @graph_path_graph_add_edge(ptr noundef %65, i32 noundef %66, i32 noundef %67)
  br label %68

68:                                               ; preds = %64, %60, %54, %39
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %6, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %6, align 4
  br label %35, !llvm.loop !16

72:                                               ; preds = %35
  br label %73

73:                                               ; preds = %72
  %74 = load i32, ptr %4, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %4, align 4
  br label %24, !llvm.loop !17

76:                                               ; preds = %24
  ret void
}

define internal void @graph_path_graph_add_edge(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load ptr, ptr %4, align 8
  %8 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %7, i32 0, i32 4
  %9 = load ptr, ptr %8, align 8
  %10 = load i32, ptr %5, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, ptr %9, i64 %11
  %13 = load i32, ptr %12, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %14, i32 0, i32 5
  %16 = load ptr, ptr %15, align 8
  %17 = load i32, ptr %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, ptr %16, i64 %18
  %20 = load i32, ptr %19, align 4
  %21 = icmp sge i32 %13, %20
  br i1 %21, label %22, label %54

22:                                               ; preds = %3
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %23, i32 0, i32 5
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  %29 = load i32, ptr %28, align 4
  %30 = mul nsw i32 %29, 2
  store i32 %30, ptr %28, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %31, i32 0, i32 3
  %33 = load ptr, ptr %32, align 8
  %34 = load i32, ptr %5, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %33, i64 %35
  %37 = load ptr, ptr %36, align 8
  %38 = load ptr, ptr %4, align 8
  %39 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %38, i32 0, i32 5
  %40 = load ptr, ptr %39, align 8
  %41 = load i32, ptr %5, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, ptr %40, i64 %42
  %44 = load i32, ptr %43, align 4
  %45 = sext i32 %44 to i64
  %46 = mul i64 %45, 4
  %47 = call ptr @realloc(ptr noundef %37, i64 noundef %46)
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %48, i32 0, i32 3
  %50 = load ptr, ptr %49, align 8
  %51 = load i32, ptr %5, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds ptr, ptr %50, i64 %52
  store ptr %47, ptr %53, align 8
  br label %54

54:                                               ; preds = %22, %3
  %55 = load i32, ptr %6, align 4
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %56, i32 0, i32 3
  %58 = load ptr, ptr %57, align 8
  %59 = load i32, ptr %5, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds ptr, ptr %58, i64 %60
  %62 = load ptr, ptr %61, align 8
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %63, i32 0, i32 4
  %65 = load ptr, ptr %64, align 8
  %66 = load i32, ptr %5, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, ptr %65, i64 %67
  %69 = load i32, ptr %68, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %68, align 4
  %71 = sext i32 %69 to i64
  %72 = getelementptr inbounds i32, ptr %62, i64 %71
  store i32 %55, ptr %72, align 4
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %73, i32 0, i32 4
  %75 = load ptr, ptr %74, align 8
  %76 = load i32, ptr %6, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i32, ptr %75, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %80, i32 0, i32 5
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %6, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i32, ptr %82, i64 %84
  %86 = load i32, ptr %85, align 4
  %87 = icmp sge i32 %79, %86
  br i1 %87, label %88, label %120

88:                                               ; preds = %54
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %89, i32 0, i32 5
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %6, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i32, ptr %91, i64 %93
  %95 = load i32, ptr %94, align 4
  %96 = mul nsw i32 %95, 2
  store i32 %96, ptr %94, align 4
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %97, i32 0, i32 3
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds ptr, ptr %99, i64 %101
  %103 = load ptr, ptr %102, align 8
  %104 = load ptr, ptr %4, align 8
  %105 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %104, i32 0, i32 5
  %106 = load ptr, ptr %105, align 8
  %107 = load i32, ptr %6, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, ptr %106, i64 %108
  %110 = load i32, ptr %109, align 4
  %111 = sext i32 %110 to i64
  %112 = mul i64 %111, 4
  %113 = call ptr @realloc(ptr noundef %103, i64 noundef %112)
  %114 = load ptr, ptr %4, align 8
  %115 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %114, i32 0, i32 3
  %116 = load ptr, ptr %115, align 8
  %117 = load i32, ptr %6, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds ptr, ptr %116, i64 %118
  store ptr %113, ptr %119, align 8
  br label %120

120:                                              ; preds = %88, %54
  %121 = load i32, ptr %5, align 4
  %122 = load ptr, ptr %4, align 8
  %123 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %122, i32 0, i32 3
  %124 = load ptr, ptr %123, align 8
  %125 = load i32, ptr %6, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds ptr, ptr %124, i64 %126
  %128 = load ptr, ptr %127, align 8
  %129 = load ptr, ptr %4, align 8
  %130 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %129, i32 0, i32 4
  %131 = load ptr, ptr %130, align 8
  %132 = load i32, ptr %6, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, ptr %131, i64 %133
  %135 = load i32, ptr %134, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, ptr %134, align 4
  %137 = sext i32 %135 to i64
  %138 = getelementptr inbounds i32, ptr %128, i64 %137
  store i32 %121, ptr %138, align 4
  ret void
}

declare i32 @Helper_next_int(i32 noundef)

declare ptr @realloc(ptr noundef, i64 noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

declare void @free(ptr noundef)

define internal void @graph_path_graph_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  br label %64

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %8, i32 0, i32 3
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %44

12:                                               ; preds = %7
  store i32 0, ptr %3, align 4
  br label %13

13:                                               ; preds = %37, %12
  %14 = load i32, ptr %3, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %40

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %20, i32 0, i32 3
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds ptr, ptr %22, i64 %24
  %26 = load ptr, ptr %25, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %36

28:                                               ; preds = %19
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = load i32, ptr %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds ptr, ptr %31, i64 %33
  %35 = load ptr, ptr %34, align 8
  call void @free(ptr noundef %35)
  br label %36

36:                                               ; preds = %28, %19
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %3, align 4
  br label %13, !llvm.loop !18

40:                                               ; preds = %13
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %41, i32 0, i32 3
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  br label %44

44:                                               ; preds = %40, %7
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %45, i32 0, i32 4
  %47 = load ptr, ptr %46, align 8
  %48 = icmp ne ptr %47, null
  br i1 %48, label %49, label %53

49:                                               ; preds = %44
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %50, i32 0, i32 4
  %52 = load ptr, ptr %51, align 8
  call void @free(ptr noundef %52)
  br label %53

53:                                               ; preds = %49, %44
  %54 = load ptr, ptr %2, align 8
  %55 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %54, i32 0, i32 5
  %56 = load ptr, ptr %55, align 8
  %57 = icmp ne ptr %56, null
  br i1 %57, label %58, label %62

58:                                               ; preds = %53
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds nuw %struct.GraphPathGraph, ptr %59, i32 0, i32 5
  %61 = load ptr, ptr %60, align 8
  call void @free(ptr noundef %61)
  br label %62

62:                                               ; preds = %58, %53
  %63 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %63)
  br label %64

64:                                               ; preds = %62, %6
  ret void
}

define internal i32 @heuristic(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %4, align 4
  %6 = load i32, ptr %3, align 4
  %7 = sub nsw i32 %5, %6
  ret i32 %7
}

define internal void @priority_queue_push(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.PriorityQueueItem, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 4
  %16 = icmp sge i32 %12, %15
  br i1 %16, label %17, label %43

17:                                               ; preds = %3
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %23

22:                                               ; preds = %17
  br label %28

23:                                               ; preds = %17
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 4
  %27 = mul nsw i32 %26, 2
  br label %28

28:                                               ; preds = %23, %22
  %29 = phi i32 [ 16, %22 ], [ %27, %23 ]
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %30, i32 0, i32 2
  store i32 %29, ptr %31, align 4
  %32 = load ptr, ptr %4, align 8
  %33 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %35, i32 0, i32 2
  %37 = load i32, ptr %36, align 4
  %38 = sext i32 %37 to i64
  %39 = mul i64 %38, 8
  %40 = call ptr @realloc(ptr noundef %34, i64 noundef %39)
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %41, i32 0, i32 0
  store ptr %40, ptr %42, align 8
  br label %43

43:                                               ; preds = %28, %3
  %44 = load ptr, ptr %4, align 8
  %45 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 8
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %45, align 8
  store i32 %46, ptr %7, align 4
  br label %48

48:                                               ; preds = %66, %43
  %49 = load i32, ptr %7, align 4
  %50 = icmp sgt i32 %49, 0
  br i1 %50, label %51, label %80

51:                                               ; preds = %48
  %52 = load i32, ptr %7, align 4
  %53 = sub nsw i32 %52, 1
  %54 = sdiv i32 %53, 2
  store i32 %54, ptr %8, align 4
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load i32, ptr %8, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds %struct.PriorityQueueItem, ptr %57, i64 %59
  %61 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %60, i32 0, i32 1
  %62 = load i32, ptr %61, align 4
  %63 = load i32, ptr %6, align 4
  %64 = icmp sle i32 %62, %63
  br i1 %64, label %65, label %66

65:                                               ; preds = %51
  br label %80

66:                                               ; preds = %51
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %67, i32 0, i32 0
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %7, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds %struct.PriorityQueueItem, ptr %69, i64 %71
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %73, i32 0, i32 0
  %75 = load ptr, ptr %74, align 8
  %76 = load i32, ptr %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds %struct.PriorityQueueItem, ptr %75, i64 %77
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %72, ptr align 4 %78, i64 8, i1 false)
  %79 = load i32, ptr %8, align 4
  store i32 %79, ptr %7, align 4
  br label %48, !llvm.loop !19

80:                                               ; preds = %65, %48
  %81 = load ptr, ptr %4, align 8
  %82 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %81, i32 0, i32 0
  %83 = load ptr, ptr %82, align 8
  %84 = load i32, ptr %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds %struct.PriorityQueueItem, ptr %83, i64 %85
  %87 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %9, i32 0, i32 0
  %88 = load i32, ptr %5, align 4
  store i32 %88, ptr %87, align 4
  %89 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %9, i32 0, i32 1
  %90 = load i32, ptr %6, align 4
  store i32 %90, ptr %89, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %86, ptr align 4 %9, i64 8, i1 false)
  ret void
}

define internal i64 @priority_queue_pop(ptr noundef %0) {
  %2 = alloca %struct.PriorityQueueItem, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.PriorityQueueItem, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.PriorityQueueItem, ptr %11, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %12, i64 8, i1 false)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %13, i32 0, i32 1
  %15 = load i32, ptr %14, align 8
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %14, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %115

21:                                               ; preds = %1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %25, i32 0, i32 1
  %27 = load i32, ptr %26, align 8
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.PriorityQueueItem, ptr %24, i64 %28
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %4, ptr align 4 %29, i64 8, i1 false)
  store i32 0, ptr %5, align 4
  br label %30

30:                                               ; preds = %21, %94
  %31 = load i32, ptr %5, align 4
  %32 = mul nsw i32 2, %31
  %33 = add nsw i32 %32, 1
  store i32 %33, ptr %6, align 4
  %34 = load i32, ptr %5, align 4
  %35 = mul nsw i32 2, %34
  %36 = add nsw i32 %35, 2
  store i32 %36, ptr %7, align 4
  %37 = load i32, ptr %5, align 4
  store i32 %37, ptr %8, align 4
  %38 = load i32, ptr %6, align 4
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %39, i32 0, i32 1
  %41 = load i32, ptr %40, align 8
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %43, label %63

43:                                               ; preds = %30
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.PriorityQueueItem, ptr %46, i64 %48
  %50 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %49, i32 0, i32 1
  %51 = load i32, ptr %50, align 4
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds %struct.PriorityQueueItem, ptr %54, i64 %56
  %58 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %57, i32 0, i32 1
  %59 = load i32, ptr %58, align 4
  %60 = icmp slt i32 %51, %59
  br i1 %60, label %61, label %63

61:                                               ; preds = %43
  %62 = load i32, ptr %6, align 4
  store i32 %62, ptr %8, align 4
  br label %63

63:                                               ; preds = %61, %43, %30
  %64 = load i32, ptr %7, align 4
  %65 = load ptr, ptr %3, align 8
  %66 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %65, i32 0, i32 1
  %67 = load i32, ptr %66, align 8
  %68 = icmp slt i32 %64, %67
  br i1 %68, label %69, label %89

69:                                               ; preds = %63
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %70, i32 0, i32 0
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %7, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds %struct.PriorityQueueItem, ptr %72, i64 %74
  %76 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %75, i32 0, i32 1
  %77 = load i32, ptr %76, align 4
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %78, i32 0, i32 0
  %80 = load ptr, ptr %79, align 8
  %81 = load i32, ptr %8, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.PriorityQueueItem, ptr %80, i64 %82
  %84 = getelementptr inbounds nuw %struct.PriorityQueueItem, ptr %83, i32 0, i32 1
  %85 = load i32, ptr %84, align 4
  %86 = icmp slt i32 %77, %85
  br i1 %86, label %87, label %89

87:                                               ; preds = %69
  %88 = load i32, ptr %7, align 4
  store i32 %88, ptr %8, align 4
  br label %89

89:                                               ; preds = %87, %69, %63
  %90 = load i32, ptr %8, align 4
  %91 = load i32, ptr %5, align 4
  %92 = icmp eq i32 %90, %91
  br i1 %92, label %93, label %94

93:                                               ; preds = %89
  br label %108

94:                                               ; preds = %89
  %95 = load ptr, ptr %3, align 8
  %96 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %95, i32 0, i32 0
  %97 = load ptr, ptr %96, align 8
  %98 = load i32, ptr %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.PriorityQueueItem, ptr %97, i64 %99
  %101 = load ptr, ptr %3, align 8
  %102 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %101, i32 0, i32 0
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %8, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.PriorityQueueItem, ptr %103, i64 %105
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %100, ptr align 4 %106, i64 8, i1 false)
  %107 = load i32, ptr %8, align 4
  store i32 %107, ptr %5, align 4
  br label %30

108:                                              ; preds = %93
  %109 = load ptr, ptr %3, align 8
  %110 = getelementptr inbounds nuw %struct.PriorityQueue, ptr %109, i32 0, i32 0
  %111 = load ptr, ptr %110, align 8
  %112 = load i32, ptr %5, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.PriorityQueueItem, ptr %111, i64 %113
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %114, ptr align 4 %4, i64 8, i1 false)
  br label %115

115:                                              ; preds = %108, %1
  %116 = load i64, ptr %2, align 4
  ret i64 %116
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)


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
