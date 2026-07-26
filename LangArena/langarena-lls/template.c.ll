; ModuleID = 'c/src/template.c'
source_filename = "c/src/template.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.TemplateRegexData = type { %struct.TemplateBaseData, ptr, ptr }
%struct.TemplateBaseData = type { i32, i32, ptr, i64, ptr, i64, ptr }
%struct.VarEntry = type { ptr, ptr, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }
%struct.TemplateParseData = type { %struct.TemplateBaseData }

@.str = private unnamed_addr constant [6 x i8] c"count\00", align 1
@TEMPLATE_REGEX_PATTERN = internal global ptr @.str.46, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Template::Regex\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Template::Parse\00", align 1
@.str.3 = private unnamed_addr constant [13 x i8] c"<html><body>\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"<h1>{{TITLE}}</h1>\00", align 1
@.str.5 = private unnamed_addr constant [6 x i8] c"TITLE\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Template title\00", align 1
@.str.7 = private unnamed_addr constant [4 x i8] c"<p>\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@LOREM = internal global ptr @.str.23, align 8
@.str.9 = private unnamed_addr constant [5 x i8] c"</p>\00", align 1
@.str.10 = private unnamed_addr constant [8 x i8] c"<table>\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"<!-- {comment} -->\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"<tr>\00", align 1
@.str.13 = private unnamed_addr constant [28 x i8] c"<td>{{ FIRST_NAME%d }}</td>\00", align 1
@.str.14 = private unnamed_addr constant [13 x i8] c"FIRST_NAME%d\00", align 1
@FIRST_NAMES = internal global [8 x ptr] [ptr @.str.24, ptr @.str.25, ptr @.str.26, ptr @.str.27, ptr @.str.28, ptr @.str.29, ptr @.str.30, ptr @.str.31], align 16
@.str.15 = private unnamed_addr constant [25 x i8] c"<td>{{LAST_NAME%d}}</td>\00", align 1
@.str.16 = private unnamed_addr constant [12 x i8] c"LAST_NAME%d\00", align 1
@LAST_NAMES = internal global [8 x ptr] [ptr @.str.32, ptr @.str.33, ptr @.str.34, ptr @.str.35, ptr @.str.36, ptr @.str.37, ptr @.str.38, ptr @.str.39], align 16
@.str.17 = private unnamed_addr constant [24 x i8] c"<td>{{  CITY%d  }}</td>\00", align 1
@.str.18 = private unnamed_addr constant [7 x i8] c"CITY%d\00", align 1
@CITIES = internal global [6 x ptr] [ptr @.str.40, ptr @.str.41, ptr @.str.42, ptr @.str.43, ptr @.str.44, ptr @.str.45], align 16
@.str.19 = private unnamed_addr constant [23 x i8] c"<td>{balance: %d}</td>\00", align 1
@.str.20 = private unnamed_addr constant [7 x i8] c"</tr>\0A\00", align 1
@.str.21 = private unnamed_addr constant [9 x i8] c"</table>\00", align 1
@.str.22 = private unnamed_addr constant [15 x i8] c"</body></html>\00", align 1
@.str.23 = private unnamed_addr constant [131 x i8] c"Lorem {ipsum} dolor {sit} amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore {et} dolore magna aliqua. \00", align 1
@.str.24 = private unnamed_addr constant [5 x i8] c"John\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"Jane\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"Bob\00", align 1
@.str.27 = private unnamed_addr constant [6 x i8] c"Alice\00", align 1
@.str.28 = private unnamed_addr constant [8 x i8] c"Charlie\00", align 1
@.str.29 = private unnamed_addr constant [6 x i8] c"Diana\00", align 1
@.str.30 = private unnamed_addr constant [6 x i8] c"Sarah\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"Mike\00", align 1
@.str.32 = private unnamed_addr constant [6 x i8] c"Smith\00", align 1
@.str.33 = private unnamed_addr constant [8 x i8] c"Johnson\00", align 1
@.str.34 = private unnamed_addr constant [6 x i8] c"Brown\00", align 1
@.str.35 = private unnamed_addr constant [7 x i8] c"Taylor\00", align 1
@.str.36 = private unnamed_addr constant [7 x i8] c"Wilson\00", align 1
@.str.37 = private unnamed_addr constant [6 x i8] c"Davis\00", align 1
@.str.38 = private unnamed_addr constant [7 x i8] c"Miller\00", align 1
@.str.39 = private unnamed_addr constant [6 x i8] c"Jones\00", align 1
@.str.40 = private unnamed_addr constant [9 x i8] c"New York\00", align 1
@.str.41 = private unnamed_addr constant [12 x i8] c"Los Angeles\00", align 1
@.str.42 = private unnamed_addr constant [8 x i8] c"Chicago\00", align 1
@.str.43 = private unnamed_addr constant [8 x i8] c"Houston\00", align 1
@.str.44 = private unnamed_addr constant [8 x i8] c"Phoenix\00", align 1
@.str.45 = private unnamed_addr constant [14 x i8] c"San Francisco\00", align 1
@.str.46 = private unnamed_addr constant [10 x i8] c"{{(.*?)}}\00", align 1

define dso_local void @TemplateRegex_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %6 = load ptr, ptr %2, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  %8 = load ptr, ptr %7, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = call i64 @Helper_config_i64(ptr noundef %11, ptr noundef @.str)
  %13 = trunc i64 %12 to i32
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %14, i32 0, i32 0
  %16 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %15, i32 0, i32 0
  store i32 %13, ptr %16, align 8
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %17, i32 0, i32 0
  %19 = call i32 @prepare_template(ptr noundef %18)
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %20, i32 0, i32 1
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %45, label %24

24:                                               ; preds = %1
  %25 = load ptr, ptr @TEMPLATE_REGEX_PATTERN, align 8
  %26 = call ptr @pcre2_compile_8(ptr noundef %25, i64 noundef -1, i32 noundef 1074266112, ptr noundef %4, ptr noundef %5, ptr noundef null)
  %27 = load ptr, ptr %3, align 8
  %28 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %27, i32 0, i32 1
  store ptr %26, ptr %28, align 8
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %29, i32 0, i32 1
  %31 = load ptr, ptr %30, align 8
  %32 = icmp ne ptr %31, null
  br i1 %32, label %33, label %44

33:                                               ; preds = %24
  %34 = load ptr, ptr %3, align 8
  %35 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = call i32 @pcre2_jit_compile_8(ptr noundef %36, i32 noundef 1)
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %38, i32 0, i32 1
  %40 = load ptr, ptr %39, align 8
  %41 = call ptr @pcre2_match_data_create_from_pattern_8(ptr noundef %40, ptr noundef null)
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %42, i32 0, i32 2
  store ptr %41, ptr %43, align 8
  br label %44

44:                                               ; preds = %33, %24
  br label %45

45:                                               ; preds = %44, %1
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)

define internal i32 @prepare_template(ptr noundef %0) {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca [32 x i8], align 16
  store ptr %0, ptr %3, align 8
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %9, i32 0, i32 2
  %11 = load ptr, ptr %10, align 8
  %12 = icmp ne ptr %11, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %1
  %14 = load ptr, ptr %3, align 8
  %15 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %14, i32 0, i32 2
  %16 = load ptr, ptr %15, align 8
  call void @free(ptr noundef %16)
  %17 = load ptr, ptr %3, align 8
  %18 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %17, i32 0, i32 2
  store ptr null, ptr %18, align 8
  br label %19

19:                                               ; preds = %13, %1
  %20 = load ptr, ptr %3, align 8
  call void @clear_vars(ptr noundef %20)
  %21 = load ptr, ptr %3, align 8
  %22 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %21, i32 0, i32 0
  %23 = load i32, ptr %22, align 8
  %24 = mul nsw i32 %23, 200
  %25 = add nsw i32 %24, 1
  %26 = sext i32 %25 to i64
  store i64 %26, ptr %4, align 8
  %27 = load i64, ptr %4, align 8
  %28 = call noalias ptr @malloc(i64 noundef %27)
  store ptr %28, ptr %5, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = icmp ne ptr %29, null
  br i1 %30, label %32, label %31

31:                                               ; preds = %19
  store i32 -1, ptr %2, align 4
  br label %197

32:                                               ; preds = %19
  store i64 0, ptr %6, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = load i64, ptr %6, align 8
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 %34
  %36 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %35, ptr noundef @.str.3)
  %37 = sext i32 %36 to i64
  %38 = load i64, ptr %6, align 8
  %39 = add i64 %38, %37
  store i64 %39, ptr %6, align 8
  %40 = load ptr, ptr %5, align 8
  %41 = load i64, ptr %6, align 8
  %42 = getelementptr inbounds nuw i8, ptr %40, i64 %41
  %43 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %42, ptr noundef @.str.4)
  %44 = sext i32 %43 to i64
  %45 = load i64, ptr %6, align 8
  %46 = add i64 %45, %44
  store i64 %46, ptr %6, align 8
  %47 = load ptr, ptr %3, align 8
  call void @add_var(ptr noundef %47, ptr noundef @.str.5, ptr noundef @.str.6)
  %48 = load ptr, ptr %5, align 8
  %49 = load i64, ptr %6, align 8
  %50 = getelementptr inbounds nuw i8, ptr %48, i64 %49
  %51 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %50, ptr noundef @.str.7)
  %52 = sext i32 %51 to i64
  %53 = load i64, ptr %6, align 8
  %54 = add i64 %53, %52
  store i64 %54, ptr %6, align 8
  %55 = load ptr, ptr %5, align 8
  %56 = load i64, ptr %6, align 8
  %57 = getelementptr inbounds nuw i8, ptr %55, i64 %56
  %58 = load ptr, ptr @LOREM, align 8
  %59 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %57, ptr noundef @.str.8, ptr noundef %58)
  %60 = sext i32 %59 to i64
  %61 = load i64, ptr %6, align 8
  %62 = add i64 %61, %60
  store i64 %62, ptr %6, align 8
  %63 = load ptr, ptr %5, align 8
  %64 = load i64, ptr %6, align 8
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 %64
  %66 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %65, ptr noundef @.str.9)
  %67 = sext i32 %66 to i64
  %68 = load i64, ptr %6, align 8
  %69 = add i64 %68, %67
  store i64 %69, ptr %6, align 8
  %70 = load ptr, ptr %5, align 8
  %71 = load i64, ptr %6, align 8
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 %71
  %73 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %72, ptr noundef @.str.10)
  %74 = sext i32 %73 to i64
  %75 = load i64, ptr %6, align 8
  %76 = add i64 %75, %74
  store i64 %76, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %77

77:                                               ; preds = %173, %32
  %78 = load i32, ptr %7, align 4
  %79 = load ptr, ptr %3, align 8
  %80 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %79, i32 0, i32 0
  %81 = load i32, ptr %80, align 8
  %82 = icmp slt i32 %78, %81
  br i1 %82, label %83, label %176

83:                                               ; preds = %77
  %84 = load i32, ptr %7, align 4
  %85 = srem i32 %84, 3
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %87, label %95

87:                                               ; preds = %83
  %88 = load ptr, ptr %5, align 8
  %89 = load i64, ptr %6, align 8
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 %89
  %91 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %90, ptr noundef @.str.11)
  %92 = sext i32 %91 to i64
  %93 = load i64, ptr %6, align 8
  %94 = add i64 %93, %92
  store i64 %94, ptr %6, align 8
  br label %95

95:                                               ; preds = %87, %83
  %96 = load ptr, ptr %5, align 8
  %97 = load i64, ptr %6, align 8
  %98 = getelementptr inbounds nuw i8, ptr %96, i64 %97
  %99 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %98, ptr noundef @.str.12)
  %100 = sext i32 %99 to i64
  %101 = load i64, ptr %6, align 8
  %102 = add i64 %101, %100
  store i64 %102, ptr %6, align 8
  %103 = load ptr, ptr %5, align 8
  %104 = load i64, ptr %6, align 8
  %105 = getelementptr inbounds nuw i8, ptr %103, i64 %104
  %106 = load i32, ptr %7, align 4
  %107 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %105, ptr noundef @.str.13, i32 noundef %106)
  %108 = sext i32 %107 to i64
  %109 = load i64, ptr %6, align 8
  %110 = add i64 %109, %108
  store i64 %110, ptr %6, align 8
  %111 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %112 = load i32, ptr %7, align 4
  %113 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %111, ptr noundef @.str.14, i32 noundef %112)
  %114 = load ptr, ptr %3, align 8
  %115 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %116 = load i32, ptr %7, align 4
  %117 = srem i32 %116, 8
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds [8 x ptr], ptr @FIRST_NAMES, i64 0, i64 %118
  %120 = load ptr, ptr %119, align 8
  call void @add_var(ptr noundef %114, ptr noundef %115, ptr noundef %120)
  %121 = load ptr, ptr %5, align 8
  %122 = load i64, ptr %6, align 8
  %123 = getelementptr inbounds nuw i8, ptr %121, i64 %122
  %124 = load i32, ptr %7, align 4
  %125 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %123, ptr noundef @.str.15, i32 noundef %124)
  %126 = sext i32 %125 to i64
  %127 = load i64, ptr %6, align 8
  %128 = add i64 %127, %126
  store i64 %128, ptr %6, align 8
  %129 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %130 = load i32, ptr %7, align 4
  %131 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %129, ptr noundef @.str.16, i32 noundef %130)
  %132 = load ptr, ptr %3, align 8
  %133 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %134 = load i32, ptr %7, align 4
  %135 = srem i32 %134, 8
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [8 x ptr], ptr @LAST_NAMES, i64 0, i64 %136
  %138 = load ptr, ptr %137, align 8
  call void @add_var(ptr noundef %132, ptr noundef %133, ptr noundef %138)
  %139 = load ptr, ptr %5, align 8
  %140 = load i64, ptr %6, align 8
  %141 = getelementptr inbounds nuw i8, ptr %139, i64 %140
  %142 = load i32, ptr %7, align 4
  %143 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %141, ptr noundef @.str.17, i32 noundef %142)
  %144 = sext i32 %143 to i64
  %145 = load i64, ptr %6, align 8
  %146 = add i64 %145, %144
  store i64 %146, ptr %6, align 8
  %147 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %148 = load i32, ptr %7, align 4
  %149 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %147, ptr noundef @.str.18, i32 noundef %148)
  %150 = load ptr, ptr %3, align 8
  %151 = getelementptr inbounds [32 x i8], ptr %8, i64 0, i64 0
  %152 = load i32, ptr %7, align 4
  %153 = srem i32 %152, 6
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [6 x ptr], ptr @CITIES, i64 0, i64 %154
  %156 = load ptr, ptr %155, align 8
  call void @add_var(ptr noundef %150, ptr noundef %151, ptr noundef %156)
  %157 = load ptr, ptr %5, align 8
  %158 = load i64, ptr %6, align 8
  %159 = getelementptr inbounds nuw i8, ptr %157, i64 %158
  %160 = load i32, ptr %7, align 4
  %161 = srem i32 %160, 100
  %162 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %159, ptr noundef @.str.19, i32 noundef %161)
  %163 = sext i32 %162 to i64
  %164 = load i64, ptr %6, align 8
  %165 = add i64 %164, %163
  store i64 %165, ptr %6, align 8
  %166 = load ptr, ptr %5, align 8
  %167 = load i64, ptr %6, align 8
  %168 = getelementptr inbounds nuw i8, ptr %166, i64 %167
  %169 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %168, ptr noundef @.str.20)
  %170 = sext i32 %169 to i64
  %171 = load i64, ptr %6, align 8
  %172 = add i64 %171, %170
  store i64 %172, ptr %6, align 8
  br label %173

