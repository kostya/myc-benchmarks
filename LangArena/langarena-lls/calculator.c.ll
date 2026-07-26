; ModuleID = 'c/src/calculator.c'
source_filename = "c/src/calculator.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.CalculatorAstData = type { ptr, i64, i64, i32, ptr, i64 }
%struct.CalculatorAstParser = type { ptr, i64, i8 }
%struct.AST_Node = type { i32, %union.anon }
%union.anon = type { i64 }
%struct.AST_Assignment = type { ptr, ptr }
%struct.AST_BinaryOp = type { i8, ptr, ptr }
%struct.CalculatorInterpreterData = type { %struct.CalculatorAstData, i32 }
%struct.CalculatorInterpreterContext = type { ptr }
%struct.VariableEntry = type { ptr, i64, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [11 x i8] c"operations\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Calculator::Ast\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Calculator::Interpreter\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"v0 = 1\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"v%d = v%d + %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [13 x i8] c"v%d = v%d + \00", align 1
@.str.6 = private unnamed_addr constant [76 x i8] c"(v%d / 3) * 4 - %ld / (3 + (18 - v%d)) %% v%d + 2 * ((9 - v%d) * (v%d + 7))\00", align 1
@.str.7 = private unnamed_addr constant [38 x i8] c"v%d + (v%d + v%d) * v%d - (v%d / v%d)\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"(3789 - (((v%d)))) + 1\00", align 1
@.str.9 = private unnamed_addr constant [22 x i8] c"4/2 * (1-3) + v%d/v%d\00", align 1
@.str.10 = private unnamed_addr constant [16 x i8] c"1+2+3+4+5+6+v%d\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"(99999 / v%d)\00", align 1
@.str.12 = private unnamed_addr constant [12 x i8] c"0 + 0 - v%d\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"((((((((((v%d)))))))))) * 2\00", align 1
@.str.14 = private unnamed_addr constant [18 x i8] c"%ld * (v%d%%6)%%7\00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"(1)/(0-v%d) + (v%d)\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

define dso_local void @CalculatorAst_prepare(ptr noundef %0) {
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
  %12 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %11, i32 0, i32 5
  store i64 %10, ptr %12, align 8
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %13, i32 0, i32 5
  %15 = load i64, ptr %14, align 8
  %16 = icmp sle i64 %15, 0
  br i1 %16, label %17, label %20

17:                                               ; preds = %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %18, i32 0, i32 5
  store i64 1000, ptr %19, align 8
  br label %20

20:                                               ; preds = %17, %1
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %21, i32 0, i32 5
  %23 = load i64, ptr %22, align 8
  %24 = call ptr @calculator_ast_generate_random_program(i64 noundef %23)
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %25, i32 0, i32 4
  store ptr %24, ptr %26, align 8
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %27, i32 0, i32 0
  store ptr null, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %29, i32 0, i32 1
  store i64 0, ptr %30, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %31, i32 0, i32 2
  store i64 0, ptr %32, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %33, i32 0, i32 3
  store i32 0, ptr %34, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal ptr @calculator_ast_generate_random_program(i64 noundef %0) {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i64 %0, ptr %2, align 8
  %9 = load i64, ptr %2, align 8
  %10 = mul nsw i64 %9, 100
  store i64 %10, ptr %3, align 8
  %11 = load i64, ptr %3, align 8
  %12 = call noalias ptr @malloc(i64 noundef %11)
  store ptr %12, ptr %4, align 8
  store i64 0, ptr %5, align 8
  %13 = load ptr, ptr %4, align 8
  %14 = load i64, ptr %5, align 8
  %15 = getelementptr inbounds nuw i8, ptr %13, i64 %14
  %16 = load i64, ptr %3, align 8
  %17 = load i64, ptr %5, align 8
  %18 = sub i64 %16, %17
  %19 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %15, i64 noundef %18, ptr noundef @.str.3)
  %20 = sext i32 %19 to i64
  %21 = load i64, ptr %5, align 8
  %22 = add i64 %21, %20
  store i64 %22, ptr %5, align 8
  store i32 0, ptr %6, align 4
  br label %23

23:                                               ; preds = %42, %1
  %24 = load i32, ptr %6, align 4
  %25 = icmp slt i32 %24, 10
  br i1 %25, label %26, label %45

26:                                               ; preds = %23
  %27 = load ptr, ptr %4, align 8
  %28 = load i64, ptr %5, align 8
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 %28
  %30 = load i64, ptr %3, align 8
  %31 = load i64, ptr %5, align 8
  %32 = sub i64 %30, %31
  %33 = load i32, ptr %6, align 4
  %34 = add nsw i32 %33, 1
  %35 = load i32, ptr %6, align 4
  %36 = load i32, ptr %6, align 4
  %37 = add nsw i32 %36, 1
  %38 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %29, i64 noundef %32, ptr noundef @.str.4, i32 noundef %34, i32 noundef %35, i32 noundef %37)
  %39 = sext i32 %38 to i64
  %40 = load i64, ptr %5, align 8
  %41 = add i64 %40, %39
  store i64 %41, ptr %5, align 8
  br label %42

42:                                               ; preds = %26
  %43 = load i32, ptr %6, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, ptr %6, align 4
  br label %23, !llvm.loop !6

45:                                               ; preds = %23
  store i64 0, ptr %7, align 8
  br label %46

46:                                               ; preds = %233, %45
  %47 = load i64, ptr %7, align 8
  %48 = load i64, ptr %2, align 8
  %49 = icmp slt i64 %47, %48
  br i1 %49, label %50, label %236

50:                                               ; preds = %46
  %51 = load i64, ptr %7, align 8
  %52 = add nsw i64 %51, 10
  %53 = trunc i64 %52 to i32
  store i32 %53, ptr %8, align 4
  %54 = load ptr, ptr %4, align 8
  %55 = load i64, ptr %5, align 8
  %56 = getelementptr inbounds nuw i8, ptr %54, i64 %55
  %57 = load i64, ptr %3, align 8
  %58 = load i64, ptr %5, align 8
  %59 = sub i64 %57, %58
  %60 = load i32, ptr %8, align 4
  %61 = load i32, ptr %8, align 4
  %62 = sub nsw i32 %61, 1
  %63 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %56, i64 noundef %59, ptr noundef @.str.5, i32 noundef %60, i32 noundef %62)
  %64 = sext i32 %63 to i64
  %65 = load i64, ptr %5, align 8
  %66 = add i64 %65, %64
  store i64 %66, ptr %5, align 8
  %67 = call i32 @Helper_next_int(i32 noundef 10)
  switch i32 %67, label %222 [
    i32 0, label %68
    i32 1, label %90
    i32 2, label %113
    i32 3, label %126
    i32 4, label %141
    i32 5, label %154
    i32 6, label %167
    i32 7, label %180
    i32 8, label %193
    i32 9, label %207
  ]

68:                                               ; preds = %50
  %69 = load ptr, ptr %4, align 8
  %70 = load i64, ptr %5, align 8
  %71 = getelementptr inbounds nuw i8, ptr %69, i64 %70
  %72 = load i64, ptr %3, align 8
  %73 = load i64, ptr %5, align 8
  %74 = sub i64 %72, %73
  %75 = load i32, ptr %8, align 4
  %76 = sub nsw i32 %75, 1
  %77 = load i64, ptr %7, align 8
  %78 = load i32, ptr %8, align 4
  %79 = sub nsw i32 %78, 2
  %80 = load i32, ptr %8, align 4
  %81 = sub nsw i32 %80, 3
  %82 = load i32, ptr %8, align 4
  %83 = sub nsw i32 %82, 6
  %84 = load i32, ptr %8, align 4
  %85 = sub nsw i32 %84, 5
  %86 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %71, i64 noundef %74, ptr noundef @.str.6, i32 noundef %76, i64 noundef %77, i32 noundef %79, i32 noundef %81, i32 noundef %83, i32 noundef %85)
  %87 = sext i32 %86 to i64
  %88 = load i64, ptr %5, align 8
  %89 = add i64 %88, %87
  store i64 %89, ptr %5, align 8
  br label %222

90:                                               ; preds = %50
  %91 = load ptr, ptr %4, align 8
  %92 = load i64, ptr %5, align 8
  %93 = getelementptr inbounds nuw i8, ptr %91, i64 %92
  %94 = load i64, ptr %3, align 8
  %95 = load i64, ptr %5, align 8
  %96 = sub i64 %94, %95
  %97 = load i32, ptr %8, align 4
  %98 = sub nsw i32 %97, 1
  %99 = load i32, ptr %8, align 4
  %100 = sub nsw i32 %99, 2
  %101 = load i32, ptr %8, align 4
  %102 = sub nsw i32 %101, 3
  %103 = load i32, ptr %8, align 4
  %104 = sub nsw i32 %103, 4
  %105 = load i32, ptr %8, align 4
  %106 = sub nsw i32 %105, 5
  %107 = load i32, ptr %8, align 4
  %108 = sub nsw i32 %107, 6
  %109 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %93, i64 noundef %96, ptr noundef @.str.7, i32 noundef %98, i32 noundef %100, i32 noundef %102, i32 noundef %104, i32 noundef %106, i32 noundef %108)
  %110 = sext i32 %109 to i64
  %111 = load i64, ptr %5, align 8
  %112 = add i64 %111, %110
  store i64 %112, ptr %5, align 8
  br label %222

113:                                              ; preds = %50
  %114 = load ptr, ptr %4, align 8
  %115 = load i64, ptr %5, align 8
  %116 = getelementptr inbounds nuw i8, ptr %114, i64 %115
  %117 = load i64, ptr %3, align 8
  %118 = load i64, ptr %5, align 8
  %119 = sub i64 %117, %118
  %120 = load i32, ptr %8, align 4
  %121 = sub nsw i32 %120, 7
  %122 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %116, i64 noundef %119, ptr noundef @.str.8, i32 noundef %121)
  %123 = sext i32 %122 to i64
  %124 = load i64, ptr %5, align 8
  %125 = add i64 %124, %123
  store i64 %125, ptr %5, align 8
  br label %222

126:                                              ; preds = %50
  %127 = load ptr, ptr %4, align 8
  %128 = load i64, ptr %5, align 8
  %129 = getelementptr inbounds nuw i8, ptr %127, i64 %128
  %130 = load i64, ptr %3, align 8
  %131 = load i64, ptr %5, align 8
  %132 = sub i64 %130, %131
  %133 = load i32, ptr %8, align 4
  %134 = sub nsw i32 %133, 9
  %135 = load i32, ptr %8, align 4
  %136 = sub nsw i32 %135, 5
  %137 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %129, i64 noundef %132, ptr noundef @.str.9, i32 noundef %134, i32 noundef %136)
  %138 = sext i32 %137 to i64
  %139 = load i64, ptr %5, align 8
  %140 = add i64 %139, %138
  store i64 %140, ptr %5, align 8
  br label %222

141:                                              ; preds = %50
  %142 = load ptr, ptr %4, align 8
  %143 = load i64, ptr %5, align 8
  %144 = getelementptr inbounds nuw i8, ptr %142, i64 %143
  %145 = load i64, ptr %3, align 8
  %146 = load i64, ptr %5, align 8
  %147 = sub i64 %145, %146
  %148 = load i32, ptr %8, align 4
  %149 = sub nsw i32 %148, 1
  %150 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %144, i64 noundef %147, ptr noundef @.str.10, i32 noundef %149)
  %151 = sext i32 %150 to i64
  %152 = load i64, ptr %5, align 8
  %153 = add i64 %152, %151
  store i64 %153, ptr %5, align 8
  br label %222

154:                                              ; preds = %50
  %155 = load ptr, ptr %4, align 8
  %156 = load i64, ptr %5, align 8
  %157 = getelementptr inbounds nuw i8, ptr %155, i64 %156
  %158 = load i64, ptr %3, align 8
  %159 = load i64, ptr %5, align 8
  %160 = sub i64 %158, %159
  %161 = load i32, ptr %8, align 4
  %162 = sub nsw i32 %161, 3
  %163 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %157, i64 noundef %160, ptr noundef @.str.11, i32 noundef %162)
  %164 = sext i32 %163 to i64
  %165 = load i64, ptr %5, align 8
  %166 = add i64 %165, %164
  store i64 %166, ptr %5, align 8
  br label %222

167:                                              ; preds = %50
  %168 = load ptr, ptr %4, align 8
  %169 = load i64, ptr %5, align 8
  %170 = getelementptr inbounds nuw i8, ptr %168, i64 %169
  %171 = load i64, ptr %3, align 8
  %172 = load i64, ptr %5, align 8
  %173 = sub i64 %171, %172
  %174 = load i32, ptr %8, align 4
  %175 = sub nsw i32 %174, 8
  %176 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %170, i64 noundef %173, ptr noundef @.str.12, i32 noundef %175)
  %177 = sext i32 %176 to i64
  %178 = load i64, ptr %5, align 8
  %179 = add i64 %178, %177
  store i64 %179, ptr %5, align 8
  br label %222

180:                                              ; preds = %50
  %181 = load ptr, ptr %4, align 8
  %182 = load i64, ptr %5, align 8
  %183 = getelementptr inbounds nuw i8, ptr %181, i64 %182
  %184 = load i64, ptr %3, align 8
  %185 = load i64, ptr %5, align 8
  %186 = sub i64 %184, %185
  %187 = load i32, ptr %8, align 4
  %188 = sub nsw i32 %187, 6
  %189 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %183, i64 noundef %186, ptr noundef @.str.13, i32 noundef %188)
  %190 = sext i32 %189 to i64
  %191 = load i64, ptr %5, align 8
  %192 = add i64 %191, %190
  store i64 %192, ptr %5, align 8
  br label %222

193:                                              ; preds = %50
  %194 = load ptr, ptr %4, align 8
  %195 = load i64, ptr %5, align 8
  %196 = getelementptr inbounds nuw i8, ptr %194, i64 %195
  %197 = load i64, ptr %3, align 8
  %198 = load i64, ptr %5, align 8
  %199 = sub i64 %197, %198
  %200 = load i64, ptr %7, align 8
  %201 = load i32, ptr %8, align 4
  %202 = sub nsw i32 %201, 1
  %203 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %196, i64 noundef %199, ptr noundef @.str.14, i64 noundef %200, i32 noundef %202)
  %204 = sext i32 %203 to i64
  %205 = load i64, ptr %5, align 8
  %206 = add i64 %205, %204
  store i64 %206, ptr %5, align 8
  br label %222

207:                                              ; preds = %50
  %208 = load ptr, ptr %4, align 8
  %209 = load i64, ptr %5, align 8
  %210 = getelementptr inbounds nuw i8, ptr %208, i64 %209
  %211 = load i64, ptr %3, align 8
  %212 = load i64, ptr %5, align 8
  %213 = sub i64 %211, %212
  %214 = load i32, ptr %8, align 4
  %215 = sub nsw i32 %214, 5
  %216 = load i32, ptr %8, align 4
  %217 = sub nsw i32 %216, 7
  %218 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %210, i64 noundef %213, ptr noundef @.str.15, i32 noundef %215, i32 noundef %217)
  %219 = sext i32 %218 to i64
  %220 = load i64, ptr %5, align 8
  %221 = add i64 %220, %219
  store i64 %221, ptr %5, align 8
  br label %222

222:                                              ; preds = %50, %207, %193, %180, %167, %154, %141, %126, %113, %90, %68
  %223 = load ptr, ptr %4, align 8
  %224 = load i64, ptr %5, align 8
  %225 = getelementptr inbounds nuw i8, ptr %223, i64 %224
  %226 = load i64, ptr %3, align 8
  %227 = load i64, ptr %5, align 8
  %228 = sub i64 %226, %227
  %229 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef %225, i64 noundef %228, ptr noundef @.str.16)
  %230 = sext i32 %229 to i64
  %231 = load i64, ptr %5, align 8
  %232 = add i64 %231, %230
  store i64 %232, ptr %5, align 8
  br label %233

233:                                              ; preds = %222
  %234 = load i64, ptr %7, align 8
  %235 = add nsw i64 %234, 1
  store i64 %235, ptr %7, align 8
  br label %46, !llvm.loop !8

236:                                              ; preds = %46
  %237 = load ptr, ptr %4, align 8
  %238 = load i64, ptr %5, align 8
  %239 = getelementptr inbounds nuw i8, ptr %237, i64 %238
  store i8 0, ptr %239, align 1
  %240 = load ptr, ptr %4, align 8
  ret ptr %240
}

define dso_local void @CalculatorAst_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.CalculatorAstParser, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %11 = load i32, ptr %4, align 4
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 11
  %14 = load ptr, ptr %13, align 8
  store ptr %14, ptr %5, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %15, i32 0, i32 0
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %46

19:                                               ; preds = %2
  store i64 0, ptr %6, align 8
  br label %20

20:                                               ; preds = %33, %19
  %21 = load i64, ptr %6, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %22, i32 0, i32 1
  %24 = load i64, ptr %23, align 8
  %25 = icmp slt i64 %21, %24
  br i1 %25, label %26, label %36

26:                                               ; preds = %20
  %27 = load ptr, ptr %5, align 8
  %28 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %27, i32 0, i32 0
  %29 = load ptr, ptr %28, align 8
  %30 = load i64, ptr %6, align 8
  %31 = getelementptr inbounds ptr, ptr %29, i64 %30
  %32 = load ptr, ptr %31, align 8
  call void @ast_node_free(ptr noundef %32)
  br label %33

33:                                               ; preds = %26
  %34 = load i64, ptr %6, align 8
  %35 = add nsw i64 %34, 1
  store i64 %35, ptr %6, align 8
  br label %20, !llvm.loop !9

36:                                               ; preds = %20
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  call void @free(ptr noundef %39)
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %40, i32 0, i32 0
  store ptr null, ptr %41, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %42, i32 0, i32 1
  store i64 0, ptr %43, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %44, i32 0, i32 2
  store i64 0, ptr %45, align 8
  br label %46

46:                                               ; preds = %36, %2
  %47 = load ptr, ptr %5, align 8
  %48 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %47, i32 0, i32 4
  %49 = load ptr, ptr %48, align 8
  call void @calculator_ast_parser_init(ptr noundef %7, ptr noundef %49)
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %54, label %81

54:                                               ; preds = %46
  store i64 0, ptr %8, align 8
  br label %55

55:                                               ; preds = %68, %54
  %56 = load i64, ptr %8, align 8
  %57 = load ptr, ptr %5, align 8
  %58 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %57, i32 0, i32 1
  %59 = load i64, ptr %58, align 8
  %60 = icmp slt i64 %56, %59
  br i1 %60, label %61, label %71

61:                                               ; preds = %55
  %62 = load ptr, ptr %5, align 8
  %63 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %62, i32 0, i32 0
  %64 = load ptr, ptr %63, align 8
  %65 = load i64, ptr %8, align 8
  %66 = getelementptr inbounds ptr, ptr %64, i64 %65
  %67 = load ptr, ptr %66, align 8
  call void @ast_node_free(ptr noundef %67)
  br label %68

68:                                               ; preds = %61
  %69 = load i64, ptr %8, align 8
  %70 = add nsw i64 %69, 1
  store i64 %70, ptr %8, align 8
  br label %55, !llvm.loop !10

71:                                               ; preds = %55
  %72 = load ptr, ptr %5, align 8
  %73 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %72, i32 0, i32 0
  %74 = load ptr, ptr %73, align 8
  call void @free(ptr noundef %74)
  %75 = load ptr, ptr %5, align 8
  %76 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %75, i32 0, i32 0
  store ptr null, ptr %76, align 8
  %77 = load ptr, ptr %5, align 8
  %78 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %77, i32 0, i32 1
  store i64 0, ptr %78, align 8
  %79 = load ptr, ptr %5, align 8
  %80 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %79, i32 0, i32 2
  store i64 0, ptr %80, align 8
  br label %81

81:                                               ; preds = %71, %46
  %82 = load ptr, ptr %5, align 8
  call void @calculator_ast_parser_parse_all(ptr noundef %7, ptr noundef %82)
  %83 = load ptr, ptr %5, align 8
  %84 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %83, i32 0, i32 1
  %85 = load i64, ptr %84, align 8
  %86 = trunc i64 %85 to i32
  store i32 %86, ptr %9, align 4
  %87 = load ptr, ptr %5, align 8
  %88 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %87, i32 0, i32 1
  %89 = load i64, ptr %88, align 8
  %90 = icmp sgt i64 %89, 0
  br i1 %90, label %91, label %122

91:                                               ; preds = %81
  %92 = load ptr, ptr %5, align 8
  %93 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %92, i32 0, i32 0
  %94 = load ptr, ptr %93, align 8
  %95 = load ptr, ptr %5, align 8
  %96 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %95, i32 0, i32 1
  %97 = load i64, ptr %96, align 8
  %98 = sub nsw i64 %97, 1
  %99 = getelementptr inbounds ptr, ptr %94, i64 %98
  %100 = load ptr, ptr %99, align 8
  %101 = getelementptr inbounds nuw %struct.AST_Node, ptr %100, i32 0, i32 0
  %102 = load i32, ptr %101, align 8
  %103 = icmp eq i32 %102, 3
  br i1 %103, label %104, label %122

104:                                              ; preds = %91
  %105 = load ptr, ptr %5, align 8
  %106 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %105, i32 0, i32 0
  %107 = load ptr, ptr %106, align 8
  %108 = load ptr, ptr %5, align 8
  %109 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %108, i32 0, i32 1
  %110 = load i64, ptr %109, align 8
  %111 = sub nsw i64 %110, 1
  %112 = getelementptr inbounds ptr, ptr %107, i64 %111
  %113 = load ptr, ptr %112, align 8
  store ptr %113, ptr %10, align 8
  %114 = load ptr, ptr %10, align 8
  %115 = getelementptr inbounds nuw %struct.AST_Node, ptr %114, i32 0, i32 1
  %116 = load ptr, ptr %115, align 8
  %117 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %116, i32 0, i32 0
  %118 = load ptr, ptr %117, align 8
  %119 = call i32 @Helper_checksum_string(ptr noundef %118)
  %120 = load i32, ptr %9, align 4
  %121 = add i32 %120, %119
  store i32 %121, ptr %9, align 4
  br label %122

122:                                              ; preds = %104, %91, %81
  %123 = load i32, ptr %9, align 4
  %124 = load ptr, ptr %5, align 8
  %125 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %124, i32 0, i32 3
  %126 = load i32, ptr %125, align 8
  %127 = add i32 %126, %123
  store i32 %127, ptr %125, align 8
  ret void
}

define internal void @ast_node_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = icmp ne ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  br label %57

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.AST_Node, ptr %7, i32 0, i32 0
  %9 = load i32, ptr %8, align 8
  switch i32 %9, label %54 [
    i32 1, label %10
    i32 2, label %14
    i32 3, label %34
  ]

