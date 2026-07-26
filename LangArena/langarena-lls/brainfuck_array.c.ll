; ModuleID = 'c/src/brainfuck_array.c'
source_filename = "c/src/brainfuck_array.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.BrainfuckArrayData = type { ptr, ptr, i32, i32, ptr, ptr, i32 }
%struct.BrainfuckArray_Tape = type { ptr, i64, i64 }

@.str = private unnamed_addr constant [8 x i8] c"program\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"warmup_program\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"warmup_iterations\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Brainfuck::Array\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"[]<>+-,.\00", align 1

define dso_local void @BrainfuckArray_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call ptr @Helper_config_s(ptr noundef %11, ptr noundef @.str)
  store ptr %12, ptr %4, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 0
  %15 = load ptr, ptr %14, align 8
  %16 = call ptr @Helper_config_s(ptr noundef %15, ptr noundef @.str.1)
  store ptr %16, ptr %5, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %18, i32 0, i32 2
  %20 = call ptr @BrainfuckArray_filter_commands(ptr noundef %17, ptr noundef %19)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %21, i32 0, i32 0
  store ptr %20, ptr %22, align 8
  %23 = load ptr, ptr %3, align 8
  %24 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %26, i32 0, i32 2
  %28 = load i32, ptr %27, align 8
  %29 = call ptr @BrainfuckArray_build_jumps(ptr noundef %25, i32 noundef %28)
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %30, i32 0, i32 4
  store ptr %29, ptr %31, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %33, i32 0, i32 3
  %35 = call ptr @BrainfuckArray_filter_commands(ptr noundef %32, ptr noundef %34)
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %36, i32 0, i32 1
  store ptr %35, ptr %37, align 8
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %41, i32 0, i32 3
  %43 = load i32, ptr %42, align 4
  %44 = call ptr @BrainfuckArray_build_jumps(ptr noundef %40, i32 noundef %43)
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %45, i32 0, i32 5
  store ptr %44, ptr %46, align 8
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %47, i32 0, i32 6
  store i32 0, ptr %48, align 8
  ret void
}

declare ptr @Helper_config_s(ptr noundef, ptr noundef)

define internal ptr @BrainfuckArray_filter_commands(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i8, align 1
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %15, label %13

13:                                               ; preds = %2
  %14 = load ptr, ptr %5, align 8
  store i32 0, ptr %14, align 4
  store ptr null, ptr %3, align 8
  br label %58

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  %17 = call i64 @strlen(ptr noundef %16)
  store i64 %17, ptr %6, align 8
  %18 = load i64, ptr %6, align 8
  %19 = add i64 %18, 1
  %20 = call noalias ptr @malloc(i64 noundef %19)
  store ptr %20, ptr %7, align 8
  %21 = load ptr, ptr %7, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %25, label %23

23:                                               ; preds = %15
  %24 = load ptr, ptr %5, align 8
  store i32 0, ptr %24, align 4
  store ptr null, ptr %3, align 8
  br label %58

25:                                               ; preds = %15
  store i32 0, ptr %8, align 4
  store i64 0, ptr %9, align 8
  br label %26

26:                                               ; preds = %47, %25
  %27 = load i64, ptr %9, align 8
  %28 = load i64, ptr %6, align 8
  %29 = icmp ult i64 %27, %28
  br i1 %29, label %30, label %50

30:                                               ; preds = %26
  %31 = load ptr, ptr %4, align 8
  %32 = load i64, ptr %9, align 8
  %33 = getelementptr inbounds nuw i8, ptr %31, i64 %32
  %34 = load i8, ptr %33, align 1
  store i8 %34, ptr %10, align 1
  %35 = load i8, ptr %10, align 1
  %36 = sext i8 %35 to i32
  %37 = call ptr @strchr(ptr noundef @.str.4, i32 noundef %36)
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %46

39:                                               ; preds = %30
  %40 = load i8, ptr %10, align 1
  %41 = load ptr, ptr %7, align 8
  %42 = load i32, ptr %8, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %8, align 4
  %44 = sext i32 %42 to i64
  %45 = getelementptr inbounds i8, ptr %41, i64 %44
  store i8 %40, ptr %45, align 1
  br label %46

46:                                               ; preds = %39, %30
  br label %47

47:                                               ; preds = %46
  %48 = load i64, ptr %9, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr %9, align 8
  br label %26, !llvm.loop !6

50:                                               ; preds = %26
  %51 = load ptr, ptr %7, align 8
  %52 = load i32, ptr %8, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, ptr %51, i64 %53
  store i8 0, ptr %54, align 1
  %55 = load i32, ptr %8, align 4
  %56 = load ptr, ptr %5, align 8
  store i32 %55, ptr %56, align 4
  %57 = load ptr, ptr %7, align 8
  store ptr %57, ptr %3, align 8
  br label %58

58:                                               ; preds = %50, %23, %13
  %59 = load ptr, ptr %3, align 8
  ret ptr %59
}