173:                                              ; preds = %95
  %174 = load i32, ptr %7, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, ptr %7, align 4
  br label %77, !llvm.loop !6

176:                                              ; preds = %77
  %177 = load ptr, ptr %5, align 8
  %178 = load i64, ptr %6, align 8
  %179 = getelementptr inbounds nuw i8, ptr %177, i64 %178
  %180 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %179, ptr noundef @.str.21)
  %181 = sext i32 %180 to i64
  %182 = load i64, ptr %6, align 8
  %183 = add i64 %182, %181
  store i64 %183, ptr %6, align 8
  %184 = load ptr, ptr %5, align 8
  %185 = load i64, ptr %6, align 8
  %186 = getelementptr inbounds nuw i8, ptr %184, i64 %185
  %187 = call i32 (ptr, ptr, ...) @sprintf(ptr noundef %186, ptr noundef @.str.22)
  %188 = sext i32 %187 to i64
  %189 = load i64, ptr %6, align 8
  %190 = add i64 %189, %188
  store i64 %190, ptr %6, align 8
  %191 = load ptr, ptr %5, align 8
  %192 = load ptr, ptr %3, align 8
  %193 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %192, i32 0, i32 2
  store ptr %191, ptr %193, align 8
  %194 = load i64, ptr %6, align 8
  %195 = load ptr, ptr %3, align 8
  %196 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %195, i32 0, i32 3
  store i64 %194, ptr %196, align 8
  store i32 0, ptr %2, align 4
  br label %197

197:                                              ; preds = %176, %31
  %198 = load i32, ptr %2, align 4
  ret i32 %198
}

declare ptr @pcre2_compile_8(ptr noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef, ptr noundef)

declare i32 @pcre2_jit_compile_8(ptr noundef, i32 noundef)

declare ptr @pcre2_match_data_create_from_pattern_8(ptr noundef, ptr noundef)

define dso_local void @TemplateRegex_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca i32, align 4
  %15 = alloca ptr, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  %20 = alloca i64, align 8
  %21 = alloca i64, align 8
  %22 = alloca ptr, align 8
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca ptr, align 8
  %26 = alloca i64, align 8
  %27 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %28 = load i32, ptr %4, align 4
  %29 = load ptr, ptr %3, align 8
  %30 = getelementptr inbounds nuw %struct.Benchmark, ptr %29, i32 0, i32 11
  %31 = load ptr, ptr %30, align 8
  store ptr %31, ptr %5, align 8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %32, i32 0, i32 0
  store ptr %33, ptr %6, align 8
  %34 = load ptr, ptr %5, align 8
  %35 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %34, i32 0, i32 1
  %36 = load ptr, ptr %35, align 8
  %37 = icmp ne ptr %36, null
  br i1 %37, label %38, label %48

38:                                               ; preds = %2
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %39, i32 0, i32 2
  %41 = load ptr, ptr %40, align 8
  %42 = icmp ne ptr %41, null
  br i1 %42, label %43, label %48

43:                                               ; preds = %38
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %44, i32 0, i32 2
  %46 = load ptr, ptr %45, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %49, label %48

48:                                               ; preds = %43, %38, %2
  br label %257

49:                                               ; preds = %43
  %50 = load ptr, ptr %6, align 8
  %51 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %50, i32 0, i32 3
  %52 = load i64, ptr %51, align 8
  %53 = mul i64 %52, 2
  store i64 %53, ptr %7, align 8
  %54 = load i64, ptr %7, align 8
  %55 = call noalias ptr @malloc(i64 noundef %54)
  store ptr %55, ptr %8, align 8
  %56 = load ptr, ptr %8, align 8
  %57 = icmp ne ptr %56, null
  br i1 %57, label %59, label %58

58:                                               ; preds = %49
  br label %257

59:                                               ; preds = %49
  store i64 0, ptr %9, align 8
  store i64 0, ptr %10, align 8
  %60 = load ptr, ptr %6, align 8
  %61 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %60, i32 0, i32 2
  %62 = load ptr, ptr %61, align 8
  store ptr %62, ptr %11, align 8
  %63 = load ptr, ptr %6, align 8
  %64 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %63, i32 0, i32 3
  %65 = load i64, ptr %64, align 8
  store i64 %65, ptr %12, align 8
  store i64 0, ptr %13, align 8
  br label %66

66:                                               ; preds = %59, %207
  %67 = load ptr, ptr %5, align 8
  %68 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %67, i32 0, i32 1
  %69 = load ptr, ptr %68, align 8
  %70 = load ptr, ptr %11, align 8
  %71 = load i64, ptr %12, align 8
  %72 = load i64, ptr %10, align 8
  %73 = load ptr, ptr %5, align 8
  %74 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %73, i32 0, i32 2
  %75 = load ptr, ptr %74, align 8
  %76 = call i32 @pcre2_jit_match_8(ptr noundef %69, ptr noundef %70, i64 noundef %71, i64 noundef %72, i32 noundef 0, ptr noundef %75, ptr noundef null)
  store i32 %76, ptr %14, align 4
  %77 = load i32, ptr %14, align 4
  %78 = icmp slt i32 %77, 0
  br i1 %78, label %79, label %80

79:                                               ; preds = %66
  br label %208

80:                                               ; preds = %66
  %81 = load ptr, ptr %5, align 8
  %82 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %81, i32 0, i32 2
  %83 = load ptr, ptr %82, align 8
  %84 = call ptr @pcre2_get_ovector_pointer_8(ptr noundef %83)
  store ptr %84, ptr %15, align 8
  %85 = load ptr, ptr %15, align 8
  %86 = getelementptr inbounds i64, ptr %85, i64 0
  %87 = load i64, ptr %86, align 8
  store i64 %87, ptr %16, align 8
  %88 = load ptr, ptr %15, align 8
  %89 = getelementptr inbounds i64, ptr %88, i64 1
  %90 = load i64, ptr %89, align 8
  store i64 %90, ptr %17, align 8
  %91 = load i64, ptr %16, align 8
  %92 = load i64, ptr %13, align 8
  %93 = icmp ugt i64 %91, %92
  br i1 %93, label %94, label %110

94:                                               ; preds = %80
  %95 = load i64, ptr %16, align 8
  %96 = load i64, ptr %13, align 8
  %97 = sub i64 %95, %96
  store i64 %97, ptr %18, align 8
  %98 = load ptr, ptr %8, align 8
  %99 = load i64, ptr %9, align 8
  %100 = getelementptr inbounds nuw i8, ptr %98, i64 %99
  %101 = load ptr, ptr %6, align 8
  %102 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %101, i32 0, i32 2
  %103 = load ptr, ptr %102, align 8
  %104 = load i64, ptr %13, align 8
  %105 = getelementptr inbounds nuw i8, ptr %103, i64 %104
  %106 = load i64, ptr %18, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %100, ptr align 1 %105, i64 %106, i1 false)
  %107 = load i64, ptr %18, align 8
  %108 = load i64, ptr %9, align 8
  %109 = add i64 %108, %107
  store i64 %109, ptr %9, align 8
  br label %110

110:                                              ; preds = %94, %80
  %111 = load ptr, ptr %15, align 8
  %112 = getelementptr inbounds i64, ptr %111, i64 2
  %113 = load i64, ptr %112, align 8
  store i64 %113, ptr %19, align 8
  %114 = load ptr, ptr %15, align 8
  %115 = getelementptr inbounds i64, ptr %114, i64 3
  %116 = load i64, ptr %115, align 8
  store i64 %116, ptr %20, align 8
  %117 = load i64, ptr %20, align 8
  %118 = load i64, ptr %19, align 8
  %119 = icmp ugt i64 %117, %118
  br i1 %119, label %120, label %200

120:                                              ; preds = %110
  %121 = load i64, ptr %20, align 8
  %122 = load i64, ptr %19, align 8
  %123 = sub i64 %121, %122
  store i64 %123, ptr %21, align 8
  %124 = load i64, ptr %21, align 8
  %125 = add i64 %124, 1
  %126 = call noalias ptr @malloc(i64 noundef %125)
  store ptr %126, ptr %22, align 8
  %127 = load ptr, ptr %22, align 8
  %128 = load ptr, ptr %6, align 8
  %129 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %128, i32 0, i32 2
  %130 = load ptr, ptr %129, align 8
  %131 = load i64, ptr %19, align 8
  %132 = getelementptr inbounds nuw i8, ptr %130, i64 %131
  %133 = load i64, ptr %21, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %127, ptr align 1 %132, i64 %133, i1 false)
  %134 = load ptr, ptr %22, align 8
  %135 = load i64, ptr %21, align 8
  %136 = getelementptr inbounds nuw i8, ptr %134, i64 %135
  store i8 0, ptr %136, align 1
  %137 = load ptr, ptr %22, align 8
  store ptr %137, ptr %23, align 8
  br label %138

138:                                              ; preds = %150, %120
  %139 = load ptr, ptr %23, align 8
  %140 = load i8, ptr %139, align 1
  %141 = sext i8 %140 to i32
  %142 = icmp eq i32 %141, 32
  br i1 %142, label %148, label %143

143:                                              ; preds = %138
  %144 = load ptr, ptr %23, align 8
  %145 = load i8, ptr %144, align 1
  %146 = sext i8 %145 to i32
  %147 = icmp eq i32 %146, 9
  br label %148

148:                                              ; preds = %143, %138
  %149 = phi i1 [ true, %138 ], [ %147, %143 ]
  br i1 %149, label %150, label %153

150:                                              ; preds = %148
  %151 = load ptr, ptr %23, align 8
  %152 = getelementptr inbounds nuw i8, ptr %151, i32 1
  store ptr %152, ptr %23, align 8
  br label %138, !llvm.loop !8

153:                                              ; preds = %148
  %154 = load ptr, ptr %22, align 8
  %155 = load i64, ptr %21, align 8
  %156 = getelementptr inbounds nuw i8, ptr %154, i64 %155
  %157 = getelementptr inbounds i8, ptr %156, i64 -1
  store ptr %157, ptr %24, align 8
  br label %158

158:                                              ; preds = %176, %153
  %159 = load ptr, ptr %24, align 8
  %160 = load ptr, ptr %23, align 8
  %161 = icmp ugt ptr %159, %160
  br i1 %161, label %162, label %174

162:                                              ; preds = %158
  %163 = load ptr, ptr %24, align 8
  %164 = load i8, ptr %163, align 1
  %165 = sext i8 %164 to i32
  %166 = icmp eq i32 %165, 32
  br i1 %166, label %172, label %167

167:                                              ; preds = %162
  %168 = load ptr, ptr %24, align 8
  %169 = load i8, ptr %168, align 1
  %170 = sext i8 %169 to i32
  %171 = icmp eq i32 %170, 9
  br label %172

172:                                              ; preds = %167, %162
  %173 = phi i1 [ true, %162 ], [ %171, %167 ]
  br label %174

174:                                              ; preds = %172, %158
  %175 = phi i1 [ false, %158 ], [ %173, %172 ]
  br i1 %175, label %176, label %179

176:                                              ; preds = %174
  %177 = load ptr, ptr %24, align 8
  %178 = getelementptr inbounds i8, ptr %177, i32 -1
  store ptr %178, ptr %24, align 8
  br label %158, !llvm.loop !9

179:                                              ; preds = %174
  %180 = load ptr, ptr %24, align 8
  %181 = getelementptr inbounds i8, ptr %180, i64 1
  store i8 0, ptr %181, align 1
  %182 = load ptr, ptr %6, align 8
  %183 = load ptr, ptr %23, align 8
  %184 = call ptr @get_var(ptr noundef %182, ptr noundef %183)
  store ptr %184, ptr %25, align 8
  %185 = load ptr, ptr %25, align 8
  %186 = icmp ne ptr %185, null
  br i1 %186, label %187, label %198

