; ModuleID = 'c/src/maze.c'
source_filename = "c/src/maze.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.MazeGeneratorData = type { i32, i32, i32, ptr }
%struct.Maze = type { i32, i32, ptr, ptr, ptr }
%struct.MazeCell = type { i32, [4 x ptr], i32, i32, i32 }
%struct.MazeBFSData = type { i32, i32, i32, ptr, ptr, i32 }
%struct.PathNode = type { ptr, i32 }
%struct.MazeAStarData = type { i32, i32, i32, ptr, ptr, i32 }
%struct.AStarPriorityQueueEntry = type { i32, i32 }
%struct.AStarPriorityQueue = type { ptr, ptr, i32, i32 }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Maze::Generator\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"Maze::BFS\00", align 1
@.str.4 = private unnamed_addr constant [12 x i8] c"Maze::AStar\00", align 1

define dso_local void @MazeGenerator_prepare(ptr noundef %0) {
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
  %13 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %12, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i64 @Helper_config_i64(ptr noundef %16, ptr noundef @.str.1)
  %18 = trunc i64 %17 to i32
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %19, i32 0, i32 2
  store i32 %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %25, label %28

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %26, i32 0, i32 1
  store i32 5, ptr %27, align 4
  br label %28

28:                                               ; preds = %25, %1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = icmp slt i32 %31, 5
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %34, i32 0, i32 2
  store i32 5, ptr %35, align 8
  br label %36

36:                                               ; preds = %33, %28
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = call ptr @maze_create(i32 noundef %39, i32 noundef %42)
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %44, i32 0, i32 3
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %46, i32 0, i32 3
  %48 = load ptr, ptr %47, align 8
  call void @maze_update_neighbors(ptr noundef %48)
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %49, i32 0, i32 0
  store i32 0, ptr %50, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @maze_create(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %8 = call noalias ptr @malloc(i64 noundef 32)
  store ptr %8, ptr %5, align 8
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.Maze, ptr %10, i32 0, i32 0
  store i32 %9, ptr %11, align 8
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.Maze, ptr %13, i32 0, i32 1
  store i32 %12, ptr %14, align 4
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = mul i64 %16, 8
  %18 = call noalias ptr @malloc(i64 noundef %17)
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.Maze, ptr %19, i32 0, i32 2
  store ptr %18, ptr %20, align 8
  store i32 0, ptr %6, align 4
  br label %21

21:                                               ; preds = %58, %2
  %22 = load i32, ptr %6, align 4
  %23 = load i32, ptr %4, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %61

25:                                               ; preds = %21
  %26 = load i32, ptr %3, align 4
  %27 = sext i32 %26 to i64
  %28 = mul i64 %27, 56
  %29 = call noalias ptr @malloc(i64 noundef %28)
  %30 = load ptr, ptr %5, align 8
  %31 = getelementptr inbounds nuw %struct.Maze, ptr %30, i32 0, i32 2
  %32 = load ptr, ptr %31, align 8
  %33 = load i32, ptr %6, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds ptr, ptr %32, i64 %34
  store ptr %29, ptr %35, align 8
  store i32 0, ptr %7, align 4
  br label %36

36:                                               ; preds = %54, %25
  %37 = load i32, ptr %7, align 4
  %38 = load i32, ptr %3, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %57

40:                                               ; preds = %36
  %41 = load ptr, ptr %5, align 8
  %42 = getelementptr inbounds nuw %struct.Maze, ptr %41, i32 0, i32 2
  %43 = load ptr, ptr %42, align 8
  %44 = load i32, ptr %6, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds ptr, ptr %43, i64 %45
  %47 = load ptr, ptr %46, align 8
  %48 = load i32, ptr %7, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds %struct.MazeCell, ptr %47, i64 %49
  %51 = load i32, ptr %7, align 4
  %52 = load i32, ptr %6, align 4
  %53 = call ptr @maze_cell_create(i32 noundef %51, i32 noundef %52)
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %50, ptr align 8 %53, i64 56, i1 false)
  br label %54

54:                                               ; preds = %40
  %55 = load i32, ptr %7, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %7, align 4
  br label %36, !llvm.loop !6

57:                                               ; preds = %36
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %6, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %6, align 4
  br label %21, !llvm.loop !8

61:                                               ; preds = %21
  %62 = load ptr, ptr %5, align 8
  %63 = getelementptr inbounds nuw %struct.Maze, ptr %62, i32 0, i32 2
  %64 = load ptr, ptr %63, align 8
  %65 = getelementptr inbounds ptr, ptr %64, i64 1
  %66 = load ptr, ptr %65, align 8
  %67 = getelementptr inbounds %struct.MazeCell, ptr %66, i64 1
  %68 = load ptr, ptr %5, align 8
  %69 = getelementptr inbounds nuw %struct.Maze, ptr %68, i32 0, i32 3
  store ptr %67, ptr %69, align 8
  %70 = load ptr, ptr %5, align 8
  %71 = getelementptr inbounds nuw %struct.Maze, ptr %70, i32 0, i32 2
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %4, align 4
  %74 = sub nsw i32 %73, 2
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds ptr, ptr %72, i64 %75
  %77 = load ptr, ptr %76, align 8
  %78 = load i32, ptr %3, align 4
  %79 = sub nsw i32 %78, 2
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds %struct.MazeCell, ptr %77, i64 %80
  %82 = load ptr, ptr %5, align 8
  %83 = getelementptr inbounds nuw %struct.Maze, ptr %82, i32 0, i32 4
  store ptr %81, ptr %83, align 8
  %84 = load ptr, ptr %5, align 8
  %85 = getelementptr inbounds nuw %struct.Maze, ptr %84, i32 0, i32 3
  %86 = load ptr, ptr %85, align 8
  %87 = getelementptr inbounds nuw %struct.MazeCell, ptr %86, i32 0, i32 0
  store i32 2, ptr %87, align 8
  %88 = load ptr, ptr %5, align 8
  %89 = getelementptr inbounds nuw %struct.Maze, ptr %88, i32 0, i32 4
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds nuw %struct.MazeCell, ptr %90, i32 0, i32 0
  store i32 3, ptr %91, align 8
  %92 = load ptr, ptr %5, align 8
  ret ptr %92
}

define internal void @maze_update_neighbors(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %10

10:                                               ; preds = %150, %1
  %11 = load i32, ptr %3, align 4
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Maze, ptr %12, i32 0, i32 1
  %14 = load i32, ptr %13, align 4
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %153

16:                                               ; preds = %10
  store i32 0, ptr %4, align 4
  br label %17

17:                                               ; preds = %146, %16
  %18 = load i32, ptr %4, align 4
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.Maze, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = icmp slt i32 %18, %21
  br i1 %22, label %23, label %149

23:                                               ; preds = %17
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.Maze, ptr %24, i32 0, i32 2
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %3, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds ptr, ptr %26, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = load i32, ptr %4, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.MazeCell, ptr %30, i64 %32
  store ptr %33, ptr %5, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.MazeCell, ptr %34, i32 0, i32 2
  store i32 0, ptr %35, align 8
  %36 = load i32, ptr %4, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %38, label %142

38:                                               ; preds = %23
  %39 = load i32, ptr %3, align 4
  %40 = icmp sgt i32 %39, 0
  br i1 %40, label %41, label %142

41:                                               ; preds = %38
  %42 = load i32, ptr %4, align 4
  %43 = load ptr, ptr %2, align 8
  %44 = getelementptr inbounds nuw %struct.Maze, ptr %43, i32 0, i32 0
  %45 = load i32, ptr %44, align 8
  %46 = sub nsw i32 %45, 1
  %47 = icmp slt i32 %42, %46
  br i1 %47, label %48, label %142

48:                                               ; preds = %41
  %49 = load i32, ptr %3, align 4
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds nuw %struct.Maze, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = sub nsw i32 %52, 1
  %54 = icmp slt i32 %49, %53
  br i1 %54, label %55, label %142

55:                                               ; preds = %48
  %56 = load ptr, ptr %5, align 8
  %57 = load ptr, ptr %2, align 8
  %58 = getelementptr inbounds nuw %struct.Maze, ptr %57, i32 0, i32 2
  %59 = load ptr, ptr %58, align 8
  %60 = load i32, ptr %3, align 4
  %61 = sub nsw i32 %60, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %59, i64 %62
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %4, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds %struct.MazeCell, ptr %64, i64 %66
  call void @maze_cell_add_neighbor(ptr noundef %56, ptr noundef %67)
  %68 = load ptr, ptr %5, align 8
  %69 = load ptr, ptr %2, align 8
  %70 = getelementptr inbounds nuw %struct.Maze, ptr %69, i32 0, i32 2
  %71 = load ptr, ptr %70, align 8
  %72 = load i32, ptr %3, align 4
  %73 = add nsw i32 %72, 1
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds ptr, ptr %71, i64 %74
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %4, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds %struct.MazeCell, ptr %76, i64 %78
  call void @maze_cell_add_neighbor(ptr noundef %68, ptr noundef %79)
  %80 = load ptr, ptr %5, align 8
  %81 = load ptr, ptr %2, align 8
  %82 = getelementptr inbounds nuw %struct.Maze, ptr %81, i32 0, i32 2
  %83 = load ptr, ptr %82, align 8
  %84 = load i32, ptr %3, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds ptr, ptr %83, i64 %85
  %87 = load ptr, ptr %86, align 8
  %88 = load i32, ptr %4, align 4
  %89 = add nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.MazeCell, ptr %87, i64 %90
  call void @maze_cell_add_neighbor(ptr noundef %80, ptr noundef %91)
  %92 = load ptr, ptr %5, align 8
  %93 = load ptr, ptr %2, align 8
  %94 = getelementptr inbounds nuw %struct.Maze, ptr %93, i32 0, i32 2
  %95 = load ptr, ptr %94, align 8
  %96 = load i32, ptr %3, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds ptr, ptr %95, i64 %97
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %4, align 4
  %101 = sub nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds %struct.MazeCell, ptr %99, i64 %102
  call void @maze_cell_add_neighbor(ptr noundef %92, ptr noundef %103)
  store i32 0, ptr %6, align 4
  br label %104

104:                                              ; preds = %138, %55
  %105 = load i32, ptr %6, align 4
  %106 = icmp slt i32 %105, 4
  br i1 %106, label %107, label %141

107:                                              ; preds = %104
  %108 = call i32 @Helper_next_int(i32 noundef 4)
  store i32 %108, ptr %7, align 4
  %109 = call i32 @Helper_next_int(i32 noundef 4)
  store i32 %109, ptr %8, align 4
  %110 = load i32, ptr %7, align 4
  %111 = load i32, ptr %8, align 4
  %112 = icmp ne i32 %110, %111
  br i1 %112, label %113, label %137

113:                                              ; preds = %107
  %114 = load ptr, ptr %5, align 8
  %115 = getelementptr inbounds nuw %struct.MazeCell, ptr %114, i32 0, i32 1
  %116 = load i32, ptr %7, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [4 x ptr], ptr %115, i64 0, i64 %117
  %119 = load ptr, ptr %118, align 8
  store ptr %119, ptr %9, align 8
  %120 = load ptr, ptr %5, align 8
  %121 = getelementptr inbounds nuw %struct.MazeCell, ptr %120, i32 0, i32 1
  %122 = load i32, ptr %8, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [4 x ptr], ptr %121, i64 0, i64 %123
  %125 = load ptr, ptr %124, align 8
  %126 = load ptr, ptr %5, align 8
  %127 = getelementptr inbounds nuw %struct.MazeCell, ptr %126, i32 0, i32 1
  %128 = load i32, ptr %7, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [4 x ptr], ptr %127, i64 0, i64 %129
  store ptr %125, ptr %130, align 8
  %131 = load ptr, ptr %9, align 8
  %132 = load ptr, ptr %5, align 8
  %133 = getelementptr inbounds nuw %struct.MazeCell, ptr %132, i32 0, i32 1
  %134 = load i32, ptr %8, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [4 x ptr], ptr %133, i64 0, i64 %135
  store ptr %131, ptr %136, align 8
  br label %137

137:                                              ; preds = %113, %107
  br label %138

138:                                              ; preds = %137
  %139 = load i32, ptr %6, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %6, align 4
  br label %104, !llvm.loop !9

141:                                              ; preds = %104
  br label %145

142:                                              ; preds = %48, %41, %38, %23
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds nuw %struct.MazeCell, ptr %143, i32 0, i32 0
  store i32 4, ptr %144, align 8
  br label %145

145:                                              ; preds = %142, %141
  br label %146

146:                                              ; preds = %145
  %147 = load i32, ptr %4, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, ptr %4, align 4
  br label %17, !llvm.loop !10

149:                                              ; preds = %17
  br label %150

150:                                              ; preds = %149
  %151 = load i32, ptr %3, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, ptr %3, align 4
  br label %10, !llvm.loop !11

153:                                              ; preds = %10
  ret void
}

