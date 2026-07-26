; ModuleID = 'c/src/game_of_life.c'
source_filename = "c/src/game_of_life.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.GameOfLifeData = type { i32, i64, i64, %struct.GameOfLifeGrid }
%struct.GameOfLifeGrid = type { i32, i32, ptr }
%struct.Cell = type { i8, i8, ptr, i32 }

@.str = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Etc::GameOfLife\00", align 1

define dso_local void @GameOfLife_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i64 @Helper_config_i64(ptr noundef %11, ptr noundef @.str)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %13, i32 0, i32 1
  store i64 %12, ptr %14, align 8
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = call i64 @Helper_config_i64(ptr noundef %17, ptr noundef @.str.1)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %19, i32 0, i32 2
  store i64 %18, ptr %20, align 8
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %21, i32 0, i32 1
  %23 = load i64, ptr %22, align 8
  %24 = icmp sle i64 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %1
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %26, i32 0, i32 1
  store i64 256, ptr %27, align 8
  br label %28

28:                                               ; preds = %25, %1
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %29, i32 0, i32 2
  %31 = load i64, ptr %30, align 8
  %32 = icmp sle i64 %31, 0
  br i1 %32, label %33, label %36

33:                                               ; preds = %28
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %34, i32 0, i32 2
  store i64 256, ptr %35, align 8
  br label %36

36:                                               ; preds = %33, %28
  %37 = load ptr, ptr %3, align 8
  %38 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %37, i32 0, i32 3
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %39, i32 0, i32 1
  %41 = load i64, ptr %40, align 8
  %42 = trunc i64 %41 to i32
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %43, i32 0, i32 2
  %45 = load i64, ptr %44, align 8
  %46 = trunc i64 %45 to i32
  call void @game_of_life_grid_init(ptr noundef %38, i32 noundef %42, i32 noundef %46)
  store i32 0, ptr %4, align 4
  br label %47

47:                                               ; preds = %84, %36
  %48 = load i32, ptr %4, align 4
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %49, i32 0, i32 3
  %51 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %50, i32 0, i32 1
  %52 = load i32, ptr %51, align 4
  %53 = icmp slt i32 %48, %52
  br i1 %53, label %54, label %87

54:                                               ; preds = %47
  store i32 0, ptr %5, align 4
  br label %55

55:                                               ; preds = %80, %54
  %56 = load i32, ptr %5, align 4
  %57 = load ptr, ptr %3, align 8
  %58 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %57, i32 0, i32 3
  %59 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %58, i32 0, i32 0
  %60 = load i32, ptr %59, align 8
  %61 = icmp slt i32 %56, %60
  br i1 %61, label %62, label %83

62:                                               ; preds = %55
  %63 = call double @Helper_next_float(double noundef 1.000000e+00)
  %64 = fcmp olt double %63, 1.000000e-01
  br i1 %64, label %65, label %79

65:                                               ; preds = %62
  %66 = load ptr, ptr %3, align 8
  %67 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %66, i32 0, i32 3
  %68 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %67, i32 0, i32 2
  %69 = load ptr, ptr %68, align 8
  %70 = load i32, ptr %4, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds ptr, ptr %69, i64 %71
  %73 = load ptr, ptr %72, align 8
  %74 = load i32, ptr %5, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds ptr, ptr %73, i64 %75
  %77 = load ptr, ptr %76, align 8
  %78 = getelementptr inbounds nuw %struct.Cell, ptr %77, i32 0, i32 0
  store i8 1, ptr %78, align 8
  br label %79

79:                                               ; preds = %65, %62
  br label %80

80:                                               ; preds = %79
  %81 = load i32, ptr %5, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, ptr %5, align 4
  br label %55, !llvm.loop !6

83:                                               ; preds = %55
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %4, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %4, align 4
  br label %47, !llvm.loop !8