187:                                              ; preds = %179
  %188 = load ptr, ptr %25, align 8
  %189 = call i64 @strlen(ptr noundef %188)
  store i64 %189, ptr %26, align 8
  %190 = load ptr, ptr %8, align 8
  %191 = load i64, ptr %9, align 8
  %192 = getelementptr inbounds nuw i8, ptr %190, i64 %191
  %193 = load ptr, ptr %25, align 8
  %194 = load i64, ptr %26, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %192, ptr align 1 %193, i64 %194, i1 false)
  %195 = load i64, ptr %26, align 8
  %196 = load i64, ptr %9, align 8
  %197 = add i64 %196, %195
  store i64 %197, ptr %9, align 8
  br label %198

198:                                              ; preds = %187, %179
  %199 = load ptr, ptr %22, align 8
  call void @free(ptr noundef %199)
  br label %200

200:                                              ; preds = %198, %110
  %201 = load i64, ptr %17, align 8
  store i64 %201, ptr %13, align 8
  %202 = load i64, ptr %17, align 8
  store i64 %202, ptr %10, align 8
  %203 = load i64, ptr %10, align 8
  %204 = load i64, ptr %12, align 8
  %205 = icmp uge i64 %203, %204
  br i1 %205, label %206, label %207

206:                                              ; preds = %200
  br label %208

207:                                              ; preds = %200
  br label %66

208:                                              ; preds = %206, %79
  %209 = load i64, ptr %13, align 8
  %210 = load ptr, ptr %6, align 8
  %211 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %210, i32 0, i32 3
  %212 = load i64, ptr %211, align 8
  %213 = icmp ult i64 %209, %212
  br i1 %213, label %214, label %232

214:                                              ; preds = %208
  %215 = load ptr, ptr %6, align 8
  %216 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %215, i32 0, i32 3
  %217 = load i64, ptr %216, align 8
  %218 = load i64, ptr %13, align 8
  %219 = sub i64 %217, %218
  store i64 %219, ptr %27, align 8
  %220 = load ptr, ptr %8, align 8
  %221 = load i64, ptr %9, align 8
  %222 = getelementptr inbounds nuw i8, ptr %220, i64 %221
  %223 = load ptr, ptr %6, align 8
  %224 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %223, i32 0, i32 2
  %225 = load ptr, ptr %224, align 8
  %226 = load i64, ptr %13, align 8
  %227 = getelementptr inbounds nuw i8, ptr %225, i64 %226
  %228 = load i64, ptr %27, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %222, ptr align 1 %227, i64 %228, i1 false)
  %229 = load i64, ptr %27, align 8
  %230 = load i64, ptr %9, align 8
  %231 = add i64 %230, %229
  store i64 %231, ptr %9, align 8
  br label %232

232:                                              ; preds = %214, %208
  %233 = load ptr, ptr %8, align 8
  %234 = load i64, ptr %9, align 8
  %235 = getelementptr inbounds nuw i8, ptr %233, i64 %234
  store i8 0, ptr %235, align 1
  %236 = load ptr, ptr %6, align 8
  %237 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %236, i32 0, i32 4
  %238 = load ptr, ptr %237, align 8
  %239 = icmp ne ptr %238, null
  br i1 %239, label %240, label %244

240:                                              ; preds = %232
  %241 = load ptr, ptr %6, align 8
  %242 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %241, i32 0, i32 4
  %243 = load ptr, ptr %242, align 8
  call void @free(ptr noundef %243)
  br label %244

244:                                              ; preds = %240, %232
  %245 = load ptr, ptr %8, align 8
  %246 = load ptr, ptr %6, align 8
  %247 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %246, i32 0, i32 4
  store ptr %245, ptr %247, align 8
  %248 = load i64, ptr %9, align 8
  %249 = load ptr, ptr %6, align 8
  %250 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %249, i32 0, i32 5
  store i64 %248, ptr %250, align 8
  %251 = load i64, ptr %9, align 8
  %252 = trunc i64 %251 to i32
  %253 = load ptr, ptr %6, align 8
  %254 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %253, i32 0, i32 1
  %255 = load i32, ptr %254, align 4
  %256 = add i32 %255, %252
  store i32 %256, ptr %254, align 4
  br label %257

257:                                              ; preds = %244, %58, %48
  ret void
}

declare noalias ptr @malloc(i64 noundef)

declare i32 @pcre2_jit_match_8(ptr noundef, ptr noundef, i64 noundef, i64 noundef, i32 noundef, ptr noundef, ptr noundef)

declare ptr @pcre2_get_ovector_pointer_8(ptr noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define internal ptr @get_var(ptr noundef %0, ptr noundef %1) {
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
  %19 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %18, i32 0, i32 6
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
  br label %27, !llvm.loop !10

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
  %388 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %387, i32 0, i32 6
  %389 = load ptr, ptr %388, align 8
  %390 = icmp ne ptr %389, null
  br i1 %390, label %391, label %504

391:                                              ; preds = %386
  br label %392

392:                                              ; preds = %391
  %393 = load i32, ptr %7, align 4
  %394 = load ptr, ptr %3, align 8
  %395 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %394, i32 0, i32 6
  %396 = load ptr, ptr %395, align 8
  %397 = getelementptr inbounds nuw %struct.VarEntry, ptr %396, i32 0, i32 2
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
  %407 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %406, i32 0, i32 6
  %408 = load ptr, ptr %407, align 8
  %409 = getelementptr inbounds nuw %struct.VarEntry, ptr %408, i32 0, i32 2
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
  %423 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %422, i32 0, i32 6
  %424 = load ptr, ptr %423, align 8
  %425 = getelementptr inbounds nuw %struct.VarEntry, ptr %424, i32 0, i32 2
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
  %436 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %435, i32 0, i32 6
  %437 = load ptr, ptr %436, align 8
  %438 = getelementptr inbounds nuw %struct.VarEntry, ptr %437, i32 0, i32 2
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
  %453 = getelementptr inbounds nuw %struct.VarEntry, ptr %452, i32 0, i32 2
  %454 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %453, i32 0, i32 7
  %455 = load i32, ptr %454, align 4
  %456 = load i32, ptr %7, align 4
  %457 = icmp eq i32 %455, %456
  br i1 %457, label %458, label %477

458:                                              ; preds = %451
  %459 = load ptr, ptr %5, align 8
  %460 = getelementptr inbounds nuw %struct.VarEntry, ptr %459, i32 0, i32 2
  %461 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %460, i32 0, i32 6
  %462 = load i32, ptr %461, align 8
  %463 = load i32, ptr %6, align 4
  %464 = icmp eq i32 %462, %463
  br i1 %464, label %465, label %477

465:                                              ; preds = %458
  %466 = load ptr, ptr %5, align 8
  %467 = getelementptr inbounds nuw %struct.VarEntry, ptr %466, i32 0, i32 2
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
  %479 = getelementptr inbounds nuw %struct.VarEntry, ptr %478, i32 0, i32 2
  %480 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %479, i32 0, i32 4
  %481 = load ptr, ptr %480, align 8
  %482 = icmp ne ptr %481, null
  br i1 %482, label %483, label %500

483:                                              ; preds = %477
  br label %484

484:                                              ; preds = %483
  %485 = load ptr, ptr %5, align 8
  %486 = getelementptr inbounds nuw %struct.VarEntry, ptr %485, i32 0, i32 2
  %487 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %486, i32 0, i32 4
  %488 = load ptr, ptr %487, align 8
  %489 = load ptr, ptr %3, align 8
  %490 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %489, i32 0, i32 6
  %491 = load ptr, ptr %490, align 8
  %492 = getelementptr inbounds nuw %struct.VarEntry, ptr %491, i32 0, i32 2
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
  br label %448, !llvm.loop !11

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
  br i1 %510, label %511, label %515

511:                                              ; preds = %508
  %512 = load ptr, ptr %5, align 8
  %513 = getelementptr inbounds nuw %struct.VarEntry, ptr %512, i32 0, i32 1
  %514 = load ptr, ptr %513, align 8
  br label %516

515:                                              ; preds = %508
  br label %516

516:                                              ; preds = %515, %511
  %517 = phi ptr [ %514, %511 ], [ null, %515 ]
  ret ptr %517
}

declare i64 @strlen(ptr noundef)

declare void @free(ptr noundef)

define dso_local i32 @TemplateRegex_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %8, i32 0, i32 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %13, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @Helper_checksum_string(ptr noundef %15)
  %17 = add i32 %12, %16
  ret i32 %17
}

declare i32 @Helper_checksum_string(ptr noundef)

define dso_local void @TemplateRegex_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %8, i32 0, i32 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %1
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %18, i32 0, i32 2
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %1
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %31

25:                                               ; preds = %20
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %29, i32 0, i32 4
  store ptr null, ptr %30, align 8
  br label %31

31:                                               ; preds = %25, %20
  %32 = load ptr, ptr %4, align 8
  call void @clear_vars(ptr noundef %32)
  %33 = load ptr, ptr %3, align 8
  %34 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %33, i32 0, i32 2
  %35 = load ptr, ptr %34, align 8
  %36 = icmp ne ptr %35, null
  br i1 %36, label %37, label %43

37:                                               ; preds = %31
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %38, i32 0, i32 2
  %40 = load ptr, ptr %39, align 8
  call void @pcre2_match_data_free_8(ptr noundef %40)
  %41 = load ptr, ptr %3, align 8
  %42 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %41, i32 0, i32 2
  store ptr null, ptr %42, align 8
  br label %43

43:                                               ; preds = %37, %31
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %44, i32 0, i32 1
  %46 = load ptr, ptr %45, align 8
  %47 = icmp ne ptr %46, null
  br i1 %47, label %48, label %54

48:                                               ; preds = %43
  %49 = load ptr, ptr %3, align 8
  %50 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %49, i32 0, i32 1
  %51 = load ptr, ptr %50, align 8
  call void @pcre2_code_free_8(ptr noundef %51)
  %52 = load ptr, ptr %3, align 8
  %53 = getelementptr inbounds nuw %struct.TemplateRegexData, ptr %52, i32 0, i32 1
  store ptr null, ptr %53, align 8
  br label %54

54:                                               ; preds = %48, %43
  %55 = load ptr, ptr %4, align 8
  %56 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %55, i32 0, i32 3
  store i64 0, ptr %56, align 8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %57, i32 0, i32 5
  store i64 0, ptr %58, align 8
  %59 = load ptr, ptr %4, align 8
  %60 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %59, i32 0, i32 1
  store i32 0, ptr %60, align 4
  ret void
}

define internal void @clear_vars(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %8 = load ptr, ptr %2, align 8
  %9 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %8, i32 0, i32 6
  %10 = load ptr, ptr %9, align 8
  store ptr %10, ptr %3, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %11, i32 0, i32 6
  %13 = load ptr, ptr %12, align 8
  %14 = icmp ne ptr %13, null
  br i1 %14, label %15, label %22

15:                                               ; preds = %1
  %16 = load ptr, ptr %2, align 8
  %17 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %16, i32 0, i32 6
  %18 = load ptr, ptr %17, align 8
  %19 = getelementptr inbounds nuw %struct.VarEntry, ptr %18, i32 0, i32 2
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
  %31 = getelementptr inbounds nuw %struct.VarEntry, ptr %30, i32 0, i32 2
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
  %43 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %42, i32 0, i32 6
  %44 = load ptr, ptr %43, align 8
  %45 = getelementptr inbounds nuw %struct.VarEntry, ptr %44, i32 0, i32 2
  %46 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %45, i32 0, i32 0
  %47 = load ptr, ptr %46, align 8
  %48 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %47, i32 0, i32 0
  %49 = load ptr, ptr %48, align 8
  call void @free(ptr noundef %49)
  %50 = load ptr, ptr %2, align 8
  %51 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %50, i32 0, i32 6
  %52 = load ptr, ptr %51, align 8
  %53 = getelementptr inbounds nuw %struct.VarEntry, ptr %52, i32 0, i32 2
  %54 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %53, i32 0, i32 0
  %55 = load ptr, ptr %54, align 8
  call void @free(ptr noundef %55)
  %56 = load ptr, ptr %2, align 8
  %57 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %56, i32 0, i32 6
  store ptr null, ptr %57, align 8
  br label %221

58:                                               ; preds = %36, %29
  %59 = load ptr, ptr %5, align 8
  %60 = load ptr, ptr %2, align 8
  %61 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %60, i32 0, i32 6
  %62 = load ptr, ptr %61, align 8
  %63 = getelementptr inbounds nuw %struct.VarEntry, ptr %62, i32 0, i32 2
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
  %74 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %73, i32 0, i32 6
  %75 = load ptr, ptr %74, align 8
  %76 = getelementptr inbounds nuw %struct.VarEntry, ptr %75, i32 0, i32 2
  %77 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %76, i32 0, i32 0
  %78 = load ptr, ptr %77, align 8
  %79 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %78, i32 0, i32 5
  %80 = load i64, ptr %79, align 8
  %81 = getelementptr inbounds i8, ptr %72, i64 %80
  %82 = load ptr, ptr %2, align 8
  %83 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %82, i32 0, i32 6
  %84 = load ptr, ptr %83, align 8
  %85 = getelementptr inbounds nuw %struct.VarEntry, ptr %84, i32 0, i32 2
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
  %102 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %101, i32 0, i32 6
  %103 = load ptr, ptr %102, align 8
  %104 = getelementptr inbounds nuw %struct.VarEntry, ptr %103, i32 0, i32 2
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
  %117 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %116, i32 0, i32 6
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
  %132 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %131, i32 0, i32 6
  %133 = load ptr, ptr %132, align 8
  %134 = getelementptr inbounds nuw %struct.VarEntry, ptr %133, i32 0, i32 2
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
  %147 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %146, i32 0, i32 6
  %148 = load ptr, ptr %147, align 8
  %149 = getelementptr inbounds nuw %struct.VarEntry, ptr %148, i32 0, i32 2
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
  %159 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %158, i32 0, i32 6
  %160 = load ptr, ptr %159, align 8
  %161 = getelementptr inbounds nuw %struct.VarEntry, ptr %160, i32 0, i32 2
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
  %213 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %212, i32 0, i32 6
  %214 = load ptr, ptr %213, align 8
  %215 = getelementptr inbounds nuw %struct.VarEntry, ptr %214, i32 0, i32 2
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
  %224 = getelementptr inbounds nuw %struct.VarEntry, ptr %223, i32 0, i32 0
  %225 = load ptr, ptr %224, align 8
  call void @free(ptr noundef %225)
  %226 = load ptr, ptr %3, align 8
  %227 = getelementptr inbounds nuw %struct.VarEntry, ptr %226, i32 0, i32 1
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
  %236 = getelementptr inbounds nuw %struct.VarEntry, ptr %235, i32 0, i32 2
  %237 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %236, i32 0, i32 2
  %238 = load ptr, ptr %237, align 8
  br label %240

239:                                              ; preds = %230
  br label %240

240:                                              ; preds = %239, %234
  %241 = phi ptr [ %238, %234 ], [ null, %239 ]
  store ptr %241, ptr %4, align 8
  br label %25, !llvm.loop !12

242:                                              ; preds = %25
  ret void
}