define dso_local void @MazeGenerator_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  call void @maze_reset(ptr noundef %12)
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %13, i32 0, i32 3
  %15 = load ptr, ptr %14, align 8
  call void @maze_generate(ptr noundef %15)
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = call ptr @maze_middle_cell(ptr noundef %18)
  %20 = getelementptr inbounds nuw %struct.MazeCell, ptr %19, i32 0, i32 0
  %21 = load i32, ptr %20, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = add i32 %24, %21
  store i32 %25, ptr %23, align 8
  ret void
}

define internal void @maze_reset(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %33, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Maze, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %36

11:                                               ; preds = %5
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %29, %11
  %13 = load i32, ptr %4, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.Maze, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %32

18:                                               ; preds = %12
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.Maze, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds %struct.MazeCell, ptr %25, i64 %27
  call void @maze_cell_reset(ptr noundef %28)
  br label %29

29:                                               ; preds = %18
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %12, !llvm.loop !12

32:                                               ; preds = %12
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %3, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %3, align 4
  br label %5, !llvm.loop !13

36:                                               ; preds = %5
  %37 = load ptr, ptr %2, align 8
  %38 = getelementptr inbounds nuw %struct.Maze, ptr %37, i32 0, i32 3
  %39 = load ptr, ptr %38, align 8
  %40 = getelementptr inbounds nuw %struct.MazeCell, ptr %39, i32 0, i32 0
  store i32 2, ptr %40, align 8
  %41 = load ptr, ptr %2, align 8
  %42 = getelementptr inbounds nuw %struct.Maze, ptr %41, i32 0, i32 4
  %43 = load ptr, ptr %42, align 8
  %44 = getelementptr inbounds nuw %struct.MazeCell, ptr %43, i32 0, i32 0
  store i32 3, ptr %44, align 8
  ret void
}

define internal void @maze_generate(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %32, %1
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.Maze, ptr %9, i32 0, i32 3
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds nuw %struct.MazeCell, ptr %11, i32 0, i32 2
  %13 = load i32, ptr %12, align 8
  %14 = icmp slt i32 %8, %13
  br i1 %14, label %15, label %35

15:                                               ; preds = %7
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Maze, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.MazeCell, ptr %18, i32 0, i32 1
  %20 = load i32, ptr %3, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x ptr], ptr %19, i64 0, i64 %21
  %23 = load ptr, ptr %22, align 8
  store ptr %23, ptr %4, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.MazeCell, ptr %24, i32 0, i32 0
  %26 = load i32, ptr %25, align 8
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %31

28:                                               ; preds = %15
  %29 = load ptr, ptr %2, align 8
  %30 = load ptr, ptr %4, align 8
  call void @maze_dig(ptr noundef %29, ptr noundef %30)
  br label %31

31:                                               ; preds = %28, %15
  br label %32

32:                                               ; preds = %31
  %33 = load i32, ptr %3, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %3, align 4
  br label %7, !llvm.loop !14

35:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %36

36:                                               ; preds = %61, %35
  %37 = load i32, ptr %5, align 4
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.Maze, ptr %38, i32 0, i32 4
  %40 = load ptr, ptr %39, align 8
  %41 = getelementptr inbounds nuw %struct.MazeCell, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = icmp slt i32 %37, %42
  br i1 %43, label %44, label %64

44:                                               ; preds = %36
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds nuw %struct.Maze, ptr %45, i32 0, i32 4
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.MazeCell, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %5, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [4 x ptr], ptr %48, i64 0, i64 %50
  %52 = load ptr, ptr %51, align 8
  store ptr %52, ptr %6, align 8
  %53 = load ptr, ptr %6, align 8
  %54 = getelementptr inbounds nuw %struct.MazeCell, ptr %53, i32 0, i32 0
  %55 = load i32, ptr %54, align 8
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %57, label %60

57:                                               ; preds = %44
  %58 = load ptr, ptr %2, align 8
  %59 = load ptr, ptr %6, align 8
  call void @maze_ensure_open_finish(ptr noundef %58, ptr noundef %59)
  br label %60

60:                                               ; preds = %57, %44
  br label %61

61:                                               ; preds = %60
  %62 = load i32, ptr %5, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %5, align 4
  br label %36, !llvm.loop !15

64:                                               ; preds = %36
  ret void
}

define internal ptr @maze_middle_cell(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Maze, ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Maze, ptr %6, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = sdiv i32 %8, 2
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds ptr, ptr %5, i64 %10
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Maze, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = sdiv i32 %15, 2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds %struct.MazeCell, ptr %12, i64 %17
  ret ptr %18
}

define dso_local i32 @MazeGenerator_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %10, i32 0, i32 3
  %12 = load ptr, ptr %11, align 8
  %13 = call i32 @maze_checksum(ptr noundef %12)
  %14 = add i32 %9, %13
  ret i32 %14
}

define internal i32 @maze_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 -2128831035, ptr %3, align 4
  store i32 16777619, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %8

8:                                                ; preds = %49, %1
  %9 = load i32, ptr %5, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.Maze, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %52

14:                                               ; preds = %8
  store i32 0, ptr %6, align 4
  br label %15

15:                                               ; preds = %45, %14
  %16 = load i32, ptr %6, align 4
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.Maze, ptr %17, i32 0, i32 0
  %19 = load i32, ptr %18, align 8
  %20 = icmp slt i32 %16, %19
  br i1 %20, label %21, label %48

21:                                               ; preds = %15
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.Maze, ptr %22, i32 0, i32 2
  %24 = load ptr, ptr %23, align 8
  %25 = load i32, ptr %5, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds ptr, ptr %24, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = load i32, ptr %6, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds %struct.MazeCell, ptr %28, i64 %30
  %32 = getelementptr inbounds nuw %struct.MazeCell, ptr %31, i32 0, i32 0
  %33 = load i32, ptr %32, align 8
  %34 = icmp eq i32 %33, 1
  br i1 %34, label %35, label %44

35:                                               ; preds = %21
  %36 = load i32, ptr %6, align 4
  %37 = load i32, ptr %5, align 4
  %38 = mul nsw i32 %36, %37
  store i32 %38, ptr %7, align 4
  %39 = load i32, ptr %3, align 4
  %40 = load i32, ptr %7, align 4
  %41 = xor i32 %39, %40
  %42 = load i32, ptr %4, align 4
  %43 = mul i32 %41, %42
  store i32 %43, ptr %3, align 4
  br label %44

44:                                               ; preds = %35, %21
  br label %45

45:                                               ; preds = %44
  %46 = load i32, ptr %6, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, ptr %6, align 4
  br label %15, !llvm.loop !16

48:                                               ; preds = %15
  br label %49

49:                                               ; preds = %48
  %50 = load i32, ptr %5, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, ptr %5, align 4
  br label %8, !llvm.loop !17

52:                                               ; preds = %8
  %53 = load i32, ptr %3, align 4
  ret i32 %53
}

