; ModuleID = 'c/main.c'
source_filename = "c/main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [17 x i8] c"Binarytrees::Obj\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"Binarytrees::Arena\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Brainfuck::Array\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Brainfuck::Recursion\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"CLBG::Fannkuchredux\00", align 1
@.str.5 = private unnamed_addr constant [17 x i8] c"CLBG::Mandelbrot\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Matmul::Single\00", align 1
@.str.7 = private unnamed_addr constant [11 x i8] c"Matmul::T4\00", align 1
@.str.8 = private unnamed_addr constant [11 x i8] c"Matmul::T8\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"Matmul::T16\00", align 1
@.str.10 = private unnamed_addr constant [12 x i8] c"CLBG::Nbody\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"CLBG::Spectralnorm\00", align 1
@.str.12 = private unnamed_addr constant [15 x i8] c"Base64::Encode\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"Base64::Decode\00", align 1
@.str.14 = private unnamed_addr constant [15 x i8] c"Json::Generate\00", align 1
@.str.15 = private unnamed_addr constant [15 x i8] c"Json::ParseDom\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"Json::ParseMapping\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"Etc::Sieve\00", align 1
@.str.18 = private unnamed_addr constant [19 x i8] c"Etc::TextRaytracer\00", align 1
@.str.19 = private unnamed_addr constant [15 x i8] c"Etc::NeuralNet\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"Sort::Quick\00", align 1
@.str.21 = private unnamed_addr constant [12 x i8] c"Sort::Merge\00", align 1
@.str.22 = private unnamed_addr constant [11 x i8] c"Sort::Self\00", align 1
@.str.23 = private unnamed_addr constant [11 x i8] c"Graph::BFS\00", align 1
@.str.24 = private unnamed_addr constant [11 x i8] c"Graph::DFS\00", align 1
@.str.25 = private unnamed_addr constant [13 x i8] c"Graph::AStar\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"Hash::SHA256\00", align 1
@.str.27 = private unnamed_addr constant [12 x i8] c"Hash::CRC32\00", align 1
@.str.28 = private unnamed_addr constant [21 x i8] c"Etc::CacheSimulation\00", align 1
@.str.29 = private unnamed_addr constant [16 x i8] c"Calculator::Ast\00", align 1
@.str.30 = private unnamed_addr constant [24 x i8] c"Calculator::Interpreter\00", align 1
@.str.31 = private unnamed_addr constant [16 x i8] c"Etc::GameOfLife\00", align 1
@.str.32 = private unnamed_addr constant [16 x i8] c"Maze::Generator\00", align 1
@.str.33 = private unnamed_addr constant [10 x i8] c"Maze::BFS\00", align 1
@.str.34 = private unnamed_addr constant [12 x i8] c"Maze::AStar\00", align 1
@.str.35 = private unnamed_addr constant [20 x i8] c"Compress::BWTEncode\00", align 1
@.str.36 = private unnamed_addr constant [20 x i8] c"Compress::BWTDecode\00", align 1
@.str.37 = private unnamed_addr constant [21 x i8] c"Compress::HuffEncode\00", align 1
@.str.38 = private unnamed_addr constant [21 x i8] c"Compress::HuffDecode\00", align 1
@.str.39 = private unnamed_addr constant [22 x i8] c"Compress::ArithEncode\00", align 1
@.str.40 = private unnamed_addr constant [22 x i8] c"Compress::ArithDecode\00", align 1
@.str.41 = private unnamed_addr constant [20 x i8] c"Compress::LZWEncode\00", align 1
@.str.42 = private unnamed_addr constant [20 x i8] c"Compress::LZWDecode\00", align 1
@.str.43 = private unnamed_addr constant [15 x i8] c"Distance::Jaro\00", align 1
@.str.44 = private unnamed_addr constant [16 x i8] c"Distance::NGram\00", align 1
@.str.45 = private unnamed_addr constant [11 x i8] c"Etc::Words\00", align 1
@.str.46 = private unnamed_addr constant [15 x i8] c"Etc::LogParser\00", align 1
@.str.47 = private unnamed_addr constant [16 x i8] c"Template::Regex\00", align 1
@.str.48 = private unnamed_addr constant [16 x i8] c"Template::Parse\00", align 1
@.str.49 = private unnamed_addr constant [11 x i8] c"CSV::Parse\00", align 1
@.str.50 = private unnamed_addr constant [12 x i8] c"start: %ld\0A\00", align 1
@.str.51 = private unnamed_addr constant [10 x i8] c"../run.js\00", align 1
@benchmark_factories = external global ptr, align 8
@benchmark_factories_count = external global i64, align 8
@benchmark_factories_capacity = external global i64, align 8
@.str.52 = private unnamed_addr constant [22 x i8] c"/tmp/recompile_marker\00", align 1
@.str.53 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.54 = private unnamed_addr constant [19 x i8] c"RECOMPILE_MARKER_0\00", align 1