10:                                               ; preds = %6
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.AST_Node, ptr %11, i32 0, i32 1
  %13 = load ptr, ptr %12, align 8
  call void @free(ptr noundef %13)
  br label %55

14:                                               ; preds = %6
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.AST_Node, ptr %15, i32 0, i32 1
  %17 = load ptr, ptr %16, align 8
  %18 = icmp ne ptr %17, null
  br i1 %18, label %19, label %33

19:                                               ; preds = %14
  %20 = load ptr, ptr %2, align 8
  %21 = getelementptr inbounds nuw %struct.AST_Node, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %22, i32 0, i32 1
  %24 = load ptr, ptr %23, align 8
  call void @ast_node_free(ptr noundef %24)
  %25 = load ptr, ptr %2, align 8
  %26 = getelementptr inbounds nuw %struct.AST_Node, ptr %25, i32 0, i32 1
  %27 = load ptr, ptr %26, align 8
  %28 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %27, i32 0, i32 2
  %29 = load ptr, ptr %28, align 8
  call void @ast_node_free(ptr noundef %29)
  %30 = load ptr, ptr %2, align 8
  %31 = getelementptr inbounds nuw %struct.AST_Node, ptr %30, i32 0, i32 1
  %32 = load ptr, ptr %31, align 8
  call void @free(ptr noundef %32)
  br label %33

33:                                               ; preds = %19, %14
  br label %55

34:                                               ; preds = %6
  %35 = load ptr, ptr %2, align 8
  %36 = getelementptr inbounds nuw %struct.AST_Node, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = icmp ne ptr %37, null
  br i1 %38, label %39, label %53

39:                                               ; preds = %34
  %40 = load ptr, ptr %2, align 8
  %41 = getelementptr inbounds nuw %struct.AST_Node, ptr %40, i32 0, i32 1
  %42 = load ptr, ptr %41, align 8
  %43 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  call void @free(ptr noundef %44)
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds nuw %struct.AST_Node, ptr %45, i32 0, i32 1
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %47, i32 0, i32 1
  %49 = load ptr, ptr %48, align 8
  call void @ast_node_free(ptr noundef %49)
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds nuw %struct.AST_Node, ptr %50, i32 0, i32 1
  %52 = load ptr, ptr %51, align 8
  call void @free(ptr noundef %52)
  br label %53

53:                                               ; preds = %39, %34
  br label %55

54:                                               ; preds = %6
  br label %55

55:                                               ; preds = %54, %53, %33, %10
  %56 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %56)
  br label %57

57:                                               ; preds = %55, %5
  ret void
}

declare void @free(ptr noundef)

define internal void @calculator_ast_parser_init(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %6, i32 0, i32 0
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %8, i32 0, i32 1
  store i64 0, ptr %9, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds i8, ptr %10, i64 0
  %12 = load i8, ptr %11, align 1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %13, i32 0, i32 2
  store i8 %12, ptr %14, align 8
  ret void
}

define internal void @calculator_ast_parser_parse_all(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %5 = load ptr, ptr %4, align 8
  %6 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %5, i32 0, i32 1
  store i64 0, ptr %6, align 8
  br label %7

7:                                                ; preds = %52, %2
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %8, i32 0, i32 2
  %10 = load i8, ptr %9, align 8
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %12, label %63

12:                                               ; preds = %7
  %13 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %13)
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %14, i32 0, i32 2
  %16 = load i8, ptr %15, align 8
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %12
  br label %63

19:                                               ; preds = %12
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %20, i32 0, i32 1
  %22 = load i64, ptr %21, align 8
  %23 = load ptr, ptr %4, align 8
  %24 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %23, i32 0, i32 2
  %25 = load i64, ptr %24, align 8
  %26 = icmp sge i64 %22, %25
  br i1 %26, label %27, label %52

27:                                               ; preds = %19
  %28 = load ptr, ptr %4, align 8
  %29 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %28, i32 0, i32 2
  %30 = load i64, ptr %29, align 8
  %31 = icmp ne i64 %30, 0
  br i1 %31, label %32, label %37

32:                                               ; preds = %27
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %33, i32 0, i32 2
  %35 = load i64, ptr %34, align 8
  %36 = mul nsw i64 %35, 2
  br label %38

37:                                               ; preds = %27
  br label %38

38:                                               ; preds = %37, %32
  %39 = phi i64 [ %36, %32 ], [ 16, %37 ]
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %40, i32 0, i32 2
  store i64 %39, ptr %41, align 8
  %42 = load ptr, ptr %4, align 8
  %43 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %42, i32 0, i32 0
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %45, i32 0, i32 2
  %47 = load i64, ptr %46, align 8
  %48 = mul i64 %47, 8
  %49 = call ptr @realloc(ptr noundef %44, i64 noundef %48)
  %50 = load ptr, ptr %4, align 8
  %51 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %50, i32 0, i32 0
  store ptr %49, ptr %51, align 8
  br label %52

52:                                               ; preds = %38, %19
  %53 = load ptr, ptr %3, align 8
  %54 = call ptr @calculator_ast_parser_parse_expression(ptr noundef %53)
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %55, i32 0, i32 0
  %57 = load ptr, ptr %56, align 8
  %58 = load ptr, ptr %4, align 8
  %59 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %58, i32 0, i32 1
  %60 = load i64, ptr %59, align 8
  %61 = add nsw i64 %60, 1
  store i64 %61, ptr %59, align 8
  %62 = getelementptr inbounds ptr, ptr %57, i64 %60
  store ptr %54, ptr %62, align 8
  br label %7, !llvm.loop !11

63:                                               ; preds = %18, %7
  ret void
}

declare i32 @Helper_checksum_string(ptr noundef)

define dso_local i32 @CalculatorAst_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %7, i32 0, i32 3
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @CalculatorAst_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %8, i32 0, i32 4
  %10 = load ptr, ptr %9, align 8
  %11 = icmp ne ptr %10, null
  br i1 %11, label %12, label %18

12:                                               ; preds = %1
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %13, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %15)
  %16 = load ptr, ptr %3, align 8
  %17 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %16, i32 0, i32 4
  store ptr null, ptr %17, align 8
  br label %18

18:                                               ; preds = %12, %1
  %19 = load ptr, ptr %3, align 8
  %20 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %19, i32 0, i32 0
  %21 = load ptr, ptr %20, align 8
  %22 = icmp ne ptr %21, null
  br i1 %22, label %23, label %46

23:                                               ; preds = %18
  store i64 0, ptr %4, align 8
  br label %24

24:                                               ; preds = %37, %23
  %25 = load i64, ptr %4, align 8
  %26 = load ptr, ptr %3, align 8
  %27 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %26, i32 0, i32 1
  %28 = load i64, ptr %27, align 8
  %29 = icmp slt i64 %25, %28
  br i1 %29, label %30, label %40

30:                                               ; preds = %24
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %31, i32 0, i32 0
  %33 = load ptr, ptr %32, align 8
  %34 = load i64, ptr %4, align 8
  %35 = getelementptr inbounds ptr, ptr %33, i64 %34
  %36 = load ptr, ptr %35, align 8
  call void @ast_node_free(ptr noundef %36)
  br label %37

37:                                               ; preds = %30
  %38 = load i64, ptr %4, align 8
  %39 = add nsw i64 %38, 1
  store i64 %39, ptr %4, align 8
  br label %24, !llvm.loop !12

40:                                               ; preds = %24
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %41, i32 0, i32 0
  %43 = load ptr, ptr %42, align 8
  call void @free(ptr noundef %43)
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %44, i32 0, i32 0
  store ptr null, ptr %45, align 8
  br label %46

46:                                               ; preds = %40, %18
  ret void
}

define dso_local ptr @CalculatorAst_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
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
  store ptr @CalculatorAst_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @CalculatorAst_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @CalculatorAst_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @CalculatorAst_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

define dso_local void @CalculatorInterpreter_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.CalculatorAstParser, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  %11 = call i64 @Helper_config_i64(ptr noundef %10, ptr noundef @.str)
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %13, i32 0, i32 5
  store i64 %11, ptr %14, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %15, i32 0, i32 0
  %17 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %16, i32 0, i32 5
  %18 = load i64, ptr %17, align 8
  %19 = icmp sle i64 %18, 0
  br i1 %19, label %20, label %24

20:                                               ; preds = %1
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %22, i32 0, i32 5
  store i64 1000, ptr %23, align 8
  br label %24

24:                                               ; preds = %20, %1
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %25, i32 0, i32 0
  %27 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %26, i32 0, i32 5
  %28 = load i64, ptr %27, align 8
  %29 = call ptr @calculator_ast_generate_random_program(i64 noundef %28)
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %31, i32 0, i32 4
  store ptr %29, ptr %32, align 8
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %33, i32 0, i32 0
  %35 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %34, i32 0, i32 0
  store ptr null, ptr %35, align 8
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %36, i32 0, i32 0
  %38 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %37, i32 0, i32 1
  store i64 0, ptr %38, align 8
  %39 = load ptr, ptr %3, align 8
  %40 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %39, i32 0, i32 0
  %41 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %40, i32 0, i32 2
  store i64 0, ptr %41, align 8
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %42, i32 0, i32 0
  %44 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %43, i32 0, i32 4
  %45 = load ptr, ptr %44, align 8
  call void @calculator_ast_parser_init(ptr noundef %4, ptr noundef %45)
  %46 = load ptr, ptr %3, align 8
  %47 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %46, i32 0, i32 0
  call void @calculator_ast_parser_parse_all(ptr noundef %4, ptr noundef %47)
  %48 = load ptr, ptr %3, align 8
  %49 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %48, i32 0, i32 1
  store i32 0, ptr %49, align 8
  ret void
}

define dso_local void @CalculatorInterpreter_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %9 = load i32, ptr %4, align 4
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 11
  %12 = load ptr, ptr %11, align 8
  store ptr %12, ptr %5, align 8
  %13 = call ptr @calculator_interpreter_context_new()
  store ptr %13, ptr %6, align 8
  store i64 0, ptr %7, align 8
  store i64 0, ptr %8, align 8
  br label %14

14:                                               ; preds = %31, %2
  %15 = load i64, ptr %8, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %16, i32 0, i32 0
  %18 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %17, i32 0, i32 1
  %19 = load i64, ptr %18, align 8
  %20 = icmp slt i64 %15, %19
  br i1 %20, label %21, label %34

21:                                               ; preds = %14
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = load i64, ptr %8, align 8
  %27 = getelementptr inbounds ptr, ptr %25, i64 %26
  %28 = load ptr, ptr %27, align 8
  %29 = load ptr, ptr %6, align 8
  %30 = call i64 @calculator_interpreter_evaluate(ptr noundef %28, ptr noundef %29)
  store i64 %30, ptr %7, align 8
  br label %31

31:                                               ; preds = %21
  %32 = load i64, ptr %8, align 8
  %33 = add nsw i64 %32, 1
  store i64 %33, ptr %8, align 8
  br label %14, !llvm.loop !13

34:                                               ; preds = %14
  %35 = load ptr, ptr %6, align 8
  call void @calculator_interpreter_context_free(ptr noundef %35)
  %36 = load i64, ptr %7, align 8
  %37 = load ptr, ptr %5, align 8
  %38 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %37, i32 0, i32 1
  %39 = load i32, ptr %38, align 8
  %40 = zext i32 %39 to i64
  %41 = add nsw i64 %40, %36
  %42 = trunc i64 %41 to i32
  store i32 %42, ptr %38, align 8
  ret void
}

define internal ptr @calculator_interpreter_context_new() {
  %1 = alloca ptr, align 8
  %2 = call noalias ptr @malloc(i64 noundef 8)
  store ptr %2, ptr %1, align 8
  %3 = load ptr, ptr %1, align 8
  %4 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %3, i32 0, i32 0
  store ptr null, ptr %4, align 8
  %5 = load ptr, ptr %1, align 8
  ret ptr %5
}

define internal i64 @calculator_interpreter_evaluate(ptr noundef %0, ptr noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = getelementptr inbounds nuw %struct.AST_Node, ptr %12, i32 0, i32 0
  %14 = load i32, ptr %13, align 8
  switch i32 %14, label %87 [
    i32 0, label %15
    i32 1, label %19
    i32 2, label %33
    i32 3, label %72
  ]

15:                                               ; preds = %2
  %16 = load ptr, ptr %4, align 8
  %17 = getelementptr inbounds nuw %struct.AST_Node, ptr %16, i32 0, i32 1
  %18 = load i64, ptr %17, align 8
  store i64 %18, ptr %3, align 8
  br label %88

19:                                               ; preds = %2
  %20 = load ptr, ptr %5, align 8
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.AST_Node, ptr %21, i32 0, i32 1
  %23 = load ptr, ptr %22, align 8
  %24 = call ptr @calculator_interpreter_context_get(ptr noundef %20, ptr noundef %23)
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %30

27:                                               ; preds = %19
  %28 = load ptr, ptr %6, align 8
  %29 = load i64, ptr %28, align 8
  br label %31

30:                                               ; preds = %19
  br label %31

31:                                               ; preds = %30, %27
  %32 = phi i64 [ %29, %27 ], [ 0, %30 ]
  store i64 %32, ptr %3, align 8
  br label %88

33:                                               ; preds = %2
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.AST_Node, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  store ptr %36, ptr %7, align 8
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %37, i32 0, i32 1
  %39 = load ptr, ptr %38, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = call i64 @calculator_interpreter_evaluate(ptr noundef %39, ptr noundef %40)
  store i64 %41, ptr %8, align 8
  %42 = load ptr, ptr %7, align 8
  %43 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %42, i32 0, i32 2
  %44 = load ptr, ptr %43, align 8
  %45 = load ptr, ptr %5, align 8
  %46 = call i64 @calculator_interpreter_evaluate(ptr noundef %44, ptr noundef %45)
  store i64 %46, ptr %9, align 8
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %47, i32 0, i32 0
  %49 = load i8, ptr %48, align 8
  %50 = sext i8 %49 to i32
  switch i32 %50, label %71 [
    i32 43, label %51
    i32 45, label %55
    i32 42, label %59
    i32 47, label %63
    i32 37, label %67
  ]

51:                                               ; preds = %33
  %52 = load i64, ptr %8, align 8
  %53 = load i64, ptr %9, align 8
  %54 = add nsw i64 %52, %53
  store i64 %54, ptr %3, align 8
  br label %88

55:                                               ; preds = %33
  %56 = load i64, ptr %8, align 8
  %57 = load i64, ptr %9, align 8
  %58 = sub nsw i64 %56, %57
  store i64 %58, ptr %3, align 8
  br label %88

59:                                               ; preds = %33
  %60 = load i64, ptr %8, align 8
  %61 = load i64, ptr %9, align 8
  %62 = mul nsw i64 %60, %61
  store i64 %62, ptr %3, align 8
  br label %88

63:                                               ; preds = %33
  %64 = load i64, ptr %8, align 8
  %65 = load i64, ptr %9, align 8
  %66 = call i64 @calculator_interpreter_simple_div(i64 noundef %64, i64 noundef %65)
  store i64 %66, ptr %3, align 8
  br label %88

67:                                               ; preds = %33
  %68 = load i64, ptr %8, align 8
  %69 = load i64, ptr %9, align 8
  %70 = call i64 @calculator_interpreter_simple_mod(i64 noundef %68, i64 noundef %69)
  store i64 %70, ptr %3, align 8
  br label %88

71:                                               ; preds = %33
  store i64 0, ptr %3, align 8
  br label %88

72:                                               ; preds = %2
  %73 = load ptr, ptr %4, align 8
  %74 = getelementptr inbounds nuw %struct.AST_Node, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  store ptr %75, ptr %10, align 8
  %76 = load ptr, ptr %10, align 8
  %77 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %76, i32 0, i32 1
  %78 = load ptr, ptr %77, align 8
  %79 = load ptr, ptr %5, align 8
  %80 = call i64 @calculator_interpreter_evaluate(ptr noundef %78, ptr noundef %79)
  store i64 %80, ptr %11, align 8
  %81 = load ptr, ptr %5, align 8
  %82 = load ptr, ptr %10, align 8
  %83 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %82, i32 0, i32 0
  %84 = load ptr, ptr %83, align 8
  %85 = load i64, ptr %11, align 8
  call void @calculator_interpreter_context_set(ptr noundef %81, ptr noundef %84, i64 noundef %85)
  %86 = load i64, ptr %11, align 8
  store i64 %86, ptr %3, align 8
  br label %88

87:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %88

88:                                               ; preds = %87, %72, %71, %67, %63, %59, %55, %51, %31, %15
  %89 = load i64, ptr %3, align 8
  ret i64 %89
}

define internal void @calculator_interpreter_context_free(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %8, i32 0, i32 0
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %3, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %11, i32 0, i32 0
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %22

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %16, i32 0, i32 0
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.VariableEntry, ptr %18, i32 0, i32 2
  %20 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %19, i32 0, i32 2
  %21 = load ptr, ptr %20, align 8
  br label %23

22:                                               ; preds = %1
  br label %23

23:                                               ; preds = %22, %15
  %24 = phi ptr [ %21, %15 ], [ null, %22 ]
  store ptr %24, ptr %4, align 8
  br label %25

25:                                               ; preds = %237, %23
  %26 = load ptr, ptr %3, align 8
  %27 = icmp ne ptr %26, null
  br i1 %27, label %28, label %239

28:                                               ; preds = %25
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.VariableEntry, ptr %29, i32 0, i32 0
  %31 = load ptr, ptr %30, align 8
  call void @free(ptr noundef %31)
  br label %32

32:                                               ; preds = %28
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.VariableEntry, ptr %33, i32 0, i32 2
  store ptr %34, ptr %5, align 8
  %35 = load ptr, ptr %5, align 8
  %36 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %35, i32 0, i32 1
  %37 = load ptr, ptr %36, align 8
  %38 = icmp eq ptr %37, null
  br i1 %38, label %39, label %61

39:                                               ; preds = %32
  %40 = load ptr, ptr %5, align 8
  %41 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %40, i32 0, i32 2
  %42 = load ptr, ptr %41, align 8
  %43 = icmp eq ptr %42, null
  br i1 %43, label %44, label %61

44:                                               ; preds = %39
  %45 = load ptr, ptr %2, align 8
  %46 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.VariableEntry, ptr %47, i32 0, i32 2
  %49 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  %51 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %50, i32 0, i32 0
  %52 = load ptr, ptr %51, align 8
  call void @free(ptr noundef %52)
  %53 = load ptr, ptr %2, align 8
  %54 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  %56 = getelementptr inbounds nuw %struct.VariableEntry, ptr %55, i32 0, i32 2
  %57 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %56, i32 0, i32 0
  %58 = load ptr, ptr %57, align 8
  call void @free(ptr noundef %58)
  %59 = load ptr, ptr %2, align 8
  %60 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %59, i32 0, i32 0
  store ptr null, ptr %60, align 8
  br label %224

61:                                               ; preds = %39, %32
  %62 = load ptr, ptr %5, align 8
  %63 = load ptr, ptr %2, align 8
  %64 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %63, i32 0, i32 0
  %65 = load ptr, ptr %64, align 8
  %66 = getelementptr inbounds nuw %struct.VariableEntry, ptr %65, i32 0, i32 2
  %67 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %66, i32 0, i32 0
  %68 = load ptr, ptr %67, align 8
  %69 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %68, i32 0, i32 4
  %70 = load ptr, ptr %69, align 8
  %71 = icmp eq ptr %62, %70
  br i1 %71, label %72, label %92

72:                                               ; preds = %61
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %73, i32 0, i32 1
  %75 = load ptr, ptr %74, align 8
  %76 = load ptr, ptr %2, align 8
  %77 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds nuw %struct.VariableEntry, ptr %78, i32 0, i32 2
  %80 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %79, i32 0, i32 0
  %81 = load ptr, ptr %80, align 8
  %82 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %81, i32 0, i32 5
  %83 = load i64, ptr %82, align 8
  %84 = getelementptr inbounds i8, ptr %75, i64 %83
  %85 = load ptr, ptr %2, align 8
  %86 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %85, i32 0, i32 0
  %87 = load ptr, ptr %86, align 8
  %88 = getelementptr inbounds nuw %struct.VariableEntry, ptr %87, i32 0, i32 2
  %89 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %88, i32 0, i32 0
  %90 = load ptr, ptr %89, align 8
  %91 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %90, i32 0, i32 4
  store ptr %84, ptr %91, align 8
  br label %92

92:                                               ; preds = %72, %61
  %93 = load ptr, ptr %5, align 8
  %94 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %93, i32 0, i32 1
  %95 = load ptr, ptr %94, align 8
  %96 = icmp ne ptr %95, null
  br i1 %96, label %97, label %114

97:                                               ; preds = %92
  %98 = load ptr, ptr %5, align 8
  %99 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %98, i32 0, i32 2
  %100 = load ptr, ptr %99, align 8
  %101 = load ptr, ptr %5, align 8
  %102 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %101, i32 0, i32 1
  %103 = load ptr, ptr %102, align 8
  %104 = load ptr, ptr %2, align 8
  %105 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %104, i32 0, i32 0
  %106 = load ptr, ptr %105, align 8
  %107 = getelementptr inbounds nuw %struct.VariableEntry, ptr %106, i32 0, i32 2
  %108 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %107, i32 0, i32 0
  %109 = load ptr, ptr %108, align 8
  %110 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %109, i32 0, i32 5
  %111 = load i64, ptr %110, align 8
  %112 = getelementptr inbounds i8, ptr %103, i64 %111
  %113 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %112, i32 0, i32 2
  store ptr %100, ptr %113, align 8
  br label %122

114:                                              ; preds = %92
  br label %115

115:                                              ; preds = %114
  %116 = load ptr, ptr %5, align 8
  %117 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %116, i32 0, i32 2
  %118 = load ptr, ptr %117, align 8
  %119 = load ptr, ptr %2, align 8
  %120 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %119, i32 0, i32 0
  store ptr %118, ptr %120, align 8
  br label %121

121:                                              ; preds = %115
  br label %122

122:                                              ; preds = %121, %97
  %123 = load ptr, ptr %5, align 8
  %124 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %123, i32 0, i32 2
  %125 = load ptr, ptr %124, align 8
  %126 = icmp ne ptr %125, null
  br i1 %126, label %127, label %144

127:                                              ; preds = %122
  %128 = load ptr, ptr %5, align 8
  %129 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %128, i32 0, i32 1
  %130 = load ptr, ptr %129, align 8
  %131 = load ptr, ptr %5, align 8
  %132 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %131, i32 0, i32 2
  %133 = load ptr, ptr %132, align 8
  %134 = load ptr, ptr %2, align 8
  %135 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %134, i32 0, i32 0
  %136 = load ptr, ptr %135, align 8
  %137 = getelementptr inbounds nuw %struct.VariableEntry, ptr %136, i32 0, i32 2
  %138 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %137, i32 0, i32 0
  %139 = load ptr, ptr %138, align 8
  %140 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %139, i32 0, i32 5
  %141 = load i64, ptr %140, align 8
  %142 = getelementptr inbounds i8, ptr %133, i64 %141
  %143 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %142, i32 0, i32 1
  store ptr %130, ptr %143, align 8
  br label %144

144:                                              ; preds = %127, %122
  br label %145

145:                                              ; preds = %144
  %146 = load ptr, ptr %5, align 8
  %147 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %146, i32 0, i32 7
  %148 = load i32, ptr %147, align 4
  %149 = load ptr, ptr %2, align 8
  %150 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %149, i32 0, i32 0
  %151 = load ptr, ptr %150, align 8
  %152 = getelementptr inbounds nuw %struct.VariableEntry, ptr %151, i32 0, i32 2
  %153 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %152, i32 0, i32 0
  %154 = load ptr, ptr %153, align 8
  %155 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %154, i32 0, i32 1
  %156 = load i32, ptr %155, align 8
  %157 = sub i32 %156, 1
  %158 = and i32 %148, %157
  store i32 %158, ptr %6, align 4
  br label %159

159:                                              ; preds = %145
  br label %160

160:                                              ; preds = %159
  %161 = load ptr, ptr %2, align 8
  %162 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %161, i32 0, i32 0
  %163 = load ptr, ptr %162, align 8
  %164 = getelementptr inbounds nuw %struct.VariableEntry, ptr %163, i32 0, i32 2
  %165 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %164, i32 0, i32 0
  %166 = load ptr, ptr %165, align 8
  %167 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %166, i32 0, i32 0
  %168 = load ptr, ptr %167, align 8
  %169 = load i32, ptr %6, align 4
  %170 = zext i32 %169 to i64
  %171 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %168, i64 %170
  store ptr %171, ptr %7, align 8
  %172 = load ptr, ptr %7, align 8
  %173 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %172, i32 0, i32 1
  %174 = load i32, ptr %173, align 8
  %175 = add i32 %174, -1
  store i32 %175, ptr %173, align 8
  %176 = load ptr, ptr %7, align 8
  %177 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %176, i32 0, i32 0
  %178 = load ptr, ptr %177, align 8
  %179 = load ptr, ptr %5, align 8
  %180 = icmp eq ptr %178, %179
  br i1 %180, label %181, label %187

181:                                              ; preds = %160
  %182 = load ptr, ptr %5, align 8
  %183 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %182, i32 0, i32 4
  %184 = load ptr, ptr %183, align 8
  %185 = load ptr, ptr %7, align 8
  %186 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %185, i32 0, i32 0
  store ptr %184, ptr %186, align 8
  br label %187

187:                                              ; preds = %181, %160
  %188 = load ptr, ptr %5, align 8
  %189 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %188, i32 0, i32 3
  %190 = load ptr, ptr %189, align 8
  %191 = icmp ne ptr %190, null
  br i1 %191, label %192, label %200

192:                                              ; preds = %187
  %193 = load ptr, ptr %5, align 8
  %194 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %193, i32 0, i32 4
  %195 = load ptr, ptr %194, align 8
  %196 = load ptr, ptr %5, align 8
  %197 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %196, i32 0, i32 3
  %198 = load ptr, ptr %197, align 8
  %199 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %198, i32 0, i32 4
  store ptr %195, ptr %199, align 8
  br label %200

200:                                              ; preds = %192, %187
  %201 = load ptr, ptr %5, align 8
  %202 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %201, i32 0, i32 4
  %203 = load ptr, ptr %202, align 8
  %204 = icmp ne ptr %203, null
  br i1 %204, label %205, label %213

205:                                              ; preds = %200
  %206 = load ptr, ptr %5, align 8
  %207 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %206, i32 0, i32 3
  %208 = load ptr, ptr %207, align 8
  %209 = load ptr, ptr %5, align 8
  %210 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %209, i32 0, i32 4
  %211 = load ptr, ptr %210, align 8
  %212 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %211, i32 0, i32 3
  store ptr %208, ptr %212, align 8
  br label %213

213:                                              ; preds = %205, %200
  br label %214

214:                                              ; preds = %213
  %215 = load ptr, ptr %2, align 8
  %216 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %215, i32 0, i32 0
  %217 = load ptr, ptr %216, align 8
  %218 = getelementptr inbounds nuw %struct.VariableEntry, ptr %217, i32 0, i32 2
  %219 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %218, i32 0, i32 0
  %220 = load ptr, ptr %219, align 8
  %221 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %220, i32 0, i32 3
  %222 = load i32, ptr %221, align 8
  %223 = add i32 %222, -1
  store i32 %223, ptr %221, align 8
  br label %224

224:                                              ; preds = %214, %44
  br label %225

225:                                              ; preds = %224
  %226 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %226)
  br label %227