define internal ptr @BrainfuckArray_build_jumps(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i8, align 1
  %11 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store i32 %1, ptr %5, align 4
  %12 = load ptr, ptr %4, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %17

14:                                               ; preds = %2
  %15 = load i32, ptr %5, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %14, %2
  store ptr null, ptr %3, align 8
  br label %90

18:                                               ; preds = %14
  %19 = load i32, ptr %5, align 4
  %20 = sext i32 %19 to i64
  %21 = call noalias ptr @calloc(i64 noundef %20, i64 noundef 4)
  store ptr %21, ptr %6, align 8
  %22 = load ptr, ptr %6, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %25, label %24

24:                                               ; preds = %18
  store ptr null, ptr %3, align 8
  br label %90

25:                                               ; preds = %18
  %26 = load i32, ptr %5, align 4
  %27 = sdiv i32 %26, 2
  %28 = add nsw i32 %27, 1
  %29 = sext i32 %28 to i64
  %30 = mul i64 4, %29
  %31 = call noalias ptr @malloc(i64 noundef %30)
  store ptr %31, ptr %7, align 8
  %32 = load ptr, ptr %7, align 8
  %33 = icmp ne ptr %32, null
  br i1 %33, label %36, label %34

34:                                               ; preds = %25
  %35 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %35)
  store ptr null, ptr %3, align 8
  br label %90

36:                                               ; preds = %25
  store i32 -1, ptr %8, align 4
  store i32 0, ptr %9, align 4
  br label %37

37:                                               ; preds = %84, %36
  %38 = load i32, ptr %9, align 4
  %39 = load i32, ptr %5, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %87

41:                                               ; preds = %37
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %9, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, ptr %42, i64 %44
  %46 = load i8, ptr %45, align 1
  store i8 %46, ptr %10, align 1
  %47 = load i8, ptr %10, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 91
  br i1 %49, label %50, label %57

50:                                               ; preds = %41
  %51 = load i32, ptr %9, align 4
  %52 = load ptr, ptr %7, align 8
  %53 = load i32, ptr %8, align 4
  %54 = add nsw i32 %53, 1
  store i32 %54, ptr %8, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, ptr %52, i64 %55
  store i32 %51, ptr %56, align 4
  br label %83

57:                                               ; preds = %41
  %58 = load i8, ptr %10, align 1
  %59 = sext i8 %58 to i32
  %60 = icmp eq i32 %59, 93
  br i1 %60, label %61, label %82

61:                                               ; preds = %57
  %62 = load i32, ptr %8, align 4
  %63 = icmp sge i32 %62, 0
  br i1 %63, label %64, label %81

64:                                               ; preds = %61
  %65 = load ptr, ptr %7, align 8
  %66 = load i32, ptr %8, align 4
  %67 = add nsw i32 %66, -1
  store i32 %67, ptr %8, align 4
  %68 = sext i32 %66 to i64
  %69 = getelementptr inbounds i32, ptr %65, i64 %68
  %70 = load i32, ptr %69, align 4
  store i32 %70, ptr %11, align 4
  %71 = load i32, ptr %9, align 4
  %72 = load ptr, ptr %6, align 8
  %73 = load i32, ptr %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i32, ptr %72, i64 %74
  store i32 %71, ptr %75, align 4
  %76 = load i32, ptr %11, align 4
  %77 = load ptr, ptr %6, align 8
  %78 = load i32, ptr %9, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, ptr %77, i64 %79
  store i32 %76, ptr %80, align 4
  br label %81

81:                                               ; preds = %64, %61
  br label %82

82:                                               ; preds = %81, %57
  br label %83

83:                                               ; preds = %82, %50
  br label %84

84:                                               ; preds = %83
  %85 = load i32, ptr %9, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %9, align 4
  br label %37, !llvm.loop !8

87:                                               ; preds = %37
  %88 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %88)
  %89 = load ptr, ptr %6, align 8
  store ptr %89, ptr %3, align 8
  br label %90

90:                                               ; preds = %87, %34, %24, %17
  %91 = load ptr, ptr %3, align 8
  ret ptr %91
}

define dso_local void @BrainfuckArray_warmup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %18

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %14, i32 0, i32 3
  %16 = load i32, ptr %15, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %13, %1
  br label %56