declare void @pcre2_match_data_free_8(ptr noundef)

declare void @pcre2_code_free_8(ptr noundef)

define dso_local ptr @TemplateRegex_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.1)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 64)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 3
  store ptr @TemplateRegex_prepare, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 4
  store ptr @TemplateRegex_run, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 7
  store ptr @TemplateRegex_checksum, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 10
  store ptr @TemplateRegex_cleanup, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define dso_local void @TemplateParse_prepare(ptr noundef %0) {
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
  %13 = getelementptr inbounds nuw %struct.TemplateParseData, ptr %12, i32 0, i32 0
  %14 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %13, i32 0, i32 0
  store i32 %11, ptr %14, align 8
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.TemplateParseData, ptr %15, i32 0, i32 0
  %17 = call i32 @prepare_template(ptr noundef %16)
  ret void
}

define dso_local void @TemplateParse_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  %13 = alloca i64, align 8
  %14 = alloca ptr, align 8
  %15 = alloca ptr, align 8
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %19 = load i32, ptr %4, align 4
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.Benchmark, ptr %20, i32 0, i32 11
  %22 = load ptr, ptr %21, align 8
  store ptr %22, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = getelementptr inbounds nuw %struct.TemplateParseData, ptr %23, i32 0, i32 0
  store ptr %24, ptr %6, align 8
  %25 = load ptr, ptr %6, align 8
  %26 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  %28 = icmp ne ptr %27, null
  br i1 %28, label %30, label %29

29:                                               ; preds = %2
  br label %234

30:                                               ; preds = %2
  %31 = load ptr, ptr %6, align 8
  %32 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %31, i32 0, i32 3
  %33 = load i64, ptr %32, align 8
  %34 = uitofp i64 %33 to double
  %35 = fmul double %34, 1.500000e+00
  %36 = fptoui double %35 to i64
  %37 = add i64 %36, 1
  store i64 %37, ptr %7, align 8
  %38 = load i64, ptr %7, align 8
  %39 = call noalias ptr @malloc(i64 noundef %38)
  store ptr %39, ptr %8, align 8
  %40 = load ptr, ptr %8, align 8
  %41 = icmp ne ptr %40, null
  br i1 %41, label %43, label %42

42:                                               ; preds = %30
  br label %234

43:                                               ; preds = %30
  store i64 0, ptr %9, align 8
  store i64 0, ptr %10, align 8
  %44 = load ptr, ptr %6, align 8
  %45 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %44, i32 0, i32 3
  %46 = load i64, ptr %45, align 8
  store i64 %46, ptr %11, align 8
  br label %47

47:                                               ; preds = %196, %191, %43
  %48 = load i64, ptr %10, align 8
  %49 = load i64, ptr %11, align 8
  %50 = icmp ult i64 %48, %49
  br i1 %50, label %51, label %209

51:                                               ; preds = %47
  %52 = load i64, ptr %10, align 8
  %53 = add i64 %52, 1
  %54 = load i64, ptr %11, align 8
  %55 = icmp ult i64 %53, %54
  br i1 %55, label %56, label %196

56:                                               ; preds = %51
  %57 = load ptr, ptr %6, align 8
  %58 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %57, i32 0, i32 2
  %59 = load ptr, ptr %58, align 8
  %60 = load i64, ptr %10, align 8
  %61 = getelementptr inbounds nuw i8, ptr %59, i64 %60
  %62 = load i8, ptr %61, align 1
  %63 = sext i8 %62 to i32
  %64 = icmp eq i32 %63, 123
  br i1 %64, label %65, label %196

65:                                               ; preds = %56
  %66 = load ptr, ptr %6, align 8
  %67 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %66, i32 0, i32 2
  %68 = load ptr, ptr %67, align 8
  %69 = load i64, ptr %10, align 8
  %70 = add i64 %69, 1
  %71 = getelementptr inbounds nuw i8, ptr %68, i64 %70
  %72 = load i8, ptr %71, align 1
  %73 = sext i8 %72 to i32
  %74 = icmp eq i32 %73, 123
  br i1 %74, label %75, label %196

75:                                               ; preds = %65
  %76 = load i64, ptr %10, align 8
  %77 = add i64 %76, 2
  store i64 %77, ptr %12, align 8
  br label %78

78:                                               ; preds = %103, %75
  %79 = load i64, ptr %12, align 8
  %80 = add i64 %79, 1
  %81 = load i64, ptr %11, align 8
  %82 = icmp ult i64 %80, %81
  br i1 %82, label %83, label %106

83:                                               ; preds = %78
  %84 = load ptr, ptr %6, align 8
  %85 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %84, i32 0, i32 2
  %86 = load ptr, ptr %85, align 8
  %87 = load i64, ptr %12, align 8
  %88 = getelementptr inbounds nuw i8, ptr %86, i64 %87
  %89 = load i8, ptr %88, align 1
  %90 = sext i8 %89 to i32
  %91 = icmp eq i32 %90, 125
  br i1 %91, label %92, label %103

92:                                               ; preds = %83
  %93 = load ptr, ptr %6, align 8
  %94 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %93, i32 0, i32 2
  %95 = load ptr, ptr %94, align 8
  %96 = load i64, ptr %12, align 8
  %97 = add i64 %96, 1
  %98 = getelementptr inbounds nuw i8, ptr %95, i64 %97
  %99 = load i8, ptr %98, align 1
  %100 = sext i8 %99 to i32
  %101 = icmp eq i32 %100, 125
  br i1 %101, label %102, label %103

102:                                              ; preds = %92
  br label %106

103:                                              ; preds = %92, %83
  %104 = load i64, ptr %12, align 8
  %105 = add i64 %104, 1
  store i64 %105, ptr %12, align 8
  br label %78, !llvm.loop !13

106:                                              ; preds = %102, %78
  %107 = load i64, ptr %12, align 8
  %108 = add i64 %107, 1
  %109 = load i64, ptr %11, align 8
  %110 = icmp ult i64 %108, %109
  br i1 %110, label %111, label %195

111:                                              ; preds = %106
  %112 = load i64, ptr %12, align 8
  %113 = load i64, ptr %10, align 8
  %114 = sub i64 %112, %113
  %115 = sub i64 %114, 2
  store i64 %115, ptr %13, align 8
  %116 = load i64, ptr %13, align 8
  %117 = add i64 %116, 1
  %118 = call noalias ptr @malloc(i64 noundef %117)
  store ptr %118, ptr %14, align 8
  %119 = load ptr, ptr %14, align 8
  %120 = load ptr, ptr %6, align 8
  %121 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %120, i32 0, i32 2
  %122 = load ptr, ptr %121, align 8
  %123 = load i64, ptr %10, align 8
  %124 = getelementptr inbounds nuw i8, ptr %122, i64 %123
  %125 = getelementptr inbounds i8, ptr %124, i64 2
  %126 = load i64, ptr %13, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %119, ptr align 1 %125, i64 %126, i1 false)
  %127 = load ptr, ptr %14, align 8
  %128 = load i64, ptr %13, align 8
  %129 = getelementptr inbounds nuw i8, ptr %127, i64 %128
  store i8 0, ptr %129, align 1
  %130 = load ptr, ptr %14, align 8
  store ptr %130, ptr %15, align 8
  br label %131

131:                                              ; preds = %143, %111
  %132 = load ptr, ptr %15, align 8
  %133 = load i8, ptr %132, align 1
  %134 = sext i8 %133 to i32
  %135 = icmp eq i32 %134, 32
  br i1 %135, label %141, label %136

136:                                              ; preds = %131
  %137 = load ptr, ptr %15, align 8
  %138 = load i8, ptr %137, align 1
  %139 = sext i8 %138 to i32
  %140 = icmp eq i32 %139, 9
  br label %141

141:                                              ; preds = %136, %131
  %142 = phi i1 [ true, %131 ], [ %140, %136 ]
  br i1 %142, label %143, label %146

143:                                              ; preds = %141
  %144 = load ptr, ptr %15, align 8
  %145 = getelementptr inbounds nuw i8, ptr %144, i32 1
  store ptr %145, ptr %15, align 8
  br label %131, !llvm.loop !14

146:                                              ; preds = %141
  %147 = load ptr, ptr %14, align 8
  %148 = load i64, ptr %13, align 8
  %149 = getelementptr inbounds nuw i8, ptr %147, i64 %148
  %150 = getelementptr inbounds i8, ptr %149, i64 -1
  store ptr %150, ptr %16, align 8
  br label %151

151:                                              ; preds = %169, %146
  %152 = load ptr, ptr %16, align 8
  %153 = load ptr, ptr %15, align 8
  %154 = icmp ugt ptr %152, %153
  br i1 %154, label %155, label %167

155:                                              ; preds = %151
  %156 = load ptr, ptr %16, align 8
  %157 = load i8, ptr %156, align 1
  %158 = sext i8 %157 to i32
  %159 = icmp eq i32 %158, 32
  br i1 %159, label %165, label %160

160:                                              ; preds = %155
  %161 = load ptr, ptr %16, align 8
  %162 = load i8, ptr %161, align 1
  %163 = sext i8 %162 to i32
  %164 = icmp eq i32 %163, 9
  br label %165

165:                                              ; preds = %160, %155
  %166 = phi i1 [ true, %155 ], [ %164, %160 ]
  br label %167

167:                                              ; preds = %165, %151
  %168 = phi i1 [ false, %151 ], [ %166, %165 ]
  br i1 %168, label %169, label %172

169:                                              ; preds = %167
  %170 = load ptr, ptr %16, align 8
  %171 = getelementptr inbounds i8, ptr %170, i32 -1
  store ptr %171, ptr %16, align 8
  br label %151, !llvm.loop !15

172:                                              ; preds = %167
  %173 = load ptr, ptr %16, align 8
  %174 = getelementptr inbounds i8, ptr %173, i64 1
  store i8 0, ptr %174, align 1
  %175 = load ptr, ptr %6, align 8
  %176 = load ptr, ptr %15, align 8
  %177 = call ptr @get_var(ptr noundef %175, ptr noundef %176)
  store ptr %177, ptr %17, align 8
  %178 = load ptr, ptr %17, align 8
  %179 = icmp ne ptr %178, null
  br i1 %179, label %180, label %191

180:                                              ; preds = %172
  %181 = load ptr, ptr %17, align 8
  %182 = call i64 @strlen(ptr noundef %181)
  store i64 %182, ptr %18, align 8
  %183 = load ptr, ptr %8, align 8
  %184 = load i64, ptr %9, align 8
  %185 = getelementptr inbounds nuw i8, ptr %183, i64 %184
  %186 = load ptr, ptr %17, align 8
  %187 = load i64, ptr %18, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %185, ptr align 1 %186, i64 %187, i1 false)
  %188 = load i64, ptr %18, align 8
  %189 = load i64, ptr %9, align 8
  %190 = add i64 %189, %188
  store i64 %190, ptr %9, align 8
  br label %191

191:                                              ; preds = %180, %172
  %192 = load ptr, ptr %14, align 8
  call void @free(ptr noundef %192)
  %193 = load i64, ptr %12, align 8
  %194 = add i64 %193, 2
  store i64 %194, ptr %10, align 8
  br label %47, !llvm.loop !16

195:                                              ; preds = %106
  br label %196

196:                                              ; preds = %195, %65, %56, %51
  %197 = load ptr, ptr %6, align 8
  %198 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %197, i32 0, i32 2
  %199 = load ptr, ptr %198, align 8
  %200 = load i64, ptr %10, align 8
  %201 = getelementptr inbounds nuw i8, ptr %199, i64 %200
  %202 = load i8, ptr %201, align 1
  %203 = load ptr, ptr %8, align 8
  %204 = load i64, ptr %9, align 8
  %205 = add i64 %204, 1
  store i64 %205, ptr %9, align 8
  %206 = getelementptr inbounds nuw i8, ptr %203, i64 %204
  store i8 %202, ptr %206, align 1
  %207 = load i64, ptr %10, align 8
  %208 = add i64 %207, 1
  store i64 %208, ptr %10, align 8
  br label %47, !llvm.loop !16

209:                                              ; preds = %47
  %210 = load ptr, ptr %8, align 8
  %211 = load i64, ptr %9, align 8
  %212 = getelementptr inbounds nuw i8, ptr %210, i64 %211
  store i8 0, ptr %212, align 1
  %213 = load ptr, ptr %6, align 8
  %214 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %213, i32 0, i32 4
  %215 = load ptr, ptr %214, align 8
  %216 = icmp ne ptr %215, null
  br i1 %216, label %217, label %221

217:                                              ; preds = %209
  %218 = load ptr, ptr %6, align 8
  %219 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %218, i32 0, i32 4
  %220 = load ptr, ptr %219, align 8
  call void @free(ptr noundef %220)
  br label %221