define dso_local void @MazeGenerator_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %7, i32 0, i32 3
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %12, i32 0, i32 3
  %14 = load ptr, ptr %13, align 8
  call void @maze_free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.MazeGeneratorData, ptr %15, i32 0, i32 3
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  ret void
}

define internal void @maze_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  br label %30

7:                                                ; preds = %1
  store i32 0, ptr %3, align 4
  br label %8

8:                                                ; preds = %22, %7
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.Maze, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = icmp slt i32 %9, %12
  br i1 %13, label %14, label %25

14:                                               ; preds = %8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.Maze, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  %18 = load i32, ptr %3, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds ptr, ptr %17, i64 %19
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21)
  br label %22

22:                                               ; preds = %14
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %8, !llvm.loop !18

25:                                               ; preds = %8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.Maze, ptr %26, i32 0, i32 2
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %29)
  br label %30

30:                                               ; preds = %25, %6
  ret void
}

define dso_local ptr @MazeGenerator_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 24)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 3
  store ptr @MazeGenerator_prepare, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 4
  store ptr @MazeGenerator_run, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 7
  store ptr @MazeGenerator_checksum, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 10
  store ptr @MazeGenerator_cleanup, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define dso_local void @MazeBFS_prepare(ptr noundef %0) {
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
  %13 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %12, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i64 @Helper_config_i64(ptr noundef %16, ptr noundef @.str.1)
  %18 = trunc i64 %17 to i32
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %19, i32 0, i32 2
  store i32 %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %25, label %28

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %26, i32 0, i32 1
  store i32 5, ptr %27, align 4
  br label %28

28:                                               ; preds = %25, %1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = icmp slt i32 %31, 5
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %34, i32 0, i32 2
  store i32 5, ptr %35, align 8
  br label %36

36:                                               ; preds = %33, %28
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = call ptr @maze_create(i32 noundef %39, i32 noundef %42)
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %44, i32 0, i32 3
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %46, i32 0, i32 3
  %48 = load ptr, ptr %47, align 8
  call void @maze_update_neighbors(ptr noundef %48)
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %49, i32 0, i32 3
  %51 = load ptr, ptr %50, align 8
  call void @maze_generate(ptr noundef %51)
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %52, i32 0, i32 0
  store i32 0, ptr %53, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %54, i32 0, i32 4
  store ptr null, ptr %55, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %56, i32 0, i32 5
  store i32 0, ptr %57, align 8
  ret void
}

define dso_local void @MazeBFS_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %18, i32 0, i32 4
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds nuw %struct.Maze, ptr %26, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds nuw %struct.Maze, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %34, i32 0, i32 5
  %36 = call ptr @maze_bfs(ptr noundef %23, ptr noundef %28, ptr noundef %33, ptr noundef %35)
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %37, i32 0, i32 4
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %39, i32 0, i32 5
  %41 = load i32, ptr %40, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = add i32 %44, %41
  store i32 %45, ptr %43, align 8
  ret void
}

declare void @free(ptr noundef)

define internal ptr @maze_bfs(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %30 = load ptr, ptr %7, align 8
  %31 = load ptr, ptr %8, align 8
  %32 = icmp eq ptr %30, %31
  br i1 %32, label %33, label %40

33:                                               ; preds = %4
  %34 = load ptr, ptr %9, align 8
  store i32 1, ptr %34, align 4
  %35 = call noalias ptr @malloc(i64 noundef 8)
  store ptr %35, ptr %10, align 8
  %36 = load ptr, ptr %7, align 8
  %37 = load ptr, ptr %10, align 8
  %38 = getelementptr inbounds ptr, ptr %37, i64 0
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %10, align 8
  store ptr %39, ptr %5, align 8
  br label %287

40:                                               ; preds = %4
  %41 = load ptr, ptr %6, align 8
  %42 = getelementptr inbounds nuw %struct.Maze, ptr %41, i32 0, i32 0
  %43 = load i32, ptr %42, align 8
  store i32 %43, ptr %11, align 4
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds nuw %struct.Maze, ptr %44, i32 0, i32 1
  %46 = load i32, ptr %45, align 4
  store i32 %46, ptr %12, align 4
  %47 = load i32, ptr %11, align 4
  %48 = load i32, ptr %12, align 4
  %49 = mul nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = mul i64 %50, 4
  %52 = call noalias ptr @malloc(i64 noundef %51)
  store ptr %52, ptr %13, align 8
  store i32 0, ptr %14, align 4
  store i32 0, ptr %15, align 4
  %53 = load i32, ptr %12, align 4
  %54 = sext i32 %53 to i64
  %55 = mul i64 %54, 8
  %56 = call noalias ptr @malloc(i64 noundef %55)
  store ptr %56, ptr %16, align 8
  store i32 0, ptr %17, align 4
  br label %57

57:                                               ; preds = %69, %40
  %58 = load i32, ptr %17, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %72

61:                                               ; preds = %57
  %62 = load i32, ptr %11, align 4
  %63 = sext i32 %62 to i64
  %64 = call noalias ptr @calloc(i64 noundef %63, i64 noundef 1)
  %65 = load ptr, ptr %16, align 8
  %66 = load i32, ptr %17, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds ptr, ptr %65, i64 %67
  store ptr %64, ptr %68, align 8
  br label %69

69:                                               ; preds = %61
  %70 = load i32, ptr %17, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %17, align 4
  br label %57, !llvm.loop !19

72:                                               ; preds = %57
  %73 = load i32, ptr %11, align 4
  %74 = load i32, ptr %12, align 4
  %75 = mul nsw i32 %73, %74
  %76 = sext i32 %75 to i64
  %77 = mul i64 %76, 16
  %78 = call noalias ptr @malloc(i64 noundef %77)
  store ptr %78, ptr %18, align 8
  store i32 0, ptr %19, align 4
  %79 = load ptr, ptr %16, align 8
  %80 = load ptr, ptr %7, align 8
  %81 = getelementptr inbounds nuw %struct.MazeCell, ptr %80, i32 0, i32 4
  %82 = load i32, ptr %81, align 8
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds ptr, ptr %79, i64 %83
  %85 = load ptr, ptr %84, align 8
  %86 = load ptr, ptr %7, align 8
  %87 = getelementptr inbounds nuw %struct.MazeCell, ptr %86, i32 0, i32 3
  %88 = load i32, ptr %87, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, ptr %85, i64 %89
  store i8 1, ptr %90, align 1
  %91 = load ptr, ptr %7, align 8
  %92 = load ptr, ptr %18, align 8
  %93 = load i32, ptr %19, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds %struct.PathNode, ptr %92, i64 %94
  %96 = getelementptr inbounds nuw %struct.PathNode, ptr %95, i32 0, i32 0
  store ptr %91, ptr %96, align 8
  %97 = load ptr, ptr %18, align 8
  %98 = load i32, ptr %19, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.PathNode, ptr %97, i64 %99
  %101 = getelementptr inbounds nuw %struct.PathNode, ptr %100, i32 0, i32 1
  store i32 -1, ptr %101, align 8
  %102 = load i32, ptr %19, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, ptr %19, align 4
  %104 = load ptr, ptr %13, align 8
  %105 = load i32, ptr %15, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %15, align 4
  %107 = sext i32 %105 to i64
  %108 = getelementptr inbounds i32, ptr %104, i64 %107
  store i32 0, ptr %108, align 4
  br label %109

109:                                              ; preds = %267, %72
  %110 = load i32, ptr %14, align 4
  %111 = load i32, ptr %15, align 4
  %112 = icmp slt i32 %110, %111
  br i1 %112, label %113, label %268

113:                                              ; preds = %109
  %114 = load ptr, ptr %13, align 8
  %115 = load i32, ptr %14, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %14, align 4
  %117 = sext i32 %115 to i64
  %118 = getelementptr inbounds i32, ptr %114, i64 %117
  %119 = load i32, ptr %118, align 4
  store i32 %119, ptr %20, align 4
  %120 = load ptr, ptr %18, align 8
  %121 = load i32, ptr %20, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds %struct.PathNode, ptr %120, i64 %122
  %124 = getelementptr inbounds nuw %struct.PathNode, ptr %123, i32 0, i32 0
  %125 = load ptr, ptr %124, align 8
  store ptr %125, ptr %21, align 8
  store i32 0, ptr %22, align 4
  br label %126

126:                                              ; preds = %264, %113
  %127 = load i32, ptr %22, align 4
  %128 = load ptr, ptr %21, align 8
  %129 = getelementptr inbounds nuw %struct.MazeCell, ptr %128, i32 0, i32 2
  %130 = load i32, ptr %129, align 8
  %131 = icmp slt i32 %127, %130
  br i1 %131, label %132, label %267

132:                                              ; preds = %126
  %133 = load ptr, ptr %21, align 8
  %134 = getelementptr inbounds nuw %struct.MazeCell, ptr %133, i32 0, i32 1
  %135 = load i32, ptr %22, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [4 x ptr], ptr %134, i64 0, i64 %136
  %138 = load ptr, ptr %137, align 8
  store ptr %138, ptr %23, align 8
  %139 = load ptr, ptr %23, align 8
  %140 = load ptr, ptr %8, align 8
  %141 = icmp eq ptr %139, %140
  br i1 %141, label %142, label %212

142:                                              ; preds = %132
  store i32 1, ptr %24, align 4
  %143 = load i32, ptr %20, align 4
  store i32 %143, ptr %25, align 4
  br label %144

144:                                              ; preds = %147, %142
  %145 = load i32, ptr %25, align 4
  %146 = icmp sge i32 %145, 0
  br i1 %146, label %147, label %156

147:                                              ; preds = %144
  %148 = load i32, ptr %24, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %24, align 4
  %150 = load ptr, ptr %18, align 8
  %151 = load i32, ptr %25, align 4
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds %struct.PathNode, ptr %150, i64 %152
  %154 = getelementptr inbounds nuw %struct.PathNode, ptr %153, i32 0, i32 1
  %155 = load i32, ptr %154, align 8
  store i32 %155, ptr %25, align 4
  br label %144, !llvm.loop !20

156:                                              ; preds = %144
  %157 = load i32, ptr %24, align 4
  %158 = sext i32 %157 to i64
  %159 = mul i64 %158, 8
  %160 = call noalias ptr @malloc(i64 noundef %159)
  store ptr %160, ptr %26, align 8
  %161 = load i32, ptr %24, align 4
  %162 = sub nsw i32 %161, 1
  store i32 %162, ptr %27, align 4
  %163 = load ptr, ptr %8, align 8
  %164 = load ptr, ptr %26, align 8
  %165 = load i32, ptr %27, align 4
  %166 = add nsw i32 %165, -1
  store i32 %166, ptr %27, align 4
  %167 = sext i32 %165 to i64
  %168 = getelementptr inbounds ptr, ptr %164, i64 %167
  store ptr %163, ptr %168, align 8
  %169 = load i32, ptr %20, align 4
  store i32 %169, ptr %25, align 4
  br label %170

170:                                              ; preds = %173, %156
  %171 = load i32, ptr %25, align 4
  %172 = icmp sge i32 %171, 0
  br i1 %172, label %173, label %191

173:                                              ; preds = %170
  %174 = load ptr, ptr %18, align 8
  %175 = load i32, ptr %25, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds %struct.PathNode, ptr %174, i64 %176
  %178 = getelementptr inbounds nuw %struct.PathNode, ptr %177, i32 0, i32 0
  %179 = load ptr, ptr %178, align 8
  %180 = load ptr, ptr %26, align 8
  %181 = load i32, ptr %27, align 4
  %182 = add nsw i32 %181, -1
  store i32 %182, ptr %27, align 4
  %183 = sext i32 %181 to i64
  %184 = getelementptr inbounds ptr, ptr %180, i64 %183
  store ptr %179, ptr %184, align 8
  %185 = load ptr, ptr %18, align 8
  %186 = load i32, ptr %25, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds %struct.PathNode, ptr %185, i64 %187
  %189 = getelementptr inbounds nuw %struct.PathNode, ptr %188, i32 0, i32 1
  %190 = load i32, ptr %189, align 8
  store i32 %190, ptr %25, align 4
  br label %170, !llvm.loop !21

191:                                              ; preds = %170
  %192 = load i32, ptr %24, align 4
  %193 = load ptr, ptr %9, align 8
  store i32 %192, ptr %193, align 4
  %194 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %194)
  store i32 0, ptr %28, align 4
  br label %195

