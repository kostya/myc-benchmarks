; ModuleID = 'c/src/words.c'
source_filename = "c/src/words.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Benchmark = type { ptr, i32, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }
%struct.WordsData = type { i64, i64, ptr, i64, i32 }
%struct.WordEntry = type { ptr, i32, %struct.UT_hash_handle }
%struct.UT_hash_handle = type { ptr, ptr, ptr, ptr, ptr, ptr, i32, i32 }
%struct.UT_hash_table = type { ptr, i32, i32, i32, ptr, i64, i32, i32, i32, i32, i32 }
%struct.UT_hash_bucket = type { ptr, i32, i32 }

@.str = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"Etc::Words\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"words\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"word_len\00", align 1

define dso_local void @Words_prepare(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  %17 = load ptr, ptr %2, align 8
  %18 = getelementptr inbounds nuw %struct.Benchmark, ptr %17, i32 0, i32 11
  %19 = load ptr, ptr %18, align 8
  store ptr %19, ptr %3, align 8
  %20 = load ptr, ptr %3, align 8
  %21 = getelementptr inbounds nuw %struct.WordsData, ptr %20, i32 0, i32 2
  %22 = load ptr, ptr %21, align 8
  %23 = icmp ne ptr %22, null
  br i1 %23, label %24, label %30

24:                                               ; preds = %1
  %25 = load ptr, ptr %3, align 8
  %26 = getelementptr inbounds nuw %struct.WordsData, ptr %25, i32 0, i32 2
  %27 = load ptr, ptr %26, align 8
  call void @free(ptr noundef %27)
  %28 = load ptr, ptr %3, align 8
  %29 = getelementptr inbounds nuw %struct.WordsData, ptr %28, i32 0, i32 2
  store ptr null, ptr %29, align 8
  br label %30

30:                                               ; preds = %24, %1
  store ptr @.str, ptr %4, align 8
  store i32 26, ptr %5, align 4
  %31 = load ptr, ptr %3, align 8
  %32 = getelementptr inbounds nuw %struct.WordsData, ptr %31, i32 0, i32 0
  %33 = load i64, ptr %32, align 8
  %34 = mul i64 %33, 8
  %35 = call noalias ptr @malloc(i64 noundef %34)
  store ptr %35, ptr %6, align 8
  store i64 0, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %36

36:                                               ; preds = %91, %30
  %37 = load i32, ptr %8, align 4
  %38 = load ptr, ptr %3, align 8
  %39 = getelementptr inbounds nuw %struct.WordsData, ptr %38, i32 0, i32 0
  %40 = load i64, ptr %39, align 8
  %41 = trunc i64 %40 to i32
  %42 = icmp slt i32 %37, %41
  br i1 %42, label %43, label %94

43:                                               ; preds = %36
  %44 = load ptr, ptr %3, align 8
  %45 = getelementptr inbounds nuw %struct.WordsData, ptr %44, i32 0, i32 1
  %46 = load i64, ptr %45, align 8
  %47 = trunc i64 %46 to i32
  %48 = call i32 @Helper_next_int(i32 noundef %47)
  store i32 %48, ptr %9, align 4
  %49 = call i32 @Helper_next_int(i32 noundef 3)
  %50 = add i32 %49, 3
  %51 = load i32, ptr %9, align 4
  %52 = add i32 %51, %50
  store i32 %52, ptr %9, align 4
  %53 = load i32, ptr %9, align 4
  %54 = add nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = call noalias ptr @malloc(i64 noundef %55)
  store ptr %56, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %57

57:                                               ; preds = %73, %43
  %58 = load i32, ptr %11, align 4
  %59 = load i32, ptr %9, align 4
  %60 = icmp slt i32 %58, %59
  br i1 %60, label %61, label %76

61:                                               ; preds = %57
  %62 = load i32, ptr %5, align 4
  %63 = call i32 @Helper_next_int(i32 noundef %62)
  store i32 %63, ptr %12, align 4
  %64 = load ptr, ptr %4, align 8
  %65 = load i32, ptr %12, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, ptr %64, i64 %66
  %68 = load i8, ptr %67, align 1
  %69 = load ptr, ptr %10, align 8
  %70 = load i32, ptr %11, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, ptr %69, i64 %71
  store i8 %68, ptr %72, align 1
  br label %73

73:                                               ; preds = %61
  %74 = load i32, ptr %11, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, ptr %11, align 4
  br label %57, !llvm.loop !6

76:                                               ; preds = %57
  %77 = load ptr, ptr %10, align 8
  %78 = load i32, ptr %9, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, ptr %77, i64 %79
  store i8 0, ptr %80, align 1
  %81 = load ptr, ptr %10, align 8
  %82 = load ptr, ptr %6, align 8
  %83 = load i32, ptr %8, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds ptr, ptr %82, i64 %84
  store ptr %81, ptr %85, align 8
  %86 = load i32, ptr %9, align 4
  %87 = add nsw i32 %86, 1
  %88 = sext i32 %87 to i64
  %89 = load i64, ptr %7, align 8
  %90 = add i64 %89, %88
  store i64 %90, ptr %7, align 8
  br label %91

91:                                               ; preds = %76
  %92 = load i32, ptr %8, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, ptr %8, align 4
  br label %36, !llvm.loop !8

94:                                               ; preds = %36
  %95 = load i64, ptr %7, align 8
  %96 = add i64 %95, 1
  %97 = call noalias ptr @malloc(i64 noundef %96)
  store ptr %97, ptr %13, align 8
  store i64 0, ptr %14, align 8
  store i32 0, ptr %15, align 4
  br label %98

98:                                               ; preds = %142, %94
  %99 = load i32, ptr %15, align 4
  %100 = load ptr, ptr %3, align 8
  %101 = getelementptr inbounds nuw %struct.WordsData, ptr %100, i32 0, i32 0
  %102 = load i64, ptr %101, align 8
  %103 = trunc i64 %102 to i32
  %104 = icmp slt i32 %99, %103
  br i1 %104, label %105, label %145

105:                                              ; preds = %98
  %106 = load ptr, ptr %6, align 8
  %107 = load i32, ptr %15, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds ptr, ptr %106, i64 %108
  %110 = load ptr, ptr %109, align 8
  %111 = call i64 @strlen(ptr noundef %110)
  store i64 %111, ptr %16, align 8
  %112 = load ptr, ptr %13, align 8
  %113 = load i64, ptr %14, align 8
  %114 = getelementptr inbounds nuw i8, ptr %112, i64 %113
  %115 = load ptr, ptr %6, align 8
  %116 = load i32, ptr %15, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds ptr, ptr %115, i64 %117
  %119 = load ptr, ptr %118, align 8
  %120 = load i64, ptr %16, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %114, ptr align 1 %119, i64 %120, i1 false)
  %121 = load i64, ptr %16, align 8
  %122 = load i64, ptr %14, align 8
  %123 = add i64 %122, %121
  store i64 %123, ptr %14, align 8
  %124 = load i32, ptr %15, align 4
  %125 = sext i32 %124 to i64
  %126 = load ptr, ptr %3, align 8
  %127 = getelementptr inbounds nuw %struct.WordsData, ptr %126, i32 0, i32 0
  %128 = load i64, ptr %127, align 8
  %129 = sub nsw i64 %128, 1
  %130 = icmp slt i64 %125, %129
  br i1 %130, label %131, label %136

131:                                              ; preds = %105
  %132 = load ptr, ptr %13, align 8
  %133 = load i64, ptr %14, align 8
  %134 = add i64 %133, 1
  store i64 %134, ptr %14, align 8
  %135 = getelementptr inbounds nuw i8, ptr %132, i64 %133
  store i8 32, ptr %135, align 1
  br label %136

136:                                              ; preds = %131, %105
  %137 = load ptr, ptr %6, align 8
  %138 = load i32, ptr %15, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds ptr, ptr %137, i64 %139
  %141 = load ptr, ptr %140, align 8
  call void @free(ptr noundef %141)
  br label %142

142:                                              ; preds = %136
  %143 = load i32, ptr %15, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, ptr %15, align 4
  br label %98, !llvm.loop !9

145:                                              ; preds = %98
  %146 = load ptr, ptr %13, align 8
  %147 = load i64, ptr %14, align 8
  %148 = getelementptr inbounds nuw i8, ptr %146, i64 %147
  store i8 0, ptr %148, align 1
  %149 = load ptr, ptr %6, align 8
  call void @free(ptr noundef %149)
  %150 = load ptr, ptr %13, align 8
  %151 = load ptr, ptr %3, align 8
  %152 = getelementptr inbounds nuw %struct.WordsData, ptr %151, i32 0, i32 2
  store ptr %150, ptr %152, align 8
  %153 = load i64, ptr %14, align 8
  %154 = load ptr, ptr %3, align 8
  %155 = getelementptr inbounds nuw %struct.WordsData, ptr %154, i32 0, i32 3
  store i64 %153, ptr %155, align 8
  ret void
}

declare void @free(ptr noundef)

declare noalias ptr @malloc(i64 noundef)

declare i32 @Helper_next_int(i32 noundef)

declare i64 @strlen(ptr noundef)

declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg)