227:                                              ; preds = %225
  %228 = load ptr, ptr %4, align 8
  store ptr %228, ptr %3, align 8
  %229 = load ptr, ptr %4, align 8
  %230 = icmp ne ptr %229, null
  br i1 %230, label %231, label %236

231:                                              ; preds = %227
  %232 = load ptr, ptr %4, align 8
  %233 = getelementptr inbounds nuw %struct.VariableEntry, ptr %232, i32 0, i32 2
  %234 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %233, i32 0, i32 2
  %235 = load ptr, ptr %234, align 8
  br label %237

236:                                              ; preds = %227
  br label %237

237:                                              ; preds = %236, %231
  %238 = phi ptr [ %235, %231 ], [ null, %236 ]
  store ptr %238, ptr %4, align 8
  br label %25, !llvm.loop !14

239:                                              ; preds = %25
  %240 = load ptr, ptr %2, align 8
  call void @free(ptr noundef %240)
  ret void
}

define dso_local i32 @CalculatorInterpreter_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %7, i32 0, i32 1
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @CalculatorInterpreter_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %8, i32 0, i32 0
  %10 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %9, i32 0, i32 4
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %21

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %15, i32 0, i32 4
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %18, i32 0, i32 0
  %20 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %19, i32 0, i32 4
  store ptr null, ptr %20, align 8
  br label %21

21:                                               ; preds = %13, %1
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %22, i32 0, i32 0
  %24 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %23, i32 0, i32 0
  %25 = load ptr, ptr %24, align 8
  %26 = icmp ne ptr %25, null
  br i1 %26, label %27, label %54

27:                                               ; preds = %21
  store i64 0, ptr %4, align 8
  br label %28

28:                                               ; preds = %43, %27
  %29 = load i64, ptr %4, align 8
  %30 = load ptr, ptr %3, align 8
  %31 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %30, i32 0, i32 0
  %32 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %31, i32 0, i32 1
  %33 = load i64, ptr %32, align 8
  %34 = icmp slt i64 %29, %33
  br i1 %34, label %35, label %46

35:                                               ; preds = %28
  %36 = load ptr, ptr %3, align 8
  %37 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %36, i32 0, i32 0
  %38 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %37, i32 0, i32 0
  %39 = load ptr, ptr %38, align 8
  %40 = load i64, ptr %4, align 8
  %41 = getelementptr inbounds ptr, ptr %39, i64 %40
  %42 = load ptr, ptr %41, align 8
  call void @ast_node_free(ptr noundef %42)
  br label %43

43:                                               ; preds = %35
  %44 = load i64, ptr %4, align 8
  %45 = add nsw i64 %44, 1
  store i64 %45, ptr %4, align 8
  br label %28, !llvm.loop !15

46:                                               ; preds = %28
  %47 = load ptr, ptr %3, align 8
  %48 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %47, i32 0, i32 0
  %49 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %48, i32 0, i32 0
  %50 = load ptr, ptr %49, align 8
  call void @free(ptr noundef %50)
  %51 = load ptr, ptr %3, align 8
  %52 = getelementptr inbounds nuw %struct.CalculatorInterpreterData, ptr %51, i32 0, i32 0
  %53 = getelementptr inbounds nuw %struct.CalculatorAstData, ptr %52, i32 0, i32 0
  store ptr null, ptr %53, align 8
  br label %54

54:                                               ; preds = %46, %21
  ret void
}

define dso_local ptr @CalculatorInterpreter_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @malloc(i64 noundef 56)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 56, i1 false)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @CalculatorInterpreter_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @CalculatorInterpreter_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @CalculatorInterpreter_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @CalculatorInterpreter_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...)

declare i32 @Helper_next_int(i32 noundef)

define internal void @calculator_ast_parser_skip_whitespace(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %3

3:                                                ; preds = %24, %1
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %4, i32 0, i32 2
  %6 = load i8, ptr %5, align 8
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %22

9:                                                ; preds = %3
  %10 = call ptr @__ctype_b_loc()
  %11 = load ptr, ptr %10, align 8
  %12 = load ptr, ptr %2, align 8
  %13 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %12, i32 0, i32 2
  %14 = load i8, ptr %13, align 8
  %15 = zext i8 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i16, ptr %11, i64 %16
  %18 = load i16, ptr %17, align 2
  %19 = zext i16 %18 to i32
  %20 = and i32 %19, 8192
  %21 = icmp ne i32 %20, 0
  br label %22

22:                                               ; preds = %9, %3
  %23 = phi i1 [ false, %3 ], [ %21, %9 ]
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_advance(ptr noundef %25)
  br label %3, !llvm.loop !16

26:                                               ; preds = %22
  ret void
}

declare ptr @realloc(ptr noundef, i64 noundef)

define internal ptr @calculator_ast_parser_parse_expression(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call ptr @calculator_ast_parser_parse_term(ptr noundef %6)
  store ptr %7, ptr %3, align 8
  br label %8

8:                                                ; preds = %1, %39
  %9 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %10, i32 0, i32 2
  %12 = load i8, ptr %11, align 8
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %15, label %14

14:                                               ; preds = %8
  br label %40

15:                                               ; preds = %8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %16, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 43
  br i1 %20, label %27, label %21

21:                                               ; preds = %15
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %22, i32 0, i32 2
  %24 = load i8, ptr %23, align 8
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 45
  br i1 %26, label %27, label %38

27:                                               ; preds = %21, %15
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %28, i32 0, i32 2
  %30 = load i8, ptr %29, align 8
  store i8 %30, ptr %4, align 1
  %31 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_advance(ptr noundef %31)
  %32 = load ptr, ptr %2, align 8
  %33 = call ptr @calculator_ast_parser_parse_term(ptr noundef %32)
  store ptr %33, ptr %5, align 8
  %34 = load i8, ptr %4, align 1
  %35 = load ptr, ptr %3, align 8
  %36 = load ptr, ptr %5, align 8
  %37 = call ptr @ast_node_new_binary_op(i8 noundef signext %34, ptr noundef %35, ptr noundef %36)
  store ptr %37, ptr %3, align 8
  br label %39

38:                                               ; preds = %21
  br label %40

39:                                               ; preds = %27
  br label %8

40:                                               ; preds = %38, %14
  %41 = load ptr, ptr %3, align 8
  ret ptr %41
}

declare ptr @__ctype_b_loc()

define internal void @calculator_ast_parser_advance(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %3, i32 0, i32 1
  %5 = load i64, ptr %4, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr %4, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %7, i32 0, i32 0
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  %13 = getelementptr inbounds nuw i8, ptr %9, i64 %12
  %14 = load i8, ptr %13, align 1
  %15 = load ptr, ptr %2, align 8
  %16 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %15, i32 0, i32 2
  store i8 %14, ptr %16, align 8
  ret void
}

define internal ptr @calculator_ast_parser_parse_term(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = call ptr @calculator_ast_parser_parse_factor(ptr noundef %6)
  store ptr %7, ptr %3, align 8
  br label %8

8:                                                ; preds = %1, %45
  %9 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %9)
  %10 = load ptr, ptr %2, align 8
  %11 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %10, i32 0, i32 2
  %12 = load i8, ptr %11, align 8
  %13 = icmp ne i8 %12, 0
  br i1 %13, label %15, label %14

14:                                               ; preds = %8
  br label %46

15:                                               ; preds = %8
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %16, i32 0, i32 2
  %18 = load i8, ptr %17, align 8
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 42
  br i1 %20, label %33, label %21

21:                                               ; preds = %15
  %22 = load ptr, ptr %2, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %22, i32 0, i32 2
  %24 = load i8, ptr %23, align 8
  %25 = sext i8 %24 to i32
  %26 = icmp eq i32 %25, 47
  br i1 %26, label %33, label %27

27:                                               ; preds = %21
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %28, i32 0, i32 2
  %30 = load i8, ptr %29, align 8
  %31 = sext i8 %30 to i32
  %32 = icmp eq i32 %31, 37
  br i1 %32, label %33, label %44

33:                                               ; preds = %27, %21, %15
  %34 = load ptr, ptr %2, align 8
  %35 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %34, i32 0, i32 2
  %36 = load i8, ptr %35, align 8
  store i8 %36, ptr %4, align 1
  %37 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_advance(ptr noundef %37)
  %38 = load ptr, ptr %2, align 8
  %39 = call ptr @calculator_ast_parser_parse_factor(ptr noundef %38)
  store ptr %39, ptr %5, align 8
  %40 = load i8, ptr %4, align 1
  %41 = load ptr, ptr %3, align 8
  %42 = load ptr, ptr %5, align 8
  %43 = call ptr @ast_node_new_binary_op(i8 noundef signext %40, ptr noundef %41, ptr noundef %42)
  store ptr %43, ptr %3, align 8
  br label %45

44:                                               ; preds = %27
  br label %46

45:                                               ; preds = %33
  br label %8

46:                                               ; preds = %44, %14
  %47 = load ptr, ptr %3, align 8
  ret ptr %47
}

define internal ptr @ast_node_new_binary_op(i8 noundef signext %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca i8, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store i8 %0, ptr %4, align 1
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %9 = call noalias ptr @malloc(i64 noundef 24)
  store ptr %9, ptr %7, align 8
  %10 = load i8, ptr %4, align 1
  %11 = load ptr, ptr %7, align 8
  %12 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %11, i32 0, i32 0
  store i8 %10, ptr %12, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = load ptr, ptr %7, align 8
  %15 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %14, i32 0, i32 1
  store ptr %13, ptr %15, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds nuw %struct.AST_BinaryOp, ptr %17, i32 0, i32 2
  store ptr %16, ptr %18, align 8
  %19 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %19, ptr %8, align 8
  %20 = load ptr, ptr %8, align 8
  %21 = getelementptr inbounds nuw %struct.AST_Node, ptr %20, i32 0, i32 0
  store i32 2, ptr %21, align 8
  %22 = load ptr, ptr %7, align 8
  %23 = load ptr, ptr %8, align 8
  %24 = getelementptr inbounds nuw %struct.AST_Node, ptr %23, i32 0, i32 1
  store ptr %22, ptr %24, align 8
  %25 = load ptr, ptr %8, align 8
  ret ptr %25
}

define internal ptr @calculator_ast_parser_parse_factor(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %5)
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %6, i32 0, i32 2
  %8 = load i8, ptr %7, align 8
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %1
  %11 = call ptr @ast_node_new_number(i64 noundef 0)
  store ptr %11, ptr %2, align 8
  br label %66

12:                                               ; preds = %1
  %13 = call ptr @__ctype_b_loc()
  %14 = load ptr, ptr %13, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %15, i32 0, i32 2
  %17 = load i8, ptr %16, align 8
  %18 = zext i8 %17 to i32
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i16, ptr %14, i64 %19
  %21 = load i16, ptr %20, align 2
  %22 = zext i16 %21 to i32
  %23 = and i32 %22, 2048
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

25:                                               ; preds = %12
  %26 = load ptr, ptr %3, align 8
  %27 = call ptr @calculator_ast_parser_parse_number(ptr noundef %26)
  store ptr %27, ptr %2, align 8
  br label %66

28:                                               ; preds = %12
  %29 = call ptr @__ctype_b_loc()
  %30 = load ptr, ptr %29, align 8
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %31, i32 0, i32 2
  %33 = load i8, ptr %32, align 8
  %34 = zext i8 %33 to i32
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i16, ptr %30, i64 %35
  %37 = load i16, ptr %36, align 2
  %38 = zext i16 %37 to i32
  %39 = and i32 %38, 1024
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %44

41:                                               ; preds = %28
  %42 = load ptr, ptr %3, align 8
  %43 = call ptr @calculator_ast_parser_parse_variable(ptr noundef %42)
  store ptr %43, ptr %2, align 8
  br label %66

44:                                               ; preds = %28
  %45 = load ptr, ptr %3, align 8
  %46 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %45, i32 0, i32 2
  %47 = load i8, ptr %46, align 8
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %48, 40
  br i1 %49, label %50, label %64

50:                                               ; preds = %44
  %51 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_advance(ptr noundef %51)
  %52 = load ptr, ptr %3, align 8
  %53 = call ptr @calculator_ast_parser_parse_expression(ptr noundef %52)
  store ptr %53, ptr %4, align 8
  %54 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %54)
  %55 = load ptr, ptr %3, align 8
  %56 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %55, i32 0, i32 2
  %57 = load i8, ptr %56, align 8
  %58 = sext i8 %57 to i32
  %59 = icmp eq i32 %58, 41
  br i1 %59, label %60, label %62

60:                                               ; preds = %50
  %61 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_advance(ptr noundef %61)
  br label %62

62:                                               ; preds = %60, %50
  %63 = load ptr, ptr %4, align 8
  store ptr %63, ptr %2, align 8
  br label %66

64:                                               ; preds = %44
  %65 = call ptr @ast_node_new_number(i64 noundef 0)
  store ptr %65, ptr %2, align 8
  br label %66

66:                                               ; preds = %64, %62, %41, %25, %10
  %67 = load ptr, ptr %2, align 8
  ret ptr %67
}

define internal ptr @ast_node_new_number(i64 noundef %0) {
  %2 = alloca i64, align 8
  %3 = alloca ptr, align 8
  store i64 %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.AST_Node, ptr %5, i32 0, i32 0
  store i32 0, ptr %6, align 8
  %7 = load i64, ptr %2, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.AST_Node, ptr %8, i32 0, i32 1
  store i64 %7, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

define internal ptr @calculator_ast_parser_parse_number(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %4

4:                                                ; preds = %25, %1
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %5, i32 0, i32 2
  %7 = load i8, ptr %6, align 8
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %23

10:                                               ; preds = %4
  %11 = call ptr @__ctype_b_loc()
  %12 = load ptr, ptr %11, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %13, i32 0, i32 2
  %15 = load i8, ptr %14, align 8
  %16 = zext i8 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i16, ptr %12, i64 %17
  %19 = load i16, ptr %18, align 2
  %20 = zext i16 %19 to i32
  %21 = and i32 %20, 2048
  %22 = icmp ne i32 %21, 0
  br label %23

23:                                               ; preds = %10, %4
  %24 = phi i1 [ false, %4 ], [ %22, %10 ]
  br i1 %24, label %25, label %36

25:                                               ; preds = %23
  %26 = load i64, ptr %3, align 8
  %27 = mul nsw i64 %26, 10
  %28 = load ptr, ptr %2, align 8
  %29 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %28, i32 0, i32 2
  %30 = load i8, ptr %29, align 8
  %31 = sext i8 %30 to i32
  %32 = sub nsw i32 %31, 48
  %33 = sext i32 %32 to i64
  %34 = add nsw i64 %27, %33
  store i64 %34, ptr %3, align 8
  %35 = load ptr, ptr %2, align 8
  call void @calculator_ast_parser_advance(ptr noundef %35)
  br label %4, !llvm.loop !17

36:                                               ; preds = %23
  %37 = load i64, ptr %3, align 8
  %38 = call ptr @ast_node_new_number(i64 noundef %37)
  ret ptr %38
}

define internal ptr @calculator_ast_parser_parse_variable(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  %10 = load ptr, ptr %3, align 8
  %11 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %10, i32 0, i32 1
  %12 = load i64, ptr %11, align 8
  store i64 %12, ptr %4, align 8
  br label %13

13:                                               ; preds = %49, %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %14, i32 0, i32 2
  %16 = load i8, ptr %15, align 8
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %47

19:                                               ; preds = %13
  %20 = call ptr @__ctype_b_loc()
  %21 = load ptr, ptr %20, align 8
  %22 = load ptr, ptr %3, align 8
  %23 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %22, i32 0, i32 2
  %24 = load i8, ptr %23, align 8
  %25 = zext i8 %24 to i32
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i16, ptr %21, i64 %26
  %28 = load i16, ptr %27, align 2
  %29 = zext i16 %28 to i32
  %30 = and i32 %29, 1024
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %45, label %32

32:                                               ; preds = %19
  %33 = call ptr @__ctype_b_loc()
  %34 = load ptr, ptr %33, align 8
  %35 = load ptr, ptr %3, align 8
  %36 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %35, i32 0, i32 2
  %37 = load i8, ptr %36, align 8
  %38 = zext i8 %37 to i32
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i16, ptr %34, i64 %39
  %41 = load i16, ptr %40, align 2
  %42 = zext i16 %41 to i32
  %43 = and i32 %42, 2048
  %44 = icmp ne i32 %43, 0
  br label %45

45:                                               ; preds = %32, %19
  %46 = phi i1 [ true, %19 ], [ %44, %32 ]
  br label %47

47:                                               ; preds = %45, %13
  %48 = phi i1 [ false, %13 ], [ %46, %45 ]
  br i1 %48, label %49, label %51

49:                                               ; preds = %47
  %50 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_advance(ptr noundef %50)
  br label %13, !llvm.loop !18

51:                                               ; preds = %47
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %52, i32 0, i32 1
  %54 = load i64, ptr %53, align 8
  %55 = load i64, ptr %4, align 8
  %56 = sub i64 %54, %55
  store i64 %56, ptr %5, align 8
  %57 = load i64, ptr %5, align 8
  %58 = add i64 %57, 1
  %59 = call noalias ptr @malloc(i64 noundef %58)
  store ptr %59, ptr %6, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = load ptr, ptr %3, align 8
  %62 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %61, i32 0, i32 0
  %63 = load ptr, ptr %62, align 8
  %64 = load i64, ptr %4, align 8
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 %64
  %66 = load i64, ptr %5, align 8
  %67 = call ptr @strncpy(ptr noundef %60, ptr noundef %65, i64 noundef %66)
  %68 = load ptr, ptr %6, align 8
  %69 = load i64, ptr %5, align 8
  %70 = getelementptr inbounds nuw i8, ptr %68, i64 %69
  store i8 0, ptr %70, align 1
  %71 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_skip_whitespace(ptr noundef %71)
  %72 = load ptr, ptr %3, align 8
  %73 = getelementptr inbounds nuw %struct.CalculatorAstParser, ptr %72, i32 0, i32 2
  %74 = load i8, ptr %73, align 8
  %75 = sext i8 %74 to i32
  %76 = icmp eq i32 %75, 61
  br i1 %76, label %77, label %86

77:                                               ; preds = %51
  %78 = load ptr, ptr %3, align 8
  call void @calculator_ast_parser_advance(ptr noundef %78)
  %79 = load ptr, ptr %3, align 8
  %80 = call ptr @calculator_ast_parser_parse_expression(ptr noundef %79)
  store ptr %80, ptr %7, align 8
  %81 = load ptr, ptr %6, align 8
  %82 = load ptr, ptr %7, align 8
  %83 = call ptr @ast_node_new_assignment(ptr noundef %81, ptr noundef %82)
  store ptr %83, ptr %8, align 8
  %84 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %84)
  %85 = load ptr, ptr %8, align 8
  store ptr %85, ptr %2, align 8
  br label %91

86:                                               ; preds = %51
  %87 = load ptr, ptr %6, align 8
  %88 = call ptr @ast_node_new_variable(ptr noundef %87)
  store ptr %88, ptr %9, align 8
  %89 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %89)
  %90 = load ptr, ptr %9, align 8
  store ptr %90, ptr %2, align 8
  br label %91