195:                                              ; preds = %205, %191
  %196 = load i32, ptr %28, align 4
  %197 = load i32, ptr %12, align 4
  %198 = icmp slt i32 %196, %197
  br i1 %198, label %199, label %208

199:                                              ; preds = %195
  %200 = load ptr, ptr %16, align 8
  %201 = load i32, ptr %28, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds ptr, ptr %200, i64 %202
  %204 = load ptr, ptr %203, align 8
  call void @free(ptr noundef %204)
  br label %205

205:                                              ; preds = %199
  %206 = load i32, ptr %28, align 4
  %207 = add nsw i32 %206, 1
  store i32 %207, ptr %28, align 4
  br label %195, !llvm.loop !22

208:                                              ; preds = %195
  %209 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %209)
  %210 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %210)
  %211 = load ptr, ptr %26, align 8
  store ptr %211, ptr %5, align 8
  br label %287

212:                                              ; preds = %132
  %213 = load ptr, ptr %23, align 8
  %214 = call zeroext i1 @maze_cell_is_walkable(ptr noundef %213)
  br i1 %214, label %215, label %263

215:                                              ; preds = %212
  %216 = load ptr, ptr %16, align 8
  %217 = load ptr, ptr %23, align 8
  %218 = getelementptr inbounds nuw %struct.MazeCell, ptr %217, i32 0, i32 4
  %219 = load i32, ptr %218, align 8
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds ptr, ptr %216, i64 %220
  %222 = load ptr, ptr %221, align 8
  %223 = load ptr, ptr %23, align 8
  %224 = getelementptr inbounds nuw %struct.MazeCell, ptr %223, i32 0, i32 3
  %225 = load i32, ptr %224, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds i8, ptr %222, i64 %226
  %228 = load i8, ptr %227, align 1
  %229 = trunc i8 %228 to i1
  br i1 %229, label %263, label %230

230:                                              ; preds = %215
  %231 = load ptr, ptr %16, align 8
  %232 = load ptr, ptr %23, align 8
  %233 = getelementptr inbounds nuw %struct.MazeCell, ptr %232, i32 0, i32 4
  %234 = load i32, ptr %233, align 8
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds ptr, ptr %231, i64 %235
  %237 = load ptr, ptr %236, align 8
  %238 = load ptr, ptr %23, align 8
  %239 = getelementptr inbounds nuw %struct.MazeCell, ptr %238, i32 0, i32 3
  %240 = load i32, ptr %239, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i8, ptr %237, i64 %241
  store i8 1, ptr %242, align 1
  %243 = load ptr, ptr %23, align 8
  %244 = load ptr, ptr %18, align 8
  %245 = load i32, ptr %19, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds %struct.PathNode, ptr %244, i64 %246
  %248 = getelementptr inbounds nuw %struct.PathNode, ptr %247, i32 0, i32 0
  store ptr %243, ptr %248, align 8
  %249 = load i32, ptr %20, align 4
  %250 = load ptr, ptr %18, align 8
  %251 = load i32, ptr %19, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds %struct.PathNode, ptr %250, i64 %252
  %254 = getelementptr inbounds nuw %struct.PathNode, ptr %253, i32 0, i32 1
  store i32 %249, ptr %254, align 8
  %255 = load i32, ptr %19, align 4
  %256 = load ptr, ptr %13, align 8
  %257 = load i32, ptr %15, align 4
  %258 = add nsw i32 %257, 1
  store i32 %258, ptr %15, align 4
  %259 = sext i32 %257 to i64
  %260 = getelementptr inbounds i32, ptr %256, i64 %259
  store i32 %255, ptr %260, align 4
  %261 = load i32, ptr %19, align 4
  %262 = add nsw i32 %261, 1
  store i32 %262, ptr %19, align 4
  br label %263

263:                                              ; preds = %230, %215, %212
  br label %264

264:                                              ; preds = %263
  %265 = load i32, ptr %22, align 4
  %266 = add nsw i32 %265, 1
  store i32 %266, ptr %22, align 4
  br label %126, !llvm.loop !23

267:                                              ; preds = %126
  br label %109, !llvm.loop !24

268:                                              ; preds = %109
  %269 = load ptr, ptr %9, align 8
  store i32 0, ptr %269, align 4
  %270 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %270)
  store i32 0, ptr %29, align 4
  br label %271

271:                                              ; preds = %281, %268
  %272 = load i32, ptr %29, align 4
  %273 = load i32, ptr %12, align 4
  %274 = icmp slt i32 %272, %273
  br i1 %274, label %275, label %284

275:                                              ; preds = %271
  %276 = load ptr, ptr %16, align 8
  %277 = load i32, ptr %29, align 4
  %278 = sext i32 %277 to i64
  %279 = getelementptr inbounds ptr, ptr %276, i64 %278
  %280 = load ptr, ptr %279, align 8
  call void @free(ptr noundef %280)
  br label %281

281:                                              ; preds = %275
  %282 = load i32, ptr %29, align 4
  %283 = add nsw i32 %282, 1
  store i32 %283, ptr %29, align 4
  br label %271, !llvm.loop !25

284:                                              ; preds = %271
  %285 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %285)
  %286 = load ptr, ptr %18, align 8
  call void @free(ptr noundef %286)
  store ptr null, ptr %5, align 8
  br label %287

287:                                              ; preds = %284, %208, %33
  %288 = load ptr, ptr %5, align 8
  ret ptr %288
}

define dso_local i32 @MazeBFS_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %13, i32 0, i32 5
  %15 = load i32, ptr %14, align 8
  %16 = call i32 @mid_cell_checksum(ptr noundef %12, i32 noundef %15)
  %17 = add i32 %9, %16
  ret i32 %17
}

define internal i32 @mid_cell_checksum(ptr noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %8 = load i32, ptr %5, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store i32 0, ptr %3, align 4
  br label %26

11:                                               ; preds = %2
  %12 = load i32, ptr %5, align 4
  %13 = sdiv i32 %12, 2
  store i32 %13, ptr %6, align 4
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %6, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds ptr, ptr %14, i64 %16
  %18 = load ptr, ptr %17, align 8
  store ptr %18, ptr %7, align 8
  %19 = load ptr, ptr %7, align 8
  %20 = getelementptr inbounds nuw %struct.MazeCell, ptr %19, i32 0, i32 3
  %21 = load i32, ptr %20, align 4
  %22 = load ptr, ptr %7, align 8
  %23 = getelementptr inbounds nuw %struct.MazeCell, ptr %22, i32 0, i32 4
  %24 = load i32, ptr %23, align 8
  %25 = mul nsw i32 %21, %24
  store i32 %25, ptr %3, align 4
  br label %26

26:                                               ; preds = %11, %10
  %27 = load i32, ptr %3, align 4
  ret i32 %27
}

define dso_local void @MazeBFS_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %7, i32 0, i32 4
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %12, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MazeBFSData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  call void @maze_free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  ret void
}

define dso_local ptr @MazeBFS_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 3
  store ptr @MazeBFS_prepare, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 4
  store ptr @MazeBFS_run, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 7
  store ptr @MazeBFS_checksum, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 10
  store ptr @MazeBFS_cleanup, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