define dso_local void @Words_run(ptr noundef %0, i32 noundef %1) {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca i32, align 4
  %25 = alloca ptr, align 8
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca ptr, align 8
  %31 = alloca ptr, align 8
  %32 = alloca [256 x i8], align 16
  %33 = alloca i32, align 4
  %34 = alloca ptr, align 8
  %35 = alloca ptr, align 8
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca ptr, align 8
  %39 = alloca i32, align 4
  %40 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %41 = load i32, ptr %4, align 4
  %42 = load ptr, ptr %3, align 8
  %43 = getelementptr inbounds nuw %struct.Benchmark, ptr %42, i32 0, i32 11
  %44 = load ptr, ptr %43, align 8
  store ptr %44, ptr %5, align 8
  store ptr null, ptr %6, align 8
  %45 = load ptr, ptr %5, align 8
  %46 = getelementptr inbounds nuw %struct.WordsData, ptr %45, i32 0, i32 2
  %47 = load ptr, ptr %46, align 8
  %48 = call noalias ptr @strdup(ptr noundef %47)
  store ptr %48, ptr %7, align 8
  %49 = load ptr, ptr %7, align 8
  %50 = call ptr @strtok_r(ptr noundef %49, ptr noundef @.str.1, ptr noundef %8)
  store ptr %50, ptr %9, align 8
  br label %51

51:                                               ; preds = %1410, %2
  %52 = load ptr, ptr %9, align 8
  %53 = icmp ne ptr %52, null
  br i1 %53, label %54, label %1412

54:                                               ; preds = %51
  %55 = load ptr, ptr %9, align 8
  %56 = call i64 @strlen(ptr noundef %55)
  %57 = icmp uge i64 %56, 3
  br i1 %57, label %58, label %1410

58:                                               ; preds = %54
  br label %59

59:                                               ; preds = %58
  %60 = load ptr, ptr %9, align 8
  %61 = call i64 @strlen(ptr noundef %60)
  %62 = trunc i64 %61 to i32
  store i32 %62, ptr %11, align 4
  br label %63

63:                                               ; preds = %59
  store ptr null, ptr %10, align 8
  %64 = load ptr, ptr %6, align 8
  %65 = icmp ne ptr %64, null
  br i1 %65, label %66, label %538

66:                                               ; preds = %63
  br label %67

67:                                               ; preds = %66
  br label %68

68:                                               ; preds = %67
  %69 = load ptr, ptr %9, align 8
  store ptr %69, ptr %16, align 8
  store i32 -17973521, ptr %12, align 4
  store i32 -1640531527, ptr %14, align 4
  store i32 -1640531527, ptr %13, align 4
  %70 = load i32, ptr %11, align 4
  store i32 %70, ptr %15, align 4
  br label %71

71:                                               ; preds = %238, %68
  %72 = load i32, ptr %15, align 4
  %73 = icmp uge i32 %72, 12
  br i1 %73, label %74, label %243

74:                                               ; preds = %71
  %75 = load ptr, ptr %16, align 8
  %76 = getelementptr inbounds i8, ptr %75, i64 0
  %77 = load i8, ptr %76, align 1
  %78 = zext i8 %77 to i32
  %79 = load ptr, ptr %16, align 8
  %80 = getelementptr inbounds i8, ptr %79, i64 1
  %81 = load i8, ptr %80, align 1
  %82 = zext i8 %81 to i32
  %83 = shl i32 %82, 8
  %84 = add i32 %78, %83
  %85 = load ptr, ptr %16, align 8
  %86 = getelementptr inbounds i8, ptr %85, i64 2
  %87 = load i8, ptr %86, align 1
  %88 = zext i8 %87 to i32
  %89 = shl i32 %88, 16
  %90 = add i32 %84, %89
  %91 = load ptr, ptr %16, align 8
  %92 = getelementptr inbounds i8, ptr %91, i64 3
  %93 = load i8, ptr %92, align 1
  %94 = zext i8 %93 to i32
  %95 = shl i32 %94, 24
  %96 = add i32 %90, %95
  %97 = load i32, ptr %13, align 4
  %98 = add i32 %97, %96
  store i32 %98, ptr %13, align 4
  %99 = load ptr, ptr %16, align 8
  %100 = getelementptr inbounds i8, ptr %99, i64 4
  %101 = load i8, ptr %100, align 1
  %102 = zext i8 %101 to i32
  %103 = load ptr, ptr %16, align 8
  %104 = getelementptr inbounds i8, ptr %103, i64 5
  %105 = load i8, ptr %104, align 1
  %106 = zext i8 %105 to i32
  %107 = shl i32 %106, 8
  %108 = add i32 %102, %107
  %109 = load ptr, ptr %16, align 8
  %110 = getelementptr inbounds i8, ptr %109, i64 6
  %111 = load i8, ptr %110, align 1
  %112 = zext i8 %111 to i32
  %113 = shl i32 %112, 16
  %114 = add i32 %108, %113
  %115 = load ptr, ptr %16, align 8
  %116 = getelementptr inbounds i8, ptr %115, i64 7
  %117 = load i8, ptr %116, align 1
  %118 = zext i8 %117 to i32
  %119 = shl i32 %118, 24
  %120 = add i32 %114, %119
  %121 = load i32, ptr %14, align 4
  %122 = add i32 %121, %120
  store i32 %122, ptr %14, align 4
  %123 = load ptr, ptr %16, align 8
  %124 = getelementptr inbounds i8, ptr %123, i64 8
  %125 = load i8, ptr %124, align 1
  %126 = zext i8 %125 to i32
  %127 = load ptr, ptr %16, align 8
  %128 = getelementptr inbounds i8, ptr %127, i64 9
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = shl i32 %130, 8
  %132 = add i32 %126, %131
  %133 = load ptr, ptr %16, align 8
  %134 = getelementptr inbounds i8, ptr %133, i64 10
  %135 = load i8, ptr %134, align 1
  %136 = zext i8 %135 to i32
  %137 = shl i32 %136, 16
  %138 = add i32 %132, %137
  %139 = load ptr, ptr %16, align 8
  %140 = getelementptr inbounds i8, ptr %139, i64 11
  %141 = load i8, ptr %140, align 1
  %142 = zext i8 %141 to i32
  %143 = shl i32 %142, 24
  %144 = add i32 %138, %143
  %145 = load i32, ptr %12, align 4
  %146 = add i32 %145, %144
  store i32 %146, ptr %12, align 4
  br label %147

147:                                              ; preds = %74
  %148 = load i32, ptr %14, align 4
  %149 = load i32, ptr %13, align 4
  %150 = sub i32 %149, %148
  store i32 %150, ptr %13, align 4
  %151 = load i32, ptr %12, align 4
  %152 = load i32, ptr %13, align 4
  %153 = sub i32 %152, %151
  store i32 %153, ptr %13, align 4
  %154 = load i32, ptr %12, align 4
  %155 = lshr i32 %154, 13
  %156 = load i32, ptr %13, align 4
  %157 = xor i32 %156, %155
  store i32 %157, ptr %13, align 4
  %158 = load i32, ptr %12, align 4
  %159 = load i32, ptr %14, align 4
  %160 = sub i32 %159, %158
  store i32 %160, ptr %14, align 4
  %161 = load i32, ptr %13, align 4
  %162 = load i32, ptr %14, align 4
  %163 = sub i32 %162, %161
  store i32 %163, ptr %14, align 4
  %164 = load i32, ptr %13, align 4
  %165 = shl i32 %164, 8
  %166 = load i32, ptr %14, align 4
  %167 = xor i32 %166, %165
  store i32 %167, ptr %14, align 4
  %168 = load i32, ptr %13, align 4
  %169 = load i32, ptr %12, align 4
  %170 = sub i32 %169, %168
  store i32 %170, ptr %12, align 4
  %171 = load i32, ptr %14, align 4
  %172 = load i32, ptr %12, align 4
  %173 = sub i32 %172, %171
  store i32 %173, ptr %12, align 4
  %174 = load i32, ptr %14, align 4
  %175 = lshr i32 %174, 13
  %176 = load i32, ptr %12, align 4
  %177 = xor i32 %176, %175
  store i32 %177, ptr %12, align 4
  %178 = load i32, ptr %14, align 4
  %179 = load i32, ptr %13, align 4
  %180 = sub i32 %179, %178
  store i32 %180, ptr %13, align 4
  %181 = load i32, ptr %12, align 4
  %182 = load i32, ptr %13, align 4
  %183 = sub i32 %182, %181
  store i32 %183, ptr %13, align 4
  %184 = load i32, ptr %12, align 4
  %185 = lshr i32 %184, 12
  %186 = load i32, ptr %13, align 4
  %187 = xor i32 %186, %185
  store i32 %187, ptr %13, align 4
  %188 = load i32, ptr %12, align 4
  %189 = load i32, ptr %14, align 4
  %190 = sub i32 %189, %188
  store i32 %190, ptr %14, align 4
  %191 = load i32, ptr %13, align 4
  %192 = load i32, ptr %14, align 4
  %193 = sub i32 %192, %191
  store i32 %193, ptr %14, align 4
  %194 = load i32, ptr %13, align 4
  %195 = shl i32 %194, 16
  %196 = load i32, ptr %14, align 4
  %197 = xor i32 %196, %195
  store i32 %197, ptr %14, align 4
  %198 = load i32, ptr %13, align 4
  %199 = load i32, ptr %12, align 4
  %200 = sub i32 %199, %198
  store i32 %200, ptr %12, align 4
  %201 = load i32, ptr %14, align 4
  %202 = load i32, ptr %12, align 4
  %203 = sub i32 %202, %201
  store i32 %203, ptr %12, align 4
  %204 = load i32, ptr %14, align 4
  %205 = lshr i32 %204, 5
  %206 = load i32, ptr %12, align 4
  %207 = xor i32 %206, %205
  store i32 %207, ptr %12, align 4
  %208 = load i32, ptr %14, align 4
  %209 = load i32, ptr %13, align 4
  %210 = sub i32 %209, %208
  store i32 %210, ptr %13, align 4
  %211 = load i32, ptr %12, align 4
  %212 = load i32, ptr %13, align 4
  %213 = sub i32 %212, %211
  store i32 %213, ptr %13, align 4
  %214 = load i32, ptr %12, align 4
  %215 = lshr i32 %214, 3
  %216 = load i32, ptr %13, align 4
  %217 = xor i32 %216, %215
  store i32 %217, ptr %13, align 4
  %218 = load i32, ptr %12, align 4
  %219 = load i32, ptr %14, align 4
  %220 = sub i32 %219, %218
  store i32 %220, ptr %14, align 4
  %221 = load i32, ptr %13, align 4
  %222 = load i32, ptr %14, align 4
  %223 = sub i32 %222, %221
  store i32 %223, ptr %14, align 4
  %224 = load i32, ptr %13, align 4
  %225 = shl i32 %224, 10
  %226 = load i32, ptr %14, align 4
  %227 = xor i32 %226, %225
  store i32 %227, ptr %14, align 4
  %228 = load i32, ptr %13, align 4
  %229 = load i32, ptr %12, align 4
  %230 = sub i32 %229, %228
  store i32 %230, ptr %12, align 4
  %231 = load i32, ptr %14, align 4
  %232 = load i32, ptr %12, align 4
  %233 = sub i32 %232, %231
  store i32 %233, ptr %12, align 4
  %234 = load i32, ptr %14, align 4
  %235 = lshr i32 %234, 15
  %236 = load i32, ptr %12, align 4
  %237 = xor i32 %236, %235
  store i32 %237, ptr %12, align 4
  br label %238

238:                                              ; preds = %147
  %239 = load ptr, ptr %16, align 8
  %240 = getelementptr inbounds i8, ptr %239, i64 12
  store ptr %240, ptr %16, align 8
  %241 = load i32, ptr %15, align 4
  %242 = sub i32 %241, 12
  store i32 %242, ptr %15, align 4
  br label %71, !llvm.loop !10

243:                                              ; preds = %71
  %244 = load i32, ptr %11, align 4
  %245 = load i32, ptr %12, align 4
  %246 = add i32 %245, %244
  store i32 %246, ptr %12, align 4
  %247 = load i32, ptr %15, align 4
  switch i32 %247, label %334 [
    i32 11, label %248
    i32 10, label %256
    i32 9, label %264
    i32 8, label %272
    i32 7, label %280
    i32 6, label %288
    i32 5, label %296
    i32 4, label %303
    i32 3, label %311
    i32 2, label %319
    i32 1, label %327
  ]

248:                                              ; preds = %243
  %249 = load ptr, ptr %16, align 8
  %250 = getelementptr inbounds i8, ptr %249, i64 10
  %251 = load i8, ptr %250, align 1
  %252 = zext i8 %251 to i32
  %253 = shl i32 %252, 24
  %254 = load i32, ptr %12, align 4
  %255 = add i32 %254, %253
  store i32 %255, ptr %12, align 4
  br label %256

256:                                              ; preds = %243, %248
  %257 = load ptr, ptr %16, align 8
  %258 = getelementptr inbounds i8, ptr %257, i64 9
  %259 = load i8, ptr %258, align 1
  %260 = zext i8 %259 to i32
  %261 = shl i32 %260, 16
  %262 = load i32, ptr %12, align 4
  %263 = add i32 %262, %261
  store i32 %263, ptr %12, align 4
  br label %264

264:                                              ; preds = %243, %256
  %265 = load ptr, ptr %16, align 8
  %266 = getelementptr inbounds i8, ptr %265, i64 8
  %267 = load i8, ptr %266, align 1
  %268 = zext i8 %267 to i32
  %269 = shl i32 %268, 8
  %270 = load i32, ptr %12, align 4
  %271 = add i32 %270, %269
  store i32 %271, ptr %12, align 4
  br label %272

272:                                              ; preds = %243, %264
  %273 = load ptr, ptr %16, align 8
  %274 = getelementptr inbounds i8, ptr %273, i64 7
  %275 = load i8, ptr %274, align 1
  %276 = zext i8 %275 to i32
  %277 = shl i32 %276, 24
  %278 = load i32, ptr %14, align 4
  %279 = add i32 %278, %277
  store i32 %279, ptr %14, align 4
  br label %280

280:                                              ; preds = %243, %272
  %281 = load ptr, ptr %16, align 8
  %282 = getelementptr inbounds i8, ptr %281, i64 6
  %283 = load i8, ptr %282, align 1
  %284 = zext i8 %283 to i32
  %285 = shl i32 %284, 16
  %286 = load i32, ptr %14, align 4
  %287 = add i32 %286, %285
  store i32 %287, ptr %14, align 4
  br label %288

288:                                              ; preds = %243, %280
  %289 = load ptr, ptr %16, align 8
  %290 = getelementptr inbounds i8, ptr %289, i64 5
  %291 = load i8, ptr %290, align 1
  %292 = zext i8 %291 to i32
  %293 = shl i32 %292, 8
  %294 = load i32, ptr %14, align 4
  %295 = add i32 %294, %293
  store i32 %295, ptr %14, align 4
  br label %296

296:                                              ; preds = %243, %288
  %297 = load ptr, ptr %16, align 8
  %298 = getelementptr inbounds i8, ptr %297, i64 4
  %299 = load i8, ptr %298, align 1
  %300 = zext i8 %299 to i32
  %301 = load i32, ptr %14, align 4
  %302 = add i32 %301, %300
  store i32 %302, ptr %14, align 4
  br label %303

303:                                              ; preds = %243, %296
  %304 = load ptr, ptr %16, align 8
  %305 = getelementptr inbounds i8, ptr %304, i64 3
  %306 = load i8, ptr %305, align 1
  %307 = zext i8 %306 to i32
  %308 = shl i32 %307, 24
  %309 = load i32, ptr %13, align 4
  %310 = add i32 %309, %308
  store i32 %310, ptr %13, align 4
  br label %311

311:                                              ; preds = %243, %303
  %312 = load ptr, ptr %16, align 8
  %313 = getelementptr inbounds i8, ptr %312, i64 2
  %314 = load i8, ptr %313, align 1
  %315 = zext i8 %314 to i32
  %316 = shl i32 %315, 16
  %317 = load i32, ptr %13, align 4
  %318 = add i32 %317, %316
  store i32 %318, ptr %13, align 4
  br label %319

319:                                              ; preds = %243, %311
  %320 = load ptr, ptr %16, align 8
  %321 = getelementptr inbounds i8, ptr %320, i64 1
  %322 = load i8, ptr %321, align 1
  %323 = zext i8 %322 to i32
  %324 = shl i32 %323, 8
  %325 = load i32, ptr %13, align 4
  %326 = add i32 %325, %324
  store i32 %326, ptr %13, align 4
  br label %327

327:                                              ; preds = %243, %319
  %328 = load ptr, ptr %16, align 8
  %329 = getelementptr inbounds i8, ptr %328, i64 0
  %330 = load i8, ptr %329, align 1
  %331 = zext i8 %330 to i32
  %332 = load i32, ptr %13, align 4
  %333 = add i32 %332, %331
  store i32 %333, ptr %13, align 4
  br label %334

334:                                              ; preds = %243, %327
  br label %335

335:                                              ; preds = %334
  br label %336

336:                                              ; preds = %335
  %337 = load i32, ptr %14, align 4
  %338 = load i32, ptr %13, align 4
  %339 = sub i32 %338, %337
  store i32 %339, ptr %13, align 4
  %340 = load i32, ptr %12, align 4
  %341 = load i32, ptr %13, align 4
  %342 = sub i32 %341, %340
  store i32 %342, ptr %13, align 4
  %343 = load i32, ptr %12, align 4
  %344 = lshr i32 %343, 13
  %345 = load i32, ptr %13, align 4
  %346 = xor i32 %345, %344
  store i32 %346, ptr %13, align 4
  %347 = load i32, ptr %12, align 4
  %348 = load i32, ptr %14, align 4
  %349 = sub i32 %348, %347
  store i32 %349, ptr %14, align 4
  %350 = load i32, ptr %13, align 4
  %351 = load i32, ptr %14, align 4
  %352 = sub i32 %351, %350
  store i32 %352, ptr %14, align 4
  %353 = load i32, ptr %13, align 4
  %354 = shl i32 %353, 8
  %355 = load i32, ptr %14, align 4
  %356 = xor i32 %355, %354
  store i32 %356, ptr %14, align 4
  %357 = load i32, ptr %13, align 4
  %358 = load i32, ptr %12, align 4
  %359 = sub i32 %358, %357
  store i32 %359, ptr %12, align 4
  %360 = load i32, ptr %14, align 4
  %361 = load i32, ptr %12, align 4
  %362 = sub i32 %361, %360
  store i32 %362, ptr %12, align 4
  %363 = load i32, ptr %14, align 4
  %364 = lshr i32 %363, 13
  %365 = load i32, ptr %12, align 4
  %366 = xor i32 %365, %364
  store i32 %366, ptr %12, align 4
  %367 = load i32, ptr %14, align 4
  %368 = load i32, ptr %13, align 4
  %369 = sub i32 %368, %367
  store i32 %369, ptr %13, align 4
  %370 = load i32, ptr %12, align 4
  %371 = load i32, ptr %13, align 4
  %372 = sub i32 %371, %370
  store i32 %372, ptr %13, align 4
  %373 = load i32, ptr %12, align 4
  %374 = lshr i32 %373, 12
  %375 = load i32, ptr %13, align 4
  %376 = xor i32 %375, %374
  store i32 %376, ptr %13, align 4
  %377 = load i32, ptr %12, align 4
  %378 = load i32, ptr %14, align 4
  %379 = sub i32 %378, %377
  store i32 %379, ptr %14, align 4
  %380 = load i32, ptr %13, align 4
  %381 = load i32, ptr %14, align 4
  %382 = sub i32 %381, %380
  store i32 %382, ptr %14, align 4
  %383 = load i32, ptr %13, align 4
  %384 = shl i32 %383, 16
  %385 = load i32, ptr %14, align 4
  %386 = xor i32 %385, %384
  store i32 %386, ptr %14, align 4
  %387 = load i32, ptr %13, align 4
  %388 = load i32, ptr %12, align 4
  %389 = sub i32 %388, %387
  store i32 %389, ptr %12, align 4
  %390 = load i32, ptr %14, align 4
  %391 = load i32, ptr %12, align 4
  %392 = sub i32 %391, %390
  store i32 %392, ptr %12, align 4
  %393 = load i32, ptr %14, align 4
  %394 = lshr i32 %393, 5
  %395 = load i32, ptr %12, align 4
  %396 = xor i32 %395, %394
  store i32 %396, ptr %12, align 4
  %397 = load i32, ptr %14, align 4
  %398 = load i32, ptr %13, align 4
  %399 = sub i32 %398, %397
  store i32 %399, ptr %13, align 4
  %400 = load i32, ptr %12, align 4
  %401 = load i32, ptr %13, align 4
  %402 = sub i32 %401, %400
  store i32 %402, ptr %13, align 4
  %403 = load i32, ptr %12, align 4
  %404 = lshr i32 %403, 3
  %405 = load i32, ptr %13, align 4
  %406 = xor i32 %405, %404
  store i32 %406, ptr %13, align 4
  %407 = load i32, ptr %12, align 4
  %408 = load i32, ptr %14, align 4
  %409 = sub i32 %408, %407
  store i32 %409, ptr %14, align 4
  %410 = load i32, ptr %13, align 4
  %411 = load i32, ptr %14, align 4
  %412 = sub i32 %411, %410
  store i32 %412, ptr %14, align 4
  %413 = load i32, ptr %13, align 4
  %414 = shl i32 %413, 10
  %415 = load i32, ptr %14, align 4
  %416 = xor i32 %415, %414
  store i32 %416, ptr %14, align 4
  %417 = load i32, ptr %13, align 4
  %418 = load i32, ptr %12, align 4
  %419 = sub i32 %418, %417
  store i32 %419, ptr %12, align 4
  %420 = load i32, ptr %14, align 4
  %421 = load i32, ptr %12, align 4
  %422 = sub i32 %421, %420
  store i32 %422, ptr %12, align 4
  %423 = load i32, ptr %14, align 4
  %424 = lshr i32 %423, 15
  %425 = load i32, ptr %12, align 4
  %426 = xor i32 %425, %424
  store i32 %426, ptr %12, align 4
  br label %427

427:                                              ; preds = %336
  br label %428

428:                                              ; preds = %427
  br label %429

429:                                              ; preds = %428
  br label %430

430:                                              ; preds = %429
  store ptr null, ptr %10, align 8
  %431 = load ptr, ptr %6, align 8
  %432 = icmp ne ptr %431, null
  br i1 %432, label %433, label %536

433:                                              ; preds = %430
  br label %434

434:                                              ; preds = %433
  %435 = load i32, ptr %12, align 4
  %436 = load ptr, ptr %6, align 8
  %437 = getelementptr inbounds nuw %struct.WordEntry, ptr %436, i32 0, i32 2
  %438 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %437, i32 0, i32 0
  %439 = load ptr, ptr %438, align 8
  %440 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %439, i32 0, i32 1
  %441 = load i32, ptr %440, align 8
  %442 = sub i32 %441, 1
  %443 = and i32 %435, %442
  store i32 %443, ptr %17, align 4
  br label %444

444:                                              ; preds = %434
  br label %445

445:                                              ; preds = %444
  %446 = load ptr, ptr %6, align 8
  %447 = getelementptr inbounds nuw %struct.WordEntry, ptr %446, i32 0, i32 2
  %448 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %447, i32 0, i32 0
  %449 = load ptr, ptr %448, align 8
  %450 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %449, i32 0, i32 0
  %451 = load ptr, ptr %450, align 8
  %452 = load i32, ptr %17, align 4
  %453 = zext i32 %452 to i64
  %454 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %451, i64 %453
  %455 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %454, i32 0, i32 0
  %456 = load ptr, ptr %455, align 8
  %457 = icmp ne ptr %456, null
  br i1 %457, label %458, label %480

458:                                              ; preds = %445
  br label %459

459:                                              ; preds = %458
  %460 = load ptr, ptr %6, align 8
  %461 = getelementptr inbounds nuw %struct.WordEntry, ptr %460, i32 0, i32 2
  %462 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %461, i32 0, i32 0
  %463 = load ptr, ptr %462, align 8
  %464 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %463, i32 0, i32 0
  %465 = load ptr, ptr %464, align 8
  %466 = load i32, ptr %17, align 4
  %467 = zext i32 %466 to i64
  %468 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %465, i64 %467
  %469 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %468, i32 0, i32 0
  %470 = load ptr, ptr %469, align 8
  %471 = load ptr, ptr %6, align 8
  %472 = getelementptr inbounds nuw %struct.WordEntry, ptr %471, i32 0, i32 2
  %473 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %472, i32 0, i32 0
  %474 = load ptr, ptr %473, align 8
  %475 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %474, i32 0, i32 5
  %476 = load i64, ptr %475, align 8
  %477 = sub i64 0, %476
  %478 = getelementptr inbounds i8, ptr %470, i64 %477
  store ptr %478, ptr %10, align 8
  br label %479

479:                                              ; preds = %459
  br label %481

480:                                              ; preds = %445
  store ptr null, ptr %10, align 8
  br label %481

481:                                              ; preds = %480, %479
  br label %482

482:                                              ; preds = %533, %481
  %483 = load ptr, ptr %10, align 8
  %484 = icmp ne ptr %483, null
  br i1 %484, label %485, label %534

485:                                              ; preds = %482
  %486 = load ptr, ptr %10, align 8
  %487 = getelementptr inbounds nuw %struct.WordEntry, ptr %486, i32 0, i32 2
  %488 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %487, i32 0, i32 7
  %489 = load i32, ptr %488, align 4
  %490 = load i32, ptr %12, align 4
  %491 = icmp eq i32 %489, %490
  br i1 %491, label %492, label %511

492:                                              ; preds = %485
  %493 = load ptr, ptr %10, align 8
  %494 = getelementptr inbounds nuw %struct.WordEntry, ptr %493, i32 0, i32 2
  %495 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %494, i32 0, i32 6
  %496 = load i32, ptr %495, align 8
  %497 = load i32, ptr %11, align 4
  %498 = icmp eq i32 %496, %497
  br i1 %498, label %499, label %511

499:                                              ; preds = %492
  %500 = load ptr, ptr %10, align 8
  %501 = getelementptr inbounds nuw %struct.WordEntry, ptr %500, i32 0, i32 2
  %502 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %501, i32 0, i32 5
  %503 = load ptr, ptr %502, align 8
  %504 = load ptr, ptr %9, align 8
  %505 = load i32, ptr %11, align 4
  %506 = zext i32 %505 to i64
  %507 = call i32 @memcmp(ptr noundef %503, ptr noundef %504, i64 noundef %506)
  %508 = icmp eq i32 %507, 0
  br i1 %508, label %509, label %510

509:                                              ; preds = %499
  br label %534

510:                                              ; preds = %499
  br label %511

511:                                              ; preds = %510, %492, %485
  %512 = load ptr, ptr %10, align 8
  %513 = getelementptr inbounds nuw %struct.WordEntry, ptr %512, i32 0, i32 2
  %514 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %513, i32 0, i32 4
  %515 = load ptr, ptr %514, align 8
  %516 = icmp ne ptr %515, null
  br i1 %516, label %517, label %532

517:                                              ; preds = %511
  br label %518

518:                                              ; preds = %517
  %519 = load ptr, ptr %10, align 8
  %520 = getelementptr inbounds nuw %struct.WordEntry, ptr %519, i32 0, i32 2
  %521 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %520, i32 0, i32 4
  %522 = load ptr, ptr %521, align 8
  %523 = load ptr, ptr %6, align 8
  %524 = getelementptr inbounds nuw %struct.WordEntry, ptr %523, i32 0, i32 2
  %525 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %524, i32 0, i32 0
  %526 = load ptr, ptr %525, align 8
  %527 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %526, i32 0, i32 5
  %528 = load i64, ptr %527, align 8
  %529 = sub i64 0, %528
  %530 = getelementptr inbounds i8, ptr %522, i64 %529
  store ptr %530, ptr %10, align 8
  br label %531

531:                                              ; preds = %518
  br label %533

532:                                              ; preds = %511
  store ptr null, ptr %10, align 8
  br label %533

533:                                              ; preds = %532, %531
  br label %482, !llvm.loop !11

534:                                              ; preds = %509, %482
  br label %535

535:                                              ; preds = %534
  br label %536

536:                                              ; preds = %535, %430
  br label %537

537:                                              ; preds = %536
  br label %538

538:                                              ; preds = %537, %63
  br label %539

539:                                              ; preds = %538
  br label %540

540:                                              ; preds = %539
  %541 = load ptr, ptr %10, align 8
  %542 = icmp ne ptr %541, null
  br i1 %542, label %543, label %548

543:                                              ; preds = %540
  %544 = load ptr, ptr %10, align 8
  %545 = getelementptr inbounds nuw %struct.WordEntry, ptr %544, i32 0, i32 1
  %546 = load i32, ptr %545, align 8
  %547 = add nsw i32 %546, 1
  store i32 %547, ptr %545, align 8
  br label %1409

548:                                              ; preds = %540
  %549 = call noalias ptr @malloc(i64 noundef 72)
  store ptr %549, ptr %10, align 8
  %550 = load ptr, ptr %9, align 8
  %551 = call noalias ptr @strdup(ptr noundef %550)
  %552 = load ptr, ptr %10, align 8
  %553 = getelementptr inbounds nuw %struct.WordEntry, ptr %552, i32 0, i32 0
  store ptr %551, ptr %553, align 8
  %554 = load ptr, ptr %10, align 8
  %555 = getelementptr inbounds nuw %struct.WordEntry, ptr %554, i32 0, i32 1
  store i32 1, ptr %555, align 8
  br label %556

556:                                              ; preds = %548
  %557 = load ptr, ptr %10, align 8
  %558 = getelementptr inbounds nuw %struct.WordEntry, ptr %557, i32 0, i32 0
  %559 = load ptr, ptr %558, align 8
  %560 = call i64 @strlen(ptr noundef %559)
  %561 = trunc i64 %560 to i32
  store i32 %561, ptr %18, align 4
  br label %562

562:                                              ; preds = %556
  br label %563

563:                                              ; preds = %562
  br label %564

564:                                              ; preds = %563
  %565 = load ptr, ptr %10, align 8
  %566 = getelementptr inbounds nuw %struct.WordEntry, ptr %565, i32 0, i32 0
  %567 = load ptr, ptr %566, align 8
  %568 = getelementptr inbounds i8, ptr %567, i64 0
  store ptr %568, ptr %23, align 8
  store i32 -17973521, ptr %19, align 4
  store i32 -1640531527, ptr %21, align 4
  store i32 -1640531527, ptr %20, align 4
  %569 = load i32, ptr %18, align 4
  store i32 %569, ptr %22, align 4
  br label %570

570:                                              ; preds = %737, %564
  %571 = load i32, ptr %22, align 4
  %572 = icmp uge i32 %571, 12
  br i1 %572, label %573, label %742

573:                                              ; preds = %570
  %574 = load ptr, ptr %23, align 8
  %575 = getelementptr inbounds i8, ptr %574, i64 0
  %576 = load i8, ptr %575, align 1
  %577 = zext i8 %576 to i32
  %578 = load ptr, ptr %23, align 8
  %579 = getelementptr inbounds i8, ptr %578, i64 1
  %580 = load i8, ptr %579, align 1
  %581 = zext i8 %580 to i32
  %582 = shl i32 %581, 8
  %583 = add i32 %577, %582
  %584 = load ptr, ptr %23, align 8
  %585 = getelementptr inbounds i8, ptr %584, i64 2
  %586 = load i8, ptr %585, align 1
  %587 = zext i8 %586 to i32
  %588 = shl i32 %587, 16
  %589 = add i32 %583, %588
  %590 = load ptr, ptr %23, align 8
  %591 = getelementptr inbounds i8, ptr %590, i64 3
  %592 = load i8, ptr %591, align 1
  %593 = zext i8 %592 to i32
  %594 = shl i32 %593, 24
  %595 = add i32 %589, %594
  %596 = load i32, ptr %20, align 4
  %597 = add i32 %596, %595
  store i32 %597, ptr %20, align 4
  %598 = load ptr, ptr %23, align 8
  %599 = getelementptr inbounds i8, ptr %598, i64 4
  %600 = load i8, ptr %599, align 1
  %601 = zext i8 %600 to i32
  %602 = load ptr, ptr %23, align 8
  %603 = getelementptr inbounds i8, ptr %602, i64 5
  %604 = load i8, ptr %603, align 1
  %605 = zext i8 %604 to i32
  %606 = shl i32 %605, 8
  %607 = add i32 %601, %606
  %608 = load ptr, ptr %23, align 8
  %609 = getelementptr inbounds i8, ptr %608, i64 6
  %610 = load i8, ptr %609, align 1
  %611 = zext i8 %610 to i32
  %612 = shl i32 %611, 16
  %613 = add i32 %607, %612
  %614 = load ptr, ptr %23, align 8
  %615 = getelementptr inbounds i8, ptr %614, i64 7
  %616 = load i8, ptr %615, align 1
  %617 = zext i8 %616 to i32
  %618 = shl i32 %617, 24
  %619 = add i32 %613, %618
  %620 = load i32, ptr %21, align 4
  %621 = add i32 %620, %619
  store i32 %621, ptr %21, align 4
  %622 = load ptr, ptr %23, align 8
  %623 = getelementptr inbounds i8, ptr %622, i64 8
  %624 = load i8, ptr %623, align 1
  %625 = zext i8 %624 to i32
  %626 = load ptr, ptr %23, align 8
  %627 = getelementptr inbounds i8, ptr %626, i64 9
  %628 = load i8, ptr %627, align 1
  %629 = zext i8 %628 to i32
  %630 = shl i32 %629, 8
  %631 = add i32 %625, %630
  %632 = load ptr, ptr %23, align 8
  %633 = getelementptr inbounds i8, ptr %632, i64 10
  %634 = load i8, ptr %633, align 1
  %635 = zext i8 %634 to i32
  %636 = shl i32 %635, 16
  %637 = add i32 %631, %636
  %638 = load ptr, ptr %23, align 8
  %639 = getelementptr inbounds i8, ptr %638, i64 11
  %640 = load i8, ptr %639, align 1
  %641 = zext i8 %640 to i32
  %642 = shl i32 %641, 24
  %643 = add i32 %637, %642
  %644 = load i32, ptr %19, align 4
  %645 = add i32 %644, %643
  store i32 %645, ptr %19, align 4
  br label %646

646:                                              ; preds = %573
  %647 = load i32, ptr %21, align 4
  %648 = load i32, ptr %20, align 4
  %649 = sub i32 %648, %647
  store i32 %649, ptr %20, align 4
  %650 = load i32, ptr %19, align 4
  %651 = load i32, ptr %20, align 4
  %652 = sub i32 %651, %650
  store i32 %652, ptr %20, align 4
  %653 = load i32, ptr %19, align 4
  %654 = lshr i32 %653, 13
  %655 = load i32, ptr %20, align 4
  %656 = xor i32 %655, %654
  store i32 %656, ptr %20, align 4
  %657 = load i32, ptr %19, align 4
  %658 = load i32, ptr %21, align 4
  %659 = sub i32 %658, %657
  store i32 %659, ptr %21, align 4
  %660 = load i32, ptr %20, align 4
  %661 = load i32, ptr %21, align 4
  %662 = sub i32 %661, %660
  store i32 %662, ptr %21, align 4
  %663 = load i32, ptr %20, align 4
  %664 = shl i32 %663, 8
  %665 = load i32, ptr %21, align 4
  %666 = xor i32 %665, %664
  store i32 %666, ptr %21, align 4
  %667 = load i32, ptr %20, align 4
  %668 = load i32, ptr %19, align 4
  %669 = sub i32 %668, %667
  store i32 %669, ptr %19, align 4
  %670 = load i32, ptr %21, align 4
  %671 = load i32, ptr %19, align 4
  %672 = sub i32 %671, %670
  store i32 %672, ptr %19, align 4
  %673 = load i32, ptr %21, align 4
  %674 = lshr i32 %673, 13
  %675 = load i32, ptr %19, align 4
  %676 = xor i32 %675, %674
  store i32 %676, ptr %19, align 4
  %677 = load i32, ptr %21, align 4
  %678 = load i32, ptr %20, align 4
  %679 = sub i32 %678, %677
  store i32 %679, ptr %20, align 4
  %680 = load i32, ptr %19, align 4
  %681 = load i32, ptr %20, align 4
  %682 = sub i32 %681, %680
  store i32 %682, ptr %20, align 4
  %683 = load i32, ptr %19, align 4
  %684 = lshr i32 %683, 12
  %685 = load i32, ptr %20, align 4
  %686 = xor i32 %685, %684
  store i32 %686, ptr %20, align 4
  %687 = load i32, ptr %19, align 4
  %688 = load i32, ptr %21, align 4
  %689 = sub i32 %688, %687
  store i32 %689, ptr %21, align 4
  %690 = load i32, ptr %20, align 4
  %691 = load i32, ptr %21, align 4
  %692 = sub i32 %691, %690
  store i32 %692, ptr %21, align 4
  %693 = load i32, ptr %20, align 4
  %694 = shl i32 %693, 16
  %695 = load i32, ptr %21, align 4
  %696 = xor i32 %695, %694
  store i32 %696, ptr %21, align 4
  %697 = load i32, ptr %20, align 4
  %698 = load i32, ptr %19, align 4
  %699 = sub i32 %698, %697
  store i32 %699, ptr %19, align 4
  %700 = load i32, ptr %21, align 4
  %701 = load i32, ptr %19, align 4
  %702 = sub i32 %701, %700
  store i32 %702, ptr %19, align 4
  %703 = load i32, ptr %21, align 4
  %704 = lshr i32 %703, 5
  %705 = load i32, ptr %19, align 4
  %706 = xor i32 %705, %704
  store i32 %706, ptr %19, align 4
  %707 = load i32, ptr %21, align 4
  %708 = load i32, ptr %20, align 4
  %709 = sub i32 %708, %707
  store i32 %709, ptr %20, align 4
  %710 = load i32, ptr %19, align 4
  %711 = load i32, ptr %20, align 4
  %712 = sub i32 %711, %710
  store i32 %712, ptr %20, align 4
  %713 = load i32, ptr %19, align 4
  %714 = lshr i32 %713, 3
  %715 = load i32, ptr %20, align 4
  %716 = xor i32 %715, %714
  store i32 %716, ptr %20, align 4
  %717 = load i32, ptr %19, align 4
  %718 = load i32, ptr %21, align 4
  %719 = sub i32 %718, %717
  store i32 %719, ptr %21, align 4
  %720 = load i32, ptr %20, align 4
  %721 = load i32, ptr %21, align 4
  %722 = sub i32 %721, %720
  store i32 %722, ptr %21, align 4
  %723 = load i32, ptr %20, align 4
  %724 = shl i32 %723, 10
  %725 = load i32, ptr %21, align 4
  %726 = xor i32 %725, %724
  store i32 %726, ptr %21, align 4
  %727 = load i32, ptr %20, align 4
  %728 = load i32, ptr %19, align 4
  %729 = sub i32 %728, %727
  store i32 %729, ptr %19, align 4
  %730 = load i32, ptr %21, align 4
  %731 = load i32, ptr %19, align 4
  %732 = sub i32 %731, %730
  store i32 %732, ptr %19, align 4
  %733 = load i32, ptr %21, align 4
  %734 = lshr i32 %733, 15
  %735 = load i32, ptr %19, align 4
  %736 = xor i32 %735, %734
  store i32 %736, ptr %19, align 4
  br label %737

737:                                              ; preds = %646
  %738 = load ptr, ptr %23, align 8
  %739 = getelementptr inbounds i8, ptr %738, i64 12
  store ptr %739, ptr %23, align 8
  %740 = load i32, ptr %22, align 4
  %741 = sub i32 %740, 12
  store i32 %741, ptr %22, align 4
  br label %570, !llvm.loop !12

742:                                              ; preds = %570
  %743 = load i32, ptr %18, align 4
  %744 = load i32, ptr %19, align 4
  %745 = add i32 %744, %743
  store i32 %745, ptr %19, align 4
  %746 = load i32, ptr %22, align 4
  switch i32 %746, label %833 [
    i32 11, label %747
    i32 10, label %755
    i32 9, label %763
    i32 8, label %771
    i32 7, label %779
    i32 6, label %787
    i32 5, label %795
    i32 4, label %802
    i32 3, label %810
    i32 2, label %818
    i32 1, label %826
  ]

747:                                              ; preds = %742
  %748 = load ptr, ptr %23, align 8
  %749 = getelementptr inbounds i8, ptr %748, i64 10
  %750 = load i8, ptr %749, align 1
  %751 = zext i8 %750 to i32
  %752 = shl i32 %751, 24
  %753 = load i32, ptr %19, align 4
  %754 = add i32 %753, %752
  store i32 %754, ptr %19, align 4
  br label %755

755:                                              ; preds = %742, %747
  %756 = load ptr, ptr %23, align 8
  %757 = getelementptr inbounds i8, ptr %756, i64 9
  %758 = load i8, ptr %757, align 1
  %759 = zext i8 %758 to i32
  %760 = shl i32 %759, 16
  %761 = load i32, ptr %19, align 4
  %762 = add i32 %761, %760
  store i32 %762, ptr %19, align 4
  br label %763

763:                                              ; preds = %742, %755
  %764 = load ptr, ptr %23, align 8
  %765 = getelementptr inbounds i8, ptr %764, i64 8
  %766 = load i8, ptr %765, align 1
  %767 = zext i8 %766 to i32
  %768 = shl i32 %767, 8
  %769 = load i32, ptr %19, align 4
  %770 = add i32 %769, %768
  store i32 %770, ptr %19, align 4
  br label %771

771:                                              ; preds = %742, %763
  %772 = load ptr, ptr %23, align 8
  %773 = getelementptr inbounds i8, ptr %772, i64 7
  %774 = load i8, ptr %773, align 1
  %775 = zext i8 %774 to i32
  %776 = shl i32 %775, 24
  %777 = load i32, ptr %21, align 4
  %778 = add i32 %777, %776
  store i32 %778, ptr %21, align 4
  br label %779

779:                                              ; preds = %742, %771
  %780 = load ptr, ptr %23, align 8
  %781 = getelementptr inbounds i8, ptr %780, i64 6
  %782 = load i8, ptr %781, align 1
  %783 = zext i8 %782 to i32
  %784 = shl i32 %783, 16
  %785 = load i32, ptr %21, align 4
  %786 = add i32 %785, %784
  store i32 %786, ptr %21, align 4
  br label %787

787:                                              ; preds = %742, %779
  %788 = load ptr, ptr %23, align 8
  %789 = getelementptr inbounds i8, ptr %788, i64 5
  %790 = load i8, ptr %789, align 1
  %791 = zext i8 %790 to i32
  %792 = shl i32 %791, 8
  %793 = load i32, ptr %21, align 4
  %794 = add i32 %793, %792
  store i32 %794, ptr %21, align 4
  br label %795

795:                                              ; preds = %742, %787
  %796 = load ptr, ptr %23, align 8
  %797 = getelementptr inbounds i8, ptr %796, i64 4
  %798 = load i8, ptr %797, align 1
  %799 = zext i8 %798 to i32
  %800 = load i32, ptr %21, align 4
  %801 = add i32 %800, %799
  store i32 %801, ptr %21, align 4
  br label %802

802:                                              ; preds = %742, %795
  %803 = load ptr, ptr %23, align 8
  %804 = getelementptr inbounds i8, ptr %803, i64 3
  %805 = load i8, ptr %804, align 1
  %806 = zext i8 %805 to i32
  %807 = shl i32 %806, 24
  %808 = load i32, ptr %20, align 4
  %809 = add i32 %808, %807
  store i32 %809, ptr %20, align 4
  br label %810

810:                                              ; preds = %742, %802
  %811 = load ptr, ptr %23, align 8
  %812 = getelementptr inbounds i8, ptr %811, i64 2
  %813 = load i8, ptr %812, align 1
  %814 = zext i8 %813 to i32
  %815 = shl i32 %814, 16
  %816 = load i32, ptr %20, align 4
  %817 = add i32 %816, %815
  store i32 %817, ptr %20, align 4
  br label %818

818:                                              ; preds = %742, %810
  %819 = load ptr, ptr %23, align 8
  %820 = getelementptr inbounds i8, ptr %819, i64 1
  %821 = load i8, ptr %820, align 1
  %822 = zext i8 %821 to i32
  %823 = shl i32 %822, 8
  %824 = load i32, ptr %20, align 4
  %825 = add i32 %824, %823
  store i32 %825, ptr %20, align 4
  br label %826

826:                                              ; preds = %742, %818
  %827 = load ptr, ptr %23, align 8
  %828 = getelementptr inbounds i8, ptr %827, i64 0
  %829 = load i8, ptr %828, align 1
  %830 = zext i8 %829 to i32
  %831 = load i32, ptr %20, align 4
  %832 = add i32 %831, %830
  store i32 %832, ptr %20, align 4
  br label %833

833:                                              ; preds = %742, %826
  br label %834

834:                                              ; preds = %833
  br label %835

835:                                              ; preds = %834
  %836 = load i32, ptr %21, align 4
  %837 = load i32, ptr %20, align 4
  %838 = sub i32 %837, %836
  store i32 %838, ptr %20, align 4
  %839 = load i32, ptr %19, align 4
  %840 = load i32, ptr %20, align 4
  %841 = sub i32 %840, %839
  store i32 %841, ptr %20, align 4
  %842 = load i32, ptr %19, align 4
  %843 = lshr i32 %842, 13
  %844 = load i32, ptr %20, align 4
  %845 = xor i32 %844, %843
  store i32 %845, ptr %20, align 4
  %846 = load i32, ptr %19, align 4
  %847 = load i32, ptr %21, align 4
  %848 = sub i32 %847, %846
  store i32 %848, ptr %21, align 4
  %849 = load i32, ptr %20, align 4
  %850 = load i32, ptr %21, align 4
  %851 = sub i32 %850, %849
  store i32 %851, ptr %21, align 4
  %852 = load i32, ptr %20, align 4
  %853 = shl i32 %852, 8
  %854 = load i32, ptr %21, align 4
  %855 = xor i32 %854, %853
  store i32 %855, ptr %21, align 4
  %856 = load i32, ptr %20, align 4
  %857 = load i32, ptr %19, align 4
  %858 = sub i32 %857, %856
  store i32 %858, ptr %19, align 4
  %859 = load i32, ptr %21, align 4
  %860 = load i32, ptr %19, align 4
  %861 = sub i32 %860, %859
  store i32 %861, ptr %19, align 4
  %862 = load i32, ptr %21, align 4
  %863 = lshr i32 %862, 13
  %864 = load i32, ptr %19, align 4
  %865 = xor i32 %864, %863
  store i32 %865, ptr %19, align 4
  %866 = load i32, ptr %21, align 4
  %867 = load i32, ptr %20, align 4
  %868 = sub i32 %867, %866
  store i32 %868, ptr %20, align 4
  %869 = load i32, ptr %19, align 4
  %870 = load i32, ptr %20, align 4
  %871 = sub i32 %870, %869
  store i32 %871, ptr %20, align 4
  %872 = load i32, ptr %19, align 4
  %873 = lshr i32 %872, 12
  %874 = load i32, ptr %20, align 4
  %875 = xor i32 %874, %873
  store i32 %875, ptr %20, align 4
  %876 = load i32, ptr %19, align 4
  %877 = load i32, ptr %21, align 4
  %878 = sub i32 %877, %876
  store i32 %878, ptr %21, align 4
  %879 = load i32, ptr %20, align 4
  %880 = load i32, ptr %21, align 4
  %881 = sub i32 %880, %879
  store i32 %881, ptr %21, align 4
  %882 = load i32, ptr %20, align 4
  %883 = shl i32 %882, 16
  %884 = load i32, ptr %21, align 4
  %885 = xor i32 %884, %883
  store i32 %885, ptr %21, align 4
  %886 = load i32, ptr %20, align 4
  %887 = load i32, ptr %19, align 4
  %888 = sub i32 %887, %886
  store i32 %888, ptr %19, align 4
  %889 = load i32, ptr %21, align 4
  %890 = load i32, ptr %19, align 4
  %891 = sub i32 %890, %889
  store i32 %891, ptr %19, align 4
  %892 = load i32, ptr %21, align 4
  %893 = lshr i32 %892, 5
  %894 = load i32, ptr %19, align 4
  %895 = xor i32 %894, %893
  store i32 %895, ptr %19, align 4
  %896 = load i32, ptr %21, align 4
  %897 = load i32, ptr %20, align 4
  %898 = sub i32 %897, %896
  store i32 %898, ptr %20, align 4
  %899 = load i32, ptr %19, align 4
  %900 = load i32, ptr %20, align 4
  %901 = sub i32 %900, %899
  store i32 %901, ptr %20, align 4
  %902 = load i32, ptr %19, align 4
  %903 = lshr i32 %902, 3
  %904 = load i32, ptr %20, align 4
  %905 = xor i32 %904, %903
  store i32 %905, ptr %20, align 4
  %906 = load i32, ptr %19, align 4
  %907 = load i32, ptr %21, align 4
  %908 = sub i32 %907, %906
  store i32 %908, ptr %21, align 4
  %909 = load i32, ptr %20, align 4
  %910 = load i32, ptr %21, align 4
  %911 = sub i32 %910, %909
  store i32 %911, ptr %21, align 4
  %912 = load i32, ptr %20, align 4
  %913 = shl i32 %912, 10
  %914 = load i32, ptr %21, align 4
  %915 = xor i32 %914, %913
  store i32 %915, ptr %21, align 4
  %916 = load i32, ptr %20, align 4
  %917 = load i32, ptr %19, align 4
  %918 = sub i32 %917, %916
  store i32 %918, ptr %19, align 4
  %919 = load i32, ptr %21, align 4
  %920 = load i32, ptr %19, align 4
  %921 = sub i32 %920, %919
  store i32 %921, ptr %19, align 4
  %922 = load i32, ptr %21, align 4
  %923 = lshr i32 %922, 15
  %924 = load i32, ptr %19, align 4
  %925 = xor i32 %924, %923
  store i32 %925, ptr %19, align 4
  br label %926

926:                                              ; preds = %835
  br label %927

927:                                              ; preds = %926
  br label %928

928:                                              ; preds = %927
  br label %929

929:                                              ; preds = %928
  %930 = load i32, ptr %19, align 4
  %931 = load ptr, ptr %10, align 8
  %932 = getelementptr inbounds nuw %struct.WordEntry, ptr %931, i32 0, i32 2
  %933 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %932, i32 0, i32 7
  store i32 %930, ptr %933, align 4
  %934 = load ptr, ptr %10, align 8
  %935 = getelementptr inbounds nuw %struct.WordEntry, ptr %934, i32 0, i32 0
  %936 = load ptr, ptr %935, align 8
  %937 = getelementptr inbounds i8, ptr %936, i64 0
  %938 = load ptr, ptr %10, align 8
  %939 = getelementptr inbounds nuw %struct.WordEntry, ptr %938, i32 0, i32 2
  %940 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %939, i32 0, i32 5
  store ptr %937, ptr %940, align 8
  %941 = load i32, ptr %18, align 4
  %942 = load ptr, ptr %10, align 8
  %943 = getelementptr inbounds nuw %struct.WordEntry, ptr %942, i32 0, i32 2
  %944 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %943, i32 0, i32 6
  store i32 %941, ptr %944, align 8
  %945 = load ptr, ptr %6, align 8
  %946 = icmp ne ptr %945, null
  br i1 %946, label %1028, label %947

947:                                              ; preds = %929
  %948 = load ptr, ptr %10, align 8
  %949 = getelementptr inbounds nuw %struct.WordEntry, ptr %948, i32 0, i32 2
  %950 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %949, i32 0, i32 2
  store ptr null, ptr %950, align 8
  %951 = load ptr, ptr %10, align 8
  %952 = getelementptr inbounds nuw %struct.WordEntry, ptr %951, i32 0, i32 2
  %953 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %952, i32 0, i32 1
  store ptr null, ptr %953, align 8
  br label %954

954:                                              ; preds = %947
  %955 = call noalias ptr @malloc(i64 noundef 64)
  %956 = load ptr, ptr %10, align 8
  %957 = getelementptr inbounds nuw %struct.WordEntry, ptr %956, i32 0, i32 2
  %958 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %957, i32 0, i32 0
  store ptr %955, ptr %958, align 8
  %959 = load ptr, ptr %10, align 8
  %960 = getelementptr inbounds nuw %struct.WordEntry, ptr %959, i32 0, i32 2
  %961 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %960, i32 0, i32 0
  %962 = load ptr, ptr %961, align 8
  %963 = icmp ne ptr %962, null
  br i1 %963, label %965, label %964

964:                                              ; preds = %954
  call void @exit(i32 noundef -1)
  unreachable

965:                                              ; preds = %954
  %966 = load ptr, ptr %10, align 8
  %967 = getelementptr inbounds nuw %struct.WordEntry, ptr %966, i32 0, i32 2
  %968 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %967, i32 0, i32 0
  %969 = load ptr, ptr %968, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %969, i8 0, i64 64, i1 false)
  %970 = load ptr, ptr %10, align 8
  %971 = getelementptr inbounds nuw %struct.WordEntry, ptr %970, i32 0, i32 2
  %972 = load ptr, ptr %10, align 8
  %973 = getelementptr inbounds nuw %struct.WordEntry, ptr %972, i32 0, i32 2
  %974 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %973, i32 0, i32 0
  %975 = load ptr, ptr %974, align 8
  %976 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %975, i32 0, i32 4
  store ptr %971, ptr %976, align 8
  %977 = load ptr, ptr %10, align 8
  %978 = getelementptr inbounds nuw %struct.WordEntry, ptr %977, i32 0, i32 2
  %979 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %978, i32 0, i32 0
  %980 = load ptr, ptr %979, align 8
  %981 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %980, i32 0, i32 1
  store i32 32, ptr %981, align 8
  %982 = load ptr, ptr %10, align 8
  %983 = getelementptr inbounds nuw %struct.WordEntry, ptr %982, i32 0, i32 2
  %984 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %983, i32 0, i32 0
  %985 = load ptr, ptr %984, align 8
  %986 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %985, i32 0, i32 2
  store i32 5, ptr %986, align 4
  %987 = load ptr, ptr %10, align 8
  %988 = getelementptr inbounds nuw %struct.WordEntry, ptr %987, i32 0, i32 2
  %989 = load ptr, ptr %10, align 8
  %990 = ptrtoint ptr %988 to i64
  %991 = ptrtoint ptr %989 to i64
  %992 = sub i64 %990, %991
  %993 = load ptr, ptr %10, align 8
  %994 = getelementptr inbounds nuw %struct.WordEntry, ptr %993, i32 0, i32 2
  %995 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %994, i32 0, i32 0
  %996 = load ptr, ptr %995, align 8
  %997 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %996, i32 0, i32 5
  store i64 %992, ptr %997, align 8
  %998 = call noalias ptr @malloc(i64 noundef 512)
  %999 = load ptr, ptr %10, align 8
  %1000 = getelementptr inbounds nuw %struct.WordEntry, ptr %999, i32 0, i32 2
  %1001 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1000, i32 0, i32 0
  %1002 = load ptr, ptr %1001, align 8
  %1003 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1002, i32 0, i32 0
  store ptr %998, ptr %1003, align 8
  %1004 = load ptr, ptr %10, align 8
  %1005 = getelementptr inbounds nuw %struct.WordEntry, ptr %1004, i32 0, i32 2
  %1006 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1005, i32 0, i32 0
  %1007 = load ptr, ptr %1006, align 8
  %1008 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1007, i32 0, i32 10
  store i32 -1609490463, ptr %1008, align 8
  %1009 = load ptr, ptr %10, align 8
  %1010 = getelementptr inbounds nuw %struct.WordEntry, ptr %1009, i32 0, i32 2
  %1011 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1010, i32 0, i32 0
  %1012 = load ptr, ptr %1011, align 8
  %1013 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1012, i32 0, i32 0
  %1014 = load ptr, ptr %1013, align 8
  %1015 = icmp ne ptr %1014, null
  br i1 %1015, label %1017, label %1016