221:                                              ; preds = %217, %209
  %222 = load ptr, ptr %8, align 8
  %223 = load ptr, ptr %6, align 8
  %224 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %223, i32 0, i32 4
  store ptr %222, ptr %224, align 8
  %225 = load i64, ptr %9, align 8
  %226 = load ptr, ptr %6, align 8
  %227 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %226, i32 0, i32 5
  store i64 %225, ptr %227, align 8
  %228 = load i64, ptr %9, align 8
  %229 = trunc i64 %228 to i32
  %230 = load ptr, ptr %6, align 8
  %231 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %230, i32 0, i32 1
  %232 = load i32, ptr %231, align 4
  %233 = add i32 %232, %229
  store i32 %233, ptr %231, align 4
  br label %234

234:                                              ; preds = %221, %42, %29
  ret void
}

define dso_local i32 @TemplateParse_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.TemplateParseData, ptr %8, i32 0, i32 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %10, i32 0, i32 1
  %12 = load i32, ptr %11, align 4
  %13 = load ptr, ptr %4, align 8
  %14 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %13, i32 0, i32 4
  %15 = load ptr, ptr %14, align 8
  %16 = call i32 @Helper_checksum_string(ptr noundef %15)
  %17 = add i32 %12, %16
  ret i32 %17
}

define dso_local void @TemplateParse_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds nuw %struct.Benchmark, ptr %5, i32 0, i32 11
  %7 = load ptr, ptr %6, align 8
  store ptr %7, ptr %3, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds nuw %struct.TemplateParseData, ptr %8, i32 0, i32 0
  store ptr %9, ptr %4, align 8
  %10 = load ptr, ptr %4, align 8
  %11 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %10, i32 0, i32 2
  %12 = load ptr, ptr %11, align 8
  %13 = icmp ne ptr %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %1
  %15 = load ptr, ptr %4, align 8
  %16 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %15, i32 0, i32 2
  %17 = load ptr, ptr %16, align 8
  call void @free(ptr noundef %17)
  %18 = load ptr, ptr %4, align 8
  %19 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %18, i32 0, i32 2
  store ptr null, ptr %19, align 8
  br label %20

20:                                               ; preds = %14, %1
  %21 = load ptr, ptr %4, align 8
  %22 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %21, i32 0, i32 4
  %23 = load ptr, ptr %22, align 8
  %24 = icmp ne ptr %23, null
  br i1 %24, label %25, label %31

25:                                               ; preds = %20
  %26 = load ptr, ptr %4, align 8
  %27 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %26, i32 0, i32 4
  %28 = load ptr, ptr %27, align 8
  call void @free(ptr noundef %28)
  %29 = load ptr, ptr %4, align 8
  %30 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %29, i32 0, i32 4
  store ptr null, ptr %30, align 8
  br label %31

31:                                               ; preds = %25, %20
  %32 = load ptr, ptr %4, align 8
  call void @clear_vars(ptr noundef %32)
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %33, i32 0, i32 3
  store i64 0, ptr %34, align 8
  %35 = load ptr, ptr %4, align 8
  %36 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %35, i32 0, i32 5
  store i64 0, ptr %36, align 8
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %37, i32 0, i32 1
  store i32 0, ptr %38, align 4
  ret void
}

define dso_local ptr @TemplateParse_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 48)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  %6 = load ptr, ptr %1, align 8
  %7 = getelementptr inbounds nuw %struct.Benchmark, ptr %6, i32 0, i32 11
  store ptr %5, ptr %7, align 8
  %8 = load ptr, ptr %1, align 8
  %9 = getelementptr inbounds nuw %struct.Benchmark, ptr %8, i32 0, i32 3
  store ptr @TemplateParse_prepare, ptr %9, align 8
  %10 = load ptr, ptr %1, align 8
  %11 = getelementptr inbounds nuw %struct.Benchmark, ptr %10, i32 0, i32 4
  store ptr @TemplateParse_run, ptr %11, align 8
  %12 = load ptr, ptr %1, align 8
  %13 = getelementptr inbounds nuw %struct.Benchmark, ptr %12, i32 0, i32 7
  store ptr @TemplateParse_checksum, ptr %13, align 8
  %14 = load ptr, ptr %1, align 8
  %15 = getelementptr inbounds nuw %struct.Benchmark, ptr %14, i32 0, i32 10
  store ptr @TemplateParse_cleanup, ptr %15, align 8
  %16 = load ptr, ptr %1, align 8
  ret ptr %16
}

declare i32 @sprintf(ptr noundef, ptr noundef, ...)