91:                                               ; preds = %86, %77
  %92 = load ptr, ptr %2, align 8
  ret ptr %92
}

declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef)

define internal ptr @ast_node_new_assignment(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  %7 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = call noalias ptr @strdup(ptr noundef %8)
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %10, i32 0, i32 0
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %4, align 8
  %13 = load ptr, ptr %5, align 8
  %14 = getelementptr inbounds nuw %struct.AST_Assignment, ptr %13, i32 0, i32 1
  store ptr %12, ptr %14, align 8
  %15 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %15, ptr %6, align 8
  %16 = load ptr, ptr %6, align 8
  %17 = getelementptr inbounds nuw %struct.AST_Node, ptr %16, i32 0, i32 0
  store i32 3, ptr %17, align 8
  %18 = load ptr, ptr %5, align 8
  %19 = load ptr, ptr %6, align 8
  %20 = getelementptr inbounds nuw %struct.AST_Node, ptr %19, i32 0, i32 1
  store ptr %18, ptr %20, align 8
  %21 = load ptr, ptr %6, align 8
  ret ptr %21
}

define internal ptr @ast_node_new_variable(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = call noalias ptr @malloc(i64 noundef 16)
  store ptr %4, ptr %3, align 8
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds nuw %struct.AST_Node, ptr %5, i32 0, i32 0
  store i32 1, ptr %6, align 8
  %7 = load ptr, ptr %2, align 8
  %8 = call noalias ptr @strdup(ptr noundef %7)
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.AST_Node, ptr %9, i32 0, i32 1
  store ptr %8, ptr %10, align 8
  %11 = load ptr, ptr %3, align 8
  ret ptr %11
}

declare noalias ptr @strdup(ptr noundef)

define internal ptr @calculator_interpreter_context_get(ptr noundef %0, ptr noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8
  store ptr null, ptr %5, align 8
  br label %13

13:                                               ; preds = %2
  %14 = load ptr, ptr %4, align 8
  %15 = call i64 @strlen(ptr noundef %14)
  %16 = trunc i64 %15 to i32
  store i32 %16, ptr %6, align 4
  br label %17

17:                                               ; preds = %13
  store ptr null, ptr %5, align 8
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %18, i32 0, i32 0
  %20 = load ptr, ptr %19, align 8
  %21 = icmp ne ptr %20, null
  br i1 %21, label %22, label %506

22:                                               ; preds = %17
  br label %23

23:                                               ; preds = %22
  br label %24

24:                                               ; preds = %23
  %25 = load ptr, ptr %4, align 8
  store ptr %25, ptr %11, align 8
  store i32 -17973521, ptr %7, align 4
  store i32 -1640531527, ptr %9, align 4
  store i32 -1640531527, ptr %8, align 4
  %26 = load i32, ptr %6, align 4
  store i32 %26, ptr %10, align 4
  br label %27

27:                                               ; preds = %194, %24
  %28 = load i32, ptr %10, align 4
  %29 = icmp uge i32 %28, 12
  br i1 %29, label %30, label %199

30:                                               ; preds = %27
  %31 = load ptr, ptr %11, align 8
  %32 = getelementptr inbounds i8, ptr %31, i64 0
  %33 = load i8, ptr %32, align 1
  %34 = zext i8 %33 to i32
  %35 = load ptr, ptr %11, align 8
  %36 = getelementptr inbounds i8, ptr %35, i64 1
  %37 = load i8, ptr %36, align 1
  %38 = zext i8 %37 to i32
  %39 = shl i32 %38, 8
  %40 = add i32 %34, %39
  %41 = load ptr, ptr %11, align 8
  %42 = getelementptr inbounds i8, ptr %41, i64 2
  %43 = load i8, ptr %42, align 1
  %44 = zext i8 %43 to i32
  %45 = shl i32 %44, 16
  %46 = add i32 %40, %45
  %47 = load ptr, ptr %11, align 8
  %48 = getelementptr inbounds i8, ptr %47, i64 3
  %49 = load i8, ptr %48, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, 24
  %52 = add i32 %46, %51
  %53 = load i32, ptr %8, align 4
  %54 = add i32 %53, %52
  store i32 %54, ptr %8, align 4
  %55 = load ptr, ptr %11, align 8
  %56 = getelementptr inbounds i8, ptr %55, i64 4
  %57 = load i8, ptr %56, align 1
  %58 = zext i8 %57 to i32
  %59 = load ptr, ptr %11, align 8
  %60 = getelementptr inbounds i8, ptr %59, i64 5
  %61 = load i8, ptr %60, align 1
  %62 = zext i8 %61 to i32
  %63 = shl i32 %62, 8
  %64 = add i32 %58, %63
  %65 = load ptr, ptr %11, align 8
  %66 = getelementptr inbounds i8, ptr %65, i64 6
  %67 = load i8, ptr %66, align 1
  %68 = zext i8 %67 to i32
  %69 = shl i32 %68, 16
  %70 = add i32 %64, %69
  %71 = load ptr, ptr %11, align 8
  %72 = getelementptr inbounds i8, ptr %71, i64 7
  %73 = load i8, ptr %72, align 1
  %74 = zext i8 %73 to i32
  %75 = shl i32 %74, 24
  %76 = add i32 %70, %75
  %77 = load i32, ptr %9, align 4
  %78 = add i32 %77, %76
  store i32 %78, ptr %9, align 4
  %79 = load ptr, ptr %11, align 8
  %80 = getelementptr inbounds i8, ptr %79, i64 8
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = load ptr, ptr %11, align 8
  %84 = getelementptr inbounds i8, ptr %83, i64 9
  %85 = load i8, ptr %84, align 1
  %86 = zext i8 %85 to i32
  %87 = shl i32 %86, 8
  %88 = add i32 %82, %87
  %89 = load ptr, ptr %11, align 8
  %90 = getelementptr inbounds i8, ptr %89, i64 10
  %91 = load i8, ptr %90, align 1
  %92 = zext i8 %91 to i32
  %93 = shl i32 %92, 16
  %94 = add i32 %88, %93
  %95 = load ptr, ptr %11, align 8
  %96 = getelementptr inbounds i8, ptr %95, i64 11
  %97 = load i8, ptr %96, align 1
  %98 = zext i8 %97 to i32
  %99 = shl i32 %98, 24
  %100 = add i32 %94, %99
  %101 = load i32, ptr %7, align 4
  %102 = add i32 %101, %100
  store i32 %102, ptr %7, align 4
  br label %103

103:                                              ; preds = %30
  %104 = load i32, ptr %9, align 4
  %105 = load i32, ptr %8, align 4
  %106 = sub i32 %105, %104
  store i32 %106, ptr %8, align 4
  %107 = load i32, ptr %7, align 4
  %108 = load i32, ptr %8, align 4
  %109 = sub i32 %108, %107
  store i32 %109, ptr %8, align 4
  %110 = load i32, ptr %7, align 4
  %111 = lshr i32 %110, 13
  %112 = load i32, ptr %8, align 4
  %113 = xor i32 %112, %111
  store i32 %113, ptr %8, align 4
  %114 = load i32, ptr %7, align 4
  %115 = load i32, ptr %9, align 4
  %116 = sub i32 %115, %114
  store i32 %116, ptr %9, align 4
  %117 = load i32, ptr %8, align 4
  %118 = load i32, ptr %9, align 4
  %119 = sub i32 %118, %117
  store i32 %119, ptr %9, align 4
  %120 = load i32, ptr %8, align 4
  %121 = shl i32 %120, 8
  %122 = load i32, ptr %9, align 4
  %123 = xor i32 %122, %121
  store i32 %123, ptr %9, align 4
  %124 = load i32, ptr %8, align 4
  %125 = load i32, ptr %7, align 4
  %126 = sub i32 %125, %124
  store i32 %126, ptr %7, align 4
  %127 = load i32, ptr %9, align 4
  %128 = load i32, ptr %7, align 4
  %129 = sub i32 %128, %127
  store i32 %129, ptr %7, align 4
  %130 = load i32, ptr %9, align 4
  %131 = lshr i32 %130, 13
  %132 = load i32, ptr %7, align 4
  %133 = xor i32 %132, %131
  store i32 %133, ptr %7, align 4
  %134 = load i32, ptr %9, align 4
  %135 = load i32, ptr %8, align 4
  %136 = sub i32 %135, %134
  store i32 %136, ptr %8, align 4
  %137 = load i32, ptr %7, align 4
  %138 = load i32, ptr %8, align 4
  %139 = sub i32 %138, %137
  store i32 %139, ptr %8, align 4
  %140 = load i32, ptr %7, align 4
  %141 = lshr i32 %140, 12
  %142 = load i32, ptr %8, align 4
  %143 = xor i32 %142, %141
  store i32 %143, ptr %8, align 4
  %144 = load i32, ptr %7, align 4
  %145 = load i32, ptr %9, align 4
  %146 = sub i32 %145, %144
  store i32 %146, ptr %9, align 4
  %147 = load i32, ptr %8, align 4
  %148 = load i32, ptr %9, align 4
  %149 = sub i32 %148, %147
  store i32 %149, ptr %9, align 4
  %150 = load i32, ptr %8, align 4
  %151 = shl i32 %150, 16
  %152 = load i32, ptr %9, align 4
  %153 = xor i32 %152, %151
  store i32 %153, ptr %9, align 4
  %154 = load i32, ptr %8, align 4
  %155 = load i32, ptr %7, align 4
  %156 = sub i32 %155, %154
  store i32 %156, ptr %7, align 4
  %157 = load i32, ptr %9, align 4
  %158 = load i32, ptr %7, align 4
  %159 = sub i32 %158, %157
  store i32 %159, ptr %7, align 4
  %160 = load i32, ptr %9, align 4
  %161 = lshr i32 %160, 5
  %162 = load i32, ptr %7, align 4
  %163 = xor i32 %162, %161
  store i32 %163, ptr %7, align 4
  %164 = load i32, ptr %9, align 4
  %165 = load i32, ptr %8, align 4
  %166 = sub i32 %165, %164
  store i32 %166, ptr %8, align 4
  %167 = load i32, ptr %7, align 4
  %168 = load i32, ptr %8, align 4
  %169 = sub i32 %168, %167
  store i32 %169, ptr %8, align 4
  %170 = load i32, ptr %7, align 4
  %171 = lshr i32 %170, 3
  %172 = load i32, ptr %8, align 4
  %173 = xor i32 %172, %171
  store i32 %173, ptr %8, align 4
  %174 = load i32, ptr %7, align 4
  %175 = load i32, ptr %9, align 4
  %176 = sub i32 %175, %174
  store i32 %176, ptr %9, align 4
  %177 = load i32, ptr %8, align 4
  %178 = load i32, ptr %9, align 4
  %179 = sub i32 %178, %177
  store i32 %179, ptr %9, align 4
  %180 = load i32, ptr %8, align 4
  %181 = shl i32 %180, 10
  %182 = load i32, ptr %9, align 4
  %183 = xor i32 %182, %181
  store i32 %183, ptr %9, align 4
  %184 = load i32, ptr %8, align 4
  %185 = load i32, ptr %7, align 4
  %186 = sub i32 %185, %184
  store i32 %186, ptr %7, align 4
  %187 = load i32, ptr %9, align 4
  %188 = load i32, ptr %7, align 4
  %189 = sub i32 %188, %187
  store i32 %189, ptr %7, align 4
  %190 = load i32, ptr %9, align 4
  %191 = lshr i32 %190, 15
  %192 = load i32, ptr %7, align 4
  %193 = xor i32 %192, %191
  store i32 %193, ptr %7, align 4
  br label %194

194:                                              ; preds = %103
  %195 = load ptr, ptr %11, align 8
  %196 = getelementptr inbounds i8, ptr %195, i64 12
  store ptr %196, ptr %11, align 8
  %197 = load i32, ptr %10, align 4
  %198 = sub i32 %197, 12
  store i32 %198, ptr %10, align 4
  br label %27, !llvm.loop !19

199:                                              ; preds = %27
  %200 = load i32, ptr %6, align 4
  %201 = load i32, ptr %7, align 4
  %202 = add i32 %201, %200
  store i32 %202, ptr %7, align 4
  %203 = load i32, ptr %10, align 4
  switch i32 %203, label %290 [
    i32 11, label %204
    i32 10, label %212
    i32 9, label %220
    i32 8, label %228
    i32 7, label %236
    i32 6, label %244
    i32 5, label %252
    i32 4, label %259
    i32 3, label %267
    i32 2, label %275
    i32 1, label %283
  ]

204:                                              ; preds = %199
  %205 = load ptr, ptr %11, align 8
  %206 = getelementptr inbounds i8, ptr %205, i64 10
  %207 = load i8, ptr %206, align 1
  %208 = zext i8 %207 to i32
  %209 = shl i32 %208, 24
  %210 = load i32, ptr %7, align 4
  %211 = add i32 %210, %209
  store i32 %211, ptr %7, align 4
  br label %212

212:                                              ; preds = %199, %204
  %213 = load ptr, ptr %11, align 8
  %214 = getelementptr inbounds i8, ptr %213, i64 9
  %215 = load i8, ptr %214, align 1
  %216 = zext i8 %215 to i32
  %217 = shl i32 %216, 16
  %218 = load i32, ptr %7, align 4
  %219 = add i32 %218, %217
  store i32 %219, ptr %7, align 4
  br label %220

220:                                              ; preds = %199, %212
  %221 = load ptr, ptr %11, align 8
  %222 = getelementptr inbounds i8, ptr %221, i64 8
  %223 = load i8, ptr %222, align 1
  %224 = zext i8 %223 to i32
  %225 = shl i32 %224, 8
  %226 = load i32, ptr %7, align 4
  %227 = add i32 %226, %225
  store i32 %227, ptr %7, align 4
  br label %228

228:                                              ; preds = %199, %220
  %229 = load ptr, ptr %11, align 8
  %230 = getelementptr inbounds i8, ptr %229, i64 7
  %231 = load i8, ptr %230, align 1
  %232 = zext i8 %231 to i32
  %233 = shl i32 %232, 24
  %234 = load i32, ptr %9, align 4
  %235 = add i32 %234, %233
  store i32 %235, ptr %9, align 4
  br label %236

236:                                              ; preds = %199, %228
  %237 = load ptr, ptr %11, align 8
  %238 = getelementptr inbounds i8, ptr %237, i64 6
  %239 = load i8, ptr %238, align 1
  %240 = zext i8 %239 to i32
  %241 = shl i32 %240, 16
  %242 = load i32, ptr %9, align 4
  %243 = add i32 %242, %241
  store i32 %243, ptr %9, align 4
  br label %244

244:                                              ; preds = %199, %236
  %245 = load ptr, ptr %11, align 8
  %246 = getelementptr inbounds i8, ptr %245, i64 5
  %247 = load i8, ptr %246, align 1
  %248 = zext i8 %247 to i32
  %249 = shl i32 %248, 8
  %250 = load i32, ptr %9, align 4
  %251 = add i32 %250, %249
  store i32 %251, ptr %9, align 4
  br label %252

252:                                              ; preds = %199, %244
  %253 = load ptr, ptr %11, align 8
  %254 = getelementptr inbounds i8, ptr %253, i64 4
  %255 = load i8, ptr %254, align 1
  %256 = zext i8 %255 to i32
  %257 = load i32, ptr %9, align 4
  %258 = add i32 %257, %256
  store i32 %258, ptr %9, align 4
  br label %259

259:                                              ; preds = %199, %252
  %260 = load ptr, ptr %11, align 8
  %261 = getelementptr inbounds i8, ptr %260, i64 3
  %262 = load i8, ptr %261, align 1
  %263 = zext i8 %262 to i32
  %264 = shl i32 %263, 24
  %265 = load i32, ptr %8, align 4
  %266 = add i32 %265, %264
  store i32 %266, ptr %8, align 4
  br label %267

267:                                              ; preds = %199, %259
  %268 = load ptr, ptr %11, align 8
  %269 = getelementptr inbounds i8, ptr %268, i64 2
  %270 = load i8, ptr %269, align 1
  %271 = zext i8 %270 to i32
  %272 = shl i32 %271, 16
  %273 = load i32, ptr %8, align 4
  %274 = add i32 %273, %272
  store i32 %274, ptr %8, align 4
  br label %275

275:                                              ; preds = %199, %267
  %276 = load ptr, ptr %11, align 8
  %277 = getelementptr inbounds i8, ptr %276, i64 1
  %278 = load i8, ptr %277, align 1
  %279 = zext i8 %278 to i32
  %280 = shl i32 %279, 8
  %281 = load i32, ptr %8, align 4
  %282 = add i32 %281, %280
  store i32 %282, ptr %8, align 4
  br label %283

283:                                              ; preds = %199, %275
  %284 = load ptr, ptr %11, align 8
  %285 = getelementptr inbounds i8, ptr %284, i64 0
  %286 = load i8, ptr %285, align 1
  %287 = zext i8 %286 to i32
  %288 = load i32, ptr %8, align 4
  %289 = add i32 %288, %287
  store i32 %289, ptr %8, align 4
  br label %290

290:                                              ; preds = %199, %283
  br label %291

291:                                              ; preds = %290
  br label %292

292:                                              ; preds = %291
  %293 = load i32, ptr %9, align 4
  %294 = load i32, ptr %8, align 4
  %295 = sub i32 %294, %293
  store i32 %295, ptr %8, align 4
  %296 = load i32, ptr %7, align 4
  %297 = load i32, ptr %8, align 4
  %298 = sub i32 %297, %296
  store i32 %298, ptr %8, align 4
  %299 = load i32, ptr %7, align 4
  %300 = lshr i32 %299, 13
  %301 = load i32, ptr %8, align 4
  %302 = xor i32 %301, %300
  store i32 %302, ptr %8, align 4
  %303 = load i32, ptr %7, align 4
  %304 = load i32, ptr %9, align 4
  %305 = sub i32 %304, %303
  store i32 %305, ptr %9, align 4
  %306 = load i32, ptr %8, align 4
  %307 = load i32, ptr %9, align 4
  %308 = sub i32 %307, %306
  store i32 %308, ptr %9, align 4
  %309 = load i32, ptr %8, align 4
  %310 = shl i32 %309, 8
  %311 = load i32, ptr %9, align 4
  %312 = xor i32 %311, %310
  store i32 %312, ptr %9, align 4
  %313 = load i32, ptr %8, align 4
  %314 = load i32, ptr %7, align 4
  %315 = sub i32 %314, %313
  store i32 %315, ptr %7, align 4
  %316 = load i32, ptr %9, align 4
  %317 = load i32, ptr %7, align 4
  %318 = sub i32 %317, %316
  store i32 %318, ptr %7, align 4
  %319 = load i32, ptr %9, align 4
  %320 = lshr i32 %319, 13
  %321 = load i32, ptr %7, align 4
  %322 = xor i32 %321, %320
  store i32 %322, ptr %7, align 4
  %323 = load i32, ptr %9, align 4
  %324 = load i32, ptr %8, align 4
  %325 = sub i32 %324, %323
  store i32 %325, ptr %8, align 4
  %326 = load i32, ptr %7, align 4
  %327 = load i32, ptr %8, align 4
  %328 = sub i32 %327, %326
  store i32 %328, ptr %8, align 4
  %329 = load i32, ptr %7, align 4
  %330 = lshr i32 %329, 12
  %331 = load i32, ptr %8, align 4
  %332 = xor i32 %331, %330
  store i32 %332, ptr %8, align 4
  %333 = load i32, ptr %7, align 4
  %334 = load i32, ptr %9, align 4
  %335 = sub i32 %334, %333
  store i32 %335, ptr %9, align 4
  %336 = load i32, ptr %8, align 4
  %337 = load i32, ptr %9, align 4
  %338 = sub i32 %337, %336
  store i32 %338, ptr %9, align 4
  %339 = load i32, ptr %8, align 4
  %340 = shl i32 %339, 16
  %341 = load i32, ptr %9, align 4
  %342 = xor i32 %341, %340
  store i32 %342, ptr %9, align 4
  %343 = load i32, ptr %8, align 4
  %344 = load i32, ptr %7, align 4
  %345 = sub i32 %344, %343
  store i32 %345, ptr %7, align 4
  %346 = load i32, ptr %9, align 4
  %347 = load i32, ptr %7, align 4
  %348 = sub i32 %347, %346
  store i32 %348, ptr %7, align 4
  %349 = load i32, ptr %9, align 4
  %350 = lshr i32 %349, 5
  %351 = load i32, ptr %7, align 4
  %352 = xor i32 %351, %350
  store i32 %352, ptr %7, align 4
  %353 = load i32, ptr %9, align 4
  %354 = load i32, ptr %8, align 4
  %355 = sub i32 %354, %353
  store i32 %355, ptr %8, align 4
  %356 = load i32, ptr %7, align 4
  %357 = load i32, ptr %8, align 4
  %358 = sub i32 %357, %356
  store i32 %358, ptr %8, align 4
  %359 = load i32, ptr %7, align 4
  %360 = lshr i32 %359, 3
  %361 = load i32, ptr %8, align 4
  %362 = xor i32 %361, %360
  store i32 %362, ptr %8, align 4
  %363 = load i32, ptr %7, align 4
  %364 = load i32, ptr %9, align 4
  %365 = sub i32 %364, %363
  store i32 %365, ptr %9, align 4
  %366 = load i32, ptr %8, align 4
  %367 = load i32, ptr %9, align 4
  %368 = sub i32 %367, %366
  store i32 %368, ptr %9, align 4
  %369 = load i32, ptr %8, align 4
  %370 = shl i32 %369, 10
  %371 = load i32, ptr %9, align 4
  %372 = xor i32 %371, %370
  store i32 %372, ptr %9, align 4
  %373 = load i32, ptr %8, align 4
  %374 = load i32, ptr %7, align 4
  %375 = sub i32 %374, %373
  store i32 %375, ptr %7, align 4
  %376 = load i32, ptr %9, align 4
  %377 = load i32, ptr %7, align 4
  %378 = sub i32 %377, %376
  store i32 %378, ptr %7, align 4
  %379 = load i32, ptr %9, align 4
  %380 = lshr i32 %379, 15
  %381 = load i32, ptr %7, align 4
  %382 = xor i32 %381, %380
  store i32 %382, ptr %7, align 4
  br label %383

383:                                              ; preds = %292
  br label %384

384:                                              ; preds = %383
  br label %385

385:                                              ; preds = %384
  br label %386

386:                                              ; preds = %385
  store ptr null, ptr %5, align 8
  %387 = load ptr, ptr %3, align 8
  %388 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %387, i32 0, i32 0
  %389 = load ptr, ptr %388, align 8
  %390 = icmp ne ptr %389, null
  br i1 %390, label %391, label %504

391:                                              ; preds = %386
  br label %392

392:                                              ; preds = %391
  %393 = load i32, ptr %7, align 4
  %394 = load ptr, ptr %3, align 8
  %395 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %394, i32 0, i32 0
  %396 = load ptr, ptr %395, align 8
  %397 = getelementptr inbounds nuw %struct.VariableEntry, ptr %396, i32 0, i32 2
  %398 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %397, i32 0, i32 0
  %399 = load ptr, ptr %398, align 8
  %400 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %399, i32 0, i32 1
  %401 = load i32, ptr %400, align 8
  %402 = sub i32 %401, 1
  %403 = and i32 %393, %402
  store i32 %403, ptr %12, align 4
  br label %404

404:                                              ; preds = %392
  br label %405

405:                                              ; preds = %404
  %406 = load ptr, ptr %3, align 8
  %407 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %406, i32 0, i32 0
  %408 = load ptr, ptr %407, align 8
  %409 = getelementptr inbounds nuw %struct.VariableEntry, ptr %408, i32 0, i32 2
  %410 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %409, i32 0, i32 0
  %411 = load ptr, ptr %410, align 8
  %412 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %411, i32 0, i32 0
  %413 = load ptr, ptr %412, align 8
  %414 = load i32, ptr %12, align 4
  %415 = zext i32 %414 to i64
  %416 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %413, i64 %415
  %417 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %416, i32 0, i32 0
  %418 = load ptr, ptr %417, align 8
  %419 = icmp ne ptr %418, null
  br i1 %419, label %420, label %446

420:                                              ; preds = %405
  br label %421

421:                                              ; preds = %420
  %422 = load ptr, ptr %3, align 8
  %423 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %422, i32 0, i32 0
  %424 = load ptr, ptr %423, align 8
  %425 = getelementptr inbounds nuw %struct.VariableEntry, ptr %424, i32 0, i32 2
  %426 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %425, i32 0, i32 0
  %427 = load ptr, ptr %426, align 8
  %428 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %427, i32 0, i32 0
  %429 = load ptr, ptr %428, align 8
  %430 = load i32, ptr %12, align 4
  %431 = zext i32 %430 to i64
  %432 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %429, i64 %431
  %433 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %432, i32 0, i32 0
  %434 = load ptr, ptr %433, align 8
  %435 = load ptr, ptr %3, align 8
  %436 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %435, i32 0, i32 0
  %437 = load ptr, ptr %436, align 8
  %438 = getelementptr inbounds nuw %struct.VariableEntry, ptr %437, i32 0, i32 2
  %439 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %438, i32 0, i32 0
  %440 = load ptr, ptr %439, align 8
  %441 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %440, i32 0, i32 5
  %442 = load i64, ptr %441, align 8
  %443 = sub i64 0, %442
  %444 = getelementptr inbounds i8, ptr %434, i64 %443
  store ptr %444, ptr %5, align 8
  br label %445

445:                                              ; preds = %421
  br label %447

446:                                              ; preds = %405
  store ptr null, ptr %5, align 8
  br label %447

447:                                              ; preds = %446, %445
  br label %448

448:                                              ; preds = %501, %447
  %449 = load ptr, ptr %5, align 8
  %450 = icmp ne ptr %449, null
  br i1 %450, label %451, label %502

451:                                              ; preds = %448
  %452 = load ptr, ptr %5, align 8
  %453 = getelementptr inbounds nuw %struct.VariableEntry, ptr %452, i32 0, i32 2
  %454 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %453, i32 0, i32 7
  %455 = load i32, ptr %454, align 4
  %456 = load i32, ptr %7, align 4
  %457 = icmp eq i32 %455, %456
  br i1 %457, label %458, label %477

458:                                              ; preds = %451
  %459 = load ptr, ptr %5, align 8
  %460 = getelementptr inbounds nuw %struct.VariableEntry, ptr %459, i32 0, i32 2
  %461 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %460, i32 0, i32 6
  %462 = load i32, ptr %461, align 8
  %463 = load i32, ptr %6, align 4
  %464 = icmp eq i32 %462, %463
  br i1 %464, label %465, label %477

465:                                              ; preds = %458
  %466 = load ptr, ptr %5, align 8
  %467 = getelementptr inbounds nuw %struct.VariableEntry, ptr %466, i32 0, i32 2
  %468 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %467, i32 0, i32 5
  %469 = load ptr, ptr %468, align 8
  %470 = load ptr, ptr %4, align 8
  %471 = load i32, ptr %6, align 4
  %472 = zext i32 %471 to i64
  %473 = call i32 @memcmp(ptr noundef %469, ptr noundef %470, i64 noundef %472)
  %474 = icmp eq i32 %473, 0
  br i1 %474, label %475, label %476

475:                                              ; preds = %465
  br label %502

476:                                              ; preds = %465
  br label %477

477:                                              ; preds = %476, %458, %451
  %478 = load ptr, ptr %5, align 8
  %479 = getelementptr inbounds nuw %struct.VariableEntry, ptr %478, i32 0, i32 2
  %480 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %479, i32 0, i32 4
  %481 = load ptr, ptr %480, align 8
  %482 = icmp ne ptr %481, null
  br i1 %482, label %483, label %500

483:                                              ; preds = %477
  br label %484

484:                                              ; preds = %483
  %485 = load ptr, ptr %5, align 8
  %486 = getelementptr inbounds nuw %struct.VariableEntry, ptr %485, i32 0, i32 2
  %487 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %486, i32 0, i32 4
  %488 = load ptr, ptr %487, align 8
  %489 = load ptr, ptr %3, align 8
  %490 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %489, i32 0, i32 0
  %491 = load ptr, ptr %490, align 8
  %492 = getelementptr inbounds nuw %struct.VariableEntry, ptr %491, i32 0, i32 2
  %493 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %492, i32 0, i32 0
  %494 = load ptr, ptr %493, align 8
  %495 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %494, i32 0, i32 5
  %496 = load i64, ptr %495, align 8
  %497 = sub i64 0, %496
  %498 = getelementptr inbounds i8, ptr %488, i64 %497
  store ptr %498, ptr %5, align 8
  br label %499

499:                                              ; preds = %484
  br label %501

500:                                              ; preds = %477
  store ptr null, ptr %5, align 8
  br label %501

501:                                              ; preds = %500, %499
  br label %448, !llvm.loop !20

502:                                              ; preds = %475, %448
  br label %503

503:                                              ; preds = %502
  br label %504

504:                                              ; preds = %503, %386
  br label %505

505:                                              ; preds = %504
  br label %506

506:                                              ; preds = %505, %17
  br label %507

507:                                              ; preds = %506
  br label %508

508:                                              ; preds = %507
  %509 = load ptr, ptr %5, align 8
  %510 = icmp ne ptr %509, null
  br i1 %510, label %511, label %514

511:                                              ; preds = %508
  %512 = load ptr, ptr %5, align 8
  %513 = getelementptr inbounds nuw %struct.VariableEntry, ptr %512, i32 0, i32 1
  br label %515

514:                                              ; preds = %508
  br label %515

515:                                              ; preds = %514, %511
  %516 = phi ptr [ %513, %511 ], [ null, %514 ]
  ret ptr %516
}