1016:                                             ; preds = %965
  call void @exit(i32 noundef -1)
  unreachable

1017:                                             ; preds = %965
  %1018 = load ptr, ptr %10, align 8
  %1019 = getelementptr inbounds nuw %struct.WordEntry, ptr %1018, i32 0, i32 2
  %1020 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1019, i32 0, i32 0
  %1021 = load ptr, ptr %1020, align 8
  %1022 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1021, i32 0, i32 0
  %1023 = load ptr, ptr %1022, align 8
  call void @llvm.memset.p0.i64(ptr align 8 %1023, i8 0, i64 512, i1 false)
  br label %1024

1024:                                             ; preds = %1017
  br label %1025

1025:                                             ; preds = %1024
  br label %1026

1026:                                             ; preds = %1025
  %1027 = load ptr, ptr %10, align 8
  store ptr %1027, ptr %6, align 8
  br label %1073

1028:                                             ; preds = %929
  %1029 = load ptr, ptr %6, align 8
  %1030 = getelementptr inbounds nuw %struct.WordEntry, ptr %1029, i32 0, i32 2
  %1031 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1030, i32 0, i32 0
  %1032 = load ptr, ptr %1031, align 8
  %1033 = load ptr, ptr %10, align 8
  %1034 = getelementptr inbounds nuw %struct.WordEntry, ptr %1033, i32 0, i32 2
  %1035 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1034, i32 0, i32 0
  store ptr %1032, ptr %1035, align 8
  br label %1036