define dso_local void @MazeAStar_prepare(ptr noundef %0) {
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
  %13 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %12, i32 0, i32 1
  store i32 %11, ptr %13, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 0
  %16 = load ptr, ptr %15, align 8
  %17 = call i64 @Helper_config_i64(ptr noundef %16, ptr noundef @.str.1)
  %18 = trunc i64 %17 to i32
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %19, i32 0, i32 2
  store i32 %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %25, label %28

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %26, i32 0, i32 1
  store i32 5, ptr %27, align 4
  br label %28

28:                                               ; preds = %25, %1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  %32 = icmp slt i32 %31, 5
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %34, i32 0, i32 2
  store i32 5, ptr %35, align 8
  br label %36

36:                                               ; preds = %33, %28
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 4
  %40 = load ptr, ptr %3, align 8
  %41 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = call ptr @maze_create(i32 noundef %39, i32 noundef %42)
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %44, i32 0, i32 3
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %46, i32 0, i32 3
  %48 = load ptr, ptr %47, align 8
  call void @maze_update_neighbors(ptr noundef %48)
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %49, i32 0, i32 3
  %51 = load ptr, ptr %50, align 8
  call void @maze_generate(ptr noundef %51)
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %52, i32 0, i32 0
  store i32 0, ptr %53, align 8
  %54 = load ptr, ptr %3, align 8
  %55 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %54, i32 0, i32 4
  store ptr null, ptr %55, align 8
  %56 = load ptr, ptr %3, align 8
  %57 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %56, i32 0, i32 5
  store i32 0, ptr %57, align 8
  ret void
}

define dso_local void @MazeAStar_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %10, i32 0, i32 4
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %2
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %18, i32 0, i32 4
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %2
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  %24 = load ptr, ptr %5, align 8
  %25 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %24, i32 0, i32 3
  %26 = load ptr, ptr %25, align 8
  %27 = getelementptr inbounds nuw %struct.Maze, ptr %26, i32 0, i32 3
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %29, i32 0, i32 3
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds nuw %struct.Maze, ptr %31, i32 0, i32 4
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %34, i32 0, i32 5
  %36 = call ptr @maze_astar(ptr noundef %23, ptr noundef %28, ptr noundef %33, ptr noundef %35)
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %37, i32 0, i32 4
  store ptr %36, ptr %38, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %39, i32 0, i32 5
  %41 = load i32, ptr %40, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %42, i32 0, i32 0
  %44 = load i32, ptr %43, align 8
  %45 = add i32 %44, %41
  store i32 %45, ptr %43, align 8
  ret void
}

define internal ptr @maze_astar(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca ptr, align 8
  %20 = alloca %struct.AStarPriorityQueueEntry, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca ptr, align 8
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca ptr, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  %37 = load ptr, ptr %7, align 8
  %38 = load ptr, ptr %8, align 8
  %39 = icmp eq ptr %37, %38
  br i1 %39, label %40, label %47

40:                                               ; preds = %4
  %41 = load ptr, ptr %9, align 8
  store i32 1, ptr %41, align 4
  %42 = call noalias ptr @malloc(i64 noundef 8)
  store ptr %42, ptr %10, align 8
  %43 = load ptr, ptr %7, align 8
  %44 = load ptr, ptr %10, align 8
  %45 = getelementptr inbounds ptr, ptr %44, i64 0
  store ptr %43, ptr %45, align 8
  %46 = load ptr, ptr %10, align 8
  store ptr %46, ptr %5, align 8
  br label %266

47:                                               ; preds = %4
  %48 = load ptr, ptr %6, align 8
  %49 = getelementptr inbounds nuw %struct.Maze, ptr %48, i32 0, i32 0
  %50 = load i32, ptr %49, align 8
  store i32 %50, ptr %11, align 4
  %51 = load ptr, ptr %6, align 8
  %52 = getelementptr inbounds nuw %struct.Maze, ptr %51, i32 0, i32 1
  %53 = load i32, ptr %52, align 4
  store i32 %53, ptr %12, align 4
  %54 = load i32, ptr %11, align 4
  %55 = load i32, ptr %12, align 4
  %56 = mul nsw i32 %54, %55
  store i32 %56, ptr %13, align 4
  %57 = load i32, ptr %13, align 4
  %58 = sext i32 %57 to i64
  %59 = mul i64 %58, 4
  %60 = call noalias ptr @malloc(i64 noundef %59)
  store ptr %60, ptr %14, align 8
  %61 = load i32, ptr %13, align 4
  %62 = sext i32 %61 to i64
  %63 = mul i64 %62, 4
  %64 = call noalias ptr @malloc(i64 noundef %63)
  store ptr %64, ptr %15, align 8
  store i32 0, ptr %16, align 4
  br label %65

65:                                               ; preds = %78, %47
  %66 = load i32, ptr %16, align 4
  %67 = load i32, ptr %13, align 4
  %68 = icmp slt i32 %66, %67
  br i1 %68, label %69, label %81

69:                                               ; preds = %65
  %70 = load ptr, ptr %14, align 8
  %71 = load i32, ptr %16, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i32, ptr %70, i64 %72
  store i32 -1, ptr %73, align 4
  %74 = load ptr, ptr %15, align 8
  %75 = load i32, ptr %16, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i32, ptr %74, i64 %76
  store i32 2147483647, ptr %77, align 4
  br label %78

78:                                               ; preds = %69
  %79 = load i32, ptr %16, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %16, align 4
  br label %65, !llvm.loop !26

81:                                               ; preds = %65
  %82 = load ptr, ptr %7, align 8
  %83 = getelementptr inbounds nuw %struct.MazeCell, ptr %82, i32 0, i32 4
  %84 = load i32, ptr %83, align 8
  %85 = load ptr, ptr %7, align 8
  %86 = getelementptr inbounds nuw %struct.MazeCell, ptr %85, i32 0, i32 3
  %87 = load i32, ptr %86, align 4
  %88 = load i32, ptr %11, align 4
  %89 = call i32 @astar_idx(i32 noundef %84, i32 noundef %87, i32 noundef %88)
  store i32 %89, ptr %17, align 4
  %90 = load ptr, ptr %8, align 8
  %91 = getelementptr inbounds nuw %struct.MazeCell, ptr %90, i32 0, i32 4
  %92 = load i32, ptr %91, align 8
  %93 = load ptr, ptr %8, align 8
  %94 = getelementptr inbounds nuw %struct.MazeCell, ptr %93, i32 0, i32 3
  %95 = load i32, ptr %94, align 4
  %96 = load i32, ptr %11, align 4
  %97 = call i32 @astar_idx(i32 noundef %92, i32 noundef %95, i32 noundef %96)
  store i32 %97, ptr %18, align 4
  %98 = load i32, ptr %13, align 4
  %99 = call ptr @astar_pq_create(i32 noundef %98)
  store ptr %99, ptr %19, align 8
  %100 = load ptr, ptr %15, align 8
  %101 = load i32, ptr %17, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i32, ptr %100, i64 %102
  store i32 0, ptr %103, align 4
  %104 = load ptr, ptr %19, align 8
  %105 = load i32, ptr %17, align 4
  %106 = load ptr, ptr %7, align 8
  %107 = load ptr, ptr %8, align 8
  %108 = call i32 @astar_heuristic(ptr noundef %106, ptr noundef %107)
  call void @astar_pq_push(ptr noundef %104, i32 noundef %105, i32 noundef %108)
  br label %109

109:                                              ; preds = %260, %81
  %110 = load ptr, ptr %19, align 8
  %111 = call zeroext i1 @astar_pq_empty(ptr noundef %110)
  %112 = xor i1 %111, true
  br i1 %112, label %113, label %261

113:                                              ; preds = %109
  %114 = load ptr, ptr %19, align 8
  %115 = call i64 @astar_pq_pop(ptr noundef %114)
  store i64 %115, ptr %20, align 4
  %116 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %20, i32 0, i32 1
  %117 = load i32, ptr %116, align 4
  store i32 %117, ptr %21, align 4
  %118 = load i32, ptr %21, align 4
  %119 = load i32, ptr %18, align 4
  %120 = icmp eq i32 %118, %119
  br i1 %120, label %121, label %181

121:                                              ; preds = %113
  store i32 0, ptr %22, align 4
  %122 = load i32, ptr %21, align 4
  store i32 %122, ptr %23, align 4
  br label %123

123:                                              ; preds = %126, %121
  %124 = load i32, ptr %23, align 4
  %125 = icmp ne i32 %124, -1
  br i1 %125, label %126, label %134

126:                                              ; preds = %123
  %127 = load i32, ptr %22, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, ptr %22, align 4
  %129 = load ptr, ptr %14, align 8
  %130 = load i32, ptr %23, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, ptr %129, i64 %131
  %133 = load i32, ptr %132, align 4
  store i32 %133, ptr %23, align 4
  br label %123, !llvm.loop !27

134:                                              ; preds = %123
  %135 = load i32, ptr %22, align 4
  %136 = sext i32 %135 to i64
  %137 = mul i64 %136, 8
  %138 = call noalias ptr @malloc(i64 noundef %137)
  store ptr %138, ptr %24, align 8
  %139 = load i32, ptr %21, align 4
  store i32 %139, ptr %23, align 4
  %140 = load i32, ptr %22, align 4
  %141 = sub nsw i32 %140, 1
  store i32 %141, ptr %25, align 4
  br label %142

142:                                              ; preds = %171, %134
  %143 = load i32, ptr %25, align 4
  %144 = icmp sge i32 %143, 0
  br i1 %144, label %145, label %174

145:                                              ; preds = %142
  %146 = load i32, ptr %23, align 4
  %147 = load i32, ptr %11, align 4
  %148 = sdiv i32 %146, %147
  store i32 %148, ptr %26, align 4
  %149 = load i32, ptr %23, align 4
  %150 = load i32, ptr %11, align 4
  %151 = srem i32 %149, %150
  store i32 %151, ptr %27, align 4
  %152 = load ptr, ptr %6, align 8
  %153 = getelementptr inbounds nuw %struct.Maze, ptr %152, i32 0, i32 2
  %154 = load ptr, ptr %153, align 8
  %155 = load i32, ptr %26, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds ptr, ptr %154, i64 %156
  %158 = load ptr, ptr %157, align 8
  %159 = load i32, ptr %27, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds %struct.MazeCell, ptr %158, i64 %160
  %162 = load ptr, ptr %24, align 8
  %163 = load i32, ptr %25, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds ptr, ptr %162, i64 %164
  store ptr %161, ptr %165, align 8
  %166 = load ptr, ptr %14, align 8
  %167 = load i32, ptr %23, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds i32, ptr %166, i64 %168
  %170 = load i32, ptr %169, align 4
  store i32 %170, ptr %23, align 4
  br label %171

171:                                              ; preds = %145
  %172 = load i32, ptr %25, align 4
  %173 = add nsw i32 %172, -1
  store i32 %173, ptr %25, align 4
  br label %142, !llvm.loop !28

174:                                              ; preds = %142
  %175 = load i32, ptr %22, align 4
  %176 = load ptr, ptr %9, align 8
  store i32 %175, ptr %176, align 4
  %177 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %177)
  %178 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %178)
  %179 = load ptr, ptr %19, align 8
  call void @astar_pq_free(ptr noundef %179)
  %180 = load ptr, ptr %24, align 8
  store ptr %180, ptr %5, align 8
  br label %266