define internal void @add_var(ptr noundef %0, ptr noundef %1, ptr noundef %2) {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %21 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %21, ptr %7, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = call noalias ptr @strdup(ptr noundef %22)
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds nuw %struct.VarEntry, ptr %24, i32 0, i32 0
  store ptr %23, ptr %25, align 8
  %26 = load ptr, ptr %6, align 8
  %27 = call noalias ptr @strdup(ptr noundef %26)
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds nuw %struct.VarEntry, ptr %28, i32 0, i32 1
  store ptr %27, ptr %29, align 8
  br label %30

30:                                               ; preds = %3
  br label %31

31:                                               ; preds = %30
  br label %32

32:                                               ; preds = %31
  %33 = load ptr, ptr %7, align 8
  %34 = getelementptr inbounds nuw %struct.VarEntry, ptr %33, i32 0, i32 0
  %35 = load ptr, ptr %34, align 8
  store ptr %35, ptr %12, align 8
  store i32 -17973521, ptr %8, align 4
  store i32 -1640531527, ptr %10, align 4
  store i32 -1640531527, ptr %9, align 4
  %36 = load ptr, ptr %7, align 8
  %37 = getelementptr inbounds nuw %struct.VarEntry, ptr %36, i32 0, i32 0
  %38 = load ptr, ptr %37, align 8
  %39 = call i64 @strlen(ptr noundef %38)
  %40 = trunc i64 %39 to i32
  store i32 %40, ptr %11, align 4
  br label %41

41:                                               ; preds = %208, %32
  %42 = load i32, ptr %11, align 4
  %43 = icmp uge i32 %42, 12
  br i1 %43, label %44, label %213

44:                                               ; preds = %41
  %45 = load ptr, ptr %12, align 8
  %46 = getelementptr inbounds i8, ptr %45, i64 0
  %47 = load i8, ptr %46, align 1
  %48 = zext i8 %47 to i32
  %49 = load ptr, ptr %12, align 8
  %50 = getelementptr inbounds i8, ptr %49, i64 1
  %51 = load i8, ptr %50, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 8
  %54 = add i32 %48, %53
  %55 = load ptr, ptr %12, align 8
  %56 = getelementptr inbounds i8, ptr %55, i64 2
  %57 = load i8, ptr %56, align 1
  %58 = zext i8 %57 to i32
  %59 = shl i32 %58, 16
  %60 = add i32 %54, %59
  %61 = load ptr, ptr %12, align 8
  %62 = getelementptr inbounds i8, ptr %61, i64 3
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = shl i32 %64, 24
  %66 = add i32 %60, %65
  %67 = load i32, ptr %9, align 4
  %68 = add i32 %67, %66
  store i32 %68, ptr %9, align 4
  %69 = load ptr, ptr %12, align 8
  %70 = getelementptr inbounds i8, ptr %69, i64 4
  %71 = load i8, ptr %70, align 1
  %72 = zext i8 %71 to i32
  %73 = load ptr, ptr %12, align 8
  %74 = getelementptr inbounds i8, ptr %73, i64 5
  %75 = load i8, ptr %74, align 1
  %76 = zext i8 %75 to i32
  %77 = shl i32 %76, 8
  %78 = add i32 %72, %77
  %79 = load ptr, ptr %12, align 8
  %80 = getelementptr inbounds i8, ptr %79, i64 6
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 16
  %84 = add i32 %78, %83
  %85 = load ptr, ptr %12, align 8
  %86 = getelementptr inbounds i8, ptr %85, i64 7
  %87 = load i8, ptr %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl i32 %88, 24
  %90 = add i32 %84, %89
  %91 = load i32, ptr %10, align 4
  %92 = add i32 %91, %90
  store i32 %92, ptr %10, align 4
  %93 = load ptr, ptr %12, align 8
  %94 = getelementptr inbounds i8, ptr %93, i64 8
  %95 = load i8, ptr %94, align 1
  %96 = zext i8 %95 to i32
  %97 = load ptr, ptr %12, align 8
  %98 = getelementptr inbounds i8, ptr %97, i64 9
  %99 = load i8, ptr %98, align 1
  %100 = zext i8 %99 to i32
  %101 = shl i32 %100, 8
  %102 = add i32 %96, %101
  %103 = load ptr, ptr %12, align 8
  %104 = getelementptr inbounds i8, ptr %103, i64 10
  %105 = load i8, ptr %104, align 1
  %106 = zext i8 %105 to i32
  %107 = shl i32 %106, 16
  %108 = add i32 %102, %107
  %109 = load ptr, ptr %12, align 8
  %110 = getelementptr inbounds i8, ptr %109, i64 11
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = shl i32 %112, 24
  %114 = add i32 %108, %113
  %115 = load i32, ptr %8, align 4
  %116 = add i32 %115, %114
  store i32 %116, ptr %8, align 4
  br label %117

117:                                              ; preds = %44
  %118 = load i32, ptr %10, align 4
  %119 = load i32, ptr %9, align 4
  %120 = sub i32 %119, %118
  store i32 %120, ptr %9, align 4
  %121 = load i32, ptr %8, align 4
  %122 = load i32, ptr %9, align 4
  %123 = sub i32 %122, %121
  store i32 %123, ptr %9, align 4
  %124 = load i32, ptr %8, align 4
  %125 = lshr i32 %124, 13
  %126 = load i32, ptr %9, align 4
  %127 = xor i32 %126, %125
  store i32 %127, ptr %9, align 4
  %128 = load i32, ptr %8, align 4
  %129 = load i32, ptr %10, align 4
  %130 = sub i32 %129, %128
  store i32 %130, ptr %10, align 4
  %131 = load i32, ptr %9, align 4
  %132 = load i32, ptr %10, align 4
  %133 = sub i32 %132, %131
  store i32 %133, ptr %10, align 4
  %134 = load i32, ptr %9, align 4
  %135 = shl i32 %134, 8
  %136 = load i32, ptr %10, align 4
  %137 = xor i32 %136, %135
  store i32 %137, ptr %10, align 4
  %138 = load i32, ptr %9, align 4
  %139 = load i32, ptr %8, align 4
  %140 = sub i32 %139, %138
  store i32 %140, ptr %8, align 4
  %141 = load i32, ptr %10, align 4
  %142 = load i32, ptr %8, align 4
  %143 = sub i32 %142, %141
  store i32 %143, ptr %8, align 4
  %144 = load i32, ptr %10, align 4
  %145 = lshr i32 %144, 13
  %146 = load i32, ptr %8, align 4
  %147 = xor i32 %146, %145
  store i32 %147, ptr %8, align 4
  %148 = load i32, ptr %10, align 4
  %149 = load i32, ptr %9, align 4
  %150 = sub i32 %149, %148
  store i32 %150, ptr %9, align 4
  %151 = load i32, ptr %8, align 4
  %152 = load i32, ptr %9, align 4
  %153 = sub i32 %152, %151
  store i32 %153, ptr %9, align 4
  %154 = load i32, ptr %8, align 4
  %155 = lshr i32 %154, 12
  %156 = load i32, ptr %9, align 4
  %157 = xor i32 %156, %155
  store i32 %157, ptr %9, align 4
  %158 = load i32, ptr %8, align 4
  %159 = load i32, ptr %10, align 4
  %160 = sub i32 %159, %158
  store i32 %160, ptr %10, align 4
  %161 = load i32, ptr %9, align 4
  %162 = load i32, ptr %10, align 4
  %163 = sub i32 %162, %161
  store i32 %163, ptr %10, align 4
  %164 = load i32, ptr %9, align 4
  %165 = shl i32 %164, 16
  %166 = load i32, ptr %10, align 4
  %167 = xor i32 %166, %165
  store i32 %167, ptr %10, align 4
  %168 = load i32, ptr %9, align 4
  %169 = load i32, ptr %8, align 4
  %170 = sub i32 %169, %168
  store i32 %170, ptr %8, align 4
  %171 = load i32, ptr %10, align 4
  %172 = load i32, ptr %8, align 4
  %173 = sub i32 %172, %171
  store i32 %173, ptr %8, align 4
  %174 = load i32, ptr %10, align 4
  %175 = lshr i32 %174, 5
  %176 = load i32, ptr %8, align 4
  %177 = xor i32 %176, %175
  store i32 %177, ptr %8, align 4
  %178 = load i32, ptr %10, align 4
  %179 = load i32, ptr %9, align 4
  %180 = sub i32 %179, %178
  store i32 %180, ptr %9, align 4
  %181 = load i32, ptr %8, align 4
  %182 = load i32, ptr %9, align 4
  %183 = sub i32 %182, %181
  store i32 %183, ptr %9, align 4
  %184 = load i32, ptr %8, align 4
  %185 = lshr i32 %184, 3
  %186 = load i32, ptr %9, align 4
  %187 = xor i32 %186, %185
  store i32 %187, ptr %9, align 4
  %188 = load i32, ptr %8, align 4
  %189 = load i32, ptr %10, align 4
  %190 = sub i32 %189, %188
  store i32 %190, ptr %10, align 4
  %191 = load i32, ptr %9, align 4
  %192 = load i32, ptr %10, align 4
  %193 = sub i32 %192, %191
  store i32 %193, ptr %10, align 4
  %194 = load i32, ptr %9, align 4
  %195 = shl i32 %194, 10
  %196 = load i32, ptr %10, align 4
  %197 = xor i32 %196, %195
  store i32 %197, ptr %10, align 4
  %198 = load i32, ptr %9, align 4
  %199 = load i32, ptr %8, align 4
  %200 = sub i32 %199, %198
  store i32 %200, ptr %8, align 4
  %201 = load i32, ptr %10, align 4
  %202 = load i32, ptr %8, align 4
  %203 = sub i32 %202, %201
  store i32 %203, ptr %8, align 4
  %204 = load i32, ptr %10, align 4
  %205 = lshr i32 %204, 15
  %206 = load i32, ptr %8, align 4
  %207 = xor i32 %206, %205
  store i32 %207, ptr %8, align 4
  br label %208

208:                                              ; preds = %117
  %209 = load ptr, ptr %12, align 8
  %210 = getelementptr inbounds i8, ptr %209, i64 12
  store ptr %210, ptr %12, align 8
  %211 = load i32, ptr %11, align 4
  %212 = sub i32 %211, 12
  store i32 %212, ptr %11, align 4
  br label %41, !llvm.loop !17

213:                                              ; preds = %41
  %214 = load ptr, ptr %7, align 8
  %215 = getelementptr inbounds nuw %struct.VarEntry, ptr %214, i32 0, i32 0
  %216 = load ptr, ptr %215, align 8
  %217 = call i64 @strlen(ptr noundef %216)
  %218 = trunc i64 %217 to i32
  %219 = load i32, ptr %8, align 4
  %220 = add i32 %219, %218
  store i32 %220, ptr %8, align 4
  %221 = load i32, ptr %11, align 4
  switch i32 %221, label %308 [
    i32 11, label %222
    i32 10, label %230
    i32 9, label %238
    i32 8, label %246
    i32 7, label %254
    i32 6, label %262
    i32 5, label %270
    i32 4, label %277
    i32 3, label %285
    i32 2, label %293
    i32 1, label %301
  ]

222:                                              ; preds = %213
  %223 = load ptr, ptr %12, align 8
  %224 = getelementptr inbounds i8, ptr %223, i64 10
  %225 = load i8, ptr %224, align 1
  %226 = zext i8 %225 to i32
  %227 = shl i32 %226, 24
  %228 = load i32, ptr %8, align 4
  %229 = add i32 %228, %227
  store i32 %229, ptr %8, align 4
  br label %230

230:                                              ; preds = %213, %222
  %231 = load ptr, ptr %12, align 8
  %232 = getelementptr inbounds i8, ptr %231, i64 9
  %233 = load i8, ptr %232, align 1
  %234 = zext i8 %233 to i32
  %235 = shl i32 %234, 16
  %236 = load i32, ptr %8, align 4
  %237 = add i32 %236, %235
  store i32 %237, ptr %8, align 4
  br label %238

238:                                              ; preds = %213, %230
  %239 = load ptr, ptr %12, align 8
  %240 = getelementptr inbounds i8, ptr %239, i64 8
  %241 = load i8, ptr %240, align 1
  %242 = zext i8 %241 to i32
  %243 = shl i32 %242, 8
  %244 = load i32, ptr %8, align 4
  %245 = add i32 %244, %243
  store i32 %245, ptr %8, align 4
  br label %246

246:                                              ; preds = %213, %238
  %247 = load ptr, ptr %12, align 8
  %248 = getelementptr inbounds i8, ptr %247, i64 7
  %249 = load i8, ptr %248, align 1
  %250 = zext i8 %249 to i32
  %251 = shl i32 %250, 24
  %252 = load i32, ptr %10, align 4
  %253 = add i32 %252, %251
  store i32 %253, ptr %10, align 4
  br label %254

254:                                              ; preds = %213, %246
  %255 = load ptr, ptr %12, align 8
  %256 = getelementptr inbounds i8, ptr %255, i64 6
  %257 = load i8, ptr %256, align 1
  %258 = zext i8 %257 to i32
  %259 = shl i32 %258, 16
  %260 = load i32, ptr %10, align 4
  %261 = add i32 %260, %259
  store i32 %261, ptr %10, align 4
  br label %262

262:                                              ; preds = %213, %254
  %263 = load ptr, ptr %12, align 8
  %264 = getelementptr inbounds i8, ptr %263, i64 5
  %265 = load i8, ptr %264, align 1
  %266 = zext i8 %265 to i32
  %267 = shl i32 %266, 8
  %268 = load i32, ptr %10, align 4
  %269 = add i32 %268, %267
  store i32 %269, ptr %10, align 4
  br label %270

270:                                              ; preds = %213, %262
  %271 = load ptr, ptr %12, align 8
  %272 = getelementptr inbounds i8, ptr %271, i64 4
  %273 = load i8, ptr %272, align 1
  %274 = zext i8 %273 to i32
  %275 = load i32, ptr %10, align 4
  %276 = add i32 %275, %274
  store i32 %276, ptr %10, align 4
  br label %277

277:                                              ; preds = %213, %270
  %278 = load ptr, ptr %12, align 8
  %279 = getelementptr inbounds i8, ptr %278, i64 3
  %280 = load i8, ptr %279, align 1
  %281 = zext i8 %280 to i32
  %282 = shl i32 %281, 24
  %283 = load i32, ptr %9, align 4
  %284 = add i32 %283, %282
  store i32 %284, ptr %9, align 4
  br label %285

285:                                              ; preds = %213, %277
  %286 = load ptr, ptr %12, align 8
  %287 = getelementptr inbounds i8, ptr %286, i64 2
  %288 = load i8, ptr %287, align 1
  %289 = zext i8 %288 to i32
  %290 = shl i32 %289, 16
  %291 = load i32, ptr %9, align 4
  %292 = add i32 %291, %290
  store i32 %292, ptr %9, align 4
  br label %293

293:                                              ; preds = %213, %285
  %294 = load ptr, ptr %12, align 8
  %295 = getelementptr inbounds i8, ptr %294, i64 1
  %296 = load i8, ptr %295, align 1
  %297 = zext i8 %296 to i32
  %298 = shl i32 %297, 8
  %299 = load i32, ptr %9, align 4
  %300 = add i32 %299, %298
  store i32 %300, ptr %9, align 4
  br label %301

301:                                              ; preds = %213, %293
  %302 = load ptr, ptr %12, align 8
  %303 = getelementptr inbounds i8, ptr %302, i64 0
  %304 = load i8, ptr %303, align 1
  %305 = zext i8 %304 to i32
  %306 = load i32, ptr %9, align 4
  %307 = add i32 %306, %305
  store i32 %307, ptr %9, align 4
  br label %308

308:                                              ; preds = %213, %301
  br label %309

309:                                              ; preds = %308
  br label %310

310:                                              ; preds = %309
  %311 = load i32, ptr %10, align 4
  %312 = load i32, ptr %9, align 4
  %313 = sub i32 %312, %311
  store i32 %313, ptr %9, align 4
  %314 = load i32, ptr %8, align 4
  %315 = load i32, ptr %9, align 4
  %316 = sub i32 %315, %314
  store i32 %316, ptr %9, align 4
  %317 = load i32, ptr %8, align 4
  %318 = lshr i32 %317, 13
  %319 = load i32, ptr %9, align 4
  %320 = xor i32 %319, %318
  store i32 %320, ptr %9, align 4
  %321 = load i32, ptr %8, align 4
  %322 = load i32, ptr %10, align 4
  %323 = sub i32 %322, %321
  store i32 %323, ptr %10, align 4
  %324 = load i32, ptr %9, align 4
  %325 = load i32, ptr %10, align 4
  %326 = sub i32 %325, %324
  store i32 %326, ptr %10, align 4
  %327 = load i32, ptr %9, align 4
  %328 = shl i32 %327, 8
  %329 = load i32, ptr %10, align 4
  %330 = xor i32 %329, %328
  store i32 %330, ptr %10, align 4
  %331 = load i32, ptr %9, align 4
  %332 = load i32, ptr %8, align 4
  %333 = sub i32 %332, %331
  store i32 %333, ptr %8, align 4
  %334 = load i32, ptr %10, align 4
  %335 = load i32, ptr %8, align 4
  %336 = sub i32 %335, %334
  store i32 %336, ptr %8, align 4
  %337 = load i32, ptr %10, align 4
  %338 = lshr i32 %337, 13
  %339 = load i32, ptr %8, align 4
  %340 = xor i32 %339, %338
  store i32 %340, ptr %8, align 4
  %341 = load i32, ptr %10, align 4
  %342 = load i32, ptr %9, align 4
  %343 = sub i32 %342, %341
  store i32 %343, ptr %9, align 4
  %344 = load i32, ptr %8, align 4
  %345 = load i32, ptr %9, align 4
  %346 = sub i32 %345, %344
  store i32 %346, ptr %9, align 4
  %347 = load i32, ptr %8, align 4
  %348 = lshr i32 %347, 12
  %349 = load i32, ptr %9, align 4
  %350 = xor i32 %349, %348
  store i32 %350, ptr %9, align 4
  %351 = load i32, ptr %8, align 4
  %352 = load i32, ptr %10, align 4
  %353 = sub i32 %352, %351
  store i32 %353, ptr %10, align 4
  %354 = load i32, ptr %9, align 4
  %355 = load i32, ptr %10, align 4
  %356 = sub i32 %355, %354
  store i32 %356, ptr %10, align 4
  %357 = load i32, ptr %9, align 4
  %358 = shl i32 %357, 16
  %359 = load i32, ptr %10, align 4
  %360 = xor i32 %359, %358
  store i32 %360, ptr %10, align 4
  %361 = load i32, ptr %9, align 4
  %362 = load i32, ptr %8, align 4
  %363 = sub i32 %362, %361
  store i32 %363, ptr %8, align 4
  %364 = load i32, ptr %10, align 4
  %365 = load i32, ptr %8, align 4
  %366 = sub i32 %365, %364
  store i32 %366, ptr %8, align 4
  %367 = load i32, ptr %10, align 4
  %368 = lshr i32 %367, 5
  %369 = load i32, ptr %8, align 4
  %370 = xor i32 %369, %368
  store i32 %370, ptr %8, align 4
  %371 = load i32, ptr %10, align 4
  %372 = load i32, ptr %9, align 4
  %373 = sub i32 %372, %371
  store i32 %373, ptr %9, align 4
  %374 = load i32, ptr %8, align 4
  %375 = load i32, ptr %9, align 4
  %376 = sub i32 %375, %374
  store i32 %376, ptr %9, align 4
  %377 = load i32, ptr %8, align 4
  %378 = lshr i32 %377, 3
  %379 = load i32, ptr %9, align 4
  %380 = xor i32 %379, %378
  store i32 %380, ptr %9, align 4
  %381 = load i32, ptr %8, align 4
  %382 = load i32, ptr %10, align 4
  %383 = sub i32 %382, %381
  store i32 %383, ptr %10, align 4
  %384 = load i32, ptr %9, align 4
  %385 = load i32, ptr %10, align 4
  %386 = sub i32 %385, %384
  store i32 %386, ptr %10, align 4
  %387 = load i32, ptr %9, align 4
  %388 = shl i32 %387, 10
  %389 = load i32, ptr %10, align 4
  %390 = xor i32 %389, %388
  store i32 %390, ptr %10, align 4
  %391 = load i32, ptr %9, align 4
  %392 = load i32, ptr %8, align 4
  %393 = sub i32 %392, %391
  store i32 %393, ptr %8, align 4
  %394 = load i32, ptr %10, align 4
  %395 = load i32, ptr %8, align 4
  %396 = sub i32 %395, %394
  store i32 %396, ptr %8, align 4
  %397 = load i32, ptr %10, align 4
  %398 = lshr i32 %397, 15
  %399 = load i32, ptr %8, align 4
  %400 = xor i32 %399, %398
  store i32 %400, ptr %8, align 4
  br label %401

401:                                              ; preds = %310
  br label %402

402:                                              ; preds = %401
  br label %403

403:                                              ; preds = %402
  br label %404

404:                                              ; preds = %403
  %405 = load i32, ptr %8, align 4
  %406 = load ptr, ptr %7, align 8
  %407 = getelementptr inbounds nuw %struct.VarEntry, ptr %406, i32 0, i32 2
  %408 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %407, i32 0, i32 7
  store i32 %405, ptr %408, align 4
  %409 = load ptr, ptr %7, align 8
  %410 = getelementptr inbounds nuw %struct.VarEntry, ptr %409, i32 0, i32 0
  %411 = load ptr, ptr %410, align 8
  %412 = load ptr, ptr %7, align 8
  %413 = getelementptr inbounds nuw %struct.VarEntry, ptr %412, i32 0, i32 2
  %414 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %413, i32 0, i32 5
  store ptr %411, ptr %414, align 8
  %415 = load ptr, ptr %7, align 8
  %416 = getelementptr inbounds nuw %struct.VarEntry, ptr %415, i32 0, i32 0
  %417 = load ptr, ptr %416, align 8
  %418 = call i64 @strlen(ptr noundef %417)
  %419 = trunc i64 %418 to i32
  %420 = load ptr, ptr %7, align 8
  %421 = getelementptr inbounds nuw %struct.VarEntry, ptr %420, i32 0, i32 2
  %422 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %421, i32 0, i32 6
  store i32 %419, ptr %422, align 8
  %423 = load ptr, ptr %4, align 8
  %424 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %423, i32 0, i32 6
  %425 = load ptr, ptr %424, align 8
  %426 = icmp ne ptr %425, null
  br i1 %426, label %510, label %427

427:                                              ; preds = %404
  %428 = load ptr, ptr %7, align 8
  %429 = getelementptr inbounds nuw %struct.VarEntry, ptr %428, i32 0, i32 2
  %430 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %429, i32 0, i32 2
  store ptr null, ptr %430, align 8
  %431 = load ptr, ptr %7, align 8
  %432 = getelementptr inbounds nuw %struct.VarEntry, ptr %431, i32 0, i32 2
  %433 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %432, i32 0, i32 1
  store ptr null, ptr %433, align 8
  br label %434

434:                                              ; preds = %427
  %435 = call noalias ptr @malloc(i64 noundef 64)
  %436 = load ptr, ptr %7, align 8
  %437 = getelementptr inbounds nuw %struct.VarEntry, ptr %436, i32 0, i32 2
  %438 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %437, i32 0, i32 0
  store ptr %435, ptr %438, align 8
  %439 = load ptr, ptr %7, align 8
  %440 = getelementptr inbounds nuw %struct.VarEntry, ptr %439, i32 0, i32 2
  %441 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %440, i32 0, i32 0
  %442 = load ptr, ptr %441, align 8
  %443 = icmp ne ptr %442, null
  br i1 %443, label %445, label %444

444:                                              ; preds = %434
  call void @exit(i32 noundef -1)
  unreachable

445:                                              ; preds = %434
  %446 = load ptr, ptr %7, align 8
  %447 = getelementptr inbounds nuw %struct.VarEntry, ptr %446, i32 0, i32 2
  %448 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %447, i32 0, i32 0
  %449 = load ptr, ptr %448, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %449, i8 0, i64 64, i1 false)
  %450 = load ptr, ptr %7, align 8
  %451 = getelementptr inbounds nuw %struct.VarEntry, ptr %450, i32 0, i32 2
  %452 = load ptr, ptr %7, align 8
  %453 = getelementptr inbounds nuw %struct.VarEntry, ptr %452, i32 0, i32 2
  %454 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %453, i32 0, i32 0
  %455 = load ptr, ptr %454, align 8
  %456 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %455, i32 0, i32 4
  store ptr %451, ptr %456, align 8
  %457 = load ptr, ptr %7, align 8
  %458 = getelementptr inbounds nuw %struct.VarEntry, ptr %457, i32 0, i32 2
  %459 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %458, i32 0, i32 0
  %460 = load ptr, ptr %459, align 8
  %461 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %460, i32 0, i32 1
  store i32 32, ptr %461, align 8
  %462 = load ptr, ptr %7, align 8
  %463 = getelementptr inbounds nuw %struct.VarEntry, ptr %462, i32 0, i32 2
  %464 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %463, i32 0, i32 0
  %465 = load ptr, ptr %464, align 8
  %466 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %465, i32 0, i32 2
  store i32 5, ptr %466, align 4
  %467 = load ptr, ptr %7, align 8
  %468 = getelementptr inbounds nuw %struct.VarEntry, ptr %467, i32 0, i32 2
  %469 = load ptr, ptr %7, align 8
  %470 = ptrtoint ptr %468 to i64
  %471 = ptrtoint ptr %469 to i64
  %472 = sub i64 %470, %471
  %473 = load ptr, ptr %7, align 8
  %474 = getelementptr inbounds nuw %struct.VarEntry, ptr %473, i32 0, i32 2
  %475 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %474, i32 0, i32 0
  %476 = load ptr, ptr %475, align 8
  %477 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %476, i32 0, i32 5
  store i64 %472, ptr %477, align 8
  %478 = call noalias ptr @malloc(i64 noundef 512)
  %479 = load ptr, ptr %7, align 8
  %480 = getelementptr inbounds nuw %struct.VarEntry, ptr %479, i32 0, i32 2
  %481 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %480, i32 0, i32 0
  %482 = load ptr, ptr %481, align 8
  %483 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %482, i32 0, i32 0
  store ptr %478, ptr %483, align 8
  %484 = load ptr, ptr %7, align 8
  %485 = getelementptr inbounds nuw %struct.VarEntry, ptr %484, i32 0, i32 2
  %486 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %485, i32 0, i32 0
  %487 = load ptr, ptr %486, align 8
  %488 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %487, i32 0, i32 10
  store i32 -1609490463, ptr %488, align 8
  %489 = load ptr, ptr %7, align 8
  %490 = getelementptr inbounds nuw %struct.VarEntry, ptr %489, i32 0, i32 2
  %491 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %490, i32 0, i32 0
  %492 = load ptr, ptr %491, align 8
  %493 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %492, i32 0, i32 0
  %494 = load ptr, ptr %493, align 8
  %495 = icmp ne ptr %494, null
  br i1 %495, label %497, label %496