1036:                                             ; preds = %1028
  %1037 = load ptr, ptr %10, align 8
  %1038 = getelementptr inbounds nuw %struct.WordEntry, ptr %1037, i32 0, i32 2
  %1039 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1038, i32 0, i32 2
  store ptr null, ptr %1039, align 8
  %1040 = load ptr, ptr %6, align 8
  %1041 = getelementptr inbounds nuw %struct.WordEntry, ptr %1040, i32 0, i32 2
  %1042 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1041, i32 0, i32 0
  %1043 = load ptr, ptr %1042, align 8
  %1044 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1043, i32 0, i32 4
  %1045 = load ptr, ptr %1044, align 8
  %1046 = load ptr, ptr %6, align 8
  %1047 = getelementptr inbounds nuw %struct.WordEntry, ptr %1046, i32 0, i32 2
  %1048 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1047, i32 0, i32 0
  %1049 = load ptr, ptr %1048, align 8
  %1050 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1049, i32 0, i32 5
  %1051 = load i64, ptr %1050, align 8
  %1052 = sub i64 0, %1051
  %1053 = getelementptr inbounds i8, ptr %1045, i64 %1052
  %1054 = load ptr, ptr %10, align 8
  %1055 = getelementptr inbounds nuw %struct.WordEntry, ptr %1054, i32 0, i32 2
  %1056 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1055, i32 0, i32 1
  store ptr %1053, ptr %1056, align 8
  %1057 = load ptr, ptr %10, align 8
  %1058 = load ptr, ptr %6, align 8
  %1059 = getelementptr inbounds nuw %struct.WordEntry, ptr %1058, i32 0, i32 2
  %1060 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1059, i32 0, i32 0
  %1061 = load ptr, ptr %1060, align 8
  %1062 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1061, i32 0, i32 4
  %1063 = load ptr, ptr %1062, align 8
  %1064 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1063, i32 0, i32 2
  store ptr %1057, ptr %1064, align 8
  %1065 = load ptr, ptr %10, align 8
  %1066 = getelementptr inbounds nuw %struct.WordEntry, ptr %1065, i32 0, i32 2
  %1067 = load ptr, ptr %6, align 8
  %1068 = getelementptr inbounds nuw %struct.WordEntry, ptr %1067, i32 0, i32 2
  %1069 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1068, i32 0, i32 0
  %1070 = load ptr, ptr %1069, align 8
  %1071 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1070, i32 0, i32 4
  store ptr %1066, ptr %1071, align 8
  br label %1072