define internal i64 @calculator_interpreter_simple_div(i64 noundef %0, i64 noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %8 = load i64, ptr %5, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  store i64 0, ptr %3, align 8
  br label %50

11:                                               ; preds = %2
  %12 = load i64, ptr %4, align 8
  %13 = icmp sge i64 %12, 0
  br i1 %13, label %14, label %17

14:                                               ; preds = %11
  %15 = load i64, ptr %5, align 8
  %16 = icmp sgt i64 %15, 0
  br i1 %16, label %23, label %17

17:                                               ; preds = %14, %11
  %18 = load i64, ptr %4, align 8
  %19 = icmp slt i64 %18, 0
  br i1 %19, label %20, label %27

20:                                               ; preds = %17
  %21 = load i64, ptr %5, align 8
  %22 = icmp slt i64 %21, 0
  br i1 %22, label %23, label %27

23:                                               ; preds = %20, %14
  %24 = load i64, ptr %4, align 8
  %25 = load i64, ptr %5, align 8
  %26 = sdiv i64 %24, %25
  store i64 %26, ptr %3, align 8
  br label %50

27:                                               ; preds = %20, %17
  %28 = load i64, ptr %4, align 8
  %29 = icmp sge i64 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %27
  %31 = load i64, ptr %4, align 8
  br label %35

32:                                               ; preds = %27
  %33 = load i64, ptr %4, align 8
  %34 = sub nsw i64 0, %33
  br label %35

35:                                               ; preds = %32, %30
  %36 = phi i64 [ %31, %30 ], [ %34, %32 ]
  store i64 %36, ptr %6, align 8
  %37 = load i64, ptr %5, align 8
  %38 = icmp sge i64 %37, 0
  br i1 %38, label %39, label %41

39:                                               ; preds = %35
  %40 = load i64, ptr %5, align 8
  br label %44

41:                                               ; preds = %35
  %42 = load i64, ptr %5, align 8
  %43 = sub nsw i64 0, %42
  br label %44

44:                                               ; preds = %41, %39
  %45 = phi i64 [ %40, %39 ], [ %43, %41 ]
  store i64 %45, ptr %7, align 8
  %46 = load i64, ptr %6, align 8
  %47 = load i64, ptr %7, align 8
  %48 = sdiv i64 %46, %47
  %49 = sub nsw i64 0, %48
  store i64 %49, ptr %3, align 8
  br label %50

50:                                               ; preds = %44, %23, %10
  %51 = load i64, ptr %3, align 8
  ret i64 %51
}

define internal i64 @calculator_interpreter_simple_mod(i64 noundef %0, i64 noundef %1) {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, ptr %4, align 8
  store i64 %1, ptr %5, align 8
  %6 = load i64, ptr %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %2
  store i64 0, ptr %3, align 8
  br label %17

9:                                                ; preds = %2
  %10 = load i64, ptr %4, align 8
  %11 = load i64, ptr %4, align 8
  %12 = load i64, ptr %5, align 8
  %13 = call i64 @calculator_interpreter_simple_div(i64 noundef %11, i64 noundef %12)
  %14 = load i64, ptr %5, align 8
  %15 = mul nsw i64 %13, %14
  %16 = sub nsw i64 %10, %15
  store i64 %16, ptr %3, align 8
  br label %17

17:                                               ; preds = %9, %8
  %18 = load i64, ptr %3, align 8
  ret i64 %18
}