181:                                              ; preds = %113
  %182 = load i32, ptr %21, align 4
  %183 = load i32, ptr %11, align 4
  %184 = sdiv i32 %182, %183
  store i32 %184, ptr %28, align 4
  %185 = load i32, ptr %21, align 4
  %186 = load i32, ptr %11, align 4
  %187 = srem i32 %185, %186
  store i32 %187, ptr %29, align 4
  %188 = load ptr, ptr %6, align 8
  %189 = getelementptr inbounds nuw %struct.Maze, ptr %188, i32 0, i32 2
  %190 = load ptr, ptr %189, align 8
  %191 = load i32, ptr %28, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds ptr, ptr %190, i64 %192
  %194 = load ptr, ptr %193, align 8
  %195 = load i32, ptr %29, align 4
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds %struct.MazeCell, ptr %194, i64 %196
  store ptr %197, ptr %30, align 8
  %198 = load ptr, ptr %15, align 8
  %199 = load i32, ptr %21, align 4
  %200 = sext i32 %199 to i64
  %201 = getelementptr inbounds i32, ptr %198, i64 %200
  %202 = load i32, ptr %201, align 4
  store i32 %202, ptr %31, align 4
  store i32 0, ptr %32, align 4
  br label %203

203:                                              ; preds = %257, %181
  %204 = load i32, ptr %32, align 4
  %205 = load ptr, ptr %30, align 8
  %206 = getelementptr inbounds nuw %struct.MazeCell, ptr %205, i32 0, i32 2
  %207 = load i32, ptr %206, align 8
  %208 = icmp slt i32 %204, %207
  br i1 %208, label %209, label %260

209:                                              ; preds = %203
  %210 = load ptr, ptr %30, align 8
  %211 = getelementptr inbounds nuw %struct.MazeCell, ptr %210, i32 0, i32 1
  %212 = load i32, ptr %32, align 4
  %213 = sext i32 %212 to i64
  %214 = getelementptr inbounds [4 x ptr], ptr %211, i64 0, i64 %213
  %215 = load ptr, ptr %214, align 8
  store ptr %215, ptr %33, align 8
  %216 = load ptr, ptr %33, align 8
  %217 = call zeroext i1 @maze_cell_is_walkable(ptr noundef %216)
  br i1 %217, label %219, label %218

218:                                              ; preds = %209
  br label %257

219:                                              ; preds = %209
  %220 = load ptr, ptr %33, align 8
  %221 = getelementptr inbounds nuw %struct.MazeCell, ptr %220, i32 0, i32 4
  %222 = load i32, ptr %221, align 8
  %223 = load ptr, ptr %33, align 8
  %224 = getelementptr inbounds nuw %struct.MazeCell, ptr %223, i32 0, i32 3
  %225 = load i32, ptr %224, align 4
  %226 = load i32, ptr %11, align 4
  %227 = call i32 @astar_idx(i32 noundef %222, i32 noundef %225, i32 noundef %226)
  store i32 %227, ptr %34, align 4
  %228 = load i32, ptr %31, align 4
  %229 = add nsw i32 %228, 1
  store i32 %229, ptr %35, align 4
  %230 = load i32, ptr %35, align 4
  %231 = load ptr, ptr %15, align 8
  %232 = load i32, ptr %34, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds i32, ptr %231, i64 %233
  %235 = load i32, ptr %234, align 4
  %236 = icmp slt i32 %230, %235
  br i1 %236, label %237, label %256

237:                                              ; preds = %219
  %238 = load i32, ptr %21, align 4
  %239 = load ptr, ptr %14, align 8
  %240 = load i32, ptr %34, align 4
  %241 = sext i32 %240 to i64
  %242 = getelementptr inbounds i32, ptr %239, i64 %241
  store i32 %238, ptr %242, align 4
  %243 = load i32, ptr %35, align 4
  %244 = load ptr, ptr %15, align 8
  %245 = load i32, ptr %34, align 4
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i32, ptr %244, i64 %246
  store i32 %243, ptr %247, align 4
  %248 = load i32, ptr %35, align 4
  %249 = load ptr, ptr %33, align 8
  %250 = load ptr, ptr %8, align 8
  %251 = call i32 @astar_heuristic(ptr noundef %249, ptr noundef %250)
  %252 = add nsw i32 %248, %251
  store i32 %252, ptr %36, align 4
  %253 = load ptr, ptr %19, align 8
  %254 = load i32, ptr %34, align 4
  %255 = load i32, ptr %36, align 4
  call void @astar_pq_push(ptr noundef %253, i32 noundef %254, i32 noundef %255)
  br label %256

256:                                              ; preds = %237, %219
  br label %257

257:                                              ; preds = %256, %218
  %258 = load i32, ptr %32, align 4
  %259 = add nsw i32 %258, 1
  store i32 %259, ptr %32, align 4
  br label %203, !llvm.loop !29

260:                                              ; preds = %203
  br label %109, !llvm.loop !30

261:                                              ; preds = %109
  %262 = load ptr, ptr %9, align 8
  store i32 0, ptr %262, align 4
  %263 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %263)
  %264 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %264)
  %265 = load ptr, ptr %19, align 8
  call void @astar_pq_free(ptr noundef %265)
  store ptr null, ptr %5, align 8
  br label %266

266:                                              ; preds = %261, %174, %40
  %267 = load ptr, ptr %5, align 8
  ret ptr %267
}

define dso_local i32 @MazeAStar_checksum(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %10, i32 0, i32 5
  %12 = load i32, ptr %11, align 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %18

14:                                               ; preds = %1
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  store i32 %17, ptr %2, align 4
  br label %41

18:                                               ; preds = %1
  %19 = load ptr, ptr %4, align 8
  %20 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %19, i32 0, i32 5
  %21 = load i32, ptr %20, align 8
  %22 = sdiv i32 %21, 2
  store i32 %22, ptr %5, align 4
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %23, i32 0, i32 4
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %25, i64 %27
  %29 = load ptr, ptr %28, align 8
  store ptr %29, ptr %6, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  %33 = load ptr, ptr %6, align 8
  %34 = getelementptr inbounds nuw %struct.MazeCell, ptr %33, i32 0, i32 3
  %35 = load i32, ptr %34, align 4
  %36 = load ptr, ptr %6, align 8
  %37 = getelementptr inbounds nuw %struct.MazeCell, ptr %36, i32 0, i32 4
  %38 = load i32, ptr %37, align 8
  %39 = mul nsw i32 %35, %38
  %40 = add i32 %32, %39
  store i32 %40, ptr %2, align 4
  br label %41

41:                                               ; preds = %18, %14
  %42 = load i32, ptr %2, align 4
  ret i32 %42
}

define dso_local void @MazeAStar_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %7, i32 0, i32 4
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %15

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %12, i32 0, i32 4
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  br label %15

15:                                               ; preds = %11, %1
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %16, i32 0, i32 3
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %24

20:                                               ; preds = %15
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.MazeAStarData, ptr %21, i32 0, i32 3
  %23 = load ptr, ptr %22, align 8
  call void @maze_free(ptr noundef %23)
  br label %24

24:                                               ; preds = %20, %15
  ret void
}

define dso_local ptr @MazeAStar_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.4)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 3
  store ptr @MazeAStar_prepare, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 4
  store ptr @MazeAStar_run, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 7
  store ptr @MazeAStar_checksum, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 10
  store ptr @MazeAStar_cleanup, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

declare noalias ptr @malloc(i64 noundef)

define internal ptr @maze_cell_create(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %6 = call noalias ptr @malloc(i64 noundef 56)
  store ptr %6, ptr %5, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = getelementptr inbounds nuw %struct.MazeCell, ptr %7, i32 0, i32 0
  store i32 0, ptr %8, align 8
  %9 = load i32, ptr %3, align 4
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.MazeCell, ptr %10, i32 0, i32 3
  store i32 %9, ptr %11, align 4
  %12 = load i32, ptr %4, align 4
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.MazeCell, ptr %13, i32 0, i32 4
  store i32 %12, ptr %14, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.MazeCell, ptr %15, i32 0, i32 2
  store i32 0, ptr %16, align 8
  %17 = load ptr, ptr %5, align 8
  ret ptr %17
}

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal void @maze_cell_add_neighbor(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.MazeCell, ptr %5, i32 0, i32 2
  %7 = load i32, ptr %6, align 8
  %8 = icmp slt i32 %7, 4
  br i1 %8, label %9, label %19

9:                                                ; preds = %2
  %10 = load ptr, ptr %4, align 8
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.MazeCell, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.MazeCell, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 8
  %16 = add nsw i32 %15, 1
  store i32 %16, ptr %14, align 8
  %17 = sext i32 %15 to i64
  %18 = getelementptr inbounds [4 x ptr], ptr %12, i64 0, i64 %17
  store ptr %10, ptr %18, align 8
  br label %19

19:                                               ; preds = %9, %2
  ret void
}

declare i32 @Helper_next_int(i32 noundef)