496:                                              ; preds = %445
  call void @exit(i32 noundef -1)
  unreachable

497:                                              ; preds = %445
  %498 = load ptr, ptr %7, align 8
  %499 = getelementptr inbounds nuw %struct.VarEntry, ptr %498, i32 0, i32 2
  %500 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %499, i32 0, i32 0
  %501 = load ptr, ptr %500, align 8
  %502 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %501, i32 0, i32 0
  %503 = load ptr, ptr %502, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %503, i8 0, i64 512, i1 false)
  br label %504

504:                                              ; preds = %497
  br label %505

505:                                              ; preds = %504
  br label %506

506:                                              ; preds = %505
  %507 = load ptr, ptr %7, align 8
  %508 = load ptr, ptr %4, align 8
  %509 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %508, i32 0, i32 6
  store ptr %507, ptr %509, align 8
  br label %565

510:                                              ; preds = %404
  %511 = load ptr, ptr %4, align 8
  %512 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %511, i32 0, i32 6
  %513 = load ptr, ptr %512, align 8
  %514 = getelementptr inbounds nuw %struct.VarEntry, ptr %513, i32 0, i32 2
  %515 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %514, i32 0, i32 0
  %516 = load ptr, ptr %515, align 8
  %517 = load ptr, ptr %7, align 8
  %518 = getelementptr inbounds nuw %struct.VarEntry, ptr %517, i32 0, i32 2
  %519 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %518, i32 0, i32 0
  store ptr %516, ptr %519, align 8
  br label %520

520:                                              ; preds = %510
  %521 = load ptr, ptr %7, align 8
  %522 = getelementptr inbounds nuw %struct.VarEntry, ptr %521, i32 0, i32 2
  %523 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %522, i32 0, i32 2
  store ptr null, ptr %523, align 8
  %524 = load ptr, ptr %4, align 8
  %525 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %524, i32 0, i32 6
  %526 = load ptr, ptr %525, align 8
  %527 = getelementptr inbounds nuw %struct.VarEntry, ptr %526, i32 0, i32 2
  %528 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %527, i32 0, i32 0
  %529 = load ptr, ptr %528, align 8
  %530 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %529, i32 0, i32 4
  %531 = load ptr, ptr %530, align 8
  %532 = load ptr, ptr %4, align 8
  %533 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %532, i32 0, i32 6
  %534 = load ptr, ptr %533, align 8
  %535 = getelementptr inbounds nuw %struct.VarEntry, ptr %534, i32 0, i32 2
  %536 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %535, i32 0, i32 0
  %537 = load ptr, ptr %536, align 8
  %538 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %537, i32 0, i32 5
  %539 = load i64, ptr %538, align 8
  %540 = sub i64 0, %539
  %541 = getelementptr inbounds i8, ptr %531, i64 %540
  %542 = load ptr, ptr %7, align 8
  %543 = getelementptr inbounds nuw %struct.VarEntry, ptr %542, i32 0, i32 2
  %544 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %543, i32 0, i32 1
  store ptr %541, ptr %544, align 8
  %545 = load ptr, ptr %7, align 8
  %546 = load ptr, ptr %4, align 8
  %547 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %546, i32 0, i32 6
  %548 = load ptr, ptr %547, align 8
  %549 = getelementptr inbounds nuw %struct.VarEntry, ptr %548, i32 0, i32 2
  %550 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %549, i32 0, i32 0
  %551 = load ptr, ptr %550, align 8
  %552 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %551, i32 0, i32 4
  %553 = load ptr, ptr %552, align 8
  %554 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %553, i32 0, i32 2
  store ptr %545, ptr %554, align 8
  %555 = load ptr, ptr %7, align 8
  %556 = getelementptr inbounds nuw %struct.VarEntry, ptr %555, i32 0, i32 2
  %557 = load ptr, ptr %4, align 8
  %558 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %557, i32 0, i32 6
  %559 = load ptr, ptr %558, align 8
  %560 = getelementptr inbounds nuw %struct.VarEntry, ptr %559, i32 0, i32 2
  %561 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %560, i32 0, i32 0
  %562 = load ptr, ptr %561, align 8
  %563 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %562, i32 0, i32 4
  store ptr %556, ptr %563, align 8
  br label %564

564:                                              ; preds = %520
  br label %565

565:                                              ; preds = %564, %506
  br label %566

566:                                              ; preds = %565
  %567 = load ptr, ptr %4, align 8
  %568 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %567, i32 0, i32 6
  %569 = load ptr, ptr %568, align 8
  %570 = getelementptr inbounds nuw %struct.VarEntry, ptr %569, i32 0, i32 2
  %571 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %570, i32 0, i32 0
  %572 = load ptr, ptr %571, align 8
  %573 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %572, i32 0, i32 3
  %574 = load i32, ptr %573, align 8
  %575 = add i32 %574, 1
  store i32 %575, ptr %573, align 8
  br label %576

576:                                              ; preds = %566
  %577 = load i32, ptr %8, align 4
  %578 = load ptr, ptr %4, align 8
  %579 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %578, i32 0, i32 6
  %580 = load ptr, ptr %579, align 8
  %581 = getelementptr inbounds nuw %struct.VarEntry, ptr %580, i32 0, i32 2
  %582 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %581, i32 0, i32 0
  %583 = load ptr, ptr %582, align 8
  %584 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %583, i32 0, i32 1
  %585 = load i32, ptr %584, align 8
  %586 = sub i32 %585, 1
  %587 = and i32 %577, %586
  store i32 %587, ptr %13, align 4
  br label %588

588:                                              ; preds = %576
  br label %589

589:                                              ; preds = %588
  %590 = load ptr, ptr %4, align 8
  %591 = getelementptr inbounds nuw %struct.TemplateBaseData, ptr %590, i32 0, i32 6
  %592 = load ptr, ptr %591, align 8
  %593 = getelementptr inbounds nuw %struct.VarEntry, ptr %592, i32 0, i32 2
  %594 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %593, i32 0, i32 0
  %595 = load ptr, ptr %594, align 8
  %596 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %595, i32 0, i32 0
  %597 = load ptr, ptr %596, align 8
  %598 = load i32, ptr %13, align 4
  %599 = zext i32 %598 to i64
  %600 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %597, i64 %599
  store ptr %600, ptr %14, align 8
  %601 = load ptr, ptr %14, align 8
  %602 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %601, i32 0, i32 1
  %603 = load i32, ptr %602, align 8
  %604 = add i32 %603, 1
  store i32 %604, ptr %602, align 8
  %605 = load ptr, ptr %14, align 8
  %606 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %605, i32 0, i32 0
  %607 = load ptr, ptr %606, align 8
  %608 = load ptr, ptr %7, align 8
  %609 = getelementptr inbounds nuw %struct.VarEntry, ptr %608, i32 0, i32 2
  %610 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %609, i32 0, i32 4
  store ptr %607, ptr %610, align 8
  %611 = load ptr, ptr %7, align 8
  %612 = getelementptr inbounds nuw %struct.VarEntry, ptr %611, i32 0, i32 2
  %613 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %612, i32 0, i32 3
  store ptr null, ptr %613, align 8
  %614 = load ptr, ptr %14, align 8
  %615 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %614, i32 0, i32 0
  %616 = load ptr, ptr %615, align 8
  %617 = icmp ne ptr %616, null
  br i1 %617, label %618, label %625

618:                                              ; preds = %589
  %619 = load ptr, ptr %7, align 8
  %620 = getelementptr inbounds nuw %struct.VarEntry, ptr %619, i32 0, i32 2
  %621 = load ptr, ptr %14, align 8
  %622 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %621, i32 0, i32 0
  %623 = load ptr, ptr %622, align 8
  %624 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %623, i32 0, i32 3
  store ptr %620, ptr %624, align 8
  br label %625

625:                                              ; preds = %618, %589
  %626 = load ptr, ptr %7, align 8
  %627 = getelementptr inbounds nuw %struct.VarEntry, ptr %626, i32 0, i32 2
  %628 = load ptr, ptr %14, align 8
  %629 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %628, i32 0, i32 0
  store ptr %627, ptr %629, align 8
  %630 = load ptr, ptr %14, align 8
  %631 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %630, i32 0, i32 1
  %632 = load i32, ptr %631, align 8
  %633 = load ptr, ptr %14, align 8
  %634 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %633, i32 0, i32 2
  %635 = load i32, ptr %634, align 4
  %636 = add i32 %635, 1
  %637 = mul i32 %636, 10
  %638 = icmp uge i32 %632, %637
  br i1 %638, label %639, label %901

639:                                              ; preds = %625
  %640 = load ptr, ptr %7, align 8
  %641 = getelementptr inbounds nuw %struct.VarEntry, ptr %640, i32 0, i32 2
  %642 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %641, i32 0, i32 0
  %643 = load ptr, ptr %642, align 8
  %644 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %643, i32 0, i32 9
  %645 = load i32, ptr %644, align 4
  %646 = icmp ne i32 %645, 0
  br i1 %646, label %901, label %647

647:                                              ; preds = %639
  br label %648

648:                                              ; preds = %647
  %649 = load ptr, ptr %7, align 8
  %650 = getelementptr inbounds nuw %struct.VarEntry, ptr %649, i32 0, i32 2
  %651 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %650, i32 0, i32 0
  %652 = load ptr, ptr %651, align 8
  %653 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %652, i32 0, i32 1
  %654 = load i32, ptr %653, align 8
  %655 = zext i32 %654 to i64
  %656 = mul i64 16, %655
  %657 = mul i64 %656, 2
  %658 = call noalias ptr @malloc(i64 noundef %657)
  store ptr %658, ptr %19, align 8
  %659 = load ptr, ptr %19, align 8
  %660 = icmp ne ptr %659, null
  br i1 %660, label %662, label %661

661:                                              ; preds = %648
  call void @exit(i32 noundef -1)
  unreachable