1072:                                             ; preds = %1036
  br label %1073

1073:                                             ; preds = %1072, %1026
  br label %1074

1074:                                             ; preds = %1073
  %1075 = load ptr, ptr %6, align 8
  %1076 = getelementptr inbounds nuw %struct.WordEntry, ptr %1075, i32 0, i32 2
  %1077 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1076, i32 0, i32 0
  %1078 = load ptr, ptr %1077, align 8
  %1079 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1078, i32 0, i32 3
  %1080 = load i32, ptr %1079, align 8
  %1081 = add i32 %1080, 1
  store i32 %1081, ptr %1079, align 8
  br label %1082

1082:                                             ; preds = %1074
  %1083 = load i32, ptr %19, align 4
  %1084 = load ptr, ptr %6, align 8
  %1085 = getelementptr inbounds nuw %struct.WordEntry, ptr %1084, i32 0, i32 2
  %1086 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1085, i32 0, i32 0
  %1087 = load ptr, ptr %1086, align 8
  %1088 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1087, i32 0, i32 1
  %1089 = load i32, ptr %1088, align 8
  %1090 = sub i32 %1089, 1
  %1091 = and i32 %1083, %1090
  store i32 %1091, ptr %24, align 4
  br label %1092

1092:                                             ; preds = %1082
  br label %1093