define dso_local void @register_all_benchmarks() {
  call void @Benchmark_register(ptr noundef @.str, ptr noundef @BinarytreesObj_create)
  call void @Benchmark_register(ptr noundef @.str.1, ptr noundef @BinarytreesArena_create)
  call void @Benchmark_register(ptr noundef @.str.2, ptr noundef @BrainfuckArray_create)
  call void @Benchmark_register(ptr noundef @.str.3, ptr noundef @BrainfuckRecursion_create)
  call void @Benchmark_register(ptr noundef @.str.4, ptr noundef @Fannkuchredux_create)
  call void @Benchmark_register(ptr noundef @.str.5, ptr noundef @Mandelbrot_create)
  call void @Benchmark_register(ptr noundef @.str.6, ptr noundef @Matmul_create)
  call void @Benchmark_register(ptr noundef @.str.7, ptr noundef @Matmul4T_create)
  call void @Benchmark_register(ptr noundef @.str.8, ptr noundef @Matmul8T_create)
  call void @Benchmark_register(ptr noundef @.str.9, ptr noundef @Matmul16T_create)
  call void @Benchmark_register(ptr noundef @.str.10, ptr noundef @Nbody_create)
  call void @Benchmark_register(ptr noundef @.str.11, ptr noundef @Spectralnorm_create)
  call void @Benchmark_register(ptr noundef @.str.12, ptr noundef @Base64Encode_create)
  call void @Benchmark_register(ptr noundef @.str.13, ptr noundef @Base64Decode_create)
  call void @Benchmark_register(ptr noundef @.str.14, ptr noundef @JsonGenerate_create)
  call void @Benchmark_register(ptr noundef @.str.15, ptr noundef @JsonParseDom_create)
  call void @Benchmark_register(ptr noundef @.str.16, ptr noundef @JsonParseMapping_create)
  call void @Benchmark_register(ptr noundef @.str.17, ptr noundef @Sieve_create)
  call void @Benchmark_register(ptr noundef @.str.18, ptr noundef @TextRaytracer_create)
  call void @Benchmark_register(ptr noundef @.str.19, ptr noundef @NeuralNet_create)
  call void @Benchmark_register(ptr noundef @.str.20, ptr noundef @SortQuick_create)
  call void @Benchmark_register(ptr noundef @.str.21, ptr noundef @SortMerge_create)
  call void @Benchmark_register(ptr noundef @.str.22, ptr noundef @SortSelf_create)
  call void @Benchmark_register(ptr noundef @.str.23, ptr noundef @GraphPathBFS_create)
  call void @Benchmark_register(ptr noundef @.str.24, ptr noundef @GraphPathDFS_create)
  call void @Benchmark_register(ptr noundef @.str.25, ptr noundef @GraphPathAStar_create)
  call void @Benchmark_register(ptr noundef @.str.26, ptr noundef @BufferHashSHA256_create)
  call void @Benchmark_register(ptr noundef @.str.27, ptr noundef @BufferHashCRC32_create)
  call void @Benchmark_register(ptr noundef @.str.28, ptr noundef @CacheSimulation_create)
  call void @Benchmark_register(ptr noundef @.str.29, ptr noundef @CalculatorAst_create)
  call void @Benchmark_register(ptr noundef @.str.30, ptr noundef @CalculatorInterpreter_create)
  call void @Benchmark_register(ptr noundef @.str.31, ptr noundef @GameOfLife_create)
  call void @Benchmark_register(ptr noundef @.str.32, ptr noundef @MazeGenerator_create)
  call void @Benchmark_register(ptr noundef @.str.33, ptr noundef @MazeBFS_create)
  call void @Benchmark_register(ptr noundef @.str.34, ptr noundef @MazeAStar_create)
  call void @Benchmark_register(ptr noundef @.str.35, ptr noundef @BWTEncode_create)
  call void @Benchmark_register(ptr noundef @.str.36, ptr noundef @BWTDecode_create)
  call void @Benchmark_register(ptr noundef @.str.37, ptr noundef @HuffEncode_create)
  call void @Benchmark_register(ptr noundef @.str.38, ptr noundef @HuffDecode_create)
  call void @Benchmark_register(ptr noundef @.str.39, ptr noundef @ArithEncode_create)
  call void @Benchmark_register(ptr noundef @.str.40, ptr noundef @ArithDecode_create)
  call void @Benchmark_register(ptr noundef @.str.41, ptr noundef @LZWEncode_create)
  call void @Benchmark_register(ptr noundef @.str.42, ptr noundef @LZWDecode_create)
  call void @Benchmark_register(ptr noundef @.str.43, ptr noundef @Jaro_create)
  call void @Benchmark_register(ptr noundef @.str.44, ptr noundef @NGram_create)
  call void @Benchmark_register(ptr noundef @.str.45, ptr noundef @Words_create)
  call void @Benchmark_register(ptr noundef @.str.46, ptr noundef @LogParser_create)
  call void @Benchmark_register(ptr noundef @.str.47, ptr noundef @TemplateRegex_create)
  call void @Benchmark_register(ptr noundef @.str.48, ptr noundef @TemplateParse_create)
  call void @Benchmark_register(ptr noundef @.str.49, ptr noundef @CsvParse_create)
  ret void
}