662:                                              ; preds = %648
  %663 = load ptr, ptr %19, align 8
  %664 = load ptr, ptr %7, align 8
  %665 = getelementptr inbounds nuw %struct.VarEntry, ptr %664, i32 0, i32 2
  %666 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %665, i32 0, i32 0
  %667 = load ptr, ptr %666, align 8
  %668 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %667, i32 0, i32 1
  %669 = load i32, ptr %668, align 8
  %670 = zext i32 %669 to i64
  %671 = mul i64 16, %670
  %672 = mul i64 %671, 2
  call void @llvm.memset.p0.i64(ptr align 8 %663, i8 0, i64 %672, i1 false)
  %673 = load ptr, ptr %7, align 8
  %674 = getelementptr inbounds nuw %struct.VarEntry, ptr %673, i32 0, i32 2
  %675 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %674, i32 0, i32 0
  %676 = load ptr, ptr %675, align 8
  %677 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %676, i32 0, i32 3
  %678 = load i32, ptr %677, align 8
  %679 = load ptr, ptr %7, align 8
  %680 = getelementptr inbounds nuw %struct.VarEntry, ptr %679, i32 0, i32 2
  %681 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %680, i32 0, i32 0
  %682 = load ptr, ptr %681, align 8
  %683 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %682, i32 0, i32 2
  %684 = load i32, ptr %683, align 4
  %685 = add i32 %684, 1
  %686 = lshr i32 %678, %685
  %687 = load ptr, ptr %7, align 8
  %688 = getelementptr inbounds nuw %struct.VarEntry, ptr %687, i32 0, i32 2
  %689 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %688, i32 0, i32 0
  %690 = load ptr, ptr %689, align 8
  %691 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %690, i32 0, i32 3
  %692 = load i32, ptr %691, align 8
  %693 = load ptr, ptr %7, align 8
  %694 = getelementptr inbounds nuw %struct.VarEntry, ptr %693, i32 0, i32 2
  %695 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %694, i32 0, i32 0
  %696 = load ptr, ptr %695, align 8
  %697 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %696, i32 0, i32 1
  %698 = load i32, ptr %697, align 8
  %699 = mul i32 %698, 2
  %700 = sub i32 %699, 1
  %701 = and i32 %692, %700
  %702 = icmp ne i32 %701, 0
  %703 = zext i1 %702 to i64
  %704 = select i1 %702, i32 1, i32 0
  %705 = add i32 %686, %704
  %706 = load ptr, ptr %7, align 8
  %707 = getelementptr inbounds nuw %struct.VarEntry, ptr %706, i32 0, i32 2
  %708 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %707, i32 0, i32 0
  %709 = load ptr, ptr %708, align 8
  %710 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %709, i32 0, i32 6
  store i32 %705, ptr %710, align 8
  %711 = load ptr, ptr %7, align 8
  %712 = getelementptr inbounds nuw %struct.VarEntry, ptr %711, i32 0, i32 2
  %713 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %712, i32 0, i32 0
  %714 = load ptr, ptr %713, align 8
  %715 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %714, i32 0, i32 7
  store i32 0, ptr %715, align 4
  store i32 0, ptr %16, align 4
  br label %716

716:                                              ; preds = %825, %662
  %717 = load i32, ptr %16, align 4
  %718 = load ptr, ptr %7, align 8
  %719 = getelementptr inbounds nuw %struct.VarEntry, ptr %718, i32 0, i32 2
  %720 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %719, i32 0, i32 0
  %721 = load ptr, ptr %720, align 8
  %722 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %721, i32 0, i32 1
  %723 = load i32, ptr %722, align 8
  %724 = icmp ult i32 %717, %723
  br i1 %724, label %725, label %828

725:                                              ; preds = %716
  %726 = load ptr, ptr %7, align 8
  %727 = getelementptr inbounds nuw %struct.VarEntry, ptr %726, i32 0, i32 2
  %728 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %727, i32 0, i32 0
  %729 = load ptr, ptr %728, align 8
  %730 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %729, i32 0, i32 0
  %731 = load ptr, ptr %730, align 8
  %732 = load i32, ptr %16, align 4
  %733 = zext i32 %732 to i64
  %734 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %731, i64 %733
  %735 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %734, i32 0, i32 0
  %736 = load ptr, ptr %735, align 8
  store ptr %736, ptr %17, align 8
  br label %737

737:                                              ; preds = %819, %725
  %738 = load ptr, ptr %17, align 8
  %739 = icmp ne ptr %738, null
  br i1 %739, label %740, label %824

740:                                              ; preds = %737
  %741 = load ptr, ptr %17, align 8
  %742 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %741, i32 0, i32 4
  %743 = load ptr, ptr %742, align 8
  store ptr %743, ptr %18, align 8
  br label %744

744:                                              ; preds = %740
  %745 = load ptr, ptr %17, align 8
  %746 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %745, i32 0, i32 7
  %747 = load i32, ptr %746, align 4
  %748 = load ptr, ptr %7, align 8
  %749 = getelementptr inbounds nuw %struct.VarEntry, ptr %748, i32 0, i32 2
  %750 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %749, i32 0, i32 0
  %751 = load ptr, ptr %750, align 8
  %752 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %751, i32 0, i32 1
  %753 = load i32, ptr %752, align 8
  %754 = mul i32 %753, 2
  %755 = sub i32 %754, 1
  %756 = and i32 %747, %755
  store i32 %756, ptr %15, align 4
  br label %757

757:                                              ; preds = %744
  %758 = load ptr, ptr %19, align 8
  %759 = load i32, ptr %15, align 4
  %760 = zext i32 %759 to i64
  %761 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %758, i64 %760
  store ptr %761, ptr %20, align 8
  %762 = load ptr, ptr %20, align 8
  %763 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %762, i32 0, i32 1
  %764 = load i32, ptr %763, align 8
  %765 = add i32 %764, 1
  store i32 %765, ptr %763, align 8
  %766 = load ptr, ptr %7, align 8
  %767 = getelementptr inbounds nuw %struct.VarEntry, ptr %766, i32 0, i32 2
  %768 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %767, i32 0, i32 0
  %769 = load ptr, ptr %768, align 8
  %770 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %769, i32 0, i32 6
  %771 = load i32, ptr %770, align 8
  %772 = icmp ugt i32 %765, %771
  br i1 %772, label %773, label %801

773:                                              ; preds = %757
  %774 = load ptr, ptr %7, align 8
  %775 = getelementptr inbounds nuw %struct.VarEntry, ptr %774, i32 0, i32 2
  %776 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %775, i32 0, i32 0
  %777 = load ptr, ptr %776, align 8
  %778 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %777, i32 0, i32 7
  %779 = load i32, ptr %778, align 4
  %780 = add i32 %779, 1
  store i32 %780, ptr %778, align 4
  %781 = load ptr, ptr %20, align 8
  %782 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %781, i32 0, i32 1
  %783 = load i32, ptr %782, align 8
  %784 = load ptr, ptr %20, align 8
  %785 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %784, i32 0, i32 2
  %786 = load i32, ptr %785, align 4
  %787 = load ptr, ptr %7, align 8
  %788 = getelementptr inbounds nuw %struct.VarEntry, ptr %787, i32 0, i32 2
  %789 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %788, i32 0, i32 0
  %790 = load ptr, ptr %789, align 8
  %791 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %790, i32 0, i32 6
  %792 = load i32, ptr %791, align 8
  %793 = mul i32 %786, %792
  %794 = icmp ugt i32 %783, %793
  br i1 %794, label %795, label %800

795:                                              ; preds = %773
  %796 = load ptr, ptr %20, align 8
  %797 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %796, i32 0, i32 2
  %798 = load i32, ptr %797, align 4
  %799 = add i32 %798, 1
  store i32 %799, ptr %797, align 4
  br label %800

800:                                              ; preds = %795, %773
  br label %801

801:                                              ; preds = %800, %757
  %802 = load ptr, ptr %17, align 8
  %803 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %802, i32 0, i32 3
  store ptr null, ptr %803, align 8
  %804 = load ptr, ptr %20, align 8
  %805 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %804, i32 0, i32 0
  %806 = load ptr, ptr %805, align 8
  %807 = load ptr, ptr %17, align 8
  %808 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %807, i32 0, i32 4
  store ptr %806, ptr %808, align 8
  %809 = load ptr, ptr %20, align 8
  %810 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %809, i32 0, i32 0
  %811 = load ptr, ptr %810, align 8
  %812 = icmp ne ptr %811, null
  br i1 %812, label %813, label %819

813:                                              ; preds = %801
  %814 = load ptr, ptr %17, align 8
  %815 = load ptr, ptr %20, align 8
  %816 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %815, i32 0, i32 0
  %817 = load ptr, ptr %816, align 8
  %818 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %817, i32 0, i32 3
  store ptr %814, ptr %818, align 8
  br label %819

819:                                              ; preds = %813, %801
  %820 = load ptr, ptr %17, align 8
  %821 = load ptr, ptr %20, align 8
  %822 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %821, i32 0, i32 0
  store ptr %820, ptr %822, align 8
  %823 = load ptr, ptr %18, align 8
  store ptr %823, ptr %17, align 8
  br label %737, !llvm.loop !18

824:                                              ; preds = %737
  br label %825

825:                                              ; preds = %824
  %826 = load i32, ptr %16, align 4
  %827 = add i32 %826, 1
  store i32 %827, ptr %16, align 4
  br label %716, !llvm.loop !19

828:                                              ; preds = %716
  %829 = load ptr, ptr %7, align 8
  %830 = getelementptr inbounds nuw %struct.VarEntry, ptr %829, i32 0, i32 2
  %831 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %830, i32 0, i32 0
  %832 = load ptr, ptr %831, align 8
  %833 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %832, i32 0, i32 0
  %834 = load ptr, ptr %833, align 8
  call void @free(ptr noundef %834)
  %835 = load ptr, ptr %7, align 8
  %836 = getelementptr inbounds nuw %struct.VarEntry, ptr %835, i32 0, i32 2
  %837 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %836, i32 0, i32 0
  %838 = load ptr, ptr %837, align 8
  %839 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %838, i32 0, i32 1
  %840 = load i32, ptr %839, align 8
  %841 = mul i32 %840, 2
  store i32 %841, ptr %839, align 8
  %842 = load ptr, ptr %7, align 8
  %843 = getelementptr inbounds nuw %struct.VarEntry, ptr %842, i32 0, i32 2
  %844 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %843, i32 0, i32 0
  %845 = load ptr, ptr %844, align 8
  %846 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %845, i32 0, i32 2
  %847 = load i32, ptr %846, align 4
  %848 = add i32 %847, 1
  store i32 %848, ptr %846, align 4
  %849 = load ptr, ptr %19, align 8
  %850 = load ptr, ptr %7, align 8
  %851 = getelementptr inbounds nuw %struct.VarEntry, ptr %850, i32 0, i32 2
  %852 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %851, i32 0, i32 0
  %853 = load ptr, ptr %852, align 8
  %854 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %853, i32 0, i32 0
  store ptr %849, ptr %854, align 8
  %855 = load ptr, ptr %7, align 8
  %856 = getelementptr inbounds nuw %struct.VarEntry, ptr %855, i32 0, i32 2
  %857 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %856, i32 0, i32 0
  %858 = load ptr, ptr %857, align 8
  %859 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %858, i32 0, i32 7
  %860 = load i32, ptr %859, align 4
  %861 = load ptr, ptr %7, align 8
  %862 = getelementptr inbounds nuw %struct.VarEntry, ptr %861, i32 0, i32 2
  %863 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %862, i32 0, i32 0
  %864 = load ptr, ptr %863, align 8
  %865 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %864, i32 0, i32 3
  %866 = load i32, ptr %865, align 8
  %867 = lshr i32 %866, 1
  %868 = icmp ugt i32 %860, %867
  br i1 %868, label %869, label %877

869:                                              ; preds = %828
  %870 = load ptr, ptr %7, align 8
  %871 = getelementptr inbounds nuw %struct.VarEntry, ptr %870, i32 0, i32 2
  %872 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %871, i32 0, i32 0
  %873 = load ptr, ptr %872, align 8
  %874 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %873, i32 0, i32 8
  %875 = load i32, ptr %874, align 8
  %876 = add i32 %875, 1
  br label %878

877:                                              ; preds = %828
  br label %878

878:                                              ; preds = %877, %869
  %879 = phi i32 [ %876, %869 ], [ 0, %877 ]
  %880 = load ptr, ptr %7, align 8
  %881 = getelementptr inbounds nuw %struct.VarEntry, ptr %880, i32 0, i32 2
  %882 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %881, i32 0, i32 0
  %883 = load ptr, ptr %882, align 8
  %884 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %883, i32 0, i32 8
  store i32 %879, ptr %884, align 8
  %885 = load ptr, ptr %7, align 8
  %886 = getelementptr inbounds nuw %struct.VarEntry, ptr %885, i32 0, i32 2
  %887 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %886, i32 0, i32 0
  %888 = load ptr, ptr %887, align 8
  %889 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %888, i32 0, i32 8
  %890 = load i32, ptr %889, align 8
  %891 = icmp ugt i32 %890, 1
  br i1 %891, label %892, label %898

892:                                              ; preds = %878
  %893 = load ptr, ptr %7, align 8
  %894 = getelementptr inbounds nuw %struct.VarEntry, ptr %893, i32 0, i32 2
  %895 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %894, i32 0, i32 0
  %896 = load ptr, ptr %895, align 8
  %897 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %896, i32 0, i32 9
  store i32 1, ptr %897, align 4
  br label %898

898:                                              ; preds = %892, %878
  br label %899

899:                                              ; preds = %898
  br label %900

900:                                              ; preds = %899
  br label %901

901:                                              ; preds = %900, %639, %625
  br label %902

902:                                              ; preds = %901
  br label %903

903:                                              ; preds = %902
  br label %904

904:                                              ; preds = %903
  br label %905

905:                                              ; preds = %904
  ret void
}

declare noalias ptr @strdup(ptr noundef)

declare void @exit(i32 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)


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