1093:                                             ; preds = %1092
  %1094 = load ptr, ptr %6, align 8
  %1095 = getelementptr inbounds nuw %struct.WordEntry, ptr %1094, i32 0, i32 2
  %1096 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1095, i32 0, i32 0
  %1097 = load ptr, ptr %1096, align 8
  %1098 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1097, i32 0, i32 0
  %1099 = load ptr, ptr %1098, align 8
  %1100 = load i32, ptr %24, align 4
  %1101 = zext i32 %1100 to i64
  %1102 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1099, i64 %1101
  store ptr %1102, ptr %25, align 8
  %1103 = load ptr, ptr %25, align 8
  %1104 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1103, i32 0, i32 1
  %1105 = load i32, ptr %1104, align 8
  %1106 = add i32 %1105, 1
  store i32 %1106, ptr %1104, align 8
  %1107 = load ptr, ptr %25, align 8
  %1108 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1107, i32 0, i32 0
  %1109 = load ptr, ptr %1108, align 8
  %1110 = load ptr, ptr %10, align 8
  %1111 = getelementptr inbounds nuw %struct.WordEntry, ptr %1110, i32 0, i32 2
  %1112 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1111, i32 0, i32 4
  store ptr %1109, ptr %1112, align 8
  %1113 = load ptr, ptr %10, align 8
  %1114 = getelementptr inbounds nuw %struct.WordEntry, ptr %1113, i32 0, i32 2
  %1115 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1114, i32 0, i32 3
  store ptr null, ptr %1115, align 8
  %1116 = load ptr, ptr %25, align 8
  %1117 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1116, i32 0, i32 0
  %1118 = load ptr, ptr %1117, align 8
  %1119 = icmp ne ptr %1118, null
  br i1 %1119, label %1120, label %1127

1120:                                             ; preds = %1093
  %1121 = load ptr, ptr %10, align 8
  %1122 = getelementptr inbounds nuw %struct.WordEntry, ptr %1121, i32 0, i32 2
  %1123 = load ptr, ptr %25, align 8
  %1124 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1123, i32 0, i32 0
  %1125 = load ptr, ptr %1124, align 8
  %1126 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1125, i32 0, i32 3
  store ptr %1122, ptr %1126, align 8
  br label %1127

1127:                                             ; preds = %1120, %1093
  %1128 = load ptr, ptr %10, align 8
  %1129 = getelementptr inbounds nuw %struct.WordEntry, ptr %1128, i32 0, i32 2
  %1130 = load ptr, ptr %25, align 8
  %1131 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1130, i32 0, i32 0
  store ptr %1129, ptr %1131, align 8
  %1132 = load ptr, ptr %25, align 8
  %1133 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1132, i32 0, i32 1
  %1134 = load i32, ptr %1133, align 8
  %1135 = load ptr, ptr %25, align 8
  %1136 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1135, i32 0, i32 2
  %1137 = load i32, ptr %1136, align 4
  %1138 = add i32 %1137, 1
  %1139 = mul i32 %1138, 10
  %1140 = icmp uge i32 %1134, %1139
  br i1 %1140, label %1141, label %1403

1141:                                             ; preds = %1127
  %1142 = load ptr, ptr %10, align 8
  %1143 = getelementptr inbounds nuw %struct.WordEntry, ptr %1142, i32 0, i32 2
  %1144 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1143, i32 0, i32 0
  %1145 = load ptr, ptr %1144, align 8
  %1146 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1145, i32 0, i32 9
  %1147 = load i32, ptr %1146, align 4
  %1148 = icmp ne i32 %1147, 0
  br i1 %1148, label %1403, label %1149

1149:                                             ; preds = %1141
  br label %1150

1150:                                             ; preds = %1149
  %1151 = load ptr, ptr %10, align 8
  %1152 = getelementptr inbounds nuw %struct.WordEntry, ptr %1151, i32 0, i32 2
  %1153 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1152, i32 0, i32 0
  %1154 = load ptr, ptr %1153, align 8
  %1155 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1154, i32 0, i32 1
  %1156 = load i32, ptr %1155, align 8
  %1157 = zext i32 %1156 to i64
  %1158 = mul i64 16, %1157
  %1159 = mul i64 %1158, 2
  %1160 = call noalias ptr @malloc(i64 noundef %1159)
  store ptr %1160, ptr %30, align 8
  %1161 = load ptr, ptr %30, align 8
  %1162 = icmp ne ptr %1161, null
  br i1 %1162, label %1164, label %1163

1163:                                             ; preds = %1150
  call void @exit(i32 noundef -1)
  unreachable

1164:                                             ; preds = %1150
  %1165 = load ptr, ptr %30, align 8
  %1166 = load ptr, ptr %10, align 8
  %1167 = getelementptr inbounds nuw %struct.WordEntry, ptr %1166, i32 0, i32 2
  %1168 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1167, i32 0, i32 0
  %1169 = load ptr, ptr %1168, align 8
  %1170 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1169, i32 0, i32 1
  %1171 = load i32, ptr %1170, align 8
  %1172 = zext i32 %1171 to i64
  %1173 = mul i64 16, %1172
  %1174 = mul i64 %1173, 2
  call void @llvm.memset.p0.i64(ptr align 8 %1165, i8 0, i64 %1174, i1 false)
  %1175 = load ptr, ptr %10, align 8
  %1176 = getelementptr inbounds nuw %struct.WordEntry, ptr %1175, i32 0, i32 2
  %1177 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1176, i32 0, i32 0
  %1178 = load ptr, ptr %1177, align 8
  %1179 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1178, i32 0, i32 3
  %1180 = load i32, ptr %1179, align 8
  %1181 = load ptr, ptr %10, align 8
  %1182 = getelementptr inbounds nuw %struct.WordEntry, ptr %1181, i32 0, i32 2
  %1183 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1182, i32 0, i32 0
  %1184 = load ptr, ptr %1183, align 8
  %1185 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1184, i32 0, i32 2
  %1186 = load i32, ptr %1185, align 4
  %1187 = add i32 %1186, 1
  %1188 = lshr i32 %1180, %1187
  %1189 = load ptr, ptr %10, align 8
  %1190 = getelementptr inbounds nuw %struct.WordEntry, ptr %1189, i32 0, i32 2
  %1191 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1190, i32 0, i32 0
  %1192 = load ptr, ptr %1191, align 8
  %1193 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1192, i32 0, i32 3
  %1194 = load i32, ptr %1193, align 8
  %1195 = load ptr, ptr %10, align 8
  %1196 = getelementptr inbounds nuw %struct.WordEntry, ptr %1195, i32 0, i32 2
  %1197 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1196, i32 0, i32 0
  %1198 = load ptr, ptr %1197, align 8
  %1199 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1198, i32 0, i32 1
  %1200 = load i32, ptr %1199, align 8
  %1201 = mul i32 %1200, 2
  %1202 = sub i32 %1201, 1
  %1203 = and i32 %1194, %1202
  %1204 = icmp ne i32 %1203, 0
  %1205 = zext i1 %1204 to i64
  %1206 = select i1 %1204, i32 1, i32 0
  %1207 = add i32 %1188, %1206
  %1208 = load ptr, ptr %10, align 8
  %1209 = getelementptr inbounds nuw %struct.WordEntry, ptr %1208, i32 0, i32 2
  %1210 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1209, i32 0, i32 0
  %1211 = load ptr, ptr %1210, align 8
  %1212 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1211, i32 0, i32 6
  store i32 %1207, ptr %1212, align 8
  %1213 = load ptr, ptr %10, align 8
  %1214 = getelementptr inbounds nuw %struct.WordEntry, ptr %1213, i32 0, i32 2
  %1215 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1214, i32 0, i32 0
  %1216 = load ptr, ptr %1215, align 8
  %1217 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1216, i32 0, i32 7
  store i32 0, ptr %1217, align 4
  store i32 0, ptr %27, align 4
  br label %1218

1218:                                             ; preds = %1327, %1164
  %1219 = load i32, ptr %27, align 4
  %1220 = load ptr, ptr %10, align 8
  %1221 = getelementptr inbounds nuw %struct.WordEntry, ptr %1220, i32 0, i32 2
  %1222 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1221, i32 0, i32 0
  %1223 = load ptr, ptr %1222, align 8
  %1224 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1223, i32 0, i32 1
  %1225 = load i32, ptr %1224, align 8
  %1226 = icmp ult i32 %1219, %1225
  br i1 %1226, label %1227, label %1330

1227:                                             ; preds = %1218
  %1228 = load ptr, ptr %10, align 8
  %1229 = getelementptr inbounds nuw %struct.WordEntry, ptr %1228, i32 0, i32 2
  %1230 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1229, i32 0, i32 0
  %1231 = load ptr, ptr %1230, align 8
  %1232 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1231, i32 0, i32 0
  %1233 = load ptr, ptr %1232, align 8
  %1234 = load i32, ptr %27, align 4
  %1235 = zext i32 %1234 to i64
  %1236 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1233, i64 %1235
  %1237 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1236, i32 0, i32 0
  %1238 = load ptr, ptr %1237, align 8
  store ptr %1238, ptr %28, align 8
  br label %1239

1239:                                             ; preds = %1321, %1227
  %1240 = load ptr, ptr %28, align 8
  %1241 = icmp ne ptr %1240, null
  br i1 %1241, label %1242, label %1326

1242:                                             ; preds = %1239
  %1243 = load ptr, ptr %28, align 8
  %1244 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1243, i32 0, i32 4
  %1245 = load ptr, ptr %1244, align 8
  store ptr %1245, ptr %29, align 8
  br label %1246

1246:                                             ; preds = %1242
  %1247 = load ptr, ptr %28, align 8
  %1248 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1247, i32 0, i32 7
  %1249 = load i32, ptr %1248, align 4
  %1250 = load ptr, ptr %10, align 8
  %1251 = getelementptr inbounds nuw %struct.WordEntry, ptr %1250, i32 0, i32 2
  %1252 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1251, i32 0, i32 0
  %1253 = load ptr, ptr %1252, align 8
  %1254 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1253, i32 0, i32 1
  %1255 = load i32, ptr %1254, align 8
  %1256 = mul i32 %1255, 2
  %1257 = sub i32 %1256, 1
  %1258 = and i32 %1249, %1257
  store i32 %1258, ptr %26, align 4
  br label %1259

1259:                                             ; preds = %1246
  %1260 = load ptr, ptr %30, align 8
  %1261 = load i32, ptr %26, align 4
  %1262 = zext i32 %1261 to i64
  %1263 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1260, i64 %1262
  store ptr %1263, ptr %31, align 8
  %1264 = load ptr, ptr %31, align 8
  %1265 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1264, i32 0, i32 1
  %1266 = load i32, ptr %1265, align 8
  %1267 = add i32 %1266, 1
  store i32 %1267, ptr %1265, align 8
  %1268 = load ptr, ptr %10, align 8
  %1269 = getelementptr inbounds nuw %struct.WordEntry, ptr %1268, i32 0, i32 2
  %1270 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1269, i32 0, i32 0
  %1271 = load ptr, ptr %1270, align 8
  %1272 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1271, i32 0, i32 6
  %1273 = load i32, ptr %1272, align 8
  %1274 = icmp ugt i32 %1267, %1273
  br i1 %1274, label %1275, label %1303

1275:                                             ; preds = %1259
  %1276 = load ptr, ptr %10, align 8
  %1277 = getelementptr inbounds nuw %struct.WordEntry, ptr %1276, i32 0, i32 2
  %1278 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1277, i32 0, i32 0
  %1279 = load ptr, ptr %1278, align 8
  %1280 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1279, i32 0, i32 7
  %1281 = load i32, ptr %1280, align 4
  %1282 = add i32 %1281, 1
  store i32 %1282, ptr %1280, align 4
  %1283 = load ptr, ptr %31, align 8
  %1284 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1283, i32 0, i32 1
  %1285 = load i32, ptr %1284, align 8
  %1286 = load ptr, ptr %31, align 8
  %1287 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1286, i32 0, i32 2
  %1288 = load i32, ptr %1287, align 4
  %1289 = load ptr, ptr %10, align 8
  %1290 = getelementptr inbounds nuw %struct.WordEntry, ptr %1289, i32 0, i32 2
  %1291 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1290, i32 0, i32 0
  %1292 = load ptr, ptr %1291, align 8
  %1293 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1292, i32 0, i32 6
  %1294 = load i32, ptr %1293, align 8
  %1295 = mul i32 %1288, %1294
  %1296 = icmp ugt i32 %1285, %1295
  br i1 %1296, label %1297, label %1302

1297:                                             ; preds = %1275
  %1298 = load ptr, ptr %31, align 8
  %1299 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1298, i32 0, i32 2
  %1300 = load i32, ptr %1299, align 4
  %1301 = add i32 %1300, 1
  store i32 %1301, ptr %1299, align 4
  br label %1302

1302:                                             ; preds = %1297, %1275
  br label %1303

1303:                                             ; preds = %1302, %1259
  %1304 = load ptr, ptr %28, align 8
  %1305 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1304, i32 0, i32 3
  store ptr null, ptr %1305, align 8
  %1306 = load ptr, ptr %31, align 8
  %1307 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1306, i32 0, i32 0
  %1308 = load ptr, ptr %1307, align 8
  %1309 = load ptr, ptr %28, align 8
  %1310 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1309, i32 0, i32 4
  store ptr %1308, ptr %1310, align 8
  %1311 = load ptr, ptr %31, align 8
  %1312 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1311, i32 0, i32 0
  %1313 = load ptr, ptr %1312, align 8
  %1314 = icmp ne ptr %1313, null
  br i1 %1314, label %1315, label %1321

1315:                                             ; preds = %1303
  %1316 = load ptr, ptr %28, align 8
  %1317 = load ptr, ptr %31, align 8
  %1318 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1317, i32 0, i32 0
  %1319 = load ptr, ptr %1318, align 8
  %1320 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1319, i32 0, i32 3
  store ptr %1316, ptr %1320, align 8
  br label %1321