87:                                               ; preds = %47
  %88 = load ptr, ptr %3, align 8
  %89 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %88, i32 0, i32 0
  store i32 0, ptr %89, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal void @game_of_life_grid_init(ptr noundef %0, i32 noundef %1, i32 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  store i32 %2, ptr %6, align 4
  %16 = load i32, ptr %5, align 4
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %17, i32 0, i32 0
  store i32 %16, ptr %18, align 8
  %19 = load i32, ptr %6, align 4
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %20, i32 0, i32 1
  store i32 %19, ptr %21, align 4
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = call noalias ptr @malloc(i64 noundef %24)
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %26, i32 0, i32 2
  store ptr %25, ptr %27, align 8
  store i32 0, ptr %7, align 4
  br label %28

28:                                               ; preds = %63, %3
  %29 = load i32, ptr %7, align 4
  %30 = load i32, ptr %6, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %66

32:                                               ; preds = %28
  %33 = load i32, ptr %5, align 4
  %34 = sext i32 %33 to i64
  %35 = mul i64 %34, 8
  %36 = call noalias ptr @malloc(i64 noundef %35)
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %37, i32 0, i32 2
  %39 = load ptr, ptr %38, align 8
  %40 = load i32, ptr %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds ptr, ptr %39, i64 %41
  store ptr %36, ptr %42, align 8
  store i32 0, ptr %8, align 4
  br label %43

43:                                               ; preds = %59, %32
  %44 = load i32, ptr %8, align 4
  %45 = load i32, ptr %5, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %62

47:                                               ; preds = %43
  %48 = call ptr @cell_create()
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %49, i32 0, i32 2
  %51 = load ptr, ptr %50, align 8
  %52 = load i32, ptr %7, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds ptr, ptr %51, i64 %53
  %55 = load ptr, ptr %54, align 8
  %56 = load i32, ptr %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds ptr, ptr %55, i64 %57
  store ptr %48, ptr %58, align 8
  br label %59

59:                                               ; preds = %47
  %60 = load i32, ptr %8, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %8, align 4
  br label %43, !llvm.loop !9

62:                                               ; preds = %43
  br label %63

63:                                               ; preds = %62
  %64 = load i32, ptr %7, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %7, align 4
  br label %28, !llvm.loop !10

66:                                               ; preds = %28
  store i32 0, ptr %9, align 4
  br label %67

67:                                               ; preds = %141, %66
  %68 = load i32, ptr %9, align 4
  %69 = load i32, ptr %6, align 4
  %70 = icmp slt i32 %68, %69
  br i1 %70, label %71, label %144

71:                                               ; preds = %67
  store i32 0, ptr %10, align 4
  br label %72

72:                                               ; preds = %137, %71
  %73 = load i32, ptr %10, align 4
  %74 = load i32, ptr %5, align 4
  %75 = icmp slt i32 %73, %74
  br i1 %75, label %76, label %140

76:                                               ; preds = %72
  %77 = load ptr, ptr %4, align 8
  %78 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %77, i32 0, i32 2
  %79 = load ptr, ptr %78, align 8
  %80 = load i32, ptr %9, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds ptr, ptr %79, i64 %81
  %83 = load ptr, ptr %82, align 8
  %84 = load i32, ptr %10, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds ptr, ptr %83, i64 %85
  %87 = load ptr, ptr %86, align 8
  store ptr %87, ptr %11, align 8
  store i32 -1, ptr %12, align 4
  br label %88

88:                                               ; preds = %133, %76
  %89 = load i32, ptr %12, align 4
  %90 = icmp sle i32 %89, 1
  br i1 %90, label %91, label %136

91:                                               ; preds = %88
  store i32 -1, ptr %13, align 4
  br label %92

92:                                               ; preds = %129, %91
  %93 = load i32, ptr %13, align 4
  %94 = icmp sle i32 %93, 1
  br i1 %94, label %95, label %132

95:                                               ; preds = %92
  %96 = load i32, ptr %13, align 4
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %98, label %102

98:                                               ; preds = %95
  %99 = load i32, ptr %12, align 4
  %100 = icmp eq i32 %99, 0
  br i1 %100, label %101, label %102

101:                                              ; preds = %98
  br label %129

102:                                              ; preds = %98, %95
  %103 = load i32, ptr %9, align 4
  %104 = load i32, ptr %12, align 4
  %105 = add nsw i32 %103, %104
  %106 = load i32, ptr %6, align 4
  %107 = add nsw i32 %105, %106
  %108 = load i32, ptr %6, align 4
  %109 = srem i32 %107, %108
  store i32 %109, ptr %14, align 4
  %110 = load i32, ptr %10, align 4
  %111 = load i32, ptr %13, align 4
  %112 = add nsw i32 %110, %111
  %113 = load i32, ptr %5, align 4
  %114 = add nsw i32 %112, %113
  %115 = load i32, ptr %5, align 4
  %116 = srem i32 %114, %115
  store i32 %116, ptr %15, align 4
  %117 = load ptr, ptr %11, align 8
  %118 = load ptr, ptr %4, align 8
  %119 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %118, i32 0, i32 2
  %120 = load ptr, ptr %119, align 8
  %121 = load i32, ptr %14, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds ptr, ptr %120, i64 %122
  %124 = load ptr, ptr %123, align 8
  %125 = load i32, ptr %15, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds ptr, ptr %124, i64 %126
  %128 = load ptr, ptr %127, align 8
  call void @cell_add_neighbor(ptr noundef %117, ptr noundef %128)
  br label %129

129:                                              ; preds = %102, %101
  %130 = load i32, ptr %13, align 4
  %131 = add nsw i32 %130, 1
  store i32 %131, ptr %13, align 4
  br label %92, !llvm.loop !11

132:                                              ; preds = %92
  br label %133

133:                                              ; preds = %132
  %134 = load i32, ptr %12, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, ptr %12, align 4
  br label %88, !llvm.loop !12

136:                                              ; preds = %88
  br label %137

137:                                              ; preds = %136
  %138 = load i32, ptr %10, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, ptr %10, align 4
  br label %72, !llvm.loop !13

140:                                              ; preds = %72
  br label %141

141:                                              ; preds = %140
  %142 = load i32, ptr %9, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, ptr %9, align 4
  br label %67, !llvm.loop !14

144:                                              ; preds = %67
  ret void
}