define internal void @maze_cell_reset(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.MazeCell, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.MazeCell, ptr %8, i32 0, i32 0
  store i32 0, ptr %9, align 8
  br label %10

10:                                               ; preds = %7, %1
  ret void
}

define internal void @maze_dig(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.Maze, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.Maze, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = mul nsw i32 %16, %19
  %21 = sext i32 %20 to i64
  store i64 %21, ptr %5, align 8
  %22 = load i64, ptr %5, align 8
  %23 = mul i64 %22, 8
  %24 = call noalias ptr @malloc(i64 noundef %23)
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %28, label %27

27:                                               ; preds = %2
  br label %118

28:                                               ; preds = %2
  store i64 0, ptr %7, align 8
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %6, align 8
  %31 = load i64, ptr %7, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr %7, align 8
  %33 = getelementptr inbounds nuw ptr, ptr %30, i64 %31
  store ptr %29, ptr %33, align 8
  br label %34

34:                                               ; preds = %115, %67, %28
  %35 = load i64, ptr %7, align 8
  %36 = icmp ugt i64 %35, 0
  br i1 %36, label %37, label %116

37:                                               ; preds = %34
  %38 = load ptr, ptr %6, align 8
  %39 = load i64, ptr %7, align 8
  %40 = add i64 %39, -1
  store i64 %40, ptr %7, align 8
  %41 = getelementptr inbounds nuw ptr, ptr %38, i64 %40
  %42 = load ptr, ptr %41, align 8
  store ptr %42, ptr %8, align 8
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %43

43:                                               ; preds = %61, %37
  %44 = load i32, ptr %10, align 4
  %45 = load ptr, ptr %8, align 8
  %46 = getelementptr inbounds nuw %struct.MazeCell, ptr %45, i32 0, i32 2
  %47 = load i32, ptr %46, align 8
  %48 = icmp slt i32 %44, %47
  br i1 %48, label %49, label %64

49:                                               ; preds = %43
  %50 = load ptr, ptr %8, align 8
  %51 = getelementptr inbounds nuw %struct.MazeCell, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %10, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [4 x ptr], ptr %51, i64 0, i64 %53
  %55 = load ptr, ptr %54, align 8
  %56 = call zeroext i1 @maze_cell_is_walkable(ptr noundef %55)
  br i1 %56, label %57, label %60

57:                                               ; preds = %49
  %58 = load i32, ptr %9, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %9, align 4
  br label %60

60:                                               ; preds = %57, %49
  br label %61

61:                                               ; preds = %60
  %62 = load i32, ptr %10, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, ptr %10, align 4
  br label %43, !llvm.loop !31

64:                                               ; preds = %43
  %65 = load i32, ptr %9, align 4
  %66 = icmp ne i32 %65, 1
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  br label %34, !llvm.loop !32

68:                                               ; preds = %64
  %69 = load ptr, ptr %8, align 8
  %70 = getelementptr inbounds nuw %struct.MazeCell, ptr %69, i32 0, i32 0
  store i32 1, ptr %70, align 8
  store i32 0, ptr %11, align 4
  br label %71

71:                                               ; preds = %112, %68
  %72 = load i32, ptr %11, align 4
  %73 = load ptr, ptr %8, align 8
  %74 = getelementptr inbounds nuw %struct.MazeCell, ptr %73, i32 0, i32 2
  %75 = load i32, ptr %74, align 8
  %76 = icmp slt i32 %72, %75
  br i1 %76, label %77, label %115

77:                                               ; preds = %71
  %78 = load ptr, ptr %8, align 8
  %79 = getelementptr inbounds nuw %struct.MazeCell, ptr %78, i32 0, i32 1
  %80 = load i32, ptr %11, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [4 x ptr], ptr %79, i64 0, i64 %81
  %83 = load ptr, ptr %82, align 8
  store ptr %83, ptr %12, align 8
  %84 = load ptr, ptr %12, align 8
  %85 = getelementptr inbounds nuw %struct.MazeCell, ptr %84, i32 0, i32 0
  %86 = load i32, ptr %85, align 8
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %88, label %111

88:                                               ; preds = %77
  %89 = load i64, ptr %7, align 8
  %90 = load i64, ptr %5, align 8
  %91 = icmp uge i64 %89, %90
  br i1 %91, label %92, label %105

92:                                               ; preds = %88
  %93 = load i64, ptr %5, align 8
  %94 = mul i64 %93, 2
  store i64 %94, ptr %5, align 8
  %95 = load ptr, ptr %6, align 8
  %96 = load i64, ptr %5, align 8
  %97 = mul i64 %96, 8
  %98 = call ptr @realloc(ptr noundef %95, i64 noundef %97)
  store ptr %98, ptr %13, align 8
  %99 = load ptr, ptr %13, align 8
  %100 = icmp ne ptr %99, null
  br i1 %100, label %103, label %101

101:                                              ; preds = %92
  %102 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %102)
  br label %118

103:                                              ; preds = %92
  %104 = load ptr, ptr %13, align 8
  store ptr %104, ptr %6, align 8
  br label %105

105:                                              ; preds = %103, %88
  %106 = load ptr, ptr %12, align 8
  %107 = load ptr, ptr %6, align 8
  %108 = load i64, ptr %7, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr %7, align 8
  %110 = getelementptr inbounds nuw ptr, ptr %107, i64 %108
  store ptr %106, ptr %110, align 8
  br label %111

111:                                              ; preds = %105, %77
  br label %112

112:                                              ; preds = %111
  %113 = load i32, ptr %11, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, ptr %11, align 4
  br label %71, !llvm.loop !33

115:                                              ; preds = %71
  br label %34, !llvm.loop !32

116:                                              ; preds = %34
  %117 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %117)
  br label %118

118:                                              ; preds = %116, %101, %27
  ret void
}

define internal void @maze_ensure_open_finish(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Maze, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.Maze, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = mul nsw i32 %14, %17
  %19 = sext i32 %18 to i64
  %20 = mul i64 %19, 8
  %21 = call noalias ptr @malloc(i64 noundef %20)
  store ptr %21, ptr %5, align 8
  store i32 0, ptr %6, align 4
  %22 = load ptr, ptr %4, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds ptr, ptr %23, i64 %26
  store ptr %22, ptr %27, align 8
  br label %28

28:                                               ; preds = %94, %64, %2
  %29 = load i32, ptr %6, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %31, label %95

31:                                               ; preds = %28
  %32 = load ptr, ptr %5, align 8
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, ptr %6, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds ptr, ptr %32, i64 %35
  %37 = load ptr, ptr %36, align 8
  store ptr %37, ptr %7, align 8
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds nuw %struct.MazeCell, ptr %38, i32 0, i32 0
  store i32 1, ptr %39, align 8
  store i32 0, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %40

40:                                               ; preds = %58, %31
  %41 = load i32, ptr %9, align 4
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.MazeCell, ptr %42, i32 0, i32 2
  %44 = load i32, ptr %43, align 8
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %61

46:                                               ; preds = %40
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.MazeCell, ptr %47, i32 0, i32 1
  %49 = load i32, ptr %9, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [4 x ptr], ptr %48, i64 0, i64 %50
  %52 = load ptr, ptr %51, align 8
  %53 = call zeroext i1 @maze_cell_is_walkable(ptr noundef %52)
  br i1 %53, label %54, label %57

54:                                               ; preds = %46
  %55 = load i32, ptr %8, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, ptr %8, align 4
  br label %57

57:                                               ; preds = %54, %46
  br label %58

58:                                               ; preds = %57
  %59 = load i32, ptr %9, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, ptr %9, align 4
  br label %40, !llvm.loop !34

61:                                               ; preds = %40
  %62 = load i32, ptr %8, align 4
  %63 = icmp sgt i32 %62, 1
  br i1 %63, label %64, label %65

64:                                               ; preds = %61
  br label %28, !llvm.loop !35

65:                                               ; preds = %61
  store i32 0, ptr %10, align 4
  br label %66

66:                                               ; preds = %91, %65
  %67 = load i32, ptr %10, align 4
  %68 = load ptr, ptr %7, align 8
  %69 = getelementptr inbounds nuw %struct.MazeCell, ptr %68, i32 0, i32 2
  %70 = load i32, ptr %69, align 8
  %71 = icmp slt i32 %67, %70
  br i1 %71, label %72, label %94

72:                                               ; preds = %66
  %73 = load ptr, ptr %7, align 8
  %74 = getelementptr inbounds nuw %struct.MazeCell, ptr %73, i32 0, i32 1
  %75 = load i32, ptr %10, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [4 x ptr], ptr %74, i64 0, i64 %76
  %78 = load ptr, ptr %77, align 8
  store ptr %78, ptr %11, align 8
  %79 = load ptr, ptr %11, align 8
  %80 = getelementptr inbounds nuw %struct.MazeCell, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp eq i32 %81, 0
  br i1 %82, label %83, label %90

83:                                               ; preds = %72
  %84 = load ptr, ptr %11, align 8
  %85 = load ptr, ptr %5, align 8
  %86 = load i32, ptr %6, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, ptr %6, align 4
  %88 = sext i32 %86 to i64
  %89 = getelementptr inbounds ptr, ptr %85, i64 %88
  store ptr %84, ptr %89, align 8
  br label %90

90:                                               ; preds = %83, %72
  br label %91

91:                                               ; preds = %90
  %92 = load i32, ptr %10, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %10, align 4
  br label %66, !llvm.loop !36

94:                                               ; preds = %66
  br label %28, !llvm.loop !35

95:                                               ; preds = %28
  %96 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %96)
  ret void
}

define internal zeroext i1 @maze_cell_is_walkable(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.MazeCell, ptr %3, i32 0, i32 0
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %17, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.MazeCell, ptr %8, i32 0, i32 0
  %10 = load i32, ptr %9, align 8
  %11 = icmp eq i32 %10, 2
  br i1 %11, label %17, label %12

12:                                               ; preds = %7
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.MazeCell, ptr %13, i32 0, i32 0
  %15 = load i32, ptr %14, align 8
  %16 = icmp eq i32 %15, 3
  br label %17

17:                                               ; preds = %12, %7, %1
  %18 = phi i1 [ true, %7 ], [ true, %1 ], [ %16, %12 ]
  ret i1 %18
}