define internal void @calculator_interpreter_context_set(ptr noundef %0, ptr noundef %1, i64 noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
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
  %19 = alloca ptr, align 8
  %20 = alloca i32, align 4
  %21 = alloca ptr, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i64 %2, ptr %6, align 8
  store ptr null, ptr %7, align 8
  br label %28

28:                                               ; preds = %3
  %29 = load ptr, ptr %5, align 8
  %30 = call i64 @strlen(ptr noundef %29)
  %31 = trunc i64 %30 to i32
  store i32 %31, ptr %8, align 4
  br label %32

32:                                               ; preds = %28
  store ptr null, ptr %7, align 8
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %521

37:                                               ; preds = %32
  br label %38

38:                                               ; preds = %37
  br label %39

39:                                               ; preds = %38
  %40 = load ptr, ptr %5, align 8
  store ptr %40, ptr %13, align 8
  store i32 -17973521, ptr %9, align 4
  store i32 -1640531527, ptr %11, align 4
  store i32 -1640531527, ptr %10, align 4
  %41 = load i32, ptr %8, align 4
  store i32 %41, ptr %12, align 4
  br label %42

42:                                               ; preds = %209, %39
  %43 = load i32, ptr %12, align 4
  %44 = icmp uge i32 %43, 12
  br i1 %44, label %45, label %214

45:                                               ; preds = %42
  %46 = load ptr, ptr %13, align 8
  %47 = getelementptr inbounds i8, ptr %46, i64 0
  %48 = load i8, ptr %47, align 1
  %49 = zext i8 %48 to i32
  %50 = load ptr, ptr %13, align 8
  %51 = getelementptr inbounds i8, ptr %50, i64 1
  %52 = load i8, ptr %51, align 1
  %53 = zext i8 %52 to i32
  %54 = shl i32 %53, 8
  %55 = add i32 %49, %54
  %56 = load ptr, ptr %13, align 8
  %57 = getelementptr inbounds i8, ptr %56, i64 2
  %58 = load i8, ptr %57, align 1
  %59 = zext i8 %58 to i32
  %60 = shl i32 %59, 16
  %61 = add i32 %55, %60
  %62 = load ptr, ptr %13, align 8
  %63 = getelementptr inbounds i8, ptr %62, i64 3
  %64 = load i8, ptr %63, align 1
  %65 = zext i8 %64 to i32
  %66 = shl i32 %65, 24
  %67 = add i32 %61, %66
  %68 = load i32, ptr %10, align 4
  %69 = add i32 %68, %67
  store i32 %69, ptr %10, align 4
  %70 = load ptr, ptr %13, align 8
  %71 = getelementptr inbounds i8, ptr %70, i64 4
  %72 = load i8, ptr %71, align 1
  %73 = zext i8 %72 to i32
  %74 = load ptr, ptr %13, align 8
  %75 = getelementptr inbounds i8, ptr %74, i64 5
  %76 = load i8, ptr %75, align 1
  %77 = zext i8 %76 to i32
  %78 = shl i32 %77, 8
  %79 = add i32 %73, %78
  %80 = load ptr, ptr %13, align 8
  %81 = getelementptr inbounds i8, ptr %80, i64 6
  %82 = load i8, ptr %81, align 1
  %83 = zext i8 %82 to i32
  %84 = shl i32 %83, 16
  %85 = add i32 %79, %84
  %86 = load ptr, ptr %13, align 8
  %87 = getelementptr inbounds i8, ptr %86, i64 7
  %88 = load i8, ptr %87, align 1
  %89 = zext i8 %88 to i32
  %90 = shl i32 %89, 24
  %91 = add i32 %85, %90
  %92 = load i32, ptr %11, align 4
  %93 = add i32 %92, %91
  store i32 %93, ptr %11, align 4
  %94 = load ptr, ptr %13, align 8
  %95 = getelementptr inbounds i8, ptr %94, i64 8
  %96 = load i8, ptr %95, align 1
  %97 = zext i8 %96 to i32
  %98 = load ptr, ptr %13, align 8
  %99 = getelementptr inbounds i8, ptr %98, i64 9
  %100 = load i8, ptr %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl i32 %101, 8
  %103 = add i32 %97, %102
  %104 = load ptr, ptr %13, align 8
  %105 = getelementptr inbounds i8, ptr %104, i64 10
  %106 = load i8, ptr %105, align 1
  %107 = zext i8 %106 to i32
  %108 = shl i32 %107, 16
  %109 = add i32 %103, %108
  %110 = load ptr, ptr %13, align 8
  %111 = getelementptr inbounds i8, ptr %110, i64 11
  %112 = load i8, ptr %111, align 1
  %113 = zext i8 %112 to i32
  %114 = shl i32 %113, 24
  %115 = add i32 %109, %114
  %116 = load i32, ptr %9, align 4
  %117 = add i32 %116, %115
  store i32 %117, ptr %9, align 4
  br label %118

118:                                              ; preds = %45
  %119 = load i32, ptr %11, align 4
  %120 = load i32, ptr %10, align 4
  %121 = sub i32 %120, %119
  store i32 %121, ptr %10, align 4
  %122 = load i32, ptr %9, align 4
  %123 = load i32, ptr %10, align 4
  %124 = sub i32 %123, %122
  store i32 %124, ptr %10, align 4
  %125 = load i32, ptr %9, align 4
  %126 = lshr i32 %125, 13
  %127 = load i32, ptr %10, align 4
  %128 = xor i32 %127, %126
  store i32 %128, ptr %10, align 4
  %129 = load i32, ptr %9, align 4
  %130 = load i32, ptr %11, align 4
  %131 = sub i32 %130, %129
  store i32 %131, ptr %11, align 4
  %132 = load i32, ptr %10, align 4
  %133 = load i32, ptr %11, align 4
  %134 = sub i32 %133, %132
  store i32 %134, ptr %11, align 4
  %135 = load i32, ptr %10, align 4
  %136 = shl i32 %135, 8
  %137 = load i32, ptr %11, align 4
  %138 = xor i32 %137, %136
  store i32 %138, ptr %11, align 4
  %139 = load i32, ptr %10, align 4
  %140 = load i32, ptr %9, align 4
  %141 = sub i32 %140, %139
  store i32 %141, ptr %9, align 4
  %142 = load i32, ptr %11, align 4
  %143 = load i32, ptr %9, align 4
  %144 = sub i32 %143, %142
  store i32 %144, ptr %9, align 4
  %145 = load i32, ptr %11, align 4
  %146 = lshr i32 %145, 13
  %147 = load i32, ptr %9, align 4
  %148 = xor i32 %147, %146
  store i32 %148, ptr %9, align 4
  %149 = load i32, ptr %11, align 4
  %150 = load i32, ptr %10, align 4
  %151 = sub i32 %150, %149
  store i32 %151, ptr %10, align 4
  %152 = load i32, ptr %9, align 4
  %153 = load i32, ptr %10, align 4
  %154 = sub i32 %153, %152
  store i32 %154, ptr %10, align 4
  %155 = load i32, ptr %9, align 4
  %156 = lshr i32 %155, 12
  %157 = load i32, ptr %10, align 4
  %158 = xor i32 %157, %156
  store i32 %158, ptr %10, align 4
  %159 = load i32, ptr %9, align 4
  %160 = load i32, ptr %11, align 4
  %161 = sub i32 %160, %159
  store i32 %161, ptr %11, align 4
  %162 = load i32, ptr %10, align 4
  %163 = load i32, ptr %11, align 4
  %164 = sub i32 %163, %162
  store i32 %164, ptr %11, align 4
  %165 = load i32, ptr %10, align 4
  %166 = shl i32 %165, 16
  %167 = load i32, ptr %11, align 4
  %168 = xor i32 %167, %166
  store i32 %168, ptr %11, align 4
  %169 = load i32, ptr %10, align 4
  %170 = load i32, ptr %9, align 4
  %171 = sub i32 %170, %169
  store i32 %171, ptr %9, align 4
  %172 = load i32, ptr %11, align 4
  %173 = load i32, ptr %9, align 4
  %174 = sub i32 %173, %172
  store i32 %174, ptr %9, align 4
  %175 = load i32, ptr %11, align 4
  %176 = lshr i32 %175, 5
  %177 = load i32, ptr %9, align 4
  %178 = xor i32 %177, %176
  store i32 %178, ptr %9, align 4
  %179 = load i32, ptr %11, align 4
  %180 = load i32, ptr %10, align 4
  %181 = sub i32 %180, %179
  store i32 %181, ptr %10, align 4
  %182 = load i32, ptr %9, align 4
  %183 = load i32, ptr %10, align 4
  %184 = sub i32 %183, %182
  store i32 %184, ptr %10, align 4
  %185 = load i32, ptr %9, align 4
  %186 = lshr i32 %185, 3
  %187 = load i32, ptr %10, align 4
  %188 = xor i32 %187, %186
  store i32 %188, ptr %10, align 4
  %189 = load i32, ptr %9, align 4
  %190 = load i32, ptr %11, align 4
  %191 = sub i32 %190, %189
  store i32 %191, ptr %11, align 4
  %192 = load i32, ptr %10, align 4
  %193 = load i32, ptr %11, align 4
  %194 = sub i32 %193, %192
  store i32 %194, ptr %11, align 4
  %195 = load i32, ptr %10, align 4
  %196 = shl i32 %195, 10
  %197 = load i32, ptr %11, align 4
  %198 = xor i32 %197, %196
  store i32 %198, ptr %11, align 4
  %199 = load i32, ptr %10, align 4
  %200 = load i32, ptr %9, align 4
  %201 = sub i32 %200, %199
  store i32 %201, ptr %9, align 4
  %202 = load i32, ptr %11, align 4
  %203 = load i32, ptr %9, align 4
  %204 = sub i32 %203, %202
  store i32 %204, ptr %9, align 4
  %205 = load i32, ptr %11, align 4
  %206 = lshr i32 %205, 15
  %207 = load i32, ptr %9, align 4
  %208 = xor i32 %207, %206
  store i32 %208, ptr %9, align 4
  br label %209

209:                                              ; preds = %118
  %210 = load ptr, ptr %13, align 8
  %211 = getelementptr inbounds i8, ptr %210, i64 12
  store ptr %211, ptr %13, align 8
  %212 = load i32, ptr %12, align 4
  %213 = sub i32 %212, 12
  store i32 %213, ptr %12, align 4
  br label %42, !llvm.loop !21

214:                                              ; preds = %42
  %215 = load i32, ptr %8, align 4
  %216 = load i32, ptr %9, align 4
  %217 = add i32 %216, %215
  store i32 %217, ptr %9, align 4
  %218 = load i32, ptr %12, align 4
  switch i32 %218, label %305 [
    i32 11, label %219
    i32 10, label %227
    i32 9, label %235
    i32 8, label %243
    i32 7, label %251
    i32 6, label %259
    i32 5, label %267
    i32 4, label %274
    i32 3, label %282
    i32 2, label %290
    i32 1, label %298
  ]

219:                                              ; preds = %214
  %220 = load ptr, ptr %13, align 8
  %221 = getelementptr inbounds i8, ptr %220, i64 10
  %222 = load i8, ptr %221, align 1
  %223 = zext i8 %222 to i32
  %224 = shl i32 %223, 24
  %225 = load i32, ptr %9, align 4
  %226 = add i32 %225, %224
  store i32 %226, ptr %9, align 4
  br label %227

227:                                              ; preds = %214, %219
  %228 = load ptr, ptr %13, align 8
  %229 = getelementptr inbounds i8, ptr %228, i64 9
  %230 = load i8, ptr %229, align 1
  %231 = zext i8 %230 to i32
  %232 = shl i32 %231, 16
  %233 = load i32, ptr %9, align 4
  %234 = add i32 %233, %232
  store i32 %234, ptr %9, align 4
  br label %235

235:                                              ; preds = %214, %227
  %236 = load ptr, ptr %13, align 8
  %237 = getelementptr inbounds i8, ptr %236, i64 8
  %238 = load i8, ptr %237, align 1
  %239 = zext i8 %238 to i32
  %240 = shl i32 %239, 8
  %241 = load i32, ptr %9, align 4
  %242 = add i32 %241, %240
  store i32 %242, ptr %9, align 4
  br label %243

243:                                              ; preds = %214, %235
  %244 = load ptr, ptr %13, align 8
  %245 = getelementptr inbounds i8, ptr %244, i64 7
  %246 = load i8, ptr %245, align 1
  %247 = zext i8 %246 to i32
  %248 = shl i32 %247, 24
  %249 = load i32, ptr %11, align 4
  %250 = add i32 %249, %248
  store i32 %250, ptr %11, align 4
  br label %251

251:                                              ; preds = %214, %243
  %252 = load ptr, ptr %13, align 8
  %253 = getelementptr inbounds i8, ptr %252, i64 6
  %254 = load i8, ptr %253, align 1
  %255 = zext i8 %254 to i32
  %256 = shl i32 %255, 16
  %257 = load i32, ptr %11, align 4
  %258 = add i32 %257, %256
  store i32 %258, ptr %11, align 4
  br label %259

259:                                              ; preds = %214, %251
  %260 = load ptr, ptr %13, align 8
  %261 = getelementptr inbounds i8, ptr %260, i64 5
  %262 = load i8, ptr %261, align 1
  %263 = zext i8 %262 to i32
  %264 = shl i32 %263, 8
  %265 = load i32, ptr %11, align 4
  %266 = add i32 %265, %264
  store i32 %266, ptr %11, align 4
  br label %267

267:                                              ; preds = %214, %259
  %268 = load ptr, ptr %13, align 8
  %269 = getelementptr inbounds i8, ptr %268, i64 4
  %270 = load i8, ptr %269, align 1
  %271 = zext i8 %270 to i32
  %272 = load i32, ptr %11, align 4
  %273 = add i32 %272, %271
  store i32 %273, ptr %11, align 4
  br label %274

274:                                              ; preds = %214, %267
  %275 = load ptr, ptr %13, align 8
  %276 = getelementptr inbounds i8, ptr %275, i64 3
  %277 = load i8, ptr %276, align 1
  %278 = zext i8 %277 to i32
  %279 = shl i32 %278, 24
  %280 = load i32, ptr %10, align 4
  %281 = add i32 %280, %279
  store i32 %281, ptr %10, align 4
  br label %282

282:                                              ; preds = %214, %274
  %283 = load ptr, ptr %13, align 8
  %284 = getelementptr inbounds i8, ptr %283, i64 2
  %285 = load i8, ptr %284, align 1
  %286 = zext i8 %285 to i32
  %287 = shl i32 %286, 16
  %288 = load i32, ptr %10, align 4
  %289 = add i32 %288, %287
  store i32 %289, ptr %10, align 4
  br label %290

290:                                              ; preds = %214, %282
  %291 = load ptr, ptr %13, align 8
  %292 = getelementptr inbounds i8, ptr %291, i64 1
  %293 = load i8, ptr %292, align 1
  %294 = zext i8 %293 to i32
  %295 = shl i32 %294, 8
  %296 = load i32, ptr %10, align 4
  %297 = add i32 %296, %295
  store i32 %297, ptr %10, align 4
  br label %298

298:                                              ; preds = %214, %290
  %299 = load ptr, ptr %13, align 8
  %300 = getelementptr inbounds i8, ptr %299, i64 0
  %301 = load i8, ptr %300, align 1
  %302 = zext i8 %301 to i32
  %303 = load i32, ptr %10, align 4
  %304 = add i32 %303, %302
  store i32 %304, ptr %10, align 4
  br label %305

305:                                              ; preds = %214, %298
  br label %306

306:                                              ; preds = %305
  br label %307

307:                                              ; preds = %306
  %308 = load i32, ptr %11, align 4
  %309 = load i32, ptr %10, align 4
  %310 = sub i32 %309, %308
  store i32 %310, ptr %10, align 4
  %311 = load i32, ptr %9, align 4
  %312 = load i32, ptr %10, align 4
  %313 = sub i32 %312, %311
  store i32 %313, ptr %10, align 4
  %314 = load i32, ptr %9, align 4
  %315 = lshr i32 %314, 13
  %316 = load i32, ptr %10, align 4
  %317 = xor i32 %316, %315
  store i32 %317, ptr %10, align 4
  %318 = load i32, ptr %9, align 4
  %319 = load i32, ptr %11, align 4
  %320 = sub i32 %319, %318
  store i32 %320, ptr %11, align 4
  %321 = load i32, ptr %10, align 4
  %322 = load i32, ptr %11, align 4
  %323 = sub i32 %322, %321
  store i32 %323, ptr %11, align 4
  %324 = load i32, ptr %10, align 4
  %325 = shl i32 %324, 8
  %326 = load i32, ptr %11, align 4
  %327 = xor i32 %326, %325
  store i32 %327, ptr %11, align 4
  %328 = load i32, ptr %10, align 4
  %329 = load i32, ptr %9, align 4
  %330 = sub i32 %329, %328
  store i32 %330, ptr %9, align 4
  %331 = load i32, ptr %11, align 4
  %332 = load i32, ptr %9, align 4
  %333 = sub i32 %332, %331
  store i32 %333, ptr %9, align 4
  %334 = load i32, ptr %11, align 4
  %335 = lshr i32 %334, 13
  %336 = load i32, ptr %9, align 4
  %337 = xor i32 %336, %335
  store i32 %337, ptr %9, align 4
  %338 = load i32, ptr %11, align 4
  %339 = load i32, ptr %10, align 4
  %340 = sub i32 %339, %338
  store i32 %340, ptr %10, align 4
  %341 = load i32, ptr %9, align 4
  %342 = load i32, ptr %10, align 4
  %343 = sub i32 %342, %341
  store i32 %343, ptr %10, align 4
  %344 = load i32, ptr %9, align 4
  %345 = lshr i32 %344, 12
  %346 = load i32, ptr %10, align 4
  %347 = xor i32 %346, %345
  store i32 %347, ptr %10, align 4
  %348 = load i32, ptr %9, align 4
  %349 = load i32, ptr %11, align 4
  %350 = sub i32 %349, %348
  store i32 %350, ptr %11, align 4
  %351 = load i32, ptr %10, align 4
  %352 = load i32, ptr %11, align 4
  %353 = sub i32 %352, %351
  store i32 %353, ptr %11, align 4
  %354 = load i32, ptr %10, align 4
  %355 = shl i32 %354, 16
  %356 = load i32, ptr %11, align 4
  %357 = xor i32 %356, %355
  store i32 %357, ptr %11, align 4
  %358 = load i32, ptr %10, align 4
  %359 = load i32, ptr %9, align 4
  %360 = sub i32 %359, %358
  store i32 %360, ptr %9, align 4
  %361 = load i32, ptr %11, align 4
  %362 = load i32, ptr %9, align 4
  %363 = sub i32 %362, %361
  store i32 %363, ptr %9, align 4
  %364 = load i32, ptr %11, align 4
  %365 = lshr i32 %364, 5
  %366 = load i32, ptr %9, align 4
  %367 = xor i32 %366, %365
  store i32 %367, ptr %9, align 4
  %368 = load i32, ptr %11, align 4
  %369 = load i32, ptr %10, align 4
  %370 = sub i32 %369, %368
  store i32 %370, ptr %10, align 4
  %371 = load i32, ptr %9, align 4
  %372 = load i32, ptr %10, align 4
  %373 = sub i32 %372, %371
  store i32 %373, ptr %10, align 4
  %374 = load i32, ptr %9, align 4
  %375 = lshr i32 %374, 3
  %376 = load i32, ptr %10, align 4
  %377 = xor i32 %376, %375
  store i32 %377, ptr %10, align 4
  %378 = load i32, ptr %9, align 4
  %379 = load i32, ptr %11, align 4
  %380 = sub i32 %379, %378
  store i32 %380, ptr %11, align 4
  %381 = load i32, ptr %10, align 4
  %382 = load i32, ptr %11, align 4
  %383 = sub i32 %382, %381
  store i32 %383, ptr %11, align 4
  %384 = load i32, ptr %10, align 4
  %385 = shl i32 %384, 10
  %386 = load i32, ptr %11, align 4
  %387 = xor i32 %386, %385
  store i32 %387, ptr %11, align 4
  %388 = load i32, ptr %10, align 4
  %389 = load i32, ptr %9, align 4
  %390 = sub i32 %389, %388
  store i32 %390, ptr %9, align 4
  %391 = load i32, ptr %11, align 4
  %392 = load i32, ptr %9, align 4
  %393 = sub i32 %392, %391
  store i32 %393, ptr %9, align 4
  %394 = load i32, ptr %11, align 4
  %395 = lshr i32 %394, 15
  %396 = load i32, ptr %9, align 4
  %397 = xor i32 %396, %395
  store i32 %397, ptr %9, align 4
  br label %398

398:                                              ; preds = %307
  br label %399

399:                                              ; preds = %398
  br label %400

400:                                              ; preds = %399
  br label %401

401:                                              ; preds = %400
  store ptr null, ptr %7, align 8
  %402 = load ptr, ptr %4, align 8
  %403 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %402, i32 0, i32 0
  %404 = load ptr, ptr %403, align 8
  %405 = icmp ne ptr %404, null
  br i1 %405, label %406, label %519

406:                                              ; preds = %401
  br label %407

407:                                              ; preds = %406
  %408 = load i32, ptr %9, align 4
  %409 = load ptr, ptr %4, align 8
  %410 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %409, i32 0, i32 0
  %411 = load ptr, ptr %410, align 8
  %412 = getelementptr inbounds nuw %struct.VariableEntry, ptr %411, i32 0, i32 2
  %413 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %412, i32 0, i32 0
  %414 = load ptr, ptr %413, align 8
  %415 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %414, i32 0, i32 1
  %416 = load i32, ptr %415, align 8
  %417 = sub i32 %416, 1
  %418 = and i32 %408, %417
  store i32 %418, ptr %14, align 4
  br label %419

419:                                              ; preds = %407
  br label %420

420:                                              ; preds = %419
  %421 = load ptr, ptr %4, align 8
  %422 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %421, i32 0, i32 0
  %423 = load ptr, ptr %422, align 8
  %424 = getelementptr inbounds nuw %struct.VariableEntry, ptr %423, i32 0, i32 2
  %425 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %424, i32 0, i32 0
  %426 = load ptr, ptr %425, align 8
  %427 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %426, i32 0, i32 0
  %428 = load ptr, ptr %427, align 8
  %429 = load i32, ptr %14, align 4
  %430 = zext i32 %429 to i64
  %431 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %428, i64 %430
  %432 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %431, i32 0, i32 0
  %433 = load ptr, ptr %432, align 8
  %434 = icmp ne ptr %433, null
  br i1 %434, label %435, label %461

435:                                              ; preds = %420
  br label %436

436:                                              ; preds = %435
  %437 = load ptr, ptr %4, align 8
  %438 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %437, i32 0, i32 0
  %439 = load ptr, ptr %438, align 8
  %440 = getelementptr inbounds nuw %struct.VariableEntry, ptr %439, i32 0, i32 2
  %441 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %440, i32 0, i32 0
  %442 = load ptr, ptr %441, align 8
  %443 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %442, i32 0, i32 0
  %444 = load ptr, ptr %443, align 8
  %445 = load i32, ptr %14, align 4
  %446 = zext i32 %445 to i64
  %447 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %444, i64 %446
  %448 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %447, i32 0, i32 0
  %449 = load ptr, ptr %448, align 8
  %450 = load ptr, ptr %4, align 8
  %451 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %450, i32 0, i32 0
  %452 = load ptr, ptr %451, align 8
  %453 = getelementptr inbounds nuw %struct.VariableEntry, ptr %452, i32 0, i32 2
  %454 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %453, i32 0, i32 0
  %455 = load ptr, ptr %454, align 8
  %456 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %455, i32 0, i32 5
  %457 = load i64, ptr %456, align 8
  %458 = sub i64 0, %457
  %459 = getelementptr inbounds i8, ptr %449, i64 %458
  store ptr %459, ptr %7, align 8
  br label %460

460:                                              ; preds = %436
  br label %462

461:                                              ; preds = %420
  store ptr null, ptr %7, align 8
  br label %462

462:                                              ; preds = %461, %460
  br label %463

463:                                              ; preds = %516, %462
  %464 = load ptr, ptr %7, align 8
  %465 = icmp ne ptr %464, null
  br i1 %465, label %466, label %517

466:                                              ; preds = %463
  %467 = load ptr, ptr %7, align 8
  %468 = getelementptr inbounds nuw %struct.VariableEntry, ptr %467, i32 0, i32 2
  %469 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %468, i32 0, i32 7
  %470 = load i32, ptr %469, align 4
  %471 = load i32, ptr %9, align 4
  %472 = icmp eq i32 %470, %471
  br i1 %472, label %473, label %492

473:                                              ; preds = %466
  %474 = load ptr, ptr %7, align 8
  %475 = getelementptr inbounds nuw %struct.VariableEntry, ptr %474, i32 0, i32 2
  %476 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %475, i32 0, i32 6
  %477 = load i32, ptr %476, align 8
  %478 = load i32, ptr %8, align 4
  %479 = icmp eq i32 %477, %478
  br i1 %479, label %480, label %492

480:                                              ; preds = %473
  %481 = load ptr, ptr %7, align 8
  %482 = getelementptr inbounds nuw %struct.VariableEntry, ptr %481, i32 0, i32 2
  %483 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %482, i32 0, i32 5
  %484 = load ptr, ptr %483, align 8
  %485 = load ptr, ptr %5, align 8
  %486 = load i32, ptr %8, align 4
  %487 = zext i32 %486 to i64
  %488 = call i32 @memcmp(ptr noundef %484, ptr noundef %485, i64 noundef %487)
  %489 = icmp eq i32 %488, 0
  br i1 %489, label %490, label %491

490:                                              ; preds = %480
  br label %517

491:                                              ; preds = %480
  br label %492

492:                                              ; preds = %491, %473, %466
  %493 = load ptr, ptr %7, align 8
  %494 = getelementptr inbounds nuw %struct.VariableEntry, ptr %493, i32 0, i32 2
  %495 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %494, i32 0, i32 4
  %496 = load ptr, ptr %495, align 8
  %497 = icmp ne ptr %496, null
  br i1 %497, label %498, label %515

498:                                              ; preds = %492
  br label %499

499:                                              ; preds = %498
  %500 = load ptr, ptr %7, align 8
  %501 = getelementptr inbounds nuw %struct.VariableEntry, ptr %500, i32 0, i32 2
  %502 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %501, i32 0, i32 4
  %503 = load ptr, ptr %502, align 8
  %504 = load ptr, ptr %4, align 8
  %505 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %504, i32 0, i32 0
  %506 = load ptr, ptr %505, align 8
  %507 = getelementptr inbounds nuw %struct.VariableEntry, ptr %506, i32 0, i32 2
  %508 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %507, i32 0, i32 0
  %509 = load ptr, ptr %508, align 8
  %510 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %509, i32 0, i32 5
  %511 = load i64, ptr %510, align 8
  %512 = sub i64 0, %511
  %513 = getelementptr inbounds i8, ptr %503, i64 %512
  store ptr %513, ptr %7, align 8
  br label %514

514:                                              ; preds = %499
  br label %516

515:                                              ; preds = %492
  store ptr null, ptr %7, align 8
  br label %516

516:                                              ; preds = %515, %514
  br label %463, !llvm.loop !22

517:                                              ; preds = %490, %463
  br label %518

518:                                              ; preds = %517
  br label %519

519:                                              ; preds = %518, %401
  br label %520

520:                                              ; preds = %519
  br label %521

521:                                              ; preds = %520, %32
  br label %522

522:                                              ; preds = %521
  br label %523

523:                                              ; preds = %522
  %524 = load ptr, ptr %7, align 8
  %525 = icmp ne ptr %524, null
  br i1 %525, label %526, label %530

526:                                              ; preds = %523
  %527 = load i64, ptr %6, align 8
  %528 = load ptr, ptr %7, align 8
  %529 = getelementptr inbounds nuw %struct.VariableEntry, ptr %528, i32 0, i32 1
  store i64 %527, ptr %529, align 8
  br label %1415

530:                                              ; preds = %523
  %531 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %531, ptr %7, align 8
  %532 = load ptr, ptr %5, align 8
  %533 = call noalias ptr @strdup(ptr noundef %532)
  %534 = load ptr, ptr %7, align 8
  %535 = getelementptr inbounds nuw %struct.VariableEntry, ptr %534, i32 0, i32 0
  store ptr %533, ptr %535, align 8
  %536 = load i64, ptr %6, align 8
  %537 = load ptr, ptr %7, align 8
  %538 = getelementptr inbounds nuw %struct.VariableEntry, ptr %537, i32 0, i32 1
  store i64 %536, ptr %538, align 8
  br label %539

539:                                              ; preds = %530
  br label %540

540:                                              ; preds = %539
  br label %541

541:                                              ; preds = %540
  %542 = load ptr, ptr %7, align 8
  %543 = getelementptr inbounds nuw %struct.VariableEntry, ptr %542, i32 0, i32 0
  %544 = load ptr, ptr %543, align 8
  store ptr %544, ptr %19, align 8
  store i32 -17973521, ptr %15, align 4
  store i32 -1640531527, ptr %17, align 4
  store i32 -1640531527, ptr %16, align 4
  %545 = load ptr, ptr %7, align 8
  %546 = getelementptr inbounds nuw %struct.VariableEntry, ptr %545, i32 0, i32 0
  %547 = load ptr, ptr %546, align 8
  %548 = call i64 @strlen(ptr noundef %547)
  %549 = trunc i64 %548 to i32
  store i32 %549, ptr %18, align 4
  br label %550

550:                                              ; preds = %717, %541
  %551 = load i32, ptr %18, align 4
  %552 = icmp uge i32 %551, 12
  br i1 %552, label %553, label %722

553:                                              ; preds = %550
  %554 = load ptr, ptr %19, align 8
  %555 = getelementptr inbounds i8, ptr %554, i64 0
  %556 = load i8, ptr %555, align 1
  %557 = zext i8 %556 to i32
  %558 = load ptr, ptr %19, align 8
  %559 = getelementptr inbounds i8, ptr %558, i64 1
  %560 = load i8, ptr %559, align 1
  %561 = zext i8 %560 to i32
  %562 = shl i32 %561, 8
  %563 = add i32 %557, %562
  %564 = load ptr, ptr %19, align 8
  %565 = getelementptr inbounds i8, ptr %564, i64 2
  %566 = load i8, ptr %565, align 1
  %567 = zext i8 %566 to i32
  %568 = shl i32 %567, 16
  %569 = add i32 %563, %568
  %570 = load ptr, ptr %19, align 8
  %571 = getelementptr inbounds i8, ptr %570, i64 3
  %572 = load i8, ptr %571, align 1
  %573 = zext i8 %572 to i32
  %574 = shl i32 %573, 24
  %575 = add i32 %569, %574
  %576 = load i32, ptr %16, align 4
  %577 = add i32 %576, %575
  store i32 %577, ptr %16, align 4
  %578 = load ptr, ptr %19, align 8
  %579 = getelementptr inbounds i8, ptr %578, i64 4
  %580 = load i8, ptr %579, align 1
  %581 = zext i8 %580 to i32
  %582 = load ptr, ptr %19, align 8
  %583 = getelementptr inbounds i8, ptr %582, i64 5
  %584 = load i8, ptr %583, align 1
  %585 = zext i8 %584 to i32
  %586 = shl i32 %585, 8
  %587 = add i32 %581, %586
  %588 = load ptr, ptr %19, align 8
  %589 = getelementptr inbounds i8, ptr %588, i64 6
  %590 = load i8, ptr %589, align 1
  %591 = zext i8 %590 to i32
  %592 = shl i32 %591, 16
  %593 = add i32 %587, %592
  %594 = load ptr, ptr %19, align 8
  %595 = getelementptr inbounds i8, ptr %594, i64 7
  %596 = load i8, ptr %595, align 1
  %597 = zext i8 %596 to i32
  %598 = shl i32 %597, 24
  %599 = add i32 %593, %598
  %600 = load i32, ptr %17, align 4
  %601 = add i32 %600, %599
  store i32 %601, ptr %17, align 4
  %602 = load ptr, ptr %19, align 8
  %603 = getelementptr inbounds i8, ptr %602, i64 8
  %604 = load i8, ptr %603, align 1
  %605 = zext i8 %604 to i32
  %606 = load ptr, ptr %19, align 8
  %607 = getelementptr inbounds i8, ptr %606, i64 9
  %608 = load i8, ptr %607, align 1
  %609 = zext i8 %608 to i32
  %610 = shl i32 %609, 8
  %611 = add i32 %605, %610
  %612 = load ptr, ptr %19, align 8
  %613 = getelementptr inbounds i8, ptr %612, i64 10
  %614 = load i8, ptr %613, align 1
  %615 = zext i8 %614 to i32
  %616 = shl i32 %615, 16
  %617 = add i32 %611, %616
  %618 = load ptr, ptr %19, align 8
  %619 = getelementptr inbounds i8, ptr %618, i64 11
  %620 = load i8, ptr %619, align 1
  %621 = zext i8 %620 to i32
  %622 = shl i32 %621, 24
  %623 = add i32 %617, %622
  %624 = load i32, ptr %15, align 4
  %625 = add i32 %624, %623
  store i32 %625, ptr %15, align 4
  br label %626

626:                                              ; preds = %553
  %627 = load i32, ptr %17, align 4
  %628 = load i32, ptr %16, align 4
  %629 = sub i32 %628, %627
  store i32 %629, ptr %16, align 4
  %630 = load i32, ptr %15, align 4
  %631 = load i32, ptr %16, align 4
  %632 = sub i32 %631, %630
  store i32 %632, ptr %16, align 4
  %633 = load i32, ptr %15, align 4
  %634 = lshr i32 %633, 13
  %635 = load i32, ptr %16, align 4
  %636 = xor i32 %635, %634
  store i32 %636, ptr %16, align 4
  %637 = load i32, ptr %15, align 4
  %638 = load i32, ptr %17, align 4
  %639 = sub i32 %638, %637
  store i32 %639, ptr %17, align 4
  %640 = load i32, ptr %16, align 4
  %641 = load i32, ptr %17, align 4
  %642 = sub i32 %641, %640
  store i32 %642, ptr %17, align 4
  %643 = load i32, ptr %16, align 4
  %644 = shl i32 %643, 8
  %645 = load i32, ptr %17, align 4
  %646 = xor i32 %645, %644
  store i32 %646, ptr %17, align 4
  %647 = load i32, ptr %16, align 4
  %648 = load i32, ptr %15, align 4
  %649 = sub i32 %648, %647
  store i32 %649, ptr %15, align 4
  %650 = load i32, ptr %17, align 4
  %651 = load i32, ptr %15, align 4
  %652 = sub i32 %651, %650
  store i32 %652, ptr %15, align 4
  %653 = load i32, ptr %17, align 4
  %654 = lshr i32 %653, 13
  %655 = load i32, ptr %15, align 4
  %656 = xor i32 %655, %654
  store i32 %656, ptr %15, align 4
  %657 = load i32, ptr %17, align 4
  %658 = load i32, ptr %16, align 4
  %659 = sub i32 %658, %657
  store i32 %659, ptr %16, align 4
  %660 = load i32, ptr %15, align 4
  %661 = load i32, ptr %16, align 4
  %662 = sub i32 %661, %660
  store i32 %662, ptr %16, align 4
  %663 = load i32, ptr %15, align 4
  %664 = lshr i32 %663, 12
  %665 = load i32, ptr %16, align 4
  %666 = xor i32 %665, %664
  store i32 %666, ptr %16, align 4
  %667 = load i32, ptr %15, align 4
  %668 = load i32, ptr %17, align 4
  %669 = sub i32 %668, %667
  store i32 %669, ptr %17, align 4
  %670 = load i32, ptr %16, align 4
  %671 = load i32, ptr %17, align 4
  %672 = sub i32 %671, %670
  store i32 %672, ptr %17, align 4
  %673 = load i32, ptr %16, align 4
  %674 = shl i32 %673, 16
  %675 = load i32, ptr %17, align 4
  %676 = xor i32 %675, %674
  store i32 %676, ptr %17, align 4
  %677 = load i32, ptr %16, align 4
  %678 = load i32, ptr %15, align 4
  %679 = sub i32 %678, %677
  store i32 %679, ptr %15, align 4
  %680 = load i32, ptr %17, align 4
  %681 = load i32, ptr %15, align 4
  %682 = sub i32 %681, %680
  store i32 %682, ptr %15, align 4
  %683 = load i32, ptr %17, align 4
  %684 = lshr i32 %683, 5
  %685 = load i32, ptr %15, align 4
  %686 = xor i32 %685, %684
  store i32 %686, ptr %15, align 4
  %687 = load i32, ptr %17, align 4
  %688 = load i32, ptr %16, align 4
  %689 = sub i32 %688, %687
  store i32 %689, ptr %16, align 4
  %690 = load i32, ptr %15, align 4
  %691 = load i32, ptr %16, align 4
  %692 = sub i32 %691, %690
  store i32 %692, ptr %16, align 4
  %693 = load i32, ptr %15, align 4
  %694 = lshr i32 %693, 3
  %695 = load i32, ptr %16, align 4
  %696 = xor i32 %695, %694
  store i32 %696, ptr %16, align 4
  %697 = load i32, ptr %15, align 4
  %698 = load i32, ptr %17, align 4
  %699 = sub i32 %698, %697
  store i32 %699, ptr %17, align 4
  %700 = load i32, ptr %16, align 4
  %701 = load i32, ptr %17, align 4
  %702 = sub i32 %701, %700
  store i32 %702, ptr %17, align 4
  %703 = load i32, ptr %16, align 4
  %704 = shl i32 %703, 10
  %705 = load i32, ptr %17, align 4
  %706 = xor i32 %705, %704
  store i32 %706, ptr %17, align 4
  %707 = load i32, ptr %16, align 4
  %708 = load i32, ptr %15, align 4
  %709 = sub i32 %708, %707
  store i32 %709, ptr %15, align 4
  %710 = load i32, ptr %17, align 4
  %711 = load i32, ptr %15, align 4
  %712 = sub i32 %711, %710
  store i32 %712, ptr %15, align 4
  %713 = load i32, ptr %17, align 4
  %714 = lshr i32 %713, 15
  %715 = load i32, ptr %15, align 4
  %716 = xor i32 %715, %714
  store i32 %716, ptr %15, align 4
  br label %717

717:                                              ; preds = %626
  %718 = load ptr, ptr %19, align 8
  %719 = getelementptr inbounds i8, ptr %718, i64 12
  store ptr %719, ptr %19, align 8
  %720 = load i32, ptr %18, align 4
  %721 = sub i32 %720, 12
  store i32 %721, ptr %18, align 4
  br label %550, !llvm.loop !23

722:                                              ; preds = %550
  %723 = load ptr, ptr %7, align 8
  %724 = getelementptr inbounds nuw %struct.VariableEntry, ptr %723, i32 0, i32 0
  %725 = load ptr, ptr %724, align 8
  %726 = call i64 @strlen(ptr noundef %725)
  %727 = trunc i64 %726 to i32
  %728 = load i32, ptr %15, align 4
  %729 = add i32 %728, %727
  store i32 %729, ptr %15, align 4
  %730 = load i32, ptr %18, align 4
  switch i32 %730, label %817 [
    i32 11, label %731
    i32 10, label %739
    i32 9, label %747
    i32 8, label %755
    i32 7, label %763
    i32 6, label %771
    i32 5, label %779
    i32 4, label %786
    i32 3, label %794
    i32 2, label %802
    i32 1, label %810
  ]

731:                                              ; preds = %722
  %732 = load ptr, ptr %19, align 8
  %733 = getelementptr inbounds i8, ptr %732, i64 10
  %734 = load i8, ptr %733, align 1
  %735 = zext i8 %734 to i32
  %736 = shl i32 %735, 24
  %737 = load i32, ptr %15, align 4
  %738 = add i32 %737, %736
  store i32 %738, ptr %15, align 4
  br label %739

739:                                              ; preds = %722, %731
  %740 = load ptr, ptr %19, align 8
  %741 = getelementptr inbounds i8, ptr %740, i64 9
  %742 = load i8, ptr %741, align 1
  %743 = zext i8 %742 to i32
  %744 = shl i32 %743, 16
  %745 = load i32, ptr %15, align 4
  %746 = add i32 %745, %744
  store i32 %746, ptr %15, align 4
  br label %747

747:                                              ; preds = %722, %739
  %748 = load ptr, ptr %19, align 8
  %749 = getelementptr inbounds i8, ptr %748, i64 8
  %750 = load i8, ptr %749, align 1
  %751 = zext i8 %750 to i32
  %752 = shl i32 %751, 8
  %753 = load i32, ptr %15, align 4
  %754 = add i32 %753, %752
  store i32 %754, ptr %15, align 4
  br label %755

755:                                              ; preds = %722, %747
  %756 = load ptr, ptr %19, align 8
  %757 = getelementptr inbounds i8, ptr %756, i64 7
  %758 = load i8, ptr %757, align 1
  %759 = zext i8 %758 to i32
  %760 = shl i32 %759, 24
  %761 = load i32, ptr %17, align 4
  %762 = add i32 %761, %760
  store i32 %762, ptr %17, align 4
  br label %763

763:                                              ; preds = %722, %755
  %764 = load ptr, ptr %19, align 8
  %765 = getelementptr inbounds i8, ptr %764, i64 6
  %766 = load i8, ptr %765, align 1
  %767 = zext i8 %766 to i32
  %768 = shl i32 %767, 16
  %769 = load i32, ptr %17, align 4
  %770 = add i32 %769, %768
  store i32 %770, ptr %17, align 4
  br label %771

771:                                              ; preds = %722, %763
  %772 = load ptr, ptr %19, align 8
  %773 = getelementptr inbounds i8, ptr %772, i64 5
  %774 = load i8, ptr %773, align 1
  %775 = zext i8 %774 to i32
  %776 = shl i32 %775, 8
  %777 = load i32, ptr %17, align 4
  %778 = add i32 %777, %776
  store i32 %778, ptr %17, align 4
  br label %779

779:                                              ; preds = %722, %771
  %780 = load ptr, ptr %19, align 8
  %781 = getelementptr inbounds i8, ptr %780, i64 4
  %782 = load i8, ptr %781, align 1
  %783 = zext i8 %782 to i32
  %784 = load i32, ptr %17, align 4
  %785 = add i32 %784, %783
  store i32 %785, ptr %17, align 4
  br label %786

786:                                              ; preds = %722, %779
  %787 = load ptr, ptr %19, align 8
  %788 = getelementptr inbounds i8, ptr %787, i64 3
  %789 = load i8, ptr %788, align 1
  %790 = zext i8 %789 to i32
  %791 = shl i32 %790, 24
  %792 = load i32, ptr %16, align 4
  %793 = add i32 %792, %791
  store i32 %793, ptr %16, align 4
  br label %794

794:                                              ; preds = %722, %786
  %795 = load ptr, ptr %19, align 8
  %796 = getelementptr inbounds i8, ptr %795, i64 2
  %797 = load i8, ptr %796, align 1
  %798 = zext i8 %797 to i32
  %799 = shl i32 %798, 16
  %800 = load i32, ptr %16, align 4
  %801 = add i32 %800, %799
  store i32 %801, ptr %16, align 4
  br label %802

802:                                              ; preds = %722, %794
  %803 = load ptr, ptr %19, align 8
  %804 = getelementptr inbounds i8, ptr %803, i64 1
  %805 = load i8, ptr %804, align 1
  %806 = zext i8 %805 to i32
  %807 = shl i32 %806, 8
  %808 = load i32, ptr %16, align 4
  %809 = add i32 %808, %807
  store i32 %809, ptr %16, align 4
  br label %810

810:                                              ; preds = %722, %802
  %811 = load ptr, ptr %19, align 8
  %812 = getelementptr inbounds i8, ptr %811, i64 0
  %813 = load i8, ptr %812, align 1
  %814 = zext i8 %813 to i32
  %815 = load i32, ptr %16, align 4
  %816 = add i32 %815, %814
  store i32 %816, ptr %16, align 4
  br label %817

817:                                              ; preds = %722, %810
  br label %818

818:                                              ; preds = %817
  br label %819

819:                                              ; preds = %818
  %820 = load i32, ptr %17, align 4
  %821 = load i32, ptr %16, align 4
  %822 = sub i32 %821, %820
  store i32 %822, ptr %16, align 4
  %823 = load i32, ptr %15, align 4
  %824 = load i32, ptr %16, align 4
  %825 = sub i32 %824, %823
  store i32 %825, ptr %16, align 4
  %826 = load i32, ptr %15, align 4
  %827 = lshr i32 %826, 13
  %828 = load i32, ptr %16, align 4
  %829 = xor i32 %828, %827
  store i32 %829, ptr %16, align 4
  %830 = load i32, ptr %15, align 4
  %831 = load i32, ptr %17, align 4
  %832 = sub i32 %831, %830
  store i32 %832, ptr %17, align 4
  %833 = load i32, ptr %16, align 4
  %834 = load i32, ptr %17, align 4
  %835 = sub i32 %834, %833
  store i32 %835, ptr %17, align 4
  %836 = load i32, ptr %16, align 4
  %837 = shl i32 %836, 8
  %838 = load i32, ptr %17, align 4
  %839 = xor i32 %838, %837
  store i32 %839, ptr %17, align 4
  %840 = load i32, ptr %16, align 4
  %841 = load i32, ptr %15, align 4
  %842 = sub i32 %841, %840
  store i32 %842, ptr %15, align 4
  %843 = load i32, ptr %17, align 4
  %844 = load i32, ptr %15, align 4
  %845 = sub i32 %844, %843
  store i32 %845, ptr %15, align 4
  %846 = load i32, ptr %17, align 4
  %847 = lshr i32 %846, 13
  %848 = load i32, ptr %15, align 4
  %849 = xor i32 %848, %847
  store i32 %849, ptr %15, align 4
  %850 = load i32, ptr %17, align 4
  %851 = load i32, ptr %16, align 4
  %852 = sub i32 %851, %850
  store i32 %852, ptr %16, align 4
  %853 = load i32, ptr %15, align 4
  %854 = load i32, ptr %16, align 4
  %855 = sub i32 %854, %853
  store i32 %855, ptr %16, align 4
  %856 = load i32, ptr %15, align 4
  %857 = lshr i32 %856, 12
  %858 = load i32, ptr %16, align 4
  %859 = xor i32 %858, %857
  store i32 %859, ptr %16, align 4
  %860 = load i32, ptr %15, align 4
  %861 = load i32, ptr %17, align 4
  %862 = sub i32 %861, %860
  store i32 %862, ptr %17, align 4
  %863 = load i32, ptr %16, align 4
  %864 = load i32, ptr %17, align 4
  %865 = sub i32 %864, %863
  store i32 %865, ptr %17, align 4
  %866 = load i32, ptr %16, align 4
  %867 = shl i32 %866, 16
  %868 = load i32, ptr %17, align 4
  %869 = xor i32 %868, %867
  store i32 %869, ptr %17, align 4
  %870 = load i32, ptr %16, align 4
  %871 = load i32, ptr %15, align 4
  %872 = sub i32 %871, %870
  store i32 %872, ptr %15, align 4
  %873 = load i32, ptr %17, align 4
  %874 = load i32, ptr %15, align 4
  %875 = sub i32 %874, %873
  store i32 %875, ptr %15, align 4
  %876 = load i32, ptr %17, align 4
  %877 = lshr i32 %876, 5
  %878 = load i32, ptr %15, align 4
  %879 = xor i32 %878, %877
  store i32 %879, ptr %15, align 4
  %880 = load i32, ptr %17, align 4
  %881 = load i32, ptr %16, align 4
  %882 = sub i32 %881, %880
  store i32 %882, ptr %16, align 4
  %883 = load i32, ptr %15, align 4
  %884 = load i32, ptr %16, align 4
  %885 = sub i32 %884, %883
  store i32 %885, ptr %16, align 4
  %886 = load i32, ptr %15, align 4
  %887 = lshr i32 %886, 3
  %888 = load i32, ptr %16, align 4
  %889 = xor i32 %888, %887
  store i32 %889, ptr %16, align 4
  %890 = load i32, ptr %15, align 4
  %891 = load i32, ptr %17, align 4
  %892 = sub i32 %891, %890
  store i32 %892, ptr %17, align 4
  %893 = load i32, ptr %16, align 4
  %894 = load i32, ptr %17, align 4
  %895 = sub i32 %894, %893
  store i32 %895, ptr %17, align 4
  %896 = load i32, ptr %16, align 4
  %897 = shl i32 %896, 10
  %898 = load i32, ptr %17, align 4
  %899 = xor i32 %898, %897
  store i32 %899, ptr %17, align 4
  %900 = load i32, ptr %16, align 4
  %901 = load i32, ptr %15, align 4
  %902 = sub i32 %901, %900
  store i32 %902, ptr %15, align 4
  %903 = load i32, ptr %17, align 4
  %904 = load i32, ptr %15, align 4
  %905 = sub i32 %904, %903
  store i32 %905, ptr %15, align 4
  %906 = load i32, ptr %17, align 4
  %907 = lshr i32 %906, 15
  %908 = load i32, ptr %15, align 4
  %909 = xor i32 %908, %907
  store i32 %909, ptr %15, align 4
  br label %910

910:                                              ; preds = %819
  br label %911

911:                                              ; preds = %910
  br label %912

912:                                              ; preds = %911
  br label %913

913:                                              ; preds = %912
  %914 = load i32, ptr %15, align 4
  %915 = load ptr, ptr %7, align 8
  %916 = getelementptr inbounds nuw %struct.VariableEntry, ptr %915, i32 0, i32 2
  %917 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %916, i32 0, i32 7
  store i32 %914, ptr %917, align 4
  %918 = load ptr, ptr %7, align 8
  %919 = getelementptr inbounds nuw %struct.VariableEntry, ptr %918, i32 0, i32 0
  %920 = load ptr, ptr %919, align 8
  %921 = load ptr, ptr %7, align 8
  %922 = getelementptr inbounds nuw %struct.VariableEntry, ptr %921, i32 0, i32 2
  %923 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %922, i32 0, i32 5
  store ptr %920, ptr %923, align 8
  %924 = load ptr, ptr %7, align 8
  %925 = getelementptr inbounds nuw %struct.VariableEntry, ptr %924, i32 0, i32 0
  %926 = load ptr, ptr %925, align 8
  %927 = call i64 @strlen(ptr noundef %926)
  %928 = trunc i64 %927 to i32
  %929 = load ptr, ptr %7, align 8
  %930 = getelementptr inbounds nuw %struct.VariableEntry, ptr %929, i32 0, i32 2
  %931 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %930, i32 0, i32 6
  store i32 %928, ptr %931, align 8
  %932 = load ptr, ptr %4, align 8
  %933 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %932, i32 0, i32 0
  %934 = load ptr, ptr %933, align 8
  %935 = icmp ne ptr %934, null
  br i1 %935, label %1019, label %936

936:                                              ; preds = %913
  %937 = load ptr, ptr %7, align 8
  %938 = getelementptr inbounds nuw %struct.VariableEntry, ptr %937, i32 0, i32 2
  %939 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %938, i32 0, i32 2
  store ptr null, ptr %939, align 8
  %940 = load ptr, ptr %7, align 8
  %941 = getelementptr inbounds nuw %struct.VariableEntry, ptr %940, i32 0, i32 2
  %942 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %941, i32 0, i32 1
  store ptr null, ptr %942, align 8
  br label %943

943:                                              ; preds = %936
  %944 = call noalias ptr @malloc(i64 noundef 64)
  %945 = load ptr, ptr %7, align 8
  %946 = getelementptr inbounds nuw %struct.VariableEntry, ptr %945, i32 0, i32 2
  %947 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %946, i32 0, i32 0
  store ptr %944, ptr %947, align 8
  %948 = load ptr, ptr %7, align 8
  %949 = getelementptr inbounds nuw %struct.VariableEntry, ptr %948, i32 0, i32 2
  %950 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %949, i32 0, i32 0
  %951 = load ptr, ptr %950, align 8
  %952 = icmp ne ptr %951, null
  br i1 %952, label %954, label %953

953:                                              ; preds = %943
  call void @exit(i32 noundef -1)
  unreachable

954:                                              ; preds = %943
  %955 = load ptr, ptr %7, align 8
  %956 = getelementptr inbounds nuw %struct.VariableEntry, ptr %955, i32 0, i32 2
  %957 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %956, i32 0, i32 0
  %958 = load ptr, ptr %957, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %958, i8 0, i64 64, i1 false)
  %959 = load ptr, ptr %7, align 8
  %960 = getelementptr inbounds nuw %struct.VariableEntry, ptr %959, i32 0, i32 2
  %961 = load ptr, ptr %7, align 8
  %962 = getelementptr inbounds nuw %struct.VariableEntry, ptr %961, i32 0, i32 2
  %963 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %962, i32 0, i32 0
  %964 = load ptr, ptr %963, align 8
  %965 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %964, i32 0, i32 4
  store ptr %960, ptr %965, align 8
  %966 = load ptr, ptr %7, align 8
  %967 = getelementptr inbounds nuw %struct.VariableEntry, ptr %966, i32 0, i32 2
  %968 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %967, i32 0, i32 0
  %969 = load ptr, ptr %968, align 8
  %970 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %969, i32 0, i32 1
  store i32 32, ptr %970, align 8
  %971 = load ptr, ptr %7, align 8
  %972 = getelementptr inbounds nuw %struct.VariableEntry, ptr %971, i32 0, i32 2
  %973 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %972, i32 0, i32 0
  %974 = load ptr, ptr %973, align 8
  %975 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %974, i32 0, i32 2
  store i32 5, ptr %975, align 4
  %976 = load ptr, ptr %7, align 8
  %977 = getelementptr inbounds nuw %struct.VariableEntry, ptr %976, i32 0, i32 2
  %978 = load ptr, ptr %7, align 8
  %979 = ptrtoint ptr %977 to i64
  %980 = ptrtoint ptr %978 to i64
  %981 = sub i64 %979, %980
  %982 = load ptr, ptr %7, align 8
  %983 = getelementptr inbounds nuw %struct.VariableEntry, ptr %982, i32 0, i32 2
  %984 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %983, i32 0, i32 0
  %985 = load ptr, ptr %984, align 8
  %986 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %985, i32 0, i32 5
  store i64 %981, ptr %986, align 8
  %987 = call noalias ptr @malloc(i64 noundef 512)
  %988 = load ptr, ptr %7, align 8
  %989 = getelementptr inbounds nuw %struct.VariableEntry, ptr %988, i32 0, i32 2
  %990 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %989, i32 0, i32 0
  %991 = load ptr, ptr %990, align 8
  %992 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %991, i32 0, i32 0
  store ptr %987, ptr %992, align 8
  %993 = load ptr, ptr %7, align 8
  %994 = getelementptr inbounds nuw %struct.VariableEntry, ptr %993, i32 0, i32 2
  %995 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %994, i32 0, i32 0
  %996 = load ptr, ptr %995, align 8
  %997 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %996, i32 0, i32 10
  store i32 -1609490463, ptr %997, align 8
  %998 = load ptr, ptr %7, align 8
  %999 = getelementptr inbounds nuw %struct.VariableEntry, ptr %998, i32 0, i32 2
  %1000 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %999, i32 0, i32 0
  %1001 = load ptr, ptr %1000, align 8
  %1002 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1001, i32 0, i32 0
  %1003 = load ptr, ptr %1002, align 8
  %1004 = icmp ne ptr %1003, null
  br i1 %1004, label %1006, label %1005