declare double @Helper_next_float(double noundef)

define dso_local void @GameOfLife_run(ptr noundef %0, i32 noundef %1) {
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
  %11 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %10, i32 0, i32 3
  call void @game_of_life_next_generation(ptr noundef %11)
  ret void
}

define internal void @game_of_life_next_generation(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %7

7:                                                ; preds = %36, %1
  %8 = load i32, ptr %3, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %39

13:                                               ; preds = %7
  store i32 0, ptr %4, align 4
  br label %14

14:                                               ; preds = %32, %13
  %15 = load i32, ptr %4, align 4
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %35

20:                                               ; preds = %14
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29
  %31 = load ptr, ptr %30, align 8
  call void @cell_compute_next_state(ptr noundef %31)
  br label %32

32:                                               ; preds = %20
  %33 = load i32, ptr %4, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, ptr %4, align 4
  br label %14, !llvm.loop !15

35:                                               ; preds = %14
  br label %36

36:                                               ; preds = %35
  %37 = load i32, ptr %3, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, ptr %3, align 4
  br label %7, !llvm.loop !16

39:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %40

40:                                               ; preds = %69, %39
  %41 = load i32, ptr %5, align 4
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %42, i32 0, i32 1
  %44 = load i32, ptr %43, align 4
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %72

46:                                               ; preds = %40
  store i32 0, ptr %6, align 4
  br label %47

47:                                               ; preds = %65, %46
  %48 = load i32, ptr %6, align 4
  %49 = load ptr, ptr %2, align 8
  %50 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %49, i32 0, i32 0
  %51 = load i32, ptr %50, align 8
  %52 = icmp slt i32 %48, %51
  br i1 %52, label %53, label %68

53:                                               ; preds = %47
  %54 = load ptr, ptr %2, align 8
  %55 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %54, i32 0, i32 2
  %56 = load ptr, ptr %55, align 8
  %57 = load i32, ptr %5, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds ptr, ptr %56, i64 %58
  %60 = load ptr, ptr %59, align 8
  %61 = load i32, ptr %6, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds ptr, ptr %60, i64 %62
  %64 = load ptr, ptr %63, align 8
  call void @cell_update(ptr noundef %64)
  br label %65

65:                                               ; preds = %53
  %66 = load i32, ptr %6, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %6, align 4
  br label %47, !llvm.loop !17

68:                                               ; preds = %47
  br label %69

69:                                               ; preds = %68
  %70 = load i32, ptr %5, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, ptr %5, align 4
  br label %40, !llvm.loop !18

72:                                               ; preds = %40
  ret void
}

define dso_local i32 @GameOfLife_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %8, i32 0, i32 3
  %10 = call i32 @game_of_life_count_alive(ptr noundef %9)
  store i32 %10, ptr %4, align 4
  %11 = load ptr, ptr %3, align 8
  %12 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %11, i32 0, i32 3
  %13 = call i32 @game_of_life_grid_hash(ptr noundef %12)
  %14 = load i32, ptr %4, align 4
  %15 = add i32 %13, %14
  ret i32 %15
}