19:                                               ; preds = %13
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 0
  %22 = load ptr, ptr %21, align 8
  %23 = call i64 @Helper_config_i64(ptr noundef %22, ptr noundef @.str.2)
  store i64 %23, ptr %4, align 8
  %24 = load i64, ptr %4, align 8
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %37

26:                                               ; preds = %19
  %27 = load ptr, ptr %2, align 8
  %28 = getelementptr inbounds nuw %struct.Benchmark, ptr %27, i32 0, i32 8
  %29 = load ptr, ptr %28, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = call i64 %29(ptr noundef %30)
  %32 = sdiv i64 %31, 5
  store i64 %32, ptr %4, align 8
  %33 = load i64, ptr %4, align 8
  %34 = icmp slt i64 %33, 1
  br i1 %34, label %35, label %36

35:                                               ; preds = %26
  store i64 1, ptr %4, align 8
  br label %36

36:                                               ; preds = %35, %26
  br label %37

37:                                               ; preds = %36, %19
  store i64 0, ptr %5, align 8
  br label %38

38:                                               ; preds = %53, %37
  %39 = load i64, ptr %5, align 8
  %40 = load i64, ptr %4, align 8
  %41 = icmp slt i64 %39, %40
  br i1 %41, label %42, label %56

42:                                               ; preds = %38
  %43 = load ptr, ptr %3, align 8
  %44 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %43, i32 0, i32 1
  %45 = load ptr, ptr %44, align 8
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %46, i32 0, i32 3
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %49, i32 0, i32 5
  %51 = load ptr, ptr %50, align 8
  %52 = call i32 @BrainfuckArray_execute_program(ptr noundef %45, i32 noundef %48, ptr noundef %51)
  br label %53

53:                                               ; preds = %42
  %54 = load i64, ptr %5, align 8
  %55 = add nsw i64 %54, 1
  store i64 %55, ptr %5, align 8
  br label %38, !llvm.loop !9

56:                                               ; preds = %18, %38
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal i32 @BrainfuckArray_execute_program(ptr noundef %0, i32 noundef %1, ptr noundef %2) {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca %struct.BrainfuckArray_Tape, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i8, align 1
  store ptr %0, ptr %5, align 8
  store i32 %1, ptr %6, align 4
  store ptr %2, ptr %7, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %3
  %15 = load i32, ptr %6, align 4
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %14
  %18 = load ptr, ptr %7, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %21, label %20

20:                                               ; preds = %17, %14, %3
  store i32 0, ptr %4, align 4
  br label %72

21:                                               ; preds = %17
  call void @BrainfuckArray_Tape_init(ptr noundef %8)
  store i32 0, ptr %9, align 4
  store i32 0, ptr %10, align 4
  br label %22

22:                                               ; preds = %67, %21
  %23 = load i32, ptr %9, align 4
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %70

26:                                               ; preds = %22
  %27 = load ptr, ptr %5, align 8
  %28 = load i32, ptr %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  %31 = load i8, ptr %30, align 1
  store i8 %31, ptr %11, align 1
  %32 = load i8, ptr %11, align 1
  %33 = sext i8 %32 to i32
  switch i32 %33, label %66 [
    i32 43, label %34
    i32 45, label %35
    i32 62, label %36
    i32 60, label %37
    i32 91, label %38
    i32 93, label %49
    i32 46, label %60
  ]

34:                                               ; preds = %26
  call void @BrainfuckArray_Tape_inc(ptr noundef %8)
  br label %67

35:                                               ; preds = %26
  call void @BrainfuckArray_Tape_dec(ptr noundef %8)
  br label %67

36:                                               ; preds = %26
  call void @BrainfuckArray_Tape_advance(ptr noundef %8)
  br label %67

37:                                               ; preds = %26
  call void @BrainfuckArray_Tape_devance(ptr noundef %8)
  br label %67

38:                                               ; preds = %26
  %39 = call zeroext i8 @BrainfuckArray_Tape_get(ptr noundef %8)
  %40 = zext i8 %39 to i32
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %48

42:                                               ; preds = %38
  %43 = load ptr, ptr %7, align 8
  %44 = load i32, ptr %9, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, ptr %43, i64 %45
  %47 = load i32, ptr %46, align 4
  store i32 %47, ptr %9, align 4
  br label %48

48:                                               ; preds = %42, %38
  br label %67

49:                                               ; preds = %26
  %50 = call zeroext i8 @BrainfuckArray_Tape_get(ptr noundef %8)
  %51 = zext i8 %50 to i32
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %53, label %59

53:                                               ; preds = %49
  %54 = load ptr, ptr %7, align 8
  %55 = load i32, ptr %9, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, ptr %54, i64 %56
  %58 = load i32, ptr %57, align 4
  store i32 %58, ptr %9, align 4
  br label %59

59:                                               ; preds = %53, %49
  br label %67

60:                                               ; preds = %26
  %61 = load i32, ptr %10, align 4
  %62 = shl i32 %61, 2
  %63 = call zeroext i8 @BrainfuckArray_Tape_get(ptr noundef %8)
  %64 = zext i8 %63 to i32
  %65 = add i32 %62, %64
  store i32 %65, ptr %10, align 4
  br label %67

66:                                               ; preds = %26
  br label %67

67:                                               ; preds = %66, %60, %59, %48, %37, %36, %35, %34
  %68 = load i32, ptr %9, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %9, align 4
  br label %22, !llvm.loop !10

70:                                               ; preds = %22
  call void @BrainfuckArray_Tape_destroy(ptr noundef %8)
  %71 = load i32, ptr %10, align 4
  store i32 %71, ptr %4, align 4
  br label %72

72:                                               ; preds = %70, %20
  %73 = load i32, ptr %4, align 4
  ret i32 %73
}