1321:                                             ; preds = %1315, %1303
  %1322 = load ptr, ptr %28, align 8
  %1323 = load ptr, ptr %31, align 8
  %1324 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1323, i32 0, i32 0
  store ptr %1322, ptr %1324, align 8
  %1325 = load ptr, ptr %29, align 8
  store ptr %1325, ptr %28, align 8
  br label %1239, !llvm.loop !13

1326:                                             ; preds = %1239
  br label %1327

1327:                                             ; preds = %1326
  %1328 = load i32, ptr %27, align 4
  %1329 = add i32 %1328, 1
  store i32 %1329, ptr %27, align 4
  br label %1218, !llvm.loop !14

1330:                                             ; preds = %1218
  %1331 = load ptr, ptr %10, align 8
  %1332 = getelementptr inbounds nuw %struct.WordEntry, ptr %1331, i32 0, i32 2
  %1333 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1332, i32 0, i32 0
  %1334 = load ptr, ptr %1333, align 8
  %1335 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1334, i32 0, i32 0
  %1336 = load ptr, ptr %1335, align 8
  call void @free(ptr noundef %1336)
  %1337 = load ptr, ptr %10, align 8
  %1338 = getelementptr inbounds nuw %struct.WordEntry, ptr %1337, i32 0, i32 2
  %1339 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1338, i32 0, i32 0
  %1340 = load ptr, ptr %1339, align 8
  %1341 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1340, i32 0, i32 1
  %1342 = load i32, ptr %1341, align 8
  %1343 = mul i32 %1342, 2
  store i32 %1343, ptr %1341, align 8
  %1344 = load ptr, ptr %10, align 8
  %1345 = getelementptr inbounds nuw %struct.WordEntry, ptr %1344, i32 0, i32 2
  %1346 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1345, i32 0, i32 0
  %1347 = load ptr, ptr %1346, align 8
  %1348 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1347, i32 0, i32 2
  %1349 = load i32, ptr %1348, align 4
  %1350 = add i32 %1349, 1
  store i32 %1350, ptr %1348, align 4
  %1351 = load ptr, ptr %30, align 8
  %1352 = load ptr, ptr %10, align 8
  %1353 = getelementptr inbounds nuw %struct.WordEntry, ptr %1352, i32 0, i32 2
  %1354 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1353, i32 0, i32 0
  %1355 = load ptr, ptr %1354, align 8
  %1356 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1355, i32 0, i32 0
  store ptr %1351, ptr %1356, align 8
  %1357 = load ptr, ptr %10, align 8
  %1358 = getelementptr inbounds nuw %struct.WordEntry, ptr %1357, i32 0, i32 2
  %1359 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1358, i32 0, i32 0
  %1360 = load ptr, ptr %1359, align 8
  %1361 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1360, i32 0, i32 7
  %1362 = load i32, ptr %1361, align 4
  %1363 = load ptr, ptr %10, align 8
  %1364 = getelementptr inbounds nuw %struct.WordEntry, ptr %1363, i32 0, i32 2
  %1365 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1364, i32 0, i32 0
  %1366 = load ptr, ptr %1365, align 8
  %1367 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1366, i32 0, i32 3
  %1368 = load i32, ptr %1367, align 8
  %1369 = lshr i32 %1368, 1
  %1370 = icmp ugt i32 %1362, %1369
  br i1 %1370, label %1371, label %1379

1371:                                             ; preds = %1330
  %1372 = load ptr, ptr %10, align 8
  %1373 = getelementptr inbounds nuw %struct.WordEntry, ptr %1372, i32 0, i32 2
  %1374 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1373, i32 0, i32 0
  %1375 = load ptr, ptr %1374, align 8
  %1376 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1375, i32 0, i32 8
  %1377 = load i32, ptr %1376, align 8
  %1378 = add i32 %1377, 1
  br label %1380

1379:                                             ; preds = %1330
  br label %1380

1380:                                             ; preds = %1379, %1371
  %1381 = phi i32 [ %1378, %1371 ], [ 0, %1379 ]
  %1382 = load ptr, ptr %10, align 8
  %1383 = getelementptr inbounds nuw %struct.WordEntry, ptr %1382, i32 0, i32 2
  %1384 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1383, i32 0, i32 0
  %1385 = load ptr, ptr %1384, align 8
  %1386 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1385, i32 0, i32 8
  store i32 %1381, ptr %1386, align 8
  %1387 = load ptr, ptr %10, align 8
  %1388 = getelementptr inbounds nuw %struct.WordEntry, ptr %1387, i32 0, i32 2
  %1389 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1388, i32 0, i32 0
  %1390 = load ptr, ptr %1389, align 8
  %1391 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1390, i32 0, i32 8
  %1392 = load i32, ptr %1391, align 8
  %1393 = icmp ugt i32 %1392, 1
  br i1 %1393, label %1394, label %1400

1394:                                             ; preds = %1380
  %1395 = load ptr, ptr %10, align 8
  %1396 = getelementptr inbounds nuw %struct.WordEntry, ptr %1395, i32 0, i32 2
  %1397 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1396, i32 0, i32 0
  %1398 = load ptr, ptr %1397, align 8
  %1399 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1398, i32 0, i32 9
  store i32 1, ptr %1399, align 4
  br label %1400

1400:                                             ; preds = %1394, %1380
  br label %1401

1401:                                             ; preds = %1400
  br label %1402

1402:                                             ; preds = %1401
  br label %1403

1403:                                             ; preds = %1402, %1141, %1127
  br label %1404

1404:                                             ; preds = %1403
  br label %1405

1405:                                             ; preds = %1404
  br label %1406

1406:                                             ; preds = %1405
  br label %1407

1407:                                             ; preds = %1406
  br label %1408

1408:                                             ; preds = %1407
  br label %1409

1409:                                             ; preds = %1408, %543
  br label %1410

1410:                                             ; preds = %1409, %54
  %1411 = call ptr @strtok_r(ptr noundef null, ptr noundef @.str.1, ptr noundef %8)
  store ptr %1411, ptr %9, align 8
  br label %51, !llvm.loop !15

1412:                                             ; preds = %51
  %1413 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %1413)
  call void @llvm.memset.p0.i64(ptr align 16 %32, i8 0, i64 256, i1 false)
  store i32 0, ptr %33, align 4
  %1414 = load ptr, ptr %6, align 8
  store ptr %1414, ptr %34, align 8
  %1415 = load ptr, ptr %6, align 8
  %1416 = icmp ne ptr %1415, null
  br i1 %1416, label %1417, label %1422

1417:                                             ; preds = %1412
  %1418 = load ptr, ptr %6, align 8
  %1419 = getelementptr inbounds nuw %struct.WordEntry, ptr %1418, i32 0, i32 2
  %1420 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1419, i32 0, i32 2
  %1421 = load ptr, ptr %1420, align 8
  br label %1423

1422:                                             ; preds = %1412
  br label %1423

1423:                                             ; preds = %1422, %1417
  %1424 = phi ptr [ %1421, %1417 ], [ null, %1422 ]
  store ptr %1424, ptr %35, align 8
  br label %1425

1425:                                             ; preds = %1455, %1423
  %1426 = load ptr, ptr %34, align 8
  %1427 = icmp ne ptr %1426, null
  br i1 %1427, label %1428, label %1457

1428:                                             ; preds = %1425
  %1429 = load ptr, ptr %34, align 8
  %1430 = getelementptr inbounds nuw %struct.WordEntry, ptr %1429, i32 0, i32 1
  %1431 = load i32, ptr %1430, align 8
  %1432 = load i32, ptr %33, align 4
  %1433 = icmp sgt i32 %1431, %1432
  br i1 %1433, label %1434, label %1444

1434:                                             ; preds = %1428
  %1435 = load ptr, ptr %34, align 8
  %1436 = getelementptr inbounds nuw %struct.WordEntry, ptr %1435, i32 0, i32 1
  %1437 = load i32, ptr %1436, align 8
  store i32 %1437, ptr %33, align 4
  %1438 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 0
  %1439 = load ptr, ptr %34, align 8
  %1440 = getelementptr inbounds nuw %struct.WordEntry, ptr %1439, i32 0, i32 0
  %1441 = load ptr, ptr %1440, align 8
  %1442 = call ptr @strncpy(ptr noundef %1438, ptr noundef %1441, i64 noundef 255)
  %1443 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 255
  store i8 0, ptr %1443, align 1
  br label %1444

1444:                                             ; preds = %1434, %1428
  br label %1445

1445:                                             ; preds = %1444
  %1446 = load ptr, ptr %35, align 8
  store ptr %1446, ptr %34, align 8
  %1447 = load ptr, ptr %35, align 8
  %1448 = icmp ne ptr %1447, null
  br i1 %1448, label %1449, label %1454

1449:                                             ; preds = %1445
  %1450 = load ptr, ptr %35, align 8
  %1451 = getelementptr inbounds nuw %struct.WordEntry, ptr %1450, i32 0, i32 2
  %1452 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1451, i32 0, i32 2
  %1453 = load ptr, ptr %1452, align 8
  br label %1455

1454:                                             ; preds = %1445
  br label %1455

1455:                                             ; preds = %1454, %1449
  %1456 = phi ptr [ %1453, %1449 ], [ null, %1454 ]
  store ptr %1456, ptr %35, align 8
  br label %1425, !llvm.loop !16

1457:                                             ; preds = %1425
  %1458 = load ptr, ptr %6, align 8
  %1459 = icmp ne ptr %1458, null
  br i1 %1459, label %1460, label %1467

1460:                                             ; preds = %1457
  %1461 = load ptr, ptr %6, align 8
  %1462 = getelementptr inbounds nuw %struct.WordEntry, ptr %1461, i32 0, i32 2
  %1463 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1462, i32 0, i32 0
  %1464 = load ptr, ptr %1463, align 8
  %1465 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1464, i32 0, i32 3
  %1466 = load i32, ptr %1465, align 8
  br label %1468

1467:                                             ; preds = %1457
  br label %1468

1468:                                             ; preds = %1467, %1460
  %1469 = phi i32 [ %1466, %1460 ], [ 0, %1467 ]
  store i32 %1469, ptr %36, align 4
  %1470 = getelementptr inbounds [256 x i8], ptr %32, i64 0, i64 0
  %1471 = call i32 @Helper_checksum_string(ptr noundef %1470)
  store i32 %1471, ptr %37, align 4
  %1472 = load i32, ptr %33, align 4
  %1473 = load i32, ptr %37, align 4
  %1474 = add i32 %1472, %1473
  %1475 = load i32, ptr %36, align 4
  %1476 = add i32 %1474, %1475
  %1477 = load ptr, ptr %5, align 8
  %1478 = getelementptr inbounds nuw %struct.WordsData, ptr %1477, i32 0, i32 4
  %1479 = load i32, ptr %1478, align 8
  %1480 = add i32 %1479, %1476
  store i32 %1480, ptr %1478, align 8
  %1481 = load ptr, ptr %6, align 8
  store ptr %1481, ptr %34, align 8
  %1482 = load ptr, ptr %6, align 8
  %1483 = icmp ne ptr %1482, null
  br i1 %1483, label %1484, label %1489

1484:                                             ; preds = %1468
  %1485 = load ptr, ptr %6, align 8
  %1486 = getelementptr inbounds nuw %struct.WordEntry, ptr %1485, i32 0, i32 2
  %1487 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1486, i32 0, i32 2
  %1488 = load ptr, ptr %1487, align 8
  br label %1490

1489:                                             ; preds = %1468
  br label %1490

1490:                                             ; preds = %1489, %1484
  %1491 = phi ptr [ %1488, %1484 ], [ null, %1489 ]
  store ptr %1491, ptr %35, align 8
  br label %1492

1492:                                             ; preds = %1680, %1490
  %1493 = load ptr, ptr %34, align 8
  %1494 = icmp ne ptr %1493, null
  br i1 %1494, label %1495, label %1682

1495:                                             ; preds = %1492
  br label %1496

1496:                                             ; preds = %1495
  %1497 = load ptr, ptr %34, align 8
  %1498 = getelementptr inbounds nuw %struct.WordEntry, ptr %1497, i32 0, i32 2
  store ptr %1498, ptr %38, align 8
  %1499 = load ptr, ptr %38, align 8
  %1500 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1499, i32 0, i32 1
  %1501 = load ptr, ptr %1500, align 8
  %1502 = icmp eq ptr %1501, null
  br i1 %1502, label %1503, label %1519

1503:                                             ; preds = %1496
  %1504 = load ptr, ptr %38, align 8
  %1505 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1504, i32 0, i32 2
  %1506 = load ptr, ptr %1505, align 8
  %1507 = icmp eq ptr %1506, null
  br i1 %1507, label %1508, label %1519

1508:                                             ; preds = %1503
  %1509 = load ptr, ptr %6, align 8
  %1510 = getelementptr inbounds nuw %struct.WordEntry, ptr %1509, i32 0, i32 2
  %1511 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1510, i32 0, i32 0
  %1512 = load ptr, ptr %1511, align 8
  %1513 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1512, i32 0, i32 0
  %1514 = load ptr, ptr %1513, align 8
  call void @free(ptr noundef %1514)
  %1515 = load ptr, ptr %6, align 8
  %1516 = getelementptr inbounds nuw %struct.WordEntry, ptr %1515, i32 0, i32 2
  %1517 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1516, i32 0, i32 0
  %1518 = load ptr, ptr %1517, align 8
  call void @free(ptr noundef %1518)
  store ptr null, ptr %6, align 8
  br label %1664

1519:                                             ; preds = %1503, %1496
  %1520 = load ptr, ptr %38, align 8
  %1521 = load ptr, ptr %6, align 8
  %1522 = getelementptr inbounds nuw %struct.WordEntry, ptr %1521, i32 0, i32 2
  %1523 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1522, i32 0, i32 0
  %1524 = load ptr, ptr %1523, align 8
  %1525 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1524, i32 0, i32 4
  %1526 = load ptr, ptr %1525, align 8
  %1527 = icmp eq ptr %1520, %1526
  br i1 %1527, label %1528, label %1544