1005:                                             ; preds = %954
  call void @exit(i32 noundef -1)
  unreachable

1006:                                             ; preds = %954
  %1007 = load ptr, ptr %7, align 8
  %1008 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1007, i32 0, i32 2
  %1009 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1008, i32 0, i32 0
  %1010 = load ptr, ptr %1009, align 8
  %1011 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1010, i32 0, i32 0
  %1012 = load ptr, ptr %1011, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %1012, i8 0, i64 512, i1 false)
  br label %1013

1013:                                             ; preds = %1006
  br label %1014

1014:                                             ; preds = %1013
  br label %1015

1015:                                             ; preds = %1014
  %1016 = load ptr, ptr %7, align 8
  %1017 = load ptr, ptr %4, align 8
  %1018 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1017, i32 0, i32 0
  store ptr %1016, ptr %1018, align 8
  br label %1074

1019:                                             ; preds = %913
  %1020 = load ptr, ptr %4, align 8
  %1021 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1020, i32 0, i32 0
  %1022 = load ptr, ptr %1021, align 8
  %1023 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1022, i32 0, i32 2
  %1024 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1023, i32 0, i32 0
  %1025 = load ptr, ptr %1024, align 8
  %1026 = load ptr, ptr %7, align 8
  %1027 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1026, i32 0, i32 2
  %1028 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1027, i32 0, i32 0
  store ptr %1025, ptr %1028, align 8
  br label %1029