define dso_local void @BrainfuckArray_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  store ptr %9, ptr %5, align 8
  %10 = load i32, ptr %4, align 4
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %15

12:                                               ; preds = %2
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %13, i32 0, i32 6
  store i32 0, ptr %14, align 8
  br label %15

15:                                               ; preds = %12, %2
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = icmp ne ptr %18, null
  br i1 %19, label %20, label %46

20:                                               ; preds = %15
  %21 = load ptr, ptr %5, align 8
  %22 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %21, i32 0, i32 2
  %23 = load i32, ptr %22, align 8
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %25, label %46

25:                                               ; preds = %20
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %27, align 8
  %29 = icmp ne ptr %28, null
  br i1 %29, label %30, label %46

30:                                               ; preds = %25
  %31 = load ptr, ptr %5, align 8
  %32 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %34, i32 0, i32 2
  %36 = load i32, ptr %35, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %37, i32 0, i32 4
  %39 = load ptr, ptr %38, align 8
  %40 = call i32 @BrainfuckArray_execute_program(ptr noundef %33, i32 noundef %36, ptr noundef %39)
  store i32 %40, ptr %6, align 4
  %41 = load i32, ptr %6, align 4
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %42, i32 0, i32 6
  %44 = load i32, ptr %43, align 8
  %45 = add i32 %44, %41
  store i32 %45, ptr %43, align 8
  br label %46

46:                                               ; preds = %30, %25, %20, %15
  ret void
}

define dso_local i32 @BrainfuckArray_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %7, i32 0, i32 6
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @BrainfuckArray_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = icmp ne ptr %4, null
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %12, label %11

11:                                               ; preds = %6, %1
  br label %31

12:                                               ; preds = %6
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 11
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %3, align 8
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  call void @free(ptr noundef %18)
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %19, i32 0, i32 4
  %21 = load ptr, ptr %20, align 8
  call void @free(ptr noundef %21)
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  call void @free(ptr noundef %24)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.BrainfuckArrayData, ptr %25, i32 0, i32 5
  %27 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %27)
  %28 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %2, align 8
  %30 = getelementptr inbounds nuw %struct.Benchmark, ptr %29, i32 0, i32 11
  store ptr null, ptr %30, align 8
  br label %31

31:                                               ; preds = %12, %11
  ret void
}

declare void @free(ptr noundef)

define dso_local ptr @BrainfuckArray_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = call ptr @Benchmark_create(ptr noundef @.str.3)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %8, label %7

7:                                                ; preds = %0
  store ptr null, ptr %1, align 8
  br label %29

8:                                                ; preds = %0
  %9 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 48)
  store ptr %9, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %14, label %12

12:                                               ; preds = %8
  %13 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %13)
  store ptr null, ptr %1, align 8
  br label %29

14:                                               ; preds = %8
  %15 = load ptr, ptr %3, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.Benchmark, ptr %16, i32 0, i32 11
  store ptr %15, ptr %17, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.Benchmark, ptr %18, i32 0, i32 3
  store ptr @BrainfuckArray_prepare, ptr %19, align 8
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 6
  store ptr @BrainfuckArray_warmup, ptr %21, align 8
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.Benchmark, ptr %22, i32 0, i32 4
  store ptr @BrainfuckArray_run, ptr %23, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.Benchmark, ptr %24, i32 0, i32 7
  store ptr @BrainfuckArray_checksum, ptr %25, align 8
  %26 = load ptr, ptr %2, align 8
  %27 = getelementptr inbounds nuw %struct.Benchmark, ptr %26, i32 0, i32 10
  store ptr @BrainfuckArray_cleanup, ptr %27, align 8
  %28 = load ptr, ptr %2, align 8
  store ptr %28, ptr %1, align 8
  br label %29