declare ptr @realloc(ptr noundef, i64 noundef)

define internal i32 @astar_idx(i32 noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %7 = load i32, ptr %4, align 4
  %8 = load i32, ptr %6, align 4
  %9 = mul nsw i32 %7, %8
  %10 = load i32, ptr %5, align 4
  %11 = add nsw i32 %9, %10
  ret i32 %11
}

define internal ptr @astar_pq_create(i32 noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %5, ptr %3, align 8
  %6 = load i32, ptr %2, align 4
  %7 = sext i32 %6 to i64
  %8 = mul i64 %7, 8
  %9 = call noalias ptr @malloc(i64 noundef %8)
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load i32, ptr %2, align 4
  %13 = sext i32 %12 to i64
  %14 = mul i64 %13, 4
  %15 = call noalias ptr @malloc(i64 noundef %14)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %16, i32 0, i32 1
  store ptr %15, ptr %17, align 8
  store i32 0, ptr %4, align 4
  br label %18

18:                                               ; preds = %29, %1
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr %2, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %32

22:                                               ; preds = %18
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %23, i32 0, i32 1
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, ptr %25, i64 %27
  store i32 2147483647, ptr %28, align 4
  br label %29

29:                                               ; preds = %22
  %30 = load i32, ptr %4, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %4, align 4
  br label %18, !llvm.loop !37

32:                                               ; preds = %18
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %33, i32 0, i32 2
  store i32 0, ptr %34, align 8
  %35 = load i32, ptr %2, align 4
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %36, i32 0, i32 3
  store i32 %35, ptr %37, align 4
  %38 = load ptr, ptr %3, align 8
  ret ptr %38
}

define internal void @astar_pq_push(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %9 = load i32, ptr %6, align 4
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %10, i32 0, i32 1
  %12 = load ptr, ptr %11, align 8
  %13 = load i32, ptr %5, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i32, ptr %12, i64 %14
  %16 = load i32, ptr %15, align 4
  %17 = icmp sge i32 %9, %16
  br i1 %17, label %18, label %19

18:                                               ; preds = %3
  br label %104

19:                                               ; preds = %3
  %20 = load i32, ptr %6, align 4
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %5, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, ptr %23, i64 %25
  store i32 %20, ptr %26, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %30, i32 0, i32 3
  %32 = load i32, ptr %31, align 4
  %33 = icmp sge i32 %29, %32
  br i1 %33, label %34, label %50

34:                                               ; preds = %19
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %35, i32 0, i32 3
  %37 = load i32, ptr %36, align 4
  %38 = mul nsw i32 %37, 2
  store i32 %38, ptr %36, align 4
  %39 = load ptr, ptr %4, align 8
  %40 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %39, i32 0, i32 0
  %41 = load ptr, ptr %40, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %42, i32 0, i32 3
  %44 = load i32, ptr %43, align 4
  %45 = sext i32 %44 to i64
  %46 = mul i64 %45, 8
  %47 = call ptr @realloc(ptr noundef %41, i64 noundef %46)
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %48, i32 0, i32 0
  store ptr %47, ptr %49, align 8
  br label %50

50:                                               ; preds = %34, %19
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %51, i32 0, i32 2
  %53 = load i32, ptr %52, align 8
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %52, align 8
  store i32 %53, ptr %7, align 4
  br label %55

55:                                               ; preds = %73, %50
  %56 = load i32, ptr %7, align 4
  %57 = icmp sgt i32 %56, 0
  br i1 %57, label %58, label %87

58:                                               ; preds = %55
  %59 = load i32, ptr %7, align 4
  %60 = sub nsw i32 %59, 1
  %61 = sdiv i32 %60, 2
  store i32 %61, ptr %8, align 4
  %62 = load ptr, ptr %4, align 8
  %63 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i32, ptr %8, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %64, i64 %66
  %68 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %67, i32 0, i32 0
  %69 = load i32, ptr %68, align 4
  %70 = load i32, ptr %6, align 4
  %71 = icmp sle i32 %69, %70
  br i1 %71, label %72, label %73

72:                                               ; preds = %58
  br label %87

73:                                               ; preds = %58
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %74, i32 0, i32 0
  %76 = load ptr, ptr %75, align 8
  %77 = load i32, ptr %7, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %76, i64 %78
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %80, i32 0, i32 0
  %82 = load ptr, ptr %81, align 8
  %83 = load i32, ptr %8, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %82, i64 %84
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %79, ptr align 4 %85, i64 8, i1 false)
  %86 = load i32, ptr %8, align 4
  store i32 %86, ptr %7, align 4
  br label %55, !llvm.loop !38

87:                                               ; preds = %72, %55
  %88 = load i32, ptr %6, align 4
  %89 = load ptr, ptr %4, align 8
  %90 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %89, i32 0, i32 0
  %91 = load ptr, ptr %90, align 8
  %92 = load i32, ptr %7, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %91, i64 %93
  %95 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %94, i32 0, i32 0
  store i32 %88, ptr %95, align 4
  %96 = load i32, ptr %5, align 4
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %97, i32 0, i32 0
  %99 = load ptr, ptr %98, align 8
  %100 = load i32, ptr %7, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %99, i64 %101
  %103 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %102, i32 0, i32 1
  store i32 %96, ptr %103, align 4
  br label %104

104:                                              ; preds = %87, %18
  ret void
}

define internal i32 @astar_heuristic(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.MazeCell, ptr %5, i32 0, i32 3
  %7 = load i32, ptr %6, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds nuw %struct.MazeCell, ptr %8, i32 0, i32 3
  %10 = load i32, ptr %9, align 4
  %11 = sub nsw i32 %7, %10
  %12 = call i32 @llvm.abs.i32(i32 %11, i1 true)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.MazeCell, ptr %13, i32 0, i32 4
  %15 = load i32, ptr %14, align 8
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.MazeCell, ptr %16, i32 0, i32 4
  %18 = load i32, ptr %17, align 8
  %19 = sub nsw i32 %15, %18
  %20 = call i32 @llvm.abs.i32(i32 %19, i1 true)
  %21 = add nsw i32 %12, %20
  ret i32 %21
}

define internal zeroext i1 @astar_pq_empty(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %3, i32 0, i32 2
  %5 = load i32, ptr %4, align 8
  %6 = icmp eq i32 %5, 0
  ret i1 %6
}

define internal i64 @astar_pq_pop(ptr noundef %0) {
  %2 = alloca %struct.AStarPriorityQueueEntry, align 4
  %3 = alloca ptr, align 8
  %4 = alloca %struct.AStarPriorityQueueEntry, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %11, i64 0
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %2, ptr align 4 %12, i64 8, i1 false)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %13, i32 0, i32 2
  %15 = load i32, ptr %14, align 8
  %16 = add nsw i32 %15, -1
  store i32 %16, ptr %14, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %17, i32 0, i32 2
  %19 = load i32, ptr %18, align 8
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %115

21:                                               ; preds = %1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %22, i32 0, i32 0
  %24 = load ptr, ptr %23, align 8
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 8
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %24, i64 %28
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
  %40 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %39, i32 0, i32 2
  %41 = load i32, ptr %40, align 8
  %42 = icmp slt i32 %38, %41
  br i1 %42, label %43, label %63

43:                                               ; preds = %30
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %44, i32 0, i32 0
  %46 = load ptr, ptr %45, align 8
  %47 = load i32, ptr %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %46, i64 %48
  %50 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %50, align 4
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %52, i32 0, i32 0
  %54 = load ptr, ptr %53, align 8
  %55 = load i32, ptr %8, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %54, i64 %56
  %58 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %57, i32 0, i32 0
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
  %66 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %65, i32 0, i32 2
  %67 = load i32, ptr %66, align 8
  %68 = icmp slt i32 %64, %67
  br i1 %68, label %69, label %89

69:                                               ; preds = %63
  %70 = load ptr, ptr %3, align 8
  %71 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %70, i32 0, i32 0
  %72 = load ptr, ptr %71, align 8
  %73 = load i32, ptr %7, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %72, i64 %74
  %76 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %75, i32 0, i32 0
  %77 = load i32, ptr %76, align 4
  %78 = load ptr, ptr %3, align 8
  %79 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %78, i32 0, i32 0
  %80 = load ptr, ptr %79, align 8
  %81 = load i32, ptr %8, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %80, i64 %82
  %84 = getelementptr inbounds nuw %struct.AStarPriorityQueueEntry, ptr %83, i32 0, i32 0
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
  %96 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %95, i32 0, i32 0
  %97 = load ptr, ptr %96, align 8
  %98 = load i32, ptr %5, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %97, i64 %99
  %101 = load ptr, ptr %3, align 8
  %102 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %101, i32 0, i32 0
  %103 = load ptr, ptr %102, align 8
  %104 = load i32, ptr %8, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %103, i64 %105
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %100, ptr align 4 %106, i64 8, i1 false)
  %107 = load i32, ptr %8, align 4
  store i32 %107, ptr %5, align 4
  br label %30

108:                                              ; preds = %93
  %109 = load ptr, ptr %3, align 8
  %110 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %109, i32 0, i32 0
  %111 = load ptr, ptr %110, align 8
  %112 = load i32, ptr %5, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds %struct.AStarPriorityQueueEntry, ptr %111, i64 %113
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %114, ptr align 4 %4, i64 8, i1 false)
  br label %115

115:                                              ; preds = %108, %1
  %116 = load i64, ptr %2, align 4
  ret i64 %116
}

define internal void @astar_pq_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5)
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.AStarPriorityQueue, ptr %6, i32 0, i32 1
  %8 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %8)
  %9 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %9)
  ret void
}

declare i32 @llvm.abs.i32(i32, i1 immarg)


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