1029:                                             ; preds = %1019
  %1030 = load ptr, ptr %7, align 8
  %1031 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1030, i32 0, i32 2
  %1032 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1031, i32 0, i32 2
  store ptr null, ptr %1032, align 8
  %1033 = load ptr, ptr %4, align 8
  %1034 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1033, i32 0, i32 0
  %1035 = load ptr, ptr %1034, align 8
  %1036 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1035, i32 0, i32 2
  %1037 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1036, i32 0, i32 0
  %1038 = load ptr, ptr %1037, align 8
  %1039 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1038, i32 0, i32 4
  %1040 = load ptr, ptr %1039, align 8
  %1041 = load ptr, ptr %4, align 8
  %1042 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1041, i32 0, i32 0
  %1043 = load ptr, ptr %1042, align 8
  %1044 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1043, i32 0, i32 2
  %1045 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1044, i32 0, i32 0
  %1046 = load ptr, ptr %1045, align 8
  %1047 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1046, i32 0, i32 5
  %1048 = load i64, ptr %1047, align 8
  %1049 = sub i64 0, %1048
  %1050 = getelementptr inbounds i8, ptr %1040, i64 %1049
  %1051 = load ptr, ptr %7, align 8
  %1052 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1051, i32 0, i32 2
  %1053 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1052, i32 0, i32 1
  store ptr %1050, ptr %1053, align 8
  %1054 = load ptr, ptr %7, align 8
  %1055 = load ptr, ptr %4, align 8
  %1056 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1055, i32 0, i32 0
  %1057 = load ptr, ptr %1056, align 8
  %1058 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1057, i32 0, i32 2
  %1059 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1058, i32 0, i32 0
  %1060 = load ptr, ptr %1059, align 8
  %1061 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1060, i32 0, i32 4
  %1062 = load ptr, ptr %1061, align 8
  %1063 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1062, i32 0, i32 2
  store ptr %1054, ptr %1063, align 8
  %1064 = load ptr, ptr %7, align 8
  %1065 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1064, i32 0, i32 2
  %1066 = load ptr, ptr %4, align 8
  %1067 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1066, i32 0, i32 0
  %1068 = load ptr, ptr %1067, align 8
  %1069 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1068, i32 0, i32 2
  %1070 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1069, i32 0, i32 0
  %1071 = load ptr, ptr %1070, align 8
  %1072 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1071, i32 0, i32 4
  store ptr %1065, ptr %1072, align 8
  br label %1073

1073:                                             ; preds = %1029
  br label %1074

1074:                                             ; preds = %1073, %1015
  br label %1075

1075:                                             ; preds = %1074
  %1076 = load ptr, ptr %4, align 8
  %1077 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1076, i32 0, i32 0
  %1078 = load ptr, ptr %1077, align 8
  %1079 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1078, i32 0, i32 2
  %1080 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1079, i32 0, i32 0
  %1081 = load ptr, ptr %1080, align 8
  %1082 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1081, i32 0, i32 3
  %1083 = load i32, ptr %1082, align 8
  %1084 = add i32 %1083, 1
  store i32 %1084, ptr %1082, align 8
  br label %1085

1085:                                             ; preds = %1075
  %1086 = load i32, ptr %15, align 4
  %1087 = load ptr, ptr %4, align 8
  %1088 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1087, i32 0, i32 0
  %1089 = load ptr, ptr %1088, align 8
  %1090 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1089, i32 0, i32 2
  %1091 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1090, i32 0, i32 0
  %1092 = load ptr, ptr %1091, align 8
  %1093 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1092, i32 0, i32 1
  %1094 = load i32, ptr %1093, align 8
  %1095 = sub i32 %1094, 1
  %1096 = and i32 %1086, %1095
  store i32 %1096, ptr %20, align 4
  br label %1097

1097:                                             ; preds = %1085
  br label %1098

1098:                                             ; preds = %1097
  %1099 = load ptr, ptr %4, align 8
  %1100 = getelementptr inbounds nuw %struct.CalculatorInterpreterContext, ptr %1099, i32 0, i32 0
  %1101 = load ptr, ptr %1100, align 8
  %1102 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1101, i32 0, i32 2
  %1103 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1102, i32 0, i32 0
  %1104 = load ptr, ptr %1103, align 8
  %1105 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1104, i32 0, i32 0
  %1106 = load ptr, ptr %1105, align 8
  %1107 = load i32, ptr %20, align 4
  %1108 = zext i32 %1107 to i64
  %1109 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1106, i64 %1108
  store ptr %1109, ptr %21, align 8
  %1110 = load ptr, ptr %21, align 8
  %1111 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1110, i32 0, i32 1
  %1112 = load i32, ptr %1111, align 8
  %1113 = add i32 %1112, 1
  store i32 %1113, ptr %1111, align 8
  %1114 = load ptr, ptr %21, align 8
  %1115 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1114, i32 0, i32 0
  %1116 = load ptr, ptr %1115, align 8
  %1117 = load ptr, ptr %7, align 8
  %1118 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1117, i32 0, i32 2
  %1119 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1118, i32 0, i32 4
  store ptr %1116, ptr %1119, align 8
  %1120 = load ptr, ptr %7, align 8
  %1121 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1120, i32 0, i32 2
  %1122 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1121, i32 0, i32 3
  store ptr null, ptr %1122, align 8
  %1123 = load ptr, ptr %21, align 8
  %1124 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1123, i32 0, i32 0
  %1125 = load ptr, ptr %1124, align 8
  %1126 = icmp ne ptr %1125, null
  br i1 %1126, label %1127, label %1134

1127:                                             ; preds = %1098
  %1128 = load ptr, ptr %7, align 8
  %1129 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1128, i32 0, i32 2
  %1130 = load ptr, ptr %21, align 8
  %1131 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1130, i32 0, i32 0
  %1132 = load ptr, ptr %1131, align 8
  %1133 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1132, i32 0, i32 3
  store ptr %1129, ptr %1133, align 8
  br label %1134

1134:                                             ; preds = %1127, %1098
  %1135 = load ptr, ptr %7, align 8
  %1136 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1135, i32 0, i32 2
  %1137 = load ptr, ptr %21, align 8
  %1138 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1137, i32 0, i32 0
  store ptr %1136, ptr %1138, align 8
  %1139 = load ptr, ptr %21, align 8
  %1140 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1139, i32 0, i32 1
  %1141 = load i32, ptr %1140, align 8
  %1142 = load ptr, ptr %21, align 8
  %1143 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1142, i32 0, i32 2
  %1144 = load i32, ptr %1143, align 4
  %1145 = add i32 %1144, 1
  %1146 = mul i32 %1145, 10
  %1147 = icmp uge i32 %1141, %1146
  br i1 %1147, label %1148, label %1410

1148:                                             ; preds = %1134
  %1149 = load ptr, ptr %7, align 8
  %1150 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1149, i32 0, i32 2
  %1151 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1150, i32 0, i32 0
  %1152 = load ptr, ptr %1151, align 8
  %1153 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1152, i32 0, i32 9
  %1154 = load i32, ptr %1153, align 4
  %1155 = icmp ne i32 %1154, 0
  br i1 %1155, label %1410, label %1156

1156:                                             ; preds = %1148
  br label %1157

1157:                                             ; preds = %1156
  %1158 = load ptr, ptr %7, align 8
  %1159 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1158, i32 0, i32 2
  %1160 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1159, i32 0, i32 0
  %1161 = load ptr, ptr %1160, align 8
  %1162 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1161, i32 0, i32 1
  %1163 = load i32, ptr %1162, align 8
  %1164 = zext i32 %1163 to i64
  %1165 = mul i64 16, %1164
  %1166 = mul i64 %1165, 2
  %1167 = call noalias ptr @malloc(i64 noundef %1166)
  store ptr %1167, ptr %26, align 8
  %1168 = load ptr, ptr %26, align 8
  %1169 = icmp ne ptr %1168, null
  br i1 %1169, label %1171, label %1170

1170:                                             ; preds = %1157
  call void @exit(i32 noundef -1)
  unreachable

1171:                                             ; preds = %1157
  %1172 = load ptr, ptr %26, align 8
  %1173 = load ptr, ptr %7, align 8
  %1174 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1173, i32 0, i32 2
  %1175 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1174, i32 0, i32 0
  %1176 = load ptr, ptr %1175, align 8
  %1177 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1176, i32 0, i32 1
  %1178 = load i32, ptr %1177, align 8
  %1179 = zext i32 %1178 to i64
  %1180 = mul i64 16, %1179
  %1181 = mul i64 %1180, 2
  call void @llvm.memset.p0.i64(ptr align 8 %1172, i8 0, i64 %1181, i1 false)
  %1182 = load ptr, ptr %7, align 8
  %1183 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1182, i32 0, i32 2
  %1184 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1183, i32 0, i32 0
  %1185 = load ptr, ptr %1184, align 8
  %1186 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1185, i32 0, i32 3
  %1187 = load i32, ptr %1186, align 8
  %1188 = load ptr, ptr %7, align 8
  %1189 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1188, i32 0, i32 2
  %1190 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1189, i32 0, i32 0
  %1191 = load ptr, ptr %1190, align 8
  %1192 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1191, i32 0, i32 2
  %1193 = load i32, ptr %1192, align 4
  %1194 = add i32 %1193, 1
  %1195 = lshr i32 %1187, %1194
  %1196 = load ptr, ptr %7, align 8
  %1197 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1196, i32 0, i32 2
  %1198 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1197, i32 0, i32 0
  %1199 = load ptr, ptr %1198, align 8
  %1200 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1199, i32 0, i32 3
  %1201 = load i32, ptr %1200, align 8
  %1202 = load ptr, ptr %7, align 8
  %1203 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1202, i32 0, i32 2
  %1204 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1203, i32 0, i32 0
  %1205 = load ptr, ptr %1204, align 8
  %1206 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1205, i32 0, i32 1
  %1207 = load i32, ptr %1206, align 8
  %1208 = mul i32 %1207, 2
  %1209 = sub i32 %1208, 1
  %1210 = and i32 %1201, %1209
  %1211 = icmp ne i32 %1210, 0
  %1212 = zext i1 %1211 to i64
  %1213 = select i1 %1211, i32 1, i32 0
  %1214 = add i32 %1195, %1213
  %1215 = load ptr, ptr %7, align 8
  %1216 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1215, i32 0, i32 2
  %1217 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1216, i32 0, i32 0
  %1218 = load ptr, ptr %1217, align 8
  %1219 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1218, i32 0, i32 6
  store i32 %1214, ptr %1219, align 8
  %1220 = load ptr, ptr %7, align 8
  %1221 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1220, i32 0, i32 2
  %1222 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1221, i32 0, i32 0
  %1223 = load ptr, ptr %1222, align 8
  %1224 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1223, i32 0, i32 7
  store i32 0, ptr %1224, align 4
  store i32 0, ptr %23, align 4
  br label %1225

1225:                                             ; preds = %1334, %1171
  %1226 = load i32, ptr %23, align 4
  %1227 = load ptr, ptr %7, align 8
  %1228 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1227, i32 0, i32 2
  %1229 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1228, i32 0, i32 0
  %1230 = load ptr, ptr %1229, align 8
  %1231 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1230, i32 0, i32 1
  %1232 = load i32, ptr %1231, align 8
  %1233 = icmp ult i32 %1226, %1232
  br i1 %1233, label %1234, label %1337

1234:                                             ; preds = %1225
  %1235 = load ptr, ptr %7, align 8
  %1236 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1235, i32 0, i32 2
  %1237 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1236, i32 0, i32 0
  %1238 = load ptr, ptr %1237, align 8
  %1239 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1238, i32 0, i32 0
  %1240 = load ptr, ptr %1239, align 8
  %1241 = load i32, ptr %23, align 4
  %1242 = zext i32 %1241 to i64
  %1243 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1240, i64 %1242
  %1244 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1243, i32 0, i32 0
  %1245 = load ptr, ptr %1244, align 8
  store ptr %1245, ptr %24, align 8
  br label %1246

1246:                                             ; preds = %1328, %1234
  %1247 = load ptr, ptr %24, align 8
  %1248 = icmp ne ptr %1247, null
  br i1 %1248, label %1249, label %1333

1249:                                             ; preds = %1246
  %1250 = load ptr, ptr %24, align 8
  %1251 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1250, i32 0, i32 4
  %1252 = load ptr, ptr %1251, align 8
  store ptr %1252, ptr %25, align 8
  br label %1253

1253:                                             ; preds = %1249
  %1254 = load ptr, ptr %24, align 8
  %1255 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1254, i32 0, i32 7
  %1256 = load i32, ptr %1255, align 4
  %1257 = load ptr, ptr %7, align 8
  %1258 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1257, i32 0, i32 2
  %1259 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1258, i32 0, i32 0
  %1260 = load ptr, ptr %1259, align 8
  %1261 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1260, i32 0, i32 1
  %1262 = load i32, ptr %1261, align 8
  %1263 = mul i32 %1262, 2
  %1264 = sub i32 %1263, 1
  %1265 = and i32 %1256, %1264
  store i32 %1265, ptr %22, align 4
  br label %1266

1266:                                             ; preds = %1253
  %1267 = load ptr, ptr %26, align 8
  %1268 = load i32, ptr %22, align 4
  %1269 = zext i32 %1268 to i64
  %1270 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1267, i64 %1269
  store ptr %1270, ptr %27, align 8
  %1271 = load ptr, ptr %27, align 8
  %1272 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1271, i32 0, i32 1
  %1273 = load i32, ptr %1272, align 8
  %1274 = add i32 %1273, 1
  store i32 %1274, ptr %1272, align 8
  %1275 = load ptr, ptr %7, align 8
  %1276 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1275, i32 0, i32 2
  %1277 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1276, i32 0, i32 0
  %1278 = load ptr, ptr %1277, align 8
  %1279 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1278, i32 0, i32 6
  %1280 = load i32, ptr %1279, align 8
  %1281 = icmp ugt i32 %1274, %1280
  br i1 %1281, label %1282, label %1310

1282:                                             ; preds = %1266
  %1283 = load ptr, ptr %7, align 8
  %1284 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1283, i32 0, i32 2
  %1285 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1284, i32 0, i32 0
  %1286 = load ptr, ptr %1285, align 8
  %1287 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1286, i32 0, i32 7
  %1288 = load i32, ptr %1287, align 4
  %1289 = add i32 %1288, 1
  store i32 %1289, ptr %1287, align 4
  %1290 = load ptr, ptr %27, align 8
  %1291 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1290, i32 0, i32 1
  %1292 = load i32, ptr %1291, align 8
  %1293 = load ptr, ptr %27, align 8
  %1294 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1293, i32 0, i32 2
  %1295 = load i32, ptr %1294, align 4
  %1296 = load ptr, ptr %7, align 8
  %1297 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1296, i32 0, i32 2
  %1298 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1297, i32 0, i32 0
  %1299 = load ptr, ptr %1298, align 8
  %1300 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1299, i32 0, i32 6
  %1301 = load i32, ptr %1300, align 8
  %1302 = mul i32 %1295, %1301
  %1303 = icmp ugt i32 %1292, %1302
  br i1 %1303, label %1304, label %1309

1304:                                             ; preds = %1282
  %1305 = load ptr, ptr %27, align 8
  %1306 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1305, i32 0, i32 2
  %1307 = load i32, ptr %1306, align 4
  %1308 = add i32 %1307, 1
  store i32 %1308, ptr %1306, align 4
  br label %1309

1309:                                             ; preds = %1304, %1282
  br label %1310

1310:                                             ; preds = %1309, %1266
  %1311 = load ptr, ptr %24, align 8
  %1312 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1311, i32 0, i32 3
  store ptr null, ptr %1312, align 8
  %1313 = load ptr, ptr %27, align 8
  %1314 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1313, i32 0, i32 0
  %1315 = load ptr, ptr %1314, align 8
  %1316 = load ptr, ptr %24, align 8
  %1317 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1316, i32 0, i32 4
  store ptr %1315, ptr %1317, align 8
  %1318 = load ptr, ptr %27, align 8
  %1319 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1318, i32 0, i32 0
  %1320 = load ptr, ptr %1319, align 8
  %1321 = icmp ne ptr %1320, null
  br i1 %1321, label %1322, label %1328

1322:                                             ; preds = %1310
  %1323 = load ptr, ptr %24, align 8
  %1324 = load ptr, ptr %27, align 8
  %1325 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1324, i32 0, i32 0
  %1326 = load ptr, ptr %1325, align 8
  %1327 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1326, i32 0, i32 3
  store ptr %1323, ptr %1327, align 8
  br label %1328

1328:                                             ; preds = %1322, %1310
  %1329 = load ptr, ptr %24, align 8
  %1330 = load ptr, ptr %27, align 8
  %1331 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1330, i32 0, i32 0
  store ptr %1329, ptr %1331, align 8
  %1332 = load ptr, ptr %25, align 8
  store ptr %1332, ptr %24, align 8
  br label %1246, !llvm.loop !24

1333:                                             ; preds = %1246
  br label %1334

1334:                                             ; preds = %1333
  %1335 = load i32, ptr %23, align 4
  %1336 = add i32 %1335, 1
  store i32 %1336, ptr %23, align 4
  br label %1225, !llvm.loop !25

1337:                                             ; preds = %1225
  %1338 = load ptr, ptr %7, align 8
  %1339 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1338, i32 0, i32 2
  %1340 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1339, i32 0, i32 0
  %1341 = load ptr, ptr %1340, align 8
  %1342 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1341, i32 0, i32 0
  %1343 = load ptr, ptr %1342, align 8
  call void @free(ptr noundef %1343)
  %1344 = load ptr, ptr %7, align 8
  %1345 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1344, i32 0, i32 2
  %1346 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1345, i32 0, i32 0
  %1347 = load ptr, ptr %1346, align 8
  %1348 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1347, i32 0, i32 1
  %1349 = load i32, ptr %1348, align 8
  %1350 = mul i32 %1349, 2
  store i32 %1350, ptr %1348, align 8
  %1351 = load ptr, ptr %7, align 8
  %1352 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1351, i32 0, i32 2
  %1353 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1352, i32 0, i32 0
  %1354 = load ptr, ptr %1353, align 8
  %1355 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1354, i32 0, i32 2
  %1356 = load i32, ptr %1355, align 4
  %1357 = add i32 %1356, 1
  store i32 %1357, ptr %1355, align 4
  %1358 = load ptr, ptr %26, align 8
  %1359 = load ptr, ptr %7, align 8
  %1360 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1359, i32 0, i32 2
  %1361 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1360, i32 0, i32 0
  %1362 = load ptr, ptr %1361, align 8
  %1363 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1362, i32 0, i32 0
  store ptr %1358, ptr %1363, align 8
  %1364 = load ptr, ptr %7, align 8
  %1365 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1364, i32 0, i32 2
  %1366 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1365, i32 0, i32 0
  %1367 = load ptr, ptr %1366, align 8
  %1368 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1367, i32 0, i32 7
  %1369 = load i32, ptr %1368, align 4
  %1370 = load ptr, ptr %7, align 8
  %1371 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1370, i32 0, i32 2
  %1372 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1371, i32 0, i32 0
  %1373 = load ptr, ptr %1372, align 8
  %1374 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1373, i32 0, i32 3
  %1375 = load i32, ptr %1374, align 8
  %1376 = lshr i32 %1375, 1
  %1377 = icmp ugt i32 %1369, %1376
  br i1 %1377, label %1378, label %1386

1378:                                             ; preds = %1337
  %1379 = load ptr, ptr %7, align 8
  %1380 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1379, i32 0, i32 2
  %1381 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1380, i32 0, i32 0
  %1382 = load ptr, ptr %1381, align 8
  %1383 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1382, i32 0, i32 8
  %1384 = load i32, ptr %1383, align 8
  %1385 = add i32 %1384, 1
  br label %1387

1386:                                             ; preds = %1337
  br label %1387

1387:                                             ; preds = %1386, %1378
  %1388 = phi i32 [ %1385, %1378 ], [ 0, %1386 ]
  %1389 = load ptr, ptr %7, align 8
  %1390 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1389, i32 0, i32 2
  %1391 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1390, i32 0, i32 0
  %1392 = load ptr, ptr %1391, align 8
  %1393 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1392, i32 0, i32 8
  store i32 %1388, ptr %1393, align 8
  %1394 = load ptr, ptr %7, align 8
  %1395 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1394, i32 0, i32 2
  %1396 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1395, i32 0, i32 0
  %1397 = load ptr, ptr %1396, align 8
  %1398 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1397, i32 0, i32 8
  %1399 = load i32, ptr %1398, align 8
  %1400 = icmp ugt i32 %1399, 1
  br i1 %1400, label %1401, label %1407

1401:                                             ; preds = %1387
  %1402 = load ptr, ptr %7, align 8
  %1403 = getelementptr inbounds nuw %struct.VariableEntry, ptr %1402, i32 0, i32 2
  %1404 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1403, i32 0, i32 0
  %1405 = load ptr, ptr %1404, align 8
  %1406 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1405, i32 0, i32 9
  store i32 1, ptr %1406, align 4
  br label %1407

1407:                                             ; preds = %1401, %1387
  br label %1408

1408:                                             ; preds = %1407
  br label %1409

1409:                                             ; preds = %1408
  br label %1410

1410:                                             ; preds = %1409, %1148, %1134
  br label %1411

1411:                                             ; preds = %1410
  br label %1412

1412:                                             ; preds = %1411
  br label %1413

1413:                                             ; preds = %1412
  br label %1414

1414:                                             ; preds = %1413
  br label %1415

1415:                                             ; preds = %1414, %526
  ret void
}

declare i64 @strlen(ptr noundef)

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

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