29:                                               ; preds = %14, %12, %7
  %30 = load ptr, ptr %1, align 8
  ret ptr %30
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

declare i64 @strlen(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare ptr @strchr(ptr noundef, i32 noundef)

define internal void @BrainfuckArray_Tape_init(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %3, i32 0, i32 1
  store i64 30000, ptr %4, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %5, i32 0, i32 1
  %7 = load i64, ptr %6, align 8
  %8 = call noalias ptr @calloc(i64 noundef %7, i64 noundef 1)
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %9, i32 0, i32 0
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %11, i32 0, i32 2
  store i64 0, ptr %12, align 8
  ret void
}

define internal void @BrainfuckArray_Tape_inc(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %6, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = getelementptr inbounds nuw i8, ptr %5, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = add i8 %10, 1
  store i8 %11, ptr %9, align 1
  ret void
}

define internal void @BrainfuckArray_Tape_dec(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %6, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = getelementptr inbounds nuw i8, ptr %5, i64 %8
  %10 = load i8, ptr %9, align 1
  %11 = add i8 %10, -1
  store i8 %11, ptr %9, align 1
  ret void
}

define internal void @BrainfuckArray_Tape_advance(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %5, i32 0, i32 2
  %7 = load i64, ptr %6, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr %6, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %9, i32 0, i32 2
  %11 = load i64, ptr %10, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %12, i32 0, i32 1
  %14 = load i64, ptr %13, align 8
  %15 = icmp uge i64 %11, %14
  br i1 %15, label %16, label %43

16:                                               ; preds = %1
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %17, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr %3, align 8
  %21 = load ptr, ptr %2, align 8
  %22 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %21, i32 0, i32 0
  %23 = load ptr, ptr %22, align 8
  %24 = load i64, ptr %3, align 8
  %25 = call ptr @realloc(ptr noundef %23, i64 noundef %24)
  store ptr %25, ptr %4, align 8
  %26 = load ptr, ptr %4, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %42

28:                                               ; preds = %16
  %29 = load ptr, ptr %4, align 8
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %30, i32 0, i32 0
  store ptr %29, ptr %31, align 8
  %32 = load ptr, ptr %2, align 8
  %33 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %32, i32 0, i32 0
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %35, i32 0, i32 1
  %37 = load i64, ptr %36, align 8
  %38 = getelementptr inbounds nuw i8, ptr %34, i64 %37
  store i8 0, ptr %38, align 1
  %39 = load i64, ptr %3, align 8
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %40, i32 0, i32 1
  store i64 %39, ptr %41, align 8
  br label %42

42:                                               ; preds = %28, %16
  br label %43

43:                                               ; preds = %42, %1
  ret void
}

define internal void @BrainfuckArray_Tape_devance(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %3, i32 0, i32 2
  %5 = load i64, ptr %4, align 8
  %6 = icmp ugt i64 %5, 0
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %8, i32 0, i32 2
  %10 = load i64, ptr %9, align 8
  %11 = add i64 %10, -1
  store i64 %11, ptr %9, align 8
  br label %12

12:                                               ; preds = %7, %1
  ret void
}

define internal zeroext i8 @BrainfuckArray_Tape_get(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %6, i32 0, i32 2
  %8 = load i64, ptr %7, align 8
  %9 = getelementptr inbounds nuw i8, ptr %5, i64 %8
  %10 = load i8, ptr %9, align 1
  ret i8 %10
}

define internal void @BrainfuckArray_Tape_destroy(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %5, label %20

5:                                                ; preds = %1
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %6, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  %9 = icmp ne ptr %8, null
  br i1 %9, label %10, label %20

10:                                               ; preds = %5
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13)
  %14 = load ptr, ptr %2, align 8
  %15 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %14, i32 0, i32 0
  store ptr null, ptr %15, align 8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %16, i32 0, i32 1
  store i64 0, ptr %17, align 8
  %18 = load ptr, ptr %2, align 8
  %19 = getelementptr inbounds nuw %struct.BrainfuckArray_Tape, ptr %18, i32 0, i32 2
  store i64 0, ptr %19, align 8
  br label %20

20:                                               ; preds = %10, %5, %1
  ret void
}

declare ptr @realloc(ptr noundef, i64 noundef)


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