define internal i32 @game_of_life_count_alive(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %6

6:                                                ; preds = %42, %1
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %8, i32 0, i32 1
  %10 = load i32, ptr %9, align 4
  %11 = icmp slt i32 %7, %10
  br i1 %11, label %12, label %45

12:                                               ; preds = %6
  store i32 0, ptr %5, align 4
  br label %13

13:                                               ; preds = %38, %12
  %14 = load i32, ptr %5, align 4
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %15, i32 0, i32 0
  %17 = load i32, ptr %16, align 8
  %18 = icmp slt i32 %14, %17
  br i1 %18, label %19, label %41

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = load i32, ptr %4, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds ptr, ptr %22, i64 %24
  %26 = load ptr, ptr %25, align 8
  %27 = load i32, ptr %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds ptr, ptr %26, i64 %28
  %30 = load ptr, ptr %29, align 8
  %31 = getelementptr inbounds nuw %struct.Cell, ptr %30, i32 0, i32 0
  %32 = load i8, ptr %31, align 8
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %37

34:                                               ; preds = %19
  %35 = load i32, ptr %3, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %3, align 4
  br label %37

37:                                               ; preds = %34, %19
  br label %38

38:                                               ; preds = %37
  %39 = load i32, ptr %5, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %5, align 4
  br label %13, !llvm.loop !19

41:                                               ; preds = %13
  br label %42

42:                                               ; preds = %41
  %43 = load i32, ptr %4, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %4, align 4
  br label %6, !llvm.loop !20

45:                                               ; preds = %6
  %46 = load i32, ptr %3, align 4
  ret i32 %46
}

define internal i32 @game_of_life_grid_hash(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %7

7:                                                ; preds = %44, %1
  %8 = load i32, ptr %4, align 4
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %9, i32 0, i32 1
  %11 = load i32, ptr %10, align 4
  %12 = icmp slt i32 %8, %11
  br i1 %12, label %13, label %47

13:                                               ; preds = %7
  store i32 0, ptr %5, align 4
  br label %14

14:                                               ; preds = %40, %13
  %15 = load i32, ptr %5, align 4
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %16, i32 0, i32 0
  %18 = load i32, ptr %17, align 8
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %43

20:                                               ; preds = %14
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %21, i32 0, i32 2
  %23 = load ptr, ptr %22, align 8
  %24 = load i32, ptr %4, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds ptr, ptr %23, i64 %25
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %5, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds ptr, ptr %27, i64 %29
  %31 = load ptr, ptr %30, align 8
  %32 = getelementptr inbounds nuw %struct.Cell, ptr %31, i32 0, i32 0
  %33 = load i8, ptr %32, align 8
  %34 = trunc i8 %33 to i1
  %35 = zext i1 %34 to i64
  %36 = select i1 %34, i32 1, i32 0
  store i32 %36, ptr %6, align 4
  %37 = load i32, ptr %3, align 4
  %38 = load i32, ptr %6, align 4
  %39 = call i32 @fnv1a_hash(i32 noundef %37, i32 noundef %38)
  store i32 %39, ptr %3, align 4
  br label %40

40:                                               ; preds = %20
  %41 = load i32, ptr %5, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %5, align 4
  br label %14, !llvm.loop !21

43:                                               ; preds = %14
  br label %44

44:                                               ; preds = %43
  %45 = load i32, ptr %4, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, ptr %4, align 4
  br label %7, !llvm.loop !22

47:                                               ; preds = %7
  %48 = load i32, ptr %3, align 4
  ret i32 %48
}

define dso_local void @GameOfLife_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.GameOfLifeData, ptr %7, i32 0, i32 3
  call void @game_of_life_grid_free(ptr noundef %8)
  ret void
}

define internal void @game_of_life_grid_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  br label %5

5:                                                ; preds = %41, %1
  %6 = load i32, ptr %3, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 4
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %44

11:                                               ; preds = %5
  store i32 0, ptr %4, align 4
  br label %12

12:                                               ; preds = %30, %11
  %13 = load i32, ptr %4, align 4
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %14, i32 0, i32 0
  %16 = load i32, ptr %15, align 8
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %33

18:                                               ; preds = %12
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  %22 = load i32, ptr %3, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds ptr, ptr %21, i64 %23
  %25 = load ptr, ptr %24, align 8
  %26 = load i32, ptr %4, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds ptr, ptr %25, i64 %27
  %29 = load ptr, ptr %28, align 8
  call void @cell_destroy(ptr noundef %29)
  br label %30

30:                                               ; preds = %18
  %31 = load i32, ptr %4, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, ptr %4, align 4
  br label %12, !llvm.loop !23

33:                                               ; preds = %12
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %34, i32 0, i32 2
  %36 = load ptr, ptr %35, align 8
  %37 = load i32, ptr %3, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds ptr, ptr %36, i64 %38
  %40 = load ptr, ptr %39, align 8
  call void @free(ptr noundef %40)
  br label %41

41:                                               ; preds = %33
  %42 = load i32, ptr %3, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %3, align 4
  br label %5, !llvm.loop !24

44:                                               ; preds = %5
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds nuw %struct.GameOfLifeGrid, ptr %45, i32 0, i32 2
  %47 = load ptr, ptr %46, align 8
  call void @free(ptr noundef %47)
  ret void
}