declare void @Benchmark_register(ptr noundef, ptr noundef)

declare ptr @BinarytreesObj_create()

declare ptr @BinarytreesArena_create()

declare ptr @BrainfuckArray_create()

declare ptr @BrainfuckRecursion_create()

declare ptr @Fannkuchredux_create()

declare ptr @Mandelbrot_create()

declare ptr @Matmul_create()

declare ptr @Matmul4T_create()

declare ptr @Matmul8T_create()

declare ptr @Matmul16T_create()

declare ptr @Nbody_create()

declare ptr @Spectralnorm_create()

declare ptr @Base64Encode_create()

declare ptr @Base64Decode_create()

declare ptr @JsonGenerate_create()

declare ptr @JsonParseDom_create()

declare ptr @JsonParseMapping_create()

declare ptr @Sieve_create()

declare ptr @TextRaytracer_create()

declare ptr @NeuralNet_create()

declare ptr @SortQuick_create()

declare ptr @SortMerge_create()

declare ptr @SortSelf_create()

declare ptr @GraphPathBFS_create()

declare ptr @GraphPathDFS_create()

declare ptr @GraphPathAStar_create()

declare ptr @BufferHashSHA256_create()

declare ptr @BufferHashCRC32_create()

declare ptr @CacheSimulation_create()

declare ptr @CalculatorAst_create()

declare ptr @CalculatorInterpreter_create()

declare ptr @GameOfLife_create()

declare ptr @MazeGenerator_create()

declare ptr @MazeBFS_create()

declare ptr @MazeAStar_create()

declare ptr @BWTEncode_create()

declare ptr @BWTDecode_create()

declare ptr @HuffEncode_create()

declare ptr @HuffDecode_create()

declare ptr @ArithEncode_create()