1528:                                             ; preds = %1519
  %1529 = load ptr, ptr %38, align 8
  %1530 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1529, i32 0, i32 1
  %1531 = load ptr, ptr %1530, align 8
  %1532 = load ptr, ptr %6, align 8
  %1533 = getelementptr inbounds nuw %struct.WordEntry, ptr %1532, i32 0, i32 2
  %1534 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1533, i32 0, i32 0
  %1535 = load ptr, ptr %1534, align 8
  %1536 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1535, i32 0, i32 5
  %1537 = load i64, ptr %1536, align 8
  %1538 = getelementptr inbounds i8, ptr %1531, i64 %1537
  %1539 = load ptr, ptr %6, align 8
  %1540 = getelementptr inbounds nuw %struct.WordEntry, ptr %1539, i32 0, i32 2
  %1541 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1540, i32 0, i32 0
  %1542 = load ptr, ptr %1541, align 8
  %1543 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1542, i32 0, i32 4
  store ptr %1538, ptr %1543, align 8
  br label %1544

1544:                                             ; preds = %1528, %1519
  %1545 = load ptr, ptr %38, align 8
  %1546 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1545, i32 0, i32 1
  %1547 = load ptr, ptr %1546, align 8
  %1548 = icmp ne ptr %1547, null
  br i1 %1548, label %1549, label %1564

1549:                                             ; preds = %1544
  %1550 = load ptr, ptr %38, align 8
  %1551 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1550, i32 0, i32 2
  %1552 = load ptr, ptr %1551, align 8
  %1553 = load ptr, ptr %38, align 8
  %1554 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1553, i32 0, i32 1
  %1555 = load ptr, ptr %1554, align 8
  %1556 = load ptr, ptr %6, align 8
  %1557 = getelementptr inbounds nuw %struct.WordEntry, ptr %1556, i32 0, i32 2
  %1558 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1557, i32 0, i32 0
  %1559 = load ptr, ptr %1558, align 8
  %1560 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1559, i32 0, i32 5
  %1561 = load i64, ptr %1560, align 8
  %1562 = getelementptr inbounds i8, ptr %1555, i64 %1561
  %1563 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1562, i32 0, i32 2
  store ptr %1552, ptr %1563, align 8
  br label %1570

1564:                                             ; preds = %1544
  br label %1565

1565:                                             ; preds = %1564
  %1566 = load ptr, ptr %38, align 8
  %1567 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1566, i32 0, i32 2
  %1568 = load ptr, ptr %1567, align 8
  store ptr %1568, ptr %6, align 8
  br label %1569

1569:                                             ; preds = %1565
  br label %1570

1570:                                             ; preds = %1569, %1549
  %1571 = load ptr, ptr %38, align 8
  %1572 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1571, i32 0, i32 2
  %1573 = load ptr, ptr %1572, align 8
  %1574 = icmp ne ptr %1573, null
  br i1 %1574, label %1575, label %1590

1575:                                             ; preds = %1570
  %1576 = load ptr, ptr %38, align 8
  %1577 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1576, i32 0, i32 1
  %1578 = load ptr, ptr %1577, align 8
  %1579 = load ptr, ptr %38, align 8
  %1580 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1579, i32 0, i32 2
  %1581 = load ptr, ptr %1580, align 8
  %1582 = load ptr, ptr %6, align 8
  %1583 = getelementptr inbounds nuw %struct.WordEntry, ptr %1582, i32 0, i32 2
  %1584 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1583, i32 0, i32 0
  %1585 = load ptr, ptr %1584, align 8
  %1586 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1585, i32 0, i32 5
  %1587 = load i64, ptr %1586, align 8
  %1588 = getelementptr inbounds i8, ptr %1581, i64 %1587
  %1589 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1588, i32 0, i32 1
  store ptr %1578, ptr %1589, align 8
  br label %1590

1590:                                             ; preds = %1575, %1570
  br label %1591

1591:                                             ; preds = %1590
  %1592 = load ptr, ptr %38, align 8
  %1593 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1592, i32 0, i32 7
  %1594 = load i32, ptr %1593, align 4
  %1595 = load ptr, ptr %6, align 8
  %1596 = getelementptr inbounds nuw %struct.WordEntry, ptr %1595, i32 0, i32 2
  %1597 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1596, i32 0, i32 0
  %1598 = load ptr, ptr %1597, align 8
  %1599 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1598, i32 0, i32 1
  %1600 = load i32, ptr %1599, align 8
  %1601 = sub i32 %1600, 1
  %1602 = and i32 %1594, %1601
  store i32 %1602, ptr %39, align 4
  br label %1603

1603:                                             ; preds = %1591
  br label %1604

1604:                                             ; preds = %1603
  %1605 = load ptr, ptr %6, align 8
  %1606 = getelementptr inbounds nuw %struct.WordEntry, ptr %1605, i32 0, i32 2
  %1607 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1606, i32 0, i32 0
  %1608 = load ptr, ptr %1607, align 8
  %1609 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1608, i32 0, i32 0
  %1610 = load ptr, ptr %1609, align 8
  %1611 = load i32, ptr %39, align 4
  %1612 = zext i32 %1611 to i64
  %1613 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1610, i64 %1612
  store ptr %1613, ptr %40, align 8
  %1614 = load ptr, ptr %40, align 8
  %1615 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1614, i32 0, i32 1
  %1616 = load i32, ptr %1615, align 8
  %1617 = add i32 %1616, -1
  store i32 %1617, ptr %1615, align 8
  %1618 = load ptr, ptr %40, align 8
  %1619 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1618, i32 0, i32 0
  %1620 = load ptr, ptr %1619, align 8
  %1621 = load ptr, ptr %38, align 8
  %1622 = icmp eq ptr %1620, %1621
  br i1 %1622, label %1623, label %1629

1623:                                             ; preds = %1604
  %1624 = load ptr, ptr %38, align 8
  %1625 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1624, i32 0, i32 4
  %1626 = load ptr, ptr %1625, align 8
  %1627 = load ptr, ptr %40, align 8
  %1628 = getelementptr inbounds nuw %struct.UT_hash_bucket, ptr %1627, i32 0, i32 0
  store ptr %1626, ptr %1628, align 8
  br label %1629

1629:                                             ; preds = %1623, %1604
  %1630 = load ptr, ptr %38, align 8
  %1631 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1630, i32 0, i32 3
  %1632 = load ptr, ptr %1631, align 8
  %1633 = icmp ne ptr %1632, null
  br i1 %1633, label %1634, label %1642

1634:                                             ; preds = %1629
  %1635 = load ptr, ptr %38, align 8
  %1636 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1635, i32 0, i32 4
  %1637 = load ptr, ptr %1636, align 8
  %1638 = load ptr, ptr %38, align 8
  %1639 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1638, i32 0, i32 3
  %1640 = load ptr, ptr %1639, align 8
  %1641 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1640, i32 0, i32 4
  store ptr %1637, ptr %1641, align 8
  br label %1642

1642:                                             ; preds = %1634, %1629
  %1643 = load ptr, ptr %38, align 8
  %1644 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1643, i32 0, i32 4
  %1645 = load ptr, ptr %1644, align 8
  %1646 = icmp ne ptr %1645, null
  br i1 %1646, label %1647, label %1655

1647:                                             ; preds = %1642
  %1648 = load ptr, ptr %38, align 8
  %1649 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1648, i32 0, i32 3
  %1650 = load ptr, ptr %1649, align 8
  %1651 = load ptr, ptr %38, align 8
  %1652 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1651, i32 0, i32 4
  %1653 = load ptr, ptr %1652, align 8
  %1654 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1653, i32 0, i32 3
  store ptr %1650, ptr %1654, align 8
  br label %1655

1655:                                             ; preds = %1647, %1642
  br label %1656

1656:                                             ; preds = %1655
  %1657 = load ptr, ptr %6, align 8
  %1658 = getelementptr inbounds nuw %struct.WordEntry, ptr %1657, i32 0, i32 2
  %1659 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1658, i32 0, i32 0
  %1660 = load ptr, ptr %1659, align 8
  %1661 = getelementptr inbounds nuw %struct.UT_hash_table, ptr %1660, i32 0, i32 3
  %1662 = load i32, ptr %1661, align 8
  %1663 = add i32 %1662, -1
  store i32 %1663, ptr %1661, align 8
  br label %1664

1664:                                             ; preds = %1656, %1508
  br label %1665

1665:                                             ; preds = %1664
  %1666 = load ptr, ptr %34, align 8
  %1667 = getelementptr inbounds nuw %struct.WordEntry, ptr %1666, i32 0, i32 0
  %1668 = load ptr, ptr %1667, align 8
  call void @free(ptr noundef %1668)
  %1669 = load ptr, ptr %34, align 8
  call void @free(ptr noundef %1669)
  br label %1670

1670:                                             ; preds = %1665
  %1671 = load ptr, ptr %35, align 8
  store ptr %1671, ptr %34, align 8
  %1672 = load ptr, ptr %35, align 8
  %1673 = icmp ne ptr %1672, null
  br i1 %1673, label %1674, label %1679

1674:                                             ; preds = %1670
  %1675 = load ptr, ptr %35, align 8
  %1676 = getelementptr inbounds nuw %struct.WordEntry, ptr %1675, i32 0, i32 2
  %1677 = getelementptr inbounds nuw %struct.UT_hash_handle, ptr %1676, i32 0, i32 2
  %1678 = load ptr, ptr %1677, align 8
  br label %1680

1679:                                             ; preds = %1670
  br label %1680

1680:                                             ; preds = %1679, %1674
  %1681 = phi ptr [ %1678, %1674 ], [ null, %1679 ]
  store ptr %1681, ptr %35, align 8
  br label %1492, !llvm.loop !17

1682:                                             ; preds = %1492
  ret void
}

declare noalias ptr @strdup(ptr noundef)

declare ptr @strtok_r(ptr noundef, ptr noundef, ptr noundef)

declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef)

declare void @exit(i32 noundef)

declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg)

declare ptr @strncpy(ptr noundef, ptr noundef, i64 noundef)

declare i32 @Helper_checksum_string(ptr noundef)

define dso_local i32 @Words_checksum(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.WordsData, ptr %7, i32 0, i32 4
  %9 = load i32, ptr %8, align 8
  ret i32 %9
}

define dso_local void @Words_cleanup(ptr noundef %0) {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.Benchmark, ptr %4, i32 0, i32 11
  %6 = load ptr, ptr %5, align 8
  store ptr %6, ptr %3, align 8
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds nuw %struct.WordsData, ptr %7, i32 0, i32 2
  %9 = load ptr, ptr %8, align 8
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %17

11:                                               ; preds = %1
  %12 = load ptr, ptr %3, align 8
  %13 = getelementptr inbounds nuw %struct.WordsData, ptr %12, i32 0, i32 2
  %14 = load ptr, ptr %13, align 8
  call void @free(ptr noundef %14)
  %15 = load ptr, ptr %3, align 8
  %16 = getelementptr inbounds nuw %struct.WordsData, ptr %15, i32 0, i32 2
  store ptr null, ptr %16, align 8
  br label %17

17:                                               ; preds = %11, %1
  %18 = load ptr, ptr %3, align 8
  %19 = getelementptr inbounds nuw %struct.WordsData, ptr %18, i32 0, i32 3
  store i64 0, ptr %19, align 8
  ret void
}

define dso_local ptr @Words_create() {
  %1 = alloca ptr, align 8
  %2 = alloca ptr, align 8
  %3 = call ptr @Benchmark_create(ptr noundef @.str.2)
  store ptr %3, ptr %1, align 8
  %4 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 40)
  store ptr %4, ptr %2, align 8
  %5 = load ptr, ptr %2, align 8
  call void @WordsData_init(ptr noundef %5)
  %6 = load ptr, ptr %2, align 8
  %7 = load ptr, ptr %1, align 8
  %8 = getelementptr inbounds nuw %struct.Benchmark, ptr %7, i32 0, i32 11
  store ptr %6, ptr %8, align 8
  %9 = load ptr, ptr %1, align 8
  %10 = getelementptr inbounds nuw %struct.Benchmark, ptr %9, i32 0, i32 3
  store ptr @Words_prepare, ptr %10, align 8
  %11 = load ptr, ptr %1, align 8
  %12 = getelementptr inbounds nuw %struct.Benchmark, ptr %11, i32 0, i32 4
  store ptr @Words_run, ptr %12, align 8
  %13 = load ptr, ptr %1, align 8
  %14 = getelementptr inbounds nuw %struct.Benchmark, ptr %13, i32 0, i32 7
  store ptr @Words_checksum, ptr %14, align 8
  %15 = load ptr, ptr %1, align 8
  %16 = getelementptr inbounds nuw %struct.Benchmark, ptr %15, i32 0, i32 10
  store ptr @Words_cleanup, ptr %16, align 8
  %17 = load ptr, ptr %1, align 8
  ret ptr %17
}

declare ptr @Benchmark_create(ptr noundef)

declare noalias ptr @calloc(i64 noundef, i64 noundef)

define internal void @WordsData_init(ptr noundef %0) {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %3 = call i64 @Helper_config_i64(ptr noundef @.str.2, ptr noundef @.str.3)
  %4 = load ptr, ptr %2, align 8
  %5 = getelementptr inbounds nuw %struct.WordsData, ptr %4, i32 0, i32 0
  store i64 %3, ptr %5, align 8
  %6 = call i64 @Helper_config_i64(ptr noundef @.str.2, ptr noundef @.str.4)
  %7 = load ptr, ptr %2, align 8
  %8 = getelementptr inbounds nuw %struct.WordsData, ptr %7, i32 0, i32 1
  store i64 %6, ptr %8, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds nuw %struct.WordsData, ptr %9, i32 0, i32 2
  store ptr null, ptr %10, align 8
  %11 = load ptr, ptr %2, align 8
  %12 = getelementptr inbounds nuw %struct.WordsData, ptr %11, i32 0, i32 3
  store i64 0, ptr %12, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.WordsData, ptr %13, i32 0, i32 4
  store i32 0, ptr %14, align 8
  ret void
}

declare i64 @Helper_config_i64(ptr noundef, ptr noundef)


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