define dso_local ptr @GameOfLife_create() {
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
  store ptr @GameOfLife_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @GameOfLife_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @GameOfLife_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @GameOfLife_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define internal ptr @cell_create() {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds nuw %struct.Cell, ptr %3, i32 0, i32 0
  store i8 0, ptr %4, align 8
  %5 = load ptr, ptr %1, align 8
  %6 = getelementptr inbounds nuw %struct.Cell, ptr %5, i32 0, i32 1
  store i8 0, ptr %6, align 1
  %7 = call noalias ptr @malloc(i64 noundef 64)
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Cell, ptr %8, i32 0, i32 2
  store ptr %7, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Cell, ptr %10, i32 0, i32 3
  store i32 0, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  ret ptr %12
}

define internal void @cell_add_neighbor(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.Cell, ptr %6, i32 0, i32 2
  %8 = load ptr, ptr %7, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.Cell, ptr %9, i32 0, i32 3
  %11 = load i32, ptr %10, align 8
  %12 = add nsw i32 %11, 1
  store i32 %12, ptr %10, align 8
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds ptr, ptr %8, i64 %13
  store ptr %5, ptr %14, align 8
  ret void
}

define internal void @cell_compute_next_state(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %26, %1
  %6 = load i32, ptr %4, align 4
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Cell, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  %10 = icmp slt i32 %6, %9
  br i1 %10, label %11, label %29

11:                                               ; preds = %5
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.Cell, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  %15 = load i32, ptr %4, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds ptr, ptr %14, i64 %16
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.Cell, ptr %18, i32 0, i32 0
  %20 = load i8, ptr %19, align 8
  %21 = trunc i8 %20 to i1
  br i1 %21, label %22, label %25

22:                                               ; preds = %11
  %23 = load i32, ptr %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %3, align 4
  br label %25

25:                                               ; preds = %22, %11
  br label %26

26:                                               ; preds = %25
  %27 = load i32, ptr %4, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %4, align 4
  br label %5, !llvm.loop !25

29:                                               ; preds = %5
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds nuw %struct.Cell, ptr %30, i32 0, i32 0
  %32 = load i8, ptr %31, align 8
  %33 = trunc i8 %32 to i1
  br i1 %33, label %34, label %45

34:                                               ; preds = %29
  %35 = load i32, ptr %3, align 4
  %36 = icmp eq i32 %35, 2
  br i1 %36, label %40, label %37

37:                                               ; preds = %34
  %38 = load i32, ptr %3, align 4
  %39 = icmp eq i32 %38, 3
  br label %40

40:                                               ; preds = %37, %34
  %41 = phi i1 [ true, %34 ], [ %39, %37 ]
  %42 = load ptr, ptr %2, align 8
  %43 = getelementptr inbounds nuw %struct.Cell, ptr %42, i32 0, i32 1
  %44 = zext i1 %41 to i8
  store i8 %44, ptr %43, align 1
  br label %51

45:                                               ; preds = %29
  %46 = load i32, ptr %3, align 4
  %47 = icmp eq i32 %46, 3
  %48 = load ptr, ptr %2, align 8
  %49 = getelementptr inbounds nuw %struct.Cell, ptr %48, i32 0, i32 1
  %50 = zext i1 %47 to i8
  store i8 %50, ptr %49, align 1
  br label %51

51:                                               ; preds = %45, %40
  ret void
}

define internal void @cell_update(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Cell, ptr %3, i32 0, i32 1
  %5 = load i8, ptr %4, align 1
  %6 = trunc i8 %5 to i1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Cell, ptr %7, i32 0, i32 0
  %9 = zext i1 %6 to i8
  store i8 %9, ptr %8, align 8
  ret void
}

define internal i32 @fnv1a_hash(i32 noundef %0, i32 noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  store i32 -2128831035, ptr %5, align 4
  store i32 16777619, ptr %6, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  store i32 -2128831035, ptr %3, align 4
  br label %10

10:                                               ; preds = %9, %2
  %11 = load i32, ptr %4, align 4
  %12 = load i32, ptr %3, align 4
  %13 = xor i32 %12, %11
  store i32 %13, ptr %3, align 4
  %14 = load i32, ptr %3, align 4
  %15 = mul i32 %14, 16777619
  store i32 %15, ptr %3, align 4
  %16 = load i32, ptr %3, align 4
  ret i32 %16
}

define internal void @cell_destroy(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.Cell, ptr %3, i32 0, i32 2
  %5 = load ptr, ptr %4, align 8
  call void @free(ptr noundef %5)
  %6 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %6)
  ret void
}

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