declare ptr @ArithDecode_create()

declare ptr @LZWEncode_create()

declare ptr @LZWDecode_create()

declare ptr @Jaro_create()

declare ptr @NGram_create()

declare ptr @Words_create()

declare ptr @LogParser_create()

declare ptr @TemplateRegex_create()

declare ptr @TemplateParse_create()

declare ptr @CsvParse_create()

define dso_local i32 @main(i32 noundef %0, ptr noundef %1) {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca %struct.timespec, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %10 = call i32 @clock_gettime(i32 noundef 0, ptr noundef %6)
  %11 = getelementptr inbounds nuw %struct.timespec, ptr %6, i32 0, i32 0
  %12 = load i64, ptr %11, align 8
  %13 = mul nsw i64 %12, 1000
  %14 = getelementptr inbounds nuw %struct.timespec, ptr %6, i32 0, i32 1
  %15 = load i64, ptr %14, align 8
  %16 = sdiv i64 %15, 1000000
  %17 = add nsw i64 %13, %16
  %18 = call i32 (ptr, ...) @printf(ptr noundef @.str.50, i64 noundef %17)
  %19 = load i32, ptr %4, align 4
  %20 = icmp sgt i32 %19, 1
  br i1 %20, label %21, label %25

21:                                               ; preds = %2
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds ptr, ptr %22, i64 1
  %24 = load ptr, ptr %23, align 8
  br label %26

25:                                               ; preds = %2
  br label %26

26:                                               ; preds = %25, %21
  %27 = phi ptr [ %24, %21 ], [ @.str.51, %25 ]
  store ptr %27, ptr %7, align 8
  %28 = load ptr, ptr %7, align 8
  call void @Helper_load_config(ptr noundef %28)
  call void @register_all_benchmarks()
  %29 = load i32, ptr %4, align 4
  %30 = icmp sgt i32 %29, 2
  br i1 %30, label %31, label %35

31:                                               ; preds = %26
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds ptr, ptr %32, i64 2
  %34 = load ptr, ptr %33, align 8
  br label %36

35:                                               ; preds = %26
  br label %36

36:                                               ; preds = %35, %31
  %37 = phi ptr [ %34, %31 ], [ null, %35 ]
  store ptr %37, ptr %8, align 8
  %38 = load ptr, ptr %8, align 8
  call void @Benchmark_all(ptr noundef %38)
  call void @Helper_free_config()
  %39 = load ptr, ptr @benchmark_factories, align 8
  %40 = icmp ne ptr %39, null
  br i1 %40, label %41, label %43

41:                                               ; preds = %36
  %42 = load ptr, ptr @benchmark_factories, align 8
  call void @free(ptr noundef %42)
  store ptr null, ptr @benchmark_factories, align 8
  store i64 0, ptr @benchmark_factories_count, align 8
  store i64 0, ptr @benchmark_factories_capacity, align 8
  br label %43

43:                                               ; preds = %41, %36
  %44 = call noalias ptr @fopen(ptr noundef @.str.52, ptr noundef @.str.53)
  store ptr %44, ptr %9, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = icmp ne ptr %45, null
  br i1 %46, label %47, label %52

47:                                               ; preds = %43
  %48 = load ptr, ptr %9, align 8
  %49 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %48, ptr noundef @.str.54)
  %50 = load ptr, ptr %9, align 8
  %51 = call i32 @fclose(ptr noundef %50)
  br label %52

52:                                               ; preds = %47, %43
  ret i32 0
}

declare i32 @clock_gettime(i32 noundef, ptr noundef)

declare i32 @printf(ptr noundef, ...)

declare void @Helper_load_config(ptr noundef)

declare void @Benchmark_all(ptr noundef)

declare void @Helper_free_config()

declare void @free(ptr noundef)

declare noalias ptr @fopen(ptr noundef, ptr noundef)

declare i32 @fprintf(ptr noundef, ptr noundef, ...)

declare i32 @fclose(ptr noundef)


!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
